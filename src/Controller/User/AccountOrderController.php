<?php

namespace App\Controller\User;

use Doctrine\ORM\EntityManagerInterface;
use App\Repository\OrderRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AccountOrderController extends AbstractController
{
    private $manager;
    private $orderRepo;

    public function __construct(EntityManagerInterface $manager, OrderRepository $orderRepo)
    {
        $this->orderRepo = $orderRepo ;
        $this->manager  = $manager ;
    }

    /**
     * @Route("/compte/mes-commandes", name="account_order")
     */
    public function index(): Response
    {
        $orders = $this->orderRepo->findSuccessOrders($this->getUser());

        return $this->render('account/orders.html.twig', [
            'orders' => $orders
        ]);
    }

     /**
     * @Route("/compte/mes-commandes/{reference}", name="account_order_show")
     */
    public function show($reference): Response
    {
        $order = $this->orderRepo->findOneByReference($reference);

        if( !$order || $order->getUser() != $this->getUser() ){
            return $this->redirectToRoute('home');
        }

        return $this->render('account/order_show.html.twig', [
            'order' => $order
        ]);
    }

}
