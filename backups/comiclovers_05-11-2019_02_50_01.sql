--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1.pgdg90+1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-1.pgdg90+1)

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

ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_user_id_fkey;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_book_id_fkey;
ALTER TABLE ONLY public.collections DROP CONSTRAINT collections_user_id_fkey;
ALTER TABLE ONLY public.collection_books DROP CONSTRAINT collection_books_collection_id_fkey;
ALTER TABLE ONLY public.collection_books DROP CONSTRAINT collection_books_book_id_fkey;
ALTER TABLE ONLY public.book_writers DROP CONSTRAINT book_writers_writer_id_fkey;
ALTER TABLE ONLY public.book_writers DROP CONSTRAINT book_writers_book_id_fkey;
ALTER TABLE ONLY public.book_publishers DROP CONSTRAINT book_publishers_publisher_id_fkey;
ALTER TABLE ONLY public.book_publishers DROP CONSTRAINT book_publishers_book_id_fkey;
ALTER TABLE ONLY public.book_licensors DROP CONSTRAINT book_licensors_licensor_id_fkey;
ALTER TABLE ONLY public.book_licensors DROP CONSTRAINT book_licensors_book_id_fkey;
ALTER TABLE ONLY public.book_illustrators DROP CONSTRAINT book_illustrators_illustrator_id_fkey;
ALTER TABLE ONLY public.book_illustrators DROP CONSTRAINT book_illustrators_book_id_fkey;
ALTER TABLE ONLY public.writers DROP CONSTRAINT writers_pkey;
ALTER TABLE ONLY public.writers DROP CONSTRAINT writers_name_key;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
ALTER TABLE ONLY public.publishers DROP CONSTRAINT publishers_pkey;
ALTER TABLE ONLY public.publishers DROP CONSTRAINT publishers_name_key;
ALTER TABLE ONLY public.licensors DROP CONSTRAINT licensors_pkey;
ALTER TABLE ONLY public.licensors DROP CONSTRAINT licensors_name_key;
ALTER TABLE ONLY public.illustrators DROP CONSTRAINT illustrators_pkey;
ALTER TABLE ONLY public.illustrators DROP CONSTRAINT illustrators_name_key;
ALTER TABLE ONLY public.collections DROP CONSTRAINT collections_pkey;
ALTER TABLE ONLY public.collection_books DROP CONSTRAINT collection_books_pkey;
ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
ALTER TABLE ONLY public.books DROP CONSTRAINT books_isbn_key;
ALTER TABLE ONLY public.books DROP CONSTRAINT books_isbn_10_key;
ALTER TABLE ONLY public.book_writers DROP CONSTRAINT book_writers_pkey;
ALTER TABLE ONLY public.book_publishers DROP CONSTRAINT book_publishers_pkey;
ALTER TABLE ONLY public.book_licensors DROP CONSTRAINT book_licensors_pkey;
ALTER TABLE ONLY public.book_illustrators DROP CONSTRAINT book_illustrators_pkey;
ALTER TABLE ONLY public."SequelizeMeta" DROP CONSTRAINT "SequelizeMeta_pkey";
ALTER TABLE public.writers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.publishers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.licensors ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.illustrators ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.collections ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.collection_books ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.books ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.book_writers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.book_publishers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.book_licensors ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.book_illustrators ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.writers_id_seq;
DROP TABLE public.writers;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.reviews_id_seq;
DROP TABLE public.reviews;
DROP SEQUENCE public.publishers_id_seq;
DROP TABLE public.publishers;
DROP SEQUENCE public.licensors_id_seq;
DROP TABLE public.licensors;
DROP SEQUENCE public.illustrators_id_seq;
DROP TABLE public.illustrators;
DROP SEQUENCE public.collections_id_seq;
DROP TABLE public.collections;
DROP SEQUENCE public.collection_books_id_seq;
DROP TABLE public.collection_books;
DROP SEQUENCE public.books_id_seq;
DROP TABLE public.books;
DROP SEQUENCE public.book_writers_id_seq;
DROP TABLE public.book_writers;
DROP SEQUENCE public.book_publishers_id_seq;
DROP TABLE public.book_publishers;
DROP SEQUENCE public.book_licensors_id_seq;
DROP TABLE public.book_licensors;
DROP SEQUENCE public.book_illustrators_id_seq;
DROP TABLE public.book_illustrators;
DROP TABLE public."SequelizeMeta";
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO comiclovers;

--
-- Name: book_illustrators; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.book_illustrators (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    book_id integer,
    illustrator_id integer
);


ALTER TABLE public.book_illustrators OWNER TO comiclovers;

--
-- Name: book_illustrators_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.book_illustrators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_illustrators_id_seq OWNER TO comiclovers;

--
-- Name: book_illustrators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.book_illustrators_id_seq OWNED BY public.book_illustrators.id;


--
-- Name: book_licensors; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.book_licensors (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    book_id integer,
    licensor_id integer
);


ALTER TABLE public.book_licensors OWNER TO comiclovers;

--
-- Name: book_licensors_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.book_licensors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_licensors_id_seq OWNER TO comiclovers;

--
-- Name: book_licensors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.book_licensors_id_seq OWNED BY public.book_licensors.id;


--
-- Name: book_publishers; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.book_publishers (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    book_id integer,
    publisher_id integer
);


ALTER TABLE public.book_publishers OWNER TO comiclovers;

--
-- Name: book_publishers_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.book_publishers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_publishers_id_seq OWNER TO comiclovers;

--
-- Name: book_publishers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.book_publishers_id_seq OWNED BY public.book_publishers.id;


--
-- Name: book_writers; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.book_writers (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    book_id integer,
    writer_id integer
);


ALTER TABLE public.book_writers OWNER TO comiclovers;

--
-- Name: book_writers_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.book_writers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_writers_id_seq OWNER TO comiclovers;

--
-- Name: book_writers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.book_writers_id_seq OWNED BY public.book_writers.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.books (
    id integer NOT NULL,
    isbn character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    edition character varying(255),
    pages integer,
    description text,
    publishing_date timestamp with time zone,
    format character varying(255),
    price character varying(255),
    thumbnail character varying(255),
    total_rating integer,
    total_favorites integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    isbn_10 character varying(255)
);


ALTER TABLE public.books OWNER TO comiclovers;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO comiclovers;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: collection_books; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.collection_books (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    book_id integer,
    collection_id integer
);


ALTER TABLE public.collection_books OWNER TO comiclovers;

--
-- Name: collection_books_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.collection_books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_books_id_seq OWNER TO comiclovers;

--
-- Name: collection_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.collection_books_id_seq OWNED BY public.collection_books.id;


--
-- Name: collections; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.collections (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    thumbnail character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer,
    type character varying(255)
);


ALTER TABLE public.collections OWNER TO comiclovers;

--
-- Name: collections_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.collections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collections_id_seq OWNER TO comiclovers;

--
-- Name: collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.collections_id_seq OWNED BY public.collections.id;


