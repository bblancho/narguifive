<?php

namespace App\Controller\Admin;

use App\Form\ProductType;
use PHPUnit\Util\Exception;
use App\Entity\Product\Product;
use App\Repository\MarqueRepository;
use App\Repository\ProductRepository;
use Doctrine\Persistence\ManagerRegistry;
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
class ProduitController extends AbstractController
{
    public function __construct(ManagerRegistry $doctrine, ProductRepository $productRepository, SluggerInterface $slugger)
    {
        $this->doctrine = $doctrine ;
        $this->productRepository = $productRepository ;
        $this->slugger = $slugger ;
    }
    
    #[Route('/admin/produit/{id}', name: 'admin_produit_show', methods: ['GET'])]
    /**
     * @param integer $id
     * @return Response
     */
    public function show(int $id): Response
    {
        $produit  = $this->productRepository->find($id) ;
  
        if ( !$produit ) {
            $this->addFlash('error', "Aucune produit trouvé.");
            $this->redirectToRoute('admin_gestion') ;
        }

        return $this->renderForm('admin/product/produit.html.twig', compact('produit') ) ;
    }

    #[Route('/admin/produit/edit/{id?0}', name: 'admin_produit_edit', methods: ['POST', 'GET'])]
    /**
     * @param Request $request
     * @param integer|null $id
     * @return Response
     */
    public function update(Request $request, int $id = null): Response
    {
        $produit = new product();

        if ( $id && $id > 0) {
            $produit = $this->productRepository->find($id);
        }

        $form = $this->createForm(ProductType::class, $produit);
        $form->handleRequest($request);
        
        if ( $form->isSubmitted() && $form->isValid() ) {
            $em = $this->doctrine->getManager();

            // Création d'un nouveau produit
            if( $id == 0 ){
                $em->persist($produit);
                $message = "le produit a bien été créé avec succès.";
            } else{
                $message = "le produit a bien été mis à jour.";  // MAJ
            }
            
            $this->addFlash('success', $message);

            $em->flush();

            return $this->redirectToRoute('admin_show_produit', array(
                'id' => $produit->getId(),
            ) );
        }

        return $this->renderForm('admin/product/ajout.html.twig', [
            'produit' => $produit,
            'form' => $form
        ]);
    }

    #[Route('/admin/produit/delete/{id}', name: 'admin_produit_delete', methods: ['GET', 'POST'])]
    /**
     * @param Product $produit
     * @return Response
     */
    public function delete(Product $produit): Response
    {
        try {
            $em = $this->doctrine->getManager() ;
            $em->remove($produit) ;

            $em->flush();

        } catch (Exception $e) {
            $this->addFlash('danger', $e);

            return $this->redirectToRoute('admin_gestion');
        }

        $this->addFlash('success', 'Produit supprimé.');
        
        return $this->redirectToRoute('admin_gestion');
    }

    
}
