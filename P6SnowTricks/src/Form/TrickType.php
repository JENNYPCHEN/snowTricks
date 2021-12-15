<?php

namespace App\Form;

use App\Entity\Category;
use App\Entity\Image;
use App\Entity\Trick;
use App\Form\ImageType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

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
            ->add('images', FileType::class, [
                'multiple'=>true,
                'mapped'=>false,
                'required' => false,
                'empty_data' => 'default.jpg'
            ])

            ->add('videos', TextType::class, [
                'mapped' => false,
                'required' => false,
                'label' => 'Les videos',
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Trick::class,
        ]);
    }
}
