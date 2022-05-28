<?php

namespace App\Controller\Stripe;

use Stripe\Stripe;
use Stripe\Checkout\Session;
use App\Entity\Product\Order;
use App\Entity\Product\Product;
use App\Service\Carte\CarteService;
use App\Service\Mail\MailjetService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class StripePaymentController extends AbstractController
{
    /**
     * @Route("/commmande/create-session/{reference}", name="stripe_create_session")
     */
    public function index(EntityManagerInterface $manager, CarteService $panier, $reference): Response
    {
        $YOUR_DOMAIN = 'http://127.0.0.1:8000';
        $products_for_stripe = [];

        $order = $manager->getRepository(Order::class)->findOneByReference($reference);
        // dd( $order->getOrderDetails()->getValues() ) ;

        if (!$order) {
            $response = new JsonResponse(['error' => 'order']);
        }

        foreach ($order->getOrderDetails()->getValues() as $product) {

            $product_objet =  $manager->getRepository(Product::class)->findOneByNom( $product->getProduct() ) ;

            $products_for_stripe[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'product_data' => [
                        'name' =>  $product->getProduct(),
                        'description' => $product_objet->getContent(),
                        'images' => [ $product_objet->getImage() ]
                    ],
                    'unit_amount' => ( $product->getPrice() * 100 ),
                ],
                'quantity' => $product->getQantity()
            ];
            // dd( $product_objet ) ;
        }

        // On ajoute les infos du transporteur
            $products_for_stripe[] = [
                'price_data' => [
                    'currency' => 'eur',
                    'product_data' => [
                        'name' =>  $order->getTranspoteurNom(),
                        'images' => [ $YOUR_DOMAIN ]
                    ],
                    'unit_amount' => ( $order->getTransporteurPrix() ),
                ],
                'quantity' => 1
            ];

        // dd( $products_for_stripe ) ;

        Stripe::setApiKey('sk_test_51JuHVaFIjVLoJVyMOCsgKdBp0LSSvVoATe1LGFjPUMVhDF1jmN4V8L2mqnSScI4wIPGAVJ6bRfBLJOtwN5BBZsCh00TijxHp7l');

        $checkout_session = Session::create([
            'customer_email' => $this->getUser()->getEmail(), // utile pour la page checkout
            'payment_method_types' => [
                'card',
            ],
            'line_items' => $products_for_stripe,
            'mode' => 'payment',
            'success_url' => $YOUR_DOMAIN . '/commande/merci/{CHECKOUT_SESSION_ID}',
            'cancel_url' => $YOUR_DOMAIN . '/commande/erreur/{CHECKOUT_SESSION_ID}',
        ]);

        $order->setStripeSessionId($checkout_session->id);

        $manager->flush();

        $response = new JsonResponse(['id' => $checkout_session->id]);
        return $response;
    }

    /**
     * @Route("/commande/merci/{stripeSessionId}", name="stripe_merci")
     */

    public function merci(EntityManagerInterface $manager, $stripeSessionId, CarteService $panier){
        $order = $manager->getRepository(Order::class)->findOneByStripeSessionId($stripeSessionId);
        // dd($order) ;

        if( !$order || $order->getUser() != $this->getUser() ){
            return $this->redirectToRoute('home');
        }

        if( !$order->getIsPaid() && $order->getStatut() == 1 ){ // 1 -> non validée

            // On vide le panier
                $panier->remove() ;

            // Modification du statut de la commande
                $order->setIsPaid(1) ;
                $order->setStatut(2) ; // payée
                $manager->flush() ;

            // Envoi de l'email
                $content ="Bonjour ".$order->getUser()->getFullName()."<br/> Merci pour votre commande.  <br/>";
                $mail = new MailjetService();
                $mail->send( $order->getUser()->getEmail(), $order->getUser()->getNom(), 'Votre commande NarguiFive est bien validée.', $content) ;
        }

        return $this->render( 'order/order_valide.html.twig' , [
            'order' => $order,
        ]);
    }

    /**
     * @Route("/commande/erreur/{stripeSessionId}", name="stripe_erreur")
     */

    public function erreurPaiement(EntityManagerInterface $manager, $stripeSessionId){
        $order = $manager->getRepository(Order::class)->findOneByStripeSessionId($stripeSessionId);
        // dd($order) ;

        $order->setStatut(1) ; // payée
        $manager->flush() ;

        if( !$order || $order->getUser() != $this->getUser() ){
            return $this->redirectToRoute('home');
        }

        return $this->render( 'order/order_erreur.html.twig' , [
            'order' => $order,
        ]);
    }
}
