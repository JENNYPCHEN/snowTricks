<?php

namespace App\Controller;

use App\Repository\TrickRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    protected $trickRepository;
    public function __construct(TrickRepository $trickRepository){
        $this->trickRepository=$trickRepository;
    }
 
    /**
     * @Route("/", name="homePage", methods={"GET"})
     */
    public function indexPage(
        Request $request
    ): Response {
        $search = $request->query->get('q');
        $user = $this->getUser() == null ? false : true;
        $totalTricks = $this->trickRepository->countNumberTricks($search);
        return $this->render('home/index.html.twig', [
            'totalTricks' => $totalTricks,
            'tricks' => $this->trickRepository->findBySearch($search),
            'search' => $search,
            'user' => $user,
        ]);
    }
}
