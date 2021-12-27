<?php

namespace App\Entity\Product;

use App\Repository\Product\PictureRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=PictureRepository::class)
 */
class Picture
{
    public const TYPE_IMAGE = [
        1 => "Aucun",
        2 => "Catégorie",
        3 => "Produit"
    ];

    public const DEFAULT_TYPE_IMAGE = 1 ; // Aucun

    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\ManyToOne(targetEntity=Product::class, inversedBy="pictures")
     * @ORM\JoinColumn(nullable=true)
     */
    private $produit;

    /**
     * @ORM\Column(type="integer")
     */
    private $type = self::DEFAULT_TYPE_IMAGE;

    /**
     * @ORM\OneToOne(targetEntity=Category::class, inversedBy="picture", cascade={"persist", "remove"})
     */
    private $category;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getProduit(): ?Product
    {
        return $this->produit;
    }

    public function setProduit(?Product $produit): self
    {
        $this->produit = $produit;

        return $this;
    }

    public function getType(): ?int
    {
        return $this->type;
    }

    public function setType(int $type): self
    {
        $this->type = $type;

        return $this;
    }

    public function getTypeImageToString(): ?string
    {
        return $this->type ? self::TYPE_IMAGE[$this->type] : null ;
    }

    public function getCategory(): ?Category
    {
        return $this->category;
    }

    public function setCategory(?Category $category): self
    {
        $this->category = $category;

        return $this;
    }
}
