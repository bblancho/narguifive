<?php

namespace App\Controller\Admin;

use PHPUnit\Util\Exception;
use App\Entity\Product\Product;
use App\Entity\Product\Category;
use App\Repository\ProductRepository;
use App\Repository\CategoryRepository;
use Doctrine\Persistence\ManagerRegistry;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdminController extends AbstractController
{
    public function __construct(ManagerRegistry $doctrine, ProductRepository $productRepository, CategoryRepository $categoryRepository, )
    {
        $this->doctrine = $doctrine ;
        $this->productRepository = $productRepository ;
        $this->categoryRepository = $categoryRepository ;
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
    public function admin(PaginatorInterface $paginator): Response
    {
        $categories  = $this->categoryRepository->findAll() ;

        return $this->render('admin/admin.html.twig', [
            'categories'   => $categories, 
        ]);
    }

}
