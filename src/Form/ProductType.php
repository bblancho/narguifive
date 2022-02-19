<?php

namespace App\Form;

use App\Entity\Product\Product;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProductType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom')
            ->add('content')
            ->add('slug')
            ->add('image')
            ->add('price')
            ->add('priceHT')
            ->add('promotion')
            ->add('nouveaute')
            ->add('taille')
            ->add('vase')
            ->add('tuyau')
            ->add('fixation')
            ->add('autre')
            ->add('publie')
            ->add('isBest')
            ->add('gramme')
            ->add('en_stock')
            ->add('quantite')
            // ->add('category')
            // ->add('sousCategory')
            ->add('color')
            // ->add('marque')
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Product::class,
        ]);
    }
}
