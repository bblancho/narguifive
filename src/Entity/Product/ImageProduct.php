<?php

namespace App\Entity\Product;

use App\Repository\ImageProductRepository;
use App\Entity\Product\Product;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ImageProductRepository::class)
 */
class ImageProduct
{
     /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Product::class, inversedBy="productImage")
     */
    private $product;

     /**
     * @ORM\Column(type="string", length=255)
     */
    private $image_name;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $image_size;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getProduct(): ?Product
    {
        return $this->product;
    }

    public function setProduct(?Product $product): self
    {
        $this->product = $product;

        return $this;
    }

    public function getImageName(): ?string
    {
        return $this->image_name;
    }

    public function setImageName(string $image_name): self
    {
        $this->image_name = $image_name;

        return $this;
    }

    public function getImageSize(): ?string
    {
        return $this->image_size;
    }

    public function setImageSize(string $image_size): self
    {
        $this->image_size = $image_size;

        return $this;
    }

}
