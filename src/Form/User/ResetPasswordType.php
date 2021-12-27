<?php

namespace App\Form\User;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;

class ResetPasswordType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
        ->add('new_password', RepeatedType::class, [
            'type' => PasswordType::class,
            'invalid_message' => 'Les mots de passe ne sont pas identiques.',
            'options' => ['attr' => ['class' => 'password-field']],
            'required' => true,
            'first_options'  => [
                'label' => 'Nouveau mot de passe: ',
                'attr' => [
                    'placeholder' => 'Veuillez saisir votre nouveau mot de passe',
                ]
            ],
            'second_options' => [
                'label' => 'Confirmer le nouveau mot de passe: ',
                'attr' => [
                    'placeholder' => 'Merci de confirmer le nouveau mot de passe',
                ]
            ],
            'attr' => ['autocomplete' => 'new-password'],
        ])
        ->add('submit', SubmitType::class, [
            'label' => "Mettre à jour mon mot de passe",
            'attr'  => [
                'class' => "btn btn-info btn-block"
            ]
        ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
