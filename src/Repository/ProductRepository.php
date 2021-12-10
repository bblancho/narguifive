<?php

namespace App\Repository;

use App\Service\Search;
use App\Entity\Product\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

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
    
     // $produits = $this->repoProduct->findBy(
            //     array(),
            //     array('id' => 'DESC'),    // $orderBy
            //     null,                        // $limit
            //     0                          // $offset
            // );

    /*
    public function findOneBySomeField($value): ?Product
    {
        return $this->createQueryBuilder('p')
            ->andWhere('p.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
