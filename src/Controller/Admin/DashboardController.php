<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Entity\Admin\Header;
use App\Entity\Product\Order;
use App\Entity\Product\Product;
use App\Entity\Product\Category;
use App\Entity\Product\SousCategory;
use App\Entity\Product\Transporteur;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;

class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
       // redirect to some CRUD controller
       $routeBuilder = $this->get(AdminUrlGenerator::class);

       return $this->redirect($routeBuilder->setController(OrderCrudController::class)->generateUrl());
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Nargui Five Chicha');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linktoDashboard('Dashboard', 'fa fa-home');
        yield MenuItem::linkToCrud('Utilisateurs', 'fas fa-user', User::class);
        yield MenuItem::linkToCrud('Commande', 'fas fa-shopping-cart', Order::class);
        yield MenuItem::linkToCrud('Produits', 'fas fa-tag', Product::class);
        yield MenuItem::linkToCrud('Catégories', 'fas fa-list', Category::class);
        yield MenuItem::linkToCrud('Sous catégories', 'fas fa-list', SousCategory::class);
        yield MenuItem::linkToCrud('Transporteur', 'fas fa-truck', Transporteur::class);
        yield MenuItem::linkToCrud('Header', 'fas fa-desktop', Header::class);
        
        
        // yield MenuItem::linkToCrud('Commandes', 'fas fa-list', Commande::class) ;
    }
}
