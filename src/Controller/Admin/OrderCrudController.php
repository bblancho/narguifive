<?php

namespace App\Controller\Admin;

use App\Entity\Product\Order;
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
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;

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

    public function configureActions(Actions $actions): Actions
    {
        $updatePreparation = Action::new('updatePreparation', 'Préparation en cours', 'fas fa-box-open')->linkToCrudAction('updatePreparation') ;
        $updateLivraison = Action::new('updateLivraison', 'Livraison en cours', 'fas fa-truck')->linkToCrudAction('updateLivraison') ;

        return $actions
            ->add('detail', $updatePreparation) // dans la vue détail on rajoute une action
            ->add('detail', $updateLivraison) 
            ->add(Crud::PAGE_INDEX, Action::DETAIL) // on configure la page d'accueil de /admin
        ;
    }

    public function updatePreparation(AdminContext $context) // création de page dans le back office
    {
        $order= $context->getEntity()->getInstance();
        $order->setStatut(3) ; // statut en cours de préparation

        $this->manager->flush() ;

        $this->addFlash('notice', "<span class='alert alert-info'><strong> La commande ".$order->getReference() ." est bien <u>en cours de préparation</u>. </strong></span>") ;

        $url = $this->adminUrlGenerator
            ->setController(OrderCrudController::class)
            ->setAction(ACTION::INDEX)  
            ->generateUrl() ;

        // Envoi de l'email
            $content ="Bonjour ".$order->getUser()->getFullName()."<br/> Votre commande vient de passer à l'état de en cours de préparation.  <br/>";
            $mail = new MailjetService();
            $mail->send( $order->getUser()->getEmail(), $order->getUser()->getNom(), 'Commande en cours préparation.', $content) ;

        return $this->redirect($url) ;
    }

    public function updateLivraison(AdminContext $context) // création de page dans le back office
    {
        $order= $context->getEntity()->getInstance();
        $order->setStatut(4) ; // statut en cours de préparation

        $this->manager->flush() ;

        $this->addFlash('notice', "<span class='alert alert-success'><strong> La commande ".$order->getReference() ." est bien <u> en cours de livraison </u>. </strong></span>") ;

        $url = $this->adminUrlGenerator
            ->setController(OrderCrudController::class)
            ->setAction(ACTION::INDEX)  
            ->generateUrl() ;

        // Envoi de l'email
            $content ="Bonjour ".$order->getUser()->getFullName()."<br/> Votre commande vient de passer à l'état de en cours de livraison.  <br/>";
            $mail = new MailjetService();
            $mail->send( $order->getUser()->getEmail(), $order->getUser()->getNom(), 'Commande en cours livraison.', $content) ;
            
        return $this->redirect($url) ;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud->setDefaultSort(['id' => "DESC"]) ;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            DateTimeField::new("createdAt", "Passé le")->setFormat('dd-MM-Y à HH:mm'), 
            TextField::new('user.getFullName',"Client"),
            TextEditorField::new('delivry', "Adresse de livraison")->onlyOnDetail(),
            MoneyField::new('total', 'Total produit')->setCurrency('EUR'),
            TextField::new('transpoteurNom',"Transporteur"),
            MoneyField::new('transporteurPrix', 'Frais de port')->setCurrency('EUR'),
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

}
