<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Entity\Trick;
use App\Form\CommentType;
use App\Form\TrickType;
use App\Repository\CommentRepository;
use App\Service\FileUploaderHelper;
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
    protected $fileUploaderHelper;
    protected $commentRepository;
    protected $entityManager;

    public function __construct(
        FileUploaderHelper $fileUploaderHelper,
        CommentRepository $commentRepository,
        EntityManagerInterface $entityManager
    ) {
        $this->fileUploaderHelper = $fileUploaderHelper;
        $this->commentRepository = $commentRepository;
        $this->entityManager =$entityManager;
    }

    /**
     * @Route("/delete/{id}", name="trick_delete", methods={"POST"})
     */
    public function delete(Request $request, Trick $trick): Response
    {
        $this->denyAccessUnlessGranted('ROLE_USER');
        if (
            $this->isCsrfTokenValid(
                'delete' . $trick->getId(),
                $request->request->get('_token')
            )
        ) {
            $this->entityManager->remove($trick);
            $this->entityManager->flush();
        }
        $this->addFlash('success', 'Le trick a été supprimé avec succès');
        return $this->redirectToRoute('homePage', [], Response::HTTP_SEE_OTHER);
    }

    /**
     * @Route("/createtrick", name="createTrickPage", methods={"GET", "POST"})
     */
    public function createTrickPage(Request $request): Response
    {
        $this->denyAccessUnlessGranted('ROLE_USER');
        $trick = new Trick();
        $trickForm = $this->createForm(TrickType::class, $trick);
        $trickForm->handleRequest($request);
        if ($trickForm->isSubmitted() && $trickForm->isValid()) {
            $videoFiles = $trickForm->get('videos')->getData();
            $imageFiles = $trickForm->get('images')->getData();
            $imageDirectory =
                $this->getParameter('kernel.project_dir') .'/public/img/image_tricks';
            $this->fileUploaderHelper->uploadImage( $imageDirectory, $imageFiles, $trick);
            if ($videoFiles) {
                $this->fileUploaderHelper->uploadVideo($videoFiles, $trick);
            }
            $trick->setCreateDate(new \Datetime());
            $trick->setUser($this->getUser());
            $this->entityManager->persist($trick);
            $this->entityManager->flush();
            $this->addFlash('success', 'Le trick a été créé avec succès');

            return $this->redirectToRoute(
                'homePage',[],Response::HTTP_SEE_OTHER
            );
        }
        return $this->render('trick/createTrick.html.twig', [
            'trickForm' => $trickForm->createView(),
        ]);
    }
    /**
     * @Route("/{id}/{slug}", name="trickPage", methods={"GET", "POST"})
     */
    public function show(Trick $trick, Request $request): Response
    {
        $comment = new Comment();
        $commentForm = $this->createForm(CommentType::class, $comment);
        $commentForm->handleRequest($request);
        if ($commentForm->isSubmitted() && $commentForm->isValid()) {
            $comment->setTrick($trick);
            $comment->setUser($this->getUser());
            $comment->setCreateDate(new \Datetime());
            $this->entityManager->persist($comment);
            $this->entityManager->flush();

            return $this->redirectToRoute('trickPage', [
                'slug' => $trick->getSlug(),
                'id' => $trick->getId(),
                Response::HTTP_SEE_OTHER,
            ]);
        }
        $totalComments = $this->commentRepository->countNumberComments($trick);
        return $this->render('trick/trick.html.twig', [
            'trick' => $trick,
            'totalComments' => $totalComments,
            'comments' => $this->commentRepository->findBy(
                ['trick' => $trick->getId()],
                ['createDate' => 'DESC'], 5
            ),
            'commentForm' => $commentForm->createView(),
        ]);
    }

    /**
     * @Route("/edit-{id}", name="trick_edit", methods={"GET", "POST"})
     */
    public function edit(Request $request, Trick $trick): Response
    {
        $this->denyAccessUnlessGranted('ROLE_USER');
        $trickForm = $this->createForm(TrickType::class, $trick);
        $trickForm->handleRequest($request);

        if ($trickForm->isSubmitted() && $trickForm->isValid()) {
            $videoFiles = $trickForm->get('videos')->getData();
            $imageFiles = $trickForm->get('images')->getData();
            $imageDirectory = $this->getParameter('kernel.project_dir') . '/public/img/image_tricks';
            if ($trick->getImages() === null) {
                $this->fileUploaderHelper->uploadImage( $imageDirectory, $imageFiles, $trick );
            } 
                $this->fileUploaderHelper->uploadEditedTrickImage( $imageDirectory, $imageFiles, $trick);
            if ($videoFiles) {
                $this->fileUploaderHelper->uploadVideo($videoFiles, $trick);
            }
            $trick->setUpdateDate(new \Datetime());
            $this->entityManager->persist($trick);
            $this->entityManager->flush();
            $this->addFlash('success', 'Le trick a été créé avec modifé');

            return $this->redirectToRoute(
                'trickPage',
                ['slug' => $trick->getSlug(), 'id' => $trick->getId()],
                Response::HTTP_SEE_OTHER
            );
        }
        return $this->render('trick/editTrick.html.twig', [
            'trickForm' => $trickForm->createView(),
            'trick' => $trick,
        ]);
    }
}