--
-- Name: illustrators; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.illustrators (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.illustrators OWNER TO comiclovers;

--
-- Name: illustrators_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.illustrators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.illustrators_id_seq OWNER TO comiclovers;

--
-- Name: illustrators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.illustrators_id_seq OWNED BY public.illustrators.id;


--
-- Name: licensors; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.licensors (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.licensors OWNER TO comiclovers;

--
-- Name: licensors_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.licensors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.licensors_id_seq OWNER TO comiclovers;

--
-- Name: licensors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.licensors_id_seq OWNED BY public.licensors.id;


--
-- Name: publishers; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.publishers (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.publishers OWNER TO comiclovers;

--
-- Name: publishers_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.publishers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.publishers_id_seq OWNER TO comiclovers;

--
-- Name: publishers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.publishers_id_seq OWNED BY public.publishers.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.reviews (
    id integer NOT NULL,
    rating integer,
    user_id integer,
    book_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.reviews OWNER TO comiclovers;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_id_seq OWNER TO comiclovers;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    profile_picture character varying(255),
    password_hash character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    password_reset_token character varying(255),
    password_reset_token_expires timestamp with time zone,
    refresh_token character varying(255),
    refresh_token_expires timestamp with time zone
);


ALTER TABLE public.users OWNER TO comiclovers;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO comiclovers;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: writers; Type: TABLE; Schema: public; Owner: comiclovers
--

CREATE TABLE public.writers (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.writers OWNER TO comiclovers;

--
-- Name: writers_id_seq; Type: SEQUENCE; Schema: public; Owner: comiclovers
--

CREATE SEQUENCE public.writers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.writers_id_seq OWNER TO comiclovers;

--
-- Name: writers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: comiclovers
--

ALTER SEQUENCE public.writers_id_seq OWNED BY public.writers.id;


--
-- Name: book_illustrators id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_illustrators ALTER COLUMN id SET DEFAULT nextval('public.book_illustrators_id_seq'::regclass);


--
-- Name: book_licensors id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_licensors ALTER COLUMN id SET DEFAULT nextval('public.book_licensors_id_seq'::regclass);


--
-- Name: book_publishers id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_publishers ALTER COLUMN id SET DEFAULT nextval('public.book_publishers_id_seq'::regclass);


--
-- Name: book_writers id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_writers ALTER COLUMN id SET DEFAULT nextval('public.book_writers_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: collection_books id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.collection_books ALTER COLUMN id SET DEFAULT nextval('public.collection_books_id_seq'::regclass);


--
-- Name: collections id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.collections ALTER COLUMN id SET DEFAULT nextval('public.collections_id_seq'::regclass);


--
-- Name: illustrators id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.illustrators ALTER COLUMN id SET DEFAULT nextval('public.illustrators_id_seq'::regclass);


--
-- Name: licensors id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.licensors ALTER COLUMN id SET DEFAULT nextval('public.licensors_id_seq'::regclass);


--
-- Name: publishers id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.publishers ALTER COLUMN id SET DEFAULT nextval('public.publishers_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: writers id; Type: DEFAULT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.writers ALTER COLUMN id SET DEFAULT nextval('public.writers_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public."SequelizeMeta" (name) FROM stdin;
20190704213417-create-users.js
20190731005420-create-licensor.js
20190731005730-create-writer.js
20190731005916-create-publisher.js
20190731010031-create-illustrator.js
20190731030803-create-books.js
20190731134643-create_book_illustrator.js
20190731134843-create_book_illustrator_associations.js
20190731192727-create_book_writers.js
20190731192731-create_book_writers_associations.js
20190731192737-create_book_publishers.js
20190731192741-create_book_publishers_associations.js
20190731192749-create_book_licensors.js
20190731192755-create_book_licensors_associations.js
20190805032626-create_collections.js
20190806035033-create_collection_books.js
20190806035101-create_collection_books_associations.js
20190806045132-create_reviews.js
20190901160437-add_collection_type_column.js
20190907184519-add_reset_password_columns_at_user_table.js
20191105022951-add_isbn_10_column.js
20191105023406-add_refresh_token_column_to_users.js
\.


--
-- Data for Name: book_illustrators; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.book_illustrators (id, created_at, updated_at, book_id, illustrator_id) FROM stdin;
1	2019-08-18 01:05:30.292+00	2019-08-18 01:05:30.292+00	4	3
2	2019-08-18 01:05:30.311+00	2019-08-18 01:05:30.311+00	1	2
3	2019-08-18 01:05:30.313+00	2019-08-18 01:05:30.313+00	3	4
4	2019-08-18 01:05:30.314+00	2019-08-18 01:05:30.314+00	5	1
5	2019-08-18 01:05:30.32+00	2019-08-18 01:05:30.32+00	6	3
6	2019-08-18 01:05:30.326+00	2019-08-18 01:05:30.326+00	9	3
7	2019-08-18 01:05:30.326+00	2019-08-18 01:05:30.326+00	8	3
8	2019-08-18 01:05:30.327+00	2019-08-18 01:05:30.327+00	7	6
9	2019-08-18 01:05:30.335+00	2019-08-18 01:05:30.335+00	11	3
10	2019-08-18 01:05:30.338+00	2019-08-18 01:05:30.338+00	10	7
11	2019-08-18 01:05:30.343+00	2019-08-18 01:05:30.343+00	12	8
12	2019-08-18 01:05:30.343+00	2019-08-18 01:05:30.343+00	12	9
13	2019-08-18 01:05:30.344+00	2019-08-18 01:05:30.344+00	14	3
14	2019-08-18 01:05:30.347+00	2019-08-18 01:05:30.347+00	13	10
15	2019-08-18 01:05:30.352+00	2019-08-18 01:05:30.352+00	15	11
16	2019-08-18 01:05:30.361+00	2019-08-18 01:05:30.361+00	16	12
17	2019-08-18 01:05:30.362+00	2019-08-18 01:05:30.362+00	17	13
18	2019-08-18 01:05:30.369+00	2019-08-18 01:05:30.369+00	18	14
19	2019-08-18 01:05:30.372+00	2019-08-18 01:05:30.372+00	19	3
20	2019-08-18 01:05:30.379+00	2019-08-18 01:05:30.379+00	20	3
21	2019-08-18 01:05:30.38+00	2019-08-18 01:05:30.38+00	21	3
22	2019-08-18 01:05:30.39+00	2019-08-18 01:05:30.39+00	22	15
23	2019-08-18 01:05:30.392+00	2019-08-18 01:05:30.392+00	23	16
24	2019-08-18 01:05:30.402+00	2019-08-18 01:05:30.402+00	24	17
25	2019-08-18 01:05:30.403+00	2019-08-18 01:05:30.403+00	25	18
27	2019-08-18 01:05:30.414+00	2019-08-18 01:05:30.414+00	27	20
28	2019-08-18 01:05:30.415+00	2019-08-18 01:05:30.415+00	28	21
29	2019-08-18 01:05:30.427+00	2019-08-18 01:05:30.427+00	30	3
30	2019-08-18 01:05:30.432+00	2019-08-18 01:05:30.432+00	29	22
31	2019-08-18 01:05:30.432+00	2019-08-18 01:05:30.432+00	29	23
32	2019-08-18 01:05:30.441+00	2019-08-18 01:05:30.441+00	31	24
34	2019-08-18 01:05:30.444+00	2019-08-18 01:05:30.444+00	33	26
35	2019-08-18 01:05:30.451+00	2019-08-18 01:05:30.451+00	34	27
36	2019-08-18 01:05:30.457+00	2019-08-18 01:05:30.457+00	36	15
37	2019-08-18 01:05:30.472+00	2019-08-18 01:05:30.472+00	35	28
38	2019-08-18 01:05:30.473+00	2019-08-18 01:05:30.473+00	37	19
39	2019-08-18 01:05:30.479+00	2019-08-18 01:05:30.479+00	38	16
40	2019-08-18 01:05:30.484+00	2019-08-18 01:05:30.484+00	39	29
41	2019-08-18 01:05:30.498+00	2019-08-18 01:05:30.498+00	40	30
42	2019-08-18 01:05:30.503+00	2019-08-18 01:05:30.503+00	41	31
43	2019-08-18 01:05:30.508+00	2019-08-18 01:05:30.508+00	42	32
44	2019-08-18 01:05:30.512+00	2019-08-18 01:05:30.512+00	43	32
45	2019-08-18 01:05:30.52+00	2019-08-18 01:05:30.52+00	44	32
46	2019-08-18 01:05:30.521+00	2019-08-18 01:05:30.521+00	45	33
47	2019-08-18 01:05:30.53+00	2019-08-18 01:05:30.53+00	46	34
48	2019-08-18 01:05:30.535+00	2019-08-18 01:05:30.535+00	47	35
49	2019-08-18 01:05:30.538+00	2019-08-18 01:05:30.538+00	48	36
50	2019-08-18 01:05:30.542+00	2019-08-18 01:05:30.542+00	51	19
51	2019-08-18 01:05:30.553+00	2019-08-18 01:05:30.553+00	50	38
52	2019-08-18 01:05:30.554+00	2019-08-18 01:05:30.554+00	52	19
53	2019-08-18 01:05:30.559+00	2019-08-18 01:05:30.559+00	53	19
54	2019-08-18 01:05:30.561+00	2019-08-18 01:05:30.561+00	54	19
55	2019-08-18 01:05:30.562+00	2019-08-18 01:05:30.562+00	55	39
56	2019-08-18 01:05:30.566+00	2019-08-18 01:05:30.566+00	57	19
57	2019-08-18 01:05:30.574+00	2019-08-18 01:05:30.574+00	56	40
58	2019-08-18 01:05:30.577+00	2019-08-18 01:05:30.577+00	58	19
59	2019-08-18 01:05:30.582+00	2019-08-18 01:05:30.582+00	59	3
60	2019-08-18 01:05:30.584+00	2019-08-18 01:05:30.584+00	60	19
61	2019-08-18 01:05:30.586+00	2019-08-18 01:05:30.586+00	61	19
62	2019-08-18 01:05:30.59+00	2019-08-18 01:05:30.59+00	62	19
63	2019-08-18 01:05:30.594+00	2019-08-18 01:05:30.594+00	63	41
64	2019-08-18 01:05:30.598+00	2019-08-18 01:05:30.598+00	65	41
65	2019-08-18 01:05:30.603+00	2019-08-18 01:05:30.603+00	66	43
66	2019-08-18 01:05:30.607+00	2019-08-18 01:05:30.607+00	68	43
67	2019-08-18 01:05:30.612+00	2019-08-18 01:05:30.612+00	69	43
68	2019-08-18 01:05:30.614+00	2019-08-18 01:05:30.614+00	70	43
69	2019-08-18 01:05:30.617+00	2019-08-18 01:05:30.617+00	71	45
70	2019-08-18 01:05:30.619+00	2019-08-18 01:05:30.619+00	72	40
71	2019-08-18 01:05:30.655+00	2019-08-18 01:05:30.655+00	2	3
72	2019-08-18 01:05:30.899+00	2019-08-18 01:05:30.899+00	49	36
73	2019-08-18 01:05:30.97+00	2019-08-18 01:05:30.97+00	64	41
74	2019-08-18 01:05:30.99+00	2019-08-18 01:05:30.99+00	67	43
75	2019-08-19 09:30:07.232+00	2019-08-19 09:30:07.232+00	\N	13
76	2019-08-19 09:30:07.232+00	2019-08-19 09:30:07.232+00	\N	3
77	2019-08-19 09:30:07.232+00	2019-08-19 09:30:07.232+00	\N	39
78	2019-08-23 17:04:25.267+00	2019-08-23 17:04:25.267+00	\N	2
79	2019-10-23 20:10:51.505+00	2019-10-23 20:10:51.505+00	76	32
80	2019-10-23 20:25:31.505+00	2019-10-23 20:25:31.505+00	32	34
81	2019-10-23 20:49:50.462+00	2019-10-23 20:49:50.462+00	26	43
82	2019-10-24 22:54:08.474+00	2019-10-24 22:54:08.474+00	78	29
83	2019-10-24 22:56:58.23+00	2019-10-24 22:56:58.23+00	79	29
84	2019-10-24 23:02:45.853+00	2019-10-24 23:02:45.853+00	80	48
85	2019-10-24 23:05:02.612+00	2019-10-24 23:05:02.612+00	81	48
86	2019-10-24 23:09:23.128+00	2019-10-24 23:09:23.128+00	82	49
87	2019-10-24 23:09:53.918+00	2019-10-24 23:09:53.918+00	82	50
88	2019-10-24 23:17:03.241+00	2019-10-24 23:17:03.241+00	83	51
89	2019-10-24 23:21:24.758+00	2019-10-24 23:21:24.758+00	84	52
90	2019-10-24 23:30:07.37+00	2019-10-24 23:30:07.37+00	85	53
91	2019-10-29 20:51:15.971+00	2019-10-29 20:51:15.971+00	86	54
92	2019-11-04 16:15:21.615+00	2019-11-04 16:15:21.615+00	87	40
93	2019-11-04 16:15:21.615+00	2019-11-04 16:15:21.615+00	87	8
94	2019-11-04 16:24:56.654+00	2019-11-04 16:24:56.654+00	88	55
95	2019-11-04 16:24:56.654+00	2019-11-04 16:24:56.654+00	88	56
96	2019-11-04 16:32:06.18+00	2019-11-04 16:32:06.18+00	89	57
97	2019-11-04 16:32:06.18+00	2019-11-04 16:32:06.18+00	89	58
98	2019-11-04 16:32:06.18+00	2019-11-04 16:32:06.18+00	89	59
99	2019-11-04 16:35:02.353+00	2019-11-04 16:35:02.353+00	90	57
100	2019-11-04 16:35:02.353+00	2019-11-04 16:35:02.353+00	90	59
101	2019-11-04 16:35:02.353+00	2019-11-04 16:35:02.353+00	90	58
102	2019-11-04 16:38:54.486+00	2019-11-04 16:38:54.486+00	91	57
103	2019-11-04 16:38:54.486+00	2019-11-04 16:38:54.486+00	91	58
104	2019-11-04 16:43:05.991+00	2019-11-04 16:43:05.991+00	92	34
105	2019-11-04 16:47:33.178+00	2019-11-04 16:47:33.178+00	93	34
106	2019-11-04 16:51:00.989+00	2019-11-04 16:51:00.989+00	94	34
107	2019-11-04 17:05:35.971+00	2019-11-04 17:05:35.971+00	95	60
108	2019-11-04 17:08:58.559+00	2019-11-04 17:08:58.559+00	96	60
109	2019-11-04 17:12:17.332+00	2019-11-04 17:12:17.332+00	97	60
110	2019-11-04 17:15:20.597+00	2019-11-04 17:15:20.597+00	98	60
111	2019-11-04 17:34:23.978+00	2019-11-04 17:34:23.978+00	99	61
112	2019-11-04 18:06:49.803+00	2019-11-04 18:06:49.803+00	101	62
113	2019-11-04 18:18:20.819+00	2019-11-04 18:18:20.819+00	102	63
\.


--
-- Data for Name: book_licensors; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.book_licensors (id, created_at, updated_at, book_id, licensor_id) FROM stdin;
1	2019-08-18 01:05:31.354+00	2019-08-18 01:05:31.354+00	4	1
2	2019-08-18 01:05:31.357+00	2019-08-18 01:05:31.357+00	3	2
3	2019-08-18 01:05:31.362+00	2019-08-18 01:05:31.362+00	6	1
4	2019-08-18 01:05:31.364+00	2019-08-18 01:05:31.364+00	9	1
5	2019-08-18 01:05:31.366+00	2019-08-18 01:05:31.366+00	8	1
6	2019-08-18 01:05:31.368+00	2019-08-18 01:05:31.368+00	11	1
7	2019-08-18 01:05:31.369+00	2019-08-18 01:05:31.369+00	7	4
8	2019-08-18 01:05:31.369+00	2019-08-18 01:05:31.369+00	10	4
9	2019-08-18 01:05:31.374+00	2019-08-18 01:05:31.374+00	12	4
10	2019-08-18 01:05:31.376+00	2019-08-18 01:05:31.376+00	14	1
11	2019-08-18 01:05:31.385+00	2019-08-18 01:05:31.385+00	15	2
12	2019-08-18 01:05:31.387+00	2019-08-18 01:05:31.387+00	16	4
13	2019-08-18 01:05:31.387+00	2019-08-18 01:05:31.387+00	13	5
14	2019-08-18 01:05:31.391+00	2019-08-18 01:05:31.391+00	17	6
15	2019-08-18 01:05:31.391+00	2019-08-18 01:05:31.391+00	19	1
16	2019-08-18 01:05:31.392+00	2019-08-18 01:05:31.392+00	20	1
17	2019-08-18 01:05:31.395+00	2019-08-18 01:05:31.395+00	21	1
18	2019-08-18 01:05:31.395+00	2019-08-18 01:05:31.395+00	22	6
19	2019-08-18 01:05:31.397+00	2019-08-18 01:05:31.397+00	23	4
20	2019-08-18 01:05:31.397+00	2019-08-18 01:05:31.397+00	24	4
21	2019-08-18 01:05:31.4+00	2019-08-18 01:05:31.4+00	25	2
22	2019-08-18 01:05:31.4+00	2019-08-18 01:05:31.4+00	27	4
24	2019-08-18 01:05:31.402+00	2019-08-18 01:05:31.402+00	30	1
25	2019-08-18 01:05:31.404+00	2019-08-18 01:05:31.404+00	28	4
26	2019-08-18 01:05:31.404+00	2019-08-18 01:05:31.404+00	29	2
27	2019-08-18 01:05:31.407+00	2019-08-18 01:05:31.407+00	31	6
29	2019-08-18 01:05:31.409+00	2019-08-18 01:05:31.409+00	33	6
30	2019-08-18 01:05:31.409+00	2019-08-18 01:05:31.409+00	34	4
31	2019-08-18 01:05:31.411+00	2019-08-18 01:05:31.411+00	36	6
32	2019-08-18 01:05:31.411+00	2019-08-18 01:05:31.411+00	35	4
33	2019-08-18 01:05:31.413+00	2019-08-18 01:05:31.413+00	37	6
34	2019-08-18 01:05:31.413+00	2019-08-18 01:05:31.413+00	38	4
35	2019-08-18 01:05:31.415+00	2019-08-18 01:05:31.415+00	39	9
36	2019-08-18 01:05:31.415+00	2019-08-18 01:05:31.415+00	40	6
37	2019-08-18 01:05:31.417+00	2019-08-18 01:05:31.417+00	41	10
38	2019-08-18 01:05:31.417+00	2019-08-18 01:05:31.417+00	42	11
39	2019-08-18 01:05:31.419+00	2019-08-18 01:05:31.419+00	43	4
40	2019-08-18 01:05:31.42+00	2019-08-18 01:05:31.42+00	44	4
41	2019-08-18 01:05:31.421+00	2019-08-18 01:05:31.421+00	45	12
42	2019-08-18 01:05:31.421+00	2019-08-18 01:05:31.421+00	46	13
43	2019-08-18 01:05:31.425+00	2019-08-18 01:05:31.425+00	51	2
44	2019-08-18 01:05:31.429+00	2019-08-18 01:05:31.429+00	50	2
45	2019-08-18 01:05:31.429+00	2019-08-18 01:05:31.429+00	48	14
46	2019-08-18 01:05:31.436+00	2019-08-18 01:05:31.436+00	52	2
47	2019-08-18 01:05:31.438+00	2019-08-18 01:05:31.438+00	53	2
48	2019-08-18 01:05:31.438+00	2019-08-18 01:05:31.438+00	54	2
49	2019-08-18 01:05:31.44+00	2019-08-18 01:05:31.44+00	55	4
50	2019-08-18 01:05:31.44+00	2019-08-18 01:05:31.44+00	57	2
51	2019-08-18 01:05:31.442+00	2019-08-18 01:05:31.442+00	56	4
52	2019-08-18 01:05:31.442+00	2019-08-18 01:05:31.442+00	58	2
53	2019-08-18 01:05:31.444+00	2019-08-18 01:05:31.444+00	59	1
54	2019-08-18 01:05:31.444+00	2019-08-18 01:05:31.444+00	60	2
55	2019-08-18 01:05:31.446+00	2019-08-18 01:05:31.446+00	61	2
56	2019-08-18 01:05:31.446+00	2019-08-18 01:05:31.446+00	62	2
57	2019-08-18 01:05:31.45+00	2019-08-18 01:05:31.45+00	63	2
58	2019-08-18 01:05:31.462+00	2019-08-18 01:05:31.462+00	66	15
59	2019-08-18 01:05:31.464+00	2019-08-18 01:05:31.464+00	70	15
60	2019-08-18 01:05:31.467+00	2019-08-18 01:05:31.467+00	71	6
61	2019-08-18 01:05:31.469+00	2019-08-18 01:05:31.469+00	72	17
62	2019-08-18 01:05:31.471+00	2019-08-18 01:05:31.471+00	1	4
63	2019-08-18 01:05:31.474+00	2019-08-18 01:05:31.474+00	2	1
64	2019-08-18 01:05:31.48+00	2019-08-18 01:05:31.48+00	18	6
65	2019-08-18 01:05:31.496+00	2019-08-18 01:05:31.496+00	47	13
66	2019-08-18 01:05:31.498+00	2019-08-18 01:05:31.498+00	49	14
67	2019-08-18 01:05:31.505+00	2019-08-18 01:05:31.505+00	64	2
68	2019-08-18 01:05:31.507+00	2019-08-18 01:05:31.507+00	65	2
69	2019-08-18 01:05:31.508+00	2019-08-18 01:05:31.508+00	67	15
70	2019-08-18 01:05:31.51+00	2019-08-18 01:05:31.51+00	68	15
71	2019-08-18 01:05:31.511+00	2019-08-18 01:05:31.511+00	69	15
73	2019-08-23 15:07:00.835+00	2019-08-23 15:07:00.835+00	74	6
72	2019-08-19 09:30:07.266+00	2019-08-19 09:30:07.266+00	\N	1
74	2019-10-23 17:44:34.701+00	2019-10-23 17:44:34.701+00	77	4
75	2019-10-23 20:25:31.528+00	2019-10-23 20:25:31.528+00	32	13
76	2019-10-23 20:49:50.481+00	2019-10-23 20:49:50.481+00	26	15
77	2019-10-24 22:54:08.502+00	2019-10-24 22:54:08.502+00	78	9
78	2019-10-24 22:56:58.255+00	2019-10-24 22:56:58.255+00	79	9
79	2019-10-24 23:02:23.035+00	2019-10-24 23:02:23.035+00	80	4
80	2019-10-24 23:05:02.628+00	2019-10-24 23:05:02.628+00	81	4
81	2019-10-24 23:09:08.341+00	2019-10-24 23:09:08.341+00	82	4
82	2019-10-24 23:16:50.27+00	2019-10-24 23:16:50.27+00	83	6
83	2019-10-24 23:21:03.357+00	2019-10-24 23:21:03.357+00	84	4
84	2019-10-24 23:29:53.409+00	2019-10-24 23:29:53.409+00	85	6
85	2019-10-29 20:51:15.99+00	2019-10-29 20:51:15.99+00	86	18
86	2019-11-04 16:15:21.637+00	2019-11-04 16:15:21.637+00	87	4
87	2019-11-04 16:24:06.481+00	2019-11-04 16:24:06.481+00	88	4
88	2019-11-04 16:31:22.2+00	2019-11-04 16:31:22.2+00	89	4
89	2019-11-04 16:35:02.375+00	2019-11-04 16:35:02.375+00	90	4
90	2019-11-04 16:38:54.524+00	2019-11-04 16:38:54.524+00	91	4
91	2019-11-04 16:43:06.016+00	2019-11-04 16:43:06.016+00	92	13
92	2019-11-04 16:47:33.205+00	2019-11-04 16:47:33.205+00	93	13
93	2019-11-04 16:51:01.007+00	2019-11-04 16:51:01.007+00	94	13
94	2019-11-04 17:05:07.286+00	2019-11-04 17:05:07.286+00	95	1
95	2019-11-04 17:08:58.582+00	2019-11-04 17:08:58.582+00	96	1
96	2019-11-04 17:12:17.36+00	2019-11-04 17:12:17.36+00	97	1
97	2019-11-04 17:15:20.617+00	2019-11-04 17:15:20.617+00	98	1
98	2019-11-04 17:34:04.611+00	2019-11-04 17:34:04.611+00	99	15
99	2019-11-04 18:01:25.161+00	2019-11-04 18:01:25.161+00	100	19
100	2019-11-04 18:07:39.132+00	2019-11-04 18:07:39.132+00	101	20
101	2019-11-04 18:18:20.85+00	2019-11-04 18:18:20.85+00	102	20
\.


--
-- Data for Name: book_publishers; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.book_publishers (id, created_at, updated_at, book_id, publisher_id) FROM stdin;
1	2019-08-18 01:05:31.024+00	2019-08-18 01:05:31.024+00	4	1
2	2019-08-18 01:05:31.033+00	2019-08-18 01:05:31.033+00	3	1
3	2019-08-18 01:05:31.037+00	2019-08-18 01:05:31.037+00	5	1
4	2019-08-18 01:05:31.048+00	2019-08-18 01:05:31.048+00	6	1
5	2019-08-18 01:05:31.063+00	2019-08-18 01:05:31.063+00	9	1
6	2019-08-18 01:05:31.066+00	2019-08-18 01:05:31.066+00	8	1
7	2019-08-18 01:05:31.069+00	2019-08-18 01:05:31.069+00	7	1
8	2019-08-18 01:05:31.071+00	2019-08-18 01:05:31.071+00	11	1
9	2019-08-18 01:05:31.079+00	2019-08-18 01:05:31.079+00	10	1
10	2019-08-18 01:05:31.08+00	2019-08-18 01:05:31.08+00	12	1
11	2019-08-18 01:05:31.086+00	2019-08-18 01:05:31.086+00	14	1
12	2019-08-18 01:05:31.089+00	2019-08-18 01:05:31.089+00	15	1
13	2019-08-18 01:05:31.094+00	2019-08-18 01:05:31.094+00	13	3
14	2019-08-18 01:05:31.096+00	2019-08-18 01:05:31.096+00	16	1
15	2019-08-18 01:05:31.1+00	2019-08-18 01:05:31.1+00	17	1
16	2019-08-18 01:05:31.103+00	2019-08-18 01:05:31.103+00	18	1
17	2019-08-18 01:05:31.11+00	2019-08-18 01:05:31.11+00	19	1
18	2019-08-18 01:05:31.113+00	2019-08-18 01:05:31.113+00	20	1
19	2019-08-18 01:05:31.116+00	2019-08-18 01:05:31.116+00	21	1
20	2019-08-18 01:05:31.12+00	2019-08-18 01:05:31.12+00	22	1
21	2019-08-18 01:05:31.123+00	2019-08-18 01:05:31.123+00	23	1
22	2019-08-18 01:05:31.126+00	2019-08-18 01:05:31.126+00	24	1
23	2019-08-18 01:05:31.13+00	2019-08-18 01:05:31.13+00	25	1
24	2019-08-18 01:05:31.133+00	2019-08-18 01:05:31.133+00	27	1
26	2019-08-18 01:05:31.14+00	2019-08-18 01:05:31.14+00	30	1
27	2019-08-18 01:05:31.143+00	2019-08-18 01:05:31.143+00	28	1
28	2019-08-18 01:05:31.146+00	2019-08-18 01:05:31.146+00	29	1
29	2019-08-18 01:05:31.149+00	2019-08-18 01:05:31.149+00	31	1
31	2019-08-18 01:05:31.161+00	2019-08-18 01:05:31.161+00	33	1
32	2019-08-18 01:05:31.163+00	2019-08-18 01:05:31.163+00	34	1
33	2019-08-18 01:05:31.176+00	2019-08-18 01:05:31.176+00	36	1
34	2019-08-18 01:05:31.181+00	2019-08-18 01:05:31.181+00	35	1
35	2019-08-18 01:05:31.183+00	2019-08-18 01:05:31.183+00	37	1
36	2019-08-18 01:05:31.188+00	2019-08-18 01:05:31.188+00	38	1
37	2019-08-18 01:05:31.19+00	2019-08-18 01:05:31.19+00	39	1
38	2019-08-18 01:05:31.196+00	2019-08-18 01:05:31.196+00	40	1
39	2019-08-18 01:05:31.201+00	2019-08-18 01:05:31.201+00	41	1
40	2019-08-18 01:05:31.224+00	2019-08-18 01:05:31.224+00	42	1
41	2019-08-18 01:05:31.228+00	2019-08-18 01:05:31.228+00	43	1
42	2019-08-18 01:05:31.231+00	2019-08-18 01:05:31.231+00	44	1
43	2019-08-18 01:05:31.235+00	2019-08-18 01:05:31.235+00	45	1
44	2019-08-18 01:05:31.241+00	2019-08-18 01:05:31.241+00	46	4
45	2019-08-18 01:05:31.25+00	2019-08-18 01:05:31.25+00	51	1
46	2019-08-18 01:05:31.26+00	2019-08-18 01:05:31.26+00	48	6
47	2019-08-18 01:05:31.267+00	2019-08-18 01:05:31.267+00	50	1
48	2019-08-18 01:05:31.272+00	2019-08-18 01:05:31.272+00	52	1
49	2019-08-18 01:05:31.276+00	2019-08-18 01:05:31.276+00	53	1
50	2019-08-18 01:05:31.291+00	2019-08-18 01:05:31.291+00	54	1
51	2019-08-18 01:05:31.295+00	2019-08-18 01:05:31.295+00	55	1
52	2019-08-18 01:05:31.298+00	2019-08-18 01:05:31.298+00	57	1
53	2019-08-18 01:05:31.301+00	2019-08-18 01:05:31.301+00	56	1
54	2019-08-18 01:05:31.304+00	2019-08-18 01:05:31.304+00	58	1
55	2019-08-18 01:05:31.307+00	2019-08-18 01:05:31.307+00	59	1
56	2019-08-18 01:05:31.31+00	2019-08-18 01:05:31.31+00	60	1
57	2019-08-18 01:05:31.312+00	2019-08-18 01:05:31.312+00	61	1
58	2019-08-18 01:05:31.315+00	2019-08-18 01:05:31.315+00	62	1
59	2019-08-18 01:05:31.323+00	2019-08-18 01:05:31.323+00	63	1
60	2019-08-18 01:05:31.332+00	2019-08-18 01:05:31.332+00	66	7
61	2019-08-18 01:05:31.335+00	2019-08-18 01:05:31.335+00	69	7
62	2019-08-18 01:05:31.34+00	2019-08-18 01:05:31.34+00	70	7
63	2019-08-18 01:05:31.344+00	2019-08-18 01:05:31.344+00	71	1
64	2019-08-18 01:05:31.347+00	2019-08-18 01:05:31.347+00	72	1
65	2019-08-18 01:05:31.352+00	2019-08-18 01:05:31.352+00	1	1
66	2019-08-18 01:05:31.362+00	2019-08-18 01:05:31.362+00	2	1
67	2019-08-18 01:05:31.423+00	2019-08-18 01:05:31.423+00	47	4
68	2019-08-18 01:05:31.425+00	2019-08-18 01:05:31.425+00	49	6
69	2019-08-18 01:05:31.448+00	2019-08-18 01:05:31.448+00	64	1
70	2019-08-18 01:05:31.45+00	2019-08-18 01:05:31.45+00	65	1
71	2019-08-18 01:05:31.454+00	2019-08-18 01:05:31.454+00	67	7
72	2019-08-18 01:05:31.459+00	2019-08-18 01:05:31.459+00	68	7
74	2019-08-23 15:07:00.826+00	2019-08-23 15:07:00.826+00	74	1
73	2019-08-19 09:30:07.26+00	2019-08-19 09:30:07.26+00	\N	1
75	2019-10-23 17:44:34.694+00	2019-10-23 17:44:34.694+00	77	1
76	2019-10-23 20:10:51.528+00	2019-10-23 20:10:51.528+00	76	1
77	2019-10-23 20:25:31.535+00	2019-10-23 20:25:31.535+00	32	4
78	2019-10-23 20:49:50.489+00	2019-10-23 20:49:50.489+00	26	7
79	2019-10-24 22:54:08.494+00	2019-10-24 22:54:08.494+00	78	1
80	2019-10-24 22:56:58.247+00	2019-10-24 22:56:58.247+00	79	1
81	2019-10-24 23:02:23.03+00	2019-10-24 23:02:23.03+00	80	1
82	2019-10-24 23:05:02.624+00	2019-10-24 23:05:02.624+00	81	1
83	2019-10-24 23:09:08.334+00	2019-10-24 23:09:08.334+00	82	1
84	2019-10-24 23:16:50.265+00	2019-10-24 23:16:50.265+00	83	1
85	2019-10-24 23:21:03.34+00	2019-10-24 23:21:03.34+00	84	1
86	2019-10-24 23:29:53.404+00	2019-10-24 23:29:53.404+00	85	1
87	2019-10-29 20:51:15.996+00	2019-10-29 20:51:15.996+00	86	3
88	2019-11-04 16:15:21.631+00	2019-11-04 16:15:21.631+00	87	1
89	2019-11-04 16:24:06.473+00	2019-11-04 16:24:06.473+00	88	1
90	2019-11-04 16:31:22.195+00	2019-11-04 16:31:22.195+00	89	1
91	2019-11-04 16:35:02.366+00	2019-11-04 16:35:02.366+00	90	1
92	2019-11-04 16:38:54.515+00	2019-11-04 16:38:54.515+00	91	1
93	2019-11-04 16:43:06.009+00	2019-11-04 16:43:06.009+00	92	4
94	2019-11-04 16:47:33.196+00	2019-11-04 16:47:33.196+00	93	4
95	2019-11-04 16:51:01.002+00	2019-11-04 16:51:01.002+00	94	4
96	2019-11-04 17:05:07.28+00	2019-11-04 17:05:07.28+00	95	4
97	2019-11-04 17:08:58.575+00	2019-11-04 17:08:58.575+00	96	4
98	2019-11-04 17:12:17.355+00	2019-11-04 17:12:17.355+00	97	4
99	2019-11-04 17:15:20.606+00	2019-11-04 17:15:20.606+00	98	4
100	2019-11-04 17:34:04.606+00	2019-11-04 17:34:04.606+00	99	7
101	2019-11-04 18:00:23.162+00	2019-11-04 18:00:23.162+00	100	20
102	2019-11-04 18:07:39.139+00	2019-11-04 18:07:39.139+00	101	29
103	2019-11-04 18:18:20.842+00	2019-11-04 18:18:20.842+00	102	29
\.


--
-- Data for Name: book_writers; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.book_writers (id, created_at, updated_at, book_id, writer_id) FROM stdin;
1	2019-08-18 01:05:30.624+00	2019-08-18 01:05:30.624+00	4	1
2	2019-08-18 01:05:30.639+00	2019-08-18 01:05:30.639+00	1	2
3	2019-08-18 01:05:30.645+00	2019-08-18 01:05:30.645+00	3	3
4	2019-08-18 01:05:30.648+00	2019-08-18 01:05:30.648+00	5	4
5	2019-08-18 01:05:30.657+00	2019-08-18 01:05:30.657+00	6	1
6	2019-08-18 01:05:30.665+00	2019-08-18 01:05:30.665+00	9	1
7	2019-08-18 01:05:30.666+00	2019-08-18 01:05:30.666+00	8	1
8	2019-08-18 01:05:30.671+00	2019-08-18 01:05:30.671+00	7	4
9	2019-08-18 01:05:30.674+00	2019-08-18 01:05:30.674+00	11	1
10	2019-08-18 01:05:30.679+00	2019-08-18 01:05:30.679+00	10	5
11	2019-08-18 01:05:30.681+00	2019-08-18 01:05:30.681+00	12	4
12	2019-08-18 01:05:30.686+00	2019-08-18 01:05:30.686+00	14	1
13	2019-08-18 01:05:30.693+00	2019-08-18 01:05:30.693+00	15	4
14	2019-08-18 01:05:30.698+00	2019-08-18 01:05:30.698+00	13	6
15	2019-08-18 01:05:30.702+00	2019-08-18 01:05:30.702+00	16	3
16	2019-08-18 01:05:30.71+00	2019-08-18 01:05:30.71+00	17	7
17	2019-08-18 01:05:30.714+00	2019-08-18 01:05:30.714+00	18	4
18	2019-08-18 01:05:30.719+00	2019-08-18 01:05:30.719+00	19	1
19	2019-08-18 01:05:30.739+00	2019-08-18 01:05:30.739+00	20	1
20	2019-08-18 01:05:30.747+00	2019-08-18 01:05:30.747+00	21	1
21	2019-08-18 01:05:30.752+00	2019-08-18 01:05:30.752+00	22	2
22	2019-08-18 01:05:30.761+00	2019-08-18 01:05:30.761+00	23	8
23	2019-08-18 01:05:30.764+00	2019-08-18 01:05:30.764+00	24	9
24	2019-08-18 01:05:30.772+00	2019-08-18 01:05:30.772+00	25	4
25	2019-08-18 01:05:30.778+00	2019-08-18 01:05:30.778+00	27	2
27	2019-08-18 01:05:30.798+00	2019-08-18 01:05:30.798+00	30	1
28	2019-08-18 01:05:30.8+00	2019-08-18 01:05:30.8+00	28	11
29	2019-08-18 01:05:30.805+00	2019-08-18 01:05:30.805+00	29	4
30	2019-08-18 01:05:30.807+00	2019-08-18 01:05:30.807+00	31	12
32	2019-08-18 01:05:30.825+00	2019-08-18 01:05:30.825+00	33	14
33	2019-08-18 01:05:30.829+00	2019-08-18 01:05:30.829+00	34	15
36	2019-08-18 01:05:30.835+00	2019-08-18 01:05:30.835+00	35	15
37	2019-08-18 01:05:30.841+00	2019-08-18 01:05:30.841+00	37	17
38	2019-08-18 01:05:30.843+00	2019-08-18 01:05:30.843+00	38	18
39	2019-08-18 01:05:30.845+00	2019-08-18 01:05:30.845+00	39	7
40	2019-08-18 01:05:30.85+00	2019-08-18 01:05:30.85+00	40	19
41	2019-08-18 01:05:30.856+00	2019-08-18 01:05:30.856+00	41	20
42	2019-08-18 01:05:30.856+00	2019-08-18 01:05:30.856+00	41	21
43	2019-08-18 01:05:30.859+00	2019-08-18 01:05:30.859+00	42	22
44	2019-08-18 01:05:30.878+00	2019-08-18 01:05:30.878+00	43	23
45	2019-08-18 01:05:30.88+00	2019-08-18 01:05:30.88+00	44	23
46	2019-08-18 01:05:30.885+00	2019-08-18 01:05:30.885+00	45	4
47	2019-08-18 01:05:30.887+00	2019-08-18 01:05:30.887+00	46	24
48	2019-08-18 01:05:30.894+00	2019-08-18 01:05:30.894+00	47	25
49	2019-08-18 01:05:30.906+00	2019-08-18 01:05:30.906+00	51	10
50	2019-08-18 01:05:30.907+00	2019-08-18 01:05:30.907+00	48	26
51	2019-08-18 01:05:30.914+00	2019-08-18 01:05:30.914+00	50	27
52	2019-08-18 01:05:30.915+00	2019-08-18 01:05:30.915+00	52	10
53	2019-08-18 01:05:30.917+00	2019-08-18 01:05:30.917+00	53	10
54	2019-08-18 01:05:30.921+00	2019-08-18 01:05:30.921+00	54	10
55	2019-08-18 01:05:30.93+00	2019-08-18 01:05:30.93+00	55	4
56	2019-08-18 01:05:30.934+00	2019-08-18 01:05:30.934+00	57	10
57	2019-08-18 01:05:30.937+00	2019-08-18 01:05:30.937+00	56	28
58	2019-08-18 01:05:30.943+00	2019-08-18 01:05:30.943+00	58	10
59	2019-08-18 01:05:30.947+00	2019-08-18 01:05:30.947+00	59	1
60	2019-08-18 01:05:30.95+00	2019-08-18 01:05:30.95+00	60	10
61	2019-08-18 01:05:30.954+00	2019-08-18 01:05:30.954+00	61	10
62	2019-08-18 01:05:30.958+00	2019-08-18 01:05:30.958+00	62	10
63	2019-08-18 01:05:30.98+00	2019-08-18 01:05:30.98+00	63	29
64	2019-08-18 01:05:30.992+00	2019-08-18 01:05:30.992+00	66	29
65	2019-08-18 01:05:30.995+00	2019-08-18 01:05:30.995+00	68	29
66	2019-08-18 01:05:31.005+00	2019-08-18 01:05:31.005+00	69	29
67	2019-08-18 01:05:31.007+00	2019-08-18 01:05:31.007+00	70	29
68	2019-08-18 01:05:31.017+00	2019-08-18 01:05:31.017+00	71	31
69	2019-08-18 01:05:31.022+00	2019-08-18 01:05:31.022+00	72	32
70	2019-08-18 01:05:31.047+00	2019-08-18 01:05:31.047+00	2	1
71	2019-08-18 01:05:31.246+00	2019-08-18 01:05:31.246+00	49	26
72	2019-08-18 01:05:31.318+00	2019-08-18 01:05:31.318+00	64	29
73	2019-08-18 01:05:31.32+00	2019-08-18 01:05:31.32+00	65	29
74	2019-08-18 01:05:31.327+00	2019-08-18 01:05:31.327+00	67	29
75	2019-08-19 09:30:07.25+00	2019-08-19 09:30:07.25+00	\N	28
76	2019-08-23 17:04:25.274+00	2019-08-23 17:04:25.274+00	\N	22
77	2019-10-23 20:10:51.517+00	2019-10-23 20:10:51.517+00	76	23
78	2019-10-23 20:19:57.076+00	2019-10-23 20:19:57.076+00	36	2
79	2019-10-23 20:25:31.52+00	2019-10-23 20:25:31.52+00	32	24
80	2019-10-23 20:49:50.474+00	2019-10-23 20:49:50.474+00	26	23
81	2019-10-24 22:54:08.486+00	2019-10-24 22:54:08.486+00	78	7
82	2019-10-24 22:56:58.241+00	2019-10-24 22:56:58.241+00	79	7
83	2019-10-24 23:02:45.859+00	2019-10-24 23:02:45.859+00	80	34
84	2019-10-24 23:05:02.619+00	2019-10-24 23:05:02.619+00	81	34
85	2019-10-24 23:09:08.327+00	2019-10-24 23:09:08.327+00	82	7
86	2019-10-24 23:17:03.248+00	2019-10-24 23:17:03.248+00	83	35
87	2019-10-24 23:21:24.764+00	2019-10-24 23:21:24.764+00	84	35
88	2019-10-24 23:21:24.764+00	2019-10-24 23:21:24.764+00	84	36
89	2019-10-24 23:30:07.378+00	2019-10-24 23:30:07.378+00	85	37
90	2019-10-29 20:51:15.983+00	2019-10-29 20:51:15.983+00	86	38
91	2019-11-04 16:15:45.462+00	2019-11-04 16:15:45.462+00	87	39
92	2019-11-04 16:24:56.661+00	2019-11-04 16:24:56.661+00	88	40
93	2019-11-04 16:32:06.19+00	2019-11-04 16:32:06.19+00	89	41
94	2019-11-04 16:35:02.361+00	2019-11-04 16:35:02.361+00	90	41
95	2019-11-04 16:38:54.506+00	2019-11-04 16:38:54.506+00	91	41
96	2019-11-04 16:43:06+00	2019-11-04 16:43:06+00	92	24
97	2019-11-04 16:47:33.19+00	2019-11-04 16:47:33.19+00	93	24
98	2019-11-04 16:51:00.996+00	2019-11-04 16:51:00.996+00	94	24
99	2019-11-04 17:05:35.978+00	2019-11-04 17:05:35.978+00	95	42
100	2019-11-04 17:08:58.566+00	2019-11-04 17:08:58.566+00	96	42
101	2019-11-04 17:12:17.347+00	2019-11-04 17:12:17.347+00	97	42
102	2019-11-04 17:15:20.602+00	2019-11-04 17:15:20.602+00	98	42
103	2019-11-04 17:34:23.987+00	2019-11-04 17:34:23.987+00	99	43
104	2019-11-04 18:06:49.809+00	2019-11-04 18:06:49.809+00	101	44
105	2019-11-04 18:18:20.828+00	2019-11-04 18:18:20.828+00	102	45
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.books (id, isbn, title, edition, pages, description, publishing_date, format, price, thumbnail, total_rating, total_favorites, created_at, updated_at, isbn_10) FROM stdin;
7	9788573515473	Batman - A Piada Mortal	Edição Única	216	Um dia ruim. É apenas isso que separa o homem são da loucura. Pelo menos segundo o Coringa, um dos maiores e mais conhecidos vilões dos quadrinhos. E ele quer provar seu ponto de vista enlouquecendo ninguém menos que o maior aliado de seu grande inimigo: o Comissário Gordon. Cabe ao Cavaleiro das Trevas impedi-lo.	2019-10-13 00:00:00+00	(17 x 26 cm)\nColorido/Capa dura	19.90	static/covers/978-8573515473.jpg	5	0	2019-08-18 01:05:29.676+00	2019-10-24 22:44:37.595+00	\N
1	9788573517941	Batman - Ano Um	Edição Única	148	Bruce Wayne e James Gordon chegam à Gotham ao mesmo tempo, com missões diferentes. Gordon junta-se à polícia da cidade, descobrindo logo que ela é corrupta. Wayne, disfarçado de vagabundo, testa seus anos de treinamento em uma simples briga de rua na Zona Leste, que não sai como ele planejou: ele acaba baleado. Ferido e em busca de inspiração, ele tem uma ideia quando vê um morcego voando pela janela.	2017-04-10 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	37.00	static/covers/978-8573517941.jpg	0	0	2019-08-18 01:05:29.674+00	2019-10-24 22:47:31.913+00	\N
2	8573516976	One Piece	Edição 1	192	Luffy é um garoto que deseja tornar-se um pirata por causa do Shanks. Durante uma discussão com Shanks por causa de alguns bandidos das montanhas, o garoto acaba comendo a Gomu Gomu no Mi. Mais tarde, porém, os bandidos retornam e Luffy decide comprar briga com eles bem quando os piratas não estão lá para protegê-lo. Shanks salva Luffy, mas acaba perdendo seu braço esquerdo por conta disso e logo deixa seu chapéu com o garoto.	2012-03-20 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/8573516976.jpg	5	0	2019-08-18 01:05:29.675+00	2019-10-24 22:43:22.473+00	\N
5	9788583681403	V de vingança	Edição Única	304	Numa Inglaterra dominada por um regime totalitário, uma figura misteriosa chamada simplesmente V, usando vestimentas e uma máscara que evocam a imagem de um infame personagem histórico britânico, desponta no horizonte como a única chance de que haja liberdade novamente.	2018-09-05 00:00:00+00	(17 x 26 cm)\nColorido/Lombada quadrada	24.90	static/covers/978-8583681403.jpg	4	0	2019-08-18 01:05:29.676+00	2019-10-24 22:42:38.772+00	\N
3	9788573516531	Sandman	Edição 1	616	Londres, 1916. John Hathaway, curador do museu real, ao perder o filho na 1ª Guerra Mundial, se rende às investidas do ardiloso Roderick Burgess, o "Rei-Demônio", um místico, líder da seita chamada "A Ordem". \nHathaway lhe entrega um livro que permitirá a Burgess realizar seu maior feito: capturar a Morte em pessoa. \nMas algo sai errado e ele pega Morpheus, o Senhor dos Sonhos. Enquanto Burgess envelhece amargurado e o mundo vive uma estranha doença do sono, Morpheus prepara sua fuga e vingança	2010-04-01 00:00:00+00	(19 x 28 cm)\nColorido/Capa dura	145.00	static/covers/978-8573516531.jpg	0	0	2019-08-18 01:05:29.675+00	2019-10-24 22:48:11.182+00	\N
4	8573518847	One Piece	Edição 2	204	Luffy conhece a Nami, os dois conversam um pouco e descobrem que ambos pretendem ir para a Grand Line. Luffy pergunta se ela quer se juntar a ele como navegadora de seu bando pirata para irem à Grand Line, mas ao saber que Luffy era um pirata, ela se nega a trabalhar junto com ele. A garota então decide entregar Luffy para Buggy e o amarra. O pirata, que está dominando a vila, mostra possuir o poder de uma Akuma no Mi e fica bastante surpreso ao saber que Nami estava vindo ao seu encontro.	2012-03-01 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/8573518847.jpg	0	0	2019-08-18 01:05:29.676+00	2019-10-24 22:48:28.122+00	\N
6	9788573518931	One Piece	Edição 3	204	Buggy admite conhecer Shanks, mas não está disposto a contar nada do que sabe a Luffy. Os dois começam a lutar utilizando seus poderes adquiridos pela Akuma no mi, tornando a luta bem equilibrada. Porém, Luffy é surpreendido por Buggy, que o acerta, atingindo ainda seu tão precioso chapéu de palha. Ao perceber a raiva de Luffy por ter seu tesouro atingido, o palhaço volta a mirar contra ela e o perfura. Luffy avança furioso para cima de Buggy, que descobre que aquele chapéu pertencia a Shanks.	2012-04-01 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/9788573518931.jpg	0	0	2019-08-18 01:05:29.676+00	2019-10-24 22:48:39.59+00	\N
8	9788573519105	One Piece	Edição 5	196	Fugindo pela floresta, os piratas de Usopp correm com Kaya para se protegerem de Jango, que consegue destruir várias árvores com seu chackram. Na ladeira, todos ouvem o barulho que vem da floresta e ficam apreensivos. Usopp mal consegue se mover e os piratas de Jango começam a rir do atirador. Luffy se enfurece e os ataca, perguntando qual é a graça naquilo. Zoro derrota facilmente Buchi e carrega Usopp nas costas como guia e parte para a floresta. Luffy e Kuro começam a se enfrentar para valer.	2012-06-01 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/9788573519105.jpg	0	0	2019-08-18 01:05:29.677+00	2019-10-24 22:48:58.833+00	\N
10	9788565484015	Batman - O Filho do Demônio	Edição Única	96	Batman é obrigado a se aliar ao seu maior adversário para deter um terrorista sanguinário e insano que obtém o controle de uma máquina capaz de manipular o clima. Assim, o Cruzado Encapuzado se vê em uma difícil situação, tendo de caçar o sádico criminoso e, ao mesmo tempo, proteger Talia, a mulher que pode estar carregando em seu ventre o filho do Homem-Morcego.	2012-09-01 00:00:00+00	(21 x 28 cm)\nColorido/Capa dura	17.90	static/covers/978-8565484015.jpg	0	0	2019-08-18 01:05:29.677+00	2019-10-24 22:49:13.84+00	\N
13	9788535906288	Maus	Edição Única	300	O trecho final da história do pai de Art é contada até o final da guerra. O trabalho metalingüístico assume proporções únicas nesta segunda parte.\nTraduzido para mais de dezoito línguas, MAUS foi a única história em quadrinhos a ganhar o Prêmio Pulitzer.	2005-06-01 00:00:00+00	(16 x 23 cm)\nColorido/Preto e branco/Lombada quadrada	39.00	static/covers/978-8535906288.jpg	0	0	2019-08-18 01:05:29.678+00	2019-10-24 22:49:34.821+00	\N
12	9788565484497	Superman - O Que Aconteceu Ao Homem de Aço?	Edição Única	132	Lois Lane Elliott, agora casada, mãe e uma feliz dona de casa, recebe um repórter do Planeta Diário e relembra os acontecimentos de dez anos antes, quando o mundo viu o Superman pela última vez e este teve sua maior e derradeira aventura. Clássica aventura que serviu de despedida para o Superman Pré-Crise (1938-1985) e para o lendário editor Julius Schwartz, ícone da Era de Prata dos Quadrinhos.	2013-07-01 00:00:00+00	(17 x 26 cm)\nColorido/Capa dura	19.90	static/covers/978-8565484497.jpg	0	0	2019-08-18 01:05:29.678+00	2019-10-24 22:49:56.092+00	\N
24	9788565484060	Grandes Astros Superman	Edição Única	308	Superman vai até o sol para salvar a tripulação da nave "Ray Bradbury". No entanto, a ameaça se revela uma armadilha de Lex Luthor - que, ao descobrir que está envelhecendo, resolve matar seu velho inimigo com uma sobrecarga nas suas baterias solares de seu corpo	2018-04-22 00:00:00+00	(19 x 28 cm)\nColorido/Capa dura	86.00	static/covers/9788565484060.jpg	0	0	2019-08-18 01:05:29.68+00	2019-10-23 20:59:34.302+00	\N
49	9788550404134	Valerian Integral	Edição 2	172	Fruto da imaginação transbordante de Pierre Christin e Jean-Claude Mézières, os personagens de Valerian e Laureline surgiram pela primeira vez nas páginas de PILOTE, em 1967. Por sua inventividade e audácia, a série rapidamente se tornou referência absoluta para os leitores de histórias em quadrinhos de ficção científica.	2017-08-01 00:00:00+00	(21,5 x 29 cm)\nColorido/Lombada quadrada	58.00	static/covers/9788550404134.png	0	0	2019-08-18 01:05:29.687+00	2019-10-23 19:56:28.487+00	\N
59	9788573519273	One Piece	Edição 7	196	O restaurante flutuante Baratie está sob ataque do almirante pirata Don Krieg! Mas Luffy, Sanji e os cozinheiros do mar defenderão o legado de Zeff!!	2012-08-01 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/9788573519273.jpg	0	0	2019-08-18 01:05:29.689+00	2019-10-23 20:02:27.633+00	\N
39	9788573516630	Kick-Ass	Edição 1	212	O que acontece quando um cara comum numa roupa de látex fica frente a frente com o submundo do crime? É isso que o jovem Dave Lizewski está prestes a descobrir. Afinal, as pessoas têm apenas uma vida, e Dave quer que a dele seja empolgante. A qualquer preço.	2010-06-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	60.00	static/covers/978-8573516630.jpg	0	0	2019-08-18 01:05:29.685+00	2019-10-23 20:12:04.661+00	\N
34	9788583680901	Aquaman As Profundezas	Edição 1	144	O soberano dos mares tomou sua decisão. De agora em diante, seu lar será a superfície e, sua missão, proteger os habitantes desse mundo. Mas as profundezas guardam surpresas bastante desagradáveis para o herói. Vindos das fossas abissais, criaturas pavorosas planejam um ataque cruel à pequena cidade próxima ao farol habitado por Aquaman.	2015-05-28 00:00:00+00	Americano (17 x 26 cm) Colorido/Capa dura	25.90	static/covers/978-8583680901.jpg	0	0	2019-08-18 01:05:29.682+00	2019-10-23 20:30:01.747+00	\N
14	9788573519402	One Piece	Edição 8	196	O gás tóxico do MH5 tem como principal vítima Gin, único a sofrer todo o ataque sem uma máscara. Luffy parte para cima de Don Krieg com tudo, que volta a disparar dardos contra ele. Sem se importar, o garoto enfim se aproxima de Don Krieg, que usa um manto de espinhos para se proteger. Mesmo assim, Luffy não se importa e desfere um poderoso soco no oponente, atingindo os espinhos no processo. Zeff manda Sanji prestar atenção na luta de Luffy e perceber sua determinação.	2012-09-01 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/9788573519402.jpg	0	0	2019-08-18 01:05:29.678+00	2019-10-24 22:49:23.524+00	\N
15	9781401220839	Saga do Monstro do Pântano	Edição 1	212	Após a última batalha contra seu inimigo Arcane, o Monstro do Pântano se separa de seus amigos Abby e Matt Cable, Liz Tremayne e Dennis Barclay para se certificar que o vilão morreu na queda de sua aeronave. Contudo, o que o herói pantanoso nem desconfia é que a temível organização Sunderland está em seu encalço e está disposta a tudo para capturá-lo, vivo ou morto	2014-04-01 00:00:00+00	(17 x 26 cm)\nColorido/Lombada quadrada	23.90	static/covers/978-1401220839.jpg	0	0	2019-08-18 01:05:29.678+00	2019-10-24 22:49:45.192+00	\N
19	9788573519990	One Piece	Edição 14	196	Culpando os chapéus de palha pela bomba, Dorey ataca Luffy. O garoto tem dificuldades contra o gigante, mas após uma dura luta consegue derrubar Dorey, acalmando um pouco o gigante. Em outra parte da ilha, Mr. 5 se encontra com Mr. 3 em uma casa feita de cera no meio da floresta. O agente faz pouco dos dois de número mais elevado e em seguida sugere um plano para a captura dos dois gigantes que ainda possuem recompensas ativas.	2013-03-01 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/978-8573519990.jpg	0	0	2019-08-18 01:05:29.679+00	2019-10-24 22:50:27.216+00	\N
29	9788542613896	A Saga do Monstro do Pântano	Edição 4	228	De 1983 a 1987, um jovem escritor britânico chamado Alan Moore revolucionou os quadrinhos dos Estados Unidos. Sua ousada abordagem na série do Monstro do Pântano, da DC Comics, definiu novos padrões para a narrativa gráfica e desencadeou uma revolução na nona arte que repercute até os dias de hoje. Partindo das premissas de horror gótico do título e construindo um marcante e intuitivo estilo narrativo e uma profundidade de caracterização sem precedentes, a visão de Moore foi traduzida assombrosamente em belos desenhos de colaboradores como Stephen Bissette, John Totleben, Rick Veitch e Alfredo Alcala. O resultado é uma das mais duradouras obras-primas dos quadrinhos.  Este volume reúne as edições 43 a 50 de Swamp Thing, e inclui as clássicas histórias O Parlamento das Árvores e Fim, bem como textos introdutórios de Charles Shaar Murray e Neil Gaiman.	2015-04-01 00:00:00+00	(17 x 26 cm)\nColorido/Lombada quadrada	32.90	static/covers/789765352158604.jpg	3	0	2019-08-18 01:05:29.681+00	2019-10-25 03:15:08.895+00	\N
50	9788583681915	Skreemer	Edição Única	180	O coronel Nick Fury, diretor da SHIELD, descobre que uma mente sinistra está financiando alguns dos supervilões mais perigosos do planeta. Decidido a combater a terrível e sombria ameaça, monta uma equipe de operações secretas composta por Homem-Aranha, Wolverine, Demolidor, Capitão América e Luke Cage. Porém, um ano depois, o passado volta para assombrar os integrantes e uma série de eventos começa a ocorrer, colocando em risco não apenas suas vidas, mas de todas as pessoas que lhes são caras.	2017-07-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	59.00	static/covers/9788583681915.png	0	0	2019-08-18 01:05:29.687+00	2019-10-23 19:59:14.784+00	\N
45	9788583682264	Providence	Edição Única	176	Nova York, 1919. Robert Black é um repórter que há pouco tempo encontrou seu próprio lugar no mundo. O súbito suicídio de uma pessoa querida o conduz por uma estrada misteriosa, na descoberta do lado sombrio dos Estados Unidos. É uma estrada sinuosa, labiríntica. É a estrada para Providence. Pela primeira vez no Brasil, o primeiro tomo da obra-prima de Alan Moore e Jacen Burrows.	2017-05-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	62.00	static/covers/9788583682264.png	0	0	2019-08-18 01:05:29.686+00	2019-10-23 20:06:12.017+00	\N
60	9788573516357	Preacher - Salvação	Edição 7	260	A busca por Deus levou Jesse Custer a uma peregrinação ao redor do mundo – e lhe custou muito caro. Após uma batalha apocalíptica com as forças do Graal, Jesse caiu de um avião para uma morte praticamente certa… mas acordou um mês depois sem um olho e sem a memória de como sobreviveu. Mas isso não foi nada perto da dor de ter encontrado a mulher que ama nos braços de seu melhor amigo! \n\nDepois de encarar isso, Jesse precisa de um tempo para pensar sobre seu objetivo e encontrar sua SALVAÇÃO – e, para essa busca, nada mais apropriado que a pequena cidade de Salvation, no Texas. Mas a cidade tem seus problemas, encarnados principalmente na forma de um psicótico barão de matadouros chamado Odin Quincannon. Pra sorte de Jesse a cidade tem uma vaga no escritório do Xerife – mas será que ele está pronto para os segredos que se escondem nas entranhas de Salvation?	2010-02-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	62.00	static/covers/9788573516357.png	0	0	2019-08-18 01:05:29.689+00	2019-10-23 19:58:07.213+00	\N
35	9788565484701	Batman	Edição 1	152	Em uma Gotham City onde amigo e inimigos são indistinguíveis, o caminho de Bruce Wayne para se tornar o Cavaleiro das Trevas está mais cheio de obstáculos do que nunca.\nObcecado em punir os verdadeiros assassinos de seus pais, e o policial corrupto que o deixou em liberdade, a sede de vingança de Wayne alimenta sua cruzada e ninguém, nem mesmo Alfred, pode detê-lo.	2013-12-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	21.90	static/covers/978-8565484701.jpg	0	0	2019-08-18 01:05:29.684+00	2019-10-23 20:13:37.523+00	\N
40	9788565484770	Surfista Prateado	Edição Única	92	O único oponente do Devorador de Mundos é o herói que ele aprisionou na Terra: o Surfista Prateado, Galactus jurou não consumir o planeta, mas e se, em vez disso, ele transformar a civilização em seus adoradores? Aos terráqueos o semideus promete um futuro melhor, mas nenhuma outra pessoa conhece os verdadeiros propósitos dele do que o Surfista Prateado, seu antigo arauto. Aos possíveis discípulos do Devorador, resta somente assistir ao colossal confronto das duas divindades intergalácticas!	2014-03-01 00:00:00+00	(19 x 28 cm)\nColorido/Capa dura	21.90	static/covers/978-8565484770.jpg	0	0	2019-08-18 01:05:29.685+00	2019-10-23 20:12:18.28+00	\N
30	9788542600513	One Piece	Edição 20	212	Luffy manda seus companheiros seguirem sem ele, enquanto ele fica para enfrentar Crocodile. Apesar de cheia de dúvidas, Vivi decide seguir sem o capitão, com a promessa de encontrá-lo em Alubarna. Após uma breve conversa, Miss All Sunday tem seu nome revelado por Mr. 0 e parte na frente, deixando Luffy e Crocodile para lutar. O Shichibukai dá a seu oponente um tempo antes de começar a lutar a sério, mas não importa o que Luffy faça e que ataque usa, nada afeta seu inimigo	2013-09-24 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/978-8542600513.jpg	0	0	2019-08-18 01:05:29.681+00	2019-10-23 20:31:54.016+00	\N
16	9788565484343	Batman - O Que Aconteceu Ao Cavaleiro das Trevas?	Edição Única	132	Ele é o protetor de Gotham City, o espírito vingador da cidade, seu Cavaleiro das Trevas. \nPor anos, ele travou sua guerra de um homem só para manter as ruas seguras, mas, esta noite, a guerra causou sua última e maior baixa - o próprio Batman. \nO Cruzado Encapuzado agora descansa em um caixão no Beco do Crime, o lugar onde nasceu. \nSeus amigos mais próximos e seus inimigos mais mortais se reúnem para prestar uma última homenagem.	2013-04-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	21.90	static/covers/978-8565484343.jpg	0	0	2019-08-18 01:05:29.679+00	2019-10-24 22:50:07.558+00	\N
20	9788542600018	One Piece	Edição 15	220	Após a batalha, para surpresa geral, Dorey levanta-se. Burogy se alegra ao ver que seu amigo ainda está vivo. Enquanto isso no esconderijo de Mr. 3, Sanji atende o Den Den Mushi e fala diretamente com Mr. 0, o líder da Baroque Works. O cozinheiro diz ao Shichibukai que havia matado os chapéus de palha, passando-se por Mr. 3. Em meio a isso, ele é atacado e derrota os Unluckies, mas faz Crocodile acreditar em sua história.	2013-04-01 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/9788542600018.jpg	0	0	2019-08-18 01:05:29.679+00	2019-10-24 22:50:37.309+00	\N
25	8542612531	Saga do Monstro do Pântano	Edição 3	210	Início da épica saga "Gótico Americano", onde Alan Moore aumenta a dose de terror na revista e a liga à saga "Crise Nas Infinitas Terras". Nesta primeira HQ, o Monstro do Pântano e sua amada Abby Cable estão aproveitando sua intimidade no Bayou até que sua paz é perturbada por um sarcástico visitante: um mago inglês chamado John Constantine, que avisa ao Monstro que um grande mal recairá sobre o mundo e que só ele poderá impedir	2018-08-01 00:00:00+00	(17 x 26 cm)\nColorido/Lombada quadrada	30.90	static/covers/789765352158603.jpg	5	0	2019-08-18 01:05:29.68+00	2019-10-25 02:52:18.789+00	\N
56	9788565484640	Reino do Amanhã	Edição Única	340	Em um futuro não muito distante, a Terra se tornou o reino dos super-heróis. Infelizmente para os habitantes não tão poderosos do planeta, estes “heróis” vêm se tornando cada vez mais irresponsáveis e destrutivos, colocando em risco a sobrevivência do mundo inteiro. E para piorar a situação, o único ser que pode devolver o bom-senso a essa raça de novas e irascíveis divindades, o envelhecido Superman, se aposentou e se recolheu há anos. Sobre essa premissa básica, o roteirista Mark Waid e o premiado ilustrador Alex Ross construíram Reino do Amanhã, uma das HQs mais marcantes e relevantes da década de 1990, que explora o moderno mito do super-herói de forma nunca antes vista. Agora, essa obra prima da nona arte volta ao Brasil em uma edição repleta de extras inéditos no país e com acabamento de luxo!	2013-10-01 00:00:00+00	(19,5 X 30,5 cm)\nColorido/Capa dura	89.00	static/covers/978-8565484640.jpg	0	0	2019-08-18 01:05:29.688+00	2019-10-23 20:02:46.089+00	\N
41	9788565484572	Turma da Mônica: Laços	Edição 2	80	O Floquinho desapareceu. Para encontrar seu cachorro de estimação, Cebolinha conta com os amigos Cascão, Mônica e Magali e, claro, um plano “infalível”.	2013-06-01 00:00:00+00	(19 x 26 cm)\nColorido/Capa dura	29.90	static/covers/978-8565484572.jpg	0	0	2019-08-18 01:05:29.685+00	2019-10-23 20:12:47.555+00	\N
46	9788545702870	AKIRA	Edição 1	364	Um dos maiores mangás de todos os tempos volta ao Brasil em uma edição especial totalmente remasterizada e em seu formato e leitura originais. Neste primeiro volume, em um mundo pós-apocaliptico, conhecemos Kaneda e Tetsuo, dois amigos membros de uma gangue de motoqueiros arruaceiros que terão suas vidas drasticamente mudadas após o atropelamento de uma estranha criança. Depois do acidente Tetsuo passa a despertar estranhos poderes que acabam chamando a atenção do Governo o qual, atualmente, trabalha em experiências secretas com paranormais.	2017-06-01 00:00:00+00	(18 x 26 cm)\nColorido/Preto e branco/Lombada quadrada	60.00	static/covers/9788545702870.png	0	0	2019-08-18 01:05:29.686+00	2019-10-23 20:04:12.527+00	\N
36	8583680752	Demolidor por Frank miller & Klaus Janson	Edição 1	336	Demolidor, o Homem Sem Medo, já era um dos principais super-heróis da Marvel quando o escritor e desenhista Frank Miller e o ilustrador Klaus Janson se juntaram para redefinir o personagem para uma nova geração, reinventando Matt Murdock como um justiceiro sombrio. O impacto do trabalho levou Miller a criar outras obras queridas pelos leitores (Batman: O Cavaleiro das Trevas, Sin City e 300) e ditou muito da atmosfera com a qual as HQs seriam preenchidas nas décadas seguintes. Nesta edição especial, somos brindados com a fase inicial do personagem segundo a concepção de Miller, apresentando também alguns dos mais importantes vilões enfrentados pelo Demolidor, como o Rei do Crime e o Mercenário, além, claro, da participação de Elektra. 	2014-12-04 00:00:00+00	26,6 x 17,2 x 2 cm	92.00	static/covers/8583680752.png	0	0	2019-08-18 01:05:29.684+00	2019-10-23 20:19:57.122+00	\N
31	9788583680697	X-Men: Deus Ama, O Homem Mata	Edição Única	104	O Professor Charles Xavier e seus pupilos X-Men (Ciclope, Tempestade, Wolverine, Noturno, Kitty Pryde e Colossus) entram na mira do fanático pastor William Stryker, um influente religioso que considera os mutantes uma cria diabólica e uma afronta contra Deus e Sua Criação. \nSeja com suas palavras, seja com sua milícia assassina de mutantes, os Purificadores, Stryker quer guerra e até Magneto se unirá aos heróis nesse confronto feroz combatido não só com punhos, mas com palavras e sentimentos.	2014-11-01 00:00:00+00	(20,5 x 27,5 cm)\nColorido/Capa dura	22.90	static/covers/978-8583680697.jpg	0	0	2019-08-18 01:05:29.682+00	2019-10-23 20:26:16.083+00	\N
21	9788542600322	One Piece	Edição 16	192	Os Rapans provocam uma avalanche. Luffy e Sanji fazem o possível para fujir dela e acabam precisando descer a montanha, ainda perseguidos pelos monstruosos coelhos. Para o bem de Nami, Sanji lança Luffy para um lugar seguro, sendo assim atingido pela avalanche e se perdendo em meio à neve. Enquanto isso, parece que a avalanche afetou as áreas abaixo também, e Wapol e sua tripulação fogem. Após enfim se recuperarem do evento, o antigo rei decide voltar a seu castelo.	2013-05-23 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/978-8542600322.jpg	0	0	2019-08-18 01:05:29.68+00	2019-10-23 20:56:25.992+00	\N
17	9788573516906	Guerra Civil	Edição Única	208	A ação precipitada de um grupo de jovens super-heróis acarreta uma tragédia sem precedentes, deixando um saldo de centenas de mortos. Diante da pressão popular, o governo sanciona uma lei determinando que todos os superseres sejam registrados. A iniciativa divide a comunidade heroica como nunca antes. De um lado, a facção pró-registro, liderada pelo Homem de Ferro; do outro, os contrários à medida, tendo à frente o Capitão América.	2017-09-18 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	58.00	static/covers/978-8573516906.jpg	0	0	2019-08-18 01:05:29.679+00	2019-10-24 22:46:33.445+00	\N
51	8565484009	Preacher - A Caminho do Texas	Edição 1	200	A jornada do reverendo Jesse Custer para acertar as contas com Deus começa aqui. Ao ministrar um sermão após um episódio polêmico em sua comunidade (envolvendo Jesse, um bar e muito uísque), o pastor foi protagonista de um acontecimento religioso de primeira grandeza e teve contato imediato com Gênesis, uma entidade meio anjo, meio demônio, cuja natureza jogou Jesse em uma cruzada moderna. Amalgamado com a criatura, Jesse Custer ganhou uma linha direta com os mistérios da Criação e seus principais personagens. E, dentre todos estes, nenhum é mais importante do que Deus. A missão do reverendo agora é a mais grandiosa (e perigosa) de todas: partir em busca do próprio Criador atrás de respostas! E ele não estará sozinho em seu caminho. Tulipa, uma ex-namorada, e Cassidy, um irlandês envolto em mistérios, entram em cena trazidos por uma coincidência (ou pela Divina Providência) para participarem da jornada. O primeiro passo está dado! A Caminho do Texas traz o início da saga de Preacher.	2012-06-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	58.00	static/covers/8565484009.png	5	0	2019-08-18 01:05:29.687+00	2019-10-25 02:52:29.54+00	\N
37	9788565484671	Justiceiro Max	Edição 1	124	Os chefes das maiores famílias criminosas se uniram para acabar com o Justiceiro para sempre. Eles montaram uma armadilha para Frank usando um subordinado qualquer chamado Wilson Fisk para interpretar “O Rei do Crime”, uma figura imaginária que, sabem eles, chamará a atenção de Frank Castle. Com a emboscada armada, cabe aos seus arquitetos simplesmente aguardar o Justiceiro morder a isca.	2014-02-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	22.90	static/covers/978-8565484671.jpg	0	0	2019-08-18 01:05:29.684+00	2019-10-23 20:13:20.918+00	\N
52	9788565484299	Preacher - Até o Fim do Mundo	Edição 2	256	Tendo a alma mesclada com a entidade angelical-demoníaca conhecida como Gênesis, o reverendo Jesse Custer é agora o único pastor na Terra que realmente tem o dom da Palavra de Deus. Qualquer um que ouça seus comandos precisa obedecer incondicionalmente a eles – ou quase todo mundo. Quando seu inimigo mais letal chega para levá-lo até a fazenda da família, Jesse descobre que não pode confiar tanto n’A Palavra quanto acreditava. E isso é uma péssima notícia para o pregador e sua namorada, Tulipa O’Hare, porque chegou o momento de encarar a figura que transformou a infância de Jesse em um inferno: sua avó. Mas por pior que a senhora Marie L’Angelle possa ser, ainda existem pessoas mais perigosas no mundo e elas já ouviram falar do poder d’A Palavra. Jesse ainda não sabe, mas já foi envolvido na maior e mais terrível conspiração da história do mundo – e vai descobrir como pode ser difícil dizer “não”.	2012-12-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	67.00	static/covers/9788565484299.png	0	0	2019-08-18 01:05:29.687+00	2019-10-23 19:56:45.042+00	\N
47	9788545702320	The Ghost in the Shell	Edição 1	352	Ghost in the Shell foi o futuro distópico de 2029, onde a alta tecnologia se mistura a uma sociedade decadente e desigual.É nesse mundo à beira do colapso que a Major Motoko Kusanagi encabeça a Seção 9 da Segurança Pública japonesa. Motoko é uma ciborgue altamente treinada incumbida de desmantelar uma série de crimes cibernéticos realizados por um hacker conhecido como o Mestre dos Fantoches. Em meio à caça ao criminoso virtual, Masamune Shirow insere na trama questionamentos existencialistas, ponderando até mesmo se alguém provido meramente de Inteligência Artificial é, de fato, um ser vivo. E foi exatamente essa mistura de ficção científica, ação e temas filosóficos que fizeram do mangá The Ghost in the Shell uma leitura obrigatória.	2016-12-01 00:00:00+00	(16,5 x 24 cm)\nColorido/Preto e branco/Lombada quadrada	64.90	static/covers/9788545702320.png	0	0	2019-08-18 01:05:29.686+00	2019-10-23 20:03:37.442+00	\N
18	789765352158602	Saga do Monstro do Pântano	Edição 2	228	Enquanto Abigail Cable retoma a sua vida ao lado do marido Matt, o Monstro do Pântano se pergunta a respeito de estranhas profecias que parecem se aproximar e do significado delas. Aos poucos Abby vai descobrindo que algo estranho está acontecendo em sua vida aparentemente perfeita e que as coisas não são o que parecem.	2014-10-01 00:00:00+00	(17 x 26 cm)\nColorido/Lombada quadrada	24.90	static/covers/789765352158602.jpg	0	0	2019-08-18 01:05:29.679+00	2019-10-24 22:50:16.922+00	\N
32	8545703678	Akira	Edição 2	304	Tetsuo renasce como Número 41, com um poder maior do que Kaneda ou o governo poderiam imaginar. Depois de ingerir a cápsula roubada, escapa do controle do Coronel e ataca a fortaleza escondida embaixo do Estádio Olímpico. Enquanto isso, Miyako, fundadora de uma nova religião, prevê uma grande catástrofe, provocada pelo despertar de AKIRA. O que é AKIRA, o maior segredo da nação?! O aguardado segundo volume do épico de ficção científica AKIRA já está disponível!	2018-06-29 00:00:00+00	(18 x 26 cm) Colorido/Preto e branco/Lombada quadrada	69.90	static/covers/8545703678.png	10	0	2019-08-18 01:05:29.682+00	2019-10-25 02:52:06.487+00	\N
27	9788573513769	Batman O Cavaleiro das Trevas (2ª Edição)	Edição Definitiva	516	A morte violenta de seus pais levou Batman a combater o crime em todas as suas formas durante muitos anos. Porém, ninguém ouviu falar dele em Gotham City na última década. Isto é, até agora	2011-01-01 00:00:00+00	(19 x 28 cm) Colorido/Capa dura	90.00	static/covers/9788573513769.png	0	0	2019-08-18 01:05:29.681+00	2019-10-23 20:35:43.499+00	\N
22	9788583680758	Demolidor Por Frank Miller & Klaus Janson	Edição 2	276	Matt é vítima de sequestro por uma quadrilha que pretende levá-lo ao Arauto da Morte, nem a Viúva Negra consegue impedir o bando. \nNo cemitério o Arauto da Morte quer se vingar do Homem Sem Medo e a luta se inicia.	2015-09-30 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	75.00	static/covers/9788583680758.png	4	0	2019-08-18 01:05:29.68+00	2019-10-23 21:28:19.4+00	\N
43	9788583681632	Gotham - Alvos Fáceis	Edição 2	292	Como se não bastasse lidar com a violência e a corrupção de uma cidade infestada pelo crime (e com os criminosos mais insanos e cruéis da história), a polícia de Gotham também deve levar em conta um vigilante decidido a jogar pelas próprias regras. E, para piorar a situação, o Coringa está aterrorizando a cidade na época de Natal, executando pessoas aleatoriamente com um rifle. E ninguém, do prefeito ao cidadão mais comum, está a salvo! A caçada começa, mas uma atitude desconcertante do Palhaço do Crime deixa todos perplexos. O que o arqui-inimigo do Homem-Morcego realmente pretende? E ainda nesse volume: a história da garota que tem como trabalho ligar o Batsinal. Uma série de assassinatos que acaba chamando a atenção da Caçadora. E um velho caso que ameaça piorar (ainda mais) a vida do detetive Harvey Bullock.	2016-08-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	52.00	static/covers/9788583681632.png	0	0	2019-08-18 01:05:29.686+00	2019-10-23 20:06:43.185+00	\N
68	9788575326398	Saga	Edição 3	152	Terceiro volume da multipremiada série em quadrinhos que tem arrebatado leitores em todo o mundo, tornando-se um dos maiores fenômenos dessa mídia dos últimos tempos. Nesse tomo, os pais de primeira viagem, Marko e Alana, vão até um mundo alienígena para encontrar seu autor preferido, enquanto seus perseguidores se aproximam cada vez mais.	2016-11-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	65.00	static/covers/9788575326398.png	0	0	2019-08-18 01:05:29.69+00	2019-10-23 20:00:19.969+00	\N
58	9788583680741	Preacher - Guerra ao Sol	Edição 6	232	O Todo Poderoso abandonou o Paraíso e o reverendo Jesse Custer – com a ajuda de Tulipa, sua namorada, e do vampiro irlandês Cassidy, seu melhor amigo – pretende descobrir o porquê. Mas o Senhor é difícil de ser localizado, mesmo para alguém cuja alma está mesclada a uma entidade superpoderosa quase onipotente chamada Gênesis. Para descobrir pistas do paradeiro Dele, Jesse precisa entrar fundo em sua própria mente para conversar com seu convidado – e um punhado de peiote colhido sob o céu do Arizon a pode ser justamente o ingrediente que faltava para esse bate-papo. Mas o que aguarda Jesse no Monument Valley, região deserta dos Estados Unidos, é algo muito menos espiritual: um regimento inteiro de tanques do Exército, comandado pelo recém-empossado novo comandante supremo do Graal: Herr Starr. Determinado a tomar o poder de Gênesis para si, Starr está disposto a usar tudo no arsenal do Exército para forçar Jesse a se submeter a sua vontade. Essa disputa não vai acontecer sem baixas	2014-12-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	65.00	static/covers/9788583680741.png	0	0	2019-08-18 01:05:29.688+00	2019-10-23 19:57:25.63+00	\N
53	9788565484565	Preacher - Orgulho Americano	Edição 3	236	O reverendo Jesse Custer quase perdeu a fé quando teve a alma mesclada com a entidade angelical-demoníaca conhecida como Gênesis. O resultado desse encontro explosivo o fez virar o único pastor na Terra que realmente tem o dom da Palavra de Deus e lhe deu um novo objetivo que o levou para uma das jornadas mais bizarras de que se tem notícia: ele está em busca de Deus! Mas os caminhos até Ele são tortuosos e agora Jesse e Tulipa, a namorada que ele reencontrou depois de muito tempo, precisam passar pela França para resgatar seu fiel amigo, o vampiro Cassidy. Lá, ele é mantido prisioneiro pelo Graal, uma organização perigosa e secreta cujo propósito é o de proteger o novo Messias. Mas Herr Starr, um obstinado líder dentro da organização que tem seus próprios planos, pretende que esse Messias seja Jesse Custer. E é aí que a história complica.	2013-06-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	65.00	static/covers/9788565484565.png	0	0	2019-08-18 01:05:29.687+00	2019-10-23 19:56:01.615+00	\N
48	9788550402796	Valerian Integral	Edição 1	160	Fruto da imaginação transbordante de Pierre Christin e Jean-Claude Mézières, os personagens de Valerian e Laureline surgiram pela primeira vez nas páginas de PILOTE, em 1967. Por sua inventividade e audácia, a série rapidamente se tornou referência absoluta para os leitores de histórias em quadrinhos de ficção científica.	2017-05-01 00:00:00+00	(21,5 x 29 cm)\nColorido/Lombada quadrada	35.00	static/covers/9788550402796.png	0	0	2019-08-18 01:05:29.687+00	2019-10-23 19:55:44.23+00	\N
38	9788583680321	Batman	Edição Única	116	A história é inspirada em Um Conto de Natal, de Charles Dickens, mas adaptado para Gotham City. Ao invés do velho Scrooge e de seus fantasmas, aqui é o Batman quem tem que encontrar os termos ideais para ficar em paz com seu passado, presente e futuro para enfrentar a sua galeria de vilões e as ameaças sombrias de hoje em dia, enquanto explora o que significa ser o herói que é	2015-02-01 00:00:00+00	(19 x 28 cm)\nColorido/Capa dura	22.90	static/covers/978-8583680321.jpg	0	0	2019-08-18 01:05:29.685+00	2019-10-23 20:11:41.018+00	\N
33	9788583681106	Revelado	Edição 1	356	O Rei do Crime cai numa emboscada organizada por Silke, e é aparentemente assassinado. Uma semana antes, Matt Murdock está num julgamento contra uma grande multinacional. Após ganhar a disputa judicial, na saída do tribunal, ele sofre um misterioso atentado, e o Demolidor é obrigado a ir atrás do responsável. Existirá uma relação entre a tentativa de homicídio a Matt e a morte do Rei?	2015-06-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	92.00	static/covers/978-8583681106.jpg	0	0	2019-08-18 01:05:29.682+00	2019-10-23 20:20:41.387+00	\N
23	9788573515466	Coringa	Edição Única	132	Um lado mais sombrio e perturbador do homem mais perigoso de Gotham: o Coringa. Após mais uma passagem pelo Asilo Arkham, Coringa descobre ’sua cidade’ dividida entre gângsters e heróis uniformizados. Não contente em ficar com apenas uma fatia do crime, Coringa decide tomar tudo para si do jeito que for necessário.	2015-12-15 00:00:00+00	(17 x 26 cm)\nColorido/Capa dura	24.90	static/covers/978-8573515466.jpg	0	0	2019-08-18 01:05:29.68+00	2019-10-24 22:45:40.178+00	\N
28	9788583680659	Batman A Corte das Corujas	Edição Única	176	Enquanto reflete sobre a natureza de Gotham, Bruce Wayne apresenta seu plano de reforma urbana para a cidade. E um novo assassinato levanta suspeitas sobre um dos mais antigos aliados de Batman	2018-07-27 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	27.90	static/covers/978-8583680659.jpg	0	0	2019-08-18 01:05:29.681+00	2019-10-23 20:50:04.182+00	\N
101	9788569032007	Lavagem	Edição Única	72	No novo trabalho de Shiko, o termo “lavagem” vai além de ser uma mera comida dos porcos ou o cardápio da janta que se prepara naquela noite no casebre. A Lavagem da alma pode ser tanto num banho de sangue, nas águas da maré alta ou no abandono de uma vida atolada no terreno úmido do manguezais.	2015-03-03 00:00:00+00	(19 x 28 cm) Preto e branco/Capa dura	44.00	static/covers/9788569032007.png	0	0	2019-11-04 18:06:49.786+00	2019-11-04 18:06:49.847+00	\N
77	9788573518191	SUPERMAN VS MUHAMMAD ALI	Edição de Luxo 	100	No canto vermelho: lançado do planeta Krypton e energizado pelo sol amarelo da Terra, está o Homem de Aço… Superman. No canto azul: criado em Louisville, Kentucky, e energizado pelo estudo contínuo da nobre arte, está o Maioral em pessoa… Muhammas Ali. Juntos, o Último Filho de Krypton e o Campeão são dois dos maiores combatentes que nosso mundo já conheceu. Agora, eles devem encarar o seu maior desafio até aqui:um ao outro. Uma armada alienígena ameaça a Terra com destruição total a menos que seja escolhido um campeão para lutar pela nossa existência. Superman e Ali são forçados a duelar em um ringue de boxe para decidir quem terá tal honra.Será necessário o empenho dos dois heróis para deter a ameaça extraterrestre. Mas como os dois lutadores poderão atuar juntos quando somente um continuará de pé? O Clássico combate de ícones americanos!Finalmente em uma Edição de luxo!Dos lendários criadores Dennis O’Neil, Neal Adams, Dick Giordano e Terry Austin, Superman vs. Muhammad Ali se tornou um clássico instantâneo e controverso quando de seu lançamento em 1978. Agora você pode redescobrir toda a ação e emoção nesta edição luxuosa, reservando um lugar ao lado do ringue para presenciar a mais importante luta do século!	2011-12-08 00:00:00+00	Americano (17 x 26 cm) Colorido/Lombada quadrada	149.99	static/covers/9788573518191.png	4	0	2019-10-23 17:44:34.679+00	2019-10-23 21:30:45.449+00	\N
102	9788569032229	Cão	Edição Única	92	O quadrinho é centrado em uma lenda do sertão paulista da última década do século XIX, o pistoleiro Diogo da Rocha Figueira, o Dioguinho. Com uma fi cha corrida com pelo menos 50 assassinatos listados, o assassino entrou para o imaginário local por conta das técnicas macabras utilizadas por ele em seus crimes.	2017-03-12 00:00:00+00	Magazine (21 x 28 cm) Preto e branco/Lombada quadrada	41.90	static/covers/9788569032229.png	0	0	2019-11-04 18:18:20.806+00	2019-11-04 18:21:37.493+00	\N
55	9788573515497	Watchmen	Edição Única	464	Uma das Graphic Novels mais influentes de todos os tempos e um eterno bestseller, Watchmen só cresceu em estatura desde sua publicação original, como minissérie, em 1986. Esta edição de luxo, com capa dura, papel especial e formato diferenciado, traz a lendária saga escrita por Alan Moore e desenhada por Dave Gibbons, totalmente recolorida digitalmente por John Higgings, o colorista original. Não apenas isso, o volume de 460 páginas também apresenta uma quantidade de extras jamais vista no Brasil, trazendo trechos do roteiro original, esboços de Gibbons, comentários sobre os personagens, textos dos criadores e mais. Uma edição primorosa que não pode faltar na estante de nenhum colecionador. Uma edição primorosa que não pode faltar na estante de nenhum colecionador. O ano é 1985. Os Estados Unidos são uma nação totalitária e fechada, isolada do resto do mundo. A presença de arsenais nucleares e dos chamados super-heróis mantém um certo equilíbrio entre as forças do planeta... até que o relógio do fim do mundo começa a marchar para a meia-noite e a raça humana para um abismo sem-fim. A sombria e inigualável trama tem início com ilusões paranóicas do supostamente insano herói Rorschach, um dos Watchmen que patrulhavam os EUA décadas atrás. Mas ele estaria realmente insano ou na verdade teria descoberto uma sórdida conspiração para assassinar super-heróis -- ou, pior ainda, milhões de civis inocentes? Fugindo da lei, Rorschach junta-se a ex-companheiros do passado em uma desesperada tentativa de salvar suas próprias vidas... e o que acabam descobrindo, além de abalar suas estruturas, poderá alterar o próprio destino do planeta Terra! Seguindo duas gerações de heróis mascarados, desde a Segunda Guerra até os tensos anos da Guerra Fria, surge esta pioneira epopéia de ódio, amor, reencontros impossíveis, grandes reviravoltas e muita ação, como só a criatividade de Alan Moore e Dave Gibbons poderia conceber!	2011-11-01 00:00:00+00	(19 x 27,5 cm)\nColorido/Capa dura	110.00	static/covers/9788573515497.jpg	5	0	2019-08-18 01:05:29.688+00	2019-10-23 20:01:46.61+00	\N
74	8573512148	HOMEM-ARANHA: AZUL	 Edição única	1	O que Peter Parker não imaginava é que o destino tinha outros planos para Gwen Stacy. Esta é a história de como os dois se conheceram e se apaixonaram. Ou melhor, de como eles quase não se apaixonaram. Seja bem vindo à vida do Homem-Aranha. Uma vida dramática e, no mínimo, espetacular. Para conquistar a garota de seus sonhos, o herói aracnídeo terá de enfrentar o desafio do Duende Verde, do Rino, dois Abutres e um misterioso personagem que oculto nas sombras, a tudo controla.	2004-09-01 00:00:00+00	Americano (17 x 26 cm) Colorido/Lombada quadrada	15.90	static/covers/8573512148.png	\N	\N	2019-08-23 15:07:00.812+00	2019-10-23 20:02:07.21+00	\N
70	9788575326541	Saga	Edição 5	152	Nesse novo volume da série, múltiplas histórias colidem numa emocionante aventura por todo o cosmo. Enquanto Gwendolyn, Sophie, a Gata da Mentira e A Mácula, arriscam suas vidas na procura de uma cura para O Querer, Marko faz uma incômoda aliança com o Príncipe Robô IV para ajudá-lo a encontrar seu filho raptado, que está preso num estranho mundo com novos e terríveis inimigos.	2017-06-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	69.00	static/covers/9788575326541.png	0	0	2019-08-18 01:05:29.691+00	2019-10-23 20:00:43.067+00	\N
69	9788575326473	Saga	Edição 4	152	Quando eles chegam a um novo e estranho planeta e se deparam com outros protagonistas, a pequena Hazel já é uma criança que sabe andar, enquanto os seus desafortunados pais, Marko e Alana, se esforçam para se manter em pé. Enquanto Hazel começa a pronunciar suas primeiras palavras, seus jovens pais passam por algumas crises no casamento. Alana torna-se usuária de uma droga do momento e Marko dá início a um relacionamento extraconjugal. Mas os problemas não param por aí.	2017-01-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	65.00	static/covers/9788575326473.png	0	0	2019-08-18 01:05:29.691+00	2019-10-23 19:55:14.361+00	\N
71	9788573516050	terra x	Edição Única	476	Grandiosos épicos não costumam surgir com frequência. Histórias que ampliam os horizontes e obrigam o leitor a pensar. Histórias tão poderosas em suas mensagens e tão extraordinárias em suas escalas, que os critérios pelos quais tais contos são normalmente julgados são completamente reformulados. Idealizada pelo consagrado ilustrador Alex Ross, Terra X é assim. Junto do roteirista Jim Krueger e do artista John Paul Leon, Ross traz novo fôlego e acrescenta espetaculares novos detalhes a cada faceta da mitologia dos heróis e vilões da Casa das Ideias. A obra explora todo o Universo Marvel, de suas raízes em seu humilde surgimento, até o ápice de seu fabuloso potencial. Em um futuro alternativo distópico e inquietante, praticamente todos os habitantes da Terra desenvolveram habilidades sobre-humanas. Resta saber como esse novo status quo afeta os antigos heróis e a vida em todo o planeta.	2017-09-01 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	70.00	static/covers/9788573516050.png	0	0	2019-08-18 01:05:29.691+00	2019-10-23 20:00:58.445+00	\N
72	9788573514070	Os Maiores Super-Heróis do Mundo	Edição Única	400	A DC Comics não é chamada de Editora das Lendas à toa. Figuras como Superman, Batman, Mulher-Maravilha, Flash e Lanterna Verde são há década mais do que simples personagens de HQs; são verdadeiros ícones do imaginário popular mundial. Mas como lendas se comportam em suas vidas normais? Quais questões perpassam sua mente quando não estão salvando o planeta da destruição? São essas questões que os incomparáveis Paul Dini	2017-08-01 00:00:00+00	(23 x 30 cm)\nColorido/Capa dura	93.30	static/covers/9788573514070.png	0	0	2019-08-18 01:05:29.691+00	2019-10-23 20:01:17.146+00	\N
62	9788573517699	Preacher - Álamo	Edição 9	232	O reverendo Jesse Custer voltará a esse emblemático lugar de sacrifício para encerrar a jornada que começou nos restos fumegantes de sua igreja muitos anos atrás – uma cruzada para encontrar Deus e fazê-Lo responder por Suas ações. Depois de tudo pelo que Jesse e Tulipa O’Hare, seu amor, passaram – traição, morte, ressurreição –, finalmente chegou a hora de se fazer justiça.\n\nMas eles terão a oportunidade de agir antes que Starr, líder obcecado do Grail, finalmente acerte as suas contas com o reverendo? Ou o Álamo será o palco de outra derrota?	2011-09-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	60.00	static/covers/9788573517699.png	0	0	2019-08-18 01:05:29.689+00	2019-10-23 19:57:52.054+00	\N
61	9788573516999	Preacher - Às Portas do Inferno	Edição 8	260	Após ter colaborado para limpar a cidade de Salvation, ter reencontrado sua mãe há muito perdida e sair mentalmente no braço com a entidade onipotente que vive dentro de sua cabeça, o reverendo Jesse Custer finalmente está Às Portas Do Inferno e pronto para encarar o dano que sua suposta morte e ausência infligiram em sua amada, Tulipa O’Hare.\n\nMas essa é a parte mais fácil. A parte realmente complicada vai ser descobrir a verdadeira natureza do homem que ele considera seu melhor amigo: o vampiro irlandês Cassidy. Quanto mais Jesse descobre sobre seu antigo companheiro de viagem, mais ele entra em contato com o lado negro e sombrio do vampiro e isso pode colocar a amizade dos dois em xeque.	2010-11-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	62.00	static/covers/9788573516999.png	0	0	2019-08-18 01:05:29.689+00	2019-10-23 19:58:20.03+00	\N
65	9788583681809	Y: O Último Homem	Edição 3	320	Em 2002 a Terra mudou para sempre. Todas as criaturas com um cromossomo Y morreram instantaneamente ao redor do globo. Com a perda de mais da metade da população, a sociedade está à beira do colapso e cabe às mulheres o fardo de juntar os pedaços e tentar manter nossa civilização. Mas esse “generocídio” não foi tão completo assim. Por alguma misteriosa razão, Yorick e seu macaco de estimação foram poupados do extermínio. Do dia para a noite, esse desconhecido de vinte e poucos anos virou a pessoa mais importante do planeta e a chave para decifrar o mistério que varreu o sexo masculino do mapa. Só que para ele a pessoa mais importante do planeta é sua namorada, e ela está no outro hemisfério, na Austrália, e nada o impedirá de ir ao encontro dela. Mas com um oceano inteiro de distância entre os dois, as chances de um reencontro estão diminuindo – e novas ameaças chegam de todos os lados.	2017-04-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	98.00	static/covers/9788583681809.png	0	0	2019-08-18 01:05:29.69+00	2019-10-23 19:59:30.154+00	\N
64	9788583681489	Y: O Último Homem	Edição 2	238	Em 2002 a Terra mudou para sempre. Todas as criaturas com um cromossomo Y morreram instantaneamente ao redor do globo. Com a perda de mais da metade da população, a sociedade está à beira do colapso e cabe às mulheres o fardo de juntar os pedaços e tentar manter nossa civilização. Mas esse “generocídio” não foi tão completo assim. Por alguma misteriosa razão, Yorick e seu macaco de estimação foram poupados do extermínio. Do dia para a noite, esse desconhecido de vinte e poucos anos virou a pessoa mais importante do planeta e a chave para decifrar o mistério que varreu o sexo masculino do mapa. Só que para ele a pessoa mais importante do planeta é sua namorada, e ela está no outro hemisfério, na Austrália. E nada o impedirá de ir ao encontro dela. Nessa cruzada por um mundo pós-masculino, homem e macaco descobrirão quão valiosos se tornaram	2016-07-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	72.00	static/covers/9788583681489.png	0	0	2019-08-18 01:05:29.69+00	2019-10-23 19:59:56.204+00	\N
63	9788583680499	Y - O Último Homem	Edição 1	320	Em 2002 a Terra mudou para sempre. Todas as criaturas com um cromossomo Y morreram instantaneamente ao redor do globo. Com a perda de mais da metade da população, a sociedade está à beira do colapso e cabe às mulheres o fardo de juntar os pedaços e tentar manter nossa civilização. Mas esse “generocídio” não foi tão completo assim. Por alguma misteriosa razão, Yorick e seu macaco de estimação foram poupados do extermínio. Do dia para a noite, esse desconhecido de vinte e poucos anos virou a pessoa mais importante do planeta e a chave para decifrar o mistério que varreu o sexo masculino do mapa. Só que para ele a pessoa mais importante do planeta é sua namorada, e ela está no outro hemisfério, na Austrália. E nada o impedirá de ir ao encontro dela. Nessa cruzada por um mundo pós-masculino, homem e macaco descobrirão quão valiosos se tornaram: um como prêmio, o outro como alvo. Y – O ÚLTIMO HOMEM	2015-09-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	98.00	static/covers/9788583680499.png	0	0	2019-08-18 01:05:29.69+00	2019-10-23 20:00:09.203+00	\N
67	9788575326183	Saga	Edição 2	168	A recém-nascida Hazel já sobreviveu a assassinos mortíferos, exércitos enfurecidos, fantasmas e monstruosidades alienígenas, mas é na vastidão fria e escura do espaço que a garotinha irá enfrentar o maior desafio da família: seus avós paternos! Bem... isso e mais algumas surpresinhas que você irá descobrir no decorrer do livro... Nas páginas belamente ilustradas por Fiona Staples, desvendaremos mais segredos sobre o Príncipe Robô, O Querer, a Gata da Mentira, e, é claro, Alana e Marko, tudo numa trama bem engendrada por Brian K. Vaughan, um dos escritores de quadrinhos mais conceituados dos últimos tempos!	2015-12-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	65.00	static/covers/9788575326183.png	0	0	2019-08-18 01:05:29.69+00	2019-10-23 20:00:31.383+00	\N
26	9788575327654	Saga	Edição 9	152	Anteriormente em Saga: Já há alguns anos nós acompanhamos a jornada de Alana e Marko, desde o nascimento da pequena Hazel no meio do conflito entre os mundos de seus pais. Eles lutaram muito e depois de superar o maior trauma que uma família pode passar, encontraram um lugar tranquilo para descansar. Agora: Em um raro momento de paz, Marko começa a escrever seu livro e Sir Robô engrena um novo relacionamento. Donzel e Hazel se divertem com Ghüs e o casal de jornalistas aguarda uma resposta decisiva para o grupo. Marko e Alana começam a pensar nos próximos passos. Tudo vai bem. Mas em Saga as coisas nunca são simples. O Querer parece finalmente ter retomado as rédeas da sua vida e ele só tem uma coisa em mente: vingança!	2019-10-23 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	67.36	static/covers/9788565484008.png	5	0	2019-08-18 01:05:29.681+00	2019-10-25 02:51:51.856+00	\N
95	9788545712442	Hokuto No Ken	Edição 1	312	O ano é 199x. O mundo foi devastado por chamas nucleares. A sociedade civilizada foi dizimada, e agora a violência rege esse novo mundo. é uma era onde apenas os mais fortes sobrevivem. Neste cenário pós-apocalíptico, um homem com sete feridas no peito vaga pelo deserto… ele é aquele que foi escolhido como o sucessor do estilo assassino terrível, o herdeiro do hokuto shin-ken. Ele é kenshiro!! a lenda do salvador da humanidade está prestes a começar. Mas aqueles que ousarem se interpor em seu caminho sentirão a fúria do seu punho… “você já está morto!”	2019-07-29 00:00:00+00	 (13 x 18 cm) Colorido/Preto e branco/Lombada quadrada	42.90	static/covers/9788545712442.png	0	0	2019-11-04 17:05:07.251+00	2019-11-04 17:05:07.318+00	\N
57	9788583680796	Preacher - Rumo ao Sul	Edição 5	232	Após destruir o quartel-general do todo-poderoso Graal e libertar Cassidy – seu companheiro de bebedeiras – do cativeiro, o reverendo Jesse Custer está prestes a se reunir com Tulipa O’Hare – sua namorada de excelente mira – e retomar a caçada ao fugitivo Deus. Falta só, é claro, Tulipa o perdoar por ter sido deixada pra trás na missão de resgate…Mas, para conseguir as respostas que busca, Jesse terá que mergulhar fundo na mente oculta de Gênesis; a criatura anjo/demônio que se fundiu à sua alma, e esse tipo de mergulho exige uma ajuda espiritual forte, uma que apenas a magia negra de raiz é capaz de oferecer. Pra sorte de Jesse, Cassidy conhece um feiticeiro vodu em New Orleans que pode ajudar a destravar as memórias de Gênesis. Mas, para o azar do pastor, Cassidy também tem um bando de aspirantes a vampiro atrás de sua cabeça na cidade… e eles estão pouco se lixando para quem pode sair machucado enquanto caçam seu alvo. Rumo ao Sul é o quinto capítulo da saga de Preacher.	2014-12-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	64.00	static/covers/9788583680796.png	0	0	2019-08-18 01:05:29.688+00	2019-10-23 19:56:58.678+00	\N
54	9788565484749	Preacher - Histórias Antigas	Edição 4	228	O reverendo Jesse Custer quase perdeu a fé quando teve a alma mesclada com a entidade angelical-demoníaca conhecida como Gênesis. O resultado desse encontro lhe deu um novo objetivo e o levou a uma das jornadas mais improváveis de que se tem notícia: Jesse está em busca de Deus para forçá-Lo a responder por suas falhas e omissões, e responsabilizá-Lo por abandonar a humanidade. Mas tal missão chega a um hiato que aproveitaremos para conhecer mais sobre as histórias de alguns bizarros personagens que cruzaram o caminho do reverendo durante essa singular cruzada. O Santo dos Assassinos – a nêmese sobrenatural de Jesse Custer – tem sua origem contada, indo das gélidas planícies do Velho Oeste americano até as profundezas mais quentes do Inferno. Jody e T.C. – os dois capangas da sra. Marie L'Angelle, a cruel avó de Jesse – vivem uma aventura do passado repleta de ação e pancadaria. Já Cara-de-Cu – um dos personagens mais antológicos dos quadrinhos – tem os bastidores de sua criação e da formação de sua personalidade desvendados. Histórias Antigas é o quarto capítulo da saga de PREACHER, uma das histórias em quadrinhos mais aclamadas dos anos 90	2014-10-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	64.00	static/covers/9788565484749.png	0	0	2019-08-18 01:05:29.688+00	2019-10-23 19:57:39.091+00	\N
66	9788575326367	Saga	Edição 1	168	Saga'' é uma história em quadrinhos no melhor estilo space opera e com um toque de fantasia criada e escrita por Brian K. Vaughan e ilustrada por Fiona Staples. Publicada originalmente como uma revista mensal pela Image Comics, a série é fortemente influenciada por Star Wars, Flash Gordon e em ideias concebidas pelo próprio Vaughan quando ainda era criança (o autor revelou que a base da história foi criada durante as aulas de Matemática, que ele odiava!). Frequentemente descrita pela crítica especializada como um “encontro entre Star Wars e A Guerra dos Tronos”, ''Saga'' nos conta a história de Alana e Marko, dois soldados em lados opostos numa longa e devastadora guerra intergaláctica que se apaixonam e lutam para garantir que Hazel, sua filha recém-nascida, continue viva. Mas é claro que isso não será nada fácil... Curiosamente, a história é narrada pelo bebê!	2014-11-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	59.90	static/covers/9788575326367.png	0	0	2019-08-18 01:05:29.69+00	2019-10-23 19:59:42.247+00	\N
11	9788573519259	One Piece	Edição 6	196	Luffy vê atitude de compaixão de Sanji ao dar comida a Gin e pede para ele se tornar seu cozinheiro, mas Sanji recusa. Gin fala que Luffy deve desistir de ir à Grand Line, pois lá é muito perigoso. Zeff aparece enquanto Gin está para partir e se desculpa por dar trabalho ao cozinheiro. Enquanto isso, dentro do restaurante, os demais cozinheiros ficam discutindo sobre Don Krieg. Luffy volta ao restaurante para trabalhar, mas não consegue fazer nada direito, ouvindo reclamações de todos os lados	2012-07-01 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/9788573519259.png	0	0	2019-08-18 01:05:29.677+00	2019-10-23 20:04:57.382+00	\N
42	9788583681052	Gotham. DPGC. No Cumprimento do Dever	Edição 1	244	Não é fácil ser um policial em Gotham City… Não é preciso apenas lidar com a violência e a corrupção de uma cidade infestada pelo crime (e com os criminosos mais insanos e homicidas da história), mas também levar em conta um vigilante decidido a jogar pelas próprias regras. Os bons policiais da cidade trabalham dia e noite limpando a bagunça que é deixada para trás pela guerra de um homem só contra o crime. Porém, quando um dos membros do departamento de polícia é morto pelo Senhor Frio, os Melhores de Gotham entram em uma luta contra o tempo para prender o criminoso sem a ajuda do Cavaleiro das Trevas. Pouco depois, a detetive Renee Montoya é “desmascarada” como homossexual e descobre seu ambiente de trabalho e sua vida pessoal virados de cabeça para baixo. E as coisas ficam ainda mais complicadas quando ela é raptada pelo Duas-Caras. Série ganhadora de diversos prêmios da crítica especializada, Gotham é trazida até você pelos aclamados escritores Ed Brubaker e Greg Rucka, acompanhados pelo artista Michael Lark.	2015-09-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	66.00	static/covers/9788583681052.png	0	0	2019-08-18 01:05:29.685+00	2019-10-23 20:05:35.71+00	\N
76	858368233X	Gotham DPGC. Corrigan	Edição 4	228	Uma descoberta perturbadora… Os cidadãos de Gotham ficam chocados ao descobrir o corpo sem vida do Robin jogado nas ruas. Agora os detetives do departamento de polícia da cidade precisam resolver o mistério que cerca essa morte enquanto lidam com um complicador: o “auxílio” dos antigos associados do Menino-Prodígio, o Batman e os Titãs. Da chocante cena de um crime para o mais completo caos cósmico — ao que a Crise Infinita se aproxima, o Espectro, o ser mais poderoso do universo, procura um hospedeiro. Será que o novo Espírito da Vingança vai encontrar o que tanto busca em um dos corajosos policiais de Gotham?	2017-09-29 00:00:00+00	Americano (17 x 26 cm) Colorido/Lombada quadrada	64.00	static/covers/858368233X.png	\N	\N	2019-09-08 07:27:08.143+00	2019-10-23 20:10:51.558+00	\N
84	8542621077	Lendas do Universo DC: Liga da Justiça 	Edição 1	192	A LIGA QUE NÃO SE LEVAVA A SÉRIO… Na esteira do evento Lendas, uma nova geração dos Maiores Super-Heróis do Mundo se torna o centro das atenções. No entanto, esse é o grupo mais improvável já visto! Batman, Besouro Azul, Caçador de Marte, Guy Gardner, Canário Negro, Senhor Milagre, Gladiador Dourado, Senhor Destino, Doutora Luz, Shazam e muitos mais se unem para formar uma nova Liga da Justiça… com muito buah-hah-hah! A equipe de roteiristas composta de J.M. DeMatteis e Keith Giffen se une ao artista Kevin Maguire para trazer uma das encarnações mais queridas e premiadas da Liga!	2019-07-21 00:00:00+00	(17 x 26 cm) Colorido/Lombada quadrada	29.90	static/covers/8542621077.png	4	0	2019-10-24 23:21:03.322+00	2019-10-24 23:31:59.879+00	\N
97	9788545712947	Hokuto No Ken	Edição 3	312	Kenshiro conhece Rei, usuário do estilo Nanto Suicho-ken, e que está em busca de sua irmã, Airi. Os dois são contratados para salvar a comunidade de Mamiya do Clã das Garras. Porém, em retaliação, eles raptaram Airi e a usam de refém. Kenshiro e Rei se dirigem à base do Clã das Garras para salvá-la, e então, os dois mestres de seus respectivos estilos se unem para formar a equipe mais poderosa de todas!	2019-08-02 00:00:00+00	(13 x 18 cm) Colorido/Preto e branco/Lombada quadrada	42.90	static/covers/9788545712947.png	0	0	2019-11-04 17:12:17.318+00	2019-11-04 17:12:17.39+00	\N
99	9788575327562	The Black Monday Murders. Dinheiro, Poder E Magia	Edição 1	240	Todos saúdam o deus do dinheiro. As várias escolas ancestrais ligadas à magia controlam secretamente toda a sociedade através das instituições financeiras mais poderosas do mundo. Um mundo secreto onde vampiros oligarcas russos, papas das trevas, aristocratas americanos encantados e assassinos do fundo monetário internacional trabalham juntos para nos manter no nosso devido lugar. Agora um dos líderes desse seleto grupo foi brutalmente assassinado e o investigador de polícia theodore dumas começa a desvendar os segredos por trás dessa conspiração que atravessa os séculos.	2019-08-16 00:00:00+00	26 x 17 x 1,9 cm	72.00	static/covers/9788575327562.png	0	0	2019-11-04 17:34:04.586+00	2019-11-04 17:34:04.65+00	\N
44	9788583681953	Gotham DPGC - Sob Suspeita	Edição 3	228	Uma violenta guerra de gangues estoura em Gotham City. Após um trágico erro, a polícia sente que não pode mais confiar no Batman, e o comissário toma uma decisão rigorosa: o Cavaleiro das Trevas agora é um homem procurado, e o famoso Batsinal é removido do telhado do DPGC. E isso não poderia ter acontecido em pior hora, já que a Unidade de Crimes Hediondos vai precisar encarar um supervilão com quem nunca lidou, e com a vida de um bom policial na berlinda… Enquanto o conflito entre as gangues cobra seu preço da cidade, os parceiros Renee Montoya e Crispus Allen dão início a eventos que mudarão suas vidas para sempre. Para manter Gotham a salvo sem a ajuda do Homem-Morcego, a dupla terá que fazer inimigos bem poderosos… e encarar algumas verdades dolorosas sobre seus segredos mais sombrios.	2017-02-01 00:00:00+00	Americano (17 x 26 cm)\nColorido/Capa dura	46.00	static/covers/9788583681953.png	5	0	2019-08-18 01:05:29.686+00	2019-10-23 21:30:01.114+00	\N
9	9788573519037	One Piece	Edição 4	196	As pessoas da vila não acreditam em Usopp e o perseguem. Enquanto isso, Zoro e companhia acham Luffy na praia e ele explica toda a situação. Usopp invade a mansão e tenta convencer Kaya de que Klahador é na verdade o Capitão Kuro. Ela não acredita nele e dá um tapa em seu rosto. Merry chega ao local e acaba acertando um tiro no braço do garoto, que fica desesperado com ninguém acreditar no que ele diz. Mais tarde, ele mente para Piiman, Ninjin e Tamanegi dizendo que inventou tudo sobre Kuro.	2012-05-01 00:00:00+00	(13,5 x 20 cm)\nPreto e branco/Lombada quadrada	10.90	static/covers/9788573519037.jpg	0	0	2019-08-18 01:05:29.677+00	2019-10-24 22:48:49.893+00	\N
78	8565484661	Kick-Ass	Edição 2	212	Com treinamento mínimo em combate e armado com um par de bastões, ele colocou uma máscara e saiu para se tornar um super-herói: Kick-Ass. E conseguiu, embora de um jeito violento. Kick-Ass e a precoce Hit-Girl enfrentaram a máfia — e ganharam. A ideia se espalhou e, de repente, virou moda usar uniforme. Todo mundo quer ser um super-herói. Qual será o próximo passo de Kick-Ass? Obviamente, reunir uma superequipe. Mas seu antigo parceiro, Red Mist, acha que heróis são um saco, e quer se transformar no mais conhecido supervilão do mundo. Conseguirá nosso herói deter seu velho aliado e a gangue que ele armou? Ou, então, sobreviver para virar herói mesmo quando a luta pega pra valer, tornando-se um quebra-pau monumental na Times Square?  Mark Millar, escritor de Nêmesis e Os Supremos, ao lado de John Romita Jr., desenhista de Os Vingadores, trazem a mais eletrizante história de quadrinhos de todos os tempos.	2013-07-02 00:00:00+00	(17 x 26 cm) Colorido/Capa dura	56.00	static/covers/8565484661.png	0	0	2019-10-24 22:54:08.461+00	2019-10-24 22:54:08.537+00	\N
79	858368054X	Kick-Ass	Edição 3	256	O espetacular final do megassucesso de Mark Millar e John Romita Jr.! Com a Hit-Girl na cadeia, cabe ao Kick-Ass assumir a liderança da superequipe Justiça Eterna! Mas a vida de líder não é nada fácil, e Kick-Ass logo percebe que nem todos na equipe têm ideais tão nobres quanto os dele. Com os super-heróis declarados fora da lei, muitos abandonam suas fantasias para fugir não só da polícia, mas também de novos e terríveis inimigos que iniciam uma verdadeira caça aos fantasiados! Pela primeira vez, nosso herói começa a alimentar dúvidas sobre sua cruzada pessoal. Estará ele envolvido demais para cair fora? Enquanto isso, a Hit-Girl começa a comandar todas as gangues da prisão, e um falido Red Mist recebe uma nova educação de um aterrorizante chefão do crime. À medida que a contagem de corpos aumenta, Kick-Ass precisa decidir se sua busca por justiça vale o sacrifício supremo. E ainda, a história que você tanto esperou para ver: a origem secreta da Hit-Girl! Como a pequena Mindy McCready desenvolveu seus dons assassinos? Descubra aqui, na espetacular conclusão de KICK-ASS!	2015-04-08 00:00:00+00	(17 x 26 cm) Colorido/Capa dura	64.00	static/covers/858368054X.png	0	0	2019-10-24 22:56:58.22+00	2019-10-24 22:56:58.285+00	\N
80	8542611012	Senhor Milagre	Edição 1	152	Scott Free é o maior artista de fugas de diversos mundos. Mas, gozando de fama e boa vida na Terra, o herói também conhecido como Senhor Milagre pode finalmente ter encontrado uma armadilha tão complexa que nem mesmo ele pode escapar! Acompanhe a elogiada minissérie responsável por introduzir e conduzir o personagem no universo pós-Renascimento.	2018-03-25 00:00:00+00	25,6 x 16,8 x 0,8 cm	23.90	static/covers/8542611012.png	0	0	2019-10-24 23:02:23.009+00	2019-10-24 23:02:23.066+00	\N
100	9788562942006	Imaginários – contos de fantasia, ficção científica e terror	Edição 1	128	É hora de começar a viagem. Prepare-se para uma aventura inesquecível da primeira à última linha, nessa coleção que já é referência do que há de melhor na literatura fantástica nacional.	2009-11-06 00:00:00+00	178 × 12 × 08 cm	22.90	static/covers/9788562942006.png	0	0	2019-11-04 18:00:23.135+00	2019-11-04 18:00:23.314+00	\N
82	8583682372	Superman. Entre a Foice e o Martelo	Edição Única	172	Nessa surpreendente releitura de um conto mais que familiar, uma certa nave kryptoniana cai na Terra, trazendo um infante que um dia se tornará o ser mais poderoso do planeta. Mas seu veículo não caiu nos Estados Unidos. Ele não foi criado em Smallville, Kansas. Em vez disso, encontrou um novo lar em uma fazenda coletiva na União Soviética! Da mente de Mark Millar, elogiado roteirista de Authority e O Procurado, chega esta estranha e genial reinterpretação do mito do Superman.	2017-08-30 00:00:00+00	26,6 x 17,6 x 1 cm	32.90	static/covers/8583682372.png	0	0	2019-10-24 23:09:08.318+00	2019-10-24 23:09:08.382+00	\N
83	8583681023	Homem-aranha: A Última Caçada De Kraven	Edição Única	144	A morte de Kraven, o Caçador, se aproxima. E ele sabe disso. Mas, para conseguir descansar em paz, ele precisa capturar sua principal presa e maior rival: o Homem-Aranha! Kraven dedica suas últimas forças para comprovar que é superior ao seu grande inimigo e o caçador supremo. Para tal, não basta apenas caçar o Aranha, Kraven terá de se tornar o Homem-Aranha e mostrar que é ainda melhor que Peter Parker!	2015-04-16 00:00:00+00	26,4 x 17,2 x 1,2 cm	25.90	static/covers/8583681023.png	0	0	2019-10-24 23:16:50.249+00	2019-10-24 23:16:50.296+00	\N
81	8542620933	Senhor Milagre	Edição 2	156	Órion não é mais o novo pai celestial, mas a mudança de comando em nova gênese pode não trazer o fim dos conflitos que assolam o reino, e ainda acarretar em consequências drásticas para a grande barda e o senhor milagre. Darkseid é, e sempre será, a maior ameaça de todas. Não perca a conclusão da grande e premiada saga de tom king e mitch gerads	2019-07-12 00:00:00+00	 (17 x 26 cm) Colorido/Lombada quadrada	24.90	static/covers/8542620933.png	5	0	2019-10-24 23:05:02.598+00	2019-10-25 03:18:03.849+00	\N
98	9788545712954	Hokuto No Ken	Edição 4	312	O homem que fez as sete feridas no peito de Kenshiro e tentou fazê-lo desistir de seu próprio nome… ele é nada mais, nada menos do que o irmão mais velho do nosso herói e usuário do Hokuto Shin-ken, Jagi! Jagi nutre um rancor imenso por seu irmão mais novo ter sido escolhido como sucessor do Hokuto Shin-ken. A raiva de Kenshiro contra a paranóia de Jagi! Quem vencerá?!	2019-09-16 00:00:00+00	(13 x 18 cm) Colorido/Preto e branco/Lombada quadrada	42.90	static/covers/9788545712954.png	0	0	2019-11-04 17:15:20.583+00	2019-11-04 17:15:20.646+00	\N
85	8542617134	Capitã Marvel. Mais Alto, Mais Longe, Mais Rápido e Mais	Edição Única	136	Heroína! Piloto! Vingadora! A Capitã Marvel está de volta com tudo para viver uma nova aventura! A Heroína Mais Poderosa da Terra, também conhecida como Carol Danvers, chega a uma encruzilhada entre sua nova vida e um novo romance, e precisa tomar uma decisão dramática que vai alterar o curso de sua história (e do Universo Marvel inteiro) nos próximos meses. Quando assume a missão de devolver uma garota alienígena a sua terra natal, Carol vai parar no meio de uma revolta contra a Aliança Galáctica! Investigando o realojamento forçado do povo de Torfa, a Capitã Marvel descobre que já conhece o homem por trás da trama e, quando o vilão tenta chantageá-la e obrigar os Vingadores a se voltarem contra ela… é hora da revanche!	2019-04-17 00:00:00+00	Americano (17 x 26 cm) Colorido/Capa dura	40.00	static/covers/8542617134.png	0	0	2019-10-24 23:29:53.387+00	2019-10-24 23:29:53.433+00	\N
86	9788535911626	Persépolis - Completo	Edição Única	352	Marjane Satrapi tinha apenas dez anos quando se viu obrigada a usar o véu islâmico, numa sala de aula só de meninas. Nascida numa família moderna e politizada, em 1979 ela assistiu ao início da revolução que lançou o Irã nas trevas do regime xiita - apenas mais um capítulo nos muitos séculos de opressão do povo persa. Vinte e cinco anos depois, com os olhos da menina que foi e a consciência política à flor da pele da adulta em que se transformou, Marjane emocionou leitores de todo o mundo com essa autobiografia em quadrinhos, que só na França vendeu mais de 400 mil exemplares. Em Persépolis, o pop encontra o épico, o oriente toca o ocidente, o humor se infiltra no drama - e o Irã parece muito mais próximo do que poderíamos suspeitar.	2007-12-10 00:00:00+00	24,4 x 16,4 x 2,2 cm	32.99	static/covers/9788535911626.png	0	0	2019-10-29 20:50:56.248+00	2019-10-29 20:50:56.31+00	\N
87	9788583681380	Crise nas Infinitas Terras Edição Definitiva	Edição Única	464	Mundos viveram… mundos morreram… e as histórias em quadrinhos nunca mais foram as mesmas! Escrita por Marv Wolfman e desenhada por George Pérez, Crise Nas Infinitas Terras apresenta na íntegra a saga que recriou o Universo DC! Uma ameaça trazida por uma irresistível força misteriosa obriga o semidivino Monitor a convocar superseres de diversos mundos para defender a existência de todas as realidades. Mas o caminho para a salvação exigirá um sacrifício nunca antes testemunhado!	2018-11-28 00:00:00+00	28 x 18,6 x 2,2 cm	98.00	static/covers/9788583681380.png	0	0	2019-11-04 16:15:21.601+00	2019-11-04 16:15:21.677+00	\N
88	9788573514131	Crise de Identidade	Edição Única	264	Dizem que os super-heróis mantêm a identidade secreta para proteger seus entes queridos. O Homem-Elástico é um dos poucos cuja identidade é conhecida pelo público. Quando sua esposa é cruelmente assassinada no próprio lar, a tragédia atinge em cheio a comunidade de heróis. Unidos por seu ideal de combate ao crime, todos os vigilantes começam a vasculhar o país em busca de pistas e suspeitos. Mas Arqueiro Verde, Canário Negro, Gavião Negro, Eléktron e Zatanna ficam para trás, protegendo um segredo que, se revelado, pode modificar para sempre a relação entre heróis e vilões.	2018-12-10 00:00:00+00	26,2 x 17,6 x 1,6 cm	52.00	static/covers/9788573514131.png	0	0	2019-11-04 16:24:06.444+00	2019-11-04 16:24:06.53+00	\N
89	9788542623178	Lendas Do Universo Dc: Quarto Mundo Jack Kirby	Edição 1	176	Nenhum autor dos comics tem mais prestígio e respeito do que o “rei” Jack Kirby… e nenhuma criação do genial desenhista/roteirista é mais amada do que o Quarto Mundo! Um exercício de estilo e criatividade de tamanha relevância que influenciou absolutamente tudo o que veio depois nos quadrinhos de super-heróis!	2019-08-13 00:00:00+00	Americano (17 x 26 cm) Colorido/Lombada quadrada	27.90	static/covers/9788542623178.png	0	0	2019-11-04 16:31:22.172+00	2019-11-04 16:31:22.234+00	\N
90	9788542624625	Lendas do Universo DC: Quarto Mundo Jack Kirby	Edição 2	176	A guerra entre os novos deuses de Nova Gênese e de Apokolips afeta cada vez mais a Terra, enquanto Superman e seus aliados tentam lidar com o conflito secreto e mortal de forma que o planeta não seja destruído! 	2019-07-10 00:00:00+00	Americano (17 x 26 cm) Colorido/Lombada quadrada	27.90	static/covers/9788542624625.png	0	0	2019-11-04 16:35:02.332+00	2019-11-04 16:35:22.425+00	\N
91	9788542625134	Lendas do Universo DC: Quarto Mundo Jack Kirby	Edição 3	176	O retorno do Guardião! A chegada de um famoso comediante (?!) à batalha pela Terra! A Povo da Eternidade capturado! A morte de um novo deus! A estreia de Sonny Sumô! Momentos consagradores da maior realização nos quadrinhos do Rei Jack Kirby…	2019-08-31 00:00:00+00	 Americano (17 x 26 cm) Colorido/Lombada quadrada	27.90	static/covers/9788542625134.png	0	0	2019-11-04 16:38:54.468+00	2019-11-04 16:38:54.573+00	\N
92	9788545707226	Akira	Edição 3	280	Kaneda e Kei conseguem escapar da base secreta subterrânea, levando com eles um misterioso garoto com o número 28 na palma da mão. Mal sabiam eles que esse indivíduo era AKIRA, o maior segredo da nação, que tinha despertado!! A disputa pela posse do garoto agora ocorre em três frentes: de um lado, a guerrilha comandada por Nezu; do outro, o Exército sob as ordens do Coronel; e por último, a seita da sacerdotiza Miyako. 	2018-12-10 00:00:00+00	(18 x 26 cm) Colorido/Preto e branco/Lombada quadrada	69.90	static/covers/9788545707226.png	0	0	2019-11-04 16:43:05.971+00	2019-11-04 16:43:06.043+00	\N
93	9788545711513	Akira	Edição 4	400	A profecia de miyako havia sido realizada. Uma tragédia envolvendo takashi e akira causa o despertar do nº 28, destruindo toda neo-tokyo. Os sobreviventes observavam incrédulos as ruínas do que um dia foi a capital do japão 42 dias depois da catástrofe causada por akira, na área oeste das ruínas de neo-tokyo, havia surgido uma potência chamada de grande império de tokyo, no qual akira era idolatrado como o “grande despertado”, e tetsuo imperava com demonstrações públicas de seu poder. Qual o rumo que o japão irá tomar?	2019-08-23 00:00:00+00	(18 x 26 cm) Colorido/Preto e branco/Lombada quadrada	76.90	static/covers/9788545711513.png	0	0	2019-11-04 16:47:33.16+00	2019-11-04 16:47:33.241+00	\N
94	9788545712367	Akira	Edição 5	416	A cada novo despertar, tetsuo se aproxima mais ainda do poder de akira. e após sobreviver a todas essas situações caóticas, kaneda também volta à linha de combate, dando início à batalha por akira, em um cenário de ruínas que beira o verdadeiro caos.	2019-08-25 00:00:00+00	(18 x 26 cm) Colorido/Preto e branco/Lombada quadrada	76.90	static/covers/9788545712367.png	0	0	2019-11-04 16:51:00.97+00	2019-11-04 16:51:01.038+00	\N
96	9788545712459	Hokuto No Ken	Edição 2	312	Para salvar a pequena Lin, Kenshiro invade sozinho e destrói a cidade de Godland. Porém, o justiceiro errante mal terá tempo de descansar, pois Jakal, um inimigo ainda mais cruel, ataca a comunidade de Batt! Jakal é um homem sanguinário e muito estratégico, e marca Kenshiro como seu próximo alvo!	2019-08-30 00:00:00+00	 (13 x 18 cm) Colorido/Preto e branco/Lombada quadrada	42.90	static/covers/9788545712459.png	0	0	2019-11-04 17:08:58.542+00	2019-11-04 17:08:58.615+00	\N
\.


--
-- Data for Name: collection_books; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.collection_books (id, created_at, updated_at, book_id, collection_id) FROM stdin;
1	2019-08-27 06:34:52.705+00	2019-08-27 06:34:52.705+00	40	4
2	2019-08-27 06:34:58.978+00	2019-08-27 06:34:58.978+00	40	6
3	2019-08-27 06:35:04.274+00	2019-08-27 06:35:04.274+00	40	9
4	2019-08-27 06:35:23.059+00	2019-08-27 06:35:23.059+00	74	1
5	2019-08-27 06:35:27.828+00	2019-08-27 06:35:27.828+00	74	4
6	2019-08-27 06:35:38.471+00	2019-08-27 06:35:38.471+00	56	1
7	2019-08-27 06:35:49.284+00	2019-08-27 06:35:49.284+00	39	1
8	2019-08-27 06:35:56.738+00	2019-08-27 06:35:56.738+00	32	6
9	2019-08-27 06:35:59.524+00	2019-08-27 06:35:59.524+00	32	1
34	2019-08-28 04:00:52.118+00	2019-08-28 04:00:52.118+00	74	54
35	2019-08-28 04:01:02.011+00	2019-08-28 04:01:02.011+00	74	5
36	2019-08-28 04:01:07.504+00	2019-08-28 04:01:07.504+00	74	52
37	2019-08-28 04:03:44.776+00	2019-08-28 04:03:44.776+00	59	55
38	2019-08-28 04:03:52.59+00	2019-08-28 04:03:52.59+00	30	55
39	2019-08-28 04:04:01.193+00	2019-08-28 04:04:01.193+00	21	55
40	2019-08-28 04:04:16.131+00	2019-08-28 04:04:16.131+00	19	55
41	2019-08-28 04:04:26.643+00	2019-08-28 04:04:26.643+00	14	55
42	2019-08-28 04:04:33.89+00	2019-08-28 04:04:33.89+00	8	55
43	2019-08-28 04:04:42.689+00	2019-08-28 04:04:42.689+00	11	55
44	2019-08-28 04:04:54.028+00	2019-08-28 04:04:54.028+00	9	55
45	2019-08-28 04:05:04.025+00	2019-08-28 04:05:04.025+00	6	55
46	2019-08-28 04:05:15.162+00	2019-08-28 04:05:15.162+00	2	55
61	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	24	61
62	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	28	61
63	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	27	61
64	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	34	61
65	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	35	61
66	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	38	61
67	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	76	61
68	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	43	61
69	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	42	61
70	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	56	61
71	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	72	61
72	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	44	61
73	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	77	61
74	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	23	61
75	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	16	61
76	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	12	61
77	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	10	61
78	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	7	61
79	2019-10-23 21:04:39.83+00	2019-10-23 21:04:39.83+00	1	61
80	2019-10-23 21:07:54.02+00	2019-10-23 21:07:54.02+00	22	62
81	2019-10-23 21:07:54.02+00	2019-10-23 21:07:54.02+00	31	62
82	2019-10-23 21:07:54.02+00	2019-10-23 21:07:54.02+00	33	62
83	2019-10-23 21:07:54.02+00	2019-10-23 21:07:54.02+00	36	62
84	2019-10-23 21:07:54.02+00	2019-10-23 21:07:54.02+00	37	62
85	2019-10-23 21:07:54.02+00	2019-10-23 21:07:54.02+00	40	62
86	2019-10-23 21:07:54.02+00	2019-10-23 21:07:54.02+00	74	62
87	2019-10-23 21:07:54.02+00	2019-10-23 21:07:54.02+00	71	62
88	2019-10-23 21:07:54.02+00	2019-10-23 21:07:54.02+00	17	62
89	2019-10-23 21:11:32.925+00	2019-10-23 21:11:32.925+00	26	63
90	2019-10-23 21:11:32.925+00	2019-10-23 21:11:32.925+00	70	63
91	2019-10-23 21:11:32.925+00	2019-10-23 21:11:32.925+00	67	63
92	2019-10-23 21:11:32.925+00	2019-10-23 21:11:32.925+00	68	63
93	2019-10-23 21:11:32.925+00	2019-10-23 21:11:32.925+00	66	63
94	2019-10-23 21:11:32.925+00	2019-10-23 21:11:32.925+00	69	63
95	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	25	64
96	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	29	64
97	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	55	64
98	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	63	64
99	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	64	64
100	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	65	64
101	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	50	64
102	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	61	64
103	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	60	64
104	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	62	64
105	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	54	64
106	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	58	64
107	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	51	64
108	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	57	64
109	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	52	64
110	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	53	64
111	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	18	64
112	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	15	64
113	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	5	64
114	2019-10-23 21:15:39.154+00	2019-10-23 21:15:39.154+00	3	64
115	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	21	65
116	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	30	65
117	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	32	65
118	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	11	65
119	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	46	65
120	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	47	65
121	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	59	65
122	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	19	65
123	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	20	65
124	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	14	65
125	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	8	65
126	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	9	65
127	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	6	65
128	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	4	65
129	2019-10-23 21:19:34.085+00	2019-10-23 21:19:34.085+00	2	65
130	2019-10-24 23:11:05.538+00	2019-10-24 23:11:05.538+00	82	61
131	2019-10-24 23:11:05.538+00	2019-10-24 23:11:05.538+00	81	61
132	2019-10-24 23:11:05.538+00	2019-10-24 23:11:05.538+00	80	61
133	2019-10-24 23:22:09.851+00	2019-10-24 23:22:09.851+00	84	61
134	2019-10-24 23:22:30.572+00	2019-10-24 23:22:30.572+00	83	62
135	2019-10-24 23:30:29.579+00	2019-10-24 23:30:29.579+00	85	62
47	2019-09-13 06:20:29.829+00	2019-09-13 06:20:29.829+00	61	\N
48	2019-09-13 06:20:29.829+00	2019-09-13 06:20:29.829+00	62	\N
49	2019-09-13 06:20:29.829+00	2019-09-13 06:20:29.829+00	60	\N
50	2019-09-13 06:20:29.829+00	2019-09-13 06:20:29.829+00	57	\N
51	2019-09-13 06:20:29.829+00	2019-09-13 06:20:29.829+00	54	\N
52	2019-09-13 06:20:29.829+00	2019-09-13 06:20:29.829+00	58	\N
53	2019-09-13 06:20:29.829+00	2019-09-13 06:20:29.829+00	53	\N
54	2019-09-13 06:20:29.829+00	2019-09-13 06:20:29.829+00	52	\N
55	2019-09-13 06:20:29.829+00	2019-09-13 06:20:29.829+00	51	\N
56	2019-09-13 06:20:29.829+00	2019-09-13 06:20:29.829+00	26	\N
60	2019-10-23 17:48:02.618+00	2019-10-23 17:48:02.618+00	77	\N
57	2019-10-23 17:07:19.707+00	2019-10-23 17:07:19.707+00	76	\N
58	2019-10-23 17:07:19.707+00	2019-10-23 17:07:19.707+00	74	\N
59	2019-10-23 17:07:19.707+00	2019-10-23 17:07:19.707+00	72	\N
136	2019-11-04 18:22:35.482+00	2019-11-04 18:22:35.482+00	91	61
137	2019-11-04 18:22:35.482+00	2019-11-04 18:22:35.482+00	90	61
138	2019-11-04 18:22:35.482+00	2019-11-04 18:22:35.482+00	89	61
139	2019-11-04 18:22:35.482+00	2019-11-04 18:22:35.482+00	88	61
140	2019-11-04 18:22:35.482+00	2019-11-04 18:22:35.482+00	87	61
141	2019-11-04 18:23:05.736+00	2019-11-04 18:23:05.736+00	98	65
142	2019-11-04 18:23:05.736+00	2019-11-04 18:23:05.736+00	97	65
143	2019-11-04 18:23:05.736+00	2019-11-04 18:23:05.736+00	96	65
144	2019-11-04 18:23:05.736+00	2019-11-04 18:23:05.736+00	95	65
145	2019-11-04 18:23:05.736+00	2019-11-04 18:23:05.736+00	94	65
146	2019-11-04 18:23:05.736+00	2019-11-04 18:23:05.736+00	93	65
147	2019-11-04 18:23:05.736+00	2019-11-04 18:23:05.736+00	92	65
\.


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.collections (id, title, description, thumbnail, created_at, updated_at, user_id, type) FROM stdin;
1	123123123123		static/collections/1.png	2019-08-27 05:45:02.69+00	2019-08-27 05:45:02.802+00	1	\N
2	hsushsushs		\N	2019-08-27 05:45:16.645+00	2019-08-27 05:45:16.649+00	1	\N
3	tih	mas to km\n\n\n	\N	2019-08-27 05:46:35.99+00	2019-08-27 05:46:35.994+00	1	\N
4	123	12e2e1e	\N	2019-08-27 05:53:34.988+00	2019-08-27 05:53:34.997+00	1	\N
5	11111111		\N	2019-08-27 05:53:59.555+00	2019-08-27 05:53:59.582+00	1	\N
6	12321		\N	2019-08-27 05:54:48.946+00	2019-08-27 05:54:48.952+00	1	\N
7	jdidhduddh		\N	2019-08-27 05:58:20.152+00	2019-08-27 05:58:20.157+00	1	\N
8	123123	12e123123	static/collections/8.png	2019-08-27 06:08:15.821+00	2019-08-27 06:08:15.85+00	1	\N
9	12w123123		static/collections/9.png	2019-08-27 06:10:17.942+00	2019-08-27 06:10:17.989+00	1	\N
10	tuyg	ghyg	\N	2019-08-27 06:11:35.512+00	2019-08-27 06:11:35.543+00	1	\N
11	bleh		\N	2019-08-27 06:33:28.023+00	2019-08-27 06:33:28.031+00	1	\N
44	tutor		static/collections/44.png	2019-08-28 03:52:46.823+00	2019-08-28 03:52:47.01+00	1	\N
46	tutor	hjm\n	\N	2019-08-28 03:52:56.701+00	2019-08-28 03:52:56.701+00	\N	\N
45	tutor		static/collections/45.png	2019-08-28 03:52:56.688+00	2019-08-28 03:52:56.721+00	1	\N
47	lilili		static/collections/47.png	2019-08-28 03:57:32.482+00	2019-08-28 03:57:32.557+00	1	\N
48	lilili		static/collections/48.png	2019-08-28 03:57:40.226+00	2019-08-28 03:57:40.249+00	1	\N
49	screenshots		\N	2019-08-28 03:58:14.967+00	2019-08-28 03:58:14.967+00	\N	\N
50	screenshots		static/collections/50.png	2019-08-28 03:58:16.041+00	2019-08-28 03:58:16.076+00	1	\N
51	screenshots		static/collections/51.png	2019-08-28 03:58:20.073+00	2019-08-28 03:58:20.093+00	1	\N
52	Brighton screenshots		static/collections/52.png	2019-08-28 03:58:57.494+00	2019-08-28 03:58:57.53+00	1	\N
53	gausnsgs		static/collections/53.png	2019-08-28 03:59:58.891+00	2019-08-28 03:59:58.933+00	1	\N
54	barely alive		static/collections/54.png	2019-08-28 04:00:29.347+00	2019-08-28 04:00:29.409+00	1	\N
55	One Peace	Um anime maneiro,mas só depois do episódio 💯\n	static/collections/55.png	2019-08-28 04:03:27.393+00	2019-08-28 04:03:27.441+00	1	\N
57	Uma coleção incrível!	Olha que legal a minha nova colecao\t	static/collections/57.png	2019-10-22 11:47:52.186+00	2019-10-22 11:47:52.322+00	3	\N
65	MANGÁS		static/collections/65.png	2019-10-23 21:18:38.703+00	2019-10-23 21:18:38.757+00	2	public
59	sebo	ssebo\n\n\n\n\n	static/collections/59.png	2019-10-23 17:31:37.845+00	2019-10-23 17:31:37.91+00	2	\N
60	sebo	ssebo\n\n\n\n\n	static/collections/60.png	2019-10-23 17:31:38.057+00	2019-10-23 17:31:38.078+00	2	\N
61	DC COMICS	A DC Comics é uma editora norte-americana subsidiária da companhia WarnerMedia situada em Burbank, Califórnia, especializada em histórias em quadrinhos e mídias relacionadas, sendo considerada uma das maiores companhia ligada a este ramo no mundo.	static/collections/61.png	2019-10-23 21:03:20.091+00	2019-10-23 21:03:20.121+00	2	public
62	MARVEL COMICS	A Marvel Comics, anteriormente Marvel Comics Group, é uma editora norte-americana e mídias relacionadas. Hoje, a Marvel Comics é considerada a maior editora de histórias em quadrinhos do mundo. Em 2009, a The Walt Disney Company, adquiriu a Marvel Entertainment, a empresa mãe da Marvel.	static/collections/62.png	2019-10-23 21:07:01.019+00	2019-10-23 21:07:01.053+00	2	public
63	IMAGE COMICS	Image Comics é uma editora de banda desenhada ou história em quadrinhos norte-americana fundada em 1992 por sete ilustradores e roteiristas dissidentes da Marvel Comics. Inicialmente a "Image Comics" era um selo da Malibu Comics.	static/collections/63.png	2019-10-23 21:10:10.759+00	2019-10-23 21:10:10.782+00	2	public
64	VERTIGO	Vertigo é um selo da editora de quadrinhos DC Comics. Essa divisão opera sob o nome Vertigo para se diferenciar da linha mais popular e familiar da DC Comics, preservando sua imagem. Vertigo publica histórias voltadas para um público mais adulto e maduro.	static/collections/64.png	2019-10-23 21:14:23.571+00	2019-10-23 21:14:23.609+00	2	public
\.


--
-- Data for Name: illustrators; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.illustrators (id, name, created_at, updated_at) FROM stdin;
1	David Lloyd	2019-08-18 01:05:29.924+00	2019-08-18 01:05:29.924+00
2	David Mazzucchelli	2019-08-18 01:05:29.921+00	2019-08-18 01:05:29.921+00
3	Eiichiro Oda	2019-08-18 01:05:29.929+00	2019-08-18 01:05:29.929+00
4	Sam Kieth	2019-08-18 01:05:29.921+00	2019-08-18 01:05:29.921+00
6	Brian Bolland	2019-08-18 01:05:29.985+00	2019-08-18 01:05:29.985+00
7	Jerry Bingham	2019-08-18 01:05:29.994+00	2019-08-18 01:05:29.994+00
8	George Pérez	2019-08-18 01:05:30+00	2019-08-18 01:05:30+00
9	Curt Swan	2019-08-18 01:05:30.01+00	2019-08-18 01:05:30.01+00
10	Art Spiegelman	2019-08-18 01:05:30.016+00	2019-08-18 01:05:30.016+00
11	Dan Day	2019-08-18 01:05:30.019+00	2019-08-18 01:05:30.019+00
12	Andy Kubert	2019-08-18 01:05:30.036+00	2019-08-18 01:05:30.036+00
13	Steve McNiven	2019-08-18 01:05:30.036+00	2019-08-18 01:05:30.036+00
14	John Totleben	2019-08-18 01:05:30.049+00	2019-08-18 01:05:30.049+00
15	Klaus Janson	2019-08-18 01:05:30.072+00	2019-08-18 01:05:30.072+00
16	Lee Bermejo	2019-08-18 01:05:30.08+00	2019-08-18 01:05:30.08+00
17	Frank Quitely	2019-08-18 01:05:30.087+00	2019-08-18 01:05:30.087+00
18	tephen Bissette - ‘Steve’	2019-08-18 01:05:30.087+00	2019-08-18 01:05:30.087+00
19	Steve Dillon	2019-08-18 01:05:30.096+00	2019-08-18 01:05:30.096+00
20	Frank Miller	2019-08-18 01:05:30.096+00	2019-08-18 01:05:30.096+00
21	Greg Capullo	2019-08-18 01:05:30.103+00	2019-08-18 01:05:30.103+00
22	Ron Randall	2019-08-18 01:05:30.103+00	2019-08-18 01:05:30.103+00
23	Stan Woch	2019-08-18 01:05:30.113+00	2019-08-18 01:05:30.113+00
24	Brent Anderson	2019-08-18 01:05:30.124+00	2019-08-18 01:05:30.124+00
25	Elza Keiko	2019-08-18 01:05:30.124+00	2019-08-18 01:05:30.124+00
26	Alex Maleev	2019-08-18 01:05:30.129+00	2019-08-18 01:05:30.129+00
27	Ivan Reis	2019-08-18 01:05:30.133+00	2019-08-18 01:05:30.133+00
28	Gary Frank	2019-08-18 01:05:30.141+00	2019-08-18 01:05:30.141+00
29	John Romita Jr.	2019-08-18 01:05:30.151+00	2019-08-18 01:05:30.151+00
30	Jean Giraud - ‘Moebius’	2019-08-18 01:05:30.156+00	2019-08-18 01:05:30.156+00
31	Vitor Cafaggi	2019-08-18 01:05:30.156+00	2019-08-18 01:05:30.156+00
32	Michael Lark	2019-08-18 01:05:30.17+00	2019-08-18 01:05:30.17+00
33	Jacen Burrows	2019-08-18 01:05:30.18+00	2019-08-18 01:05:30.18+00
34	Katsuhiro Otomo	2019-08-18 01:05:30.185+00	2019-08-18 01:05:30.185+00
35	Masamune Shirow	2019-08-18 01:05:30.189+00	2019-08-18 01:05:30.189+00
36	Jean-Claude Mézières	2019-08-18 01:05:30.193+00	2019-08-18 01:05:30.193+00
38	Gabriele Dell' Otto	2019-08-18 01:05:30.202+00	2019-08-18 01:05:30.202+00
39	Dave Gibbons	2019-08-18 01:05:30.215+00	2019-08-18 01:05:30.215+00
40	Alex Ross	2019-08-18 01:05:30.225+00	2019-08-18 01:05:30.225+00
41	Pia Guerra	2019-08-18 01:05:30.249+00	2019-08-18 01:05:30.249+00
43	Fiona Staples	2019-08-18 01:05:30.259+00	2019-08-18 01:05:30.259+00
45	John Paul Leon	2019-08-18 01:05:30.275+00	2019-08-18 01:05:30.275+00
46	Mauricio de Sousa	2019-08-20 05:21:33.369+00	2019-08-20 05:21:33.369+00
47	Nick Derington	2019-10-24 23:00:45.939+00	2019-10-24 23:00:45.939+00
48	Mitch Gerads	2019-10-24 23:01:16.324+00	2019-10-24 23:01:16.324+00
49	Dave Johnson	2019-10-24 23:08:19.294+00	2019-10-24 23:08:19.294+00
50	Kilian Plunkett	2019-10-24 23:09:44.533+00	2019-10-24 23:09:44.533+00
51	Mike Zeck	2019-10-24 23:16:20.785+00	2019-10-24 23:16:20.785+00
52	Kevin Maguire	2019-10-24 23:20:51.732+00	2019-10-24 23:20:51.732+00
53	David Lopez	2019-10-24 23:28:51.286+00	2019-10-24 23:28:51.286+00
54	 Marjane Satrapi	2019-10-29 20:50:08.355+00	2019-10-29 20:50:08.355+00
55	Rags Morales	2019-11-04 16:22:19.265+00	2019-11-04 16:22:19.265+00
56	Michael Bair	2019-11-04 16:22:42.95+00	2019-11-04 16:22:42.95+00
57	Jack Kirby	2019-11-04 16:30:34.388+00	2019-11-04 16:30:34.388+00
58	Al Plastino	2019-11-04 16:30:44.582+00	2019-11-04 16:30:44.582+00
59	Vince Colletta	2019-11-04 16:30:52.99+00	2019-11-04 16:30:52.99+00
60	Tetsuo Hara	2019-11-04 17:03:56.825+00	2019-11-04 17:03:56.825+00
61	Tomm Coker	2019-11-04 17:33:41.662+00	2019-11-04 17:33:41.662+00
62	Shiko	2019-11-04 18:04:15.558+00	2019-11-04 18:04:15.558+00
63	Breno Ferreira	2019-11-04 18:16:36.408+00	2019-11-04 18:16:36.408+00
\.


--
-- Data for Name: licensors; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.licensors (id, name, created_at, updated_at) FROM stdin;
1	Shueisha	2019-08-18 01:05:31.026+00	2019-08-18 01:05:31.026+00
2	DC (Vertigo)	2019-08-18 01:05:31.033+00	2019-08-18 01:05:31.033+00
4	DC Comics	2019-08-18 01:05:31.071+00	2019-08-18 01:05:31.071+00
5	Art Spiegelman	2019-08-18 01:05:31.092+00	2019-08-18 01:05:31.092+00
6	Marvel Comics	2019-08-18 01:05:31.1+00	2019-08-18 01:05:31.1+00
8	Shogakukan	2019-08-18 01:05:31.154+00	2019-08-18 01:05:31.154+00
9	Marvel Comics (Icon)	2019-08-18 01:05:31.19+00	2019-08-18 01:05:31.19+00
10	Mauricio de Sousa	2019-08-18 01:05:31.202+00	2019-08-18 01:05:31.202+00
11	DCComics	2019-08-18 01:05:31.22+00	2019-08-18 01:05:31.22+00
12	Avatar Press	2019-08-18 01:05:31.235+00	2019-08-18 01:05:31.235+00
13	Kodansha	2019-08-18 01:05:31.239+00	2019-08-18 01:05:31.239+00
14	Dargaud	2019-08-18 01:05:31.26+00	2019-08-18 01:05:31.26+00
15	Image Comics	2019-08-18 01:05:31.333+00	2019-08-18 01:05:31.333+00
17	Dc Comics	2019-08-18 01:05:31.348+00	2019-08-18 01:05:31.348+00
18	Pantheon Comics	2019-10-29 20:50:33.622+00	2019-10-29 20:50:33.622+00
19	Editora Draco	2019-11-04 18:00:46.785+00	2019-11-04 18:00:46.785+00
20	Editora Mino	2019-11-04 18:07:20.084+00	2019-11-04 18:07:20.084+00
\.


--
-- Data for Name: publishers; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.publishers (id, name, created_at, updated_at) FROM stdin;
1	Panini	2019-08-18 01:05:30.628+00	2019-08-18 01:05:30.628+00
3	Cia. das Letras	2019-08-18 01:05:30.699+00	2019-08-18 01:05:30.699+00
4	JBC	2019-08-18 01:05:30.89+00	2019-08-18 01:05:30.89+00
6	SESI-SP	2019-08-18 01:05:30.903+00	2019-08-18 01:05:30.903+00
7	Devir	2019-08-18 01:05:30.993+00	2019-08-18 01:05:30.993+00
9	Darkside Books	2019-10-24 23:12:15.097+00	2019-10-24 23:12:15.097+00
10	NewPOP	2019-11-04 17:38:12.343+00	2019-11-04 17:38:12.343+00
11	Mythos	2019-11-04 17:38:58.378+00	2019-11-04 17:38:58.378+00
12	Editora Bloch	2019-11-04 17:39:29.435+00	2019-11-04 17:39:29.435+00
13	EBAL‎	2019-11-04 17:39:51.808+00	2019-11-04 17:39:51.808+00
14	Editora Abril‎ 	2019-11-04 17:40:05.06+00	2019-11-04 17:40:05.06+00
15	Editora Europa	2019-11-04 17:41:52.387+00	2019-11-04 17:41:52.387+00
16	RGE‎	2019-11-04 17:42:12.02+00	2019-11-04 17:42:12.02+00
17	Jambô Editora	2019-11-04 17:42:34.229+00	2019-11-04 17:42:34.229+00
18	Conrad	2019-11-04 17:43:07.889+00	2019-11-04 17:43:07.889+00
19	Editora Aleph	2019-11-04 17:43:32.201+00	2019-11-04 17:43:32.201+00
20	Editora Draco	2019-11-04 17:43:45.315+00	2019-11-04 17:43:45.315+00
21	Editora Veneta	2019-11-04 17:43:57.403+00	2019-11-04 17:43:57.403+00
22	Salvat	2019-11-04 17:44:18.581+00	2019-11-04 17:44:18.581+00
23	Intrínseca	2019-11-04 17:44:39.879+00	2019-11-04 17:44:39.879+00
24	Pipoca & Nanquim	2019-11-04 17:46:55.667+00	2019-11-04 17:46:55.667+00
25	Planeta de Agostini	2019-11-04 17:47:07.342+00	2019-11-04 17:47:07.342+00
26	Nova Sampa	2019-11-04 17:47:45.452+00	2019-11-04 17:47:45.452+00
27	Rocco editora	2019-11-04 17:48:12.647+00	2019-11-04 17:48:12.647+00
28	Ugra Press	2019-11-04 17:48:42.319+00	2019-11-04 17:48:42.319+00
29	Editora Mino	2019-11-04 18:07:25.032+00	2019-11-04 18:07:25.032+00
\.


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.reviews (id, rating, user_id, book_id, created_at, updated_at) FROM stdin;
1	8	1	3	2019-08-18 01:08:39.576+00	2019-08-18 01:08:48.733+00
2	5	2	55	2019-10-23 17:20:32.966+00	2019-10-23 17:20:33.029+00
4	5	2	32	2019-10-23 21:23:26.034+00	2019-10-23 21:23:26.048+00
5	5	2	7	2019-10-23 21:25:14.877+00	2019-10-23 21:28:14.092+00
6	4	2	22	2019-10-23 21:28:19.382+00	2019-10-23 21:28:19.396+00
7	5	2	44	2019-10-23 21:29:56.672+00	2019-10-23 21:30:01.108+00
8	5	2	2	2019-10-23 21:30:20.89+00	2019-10-23 21:30:20.901+00
3	4	2	77	2019-10-23 17:45:03.066+00	2019-10-23 21:30:45.444+00
9	4	2	5	2019-10-24 02:08:44.092+00	2019-10-24 02:08:44.114+00
10	4	2	84	2019-10-24 23:31:58.773+00	2019-10-24 23:31:59.873+00
11	5	1	26	2019-10-25 02:51:51.808+00	2019-10-25 02:51:51.849+00
12	5	1	32	2019-10-25 02:52:06.47+00	2019-10-25 02:52:06.482+00
13	5	1	25	2019-10-25 02:52:18.767+00	2019-10-25 02:52:18.785+00
14	5	1	51	2019-10-25 02:52:29.52+00	2019-10-25 02:52:29.537+00
15	3	2	29	2019-10-25 03:15:08.876+00	2019-10-25 03:15:08.888+00
16	5	2	81	2019-10-25 03:18:03.833+00	2019-10-25 03:18:03.845+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.users (id, name, email, profile_picture, password_hash, created_at, updated_at, password_reset_token, password_reset_token_expires, refresh_token, refresh_token_expires) FROM stdin;
1	Thays	thays.sn@hotmail.com	static/users/1.png	$2a$08$Zgq8zr0n7o.r4GyA484vGOYs4p5DIStjICmvpCjgzMc.rAFF3Amr2	2019-08-18 01:07:54.21+00	2019-09-09 06:00:40.532+00	d50a5c5764bca39958f5827d9fe6e65e9eecffb7	2019-09-09 06:00:40.532+00	\N	\N
3	Victorie Royal	victorie@royal.com	\N	$2a$08$.R61YkUrgRBv3Q16sg8Ry.DafduBdgOgky8IhOKUDE9NJ3EHiWPZK	2019-10-22 11:47:00.915+00	2019-10-22 11:47:00.915+00	\N	\N	\N	\N
2	Load	loadcomics@outlook.com	static/users/2.png	$2a$08$WdCyXkKOe6HUOiXP8t/3/uN74zENWfVNgvdU8FGI4ia4rGAKzjtla	2019-08-23 14:56:19.119+00	2019-10-23 17:04:00.884+00	4451f8927854e22d341c7b4dcb8dc0566ca89d08	2019-10-23 17:04:00.884+00	\N	\N
\.


--
-- Data for Name: writers; Type: TABLE DATA; Schema: public; Owner: comiclovers
--

COPY public.writers (id, name, created_at, updated_at) FROM stdin;
1	Eiichiro Oda	2019-08-18 01:05:30.286+00	2019-08-18 01:05:30.286+00
2	Frank Miller	2019-08-18 01:05:30.298+00	2019-08-18 01:05:30.298+00
3	Neil Gaiman	2019-08-18 01:05:30.303+00	2019-08-18 01:05:30.303+00
4	Alan Moore	2019-08-18 01:05:30.307+00	2019-08-18 01:05:30.307+00
5	Mike W. Barr	2019-08-18 01:05:30.335+00	2019-08-18 01:05:30.335+00
6	Art Spiegelman	2019-08-18 01:05:30.348+00	2019-08-18 01:05:30.348+00
7	Mark Millar	2019-08-18 01:05:30.359+00	2019-08-18 01:05:30.359+00
8	Brian Azzarello	2019-08-18 01:05:30.384+00	2019-08-18 01:05:30.384+00
9	Grant Morrison	2019-08-18 01:05:30.394+00	2019-08-18 01:05:30.394+00
10	Garth Ennis	2019-08-18 01:05:30.404+00	2019-08-18 01:05:30.404+00
11	Scott Snyder	2019-08-18 01:05:30.418+00	2019-08-18 01:05:30.418+00
12	Chris Claremont	2019-08-18 01:05:30.434+00	2019-08-18 01:05:30.434+00
13	Naoki Urasawa	2019-08-18 01:05:30.438+00	2019-08-18 01:05:30.438+00
14	Brian Michael Bendis	2019-08-18 01:05:30.445+00	2019-08-18 01:05:30.445+00
15	Geoff Johns	2019-08-18 01:05:30.447+00	2019-08-18 01:05:30.447+00
16	David Mack	2019-08-18 01:05:30.454+00	2019-08-18 01:05:30.454+00
17	Jason Aaron	2019-08-18 01:05:30.469+00	2019-08-18 01:05:30.469+00
18	Lee Bermejo	2019-08-18 01:05:30.477+00	2019-08-18 01:05:30.477+00
19	Stan Lee	2019-08-18 01:05:30.486+00	2019-08-18 01:05:30.486+00
20	Vitor Cafaggi	2019-08-18 01:05:30.486+00	2019-08-18 01:05:30.486+00
21	Luciana Cafaggi	2019-08-18 01:05:30.498+00	2019-08-18 01:05:30.498+00
22	Greg Rucka	2019-08-18 01:05:30.505+00	2019-08-18 01:05:30.505+00
23	Ed Brubaker	2019-08-18 01:05:30.51+00	2019-08-18 01:05:30.51+00
24	Katsuhiro Otomo	2019-08-18 01:05:30.524+00	2019-08-18 01:05:30.524+00
25	Masamune Shirow	2019-08-18 01:05:30.532+00	2019-08-18 01:05:30.532+00
26	Pierre Christin - ‘Linus’	2019-08-18 01:05:30.54+00	2019-08-18 01:05:30.54+00
27	Peter Milligan	2019-08-18 01:05:30.55+00	2019-08-18 01:05:30.55+00
28	Mark Waid	2019-08-18 01:05:30.574+00	2019-08-18 01:05:30.574+00
29	Brian K. Vaughan	2019-08-18 01:05:30.594+00	2019-08-18 01:05:30.594+00
31	Jim Krueger	2019-08-18 01:05:30.619+00	2019-08-18 01:05:30.619+00
32	Fabiano Denardin	2019-08-18 01:05:30.622+00	2019-08-18 01:05:30.622+00
33	Mauricio de Sousa	2019-08-20 05:21:11.461+00	2019-08-20 05:21:11.461+00
34	Tom King	2019-10-24 23:01:03.936+00	2019-10-24 23:01:03.936+00
35	J.M. Dematteis	2019-10-24 23:15:48.551+00	2019-10-24 23:15:48.551+00
36	Keith Giffen	2019-10-24 23:20:27.396+00	2019-10-24 23:20:27.396+00
37	Kelly Sue Deconnick	2019-10-24 23:29:00.517+00	2019-10-24 23:29:00.517+00
38	 Marjane Satrapi	2019-10-29 20:50:14.955+00	2019-10-29 20:50:14.955+00
39	Marv Wolfman	2019-11-04 16:15:31.68+00	2019-11-04 16:15:31.68+00
40	Brad Meltzer	2019-11-04 16:22:30.142+00	2019-11-04 16:22:30.142+00
41	Jack Kirby	2019-11-04 16:31:07.97+00	2019-11-04 16:31:07.97+00
42	 Yoshiyuki Okamura	2019-11-04 17:04:23.872+00	2019-11-04 17:04:23.872+00
43	Jonathan Hickman	2019-11-04 17:33:29.119+00	2019-11-04 17:33:29.119+00
44	Shiko	2019-11-04 18:04:08.063+00	2019-11-04 18:04:08.063+00
45	Breno Ferreira	2019-11-04 18:16:31.536+00	2019-11-04 18:16:31.536+00
\.


--
-- Name: book_illustrators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.book_illustrators_id_seq', 113, true);


--
-- Name: book_licensors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.book_licensors_id_seq', 101, true);


--
-- Name: book_publishers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.book_publishers_id_seq', 103, true);


--
-- Name: book_writers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.book_writers_id_seq', 105, true);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.books_id_seq', 102, true);


--
-- Name: collection_books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.collection_books_id_seq', 147, true);


--
-- Name: collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.collections_id_seq', 65, true);


--
-- Name: illustrators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.illustrators_id_seq', 63, true);


--
-- Name: licensors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.licensors_id_seq', 20, true);


--
-- Name: publishers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.publishers_id_seq', 29, true);


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.reviews_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: writers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: comiclovers
--

SELECT pg_catalog.setval('public.writers_id_seq', 45, true);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: book_illustrators book_illustrators_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_illustrators
    ADD CONSTRAINT book_illustrators_pkey PRIMARY KEY (id);


--
-- Name: book_licensors book_licensors_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_licensors
    ADD CONSTRAINT book_licensors_pkey PRIMARY KEY (id);


--
-- Name: book_publishers book_publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_publishers
    ADD CONSTRAINT book_publishers_pkey PRIMARY KEY (id);


--
-- Name: book_writers book_writers_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_writers
    ADD CONSTRAINT book_writers_pkey PRIMARY KEY (id);


--
-- Name: books books_isbn_10_key; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_isbn_10_key UNIQUE (isbn_10);


--
-- Name: books books_isbn_key; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_isbn_key UNIQUE (isbn);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: collection_books collection_books_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.collection_books
    ADD CONSTRAINT collection_books_pkey PRIMARY KEY (id);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


--
-- Name: illustrators illustrators_name_key; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.illustrators
    ADD CONSTRAINT illustrators_name_key UNIQUE (name);


--
-- Name: illustrators illustrators_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.illustrators
    ADD CONSTRAINT illustrators_pkey PRIMARY KEY (id);


--
-- Name: licensors licensors_name_key; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.licensors
    ADD CONSTRAINT licensors_name_key UNIQUE (name);


--
-- Name: licensors licensors_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.licensors
    ADD CONSTRAINT licensors_pkey PRIMARY KEY (id);


--
-- Name: publishers publishers_name_key; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_name_key UNIQUE (name);


--
-- Name: publishers publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: writers writers_name_key; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.writers
    ADD CONSTRAINT writers_name_key UNIQUE (name);


--
-- Name: writers writers_pkey; Type: CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.writers
    ADD CONSTRAINT writers_pkey PRIMARY KEY (id);


--
-- Name: book_illustrators book_illustrators_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_illustrators
    ADD CONSTRAINT book_illustrators_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: book_illustrators book_illustrators_illustrator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_illustrators
    ADD CONSTRAINT book_illustrators_illustrator_id_fkey FOREIGN KEY (illustrator_id) REFERENCES public.illustrators(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: book_licensors book_licensors_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_licensors
    ADD CONSTRAINT book_licensors_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: book_licensors book_licensors_licensor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_licensors
    ADD CONSTRAINT book_licensors_licensor_id_fkey FOREIGN KEY (licensor_id) REFERENCES public.licensors(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: book_publishers book_publishers_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_publishers
    ADD CONSTRAINT book_publishers_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: book_publishers book_publishers_publisher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_publishers
    ADD CONSTRAINT book_publishers_publisher_id_fkey FOREIGN KEY (publisher_id) REFERENCES public.publishers(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: book_writers book_writers_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_writers
    ADD CONSTRAINT book_writers_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: book_writers book_writers_writer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.book_writers
    ADD CONSTRAINT book_writers_writer_id_fkey FOREIGN KEY (writer_id) REFERENCES public.writers(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: collection_books collection_books_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.collection_books
    ADD CONSTRAINT collection_books_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: collection_books collection_books_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.collection_books
    ADD CONSTRAINT collection_books_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: collections collections_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reviews reviews_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_book_id_fkey FOREIGN KEY (book_id) REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: reviews reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: comiclovers
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

