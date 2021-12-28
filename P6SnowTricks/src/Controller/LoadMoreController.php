<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

class LoadMoreController extends AbstractController
{
    /**
     * @Route("/load/more", name="load_more")
     */
    public function index(): Response
    {
        return new JsonResponse(['success' => 1]);
        
        
    }
}
