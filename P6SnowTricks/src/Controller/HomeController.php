<?php

namespace App\Controller;

use App\Repository\TrickRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Contracts\Cache\CacheInterface;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="homePage", methods={"GET"})
     */
    public function indexPage(TrickRepository $trickRepository,Request $request): Response
    {
        $search=$request->query->get('q');
        $user=$this->getUser()==null?false:true;
        $totalTricks=$trickRepository->countNumberTricks($search);
        return $this->render('home/index.html.twig', [
            'totalTricks'=>$totalTricks,
            'tricks' => $trickRepository->findBySearch($search),
            'search'=>$search,
            'user'=>$user,
        ]);
    }
}
