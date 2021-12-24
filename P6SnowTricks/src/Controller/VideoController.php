<?php

namespace App\Controller;

use App\Entity\Video;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * @Route("/video")
 */
class VideoController extends AbstractController
{
     /**
     * @Route("/delete/{id}", name="video_delete", methods={"DELETE"})
     */
    public function delete(
        Request $request,
        Video $video,
        EntityManagerInterface $entityManager
    ): Response {
        $data = json_decode($request->getContent(), true);
        if (
            $this->isCsrfTokenValid(
                'delete' . $video->getId(),
                $data['_token']
            )
        ) {
            $data = json_decode($request->getContent(), true);
            $entityManager->remove($video);
            $entityManager->flush();
            return new JsonResponse(['success' => 1]);
        }
        return new JsonResponse(['error' => 'invalid_token'], 400);    }
}