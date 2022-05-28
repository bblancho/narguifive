<?php

namespace App\Controller\Admin;

use App\Entity\Product\Order;
use App\Service\Mail\MailService;
use App\Service\Mail\MailjetService;
use Doctrine\ORM\EntityManagerInterface;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ArrayField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Context\AdminContext;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class OrderCrudController extends AbstractCrudController
{
    private $manager;
    private $adminUrlGenerator;

    public function __construct(EntityManagerInterface $manager, AdminUrlGenerator $adminUrlGenerator)
    {
        $this->manager = $manager;
        $this->adminUrlGenerator = $adminUrlGenerator;
    }
    
    public static function getEntityFqcn(): string
    {
        return Order::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            DateTimeField::new("createdAt", "Passé le")->setFormat('Y-MM-dd à HH:mm')->renderAsNativeWidget(), 
            TextField::new('user.getFullName',"Client"),
            TextEditorField::new('delivry', "Adresse de livraison")->onlyOnDetail(),
            MoneyField::new('total', 'Total produit')->setCurrency('EUR'),
            TextField::new('transpoteurNom',"Transporteur")->hideOnIndex(),
            MoneyField::new('transporteurPrix', 'Frais de port')->setCurrency('EUR')->hideOnIndex(),
            BooleanField::new('isPaid', "Payée"),
            ChoiceField::new('statut',"Statut de la livraison")->setChoices([
                "Non validée" => 1,
                "Payée" => 2,
                "En cours de préparation" => 3,
                "En cours de livraison" => 4,
                "Livrée" => 5,
                "Non valide" => 0
            ]) ,
            ArrayField::new('orderDetails', 'Produits achetés')->hideOnIndex(),
            
        ];
    }

    public function configureActions(Actions $actions): Actions
    {
        $updatePreparation = Action::new('updatePreparation', 'Préparation en cours', 'fas fa-box-open')->linkToCrudAction('updatePreparation') ;
        $updateLivraison = Action::new('updateLivraison', 'Livraison en cours', 'fas fa-truck')->linkToCrudAction('updateLivraison') ;

        return $actions
            ->add(Crud::PAGE_INDEX, Action::DETAIL) // on configure la page d'accueil de /admin
            ->add('detail', $updatePreparation)     // dans la vue détail on rajoute une action
            ->add('detail', $updateLivraison) 
        ;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud->setDefaultSort(['id' => "DESC"]) ;
    }

    public function updatePreparation(AdminContext $context, MailService $mailer) // création de page dans le back office
    {
        $order= $context->getEntity()->getInstance();
        $order->setStatut(3) ; // statut en cours de préparation

        $this->manager->flush() ;

        $this->addFlash('notice', "<span class='alert alert-info'><strong> La commande ".$order->getReference() ." est bien <u> en cours de préparation </u>. </strong></span>") ;

        $url = $this->adminUrlGenerator
            ->setController(OrderCrudController::class)
            ->setAction(ACTION::INDEX)  
            ->generateUrl() ;

        // Envoi de l'email
            $content ="Bonjour ".$order->getUser()->getFullName()."<br/> Votre commande vient de passer à l'état de en cours de préparation.  <br/>";
            
            // Envoi de l'email    
            $mailer->sendEmail( $order->getUser()->getEmail(), "Préparation de la commande",  $content ) ;

        return $this->redirect($url) ;
    }

    public function updateLivraison(AdminContext $context, MailService $mailer) // création de page dans le back office
    {
        $order= $context->getEntity()->getInstance();
        $order->setStatut(4) ; // statut en cours de livraison

        $this->manager->flush() ;

        $this->addFlash('notice', "<span class='alert alert-success'><strong> La commande ".$order->getReference() ." est bien <u> en cours de livraison </u>. </strong></span>") ;

        $url = $this->adminUrlGenerator
            ->setController(OrderCrudController::class)
            ->setAction(ACTION::INDEX)  
            ->generateUrl() ;

        // Envoi de l'email
            $content ="Bonjour ".$order->getUser()->getFullName()."<br/> Votre commande vient de passer à l'état de en cours de livraison.  <br/>";

            $mailer->sendEmail( $order->getUser()->getEmail(), "Commande en cours livraison",  $content ) ;
            
        return $this->redirect($url) ;
    }

}
