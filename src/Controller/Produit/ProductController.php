<?php

namespace App\Controller\Produit;

use App\Service\Search;
use App\Form\Utils\SearchType;
use App\Entity\Product\SousCategory;
use App\Repository\ProductRepository;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\SousCategoryRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ProductController extends AbstractController
{
    private $manager;
    private $repoProduct;
    private $repoCat;
    private $repoSousCat;

    public function __construct(EntityManagerInterface $manager, ProductRepository $repoProduct, CategoryRepository $cat, SousCategoryRepository $sousCat)
    {
        $this->manager = $manager;
        $this->repoProduct = $repoProduct;
        $this->repoCat = $cat;
        $this->repoSousCat = $sousCat;
    }

    /**
     * @Route("/chichas/nos-produits/", name="products")
     */
    public function index(Request $request, PaginatorInterface $paginator): Response
    {
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

        return $this->render('product/index.html.twig', [
            'produits' => $produits,
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
}
