<?php

namespace App\Controller\Admin;

use App\Entity\Admin\Header;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextareaField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;

class HeaderCrudController extends AbstractCrudController
{
    private $params;

    public function __construct(ParameterBagInterface $params)
    {
        $this->params = $params;
    }

    public static function getEntityFqcn(): string
    {
        return Header::class;
    }


    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('title', "Titre"),
            TextareaField::new('content',"Description"),
            TextField::new('btnTitle', "Titre du bouton"),
            TextField::new('btnUrl', "Url de destination du bouton"),
            // ImageField::new('image')
            //     ->setBasePath( $this->params->get('header_images') )
            //     ->setUploadDir("public/assets/images/header")
            //     ->setUploadedFileNamePattern('[randomhash].[extension]')
            //     ->setRequired(false),
            TextField::new('imageFile')->setFormType(VichImageType::class)->hideOnIndex(),
            ImageField::new('image', 'photo') // On affiche la mignature dans l'index
                    ->setBasePath( $this->getParameter('header_images') )
                    ->setRequired(false)->onlyOnIndex(),
        ];
    }

}
