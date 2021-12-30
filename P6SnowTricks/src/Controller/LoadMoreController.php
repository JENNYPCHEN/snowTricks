<?php

namespace App\Controller;

use App\Repository\TrickRepository;
use App\Entity\Trick;
use App\Repository\CommentRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Serializer\SerializerInterface;



class LoadMoreController extends AbstractController
{
    /**
     * @Route("/load/more/Tricks", name="load_more")
     */
    public function loadmoreTricks(SerializerInterface $serializer,TrickRepository $trickRepository, Request $request): Response
    {
        $offset=15;
        $tricks=$trickRepository->findBy([], ['createDate' => 'DESC'],10, $offset);
        return new JsonResponse($serializer->serialize($tricks, 'json'));    
    }
        /**
     * @Route("/load/more/comments/{id}/", name="load_more_comments")
     */
    public function loadmoreComments(CommentRepository $commentRepository,Trick $trick,Request $request): Response
    {
       $offset=$request->get('row');
    
    
        $comments=$commentRepository->findBy(['trick' => $trick],['createDate' => 'DESC'],5, $offset);
        foreach ($comments as $comment){
            $data[]=[
                'message'=>$comment->getMessage(),
                'createDate'=>$comment->getCreateDate(),
                'userName'=>$comment->getUser()->getUserName(),
                'userImage'=>$comment->getUser()->getImage(),
            ];
        }
 
       return new JsonResponse($data);    
    }

}
