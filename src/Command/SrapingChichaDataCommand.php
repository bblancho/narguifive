<?php
namespace App\Command;

use App\Entity\Product\Color;
use App\Entity\Product\Marque;
use voku\helper\HtmlDomParser;
use App\Entity\Product\Product;
use App\Entity\Product\Category;
use App\Repository\MarqueRepository;
use App\Repository\CategoryRepository;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\SousCategoryRepository;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\String\Slugger\SluggerInterface;

class SrapingChichaDataCommand extends Command
{
    // the name of the command (the part after "php bin/console app:scraping:chicha")
	// composer dump-autoload
    protected static $defaultName = 'app:scraping:chicha';
    protected static $defaultDescription = 'Pour recupérer les données chicha et catégorie et les insérer dans la base de donnée';

    private $entityManager;
    private $categoryRepository;
    private $marqueRepository;
    private $sousCategoryRepository ;
    private $slugger; 

    public function __construct( EntityManagerInterface $entityManager, CategoryRepository $categoryRepository, SousCategoryRepository $sousCategoryRepository ,MarqueRepository $marqueRepository,SluggerInterface $slugger )
    {
        $this->entityManager = $entityManager;
        $this->categoryRepository = $categoryRepository;
        $this->sousCategoryRepository = $sousCategoryRepository;
        $this->marqueRepository = $marqueRepository;
        $this->slugger = $slugger ;

        parent::__construct();
    }

    protected function configure(): void
    {
        $this
            ->setDescription('Scraping du site el Badia')
            ->setHelp('Pour recupérer les données chicha et catégorie et les insérer dans la base de donnée') 
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        // outputs multiple lines to the console (adding "\n" at the end of each line)
        $output->writeln([
            'Etape 1 récupération des catégories',
            '============',
            '',
        ]);

        // $this->getCategory();

        $output->writeln([
            'Etape 2 récupération des produits',
            '============',
            '',
        ]);

        // $this->getProduitByCat();
        
        $idcat      = 1;
        $idSousCat  = 1 ;

        // $this->addProduit($idcat, $idSousCat);
        // $this->addFabriquant();

        return Command::SUCCESS;
    }

    public function getCategory(){
        
        //ETAPE 1
        $html = HtmlDomParser::file_get_html('https://www.el-badia.com/fr/');
        $topmenue = $html->find('div[id=block_top_menu]');

        foreach($topmenue[0]->find( 'ul' ) as $ul)
        {
            $count = 0;

            foreach($ul->find( ' li ' ) as $li)
            {
               $count++;

               $categorie = new Category();
               $categorie->setNom($li->plaintext);
               $categorie->setSlug( $this->slugger->slug( $li->text() ) );
               $categorie->setContent( $li->children(0)->href);

               $this->entityManager->persist($categorie);
               $this->entityManager->flush();
            }
        }
    }

    public  function getProduitByCat(){
        $categories = $this->categoryRepository->findAll();

        foreach ($categories as $categorie){

            $idcat  =  $categorie->getId();
            $urlval =  $categorie->getContent();

            //ETAPE 2
            $html = HtmlDomParser::file_get_html($urlval);
            $divlistproduit = $html->find('div[id=axfilterresult]');

            foreach($divlistproduit[0]->find( 'ul' ) as $ul)
            {
                foreach($ul->find( ' li ' ) as $li)
                {
                   /* $produitnanus = $li->find('div[class=product-manu]');
                    if (is_array($produitnanus) && count($produitnanus)>0) {
                        $produitnanusval =   str_replace("'", '',$produitnanus[0]->plaintext );
                    }*/

                    $produitname = $li->find('a[class=product-name]');
                    if (is_array($produitname) && count($produitname)>0) {
                        $produitnameval =   str_replace("'", '',$produitname[0]->plaintext );
                    }

                    $productdesc = $li->find('p[class=product-desc]');
                    if (is_array($productdesc) && count($productdesc)>0) {
                        $productdescval =   str_replace("'", '',$productdesc[0]->plaintext );
                    }

                    $productprice = $li->find('span[class=price product-price]');
                    if (is_array($productprice) && count($productprice)>0) {
                        $productpriceval = $productprice[0]->plaintext;
                    }

                    $productimg = $li->find('img');
                    if (is_array($productimg) && count($productimg)>0) {
                        $productimgval = $productimg[0]->attr['data-src'];
                    }

                    $produit = new Product();
                    $produit->setNom($produitnameval);
                    $produit->setSlug(make_slug($produitnameval));
                    $produit->setContent($productdescval);
                    $produit->setPrice(intval($productpriceval));
                    $produit->setPriceHT(intval($productpriceval));
                    $produit->setImage($productimgval);
                    $produit->setTaille(0);
                    $produit->setVase('');
                    $produit->setTuyau('');
                    $produit->setFixation('');
                    $produit->setColor($this->colorRepository->find(1));
                    $produit->setCategory($this->categoryRepository->find($idcat));

                    $this->entityManager->persist($produit);
                    $this->entityManager->flush();
                }
            }
        }


    }

