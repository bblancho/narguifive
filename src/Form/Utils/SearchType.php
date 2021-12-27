<?php

namespace App\Form\Utils;

use App\Service\Search;
use App\Entity\Product\Category;
use App\Entity\Product\SousCategory;
use App\Repository\CategoryRepository;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\ChoiceList\ChoiceList;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

class SearchType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('string', TextType::class, [
                'label' => "Rechercher un produit",
                'required' => false,
                'attr' => [
                    'placeholder' => "Votre recherche...."
                ]
            ])
            ->add('categories', EntityType::class, [
                'class' => Category::class,
                'label' => "Choisissrez une catégorie",
                "required" => false,
                'choice_label' => function (Category $cat) {
                    return $cat->getNom();
                },
                'attr' => [
                    'class' => 'form-control w-max-140',
                    'placeholder' => 'Phone',
                ]
            ])
            ->add('souscategory', EntityType::class, [
                'class' => SousCategory::class,
                'label' => "Choisissrez une sous-catégorie",
                "required" => false,
                'multiple' => true,
                'expanded' => true,
                'attr' => [
                    'class' => '',
                ]
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Search::class,
            'method' => 'GET',
            'csrf_protection' => false,
        ]);
    }

    public function getBlockPrefix()
    {
        return "";
    }
}
