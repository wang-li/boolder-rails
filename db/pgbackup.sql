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

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO nicolas;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_attachments_id_seq OWNER TO nicolas;

--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO nicolas;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_blobs_id_seq OWNER TO nicolas;

--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO nicolas;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.areas (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.areas OWNER TO nicolas;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO nicolas;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- Name: boulders; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.boulders (
    id bigint NOT NULL,
    polygon public.geography(Polygon,4326),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    area_id bigint
);


ALTER TABLE public.boulders OWNER TO nicolas;

--
-- Name: boulders_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.boulders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boulders_id_seq OWNER TO nicolas;

--
-- Name: boulders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.boulders_id_seq OWNED BY public.boulders.id;


--
-- Name: circuits; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.circuits (
    id bigint NOT NULL,
    color character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    area_id bigint,
    "order" integer
);


ALTER TABLE public.circuits OWNER TO nicolas;

--
-- Name: circuits_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.circuits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_id_seq OWNER TO nicolas;

--
-- Name: circuits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.circuits_id_seq OWNED BY public.circuits.id;


--
-- Name: pois; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.pois (
    id bigint NOT NULL,
    title character varying,
    subtitle character varying,
    description character varying,
    location public.geography(Point,4326),
    route public.geography(LineString,4326),
    area_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.pois OWNER TO nicolas;

--
-- Name: pois_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.pois_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pois_id_seq OWNER TO nicolas;

--
-- Name: pois_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.pois_id_seq OWNED BY public.pois.id;


--
-- Name: problems; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.problems (
    id bigint NOT NULL,
    name character varying,
    grade character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    location public.geography(Point,4326),
    circuit_id bigint,
    circuit_number character varying,
    steepness character varying NOT NULL,
    height integer,
    area_id bigint,
    tags character varying[] DEFAULT '{}'::character varying[] NOT NULL
);


ALTER TABLE public.problems OWNER TO nicolas;

--
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.problems_id_seq OWNER TO nicolas;

--
-- Name: problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.problems_id_seq OWNED BY public.problems.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO nicolas;

--
-- Name: topos; Type: TABLE; Schema: public; Owner: nicolas
--

CREATE TABLE public.topos (
    id bigint NOT NULL,
    line json,
    problem_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    published boolean DEFAULT true NOT NULL,
    metadata json
);


ALTER TABLE public.topos OWNER TO nicolas;

--
-- Name: topos_id_seq; Type: SEQUENCE; Schema: public; Owner: nicolas
--

CREATE SEQUENCE public.topos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topos_id_seq OWNER TO nicolas;

--
-- Name: topos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nicolas
--

ALTER SEQUENCE public.topos_id_seq OWNED BY public.topos.id;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: boulders id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.boulders ALTER COLUMN id SET DEFAULT nextval('public.boulders_id_seq'::regclass);


--
-- Name: circuits id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.circuits ALTER COLUMN id SET DEFAULT nextval('public.circuits_id_seq'::regclass);


--
-- Name: pois id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.pois ALTER COLUMN id SET DEFAULT nextval('public.pois_id_seq'::regclass);


--
-- Name: problems id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.problems ALTER COLUMN id SET DEFAULT nextval('public.problems_id_seq'::regclass);


--
-- Name: topos id; Type: DEFAULT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.topos ALTER COLUMN id SET DEFAULT nextval('public.topos_id_seq'::regclass);


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
2	photo	Topo	2	2	2020-04-18 20:36:55.290724
3	photo	Topo	3	3	2020-04-18 20:36:55.343504
4	photo	Topo	4	4	2020-04-18 20:36:55.390197
5	photo	Topo	5	5	2020-04-18 20:36:55.43851
6	photo	Topo	6	6	2020-04-18 20:36:55.514855
7	photo	Topo	7	7	2020-04-18 20:36:55.552475
8	photo	Topo	8	8	2020-04-18 20:36:55.583846
9	photo	Topo	9	9	2020-04-18 20:36:55.618317
10	photo	Topo	10	10	2020-04-18 20:36:55.645499
11	photo	Topo	11	11	2020-04-18 20:36:55.687699
12	photo	Topo	12	12	2020-04-18 20:36:55.722564
13	photo	Topo	13	13	2020-04-18 20:36:55.754756
14	photo	Topo	14	14	2020-04-18 20:36:55.789575
15	photo	Topo	15	15	2020-04-18 20:36:55.824586
16	photo	Topo	16	16	2020-04-18 20:36:55.851337
17	photo	Topo	17	17	2020-04-18 20:36:55.886811
18	photo	Topo	18	18	2020-04-18 20:36:55.921813
19	photo	Topo	19	19	2020-04-18 20:36:55.949921
20	photo	Topo	20	20	2020-04-18 20:36:55.986416
21	photo	Topo	21	21	2020-04-18 20:36:56.025959
22	photo	Topo	22	22	2020-04-18 20:36:56.058563
23	photo	Topo	23	23	2020-04-18 20:36:56.095706
24	photo	Topo	24	24	2020-04-18 20:36:56.130667
25	photo	Topo	25	25	2020-04-18 20:36:56.164839
26	photo	Topo	26	26	2020-04-18 20:36:56.20408
27	photo	Topo	27	27	2020-04-18 20:36:56.235177
28	photo	Topo	28	28	2020-04-18 20:36:56.27208
29	photo	Topo	29	29	2020-04-18 20:36:56.315547
30	photo	Topo	30	30	2020-04-18 20:36:56.347723
31	photo	Topo	31	31	2020-04-18 20:36:56.391437
32	photo	Topo	32	32	2020-04-18 20:36:56.427297
33	photo	Topo	33	33	2020-04-18 20:36:56.462271
34	photo	Topo	34	34	2020-04-18 20:36:56.498208
35	photo	Topo	35	35	2020-04-18 20:36:56.535179
36	photo	Topo	36	36	2020-04-18 20:36:56.575332
37	photo	Topo	37	37	2020-04-18 20:36:56.621844
38	photo	Topo	38	38	2020-04-18 20:36:56.65907
39	photo	Topo	39	39	2020-04-18 20:36:56.709278
40	photo	Topo	40	40	2020-04-18 20:36:56.74557
41	photo	Topo	41	41	2020-04-18 20:36:56.791413
42	photo	Topo	42	42	2020-04-18 20:36:56.829495
43	photo	Topo	43	43	2020-04-18 20:36:56.866024
44	photo	Topo	44	44	2020-04-18 20:36:56.914299
45	photo	Topo	45	45	2020-04-18 20:36:56.947318
46	photo	Topo	46	46	2020-04-18 20:36:56.98621
47	photo	Topo	47	47	2020-04-18 20:36:57.026099
48	photo	Topo	48	48	2020-04-18 20:36:57.070279
49	photo	Topo	49	49	2020-04-18 20:36:57.116182
50	photo	Topo	50	50	2020-04-18 20:36:57.148816
51	photo	Topo	51	51	2020-04-18 20:36:57.185801
52	photo	Topo	52	52	2020-04-18 20:36:57.227494
53	photo	Topo	53	53	2020-04-18 20:36:57.262768
54	photo	Topo	54	54	2020-04-18 20:36:57.30508
55	photo	Topo	55	55	2020-04-18 20:36:57.340289
56	photo	Topo	56	56	2020-04-18 20:36:57.384277
57	photo	Topo	57	57	2020-04-18 20:36:57.426028
58	photo	Topo	58	58	2020-04-18 20:36:57.460397
59	photo	Topo	59	59	2020-04-18 20:36:57.502845
60	photo	Topo	60	60	2020-04-18 20:36:57.53997
61	photo	Topo	61	61	2020-04-18 20:36:57.582671
62	photo	Topo	62	62	2020-04-18 20:36:57.6295
63	photo	Topo	63	63	2020-04-18 20:36:57.672459
64	photo	Topo	64	64	2020-04-18 20:36:57.721642
65	photo	Topo	65	65	2020-04-18 20:36:57.758309
66	photo	Topo	66	66	2020-04-18 20:36:57.804316
67	photo	Topo	67	67	2020-04-18 20:36:57.852759
68	photo	Topo	68	68	2020-04-18 20:36:57.901094
69	photo	Topo	69	69	2020-04-18 20:36:57.934643
70	photo	Topo	70	70	2020-04-18 20:36:57.973821
71	photo	Topo	71	71	2020-04-18 20:36:58.015627
72	photo	Topo	72	72	2020-04-18 20:36:58.052925
73	photo	Topo	73	73	2020-04-18 20:36:58.096081
74	photo	Topo	74	74	2020-04-18 20:36:58.13459
75	photo	Topo	75	75	2020-04-18 20:36:58.172538
76	photo	Topo	76	76	2020-04-18 20:36:58.216045
77	photo	Topo	77	77	2020-04-18 20:36:58.252088
78	photo	Topo	78	78	2020-04-18 20:36:58.292627
79	photo	Topo	79	79	2020-04-18 20:36:58.328899
80	photo	Topo	80	80	2020-04-18 20:36:58.366016
81	photo	Topo	81	81	2020-04-18 20:36:58.418572
82	photo	Topo	82	82	2020-04-18 20:36:58.45358
83	photo	Topo	83	83	2020-04-18 20:36:58.4934
84	photo	Topo	84	84	2020-04-18 20:36:58.53101
85	photo	Topo	85	85	2020-04-18 20:36:58.568921
86	photo	Topo	86	86	2020-04-18 20:36:58.616252
87	photo	Topo	87	87	2020-04-18 20:36:58.659135
88	photo	Topo	88	88	2020-04-18 20:36:58.698315
89	photo	Topo	89	89	2020-04-18 20:36:58.738591
90	photo	Topo	90	90	2020-04-18 20:36:58.78209
91	photo	Topo	91	91	2020-04-18 20:36:58.82679
92	photo	Topo	92	92	2020-04-18 20:36:58.86822
93	photo	Topo	93	93	2020-04-18 20:36:58.916833
94	photo	Topo	94	94	2020-04-18 20:36:58.952489
95	photo	Topo	95	95	2020-04-18 20:36:58.994077
96	photo	Topo	96	96	2020-04-18 20:36:59.03393
97	photo	Topo	97	97	2020-04-18 20:36:59.073017
98	photo	Topo	98	98	2020-04-18 20:36:59.122078
99	photo	Topo	99	99	2020-04-18 20:36:59.162696
100	photo	Topo	100	100	2020-04-18 20:36:59.20772
101	photo	Topo	101	101	2020-04-18 20:36:59.241551
102	photo	Topo	102	102	2020-04-18 20:36:59.280197
103	photo	Topo	103	103	2020-04-18 20:36:59.321582
104	photo	Topo	104	104	2020-04-18 20:36:59.36241
105	photo	Topo	105	105	2020-04-18 20:36:59.405588
106	photo	Topo	106	106	2020-04-18 20:36:59.448483
107	photo	Topo	107	107	2020-04-18 20:36:59.488409
108	photo	Topo	108	108	2020-04-18 20:36:59.559439
109	photo	Topo	109	109	2020-04-18 20:36:59.607744
110	photo	Topo	110	110	2020-04-18 20:36:59.650097
111	photo	Topo	111	111	2020-04-18 20:36:59.687634
112	photo	Topo	112	112	2020-04-18 20:36:59.727175
113	photo	Topo	113	113	2020-04-18 20:36:59.76451
114	photo	Topo	114	114	2020-04-18 20:36:59.81176
115	photo	Topo	115	115	2020-04-18 20:36:59.8423
116	photo	Topo	116	116	2020-04-18 20:36:59.880497
117	photo	Topo	117	117	2020-04-18 20:36:59.924535
118	photo	Topo	118	118	2020-04-18 20:36:59.966241
119	photo	Topo	119	119	2020-04-18 20:37:00.004964
120	photo	Topo	120	120	2020-04-18 20:37:00.040752
121	photo	Topo	121	121	2020-04-18 20:37:00.079113
122	photo	Topo	122	122	2020-04-18 20:37:00.122991
123	photo	Topo	123	123	2020-04-18 20:37:00.160905
124	photo	Topo	124	124	2020-04-18 20:37:00.193638
125	photo	Topo	125	125	2020-04-18 20:37:00.230417
126	photo	Topo	126	126	2020-04-18 20:37:00.265506
127	photo	Topo	127	127	2020-04-18 20:37:00.305596
128	photo	Topo	128	128	2020-04-18 20:37:00.340728
129	photo	Topo	129	129	2020-04-18 20:37:00.376677
130	photo	Topo	130	130	2020-04-18 20:37:00.41676
131	photo	Topo	131	131	2020-04-18 20:37:00.456093
132	photo	Topo	132	132	2020-04-18 20:37:00.490183
133	photo	Topo	133	133	2020-04-18 20:37:00.528537
134	photo	Topo	134	134	2020-04-18 20:37:00.563087
135	photo	Topo	135	135	2020-04-18 20:37:00.596122
136	photo	Topo	136	136	2020-04-18 20:37:00.633399
137	photo	Topo	137	137	2020-04-18 20:37:00.668315
138	photo	Topo	138	138	2020-04-18 20:37:00.706039
139	photo	Topo	139	139	2020-04-18 20:37:00.740192
140	photo	Topo	140	140	2020-04-18 20:37:00.775057
141	photo	Topo	141	141	2020-04-18 20:37:00.816471
142	photo	Topo	142	142	2020-04-18 20:37:00.85104
143	photo	Topo	143	143	2020-04-18 20:37:00.885674
144	photo	Topo	144	144	2020-04-18 20:37:00.927004
145	photo	Topo	145	145	2020-04-18 20:37:00.962661
146	photo	Topo	146	146	2020-04-18 20:37:00.996599
147	photo	Topo	147	147	2020-04-18 20:37:01.05192
148	photo	Topo	148	148	2020-04-18 20:37:01.082408
149	photo	Topo	149	149	2020-04-18 20:37:01.123711
150	photo	Topo	150	150	2020-04-18 20:37:01.157663
151	photo	Topo	151	151	2020-04-18 20:37:01.190737
152	photo	Topo	152	152	2020-04-18 20:37:01.229399
153	photo	Topo	153	153	2020-04-18 20:37:01.26498
154	photo	Topo	154	154	2020-04-18 20:37:01.300228
155	photo	Topo	155	155	2020-04-18 20:37:01.345559
156	photo	Topo	156	156	2020-04-18 20:37:01.3816
157	photo	Topo	157	157	2020-04-18 20:37:01.427523
158	photo	Topo	158	158	2020-04-18 20:37:01.465836
159	photo	Topo	159	159	2020-04-18 20:37:01.500117
160	photo	Topo	160	160	2020-04-18 20:37:01.539132
161	photo	Topo	161	161	2020-04-18 20:37:01.575211
162	photo	Topo	162	162	2020-04-18 20:37:01.618085
163	photo	Topo	163	163	2020-04-18 20:37:01.656413
164	photo	Topo	164	164	2020-04-18 20:37:01.698181
165	photo	Topo	165	165	2020-04-18 20:37:01.742168
166	photo	Topo	166	166	2020-04-18 20:37:01.778181
167	photo	Topo	167	167	2020-04-18 20:37:01.823235
168	photo	Topo	168	168	2020-04-18 20:37:01.862998
169	photo	Topo	169	169	2020-04-18 20:37:01.896093
170	photo	Topo	170	170	2020-04-18 20:37:01.939605
171	photo	Topo	171	171	2020-04-18 20:37:01.990068
172	photo	Topo	172	172	2020-04-18 20:37:02.03759
173	photo	Topo	173	173	2020-04-18 20:37:02.07352
174	photo	Topo	174	174	2020-04-18 20:37:02.116922
175	photo	Topo	175	175	2020-04-18 20:37:02.15418
176	photo	Topo	176	176	2020-04-18 20:37:02.188079
177	photo	Topo	177	177	2020-04-18 20:37:02.229702
178	photo	Topo	178	178	2020-04-18 20:37:02.264346
179	photo	Topo	179	179	2020-04-18 20:37:02.298018
180	photo	Topo	180	180	2020-04-18 20:37:02.342254
181	photo	Topo	181	181	2020-04-18 20:37:02.377101
182	photo	Topo	182	182	2020-04-18 20:37:02.418531
183	photo	Topo	183	183	2020-04-18 20:37:02.46195
184	photo	Topo	184	184	2020-04-18 20:37:02.500665
185	photo	Topo	185	185	2020-04-18 20:37:02.543518
186	photo	Topo	186	186	2020-04-18 20:37:02.57787
187	photo	Topo	187	187	2020-04-18 20:37:02.617223
188	photo	Topo	188	188	2020-04-18 20:37:02.656083
189	photo	Topo	189	189	2020-04-18 20:37:02.686717
190	photo	Topo	190	190	2020-04-18 20:37:02.727789
191	photo	Topo	191	191	2020-04-18 20:37:02.76593
192	photo	Topo	192	192	2020-04-18 20:37:02.801146
193	photo	Topo	193	193	2020-04-18 20:37:02.845555
194	photo	Topo	194	194	2020-04-18 20:37:02.883292
195	photo	Topo	195	195	2020-04-18 20:37:02.930654
196	photo	Topo	196	196	2020-04-18 20:37:02.977199
197	photo	Topo	197	197	2020-04-18 20:37:03.041493
198	photo	Topo	198	198	2020-04-18 20:37:03.075132
199	photo	Topo	199	199	2020-04-18 20:37:03.121609
200	photo	Topo	200	200	2020-04-18 20:37:03.170737
201	photo	Topo	201	201	2020-04-18 20:37:03.22372
202	photo	Topo	202	202	2020-04-18 20:37:03.264435
203	photo	Topo	203	203	2020-04-18 20:37:03.313562
204	photo	Topo	204	204	2020-04-18 20:37:03.370926
205	photo	Topo	205	205	2020-04-18 20:37:03.417536
206	photo	Topo	206	206	2020-04-18 20:37:03.464038
207	photo	Topo	1	207	2020-04-18 20:37:03.510387
208	photo	Topo	207	208	2020-04-18 20:37:03.583786
209	photo	Topo	208	209	2020-04-18 20:37:03.631917
210	photo	Topo	209	210	2020-04-18 20:37:03.680462
211	photo	Topo	210	211	2020-04-18 20:37:03.729789
212	photo	Topo	211	212	2020-04-18 20:37:03.776494
213	photo	Topo	212	213	2020-04-18 20:37:03.819849
214	photo	Topo	213	214	2020-04-18 20:37:03.863247
215	photo	Topo	214	215	2020-04-18 20:37:03.902992
216	photo	Topo	215	216	2020-04-18 20:37:03.949838
217	photo	Topo	216	217	2020-04-18 20:37:03.993906
218	photo	Topo	217	218	2020-04-18 20:37:04.041864
219	photo	Topo	218	219	2020-04-18 20:37:04.091268
220	photo	Topo	219	220	2020-04-18 20:37:04.159244
221	photo	Topo	220	221	2020-04-18 20:37:04.206662
222	photo	Topo	221	222	2020-04-18 20:37:04.253678
223	photo	Topo	222	223	2020-04-18 20:37:04.300302
224	photo	Topo	223	224	2020-04-18 20:37:04.349661
225	photo	Topo	224	225	2020-04-18 20:37:04.392447
688	photo	Topo	361	688	2020-09-03 20:46:57.963127
689	photo	Topo	362	689	2020-09-03 20:46:58.074955
690	photo	Topo	363	690	2020-09-03 20:46:58.256322
691	photo	Topo	364	691	2020-09-03 20:46:58.378397
692	photo	Topo	365	692	2020-09-03 20:46:58.486815
693	photo	Topo	366	693	2020-09-03 20:46:58.599957
694	photo	Topo	367	694	2020-09-03 20:46:58.723536
695	photo	Topo	368	695	2020-09-03 20:46:59.072133
696	photo	Topo	369	696	2020-09-03 20:46:59.243435
697	photo	Topo	370	697	2020-09-03 20:46:59.360176
698	photo	Topo	371	698	2020-09-03 20:46:59.509299
699	photo	Topo	372	699	2020-09-03 20:46:59.685702
700	photo	Topo	373	700	2020-09-03 20:46:59.870181
701	photo	Topo	374	701	2020-09-03 20:47:00.12823
702	photo	Topo	375	702	2020-09-03 20:47:00.262661
703	photo	Topo	376	703	2020-09-03 20:47:00.370248
704	photo	Topo	377	704	2020-09-03 20:47:00.50847
705	photo	Topo	378	705	2020-09-03 20:47:00.654337
706	photo	Topo	379	706	2020-09-03 20:47:00.900117
707	photo	Topo	380	707	2020-09-03 20:47:01.081351
708	photo	Topo	381	708	2020-09-03 20:47:01.241689
709	photo	Topo	441	709	2020-09-03 20:47:01.330914
710	photo	Topo	382	710	2020-09-03 20:47:01.442889
711	photo	Topo	383	711	2020-09-03 20:47:01.602531
712	photo	Topo	384	712	2020-09-03 20:47:01.822416
713	photo	Topo	385	713	2020-09-03 20:47:01.933397
714	photo	Topo	386	714	2020-09-03 20:47:02.040891
715	photo	Topo	387	715	2020-09-03 20:47:02.17587
716	photo	Topo	388	716	2020-09-03 20:47:02.290204
717	photo	Topo	389	717	2020-09-03 20:47:02.465318
718	photo	Topo	390	718	2020-09-03 20:47:02.625828
719	photo	Topo	391	719	2020-09-03 20:47:02.79386
720	photo	Topo	392	720	2020-09-03 20:47:02.934156
721	photo	Topo	393	721	2020-09-03 20:47:03.050405
722	photo	Topo	394	722	2020-09-03 20:47:03.185595
723	photo	Topo	395	723	2020-09-03 20:47:03.44132
724	photo	Topo	396	724	2020-09-03 20:47:03.685468
725	photo	Topo	397	725	2020-09-03 20:47:03.806298
726	photo	Topo	398	726	2020-09-03 20:47:03.922463
265	photo	Topo	225	265	2020-07-05 20:03:39.897451
266	photo	Topo	226	266	2020-07-05 20:03:39.985474
267	photo	Topo	227	267	2020-07-05 20:03:40.064203
268	photo	Topo	228	268	2020-07-05 20:03:40.170792
269	photo	Topo	229	269	2020-07-05 20:03:40.27087
270	photo	Topo	230	270	2020-07-05 20:03:40.334441
271	photo	Topo	231	271	2020-07-05 20:03:40.407191
272	photo	Topo	232	272	2020-07-05 20:03:40.460854
273	photo	Topo	233	273	2020-07-05 20:03:40.520997
274	photo	Topo	234	274	2020-07-05 20:03:40.584859
275	photo	Topo	235	275	2020-07-05 20:03:40.649338
276	photo	Topo	236	276	2020-07-05 20:03:40.726906
277	photo	Topo	237	277	2020-07-05 20:03:40.791831
278	photo	Topo	238	278	2020-07-05 20:03:40.869401
279	photo	Topo	239	279	2020-07-05 20:03:40.964097
280	photo	Topo	240	280	2020-07-05 20:03:41.059989
281	photo	Topo	241	281	2020-07-05 20:03:41.193463
282	photo	Topo	242	282	2020-07-05 20:03:41.285983
283	photo	Topo	243	283	2020-07-05 20:03:41.35944
284	photo	Topo	244	284	2020-07-05 20:03:41.426579
285	photo	Topo	245	285	2020-07-05 20:03:41.486372
286	photo	Topo	246	286	2020-07-05 20:03:41.54814
287	photo	Topo	247	287	2020-07-05 20:03:41.639317
288	photo	Topo	248	288	2020-07-05 20:03:41.771935
289	photo	Topo	249	289	2020-07-05 20:03:41.834762
290	photo	Topo	250	290	2020-07-05 20:03:41.904751
291	photo	Topo	251	291	2020-07-05 20:03:42.048707
292	photo	Topo	252	292	2020-07-05 20:03:42.135243
293	photo	Topo	253	293	2020-07-05 20:03:42.195866
294	photo	Topo	254	294	2020-07-05 20:03:42.294843
295	photo	Topo	255	295	2020-07-05 20:03:42.392581
296	photo	Topo	256	296	2020-07-05 20:03:42.459212
297	photo	Topo	257	297	2020-07-05 20:03:42.535999
298	photo	Topo	258	298	2020-07-05 20:03:42.611047
299	photo	Topo	259	299	2020-07-05 20:03:42.687692
300	photo	Topo	260	300	2020-07-05 20:03:42.771363
301	photo	Topo	261	301	2020-07-05 20:03:42.855913
302	photo	Topo	262	302	2020-07-05 20:03:42.944274
303	photo	Topo	263	303	2020-07-05 20:03:43.02952
304	photo	Topo	264	304	2020-07-05 20:03:43.14347
727	photo	Topo	399	727	2020-09-03 20:47:04.015525
728	photo	Topo	400	728	2020-09-03 20:47:04.125253
729	photo	Topo	401	729	2020-09-03 20:47:04.272478
730	photo	Topo	402	730	2020-09-03 20:47:04.505438
731	photo	Topo	403	731	2020-09-03 20:47:04.686007
732	photo	Topo	404	732	2020-09-03 20:47:04.818108
733	photo	Topo	405	733	2020-09-03 20:47:04.922405
734	photo	Topo	406	734	2020-09-03 20:47:05.0746
735	photo	Topo	407	735	2020-09-03 20:47:05.214144
736	photo	Topo	408	736	2020-09-03 20:47:05.331979
737	photo	Topo	409	737	2020-09-03 20:47:05.654713
738	photo	Topo	410	738	2020-09-03 20:47:05.754011
739	photo	Topo	411	739	2020-09-03 20:47:05.855519
740	photo	Topo	412	740	2020-09-03 20:47:05.951747
741	photo	Topo	413	741	2020-09-03 20:47:06.03682
742	photo	Topo	414	742	2020-09-03 20:47:06.142798
743	photo	Topo	415	743	2020-09-03 20:47:06.283184
744	photo	Topo	416	744	2020-09-03 20:47:06.620602
745	photo	Topo	417	745	2020-09-03 20:47:06.762706
746	photo	Topo	418	746	2020-09-03 20:47:06.872018
747	photo	Topo	419	747	2020-09-03 20:47:06.966732
748	photo	Topo	420	748	2020-09-03 20:47:07.073137
749	photo	Topo	421	749	2020-09-03 20:47:07.165501
750	photo	Topo	422	750	2020-09-03 20:47:07.38858
751	photo	Topo	423	751	2020-09-03 20:47:07.640136
752	photo	Topo	424	752	2020-09-03 20:47:07.732468
753	photo	Topo	425	753	2020-09-03 20:47:07.825045
754	photo	Topo	426	754	2020-09-03 20:47:07.920909
755	photo	Topo	427	755	2020-09-03 20:47:08.015384
756	photo	Topo	428	756	2020-09-03 20:47:08.141765
758	photo	Topo	429	758	2020-09-03 20:47:08.523515
759	photo	Topo	430	759	2020-09-03 20:47:08.613983
760	photo	Topo	431	760	2020-09-03 20:47:08.696705
761	photo	Topo	432	761	2020-09-03 20:47:08.802392
762	photo	Topo	433	762	2020-09-03 20:47:08.891759
763	photo	Topo	434	763	2020-09-03 20:47:09.001358
764	photo	Topo	435	764	2020-09-03 20:47:09.306017
765	photo	Topo	436	765	2020-09-03 20:47:09.431518
766	photo	Topo	437	766	2020-09-03 20:47:09.521963
767	photo	Topo	438	767	2020-09-03 20:47:09.61253
768	photo	Topo	439	768	2020-09-03 20:47:09.707852
769	photo	Topo	440	769	2020-09-03 20:47:09.797219
770	photo	Topo	442	770	2020-09-03 20:47:09.89875
771	photo	Topo	443	771	2020-09-03 20:47:10.000761
772	photo	Topo	459	772	2020-09-03 20:47:10.30379
773	photo	Topo	444	773	2020-09-03 20:47:10.400558
774	photo	Topo	445	774	2020-09-03 20:47:10.489856
775	photo	Topo	460	775	2020-09-03 20:47:10.590189
776	photo	Topo	461	776	2020-09-03 20:47:10.718362
777	photo	Topo	462	777	2020-09-03 20:47:10.831159
778	photo	Topo	446	778	2020-09-03 20:47:10.979693
779	photo	Topo	447	779	2020-09-03 20:47:11.202984
780	photo	Topo	463	780	2020-09-03 20:47:11.320452
781	photo	Topo	464	781	2020-09-03 20:47:11.44342
782	photo	Topo	465	782	2020-09-03 20:47:11.589348
783	photo	Topo	466	783	2020-09-03 20:47:11.83497
784	photo	Topo	448	784	2020-09-03 20:47:12.039638
785	photo	Topo	449	785	2020-09-03 20:47:12.151632
786	photo	Topo	450	786	2020-09-03 20:47:12.306506
787	photo	Topo	467	787	2020-09-03 20:47:12.399009
788	photo	Topo	451	788	2020-09-03 20:47:12.490272
789	photo	Topo	452	789	2020-09-03 20:47:12.649603
790	photo	Topo	453	790	2020-09-03 20:47:12.81247
791	photo	Topo	468	791	2020-09-03 20:47:12.953721
792	photo	Topo	469	792	2020-09-03 20:47:13.083301
793	photo	Topo	470	793	2020-09-03 20:47:13.200863
794	photo	Topo	454	794	2020-09-03 20:47:13.302549
795	photo	Topo	455	795	2020-09-03 20:47:13.537794
796	photo	Topo	471	796	2020-09-03 20:47:13.645811
797	photo	Topo	456	797	2020-09-03 20:47:13.74569
798	photo	Topo	457	798	2020-09-03 20:47:13.888299
799	photo	Topo	472	799	2020-09-03 20:47:13.988395
800	photo	Topo	473	800	2020-09-03 20:47:14.087346
801	photo	Topo	474	801	2020-09-03 20:47:14.353664
802	photo	Topo	458	802	2020-09-03 20:47:14.531306
803	photo	Topo	475	803	2020-09-03 20:47:14.780252
804	photo	Topo	476	804	2020-09-03 20:47:14.867073
812	photo	Topo	481	812	2020-10-15 13:39:03.019915
814	photo	Topo	483	814	2020-10-15 13:45:04.538133
818	photo	Topo	486	818	2020-10-19 21:37:29.342346
822	photo	Topo	490	822	2020-10-19 21:41:48.18961
826	photo	Topo	494	826	2020-10-19 21:46:13.366978
828	photo	Topo	496	828	2020-10-19 21:47:41.885011
833	photo	Topo	501	833	2020-10-19 21:51:38.378899
834	photo	Topo	502	834	2020-10-19 21:52:18.623322
835	photo	Topo	503	835	2020-10-19 21:52:57.931923
837	photo	Topo	505	837	2020-10-19 21:55:06.282351
838	photo	Topo	506	838	2020-10-19 21:56:23.375305
841	photo	Topo	509	841	2020-10-27 10:13:03.234681
842	photo	Topo	510	842	2020-10-27 10:15:09.9353
851	photo	Topo	519	851	2020-10-27 10:27:56.079271
853	photo	Topo	521	853	2020-10-27 10:30:16.5122
855	photo	Topo	523	855	2020-10-27 10:32:37.71907
856	photo	Topo	524	856	2020-10-27 10:33:43.85032
857	photo	Topo	525	857	2020-10-27 10:39:21.335204
858	photo	Topo	526	858	2020-10-27 10:40:08.1789
859	photo	Topo	527	859	2020-10-27 10:41:28.863519
861	photo	Topo	529	861	2020-10-27 10:53:13.089174
866	photo	Topo	534	866	2020-10-27 10:58:37.085393
868	photo	Topo	536	868	2020-10-27 11:00:48.491251
875	photo	Topo	543	875	2020-10-27 11:09:16.035644
877	photo	Topo	545	877	2020-10-27 11:15:50.558644
878	photo	Topo	546	878	2020-10-27 11:16:49.422645
879	photo	Topo	547	879	2020-10-27 11:17:34.687031
880	photo	Topo	548	880	2020-10-27 11:18:25.166828
883	photo	Topo	551	883	2020-10-27 11:21:07.542604
884	photo	Topo	552	884	2020-10-27 11:22:11.364826
886	photo	Topo	554	886	2020-10-27 11:24:43.030201
887	photo	Topo	555	887	2020-10-27 11:26:29.531406
890	photo	Topo	558	890	2020-10-27 11:28:48.426109
805	photo	Topo	477	805	2020-09-04 19:56:30.910566
809	photo	Topo	265	809	2020-10-14 17:04:55.028542
810	photo	Topo	479	810	2020-10-15 13:01:45.749114
813	photo	Topo	482	813	2020-10-15 13:44:53.444225
816	photo	Topo	484	816	2020-10-15 13:46:47.708063
819	photo	Topo	487	819	2020-10-19 21:39:07.397781
820	photo	Topo	488	820	2020-10-19 21:39:56.054436
823	photo	Topo	491	823	2020-10-19 21:43:14.101701
824	photo	Topo	492	824	2020-10-19 21:43:59.542417
829	photo	Topo	497	829	2020-10-19 21:48:23.905458
830	photo	Topo	498	830	2020-10-19 21:49:06.814048
831	photo	Topo	499	831	2020-10-19 21:50:01.83602
832	photo	Topo	500	832	2020-10-19 21:50:58.544387
839	photo	Topo	507	839	2020-10-27 10:07:49.619423
844	photo	Topo	512	844	2020-10-27 10:18:52.37728
847	photo	Topo	515	847	2020-10-27 10:23:41.880701
848	photo	Topo	516	848	2020-10-27 10:25:02.615169
850	photo	Topo	518	850	2020-10-27 10:27:04.562888
852	photo	Topo	520	852	2020-10-27 10:29:11.968915
854	photo	Topo	522	854	2020-10-27 10:31:40.198428
860	photo	Topo	528	860	2020-10-27 10:52:14.275322
862	photo	Topo	530	862	2020-10-27 10:54:08.203082
863	photo	Topo	531	863	2020-10-27 10:55:15.254806
864	photo	Topo	532	864	2020-10-27 10:56:10.236998
865	photo	Topo	533	865	2020-10-27 10:57:11.145929
867	photo	Topo	535	867	2020-10-27 10:59:47.423685
869	photo	Topo	537	869	2020-10-27 11:03:21.004333
870	photo	Topo	538	870	2020-10-27 11:04:40.671174
871	photo	Topo	539	871	2020-10-27 11:05:42.506845
872	photo	Topo	540	872	2020-10-27 11:06:55.370334
873	photo	Topo	541	873	2020-10-27 11:07:43.220877
874	photo	Topo	542	874	2020-10-27 11:08:29.351858
876	photo	Topo	544	876	2020-10-27 11:14:31.608207
881	photo	Topo	549	881	2020-10-27 11:19:06.935272
882	photo	Topo	550	882	2020-10-27 11:19:55.435939
885	photo	Topo	553	885	2020-10-27 11:23:14.43159
888	photo	Topo	556	888	2020-10-27 11:27:08.042394
889	photo	Topo	557	889	2020-10-27 11:27:50.317583
593	photo	Topo	266	593	2020-09-03 20:46:42.282532
594	photo	Topo	267	594	2020-09-03 20:46:42.450484
595	photo	Topo	268	595	2020-09-03 20:46:42.603841
596	photo	Topo	269	596	2020-09-03 20:46:42.813111
597	photo	Topo	270	597	2020-09-03 20:46:43.051896
598	photo	Topo	271	598	2020-09-03 20:46:43.179962
599	photo	Topo	272	599	2020-09-03 20:46:43.28863
600	photo	Topo	273	600	2020-09-03 20:46:43.403705
601	photo	Topo	274	601	2020-09-03 20:46:43.572709
602	photo	Topo	275	602	2020-09-03 20:46:43.789318
603	photo	Topo	276	603	2020-09-03 20:46:43.918042
604	photo	Topo	277	604	2020-09-03 20:46:44.045615
605	photo	Topo	278	605	2020-09-03 20:46:44.159941
606	photo	Topo	279	606	2020-09-03 20:46:44.272314
607	photo	Topo	280	607	2020-09-03 20:46:44.41385
608	photo	Topo	281	608	2020-09-03 20:46:44.650312
609	photo	Topo	282	609	2020-09-03 20:46:44.762164
610	photo	Topo	283	610	2020-09-03 20:46:44.975473
611	photo	Topo	284	611	2020-09-03 20:46:45.097664
612	photo	Topo	285	612	2020-09-03 20:46:45.208861
613	photo	Topo	286	613	2020-09-03 20:46:45.427515
614	photo	Topo	287	614	2020-09-03 20:46:45.515025
615	photo	Topo	288	615	2020-09-03 20:46:45.628659
616	photo	Topo	289	616	2020-09-03 20:46:45.757452
617	photo	Topo	290	617	2020-09-03 20:46:45.933042
618	photo	Topo	291	618	2020-09-03 20:46:46.207722
619	photo	Topo	292	619	2020-09-03 20:46:46.433381
620	photo	Topo	293	620	2020-09-03 20:46:46.565465
621	photo	Topo	294	621	2020-09-03 20:46:46.719892
622	photo	Topo	295	622	2020-09-03 20:46:46.833548
623	photo	Topo	296	623	2020-09-03 20:46:46.954504
624	photo	Topo	297	624	2020-09-03 20:46:47.062601
625	photo	Topo	298	625	2020-09-03 20:46:47.207283
626	photo	Topo	299	626	2020-09-03 20:46:47.491298
627	photo	Topo	300	627	2020-09-03 20:46:47.618614
628	photo	Topo	301	628	2020-09-03 20:46:47.839889
629	photo	Topo	302	629	2020-09-03 20:46:47.94703
630	photo	Topo	303	630	2020-09-03 20:46:48.08461
631	photo	Topo	304	631	2020-09-03 20:46:48.3893
632	photo	Topo	305	632	2020-09-03 20:46:48.531859
633	photo	Topo	306	633	2020-09-03 20:46:48.646116
634	photo	Topo	307	634	2020-09-03 20:46:48.737952
635	photo	Topo	308	635	2020-09-03 20:46:48.835829
636	photo	Topo	309	636	2020-09-03 20:46:48.949839
637	photo	Topo	310	637	2020-09-03 20:46:49.291268
638	photo	Topo	311	638	2020-09-03 20:46:49.52093
639	photo	Topo	312	639	2020-09-03 20:46:49.629321
640	photo	Topo	313	640	2020-09-03 20:46:49.752178
641	photo	Topo	314	641	2020-09-03 20:46:49.860419
642	photo	Topo	315	642	2020-09-03 20:46:49.963817
643	photo	Topo	316	643	2020-09-03 20:46:50.178294
644	photo	Topo	317	644	2020-09-03 20:46:50.472048
645	photo	Topo	318	645	2020-09-03 20:46:50.617728
646	photo	Topo	319	646	2020-09-03 20:46:50.747643
647	photo	Topo	320	647	2020-09-03 20:46:50.87306
648	photo	Topo	321	648	2020-09-03 20:46:51.010226
649	photo	Topo	322	649	2020-09-03 20:46:51.124619
650	photo	Topo	323	650	2020-09-03 20:46:51.560405
651	photo	Topo	324	651	2020-09-03 20:46:51.703244
652	photo	Topo	325	652	2020-09-03 20:46:51.837368
653	photo	Topo	326	653	2020-09-03 20:46:52.05418
654	photo	Topo	327	654	2020-09-03 20:46:52.249751
655	photo	Topo	328	655	2020-09-03 20:46:52.613427
656	photo	Topo	329	656	2020-09-03 20:46:52.770193
657	photo	Topo	330	657	2020-09-03 20:46:52.89124
658	photo	Topo	331	658	2020-09-03 20:46:53.009175
659	photo	Topo	332	659	2020-09-03 20:46:53.178774
660	photo	Topo	333	660	2020-09-03 20:46:53.32076
661	photo	Topo	334	661	2020-09-03 20:46:53.595577
662	photo	Topo	335	662	2020-09-03 20:46:53.892568
663	photo	Topo	336	663	2020-09-03 20:46:54.010303
664	photo	Topo	337	664	2020-09-03 20:46:54.135899
665	photo	Topo	338	665	2020-09-03 20:46:54.248536
666	photo	Topo	339	666	2020-09-03 20:46:54.415575
667	photo	Topo	340	667	2020-09-03 20:46:54.571707
668	photo	Topo	341	668	2020-09-03 20:46:54.848274
669	photo	Topo	342	669	2020-09-03 20:46:54.996246
670	photo	Topo	343	670	2020-09-03 20:46:55.110248
671	photo	Topo	344	671	2020-09-03 20:46:55.235667
672	photo	Topo	345	672	2020-09-03 20:46:55.442092
673	photo	Topo	346	673	2020-09-03 20:46:55.671713
674	photo	Topo	347	674	2020-09-03 20:46:55.937204
675	photo	Topo	348	675	2020-09-03 20:46:56.046864
676	photo	Topo	349	676	2020-09-03 20:46:56.140131
677	photo	Topo	350	677	2020-09-03 20:46:56.230002
678	photo	Topo	351	678	2020-09-03 20:46:56.32783
679	photo	Topo	352	679	2020-09-03 20:46:56.458144
680	photo	Topo	353	680	2020-09-03 20:46:56.72835
681	photo	Topo	354	681	2020-09-03 20:46:56.895326
682	photo	Topo	355	682	2020-09-03 20:46:57.013191
683	photo	Topo	356	683	2020-09-03 20:46:57.141901
684	photo	Topo	357	684	2020-09-03 20:46:57.289263
685	photo	Topo	358	685	2020-09-03 20:46:57.432568
686	photo	Topo	359	686	2020-09-03 20:46:57.560502
687	photo	Topo	360	687	2020-09-03 20:46:57.818153
811	photo	Topo	480	811	2020-10-15 13:24:49.713655
817	photo	Topo	485	817	2020-10-19 19:41:22.714091
821	photo	Topo	489	821	2020-10-19 21:41:02.630096
825	photo	Topo	493	825	2020-10-19 21:45:00.846251
827	photo	Topo	495	827	2020-10-19 21:46:52.969721
836	photo	Topo	504	836	2020-10-19 21:53:46.600817
840	photo	Topo	508	840	2020-10-27 10:10:54.161387
843	photo	Topo	511	843	2020-10-27 10:16:59.007886
845	photo	Topo	513	845	2020-10-27 10:20:19.900054
846	photo	Topo	514	846	2020-10-27 10:22:14.178047
849	photo	Topo	517	849	2020-10-27 10:26:02.621596
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at) FROM stdin;
22	ihk4k6ulwji3qe9sks4r02636r64	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	600161	yyZGMNXcDIbpWHUl8OeLeg==	2020-04-18 20:36:56.055207
2	txz0l5wyvitad4400tlqdectfc8i	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	575857	8qnBSApfNMJ1tTph9bfh6A==	2020-04-18 20:36:55.289084
3	pvju7a3uanxjv69pzgtjnb5k5t06	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	518913	R0rXVQyG2c4ShbWtBS3s5g==	2020-04-18 20:36:55.341717
4	hee21816847ed3ua8sogledk028x	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	549985	YXF3weOEm2U3bIvMQC/0ww==	2020-04-18 20:36:55.379622
5	blqfou420yl2sbg65h131l1yrqtg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	481385	+B3xnp+/TiHyp9KwAeUXDw==	2020-04-18 20:36:55.431411
6	lcuobxqdtgtf3hw4qkmzqdrkx2te	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	599450	L1Voy6p86lI7fsRWTAWmwg==	2020-04-18 20:36:55.51183
7	8htxqjbcsboxbl5jo0badbnayema	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	436285	hkrDueMnhXmxOzwaIW+O8A==	2020-04-18 20:36:55.549769
8	l974gd65hkwkwkungxuvzirwvmfh	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528528	Bqo1cZOaPnXQwvLwE2aiuA==	2020-04-18 20:36:55.580746
9	vl4oby6o8awa4x03q49guvos2ovc	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	549985	YXF3weOEm2U3bIvMQC/0ww==	2020-04-18 20:36:55.616657
10	etr81e2ydxvhudzu9v4dwxqke81t	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	546483	AUc16+4jZy1HrCUhudMc0A==	2020-04-18 20:36:55.643028
11	1ex3v2til1bqzq6h66x0s2mtz167	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	635805	IGGMf8fGtCzO1evAtL9zwQ==	2020-04-18 20:36:55.684088
12	g0vne64i006mgermn1mj9bkj8gj7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	539185	ExVxE+vaJFF9Y5mpAGL0jw==	2020-04-18 20:36:55.720589
13	ixl51ivq58ols5pglxr0wbavja3n	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	433442	KPi+JMtp8YBfLc4tpbvvYw==	2020-04-18 20:36:55.752121
14	z6cpnoq4syvcv8evs84il0rtxmua	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	465803	UqnuxRnZoajA7aEC8KGxZg==	2020-04-18 20:36:55.786604
15	q1zqbnwfwmu7xprp8estkdmcivae	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	388653	DssvthfPVIuWM+BQZj/rpA==	2020-04-18 20:36:55.822125
16	ppl9nxh3ytkmn5stdvx6dkgb1gyk	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	572627	iuGLOrceGiXcTAbO/uQfxQ==	2020-04-18 20:36:55.848541
17	m47etj3zgqsildy28rlqwmm42tew	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	513766	kebBlUWPYTArf7vMedfdOw==	2020-04-18 20:36:55.883185
18	liipm957jdszdaycg4gbri4ny6sp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	467454	xP/qVWCKPkpuKANrEJ9uWQ==	2020-04-18 20:36:55.919826
19	q9k8vzto0aeg1f8lk08z9ozi4twx	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	624677	v8a8HrFPsi446+8Lkatymg==	2020-04-18 20:36:55.947164
20	7wjhf79xjggisy5fzrk6q5537x9u	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	505711	aJFn9iWCyWXqrV3qmvqC8Q==	2020-04-18 20:36:55.982317
21	0g6eq9ih1zady8zrpmywwt93rwaz	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	567244	AWocO58ZuHhxHZDN0grv5w==	2020-04-18 20:36:56.023921
23	pyp98td1lrq6gt5ovfcvigr4xjny	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	554516	Zntt+B1Z/YFltPzc/2eo8w==	2020-04-18 20:36:56.093133
24	ic76lb7604r050qvvdhg8kvx5vv7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	571943	RXq7Qe6ZLCK5IDN2JyK+uA==	2020-04-18 20:36:56.128396
25	j5xu1h4behbein8jq67fci6ot1ga	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	630383	/YZAFKa7uDFQ6v5WQt5HwA==	2020-04-18 20:36:56.162769
26	387xat2olxqqpgrdvrwdjk9ycofm	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	568322	xkRwJnA/mC29rTOu4x2M6g==	2020-04-18 20:36:56.199629
27	6j9bnq6v47j0hhlpchckmpepuvrw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	539185	ExVxE+vaJFF9Y5mpAGL0jw==	2020-04-18 20:36:56.233323
28	bq70f717fw70xpriji3si55dr4uu	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	643399	d7v7Mt4M6JFGIXwuz/rT+g==	2020-04-18 20:36:56.268576
29	wdzaeitgepu26ih9flg079ohvyw1	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	541176	rHPc1tf6fLxNWfwTKwBeHA==	2020-04-18 20:36:56.313589
30	s9uf0eux4gnls2520ubkkasl1u1j	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	559677	gS50BjR2RJNDNM2gzQHuzg==	2020-04-18 20:36:56.344306
31	uyl30nzs5dzxwisl2ny3spxdeagr	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	587683	/s9m97cSk/HaGJBLm0iO0Q==	2020-04-18 20:36:56.388424
32	01bijyeqjziv4v5awobp7vt8v8qg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	575455	iizwpNg/p+r5WhthMVhaQg==	2020-04-18 20:36:56.425234
33	efu8lwt8qez8zms8tfre8v4y8ihh	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	663786	K8ZOyU7Cs16VoHg4/KCRqw==	2020-04-18 20:36:56.459775
34	s1phmsoydg0m0ns6n65j87hep77r	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	521462	5Evc10eig2kO8URvFNgx1A==	2020-04-18 20:36:56.494821
35	0ob38y6lpn5wg0e5to52k20q95bg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	505711	aJFn9iWCyWXqrV3qmvqC8Q==	2020-04-18 20:36:56.532782
36	jc7quqce4xwclxfb4cayngjq0o80	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	572627	iuGLOrceGiXcTAbO/uQfxQ==	2020-04-18 20:36:56.571869
37	maumvc62l00bt2meqp90xqxidike	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	581520	MDtkpHEQ/0+CPAdqxgMydw==	2020-04-18 20:36:56.619409
38	tjzr6480hqmaknoycldh9w6fjnny	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	546747	0ozX6eGU+MUahu/44JF1IA==	2020-04-18 20:36:56.65576
39	6g6272h5ov3rqsjdzlbnpaur43oq	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	568261	1zP7a5gO/H5mrg2Ayu5Afw==	2020-04-18 20:36:56.705767
40	49wu0y3giuny1pxw49yr0h3femga	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	590130	lWTe9SqbVDPcnM+Yw+XWXA==	2020-04-18 20:36:56.742363
41	0ep3z0t035xybp45uck99baow252	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	627934	oOXx8MzdERT7DSbjV5yvoA==	2020-04-18 20:36:56.788115
42	92xwi71hm6xjzfyz8kutf3fgyn7f	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610662	9MoL8W4iydQz1BPzdyCC3g==	2020-04-18 20:36:56.827089
43	o0ob562czb50927qg1r7spkt8ze9	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610662	9MoL8W4iydQz1BPzdyCC3g==	2020-04-18 20:36:56.863113
44	cykb0ycetyx3gtlt7dvconwsjfrl	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	627934	oOXx8MzdERT7DSbjV5yvoA==	2020-04-18 20:36:56.912004
45	cfqufhx2hudsz1yth86dm4a9w5fq	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	605093	/3s4iR9+UzWBhAYqNGL5jQ==	2020-04-18 20:36:56.944133
46	rg2znh3sl3dis3a0qaawk1bm476p	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	556361	AWzvVK1H6da5I1lDI+LA4A==	2020-04-18 20:36:56.981911
47	4pel3po8t95olgh9srp4556qzizz	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	554516	Zntt+B1Z/YFltPzc/2eo8w==	2020-04-18 20:36:57.023717
48	uwxaj7c0wbyq5kahvenjx3vb3y39	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	577840	32kb4SGDYLLjkvgF1WuJww==	2020-04-18 20:36:57.067152
49	l4xev3ptjwvb6thbk2ctgb8ya5aw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	553317	IiPEYsFsimr9l9F4d8UNhg==	2020-04-18 20:36:57.114302
50	6o8xvxceo1apbqcjgjsx8g3eufcs	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	544508	x3zahyCH8BQKaN9v9yQfGw==	2020-04-18 20:36:57.145508
51	8afaeduv4gfcs4qwy6i1qfrfpopl	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	560632	47whB847mG1Xw/13iNqPaA==	2020-04-18 20:36:57.182499
52	8zoihlozzupzxswc3q8l80phxvjb	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	595986	dWMvFQBtCilWfusfDhU4gw==	2020-04-18 20:36:57.225243
53	2adoje92x4yyrga29fm324l13ght	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	568261	1zP7a5gO/H5mrg2Ayu5Afw==	2020-04-18 20:36:57.260302
54	zkdawbc1y7luk8irv5omyafqxlae	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	616735	mSCSNRcOFa9GviO2RcgDaw==	2020-04-18 20:36:57.300202
55	8hwcojrpqx3x7wd09atqnmu9n9o2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	559677	gS50BjR2RJNDNM2gzQHuzg==	2020-04-18 20:36:57.338215
56	f4o7xsp6mmjpbmadyz3sw1mj52qm	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	588852	mHkz52qOWQVQyFiHIcO8Tw==	2020-04-18 20:36:57.380872
57	ur7yu8leo9l3l9gj9pdvo22742ry	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	411624	HWPDeAbFIJ9VSwnQINpR8g==	2020-04-18 20:36:57.423737
58	m8148rtbffqnv2liu410q1txffbg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528501	4P8zLO0AOYid3FWF4e1P0w==	2020-04-18 20:36:57.457442
59	paw755lx3k9ods0mmkl38inm55m2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	660421	HWWyMb6vgueX++7GAJZS2w==	2020-04-18 20:36:57.498404
60	bu2i5q05ojg5857b2khikt5edbhp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	411624	HWPDeAbFIJ9VSwnQINpR8g==	2020-04-18 20:36:57.534438
61	8u21i4reryz3uah5wyc4zlf8d1f7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	609176	utBdiXZpWQR9L9fl2MY/GA==	2020-04-18 20:36:57.57952
62	ibrxfldkrouqh3qyx1w5v01q77t9	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	559677	gS50BjR2RJNDNM2gzQHuzg==	2020-04-18 20:36:57.626815
63	ltckgpwnnj89wnma6xibrxkok2e0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	469126	8QFOsiCZQzIFH2Q7XGuc2A==	2020-04-18 20:36:57.669907
64	1hmici2a1lwwksqhrmun34756a4w	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	566337	7lDoD6Nf+iyAO3iWv1VSMQ==	2020-04-18 20:36:57.717706
65	9tj4mokwdhtz6xcn13t6g74pfi2r	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	592045	i4XEfSjNC8nM/oECmhw1YQ==	2020-04-18 20:36:57.754828
66	1yllzmb5ij664vihqt3e2gbbllyz	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	608710	m9OJTf5CacmXDZ3zaqkarw==	2020-04-18 20:36:57.799237
67	qlvo64eafwlwzzuxw4lltp4ns4h0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	587872	eEhluj6EO5CwrvNv+iDt3A==	2020-04-18 20:36:57.847772
68	p16xeph0gti81hq0b5avb5gmpfta	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	565417	KGTflVdqGXYd5B0QVcjwfA==	2020-04-18 20:36:57.894208
69	oh157413n4lrl4ys0grurkdovv4q	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	595986	dWMvFQBtCilWfusfDhU4gw==	2020-04-18 20:36:57.932245
70	i4vb4aw8fv0pg4r1iiohq39481xq	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	635283	O0nfTU8HuN4awJHnKHOjMw==	2020-04-18 20:36:57.970831
71	g2bfjuaexly1j6ssjcrll4205fpn	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	597246	HRjOM+9PvpTPiC0Pj7c2FA==	2020-04-18 20:36:58.01323
72	jcne94fo51x0p6hwwf2pvazqy6iv	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	617099	Rmceyh8CMvleobIBLfRpgw==	2020-04-18 20:36:58.049943
73	cpeueb0wc12wjrtlt5l145yzdhxa	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528501	4P8zLO0AOYid3FWF4e1P0w==	2020-04-18 20:36:58.092853
74	p9zmn90644fq8g1pzcpuwp6vpza0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	506326	v0HSDnqLHpX/ArLH5bASeg==	2020-04-18 20:36:58.131914
75	4x2r5y2llnpjmya8sh1akcuq3hhv	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	582668	D4jBfv4wdzcCxR0Hby/aGA==	2020-04-18 20:36:58.169866
76	ut910qnyl4c22ajmk5rpauj10xr7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	619129	jB5yHNIORh+ax5WzkHvfqw==	2020-04-18 20:36:58.212926
77	zqh2iis9aeek0jhtv1wuets4mvuw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	599233	64R5F0QvjWQg5gSXbYI2qg==	2020-04-18 20:36:58.249006
78	f9gmwrnywz9vrm29mb0krktfel3y	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	611650	DFpVRDyw8DjTgUBYeNw99w==	2020-04-18 20:36:58.289968
79	3pxruibbvlut7kw6036w26e94krj	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	588742	RAyT+YJQjR2LSmxU72euGQ==	2020-04-18 20:36:58.323959
80	egjb2rhx0403dqn22gihoqok73l2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	611206	Yb4nIrTQH51R0MZtlWYo4Q==	2020-04-18 20:36:58.36068
81	lb58p7wx3u1b8i223vwx0qqy5b3a	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	595043	rX8r/pS1Trq6SMLl0quLdg==	2020-04-18 20:36:58.41313
82	prjbh2wx590n4hlbq8phkg719q8g	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	612321	/lcJ6gu/AWq6AimVhZiz7Q==	2020-04-18 20:36:58.45022
83	82oij2pwrvds7s17o9rq1ypuveke	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	534817	EasV1WfZAbPKDUXH/Gjglg==	2020-04-18 20:36:58.490954
84	9iuv0r73kssvfcqk9r11fpyik0ys	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	505963	TVlr5h5D/zhwZlx+drd0FA==	2020-04-18 20:36:58.528914
85	on5qf4zpwbct2asloapwesggi9r5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	533717	itxtPs4L4Tc71dg/oAgWrA==	2020-04-18 20:36:58.565507
86	nzzti0s6ker8chbv789j2qemy6tr	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	534817	EasV1WfZAbPKDUXH/Gjglg==	2020-04-18 20:36:58.612842
87	mp68gs2pgqsxbqflxjh299uz6xvw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	497397	pibqa08AfPlU0HA14Uz4Jg==	2020-04-18 20:36:58.655931
88	lerf0ancyke8ke8oe4ws96qvm48l	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	558073	xUmEGB/hs8uyIFYkILmXIQ==	2020-04-18 20:36:58.694778
89	8c9f0b6sdls6xhlecxralh3ip8sz	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552380	NFWBkVyPshvUe6dKCfikrg==	2020-04-18 20:36:58.735642
94	chbfld87e1uti41z2hgsce3g64zm	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	655187	JfSS6CJVNlbhM9BSQcUfiQ==	2020-04-18 20:36:58.948539
90	7xbolf7yh103bknmpcpgh9o5fefv	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552666	Dm0wiHkM2GUi3tvLskNkEQ==	2020-04-18 20:36:58.779509
91	3cj2f0btly9fot7vlb2jlinr7046	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	585603	KdN1+3tK3R5YPsBbk1M07A==	2020-04-18 20:36:58.824425
92	2x77g3cj3pmhwnwgq259wbcx1bu8	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	561662	4RS+1Yj9SCvkPvDcZh1mWw==	2020-04-18 20:36:58.864993
93	2irkcgb93qsy7p89tgqtfm7fay7v	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552666	Dm0wiHkM2GUi3tvLskNkEQ==	2020-04-18 20:36:58.914418
184	hzthztauabdsy516utn2lx030miy	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	551039	uiLpH2qapq3vsOXxP3xRYQ==	2020-04-18 20:37:02.49733
95	lq3553cgaykb1j7dpp25m04wkf9c	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552731	RuQluFGMFvPiTbdx7AfYKA==	2020-04-18 20:36:58.990817
96	pif7iv5f69q2pra8y33xprfab9w3	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	436285	hkrDueMnhXmxOzwaIW+O8A==	2020-04-18 20:36:59.031206
97	g31fqh5mutjgj7ybpayx9eegy62e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	616499	avPqpogJOfnNt+NJQsKiSA==	2020-04-18 20:36:59.069541
98	8nhtlxni0799ghuxo1e0apilqk99	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	566715	ZQ8QHbAWcMis6vHpnvspVw==	2020-04-18 20:36:59.11413
99	pmyv5d7orfh3pzsb0s2gygi92mr6	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	600987	qMb0JpUpFtIQW45jSGz7YQ==	2020-04-18 20:36:59.160683
100	qrvjmuon80k92fne09cgyik3yhec	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	501411	B67OAUXoItC4HIdBtvql9w==	2020-04-18 20:36:59.202538
101	n8lsjm7eg219lsec1dtnb12b5ay7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	470674	CBaUiQ5JG0VbtaY2mzsyPw==	2020-04-18 20:36:59.239449
102	gyo0rvi9i4hiu9e2tb7t109gf56i	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	478351	+pk4yZW9oXMH7KtGQo/LtQ==	2020-04-18 20:36:59.277647
103	eowr3nv3hkkm1t9x2wt2ml9jpmmb	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	502013	OocUv9KjL1AjdqaYYGyTAA==	2020-04-18 20:36:59.318001
104	x44enn387dndvy1ir4x5f3fq3u5x	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	611206	Yb4nIrTQH51R0MZtlWYo4Q==	2020-04-18 20:36:59.359185
105	ye17fc1xyye0k40i7c9om5gxa9of	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	543222	OWwL+sGhmUvCDaiqZjvE+Q==	2020-04-18 20:36:59.400703
106	lq1gyti6554d5xgadf38m91bkz49	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	563148	b97jBFCTBjfm43Wts+LAwA==	2020-04-18 20:36:59.444921
107	0q4gdi9fgqc0r30fvonjai6zk0j7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	603790	HQtSznfof+/KuzClsvyLJQ==	2020-04-18 20:36:59.48445
108	mbob1gdvsileby3j6wfqglxoxvkw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528528	Bqo1cZOaPnXQwvLwE2aiuA==	2020-04-18 20:36:59.556192
109	9jd48vd86qsec4rrinlcvzng31s2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	613715	sR901Oxxzh2G102s8CasOw==	2020-04-18 20:36:59.601828
110	vwmuko4mq54vjyun35bijz76jzt8	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	513611	Hz/wwE2xpdvrx3Uiw/tNEw==	2020-04-18 20:36:59.646831
111	w7oe37404qzj8sadgk35bo4lmepf	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	513611	Hz/wwE2xpdvrx3Uiw/tNEw==	2020-04-18 20:36:59.685108
112	h10v2ifemuz1iblbvl0v321yf2j8	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528223	6AXjCZZInAjUf8wZPUvjjg==	2020-04-18 20:36:59.724913
113	ljyd55oqpbepp6z0xz0lxja5w37j	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	528528	Bqo1cZOaPnXQwvLwE2aiuA==	2020-04-18 20:36:59.762456
114	6a5qc8u976e3esdvfcua2ebdoguu	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	549013	tjAgcqs31ISUj3y8wpOesQ==	2020-04-18 20:36:59.801726
115	1pjp1whcrx8xb7amlenddhtp5xmc	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	619750	nrYnBhX4sDm7Mj1zGMIllQ==	2020-04-18 20:36:59.840265
116	turr0bvn2mjmky24kkj40x3ubxpn	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	606758	u8cxZQUtipgxIjSH7U5J+g==	2020-04-18 20:36:59.877091
117	nxol13tm824w6irnktbmxh6mbv89	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	575455	iizwpNg/p+r5WhthMVhaQg==	2020-04-18 20:36:59.922535
118	oeedaoqq3j8s2ibl54ucs5qujj1e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	489092	vea7tSAuIm0f+aBulUPpcg==	2020-04-18 20:36:59.964176
119	k0zfwi9a7i3ror2vs0kbqqrx4rna	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	577048	LfAu/HND4ymwoq4QU14QYA==	2020-04-18 20:37:00.000136
120	f51o35j2cfriosb6h71bdaab9u42	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	599233	64R5F0QvjWQg5gSXbYI2qg==	2020-04-18 20:37:00.038668
121	rty4hbx7n0slgvhd25hkughjdbbb	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	469479	5caJHhKPBHz9FsIGAVoIhA==	2020-04-18 20:37:00.07694
122	weljh6g75khcqw633pqd1qtb4dix	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610044	Sma82GqWvftUa+jUudCMJw==	2020-04-18 20:37:00.119908
123	vqvd9jdk6gm1r5xtviwraq3lj57x	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	615686	jrINowulP8YPo1zsHXDX+Q==	2020-04-18 20:37:00.157795
124	3qj2igjahyvbg7wy57h9lynnpmt3	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610699	DWNjXjkgSo83drCeUHud3g==	2020-04-18 20:37:00.191748
125	ha4brlqedfmnhb7tu3igg14p3xh3	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	570416	gCxqeoJpCX6lXaI3uO7/6Q==	2020-04-18 20:37:00.228574
126	9q2kz1b814qqimz7h84pq27pua0e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	616289	Hr0ihn6O/+MsSG4EGdrW9A==	2020-04-18 20:37:00.263284
127	6zhp9hljv9uoy9nmupt50w2atg8e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	566715	ZQ8QHbAWcMis6vHpnvspVw==	2020-04-18 20:37:00.300197
128	c4rc2nzn18ec84iphj0i44tr2xb7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610169	cvMZ3V9K90GhPLd1WWntag==	2020-04-18 20:37:00.338504
129	19pgefvvjd8yy8xt8q1d83940uyg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	616289	Hr0ihn6O/+MsSG4EGdrW9A==	2020-04-18 20:37:00.371491
130	h4ul560cn2aplsx1jodcj074m4q0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	553562	LjHYghrNlQk6+QBo1JaJdg==	2020-04-18 20:37:00.414435
131	2maypsu48yw4jyc2u6cu3nqbxev9	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	608710	m9OJTf5CacmXDZ3zaqkarw==	2020-04-18 20:37:00.452615
132	cjira8h8tz2zerx0wnkcl7f2j4hi	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	588304	eW+aYKmtN3TDJ+p8MJsXtw==	2020-04-18 20:37:00.487975
133	povcoco1psvrjvw0agwunye6ny2c	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	577345	Uqne62zzitG/Dx5AK39gXw==	2020-04-18 20:37:00.52641
134	u23fga4u6sf76mdmqp3qswcx4276	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	596028	wJrqriM/JV8t18yXVH3+pw==	2020-04-18 20:37:00.560541
135	r2wdm7glmvtqnnpirjg8x73oshm9	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	627896	Gsawh0v71Fgccj3laiueGA==	2020-04-18 20:37:00.593073
136	llo2o0ap8lyybddw4qkq3qbivs5e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	563383	o8Z6o7/Oqqx3YUHeO6f0eQ==	2020-04-18 20:37:00.631374
137	okpqh40idtw06953s0t5ekq8a3tm	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	529108	7DwjmBfJcf8ufwhqTU9pdQ==	2020-04-18 20:37:00.66605
138	zakucmjelizsgryankbwwwvc6bzy	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	560632	47whB847mG1Xw/13iNqPaA==	2020-04-18 20:37:00.700773
139	ut602xy1cjqojejo0mmsuru9pc6z	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	613816	u0S/aBwBAxWZAcdBN+ahEA==	2020-04-18 20:37:00.738416
140	yfr2mbnnvu4crvzrvzuwlcozdyoq	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	577345	Uqne62zzitG/Dx5AK39gXw==	2020-04-18 20:37:00.772772
141	vzwnmqbajn2jw1ltl7o2tfptclag	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	535791	ZQZEDnB0cXY98Te1zpWicw==	2020-04-18 20:37:00.814345
142	cqt0pjpnqa622ylnj3ihumzb2y8n	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552298	L5oscuHE3hbhKmqLCbfQXw==	2020-04-18 20:37:00.848045
143	1opln8evi4w0xat62qj734o744ug	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	610101	ggj3KKJxRbtEVdsZIJeHFA==	2020-04-18 20:37:00.882723
144	ew7r9v2qhpcg9izmyaij3spv5ose	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	613715	2UDtK81It658Hd3J30ZcEg==	2020-04-18 20:37:00.924839
145	8ekdzqrw259a4lzy9h1ej4s3fu1h	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	541176	rHPc1tf6fLxNWfwTKwBeHA==	2020-04-18 20:37:00.960495
146	8051b5y2gcgh2hwwu4ionrlvb7aj	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	559677	gS50BjR2RJNDNM2gzQHuzg==	2020-04-18 20:37:00.993665
147	x1324fx7gvcqb2uykhqy4bj2f86w	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	529981	jtXSrfI81RtSyp+TqyNzBw==	2020-04-18 20:37:01.047631
148	3w4h4or8kosvag9q2aihny6x33zb	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	634513	2Wwd3qlE92kMEE7XWHk5kA==	2020-04-18 20:37:01.079678
149	pkzzz75tuuk2hkdpzdpaenezkep6	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	515135	G4eOKA5MiBbK+0m2BDa/Xw==	2020-04-18 20:37:01.121532
150	uss2r0n2afhumn84qjjjez4b8670	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	554910	UQxRG6QpQ525F7cJyJ0eaw==	2020-04-18 20:37:01.154444
151	7tdd4328dzuhep1ztlxswtv1sz9n	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552416	+/UnGslR9gOO8ZlA6OdPXw==	2020-04-18 20:37:01.188459
152	nvaiej7twhog0gvaeojtmj7jnfu5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	593002	gvakYb81aSRjCSDG4Z6CUw==	2020-04-18 20:37:01.227466
153	70xrzj0xykfgjunmhdwnsnpflh2x	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	571869	z4wkoPTA/M9iccjfcRpTtA==	2020-04-18 20:37:01.262574
154	8bcf6v6gbt4e50zwlqpctbitw0th	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	655773	cxvFeMSviZVFmAXt9b+egQ==	2020-04-18 20:37:01.296928
155	2h090t187i9d1db1irt6inwxo9df	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	502006	N2J86WBfS0Ity6nADpjCUQ==	2020-04-18 20:37:01.336107
156	uq1qkoic73tk5af7znmqwbbzk10q	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	606075	P7Y5rH+YgEqGt9Q7WcJBrQ==	2020-04-18 20:37:01.379096
157	lsl98lap7tyctjmtcpoh65l4sg5r	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	561676	zipDRjChYUNdviK/aU316Q==	2020-04-18 20:37:01.424034
158	052g1iq7w747983wi2rzp5z2gids	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	595316	HZlxeSxvUZUC6MeWomZgEQ==	2020-04-18 20:37:01.464054
159	nc8akjucsef03pqftetelw9uc4vq	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	472078	4hQysGo1e7KBBo/83kDulQ==	2020-04-18 20:37:01.496527
160	afh562kmawcosfoyo4skzn627ewh	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	522109	l3yna27m9zi0MIVzzlfxWg==	2020-04-18 20:37:01.536766
161	p7yapegsrnfw4qmzrakejockkp0f	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	571869	z4wkoPTA/M9iccjfcRpTtA==	2020-04-18 20:37:01.572597
162	vrbb87b2a2ypguxc9v29liidmfxe	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	572585	ugug1HLeFfiqfkMIcqPySg==	2020-04-18 20:37:01.61502
163	k68gvbqpacez4skr4f1d522tzjww	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	591059	kLQ1zcq7aKkrF2v1a1QllQ==	2020-04-18 20:37:01.652656
164	cumljk0bxuhvwm0n07ytof7jz0bf	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	533756	hLQPYj3GWZzisAJrfFSSgw==	2020-04-18 20:37:01.694803
165	rrnb50tkrsbzbpp7csmjr78z7n4i	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	515135	G4eOKA5MiBbK+0m2BDa/Xw==	2020-04-18 20:37:01.739549
166	k5eurev6pdkebw9eh6a9v67xe8ve	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	481385	+B3xnp+/TiHyp9KwAeUXDw==	2020-04-18 20:37:01.775043
167	kp3o2pugrrmfbcx1p00mcj03wapl	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	592797	G/aChbkDYPhvsCNYTcMQzg==	2020-04-18 20:37:01.819322
168	t4td7mbba24qm6xxwce7vaht2hii	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	587872	eEhluj6EO5CwrvNv+iDt3A==	2020-04-18 20:37:01.860709
169	75h17e6u12v5otftwmqejvmf5oew	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552380	NFWBkVyPshvUe6dKCfikrg==	2020-04-18 20:37:01.892983
170	4jcuweqevuzfuoch57drwr3euukc	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	535791	ZQZEDnB0cXY98Te1zpWicw==	2020-04-18 20:37:01.936648
171	j1kqcnha6rm0jhefpjuv2mir65s3	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	526936	4yjH89A5bHEsX8NgBM25Xg==	2020-04-18 20:37:01.985461
172	shgovplq3qpp8asmu816qnmmuim6	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	572507	wjPfp3siObtRLQbAHklsbQ==	2020-04-18 20:37:02.035221
173	9fq3xlexhlarmqssxqqp1qqbu7v2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	571212	vifTFbHVaTcCcCApgxDw9w==	2020-04-18 20:37:02.068844
174	ddmd2ffcl8myutap7w30bp8xbbh5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	498621	tSGeWueipI1AHHBl+7eQVg==	2020-04-18 20:37:02.114034
175	f072k1u2ftr7wj000kvfmfwywrax	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	464374	OnInhw5UV3OetB8KCzmZ6g==	2020-04-18 20:37:02.151395
176	l5h54ty9l1g1oxwn2o6qzamogkkf	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	600491	nX27ZsQFqWswoabME9OEfQ==	2020-04-18 20:37:02.185395
177	puejvz643l0ih1vs6m0qimqjjzru	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	515247	iAsL5LUaK9cZ2Q139/NTIA==	2020-04-18 20:37:02.22683
178	ezwcnrwme11dni3d4trvan35xygo	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	531564	D14nidpSjZdh6RyPgMDm7g==	2020-04-18 20:37:02.262251
179	jmyfozrvp2uwyytiz7q9bhnnp3wg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	497385	TDSVbz6X+JBbEUaBEmYckQ==	2020-04-18 20:37:02.2944
180	dx4eou0np7h7t41rwoqjnklz3e4y	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	572023	Alg06bTI6FYRTFTxpTOoAQ==	2020-04-18 20:37:02.340083
181	dtmi8l4ft8uwunmxij0hpq4bwcdp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	657834	KYhYBNw60y3WDf9lf4/xXw==	2020-04-18 20:37:02.374785
182	nc5mlz5wrk6c48kp9gg3p0wtq2bx	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	609847	bKgAFfkweypjmcEPpkYlwQ==	2020-04-18 20:37:02.414765
183	ifbkbcuep83gjdzim4oksf5gc4h5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	590254	JTkfXh+uIIXe+7U7F82kcQ==	2020-04-18 20:37:02.458824
185	r23jl04c3ugedk1qgfuudh1wgkak	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	582168	CsiLlO7ijJbi3sY7IdjMxw==	2020-04-18 20:37:02.541525
186	bco43bp8tsfdukkd40is9f2g1g8o	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	519842	3QlBFn3fZLv18LY3SeAH4g==	2020-04-18 20:37:02.575673
187	yiv45wn7j9vz5ddsi0cnbq3zi3rs	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	600320	AT0bX2jIwzbCBLZLGQRZng==	2020-04-18 20:37:02.615131
188	5411zlv9smn8rx924qhksaywshpp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	504332	+ifg8GgFqsad3oOLvLCFUg==	2020-04-18 20:37:02.652864
189	z7amzoeaj5uaj7uzvsbxwrty0u5g	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	553317	IiPEYsFsimr9l9F4d8UNhg==	2020-04-18 20:37:02.684678
190	13sg4clrljngbzqb6084rvnua6ur	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	561342	E5M/EGBiqdlak9TkyiSW4Q==	2020-04-18 20:37:02.725422
191	73q2mc2orr4h4ip7cknn3pxyhrp2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	472078	4hQysGo1e7KBBo/83kDulQ==	2020-04-18 20:37:02.763341
192	ahh9kjq7gi9z7th8w9e71jdsftpw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	546483	AUc16+4jZy1HrCUhudMc0A==	2020-04-18 20:37:02.797737
193	l8481k6vflsjjb8hgus8lo0eq9qc	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	492448	FSsGFB7MGdKTO+uXWHWsew==	2020-04-18 20:37:02.84235
194	sbdyvv9dkz293buw288w8rg2vy5u	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	504619	HyLTosDSVVaxudQ5eTIdpw==	2020-04-18 20:37:02.881055
195	hqcf3138az5ih56cyqpig7ri6gwp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	546596	iPbnGuHluHPFKzi3hoNdAA==	2020-04-18 20:37:02.924431
196	bww50hp07j95j2w4rytmefji22m0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	600320	AT0bX2jIwzbCBLZLGQRZng==	2020-04-18 20:37:02.974546
197	qb6r7j67fjt3s1jvj2enamwt8xe1	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	519842	3QlBFn3fZLv18LY3SeAH4g==	2020-04-18 20:37:03.039188
198	ndc78b3k1z185q7jxmkxa6wxaahi	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	544745	PnU3TDHYjRqVMhig9MxxsQ==	2020-04-18 20:37:03.072377
199	rkjt1htwrohbknwdp9g2tj6sc3mu	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	550286	3jlJiT08F4eLXG+awFER5A==	2020-04-18 20:37:03.118293
200	330zoszzuh3k7ejnlx2wc2dmoe3x	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	628142	I6OAVAHyuOnsWU2pLep+QA==	2020-04-18 20:37:03.166897
201	1o7redmece9jbu1tt6bbj9xwudal	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	542993	+FU6fJD30xv1tNxf39lJBA==	2020-04-18 20:37:03.218578
202	kkng6frpvmi8wm0krdenmxp1yl11	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	571869	z4wkoPTA/M9iccjfcRpTtA==	2020-04-18 20:37:03.261092
203	1nzjeeepjibzl4m2u8ysddcuht4s	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	472078	4hQysGo1e7KBBo/83kDulQ==	2020-04-18 20:37:03.310068
204	69ehu6aqy9lhro4a602f7ju3ud5f	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	472225	WOOQ6Xpi9sE64QCWmoykzA==	2020-04-18 20:37:03.367308
205	038uwgm1kbgqkbk6kmcrirck1xti	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	538259	jByDfqkaEefmS05IA+XMIQ==	2020-04-18 20:37:03.414555
206	683iior9r64facw0120i8zzt4bpo	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	617366	i9UU9TF672hUQkLM4NucAg==	2020-04-18 20:37:03.46078
207	svesm5zureqav44u45sk5lhb0s8y	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	582668	D4jBfv4wdzcCxR0Hby/aGA==	2020-04-18 20:37:03.50528
208	s5ifl6tw87q35wultc7u9z6xgx7g	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	519842	3QlBFn3fZLv18LY3SeAH4g==	2020-04-18 20:37:03.579459
209	413gowku8bx39xehobqift6kzume	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	609031	4f3RHHhdqQXZopa//BB1Zw==	2020-04-18 20:37:03.628857
210	475brplqtfiwts6x213b29fojl38	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	625374	9PcBWhRQ1kP5LtAQVIF4/A==	2020-04-18 20:37:03.677867
211	i01dx1gksrf0tvj9j86r8yzlvlnh	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	589736	+VMc5ozirJl2iKZ2zOhqvg==	2020-04-18 20:37:03.72663
212	2mpxqncvad3infruwsq17vxbbn78	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	411624	HWPDeAbFIJ9VSwnQINpR8g==	2020-04-18 20:37:03.773695
213	itld66qfpcc7v28zjxmnrzhdmodn	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	478351	+pk4yZW9oXMH7KtGQo/LtQ==	2020-04-18 20:37:03.816521
214	p1r2x1qevzx2f8xoh19hno6melcs	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552486	u29/3KnStfym5nCdZ0dgkQ==	2020-04-18 20:37:03.860696
215	ej1ojjtozgu16xc06g5flc83borg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	552486	u29/3KnStfym5nCdZ0dgkQ==	2020-04-18 20:37:03.898021
216	x792sf9808rfc8t67v7hr5t8j1wo	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	469479	5caJHhKPBHz9FsIGAVoIhA==	2020-04-18 20:37:03.946329
217	75rhncs0xzqhq3fjaq8ng5dsavqm	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	536056	4VbQ8xHpQpOKuG++4tvrdA==	2020-04-18 20:37:03.990789
218	gm1k54132oy3c7ik6g0a9m6cyars	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	597295	EEMDEIYcPc4PEcxkzQJPKQ==	2020-04-18 20:37:04.038621
219	beqgh8a93p99kz0jwxvpun4ozb1j	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	550934	DL7iZ/kbx2UtZJEAFYjpgA==	2020-04-18 20:37:04.086042
220	jikn088uv52aahziuhx4wkaulnfp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	603763	TXmNPRSSFkXjl3wiyOU49g==	2020-04-18 20:37:04.154823
221	uj5kfi574162phhqo9h01d1gu1zk	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	578311	hBEOwAVk0xWr4OKiPR9j/w==	2020-04-18 20:37:04.202005
222	qwfxy979gpehr3890cec328fto7b	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	562314	Dy1tYbHDYHvkuS5QXer2bQ==	2020-04-18 20:37:04.248601
224	z8kpibpl6ghihpwtk965sbz0r9y6	photo.jpg	image/jpeg	{"identified":true}	559787	6u0kI7pPzkfssbnbKI85og==	2020-04-18 20:37:04.343688
223	01nt181065tu4w4gqum3dc2xkt02	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	632161	zDH4+DUK+aQgecxF66Nt6A==	2020-04-18 20:37:04.296588
225	66tkapd2v566ggh3ebc9qgf4kib7	photo.jpg	image/jpeg	{"identified":true}	429829	c/3YtapllMupCNzrwsugPA==	2020-04-18 20:37:04.385608
805	zj3clkozr9g2foltlzb5zb25r1af	photo.jpg	image/jpeg	{"identified":true}	4306728	et+4prkLzLbjgu18iW/hdQ==	2020-09-04 19:56:30.90713
593	i4fltkuzm9ezutl1hl3aws7hm9y5	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12052891	LjXR5YQvXWHwE9o/G7eurA==	2020-09-03 20:46:42.279863
594	cabm5m4tny5cubxfn0tyvmzteq6q	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13538722	0mcAdCAt6Abi9GOfR/Ehcw==	2020-09-03 20:46:42.439646
595	f8eoggfp4ki65o1nr91re6abd8jx	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12668967	ixSpkxhrXTpgjS8D7FKHTQ==	2020-09-03 20:46:42.598308
596	1enu8idag7fhbz4jsn70qp7xr4w4	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13137960	7be5UvsIgpXi1TzGvb32EA==	2020-09-03 20:46:42.809788
599	2959cu4hobk6atn4t7ymddfc265o	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11885364	SA9ncu7edKvB377IxxI0cg==	2020-09-03 20:46:43.282
601	4jqsjd09nhkwy01aaervldkz8k8c	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12420724	SmU2xzRCT1TwL5JLFHmGag==	2020-09-03 20:46:43.557355
602	phajc7ggwfbnv38asi6rrhsavhfc	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12708044	a98Gwpfc0vcOtVP17fn6nA==	2020-09-03 20:46:43.785283
603	041ob7e6mojtbsmqyyigwziun6q0	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12629203	Huu9d1CMSEG5qGH22ouPZg==	2020-09-03 20:46:43.914808
756	5yg6uobmbwoj2svz686s7dh459hm	photo.jpg	image/jpeg	{"identified":true}	12509382	TESEbmSX6K+Ma6Qo6v1M5g==	2020-09-03 20:47:08.137712
276	c2gi0husx7443o6iszh47k3owbzy	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4693832	E6FVyTXXYZzb1vpsZXcqFg==	2020-07-05 20:03:40.725012
277	61h2j0nck5fc3vw8b7ym4hskblkp	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4848581	Kh0cxeN7E6F967ldXgGZBw==	2020-07-05 20:03:40.789325
278	84opfrji694amu1t00n118vhciqa	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4643995	d1XXjjV+jDeq4JtAcF4/0g==	2020-07-05 20:03:40.866124
279	305mdyvttky2ac5nrtsm85xgtko5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4767903	RoGbtx7pwPuQJ1FabhlHNw==	2020-07-05 20:03:40.960444
280	axau9m97fx86m7ein9w6mwiwizky	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4679078	EQE/dVjGWn0FbLxGbMfEeA==	2020-07-05 20:03:41.05481
281	g2pas66ka8wyi1ly8awe17drgbx7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4275765	Dcufvr0uXude0xsWFqEITg==	2020-07-05 20:03:41.190867
282	iv3pym4t791t17d0ildp71sivc4u	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5600939	tyTxlIQ+ARhY5DTVcVPFjg==	2020-07-05 20:03:41.284195
283	8oa4tny7judlx5bhqpxxaov4w9cl	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5413726	76Dwr5JwRisuFm0w8GZYjQ==	2020-07-05 20:03:41.357189
284	nvu98bvbx6s1umg0cnnu7fz8z8l2	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4854774	ancT1iFz2monLxOwvEaqpQ==	2020-07-05 20:03:41.423575
285	vltqrps953gep2ru8ycnr3crj68e	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4809823	T31W3sGduTCVZxuBUjK+8w==	2020-07-05 20:03:41.484666
286	jafrk6eu9d32jbr652e0a78cpy0c	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4324273	AP/lLL2XYukKYBZIR86xaA==	2020-07-05 20:03:41.545452
287	j1uuwgwm2fsgurm9cqyzs2kpz4n1	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4607654	nBsCc2Bnr5wAcFF81yk1MQ==	2020-07-05 20:03:41.636316
288	1wyqbkaygcu7qwru9oj3zhkjuefj	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4774001	fHxoOiuVnttxhpezfNA9BA==	2020-07-05 20:03:41.769871
289	y7judvp30fmj0pciybgt43t2uy4y	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4645728	1VG6ZHME7ZYXMCZokiNefQ==	2020-07-05 20:03:41.83293
290	p6h2frcmf49t065e6wo4ee752bt7	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4829016	GSYA77VtxB9Bmh5D0qvvgg==	2020-07-05 20:03:41.896639
291	wrfd4w419z51f1ngl8usiwg5yq6t	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4333740	v7Cs6SF6AF0kMKo5DVo96Q==	2020-07-05 20:03:42.045949
292	qtub1vcm42b09e0gaq5q9ttxm970	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5536399	2hmGiPhdJNOSzODbdT3X7w==	2020-07-05 20:03:42.133367
293	7e4q86ipqp3xb4330ipq05o7quig	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4134239	E2roZsPWgX6mAZSZy/dVrA==	2020-07-05 20:03:42.19335
294	rbmawxv8tr1tzx1g0bep4cp71cpf	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4676385	XNh8c6QjBnx44CCyolEQQw==	2020-07-05 20:03:42.291788
295	2ql6fu0gv5sz5sozr9h1nqcdn78q	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	6188662	Sjk6edMamx1kE0JBEbj19Q==	2020-07-05 20:03:42.387969
296	74uq8svd58sabnuod109hsyczvly	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4520064	a0kn9bcuFmB6j38svx2q5A==	2020-07-05 20:03:42.454889
297	ejurawkpbxfcryksiqau19go9mz5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4673690	2EQ0JdfiWbNDBGaHVMTwQQ==	2020-07-05 20:03:42.533717
298	gf1sm965zafo044xilvnk9n86zva	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5941477	zf9ILpCskOQ+Yvn7cxQkJw==	2020-07-05 20:03:42.608119
299	pwphls93uy3mrudxhpp8a4yrt8eg	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4690436	+vpgZ7VKgYXI/60wT5c7/g==	2020-07-05 20:03:42.683401
300	q8ykj6v8x1d7oq6e9z3sfogzwnp0	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5099648	uViCxZQghl6S3FpgKevxOg==	2020-07-05 20:03:42.768312
301	4altts72gvgesnxae24nzj9b0nty	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4854867	2vKdbQaNdTjB3WdJ2qUh2A==	2020-07-05 20:03:42.850746
302	uq522tjcc9rmmv80oelw4e2wuqwj	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4592453	Na/wIUsJkYpmE6vpLjbIwQ==	2020-07-05 20:03:42.940998
264	ukjqywkz6o0e3k93zi440ros17i6	photo.jpg	image/jpeg	{"identified":true}	4841578	73PzXoygujwK69NeSQ7cxA==	2020-07-05 20:00:25.224666
265	eufdx47h6tke5z51fxlywgrzlscv	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4801202	5iKz4VJ9uyLqlIjBF8MKTw==	2020-07-05 20:03:39.895543
266	86qoinmhze2ho030b0dfjen5harh	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5715053	cDmRrOKZxqwtJLGw++KHtw==	2020-07-05 20:03:39.980381
267	nrl4trdm5xiq6ziw64zu32g9d8ma	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4606935	jN6ysWnla2cmY6RhKlok5g==	2020-07-05 20:03:40.061343
268	rceerao34q0byks7hveb28yaq99o	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4610947	u4rYGubV6o2N5gQgB4K+og==	2020-07-05 20:03:40.165094
269	uybfuq4y7mo2kmm8qhofucz0zczw	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4450520	aswPFlIWphHlJi4kLhd/LQ==	2020-07-05 20:03:40.268365
270	4fmeii352e3xbgez98j3ml0qqhq6	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5155719	JNZ/waKeQ7gZQ6EgRUbt4Q==	2020-07-05 20:03:40.332591
271	k2512uzb19o7k2l3xsnstsuky85r	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4584128	aJhA9IrfBq+qF+8ePLv7VQ==	2020-07-05 20:03:40.404256
272	44tnwie8splkjr3olk9jhy4fz0uu	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4700980	0OJszAZwvOSGuyFI2if57A==	2020-07-05 20:03:40.457812
273	6onoqodpp6lfzw04h4g123uvw1g5	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	5050831	fFfkn13fjE1+xxI2mSZWjQ==	2020-07-05 20:03:40.518919
274	rmaj98jpdvemzvos8vd2ufdycr16	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4657756	tzt7B8ckYCGvFf6yhn7vBw==	2020-07-05 20:03:40.583109
275	10x0x0s9la0ramf29jgpv2gb6f8a	photo.jpg	image/jpeg	{"identified":true,"analyzed":true}	4863717	Vh28nM5y5HLy7+C7LYJwRg==	2020-07-05 20:03:40.646704
303	x4d5q9sb4hu7wfsljnila7z5sivl	photo.jpg	image/jpeg	{"identified":true}	3886187	mYw+3f2/vpnT3cEdlUvDwg==	2020-07-05 20:03:43.027067
304	n4drw607bctfenkjjz41j77p3i3t	photo.jpg	image/jpeg	{"identified":true}	4841578	73PzXoygujwK69NeSQ7cxA==	2020-07-05 20:03:43.140573
305	rkh8ffsdlfarvz2wkk3b5arwhzat	photo.jpg	image/jpeg	{"identified":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-09-03 19:26:29.494057
306	qmibkqwnb939884ijgb60bg5k27t	photo.jpg	image/jpeg	{"identified":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-09-03 19:27:58.970537
307	ltcf36x5bg8hw96ev2zfakbc2pq6	photo.jpg	image/jpeg	{"identified":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-09-03 19:28:25.510985
597	gj4xiyzgpwfma1pctkm4r7fmxvm7	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11809878	RFABai+n2SRFlFMmHO5kkw==	2020-09-03 20:46:43.048642
628	rv76sx4k3klnhm0q8g0ueo2vt4te	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11943255	qRDatL6RoiBNv6qrNgHBFA==	2020-09-03 20:46:47.836841
632	p9fcn4elqykd8jruf7tf1g1hjae3	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13071236	laGti68kLczzhmx01zjXZA==	2020-09-03 20:46:48.518042
641	pc0evspe8imivws4tddvc10kelsk	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12411159	tHs3DmFUxVQS69LW7yQhsA==	2020-09-03 20:46:49.857791
649	752h6268vkmhepwdyqd4eaf7mc0w	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12747280	3wBnNYk5STU/AN6RRIUGXg==	2020-09-03 20:46:51.122232
758	rkisoie2gbl76byr292br9xv15my	photo.jpg	image/jpeg	{"identified":true}	11753536	5Iv6dS6a8cOhcPkJ81sDXg==	2020-09-03 20:47:08.519948
759	tkvchyp0xu9f4ksdo0xgp3sfsw43	photo.jpg	image/jpeg	{"identified":true}	11557945	A/G04p55vI41iEUr+V9OcA==	2020-09-03 20:47:08.611335
760	26ovkya4xsonleikb4hgmrwtbtdz	photo.jpg	image/jpeg	{"identified":true}	11715658	6g4syMmEvOYDEP1gAMWpIQ==	2020-09-03 20:47:08.694323
761	ivtfy7ltfjg8wrpgmr1w5s2cne6c	photo.jpg	image/jpeg	{"identified":true}	12204006	9QHpq1IoXMoP7ME5WbOhjA==	2020-09-03 20:47:08.798998
762	g2nfz26oy6hxa091yxgbyyv64b4p	photo.jpg	image/jpeg	{"identified":true}	11088441	dqylx4tLa8xhsCmfJ8RxBA==	2020-09-03 20:47:08.889242
763	qglexs8wwksrxrryg6hgah6jdrpl	photo.jpg	image/jpeg	{"identified":true}	14671113	mpXJccG4Rz3sYTSlz2Dp2w==	2020-09-03 20:47:08.995679
774	zqxt7nxva8qh1hmgxonmfr4lv3qw	photo.jpg	image/jpeg	{"identified":true}	11930470	f/YQQfbRp5C23/HJRmXLrQ==	2020-09-03 20:47:10.487095
775	zin606hdicnn8vm48n2zgohjjgpo	photo.jpg	image/jpeg	{"identified":true}	13008013	kGUZwfls2bkw0t7pduOI/g==	2020-09-03 20:47:10.586857
776	93cfp191a45nwxg16vnt50c5voxz	photo.jpg	image/jpeg	{"identified":true}	10851240	vMmx0DTtG3/sFpBCG7eOxA==	2020-09-03 20:47:10.715165
764	7hfnew7fy1fz9f8wrdasfofav9w3	photo.jpg	image/jpeg	{"identified":true}	13199274	ky+po13EVImC0Ea3WX2IeQ==	2020-09-03 20:47:09.302989
765	3n00avtawhx2xyfpc8pcenwvbvae	photo.jpg	image/jpeg	{"identified":true}	12335782	aqbzTzc9QO7V270Jp7JhLQ==	2020-09-03 20:47:09.427866
766	8fmd7za9zi4irpvgad0nurmqqk2l	photo.jpg	image/jpeg	{"identified":true}	11285667	k5CddUZzQSrn+95YPrM+sQ==	2020-09-03 20:47:09.51879
767	mwve6h79gzo9lv8uyhpq46xxiq21	photo.jpg	image/jpeg	{"identified":true}	13577225	uZ8/Z2sPvhIjGhvT3ftuhQ==	2020-09-03 20:47:09.609441
777	i39lp88c9xjt5qs1sjaan3c2ibp8	photo.jpg	image/jpeg	{"identified":true}	11006336	4K8aIULMnf8y3LQpmz0Yrw==	2020-09-03 20:47:10.828106
778	gjbaqvydvp8z0w65ddmi5b93v7aq	photo.jpg	image/jpeg	{"identified":true}	14154706	9zLXM6zlqmbeiPbaC/LH7w==	2020-09-03 20:47:10.973488
768	5gpnsxuupqpgzaxjurg53iqzwby1	photo.jpg	image/jpeg	{"identified":true}	13055461	KfVs/uNJZCNC4JTT25GCJQ==	2020-09-03 20:47:09.705219
769	up03p89rpnz9txx6cri1divbeoz9	photo.jpg	image/jpeg	{"identified":true}	12411159	tHs3DmFUxVQS69LW7yQhsA==	2020-09-03 20:47:09.79467
770	u9hcltpjk7im10g23qcneq1fwi39	photo.jpg	image/jpeg	{"identified":true}	9178021	Gz+ON5kwxOJB/Zv2h4ARNg==	2020-09-03 20:47:09.895608
771	05lacnnwosg485kd4yzxp46ghd2p	photo.jpg	image/jpeg	{"identified":true}	12950270	lcwrH6OjRuPeZcs0FE7iWg==	2020-09-03 20:47:09.99658
772	82uwob5vo0j5mpmkausd2e03nqhx	photo.jpg	image/jpeg	{"identified":true}	13442173	Il6D+gHZqE1IBvvgxq09Mg==	2020-09-03 20:47:10.292297
773	dy7vmg00jjdpx5vbe753dcxgok4v	photo.jpg	image/jpeg	{"identified":true}	12400237	RSD77HVeiC+0lmy/7fdoIQ==	2020-09-03 20:47:10.397305
779	ixg5od0buehdnmunnaa4zb6y3r5h	photo.jpg	image/jpeg	{"identified":true}	14264827	9sWU+89qPvwxJMfPkjsgkQ==	2020-09-03 20:47:11.198455
780	rrkx74c3kro4coxi94euu0n2k3fz	photo.jpg	image/jpeg	{"identified":true}	12859050	t1jV5fYfSl/qi/q7gps+hw==	2020-09-03 20:47:11.315398
781	dpnl925tf1fhq4pjy3j2gd8juvfx	photo.jpg	image/jpeg	{"identified":true}	11669153	MGXBMP3vRPJbRW5bwbZJ2A==	2020-09-03 20:47:11.440106
782	i2rtst6klfbz9as8baz3ay7lhokb	photo.jpg	image/jpeg	{"identified":true}	14132098	QyymjZ1R0Ij6WFdD8nkoug==	2020-09-03 20:47:11.581798
783	pgdu5uvywvr6j2md2z8sjde82cy1	photo.jpg	image/jpeg	{"identified":true}	13228383	VVIIqoHlnJ7oML3GNIBFng==	2020-09-03 20:47:11.829209
784	luqjcsgs6hgzgnugnx0r3ofe7zxc	photo.jpg	image/jpeg	{"identified":true}	13105019	omQDgVMGQpUg1t72uFMs9g==	2020-09-03 20:47:12.035726
785	a1rjmc88pqzr7xft87o2us2wlt96	photo.jpg	image/jpeg	{"identified":true}	14148755	jULwvDPVF3Dfypp+oCvVig==	2020-09-03 20:47:12.145931
786	h500qtit8sawdqg7a511rljml73g	photo.jpg	image/jpeg	{"identified":true}	13351969	ygAbbLJGUgC6mRR51sywBA==	2020-09-03 20:47:12.303167
787	144uyabzoxqobqjhfjzvc81cz4m0	photo.jpg	image/jpeg	{"identified":true}	8924293	NVmFU973wgkeQZmWn0r9bg==	2020-09-03 20:47:12.395007
788	iqrm00dthku23n4tgqjpzcckybmw	photo.jpg	image/jpeg	{"identified":true}	10772965	q93KwY2ne26eykZbhZv4WQ==	2020-09-03 20:47:12.48449
789	cnnu7p6o7vrv9sblae8sidfv197s	photo.jpg	image/jpeg	{"identified":true}	11796734	bZI7wf1W9pgQphCBAahW5g==	2020-09-03 20:47:12.644844
790	uz1autyadme2vvyyilvmwbxy6i6w	photo.jpg	image/jpeg	{"identified":true}	11344943	JHgsfu6Yqv3fb8G7+R8ZpQ==	2020-09-03 20:47:12.808902
791	di2efu84neo9urlj8wtyas63k043	photo.jpg	image/jpeg	{"identified":true}	13247017	h4yaYymKznKx9W/1iJJM/g==	2020-09-03 20:47:12.948711
792	8ac1t0ra34u094a35xg0uxwb8icz	photo.jpg	image/jpeg	{"identified":true}	12055149	D7zT29Pm/dZLNPhMjXHhXQ==	2020-09-03 20:47:13.079434
793	ro2d8ku5cru6se9rwvxnvid62rr9	photo.jpg	image/jpeg	{"identified":true}	12946604	jWr0ECBPJI1b8YvBSfEgnw==	2020-09-03 20:47:13.198323
794	zkbigv3bzqbk7cojldcf59xcze15	photo.jpg	image/jpeg	{"identified":true}	11921188	sAB5iRttNzh3P9Sxh4wrkA==	2020-09-03 20:47:13.299143
795	zqfnvebx9gq5a8fleo3xdz53u0ak	photo.jpg	image/jpeg	{"identified":true}	11167384	2sYyZHudHV85jzY4JdgcdQ==	2020-09-03 20:47:13.528014
796	hhn29k3vov16dzxj5cvqca8np579	photo.jpg	image/jpeg	{"identified":true}	13361673	QinvJYlDJdDWbVE5/hnw0g==	2020-09-03 20:47:13.643352
797	er23j3mhbui1ydwzguwubkoyof31	photo.jpg	image/jpeg	{"identified":true}	13361673	QinvJYlDJdDWbVE5/hnw0g==	2020-09-03 20:47:13.743498
798	xyd9cfl1kvlxngu7e6iwsf29unsg	photo.jpg	image/jpeg	{"identified":true}	12020426	ACHpDZNMsm/387VODXylJQ==	2020-09-03 20:47:13.884648
799	eaxl1m62zng4walt8mk7s19bqo4t	photo.jpg	image/jpeg	{"identified":true}	12287076	x0qXVG+Wt1zREiQmXXS/tw==	2020-09-03 20:47:13.985371
800	c0rejsofdrl9q471i4lo0ilh1tlp	photo.jpg	image/jpeg	{"identified":true}	14520711	PoE1WzseYCpvAgNr0D85uw==	2020-09-03 20:47:14.080262
801	gagkq7siio7yg1jy47l4ao2wi31o	photo.jpg	image/jpeg	{"identified":true}	11167384	2sYyZHudHV85jzY4JdgcdQ==	2020-09-03 20:47:14.350431
605	9yu7nigmdv80jv3j51kqbdb05397	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12193084	/4DQP3TsPqRzHKRW4KpmhQ==	2020-09-03 20:46:44.156455
606	m0ho6rpetf8vnut16keiwufbbops	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13685498	DenPmMXSexbQL/PFbnYgRg==	2020-09-03 20:46:44.269254
607	q609aq8wfn39iutwpvo5acar9j64	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11506557	ZoDu+PjH81P6sUyGlQOBAQ==	2020-09-03 20:46:44.406783
608	cn2naql8lpzhxl3zxmgfsi3mnqmw	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10950151	0OvxwsBEbmM4MzTsYXhjrw==	2020-09-03 20:46:44.645308
609	pu5hwj69dy0smz6vcrv5uzyq5p2v	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15254222	Nx4uTs4Tm6QQ9fIlZNqwYQ==	2020-09-03 20:46:44.757182
612	n28a5sz4zmpvf8jzs5gldne9t3ep	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10022485	fmsSiiMvzH+72/AzYeqFGA==	2020-09-03 20:46:45.201939
611	b78b5da2pnc25u6x84s26onvgy6o	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11952530	e3O5CArBNgPrkqxomOXazA==	2020-09-03 20:46:45.094491
610	jta9zpljy4vy24dtk98e7s8ezrid	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13485877	EXVSnABJfo83koUaQvSZSw==	2020-09-03 20:46:44.970801
613	y17v7eb17ksfh0zdzz81ngkwhqq3	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11333384	tvgfv6pBFxJ8ySOWO+Oj7w==	2020-09-03 20:46:45.422452
615	edr25oe7cnd7gj4xgltuqhql26mq	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12879651	CTgAGEwVcyqVXIFyrTL8ww==	2020-09-03 20:46:45.625398
616	65akdf5xioe34agbzamggapozxna	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13023633	Kajcp8zKICv59x+yFj/EEw==	2020-09-03 20:46:45.753273
614	yy85zqegckc1ifukaq1dilbjlyqm	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13920397	8FhNdbM2MdO5ZvI8wk1zZQ==	2020-09-03 20:46:45.511852
617	muaewogeqo97t2svi32aulz5buzx	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12172660	yK8Mgy9A6XdhNNjJOMr7dQ==	2020-09-03 20:46:45.929544
618	scgapi2yv3p5ul70x015eex6obd0	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11706862	6E97KPpLvtKNmbxnBWB5rw==	2020-09-03 20:46:46.192591
620	r6aq9psetivhsr7ckw5khxqjf4f5	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10838014	158IxlC7lXoqlBA9LniGiA==	2020-09-03 20:46:46.560555
619	ya3ahq1iioc80xu9nq9b7ci0l3rq	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12954948	+Qrbrsp3toxYjhZZtiycMg==	2020-09-03 20:46:46.429105
621	0082wu7fbueiz9bjlu1xw07zb84p	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12368301	0zbeA1WG9GUUIBCMdrdzQQ==	2020-09-03 20:46:46.71654
622	8hhzf0m4ajy5j4bkv0g3ujessrm7	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12284560	p+PX93LOYTAHzpFy75lusA==	2020-09-03 20:46:46.830649
624	98vucqv836llj2i6tx8goaaifjj0	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10935978	glN5kbNUixMn1QKDxLdmfw==	2020-09-03 20:46:47.059886
625	wqov69dhf63r2g9d0sd34nupptmi	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10624428	kJt0f00qV7ouJVei+k2a6g==	2020-09-03 20:46:47.199037
623	b4ulhfgly8cr00wey157abelmy7x	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15975273	R94NJEzU1EVSvpyC4NLupg==	2020-09-03 20:46:46.951733
629	heaxg3e907x3yaxrfhnabw2cfy61	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15995441	yrQcRV8iI3FARwJcfNjtpw==	2020-09-03 20:46:47.944552
630	o5daklgq1c2fazwuly1uc10nphc8	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12688989	tl22Wgl0UFHV9ubUd+ebcA==	2020-09-03 20:46:48.074909
633	jon4wtozlzzawups66pfhwr3q25m	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9201128	1/iD+E7EnNJIofGYomN3KA==	2020-09-03 20:46:48.642328
634	fclund8lera8gapz6siowr0cskhk	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13011790	4XrRLhi4/5XNnlg4dDIOmg==	2020-09-03 20:46:48.735193
635	q1jfcq3w2dtjqdy7124e5aevsmmm	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12708044	a98Gwpfc0vcOtVP17fn6nA==	2020-09-03 20:46:48.832477
636	75w27lfpz9bg7in0f7xhb8ns9kss	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12855677	jnCXrf7nR9/hna7C7sWP3A==	2020-09-03 20:46:48.946579
638	ixdo6bqbpxrxaanly6l8m66edxa6	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12386631	RiZKmVdZFo2CBQ5DY/xe0g==	2020-09-03 20:46:49.511033
639	rg0d9swkazglxyg5m4u8zyqmt7fs	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13132116	KleosxBubMBBvmufw4q57Q==	2020-09-03 20:46:49.624525
640	rbvdxz3ct20rtq44s6o3zbplnh3j	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13038900	9oOe+bsQ7tdaFaBVdhNZwg==	2020-09-03 20:46:49.748446
642	ng5ctg7muntiq8ja0fqug15ji97r	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11748063	uRvJOtw+ojHqdaQQWaf1uw==	2020-09-03 20:46:49.95722
643	2lud29t9haut5nwwnhfo94kj4ioa	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13538722	0mcAdCAt6Abi9GOfR/Ehcw==	2020-09-03 20:46:50.163895
644	74zkl6030xdn5hzfb608bx9llhbj	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12994163	ei0+n1DjXpIt42Jsi54/bg==	2020-09-03 20:46:50.467998
646	ls3sp09p25xokhj83mimvreqoufy	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13928676	ifzRKSV4ZvlrigggBZRlzg==	2020-09-03 20:46:50.74393
647	r9w7s1y2lo98puu610a4zmkqvm1g	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11335696	zxBfqrIVbwmcM8bai8z8rQ==	2020-09-03 20:46:50.868036
648	lqkyae5ezf84bau750zvraotgjet	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13002684	6yLwDGhZOcexcysGUwFosA==	2020-09-03 20:46:51.005833
650	2ja4uvl76thtl4kf8jvuj0u47w7i	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8836833	rgABtL0QQXzp0nwFgl1a1A==	2020-09-03 20:46:51.556732
651	5aexrgxrocm81vonfqgmli015ed8	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13440722	UDuiy+kmyM8gHhC34JTLLg==	2020-09-03 20:46:51.69821
598	v9e7t0kax8hj0id8xx4jalo7yvuf	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10484680	qz1NP8hOybvtgq5PW0y0XA==	2020-09-03 20:46:43.170263
627	6krwk99lo4roi2kwfr4b0dhy0xrz	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12386631	RiZKmVdZFo2CBQ5DY/xe0g==	2020-09-03 20:46:47.613423
809	132qn4z51jp2l4mxfmj0bjbvmviu	orange-1.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-10-14 17:04:55.026023
713	lza1ydj1s5tpk3ig96f6ggj474va	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10910934	gKEZ/z1cLzxXPCeqSjv2rg==	2020-09-03 20:47:01.930015
822	wvxfh66o3xo0unsgsmqy9j5lxe6k	IMG_0907.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11571314	5ASgeFJkdsCcVuRE/gsUcA==	2020-10-19 21:41:48.187649
825	e3okv8d6sq8lj8ohdewdafkrj4ei	IMG_0911.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12022184	+Dz1XpTK/NNvhBnOcYOZmA==	2020-10-19 21:45:00.844661
827	g7i1p06vnhplof287id2rf2ye7bv	IMG_0914.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11145877	1TIRzTK/fXNGVKMHvEnMrg==	2020-10-19 21:46:52.968111
835	5bwtdbc5thx5dvsgf277yj01an6d	IMG_0930.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10751030	PGPPvv7MBJwnZ45upVBCUg==	2020-10-19 21:52:57.929724
836	em3ktraj2bvqzll70sirzytua3ee	IMG_0930.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10751030	PGPPvv7MBJwnZ45upVBCUg==	2020-10-19 21:53:46.599017
837	fx8601vo3ih86a12m9eh6dt698ww	IMG_0933.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10999482	XaQ/HW3mDMp/bcjUymH7vg==	2020-10-19 21:55:06.279983
860	xafk8wsuencymj2pqkqci532s60u	IMG_0983.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13167485	XJG910/F4F8CyiNclTnO5Q==	2020-10-27 10:52:14.273128
863	ab7bvdrzcqbdpnm2jfjy8n80rmwn	IMG_0989.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12370867	qbCHFAlFz2KCF+/aoo8pmg==	2020-10-27 10:55:15.253
864	bw9ahp831qhtphww6jphbl1xh8uo	IMG_0991.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12606943	Gd6N0sT4F/glu7okSxkc+w==	2020-10-27 10:56:10.235223
869	g0fnfi55zvqyzrarni4ede2vqbts	IMG_1002.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13188628	EQDADyg6g5M3jRtWAG4YJw==	2020-10-27 11:03:21.002591
871	cyt9c0y62soaqoh4cg92qwe37xsz	IMG_1002.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13188628	EQDADyg6g5M3jRtWAG4YJw==	2020-10-27 11:05:42.504614
872	fzfm1miprphao0t3xz54kc3htgsb	IMG_1004.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12194921	FfKgAcj26RtKxHwGsLyyIA==	2020-10-27 11:06:55.368526
876	uzhqakq63thhapd7m8v2myn5c4yc	IMG_1010.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13229466	XH7T0i+rXdqgkHQl1C79Cg==	2020-10-27 11:14:31.60673
881	i9ysfr1dynlf0vnz75irgs2oglhj	IMG_1018.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13995555	WllURgP6Z6hxVAIO5d2EBQ==	2020-10-27 11:19:06.933686
883	rmaz1f7slk2as0r75ijztamuya32	IMG_1022.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12756726	4TcJqgW9DqtX0bQiWNeRxA==	2020-10-27 11:21:07.540441
600	y5nk5ds0if258vt17325s6encl2q	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9689040	yEqSzYTXZ554GrV1Fmwemg==	2020-09-03 20:46:43.397353
637	moway0kmmqfnoqpd1f1xthrls778	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15231837	H71QuLssyq4O44k1e4kBHA==	2020-09-03 20:46:49.286786
645	y48v6chfj87qyf672x6f0uzj4ypo	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13595190	t0oGv4vVoLiHIfbTJGIh7w==	2020-09-03 20:46:50.60358
802	35o1qva50en91hv0xkji7uyhmleg	photo.jpg	image/jpeg	{"identified":true}	13189541	r34UUBbAt/QT9KSwErYCRQ==	2020-09-03 20:47:14.522832
803	k4szs2ed3fs0b9yyg9ijb5qxf2of	photo.jpg	image/jpeg	{"identified":true}	11859973	T93dxJoEWn3uCYohQEtUDQ==	2020-09-03 20:47:14.777055
804	x92daem6nguytvlwuyxqh2jhtjql	photo.jpg	image/jpeg	{"identified":true}	10162788	7CN5oHE2iQjypawQl3HakQ==	2020-09-03 20:47:14.864372
810	0v6zfjdcygquuhvq1jqpuh6ozhdi	orange-1-edited.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	4439568	woV6Y/MU6CrEUxCafSPk3A==	2020-10-15 13:01:45.743786
823	uq0ahetq85xe1ffov7h9kdn8knbf	IMG_0909.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11100366	Z8sUnYiPSk9ws/6864RGjA==	2020-10-19 21:43:14.099801
831	ef51jjqzmrt7jc2l09j75296j2ez	IMG_0923.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12363901	YKK5rvY9AvElheH4X5HYHA==	2020-10-19 21:50:01.834208
832	phvtuttc80f8w0uo0c7ti8k2rahp	IMG_0923.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12363901	YKK5rvY9AvElheH4X5HYHA==	2020-10-19 21:50:58.542766
861	9a0k007mqki0l512g75xbno80xb1	IMG_0985.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13315951	rhtxguc7SIwJxb+5tJm3Rw==	2020-10-27 10:53:13.086845
868	ufb97dgn7hr4yicz9qlzfofxskuv	IMG_0999.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13834998	Z5yYaWI7R1P8WVzzyTn9hw==	2020-10-27 11:00:48.48852
875	vfpom2cagmrepakx0hzx28x6aai9	IMG_1008.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13762305	1XjVsjnJHDCF7T7z18VouQ==	2020-10-27 11:09:16.033638
877	oafxizdd6k1x5svp8l5gvew37d9r	IMG_1010.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13229466	XH7T0i+rXdqgkHQl1C79Cg==	2020-10-27 11:15:50.556958
878	4jtfrngsjjwfum1etbq4307r0slo	IMG_1012.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13303324	UdkmUYsPWsT4PxY6XUbgiQ==	2020-10-27 11:16:49.420981
879	hsuhfop6jbhs3lyodsslk68n8ew6	IMG_1014.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14923140	TGFxAzKpGq0/1T3Q0b2/ig==	2020-10-27 11:17:34.685092
880	unc4i28wjz5yfbpivrp8w2faqz01	IMG_1016.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14295725	ymNLNZuM9HqC5CWyox5gsA==	2020-10-27 11:18:25.165208
884	mzy6mcu08501mqylg4hphqfpj4rd	IMG_1025.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9676404	fcC/Aebf6aQ5GUcRUD1EdQ==	2020-10-27 11:22:11.363323
886	0ia6452kci1hhpv0g1n5njp5icm1	IMG_1027.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9727024	AUrKnNoh1yzhRtm1WWzdyg==	2020-10-27 11:24:43.028235
887	uzjzm1axx89w483zvhxqgf1t9ftt	IMG_1029.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10189311	ljrk7AYjpo+pMG4YdVZkJw==	2020-10-27 11:26:29.529345
890	qg6jtac2tbghzy14vlijpp4kgz91	IMG_1035.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9673223	/UsveMtz3GVFGjsYJuaYPg==	2020-10-27 11:28:48.424322
446	gr9h5hzo9g7zhudhyo2g36e1lvyk	photo.jpg	image/jpeg	{"identified":true}	12287076	x0qXVG+Wt1zREiQmXXS/tw==	2020-09-03 20:43:28.947692
447	q3ysoxc62350f4t81k4plaxc1yqx	photo.jpg	image/jpeg	{"identified":true}	10984727	zbShp9JgSF2Ab2su+ZnK3w==	2020-09-03 20:43:29.046729
604	oe48clrmumli71vsoc3b073054v4	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13789824	B10XM2CF/nc3/mb4y/F2kg==	2020-09-03 20:46:44.042287
811	3sioprnpalduj205s7vgktyesckk	orange-1.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-10-15 13:24:49.711501
626	bevlzsgvko05maru4wdhyt3yxe4u	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12627287	81RxfXZKQLVpuQFDmQgptw==	2020-09-03 20:46:47.487918
631	6uuk4e7ke0sgaf7blgkokx62u4id	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10878374	VCpWAKvC83y3oqRt02VFYg==	2020-09-03 20:46:48.384628
862	9j4ie8a3w8vz31ixjqmnn5myfjxo	IMG_0987.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12884071	Sy+E4AWn7kNWKw39TEcRuw==	2020-10-27 10:54:08.200062
865	8je8ft5doe82e11bqiu2tvhny03i	IMG_0993.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12357357	rW89TzJIY0sQGC8VnR7Auw==	2020-10-27 10:57:11.143392
866	tkyuvty708zp2a7qxdhzeas1j3nr	IMG_0995.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10979965	ILQfh/4Cg1rbbxxGaLrXXQ==	2020-10-27 10:58:37.083716
870	3jby8nnyhxn2nj1izucxxq8zu89l	IMG_1002.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13188628	EQDADyg6g5M3jRtWAG4YJw==	2020-10-27 11:04:40.669624
873	zw0owzqz0xfa9772t3dqjrkxbigy	IMG_1004.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12194921	FfKgAcj26RtKxHwGsLyyIA==	2020-10-27 11:07:43.218401
888	3h59pg8ytr47j3ijkas324ldv1r7	IMG_1031.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8843050	XFHHXLiXPQZfaVXUsyR57g==	2020-10-27 11:27:08.040643
812	t1x08u643pt3mf3jamhoookfhswu	orange-1-edited.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	4439568	woV6Y/MU6CrEUxCafSPk3A==	2020-10-15 13:39:03.016498
813	3h9b6e6ydgppearwcwfnt80vfjs4	orange-1-edited.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	4439568	woV6Y/MU6CrEUxCafSPk3A==	2020-10-15 13:44:53.441931
652	jsnxwn973hvrdok5ypt1kh22a73e	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10673929	7NTZdt+VxNJuWDZcYSnYrQ==	2020-09-03 20:46:51.833317
653	14v4xnuprp2orcv7kz2amxbq7usr	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11242769	oSZ4f7WwtN11h6Go3eXUQA==	2020-09-03 20:46:52.049788
654	3vlcuzhtthfihkvd35m4h6p97yd9	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13569812	6c51Qb8E2gszhePxkzzk2w==	2020-09-03 20:46:52.244929
655	qbdqs0pvrk6tdg6j5mr5d3ak9hjk	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13118977	fq4YYSoNB38f/SYAW4Omlw==	2020-09-03 20:46:52.600786
657	w616udtu89bsxk6t9xol81h9xwln	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12293922	gtrWGnRs+FOp2sgWvf+x2g==	2020-09-03 20:46:52.887675
656	8fa26fqxgve10gkf9va0ys0gbi1m	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14329280	RvwBvQeEz/wKjBhcgqebpQ==	2020-09-03 20:46:52.765855
658	w2gftmrxohg5aiq077ndbibvid78	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12609273	iDvJWPKqt5Nz8/cypmlzvQ==	2020-09-03 20:46:53.004903
659	p65n9wv9g8w3l2rv7mr468m0xyip	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9769390	Ye9Y828vcW7h+CsqoMukNg==	2020-09-03 20:46:53.175063
660	0qiyn7vtnfpiyo597fc0k3myi71l	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13745853	jOrBDnTkPVYcd5pStiv2mg==	2020-09-03 20:46:53.316206
661	qptu2artaka7w1zfneafxq47t2xn	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14203770	lNtmoge5GG0pGu7j3dZp+A==	2020-09-03 20:46:53.591786
662	icg5yjs7lf44wgaudymfgdxiffvm	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12971194	QyyGbxcLHD48xvjD+jZp2g==	2020-09-03 20:46:53.888171
663	g18btzecpffsb6scg8idnm9xtkpx	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13064306	DhOA1uakew4ZYawBXCkCJw==	2020-09-03 20:46:54.006673
664	teh4a7pqigs98lb008c1f5898aaf	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9855967	pK29+TFdS2FUNT/ueNMRLg==	2020-09-03 20:46:54.126558
665	8arsh5c8zwwnv5ssi9cmjuug0m5g	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9359635	tgWlreeg2W6jvLP1mNQbaw==	2020-09-03 20:46:54.243274
666	aegzl3amri3fufem4dkmh9150u4l	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13698725	eo8DMweR68cYZ1k11SecDw==	2020-09-03 20:46:54.39879
667	ucw62hls03pxqrfosf3jc3ksw5q9	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11930470	f/YQQfbRp5C23/HJRmXLrQ==	2020-09-03 20:46:54.563807
668	1ky2omxd1mfynd7lwa0167brrfk3	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11788985	fBSgGNGQl7blK9PCW7Rn7g==	2020-09-03 20:46:54.844651
669	y6gi6d0vu8ues5z39ero8626ea3g	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10686567	t5AI3DXxTrZWus6zmS58tA==	2020-09-03 20:46:54.992664
670	ux8jbiqj5dxn8h8ljg45rusy0pac	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13761982	6iUdRrg0xsoAelI2QJreog==	2020-09-03 20:46:55.10664
671	f9mnzbpj6n8o9i241qq4xp6mnugk	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11877651	HXeLUgjbuN9yB5bdBomWpg==	2020-09-03 20:46:55.231063
673	c7w2sq1hu5u5rqw9y7700i7wuc6c	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10780623	bae5SbIWs+n4FTCXTVwWCw==	2020-09-03 20:46:55.664454
672	v21hn41s4cowdn90td9snsbnhpub	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13867922	PSaoZVwhHMTTNjvjMgyLsg==	2020-09-03 20:46:55.439123
674	un85pztl48diu1gao0a32br3xx63	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12118342	yEa+jyRg1iuz+z6kOgF+WQ==	2020-09-03 20:46:55.934545
676	5n9ny5s9tlzb8dcxc4a9e7slook1	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8924293	NVmFU973wgkeQZmWn0r9bg==	2020-09-03 20:46:56.13677
677	kk2oqzj47cvmwadzc929nppzdx5n	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10793112	apm04pxWt4j3l6QHwtPJLQ==	2020-09-03 20:46:56.226429
675	uj019ts0alfcvwxvkt95bwod0u21	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12532101	ZzTOjoiT5mcKqndA1oGK6A==	2020-09-03 20:46:56.043657
678	isvd7qy7fbm8ecqpfgojzb6ldssz	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12148827	4zs9fePQYmGY6df6OdsR/g==	2020-09-03 20:46:56.324261
680	3oguf7aqtgnaexot1p0av2bc867c	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8919624	k6s7k/PzsSoNmZH6vr5Tuw==	2020-09-03 20:46:56.722668
679	v4p1a2konm0n25pdllimqyrcgp86	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12668967	ixSpkxhrXTpgjS8D7FKHTQ==	2020-09-03 20:46:56.45345
681	6x9n2ajpn0r4n1p7odunqsjq55ng	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12093188	cWBqM24ArhDx7YzGQfssug==	2020-09-03 20:46:56.891317
682	bjcjs0p793ha8jqhzxxcul6bhwt0	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13886264	V32PYZP8/XPORMTy4bI3uQ==	2020-09-03 20:46:57.009381
683	1de67p9sa1uy3kc9yon1b7cqdwoo	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14181501	KDYwAkaoelcJl4QvycfTgQ==	2020-09-03 20:46:57.138778
685	e9i1n1jo04td7u9akfab1psn39q1	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11177381	7/je1sGw0OysJn5bwjBQmw==	2020-09-03 20:46:57.4291
684	x2kp6wq0hyya47uhai1jjvvd6aml	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13440459	Slz+NcmdLmi3aKFFXNehwA==	2020-09-03 20:46:57.285559
686	wwnfszy0wj9ppi8qfxzn4tgzrsbz	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9401133	/0L1UkswfrvIWltWe9vBsQ==	2020-09-03 20:46:57.553335
687	czdwtzfbzvpe4se69rfboshakubi	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12400237	RSD77HVeiC+0lmy/7fdoIQ==	2020-09-03 20:46:57.814015
728	ra8d17iqwozy0nuovjlwsyqzg7e6	photo.jpg	image/jpeg	{"identified":true}	13994536	nWGW+UHqNhi3Jhd5CFfNEQ==	2020-09-03 20:47:04.117957
729	yex2y02kqjtewybbxrc8mjsw0a4n	photo.jpg	image/jpeg	{"identified":true}	12095882	0fGwkz0jSiQyHTI0LuBOOg==	2020-09-03 20:47:04.258147
730	af1ehabzk3zkl1vsn5jyukzfs056	photo.jpg	image/jpeg	{"identified":true}	13489747	0VAxEHjO9uPFgV3lC325Vw==	2020-09-03 20:47:04.500112
731	0fbnlbx0j1kvv4g83jwl2t3bdfw9	photo.jpg	image/jpeg	{"identified":true}	14697995	sibxthK5KfIUqxz/vAC7Ww==	2020-09-03 20:47:04.682616
732	ax2yzg161i8gxe8bohclq20figt1	photo.jpg	image/jpeg	{"identified":true}	12287076	x0qXVG+Wt1zREiQmXXS/tw==	2020-09-03 20:47:04.813799
733	gknw875cgqyelxhpf2aty34cvs3j	photo.jpg	image/jpeg	{"identified":true}	10984727	zbShp9JgSF2Ab2su+ZnK3w==	2020-09-03 20:47:04.918827
734	ccicufsrym4m4tu0ua5909nvrdlm	photo.jpg	image/jpeg	{"identified":true}	9920115	2KhBptEBXxCMRRLlWNR51w==	2020-09-03 20:47:05.071315
735	sew1w49wuhlt61zhlro6jdwjhkp3	photo.jpg	image/jpeg	{"identified":true}	12890940	quj3tlLSqHil+IFR0UeBCA==	2020-09-03 20:47:05.202415
736	wapezodkwvf9lly1d60lhqedu7wi	photo.jpg	image/jpeg	{"identified":true}	12799011	K9M/aRu++tSZnZiNJVF28g==	2020-09-03 20:47:05.326331
737	94orid3w83c19zxuemgosnftwv3y	photo.jpg	image/jpeg	{"identified":true}	10526840	jOOfBonXWR1L2I8ue4zW5w==	2020-09-03 20:47:05.650451
738	ev7c8je10j542p47dlv7ma7m1xs9	photo.jpg	image/jpeg	{"identified":true}	13847685	mLkyOSd7bTlSljOFvGa1lw==	2020-09-03 20:47:05.75015
739	8nomp9auybjlbg6rm4ko1pwj3kcz	photo.jpg	image/jpeg	{"identified":true}	10022485	fmsSiiMvzH+72/AzYeqFGA==	2020-09-03 20:47:05.851867
690	r797v8v8axzu2g5sgsoa22bmgxv4	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11169025	Y5MljmZNR3Kb9hgD4AnJ0Q==	2020-09-03 20:46:58.252478
692	ibs9tkomsi9nhfdjvoz8rrbuy7n6	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10587718	msqvtGCZKcUuD3y5hCgp1g==	2020-09-03 20:46:58.483258
691	slypamc80cq33t9xzs3yzc3od8fn	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13084009	jOaTj96ejyGz3LSKcCP1Lg==	2020-09-03 20:46:58.374336
694	fqulmzyy5bzzalpruutlmd4c4516	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11515904	1SyDYeRRqs+wYF9bI2Tm6A==	2020-09-03 20:46:58.720198
696	rf9kbuvnef4wlevmaq0f0jz9i1oi	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12052891	LjXR5YQvXWHwE9o/G7eurA==	2020-09-03 20:46:59.23842
695	0iyjjznj4dfhc7cjfhicczu95jpt	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13300183	ss4wPYWe7sstXoe1ojt87Q==	2020-09-03 20:46:59.067067
698	dg9ieacslrhj8f374zdgm3s0gpmp	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13781506	0uME1tDp1C8c87ja7WSulw==	2020-09-03 20:46:59.503601
702	sne77ubvms79nubnka141ir0e4t3	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9202066	jLy83b6TlKrJiC7TqAayNw==	2020-09-03 20:47:00.259518
700	m7d7yj9iym32s3o2lxq4iujyj0xq	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13713623	mQXWC962mnKzggBFkqKINg==	2020-09-03 20:46:59.861988
701	nfttt6h4uygxmym09tefybgrtwbh	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12915121	8S6jjFIk0lyEze//PU3b2g==	2020-09-03 20:47:00.124938
705	ez7tsdlz9y0jllvi7g7okb6rufg0	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11820206	y4tNtmV5fmuAk1vtYOjbbw==	2020-09-03 20:47:00.649178
703	b0zd893hd78wxf5hcdwmifqloz27	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14877013	7yB7aWgPQZZEFBG1ba2j4Q==	2020-09-03 20:47:00.366379
706	t389s9kve9qaly394l910h7t1xl5	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13478884	RF8pbyB7kumEzo6Z+PWadw==	2020-09-03 20:47:00.896775
709	c0l0xp9gknnv1fsgfxv6cey5mjkj	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	4215078	Okt9/BP0y0FK477zDqjbYw==	2020-09-03 20:47:01.32738
707	64raguho8kk5cyfa3fdvluzncdmt	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11088441	dqylx4tLa8xhsCmfJ8RxBA==	2020-09-03 20:47:01.059154
710	yy19sa4hndd1papwrz5oboui1d59	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14044351	tMSpNiinPKcVDpc0veMC8g==	2020-09-03 20:47:01.439026
711	zopbm57jftivwm6vv9frqf12swsj	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11242769	oSZ4f7WwtN11h6Go3eXUQA==	2020-09-03 20:47:01.599602
712	3wrnycvd4p4s688w9p51v657gaa9	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9918005	CiKthXSjv3ZmjvZSyAcdQw==	2020-09-03 20:47:01.818216
714	jh1wiq3ycxcuvx9hwamq0y6ljlsq	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10413997	VpogOGez7S+JM2NRgorfyQ==	2020-09-03 20:47:02.034451
715	ih6yizdjs66igfzwxcf74g9si3o2	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11968768	Jcm1Z4EokJ0FC1g5f51iUw==	2020-09-03 20:47:02.172277
716	gz0h26q5m2t83rsfwn0tmwlmurhc	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12535345	ao5PSRGXFRue99rXHBjatA==	2020-09-03 20:47:02.287312
718	h730d18mzknm5jmiwnw5cim6rgna	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13614346	vzw15zO9Y9MqBIgP23SD/Q==	2020-09-03 20:47:02.619548
719	anpmgg3jhbi2j9pingwkvi87lt7b	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12035784	cR4Hw3jeLaVOxGVPbXAtPA==	2020-09-03 20:47:02.789225
721	pe1xisy6jefxysxl015210ebsvi1	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10825900	RLEscjNnnSKqv02xjQVTqw==	2020-09-03 20:47:03.045086
722	lk9309u5m0m14btxkiawtoipkuv7	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12287076	x0qXVG+Wt1zREiQmXXS/tw==	2020-09-03 20:47:03.179147
723	t3zqe5rvujngyke3huu8mtpsuzlm	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14089610	EE7RrNNQ1moa26gTbe+AIQ==	2020-09-03 20:47:03.43556
724	weg4qxqqdf2o3ukw09fz0864x8ld	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13400565	4IbZIeHgx1F27K37204mdQ==	2020-09-03 20:47:03.680187
726	0c0rxqk9qxmpox7f1adg7ilixnsz	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10909194	EGT8QuVAsTvj1KbVDFv2yA==	2020-09-03 20:47:03.918551
727	sq6w1y9jloq3j9qnj7g4m37i2ayn	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10283069	ZHWxHyZSmTXscjdthDIG/w==	2020-09-03 20:47:04.012543
448	1y1lzb61h2i7cmmddpe89zwtg49p	photo.jpg	image/jpeg	{"identified":true}	9920115	2KhBptEBXxCMRRLlWNR51w==	2020-09-03 20:43:29.142161
449	e669mmkdrr42ixuotxlmd892xroy	photo.jpg	image/jpeg	{"identified":true}	12890940	quj3tlLSqHil+IFR0UeBCA==	2020-09-03 20:43:29.249435
450	ivdomf38tcw36eruubw7xjhauv60	photo.jpg	image/jpeg	{"identified":true}	12799011	K9M/aRu++tSZnZiNJVF28g==	2020-09-03 20:43:29.555602
451	vjkjrythh2o3y4wukoemtt0etpv3	photo.jpg	image/jpeg	{"identified":true}	10526840	jOOfBonXWR1L2I8ue4zW5w==	2020-09-03 20:43:29.654599
452	r65od9jf0uzjtc5o9lkz0know52n	photo.jpg	image/jpeg	{"identified":true}	13847685	mLkyOSd7bTlSljOFvGa1lw==	2020-09-03 20:43:29.748709
453	ekzy3xri1a7ij5gvaefxl8yfpj4a	photo.jpg	image/jpeg	{"identified":true}	10022485	fmsSiiMvzH+72/AzYeqFGA==	2020-09-03 20:43:29.843206
454	6tpm8av98nawf178s48v2v5odldk	photo.jpg	image/jpeg	{"identified":true}	9359635	tgWlreeg2W6jvLP1mNQbaw==	2020-09-03 20:43:29.921725
455	vqs1w7a5fvlll4patya5lov7pikj	photo.jpg	image/jpeg	{"identified":true}	10243701	g0eOiddk6wV9ExNvvm0Ezw==	2020-09-03 20:43:30.039634
456	dc81uonqyyc2cnglef5av7347ey1	photo.jpg	image/jpeg	{"identified":true}	12945129	3qcIxbJRH94GcSHd4aEukQ==	2020-09-03 20:43:30.145633
457	eg5f70p9lhr2gkuelcsix133fa5o	photo.jpg	image/jpeg	{"identified":true}	13569812	6c51Qb8E2gszhePxkzzk2w==	2020-09-03 20:43:30.443458
458	bm6j0ecbj73kxpw1xhi4f1zzbk0q	photo.jpg	image/jpeg	{"identified":true}	11601812	1/uaWnCWrycIbqmzcADfOQ==	2020-09-03 20:43:30.552502
459	bfw3mmnpn16m5g5pb1sb2eq7fmei	photo.jpg	image/jpeg	{"identified":true}	12769182	Ta0bqMzr9wpQaZU6BeEBkg==	2020-09-03 20:43:30.730635
460	262cnujx1fda3tbrcis9bj42uy03	photo.jpg	image/jpeg	{"identified":true}	12045271	ZNhbzWHxse59t0LdUPISNg==	2020-09-03 20:43:30.861978
461	n5zfqh6hhri9pvj4wvg102dibktp	photo.jpg	image/jpeg	{"identified":true}	13453817	XFKMfTDfYg5QJjpJP1S/8w==	2020-09-03 20:43:31.033226
462	t5r827dk26xhmr9fen0om4k5znph	photo.jpg	image/jpeg	{"identified":true}	13935560	40T59IC516cu2S9t2KBvHg==	2020-09-03 20:43:31.329199
463	4jo9lkp2zjtvdqdcwj9of5m3hl86	photo.jpg	image/jpeg	{"identified":true}	13621254	qUmtowKW5I9dcZap6NWxKQ==	2020-09-03 20:43:31.47145
464	wb7pbl42yo1odr7xn0pa8k8ygv9t	photo.jpg	image/jpeg	{"identified":true}	13331055	80bnjP7xgd6/QW4pRfNEmA==	2020-09-03 20:43:31.588721
465	adhf4iyzo6daro420mem2r07ua07	photo.jpg	image/jpeg	{"identified":true}	13759630	NK8B8WgNbL9wqtvMR6N6TA==	2020-09-03 20:43:31.702534
466	lyjst38apdotktt1sx4nn5g6vwjs	photo.jpg	image/jpeg	{"identified":true}	12106831	G+KWKj8CUq53iTFODpyZHQ==	2020-09-03 20:43:31.85006
467	54lyrweerwfx9z9mr1az6xykaxkl	photo.jpg	image/jpeg	{"identified":true}	12580558	MvWSEzlLzvNhWHZ2GdGJag==	2020-09-03 20:43:32.004993
468	x97mv4j5tib45x60jl01c60o6hug	photo.jpg	image/jpeg	{"identified":true}	12768848	1qaOiDn6gSeDCuEJk8s/sg==	2020-09-03 20:43:32.209485
469	iearv10zfd4l7xgmvz6muxlmsdot	photo.jpg	image/jpeg	{"identified":true}	10967227	6ys0UhjSRcnf7Q2fJn+yVQ==	2020-09-03 20:43:32.319103
470	kbput8au20qnfdn2aqwd6xcxfsv6	photo.jpg	image/jpeg	{"identified":true}	12509382	TESEbmSX6K+Ma6Qo6v1M5g==	2020-09-03 20:43:32.43823
471	122drbezy70hfwskigz1oe3wzgry	photo.jpg	image/jpeg	{"identified":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-09-03 20:43:32.544611
472	qab4oes5z0omh1a4mnht5iuscqcb	photo.jpg	image/jpeg	{"identified":true}	11753536	5Iv6dS6a8cOhcPkJ81sDXg==	2020-09-03 20:43:32.734699
473	jx56owq6wf07zaxmecd7hm9147t8	photo.jpg	image/jpeg	{"identified":true}	11557945	A/G04p55vI41iEUr+V9OcA==	2020-09-03 20:43:32.853605
474	6abuy96mtq7ki95w6cs6tc5drbiv	photo.jpg	image/jpeg	{"identified":true}	11715658	6g4syMmEvOYDEP1gAMWpIQ==	2020-09-03 20:43:33.107214
475	o9wq43pcvf5nlkrwi5yocezr3il8	photo.jpg	image/jpeg	{"identified":true}	12204006	9QHpq1IoXMoP7ME5WbOhjA==	2020-09-03 20:43:33.211487
476	l03ex0u37fvn0ip54t068555ojt9	photo.jpg	image/jpeg	{"identified":true}	11088441	dqylx4tLa8xhsCmfJ8RxBA==	2020-09-03 20:43:33.316063
477	gnmp4n7l7xx50u0joe7lkqaub24p	photo.jpg	image/jpeg	{"identified":true}	14671113	mpXJccG4Rz3sYTSlz2Dp2w==	2020-09-03 20:43:33.433691
478	qwtug52w3xnmxh9hdn964uqa23ci	photo.jpg	image/jpeg	{"identified":true}	13199274	ky+po13EVImC0Ea3WX2IeQ==	2020-09-03 20:43:33.568728
479	w2yxozi9nl51g9jjw68n6rixtd9f	photo.jpg	image/jpeg	{"identified":true}	12335782	aqbzTzc9QO7V270Jp7JhLQ==	2020-09-03 20:43:33.670677
480	b8bph9cqtyzbxsr20pp83adp7yzu	photo.jpg	image/jpeg	{"identified":true}	11285667	k5CddUZzQSrn+95YPrM+sQ==	2020-09-03 20:43:33.810935
481	fx92o66w555r46a7xh8ul3pussoi	photo.jpg	image/jpeg	{"identified":true}	13577225	uZ8/Z2sPvhIjGhvT3ftuhQ==	2020-09-03 20:43:34.025227
482	l7txweb3kxjfuiqkloaupfwo8fgv	photo.jpg	image/jpeg	{"identified":true}	13055461	KfVs/uNJZCNC4JTT25GCJQ==	2020-09-03 20:43:34.194444
483	j15kietdlchl9ds8cvz1cktjjl3n	photo.jpg	image/jpeg	{"identified":true}	12411159	tHs3DmFUxVQS69LW7yQhsA==	2020-09-03 20:43:34.28291
740	6ylan3io6kn3fnmqvyjixat7fwb4	photo.jpg	image/jpeg	{"identified":true}	9359635	tgWlreeg2W6jvLP1mNQbaw==	2020-09-03 20:47:05.948126
741	kcm5jo3k0980n3ogd0mj48dchly5	photo.jpg	image/jpeg	{"identified":true}	10243701	g0eOiddk6wV9ExNvvm0Ezw==	2020-09-03 20:47:06.033385
742	k90gqecocceonytdm1a33qlx3su0	photo.jpg	image/jpeg	{"identified":true}	12945129	3qcIxbJRH94GcSHd4aEukQ==	2020-09-03 20:47:06.139161
743	zcpiohixnm8k5unqajxn52d0i9a4	photo.jpg	image/jpeg	{"identified":true}	13569812	6c51Qb8E2gszhePxkzzk2w==	2020-09-03 20:47:06.276132
744	aais6og23g8pk0skax4jsq347x28	photo.jpg	image/jpeg	{"identified":true}	11601812	1/uaWnCWrycIbqmzcADfOQ==	2020-09-03 20:47:06.617539
745	lyljzare2lchdl1rzkhaaubunt1l	photo.jpg	image/jpeg	{"identified":true}	12769182	Ta0bqMzr9wpQaZU6BeEBkg==	2020-09-03 20:47:06.759051
746	4q68h4tgojycu9ftuy8jy441zs1p	photo.jpg	image/jpeg	{"identified":true}	12045271	ZNhbzWHxse59t0LdUPISNg==	2020-09-03 20:47:06.862787
747	c0ie4vzskvtkj6slebr11cy7hfw3	photo.jpg	image/jpeg	{"identified":true}	13453817	XFKMfTDfYg5QJjpJP1S/8w==	2020-09-03 20:47:06.963955
748	ggztdqvihhb7s89rag5ubgend426	photo.jpg	image/jpeg	{"identified":true}	13935560	40T59IC516cu2S9t2KBvHg==	2020-09-03 20:47:07.069944
749	4zpf2j01qvtc680kpje0lsojfv5k	photo.jpg	image/jpeg	{"identified":true}	13621254	qUmtowKW5I9dcZap6NWxKQ==	2020-09-03 20:47:07.163297
750	y5xw4krcg45jsce4j2eusa7mgy86	photo.jpg	image/jpeg	{"identified":true}	13331055	80bnjP7xgd6/QW4pRfNEmA==	2020-09-03 20:47:07.385337
751	kosjvs3odfu31oeuep8dsetlvfsf	photo.jpg	image/jpeg	{"identified":true}	13759630	NK8B8WgNbL9wqtvMR6N6TA==	2020-09-03 20:47:07.637336
752	c8jhr8kgh2439xgtio9ixtar2rvn	photo.jpg	image/jpeg	{"identified":true}	12106831	G+KWKj8CUq53iTFODpyZHQ==	2020-09-03 20:47:07.729772
753	izbj8hei8pzn6ved8kbuyaff4jln	photo.jpg	image/jpeg	{"identified":true}	12580558	MvWSEzlLzvNhWHZ2GdGJag==	2020-09-03 20:47:07.821277
754	euebjzfhoo80603lqlm4ameer3sm	photo.jpg	image/jpeg	{"identified":true}	12768848	1qaOiDn6gSeDCuEJk8s/sg==	2020-09-03 20:47:07.91788
755	g2gjegi4tncptyf59alpeexlhecr	photo.jpg	image/jpeg	{"identified":true}	10967227	6ys0UhjSRcnf7Q2fJn+yVQ==	2020-09-03 20:47:08.012223
814	4uyk0otd4f6cz1p307wagp0neauz	orange-1.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-10-15 13:45:04.536394
816	3zxywfgngecamviorcyhnl5gvgtn	orange-1.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12709511	Iv9dymVkhOUL8HBQ+7BWWQ==	2020-10-15 13:46:47.70639
867	oqcrl67ef438h2udjm6zky6e9rs8	IMG_0997.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12987778	btlDfzJ0F0M1kC0qI7Pfsw==	2020-10-27 10:59:47.421681
874	rnouwfie9urxl2faq1d9f4ad5xdr	IMG_1006.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13872926	APK5QBSxuEm9cIdFg3KElA==	2020-10-27 11:08:29.349964
882	ti2ji4y4xchuqfgpz08uabgvq6xm	IMG_1020.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14034475	MYjUU/33Y/9i3S6t6nrZ4A==	2020-10-27 11:19:55.433822
885	7a1snti00d291lf0hqwsmjissgzn	IMG_1025.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9676404	fcC/Aebf6aQ5GUcRUD1EdQ==	2020-10-27 11:23:14.429668
688	pcrm1fnfe4mzqklqvwshcrk100km	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10248534	+QXHnpMUlebeDVyZLzXVbg==	2020-09-03 20:46:57.958508
889	bxkt19typp88l7tuhqhv09djxxlz	IMG_1033.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9321905	9uzu93eCEHGH9n9B8MENJQ==	2020-10-27 11:27:50.314338
720	8y0ly5gc60v07aey39mlph4t8o1h	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12143601	WNLc6g2yVXl87erMlSVvAA==	2020-09-03 20:47:02.930447
725	xdu5wm07hh50ap2q9x77e1hntbt1	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12023608	pxX/fCbzQ6pq7cflPyH2ng==	2020-09-03 20:47:03.802462
817	uel9pzuxd8zh1i0gyywvsle4o6oj	IMG_0893.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13262020	8/PtqOu4+18GTjcT2Zr5eA==	2020-10-19 19:41:22.711328
839	y0bqm165v89yko135ku6pszlbnu1	IMG_0937.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11677487	jVuYPac8uOuvXquyvFmM3Q==	2020-10-27 10:07:49.613961
844	xgixg14y9srdz3r4w4mdf2hu385c	IMG_0946.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11559217	6G9lJ6qZ7JaXStVoRM7/4A==	2020-10-27 10:18:52.375609
847	gycayzqg8if7b4qfor76en45lhft	IMG_0953.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12225658	XzuKcyIsDeiyjZSPDFQIOQ==	2020-10-27 10:23:41.87898
849	x19z8k6im39e8ghbbh5sk1bfqykj	IMG_0957.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12830166	b3PElizZGxWf6/2JHr468Q==	2020-10-27 10:26:02.619536
850	oqdm579r27bcv75sgd48wz7jbvdv	IMG_0959.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14065798	j1EK1/JUnonv9yCWkHMwxQ==	2020-10-27 10:27:04.560099
852	fz0oftjo6sllfqrjmxuy7hhftud5	IMG_0963.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14431837	w48KBjPvdTStecVeItU8Xg==	2020-10-27 10:29:11.967378
558	1dfbmhuxezafj0tppe6qvvnlzmfa	photo.jpg	image/jpeg	{"identified":true}	10984727	zbShp9JgSF2Ab2su+ZnK3w==	2020-09-03 20:45:09.817218
559	wkr0x00kn0fwh3p3qh4vqa4ceuwm	photo.jpg	image/jpeg	{"identified":true}	12799011	K9M/aRu++tSZnZiNJVF28g==	2020-09-03 20:45:09.926832
560	z6s0dprqxeoujsnarmds2z4p2ho9	photo.jpg	image/jpeg	{"identified":true}	10022485	fmsSiiMvzH+72/AzYeqFGA==	2020-09-03 20:45:10.055842
561	f0znok7dyxwdhgutw7u96vclwhy2	photo.jpg	image/jpeg	{"identified":true}	12945129	3qcIxbJRH94GcSHd4aEukQ==	2020-09-03 20:45:10.263646
562	10usnr91kipaxs5x5tu6pkgrsvwp	photo.jpg	image/jpeg	{"identified":true}	12769182	Ta0bqMzr9wpQaZU6BeEBkg==	2020-09-03 20:45:10.52071
563	cvl7sitzhleaqk3g6rwcweqr18g2	photo.jpg	image/jpeg	{"identified":true}	12045271	ZNhbzWHxse59t0LdUPISNg==	2020-09-03 20:45:10.707652
564	swo81xqyw1cvwubeq494g6v5t041	photo.jpg	image/jpeg	{"identified":true}	13453817	XFKMfTDfYg5QJjpJP1S/8w==	2020-09-03 20:45:10.885589
565	07fx9c7kpgoxckbhct2uivrg9735	photo.jpg	image/jpeg	{"identified":true}	13935560	40T59IC516cu2S9t2KBvHg==	2020-09-03 20:45:11.026542
566	mxovivyls9z63z869h7weicfdl43	photo.jpg	image/jpeg	{"identified":true}	13331055	80bnjP7xgd6/QW4pRfNEmA==	2020-09-03 20:45:11.193742
567	ifz0wyn4qejk0xc50lz1kd41wf7m	photo.jpg	image/jpeg	{"identified":true}	13759630	NK8B8WgNbL9wqtvMR6N6TA==	2020-09-03 20:45:11.60157
568	9l91u38xq3yvscb4j3t7ceds28h3	photo.jpg	image/jpeg	{"identified":true}	12106831	G+KWKj8CUq53iTFODpyZHQ==	2020-09-03 20:45:11.799707
569	k64xjcvq5ng3xzux2ze8t8u9x7o6	photo.jpg	image/jpeg	{"identified":true}	12509382	TESEbmSX6K+Ma6Qo6v1M5g==	2020-09-03 20:45:11.943893
570	5jjgh2oozy13ybmjyjrv839wkjbm	photo.jpg	image/jpeg	{"identified":true}	11753536	5Iv6dS6a8cOhcPkJ81sDXg==	2020-09-03 20:45:12.089601
571	o90so41i8jtz88ubsa0f4ys6lfvv	photo.jpg	image/jpeg	{"identified":true}	12204006	9QHpq1IoXMoP7ME5WbOhjA==	2020-09-03 20:45:12.23649
572	hkx3gidrzv5e2lbkmxvyjqcseghp	photo.jpg	image/jpeg	{"identified":true}	12335782	aqbzTzc9QO7V270Jp7JhLQ==	2020-09-03 20:45:12.358221
573	bo0r5mhqr8njnd11r2trz6s9cumu	photo.jpg	image/jpeg	{"identified":true}	11285667	k5CddUZzQSrn+95YPrM+sQ==	2020-09-03 20:45:12.656224
574	d5hq1vbbqu3ln5pvusrcl2qclilj	photo.jpg	image/jpeg	{"identified":true}	13577225	uZ8/Z2sPvhIjGhvT3ftuhQ==	2020-09-03 20:45:13.000644
575	ptols28z3wyz1du4njjx0njjppss	photo.jpg	image/jpeg	{"identified":true}	13055461	KfVs/uNJZCNC4JTT25GCJQ==	2020-09-03 20:45:13.12162
576	zgqsq8ytl8evwrqzlz8fm1x50ero	photo.jpg	image/jpeg	{"identified":true}	9178021	Gz+ON5kwxOJB/Zv2h4ARNg==	2020-09-03 20:45:13.248252
577	cwypgxzofyzeplule79g56mrdsk5	photo.jpg	image/jpeg	{"identified":true}	12950270	lcwrH6OjRuPeZcs0FE7iWg==	2020-09-03 20:45:13.344344
578	6g3z4ea39nw3omqvo6aeg3k5fcb5	photo.jpg	image/jpeg	{"identified":true}	12400237	RSD77HVeiC+0lmy/7fdoIQ==	2020-09-03 20:45:13.453747
579	apfs1jbnrhkumg5ywqyarc5chqsi	photo.jpg	image/jpeg	{"identified":true}	11930470	f/YQQfbRp5C23/HJRmXLrQ==	2020-09-03 20:45:13.56691
580	nt0xxs0dexqu4r3umtreob60zq9d	photo.jpg	image/jpeg	{"identified":true}	14154706	9zLXM6zlqmbeiPbaC/LH7w==	2020-09-03 20:45:13.733332
581	mvwut15z7afp4h3emtbfixjavh1b	photo.jpg	image/jpeg	{"identified":true}	14264827	9sWU+89qPvwxJMfPkjsgkQ==	2020-09-03 20:45:14.078906
582	8zxd0iv2o04hnllwnazx389ac9fv	photo.jpg	image/jpeg	{"identified":true}	13105019	omQDgVMGQpUg1t72uFMs9g==	2020-09-03 20:45:14.222623
583	4rkyb8bf5r2bz162nn6okmtfso4g	photo.jpg	image/jpeg	{"identified":true}	14148755	jULwvDPVF3Dfypp+oCvVig==	2020-09-03 20:45:14.359897
584	wnhirr9bmiywd8xasdaf6b2twswf	photo.jpg	image/jpeg	{"identified":true}	13351969	ygAbbLJGUgC6mRR51sywBA==	2020-09-03 20:45:14.507016
585	tgh7zrvzngk5y8199feskk557zve	photo.jpg	image/jpeg	{"identified":true}	10772965	q93KwY2ne26eykZbhZv4WQ==	2020-09-03 20:45:14.641174
586	wkr8yu46fjezgoul5g4z15nf7659	photo.jpg	image/jpeg	{"identified":true}	11796734	bZI7wf1W9pgQphCBAahW5g==	2020-09-03 20:45:14.794003
587	e4kzjueyikwlkqoulpxeok6yx9f9	photo.jpg	image/jpeg	{"identified":true}	11344943	JHgsfu6Yqv3fb8G7+R8ZpQ==	2020-09-03 20:45:15.080562
588	atnrfgc930bz6syk91ksdbmlq2yn	photo.jpg	image/jpeg	{"identified":true}	11921188	sAB5iRttNzh3P9Sxh4wrkA==	2020-09-03 20:45:15.184047
818	fyi0dl45agbyocof9rnudgno5e8q	IMG_0898.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11937363	LADdI0N7UCBiDN4fWM2VgA==	2020-10-19 21:37:29.33913
826	pum4d9pyhvfvfw4b8xbt9mq6ip1p	IMG_0914.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11145877	1TIRzTK/fXNGVKMHvEnMrg==	2020-10-19 21:46:13.365071
828	xd181mz6c4hcdrgwt3ci8efdn8rt	IMG_0916.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11458282	RrqUkfCotfUYzSvc4gUvyQ==	2020-10-19 21:47:41.88313
834	3gtfftehm1ic6fo0mfloqn8tnulz	IMG_0928.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13698345	NXSwMYKkrEbkK4ZpCckglg==	2020-10-19 21:52:18.621725
840	hetbbwqd9d4c0k14bv4ovn6vtnar	IMG_0939.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10854920	SibVQZOFG/DzM4Z/l+D+bQ==	2020-10-27 10:10:54.15835
689	oxdofogka0ic9jwkcrqbe5eusc60	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11958581	pkOgyObKiui73AMzQRWo/w==	2020-09-03 20:46:58.070987
699	gg0y5xaxsekgm36f3tsj7wm2h02w	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12400237	RSD77HVeiC+0lmy/7fdoIQ==	2020-09-03 20:46:59.683107
704	naohqe2ewnx35mjab0yxbxakjvmk	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13781506	0uME1tDp1C8c87ja7WSulw==	2020-09-03 20:47:00.503712
708	70apgn1gi044iqh4nmmhnlbhv8vj	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13109470	7tudk8tiyxTjiqDoSFaMUQ==	2020-09-03 20:47:01.238003
717	ebctc12uw0jzc1ady3w6y7jid66k	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8836833	rgABtL0QQXzp0nwFgl1a1A==	2020-09-03 20:47:02.461521
843	nvckfthot7u9c90i5ggljz2xay3j	IMG_0944.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	10561300	HPPTQHUzBYzp60ebxq23Bw==	2020-10-27 10:16:59.006177
845	2mk7nz4cqr7asuac32hmgfdlh56e	IMG_0948.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11754315	zQhMm4UIJGh1IltcrvTSug==	2020-10-27 10:20:19.897495
846	glffuivwd3dh8ol9432nqj8xnex3	IMG_0950.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12731999	zxeFrXBTwEcb1bJ4n6C1rw==	2020-10-27 10:22:14.176341
848	jkczfj642as47aivozrf80c1h0zb	IMG_0955.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15174496	Y5+kpLmD3n5ZTpEg/HhHCA==	2020-10-27 10:25:02.613567
856	avlyfhu73z8pbetbg3v8zpbrax6s	IMG_0974.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13810767	fcCmZj5e1Vd6DPyA5Mgiag==	2020-10-27 10:33:43.847379
859	srt7zfkp9a5b5czf9sihnn7fr7c5	IMG_0981.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13261469	3LKQUOSnpT5rKvCf7onKZg==	2020-10-27 10:41:28.861824
589	jgp4cntxfthx3aaqqh92i6bhesr9	photo.jpg	image/jpeg	{"identified":true}	11167384	2sYyZHudHV85jzY4JdgcdQ==	2020-09-03 20:45:15.310946
590	pv00tmmacx1opuchha6sx2u28yt7	photo.jpg	image/jpeg	{"identified":true}	13361673	QinvJYlDJdDWbVE5/hnw0g==	2020-09-03 20:45:15.458434
591	w2o08jur6dwhmkjgv8ffw3nyumfo	photo.jpg	image/jpeg	{"identified":true}	12020426	ACHpDZNMsm/387VODXylJQ==	2020-09-03 20:45:15.561233
592	71e8mx0yk86lzb0gd8582hrkf4v0	photo.jpg	image/jpeg	{"identified":true}	13189541	r34UUBbAt/QT9KSwErYCRQ==	2020-09-03 20:45:15.656877
693	ecqh4paf22fd0vmjko59d720g8cs	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13002684	6yLwDGhZOcexcysGUwFosA==	2020-09-03 20:46:58.596316
697	3vqwejgq2vkvx0q1ve0dhny31zts	photo.jpg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12980327	zpvBGY/GE1HgtUbXQ5qiQA==	2020-09-03 20:46:59.355795
819	y958yj3yturk85vap7n8j9zwlr22	IMG_0900.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11088326	OV86u2OTQQpvEpm3AsyIHQ==	2020-10-19 21:39:07.395423
820	tnhj1hs2oz8rpx3qyjrjh0arbiyk	IMG_0903.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11752048	QAPOXfrGx4h2oy0RC1qS5w==	2020-10-19 21:39:56.052809
821	kuy55k8aueugk3lehroykm5f0ha5	IMG_0905.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	13156329	jvBQ1kPVL3xjNxLgchNM4Q==	2020-10-19 21:41:02.626212
824	8lb0wz0voygm61rjyawyf7k1y5rp	IMG_0909.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11100366	Z8sUnYiPSk9ws/6864RGjA==	2020-10-19 21:43:59.540133
829	kxorxqedb3ynutplts7t899tnfai	IMG_0918.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11693031	6GuINIlksvigft2J8sSXCQ==	2020-10-19 21:48:23.903818
830	yu0o9c741ga8utj4hi5xgus2q0ei	IMG_0920.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11784841	yaMRZSfFAuerRezXNXGjMA==	2020-10-19 21:49:06.812469
833	7vk65l3ghafw1cfujwgahtipik0k	IMG_0926.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	8773352	b8dBCNFC+Zvn7+DI5B/3JQ==	2020-10-19 21:51:38.376572
838	jfeeal4wijwm859fargc9bnv0h5x	IMG_0935.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	11274277	Fl/rU50XMGD7ZFDGqUgowQ==	2020-10-19 21:56:23.373212
841	may4coie899zn3uheh7ezq6g8q8a	IMG_0941.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9676687	5UXGs1j3nebjHRZ466OShw==	2020-10-27 10:13:03.232242
842	w9awhlhm6ofyadc7tcu4se3wlc33	IMG_0941.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	9676687	5UXGs1j3nebjHRZ466OShw==	2020-10-27 10:15:09.9325
851	7qz6771e5jqkjapjngrbh8z3babf	IMG_0961.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14110541	cAaJGqywbGd8KGohMhxyhw==	2020-10-27 10:27:56.0767
853	k2zc0mqc3774nojpn58g6ul21q2j	IMG_0965.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	15245120	UyEuw6SSFreW1r+gFz0VKA==	2020-10-27 10:30:16.508958
854	hfdf49sa5g5ks6lv55zt0lr7wxwq	IMG_0970.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	14040221	BvuJAZ6Cjc6HFDYnhfG2Sw==	2020-10-27 10:31:40.196822
855	fumnvgjchlkbk10f2i3thjbz863v	IMG_0972.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12868325	Pmy8lI9G+HFa0kdsTiqbKg==	2020-10-27 10:32:37.717288
857	1xi3xjr3cyh411fyl0weoukvfxeb	IMG_0977.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12737358	WZ/87kSR/yDc6HvPeg7kIA==	2020-10-27 10:39:21.332727
858	9o76vc023z1ay8go055ki3xo906d	IMG_0979.jpeg	image/jpeg	{"identified":true,"width":4032,"height":3024,"analyzed":true}	12542906	LbNjlsCOjzFYI+nD46rdqA==	2020-10-27 10:40:08.177272
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-04-16 09:10:26.289344	2020-04-16 09:10:26.289344
schema_sha1	196eee803fbc0fc5bc06a8363366774b589e5009	2020-04-16 09:10:26.294594	2020-04-16 09:10:26.294594
\.


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.areas (id, name, created_at, updated_at) FROM stdin;
1	Rocher Canon	2020-04-19 08:38:02.298542	2020-04-19 08:38:02.298542
2	Cul de Chien	2020-05-07 12:15:31.368298	2020-05-07 12:15:31.368298
4	Cuvier	2020-10-19 19:16:55.941826	2020-10-19 19:16:55.941826
\.


--
-- Data for Name: boulders; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.boulders (id, polygon, created_at, updated_at, area_id) FROM stdin;
212	0103000020E610000001000000050000007BDCB75A274E05401ADD41EC4C3B484009DE9046054E0540C19140834D3B4840A88AA9F4134E05404FEACBD24E3B4840C5758C2B2E4E0540DE76A1B94E3B48407BDCB75A274E05401ADD41EC4C3B4840	2020-04-16 20:02:34.251674	2020-04-16 20:02:34.251674	1
236	0103000020E610000001000000070000007E737FF5B84F0540EB3BBF28413B4840AB9509BFD44F0540A38FF980403B48406CB07092E64F054062A06B5F403B4840D3FA5B02F04F054038D906EE403B4840DE3AFF76D94F0540F0F8F6AE413B4840BC92E4B9BE4F0540F0F8F6AE413B48407E737FF5B84F0540EB3BBF28413B4840	2020-04-16 20:02:34.295603	2020-04-16 20:02:34.295603	1
239	0103000020E61000000100000005000000BFF2203D454E054068AED3484B3B4840F7C8E6AA794E0540DA5548F9493B4840C4E9245B5D4E05407C8159A1483B4840CA32C4B12E4E05407B4D0F0A4A3B4840BFF2203D454E054068AED3484B3B4840	2020-04-16 20:02:34.300494	2020-04-16 20:02:34.300494	1
240	0103000020E61000000100000008000000800D8810574E0540A96917D34C3B4840F1457BBC904E05405743E21E4B3B4840FDF9B660A94E05403239B5334C3B4840FD851E317A4E05403EB324404D3B4840804754A86E4E0540618907944D3B4840AD2F12DA724E0540F6D214014E3B48403C6BB75D684E054037C2A2224E3B4840800D8810574E0540A96917D34C3B4840	2020-04-16 20:02:34.302185	2020-04-16 20:02:34.302185	1
241	0103000020E610000001000000090000004ED932C89E4E05401AB2642D4F3B48400A376215B04E05402A67A0EE4D3B484020650DC6C94E0540E59EF6894D3B48406441AA10D04E0540278E84AB4D3B48402CDF7CD2CA4E0540884C73034F3B4840763E850BBA4E0540EB2DC8354F3B484015B1D121B14E0540A442B8F64F3B48406B8A4967A14E05400072D5A24F3B48404ED932C89E4E05401AB2642D4F3B4840	2020-04-16 20:02:34.303839	2020-10-27 11:43:35.282129	1
205	0103000020E6100000010000000500000038984F13CB4B05401252B619313B4840EE3847DADB4B054041D65211313B4840F3F57E60DC4B05409965BA542F3B48403D558799CB4B05409965BA542F3B484038984F13CB4B05401252B619313B4840	2020-04-16 20:02:34.237974	2020-10-23 14:57:47.045403	1
206	0103000020E610000001000000050000007023FA22334C0540978BFEA1343B4840F8DB33B83F4C0540DE48A806353B484081946D4D4C4C0540E4334667343B48400456A3C4404C05409E769C02343B48407023FA22334C0540978BFEA1343B4840	2020-04-16 20:02:34.240121	2020-10-27 11:58:43.947464	1
230	0103000020E61000000100000005000000ECD461FBCF4F0540097A4A283C3B48403C2B6E52D74F05403CD702633C3B4840FD0B098ED14F054040B01EA63C3B4840A8F8C4B0C94F05403CD702633C3B4840ECD461FBCF4F0540097A4A283C3B4840	2020-04-16 20:02:34.284758	2020-10-23 15:34:09.757053	1
217	0103000020E61000000100000007000000A69EB34A254F0540876AE5B2323B484028D481F1484F05408491C96F323B4840F56858D15B4F054025B7F65A313B4840A01B485C3C4F05403B296AA2303B48408FE4A0C93A4F054067A6847C313B48404BCE37E71C4F05402C692EE1313B4840A69EB34A254F0540876AE5B2323B4840	2020-04-16 20:02:34.261134	2020-10-23 15:34:09.783108	1
229	0103000020E6100000010000000500000025378F39D54F054083C212A23B3B4840913EB22FDF4F0540C1D884803B3B4840BE267061E34F054065A967D43B3B48403C2B6E52D74F0540C88ABC063C3B484025378F39D54F054083C212A23B3B4840	2020-04-16 20:02:34.282899	2020-10-23 15:34:09.800872	1
227	0103000020E610000001000000050000002E6D4BA9274E0540FCEC934B403B4840B7B486FE394E05405EAD4B0E403B4840D948B797264E054020BF043E3E3B48402C4F926D174E05400C5245AE3E3B48402E6D4BA9274E0540FCEC934B403B4840	2020-04-16 20:02:34.279527	2020-10-23 15:34:09.820775	1
207	0103000020E61000000100000007000000A9F89C40304C05405B53B07B3B3B4840D6E05A72344C054071751F883C3B4840B43840B5194C05400B60AAD73D3B48402C8006200D4C054099F77FBE3D3B48402C8006200D4C05403C23674D3C3B4840204063AB234C05407C45778C3B3B4840A9F89C40304C05405B53B07B3B3B4840	2020-04-16 20:02:34.24215	2020-10-27 11:58:43.974655	1
213	0103000020E61000000100000005000000AEEFA05E484C054066E4E7013C3B4840CB66EB65334C054071E7C1233A3B48409DB8F9CB464C05409AA842D8393B4840B4E6A47C604C0540A4FA59E03B3B4840AEEFA05E484C054066E4E7013C3B4840	2020-04-16 20:02:34.253725	2020-10-27 11:58:44.061734	1
266	0103000020E6100000010000000A0000006DC83F33884F0540634337FB033B484034DAAA24B24F0540338B506C053B484089EDEE01BA4F0540F758FAD0053B484072F90FE9B74F05405070B1A2063B4840D9092FC1A94F054002D369DD063B484001FBE8D4954F0540384888F2053B48402EA9DA6E824F0540FD497CEE043B4840BDE47FF2774F054087191A4F043B484018B5FB55804F0540C24B70EA033B48406DC83F33884F0540634337FB033B4840	2020-04-16 20:02:34.350208	2020-04-16 20:02:34.350208	1
267	0103000020E61000000100000008000000685DA3E5404F054051A4FB39053B4840B7ED7BD45F4F0540F19BC24A053B484029B2D6506A4F0540E5ED08A7053B484067D13B15704F0540CD91955F063B48407311DF89594F054080F44D9A063B48406D1ADB6B414F0540AF78EA91063B48400D8D2782384F054027DD96C8053B4840685DA3E5404F054051A4FB39053B4840	2020-04-16 20:02:34.351984	2020-04-16 20:02:34.351984	1
268	0103000020E6100000010000000D000000E561A1D6344F0540DA73999A043B4840840EBA84434F054069006F81043B484034F279C5534F054034BF9A03043B48405C1D0071574F05405D86FF74033B48404BE658DE554F0540874D64E6023B4840685DA3E5404F0540F9C08EFF023B4840B2BCAB1E304F054058C9C7EE023B4840FC1BB4571F4F054058C9C7EE023B48402F87DD770C4F0540AB23473A033B4840FCE1E7BF074F05406FF1F09E033B4840CE33F6251B4F0540B1E07EC0033B48403A3B191C254F0540E621533E043B4840E561A1D6344F0540DA73999A043B4840	2020-04-16 20:02:34.353716	2020-04-16 20:02:34.353716	1
270	0103000020E61000000100000008000000D99596917A4F0540E21DE0490B3B484045292158554F0540E21DE0490B3B4840070ABC934F4F0540594E42E90B3B4840D95BCAF9624F05402F87DD770C3B48403A234A7B834F05405F0B7A6F0C3B4840E449D235934F05406BB933130C3B48408F368E588B4F0540F488D1730B3B4840D99596917A4F0540E21DE0490B3B4840	2020-04-16 20:02:34.357152	2020-04-16 20:02:34.357152	1
271	0103000020E61000000100000006000000F0FD0DDAAB4F0540535DC0CB0C3B4840C8D2872EA84F0540EE974F560C3B484034DAAA24B24F0540CAC16C020C3B484094675E0EBB4F05401D1CEC4D0C3B484061C26856B64F0540535DC0CB0C3B4840F0FD0DDAAB4F0540535DC0CB0C3B4840	2020-04-16 20:02:34.358813	2020-04-16 20:02:34.358813	1
272	0103000020E61000000100000007000000E4839ECDAA4F05408D2782380F3B484061889CBE9E4F054069519FE40E3B4840787C7BD7A04F054076FF58880E3B48401DE6CB0BB04F0540058C2E6F0E3B4840C24F1C40BF4F054076FF58880E3B48406D3CD862B74F05401CB4571F0F3B4840E4839ECDAA4F05408D2782380F3B4840	2020-04-16 20:02:34.360475	2020-04-16 20:02:34.360475	1
273	0103000020E6100000010000000B000000CE6DC2BD324F05409A0986730D3B484095456117454F05409A0986730D3B48407311DF89594F05407CF0DAA50D3B4840A0F99CBB5D4F0540522976340E3B48404BE658DE554F054058E6ADBA0E3B4840C8EA56CF494F0540C959D8D30E3B4840EB1ED95C354F0540AB402D060F3B48404B72C0AE264F0540C959D8D30E3B484007962364204F05406494675E0E3B4840357EE195244F05407CF0DAA50D3B4840CE6DC2BD324F05409A0986730D3B4840	2020-04-16 20:02:34.362342	2020-04-16 20:02:34.362342	1
274	0103000020E61000000100000007000000B8054B75014F054012A27C410B3B48403B8DB454DE4E0540D1B2EE1F0B3B48406EF8DD74CB4E0540D7A3703D0A3B48402499D53BDC4E0540A2629CBF093B48405778978BF84E0540D1E638B7093B48402ACAA5F10B4F0540FB7953910A3B4840B8054B75014F054012A27C410B3B4840	2020-04-16 20:02:34.364181	2020-04-16 20:02:34.364181	1
249	0103000020E61000000100000007000000D06ED9A9E04E0540C7D8F207153B4840FDCA2F0B144F054066EC9DD5143B48403CEA94CF194F0540529D9068143B48403CEA94CF194F05404AFC3C9F133B48405827133FED4E0540BB6F67B8133B4840A84353FEDC4E05403E4E83FB133B4840D06ED9A9E04E0540C7D8F207153B4840	2020-04-16 20:02:34.318297	2020-10-23 15:34:09.748697	1
279	0103000020E61000000100000008000000579E59EA03500540581B68552F3B48406D92380306500540FC2A95402E3B484012FC883715500540976524CB2D3B48408F3A53C020500540F66D5DBA2D3B4840C2DF487825500540EABFA3162E3B48404B5EB6751A50054023DA93D72E3B48406D923803065005406A86597F2F3B4840579E59EA03500540581B68552F3B4840	2020-04-16 20:02:34.373905	2020-10-23 15:34:09.754345	1
295	0103000020E6100000010000000700000097C79A91412E04405AD6FD6321304840BFB854A52D2E044088F2052D243048404D689258522E04408EAF3DB324304840083A5AD5922E0440414640852330484019ABCDFFAB2E0440C4245CC823304840B360E28FA22E0440DDB419A72130484097C79A91412E04405AD6FD6321304840	2020-05-07 13:11:36.333959	2020-05-07 13:11:36.333959	2
296	0103000020E61000000100000005000000852348A5D83104402F6D382C0D304840B876A224243204402E39EE940E304840522CB7B41A320440452DCDAD10304840DBFCBFEAC8310440F20698F90E304840852348A5D83104402F6D382C0D304840	2020-05-07 13:11:36.337512	2020-05-07 13:11:36.337512	2
297	0103000020E6100000010000000500000069C4CC3E8F3104405BD07B63083048409772BED87B31044065E256410C304840E60297C79A31044088B839950C3048401F65C405A0310440664AEB6F0930484069C4CC3E8F3104405BD07B6308304840	2020-05-07 13:11:36.339555	2020-05-07 13:11:36.339555	2
298	0103000020E610000001000000050000008B321B64923104409702D2FE0730484036936FB6B931044044DC9C4A06304840A2D45E44DB3104405C04C6FA0630484014252191B63104400DFFE9060A3048408B321B64923104409702D2FE07304840	2020-05-07 13:11:36.341522	2020-05-07 13:11:36.341522	2
299	0103000020E61000000100000005000000C07B478D09310440DA59F44E053048408C4AEA0434310440E5D3635B0630484075CAA31B6131044033A5F5B704304840D6A9F23D23310440D5D0066003304840C07B478D09310440DA59F44E05304840	2020-05-07 13:11:36.343578	2020-05-07 13:11:36.343578	2
300	0103000020E610000001000000050000002C616D8C9D300440B54FC76306304840D7C1C1DEC4300440B54FC76306304840F372D87DC73004404510E7E1043048401B2AC6F99B300440A41820D1043048402C616D8C9D300440B54FC76306304840	2020-05-07 13:11:36.353489	2020-05-07 13:11:36.353489	2
301	0103000020E61000000100000005000000AF22A303923004403EEB1A2D07304840FE9AAC510F310440FCFB8C0B07304840ED6305BF0D31044078B5DC990930484070B1A206D3300440664AEB6F09304840AF22A303923004403EEB1A2D07304840	2020-05-07 13:11:36.356308	2020-05-07 13:11:36.356308	2
302	0103000020E610000001000000050000006170CD1DFD2F0440C0B2D2A4143048405039268BFB2F04402FBE688F173048404AF086342A3004408318E8DA1730484039B9DFA12830044061AA99B5143048406170CD1DFD2F0440C0B2D2A414304840	2020-05-07 13:11:36.358413	2020-05-07 13:11:36.358413	2
303	0103000020E61000000100000005000000F20BAF24792E04409CA8A5B9153048406EF8DD74CB2E04406C2409C21530484008AEF204C22E044012A5BDC117304840A8ACA6EB892E04408FC6A17E17304840F20BAF24792E04409CA8A5B915304840	2020-05-07 13:11:36.360384	2020-05-07 13:11:36.360384	2
304	0103000020E610000001000000050000002C64AE0CAA2D04404DD7135D17304840BA13ECBFCE2D044065FF3C0D1830484081EB8A19E12D0440EF0225051630484015AA9B8BBF2D0440D7DAFB54153048402C64AE0CAA2D04404DD7135D17304840	2020-05-07 13:11:36.362265	2020-05-07 13:11:36.362265	2
305	0103000020E61000000100000005000000986BD102B42D0440E4D9E55B1F30484070B4E386DF2D0440499F56D11F3048401ADB6B41EF2D0440C1374D9F1D304840439259BDC32D0440399CF9D51C304840986BD102B42D0440E4D9E55B1F304840	2020-05-07 13:11:36.364383	2020-05-07 13:11:36.364383	2
306	0103000020E61000000100000005000000DCBB067DE92D0440E5F04927123048400F9BC8CC052E04406346787B103048406AA510C8252E0440802BD9B1113048400F9BC8CC052E04409162804413304840DCBB067DE92D0440E5F0492712304840	2020-05-07 13:11:36.369473	2020-05-07 13:11:36.369473	2
307	0103000020E61000000100000005000000261B0FB6D82D04407B8505F703304840F86C1D1CEC2D0440B0C6D97404304840BF44BC75FE2D0440B7B75B9203304840EDF2AD0FEB2D0440FF976BD102304840261B0FB6D82D04407B8505F703304840	2020-05-07 13:11:36.37195	2020-05-07 13:11:36.37195	2
308	0103000020E610000001000000060000003752B648DA2D0440158C4AEA04304840B41CE8A1B62D0440DEAE97A608304840BB2BBB60702D0440DEAE97A60830484016C26A2C612D0440746039420630484021EA3E00A92D04401C7DCC07043048403752B648DA2D0440158C4AEA04304840	2020-05-07 13:11:36.373703	2020-05-07 13:11:36.373703	2
309	0103000020E6100000010000000600000074B515FBCB2E04403541D47D003048400DDFC2BAF12E044041BB438A013048400DDFC2BAF12E044081423D7D04304840A19DD32CD02E0440C9224DBC03304840DAC534D3BD2E0440FFCBB5680130484074B515FBCB2E04403541D47D00304840	2020-05-07 13:11:36.375426	2020-05-07 13:11:36.375426	2
310	0103000020E610000001000000060000000395F1EF332E0440CBF27519FE2F4840581CCEFC6A2E04402BFBAE08FE2F48409775FF58882E0440EE940ED6FF2F484075931804562E0440E2E6543200304840035B25581C2E04404E9D47C5FF2F48400395F1EF332E0440CBF27519FE2F4840	2020-05-07 13:11:36.377148	2020-05-07 13:11:36.377148	2
311	0103000020E610000001000000050000004084B872F62E0440D578E926313048409B5434D6FE2E044033198EE733304840F1F3DF83D72E0440D41055F8333048401EDC9DB5DB2E04407670B037313048404084B872F62E0440D578E92631304840	2020-05-07 13:11:36.379277	2020-05-07 13:11:36.379277	2
312	0103000020E61000000100000006000000BFF2203D452E04407B1002F225304840F20BAF24792E0440D55B035B253048407AC4E8B9852E044081CD397826304840C423F1F2742E04406F2EFEB62730484053EBFD463B2E0440D4F36E2C28304840BFF2203D452E04407B1002F225304840	2020-05-07 13:11:36.381203	2020-05-07 13:11:36.381203	2
313	0103000020E61000000100000005000000F702B342912E0440164B917C2530484014B4C9E1932E0440751F80D426304840E0826C59BE2E0440E0D57267263048406344A2D0B22E0440118E59F624304840F702B342912E0440164B917C25304840	2020-05-07 13:11:36.382809	2020-05-07 13:11:36.382809	2
314	0103000020E61000000100000005000000BFF2203D452E04402D0B26FE28304840E1D40792772E0440C845B58828304840302B14E97E2E0440FC523F6F2A304840D029C8CF462E0440DE3994A12A304840BFF2203D452E04402D0B26FE28304840	2020-05-07 13:11:36.384625	2020-05-07 13:11:36.384625	2
315	0103000020E61000000100000005000000FD3383F8C02E0440D6AC33BE2F3048408A1D8D43FD2E0440653909A52F3048408A1D8D43FD2E0440C5758C2B2E304840FD3383F8C02E0440656D533C2E304840FD3383F8C02E0440D6AC33BE2F304840	2020-05-07 13:11:36.386293	2020-05-07 13:11:36.386293	2
316	0103000020E61000000100000005000000D594641D8E2E0440EF3CF19C2D30484019ABCDFFAB2E0440EF3CF19C2D3048400874266DAA2E0440F52D73BA2C304840D594641D8E2E04405436ACA92C304840D594641D8E2E0440EF3CF19C2D304840	2020-05-07 13:11:36.388549	2020-05-07 13:11:36.388549	2
317	0103000020E610000001000000050000004DA25EF0692E0440EF703B342C3048404162BB7B802E0440EF703B342C304840302B14E97E2E04404888F2052D3048401FBAA0BE652E0440B9FB1C1F2D3048404DA25EF0692E0440EF703B342C304840	2020-05-07 13:11:36.390357	2020-05-07 13:11:36.390357	2
318	0103000020E61000000100000005000000EBFCDB65BF2E04407AC5538F3430484079AC1919E42E04404A41B7973430484079AC1919E42E044091B932A836304840E0826C59BE2E0440F0C16B9736304840EBFCDB65BF2E04407AC5538F34304840	2020-05-07 13:11:36.392131	2020-05-07 13:11:36.392131	2
319	0103000020E61000000100000005000000904E5DF92C2F04401D59F96530304840F015DD7A4D2F0440BE50C07630304840F015DD7A4D2F04406AC2F6933130484084D4EDEC2B2F0440C9CA2F8331304840904E5DF92C2F04401D59F96530304840	2020-05-07 13:11:36.39379	2020-05-07 13:11:36.39379	2
320	0103000020E61000000100000005000000A185048C2E2F044059BF99982E3048408A05BEA25B2F0440B9C7D2872E3048408A05BEA25B2F04409BE271512D304840739D465A2A2F0440FBEAAA402D304840A185048C2E2F044059BF99982E304840	2020-05-07 13:11:36.39571	2020-05-07 13:11:36.39571	2
321	0103000020E61000000100000005000000E5ED08A7052F04403D0E83F92B304840F624B039072F04402CD7DB662A30484018CDCAF6212F04403E42CD902A304840FC1BB4571F2F04404F7974232C304840E5ED08A7052F04403D0E83F92B304840	2020-05-07 13:11:36.397418	2020-05-07 13:11:36.397418	2
322	0103000020E6100000010000000500000084D4EDEC2B2F0440D28BDAFD2A30484084D4EDEC2B2F0440F69507E9293048405CE333D93F2F0440F69507E9293048406D1ADB6B412F044043FF04172B30484084D4EDEC2B2F0440D28BDAFD2A304840	2020-05-07 13:11:36.399188	2020-05-07 13:11:36.399188	2
323	0103000020E610000001000000050000006D54A703592F0440E4F6CB272B30484079CE16105A2F0440AFE94141293048401D7233DC802F04408065A5492930484029ECA2E8812F0440147B681F2B3048406D54A703592F0440E4F6CB272B304840	2020-05-07 13:11:36.40084	2020-05-07 13:11:36.40084	2
324	0103000020E61000000100000005000000B60F79CBD52F0440EAE74D452A304840ABCFD556EC2F0440D9B0A6B2283048401CCEFC6A0E300440A33B889D29304840E9EE3A1BF22F0440556AF6402B304840B60F79CBD52F0440EAE74D452A304840	2020-05-07 13:11:36.402628	2020-05-07 13:11:36.402628	2
325	0103000020E61000000100000005000000FA25E2ADF32F044066A19DD32C304840CD77F01307300440EF703B342C304840A58636001B30044066A19DD32C3048409F8F32E20230044060B01BB62D304840FA25E2ADF32F044066A19DD32C304840	2020-05-07 13:11:36.404368	2020-05-07 13:11:36.404368	2
326	0103000020E61000000100000005000000C72E51BD3530044091D0967329304840C72E51BD3530044039B9DFA12830484099805F234930044039B9DFA1283048407DCF48844630044032C85D8429304840C72E51BD3530044091D0967329304840	2020-05-07 13:11:36.406234	2020-05-07 13:11:36.406234	2
327	0103000020E6100000010000000500000071C971A774300440E08442041C3048407CB779E3A4300440E08442041C3048406B80D250A33004403E59315C1D304840664F029B733004409E616A4B1D30484071C971A774300440E08442041C304840	2020-05-07 13:11:36.408114	2020-05-07 13:11:36.408114	2
328	0103000020E61000000100000005000000E3C798BB963004409ECF807A333048400470B378B1300440C896E5EB32304840E8F86871C6300440F12900C6333048404FCFBBB1A030044039D6C56D34304840E3C798BB963004409ECF807A33304840	2020-05-07 13:11:36.409934	2020-05-07 13:11:36.409934	2
329	0103000020E610000001000000050000006A6803B0013104403FC7478B333048405F28603B18310440279F1EDB323048402043C70E2A3104409221C7D633304840D1B2EE1F0B31044098DEFE5C343048406A6803B0013104403FC7478B33304840	2020-05-07 13:11:36.411618	2020-05-07 13:11:36.411618	2
330	0103000020E6100000010000000500000070253B36023104409F03CB113230484037FDD98F143104409F03CB1132304840596B28B517310440821E6ADB3030484054742497FF30044070B378B13030484070253B36023104409F03CB1132304840	2020-05-07 13:11:36.420853	2020-05-07 13:11:36.420853	2
331	0103000020E61000000100000005000000EC8502B68331044040FB91223230484036E50AEF72310440E126A3CA30304840C4CE143AAF310440D6AC33BE2F3048409CDD5A26C3310440DB3521AD31304840EC8502B68331044040FB912232304840	2020-05-07 13:11:36.42302	2020-05-07 13:11:36.42302	2
332	0103000020E610000001000000050000003C2EAA4544310440B89388F02F304840B47570B03731044077D844662E30484086C77E164B310440247EC51A2E30484020B75F3E5931044035B56CAD2F3048403C2EAA4544310440B89388F02F304840	2020-05-07 13:11:36.425083	2020-05-07 13:11:36.425083	2
333	0103000020E610000001000000050000004225AE635C310440F4C5DE8B2F3048409772BED87B3104401E8D43FD2E30484025AE635C713104401213D4F02D304840F2CEA10C553104406B2A8BC22E3048404225AE635C310440F4C5DE8B2F304840	2020-05-07 13:11:36.426774	2020-05-07 13:11:36.426774	2
334	0103000020E61000000100000005000000645930F147310440E97FB9162D304840034015376E310440E97FB9162D3048401477BCC96F3104401FF5D72B2C3048407590D7834931044060E4654D2C304840645930F147310440E97FB9162D304840	2020-05-07 13:11:36.428556	2020-05-07 13:11:36.428556	2
335	0103000020E610000001000000050000002DCE18E6042D04406B9F8EC70C304840D82E6D382C2D0440AB5AD2510E30484027BF45274B2D044088B839950C3048409FCC3FFA262D0440C51EDAC70A3048402DCE18E6042D04406B9F8EC70C304840	2020-05-07 13:11:36.430422	2020-05-07 13:11:36.430422	2
336	0103000020E61000000100000005000000B2BCAB1E302F044032C85D842930484079944A78422F0440F1D8CF622930484035B8AD2D3C2F044039B9DFA128304840739D465A2A2F04408C135FED28304840B2BCAB1E302F044032C85D8429304840	2020-05-07 13:11:36.432296	2020-05-07 13:11:36.432296	2
337	0103000020E61000000100000005000000653733FAD1300440414640852330484059F78F85E83004407787140324304840DCB8C5FCDC3004404012F6ED2430484015E126A3CA300440CAE1934E24304840653733FAD13004404146408523304840	2020-05-07 13:11:36.434071	2020-05-07 13:11:36.434071	2
338	0103000020E610000001000000050000008D28ED0DBE3004402D3F70952730484043C9E4D4CE300440CE3637A62730484043C9E4D4CE300440274EEE772830484054C6BFCFB8300440E55E6056283048408D28ED0DBE3004402D3F709527304840	2020-05-07 13:11:36.435788	2020-05-07 13:11:36.435788	2
339	0103000020E610000001000000050000008DEE2076A6300440C0CFB8702030484098A25C1ABF300440904B1C79203048409E5F94A0BF300440DDB419A72130484076FA415DA4300440B9DE3653213048408DEE2076A6300440C0CFB87020304840	2020-05-07 13:11:36.438048	2020-05-07 13:11:36.438048	2
340	0103000020E6100000010000000500000028452BF702330440051A6CEA3C304840BC3D0801F93204409372F7393E30484067F0F78BD93204402EAD86C43D304840EFA83121E63204401D76DF313C30484028452BF702330440051A6CEA3C304840	2020-05-07 13:11:36.440543	2020-05-07 13:11:36.440543	2
341	0103000020E61000000100000005000000ECBFCE4D9B310440B5C35F9335304840F7730AF2B33104401A89D00836304840CA8B4CC0AF310440376E313F373048405E4A5D328E31044031B1F9B836304840ECBFCE4D9B310440B5C35F9335304840	2020-05-07 13:11:36.442602	2020-05-07 13:11:36.442602	2
342	0103000020E61000000100000005000000FDF675E09C310440C00985083830484030D63730B931044001F9122A3830484047CA1649BB310440EF59D76839304840D00EB8AE983104407DE6AC4F39304840FDF675E09C310440C009850838304840	2020-05-07 13:11:36.444814	2020-05-07 13:11:36.444814	2
343	0103000020E610000001000000050000006C21C84109330440B1BFEC9E3C30484028B9C3263233044070D05E7D3C3048404A27124C353304405F99B7EA3A304840170E846401330440473D44A33B3048406C21C84109330440B1BFEC9E3C304840	2020-05-07 13:11:36.447264	2020-05-07 13:11:36.447264	2
344	0103000020E61000000100000005000000FA0AD28C45330440F99FFCDD3B304840FA0AD28C453304405F99B7EA3A304840D21918795933044059DC7F643A30484005BF0D315E3304402367614F3B304840FA0AD28C45330440F99FFCDD3B304840	2020-05-07 13:11:36.449077	2020-05-07 13:11:36.449077	2
345	0103000020E610000001000000050000009FAEEE586C330440D00CE2033B3048408E7747C66A330440A779C7293A3048407D7A6CCB80330440C59272F7393048408237A451813304408F1D54E23A3048409FAEEE586C330440D00CE2033B304840	2020-05-07 13:11:36.451009	2020-05-07 13:11:36.451009	2
346	0103000020E61000000100000005000000D253E410713304409A97C3EE3B304840554FE61F7D3304409A97C3EE3B3048407100FDBE7F33044052B7B3AF3C304840B6A2CD716E330440C32ADEC83C304840D253E410713304409A97C3EE3B304840	2020-05-07 13:11:36.452842	2020-05-07 13:11:36.452842	2
347	0103000020E61000000100000007000000F9669B1BD3330440280D350A49304840CC7EDDE9CE3304409AB4A9BA473048409E0AB8E7F9330440B8CD548847304840041BD7BFEB330440B1DCD26A48304840D175E107E73304400AF4893C49304840F4A96395D23304405D4E098849304840F9669B1BD3330440280D350A49304840	2020-05-07 13:11:36.454947	2020-05-07 13:11:36.454947	2
348	0103000020E61000000100000005000000EEEC2B0FD23304403674B33F50304840D7F84CF6CF330440072461DF4E3048400A647616BD33044078978BF84E304840F92CCF83BB330440957CEC2E50304840EEEC2B0FD23304403674B33F50304840	2020-05-07 13:11:36.457046	2020-05-07 13:11:36.457046	2
349	0103000020E610000001000000050000004F0647C9AB3304402BFA43334F30484054C37E4FAC330440185B087250304840490F43AB9333044048DFA46950304840882EA86F99330440E90AB6114F3048404F0647C9AB3304402BFA43334F304840	2020-05-07 13:11:36.458905	2020-05-07 13:11:36.458905	2
350	0103000020E6100000010000000500000005F9D9C87533044096B036C64E304840F4FBFECD8B330440C0779B374E3048406C43C5387F33044038DC476E4D3048407D40A033693304401F80D4264E30484005F9D9C87533044096B036C64E304840	2020-05-07 13:11:36.460786	2020-05-07 13:11:36.460786	2
351	0103000020E610000001000000050000000C5A48C0E8320440E44D7E8B4E3048408315A75A0B330440B4C9E1934E3048408315A75A0B33044090BFB4A84F30484001E0D8B3E7320440BF4351A04F3048400C5A48C0E8320440E44D7E8B4E304840	2020-05-07 13:11:36.46251	2020-05-07 13:11:36.46251	2
352	0103000020E61000000100000005000000074147AB5A3204406FD6E07D55304840DA9255116E32044069E55E6056304840EB8F300C583204400F9A5DF7563048403BAC70CB47320440F2B4FCC055304840074147AB5A3204406FD6E07D55304840	2020-05-07 13:11:36.464606	2020-05-07 13:11:36.464606	2
353	0103000020E6100000010000000600000067B62BF4C13204402AC6F99B50304840FBE8D495CF320440B39597FC4F30484095D8B5BDDD320440E31934F44F30484078616BB6F23204409B3924B550304840CE001764CB320440535914765130484067B62BF4C13204402AC6F99B50304840	2020-05-07 13:11:36.466366	2020-05-07 13:11:36.466366	2
354	0103000020E61000000100000005000000450E1137A7320440E8A221E351304840A0185932C73204401827BEDA5130484089247A19C53204405FD38382523048400CACE3F8A13204402F4FE78A52304840450E1137A7320440E8A221E351304840	2020-05-07 13:11:36.468457	2020-05-07 13:11:36.468457	2
355	0103000020E6100000010000000500000078B306EFAB320440A67F492A53304840B14F00C5C83204405325CADE523048403A083A5AD5320440295E656D53304840BD8FA339B2320440FF9600FC5330484078B306EFAB320440A67F492A53304840	2020-05-07 13:11:36.470768	2020-05-07 13:11:36.470768	2
356	0103000020E61000000100000005000000B2A19BFD813204405D6BEF5355304840D449B6BA9C32044016BF29AC54304840A69BC420B0320440E0490B9755304840349D9D0C8E32044027F6D03E56304840B2A19BFD813204405D6BEF5355304840	2020-05-07 13:11:36.472921	2020-05-07 13:11:36.472921	2
357	0103000020E61000000100000005000000FB5C6DC5FE320440267156444D30484078616BB6F232044020B41EBE4C304840AB402D060F33044086ADD9CA4B30484033F9669B1B3304401406651A4D304840FB5C6DC5FE320440267156444D304840	2020-05-07 13:11:36.475053	2020-05-07 13:11:36.475053	2
358	0103000020E61000000100000005000000C16ED8B62833044037A8FDD64E304840890CAB78233304401F80D4264E3048401C3F541A313304403D997FF44D304840446ADAC534330440072461DF4E304840C16ED8B62833044037A8FDD64E304840	2020-05-07 13:11:36.479402	2020-05-07 13:11:36.479402	2
359	0103000020E61000000100000005000000685A626534320440CCF10A444F3048402F3201BF46320440672C9ACE4E3048408A027D224F3204407E54C37E4F304840850B790437320440A22AA6D24F304840685A626534320440CCF10A444F304840	2020-05-07 13:11:36.485958	2020-05-07 13:11:36.485958	2
360	0103000020E61000000100000005000000C2120F289B320440A662635E47304840CE52B29C84320440A662635E47304840B2A19BFD8132044034BBEEAD4830484007EFAB72A132044076AA7CCF48304840C2120F289B320440A662635E47304840	2020-05-07 13:11:36.488118	2020-05-07 13:11:36.488118	2
361	0103000020E610000001000000050000009B73F04C683204405E82531F48304840B8EA3A5453320440CFF57D3848304840BDA772DA53320440C904FC1A49304840BDE13E726B320440C904FC1A493048409B73F04C683204405E82531F48304840	2020-05-07 13:11:36.489873	2020-05-07 13:11:36.489873	2
362	0103000020E610000001000000050000001878EE3D5C3204405055A18158304840C85BAE7E6C3204407FD93D795830484029E9616875320440DEAD2CD159304840EB8F300C58320440DEAD2CD1593048401878EE3D5C3204405055A18158304840	2020-05-07 13:11:36.491637	2020-05-07 13:11:36.491637	2
363	0103000020E61000000100000005000000C6C1A563CE3304406919A9F754304840109546CCEC33044034D8D47954304840AF415F7AFB330440223999B855304840EEEC2B0FD233044069E55E6056304840C6C1A563CE3304406919A9F754304840	2020-05-07 13:11:36.493367	2020-05-07 13:11:36.493367	2
364	0103000020E6100000010000000500000033E197FA79330440677DCA3159304840276728EE7833044013EF004F5A3048408EEBDFF59933044073F7393E5A3048403E95D39E92330440F609A0185930484033E197FA79330440677DCA3159304840	2020-05-07 13:11:36.49525	2020-05-07 13:11:36.49525	2
365	0103000020E61000000100000005000000E38A8BA3723304400B96EA025E304840B5DC9909863304403B1A87FA5D304840B5DC99098633044064ADA1D45E304840CC96AC8A70330440352905DD5E304840E38A8BA3723304400B96EA025E304840	2020-05-07 13:11:36.496997	2020-05-07 13:11:36.496997	2
366	0103000020E6100000010000000500000001E0D8B3E7320440A14D0E9F74304840E42EC214E53204405EF6EB4E7730484039B69E211C3304405839B4C8763048400CCEE0EF173304403C889D297430484001E0D8B3E7320440A14D0E9F74304840	2020-05-07 13:11:36.498759	2020-05-07 13:11:36.498759	2
367	0103000020E610000001000000050000006DE7FBA9F13204409016670C7330484039B69E211C3304409016670C733048405567B5C01E3304402B85402E713048407E1EA33CF3320440D82AC1E2703048406DE7FBA9F13204409016670C73304840	2020-05-07 13:11:36.500492	2020-05-07 13:11:36.500492	2
368	0103000020E610000001000000050000004A27124C35330440637FD93D79304840608F899466330440215C01857A3048405B9885764E3304403293A8177C304840B03731242733044032C7F2AE7A3048404A27124C35330440637FD93D79304840	2020-05-07 13:11:36.502191	2020-05-07 13:11:36.502191	2
369	0103000020E6100000010000000500000077F700DD973304403E75AC527A304840D2C77C40A03304407BDB4C8578304840FFE9060ABC3304401CD3139678304840999F1B9AB2330440D3BEB9BF7A30484077F700DD973304403E75AC527A304840	2020-05-07 13:11:36.504121	2020-05-07 13:11:36.504121	2
370	0103000020E61000000100000005000000328FFCC1C0330440F7AB00DF6D304840041BD7BFEB33044027309DD66D304840D732198EE733044008E3A7716F304840328FFCC1C03304402DEDD45C6E304840328FFCC1C0330440F7AB00DF6D304840	2020-05-07 13:11:36.506304	2020-05-07 13:11:36.506304	2
371	0103000020E61000000100000005000000A98427F4FA3304408BC1C3B46F304840F9DA334B02340440CDE49B6D6E3048400A4CA7751B34044050C3B7B06E304840C0B2D2A414340440A3E9EC6470304840A98427F4FA3304408BC1C3B46F304840	2020-05-07 13:11:36.508373	2020-05-07 13:11:36.508373	2
372	0103000020E61000000100000005000000709692E5243404405B09DD257130484031B1F9B8363404405B09DD2571304840810706103E3404402594BE1072304840486B0C3A2134044066834C3272304840709692E5243404405B09DD2571304840	2020-05-07 13:11:36.510214	2020-05-07 13:11:36.510214	2
373	0103000020E61000000100000005000000F8C264AA603404402B51F6967230484026AB22DC64340440B42094F771304840315F5E807D34044037FFAF3A723048400377A04E79340440018A912573304840F8C264AA603404402B51F69672304840	2020-05-07 13:11:36.512028	2020-05-07 13:11:36.512028	2
374	0103000020E61000000100000005000000315F5E807D340440F6436CB070304840BFD4CF9B8A340440792288F3703048405E81E84999340440C10298327030484097A949F086340440BB4560AC6F304840315F5E807D340440F6436CB070304840	2020-05-07 13:11:36.513703	2020-05-07 13:11:36.513703	2
375	0103000020E6100000010000000500000058FE7C5BB03404403F58C6866E30484009E23C9CC0340440D3A1D3F36E304840B9C5FCDCD034044098A3C7EF6D304840BF4868CBB9340440C26A2C616D30484058FE7C5BB03404403F58C6866E304840	2020-05-07 13:11:36.515366	2020-05-07 13:11:36.515366	2
376	0103000020E61000000100000005000000D55B035B253804405E13D21A833048408B36C7B94D380440FE0A992B833048407442E8A04B380440E0BDA3C6843048408BC22E8A1E3804402D5BEB8B84304840D55B035B253804405E13D21A83304840	2020-05-07 13:11:36.517083	2020-05-07 13:11:36.517083	2
377	0103000020E610000001000000050000002BD9B11188370440B9C667B27F3048402B137EA99F370440B9C667B27F3048408CA03193A837044012DE1E8480304840096B63EC84370440E259828C803048402BD9B11188370440B9C667B27F304840	2020-05-07 13:11:36.518669	2020-05-07 13:11:36.518669	2
378	0103000020E6100000010000000500000081785DBF60370440598AE42B81304840CBD765F84F3704406404543882304840D68BA19C68370440994528B6823048403DD68C0C72370440ACE463778130484081785DBF60370440598AE42B81304840	2020-05-07 13:11:36.520502	2020-05-07 13:11:36.520502	2
379	0103000020E6100000010000000500000044FD2E6CCD3604408A7615527E3048408813984EEB36044061E3FA777D3048408D0A9C6C03370440AD4CF8A57E3048408D96033DD43604402A3A92CB7F30484044FD2E6CCD3604408A7615527E304840	2020-05-07 13:11:36.522497	2020-05-07 13:11:36.522497	2
380	0103000020E61000000100000005000000874D64E6023704406D91B41B7D30484054E23AC6153704401903EB387E304840E257ACE122370440C6A86BED7D304840F94B8BFA2437044055698B6B7C304840874D64E6023704406D91B41B7D304840	2020-05-07 13:11:36.524113	2020-05-07 13:11:36.524113	2
381	0103000020E61000000100000006000000F99D2633DE3604407973B8567B3048409E077767ED360440FC51D4997B304840D1E638B709370440D3BEB9BF7A30484065A54929E8360440274D83A27930484088D9CBB6D33604404432E4D87A304840F99D2633DE3604407973B8567B304840	2020-05-07 13:11:36.525864	2020-05-07 13:11:36.525864	2
382	0103000020E61000000100000006000000EE5D83BEF4360440B6D958897930484021C9ACDEE13604405DC2A1B778304840AF3E1EFAEE36044057056A3178304840B5352218073704400A68226C78304840058C2E6F0E37044010255AF278304840EE5D83BEF4360440B6D9588979304840	2020-05-07 13:11:36.527543	2020-05-07 13:11:36.527543	2
383	0103000020E61000000100000005000000B891B245D22E0440E7E3DA50313048409CE09BA6CF2E0440BD1C76DF3130484008AEF204C22E04401C25AFCE313048403B53E8BCC62E04407670B03731304840B891B245D22E0440E7E3DA5031304840	2020-05-07 20:26:15.745383	2020-05-07 20:26:15.745383	2
384	0103000020E61000000100000005000000FCE1E7BF072F044049D9226937304840EBE40CC51D2F0440AE9E93DE3730484068E90AB6112F044018213CDA38304840AC8BDB68002F0440C5C6BC8E38304840FCE1E7BF072F044049D9226937304840	2020-05-07 20:26:15.779317	2020-05-07 20:26:15.779317	2
385	0103000020E610000001000000050000006E6C76A4FA2E04404FE78A52423048403B014D840D2F0440F0DE51634230484040BE840A0E2F0440E9EDCF454330484024D3A1D3F32E0440E9EDCF45433048406E6C76A4FA2E04404FE78A5242304840	2020-05-07 20:26:15.811364	2020-05-07 20:26:15.811364	2
386	0103000020E610000001000000050000002A90D959F42E044035EF384547304840F624B039072F044035EF384547304840F624B039072F0440DBA337DC47304840195932C7F22E0440DBA337DC473048402A90D959F42E044035EF384547304840	2020-05-07 20:26:15.843081	2020-05-07 20:26:15.843081	2
387	0103000020E61000000100000005000000EB707495EE2E044052D4997B4830484068AF3E1EFA2E044052D4997B4830484068AF3E1EFA2E0440280D350A49304840D47C957CEC2E0440280D350A49304840EB707495EE2E044052D4997B48304840	2020-05-07 20:26:15.875177	2020-05-07 20:26:15.875177	2
292	0103000020E6100000010000000500000029B2D6506A4F0540E8BD3104003B4840BDAAB35A604F0540E8BD3104003B4840C8242367614F05404209336DFF3A48406D8E739B704F0540B37C5D86FF3A484029B2D6506A4F0540E8BD3104003B4840	2020-04-16 20:02:34.398146	2020-04-16 20:02:34.398146	1
394	0103000020E61000000100000005000000C259936C4A500540015507DA353B4840BC86548B515005405325B451353B48406FA17A0E5D500540B2837BA4353B4840AE2EF5DC5350054001E12D12363B4840C259936C4A500540015507DA353B4840	2020-09-04 20:16:25.935808	2020-10-23 15:34:09.745614	1
202	0103000020E61000000100000006000000390B29844A4F0540876AE5B2323B48408F1E6D61524F05404274D573333B48400C970382754F0540131E9F56323B4840118E07A08D4F05403349CC41313B48400C970382754F054008CCB167303B4840390B29844A4F0540876AE5B2323B4840	2020-04-16 20:02:34.232337	2020-10-23 15:34:09.786205	1
198	0103000020E61000000100000005000000793BB463B94E05407FA7DDE5373B484018E8CC11C84E0540C93DA38D383B484062BB6D7AE64E05406D3CECBB373B484073B84875D04E0540AF59E0B7363B4840793BB463B94E05407FA7DDE5373B4840	2020-04-16 20:02:34.22517	2020-10-23 15:34:09.797532	1
291	0103000020E61000000100000005000000B72E7E0269500540919FF30B1F3B48407849E5D57A500540E34F85681D3B4840D3532DD19A500540C71AF6DD1D3B4840F0CA77D885500540365FF2A21F3B4840B72E7E0269500540919FF30B1F3B4840	2020-04-16 20:02:34.396283	2020-10-23 15:34:09.804015	1
286	0103000020E610000001000000060000002E37E432934E054088D3A4CE293B4840014F26018F4E0540529DD050293B484084105C78834E05409F3A1816293B48404034BF2D7D4E054082216D48293B48402383A88E7A4E05400F8BDC542A3B48402E37E432934E054088D3A4CE293B4840	2020-04-16 20:02:34.387062	2020-10-23 15:34:09.850641	1
199	0103000020E6100000010000000500000029ABDB749A4E0540FF73770B393B4840B263150AA74E0540F893D9AA393B4840B75A1928BF4E05400D064DF2383B484018AE007AB04E054033FF9520383B484029ABDB749A4E0540FF73770B393B4840	2020-04-16 20:02:34.226872	2020-10-23 15:34:09.937996	1
201	0103000020E61000000100000007000000F5F4BFA12C4F054034E2FF8C333B4840B70F27753E4F05403B943713343B484050C53B05354F0540880319FE343B48409BEA77A60C4F0540F9764317353B484045D733C9044F05406EF1EF4D343B4840D909DD6A124F0540A5552AA6333B4840F5F4BFA12C4F054034E2FF8C333B4840	2020-04-16 20:02:34.230549	2020-10-23 15:34:09.9581	1
197	0103000020E61000000100000005000000F0F612FEDB4E05406D0E86E1383B4840E4B66F89F24E0540D3F65C31383B484084638837014F0540FF73770B393B4840450A57DBE34E0540F893D9AA393B4840F0F612FEDB4E05406D0E86E1383B4840	2020-04-16 20:02:34.222987	2020-10-23 15:34:09.970356	1
290	0103000020E6100000010000000500000091F9C900914F0540A8575D211C3B4840B3A1E4BDAB4F05401BAFA37D1C3B4840F1C04982B14F0540885A96101C3B4840ADAAE09F934F0540A38F259B1B3B484091F9C900914F0540A8575D211C3B4840	2020-04-16 20:02:34.394361	2020-10-23 15:34:09.975866	1
289	0103000020E610000001000000050000007C8F0247D14E05403FC3AB59203B4840A977C078D54E0540E98410CB1F3B4840549E4833E54E0540BCE48F16203B48401B3C1BF5DF4E054091282BA5203B48407C8F0247D14E05403FC3AB59203B4840	2020-04-16 20:02:34.392516	2020-10-27 11:58:43.906341	1
293	0103000020E6100000010000000700000060BE09E7F74F0540F7A8B0BEFA3A48401B5605CC20500540BF4F7666FB3A4840FE18875C4D500540BF4F7666FB3A4840377BB49A5250054012E93F49FA3A4840D1F6FC9231500540063B86A5FA3A484071F5B079F94F054071F17838FA3A484060BE09E7F74F0540F7A8B0BEFA3A4840	2020-04-16 20:02:34.399994	2020-10-27 11:58:43.983356	1
203	0103000020E610000001000000050000001D77285FA34B05402E380CB12D3B48406A9426A2904B054041E919702E3B4840DF1DF702864B054034F543372E3B484067D63098924B05408A67295D2D3B48401D77285FA34B05402E380CB12D3B4840	2020-04-16 20:02:34.234216	2020-10-27 11:58:43.99106	1
288	0103000020E61000000100000005000000104E13B9AF4E0540B5383C4D1F3B4840F3D6C8B1C44E05408898BB981F3B4840C6EE0A80C04E05405DDC5627203B4840F39CFC19AD4E05405BF83AE41F3B4840104E13B9AF4E0540B5383C4D1F3B4840	2020-04-16 20:02:34.390591	2020-10-27 11:58:44.026609	1
287	0103000020E61000000100000005000000B57D9755A74E0540A2235D341D3B48405AAD1BF29E4E05408D9A21731E3B48402C73C287E14E0540E5BCD8441F3B4840A3BA88F2D44E05409959BFD31D3B4840B57D9755A74E0540A2235D341D3B4840	2020-04-16 20:02:34.388845	2020-10-27 11:58:44.091387	1
204	0103000020E610000001000000070000004BAA53450B4C054032EFBF1F2D3B48405624C3510C4C054098A930952D3B4840CDA55554174C0540FB8A85C72D3B484061D8FEF5244C054098A930952D3B48406D526E02264C054091F7F80E2D3B4840D91FC560184C0540F0FF31FE2C3B48404BAA53450B4C054032EFBF1F2D3B4840	2020-04-16 20:02:34.236166	2020-10-27 11:58:44.10113	1
294	0103000020E610000001000000070000005A649438EB5005402AC7DF72023B48404F24F1C3015105404D9DC2C6023B484043E44D4F185105402AC7DF72023B484043E44D4F18510540F4850BF5013B48402DB6A29EFE500540F4850BF5013B48404FEA242CEA50054006F1FC1E023B48405A649438EB5005402AC7DF72023B4840	2020-04-16 20:02:34.401926	2020-10-27 11:58:44.118716	1
209	0103000020E610000001000000050000007915F204AE4D0540E1C1A7922D3B48408A12CDFF974D0540D32FD2AB2D3B48405D2A0FCE934D05404E951C432C3B4840632113ECAB4D0540BC2F2B192C3B48407915F204AE4D0540E1C1A7922D3B4840	2020-04-16 20:02:34.245774	2020-10-27 11:58:43.988198	1
269	0103000020E610000001000000050000003A0C24EFAE4F0540241581B70A3B48402EE3A6069A4F0540958098840B3B484012895FE6624F0540F0295D87093B4840D445BDB1764F054031D52380083B48403A0C24EFAE4F0540241581B70A3B4840	2020-04-16 20:02:34.355397	2020-10-23 10:02:33.970849	1
284	0103000020E61000000100000005000000755A81CB4B4E054092989EC73B3B484003D0F2E6584E054092989EC73B3B4840FD12BB60584E0540B97503393B3B48404772C399474E0540B97503393B3B4840755A81CB4B4E054092989EC73B3B4840	2020-04-16 20:02:34.383122	2020-10-27 11:58:44.075042	1
282	0103000020E6100000010000000600000046639B99D54E0540D8B2E2E0333B484029B284FAD24E05400F171D39333B4840A1F94A65C64E0540DF928041333B4840B7ED297EC84E05406A18D40A343B484051DD0AA6D64E05400B109B1B343B484046639B99D54E0540D8B2E2E0333B4840	2020-04-16 20:02:34.379603	2020-10-23 15:34:09.737582	1
396	0103000020E61000000100000005000000FFA2A801E94D0540BB601ACD443B4840215DF7C1EB4D05401E25CC15443B4840E7795BC6FE4D054033A0B824443B4840E60B034FFC4D0540B6A518EF443B4840FFA2A801E94D0540BB601ACD443B4840	2020-09-04 20:16:26.522671	2020-10-23 15:34:09.751649	1
280	0103000020E61000000100000005000000B72B0DD40C50054085397D382C3B48406DCC049B1D50054085397D382C3B48408F3A53C0205005404C1F8D772B3B48409B7AF6340A500540EC1654882B3B4840B72B0DD40C50054085397D382C3B4840	2020-04-16 20:02:34.3758	2020-10-23 15:34:09.769271	1
392	0103000020E610000001000000050000008882AE8B924E054090DB14E42B3B48402DCEC95D894E054085B2C4DB2A3B4840F76CBC849A4E0540C6D870622A3B4840FC68E792A84E054055C167222B3B48408882AE8B924E054090DB14E42B3B4840	2020-07-12 22:25:17.522168	2020-10-23 15:34:09.773882	1
247	0103000020E610000001000000060000008D05F93F784D05401875FD3E463B48404E5A2CABA14D0540B96CC44F463B4840B56A4B83934D0540210B5108473B4840CC5E2A9C954D0540915B1547483B484076111A27764D0540C0DFB13E483B48408D05F93F784D05401875FD3E463B4840	2020-04-16 20:02:34.314637	2020-10-23 15:34:09.776919	1
276	0103000020E61000000100000005000000F56AE731F44C054039086CB10B3B484072A9B1BAFF4C054039086CB10B3B48406DEC7934FF4C05405348FB3B0B3B4840FB271FB8F44C05405348FB3B0B3B4840F56AE731F44C054039086CB10B3B4840	2020-04-16 20:02:34.367984	2020-10-23 15:34:09.779666	1
244	0103000020E610000001000000050000003112747A574D0540629552C23F3B4840C5441D1C654D0540FA1E48273E3B48409D536308794D05401B110F383E3B4840AE8A0A9B7A4D0540D02F61983F3B48403112747A574D0540629552C23F3B4840	2020-04-16 20:02:34.309198	2020-10-23 15:34:09.789047	1
256	0103000020E61000000100000005000000AF3953A6E94E05401C5648C4183B4840F80CF40E084F0540620D0E6C193B4840D69EA5E9044F0540CAB69A241A3B48405FE3464FE24E0540138CAA63193B4840AF3953A6E94E05401C5648C4183B4840	2020-04-16 20:02:34.33054	2020-10-23 15:34:09.792045	1
253	0103000020E61000000100000008000000BF373217DF4E054081665BB4123B484042333426EB4E0540D4C0DAFF123B484025BCE91E004F0540044577F7123B484053A4A750044F0540AC22C025123B4840B3F78EA2F54E054059C840DA113B48400314CF61E54E05402944A4E2113B4840B97AFA90DE4E05406D174E47123B4840BF373217DF4E054081665BB4123B4840	2020-04-16 20:02:34.32556	2020-10-23 15:34:09.806984	1
391	0103000020E61000000100000005000000016E3050884E0540DCE00154283B48402C7269AB7B4E05401AF6EBCC273B4840CB5DC453864E0540369EB064273B4840A14C32AF8F4E0540CB82D6DC273B4840016E3050884E0540DCE00154283B4840	2020-07-12 22:25:17.501404	2020-10-23 15:34:09.823544	1
254	0103000020E61000000100000007000000A9CFBACEAD4E05403E4E83FB133B4840BACC95C9974E0540DE454A0C143B4840424B03C78C4E0540830549A3143B484048083B4D8D4E054009C88029153B48409798133CAC4E05401D178E96153B48403188F463BA4E05405481ACAB143B4840A9CFBACEAD4E05403E4E83FB133B4840	2020-04-16 20:02:34.327228	2020-10-23 15:34:09.826623	1
226	0103000020E610000001000000070000003BFB6A27554E054054BB7F46403B4840D5B07FB74B4E054069FF8CB3403B4840FDA139CB374E054057949B89403B48403B87D2F7254E0540D392196C413B4840855A7360444E0540145441B3423B4840244158A66A4E0540C1272842413B48403BFB6A27554E054054BB7F46403B4840	2020-04-16 20:02:34.277785	2020-10-23 15:34:09.835984	1
251	0103000020E61000000100000005000000F7F528E4714F0540ED92F19E153B4840E5321A819F4F05401069D4F2153B4840DAB8AA749E4F054095703ACD143B4840027098F0724F05405481ACAB143B4840F7F528E4714F0540ED92F19E153B4840	2020-04-16 20:02:34.32213	2020-10-23 15:34:09.841675	1
263	0103000020E61000000100000005000000D14093FADC4D05403B5F1C23093B4840BA868079F24D05409A675512093B4840AF0C116DF14D0540624D6551083B4840C6C623EEDB4D0540C1559E40083B4840D14093FADC4D05403B5F1C23093B4840	2020-04-16 20:02:34.344494	2020-10-23 15:34:09.844675	1
222	0103000020E6100000010000000800000013B194F12A5005408E30C087353B4840FCBCB5D8285005400B52A444353B48406E81105533500540F9E6B21A353B4840F17C12643F50054088738801353B484013EB6089425005401DBD956E353B484096AC960037500540409378C2353B4840351FE3162E500540409378C2353B484013B194F12A5005408E30C087353B4840	2020-04-16 20:02:34.270862	2020-10-23 15:34:09.847648	1
224	0103000020E61000000100000007000000B2CAC8D8244F054029B4DFA32D3B4840ED509C5C184F0540900843F02D3B48401111A5C01A4F0540812A0B3D2E3B48407894249B124F0540168BCC812E3B4840E7F7DD86394F0540CF5F9A982F3B4840FC54E740494F0540432978252F3B4840B2CAC8D8244F054029B4DFA32D3B4840	2020-04-16 20:02:34.274338	2020-10-23 15:34:09.855458	1
399	0103000020E61000000100000007000000F3BF8CF7BE4E054096AC271A3E3B484051DFB55B9E4E054034F6B9183F3B4840B2D218888C4E054047077D5B3E3B48403BA0B9C69F4E05405514A78A3D3B4840B4502433AD4E0540149C6FA63D3B4840C119302ABA4E0540A4E7CF6F3D3B4840F3BF8CF7BE4E054096AC271A3E3B4840	2020-09-04 21:35:07.650344	2020-10-23 15:34:09.858441	1
260	0103000020E61000000100000005000000977C35EF794F0540E533A1AB1D3B484041A3BDA9894F0540BCA66A8E1C3B4840132F98A7B44F0540E533A1AB1D3B484013F5CB0F9D4F0540BC5B587D1E3B4840977C35EF794F0540E533A1AB1D3B4840	2020-04-16 20:02:34.338504	2020-10-23 15:34:09.86204	1
233	0103000020E61000000100000005000000D380E175084F0540FE71B1E33F3B48403A05997D294F0540C089A5DF3E3B48405033442E434F0540FE71B1E33F3B4840AB8F27621C4F05403B5ABDE7403B4840D380E175084F0540FE71B1E33F3B4840	2020-04-16 20:02:34.290375	2020-10-23 15:34:09.867415	1
216	0103000020E61000000100000007000000F5BAA6CBE34E054073868E792C3B48406700080CD44E0540D1F71DAF2B3B48400743A379FA4E0540ED3FD74D2A3B4840F3AF029B064F05400D632AD22A3B48409C59CAC2FA4E054099C855402B3B4840AF38E85B014F05407B3300912B3B4840F5BAA6CBE34E054073868E792C3B4840	2020-04-16 20:02:34.259246	2020-10-23 15:34:09.872352	1
219	0103000020E6100000010000000B000000680BB656F04E054004F39524303B484095F37388F44E0540A8C37878303B4840F6802772FD4E05406AAD069A303B4840674582EE074F0540A8C37878303B4840BD58C6CB0F4F054046E22346303B4840D34CA5E4114F0540509BDDE92F3B4840B79B8E450F4F0540ACCAFA952F3B48404B946B4F054F05400CD333852F3B4840D9CF10D3FA4E05400CD333852F3B48406DC8EDDCF04E05406EB488B72F3B4840680BB656F04E054004F39524303B4840	2020-04-16 20:02:34.264547	2020-10-23 15:34:09.877572	1
283	0103000020E610000001000000050000007FBE1F52A24E0540C12F9F523A3B484051102EB8B54E054091AB025B3A3B484068040DD1B74E0540E9D39DE93A3B48407FBE1F52A24E05405A47C8023B3B48407FBE1F52A24E0540C12F9F523A3B4840	2020-04-16 20:02:34.381385	2020-10-23 15:34:09.880598	1
265	0103000020E61000000100000009000000A92EC0DB6E4D0540E78F6CDC093B48405950BEA06F4D0540F496C3380A3B48402BB3A717784D05407EEB52760A3B48405AE57E7B874D05409420DB630A3B4840E71166B7904D0540826CBCE8093B48409E41EBCA8E4D054034523636093B4840B1D10705844D0540F43E07E0083B4840E7563BC8704D054034523636093B4840A92EC0DB6E4D0540E78F6CDC093B4840	2020-04-16 20:02:34.348284	2020-10-27 11:58:44.123524	1
234	0103000020E61000000100000005000000EB52C397944E0540E4CFA4BB423B4840DA8FB434C24E0540621FEF52413B48409527B019EB4E0540E4CFA4BB423B4840FCC336C2AD4E0540F60C300B443B4840EB52C397944E0540E4CFA4BB423B4840	2020-04-16 20:02:34.292004	2020-10-23 15:34:09.883557	1
397	0103000020E61000000100000005000000DB92A01BE24E05401C170C7C113B4840398B6DC2DC4E05402BDCDBDF113B48400BE64A65D34E0540001BCCBA113B4840526EBA15DA4E05409E8AD54F113B4840DB92A01BE24E05401C170C7C113B4840	2020-09-04 21:35:07.613082	2020-10-23 15:34:09.89303	1
231	0103000020E61000000100000005000000F7889D9FE84F05402793F5F53B3B48401FB4234BEC4F054062D04B913B3B48408BBB4641F64F054065A967D43B3B48405ED3880FF24F0540097A4A283C3B4840F7889D9FE84F05402793F5F53B3B4840	2020-04-16 20:02:34.286963	2020-10-23 15:34:09.901149	1
243	0103000020E610000001000000060000003DDE7EBF114D054019FF8C1A3F3B4840A91F6E4D334D05400E46D3763F3B484059032E8E434D054005D801CB3D3B48400F308D25254D05408BBD9F2B3D3B484015B3F8130E4D0540C7C18FEC3D3B48403DDE7EBF114D054019FF8C1A3F3B4840	2020-04-16 20:02:34.307485	2020-10-23 15:34:09.905791	1
281	0103000020E61000000100000005000000D9CF10D3FA4E0540587F7C06353B4840B761C2ADF74E0540D8B2E2E0333B4840F6465BDAE54E0540D8B2E2E0333B48401E72E185E94E05401A690A28353B4840D9CF10D3FA4E0540587F7C06353B4840	2020-04-16 20:02:34.377652	2020-10-23 15:34:09.912558	1
393	0103000020E61000000100000005000000C63A009AB44E05407C6544CF2C3B4840DFF536D2A24E05400AC8D3D02B3B4840E1BFC197AD4E0540F0BC4D532B3B4840BF052B68C04E054013C19C492C3B4840C63A009AB44E05407C6544CF2C3B4840	2020-07-12 22:25:17.542236	2020-10-23 15:34:09.917286	1
248	0103000020E61000000100000005000000FE212F382F4D0540E0E1B1C34D3B4840BF7662A3584D05404C595ABF4E3B4840AE7987A86E4D0540FEFA5C914D3B4840A848B7F23E4D0540519426744C3B4840FE212F382F4D0540E0E1B1C34D3B4840	2020-04-16 20:02:34.316481	2020-10-23 15:34:09.920044	1
218	0103000020E6100000010000000600000073BFF1FA084F05403349CC41313B4840C8D235D8104F05403722E884313B4840289AB559314F0540C2D5A128313B48403AD15CEC324F0540A8C37878303B4840C24FCAE9274F054046E22346303B484073BFF1FA084F05403349CC41313B4840	2020-04-16 20:02:34.262859	2020-10-23 15:34:09.926738	1
245	0103000020E610000001000000050000004D3E501DF34C05401B3E87FD443B48402B0ACE8F074D0540345BB0AD453B4840DB275A682F4D0540B5831688443B48401416EF76054D05404BF089CF433B48404D3E501DF34C05401B3E87FD443B4840	2020-04-16 20:02:34.310842	2020-10-23 15:34:09.93245	1
257	0103000020E6100000010000000500000081FFF93B2C4F05404C95B6671A3B484020724652234F054042CB18071B3B4840B4DEBB8B484F05404A6C6CD01B3B48400FAF37EF504F0540A2D351F61A3B484081FFF93B2C4F05404C95B6671A3B4840	2020-04-16 20:02:34.332263	2020-10-23 15:34:09.935209	1
238	0103000020E6100000010000000A00000052B57DA83F4E054092FD74FE443B4840B27CFD29604E054003719F17453B48404C6CDE516E4E0540CC0C65BF453B48402AC4C394534E05400343393D463B484041B8A2AD554E0540788F7F99463B4840473B0E9C3E4E05400DCE8C06473B4840AD4B2D74304E05404BE4FEE4463B48408BDDDE4E2D4E05404159AB1B463B4840B8C59C80314E0540F9B7E573453B484052B57DA83F4E054092FD74FE443B4840	2020-04-16 20:02:34.298841	2020-10-23 15:34:09.941013	1
246	0103000020E6100000010000000700000048474CFFDA4C054089D895D3443B48405E015F80C54C054004A9ADDB463B484042167C49AB4C054078F5F337473B4840D05121CDA04C05409DEE3C66463B4840AE1D9F3FB54C0540B1AAFA44443B4840A89A3351CC4C054052A2C155443B484048474CFFDA4C054089D895D3443B4840	2020-04-16 20:02:34.312643	2020-10-23 15:34:09.945963	1
215	0103000020E6100000010000000500000062DCD9EA974E0540B8C4F137273B48402E71B0CAAA4E0540265F000E273B48400C0362A5A74E0540FFAF0177263B48403AB1533F944E0540E19656A9263B484062DCD9EA974E0540B8C4F137273B4840	2020-04-16 20:02:34.257335	2020-10-23 15:34:09.954792	1
221	0103000020E6100000010000000700000047821A4E7A5005405BF56725373B4840E18B91C27450054081866ACA363B4840ADDA41B15050054043384A6E373B484019E264A75A5005401971E5FC373B4840176BF55770500540A8AC0080373B4840B0EA08F56F500540EB0BDE5C373B484047821A4E7A5005405BF56725373B4840	2020-04-16 20:02:34.267898	2020-10-23 15:34:09.961796	1
255	0103000020E61000000100000006000000AE5226BD964E0540FC5EF5D9133B484092DBDBB5AB4E0540FC5EF5D9133B4840DC74B086B24E054095B56821133B48401A5A49B3A04E054081665BB4123B4840269AEC278A4E05404818215C133B4840AE5226BD964E0540FC5EF5D9133B4840	2020-04-16 20:02:34.328909	2020-10-23 15:34:09.964863	1
210	0103000020E61000000100000005000000FCA4E63787500540FC8B84C6363B48403AFE1794A45005400EF775F0363B484051F2F6ACA650054076D44C40363B4840463EBB088E500540D5DC852F363B4840FCA4E63787500540FC8B84C6363B4840	2020-04-16 20:02:34.247643	2020-10-23 15:34:09.967661	1
228	0103000020E6100000010000000500000097875186B04F054045DA069E3A3B484058A2B859C24F054063F3B16B3A3B4840A8F8C4B0C94F05403B214DFA3A3B4840C46F0FB8B44F0540DFF12F4E3B3B484097875186B04F054045DA069E3A3B4840	2020-04-16 20:02:34.281182	2020-10-23 15:34:09.972999	1
252	0103000020E610000001000000060000002A6152045F4F0540B389E59A143B48400E766FCD444F054059831286133B484030AAF15A304F0540F2945779143B48406389B3AA4C4F05404AB70E4B153B4840192AAB715D4F0540A9BF473A153B48402A6152045F4F0540B389E59A143B4840	2020-04-16 20:02:34.323883	2020-10-23 15:34:09.978712	1
223	0103000020E61000000100000005000000A19A9E3C67500540D190D5BD383B4840071F564488500540E9EC4805383B4840DA7064AA9B500540D190D5BD383B48402496A04B735005405D0545CA393B4840A19A9E3C67500540D190D5BD383B4840	2020-04-16 20:02:34.272674	2020-10-23 15:34:09.985281	1
237	0103000020E61000000100000007000000DA6DB73D4C4E0540BFD65B8D433B4840CF7FAF011C4E05401B067939433B484047C7756C0F4E054033F53B0F453B4840145C4C4C224E05400A23D79D453B4840AD4B2D74304E05402C430489443B4840F16196564E4E0540F9E54B4E443B4840DA6DB73D4C4E0540BFD65B8D433B4840	2020-04-16 20:02:34.297267	2020-10-23 15:34:09.991737	1
390	0103000020E6100000010000000900000061FDD54FAB4E05407F16B3FF273B48404FFB325A9E4E0540533F6DE0273B48403A9300548F4E054091F80438283B484096E10DB98C4E0540A16AE1D7283B4840CA384921B74E0540423FBDDC2A3B4840884F1924CB4E0540AE2AE8902A3B4840AF4E8D9BD64E05400A18BAE1293B4840F0CF7C36C14E0540E17EEBF8283B484061FDD54FAB4E05407F16B3FF273B4840	2020-07-12 22:25:15.997272	2020-10-23 15:34:09.995629	1
261	0103000020E610000001000000080000009CE7D13CC14F0540E533A1AB1D3B4840411756D9B84F0540BE8A86D11C3B4840F7F11938E14F05404B3340751C3B48402F8E130EFE4F05404FFB77FB1C3B4840736AB0580450054095B23DA31D3B4840BDC9B891F34F05405A6F034B1E3B484063BF7096D34F0540588BE7071E3B48409CE7D13CC14F0540E533A1AB1D3B4840	2020-04-16 20:02:34.340493	2020-10-23 15:34:09.998753	1
225	0103000020E61000000100000007000000B3EF3F8DEC4D0540F29FB47C313B48409181F167E94D054091DBE167303B4840DBE0F9A0D84D054053C56F89303B48406FD9D6AACE4D0540A1295174313B48401FBD96EBDE4D0540A9D088FA313B4840B3EF3F8DEC4D054046EF33C8313B4840B3EF3F8DEC4D0540F29FB47C313B4840	2020-04-16 20:02:34.276065	2020-10-23 15:34:10.00677	1
388	0103000020E610000001000000050000009C12E7D1974E054078A55940453B484070B907A9B94E05404CAF63C5453B4840AB78F58EC34E0540D5F18998443B48407F160272A64E054011E4CF0D443B48409C12E7D1974E054078A55940453B4840	2020-07-12 21:39:51.895464	2020-10-23 15:34:10.009689	1
250	0103000020E610000001000000060000003B98F996604F05409AF343FF163B484030585622774F0540438C5ED9173B4840DA7EDEDC864F05407210FBD0173B4840E6F84DE9874F054084C01A4F163B4840DA4412456F4F054001E2FE0B163B48403B98F996604F05409AF343FF163B4840	2020-04-16 20:02:34.320189	2020-10-23 15:34:10.012777	1
262	0103000020E61000000100000006000000570B35F2BA4F0540F0A72CFB1E3B4840B2DBB055C34F0540ECDFF4741E3B4840A1DED55AD94F0540BE3F74C01E3B48408AEAF641D74F0540347BD65F1F3B4840906D6230C04F054004F739681F3B4840570B35F2BA4F0540F0A72CFB1E3B4840	2020-04-16 20:02:34.342592	2020-10-23 15:34:10.015878	1
220	0103000020E610000001000000050000005B0E095AE74F054005752E35333B4840C74FF8E70850054005752E35333B48404A4BFAF614500540A1707328343B4840C258F4C9F04F054075C5F273343B48405B0E095AE74F054005752E35333B4840	2020-04-16 20:02:34.266242	2020-10-23 15:34:10.018788	1
235	0103000020E61000000100000005000000114EAB01554F05407F9A17BE3E3B4840B6B7FB35644F0540AB4598723E3B4840EA5CF1ED684F0540C089A5DF3E3B48404AB0D83F5A4F054094DE242B3F3B4840114EAB01554F05407F9A17BE3E3B4840	2020-04-16 20:02:34.29394	2020-10-23 15:34:10.027619	1
389	0103000020E61000000100000005000000DC548B84E44E05409CD523E8413B4840EE162A6FDB4E054011E63254413B484034DA898B024F0540C67A907A413B4840F6ECEE12034F05400525DC37423B4840DC548B84E44E05409CD523E8413B4840	2020-07-12 21:39:51.924468	2020-10-23 15:34:10.030873	1
398	0103000020E610000001000000050000009E5AABC3CD4E054035A4A79E113B484065DAC9A3C54E0540E9CCD464113B48408F3E7CECCF4E054040101805113B4840181C0FF6D64E0540B0DA9C37113B48409E5AABC3CD4E054035A4A79E113B4840	2020-09-04 21:35:07.631371	2020-10-23 15:34:10.033695	1
232	0103000020E61000000100000007000000B9D8943D2A500540E19733D43D3B4840F731C699475005404752A4493E3B48406F798C043B5005403C6B84CB3F3B4840CA0F3CD02B500540D9892F993F3B48400372690E315005406FF6A2E03E3B484064C55060225005407AAF5C843E3B4840B9D8943D2A500540E19733D43D3B4840	2020-04-16 20:02:34.288708	2020-10-23 15:34:10.041604	1
211	0103000020E6100000010000000500000078445133C94E0540CD08FFA4273B4840F25E64EBE14E05406959E7E0263B4840AFAFEB7C014F05406F6468B2283B484062D6D4AAE54E05406207DF45293B484078445133C94E0540CD08FFA4273B4840	2020-04-16 20:02:34.249541	2020-10-23 15:34:10.046875	1
400	0103000020E610000001000000050000009AEAD183791A0540C2B7C3764D3948404AE9D193871A054058170FDA4C394840E805D2AB6F1A0540E39F31FA4B3948403DCED17F5F1A0540DFE1D2A54C3948409AEAD183791A0540C2B7C3764D394840	2020-10-25 21:58:15.129397	2020-10-25 21:58:15.129397	4
401	0103000020E61000000100000005000000040FD257ED1D05409ED84F584A3948406BD3D15B071E0540D687D9504A394840BB03D20F081E054040338EED4A394840B0FDD187EA1D054050DA7AFC4A394840040FD257ED1D05409ED84F584A394840	2020-10-25 21:58:15.136774	2020-10-25 21:58:15.136774	4
402	0103000020E6100000010000000700000006E1D1E3161D0540777056E53A394840B3E4D19F1E1D0540C3593E323A394840AC08D22F161D05402C9CFF9C39394840B8F4D17F2F1D0540C7ECAF77393948401001D2A3381D0540D9A1C5C9393948406512D2733B1D0540BEC6CCEC3A39484006E1D1E3161D0540777056E53A394840	2020-10-25 21:58:15.13891	2020-10-25 21:58:15.13891	4
403	0103000020E61000000100000005000000BDC1D15F5F1C0540C5DFF2E53D3948405812D2E74F1C0540748E2A583D39484055CED197361C0540402E585D3E3948405BDED177471C0540917F20EB3E394840BDC1D15F5F1C0540C5DFF2E53D394840	2020-10-25 21:58:15.140714	2020-10-25 21:58:15.140714	4
404	0103000020E61000000100000005000000DFCBD1B3491A0540D6A018DF40394840EFE1D11B781A05407E62270E4039484090F9D187661A0540E97C83013F394840CF13D2D3381A05402765C4F73F394840DFCBD1B3491A0540D6A018DF40394840	2020-10-25 21:58:15.142924	2020-10-25 21:58:15.142924	4
405	0103000020E610000001000000060000000315D2531F1D054075F41BCD3139484068C4D1CB2E1D0540A00AE2F93139484016C8D187361D0540DBEBBD783239484011E7D16B341D0540507123F03239484002E6D18F101D054085E35A62323948400315D2531F1D054075F41BCD31394840	2020-10-25 21:58:15.144825	2020-10-25 21:58:15.144825	4
406	0103000020E610000001000000050000003AC0D1E78A1D054075F41BCD3139484035DFD1CB881D0540A67986063339484098C2D1B3A01D0540C4F688673339484041E5D153A61D0540BA0D404E313948403AC0D1E78A1D054075F41BCD31394840	2020-10-25 21:58:15.147071	2020-10-25 21:58:15.147071	4
407	0103000020E6100000010000000500000057D5D1E3A01A05405D3538A549394840FBE7D1A3951A0540D51345734839484098D5D1F76E1A05404D71E61E493948409AEAD183791A054046E6EC414A39484057D5D1E3A01A05405D3538A549394840	2020-10-25 21:58:15.149312	2020-10-25 21:58:15.149312	4
408	0103000020E610000001000000050000008F00D27B9C1D05408AEB465C453948404114D217B51D0540C4676BDD443948404CEBD1DBC31D054041C835CC453948403909D2E39D1D054097EDFD59463948408F00D27B9C1D05408AEB465C45394840	2020-10-25 21:58:15.15147	2020-10-25 21:58:15.15147	4
409	0103000020E610000001000000050000007892700D361C05401731F22432394840A5391684531C0540EC6143A0323948407A8C176F491C05404E765AEE333948406E42A9A22C1C0540D5897675333948407892700D361C05401731F22432394840	2020-10-25 21:58:15.153206	2020-10-25 21:58:15.153206	4
410	0103000020E610000001000000050000006EC0D16F6D1C0540267033692F3948406D09D26B801C05407C78967F2F3948406D09D26B801C05409770F4D32E39484068F9D18B6F1C0540D0147ECC2E3948406EC0D16F6D1C0540267033692F394840	2020-10-25 21:58:15.155267	2020-10-25 21:58:15.155267	4
411	0103000020E61000000100000005000000E0F4D17B261B0540D8F3F03F343948409CCAD14F431B0540B00F7D9934394840E9FFD1AF3D1B05406887101636394840E3C0D10B1E1B0540B96821A635394840E0F4D17B261B0540D8F3F03F34394840	2020-10-25 21:58:15.157036	2020-10-25 21:58:15.157036	4
412	0103000020E61000000100000006000000B0C7D1CFA51A0540081391F028394840BFF7D16FD81A05405A8F468D2939484076ECD127F31A0540BEAE364727394840BCFCD11BD21A05406C61AAED2639484065F0D1F7C81A054064494FFA27394840B0C7D1CFA51A0540081391F028394840	2020-10-25 21:58:15.159054	2020-10-25 21:58:15.159054	4
413	0103000020E610000001000000050000001BC4D12B751C05409442CB1A4139484027CAD1B3921C05407FA3B5C84039484082D1D12BA21C0540967859D54139484019F8D19B7D1C054093B6BE4C423948401BC4D12B751C05409442CB1A41394840	2020-10-25 21:58:15.160801	2020-10-25 21:58:15.160801	4
414	0103000020E61000000100000005000000ECE6D1C7711A05403CB95B364239484003F3D1D7AC1A0540CB65484542394840B3C2D123AC1A0540915217F643394840ECE6D1C7711A0540F1093ED843394840ECE6D1C7711A05403CB95B3642394840	2020-10-25 21:58:15.162914	2020-10-25 21:58:15.162914	4
415	0103000020E610000001000000050000000895B70AA01A05408794D34D50394840C5D3A17AB01A054005F9BDE84F3948400901F928B71A0540798148755039484042F0F478A71A05406AADFEE6503948400895B70AA01A05408794D34D50394840	2020-10-25 21:58:15.164992	2020-10-25 21:58:15.164992	4
416	0103000020E610000001000000050000007BDBD183951C0540DA8134C53B394840D8F7D187AF1C0540E8C369D63A394840790FD2F39D1C0540155478053A394840CCC2D13B831C0540DD1FA60A3B3948407BDBD183951C0540DA8134C53B394840	2020-10-25 21:58:15.166933	2020-10-25 21:58:15.166933	4
417	0103000020E610000001000000050000009EC6D19B4D1F0540DA8134C53B3948409EC6D19B4D1F05407B737F283B3948404BE4D18F591F0540C3C9F52F3B3948404603D273571F0540922BBEBD3B3948409EC6D19B4D1F0540DA8134C53B394840	2020-10-25 21:58:15.16878	2020-10-25 21:58:15.16878	4
418	0103000020E6100000010000000500000078D2D1EFEE1A054022AE296F4039484011C5D1EFC11A05403255167E4039484066D6D1BFC41A05403CB95B36423948407506D25FF71A05407468E52E4239484078D2D1EFEE1A054022AE296F40394840	2020-10-25 21:58:15.170572	2020-10-25 21:58:15.170572	4
419	0103000020E61000000100000005000000C6DAD1D3161E0540EC9C5AC548394840160BD287171E05407E95763A4A394840D3C6D123301E05406EEE892B4A394840CFCBD1CF291E054015A5F7AE48394840C6DAD1D3161E0540EC9C5AC548394840	2020-10-25 21:58:15.172426	2020-10-25 21:58:15.172426	4
420	0103000020E6100000010000000500000047358A3B4E1C0540835DF361293948403002F44D6B1C0540959D895C29394840AE03D1486A1C054083D3149F2839484006B6F8B84D1C05404E0852AF2839484047358A3B4E1C0540835DF36129394840	2020-10-25 21:58:15.174284	2020-10-25 21:58:15.174284	4
421	0103000020E61000000100000005000000020DD20FB11A0540043E76B24D39484061F5D1A3C21A054070D32A4F4E394840B1F6D193B41A054084767CD54E39484056EFD11BA51A054070D32A4F4E394840020DD20FB11A0540043E76B24D394840	2020-10-25 21:58:15.176274	2020-10-25 21:58:15.176274	4
422	0103000020E61000000100000005000000950AD25F7B1E0540EC56DB1B3A394840FCCED163951E0540EC56DB1B3A394840FCCED163951E054082141AB13A394840950AD25F7B1E054082141AB13A394840950AD25F7B1E0540EC56DB1B3A394840	2020-10-25 21:58:15.180985	2020-10-25 21:58:15.180985	4
423	0103000020E6100000010000000C000000A0E0D12B861A0540728A96814539484052C5D103901A0540B9E00C8945394840AAD1D127991A0540312149BD453948404E13D2AB9C1A0540D8564B1E46394840A40AD2439B1A05401FD5269D4639484051DFD13B941A0540365E3CEF463948404AE9D193871A0540460529FE46394840F3DCD16F7E1A0540A6BC4FE04639484045D9D1B3761A0540F6CC89B34639484041F8D197741A0540A0A7C125463948409AEAD183791A0540312149BD45394840A0E0D12B861A0540728A968145394840	2020-10-25 21:58:15.183027	2020-10-25 21:58:15.183027	4
424	0103000020E610000001000000060000003ACDD12F271B0540278C19C83D3948404307D2274D1B0540CD34FFB33C3948409FC5D1A3491B054025DBD30F3C39484095D4D1A7361B05400782FAF13B3948408AFDD1E3271B05400C8523353C3948403ACDD12F271B0540278C19C83D394840	2020-10-25 21:58:15.184964	2020-10-25 21:58:15.184964	4
425	0103000020E61000000100000005000000FDE8D1F3CD19054055530F6249394840570AD2A3E11905401DA4856949394840B1E2D157E2190540D513457348394840A310D23FCD190540E4BA318248394840FDE8D1F3CD19054055530F6249394840	2020-10-25 21:58:15.186911	2020-10-25 21:58:15.186911	4
426	0103000020E61000000100000005000000DDE5D1EB4D1A0540DA0C355442394840EDCCD18F6D1A0540FA5A0E724239484093F4D1DB6C1A05405483FF42433948402E16D29F4E1A054045DC123443394840DDE5D1EB4D1A0540DA0C355442394840	2020-10-25 21:58:15.189105	2020-10-25 21:58:15.189105	4
427	0103000020E61000000100000005000000F908D2CFCF1D054015602DC0473948409E01D257C01D05405DB6A3C747394840480AD2BFC11D0540EC9C5AC54839484057C2D19FD21D0540DDF56DB648394840F908D2CFCF1D054015602DC047394840	2020-10-25 21:58:15.19096	2020-10-25 21:58:15.19096	4
428	0103000020E61000000100000006000000F8FAD18F2F1C0540B8D0EDC730394840F4D0D1771A1C054052AA22D92F39484057E3D123411C05405186F9952F394840AB0ED22B481C05407DC0E8053039484055CED197361C05406180382B30394840F8FAD18F2F1C0540B8D0EDC730394840	2020-10-25 21:58:15.196649	2020-10-25 21:58:15.196649	4
429	0103000020E6100000010000000600000025D6D1ABF61A054087D05C1F3F39484082F2D1AF101B054002D333DC3E39484036ECD113251B0540DA1625AD3F394840DC13D25F241B0540835A505140394840810CD2E7141B0540C101038D4039484025D6D1ABF61A054087D05C1F3F394840	2020-10-25 21:58:15.198693	2020-10-25 21:58:15.198693	4
430	0103000020E61000000100000005000000BBF5D1CF671C0540DF56F87E2C394840BD0AD25B721C05400A4995682C3948401202D2F3701C05406EB092072C394840B614D2B3651C05400A1A6C252C394840BBF5D1CF671C0540DF56F87E2C394840	2020-10-25 21:58:15.200723	2020-10-25 21:58:15.200723	4
431	0103000020E610000001000000050000008C13D267361F054053DB993C3C3948403CE3D1B3351F0540DA8134C53B394840EEC7D18B3F1F0540DA8134C53B394840EEC7D18B3F1F05409B3110443C3948408C13D267361F054053DB993C3C394840	2020-10-25 21:58:15.20248	2020-10-25 21:58:15.20248	4
432	0103000020E610000001000000050000004CDDD19B231C0540CBE0407C37394840AB0ED22B481C05406FBC8BDF36394840FEF0D1373C1C0540E573E7D235394840A0BFD1A7171C0540C09D9C6F363948404CDDD19B231C0540CBE0407C37394840	2020-10-25 21:58:15.204348	2020-10-25 21:58:15.204348	4
433	0103000020E6100000010000000500000024FED1239B1C0540D06761E13F39484088C7D1D3AE1C0540B390A4384139484038E0D11BC11C0540C6F92BD0403948407F05D29BAA1C05407D2199533F39484024FED1239B1C0540D06761E13F394840	2020-10-25 21:58:15.206107	2020-10-25 21:58:15.206107	4
434	0103000020E61000000100000005000000A7DBA39FD51A054043F01CB62E394840B5F6A3B3FD1A054019FE7FCC2E39484065C6A3FFFC1A05405F66FF402D39484057ABA3EBD41A054051B412322D394840A7DBA39FD51A054043F01CB62E394840	2020-10-25 21:58:15.208059	2020-10-25 21:58:15.208059	4
435	0103000020E61000000100000005000000917445D6BB1A05402A5FBB7B4D394840B9EC9F85CE1A054099E477DD4C39484054B157A2E01A05402588488E4D39484058780A91CC1A0540E493452F4E394840917445D6BB1A05402A5FBB7B4D394840	2020-10-25 21:58:15.209974	2020-10-25 21:58:15.209974	4
436	0103000020E610000001000000060000000F07D29F6A1C0540CF26D3263F39484073D0D14F7E1C0540D9D596F23E39484027CAD1B3921C054013073D604039484068F9D18B6F1C054018FF65A34039484066E4D1FF641C0540B01988C33F3948400F07D29F6A1C0540CF26D3263F394840	2020-10-25 21:58:15.212137	2020-10-25 21:58:15.212137	4
437	0103000020E610000001000000050000005310D247DF1D0540927292AF4B3948404E00D267CE1D0540CA211CA84B394840FD8205ACCD1D05402D31F6624C3948407A6DA9BAE21D05409FF6456C4C3948405310D247DF1D0540927292AF4B394840	2020-10-25 21:58:15.214221	2020-10-25 21:58:15.214221	4
438	0103000020E610000001000000050000007ED6D1D79B1C0540A5FEB79F2E3948408BC2D127B51C05401747CB902E39484031EAD173B41C05409753D4FD2C39484024FED1239B1C0540426F9A2A2D3948407ED6D1D79B1C0540A5FEB79F2E394840	2020-10-25 21:58:15.216263	2020-10-25 21:58:15.216263	4
439	0103000020E61000000100000005000000D8F7D187AF1C0540F98B539B3D3948407DF0D10FA01C05403985E9613C3948408415D27BBB1C054070CFBB5C3B394840E102D2BBC61C05403E8812A53C394840D8F7D187AF1C0540F98B539B3D394840	2020-10-25 21:58:15.21807	2020-10-25 21:58:15.21807	4
440	0103000020E61000000100000005000000C3D9D183DE1E0540B587C01E3C394840CACFD12BEB1E05407DD836263C39484020C7D1C3E91E054074D2E49F3B394840C3D9D183DE1E054074D2E49F3B394840C3D9D183DE1E0540B587C01E3C394840	2020-10-25 21:58:15.219999	2020-10-25 21:58:15.219999	4
441	0103000020E6100000010000000700000092FBD1CFA21D0540D434C7E5303948409FE7D11FBC1D0540BC4A92D431394840B2C9D117E21D05407E083B8C30394840ACD3D16FD51D05409A24C22330394840A1FCD1ABC61D05409A48EB66303948404114D217B51D0540A8D6AE323039484092FBD1CFA21D0540D434C7E530394840	2020-10-25 21:58:15.221968	2020-10-25 21:58:15.221968	4
442	0103000020E61000000100000005000000EBDFD17B071C0540FA68C0D93239484097FDD16F131C054041BF36E13239484047CDD1BB121C0540B0D5F74B32394840EBDFD17B071C0540B0D5F74B32394840EBDFD17B071C0540FA68C0D932394840	2020-10-25 21:58:15.224078	2020-10-25 21:58:15.224078	4
443	0103000020E61000000100000005000000ACE0D1B7711B0540E64D021C473948406109D2DF941B0540F6CC89B3463948401208D2EFA21B0540CD311C304839484004EDD1DB7A1B05404D5481A748394840ACE0D1B7711B0540E64D021C47394840	2020-10-25 21:58:15.226119	2020-10-25 21:58:15.226119	4
444	0103000020E6100000010000000500000086D3D1CB121B05408798F3B7373948403FDDD10F381B0540B3A3B9E4373948408C12D26F321B05406CE1231E39394840D9CFD10F0B1B054096DEC0073939484086D3D1CB121B05408798F3B737394840	2020-10-25 21:58:15.228142	2020-10-25 21:58:15.228142	4
445	0103000020E610000001000000050000004D0CD25F321C05405C934122413948400616D2A3571C05404DEC54134139484064CFD1735A1C0540A35DAB5B42394840A4E9D1BF2C1C0540CB654845423948404D0CD25F321C05405C93412241394840	2020-10-25 21:58:15.230149	2020-10-25 21:58:15.230149	4
446	0103000020E610000001000000050000005007D2B3381C0540BB48ECAB3939484012D3D12F621C05400424ABB538394840B2EAD19B501C0540954AE0C637394840F5FFD13B291C05402D21489F383948405007D2B3381C0540BB48ECAB39394840	2020-10-25 21:58:15.232236	2020-10-25 21:58:15.232236	4
447	0103000020E6100000010000000500000064E0E84D091B05406077BC534C3948400CD4E829001B054030402CF44C394840E016E9930E1B0540659086424D3948409310E9F7221B054052E234BC4C39484064E0E84D091B05406077BC534C394840	2020-10-25 21:58:15.234196	2020-10-25 21:58:15.234196	4
448	0103000020E61000000100000005000000E008D2B7F81B0540F5DDDD653739484042ECD19F101C0540AA793E1B37394840F0EFD15B181C05406C4D43DD3739484093D3D157FE1B0540FE07592F38394840E008D2B7F81B0540F5DDDD6537394840	2020-10-25 21:58:15.236441	2020-10-25 21:58:15.236441	4
449	0103000020E6100000010000000600000067CAD1C7601C0540A8D6AE3230394840C6FBD157851C05407E083B8C3039484070D5D1FB771C05408FF7792131394840B90FD2076C1C05405653F028313948400911D2F75D1C0540E2C28AB13039484067CAD1C7601C0540A8D6AE3230394840	2020-10-25 21:58:15.238371	2020-10-25 21:58:15.238371	4
450	0103000020E6100000010000000500000036D8D1D7521A0540B3B0A4AE2E394840E50AD257691A0540B3B0A4AE2E3948403A02D2EF671A05406CB4899A2D3948408CCFD16F511A05406CB4899A2D39484036D8D1D7521A0540B3B0A4AE2E394840	2020-10-25 21:58:15.240439	2020-10-25 21:58:15.240439	4
451	0103000020E610000001000000050000002613D2AFA51C054070564E7D303948408200D2EFB01C0540A9FAD77530394840DDD8D1A3B11C054034FEF6342F394840D6E2D1FBA41C054042B0E3432F3948402613D2AFA51C054070564E7D30394840	2020-10-25 21:58:15.242866	2020-10-25 21:58:15.242866	4
452	0103000020E610000001000000050000004E13D2AB9C1A054084767CD54E394840FC16D267A41A0540345B42024F39484054DAD18F9A1A0540C9F893884F394840A6D6D1D3921A05409719CE5B4F3948404E13D2AB9C1A054084767CD54E394840	2020-10-25 21:58:15.244709	2020-10-25 21:58:15.244709	4
453	0103000020E6100000010000000900000076F2D123251A05404E6E56B734394840D3C5D12B2C1A05407C92452735394840D4F4D1EF3A1A054054AED1803539484089D4D11B4B1A05406360BE8F3539484035F2D10F571A054041D592EB34394840E5C1D15B561A0540C828DBED33394840D5DAD1B7361A0540B976EEDE3339484024DCD1A7281A0540D8F3F03F3439484076F2D123251A05404E6E56B734394840	2020-10-25 21:58:15.246943	2020-10-25 21:58:15.246943	4
454	0103000020E61000000100000005000000B5D8D1A7BA1E0540DD1FA60A3B39484064F1D1EFCC1E0540D57E0B823B3948400804D2AFC11E05400782FAF13B39484003F4D1CFB01E05408E28957A3B394840B5D8D1A7BA1E0540DD1FA60A3B394840	2020-10-25 21:58:15.249051	2020-10-25 21:58:15.249051	4
455	0103000020E61000000100000005000000A002D2A7F81C05404FD870F93B3948405C07D23F241D0540692E21D43B39484061E8D15B261D0540CD34FFB33C394840FDD5D1AFFF1C05406B88D8D13C394840A002D2A7F81C05404FD870F93B394840	2020-10-25 21:58:15.251107	2020-10-25 21:58:15.251107	4
456	0103000020E61000000100000006000000CFC0E277D31A05408B2893D84C3948408CA2F669E21A0540360050614D394840D789B5EFF31A054045AEAD1F4D394840529AC66BF31A05409E8A83E34C39484010C9C3F5E31A0540E145D64F4C394840CFC0E277D31A05408B2893D84C394840	2020-10-25 21:58:15.252871	2020-10-25 21:58:15.252871	4
457	0103000020E610000001000000050000005C07D23F241D05408C96FE573039484074CAD1534C1D05401C8B3DED30394840C1FFD1B3461D0540F4D5F28931394840B3E4D19F1E1D0540E3E6B3F4303948405C07D23F241D05408C96FE5730394840	2020-10-25 21:58:15.255162	2020-10-25 21:58:15.255162	4
458	0103000020E610000001000000080000001014D2E7061A05408A44323635394840C4C4D14F081A0540C60FB2AA33394840B807D2C3FD190540C60FB2AA33394840B6F2D137F3190540B976EEDE3339484062E1D167F019054004FFB66C34394840B211D21BF119054041D592EB34394840B50CD26FF71905407C924527353948401014D2E7061A05408A44323635394840	2020-10-25 21:58:15.257163	2020-10-25 21:58:15.257163	4
459	0103000020E61000000100000005000000DBD0D15F431A0540D40E58EC4439484035F2D10F571A0540241F92BF443948403DCED17F5F1A0540C29AD054453948408012D2E3461A05405929E6A645394840DBD0D15F431A0540D40E58EC44394840	2020-10-25 21:58:15.263084	2020-10-25 21:58:15.263084	4
460	0103000020E610000001000000060000001C14D273F21A05409B2EE4B63E3948402FC7D1A7091B054026D8A7823E39484033F1D1BF1E1B05407E897CDE3D3948402E10D2A31C1B054053DB993C3C39484075D7D19BE81A05406ADF668C3D3948401C14D273F21A05409B2EE4B63E394840	2020-10-25 21:58:15.26545	2020-10-25 21:58:15.26545	4
461	0103000020E61000000100000005000000EBFE00830B1E0540FFEE3E592C394840C5067D07181E054079BF61CC2C394840EBFE00830B1E054092FACD2D2D394840B6B9C8A9001E0540D5F93D972C394840EBFE00830B1E0540FFEE3E592C394840	2020-10-25 21:58:15.267219	2020-10-25 21:58:15.267219	4
462	0103000020E6100000010000000500000077FAD167931C0540D41EFC693F3948402CDAD193A31C05404A29AAE33E394840D0ECD153981C0540402E585D3E39484079C6D1F78A1C05403A82BDD43E39484077FAD167931C0540D41EFC693F394840	2020-10-25 21:58:15.269103	2020-10-25 21:58:15.269103	4
463	0103000020E6100000010000000500000013DAD17BCC1A054019A9E78F42394840B1F6D193B41A0540515871884239484061C6D1DFB31A05409A0CDBC1433948400E13D297CE1A05409A0CDBC14339484013DAD17BCC1A054019A9E78F42394840	2020-10-25 21:58:15.27099	2020-10-25 21:58:15.27099	4
464	0103000020E6100000010000000500000060EED157581C0540A552EC943639484008E2D1334F1C0540B96821A63539484068F9D18B6F1C054050877FFA343948406A0ED2177A1C05409492D6423639484060EED157581C0540A552EC9436394840	2020-10-25 21:58:15.273049	2020-10-25 21:58:15.273049	4
465	0103000020E61000000100000007000000A504D247691B0540C5DFF2E53D394840FEF6D1336E1B05406E2E1E8A3E394840AD0FD27B801B05409B2EE4B63E39484009FDD1BB8B1B05400C82F7A73E39484009FDD1BB8B1B05403985E9613C394840AEC6D17F6D1B05407134735A3C394840A504D247691B0540C5DFF2E53D394840	2020-10-25 21:58:15.275007	2020-10-25 21:58:15.275007	4
466	0103000020E61000000100000009000000C5DDA3571D1B05400D1583A03E394840900DD2C3381B054012C6AEA53F39484041F2D19B421B0540DA1625AD3F394840EE0FD28F4E1B0540D41EFC693F3948404AFDD1CF591B0540407AE6173F3948404DF8D123601B0540C52B81A03E39484051D9D13F621B0540D586DFF43D394840F5EBD1FF561B0540FA34C5E03C394840C5DDA3571D1B05400D1583A03E394840	2020-10-25 21:58:15.277062	2020-10-25 21:58:15.277062	4
467	0103000020E61000000100000005000000EB00D2FF751A0540DE7E18552E39484055C0D157961A054025D58E5C2E394840FFC8D1BF971A05409753D4FD2C394840EB00D2FF751A05409753D4FD2C394840EB00D2FF751A0540DE7E18552E394840	2020-10-25 21:58:15.278858	2020-10-25 21:58:15.278858	4
468	0103000020E61000000100000005000000D6D4D1BB041B0540BB09DA494039484085EDD103171B0540A4E9B72941394840D4BFD12FFA1A0540A4E9B7294139484037CED1CFF61A0540868A2D6C40394840D6D4D1BB041B0540BB09DA4940394840	2020-10-25 21:58:15.281227	2020-10-25 21:58:15.281227	4
469	0103000020E610000001000000050000000DD1D18FF11D0540457258644839484067F2D13F051E05407C21E25C4839484011FBD1A7061E054055530F624939484061E2D15FF41D05408D02995A493948400DD1D18FF11D05404572586448394840	2020-10-25 21:58:15.283405	2020-10-25 21:58:15.283405	4
470	0103000020E61000000100000005000000E612D29BD71C0540ECC692193B3948409AC3D103D91C05405DAAEE0C3A394840E2C292C3FC1C0540CCA502223A394840A002D2A7F81C05407B737F283B394840E612D29BD71C0540ECC692193B394840	2020-10-25 21:58:15.285326	2020-10-25 21:58:15.285326	4
471	0103000020E6100000010000000500000094EED1DF3A1B0540C2EB15F42D394840F8E6D1535D1B0540255E13932D39484053EED1CB6C1B054026945CAC2F394840EFF5D1574A1B05407C9CBFC22F39484094EED1DF3A1B0540C2EB15F42D394840	2020-10-25 21:58:15.289777	2020-10-25 21:58:15.289777	4
472	0103000020E61000000100000006000000D9CFD10F0B1B05400902FB804239484078D2D1EFEE1A0540F69873E94239484022DBD157F01A05401CD4754A433948407DE2D1CFFF1A0540B26D8B9C4339484033F1D1BF1E1B05403535262543394840D9CFD10F0B1B05400902FB8042394840	2020-10-25 21:58:15.291617	2020-10-25 21:58:15.291617	4
473	0103000020E610000001000000050000008DFED133601A054097DDF501353948408DFED133601A05407552CA5D343948403DFDD1436E1A054004FFB66C343948403DFDD1436E1A0540A58FE210353948408DFED133601A054097DDF50135394840	2020-10-25 21:58:15.29344	2020-10-25 21:58:15.29344	4
474	0103000020E6100000010000000500000025D7D1A3FA1E05405635513A3D3948407BFDD1FF071F05400EDFDA323D394840976AAA67071F0540487301BB3C3948404044AA0BFA1E05408FC977C23C39484025D7D1A3FA1E05405635513A3D394840	2020-10-25 21:58:15.295337	2020-10-25 21:58:15.295337	4
475	0103000020E6100000010000000500000002CAD10FD01905407468E52E423948400FE5D123F81905403CB95B364239484014C6D13FFA1905402C7B625943394840F907D2D7CB1905402C7B62594339484002CAD10FD01905407468E52E42394840	2020-10-25 21:58:15.297356	2020-10-25 21:58:15.297356	4
476	0103000020E61000000100000005000000F50DD27BC91D0540EC3005642E39484013C7D137FE1D054017D04FC72D3948400DD1D18FF11D0540172AABBA2C394840A6C3D18FC41D0540B3E6D65E2D394840F50DD27BC91D0540EC3005642E394840	2020-10-25 21:58:15.299365	2020-10-25 21:58:15.299365	4
477	0103000020E6100000010000000500000005D3D1A3761B0540F57E83084939484058CFD1E76E1B05408DA069F447394840A4D5D1835A1B05401488923748394840A7D0D1D7601B0540EDB9BF3C4939484005D3D1A3761B0540F57E830849394840	2020-10-25 21:58:15.3012	2020-10-25 21:58:15.3012	4
478	0103000020E61000000100000006000000CCC2D13B831C05408884CE643E394840D4CDD16F9A1C05406EE28FCF3D394840D4CDD16F9A1C05405A387A7D3D3948401B0DD227881C0540A33762CA3C394840B90FD2076C1C0540DF35A3C03D394840CCC2D13B831C05408884CE643E394840	2020-10-25 21:58:15.303336	2020-10-25 21:58:15.303336	4
479	0103000020E610000001000000050000006FCDD1B7091A054084030BA04839484072F7D1CF1E1A054084030BA0483948401D00D237201A0540BD6DCAA947394840660BD27F051A054085BE40B1473948406FCDD1B7091A054084030BA048394840	2020-10-25 21:58:15.305064	2020-10-25 21:58:15.305064	4
480	0103000020E61000000100000005000000FC03D223D61D0540CEC4ECC9463948400AD6D13BEB1D0540F6CC89B346394840040FD257ED1D05403586A16647394840A60CD28BD71D0540D5CE7A8447394840FC03D223D61D0540CEC4ECC946394840	2020-10-25 21:58:15.306826	2020-10-25 21:58:15.306826	4
481	0103000020E61000000100000005000000B90FD2076C1C05404FA302032E3948401ADED163791C054097F9780A2E394840366BFCAD7A1C0540F7A767062D394840DF44FC516D1C0540304CF1FE2C394840B90FD2076C1C05404FA302032E394840	2020-10-25 21:58:15.308685	2020-10-25 21:58:15.308685	4
482	0103000020E610000001000000070000007FFFE83BEE1A0540AD33C77C4C39484055DFE871E51A054057A093104C3948407C04E9E7E71A054012A94CB34B3948407E19E973F21A0540C17BAD684B3948400312E9F1FB1A0540C17BAD684B3948403213E9D7061B054078E36C2E4C3948407FFFE83BEE1A0540AD33C77C4C394840	2020-10-25 21:58:15.310511	2020-10-25 21:58:15.310511	4
483	0103000020E6100000010000000700000067DBE8A10F1B0540F15B0E62493948408A1FE9FB0F1B05408237C55F4A39484070CCE89D221B05401E0F0A5C4A3948409310E9F7221B05406BCB14854A3948409D01E9F3351B05406BCB14854A394840C8D8E8C12B1B0540259A03394939484067DBE8A10F1B0540F15B0E6249394840	2020-10-25 21:58:15.312376	2020-10-25 21:58:15.312376	4
484	0103000020E6100000010000000500000083D9D16F101F0540198E9EFE3C39484083D9D16F101F054010884C783C394840DFC6D1AF1B1F054010884C783C394840DFC6D1AF1B1F0540198E9EFE3C39484083D9D16F101F0540198E9EFE3C394840	2020-10-25 21:58:15.314458	2020-10-25 21:58:15.314458	4
485	0103000020E61000000100000005000000BBF5D1CF671C0540D4C19EB9333948406BF4D1DF751C0540D4C19EB93339484016FDD147771C0540794A97963239484066E4D1FF641C054096AE70B432394840BBF5D1CF671C0540D4C19EB933394840	2020-10-25 21:58:15.316542	2020-10-25 21:58:15.316542	4
486	0103000020E6100000010000000A000000E5C1D15B561A054044BEF51D2C3948403707D29B611A0540343B32522C394840EDCCD18F6D1A0540D1A40B702C3948402E0A26A7781A0540B0E4984C2C394840F3DCD16F7E1A054060FEA5F82B3948404BCFD15B831A05408BC1199F2B39484093A4266F831A054050B50AEC2A394840243D3C2F841A05402648B6042A394840C8498587561A054040B361FB29394840E5C1D15B561A054044BEF51D2C394840	2020-10-25 21:58:15.3184	2020-10-25 21:58:15.3184	4
208	0103000020E61000000100000005000000909538EE804D05405C27F2292C3B48406E27EAC87D4D05403DF1C43E2D3B48404C7FCF0B634D05404B839A252D3B4840FC628F4C734D05408CAB8E212C3B4840909538EE804D05405C27F2292C3B4840	2020-04-16 20:02:34.243889	2020-10-27 11:58:43.919528	1
275	0103000020E61000000100000006000000A38856C3594D0540F95FF6290F3B4840811A089E564D05400419B0CD0E3B48409848B34E704D05406EDAA2600E3B4840F3182FB2784D054067FA04000F3B484009D34133634D05408F9E03970F3B4840A38856C3594D0540F95FF6290F3B4840	2020-04-16 20:02:34.366012	2020-10-27 11:58:43.926864	1
258	0103000020E610000001000000050000008A64CE30284E0540A1CA46C4233B4840D3713B315E4E0540A5A36207243B484023C84788654E0540B3748285223B48407370EF17264E05408F9E9F31223B48408A64CE30284E0540A1CA46C4233B4840	2020-04-16 20:02:34.333901	2020-10-27 11:58:43.930035	1
264	0103000020E610000001000000050000003FB6DB60B74D05402A6B3C950A3B4840FB9F727E994D054058CC72B20B3B4840188B55B5B34D054082548D8C0C3B48400C4BB240CA4D054054F3566F0B3B48403FB6DB60B74D05402A6B3C950A3B4840	2020-04-16 20:02:34.346331	2020-10-27 11:58:43.94469	1
487	0103000020E61000000100000009000000A665F81F894D0540E056EB540A3B4840BAE381EC894D05400719E9950A3B4840C94A03A78D4D05403E8457AF0A3B48401FD420C7934D05408160DDA60A3B48402E3BA281974D0540100F4E7F0A3B4840E201FE09984D05406B8AA9380A3B4840E718061C954D054073800E220A3B48407E115F2F8E4D054030A4882A0A3B4840A665F81F894D0540E056EB540A3B4840	2020-10-27 11:58:43.953691	2020-10-27 11:58:43.953691	1
395	0103000020E61000000100000005000000D3550AF4354E0540FFFD26BA283B4840DA3147521D4E054090F587C2273B4840EA255DB5294E0540186CA325273B4840CFE191B4424E05407E71C246283B4840D3550AF4354E0540FFFD26BA283B4840	2020-09-04 20:16:26.503178	2020-10-27 11:58:43.961822	1
277	0103000020E6100000010000000700000020C7204C654D054093771FDA0F3B48400FCA45517B4D0540174B3B1D103B4840E7D88B3D8F4D054009B96536103B4840E7D88B3D8F4D054023CB8EE6103B484064A3BD966B4D054023CB8EE6103B4840ED212B94604D05404AA8F357103B484020C7204C654D054093771FDA0F3B4840	2020-04-16 20:02:34.370104	2020-10-27 11:58:44.006751	1
259	0103000020E61000000100000006000000C88333F52D4E0540FD38AE07223B4840A615E5CF2A4E0540050E4C68213B48406273141D3C4E05404140A203213B484023C84788654E054053AB932D213B4840FB9CC1DC614E05405F1A033A223B4840C88333F52D4E0540FD38AE07223B4840	2020-04-16 20:02:34.33576	2020-10-27 11:58:44.054249	1
285	0103000020E6100000010000000500000076977773144E0540C47EEBE7293B4840930EC27AFF4D05408E48176A293B484076977773144E0540FFE9A75D283B48405FDD64F2294E05405AEB5E2F293B484076977773144E0540C47EEBE7293B4840	2020-04-16 20:02:34.384883	2020-10-27 11:58:44.103866	1
\.


--
-- Data for Name: circuits; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.circuits (id, color, created_at, updated_at, area_id, "order") FROM stdin;
4	red	2020-04-16 20:02:33.813724	2020-04-19 08:39:56.340577	1	6
2	orange	2020-04-16 20:02:33.697495	2020-04-19 08:39:56.335633	1	3
6	white	2020-04-16 20:02:34.149902	2020-04-19 08:39:56.345078	1	7
5	blue	2020-04-16 20:02:33.912494	2020-04-19 08:39:56.342898	1	4
3	skyblue	2020-04-16 20:02:33.796183	2020-04-19 08:39:56.338009	1	5
1	yellow	2020-04-16 20:02:33.505445	2020-04-19 08:39:56.331282	1	2
12	blue	2020-05-07 12:44:29.615897	2020-05-07 12:44:29.615897	2	2
10	orange	2020-05-07 12:44:29.55628	2020-05-07 12:44:29.55628	2	1
11	red	2020-05-07 12:44:29.606787	2020-05-07 12:44:29.606787	2	3
13	blue	2020-10-19 19:23:45.171853	2020-10-19 19:23:45.171853	4	2
14	orange	2020-10-19 19:23:56.68021	2020-10-19 19:23:56.68021	4	1
15	red	2020-10-19 19:24:06.17002	2020-10-19 19:24:06.17002	4	3
\.


--
-- Data for Name: pois; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.pois (id, title, subtitle, description, location, route, area_id, created_at, updated_at) FROM stdin;
2	Parking	Roche aux Sabots	Parking Roche aux Sabots	0101000020E610000082E2C798BB160440EAAEEC82C12F4840	0102000020E610000011000000CDCD37A27B160440DE0033DFC12F48403C32569BFF1704408E76DCF0BB2F484006F357C85C1904400A815CE2C82F48404757E9EE3A1B0440D3F4D901D72F4840F0FB372F4E1C0440DDD26A48DC2F484053CE177B2F1E0440FF40B96DDF2F484068925852EE1E0440D4450A65E12F4840D960E124CD1F0440C6FB71FBE52F48407B82C476F720044009707A17EF2F4840C425C79DD22104409981CAF8F72F4840A64412BD8C220440AF415F7AFB2F4840C748F60835230440DCF5D214013048405F0839EFFF230440C4CDA96400304840F52D73BA2C26044062D8614CFA2F48407CF0DAA50D270440F8A6E9B303304840CAA99D616A2B04405D6C5A2904304840444E5FCFD72C044004AC55BB26304840	2	2020-05-09 21:18:37.4188	2020-05-09 21:44:44.481227
1	Parking	Rocher Canon	Parking Rocher Canon	0101000020E6100000446ADAC534530540A818E76F423B4840	0102000020E6100000030000001E5B274B30530540A82EC69C423B4840BBF7B1645253054084EBB3053D3B484092536B00145105404A76BD4F383B4840	1	2020-05-09 19:45:02.796229	2020-05-09 19:50:49.931636
3	Parking	Carrefour de l'épine	Parking du carrefour de l'épine (Cuvier)	0101000020E61000003A0DE9CDE4190540E3AD1D5615394840	0102000020E6100000030000003A0DE9CDE4190540E3AD1D56153948401DD6A33F541A054073206F2B19394840E5E0A35F9D1A054058CCE0FE25394840	4	2020-10-25 22:17:52.436204	2020-10-25 22:18:28.707517
\.


--
-- Data for Name: problems; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.problems (id, name, grade, created_at, updated_at, location, circuit_id, circuit_number, steepness, height, area_id, tags) FROM stdin;
82	Le Dalle Bleu	4c	2020-04-16 20:19:03.216232	2020-10-24 21:16:01.942818	0101000020E6100000B663955E1F500540C508B3832E3B4840	2	5	slab	5	1	{risky}
101	Le Cervin	4b	2020-04-16 20:19:03.272614	2020-10-24 21:16:01.94628	0101000020E6100000029CAE17AC4E0540423ECD93153B4840	3	40	slab	6	1	{risky}
19	\N	3b	2020-04-16 20:19:03.027729	2020-10-24 21:16:01.953713	0101000020E6100000D138DBDC394F054002EDE79B1A3B4840	1	31	wall	\N	1	{}
136	Hôtels	4b	2020-04-16 20:19:03.375385	2020-10-24 21:16:01.981824	0101000020E61000008A7E20016B4E0540900675CC453B4840	5	29	wall	4	1	{}
78	\N	2c	2020-04-16 20:19:03.20556	2020-10-24 21:16:01.985594	0101000020E6100000D42C1F770C4F0540B2497D2A313B4840	2	10	wall	\N	1	{}
149	Les Temps Modernes	6b	2020-04-16 20:19:03.411405	2020-10-24 21:16:01.993507	0101000020E61000008E2061AB294F0540FA8FA3DF3E3B4840	4	29	traverse	\N	1	{}
48	\N	2c	2020-04-16 20:19:03.107744	2020-10-24 21:16:01.997058	0101000020E6100000DA4D1AF2294E054060B519863E3B4840	1	1	traverse	\N	1	{}
95	L'Imprévue	5a+	2020-04-16 20:19:03.255305	2020-10-24 21:16:02.000896	0101000020E6100000B5A30883404F0540A9D3EFB61A3B4840	3	34	wall	\N	1	{}
36	Le Bistrot	3a	2020-04-16 20:19:03.0744	2020-10-24 21:16:02.004405	0101000020E61000002B192C4F3A4D054089AFC0B73E3B4840	1	14	slab	3	1	{}
154	Mariage de Figaro	3b+	2020-04-16 20:19:03.424206	2020-10-24 21:16:02.031212	0101000020E610000007681DD0C34E05403D801C5E383B4840	2	16	traverse	4	1	{}
272	Le bac à Eau	2a+	2020-05-07 12:44:29.706829	2020-05-10 10:16:01.153045	0101000020E6100000B378B130442E04403CBD529621304840	10	10	traverse	3	2	{}
313	La Gageure	3a+	2020-05-07 12:44:29.893979	2020-05-10 10:18:08.256312	0101000020E6100000F2086EA46C31044006651A4D2E304840	10	25	wall	4	2	{}
88	Le Pilier du Dromadaire	4c	2020-04-16 20:19:03.234423	2020-10-24 21:16:02.034988	0101000020E6100000F15BD282824F05406C9451D91D3B4840	3	14	wall	5	1	{risky}
214	Soleil Couchant	4b	2020-04-16 20:19:03.604353	2020-10-24 21:16:02.038879	0101000020E610000024832BCE134F05406B67C110353B4840	5	17	wall	4	1	{}
17	Lola	2c	2020-04-16 20:19:03.022537	2020-10-24 21:16:02.045577	0101000020E6100000D3EB8894F24E05403CC962F4143B4840	1	33	slab	\N	1	{}
144	L'Astragale	6b	2020-04-16 20:19:03.39802	2020-10-24 21:16:02.049599	0101000020E6100000D9FA6B77E44E0540320416DF423B4840	4	33	wall	4	1	{}
97	Le Sphinx (droite)	5c+	2020-04-16 20:19:03.261062	2020-10-24 21:16:02.057209	0101000020E6100000E67AED5B5B4F0540FB6B6E38153B4840	3	8	wall	4	1	{}
16	\N	1b	2020-04-16 20:19:03.019868	2020-10-24 21:16:02.060733	0101000020E6100000136BF389D74E054030A336C6113B4840	1	34	slab	\N	1	{}
161	Puzzle	5c	2020-04-16 20:19:03.444224	2020-10-24 21:16:02.081601	0101000020E61000005A15C02E4750054095D38E583E3B4840	4	28	overhang	4	1	{}
210	Méditation	4c	2020-04-16 20:19:03.591445	2020-10-27 11:58:43.201765	0101000020E61000009F032A331F4C05406FA360092D3B4840	5	38	wall	3	1	{}
167	Opus Dei	3c	2020-04-16 20:19:03.464213	2020-10-24 21:16:02.100375	0101000020E6100000E0CFF5DD1F4F0540D834D9D7313B4840	2	11	wall	\N	1	{}
74	\N	3a	2020-04-16 20:19:03.193952	2020-10-24 21:16:02.123422	0101000020E610000017CE86E7B54E05406306338F3A3B4840	2	13	wall	\N	1	{}
216	L'Amérique	4a	2020-04-16 20:19:03.610389	2020-10-24 21:16:02.127103	0101000020E6100000E5B9D6E62E4F0540BE96C702353B4840	5	15	wall	4	1	{}
108	Coup de Poker	5c	2020-04-16 20:19:03.292023	2020-10-24 21:16:02.13872	0101000020E610000084BA4CAAFA4C05404DFBA2AE0B3B4840	4	9	wall	\N	1	{}
27	\N	2b	2020-04-16 20:19:03.050092	2020-10-24 21:16:02.142767	0101000020E610000017C26A587B4E0540B31FEC072A3B4840	1	23	wall	\N	1	{risky}
229	Beaux Mouvements sur Fonds Sableux	6c+	2020-04-16 20:19:03.64575	2020-10-24 21:16:02.14668	0101000020E61000001065B1784B4E054005B92FC7463B4840	6	9	overhang	3	1	{sit_start}
193	Les Petits Pieds	6a	2020-04-16 20:19:03.541645	2020-10-24 21:16:02.150192	0101000020E6100000BD30BA97AD4E0540807A8819283B4840	4	19	slab	4	1	{}
132	Saillie d'Esprit	6b+	2020-04-16 20:19:03.363868	2020-10-24 21:16:02.156989	0101000020E610000022AF80015C4D054052A8083D3F3B4840	4	42	wall	3	1	{}
233	Expositions retrospectives	6c+	2020-04-16 20:19:03.656695	2020-10-24 21:16:02.167792	0101000020E6100000138A7B5FB04E0540BD18F9872A3B4840	6	13	wall	\N	1	{risky}
21	Magouilles	3b	2020-04-16 20:19:03.033315	2020-10-24 21:16:02.171369	0101000020E6100000482F0A857F4F05408C78C0491D3B4840	1	29	wall	5	1	{risky}
109	Le Smig	6a+	2020-04-16 20:19:03.295059	2020-10-24 21:16:02.178162	0101000020E6100000ED782861A44E054087C7BCCA123B4840	4	13	wall	4	1	{}
20	\N	2b	2020-04-16 20:19:03.03048	2020-10-24 21:16:02.18721	0101000020E6100000DAB8AA749E4F0540F1FE1D4E1C3B4840	1	30	slab	\N	1	{}
189	Les Plats	4b	2020-04-16 20:19:03.530687	2020-10-24 21:16:02.191451	0101000020E61000006C110E21744F0540CF7ABD62323B4840	3	23	wall	\N	1	{}
130	Nocturne	3c	2020-04-16 20:19:03.358913	2020-10-24 21:16:02.198701	0101000020E6100000B278D162274D0540EAD06D533F3B4840	5	32	wall	3	1	{}
180	La Soprano	4a	2020-04-16 20:19:03.500527	2020-10-24 21:16:02.20495	0101000020E6100000E17A5655E04E0540AB3E7A3E2B3B4840	3	18	overhang	5	1	{risky}
69	Confiance	4a	2020-04-16 20:19:03.17155	2020-10-24 21:16:02.208843	0101000020E61000008BD3C93DC54E05407E16AEA52A3B4840	2	22	slab	6	1	{risky}
67	Drambruie	3a	2020-04-16 20:19:03.165587	2020-10-24 21:16:02.214777	0101000020E6100000BE10EC2FF74E0540D14E54D6193B4840	2	24	wall	\N	1	{}
436	\N	\N	2020-10-19 19:33:22.862817	2020-10-25 21:58:14.556708	0101000020E6100000F8E1E8EBA41D0540BB864CD831394840	14	50	other	\N	4	{}
261	L'Angle Rond	3a	2020-05-07 12:44:29.658253	2020-05-10 10:08:12.573814	0101000020E610000021EA3E00A92D04409F5BE84A04304840	10	4	slab	3	2	{}
269	L'Encoignure	3a	2020-05-07 12:44:29.696251	2020-05-10 10:15:28.49858	0101000020E61000005E13D21A832E04404E0B5EF415304840	10	7	wall	3	2	{}
418	\N	\N	2020-10-19 19:33:22.82788	2020-10-25 21:58:14.561956	0101000020E61000003DFBE8D94E1C0540DB3DEF5742394840	14	32	other	\N	4	{}
50	La calandre	3a	2020-04-16 20:19:03.113229	2020-04-28 19:21:14.76474	0101000020E6100000D865F84F37500540B69DB646043B4840	2	42	overhang	\N	1	{risky}
443	\N	\N	2020-10-19 19:34:08.096548	2020-10-25 21:58:14.566784	0101000020E6100000FC1EE947881A054039916EE343394840	13	7	other	\N	4	{}
96	La Cachée	4c	2020-04-16 20:19:03.258264	2020-10-27 10:58:37.079667	0101000020E6100000C07355F0F64E05406119A311193B4840	3	35	wall	4	1	{}
49	La Crêpe	4a	2020-04-16 20:19:03.110558	2020-04-28 19:38:52.773941	0101000020E6100000B79BE09BA64F05403F390A10053B4840	2	43	slab	5	1	{risky}
260	Les Petits Pas	3c	2020-05-07 12:44:29.655082	2020-05-07 20:36:01.918002	0101000020E6100000F86C1D1CEC2D04408176871403304840	10	3	traverse	\N	2	{}
39	\N	2b	2020-04-16 20:19:03.085051	2020-10-23 15:34:08.866177	0101000020E6100000FAB7D281E14C054051B57FDC4C3B4840	1	10	slab	\N	1	{}
247	Pince sans Rire	6a	2020-05-07 12:44:29.607908	2020-05-10 12:13:12.395291	0101000020E610000074B515FBCB2E04406A4E5E6402304840	11	1	wall	3	2	{}
263	Antigel	5c	2020-05-07 12:44:29.676841	2020-05-10 12:13:28.538586	0101000020E6100000D11F9A79722D04409CBF098508304840	11	2	overhang	4	2	{}
262	Le Chameau	4a	2020-05-07 12:44:29.673559	2020-05-10 10:04:48.979461	0101000020E610000054E1CFF0662D044068B27F9E06304840	12	3	wall	3	2	{}
259	L'Additif	2c	2020-05-07 12:44:29.6514	2020-05-10 10:24:07.06878	0101000020E61000003D98141F9F30044021AE9CBD33304840	10	48	traverse	3	2	{}
249	La Meringue	3a	2020-05-07 12:44:29.617078	2020-05-10 10:04:31.414915	0101000020E6100000B20E4757E92E04400589EDEE01304840	12	1	wall	3	2	{}
75	\N	3a+	2020-04-16 20:19:03.196731	2020-10-24 21:16:01.681032	0101000020E61000007EC384CAD54E0540EC74A5FF333B4840	2	18	overhang	\N	1	{}
246	Le Rebord	2c	2020-05-07 12:44:29.557853	2020-05-10 10:07:25.454255	0101000020E610000075931804562E04400000000000304840	10	2	wall	4	2	{}
63		2c	2020-04-16 20:19:03.152875	2020-10-27 11:58:43.150219	0101000020E6100000C9B85589D04D05409526E7A6103B4840	2	27	wall	4	1	{}
234	Les Copains d'abord	7a	2020-04-16 20:19:03.659414	2020-10-24 21:16:02.218158	0101000020E610000015BDEF6F6F50054041DE787B1E3B4840	6	14	overhang	\N	1	{sit_start}
150	Le Chou-Fleur	4a	2020-04-16 20:19:03.413927	2020-10-24 21:16:02.228053	0101000020E6100000B80CFE6CAD4E0540B9E7D6A73D3B4840	5	22	wall	\N	1	{}
177	L'Espace	5a	2020-04-16 20:19:03.491804	2020-10-24 21:16:02.232238	0101000020E6100000BEAA73292C500540D9BC319D353B4840	5	8	wall	4	1	{}
85	\N	3a	2020-04-16 20:19:03.225198	2020-10-24 21:16:02.244789	0101000020E6100000CE5EF3427650054092AF9CE3363B4840	2	2	traverse	\N	1	{}
51	\N	3b	2020-04-16 20:19:03.116043	2020-04-19 08:39:46.608928	0101000020E6100000CC5F217365500540566133C0053B4840	2	41	overhang	\N	1	{}
52	\N	3b+	2020-04-16 20:19:03.118716	2020-04-19 08:39:46.610765	0101000020E6100000D74D29AF95500540B0AC3429053B4840	2	40	wall	\N	1	{}
54	\N	3a	2020-04-16 20:19:03.124347	2020-04-19 08:39:46.614451	0101000020E61000005B61FA5E435005405FEE93A3003B4840	2	38	wall	\N	1	{}
434	\N	\N	2020-10-19 19:33:22.859067	2020-10-25 21:58:14.574445	0101000020E6100000290CE9998C1E0540BAF45DAD3A394840	14	48	other	\N	4	{}
417	\N	\N	2020-10-19 19:33:22.826188	2020-10-25 21:58:14.609423	0101000020E61000000D00E9EF751B0540A43DD4D247394840	14	31	other	\N	4	{}
128	Poésies	4a	2020-04-16 20:19:03.353357	2020-10-24 21:16:02.248181	0101000020E610000037567D6FF34C05407651CEF9443B4840	5	31	slab	\N	1	{}
219	Nuage Blanc	6a+	2020-04-16 20:19:03.618292	2020-10-24 21:16:02.255112	0101000020E6100000F0F9795B184F0540B12E5DA3333B4840	4	25	overhang	4	1	{}
84	La Folklorique	2a	2020-04-16 20:19:03.222079	2020-10-24 21:16:02.258637	0101000020E6100000024E60294E5005406763BA93353B4840	2	3	traverse	\N	1	{}
83	Le Butte	3b	2020-04-16 20:19:03.219112	2020-10-24 21:16:02.268216	0101000020E6100000D4D6DACC40500540D1EFFE31353B4840	2	4	slab	3	1	{}
102	L'Impossible	5a+	2020-04-16 20:19:03.275219	2020-10-24 21:16:02.271425	0101000020E6100000CFC272FD904E0540A098AD35153B4840	3	38	wall	\N	1	{}
237	Délivrance / Marquis de Sade	7a+	2020-04-16 20:19:03.668523	2020-10-24 21:16:02.275096	0101000020E6100000FC00410CB64E0540499795F1143B4840	6	17	slab	6	1	{risky}
223	L'Innominata	6c+	2020-04-16 20:19:03.629074	2020-10-24 21:16:02.297856	0101000020E61000005BDC275CDE4E0540D229B84C423B4840	6	4	wall	4	1	{}
191	SOS Glycogène	5c	2020-04-16 20:19:03.536171	2020-10-24 21:16:02.301231	0101000020E6100000192DDCB7A44E0540D20E8DFB293B4840	4	23	overhang	\N	1	{}
138	Quatrain	4a+	2020-04-16 20:19:03.381005	2020-10-24 21:16:02.30462	0101000020E6100000863AEDF23E4E05403DE20C76433B4840	5	27	wall	4	1	{}
79	La Contrabasse	3c+	2020-04-16 20:19:03.208392	2020-10-24 21:16:02.308236	0101000020E6100000A56FC6BA114F0540E5B422E62F3B4840	2	9	slab	\N	1	{}
139	Le Sylphe	5a	2020-04-16 20:19:03.384731	2020-10-24 21:16:02.318572	0101000020E61000007C734EF6294E05404585A152433B4840	5	26	wall	4	1	{}
45	\N	2b	2020-04-16 20:19:03.099817	2020-10-24 21:16:02.321928	0101000020E61000001C7594A4FD4D0540444BF184443B4840	1	4	overhang	\N	1	{}
221	Magifix	6c+	2020-04-16 20:19:03.623733	2020-10-24 21:16:02.331895	0101000020E6100000068F33DD415005404461CEF93E3B4840	6	2	overhang	4	1	{}
466			2020-10-19 19:34:08.148258	2020-10-25 21:58:14.614414	0101000020E6100000DB14E9F39D1C0540FE98E11140394840	13	30	other	\N	4	{}
484	\N	\N	2020-10-19 19:34:08.18634	2020-10-25 21:58:14.619363	0101000020E61000004BDEE82F9D1D05403AD68E7331394840	13	48	other	\N	4	{}
14		2a	2020-04-16 20:19:03.01478	2020-10-27 11:07:43.213901	0101000020E6100000AF7EE8CEB44E05408EEF5F5D143B4840	1	36	slab	\N	1	{risky}
118	L'Appuyette	5b	2020-04-16 20:19:03.324845	2020-04-28 19:38:52.786752	0101000020E610000089B3226AA24F0540A71FD4450A3B4840	3	4	slab	5	1	{risky}
274	Tentation pour Quatre	4c	2020-05-07 12:44:29.713637	2020-05-10 12:14:22.503401	0101000020E610000085B2F0F5B52E04406AA510C825304840	11	5	overhang	3	2	{}
275	La Coque	4a	2020-05-07 12:44:29.717511	2020-05-10 10:05:32.944128	0101000020E610000058CA32C4B12E044005E09F5225304840	12	7	wall	2	2	{}
267	Le Flop	2a+	2020-05-07 12:44:29.690084	2020-05-10 10:14:07.960869	0101000020E6100000DCF5D214012E0440D976DA1A11304840	10	6	wall	2	2	{}
266	Coup de Sang	5c	2020-05-07 12:44:29.6869	2020-05-10 12:13:45.842861	0101000020E61000002D08E57D1C2D044011548D5E0D304840	11	3	wall	4	2	{}
276	Le Bilbo	5b	2020-05-07 12:44:29.72365	2020-05-10 12:14:36.262836	0101000020E6100000AEBB79AA432E04401BD47E6B27304840	11	6	wall	5	2	{}
265	La Dignité	5a	2020-05-07 12:44:29.683406	2020-05-10 10:05:01.259702	0101000020E6100000A54FABE80F2D0440DC12B9E00C304840	12	4	wall	4	2	{}
270	Le Château Fort	4a	2020-05-07 12:44:29.699491	2020-05-10 10:05:13.10074	0101000020E6100000ADA3AA09A22E04407E8FFAEB15304840	12	5	slab	3	2	{}
273	L'Accusation	3b+	2020-05-07 12:44:29.710103	2020-05-10 10:05:23.641848	0101000020E6100000B3EC4960732E04401EA4A7C821304840	12	6	wall	4	2	{}
278	Citron Vert	6a	2020-05-07 12:44:29.739906	2020-05-10 12:15:17.520809	0101000020E6100000034356B77A2E0440EAE74D452A304840	11	7	wall	4	2	{}
59	Candide	4a+	2020-04-16 20:19:03.138365	2020-10-23 15:34:08.91479	0101000020E610000080F360C0704E05402B989F93FC3A4840	2	32	overhang	4	1	{}
282	Le Cyanure Sucré	5c	2020-05-07 12:44:29.754642	2020-05-10 12:16:40.38446	0101000020E6100000FCA71B28F02E0440C44142942F304840	11	11	traverse	3	2	{}
283	Épreuve de Force	5b	2020-05-07 12:44:29.758001	2020-05-10 12:17:13.583146	0101000020E61000005DFB027AE12E0440D99942E735304840	11	13	traverse	2	2	{}
285	Coquetterie	6a+	2020-05-07 12:44:29.764821	2020-05-10 12:17:28.990529	0101000020E61000003A75E5B33C2F044028D3687231304840	11	14	traverse	3	2	{}
122	Force G	6a+	2020-04-16 20:19:03.336502	2020-10-24 21:16:01.77582	0101000020E6100000E495E7384B4F05404345DB44043B4840	4	1	wall	6	1	{risky}
407	\N	\N	2020-10-19 19:33:22.805085	2020-10-25 21:58:14.5434	0101000020E6100000BF16E989271B0540C6C41E2F3D394840	14	21	other	\N	4	{}
441	\N	\N	2020-10-19 19:34:08.091842	2020-10-25 21:58:14.623171	0101000020E6100000E5E0E875A51A0540676E474542394840	13	5	other	\N	4	{}
483	\N	\N	2020-10-19 19:34:08.180996	2020-10-25 21:58:14.62859	0101000020E61000000E08E933E41D0540DD8BA9152E394840	13	47	other	\N	4	{}
115	Le Talon d'Achille	6a+	2020-04-16 20:19:03.315145	2020-10-24 21:16:01.91854	0101000020E61000001D386744694F0540E6357E6F0C3B4840	4	3	wall	3	1	{}
119	Le Pied Levé	4a	2020-04-16 20:19:03.327877	2020-10-24 21:16:02.015869	0101000020E6100000C8D254B23C4F054003A5E27F053B4840	3	2	overhang	6	1	{risky}
114	Le dévers	4b	2020-04-16 20:19:03.312006	2020-10-24 21:16:02.085422	0101000020E61000000624BCCB534F0540E561C4B90E3B4840	3	7	overhang	3	1	{}
126	Le Cap Gap	5a	2020-04-16 20:19:03.34717	2020-10-24 21:16:02.286792	0101000020E6100000A808E9E8904F0540D0ECFF42043B4840	3	1	slab	5	1	{risky}
117	Le Bloc	5b	2020-04-16 20:19:03.321877	2020-10-24 21:16:02.325882	0101000020E610000077DA0F05BA4F054095E028660C3B4840	3	5	wall	4	1	{}
123	L'Intermédiaire	4a	2020-04-16 20:19:03.339222	2020-10-24 21:16:02.337781	0101000020E61000009B34CEB0694F0540367E1454173B4840	3	10	wall	\N	1	{}
11	\N	2a	2020-04-16 20:19:03.0008	2020-10-27 11:58:43.27099	0101000020E610000041001CF4C34D054083BBF57C103B4840	1	39	slab	\N	1	{}
65	Bofinger	3b	2020-04-16 20:19:03.160686	2020-10-24 21:16:02.351122	0101000020E610000019961366AF4E0540BA332F77133B4840	2	26	slab	4	1	{}
31	Autoroute du Soleil	2c	2020-04-16 20:19:03.061908	2020-10-24 21:16:02.369311	0101000020E61000001A03BA1CEA4D0540636CBEC9303B4840	1	19	overhang	\N	1	{}
183	Chlorophylle	6b	2020-04-16 20:19:03.508384	2020-10-24 21:16:02.372993	0101000020E6100000FA1066B2C14E05400A1C8402293B4840	4	20	slab	6	1	{risky}
164	Égérie	4b	2020-04-16 20:19:03.455374	2020-10-24 21:16:02.381964	0101000020E61000005238A03C234F0540B558F9F62E3B4840	5	10	slab	4	1	{}
179	La Goulotte	3c	2020-04-16 20:19:03.497705	2020-10-24 21:16:02.385301	0101000020E61000004CAFF8E7FA4E0540DD60963F2B3B4840	3	19	wall	3	1	{}
124	Quintessence	5c	2020-04-16 20:19:03.341645	2020-10-24 21:16:02.388963	0101000020E610000049C225FDE74D0540BF4E951C093B4840	4	6	slab	4	1	{}
76	\N	1a+	2020-04-16 20:19:03.199881	2020-10-24 21:16:02.392745	0101000020E610000002CEEDFBEF4E0540E0F8F4DF333B4840	2	12	wall	\N	1	{}
1	Poseurs	3b	2020-04-16 20:19:02.969757	2020-10-24 21:16:02.399652	0101000020E61000003C2FF93AFD4C05408F437E50453B4840	1	13	slab	4	1	{}
160	L'Hiver	4b+	2020-04-16 20:19:03.441015	2020-10-24 21:16:02.402932	0101000020E6100000AFFF9CB13C5005406A1054973F3B4840	5	4	overhang	\N	1	{}
112	L'Ancien	6a	2020-04-16 20:19:03.30446	2020-04-19 08:39:46.71733	0101000020E61000005281936DE04E0540A2629CBF093B4840	4	5	overhang	4	1	{}
113	Dure Limite	6b	2020-04-16 20:19:03.307868	2020-04-19 08:39:46.719169	0101000020E61000000DDFC2BAF14E0540D1E638B7093B4840	4	4	overhang	4	1	{}
116	L'Atrappe-Mouche	5a+	2020-04-16 20:19:03.318314	2020-04-19 08:39:46.720886	0101000020E61000004ACE893DB44F0540A583F57F0E3B4840	3	6	wall	4	1	{}
475			2020-10-19 19:34:08.164936	2020-10-25 21:58:14.633359	0101000020E61000003DF8E8DBB51C05401D063C8D3B394840	13	39	other	\N	4	{}
467	\N	\N	2020-10-19 19:34:08.151111	2020-10-25 21:58:14.6769	0101000020E6100000CA0FE9C9A81D0540E762932045394840	13	31	other	\N	4	{}
521	\N	\N	2020-10-19 19:34:28.362649	2020-10-25 21:58:14.686046	0101000020E61000006AE7E8334F1C0540F14865A235394840	15	37	other	\N	4	{}
522	\N	\N	2020-10-19 19:34:28.364328	2020-10-25 21:58:14.689803	0101000020E61000009FDEE8C1661C0540275BFE6E33394840	15	38	other	\N	4	{}
468	\N	\N	2020-10-19 19:34:08.153166	2020-10-25 21:58:14.694674	0101000020E610000058F9E843C51D05409596E7C347394840	13	32	other	\N	4	{}
308	L'Indolent	4a+	2020-05-07 12:44:29.876089	2020-05-10 10:27:10.144553	0101000020E6100000158F8B6A1131044086730D3334304840	12	13	wall	3	2	{}
312	L'Autre Dalle	3a	2020-05-07 12:44:29.890614	2020-05-10 10:27:30.317717	0101000020E61000008CBE823463310440B9C7D2872E304840	12	14	slab	5	2	{}
295	La Bottine	4c	2020-05-07 12:44:29.810017	2020-05-10 10:04:02.725572	0101000020E61000009B3C65355D2F04403E42CD902A304840	12	9	traverse	4	2	{}
290	L'Écorce	4a	2020-05-07 12:44:29.781526	2020-05-10 10:05:59.986193	0101000020E6100000E527D53E1D2F04408AABCABE2B304840	12	8	wall	3	2	{}
286	L'Embarras	3a	2020-05-07 12:44:29.768207	2020-05-10 10:24:37.573497	0101000020E610000090882991442F044018D00B772E304840	10	50	other	3	2	{}
454	\N	\N	2020-10-19 19:34:08.122809	2020-10-25 21:58:14.701666	0101000020E6100000561FE9732D1C0540E072F34533394840	13	18	other	\N	4	{}
453	\N	\N	2020-10-19 19:34:08.120945	2020-10-25 21:58:14.705113	0101000020E6100000C147FAC8421B054092DEF4C52E394840	13	17	other	\N	4	{}
18		2a	2020-04-16 20:19:03.025123	2020-10-27 10:59:47.416355	0101000020E61000009886DD04074F0540C104EAA4193B4840	1	32	traverse	\N	1	{}
294	Le Lux	5a	2020-05-07 12:44:29.806067	2020-05-10 10:25:58.381458	0101000020E610000051DD5CFC6D2F04407383A10E2B304840	12	10	wall	4	2	{}
299	La Borne	4a	2020-05-07 12:44:29.82442	2020-05-10 10:26:19.222109	0101000020E61000005BB39597FC2F04405AF3E32F2D304840	12	11	slab	4	2	{}
303	La Pacotille	4a	2020-05-07 12:44:29.838547	2020-05-10 10:26:40.148257	0101000020E61000006170CD1DFD2F0440CDCEA2772A304840	12	12	wall	3	2	{}
296	Navigation	5b	2020-05-07 12:44:29.813464	2020-05-10 12:15:32.151933	0101000020E61000009B3C65355D2F04401A6CEA3C2A304840	11	8	wall	4	2	{}
291	Mauvaise Pioche	5b+	2020-05-07 12:44:29.78503	2020-05-10 12:15:55.224083	0101000020E6100000F1A1444B1E2F0440D84812842B304840	11	9	wall	4	2	{}
287	Indécence	5b	2020-05-07 12:44:29.771544	2020-05-10 12:16:24.553157	0101000020E6100000B779E3A4302F0440E38E37F92D304840	11	10	wall	3	2	{}
288	Jeu de Quilles	5c	2020-05-07 12:44:29.774914	2020-05-10 12:18:04.193663	0101000020E610000079CE16105A2F0440247EC51A2E304840	11	15	wall	3	2	{}
297	Vol à Vue	5b+	2020-05-07 12:44:29.817348	2020-05-10 12:18:20.211553	0101000020E61000000C3B8C497F2F04405B5B785E2A304840	11	16	overhang	4	2	{}
200	L'Oubliée	4b	2020-04-16 20:19:03.561823	2020-10-27 11:58:43.783992	0101000020E6100000F2865F61AD4D05403EFD7A342D3B4840	3	27	wall	\N	1	{}
127	Faute de Frappe	5c	2020-04-16 20:19:03.350497	2020-10-23 15:34:08.883513	0101000020E6100000E79C845AFA4E0540D75FC8EE143B4840	4	15	wall	3	1	{}
412	\N	\N	2020-10-19 19:33:22.815085	2020-10-25 21:58:14.708873	0101000020E61000001BF3E88BF91905401618070B43394840	14	26	other	\N	4	{}
526	\N	\N	2020-10-19 19:34:28.371829	2020-10-25 21:58:14.712391	0101000020E6100000FB17E9FB1D1C0540D27271FE2F394840	15	42	other	\N	4	{}
133	L'Araignée	6a	2020-04-16 20:19:03.366761	2020-10-24 21:16:01.794652	0101000020E610000008D1A0AD674E0540C9E0431E493B4840	4	38	overhang	\N	1	{}
131	Macadam	6a	2020-04-16 20:19:03.361354	2020-10-24 21:16:01.833861	0101000020E610000093CDFA06184D0540BF9E452C3F3B4840	4	41	wall	\N	1	{}
120	Scarlatine	6b	2020-04-16 20:19:03.33075	2020-10-24 21:16:02.071578	0101000020E6100000FD421D973A4F05406EBB65F4053B4840	4	2	slab	\N	1	{}
423	\N	\N	2020-10-19 19:33:22.836217	2020-10-25 21:58:14.715728	0101000020E610000083D0E811BB1D0540CE01E34545394840	14	37	other	\N	4	{}
298	Passage à Tabac	5c	2020-05-07 12:44:29.820931	2020-05-10 12:18:40.619151	0101000020E6100000C7BAB88D06300440DDD1FF722D304840	11	17	wall	3	2	{}
302	Coule Douce	5b	2020-05-07 12:44:29.834877	2020-05-10 12:18:53.230902	0101000020E61000003FC8B260E22F04400EBE30992A304840	11	18	slab	4	2	{}
520	\N	\N	2020-10-19 19:34:28.360786	2020-10-25 21:58:14.718892	0101000020E6100000AF11E95F321C0540F19F4F6738394840	15	36	other	\N	4	{}
134	Le Pont Mirabeau	5a	2020-04-16 20:19:03.369801	2020-04-19 08:39:46.75218	0101000020E61000008C4D2B85404E05407590D783493B4840	5	28	slab	4	1	{}
86	Le Beaufort	5b	2020-04-16 20:19:03.228394	2020-10-24 21:16:02.406256	0101000020E61000001D23E026D84F0540163263211F3B4840	3	12	overhang	5	1	{risky}
125	\N	3c	2020-04-16 20:19:03.344473	2020-10-27 11:58:43.552885	0101000020E6100000D4FE0CC845500540C7D7AE1EFE3A4840	2	37	wall	\N	1	{}
80	L'Ex Saut du Jaune	2c	2020-04-16 20:19:03.211104	2020-10-24 21:16:02.412937	0101000020E61000009A588AA03A4F0540DC86A551313B4840	2	8	traverse	\N	1	{}
47	\N	2a	2020-04-16 20:19:03.105104	2020-10-24 21:16:02.431483	0101000020E6100000849CC348544E0540EC003A0F453B4840	1	2	slab	\N	1	{}
317	La Plaque Avant	4b	2020-05-07 12:44:29.908576	2020-05-10 12:19:32.136116	0101000020E61000006571FF91E9300440664AEB6F09304840	11	20	slab	3	2	{}
318	Pierre Ponce	5a	2020-05-07 12:44:29.911999	2020-05-10 12:20:12.485626	0101000020E6100000DC2C5E2C0C310440DEAE97A608304840	11	22	wall	3	2	{}
316	La Tanière	5c	2020-05-07 12:44:29.905102	2020-05-10 12:20:28.995868	0101000020E610000008ABB184B53104405A9C31CC09304840	11	23	overhang	2	2	{}
315	Belle au Fond de Teint	6a	2020-05-07 12:44:29.901467	2020-05-10 12:20:57.391887	0101000020E61000000859164CFC310440287CB60E0E304840	11	24	overhang	4	2	{}
314	La Mer à Boire	6a	2020-05-07 12:44:29.897593	2020-05-10 12:21:13.906159	0101000020E6100000F2086EA46C310440B43EE5982C304840	11	25	overhang	3	2	{}
186	La Dalle de Marbre	4c	2020-04-16 20:19:03.516731	2020-10-24 21:16:02.438499	0101000020E610000046C5C97B954E0540C83FADD9263B4840	3	15	slab	\N	1	{}
156	Paysage	3b	2020-04-16 20:19:03.429431	2020-10-24 21:16:02.442018	0101000020E6100000A794CAF4CB4E0540DA640674383B4840	5	19	wall	4	1	{}
143	Le Pion Cassé	5a	2020-04-16 20:19:03.39548	2020-10-24 21:16:02.454305	0101000020E61000007550EEBECA4E05403508BE99413B4840	4	32	wall	4	1	{}
366	La Bourrique	3c	2020-05-07 12:44:30.115411	2020-05-10 10:36:17.872118	0101000020E610000031992A189534044061FA5E4370304840	12	36	wall	3	2	{}
320	L'Autorisation	2c	2020-05-07 12:44:29.919458	2020-05-10 10:23:56.814286	0101000020E6100000CA8B4CC0AF31044091B932A836304840	10	47	slab	4	2	{}
142	Il va Neiger	3c	2020-04-16 20:19:03.392806	2020-10-24 21:16:02.457908	0101000020E610000009F5858A2B4E0540610319A3413B4840	5	25	wall	\N	1	{}
323	La Téméraire	5a	2020-05-07 12:44:29.939199	2020-05-10 10:28:18.925403	0101000020E61000000611A9691733044070D05E7D3C304840	12	15	wall	4	2	{}
525	\N	\N	2020-10-19 19:34:28.370067	2020-10-25 21:58:14.736578	0101000020E61000000DCBE82F351C0540CB51622A32394840	15	41	other	\N	4	{}
330	La Camée	4b	2020-05-07 12:44:29.965474	2020-05-10 10:29:51.048925	0101000020E6100000D732198EE733044034BBEEAD48304840	12	17	wall	4	2	{}
425	\N	\N	2020-10-19 19:33:22.841119	2020-10-25 21:58:14.740366	0101000020E6100000E2D2E8DDD01D0540C0377E4648394840	14	39	other	\N	4	{}
335	Le Bac Rond	4b	2020-05-07 12:44:29.98695	2020-05-10 10:30:13.435981	0101000020E6100000766B990CC73304408A027D224F304840	12	18	wall	3	2	{}
337	L'Existentiel	4a+	2020-05-07 12:44:29.994277	2020-05-10 10:30:34.192136	0101000020E61000003ECF9F36AA330440DD5CFC6D4F304840	12	19	wall	5	2	{}
339	Le Kyste	4c	2020-05-07 12:44:30.008678	2020-05-10 10:30:51.648584	0101000020E61000003E5B07077B3304408445459C4E304840	12	20	wall	4	2	{}
343	Le Bon Coin	4b+	2020-05-07 12:44:30.023209	2020-05-10 10:31:07.866235	0101000020E6100000001AA54BFF3204406E5166834C304840	12	21	wall	4	2	{}
345	Le Rentrant	4a	2020-05-07 12:44:30.030029	2020-05-10 10:31:22.478047	0101000020E6100000D331E719FB320440C634D3BD4E304840	12	22	wall	4	2	{}
350	La Dülfer	4a	2020-05-07 12:44:30.047885	2020-05-10 10:31:53.786107	0101000020E610000095D8B5BDDD320440F584251E50304840	12	23	wall	3	2	{}
357	Les Précieuses	3a	2020-05-07 12:44:30.081233	2020-05-10 10:32:21.242648	0101000020E61000001BD5E940D6330440577A6D3656304840	12	24	traverse	4	2	{}
358	Le Velouté	3c	2020-05-07 12:44:30.084878	2020-05-10 10:32:37.470938	0101000020E61000004F92AE997C3304407FA5F3E159304840	12	25	wall	4	2	{}
365	La Poulette	4b	2020-05-07 12:44:30.112054	2020-05-10 10:36:00.541068	0101000020E61000008BDD3EABCC340440DA9255116E304840	12	35	wall	4	2	{}
367	La Moucheture	5a	2020-05-07 12:44:30.119058	2020-05-10 10:36:37.237069	0101000020E6100000FEB968C878340440BADDCB7D72304840	12	37	slab	4	2	{}
364	La Coqueluche	4b	2020-05-07 12:44:30.108294	2020-05-10 10:36:53.168024	0101000020E6100000999F1B9AB2330440683C11C479304840	12	38	wall	3	2	{}
362	Le Crack	4a+	2020-05-07 12:44:30.098802	2020-05-10 10:37:24.991651	0101000020E6100000CD22145B41330440683C11C479304840	12	39	overhang	4	2	{}
360	L'Angle Solide	4b	2020-05-07 12:44:30.0917	2020-05-10 10:38:04.994851	0101000020E6100000B1C398F4F73204407EAB75E272304840	12	41	overhang	4	2	{}
359	Le Billet Doux	4b+	2020-05-07 12:44:30.08839	2020-05-10 10:38:38.444476	0101000020E6100000003CA24275330440115322895E304840	12	42	slab	3	2	{}
356	Et Tic en Toc	4b+	2020-05-07 12:44:30.077385	2020-05-10 10:39:00.460862	0101000020E610000095B6B8C6673204409DBE9EAF59304840	12	43	wall	3	2	{}
354	La Traversée du Temps	4a+	2020-05-07 12:44:30.070128	2020-05-10 10:39:20.790224	0101000020E61000005CC823B8913204407B849A2155304840	12	44	traverse	3	2	{}
353	La Bascule	4a	2020-05-07 12:44:30.058978	2020-05-10 10:39:39.165954	0101000020E61000000729780AB93204404777103B53304840	12	45	wall	3	2	{}
349	La Bastille	4b	2020-05-07 12:44:30.04424	2020-05-10 10:40:00.15185	0101000020E6100000F52B9D0FCF3204403674B33F50304840	12	46	wall	5	2	{}
319	Le Puzzle Brisé	5a	2020-05-07 12:44:29.915721	2020-05-10 12:19:52.914005	0101000020E610000015C9570229310440C9224DBC03304840	11	21	wall	4	2	{}
325	Du Genou	5b+	2020-05-07 12:44:29.946172	2020-05-10 12:21:36.823139	0101000020E61000008E8F16670C330440E7340BB43B304840	11	26	overhang	3	2	{}
336	Le Sourire	5b	2020-05-07 12:44:29.990595	2020-05-10 12:22:20.669779	0101000020E61000007CB4386398330440C500892650304840	11	28	overhang	3	2	{}
340	L'Éminence	5a	2020-05-07 12:44:30.012221	2020-05-10 12:22:42.506766	0101000020E61000008237A45181330440A25EF0694E304840	11	29	wall	4	2	{}
414	\N	\N	2020-10-19 19:33:22.818914	2020-10-25 21:58:14.743881	0101000020E610000052CDE8E3731A054089DF23B449394840	14	28	other	\N	4	{}
351	L'Arête Principale	5a	2020-05-07 12:44:30.051749	2020-05-10 12:23:06.470839	0101000020E61000009A5B21ACC6320440CBBDC0AC50304840	11	30	overhang	5	2	{}
361	Le Virtuose	4c	2020-05-07 12:44:30.095222	2020-05-10 12:24:28.799041	0101000020E610000094FAB2B4533304406EF9484A7A304840	11	33	overhang	4	2	{}
363	Le Pare-Chocs	5c	2020-05-07 12:44:30.104679	2020-05-10 12:24:50.911849	0101000020E610000054C37E4FAC330440C153C8957A304840	11	34	wall	3	2	{}
369	L'Œuf du Chien	5b	2020-05-07 12:44:30.126254	2020-05-10 12:25:13.556865	0101000020E6100000A33B889D293404403DF0315871304840	11	35	wall	5	2	{}
368	Le Curseur	6a	2020-05-07 12:44:30.122535	2020-05-10 12:25:36.184157	0101000020E6100000425C397B6734044037FFAF3A72304840	11	36	wall	3	2	{}
372	La Bafouille	4b	2020-05-07 12:44:30.144909	2020-05-10 10:33:17.957372	0101000020E6100000D732198EE7330440AA0EB9196E304840	12	26	wall	3	2	{}
370	Le Pied de Nez	4c	2020-05-07 12:44:30.137125	2020-05-10 10:33:34.942936	0101000020E6100000ED9A90D618340440A31D37FC6E304840	12	27	wall	4	2	{}
380	Le Baraqué	4c	2020-05-07 12:44:30.173697	2020-05-10 10:33:58.208824	0101000020E61000008813984EEB360440BCCADAA678304840	12	28	wall	2	2	{}
379	Le Succédané	4a	2020-05-07 12:44:30.170205	2020-05-10 10:34:15.371086	0101000020E6100000CCEF3499F13604402D0ABB287A304840	12	29	traverse	3	2	{}
373	Le Phare	3c	2020-05-07 12:44:30.148345	2020-05-10 10:34:32.492763	0101000020E6100000362383DC453804405265187783304840	12	30	wall	5	2	{}
374	Le Combinard	4b	2020-05-07 12:44:30.152936	2020-05-10 10:34:48.553753	0101000020E6100000378DEDB5A03704404D10751F80304840	12	31	wall	3	2	{}
375	Les Bourses	4b	2020-05-07 12:44:30.156365	2020-05-10 10:35:05.65183	0101000020E610000092AF0452623704407C60C77F81304840	12	32	wall	4	2	{}
377	Le Pain Blanc	3c	2020-05-07 12:44:30.163254	2020-05-10 10:35:25.309359	0101000020E61000008D4468041B3704400798F90E7E304840	12	33	traverse	3	2	{}
376	Le Barbot	4a	2020-05-07 12:44:30.159825	2020-05-10 10:35:42.182074	0101000020E61000000518963FDF3604400798F90E7E304840	12	34	wall	3	2	{}
371	Le Bouton Salvateur	6a	2020-05-07 12:44:30.141242	2020-05-10 12:24:11.399597	0101000020E61000007CD6355A0E340440F1BA7EC16E304840	11	32	wall	3	2	{}
378	La Coquâtre	5b	2020-05-07 12:44:30.166774	2020-05-10 12:25:54.224687	0101000020E61000009E077767ED3604408BDEA9807B304840	11	37	wall	4	2	{}
251	Le Liseré	4a+	2020-05-07 12:44:29.624968	2020-05-10 10:04:39.789759	0101000020E6100000F29716F5492E04409C6ED921FE2F4840	12	2	wall	3	2	{}
250	L'Élégante	4b	2020-05-07 12:44:29.621304	2020-05-10 10:29:34.684468	0101000020E6100000DEAB5626FC32044087F8872D3D304840	12	16	slab	3	2	{}
252	La Dépêche	3c	2020-05-07 12:44:29.628237	2020-05-10 10:37:41.259763	0101000020E610000056F31C91EF320440B875374F75304840	12	40	wall	4	2	{}
258	Rage de Dents	5b	2020-05-07 12:44:29.647939	2020-05-10 12:14:01.662274	0101000020E6100000CAA65CE15D2E04403CBD529621304840	11	4	wall	4	2	{}
253	Bourre en Bref	5a	2020-05-07 12:44:29.631362	2020-05-10 12:16:58.434473	0101000020E6100000350A4966F52E0440ABB184B531304840	11	12	slab	3	2	{}
254	La Bordée	5a	2020-05-07 12:44:29.634962	2020-05-10 12:19:07.770343	0101000020E6100000AB09A2EE0330044001A260C614304840	11	19	wall	3	2	{}
255	La Caisse	5b	2020-05-07 12:44:29.638657	2020-05-10 12:22:03.452363	0101000020E61000001618B2BAD5330440C904FC1A49304840	11	27	overhang	2	2	{}
256	La Constance	5a	2020-05-07 12:44:29.641858	2020-05-10 12:23:29.381222	0101000020E61000006211C30E63320440B682A62556304840	11	31	wall	2	2	{}
257	Les Plaquettes de Chocolat	5c	2020-05-07 12:44:29.64496	2020-05-10 12:26:14.440858	0101000020E610000096766A2E373804406F7EC34483304840	11	38	overhang	5	2	{}
147	L'Oeuf de Colombe	6a	2020-04-16 20:19:03.405965	2020-10-24 21:16:01.70662	0101000020E6100000B9A0F0BC944E05406D10B7BA423B4840	4	31	wall	3	1	{}
157	Ode	4b+	2020-04-16 20:19:03.432134	2020-10-24 21:16:01.747232	0101000020E6100000309376F3C74F05405DD267DD3A3B4840	5	7	wall	3	1	{}
148	Pyramide	5c	2020-04-16 20:19:03.408707	2020-10-24 21:16:02.174748	0101000020E61000005198E4D8BD4F0540C6F8D70B413B4840	4	36	slab	\N	1	{risky}
173	La Belle Vieille	3c	2020-04-16 20:19:03.48083	2020-10-24 21:16:02.470665	0101000020E610000008F749B17950054096EF5D1B373B4840	5	3	wall	5	1	{risky}
137	Le Pot de Fer	6b	2020-04-16 20:19:03.378151	2020-10-24 21:16:02.477727	0101000020E6100000DAA0E6F55B4E054008015E12463B4840	4	40	overhang	4	1	{}
152	Prison	2b	2020-04-16 20:19:03.419142	2020-10-24 21:16:02.48773	0101000020E61000004A621762B54E054060197D34393B4840	2	15	wall	\N	1	{}
511	\N	\N	2020-10-19 19:34:28.342371	2020-10-25 21:58:14.747177	0101000020E61000009DDAE873951D0540B5EEC13A33394840	15	27	other	\N	4	{}
87	L'Ex-Souche	3c+	2020-04-16 20:19:03.231431	2020-10-24 21:16:02.497572	0101000020E6100000774FF29C02500540FCFB397A1D3B4840	3	11	wall	\N	1	{}
170	Crépuscule	4b	2020-04-16 20:19:03.472262	2020-10-24 21:16:02.504435	0101000020E610000087A8DE95644F054006B191E0323B4840	5	9	wall	\N	1	{}
28		3a	2020-04-16 20:19:03.052401	2020-10-27 11:58:43.263387	0101000020E6100000BCF7BC24254E05400A70710C283B4840	1	22	wall	\N	1	{}
198	Bateau Pilote	6a	2020-04-16 20:19:03.556024	2020-10-24 21:16:02.519545	0101000020E610000064B4F0DBD64E0540E515126C283B4840	4	18	wall	\N	1	{}
220	Cadeau du Vent	7b	2020-04-16 20:19:03.620885	2020-10-24 21:16:02.523369	0101000020E61000004DEE197561500540B5C9D0D5373B4840	6	1	overhang	5	1	{risky}
104	Superlative	6b+	2020-04-16 20:19:03.281088	2020-10-24 21:16:02.527089	0101000020E6100000C48FF29DB04E0540D2D6124B153B4840	4	14	slab	6	1	{risky}
264	La Bête de Somme	2b+	2020-05-07 12:44:29.680027	2020-05-10 10:08:24.454522	0101000020E6100000990F0874262D0440778192020B304840	10	5	wall	4	2	{}
271	Le Livret	3a	2020-05-07 12:44:29.703409	2020-05-10 10:15:54.705748	0101000020E6100000B49080D1E52D04401A4F04711E304840	10	9	slab	2	2	{}
309	La Fuite en Amont	3b	2020-05-07 12:44:29.879339	2020-05-10 10:17:56.193423	0101000020E6100000BABE0F07093104406F4BE48233304840	10	23	traverse	4	2	{}
322	Le Bourru	2b	2020-05-07 12:44:29.926841	2020-05-10 10:18:23.179249	0101000020E6100000D9B45208E4320440A51133FB3C304840	10	27	wall	2	2	{}
324	Le Boisseau	2b+	2020-05-07 12:44:29.94265	2020-05-10 10:19:33.244948	0101000020E61000006C21C841093304401D76DF313C304840	10	28	other	3	2	{}
342	La Placette	3a	2020-05-07 12:44:30.019746	2020-05-10 10:22:41.406942	0101000020E61000001C3F541A313304404356B77A4E304840	10	37	other	3	2	{}
121	Le Bombé	5a	2020-04-16 20:19:03.333627	2020-10-24 21:16:02.564522	0101000020E6100000C9D5AF69484F0540FF3A1190063B4840	3	3	overhang	\N	1	{}
321	Le Vigoureux	2b	2020-05-07 12:44:29.923071	2020-05-10 10:23:51.92159	0101000020E6100000E63C635FB23104407DE6AC4F39304840	10	46	traverse	5	2	{}
506			2020-10-19 19:34:28.331405	2020-10-25 21:58:14.750592	0101000020E6100000F9FCE873E11C0540DDE0A8103A394840	15	22	other	\N	4	{}
508	\N	\N	2020-10-19 19:34:28.33573	2020-10-25 21:58:14.757271	0101000020E6100000D51BE94DF81C054097817E283B394840	15	24	other	\N	4	{}
176	Le Damier	6b+	2020-04-16 20:19:03.489102	2020-10-24 21:16:01.711759	0101000020E61000003E48654A3B500540EAE6FD9F353B4840	4	26	slab	4	1	{}
194	L'Emmenthal	4a	2020-04-16 20:19:03.544902	2020-10-24 21:16:01.723046	0101000020E6100000FE77578DCB4E0540D4FC8EC6273B4840	3	16	wall	\N	1	{}
190	\N	3c	2020-04-16 20:19:03.533414	2020-10-24 21:16:01.770864	0101000020E610000007E3ACE8814F0540C05E57DA303B4840	2	7	overhang	\N	1	{}
163	La Contralto	5a	2020-04-16 20:19:03.451859	2020-10-24 21:16:01.785668	0101000020E6100000B97BAC3B194F0540848F690D2E3B4840	3	20	wall	6	1	{risky}
110	Jets Interdits	6a+	2020-04-16 20:19:03.29833	2020-10-27 11:58:43.283819	0101000020E6100000CE02E621B24D0540FEAF6CC90A3B4840	4	7	wall	4	1	{}
188	La Frouch'mammouth	4c	2020-04-16 20:19:03.527786	2020-10-24 21:16:01.87111	0101000020E61000009B7856004E4F0540DCB964FE323B4840	3	24	wall	\N	1	{}
182	Le Cheval d'Arçon	5b+	2020-04-16 20:19:03.505746	2020-10-24 21:16:01.882219	0101000020E6100000C38A56D3D54E0540A09460EB293B4840	3	17	wall	6	1	{risky}
231	Sledgehammer	7a	2020-04-16 20:19:03.651288	2020-10-27 11:58:43.287349	0101000020E6100000225225853D4C0540B9E166FF393B4840	6	11	traverse	2	1	{}
166	La Bendix	5b+	2020-04-16 20:19:03.461333	2020-10-24 21:16:01.963441	0101000020E6100000E4C15A37274F05405159854E303B4840	3	21	wall	5	1	{risky}
174	Solitude	4a	2020-04-16 20:19:03.483646	2020-10-24 21:16:01.974626	0101000020E6100000827E970770500540C3C0515D373B4840	5	2	wall	5	1	{risky}
169	Stances	4c	2020-04-16 20:19:03.46935	2020-10-24 21:16:02.008459	0101000020E6100000732F48023C4F0540506828F8303B4840	5	13	overhang	\N	1	{}
146	La Longue Marche	6b	2020-04-16 20:19:03.40327	2020-10-24 21:16:02.052941	0101000020E6100000DE3D8598B44E0540E1031EE3433B4840	4	35	traverse	\N	1	{}
172	La Prothèse	6a+	2020-04-16 20:19:03.478131	2020-10-24 21:16:02.064493	0101000020E61000003E9011AE6850054009C58BAC373B4840	4	27	wall	5	1	{risky}
384	Le Brise-Lame	2b	2020-05-07 20:11:37.775359	2020-05-10 10:25:11.128965	0101000020E61000004641F0F8F62E0440475A2A6F47304840	10	55	other	4	2	{}
385	Le Terminal	2b+	2020-05-07 20:11:37.778837	2020-05-10 10:25:18.605531	0101000020E61000002A90D959F42E0440043752B648304840	10	56	other	4	2	{}
381	La Sortie du Tunnel	2a+	2020-05-07 20:11:37.743528	2020-05-10 10:24:44.635989	0101000020E61000006EF8DD74CB2E0440ABB184B531304840	10	51	traverse	4	2	{}
382	L'Embarcadère	2a+	2020-05-07 20:11:37.76795	2020-05-10 10:25:00.189894	0101000020E6100000E030D120052F0440F54A598638304840	10	53	other	3	2	{}
383	Le Front de Mer	3a	2020-05-07 20:11:37.771971	2020-05-10 10:25:05.723949	0101000020E6100000240D6E6B0B2F0440024A438D42304840	10	54	wall	3	2	{}
135	La Dame de Pique	5c	2020-04-16 20:19:03.37264	2020-10-24 21:16:02.610188	0101000020E6100000B82C08CA374E0540737522C4493B4840	4	39	slab	4	1	{}
517	\N	\N	2020-10-19 19:34:28.3543	2020-10-25 21:58:14.760912	0101000020E6100000C31CE91F351D054045956B9730394840	15	33	other	\N	4	{}
428	\N	\N	2020-10-19 19:33:22.846318	2020-10-25 21:58:14.764557	0101000020E6100000CDD8E85B071E05400B14EEA24A394840	14	42	other	\N	4	{}
426	\N	\N	2020-10-19 19:33:22.842991	2020-10-25 21:58:14.768004	0101000020E61000006CDBE83BEB1D05406F3CA9A64A394840	14	40	other	\N	4	{}
494	\N	\N	2020-10-19 19:34:28.303312	2020-10-25 21:58:14.771225	0101000020E61000004BEEE875D21A0540BBEF153A42394840	15	10	other	\N	4	{}
438	\N	\N	2020-10-19 19:34:08.083591	2020-10-25 21:58:14.782271	0101000020E6100000ADD4E85B831A05401B1D45E82A394840	13	2	other	\N	4	{}
450	La Fissure Morin	4c	2020-10-19 19:34:08.1098	2020-10-25 21:58:14.789957	0101000020E610000067DBE8A10F1B054065481BEC49394840	13	14	wall	\N	4	{}
416	La Fissure des Enfants	3a+	2020-10-19 19:33:22.824233	2020-10-25 21:58:14.803754	0101000020E6100000C6F5E8F7C81A0540BAB98A044E394840	14	30	slab	\N	4	{}
409	\N	\N	2020-10-19 19:33:22.809804	2020-10-25 21:58:14.811209	0101000020E6100000AE00E921F91A05400F2BDEC742394840	14	23	other	\N	4	{}
496			2020-10-19 19:34:28.306993	2020-10-25 21:58:14.815239	0101000020E61000008FF7E81D471C0540CC220F1741394840	15	12	other	\N	4	{}
439	\N	\N	2020-10-19 19:34:08.086629	2020-10-25 21:58:14.822244	0101000020E6100000624BFAF85E1A0540BB04FF462C394840	13	3	other	\N	4	{}
421	\N	\N	2020-10-19 19:33:22.832852	2020-10-25 21:58:14.826181	0101000020E61000002FF7E8FF911C0540AF0F3C6040394840	14	35	other	\N	4	{}
497			2020-10-19 19:34:28.308693	2020-10-25 21:58:14.830008	0101000020E6100000EFDFE8B1581C054067B44DAC41394840	15	13	other	\N	4	{}
422			2020-10-19 19:33:22.834548	2020-10-25 21:58:14.833751	0101000020E61000000FDDE8BDA61C0540608696AE40394840	14	36	other	\N	4	{}
457	\N	\N	2020-10-19 19:34:08.127988	2020-10-25 21:58:14.837207	0101000020E6100000F819E9A97E1C05407F5D1ED330394840	13	21	other	\N	4	{}
480	\N	\N	2020-10-19 19:34:08.175456	2020-10-25 21:58:14.840522	0101000020E61000004AF8E867A11D054009DEFB0D33394840	13	44	other	\N	4	{}
472	\N	\N	2020-10-19 19:34:08.159887	2020-10-25 21:58:14.844232	0101000020E610000071EBE81BFC1D0540F15B0E6249394840	13	36	other	\N	4	{}
440			2020-10-19 19:34:08.08933	2020-10-25 21:58:14.847969	0101000020E6100000F413E913711A054038C4FF2B40394840	13	4	other	\N	4	{}
473	\N	\N	2020-10-19 19:34:08.161455	2020-10-25 21:58:14.855557	0101000020E61000005ACEE8CD871C05408796D7D13C394840	13	37	other	\N	4	{}
515	\N	\N	2020-10-19 19:34:28.349563	2020-10-25 21:58:14.869841	0101000020E61000005E09E923D61D0540A479B43E2E394840	15	31	other	\N	4	{}
268	L'Aisée	2a+	2020-05-07 12:44:29.693119	2020-05-10 10:15:43.262808	0101000020E610000048895DDBDB2D0440016E162F16304840	10	8	overhang	2	2	{}
474	\N	\N	2020-10-19 19:34:08.163102	2020-10-25 21:58:14.873841	0101000020E6100000DFF5E80FA01C05405593E8613C394840	13	38	other	\N	4	{}
432	\N	\N	2020-10-19 19:33:22.853854	2020-10-25 21:58:14.877778	0101000020E6100000EE18E967361F05405190BF1E3C394840	14	46	other	\N	4	{}
490			2020-10-19 19:34:28.296024	2020-10-25 21:58:14.882043	0101000020E61000002B20E92D931A05402DE16E9F45394840	15	6	other	\N	4	{}
277	L'Envers du Toit	2b	2020-05-07 12:44:29.727318	2020-05-10 10:16:13.297326	0101000020E6100000FD1186014B2E0440AFE9414129304840	10	11	traverse	6	2	{}
433	\N	\N	2020-10-19 19:33:22.856767	2020-10-25 21:58:14.885756	0101000020E610000000CCE89B4D1F05403B5F15AB3B394840	14	47	other	\N	4	{}
476			2020-10-19 19:34:08.168	2020-10-25 21:58:14.889487	0101000020E61000004818E99BD71C05400DEF97803A394840	13	40	other	\N	4	{}
424	\N	\N	2020-10-19 19:33:22.837923	2020-10-25 21:58:14.897663	0101000020E61000008F1FE995EB1D054042C54EE046394840	14	38	other	\N	4	{}
448	\N	\N	2020-10-19 19:34:08.106358	2020-10-25 21:58:14.901568	0101000020E6100000EF00E935C71A05407CFC361D4D394840	13	12	other	\N	4	{}
279	Le Paisible	2a	2020-05-07 12:44:29.743657	2020-05-10 10:16:36.724069	0101000020E6100000BE66B96C742E0440780C8FFD2C304840	10	12	slab	3	2	{}
280	L'Indulgent	2b	2020-05-07 12:44:29.747438	2020-05-10 10:16:43.623839	0101000020E61000001F2E39EE942E0440361D01DC2C304840	10	13	slab	3	2	{}
215	Le Vallon	5c	2020-04-16 20:19:03.60743	2020-10-24 21:16:01.687648	0101000020E610000006146517214F054051593B0A353B4840	5	16	wall	4	1	{}
228	Pot de Terre	6c+	2020-04-16 20:19:03.642973	2020-10-24 21:16:01.736107	0101000020E6100000ADBB837B634E05403ED1BDF1453B4840	6	8	wall	\N	1	{}
281	L'Évitable Bi	3a	2020-05-07 12:44:29.751089	2020-05-10 10:16:50.201793	0101000020E61000002A1C412AC52E04407D957CEC2E304840	10	14	wall	3	2	{}
289	Le Cireur	2a	2020-05-07 12:44:29.778233	2020-05-10 10:16:57.43926	0101000020E61000007FDDE9CE132F04403D0E83F92B304840	10	15	wall	4	2	{}
292	Le Réta	2b	2020-05-07 12:44:29.788733	2020-05-10 10:17:03.253351	0101000020E6100000B2BCAB1E302F0440D97C5C1B2A304840	10	16	overhang	3	2	{}
293	Le Coiné	3a	2020-05-07 12:44:29.792276	2020-05-10 10:17:12.761675	0101000020E61000000D8D2782382F0440C154336B29304840	10	17	wall	3	2	{}
301	La Rampe	2a	2020-05-07 12:44:29.831278	2020-05-10 10:17:18.757764	0101000020E6100000C2C3B46FEE2F0440A3073E062B304840	10	18	wall	4	2	{}
304	Le Vigoureux	3b	2020-05-07 12:44:29.842521	2020-05-10 10:17:24.501977	0101000020E61000000B0BEE073C300440C154336B29304840	10	19	traverse	2	2	{}
305	L'Aérien	2a+	2020-05-07 12:44:29.846057	2020-05-10 10:17:30.688146	0101000020E6100000EE7BD45FAF3004408A5A9A5B21304840	10	20	overhang	4	2	{}
306	Le Montant	2b+	2020-05-07 12:44:29.859307	2020-05-10 10:17:38.844629	0101000020E6100000921FF12BD630044094A0BFD023304840	10	21	wall	2	2	{}
307	La Glissade	2b	2020-05-07 12:44:29.872361	2020-05-10 10:17:45.854292	0101000020E6100000BA10AB3FC23004400F26C5C727304840	10	22	slab	3	2	{}
310	La Marche	2a	2020-05-07 12:44:29.883384	2020-05-10 10:18:02.262669	0101000020E61000008CD651D50431044087DBA16131304840	10	24	wall	2	2	{}
243	Les Grimpeurs se Cachent pour Médire	7a	2020-04-16 20:19:03.684865	2020-10-24 21:16:01.753231	0101000020E6100000AD6B8877664F054052F0AFFDFF3A4840	6	22	wall	5	1	{risky}
232	Jour de Pluie	7b	2020-04-16 20:19:03.653963	2020-10-27 11:58:43.155094	0101000020E6100000259A44BBAC4D054010B2C7982C3B4840	6	12	overhang	4	1	{sit_start}
222	Lune de Fiel	7a	2020-04-16 20:19:03.626411	2020-10-24 21:16:01.949605	0101000020E6100000E6FD9B66994E054099C12FE43E3B4840	6	3	traverse	\N	1	{}
227	Canonnerie	6c	2020-04-16 20:19:03.640143	2020-10-24 21:16:01.989016	0101000020E6100000320B5BFF0D4E0540F11ECF3B4E3B4840	6	7	traverse	\N	1	{}
477			2020-10-19 19:34:08.170092	2020-10-25 21:58:14.905476	0101000020E610000033D5E81DFB1C0540A914B7563C394840	13	41	other	\N	4	{}
241	36.15 Gauche	7a	2020-04-16 20:19:03.678818	2020-10-24 21:16:02.181417	0101000020E6100000FACB163A5D4F05403FFAE1200E3B4840	6	20	overhang	\N	1	{}
492	\N	\N	2020-10-19 19:34:28.299811	2020-10-25 21:58:14.909432	0101000020E61000004D06E9FF751A05408E64F49146394840	15	8	other	\N	4	{}
224	Les Câlins de Kim	7a	2020-04-16 20:19:03.631588	2020-10-24 21:16:02.39631	0101000020E6100000E0A95C2A604E05403430D5C3483B4840	6	5	overhang	\N	1	{}
208	Tristesse	4a	2020-04-16 20:19:03.585363	2020-10-24 21:16:02.483501	0101000020E61000007024CB1CD34B0540BD483213313B4840	5	36	overhang	\N	1	{}
445			2020-10-19 19:34:08.10057	2020-10-25 21:58:14.913534	0101000020E610000003CCE8F3811A0540EDCD14C948394840	13	9	other	\N	4	{}
460	\N	\N	2020-10-19 19:34:08.134265	2020-10-25 21:58:14.917187	0101000020E6100000EFDFE8B1581C0540790A758D36394840	13	24	other	\N	4	{}
449			2020-10-19 19:34:08.108094	2020-10-25 21:58:14.920637	0101000020E61000003216E9D59F1A054095157CA149394840	13	13	other	\N	4	{}
413	\N	\N	2020-10-19 19:33:22.816977	2020-10-25 21:58:14.935404	0101000020E61000005219E9DD1F1A054008668FD647394840	14	27	other	\N	4	{}
311	L'Autre Voie	3a	2020-05-07 12:44:29.887012	2020-05-10 10:18:14.16511	0101000020E61000001F2BF86D883104409946938B31304840	10	26	wall	4	2	{}
326	L'Audacieuse	3a+	2020-05-07 12:44:29.949997	2020-05-10 10:19:39.679174	0101000020E610000078D503E621330440C45E28603B304840	10	29	overhang	2	2	{}
486	\N	\N	2020-10-19 19:34:28.286907	2020-10-25 21:58:14.946689	0101000020E61000009A147AF9561A0540983227AC2B394840	15	2	other	\N	4	{}
493	\N	\N	2020-10-19 19:34:28.301558	2020-10-25 21:58:14.95062	0101000020E6100000C30EE9DF941B05403E54BABE46394840	15	9	other	\N	4	{}
327	Le Couloir	3a	2020-05-07 12:44:29.954071	2020-05-10 10:19:44.968155	0101000020E61000001C7920B24833044017B9A7AB3B304840	10	30	traverse	2	2	{}
328	La Combine	4a	2020-05-07 12:44:29.957855	2020-05-10 10:19:52.013905	0101000020E6100000C7D97404703304403BC3D4963A304840	10	31	wall	3	2	{}
329	La Trace	2a+	2020-05-07 12:44:29.961774	2020-05-10 10:19:59.552431	0101000020E610000049D576137C330440BD6DA6423C304840	10	32	other	3	2	{}
331	La Mogette	2b	2020-05-07 12:44:29.969669	2020-05-10 10:21:55.796793	0101000020E6100000EE26F8A6E9330440DBA337DC47304840	10	33	other	3	2	{}
300	L'Obstiné	2c	2020-05-07 12:44:29.827788	2020-05-10 10:24:30.94371	0101000020E61000002ECBD765F82F0440D714C8EC2C304840	10	49	wall	4	2	{}
284	Le Bustier	2b	2020-05-07 12:44:29.761396	2020-05-10 10:24:53.381764	0101000020E61000005DFB027AE12E0440E547FC8A35304840	10	52	overhang	3	2	{}
435	\N	\N	2020-10-19 19:33:22.860899	2020-10-25 21:58:14.954294	0101000020E610000063D0E807D41D054054FD150B31394840	14	49	other	\N	4	{}
514	\N	\N	2020-10-19 19:34:28.347323	2020-10-25 21:58:14.957921	0101000020E610000072D1E8E3F71D054041903BD62D394840	15	30	other	\N	4	{}
419	\N	\N	2020-10-19 19:33:22.829536	2020-10-25 21:58:14.961692	0101000020E6100000DA17E9F1361C05405C3C575D3E394840	14	33	other	\N	4	{}
461	\N	\N	2020-10-19 19:34:08.136925	2020-10-25 21:58:14.965559	0101000020E6100000C2F3E857581C054078B6A1ED38394840	13	25	other	\N	4	{}
488	\N	\N	2020-10-19 19:34:28.291808	2020-10-25 21:58:14.969387	0101000020E6100000E3FDE8AB421A05401CDB63E633394840	15	4	other	\N	4	{}
481	\N	\N	2020-10-19 19:34:08.177106	2020-10-25 21:58:14.97313	0101000020E61000007DDAE869AE1D0540B949FA5131394840	13	45	other	\N	4	{}
482	\N	\N	2020-10-19 19:34:08.179001	2020-10-25 21:58:14.97664	0101000020E610000053E9E863B41D05400B3B243A30394840	13	46	other	\N	4	{}
456	\N	\N	2020-10-19 19:34:08.126153	2020-10-25 21:58:14.980587	0101000020E61000005917E9C99A1C054008ECB1DD2D394840	13	20	other	\N	4	{}
471	\N	\N	2020-10-19 19:34:08.15826	2020-10-25 21:58:14.983961	0101000020E6100000BF06E943F21D0540609DBCDB48394840	13	35	other	\N	4	{}
507	\N	\N	2020-10-19 19:34:28.333593	2020-10-25 21:58:14.987915	0101000020E6100000E502E9F1171D05406603D8BA39394840	15	23	other	\N	4	{}
199	Le But	4a	2020-04-16 20:19:03.559041	2020-10-23 15:34:08.993747	0101000020E6100000A875D080EB4D05403E48FC41313B4840	3	26	wall	\N	1	{}
235	La Singlette	6b+	2020-04-16 20:19:03.662079	2020-10-24 21:16:01.862347	0101000020E610000052DA643C8B4F0540F203A2CC153B4840	6	15	traverse	4	1	{}
242	Fantasia chez les Ploucs	7a+	2020-04-16 20:19:03.682064	2020-10-24 21:16:02.012214	0101000020E6100000B783DE7E994F054072C5F515063B4840	6	21	overhang	4	1	{}
238	La Dénoyautée	7a+	2020-04-16 20:19:03.671096	2020-10-24 21:16:02.355496	0101000020E6100000B8DBE975034F0540B29FE023123B4840	6	18	wall	4	1	{}
334	Le Terminus	2a	2020-05-07 12:44:29.980827	2020-05-10 10:22:02.849558	0101000020E6100000CC7EDDE9CE33044072A609DB4F304840	10	34	other	4	2	{}
396	\N	\N	2020-10-19 19:33:22.782048	2020-10-25 21:58:14.552653	0101000020E61000009C07E9EF671A0540D8B63F6534394840	14	10	other	\N	4	{}
395	\N	\N	2020-10-19 19:33:22.780038	2020-10-25 21:58:14.64085	0101000020E6100000FC5AF492971A05404FC4E84F2D394840	14	9	other	\N	4	{}
338	Le Pas de Géant	2b+	2020-05-07 12:44:30.005055	2020-05-10 10:22:25.746882	0101000020E6100000FFAF3A72A43304406CE9D1544F304840	10	35	traverse	5	2	{}
341	La Rabiboche	2b	2020-05-07 12:44:30.015624	2020-05-10 10:22:32.596856	0101000020E6100000992B836A83330440CC2555DB4D304840	10	36	other	4	2	{}
352	Le Sortant	2a	2020-05-07 12:44:30.055227	2020-05-10 10:22:47.496745	0101000020E6100000AC58FCA6B0320440E76ED74B53304840	10	38	wall	3	2	{}
355	La Rotation	2a+	2020-05-07 12:44:30.073804	2020-05-10 10:23:02.459861	0101000020E6100000CE8C7E349C3204406919A9F754304840	10	39	wall	3	2	{}
347	L'Abri	2b	2020-05-07 12:44:30.03722	2020-05-10 10:23:10.456785	0101000020E6100000F06E6589CE320440126A865451304840	10	40	other	3	2	{}
348	La Cheminée	3a	2020-05-07 12:44:30.04072	2020-05-10 10:23:18.24712	0101000020E610000012DDB3AED13204407172BF4351304840	10	41	other	5	2	{}
344	La Bravoure	2c	2020-05-07 12:44:30.026746	2020-05-10 10:23:24.446733	0101000020E6100000B1C398F4F73204404ED026874F304840	10	42	wall	4	2	{}
346	L'Oblique	2a	2020-05-07 12:44:30.033726	2020-05-10 10:23:32.341456	0101000020E61000004CE3175E493204404ED026874F304840	10	43	wall	4	2	{}
333	Le Briscard	2b	2020-05-07 12:44:29.977091	2020-05-10 10:23:39.099257	0101000020E610000057975302623204405891D10149304840	10	44	wall	3	2	{}
332	Le Roi Mage	2b	2020-05-07 12:44:29.973382	2020-05-10 10:23:45.450678	0101000020E6100000EA03C93B873204400B28D4D347304840	10	45	slab	5	2	{}
239	Nut's	7b	2020-04-16 20:19:03.673611	2020-10-24 21:16:02.420922	0101000020E6100000D3463E893C4F054098C47CF40E3B4840	6	19	overhang	4	1	{}
236	Gainage et Dévers	6c	2020-04-16 20:19:03.665873	2020-10-24 21:16:02.448469	0101000020E6100000B92C915CE94E054077A3C28B193B4840	6	16	traverse	3	1	{}
140	Chanson d'Automne	4a	2020-04-16 20:19:03.387309	2020-10-24 21:16:02.593514	0101000020E61000005FB2D3364B4E05407A0E5CB3403B4840	5	23	wall	5	1	{risky}
402	\N	\N	2020-10-19 19:33:22.795314	2020-10-25 21:58:14.681791	0101000020E61000001D19E9553D1B054083950F1636394840	14	16	other	\N	4	{}
406	\N	\N	2020-10-19 19:33:22.802832	2020-10-25 21:58:14.698429	0101000020E61000001BD2E8078B1B05401643C4E03C394840	14	20	other	\N	4	{}
398	\N	\N	2020-10-19 19:33:22.786184	2020-10-25 21:58:14.722214	0101000020E61000007001E95D631A05406AEADB6642394840	14	12	other	\N	4	{}
405	\N	\N	2020-10-19 19:33:22.800643	2020-10-25 21:58:14.753866	0101000020E6100000A2DCE813061C0540E4E0163937394840	14	19	other	\N	4	{}
400	\N	\N	2020-10-19 19:33:22.791313	2020-10-25 21:58:14.77497	0101000020E6100000E8DBE8C9AB1A0540D2EC1EBE43394840	14	14	other	\N	4	{}
388	\N	\N	2020-10-19 19:33:22.75919	2020-10-25 21:58:14.778642	0101000020E6100000CF0EE96B801C0540A582C4292F394840	14	2	other	\N	4	{}
391	\N	\N	2020-10-19 19:33:22.770223	2020-10-25 21:58:14.786075	0101000020E61000006B16E9F75D1C0540CD767F6029394840	14	5	other	\N	4	{}
397	\N	\N	2020-10-19 19:33:22.784022	2020-10-25 21:58:14.818932	0101000020E61000006A0BE9B5561A0540C10B4DEF34394840	14	11	other	\N	4	{}
393	\N	\N	2020-10-19 19:33:22.775594	2020-10-25 21:58:14.851766	0101000020E610000075337AD36D1A05401BB70F0D2A394840	14	7	other	\N	4	{}
387	\N	\N	2020-10-19 19:33:22.746816	2020-10-25 21:58:14.893401	0101000020E61000008818E9AFA51C05402831927930394840	14	1	other	\N	4	{}
401	\N	\N	2020-10-19 19:33:22.793489	2020-10-25 21:58:14.924809	0101000020E610000012CAE8D10C1B0540E88220BD38394840	14	15	other	\N	4	{}
389	\N	\N	2020-10-19 19:33:22.762098	2020-10-25 21:58:14.939674	0101000020E6100000F9FFE8717A1C0540CF866A802D394840	14	3	other	\N	4	{}
442	\N	\N	2020-10-19 19:34:08.094175	2020-10-25 21:58:14.991487	0101000020E6100000E0FFE859A31A054048385BF243394840	13	6	other	\N	4	{}
404	\N	\N	2020-10-19 19:33:22.798931	2020-10-25 21:58:15.000566	0101000020E6100000E2CE5165071C05403C55ED9132394840	14	18	other	\N	4	{}
463	\N	\N	2020-10-19 19:34:08.14149	2020-10-25 21:58:15.004368	0101000020E610000043F1E8815B1C05405F6C5DC43D394840	13	27	other	\N	4	{}
394	\N	\N	2020-10-19 19:33:22.777881	2020-10-25 21:58:15.007764	0101000020E61000000B15FD50521A0540A4F8650B2E394840	14	8	other	\N	4	{}
437	\N	\N	2020-10-19 19:34:08.080002	2020-10-25 21:58:15.011938	0101000020E6100000BA09E9A7AF1A05406B149B1929394840	13	1	other	\N	4	{}
495	\N	\N	2020-10-19 19:34:28.305115	2020-10-25 21:58:15.01636	0101000020E610000057F1E8FF561B0540B285482E3F394840	15	11	other	\N	4	{}
390	\N	\N	2020-10-19 19:33:22.767736	2020-10-25 21:58:15.020072	0101000020E61000009EF8E8F96A1C054017373C7B2C394840	14	4	other	\N	4	{}
245	Chasseur de Prises	7a	2020-04-16 20:19:03.691413	2020-10-27 11:58:43.220082	0101000020E61000004967B93D01510540240AA8EC013B4840	6	24	wall	5	1	{}
57	Le Tour de Canon	2b	2020-04-16 20:19:03.13278	2020-10-27 11:58:43.318224	0101000020E6100000FB372148744F05405053CBD6FA3A4840	2	34	wall	\N	1	{}
107	Adrénaline	6a	2020-04-16 20:19:03.289388	2020-10-27 11:58:43.325201	0101000020E6100000FB6114FB574D05405AAE58EE0E3B4840	4	10	overhang	\N	1	{}
93	Le Whist	5c	2020-04-16 20:19:03.249386	2020-10-27 11:58:43.336178	0101000020E610000079CC9CB8CD4E05401A2F74061F3B4840	4	17	wall	4	1	{}
53		4a	2020-04-16 20:19:03.121574	2020-10-27 11:58:43.353192	0101000020E61000003EED493100510540A4D05D55033B4840	2	39	traverse	\N	1	{}
7	\N	2b	2020-04-16 20:19:02.988854	2020-10-27 11:58:43.372033	0101000020E61000007852D536D44D0540FAE69F9D0A3B4840	1	43	traverse	\N	1	{}
248	La Motte de Grès	2a	2020-05-07 12:44:29.61171	2020-10-15 12:57:33.8388	0101000020E6100000026553AEF02E0440B7B75B9203304840	10	1	slab	3	2	{}
230	Lévitation	7a+	2020-04-16 20:19:03.648415	2020-10-27 11:58:43.383001	0101000020E6100000EE7AE785194C054036BDCDE73B3B4840	6	10	roof	4	1	{sit_start}
68	Ninkenphoop	4b+	2020-04-16 20:19:03.168278	2020-10-27 11:58:43.400837	0101000020E61000005380C0E0D64E05404AC7770E1E3B4840	2	23	traverse	4	1	{}
5		2a+	2020-04-16 20:19:02.983516	2020-10-27 11:58:43.418447	0101000020E6100000E778AA9F954D0540017975920A3B4840	1	45	slab	5	1	{}
196	Outrage	5b+	2020-04-16 20:19:03.550693	2020-10-27 11:58:43.434048	0101000020E610000005C3D860454C0540AE1B3EB83B3B4840	4	43	wall	4	1	{}
3	\N	3a	2020-04-16 20:19:02.977993	2020-10-27 11:58:43.443377	0101000020E61000007A805683F44C0540862DF279093B4840	1	47	slab	\N	1	{}
212	Fables	4a+	2020-04-16 20:19:03.597443	2020-10-27 11:58:43.452187	0101000020E61000006CF0F282884B054072B829102E3B4840	5	40	slab	5	1	{risky}
56		3a	2020-04-16 20:19:03.130012	2020-10-27 11:58:43.472205	0101000020E6100000939DCB3614500540A90B5231FB3A4840	2	35	wall	2	1	{}
209	Les Chimères	4a	2020-04-16 20:19:03.588394	2020-10-27 11:58:43.486036	0101000020E6100000D81C6AA90C4C054043A0AC8E2D3B4840	5	37	traverse	3	1	{}
175	l'Abîme	4a	2020-04-16 20:19:03.486351	2020-10-23 15:34:09.084665	0101000020E610000062B50510795005400DC32B59383B4840	5	1	wall	4	1	{}
23	Tintin	2b	2020-04-16 20:19:03.039262	2020-10-27 11:58:43.507465	0101000020E61000005F9D8230AF4E0540AB3ED67B1F3B4840	1	27	wall	3	1	{}
25	Fun and Games	2a	2020-04-16 20:19:03.044576	2020-10-27 11:58:43.519703	0101000020E6100000252FF370614E05409DB0055A233B4840	1	25	wall	4	1	{risky}
415	\N	\N	2020-10-19 19:33:22.821635	2020-10-25 21:58:14.530457	0101000020E610000065F8E8D7AC1A054020B281F84F394840	14	29	other	\N	4	{}
30	Pseudonyme	2b	2020-04-16 20:19:03.059233	2020-10-27 11:58:43.562864	0101000020E6100000228677A3114E054087B46FD3293B4840	1	20	wall	2	1	{}
244	La Théorie du Chaos	7b	2020-04-16 20:19:03.688228	2020-10-27 11:58:43.569717	0101000020E61000009363FF9EFC4F054086A3EC3FFA3A4840	6	23	overhang	4	1	{risky}
203	Les Horloges	3b	2020-04-16 20:19:03.570915	2020-10-27 11:58:43.612887	0101000020E61000008B670C0F334C054094CB5F163C3B4840	5	33	wall	4	1	{}
106	Le Nain Jaune	5c+	2020-04-16 20:19:03.286851	2020-10-27 11:58:43.664218	0101000020E6100000480AA914764D0540CBE0BF110F3B4840	4	11	wall	\N	1	{}
451	\N	\N	2020-10-19 19:34:08.111663	2020-10-25 22:13:28.778901	0101000020E6100000A80AE979EC1A0540F39E9F3242394840	13	15	other	\N	4	{}
92	Le Bossu	6b	2020-04-16 20:19:03.246488	2020-10-27 11:58:43.668391	0101000020E610000064A588C0BD4E05408410B5D11E3B4840	4	16	overhang	4	1	{}
55	La cheminée	3b	2020-04-16 20:19:03.127257	2020-10-27 11:58:43.677569	0101000020E6100000382C419D395005405253AD63FB3A4840	2	36	traverse	\N	1	{}
211	Anthologie	4b	2020-04-16 20:19:03.594483	2020-10-27 11:58:43.688155	0101000020E610000082BC740A9C4B05401745FA882D3B4840	5	39	slab	4	1	{}
105	Le Rouge et le Noir	5b+	2020-04-16 20:19:03.28409	2020-10-27 11:58:43.691836	0101000020E610000065C4A0A0854D0540E6B982E7103B4840	4	12	wall	\N	1	{}
24		2a	2020-04-16 20:19:03.041946	2020-10-27 11:58:43.696054	0101000020E6100000477EA2994F4E0540BF81FF19213B4840	1	26	slab	4	1	{}
420	\N	\N	2020-10-19 19:33:22.831183	2020-10-25 22:13:28.936418	0101000020E610000024D7E83F701C0540316C97973D394840	14	34	other	\N	4	{}
204	Gravitation	4a	2020-04-16 20:19:03.573668	2020-10-27 11:58:43.699555	0101000020E610000093AEAD4A0D4C0540D05682C73C3B4840	5	34	overhang	3	1	{}
10	\N	2a	2020-04-16 20:19:02.997912	2020-10-27 11:58:43.708009	0101000020E61000006F5B6EDFEB4D05406421ACCE0F3B4840	1	40	slab	\N	1	{risky}
202	La Bizuth	4b	2020-04-16 20:19:03.568045	2020-10-27 11:58:43.71451	0101000020E6100000DC8AD99F7F4D05405CA9C37E2C3B4840	3	29	wall	3	1	{}
91	La Fédérale	5a+	2020-04-16 20:19:03.243833	2020-10-27 11:58:43.737957	0101000020E6100000AF473B0F624E0540C3A4D013223B4840	3	32	wall	3	1	{}
90	Le Prétoire	4c	2020-04-16 20:19:03.241177	2020-10-27 11:58:43.744603	0101000020E6100000203A33604E4E0540A49DD6F3233B4840	3	31	wall	\N	1	{}
201	La Spéciale	4a+	2020-04-16 20:19:03.564889	2020-10-27 11:58:43.750899	0101000020E610000017E38472954D05401CDFFDCD2C3B4840	3	28	wall	4	1	{}
64		3a	2020-04-16 20:19:03.157965	2020-10-27 11:58:43.761606	0101000020E6100000A5FA409BBF4D05407D66F8EF0B3B4840	2	29	slab	6	1	{}
206	Boute-en-Train	4c	2020-04-16 20:19:03.57939	2020-10-27 11:58:43.773216	0101000020E6100000474B299D444C0540EDB9A2C2343B4840	4	45	wall	\N	1	{}
58		4a	2020-04-16 20:19:03.135732	2020-10-27 11:58:43.81204	0101000020E6100000B2347CA53B4F054059115C1CFC3A4840	2	33	traverse	\N	1	{}
6		2a	2020-04-16 20:19:02.98631	2020-10-27 11:58:43.82307	0101000020E610000025BAD9DEA54D0540A2A312180C3B4840	1	44	traverse	4	1	{}
213	Boomerang	6a	2020-04-16 20:19:03.601495	2020-10-27 11:58:43.835519	0101000020E6100000B76941E6894B0540F88BBE4C2E3B4840	4	46	wall	5	1	{risky}
13	\N	2a	2020-04-16 20:19:03.012177	2020-10-27 11:58:43.851375	0101000020E61000000BA49A955D4D054041F1A8570F3B4840	1	37	wall	\N	1	{}
411			2020-10-19 19:33:22.813396	2020-10-20 08:50:11.5887	0101000020E6100000B87857C1981A05402511AF2543394840	14	25	other	\N	4	{}
178	Le Fourre-Tout	6a+	2020-04-16 20:19:03.494721	2020-10-24 21:16:01.978273	0101000020E6100000A7D5564FE54E0540A7B9196C2C3B4840	4	24	traverse	4	1	{}
98	La Golgotha (gauche)	5b+	2020-04-16 20:19:03.26406	2020-10-24 21:16:02.06784	0101000020E61000001004D510414F0540E97E00F4143B4840	3	9	wall	4	1	{}
81	\N	3c	2020-04-16 20:19:03.213609	2020-10-24 21:16:02.104126	0101000020E61000005BBB11611F5005409CA79EBE2D3B4840	2	6	traverse	\N	1	{}
162	Le Dé	5b	2020-04-16 20:19:03.447369	2020-10-24 21:16:02.195175	0101000020E6100000EB9AB1A25A4E0540D46D8C82403B4840	4	30	overhang	5	1	{risky}
192	Le Couloir	4b	2020-04-16 20:19:03.539036	2020-10-24 21:16:02.474008	0101000020E61000007F7261FF8E4E05401A7DBBF1283B4840	3	30	wall	\N	1	{}
26	\N	3a	2020-04-16 20:19:03.047543	2020-10-24 21:16:02.507881	0101000020E610000088CDB9837F4E05405A2CC537293B4840	1	24	wall	\N	1	{}
184	La Vieille	5c+	2020-04-16 20:19:03.511011	2020-10-24 21:16:02.554616	0101000020E6100000E2E56FF5CC4E05406537EB742A3B4840	4	21	wall	6	1	{risky}
465			2020-10-19 19:34:08.145539	2020-10-25 21:58:14.548173	0101000020E610000082D9E80B861C0540AB5219843F394840	13	29	other	\N	4	{}
513	\N	\N	2020-10-19 19:34:28.345664	2020-10-25 21:58:14.570394	0101000020E6100000711DE9DDA31D0540628BD9D630394840	15	29	other	\N	4	{}
524	\N	\N	2020-10-19 19:34:28.368284	2020-10-25 21:58:14.579054	0101000020E6100000FAE5E839761C0540AA05792131394840	15	40	other	\N	4	{}
446			2020-10-19 19:34:08.102599	2020-10-25 21:58:14.583448	0101000020E6100000CE03E929791A05401A9E753A4A394840	13	10	other	\N	4	{}
509	\N	\N	2020-10-19 19:34:28.338394	2020-10-25 21:58:14.587974	0101000020E6100000AF0BE963001D05402390F9F13B394840	15	25	other	\N	4	{}
479			2020-10-19 19:34:08.173717	2020-10-25 21:58:14.594209	0101000020E6100000ADF6E8D7F51C054024371F183A394840	13	43	other	\N	4	{}
510	\N	\N	2020-10-19 19:34:28.340644	2020-10-25 21:58:14.636928	0101000020E61000009120E9E5231D0540F7A610E93A394840	15	26	other	\N	4	{}
523	\N	\N	2020-10-19 19:34:28.366363	2020-10-25 21:58:14.645126	0101000020E6100000BEF8E803521C05409671BFD932394840	15	39	other	\N	4	{}
491	\N	\N	2020-10-19 19:34:28.297932	2020-10-25 21:58:14.654255	0101000020E6100000D0E9E8F1741A05402F85683846394840	15	7	other	\N	4	{}
498	\N	\N	2020-10-19 19:34:28.310516	2020-10-25 21:58:14.659466	0101000020E61000004801E9616C1C05405F6C5DC43D394840	15	14	other	\N	4	{}
500	\N	\N	2020-10-19 19:34:28.314682	2020-10-26 22:32:18.404144	0101000020E6100000E01DFA87821C05403F80D0FB3C394840	15	16	other	\N	4	{}
499	\N	\N	2020-10-19 19:34:28.31247	2020-10-26 22:32:18.467788	0101000020E61000005A3FFA417D1C0540454D85293D394840	15	15	other	\N	4	{}
505	\N	\N	2020-10-19 19:34:28.32928	2020-10-26 22:32:18.613373	0101000020E6100000AD44FA4CAE1C0540BCFE58C93A394840	15	21	other	\N	4	{}
502	\N	\N	2020-10-19 19:34:28.324075	2020-10-26 22:32:18.666002	0101000020E6100000C132FA09A61C05406A26DF2A3C394840	15	18	other	\N	4	{}
504	\N	\N	2020-10-19 19:34:28.327543	2020-10-26 22:32:18.708553	0101000020E6100000A34D7A6EB21C054017008BB23B394840	15	20	other	\N	4	{}
501	\N	\N	2020-10-19 19:34:28.322068	2020-10-26 22:32:18.716222	0101000020E6100000954C7A928E1C0540F55FCE093D394840	15	17	other	\N	4	{}
503	\N	\N	2020-10-19 19:34:28.325849	2020-10-26 22:32:18.755077	0101000020E6100000F6497AB2AA1C05406EBAF6FF3B394840	15	19	other	\N	4	{}
72	Tour d'Eiffel	3b	2020-04-16 20:19:03.188287	2020-10-24 21:16:01.727548	0101000020E6100000C1441D98164F0540BC4C9B9C2E3B4840	2	19	slab	6	1	{risky}
70	Le Bouchon	3b	2020-04-16 20:19:03.178619	2020-10-24 21:16:01.790178	0101000020E6100000C3346519004F0540972D3A0F2B3B4840	2	21	overhang	3	1	{risky}
145	Caprice	6a	2020-04-16 20:19:03.400619	2020-10-24 21:16:01.808614	0101000020E6100000E9FB889ACA4E05401D51F669433B4840	4	34	wall	4	1	{}
37	\N	3a	2020-04-16 20:19:03.077151	2020-10-24 21:16:01.815564	0101000020E6100000D714DF88A24C0540E818DD86463B4840	1	12	slab	\N	1	{}
185	Styrax	5c	2020-04-16 20:19:03.513481	2020-10-24 21:16:01.824741	0101000020E61000006B3D4F27B64E0540C5D195CE2A3B4840	4	22	wall	\N	1	{risky}
71	\N	2a	2020-04-16 20:19:03.185163	2020-10-24 21:16:01.845972	0101000020E6100000D86FE1BB1D4F05408F35A7D12D3B4840	2	20	overhang	\N	1	{}
40	Sauvetage	2a	2020-04-16 20:19:03.087615	2020-10-24 21:16:01.849983	0101000020E6100000793FFBCF354D05409292D0384D3B4840	1	9	wall	5	1	{risky}
41	Champagne Frappé	2a	2020-04-16 20:19:03.090124	2020-10-24 21:16:01.853597	0101000020E6100000204D4947874D0540062B9340483B4840	1	8	slab	4	1	{}
66	L'Arête gauche du Cervin	2c+	2020-04-16 20:19:03.163135	2020-10-24 21:16:01.878793	0101000020E61000000F10DEE0B94E054041C438A4143B4840	2	25	slab	6	1	{risky}
129	Contemplations	5b	2020-04-16 20:19:03.356315	2020-10-24 21:16:01.889803	0101000020E6100000A036F133D44C05407F5AD774453B4840	5	30	wall	3	1	{}
77	Couche-Tard	3a	2020-04-16 20:19:03.202691	2020-10-24 21:16:01.89735	0101000020E6100000BD0D95F6F24E054021D59E12353B4840	2	17	wall	4	1	{}
159	Complainte	3b	2020-04-16 20:19:03.437792	2020-10-24 21:16:01.907982	0101000020E6100000708240C8F44F054068415EF03B3B4840	5	5	slab	\N	1	{}
89	La Queue du Dromadaire	4b+	2020-04-16 20:19:03.23842	2020-10-24 21:16:01.911901	0101000020E61000008B465AD88D4F05406E786D1C1E3B4840	3	13	wall	4	1	{}
403	\N	\N	2020-10-19 19:33:22.797141	2020-10-25 21:58:15.023569	0101000020E6100000799AF49FD51A0540249C19B62E394840	14	17	other	\N	4	{}
458	\N	\N	2020-10-19 19:34:08.12968	2020-10-25 21:58:15.027741	0101000020E6100000F5D5E859651C05405DCD35E132394840	13	22	other	\N	4	{}
444			2020-10-19 19:34:08.098579	2020-10-25 21:58:15.031735	0101000020E610000003CCE8F3811A05406590F89745394840	13	8	other	\N	4	{}
32	\N	2a	2020-04-16 20:19:03.064545	2020-10-23 15:34:08.902782	0101000020E61000001711822EDD4D05409B286CE6313B4840	1	18	wall	\N	1	{risky}
399			2020-10-19 19:33:22.788514	2020-10-25 21:58:15.03552	0101000020E6100000DBEFE879921A0540676E474542394840	14	13	other	\N	4	{}
512	\N	\N	2020-10-19 19:34:28.344069	2020-10-25 21:58:15.039013	0101000020E61000007FEFE8F5B81D05409E2273BA31394840	15	28	other	\N	4	{}
447	\N	\N	2020-10-19 19:34:08.104463	2020-10-25 21:58:15.042516	0101000020E61000004017E9B1C31A054024B209D44D394840	13	11	other	\N	4	{}
408	\N	\N	2020-10-19 19:33:22.807966	2020-10-25 21:58:15.046248	0101000020E61000006AD6E8F5151B054078A1402241394840	14	22	other	\N	4	{}
519	\N	\N	2020-10-19 19:34:28.358919	2020-10-25 21:58:15.049652	0101000020E6100000CEDFE8A7711C05400A7BEC3935394840	15	35	other	\N	4	{}
61	\N	3c	2020-04-16 20:19:03.143768	2020-10-23 15:34:08.989075	0101000020E610000032CE46E4E54D0540D23E2499053B4840	2	30	slab	\N	1	{}
455	\N	\N	2020-10-19 19:34:08.124488	2020-10-25 21:58:15.053232	0101000020E6100000D507E911261C0540EFFA735F30394840	13	19	other	\N	4	{}
459	\N	\N	2020-10-19 19:34:08.131461	2020-10-25 21:58:15.057092	0101000020E6100000DAE8E82D281C0540F66FB72836394840	13	23	other	\N	4	{}
410	\N	\N	2020-10-19 19:33:22.811624	2020-10-25 21:58:15.065321	0101000020E6100000F2FBE889CD1A054019949B2C43394840	14	24	other	\N	4	{}
464	\N	\N	2020-10-19 19:34:08.143476	2020-10-25 21:58:15.071514	0101000020E610000017EBE8EF561C0540CC220F1741394840	13	28	other	\N	4	{}
429	\N	\N	2020-10-19 19:33:22.847986	2020-10-25 21:58:15.075091	0101000020E610000099F6E859FA1D0540E17A576448394840	14	43	other	\N	4	{}
487	\N	\N	2020-10-19 19:34:28.289642	2020-10-25 21:58:15.078657	0101000020E61000000D3AFA285C1A054092A6BB972D394840	15	3	other	\N	4	{}
518	\N	\N	2020-10-19 19:34:28.356619	2020-10-25 21:58:15.082127	0101000020E6100000C0D8E8CF1B1D0540F4BC6AF231394840	15	34	other	\N	4	{}
516	\N	\N	2020-10-19 19:34:28.352221	2020-10-25 21:58:15.085485	0101000020E6100000C6E5E8B1931D054065EC54A031394840	15	32	other	\N	4	{}
430	\N	\N	2020-10-19 19:33:22.849799	2020-10-25 21:58:15.089131	0101000020E6100000CE07E91F161E0540652BB67449394840	14	44	other	\N	4	{}
431	\N	\N	2020-10-19 19:33:22.851596	2020-10-25 21:58:15.092579	0101000020E6100000B8F2E815101F05407A6B7FE43C394840	14	45	other	\N	4	{}
469	\N	\N	2020-10-19 19:34:08.154921	2020-10-25 21:58:15.095878	0101000020E610000016E4E8A3EC1D0540D953643247394840	13	33	other	\N	4	{}
489			2020-10-19 19:34:28.293875	2020-10-25 21:58:15.099702	0101000020E61000008DD4E8519C1A054003468C4142394840	15	5	other	\N	4	{}
392	\N	\N	2020-10-19 19:33:22.773038	2020-10-25 21:58:15.103021	0101000020E6100000CE1AE963E41A0540DB1FA12527394840	14	6	other	\N	4	{}
470	\N	\N	2020-10-19 19:34:08.156569	2020-10-25 21:58:15.106306	0101000020E61000000E08E933E41D05407D0DD27147394840	13	34	other	\N	4	{}
452	\N	\N	2020-10-19 19:34:08.118834	2020-10-25 21:58:15.109638	0101000020E610000051FBE8574A1B0540AB5219843F394840	13	16	other	\N	4	{}
33	\N	2b	2020-04-16 20:19:03.067215	2020-10-23 15:34:09.113646	0101000020E6100000F6229FD4874D05409CA15F74353B4840	1	17	wall	\N	1	{}
427	\N	\N	2020-10-19 19:33:22.844714	2020-10-25 21:58:15.113017	0101000020E61000005E09E923D61D05404A58D6AB4B394840	14	41	other	\N	4	{}
60	Imogen	3c	2020-04-16 20:19:03.141151	2020-10-23 15:34:09.124882	0101000020E61000009CA4775F734E054045D82E1EFC3A4840	2	31	wall	5	1	{risky}
485	\N	\N	2020-10-19 19:34:28.283868	2020-10-25 21:58:15.116365	0101000020E6100000B6E56872831A05401BBD72D42A394840	15	1	other	\N	4	{}
462	\N	\N	2020-10-19 19:34:08.139444	2020-10-25 21:58:15.119823	0101000020E6100000BEF8E803521C05404BC247723D394840	13	26	other	\N	4	{}
46	\N	2c	2020-04-16 20:19:03.102135	2020-10-24 21:16:01.935583	0101000020E610000079B558EC2B4E054084E3A3E0443B4840	1	3	traverse	\N	1	{}
478			2020-10-19 19:34:08.171975	2020-10-25 21:58:15.123605	0101000020E6100000241DE93DEA1C054097817E283B394840	13	42	other	\N	4	{}
35		1c	2020-04-16 20:19:03.071902	2020-10-27 10:31:40.191738	0101000020E61000000DA3E5BD5A4D05402E6C3A52393B4840	1	15	slab	\N	1	{}
22		2b	2020-04-16 20:19:03.036242	2020-10-27 11:58:43.279957	0101000020E6100000D83FF83CD44E0540F9983000203B4840	1	28	traverse	4	1	{}
197	Échec et Mat	5c	2020-04-16 20:19:03.553306	2020-10-27 10:07:32.658444	0101000020E6100000E11F06EB284E0540EBE5EF424D3B4840	4	37	wall	3	1	{}
43	\N	2b	2020-04-16 20:19:03.09497	2020-10-23 15:34:09.177011	0101000020E610000086724201E64D05403D5229FE463B4840	1	6	wall	\N	1	{}
207	Angoisse	4b	2020-04-16 20:19:03.58209	2020-10-27 11:58:43.207972	0101000020E61000000844C6F54B4C054019A72369343B4840	5	35	wall	3	1	{}
2	\N	2c	2020-04-16 20:19:02.975036	2020-10-27 11:58:43.267433	0101000020E61000001AA322C3EB4C05409C2E4488073B4840	1	48	slab	\N	1	{risky}
94	La Norma	3b	2020-04-16 20:19:03.25223	2020-10-27 11:58:43.54627	0101000020E6100000209A61B1B24E0540D90DAA591D3B4840	3	33	wall	3	1	{}
9	\N	2b	2020-04-16 20:19:02.994807	2020-10-27 11:58:43.681784	0101000020E610000075DF2336EE4D054048517BBC0B3B4840	1	41	wall	\N	1	{}
8		3a	2020-04-16 20:19:02.99152	2020-10-27 11:58:43.806095	0101000020E610000037FA8A09004E0540A759B4AB0B3B4840	1	42	slab	4	1	{risky}
111	Presse Citron	6a	2020-04-16 20:19:03.301355	2020-10-27 11:58:43.872295	0101000020E61000007E9B748DA54D0540C28D65450B3B4840	4	8	wall	4	1	{}
155	Cadavre Exquis	4c	2020-04-16 20:19:03.426854	2020-10-23 15:34:09.264782	0101000020E61000005184C6E7E44E054069356A9E383B4840	5	18	slab	4	1	{}
153	Prose	4c	2020-04-16 20:19:03.421549	2020-10-23 15:34:09.279209	0101000020E610000035254B819B4E05402FF81303393B4840	5	21	wall	4	1	{}
165	Sonnets Posthumes	4c	2020-04-16 20:19:03.45845	2020-10-23 15:34:09.28285	0101000020E610000018EF7597004F05400CD333852F3B4840	5	11	wall	\N	1	{}
217	Élégie	3c	2020-04-16 20:19:03.613172	2020-10-23 15:34:09.306469	0101000020E6100000289AB559314F054075D18DAE333B4840	5	14	wall	4	1	{}
42	\N	2a	2020-04-16 20:19:03.092604	2020-10-23 15:34:09.381308	0101000020E61000006404F4DBE24D05402D9DED3C483B4840	1	7	traverse	\N	1	{}
34	\N	2c	2020-04-16 20:19:03.069571	2020-10-23 15:34:09.4242	0101000020E61000007FDBD869944D0540573E9FC3383B4840	1	16	traverse	\N	1	{}
187	L'eunnuque	4a	2020-04-16 20:19:03.523176	2020-10-23 15:34:09.428609	0101000020E61000007D219266684F0540A1E3DA17313B4840	3	22	wall	\N	1	{}
226	Morphotype	6c+	2020-04-16 20:19:03.636799	2020-10-27 11:43:34.514539	0101000020E61000009697D3A4B24E0540E0BD98D04F3B4840	6	6	overhang	4	1	{sit_start,risky}
4		2a	2020-04-16 20:19:02.980786	2020-10-27 11:58:43.529811	0101000020E6100000E95FEAFE8A4D0540FE4F4615093B4840	1	46	traverse	2	1	{risky}
12	\N	3a	2020-04-16 20:19:03.009542	2020-10-27 11:58:43.723417	0101000020E610000059631A22824D054068C19E25103B4840	1	38	traverse	\N	1	{}
62		3c+	2020-04-16 20:19:03.146353	2020-10-27 11:58:43.8604	0101000020E6100000A005B406184E0540FB13C4D80C3B4840	2	28	wall	3	1	{}
38	\N	2c	2020-04-16 20:19:03.082451	2020-10-23 15:34:09.471936	0101000020E61000004417DBBAD04C0540EC2E59FE4A3B4840	1	11	wall	\N	1	{}
103	Le Jeu de Go	5a+	2020-04-16 20:19:03.278128	2020-10-23 15:34:09.620801	0101000020E6100000C580D16DB04E054045340519133B4840	3	39	wall	4	1	{}
44	\N	3a	2020-04-16 20:19:03.097409	2020-10-23 15:34:09.641833	0101000020E6100000C4CB735D034E05400DCE8C06473B4840	1	5	slab	\N	1	{}
100	Le French Cancan	4c	2020-04-16 20:19:03.269684	2020-10-27 11:01:26.680525	0101000020E61000004641EAA5DE4E0540ACF7AD74143B4840	3	36	wall	4	1	{}
29		2c	2020-04-16 20:19:03.056197	2020-10-27 11:58:43.163095	0101000020E6100000154F6F29274E054047299C10293B4840	1	21	traverse	\N	1	{}
205	Le Tarot	5c	2020-04-16 20:19:03.576541	2020-10-27 11:58:43.23549	0101000020E61000007DA1E5A30D4C05407E6F774C3C3B4840	4	44	overhang	4	1	{}
73		2b+	2020-04-16 20:19:03.191173	2020-10-27 11:58:43.575988	0101000020E6100000D5EB76DD504E054032ABE7C33B3B4840	2	14	wall	\N	1	{}
151	L'Amour du Mensonge	4c	2020-04-16 20:19:03.416527	2020-10-24 21:16:02.536423	0101000020E6100000ABD38606B54E05402E929F64383B4840	5	20	wall	4	1	{}
99	Le Serpent	4c	2020-04-16 20:19:03.266975	2020-10-24 21:16:02.543862	0101000020E6100000B9000FA8194F0540E6860DF4133B4840	3	37	traverse	3	1	{}
15	\N	2a	2020-04-16 20:19:03.017287	2020-10-24 21:16:02.547236	0101000020E61000005DEE96D0C84E054029B45C7A113B4840	1	35	traverse	\N	1	{risky}
218	Le Surplomb du Bengale	5c	2020-04-16 20:19:03.61576	2020-10-24 21:16:02.572904	0101000020E61000005C12028F274F054010379692333B4840	3	25	overhang	4	1	{}
158	Ballade	4a+	2020-04-16 20:19:03.434597	2020-10-24 21:16:02.576613	0101000020E6100000D0370B51DE4F05405EBFFCE73B3B4840	5	6	wall	4	1	{}
168	Strophe	4a	2020-04-16 20:19:03.466775	2020-10-24 21:16:02.590095	0101000020E61000002A3C212C184F054094EA2EC1303B4840	5	12	wall	\N	1	{}
195	Le Tabac	3a	2020-04-16 20:19:03.547996	2020-10-24 21:16:02.597061	0101000020E6100000A1E82AC98F500540D1BAD9CF363B4840	2	1	wall	5	1	{risky}
141	Bateau Ivre	4b+	2020-04-16 20:19:03.390152	2020-10-24 21:16:02.606594	0101000020E610000097D29220594E054077706CE7413B4840	5	24	wall	5	1	{risky}
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.schema_migrations (version) FROM stdin;
20200416080911
20200416122424
20200416193749
20200416195009
20200416195506
20200416200511
20200416201305
20200418095046
20200418194159
20200418210357
20200419083233
20200419083551
20200419083712
20200428120744
20200428150852
20200507130052
20200509193959
20200704211106
20200705193814
20201019194907
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: topos; Type: TABLE DATA; Schema: public; Owner: nicolas
--

COPY public.topos (id, line, problem_id, created_at, updated_at, published, metadata) FROM stdin;
453	[{"x":0.5825,"y":0.8617},{"x":0.6162,"y":0.5883},{"x":0.6288,"y":0.3017},{"x":0.6338,"y":0.1567}]	19	2020-09-03 20:45:15.022446	2020-10-22 17:00:32.385972	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1106438711283575","GPSTimeStamp":"2020-09-01T15:38:53Z","GPSImgDirection":"344.81916816999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635049999999998","GPSLatitude":"48.461753329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"15.999419279907086","DateCreated":"2020-09-01T17:38:52+02:00"}}}}
447	[{"x":0.5025,"y":0.81},{"x":0.5088,"y":0.4483},{"x":0.5062,"y":0.2583},{"x":0.5038,"y":0.1717}]	202	2020-09-03 20:45:14.008603	2020-10-22 16:19:39.337304	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.048246923828372153","GPSTimeStamp":"2020-09-01T14:10:26Z","GPSImgDirection":"204.28925318999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628450000000004","GPSLatitude":"48.462219999999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94","GPSHPositioningError":"15.634881682734443","DateCreated":"2020-09-01T16:10:26+02:00"}}}}
530	[{"x":0.6225,"y":0.555},{"x":0.5375,"y":0.545},{"x":0.4425,"y":0.4783},{"x":0.3812,"y":0.3467},{"x":0.3475,"y":0.225}]	22	2020-10-27 10:54:08.193069	2020-10-27 10:54:35.437526	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.023560855553126522","GPSTimeStamp":"2020-10-26T14:29:22Z","GPSImgDirection":"86.058380110000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634716700000003","GPSLatitude":"48.461913330000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"4.5615548834726916","DateCreated":"2020-10-26T15:29:21+01:00"}}}}
534	[{"x":0.5537,"y":0.9183},{"x":0.5125,"y":0.625},{"x":0.51,"y":0.3667},{"x":0.525,"y":0.1467}]	96	2020-10-27 10:58:37.081096	2020-10-27 10:58:57.731748	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014541610149206097","GPSTimeStamp":"2020-10-26T14:36:04Z","GPSImgDirection":"60.27166751","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634466699999999","GPSLatitude":"48.461669999999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.5","GPSHPositioningError":"5.2284529240978843","DateCreated":"2020-10-26T15:36:03+01:00"}}}}
538	[{"x":0.655,"y":0.8717},{"x":0.7013,"y":0.675},{"x":0.6787,"y":0.4633},{"x":0.5825,"y":0.305},{"x":0.5475,"y":0.1667}]	101	2020-10-27 11:04:40.666466	2020-10-27 11:05:10.051281	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.032271042460856603","GPSTimeStamp":"2020-10-26T14:39:26Z","GPSImgDirection":"244.66557309999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633216700000002","GPSLatitude":"48.461538329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"5.0136577225418293","DateCreated":"2020-10-26T15:39:26+01:00"}}}}
449	[{"x":0.17,"y":0.7183},{"x":0.2037,"y":0.6117},{"x":0.3375,"y":0.4783},{"x":0.4537,"y":0.4883},{"x":0.5687,"y":0.4767},{"x":0.6462,"y":0.4517},{"x":0.7662,"y":0.4633},{"x":0.825,"y":0.4617}]	236	2020-09-03 20:45:14.290367	2020-09-03 21:53:26.497233	t	\N
270	[{"x":0.5413,"y":0.8017},{"x":0.5375,"y":0.5083},{"x":0.5637,"y":0.3167},{"x":0.5425,"y":0.145}]	162	2020-09-03 20:43:09.53689	2020-09-04 19:56:07.109039	f	\N
91	[{"x":0.1195,"y":0.7212},{"x":0.0998,"y":0.5206},{"x":0.1107,"y":0.3257},{"x":0.1612,"y":0.2155}]	138	2020-04-18 20:36:58.806167	2020-07-05 19:48:04.184823	f	\N
113	[{"x":0.2393,"y":0.8684},{"x":0.25,"y":0.466},{"x":0.2796,"y":0.2862},{"x":0.3405,"y":0.1393}]	136	2020-04-18 20:36:59.740272	2020-07-05 19:48:04.188926	f	\N
56	[{"x":0.4161,"y":0.9156},{"x":0.4449,"y":0.682},{"x":0.5107,"y":0.3202},{"x":0.5781,"y":0.0658},{"x":0.5995,"y":0.0066}]	211	2020-04-18 20:36:57.358564	2020-07-05 19:48:04.244806	f	\N
27	[{"x":0.176,"y":0.739},{"x":0.1801,"y":0.4605},{"x":0.19,"y":0.318},{"x":0.2525,"y":0.0691}]	216	2020-04-18 20:36:56.219626	2020-07-05 19:48:04.255106	f	\N
6	[{"x":0.4178,"y":0.9134},{"x":0.3906,"y":0.7149},{"x":0.3577,"y":0.5219},{"x":0.3923,"y":0.3443}]	176	2020-04-18 20:36:55.470758	2020-04-21 13:38:05.098216	f	\N
457	[{"x":0.5313,"y":0.8117},{"x":0.5212,"y":0.3883},{"x":0.5238,"y":0.18}]	38	2020-09-03 20:45:15.514203	2020-10-22 08:21:43.134948	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.081233024563234627","GPSTimeStamp":"2020-09-01T13:02:46Z","GPSImgDirection":"225.5456847800001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6624783299999999","GPSLatitude":"48.463254999999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.099999999999994","GPSHPositioningError":"7.0482875004794234","DateCreated":"2020-09-01T15:02:45+02:00"}}}}
319	[{"x":0.5537,"y":0.8767},{"x":0.5125,"y":0.4633},{"x":0.5375,"y":0.185},{"x":0.5387,"y":0.105}]	32	2020-09-03 20:43:16.399836	2020-10-22 16:01:38.239353	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011819472535612744","GPSTimeStamp":"2020-09-01T13:17:58Z","GPSImgDirection":"168.12536614000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630283300000004","GPSLatitude":"48.462486669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"4.5180760833053411","DateCreated":"2020-09-01T15:17:58+02:00"}}}}
367	[{"x":0.4675,"y":0.855},{"x":0.4562,"y":0.4117},{"x":0.45,"y":0.08}]	98	2020-09-03 20:43:23.511853	2020-10-22 16:56:04.3342	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.064254559638774952","GPSTimeStamp":"2020-09-01T15:30:13Z","GPSImgDirection":"167.03183736","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637033299999997","GPSLatitude":"48.461599999999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.099999999999994","GPSHPositioningError":"12.107642659881465","DateCreated":"2020-09-01T17:30:13+02:00"}}}}
357	[{"x":0.4612,"y":0.865},{"x":0.4437,"y":0.37},{"x":0.43,"y":0.14}]	93	2020-09-03 20:43:22.085541	2020-10-22 16:23:49.087303	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.040701046591008247","GPSTimeStamp":"2020-09-01T14:21:53Z","GPSImgDirection":"203.73458103000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.461871670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"9.1684611933602511","DateCreated":"2020-09-01T16:21:53+02:00"}}}}
407	[{"x":0.5225,"y":0.7783},{"x":0.535,"y":0.6083},{"x":0.585,"y":0.39},{"x":0.615,"y":0.2417}]	134	2020-09-03 20:43:29.191382	2020-10-22 08:19:35.543234	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.013611908072682895","GPSTimeStamp":"2020-09-01T12:50:46Z","GPSImgDirection":"0.55075072999999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632299999999995","GPSLatitude":"48.463203329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"8.1844470827679778","DateCreated":"2020-09-01T14:50:45+02:00"}}}}
350	[{"x":0.5125,"y":0.8183},{"x":0.5012,"y":0.55},{"x":0.5437,"y":0.2883},{"x":0.5563,"y":0.1233}]	78	2020-09-03 20:43:21.193527	2020-10-22 17:15:16.004178	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0051283696704260461","GPSTimeStamp":"2020-09-01T16:14:25Z","GPSImgDirection":"21.453704850000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635283300000006","GPSLatitude":"48.462396669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.799999999999997","GPSHPositioningError":"8.5835013748854259","DateCreated":"2020-09-01T18:14:25+02:00"}}}}
396	[{"x":0.5012,"y":0.82},{"x":0.4913,"y":0.43},{"x":0.505,"y":0.21}]	9	2020-09-03 20:43:27.823918	2020-10-22 16:44:22.273674	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.47145718333251924","GPSTimeStamp":"2020-09-01T14:55:10Z","GPSImgDirection":"132.78739165000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66310833","GPSLatitude":"48.461291670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.5","GPSHPositioningError":"16.282317006654303","DateCreated":"2020-09-01T16:55:10+02:00"}}}}
172	[{"x":0.5765,"y":0.9671},{"x":0.5518,"y":0.5614},{"x":0.5411,"y":0.3662},{"x":0.5115,"y":0.1173}]	155	2020-04-18 20:37:02.015801	2020-07-05 19:48:04.192297	f	\N
29	[{"x":0.5995,"y":0.9759},{"x":0.6012,"y":0.6272},{"x":0.6127,"y":0.477},{"x":0.5913,"y":0.3235},{"x":0.5313,"y":0.1798},{"x":0.5148,"y":0.0713}]	160	2020-04-18 20:36:56.293222	2020-07-05 19:48:04.203956	f	\N
185	[{"x":0.4827,"y":0.9145},{"x":0.4803,"y":0.5987},{"x":0.472,"y":0.398},{"x":0.4926,"y":0.2292},{"x":0.4712,"y":0.0932}]	151	2020-04-18 20:37:02.527586	2020-07-05 19:48:04.220702	f	\N
30	[{"x":0.4688,"y":0.852},{"x":0.449,"y":0.6042},{"x":0.4276,"y":0.4627},{"x":0.4482,"y":0.307},{"x":0.4877,"y":0.1974}]	174	2020-04-18 20:36:56.329741	2020-07-05 19:48:04.229037	f	\N
14	[{"x":0.5132,"y":0.8002},{"x":0.5164,"y":0.5173},{"x":0.511,"y":0.3676},{"x":0.5318,"y":0.2492},{"x":0.5603,"y":0.1678}]	177	2020-04-18 20:36:55.767721	2020-07-05 19:48:04.233744	f	\N
39	[{"x":0.3273,"y":0.8618},{"x":0.3495,"y":0.5987},{"x":0.3808,"y":0.4539},{"x":0.4161,"y":0.3443},{"x":0.4465,"y":0.1842}]	164	2020-04-18 20:36:56.676968	2020-07-05 19:48:04.235546	f	\N
38	[{"x":0.5502,"y":0.9594},{"x":0.5789,"y":0.6469},{"x":0.6094,"y":0.4693},{"x":0.5099,"y":0.1458}]	170	2020-04-18 20:36:56.636095	2020-07-05 19:48:04.240379	f	\N
42	[{"x":0.7344,"y":0.9145},{"x":0.6801,"y":0.6173},{"x":0.6398,"y":0.3893},{"x":0.5773,"y":0.1721}]	212	2020-04-18 20:36:56.812715	2020-07-05 19:48:04.241943	f	\N
148	[{"x":0.5699,"y":0.9452},{"x":0.5592,"y":0.5154},{"x":0.514,"y":0.33},{"x":0.4696,"y":0.1371},{"x":0.4786,"y":0.1294}]	208	2020-04-18 20:37:01.06601	2020-07-05 19:48:04.251173	f	\N
26	[{"x":0.3692,"y":0.7664},{"x":0.3495,"y":0.5395},{"x":0.315,"y":0.2851},{"x":0.3092,"y":0.1612},{"x":0.3224,"y":0.0998}]	217	2020-04-18 20:36:56.179514	2020-07-05 19:48:04.253773	f	\N
12	[{"x":0.5214,"y":0.8575},{"x":0.5016,"y":0.523},{"x":0.4984,"y":0.42},{"x":0.4934,"y":0.2752},{"x":0.514,"y":0.1765}]	215	2020-04-18 20:36:55.708032	2020-07-05 19:48:04.256694	f	\N
9	[{"x":0.2048,"y":0.9364},{"x":0.2122,"y":0.557},{"x":0.1719,"y":0.3849},{"x":0.1102,"y":0.2237},{"x":0.1209,"y":0.1173},{"x":0.1176,"y":0.0691},{"x":0.0921,"y":0.0307}]	214	2020-04-18 20:36:55.602905	2020-07-05 19:48:04.25843	f	\N
141	[{"x":0.5748,"y":0.9145},{"x":0.5485,"y":0.4726},{"x":0.5617,"y":0.2719},{"x":0.5304,"y":0.0548}]	143	2020-04-18 20:37:00.793299	2020-04-21 14:18:18.074817	f	\N
437	[{"x":0.5375,"y":0.8433},{"x":0.5337,"y":0.5133},{"x":0.5513,"y":0.2217},{"x":0.5587,"y":0.1083}]	188	2020-09-03 20:43:33.740351	2020-10-22 17:21:07.425274	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.075148299400840612","GPSTimeStamp":"2020-09-01T16:20:50Z","GPSImgDirection":"122.81607439000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663675","GPSLatitude":"48.462478329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"11.955097742736797","DateCreated":"2020-09-01T18:20:50+02:00"}}}}
421	[{"x":0.4825,"y":0.8017},{"x":0.4738,"y":0.485},{"x":0.49,"y":0.1683}]	67	2020-09-03 20:43:31.40184	2020-10-22 16:25:44.645413	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.32741749290638589","GPSTimeStamp":"2020-09-01T14:26:24Z","GPSImgDirection":"169.87709030000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635","GPSLatitude":"48.461741670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"4.5322950068712782","DateCreated":"2020-09-01T16:26:23+02:00"}}}}
551	[{"x":0.575,"y":0.7833},{"x":0.5938,"y":0.5583},{"x":0.5887,"y":0.3233},{"x":0.5587,"y":0.185},{"x":0.5025,"y":0.1017}]	62	2020-10-27 11:21:07.537918	2020-10-27 11:21:25.780679	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0034048715595557844","GPSTimeStamp":"2020-10-26T15:08:32Z","GPSImgDirection":"206.57512661999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631283300000002","GPSLatitude":"48.461319999999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"4.9797656400076837","DateCreated":"2020-10-26T16:08:31+01:00"}}}}
362	[{"x":0.4,"y":0.8217},{"x":0.41,"y":0.495},{"x":0.45,"y":0.2333},{"x":0.4662,"y":0.1367}]	65	2020-09-03 20:43:22.818346	2020-10-22 16:37:16.698758	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0030703884553975732","GPSTimeStamp":"2020-09-01T14:40:09Z","GPSImgDirection":"249.41641233999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632216699999995","GPSLatitude":"48.461546670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"10.639886420577918","DateCreated":"2020-09-01T16:40:09+02:00"}}}}
461	[{"x":0.415,"y":0.83},{"x":0.4375,"y":0.52},{"x":0.43,"y":0.1667}]	140	2020-09-03 20:47:10.675226	2020-10-22 08:09:05.188672	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.089978896077440806","GPSTimeStamp":"2020-09-01T11:26:59Z","GPSImgDirection":"298.95533769000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632366699999999","GPSLatitude":"48.462928329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.700000000000003","GPSHPositioningError":"4.3346900438321851","DateCreated":"2020-09-01T13:26:59+02:00"}}}}
426	[{"x":0.415,"y":0.8017},{"x":0.4425,"y":0.555},{"x":0.4637,"y":0.1633}]	59	2020-09-03 20:43:32.149391	2020-10-22 16:46:31.96468	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.052131209523100755","GPSTimeStamp":"2020-09-01T15:00:19Z","GPSImgDirection":"95.828354430000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633416700000003","GPSLatitude":"48.460913329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"102.2","GPSHPositioningError":"10.163006436955699","DateCreated":"2020-09-01T17:00:19+02:00"}}}}
414	[{"x":0.2475,"y":0.7783},{"x":0.3088,"y":0.4483},{"x":0.4188,"y":0.1967}]	135	2020-09-03 20:43:30.083597	2020-10-22 08:20:01.955218	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.03877437116285487","GPSTimeStamp":"2020-09-01T12:51:38Z","GPSImgDirection":"355.27539062000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663195","GPSLatitude":"48.463203329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.400000000000006","GPSHPositioningError":"5.4944794081925581","DateCreated":"2020-09-01T14:51:37+02:00"}}}}
71	[{"x":0.4309,"y":0.8893},{"x":0.4178,"y":0.5011},{"x":0.4112,"y":0.2654},{"x":0.4317,"y":0.068}]	129	2020-04-18 20:36:57.994555	2020-07-05 19:48:04.190697	f	\N
92	[{"x":0.591,"y":0.8783},{"x":0.5691,"y":0.5584},{"x":0.5592,"y":0.3799},{"x":0.534,"y":0.1209}]	139	2020-04-18 20:36:58.84357	2020-07-05 19:48:04.224448	f	\N
55	[{"x":0.19,"y":0.7489},{"x":0.1982,"y":0.5746},{"x":0.2023,"y":0.4232},{"x":0.2007,"y":0.2906},{"x":0.2155,"y":0.2193}]	173	2020-04-18 20:36:57.324444	2020-07-05 19:48:04.22753	f	\N
46	[{"x":0.6316,"y":0.8739},{"x":0.5888,"y":0.5768},{"x":0.5502,"y":0.4474},{"x":0.5502,"y":0.2895},{"x":0.5419,"y":0.0976}]	165	2020-04-18 20:36:56.963857	2020-07-05 19:48:04.237147	f	\N
61	[{"x":0.7196,"y":0.9485},{"x":0.7007,"y":0.58},{"x":0.6785,"y":0.2774},{"x":0.662,"y":0.1217}]	210	2020-04-18 20:36:57.55429	2020-07-05 19:48:04.252467	f	\N
47	[{"x":0.3158,"y":0.7807},{"x":0.3026,"y":0.4178},{"x":0.287,"y":0.2807},{"x":0.2993,"y":0.2083},{"x":0.3174,"y":0.1513}]	171	2020-04-18 20:36:57.006742	2020-04-21 13:46:56.983921	f	\N
268	[{"x":0.5288,"y":0.8833},{"x":0.5012,"y":0.3583},{"x":0.5138,"y":0.0667}]	119	2020-09-03 20:43:09.212717	2020-10-22 16:51:38.539376	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.039257347598406461","GPSTimeStamp":"2020-09-01T15:16:34Z","GPSImgDirection":"101.69729515000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635916700000002","GPSLatitude":"48.46125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"15.882587631803933","DateCreated":"2020-09-01T17:16:33+02:00"}}}}
351	[{"x":0.4662,"y":0.8433},{"x":0.4487,"y":0.425},{"x":0.4525,"y":0.165}]	117	2020-09-03 20:43:21.278169	2020-10-22 16:54:41.194387	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10725206132304253","GPSTimeStamp":"2020-09-01T15:26:56Z","GPSImgDirection":"279.62318419999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637949999999999","GPSLatitude":"48.461288329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"8.8690248855748539","DateCreated":"2020-09-01T17:26:55+02:00"}}}}
388	[{"x":0.5212,"y":0.79},{"x":0.5238,"y":0.3683},{"x":0.5025,"y":0.1983}]	95	2020-09-03 20:43:26.400934	2020-10-22 16:59:28.990029	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.98122650375939857","GPSTimeStamp":"2020-09-01T15:38:13Z","GPSImgDirection":"39.285827600000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635533300000001","GPSLatitude":"48.461761670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.299999999999997","GPSHPositioningError":"4.4926495810261189","DateCreated":"2020-09-01T17:38:12+02:00"}}}}
344	[{"x":0.5637,"y":0.8433},{"x":0.5513,"y":0.46},{"x":0.5225,"y":0.2367},{"x":0.5075,"y":0.15}]	164	2020-09-03 20:43:20.31303	2020-10-22 17:14:04.996761	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.070793956540058989","GPSTimeStamp":"2020-09-01T16:11:08Z","GPSImgDirection":"163.96342477000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636116700000003","GPSLatitude":"48.462336669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"12.089865158764681","DateCreated":"2020-09-01T18:11:08+02:00"}}}}
398	[{"x":0.5012,"y":0.8467},{"x":0.4838,"y":0.515},{"x":0.4725,"y":0.285},{"x":0.4487,"y":0.1283}]	187	2020-09-03 20:43:28.045965	2020-10-22 17:16:31.441823	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.071196593343544876","GPSTimeStamp":"2020-09-01T16:18:36Z","GPSImgDirection":"22.909759509999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637216700000002","GPSLatitude":"48.462411670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"5.227365200266914","DateCreated":"2020-09-01T18:18:35+02:00"}}}}
558	[{"x":0.2925,"y":0.8133},{"x":0.305,"y":0.5517},{"x":0.4725,"y":0.42},{"x":0.6275,"y":0.3583},{"x":0.6825,"y":0.28}]	58	2020-10-27 11:28:48.421443	2020-10-27 11:29:20.421882	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.016132956366351502","GPSTimeStamp":"2020-10-26T16:37:25Z","GPSImgDirection":"47.28082276","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637116700000001","GPSLatitude":"48.460828329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.8","GPSHPositioningError":"9.4000697999069338","DateCreated":"2020-10-26T17:37:24+01:00"}}}}
338	[{"x":0.695,"y":0.76},{"x":0.7125,"y":0.5367},{"x":0.7538,"y":0.3833},{"x":0.7562,"y":0.275},{"x":0.7375,"y":0.2233}]	183	2020-09-03 20:43:19.370627	2020-09-03 22:16:09.183772	t	\N
166	[{"x":0.3109,"y":0.9452},{"x":0.3224,"y":0.5735},{"x":0.315,"y":0.4024},{"x":0.3454,"y":0.2204},{"x":0.3717,"y":0.0658},{"x":0.3783,"y":0.0296}]	140	2020-04-18 20:37:01.758745	2020-07-05 19:48:04.209448	f	\N
171	[{"x":0.5658,"y":0.9748},{"x":0.5592,"y":0.6184},{"x":0.5674,"y":0.466},{"x":0.5609,"y":0.2566},{"x":0.5362,"y":0.1349},{"x":0.5197,"y":0.0307}]	141	2020-04-18 20:37:01.957603	2020-07-05 19:48:04.211608	f	\N
142	[{"x":0.4408,"y":0.9287},{"x":0.4104,"y":0.5658},{"x":0.3717,"y":0.3542},{"x":0.3808,"y":0.0746}]	157	2020-04-18 20:37:00.833463	2020-07-05 19:48:04.214745	f	\N
150	[{"x":0.3487,"y":0.9334},{"x":0.3618,"y":0.6299},{"x":0.4923,"y":0.5526},{"x":0.4989,"y":0.384},{"x":0.4912,"y":0.1998},{"x":0.4112,"y":0.1168}]	142	2020-04-18 20:37:01.136938	2020-07-05 19:48:04.226055	f	\N
44	[{"x":0.2673,"y":0.8827},{"x":0.2788,"y":0.5384},{"x":0.389,"y":0.1184},{"x":0.4202,"y":0.0691}]	207	2020-04-18 20:36:56.891662	2020-07-05 19:48:04.249711	f	\N
23	[{"x":0.2622,"y":0.7071},{"x":0.2252,"y":0.4478},{"x":0.2477,"y":0.2989},{"x":0.2667,"y":0.1765}]	175	2020-04-18 20:36:56.077299	2020-07-05 19:48:04.259785	f	\N
127	[{"x":0.5814,"y":0.9496},{"x":0.5773,"y":0.6886},{"x":0.5921,"y":0.398},{"x":0.6283,"y":0.1107}]	119	2020-04-18 20:37:00.277291	2020-04-21 14:16:00.190411	f	\N
133	[{"x":0.3454,"y":0.773},{"x":0.3183,"y":0.568},{"x":0.2919,"y":0.4364},{"x":0.3117,"y":0.2906},{"x":0.3561,"y":0.1952}]	19	2020-04-18 20:37:00.508484	2020-04-21 14:17:01.895109	f	\N
424	[{"x":0.5363,"y":0.8567},{"x":0.5062,"y":0.5417},{"x":0.5513,"y":0.2167}]	13	2020-09-03 20:43:31.788177	2020-10-22 16:40:51.721532	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.47936356023447785","GPSTimeStamp":"2020-09-01T14:45:45Z","GPSImgDirection":"166.09360518999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628216700000005","GPSLatitude":"48.461466670000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"5.0614008717871632","DateCreated":"2020-09-01T16:45:45+02:00"}}}}
365	[{"x":0.595,"y":0.83},{"x":0.5825,"y":0.56},{"x":0.545,"y":0.365},{"x":0.47,"y":0.235},{"x":0.4512,"y":0.21}]	170	2020-09-03 20:43:23.236699	2020-10-22 17:20:45.345724	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.089205585404735194","GPSTimeStamp":"2020-09-01T16:20:19Z","GPSImgDirection":"185.87664042","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637383300000002","GPSLatitude":"48.462483329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"6.8641019626241304","DateCreated":"2020-09-01T18:20:18+02:00"}}}}
301	[{"x":0.54,"y":0.8567},{"x":0.5225,"y":0.4867},{"x":0.52,"y":0.2633},{"x":0.5012,"y":0.1733}]	151	2020-09-03 20:43:13.81249	2020-10-22 17:27:23.020188	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.4483537677366029","GPSTimeStamp":"2020-09-01T16:29:12Z","GPSImgDirection":"267.02354437999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634199999999999","GPSLatitude":"48.462638329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"4.5039608003266638","DateCreated":"2020-09-01T18:29:11+02:00"}}}}
346	[{"x":0.4487,"y":0.7717},{"x":0.4813,"y":0.5317},{"x":0.5088,"y":0.3217},{"x":0.5288,"y":0.195}]	83	2020-09-03 20:43:20.568496	2020-10-22 17:31:24.221237	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21388991171742394","GPSTimeStamp":"2020-09-01T16:50:22Z","GPSImgDirection":"318.30641184000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641549999999996","GPSLatitude":"48.462566670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.5","GPSHPositioningError":"4.2141081955843251","DateCreated":"2020-09-01T18:50:22+02:00"}}}}
494	[{"x":0.3787,"y":0.8467},{"x":0.3588,"y":0.4217},{"x":0.405,"y":0.1433}]	490	2020-10-19 21:46:13.361869	2020-10-19 21:46:35.436222	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02714896761450029","GPSTimeStamp":"2020-10-18T14:53:19Z","GPSImgDirection":"331.02767920999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379866700000001","GPSLatitude":"48.447361669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"16.497946963216425","DateCreated":"2020-10-18T16:53:19+02:00"}}}}
489	[{"x":0.5038,"y":0.7383},{"x":0.5112,"y":0.4967},{"x":0.56,"y":0.2267}]	445	2020-10-19 21:41:02.623598	2020-10-19 21:41:32.158154	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.043835189227862267","GPSTimeStamp":"2020-10-18T14:44:27Z","GPSImgDirection":"29.816284179999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379450000000002","GPSLatitude":"48.447483329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.099999999999994","GPSHPositioningError":"11.715366573352501","DateCreated":"2020-10-18T16:44:27+02:00"}}}}
485	[{"x":0.25,"y":0.685},{"x":0.2725,"y":0.3567},{"x":0.265,"y":0.185}]	416	2020-10-19 19:41:22.707557	2020-10-19 20:17:19.774829	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0086412159714206269","GPSTimeStamp":"2020-10-18T14:31:35Z","GPSImgDirection":"116.50459290000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6380299999999997","GPSLatitude":"48.447741670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"5.9820785597381345","DateCreated":"2020-10-18T16:31:34+02:00"}}}}
487	[{"x":0.48,"y":0.8533},{"x":0.4813,"y":0.375},{"x":0.48,"y":0.0867}]	446	2020-10-19 21:39:07.392707	2020-10-19 21:39:30.451457	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31236854193361224","GPSTimeStamp":"2020-10-18T14:40:17Z","GPSImgDirection":"94.198529719999982","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6378699999999999","GPSLatitude":"48.447525000000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.900000000000006","GPSHPositioningError":"16.189856065798491","DateCreated":"2020-10-18T16:40:17+02:00"}}}}
493	[{"x":0.4363,"y":0.835},{"x":0.4225,"y":0.5217},{"x":0.4238,"y":0.2483}]	440	2020-10-19 21:45:00.842042	2020-10-19 21:45:18.28731	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16031032803576961","GPSTimeStamp":"2020-10-18T14:51:22Z","GPSImgDirection":"245.73602305","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379083299999997","GPSLatitude":"48.447266670000012","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"11.95904531304047","DateCreated":"2020-10-18T16:51:21+02:00"}}}}
219	[{"x":0.5329,"y":0.9452},{"x":0.5419,"y":0.5779},{"x":0.5543,"y":0.3476},{"x":0.6234,"y":0.08}]	153	2020-04-18 20:37:04.125333	2020-07-05 19:48:04.222687	f	\N
163	[{"x":0.5674,"y":0.8618},{"x":0.5469,"y":0.4879},{"x":0.4926,"y":0.2971},{"x":0.4679,"y":0.1886},{"x":0.4556,"y":0.0757}]	168	2020-04-18 20:37:01.633238	2020-07-05 19:48:04.238635	f	\N
60	[{"x":0.1916,"y":0.7961},{"x":0.1612,"y":0.6173},{"x":0.111,"y":0.5},{"x":0.1283,"y":0.3476},{"x":0.1735,"y":0.2423}]	204	2020-04-18 20:36:57.522941	2020-07-05 19:48:04.248263	f	\N
49	[{"x":0.528,"y":0.8114},{"x":0.5625,"y":0.5844},{"x":0.565,"y":0.4221},{"x":0.5732,"y":0.2456},{"x":0.5872,"y":0.1316},{"x":0.5674,"y":0.0954}]	70	2020-04-18 20:36:57.09079	2020-04-21 13:53:48.459033	f	\N
184	[{"x":0.3865,"y":0.9156},{"x":0.3405,"y":0.5987},{"x":0.3224,"y":0.3893},{"x":0.3503,"y":0.1261},{"x":0.3651,"y":0.0954}]	44	2020-04-18 20:37:02.476536	2020-04-21 14:26:06.387603	f	\N
298	[{"x":0.615,"y":0.8233},{"x":0.6162,"y":0.6333},{"x":0.57,"y":0.4617},{"x":0.5675,"y":0.22},{"x":0.58,"y":0.1283}]	71	2020-09-03 20:43:13.477945	2020-10-22 17:12:36.332735	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.054584782571077545","GPSTimeStamp":"2020-09-01T16:08:30Z","GPSImgDirection":"73.315856939999989","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635499999999999","GPSLatitude":"48.462313329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"7.2590746739762437","DateCreated":"2020-09-01T18:08:30+02:00"}}}}
129	[{"x":0.5378,"y":0.8717},{"x":0.4836,"y":0.602},{"x":0.4383,"y":0.4287},{"x":0.4539,"y":0.1272}]	130	2020-04-18 20:37:00.356404	2020-07-05 19:48:04.174192	f	\N
75	[{"x":0.8832,"y":0.8925},{"x":0.8569,"y":0.6436},{"x":0.8479,"y":0.4452},{"x":0.7903,"y":0.2862}]	128	2020-04-18 20:36:58.149081	2020-07-05 19:48:04.182182	f	\N
99	[{"x":0.6283,"y":0.9211},{"x":0.6439,"y":0.6491},{"x":0.7229,"y":0.4474},{"x":0.7878,"y":0.1842}]	134	2020-04-18 20:36:59.136377	2020-07-05 19:48:04.186949	f	\N
149	[{"x":0.6028,"y":0.8596},{"x":0.5789,"y":0.5636},{"x":0.5288,"y":0.4836},{"x":0.4778,"y":0.3772},{"x":0.3783,"y":0.3553},{"x":0.3503,"y":0.3202},{"x":0.3569,"y":0.2796}]	156	2020-04-18 20:37:01.10395	2020-07-05 19:48:04.193996	f	\N
198	[{"x":0.6456,"y":0.9101},{"x":0.6488,"y":0.6535},{"x":0.6809,"y":0.4024},{"x":0.6686,"y":0.0625}]	150	2020-04-18 20:37:03.056544	2020-07-05 19:48:04.196126	f	\N
45	[{"x":0.3059,"y":0.9529},{"x":0.3109,"y":0.5866},{"x":0.3512,"y":0.3958},{"x":0.3462,"y":0.0384}]	159	2020-04-18 20:36:56.929777	2020-07-05 19:48:04.199204	f	\N
40	[{"x":0.472,"y":0.9671},{"x":0.4992,"y":0.6305},{"x":0.5485,"y":0.4189},{"x":0.6291,"y":0.2752},{"x":0.6414,"y":0.1754},{"x":0.6209,"y":0.0493}]	158	2020-04-18 20:36:56.726179	2020-07-05 19:48:04.21796	f	\N
143	[{"x":0.4326,"y":0.9254},{"x":0.4309,"y":0.5779},{"x":0.44,"y":0.4989},{"x":0.56,"y":0.4803},{"x":0.6678,"y":0.4518},{"x":0.7212,"y":0.2774},{"x":0.7286,"y":0.17},{"x":0.69,"y":0.0877}]	209	2020-04-18 20:37:00.867425	2020-07-05 19:48:04.24344	f	\N
25	[{"x":0.3037,"y":0.8051},{"x":0.2906,"y":0.5387},{"x":0.2906,"y":0.3306},{"x":0.3454,"y":0.1538}]	203	2020-04-18 20:36:56.142631	2020-07-05 19:48:04.246732	f	\N
486	[{"x":0.555,"y":0.7967},{"x":0.53,"y":0.5167},{"x":0.5,"y":0.305},{"x":0.4412,"y":0.1617}]	450	2020-10-19 21:37:29.335152	2020-10-19 21:37:58.12259	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11804264036009811","GPSTimeStamp":"2020-10-18T14:36:53Z","GPSImgDirection":"86.80545042","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6380616699999999","GPSLatitude":"48.447600000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.599999999999994","GPSHPositioningError":"10.659548505186089","DateCreated":"2020-10-18T16:36:52+02:00"}}}}
492	[{"x":0.6325,"y":0.84},{"x":0.6225,"y":0.4967},{"x":0.605,"y":0.2083},{"x":0.5913,"y":0.15}]	489	2020-10-19 21:43:59.537526	2020-10-19 21:44:27.594295	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.18672539303847802","GPSTimeStamp":"2020-10-18T14:49:18Z","GPSImgDirection":"358.06005859000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379366700000002","GPSLatitude":"48.447308329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"16.124053904375117","DateCreated":"2020-10-18T16:49:18+02:00"}}}}
488	[{"x":0.4988,"y":0.8433},{"x":0.5125,"y":0.445},{"x":0.5012,"y":0.16}]	449	2020-10-19 21:39:56.050058	2020-10-19 21:40:21.010965	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.066725932123620768","GPSTimeStamp":"2020-10-18T14:42:59Z","GPSImgDirection":"230.19692982000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6380333299999998","GPSLatitude":"48.447558329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.200000000000003","GPSHPositioningError":"7.6956644621558983","DateCreated":"2020-10-18T16:42:59+02:00"}}}}
490	[{"x":0.4825,"y":0.8417},{"x":0.47,"y":0.4967},{"x":0.4675,"y":0.2483}]	444	2020-10-19 21:41:48.18356	2020-10-19 21:42:06.028916	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21622145167851542","GPSTimeStamp":"2020-10-18T14:46:31Z","GPSImgDirection":"357.22320550999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6381133299999999","GPSLatitude":"48.447436670000009","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"34.771779141104297","DateCreated":"2020-10-18T16:46:30+02:00"}}}}
491	[{"x":0.3325,"y":0.855},{"x":0.4025,"y":0.515},{"x":0.42,"y":0.325}]	399	2020-10-19 21:43:14.095418	2020-10-19 21:43:41.863546	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.18672539303847802","GPSTimeStamp":"2020-10-18T14:49:18Z","GPSImgDirection":"358.06005859000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379366700000002","GPSLatitude":"48.447308329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"16.124053904375117","DateCreated":"2020-10-18T16:49:18+02:00"}}}}
331	[{"x":0.1113,"y":0.4767},{"x":0.2525,"y":0.46},{"x":0.45,"y":0.5},{"x":0.5975,"y":0.5183},{"x":0.69,"y":0.4717},{"x":0.7113,"y":0.4183}]	46	2020-09-03 20:43:18.189322	2020-10-22 08:15:44.185803	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012963270768567561","GPSTimeStamp":"2020-09-01T11:47:40Z","GPSImgDirection":"171.12978369000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630500000000001","GPSLatitude":"48.463058329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.200000000000003","GPSHPositioningError":"4.1810475708502022","DateCreated":"2020-09-01T13:47:40+02:00"}}}}
4	[{"x":0.375,"y":0.9539},{"x":0.3808,"y":0.6776},{"x":0.4112,"y":0.42},{"x":0.3618,"y":0.1195}]	77	2020-04-18 20:36:55.36101	2020-04-21 13:35:44.876981	f	\N
10	[{"x":0.7785,"y":0.9178},{"x":0.7599,"y":0.5789},{"x":0.8213,"y":0.4309},{"x":0.8575,"y":0.259}]	200	2020-04-18 20:36:55.630165	2020-04-21 13:39:37.301329	f	\N
11	[{"x":0.3882,"y":0.9561},{"x":0.3906,"y":0.5614},{"x":0.4013,"y":0.3805},{"x":0.3931,"y":0.0724}]	201	2020-04-18 20:36:55.670284	2020-04-21 13:39:47.1239	f	\N
13	[{"x":0.6291,"y":0.9375},{"x":0.6735,"y":0.7632},{"x":0.7656,"y":0.6217},{"x":0.7845,"y":0.455},{"x":0.7837,"y":0.33},{"x":0.75,"y":0.3037}]	229	2020-04-18 20:36:55.734295	2020-04-21 13:40:19.956168	f	\N
16	[{"x":0.3339,"y":0.8542},{"x":0.3224,"y":0.6261},{"x":0.3026,"y":0.432},{"x":0.3051,"y":0.2083},{"x":0.3331,"y":0.0395}]	163	2020-04-18 20:36:55.834834	2020-04-21 13:41:03.797073	f	\N
19	[{"x":0.4572,"y":0.7807},{"x":0.4589,"y":0.4583},{"x":0.4285,"y":0.318},{"x":0.4202,"y":0.102}]	74	2020-04-18 20:36:55.933529	2020-04-21 13:41:50.114825	f	\N
24	[{"x":0.5351,"y":0.7813},{"x":0.5318,"y":0.5164},{"x":0.5143,"y":0.3405},{"x":0.5428,"y":0.1924},{"x":0.6294,"y":0.1209}]	161	2020-04-18 20:36:56.114268	2020-04-21 13:42:55.93633	f	\N
28	[{"x":0.375,"y":0.9474},{"x":0.3618,"y":0.7007},{"x":0.3396,"y":0.4287},{"x":0.3725,"y":0.1524}]	202	2020-04-18 20:36:56.250382	2020-04-21 13:43:49.882216	f	\N
33	[{"x":0.7122,"y":0.8235},{"x":0.7105,"y":0.5888},{"x":0.7418,"y":0.0779}]	61	2020-04-18 20:36:56.437838	2020-04-21 13:44:36.373651	f	\N
35	[{"x":0.2196,"y":0.8684},{"x":0.2097,"y":0.5998},{"x":0.2196,"y":0.4057},{"x":0.2311,"y":0.193}]	59	2020-04-18 20:36:56.514756	2020-04-21 13:44:56.257547	f	\N
37	[{"x":0.347,"y":0.92},{"x":0.3594,"y":0.648},{"x":0.4194,"y":0.1985},{"x":0.4688,"y":0.0307}]	65	2020-04-18 20:36:56.59497	2020-04-21 13:45:15.734954	f	\N
43	[{"x":0.3479,"y":0.9386},{"x":0.3405,"y":0.6491},{"x":0.3709,"y":0.3794},{"x":0.3166,"y":0.0493}]	213	2020-04-18 20:36:56.842231	2020-04-21 13:46:20.678616	f	\N
48	[{"x":0.4605,"y":0.8503},{"x":0.4693,"y":0.5403},{"x":0.5,"y":0.3734},{"x":0.6075,"y":0.1505}]	64	2020-04-18 20:36:57.044109	2020-04-21 13:47:17.608002	f	\N
51	[{"x":0.2385,"y":0.8904},{"x":0.2525,"y":0.614},{"x":0.2961,"y":0.3333},{"x":0.3594,"y":0.2204},{"x":0.4046,"y":0.0647}]	198	2020-04-18 20:36:57.165773	2020-04-21 13:54:23.394209	f	\N
53	[{"x":0.6423,"y":0.9627},{"x":0.653,"y":0.636},{"x":0.6752,"y":0.3498},{"x":0.6785,"y":0.0691}]	72	2020-04-18 20:36:57.24196	2020-04-21 13:54:42.252805	f	\N
58	[{"x":0.7459,"y":0.8476},{"x":0.7418,"y":0.534},{"x":0.7171,"y":0.4134},{"x":0.7459,"y":0.2763},{"x":0.7155,"y":0.2029}]	239	2020-04-18 20:36:57.438395	2020-04-21 13:57:10.082725	f	\N
64	[{"x":0.287,"y":0.8454},{"x":0.2969,"y":0.5614},{"x":0.3051,"y":0.3739},{"x":0.3742,"y":0.1239}]	98	2020-04-18 20:36:57.702249	2020-04-21 13:58:09.335409	f	\N
65	[{"x":0.403,"y":0.92},{"x":0.4095,"y":0.6908},{"x":0.4013,"y":0.1086},{"x":0.4063,"y":0.0581}]	73	2020-04-18 20:36:57.737684	2020-04-21 13:58:16.883117	f	\N
67	[{"x":0.4942,"y":0.9035},{"x":0.491,"y":0.6382},{"x":0.4893,"y":0.4079},{"x":0.5107,"y":0.1754}]	67	2020-04-18 20:36:57.823657	2020-04-21 13:58:30.694166	f	\N
70	[{"x":0.6554,"y":0.8136},{"x":0.6316,"y":0.4923},{"x":0.6135,"y":0.284},{"x":0.5905,"y":0.1042}]	28	2020-04-18 20:36:57.949455	2020-04-21 13:59:07.983045	f	\N
72	[{"x":0.6809,"y":0.8462},{"x":0.6305,"y":0.5641},{"x":0.6053,"y":0.3914},{"x":0.5735,"y":0.2253}]	115	2020-04-18 20:36:58.032896	2020-04-21 13:59:21.053191	f	\N
78	[{"x":0.5345,"y":0.9518},{"x":0.5058,"y":0.568},{"x":0.4589,"y":0.2796},{"x":0.4498,"y":0.0154}]	116	2020-04-18 20:36:58.267143	2020-04-21 14:07:20.936282	f	\N
81	[{"x":0.1897,"y":0.8865},{"x":0.2193,"y":0.5765},{"x":0.2719,"y":0.4063},{"x":0.3531,"y":0.2023}]	117	2020-04-18 20:36:58.382356	2020-04-21 14:07:44.578106	f	\N
86	[{"x":0.426,"y":0.9682},{"x":0.4054,"y":0.6458},{"x":0.4786,"y":0.4221},{"x":0.5329,"y":0.2357},{"x":0.5584,"y":0.0592}]	112	2020-04-18 20:36:58.589598	2020-04-21 14:08:26.92738	f	\N
90	[{"x":0.4811,"y":0.8805},{"x":0.491,"y":0.6305},{"x":0.5493,"y":0.2675}]	110	2020-04-18 20:36:58.761552	2020-04-21 14:09:04.451284	f	\N
93	[{"x":0.0748,"y":0.9178},{"x":0.0863,"y":0.7237},{"x":0.1299,"y":0.5493},{"x":0.2122,"y":0.2719},{"x":0.2113,"y":0.182}]	111	2020-04-18 20:36:58.889003	2020-04-21 14:09:24.585363	f	\N
96	[{"x":0.6785,"y":0.8871},{"x":0.6949,"y":0.6239},{"x":0.662,"y":0.4452},{"x":0.6094,"y":0.3366},{"x":0.5543,"y":0.1316}]	21	2020-04-18 20:36:59.010758	2020-04-21 14:10:09.307452	f	\N
102	[{"x":0.0702,"y":0.6867},{"x":0.1151,"y":0.5156},{"x":0.159,"y":0.4202},{"x":0.2478,"y":0.2673},{"x":0.2763,"y":0.2549}]	135	2020-04-18 20:36:59.257692	2020-04-21 14:11:02.064592	f	\N
103	[{"x":0.5471,"y":0.8544},{"x":0.5296,"y":0.6176},{"x":0.5011,"y":0.4753},{"x":0.5493,"y":0.148}]	121	2020-04-18 20:36:59.295566	2020-04-21 14:11:07.912406	f	\N
106	[{"x":0.3799,"y":0.8827},{"x":0.3956,"y":0.534},{"x":0.3873,"y":0.3048},{"x":0.4137,"y":0.1765}]	36	2020-04-18 20:36:59.424191	2020-04-21 14:11:28.731251	f	\N
109	[{"x":0.4235,"y":0.8454},{"x":0.4416,"y":0.5022},{"x":0.4408,"y":0.2697},{"x":0.4745,"y":0.0526}]	123	2020-04-18 20:36:59.583821	2020-04-21 14:12:05.382211	f	\N
111	[{"x":0.4046,"y":0.8076},{"x":0.2522,"y":0.4293},{"x":0.2599,"y":0.273},{"x":0.3257,"y":0.1661}]	240	2020-04-18 20:36:59.668278	2020-04-21 14:13:50.688338	f	\N
119	[{"x":0.2952,"y":0.9507},{"x":0.2722,"y":0.7259},{"x":0.4211,"y":0.5066},{"x":0.4186,"y":0.2895},{"x":0.3964,"y":0.1941},{"x":0.3339,"y":0.0241}]	245	2020-04-18 20:36:59.981833	2020-04-21 14:15:00.359853	f	\N
122	[{"x":0.8174,"y":0.8925},{"x":0.8092,"y":0.648},{"x":0.7278,"y":0.545},{"x":0.7015,"y":0.3816},{"x":0.6891,"y":0.1886},{"x":0.6801,"y":0.1086}]	32	2020-04-18 20:37:00.094688	2020-04-21 14:15:26.89932	f	\N
312	[{"x":0.075,"y":0.6583},{"x":0.2787,"y":0.4517},{"x":0.4387,"y":0.4367},{"x":0.5763,"y":0.4283},{"x":0.6512,"y":0.3283},{"x":0.6675,"y":0.25}]	1	2020-09-03 20:43:15.376475	2020-10-22 08:22:03.247392	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.026575228223800804","GPSTimeStamp":"2020-09-01T13:04:56Z","GPSImgDirection":"119.56403923000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625749999999999","GPSLatitude":"48.463078329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91","GPSHPositioningError":"4.4266040809993017","DateCreated":"2020-09-01T15:04:56+02:00"}}}}
124	[{"x":0.5345,"y":0.9079},{"x":0.5419,"y":0.602},{"x":0.5724,"y":0.4507},{"x":0.6209,"y":0.2007}]	30	2020-04-18 20:37:00.175966	2020-04-21 14:15:39.112112	f	\N
3	[{"x":0.7451,"y":0.8531},{"x":0.7064,"y":0.625},{"x":0.7344,"y":0.4737},{"x":0.7311,"y":0.3805},{"x":0.7229,"y":0.3355}]	189	2020-04-18 20:36:55.332313	2020-04-21 13:35:23.860365	f	\N
132	[{"x":0.259,"y":0.7873},{"x":0.2706,"y":0.5493},{"x":0.264,"y":0.3015},{"x":0.2887,"y":0.1875}]	25	2020-04-18 20:37:00.470415	2020-04-21 14:16:54.233764	f	\N
5	[{"x":0.5584,"y":0.9254},{"x":0.5699,"y":0.5504},{"x":0.5905,"y":0.3191},{"x":0.5707,"y":0.0515}]	162	2020-04-18 20:36:55.415765	2020-04-21 13:37:51.669785	f	\N
136	[{"x":0.5584,"y":0.8443},{"x":0.5082,"y":0.5252},{"x":0.4581,"y":0.2884},{"x":0.4515,"y":0.0603}]	56	2020-04-18 20:37:00.616095	2020-04-21 14:17:31.761511	f	\N
138	[{"x":0.4465,"y":0.9627},{"x":0.4655,"y":0.6009},{"x":0.4951,"y":0.3805},{"x":0.5099,"y":0.2511},{"x":0.537,"y":0.102}]	194	2020-04-18 20:37:00.681426	2020-04-21 14:17:55.803696	f	\N
7	[{"x":0.5469,"y":0.9342},{"x":0.5107,"y":0.5888},{"x":0.4794,"y":0.3695},{"x":0.44,"y":0.0987}]	88	2020-04-18 20:36:55.537502	2020-04-21 13:38:18.631501	f	\N
151	[{"x":0.3791,"y":0.9024},{"x":0.398,"y":0.5647},{"x":0.4137,"y":0.2072},{"x":0.4334,"y":0.1711},{"x":0.5197,"y":0.1491}]	94	2020-04-18 20:37:01.170633	2020-04-21 14:20:08.23647	f	\N
153	[{"x":0.6908,"y":0.8224},{"x":0.6702,"y":0.5515},{"x":0.6719,"y":0.4254},{"x":0.6168,"y":0.2796},{"x":0.5617,"y":0.1382}]	181	2020-04-18 20:37:01.243795	2020-04-21 14:20:23.751017	f	\N
156	[{"x":0.6012,"y":0.83},{"x":0.5913,"y":0.58},{"x":0.5724,"y":0.3487},{"x":0.574,"y":0.2632}]	43	2020-04-18 20:37:01.362609	2020-04-21 14:20:45.906389	f	\N
158	[{"x":0.6143,"y":0.8816},{"x":0.5938,"y":0.4704},{"x":0.5896,"y":0.2708},{"x":0.5502,"y":0.0877}]	41	2020-04-18 20:37:01.442855	2020-04-21 14:21:10.477079	f	\N
160	[{"x":0.4161,"y":0.9331},{"x":0.4021,"y":0.5702},{"x":0.361,"y":0.3684},{"x":0.3462,"y":0.1711},{"x":0.3536,"y":0.0932}]	197	2020-04-18 20:37:01.521857	2020-04-21 14:21:27.404796	f	\N
15	[{"x":0.3035,"y":0.9518},{"x":0.2985,"y":0.6809},{"x":0.2969,"y":0.4989},{"x":0.2911,"y":0.4068},{"x":0.2656,"y":0.1864}]	89	2020-04-18 20:36:55.80428	2020-04-21 13:40:50.080939	f	\N
162	[{"x":0.648,"y":0.9885},{"x":0.5307,"y":0.5683},{"x":0.4901,"y":0.3956},{"x":0.4814,"y":0.1168}]	96	2020-04-18 20:37:01.58881	2020-04-21 14:21:51.610035	f	\N
165	[{"x":0.8158,"y":0.9419},{"x":0.8215,"y":0.614},{"x":0.7697,"y":0.5022},{"x":0.7278,"y":0.2961}]	154	2020-04-18 20:37:01.717044	2020-04-21 14:22:12.776146	f	\N
17	[{"x":0.5115,"y":0.932},{"x":0.5,"y":0.5998},{"x":0.4901,"y":0.3991},{"x":0.5313,"y":0.0428}]	188	2020-04-18 20:36:55.868135	2020-04-21 13:41:12.446243	f	\N
18	[{"x":0.5011,"y":0.8618},{"x":0.5208,"y":0.6094},{"x":0.5406,"y":0.3898},{"x":0.5,"y":0.1875}]	62	2020-04-18 20:36:55.907439	2020-04-21 13:41:40.533038	f	\N
173	[{"x":0.19,"y":0.9079},{"x":0.2179,"y":0.5877},{"x":0.241,"y":0.398},{"x":0.3191,"y":0.1864},{"x":0.4071,"y":0.1053}]	83	2020-04-18 20:37:02.053489	2020-04-21 14:24:12.165629	f	\N
177	[{"x":0.097,"y":0.6228},{"x":0.1003,"y":0.5768},{"x":0.1094,"y":0.4134},{"x":0.153,"y":0.2061}]	196	2020-04-18 20:37:02.203214	2020-04-21 14:24:58.328323	f	\N
20	[{"x":0.9375,"y":0.8772},{"x":0.9202,"y":0.6283},{"x":0.9104,"y":0.4167},{"x":0.8602,"y":0.1129}]	60	2020-04-18 20:36:55.965327	2020-04-21 13:41:59.934637	f	\N
178	[{"x":0.7917,"y":0.8396},{"x":0.7357,"y":0.5173},{"x":0.6382,"y":0.3882},{"x":0.6239,"y":0.2434}]	54	2020-04-18 20:37:02.240658	2020-04-21 14:25:19.176772	f	\N
181	[{"x":0.7393,"y":0.818},{"x":0.7229,"y":0.5186},{"x":0.7015,"y":0.3081},{"x":0.6414,"y":0.0241}]	186	2020-04-18 20:37:02.357726	2020-04-21 14:25:39.811476	f	\N
183	[{"x":0.4397,"y":0.9071},{"x":0.4287,"y":0.5411},{"x":0.4079,"y":0.4021},{"x":0.4364,"y":0.2747}]	50	2020-04-18 20:37:02.43824	2020-04-21 14:25:56.306132	f	\N
188	[{"x":0.5625,"y":0.8528},{"x":0.5395,"y":0.4868},{"x":0.5384,"y":0.3051},{"x":0.5318,"y":0.0831}]	87	2020-04-18 20:37:02.634556	2020-04-21 14:26:42.837949	f	\N
194	[{"x":0.4079,"y":0.9638},{"x":0.4359,"y":0.5274},{"x":0.5033,"y":0.3004},{"x":0.5337,"y":0.1327},{"x":0.5247,"y":0.0395}]	86	2020-04-18 20:37:02.863059	2020-04-21 14:27:52.029331	f	\N
197	[{"x":0.2928,"y":0.8421},{"x":0.3067,"y":0.5482},{"x":0.3799,"y":0.3958},{"x":0.3882,"y":0.2862},{"x":0.384,"y":0.2083},{"x":0.3775,"y":0.1228}]	144	2020-04-18 20:37:02.996215	2020-04-21 14:28:25.041611	f	\N
199	[{"x":0.5559,"y":0.9923},{"x":0.5773,"y":0.5669},{"x":0.5913,"y":0.3213},{"x":0.6324,"y":0.1009}]	3	2020-04-18 20:37:03.096536	2020-04-21 14:28:48.1651	f	\N
202	[{"x":0.5444,"y":0.8586},{"x":0.5263,"y":0.5987},{"x":0.5115,"y":0.3059},{"x":0.4548,"y":0.0789}]	193	2020-04-18 20:37:03.240685	2020-04-21 14:29:09.165992	f	\N
205	[{"x":0.5263,"y":0.8695},{"x":0.5296,"y":0.5691},{"x":0.5304,"y":0.3794},{"x":0.5699,"y":0.216}]	47	2020-04-18 20:37:03.3901	2020-04-21 14:29:29.618748	f	\N
210	[{"x":0.6176,"y":0.8936},{"x":0.5954,"y":0.5789},{"x":0.6209,"y":0.4112},{"x":0.5814,"y":0.2007}]	90	2020-04-18 20:37:03.70411	2020-04-21 14:30:54.515781	f	\N
212	[{"x":0.443,"y":0.8725},{"x":0.4715,"y":0.5658},{"x":0.5022,"y":0.4688},{"x":0.5954,"y":0.3495},{"x":0.6272,"y":0.2689},{"x":0.5768,"y":0.2286}]	224	2020-04-18 20:37:03.793979	2020-04-21 14:31:20.75183	f	\N
217	[{"x":0.5181,"y":0.7873},{"x":0.528,"y":0.5154},{"x":0.551,"y":0.33},{"x":0.5214,"y":0.1634}]	91	2020-04-18 20:37:04.016163	2020-04-21 14:32:18.099099	f	\N
221	[{"x":0.364,"y":0.8396},{"x":0.341,"y":0.5107},{"x":0.3618,"y":0.338},{"x":0.4342,"y":0.1719}]	52	2020-04-18 20:37:04.229757	2020-04-21 14:32:52.633474	f	\N
223	[{"x":0.3109,"y":0.9134},{"x":0.2648,"y":0.5625},{"x":0.2599,"y":0.3586},{"x":0.2459,"y":0.1831}]	190	2020-04-18 20:37:04.316844	2020-04-21 14:33:15.704427	f	\N
31	[{"x":0.5329,"y":0.9408},{"x":0.4298,"y":0.5995},{"x":0.3531,"y":0.44},{"x":0.3311,"y":0.2969},{"x":0.3607,"y":0.1867},{"x":0.4375,"y":0.0946},{"x":0.4912,"y":0.0724}]	148	2020-04-18 20:36:56.364656	2020-04-21 13:44:21.09593	f	\N
34	[{"x":0.5189,"y":0.943},{"x":0.4597,"y":0.6217},{"x":0.3512,"y":0.3882},{"x":0.2294,"y":0.0592}]	75	2020-04-18 20:36:56.477018	2020-04-21 13:44:45.791506	f	\N
36	[{"x":0.6678,"y":0.7675},{"x":0.662,"y":0.5658},{"x":0.6291,"y":0.3893},{"x":0.69,"y":0.2478},{"x":0.69,"y":0.0779}]	71	2020-04-18 20:36:56.548958	2020-04-21 13:45:06.832291	f	\N
41	[{"x":0.7064,"y":0.7752},{"x":0.6793,"y":0.5866},{"x":0.6817,"y":0.2675},{"x":0.6579,"y":0.0833}]	206	2020-04-18 20:36:56.762915	2020-04-21 13:46:03.259615	f	\N
50	[{"x":0.5,"y":0.8742},{"x":0.4814,"y":0.6217},{"x":0.341,"y":0.4992},{"x":0.3026,"y":0.4079},{"x":0.3509,"y":0.259},{"x":0.4715,"y":0.1875}]	8	2020-04-18 20:36:57.13078	2020-04-21 13:54:15.891098	f	\N
52	[{"x":0.6886,"y":0.9367},{"x":0.682,"y":0.5888},{"x":0.6195,"y":0.3964},{"x":0.6305,"y":0.2278},{"x":0.6612,"y":0.0773}]	66	2020-04-18 20:36:57.208816	2020-04-21 13:54:34.290804	f	\N
54	[{"x":0.2738,"y":0.852},{"x":0.2837,"y":0.6195},{"x":0.3002,"y":0.5088},{"x":0.4202,"y":0.5296},{"x":0.6497,"y":0.5395},{"x":0.7286,"y":0.4397},{"x":0.7401,"y":0.2325},{"x":0.7146,"y":0.1721}]	99	2020-04-18 20:36:57.278584	2020-04-21 13:54:59.756131	f	\N
59	[{"x":0.5633,"y":0.9496},{"x":0.5592,"y":0.5373},{"x":0.435,"y":0.3805},{"x":0.3742,"y":0.2401},{"x":0.3479,"y":0.0954},{"x":0.3372,"y":0.0318}]	238	2020-04-18 20:36:57.477727	2020-04-21 13:57:21.293261	f	\N
62	[{"x":0.6201,"y":0.8366},{"x":0.6143,"y":0.5779},{"x":0.616,"y":0.4792},{"x":0.6612,"y":0.2796},{"x":0.6554,"y":0.2138},{"x":0.625,"y":0.1952}]	172	2020-04-18 20:36:57.608789	2020-04-21 13:57:53.901354	f	\N
63	[{"x":0.4523,"y":0.9737},{"x":0.4433,"y":0.6086},{"x":0.4169,"y":0.4189},{"x":0.4178,"y":0.261},{"x":0.4934,"y":0.1075},{"x":0.5016,"y":0.0471}]	166	2020-04-18 20:36:57.645884	2020-04-21 13:58:02.516215	f	\N
66	[{"x":0.4613,"y":0.9342},{"x":0.4507,"y":0.6184},{"x":0.412,"y":0.4221},{"x":0.4194,"y":0.261},{"x":0.3775,"y":0.0669}]	199	2020-04-18 20:36:57.776354	2020-04-21 13:58:24.888369	f	\N
68	[{"x":0.4104,"y":0.9013},{"x":0.4219,"y":0.5592},{"x":0.44,"y":0.3344},{"x":0.4901,"y":0.0757}]	9	2020-04-18 20:36:57.869007	2020-04-21 13:58:49.147925	f	\N
69	[{"x":0.5439,"y":0.9375},{"x":0.5428,"y":0.56},{"x":0.443,"y":0.4581},{"x":0.3882,"y":0.3396},{"x":0.3925,"y":0.3076}]	14	2020-04-18 20:36:57.917624	2020-04-21 13:59:00.438455	f	\N
74	[{"x":0.3651,"y":0.909},{"x":0.3405,"y":0.5395},{"x":0.2549,"y":0.3706},{"x":0.2656,"y":0.2533},{"x":0.3363,"y":0.1338},{"x":0.3947,"y":0.0384}]	100	2020-04-18 20:36:58.1157	2020-04-21 13:59:37.918714	f	\N
76	[{"x":0.0781,"y":0.7873},{"x":0.1086,"y":0.5658},{"x":0.1579,"y":0.4397},{"x":0.2549,"y":0.3991},{"x":0.4301,"y":0.4035},{"x":0.6776,"y":0.3618},{"x":0.8487,"y":0.3333},{"x":0.8429,"y":0.2083}]	29	2020-04-18 20:36:58.189541	2020-04-21 13:59:56.095516	f	\N
79	[{"x":0.7681,"y":0.841},{"x":0.7887,"y":0.6678},{"x":0.8191,"y":0.568},{"x":0.8125,"y":0.5175},{"x":0.7418,"y":0.3421}]	102	2020-04-18 20:36:58.312885	2020-04-21 14:07:29.523718	f	\N
80	[{"x":0.7664,"y":0.9079},{"x":0.7459,"y":0.5548},{"x":0.6801,"y":0.2654},{"x":0.5715,"y":0.0307}]	103	2020-04-18 20:36:58.3403	2020-04-21 14:07:37.450912	f	\N
82	[{"x":0.0428,"y":0.5658},{"x":0.1217,"y":0.477},{"x":0.2286,"y":0.4868}]	16	2020-04-18 20:36:58.429653	2020-04-21 14:07:57.310638	f	\N
84	[{"x":0.5181,"y":0.8509},{"x":0.4901,"y":0.5395},{"x":0.4786,"y":0.4101},{"x":0.5296,"y":0.2522},{"x":0.5995,"y":0.1228}]	107	2020-04-18 20:36:58.512773	2020-04-21 14:08:12.238051	f	\N
85	[{"x":0.4967,"y":0.8465},{"x":0.5107,"y":0.5493},{"x":0.5419,"y":0.3914},{"x":0.5074,"y":0.1875},{"x":0.4778,"y":0.1239}]	106	2020-04-18 20:36:58.546359	2020-04-21 14:08:18.648392	f	\N
88	[{"x":0.8141,"y":0.932},{"x":0.7393,"y":0.6393},{"x":0.5526,"y":0.5022},{"x":0.3799,"y":0.3268},{"x":0.2977,"y":0.1502}]	11	2020-04-18 20:36:58.676284	2020-04-21 14:08:49.87644	f	\N
94	[{"x":0.4572,"y":0.9605},{"x":0.4781,"y":0.7393},{"x":0.5614,"y":0.4786},{"x":0.5691,"y":0.2368},{"x":0.4934,"y":0.1447}]	105	2020-04-18 20:36:58.933692	2020-04-21 14:09:31.670298	f	\N
95	[{"x":0.6118,"y":0.9452},{"x":0.6044,"y":0.6064},{"x":0.611,"y":0.3717},{"x":0.5806,"y":0.1261}]	38	2020-04-18 20:36:58.969379	2020-04-21 14:09:37.15947	f	\N
97	[{"x":0.4792,"y":0.9326},{"x":0.4605,"y":0.5518},{"x":0.477,"y":0.3166},{"x":0.4298,"y":0.0946}]	108	2020-04-18 20:36:59.048247	2020-04-21 14:10:15.547684	f	\N
100	[{"x":0.7771,"y":0.6787},{"x":0.7804,"y":0.4923},{"x":0.8281,"y":0.2467},{"x":0.838,"y":0.1656},{"x":0.8059,"y":0.1151}]	242	2020-04-18 20:36:59.180781	2020-04-21 14:10:46.673199	f	\N
101	[{"x":0.4523,"y":0.9836},{"x":0.4729,"y":0.83},{"x":0.5633,"y":0.5757},{"x":0.5781,"y":0.364},{"x":0.5691,"y":0.1908},{"x":0.5337,"y":0.0373}]	243	2020-04-18 20:36:59.221288	2020-04-21 14:10:54.777981	f	\N
104	[{"x":0.3594,"y":0.9397},{"x":0.352,"y":0.6162},{"x":0.3257,"y":0.386},{"x":0.3257,"y":0.1985},{"x":0.3536,"y":0.1469}]	109	2020-04-18 20:36:59.337064	2020-04-21 14:11:15.910804	f	\N
105	[{"x":0.5658,"y":0.9232},{"x":0.5411,"y":0.6689},{"x":0.5206,"y":0.3991},{"x":0.4803,"y":0.0581}]	20	2020-04-18 20:36:59.377541	2020-04-21 14:11:22.297359	f	\N
176	[{"x":0.5632,"y":0.1807},{"x":0.4645,"y":0.1842},{"x":0.4303,"y":0.486},{"x":0.2605,"y":0.5193},{"x":0.0039,"y":0.4702}]	68	2020-04-18 20:37:02.167926	2020-04-18 21:00:40.317518	f	\N
108	[{"x":0.6472,"y":0.7873},{"x":0.6645,"y":0.4441},{"x":0.6612,"y":0.3465},{"x":0.6316,"y":0.2544},{"x":0.5946,"y":0.1579}]	137	2020-04-18 20:36:59.511006	2020-04-21 14:11:59.803475	f	\N
110	[{"x":0.4079,"y":0.8109},{"x":0.2982,"y":0.4613},{"x":0.1316,"y":0.3692},{"x":0.1612,"y":0.3191},{"x":0.2171,"y":0.2607}]	241	2020-04-18 20:36:59.62738	2020-04-21 14:13:30.484403	f	\N
114	[{"x":0.3026,"y":0.9452},{"x":0.3018,"y":0.6075},{"x":0.2813,"y":0.3958},{"x":0.3224,"y":0.1502}]	23	2020-04-18 20:36:59.778806	2020-04-21 14:14:11.228392	f	\N
115	[{"x":0.4688,"y":0.9781},{"x":0.4581,"y":0.6195},{"x":0.5625,"y":0.4682},{"x":0.6028,"y":0.3015},{"x":0.5822,"y":0.17},{"x":0.5576,"y":0.0526}]	37	2020-04-18 20:36:59.827503	2020-04-21 14:14:21.075759	f	\N
117	[{"x":0.4161,"y":0.9178},{"x":0.384,"y":0.6601},{"x":0.3544,"y":0.3947},{"x":0.3495,"y":0.1908}]	126	2020-04-18 20:36:59.899503	2020-04-21 14:14:32.068886	f	\N
118	[{"x":0.6787,"y":0.8857},{"x":0.5757,"y":0.5115},{"x":0.3564,"y":0.4169},{"x":0.2599,"y":0.2796},{"x":0.2566,"y":0.1842},{"x":0.3059,"y":0.1538},{"x":0.3673,"y":0.1398}]	244	2020-04-18 20:36:59.937785	2020-04-21 14:14:52.284167	f	\N
120	[{"x":0.3117,"y":0.92},{"x":0.3306,"y":0.6009},{"x":0.3791,"y":0.3651},{"x":0.3931,"y":0.1732},{"x":0.3931,"y":0.0998}]	127	2020-04-18 20:37:00.023369	2020-04-21 14:15:07.080822	f	\N
121	[{"x":0.477,"y":0.8838},{"x":0.4975,"y":0.5252},{"x":0.5222,"y":0.3015},{"x":0.5123,"y":0.1842},{"x":0.4046,"y":0.1425},{"x":0.3939,"y":0.1118},{"x":0.4219,"y":0.0855}]	133	2020-04-18 20:37:00.059559	2020-04-21 14:15:17.253113	f	\N
123	[{"x":0.3429,"y":0.8607},{"x":0.3602,"y":0.6283},{"x":0.3923,"y":0.4463},{"x":0.4235,"y":0.1513}]	24	2020-04-18 20:37:00.141466	2020-04-21 14:15:33.05313	f	\N
125	[{"x":0.7577,"y":0.8306},{"x":0.6996,"y":0.509},{"x":0.6732,"y":0.3512},{"x":0.6107,"y":0.1571}]	125	2020-04-18 20:37:00.214023	2020-04-21 14:15:46.721659	f	\N
126	[{"x":0.7336,"y":0.8717},{"x":0.7508,"y":0.5976},{"x":0.7944,"y":0.4002},{"x":0.7821,"y":0.3081},{"x":0.7467,"y":0.1952}]	131	2020-04-18 20:37:00.242728	2020-04-21 14:15:54.966413	f	\N
130	[{"x":0.4926,"y":0.9276},{"x":0.4309,"y":0.7686},{"x":0.4383,"y":0.6184},{"x":0.4391,"y":0.3509},{"x":0.4622,"y":0.0307}]	124	2020-04-18 20:37:00.390445	2020-04-21 14:16:39.76611	f	\N
135	[{"x":0.5641,"y":0.9945},{"x":0.5115,"y":0.591},{"x":0.347,"y":0.5154},{"x":0.2229,"y":0.4715},{"x":0.1414,"y":0.3377}]	4	2020-04-18 20:37:00.574293	2020-04-21 14:17:24.043921	f	\N
137	[{"x":0.3734,"y":0.8564},{"x":0.3479,"y":0.58},{"x":0.3199,"y":0.4474},{"x":0.3298,"y":0.1886}]	180	2020-04-18 20:37:00.644319	2020-04-21 14:17:39.759349	f	\N
139	[{"x":0.5748,"y":0.8333},{"x":0.5584,"y":0.6919},{"x":0.5033,"y":0.3684}]	81	2020-04-18 20:37:00.724581	2020-04-21 14:18:03.044723	f	\N
140	[{"x":0.5008,"y":0.8618},{"x":0.5008,"y":0.5548},{"x":0.5099,"y":0.3607},{"x":0.4877,"y":0.1557}]	95	2020-04-18 20:37:00.75431	2020-04-21 14:18:10.383882	f	\N
144	[{"x":0.8904,"y":0.5214},{"x":0.7873,"y":0.5321},{"x":0.6458,"y":0.5025},{"x":0.4287,"y":0.4786},{"x":0.2621,"y":0.4342},{"x":0.136,"y":0.3758},{"x":0.1765,"y":0.2566},{"x":0.2588,"y":0.1184}]	235	2020-04-18 20:37:00.903547	2020-04-21 14:18:46.691454	f	\N
146	[{"x":0.7771,"y":0.7993},{"x":0.7722,"y":0.5768},{"x":0.7632,"y":0.4408},{"x":0.7755,"y":0.2917},{"x":0.7294,"y":0.182}]	220	2020-04-18 20:37:00.976245	2020-04-21 14:19:06.364658	f	\N
147	[{"x":0.4814,"y":0.8355},{"x":0.4792,"y":0.7459},{"x":0.4868,"y":0.6036},{"x":0.3629,"y":0.5},{"x":0.3191,"y":0.3586},{"x":0.3465,"y":0.2574},{"x":0.4419,"y":0.1604}]	234	2020-04-18 20:37:01.020426	2020-04-21 14:19:15.476912	f	\N
152	[{"x":0.8117,"y":0.7763},{"x":0.7615,"y":0.5822},{"x":0.69,"y":0.4167},{"x":0.6595,"y":0.2895},{"x":0.6176,"y":0.1634}]	195	2020-04-18 20:37:01.206705	2020-04-21 14:20:16.746208	f	\N
154	[{"x":0.7204,"y":0.9507},{"x":0.602,"y":0.6316},{"x":0.5088,"y":0.44},{"x":0.3991,"y":0.1891},{"x":0.3333,"y":0.0962}]	5	2020-04-18 20:37:01.28052	2020-04-21 14:20:31.018999	f	\N
155	[{"x":0.514,"y":0.9901},{"x":0.5,"y":0.8311},{"x":0.4704,"y":0.6612},{"x":0.301,"y":0.6107},{"x":0.1217,"y":0.5395},{"x":0.0732,"y":0.4046}]	57	2020-04-18 20:37:01.321264	2020-04-21 14:20:39.317409	f	\N
157	[{"x":0.6206,"y":0.9786},{"x":0.5932,"y":0.5699},{"x":0.6184,"y":0.4309},{"x":0.727,"y":0.3199},{"x":0.8103,"y":0.2714}]	7	2020-04-18 20:37:01.395994	2020-04-21 14:20:54.694699	f	\N
159	[{"x":0.3602,"y":0.8805},{"x":0.3059,"y":0.67},{"x":0.273,"y":0.5548},{"x":0.2081,"y":0.3925},{"x":0.1982,"y":0.148},{"x":0.2113,"y":0.0044}]	69	2020-04-18 20:37:01.480908	2020-04-21 14:21:20.724616	f	\N
161	[{"x":0.7607,"y":0.7061},{"x":0.7747,"y":0.5537},{"x":0.8281,"y":0.3651},{"x":0.8446,"y":0.1996},{"x":0.8026,"y":0.1447}]	183	2020-04-18 20:37:01.555363	2020-04-21 14:21:40.675913	f	\N
164	[{"x":0.259,"y":0.9561},{"x":0.2582,"y":0.7379},{"x":0.2681,"y":0.6075},{"x":0.3084,"y":0.4287},{"x":0.3824,"y":0.2971}]	82	2020-04-18 20:37:01.678052	2020-04-21 14:22:04.976207	f	\N
168	[{"x":0.0724,"y":0.6853},{"x":0.199,"y":0.5296},{"x":0.2829,"y":0.5044},{"x":0.3947,"y":0.5044},{"x":0.5058,"y":0.5175},{"x":0.6546,"y":0.511},{"x":0.7928,"y":0.5219},{"x":0.8923,"y":0.4934},{"x":0.9441,"y":0.5099},{"x":0.9605,"y":0.5329}]	236	2020-04-18 20:37:01.838319	2020-04-21 14:23:30.237815	f	\N
170	[{"x":0.6998,"y":0.9331},{"x":0.6891,"y":0.511},{"x":0.7023,"y":0.2785},{"x":0.7113,"y":0.1107},{"x":0.6867,"y":0.0614}]	223	2020-04-18 20:37:01.917484	2020-04-21 14:23:50.423655	f	\N
174	[{"x":0.4868,"y":0.9145},{"x":0.4803,"y":0.5471},{"x":0.491,"y":0.364},{"x":0.5715,"y":0.1173}]	97	2020-04-18 20:37:02.087672	2020-04-21 14:24:17.974863	f	\N
175	[{"x":0.4934,"y":0.6469},{"x":0.4942,"y":0.557},{"x":0.477,"y":0.4792},{"x":0.4671,"y":0.3421},{"x":0.4153,"y":0.1601},{"x":0.3988,"y":0.0844}]	182	2020-04-18 20:37:02.133861	2020-04-21 14:24:31.273464	f	\N
179	[{"x":0.5156,"y":0.9309},{"x":0.5099,"y":0.4583},{"x":0.4885,"y":0.2204},{"x":0.4811,"y":0.1217},{"x":0.5296,"y":0.0592}]	192	2020-04-18 20:37:02.279234	2020-04-21 14:25:26.643225	f	\N
211	[{"x":0.4829,"y":0.7614},{"x":0.4921,"y":0.7561},{"x":0.5276,"y":0.7263},{"x":0.5395,"y":0.6947},{"x":0.5447,"y":0.6509},{"x":0.5592,"y":0.6158},{"x":0.5961,"y":0.5579},{"x":0.6079,"y":0.5439},{"x":0.6237,"y":0.4561},{"x":0.6211,"y":0.3579},{"x":0.6079,"y":0.2667},{"x":0.5789,"y":0.1614},{"x":0.5645,"y":0.1053}]	230	2020-04-18 20:37:03.757978	2020-04-18 21:00:40.391042	f	\N
215	[{"x":0.8711,"y":0.507},{"x":0.7961,"y":0.5333},{"x":0.6026,"y":0.5246},{"x":0.4316,"y":0.4632},{"x":0.2763,"y":0.4807},{"x":0.1829,"y":0.4491},{"x":0.1658,"y":0.3018},{"x":0.1855,"y":0.1772},{"x":0.1974,"y":0.1316},{"x":0.2211,"y":0.1035}]	225	2020-04-18 20:37:03.924789	2020-04-18 21:00:40.401858	f	\N
216	[{"x":0.7961,"y":0.5053},{"x":0.7316,"y":0.4526},{"x":0.6711,"y":0.414},{"x":0.5737,"y":0.414},{"x":0.4474,"y":0.4123},{"x":0.3461,"y":0.4263},{"x":0.2671,"y":0.4719},{"x":0.1724,"y":0.4702},{"x":0.1395,"y":0.4193},{"x":0.1592,"y":0.4}]	231	2020-04-18 20:37:03.972043	2020-04-18 21:00:40.404725	f	\N
1	[{"x":0.0222,"y":0.7818},{"x":0.0781,"y":0.5855},{"x":0.1793,"y":0.4605},{"x":0.2508,"y":0.4101},{"x":0.352,"y":0.4287},{"x":0.5016,"y":0.4309},{"x":0.5896,"y":0.2686},{"x":0.5699,"y":0.1601}]	1	2020-04-18 19:51:17.374644	2020-04-21 13:33:46.367889	f	\N
2	[{"x":0.491,"y":0.8805},{"x":0.4901,"y":0.6502},{"x":0.4696,"y":0.4079},{"x":0.4819,"y":0.0877}]	63	2020-04-18 20:36:55.239653	2020-04-21 13:34:27.027339	f	\N
8	[{"x":0.3651,"y":0.8761},{"x":0.3898,"y":0.5482},{"x":0.3577,"y":0.352},{"x":0.4227,"y":0.2796},{"x":0.4622,"y":0.1875},{"x":0.4671,"y":0.1096}]	228	2020-04-18 20:36:55.565201	2020-04-21 13:39:07.618489	f	\N
21	[{"x":0.0288,"y":0.7599},{"x":0.0535,"y":0.5844},{"x":0.1316,"y":0.5493},{"x":0.2492,"y":0.5208},{"x":0.3906,"y":0.5033},{"x":0.5214,"y":0.5186},{"x":0.6209,"y":0.4879},{"x":0.6414,"y":0.3355},{"x":0.6694,"y":0.1897}]	48	2020-04-18 20:36:56.005996	2020-04-21 13:42:23.230116	f	\N
22	[{"x":0.44,"y":0.9046},{"x":0.4161,"y":0.6458},{"x":0.2516,"y":0.659},{"x":0.1143,"y":0.6382},{"x":0.0419,"y":0.5274},{"x":0.0238,"y":0.3925},{"x":0.0855,"y":0.3114},{"x":0.1669,"y":0.216}]	149	2020-04-18 20:36:56.039619	2020-04-21 13:42:41.227811	f	\N
32	[{"x":0.625,"y":0.8465},{"x":0.5913,"y":0.568},{"x":0.5715,"y":0.3509},{"x":0.528,"y":0.0658}]	49	2020-04-18 20:36:56.409067	2020-04-21 13:44:29.35076	f	\N
57	[{"x":0.3569,"y":0.8553},{"x":0.3692,"y":0.7259},{"x":0.2878,"y":0.6853},{"x":0.2253,"y":0.5197},{"x":0.199,"y":0.3849},{"x":0.2039,"y":0.2697},{"x":0.2212,"y":0.205},{"x":0.2549,"y":0.1524}]	205	2020-04-18 20:36:57.40939	2020-04-21 13:56:29.971594	f	\N
182	[{"x":0.1678,"y":0.8169},{"x":0.213,"y":0.614},{"x":0.2706,"y":0.5461},{"x":0.4211,"y":0.5362},{"x":0.5222,"y":0.4298},{"x":0.6192,"y":0.1524}]	2	2020-04-18 20:37:02.392176	2020-04-21 14:25:50.476895	f	\N
187	[{"x":0.5411,"y":0.9243},{"x":0.5304,"y":0.5186},{"x":0.5016,"y":0.307},{"x":0.4934,"y":0.1217}]	93	2020-04-18 20:37:02.59408	2020-04-21 14:26:26.252653	f	\N
189	[{"x":0.6965,"y":0.818},{"x":0.7072,"y":0.5296},{"x":0.7664,"y":0.3607},{"x":0.7854,"y":0.2204},{"x":0.7541,"y":0.182}]	179	2020-04-18 20:37:02.66842	2020-04-21 14:26:50.542769	f	\N
190	[{"x":0.8838,"y":0.5},{"x":0.761,"y":0.5247},{"x":0.4496,"y":0.5263},{"x":0.3169,"y":0.4457},{"x":0.2884,"y":0.315},{"x":0.3553,"y":0.2253}]	227	2020-04-18 20:37:02.700822	2020-04-21 14:27:11.891713	f	\N
193	[{"x":0.7917,"y":0.9038},{"x":0.7368,"y":0.6192},{"x":0.6217,"y":0.4268},{"x":0.5943,"y":0.2714},{"x":0.5746,"y":0.1735},{"x":0.5713,"y":0.0518}]	226	2020-04-18 20:37:02.825696	2020-04-21 14:27:44.605272	f	\N
195	[{"x":0.2442,"y":0.9002},{"x":0.2401,"y":0.6886},{"x":0.2393,"y":0.5899},{"x":0.338,"y":0.4912},{"x":0.5189,"y":0.5044},{"x":0.7401,"y":0.5548},{"x":0.8717,"y":0.4726},{"x":0.8808,"y":0.3618},{"x":0.8413,"y":0.17}]	178	2020-04-18 20:37:02.900519	2020-04-21 14:28:09.272792	f	\N
196	[{"x":0.7023,"y":0.8706},{"x":0.6628,"y":0.5504},{"x":0.7007,"y":0.3882},{"x":0.7023,"y":0.3015},{"x":0.6513,"y":0.2292},{"x":0.6176,"y":0.1524},{"x":0.6135,"y":0.1075}]	92	2020-04-18 20:37:02.947674	2020-04-21 14:28:17.773065	f	\N
200	[{"x":0.3824,"y":0.9627},{"x":0.3503,"y":0.5581},{"x":0.4169,"y":0.3454},{"x":0.4613,"y":0.0329}]	51	2020-04-18 20:37:03.141585	2020-04-21 14:28:55.985865	f	\N
201	[{"x":0.4457,"y":0.9671},{"x":0.4038,"y":0.5866},{"x":0.3906,"y":0.3673},{"x":0.3183,"y":0.1557},{"x":0.3067,"y":0.0636}]	187	2020-04-18 20:37:03.190245	2020-04-21 14:29:03.092361	f	\N
203	[{"x":0.4334,"y":0.8838},{"x":0.4021,"y":0.5406},{"x":0.3289,"y":0.2577},{"x":0.3495,"y":0.1162},{"x":0.3742,"y":0.0296}]	185	2020-04-18 20:37:03.285476	2020-04-21 14:29:15.925628	f	\N
204	[{"x":0.4748,"y":0.9391},{"x":0.4496,"y":0.5543},{"x":0.511,"y":0.4021},{"x":0.5735,"y":0.2459},{"x":0.5987,"y":0.1464},{"x":0.5669,"y":0.0913}]	191	2020-04-18 20:37:03.340594	2020-04-21 14:29:23.914335	f	\N
206	[{"x":0.102,"y":0.8432},{"x":0.1694,"y":0.4868},{"x":0.3528,"y":0.5011},{"x":0.5666,"y":0.5143},{"x":0.7138,"y":0.4989},{"x":0.8322,"y":0.4518},{"x":0.9038,"y":0.4123}]	53	2020-04-18 20:37:03.438698	2020-04-21 14:29:53.73391	f	\N
209	[{"x":0.6382,"y":0.8246},{"x":0.6299,"y":0.5603},{"x":0.6488,"y":0.4693},{"x":0.759,"y":0.4485},{"x":0.8701,"y":0.4221},{"x":0.903,"y":0.318},{"x":0.9235,"y":0.3103}]	84	2020-04-18 20:37:03.659325	2020-04-21 14:30:48.856758	f	\N
213	[{"x":0.6349,"y":0.9112},{"x":0.6086,"y":0.5702},{"x":0.5724,"y":0.3838},{"x":0.5313,"y":0.1974},{"x":0.4663,"y":0.0537}]	218	2020-04-18 20:37:03.840809	2020-04-21 14:31:27.057385	f	\N
214	[{"x":0.3561,"y":0.9331},{"x":0.3676,"y":0.5526},{"x":0.2804,"y":0.3893},{"x":0.264,"y":0.2445},{"x":0.3035,"y":0.1897}]	219	2020-04-18 20:37:03.878065	2020-04-21 14:31:35.509429	f	\N
220	[{"x":0.4482,"y":0.9287},{"x":0.4564,"y":0.5208},{"x":0.4704,"y":0.3684},{"x":0.5329,"y":0.1217}]	147	2020-04-18 20:37:04.18197	2020-04-21 14:32:47.255802	f	\N
222	[{"x":0.2325,"y":0.9169},{"x":0.318,"y":0.5444},{"x":0.3607,"y":0.4589},{"x":0.489,"y":0.491},{"x":0.6634,"y":0.4416},{"x":0.7511,"y":0.3586},{"x":0.7204,"y":0.2845},{"x":0.659,"y":0.2245}]	46	2020-04-18 20:37:04.272266	2020-04-21 14:33:08.414593	f	\N
224	[{"x":0.443,"y":0.5765},{"x":0.4726,"y":0.5123},{"x":0.5439,"y":0.236},{"x":0.5384,"y":0.0757}]	184	2020-04-18 20:37:04.370683	2020-04-21 14:33:22.248228	f	\N
73	[{"x":0.4112,"y":0.9671},{"x":0.3832,"y":0.5417},{"x":0.3487,"y":0.3224},{"x":0.3668,"y":0.1754},{"x":0.3758,"y":0.1031}]	114	2020-04-18 20:36:58.06937	2020-04-21 13:59:28.574715	f	\N
77	[{"x":0.7664,"y":0.9496},{"x":0.7541,"y":0.6031},{"x":0.676,"y":0.1952}]	17	2020-04-18 20:36:58.231256	2020-04-21 14:00:09.212403	f	\N
83	[{"x":0.7179,"y":0.7971},{"x":0.6933,"y":0.6075},{"x":0.6299,"y":0.4364},{"x":0.5888,"y":0.2818},{"x":0.5995,"y":0.0866}]	113	2020-04-18 20:36:58.472796	2020-04-21 14:08:05.246821	f	\N
87	[{"x":0.5938,"y":0.8706},{"x":0.5707,"y":0.5998},{"x":0.5724,"y":0.3662},{"x":0.5189,"y":0.2237}]	13	2020-04-18 20:36:58.632095	2020-04-21 14:08:32.891521	f	\N
89	[{"x":0.5987,"y":0.9046},{"x":0.6162,"y":0.685},{"x":0.5987,"y":0.5313},{"x":0.5011,"y":0.4391},{"x":0.3684,"y":0.3692},{"x":0.3344,"y":0.2763},{"x":0.3366,"y":0.2196},{"x":0.3509,"y":0.1785}]	104	2020-04-18 20:36:58.719967	2020-04-21 14:08:59.329816	f	\N
98	[{"x":0.4071,"y":0.9189},{"x":0.3939,"y":0.6086},{"x":0.4063,"y":0.455},{"x":0.3183,"y":0.3268},{"x":0.3092,"y":0.1941}]	120	2020-04-18 20:36:59.095596	2020-04-21 14:10:33.239133	f	\N
107	[{"x":0.6571,"y":0.9002},{"x":0.5921,"y":0.5296},{"x":0.4893,"y":0.4123},{"x":0.4087,"y":0.2664},{"x":0.4087,"y":0.1623},{"x":0.426,"y":0.1261}]	22	2020-04-18 20:36:59.462889	2020-04-21 14:11:41.816482	f	\N
112	[{"x":0.2541,"y":0.9189},{"x":0.2467,"y":0.6151},{"x":0.2697,"y":0.4518},{"x":0.3207,"y":0.3333},{"x":0.3799,"y":0.205},{"x":0.4441,"y":0.1371},{"x":0.5288,"y":0.0921}]	122	2020-04-18 20:36:59.707148	2020-04-21 14:13:59.603559	f	\N
116	[{"x":0.3454,"y":0.9145},{"x":0.3339,"y":0.5219},{"x":0.3561,"y":0.2862},{"x":0.3832,"y":0.1228}]	132	2020-04-18 20:36:59.860067	2020-04-21 14:14:26.69707	f	\N
128	[{"x":0.4235,"y":0.9507},{"x":0.4227,"y":0.5998},{"x":0.4441,"y":0.3542},{"x":0.4482,"y":0.1393}]	118	2020-04-18 20:37:00.32277	2020-04-21 14:16:15.859574	f	\N
131	[{"x":0.3668,"y":0.9101},{"x":0.3618,"y":0.6985},{"x":0.278,"y":0.5515},{"x":0.25,"y":0.3772},{"x":0.2442,"y":0.2478},{"x":0.3035,"y":0.0417}]	31	2020-04-18 20:37:00.435148	2020-04-21 14:16:47.902917	f	\N
134	[{"x":0.6924,"y":0.7456},{"x":0.69,"y":0.4485},{"x":0.6308,"y":0.3169},{"x":0.5247,"y":0.261}]	42	2020-04-18 20:37:00.539647	2020-04-21 14:17:11.53666	f	\N
145	[{"x":0.4087,"y":0.9638},{"x":0.4408,"y":0.6557},{"x":0.5214,"y":0.5362},{"x":0.5321,"y":0.3629},{"x":0.4712,"y":0.2423},{"x":0.2673,"y":0.1283},{"x":0.2549,"y":0.0779},{"x":0.2673,"y":0.057}]	221	2020-04-18 20:37:00.939492	2020-04-21 14:18:59.706697	f	\N
167	[{"x":0.8972,"y":0.5011},{"x":0.838,"y":0.4748},{"x":0.7352,"y":0.4507},{"x":0.6612,"y":0.4627},{"x":0.5181,"y":0.4287},{"x":0.4301,"y":0.409},{"x":0.347,"y":0.3618},{"x":0.1933,"y":0.3586},{"x":0.1012,"y":0.3816},{"x":0.051,"y":0.3794}]	222	2020-04-18 20:37:01.793838	2020-04-21 14:22:52.009377	f	\N
169	[{"x":0.3465,"y":0.8446},{"x":0.3355,"y":0.6645},{"x":0.432,"y":0.537},{"x":0.4254,"y":0.4375},{"x":0.352,"y":0.3742},{"x":0.3125,"y":0.2632},{"x":0.3465,"y":0.1785}]	237	2020-04-18 20:37:01.877461	2020-04-21 14:23:42.781271	f	\N
180	[{"x":0.4153,"y":0.8662},{"x":0.4095,"y":0.545},{"x":0.4013,"y":0.4057},{"x":0.3997,"y":0.2785},{"x":0.4276,"y":0.1809}]	78	2020-04-18 20:37:02.323557	2020-04-21 14:25:33.574261	f	\N
186	[{"x":0.5633,"y":0.8333},{"x":0.5559,"y":0.58},{"x":0.5206,"y":0.4035},{"x":0.5049,"y":0.25},{"x":0.5082,"y":0.17}]	145	2020-04-18 20:37:02.559485	2020-04-21 14:26:20.715785	f	\N
191	[{"x":0.5313,"y":0.9364},{"x":0.5748,"y":0.5768},{"x":0.6743,"y":0.4605},{"x":0.7204,"y":0.2818},{"x":0.7056,"y":0.1952}]	233	2020-04-18 20:37:02.742198	2020-04-21 14:27:22.589374	f	\N
192	[{"x":0.1689,"y":0.8766},{"x":0.1941,"y":0.7607},{"x":0.2412,"y":0.7056},{"x":0.4375,"y":0.6801},{"x":0.5735,"y":0.588},{"x":0.5318,"y":0.4589},{"x":0.3706,"y":0.3717},{"x":0.2478,"y":0.3059},{"x":0.2434,"y":0.2525},{"x":0.3279,"y":0.1842}]	232	2020-04-18 20:37:02.78092	2020-04-21 14:27:35.967984	f	\N
207	[{"x":0.9424,"y":0.545},{"x":0.8355,"y":0.5603},{"x":0.7245,"y":0.5296},{"x":0.5979,"y":0.5263},{"x":0.4737,"y":0.545},{"x":0.3865,"y":0.6031},{"x":0.2837,"y":0.5877},{"x":0.1711,"y":0.5362},{"x":0.0896,"y":0.5373},{"x":0.0559,"y":0.5504}]	146	2020-04-18 20:37:03.54561	2020-04-21 14:30:15.077179	f	\N
208	[{"x":0.3363,"y":0.9046},{"x":0.3692,"y":0.6634},{"x":0.4729,"y":0.5625},{"x":0.5411,"y":0.4474},{"x":0.5403,"y":0.1678},{"x":0.5321,"y":0.1305}]	152	2020-04-18 20:37:03.608045	2020-04-21 14:30:33.573556	f	\N
218	[{"x":0.7327,"y":0.9836},{"x":0.7007,"y":0.6502},{"x":0.5798,"y":0.5768},{"x":0.3906,"y":0.5055},{"x":0.3224,"y":0.3728},{"x":0.3051,"y":0.2412},{"x":0.3092,"y":0.1711},{"x":0.4219,"y":0.045}]	85	2020-04-18 20:37:04.067592	2020-04-21 14:32:35.398081	f	\N
238	[{"x":0.59,"y":0.9137},{"x":0.5133,"y":0.5275},{"x":0.3567,"y":0.3},{"x":0.41,"y":0.15}]	165	2020-07-05 20:00:23.336479	2020-07-05 20:48:35.483552	f	\N
236	[{"x":0.475,"y":0.7137},{"x":0.4367,"y":0.415},{"x":0.5367,"y":0.1613}]	177	2020-07-05 20:00:23.153873	2020-07-05 20:46:55.998953	f	\N
239	[{"x":0.555,"y":0.8013},{"x":0.49,"y":0.4525},{"x":0.315,"y":0.1963},{"x":0.285,"y":0.075}]	164	2020-07-05 20:00:23.41996	2020-07-05 20:47:51.248305	f	\N
235	[{"x":0.6267,"y":0.9637},{"x":0.5033,"y":0.5025},{"x":0.5283,"y":0.03}]	138	2020-07-05 20:00:23.089874	2020-07-05 20:56:51.930827	f	\N
234	[{"x":0.5717,"y":0.9263},{"x":0.5533,"y":0.4075},{"x":0.5267,"y":0.1212}]	128	2020-07-05 20:00:23.031964	2020-07-05 20:58:07.096604	f	\N
248	[{"x":0.5,"y":0.8862},{"x":0.4217,"y":0.5525},{"x":0.5317,"y":0.34},{"x":0.5333,"y":0.0425}]	136	2020-07-05 20:00:24.028446	2020-07-05 20:57:36.176498	f	\N
258	[{"x":0.52,"y":0.9175},{"x":0.4533,"y":0.6262},{"x":0.5667,"y":0.07}]	207	2020-07-05 20:00:24.821282	2020-07-05 20:59:45.697978	f	\N
264	[{"x":0.6517,"y":0.98},{"x":0.5933,"y":0.695},{"x":0.5083,"y":0.525},{"x":0.4917,"y":0.2762},{"x":0.5183,"y":0.0475}]	217	2020-07-05 20:00:25.199488	2020-07-05 20:50:02.765213	f	\N
241	[{"x":0.625,"y":0.85},{"x":0.68,"y":0.415},{"x":0.4483,"y":0.1537}]	170	2020-07-05 20:00:23.58865	2020-07-05 20:47:23.746741	f	\N
245	[{"x":0.6167,"y":0.9125},{"x":0.565,"y":0.545},{"x":0.4217,"y":0.09}]	203	2020-07-05 20:00:23.820682	2020-07-05 20:58:48.461421	f	\N
262	[{"x":0.5817,"y":0.9337},{"x":0.5467,"y":0.4487},{"x":0.4283,"y":0.0638}]	210	2020-07-05 20:00:25.072006	2020-07-05 21:01:05.681477	f	\N
251	[{"x":0.53,"y":0.9063},{"x":0.5267,"y":0.4462},{"x":0.5817,"y":0.0862}]	168	2020-07-05 20:00:24.277451	2020-07-05 20:49:08.967762	f	\N
246	[{"x":0.6117,"y":0.89},{"x":0.4833,"y":0.5387},{"x":0.4883,"y":0.4437},{"x":0.5483,"y":0.2},{"x":0.5733,"y":0.1212}]	169	2020-07-05 20:00:23.895763	2020-07-05 20:49:38.169032	f	\N
226	[{"x":0.6867,"y":0.895},{"x":0.5967,"y":0.53},{"x":0.415,"y":0.0725}]	212	2020-07-05 20:00:22.197966	2020-07-05 21:01:43.23582	f	\N
232	[{"x":0.595,"y":0.8962},{"x":0.52,"y":0.4288},{"x":0.535,"y":0.0712}]	215	2020-07-05 20:00:22.83111	2020-07-05 20:51:00.345056	f	\N
230	[{"x":0.4817,"y":0.805},{"x":0.52,"y":0.3538},{"x":0.4617,"y":0.1537}]	151	2020-07-05 20:00:22.674697	2020-07-05 20:53:01.832122	f	\N
253	[{"x":0.5467,"y":0.8975},{"x":0.4967,"y":0.3937},{"x":0.46,"y":0.0712}]	141	2020-07-05 20:00:24.405026	2020-07-05 20:55:22.041861	f	\N
260	[{"x":0.5683,"y":0.87},{"x":0.565,"y":0.46},{"x":0.53,"y":0.155}]	150	2020-07-05 20:00:24.949955	2020-07-05 20:53:52.404558	f	\N
240	[{"x":0.4867,"y":0.8575},{"x":0.4317,"y":0.4113},{"x":0.575,"y":0.1537}]	159	2020-07-05 20:00:23.512448	2020-07-05 20:44:12.466362	f	\N
254	[{"x":0.515,"y":0.8825},{"x":0.4717,"y":0.6312},{"x":0.555,"y":0.37},{"x":0.6317,"y":0.0988}]	216	2020-07-05 20:00:24.467166	2020-07-05 20:50:39.727558	f	\N
247	[{"x":0.5583,"y":0.845},{"x":0.48,"y":0.5425},{"x":0.6267,"y":0.2762},{"x":0.645,"y":0.1363}]	158	2020-07-05 20:00:23.973393	2020-07-05 20:45:45.703562	f	\N
263	[{"x":0.4567,"y":0.7638},{"x":0.51,"y":0.5313},{"x":0.6467,"y":0.41},{"x":0.755,"y":0.3362},{"x":0.7917,"y":0.2062}]	175	2020-07-05 20:00:25.130154	2020-07-05 20:39:26.079322	f	\N
225	[{"x":0.52,"y":0.8712},{"x":0.475,"y":0.6225},{"x":0.4467,"y":0.4662},{"x":0.5617,"y":0.3725},{"x":0.575,"y":0.1963}]	174	2020-07-05 19:59:51.026596	2020-07-05 20:41:35.67124	f	\N
233	[{"x":0.3767,"y":0.8475},{"x":0.4067,"y":0.5363},{"x":0.4233,"y":0.1313}]	173	2020-07-05 20:00:22.940122	2020-07-05 20:42:56.896923	f	\N
237	[{"x":0.5967,"y":0.8488},{"x":0.63,"y":0.4425},{"x":0.5083,"y":0.265},{"x":0.4617,"y":0.0638}]	160	2020-07-05 20:00:23.240223	2020-07-05 20:43:35.314439	f	\N
250	[{"x":0.5633,"y":0.8125},{"x":0.5733,"y":0.5112},{"x":0.4417,"y":0.195}]	157	2020-07-05 20:00:24.200784	2020-07-05 20:46:26.696137	f	\N
261	[{"x":0.5133,"y":0.8688},{"x":0.5083,"y":0.5075},{"x":0.475,"y":0.15}]	155	2020-07-05 20:00:25.013763	2020-07-05 20:52:07.44383	f	\N
227	[{"x":0.525,"y":0.9087},{"x":0.5783,"y":0.415},{"x":0.5033,"y":0.1837},{"x":0.5633,"y":0.085}]	214	2020-07-05 20:00:22.395586	2020-07-05 20:51:30.282205	f	\N
256	[{"x":0.605,"y":0.8413},{"x":0.6733,"y":0.5925},{"x":0.5917,"y":0.395},{"x":0.4317,"y":0.28},{"x":0.275,"y":0.1837}]	156	2020-07-05 20:00:24.600909	2020-07-05 20:52:39.119319	f	\N
229	[{"x":0.5067,"y":0.93},{"x":0.4033,"y":0.4738},{"x":0.555,"y":0.1087}]	153	2020-07-05 20:00:22.587219	2020-07-05 20:53:33.457952	f	\N
257	[{"x":0.4883,"y":0.9675},{"x":0.4417,"y":0.4763},{"x":0.53,"y":0.2687},{"x":0.4667,"y":0.07}]	140	2020-07-05 20:00:24.674593	2020-07-05 20:54:43.695953	f	\N
244	[{"x":0.4233,"y":0.9475},{"x":0.4633,"y":0.675},{"x":0.64,"y":0.3825},{"x":0.675,"y":0.055}]	142	2020-07-05 20:00:23.757752	2020-07-05 20:56:08.651943	f	\N
242	[{"x":0.6017,"y":0.9337},{"x":0.555,"y":0.2637},{"x":0.5333,"y":0.0425}]	139	2020-07-05 20:00:23.641112	2020-07-05 20:56:28.026397	f	\N
249	[{"x":0.435,"y":0.965},{"x":0.4867,"y":0.6188},{"x":0.6833,"y":0.37},{"x":0.7133,"y":0.12}]	134	2020-07-05 20:00:24.076408	2020-07-05 20:57:13.173349	f	\N
243	[{"x":0.56,"y":0.88},{"x":0.5233,"y":0.37},{"x":0.5033,"y":0.0612}]	129	2020-07-05 20:00:23.705781	2020-07-05 20:57:52.819884	f	\N
252	[{"x":0.57,"y":0.8475},{"x":0.5883,"y":0.6238},{"x":0.4417,"y":0.4075},{"x":0.43,"y":0.1812}]	130	2020-07-05 20:00:24.343704	2020-07-05 20:58:27.140479	f	\N
259	[{"x":0.5733,"y":0.8688},{"x":0.34,"y":0.4288},{"x":0.4483,"y":0.1225}]	204	2020-07-05 20:00:24.8884	2020-07-05 20:59:22.910444	f	\N
231	[{"x":0.5733,"y":0.9163},{"x":0.5617,"y":0.3688},{"x":0.4667,"y":0.0825}]	208	2020-07-05 20:00:22.774222	2020-07-05 20:59:59.497821	f	\N
228	[{"x":0.1713,"y":0.9617},{"x":0.2537,"y":0.5},{"x":0.5475,"y":0.3883},{"x":0.7087,"y":0.3717},{"x":0.805,"y":0.16}]	209	2020-07-05 20:00:22.460859	2020-07-05 21:00:38.433076	f	\N
255	[{"x":0.52,"y":0.9525},{"x":0.545,"y":0.5138},{"x":0.64,"y":0.0013}]	211	2020-07-05 20:00:24.524308	2020-07-05 21:01:25.976397	f	\N
318	[{"x":0.7125,"y":0.7933},{"x":0.6875,"y":0.4333},{"x":0.65,"y":0.26}]	128	2020-09-03 20:43:16.256737	2020-10-22 08:22:39.577703	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018706090746503663","GPSTimeStamp":"2020-09-01T13:05:40Z","GPSImgDirection":"111.61694153000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625549999999998","GPSLatitude":"48.463046670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.799999999999997","GPSHPositioningError":"10.033350703491402","DateCreated":"2020-09-01T15:05:39+02:00"}}}}
326	[{"x":0.6925,"y":0.9},{"x":0.6913,"y":0.4867},{"x":0.6875,"y":0.2133}]	194	2020-09-03 20:43:17.350891	2020-10-22 17:06:49.187211	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.058897156270842896","GPSTimeStamp":"2020-09-01T15:53:24Z","GPSImgDirection":"80.443298340000013","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"5.645715267044479","DateCreated":"2020-09-01T17:53:23+02:00"}}}}
314	[{"x":0.5925,"y":0.7917},{"x":0.595,"y":0.51},{"x":0.5775,"y":0.31},{"x":0.5687,"y":0.2133}]	154	2020-09-03 20:43:15.577919	2020-10-22 17:28:14.99357	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010091121308486545","GPSTimeStamp":"2020-09-01T16:30:23Z","GPSImgDirection":"173.28211991000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635333299999995","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.9926532190500739","DateCreated":"2020-09-01T18:30:22+02:00"}}}}
293	[{"x":0.5687,"y":0.8383},{"x":0.575,"y":0.6417},{"x":0.4988,"y":0.3583},{"x":0.46,"y":0.24}]	55	2020-09-03 20:43:12.79275	2020-10-22 16:47:50.377763	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11071044208701972","GPSTimeStamp":"2020-09-01T15:05:00Z","GPSImgDirection":"317.51951600000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641866700000003","GPSLatitude":"48.460799999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"5.3056777289084369","DateCreated":"2020-09-01T17:05:00+02:00"}}}}
495	[{"x":0.6863,"y":0.79},{"x":0.685,"y":0.52},{"x":0.5663,"y":0.1283}]	411	2020-10-19 21:46:52.965584	2020-10-19 21:47:14.804112	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02714896761450029","GPSTimeStamp":"2020-10-18T14:53:19Z","GPSImgDirection":"331.02767920999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6379866700000001","GPSLatitude":"48.447361669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"16.497946963216425","DateCreated":"2020-10-18T16:53:19+02:00"}}}}
428	[{"x":0.4988,"y":0.8083},{"x":0.4888,"y":0.5733},{"x":0.4838,"y":0.29},{"x":0.5188,"y":0.1383}]	242	2020-09-03 20:43:32.382498	2020-10-22 16:49:34.452259	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.24529595667282642","GPSTimeStamp":"2020-09-01T15:14:12Z","GPSImgDirection":"137.74995039000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638700000000002","GPSLatitude":"48.461120000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.200000000000003","GPSHPositioningError":"7.4783245459871122","DateCreated":"2020-09-01T17:14:11+02:00"}}}}
315	[{"x":0.4925,"y":0.8283},{"x":0.475,"y":0.6917},{"x":0.4875,"y":0.3967},{"x":0.5088,"y":0.18}]	121	2020-09-03 20:43:15.704623	2020-10-22 16:52:15.18831	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.031640324750192163","GPSTimeStamp":"2020-09-01T15:17:56Z","GPSImgDirection":"184.72368624000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637116700000001","GPSLatitude":"48.461216670000013","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.200000000000003","GPSHPositioningError":"12.349507129868886","DateCreated":"2020-09-01T17:17:55+02:00"}}}}
496	[{"x":0.4387,"y":0.7767},{"x":0.4,"y":0.335},{"x":0.3987,"y":0.2467}]	497	2020-10-19 21:47:41.880387	2020-10-19 21:48:06.740141	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.088585607707087052","GPSTimeStamp":"2020-10-18T14:56:49Z","GPSImgDirection":"243.21298220999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.63890833","GPSLatitude":"48.44731333","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90","GPSHPositioningError":"14.503445706835537","DateCreated":"2020-10-18T16:56:49+02:00"}}}}
497	[{"x":0.5175,"y":0.8267},{"x":0.54,"y":0.4433},{"x":0.585,"y":0.0983}]	496	2020-10-19 21:48:23.901163	2020-10-19 21:48:43.174619	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.050244245685535205","GPSTimeStamp":"2020-10-18T14:58:16Z","GPSImgDirection":"13.988250729999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6387799999999997","GPSLatitude":"48.447303329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.299999999999997","GPSHPositioningError":"9.5861615117044288","DateCreated":"2020-10-18T16:58:16+02:00"}}}}
498	[{"x":0.3912,"y":0.825},{"x":0.4037,"y":0.4183},{"x":0.4025,"y":0.16}]	465	2020-10-19 21:49:06.810049	2020-10-19 21:49:35.967603	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.057265579715529924","GPSTimeStamp":"2020-10-18T15:00:02Z","GPSImgDirection":"310.31036384000009","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6389383299999998","GPSLatitude":"48.447220000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.200000000000003","GPSHPositioningError":"10.528830806065443","DateCreated":"2020-10-18T17:00:02+02:00"}}}}
499	[{"x":0.3063,"y":0.93},{"x":0.3463,"y":0.63},{"x":0.4713,"y":0.355},{"x":0.625,"y":0.1067}]	422	2020-10-19 21:50:01.830685	2020-10-19 21:50:21.744742	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015429579662481697","GPSTimeStamp":"2020-10-18T15:02:38Z","GPSImgDirection":"101.25133033","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6389916700000002","GPSLatitude":"48.447303329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.200000000000003","GPSHPositioningError":"5.0407586632457537","DateCreated":"2020-10-18T17:02:37+02:00"}}}}
439	[{"x":0.5687,"y":0.8083},{"x":0.575,"y":0.4867},{"x":0.565,"y":0.1917}]	20	2020-09-03 20:43:34.142284	2020-10-22 16:58:53.891305	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.061494074727580533","GPSTimeStamp":"2020-09-01T15:37:08Z","GPSImgDirection":"172.25637834000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637300000000002","GPSLatitude":"48.461741670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.200000000000003","GPSHPositioningError":"4.5619078311311636","DateCreated":"2020-09-01T17:37:07+02:00"}}}}
501	[{"x":0.425,"y":0.8117},{"x":0.4288,"y":0.4817},{"x":0.425,"y":0.1917},{"x":0.4175,"y":0.1417}]	478	2020-10-19 21:51:38.373555	2020-10-19 21:51:58.424568	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.091703087110289683","GPSTimeStamp":"2020-10-18T15:05:04Z","GPSImgDirection":"150.34474175","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391300000000002","GPSLatitude":"48.447188330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.299999999999997","GPSHPositioningError":"25.832432194821749","DateCreated":"2020-10-18T17:05:03+02:00"}}}}
500	[{"x":0.7937,"y":0.9767},{"x":0.8013,"y":0.5483},{"x":0.7612,"y":0.185},{"x":0.7375,"y":0.08}]	466	2020-10-19 21:50:58.540016	2020-10-19 21:51:22.724708	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015429579662481697","GPSTimeStamp":"2020-10-18T15:02:38Z","GPSImgDirection":"101.25133033","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6389916700000002","GPSLatitude":"48.447303329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.200000000000003","GPSHPositioningError":"5.0407586632457537","DateCreated":"2020-10-18T17:02:37+02:00"}}}}
397	[{"x":0.3337,"y":0.7417},{"x":0.3862,"y":0.495},{"x":0.4037,"y":0.3233},{"x":0.4512,"y":0.2133},{"x":0.4975,"y":0.1283}]	122	2020-09-03 20:43:27.927183	2020-10-22 16:50:03.234472	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31038084635577728","GPSTimeStamp":"2020-09-01T15:15:41Z","GPSImgDirection":"159.06182090999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636383299999999","GPSLatitude":"48.461220000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"5.7552511083654334","DateCreated":"2020-09-01T17:15:40+02:00"}}}}
274	[{"x":0.64,"y":0.73},{"x":0.66,"y":0.46},{"x":0.6587,"y":0.2217}]	239	2020-09-03 20:43:10.026726	2020-10-22 16:53:57.76362	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.57298487404569243","GPSTimeStamp":"2020-09-01T15:24:04Z","GPSImgDirection":"213.46614835999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637549999999997","GPSLatitude":"48.461395000000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"12.21033234191129","DateCreated":"2020-09-01T17:24:04+02:00"}}}}
335	[{"x":0.3312,"y":0.845},{"x":0.3875,"y":0.6267},{"x":0.4763,"y":0.3833},{"x":0.5138,"y":0.1683}]	118	2020-09-03 20:43:18.951922	2020-10-22 16:54:59.176466	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11432502427970219","GPSTimeStamp":"2020-09-01T15:27:34Z","GPSImgDirection":"257.41210937999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638500000000001","GPSLatitude":"48.461261670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95","GPSHPositioningError":"12.363679961633762","DateCreated":"2020-09-01T17:27:33+02:00"}}}}
375	[{"x":0.5713,"y":0.805},{"x":0.5387,"y":0.4717},{"x":0.5387,"y":0.155}]	88	2020-09-03 20:43:24.598253	2020-10-22 17:02:27.798705	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11140376330885472","GPSTimeStamp":"2020-09-01T15:40:35Z","GPSImgDirection":"139.03238296000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637416700000007","GPSLatitude":"48.461913330000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.400000000000006","GPSHPositioningError":"8.7184142835527307","DateCreated":"2020-09-01T17:40:34+02:00"}}}}
406	[{"x":0.605,"y":0.8383},{"x":0.62,"y":0.4567},{"x":0.6262,"y":0.1667}]	191	2020-09-03 20:43:29.102152	2020-10-22 17:09:05.770729	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012782710601934298","GPSTimeStamp":"2020-09-01T15:59:35Z","GPSImgDirection":"179.78369906","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633749999999998","GPSLatitude":"48.462228330000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.099999999999994","GPSHPositioningError":"6.6366385484641093","DateCreated":"2020-09-01T17:59:34+02:00"}}}}
389	[{"x":0.55,"y":0.7983},{"x":0.5262,"y":0.5967},{"x":0.4813,"y":0.3517},{"x":0.485,"y":0.1483}]	185	2020-09-03 20:43:26.719561	2020-10-22 17:09:26.918801	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019792985178228736","GPSTimeStamp":"2020-09-01T16:00:13Z","GPSImgDirection":"206.56737518","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634366699999998","GPSLatitude":"48.462216670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"13.012424503882658","DateCreated":"2020-09-01T18:00:12+02:00"}}}}
323	[{"x":0.58,"y":0.8033},{"x":0.625,"y":0.5883},{"x":0.695,"y":0.485},{"x":0.7075,"y":0.3267},{"x":0.705,"y":0.2717}]	233	2020-09-03 20:43:17.048019	2020-10-22 17:09:46.716599	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019792985178228736","GPSTimeStamp":"2020-09-01T16:00:13Z","GPSImgDirection":"206.56737518","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634366699999998","GPSLatitude":"48.462216670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"13.012424503882658","DateCreated":"2020-09-01T18:00:12+02:00"}}}}
385	[{"x":0.4675,"y":0.7617},{"x":0.4525,"y":0.5233},{"x":0.48,"y":0.2}]	180	2020-09-03 20:43:26.048919	2020-10-22 17:10:59.024483	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.076863460223387275","GPSTimeStamp":"2020-09-01T16:04:09Z","GPSImgDirection":"17.764648440000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634116700000003","GPSLatitude":"48.462208329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"9.1920039980009989","DateCreated":"2020-09-01T18:04:09+02:00"}}}}
502	[{"x":0.48,"y":0.8383},{"x":0.4725,"y":0.5833},{"x":0.4825,"y":0.4283},{"x":0.5088,"y":0.245},{"x":0.5363,"y":0.115}]	477	2020-10-19 21:52:18.619209	2020-10-19 21:52:39.180495	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.028580306106596242","GPSTimeStamp":"2020-10-18T15:05:52Z","GPSImgDirection":"94.890315049999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391616700000005","GPSLatitude":"48.447138329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.299999999999997","GPSHPositioningError":"9.420692928334125","DateCreated":"2020-10-18T17:05:51+02:00"}}}}
352	[{"x":0.4037,"y":0.8533},{"x":0.4075,"y":0.605},{"x":0.4225,"y":0.4383},{"x":0.3412,"y":0.305},{"x":0.3538,"y":0.2083}]	120	2020-09-03 20:43:21.379969	2020-10-22 16:51:27.735615	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.039257347598406461","GPSTimeStamp":"2020-09-01T15:16:34Z","GPSImgDirection":"101.69729515000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635916700000002","GPSLatitude":"48.46125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"15.882587631803933","DateCreated":"2020-09-01T17:16:33+02:00"}}}}
267	[{"x":0.365,"y":0.8783},{"x":0.3475,"y":0.7333},{"x":0.3862,"y":0.525},{"x":0.4363,"y":0.3767},{"x":0.5162,"y":0.215},{"x":0.5475,"y":0.1283}]	112	2020-09-03 20:43:09.066618	2020-10-22 16:52:53.04437	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.19659231592420842","GPSTimeStamp":"2020-09-01T15:19:25Z","GPSImgDirection":"50.09347537","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634283299999999","GPSLatitude":"48.461404999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.299999999999997","GPSHPositioningError":"5.0551461656814318","DateCreated":"2020-09-01T17:19:24+02:00"}}}}
333	[{"x":0.5813,"y":0.8},{"x":0.5575,"y":0.4133},{"x":0.5337,"y":0.1633}]	115	2020-09-03 20:43:18.426828	2020-10-22 16:55:23.898945	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21003292482165725","GPSTimeStamp":"2020-09-01T15:28:26Z","GPSImgDirection":"231.92158515999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637999999999997","GPSLatitude":"48.461328330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"5.930072142766738","DateCreated":"2020-09-01T17:28:26+02:00"}}}}
287	[{"x":0.47,"y":0.7617},{"x":0.4825,"y":0.3467},{"x":0.4888,"y":0.155}]	123	2020-09-03 20:43:11.915017	2020-10-22 16:56:20.915135	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15290364622798774","GPSTimeStamp":"2020-09-01T15:31:08Z","GPSImgDirection":"139.82210928000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638383299999999","GPSLatitude":"48.461638330000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"6.3268458274398869","DateCreated":"2020-09-01T17:31:08+02:00"}}}}
306	[{"x":0.5925,"y":0.815},{"x":0.5188,"y":0.5933},{"x":0.4875,"y":0.4033},{"x":0.4425,"y":0.2633}]	21	2020-09-03 20:43:14.644759	2020-10-22 17:01:52.896252	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.17293882374329606","GPSTimeStamp":"2020-09-01T15:40:05Z","GPSImgDirection":"128.37382885999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637033299999997","GPSLatitude":"48.461886669999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"3.9067762971363766","DateCreated":"2020-09-01T17:40:05+02:00"}}}}
451	[{"x":0.5038,"y":0.81},{"x":0.495,"y":0.4667},{"x":0.5038,"y":0.1233}]	89	2020-09-03 20:45:14.587615	2020-10-22 17:03:04.400209	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.45097115624393896","GPSTimeStamp":"2020-09-01T15:41:06Z","GPSImgDirection":"180.33879093000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637999999999997","GPSLatitude":"48.461916670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.299999999999997","GPSHPositioningError":"9.1801792828685258","DateCreated":"2020-09-01T17:41:06+02:00"}}}}
363	[{"x":0.5725,"y":0.7633},{"x":0.5913,"y":0.435},{"x":0.595,"y":0.1717}]	27	2020-09-03 20:43:22.909369	2020-10-22 17:08:46.338973	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11389227962858829","GPSTimeStamp":"2020-09-01T15:58:24Z","GPSImgDirection":"56.671112070000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632866700000006","GPSLatitude":"48.462186670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.700000000000003","GPSHPositioningError":"8.6110228716645487","DateCreated":"2020-09-01T17:58:23+02:00"}}}}
353	[{"x":0.5212,"y":0.8183},{"x":0.5212,"y":0.475},{"x":0.5,"y":0.2433},{"x":0.4838,"y":0.1433}]	166	2020-09-03 20:43:21.636651	2020-10-22 17:14:44.70424	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.077524565207362645","GPSTimeStamp":"2020-09-01T16:13:04Z","GPSImgDirection":"4.5338745099999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635783299999995","GPSLatitude":"48.462379999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.099999999999994","GPSHPositioningError":"9.1925255646288537","DateCreated":"2020-09-01T18:13:04+02:00"}}}}
503	[{"x":0.3837,"y":0.8667},{"x":0.3837,"y":0.4433},{"x":0.4113,"y":0.1583}]	506	2020-10-19 21:52:57.926932	2020-10-19 21:53:20.925375	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.059276506331989325","GPSTimeStamp":"2020-10-18T15:06:54Z","GPSImgDirection":"346.16073619999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391633300000001","GPSLatitude":"48.447066670000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"10.112441156691325","DateCreated":"2020-10-18T17:06:53+02:00"}}}}
316	[{"x":0.5837,"y":0.7933},{"x":0.5663,"y":0.6417},{"x":0.58,"y":0.48},{"x":0.5513,"y":0.38},{"x":0.5262,"y":0.29},{"x":0.5537,"y":0.1383}]	113	2020-09-03 20:43:15.883583	2020-10-22 16:52:36.188869	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.19659231592420842","GPSTimeStamp":"2020-09-01T15:19:25Z","GPSImgDirection":"50.09347537","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634283299999999","GPSLatitude":"48.461404999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.299999999999997","GPSHPositioningError":"5.0551461656814318","DateCreated":"2020-09-01T17:19:24+02:00"}}}}
442	[{"x":0.5062,"y":0.805},{"x":0.4963,"y":0.5167},{"x":0.5212,"y":0.265},{"x":0.5238,"y":0.1}]	86	2020-09-03 20:45:13.195164	2020-10-22 16:58:16.121294	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11092346161853146","GPSTimeStamp":"2020-09-01T15:35:27Z","GPSImgDirection":"251.26528926","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66393667","GPSLatitude":"48.461800000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.900000000000006","GPSHPositioningError":"4.8190930204131526","DateCreated":"2020-09-01T17:35:26+02:00"}}}}
504	[{"x":0.6763,"y":0.84},{"x":0.67,"y":0.5167},{"x":0.665,"y":0.3167},{"x":0.6512,"y":0.2533}]	479	2020-10-19 21:53:46.595686	2020-10-19 21:54:05.88851	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.059276506331989325","GPSTimeStamp":"2020-10-18T15:06:54Z","GPSImgDirection":"346.16073619999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6391633300000001","GPSLatitude":"48.447066670000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"10.112441156691325","DateCreated":"2020-10-18T17:06:53+02:00"}}}}
506	[{"x":0.3987,"y":0.7817},{"x":0.4063,"y":0.4333},{"x":0.4225,"y":0.1133}]	475	2020-10-19 21:56:23.370699	2020-10-19 21:56:56.098254	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.023874064922212595","GPSTimeStamp":"2020-10-18T15:12:07Z","GPSImgDirection":"28.166076650000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6390549999999999","GPSLatitude":"48.447086670000012","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"88.700000000000003","GPSHPositioningError":"5.6419422941590431","DateCreated":"2020-10-18T17:12:06+02:00"}}}}
412	[{"x":0.4775,"y":0.885},{"x":0.4412,"y":0.5167},{"x":0.4475,"y":0.1817}]	193	2020-09-03 20:43:29.884973	2020-10-22 17:07:29.148664	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018477449202454681","GPSTimeStamp":"2020-09-01T15:54:54Z","GPSImgDirection":"303.8252714699999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634049999999996","GPSLatitude":"48.462070000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98","GPSHPositioningError":"5.2221413957717662","DateCreated":"2020-09-01T17:54:54+02:00"}}}}
422	[{"x":0.6312,"y":0.8167},{"x":0.6338,"y":0.3267},{"x":0.6125,"y":0.1617}]	186	2020-09-03 20:43:31.523419	2020-10-22 17:07:46.697124	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.071529552318056619","GPSTimeStamp":"2020-09-01T15:56:13Z","GPSImgDirection":"144.82843792","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633699999999996","GPSLatitude":"48.462070000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.900000000000006","GPSHPositioningError":"4.8832338464760712","DateCreated":"2020-09-01T17:56:12+02:00"}}}}
273	[{"x":0.5537,"y":0.8283},{"x":0.5337,"y":0.55},{"x":0.5225,"y":0.2333}]	192	2020-09-03 20:43:09.91377	2020-10-22 17:08:13.92129	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22566017508085809","GPSTimeStamp":"2020-09-01T15:57:08Z","GPSImgDirection":"76.837219250000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632666699999996","GPSLatitude":"48.46213667","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"4.3336347197106688","DateCreated":"2020-09-01T17:57:07+02:00"}}}}
286	[{"x":0.5975,"y":0.245},{"x":0.6587,"y":0.3567},{"x":0.6512,"y":0.4867},{"x":0.5825,"y":0.605},{"x":0.46,"y":0.66},{"x":0.3613,"y":0.6717}]	26	2020-09-03 20:43:11.832075	2020-10-22 17:08:30.629165	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0049835224646217618","GPSTimeStamp":"2020-09-01T15:57:49Z","GPSImgDirection":"5.2379455600000009","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633049999999998","GPSLatitude":"48.462146670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"10.988661274472749","DateCreated":"2020-09-01T17:57:49+02:00"}}}}
505	[{"x":0.5425,"y":0.885},{"x":0.5587,"y":0.62},{"x":0.5,"y":0.3517},{"x":0.4525,"y":0.1483}]	476	2020-10-19 21:55:06.277444	2020-10-19 21:56:02.693855	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.041779741646286561","GPSTimeStamp":"2020-10-18T15:09:07Z","GPSImgDirection":"73.654449450000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6390800000000003","GPSLatitude":"48.447021670000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.299999999999997","GPSHPositioningError":"7.0256808854620072","DateCreated":"2020-10-18T17:09:06+02:00"}}}}
265	[{"x":0.6737,"y":0.7583},{"x":0.61,"y":0.5833},{"x":0.5275,"y":0.4083},{"x":0.4875,"y":0.2683},{"x":0.4338,"y":0.2367}]	195	2020-09-03 19:26:29.409872	2020-10-22 07:55:09.559066	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019590001552799639","GPSTimeStamp":"2020-09-01T09:23:12Z","GPSImgDirection":"162.30752572","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6644083299999997","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.799999999999997","GPSHPositioningError":"4.7281319814401099","DateCreated":"2020-09-01T11:23:11+02:00"}}}}
475	[{"x":0.4938,"y":0.68},{"x":0.515,"y":0.4283},{"x":0.495,"y":0.2717}]	175	2020-09-03 20:47:14.734561	2020-10-22 07:57:31.68864	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0035671633635930783","GPSTimeStamp":"2020-09-01T09:26:30Z","GPSImgDirection":"47.465637230000013","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66432","GPSLatitude":"48.462788329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.799999999999997","GPSHPositioningError":"10.566194262011752","DateCreated":"2020-09-01T11:26:30+02:00"}}}}
311	[{"x":0.4738,"y":0.735},{"x":0.48,"y":0.4917},{"x":0.5275,"y":0.31},{"x":0.5337,"y":0.245}]	172	2020-09-03 20:43:15.274958	2020-10-22 07:59:39.322364	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12778234475780956","GPSTimeStamp":"2020-09-01T09:50:16Z","GPSImgDirection":"232.56666565","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462661670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93","GPSHPositioningError":"16.66792463002399","DateCreated":"2020-09-01T11:50:15+02:00"}}}}
300	[{"x":0.6188,"y":0.7183},{"x":0.6312,"y":0.3483},{"x":0.6038,"y":0.2433}]	220	2020-09-03 20:43:13.698263	2020-10-22 08:00:15.742448	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12778234475780956","GPSTimeStamp":"2020-09-01T09:50:16Z","GPSImgDirection":"232.56666565","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462661670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93","GPSHPositioningError":"16.66792463002399","DateCreated":"2020-09-01T11:50:15+02:00"}}}}
275	[{"x":0.5913,"y":0.8033},{"x":0.5425,"y":0.455},{"x":0.5625,"y":0.2083}]	174	2020-09-03 20:43:10.117387	2020-10-22 08:00:42.1234	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029905255883599581","GPSTimeStamp":"2020-09-01T09:53:09Z","GPSImgDirection":"270.81240839999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"5.4790813458604353","DateCreated":"2020-09-01T11:53:08+02:00"}}}}
308	[{"x":0.2425,"y":0.8817},{"x":0.235,"y":0.355},{"x":0.2725,"y":0.1333}]	173	2020-09-03 20:43:14.81373	2020-10-22 08:01:04.775631	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029905255883599581","GPSTimeStamp":"2020-09-01T09:53:09Z","GPSImgDirection":"270.81240839999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66431167","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"5.4790813458604353","DateCreated":"2020-09-01T11:53:08+02:00"}}}}
307	[{"x":0.6325,"y":0.8517},{"x":0.575,"y":0.5667},{"x":0.4238,"y":0.5067},{"x":0.3275,"y":0.4183},{"x":0.3638,"y":0.1917}]	85	2020-09-03 20:43:14.714869	2020-10-22 08:01:26.233271	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.035232372575315987","GPSTimeStamp":"2020-09-01T09:53:21Z","GPSImgDirection":"313.86953728000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6643300000000001","GPSLatitude":"48.462638329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92","GPSHPositioningError":"5.2180690443156781","DateCreated":"2020-09-01T11:53:21+02:00"}}}}
272	[{"x":0.6012,"y":0.715},{"x":0.5212,"y":0.5033},{"x":0.4875,"y":0.3583},{"x":0.51,"y":0.2867}]	176	2020-09-03 20:43:09.802016	2020-10-22 08:02:02.674842	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.024772532296343609","GPSTimeStamp":"2020-09-01T10:03:02Z","GPSImgDirection":"174.96537795999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641583299999998","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.299999999999997","GPSHPositioningError":"4.7580126056054715","DateCreated":"2020-09-01T12:03:01+02:00"}}}}
387	[{"x":0.4875,"y":0.8167},{"x":0.52,"y":0.455},{"x":0.6025,"y":0.1717}]	158	2020-09-03 20:43:26.290592	2020-10-22 08:03:38.354892	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0084827113958236","GPSTimeStamp":"2020-09-01T10:08:08Z","GPSImgDirection":"142.39834982999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638999999999999","GPSLatitude":"48.462738330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.2584955158318589","DateCreated":"2020-09-01T12:08:07+02:00"}}}}
347	[{"x":0.3625,"y":0.79},{"x":0.3713,"y":0.4183},{"x":0.3812,"y":0.215},{"x":0.4188,"y":0.165}]	159	2020-09-03 20:43:20.856688	2020-10-22 08:04:14.793489	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011668536810832495","GPSTimeStamp":"2020-09-01T10:10:13Z","GPSImgDirection":"146.02148438","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639250000000003","GPSLatitude":"48.462769999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.200000000000003","GPSHPositioningError":"9.2059849600744244","DateCreated":"2020-09-01T12:10:13+02:00"}}}}
465	[{"x":0.5075,"y":0.7717},{"x":0.5162,"y":0.6567},{"x":0.355,"y":0.6067},{"x":0.2162,"y":0.555},{"x":0.2087,"y":0.3767},{"x":0.2787,"y":0.2717}]	149	2020-09-03 20:47:11.515127	2020-10-22 08:06:46.068942	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019751429571711988","GPSTimeStamp":"2020-09-01T11:05:06Z","GPSImgDirection":"338.11833171999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462978329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.599999999999994","GPSHPositioningError":"4.2553576272719056","DateCreated":"2020-09-01T13:05:06+02:00"}}}}
313	[{"x":0.495,"y":0.785},{"x":0.4988,"y":0.36},{"x":0.5313,"y":0.1767}]	147	2020-09-03 20:43:15.481285	2020-10-22 08:10:59.489228	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.054441388670619338","GPSTimeStamp":"2020-09-01T11:31:59Z","GPSImgDirection":"67.872406060000017","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632166700000006","GPSLatitude":"48.463055000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.200000000000003","GPSHPositioningError":"4.2494566693833198","DateCreated":"2020-09-01T13:31:58+02:00"}}}}
433	[{"x":0.5175,"y":0.795},{"x":0.5313,"y":0.4117},{"x":0.5062,"y":0.1533}]	143	2020-09-03 20:43:33.26214	2020-10-22 08:11:24.081154	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0018275622260678301","GPSTimeStamp":"2020-09-01T11:33:23Z","GPSImgDirection":"307.16761769000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634000000000002","GPSLatitude":"48.463013330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.5","GPSHPositioningError":"4.2002902584966035","DateCreated":"2020-09-01T13:33:22+02:00"}}}}
380	[{"x":0.6112,"y":0.7567},{"x":0.61,"y":0.4783},{"x":0.6125,"y":0.22},{"x":0.585,"y":0.1583}]	223	2020-09-03 20:43:25.309849	2020-10-22 08:11:49.613422	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0018275622260678301","GPSTimeStamp":"2020-09-01T11:33:23Z","GPSImgDirection":"307.16761769000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634000000000002","GPSLatitude":"48.463013330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.5","GPSHPositioningError":"4.2002902584966035","DateCreated":"2020-09-01T13:33:22+02:00"}}}}
472	[{"x":0.285,"y":0.7817},{"x":0.2925,"y":0.5517},{"x":0.3675,"y":0.3783},{"x":0.3762,"y":0.1783}]	144	2020-09-03 20:47:13.940905	2020-10-22 08:12:14.120328	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0031289604957932989","GPSTimeStamp":"2020-09-01T11:35:19Z","GPSImgDirection":"200.92263792000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633666700000003","GPSLatitude":"48.463108329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.400000000000006","GPSHPositioningError":"4.1334751063297475","DateCreated":"2020-09-01T13:35:19+02:00"}}}}
394	[{"x":0.5225,"y":0.755},{"x":0.535,"y":0.53},{"x":0.4587,"y":0.3283},{"x":0.4675,"y":0.21}]	145	2020-09-03 20:43:27.330896	2020-10-22 08:12:30.530359	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0031289604957932989","GPSTimeStamp":"2020-09-01T11:35:19Z","GPSImgDirection":"200.92263792000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633666700000003","GPSLatitude":"48.463108329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.400000000000006","GPSHPositioningError":"4.1334751063297475","DateCreated":"2020-09-01T13:35:19+02:00"}}}}
404	[{"x":0.8788,"y":0.5583},{"x":0.7638,"y":0.5667},{"x":0.6512,"y":0.54},{"x":0.58,"y":0.5383},{"x":0.5088,"y":0.5083},{"x":0.39,"y":0.5417},{"x":0.2575,"y":0.5767},{"x":0.1537,"y":0.5517}]	146	2020-09-03 20:43:28.905181	2020-10-22 08:13:00.747519	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0031289604957932989","GPSTimeStamp":"2020-09-01T11:35:19Z","GPSImgDirection":"200.92263792000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633666700000003","GPSLatitude":"48.463108329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.400000000000006","GPSHPositioningError":"4.1334751063297475","DateCreated":"2020-09-01T13:35:19+02:00"}}}}
340	[{"x":0.5938,"y":0.83},{"x":0.5938,"y":0.47},{"x":0.5375,"y":0.315},{"x":0.505,"y":0.145}]	160	2020-09-03 20:43:19.627973	2020-10-22 08:04:46.011112	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0099056977778837277","GPSTimeStamp":"2020-09-01T10:12:20Z","GPSImgDirection":"179.54981242000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641166700000003","GPSLatitude":"48.462886670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.400000000000006","GPSHPositioningError":"4.0258050980803528","DateCreated":"2020-09-01T12:12:19+02:00"}}}}
466	[{"x":0.6575,"y":0.855},{"x":0.6837,"y":0.6767},{"x":0.6613,"y":0.4217},{"x":0.64,"y":0.12}]	150	2020-09-03 20:47:11.679263	2020-10-22 08:07:25.866359	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010556058027161955","GPSTimeStamp":"2020-09-01T11:11:30Z","GPSImgDirection":"332.34907530000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634166700000002","GPSLatitude":"48.462830000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92","GPSHPositioningError":"3.6244654984488975","DateCreated":"2020-09-01T13:11:30+02:00"}}}}
391	[{"x":0.4288,"y":0.78},{"x":0.3575,"y":0.4967},{"x":0.3713,"y":0.3033},{"x":0.4163,"y":0.15}]	228	2020-09-03 20:43:26.959321	2020-10-22 08:14:20.501946	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.030921187244622738","GPSTimeStamp":"2020-09-01T11:44:05Z","GPSImgDirection":"214.16986062999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632083299999998","GPSLatitude":"48.463136670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.299999999999997","GPSHPositioningError":"15.748833138856476","DateCreated":"2020-09-01T13:44:05+02:00"}}}}
366	[{"x":0.5325,"y":0.835},{"x":0.5062,"y":0.265},{"x":0.5125,"y":0.1167}]	139	2020-09-03 20:43:23.413173	2020-10-22 08:16:16.70509	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02121220528821836","GPSTimeStamp":"2020-09-01T11:54:34Z","GPSImgDirection":"345.12010221000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462974999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.900000000000006","GPSHPositioningError":"4.7425863363363367","DateCreated":"2020-09-01T13:54:33+02:00"}}}}
321	[{"x":0.6338,"y":0.7483},{"x":0.6238,"y":0.4783},{"x":0.625,"y":0.3},{"x":0.62,"y":0.18}]	138	2020-09-03 20:43:16.69628	2020-10-22 08:16:30.051392	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02121220528821836","GPSTimeStamp":"2020-09-01T11:54:34Z","GPSImgDirection":"345.12010221000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462974999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.900000000000006","GPSHPositioningError":"4.7425863363363367","DateCreated":"2020-09-01T13:54:33+02:00"}}}}
454	[{"x":0.565,"y":0.7417},{"x":0.5587,"y":0.5117},{"x":0.5613,"y":0.3033}]	43	2020-09-03 20:45:15.13407	2020-10-22 08:17:46.844444	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0091818878396288956","GPSTimeStamp":"2020-09-01T12:39:39Z","GPSImgDirection":"62.884399409999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628583300000002","GPSLatitude":"48.463104999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.5","GPSHPositioningError":"7.0610638967579478","DateCreated":"2020-09-01T14:39:39+02:00"}}}}
305	[{"x":0.3675,"y":0.82},{"x":0.3362,"y":0.5433},{"x":0.3588,"y":0.3},{"x":0.3862,"y":0.1883}]	41	2020-09-03 20:43:14.551584	2020-10-22 08:20:42.736332	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.030074430637431617","GPSTimeStamp":"2020-09-01T12:57:44Z","GPSImgDirection":"165.05345912000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627416700000004","GPSLatitude":"48.463183329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.700000000000003","GPSHPositioningError":"5.5264409881061303","DateCreated":"2020-09-01T14:57:44+02:00"}}}}
401	[{"x":0.4938,"y":0.8267},{"x":0.4713,"y":0.49},{"x":0.5,"y":0.3033},{"x":0.5188,"y":0.2317}]	114	2020-09-03 20:43:28.448959	2020-10-22 16:53:38.816441	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14174170796950686","GPSTimeStamp":"2020-09-01T15:23:31Z","GPSImgDirection":"225.3848418","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637549999999997","GPSLatitude":"48.46143","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.099999999999994","GPSHPositioningError":"4.8050290719625464","DateCreated":"2020-09-01T17:23:30+02:00"}}}}
395	[{"x":0.5012,"y":0.885},{"x":0.5075,"y":0.395},{"x":0.5112,"y":0.0917}]	116	2020-09-03 20:43:27.602234	2020-10-22 16:54:25.680844	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.26531285026702717","GPSTimeStamp":"2020-09-01T15:24:55Z","GPSImgDirection":"339.04374678000011","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638216700000004","GPSLatitude":"48.461333329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.5","GPSHPositioningError":"5.2347213770320788","DateCreated":"2020-09-01T17:24:54+02:00"}}}}
445	[{"x":0.455,"y":0.78},{"x":0.45,"y":0.65},{"x":0.5238,"y":0.4667},{"x":0.44,"y":0.2983},{"x":0.3225,"y":0.1933},{"x":0.3137,"y":0.11}]	221	2020-09-03 20:45:13.513872	2020-10-22 08:05:25.637031	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0099056977778837277","GPSTimeStamp":"2020-09-01T10:12:20Z","GPSImgDirection":"179.54981242000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641166700000003","GPSLatitude":"48.462886670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.400000000000006","GPSHPositioningError":"4.0258050980803528","DateCreated":"2020-09-01T12:12:19+02:00"}}}}
381	[{"x":0.435,"y":0.8367},{"x":0.485,"y":0.5117},{"x":0.4988,"y":0.175}]	142	2020-09-03 20:43:25.394459	2020-10-22 08:10:24.25469	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012022621926642482","GPSTimeStamp":"2020-09-01T11:30:13Z","GPSImgDirection":"100.13042160000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630783299999998","GPSLatitude":"48.46298333","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.5","GPSHPositioningError":"3.9709783531409166","DateCreated":"2020-09-01T13:30:12+02:00"}}}}
354	[{"x":0.5225,"y":0.8617},{"x":0.5537,"y":0.4617},{"x":0.5513,"y":0.235}]	47	2020-09-03 20:43:21.743311	2020-10-22 08:13:34.084079	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0045873536703514156","GPSTimeStamp":"2020-09-01T11:39:26Z","GPSImgDirection":"324.66569525","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631","GPSLatitude":"48.463055000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.700000000000003","GPSHPositioningError":"4.2499816189986026","DateCreated":"2020-09-01T13:39:25+02:00"}}}}
390	[{"x":0.4938,"y":0.8117},{"x":0.4988,"y":0.3817},{"x":0.52,"y":0.1933},{"x":0.555,"y":0.1167}]	136	2020-09-03 20:43:26.831756	2020-10-22 08:13:57.598283	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012210628944300387","GPSTimeStamp":"2020-09-01T11:43:02Z","GPSImgDirection":"233.02174380999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632166700000006","GPSLatitude":"48.463119999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.5","GPSHPositioningError":"5.1496754700089529","DateCreated":"2020-09-01T13:43:02+02:00"}}}}
358	[{"x":0.5938,"y":0.8233},{"x":0.5962,"y":0.495},{"x":0.5837,"y":0.3183},{"x":0.5062,"y":0.1467}]	137	2020-09-03 20:43:22.200856	2020-10-22 08:14:54.965787	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.017593206846225291","GPSTimeStamp":"2020-09-01T11:44:59Z","GPSImgDirection":"206.27898402","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631783299999996","GPSLatitude":"48.463111670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.5","GPSHPositioningError":"6.8583447645176037","DateCreated":"2020-09-01T13:44:59+02:00"}}}}
405	[{"x":0.605,"y":0.685},{"x":0.6312,"y":0.605},{"x":0.6825,"y":0.5067},{"x":0.7137,"y":0.3383}]	229	2020-09-03 20:43:29.002378	2020-10-22 08:15:23.309181	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.023445377130431617","GPSTimeStamp":"2020-09-01T11:45:49Z","GPSImgDirection":"209.18630982999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631833299999998","GPSLatitude":"48.463121670000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.900000000000006","GPSHPositioningError":"14.337570589691092","DateCreated":"2020-09-01T13:45:48+02:00"}}}}
432	[{"x":0.38,"y":0.8517},{"x":0.4075,"y":0.535},{"x":0.39,"y":0.3617},{"x":0.4313,"y":0.1683}]	39	2020-09-03 20:43:33.159751	2020-10-22 08:21:32.247863	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.072175562392837483","GPSTimeStamp":"2020-09-01T13:01:59Z","GPSImgDirection":"231.48693835000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625383299999998","GPSLatitude":"48.463283329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.299999999999997","GPSHPositioningError":"10.078772979905942","DateCreated":"2020-09-01T15:01:58+02:00"}}}}
320	[{"x":0.4738,"y":0.8167},{"x":0.4725,"y":0.415},{"x":0.485,"y":0.1367}]	97	2020-09-03 20:43:16.555801	2020-10-22 16:55:49.955878	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.093045607219456941","GPSTimeStamp":"2020-09-01T15:29:30Z","GPSImgDirection":"217.86584481999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638083299999997","GPSLatitude":"48.461588329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94","GPSHPositioningError":"5.2690461199433338","DateCreated":"2020-09-01T17:29:30+02:00"}}}}
284	[{"x":0.72,"y":0.545},{"x":0.6425,"y":0.5867},{"x":0.4188,"y":0.5933},{"x":0.2637,"y":0.5133},{"x":0.2625,"y":0.3333},{"x":0.3075,"y":0.1433}]	235	2020-09-03 20:43:11.634621	2020-10-22 16:56:52.663439	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.03707556427870462","GPSTimeStamp":"2020-09-01T15:32:39Z","GPSImgDirection":"93.237563090000009","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638366699999998","GPSLatitude":"48.461608330000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"4.652587607333488","DateCreated":"2020-09-01T17:32:39+02:00"}}}}
460	[{"x":0.4238,"y":0.81},{"x":0.4325,"y":0.4417},{"x":0.5088,"y":0.21}]	161	2020-09-03 20:47:10.534196	2020-10-22 08:05:57.950554	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0071893511313432376","GPSTimeStamp":"2020-09-01T11:00:06Z","GPSImgDirection":"231.00778209999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641116700000005","GPSLatitude":"48.462855000000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.400000000000006","GPSHPositioningError":"11.539567966280295","DateCreated":"2020-09-01T13:00:06+02:00"}}}}
448	[{"x":0.8,"y":0.4433},{"x":0.7288,"y":0.4567},{"x":0.6462,"y":0.46},{"x":0.5725,"y":0.4183},{"x":0.515,"y":0.3917},{"x":0.38,"y":0.3717},{"x":0.2925,"y":0.3733},{"x":0.215,"y":0.3683}]	222	2020-09-03 20:45:14.14531	2020-10-22 08:07:50.053285	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029999323196318189","GPSTimeStamp":"2020-09-01T11:12:48Z","GPSImgDirection":"171.87188729000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634199999999999","GPSLatitude":"48.462903329999989","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.5","GPSHPositioningError":"3.9197500526574456","DateCreated":"2020-09-01T13:12:48+02:00"}}}}
370	[{"x":0.105,"y":0.6833},{"x":0.1225,"y":0.52},{"x":0.2313,"y":0.4933},{"x":0.3862,"y":0.475},{"x":0.5262,"y":0.4333},{"x":0.6138,"y":0.205}]	48	2020-09-03 20:43:23.833831	2020-10-22 08:08:07.540121	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.022397335632935857","GPSTimeStamp":"2020-09-01T11:18:11Z","GPSImgDirection":"242.42816167000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632866700000006","GPSLatitude":"48.46289500000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.900000000000006","GPSHPositioningError":"13.187570575899338","DateCreated":"2020-09-01T13:18:10+02:00"}}}}
441	[{"x":0.5162,"y":0.6983},{"x":0.5425,"y":0.4867},{"x":0.5863,"y":0.34},{"x":0.5913,"y":0.235},{"x":0.5675,"y":0.1767}]	133	2020-09-03 20:45:07.590769	2020-10-22 08:18:50.628031	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0063340207573066255","GPSTimeStamp":"2020-09-01T12:48:56Z","GPSImgDirection":"285.60658259000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632883299999994","GPSLatitude":"48.463178329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.900000000000006","GPSHPositioningError":"5.0866980938716946","DateCreated":"2020-09-01T14:48:55+02:00"}}}}
297	[{"x":0.5275,"y":0.8483},{"x":0.5175,"y":0.4167},{"x":0.5313,"y":0.2017},{"x":0.525,"y":0.12}]	87	2020-09-03 20:43:13.261344	2020-10-22 16:58:01.066577	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1315581947743468","GPSTimeStamp":"2020-09-01T15:34:12Z","GPSImgDirection":"318.01640339999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639666700000002","GPSLatitude":"48.461728329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.200000000000003","GPSHPositioningError":"4.4015858208955221","DateCreated":"2020-09-01T17:34:11+02:00"}}}}
383	[{"x":0.3275,"y":0.8483},{"x":0.3538,"y":0.4867},{"x":0.4475,"y":0.275},{"x":0.4938,"y":0.125}]	198	2020-09-03 20:43:25.833561	2020-10-22 17:06:35.860098	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.058897156270842896","GPSTimeStamp":"2020-09-01T15:53:24Z","GPSImgDirection":"80.443298340000013","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462125","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"5.645715267044479","DateCreated":"2020-09-01T17:53:23+02:00"}}}}
325	\N	79	2020-09-03 20:43:17.259839	2020-10-22 17:14:27.879242	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.19029724598860948","GPSTimeStamp":"2020-09-01T16:12:10Z","GPSImgDirection":"296.25936884000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635633300000001","GPSLatitude":"48.462345000000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.099999999999994","GPSHPositioningError":"4.7999586691465179","DateCreated":"2020-09-01T18:12:09+02:00"}}}}
384	[{"x":0.5112,"y":0.8017},{"x":0.4338,"y":0.5467},{"x":0.4487,"y":0.4017},{"x":0.5,"y":0.2117},{"x":0.5262,"y":0.1267}]	169	2020-09-03 20:43:25.935033	2020-10-22 17:15:57.556056	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15567186469868008","GPSTimeStamp":"2020-09-01T16:16:43Z","GPSImgDirection":"5.5561828600000016","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636383299999999","GPSLatitude":"48.462383329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.299999999999997","GPSHPositioningError":"4.8707272117962468","DateCreated":"2020-09-01T18:16:42+02:00"}}}}
361	[{"x":0.6438,"y":0.42},{"x":0.5787,"y":0.3883},{"x":0.5025,"y":0.3667},{"x":0.4412,"y":0.3883},{"x":0.3875,"y":0.4333},{"x":0.3425,"y":0.485}]	80	2020-09-03 20:43:22.739605	2020-10-22 17:16:11.08826	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014758470470195781","GPSTimeStamp":"2020-09-01T16:17:23Z","GPSImgDirection":"322.71452328000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636583299999996","GPSLatitude":"48.462375000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.299999999999997","GPSHPositioningError":"12.651575931232092","DateCreated":"2020-09-01T18:17:22+02:00"}}}}
416	[{"x":0.5275,"y":0.805},{"x":0.5325,"y":0.5017},{"x":0.5325,"y":0.305},{"x":0.5413,"y":0.1433}]	141	2020-09-03 20:43:30.500046	2020-10-22 08:08:46.159935	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0071317264808258354","GPSTimeStamp":"2020-09-01T11:20:42Z","GPSImgDirection":"232.77038570999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632216699999995","GPSLatitude":"48.463004999999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.299999999999997","GPSHPositioningError":"4.2970234525425335","DateCreated":"2020-09-01T13:20:41+02:00"}}}}
477	[{"x":0.5375,"y":0.8033},{"x":0.5625,"y":0.5017},{"x":0.5713,"y":0.2533},{"x":0.555,"y":0.1817},{"x":0.5288,"y":0.1433}]	162	2020-09-04 19:56:30.839176	2020-10-22 08:09:54.497125	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0061442186150877107","GPSTimeStamp":"2020-09-01T11:27:44Z","GPSImgDirection":"295.48345936000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632199999999999","GPSLatitude":"48.462903329999989","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"14.548550016291951","DateCreated":"2020-09-01T13:27:43+02:00"}}}}
291	[{"x":0.4525,"y":0.8283},{"x":0.4063,"y":0.5617},{"x":0.3962,"y":0.39},{"x":0.4363,"y":0.2217},{"x":0.455,"y":0.1667}]	44	2020-09-03 20:43:12.588162	2020-10-22 08:17:23.783188	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1242322624070001","GPSTimeStamp":"2020-09-01T11:58:36Z","GPSImgDirection":"320.36532593999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630050000000001","GPSLatitude":"48.463088329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92","GPSHPositioningError":"4.9442558684323759","DateCreated":"2020-09-01T13:58:36+02:00"}}}}
280	[{"x":0.6,"y":0.9717},{"x":0.64,"y":0.5883},{"x":0.6687,"y":0.34},{"x":0.6613,"y":0.1617}]	40	2020-09-03 20:43:10.839785	2020-10-22 08:21:15.455442	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.013482664708222406","GPSTimeStamp":"2020-09-01T13:00:41Z","GPSImgDirection":"91.921506610000023","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6626666699999997","GPSLatitude":"48.463330000000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"88.799999999999997","GPSHPositioningError":"13.005134544071502","DateCreated":"2020-09-01T15:00:40+02:00"}}}}
467	[{"x":0.6425,"y":0.785},{"x":0.5737,"y":0.68},{"x":0.5425,"y":0.5117},{"x":0.5525,"y":0.325},{"x":0.565,"y":0.21}]	69	2020-09-03 20:47:12.356262	2020-10-22 17:10:08.971484	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.25488775967135879","GPSTimeStamp":"2020-09-01T16:02:27Z","GPSImgDirection":"197.28914641","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634299999999995","GPSLatitude":"48.462199999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"6.5794280495462072","DateCreated":"2020-09-01T18:02:26+02:00"}}}}
349	[{"x":0.47,"y":0.78},{"x":0.4138,"y":0.6467},{"x":0.4412,"y":0.5467},{"x":0.4738,"y":0.4117},{"x":0.53,"y":0.1967}]	184	2020-09-03 20:43:21.114301	2020-10-22 17:10:25.620363	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.25488775967135879","GPSTimeStamp":"2020-09-01T16:02:27Z","GPSImgDirection":"197.28914641","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634299999999995","GPSLatitude":"48.462199999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"6.5794280495462072","DateCreated":"2020-09-01T18:02:26+02:00"}}}}
359	[{"x":0.5225,"y":0.81},{"x":0.5763,"y":0.65},{"x":0.58,"y":0.54},{"x":0.5363,"y":0.3467},{"x":0.5188,"y":0.2067}]	182	2020-09-03 20:43:22.532018	2020-10-22 17:10:43.934642	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31042724828204366","GPSTimeStamp":"2020-09-01T16:03:39Z","GPSImgDirection":"242.93817133999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.462196670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.900000000000006","GPSHPositioningError":"11.824170704435334","DateCreated":"2020-09-01T18:03:38+02:00"}}}}
411	[{"x":0.6338,"y":0.8333},{"x":0.6462,"y":0.4467},{"x":0.655,"y":0.1933}]	179	2020-09-03 20:43:29.801718	2020-10-22 17:11:39.399357	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.17961595963371332","GPSTimeStamp":"2020-09-01T16:06:42Z","GPSImgDirection":"250.77439886999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635666700000002","GPSLatitude":"48.462229999999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.599999999999994","GPSHPositioningError":"10.598370170326676","DateCreated":"2020-09-01T18:06:41+02:00"}}}}
285	[{"x":0.4963,"y":0.8583},{"x":0.4738,"y":0.5117},{"x":0.4688,"y":0.2417},{"x":0.4863,"y":0.145}]	70	2020-09-03 20:43:11.752567	2020-10-22 17:11:49.412157	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.17961595963371332","GPSTimeStamp":"2020-09-01T16:06:42Z","GPSImgDirection":"250.77439886999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635666700000002","GPSLatitude":"48.462229999999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.599999999999994","GPSHPositioningError":"10.598370170326676","DateCreated":"2020-09-01T18:06:41+02:00"}}}}
292	[{"x":0.46,"y":0.9317},{"x":0.485,"y":0.5367},{"x":0.4913,"y":0.33},{"x":0.5175,"y":0.1083}]	45	2020-09-03 20:43:12.68985	2020-10-22 08:17:04.51096	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0038689440079819402","GPSTimeStamp":"2020-09-01T11:57:10Z","GPSImgDirection":"319.25639344000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629883299999997","GPSLatitude":"48.463038330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.299999999999997","GPSHPositioningError":"4.6336432916171431","DateCreated":"2020-09-01T13:57:10+02:00"}}}}
438	[{"x":0.6775,"y":0.7283},{"x":0.6863,"y":0.395},{"x":0.6462,"y":0.235}]	42	2020-09-03 20:43:33.964429	2020-10-22 08:18:05.409068	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.036332234757256943","GPSTimeStamp":"2020-09-01T12:41:36Z","GPSImgDirection":"24.816314689999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628616700000003","GPSLatitude":"48.463178329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.099999999999994","GPSHPositioningError":"4.4668196923498575","DateCreated":"2020-09-01T14:41:35+02:00"}}}}
417	[{"x":0.4075,"y":0.775},{"x":0.4138,"y":0.49},{"x":0.4763,"y":0.27},{"x":0.5088,"y":0.16},{"x":0.4963,"y":0.1267}]	224	2020-09-03 20:43:30.656251	2020-10-22 08:19:10.904446	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.051333803684816881","GPSTimeStamp":"2020-09-01T12:49:51Z","GPSImgDirection":"310.08003234","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632799999999994","GPSLatitude":"48.463199999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.900000000000006","GPSHPositioningError":"12.01358438112087","DateCreated":"2020-09-01T14:49:51+02:00"}}}}
368	[{"x":0.3713,"y":0.7933},{"x":0.3613,"y":0.4633},{"x":0.3563,"y":0.14}]	129	2020-09-03 20:43:23.608932	2020-10-22 15:54:00.233582	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0041646277562044139","GPSTimeStamp":"2020-09-01T13:06:27Z","GPSImgDirection":"252.18344114000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.662525","GPSLatitude":"48.463046670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.5","GPSHPositioningError":"8.7534977643155916","DateCreated":"2020-09-01T15:06:27+02:00"}}}}
269	[{"x":0.3663,"y":0.8333},{"x":0.3937,"y":0.5683},{"x":0.5387,"y":0.4333},{"x":0.5487,"y":0.1417}]	37	2020-09-03 20:43:09.358572	2020-10-22 15:54:24.690398	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1563719362048718","GPSTimeStamp":"2020-09-01T13:07:17Z","GPSImgDirection":"110.83346550000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6623916700000003","GPSLatitude":"48.463111670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.200000000000003","GPSHPositioningError":"4.8593918918918915","DateCreated":"2020-09-01T15:07:16+02:00"}}}}
327	[{"x":0.7238,"y":0.795},{"x":0.7475,"y":0.53},{"x":0.7788,"y":0.3717},{"x":0.755,"y":0.2533}]	131	2020-09-03 20:43:17.528583	2020-10-22 15:56:26.21039	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.025889180599696006","GPSTimeStamp":"2020-09-01T13:09:06Z","GPSImgDirection":"193.95410156000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6626866700000003","GPSLatitude":"48.46289500000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.400000000000006","GPSHPositioningError":"4.1288800335570466","DateCreated":"2020-09-01T15:09:05+02:00"}}}}
415	[{"x":0.525,"y":0.8},{"x":0.4587,"y":0.4883},{"x":0.47,"y":0.1717}]	130	2020-09-03 20:43:30.370288	2020-10-22 15:57:13.654837	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010520919225947258","GPSTimeStamp":"2020-09-01T13:10:26Z","GPSImgDirection":"259.84294117999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627300000000003","GPSLatitude":"48.462821670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.700000000000003","GPSHPositioningError":"10.667075252812678","DateCreated":"2020-09-01T15:10:26+02:00"}}}}
423	[{"x":0.3212,"y":0.7817},{"x":0.2875,"y":0.5617},{"x":0.29,"y":0.3167},{"x":0.3175,"y":0.1867}]	132	2020-09-03 20:43:31.654505	2020-10-22 15:58:02.193219	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12640155858388044","GPSTimeStamp":"2020-09-01T13:11:36Z","GPSImgDirection":"73.582244849999981","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627049999999999","GPSLatitude":"48.462861670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.299999999999997","GPSHPositioningError":"4.5731531159719356","DateCreated":"2020-09-01T15:11:35+02:00"}}}}
336	[{"x":0.4288,"y":0.815},{"x":0.4363,"y":0.3767},{"x":0.4475,"y":0.1483}]	36	2020-09-03 20:43:19.101768	2020-10-22 15:59:14.397831	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010520919225947258","GPSTimeStamp":"2020-09-01T13:10:26Z","GPSImgDirection":"259.84294117999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627300000000003","GPSLatitude":"48.462821670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.700000000000003","GPSHPositioningError":"10.667075252812678","DateCreated":"2020-09-01T15:10:26+02:00"}}}}
403	[{"x":0.4412,"y":0.83},{"x":0.4437,"y":0.4183},{"x":0.4913,"y":0.1267}]	33	2020-09-03 20:43:28.804019	2020-10-22 15:59:57.11255	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10229159893503914","GPSTimeStamp":"2020-09-01T13:13:39Z","GPSImgDirection":"180.28170783000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66281167","GPSLatitude":"48.462604999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"4.2414083321643989","DateCreated":"2020-09-01T15:13:38+02:00"}}}}
430	[{"x":0.2512,"y":0.8117},{"x":0.2375,"y":0.6083},{"x":0.34,"y":0.4983},{"x":0.5225,"y":0.5167},{"x":0.6325,"y":0.4933},{"x":0.78,"y":0.5233},{"x":0.8275,"y":0.3867},{"x":0.8325,"y":0.305}]	178	2020-09-03 20:43:32.791996	2020-10-22 17:11:16.182256	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10621782389500921","GPSTimeStamp":"2020-09-01T16:05:21Z","GPSImgDirection":"113.00597569000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633916699999998","GPSLatitude":"48.462246669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.400000000000006","GPSHPositioningError":"10.590409150901891","DateCreated":"2020-09-01T18:05:20+02:00"}}}}
332	[{"x":0.5188,"y":0.8717},{"x":0.5188,"y":0.455},{"x":0.5212,"y":0.13}]	163	2020-09-03 20:43:18.332379	2020-10-22 17:12:15.677143	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011793705633672973","GPSTimeStamp":"2020-09-01T16:08:05Z","GPSImgDirection":"41.145874020000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635466700000001","GPSLatitude":"48.462291669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.299999999999997","GPSHPositioningError":"4.6977336230984168","DateCreated":"2020-09-01T18:08:04+02:00"}}}}
476	[{"x":0.5,"y":0.8367},{"x":0.475,"y":0.51},{"x":0.4738,"y":0.2517},{"x":0.4838,"y":0.13}]	217	2020-09-03 20:47:14.826322	2020-10-22 17:21:27.242704	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012973314139226443","GPSTimeStamp":"2020-09-01T16:21:24Z","GPSImgDirection":"286.59422283000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636116700000003","GPSLatitude":"48.462466670000012","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"8.1933486898934635","DateCreated":"2020-09-01T18:21:24+02:00"}}}}
455	[{"x":0.6625,"y":0.7983},{"x":0.6525,"y":0.5233},{"x":0.575,"y":0.3717},{"x":0.5125,"y":0.255},{"x":0.4938,"y":0.1417}]	218	2020-09-03 20:45:15.247934	2020-10-22 17:21:40.82751	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.27839294080899585","GPSTimeStamp":"2020-09-01T16:21:57Z","GPSImgDirection":"15.783966060000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.46245832999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"5.2610764686576958","DateCreated":"2020-09-01T18:21:56+02:00"}}}}
402	\N	76	2020-09-03 20:43:28.703133	2020-10-22 17:24:48.9518	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16996370256129506","GPSTimeStamp":"2020-09-01T16:26:07Z","GPSImgDirection":"83.989288310000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634383300000004","GPSLatitude":"48.462508330000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.900000000000006","GPSHPositioningError":"9.8710686204431735","DateCreated":"2020-09-01T18:26:06+02:00"}}}}
322	[{"x":0.545,"y":0.9183},{"x":0.4763,"y":0.6783},{"x":0.5175,"y":0.405},{"x":0.5787,"y":0.2383}]	177	2020-09-03 20:43:16.802821	2020-10-22 17:32:02.345351	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.049918767064557619","GPSTimeStamp":"2020-09-01T16:51:56Z","GPSImgDirection":"102.3353386","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6640666700000004","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.700000000000003","GPSHPositioningError":"4.4832489857375881","DateCreated":"2020-09-01T18:51:55+02:00"}}}}
508	[{"x":0.6412,"y":0.8133},{"x":0.6175,"y":0.6533},{"x":0.5225,"y":0.2933},{"x":0.4525,"y":0.2083}]	226	2020-10-27 10:10:54.154253	2020-10-27 10:11:18.815273	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.050399914387146909","GPSTimeStamp":"2020-10-26T13:34:37Z","GPSImgDirection":"149.03082277000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634166700000002","GPSLatitude":"48.463413329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"87.799999999999997","GPSHPositioningError":"11.779223001882595","DateCreated":"2020-10-26T14:34:37+01:00"}}}}
324	[{"x":0.6038,"y":0.78},{"x":0.58,"y":0.405},{"x":0.58,"y":0.1767}]	28	2020-09-03 20:43:17.160889	2020-10-27 10:41:21.391016	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.039670463620696907","GPSTimeStamp":"2020-09-01T14:15:29Z","GPSImgDirection":"180.45736698000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631916699999998","GPSLatitude":"48.462161670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"8.0463432609355348","DateCreated":"2020-09-01T16:15:28+02:00"}}}}
393	[{"x":0.3625,"y":0.4783},{"x":0.2437,"y":0.4733},{"x":0.1762,"y":0.4417},{"x":0.1688,"y":0.3733}]	34	2020-09-03 20:43:27.205109	2020-10-22 16:01:16.401049	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.022893533110281406","GPSTimeStamp":"2020-09-01T13:16:41Z","GPSImgDirection":"36.111968989999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628166700000002","GPSLatitude":"48.462708329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.599999999999994","GPSHPositioningError":"4.8140628433311363","DateCreated":"2020-09-01T15:16:41+02:00"}}}}
369	[{"x":0.4063,"y":0.845},{"x":0.3638,"y":0.585},{"x":0.335,"y":0.2933}]	31	2020-09-03 20:43:23.719149	2020-10-22 16:02:01.760827	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0055735092631202729","GPSTimeStamp":"2020-09-01T13:18:46Z","GPSImgDirection":"266.53277592000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462428329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"4.9489894516466704","DateCreated":"2020-09-01T15:18:46+02:00"}}}}
266	[{"x":0.545,"y":0.8517},{"x":0.5337,"y":0.4717},{"x":0.5075,"y":0.1367}]	199	2020-09-03 20:43:08.882963	2020-10-22 16:02:22.865535	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0055735092631202729","GPSTimeStamp":"2020-09-01T13:18:46Z","GPSImgDirection":"266.53277592000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629833300000003","GPSLatitude":"48.462428329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"4.9489894516466704","DateCreated":"2020-09-01T15:18:46+02:00"}}}}
342	[{"x":0.52,"y":0.8317},{"x":0.525,"y":0.4617},{"x":0.5175,"y":0.1483}]	165	2020-09-03 20:43:20.035905	2020-10-22 17:12:59.640748	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.085228353751850922","GPSTimeStamp":"2020-09-01T16:09:23Z","GPSImgDirection":"330.20085166999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.462336669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.200000000000003","GPSHPositioningError":"12.400949667616334","DateCreated":"2020-09-01T18:09:22+02:00"}}}}
413	[{"x":0.5513,"y":0.805},{"x":0.5537,"y":0.4767},{"x":0.575,"y":0.1717}]	168	2020-09-03 20:43:29.985013	2020-10-22 17:15:01.704713	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15696150059588582","GPSTimeStamp":"2020-09-01T16:13:53Z","GPSImgDirection":"73.309326170000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635383300000002","GPSLatitude":"48.462403329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"8.4062557838238021","DateCreated":"2020-09-01T18:13:52+02:00"}}}}
386	[{"x":0.5313,"y":0.805},{"x":0.5138,"y":0.755},{"x":0.5225,"y":0.6067},{"x":0.5112,"y":0.135}]	190	2020-09-03 20:43:26.175029	2020-10-22 17:16:44.097617	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11150857813327229","GPSTimeStamp":"2020-09-01T16:19:15Z","GPSImgDirection":"259.85726949999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638283300000003","GPSLatitude":"48.462441670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.200000000000003","GPSHPositioningError":"9.1217137390125771","DateCreated":"2020-09-01T18:19:14+02:00"}}}}
473	[{"x":0.6125,"y":0.8367},{"x":0.6188,"y":0.4017},{"x":0.5962,"y":0.225},{"x":0.5713,"y":0.1767}]	210	2020-09-03 20:47:14.033073	2020-10-27 10:25:44.948487	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.46515577986994078","GPSTimeStamp":"2020-09-01T13:53:59Z","GPSImgDirection":"342.09960937999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621633299999994","GPSLatitude":"48.462333329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.900000000000006","GPSHPositioningError":"15.237731622887395","DateCreated":"2020-09-01T15:53:59+02:00"}}}}
282	[{"x":0.3225,"y":0.8083},{"x":0.3862,"y":0.6433},{"x":0.6012,"y":0.5283},{"x":0.635,"y":0.24}]	209	2020-09-03 20:43:11.057285	2020-10-27 10:26:50.239983	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018118841572369787","GPSTimeStamp":"2020-09-01T13:53:20Z","GPSImgDirection":"42.087738069999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6620866699999999","GPSLatitude":"48.46237167000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.099999999999994","GPSHPositioningError":"4.1252931411557006","DateCreated":"2020-09-01T15:53:19+02:00"}}}}
527	[{"x":0.5525,"y":0.81},{"x":0.5487,"y":0.5167},{"x":0.5275,"y":0.2483},{"x":0.5138,"y":0.105}]	28	2020-10-27 10:41:28.85943	2020-10-27 10:41:52.883237	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0021529786752946074","GPSTimeStamp":"2020-10-26T14:25:45Z","GPSImgDirection":"153.75562284","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631833299999998","GPSLatitude":"48.462146670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"9.3747888048189232","DateCreated":"2020-10-26T15:25:44+01:00"}}}}
302	[{"x":0.4963,"y":0.8483},{"x":0.4888,"y":0.6117},{"x":0.4562,"y":0.565},{"x":0.4462,"y":0.36},{"x":0.47,"y":0.2017}]	208	2020-09-03 20:43:13.910241	2020-10-22 16:07:20.738991	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.009447998361583965","GPSTimeStamp":"2020-09-01T13:23:50Z","GPSImgDirection":"118.08135792","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6620116700000005","GPSLatitude":"48.462446670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.900000000000006","GPSHPositioningError":"4.2855626816776633","DateCreated":"2020-09-01T15:23:49+02:00"}}}}
462	[{"x":0.7037,"y":0.8333},{"x":0.7225,"y":0.5267},{"x":0.6887,"y":0.3},{"x":0.6625,"y":0.1683}]	72	2020-09-03 20:47:10.775991	2020-10-22 17:13:43.299546	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.011102675453247897","GPSTimeStamp":"2020-09-01T16:10:04Z","GPSImgDirection":"125.30550775000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636216699999999","GPSLatitude":"48.462311669999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.5","GPSHPositioningError":"9.245792736935341","DateCreated":"2020-09-01T18:10:04+02:00"}}}}
337	[{"x":0.5487,"y":0.8033},{"x":0.5387,"y":0.5367},{"x":0.545,"y":0.265},{"x":0.5463,"y":0.1667}]	167	2020-09-03 20:43:19.240292	2020-10-22 17:15:34.478413	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14673645808549451","GPSTimeStamp":"2020-09-01T16:15:29Z","GPSImgDirection":"79.12335204","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.462454999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.5","GPSHPositioningError":"5.9804199581392208","DateCreated":"2020-09-01T18:15:29+02:00"}}}}
474	[{"x":0.4012,"y":0.85},{"x":0.41,"y":0.595},{"x":0.3488,"y":0.4283},{"x":0.3475,"y":0.2517}]	219	2020-09-03 20:47:14.29126	2020-10-22 17:21:51.695384	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.27839294080899585","GPSTimeStamp":"2020-09-01T16:21:57Z","GPSImgDirection":"15.783966060000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.46245832999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"5.2610764686576958","DateCreated":"2020-09-01T18:21:56+02:00"}}}}
304	[{"x":0.5325,"y":0.85},{"x":0.5313,"y":0.49},{"x":0.53,"y":0.1833}]	215	2020-09-03 20:43:14.469957	2020-10-22 17:22:42.167757	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.079740270975617963","GPSTimeStamp":"2020-09-01T16:24:23Z","GPSImgDirection":"179.29981993000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635749999999994","GPSLatitude":"48.462566670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.5","GPSHPositioningError":"10.728374297618593","DateCreated":"2020-09-01T18:24:22+02:00"}}}}
463	[{"x":0.5125,"y":0.74},{"x":0.4888,"y":0.4283},{"x":0.445,"y":0.2083}]	75	2020-09-03 20:47:11.263842	2020-10-22 17:26:45.582808	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.086901605133918078","GPSTimeStamp":"2020-09-01T16:27:41Z","GPSImgDirection":"127.51781472999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634700000000002","GPSLatitude":"48.462416670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.700000000000003","GPSHPositioningError":"4.6343133306484088","DateCreated":"2020-09-01T18:27:41+02:00"}}}}
440	[{"x":0.515,"y":0.7833},{"x":0.5162,"y":0.555},{"x":0.475,"y":0.4167},{"x":0.3912,"y":0.2983},{"x":0.3563,"y":0.1717}]	156	2020-09-03 20:43:34.241131	2020-10-22 17:27:57.724371	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010091121308486545","GPSTimeStamp":"2020-09-01T16:30:23Z","GPSImgDirection":"173.28211991000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635333299999995","GPSLatitude":"48.462630000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.9926532190500739","DateCreated":"2020-09-01T18:30:22+02:00"}}}}
392	[{"x":0.4863,"y":0.7167},{"x":0.4975,"y":0.4967},{"x":0.5062,"y":0.3667},{"x":0.4988,"y":0.25},{"x":0.51,"y":0.17}]	74	2020-09-03 20:43:27.084976	2020-10-22 17:28:57.542732	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.15585859133546603","GPSTimeStamp":"2020-09-01T16:32:29Z","GPSImgDirection":"251.03739931000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634450000000003","GPSLatitude":"48.462729999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95","GPSHPositioningError":"9.1245602165087956","DateCreated":"2020-09-01T18:32:29+02:00"}}}}
317	[{"x":0.55,"y":0.8683},{"x":0.5587,"y":0.2633},{"x":0.55,"y":0.145}]	200	2020-09-03 20:43:16.113958	2020-10-22 16:18:39.885321	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.047838434575067465","GPSTimeStamp":"2020-09-01T14:07:45Z","GPSImgDirection":"167.97685242000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628366700000003","GPSLatitude":"48.462366670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.400000000000006","GPSHPositioningError":"4.4813729440638852","DateCreated":"2020-09-01T16:07:45+02:00"}}}}
364	[{"x":0.3387,"y":0.8},{"x":0.3412,"y":0.7217},{"x":0.5112,"y":0.6433},{"x":0.5825,"y":0.5883},{"x":0.5725,"y":0.4683},{"x":0.505,"y":0.3733},{"x":0.4088,"y":0.2983},{"x":0.4275,"y":0.1933}]	232	2020-09-03 20:43:23.037111	2020-10-22 16:18:57.433486	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.012533367612629369","GPSTimeStamp":"2020-09-01T14:08:46Z","GPSImgDirection":"194.62842574999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628616700000003","GPSLatitude":"48.462336669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.599999999999994","GPSHPositioningError":"4.3634561374525029","DateCreated":"2020-09-01T16:08:45+02:00"}}}}
374	[{"x":0.3387,"y":0.69},{"x":0.35,"y":0.415},{"x":0.3638,"y":0.2333},{"x":0.4,"y":0.18}]	196	2020-09-03 20:43:24.492434	2020-10-27 10:19:44.559616	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014216504063955585","GPSTimeStamp":"2020-09-01T14:03:50Z","GPSImgDirection":"81.985321099999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621866699999996","GPSLatitude":"48.462775000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.099999999999994","GPSHPositioningError":"6.9534042319921063","DateCreated":"2020-09-01T16:03:50+02:00"}}}}
378	[{"x":0.8287,"y":0.4983},{"x":0.6412,"y":0.4733},{"x":0.4825,"y":0.47},{"x":0.365,"y":0.5067},{"x":0.2587,"y":0.515},{"x":0.2437,"y":0.455}]	231	2020-09-03 20:43:25.090944	2020-10-27 10:22:02.545476	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.020953092724649416","GPSTimeStamp":"2020-09-01T14:03:08Z","GPSImgDirection":"32.445373540000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621416699999996","GPSLatitude":"48.462749999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.799999999999997","GPSHPositioningError":"4.458699391065867","DateCreated":"2020-09-01T16:03:08+02:00"}}}}
434	[{"x":0.5175,"y":0.8833},{"x":0.5787,"y":0.3483},{"x":0.6262,"y":0.0867}]	211	2020-09-03 20:43:33.363073	2020-10-27 10:27:46.524779	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.068873286247054341","GPSTimeStamp":"2020-09-01T13:52:14Z","GPSImgDirection":"264.64752199999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6619533300000002","GPSLatitude":"48.462330000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.700000000000003","GPSHPositioningError":"4.1534790427445012","DateCreated":"2020-09-01T15:52:14+02:00"}}}}
446	[{"x":0.4775,"y":0.89},{"x":0.4963,"y":0.355},{"x":0.4913,"y":0.1383}]	201	2020-09-03 20:45:13.638024	2020-10-27 10:33:33.754248	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.13172042369302064","GPSTimeStamp":"2020-09-01T14:09:56Z","GPSImgDirection":"42.406463640000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627716700000001","GPSLatitude":"48.462261669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.799999999999997","GPSHPositioningError":"16.394096138410774","DateCreated":"2020-09-01T16:09:56+02:00"}}}}
376	[{"x":0.4225,"y":0.78},{"x":0.44,"y":0.4583},{"x":0.5038,"y":0.1967}]	30	2020-09-03 20:43:24.715427	2020-10-27 10:34:19.169341	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.030352631611456668","GPSTimeStamp":"2020-09-01T14:13:14Z","GPSImgDirection":"164.81848144999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66309167","GPSLatitude":"48.462270000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"3.9424406497292797","DateCreated":"2020-09-01T16:13:14+02:00"}}}}
420	[{"x":0.8363,"y":0.3083},{"x":0.7462,"y":0.32},{"x":0.665,"y":0.535},{"x":0.5687,"y":0.5817},{"x":0.415,"y":0.5767},{"x":0.3237,"y":0.5733},{"x":0.2387,"y":0.5533},{"x":0.16,"y":0.5317},{"x":0.1037,"y":0.5183}]	29	2020-09-03 20:43:31.250204	2020-10-27 10:39:57.535449	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.071092158540919048","GPSTimeStamp":"2020-09-01T14:13:56Z","GPSImgDirection":"295.48509229000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630783299999998","GPSLatitude":"48.462128329999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.400000000000006","GPSHPositioningError":"10.226248182258846","DateCreated":"2020-09-01T16:13:55+02:00"}}}}
309	[{"x":0.5188,"y":0.8267},{"x":0.515,"y":0.485},{"x":0.52,"y":0.2117}]	90	2020-09-03 20:43:14.936171	2020-10-22 16:21:41.234166	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.20150603348819809","GPSTimeStamp":"2020-09-01T14:16:47Z","GPSImgDirection":"193.86171719999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632199999999999","GPSLatitude":"48.462078329999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.0509434282129959","DateCreated":"2020-09-01T16:16:46+02:00"}}}}
429	[{"x":0.53,"y":0.7933},{"x":0.52,"y":0.4633},{"x":0.5437,"y":0.13}]	91	2020-09-03 20:43:32.666251	2020-10-22 16:22:24.463151	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.29765296011890024","GPSTimeStamp":"2020-09-01T14:18:28Z","GPSImgDirection":"235.08839405999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632383299999995","GPSLatitude":"48.46196667000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.200000000000003","GPSHPositioningError":"6.6014733840304185","DateCreated":"2020-09-01T16:18:28+02:00"}}}}
330	[{"x":0.6062,"y":0.8633},{"x":0.585,"y":0.5983},{"x":0.6012,"y":0.36},{"x":0.5363,"y":0.1167}]	92	2020-09-03 20:43:18.069393	2020-10-22 16:24:03.420276	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.026612449441876795","GPSTimeStamp":"2020-09-01T14:22:24Z","GPSImgDirection":"214.94202413000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635499999999999","GPSLatitude":"48.461874999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.299999999999997","GPSHPositioningError":"6.2291757932286123","DateCreated":"2020-09-01T16:22:23+02:00"}}}}
294	[{"x":0.5875,"y":0.855},{"x":0.5887,"y":0.43},{"x":0.575,"y":0.1683}]	17	2020-09-03 20:43:12.883136	2020-10-22 16:27:26.512014	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.029064768926759667","GPSTimeStamp":"2020-09-01T14:29:36Z","GPSImgDirection":"194.19494629000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635199999999997","GPSLatitude":"48.461608330000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.400000000000006","GPSHPositioningError":"4.8274354997885238","DateCreated":"2020-09-01T16:29:35+02:00"}}}}
348	[{"x":0.1737,"y":0.6167},{"x":0.365,"y":0.5633},{"x":0.56,"y":0.575},{"x":0.645,"y":0.4717},{"x":0.6725,"y":0.3367},{"x":0.6613,"y":0.2467}]	99	2020-09-03 20:43:20.999853	2020-10-22 16:28:21.174839	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015027155171126844","GPSTimeStamp":"2020-09-01T14:30:50Z","GPSImgDirection":"259.79985062999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635133299999998","GPSLatitude":"48.461588329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"8.8593898448221253","DateCreated":"2020-09-01T16:30:49+02:00"}}}}
443	[{"x":0.5138,"y":0.8383},{"x":0.495,"y":0.4733},{"x":0.5012,"y":0.1617}]	24	2020-09-03 20:45:13.29638	2020-10-27 10:52:57.226899	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12668965756273398","GPSTimeStamp":"2020-09-01T14:19:07Z","GPSImgDirection":"13.262268069999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631299999999998","GPSLatitude":"48.461925000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"5.0025673463312996","DateCreated":"2020-09-01T16:19:07+02:00"}}}}
459	[{"x":0.6913,"y":0.3117},{"x":0.62,"y":0.3667},{"x":0.5763,"y":0.5483},{"x":0.4113,"y":0.5883},{"x":0.2162,"y":0.56}]	68	2020-09-03 20:47:10.23744	2020-10-27 10:56:59.4523	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019292602315384245","GPSTimeStamp":"2020-09-01T14:23:22Z","GPSImgDirection":"338.06716929000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633866700000004","GPSLatitude":"48.461829999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.5","GPSHPositioningError":"4.3904853074411525","DateCreated":"2020-09-01T16:23:21+02:00"}}}}
289	[{"x":0.305,"y":0.5867},{"x":0.435,"y":0.495},{"x":0.575,"y":0.4617},{"x":0.64,"y":0.3633},{"x":0.6825,"y":0.285}]	18	2020-09-03 20:43:12.136503	2020-10-27 10:59:36.967513	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.020021224390474709","GPSTimeStamp":"2020-09-01T14:27:43Z","GPSImgDirection":"232.44625850000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635333299999995","GPSLatitude":"48.46172","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"18.1854688470296","DateCreated":"2020-09-01T16:27:43+02:00"}}}}
425	[{"x":0.4575,"y":0.77},{"x":0.4825,"y":0.4267},{"x":0.4725,"y":0.1983}]	127	2020-09-03 20:43:31.940934	2020-10-22 16:27:50.483877	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12574183940830519","GPSTimeStamp":"2020-09-01T14:30:09Z","GPSImgDirection":"209.81430040999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635366700000001","GPSLatitude":"48.461620000000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.299999999999997","GPSHPositioningError":"7.3153970423760404","DateCreated":"2020-09-01T16:30:08+02:00"}}}}
356	[{"x":0.515,"y":0.8317},{"x":0.5188,"y":0.4333},{"x":0.5275,"y":0.195}]	15	2020-09-03 20:43:21.979379	2020-10-22 16:32:52.923348	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.31646496066079416","GPSTimeStamp":"2020-09-01T14:34:44Z","GPSImgDirection":"250.79682913000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633333299999995","GPSLatitude":"48.461521670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.900000000000006","GPSHPositioningError":"7.9008387144659693","DateCreated":"2020-09-01T16:34:44+02:00"}}}}
399	[{"x":0.5713,"y":0.8483},{"x":0.5525,"y":0.6067},{"x":0.54,"y":0.4317},{"x":0.5463,"y":0.2067}]	189	2020-09-03 20:43:28.146374	2020-10-22 17:17:00.384751	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.65165263439740573","GPSTimeStamp":"2020-09-01T16:19:47Z","GPSImgDirection":"212.31250764000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637583299999994","GPSLatitude":"48.462508330000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99","GPSHPositioningError":"7.4254130788922508","DateCreated":"2020-09-01T18:19:47+02:00"}}}}
427	[{"x":0.435,"y":0.755},{"x":0.435,"y":0.58},{"x":0.4788,"y":0.3317},{"x":0.5487,"y":0.0817}]	216	2020-09-03 20:43:32.273362	2020-10-22 17:22:14.825986	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10051354762851661","GPSTimeStamp":"2020-09-01T16:23:56Z","GPSImgDirection":"159.05798342999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635700000000004","GPSLatitude":"48.462575000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"4.8412249099330928","DateCreated":"2020-09-01T18:23:55+02:00"}}}}
271	[{"x":0.4338,"y":0.8183},{"x":0.4575,"y":0.4333},{"x":0.4475,"y":0.1167}]	77	2020-09-03 20:43:09.725049	2020-10-22 17:24:02.097733	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.035168167216557619","GPSTimeStamp":"2020-09-01T16:25:24Z","GPSImgDirection":"173.76921841999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635499999999999","GPSLatitude":"48.462555000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"11.467174641877476","DateCreated":"2020-09-01T18:25:24+02:00"}}}}
450	[{"x":0.4625,"y":0.8583},{"x":0.4788,"y":0.415},{"x":0.4738,"y":0.1517}]	23	2020-09-03 20:45:14.444203	2020-10-27 10:54:56.891098	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.23120242348920308","GPSTimeStamp":"2020-09-01T14:20:05Z","GPSImgDirection":"85.31655889999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633616700000005","GPSLatitude":"48.461916670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95","GPSHPositioningError":"4.4636293113736727","DateCreated":"2020-09-01T16:20:04+02:00"}}}}
408	[{"x":0.5787,"y":0.88},{"x":0.4788,"y":0.6033},{"x":0.4625,"y":0.11}]	96	2020-09-03 20:43:29.496963	2020-10-27 10:58:25.950845	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10093744101671455","GPSTimeStamp":"2020-09-01T14:28:38Z","GPSImgDirection":"50.302886969999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634616700000002","GPSLatitude":"48.461675","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94","GPSHPositioningError":"4.4999842465106017","DateCreated":"2020-09-01T16:28:38+02:00"}}}}
372	[{"x":0.5837,"y":0.8667},{"x":0.63,"y":0.665},{"x":0.5175,"y":0.5067},{"x":0.4587,"y":0.365},{"x":0.4325,"y":0.0817}]	104	2020-09-03 20:43:24.205189	2020-10-27 11:03:13.736002	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22296205157897275","GPSTimeStamp":"2020-09-01T14:36:29Z","GPSImgDirection":"243.41471860999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66330833","GPSLatitude":"48.461553330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"4.6398571892242781","DateCreated":"2020-09-01T16:36:28+02:00"}}}}
310	[{"x":0.5475,"y":0.8233},{"x":0.5513,"y":0.545},{"x":0.48,"y":0.4267},{"x":0.3862,"y":0.3433},{"x":0.3925,"y":0.1517}]	238	2020-09-03 20:43:15.05152	2020-10-22 16:32:03.373953	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.091560974690462274","GPSTimeStamp":"2020-09-01T14:32:05Z","GPSImgDirection":"300.69732669000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634783299999998","GPSLatitude":"48.461463330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.400000000000006","GPSHPositioningError":"4.1667193326170766","DateCreated":"2020-09-01T16:32:04+02:00"}}}}
329	[{"x":0.7462,"y":0.4783},{"x":0.47,"y":0.4},{"x":0.3688,"y":0.4167},{"x":0.1988,"y":0.6167}]	16	2020-09-03 20:43:17.944815	2020-10-22 16:32:22.275663	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1008271425289117","GPSTimeStamp":"2020-09-01T14:32:53Z","GPSImgDirection":"172.67701717","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633783299999996","GPSLatitude":"48.461505000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.799999999999997","GPSHPositioningError":"5.2664652964738332","DateCreated":"2020-09-01T16:32:53+02:00"}}}}
281	[{"x":0.6012,"y":0.8633},{"x":0.6262,"y":0.46},{"x":0.6,"y":0.2533}]	214	2020-09-03 20:43:10.945796	2020-10-22 17:23:24.689877	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.087108738726668897","GPSTimeStamp":"2020-09-01T16:24:56Z","GPSImgDirection":"169.97811900000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6635450000000001","GPSLatitude":"48.46255","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.200000000000003","GPSHPositioningError":"13.832619371016612","DateCreated":"2020-09-01T18:24:55+02:00"}}}}
469	[{"x":0.5138,"y":0.845},{"x":0.4913,"y":0.4717},{"x":0.48,"y":0.145}]	155	2020-09-03 20:47:13.029937	2020-10-22 17:27:42.535474	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16096992799661161","GPSTimeStamp":"2020-09-01T16:29:58Z","GPSImgDirection":"77.008636479999979","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66349167","GPSLatitude":"48.462661670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"5.0168562564632886","DateCreated":"2020-09-01T18:29:57+02:00"}}}}
418	[{"x":0.4925,"y":0.6717},{"x":0.4988,"y":0.6133},{"x":0.5188,"y":0.5167},{"x":0.5463,"y":0.46},{"x":0.54,"y":0.3883},{"x":0.53,"y":0.225},{"x":0.5175,"y":0.1367}]	230	2020-09-03 20:43:30.803272	2020-10-27 10:12:39.145084	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12398778645701009","GPSTimeStamp":"2020-09-01T13:59:21Z","GPSImgDirection":"25.823577910000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621633299999994","GPSLatitude":"48.462761669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.700000000000003","GPSHPositioningError":"4.3725029560022399","DateCreated":"2020-09-01T15:59:20+02:00"}}}}
452	[{"x":0.4375,"y":0.745},{"x":0.4587,"y":0.6817},{"x":0.445,"y":0.6533},{"x":0.3575,"y":0.6117},{"x":0.3113,"y":0.4733},{"x":0.3137,"y":0.3583},{"x":0.34,"y":0.25},{"x":0.3675,"y":0.19}]	205	2020-09-03 20:45:14.702762	2020-10-27 10:14:41.904113	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.017648220063726686","GPSTimeStamp":"2020-09-01T14:00:07Z","GPSImgDirection":"35.495056179999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621716700000002","GPSLatitude":"48.462761669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.099999999999994","GPSHPositioningError":"9.9685219475002729","DateCreated":"2020-09-01T16:00:06+02:00"}}}}
464	[{"x":0.4562,"y":0.835},{"x":0.4775,"y":0.45},{"x":0.475,"y":0.2317}]	204	2020-09-03 20:47:11.394255	2020-10-27 10:16:43.313114	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.16128106428957323","GPSTimeStamp":"2020-09-01T14:00:35Z","GPSImgDirection":"55.615539569999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621133299999995","GPSLatitude":"48.46280333","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.200000000000003","GPSHPositioningError":"6.3844057665260197","DateCreated":"2020-09-01T16:00:35+02:00"}}}}
382	[{"x":0.6512,"y":0.9},{"x":0.64,"y":0.515},{"x":0.6038,"y":0.2217},{"x":0.5525,"y":0.125}]	203	2020-09-03 20:43:25.5381	2020-10-27 10:18:40.602415	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0060664257006283846","GPSTimeStamp":"2020-09-01T14:01:44Z","GPSImgDirection":"359.49194312999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621699999999997","GPSLatitude":"48.462820000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.599999999999994","GPSHPositioningError":"4.7787745294353225","DateCreated":"2020-09-01T16:01:43+02:00"}}}}
379	[{"x":0.655,"y":0.7917},{"x":0.6787,"y":0.58},{"x":0.6863,"y":0.5133},{"x":0.6375,"y":0.3817},{"x":0.605,"y":0.285},{"x":0.5913,"y":0.2467}]	102	2020-09-03 20:43:25.196881	2020-10-22 16:36:48.902107	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21534779653336356","GPSTimeStamp":"2020-09-01T14:39:26Z","GPSImgDirection":"184.82858289999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632716700000003","GPSLatitude":"48.461620000000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"4.6159732766474342","DateCreated":"2020-09-01T16:39:25+02:00"}}}}
419	[{"x":0.6062,"y":0.84},{"x":0.61,"y":0.5217},{"x":0.5813,"y":0.3167},{"x":0.5325,"y":0.1183}]	103	2020-09-03 20:43:30.944575	2020-10-22 16:37:36.179688	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.26825070377339227","GPSTimeStamp":"2020-09-01T14:40:52Z","GPSImgDirection":"328.42602539000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632166700000006","GPSLatitude":"48.461508330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"13.146074914490699","DateCreated":"2020-09-01T16:40:52+02:00"}}}}
468	[{"x":0.405,"y":0.84},{"x":0.4213,"y":0.4183},{"x":0.4325,"y":0.1867}]	109	2020-09-03 20:47:12.887322	2020-10-22 16:37:56.017223	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11717549704133012","GPSTimeStamp":"2020-09-01T14:41:27Z","GPSImgDirection":"356.34841954000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631833299999998","GPSLatitude":"48.461505000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.200000000000003","GPSHPositioningError":"5.7452584685956243","DateCreated":"2020-09-01T16:41:27+02:00"}}}}
400	[{"x":0.5337,"y":0.8367},{"x":0.5275,"y":0.6683},{"x":0.555,"y":0.2767}]	10	2020-09-03 20:43:28.255468	2020-10-22 16:38:37.570344	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.05346066501711691","GPSTimeStamp":"2020-09-01T14:42:36Z","GPSImgDirection":"163.01194766","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630700000000003","GPSLatitude":"48.46142167","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"4.4484508656325463","DateCreated":"2020-09-01T16:42:36+02:00"}}}}
345	[{"x":0.7538,"y":0.5933},{"x":0.6188,"y":0.5683},{"x":0.5112,"y":0.535},{"x":0.4325,"y":0.4133},{"x":0.3663,"y":0.3083}]	11	2020-09-03 20:43:20.418341	2020-10-22 16:38:55.124631	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.13987381758072476","GPSTimeStamp":"2020-09-01T14:43:11Z","GPSImgDirection":"49.400268549999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629550000000002","GPSLatitude":"48.46143","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97","GPSHPositioningError":"8.1016579308483117","DateCreated":"2020-09-01T16:43:10+02:00"}}}}
343	[{"x":0.2162,"y":0.4917},{"x":0.5725,"y":0.46},{"x":0.8612,"y":0.45}]	12	2020-09-03 20:43:20.186461	2020-10-22 16:40:00.772624	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.21919184918214585","GPSTimeStamp":"2020-09-01T14:44:34Z","GPSImgDirection":"18.120239259999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628716700000004","GPSLatitude":"48.461411669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.599999999999994","GPSHPositioningError":"5.518480148694354","DateCreated":"2020-09-01T16:44:33+02:00"}}}}
377	[{"x":0.5375,"y":0.865},{"x":0.5363,"y":0.5967},{"x":0.5088,"y":0.4433},{"x":0.5325,"y":0.215},{"x":0.5463,"y":0.11}]	66	2020-09-03 20:43:24.916022	2020-10-27 11:06:48.905905	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12581816322356312","GPSTimeStamp":"2020-09-01T14:38:09Z","GPSImgDirection":"301.29003905999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633133299999998","GPSLatitude":"48.461536670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.0036695075757578","DateCreated":"2020-09-01T16:38:09+02:00"}}}}
371	[{"x":0.49,"y":0.8833},{"x":0.52,"y":0.6233},{"x":0.425,"y":0.5083},{"x":0.395,"y":0.4167},{"x":0.435,"y":0.2717}]	14	2020-09-03 20:43:24.021995	2020-10-27 11:07:37.231323	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12581816322356312","GPSTimeStamp":"2020-09-01T14:38:09Z","GPSImgDirection":"301.29003905999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633133299999998","GPSLatitude":"48.461536670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"7.0036695075757578","DateCreated":"2020-09-01T16:38:09+02:00"}}}}
295	[{"x":0.5012,"y":0.7717},{"x":0.57,"y":0.4583},{"x":0.5313,"y":0.3033},{"x":0.445,"y":0.2017}]	106	2020-09-03 20:43:12.969104	2020-10-22 16:40:28.189438	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.042608253616156014","GPSTimeStamp":"2020-09-01T14:45:05Z","GPSImgDirection":"265.78387458000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.662855","GPSLatitude":"48.461400000000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.900000000000006","GPSHPositioningError":"6.4285719043495639","DateCreated":"2020-09-01T16:45:04+02:00"}}}}
328	[{"x":0.5537,"y":0.79},{"x":0.5487,"y":0.4933},{"x":0.5212,"y":0.23},{"x":0.505,"y":0.1467}]	60	2020-09-03 20:43:17.676112	2020-10-22 16:46:13.547484	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.043312981706750867","GPSTimeStamp":"2020-09-01T14:59:43Z","GPSImgDirection":"73.87155147","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633583299999999","GPSLatitude":"48.460841670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"101.2","GPSHPositioningError":"4.2884836117842111","DateCreated":"2020-09-01T16:59:42+02:00"}}}}
431	[{"x":0.61,"y":0.1717},{"x":0.5725,"y":0.3233},{"x":0.49,"y":0.47},{"x":0.405,"y":0.6433},{"x":0.3513,"y":0.8417}]	152	2020-09-03 20:43:33.058935	2020-10-22 17:28:35.271468	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.069582052533674582","GPSTimeStamp":"2020-09-01T16:31:44Z","GPSImgDirection":"221.24232488999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634499999999997","GPSLatitude":"48.462666670000011","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"5.6906091500589167","DateCreated":"2020-09-01T18:31:44+02:00"}}}}
509	[{"x":0.455,"y":0.7517},{"x":0.4637,"y":0.685},{"x":0.53,"y":0.615},{"x":0.6312,"y":0.5933},{"x":0.6737,"y":0.5167},{"x":0.685,"y":0.415},{"x":0.6725,"y":0.3017},{"x":0.6525,"y":0.195}]	230	2020-10-27 10:13:03.227877	2020-10-27 10:13:32.476908	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015451250602240457","GPSTimeStamp":"2020-10-26T13:39:14Z","GPSImgDirection":"44.231201170000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621616700000006","GPSLatitude":"48.462763329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"4.9481251316621027","DateCreated":"2020-10-26T14:39:14+01:00"}}}}
523	[{"x":0.5,"y":0.8683},{"x":0.4925,"y":0.6617},{"x":0.495,"y":0.4417},{"x":0.5038,"y":0.1517}]	73	2020-10-27 10:32:37.714455	2020-10-27 10:33:13.058412	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12149875610760118","GPSTimeStamp":"2020-10-26T14:13:07Z","GPSImgDirection":"244.35456832","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632383299999995","GPSLatitude":"48.462775000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93","GPSHPositioningError":"9.0592785139161851","DateCreated":"2020-10-26T15:13:06+01:00"}}}}
510	[{"x":0.4363,"y":0.7483},{"x":0.4288,"y":0.6833},{"x":0.3463,"y":0.6267},{"x":0.275,"y":0.595},{"x":0.2125,"y":0.5},{"x":0.185,"y":0.4183},{"x":0.2162,"y":0.33},{"x":0.28,"y":0.2283}]	205	2020-10-27 10:15:09.929434	2020-10-27 10:16:09.140363	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.015451250602240457","GPSTimeStamp":"2020-10-26T13:39:14Z","GPSImgDirection":"44.231201170000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621616700000006","GPSLatitude":"48.462763329999994","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.900000000000006","GPSHPositioningError":"4.9481251316621027","DateCreated":"2020-10-26T14:39:14+01:00"}}}}
525	[{"x":0.4863,"y":0.79},{"x":0.48,"y":0.525},{"x":0.5138,"y":0.2967},{"x":0.565,"y":0.1367}]	30	2020-10-27 10:39:21.328375	2020-10-27 10:39:40.059316	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.094161689240346597","GPSTimeStamp":"2020-10-26T14:23:56Z","GPSImgDirection":"164.47733306000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631116700000002","GPSLatitude":"48.462229999999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.400000000000006","GPSHPositioningError":"4.7256621645325385","DateCreated":"2020-10-26T15:23:56+01:00"}}}}
519	[{"x":0.4675,"y":0.8533},{"x":0.4813,"y":0.5383},{"x":0.5075,"y":0.2767},{"x":0.5162,"y":0.1233}]	211	2020-10-27 10:27:56.073028	2020-10-27 10:28:14.96712	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.12481474124891138","GPSTimeStamp":"2020-10-26T13:55:30Z","GPSImgDirection":"273.95693979999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6619450000000002","GPSLatitude":"48.462294999999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93","GPSHPositioningError":"4.5703878443072226","DateCreated":"2020-10-26T14:55:30+01:00"}}}}
521	[{"x":0.515,"y":0.8367},{"x":0.52,"y":0.6783},{"x":0.4763,"y":0.4517},{"x":0.41,"y":0.2583},{"x":0.37,"y":0.1317}]	213	2020-10-27 10:30:16.504298	2020-10-27 10:30:46.112159	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.052868291694116457","GPSTimeStamp":"2020-10-26T13:58:19Z","GPSImgDirection":"84.638855049999989","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6618166699999999","GPSLatitude":"48.462341670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.700000000000003","GPSHPositioningError":"11.932755280878148","DateCreated":"2020-10-26T14:58:18+01:00"}}}}
290	[{"x":0.4188,"y":0.7767},{"x":0.41,"y":0.4983},{"x":0.4575,"y":0.2483},{"x":0.5,"y":0.13}]	107	2020-09-03 20:43:12.257348	2020-10-22 16:41:18.489436	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.020565554500085466","GPSTimeStamp":"2020-09-01T14:46:22Z","GPSImgDirection":"94.113431420000012","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627866700000005","GPSLatitude":"48.461463330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.200000000000003","GPSHPositioningError":"13.626882776686314","DateCreated":"2020-09-01T16:46:22+02:00"}}}}
334	[{"x":0.5288,"y":0.655},{"x":0.5713,"y":0.4917},{"x":0.6225,"y":0.335}]	7	2020-09-03 20:43:18.548004	2020-10-22 16:44:40.865956	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.035522412543916013","GPSTimeStamp":"2020-09-01T14:56:05Z","GPSImgDirection":"173.90283203000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630799999999999","GPSLatitude":"48.461208329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99","GPSHPositioningError":"5.5893990441118859","DateCreated":"2020-09-01T16:56:04+02:00"}}}}
355	[{"x":0.5363,"y":0.8367},{"x":0.5325,"y":0.5233},{"x":0.53,"y":0.2467},{"x":0.5487,"y":0.17}]	61	2020-09-03 20:43:21.869664	2020-10-22 16:45:37.962503	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10681958498582089","GPSTimeStamp":"2020-09-01T14:57:48Z","GPSImgDirection":"215.42632293000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631166700000004","GPSLatitude":"48.461016670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.400000000000006","GPSHPositioningError":"4.5235042229529911","DateCreated":"2020-09-01T16:57:47+02:00"}}}}
283	[{"x":0.51,"y":0.8917},{"x":0.485,"y":0.6083},{"x":0.5,"y":0.3783},{"x":0.5225,"y":0.15}]	153	2020-09-03 20:43:11.273067	2020-10-22 17:29:15.730234	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.060316365249100674","GPSTimeStamp":"2020-09-01T16:33:43Z","GPSImgDirection":"82.054931639999992","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632716700000003","GPSLatitude":"48.462628329999987","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.5","GPSHPositioningError":"4.6488346818017146","DateCreated":"2020-09-01T18:33:43+02:00"}}}}
511	[{"x":0.5238,"y":0.8433},{"x":0.5275,"y":0.6433},{"x":0.4988,"y":0.3533},{"x":0.4725,"y":0.19}]	204	2020-10-27 10:16:59.003262	2020-10-27 10:17:18.720496	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0068440102102627015","GPSTimeStamp":"2020-10-26T13:42:46Z","GPSImgDirection":"64.680114720000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621466700000003","GPSLatitude":"48.462791670000009","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.799999999999997","GPSHPositioningError":"6.7008692687915463","DateCreated":"2020-10-26T14:42:45+01:00"}}}}
513	[{"x":0.2762,"y":0.7283},{"x":0.2787,"y":0.5233},{"x":0.2838,"y":0.235},{"x":0.3038,"y":0.1767}]	196	2020-10-27 10:20:19.894663	2020-10-27 10:20:40.52687	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0022683162239026688","GPSTimeStamp":"2020-10-26T13:45:18Z","GPSImgDirection":"105.87227249","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621950000000005","GPSLatitude":"48.462749999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"89.799999999999997","GPSHPositioningError":"4.5472242783123615","DateCreated":"2020-10-26T14:45:18+01:00"}}}}
514	[{"x":0.7163,"y":0.4817},{"x":0.5262,"y":0.4883},{"x":0.2813,"y":0.485},{"x":0.195,"y":0.4617},{"x":0.1988,"y":0.4167}]	231	2020-10-27 10:22:14.173567	2020-10-27 10:22:51.169157	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.045960441211398154","GPSTimeStamp":"2020-10-26T13:46:29Z","GPSImgDirection":"35.103637700000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621883300000002","GPSLatitude":"48.46271333","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.099999999999994","GPSHPositioningError":"6.9919310132429935","DateCreated":"2020-10-26T14:46:28+01:00"}}}}
517	[{"x":0.6675,"y":0.8383},{"x":0.6737,"y":0.6733},{"x":0.6475,"y":0.475},{"x":0.6225,"y":0.17}]	210	2020-10-27 10:26:02.615264	2020-10-27 10:26:25.228982	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014493088241599847","GPSTimeStamp":"2020-10-26T13:52:50Z","GPSImgDirection":"337.19641125000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621666700000004","GPSLatitude":"48.462288329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.299999999999997","GPSHPositioningError":"4.7831449312001153","DateCreated":"2020-10-26T14:52:49+01:00"}}}}
436	[{"x":0.5487,"y":0.8967},{"x":0.5775,"y":0.4517},{"x":0.5975,"y":0.18}]	3	2020-09-03 20:43:33.62075	2020-10-22 16:41:57.555298	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.031011726724588143","GPSTimeStamp":"2020-09-01T14:48:34Z","GPSImgDirection":"278.58912656000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625666699999999","GPSLatitude":"48.461229999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.900000000000006","GPSHPositioningError":"5.4118173429154668","DateCreated":"2020-09-01T16:48:33+02:00"}}}}
278	[{"x":0.5887,"y":0.815},{"x":0.5737,"y":0.5933},{"x":0.5275,"y":0.4833},{"x":0.4637,"y":0.4067},{"x":0.435,"y":0.2717},{"x":0.4363,"y":0.1917}]	244	2020-09-03 20:43:10.468419	2020-10-22 16:47:29.201522	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.018974101162771845","GPSTimeStamp":"2020-09-01T15:03:36Z","GPSImgDirection":"67.032745360000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6640299999999995","GPSLatitude":"48.460761669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.3","GPSHPositioningError":"4.4114744081843673","DateCreated":"2020-09-01T17:03:35+02:00"}}}}
288	[{"x":0.5787,"y":0.8133},{"x":0.5525,"y":0.4733},{"x":0.5463,"y":0.185}]	125	2020-09-03 20:43:12.022253	2020-10-22 16:48:10.037288	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.027648534610559928","GPSTimeStamp":"2020-09-01T15:06:44Z","GPSImgDirection":"122.43084721","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6642049999999999","GPSLatitude":"48.460888330000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.599999999999994","GPSHPositioningError":"4.5238286103651451","DateCreated":"2020-09-01T17:06:44+02:00"}}}}
410	[{"x":0.575,"y":0.8367},{"x":0.5188,"y":0.69},{"x":0.5337,"y":0.3617}]	81	2020-09-03 20:43:29.696855	2020-10-22 17:29:40.976382	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.01135986951145721","GPSTimeStamp":"2020-09-01T16:47:58Z","GPSImgDirection":"107.79288285","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639333299999999","GPSLatitude":"48.462405000000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"4.1697055051178227","DateCreated":"2020-09-01T18:47:57+02:00"}}}}
299	[{"x":0.405,"y":0.8},{"x":0.4063,"y":0.4517},{"x":0.3937,"y":0.2183}]	25	2020-09-03 20:43:13.583996	2020-10-27 10:51:59.49292	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.1343562155188977","GPSTimeStamp":"2020-09-01T14:17:55Z","GPSImgDirection":"314.54125998000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632283299999999","GPSLatitude":"48.46194667000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.799999999999997","GPSHPositioningError":"4.6404626481522673","DateCreated":"2020-09-01T16:17:54+02:00"}}}}
516	[{"x":0.4213,"y":0.795},{"x":0.4225,"y":0.7317},{"x":0.3925,"y":0.6333},{"x":0.4025,"y":0.5},{"x":0.4188,"y":0.35},{"x":0.415,"y":0.24},{"x":0.4288,"y":0.1533}]	207	2020-10-27 10:25:02.610281	2020-10-27 10:25:25.126179	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.20297598829462027","GPSTimeStamp":"2020-10-26T13:49:14Z","GPSImgDirection":"222.36154187000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6622333300000003","GPSLatitude":"48.462528329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.400000000000006","GPSHPositioningError":"4.8313420716854196","DateCreated":"2020-10-26T14:49:13+01:00"}}}}
522	[{"x":0.4512,"y":0.8767},{"x":0.43,"y":0.5583},{"x":0.4625,"y":0.2733},{"x":0.4763,"y":0.1417}]	35	2020-10-27 10:31:40.193328	2020-10-27 10:32:07.600486	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.024744879455891627","GPSTimeStamp":"2020-10-26T14:09:33Z","GPSImgDirection":"81.777801539999984","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6627966700000001","GPSLatitude":"48.46268332999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.200000000000003","GPSHPositioningError":"18.351472995090017","DateCreated":"2020-10-26T15:09:33+01:00"}}}}
524	[{"x":0.4863,"y":0.8383},{"x":0.4913,"y":0.5367},{"x":0.4788,"y":0.3417},{"x":0.465,"y":0.1583}]	201	2020-10-27 10:33:43.844193	2020-10-27 10:34:01.274158	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.020554574188002953","GPSTimeStamp":"2020-10-26T14:20:26Z","GPSImgDirection":"52.039672799999991","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66280333","GPSLatitude":"48.462241670000004","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"93.200000000000003","GPSHPositioningError":"5.6584016098893199","DateCreated":"2020-10-26T15:20:26+01:00"}}}}
303	[{"x":0.6088,"y":0.8933},{"x":0.6262,"y":0.2883},{"x":0.6288,"y":0.1683}]	2	2020-09-03 20:43:14.164997	2020-10-22 16:43:16.017233	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.010111357085194724","GPSTimeStamp":"2020-09-01T14:50:14Z","GPSImgDirection":"44.531646729999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6625450000000002","GPSLatitude":"48.461166669999997","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.700000000000003","GPSHPositioningError":"7.0968249168430599","DateCreated":"2020-09-01T16:50:14+02:00"}}}}
341	[{"x":0.5425,"y":0.8367},{"x":0.4562,"y":0.6317},{"x":0.4188,"y":0.3967},{"x":0.4275,"y":0.235}]	82	2020-09-03 20:43:19.88968	2020-10-22 17:30:23.684488	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.084289811534337983","GPSTimeStamp":"2020-09-01T16:48:48Z","GPSImgDirection":"224.77153024999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6640466700000003","GPSLatitude":"48.462354999999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.700000000000003","GPSHPositioningError":"7.7187549880287314","DateCreated":"2020-09-01T18:48:47+02:00"}}}}
409	[{"x":0.4888,"y":0.7233},{"x":0.505,"y":0.4767},{"x":0.5012,"y":0.24},{"x":0.49,"y":0.1617}]	157	2020-09-03 20:43:29.610172	2020-10-22 17:32:56.799315	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.055502265736116163","GPSTimeStamp":"2020-09-01T16:53:11Z","GPSImgDirection":"241.72735590000002","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638700000000002","GPSLatitude":"48.462671669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.5","GPSHPositioningError":"4.1091511267909855","DateCreated":"2020-09-01T18:53:11+02:00"}}}}
279	[{"x":0.6,"y":0.8667},{"x":0.5437,"y":0.455},{"x":0.5188,"y":0.1817}]	212	2020-09-03 20:43:10.714358	2020-10-27 10:28:41.759108	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.090715140154644894","GPSTimeStamp":"2020-09-01T13:51:04Z","GPSImgDirection":"61.645843499999991","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6617866700000001","GPSLatitude":"48.462366670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.200000000000003","GPSHPositioningError":"6.2448392469590672","DateCreated":"2020-09-01T15:51:03+02:00"}}}}
296	[{"x":0.4562,"y":0.8417},{"x":0.445,"y":0.7067},{"x":0.4188,"y":0.67},{"x":0.3725,"y":0.3433},{"x":0.3688,"y":0.1467}]	213	2020-09-03 20:43:13.070933	2020-10-27 10:30:05.753165	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.090889818959303703","GPSTimeStamp":"2020-09-01T13:50:22Z","GPSImgDirection":"77.46194457","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6617333300000001","GPSLatitude":"48.462379999999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.400000000000006","GPSHPositioningError":"4.758561151079137","DateCreated":"2020-09-01T15:50:22+02:00"}}}}
528	[{"x":0.4562,"y":0.8433},{"x":0.4587,"y":0.63},{"x":0.4363,"y":0.3783},{"x":0.425,"y":0.245}]	25	2020-10-27 10:52:14.268904	2020-10-27 10:52:36.771273	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.07817999271820561","GPSTimeStamp":"2020-10-26T14:26:55Z","GPSImgDirection":"310.21958925999996","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632449999999999","GPSLatitude":"48.46194667000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"5.6281584204959456","DateCreated":"2020-10-26T15:26:54+01:00"}}}}
277	[{"x":0.6462,"y":0.755},{"x":0.6362,"y":0.5267},{"x":0.5125,"y":0.3783},{"x":0.465,"y":0.1833},{"x":0.4763,"y":0.14}]	22	2020-09-03 20:43:10.306558	2020-10-27 10:53:58.079151	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.061645239578892133","GPSTimeStamp":"2020-09-01T14:21:09Z","GPSImgDirection":"82.748077429999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6634549999999999","GPSLatitude":"48.461961670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"4.4070837308059208","DateCreated":"2020-09-01T16:21:08+02:00"}}}}
531	[{"x":0.4838,"y":0.8633},{"x":0.4612,"y":0.65},{"x":0.455,"y":0.33},{"x":0.4575,"y":0.1667}]	23	2020-10-27 10:55:15.249748	2020-10-27 10:55:36.755025	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014499979092754193","GPSTimeStamp":"2020-10-26T14:30:11Z","GPSImgDirection":"82.815460229999985","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633550000000001","GPSLatitude":"48.4619","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.900000000000006","GPSHPositioningError":"12.029074820257565","DateCreated":"2020-10-26T15:30:10+01:00"}}}}
458	[{"x":0.4338,"y":0.8233},{"x":0.4562,"y":0.4883},{"x":0.4938,"y":0.1617},{"x":0.4988,"y":0.12}]	94	2020-09-03 20:45:15.607977	2020-10-27 10:55:57.676779	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.052530284983877067","GPSTimeStamp":"2020-09-01T14:24:43Z","GPSImgDirection":"36.325408940000003","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6632633299999999","GPSLatitude":"48.46181167000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.900000000000006","GPSHPositioningError":"11.633081719724318","DateCreated":"2020-09-01T16:24:43+02:00"}}}}
276	[{"x":0.2062,"y":0.5567},{"x":0.3412,"y":0.4717},{"x":0.4975,"y":0.4033},{"x":0.6512,"y":0.3933},{"x":0.7662,"y":0.4167}]	84	2020-09-03 20:43:10.206095	2020-10-22 17:31:39.576444	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.20431724189632125","GPSTimeStamp":"2020-09-01T16:50:57Z","GPSImgDirection":"74.356201170000006","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6641783299999995","GPSLatitude":"48.462575000000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.599999999999994","GPSHPositioningError":"10.324453134547232","DateCreated":"2020-09-01T18:50:56+02:00"}}}}
526	[{"x":0.9313,"y":0.67},{"x":0.9313,"y":0.525},{"x":0.8688,"y":0.4067},{"x":0.695,"y":0.4233},{"x":0.4913,"y":0.465},{"x":0.3038,"y":0.4683},{"x":0.1462,"y":0.46}]	29	2020-10-27 10:40:08.174586	2020-10-27 10:41:03.730298	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.043364334816012949","GPSTimeStamp":"2020-10-26T14:25:00Z","GPSImgDirection":"293.02807596999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631799999999997","GPSLatitude":"48.462166670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96","GPSHPositioningError":"5.5250283607487241","DateCreated":"2020-10-26T15:24:59+01:00"}}}}
507	[{"x":0.4512,"y":0.835},{"x":0.435,"y":0.5483},{"x":0.4175,"y":0.3883},{"x":0.4125,"y":0.1}]	197	2020-10-27 10:07:49.606123	2020-10-27 10:09:36.016424	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0078220153192410744","GPSTimeStamp":"2020-10-26T13:23:18Z","GPSImgDirection":"238.52420051999994","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631883299999997","GPSLatitude":"48.463305000000005","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"88.200000000000003","GPSHPositioningError":"5.2833646420371529","DateCreated":"2020-10-26T14:23:18+01:00"}}}}
529	[{"x":0.4587,"y":0.7883},{"x":0.4637,"y":0.5567},{"x":0.4637,"y":0.34},{"x":0.4775,"y":0.195}]	24	2020-10-27 10:53:13.080981	2020-10-27 10:53:37.222399	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.044975459557614124","GPSTimeStamp":"2020-10-26T14:27:58Z","GPSImgDirection":"356.77954102000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6631549999999997","GPSLatitude":"48.461911669999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"10.216491056113698","DateCreated":"2020-10-26T15:27:58+01:00"}}}}
512	[{"x":0.62,"y":0.8233},{"x":0.58,"y":0.5867},{"x":0.5637,"y":0.345},{"x":0.555,"y":0.2283},{"x":0.5175,"y":0.1533}]	203	2020-10-27 10:18:52.372413	2020-10-27 10:19:21.519011	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.023077970369243989","GPSTimeStamp":"2020-10-26T13:43:46Z","GPSImgDirection":"18.600158690000004","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621966700000002","GPSLatitude":"48.462788329999995","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92.099999999999994","GPSHPositioningError":"5.2041621213392633","DateCreated":"2020-10-26T14:43:46+01:00"}}}}
515	[{"x":0.7712,"y":0.5},{"x":0.6725,"y":0.5883},{"x":0.5212,"y":0.57},{"x":0.43,"y":0.4983},{"x":0.3588,"y":0.505},{"x":0.305,"y":0.5133},{"x":0.2762,"y":0.44},{"x":0.2625,"y":0.3183}]	231	2020-10-27 10:23:41.875895	2020-10-27 10:24:25.068714	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.11726865910180599","GPSTimeStamp":"2020-10-26T13:47:26Z","GPSImgDirection":"90.544212689999981","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621883300000002","GPSLatitude":"48.462729999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"90.099999999999994","GPSHPositioningError":"15.002478698683191","DateCreated":"2020-10-26T14:47:26+01:00"}}}}
518	[{"x":0.37,"y":0.8183},{"x":0.375,"y":0.5733},{"x":0.4037,"y":0.425},{"x":0.5075,"y":0.3783},{"x":0.59,"y":0.3867},{"x":0.64,"y":0.3467},{"x":0.6637,"y":0.25},{"x":0.675,"y":0.1583}]	209	2020-10-27 10:27:04.556496	2020-10-27 10:27:30.643558	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.013231756165611527","GPSTimeStamp":"2020-10-26T13:53:57Z","GPSImgDirection":"45.405364989999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6621449999999998","GPSLatitude":"48.462341670000008","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.400000000000006","GPSHPositioningError":"17.790219435736677","DateCreated":"2020-10-26T14:53:56+01:00"}}}}
520	[{"x":0.535,"y":0.8533},{"x":0.51,"y":0.52},{"x":0.4925,"y":0.2417},{"x":0.49,"y":0.175}]	212	2020-10-27 10:29:11.96442	2020-10-27 10:29:45.206069	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10934019087433648","GPSTimeStamp":"2020-10-26T13:57:00Z","GPSImgDirection":"38.513244619999995","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6617950000000001","GPSLatitude":"48.462333329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"91.5","GPSHPositioningError":"5.9330205742708566","DateCreated":"2020-10-26T14:57:00+01:00"}}}}
532	[{"x":0.4088,"y":0.8},{"x":0.4113,"y":0.5667},{"x":0.4275,"y":0.3},{"x":0.4437,"y":0.21}]	94	2020-10-27 10:56:10.232519	2020-10-27 10:56:37.626611	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14912439887487525","GPSTimeStamp":"2020-10-26T14:32:18Z","GPSImgDirection":"39.813415530000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633299999999998","GPSLatitude":"48.46183332999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"6.6167162091274703","DateCreated":"2020-10-26T15:32:17+01:00"}}}}
533	[{"x":0.6887,"y":0.3033},{"x":0.645,"y":0.3433},{"x":0.6225,"y":0.4667},{"x":0.575,"y":0.54},{"x":0.44,"y":0.5383},{"x":0.265,"y":0.5283}]	68	2020-10-27 10:57:11.140171	2020-10-27 10:58:03.764776	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.063948310940374273","GPSTimeStamp":"2020-10-26T14:33:42Z","GPSImgDirection":"350.17742946999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633916699999998","GPSLatitude":"48.461821670000006","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"5.9243522178304788","DateCreated":"2020-10-26T15:33:42+01:00"}}}}
537	[{"x":0.6488,"y":0.8717},{"x":0.7037,"y":0.6633},{"x":0.6262,"y":0.5467},{"x":0.5012,"y":0.445},{"x":0.4537,"y":0.26},{"x":0.4125,"y":0.145}]	104	2020-10-27 11:03:20.999397	2020-10-27 11:04:11.042294	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.032271042460856603","GPSTimeStamp":"2020-10-26T14:39:26Z","GPSImgDirection":"244.66557309999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633216700000002","GPSLatitude":"48.461538329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"5.0136577225418293","DateCreated":"2020-10-26T15:39:26+01:00"}}}}
539	[{"x":0.3887,"y":0.7917},{"x":0.3613,"y":0.645},{"x":0.4113,"y":0.4917},{"x":0.4225,"y":0.3583},{"x":0.3725,"y":0.1817}]	237	2020-10-27 11:05:42.500561	2020-10-27 11:06:20.010722	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.032271042460856603","GPSTimeStamp":"2020-10-26T14:39:26Z","GPSImgDirection":"244.66557309999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633216700000002","GPSLatitude":"48.461538329999996","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"5.0136577225418293","DateCreated":"2020-10-26T15:39:26+01:00"}}}}
540	[{"x":0.5387,"y":0.8467},{"x":0.54,"y":0.6883},{"x":0.48,"y":0.525},{"x":0.4888,"y":0.3117},{"x":0.5337,"y":0.0983}]	66	2020-10-27 11:06:55.363999	2020-10-27 11:07:22.728254	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.041610181348025146","GPSTimeStamp":"2020-10-26T14:40:20Z","GPSImgDirection":"291.33929459000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66329167","GPSLatitude":"48.461516670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.099999999999994","GPSHPositioningError":"9.4455742785202403","DateCreated":"2020-10-26T15:40:19+01:00"}}}}
544	[{"x":0.62,"y":0.7183},{"x":0.615,"y":0.4667},{"x":0.63,"y":0.3283},{"x":0.635,"y":0.275}]	110	2020-10-27 11:14:31.604166	2020-10-27 11:15:36.23741	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0048773111730962887","GPSTimeStamp":"2020-10-26T14:54:41Z","GPSImgDirection":"75.161773699999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629533299999997","GPSLatitude":"48.461283329999986","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.099999999999994","GPSHPositioningError":"5.2394952517236897","DateCreated":"2020-10-26T15:54:41+01:00"}}}}
549	[{"x":0.51,"y":0.84},{"x":0.4637,"y":0.64},{"x":0.4725,"y":0.44},{"x":0.5375,"y":0.2117}]	64	2020-10-27 11:19:06.930447	2020-10-27 11:19:32.850464	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.51418524974454527","GPSTimeStamp":"2020-10-26T15:05:10Z","GPSImgDirection":"220.15341201000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629700000000005","GPSLatitude":"48.461311670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.400000000000006","GPSHPositioningError":"10.314037965783923","DateCreated":"2020-10-26T16:05:09+01:00"}}}}
535	[{"x":0.3025,"y":0.79},{"x":0.38,"y":0.5133},{"x":0.5425,"y":0.4817},{"x":0.6488,"y":0.3617},{"x":0.695,"y":0.23}]	18	2020-10-27 10:59:47.417935	2020-10-27 11:00:12.521164	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.094103083059873069","GPSTimeStamp":"2020-10-26T14:37:02Z","GPSImgDirection":"226.90858469000005","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6636116700000003","GPSLatitude":"48.461728329999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.299999999999997","GPSHPositioningError":"7.4200059145349693","DateCreated":"2020-10-26T15:37:02+01:00"}}}}
536	[{"x":0.3912,"y":0.81},{"x":0.3887,"y":0.525},{"x":0.4175,"y":0.2433},{"x":0.4387,"y":0.1183}]	100	2020-10-27 11:00:48.484144	2020-10-27 11:01:08.698657	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.026960710066341521","GPSTimeStamp":"2020-10-26T14:38:17Z","GPSImgDirection":"104.10142517999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663395","GPSLatitude":"48.461570000000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.200000000000003","GPSHPositioningError":"4.7335451384726053","DateCreated":"2020-10-26T15:38:17+01:00"}}}}
541	[{"x":0.55,"y":0.8317},{"x":0.5513,"y":0.7067},{"x":0.4425,"y":0.58},{"x":0.3862,"y":0.4667},{"x":0.4163,"y":0.3133}]	14	2020-10-27 11:07:43.215337	2020-10-27 11:08:06.674234	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.041610181348025146","GPSTimeStamp":"2020-10-26T14:40:20Z","GPSImgDirection":"291.33929459000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66329167","GPSLatitude":"48.461516670000002","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"96.099999999999994","GPSHPositioningError":"9.4455742785202403","DateCreated":"2020-10-26T15:40:19+01:00"}}}}
542	[{"x":0.5012,"y":0.8533},{"x":0.4788,"y":0.765},{"x":0.4863,"y":0.5317},{"x":0.5,"y":0.3333},{"x":0.4938,"y":0.2},{"x":0.49,"y":0.1317}]	63	2020-10-27 11:08:29.346807	2020-10-27 11:08:50.197368	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.026858143502858683","GPSTimeStamp":"2020-10-26T14:42:47Z","GPSImgDirection":"120.41172596000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630283300000004","GPSLatitude":"48.461453329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.5","GPSHPositioningError":"5.6533528765115424","DateCreated":"2020-10-26T15:42:46+01:00"}}}}
548	[{"x":0.5525,"y":0.8383},{"x":0.5038,"y":0.7383},{"x":0.5038,"y":0.625},{"x":0.49,"y":0.375},{"x":0.475,"y":0.1533}]	124	2020-10-27 11:18:25.161896	2020-10-27 11:18:45.314788	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.23188211018965776","GPSTimeStamp":"2020-10-26T15:03:09Z","GPSImgDirection":"162.76432806","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630616700000003","GPSLatitude":"48.461208329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.599999999999994","GPSHPositioningError":"8.2174003755476743","DateCreated":"2020-10-26T16:03:08+01:00"}}}}
543	\N	6	2020-10-27 11:09:16.030258	2020-10-27 11:09:51.33834	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.046940319239020936","GPSTimeStamp":"2020-10-26T14:50:30Z","GPSImgDirection":"113.36723137000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628966699999999","GPSLatitude":"48.461283329999986","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.599999999999994","GPSHPositioningError":"8.4851248042737399","DateCreated":"2020-10-26T15:50:29+01:00"}}}}
545	[{"x":0.3387,"y":0.835},{"x":0.3175,"y":0.6933},{"x":0.37,"y":0.53},{"x":0.4213,"y":0.3667},{"x":0.4238,"y":0.2633},{"x":0.4163,"y":0.1383}]	111	2020-10-27 11:15:50.552752	2020-10-27 11:16:21.244342	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0048773111730962887","GPSTimeStamp":"2020-10-26T14:54:41Z","GPSImgDirection":"75.161773699999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6629533299999997","GPSLatitude":"48.461283329999986","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.099999999999994","GPSHPositioningError":"5.2394952517236897","DateCreated":"2020-10-26T15:54:41+01:00"}}}}
546	[{"x":0.5288,"y":0.9083},{"x":0.5275,"y":0.68},{"x":0.4575,"y":0.5333},{"x":0.3325,"y":0.4967},{"x":0.2313,"y":0.4467},{"x":0.1675,"y":0.395}]	4	2020-10-27 11:16:49.418341	2020-10-27 11:17:13.26387	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.014165590528671276","GPSTimeStamp":"2020-10-26T14:56:11Z","GPSImgDirection":"265.75788869999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628166700000002","GPSLatitude":"48.461236669999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"99.799999999999997","GPSHPositioningError":"4.9404845752922943","DateCreated":"2020-10-26T15:56:10+01:00"}}}}
339	[{"x":0.4188,"y":0.8283},{"x":0.4387,"y":0.4083},{"x":0.4975,"y":0.0983}]	100	2020-09-03 20:43:19.476015	2020-10-27 11:00:29.30666	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.35021072619488702","GPSTimeStamp":"2020-09-01T14:35:37Z","GPSImgDirection":"105.79767040999999","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6633699999999996","GPSLatitude":"48.461604999999999","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.099999999999994","GPSHPositioningError":"4.8485138563155123","DateCreated":"2020-09-01T16:35:36+02:00"}}}}
360	[{"x":0.61,"y":0.855},{"x":0.6512,"y":0.61},{"x":0.6062,"y":0.4217},{"x":0.5487,"y":0.2633},{"x":0.5525,"y":0.185}]	101	2020-09-03 20:43:22.635688	2020-10-27 11:04:27.690847	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22296205157897275","GPSTimeStamp":"2020-09-01T14:36:29Z","GPSImgDirection":"243.41471860999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66330833","GPSLatitude":"48.461553330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"4.6398571892242781","DateCreated":"2020-09-01T16:36:28+02:00"}}}}
444	[{"x":0.3912,"y":0.7967},{"x":0.3775,"y":0.6383},{"x":0.445,"y":0.4917},{"x":0.4437,"y":0.35},{"x":0.3762,"y":0.2667},{"x":0.3862,"y":0.1017}]	237	2020-09-03 20:45:13.39879	2020-10-27 11:05:32.441502	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.22296205157897275","GPSTimeStamp":"2020-09-01T14:36:29Z","GPSImgDirection":"243.41471860999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.66330833","GPSLatitude":"48.461553330000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.700000000000003","GPSHPositioningError":"4.6398571892242781","DateCreated":"2020-09-01T16:36:28+02:00"}}}}
435	[{"x":0.5687,"y":0.8217},{"x":0.5825,"y":0.7667},{"x":0.5813,"y":0.4283},{"x":0.5487,"y":0.2167}]	110	2020-09-03 20:43:33.516038	2020-10-27 11:14:06.96082	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.042961738981795394","GPSTimeStamp":"2020-09-01T14:53:02Z","GPSImgDirection":"71.878082280000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628833299999997","GPSLatitude":"48.461196670000007","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"101","GPSHPositioningError":"5.3392727512703759","DateCreated":"2020-09-01T16:53:01+02:00"}}}}
547	[{"x":0.5112,"y":0.8267},{"x":0.5062,"y":0.5567},{"x":0.4913,"y":0.3333},{"x":0.4938,"y":0.2017},{"x":0.5125,"y":0.125}]	5	2020-10-27 11:17:34.68198	2020-10-27 11:18:04.084248	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.10658605401047966","GPSTimeStamp":"2020-10-26T14:58:20Z","GPSImgDirection":"229.2688599","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6628949999999998","GPSLatitude":"48.461296670000003","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.299999999999997","GPSHPositioningError":"12.583128870195116","DateCreated":"2020-10-26T15:58:20+01:00"}}}}
550	[{"x":0.6438,"y":0.76},{"x":0.6225,"y":0.575},{"x":0.55,"y":0.4217},{"x":0.4662,"y":0.345},{"x":0.45,"y":0.195}]	8	2020-10-27 11:19:55.428884	2020-10-27 11:20:48.29479	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.019314937302532066","GPSTimeStamp":"2020-10-26T15:06:52Z","GPSImgDirection":"197.92826840999993","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6630450000000003","GPSLatitude":"48.461278329999992","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"97.099999999999994","GPSHPositioningError":"4.9376331590160758","DateCreated":"2020-10-26T16:06:51+01:00"}}}}
456	[{"x":0.3613,"y":0.8333},{"x":0.3875,"y":0.4417},{"x":0.3862,"y":0.2083}]	126	2020-09-03 20:45:15.401371	2020-10-27 11:22:03.021997	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14884082972188328","GPSTimeStamp":"2020-09-01T15:11:54Z","GPSImgDirection":"330.57759104000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663875","GPSLatitude":"48.461028329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.3398308278547804","DateCreated":"2020-09-01T17:11:54+02:00"}}}}
471	[{"x":0.69,"y":0.7983},{"x":0.67,"y":0.52},{"x":0.6162,"y":0.195}]	49	2020-09-03 20:47:13.592136	2020-10-27 11:23:07.929166	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.14884082972188328","GPSTimeStamp":"2020-09-01T15:11:54Z","GPSImgDirection":"330.57759104000007","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.663875","GPSLatitude":"48.461028329999991","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"95.799999999999997","GPSHPositioningError":"4.3398308278547804","DateCreated":"2020-09-01T17:11:54+02:00"}}}}
555	\N	53	2020-10-27 11:26:29.526497	2020-10-27 11:26:38.401577	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.143230542502016","GPSTimeStamp":"2020-10-26T16:27:44Z","GPSImgDirection":"159.84018692000001","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6645466700000005","GPSLatitude":"48.461046670000009","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"92","GPSHPositioningError":"5.3799807042932946","DateCreated":"2020-10-26T17:27:43+01:00"}}}}
556	[{"x":0.5463,"y":0.7967},{"x":0.52,"y":0.55},{"x":0.49,"y":0.3333},{"x":0.4913,"y":0.2283}]	56	2020-10-27 11:27:08.037955	2020-10-27 11:27:25.591775	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.053877457945236726","GPSTimeStamp":"2020-10-26T16:35:20Z","GPSImgDirection":"155.06645963","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6640583299999996","GPSLatitude":"48.460796670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.799999999999997","GPSHPositioningError":"4.7444660118032269","DateCreated":"2020-10-26T17:35:19+01:00"}}}}
470	[{"x":0.5763,"y":0.9033},{"x":0.5825,"y":0.68},{"x":0.5375,"y":0.555},{"x":0.4213,"y":0.4983},{"x":0.355,"y":0.4417}]	57	2020-09-03 20:47:13.1449	2020-10-27 11:27:41.963442	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.025365725159983473","GPSTimeStamp":"2020-09-01T15:02:29Z","GPSImgDirection":"67.761962889999992","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6638449999999998","GPSLatitude":"48.460819999999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.5","GPSHPositioningError":"6.7606173810460088","DateCreated":"2020-09-01T17:02:29+02:00"}}}}
373	[{"x":0.205,"y":0.8417},{"x":0.2125,"y":0.6067},{"x":0.3337,"y":0.475},{"x":0.535,"y":0.4017},{"x":0.6825,"y":0.375},{"x":0.7238,"y":0.28}]	58	2020-09-03 20:43:24.357977	2020-10-27 11:28:40.494357	f	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.013690051621794794","GPSTimeStamp":"2020-09-01T15:01:38Z","GPSImgDirection":"27.990447999999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637300000000002","GPSLatitude":"48.460796670000001","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.5","GPSHPositioningError":"3.9521587030716723","DateCreated":"2020-09-01T17:01:37+02:00"}}}}
552	[{"x":0.37,"y":0.7867},{"x":0.39,"y":0.5083},{"x":0.3887,"y":0.2433}]	126	2020-10-27 11:22:11.360407	2020-10-27 11:22:50.969286	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0360610969290397","GPSTimeStamp":"2020-10-26T16:11:10Z","GPSImgDirection":"322.76548766999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639250000000003","GPSLatitude":"48.46104167","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"5.5354454203262238","DateCreated":"2020-10-26T17:11:10+01:00"}}}}
553	[{"x":0.6038,"y":0.8},{"x":0.6062,"y":0.5817},{"x":0.5913,"y":0.3383},{"x":0.5825,"y":0.2133}]	49	2020-10-27 11:23:14.426794	2020-10-27 11:23:36.396024	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0360610969290397","GPSTimeStamp":"2020-10-26T16:11:10Z","GPSImgDirection":"322.76548766999997","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6639250000000003","GPSLatitude":"48.46104167","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"98.900000000000006","GPSHPositioningError":"5.5354454203262238","DateCreated":"2020-10-26T17:11:10+01:00"}}}}
554	[{"x":0.3162,"y":0.7383},{"x":0.3825,"y":0.6867},{"x":0.43,"y":0.54},{"x":0.4512,"y":0.3783},{"x":0.4512,"y":0.2317}]	245	2020-10-27 11:24:43.025202	2020-10-27 11:25:59.885069	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.0041482215750620315","GPSTimeStamp":"2020-10-26T16:16:45Z","GPSImgDirection":"239.00137325","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6646533299999997","GPSLatitude":"48.460983329999998","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"94.400000000000006","GPSHPositioningError":"5.3190918943585652","DateCreated":"2020-10-26T17:16:45+01:00"}}}}
557	[{"x":0.585,"y":0.8117},{"x":0.5913,"y":0.67},{"x":0.5275,"y":0.5317},{"x":0.4163,"y":0.4733},{"x":0.375,"y":0.4133}]	57	2020-10-27 11:27:50.310502	2020-10-27 11:28:18.733055	t	{"xmpmeta":{"xmlns:x":"adobe:ns:meta/","x:xmptk":"XMP Core 5.4.0","RDF":{"xmlns:rdf":"http://www.w3.org/1999/02/22-rdf-syntax-ns#","Description":{"rdf:about":"","xmlns:exif":"http://ns.adobe.com/exif/1.0/","xmlns:photoshop":"http://ns.adobe.com/photoshop/1.0/","GPSSpeedRef":"K","GPSSpeed":"0.02674935387259586","GPSTimeStamp":"2020-10-26T16:36:44Z","GPSImgDirection":"67.47000122999998","GPSLongitudeRef":"E","GPSAltitudeRef":"0","GPSLongitude":"2.6637949999999999","GPSLatitude":"48.460779999999993","GPSLatitudeRef":"N","GPSImgDirectionRef":"T","GPSAltitude":"100.59999999999999","GPSHPositioningError":"5.4752012181857737","DateCreated":"2020-10-26T17:36:44+01:00"}}}}
\.


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 890, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 890, true);


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.areas_id_seq', 4, true);


--
-- Name: boulders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.boulders_id_seq', 487, true);


--
-- Name: circuits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.circuits_id_seq', 16, true);


--
-- Name: pois_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.pois_id_seq', 3, true);


--
-- Name: problems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.problems_id_seq', 526, true);


--
-- Name: topos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nicolas
--

SELECT pg_catalog.setval('public.topos_id_seq', 558, true);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: boulders boulders_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.boulders
    ADD CONSTRAINT boulders_pkey PRIMARY KEY (id);


--
-- Name: circuits circuits_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.circuits
    ADD CONSTRAINT circuits_pkey PRIMARY KEY (id);


--
-- Name: pois pois_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.pois
    ADD CONSTRAINT pois_pkey PRIMARY KEY (id);


--
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: topos topos_pkey; Type: CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.topos
    ADD CONSTRAINT topos_pkey PRIMARY KEY (id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_boulders_on_area_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_boulders_on_area_id ON public.boulders USING btree (area_id);


--
-- Name: index_circuits_on_area_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_circuits_on_area_id ON public.circuits USING btree (area_id);


--
-- Name: index_pois_on_area_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_pois_on_area_id ON public.pois USING btree (area_id);


--
-- Name: index_pois_on_location; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_pois_on_location ON public.pois USING gist (location);


--
-- Name: index_problems_on_area_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_problems_on_area_id ON public.problems USING btree (area_id);


--
-- Name: index_problems_on_circuit_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_problems_on_circuit_id ON public.problems USING btree (circuit_id);


--
-- Name: index_problems_on_location; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_problems_on_location ON public.problems USING gist (location);


--
-- Name: index_problems_on_tags; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_problems_on_tags ON public.problems USING gin (tags);


--
-- Name: index_topos_on_problem_id; Type: INDEX; Schema: public; Owner: nicolas
--

CREATE INDEX index_topos_on_problem_id ON public.topos USING btree (problem_id);


--
-- Name: boulders fk_rails_2e5c243105; Type: FK CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.boulders
    ADD CONSTRAINT fk_rails_2e5c243105 FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- Name: circuits fk_rails_b52d84e673; Type: FK CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.circuits
    ADD CONSTRAINT fk_rails_b52d84e673 FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: problems fk_rails_d3a7f4c434; Type: FK CONSTRAINT; Schema: public; Owner: nicolas
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT fk_rails_d3a7f4c434 FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- PostgreSQL database dump complete
--

