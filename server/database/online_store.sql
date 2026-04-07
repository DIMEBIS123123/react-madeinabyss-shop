--
-- PostgreSQL database dump
--

\restrict gXzhzrOGd1MCRh8HaI9kEXeac5EpHvel3DbmrGYWtWRkZJb3tAAhNd6QscQu5Gf

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-04-07 13:01:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 230 (class 1259 OID 16479)
-- Name: basket_devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_devices (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "basketId" integer,
    "deviceId" integer
);


ALTER TABLE public.basket_devices OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16478)
-- Name: basket_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.basket_devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.basket_devices_id_seq OWNER TO postgres;

--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 229
-- Name: basket_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.basket_devices_id_seq OWNED BY public.basket_devices.id;


--
-- TOC entry 222 (class 1259 OID 16405)
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16404)
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.baskets_id_seq OWNER TO postgres;

--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 221
-- Name: baskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;


--
-- TOC entry 226 (class 1259 OID 16433)
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16432)
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brands_id_seq OWNER TO postgres;

--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 225
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- TOC entry 234 (class 1259 OID 16520)
-- Name: device_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_infos (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "deviceId" integer
);


ALTER TABLE public.device_infos OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16519)
-- Name: device_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.device_infos_id_seq OWNER TO postgres;

--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 233
-- Name: device_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_infos_id_seq OWNED BY public.device_infos.id;


--
-- TOC entry 228 (class 1259 OID 16446)
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price character varying(255) NOT NULL,
    rating integer DEFAULT 0,
    img character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "deviceId" integer,
    "brandId" integer
);


ALTER TABLE public.devices OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16445)
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.devices_id_seq OWNER TO postgres;

--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 227
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- TOC entry 232 (class 1259 OID 16499)
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    rate integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer,
    "deviceId" integer
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16498)
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ratings_id_seq OWNER TO postgres;

--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 231
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- TOC entry 236 (class 1259 OID 16539)
-- Name: type_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_brands (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "typeId" integer,
    "brandId" integer
);


ALTER TABLE public.type_brands OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16538)
-- Name: type_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.type_brands_id_seq OWNER TO postgres;

--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 235
-- Name: type_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.type_brands_id_seq OWNED BY public.type_brands.id;


--
-- TOC entry 224 (class 1259 OID 16420)
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16419)
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.types_id_seq OWNER TO postgres;

--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 223
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- TOC entry 220 (class 1259 OID 16390)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16389)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4903 (class 2604 OID 16482)
-- Name: basket_devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices ALTER COLUMN id SET DEFAULT nextval('public.basket_devices_id_seq'::regclass);


--
-- TOC entry 4898 (class 2604 OID 16408)
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 16436)
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- TOC entry 4905 (class 2604 OID 16523)
-- Name: device_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_infos ALTER COLUMN id SET DEFAULT nextval('public.device_infos_id_seq'::regclass);


--
-- TOC entry 4901 (class 2604 OID 16449)
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- TOC entry 4904 (class 2604 OID 16502)
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- TOC entry 4906 (class 2604 OID 16542)
-- Name: type_brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands ALTER COLUMN id SET DEFAULT nextval('public.type_brands_id_seq'::regclass);


--
-- TOC entry 4899 (class 2604 OID 16423)
-- Name: types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 16393)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5104 (class 0 OID 16479)
-- Dependencies: 230
-- Data for Name: basket_devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_devices (id, "createdAt", "updatedAt", "basketId", "deviceId") FROM stdin;
226	2026-04-07 09:53:32.333+03	2026-04-07 09:53:32.333+03	20	18
227	2026-04-07 09:53:32.91+03	2026-04-07 09:53:32.91+03	20	19
\.


