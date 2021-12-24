<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\CategoryRepository;

class MenuController extends AbstractController
{
    private $category;

    public function __construct(CategoryRepository $category )
    {
        $this->category = $category ;
    }

    #[Route('/menu', name: 'menu')]
    public function index(): Response
    {
        $categories = $this->category->findAll();

        // dd($categories) ;
        return $this->render('_menu/_menu.html.twig', [
            'categories' => $categories ,
        ]);
    }
}
