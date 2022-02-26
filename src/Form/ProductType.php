<?php

namespace App\Form;

use App\Form\MarqueType;
use App\Entity\Product\Product;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\MoneyType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class ProductType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom', TextType::class)
            ->add('intro', TextType::class)
            ->add('content',  TextareaType::class, [
                'attr' => ['class' => 'btn btn-default pull-right'],
            ])
            // ->add('image')
            ->add('price', MoneyType::class, [
                // 'divisor' => 100,
                // 'attr' => ['class' => '']
            ])
            ->add('priceHT', MoneyType::class, [
                // 'divisor' => 100,
                // 'attr' => ['class' => '']
            ])
            // ->add('promotion')
            // ->add('nouveaute')
            // ->add('taille', TextType::class)
            // ->add('vase', TextType::class)
            // ->add('tuyau', TextType::class)
            // ->add('fixation', TextType::class)
            // ->add('autre', TextType::class)
            ->add('publie', CheckboxType::class,[
                'required' => false,
                'value' => 1,
            ])
            // ->add('isBest'BooleanType::class,[
            //     'attr' => ['class' => ''],
            // ])
            // ->add('gramme',NumberType::class )
            // ->add('en_stock'BooleanType::class,[
            //     'attr' => ['class' => ''],
            // ])
            // ->add('quantite')
            // ->add('category')
            // ->add('sousCategory')
            // ->add('color')
            // ->add('marque', MarqueType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Product::class,
        ]);
    }
}
