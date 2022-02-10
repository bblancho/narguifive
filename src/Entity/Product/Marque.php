<?php

namespace App\Entity\Product;

use App\Repository\MarqueRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=MarqueRepository::class)
 */
class Marque
{
    public const TYPE_FABRIQUANT = [
        1 => 'Aucun',
        2 => "Chicha",
        3 => "Goût chicha",
        4 => 'E-liquide',
    ];

    public const STATUS_DEFAULT_TYPE_FABRIQUANT = 1 ; // Aucun
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nom;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $type = self::STATUS_DEFAULT_TYPE_FABRIQUANT;

    /**
     * @ORM\OneToMany(targetEntity=Product::class, mappedBy="marque")
     */
    private $products;

    public function __construct()
    {
        $this->products = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): self
    {
        $this->type = $type;

        return $this;
    }
    public function getTypeToString(): ?string
    {
        return $this->type ? self::TYPE_FABRIQUANT[$this->type] : null ;
    }

    /**
     * @return Collection|Product[]
     */
    public function getProducts(): Collection
    {
        return $this->products;
    }

    public function addProduct(Product $product): self
    {
        if (!$this->products->contains($product)) {
            $this->products[] = $product;
            $product->setMarque($this);
        }

        return $this;
    }

    public function removeProduct(Product $product): self
    {
        if ($this->products->removeElement($product)) {
            // set the owning side to null (unless already changed)
            if ($product->getMarque() === $this) {
                $product->setMarque(null);
            }
        }

        return $this;
    }
}