--
-- TOC entry 5096 (class 0 OID 16405)
-- Dependencies: 222
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baskets (id, "createdAt", "updatedAt", "userId") FROM stdin;
1	2026-02-08 19:37:38.843+03	2026-02-08 19:37:38.843+03	1
2	2026-02-08 19:43:50.741+03	2026-02-08 19:43:50.741+03	2
3	2026-02-08 19:44:29.633+03	2026-02-08 19:44:29.633+03	4
4	2026-02-08 19:46:47.659+03	2026-02-08 19:46:47.659+03	5
5	2026-02-11 13:23:16.507+03	2026-02-11 13:23:16.507+03	6
6	2026-03-10 11:24:20.834+03	2026-03-10 11:24:20.834+03	7
7	2026-03-10 11:24:41.074+03	2026-03-10 11:24:41.074+03	8
8	2026-03-10 11:30:53.427+03	2026-03-10 11:30:53.427+03	9
9	2026-03-10 11:40:58.486+03	2026-03-10 11:40:58.486+03	10
10	2026-03-10 11:42:46.429+03	2026-03-10 11:42:46.429+03	11
11	2026-03-12 15:53:42.775+03	2026-03-12 15:53:42.775+03	12
12	2026-03-12 15:57:03.395+03	2026-03-12 15:57:03.395+03	13
13	2026-03-12 16:00:15.467+03	2026-03-12 16:00:15.467+03	16
14	2026-03-12 16:02:41.499+03	2026-03-12 16:02:41.499+03	17
15	2026-03-12 16:04:07.605+03	2026-03-12 16:04:07.605+03	19
16	2026-03-12 16:05:13.088+03	2026-03-12 16:05:13.088+03	20
17	2026-03-12 16:15:49.84+03	2026-03-12 16:15:49.84+03	21
18	2026-03-12 16:19:11.959+03	2026-03-12 16:19:11.959+03	23
19	2026-03-12 16:22:46.644+03	2026-03-12 16:22:46.644+03	24
20	2026-03-13 13:05:12.78+03	2026-03-13 13:05:12.78+03	25
\.


--
-- TOC entry 5100 (class 0 OID 16433)
-- Dependencies: 226
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, name, "createdAt", "updatedAt") FROM stdin;
10	Персонажи	2026-04-03 10:53:36.505+03	2026-04-03 10:53:36.505+03
11	Реликвии	2026-04-03 10:53:44.291+03	2026-04-03 10:53:44.291+03
12	Тома Манги	2026-04-03 10:54:01.815+03	2026-04-03 10:54:01.815+03
14	Существа Бездны	2026-04-04 09:59:32.095+03	2026-04-04 09:59:32.095+03
\.


--
-- TOC entry 5108 (class 0 OID 16520)
-- Dependencies: 234
-- Data for Name: device_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_infos (id, title, description, "createdAt", "updatedAt", "deviceId") FROM stdin;
1	Оперативная Память	16гб	2026-03-22 05:37:39.583+03	2026-03-22 05:37:39.583+03	\N
2	Разрешение	FULL HD	2026-03-22 05:37:39.584+03	2026-03-22 05:37:39.584+03	\N
\.


