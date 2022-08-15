--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 14.4 (Ubuntu 14.4-1.pgdg22.04+1)

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
-- Name: hashtags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hashtags (
    id integer NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.hashtags OWNER TO postgres;

--
-- Name: hashtags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hashtags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hashtags_id_seq OWNER TO postgres;

--
-- Name: hashtags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hashtags_id_seq OWNED BY public.hashtags.id;


--
-- Name: hashtagsposts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hashtagsposts (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "hashtagId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.hashtagsposts OWNER TO postgres;

--
-- Name: hashtagsposts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hashtagsposts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hashtagsposts_id_seq OWNER TO postgres;

--
-- Name: hashtagsposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hashtagsposts_id_seq OWNED BY public.hashtagsposts.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "postId" integer NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.likes OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.likes_id_seq OWNER TO postgres;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    url text NOT NULL,
    description character varying(255),
    "userId" integer NOT NULL,
    "urlTitle" text,
    "urlImage" text,
    "urlDescription" text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO postgres;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "imageProfile" text NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: hashtags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags ALTER COLUMN id SET DEFAULT nextval('public.hashtags_id_seq'::regclass);


--
-- Name: hashtagsposts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtagsposts ALTER COLUMN id SET DEFAULT nextval('public.hashtagsposts_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: hashtags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hashtags (id, name, "createdAt") FROM stdin;
116	trello	2022-08-11 11:41:19.256852-03
117	figma	2022-08-11 11:41:51.288719-03
118	github	2022-08-11 11:45:36.742115-03
119	tiozao	2022-08-11 11:49:18.602228-03
120	css	2022-08-11 11:49:18.650159-03
121	dale	2022-08-11 11:51:47.973684-03
122	vamo	2022-08-11 11:51:48.052236-03
123	ou	2022-08-11 11:51:48.053893-03
124	test	2022-08-11 11:54:14.787881-03
125	bike	2022-08-11 11:54:14.828343-03
126	bikezinha	2022-08-11 11:54:32.290898-03
127	motor	2022-08-11 11:54:32.327185-03
128	aipapai	2022-08-11 11:55:20.422142-03
129	claro	2022-08-11 11:55:20.480032-03
130	vrau	2022-08-11 12:27:22.094097-03
131	amizade	2022-08-11 15:46:53.042287-03
132	nirvana	2022-08-11 16:19:14.532977-03
133	bikeee	2022-08-11 16:26:35.310419-03
134	base	2022-08-11 19:09:52.906181-03
135	oi	2022-08-11 19:17:30.607614-03
136	foi	2022-08-11 20:15:09.935137-03
137	el	2022-08-11 20:21:35.250118-03
138	opa	2022-08-11 20:22:21.532763-03
139	nirvana?	2022-08-11 20:23:17.80586-03
140	osh	2022-08-11 20:24:19.712993-03
141	daleee	2022-08-11 20:40:43.66142-03
142	csgo	2022-08-11 20:49:36.322653-03
143	mingau	2022-08-11 20:51:15.110788-03
144	repo	2022-08-11 20:54:20.658436-03
145	bb	2022-08-11 20:56:34.944179-03
\.


--
-- Data for Name: hashtagsposts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hashtagsposts (id, "postId", "hashtagId", "createdAt") FROM stdin;
68	19	117	2022-08-11 20:50:25.162195-03
70	22	143	2022-08-11 20:51:15.118281-03
71	21	143	2022-08-11 20:51:32.103462-03
73	3	135	2022-08-11 20:52:00.451148-03
74	11	124	2022-08-11 20:52:47.449509-03
75	6	124	2022-08-11 20:53:01.949258-03
76	23	144	2022-08-11 20:54:20.666132-03
34	14	124	2022-08-11 20:10:54.618121-03
54	7	126	2022-08-11 20:29:51.121331-03
56	8	135	2022-08-11 20:43:02.533861-03
60	4	122	2022-08-11 20:45:55.86935-03
61	4	118	2022-08-11 20:45:55.869703-03
62	18	118	2022-08-11 20:46:22.143443-03
64	20	126	2022-08-11 20:47:47.87423-03
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likes (id, "postId", "userId", "createdAt") FROM stdin;
5	6	24	2022-08-11 18:28:26.376514-03
9	12	24	2022-08-11 18:29:26.905216-03
11	13	24	2022-08-11 18:45:32.946971-03
13	5	24	2022-08-11 19:00:28.465759-03
20	15	24	2022-08-11 19:58:16.109381-03
21	4	24	2022-08-11 19:58:54.960005-03
22	18	24	2022-08-11 20:21:41.038788-03
23	9	24	2022-08-11 20:29:54.701327-03
25	20	24	2022-08-11 20:43:25.310202-03
30	21	24	2022-08-11 20:50:11.712327-03
31	14	24	2022-08-11 20:53:05.73023-03
35	25	24	2022-08-12 17:22:27.049715-03
36	24	24	2022-08-12 17:26:44.999055-03
37	7	24	2022-08-14 11:04:20.875439-03
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (id, url, description, "userId", "urlTitle", "urlImage", "urlDescription", "createdAt") FROM stdin;
2	https://trello.com/c/lWJyzZoJ/7-como-usu%C3%A1rio-logado-quero-ver-a-caixa-de-lista-de-hashtags-em-trending	oi	24	\N			2022-08-11 11:41:39.130231-03
12	https://www.youtube.com/watch?v=E9MhX2TG06M	osh	24	[Full Album] N̲irva̲na - N̲eve̲rmi̲nd	https://i.ytimg.com/vi/E9MhX2TG06M/maxresdefault.jpg	[Full Album] N̲irva̲na - N̲eve̲rmi̲ndTracklist[00:00] 01. [05:02] 02. [09:18] 03. [12:57] 04. [16:02] 05. [20:19] 06. [23:13] 07. [25:37] 08. [29:21] 09. [31...	2022-08-11 15:46:52.939189-03
15	https://trello.com/b/QsAlQWmy/projet%C3%A3o-linkr	osh	24	\N			2022-08-11 19:01:11.156998-03
8	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/T6-%7C-Projet%C3%A3o%3A-Linkr---Rede-Social-de-Links?node-id=0%3A1	#oi galera	24	Figma	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/thumbnail?ver=thumbnails/f1e0583f-083e-4aee-b388-38587444b14b	Created with Figma	2022-08-11 11:54:14.770502-03
19	https://trello.com/b/QsAlQWmy/projet%C3%A3o-linkr	lesgo #figma	24	\N			2022-08-11 20:21:53.247498-03
5	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/T6-%7C-Projet%C3%A3o%3A-Linkr---Rede-Social-de-Links?node-id=0%3A1	opa	24	Figma	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/thumbnail?ver=thumbnails/f1e0583f-083e-4aee-b388-38587444b14b	Created with Figma	2022-08-11 11:47:49.753058-03
13	https://www.youtube.com/watch?v=Fc4eEjnoITs	lesgo	24	Nirvana - Nevermind / lyrics videos /	https://i.ytimg.com/vi/Fc4eEjnoITs/hqdefault.jpg	Nirvana Nevermind című albumának dalszöveg videói.	2022-08-11 16:19:14.518459-03
16	https://trello.com/b/QsAlQWmy/projet%C3%A3o-linkr	dale	24	\N			2022-08-11 19:04:06.006394-03
17	https://trello.com/b/QsAlQWmy/projet%C3%A3o-linkr	test2	24	\N			2022-08-11 19:04:12.849699-03
11	https://github.com/samervalente/projeto_07_instagramreact/blob/main/public/css/style.css	vamo de #test?	24	projeto_07_instagramreact/style.css at main · samervalente/projeto_07_instagramreact	https://opengraph.githubassets.com/d2d6498cc09f77bec1e4a52138bfba94657e2a699329ce8691f06c94b2e5b7cc/samervalente/projeto_07_instagramreact	Contribute to samervalente/projeto_07_instagramreact development by creating an account on GitHub.	2022-08-11 12:27:22.073609-03
14	https://trello.com/b/QsAlQWmy/projet%C3%A3o-linkr	#test 	24	\N			2022-08-11 19:00:49.87678-03
10	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/T6-%7C-Projet%C3%A3o%3A-Linkr---Rede-Social-de-Links?node-id=0%3A1	a	24	Figma	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/thumbnail?ver=thumbnails/f1e0583f-083e-4aee-b388-38587444b14b	Created with Figma	2022-08-11 11:55:20.403785-03
22	https://github.com/samervalente?tab=repositories	#mingau?	24	samervalente - Repositories	https://avatars.githubusercontent.com/u/90073210?v=4?s=400	Full Stack Web Development Student. samervalente has 31 repositories available. Follow their code on GitHub.	2022-08-11 20:49:36.306288-03
6	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/T6-%7C-Projet%C3%A3o%3A-Linkr---Rede-Social-de-Links?node-id=0%3A1	vamo dnv de #test?	24	Figma	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/thumbnail?ver=thumbnails/f1e0583f-083e-4aee-b388-38587444b14b	Created with Figma	2022-08-11 11:49:18.586194-03
21	https://trello.com/b/QsAlQWmy/projet%C3%A3o-linkr	#mingau dnv?	24	\N			2022-08-11 20:23:00.697926-03
24	https://www.youtube.com/watch?v=wrhg6r2a3U8	dale	24	Best of Lana Del Rey : melancholy	https://i.ytimg.com/vi/wrhg6r2a3U8/maxresdefault.jpg	Ngl i regret not putting carmen in here😭	2022-08-11 20:54:40.991568-03
4	https://github.com/samervalente/projeto9_cineflex/blob/main/src/components/Movie/Movie.js	#vamo de #github	24	projeto9_cineflex/Movie.js at main · samervalente/projeto9_cineflex	https://opengraph.githubassets.com/8bc2c5ff8ee0f3980535d064acbac357f99ea6ebcbbdcde34f36cc1b0948bddd/samervalente/projeto9_cineflex	 A system for buying tickets at a cinema. Contribute to samervalente/projeto9_cineflex development by creating an account on GitHub.	2022-08-11 11:45:36.72835-03
1	https://trello.com/c/lWJyzZoJ/7-como-usu%C3%A1rio-logado-quero-ver-a-caixa-de-lista-de-hashtags-em-trending	vamos nao	24	\N			2022-08-11 11:41:19.242745-03
7	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/T6-%7C-Projet%C3%A3o%3A-Linkr---Rede-Social-de-Links?node-id=0%3A1	vamos de #Bikezinha	24	Figma	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/thumbnail?ver=thumbnails/f1e0583f-083e-4aee-b388-38587444b14b	Created with Figma	2022-08-11 11:51:47.924134-03
18	https://trello.com/b/QsAlQWmy/projet%C3%A3o-linkr	vamo de #github novamente?	24	\N			2022-08-11 20:21:23.951201-03
9	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/T6-%7C-Projet%C3%A3o%3A-Linkr---Rede-Social-de-Links?node-id=0%3A1	oi	24	Figma	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/thumbnail?ver=thumbnails/f1e0583f-083e-4aee-b388-38587444b14b	Created with Figma	2022-08-11 11:54:32.263765-03
3	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/T6-%7C-Projet%C3%A3o%3A-Linkr---Rede-Social-de-Links?node-id=0%3A1	#oi dnv 	24	Figma	https://www.figma.com/file/W3lZA9PUddEefwzdgiFZL4/thumbnail?ver=thumbnails/f1e0583f-083e-4aee-b388-38587444b14b	Created with Figma	2022-08-11 11:41:51.27414-03
23	https://github.com/samervalente?tab=repositories	foi de #repo\n	24	samervalente - Repositories	https://avatars.githubusercontent.com/u/90073210?v=4?s=400	Full Stack Web Development Student. samervalente has 31 repositories available. Follow their code on GitHub.	2022-08-11 20:54:20.639316-03
20	https://www.youtube.com/watch?v=ntZONYzAMCo	eai dnv #bikezinha?	24	Brooklyn Baby	https://i.ytimg.com/vi/ntZONYzAMCo/maxresdefault.jpg	Provided to YouTube by Universal Music GroupBrooklyn Baby · Lana Del ReyUltraviolence℗ 2014 Lana Del Rey, under exclusive licence to Polydor Ltd. (UK). Under...	2022-08-11 20:22:05.303083-03
25	https://www.youtube.com/watch?v=wrhg6r2a3U8	asd	24	Best of Lana Del Rey : melancholy	https://i.ytimg.com/vi/wrhg6r2a3U8/maxresdefault.jpg	Ngl i regret not putting carmen in here😭	2022-08-11 20:55:00.994648-03
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, "imageProfile", "createdAt") FROM stdin;
1	Samer	samervalente@gmail.com.br	$2b$10$eHn2waBQ5Z3Mhsc3WozsUOoU0e9K9Soz3Km2XgQUOu8u59qFYbqiK	https://static.zerochan.net/Zed.full.3199112.jpg	2022-08-09 10:05:26.797548-03
6	Samer	samervalente2@gmail.com.br	$2b$10$.8.jYpYGDw2irSwHs6Mlq.5k.CL36ptNpMfFhgF.XqeaXah/xuFu.	https://static.zerochan.net/Zed.full.3199112.jpg	2022-08-09 12:25:13.025141-03
7	sam	samervalente@gmail.com	$2b$10$o9UumO9P6uofXwucRdfN9uQeo9Ln34BVMENofq3r8DI5ATviCJHN6	https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zed_30.jpg	2022-08-09 12:25:22.37716-03
8	sam	samervalente2@gmail.com	$2b$10$xeSXC/LJRNauT20Wbo5NFeCPqaytN8hehcaF9iWHz516rd1DL6PR2	https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zed_30.jpg	2022-08-09 12:25:53.546856-03
9	sam	samervalente3@gmail.com	$2b$10$E4Zc9LTNiqVDFmaQhia61Opztw31s7mDffZHVomQK9UrbDWjM1A4a	https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zed_30.jpg	2022-08-09 12:42:47.032087-03
10	sam	samervalente4@gmail.com	$2b$10$LRwbeNpE9aC9SXCXvOR2TuJV4MVgkU8NOFMu2rNoNmhH1fsViGppm	https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zed_30.jpg	2022-08-09 12:43:43.924012-03
11	sam	samervalente5@gmail.com	$2b$10$tPPDK6WqjRaSp8NAIbODiOHqrKR2brwcJR0FBvoQXDpzUVu3TzcSm	https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zed_30.jpg	2022-08-09 12:44:17.53789-03
12	sam	samervalente6@gmail.com	$2b$10$LplSfzeIpI2aOPdF43INSubNlcdM5TfrWXdiUYVUBE0BUsOsxAQae	https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zed_30.jpg	2022-08-09 12:44:23.834577-03
13	sam	samervalente7@gmail.com	$2b$10$VzenErnmjQifzenEMXkvxuGHMbZXR4iNRJa9G5XqHpW.AgZ3y2vl2	https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zed_30.jpg	2022-08-09 12:44:52.927624-03
14	sam	samervalente8@gmail.com	$2b$10$6fZn8ZVDiiBBlPvCiAXMw.dPUGFqqRYZQmohbEdb8SedPMiWAbSsK	https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zed_30.jpg	2022-08-09 12:45:22.71816-03
15	sam	samervalente9@gmail.com	$2b$10$8oQQljLIshnTU446VmYkLew5xbkbMMsGwq/VMl6wLE03Cr1fkdxni	https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zed_30.jpg	2022-08-09 12:46:02.922622-03
16	sam	samervalente10@gmail.com	$2b$10$IW8QGieaW32KWbaUBM.1puZh/yYhI1pHvK72LV4ruHMDA6uJI0Qv6	https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zed_30.jpg	2022-08-09 12:46:16.5312-03
17	sam	samervalente11@gmail.com	$2b$10$yM7VGSW/BnQkR4pcvUhUV.pt5gkAABRn3zbpDFV9lcoc1r7SGF3r2	https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Zed_30.jpg	2022-08-09 12:46:59.802737-03
18	sam	samervalente23@gmail.com	$2b$10$f839RUtQQitl/5TLvBUxpu9A.KYw126r639y/pg5Sl4o20OzY9HmO	https://static.zerochan.net/Zed.full.3199112.jpg	2022-08-09 12:49:14.37779-03
19	sam	samervalente234@gmail.com	$2b$10$Z0cKoCMOAL3ZxwLYNbWdt.phehj/X/dKu.obZRsh1wLbqNAHJmwYu	https://static.zerochan.net/Zed.full.3199112.jpg	2022-08-09 13:08:43.932197-03
20	sam	samervalente23234@gmail.com	$2b$10$K6dG6Ns1fTs6U3jNVegDTu1clXwYIZz5BbYIP8mDvIU07/neZ5Am6	https://static.zerochan.net/Zed.full.3199112.jpg	2022-08-09 13:09:00.939034-03
21	sam	samervalente2323234@gmail.com	$2b$10$oD7Rh0SckFoYJxuip6GOce96Ycm/fiqaQwW74qSgAhhsXiJDW2mCa	https://static.zerochan.net/Zed.full.3199112.jpg	2022-08-09 13:09:04.658547-03
22	sam	samervalente232233234@gmail.com	$2b$10$1oFCmR6tEntRXLMxCm5j0uF04iHDORjpn4rtycht6Kh7HjXkxgR0O	https://static.zerochan.net/Zed.full.3199112.jpg	2022-08-09 13:09:16.059979-03
23	Samer	samervalente232@gmail.com	$2b$10$9T9z8POSyl7F4efNXeucX.opj8yXqZJRx7o254nFR7985sW4BW8yq	https://static.zerochan.net/Zed.full.3199112.jpg	2022-08-10 09:16:46.301832-03
24	sam	sanduba123@gmail.com	$2b$10$SRKFww4qK2Mhx3kuNeO7OuMReFJUXMU14KG8fsHmtxeocLBgek3YO	https://static.zerochan.net/Zed.full.3199112.jpg	2022-08-10 09:17:31.093362-03
25	sam	sanduba@gmail.com	$2b$10$SHKKCGsqxSCQugNOayxUP.XkDreXZaEW70Hhx9PY5vA236u9MYvfy	https://static.zerochan.net/Zed.full.3199112.jpg	2022-08-10 09:18:42.651146-03
26	jhin	jhin@gmail.com	$2b$10$FClP830lmrxkrwgXfduU.uSo5/mTxsw4cZT7i/N7Tzd.GobspfaSu	https://i.pinimg.com/originals/c3/22/f6/c322f6bc7198a7fc0b016880b168fdeb.jpg	2022-08-12 14:51:19.120204-03
27	janna da silva	janna@gmail.com	$2b$10$xu4hbzAl72qr3MYMEXGzV.D1XB5JDm4jx8W9/kM3kteSWhcfEDhP.	https://i.pinimg.com/originals/c2/be/db/c2bedb3f8bde0e7beafb52df04413692.jpg	2022-08-12 14:52:03.592846-03
28	ahri	ahri@gmail.com	$2b$10$BxlDiZOBS.BwrdvI7q3a8egJ1fufOBgZ9189MP5Hf/XpJ6O6Xc2OS	https://i.pinimg.com/originals/a2/5a/89/a25a89c12e0fd087eae85fb348ca553c.jpg	2022-08-12 14:52:36.81799-03
29	aatrox	aatrox@gmail.com	$2b$10$ymG.W3TcfcbVrsXIjtL2NedIJjm1IN1DJeV1EM.jimViXhH4e1f6O	https://assets.mycast.io/actor_images/actor-aatrox-328492_large.jpg?1640064580	2022-08-12 14:53:59.225864-03
\.


--
-- Name: hashtags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hashtags_id_seq', 145, true);


--
-- Name: hashtagsposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hashtagsposts_id_seq', 78, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likes_id_seq', 37, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.posts_id_seq', 25, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 29, true);


--
-- Name: hashtags hashtags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtags
    ADD CONSTRAINT hashtags_pkey PRIMARY KEY (id);


--
-- Name: hashtagsposts hashtagsposts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtagsposts
    ADD CONSTRAINT hashtagsposts_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: hashtagsposts hashtagsposts_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashtagsposts
    ADD CONSTRAINT "hashtagsposts_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_postId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id);


--
-- Name: likes likes_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: posts posts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

