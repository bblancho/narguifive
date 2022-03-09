<?php

namespace App\Form;

use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom', TextType::class,  [
                'label' => "Nom",
                'attr' => [
                    'placeholder' => 'Votre Nom *',
                ],
                'required' => true,
            ])
            ->add('prenom', TextType::class,  [
                'label' => "Prénom",
                'attr' => [
                    'placeholder' => 'Votre Prénom *',
                ],
                'required' => true,
            ])
            ->add('sujet', TextType::class,  [
                'label' => "Objet du message",
                'attr' => [
                    'placeholder' => 'Sujet du message',
                ],
                'required' => true,
            ])
            ->add('email', EmailType::class,  [
                'label' => "Email",
                'attr' => [
                    'placeholder' => 'email',
                ],
                'required' => true,
            ])
            ->add('content', TextareaType::class, [
                'label' => "Votre message",
                'attr'  => [
                    'placeholder' => "En quoi pouvous-nous vous aider ?",
                    'rows'=> 5,
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
