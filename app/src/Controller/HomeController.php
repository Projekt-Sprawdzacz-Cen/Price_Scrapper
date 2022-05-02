<?php

namespace App\Controller;

use App\Entity\Source;
use App\Scraper\Scraper;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    private Scraper $scraper;

    public function __construct(Scraper $scraper)
    {
        $this->scraper = $scraper;
    }

    /**
     * @Route("/fetch/{id}", name="fetch")
     */
    public function fetch(Source $source)
    {
        $books = $this->scraper->scrap($source);

        return $this->json($books->toArray());
    }
}