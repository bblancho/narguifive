<?php

namespace App\Controller\Security;

use App\Entity\User;
use App\Service\Mail\MailService;
use App\Form\Register\RegisterType;
use App\Repository\UserRepository;
use App\Service\Mail\MailjetService;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class RegisterController extends AbstractController
{
    private $doctrine;
    private $userRepository;

    public function __construct( ManagerRegistry $doctrine, UserRepository $userRepository )
    {
        $this->doctrine = $doctrine;
        $this->userRepository = $userRepository;
    }

    /**
     * @Route("/inscription", name="register")
     */
    public function register(Request $request, UserPasswordHasherInterface $encoder, MailService $mailer): Response
    {
        $user = new User();

        $form = $this->createForm(RegisterType::class, $user);
        $form->handleRequest($request);

        if ( $form->isSubmitted() && $form->isValid() ) {

            $search_email = $this->userRepository->findOneByEmail( $form->get('email')->getData() ) ;
            
            if( !$search_email ){

                // Chiffrement du mot de passe
                    $passwordHasher = $encoder->hashPassword( $user, $form->get('password')->getData() ) ;
                    $user->setPassword($passwordHasher) ;

                // Création du user dans la BDD
                    $em = $this->doctrine->getManager() ;
                    $em->persist($user);
                    $em->flush();

                // Envoi de l'email
                    $content ="Bonjour ".$user->getFullName()."<br/> Bienvenu chez NarguiFive, la première boutique de vente de chicha en France.  <br/>";
                    $this->addFlash('success', "Merci d'avoir contacté l'équipe NarguiFive .") ;
            
                    // Envoi de l'email    
                    $mailer->sendEmail( $user->getEmail(), 'Inscription sur le site NarguiFive.', $content) ;
            } 
        }

        return $this->render('register/register.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
