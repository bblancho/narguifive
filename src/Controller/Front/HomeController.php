<?php

namespace App\Controller\Front;

use App\Form\ContactType;
use voku\helper\HtmlDomParser;
use App\Entity\Product\Product;
use App\Service\Mail\MailService;
use App\Repository\MarqueRepository;
use App\Service\Mail\MailjetService;
use App\Repository\ProductRepository;
use App\Repository\CategoryRepository;
use Doctrine\Persistence\ManagerRegistry;
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


    public function __construct(ManagerRegistry $manager,MarqueRepository $marqueRepository, ProductRepository $productRepository, CategoryRepository $categoryRepository, SousCategoryRepository $sousCategoryRepository, SluggerInterface $slugger)
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

        $newProduit = '';
        $promosProduit = '';
        $chichasProduit = '';

        // Recup la valeur du nbr de total de produits en BDD
        $nb_produits_total = $this->productRepository->countTotalProduct();

        // Paginate the results of the query
        $produits = $paginator->paginate(
            $produits, // Doctrine Query, not results
            $request->query->getInt('page', 1), /** page number */
            6 // limit per page
        );

        $produits_bis = $this->productRepository->getPaginateProduits( $request->query->getInt("page", 1) , 9);

        $chichaCat = $this->categoryRepository->findOneBy(['nom' => 'Chichas']);
        $chichas = $this->productRepository->findBy(['category' => $chichaCat, 'publie' => true], ['createdAt' => 'desc'], 15);

        $charbons   = $this->productRepository->findBy(['category' => 3, 'publie' => true], ['createdAt' => 'desc'], 15);
        $gouts      = $this->productRepository->findBy(['category' => 2, 'publie' => true], ['createdAt' => 'desc'], 15);
        $tuyaux     = $this->productRepository->findBy(['category' => 4, 'publie' => true], ['createdAt' => 'desc'], 15);
        $accessoires   = $this->productRepository->findBy(['category' => 6, 'publie' => true], ['createdAt' => 'desc'], 15);
        $foyers     = $this->productRepository->findBy(['category' => 5, 'publie' => true], ['createdAt' => 'desc'], 15);
        $eliquide     = $this->productRepository->findBy(['category' => 7, 'publie' => true], ['createdAt' => 'desc'], 15);
        $pack     = $this->productRepository->findBy(['category' => 10, 'publie' => true], ['createdAt' => 'desc'], 15);
        $cbd     = $this->productRepository->findBy(['category' => 8, 'publie' => true], ['createdAt' => 'desc'], 15);
        $nouveautes    = $this->productRepository->findBy(['category' => 11, 'publie' => true], ['createdAt' => 'desc'], 15);
        $filteredProducts['chichas'] = $chichas;
        $filteredProducts['charbons'] = $charbons;
        $filteredProducts['gouts'] = $gouts;
        $filteredProducts['tuyaux'] = $tuyaux;
        $filteredProducts['eliquide'] = $eliquide;
        $filteredProducts['accessoires'] = $accessoires;
        $filteredProducts['foyers'] = $foyers;
        $filteredProducts['pack'] = $pack;
        $filteredProducts['cbd'] = $cbd;
        $filteredProducts['nouveautes'] = $nouveautes;

        return $this->render('home/index.html.twig', [
            'filteredProducts' => $filteredProducts,
            'produits' => $produits,
            'produits_bis' => $produits_bis,
            'nb_produits_total'  => $nb_produits_total,
        ]);
    }

    /**
     * @Route("/contact", name="home_contact")
     */
    public function contact(Request $request, MailService $mailer): Response
    {
        $form = $this->createForm(ContactType::class, null) ;

        $form->handleRequest($request) ;

        if ( $form->isSubmitted() && $form->isValid() ) {
            // dd( $form->getData() ) ;

            $this->addFlash('success', "Merci d'avoir contacté l'équipe NarguiFive .") ;

            // Envoi de l'email
            $mailer->sendEmail( $form->get('email')->getData(), $form->get('sujet')->getData(), $form->get('content')->getData() ) ;
        }

        return $this->render('home/contact.html.twig', [
            'form' => $form->createView()
        ]);
    }

}
