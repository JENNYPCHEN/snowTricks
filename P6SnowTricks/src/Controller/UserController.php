<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class UserController extends AbstractController
{
   
        /**
     * @Route("/user/signup", name="userSignupPage")
     */
    public function signupPage(): Response
    {
        return $this->render('user/signup.html.twig', [
            'controller_name' => 'UserController',
        ]);
    }

            /**
     * @Route("/user/forgetPassword", name="forgetPasswordPage")
     */
    public function forgetPasswordPage(): Response
    {
        return $this->render('user/forgetPassword.html.twig', [
            'controller_name' => 'UserController',
        ]);
    }
}
