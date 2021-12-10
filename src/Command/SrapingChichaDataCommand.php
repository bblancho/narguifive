<?php
namespace App\Command;

use App\Entity\Product\Category;
use App\Entity\Product\Color;
use App\Entity\Product\Product;
use App\Repository\CategoryRepository;
use App\Repository\ColorRepository;
use App\Repository\ProductRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class SrapingChichaDataCommand extends Command
{
    // the name of the command (the part after "php bin/console app:scraping:chicha")
	// composer dump-autoload
    protected static $defaultName = 'app:scraping:chicha';
    protected static $defaultDescription = 'Pour recupérer les données chicha et catégorie et les insérer dans la base de donnée';

    private $entityManager;
    private $categoryRepository;
    private $productRepository;
    private $colorRepository;

    public function __construct( EntityManagerInterface $entityManager, CategoryRepository $categoryRepository, ProductRepository $productRepository, ColorRepository $colorRepository)
    {

        $this->entityManager = $entityManager;
        $this->categoryRepository = $categoryRepository;
        $this->productRepository = $productRepository;
        $this->colorRepository = $colorRepository;

        if ( empty( $this->colorRepository->find(1) ) ) {
            $color = new Color();
            $color->setRef('test');
            $color->setTitle('test');

            $this->entityManager->persist($color);
            $this->entityManager->flush();
        }

        parent::__construct();
    }

    protected function configure(): void
    {
    	$this->setDescription('scraping du site el vadia')
        ->setHelp('Pour recupérer les données chicha et catégorie et les insérer dans la base de donnée');
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        // outputs multiple lines to the console (adding "\n" at the end of each line)
        $output->writeln([
            'Etape 1 récupération des catégories',
            '============',
            '',
        ]);

        $this->getCategory();

        $output->writeln([
            'Etape 2 récupération des produits',
            '============',
            '',
        ]);

        $this->getProduitByCat();

        return Command::SUCCESS;

        // or return this if some error happened during the execution
        // (it's equivalent to returning int(1))
        // return Command::FAILURE;

        // or return this to indicate incorrect command usage; e.g. invalid options
        // or missing arguments (it's equivalent to returning int(2))
        // return Command::INVALID
    }


    public function getCategory(){
        
        //ETAPE 1
        $html = file_get_html('https://www.el-badia.com/fr/');
        $topmenue = $html->find('div[id=block_top_menu]');

        foreach($topmenue[0]->find( 'ul' ) as $ul)
        {
            $count = 0;

            foreach($ul->find( ' li ' ) as $li)
            {
               $count++;

               $categorie = new Category();
               $categorie->setNom($li->plaintext);
               $categorie->setSlug(make_slug($li->plaintext));
               $categorie->setContent( $li->children(0)->href);

               $this->entityManager->persist($categorie);
               $this->entityManager->flush();

               	if ($count >= 4) {
                   break;
               	}
            }
        }
    }



    public  function getProduitByCat(){

        //récuperation des categories
        $categories = $this->categoryRepository->findAll();

        foreach ($categories as $categorie){

            $idcat  =  $categorie->getId();
            $urlval =  $categorie->getContent();

            //ETAPE 2
            $html = file_get_html($urlval);
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

}


