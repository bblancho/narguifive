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

        $fields = [
            TextField::new('nom'),
            SlugField::new('slug')->setTargetFieldName('nom')->hideOnIndex(),
            AssociationField::new('category','Catégorie') ,
            AssociationField::new('sousCategory',"Sous-catégorie")->onlyOnForms() ,
            TextField::new('intro')->onlyOnForms()->setRequired(false),
            TextareaField::new('content','Description')->hideOnIndex(),
            BooleanField::new('en_stock', 'En stock'),
            IntegerField::new('quantite', 'Quantité'),
            MoneyField::new('price', 'Prix')->setCurrency('EUR'),
            AssociationField::new('marque',"Fabriquant")->onlyOnForms() ,
            BooleanField::new('isBest',"A la une")->hideOnIndex(),
            MoneyField::new('priceHT')->setCurrency('EUR')->onlyOnForms() ,

            AssociationField::new('color')->autocomplete()->onlyOnForms() ,
            IntegerField::new('taille')->onlyOnForms()->setRequired(false) ,
            TextField::new('vase')->onlyOnForms()->setRequired(false) ,
            TextField::new('tuyau')->onlyOnForms()->setRequired(false) ,
            TextField::new('fixation')->onlyOnForms()->setRequired(false) ,
            TextField::new('autre')->onlyOnForms()->setRequired(false) ,
            BooleanField::new('promotion')->onlyOnIndex() ,
            BooleanField::new('nouveaute')->setRequired(false) ,
            BooleanField::new('publie', "Publié") ,

            TextField::new('imageFile')->setFormType(VichImageType::class)->hideOnIndex(),
            ImageField::new('image', 'photo') // On affiche la mignature dans l'index
                ->setBasePath( $this->getParameter('products_images') )
                ->setRequired(false),
            CollectionField::new('pictures','Mignatures') // Les images du produit
                ->setEntryType(PictureType::class)
                ->setFormTypeOption('by_reference', false)
                ->setTemplatePath('admin/easyadmin.html.twig')
                
            ,
        ];

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
            ->setDefaultSort(['id' => 'DESC']) ;
    }
}
