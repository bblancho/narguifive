<?php

namespace App\Service\Carte;

use Symfony\Component\HttpFoundation\RequestStack;
use App\Repository\ProductRepository;


class CarteService
{
    protected $session ;
    protected $produitRepo;

    public function __construct( RequestStack $requestStack,  ProductRepository $produitRepo){
        $this->session = $requestStack;
        $this->produitRepo = $produitRepo;
    }

    public function get(){
        $session = $this->session
                    ->getSession() // recup session current
                    ->get('panier');

        return $session;
    }

    public function add(int $id): void
    {
        $session = $this->session->getSession(); // recup session current
        $panier  = $session->get('panier', [] ); // the second argument is the value returned when the attribute doesn't exist

        if( !empty( $panier[$id] ) ){ // is ID présent dans le tableau
            $panier[$id]++ ;
        } else {
            $panier[$id] = 1;
        }

        $session->set('panier', $panier) ; // on rajoute la valeur dans le tableau de session
    }

    public function decrease(int $id){
        $session = $this->session->getSession();
        $panier  = $session->get('panier', []) ;

        if( $panier[$id] > 1 ){
            $panier[$id]-- ;
        } else {
            unset( $panier[$id] ) ;
        }

        $session->set('panier', $panier) ;
    }

    public function delete(int $id): void
    {
        $session = $this->session->getSession(); // recup session current
        $panier  = $session->get('panier', [] ); // the second argument is the value returned when the attribute doesn't exist

        if( !empty( $panier[$id] ) ){ // is ID présent dans le tableau
            unset( $panier[$id] ) ;
        }

        $session->set('panier', $panier) ; // on rajoute la valeur dans le tableau de session
    }

    public function remove(): void
    {
        $session = $this->session
                    ->getSession() // recup session current
                    ->remove('panier', [] ) ; // the second argument is the value returned when the attribute doesn't exist
    }

    public function getFullCarte(): array
    {
        $session = $this->session->getSession(); // recup session current
        $panier  = $session->get('panier', [] ); // the second argument is the value returned when the attribute doesn't exist

        $panierData = [];

        foreach( $panier as $id => $qte ){

            $produit = $this->produitRepo->find($id) ;
            
            if( !$produit ) {
                $this->delete($id) ;
                continue ;
            }

            $panierData[] = [
                'produit' => $produit,
                'quantity'=>  $qte,
            ] ;
        }

        return $panierData;
    }

    public function getTotal(): float
    {
        $total = 0;

        $panierData = $this->getFullCarte();

        foreach( $panierData as $produit ){
            $totalProduit = $produit['produit']->getPrice() * $produit['quantity'] ;
            $total += $totalProduit;
        }

        return $total ;
    }

}