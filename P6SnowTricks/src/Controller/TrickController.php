<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Image;
use App\Entity\Trick;
use App\Entity\User;
use App\Form\CommentType;
use App\Form\TrickType;
use App\Repository\CommentRepository;
use App\Repository\ImageRepository;
use App\Repository\TrickRepository;
use App\Service\FileUploaderHelper;
use Doctrine\ORM\EntityManager;
use Symfony\Component\HttpFoundation\File\UploadedFile;
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
     * @Route("/delete/{id}", name="trick_delete", methods={"POST"})
     */
    public function delete(
        Request $request,
        Trick $trick,
        EntityManagerInterface $entityManager
    ): Response {
        if (
            $this->isCsrfTokenValid(
                'delete' . $trick->getId(),
                $request->request->get('_token')
            )
        ) {
            $entityManager->remove($trick);
            $entityManager->flush();
        }
        $this->addFlash('success', 'Le trick a été supprimé avec succès');
        return $this->redirectToRoute('homePage', [], Response::HTTP_SEE_OTHER);
    }

    /**
     * @Route("/createtrick", name="createTrickPage", methods={"GET", "POST"})
     */
    public function createTrickPage(
        Request $request,
        FileUploaderHelper $fileUploaderHelper,
        EntityManagerInterface $entityManager
    ): Response {
        $trick = new Trick();
        $trickForm = $this->createForm(TrickType::class, $trick);
        $trickForm->handleRequest($request);
        if ($trickForm->isSubmitted() && $trickForm->isValid()) {
            $videoFiles = $trickForm->get('videos')->getData();
            $imageFiles = $trickForm->get('images')->getData();
            $imageDirectory =
                $this->getParameter('kernel.project_dir') .
                '/public/img/image_tricks';

            $fileUploaderHelper->uploadImage(
                $imageDirectory,
                $imageFiles,
                $trick
            );

            if ($videoFiles) {
                $fileUploaderHelper->uploadVideo($videoFiles, $trick);
            }
            $trick->setCreateDate(new \Datetime());
            $entityManager->persist($trick);
            $entityManager->flush();
            $this->addFlash('success', 'Le trick a été créé avec succès');

            return $this->redirectToRoute(
                'homePage',
                [],
                Response::HTTP_SEE_OTHER
            );
        }
        $this->addFlash(
            'notice',
            ' Opps quelque chose ne va pas ! Vérifiez surtout si vous avez mis un lien youtube valide.'
        );
        return $this->render('trick/createTrick.html.twig', [
            'trickForm' => $trickForm->createView(),
        ]);
    }
    /**
     * @Route("/{id}/{slug}", name="trickPage", methods={"GET", "POST"})
     */
    public function show(
        Trick $trick,
        Request $request,
        CommentRepository $commentRepository,
        EntityManagerInterface $entityManager
    ): Response {
        $comment = new Comment();
        $commentForm = $this->createForm(CommentType::class, $comment);
        $commentForm->handleRequest($request);
        if ($commentForm->isSubmitted() && $commentForm->isValid()) {
            $comment->setTrick($trick);
            $comment->setCreateDate(new \Datetime());
            $entityManager->persist($comment);
            $entityManager->flush();

            return $this->redirectToRoute('trickPage', [
                'slug' => $trick->getSlug(),
                'id' => $trick->getId(),
                Response::HTTP_SEE_OTHER,
            ]);
        }
        return $this->render('trick/trick.html.twig', [
            'trick' => $trick,
            'comments' => $commentRepository->findBy(
                ['trick' => $trick->getId()],
                ['createDate' => 'DESC']
            ),
            'commentForm' => $commentForm->createView(),
        ]);
    }

    /**
     * @Route("/edit-{id}", name="trick_edit", methods={"GET", "POST"})
     */
    public function edit(
        Request $request,
        Trick $trick,
        FileUploaderHelper $fileUploaderHelper,
        EntityManagerInterface $entityManager
    ): Response {
        $trickForm = $this->createForm(TrickType::class, $trick);
        $trickForm->handleRequest($request);

        if ($trickForm->isSubmitted() && $trickForm->isValid()) {
            $videoFiles = $trickForm->get('videos')->getData();
            $imageFiles = $trickForm->get('images')->getData();
            $imageDirectory =
                $this->getParameter('kernel.project_dir') .
                '/public/img/image_tricks';
            if ($trick->getImages() === null) {
                $fileUploaderHelper->uploadImage(
                    $imageDirectory,
                    $imageFiles,
                    $trick
                );
            } else {
                $fileUploaderHelper->uploadEditedTrickImage(
                    $imageDirectory,
                    $imageFiles,
                    $trick
                );
           }

            if ($videoFiles) {
                $fileUploaderHelper->uploadVideo($videoFiles, $trick);
            }
            $trick->setUpdateDate(new \Datetime());
            $entityManager->persist($trick);
            $entityManager->flush();
            $this->addFlash('success', 'Le trick a été créé avec modifé');

            return $this->redirectToRoute(
                'trickPage',
                ['slug' => $trick->getSlug(), 'id' => $trick->getId()],
                Response::HTTP_SEE_OTHER
            );
        }
        $this->addFlash(
            'notice',
            ' Opps quelque chose ne va pas ! Vérifiez surtout si vous avez mis un lien youtube valide.'
        );
        return $this->render('trick/editTrick.html.twig', [
            'trickForm' => $trickForm->createView(),
            'trick' => $trick,
        ]);
    }
}
