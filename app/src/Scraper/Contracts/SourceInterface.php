<?php
namespace App\Scraper\Contracts;

interface SourceInterface

{

    public function getUrl(): ?string;

    public function getName(): ?string;

    public function getWrapperSelector(): ?string;

    public function getTitleSelector(): ?string;

    public function getAuthorSelector(): ?string;

    public function getPriceSelector(): ?string;


}