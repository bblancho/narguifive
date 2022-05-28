<?php

namespace App\Controller\Admin;

use App\Entity\Product\Transporteur;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\MoneyField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class TransporteurCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Transporteur::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('nom'),
            TextareaField::new('description'),
            MoneyField::new('price', 'Frais de port')->setCurrency('EUR'),
        ];
    }
}
