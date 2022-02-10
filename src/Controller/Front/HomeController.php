<?php

namespace App\Controller\Front;

use App\Form\ContactType;
use voku\helper\HtmlDomParser;
use App\Entity\Product\Product;
use App\Repository\MarqueRepository;
use App\Service\Mail\MailjetService;
use App\Repository\ProductRepository;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\SousCategoryRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    private $manager;
    private $productRepository;
    private $categoryRepository;
    private $slugger ;
    private $sousCategoryRepository;
    private $marqueRepository;

    public function __construct(EntityManagerInterface $manager,MarqueRepository $marqueRepository, ProductRepository $productRepository, CategoryRepository $categoryRepository, SousCategoryRepository $sousCategoryRepository, SluggerInterface $slugger)
    {
        $this->manager = $manager ;
        $this->productRepository = $productRepository ;
        $this->categoryRepository = $categoryRepository ;
        $this->sousCategoryRepository = $sousCategoryRepository;
        $this->marqueRepository = $marqueRepository;
        $this->slugger = $slugger ;
    }
  
    /**
     * @Route("/", name="home")
     */
    public function index(Request $request, PaginatorInterface $paginator): Response
    {
        $produits = $this->productRepository->findAll();

        // Recup la valeur du nbr de total de produits en BDD
        $nb_produits_total = $this->productRepository->countTotalProduct();

        // Paginate the results of the query
        $produits = $paginator->paginate(
            $produits, // Doctrine Query, not results
            $request->query->getInt('page', 1), /** page number */
            6 // limit per page
        );

        $produits_bis = $this->productRepository->getPaginateProduits( $request->query->getInt("page", 1), 9);

        return $this->render('home/index.html.twig', [
            'produits' => $produits,
            'produits_bis' => $produits_bis,
            'nb_produits_total'  => $nb_produits_total,
        ]);
    }

    /**
     * @Route("/contact", name="home_contact")
     */
    public function contact(Request $request): Response
    {

        $form = $this->createForm(ContactType::class, null) ;

        $form->handleRequest($request) ;

        if ( $form->isSubmitted() && $form->isValid() ) {
            // dd( $form->getData() ) ;

            $this->addFlash('notice', "Merci d'avoir contacté l'équipe NarguiFive .") ;
            // Envoi de l'email
                $content ="Bonjour <br/> Merci pour votre commande.  <br/>";
                $mail = new MailjetService();
                $mail->send( $form->get('email')->getData(), $form->get('nom')->getData().' '.$form->get('prenom')->getData(), $form->get('sujet')->getData(), $content) ;

        }

        return $this->render('home/contact.html.twig', [
            'form' => $form->createView()
        ]);
    }

}
