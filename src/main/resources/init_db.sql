DROP TABLE IF EXISTS city CASCADE;
DROP TABLE IF EXISTS country CASCADE;
DROP TABLE IF EXISTS countrylanguage CASCADE;

-- your code here which creates the tables

CREATE TABLE city
(
  id          bigserial PRIMARY KEY,
  name        varchar(254) NOT NULL,
  countrycode char(3)      NOT NULL,
  region      varchar(254) NOT NULL,
  population  bigint       NOT NULL
);

CREATE TABLE country
(
  code                   char(3) PRIMARY KEY NOT NULL,
  name                   varchar(254)        NOT NULL,
  continent              varchar(254)        NOT NULL,
  region                 varchar(254)        NOT NULL,
  surfacearea            NUMERIC             NOT NULL,
  one_nine               bigint,
  population             bigint              NOT NULL,
  seven_one_point        NUMERIC,
  four_eight             NUMERIC,
  four_five              NUMERIC,
  name_in_local_language varchar(100)        NOT NULL,
  governmentform         varchar(100)        NOT NULL,
  president              varchar(100),
  capital                bigint,
  tldn                   varchar(2)          NOT NULL,
  CONSTRAINT country_city_id_fk FOREIGN KEY (capital) REFERENCES city (id),
  CONSTRAINT check_min_length check (length(region) > 1)
);
CREATE UNIQUE INDEX country_code_uindex
  ON public.country (code);

CREATE TABLE countrylanguage
(
  countrycode varchar(3)   NOT NULL,
  language    varchar(254) NOT NULL,
  isofficial  BOOLEAN      NOT NULL,
  percentage  REAL         NOT NULL,
  CONSTRAINT fk_languagecountry_country FOREIGN KEY (countrycode) REFERENCES public.country (code)
);
CREATE UNIQUE INDEX countrylanguage_uindex
  ON public.countrylanguage (countrycode, language);