<?php

namespace App\Controller\Admin;

use PHPUnit\Util\Exception;
use App\Form\SousCategorieType;
use App\Entity\Product\SousCategory;
use App\Repository\ProductRepository;
use Doctrine\Persistence\ManagerRegistry;
use App\Repository\SousCategoryRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @IsGranted("ROLE_ADMIN", message="Vous n'avez pas le droit d'accéder à cette ressourece.")
 */
class SousCategorieController extends AbstractController
{
    public function __construct(ManagerRegistry $doctrine,ProductRepository $productRepository, 
       SousCategoryRepository $sousCategoryRepository, SluggerInterface $slugger)
    {
        $this->doctrine = $doctrine ;
        $this->productRepository = $productRepository ;
        $this->sousCategoryRepository = $sousCategoryRepository;
        $this->slugger = $slugger ;
   
    }
    
    #[Route('/admin/sous-categorie', name: 'admin_sousCat', methods: ['GET'])]
    public function index(Request $request, PaginatorInterface $paginator): Response
    {
        $sousCategory = $this->sousCategoryRepository->findAll();

        // Paginate the results of the query
        $sousCategory = $paginator->paginate(
            $sousCategory, // Doctrine Query, not results
            $request->query->getInt('page', 1), /** page number */
            10 // limit per page
        );

        return $this->render('admin/sous-categorie/index.html.twig', [
            'sousCategory'   => $sousCategory, 
        ]);
    }

    #[Route('/admin/sous-categorie/{id}/produits', name: 'admin_sousCat_produit', methods: ['GET'])]
    public function productsBySubCategory(Request $request, PaginatorInterface $paginator, int $id ): Response
    {
        $sousCategorie = $this->sousCategoryRepository->find($id) ;
  
        if ( !$sousCategorie ) {
            $this->addFlash('error', "Aucune sous-catégorie trouvée.");
            $this->redirectToRoute('admin_gestion') ;
        }
        
        // nos produits
        $nos_produits   = $sousCategorie->getProducts() ;
        $total      = $this->productRepository->countProductsByCategory( $sousCategorie->getId() ) ; // A modifier pour les sous categories
        $limit      = 15 ;
        $mypage     = (int)$request->get("page", 1) ;
        $limit      = (int)$request->get("limit", 12) ;

        // Paginate the results of the query
        $produits = $paginator->paginate(
            $nos_produits, // Doctrine Query, not results
            $mypage, /** page number */
            $limit// limit per page
        );

        return $this->render('admin/sous-categorie/show.html.twig', [
            'produits'   => $produits, 
            'total' => $total,
            'sousCategorie' => $sousCategorie,
            'mypage' => $mypage,
            'limit' => $limit,
        ]);
    }

    #[Route('/admin/sous-categorie/edit/{id?0}', name: 'admin_souCat_edit', methods: ['POST', 'GET'])]
    /**
     * @param Request $request
     * @param integer|null $id
     * @return Response
     */
    public function editeSouscategorie(Request $request, int $id = null): Response
    {
        $sousCategorie = new SousCategory();

        // On recup un objet sous-catégorie existant
        if ( $id && $id > 0) {
            $sousCategorie = $this->sousCategoryRepository->find($id) ;
        }

        $form = $this->createForm(SousCategorieType::class, $sousCategorie);
        $form->handleRequest($request);
        
        if ( $form->isSubmitted() && $form->isValid() ) {
            // $data = $form->getData() ;
       
            $em = $this->doctrine->getManager() ;

            $slugNom = $this->slugger->slug( strtolower( $form->get('nom')->getData() ) ) ;
            $sousCategorie->setSlug($slugNom);

            // Création d'une nouvelle sous-categorie
            if( $id == 0 ){
                $message = "La sous-catégorie ".$sousCategorie->getNom()." a bien été créée avec succès." ;
                $em->persist($sousCategorie);
               
            } else{
                $message = "La sous-catégorie ".$sousCategorie->getNom()." a bien été mise à jour." ;  // MAJ
            }
            
            $this->addFlash('success', $message);
            
            $em->flush();

            return $this->redirectToRoute('admin_gestion') ;
        }

        return $this->renderForm('admin/sous-categorie/ajout.html.twig', [
            'sousCategorie' => $sousCategorie,
            'form' => $form
        ]);
    }

    #[Route('/admin/sous-categorie/delete/{id}', name: 'admin_sousCat_delete', methods: ['GET', 'POST'])]
    /**
     * @param SousCategory $sousCategorie
     * @return Response
     */
    public function delete(SousCategory $sousCategorie): Response
    {
        try {
            $em = $this->doctrine->getManager() ;
            $em->remove($sousCategorie) ;

            $em->flush();

        } catch (Exception $e) {
            $this->addFlash('danger', $e);

            return $this->redirectToRoute('admin_gestion');
        }

        $this->addFlash('success', 'Sous-caégorie supprimé.');
        
        return $this->redirectToRoute('admin_gestion');
    }
    
}
