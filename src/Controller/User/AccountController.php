<?php

namespace App\Controller\User;

use App\Entity\User;
use App\Form\User\ChangePasswordType;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class AccountController extends AbstractController
{
    private $manager;
    private $userRepo;

    public function __construct(EntityManagerInterface $manager, UserRepository $userRepo)
    {
        $this->userRepo = $userRepo ;
        $this->manager  = $manager ;
    }

    /**
     * @Route("/compte", name="account")
     */
    public function index(): Response
    {
        return $this->render('account/compte.html.twig');
    }

    /**
     * @Route("/compte/password", name="account_password")
     */
    public function password(Request $request, UserPasswordHasherInterface $encoder): Response
    {
        $notification = null;

        $user = $this->getUser() ;
        $form = $this->createForm(ChangePasswordType::class, $user) ;

        $form->handleRequest($request) ;

        if( $form->isSubmitted() && $form->isValid() ){

            $old_pwd = $form->get('old_password')->getData();

            if( $encoder->isPasswordValid($user, $old_pwd) ){
                $newPwd = $form->get('new_password')->getData();
                $NewpasswordHasher = $encoder->hashPassword($user, $newPwd) ;

                $user->setPassword($NewpasswordHasher) ;
                $this->manager->flush();
                $notification = "Votre mot de passe a bien été mis à jour.";
            }{
                $notification = "Votre mot de passe n'est pas le bon.";
            }
        }

        return $this->render('account/password.html.twig', [
            'form' => $form->createView(),
            'notification' => $notification,
        ]);
    }

}
