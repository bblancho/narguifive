<?php

namespace App\Entity\Product;

use App\Entity\Product\Color;
use Doctrine\ORM\Mapping as ORM;
use App\Entity\Product\ImageProduct;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;
use Vich\UploaderBundle\Entity\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use Symfony\Component\Validator\Constraints as Assert;
use App\Repository\ProductRepository;


/**
 * @ORM\Entity(repositoryClass=ProductRepository::class)
 * @Vich\Uploadable
 */
class Product
{
    public const QTE_GRAMME = [
        1 => 0,
        2 => 3,
        3 => 6,
        4 => 10,
    ];

    public const DEFAULT_QTE_GRAMME = 1 ; // Aucun

    public const VAL_DEFAULT = 0;
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
     * @ORM\Column(type="text")
     */
    private $content;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $slug;

    /**
     * @ORM\Column(type="string", length=255,nullable=true)
     * @var string
     */
    private $image;

    /**
     * @Vich\UploadableField(mapping="products_images", fileNameProperty="image")
     * @var File
     */
    private $imageFile;

    /**
     * @ORM\Column(type="float")
     */
    private $price;

    /**
     * @ORM\Column(type="float")
     */
    private $priceHT;

    /**
     * @ORM\ManyToOne(targetEntity=Category::class, inversedBy="products")
     *
     */
    private $category;

    /**
     * @ORM\ManyToOne(targetEntity=SousCategory::class, inversedBy="products")
     *
     */
    private $sousCategory;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $promotion = self::VAL_DEFAULT ;

    /**
     * @ORM\Column(type="boolean", nullable=true)
     */
    private $nouveaute  = self::VAL_DEFAULT ;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $taille;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $vase;

    /**
     * @ORM\Column(type="string", length=255 , nullable=true)
     */
    private $tuyau;

    /**
     * @ORM\Column(type="string", length=255 , nullable=true)
     */
    private $fixation;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $autre;

    /**
     * @ORM\ManyToOne(targetEntity=Color::class, inversedBy="products")
     */
    private $color;

    /**
     * @ORM\Column(type="boolean")
     */
    private $publie = self::VAL_DEFAULT ;

    /**
     * @ORM\OneToMany(targetEntity=ImageProduct::class, mappedBy="product")
     */
    private $imageProduct;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isBest;

    /**
     * @ORM\ManyToOne(targetEntity=Marque::class, inversedBy="products")
     */
    private $marque;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $gramme = self::DEFAULT_QTE_GRAMME ;

    /**
     * @ORM\OneToMany(targetEntity=Picture::class, mappedBy="produit", orphanRemoval=true)
     */
    private $pictures;

    public function __construct()
    {
        $this->imageProduct = new ArrayCollection();
        $this->pictures = new ArrayCollection();
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

    public function setContent(string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage( ?string $image ): self
    {
        $this->image = $image;

        return $this;
    }

    public function getImageFile()
    {
        return $this->imageFile;
    }

    public function setImageFile( File $image = null): self
    {
        $this->imageFile = $image;

        if ($image) {
            $this->updated_at = new \DateTime('now');
        }

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(float $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getPriceHT(): ?float
    {
        return $this->priceHT;
    }

    public function setPriceHT(float $priceHT): self
    {
        $this->priceHT = $priceHT;

        return $this;
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

    public function getSousCategory(): ?SousCategory
    {
        return $this->sousCategory;
    }

    public function setSousCategory(?SousCategory $sousCategory): self
    {
        $this->sousCategory = $sousCategory;

        return $this;
    }

    public function getPromotion(): ?bool
    {
        return $this->promotion;
    }

    public function setPromotion(?bool $promotion): self
    {
        $this->promotion = $promotion;

        return $this;
    }

    public function getNouveaute(): ?bool
    {
        return $this->nouveaute;
    }

    public function setNouveaute(?bool $nouveaute): self
    {
        $this->nouveaute = $nouveaute;

        return $this;
    }

    public function getTaille(): ?float
    {
        return $this->taille;
    }

    public function setTaille(?float $taille): self
    {
        $this->taille = $taille;

        return $this;
    }

    public function getVase(): ?string
    {
        return $this->vase;
    }

    public function setVase(?string $vase): self
    {
        $this->vase = $vase;

        return $this;
    }

    public function getTuyau(): ?string
    {
        return $this->tuyau;
    }

    public function setTuyau(?string $tuyau): self
    {
        $this->tuyau = $tuyau;

        return $this;
    }

    public function getFixation(): ?string
    {
        return $this->fixation;
    }

    public function setFixation(?string $fixation): self
    {
        $this->fixation = $fixation;

        return $this;
    }

    public function getAutre(): ?string
    {
        return $this->autre;
    }

    public function setAutre(?string $autre): self
    {
        $this->autre = $autre;

        return $this;
    }

    public function getColor(): ?Color
    {
        return $this->color;
    }

    public function setColor(?Color $color): self
    {
        $this->color = $color;

        return $this;
    }

    public function getPublie(): ?bool
    {
        return $this->publie;
    }

    public function setPublie(bool $publie): self
    {
        $this->publie = $publie;

        return $this;
    }


    /**
     * @return Collection|ImageProduct[]
     */
    public function getImageProduct(): Collection
    {
        return $this->imageProduct;
    }

    public function addImageProduct(ImageProduct $imageProduct): self
    {
        if ( !$this->imageProduct->contains($imageProduct) ) {
            $this->imageProduct[] = $imageProduct;
            $imageProduct->setProduct($this);
        }

        return $this;
    }

    public function removeImageProduct(ImageProduct $imageProduct): self
    {
        if ($this->imageProduct->removeElement($imageProduct)) {
            // set the owning side to null (unless already changed)
            if ( $imageProduct->getProduct() === $this ) {
                $imageProduct->setProduct(null);
            }
        }

        return $this;
    }

    public function getIsBest(): ?bool
    {
        return $this->isBest;
    }

    public function setIsBest(bool $isBest): self
    {
        $this->isBest = $isBest;

        return $this;
    }

    public function getMarque(): ?Marque
    {
        return $this->marque;
    }

    public function setMarque(?Marque $marque): self
    {
        $this->marque = $marque;

        return $this;
    }

    public function getGramme(): ?int
    {
        return $this->gramme;
    }

    public function setGramme(?int $gramme): self
    {
        $this->gramme = $gramme;

        return $this;
    }

    public function getGrammeToString(): ?string
    {
        return $this->gramme ? self::QTE_GRAMME[$this->gramme] : null ;
    }

    /**
     * @return Collection|Picture[]
     */
    public function getPictures(): Collection
    {
        return $this->pictures;
    }

    public function addPicture(Picture $picture): self
    {
        if (!$this->pictures->contains($picture)) {
            $this->pictures[] = $picture;
            $picture->setProduit($this);
        }

        return $this;
    }

    public function removePicture(Picture $picture): self
    {
        if ($this->pictures->removeElement($picture)) {
            // set the owning side to null (unless already changed)
            if ($picture->getProduit() === $this) {
                $picture->setProduit(null);
            }
        }

        return $this;
    }
    
}
