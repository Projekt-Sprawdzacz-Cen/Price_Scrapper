<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use App\Repository\SourceRepository;
use App\Scraper\Contracts\SourceInterface;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: SourceRepository::class)]
#[ApiResource]
class Source implements SourceInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $url;

    #[ORM\Column(type: 'string', length: 255)]
    private $name;

    #[ORM\Column(type: 'string', length: 255)]
    private $wrapperSelector;

    #[ORM\Column(type: 'string', length: 255)]
    private $titleSelector;

    #[ORM\Column(type: 'string', length: 255)]
    private $authorSelector;

    #[ORM\Column(type: 'string', length: 255)]
    private $priceSelector;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUrl(): ?string
    {
        return $this->url;
    }

    public function setUrl(string $url): self
    {
        $this->url = $url;

        return $this;
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

    public function getWrapperSelector(): ?string
    {
        return $this->wrapperSelector;
    }

    public function setWrapperSelector(string $wrapperSelector): self
    {
        $this->wrapperSelector = $wrapperSelector;

        return $this;
    }

    public function getTitleSelector(): ?string
    {
        return $this->titleSelector;
    }

    public function setTitleSelector(string $titleSelector): self
    {
        $this->titleSelector = $titleSelector;

        return $this;
    }

    public function getAuthorSelector(): ?string
    {
        return $this->authorSelector;
    }

    public function setAuthorSelector(string $authorSelector): self
    {
        $this->authorSelector = $authorSelector;

        return $this;
    }

    public function getPriceSelector(): ?string
    {
        return $this->priceSelector;
    }

    public function setPriceSelector(string $priceSelector): self
    {
        $this->priceSelector = $priceSelector;

        return $this;
    }
}
