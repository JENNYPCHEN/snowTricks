<?php

namespace App\Form;

use App\Entity\Category;
use App\Entity\Image as EntityImage;
use App\Entity\Trick;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Image;
use Symfony\Component\Validator\Constraints\All;

class TrickType extends AbstractType
{
    public function buildForm(
        FormBuilderInterface $builder,
        array $options
    ): void {
        $builder
            ->add('name', TextType::class, [
                'required' => true,
                'label' => 'Nom de la figure',
            ])
            ->add('description', TextareaType::class, [
                'required' => true,
                'label' => 'La description',
            ])
            ->add('category', EntityType::class, [
                'class' => Category::class,
                'label' => 'Le groupe de la figure',
                'placeholder' => '----Choissiez le groupe de la figure----',
                'required' => true,
            ])
            ->add('images', FileType::class,[
                'required'=>false,
                'multiple' => true,
                'mapped' => false,
                'data_class' => EntityImage::class,
                'invalid_message' => ' veuillez télécharger une image',
                'constraints' => [new All([new Image([])])],
            ])

            ->add('videos', CollectionType::class, [
                'mapped' => false,
                'entry_type' => VideoType::class,
                'allow_add' => true,
                'allow_delete' => true,
                'required' => false,
                'label' => 'Les videos',
                'prototype' => true,
                'help' => ' veuillez copier et coller le lien youtube.',
                'invalid_message' =>
                    ' veuillez copier et coller le lien youtube.',
            ])

            ->add('envoyer',SubmitType::class,[ 'attr' => ['label' => 'envoyer'],]);
            
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Trick::class,
        ]);
    }
}
