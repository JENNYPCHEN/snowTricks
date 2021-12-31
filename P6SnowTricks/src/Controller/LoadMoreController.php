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
     * @Route("/load/more/tricks/{row}", name="load_more_tricks",methods={"GET", "POST"})
     */
    public function loadmoreTricks(
        SerializerInterface $serializer,
        TrickRepository $trickRepository,
        Request $request
    ): Response {
        
        $offset = $request->get('row');
        $limit=5;
        $search=$request->query->get('search');
        $tricks = $trickRepository->findBySearch($search,$offset,$limit);

        foreach ($tricks as $trick) {
            $images=$trick->getImages();
            $i=0;
            $imagepath="default.jpg";
            foreach ($images as $image){
                if($i==0){
                    $imagepath=$image->getPath();
                }
                $i++;
            }
            $data[] = [
                'id' => $trick->getId(),
                'name' => $trick->getName(),
                'image'=> $imagepath,
                'slug'=>$trick->getSlug(),
            ];
        }
        return new JsonResponse($data);
    }
    /**
     * @Route("/load/more/comments/{id}/{row}", name="load_more_comments")
     */
    public function loadmoreComments(
        CommentRepository $commentRepository,
        Trick $trick,
        Request $request
    ): Response {
        $offset = $request->get('row');

        $comments = $commentRepository->findBy(
            ['trick' => $trick],
            ['createDate' => 'DESC'],
            5,
            $offset
        );
        foreach ($comments as $comment) {
            $data[] = [
                'message' => $comment->getMessage(),
                'createDate' => $comment->getCreateDate(),
                'userName' => $comment->getUser()->getUserName(),
                'userImage' => $comment->getUser()->getImage(),
            ];
        }
        return new JsonResponse($data);
    }
}
