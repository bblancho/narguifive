<?php

namespace App\Controller\Produit;

use App\Form\OrderType;
use App\Entity\Product\Order;
use App\Service\Carte\CarteService;
use App\Entity\Product\OrderDetails;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class OrderController extends AbstractController
{
    private $manager;

    public function __construct(EntityManagerInterface $manager)
    {
        $this->manager = $manager;
    }

    /**
     * @Route("/commande", name="order")
     */
    public function index(CarteService $panier, Request $request): Response
    {
        if( !( $this->getUser()->getAdresses()->getValues() ) ){ // Si le user n'a pas ajouté une adresse de livraison
            return $this->redirectToRoute('adresse_compte_add');
        }

        $form = $this->createForm(OrderType::class, null, [
            'user' => $this->getUser(), // On envoie des données d'option à notre formulaire
        ]);

        return $this->render('order/index.html.twig',[
            'form' => $form->createView(),
            'panier' => $panier->getFullCarte()
        ]);
    }

    /**
     * @Route("/commande/recapitulatif", name="order_recap", methods={"POST"})
     */
    public function recap(CarteService $panier ,Request $request)
    {
        $form = $this->createForm(OrderType::class, null, [
            'user' => $this->getUser(), // On envoie des données d'option à notre formulaire
        ]);

        $form->handleRequest($request) ;

        if( $form->isSubmitted() && $form->isValid() ) {
            $date = new \DateTime();

            $transporteur     = $form->get('transporteur')->getData() ;
            $delivry          = $form->get('adresse')->getData() ;
            $delivry_content  = $delivry->getNom() ;
            $delivry_content .= '<br/>'.$delivry->getLastname().' '.$delivry->getPrenom() ;
            $delivry_content .= '<br/>'.$delivry->getPhone() ;

            if( $delivry->getSociete() ){
                $delivry_content .= '<br/>'.$delivry->getSociete() ;
            }

            $delivry_content .= '<br/>'.$delivry->getAdresse() ;
            $delivry_content .= '<br/>'.$delivry->getPostal().' '.$delivry->getVille() ;
            $delivry_content .= '<br/>'.$delivry->getPays() ;

            // Enregistrement de ma commande
                $order = new Order();

                $ref = $date->format('dmY').'-'.uniqid();
                $order->setReference($ref);
                $order->setUser( $this->getUser() ) ;
                $order->setCreatedAt($date) ;
                $order->setTranspoteurNom($transporteur->getNom()) ;
                $order->setTransporteurPrix($transporteur->getPrice()) ;
                $order->setDelivry($delivry_content) ;
                $order->setStatut(1) ; // Non validée car on a pas encore payé
                $order->setIsPaid(false) ;

            $this->manager->persist($order) ;
            // dd($order);

            // Enregistrement du détails de la commande
                foreach ($panier->getFullCarte() as $product){
                    $orderDetail = new OrderDetails() ;

                    $orderDetail->setMyOrder($order);
                    $orderDetail->setProduct( $product['produit']->getNom() ) ;
                    $orderDetail->setQantity( $product['quantity']) ;
                    $orderDetail->setPrice( $product['produit']->getPrice() ) ;
                    $orderDetail->setTotal( $product['produit']->getPrice() * $product['quantity'] ) ;

                    $this->manager->persist($orderDetail) ;
                }

            $this->manager->flush() ;

            return $this->render('order/recapOrder.html.twig',[
                'panier'       => $panier->getFullCarte(),
                'transporteur' => $transporteur,
                'delivry'      => $delivry,
                'reference'    => $order->getReference(),
            ]);
        }

        return $this->redirectToRoute('cart_index');
    }
}
