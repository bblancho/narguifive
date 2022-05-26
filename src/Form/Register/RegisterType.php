<?php

namespace App\Form\Register;

use App\Entity\User;
use App\Form\Utils\Choices;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;

class RegisterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom', null, [
                'label' => "Nom",
                'attr' => [
                    'class' => 'w-max-140',
                    'placeholder' => 'Nom',
                ],
                'required' => true,
            ])
            ->add('prenom', null, [
                'label' => "Prénom",
                'attr' => [
                    'class' => 'w-max-140',
                    'placeholder' => 'Prénom',
                ],
                'required' => true,
            ])
            ->add('sexe', ChoiceType::class, [
                'choices' => Choices::getchoices(User::SEXE),
                'label' => "Civilité",
                'attr' => [
                    'class' => 'w-max-140',
                    'placeholder' => 'Civilité',
                ],
                'required' => true,
            ])
            ->add('phone', TelType::class, [
                'label' => "Numéro de télèphone",
                'attr' => [
                    'placeholder' => 'Phone',
                    'class' => 'js-phone w-max-140',
                    'autocomplete' => 'off',
                ],
                'required' => true,
            ])
            ->add('email', EmailType::class,[
                'attr' => [
                    'class' => 'w-max-140',
                    'placeholder' => 'Votre email',
                ],
                'required' => true,
            ])
            ->add('adresse', null, [
                'label' => "Adresse",
                'attr' => [
                    'class' => 'w-max-140',
                    'placeholder' => 'Adresse',
                ],
                'required' => true,
            ])
            ->add('ville', null, [
                'label' => "Ville",
                'attr' => [
                    'class' => 'w-max-140',
                    'placeholder' => 'Ville',
                ],
                'required' => true,
            ])
            ->add('zipcode', null, [
                'label' => "Code postal",
                'attr' => [
                    'class' => 'w-max-140',
                    'placeholder' => 'Code postal',
                ],
                'required' => true,
            ])
            ->add('password', RepeatedType::class, [
                'type' => PasswordType::class,
                'invalid_message' => 'Les mots de passe ne sont pas identiques.',
                'options' => ['attr' => ['class' => 'password-field']],
                'required' => true,
                'first_options'  => [
                    'label' => 'Mot de passe: ',
                    'attr' => [
                        'placeholder' => 'Veuillez saisir votre mot de passe',
                    ]
                ],
                'second_options' => [
                    'label' => 'Confirmer le mot de passe: ',
                    'attr' => [
                        'placeholder' => 'Merci de confirmer votre mot de passe',
                    ]
                ],
                'attr' => ['autocomplete' => 'new-password'],
            ])
            ->add('termes', CheckboxType::class, [
                'mapped' => false,
                'label'  => "J'accepte de partager certaines de mes données de compte et de navigation, 
                            partenaire de Nargui Five afin de recevoir des publicités personnalisées.",
                'label_attr' => [
                    'class' => 'checkbox-inline',
                ],
                'required' => true,
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
