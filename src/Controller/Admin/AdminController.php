<?php

namespace App\Controller\Admin;

use App\Form\ProductType;
use PHPUnit\Util\Exception;
use App\Entity\Product\Product;
use App\Repository\MarqueRepository;
use App\Repository\ProductRepository;
use App\Repository\CategoryRepository;
use Doctrine\Persistence\ManagerRegistry;
use App\Repository\SousCategoryRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdminController extends AbstractController
{
    public function __construct(ManagerRegistry $dotrine,MarqueRepository $marqueRepository, ProductRepository $productRepository, 
        CategoryRepository $categoryRepository, SousCategoryRepository $sousCategoryRepository, SluggerInterface $slugger)
    {
        $this->dotrine = $dotrine ;
        $this->productRepository = $productRepository ;
        $this->categoryRepository = $categoryRepository ;
        $this->sousCategoryRepository = $sousCategoryRepository;
        $this->marqueRepository = $marqueRepository;
        $this->slugger = $slugger ;
   
    }
    
    #[Route('/admin', name: 'admin', methods: ['GET'])]
    public function index(Request $request, PaginatorInterface $paginator): Response
    {
        $produits = $this->productRepository->findAll();

        // Paginate the results of the query
        $pagination = $paginator->paginate(
            $produits, // Doctrine Query, not results
            $request->query->getInt('page', 1), /** page number */
            6 // limit per page
        );

        return $this->render('admin/index.html.twig', [
            'pagination' => $pagination,
            'produits'   => $produits, 
        ]);
    }

    #[Route('/admin/gestion', name: 'admin_gestion', methods: ['GET'])]
    public function admin(Request $request, PaginatorInterface $paginator): Response
    {
        $categories  = $this->categoryRepository->findAll() ;

        return $this->render('admin/admin.html.twig', [
            'categories'   => $categories, 
        ]);
    }

    #[Route('/admin/produit/categorie/{id}', name: 'admin_categorie', methods: ['GET'])]
    public function productsByCategory(Request $request, PaginatorInterface $paginator, $id = 2 ): Response
    {
        $categorie  = $this->categoryRepository->find($id) ;
  
        if (!$categorie) {
            $this->addFlash('error', "Aucune catégorie trouvée.");
            $this->redirectToRoute('admin_gestion') ;
        }
        
        // nos produits
        $nos_produits   = $categorie->getProducts() ;
        $total      = $this->productRepository->countProductsByCategory( $categorie->getId() ) ;
        $limit      = 15 ;
        $mypage     = (int)$request->get("page", 1) ;
        $limit      = (int)$request->get("limit", 3) ;

        // Paginate the results of the query
        $produits = $paginator->paginate(
            $nos_produits, // Doctrine Query, not results
            $mypage, /** page number */
            $limit// limit per page
        );

        return $this->render('admin/admin_categorie.html.twig', [
            'produits'   => $produits, 
            'total' => $total,
            'categorie' => $categorie,
            'mypage' => $mypage,
            'limit' => $limit,
        ]);
    }

    #[Route('/admin/produit/edit/{id}', name: 'admin_produit_edit', methods: ['POST', 'GET'])]
    /**
     *
     * @param Request $request
     * @param integer|null $id
     * @return Response
     */
    public function update(Request $request, int $id = null): Response
    {
        $produit = new product();

        if ($id && $id > 0) {
            $produit = $this->productRepository->find($id);
        }

        $form = $this->createForm(ProductType::class, $produit);
        
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            
            $em = $this->doctrine->getManager();

            // Création d'un nouveau produit
            if ($id == 0) {
                $em->persist($produit);
                $this->addFlash('success', 'le produit a bien été créé.');
            }

            $em->flush();

            return $this->redirectToRoute('admin');
        }

        return $this->renderForm('admin/product/product.html.twig', [
            'produit' => $produit,
            'form' => $form
        ]);
    }

    #[Route('/admin/produit/delete/{id}', name: 'admin_produit_delete', methods: ['GET', 'POST'])]
    /**
     *
     * @param Produit $produit
     * @return Response
     */
    public function deleteProduit(Product $produit = null, ManagerRegistry $doctrine): Response
    {
        try {
            $em = $doctrine->getManager() ;
            $em->remove($produit) ;
            $em->flush();

        } catch (Exception $e) {
            $this->addFlash('danger', $e);

            return $this->redirectToRoute('admin_agence_index');
        }

        $this->addFlash('success', 'Suppression effectuée.');
        
        return $this->redirectToRoute('admin');
    }
}
