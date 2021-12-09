<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class TrickController extends AbstractController
{
    /**
     * @Route("/trick/{trickName?}", name="trickPage", methods="get")
     */
    public function trickPage($trickName): Response
    {
        return $this->render('trick/trick.html.twig', [
            'controller_name' => 'TrickController',
        ]);
    }
      /**
     * @Route("/createTrick", name="createTrickPage")
     */
    public function createTrickPage(): Response
    {
        return $this->render('trick/createTrick.html.twig', [
            'controller_name' => 'TrickController',
        ]);
    }
     /**
     * @Route("/editTrick/{id?}", name="editTrickPage")
     */
    public function editTrickPage($id): Response
    {
        return $this->render('trick/editTrick.html.twig', [
            'controller_name' => 'TrickController',
        ]);
    }
}
