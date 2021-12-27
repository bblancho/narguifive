<?php

namespace App\Controller\Security;

use App\Entity\User;
use App\Form\Register\RegisterType;
use App\Service\Mail\MailjetService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;

class RegisterController extends AbstractController
{
    private $manager;

    public function __construct( EntityManagerInterface $manager )
    {
        $this->manager = $manager;
    }

    /**
     * @Route("/inscription", name="register")
     */
    public function register(Request $request, UserPasswordHasherInterface $encoder): Response
    {
        $user = new User();

        $form = $this->createForm(RegisterType::class, $user);
        $form->handleRequest($request);
        $notification = null;

        if ( $form->isSubmitted() && $form->isValid() ) {

            $user = $form->getData();
            $password =  $user->getPassword() ;

            $search_email = $this->manager->getRepository(User::class)->findOneByEmail( $user->getEmail()) ;

            if( !$search_email ){

                // Chiffrement du mot de passe
                    $passwordHasher = $encoder->hashPassword($user, $password) ;
                    $user->setPassword($passwordHasher) ;

                // Création du user dans la BDD
                    $this->manager->persist($user);
                    $this->manager->flush();

                // Envoi de l'email
                    $content ="Bonjour ".$user->getFullName()."<br/> Bienvenu sur la première boutique de vente de chicha en France.  <br/>";
                    $mail = new MailjetService();
                    $mail->send( $user->getEmail(), $user->getNom(), 'Inscription sur le site NarguiFive.', $content) ;

                // Make sure message will be displayed after redirect
                $this->get('session')->getFlashBag()->add('message', 'Merci pour votre inscription.');

                $notification = "Votre inscription s'est correctement déroulé. Vous pouvez dès à présent vous connecter à votre compte";

            } else {
                $notification = "L'email que vous avez renseigné existe déjà.";
            }

        }

        return $this->render('register/register.html.twig', [
            'form' => $form->createView(),
            'notification' => $notification,
        ]);
    }
}
