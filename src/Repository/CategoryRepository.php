<?php

namespace App\Repository;

use App\Entity\Product\Category;
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

    public function getAllCategory()
    {
        $query = $this->createQueryBuilder('c')->getQuery()->getResult() ;

        return $query;
    }

    /**
     * @return Category[] Returns an array of products by Category objects
     *
     */
    public function findProductsByCategory($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.slug = :slug')
            ->setParameter('slug', $value)
            ->join('c.products', 'p') // liasion entre Catégorie et les produits
            ->orderBy('p.id', 'DESC')
            ->getQuery()
            ->getResult()
        ;
    }

    /**
     * @return Category[] Returns an array of products by Category objects
     *
     */
    public function allProductsByCategory($idCategory)
    {
        $query = $this->createQueryBuilder('c')
            ->join('c.products', 'p') // liasion entre Catégorie et les produits
            ->andWhere('p.category = :idCat')
            ->setParameter('idCat', $idCategory)
            ->orderBy('p.id', 'DESC')
            ;

        return $query->getQuery()->getResult();
    }

    /**
     * @return integer
     */
    public function getTotalProductsByCategory($idCategory){
        $query = $this->createQueryBuilder('c')
            ->andWhere('c.id = :id')
            ->setParameter('id', $idCategory)
            ->join('c.products', 'p') // liasion entre Catégorie et les produits
            ->orderBy('p.id', 'DESC')
            ->select('COUNT(c)');

        return $query->getQuery()->getSingleScalarResult();
    }


    /*
    public function findOneBySomeField($value): ?Category
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
