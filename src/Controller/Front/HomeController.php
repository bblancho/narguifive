<?php

namespace App\Controller\Front;

use App\Service\Search;
use App\Form\ContactType;
use App\Form\Utils\SearchType;
use App\Service\Mail\MailjetService;
use App\Repository\ProductRepository;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    private $manager;
    private $repoProduct;
    private $category;

    public function __construct(EntityManagerInterface $manager, ProductRepository $repoProduct, CategoryRepository $category)
    {
        $this->manager = $manager ;
        $this->repoProduct = $repoProduct ;
        $this->category = $category ;
    }
  
    /**
     * @Route("/", name="home")
     */
    public function index(Request $request, PaginatorInterface $paginator): Response
    {
        $produits = $this->repoProduct->findAll();

        // Paginate the results of the query
        $produits = $paginator->paginate(
            $produits, // Doctrine Query, not results
            $request->query->getInt('page', 1), // numéro de la page en cours
            6 // Items per page

        );

        $produits_best = $this->repoProduct->findByIsBest(1);

        return $this->render('home/index.html.twig', [
            'produits' => $produits,
            'produits_best'  => $produits_best,
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

    /**
     * @Route("/category", name="category")
     */
    public function cat(): Response
    {
        return $this->render('home/category.html.twig');
    }

}
