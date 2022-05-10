<?php

namespace App\Controller;

use App\Entity\Source;
use App\Entity\Book;
use App\Scraper\Scraper;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Response;

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
    public function fetch(Source $source, ManagerRegistry $doctrine): Response
    {
        $books = $this->scraper->scrap($source);
        $entityManager = $doctrine->getManager();
        foreach($books->getIterator() as $i => $item) {
            $entityManager->persist($item);
            $entityManager->flush();

        }

        return new Response('Saved new scraped books');


    }




}