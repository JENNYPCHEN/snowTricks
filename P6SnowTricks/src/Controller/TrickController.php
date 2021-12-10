<?php

namespace App\Controller;

use App\Entity\Trick;
use App\Form\TrickType;
use App\Repository\TrickRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/trick")
 */
class TrickController extends AbstractController
{

    /**
     * @Route("/{name}", name="trickPage", methods="get")
     */
    public function show(Trick $trick): Response
    {
        return $this->render('trick/trick.html.twig', [
            'trick' => $trick,
        ]);
    }

    /**
     * @Route("/new", name="trick_new", methods={"GET", "POST"})
     */
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $trick = new Trick();
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($trick);
            $entityManager->flush();

            return $this->redirectToRoute('homePage', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('trick/createTrick.html.twig', [
            'trick' => $trick,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="trick_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Trick $trick, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(TrickType::class, $trick);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('trick_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('trick/edit.html.twig', [
            'trick' => $trick,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="trick_delete", methods={"POST"})
     */
    public function delete(Request $request, Trick $trick, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$trick->getId(), $request->request->get('_token'))) {
            $entityManager->remove($trick);
            $entityManager->flush();
        }

        return $this->redirectToRoute('trick_index', [], Response::HTTP_SEE_OTHER);
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
