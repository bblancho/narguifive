<?php

namespace App\Controller\User;

use App\Entity\Product\Adresse;
use App\Form\User\AdresseFormType;
use App\Repository\AdresseRepository;
use App\Service\Carte\CarteService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdresseCompteController extends AbstractController
{
    private $manager;
    private $repoAdresse;

    public function __construct(EntityManagerInterface $manager, AdresseRepository $repoAdresse)
    {
        $this->manager     = $manager ;
        $this->repoAdresse = $repoAdresse ;
    }

    /**
     * @Route("/compte/adresses/", name="adresse_compte")
     */
    public function index(): Response
    {
        $adresses = $this->getUser()->getAdresses();

        return $this->render('account/adresses.html.twig',[
            'adresses' => $adresses
        ]);
    }

    /**
     * @Route("/compte/ajouter-une-adresse/", name="adresse_compte_add")
     */
    public function add(CarteService $panier, Request $request): Response
    {
        $adresse = new Adresse();
        $form = $this->createForm(AdresseFormType::class, $adresse) ;

        $form->handleRequest($request);

        if( $form->isSubmitted() && $form->isValid() ){
            $adresse->setUser( $this->getUser() );

            $this->manager->persist($adresse);
            $this->manager->flush();

            if ( $panier->get() ){ // si j'ai des produits dans mon panier
                return $this->redirectToRoute('order');
            }

            return $this->redirectToRoute('adresse_compte');
        }

        return $this->render('account/adresses_add.html.twig',[
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/compte/modifier/une-adresse/{id}", name="adresse_compte_edit")
     */
    public function edit(Request $request, $id): Response
    {
        $adresse = $this->repoAdresse->findOneById($id);

        if( !$adresse || $adresse->getUser() != $this->getUser() ){
            return $this->redirectToRoute("adresse_compte") ;
        }

        $form = $this->createForm(AdresseFormType::class, $adresse) ;

        $form->handleRequest($request);

        if( $form->isSubmitted() && $form->isValid() ){
            $this->manager->flush();
            return $this->redirectToRoute('adresse_compte');
        }

        return $this->render('account/adresses_edit.html.twig',[
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/compte/supprimer-une-adresse/{id}", name="adresse_compte_delete")
     */
    public function remove($id): Response
    {
        $adresse = $this->repoAdresse->find($id);

        if( $adresse && ($adresse->getUser() == $this->getUser()) )
        {
            $this->manager->remove($adresse);
            $this->manager->flush();
        }

        return $this->redirectToRoute('adresse_compte');

    }

}