--
-- TOC entry 5102 (class 0 OID 16446)
-- Dependencies: 228
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devices (id, name, price, rating, img, "createdAt", "updatedAt", "typeId", "deviceId", "brandId") FROM stdin;
18	Рико	Белый свисток	0	a151bdb7-f74b-48fb-b395-0ccbec89b0e8.jpg	2026-04-03 11:28:24.391+03	2026-04-03 11:28:24.391+03	10	\N	10
19	Рэг	Красный свисток	0	44d944de-ad4a-4632-b0ad-1acccd6c1f5d.jpg	2026-04-03 11:28:48.445+03	2026-04-03 11:28:48.445+03	10	\N	10
20	Наначи	Пушистик	0	1ca15a81-4cbb-4545-bc83-87eb12a64e5b.jpg	2026-04-03 11:29:09.822+03	2026-04-03 11:29:09.822+03	13	\N	10
21	Прушка	Бедняшка	0	c6dccaed-9799-4149-8246-c6580ca5a526.jpg	2026-04-03 11:30:36.421+03	2026-04-03 11:30:36.421+03	14	\N	10
22	Фапута	Принцесса	0	8faed9ef-29a2-42ea-955b-0d4ee13359e4.jpg	2026-04-03 11:31:11.891+03	2026-04-03 11:31:11.891+03	15	\N	10
23	Лайза	Белый свисток	0	452241ec-6b34-4150-9585-1842e3e212c9.jpg	2026-04-03 11:31:47.516+03	2026-04-03 11:31:47.516+03	16	\N	10
24	Озэн	Белый свисток	0	a316f5f1-b3e8-459b-afd9-a19bf74659f5.jpg	2026-04-03 11:32:10.965+03	2026-04-03 11:32:10.965+03	11	\N	10
25	Габурун	Страж	0	54e1755d-9712-4b04-8ebb-29bdf17a03d9.jpg	2026-04-03 11:32:47.409+03	2026-04-03 11:32:47.409+03	15	\N	10
26	Вазукян	Жадный мечтатель	0	a3ebf488-bf98-4d6a-b0d1-886dd8e6734b.jpg	2026-04-03 11:33:21.201+03	2026-04-03 11:33:21.201+03	15	\N	10
27	Вуэко	Бедная мать	0	bca91177-71a7-43a0-beb9-bad51be83111.jpg	2026-04-03 11:34:13.748+03	2026-04-03 11:34:13.748+03	15	\N	10
28	Белаф	Прекрасные глаза	0	d935af11-e7e0-4acc-b1a8-e950384cfd7e.jpg	2026-04-03 11:34:50.374+03	2026-04-03 11:34:50.374+03	15	\N	10
29	Бондрюд	Белый свисток	0	4e98644d-af30-43d7-89de-7740ff048691.jpg	2026-04-03 11:35:19.809+03	2026-04-03 11:35:19.809+03	14	\N	10
30	Марурук	Синий свисток	0	e41f2539-9f78-45c3-8481-6dbbfa96f1b8.jpg	2026-04-03 11:35:41.192+03	2026-04-03 11:35:41.192+03	11	\N	10
31	Хаболг	Чёрный свисток	0	29a54c1d-6c5e-4235-be30-6ffdd77263f3.jpg	2026-04-03 11:36:18.198+03	2026-04-03 11:36:18.198+03	10	\N	10
32	Джируо	Фиолетовый свисток	0	c46d049e-9618-4e57-8845-7f90d5b44d75.jpg	2026-04-03 11:36:49.918+03	2026-04-03 11:36:49.918+03	10	\N	10
33	Лазурный кулон	1st	0	7199dda5-c042-4fb7-aacc-569bf1cf4707.jpg	2026-04-04 09:29:55.12+03	2026-04-04 09:29:55.12+03	10	\N	11
34	Звёздный компас	1st	0	847bea8f-abe3-4bb2-bdee-ab8c507dd9a7.jpg	2026-04-04 09:30:41.644+03	2026-04-04 09:30:41.644+03	10	\N	11
35	Зоаголик	Особый класс	0	92d2e235-98d4-4d17-b21b-c734613ac86a.jpg	2026-04-04 09:32:15.622+03	2026-04-04 09:32:15.622+03	14	\N	11
36	Чешуйчатый зонт	3st	0	13713218-5dc5-426f-9ba7-0416ac7de4b6.jpg	2026-04-04 09:33:24.716+03	2026-04-04 09:33:24.716+03	10	\N	11
37	Солнечная сфера	1st	0	e87f0252-e05f-4005-8442-e63ff261b4c2.jpg	2026-04-04 09:34:20.599+03	2026-04-04 09:34:20.599+03	10	\N	11
38	Грудь принцессы	1st	0	858cc8a3-7a3b-434e-9cd2-233407a78dab.jpg	2026-04-04 09:34:50.106+03	2026-04-04 09:34:50.106+03	10	\N	11
39	Тканый туман	4st	0	b69f9fb4-4604-4aca-b1fd-59c0bf7dabe1.jpg	2026-04-04 09:35:21.912+03	2026-04-04 09:35:21.912+03	13	\N	11
40	Отрыжка русалки	2st	0	7962f8cf-2c52-46d9-8eaf-4f26157efb77.jpg	2026-04-04 09:36:51.653+03	2026-04-04 09:36:51.653+03	11	\N	11
41	Нежный стук	3st	0	3778d4c6-abb9-4083-a84a-bd6f9c336238.jpg	2026-04-04 09:37:33.561+03	2026-04-04 09:37:33.561+03	12	\N	11
42	Неслышимый колокол	4st	0	f8913073-fffd-4680-abb1-7aa671047a93.jpg	2026-04-04 09:38:40.165+03	2026-04-04 09:38:40.165+03	13	\N	11
43	Том 1	(171 страница)	0	24aa6ee5-1fcb-486c-9204-16e151c0481d.jpg	2026-04-04 09:40:39.654+03	2026-04-04 09:40:39.654+03	10	\N	12
44	Том 2	(163 страницы)	0	e79ed30b-f3c4-4f48-9a6f-0c48b15eeeec.jpg	2026-04-04 09:41:11.963+03	2026-04-04 09:41:11.963+03	11	\N	12
45	Том 3	(166 страниц)	0	ba2b1d17-24d7-4da3-afaa-34cfa09b7990.jpg	2026-04-04 09:41:37.358+03	2026-04-04 09:41:37.358+03	13	\N	12
46	Том 4	(167 страниц)	0	8a234136-8807-45c8-92e7-68363d2b45d4.jpg	2026-04-04 09:42:31.277+03	2026-04-04 09:42:31.277+03	14	\N	12
47	Том 5	(165 страниц)	0	2c9fb1ce-f914-4cea-87a3-b08dbf074deb.jpg	2026-04-04 09:42:49.116+03	2026-04-04 09:42:49.116+03	14	\N	12
48	Том 6	(166 страниц)	0	bbf6fba2-6ecb-4cc1-913d-ff3a473c4e08.jpg	2026-04-04 09:43:06.725+03	2026-04-04 09:43:06.725+03	15	\N	12
49	Том 7	(168 страниц)	0	899803ae-65e3-4989-a6ad-7073060e88b3.jpg	2026-04-04 09:43:21.701+03	2026-04-04 09:43:21.701+03	15	\N	12
50	Том 8	(167 страниц)	0	b944b9b6-201b-4022-ad69-608f08fb1e1e.jpg	2026-04-04 09:43:43.443+03	2026-04-04 09:43:43.443+03	15	\N	12
51	Том 9	(168 страниц)	0	01701fb7-f570-4d95-a106-46012b102729.jpg	2026-04-04 09:44:01.376+03	2026-04-04 09:44:01.376+03	15	\N	12
52	Том 10	(168 страниц)	0	e45cbcd4-aa4d-4b58-bbcd-2f629469b7d8.jpg	2026-04-04 09:45:15.447+03	2026-04-04 09:45:15.447+03	15	\N	12
53	Бэникучинава	Смертельно опасный	0	72cee1f0-3035-44c9-ad6e-74338ab082a3.jpg	2026-04-04 10:00:57.128+03	2026-04-04 10:00:57.128+03	12	\N	14
54	Шарокол	Смертельно опасный	0	6e8e0f5f-e2a4-410b-bee5-b7f6718cc4e4.jpg	2026-04-04 10:01:23.135+03	2026-04-04 10:01:23.135+03	13	\N	14
55	Плоскогрыз	Безобидный	0	2e537b37-73c7-4409-b62c-c2f50179c48d.jpg	2026-04-04 10:01:43.302+03	2026-04-04 10:01:43.302+03	12	\N	14
56	Рюусазай	Чрезвычайно опасный	0	30ac5851-591c-48b7-bad2-cd04dbe4849f.jpg	2026-04-04 10:02:15.484+03	2026-04-04 10:02:15.484+03	15	\N	14
57	Неувядающие притворщики	Смертельно опасный	0	84ebdc34-a770-4f23-855e-b424067f48b2.jpg	2026-04-04 10:02:59.563+03	2026-04-04 10:02:59.563+03	15	\N	14
\.


