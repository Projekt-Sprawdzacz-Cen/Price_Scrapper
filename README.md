# Price_Scrapper

This project was created for the purpose of passing ZMP course (Zaawansowane metody
programowania - Advanced methods of programming)

### Author:
* Jakub Engielski

### Technologies
* PHP 8.0
* Symfony 5.3.9
* MariaDB (MySQL)
* Symfony/Panther
* Docker

### Uruchomienie aplikacji w środowisku deweloperskim

**1. Pobranie projektu z repozytorium**
```
git clone https://github.com/Projekt-Sprawdzacz-Cen/Price_Scrapper.git
```

```
cd Price_Scrapper
```
**2. Konfiguracja pliku .env**
```
cp .env .env.local
```

**3. Uruchomienie kontenerów dockerowych**
```
docker-compose up -d --build
```

**4. Pobranie zależności Composer**
```
docker-compose exec php composer install
```
### Migracje
**Utworzenie migracji**
```
docker exec -it php /bin/bash
bin/console doctrine:migrations:diff
bin/console doctrine:migrations:migrate
```

### Udostępnione porty

***Podgląd do api jest dostępny pod:***
```
http://localhost:8080/api
```

***phpMyAdmin powinien być dostępny pod:***
```
http://localhost:8081
```

### Dane logowania do phpMyAdmin
```
Serwer: database
Użytkownik: user
Hasło: 123qwe

Nazwa bazy danych: pricescrapperdb
```

### Przydatne komendy
**Docker - uruchomienie kontenerów**
```
docker-compose up -d
```

**Docker - zatrzymanie kontenerów**
```
docker-compose stop
```

**Docker - zatrzymanie i usunięcie kontenerów**
```
docker-compose down
```
