<?php

namespace App\Controller;

use App\Entity\Video;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/video")
 */
class VideoController extends AbstractController
{
     /**
     * @Route("/delete/{id}", name="video_delete", methods={"POST"})
     */
    public function delete(
        Request $request,
        Video $video,
        EntityManagerInterface $entityManager
    ): Response {
        if (
            $this->isCsrfTokenValid(
                'delete' . $video->getId(),
                $request->request->get('_token')
            )
        ) {
            $entityManager->remove($video);
            $entityManager->flush();
        }
        $this->addFlash('success', 'Le video a été supprimé avec succès');
        return $this->redirectToRoute('homePage', [], Response::HTTP_SEE_OTHER);
    }
}