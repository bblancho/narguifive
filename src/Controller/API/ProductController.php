<?php

namespace App\Controller\API;

use App\Service\Carte\CarteService;
use App\Service\Search;
use App\Form\Utils\SearchType;
use App\Entity\Product\Product;
use App\Entity\Product\SousCategory;
use App\Repository\MarqueRepository;
use App\Repository\ProductRepository;
use App\Repository\CategoryRepository;
use Doctrine\Persistence\ManagerRegistry;
use App\Repository\SousCategoryRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ProductController extends AbstractController
{


    public function __construct()
    {

    }

    /**
     * @Route("/api/product/{id}/modal", name="app_product_modal", methods={"GET"})
     */
    public function index(Product $product, CarteService $carteService): Response
    {
        // Ajout du produit dans le panier
        $carteService->add($product->getId());

        //Retourne le code html du modal avec les informations du produit
        return $this->json([
            'modal' => $this->renderView('modal/modal_panier.html.twig', ['product' => $product])
        ]);
    }




}