--
-- TOC entry 5106 (class 0 OID 16499)
-- Dependencies: 232
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (id, rate, "createdAt", "updatedAt", "userId", "deviceId") FROM stdin;
\.


--
-- TOC entry 5110 (class 0 OID 16539)
-- Dependencies: 236
-- Data for Name: type_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_brands (id, "createdAt", "updatedAt", "typeId", "brandId") FROM stdin;
\.


--
-- TOC entry 5098 (class 0 OID 16420)
-- Dependencies: 224
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (id, name, "createdAt", "updatedAt") FROM stdin;
10	1-й Слой — Край Бездны	2026-04-03 10:48:19.789+03	2026-04-03 10:48:19.789+03
11	2-й слой: Манящий лес	2026-04-03 10:48:40.256+03	2026-04-03 10:48:40.256+03
12	3-й слой: Великий разлом	2026-04-03 10:48:52.039+03	2026-04-03 10:48:52.039+03
13	4-й слой: Чаши великанов	2026-04-03 10:50:02.072+03	2026-04-03 10:50:02.072+03
14	5-й слой: Море трупов	2026-04-03 10:50:32.683+03	2026-04-03 10:50:32.683+03
15	6-й слой: Столица невернувшихся	2026-04-03 10:51:07.204+03	2026-04-03 10:51:07.204+03
16	7-й слой+: Воронка в конце	2026-04-03 10:51:31.296+03	2026-04-03 10:51:31.296+03
\.


