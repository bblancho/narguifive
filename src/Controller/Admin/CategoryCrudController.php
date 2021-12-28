<?php

namespace App\Controller\Admin;

use App\Entity\Product\Category;
use App\Controller\Admin\Field\VichImageField;
use Vich\UploaderBundle\Form\Type\VichFileType;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use Vich\UploaderBundle\Form\Type\VichImageType;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class CategoryCrudController extends AbstractCrudController
{
    private $params;

    public function __construct(ParameterBagInterface $params)
    {
        $this->params = $params;
    }

    public static function getEntityFqcn(): string
    {
        return Category::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('nom'),
            TextField::new('Titre'),
            SlugField::new('slug')->setTargetFieldName('nom'),
            TextareaField::new('content'),
            ImageField::new('image', 'photo')
                ->setBasePath( $this->getParameter('app.path.category_images') )
                ->setUploadDir( 'public/assets/images/categories' )
                ->setRequired(false) ,
            Field::new('imageFile')->setFormType(VichImageType::class),
            
        ];
    }

    public function configureActions(Actions $actions): Actions
    {
       return $actions
            ->reorder(Crud::PAGE_INDEX, [Action::DETAIL, Action::DELETE, Action::EDIT])
        ;
    }

}
