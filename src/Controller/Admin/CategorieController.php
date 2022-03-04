<?php

namespace App\Controller\Admin;

use App\Form\CategorieType;
use PHPUnit\Util\Exception;
use App\Entity\Product\Category;
use App\Repository\ProductRepository;
use App\Repository\CategoryRepository;
use Doctrine\Persistence\ManagerRegistry;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class CategorieController extends AbstractController
{
    public function __construct(ManagerRegistry $doctrine, ProductRepository $productRepository, 
        CategoryRepository $categoryRepository, SluggerInterface $slugger)
    {
        $this->doctrine = $doctrine ;
        $this->productRepository = $productRepository ;
        $this->categoryRepository = $categoryRepository ;
        $this->slugger = $slugger ;
    }
    
    #[Route('/admin/categorie/edit/{id?0}', name: 'admin_categorie_edit', methods: ['POST', 'GET'])]
    /**
     * @param Request $request
     * @param integer|null $id
     * @return Response
     */
    public function editecategorie(Request $request, int $id = null): Response
    {
        $new = true ;
        $categorie = new Category();

        if ( $id && $id > 0) {
            $new = false ;
            $categorie = $this->categoryRepository->find($id) ;
        }

        $form = $this->createForm(CategorieType::class, $categorie);
        $form->handleRequest($request);
        
        if ( $form->isSubmitted() && $form->isValid() ) {
       
            $em = $this->doctrine->getManager() ;

            //  Traitemanet de l'image
            $image = $form->get('photo')->getData() ;
            
            if( $image ) {
                
                $originalFilename = pathinfo( $image->getClientOriginalName() , PATHINFO_FILENAME );
                
                $safeFilename = $this->slugger->slug($originalFilename) ;
                $newFilename = $safeFilename.'-'.uniqid().'.'.$image->guessExtension() ;

                // Move the file to the directory where brochures are stored
                try {
                    $image->move( $this->getParameter('categorie_image'), $newFilename );
                } catch (Exception $e) {
                    $this->addFlash('danger', $e);

                    return $this->redirectToRoute('admin_gestion');
                }
                
                $categorie->setImageCate($newFilename) ;
            }

            // Création d'une nouvelle categorie
            if( $new ){
                $slugNom = $this->slugger->slug( strtolower( $form->get('nom')->getData() ) ) ;
                $categorie->setSlug($slugNom);
                $message = "La catégorie ".$categorie->getNom()." a bien été créée avec succès." ;

                $em->persist($categorie);
               
            } else{
                $message = "La catégorie ".$categorie->getNom()." a bien été mise à jour." ;  // MAJ
            }
            
            $this->addFlash('success', $message);
            
            $em->flush();

            return $this->redirectToRoute('admin_gestion') ;
        }

        return $this->renderForm('admin/categorie/ajout.html.twig', [
            'categorie' => $categorie,
            'form' => $form
        ]);
    }
    
    #[Route('/admin/categorie/{id}/produits', name: 'admin_categorie_produits', methods: ['GET'])]
    public function productsByCategory(Request $request, PaginatorInterface $paginator, int $id  ): Response
    {
        $categorie  = $this->categoryRepository->find($id) ;
  
        if ( !$categorie ) {
            $this->addFlash('error', "Aucune catégorie trouvée.");
            $this->redirectToRoute('admin_gestion') ;
        }
        
        // nos produits
        $nos_produits   = $categorie->getProducts() ;
        $total      = $this->productRepository->countProductsByCategory( $categorie->getId() ) ;
        $limit      = 15 ;
        $mypage     = (int)$request->get("page", 1) ;
        $limit      = (int)$request->get("limit", 12) ;

        // Paginate the results of the query
        $produits = $paginator->paginate(
            $nos_produits, // Doctrine Query, not results
            $mypage, /** page number */
            $limit// limit per page
        );

        return $this->render('admin/categorie/show.html.twig', [
            'produits'   => $produits, 
            'total' => $total,
            'categorie' => $categorie,
            'mypage' => $mypage,
            'limit' => $limit,
        ]);
    }

    #[Route('/admin/categorie/delete/{id}', name: 'admin_categorie_delete', methods: ['GET', 'POST'])]
    /**
     * @param Category $categorie
     * @return Response
     */
    public function delete(Category $categorie): Response
    {
        try {
            $em = $this->doctrine->getManager() ;
            $em->remove($categorie) ;
            $em->flush();

        } catch (Exception $e) {
            $this->addFlash('danger', $e);

            return $this->redirectToRoute('admin_gestion');
        }

        $this->addFlash('success', 'Suppression de la catégorie effectuée.');
        
        return $this->redirectToRoute('admin_gestion');
    }
}
