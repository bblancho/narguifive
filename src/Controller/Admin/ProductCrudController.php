<?php

namespace App\Controller\Admin;

use App\Entity\Product\Product;

use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
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
            SlugField::new('slug')->setTargetFieldName('nom')->onlyOnDetail(),
            TextareaField::new('content')->onlyOnDetail(),
            BooleanField::new('isBest',"A la une"),
            MoneyField::new('price')->setCurrency('EUR'),
            MoneyField::new('priceHT')->setCurrency('EUR') ,
            ImageField::new('image')
                ->setBasePath( $this->params->get('app.path.products_images') )
                ->setUploadDir("public/assets/images/products")
                ->setUploadedFileNamePattern('[randomhash].[extension]')
                ->setRequired(false),
            AssociationField::new('color')->autocomplete()->onlyOnDetail(),
            IntegerField::new('taille')->onlyOnDetail(),
            TextField::new('vase')->onlyOnDetail(),
            TextField::new('tuyau')->onlyOnDetail(),
            TextField::new('fixation')->onlyOnDetail(),
            TextField::new('autre')->onlyOnDetail(),
            BooleanField::new('promotion'),
            BooleanField::new('nouveaute'),
            AssociationField::new('category') ,
            AssociationField::new('sousCategory',"Sous catégorie")->onlyOnDetail() ,
            BooleanField::new('publie', "Publié"),
        ];
    }
}
