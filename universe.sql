--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth character varying(255),
    age_in_millions_of_years integer NOT NULL,
    description text,
    galaxy_types_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_types_galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_types_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    radius_in_km numeric,
    distance_from_its_planet numeric,
    orbital_period_in_day numeric,
    is_spherical boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    radius_in_km numeric,
    mass_of_earth numeric,
    distance_from_its_star numeric,
    orbital_period_in_day numeric,
    has_life boolean NOT NULL,
    has_atmosphere boolean NOT NULL,
    is_spherical boolean NOT NULL,
    planet_types_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_million_of_years integer,
    temperature_in_kelvin integer NOT NULL,
    solar_mass numeric,
    solar_luminosity numeric,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_types_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', '0', 13200, 'Our galaxy', 2);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', '2.5 million light years', 10000, 'Spiral galaxy', 2);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', '53.5 million light years', 6200, 'Elliptical galaxy', 1);
INSERT INTO public.galaxy VALUES (4, 'NGC 1277', '220 million light years', 11500, 'Lenticular galaxy with a supermassive black hole', 4);
INSERT INTO public.galaxy VALUES (5, 'Sagittarius A*', '26.000 light years', 42, 'million Galactic center of Milky Way', 1);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', '160.000 light years', 13000, 'Dwarf galaxy orbiting Milky Way', 5);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Elliptical', 'Elliptical galaxies have an oval shape');
INSERT INTO public.galaxy_types VALUES (2, 'Spiral', 'Spiral galaxies have a disk-like structure');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'Irregular galaxies have no definite shape');
INSERT INTO public.galaxy_types VALUES (4, 'Lenticular', 'Lenticular galaxies are intermediate');
INSERT INTO public.galaxy_types VALUES (5, 'Dwarf', 'Dwarf galaxies are much smaller');
INSERT INTO public.galaxy_types VALUES (6, 'Ring', 'Ring galaxies have a circular structure');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1737.1, 384400, 27.3, true, false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.1, 9377, 0.32, true, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, 23459, 1.26, true, false, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 2631.2, 1070400, 7.2, true, false, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 2410.3, 1882700, 16.7, true, false, 5);
INSERT INTO public.moon VALUES (6, 'Io', 1821.6, 421700, 1.8, true, true, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 1560.8, 671034, 3.5, true, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 2575, 1221870, 15.9, true, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 252.1, 238037, 1.4, true, true, 6);
INSERT INTO public.moon VALUES (10, 'Miranda', 235.8, 129390, 1.4, true, false, 7);
INSERT INTO public.moon VALUES (11, 'Ariel', 578.9, 191020, 2.5, true, false, 7);
INSERT INTO public.moon VALUES (12, 'Triton', 1353.4, 354759, 5.9, true, true, 8);
INSERT INTO public.moon VALUES (13, 'Charon', 603.6, 17536, 6.4, true, false, 10);
INSERT INTO public.moon VALUES (14, 'Phoebe', 106.6, 12952000, 550.5, true, false, 5);
INSERT INTO public.moon VALUES (15, 'Mimas', 198.2, 185520, 0.9, true, false, 6);
INSERT INTO public.moon VALUES (16, 'Hyperion', 270.0, 1481010, 21.3, true, false, 6);
INSERT INTO public.moon VALUES (17, 'Dione', 561.4, 377400, 2.7, true, false, 6);
INSERT INTO public.moon VALUES (18, 'Rhea', 764.5, 527108, 4.5, true, false, 6);
INSERT INTO public.moon VALUES (19, 'Oberon', 761.4, 582600, 13.5, true, false, 7);
INSERT INTO public.moon VALUES (20, 'Titania', 788.4, 435910, 8.7, true, false, 7);
INSERT INTO public.moon VALUES (21, 'Umbriel', 584.7, 266000, 4.1, true, false, 7);
INSERT INTO public.moon VALUES (22, 'Puck', 77, 86010, 0.8, true, false, 7);
INSERT INTO public.moon VALUES (23, 'Nereid', NULL, 5513400, 360.1, false, false, 8);
INSERT INTO public.moon VALUES (24, 'Proteus', 210, 117647, 1.1, true, false, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2439.7, 0.0553, 57.91, 87.97, false, true, true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6051.8, 0.815, 108.2, 224.7, false, true, true, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6371, 1, 149.6, 365.2, true, true, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3389.5, 0.107, 227.9, 687.0, false, true, true, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911, 317.8, 778.3, 4332, false, true, false, 2, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232, 95.2, 1427.0, 10747, false, true, false, 2, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362, 14.6, 2871.0, 30589, false, true, false, 3, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622, 17.2, 4498.3, 59800, false, true, false, 3, 2);
INSERT INTO public.planet VALUES (9, 'Ceres', 473, 0.00015, 413.8, 1682.0, false, true, true, 4, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 1188.3, 0.00218, 5906.4, 90560, false, true, true, 4, 1);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', NULL, 0.69, 0.047, 3.5247, false, true, false, 5, 3);
INSERT INTO public.planet VALUES (12, 'Kepler-438 b', NULL, 0.12, 0.166, 35.23, false, true, false, 5, 4);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial', 'Small, rocky planets with solid surfaces');
INSERT INTO public.planet_types VALUES (2, 'Gas Giant', 'Large, gaseous planets with no solid surface');
INSERT INTO public.planet_types VALUES (3, 'Ice Giant', 'Planets with a composition of rock and ice');
INSERT INTO public.planet_types VALUES (4, 'Dwarf Planet', 'Small, round objects that orbit the sun');
INSERT INTO public.planet_types VALUES (5, 'Exoplanet', 'Planets that orbit stars outside of our solar system');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 5500, 1, 1, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 230, 9800, 2.02, 25.4, 1);
INSERT INTO public.star VALUES (3, 'Vega', 455, 9500, 2.14, 40, 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 6000, 5770, 1.1, 1.5, 1);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', 6000, 5200, 0.907, 0.5, 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 4850, 3000, 0.12, 0.0017, 1);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 8, 3500, 20, 126000, 1);
INSERT INTO public.star VALUES (8, 'Rigel', 8, 11000, 23, 66000, 1);
INSERT INTO public.star VALUES (9, 'Polaris', 70, 5800, 5.4, 2500, 1);
INSERT INTO public.star VALUES (10, 'Aldebaran', 7, 3900, 1.7, 518, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_types_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);
    

--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);

--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy galaxy_types_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_types_id FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_types_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_types_id FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