    public function addProduit($idcat, $idSousCat)
    {
        $category       = $this->categoryRepository->find(2) ;
        $sousCat        = $this->sousCategoryRepository->find(27) ;
        $fabriquants    = $this->marqueRepository->findAll() ;
        
        $urlval =  "https://www.el-badia.com/fr/31-gout"; //https://www.el-badia.com/fr/30-naturels
       
        $html = HtmlDomParser::file_get_html($urlval);
        $divlistproduit = $html->find('div[id=axfilterresult]');
        
        foreach( $divlistproduit[0]->find('ul') as $ul )
        {
            foreach( $ul->find('li') as $li )
            {
                $produitmarque = $li->find('div[class=product-manu]');

                if ( count($produitmarque) > 0) {
                    $produitmarqueval =   str_replace("'", '',$produitmarque[0]->text() );
                    $fabriquant = $this->marqueRepository->findOneByNom($produitmarqueval);
                }

                $produitname = $li->find('a[class=product-name]'); 
                if ( count($produitname) > 0 ) {
                    $produitnameval =   $produitname[0]->text();
                    $produitSlug = strtolower( $this->slugger->slug($produitnameval) ) ;
                }

                $productprice = $li->find('span[class="price product-price"]');
                if ( count($productprice) > 0 ) {
                    $prix = (float)$productprice[0]->text();
                    $productpriceval = number_format( $prix, 2, ',', ' ' );
                }
                
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
                $produit->setMarque($fabriquant);
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
                $produit->setEnStock(1);

                // dd($produit);
                $this->manager->persist($produit);
                $this->manager->flush();
            } // FIn foreach
        } // FIn foreach
    }

    public function addFabriquant()
    {
        $urlval =  "https://www.el-badia.com/fr/40-chicha-classique?p=8"; //https://www.el-badia.com/fr/30-naturels
       
        $html = HtmlDomParser::file_get_html($urlval);
        $divlistproduit = $html->find('div[id=axfilterresult]');
        
        $allFabriquant = $this->marqueRepository->findAll() ;

        $all_fabriquant_bdd = [];

        foreach( $allFabriquant as $fab )
        {
            $all_fabriquant_bdd[] = $fab->getNom();
        }
  
        foreach( $divlistproduit[0]->find('ul') as $ul )
        {
            foreach( $ul->find('li') as $li )
            {
                $produitmarque = $li->find('div[class=product-manu]');
                if ( count($produitmarque) > 0) {
                    $produitmarqueval =   str_replace("'", '',$produitmarque[0]->text() );
                }

                if( !in_array($produitmarqueval, $all_fabriquant_bdd) ) // Si pas présent on rajoute
                {
                    if( !empty($produitmarqueval) ){
                        $marque = new Marque();
                        $marque->setNom($produitmarqueval);
                        $marque->setType("2");

                        $this->entityManager->persist($marque);
                        $this->entityManager->flush();
                    }
                }
            } // FIn foreach
        } // FIn foreach
    }

    public function AttributionSousCategory(): Response
    {
        $cats = $this->categoryRepo->findAll();
        $sous = $this->sousCategoryRepo->findAll();
        $produits = $this->repoProduct ->findAll() ;

        foreach ($produits as $produit) {
            foreach ($sous as $s) {
                if ($produit->getCategory()->getNom() == $s->getNom()) {
                    $produit->setSousCategory($s);

                    $this->manager->persist($produit);
                }
            }
        }

        $result = $this->manager->flush();

        return $result ;
    }


}


