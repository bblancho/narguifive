<?php

namespace App\Repository;

use App\Entity\Product\Category;
use App\Entity\Product\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Category|null find($id, $lockMode = null, $lockVersion = null)
 * @method Category|null findOneBy(array $criteria, array $orderBy = null)
 * @method Category[]    findAll()
 * @method Category[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CategoryRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Category::class);
    }

    /**
     * @return Category[] Returns an array of Category objects
     *
     */
    public function getAllCategory()
    {
        $query = $this->createQueryBuilder('c')->getQuery()->getResult() ;

        return $query;
    }

    /**
     * @return Category[] Returns an array of products by Category objects
     *
     */
    public function findProductsByCategory($id): array
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.id = :id')
            ->setParameter('id', $id)
            ->join('c.products', 'p') // liasion entre Catégorie et les produits
            ->andWhere('c.id = :id')
            ->orderBy('p.id', 'DESC')
            ->getQuery()
            ->getResult()
        ;
    }

    /**
     * @return Product[] Returns an array of products by Category objects
     */
    public function getProductsPublish($id): array
    {
        $query = $this->createQueryBuilder('c')
            ->andWhere('c.id = :id')
            ->setParameter('id', $id)
            ->join('c.products', 'p') // liasion entre Catégorie et les produits
            ->andWhere('p.publie = 1')
            ->orderBy('p.createdAt', 'DESC')
            ->getQuery()
        ;

        return $query->getResult();
    }



    // $qb = $this->createQueryBuilder('c')


}
