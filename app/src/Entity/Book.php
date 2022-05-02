<?php

namespace App\Entity;

use App\Repository\BookRepository;
use Doctrine\ORM\Mapping as ORM;
use ApiPlatform\Core\Annotation\ApiResource;

#[ORM\Entity(repositoryClass: BookRepository::class)]
#[ApiResource]
class Book implements \JsonSerializable
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $title;

    #[ORM\Column(type: 'string', length: 255)]
    private $author;

    #[ORM\Column(type: 'decimal', precision: 10, scale: 2)]
    private $price;

    #[ORM\Column(type: 'datetime_immutable')]
    private $last_update_at;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getAuthor(): ?string
    {
        return $this->author;
    }

    public function setAuthor(string $author): self
    {
        $this->author = $author;

        return $this;
    }

    public function getPrice(): ?string
    {
        return $this->price;
    }

    public function setPrice(string $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getLastUpdateAt(): ?\DateTimeImmutable
    {
        return $this->last_update_at;
    }

    public function setLastUpdateAt(\DateTimeImmutable $last_update_at): self
    {
        $this->last_update_at = $last_update_at;

        return $this;
    }
    public function jsonSerialize()
    {
        return [
            'id'=>$this->getId(),
            'title' => $this->getTitle(),
            'author' => $this->getAuthor(),
            'price' => $this->getPrice(),
            'last_update_at' => $this->getLastUpdateAt(),
        ];
    }
}
