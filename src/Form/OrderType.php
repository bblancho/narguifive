<?php

namespace App\Form;

use App\Entity\Product\Adresse;
use App\Entity\Product\Transporteur;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;

use Symfony\Component\OptionsResolver\OptionsResolver;

class OrderType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $user = $options['user']; 

        $builder
        ->add('adresse', EntityType::class, [
            'class' => Adresse::class,
            'label' => false,
            "required" => true,
            "choices"  => $user->getAdresses(), // On affiche seulement les adresses du current user
            'multiple' => false, // Bouton radio
            'expanded' => true, // Bouton radio
        ])
        ->add('transporteur', EntityType::class, [
            'class' => Transporteur::class,
            'label' => "Choisissrez un mode de livraison",
            "required" => true,
            'multiple' => false, // Bouton radio
            'expanded' => true, // Bouton radio
        ])
        ->add('submit', SubmitType::class, [
            'label' => "Valider ma commande",
            "attr"  => [
                'class' => "btn btn-success btn-block"
            ]
        ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
           "user" => array(),
        ]);
    }
}
