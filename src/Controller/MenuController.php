<?php

namespace App\Controller;

use App\Repository\CategoryRepository;
use App\Repository\SousCategoryRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class MenuController extends AbstractController
{
    private $category;
    private $sousCategory;

    public function __construct(CategoryRepository $category , SousCategoryRepository $sousCategory)
    {
        $this->category     = $category ;
        $this->sousCategory = $sousCategory ;
    }

    #[Route('/menu', name: 'menu')]
    public function index(): Response
    {
        $categories = $this->category->findAll();

        return $this->render('_menu/_menu.html.twig', [
            'categories' => $categories ,
        ]);
    }


}
