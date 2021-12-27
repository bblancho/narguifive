<?php

namespace App\Form\User;

use App\Entity\Product\Adresse;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\Country;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\CountryType;
use Symfony\Component\Form\Extension\Core\Type\TelType;

class AdresseFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('nom', null, [
                'label'  => "Quel nom souhaitez-vous à votre adresse ?",
                'attr' => [
                    'placeholder' => 'Nommez votre adresse',
                    'autocomplete' => 'off',
                ],
                'required' => true,
            ])
            ->add('lastname', null, [
                'label'  => "Votre nom",
                'attr' => [
                    'placeholder' => 'Entrez votre nom',
                ],
                'required' => true,
            ])
            ->add('prenom', null, [
                'label'  => "Votre prénom",
                'attr' => [
                    'placeholder' => 'Entrez votre prénom',
                ],
                'required' => true,
            ])
            ->add('phone', TelType::class, [
                'label' => "Votre numéro de télèphone",
                'attr' => [
                    'placeholder' => 'numéro de télèphone',
                ],
                'required' => true,
            ])
            ->add('societe', null, [
                'label'  => "Votre société",
                'attr' => [
                    'placeholder' => '(facultatif) Entrez le nom de votre société',
                ]
            ])
            ->add('adresse', null, [
                'label'  => "Votre adresse",
                'attr' => [
                    'placeholder' => 'Entrez votre adresse',
                ],
                'required' => true,
            ])
            ->add('postal', null, [
                'label' => "Votre code postal",
                'attr' => [
                    'placeholder' => 'Entrez votre code postal',
                ],
                'required' => true,
            ])
            ->add('ville', null, [
                'label'  => "Votre ville",
                'attr' => [
                    'placeholder' => 'Entrez votre ville',
                ],
                'required' => true,
            ])
            ->add('pays', CountryType::class, [
                'label'  => "Votre pays",
                'attr' => [
                    'placeholder' => 'Pays',
                    'class' => "custom-select"
                ],
                'required' => true,
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Adresse::class,
        ]);
    }
}
