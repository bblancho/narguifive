<?php

namespace App\Form\User;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;

class ChangePasswordType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom', EmailType::class, [
                'disabled' => true,
            ])
            ->add('prenom', null, [
                'disabled' => true,
            ])
            ->add('email', EmailType::class, [
                'disabled' => true,
            ])
            ->add('old_password', PasswordType::class, [
                'label'  => "Mot de passe actuel",
                'mapped' => false ,
                'attr' => [
                    'placeholder' => 'Veuillez saisir votre mot de passe actuel.',
                    'autocomplete' => 'off',
                ]
            ])
            ->add('new_password', RepeatedType::class, [
                'type' => PasswordType::class,
                'mapped' => false,
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
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
