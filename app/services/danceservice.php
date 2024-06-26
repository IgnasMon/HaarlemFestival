<?php

namespace App\Services;

use App\Repositories\DanceRepository;

class DanceService { 
  private $repository;

  function getNewInstance(){ 
     $this->repository = new DanceRepository();
  }

  function getAllArtists() {
      $this->getNewInstance();
      return $this->repository->getAllArtists();
  }

  function getAllDanceEvents() {
      $this->getNewInstance();
      return $this->repository->getAllDanceEvents();
  }

  function getAllEventsByDate() {
      $this->getNewInstance();
      return $this->repository->getAllEventsByDate();
  }

  function getAllVenues() {
      $this->getNewInstance();
      return $this->repository->getAllVenues();
  }

  function getArtistById($artistId) {
      $this->getNewInstance();
      return $this->repository->getArtistById($artistId);
  }

  function getDetailPageContentByArtistId($artistId) {
      $this->getNewInstance();
      return $this->repository->getDetailPageContentByArtistId($artistId);
  }

    function getDanceEventsByArtist($artist_name) {
        $this->getNewInstance();
        return $this->repository->getDanceEventsByArtist($artist_name);
    }
    function getAllSpecialTickets() {
        $this->getNewInstance();
        return $this->repository->getAllSpecialTickets();
    }
}
