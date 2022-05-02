<?php

namespace App\Sources;

use App\Scraper\Contracts\SourceInterface;

class swiatksiazki implements SourceInterface

{

    public function getUrl(): string
    {
        return 'https://www.swiatksiazki.pl/ksiazki/ksiazki-3799.html';
    }

    public function getName(): string
    {
        return 'Swiat Ksiazki';
    }

    public function getWrapperSelector(): string
    {
        return 'main.page-main';
    }

    public function getTitleSelector(): string
    {
        return 'a.product-item-link';
    }

    public function getAuthorSelector(): string
    {
        return 'span.product-item-author a';
    }

    public function getPriceSelector(): string
    {
        return 'span.price-wrapper';
    }






}
