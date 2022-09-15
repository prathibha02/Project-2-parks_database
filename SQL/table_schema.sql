-- DROP TABLE IF EXISTS public.alltrails;

CREATE TABLE IF NOT EXISTS public.alltrails
(
    trail_id bigint,
    trail text COLLATE pg_catalog."default",
    area_name text COLLATE pg_catalog."default",
    city_name text COLLATE pg_catalog."default",
    state_name text COLLATE pg_catalog."default",
    _geoloc text COLLATE pg_catalog."default",
    popularity double precision,
    length double precision,
    elevation_gain double precision,
    difficulty_rating bigint,
    route_type text COLLATE pg_catalog."default",
    avg_rating double precision,
    num_reviews bigint,
    features text COLLATE pg_catalog."default",
    activities text COLLATE pg_catalog."default",
    park_code text COLLATE pg_catalog."default"
)

-- DROP TABLE IF EXISTS public.national_parks;

CREATE TABLE IF NOT EXISTS public.national_parks
(
    park_code text COLLATE pg_catalog."default",
    park_name text COLLATE pg_catalog."default",
    fee_per_car double precision,
    fee_per_person double precision,
    street_address text COLLATE pg_catalog."default",
    city text COLLATE pg_catalog."default",
    state text COLLATE pg_catalog."default",
    zip_code text COLLATE pg_catalog."default",
    phone_number text COLLATE pg_catalog."default",
    email_address text COLLATE pg_catalog."default",
    lat double precision,
    lng double precision,
    "Weather Summary" text COLLATE pg_catalog."default",
    num_of_trails double precision,
    avg_difficulty double precision,
    avg_rating double precision
)

-- DROP TABLE IF EXISTS public.weather_data;

CREATE TABLE IF NOT EXISTS public.weather_data
(
    park_code text COLLATE pg_catalog."default",
    park_name text COLLATE pg_catalog."default",
    city text COLLATE pg_catalog."default",
    state text COLLATE pg_catalog."default",
    lat double precision,
    lng double precision,
    min_temp double precision,
    max_temp double precision,
    humidity bigint,
    cloudiness bigint,
    wind_speed double precision,
    date bigint
)