--
-- TOC entry 5094 (class 0 OID 16390)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, role, "createdAt", "updatedAt") FROM stdin;
1	animeshnik@mail.ru	$2b$05$7ZyhPqtj3Ka2zL.LqbK26.qMubi9AoqVGZcLjdCk1KgFo86T7s4Qe	USER	2026-02-08 19:37:38.833+03	2026-02-08 19:37:38.833+03
2	animeshnikLOL@mail.ru	$2b$05$nMQ3ZLIL0hXYw4vmUNC7UubjhE0lsgJ4ImgUQSgTX/qi43zgRaNjy	USER	2026-02-08 19:43:50.737+03	2026-02-08 19:43:50.737+03
4	animeshnik1234@mail.ru	$2b$05$d0myEWRQWnUcBqZs3/21Cel625OiX1KFvCjnwihtwYsiQIK28ovlS	USER	2026-02-08 19:44:29.631+03	2026-02-08 19:44:29.631+03
5	animeshnik1231114@mail.ru	$2b$05$MGSL08Hsk5JZWgxypQdfPOb1/uMpq7y3trrRX876MdGhtHsF7ddzK	USER	2026-02-08 19:46:47.655+03	2026-02-08 19:46:47.655+03
6	adminboss@mail.ru	$2b$05$0CblqhtzL92/LB9cE67zweuGOXQKjRkibNIHSXy75omyMZ1VWHC52	ADMIN	2026-02-11 13:23:16.497+03	2026-02-11 13:23:16.497+03
7		$2b$05$f1hYY0S.67ApQkSWZFxqp.UaUx5kbYWDHLIktGxE7bd8B5HiK0Lwa	ADMIN	2026-03-10 11:24:20.826+03	2026-03-10 11:24:20.826+03
8	animechnik@mail.ru	$2b$05$5pCyeXmf0pYYrmVkcugi3OFcHccKDUFhGVtxAo6Tev6eoyQDINO3.	ADMIN	2026-03-10 11:24:41.073+03	2026-03-10 11:24:41.073+03
9	alenaturbo@mail.ru	$2b$05$ADLZlWWOh3G5OjvgtqvXGuj3dbSlnRvd14/YNePWEIdJNQgLDFvtO	ADMIN	2026-03-10 11:30:53.425+03	2026-03-10 11:30:53.425+03
10	anime@mail.ru	$2b$05$cS0QoZgrCngTg7X2F/isjeAUQ9PlKoySiWYpRERoZJRJeQ0A6xT3O	ADMIN	2026-03-10 11:40:58.485+03	2026-03-10 11:40:58.485+03
11	anime123121@mail.ru	$2b$05$9G5Cm7FnG388BQIDl7p4L.52CJnWCZzTdrwWxrTtWMf12Ei9QIaIe	ADMIN	2026-03-10 11:42:46.427+03	2026-03-10 11:42:46.427+03
12	fairytail@mail.ru	$2b$05$iOcphDtWoQ227Tvg/UUBxe/lwyV8273ZUriyuyGLjPUbPoxHC.pVO	ADMIN	2026-03-12 15:53:42.766+03	2026-03-12 15:53:42.766+03
13	loololol@mail.ru	$2b$05$LImirijIBtdY3imDFF4dHe0nHmy.JcoRPcd8SUXwmV7eajteaDOCy	ADMIN	2026-03-12 15:57:03.394+03	2026-03-12 15:57:03.394+03
16	testtest@mail.ru	$2b$05$nuLBfpYIU3sGXntI649TYu8g3mMibM0Cp4ScAJCIOXx2j4AvSozVm	ADMIN	2026-03-12 16:00:15.466+03	2026-03-12 16:00:15.466+03
17	marina@mail.ru	$2b$05$koagRJx0YSquGyZpOF3dYezJxLeMUdhupjzW.y7ghCwbjKRB0JpgG	ADMIN	2026-03-12 16:02:41.498+03	2026-03-12 16:02:41.498+03
19	wqqw2qw	$2b$05$XivAarNTnABAzK7adjhrbu.pYV5x.XMLIU0YZjU6XHwqzGPi50smC	ADMIN	2026-03-12 16:04:07.604+03	2026-03-12 16:04:07.604+03
20	genadiiwolkov@mail.ru	$2b$05$7e2YXT4WCdugW5b78DZpIObH1DnhVTVPjF8xvhPN.KrduRGKwI2sm	ADMIN	2026-03-12 16:05:13.087+03	2026-03-12 16:05:13.087+03
21	dmitriywow@mail.ru	$2b$05$DlrVW4xQu9DFW24mkpF5Mu5gJcInlcDOoIkDbuQ8bqtoUa3yh6aOW	ADMIN	2026-03-12 16:15:49.839+03	2026-03-12 16:15:49.839+03
23	dmitriywow1@mail.ru	$2b$05$bBsxNfGcIqKgMIGqXkzmV.4olqlpnFMgcFdU1mSNxBDIE035Gu8.K	ADMIN	2026-03-12 16:19:11.957+03	2026-03-12 16:19:11.957+03
24	animehihi@mail.ru	$2b$05$UrecU9pR3rC5v5XvqGJLvOkQq6poofe4hjxMCZWyVMMdcXJiViTBW	ADMIN	2026-03-12 16:22:46.643+03	2026-03-12 16:22:46.643+03
25	auth@mail.ru	$2b$05$NKq3nGw9oPOiFldzAezqZ.iPyplDPG.Y0yQ5BrTGfpbwELAVLaBDO	ADMIN	2026-03-13 13:05:12.772+03	2026-03-13 13:05:12.772+03
\.


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 229
-- Name: basket_devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.basket_devices_id_seq', 227, true);


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 221
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 20, true);


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 225
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 14, true);


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 233
-- Name: device_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_infos_id_seq', 2, true);


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 227
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devices_id_seq', 57, true);


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 231
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 235
-- Name: type_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_brands_id_seq', 1, false);


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 223
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_id_seq', 16, true);


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 25, true);


