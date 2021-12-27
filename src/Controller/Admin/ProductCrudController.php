<?php

namespace App\Controller\Admin;

use App\Entity\Product\Product;

use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use Vich\UploaderBundle\Form\Type\VichImageType;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
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
        return [
            TextField::new('nom'),
            SlugField::new('slug')->setTargetFieldName('nom')->onlyOnForms(),
            TextareaField::new('content')->onlyOnForms(),
            AssociationField::new('category') ,
            AssociationField::new('sousCategory',"Sous catégorie")->onlyOnForms() ,
            BooleanField::new('isBest',"A la une"),
            BooleanField::new('nouveaute'),
            MoneyField::new('price')->setCurrency('EUR'),
            MoneyField::new('priceHT')->setCurrency('EUR') ,
            ImageField::new('image')
                ->setBasePath( $this->params->get('app.path.products_images') )
                ->setUploadDir("public/assets/images/products")
                ->setUploadedFileNamePattern('[randomhash].[extension]')
                ->setRequired(false),
            Field::new('imageFile')->setFormType(VichImageType::class),
            CollectionField::new('pictures','Les photos')->onlyOnForms(),
            AssociationField::new('color')->autocomplete()->onlyOnForms(),
            IntegerField::new('taille')->onlyOnForms(),
            TextField::new('vase')->onlyOnForms(),
            TextField::new('tuyau')->onlyOnForms(),
            TextField::new('fixation')->onlyOnForms(),
            TextField::new('autre')->onlyOnForms(),
            BooleanField::new('promotion')->onlyOnIndex(),
            BooleanField::new('nouveaute'),
            BooleanField::new('publie', "Publié"),
        ];
    }
}
