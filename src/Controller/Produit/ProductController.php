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
    private $repoCategory;
    private $repoMarque;
    private $sousCategoryRepo;

    public function __construct(EntityManagerInterface $manager, ProductRepository $repoProduct, CategoryRepository $repoCategory, SousCategoryRepository $sousCat, MarqueRepository $repoMarque)
    {
        $this->manager          = $manager;
        $this->repoProduct      = $repoProduct;
        $this->repoCategory     = $repoCategory;
        $this->sousCategoryRepo = $sousCat;
        $this->repoMarque       = $repoMarque;
    }

    /**
     * @Route("/chichas/nos-produits/", name="products")
     */
    public function index(Request $request, PaginatorInterface $paginator): Response
    {
        $limit=15;
        $mypage=(int)$request->get("page", 1);
        //dd($mypage);

        $filter=$request->get("layered_manufacturer"); 
        $disponibilite=$request->get("layered_quantity"); 
        $tri=$request->get("tri");
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

        $produits=$this->repoProduct->getPaginatedProducts($mypage,$limit, $filter, $tri, $disponibilite);
        $total=$this->repoProduct->getTotalProducts($filter,$disponibilite);
        $sousCats = $this->sousCategoryRepo->findBy(array(),array(),4);
        $fabricants=$this->repoMarque->findAll();
        $from_fabs=array();

        //Disponibilité
        $nbre_dispo=array();
        $nbre_dispo[0]=$this->repoProduct->getTotalProducts($filter,0);
        $nbre_dispo[1]=$this->repoProduct->getTotalProducts($filter,1);

        foreach($fabricants as $fabricant){
            $prods=$this->repoProduct->findBy(array('marque'=>$fabricant));
            $from_fabs[$fabricant->getNom()]=$prods;
        }
        
        if($request->get("ajax")){
            $filter=$request->get("layered_manufacturer");

            $fabs=$this->repoMarque->findBy(array('id'=>$filter));
            $actifs=array();
            $actif=array();
            foreach($fabs as $fab){
                $actif["id"]=$fab->getId();
                $actif["nom"]=$fab->getNom();
                array_push($actifs,$actif);
            }
      
            return new JsonResponse(['content'=> $this->renderView('product/liste_produits.html.twig', compact('produits','mypage','total','limit')), 'fabs'=>$actifs, 'total'=>$total, 'nbre_dispo'=>$nbre_dispo]);
        }

        return $this->render('product/index.html.twig', [
            'produits' => $produits,
            'sousCats' => $sousCats,
            'fabricants'=>$fabricants,
            'nbre_dispo'=>$nbre_dispo,
            'from_fabs'=>$from_fabs,
            'total'=>$total,
            'limit'=>$limit,
            'mypage'=>$mypage,
            'form' => $form->createView()
        ]);
    }

     /**
     * @Route("/produits/{slug}", name="products_subcategory_show", methods="GET")
     */
    public function subcategory(Request $request, PaginatorInterface $paginator,$slug)
    {
        $sousCats=$this->sousCategoryRepo->findBy(array(),array(), $limit=4);
        $sousCat=$this->sousCategoryRepo->findOneBy(array('slug'=>$slug));

        $limit=15;
        $mypage=(int)$request->get("page", 1);
        $tri=$request->get("tri");
       
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

        } 

        $produits=$this->repoProduct->getPaginatedProducts($mypage,$limit, null, $tri,null,$sousCat);
        $total=$this->repoProduct->getTotalProducts(null,null, $sousCat);

        if($request->get("ajax")){    
            return new JsonResponse(['content'=> $this->renderView('product/liste_produits.html.twig', compact('produits','mypage','total','limit')),  'total'=>$total]);
        }

        return $this->render('product/sous_category.html.twig', [
            'produits' => $produits,
            'sousCats' => $sousCats,
            'sousCatActuel'=>$sousCat,
            'total'=>$total,
            'mypage'=>$mypage,
            'limit'=>$limit,
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

        return $this->render('product/product_page.html.twig', [
            'produit' => $produit,
            'produits_best'  => $produits_best,
        ]);
    }

    /**
     * @Route("/categorie/{slug}", name="products_by_categorie")
     */
    public function productsByCategory(Request $request, PaginatorInterface $paginator,$slug): Response
    {
        $limit  = 15;
        $mypage = (int)$request->get("page", 1);
        $categorie  = $this->repoCategory->findOneBySlug($slug) ;

        $filter = $request->get("layered_manufacturer"); 
        $disponibilite = $request->get("layered_quantity"); 
        $tri = $request->get("tri");

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
                9
            );

        } else {
            $produits = $categorie->getProducts() ;
            $total= count($produits);

            // Paginate the results of the query
            $produits = $paginator->paginate(
                // Doctrine Query, not results
                $produits,
                // Define the page parameter
                $request->query->getInt('page', 1), // numéro de la page en cours
                // Items per page
                9
            );

            $produits_best = $this->repoProduct->findByIsBest(1);
        }

        $produits   = $categorie->getProducts() ;
        $sousCats   = $categorie->getSousCategory() ;

        $produits = $paginator->paginate(
            $produits, // Doctrine Query, not results
            $request->query->getInt('page', 1), /** page number */
            9 // limit per page
        );

        $total      = $this->repoCategory->getTotalProductsByCategory( $categorie->getId() );
        $fabricants = $this->repoMarque->findAll() ;
        $from_fabs  = array();
       
        //Disponibilité
        $nbre_dispo = array();
        $nbre_dispo[0]=$this->repoProduct->getTotalProducts($filter,0);
        $nbre_dispo[1]=$this->repoProduct->getTotalProducts($filter,1);

        foreach($fabricants as $fabricant){
            $prods = $this->repoProduct->findBy(array('marque'=>$fabricant) );
            $from_fabs[$fabricant->getNom()]=$prods;
        }
        
        if($request->get("ajax")){
            $filter=$request->get("layered_manufacturer");

            $fabs=$this->repoMarque->findBy(array('id'=>$filter));
            $actifs=array();
            $actif=array();
            foreach($fabs as $fab){
                $actif["id"]=$fab->getId();
                $actif["nom"]=$fab->getNom();
                array_push($actifs,$actif);
            }
            
            return new JsonResponse(['content'=> $this->renderView('product/liste_produits.html.twig', compact('produits','mypage','total','limit')), 'fabs'=>$actifs, 'total'=>$total, 'nbre_dispo'=>$nbre_dispo]);
        }

        return $this->render('product/category.html.twig', [
            'produits'  => $produits,
            'sousCats'  => $sousCats,
            'categorie' => $categorie,
            'fabricants'=>  $fabricants,
            'nbre_dispo'=>  $nbre_dispo,
            'from_fabs' =>  $from_fabs,
            'total'     =>  $total,
            'limit'     =>  $limit,
            'mypage'    =>  $mypage,
            'form'      => $form->createView()
        ]);
    }

    /**
     * @Route("/categorie/{slugCategory}/{slug}", name="products_by_sous_categorie")
     */
    public function sousCategorie($slugCategory,$slug): Response
    {
        $categorie    = $this->categoryRepo->findOneBySlug($slugCategory);
        $sousCategory = $this->sousCategoryRepo->findOneBySlug($slug);

        if( $categorie && $sousCategory ) {
            return $this->render('home/category.html.twig',[
                'sousCategory' => $sousCategory,
                'categorie' => '',
            ]);
        }
        
    }

    public function AttributionSousCategory(): Response
    {
        $cats = $this->categoryRepo->findAll();
        $sous = $this->sousCategoryRepo->findAll();
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
     * /produits/chichas/chicha-classique/celeste-3
     * @Route("/produits/{$nomCategories}/{$souscategories}/{$idProduit}", name="products_by_category")
     */
    // public function productByCategory($nomCategories, $souscategories, $idProduit): Response
    // {
    //     return $this->render('product/index.html.twig', [

    //     ]);
    // }


       /**
     * @Route("/product/{slug}", name="products_filter_show", methods="GET")
     */
    public function affichage_produit(Request $request, PaginatorInterface $paginator,$slug)
    {
        $produit = $this->repoProduct->findOneBySlug($slug);
        $produits_best = $this->repoProduct->findByIsBest(1);

        if (!$produit) {
            return $this->redirectToRoute('products');
        }

        return $this->render('product/product_page.html.twig', [
            'produit' => $produit,
            'produits_best'  => $produits_best,
        ]);
    }

}
