<?php

namespace App\Repository;

use App\Service\Search;
use App\Entity\Product\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use phpDocumentor\Reflection\Types\Integer;

/**
 * @method Product|null find($id, $lockMode = null, $lockVersion = null)
 * @method Product|null findOneBy(array $criteria, array $orderBy = null)
 * @method Product[]    findAll()
 * @method Product[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Product::class);
    }

    /**
     * @return Product[] Returns an array of Product objects
     */
    public function findBySearch(Search $search)
    {
        $query = $this->createQueryBuilder('p')
            ->select('c','p')
            ->join('p.category', 'c') // liasion entre produit et Catégorie
            ->select('sc','p')
            ->join('p.sousCategory', 'sc') // liaison entre produit et sous-catégorie
        ;

        if( !empty( $search->categories ) ){
            $query = $query
                ->andWhere('c.id  = :categories')
                ->setParameter('categories', $search->categories ) ;
        }

        if( !empty($search->souscategory) ){
            $query = $query
                ->andWhere('sc.id IN (:souscategories)')
                ->setParameter('souscategories', $search->souscategory ) ;
        }

        if( !empty($search->string ) ){
            $query = $query
                ->andWhere('p.nom LIKE :string')
                ->setParameter('string', "%{$search->string}%" ) ;
        }

        $query = $query->addOrderBy('p.id', 'DESC') ;

        return $query->getQuery()->getResult() ;

    }

    /**
     * @return void
     */

    public function getPaginatedProducts($mypage,$limit,$filter=null, $tri=null, $disponibilite=null, $cat=null){
        $query=$this->createQueryBuilder('p')
        ->orderBy('p.id');

        if($filter != null){
            $query->andWhere('p.marque IN(:marqs)')
            ->setParameter(':marqs', array_values($filter));
        }

        if($disponibilite !=null){
            $query->andWhere('p.en_stock IN (:value)')
            ->setParameter(':value', array($disponibilite));
        }

        if($cat !=null){
            $query->andWhere('p.sousCategory =:value')
            ->setParameter(':value', $cat);
        }

        if ($tri != null){
            if($tri=='name:asc'){
                $query->orderBy('p.nom', 'asc');
            }
            elseif($tri=='name:desc'){
                $query->orderBy('p.nom', 'desc');
            }
            elseif($tri=='price:asc'){
                $query->orderBy('p.price', 'asc');
            }
            elseif($tri=='price:desc'){
                $query->orderBy('p.price', 'desc');
            }
            elseif($tri=='reference:asc'){
                $query->orderBy('p.id', 'asc');
            }
            elseif($tri=='reference:desc'){
                $query->orderBy('p.id', 'desc');
            }
            elseif($tri=='quantity:desc'){
                $query->orderBy('p.quantite', 'desc');
            }
        }else{
            $query->orderBy('p.quantite', 'desc');
        }

        $query->setFirstResult( ($mypage * $limit) - $limit) // indice du curseur dans le tableau
        ->setMaxResults($limit);

        return $query->getQuery()->getResult();
    }

    /**
     * @return void
     */
    public function getTotalProducts($filter=null, $disponibilite=null, $cat=null)
    {
        $query=$this->createQueryBuilder('p')
            ->select('COUNT(p)');

        if($filter != null){
            $query->andWhere('p.marque IN(:marqs)')
            ->setParameter(':marqs', array_values($filter));
        }
        if($disponibilite != null){
            $query->andWhere('p.en_stock IN(:value)')
            ->setParameter(':value', array($disponibilite));
        }
        if($cat != null){
            $query->andWhere('p.sousCategory = :value')
            ->setParameter(':value', $cat);
        }
        return $query->getQuery()->getSingleScalarResult();
    }

    /**
     * Nombre de produit en BDD
     * @return integer
     */
    public function countTotalProduct()
    {
        return $this->createQueryBuilder('p')
            ->select( " COUNT(p.id) " )
            ->getQuery()
            ->getSingleScalarResult() // return une valeur(int, string) jamais de tableau ou objet 
        ;
    }

    /**
     * Nombre total de produit par catégorie
     * @return integer
     */
    public function countProductsByCategory($idCat)
    {
        $query = $this->createQueryBuilder('p')
            ->select( " COUNT(p.id) " )
            ->innerJoin('p.category', 'c')
            ->where('p.category = :id')
            ->setParameter('id', $idCat)
            ->getQuery()
        ;

       return $query->getSingleScalarResult() ;
    }

    /**
     * Nombre total de produit publié par catégorie
     * @return integer
     */
    public function countProductsPublishByCategory($idCat)
    {
        $query = $this->createQueryBuilder('p')
            ->select( " COUNT(p.id) " )
            ->innerJoin('p.category', 'c')
            ->where('p.category = :id')
            ->andWhere('p.publie = 1 ')
            ->setParameter('id', $idCat)
            ->getQuery()
        ;

        return $query->getSingleScalarResult() ;
    }

    /**
     * Produits publiés par catégorie
     * @return integer
     */
    public function productsPublishByCategory($idCat)
    {
        $query = $this->createQueryBuilder('p')
            ->innerJoin('p.category', 'c')
            ->where('p.category = :id')
            ->andWhere('p.publie = 1 ')
            ->setParameter('id', $idCat)
            ->getQuery()
        ;

        return $query->getResult() ;
    }

    /** Pagination ***/
    public function getPaginateProduits(int $page = 1 , int $nbElements = 9){
        $query = $this->createQueryBuilder('p')
            ->OrderBy('p.id', "desc")
            ->setFirstResult( ($page - 1) * $nbElements) // indice du curseur dans le tableau
            ->setMaxResults($nbElements)
        ;

        return $query->getQuery()->getResult() ;
    }
    // $produits = $this->repoProduct->findBy(
            //     array(),
            //     array('id' => 'DESC'),    // $orderBy
            //     null,                        // $limit
            //     0                          // $offset
            // );


}
