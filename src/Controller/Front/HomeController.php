<?php

namespace App\Controller\Front;

use App\Form\ContactType;
use voku\helper\HtmlDomParser;
use App\Entity\Product\Product;
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
    private $repoProduct;
    private $category;
    private $slugger ;

    public function __construct(EntityManagerInterface $manager, ProductRepository $repoProduct, CategoryRepository $category, SousCategoryRepository $sousCategoryRepository, SluggerInterface $slugger)
    {
        $this->manager = $manager ;
        $this->repoProduct = $repoProduct ;
        $this->category = $category ;
        $this->sousCategoryRepository = $sousCategoryRepository;
        $this->slugger = $slugger ;
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
            $request->query->getInt('page', 1), /** page number */
            6 // limit per page
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
     * @Route("/scrap", name="home_scrap")
     */
    public function scrap(): Response
    {
        $category = $this->category->find(3) ;
        $sousCat  = $this->sousCategoryRepository->find(14) ;
        

        $urlval =  "https://www.el-badia.com/fr/30-naturels"; //https://www.el-badia.com/fr/30-naturels
       
        //ETAPE 2
        $html = HtmlDomParser::file_get_html($urlval);
        $divlistproduit = $html->find('div[id=axfilterresult]');

        $val = 0 ;
        
        foreach( $divlistproduit[0]->find('ul') as $ul )
        {
            foreach( $ul->find('li') as $li )
            {
                if( $val < 3 ){
                    $produitmarque = $li->find('div[class=product-manu]');
                    if ( count($produitmarque) > 0) {
                        $produitmarqueval =   str_replace("'", '',$produitmarque[0]->text() );
                    }

                    $produitname = $li->find('a[class=product-name]'); 
                    if ( count($produitname) > 0 ) {
                        $produitnameval =   $produitname[0]->text();
                        $produitSlug = strtolower( $this->slugger->slug($produitnameval) ) ;
                    }

                    $productprice = $li->find('span[class="price product-price"]');
                    if ( count($productprice) > 0 ) {
                        $productpriceval = $productprice[0]->plaintext;
                    }
                    // dd($productpriceval) ;
                    
                    $productdesc = $li->find('p[class=product-desc]');
                    if ( count($productdesc) > 0 ) 
                    {
                        $productdescval =   str_replace("'", '',$productdesc[0]->text() );
                    }

                    $productimg = $li->find('img');
                    if ( count($productimg) > 0 ) 
                    {
                        $productimgval = $productimg[0]->attr['data-src'];
                    }

                    $produit = new Product();
                    $produit->setNom($produitnameval);
                    $produit->setSlug( $produitSlug );
                    $produit->setContent($productdescval);
                    // $produit->setMarque($produitmarqueval);
                    $produit->setPrice(intval($productpriceval));
                    $produit->setPriceHT(intval($productpriceval));
                    $produit->setImage($productimgval);
                    $produit->setTaille(0);
                    $produit->setVase('');
                    $produit->setTuyau('');
                    $produit->setFixation('');
                    // $produit->setColor($this->colorRepository->find(1));
                    $produit->setCategory($category);
                    $produit->setSousCategory($sousCat);
                    $produit->setIsBest(0);
                    $produit->setEnStock(15);

                    // dd($produit);
                    $this->manager->persist($produit);
                    $this->manager->flush();

                    $val++;
                }
            }
        }

        return $this->render('product/index.html.twig');
    }

}
