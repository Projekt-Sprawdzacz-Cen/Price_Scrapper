<?php

namespace App\Scraper;

use App\Scraper\Contracts\SourceInterface;
use DateTimeImmutable;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Symfony\Component\DomCrawler\Crawler;
use Symfony\Component\Panther\Client;
use App\Entity\Book;

class Scraper
    {

    public function scrap(SourceInterface $source): Collection
        {
            $collection = [];
            $client = Client::createChromeClient(__DIR__ . '/../../chromedriver');
            $crawler = $client->request('GET', $source->getUrl());
            $crawler->filter($source->getWrapperSelector())->each(function (Crawler $c) use ($source, &$collection) {

                $book = new Book();

                $title = $c->filter($source->getTitleSelector())->text();
                $book->setTitle($title);
                $date = new DateTimeImmutable();
                $date->format('Y-m-d');
                $book->setLastUpdateAt($date);
                $author = $c->filter($source->getAuthorSelector())->text();
                $book->setAuthor($author);
                $price = $c->filter($source->getPriceSelector())->text();
                $price = intval(str_replace( '.', '', $price ));
                $book->setPrice($price);
                $sourceid = $source;
                $book->setSource($sourceid);
                $collection[] = $book;


            });


            return new ArrayCollection($collection);
        }
}