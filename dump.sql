--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.2

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
-- Name: comments; Type: TABLE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE TABLE "public"."comments" (
    "id" integer NOT NULL,
    "content" character varying(255) NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE public.comments OWNER TO zfatbtsgvywdbs;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE SEQUENCE "public"."comments_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO zfatbtsgvywdbs;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER SEQUENCE "public"."comments_id_seq" OWNED BY "public"."comments"."id";


--
-- Name: follows; Type: TABLE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE TABLE "public"."follows" (
    "id" integer NOT NULL,
    "userId" integer NOT NULL,
    "followedId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE public.follows OWNER TO zfatbtsgvywdbs;

--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE SEQUENCE "public"."follows_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.follows_id_seq OWNER TO zfatbtsgvywdbs;

--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER SEQUENCE "public"."follows_id_seq" OWNED BY "public"."follows"."id";


--
-- Name: hashtags; Type: TABLE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE TABLE "public"."hashtags" (
    "id" integer NOT NULL,
    "name" "text" NOT NULL,
    "createdAt" timestamp without time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE public.hashtags OWNER TO zfatbtsgvywdbs;

--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE SEQUENCE "public"."hashtags_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hashtags_id_seq OWNER TO zfatbtsgvywdbs;

--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER SEQUENCE "public"."hashtags_id_seq" OWNED BY "public"."hashtags"."id";


--
-- Name: hashtagsposts; Type: TABLE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE TABLE "public"."hashtagsposts" (
    "id" integer NOT NULL,
    "postId" integer NOT NULL,
    "hashtagId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE public.hashtagsposts OWNER TO zfatbtsgvywdbs;

--
-- Name: hashtagsposts_id_seq; Type: SEQUENCE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE SEQUENCE "public"."hashtagsposts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hashtagsposts_id_seq OWNER TO zfatbtsgvywdbs;

--
-- Name: hashtagsposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER SEQUENCE "public"."hashtagsposts_id_seq" OWNED BY "public"."hashtagsposts"."id";


--
-- Name: likes; Type: TABLE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE TABLE "public"."likes" (
    "id" integer NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE public.likes OWNER TO zfatbtsgvywdbs;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE SEQUENCE "public"."likes_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO zfatbtsgvywdbs;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER SEQUENCE "public"."likes_id_seq" OWNED BY "public"."likes"."id";


--
-- Name: posts; Type: TABLE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE TABLE "public"."posts" (
    "id" integer NOT NULL,
    "url" "text" NOT NULL,
    "description" character varying(255),
    "userId" integer NOT NULL,
    "urlTitle" "text",
    "urlImage" "text",
    "urlDescription" "text" NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE public.posts OWNER TO zfatbtsgvywdbs;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE SEQUENCE "public"."posts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO zfatbtsgvywdbs;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER SEQUENCE "public"."posts_id_seq" OWNED BY "public"."posts"."id";


--
-- Name: reposts; Type: TABLE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE TABLE "public"."reposts" (
    "id" integer NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE public.reposts OWNER TO zfatbtsgvywdbs;

--
-- Name: reposts_id_seq; Type: SEQUENCE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE SEQUENCE "public"."reposts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reposts_id_seq OWNER TO zfatbtsgvywdbs;

--
-- Name: reposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER SEQUENCE "public"."reposts_id_seq" OWNED BY "public"."reposts"."id";


--
-- Name: users; Type: TABLE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE TABLE "public"."users" (
    "id" integer NOT NULL,
    "name" "text" NOT NULL,
    "email" "text" NOT NULL,
    "password" "text" NOT NULL,
    "imageProfile" "text" NOT NULL,
    "createdAt" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE public.users OWNER TO zfatbtsgvywdbs;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: zfatbtsgvywdbs
--

CREATE SEQUENCE "public"."users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO zfatbtsgvywdbs;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER SEQUENCE "public"."users_id_seq" OWNED BY "public"."users"."id";


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."comments" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."comments_id_seq"'::"regclass");


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."follows" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."follows_id_seq"'::"regclass");


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."hashtags" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."hashtags_id_seq"'::"regclass");


--
-- Name: hashtagsposts id; Type: DEFAULT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."hashtagsposts" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."hashtagsposts_id_seq"'::"regclass");


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."likes" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."likes_id_seq"'::"regclass");


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."posts" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."posts_id_seq"'::"regclass");


--
-- Name: reposts id; Type: DEFAULT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."reposts" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."reposts_id_seq"'::"regclass");


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."users_id_seq"'::"regclass");


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: zfatbtsgvywdbs
--

COPY "public"."comments" ("id", "content", "postId", "userId", "createdAt") FROM stdin;
1	comentário teste 1	63	4	2022-08-16 13:48:32.00568+00
3	comentário teste 2	63	4	2022-08-16 13:49:10.898186+00
4	comentário teste 3	64	4	2022-08-16 13:51:24.599777+00
5	comentário teste 3	64	4	2022-08-16 14:26:58.348094+00
6	mais um teste	66	4	2022-08-16 14:28:04.622224+00
8	comentáriooooo	63	12	2022-08-16 19:27:06.391079+00
9	testerrr	63	4	2022-08-16 20:12:09.271786+00
10	OI	63	4	2022-08-16 20:38:08.152643+00
12	aaaaa	66	4	2022-08-16 20:56:15.746432+00
13	teste	64	3	2022-08-16 21:41:54.842281+00
14	oi!	72	3	2022-08-16 23:10:22.033574+00
15	comentario 	73	4	2022-08-16 23:36:19.895453+00
16	lala	74	4	2022-08-16 23:39:57.673674+00
17	oi	75	11	2022-08-16 23:44:24.806161+00
19	testeeeee	78	11	2022-08-16 23:57:34.385201+00
20	outro teste	78	11	2022-08-16 23:58:17.506632+00
21	oiiii, bão?	72	8	2022-08-17 03:00:00.939384+00
22	bão, bão?	72	3	2022-08-17 03:45:22.497199+00
23	hi	75	10	2022-08-17 13:46:32.0061+00
24	comentei	95	4	2022-08-17 19:06:02.888966+00
25	comentário	94	4	2022-08-17 19:06:15.873482+00
26	true	3	10	2022-08-18 13:19:36.293492+00
27	ihaaaa	106	11	2022-08-18 13:31:00.486254+00
\.


--
-- Data for Name: follows; Type: TABLE DATA; Schema: public; Owner: zfatbtsgvywdbs
--

COPY "public"."follows" ("id", "userId", "followedId", "createdAt") FROM stdin;
13	10	12	2022-08-16 20:07:57.308792+00
39	10	9	2022-08-16 21:12:45.240745+00
40	4	3	2022-08-16 23:18:41.906853+00
41	11	4	2022-08-16 23:28:04.999587+00
44	10	4	2022-08-16 23:42:59.612912+00
46	3	11	2022-08-17 03:44:25.2723+00
49	13	4	2022-08-17 13:14:51.330277+00
50	13	3	2022-08-17 13:15:04.133534+00
51	13	12	2022-08-17 13:19:47.352245+00
53	10	5	2022-08-17 13:48:19.145213+00
54	9	8	2022-08-17 16:58:27.168617+00
55	4	11	2022-08-17 19:07:06.724554+00
57	14	4	2022-08-17 21:50:27.051168+00
58	14	7	2022-08-17 22:29:15.88899+00
59	12	14	2022-08-17 22:52:43.69686+00
60	7	4	2022-08-17 23:27:13.485516+00
61	7	14	2022-08-17 23:27:21.769483+00
63	15	10	2022-08-18 13:23:26.084453+00
64	15	12	2022-08-18 13:42:27.302944+00
\.


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: zfatbtsgvywdbs
--

COPY "public"."hashtags" ("id", "name", "createdAt") FROM stdin;
21	react	2022-08-11 18:20:40.521099
22	noticias	2022-08-11 19:37:03.347591
23	figma	2022-08-11 19:37:35.157463
24	jwt	2022-08-11 19:39:08.500951
25	auth	2022-08-11 19:39:09.356664
26	teste	2022-08-12 17:53:30.548753
27	testando	2022-08-14 13:27:30.62553
28	html	2022-08-14 13:33:23.210457
29	testeeeee	2022-08-14 14:11:30.667603
30	dayjs	2022-08-15 01:20:28.748279
31	gato	2022-08-15 01:45:21.853804
32	maisum	2022-08-16 00:53:52.676927
33	driven	2022-08-16 01:45:59.6786
34	um	2022-08-16 13:06:53.466167
35	dois	2022-08-16 13:07:20.299725
36	tres	2022-08-16 13:08:04.155712
37	quatro	2022-08-16 13:11:37.569057
38	heroku	2022-08-16 19:58:55.37583
39	dog	2022-08-16 22:47:58.941571
\.


--
-- Data for Name: hashtagsposts; Type: TABLE DATA; Schema: public; Owner: zfatbtsgvywdbs
--

COPY "public"."hashtagsposts" ("id", "postId", "hashtagId", "createdAt") FROM stdin;
3	3	23	2022-08-11 19:37:35.292951+00
4	4	24	2022-08-11 19:39:08.637434+00
5	4	25	2022-08-11 19:39:09.498164+00
12	22	31	2022-08-15 01:45:21.855732+00
13	23	31	2022-08-15 01:47:02.640734+00
15	32	32	2022-08-16 00:53:52.678897+00
18	63	34	2022-08-16 13:06:53.468164+00
19	64	35	2022-08-16 13:07:20.301765+00
21	66	37	2022-08-16 13:11:37.571866+00
23	72	39	2022-08-16 22:47:58.94341+00
24	73	26	2022-08-16 23:34:22.421317+00
25	74	35	2022-08-16 23:36:30.648356+00
26	74	26	2022-08-16 23:36:30.64863+00
27	75	26	2022-08-16 23:40:03.48562+00
28	75	36	2022-08-16 23:40:03.485973+00
29	99	26	2022-08-18 13:26:36.693236+00
30	100	26	2022-08-18 13:27:05.869372+00
31	101	26	2022-08-18 13:27:15.157562+00
32	102	26	2022-08-18 13:27:35.993296+00
33	103	26	2022-08-18 13:27:53.795039+00
34	104	26	2022-08-18 13:28:13.505617+00
35	105	26	2022-08-18 13:28:22.036809+00
37	106	26	2022-08-18 13:29:34.636477+00
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: zfatbtsgvywdbs
--

COPY "public"."likes" ("id", "postId", "userId", "createdAt") FROM stdin;
121	63	4	2022-08-16 21:39:45.44657+00
122	72	3	2022-08-16 23:10:26.963336+00
123	72	9	2022-08-16 23:14:40.749899+00
124	23	9	2022-08-16 23:14:56.129896+00
125	3	9	2022-08-16 23:15:03.61825+00
127	78	11	2022-08-17 00:01:07.342378+00
128	32	7	2022-08-17 02:33:14.810489+00
130	70	8	2022-08-17 03:00:25.817952+00
131	62	8	2022-08-17 03:00:28.313414+00
132	92	4	2022-08-17 19:06:46.148209+00
133	94	4	2022-08-17 19:06:48.202423+00
134	78	4	2022-08-17 19:06:55.969794+00
135	84	7	2022-08-17 23:04:58.313608+00
137	73	10	2022-08-18 13:18:14.9959+00
138	70	10	2022-08-18 13:18:17.357008+00
139	3	10	2022-08-18 13:19:28.448235+00
140	106	11	2022-08-18 13:30:28.580543+00
82	3	6	2022-08-12 00:48:37.469687+00
83	4	7	2022-08-12 14:33:15.172611+00
95	3	3	2022-08-12 21:22:04.755107+00
97	3	7	2022-08-13 00:45:18.455055+00
98	3	7	2022-08-13 00:45:19.093171+00
103	19	3	2022-08-14 18:34:26.452056+00
108	22	3	2022-08-15 01:45:47.991021+00
109	23	3	2022-08-15 01:47:04.909913+00
110	23	8	2022-08-15 01:47:16.799712+00
111	4	4	2022-08-15 14:38:57.088092+00
117	30	3	2022-08-16 00:30:35.843893+00
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: zfatbtsgvywdbs
--

COPY "public"."posts" ("id", "url", "description", "userId", "urlTitle", "urlImage", "urlDescription", "createdAt") FROM stdin;
63	https://www.alura.com.br/artigos/npm-vs-yarn	teste #um	12	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-16 13:06:53.462088+00
64	https://www.alura.com.br/artigos/npm-vs-yarn	teste #dois	4	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-16 13:07:20.295229+00
3	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/T6-%7C-Projet%C3%A3o%3A-Linkr---Rede-Social-de-Links?node-id=5390%3A66	lindão esse #figma do Linkr!	5	Figma	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/thumbnail?ver=thumbnails/f1e0583f-083e-4aee-b388-38587444b14b	Created with Figma	2022-08-11 19:37:34.885471+00
4	https://auth0.com/resources/ebooks/jwt-handbook?utm_source=google&utm_medium=cpc&utm_term=-g-web%20json%20token&pm=true&utm_campaign=latam-eng-brazil-generic-authentication	artigo sobre #jwt #auth	5	Auth0 | JWT Handbook	https://images.ctfassets.net/2ntc334xpx65/2yCvSra7EQYIKyWg0cqQyg/c23954455de302a071a37efed03ab4d2/jwt-handbook-tc.png	Ever wondered how JWT came to be and what problems it was designed to tackle?\nAre you curious about the plethora of algorithms available for signing...	2022-08-11 19:39:08.225976+00
66	https://www.alura.com.br/artigos/npm-vs-yarn	teste #quatro	12	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-16 13:11:37.56353+00
68	https://www.alura.com.br/artigos/npm-vs-yarn	\N	4	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-16 13:21:25.34508+00
69	https://www.alura.com.br/artigos/npm-vs-yarn	\N	4	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-16 14:21:45.735386+00
70	https://linkr-front-end-mu.vercel.app/timeline	\N	9	Linkr		Web site created using create-react-app	2022-08-16 19:36:54.142379+00
72	http://pm1.narvii.com/6340/812f0709f8a8476a425a8f8be004a53808d54358_00.jpg	doguinho #dog	8	\N			2022-08-16 22:47:58.93724+00
73	https://www.alura.com.br/artigos/npm-vs-yarn	#teste	4	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-16 23:34:22.417373+00
74	https://www.alura.com.br/artigos/npm-vs-yarn	#teste #dois	4	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-16 23:36:30.643426+00
75	https://www.alura.com.br/artigos/npm-vs-yarn	#teste #tres	4	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-16 23:40:03.481626+00
78	https://www.figma.com/file/IsxlMkRqXlEFSnGwZU1Fxm/T6-%7C-Projet%C3%A3o%3A-Linkr---Rede-Social-de-Links-(Sprint-2)?node-id=7689%3A503	test	13	Figma	https://www.figma.com/file/IsxlMkRqXlEFSnGwZU1Fxm/thumbnail?ver=thumbnails/fe44758d-7df1-4ce3-bcd7-2cf01bf1b1e8	Created with Figma	2022-08-16 23:52:46.726206+00
19	https://www.alura.com.br/artigos/npm-vs-yarn	lalalalalalalalalalalala allallalalalaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	4	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-14 14:22:47.146566+00
22	https://static1.patasdacasa.com.br/articles/2/74/2/@/3055-tartar-era-a-famosa-gatinha-grumpy-que-articles_media_mobile-3.jpg	#gato 	8	\N			2022-08-15 01:45:21.845631+00
23	https://www.petlove.com.br/dicas/wp-content/uploads/2020/02/Dia-do-gato-Petlove-1280x720.jpg	#gato	3	\N			2022-08-15 01:47:02.635799+00
84	https://www.alura.com.br/artigos/npm-vs-yarn	dafsfs	11	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-17 01:47:11.31204+00
86	https://www.alura.com.br/artigos/npm-vs-yarn	cccc	11	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-17 02:16:54.897875+00
87	https://www.alura.com.br/artigos/npm-vs-yarn	eeeee	4	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-17 02:39:29.158266+00
30	https://trello.com/b/Jo8ovnd9/sprint2-linkr	e vamos de sprint2	10	\N			2022-08-16 00:26:39.269227+00
32	https://ge.globo.com/	outro teste #maisum	7	ge.globo - É esporte sempre 	https://s3.glbimg.com/v1/AUTH_378ee63fe83141e69caddd838034e850/static/preview-share-min.png	No ge.globo você encontra a melhor cobertura sobre o Futebol e Outros Esportes, no Brasil e no Mundo: Notícias, Vídeos, Tabelas, Agenda e muito mais.	2022-08-16 00:53:52.672707+00
92	https://bootcampra.notion.site/Materiais-0750a51f86f04626bd2303e9f7c51cd0	\N	3	Notion – The all-in-one workspace for your notes, tasks, wikis, and databases.	https://www.notion.so/images/meta/default.png	A new tool that blends your everyday work apps into one. It's the all-in-one workspace for you and your team	2022-08-17 06:22:11.312478+00
94	https://bootcampra.notion.site/Materiais-0750a51f86f04626bd2303e9f7c51cd0	bfbsddsbgf	11	Notion – The all-in-one workspace for your notes, tasks, wikis, and databases.	https://www.notion.so/images/meta/default.png	A new tool that blends your everyday work apps into one. It's the all-in-one workspace for you and your team	2022-08-17 18:50:48.160364+00
96	https://www.uol.com.br/	post meu	14	UOL - Seu universo online	https://conteudo.imguol.com.br/c/home/interacao/facebook/compartilhe.png	UOL, a maior empresa brasileira de conteúdo, serviços digitais e tecnologia com vários canais de jornalismo e diversas soluções para você ou seu negócio.	2022-08-17 21:43:17.332391+00
95	https://bootcampra.notion.site/Materiais-0750a51f86f04626bd2303e9f7c51cd0	\N	4	Notion – The all-in-one workspace for your notes, tasks, wikis, and databases.	https://www.notion.so/images/meta/default.png	A new tool that blends your everyday work apps into one. It's the all-in-one workspace for you and your team	2022-08-17 18:53:17.179771+00
98	https://trello.com/b/Jo8ovnd9/sprint2-linkr	test	15	\N			2022-08-18 13:25:22.656967+00
99	https://www.alura.com.br/artigos/npm-vs-yarn	#teste da timeline de hashtag - post 4	4	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-18 13:26:36.680086+00
100	https://www.alura.com.br/artigos/npm-vs-yarn	#teste 5	4	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-18 13:27:05.864882+00
101	https://www.alura.com.br/artigos/npm-vs-yarn	#teste 6	4	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-18 13:27:15.154092+00
62	https://linkr-front-end-mu.vercel.app/timeline	\N	9	Linkr		Web site created using create-react-app	2022-08-16 06:42:08.068792+00
102	https://www.alura.com.br/artigos/npm-vs-yarn	#teste 7	12	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-18 13:27:35.98842+00
103	https://www.alura.com.br/artigos/npm-vs-yarn	#teste 8	12	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-18 13:27:53.789214+00
104	https://www.alura.com.br/artigos/npm-vs-yarn	#teste 9	11	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-18 13:28:13.501889+00
105	https://www.alura.com.br/artigos/npm-vs-yarn	#teste 10	11	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-18 13:28:22.032609+00
106	https://www.alura.com.br/artigos/npm-vs-yarn	#teste 11 é agora deu bommm	11	NPM vs Yarn | Alura	https://www.alura.com.br/artigos/assets/npm-vs-yarn/imagem-yarn-vs-npm.png	O que é NPM e Yarn e quais as suas diferenças?	2022-08-18 13:28:45.337741+00
\.


--
-- Data for Name: reposts; Type: TABLE DATA; Schema: public; Owner: zfatbtsgvywdbs
--

COPY "public"."reposts" ("id", "postId", "userId", "createdAt") FROM stdin;
13	96	14	2022-08-17 22:32:28.641254+00
14	95	14	2022-08-17 22:33:04.778865+00
17	95	7	2022-08-17 23:43:07.434057+00
18	32	7	2022-08-18 00:15:11.882035+00
19	96	7	2022-08-18 00:15:58.179251+00
20	64	7	2022-08-18 00:56:24.858908+00
21	86	3	2022-08-18 04:31:00.15639+00
22	86	4	2022-08-18 12:55:13.532697+00
23	94	4	2022-08-18 12:56:54.112952+00
24	68	10	2022-08-18 13:04:34.855044+00
25	63	10	2022-08-18 13:05:00.031923+00
27	101	11	2022-08-18 13:47:27.610701+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: zfatbtsgvywdbs
--

COPY "public"."users" ("id", "name", "email", "password", "imageProfile", "createdAt") FROM stdin;
2	laura	laura@gmail.com	$2b$10$NBMPpXMdPbxbhdTRaJDSBurgUNkfEwKMxQ2xgzfz/gtNh2c0yX2kW	https://classic.exame.com/wp-content/uploads/2020/06/Bob-Esponja.png?w=550	2022-08-10 00:08:52.113212+00
3	Matheus	mtsgamorim@gmail.com	$2b$10$W7P57HGCkqDolrEKwPpV0O4Fhvu3NdA89Pu6.1GXIt9EShtuXZ00.	https://pbs.twimg.com/media/FEfsN-aWYAUt3_H.jpg	2022-08-10 19:14:52.502979+00
4	bob esponja	bob@email.com	$2b$10$Q8SiP0FjTNlECfj7z4Yzdug81mhBRMI8FScNhuWK1FCY6HtIKAYOq	https://almeidajunior-prod1.s3.amazonaws.com/prod/uploads/news/5d81505ac6770.jpg	2022-08-11 00:53:02.337242+00
5	sam	sanduba@gmail.com	$2b$10$ui2NulSPYRaBOK5L.OK/k.w9SyxiU2ZDo3Od3LuCwNAndA4bVCt8i	https://static.zerochan.net/Zed.full.3199112.jpg	2022-08-11 19:36:06.58889+00
6	Glauker	glauker@gmail.com	$2b$10$UWlELhIGHwRIr9KucO6aQup7J.jx081MbKZ2.vzaLjXhaLZjMCCVu	https://abra.art.br/premio/wp-content/uploads/sites/10/2017/05/irmao_jorel.png	2022-08-11 21:52:38.367944+00
7	Bia	beatriz@gmail.com	$2b$10$7hRW0ZYDb3cIe875jt522eyNapXDi49HQUalDwtihXAdPhjh8YUki	https://1.bp.blogspot.com/-Wq2lcq9_a4I/Tc2lLWOkNVI/AAAAAAAABVM/Wao0rm-vWe4/s1600/gatinho-5755.jpg	2022-08-12 14:32:35.31648+00
8	annadafonte	annafontenelle42.af@gmail.com	$2b$10$j37dAnWNI.RWviP9XrpFBOi7WInkDaF1F1QAzpHrin4sNf2LypDHq	https://minhaseriefavorita.com/wp-content/uploads/2018/09/curiosidades-sobe-coraline.jpg	2022-08-15 01:43:48.837698+00
9	UserTest	teste@teste.com	$2b$10$pVcYfN2pmoMvkHn9G2qRm.HOA07qyhgV4XksrYWLLO/KAJvZph95u	https://i0.wp.com/www.portaldodog.com.br/cachorros/wp-content/uploads/2021/03/visa%CC%83o-do-cachorro-2.jpeg?resize=626%2C626&ssl=1	2022-08-15 19:37:09.565506+00
10	samerV	samervalente@gmail.com	$2b$10$UtrZthLbdSpuDuqPGVN0q.TH2Y.6wfQ96aI28vsuLUJGVTlw2Sqh2	https://c.tenor.com/C_0VF9rN9ygAAAAd/zed-galaxy-slayer-zed.gif	2022-08-16 00:23:28.833631+00
11	patrick estrela	patrick@email.com	$2b$10$TTkD.xE4Wncqt/Jr/070/O0MN.Gao9NWA7PvLyhM5pv2rsz0sSKtO	https://www.torredevigilancia.com/wp-content/uploads/2020/08/patrick-star-wallpaper-810x608.jpg	2022-08-16 13:02:59.380905+00
12	sandy	sandy@email.com	$2b$10$4I62eW9qnzMZRI05TnNW1OB3TJrFRU6u/yLD.MB3aUOI45rZ3Pvaa	https://ovicio.com.br/wp-content/uploads/2021/05/20210520-sandy-sponge-555x555.jpg	2022-08-16 13:05:26.647631+00
13	spin	spinner@gmail.com	$2b$10$Jyx0uWmLUUN/TQ4Jt4LFKO3Da6PUZ0JDvAY4M5wKNjpyEh9qfjr82	https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/54d263c2-8c20-41db-b84a-cd22aafd6616/dc69dpz-f053d78f-4a82-4ffd-b936-b2027da2ecb8.gif?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzU0ZDI2M2MyLThjMjAtNDFkYi1iODRhLWNkMjJhYWZkNjYxNlwvZGM2OWRwei1mMDUzZDc4Zi00YTgyLTRmZmQtYjkzNi1iMjAyN2RhMmVjYjguZ2lmIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.YrSEc1MrxCjdEsSN4dCDL8KlQCwMmeOVKrafP5dsPVg	2022-08-16 23:51:46.666741+00
14	lula molusco	lula@email.com	$2b$10$/oCUFtcrF0teAliPlpgo7OJGxDzroHRy8MWcaz5vYKPBDmoQnhCdG	https://diariodonordeste.verdesmares.com.br/image/contentid/'policy':1.'2176445':1590247642/Lula-Molusco.jpg?f=default&$p$f=0528860	2022-08-17 21:39:33.384959+00
15	teemo	teemo@gmail.com	$2b$10$rnK40By47VoZTVA/.4lBAOk8fCYhjACihhPPl48apqN0Bxva6gzY2	https://scontent.fbel12-1.fna.fbcdn.net/v/t1.18169-9/17991800_820323181464421_6575343571949498534_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=k5dyDYND-TUAX_D0xN7&_nc_ht=scontent.fbel12-1.fna&oh=00_AT9x7XZFRYRjKYobM_BYbdabeDSu3KhvdlRud1a9LE1Dkw&oe=63222C55	2022-08-18 13:21:36.63775+00
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zfatbtsgvywdbs
--

SELECT pg_catalog.setval('"public"."comments_id_seq"', 28, true);


--
-- Name: follows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zfatbtsgvywdbs
--

SELECT pg_catalog.setval('"public"."follows_id_seq"', 64, true);


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zfatbtsgvywdbs
--

SELECT pg_catalog.setval('"public"."hashtags_id_seq"', 39, true);


--
-- Name: hashtagsposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zfatbtsgvywdbs
--

SELECT pg_catalog.setval('"public"."hashtagsposts_id_seq"', 39, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zfatbtsgvywdbs
--

SELECT pg_catalog.setval('"public"."likes_id_seq"', 140, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zfatbtsgvywdbs
--

SELECT pg_catalog.setval('"public"."posts_id_seq"', 108, true);


--
-- Name: reposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zfatbtsgvywdbs
--

SELECT pg_catalog.setval('"public"."reposts_id_seq"', 27, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zfatbtsgvywdbs
--

SELECT pg_catalog.setval('"public"."users_id_seq"', 15, true);


--
-- Name: hashtags hashtags_name_key; Type: CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."hashtags"
    ADD CONSTRAINT "hashtags_name_key" UNIQUE ("name");


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."hashtags"
    ADD CONSTRAINT "hashtags_pkey" PRIMARY KEY ("id");


--
-- Name: hashtagsposts hashtagsposts_pkey; Type: CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."hashtagsposts"
    ADD CONSTRAINT "hashtagsposts_pkey" PRIMARY KEY ("id");


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."likes"
    ADD CONSTRAINT "likes_pkey" PRIMARY KEY ("id");


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."posts"
    ADD CONSTRAINT "posts_pkey" PRIMARY KEY ("id");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_email_key" UNIQUE ("email");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


--
-- Name: comments comments_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."comments"
    ADD CONSTRAINT "comments_postId_fkey" FOREIGN KEY ("postId") REFERENCES "public"."posts"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."comments"
    ADD CONSTRAINT "comments_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: hashtagsposts hashtagsposts_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."hashtagsposts"
    ADD CONSTRAINT "hashtagsposts_postId_fkey" FOREIGN KEY ("postId") REFERENCES "public"."posts"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: likes likes_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."likes"
    ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES "public"."posts"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: likes likes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."likes"
    ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id");


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."posts"
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id");


--
-- Name: reposts reposts_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."reposts"
    ADD CONSTRAINT "reposts_postId_fkey" FOREIGN KEY ("postId") REFERENCES "public"."posts"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: reposts reposts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: zfatbtsgvywdbs
--

ALTER TABLE ONLY "public"."reposts"
    ADD CONSTRAINT "reposts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "public"."users"("id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

