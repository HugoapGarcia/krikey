--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: authors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    date_of_birth date NOT NULL
);


--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.books (
    id integer NOT NULL,
    author_id integer,
    isbn character varying(50) NOT NULL,
    price character varying(50) NOT NULL
);


--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: sale_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sale_items (
    id integer NOT NULL,
    book_id integer,
    customer_name character varying(50) NOT NULL,
    item_price numeric(19,2) NOT NULL,
    quantity numeric(19,2) NOT NULL
);


--
-- Name: sale_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sale_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sale_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sale_items_id_seq OWNED BY public.sale_items.id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: sale_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_items ALTER COLUMN id SET DEFAULT nextval('public.sale_items_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.authors (id, name, date_of_birth) FROM stdin;
1	Jenn Brodley	2020-03-19
2	Ricca Geggie	2020-06-16
3	Kissee Revel	2020-01-08
4	Charlena Hurt	2020-03-02
5	Mireielle Laurence	2020-04-21
6	Anatola Abbet	2020-03-19
7	Claudine Noni	2020-07-05
8	Lela Staten	2020-05-28
9	Fernando Melpuss	2019-10-30
10	Nickie Battyll	2020-02-13
11	Avery Longmate	2019-10-25
12	Alecia Nielson	2019-12-22
13	Rodge Cannon	2019-10-13
14	Thorstein Blundon	2019-09-18
15	Emmalynn Catterick	2020-05-15
16	Arni Janton	2020-06-28
17	Correna Lorriman	2019-11-20
18	Bert Belfrage	2019-09-26
19	Corbie Chevolleau	2019-11-04
20	Ashbey Talby	2020-02-25
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.books (id, author_id, isbn, price) FROM stdin;
16	\N	753081581-4	$7675.88
17	\N	080768949-1	$1885.97
18	\N	343567368-0	$4046.67
19	\N	881247914-6	$8104.95
20	\N	564196026-8	$496.47
1	1	613401011-1	$6964.22
2	2	724989927-9	$6592.15
3	3	296568767-X	$1781.21
4	4	165325614-1	$5272.75
5	5	589023738-1	$5767.06
6	6	757481516-X	$8594.57
7	7	309405452-8	$7114.16
8	8	024079161-4	$4045.79
9	9	086493351-7	$9728.01
10	10	182119999-5	$3126.07
11	11	604306914-8	$9025.06
12	12	744084179-4	$6832.76
13	13	612620718-1	$1138.95
14	14	728952580-9	$5880.34
15	15	069109916-2	$5627.05
\.


--
-- Data for Name: sale_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.sale_items (id, book_id, customer_name, item_price, quantity) FROM stdin;
16	\N	Dixie	7.89	3.00
17	\N	Staci	3.40	21.00
18	\N	Berty	5.94	12.00
19	\N	Johannes	7.28	16.00
20	\N	Maryjo	7.37	65.00
1	1	Joaquin	5.79	82.00
2	2	Wildon	8.10	91.00
3	3	Mamie	1.29	7.00
4	4	Kelsy	6.51	15.00
5	5	Denys	9.56	47.00
6	6	Kriste	8.23	76.00
7	7	Cyndia	4.82	94.00
8	8	Conny	0.65	29.00
9	9	Trenna	8.30	75.00
10	10	Rube	6.79	27.00
11	11	Sheridan	0.50	82.00
12	12	Jaine	8.59	58.00
13	13	Phil	7.50	1.00
14	14	Kath	1.63	70.00
15	15	Odette	2.33	38.00
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.authors_id_seq', 20, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.books_id_seq', 20, true);


--
-- Name: sale_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sale_items_id_seq', 20, true);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: sale_items sale_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_pkey PRIMARY KEY (id);


--
-- Name: books books_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: sale_items sale_items_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sale_items
    ADD CONSTRAINT sale_items_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id);


--
-- PostgreSQL database dump complete
--

