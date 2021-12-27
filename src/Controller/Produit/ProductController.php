<?php

namespace App\Controller\Produit;

use App\Service\Search;
use App\Form\Utils\SearchType;
use App\Entity\Product\SousCategory;
use App\Repository\ProductRepository;
use App\Repository\CategoryRepository;
use App\Repository\MarqueRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\SousCategoryRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;

class ProductController extends AbstractController
{
    private $manager;
    private $repoProduct;
    private $repoCat;
    private $repoSousCat;
    private $repoMarque;

    public function __construct(EntityManagerInterface $manager, ProductRepository $repoProduct, CategoryRepository $cat, SousCategoryRepository $sousCat, MarqueRepository $repoMarque)
    {
        $this->manager = $manager;
        $this->repoProduct = $repoProduct;
        $this->repoCat = $cat;
        $this->repoSousCat = $sousCat;
        $this->repoMarque=$repoMarque;
    }

    /**
     * @Route("/chichas/nos-produits/", name="products")
     */
    public function index(Request $request, PaginatorInterface $paginator): Response
    {

        
        $search = new Search();

        $form = $this->createForm(SearchType::class, $search) ;

        $form->handleRequest($request) ;
       
        
        $sousCats = $this->repoSousCat->findBy(array(),array(),$limit=4);
        $fabricants=$this->repoMarque->findAll();
        $from_fabs=array();
        foreach($fabricants as $fabricant){
            $prods=$this->repoProduct->findBy(array('marque'=>$fabricant));
            $from_fabs[$fabricant->getNom()]=$prods;
        }
      

        if($request->get("ajax")){
            $filter=$request->get("layered_manufacturer");
            $produits=$this->repoProduct->findBy(array('marque'=>$filter));
            $total=count($produits);
             // Paginate the results of the query
             $produits = $paginator->paginate(
                // Doctrine Query, not results
                $produits,
                // Define the page parameter
                $request->query->getInt('page', 1), // numéro de la page en cours
                // Items per page
                8
            );
          
           return new JsonResponse(['content'=> $this->renderView('product/product2.html.twig', compact('produits')), 'total'=>$total]);
        }







        if ( $form->isSubmitted() && $form->isValid() ) {

            $produits = $this->repoProduct->findBySearch($search);

            // Paginate the results of the query
            $produits = $paginator->paginate(
                // Doctrine Query, not results
                $produits,
                // Define the page parameter
                $request->query->getInt('page', 1), // numéro de la page en cours
                // Items per page
                10
            );

        } else {
            $produits = $this->repoProduct->findAll();
            $total= count($produits);

            // Paginate the results of the query
            $produits = $paginator->paginate(
                // Doctrine Query, not results
                $produits,
                // Define the page parameter
                $request->query->getInt('page', 1), // numéro de la page en cours
                // Items per page
                8
            );

            $produits_best = $this->repoProduct->findByIsBest(1);
        }

       
      
      

        return $this->render('product/index_2.html.twig', [
            'produits' => $produits,
            'sousCats' => $sousCats,
            'fabricants'=>$fabricants,
            'from_fabs'=>$from_fabs,
            'total'=>$total,
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/produit/{slug}/", name="product_show")
     */
    public function show($slug): Response
    {
        $produit = $this->repoProduct->findOneBySlug($slug);
        $produits_best = $this->repoProduct->findByIsBest(1);

        if (!$produit) {
            return $this->redirectToRoute('products');
        }

        return $this->render('product/product.html.twig', [
            'produit' => $produit,
            'produits_best'  => $produits_best,
        ]);
    }

    /**
     * /produits/chichas/chicha-classique
     * @Route("/produits/{$nomCategories}/{$souscategories}", name="products_all_category")
     */
    // public function productAllCategory($nomCategories, $souscategories): Response
    // {
    //     return $this->render('product/index.html.twig', [

    //     ]);
    // }

    /**
     * /produits/chichas/chicha-classique/celeste-3
     * @Route("/produits/{$nomCategories}/{$souscategories}/{$idProduit}", name="products_by_category")
     */
    // public function productByCategory($nomCategories, $souscategories, $idProduit): Response
    // {
    //     return $this->render('product/index.html.twig', [

    //     ]);
    // }
    
    
    public function AttributionSousCategory(): Response
    {
        $cats = $this->repoCat->findAll();
        $sous = $this->repoSousCat->findAll();
        $produits = $this->repoProduct ->findAll() ;

        foreach ($produits as $produit) {
            foreach ($sous as $s) {
                if ($produit->getCategory()->getNom() == $s->getNom()) {
                    $produit->setSousCategory($s);

                    $this->manager->persist($produit);
                }
            }
        }

        $this->manager->flush();

        return $this->redirectToRoute('products') ;
    }

     /**
     * @Route("/produits/{slug}", name="products_subcategory_show", methods="GET")
     */
    public function subcategory(Request $request, PaginatorInterface $paginator,$slug){
        
        $sousCats=$this->repoSousCat->findBy(array(),array(),$limit=4);
        $sousCat=$this->repoSousCat->findOneBy(array('slug'=>$slug));
        
       

        $search = new Search();

        $form = $this->createForm(SearchType::class, $search) ;

        $form->handleRequest($request) ;

        if ( $form->isSubmitted() && $form->isValid() ) {

            $produits = $this->repoProduct->findBySearch($search);

            // Paginate the results of the query
            $produits = $paginator->paginate(
                // Doctrine Query, not results
                $produits,
                // Define the page parameter
                $request->query->getInt('page', 1), // numéro de la page en cours
                // Items per page
                10
            );

        } else {
            $produits=$this->repoProduct->findBy(array('sousCategory'=>$sousCat));
            $produitsAll=$produits;
            // Paginate the results of the query
            $produits = $paginator->paginate(
                // Doctrine Query, not results
                $produits,
                // Define the page parameter
                $request->query->getInt('page', 1), // numéro de la page en cours
                // Items per page
                8
            );

            $produits_best = $this->repoProduct->findByIsBest(1);
        }

        return $this->render('product/sous_category.html.twig', [
            'produits' => $produits,
            'sousCats' => $sousCats,
            'sousCatActuel'=>$sousCat,
            'produitsAll'=>$produitsAll,
            'form' => $form->createView()
        ]);

    }

   
}
