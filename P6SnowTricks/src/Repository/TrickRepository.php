<?php

namespace App\Repository;

use App\Entity\Trick;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Trick|null find($id, $lockMode = null, $lockVersion = null)
 * @method Trick|null findOneBy(array $criteria, array $orderBy = null)
 * @method Trick[]    findAll()
 * @method Trick[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class TrickRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Trick::class);
    }

    /**
     * @return Trick[] Returns an array of Trick objects
     */

    public function findBySearch($search = null, $offset=0,$limit=10)
    {
     
            return $this->createQueryBuilder('t')
                ->andWhere('t.name like :val OR t.description like :val')
                ->setParameter('val', '%' . $search . '%')
                ->setFirstResult($offset)
                ->setMaxResults($limit)
                ->orderBy('t.createDate', 'DESC')
                ->getQuery()
                ->getResult();
        } 
    /**
     * @return Trick[] Returns an array of Trick objects
     */
    public function countNumberTricks()
    {
        return $this->createQueryBuilder('t')
            ->select('COUNT(t.id) as totalTricks')
            ->getQuery()
            ->getSingleScalarResult();
    }
  
    }

