<?php

namespace App\Controller\User;

use App\Entity\User;
use App\Entity\ResetPassword;

use App\Repository\UserRepository;
use App\Form\User\ResetPasswordType;
use App\Service\Mail\MailjetService;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\ResetPasswordRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class ResetPasswordController extends AbstractController
{
    private $manager;
    private $userRepo;
    private $resetRepo;

    public function __construct(EntityManagerInterface $manager, UserRepository $userRepo, ResetPasswordRepository $resetRepo)
    {
        $this->manager  = $manager ;
        $this->userRepo = $userRepo ;
        $this->resetRepo = $resetRepo ;
    }
    
    /**
     * @Route("/password/new", name="reset_password")
     */
    public function index(Request $request): Response
    {
        if( $this->getUser() ){
            return $this->redirectToRoute("home");
        }

        if ( $request->get('email') ){
            $email = $request->get('email') ;
            $user_bdd = $this->userRepo->findOneByEmail( $email) ;

            if( $user_bdd ) // Si le user existe
            {
                // Enregistrement de la demande mot de passe oublié
                    $reset_password = new ResetPassword();

                    $reset_password->setUser($user_bdd) ;
                    $reset_password->setToken( uniqid() ) ;
                    $reset_password->setCreatedAt(new \DateTime() ) ;

                    $this->manager->persist($reset_password);
                    $this->manager->flush() ;

                    $url = $this->generateUrl('update_password', ['token' => $reset_password->getToken()] );

                // Envoi de l'email
                    $content ="Bonjour ".$user_bdd->getFullName()."<br/> Veuillez cliquer sur <a href='".$url."' > ce lien pour mettre réinitialiser votre mot de passe </a>  <br/>";
                    $mail = new MailjetService();
                    $mail->send( $user_bdd->getEmail(), $user_bdd->getNom(), "Réinitialisation du mot de passe", $content) ;

                $this->addFlash('notice', "Vous allez recevoir un mail dans quelques secondes pour réinitialiser votre mot de passe.") ;
            } else {
                $this->addFlash('notice', "Cette adresse email est inconnue.") ;
            }
        }

        return $this->render('account/reset_password.html.twig');
    }

    /**
     * @Route("/password/update/{token}", name="update_password")
     */
    public function updatePassword(Request $request,$token, UserPasswordHasherInterface $encoder)
    {
        $reset_password = $this->resetRepo->findOneByToken( $token) ;

        if( !$reset_password )
        {
            return $this->redirectToRoute('reset_password') ;
        }

        // on vérifie si created_at = now - 24h
            $now = new \DateTime();

            if( $now > $reset_password->getCreatedAt()->modify("+ 24 hour") ){ // le token a expiré
                $this->addFlash('notice', "Votre demande de mot de passe a expiré. Merci de la renouveller") ;

                return $this->redirectToRoute("reset_password") ;
            }

        // on arrive sur la page de MAJ du mot de passe
            $form = $this->createForm(ResetPasswordType::class, null) ;
            $form->handleRequest($request);

            if( $form->isSubmitted() && $form->isValid() ){
                $new_password = $form->get('new_password')->getData() ;

                $NewpasswordHasher = $encoder->hashPassword( $reset_password->getUser() , $new_password) ;

                $reset_password->getUser()->setPassword($NewpasswordHasher) ;
                $this->manager->flush();

                // Redirection après MAJ MDP
                $this->addFlash('notice', "Votre mot de passe a bien été mis à jour.") ;
                $this->redirectToRoute("app_login") ;
            }
        
        return $this->render('account/update_password.html.twig', [
            'form' => $form->createView(),
        ]);
        // dd($reset_password) ;
    }

}
