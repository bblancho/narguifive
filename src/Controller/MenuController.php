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

        // dd($categories) ;
        return $this->render('_menu/_menu.html.twig', [
            'categories' => $categories ,
        ]);
    }

    /**
     * @Route("/categorie/{slug}", name="menu_categorie")
     */
    public function categorie($slug): Response
    {
        $categorie = $this->category->findOneBySlug($slug);

        return $this->render('home/category.html.twig',[
            'categorie' => $categorie,
            'sousCategory' => '',
        ]);
    }

    /**
     * @Route("/categorie/{slug}/{sous_menu}", name="menu_sous_categorie")
     */
    public function sousCategorie($slug,$sous_menu): Response
    {
        $categorie    = $this->category->findOneBySlug($slug);
        $sousCategory = $this->sousCategory->findOneBySlug($sous_menu);

        if( $categorie && $sousCategory ) {
            return $this->render('home/category.html.twig',[
                'sousCategory' => $sousCategory,
                'categorie' => '',
            ]);
        }
        
    }

}
