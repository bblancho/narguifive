<?php

namespace App\Controller\Admin;

use App\Entity\Product\SousCategory;
use EasyCorp\Bundle\EasyAdminBundle\Field\SlugField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class SousCategoryCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return SousCategory::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('nom'),
            SlugField::new('slug')->setTargetFieldName('nom')->hideOnForm(),
            TextareaField::new('content'),
            AssociationField::new('category') ,
        ];
    }

}
