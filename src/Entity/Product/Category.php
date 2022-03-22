<?php

namespace App\Entity\Product;

use App\Repository\CategoryRepository;
use Doctrine\ORM\Mapping as ORM;
use App\Entity\Product\SousCategory;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use Symfony\Component\Validator\Constraints as Assert;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=CategoryRepository::class)
 * @Vich\Uploadable
 */
class Category
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(message="Veuillez renseigner ce champ.")
     * @Assert\Length(min=2, minMessage="Votre texte doit faire au minimum  2 caractères.")
     */
    private $nom;

    /**
     * @ORM\Column(type="text", nullable=true)
     * @Assert\NotBlank(message="Veuillez renseigner ce champ.")
     * @Assert\Length(min=2, minMessage="Votre texte doit faire au minimum  2 caractères.")
     */
    private $content;

    /**
     * @ORM\Column(type="string", length=255, nullable=false, unique=false)
     * @Assert\Length(min=2, minMessage="Votre texte doit faire au minimum  2 caractères.")
     */
    private $slug;

    /**
     * @ORM\OneToMany(targetEntity=SousCategory::class, mappedBy="category")
     */
    private $sousCategory;

    /**
     * @ORM\OneToMany(targetEntity=Product::class, mappedBy="category")
     * 
     */
    private $products;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * @var string|null
     */
    private $image;

    /**
     * @Vich\UploadableField(mapping="category_images", fileNameProperty="image")
     * @Assert\File(
     *     maxSize = "2M",
     *     mimeTypesMessage = "Veuillez sélectionner une image valide"
     * )
     * @var File|null
     */
    private $imageFile;
    

    public function __construct()
    {
        $this->sousCategory = new ArrayCollection();
        $this->products = new ArrayCollection();
    }

    public function __toString()
    {
        return (string) $this->getNom() ;
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

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(?string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(?string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }

    /**
     * @return Collection|SousCategory[]
     */
    public function getSousCategory(): Collection
    {
        return $this->sousCategory;
    }

    public function addSousCategory(SousCategory $sousCategory): self
    {
        if (!$this->sousCategory->contains($sousCategory)) {
            $this->sousCategory[] = $sousCategory;
            $sousCategory->setCategory($this);
        }

        return $this;
    }

    public function removeSousCategory(SousCategory $sousCategory): self
    {
        if ($this->sousCategory->removeElement($sousCategory)) {
            // set the owning side to null (unless already changed)
            if ($sousCategory->getCategory() === $this) {
                $sousCategory->setCategory(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|null
     */
    public function getProducts(): ?Collection
    {
        return $this->products;
    }

    public function addProduct(Product $product): self
    {
        if (!$this->products->contains($product)) {
            $this->products[] = $product;
            $product->setCategory($this);
        }

        return $this;
    }

    public function removeProduct(Product $product): self
    {
        if ($this->products->removeElement($product)) {
            // set the owning side to null (unless already changed)
            if ($product->getCategory() === $this) {
                $product->setCategory(null);
            }
        }

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }

    /**
     * @return File|null
     */
    public function getImageFile(): ?File
    {
        return $this->imageFile;
    }

    /**
     * @param File|null $imageFile
     */
    public function setImageFile( ?File $imageFile = null): self
    {
        $this->imageFile = $imageFile;

        if (null !== $imageFile) {
            $this->updated_at = new \DateTime('now');
        }

        return $this;
    }


}
