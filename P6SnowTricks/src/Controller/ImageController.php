<?php

namespace App\Controller;

use App\Entity\Image;
use App\Entity\Trick;
use App\Form\ImageType;
use App\Repository\ImageRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

/**
 * @Route("/image")
 */
class ImageController extends AbstractController
{
    /**
     * @Route("/delete/{id}", name="image_delete", methods={"DELETE"})
     */
    public function delete(
        Request $request,
        Image $image,
        EntityManagerInterface $entityManager
    ): Response {
        $this->denyAccessUnlessGranted('ROLE_USER');
        $data = json_decode($request->getContent(), true);
        if (
            $this->isCsrfTokenValid(
                'delete' . $image->getId(),
                $data['_token']
            )
        ) {
            $path = $image->getPath();
			unlink($this->getParameter('kernel.project_dir') .
            '/public/img/image_tricks' . '/' . $path);
            $entityManager->remove($image);
            $entityManager->flush();
            return new JsonResponse(['success' => 1]);
        }
        return new JsonResponse(['error' => 'invalid_token'], 400);
    }
}