<?php

namespace App\Controller\Admin;

use App\Form\PictureType;

use App\Entity\Product\Product;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use Vich\UploaderBundle\Form\Type\VichImageType;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class ProductCrudController extends AbstractCrudController
{
    private $params;

    public function __construct(ParameterBagInterface $params)
    {
        $this->params = $params;
    }

    public static function getEntityFqcn(): string
    {
        return Product::class;
    }

    public function configureFields(string $pageName): iterable
    {
        $image = ImageField::new('image', 'photo')
                    ->setBasePath( $this->getParameter('app.path.products_images') )
                    ->setUploadDir( 'public/assets/images/produits' )
                    ->setRequired(false) ;

        $imageFile = TextField::new('imageFile')->setFormType(VichImageType::class)->onlyOnForms() ;

        $fields = [
            TextField::new('nom'),
            SlugField::new('slug')->setTargetFieldName('nom')->hideOnIndex(),
            TextareaField::new('content')->onlyOnForms(),
            BooleanField::new('en_stock', 'En stock'),
            IntegerField::new('quantite', 'Quantité'),
            AssociationField::new('category','Catégorie') ,
            AssociationField::new('sousCategory',"Sous-catégorie")->onlyOnForms() ,
            AssociationField::new('marque',"Fabriquant")->onlyOnForms() ,
            BooleanField::new('isBest',"A la une"),
            BooleanField::new('nouveaute'),
            MoneyField::new('price')->setCurrency('EUR'),
            MoneyField::new('priceHT')->setCurrency('EUR') ,

            // CollectionField::new('pictures','Les photos')
            //     ->setEntryType(PictureType::class)
            //     ->setFormTypeOption('by_reference', false)
            //     ->onlyOnForms()
            // ,

            AssociationField::new('color')->autocomplete()->onlyOnForms(),
            IntegerField::new('taille')->onlyOnForms()->setRequired(false),
            TextField::new('vase')->onlyOnForms()->setRequired(false),
            TextField::new('tuyau')->onlyOnForms()->setRequired(false),
            TextField::new('fixation')->onlyOnForms()->setRequired(false),
            TextField::new('autre')->onlyOnForms()->setRequired(false),
            BooleanField::new('promotion')->onlyOnIndex(),
            BooleanField::new('nouveaute'),
            BooleanField::new('publie', "Publié"),
        ];

        
        // if ($pageName == Crud::PAGE_INDEX ||  $pageName == Crud::PAGE_DETAIL) {
            $fields[] = $image ; 
        // } else {
            $fields[] = $imageFile ; 
        // }

        return $fields ;
    }

    public function configureActions(Actions $actions): Actions
    {
       return $actions
            ->add(Crud::PAGE_INDEX, Action::DETAIL)
            ->reorder(Crud::PAGE_INDEX, [Action::DETAIL, Action::DELETE, Action::EDIT])
        ;
    }

    public function configureCrud(Crud $crud): Crud
    {
        return $crud
            ->setDefaultSort(['id' => 'ASC']) ;
    }
}
