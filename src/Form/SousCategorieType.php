<?php

namespace App\Form;

use App\Entity\Product\Category;
use Doctrine\ORM\Mapping\Entity;
use App\Entity\Product\SousCategory;
use Symfony\Component\Form\AbstractType;
use FOS\CKEditorBundle\Form\Type\CKEditorType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class SousCategorieType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom',TextType::class)
            ->add('content', CKEditorType::class, [
                'config_name' => 'my_config',
                'config'      => array('uiColor' => '#ffffff'),
            ])
            ->add('category', EntityType::class, [
                'expanded' => false,
                'class' => Category::class,
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => SousCategory::class,
        ]);
    }
}
