<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Image;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder,array $options
    ): void {
        $builder
            ->add('username', TextType::class, [
                'label' => 'required',
                'invalid_message' => ' veuillez télécharger une image',
            ])
            ->add('email', EmailType::class, [
                'label' => 'required',
                'invalid_message' => ' l\'email a été utilisé. veuillez en choisir un autre.',
            ])
            ->add('agreeTerms', CheckboxType::class, [
                'mapped' => false,
                'constraints' => [
                    new IsTrue([
                        'message' => 'Vous devez accepter nos conditions.',
                    ]),
                ],
            ])
            ->add('image', ChoiceType::class, [
                'choices' => [
                    'avatar1' => 'avatar1.png',
                    'avatar2' => 'avatar2.png',
                    'avatar3' => 'avatar3.png',
                    'avatar4' => 'avatar4.png',
                    'avatar5' => 'avatar5.png',
                    'avatar6' => 'avatar6.png',
                    'avatar7' => 'avatar7.png',
                    'avatar8' => 'avatar8.png',
                ],
                'expanded' => true,
                'label' => 'required',
            ])
            ->add('plainPassword', PasswordType::class, [
                'mapped' => false,
                'label' => 'required',
                'attr' => ['autocomplete' => 'new-password'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez entrer un mot de passe.',
                    ]),
                    new Length([
                        'min' => 6,
                        'minMessage' =>
                            'Votre mot de passe doit comporter au moins {{ limit }} caractères',
                        'max' => 12,
                    ]),
                ],
            ]);
    }
    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
