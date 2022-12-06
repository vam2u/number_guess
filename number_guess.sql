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

DROP DATABASE user_guess;
--
-- Name: user_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE user_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE user_guess OWNER TO freecodecamp;

\connect user_guess

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
-- Name: user_guess; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_guess (
    user_guests_id integer NOT NULL,
    username character varying NOT NULL,
    secret_number integer NOT NULL,
    number_guesses integer DEFAULT 0 NOT NULL,
    is_guessed boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.user_guess OWNER TO freecodecamp;

--
-- Name: user_guess_user_guests_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_guess_user_guests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_guess_user_guests_id_seq OWNER TO freecodecamp;

--
-- Name: user_guess_user_guests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_guess_user_guests_id_seq OWNED BY public.user_guess.user_guests_id;


--
-- Name: user_guess user_guests_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_guess ALTER COLUMN user_guests_id SET DEFAULT nextval('public.user_guess_user_guests_id_seq'::regclass);


--
-- Data for Name: user_guess; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_guess VALUES (143, 'user_1670288887870', 879, 880, true, '2022-12-06 01:08:08.000892');
INSERT INTO public.user_guess VALUES (144, 'user_1670288887870', 991, 992, true, '2022-12-06 01:08:08.228079');
INSERT INTO public.user_guess VALUES (145, 'user_1670288887869', 915, 916, true, '2022-12-06 01:08:08.458511');
INSERT INTO public.user_guess VALUES (146, 'user_1670288887869', 569, 570, true, '2022-12-06 01:08:08.670374');
INSERT INTO public.user_guess VALUES (147, 'user_1670288887870', 820, 822, true, '2022-12-06 01:08:08.874532');
INSERT INTO public.user_guess VALUES (148, 'user_1670288887870', 743, 744, true, '2022-12-06 01:08:09.089389');
INSERT INTO public.user_guess VALUES (149, 'user_1670288887870', 910, 911, true, '2022-12-06 01:08:09.301651');


--
-- Name: user_guess_user_guests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_guess_user_guests_id_seq', 149, true);


--
-- Name: user_guess user_guess_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_guess
    ADD CONSTRAINT user_guess_pk PRIMARY KEY (user_guests_id);


--
-- PostgreSQL database dump complete
--

