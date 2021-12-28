<?php
namespace App\Service;
use App\Entity\Image;
use App\Entity\Video;
use App\Entity\Trick;
use SimpleXMLElement;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class FileUploaderHelper
{
    public function uploadImage($targetDirectory, $images, $trick)
    {
        if ($images == null) {
            $images = 'default.jpg';
            $img = new Image();
            $img->setPath($images);
            $trick->addImage($img);
        } else {
            foreach ($images as $image) {
                $filename = md5(uniqid()) . '.' . $image->guessExtension();
                $image->move($targetDirectory, $filename);
                $img = new Image();
                $img->setPath($filename);
                $trick->addImage($img);
            }
        }
    }
    public function uploadVideo($videos, $trick)
    {
        foreach ($videos as $video) {
            $videoString = serialize($video);
            preg_match(
                '%(?:youtube(?:-nocookie)?\.com/(?:[^/]+/.+/|(?:v|e(?:mbed)?)/|.*[?&]v=)|youtu\.be/)([^"&?/ ]{11})%i',
                $videoString,
                $match
            );
            if (isset($match[1])) {
                $youtubeId = $match[1];
                $vid = new Video();
                $vid->setPath($youtubeId);
                $trick->addVideos($vid);
            }
        }
    }
    public function uploadEditedTrickImage($targetDirectory, $images, $trick)
    {
        foreach ($images as $image) {
            $filename = md5(uniqid()) . '.' . $image->guessExtension();
            $image->move($targetDirectory, $filename);
            $img = new Image();
            $img->setPath($filename);
            $trick->addImage($img);
        }
    }
    
}