--
-- TOC entry 4926 (class 2606 OID 16487)
-- Name: basket_devices basket_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT basket_devices_pkey PRIMARY KEY (id);


--
-- TOC entry 4912 (class 2606 OID 16413)
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- TOC entry 4918 (class 2606 OID 16444)
-- Name: brands brands_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_name_key UNIQUE (name);


--
-- TOC entry 4920 (class 2606 OID 16442)
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- TOC entry 4930 (class 2606 OID 16532)
-- Name: device_infos device_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_infos
    ADD CONSTRAINT device_infos_pkey PRIMARY KEY (id);


--
-- TOC entry 4922 (class 2606 OID 16462)
-- Name: devices devices_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_name_key UNIQUE (name);


--
-- TOC entry 4924 (class 2606 OID 16460)
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- TOC entry 4928 (class 2606 OID 16508)
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- TOC entry 4932 (class 2606 OID 16547)
-- Name: type_brands type_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT type_brands_pkey PRIMARY KEY (id);


--
-- TOC entry 4934 (class 2606 OID 16549)
-- Name: type_brands type_brands_typeId_brandId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_brandId_key" UNIQUE ("typeId", "brandId");


--
-- TOC entry 4914 (class 2606 OID 16431)
-- Name: types types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_name_key UNIQUE (name);


--
-- TOC entry 4916 (class 2606 OID 16429)
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- TOC entry 4908 (class 2606 OID 16403)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4910 (class 2606 OID 16401)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4939 (class 2606 OID 16488)
-- Name: basket_devices basket_devices_basketId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_basketId_fkey" FOREIGN KEY ("basketId") REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4940 (class 2606 OID 16493)
-- Name: basket_devices basket_devices_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_devices
    ADD CONSTRAINT "basket_devices_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4935 (class 2606 OID 16414)
-- Name: baskets baskets_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT "baskets_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4943 (class 2606 OID 16533)
-- Name: device_infos device_infos_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_infos
    ADD CONSTRAINT "device_infos_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4936 (class 2606 OID 16473)
-- Name: devices devices_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4937 (class 2606 OID 16468)
-- Name: devices devices_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4938 (class 2606 OID 16463)
-- Name: devices devices_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT "devices_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4941 (class 2606 OID 16514)
-- Name: ratings ratings_deviceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT "ratings_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES public.devices(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4942 (class 2606 OID 16509)
-- Name: ratings ratings_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT "ratings_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4944 (class 2606 OID 16555)
-- Name: type_brands type_brands_brandId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4945 (class 2606 OID 16550)
-- Name: type_brands type_brands_typeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_brands
    ADD CONSTRAINT "type_brands_typeId_fkey" FOREIGN KEY ("typeId") REFERENCES public.types(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-04-07 13:01:33

--
-- PostgreSQL database dump complete
--

\unrestrict gXzhzrOGd1MCRh8HaI9kEXeac5EpHvel3DbmrGYWtWRkZJb3tAAhNd6QscQu5Gf

