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

    /**
     * @return void
     */


    public function getPaginatedProducts($mypage,$limit,$filter=null, $tri=null){
        $query=$this->createQueryBuilder('p')
        ->orderBy('p.id');

        if($filter != null){
            $query->andWhere('p.marque IN(:marqs)')
            ->setParameter(':marqs', array_values($filter));
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
                $query->orderBy('p.id', 'desc');
            }
        }else{
            $query->orderBy('p.id', 'desc');
        }

        $query->setFirstResult(($mypage * $limit)-$limit)
        ->setMaxResults($limit);
        return $query->getQuery()->getResult();

    }

    /**
     * @return void
     */
    public function getTotalProducts($filter=null){
        $query=$this->createQueryBuilder('p')
        ->select('COUNT(p)');

        if($filter != null){
            $query->where('p.marque IN(:marqs)')
            ->setParameter(':marqs', array_values($filter));
        }
        return $query->getQuery()->getSingleScalarResult();
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
