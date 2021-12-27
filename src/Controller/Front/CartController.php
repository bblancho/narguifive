<?php

namespace App\Controller\Front;

use App\Service\Carte\CarteService;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CartController extends AbstractController
{
    /**
     * @Route("/mon-panier", name="cart_index")
     */
    public function panier( CarteService $cartService ): Response
    {
        $panierData = $cartService->getFullCarte();
        $total = $cartService->getTotal();

        return $this->render('cart/panier.html.twig', [
            'panierData' => $panierData,
            'total'      => $total
        ]);
    }

    /**
     * @Route("/panier/ajout/{id}", name="cart_add")
     */
    public function add(int $id, CarteService $cartService ): Response
    {
        $cartService->add($id);

        return $this->redirectToRoute('cart_index') ;
    }

    /**
     * @Route("/panier/decrease/{id}", name="cart_decrease")
     */
    public function decrease(int $id, CarteService $cartService ): Response
    {
        $cartService->decrease($id);

        return $this->redirectToRoute('cart_index') ;
    }

    /**
     * @Route("/panier/supprimer/{id}", name="cart_delete")
     */
    public function delete(int $id, CarteService $cartService): Response
    {
        $cartService->delete($id);

        return $this->redirectToRoute('cart_index') ;
    }

    /**
     * @Route("/panier/vider", name="cart_remove")
     */
    public function remove( CarteService $cartService ): Response
    {
        $cartService->remove();

        return $this->redirectToRoute('cart_index') ;
    }
    

}
