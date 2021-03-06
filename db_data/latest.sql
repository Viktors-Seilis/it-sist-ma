--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id bigint NOT NULL,
    "user" bigint NOT NULL,
    document_type bigint NOT NULL,
    education_type bigint,
    "issueDate" date,
    "validDate" date,
    education_facility bigint NOT NULL,
    faculty bigint,
    program bigint,
    specialization bigint,
    qualification bigint,
    courses bigint,
    theme bigint,
    "fileName" character varying(255),
    type integer,
    archived smallint DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    upbringing bigint DEFAULT 0,
    children_rights bigint DEFAULT 0,
    additional_courses bigint DEFAULT 0
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    date_from date NOT NULL,
    date_to date NOT NULL,
    time_from character varying(255) NOT NULL,
    time_to character varying(255) NOT NULL,
    place_id bigint NOT NULL,
    count integer NOT NULL,
    user_id bigint NOT NULL,
    contact_information character varying(255) NOT NULL,
    notes text,
    it json NOT NULL,
    economic_issues json NOT NULL,
    relations_specialist integer NOT NULL,
    status_it smallint,
    status_as smallint,
    status_sa smallint,
    status_md smallint,
    comment_it text,
    comment_as text,
    comment_sa text,
    comment_md text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp without time zone NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts integer NOT NULL,
    reserved_at bigint,
    available_at bigint NOT NULL,
    created_at bigint NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id bigint NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_permissions OWNER TO postgres;

--
-- Name: model_has_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE public.model_has_roles OWNER TO postgres;

--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id bigint,
    client_id character(36) NOT NULL,
    name character varying(255),
    scopes text,
    revoked smallint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    expires_at timestamp without time zone
);


ALTER TABLE public.oauth_access_tokens OWNER TO postgres;

--
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id bigint NOT NULL,
    client_id character(36) NOT NULL,
    scopes text,
    revoked smallint NOT NULL,
    expires_at timestamp without time zone
);


ALTER TABLE public.oauth_auth_codes OWNER TO postgres;

--
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_clients (
    id character(36) NOT NULL,
    user_id bigint,
    name character varying(255) NOT NULL,
    secret character varying(100),
    provider character varying(255),
    redirect text NOT NULL,
    personal_access_client smallint NOT NULL,
    password_client smallint NOT NULL,
    revoked smallint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.oauth_clients OWNER TO postgres;

--
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_personal_access_clients (
    id bigint NOT NULL,
    client_id character(36) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.oauth_personal_access_clients OWNER TO postgres;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_personal_access_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_personal_access_clients_id_seq OWNER TO postgres;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_personal_access_clients_id_seq OWNED BY public.oauth_personal_access_clients.id;


--
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked smallint NOT NULL,
    expires_at timestamp without time zone
);


ALTER TABLE public.oauth_refresh_tokens OWNER TO postgres;

--
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    id bigint NOT NULL,
    type integer NOT NULL,
    value character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.options OWNER TO postgres;

--
-- Name: COLUMN options.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.options.type IS '0 - document type, 1 - education type, 2 - education facility, 3 - faculty';


--
-- Name: options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.options_id_seq OWNER TO postgres;

--
-- Name: options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.options_id_seq OWNED BY public.options.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    display_name character varying(255) NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.positions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.positions OWNER TO postgres;

--
-- Name: positions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.positions_id_seq OWNER TO postgres;

--
-- Name: positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.id;


--
-- Name: regulations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regulations (
    id bigint NOT NULL,
    type integer NOT NULL,
    name character varying(255) NOT NULL,
    file character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.regulations OWNER TO postgres;

--
-- Name: regulations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regulations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regulations_id_seq OWNER TO postgres;

--
-- Name: regulations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regulations_id_seq OWNED BY public.regulations.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.role_has_permissions OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: user_positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_positions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    position_id bigint NOT NULL,
    department bigint,
    start date NOT NULL,
    "end" date,
    type smallint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.user_positions OWNER TO postgres;

--
-- Name: user_positions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_positions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_positions_id_seq OWNER TO postgres;

--
-- Name: user_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_positions_id_seq OWNED BY public.user_positions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    personal_code character varying(255),
    email character varying(255),
    email_verified_at timestamp without time zone,
    password character varying(255),
    remember_token character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    phone character varying(255),
    gender smallint,
    education_type bigint,
    grade bigint,
    qual bigint,
    edu smallint,
    rights smallint,
    courses smallint,
    short_courses smallint,
    category integer,
    status integer,
    agreement character varying(255),
    agreement_date date,
    comment text,
    archived integer DEFAULT 0 NOT NULL,
    birthdate date
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: COLUMN users.gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.users.gender IS '0 - male, 1 - female';


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
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
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: oauth_personal_access_clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_personal_access_clients_id_seq'::regclass);


--
-- Name: options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options ALTER COLUMN id SET DEFAULT nextval('public.options_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: positions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions ALTER COLUMN id SET DEFAULT nextval('public.positions_id_seq'::regclass);


--
-- Name: regulations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regulations ALTER COLUMN id SET DEFAULT nextval('public.regulations_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: user_positions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_positions ALTER COLUMN id SET DEFAULT nextval('public.user_positions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id, "user", document_type, education_type, "issueDate", "validDate", education_facility, faculty, program, specialization, qualification, courses, theme, "fileName", type, archived, created_at, updated_at, upbringing, children_rights, additional_courses) FROM stdin;
1	59	1	2	1979-06-30	\N	3	4	\N	2599	2185	\N	\N	\N	\N	1	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
3	59	5	6	2018-09-14	\N	8	4	916	\N	\N	1227	\N	\N	\N	1	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
4	503	1	35	2020-12-23	\N	10	4	917	\N	493	\N	\N	dpGJrMVJC6wxQWsbE1slnVhgCxKmtbtLmUnJa6GH.pdf	\N	1	2021-04-09 15:19:16	2021-11-25 14:32:01	0	0	0
5	503	1	11	2016-07-01	\N	12	37	918	2600	2526	\N	\N	f6btxFrhkCfpdaoPHoAJiLo6L9fLypI0HebXn4WZ.pdf	\N	0	2021-04-09 15:19:16	2021-12-02 10:24:47	0	0	0
6	503	13	6	2020-12-21	2023-12-20	10	4	\N	\N	\N	808	809	ESNl5oaTzfgKorgIML43SVssQM0Dr2RrdUNCFXA0.pdf	\N	0	2021-04-09 15:19:16	2021-10-14 06:55:40	0	0	72
7	503	5	6	2020-12-21	\N	10	4	\N	\N	\N	805	806	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
8	431	1	14	2007-06-21	\N	15	4	\N	\N	2187	\N	\N	5ifke6mp8BTOR9LfHfsOghKOox8gTvhW0zt12Iig.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:31	0	0	0
9	431	1	16	1985-02-28	\N	17	4	\N	2601	2188	\N	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
10	431	501	6	2019-03-15	2021-03-14	18	4	\N	\N	\N	843	1120	ropCxU6mswNJjAGXi3ePuaIXdZ3UsiFrVL5S8p6d.pdf	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	8	0
11	431	501	6	2020-09-22	2023-09-21	19	4	\N	\N	\N	1228	1121	eVKn8ut86HOcC6gCPtiBqVpUhKxhRjsEVOWdiUNQ.pdf	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	16
12	431	501	6	2020-05-29	2023-05-28	20	4	\N	\N	\N	879	1122	au6kamZxtYsjWojQeknxV0r0K5myFkjt8m7wl5qp.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	12
13	431	501	6	2019-11-28	2022-11-27	21	4	\N	\N	\N	1229	882	GyXgGEXyZdL6QCuzgZEIYCwayOXJIB85cHzsHEWS.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	36
14	431	501	6	2019-11-04	2022-11-03	12	4	\N	\N	\N	1230	1123	nbWuCJl2K6Q8AJF351cQSvswu7Y3sskHfyUberMl.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	12
15	431	501	6	2019-09-06	2022-09-05	12	4	\N	\N	\N	810	1124	NPvxSWgul3vQYV2k5GE8R2jAyqS0a2xkbRiQn4J5.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	12
16	23	1	11	1998-06-08	\N	22	4	\N	\N	2189	\N	\N	zcNx1noRSIui25niuNzN4uaVdLybW8IW9UbrF9he.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:31	0	0	0
17	23	1	35	1978-06-21	\N	23	4	\N	\N	862	\N	\N	fqu1zoTdiL0gx3wKTIJm57Z0Zq3FWLgdL8NzQOH0.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:31	0	0	0
18	23	13	6	2017-06-03	2020-06-02	10	4	\N	\N	2190	1231	809	jfPye3af1IpSHbZDMM6hTMCwSu08KM2oSI22AE42.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:31	0	0	72
19	23	501	6	2017-12-28	2020-12-27	12	4	\N	\N	\N	810	1125	HX3aF0DTdez49m3msHrnCl3GnKsZ4ND6WJoKendK.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	8	0
20	23	501	6	2019-09-06	2022-09-05	12	4	\N	\N	\N	843	1126	PFwSNiKdSSNtUVyo6TCpWzhB7Avp0o1iQMr6P4oI.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	2
21	23	5	6	2018-04-27	\N	24	4	\N	\N	\N	1232	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
22	46	1	35	2020-06-19	\N	25	4	919	\N	2191	\N	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:31	0	0	0
23	46	1	35	2020-06-05	\N	25	4	\N	\N	2192	\N	\N	YAwatsIwb3ZOvoN6hr2ekd6KXckPsdXPSYppJyma.pdf	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:31	0	0	0
24	46	1	35	2014-02-21	\N	25	4	\N	\N	519	\N	\N	WZOx4cfHSoIbG4fteYU0vsTVMqHlNi5rUhCqSfAJ.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:31	0	0	0
25	46	794	6	2018-04-26	2021-04-25	26	4	920	\N	\N	1233	1127	7SLqU0A5PQh7DszUxUVCfzvLc3CK2g3vq99BVQAz.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	32
26	46	13	6	2016-06-17	2019-06-16	27	4	\N	\N	\N	1234	1128	2f66TrsDUuWmxllXTIWJo6Am24xU0nPDiCVSjTWM.pdf	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	72
27	46	501	6	2020-05-18	2023-05-17	28	4	\N	\N	\N	810	1129	dv3Pfeu0KzETyU06Fw792wAKqszJ2nVu1DkOMLMX.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	8	0
28	46	501	6	2020-09-03	2023-09-02	21	4	\N	\N	\N	863	1130	q5JyO6aPkTvp1gXv3BeyQR8p1DcXf4B6sMrk3cbz.pdf	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	10
29	46	501	6	2020-06-12	2023-06-11	29	4	\N	\N	\N	829	1131	mGqIPW9fVf8pnuUdddkYCJCNXZMqhawqKYiaLQ57.pdf	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	8
30	46	501	6	2019-06-06	2022-06-05	30	4	\N	\N	\N	1230	1132	Z8EZXCPT4F2T2P3BMtZTdHjB52JFelmZFm0QyNS7.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	36
31	46	501	6	2018-12-13	2021-12-12	21	4	\N	\N	\N	1235	1133	tklZDdwQVuEnYd4ijQPGUS9jcRRYYmcPlYnfqYmq.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	30
32	46	501	6	2018-11-28	2021-11-27	29	4	\N	\N	\N	1236	1134	jcnqlZ6Mm6nFHUvnqvrTfduHXd7IdhmVpthQq3rh.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	8
33	46	5	6	2018-10-17	\N	31	4	\N	\N	\N	1237	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
34	46	5	6	2018-04-26	\N	26	4	\N	\N	\N	1238	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
35	126	780	35	1996-03-07	\N	33	34	\N	\N	\N	\N	\N	fplj9C5z29IZYslNhS8NmRoHDkeToEhLWLJUzi9c.jpg	\N	0	2021-04-09 15:19:16	2021-10-11 10:49:31	0	0	0
36	126	1	35	1977-07-19	\N	36	795	\N	\N	2193	\N	\N	Z3jdaY1gZSieQfOzPFHInGJiEXZEWzuPnFXtIk2u.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:31	0	0	0
37	126	13	6	2008-08-08	\N	38	4	\N	\N	2194	808	1135	PSFfxwFZGoQHJTMDIFHsYs24dAjQJfpHAMxEN07M.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:31	0	0	0
38	126	501	6	2019-10-17	2022-10-16	21	4	\N	\N	\N	832	1136	rDLTGXh5onBgBQBmXNtDNGJ7583SzUtZvP6tfyx8.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	8
39	348	1	14	2004-06-29	\N	26	4	\N	\N	530	\N	\N	3hgQO4z2fnJhurTXOeXopLRC9xgvBCfhoUIgDZV7.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:32	0	0	0
40	348	39	40	1975-06-21	\N	41	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
41	348	13	6	2002-02-12	\N	26	4	921	\N	\N	1239	1137	IgUyBPES9QmZ7JIh75vPP453cmn8A4QFAsDLYY5E.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	720
42	348	5	6	2020-12-10	2023-12-09	12	4	\N	\N	\N	846	811	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	8	0
43	348	501	6	2016-06-27	\N	12	4	\N	\N	\N	810	1138	eWD9VywGg7PKPyphZnZqlcszwCP0XyBl33v1XZNV.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	8	0
44	348	501	6	2020-11-27	2023-11-28	8	4	\N	\N	\N	879	1139	g0DWalh9JW6VRbw9BzcKaDZGpMQHBR3mDkb4Yens.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	12
45	348	501	6	2020-10-13	2023-10-12	21	4	\N	\N	\N	1240	1140	SvQu54tMmhaojE9Pi5RIqerWb7JJCz62nr998Tsi.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	12
46	348	504	6	2019-10-23	2022-10-22	42	4	\N	\N	\N	832	1141	sIuTyxszzDpkaW9pB7WBbXx77a3JSXk1NRrp8Fwk.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	6
47	348	5	6	2018-10-03	\N	21	4	\N	\N	\N	1241	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
48	348	5	6	2018-08-30	\N	12	4	\N	\N	\N	1242	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
49	239	1	2	2017-06-21	\N	10	4	\N	2602	2195	\N	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
50	239	43	6	2018-02-26	\N	10	4	922	2603	\N	\N	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
51	239	13	6	2018-06-02	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
52	239	5	6	2020-12-10	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
53	239	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
54	239	5	6	2019-09-20	\N	21	4	\N	\N	\N	1244	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
55	239	5	6	2019-04-14	\N	44	4	\N	\N	\N	1245	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
56	239	5	6	2018-06-02	\N	10	4	\N	\N	\N	1246	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
57	488	1	35	1993-06-10	\N	26	4	\N	\N	862	\N	\N	73N8zQPkZCcxnlfsVm03e4unfJkj1bovNJSSeapM.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:32	0	0	0
58	488	13	6	2014-11-28	2017-11-27	45	4	\N	\N	\N	1247	1128	f6vdmTyQQn38SJqcnIQEdp7V2RVGjDllwALCOLpg.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	80
59	488	501	6	2020-12-10	2023-12-09	12	4	\N	\N	\N	846	811	4kIn8SLISGl9PqZEvbIJttxCgaF7S8RzZXwZYe8W.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	8	0
60	488	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
61	488	5	6	2020-12-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
62	488	5	6	2018-05-23	\N	12	4	\N	\N	\N	1249	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
63	110	1	35	2006-01-21	\N	46	4	\N	\N	\N	\N	\N	BRkjLgwkFo5YV2AvpZ1QqYEzRdaM8B79hNwSMCKS.jpg	\N	0	2021-04-09 15:19:16	2021-10-12 07:13:51	0	0	0
64	110	1	35	2002-08-26	\N	45	4	\N	\N	\N	\N	\N	zHbSwr3ey6Iw94or7AlRhgKBU84Fv4htP1mmJs5d.jpg	\N	0	2021-04-09 15:19:16	2021-10-12 07:21:04	0	0	0
65	110	1	35	2002-06-25	\N	45	4	\N	\N	2197	\N	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:32	0	0	0
66	110	1	16	1976-06-25	\N	47	4	\N	2604	564	\N	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
67	110	13	6	2013-12-16	2016-12-15	10	4	923	\N	\N	1250	1142	K6bpSnN0itJpj0MnlPTT3lcsJcQ1v598rBKVcfmD.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	72
68	110	13	6	2003-06-14	2006-06-13	15	4	924	\N	2198	\N	\N	0L6AduSW5dAENaOPH5EP13MOOSytmuSH18uecrVA.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:32	0	0	60
69	110	501	6	2018-08-11	2021-08-10	48	4	\N	\N	\N	1251	1143	a4JcRTyx12VlrmYuBZfzTGbMSk9Gk31rxsKRaTj7.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	8	0
70	110	501	6	2021-01-27	2024-01-26	49	4	\N	\N	\N	850	1144	IuhijifKnkvBSqeQNf30E3Nxxgpdr5NlGrkmMeIw.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	2
71	110	501	6	2020-11-27	2023-11-26	8	4	\N	\N	\N	879	1139	oon5hw7UJ4o6PweaTOqNa262hO56PbttmT4oLDvj.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	12
72	110	504	6	2019-10-23	2022-10-22	42	4	\N	\N	\N	832	1141	QoXvsITFugrlaDNzUSHslJf1Dkg0Eazy5iOpOLzM.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	6
73	110	501	6	2019-03-06	2022-03-05	50	4	\N	\N	\N	1230	1145	YPYzgGWa6Eyw9K6nU8d2D9FGa0ubuwuojI9pVgau.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	12
74	110	5	6	2018-10-09	\N	21	4	\N	\N	\N	1252	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
75	110	5	6	2018-08-30	\N	51	4	\N	\N	\N	1253	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
76	110	5	6	2018-04-25	\N	21	4	\N	\N	\N	1254	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
77	110	5	6	2018-04-04	\N	21	4	\N	\N	\N	1255	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
78	22	1	14	2015-02-25	\N	52	4	\N	\N	2199	\N	\N	mcBlYpGTDiWqKMjmA0UY8RsSB7MZ1S76uOFjPeTB.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:32	0	0	0
79	22	800	657	2002-06-28	\N	53	4	925	\N	2200	\N	\N	JMWBMpMRuG4PSImNkTabhA9O3mtSLzpAodQDxgjK.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:32	0	0	0
80	22	39	40	2002-06-20	\N	54	4	926	\N	\N	\N	\N	j3XvDCUFJhe64njQeL0EODlKCY5PdYvGH7v11vLG.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:02:10	0	0	0
81	22	501	6	2016-06-27	2019-06-26	12	4	\N	\N	\N	810	811	kpT2b92EOPoMSVL4Ja3pMPlkjjYW3NMex7PogYz8.jpg	\N	0	2021-04-09 15:19:16	2021-10-14 06:57:01	0	8	0
82	22	501	6	2020-02-13	2023-02-12	21	4	\N	\N	\N	879	1146	1xJuLEqyLBhDpp5iAsrmZEh80dPN3xNtQyI1tcoB.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	80
83	22	501	6	2019-03-06	2022-03-05	50	4	\N	\N	\N	843	1147	lYPwyv4sKw3JvpUVikxjUlKEg3gatRFns0X5zqey.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	12
84	22	501	6	2018-11-28	2021-11-27	21	4	\N	\N	\N	1256	1148	OA5EOfW5G6w0geDzXrWOpWWhjQI76bhXeBgyDntP.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	24
85	22	501	6	2018-11-26	2021-11-25	12	4	\N	\N	\N	846	1149	ofv77H3IGktBwLbsxDUVpKITni6oQGuBYxKzMwQx.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	9
86	22	5	6	2018-08-30	\N	12	4	\N	\N	\N	1257	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
87	22	5	6	2018-05-18	\N	21	4	\N	\N	\N	1258	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
88	22	5	6	2018-04-27	\N	21	4	\N	\N	\N	1259	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
89	300	1	14	2018-11-03	\N	55	4	927	\N	2201	\N	\N	AYFOYyHAoIkjJVM8aHsVldiAhD64iwm0ih42Cus8.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:32	0	0	0
90	300	1	35	2014-06-19	\N	26	4	\N	\N	\N	\N	\N	gXjO4TxqWQjUeR5gSh8LdVUB6EIYqciEhMQeiZxB.jpg	\N	0	2021-04-09 15:19:16	2021-10-12 09:43:15	0	0	0
91	300	1	35	2012-02-16	\N	56	4	\N	\N	2202	\N	\N	jHub7ZfjerbNTpj8Duw38YT0Aj8ETMHGyANNuleV.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:32	0	0	0
92	300	1	11	2007-06-30	\N	57	4	928	\N	2203	\N	\N	959rS7Cgg5ZiFAA0b10QqB6fizTFuOERDjffZysP.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:32	0	0	0
93	300	43	6	2018-01-11	\N	55	4	929	2605	\N	\N	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
94	300	13	6	2009-08-31	2012-08-30	58	4	\N	\N	\N	835	1150	umBFhbjVhRzY7NRJxEgNAasc3FmbBCpecjTfT9d7.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	100
95	300	13	6	2009-06-27	2012-06-26	26	4	\N	\N	2204	\N	1151	ZF7wEfADVKbMe3rKdBSdaG3JvjOXMQNf0gRgKzJ9.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:05:32	0	0	720
96	300	13	6	2008-03-28	2011-03-27	10	4	\N	\N	\N	\N	1152	xh4fAPutt11ZA7gHMcOIZu1YUIVaYmVsSwf0oNns.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:03:11	0	0	72
97	300	501	6	2019-12-06	2022-12-05	59	4	\N	\N	\N	843	1153	7KIqO0zmGbeHxrOjqZCVpilsViGLqMEpHihIvkwz.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	8	0
98	300	5	6	2016-12-30	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:16	2021-11-02 11:06:19	0	0	0
99	300	501	6	2021-03-04	2024-03-03	21	4	\N	\N	\N	863	1154	idKyP1FChp54LBOHGAE8apYc7UPOTqebu4jGN8P2.pdf	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	8
100	300	501	6	2020-11-25	2023-11-24	60	4	\N	\N	\N	1261	1155	GpyQ7gKsDUDuu4wCnaq8yY7UiphNdfifL8p8OSuw.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	6
101	300	501	6	2020-08-25	2023-08-24	21	4	\N	\N	\N	863	1156	oa9jQvGdXWJ7iiepcyntyJ2SAnlZJpMWUk9dXEAq.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	12
102	300	501	6	2020-08-20	2023-08-19	61	4	\N	\N	\N	841	1157	yS8VR8r2dtoyKzqLCtAxNqY6wdtgUN4NAsfiO7PN.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	24
103	300	13	6	2020-05-07	2023-05-06	62	4	\N	\N	\N	1262	1158	4wdj8kw1B4NCpwBLmWPsw5dKXrbjbDqI77zipj5o.pdf	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	4
104	300	504	6	2020-03-23	2023-03-22	42	4	\N	\N	\N	1263	1141	zjWTWNtqYdrF5wzH4PxQ27RhM4ytQTmDPUXndiRM.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	6
105	300	501	6	2019-11-29	2022-11-28	21	4	\N	\N	\N	1251	1159	RC0obkSttwoPhPwcXRkGGPZsAl9fAYHnfH48o6ec.jpg	\N	0	2021-04-09 15:19:16	2021-11-02 11:04:26	0	0	16
106	300	501	6	2019-11-06	2022-11-05	63	4	\N	\N	\N	810	1160	xwiQmH42lOm5yndwFp9jFVtGXWzTVrIn5OH3gGjs.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	6
107	300	501	6	2019-09-06	2022-09-05	12	4	\N	\N	\N	846	1161	ezCsBwCqtgjxtlKfKBdy4aVUeUTX4SyZ1ghX3kqF.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	2
108	300	501	6	2019-09-06	2022-09-05	12	4	\N	\N	\N	846	1126	z2WRimbqlQeJ4BhDEktdskK4HLn2xukrwoa1XhN3.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	2
109	300	501	6	2019-08-23	2022-08-22	64	4	\N	\N	\N	1264	1162	evgiOgoTt6QJpVDgFu14ICXBD5kT0hrXFY8W5xRx.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	24
110	300	501	6	2019-06-12	2022-06-11	12	4	\N	\N	\N	850	876	IuJBfgLmD0Sth039Jm0vBbc0YzoGZ68QTVy2QZ1O.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	120
111	300	501	6	2019-06-10	2022-06-09	12	4	\N	\N	\N	1230	1163	edBg5yUkfrjVBlvCIb9gS2jQ3od5cUeQZL4agn9f.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	8
112	300	501	6	2019-05-17	2022-05-16	21	4	\N	\N	\N	1256	1164	Nek7w2RWa8apImMuhXMP7LTZIw84s3vPfcITAO06.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	16
113	300	501	6	2019-03-06	2022-03-06	50	4	\N	\N	\N	1230	1165	9ueCueCT8U10auNH3QmAg0kOS7SQm7evAcuIzBqI.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	12
114	300	501	6	2018-11-29	2021-11-28	65	4	\N	\N	\N	843	1166	QUjw4fpFmS1PT9fmEQWHw9j9XikY24kQX4VZb3BN.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	12
115	300	501	6	2018-11-26	2021-11-25	12	4	\N	\N	\N	843	1149	YFqgXhwQVHpRS00TBeQThCoRjo31ZtUF5ixvE9XA.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	9
116	300	5	6	2018-09-07	\N	66	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
117	300	5	6	2018-08-30	\N	12	4	\N	\N	\N	1266	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
118	300	5	6	2018-05-11	\N	21	4	\N	\N	\N	1267	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
119	300	5	6	2018-04-27	\N	21	4	\N	\N	\N	1259	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
120	223	781	35	2002-06-12	\N	10	4	\N	\N	2205	\N	\N	khnTbWkvpJQGAXqcY34Imv9gIKia1pMwgIlAAJnh.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:05:32	0	0	0
121	223	1	35	1972-07-01	\N	67	4	930	\N	535	\N	\N	oz8qC7KIW6Kkhg0sHakj6udCijNYpna8n3H4K2Xf.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:05:32	0	0	0
122	223	1	2	1965-07-01	\N	68	4	931	\N	2206	\N	\N	4JYR8pEcDpeIvwLZZhMX99qzq2653kJaYZfGe1yY.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:05:32	0	0	0
123	223	501	6	2016-06-27	2019-06-26	12	4	\N	\N	\N	843	1167	pvzalkdHQGwON7ylzFsv5A2taYA7Ur2RvMjv5orV.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	8	0
124	223	13	6	2020-01-24	2023-01-23	26	4	\N	\N	\N	832	1168	LWZSwbrqGbPbIZR8fMefUsgJdoaxc4eZG7LaPEfC.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	8
125	223	501	6	2019-09-06	2022-09-05	12	4	\N	\N	\N	843	1169	6XUYk2ZSvT5uyxNdbIPpmVMxX5KRAiBaPPgFmuWV.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	2
126	223	501	6	2019-05-23	2022-05-22	12	4	\N	\N	\N	846	1170	fRHMwiZiFSiKa7AsT6OpRQ9YTH6ht3DUc3tO2FXQ.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	3
127	223	501	6	2019-05-02	2022-05-01	12	4	\N	\N	\N	846	1171	Y5g2vupoobcNkfym6wpeZZGi1LQrhMBaTDwfwxSz.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	3
128	223	501	6	2019-01-28	2022-01-27	12	4	\N	\N	\N	843	1172	b86kLZuwmYWR4h2Di0T6VjKhErrhcMoW2hkaigOR.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	3
129	223	13	6	2019-01-25	2022-01-24	26	4	\N	\N	\N	832	1173	fxsilPG4464FceYtg20wjEtqWWzeiFXHshAZzteO.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	8
130	223	501	6	2018-08-30	2021-08-29	12	4	\N	\N	\N	843	1174	oXaqXn8q0P650Y9sj7tekDtNtMLdXzgf2lf59NOM.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	9
131	184	1	35	1992-06-20	\N	69	4	\N	2606	2207	\N	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
132	184	1	2	1991-06-19	\N	70	4	\N	2607	2208	\N	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
133	184	13	6	2015-10-30	\N	10	4	\N	\N	2209	\N	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
134	184	5	6	2018-06-12	\N	71	4	\N	\N	\N	1243	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
135	184	5	6	2020-11-30	\N	71	4	\N	\N	\N	1268	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
136	184	5	6	2020-11-23	\N	10	4	\N	\N	\N	1269	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
137	184	5	6	2020-10-14	\N	8	4	\N	\N	\N	1270	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
138	184	5	6	2019-12-20	\N	71	4	\N	\N	\N	1271	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
139	184	5	6	2019-10-21	\N	72	4	\N	\N	\N	1272	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
140	184	5	6	2019-09-30	\N	71	4	\N	\N	\N	1273	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
141	184	5	6	2019-09-30	\N	73	4	\N	\N	\N	1274	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
142	184	5	6	2019-08-30	\N	21	4	\N	\N	\N	1275	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
143	184	5	6	2019-08-13	\N	21	4	\N	\N	\N	1276	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
144	184	5	6	2019-06-21	\N	73	4	\N	\N	\N	1277	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
145	184	5	6	2019-03-29	\N	74	4	\N	\N	\N	1278	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
146	184	5	6	2018-12-27	\N	71	4	\N	\N	\N	1279	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
147	184	5	6	2018-10-31	\N	42	4	\N	\N	\N	1280	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
148	184	5	6	2018-09-25	\N	71	4	\N	\N	\N	1281	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
149	235	1	35	1995-06-22	\N	75	4	\N	838	839	\N	\N	6cBFkgh6wkd4k6J8zAvMyneqmodgaadm7OqsjrBB.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:26	0	0	0
150	235	13	6	2007-01-23	\N	76	4	\N	\N	2210	\N	840	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
151	235	501	6	2021-01-16	2024-01-15	46	4	\N	\N	\N	841	845	ZNxVxJEeEuUMfopRFNb8MHjuvz0fvhaRLlmG1YZ8.bin	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	8	0
152	235	5	6	2018-01-20	\N	77	4	\N	\N	\N	1282	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
153	235	501	6	2021-02-04	2024-02-03	65	4	\N	\N	\N	843	844	ktFgeWCDPAp0axJdB9PQsp8v1kFPyb7zbxA8ODuu.bin	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	12
154	235	501	6	2020-08-10	2023-08-09	21	4	\N	\N	\N	846	847	0d4j5zFARVbd9FyW8mvuylBPqitPXJO5Ci91HEJZ.bin	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	36
155	235	501	6	2019-12-23	\N	78	4	\N	\N	\N	1283	849	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	6
156	235	501	6	2019-12-04	2022-12-03	79	4	\N	\N	\N	846	848	24erZTmidXs3ftpT7v5COGWzU7c8XTVvxjUnvbSg.bin	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	6
157	235	5	6	2019-11-23	\N	78	4	\N	\N	\N	1284	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
158	235	5	6	2019-11-05	\N	80	4	\N	\N	\N	1285	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
159	235	5	6	2019-08-27	\N	81	4	\N	\N	\N	1286	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
160	235	5	6	2019-04-29	\N	78	4	\N	\N	\N	1287	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
161	235	501	6	2019-03-29	2022-03-28	82	4	\N	\N	\N	850	851	1DU7pjUnld225vXbQIORB0ZqXeWlXqpTt2MHund3.bmp	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	7
162	235	501	6	2019-03-22	2022-03-21	83	4	\N	\N	\N	843	852	Z4ZlvX53nMejP5re5u0iFoJ3mZHM1Jkr5mWmYF8U.bmp	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	6
163	235	501	6	2019-01-02	2022-01-01	78	4	\N	\N	\N	846	853	uarRgMTpsvQkXFC4Ph3Uxzj3mdOuS5I8CIlbLKaY.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	8
164	235	501	6	2018-12-27	2021-12-26	78	4	\N	\N	\N	854	855	Hl8o5NKsBEhKxFhQyAZc2yTTRFxGpg8MASDwEjA5.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	8
165	235	5	6	2018-10-23	\N	79	4	\N	\N	\N	1288	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
166	235	5	6	2018-10-23	\N	83	4	\N	\N	\N	1288	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
167	235	5	6	2018-10-13	\N	84	4	\N	\N	\N	1289	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
168	235	5	6	2018-08-28	\N	46	4	\N	\N	\N	1290	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
169	235	5	6	2018-08-23	\N	61	4	\N	\N	\N	1291	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
170	235	5	6	2018-04-04	\N	85	4	\N	\N	\N	1292	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
171	504	1	35	1989-06-22	\N	86	4	\N	861	862	\N	\N	DYCCUTKeKBmQLD0DTxkOWW7i4mOjgoPIOOPb9u0N.pdf	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:27	0	0	0
172	504	43	6	2020-08-31	\N	10	4	932	2603	\N	\N	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
173	504	501	6	2020-11-05	2023-11-04	12	4	\N	\N	\N	843	811	ZcT0PKkw2K8zNYmyUOcQ0cNCYlfojbZqalH0FbaT.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	8	0
174	504	501	6	2020-11-27	2023-11-26	12	4	\N	\N	\N	810	873	azkmAQXS5Q2Osm8BKH6jbF8ueeLl4bA8r3T7fr7t.pdf	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	24
175	114	1	14	2009-02-20	\N	15	4	\N	\N	538	\N	\N	qDQpG3sDvT3MzMxuAeFcw4PyLWaf2GdFWx51k0iA.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
176	114	1	11	1988-07-15	\N	87	4	\N	2608	874	\N	\N	3DYm9VN4VAMJnx2cJCzUwxyI39mfFdPX6t61wOEn.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
177	114	13	6	2015-10-24	2018-10-23	88	4	\N	\N	2211	808	875	K4KA8iODZfRsLBSFm5aTjSNPi2y65NjkEEBlMT2k.pdf	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	96
178	114	13	6	2006-12-15	2009-12-14	89	4	\N	\N	2212	829	876	BzIMQVW5SSsoucdRim5sESC1d2Mbo6l5yKrjrmdG.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	64
179	114	501	6	2016-06-27	2019-06-26	12	4	\N	\N	\N	810	811	D91ZU3KWb65jrf3855fZALD7eHanchpnKYRkSRZ9.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	8	0
180	114	501	6	2020-05-29	2023-05-28	20	4	\N	\N	\N	879	880	giTrzbFrcsxB5zuAiN1jEyvBUkNNHhwClGOvFTgq.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	12
181	114	501	6	2019-11-28	2022-11-27	21	4	\N	\N	\N	881	882	kgpO1yz3dpy185juPrT36XJ4TDybasJ0xAHArjOF.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	36
182	114	501	6	2019-11-04	2022-11-03	12	4	\N	\N	\N	846	883	Tt295eZ9UBNGNs2FDtGbzJbwOyGHlBcq2Teyew71.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	12
183	114	501	6	2019-09-06	2022-09-05	12	4	\N	\N	\N	846	884	v3FxrkZuJC6JzF4zm0DV8PJJQ1GchWYXFTUaKYNT.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	12
237	255	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
184	114	501	6	2019-04-24	2022-04-23	90	4	\N	\N	\N	885	886	I9LeBJUTuIxIbpRkCtv0C9lyZXDW1dL77700i5BU.pdf	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	24
185	114	5	6	2018-08-30	\N	12	4	\N	\N	\N	1293	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
186	114	5	6	2018-08-30	\N	12	4	\N	\N	\N	1294	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
187	132	1	2	1989-06-30	\N	91	92	933	2609	2213	\N	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
188	132	1	11	1984-02-27	\N	93	4	\N	2610	2214	\N	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
189	132	13	6	2006-06-29	\N	76	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
190	132	5	6	2018-06-12	\N	71	4	\N	\N	\N	1243	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
191	132	5	6	2020-10-20	\N	72	4	\N	\N	\N	1295	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
192	132	5	6	2020-08-28	\N	72	4	\N	\N	\N	1296	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
193	132	5	6	2020-08-12	\N	72	4	\N	\N	\N	1297	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
194	132	5	6	2019-10-21	\N	72	4	\N	\N	\N	1298	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
195	132	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
196	132	5	6	2019-04-01	\N	12	4	\N	\N	\N	1300	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
197	132	5	6	2019-03-14	\N	72	4	\N	\N	\N	1301	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
198	132	5	6	2018-08-22	\N	94	4	\N	\N	\N	1302	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
199	132	5	6	2018-05-16	\N	71	4	\N	\N	\N	1303	\N	\N	\N	1	2021-04-09 15:19:17	2021-11-02 11:06:19	0	0	0
200	448	1	889	2013-06-25	\N	10	4	934	887	888	\N	\N	qoLuPyEkY3zDt2BZmAg1oAuxVOde3mv4g4adLatt.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:04:27	0	0	0
201	448	43	6	2018-02-17	\N	27	4	890	2611	\N	\N	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
202	448	13	6	2018-05-12	2021-05-11	15	4	890	\N	2215	808	837	YbLwchH7RYez6ielkIyCrYPy94yWNLG8NLfAA4pS.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	72
203	448	501	6	2016-06-27	2019-06-26	12	4	\N	\N	\N	846	811	Z9oWmrkpFYJciOm3iLKdnC6NheL0NbZ85qKdEP3q.jpg	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	8	0
204	448	5	6	2020-11-27	\N	95	4	\N	\N	\N	1304	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
205	448	5	6	2020-11-26	\N	10	4	\N	\N	\N	1305	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
206	448	5	6	2020-09-30	\N	21	4	\N	\N	\N	1306	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
207	448	5	6	2020-02-17	\N	96	4	\N	\N	\N	1307	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
208	448	5	6	2020-02-08	\N	95	4	\N	\N	\N	1308	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
209	448	5	6	2019-10-24	\N	97	4	\N	\N	\N	1309	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
210	448	5	6	2018-10-25	\N	97	4	\N	\N	\N	1310	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
211	448	5	6	2018-08-30	\N	12	4	\N	\N	\N	1311	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
212	448	5	6	2018-05-12	\N	15	4	\N	\N	\N	1312	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
213	169	1	11	1975-07-04	\N	76	98	935	2612	540	\N	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
214	169	13	6	2014-11-28	\N	45	4	\N	\N	2215	\N	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
215	169	5	6	2016-06-27	\N	12	4	\N	\N	\N	1313	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
216	169	5	6	2020-12-17	\N	21	4	\N	\N	\N	1314	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
217	169	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
218	169	5	6	2020-09-20	\N	99	4	\N	\N	\N	1316	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
219	169	5	6	2019-11-13	\N	21	4	\N	\N	\N	1317	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
220	169	5	6	2019-04-02	\N	21	4	\N	\N	\N	1318	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
221	169	5	6	2018-10-31	\N	100	4	\N	\N	\N	1319	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
222	169	5	6	2018-10-11	\N	21	4	\N	\N	\N	1320	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
223	5	1	101	2000-06-12	\N	10	4	936	2613	2216	\N	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
224	5	13	6	2015-09-24	\N	102	4	\N	\N	2217	\N	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
225	5	13	6	2013-12-16	\N	10	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
226	5	13	6	2008-09-24	\N	10	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
227	5	13	6	2007-12-27	2010-12-26	103	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
228	5	13	6	2006-12-09	\N	10	104	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
229	5	5	6	2018-08-11	\N	48	4	\N	\N	\N	1321	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
230	5	5	6	2020-10-13	\N	21	4	\N	\N	\N	1322	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
231	5	5	6	2019-10-23	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
232	5	5	6	2019-03-06	\N	105	4	\N	\N	\N	1323	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
233	5	5	6	2018-12-28	\N	51	4	\N	\N	\N	1324	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
234	5	5	6	2018-10-10	\N	21	4	\N	\N	\N	1325	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
235	5	5	6	2018-10-03	\N	21	4	\N	\N	\N	1241	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
236	255	1	2	1995-06-26	\N	10	106	937	\N	2218	\N	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
238	255	5	6	2019-10-24	\N	74	4	\N	\N	\N	1326	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
239	255	5	6	2018-10-25	\N	74	4	\N	\N	\N	1327	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
240	255	5	6	2018-09-12	\N	74	4	\N	\N	\N	1328	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
241	255	5	6	2018-09-07	\N	66	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:17	2021-11-02 11:06:20	0	0	0
242	255	5	6	2018-08-30	\N	12	4	\N	\N	\N	1329	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
243	505	1	35	2002-06-21	\N	69	4	\N	2614	2219	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
244	505	1	11	1991-06-22	\N	107	108	\N	2607	2220	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
245	505	5	6	2018-06-08	\N	109	4	\N	\N	\N	1330	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
246	505	5	6	2020-08-28	\N	21	4	\N	\N	\N	1331	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
247	505	5	6	2020-08-28	\N	21	4	\N	\N	\N	1332	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
248	505	5	6	2019-10-28	\N	21	4	\N	\N	\N	1333	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
249	505	5	6	2019-10-22	\N	109	4	\N	\N	\N	1334	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
250	505	5	6	2018-06-07	\N	109	4	\N	\N	\N	1335	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
251	422	1	9	2019-12-30	\N	10	4	938	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
252	422	1	14	2009-06-18	\N	15	4	939	2615	2221	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
253	422	43	6	2018-09-05	\N	10	4	938	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
254	422	43	6	2017-09-12	\N	10	4	938	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
255	422	5	6	2018-02-28	\N	105	4	\N	\N	\N	1336	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
256	422	5	6	2020-12-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
257	422	5	6	2019-11-05	\N	18	4	\N	\N	\N	1337	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
258	422	5	6	2019-08-21	\N	26	4	\N	\N	\N	1338	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
259	422	5	6	2019-08-01	\N	110	4	\N	\N	\N	1339	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
260	422	5	6	2019-04-26	\N	111	4	\N	\N	\N	1340	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
261	422	5	6	2019-04-23	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
262	422	5	6	2019-04-05	\N	112	4	940	\N	\N	1341	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
263	422	5	6	2018-10-26	\N	18	4	941	\N	\N	1342	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
264	422	5	6	2018-10-26	\N	18	4	942	\N	\N	1342	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
265	422	5	6	2018-09-18	\N	113	4	\N	\N	\N	1343	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
266	422	5	6	2018-04-25	\N	42	4	\N	\N	\N	1344	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
267	422	5	6	2018-04-10	\N	61	4	\N	\N	\N	1345	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
268	427	1	11	2016-06-29	\N	12	4	943	\N	547	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
269	427	13	6	2020-05-20	\N	15	4	\N	\N	2222	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
270	427	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
271	427	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
272	427	5	6	2020-09-22	\N	19	4	\N	\N	\N	1346	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
273	427	5	6	2020-02-24	\N	15	4	\N	\N	\N	1347	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
274	476	1	35	1987-06-26	\N	70	4	944	2616	2223	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
275	476	1	11	1985-06-21	\N	114	4	944	2617	2224	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
276	476	5	6	2016-02-18	\N	115	4	\N	\N	\N	1330	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
277	476	5	6	2021-03-05	\N	116	4	\N	\N	\N	1348	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
278	476	5	6	2021-03-04	\N	116	4	\N	\N	\N	1349	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
279	476	5	6	2020-10-20	\N	117	4	\N	\N	\N	1350	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
280	142	1	2	2003-06-10	\N	10	4	\N	2618	2225	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
281	142	1	9	2001-06-20	\N	10	4	\N	2618	2226	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
282	142	13	6	2016-05-26	\N	45	4	\N	\N	2227	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
283	142	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
284	142	5	6	2020-12-02	\N	118	4	\N	\N	\N	1351	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
285	142	5	6	2020-10-15	\N	21	4	\N	\N	\N	1306	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
286	142	5	6	2020-09-03	\N	21	4	\N	\N	\N	1352	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
287	142	5	6	2019-11-29	\N	21	4	\N	\N	\N	1353	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
288	142	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
289	142	5	6	2019-06-13	\N	26	4	\N	\N	\N	1355	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
290	142	5	6	2019-06-12	\N	12	4	\N	\N	\N	1356	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
291	142	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
292	142	5	6	2018-09-07	\N	119	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
293	142	5	6	2018-08-30	\N	12	4	\N	\N	\N	1358	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
294	142	5	6	2018-04-26	\N	21	4	\N	\N	\N	1254	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
295	142	5	6	2018-04-23	\N	21	4	\N	\N	\N	1255	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
296	506	1	32	2004-06-22	\N	10	4	934	2619	636	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
297	506	1	9	1994-06-30	\N	10	4	945	2620	2228	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
298	506	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
299	506	5	6	2020-12-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
300	506	5	6	2019-05-28	\N	105	4	\N	\N	\N	1359	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
301	506	5	6	2018-10-12	\N	120	4	\N	\N	\N	1360	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
302	506	5	6	2018-07-04	\N	121	4	\N	\N	\N	1361	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
303	380	1	122	2013-07-18	\N	26	4	\N	2621	507	\N	\N	\N	\N	1	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
304	380	1	2	2007-07-02	\N	26	4	\N	2622	2229	\N	\N	\N	\N	1	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
305	380	1	123	2005-07-06	\N	26	4	\N	2623	2230	\N	\N	\N	\N	1	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
306	507	1	124	2006-05-26	\N	125	4	\N	\N	2231	\N	\N	\N	\N	1	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
307	507	1	35	1988-06-22	\N	67	4	\N	2624	2232	\N	\N	\N	\N	1	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
308	507	13	6	2010-12-23	\N	15	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
309	507	13	6	2006-10-12	\N	100	4	\N	\N	2233	\N	\N	\N	\N	1	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
310	507	5	6	2018-03-12	\N	126	4	\N	\N	\N	1362	\N	\N	\N	1	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
311	507	5	6	2019-12-05	\N	20	4	\N	\N	\N	1363	\N	\N	\N	1	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
312	507	5	6	2019-04-16	\N	105	4	\N	\N	\N	1364	\N	\N	\N	1	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
313	507	5	6	2019-01-28	\N	127	4	\N	\N	\N	1365	\N	\N	\N	1	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
314	199	1	2	2015-01-23	\N	26	4	\N	2625	553	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
315	199	1	9	2013-06-21	\N	26	4	946	2625	2234	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
316	199	1	14	2011-01-21	\N	26	4	947	2626	2235	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
317	199	1	11	2008-06-30	\N	128	4	948	2627	2236	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
318	199	5	6	2020-12-10	\N	12	4	\N	\N	\N	1366	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
319	199	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
320	199	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
321	199	5	6	2018-05-23	\N	12	4	\N	\N	\N	1249	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
322	199	5	6	2018-04-27	\N	12	4	\N	\N	\N	1367	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
323	421	1	2	2011-07-05	\N	26	129	949	\N	2229	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
324	421	1	9	2009-07-03	\N	26	129	949	2628	2237	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
325	421	13	6	2012-12-15	\N	15	4	\N	\N	2238	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
326	421	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
327	421	5	6	2021-01-20	\N	19	4	\N	\N	\N	1368	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
328	421	5	6	2020-12-14	\N	110	4	\N	\N	\N	1369	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
329	421	5	6	2020-12-02	\N	118	4	\N	\N	\N	1370	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
330	421	5	6	2020-11-20	\N	130	4	\N	\N	\N	1371	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
331	421	5	6	2020-11-19	\N	110	4	\N	\N	\N	1372	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
332	421	5	6	2019-10-15	\N	131	4	\N	\N	\N	1373	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
333	421	5	6	2019-09-06	\N	12	4	\N	\N	\N	1374	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
334	421	5	6	2018-10-25	\N	132	4	\N	\N	\N	1375	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
335	68	1	2	2000-12-07	\N	10	133	890	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
336	68	1	35	1983-06-25	\N	67	4	950	2629	2239	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
337	68	13	6	2016-05-17	\N	45	4	\N	\N	2240	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
338	68	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
339	68	5	6	2020-06-15	\N	21	4	\N	\N	\N	1306	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
340	68	5	6	2019-11-07	\N	42	4	\N	\N	\N	1376	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
341	68	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
342	68	5	6	2019-05-02	\N	12	4	\N	\N	\N	1377	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
343	68	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
344	68	5	6	2018-08-30	\N	12	4	\N	\N	\N	1379	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
345	508	1	32	2007-02-16	\N	26	4	951	2630	2241	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
346	508	1	101	2004-07-02	\N	26	4	952	2631	2242	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
347	94	1	2	2004-06-30	\N	10	134	953	2632	2243	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
348	94	1	35	1999-02-02	\N	33	135	954	2633	2244	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
349	94	1	11	1991-07-01	\N	136	4	\N	2634	2245	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
350	94	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
351	94	5	6	2020-10-22	\N	137	4	\N	\N	\N	1380	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
352	94	5	6	2020-08-21	\N	138	4	\N	\N	\N	1381	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
353	94	5	6	2020-08-20	\N	61	4	\N	\N	\N	1382	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
354	94	5	6	2019-09-06	\N	12	4	\N	\N	\N	1383	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
355	94	5	6	2019-08-23	\N	61	4	\N	\N	\N	1384	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
356	94	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
357	94	5	6	2018-08-21	\N	138	4	\N	\N	\N	1385	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
358	94	5	6	2018-03-23	\N	139	4	\N	\N	\N	1386	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
359	124	1	32	1988-06-25	\N	67	4	\N	2635	2246	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
360	124	13	6	2007-01-23	\N	100	4	\N	\N	2210	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
361	124	5	6	2018-10-26	\N	140	4	\N	\N	\N	1387	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
362	124	5	6	2020-12-11	\N	118	4	\N	\N	\N	1388	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
363	124	5	6	2020-12-02	\N	118	4	\N	\N	\N	1351	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
364	124	5	6	2020-09-17	\N	141	4	\N	\N	\N	1389	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
365	124	5	6	2019-09-18	\N	42	4	\N	\N	\N	1390	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
366	124	5	6	2018-09-26	\N	142	4	\N	\N	\N	1391	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
367	7	1	35	1987-06-26	\N	67	143	\N	2620	2247	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
368	7	5	6	2016-12-30	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
369	7	5	6	2020-12-14	\N	110	4	\N	\N	\N	1369	\N	\N	\N	0	2021-04-09 15:19:18	2021-12-02 09:41:45	8	8	32
370	7	5	6	2019-11-07	\N	42	4	\N	\N	\N	1376	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
371	7	5	6	2019-06-13	\N	26	4	\N	\N	\N	1392	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
372	509	1	2	1983-06-17	\N	91	92	\N	2636	2248	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
373	509	5	6	2015-08-18	\N	117	4	\N	\N	\N	1393	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
374	509	5	6	2019-06-12	\N	21	4	\N	\N	\N	1394	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
375	510	1	35	2002-06-30	\N	10	134	955	2637	2249	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
376	510	13	6	2006-06-29	\N	76	4	\N	\N	2250	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
377	510	5	6	2020-12-10	\N	12	4	\N	\N	\N	1395	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
378	510	5	6	2016-06-27	\N	12	4	\N	\N	\N	1396	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
379	510	5	6	2016-04-18	\N	117	4	\N	\N	\N	1397	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
380	510	5	6	2020-10-14	\N	20	4	\N	\N	\N	1398	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
381	510	5	6	2020-08-26	\N	144	4	\N	\N	\N	1399	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
382	510	5	6	2019-04-07	\N	145	4	\N	\N	\N	1400	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
383	510	5	6	2018-11-27	\N	146	4	\N	\N	\N	1401	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
384	510	5	6	2018-11-02	\N	147	4	\N	\N	\N	1402	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
385	69	1	14	2000-06-01	\N	26	148	890	2638	2251	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
386	69	1	11	1996-12-06	\N	53	4	\N	2639	2252	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
387	69	1	11	1974-05-18	\N	149	4	\N	2640	770	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
388	69	39	150	\N	\N	151	4	956	\N	2253	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
389	69	13	6	2018-02-27	\N	152	4	\N	\N	2254	\N	\N	\N	\N	0	2021-04-09 15:19:18	2021-11-02 11:06:20	0	0	0
390	69	13	6	2013-12-16	\N	21	4	\N	\N	2255	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
391	69	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
392	69	5	6	2018-12-10	\N	21	4	\N	\N	\N	1403	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
393	69	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
394	69	5	6	2018-10-11	\N	21	4	\N	\N	\N	1405	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
395	69	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
396	69	5	6	2018-04-27	\N	21	4	\N	\N	\N	1259	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
397	409	39	40	2014-06-30	\N	153	4	957	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
398	409	43	6	2020-01-29	\N	26	4	958	2641	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
399	409	13	6	2018-11-13	\N	10	4	\N	\N	2256	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
400	409	5	6	2020-02-20	\N	50	4	\N	\N	\N	1407	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
401	409	5	6	2020-10-30	\N	60	4	\N	\N	\N	1408	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
402	409	5	6	2020-10-06	\N	21	4	\N	\N	\N	1322	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
403	409	5	6	2020-08-25	\N	21	4	\N	\N	\N	1409	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
404	409	5	6	2020-01-31	\N	21	4	\N	\N	\N	1410	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
405	409	5	6	2019-03-06	\N	50	4	\N	\N	\N	1411	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
406	342	1	2	2019-02-22	\N	10	4	959	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
407	342	1	9	2016-06-27	\N	10	4	\N	2642	2257	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
408	342	39	40	2010-07-16	\N	154	4	960	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
409	342	43	6	2015-11-09	\N	10	4	961	2643	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
410	342	43	6	2015-09-15	\N	10	4	962	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
411	342	5	6	2016-12-30	\N	12	4	\N	\N	\N	1412	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
412	342	5	6	2020-10-09	\N	21	4	\N	\N	\N	1413	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
413	342	5	6	2019-12-20	\N	21	4	\N	\N	\N	1414	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
414	342	5	6	2019-12-03	\N	10	4	\N	\N	\N	1415	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
415	342	5	6	2019-10-11	\N	21	4	\N	\N	\N	1416	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
416	342	5	6	2018-10-04	\N	21	4	\N	\N	\N	1417	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
417	241	1	11	1983-06-29	\N	155	4	\N	2644	2258	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
418	241	1	11	\N	\N	156	4	\N	2645	2259	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
419	241	13	6	2003-09-30	\N	76	4	\N	\N	2260	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
420	241	5	6	2020-12-10	\N	12	4	\N	\N	\N	1395	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
421	241	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
422	241	5	6	2018-04-06	\N	21	4	\N	\N	\N	1418	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
423	511	1	14	2012-03-02	\N	15	4	\N	2646	2261	\N	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
424	511	1	11	2007-06-29	\N	157	4	963	\N	2262	\N	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
425	511	5	6	2018-10-25	\N	158	4	\N	\N	\N	1419	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
426	511	5	6	2020-03-16	\N	159	4	\N	\N	\N	1420	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
427	511	5	6	2019-04-05	\N	20	4	\N	\N	\N	1421	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
428	511	5	6	2018-10-24	\N	158	4	\N	\N	\N	1419	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
429	512	1	11	2006-06-30	\N	57	4	964	\N	2262	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
430	180	1	32	1996-06-28	\N	26	160	965	2647	565	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
431	180	1	9	1994-07-01	\N	26	160	\N	2648	2263	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
432	180	13	6	2002-06-26	\N	26	148	\N	\N	2264	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
433	180	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
434	180	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
435	180	5	6	2020-12-28	\N	161	4	\N	\N	\N	1423	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
436	180	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
437	180	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
438	346	1	35	2013-02-22	\N	10	4	\N	2649	2265	\N	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
439	346	1	35	2000-06-06	\N	10	4	966	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
440	346	13	6	2010-10-03	\N	76	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
441	346	13	6	2010-03-24	\N	100	162	\N	\N	2250	\N	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
442	346	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
443	346	5	6	2019-11-29	\N	163	4	\N	\N	\N	1425	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
444	346	5	6	2019-11-01	\N	164	4	\N	\N	\N	1426	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
445	346	5	6	2019-03-29	\N	74	4	\N	\N	\N	1427	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
446	346	5	6	2018-11-02	\N	100	4	\N	\N	\N	1428	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
447	346	5	6	2018-09-28	\N	72	4	\N	\N	\N	1429	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
448	346	5	6	2018-05-23	\N	165	4	\N	\N	\N	1430	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
449	346	5	6	2018-04-25	\N	163	4	\N	\N	\N	1431	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
450	384	1	35	1981-06-29	\N	67	4	967	2650	2266	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
451	384	5	6	2016-12-30	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
452	384	5	6	2019-10-03	\N	166	4	\N	\N	\N	1432	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
453	384	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
454	218	1	35	2009-01-30	\N	10	4	\N	2651	2267	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
455	218	1	2	2001-06-18	\N	26	4	\N	\N	2268	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
456	218	1	2	1998-01-22	\N	10	134	890	2652	2269	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
457	218	13	6	2019-12-12	\N	167	4	\N	\N	2270	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
458	218	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
459	218	5	6	2020-01-13	\N	168	4	\N	\N	\N	1433	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
460	218	5	6	2019-12-10	\N	169	4	\N	\N	\N	1434	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
461	218	5	6	2019-11-29	\N	21	4	\N	\N	\N	1435	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
462	218	5	6	2019-11-12	\N	167	4	\N	\N	\N	1436	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
463	218	5	6	2019-11-05	\N	164	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
464	218	5	6	2019-09-06	\N	12	4	\N	\N	\N	1374	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
465	218	5	6	2019-06-10	\N	12	4	\N	\N	\N	1437	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
466	218	5	6	2019-05-08	\N	165	4	\N	\N	\N	1438	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
467	218	5	6	2019-04-25	\N	21	4	\N	\N	\N	1439	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
468	218	5	6	2019-03-04	\N	170	4	\N	\N	\N	1440	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
469	218	5	6	2018-05-15	\N	171	4	\N	\N	\N	1441	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
470	218	5	6	2018-05-14	\N	171	4	\N	\N	\N	1442	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
471	218	5	6	2018-03-23	\N	139	4	\N	\N	\N	1443	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
472	454	1	14	2005-06-18	\N	69	4	968	2653	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
473	454	5	6	2016-06-27	\N	12	4	\N	\N	\N	1444	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
474	454	5	6	2020-08-20	\N	69	4	\N	\N	\N	1445	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
475	454	5	6	2020-01-17	\N	21	4	\N	\N	\N	1446	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
476	454	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
477	454	5	6	2019-05-02	\N	12	4	\N	\N	\N	1377	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
478	454	5	6	2018-09-07	\N	119	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
479	454	5	6	2018-08-30	\N	12	4	\N	\N	\N	1447	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
480	170	1	2	2016-06-22	\N	45	4	\N	2654	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
481	170	1	124	2005-03-12	\N	10	4	969	2655	2271	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
482	170	1	9	1996-06-13	\N	10	92	\N	2611	2272	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
483	170	43	6	2016-09-12	\N	45	4	970	2652	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
484	170	13	6	2010-06-29	\N	10	172	\N	\N	2273	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
485	170	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
486	170	5	6	2021-01-08	\N	173	4	\N	\N	\N	1448	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
487	170	5	6	2020-01-03	\N	19	4	\N	\N	\N	1449	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
488	170	5	6	2019-09-13	\N	174	4	\N	\N	\N	1450	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
489	170	5	6	2018-08-30	\N	12	4	\N	\N	\N	1451	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
490	170	5	6	2018-05-23	\N	21	4	\N	\N	\N	1452	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
491	170	5	6	2018-04-27	\N	21	4	\N	\N	\N	1252	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
492	492	1	35	1992-06-15	\N	91	92	\N	2656	571	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
493	492	13	6	2020-06-30	\N	175	4	\N	\N	2274	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
494	492	5	6	2021-02-05	\N	8	4	\N	\N	\N	1453	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
495	492	5	6	2020-12-02	\N	118	4	\N	\N	\N	1370	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
496	492	5	6	2019-09-27	\N	176	4	\N	\N	\N	1454	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
497	492	5	6	2019-09-18	\N	42	4	\N	\N	\N	1390	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
498	492	5	6	2019-03-06	\N	50	4	\N	\N	\N	1455	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
499	492	5	6	2018-12-04	\N	121	4	\N	\N	\N	1456	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
500	492	5	6	2018-11-30	\N	21	4	\N	\N	\N	1457	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
501	492	5	6	2018-10-31	\N	176	4	\N	\N	\N	1458	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
502	492	5	6	2018-06-07	\N	121	4	\N	\N	\N	1459	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
503	492	5	6	2018-05-23	\N	81	4	\N	\N	\N	1460	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
504	171	1	2	2013-06-29	\N	177	4	971	2657	2275	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
505	171	1	124	2003-06-26	\N	10	178	972	2658	2276	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
506	171	1	35	1993-06-26	\N	10	4	973	2659	2277	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
507	171	13	6	2000-06-08	\N	26	148	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
508	171	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
509	171	5	6	2020-09-22	\N	19	4	\N	\N	\N	1346	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
510	171	5	6	2019-11-28	\N	12	4	\N	\N	\N	1461	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
511	171	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
512	171	5	6	2019-09-06	\N	12	4	\N	\N	\N	1462	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
513	171	5	6	2018-12-04	\N	21	4	\N	\N	\N	1463	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
514	171	5	6	2018-11-06	\N	21	4	\N	\N	\N	1464	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
515	171	5	6	2018-03-23	\N	63	4	\N	\N	\N	1465	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
516	172	1	9	2013-02-01	\N	10	4	\N	2660	2226	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
517	172	13	6	2020-11-07	\N	46	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
518	172	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
519	172	5	6	2020-11-27	\N	8	4	\N	\N	\N	1466	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
520	172	5	6	2020-11-07	\N	46	4	\N	\N	\N	1467	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
521	172	5	6	2019-03-12	\N	21	4	\N	\N	\N	1464	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
522	513	1	101	1998-06-25	\N	10	4	974	\N	2278	\N	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
523	513	43	6	2020-09-15	\N	15	4	934	2661	\N	\N	\N	\N	\N	1	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
524	273	1	2	2012-06-27	\N	26	4	\N	2662	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
525	273	1	35	2006-07-06	\N	179	4	\N	\N	2279	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
526	273	1	11	2002-05-25	\N	180	181	975	\N	2280	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
527	273	13	6	2006-06-16	\N	182	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
528	273	5	6	2017-12-28	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
529	273	5	6	2020-12-03	\N	21	4	\N	\N	\N	1468	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
530	273	5	6	2018-12-13	\N	21	4	\N	\N	\N	1469	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
531	273	5	6	2018-08-21	\N	138	4	\N	\N	\N	1470	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
532	273	5	6	2018-03-23	\N	139	4	\N	\N	\N	1443	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
533	470	1	2	2016-06-30	\N	26	4	\N	2663	2281	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
534	470	39	40	2010-07-15	\N	183	4	976	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
535	470	43	6	2019-09-18	\N	26	4	977	2663	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
536	470	43	6	2018-09-19	\N	26	4	978	2664	\N	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
537	470	5	6	2016-12-30	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
538	470	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
539	470	5	6	2020-10-03	\N	60	4	\N	\N	\N	1471	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
540	470	5	6	2020-08-25	\N	21	4	\N	\N	\N	1409	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
541	470	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
542	256	1	122	2015-11-24	\N	26	4	979	2621	507	\N	\N	\N	\N	0	2021-04-09 15:19:19	2021-11-02 11:06:20	0	0	0
543	256	1	2	2009-07-07	\N	26	4	\N	2665	2282	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
544	256	1	9	2007-07-03	\N	26	4	\N	2666	2283	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
545	256	13	6	2020-04-27	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
546	256	5	6	2017-12-28	\N	12	4	\N	\N	\N	1472	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
547	256	5	6	2020-09-25	\N	21	4	\N	\N	\N	1473	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
548	256	5	6	2020-02-13	\N	21	4	\N	\N	\N	1474	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
549	256	5	6	2019-08-21	\N	21	4	\N	\N	\N	1475	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
550	256	5	6	2019-04-12	\N	184	4	\N	\N	\N	1476	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
551	256	5	6	2019-04-05	\N	185	4	\N	\N	\N	1477	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
552	256	5	6	2018-12-27	\N	186	4	\N	\N	\N	1478	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
553	256	5	6	2018-11-08	\N	21	4	\N	\N	\N	1479	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
554	256	5	6	2018-06-22	\N	187	4	\N	\N	\N	1480	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
555	256	5	6	2018-05-23	\N	188	4	\N	\N	\N	1481	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
556	256	5	6	2018-05-23	\N	188	4	\N	\N	\N	1482	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
557	256	5	6	2018-05-23	\N	188	4	\N	\N	\N	1483	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
558	256	5	6	2018-05-23	\N	188	4	\N	\N	\N	1484	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
559	256	5	6	2018-05-23	\N	188	4	\N	\N	\N	1485	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
560	256	5	6	2018-04-12	\N	152	4	\N	\N	\N	1486	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
561	385	1	2	2012-06-29	\N	10	189	\N	2667	2284	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
562	385	1	35	2010-07-01	\N	10	4	\N	\N	2285	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
563	385	39	40	2005-07-18	\N	190	4	980	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
564	385	13	6	2019-10-21	\N	176	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
565	385	13	6	2005-07-15	\N	191	4	\N	\N	2286	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
566	385	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
567	385	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
568	385	5	6	2020-09-03	\N	21	4	\N	\N	\N	1352	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
569	385	5	6	2020-08-31	\N	192	4	\N	\N	\N	1487	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
570	385	5	6	2020-08-25	\N	21	4	\N	\N	\N	1488	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
571	385	5	6	2020-05-28	\N	21	4	\N	\N	\N	1489	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
572	385	5	6	2019-11-07	\N	42	4	\N	\N	\N	1376	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
573	385	5	6	2019-10-22	\N	193	4	\N	\N	\N	1490	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
574	385	5	6	2019-10-02	\N	117	4	\N	\N	\N	1491	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
575	385	5	6	2018-10-26	\N	193	4	\N	\N	\N	1492	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
576	385	5	6	2018-10-23	\N	193	4	\N	\N	\N	1493	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
577	127	1	9	2007-07-03	\N	26	4	981	\N	2287	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
578	127	1	11	2003-07-10	\N	128	194	964	\N	2262	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
579	127	13	6	2016-09-24	\N	88	4	\N	\N	2288	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
580	127	13	6	2011-06-13	\N	26	148	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
581	127	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
582	127	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
583	127	5	6	2020-10-30	\N	60	4	\N	\N	\N	1408	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
584	127	5	6	2020-09-03	\N	21	4	\N	\N	\N	1494	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
585	127	5	6	2020-05-28	\N	21	4	\N	\N	\N	1489	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
586	127	5	6	2019-10-17	\N	21	4	\N	\N	\N	1495	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
587	127	5	6	2019-05-31	\N	44	4	\N	\N	\N	1496	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
588	127	5	6	2019-04-12	\N	195	4	\N	\N	\N	1497	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
589	127	5	6	2018-09-17	\N	50	4	\N	\N	\N	1498	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
590	331	1	2	1997-12-17	\N	15	4	890	\N	2289	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
591	331	1	35	1987-07-29	\N	196	4	\N	\N	2290	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
592	331	5	6	2016-06-27	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
593	331	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
594	331	5	6	2020-08-24	\N	197	4	\N	\N	\N	1499	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
595	331	5	6	2019-03-15	\N	197	4	\N	\N	\N	1500	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
596	331	5	6	2018-12-14	\N	21	4	\N	\N	\N	1501	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
597	331	5	6	2018-08-29	\N	197	4	\N	\N	\N	1499	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
598	262	1	32	2004-06-18	\N	69	4	982	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
599	262	1	35	2003-06-18	\N	69	4	\N	2668	2224	\N	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
600	262	1	101	2002-06-28	\N	69	4	\N	2669	2291	\N	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
601	262	13	6	2019-04-26	2024-04-25	198	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
602	262	13	6	2014-05-21	2019-05-20	199	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
603	262	5	6	2016-01-28	\N	117	4	\N	\N	\N	1502	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
604	262	5	6	2021-02-26	\N	69	4	\N	\N	\N	1503	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
605	262	5	6	2020-02-14	\N	46	4	\N	\N	\N	1504	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
606	262	5	6	2019-11-01	\N	46	4	\N	\N	\N	1505	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
607	262	5	6	2019-03-05	\N	84	4	\N	\N	\N	1506	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
608	262	5	6	2019-02-27	\N	21	4	\N	\N	\N	1507	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
609	262	5	6	2018-11-09	\N	46	4	\N	\N	\N	1505	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
610	262	5	6	2018-04-20	\N	200	4	\N	\N	\N	1508	\N	\N	\N	1	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
611	147	1	2	2008-06-28	\N	10	201	\N	2670	2292	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
612	147	1	35	2006-01-16	\N	10	4	\N	\N	2293	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
613	147	1	9	2004-07-01	\N	10	202	\N	2671	2294	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
614	147	1	11	1991-06-20	\N	203	4	\N	2672	2295	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
615	147	13	6	2004-06-18	\N	204	4	\N	\N	2296	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
616	147	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
617	147	5	6	2021-02-15	\N	205	4	\N	\N	\N	1509	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
618	147	5	6	2020-08-14	\N	117	4	\N	\N	\N	1510	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
619	147	5	6	2019-09-06	\N	12	4	\N	\N	\N	1511	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
620	147	5	6	2019-08-15	\N	117	4	\N	\N	\N	1512	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
621	147	5	6	2019-01-10	\N	206	4	\N	\N	\N	1513	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
622	147	5	6	2018-08-30	\N	12	4	\N	\N	\N	1514	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
623	228	1	35	1991-06-28	\N	10	4	\N	2673	2297	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
624	228	13	6	2006-10-12	\N	76	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
625	228	5	6	2020-04-20	\N	21	4	\N	\N	\N	1515	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
626	228	5	6	2020-03-14	\N	207	4	\N	\N	\N	1516	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
627	228	5	6	2019-11-21	\N	80	4	\N	\N	\N	1285	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
628	228	5	6	2019-10-24	\N	21	4	\N	\N	\N	1517	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
629	228	5	6	2019-09-27	\N	176	4	\N	\N	\N	1518	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
630	228	5	6	2019-09-18	\N	42	4	\N	\N	\N	1390	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
631	228	5	6	2019-09-18	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
632	228	5	6	2019-08-22	\N	208	4	\N	\N	\N	1519	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
633	228	5	6	2019-01-15	\N	121	4	\N	\N	\N	1520	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
634	451	1	14	2003-06-26	\N	26	4	953	2674	2298	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
635	451	1	11	1996-06-16	\N	53	4	\N	2639	2252	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
636	451	1	11	1973-07-05	\N	76	209	\N	2675	2299	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
637	451	13	6	2003-05-30	\N	210	4	\N	\N	2300	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
638	451	13	6	1997-06-11	\N	204	4	\N	\N	2301	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
639	451	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
640	451	5	6	2020-05-29	\N	20	4	\N	\N	\N	1521	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
641	451	5	6	2019-11-25	\N	12	4	\N	\N	\N	1522	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
642	451	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
643	451	5	6	2019-09-06	\N	12	4	\N	\N	\N	1462	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
644	451	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
645	451	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
646	451	5	6	2018-08-30	\N	12	4	\N	\N	\N	1523	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
647	405	1	11	2015-07-02	\N	12	4	975	\N	585	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
648	405	13	6	2016-08-11	\N	15	4	\N	\N	2274	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
649	405	13	6	2016-04-30	\N	15	4	\N	\N	2302	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
650	405	5	6	2016-06-27	\N	12	4	\N	\N	\N	1524	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
651	405	5	6	2019-09-06	\N	12	4	\N	\N	\N	1511	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
652	405	5	6	2019-04-09	\N	121	4	\N	\N	\N	1459	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
653	405	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
654	405	5	6	2018-08-30	\N	12	4	\N	\N	\N	1257	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
655	405	5	6	2018-06-15	\N	163	4	\N	\N	\N	1525	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
656	251	1	32	1997-07-04	\N	26	129	983	2676	2303	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
657	251	1	35	1987-06-23	\N	211	4	\N	2677	2304	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
658	251	1	11	1982-04-28	\N	212	4	\N	2678	2305	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
659	251	13	6	2010-11-17	\N	21	4	\N	\N	2306	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
660	251	13	6	1995-06-06	\N	204	4	\N	\N	2301	\N	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
661	251	5	6	2021-03-17	\N	213	4	\N	\N	\N	1526	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
662	251	5	6	2021-03-12	\N	192	4	\N	\N	\N	1527	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
663	251	5	6	2021-01-05	\N	50	4	\N	\N	\N	1528	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
664	251	5	6	2020-12-29	\N	214	4	\N	\N	\N	1529	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
665	251	5	6	2020-12-21	\N	214	4	\N	\N	\N	1530	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
666	251	5	6	2020-12-12	\N	117	4	\N	\N	\N	1531	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
667	251	5	6	2020-12-08	\N	215	4	\N	\N	\N	1532	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
668	251	5	6	2020-12-04	\N	120	4	\N	\N	\N	1533	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
669	251	5	6	2020-12-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
670	251	5	6	2020-12-02	\N	118	4	\N	\N	\N	1370	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
671	251	5	6	2020-11-26	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
672	251	5	6	2020-11-25	\N	8	4	\N	\N	\N	1534	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
673	251	5	6	2020-11-19	\N	216	4	\N	\N	\N	1535	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
674	251	5	6	2020-10-21	\N	217	4	\N	\N	\N	1536	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
675	251	5	6	2020-06-09	\N	21	4	\N	\N	\N	1352	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
676	251	5	6	2020-04-21	\N	215	4	\N	\N	\N	1537	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
677	251	5	6	2020-01-02	\N	218	4	\N	\N	\N	1538	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
678	251	5	6	2019-11-28	\N	12	4	\N	\N	\N	1461	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
679	251	5	6	2019-11-07	\N	63	4	\N	\N	\N	1539	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
680	251	5	6	2019-09-19	\N	219	4	\N	\N	\N	1454	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
681	251	5	6	2019-09-06	\N	12	4	\N	\N	\N	1540	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
682	251	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
683	251	5	6	2019-05-20	\N	21	4	\N	\N	\N	1244	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
684	251	5	6	2019-05-02	\N	12	4	\N	\N	\N	1541	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
685	251	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
686	251	5	6	2019-01-31	\N	21	4	\N	\N	\N	1468	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
687	251	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
688	251	5	6	2018-11-28	\N	21	4	\N	\N	\N	1542	\N	\N	\N	0	2021-04-09 15:19:20	2021-11-02 11:06:20	0	0	0
689	251	5	6	2018-08-30	\N	12	4	\N	\N	\N	1379	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
690	251	5	6	2018-08-13	\N	66	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
691	251	5	6	2018-04-20	2021-01-01	220	4	\N	\N	\N	\N	1175	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:03:11	0	0	0
692	217	1	2	2016-01-29	\N	45	4	\N	2679	2307	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
693	217	1	9	2013-06-25	\N	10	4	984	2680	2308	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
694	217	1	11	2000-03-24	\N	128	4	\N	2681	2309	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
695	217	13	6	2015-12-04	\N	45	4	\N	\N	2310	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
696	217	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
697	217	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
698	217	5	6	2020-09-29	\N	221	4	\N	\N	\N	1543	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
699	217	5	6	2020-05-29	\N	8	4	\N	\N	\N	1544	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
700	217	5	6	2019-11-07	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
701	181	1	32	2004-06-21	\N	10	134	985	\N	2311	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
702	181	1	123	1996-06-20	\N	26	222	986	\N	2312	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
703	181	1	35	1996-06-20	\N	26	222	987	2682	2313	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
704	181	1	9	1994-06-28	\N	26	222	986	2683	2314	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
705	181	13	6	1995-06-08	\N	204	4	\N	\N	2301	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
706	181	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
707	181	5	6	2021-02-22	\N	21	4	\N	\N	\N	1545	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
708	181	5	6	2020-12-10	\N	20	4	\N	\N	\N	1546	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
709	181	5	6	2020-04-01	\N	19	4	\N	\N	\N	1547	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
710	181	5	6	2020-01-03	\N	19	4	\N	\N	\N	1449	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
711	181	5	6	2019-11-28	\N	12	4	\N	\N	\N	1461	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
712	181	5	6	2019-09-20	\N	21	4	\N	\N	\N	1548	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
713	181	5	6	2019-09-06	\N	12	4	\N	\N	\N	1540	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
714	181	5	6	2019-08-21	\N	21	4	\N	\N	\N	1549	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
715	181	5	6	2019-05-27	\N	163	4	\N	\N	\N	1550	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
716	181	5	6	2019-05-20	\N	21	4	\N	\N	\N	1551	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
717	181	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
718	181	5	6	2019-03-05	\N	12	4	\N	\N	\N	1552	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
719	181	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
720	181	5	6	2018-10-23	\N	119	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
721	181	5	6	2018-08-30	\N	12	4	\N	\N	\N	1379	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
722	181	5	6	2018-05-25	\N	21	4	\N	\N	\N	1468	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
723	181	5	6	2018-05-23	\N	12	4	\N	\N	\N	1553	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
724	181	5	6	2018-04-27	\N	21	4	\N	\N	\N	1252	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
725	181	5	6	2018-04-23	\N	21	4	\N	\N	\N	1554	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
726	115	39	40	1991-06-20	\N	223	4	988	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
727	115	43	6	2018-08-17	\N	10	172	989	2603	\N	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
728	115	13	6	2018-12-01	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
729	115	5	6	2020-12-10	\N	12	4	\N	\N	\N	1395	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
730	115	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
731	115	5	6	2020-05-29	\N	20	4	\N	\N	\N	1555	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
732	115	5	6	2019-05-02	\N	12	4	\N	\N	\N	1556	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
733	115	5	6	2019-04-02	\N	21	4	\N	\N	\N	1557	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
734	115	5	6	2019-03-05	\N	21	4	\N	\N	\N	1558	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
735	387	1	35	1985-07-06	\N	91	224	\N	2684	2315	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
736	387	5	6	2015-03-17	\N	225	4	\N	\N	\N	1559	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
737	387	5	6	2020-10-19	\N	216	4	\N	\N	\N	1560	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
738	387	5	6	2020-08-25	\N	10	4	\N	\N	\N	1561	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
739	387	5	6	2019-11-29	\N	226	4	\N	\N	\N	1562	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
740	387	5	6	2019-09-18	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
741	387	5	6	2019-09-18	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
742	387	5	6	2019-08-27	\N	81	4	\N	\N	\N	1563	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
743	387	5	6	2018-12-28	\N	78	4	\N	\N	\N	1564	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
744	456	1	2	1981-06-30	\N	23	227	\N	2685	2316	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
745	456	5	6	2020-11-07	\N	228	4	\N	\N	\N	1565	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
746	456	5	6	2019-10-12	\N	228	4	\N	\N	\N	1566	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
747	456	5	6	2019-09-28	\N	163	4	\N	\N	\N	1567	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
748	456	5	6	2019-03-22	\N	229	4	\N	\N	\N	1568	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
749	456	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
750	456	5	6	2018-10-26	\N	12	4	\N	\N	\N	1569	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
751	456	5	6	2018-10-26	\N	163	4	\N	\N	\N	1570	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
752	456	5	6	2018-10-13	\N	228	4	\N	\N	\N	1571	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
753	408	1	14	2004-06-29	\N	26	4	\N	2674	2317	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
754	408	1	35	1972-06-14	\N	230	4	\N	2686	2318	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
755	408	13	6	2003-06-12	\N	204	4	\N	\N	2319	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
756	408	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
757	408	5	6	2019-11-09	\N	21	4	\N	\N	\N	1572	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
758	408	5	6	2019-10-03	\N	166	4	\N	\N	\N	1432	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
759	408	5	6	2019-01-31	\N	231	4	\N	\N	\N	1573	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
760	408	5	6	2018-10-09	\N	166	4	\N	\N	\N	1574	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
761	408	5	6	2018-08-30	\N	12	4	\N	\N	\N	1358	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
762	148	1	35	1977-06-17	\N	196	232	\N	2687	2320	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
763	148	13	6	2010-12-18	\N	45	4	\N	\N	2321	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
764	148	5	6	2018-10-23	\N	105	4	\N	\N	\N	1575	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
765	148	5	6	2020-12-30	\N	233	4	\N	\N	\N	1576	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
766	148	5	6	2019-12-30	\N	233	4	\N	\N	\N	1577	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
767	148	5	6	2019-11-28	\N	234	4	\N	\N	\N	1578	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
768	148	5	6	2019-10-23	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
769	148	5	6	2018-12-28	\N	233	4	\N	\N	\N	1579	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
770	148	5	6	2018-10-10	\N	21	4	\N	\N	\N	1325	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
771	148	5	6	2018-10-02	\N	21	4	\N	\N	\N	1580	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
772	148	5	6	2018-09-27	\N	235	4	\N	\N	\N	1581	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
773	148	5	6	2018-05-11	\N	21	4	\N	\N	\N	1582	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
774	188	1	9	2001-04-17	\N	69	4	\N	2688	2322	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
775	188	1	2	2000-06-28	\N	15	4	\N	2689	2289	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
776	188	1	35	1995-03-31	\N	15	4	\N	2690	2323	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
777	188	1	9	1995-03-24	\N	15	4	\N	2691	2324	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
778	188	43	6	2018-09-26	\N	69	4	990	2692	\N	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
779	188	5	6	2017-10-11	\N	236	4	\N	\N	\N	1583	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
780	188	5	6	2020-10-06	\N	21	4	\N	\N	\N	1322	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
781	188	5	6	2020-08-20	\N	69	4	\N	\N	\N	1445	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
782	188	5	6	2019-11-05	\N	12	4	\N	\N	\N	1584	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
783	188	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
784	188	5	6	2018-08-30	\N	12	4	\N	\N	\N	1257	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
785	403	1	14	2000-06-01	\N	26	148	991	2638	562	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
786	403	1	11	1996-06-16	\N	53	4	\N	2639	2252	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
787	403	39	150	1972-07-05	\N	151	4	992	\N	2299	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
788	403	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
789	403	5	6	2020-12-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
790	403	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
791	403	5	6	2020-05-29	\N	20	4	\N	\N	\N	1521	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
792	403	5	6	2019-11-25	\N	12	4	\N	\N	\N	1585	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
793	403	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
794	403	5	6	2019-05-02	\N	12	4	\N	\N	\N	1586	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
795	403	5	6	2019-05-02	\N	12	4	\N	\N	\N	1541	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
796	403	5	6	2019-03-05	\N	12	4	\N	\N	\N	1552	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
797	403	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
798	403	5	6	2018-09-07	\N	119	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
799	403	5	6	2018-08-30	\N	12	4	\N	\N	\N	1587	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
800	403	5	6	2018-05-11	\N	21	4	\N	\N	\N	1582	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
801	11	1	35	1980-06-28	\N	67	4	993	2693	\N	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
802	11	13	6	2015-01-31	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
803	11	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
804	11	5	6	2019-04-29	\N	192	4	\N	\N	\N	1588	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
805	11	5	6	2018-10-25	\N	237	4	\N	\N	\N	1589	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
806	11	5	6	2018-09-21	\N	237	4	\N	\N	\N	1590	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
807	11	5	6	2018-06-15	\N	238	4	\N	\N	\N	1591	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
808	205	1	2	1995-12-07	\N	10	239	\N	2611	2325	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
809	205	1	35	1994-06-20	\N	10	4	\N	2694	2326	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
810	205	1	9	1994-06-13	\N	10	240	\N	2695	2327	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
811	205	5	6	2017-12-28	\N	12	4	\N	\N	\N	1592	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
812	205	5	6	2020-12-11	\N	241	4	\N	\N	\N	1593	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
813	205	5	6	2020-06-09	\N	21	4	\N	\N	\N	1352	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
814	205	5	6	2020-03-06	\N	21	4	\N	\N	\N	1594	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
815	205	5	6	2020-02-25	\N	21	4	\N	\N	\N	1595	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
816	205	5	6	2020-01-03	\N	19	4	\N	\N	\N	1449	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
817	205	5	6	2019-06-12	\N	12	4	\N	\N	\N	1596	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
818	205	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
819	205	5	6	2019-05-15	\N	21	4	\N	\N	\N	1597	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
820	205	5	6	2019-05-09	\N	12	4	\N	\N	\N	1598	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
821	205	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
822	205	5	6	2018-11-22	\N	100	4	\N	\N	\N	1599	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
823	205	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
824	205	5	6	2018-06-07	\N	121	4	\N	\N	\N	1459	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
825	205	5	6	2018-05-23	\N	12	4	\N	\N	\N	1600	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
826	205	5	6	2018-05-10	\N	21	4	\N	\N	\N	1601	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
827	205	5	6	2018-04-27	\N	21	4	\N	\N	\N	1252	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
828	205	5	6	2018-04-23	\N	21	4	\N	\N	\N	1602	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
829	471	1	35	1990-05-25	\N	242	4	\N	2696	2328	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
830	471	13	6	2009-01-01	\N	204	4	\N	\N	2329	\N	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
831	471	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
832	366	1	32	2003-06-26	\N	10	134	994	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
833	366	1	2	1979-06-18	\N	211	4	\N	2697	2330	\N	\N	\N	\N	1	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
834	366	43	6	2011-08-18	\N	26	243	995	2698	\N	\N	\N	\N	\N	1	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
835	366	13	6	2000-06-07	\N	204	4	\N	\N	2319	\N	\N	\N	\N	1	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
836	366	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	1	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
837	366	5	6	2019-09-06	\N	12	4	\N	\N	\N	1540	\N	\N	\N	1	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
838	366	5	6	2019-05-20	\N	21	4	\N	\N	\N	1244	\N	\N	\N	1	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
839	366	5	6	2019-05-02	\N	12	4	\N	\N	\N	1541	\N	\N	\N	1	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
840	366	5	6	2019-01-31	\N	21	4	\N	\N	\N	1468	\N	\N	\N	1	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
841	366	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	1	2021-04-09 15:19:21	2021-11-02 11:06:20	0	0	0
842	366	5	6	2018-08-30	\N	12	4	\N	\N	\N	1603	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
843	332	1	2	1984-06-27	\N	67	4	\N	2699	2331	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
844	332	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
845	332	5	6	2020-10-23	\N	176	4	\N	\N	\N	1604	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
846	332	5	6	2020-09-30	\N	21	4	\N	\N	\N	1306	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
847	332	5	6	2020-09-25	\N	66	4	\N	\N	\N	1605	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
848	332	5	6	2020-08-24	\N	197	4	\N	\N	\N	1499	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
849	332	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
850	332	5	6	2019-08-22	\N	197	4	\N	\N	\N	1606	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
851	332	5	6	2019-05-02	\N	12	4	\N	\N	\N	1541	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
852	332	5	6	2019-03-15	\N	197	4	\N	\N	\N	1607	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
853	332	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
854	332	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
855	332	5	6	2018-08-29	\N	197	4	\N	\N	\N	1499	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
856	332	5	6	2018-05-10	\N	21	4	\N	\N	\N	1608	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
857	438	1	35	1978-07-01	\N	196	4	\N	2599	2332	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
858	438	13	6	2016-10-27	\N	15	4	\N	\N	2333	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
859	438	5	6	2018-10-24	\N	105	4	\N	\N	\N	1609	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
860	438	5	6	2020-10-20	\N	244	4	\N	\N	\N	1610	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
861	438	5	6	2020-06-04	\N	65	4	\N	\N	\N	1611	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
862	438	5	6	2019-10-23	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
863	438	5	6	2019-08-22	\N	21	4	\N	\N	\N	1612	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
864	438	5	6	2018-08-23	\N	27	4	\N	\N	\N	1613	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
865	438	5	6	2018-08-20	\N	245	4	\N	\N	\N	1614	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
866	438	5	6	2018-05-08	\N	121	4	\N	\N	\N	1615	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
867	193	1	2	1995-06-20	\N	10	189	\N	2700	2334	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
868	193	1	35	1992-06-26	\N	10	4	950	2701	2239	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
869	193	13	6	2020-01-21	\N	246	4	\N	\N	2335	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
870	193	13	6	2019-05-16	\N	246	4	\N	\N	2336	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
871	193	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
872	193	5	6	2020-12-14	\N	110	4	\N	\N	\N	1616	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
873	193	5	6	2020-06-03	\N	62	4	\N	\N	\N	1617	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
874	193	5	6	2019-11-07	\N	42	4	\N	\N	\N	1280	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
875	193	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
876	193	5	6	2019-05-16	\N	246	4	\N	\N	\N	1618	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
877	193	5	6	2018-08-30	\N	12	4	\N	\N	\N	1619	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
878	193	5	6	2018-06-18	\N	247	4	\N	\N	\N	1620	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
879	514	13	6	2020-11-07	\N	46	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
880	514	5	6	2020-11-07	\N	46	4	\N	\N	\N	1621	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
881	161	13	6	2008-03-28	\N	10	248	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
882	161	5	6	2018-10-25	\N	77	4	\N	\N	\N	1387	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
883	161	5	6	2018-10-26	\N	249	4	\N	\N	\N	1622	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
884	161	5	6	2018-04-07	\N	21	4	\N	\N	\N	1623	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
885	515	1	101	2017-06-29	\N	10	4	996	2702	2337	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
886	515	39	40	2014-06-30	\N	250	4	997	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
887	515	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
888	173	1	11	2003-07-07	\N	251	4	998	2703	2338	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
889	173	1	101	2000-06-30	\N	45	252	999	2704	2339	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
890	173	1	35	1999-08-14	\N	45	253	1000	2705	2340	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
891	173	1	11	1994-05-27	\N	254	4	1001	2706	2341	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
892	173	1	11	1989-06-30	\N	151	4	1002	2707	2342	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
893	173	5	6	2020-12-10	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
894	173	5	6	2020-11-19	\N	236	4	\N	\N	\N	1624	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
895	173	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
896	173	5	6	2021-01-27	\N	255	4	\N	\N	\N	1625	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
897	173	5	6	2020-08-27	\N	256	4	\N	\N	\N	1626	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
898	173	5	6	2020-06-17	\N	8	4	\N	\N	\N	1627	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
899	173	5	6	2020-04-07	\N	62	4	\N	\N	\N	1628	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
900	173	5	6	2019-08-28	\N	66	4	\N	\N	\N	1629	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
901	173	5	6	2019-05-02	\N	12	4	\N	\N	\N	1586	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
902	173	5	6	2018-08-30	\N	12	4	\N	\N	\N	1630	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
903	154	1	32	2017-06-22	\N	257	4	1003	2708	2343	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
904	154	1	32	2014-01-31	\N	15	4	934	2652	2243	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
905	154	1	2	2002-07-03	\N	26	4	934	\N	2344	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
906	154	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
907	154	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
908	287	1	2	1993-06-17	\N	26	4	\N	2709	2345	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
909	287	13	6	2018-04-12	\N	152	4	\N	\N	2346	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
910	287	13	6	2018-02-27	\N	152	4	\N	\N	2254	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
911	287	13	6	2015-10-16	\N	45	4	\N	\N	2215	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
912	287	5	6	2020-12-10	\N	12	4	\N	\N	\N	1362	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
913	287	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
914	287	5	6	2020-05-21	\N	258	4	\N	\N	\N	1631	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
915	287	5	6	2019-04-25	\N	21	4	\N	\N	\N	1632	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
916	287	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
917	302	1	11	2002-06-19	\N	259	4	928	2710	602	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
918	302	13	6	2020-11-07	\N	46	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
919	302	5	6	2020-12-10	\N	12	4	\N	\N	\N	1362	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
920	302	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
921	302	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
922	302	5	6	2020-11-07	\N	46	4	\N	\N	\N	1467	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
923	104	1	35	2003-02-07	\N	10	224	\N	2711	2347	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
924	104	13	6	2005-11-30	\N	260	4	\N	\N	2348	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
925	104	13	6	2001-12-28	\N	260	4	\N	\N	2349	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
926	104	5	6	2018-05-11	\N	261	4	\N	\N	\N	1633	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
927	104	5	6	2020-11-30	\N	71	4	\N	\N	\N	1268	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
928	104	5	6	2020-11-11	\N	21	4	\N	\N	\N	1634	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
929	104	5	6	2020-08-12	\N	72	4	\N	\N	\N	1297	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
930	104	5	6	2020-08-11	\N	20	4	\N	\N	\N	1635	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
931	104	5	6	2020-01-09	\N	262	4	\N	\N	\N	1636	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
932	104	5	6	2019-12-23	\N	255	4	\N	\N	\N	1637	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
933	104	5	6	2019-11-27	\N	226	4	\N	\N	\N	1638	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
934	104	5	6	2019-08-28	\N	72	4	\N	\N	\N	1639	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
935	104	5	6	2018-11-13	\N	72	4	\N	\N	\N	1640	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
936	104	5	6	2018-10-25	\N	72	4	\N	\N	\N	1641	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
937	104	5	6	2018-08-20	\N	20	4	\N	\N	\N	1642	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
938	104	263	32	1987-06-17	\N	67	224	\N	2712	2350	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
939	516	1	2	2012-06-22	\N	264	4	\N	2713	528	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
940	516	1	2	2012-02-28	\N	265	4	\N	2714	2351	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
941	516	13	6	2019-10-12	\N	175	4	\N	\N	2352	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
942	516	13	6	2016-01-29	\N	45	4	\N	\N	2353	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
943	516	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
944	516	5	6	2021-01-14	\N	21	4	\N	\N	\N	1643	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
945	516	5	6	2020-12-10	\N	266	4	\N	\N	\N	1644	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
946	516	5	6	2020-12-10	\N	229	4	\N	\N	\N	1645	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
947	516	5	6	2020-12-09	\N	74	4	\N	\N	\N	1646	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
948	516	5	6	2020-12-03	\N	218	4	\N	\N	\N	1647	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
949	516	5	6	2020-11-25	\N	60	4	\N	\N	\N	1648	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
950	516	5	6	2020-10-16	\N	267	4	\N	\N	\N	1649	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
951	516	5	6	2020-05-25	\N	21	4	\N	\N	\N	1650	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
952	516	5	6	2019-11-21	\N	62	4	\N	\N	\N	1651	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
953	516	5	6	2019-10-12	\N	175	4	\N	\N	\N	1652	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
954	516	5	6	2019-09-18	\N	42	4	\N	\N	\N	1653	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
955	516	5	6	2019-04-26	\N	265	4	\N	\N	\N	1654	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
956	516	5	6	2019-03-19	\N	268	4	\N	\N	\N	1655	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
957	516	5	6	2018-11-30	\N	21	4	\N	\N	\N	1656	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
958	516	5	6	2018-08-25	\N	52	4	\N	\N	\N	1657	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
959	516	5	6	2018-06-19	\N	117	4	\N	\N	\N	1658	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
960	516	5	6	2018-06-18	\N	105	4	\N	\N	\N	1659	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
961	516	5	6	2018-04-16	\N	269	4	\N	\N	\N	1660	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
962	28	1	9	2009-06-29	\N	10	4	\N	2715	2354	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
963	28	1	11	2006-07-04	\N	128	4	\N	2716	2262	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
964	28	5	6	2020-08-27	\N	60	4	\N	\N	\N	1661	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
965	388	1	14	2005-11-05	\N	55	4	\N	2605	2201	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
966	388	1	2	1980-06-24	\N	91	270	\N	2717	2355	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
967	388	5	6	2019-04-16	\N	105	4	\N	\N	\N	1364	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
968	388	5	6	2019-03-06	\N	50	4	\N	\N	\N	1323	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
969	388	5	6	2019-02-09	\N	271	4	\N	\N	\N	1662	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
970	388	5	6	2019-01-28	\N	127	4	\N	\N	\N	1365	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
971	388	5	6	2018-10-24	\N	50	4	\N	\N	\N	1663	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
972	212	1	2	2008-02-23	\N	10	4	\N	2718	2356	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
973	212	1	2	2001-01-19	\N	272	4	\N	2719	2357	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
974	212	13	6	2020-07-03	\N	238	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
975	212	13	6	2020-06-11	\N	238	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
976	212	5	6	2020-02-14	\N	50	4	\N	\N	\N	1664	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
977	212	5	6	2020-11-26	\N	12	4	\N	\N	\N	807	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
978	212	5	6	2020-11-26	\N	12	4	\N	\N	\N	807	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
979	212	5	6	2020-11-24	\N	65	4	\N	\N	\N	1665	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
980	212	5	6	2020-10-30	\N	197	4	\N	\N	\N	1666	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
981	212	5	6	2019-02-20	\N	273	4	\N	\N	\N	1667	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
982	212	5	6	2018-05-08	\N	274	4	\N	\N	\N	1668	\N	\N	\N	1	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
983	116	1	2	2001-06-27	\N	272	4	\N	\N	2358	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:05:33	0	0	0
984	116	13	6	2017-10-27	\N	15	4	\N	\N	2333	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
985	116	5	6	2016-12-30	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
986	116	5	6	2019-04-02	\N	275	4	\N	\N	\N	1557	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
987	116	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
988	116	5	6	2018-11-30	\N	21	4	\N	\N	\N	1669	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
989	116	5	6	2018-08-30	\N	12	4	\N	\N	\N	1257	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
990	116	5	6	2018-06-07	\N	121	4	\N	\N	\N	1613	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
991	116	5	6	2018-04-10	\N	121	4	\N	\N	\N	1615	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
992	136	1	2	2004-06-21	\N	10	134	1004	2720	2311	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
993	136	1	2	1987-06-26	\N	23	4	1005	2620	666	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
994	136	13	6	2015-07-20	\N	26	4	\N	\N	2359	\N	\N	\N	\N	0	2021-04-09 15:19:22	2021-11-02 11:06:20	0	0	0
995	136	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
996	136	5	6	2020-12-14	\N	110	4	\N	\N	\N	1369	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
997	136	5	6	2019-09-06	\N	12	4	\N	\N	\N	1511	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
998	136	5	6	2019-06-13	\N	26	4	\N	\N	\N	1392	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
999	136	5	6	2018-12-06	\N	7	4	\N	\N	\N	1670	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1000	136	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1001	136	5	6	2018-10-26	\N	12	4	\N	\N	\N	1671	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1002	136	5	6	2018-10-26	\N	163	4	\N	\N	\N	1570	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1003	136	5	6	2018-10-24	\N	206	4	\N	\N	\N	1672	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1004	136	5	6	2018-08-30	\N	12	4	\N	\N	\N	1257	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1005	136	5	6	2018-08-17	\N	10	4	\N	\N	\N	1673	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1006	495	1	35	1995-06-17	\N	10	4	\N	2721	2360	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1007	495	1	2	1984-06-29	\N	36	4	\N	2722	763	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1008	495	1	35	\N	\N	10	4	\N	\N	2361	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1009	495	43	6	2013-05-07	\N	10	4	890	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1010	495	13	6	2013-12-16	\N	21	4	\N	\N	2362	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1011	495	5	6	2016-10-06	\N	88	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1012	495	5	6	2020-05-27	\N	21	4	\N	\N	\N	1674	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1013	495	5	6	2020-03-03	\N	26	4	\N	\N	\N	1675	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1014	495	5	6	2019-10-31	\N	276	4	\N	\N	\N	1676	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1015	495	5	6	2019-03-31	\N	163	4	\N	\N	\N	1677	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1016	495	5	6	2018-08-30	\N	277	4	\N	\N	\N	1678	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1017	445	1	2	2020-06-19	\N	15	4	1006	2723	2363	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1018	445	1	9	2008-09-04	\N	45	4	\N	2724	2364	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1019	445	13	6	2017-08-24	\N	15	4	\N	\N	2365	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1020	445	5	6	2016-06-27	\N	12	4	\N	\N	\N	1679	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1021	445	5	6	2019-11-28	\N	12	4	\N	\N	\N	1461	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1022	445	5	6	2018-04-21	\N	121	4	\N	\N	\N	1680	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1023	445	5	6	2018-04-13	\N	218	4	\N	\N	\N	1681	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1024	371	1	35	2001-06-21	\N	10	178	\N	2725	2366	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1025	371	1	9	2000-06-22	\N	10	178	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1026	371	39	40	1996-06-22	\N	278	4	1007	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1027	371	13	6	2008-09-27	\N	191	4	\N	\N	2367	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1028	371	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1029	371	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1030	371	5	6	2020-06-15	\N	21	4	\N	\N	\N	1682	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1031	371	5	6	2019-09-06	\N	12	4	\N	\N	\N	1511	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1032	371	5	6	2019-08-22	\N	197	4	\N	\N	\N	1499	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1033	371	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1034	371	5	6	2019-03-15	\N	197	4	\N	\N	\N	1500	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1035	371	5	6	2018-08-29	\N	197	4	\N	\N	\N	1606	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1036	112	1	32	2009-06-27	\N	10	4	\N	2652	2243	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1037	112	1	35	2007-07-03	\N	125	279	1008	2726	2368	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1038	112	43	6	2018-09-17	\N	192	4	1009	2727	\N	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1039	112	13	6	2019-05-31	\N	192	4	\N	\N	2369	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1040	112	5	6	2021-02-08	\N	217	4	\N	\N	\N	1683	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1041	112	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1042	112	5	6	2020-12-17	\N	280	4	\N	\N	\N	1684	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1043	112	5	6	2020-12-11	\N	118	4	\N	\N	\N	1388	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1044	112	5	6	2020-11-20	\N	10	4	\N	\N	\N	1685	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1045	112	5	6	2020-11-12	\N	100	4	\N	\N	\N	1686	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1046	112	5	6	2020-05-25	\N	21	4	\N	\N	\N	1489	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1047	112	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1048	112	5	6	2019-09-06	\N	12	4	\N	\N	\N	1540	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1049	112	5	6	2019-03-15	\N	197	4	\N	\N	\N	1500	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1050	112	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1051	112	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1052	112	5	6	2018-09-07	\N	66	4	\N	\N	\N	1265	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1053	112	5	6	2018-08-30	\N	12	4	\N	\N	\N	1687	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1054	112	5	6	2018-07-03	\N	21	4	\N	\N	\N	1688	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1055	517	1	35	1994-07-01	\N	10	4	\N	2728	2370	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1056	517	1	32	1994-06-30	\N	10	4	\N	\N	2371	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1057	517	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1058	368	1	124	2019-07-02	\N	10	4	955	2729	2372	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1059	368	1	35	2006-01-16	\N	10	4	\N	2730	2373	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1060	368	1	35	2005-03-04	\N	26	4	\N	2731	2374	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1061	368	1	32	2004-07-05	\N	10	4	\N	887	2375	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1062	368	43	6	2019-02-04	\N	10	4	1010	2649	\N	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1063	368	43	6	2017-09-18	\N	10	4	1010	2649	\N	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1064	368	5	6	2016-05-10	\N	117	4	\N	\N	\N	1689	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1065	368	5	6	2019-09-06	\N	12	4	\N	\N	\N	1462	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1066	368	5	6	2019-09-06	\N	12	4	\N	\N	\N	1374	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1067	368	5	6	2018-08-30	\N	12	4	\N	\N	\N	1690	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1068	229	1	124	2007-06-28	\N	10	189	1011	2732	2376	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1069	229	1	124	2005-02-15	\N	10	4	1012	2733	2377	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1070	229	1	2	1999-06-18	\N	281	240	1013	2734	2378	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1071	229	1	9	1998-06-19	\N	281	282	945	2611	2379	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1072	229	13	6	2018-10-20	\N	46	4	\N	\N	2380	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1073	229	13	6	2007-04-04	\N	268	4	\N	\N	2381	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1074	229	5	6	2018-05-11	\N	261	4	\N	\N	\N	1691	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1075	229	5	6	2020-10-21	\N	10	4	\N	\N	\N	1692	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1076	229	5	6	2020-08-12	\N	21	4	\N	\N	\N	1634	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1077	229	5	6	2020-04-21	\N	215	4	\N	\N	\N	1537	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1078	229	5	6	2020-01-09	\N	262	4	\N	\N	\N	1636	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1079	229	5	6	2019-12-23	\N	255	4	\N	\N	\N	1637	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1080	229	5	6	2019-11-27	\N	226	4	\N	\N	\N	1638	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1081	229	5	6	2019-11-12	\N	94	4	\N	\N	\N	1693	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1082	229	5	6	2019-11-06	\N	283	4	\N	\N	\N	1694	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1083	229	5	6	2019-09-30	\N	71	4	\N	\N	\N	1273	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1084	229	5	6	2019-03-14	\N	284	4	\N	\N	\N	1695	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1085	229	5	6	2019-03-12	\N	284	4	\N	\N	\N	1695	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1086	229	5	6	2019-01-11	\N	285	4	\N	\N	\N	1696	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1087	229	5	6	2018-11-13	\N	72	4	\N	\N	\N	1697	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1088	229	5	6	2018-10-25	\N	72	4	\N	\N	\N	1698	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1089	229	5	6	2018-10-21	\N	286	4	\N	\N	\N	1699	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1090	229	5	6	2018-08-24	\N	236	4	\N	\N	\N	1700	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1091	229	5	6	2018-08-22	\N	94	4	\N	\N	\N	1701	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1092	229	5	6	2018-06-07	\N	285	4	\N	\N	\N	1702	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1093	229	5	6	2018-05-25	\N	287	4	\N	\N	\N	1703	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1094	390	1	2	2007-06-28	\N	10	4	\N	2735	2382	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1095	390	1	35	2005-06-27	\N	10	4	\N	2735	2383	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1096	390	13	6	2019-10-21	\N	176	4	\N	\N	2384	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1097	390	5	6	2019-09-17	\N	288	4	\N	\N	\N	1704	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1098	390	5	6	2019-08-29	\N	236	4	\N	\N	\N	1705	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1099	390	5	6	2019-06-17	\N	117	4	\N	\N	\N	1705	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1100	390	5	6	2018-10-22	\N	289	4	\N	\N	\N	1706	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1101	489	1	2	2010-01-19	\N	45	4	\N	2736	2385	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1102	489	1	101	2006-12-05	\N	45	290	\N	2736	2386	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1103	489	13	6	2018-08-23	2025-08-22	291	4	\N	\N	2387	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1104	489	13	6	2012-11-23	\N	292	4	\N	\N	2388	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1105	489	5	6	2016-10-14	\N	50	4	\N	\N	\N	1707	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1106	489	5	6	2021-02-06	\N	293	4	\N	\N	\N	1708	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1107	489	5	6	2020-09-22	\N	19	4	\N	\N	\N	1346	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1108	489	5	6	2020-03-12	\N	12	4	\N	\N	\N	1709	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1109	489	5	6	2019-11-06	\N	63	4	\N	\N	\N	1710	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1110	489	5	6	2019-10-24	\N	21	4	\N	\N	\N	1322	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:20	0	0	0
1111	489	5	6	2019-10-16	\N	12	4	\N	\N	\N	1711	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1112	489	5	6	2019-09-19	\N	12	4	\N	\N	\N	1712	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1113	489	5	6	2019-09-19	\N	12	4	\N	\N	\N	1713	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1114	489	5	6	2019-06-12	\N	12	4	\N	\N	\N	1596	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1115	489	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1116	489	5	6	2019-04-26	\N	111	4	\N	\N	\N	1714	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1117	489	5	6	2019-03-22	\N	163	4	\N	\N	\N	1715	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1118	489	5	6	2018-11-05	\N	21	4	\N	\N	\N	1716	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1119	489	5	6	2018-10-18	\N	21	4	\N	\N	\N	1656	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1120	489	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1121	489	5	6	2018-08-30	\N	12	4	\N	\N	\N	1717	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1122	489	5	6	2018-08-28	\N	294	4	\N	\N	\N	1718	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1123	489	5	6	2018-08-23	\N	27	4	\N	\N	\N	1459	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1124	111	1	2	1980-06-26	\N	70	4	\N	2737	2389	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1125	111	295	6	2016-12-16	2021-12-15	198	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1126	111	13	6	2011-12-19	2016-12-18	296	4	\N	\N	2390	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1127	111	13	6	2006-12-19	2011-12-18	296	4	\N	\N	2390	\N	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1128	111	5	6	2019-08-23	\N	297	4	\N	\N	\N	1719	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1129	111	5	6	2019-03-06	\N	50	4	\N	\N	\N	1323	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1130	111	5	6	2018-08-28	\N	298	4	\N	\N	\N	1720	\N	\N	\N	0	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1131	194	1	32	2009-06-27	\N	15	4	\N	2652	2243	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1132	194	1	2	1988-06-25	\N	36	4	\N	2738	606	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1133	194	13	6	2015-10-24	\N	88	4	\N	\N	2391	\N	\N	\N	\N	1	2021-04-09 15:19:23	2021-11-02 11:06:21	0	0	0
1134	194	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	1	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1135	194	5	6	2020-10-19	\N	18	4	\N	\N	\N	1721	\N	\N	\N	1	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1136	194	5	6	2020-09-15	\N	90	4	\N	\N	\N	1722	\N	\N	\N	1	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1137	194	5	6	2019-05-17	\N	21	4	\N	\N	\N	1723	\N	\N	\N	1	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1138	263	1	2	1997-06-30	\N	10	299	1014	\N	2392	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1139	263	1	35	1995-07-03	\N	10	4	\N	2739	2393	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1140	263	13	6	2005-06-27	\N	26	4	\N	\N	2296	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1141	263	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1142	263	5	6	2020-11-19	\N	21	4	\N	\N	\N	1724	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1143	263	5	6	2019-09-26	\N	219	4	\N	\N	\N	1725	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1144	263	5	6	2019-05-02	\N	12	4	\N	\N	\N	1586	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1145	263	5	6	2019-03-22	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1146	263	5	6	2019-03-04	\N	218	4	\N	\N	\N	1726	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1147	263	5	6	2018-12-13	\N	21	4	\N	\N	\N	1325	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1148	263	5	6	2018-11-22	\N	21	4	\N	\N	\N	1464	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1149	242	1	14	2018-06-21	\N	46	4	1015	2740	2394	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1150	242	1	11	2016-06-27	\N	12	4	1016	\N	2395	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1151	242	1	11	2016-06-27	\N	12	4	\N	2741	2396	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1152	242	43	6	2017-03-20	\N	46	4	1015	2742	\N	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1153	242	13	6	2016-11-26	\N	46	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1154	242	5	6	2016-11-29	\N	300	4	\N	\N	\N	1727	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1155	242	5	6	2019-12-17	\N	21	4	\N	\N	\N	1728	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1156	242	5	6	2019-09-27	\N	176	4	\N	\N	\N	1729	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1157	242	5	6	2019-03-06	\N	50	4	\N	\N	\N	1455	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1158	242	5	6	2018-11-28	\N	21	4	\N	\N	\N	1730	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1159	237	39	40	1977-06-26	\N	244	4	1017	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1160	237	13	6	2011-05-28	\N	261	4	\N	\N	2397	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1161	237	13	6	2011-02-09	\N	301	4	\N	\N	2398	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1162	237	5	6	2020-12-10	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1163	237	5	6	2016-06-27	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1164	237	5	6	2020-11-27	\N	8	4	\N	\N	\N	1466	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1165	237	5	6	2019-10-23	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1166	237	5	6	2019-03-06	\N	50	4	\N	\N	\N	1731	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1167	237	5	6	2019-02-01	\N	21	4	\N	\N	\N	1732	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1168	237	5	6	2018-10-10	\N	21	4	\N	\N	\N	1325	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1169	237	5	6	2018-10-05	\N	302	4	\N	\N	\N	1733	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1170	237	5	6	2018-10-03	\N	21	4	\N	\N	\N	1241	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1171	135	1	32	2008-06-27	\N	125	4	\N	2743	2399	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1172	135	1	35	2004-06-11	\N	125	4	\N	2744	2290	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1173	135	1	101	2002-06-20	\N	125	303	\N	2743	2400	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1174	135	5	6	2020-02-11	\N	288	4	\N	\N	\N	1624	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1175	135	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1176	135	5	6	2020-03-10	\N	21	4	\N	\N	\N	1322	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1177	52	1	2	2009-06-20	\N	46	4	\N	2745	2382	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1178	52	1	2	1986-06-29	\N	91	224	\N	2746	2401	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1179	52	13	6	2007-01-10	\N	268	4	\N	\N	2402	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1180	52	13	6	2007-01-10	\N	268	4	\N	\N	2403	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1181	52	13	6	2004-12-30	\N	260	4	\N	\N	2404	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1182	52	13	6	2004-12-30	\N	260	4	\N	\N	2404	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1183	52	5	6	2019-02-07	\N	115	4	\N	\N	\N	1734	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1184	52	5	6	2021-03-05	\N	21	4	\N	\N	\N	1735	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1185	52	5	6	2020-12-03	\N	218	4	\N	\N	\N	1736	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1186	52	5	6	2020-11-26	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1187	52	5	6	2020-11-25	\N	120	4	\N	\N	\N	1737	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1188	52	5	6	2020-11-13	\N	304	4	\N	\N	\N	1738	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1189	52	5	6	2020-11-12	\N	218	4	\N	\N	\N	1739	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1190	52	5	6	2020-03-06	\N	21	4	\N	\N	\N	1740	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1191	52	5	6	2020-01-14	\N	12	4	\N	\N	\N	1586	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1192	52	5	6	2019-01-03	\N	218	4	\N	\N	\N	1741	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1193	52	5	6	2018-08-30	\N	12	4	\N	\N	\N	1742	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1194	461	1	16	1996-02-13	\N	261	4	\N	2747	758	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1195	461	1	11	1977-07-16	\N	305	4	\N	2748	2405	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1196	461	43	6	2019-08-22	\N	10	4	922	2603	\N	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1197	461	13	6	2019-11-22	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1198	461	5	6	2020-02-11	\N	306	4	\N	\N	\N	1743	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1199	461	5	6	2019-11-22	\N	10	4	\N	\N	\N	1744	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1200	150	1	32	2008-06-20	\N	15	4	\N	2749	2406	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1201	150	1	35	1976-07-01	\N	307	4	\N	\N	2407	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1202	150	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1203	150	5	6	2020-10-12	\N	21	4	\N	\N	\N	1306	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1204	150	5	6	2020-09-03	\N	21	4	\N	\N	\N	1745	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1205	150	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1206	150	5	6	2018-12-20	\N	12	4	\N	\N	\N	1746	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1207	150	5	6	2018-08-30	\N	12	4	\N	\N	\N	1747	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1208	134	1	2	2006-06-16	\N	15	4	\N	2750	2408	\N	\N	\N	\N	1	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1209	134	1	9	2004-06-18	\N	15	4	\N	2751	2409	\N	\N	\N	\N	1	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1210	134	13	6	2014-09-08	\N	308	4	\N	\N	2410	\N	\N	\N	\N	1	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1211	134	5	6	2019-09-10	\N	71	4	\N	\N	\N	1243	\N	\N	\N	1	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1212	134	5	6	2019-10-10	\N	42	4	\N	\N	\N	1376	\N	\N	\N	1	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1213	134	5	6	2019-09-16	\N	42	4	\N	\N	\N	1748	\N	\N	\N	1	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1214	77	1	14	2017-11-04	\N	55	4	1018	2752	615	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1215	77	39	40	2013-07-05	\N	309	4	1019	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1216	77	5	6	2020-12-10	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1217	77	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1218	53	1	14	2020-02-25	\N	310	4	\N	2753	2411	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1219	53	1	11	1987-11-28	\N	311	4	1020	\N	564	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1220	53	43	6	2017-01-17	\N	15	4	922	2603	\N	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1221	53	13	6	2017-03-11	\N	15	4	\N	\N	2288	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1222	53	5	6	2016-06-27	\N	12	4	\N	\N	\N	1749	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1223	53	5	6	2019-10-09	\N	312	4	\N	\N	\N	1750	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1224	53	5	6	2019-04-14	\N	44	4	\N	\N	\N	1751	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1225	53	5	6	2019-04-12	\N	44	4	\N	\N	\N	1752	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1226	53	5	6	2019-03-29	\N	311	4	\N	\N	\N	1753	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1227	53	5	6	2018-12-11	\N	21	4	\N	\N	\N	1754	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1228	53	5	6	2018-11-07	\N	21	4	\N	\N	\N	1468	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1229	123	1	2	2008-07-05	\N	26	4	1021	2754	619	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1230	123	1	9	2005-07-08	\N	26	243	1022	2755	\N	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1231	123	1	11	1986-06-28	\N	155	4	\N	2756	2258	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1232	123	5	6	2020-03-12	\N	12	4	\N	\N	\N	1709	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1233	123	5	6	2019-08-21	\N	21	4	\N	\N	\N	1549	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1234	123	5	6	2018-09-28	\N	167	4	\N	\N	\N	1755	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1235	308	1	35	2013-06-21	\N	10	4	\N	\N	2412	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1236	308	1	9	2005-12-30	\N	45	4	1023	2757	2413	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1237	308	13	6	2018-06-29	\N	176	4	\N	\N	2414	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1238	308	13	6	2012-04-24	\N	313	4	\N	\N	2415	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1239	308	5	6	2020-12-10	\N	12	4	\N	\N	\N	1583	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1240	308	5	6	2019-08-26	\N	105	4	\N	\N	\N	1756	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1241	308	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1242	308	5	6	2021-02-24	\N	314	4	\N	\N	\N	1757	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1243	308	5	6	2020-12-09	\N	74	4	\N	\N	\N	1758	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1244	308	5	6	2020-11-26	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1245	308	5	6	2020-11-23	\N	110	4	\N	\N	\N	1759	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1246	308	5	6	2020-11-23	\N	110	4	\N	\N	\N	1760	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1247	308	5	6	2020-11-12	\N	218	4	\N	\N	\N	1761	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1248	308	5	6	2020-11-11	\N	21	4	\N	\N	\N	1762	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1249	308	5	6	2020-11-02	\N	315	4	\N	\N	\N	1369	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1250	308	5	6	2020-10-31	\N	316	4	\N	\N	\N	1763	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1251	308	5	6	2020-10-23	\N	42	4	\N	\N	\N	1764	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1252	308	5	6	2020-08-31	\N	317	4	\N	\N	\N	1765	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1253	308	5	6	2020-08-25	\N	21	4	\N	\N	\N	1409	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1254	308	5	6	2020-04-21	\N	215	4	\N	\N	\N	1537	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1255	308	5	6	2020-02-28	\N	193	4	\N	\N	\N	1766	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1256	308	5	6	2019-10-21	\N	318	4	\N	\N	\N	1767	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1257	308	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1258	308	5	6	2019-09-06	\N	12	4	\N	\N	\N	1462	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1259	308	5	6	2019-08-20	\N	105	4	\N	\N	\N	1768	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1260	308	5	6	2019-03-06	\N	50	4	\N	\N	\N	1731	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1261	308	5	6	2018-06-29	\N	176	4	\N	\N	\N	1769	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1262	308	5	6	2018-05-11	\N	21	4	\N	\N	\N	1582	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1263	87	1	35	1988-06-28	\N	67	4	930	2663	2416	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1264	87	5	6	2020-02-11	\N	306	4	\N	\N	\N	1770	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1265	87	5	6	2021-02-19	\N	21	4	\N	\N	\N	1322	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1266	87	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1267	87	5	6	2020-11-20	\N	12	4	\N	\N	\N	1771	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1268	87	5	6	2020-10-02	\N	21	4	\N	\N	\N	1306	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1269	87	5	6	2020-06-19	\N	12	4	\N	\N	\N	1772	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1270	215	1	35	2008-01-28	\N	10	4	1024	2744	2290	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1271	215	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1272	215	5	6	2020-11-20	\N	10	4	\N	\N	\N	1685	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1273	215	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1274	215	5	6	2018-08-30	\N	12	4	\N	\N	\N	1773	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1275	294	1	2	1993-05-27	\N	10	4	\N	2652	2289	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1276	294	1	35	1993-01-20	\N	319	4	\N	2758	2417	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1277	294	1	35	1970-06-30	\N	320	4	\N	2759	2418	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1278	294	5	6	2017-12-28	\N	12	4	\N	\N	\N	1774	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1279	344	1	32	2006-06-26	\N	10	4	\N	\N	608	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1280	344	1	35	1990-06-09	\N	320	4	1025	2760	2419	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1281	344	1	35	1985-06-19	\N	320	4	\N	2761	2420	\N	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1282	344	5	6	2019-04-15	\N	65	4	\N	\N	\N	1775	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1283	344	5	6	2019-10-22	\N	321	4	\N	\N	\N	1776	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1284	344	5	6	2018-10-22	\N	105	4	\N	\N	\N	1777	\N	\N	\N	0	2021-04-09 15:19:24	2021-11-02 11:06:21	0	0	0
1285	344	5	6	2018-08-27	\N	105	4	\N	\N	\N	1778	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1286	360	1	32	2004-07-02	\N	26	243	1021	2698	621	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1287	360	1	9	1996-07-02	\N	26	129	1026	2762	2421	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1288	360	5	6	2017-12-28	\N	12	4	\N	\N	\N	1592	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1289	360	5	6	2020-11-26	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1290	360	5	6	2020-11-10	\N	322	4	\N	\N	\N	1779	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1291	360	5	6	2020-09-29	\N	323	4	\N	\N	\N	1780	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1292	360	5	6	2019-11-28	\N	12	4	\N	\N	\N	1461	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1293	360	5	6	2019-09-19	\N	219	4	\N	\N	\N	1781	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1294	360	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1295	360	5	6	2019-09-06	\N	12	4	\N	\N	\N	1374	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1296	360	5	6	2018-05-18	\N	258	4	\N	\N	\N	1782	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1297	360	5	6	2018-04-06	\N	21	4	\N	\N	\N	1783	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1298	330	1	2	2000-06-15	\N	10	324	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1299	330	1	9	1996-06-21	\N	10	324	\N	2763	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1300	330	1	35	1978-06-30	\N	67	4	\N	2764	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1301	330	43	6	2018-02-17	\N	27	4	890	2611	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1302	330	13	6	2018-04-12	\N	15	4	\N	\N	2215	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1303	330	13	6	2008-09-27	\N	191	4	\N	\N	2422	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1304	330	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1305	330	5	6	2021-02-26	\N	325	4	\N	\N	\N	1784	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1306	330	5	6	2020-12-04	\N	66	4	\N	\N	\N	1785	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1307	330	5	6	2020-11-27	\N	95	4	\N	\N	\N	1304	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1308	330	5	6	2020-09-30	\N	97	4	\N	\N	\N	1786	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1309	330	5	6	2020-05-28	\N	21	4	\N	\N	\N	1489	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1310	330	5	6	2020-02-08	\N	95	4	\N	\N	\N	1787	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1311	330	5	6	2019-09-06	\N	12	4	\N	\N	\N	1511	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1312	330	5	6	2018-12-20	\N	12	4	\N	\N	\N	1746	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1313	330	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1314	330	5	6	2018-10-25	\N	97	4	\N	\N	\N	1788	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1315	330	5	6	2018-08-30	\N	12	4	\N	\N	\N	1789	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1316	518	1	9	2016-06-21	\N	69	4	\N	2765	2423	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1317	518	1	11	2012-06-28	\N	12	4	1027	\N	2186	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1318	518	43	6	2016-01-26	\N	69	4	1028	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1319	518	13	6	2017-05-26	2022-05-25	21	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1320	518	13	6	2016-10-27	\N	326	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1321	518	13	6	2016-10-18	\N	45	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1322	518	5	6	2016-01-29	\N	117	4	\N	\N	\N	1790	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1323	518	5	6	2020-11-16	\N	117	4	\N	\N	\N	1791	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1324	518	5	6	2020-10-22	\N	327	4	\N	\N	\N	1792	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1325	518	5	6	2020-09-02	\N	117	4	\N	\N	\N	1793	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1326	518	5	6	2020-08-25	\N	10	4	\N	\N	\N	1794	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1327	518	5	6	2019-05-21	\N	84	4	\N	\N	\N	1795	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1328	518	5	6	2019-03-12	\N	328	4	\N	\N	\N	1796	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1329	177	1	14	2007-12-28	\N	281	4	1029	2646	2424	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1330	177	1	35	2001-06-30	\N	281	329	\N	2766	2425	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1331	177	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1332	177	5	6	2020-11-19	\N	21	4	\N	\N	\N	1797	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1333	177	5	6	2019-08-06	\N	330	4	\N	\N	\N	1798	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1334	177	5	6	2019-06-12	\N	12	4	\N	\N	\N	1356	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1335	177	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1336	177	5	6	2019-05-02	\N	12	4	\N	\N	\N	1586	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1337	177	5	6	2019-05-02	\N	12	4	\N	\N	\N	1541	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1338	177	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1339	162	1	2	2016-06-18	\N	15	4	890	2632	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1340	162	1	14	2014-01-31	\N	15	4	\N	2767	2424	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1341	162	1	35	2003-12-08	\N	331	4	\N	2768	2202	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1342	162	5	6	2017-12-28	\N	12	4	\N	\N	\N	1472	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1343	162	5	6	2019-05-20	\N	21	4	\N	\N	\N	1799	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1344	162	5	6	2018-12-11	\N	21	4	\N	\N	\N	1800	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1345	162	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1346	345	1	11	1999-12-15	\N	53	4	\N	2769	2426	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1347	345	1	11	1986-06-21	\N	332	4	\N	2770	2427	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1348	345	43	6	2015-12-15	\N	46	4	1030	2771	\N	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1349	345	13	6	2016-02-06	\N	46	4	\N	\N	2227	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1350	345	5	6	2020-03-06	\N	333	4	\N	\N	\N	1801	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1351	345	5	6	2016-11-29	\N	334	4	\N	\N	\N	1802	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1352	345	5	6	2020-11-27	\N	132	4	\N	\N	\N	1803	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1353	345	5	6	2020-11-16	\N	335	4	\N	\N	\N	1804	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1354	345	5	6	2020-11-16	\N	335	4	\N	\N	\N	1805	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1355	345	5	6	2020-11-13	\N	336	4	\N	\N	\N	1806	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1356	345	5	6	2020-10-30	\N	60	4	\N	\N	\N	1408	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1357	345	5	6	2020-10-13	\N	335	4	\N	\N	\N	1807	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1358	345	5	6	2020-09-09	\N	50	4	\N	\N	\N	1808	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1359	345	5	6	2020-05-28	\N	335	4	\N	\N	\N	1809	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1360	345	5	6	2019-11-28	\N	100	4	\N	\N	\N	1810	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1361	345	5	6	2019-09-27	\N	176	4	\N	\N	\N	1518	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1362	345	5	6	2019-09-27	\N	176	4	\N	\N	\N	1811	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1363	345	5	6	2019-06-12	\N	21	4	\N	\N	\N	1812	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1364	345	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1365	345	5	6	2019-04-09	\N	337	4	\N	\N	\N	1813	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1366	345	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1367	345	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1368	345	5	6	2018-08-28	\N	46	4	\N	\N	\N	1290	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1369	519	1	2	2008-07-01	\N	45	4	\N	2772	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1370	519	1	124	1994-04-21	\N	10	4	1031	\N	2428	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1371	519	1	35	1986-06-30	\N	67	4	\N	2663	2429	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1372	519	13	6	2011-10-24	\N	76	338	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1373	519	5	6	2016-09-13	\N	88	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1374	519	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1375	519	5	6	2020-10-30	\N	21	4	\N	\N	\N	1468	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1376	519	5	6	2020-03-05	\N	21	4	\N	\N	\N	1814	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1377	519	5	6	2020-02-19	\N	339	4	\N	\N	\N	1815	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1378	519	5	6	2020-01-13	\N	66	4	\N	\N	\N	1816	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1379	519	5	6	2019-10-18	\N	340	4	\N	\N	\N	1817	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1380	519	5	6	2019-08-22	\N	341	4	\N	\N	\N	1818	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1381	519	5	6	2019-04-26	\N	342	4	\N	\N	\N	1819	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1382	519	5	6	2019-03-29	\N	21	4	\N	\N	\N	1820	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1383	519	5	6	2019-02-22	\N	171	4	\N	\N	\N	1821	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1384	519	5	6	2018-12-11	\N	42	4	\N	\N	\N	1653	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1385	519	5	6	2018-05-14	\N	171	4	\N	\N	\N	1822	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1386	519	5	6	2018-04-06	\N	65	4	\N	\N	\N	1823	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1387	520	1	9	2013-06-08	\N	238	4	\N	2773	2430	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1388	520	5	6	2018-10-05	\N	343	4	\N	\N	\N	1824	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1389	520	5	6	2020-08-26	\N	344	4	\N	\N	\N	1825	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1390	520	5	6	2020-08-18	\N	345	4	\N	\N	\N	1826	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1391	520	5	6	2019-09-24	\N	346	4	\N	\N	\N	1827	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1392	361	1	2	2012-02-24	\N	26	4	1021	2774	2431	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1393	361	1	2	1981-06-22	\N	211	4	\N	2775	2432	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1394	361	13	6	2008-06-27	\N	26	4	\N	\N	2319	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1395	361	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1396	361	5	6	2020-12-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1397	361	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1398	361	5	6	2020-11-19	\N	21	4	\N	\N	\N	1828	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1399	361	5	6	2019-11-28	\N	12	4	\N	\N	\N	1461	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1400	361	5	6	2019-10-24	\N	219	4	\N	\N	\N	1829	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1401	361	5	6	2019-09-20	\N	21	4	\N	\N	\N	1548	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1402	361	5	6	2019-05-20	\N	21	4	\N	\N	\N	1551	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1403	361	5	6	2019-05-02	\N	12	4	\N	\N	\N	1541	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1404	361	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1405	361	5	6	2019-01-31	\N	21	4	\N	\N	\N	1468	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1406	361	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1407	361	5	6	2018-08-30	\N	12	4	\N	\N	\N	1830	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1408	521	295	6	2019-04-26	2024-04-25	198	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1409	521	39	40	2017-06-29	\N	347	4	1032	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1410	521	43	6	2020-08-27	\N	26	4	1033	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1411	521	5	6	2020-11-25	\N	348	4	\N	\N	\N	1831	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1412	232	1	35	2000-06-16	\N	75	4	\N	2737	2433	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1413	232	5	6	2015-03-17	\N	225	4	\N	\N	\N	1832	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1414	232	5	6	2021-02-05	\N	8	4	\N	\N	\N	1453	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1415	232	5	6	2020-11-30	\N	105	4	\N	\N	\N	1833	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1416	232	5	6	2018-08-29	\N	349	4	\N	\N	\N	1834	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1417	232	5	6	2018-08-28	\N	46	4	\N	\N	\N	1290	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1418	232	5	6	2018-05-25	\N	81	4	\N	\N	\N	1835	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1419	143	1	2	2000-06-14	\N	10	4	\N	2715	2434	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1420	143	1	35	1978-06-26	\N	67	224	\N	2620	2435	\N	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1421	143	5	6	2016-12-30	\N	12	4	\N	\N	\N	1749	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1422	143	5	6	2019-03-06	\N	50	4	\N	\N	\N	1836	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1423	143	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1424	143	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	1	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1425	178	1	35	2008-01-18	\N	350	4	\N	2776	2436	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1426	178	13	6	2017-03-31	\N	45	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1427	178	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1428	153	1	35	2011-06-17	\N	69	4	\N	2777	2437	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1429	153	1	101	2009-06-30	\N	69	4	1034	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1430	153	295	6	2016-10-21	2021-10-20	198	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1431	153	5	6	2015-12-17	\N	117	4	\N	\N	\N	1837	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1432	153	5	6	2021-01-07	\N	351	4	\N	\N	\N	1838	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1433	153	5	6	2021-01-07	\N	351	4	\N	\N	\N	1839	\N	\N	\N	0	2021-04-09 15:19:25	2021-11-02 11:06:21	0	0	0
1434	153	5	6	2020-09-05	\N	352	4	\N	\N	\N	1840	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1435	153	5	6	2020-06-08	\N	65	4	\N	\N	\N	1841	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1436	153	5	6	2019-10-30	\N	73	4	\N	\N	\N	1842	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1437	153	5	6	2019-10-14	\N	73	4	\N	\N	\N	1843	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1438	153	5	6	2019-08-30	\N	352	4	\N	\N	\N	1840	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1439	153	5	6	2019-04-05	\N	21	4	\N	\N	\N	1507	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1440	153	5	6	2019-04-05	\N	353	4	\N	\N	\N	1676	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1441	153	5	6	2018-11-29	\N	352	4	\N	\N	\N	1844	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1442	206	1	2	2020-06-19	\N	15	4	1006	2778	2363	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1443	206	1	9	2004-07-04	\N	45	4	\N	2779	2438	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1444	206	43	6	2019-09-26	\N	15	4	890	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1445	206	43	6	2019-09-13	\N	15	4	1006	2661	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1446	206	13	6	2019-11-09	\N	15	4	\N	\N	2288	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1447	206	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1448	206	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1449	206	5	6	2020-11-05	\N	192	4	\N	\N	\N	1845	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1450	206	5	6	2020-09-03	\N	192	4	\N	\N	\N	1846	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1451	206	5	6	2019-11-28	\N	12	4	\N	\N	\N	1461	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1452	206	5	6	2019-11-04	\N	12	4	\N	\N	\N	1584	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1453	493	1	32	2006-06-26	\N	10	134	1035	2749	2439	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1454	493	1	35	2002-06-17	\N	10	354	\N	2780	2440	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1455	493	1	9	2001-06-15	\N	10	354	\N	2702	685	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1456	493	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1457	493	5	6	2020-09-22	\N	19	4	\N	\N	\N	1847	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1458	493	5	6	2020-02-17	\N	96	4	\N	\N	\N	1307	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1459	493	5	6	2019-10-24	\N	97	4	\N	\N	\N	1848	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1460	493	5	6	2019-03-06	\N	105	4	\N	\N	\N	1849	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1461	243	1	2	2018-02-07	\N	56	4	1036	2781	704	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1462	243	1	9	2015-02-20	\N	355	4	\N	2782	2441	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1463	243	1	14	2005-06-21	\N	52	4	1037	2783	2442	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1464	243	1	14	2004-06-29	\N	26	148	953	2784	2317	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1465	243	43	6	2009-03-11	\N	356	4	1038	2785	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1466	243	13	6	2003-06-12	\N	26	4	\N	\N	2296	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1467	243	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1468	243	5	6	2020-10-23	\N	21	4	\N	\N	\N	1850	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1469	243	5	6	2020-02-13	\N	21	4	\N	\N	\N	1851	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1470	243	5	6	2020-01-03	\N	19	4	\N	\N	\N	1449	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1471	243	5	6	2019-08-21	\N	21	4	\N	\N	\N	1852	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1472	243	5	6	2019-04-05	\N	163	4	\N	\N	\N	1477	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1473	243	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1474	243	5	6	2018-11-02	\N	187	4	\N	\N	\N	1853	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1475	243	5	6	2018-10-18	\N	21	4	\N	\N	\N	1854	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1476	243	5	6	2018-08-30	\N	12	4	\N	\N	\N	1855	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1477	243	5	6	2018-06-22	\N	187	4	\N	\N	\N	1853	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1478	243	5	6	2018-05-23	\N	188	4	\N	\N	\N	1856	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1479	243	5	6	2018-05-23	\N	188	4	\N	\N	\N	1857	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1480	243	5	6	2018-05-23	\N	188	4	\N	\N	\N	1858	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1481	243	5	6	2018-05-23	\N	188	4	\N	\N	\N	1859	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1482	243	5	6	2018-05-23	\N	188	4	\N	\N	\N	1860	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1483	243	5	6	2018-04-27	\N	21	4	\N	\N	\N	1252	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1484	243	5	6	2018-04-23	\N	21	4	\N	\N	\N	1602	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1485	243	5	6	2018-04-07	\N	21	4	\N	\N	\N	1861	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1486	252	1	2	2012-06-29	\N	179	4	1039	2786	636	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1487	252	1	9	2010-07-03	\N	179	4	\N	2787	652	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1488	252	1	11	1995-06-30	\N	128	4	\N	2788	2443	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1489	252	13	6	2014-11-28	\N	45	4	\N	\N	2288	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1490	252	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1491	252	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1492	252	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1493	252	5	6	2020-01-02	\N	218	4	\N	\N	\N	1538	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1494	252	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1495	252	5	6	2018-08-30	\N	12	4	\N	\N	\N	1773	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1496	47	1	11	1975-07-10	\N	156	4	\N	2645	2259	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1497	47	5	6	2020-10-12	\N	21	4	\N	\N	\N	1306	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1498	47	5	6	2020-01-02	\N	218	4	\N	\N	\N	1538	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1499	47	5	6	2019-10-10	\N	219	4	\N	\N	\N	1862	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1500	47	5	6	2019-09-20	\N	21	4	\N	\N	\N	1548	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1501	47	5	6	2019-08-21	\N	21	4	\N	\N	\N	1549	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1502	47	5	6	2019-03-04	\N	218	4	\N	\N	\N	1726	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1503	192	1	2	\N	\N	36	4	\N	2789	509	\N	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1504	192	13	6	2004-06-18	\N	26	4	\N	\N	2319	\N	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1505	192	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1506	192	5	6	2019-12-12	\N	21	4	\N	\N	\N	1863	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1507	192	5	6	2018-04-27	\N	21	4	\N	\N	\N	1259	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1508	522	1	9	2010-06-19	\N	67	4	1040	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1509	522	5	6	2019-08-22	\N	300	4	\N	\N	\N	1864	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1510	522	5	6	2020-11-20	\N	110	4	\N	\N	\N	1865	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1511	522	5	6	2019-03-29	\N	357	4	\N	\N	\N	1866	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1512	522	5	6	2019-01-18	\N	302	4	\N	\N	\N	1867	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1513	15	1	2	1985-06-26	\N	86	4	\N	2790	2444	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1514	15	5	6	2019-03-15	\N	18	4	\N	\N	\N	1868	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1515	15	5	6	2020-11-13	\N	336	4	\N	\N	\N	1806	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1516	15	5	6	2020-06-03	\N	62	4	\N	\N	\N	1617	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1517	15	5	6	2020-01-14	\N	12	4	\N	\N	\N	1556	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1518	15	5	6	2019-11-06	\N	63	4	\N	\N	\N	1710	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1519	15	5	6	2019-07-14	\N	358	4	\N	\N	\N	1869	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1520	15	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1521	15	5	6	2019-03-11	\N	359	4	\N	\N	\N	1870	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1522	15	5	6	2019-03-06	\N	50	4	\N	\N	\N	1411	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1523	15	5	6	2018-09-20	\N	274	4	\N	\N	\N	1871	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1524	15	5	6	2018-08-30	\N	12	4	\N	\N	\N	1872	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1525	15	5	6	2018-04-11	\N	119	4	\N	\N	\N	1873	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1526	15	5	6	2018-04-04	\N	360	4	\N	\N	\N	1874	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1527	407	1	32	1975-06-29	\N	67	4	950	2791	2350	\N	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1528	407	43	6	2002-10-15	\N	10	189	1041	2792	\N	\N	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1529	407	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1530	407	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1531	407	5	6	2018-04-27	\N	21	4	\N	\N	\N	1259	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1532	407	5	6	2018-04-25	\N	21	4	\N	\N	\N	1875	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1533	407	5	6	2018-04-04	\N	21	4	\N	\N	\N	1554	\N	\N	\N	1	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1534	42	1	35	2005-11-25	\N	125	4	\N	\N	639	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1535	42	5	6	2016-03-14	\N	18	4	\N	\N	\N	1876	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1536	42	5	6	2019-09-06	\N	12	4	\N	\N	\N	1462	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1537	42	5	6	2019-04-09	\N	226	4	\N	\N	\N	1877	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1538	42	5	6	2018-08-30	\N	12	4	\N	\N	\N	1690	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1539	469	1	14	2001-06-28	\N	26	148	991	2638	562	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1540	469	1	11	1995-01-15	\N	53	4	\N	2793	2445	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1541	469	1	11	1986-04-26	\N	149	4	\N	2794	2446	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1542	469	1	11	1977-05-31	\N	361	4	\N	2795	2447	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1543	469	1	11	1976-07-03	\N	151	4	\N	2707	2342	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1544	469	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1545	469	5	6	2018-12-13	\N	21	4	\N	\N	\N	1878	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1546	362	1	2	2006-06-26	\N	10	134	953	2796	2448	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1547	362	1	35	2002-06-17	\N	10	354	\N	2780	2440	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1548	362	1	35	1995-06-30	\N	10	92	\N	2797	2449	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1549	362	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1550	362	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1551	362	5	6	2020-11-20	\N	130	4	\N	\N	\N	1879	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1552	362	5	6	2020-10-26	\N	120	4	\N	\N	\N	1880	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1553	362	5	6	2020-09-30	\N	21	4	\N	\N	\N	1306	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1554	362	5	6	2020-02-17	\N	362	4	\N	\N	\N	1307	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1555	362	5	6	2020-02-08	\N	95	4	\N	\N	\N	1881	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1556	362	5	6	2019-10-24	\N	12	4	\N	\N	\N	1882	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1557	362	5	6	2019-03-02	\N	363	4	\N	\N	\N	1883	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1558	362	5	6	2018-10-25	\N	97	4	\N	\N	\N	1788	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1559	129	1	101	2019-06-27	\N	10	4	1039	2798	642	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1560	129	1	14	2017-06-29	\N	10	4	\N	2799	615	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1561	129	1	9	2014-06-18	\N	10	4	\N	2800	2450	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1562	129	39	40	2010-07-16	\N	364	4	1042	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1563	129	43	6	2019-09-02	\N	10	4	1043	2619	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1564	129	43	6	2019-03-13	\N	10	4	1039	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1565	129	43	6	2018-09-06	\N	10	4	1044	2619	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1566	129	43	6	2018-02-16	\N	10	4	1039	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1567	129	43	6	2016-09-21	\N	10	4	1045	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1568	129	13	6	2014-11-29	\N	10	4	\N	\N	2451	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1569	129	5	6	2020-06-12	\N	365	4	\N	\N	\N	1884	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1570	523	1	11	2007-07-03	\N	12	4	964	2801	2262	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1571	523	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1572	523	5	6	2020-12-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1573	291	1	32	2013-02-07	\N	10	4	\N	887	2399	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1574	291	1	9	2010-02-27	\N	10	4	1046	2802	2452	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1575	291	1	14	2005-06-27	\N	26	148	\N	2803	2453	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1576	291	13	6	2014-11-28	\N	26	4	\N	\N	2359	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1577	291	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1578	291	5	6	2019-03-02	\N	363	4	\N	\N	\N	1883	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1579	291	5	6	2019-02-18	\N	362	4	\N	\N	\N	1885	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1580	291	5	6	2019-02-04	\N	21	4	\N	\N	\N	1886	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1581	291	5	6	2018-11-17	\N	26	4	\N	\N	\N	1887	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1582	291	5	6	2018-08-31	\N	12	4	\N	\N	\N	1553	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1583	524	1	32	1999-06-03	\N	10	4	\N	2804	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1584	524	1	35	1988-07-25	\N	196	4	\N	2805	2454	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1585	524	5	6	2017-02-17	\N	302	4	\N	\N	\N	1864	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1586	524	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1587	524	5	6	2020-11-17	\N	21	4	\N	\N	\N	1888	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1588	524	5	6	2020-09-28	\N	176	4	\N	\N	\N	1889	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1589	524	5	6	2020-07-05	\N	366	4	\N	\N	\N	1890	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1590	524	5	6	2020-07-01	\N	367	4	\N	\N	\N	1891	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1591	524	5	6	2020-05-25	\N	366	4	\N	\N	\N	1892	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1592	524	5	6	2019-12-29	\N	366	4	\N	\N	\N	1893	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1593	525	1	9	2020-06-13	\N	238	4	1047	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1594	525	1	11	2014-07-02	\N	12	4	964	\N	2262	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1595	525	43	6	2016-11-25	\N	238	4	1048	2768	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1596	525	13	6	2017-10-23	\N	10	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:26	2021-11-02 11:06:21	0	0	0
1597	525	5	6	2016-08-23	\N	115	4	\N	\N	\N	1894	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1598	84	1	35	1997-06-18	\N	272	4	1049	2806	2455	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1599	84	1	32	1997-06-18	\N	272	4	1050	2807	2456	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1600	84	1	2	1992-12-18	\N	15	4	1051	2808	493	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1601	84	1	11	1986-06-28	\N	368	4	\N	2809	2457	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1602	84	43	6	2010-09-03	\N	26	369	1052	2810	\N	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1603	84	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1604	84	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1605	84	5	6	2020-05-29	\N	20	4	\N	\N	\N	1544	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1606	84	5	6	2019-11-07	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1607	84	5	6	2019-01-24	\N	21	4	\N	\N	\N	1895	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1608	84	5	6	2018-05-11	\N	21	4	\N	\N	\N	1896	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1609	370	1	2	2005-02-04	\N	10	370	1051	2750	2458	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1610	370	1	35	2003-07-08	\N	10	4	1051	910	\N	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1611	370	1	9	1998-06-25	\N	10	178	1053	2811	2459	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1612	370	39	150	1998-06-20	\N	10	4	1054	\N	2460	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1613	370	13	6	2011-06-18	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1614	370	5	6	2020-12-10	\N	12	4	\N	\N	\N	1366	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1615	370	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1616	370	5	6	2019-06-12	\N	12	4	\N	\N	\N	1596	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1617	370	5	6	2019-06-10	\N	12	4	\N	\N	\N	1437	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1618	370	5	6	2019-05-02	\N	12	4	\N	\N	\N	1377	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1619	370	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1620	370	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1621	370	5	6	2019-01-17	\N	371	4	\N	\N	\N	1897	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1622	313	1	2	2015-12-10	\N	10	4	\N	824	2461	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1623	313	1	9	2014-06-18	\N	10	4	\N	2812	2462	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1624	313	39	40	2010-07-16	\N	372	4	1055	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1625	313	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1626	313	5	6	2020-11-12	\N	218	4	\N	\N	\N	1761	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1627	313	5	6	2020-01-14	\N	12	4	\N	\N	\N	1556	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1628	533	1	9	2014-06-27	\N	10	4	803	2798	642	801	802	\N	\N	1	2021-04-09 15:19:27	2021-11-17 13:42:20	0	0	0
1629	376	1	14	2012-06-28	\N	10	4	\N	2813	870	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1630	376	1	11	2010-07-02	\N	128	4	1056	2814	878	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1631	376	13	6	2012-12-15	\N	15	4	\N	\N	2238	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1632	376	5	655	2020-12-10	2021-01-01	12	656	1057	\N	2463	1243	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:05:33	7	1	4
1633	376	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1634	376	5	6	2019-08-15	\N	119	4	\N	\N	\N	1898	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1635	376	5	6	2019-05-28	\N	55	4	\N	\N	\N	1899	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1636	376	5	6	2018-08-30	\N	12	4	\N	\N	\N	1900	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1637	314	1	101	2004-07-06	\N	10	354	\N	2743	597	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1638	314	1	2	1989-06-23	\N	67	373	\N	2656	2464	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1639	314	5	6	2017-12-28	\N	12	4	\N	\N	\N	1592	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1640	145	1	35	1980-06-27	\N	374	4	\N	2815	528	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1641	145	13	6	2010-01-18	2015-01-17	375	4	\N	\N	2465	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1642	145	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1643	145	5	6	2020-12-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1644	145	5	6	2020-08-25	\N	21	4	\N	\N	\N	1901	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1645	145	5	6	2020-03-03	\N	26	4	\N	\N	\N	1675	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1646	145	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1647	145	5	6	2019-03-31	\N	163	4	\N	\N	\N	1902	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1648	245	1	9	2017-06-22	\N	10	4	\N	2816	2466	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1649	245	1	11	1999-06-17	\N	376	4	\N	2817	2467	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1650	245	43	6	2016-10-28	\N	10	4	1058	2818	\N	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1651	245	43	6	2011-09-05	\N	10	4	924	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1652	245	13	6	2018-02-27	\N	152	4	\N	\N	2254	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1653	245	13	6	2017-12-06	\N	152	4	\N	\N	2468	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1654	245	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1655	245	5	6	2020-12-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1656	245	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1657	414	39	40	2017-06-29	\N	377	4	1032	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1658	414	43	6	2017-09-29	\N	10	4	1059	2819	\N	\N	\N	\N	\N	1	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1659	414	5	6	2019-09-06	\N	12	4	\N	\N	\N	1374	\N	\N	\N	1	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1660	414	5	6	2018-12-20	\N	12	4	\N	\N	\N	1903	\N	\N	\N	1	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1661	230	1	35	1975-06-29	\N	67	4	\N	2820	2469	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1662	230	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1663	230	5	6	2020-11-27	\N	378	4	\N	\N	\N	1904	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1664	230	5	6	2020-11-19	\N	21	4	\N	\N	\N	1724	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1665	230	5	6	2020-08-14	\N	117	4	\N	\N	\N	1905	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1666	230	5	6	2019-12-21	\N	379	4	\N	\N	\N	1906	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1667	326	1	32	2002-07-03	\N	26	4	930	2663	2241	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1668	326	1	9	1999-06-28	\N	26	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1669	326	13	6	2000-05-23	\N	204	4	\N	\N	2470	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1670	326	5	6	2018-06-08	\N	109	4	\N	\N	\N	1330	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1671	326	5	6	2021-03-15	\N	380	4	\N	\N	\N	1907	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1672	326	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1673	326	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1674	326	5	6	2020-11-19	\N	110	4	\N	\N	\N	1908	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1675	326	5	6	2020-10-06	\N	21	4	\N	\N	\N	1322	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1676	326	5	6	2020-09-17	\N	21	4	\N	\N	\N	1306	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1677	326	5	6	2020-01-03	\N	19	4	\N	\N	\N	1449	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1678	326	5	6	2019-11-26	\N	21	4	\N	\N	\N	1863	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1679	326	5	6	2019-11-06	\N	63	4	\N	\N	\N	1710	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1680	326	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1681	326	5	6	2019-09-06	\N	12	4	\N	\N	\N	1540	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1682	326	5	6	2019-06-13	\N	26	4	\N	\N	\N	1392	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1683	326	5	6	2019-06-12	\N	12	4	\N	\N	\N	1596	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1684	326	5	6	2019-05-20	\N	21	4	\N	\N	\N	1909	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1685	326	5	6	2019-05-09	\N	12	4	\N	\N	\N	1598	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1686	326	5	6	2019-04-25	\N	21	4	\N	\N	\N	1910	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1687	326	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1688	326	5	6	2019-03-06	\N	50	4	\N	\N	\N	1411	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1689	326	5	6	2018-12-05	\N	21	4	\N	\N	\N	1557	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1690	326	5	6	2018-11-30	\N	21	4	\N	\N	\N	1911	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1691	326	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1692	326	5	6	2018-11-07	\N	21	4	\N	\N	\N	1464	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1693	326	5	6	2018-10-26	\N	12	4	\N	\N	\N	1569	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1694	326	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1695	71	13	6	2019-11-26	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1696	71	5	6	2020-02-11	\N	306	4	\N	\N	\N	1912	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1697	71	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1698	71	5	6	2019-11-26	\N	10	4	\N	\N	\N	1621	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1699	297	1	2	1985-06-30	\N	91	92	\N	2656	2471	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1700	297	5	6	2016-12-30	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1701	297	5	6	2020-11-27	\N	116	4	\N	\N	\N	1913	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1702	297	5	6	2020-08-25	\N	21	4	\N	\N	\N	1914	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1703	297	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1704	297	5	6	2019-05-02	\N	12	4	\N	\N	\N	1586	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1705	297	5	6	2019-04-02	\N	21	4	\N	\N	\N	1325	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1706	57	1	35	\N	\N	381	4	1060	2737	2472	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1707	57	5	6	2016-06-27	\N	12	4	\N	\N	\N	1313	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1708	57	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1709	57	5	6	2018-05-14	\N	69	4	\N	\N	\N	1915	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1710	88	1	2	2020-06-19	\N	15	4	1006	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1711	88	1	35	2006-12-09	\N	45	4	890	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1712	88	1	16	2000-01-29	\N	89	4	\N	2821	2473	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1713	88	13	6	2017-08-31	\N	15	4	\N	\N	2274	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1714	88	13	6	2015-10-24	\N	88	4	\N	\N	2474	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1715	88	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1716	88	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1717	88	5	6	2020-01-03	\N	19	4	\N	\N	\N	1449	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1718	88	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1719	88	5	6	2019-05-17	\N	21	4	\N	\N	\N	1723	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1720	88	5	6	2019-04-23	\N	382	4	\N	\N	\N	1916	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1721	88	5	6	2019-03-22	\N	163	4	\N	\N	\N	1715	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1722	88	5	6	2019-03-04	\N	218	4	\N	\N	\N	1726	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1723	88	5	6	2019-01-24	\N	21	4	\N	\N	\N	1917	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1724	88	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1725	88	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1726	88	5	6	2018-06-07	\N	121	4	\N	\N	\N	1918	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1727	88	5	6	2018-04-10	\N	121	4	\N	\N	\N	1615	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1728	88	5	6	2018-04-04	\N	21	4	\N	\N	\N	1255	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1729	393	1	2	2013-06-15	\N	26	4	1061	2822	2475	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1730	393	1	9	2011-06-20	\N	26	4	958	2823	2476	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1731	393	1	11	2007-07-04	\N	128	4	1062	2814	878	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1732	393	13	6	2011-06-18	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1733	393	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1734	175	1	2	2007-02-09	\N	10	4	934	910	2477	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1735	175	1	35	2005-07-05	\N	10	4	1063	2715	747	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1736	175	13	6	2014-06-14	\N	15	4	\N	\N	2478	\N	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1737	175	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1738	175	5	6	2020-07-16	\N	62	4	\N	\N	\N	1919	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1739	175	5	6	2020-07-16	\N	62	4	\N	\N	\N	1651	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1740	175	5	6	2020-06-18	\N	62	4	\N	\N	\N	1920	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1741	175	5	6	2020-06-18	\N	62	4	\N	\N	\N	1920	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1742	175	5	6	2020-03-12	\N	12	4	\N	\N	\N	1709	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1743	175	5	6	2019-09-13	\N	174	4	\N	\N	\N	1450	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1744	175	5	6	2019-06-10	\N	12	4	\N	\N	\N	1437	\N	\N	\N	0	2021-04-09 15:19:27	2021-11-02 11:06:21	0	0	0
1745	175	5	6	2019-05-02	\N	12	4	\N	\N	\N	1586	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1746	175	5	6	2019-04-25	\N	21	4	\N	\N	\N	1921	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1747	175	5	6	2018-09-14	\N	21	4	\N	\N	\N	1468	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1748	61	1	32	2003-06-16	\N	10	239	890	2824	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1749	61	1	2	1986-07-23	\N	67	383	\N	2624	2479	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1750	61	43	6	2010-06-17	\N	384	4	1064	\N	2480	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1751	61	13	6	2017-08-24	\N	15	4	\N	\N	2274	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1752	61	13	6	2009-04-21	\N	10	4	\N	\N	2481	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1753	61	13	6	2008-03-19	\N	100	4	\N	\N	2482	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1754	61	13	6	2007-09-29	\N	385	4	\N	\N	2483	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1755	61	13	6	2007-08-28	\N	385	4	\N	\N	2484	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1756	61	13	6	2007-08-24	\N	385	4	\N	\N	2485	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1757	61	13	6	2007-08-10	\N	385	4	\N	\N	2486	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1758	61	13	6	2006-06-29	\N	76	4	\N	\N	2487	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1759	61	5	6	2016-12-30	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1760	61	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1761	61	5	6	2019-10-17	\N	386	4	\N	\N	\N	1922	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1762	61	5	6	2019-09-20	\N	386	4	\N	\N	\N	1923	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1763	61	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1764	61	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1765	61	5	6	2018-08-30	\N	12	4	\N	\N	\N	1924	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1766	61	5	6	2018-08-24	\N	46	4	\N	\N	\N	1925	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1767	61	5	6	2018-06-07	\N	121	4	\N	\N	\N	1918	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1768	257	1	2	2011-01-28	\N	15	4	934	2641	2488	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1769	257	1	9	2008-06-20	\N	15	4	1065	2825	2489	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1770	257	1	11	2004-06-29	\N	376	4	1066	2826	2490	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1771	257	5	6	2020-02-11	\N	306	4	\N	\N	\N	1926	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1772	257	5	6	2019-08-21	\N	21	4	\N	\N	\N	1549	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1773	257	5	6	2018-11-02	\N	21	4	\N	\N	\N	1927	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1774	412	1	2	2007-01-26	\N	26	4	\N	2625	553	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1775	412	1	124	2005-01-28	\N	26	4	958	2641	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1776	412	1	35	1995-06-16	\N	36	4	\N	2604	2491	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1777	412	13	6	2014-06-14	\N	15	4	\N	\N	2492	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1778	412	13	6	2004-03-05	2005-03-04	387	4	\N	\N	2493	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1779	412	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1780	412	5	6	2018-04-07	\N	21	4	\N	\N	\N	1928	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1781	425	1	2	2009-02-28	\N	10	4	\N	824	2461	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1782	425	1	35	2006-02-11	\N	10	4	\N	2827	2494	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1783	425	39	40	1986-06-28	\N	388	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1784	425	13	6	2014-09-02	\N	21	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1785	425	13	6	2011-07-25	\N	21	4	\N	\N	2495	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1786	425	5	6	2020-12-10	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1787	425	5	6	2020-10-28	\N	389	4	\N	\N	\N	1929	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1788	425	5	6	2020-10-21	\N	217	4	\N	\N	\N	1930	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1789	425	5	6	2020-08-26	\N	21	4	\N	\N	\N	1931	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1790	425	5	6	2020-08-21	\N	63	4	\N	\N	\N	1932	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1791	425	5	6	2019-12-05	\N	20	4	\N	\N	\N	1933	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1792	425	5	6	2019-10-25	\N	389	4	\N	\N	\N	1934	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1793	425	5	6	2019-07-02	\N	390	4	\N	\N	\N	1935	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1794	425	5	6	2019-03-24	\N	391	4	\N	\N	\N	1936	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1795	425	5	6	2019-01-28	\N	127	4	\N	\N	\N	1365	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1796	425	5	6	2018-11-06	\N	21	4	\N	\N	\N	1464	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1797	425	5	6	2018-10-23	\N	206	4	\N	\N	\N	1937	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1798	425	5	6	2018-10-21	\N	63	4	\N	\N	\N	1938	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1799	118	1	11	2018-03-06	\N	392	4	1067	2828	797	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1800	118	1	14	2011-02-26	\N	393	4	1068	2829	650	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1801	118	1	11	2008-06-30	\N	394	4	1069	2830	2496	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1802	118	43	6	2019-08-21	\N	10	4	922	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1803	118	13	6	2019-11-22	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1804	118	5	6	2020-02-11	\N	306	4	\N	\N	\N	1624	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1805	118	5	6	2021-03-04	\N	7	4	\N	\N	\N	1939	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1806	118	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1807	118	5	6	2020-12-01	\N	215	4	\N	\N	\N	1940	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1808	118	5	6	2020-07-28	\N	393	4	\N	\N	\N	1941	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1809	118	5	6	2020-06-03	\N	62	4	\N	\N	\N	1942	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1810	118	5	6	2020-05-14	\N	393	4	\N	\N	\N	1943	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1811	118	5	6	2020-04-21	\N	215	4	\N	\N	\N	1944	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1812	144	1	2	2021-02-18	\N	46	4	1004	\N	2497	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1813	144	1	32	2018-06-20	\N	46	4	930	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1814	144	1	2	2016-06-20	\N	46	4	\N	2663	2498	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1815	144	43	6	2020-12-03	\N	46	4	1070	2831	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1816	144	5	6	2018-10-26	\N	77	4	\N	\N	\N	1945	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1817	144	5	6	2019-09-18	\N	42	4	\N	\N	\N	1390	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1818	144	5	6	2019-03-06	\N	50	4	\N	\N	\N	1455	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1819	379	1	101	2019-02-23	\N	179	4	1044	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1820	379	13	6	2019-07-12	\N	10	4	\N	\N	2227	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1821	379	5	6	2020-02-11	\N	288	4	\N	\N	\N	1946	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1822	379	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1823	452	1	2	2020-02-22	\N	46	4	1071	2832	2499	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1824	452	1	2	2020-02-22	\N	46	4	1004	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1825	452	1	101	2017-06-22	\N	46	4	1072	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1826	452	1	35	2002-06-26	\N	46	279	1073	2827	2500	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1827	452	1	35	1994-06-28	\N	395	396	1074	2833	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:21	0	0	0
1828	452	43	6	2017-03-24	\N	46	4	1075	2834	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1829	452	5	6	2020-12-02	\N	118	4	\N	\N	\N	1351	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1830	452	5	6	2020-11-13	\N	336	4	\N	\N	\N	1806	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1831	452	5	6	2020-02-06	\N	95	4	\N	\N	\N	1947	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1832	452	5	6	2019-09-27	\N	176	4	\N	\N	\N	1454	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1833	452	5	6	2019-09-18	\N	42	4	\N	\N	\N	1390	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1834	452	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1835	452	5	6	2019-03-06	\N	50	4	\N	\N	\N	1455	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1836	452	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1837	452	5	6	2019-01-28	\N	12	4	\N	\N	\N	1948	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1838	54	1	35	1975-06-28	\N	374	4	\N	2685	528	\N	\N	\N	\N	1	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1839	54	13	6	2003-11-25	\N	76	4	\N	\N	2501	\N	\N	\N	\N	1	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1840	54	5	6	2020-08-27	\N	60	4	\N	\N	\N	1949	\N	\N	\N	1	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1841	98	1	2	2000-12-07	\N	10	134	1076	2749	2406	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1842	98	1	2	1980-06-27	\N	67	4	950	2735	2502	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1843	98	5	6	2016-06-27	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1844	98	5	6	2021-03-03	\N	21	4	\N	\N	\N	1950	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1845	98	5	6	2020-01-03	\N	19	4	\N	\N	\N	1951	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1846	98	5	6	2019-05-09	\N	100	4	\N	\N	\N	1952	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1847	98	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1848	98	5	6	2019-02-19	\N	119	4	\N	\N	\N	1953	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1849	98	5	6	2018-11-22	\N	100	4	\N	\N	\N	1954	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1850	98	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1851	98	5	6	2018-05-10	\N	21	4	\N	\N	\N	1601	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1852	106	39	40	1985-06-20	\N	397	4	1042	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1853	106	13	6	2008-03-28	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1854	106	5	6	2020-12-10	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1855	106	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1856	106	5	6	2019-03-12	\N	21	4	\N	\N	\N	1325	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1857	106	5	6	2019-03-05	\N	21	4	\N	\N	\N	1955	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1858	106	5	6	2019-02-21	\N	21	4	\N	\N	\N	1669	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1859	106	5	6	2018-05-11	\N	21	4	\N	\N	\N	1582	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1860	189	1	124	2003-06-26	\N	10	4	\N	2835	2503	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1861	189	1	9	1993-06-26	\N	10	4	\N	2836	717	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1862	189	13	6	2015-08-12	\N	398	4	\N	\N	2504	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1863	189	5	6	2016-04-26	\N	117	4	\N	\N	\N	1956	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1864	189	5	6	2020-09-22	\N	19	4	\N	\N	\N	1346	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1865	189	5	6	2019-11-04	\N	12	4	\N	\N	\N	1584	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1866	189	5	6	2019-09-06	\N	12	4	\N	\N	\N	1957	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1867	189	5	6	2019-09-06	\N	12	4	\N	\N	\N	1958	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1868	189	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1869	189	5	6	2019-03-06	\N	50	4	\N	\N	\N	1411	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1870	189	5	6	2019-02-21	\N	21	4	\N	\N	\N	1669	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1871	189	5	6	2018-08-30	\N	12	4	\N	\N	\N	1959	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1872	298	1	35	1998-06-21	\N	91	4	966	2837	2505	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1873	298	5	6	2018-10-26	\N	77	4	\N	\N	\N	1960	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1874	298	5	6	2021-02-04	\N	65	4	\N	\N	\N	1961	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1875	298	5	6	2020-12-02	\N	118	4	\N	\N	\N	1351	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1876	298	5	6	2020-11-13	\N	399	4	\N	\N	\N	1962	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1877	298	5	6	2020-11-13	\N	336	4	\N	\N	\N	1806	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1878	298	5	6	2020-08-25	\N	21	4	\N	\N	\N	1963	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1879	298	5	6	2019-10-24	\N	50	4	\N	\N	\N	1964	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1880	298	5	6	2019-10-08	\N	400	4	\N	\N	\N	1965	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1881	298	5	6	2019-09-27	\N	176	4	\N	\N	\N	1729	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1882	298	5	6	2019-09-18	\N	42	4	\N	\N	\N	1390	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1883	298	5	6	2019-08-27	\N	81	4	\N	\N	\N	1966	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1884	298	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1885	298	5	6	2019-04-26	\N	111	4	\N	\N	\N	1967	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1886	298	5	6	2019-03-06	\N	50	4	\N	\N	\N	1455	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1887	298	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1888	298	5	6	2019-02-13	\N	42	4	\N	\N	\N	1653	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1889	298	5	6	2019-01-28	\N	12	4	\N	\N	\N	1948	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1890	298	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1891	298	5	6	2018-10-24	\N	401	4	\N	\N	\N	1968	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1892	298	5	6	2018-10-24	\N	401	4	\N	\N	\N	1969	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1893	298	5	6	2018-10-09	\N	138	4	\N	\N	\N	1970	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1894	298	5	6	2018-06-04	\N	21	4	\N	\N	\N	1971	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1895	298	5	6	2018-05-03	\N	111	4	\N	\N	\N	1972	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1896	526	1	2	2016-02-20	\N	46	4	\N	\N	2506	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1897	526	1	9	2013-06-22	\N	46	4	\N	\N	2507	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1898	526	39	40	2010-07-14	\N	78	4	1077	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1899	526	13	6	2018-11-24	\N	88	4	\N	\N	2508	\N	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1900	526	5	6	2017-08-22	\N	334	4	\N	\N	\N	1864	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1901	526	5	6	2021-02-05	\N	8	4	\N	\N	\N	1453	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1902	526	5	6	2021-01-21	\N	402	4	\N	\N	\N	1973	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1903	526	5	6	2020-11-23	\N	110	4	\N	\N	\N	1974	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1904	526	5	6	2020-11-13	\N	336	4	\N	\N	\N	1806	\N	\N	\N	0	2021-04-09 15:19:28	2021-11-02 11:06:22	0	0	0
1905	526	5	6	2020-09-24	\N	402	4	\N	\N	\N	1975	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1906	526	5	6	2020-06-05	\N	21	4	\N	\N	\N	1976	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1907	526	5	6	2020-05-11	\N	62	4	\N	\N	\N	1977	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1908	526	5	6	2020-04-20	\N	21	4	\N	\N	\N	1515	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1909	526	5	6	2020-01-03	\N	81	4	\N	\N	\N	1978	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1910	526	5	6	2019-11-29	\N	226	4	\N	\N	\N	1562	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1911	526	5	6	2019-11-21	\N	80	4	\N	\N	\N	1285	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1912	526	5	6	2019-10-24	\N	50	4	\N	\N	\N	1979	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1913	526	5	6	2019-08-27	\N	81	4	\N	\N	\N	1980	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1914	526	5	6	2019-03-11	\N	403	4	\N	\N	\N	1981	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1915	526	5	6	2018-09-27	\N	120	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1916	526	5	6	2018-08-29	\N	404	4	\N	\N	\N	1982	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1917	526	5	6	2018-08-23	\N	110	4	\N	\N	\N	1983	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1918	527	1	11	2020-07-02	\N	12	4	1078	\N	724	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1919	527	43	6	2020-09-14	\N	10	4	1079	2838	\N	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1920	527	5	6	2020-12-10	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1921	527	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1922	301	1	101	2004-06-29	\N	10	4	960	2663	2242	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1923	301	43	6	2017-01-24	\N	10	4	922	2603	\N	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1924	301	13	6	2017-05-27	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1925	301	5	6	2016-12-30	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1926	301	5	6	2020-10-06	\N	21	4	\N	\N	\N	1322	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1927	301	5	6	2020-09-17	\N	21	4	\N	\N	\N	1306	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1928	301	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1929	301	5	6	2019-06-13	\N	26	4	\N	\N	\N	1392	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1930	301	5	6	2019-04-25	\N	21	4	\N	\N	\N	1632	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1931	301	5	6	2019-03-06	\N	50	4	\N	\N	\N	1411	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1932	301	5	6	2019-02-21	\N	21	4	\N	\N	\N	1656	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1933	220	1	11	1995-01-15	\N	53	4	\N	2793	2445	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1934	220	1	11	1986-07-11	\N	76	405	\N	2707	2342	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1935	220	13	6	1998-08-11	\N	26	4	\N	\N	2509	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1936	220	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1937	220	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1938	220	5	6	2019-11-25	\N	12	4	\N	\N	\N	1522	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1939	220	5	6	2019-03-28	\N	21	4	\N	\N	\N	1984	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1940	24	1	11	2001-02-27	\N	53	4	\N	2839	2510	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1941	24	1	11	1983-07-09	\N	76	406	\N	2840	2511	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1942	24	13	6	1998-06-11	\N	26	4	\N	\N	2301	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1943	24	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1944	24	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1945	24	5	6	2019-11-25	\N	12	4	\N	\N	\N	1585	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1946	24	5	6	2019-03-28	\N	21	4	\N	\N	\N	1984	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1947	238	1	2	1990-06-29	\N	10	4	1080	2841	2512	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1948	238	5	6	2016-06-27	\N	12	4	\N	\N	\N	1679	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1949	238	5	6	2019-12-06	\N	216	4	\N	\N	\N	1985	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1950	238	5	6	2019-06-26	\N	216	4	\N	\N	\N	1986	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1951	238	5	6	2019-03-15	\N	197	4	\N	\N	\N	1500	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1952	238	5	6	2018-12-14	\N	21	4	\N	\N	\N	1501	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1953	391	1	2	1994-12-15	\N	10	324	\N	2842	2289	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1954	391	1	35	1975-06-23	\N	374	4	\N	2843	862	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1955	391	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1956	391	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1957	391	5	6	2020-01-03	\N	19	4	\N	\N	\N	1449	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1958	391	5	6	2018-08-30	\N	12	4	\N	\N	\N	1987	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1959	391	5	6	2018-04-27	\N	21	4	\N	\N	\N	1252	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1960	391	5	6	2018-04-23	\N	21	4	\N	\N	\N	1988	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1961	485	1	2	2011-07-09	\N	179	4	\N	2844	636	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1962	485	1	101	2009-02-28	\N	179	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1963	485	1	11	2003-06-21	\N	128	4	\N	\N	2513	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1964	485	13	6	2004-06-18	\N	204	4	\N	\N	2319	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1965	485	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1966	485	5	6	2020-11-23	\N	110	4	\N	\N	\N	1989	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1967	485	5	6	2020-11-23	\N	110	4	\N	\N	\N	1990	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1968	485	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1969	485	5	6	2020-03-12	\N	21	4	\N	\N	\N	1991	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1970	309	1	9	2008-12-02	\N	272	290	1081	2845	765	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1971	309	1	14	2005-06-27	\N	26	148	1082	2803	2514	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1972	309	5	6	2016-12-30	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1973	309	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1974	309	5	6	2020-02-27	\N	21	4	\N	\N	\N	1682	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1975	309	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1976	309	5	6	2018-08-30	\N	12	4	\N	\N	\N	1992	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1977	528	1	14	2001-06-20	\N	407	4	1083	2846	2515	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1978	528	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1979	528	5	6	2019-12-05	\N	8	4	\N	\N	\N	1363	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1980	528	5	6	2019-05-03	\N	21	4	\N	\N	\N	1993	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1981	528	5	6	2019-04-12	\N	21	4	\N	\N	\N	1994	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1982	528	5	6	2018-09-28	\N	105	4	\N	\N	\N	1995	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1983	528	5	6	2018-05-12	\N	12	4	\N	\N	\N	1996	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1984	428	1	2	2018-06-21	\N	26	4	1084	2847	2516	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1985	428	1	9	2011-06-29	\N	26	4	947	2625	2517	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1986	428	43	6	2020-02-03	\N	26	4	977	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1987	428	13	6	2020-09-26	\N	46	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1988	428	13	6	2018-03-20	\N	26	4	\N	\N	2518	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1989	428	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1990	428	5	6	2020-05-18	\N	28	4	\N	\N	\N	1997	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1991	428	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1992	428	5	6	2020-11-20	\N	10	4	\N	\N	\N	1685	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1993	428	5	6	2020-11-05	\N	236	4	\N	\N	\N	1998	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1994	428	5	6	2020-09-19	\N	46	4	\N	\N	\N	1999	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1995	428	5	6	2020-06-15	\N	21	4	\N	\N	\N	1352	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1996	428	5	6	2020-04-21	\N	215	4	\N	\N	\N	1537	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1997	428	5	6	2018-04-18	\N	408	4	\N	\N	\N	2000	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1998	322	1	2	1998-06-26	\N	26	409	\N	2848	2303	\N	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
1999	322	1	2	1973-06-29	\N	374	4	\N	2815	528	\N	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2000	322	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2001	107	1	2	2005-06-21	\N	10	239	1085	2611	698	\N	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2002	107	1	35	1994-06-20	\N	10	239	\N	2849	2519	\N	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2003	107	5	6	2019-06-30	\N	28	4	\N	\N	\N	2001	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2004	107	5	6	2021-02-24	\N	21	4	\N	\N	\N	1950	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2005	107	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2006	107	5	6	2020-09-22	\N	19	4	\N	\N	\N	1346	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2007	107	5	6	2020-08-24	\N	21	4	\N	\N	\N	2002	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2008	107	5	6	2019-11-04	\N	12	4	\N	\N	\N	1584	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2009	107	5	6	2019-09-06	\N	12	4	\N	\N	\N	1958	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2010	107	5	6	2019-07-12	\N	140	4	\N	\N	\N	2003	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2011	107	5	6	2018-06-06	\N	410	4	\N	\N	\N	2004	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2012	107	5	6	2018-03-27	\N	411	4	\N	\N	\N	2005	\N	\N	\N	1	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2013	176	1	9	2011-06-17	\N	319	4	\N	2850	2520	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2014	176	1	101	2007-06-27	\N	10	4	\N	2851	\N	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2015	176	5	6	2021-03-09	\N	116	4	\N	\N	\N	2006	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2016	176	5	6	2021-03-05	\N	116	4	\N	\N	\N	2007	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2017	176	5	6	2020-10-23	\N	116	4	\N	\N	\N	2008	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2018	176	5	6	2020-02-04	\N	116	4	\N	\N	\N	2009	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2019	176	5	6	2020-02-03	\N	116	4	\N	\N	\N	2009	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2020	176	5	6	2019-10-24	\N	412	4	\N	\N	\N	2010	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2021	176	5	6	2019-08-24	\N	161	4	\N	\N	\N	2011	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2022	176	5	6	2019-02-05	\N	326	4	\N	\N	\N	2012	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2023	453	1	9	1999-06-15	\N	10	413	950	2852	2507	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2024	453	43	6	2012-09-07	\N	45	4	1086	2853	\N	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2025	453	13	6	2020-06-26	\N	46	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2026	453	13	6	2018-02-01	\N	175	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2027	453	13	6	2011-07-01	\N	268	4	\N	\N	2521	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2028	453	13	6	2011-06-27	\N	15	4	\N	\N	2522	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2029	453	5	6	2018-01-05	\N	105	4	\N	\N	\N	2013	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2030	453	5	6	2020-11-23	\N	110	4	\N	\N	\N	2014	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2031	453	5	6	2020-11-23	\N	110	4	\N	\N	\N	2015	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2032	453	5	6	2020-10-21	\N	414	4	\N	\N	\N	2016	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2033	453	5	6	2020-10-19	\N	347	4	\N	\N	\N	2017	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2034	453	5	6	2020-06-15	\N	21	4	\N	\N	\N	1682	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2035	453	5	6	2020-06-03	\N	62	4	\N	\N	\N	1617	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2036	453	5	6	2020-02-26	\N	236	4	\N	\N	\N	2018	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2037	453	5	6	2019-12-10	\N	236	4	\N	\N	\N	2019	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2038	453	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2039	453	5	6	2019-05-02	\N	12	4	\N	\N	\N	1377	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2040	453	5	6	2019-04-29	\N	288	4	\N	\N	\N	2020	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2041	453	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2042	453	5	6	2018-11-07	\N	347	4	\N	\N	\N	2021	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2043	453	5	6	2018-08-30	\N	12	4	\N	\N	\N	2022	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2044	453	5	6	2018-07-13	\N	415	4	\N	\N	\N	2023	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2045	453	5	6	2018-06-12	\N	159	4	\N	\N	\N	2024	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2046	338	1	14	2005-06-27	\N	26	148	1082	2803	2514	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2047	338	1	11	1996-06-16	\N	53	4	\N	2639	2252	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2048	338	1	11	1973-07-05	\N	151	4	\N	2854	2523	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2049	338	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2050	338	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2051	338	5	6	2020-11-20	\N	12	4	\N	\N	\N	1771	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2052	338	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2053	338	5	6	2019-09-06	\N	12	4	\N	\N	\N	1462	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2054	338	5	6	2019-05-02	\N	12	4	\N	\N	\N	1586	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2055	338	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2056	338	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2057	338	5	6	2018-12-13	\N	21	4	\N	\N	\N	2025	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2058	338	5	6	2018-08-30	\N	12	4	\N	\N	\N	2026	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2059	338	5	6	2018-03-29	\N	21	4	\N	\N	\N	2027	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2060	490	1	9	2009-06-27	\N	10	4	\N	2855	2524	\N	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2061	490	5	6	2017-12-28	\N	12	4	\N	\N	\N	2028	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2062	490	5	6	2020-08-26	\N	21	4	\N	\N	\N	2029	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2063	490	5	6	2019-04-16	\N	50	4	\N	\N	\N	1323	\N	\N	\N	0	2021-04-09 15:19:29	2021-11-02 11:06:22	0	0	0
2064	490	5	6	2019-02-28	\N	21	4	\N	\N	\N	2030	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2065	490	5	6	2019-01-28	\N	127	4	\N	\N	\N	1365	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2066	490	5	6	2018-10-24	\N	50	4	\N	\N	\N	1864	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2067	490	5	6	2018-09-13	\N	21	4	\N	\N	\N	2031	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2068	490	5	6	2018-09-13	\N	21	4	\N	\N	\N	2032	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2069	100	1	14	2008-02-03	\N	393	4	\N	2856	2525	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2070	100	1	11	2004-07-02	\N	128	4	1087	2857	2526	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2071	100	39	40	1991-06-15	\N	416	4	926	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2072	100	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2073	100	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2074	100	5	6	2019-05-02	\N	12	4	\N	\N	\N	1586	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2075	100	5	6	2019-04-02	\N	21	4	\N	\N	\N	1557	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2076	100	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2077	100	5	6	2019-03-05	\N	21	4	\N	\N	\N	1558	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2078	100	5	6	2018-05-23	\N	12	4	\N	\N	\N	1553	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2079	197	1	14	2013-11-03	\N	55	4	\N	2858	2527	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2080	197	1	14	2002-09-10	\N	26	148	1082	2638	562	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2081	197	1	11	1980-03-01	\N	76	417	1088	2859	2528	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2082	197	13	6	2018-12-01	\N	46	4	\N	\N	2529	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2083	197	5	6	2020-12-10	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2084	197	5	6	2020-05-18	\N	28	4	\N	\N	\N	2033	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2085	197	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2086	197	5	6	2019-06-12	\N	12	4	\N	\N	\N	1356	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2087	197	5	6	2019-03-06	\N	50	4	\N	\N	\N	1411	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2088	197	5	6	2018-10-24	\N	206	4	\N	\N	\N	1672	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2089	197	5	6	2018-08-30	\N	12	4	\N	\N	\N	2034	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2090	137	1	32	1996-11-06	\N	15	4	\N	2652	591	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2091	137	1	2	1985-05-25	\N	36	4	\N	2860	857	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2092	137	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2093	137	5	6	2020-05-29	\N	20	4	\N	\N	\N	1544	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2094	137	5	6	2019-11-28	\N	21	4	\N	\N	\N	2035	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2095	137	5	6	2019-11-04	\N	12	4	\N	\N	\N	1584	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2096	137	5	6	2019-09-06	\N	12	4	\N	\N	\N	1958	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2097	137	5	6	2019-03-06	\N	50	4	\N	\N	\N	1411	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2098	137	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2099	137	5	6	2018-08-30	\N	12	4	\N	\N	\N	2036	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2100	38	1	9	2019-06-20	\N	26	4	\N	2641	2476	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2101	38	1	11	2015-07-02	\N	12	4	975	\N	585	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2102	38	13	6	2020-03-21	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2103	38	5	6	2020-12-10	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2104	38	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2105	38	5	6	2021-01-20	\N	19	4	\N	\N	\N	1422	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2106	38	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2107	38	5	6	2019-11-15	\N	21	4	\N	\N	\N	2037	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2108	38	5	6	2019-11-06	\N	63	4	\N	\N	\N	1710	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2109	436	39	40	1997-06-22	\N	418	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2110	436	13	6	2019-06-17	\N	46	4	\N	\N	2530	\N	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2111	436	5	6	2019-09-16	\N	300	4	\N	\N	\N	1864	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2112	436	5	6	2019-06-17	\N	46	4	\N	\N	\N	1467	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2113	119	1	9	2002-02-01	\N	15	4	1089	2861	604	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2114	119	1	16	1997-06-13	\N	53	4	\N	2862	2531	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2115	119	1	11	1986-03-01	\N	419	4	\N	2863	2532	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2116	119	13	6	2014-01-29	\N	420	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2117	119	13	6	2013-12-16	\N	21	4	\N	\N	2533	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2118	119	13	6	2013-09-20	\N	421	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2119	119	13	6	2010-10-17	\N	21	4	\N	\N	2534	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2120	119	13	6	2009-04-30	\N	422	4	\N	\N	2535	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2121	119	13	6	2009-04-28	\N	423	4	\N	\N	2536	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2122	119	5	6	2020-09-19	\N	424	4	\N	\N	\N	2038	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2123	119	5	6	2020-02-25	\N	21	4	\N	\N	\N	2039	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2124	119	5	6	2019-11-01	\N	304	4	\N	\N	\N	2040	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2125	119	5	6	2019-10-23	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2126	119	5	6	2018-12-12	\N	21	4	\N	\N	\N	2041	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2127	119	5	6	2018-12-11	\N	21	4	\N	\N	\N	2042	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2128	119	5	6	2018-10-11	\N	21	4	\N	\N	\N	2043	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2129	119	5	6	2018-05-18	\N	21	4	\N	\N	\N	2044	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2130	152	1	101	2020-06-19	\N	15	4	1090	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2131	152	1	11	2011-06-30	\N	128	4	964	\N	2262	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2132	152	43	6	2017-01-17	\N	15	4	1091	2771	\N	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2133	152	43	6	2016-09-05	\N	15	4	1090	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2134	152	13	6	2019-03-11	\N	15	4	\N	\N	2288	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2135	152	13	6	2015-05-16	\N	425	4	\N	\N	2537	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2136	152	5	6	2016-12-30	\N	12	4	\N	\N	\N	2045	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2137	152	5	6	2020-12-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2138	152	5	6	2019-02-13	\N	426	4	\N	\N	\N	2046	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2139	182	1	2	2019-02-23	\N	46	4	1004	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2140	182	1	9	2013-06-28	\N	46	4	\N	2864	2538	\N	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2141	182	1	9	2009-06-30	\N	26	4	\N	2865	2539	\N	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2142	182	43	6	2017-05-31	\N	46	4	1092	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2143	182	5	6	2020-09-14	\N	140	4	\N	\N	\N	2047	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2144	182	5	6	2017-09-30	\N	77	4	\N	\N	\N	2048	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2145	182	5	6	2020-11-13	\N	399	4	\N	\N	\N	1962	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2146	182	5	6	2020-04-20	\N	21	4	\N	\N	\N	2049	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2147	182	5	6	2020-04-20	\N	21	4	\N	\N	\N	2050	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2148	182	5	6	2019-09-27	\N	176	4	\N	\N	\N	1454	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2149	182	5	6	2019-03-06	\N	50	4	\N	\N	\N	1411	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2150	248	1	2	2009-07-06	\N	26	4	\N	2866	2540	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2151	248	13	6	2011-04-21	\N	427	4	\N	\N	2541	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2152	248	5	6	2020-12-10	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2153	248	5	6	2016-06-27	\N	12	4	\N	\N	\N	2051	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2154	248	5	6	2020-11-13	\N	399	4	\N	\N	\N	1962	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2155	248	5	6	2019-09-18	\N	42	4	\N	\N	\N	1390	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2156	248	5	6	2019-03-06	\N	50	4	\N	\N	\N	1455	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2157	248	5	6	2018-04-27	\N	21	4	\N	\N	\N	2052	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2158	437	1	35	2007-02-16	\N	10	4	\N	2867	2542	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2159	437	1	35	1993-06-26	\N	10	4	\N	2868	2543	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2160	437	13	6	2015-11-20	\N	26	4	\N	\N	2544	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2161	437	13	6	2003-06-12	\N	26	4	\N	\N	2545	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2162	437	5	6	2016-06-27	\N	12	4	\N	\N	\N	2053	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2163	437	5	6	2021-02-15	\N	205	4	\N	\N	\N	1509	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2164	437	5	6	2018-09-12	\N	74	4	\N	\N	\N	2054	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2165	437	5	6	2018-04-27	\N	12	4	\N	\N	\N	1367	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2166	56	1	35	1988-01-16	\N	211	4	\N	2713	528	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2167	56	13	6	2014-11-28	\N	45	4	\N	\N	2288	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2168	56	5	6	2016-12-30	\N	12	4	\N	\N	\N	1749	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2169	56	5	6	2020-11-26	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2170	56	5	6	2019-03-04	\N	218	4	\N	\N	\N	1726	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2171	529	39	40	2010-07-15	\N	428	4	960	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2172	48	1	35	1998-06-18	\N	33	4	\N	2869	747	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2173	48	1	11	1996-01-10	\N	128	4	\N	2870	2546	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2174	48	13	6	2004-03-03	\N	26	4	\N	\N	2545	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2175	48	5	6	2016-06-27	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2176	48	5	6	2018-04-27	\N	21	4	\N	\N	\N	2055	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2177	48	5	6	2018-04-23	\N	21	4	\N	\N	\N	1255	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2178	48	5	6	2018-04-07	\N	21	4	\N	\N	\N	1928	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2179	295	1	32	2002-02-14	\N	10	4	\N	2720	2311	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2180	295	1	35	1982-06-26	\N	429	430	\N	2871	747	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2181	295	13	6	2017-08-23	\N	15	4	\N	\N	2547	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2182	295	13	6	2005-03-24	\N	76	4	\N	\N	2548	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2183	295	5	6	2021-01-20	\N	19	4	\N	\N	\N	1368	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2184	295	5	6	2020-12-10	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2185	295	5	6	2020-11-16	\N	61	4	\N	\N	\N	2056	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2186	295	5	6	2020-08-21	\N	138	4	\N	\N	\N	2057	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2187	295	5	6	2020-08-20	\N	61	4	\N	\N	\N	1264	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2188	295	5	6	2019-09-27	\N	121	4	\N	\N	\N	2058	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2189	295	5	6	2019-06-12	\N	12	4	\N	\N	\N	1596	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2190	295	5	6	2019-04-16	\N	105	4	\N	\N	\N	1364	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2191	295	5	6	2019-03-22	\N	163	4	\N	\N	\N	1715	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2192	295	5	6	2019-01-28	\N	127	4	\N	\N	\N	1365	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2193	295	5	6	2018-12-11	\N	121	4	\N	\N	\N	1456	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2194	295	5	6	2018-08-30	\N	12	4	\N	\N	\N	1514	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2195	295	5	6	2018-08-23	\N	121	4	\N	\N	\N	1459	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2196	295	5	6	2018-08-23	\N	64	4	69	\N	\N	2059	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2197	295	5	6	2018-04-12	\N	121	4	\N	\N	\N	1615	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2198	295	5	6	2018-04-11	\N	61	4	\N	\N	\N	2060	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2199	249	1	101	2019-02-23	\N	179	4	1044	2787	652	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2200	249	1	11	2011-06-29	\N	128	4	1093	\N	858	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2201	249	43	6	2018-08-17	\N	10	172	1094	2872	\N	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2202	249	13	6	2018-12-01	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2203	249	5	6	2020-12-10	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2204	249	5	6	2019-06-13	\N	26	4	\N	\N	\N	1355	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2222	66	1	14	2003-06-26	\N	26	148	1082	2803	530	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2223	66	1	35	\N	\N	374	4	\N	2875	528	\N	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2224	66	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2225	91	1	2	2006-01-21	\N	46	432	1096	2876	2551	\N	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2226	91	1	35	1991-06-21	\N	36	4	\N	2877	763	\N	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2227	91	13	6	2008-10-07	\N	427	4	\N	\N	2552	\N	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2228	91	5	6	2018-05-11	\N	261	4	\N	\N	\N	2064	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2229	91	5	6	2020-10-14	\N	8	4	\N	\N	\N	1270	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2230	91	5	6	2019-12-04	\N	79	4	\N	\N	\N	2065	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2231	91	5	6	2019-11-15	\N	21	4	\N	\N	\N	2037	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2232	91	5	6	2019-09-30	\N	71	4	\N	\N	\N	1273	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2233	91	5	6	2019-08-29	\N	79	4	\N	\N	\N	2066	\N	\N	\N	1	2021-04-09 15:19:30	2021-11-02 11:06:22	0	0	0
2234	91	5	6	2019-08-23	\N	64	4	\N	\N	\N	2067	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2235	91	5	6	2019-03-29	\N	74	4	\N	\N	\N	1278	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2236	91	5	6	2019-03-22	\N	79	4	\N	\N	\N	2068	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2237	91	5	6	2018-10-31	\N	42	4	\N	\N	\N	1280	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2238	91	5	6	2018-10-23	\N	79	4	\N	\N	\N	1288	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2239	91	5	6	2018-10-19	\N	71	4	\N	\N	\N	2069	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2240	91	5	6	2018-09-25	\N	71	4	\N	\N	\N	2070	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2241	91	5	6	2018-08-20	\N	20	4	\N	\N	\N	1642	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2242	91	5	6	2018-08-14	\N	79	4	\N	\N	\N	2071	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2243	91	5	6	2018-05-25	\N	287	4	\N	\N	\N	1703	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2244	91	5	6	2018-05-11	\N	21	4	\N	\N	\N	1267	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2245	303	1	9	2013-02-02	\N	433	4	\N	910	747	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2246	303	1	14	2007-11-04	\N	55	4	\N	2829	650	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2247	303	1	11	2003-06-26	\N	12	4	975	2878	2280	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2248	303	43	6	2010-12-08	\N	433	4	1097	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2249	303	13	6	2008-03-28	\N	10	4	\N	\N	2196	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2250	303	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2251	303	5	6	2018-04-27	\N	12	4	\N	\N	\N	1367	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2252	480	1	14	2009-02-28	\N	46	4	1098	2646	2424	\N	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2253	480	1	11	2006-12-19	\N	53	4	\N	2879	2553	\N	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2254	480	39	150	2006-06-28	\N	434	4	1099	\N	2554	\N	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2255	480	39	40	1995-06-22	\N	78	4	1100	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2256	480	5	6	2016-11-29	\N	300	4	\N	\N	\N	2072	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2257	480	5	6	2018-11-28	\N	21	4	\N	\N	\N	2073	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2258	213	1	2	2002-02-14	\N	10	4	\N	2652	608	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2259	213	1	35	1989-06-30	\N	67	4	\N	2656	2337	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2260	213	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2261	213	5	6	2021-02-24	\N	21	4	\N	\N	\N	1950	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2262	213	5	6	2020-01-03	\N	19	4	\N	\N	\N	1449	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2263	213	5	6	2019-10-10	\N	21	4	\N	\N	\N	1322	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2264	213	5	6	2019-05-09	\N	100	4	\N	\N	\N	1952	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2265	213	5	6	2019-04-09	\N	21	4	\N	\N	\N	2074	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2266	213	5	6	2018-12-11	\N	21	4	\N	\N	\N	1800	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2267	213	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2268	213	5	6	2018-04-23	\N	21	4	\N	\N	\N	1255	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2269	383	1	11	2005-10-05	\N	376	4	1066	2880	2555	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2270	383	1	14	2002-09-10	\N	26	148	1082	2638	2251	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2271	383	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2272	383	5	6	2019-11-04	\N	12	4	\N	\N	\N	1584	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2273	383	5	6	2019-09-06	\N	12	4	\N	\N	\N	2075	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2274	383	5	6	2018-09-07	\N	119	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2275	167	1	32	2008-06-18	\N	217	435	\N	\N	2556	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2276	167	1	122	1993-01-29	\N	436	4	\N	2881	2557	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2277	167	1	35	1980-06-26	\N	67	4	\N	\N	2558	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2278	167	5	6	2017-05-26	\N	117	4	\N	\N	\N	2076	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2279	167	5	6	2020-12-11	\N	118	4	\N	\N	\N	1388	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2280	167	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2281	167	5	6	2020-05-25	\N	21	4	\N	\N	\N	1682	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2282	167	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2283	167	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2284	125	1	14	2001-06-28	\N	26	148	1082	2638	2251	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2285	125	1	11	1995-06-15	\N	53	4	\N	2793	2445	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2286	125	13	6	2018-12-01	\N	46	4	\N	\N	2529	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2287	125	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2288	125	5	6	2021-01-21	\N	49	4	\N	\N	\N	2077	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2289	125	5	6	2019-02-21	\N	66	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2290	125	5	6	2018-12-01	\N	46	4	\N	\N	\N	2078	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2291	125	5	6	2018-10-09	\N	21	4	\N	\N	\N	1252	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2292	125	5	6	2018-10-03	\N	21	4	\N	\N	\N	1580	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2293	125	5	6	2018-08-30	\N	12	4	\N	\N	\N	1257	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2294	530	1	9	2013-06-19	\N	217	4	\N	2882	2559	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2295	530	39	40	2009-07-16	\N	437	4	960	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2296	530	5	6	2014-12-23	\N	50	4	\N	\N	\N	2079	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2297	185	1	2	2020-06-28	\N	10	4	1101	2883	2560	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2298	185	1	2	2011-06-30	\N	10	438	\N	2786	636	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2299	185	1	9	2008-06-26	\N	10	189	\N	2798	652	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2300	185	13	6	2021-02-24	\N	439	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2301	185	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2302	185	5	6	2020-01-03	\N	19	4	\N	\N	\N	1449	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2303	531	1	9	2019-06-26	\N	10	4	1059	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2304	531	39	40	2014-07-03	\N	377	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2305	531	43	6	2018-02-01	\N	10	4	1059	2884	\N	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2306	531	43	6	2016-09-14	\N	10	4	1058	2885	\N	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2307	531	5	6	2019-09-06	\N	12	4	\N	\N	\N	1374	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2308	531	5	6	2018-12-20	\N	12	4	\N	\N	\N	1903	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2309	352	1	14	2009-02-06	\N	440	4	\N	\N	2561	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2310	352	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2311	352	5	6	2019-05-17	\N	21	4	\N	\N	\N	1723	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2312	352	5	6	2018-04-27	\N	12	4	\N	\N	\N	1367	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2313	121	1	35	1994-06-20	\N	10	4	\N	2886	2290	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2314	121	5	6	2020-02-11	\N	306	4	\N	\N	\N	1912	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2315	121	5	6	2020-11-25	\N	8	4	\N	\N	\N	1424	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2316	121	5	6	2020-09-22	\N	19	4	\N	\N	\N	1346	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2317	121	5	6	2019-11-06	\N	63	4	\N	\N	\N	1710	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2318	121	5	6	2019-11-04	\N	12	4	\N	\N	\N	1584	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2319	377	1	32	2014-06-21	\N	15	4	\N	2632	2243	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2320	377	1	2	1993-06-19	\N	10	4	\N	2739	2393	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2321	377	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2322	377	501	6	2021-01-20	2024-01-19	19	4	\N	\N	\N	2080	1176	JDzvbff6FpVXOBoupRqiOamBjQ29vMx3WyKFvEzs.pdf	\N	0	2021-04-09 15:19:31	2021-11-02 11:04:31	0	0	36
2323	377	5	6	2020-11-03	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2324	377	5	6	2020-01-03	\N	19	4	\N	\N	\N	1449	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2325	377	5	6	2019-09-06	\N	12	4	\N	\N	\N	1374	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2326	377	5	6	2019-06-12	\N	12	4	\N	\N	\N	1356	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2327	377	5	6	2019-05-02	\N	12	4	\N	\N	\N	1586	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2328	377	5	6	2018-08-30	\N	12	4	\N	\N	\N	1514	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2329	67	1	11	2015-10-26	\N	12	4	1102	2887	547	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2330	67	1	11	2012-06-28	\N	12	4	1103	\N	2562	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2331	67	13	6	2018-02-27	\N	152	4	\N	\N	2254	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2332	67	13	6	2017-12-06	\N	152	4	\N	\N	2468	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2333	67	13	6	2017-11-11	\N	15	4	\N	\N	2288	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2334	67	5	6	2016-12-30	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2335	67	5	6	2020-11-27	\N	12	4	\N	\N	\N	1315	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2336	67	5	6	2019-10-10	\N	441	4	\N	\N	\N	2081	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2337	203	1	2	1992-06-26	\N	10	4	\N	2609	2563	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2338	203	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2339	203	5	6	2020-11-26	\N	12	4	\N	\N	\N	807	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2340	203	5	6	2020-05-25	\N	21	4	\N	\N	\N	1489	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2341	203	5	6	2020-02-28	\N	21	4	\N	\N	\N	2082	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2342	203	5	6	2020-01-03	\N	19	4	\N	\N	\N	1951	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2343	203	5	6	2019-11-06	\N	21	4	\N	\N	\N	2083	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2344	203	5	6	2019-09-19	\N	12	4	\N	\N	\N	1713	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2345	203	5	6	2019-09-19	\N	12	4	\N	\N	\N	2084	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2346	203	5	6	2019-04-09	\N	60	4	\N	\N	\N	2085	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2347	203	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2348	203	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2349	203	5	6	2018-09-07	\N	119	4	\N	\N	\N	1265	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2350	203	5	6	2018-04-20	\N	21	4	\N	\N	\N	1554	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2351	292	1	14	2019-02-08	\N	215	4	1104	2888	2564	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2352	292	1	14	2019-02-07	\N	215	4	1104	\N	2564	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2353	292	1	2	2016-01-27	\N	26	4	\N	2889	2477	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2354	292	1	9	2014-01-25	\N	215	4	\N	2890	747	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2355	292	1	14	2009-06-27	\N	15	4	\N	2646	2565	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2356	292	1	11	2007-07-02	\N	128	4	975	2891	2280	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2357	292	43	6	2017-10-21	\N	215	4	1104	2892	\N	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2358	292	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2359	292	5	6	2018-12-13	\N	21	4	\N	\N	\N	1469	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2360	292	5	6	2018-10-18	\N	31	4	\N	\N	\N	1237	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2361	292	5	6	2018-04-27	\N	21	4	\N	\N	\N	1259	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2362	62	1	2	2020-06-19	\N	15	4	1006	2661	2363	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2363	62	1	35	2012-06-20	\N	10	4	\N	2715	493	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2364	62	43	6	2020-02-05	\N	15	4	1105	2661	\N	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2365	62	43	6	2018-08-31	\N	15	4	1106	2661	\N	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2366	62	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2367	62	5	6	2020-11-20	\N	12	4	\N	\N	\N	1771	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2368	62	5	6	2019-11-28	\N	12	4	\N	\N	\N	1461	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2369	210	1	35	2005-07-02	\N	442	4	\N	2893	2566	\N	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2370	210	1	11	1992-07-04	\N	443	4	\N	2894	2567	\N	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2371	210	13	6	2015-03-16	\N	281	4	\N	\N	2250	\N	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2372	210	5	6	2017-11-24	\N	401	4	\N	\N	\N	2086	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2373	210	5	6	2019-09-27	\N	176	4	\N	\N	\N	1454	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2374	210	5	6	2019-01-09	\N	42	4	\N	\N	\N	2087	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2375	210	5	6	2018-10-31	\N	176	4	\N	\N	\N	2088	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2376	210	5	6	2018-10-22	\N	444	4	\N	\N	\N	2089	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2377	210	5	6	2018-08-03	\N	176	4	\N	\N	\N	2090	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2378	210	5	6	2018-08-03	\N	176	4	\N	\N	\N	2090	\N	\N	\N	1	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2379	21	1	35	2004-06-17	\N	46	4	\N	\N	2568	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2380	21	1	2	1991-06-15	\N	91	4	\N	2895	762	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2381	21	13	6	2014-10-21	\N	21	4	\N	\N	2569	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2382	21	13	6	2013-08-31	2018-08-31	100	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2383	21	13	6	2006-06-29	\N	100	4	\N	\N	2570	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2384	21	5	6	2021-01-16	\N	46	4	\N	\N	\N	2091	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2385	21	5	6	2018-01-20	\N	77	4	\N	\N	\N	1282	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2386	21	5	6	2019-12-23	\N	78	4	\N	\N	\N	1283	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2387	21	5	6	2019-11-23	\N	78	4	\N	\N	\N	1284	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2388	21	5	6	2019-11-05	\N	80	4	\N	\N	\N	1285	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2389	21	5	6	2019-09-27	\N	176	4	\N	\N	\N	1454	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2390	21	5	6	2019-09-18	\N	42	4	\N	\N	\N	1390	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2391	21	5	6	2019-08-27	\N	81	4	\N	\N	\N	1286	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2392	21	5	6	2019-01-02	\N	78	4	\N	\N	\N	2092	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2393	21	5	6	2018-12-28	\N	78	4	\N	\N	\N	1564	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2394	21	5	6	2018-12-27	\N	78	4	\N	\N	\N	2093	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2395	21	5	6	2018-10-13	\N	84	4	\N	\N	\N	2094	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2396	21	5	6	2018-10-10	\N	84	4	\N	\N	\N	2095	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2397	103	1	124	2003-05-28	\N	238	4	1107	2896	2202	\N	\N	\N	\N	0	2021-04-09 15:19:31	2021-11-02 11:06:22	0	0	0
2398	103	1	35	2002-05-24	\N	238	4	929	2605	2201	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2399	103	1	2	1991-07-03	\N	445	4	1108	2897	763	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2400	103	43	6	2011-12-21	\N	26	4	1109	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2401	103	43	6	2011-02-18	\N	26	446	934	2898	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2402	103	13	6	2013-05-28	\N	10	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2403	103	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2404	103	5	6	2020-11-17	\N	19	4	\N	\N	\N	2096	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2405	103	5	6	2020-10-30	\N	60	4	\N	\N	\N	1408	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2406	103	5	6	2020-09-22	\N	19	4	\N	\N	\N	1346	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2407	103	5	6	2019-04-02	\N	21	4	\N	\N	\N	1318	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2408	103	5	6	2019-03-28	\N	447	4	\N	\N	\N	2097	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2409	103	5	6	2019-03-12	\N	21	4	\N	\N	\N	1325	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2410	103	5	6	2018-12-20	\N	19	4	\N	\N	\N	2098	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2411	103	5	6	2018-10-11	\N	21	4	\N	\N	\N	1320	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2412	8	1	124	2003-05-16	\N	125	4	\N	2899	2271	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2413	8	13	6	2019-05-21	\N	448	4	\N	\N	2571	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2414	8	5	6	2020-11-05	\N	12	4	\N	\N	\N	1243	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2415	8	5	6	2020-09-22	\N	19	4	\N	\N	\N	1346	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2416	8	5	6	2020-08-25	\N	10	4	\N	\N	\N	1561	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2417	8	5	6	2019-10-23	\N	105	4	\N	\N	\N	2099	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2418	8	5	6	2019-09-13	\N	10	4	\N	\N	\N	2100	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2419	8	5	6	2019-04-25	\N	21	4	\N	\N	\N	2101	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2420	8	5	6	2019-03-29	\N	8	4	\N	\N	\N	2102	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2421	8	5	6	2019-03-27	\N	449	4	\N	\N	\N	2103	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2422	8	5	6	2019-03-11	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2423	8	5	6	2018-10-25	\N	450	4	\N	\N	\N	2104	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2424	8	5	6	2018-10-20	\N	21	4	\N	\N	\N	1516	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2425	8	5	6	2018-05-11	\N	451	4	\N	\N	\N	2105	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2426	430	1	101	2019-12-30	\N	10	4	1081	2900	2386	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2427	430	39	40	2013-07-05	\N	223	4	960	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2428	430	43	6	2019-09-14	\N	15	4	890	2611	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2429	430	13	6	2019-11-09	\N	15	4	\N	\N	556	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2430	430	5	6	2020-02-11	\N	288	4	\N	\N	\N	1946	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2431	378	1	101	2007-02-01	\N	69	4	1110	2901	2572	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2432	378	5	6	2017-01-31	\N	50	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2433	378	5	6	2021-02-15	\N	205	4	\N	\N	\N	1509	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2434	378	5	6	2020-10-16	\N	69	4	\N	\N	\N	2106	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2435	183	1	14	2004-11-11	\N	125	4	1029	\N	2424	\N	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2436	183	1	11	1983-07-02	\N	89	4	\N	2902	2526	\N	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2437	183	5	6	2020-02-14	\N	50	4	\N	\N	\N	2107	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2438	183	5	6	2020-02-14	\N	105	4	\N	\N	\N	2108	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2439	183	5	6	2016-11-04	\N	185	4	\N	\N	\N	2109	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2440	183	5	6	2021-01-07	\N	139	4	\N	\N	\N	2110	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2441	183	5	6	2020-11-26	\N	132	4	\N	\N	\N	2111	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2442	183	5	6	2020-10-30	\N	197	4	\N	\N	\N	1666	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2443	183	5	6	2019-08-28	\N	452	4	\N	\N	\N	2112	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2444	183	5	6	2019-05-14	\N	21	4	\N	\N	\N	2113	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2445	183	5	6	2019-02-20	\N	273	4	\N	\N	\N	1667	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2446	183	5	6	2019-01-30	\N	238	4	\N	\N	\N	2114	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2447	183	5	6	2019-01-06	\N	453	4	\N	\N	\N	2115	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2448	204	1	2	1990-06-27	\N	10	4	1111	2903	2218	\N	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2449	204	13	6	2015-11-04	\N	15	4	\N	\N	2573	\N	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2450	204	13	6	2012-11-06	\N	10	4	\N	\N	2574	\N	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2451	204	13	6	2012-02-11	\N	10	4	\N	\N	2575	\N	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2452	204	13	6	2008-01-02	\N	30	4	\N	\N	2576	\N	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2453	204	13	6	2003-10-16	\N	454	4	\N	\N	2577	\N	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2454	204	5	6	2018-08-30	\N	455	456	\N	\N	\N	2116	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2455	204	5	6	2020-01-02	\N	457	4	\N	\N	\N	2117	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2456	204	5	6	2019-09-20	\N	455	4	\N	\N	\N	2118	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2457	204	5	6	2019-04-05	\N	20	4	\N	\N	\N	2119	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2458	204	5	6	2018-10-23	\N	457	4	\N	\N	\N	2120	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2459	204	5	6	2018-06-14	\N	121	4	\N	\N	\N	1459	\N	\N	\N	1	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2460	44	1	124	2004-09-03	\N	10	4	\N	2733	2578	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2461	44	1	9	1994-06-27	\N	10	4	\N	2904	2579	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2462	44	5	6	2014-12-22	\N	50	4	\N	\N	\N	2121	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2463	44	5	6	2018-08-21	\N	105	4	\N	\N	\N	2122	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:22	0	0	0
2464	44	5	6	2018-08-20	\N	105	4	\N	\N	\N	2123	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2465	231	1	32	2008-08-27	\N	10	4	\N	2905	2281	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2466	231	1	35	2006-06-26	\N	10	4	930	2663	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2467	231	1	35	1984-06-26	\N	26	458	952	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2468	231	5	6	2016-02-26	\N	117	4	\N	\N	\N	2086	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2469	231	5	6	2020-12-14	\N	110	4	\N	\N	\N	1369	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2470	532	1	35	2003-06-30	\N	10	459	\N	\N	2347	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2471	532	1	2	1996-05-25	\N	10	4	\N	2906	2580	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2472	532	1	2	1992-06-26	\N	10	4	\N	2620	2247	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2473	532	5	6	2019-02-01	\N	344	4	\N	\N	\N	2124	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2474	532	5	6	2020-12-15	\N	460	4	\N	\N	\N	1533	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2475	532	5	6	2020-10-15	\N	26	4	\N	\N	\N	2125	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2476	532	5	6	2020-06-09	\N	65	4	\N	\N	\N	2126	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2477	532	5	6	2019-08-27	\N	461	4	\N	\N	\N	2127	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2478	532	5	6	2019-03-23	\N	63	462	\N	\N	\N	2128	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2479	532	5	6	2019-02-28	\N	463	4	\N	\N	\N	2129	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2480	532	5	6	2019-01-23	\N	63	4	\N	\N	\N	2130	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2481	58	1	35	1982-06-21	\N	36	4	\N	2907	763	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2482	58	13	6	2017-04-26	\N	45	4	\N	\N	2581	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2483	58	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2484	58	5	6	2020-10-23	\N	21	4	\N	\N	\N	1850	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2485	58	5	6	2019-12-17	\N	21	4	\N	\N	\N	2131	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2486	58	5	6	2019-10-23	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2487	58	5	6	2019-05-10	\N	21	4	\N	\N	\N	2132	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2488	58	5	6	2019-03-06	\N	50	4	\N	\N	\N	1323	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2489	58	5	6	2018-06-29	\N	21	4	\N	\N	\N	2133	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2490	58	5	6	2018-05-10	\N	21	4	\N	\N	\N	2134	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2491	92	1	2	2013-03-01	\N	45	4	1112	\N	2582	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2492	92	1	35	1995-11-01	\N	67	4	\N	2908	2583	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2493	92	13	6	2013-12-19	\N	21	4	\N	\N	2584	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2494	92	13	6	2009-11-11	\N	94	464	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2495	92	5	6	2018-06-12	\N	71	4	\N	\N	\N	2135	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2496	92	5	6	2020-11-30	\N	71	4	\N	\N	\N	1268	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2497	92	5	6	2020-11-05	\N	72	4	\N	\N	\N	2136	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2498	92	5	6	2020-10-14	\N	8	4	\N	\N	\N	1270	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2499	92	5	6	2020-05-07	\N	449	4	\N	\N	\N	2137	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2500	92	5	6	2020-04-08	\N	21	4	\N	\N	\N	1516	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2501	92	5	6	2020-01-31	\N	21	4	\N	\N	\N	1410	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2502	92	5	6	2019-12-05	\N	8	4	\N	\N	\N	2138	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2503	92	5	6	2019-10-24	\N	21	4	\N	\N	\N	1322	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2504	92	5	6	2019-09-30	\N	71	4	\N	\N	\N	1273	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2505	92	5	6	2019-03-29	\N	74	4	\N	\N	\N	1278	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2506	92	5	6	2019-02-20	\N	465	4	\N	\N	\N	2139	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2507	92	5	6	2019-01-03	\N	72	4	\N	\N	\N	1640	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2508	92	5	6	2018-09-25	\N	71	4	\N	\N	\N	1281	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2509	92	5	6	2018-05-03	\N	111	4	\N	\N	\N	2140	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2510	418	1	11	1984-03-02	\N	466	4	\N	2909	2585	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2511	418	13	6	2015-11-14	\N	46	4	\N	\N	2586	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2512	418	5	6	2016-11-29	\N	300	4	\N	\N	\N	1864	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2513	418	5	6	2020-12-28	\N	467	4	\N	\N	\N	2141	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2514	418	5	6	2020-12-02	\N	118	4	\N	\N	\N	1351	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2515	418	5	6	2020-04-28	\N	205	4	\N	\N	\N	2142	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2516	418	5	6	2019-09-27	\N	176	4	\N	\N	\N	1454	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2517	418	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2518	418	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2519	418	5	6	2019-01-28	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2520	418	5	6	2018-10-18	\N	71	4	\N	\N	\N	2143	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2521	43	1	32	2000-06-17	\N	15	468	\N	2715	747	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2522	43	1	101	1995-06-02	\N	15	469	\N	2910	2587	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2523	43	13	6	2016-05-26	\N	45	4	\N	\N	2588	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2524	43	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2525	43	5	6	2019-11-07	\N	42	4	\N	\N	\N	1280	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2526	43	5	6	2019-07-26	\N	66	4	\N	\N	\N	2144	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2527	43	5	6	2018-12-12	\N	21	4	\N	\N	\N	1557	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2528	43	5	6	2018-11-09	\N	21	4	\N	\N	\N	1464	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2529	43	5	6	2018-08-30	\N	12	4	\N	\N	\N	1619	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2530	45	1	2	2016-01-27	\N	26	4	\N	2715	2477	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2531	45	1	9	2014-01-23	\N	26	4	\N	2641	498	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2532	45	1	14	2007-11-04	\N	55	4	\N	2911	2589	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2533	45	1	14	2004-06-29	\N	26	148	1082	2912	2514	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2534	45	1	11	1997-07-04	\N	128	4	\N	2870	2546	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2535	45	39	150	1994-10-17	\N	238	4	1113	\N	2590	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2536	45	39	40	1991-06-22	\N	470	4	1100	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2537	45	43	6	2019-09-09	\N	26	4	1114	2913	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2538	45	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2539	45	5	6	2020-01-03	\N	19	4	\N	\N	\N	1449	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2540	45	5	6	2019-05-02	\N	12	4	\N	\N	\N	1556	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2541	45	5	6	2018-09-13	\N	12	4	\N	\N	\N	1406	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2542	35	1	32	2001-06-29	\N	471	4	1115	2914	2591	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2543	35	1	9	1999-06-15	\N	10	4	1075	2914	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2544	35	1	124	1995-07-07	\N	10	4	\N	\N	\N	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2545	35	1	2	1984-06-27	\N	67	4	1116	2915	2469	\N	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2546	35	5	6	2016-12-30	\N	12	4	\N	\N	\N	1260	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2547	35	5	6	2020-12-10	\N	66	4	\N	\N	\N	2145	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2548	35	5	6	2020-11-27	\N	95	4	\N	\N	\N	2146	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2549	35	5	6	2020-11-19	\N	21	4	\N	\N	\N	1724	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2550	35	5	6	2020-10-23	\N	472	4	\N	\N	\N	2147	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2551	35	5	6	2020-09-23	\N	472	4	\N	\N	\N	2148	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2552	35	5	6	2020-09-09	\N	473	4	\N	\N	\N	2149	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2553	35	5	6	2020-09-08	\N	473	4	\N	\N	\N	2150	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2554	35	5	6	2020-05-28	\N	21	4	\N	\N	\N	1489	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2555	35	5	6	2020-04-26	\N	42	4	\N	\N	\N	2151	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2556	35	5	6	2019-11-28	\N	56	4	\N	\N	\N	2152	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2557	35	5	6	2019-09-06	\N	12	4	\N	\N	\N	2153	\N	\N	\N	0	2021-04-09 15:19:32	2021-11-02 11:06:23	0	0	0
2558	35	5	6	2019-03-01	\N	474	4	\N	\N	\N	2154	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2559	35	5	6	2018-12-20	\N	12	4	\N	\N	\N	1746	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2560	35	5	6	2018-10-25	\N	474	4	\N	\N	\N	2155	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2561	35	5	6	2018-08-30	\N	12	4	\N	\N	\N	2156	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2562	108	1	2	1995-06-27	\N	10	178	960	2916	2591	\N	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2563	108	1	35	1993-06-26	\N	10	4	\N	2917	2592	\N	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2564	108	1	11	1986-02-26	\N	466	4	1117	2918	770	\N	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2565	108	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2566	108	501	6	2020-09-28	2023-09-27	288	4	\N	\N	\N	832	1177	TREqLVEGkOX9HXACeNqO6UPeY4ceQEfA5MNly3St.pdf	\N	0	2021-04-09 15:19:33	2021-11-02 11:04:31	0	0	4
2567	108	5	6	2020-08-31	\N	21	4	\N	\N	\N	2157	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2568	108	5	6	2020-05-28	\N	21	4	\N	\N	\N	1489	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2569	108	5	6	2019-09-06	\N	12	4	\N	\N	\N	1354	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2570	108	5	6	2019-08-22	\N	197	4	\N	\N	\N	2158	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2571	108	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2572	108	5	6	2019-03-05	\N	12	4	\N	\N	\N	1378	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2573	108	5	6	2018-11-26	\N	12	4	\N	\N	\N	1404	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2574	108	5	6	2018-08-30	\N	12	4	\N	\N	\N	1257	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2575	108	5	6	2018-08-29	\N	197	4	\N	\N	\N	1499	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2579	76	1	2	1996-12-18	\N	15	4	\N	2689	2289	\N	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2580	76	1	35	1988-06-17	\N	36	4	\N	2920	528	\N	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2581	76	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2582	76	5	6	2019-03-25	\N	12	4	\N	\N	\N	1357	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2583	76	5	6	2018-04-07	\N	21	4	\N	\N	\N	2159	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2584	63	1	2	2009-02-28	\N	10	4	959	824	2356	\N	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2585	63	1	35	1981-06-30	\N	196	475	\N	2629	2407	\N	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2586	63	13	6	2006-10-12	\N	76	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2587	63	13	6	2002-10-25	\N	260	4	\N	\N	\N	\N	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2588	63	5	6	2018-06-07	\N	140	4	\N	\N	\N	1387	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2589	63	5	6	2020-12-16	\N	100	4	\N	\N	\N	2160	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2590	63	5	6	2020-12-08	\N	100	4	\N	\N	\N	2161	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2591	63	5	6	2020-11-07	\N	228	4	\N	\N	\N	2162	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2592	63	5	6	2020-08-12	\N	72	4	\N	\N	\N	1297	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2593	63	5	6	2019-11-27	\N	226	4	\N	\N	\N	2163	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2594	63	5	6	2019-10-24	\N	94	4	\N	\N	\N	2164	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2595	63	5	6	2019-10-21	\N	71	4	\N	\N	\N	2165	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2596	63	5	6	2019-09-30	\N	71	4	\N	\N	\N	2166	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2597	63	5	6	2019-08-28	\N	72	4	\N	\N	\N	2167	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2598	63	5	6	2019-06-21	\N	73	4	\N	\N	\N	2168	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2599	63	5	6	2019-05-23	\N	12	4	\N	\N	\N	1299	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2600	63	5	6	2018-12-18	\N	119	4	\N	\N	\N	1265	\N	\N	\N	1	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2601	254	1	124	2020-02-21	\N	10	4	955	\N	2593	\N	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2602	254	1	124	2006-06-28	\N	10	4	\N	2837	2594	\N	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2603	254	1	35	1982-06-30	\N	23	4	\N	2921	862	\N	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2604	254	5	6	2016-06-27	\N	12	4	\N	\N	\N	1248	\N	\N	\N	0	2021-04-09 15:19:33	2021-11-02 11:06:23	0	0	0
2605	533	1	9	2021-06-01	2025-06-30	10	438	\N	\N	\N	\N	\N	\N	\N	1	2021-06-07 07:34:12	2021-11-17 13:42:20	0	0	0
2606	533	13	11	2021-06-01	2021-06-30	7	438	\N	\N	\N	\N	\N	\N	\N	1	2021-06-07 08:49:00	2021-11-17 13:42:20	0	0	0
2607	533	484	2	2021-06-01	2021-06-30	7	189	\N	\N	\N	\N	\N	\N	\N	1	2021-06-09 17:25:25	2021-11-17 13:42:20	0	0	0
2608	502	5	2	2021-06-01	2021-06-30	12	34	\N	\N	\N	\N	\N	mL1M3J2q3MIXbE7dolkqbAgOA99dej5ptHyBtKaL.pdf	\N	0	2021-06-16 09:16:23	2021-09-16 09:35:25	0	0	0
2609	502	5	2	2021-07-22	\N	7	34	803	804	523	801	802	\N	\N	0	2021-07-22 10:25:11	2021-10-14 05:59:54	0	0	0
2610	536	1	9	2005-07-04	\N	10	370	\N	\N	\N	\N	\N	NFaensG4I171uQUPupwDISksf7NxQcJntv82X5tT.jpg	\N	1	2021-07-27 07:06:07	2021-10-15 07:46:29	0	0	0
2611	536	477	6	2018-12-27	2023-12-26	491	4	\N	\N	\N	843	811	ZGPpx1nQBJaDZadMlH2DWsALQC2oSIu0QodQW5JO.jpg	1	1	2021-07-27 07:16:11	2021-11-02 11:04:31	0	0	0
2612	180	501	6	2021-03-19	2024-03-18	21	4	\N	\N	\N	843	1178	lBmvP4A6gfOboRnTcGAMt9PE2diwWzwvKSdfaU8O.jpg	2	0	2021-07-28 07:30:23	2021-11-02 11:04:31	0	0	0
2613	11	501	6	2021-07-20	2024-07-19	439	\N	\N	\N	\N	832	1179	lty4d48yn3DvXSFcsCIwPoqoPBossV32bWum1BrY.pdf	2	0	2021-07-28 07:44:09	2021-11-02 11:04:31	0	0	0
2614	11	501	6	2021-07-20	2024-07-19	502	4	\N	\N	\N	832	1179	BrFBPpeoDOS2IXt3w5c6I8pQwzkDgKtbPAM0VeLD.pdf	2	0	2021-07-28 08:01:15	2021-11-02 11:04:31	0	0	0
2615	251	501	6	2021-08-16	2024-08-15	8	\N	\N	\N	\N	843	1180	q2Ygma97xdNa0pzuIhyrTrWYkxhCQPKMyHWliqXb.jpg	0	0	2021-08-18 05:54:11	2021-11-02 11:04:31	0	0	0
2616	252	501	6	2021-06-10	2024-06-09	616	\N	\N	\N	\N	843	1181	FyA4zFT1CT50bzqNBKdsP4JKvAW17L0A9yRMKWBK.pdf	2	0	2021-08-18 09:09:20	2021-11-02 11:04:31	0	0	12
2617	331	501	6	2021-08-28	2024-08-27	199	\N	\N	\N	\N	843	1182	pIHSDYj7EXetaEvXETHTb6Wq97hqVI3H694IYcSg.jpg	2	0	2021-09-08 08:13:07	2021-11-02 11:04:31	0	0	0
2618	142	504	6	2021-07-29	2024-07-29	55	\N	\N	\N	\N	2169	1183	JIDqrBlpJQjVMAxvd3ZFfEO8b26GZ5HUHFM79sek.pdf	2	0	2021-09-08 08:26:19	2021-11-02 11:04:31	0	0	0
2619	110	501	657	2021-04-21	2024-04-20	49	\N	\N	\N	\N	2170	1184	Pt6lZmlFhwrWndWfXDTkgzcvoz3nwEPxHkCpMQr1.pdf	\N	0	2021-09-16 09:25:39	2021-11-02 11:04:31	0	0	3
2620	551	1	35	2008-12-13	\N	731	\N	\N	2922	730	\N	\N	hRRqY2q4Ktj7FkquuNZ5LnimusPjsgYyVCs7vHqU.jpg	\N	0	2021-09-24 06:25:10	2021-11-02 11:06:23	0	0	0
2621	119	501	657	2021-01-21	2024-01-20	467	\N	\N	\N	\N	2171	1185	1b3BT0p2cbyR26CGRjDU2BEHcaQGsQmq3Af42pEq.jpg	\N	0	2021-09-27 11:05:24	2021-11-02 11:04:31	0	0	160
2622	504	501	657	2021-06-17	2024-06-16	19	\N	\N	\N	\N	892	894	245MI3iNV5eHWaWTNnHIhCkrqzoKIZ6FPwGFGPhD.pdf	\N	0	2021-09-29 05:50:24	2021-10-19 07:34:23	0	0	16
2623	391	504	\N	2021-03-24	2024-03-23	750	\N	\N	\N	\N	2172	1186	6NCw0mMl0zY9h2unMRhP8Mao66WALVXdSsazO1JW.jpg	\N	0	2021-10-01 05:06:10	2021-11-02 11:04:31	0	0	2
2624	173	501	\N	2021-08-24	2024-08-23	21	\N	\N	\N	\N	2173	864	nZJkxTYBpXYz4X3eZ6977pfml7UEwUsPKiYjMXvt.pdf	\N	0	2021-10-01 05:17:04	2021-11-02 11:04:31	0	0	10
2717	451	501	\N	2021-10-15	2024-10-14	21	\N	\N	\N	\N	897	898	uzURZSyKcQtqxkF0x9zOAX8wk6dQCAcGIymqhgeS.pdf	\N	0	2021-10-19 12:26:15	2021-10-19 12:26:15	\N	\N	22
2625	298	501	\N	2021-02-04	2024-02-03	65	\N	\N	\N	\N	843	844	iV7rYE9WOWKXM8qFKEVZ4DGeg6N2wwmm2Tu5ytAK.bmp	\N	0	2021-10-06 10:45:05	2021-11-02 11:04:31	0	0	12
2626	251	501	\N	2021-06-10	2024-06-09	318	\N	\N	\N	\N	810	1187	zmojRROQW23lB5BM2suslzZPwOajuGfGp8pNFCP3.pdf	\N	0	2021-10-06 11:06:13	2021-11-02 11:04:31	0	0	4
2627	251	501	\N	2021-09-06	2024-09-05	318	\N	\N	\N	\N	810	1188	Jid0p2wkWvIdo1e11ddfEyQjtAubTasT84AHiqh2.jpg	\N	0	2021-10-06 11:21:51	2021-11-02 11:04:31	0	0	4
2628	547	780	35	2002-06-21	\N	10	\N	\N	\N	\N	\N	\N	cSaDi2i74l691tBuCGG1pRABsdzcmGmHxTLjKnJw.jpg	\N	0	2021-10-06 11:26:10	2021-10-07 06:29:01	0	0	0
2629	547	781	35	2000-06-22	\N	10	\N	\N	\N	2595	\N	\N	OCkdPX85ritn5DQvQwjkMa9x8e8rxD3LiLpO3rzU.jpg	\N	0	2021-10-06 11:29:27	2021-11-02 11:05:35	0	0	0
2630	547	505	35	1999-06-21	\N	10	\N	\N	\N	\N	\N	\N	QcP5iC7m5w3kP7rUKQm0SK8pJmKJ4pQLrA9abagt.jpg	\N	0	2021-10-06 11:33:56	2021-10-07 06:31:51	0	0	0
2631	547	501	\N	2019-08-22	2022-08-21	197	\N	\N	\N	\N	854	1189	q9SXxnUrtEf64P4C2sNTx0DEQknwHOjXB5Fbic6K.jpg	\N	0	2021-10-06 11:39:35	2021-11-02 11:04:31	0	0	8
2632	547	504	\N	2019-10-24	2022-10-23	782	\N	\N	\N	\N	2174	1190	H1kA34OgtnX7QMOAz27gKbQ1BdGK9XTLGeryLr6d.jpg	\N	0	2021-10-06 11:41:32	2021-11-02 11:04:31	0	0	4
2633	547	501	\N	2019-12-05	2022-12-04	20	\N	\N	\N	\N	879	1191	laHbduCTV5QgQhUf1sbCWPVbZT7YanJNyhfeLu1L.jpg	\N	0	2021-10-06 11:43:47	2021-11-02 11:04:31	0	0	12
2634	547	501	\N	2020-08-24	2023-08-23	197	\N	\N	\N	\N	810	1189	fRQZ1gkFgoVPNSES45lspCwDP04beoaap55PLX8l.jpg	\N	0	2021-10-06 11:46:31	2021-11-02 11:04:31	0	0	8
2635	547	783	784	2021-04-20	\N	205	\N	1118	2923	2596	\N	\N	GQzG0sobb7tggN0dME1L9f2azoYXQ6SNYP9ly0nu.jpg	\N	0	2021-10-06 11:51:54	2021-11-02 11:06:23	0	0	0
2636	547	501	\N	2021-06-29	2024-06-28	197	\N	\N	\N	\N	2175	1192	1vqMc3iYXKq7CxmIl3akYdLtObOYfhXHNg58WIvy.jpg	\N	0	2021-10-06 11:54:18	2021-11-02 11:04:31	0	0	8
2637	547	501	\N	2018-10-25	2021-10-24	158	\N	\N	\N	\N	810	1193	V0sYUcyFipS1cLx1czgEYjP4Evch6vR8eGUZlcq2.jpg	\N	0	2021-10-06 11:56:38	2021-11-02 11:04:31	0	8	0
2638	546	1	11	1997-06-20	\N	785	\N	\N	2747	758	\N	\N	x9RlUP0CZB01sQFRi4F7IQPirDkC6K9wRLwQx9QF.jpg	\N	0	2021-10-06 12:00:58	2021-11-02 11:06:23	0	0	0
2639	547	501	\N	2019-04-05	2022-04-04	20	\N	\N	\N	\N	2176	1194	NwhxFUnLgyKPXFnKPV0zHuzBzfpcGvsPClqEbCgW.jpg	\N	0	2021-10-06 12:04:58	2021-11-02 11:04:31	0	0	8
2640	548	781	35	1999-06-19	\N	75	\N	\N	\N	2597	\N	\N	85lATBJ8A51Hk0wXsqqcMG2nm6qRHQ0sCpbLx4un.jpg	\N	0	2021-10-06 12:09:04	2021-11-02 11:05:35	0	0	0
2641	548	787	784	2019-07-01	2022-06-30	335	\N	\N	\N	2598	\N	\N	ZFAN1zaPqrOvuWfGVmGINBynYAlNrenQ6gEyY3WG.jpg	\N	0	2021-10-06 12:14:11	2021-11-02 11:05:35	0	0	1560
2642	403	501	\N	2021-09-21	2024-09-20	12	\N	\N	\N	\N	850	1195	POPV7BLsm7SsBDGcZbkeP29ugdcKWU2RAPgrQHk9.jpg	\N	0	2021-10-06 12:33:38	2021-11-02 11:04:31	0	0	3
2643	43	501	\N	2021-09-21	2024-09-20	12	\N	\N	\N	\N	850	1195	0HHBXUNpManohDk5d5Ntaiwh1IEdx81Xu7IYMkzI.jpg	\N	0	2021-10-06 12:34:53	2021-11-02 11:04:31	0	0	3
2644	384	501	\N	2021-09-21	2024-09-20	12	\N	\N	\N	\N	850	1195	ewKZW9py9KK6hCGm3mHQliXubAYkxBCsGP2QfZRE.jpg	\N	0	2021-10-06 12:36:22	2021-11-02 11:04:31	0	0	3
2645	504	501	\N	2021-09-21	2024-09-20	12	\N	\N	\N	\N	850	1196	hOizIN8vkxkPxrHZFpyiHW9QAWOly8blXurFAzn6.jpg	\N	0	2021-10-06 12:37:37	2021-11-02 11:04:31	0	0	3
2646	391	501	\N	2021-09-21	2024-09-20	12	\N	\N	\N	\N	850	1195	rTMJKS1XlDxYV4d53bCKPPiHGBvQOtJZNHPGlEUU.jpg	\N	0	2021-10-06 12:39:06	2021-11-02 11:04:31	0	0	3
2647	408	501	\N	2021-09-21	2024-09-20	12	\N	\N	\N	\N	850	1195	s5FTOnwEhrR3qmYW9cXmhz36UBhaMxdpMIZSmaWI.jpg	\N	0	2021-10-06 12:40:23	2021-11-02 11:04:32	0	0	3
2648	301	501	\N	2020-11-20	2023-11-19	130	\N	\N	\N	\N	1256	1197	ImR3YNZIYnQR7qLHTTmX5QR7EMCcmOa953nSVeL8.jpg	\N	0	2021-10-08 11:11:17	2021-11-02 11:04:32	0	0	7
2649	332	501	\N	2021-06-29	2024-06-28	197	\N	\N	\N	\N	810	1198	zrWCfkcBqsApHZYwWbt3maolnY8lDSDfyUFt2x4T.pdf	\N	0	2021-10-08 11:15:59	2021-11-02 11:04:32	0	0	8
2650	251	501	\N	2021-05-24	2024-05-23	617	\N	\N	\N	\N	843	1199	Z4J3AO9nFn0SKZsZE3XIcNtHPkwRNhtK9ePmbXOm.jpg	\N	0	2021-10-08 11:21:25	2021-11-02 11:04:32	0	0	8
2651	251	501	\N	2021-06-10	2024-06-09	318	\N	\N	\N	\N	810	1200	CyJGhvbCQ0m3o1rihX9S2qn6KiKJkxRgpM2tk7RV.pdf	\N	0	2021-10-08 11:23:56	2021-11-02 11:04:32	0	0	4
2652	121	13	\N	2021-06-28	2021-06-27	238	\N	\N	\N	\N	2177	1201	uUAGHkK66rmbSNJxWgRW6y7WSZzpCLUg6ZROK6Gq.jpg	\N	0	2021-10-08 11:26:57	2021-11-02 11:04:32	0	0	4
2653	108	501	\N	2021-04-14	2024-04-13	21	\N	\N	\N	\N	863	1202	KTGtO6rCKISa2lLr9dafWvUtoQBZF1NeVMhd5QK5.pdf	\N	0	2021-10-08 11:31:30	2021-11-02 11:04:32	0	0	12
2654	127	504	\N	2020-12-19	2023-12-18	12	\N	\N	\N	\N	2178	1203	eXbFDbSMSsAm0nFUqEldq7sDkg9BdrDjzt30oPYt.jpg	\N	0	2021-10-08 11:34:52	2021-11-02 11:04:32	0	0	36
2655	385	501	\N	2021-06-02	2024-06-01	19	\N	\N	\N	\N	2080	1204	OfpL6U0TXwGpFGHatsc5YVnj7OPHsBWJ1BrRW852.pdf	\N	0	2021-10-08 11:37:50	2021-11-02 11:04:32	0	0	8
2656	362	13	\N	2021-06-10	2024-06-09	788	\N	\N	\N	\N	2179	1205	MOSj8PKSXlJhc4z9zchOAWBLlXPArZ6xOy3ly6GD.pdf	\N	0	2021-10-08 11:41:27	2021-11-02 11:04:32	0	0	2
2657	362	13	\N	2021-06-09	2024-06-08	788	\N	\N	\N	\N	2179	1206	hQxWvGv9bDwZFlOPGeFLQmCSWR2cS2g23incaBVu.pdf	\N	0	2021-10-08 11:42:57	2021-11-02 11:04:32	0	0	2
2658	362	13	\N	2021-02-26	2024-02-25	325	\N	\N	\N	\N	1263	1207	oaUzEyT3fd0zZEXeVstVfCAJ6uvTwG3R6HRSk1VT.pdf	\N	0	2021-10-08 11:44:42	2021-11-02 11:04:32	0	0	5
2659	188	501	\N	2020-11-20	2023-11-19	130	\N	\N	\N	\N	1251	1197	yqSr8HlPDtY9Lc7TfPRCB5w71b61NKfBx8161V1u.jpg	\N	0	2021-10-08 11:46:54	2021-11-02 11:04:32	0	0	7
2660	515	501	\N	2020-12-14	2023-12-13	110	\N	\N	\N	\N	846	1208	Bn9LON5lhhuyGthhfzGtS6FFEOOkVSuNSK8GL8y0.pdf	\N	0	2021-10-08 11:50:17	2021-11-02 11:04:32	0	0	36
2661	448	501	\N	2021-01-21	2024-01-20	789	\N	\N	\N	\N	846	891	0aYR2UFzeS8zgSp77Wl2co6Ebreen7IjDYnjuxtD.jpg	\N	0	2021-10-08 11:52:51	2021-10-19 07:30:46	0	0	4
2662	142	501	\N	2021-06-02	2024-06-01	19	\N	\N	\N	\N	846	1204	EPVa6hKEFqCa92oBuvluRc8Snva9nE2IAwxwJa41.pdf	\N	0	2021-10-08 11:59:06	2021-11-02 11:04:32	0	0	8
2663	173	501	\N	2021-06-15	2024-06-14	21	\N	\N	\N	\N	846	1209	r5iP5t8rdGBeeuQihWl554aZg842vfOy8pRhCAYk.pdf	\N	0	2021-10-08 12:01:27	2021-11-02 11:04:32	0	0	12
2664	371	501	\N	2021-06-29	2024-06-28	197	\N	\N	\N	\N	810	1198	lpho4h2rT6Ux6E52bpUFE4FBOA0k60S3YO9twEVM.jpg	\N	0	2021-10-11 05:32:28	2021-11-02 11:04:32	0	0	8
2665	308	504	\N	2021-06-02	2024-06-01	74	\N	\N	\N	\N	2180	1210	MnR5zgQrrt1Oi9kmb0dwaSlg74zIJZsvfxRbxl4C.pdf	\N	0	2021-10-11 05:38:17	2021-11-02 11:04:32	0	0	3
2666	308	501	\N	2021-03-16	2024-03-15	49	\N	\N	\N	\N	850	1211	QJ66dwhVIOQBAGXAVykXoNOoDBWGCWPPmoS03vEv.pdf	\N	0	2021-10-11 05:40:14	2021-11-02 11:04:32	0	0	2
2667	308	501	\N	2020-11-23	2023-11-22	790	\N	\N	\N	\N	2181	1212	jIH42UEeYC931q7pBNyQpS2z5davD60L37q6KGrP.pdf	\N	0	2021-10-11 05:43:31	2021-11-02 11:04:32	0	0	6
2668	308	13	\N	2021-04-15	2024-04-14	791	\N	\N	\N	\N	829	1213	Q60wJvVd4fGf0ouyZnKjgfSmm6t2ByQa1r5crl3M.pdf	\N	0	2021-10-11 05:49:15	2021-11-02 11:04:32	0	0	8
2669	308	501	\N	2021-03-19	2024-03-18	192	\N	\N	\N	\N	879	1214	0t4dK2o6BRYPqTjGkznLPxOMayqDfSTAojyG4Q9w.pdf	\N	0	2021-10-11 05:51:12	2021-11-02 11:04:32	0	0	8
2670	524	501	\N	2021-06-03	2024-06-02	236	\N	\N	\N	\N	850	1215	wuWP6QtUP8QdtjAvOhf7W1Zm8i3Ok8MLivn5NUB8.pdf	\N	0	2021-10-11 05:54:09	2021-11-02 11:04:32	0	0	9
2671	524	504	\N	2021-06-29	2024-06-28	100	\N	\N	\N	\N	2182	1216	ht40G1xmCpBaFnz7XtWEUErYk0c3mc7A2YFz4riE.pdf	\N	0	2021-10-11 05:56:29	2021-11-02 11:04:32	0	0	4
2672	361	501	\N	2021-06-09	2024-06-08	60	\N	\N	\N	\N	2183	1217	FbM4Xd44XKmcl7KlqhMrrCfmlHJ7aggmuDn5oDtX.jpg	\N	0	2021-10-11 05:59:27	2021-11-02 11:04:32	0	0	8
2673	524	501	\N	2021-06-09	2024-06-08	60	\N	\N	\N	\N	2183	1217	OMkokVUoEZ7lLgpPf4Fbe8UsJwpila6hfufKW0oh.jpg	\N	0	2021-10-11 06:01:03	2021-11-02 11:04:32	0	0	8
2674	206	501	\N	2021-06-09	2024-06-08	60	\N	\N	\N	\N	2183	1217	u1byXeyU8yBpgy4wfpJwvur08bKE0ECuySMgvwzE.jpg	\N	0	2021-10-11 06:02:20	2021-11-02 11:04:32	0	0	8
2675	62	501	\N	2021-06-09	2024-06-08	60	\N	\N	\N	\N	2183	1217	U7kujYndZr85Js4G9bJDceZM7K6SDHzbDXYdJ7QO.jpg	\N	0	2021-10-11 06:03:34	2021-11-02 11:04:32	0	0	8
2676	118	501	\N	2021-06-09	2024-06-08	60	\N	\N	\N	\N	2183	1217	wHOwqOrzxllqmyCylvaCcZoemlDnVnMwm8OxKflX.jpg	\N	0	2021-10-11 06:04:54	2021-11-02 11:04:32	0	0	8
2677	453	501	\N	2021-06-09	2024-06-08	60	\N	\N	\N	\N	2183	1217	VDLOGjncDvoeRTu8fzyD6CEFoHO1ukLinHW4QhFa.jpg	\N	0	2021-10-11 06:06:24	2021-11-02 11:04:32	0	0	8
2678	87	501	\N	2021-06-09	2024-06-08	60	\N	\N	\N	\N	2183	1217	HtpdJ4huxUSiMwXBMb6h9f8AfRTqQAmGJq0SRECa.jpg	\N	0	2021-10-11 06:08:07	2021-11-02 11:04:32	0	0	8
2679	300	501	\N	2021-06-09	2024-06-08	60	\N	\N	\N	\N	2183	1217	0eq7CQ7ReMPIgRGnmcBCeWO0Ps2XTtqP4ngUC6t0.jpg	\N	0	2021-10-11 06:09:28	2021-11-02 11:04:32	0	0	8
2680	377	780	792	2021-03-01	\N	26	\N	\N	2924	757	\N	\N	8hKwR2ZIFZCmcFYLjGzLP1FFCgbeVM6nEpxgnYjK.pdf	\N	0	2021-10-11 06:27:26	2021-11-02 11:06:23	0	0	0
2681	127	501	\N	2021-09-28	2024-09-27	21	\N	\N	\N	\N	863	913	tBWaGUeMVmXc95MmIqPDyBcoEQlRZna3DEsyT7wK.pdf	\N	0	2021-10-11 08:19:11	2021-11-02 11:04:32	0	0	10
2682	431	501	\N	2003-06-10	2006-06-09	15	\N	1119	\N	\N	2184	1218	IiGL1d56DmeQRgm13NzDTikVpObVrZQMfxbzAmhK.jpg	\N	0	2021-10-11 08:27:50	2021-11-02 11:04:32	0	0	720
2683	126	501	\N	2021-05-12	2024-05-11	21	\N	\N	\N	\N	863	1219	Vy5tBrdxTL95tNZHeSqPYXENFwi32vZ2M4Hb0mOt.jpg	\N	0	2021-10-11 10:12:45	2021-11-02 11:04:32	0	0	12
2684	126	501	\N	2021-09-30	2024-09-29	21	\N	\N	\N	\N	863	1220	tcvVKnJxQxb6aDNNwJF8lxCv7VGNJHzXptYc3D8N.jpg	\N	0	2021-10-11 10:18:39	2021-11-02 11:04:32	0	0	14
2685	126	794	\N	2004-06-18	2004-06-18	26	\N	921	\N	\N	1239	1137	XUn5LEL73KeXvDoFa382F6gi1tT6xMhPw3Rx5p4l.jpg	\N	0	2021-10-11 10:59:26	2021-11-02 11:04:32	0	0	720
2686	561	1	11	1987-07-10	\N	799	\N	\N	\N	798	\N	\N	KWPAXIVDuzWtbPa2wRs4fFJ3ITfuyLMUdaGhIH9Y.jpg	\N	0	2021-10-12 07:09:04	2021-11-02 11:05:35	0	0	0
2687	110	501	\N	2021-04-22	2024-04-21	12	\N	\N	\N	\N	846	869	OCHeFkbHhpZ8SxrSNreXXNEXA6Cd6ovIQ9ofvXw4.jpg	\N	0	2021-10-12 08:24:49	2021-11-02 11:04:32	0	0	6
2688	110	501	\N	2021-03-23	2024-03-22	12	\N	\N	\N	\N	810	1221	ho0YbS9OZ1YEKOaddAwxaLdqID8akacydh9IURjq.jpg	\N	0	2021-10-12 08:26:42	2021-11-02 11:04:32	0	0	3
2689	110	501	\N	2021-03-17	2024-03-16	49	\N	\N	\N	\N	850	1222	sv3SZCMs2Z7lCSHwRzohN6A4vAllBQCDDcHxJ9u1.pdf	\N	0	2021-10-12 08:30:46	2021-11-02 11:04:32	0	0	2
2690	562	39	40	2017-07-03	\N	78	\N	\N	\N	\N	\N	\N	zkAYW1QF9zQm6QK8sVtMtFdzm6fyZSQ3bijWMQOd.pdf	\N	0	2021-10-12 09:17:23	2021-10-12 09:17:23	0	0	0
2691	562	504	\N	2021-01-21	2024-01-20	402	\N	\N	\N	\N	2174	1223	2LiHuK6mkZxesCdy9vFRx1hrILrU5qwdXAaPmDi4.pdf	\N	0	2021-10-12 09:30:01	2021-11-02 11:04:32	0	0	5
2692	300	504	\N	2021-06-15	2024-06-14	100	\N	\N	\N	\N	1262	1224	BhjCVWQcK344aBgByGP9fYvkVpUZoNIjy58t5BaC.png	\N	0	2021-10-12 10:09:17	2021-11-02 11:04:32	0	0	1
2693	300	501	\N	2021-05-05	2024-05-04	21	\N	\N	\N	\N	1240	1225	v9nQblQARMmSyNvgWeZnS2A6IOKTcdubBXNjzhqH.jpg	\N	0	2021-10-12 10:12:16	2021-11-02 11:04:32	0	0	24
2694	300	501	\N	2021-04-16	2024-04-15	21	\N	\N	\N	\N	863	1140	jrE7FAMi86CVr7sLJom9FBIJNnkLN50H1XBvYPUJ.jpg	\N	0	2021-10-12 10:17:57	2021-11-02 11:04:32	0	0	14
2695	223	501	\N	2021-04-22	2024-04-21	12	\N	\N	\N	\N	846	869	1Fzg3m1w8xr8WmDuRkd6RrgYdkHNVXDnh5VMoMfn.jpg	\N	0	2021-10-13 12:31:51	2021-11-02 11:04:32	0	0	6
2696	502	1	11	1111-11-11	\N	3	34	803	804	528	801	802	\N	\N	0	2021-10-14 06:00:26	2021-10-14 06:00:43	\N	\N	\N
2697	116	501	\N	2021-08-26	2024-08-25	21	\N	\N	\N	\N	\N	812	aULKxhxBYJ6TYo8YD2wqRTmfmelzfnbuXnfmO27g.pdf	\N	0	2021-10-14 07:14:24	2021-10-14 07:14:24	\N	\N	\N
2698	558	501	\N	2021-07-06	\N	169	\N	\N	\N	\N	814	815	Ud1ZDZz8WkJyfwwYBl2UVm0sVzeci0gNrlHUeEO7.jpg	\N	0	2021-10-14 10:24:14	2021-10-14 10:24:14	\N	\N	\N
2699	558	1	14	2005-07-22	\N	816	\N	\N	817	818	\N	\N	peWSnULRAkyPXUfhqmOjD9uJHfBsoslItFyLI954.jpg	\N	0	2021-10-14 10:26:04	2021-10-14 10:26:04	\N	\N	\N
2700	559	1	11	1994-03-01	\N	466	\N	\N	819	820	\N	\N	UCkf4ORsDIg3IDPxHQTZpxofccl6OM83wYOUbtK0.jpg	\N	0	2021-10-14 10:39:02	2021-10-14 10:39:02	\N	\N	\N
2701	559	781	35	2004-06-30	\N	10	\N	\N	821	822	\N	\N	YgYigaBfAtEDkeNReTZs6Ew8cmQ9aGsyEnldRuyL.jpg	\N	0	2021-10-14 10:52:08	2021-10-14 10:52:08	\N	\N	\N
2702	559	823	35	2011-12-30	\N	10	\N	\N	824	\N	\N	\N	PzMcFrzwgVuPE7DkQJ5IH3EbEcYDIAWsaLzPGP59.jpg	\N	0	2021-10-14 10:58:47	2021-10-14 10:58:47	\N	\N	\N
2703	559	783	\N	2019-04-18	\N	169	\N	\N	\N	\N	814	825	tNSrGt446lVqQTuVliTc3P1zgVZHqV3oyg2Ygf4N.jpg	\N	0	2021-10-14 11:06:15	2021-10-14 11:17:26	\N	\N	160
2704	559	501	\N	2015-10-15	\N	826	\N	\N	\N	\N	808	827	8DdPfg8d95eII8BDNTfsqdbr1W2WgVdtzV9SX7qu.jpg	\N	0	2021-10-14 11:11:31	2021-10-14 11:16:54	\N	\N	100
2705	559	501	\N	2010-04-08	\N	828	\N	\N	\N	\N	829	830	bts2pEu7KnkRXYoupX0sDKiDjtrU4QKb2DhErmDW.jpg	\N	0	2021-10-14 11:16:01	2021-10-14 11:16:01	\N	\N	\N
2706	559	501	\N	2017-11-23	\N	831	\N	\N	\N	\N	832	833	JLXBSQ44dobS5PYgVocxe5Vo9pU30e8ySEeaqWQ0.jpg	\N	0	2021-10-14 11:23:33	2021-10-14 11:23:33	\N	\N	\N
2707	559	501	\N	2010-06-16	\N	834	\N	\N	\N	\N	835	836	Kyae4XPQtcE1bZu4NoYcFjZEQWbEN4Sclj0pUZMW.jpg	\N	0	2021-10-14 11:29:06	2021-10-14 11:29:06	\N	\N	150
2708	560	13	\N	2021-07-08	\N	15	\N	\N	\N	\N	808	837	UP3PbrmdZZBK2FynBdqK8Uu8yNdB0MwfeCdKVZ75.jpg	\N	0	2021-10-14 11:39:08	2021-10-14 11:39:08	\N	\N	72
2709	251	501	\N	2021-09-28	2024-09-27	21	\N	\N	\N	\N	863	864	WOo27RhlMSv2e3pNXlYPFVNPx9tplkLjQB4wPPgn.pdf	\N	0	2021-10-18 05:58:02	2021-10-18 05:58:03	\N	\N	10
2710	94	501	\N	2021-10-01	2024-09-30	61	\N	\N	\N	\N	841	866	GwaX9qnnMNPUtb01IUxT9hMWSvXRICZa6zLQF44b.jpg	\N	0	2021-10-18 06:25:29	2021-10-18 06:25:29	\N	\N	24
2711	45	501	\N	2021-10-11	2024-10-10	21	\N	\N	\N	\N	867	868	PCUb0FwX0xYlgde8iCfucuhjuRXQ51v8NeaI9pgc.pdf	\N	0	2021-10-18 08:58:55	2021-10-18 08:58:55	\N	\N	8
2712	504	501	\N	2021-04-22	2024-04-21	12	\N	\N	\N	\N	846	869	doUegS4M230zH5Lj2lXme0McsE2cCcED3NOeoyKp.jpg	\N	0	2021-10-18 09:13:13	2021-10-18 09:13:13	\N	\N	6
2713	504	13	\N	2020-12-07	2023-12-06	10	\N	\N	\N	\N	808	809	WvvCmG2Ju0wXoRI2qCkBBanAF6NzkPcVGf0vsysh.pdf	\N	0	2021-10-18 09:15:41	2021-10-18 09:15:41	\N	\N	72
2714	326	501	\N	2021-10-11	2024-10-10	21	\N	\N	\N	\N	867	868	7t91dGkfxZK1HonWmjyTjSgdN7kCFinReijofmHC.pdf	\N	0	2021-10-18 11:57:46	2021-10-18 11:57:46	\N	\N	8
2715	508	501	\N	2021-10-11	2024-10-10	21	\N	\N	\N	\N	867	868	V6IXfAsDFiohncX1EIyyLLqfVapJIs3cMQvALiWg.pdf	\N	0	2021-10-18 12:02:26	2021-10-18 12:02:26	\N	\N	8
2716	408	13	\N	2021-10-07	2024-10-06	166	\N	\N	\N	\N	895	896	h7kFQgswZ6flCirkBRLAq6dTR81fbujGeg8BB329.pdf	\N	0	2021-10-19 11:27:44	2021-10-19 11:27:44	\N	\N	8
2718	330	13	\N	2021-10-08	2024-10-07	788	\N	\N	\N	\N	829	899	XUSFVFPj76iKh9NniUEnccc2sBM6vVOOdtZ3ks3C.pdf	\N	0	2021-10-25 08:24:12	2021-10-25 08:24:13	\N	\N	3
2719	330	13	\N	2021-10-04	2024-10-03	788	\N	\N	\N	\N	829	900	YlEOlayNxXUbq9H2SlQL7fVF494J3dS0zrPJZmL1.pdf	\N	0	2021-10-25 08:27:58	2021-10-25 08:27:58	\N	\N	3
2720	330	13	\N	2021-09-27	2024-09-26	788	\N	\N	\N	\N	829	901	HrLdDkAiXBDwYmLzNuXqlp9vaUJXxOoMY2yGxbgr.pdf	\N	0	2021-10-25 08:31:23	2021-10-25 08:31:23	\N	\N	3
2721	330	13	\N	2021-09-29	2024-09-28	788	\N	\N	\N	\N	829	902	AoLDG8cYV1RhtBnOoujMakKRtomS6kS2NBkglnDQ.pdf	\N	0	2021-10-25 08:34:43	2021-10-25 08:34:43	\N	\N	3
2722	46	501	\N	2021-10-21	2024-10-20	371	\N	\N	\N	\N	832	903	1Q4NGuq9Cyo0wMjI3jURjJ1G2tF5enSChBXWHhAT.pdf	\N	0	2021-10-27 05:56:39	2021-10-27 05:56:39	\N	\N	3
2723	338	501	\N	2021-10-15	2024-10-14	21	\N	\N	\N	\N	904	898	P1IW6oeLzUO3MDJWiCT8DIljwwq1HP55uZPYio83.pdf	\N	0	2021-10-27 09:34:22	2021-10-27 09:34:22	\N	\N	22
2724	489	501	\N	2021-10-19	2024-10-18	21	\N	\N	\N	\N	863	864	9KtA8A2lFuy0apF1leYaHX9aFRdV4puYUXl1TPU7.pdf	\N	0	2021-10-27 11:41:00	2021-10-27 11:41:00	\N	\N	10
2725	8	501	\N	2021-10-19	2024-10-18	21	\N	\N	\N	\N	863	864	n7a122W41WDF2qpKkA7Cc2JoZcaLkXkYUbKLT9jK.pdf	\N	0	2021-10-27 11:42:24	2021-10-27 11:42:24	\N	\N	10
2726	5	501	\N	2021-10-20	2024-10-19	130	\N	\N	\N	\N	\N	905	3IVL2iXz4JZA8IFBbq2jJJMX84N1HKQZdK25ZyeN.pdf	\N	0	2021-10-27 12:48:17	2021-10-27 12:48:17	\N	\N	8
2727	88	501	\N	2021-10-20	2024-10-19	21	\N	\N	\N	\N	863	906	QupARh3omBaTdEwmcOMYk5gl2Xkxc227xrD4942R.pdf	\N	0	2021-10-27 13:09:33	2021-10-27 13:09:33	\N	\N	12
2728	564	909	35	2013-06-28	\N	10	\N	\N	910	493	\N	\N	QM1Zn7kbkv5HujT9NMh08FrTTEFcc6PogbqKPQ1H.jpg	\N	0	2021-10-28 11:25:58	2021-10-28 11:25:58	\N	\N	\N
2729	564	911	35	2016-06-22	\N	139	\N	\N	912	908	\N	\N	mJlMhPnezp3dC8TJVJccuhbDmzCBZCYm0Xxn8mfA.jpg	\N	0	2021-10-28 11:28:47	2021-10-28 11:28:48	\N	\N	\N
2730	564	13	\N	2021-04-26	2024-04-25	46	\N	\N	\N	\N	808	809	HN5SAfotKaapYm6WuB4a9mhK1jneM7NzvxcWLd7e.jpg	\N	0	2021-10-28 11:30:23	2021-10-28 11:30:23	\N	\N	80
2731	243	501	\N	2021-10-19	2024-10-18	21	\N	\N	\N	\N	863	913	LV5ZPqe9Dqc7DxPFLe7R0yauYSY6mJnj0AKKiEPw.pdf	\N	0	2021-10-28 11:50:27	2021-10-28 11:50:27	\N	\N	10
2732	45	501	\N	2021-10-13	2024-10-12	12	\N	\N	\N	\N	843	914	ufEuwJOEZXgWwJmIOtkn6un0RlrxbbiISFDXpV0F.jpg	\N	0	2021-10-28 11:52:22	2021-10-28 11:52:22	\N	\N	12
2733	162	501	\N	2021-10-13	2024-10-12	12	\N	\N	\N	\N	843	914	tuBvM8trNsDF9zDYMy1Adan5qiZ7dLAi1o5wjd7B.jpg	\N	0	2021-10-28 11:53:44	2021-10-28 11:53:44	\N	\N	12
2734	215	501	\N	2021-10-13	2024-10-12	12	\N	\N	\N	\N	843	914	RRelNXMN5umd5ihw7ekxLZSOtYVGkrlPbeen0GUf.jpg	\N	0	2021-10-28 11:54:42	2021-10-28 11:54:42	\N	\N	12
2735	332	501	\N	2021-10-13	2024-10-12	12	\N	\N	\N	\N	879	914	QkyOAx4AVBGLTVROa5N3fXLFZ3zoP9OWDF4AeXiq.jpg	\N	0	2021-10-28 11:55:56	2021-10-28 11:55:57	\N	\N	12
2736	310	501	\N	2021-10-13	\N	12	\N	\N	\N	\N	810	914	86yfMudORrq5ohE0KqOyXKexSBpHYiZtEMqbGjXz.jpg	\N	0	2021-10-28 11:58:00	2021-10-28 11:58:00	\N	\N	12
2737	199	501	\N	2021-10-13	2024-10-12	12	\N	\N	\N	\N	810	914	Kw82aGa14gdrJtjGsRhIHwZkLigZMHMjKFrmDH4D.jpg	\N	0	2021-10-28 11:59:07	2021-10-28 11:59:07	\N	\N	12
2738	524	501	\N	2021-10-13	2024-10-12	12	\N	\N	\N	\N	810	914	vlroNnZK4hhc2if06K1M5zWPod0s1VKxip8MGp3P.jpg	\N	0	2021-10-28 12:00:21	2021-10-28 12:00:21	\N	\N	12
2739	77	13	\N	2021-10-09	2024-10-08	46	\N	\N	\N	\N	808	809	JbOW5Hwu6CBMwo5uYsvxasJn38VD3d7TJ5w5JsT3.tif	\N	0	2021-10-29 10:44:21	2021-10-29 10:44:21	\N	\N	72
2740	502	5	871	1212-12-12	\N	15	34	890	2601	528	805	844	\N	\N	0	2021-12-02 10:16:35	2021-12-02 10:17:36	\N	\N	\N
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, date_from, date_to, time_from, time_to, place_id, count, user_id, contact_information, notes, it, economic_issues, relations_specialist, status_it, status_as, status_sa, status_md, comment_it, comment_as, comment_sa, comment_md, created_at, updated_at) FROM stdin;
1	Pas??kums #1	2021-12-12	2021-12-12	00:00:00	00:00:00	2925	5	502	26982430	\N	{"projector":0,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":0}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	1	1	1	0	\N	Neb??s	Neb??s	Nea.	2021-12-08 10:23:46	2021-12-08 11:28:55
2	asd	0123-03-12	0123-03-12	00:00:00	00:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":0}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	0	0	0	0	\N	\N	\N	\N	2021-12-08 12:46:34	2021-12-08 12:46:34
3	asd	0123-03-12	0123-03-12	00:00:00	00:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":0}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	0	1	1	0	\N	\N	\N	\N	2021-12-08 12:47:06	2021-12-08 12:47:06
4	Pas??kums #2	2112-12-12	2121-12-12	23:59:00	22:58:00	2928	123	502	123	\N	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":0}	{"coffee_break":null,"parking_pass":null,"guard":1,"room_cleaning":0}	0	1	0	1	0	\N	\N	\N	\N	2021-12-08 12:48:08	2021-12-08 14:18:25
5	Test	1212-12-12	1212-12-12	00:00:00	00:00:00	2925	123	502	123	\N	{"projector":0,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":0}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	1	1	1	0	\N	\N	\N	\N	2021-12-08 14:06:10	2021-12-08 14:06:13
6	WEB izstr??de	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":0,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":0}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	1	0	0	0	\N	\N	\N	\N	2021-12-08 14:17:36	2021-12-08 14:19:10
7	WEB izstr??de	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":0}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	1	0	0	0	\N	\N	\N	\N	2021-12-08 14:18:36	2021-12-08 14:18:52
8	WEB izstr??de	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	0	0	0	0	\N	\N	\N	\N	2021-12-08 14:20:33	2021-12-08 14:20:33
9	WEB izstr??de	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	0	0	0	0	\N	\N	\N	\N	2021-12-08 14:24:55	2021-12-08 14:24:55
10	WEB izstr??de	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	0	0	0	0	\N	\N	\N	\N	2021-12-08 14:25:24	2021-12-08 14:25:24
11	WEB izstr??de	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	0	0	0	0	\N	\N	\N	\N	2021-12-08 14:25:29	2021-12-08 14:25:29
12	WEB izstr??de	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	0	0	0	0	\N	\N	\N	\N	2021-12-08 14:26:06	2021-12-08 14:26:06
13	WEB izstr??de	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	1	0	0	0	\N	\N	\N	\N	2021-12-08 14:26:50	2021-12-08 14:51:25
14	WEB izstr??de	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	1	0	0	0	\N	\N	\N	\N	2021-12-08 14:27:15	2021-12-08 14:50:27
15	WEB izstr??de	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	1	1	1	1	\N	\N	\N	\N	2021-12-08 14:27:39	2021-12-08 14:40:42
16	WEB izstr??de #5	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	1	1	1	0	\N	\N	\N	\N	2021-12-08 14:28:30	2021-12-08 14:39:51
17	WEB izstr??de #6	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	1	1	1	0	\N	\N	\N	\N	2021-12-08 14:29:45	2021-12-08 14:37:52
18	WEB izstr??de #7	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	0	0	0	0	\N	\N	\N	\N	2021-12-08 14:54:25	2021-12-08 14:54:25
19	WEB izstr??de #7	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	0	0	0	0	\N	\N	\N	\N	2021-12-08 14:54:49	2021-12-08 14:54:49
20	WEB izstr??de #7	2021-02-12	2021-02-12	08:00:00	15:00:00	2925	123	502	123	123	{"projector":1,"computer":0,"microphone":0,"sound":0,"tv":0,"live_equipment":0,"person_pass":0,"prezenter":0,"it_presence":1}	{"coffee_break":null,"parking_pass":null,"guard":0,"room_cleaning":0}	0	0	1	1	0	\N	\N	\N	\N	2021-12-08 14:55:42	2021-12-08 14:55:42
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
1	3dbff875-50e5-4029-9d23-db0a9e01d614	database	default	{"uuid":"3dbff875-50e5-4029-9d23-db0a9e01d614","displayName":"App\\\\Jobs\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"App\\\\Jobs\\\\SendEmail","command":"O:18:\\"App\\\\Jobs\\\\SendEmail\\":11:{s:30:\\"\\u0000App\\\\Jobs\\\\SendEmail\\u0000regulation\\";s:46:\\"PIKC \\"R\\u012bgas Valsts tehnikums\\" \\u0113tikas kodekss\\";s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}	Swift_TransportException: Expected response code 354 but got code "550", with message "550 5.7.0 Requested action not taken: too many emails per second\r\n" in /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php:459\nStack trace:\n#0 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(344): Swift_Transport_AbstractSmtpTransport->assertResponseCode()\n#1 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/EsmtpTransport.php(305): Swift_Transport_AbstractSmtpTransport->executeCommand()\n#2 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(392): Swift_Transport_EsmtpTransport->executeCommand()\n#3 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(499): Swift_Transport_AbstractSmtpTransport->doDataCommand()\n#4 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(518): Swift_Transport_AbstractSmtpTransport->doMailTransaction()\n#5 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(206): Swift_Transport_AbstractSmtpTransport->sendTo()\n#6 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(71): Swift_Transport_AbstractSmtpTransport->send()\n#7 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Swift_Mailer->send()\n#8 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage()\n#9 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(186): Illuminate\\Mail\\Mailer->send()\n#10 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#11 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(187): Illuminate\\Mail\\Mailable->withLocale()\n#12 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(304): Illuminate\\Mail\\Mailable->send()\n#13 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable()\n#14 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/PendingMail.php(121): Illuminate\\Mail\\Mailer->send()\n#15 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/app/Jobs/SendEmail.php(38): Illuminate\\Mail\\PendingMail->send()\n#16 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendEmail->handle()\n#17 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#19 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#20 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/Container.php(611): Illuminate\\Container\\BoundMethod::call()\n#21 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#22 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#23 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#25 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(118): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#26 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#27 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#28 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then()\n#29 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#30 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#31 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(410): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(360): Illuminate\\Queue\\Worker->process()\n#33 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(158): Illuminate\\Queue\\Worker->runJob()\n#34 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#35 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#36 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#39 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#40 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/Container.php(611): Illuminate\\Container\\BoundMethod::call()\n#41 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#42 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/symfony/console/Command/Command.php(256): Illuminate\\Console\\Command->execute()\n#43 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#44 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/symfony/console/Application.php(971): Illuminate\\Console\\Command->run()\n#45 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/symfony/console/Application.php(290): Symfony\\Component\\Console\\Application->doRunCommand()\n#46 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/symfony/console/Application.php(166): Symfony\\Component\\Console\\Application->doRun()\n#47 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Console/Application.php(92): Symfony\\Component\\Console\\Application->run()\n#48 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#49 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#50 {main}	2021-06-06 20:48:38
2	29e97007-1fc7-4c39-8dfc-aaeab15a738d	database	default	{"uuid":"29e97007-1fc7-4c39-8dfc-aaeab15a738d","displayName":"App\\\\Jobs\\\\SendEmail","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"backoff":null,"timeout":null,"retryUntil":null,"data":{"commandName":"App\\\\Jobs\\\\SendEmail","command":"O:18:\\"App\\\\Jobs\\\\SendEmail\\":11:{s:30:\\"\\u0000App\\\\Jobs\\\\SendEmail\\u0000regulation\\";s:17:\\"Testa instrukcija\\";s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:19:\\"chainCatchCallbacks\\";N;s:5:\\"delay\\";N;s:11:\\"afterCommit\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}	Swift_TransportException: Failed to authenticate on SMTP server with username "122b936f4a4a33" using 3 possible authenticators. Authenticator CRAM-MD5 returned Expected response code 235 but got code "535", with message "535 5.7.0 Monthly messages limit reached\r\n". Authenticator LOGIN returned Expected response code 250 but got an empty response. Authenticator PLAIN returned Expected response code 250 but got an empty response. in /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/Esmtp/AuthHandler.php:191\nStack trace:\n#0 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/EsmtpTransport.php(371): Swift_Transport_Esmtp_AuthHandler->afterEhlo()\n#1 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Transport/AbstractSmtpTransport.php(148): Swift_Transport_EsmtpTransport->doHeloCommand()\n#2 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/swiftmailer/swiftmailer/lib/classes/Swift/Mailer.php(65): Swift_Transport_AbstractSmtpTransport->start()\n#3 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(521): Swift_Mailer->send()\n#4 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(288): Illuminate\\Mail\\Mailer->sendSwiftMessage()\n#5 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(186): Illuminate\\Mail\\Mailer->send()\n#6 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Support/Traits/Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#7 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailable.php(187): Illuminate\\Mail\\Mailable->withLocale()\n#8 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(304): Illuminate\\Mail\\Mailable->send()\n#9 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/Mailer.php(258): Illuminate\\Mail\\Mailer->sendMailable()\n#10 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Mail/PendingMail.php(121): Illuminate\\Mail\\Mailer->send()\n#11 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/app/Jobs/SendEmail.php(38): Illuminate\\Mail\\PendingMail->send()\n#12 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): App\\Jobs\\SendEmail->handle()\n#13 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#14 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#15 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#16 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/Container.php(611): Illuminate\\Container\\BoundMethod::call()\n#17 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(128): Illuminate\\Container\\Container->call()\n#18 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#19 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#20 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Bus/Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then()\n#21 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(118): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#22 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#23 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Pipeline/Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#24 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then()\n#25 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#26 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Jobs/Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#27 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(410): Illuminate\\Queue\\Jobs\\Job->fire()\n#28 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(360): Illuminate\\Queue\\Worker->process()\n#29 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Worker.php(158): Illuminate\\Queue\\Worker->runJob()\n#30 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon()\n#31 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Queue/Console/WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#32 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#33 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#34 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure()\n#35 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#36 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Container/Container.php(611): Illuminate\\Container\\BoundMethod::call()\n#37 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Console/Command.php(136): Illuminate\\Container\\Container->call()\n#38 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/symfony/console/Command/Command.php(256): Illuminate\\Console\\Command->execute()\n#39 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Console/Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#40 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/symfony/console/Application.php(971): Illuminate\\Console\\Command->run()\n#41 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/symfony/console/Application.php(290): Symfony\\Component\\Console\\Application->doRunCommand()\n#42 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/symfony/console/Application.php(166): Symfony\\Component\\Console\\Application->doRun()\n#43 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Console/Application.php(92): Symfony\\Component\\Console\\Application->run()\n#44 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/vendor/laravel/framework/src/Illuminate/Foundation/Console/Kernel.php(129): Illuminate\\Console\\Application->run()\n#45 /var/www/vhosts/is.rvt.lv/httpdocs/laravel/artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle()\n#46 {main}	2021-06-09 17:44:07
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
2	2014_10_12_100000_create_password_resets_table	1
3	2016_06_01_000001_create_oauth_auth_codes_table	1
4	2016_06_01_000002_create_oauth_access_tokens_table	1
5	2016_06_01_000003_create_oauth_refresh_tokens_table	1
6	2016_06_01_000004_create_oauth_clients_table	1
7	2016_06_01_000005_create_oauth_personal_access_clients_table	1
8	2019_08_19_000000_create_failed_jobs_table	1
12	2014_10_12_000000_create_users_table	2
13	2021_04_02_162435_create_options_table	2
14	2021_04_02_220059_create_documents_table	2
15	2021_04_09_182101_create_permission_tables	3
16	2021_05_27_112215_create_positions_table	4
17	2021_05_27_112607_create_user_positions_table	4
18	2021_05_27_115445_add_extra_columns_to_users	4
19	2021_06_06_135626_create_regulation_table	5
20	2021_06_06_171514_create_jobs_table	5
21	2021_07_03_104313_add_extra_columns_to_permissions	6
22	2021_07_27_091017_add_birthdate_columns_to_users	7
23	2021_09_15_123429_add_extra_columns_to_documents	8
24	2021_09_16_084710_modify_documents_column	9
25	2021_11_25_163211_fix_role_typo	10
26	2021_12_02_094418_update_status_in_users_table	11
27	2021_12_06_165830_change_users_table_encoding	12
31	2021_12_07_201336_create_events_table	13
32	2021_12_07_230145_add_events_permissions	13
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.model_has_roles (role_id, model_type, model_id) FROM stdin;
1	App\\Models\\User	5
1	App\\Models\\User	7
1	App\\Models\\User	8
1	App\\Models\\User	9
1	App\\Models\\User	11
1	App\\Models\\User	15
1	App\\Models\\User	20
1	App\\Models\\User	21
1	App\\Models\\User	22
1	App\\Models\\User	23
1	App\\Models\\User	24
1	App\\Models\\User	25
1	App\\Models\\User	26
1	App\\Models\\User	27
1	App\\Models\\User	28
1	App\\Models\\User	29
1	App\\Models\\User	30
1	App\\Models\\User	31
1	App\\Models\\User	32
1	App\\Models\\User	33
1	App\\Models\\User	34
1	App\\Models\\User	35
1	App\\Models\\User	36
1	App\\Models\\User	37
1	App\\Models\\User	38
1	App\\Models\\User	39
1	App\\Models\\User	40
1	App\\Models\\User	41
1	App\\Models\\User	42
1	App\\Models\\User	43
1	App\\Models\\User	44
1	App\\Models\\User	45
1	App\\Models\\User	46
1	App\\Models\\User	47
1	App\\Models\\User	48
1	App\\Models\\User	49
1	App\\Models\\User	50
1	App\\Models\\User	51
1	App\\Models\\User	52
1	App\\Models\\User	53
1	App\\Models\\User	54
1	App\\Models\\User	55
1	App\\Models\\User	56
1	App\\Models\\User	57
1	App\\Models\\User	58
1	App\\Models\\User	59
1	App\\Models\\User	60
1	App\\Models\\User	61
1	App\\Models\\User	62
1	App\\Models\\User	63
1	App\\Models\\User	64
1	App\\Models\\User	65
1	App\\Models\\User	66
1	App\\Models\\User	67
1	App\\Models\\User	68
1	App\\Models\\User	69
1	App\\Models\\User	70
1	App\\Models\\User	71
1	App\\Models\\User	73
1	App\\Models\\User	74
1	App\\Models\\User	75
1	App\\Models\\User	76
1	App\\Models\\User	77
1	App\\Models\\User	78
1	App\\Models\\User	79
1	App\\Models\\User	80
1	App\\Models\\User	81
1	App\\Models\\User	82
1	App\\Models\\User	83
1	App\\Models\\User	84
1	App\\Models\\User	85
1	App\\Models\\User	86
1	App\\Models\\User	87
1	App\\Models\\User	88
1	App\\Models\\User	89
1	App\\Models\\User	90
1	App\\Models\\User	91
1	App\\Models\\User	92
1	App\\Models\\User	93
1	App\\Models\\User	94
1	App\\Models\\User	95
1	App\\Models\\User	96
1	App\\Models\\User	97
1	App\\Models\\User	99
1	App\\Models\\User	100
1	App\\Models\\User	101
1	App\\Models\\User	102
1	App\\Models\\User	104
1	App\\Models\\User	105
1	App\\Models\\User	106
1	App\\Models\\User	107
1	App\\Models\\User	108
1	App\\Models\\User	109
1	App\\Models\\User	110
1	App\\Models\\User	111
1	App\\Models\\User	112
1	App\\Models\\User	113
1	App\\Models\\User	114
1	App\\Models\\User	115
1	App\\Models\\User	116
1	App\\Models\\User	117
1	App\\Models\\User	118
1	App\\Models\\User	119
1	App\\Models\\User	120
1	App\\Models\\User	121
1	App\\Models\\User	122
1	App\\Models\\User	123
1	App\\Models\\User	124
1	App\\Models\\User	125
1	App\\Models\\User	126
1	App\\Models\\User	127
1	App\\Models\\User	128
1	App\\Models\\User	129
1	App\\Models\\User	130
1	App\\Models\\User	131
1	App\\Models\\User	132
1	App\\Models\\User	133
1	App\\Models\\User	134
1	App\\Models\\User	135
1	App\\Models\\User	136
1	App\\Models\\User	137
1	App\\Models\\User	138
1	App\\Models\\User	139
1	App\\Models\\User	140
1	App\\Models\\User	141
1	App\\Models\\User	142
1	App\\Models\\User	143
1	App\\Models\\User	144
1	App\\Models\\User	145
1	App\\Models\\User	147
1	App\\Models\\User	148
1	App\\Models\\User	149
1	App\\Models\\User	150
1	App\\Models\\User	151
1	App\\Models\\User	152
1	App\\Models\\User	153
1	App\\Models\\User	154
1	App\\Models\\User	155
1	App\\Models\\User	156
1	App\\Models\\User	157
1	App\\Models\\User	158
1	App\\Models\\User	159
1	App\\Models\\User	160
1	App\\Models\\User	161
1	App\\Models\\User	162
1	App\\Models\\User	163
1	App\\Models\\User	164
1	App\\Models\\User	165
1	App\\Models\\User	166
1	App\\Models\\User	167
1	App\\Models\\User	168
1	App\\Models\\User	169
1	App\\Models\\User	170
1	App\\Models\\User	171
1	App\\Models\\User	172
1	App\\Models\\User	173
1	App\\Models\\User	174
1	App\\Models\\User	175
1	App\\Models\\User	176
1	App\\Models\\User	177
1	App\\Models\\User	178
1	App\\Models\\User	179
1	App\\Models\\User	180
1	App\\Models\\User	181
1	App\\Models\\User	182
1	App\\Models\\User	183
1	App\\Models\\User	184
1	App\\Models\\User	187
1	App\\Models\\User	188
1	App\\Models\\User	189
1	App\\Models\\User	190
1	App\\Models\\User	191
1	App\\Models\\User	192
1	App\\Models\\User	193
1	App\\Models\\User	194
1	App\\Models\\User	195
1	App\\Models\\User	196
1	App\\Models\\User	197
1	App\\Models\\User	198
1	App\\Models\\User	199
1	App\\Models\\User	200
1	App\\Models\\User	201
1	App\\Models\\User	202
1	App\\Models\\User	203
1	App\\Models\\User	204
1	App\\Models\\User	206
1	App\\Models\\User	207
1	App\\Models\\User	208
1	App\\Models\\User	209
1	App\\Models\\User	210
1	App\\Models\\User	211
1	App\\Models\\User	212
1	App\\Models\\User	214
1	App\\Models\\User	215
1	App\\Models\\User	216
1	App\\Models\\User	217
1	App\\Models\\User	218
1	App\\Models\\User	219
1	App\\Models\\User	220
1	App\\Models\\User	221
1	App\\Models\\User	222
1	App\\Models\\User	223
1	App\\Models\\User	224
1	App\\Models\\User	225
1	App\\Models\\User	226
1	App\\Models\\User	227
1	App\\Models\\User	228
1	App\\Models\\User	229
1	App\\Models\\User	230
1	App\\Models\\User	231
1	App\\Models\\User	232
1	App\\Models\\User	233
1	App\\Models\\User	234
1	App\\Models\\User	235
1	App\\Models\\User	236
1	App\\Models\\User	238
1	App\\Models\\User	240
1	App\\Models\\User	241
1	App\\Models\\User	242
1	App\\Models\\User	243
1	App\\Models\\User	244
1	App\\Models\\User	245
1	App\\Models\\User	246
1	App\\Models\\User	247
1	App\\Models\\User	248
1	App\\Models\\User	249
1	App\\Models\\User	251
1	App\\Models\\User	252
1	App\\Models\\User	253
1	App\\Models\\User	254
1	App\\Models\\User	255
1	App\\Models\\User	256
1	App\\Models\\User	257
1	App\\Models\\User	258
1	App\\Models\\User	259
1	App\\Models\\User	260
1	App\\Models\\User	261
1	App\\Models\\User	262
1	App\\Models\\User	263
1	App\\Models\\User	264
1	App\\Models\\User	265
1	App\\Models\\User	266
1	App\\Models\\User	267
1	App\\Models\\User	268
1	App\\Models\\User	269
1	App\\Models\\User	270
1	App\\Models\\User	271
1	App\\Models\\User	272
1	App\\Models\\User	273
1	App\\Models\\User	274
1	App\\Models\\User	275
1	App\\Models\\User	276
1	App\\Models\\User	277
1	App\\Models\\User	278
1	App\\Models\\User	279
1	App\\Models\\User	280
1	App\\Models\\User	281
1	App\\Models\\User	282
1	App\\Models\\User	283
1	App\\Models\\User	284
1	App\\Models\\User	285
1	App\\Models\\User	286
1	App\\Models\\User	287
1	App\\Models\\User	288
1	App\\Models\\User	289
1	App\\Models\\User	291
1	App\\Models\\User	292
1	App\\Models\\User	293
1	App\\Models\\User	294
1	App\\Models\\User	295
1	App\\Models\\User	296
1	App\\Models\\User	297
1	App\\Models\\User	298
1	App\\Models\\User	299
1	App\\Models\\User	300
1	App\\Models\\User	301
1	App\\Models\\User	302
1	App\\Models\\User	303
1	App\\Models\\User	304
1	App\\Models\\User	305
1	App\\Models\\User	307
1	App\\Models\\User	308
1	App\\Models\\User	309
1	App\\Models\\User	310
1	App\\Models\\User	311
1	App\\Models\\User	312
1	App\\Models\\User	313
1	App\\Models\\User	314
1	App\\Models\\User	315
1	App\\Models\\User	316
1	App\\Models\\User	317
1	App\\Models\\User	318
1	App\\Models\\User	319
1	App\\Models\\User	320
1	App\\Models\\User	321
1	App\\Models\\User	322
1	App\\Models\\User	323
1	App\\Models\\User	324
1	App\\Models\\User	326
1	App\\Models\\User	327
1	App\\Models\\User	328
1	App\\Models\\User	329
1	App\\Models\\User	330
1	App\\Models\\User	331
1	App\\Models\\User	332
1	App\\Models\\User	333
1	App\\Models\\User	334
1	App\\Models\\User	335
1	App\\Models\\User	336
1	App\\Models\\User	337
1	App\\Models\\User	338
1	App\\Models\\User	339
1	App\\Models\\User	340
1	App\\Models\\User	341
1	App\\Models\\User	342
1	App\\Models\\User	343
1	App\\Models\\User	344
1	App\\Models\\User	345
1	App\\Models\\User	346
1	App\\Models\\User	347
1	App\\Models\\User	348
1	App\\Models\\User	349
1	App\\Models\\User	350
1	App\\Models\\User	351
1	App\\Models\\User	352
1	App\\Models\\User	353
1	App\\Models\\User	354
1	App\\Models\\User	355
1	App\\Models\\User	356
1	App\\Models\\User	357
1	App\\Models\\User	358
1	App\\Models\\User	359
1	App\\Models\\User	360
1	App\\Models\\User	361
1	App\\Models\\User	362
1	App\\Models\\User	364
1	App\\Models\\User	365
1	App\\Models\\User	366
1	App\\Models\\User	367
1	App\\Models\\User	368
1	App\\Models\\User	369
1	App\\Models\\User	370
1	App\\Models\\User	371
1	App\\Models\\User	373
1	App\\Models\\User	374
1	App\\Models\\User	375
1	App\\Models\\User	376
1	App\\Models\\User	377
1	App\\Models\\User	378
1	App\\Models\\User	379
1	App\\Models\\User	380
1	App\\Models\\User	381
1	App\\Models\\User	382
1	App\\Models\\User	383
1	App\\Models\\User	384
1	App\\Models\\User	385
1	App\\Models\\User	386
1	App\\Models\\User	387
1	App\\Models\\User	388
1	App\\Models\\User	389
1	App\\Models\\User	390
1	App\\Models\\User	391
1	App\\Models\\User	392
1	App\\Models\\User	393
1	App\\Models\\User	394
1	App\\Models\\User	395
1	App\\Models\\User	396
1	App\\Models\\User	398
1	App\\Models\\User	399
1	App\\Models\\User	400
1	App\\Models\\User	401
1	App\\Models\\User	402
1	App\\Models\\User	403
1	App\\Models\\User	404
1	App\\Models\\User	405
1	App\\Models\\User	406
1	App\\Models\\User	407
1	App\\Models\\User	408
1	App\\Models\\User	409
1	App\\Models\\User	410
1	App\\Models\\User	411
1	App\\Models\\User	412
1	App\\Models\\User	413
1	App\\Models\\User	414
1	App\\Models\\User	415
1	App\\Models\\User	416
1	App\\Models\\User	417
1	App\\Models\\User	418
1	App\\Models\\User	419
1	App\\Models\\User	421
1	App\\Models\\User	422
1	App\\Models\\User	423
1	App\\Models\\User	424
1	App\\Models\\User	425
1	App\\Models\\User	426
1	App\\Models\\User	427
1	App\\Models\\User	428
1	App\\Models\\User	429
1	App\\Models\\User	430
1	App\\Models\\User	431
1	App\\Models\\User	432
1	App\\Models\\User	433
1	App\\Models\\User	434
1	App\\Models\\User	435
1	App\\Models\\User	436
1	App\\Models\\User	437
1	App\\Models\\User	438
1	App\\Models\\User	439
1	App\\Models\\User	440
1	App\\Models\\User	441
1	App\\Models\\User	442
1	App\\Models\\User	443
1	App\\Models\\User	444
1	App\\Models\\User	445
1	App\\Models\\User	446
1	App\\Models\\User	447
1	App\\Models\\User	448
1	App\\Models\\User	449
1	App\\Models\\User	450
1	App\\Models\\User	451
1	App\\Models\\User	452
1	App\\Models\\User	453
1	App\\Models\\User	454
1	App\\Models\\User	455
1	App\\Models\\User	456
1	App\\Models\\User	457
1	App\\Models\\User	458
1	App\\Models\\User	459
1	App\\Models\\User	460
1	App\\Models\\User	461
1	App\\Models\\User	462
1	App\\Models\\User	463
1	App\\Models\\User	464
1	App\\Models\\User	465
1	App\\Models\\User	466
1	App\\Models\\User	467
1	App\\Models\\User	468
1	App\\Models\\User	469
1	App\\Models\\User	470
1	App\\Models\\User	471
1	App\\Models\\User	472
1	App\\Models\\User	473
1	App\\Models\\User	474
1	App\\Models\\User	475
1	App\\Models\\User	476
1	App\\Models\\User	477
1	App\\Models\\User	478
1	App\\Models\\User	479
1	App\\Models\\User	480
1	App\\Models\\User	481
1	App\\Models\\User	482
1	App\\Models\\User	483
1	App\\Models\\User	485
1	App\\Models\\User	486
1	App\\Models\\User	487
1	App\\Models\\User	488
1	App\\Models\\User	489
1	App\\Models\\User	490
1	App\\Models\\User	491
1	App\\Models\\User	492
1	App\\Models\\User	493
1	App\\Models\\User	494
1	App\\Models\\User	495
1	App\\Models\\User	496
1	App\\Models\\User	497
1	App\\Models\\User	501
1	App\\Models\\User	503
1	App\\Models\\User	504
1	App\\Models\\User	505
1	App\\Models\\User	506
1	App\\Models\\User	507
1	App\\Models\\User	508
1	App\\Models\\User	509
1	App\\Models\\User	510
1	App\\Models\\User	511
1	App\\Models\\User	512
1	App\\Models\\User	513
1	App\\Models\\User	514
1	App\\Models\\User	515
1	App\\Models\\User	516
1	App\\Models\\User	517
1	App\\Models\\User	518
1	App\\Models\\User	519
1	App\\Models\\User	520
1	App\\Models\\User	521
1	App\\Models\\User	522
1	App\\Models\\User	523
1	App\\Models\\User	524
1	App\\Models\\User	525
1	App\\Models\\User	526
1	App\\Models\\User	527
1	App\\Models\\User	528
1	App\\Models\\User	529
1	App\\Models\\User	530
1	App\\Models\\User	531
1	App\\Models\\User	532
1	App\\Models\\User	533
1	App\\Models\\User	539
1	App\\Models\\User	540
1	App\\Models\\User	541
1	App\\Models\\User	547
1	App\\Models\\User	548
1	App\\Models\\User	554
1	App\\Models\\User	557
1	App\\Models\\User	561
1	App\\Models\\User	562
1	App\\Models\\User	564
1	App\\Models\\User	565
1	App\\Models\\User	568
2	App\\Models\\User	116
2	App\\Models\\User	151
2	App\\Models\\User	484
2	App\\Models\\User	502
3	App\\Models\\User	376
3	App\\Models\\User	502
3	App\\Models\\User	545
4	App\\Models\\User	38
4	App\\Models\\User	72
4	App\\Models\\User	77
4	App\\Models\\User	106
4	App\\Models\\User	115
4	App\\Models\\User	146
4	App\\Models\\User	173
4	App\\Models\\User	186
4	App\\Models\\User	197
4	App\\Models\\User	237
4	App\\Models\\User	239
4	App\\Models\\User	241
4	App\\Models\\User	248
4	App\\Models\\User	249
4	App\\Models\\User	250
4	App\\Models\\User	287
4	App\\Models\\User	290
4	App\\Models\\User	302
4	App\\Models\\User	306
4	App\\Models\\User	308
4	App\\Models\\User	325
4	App\\Models\\User	348
4	App\\Models\\User	363
4	App\\Models\\User	370
4	App\\Models\\User	372
4	App\\Models\\User	376
4	App\\Models\\User	397
4	App\\Models\\User	420
4	App\\Models\\User	461
4	App\\Models\\User	488
4	App\\Models\\User	527
4	App\\Models\\User	536
4	App\\Models\\User	537
4	App\\Models\\User	538
4	App\\Models\\User	542
4	App\\Models\\User	543
4	App\\Models\\User	544
4	App\\Models\\User	545
4	App\\Models\\User	546
4	App\\Models\\User	549
4	App\\Models\\User	550
4	App\\Models\\User	551
4	App\\Models\\User	552
4	App\\Models\\User	553
4	App\\Models\\User	555
4	App\\Models\\User	556
4	App\\Models\\User	558
4	App\\Models\\User	559
4	App\\Models\\User	560
4	App\\Models\\User	563
5	App\\Models\\User	98
5	App\\Models\\User	103
5	App\\Models\\User	185
5	App\\Models\\User	205
5	App\\Models\\User	213
5	App\\Models\\User	500
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
007a55f2f87cbbc2eea6b40618280d964e06b20ce2381344f43f8059c9c9ae281894c09322e2e239	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-15 10:11:29	2021-08-15 10:11:29	2022-08-15 10:11:29
013e0ecd58fa21906a59a09c400ae529b362de8c98655734958c2dd1a38bb871e2a8aca455ce8943	484	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-16 07:12:57	2021-04-16 07:12:57	2022-04-16 07:12:57
029eb9920b0e93e025bfa2c86e52fbbc9b14bdd48b294cfb57f199ed6c28ca25599c98159a336163	151	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-15 12:00:40	2021-06-15 12:00:40	2022-06-15 12:00:40
02d5d1310fb821b0a019974323a7448bb8707da49d83c1088f0023f1636479188d4d3b1f3b9ffc4c	493	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-17 10:12:41	2021-06-17 10:12:41	2022-06-17 10:12:41
03a15bfdc899e8257d52cae94d34add696d10fe7d15c062cbb330feaa83a3fcef5c711d07a7e2fc2	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-30 05:54:42	2021-08-30 05:54:42	2022-08-30 05:54:42
07b67869f9ec977578b23428d9a57313286901029412d99d49004b6afcffb316d19c714624f2b3cb	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-07-16 11:51:56	2021-07-16 11:51:56	2022-07-16 11:51:56
0842028b153e5ec29fe8bb5a36c172f9826fa15307b3652b303c694583e1f6af53fbf42faa1c22c2	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-17 18:05:07	2021-06-17 18:05:07	2022-06-17 18:05:07
08f43dae24ebe945693ffba0cc0a6a3188886046eadabfa84c16811b9aa295eab1d2fbd19ea2b56e	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-10-18 05:53:14	2021-10-18 05:53:14	2022-10-18 05:53:14
0cab4ab8d28018467e97b90abcbde42bb801253abe4aa52e00402e990c99544a078227e3f87c297d	500	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-16 06:50:25	2021-09-16 06:50:25	2022-09-16 06:50:25
0d0b9fc9dc2f561e44ea939db20d4b3c49ab980f2aeb0e36012844673431afc180680f422f943368	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-27 06:47:35	2021-08-27 06:47:35	2022-08-27 06:47:35
12d2299a66056edb5e2b2efe6a2df4812f5bc7469579b88dc739670cab6e88c39739d8f237125824	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-05-07 07:19:37	2021-05-07 07:19:37	2022-05-07 07:19:37
12d3dfcbdfdcc23fb63ef7342c1bdef9d60abee959b932d35fb3c5fa6862654583d441912e51688b	213	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-27 06:49:39	2021-04-27 06:49:39	2022-04-27 06:49:39
14f18d873bd9b663fda1227f0db854adbaa066896a99a4df8278801f61efb96126db85177cf0806d	545	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-10-15 09:14:24	2021-10-15 09:14:24	2022-10-15 09:14:24
17cfe38373c9c9b32108d34bdce836f5304fca1913e2e084dda8da79cc23ca73f9dc6ec61d82800e	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-16 07:09:23	2021-09-16 07:09:23	2022-09-16 07:09:23
19519cb67f66a71fcdd7da0ca891fc5c5791d968db9b23643044d4cbe265300763878ea5d1bd42d0	151	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-05-07 07:20:55	2021-05-07 07:20:55	2022-05-07 07:20:55
1e204e1225f6297f284467d93ed3c2cab1cc738aa61fd22d3d8bec078aafe6d161e6860855142dc4	46	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-18 20:43:04	2021-09-18 20:43:04	2022-09-18 20:43:04
1e94b2a935479e0e06f52c0bc42d529d27d9c2842670860e9654abc4cc9f7638977308af5cf3ced3	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-16 08:52:23	2021-09-16 08:52:23	2022-09-16 08:52:23
20ed32032bbf650dad7ff06642f8b78dfebb9c073193f42d354dcd593afcbe80651f7fc90e743014	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-15 19:03:49	2021-06-15 19:03:49	2022-06-15 19:03:49
230ca22bd90acb906d6b557b33815bc95416361d44af4569a3425092c904f9ba4e423699d78d72cb	248	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-16 12:16:14	2021-06-16 12:16:14	2022-06-16 12:16:14
2511402aea82ab9be050898a08cee2728829639a365d9402c913cb6cc4334b18828f4ad290c92b23	503	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-05 19:46:29	2021-04-05 19:46:29	2022-04-05 16:46:29
26644c2e6cf4a8475a5d2027fab45c2af2b6a20ea295acbe8b201777bfbb61a5556ad6ccf8cf9df6	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-12 06:11:31	2021-08-12 06:11:31	2022-08-12 06:11:31
28596c5b5d3302614bafe95768a411ecb5018a9fcb1a18bd6f8ccf670b08e3e4cb346d826adf9bb9	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-05-12 13:27:30	2021-05-12 13:27:30	2022-05-12 13:27:30
2b143d6f04bbaf275e04307aa91337e9d6d397a96804b238f54029b1f5360b21d96a2acf0ab3629f	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-07 06:30:14	2021-06-07 06:30:14	2022-06-07 06:30:14
2d0e1ddee04f63c7dd1e29abdda7ddf28e631837b99ff1ca93aafb2fa0850bba1a5419367c1a9a49	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-07-14 06:33:23	2021-07-14 06:33:23	2022-07-14 06:33:23
2e5e9b559d002d4cb320c43d857cdee00dfcb860dd9e58f230b019c6f8a49119dc4527579970cb35	500	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-09 14:38:04	2021-09-09 14:38:04	2022-09-09 14:38:04
2f97973a7ef25cbe23d4928283e3ca4075cb2776bae955f11dcf5b3ab3a29f6e75ed3ccab3a8b8c2	223	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-07-16 09:07:57	2021-07-16 09:07:57	2022-07-16 09:07:57
30de71a818b886328ff6afe60e2a055bd66ba43218add9542b8917f8fdd1f2ed236e1839c1404585	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-06 13:39:30	2021-09-06 13:39:30	2022-09-06 13:39:30
33312154dc9e2e4e21deb3237bb2cd9451f600811f5fd5175305ffbf4b44bdab7fd4549ee87d65b0	313	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-15 07:07:11	2021-06-15 07:07:11	2022-06-15 07:07:11
36ff784473ef468858211370c6822511cc5f888ac6995c3e4fcf5abe1df18837d4d50794219845c2	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-31 13:33:50	2021-08-31 13:33:50	2022-08-31 13:33:50
39ee26be887b45f9a97dd60e79b2db82d3330f8e4c5f78ffbbb2baa060c2350362a4a51db0b3c0da	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-14 05:29:18	2021-09-14 05:29:18	2022-09-14 05:29:18
3bcb1dfea2c2fcf86e34b9cf9ea5256dbac235629d9c6f0a971430b13dcd1736cc93489d7ef438c0	545	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-13 17:49:49	2021-09-13 17:49:49	2022-09-13 17:49:49
3c97465435f5914ee84a86cd41815e017a3177482a5fdf8eb34e47f8a50c782aac0edcaf2b0608cd	248	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-16 12:16:28	2021-06-16 12:16:28	2022-06-16 12:16:28
3d716f0fe24879eab1391de57a198c61e3958f7c3c5dca248e1f4e4eef2bb47c45dcacd1baa0cfc2	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-14 11:13:45	2021-04-14 11:13:45	2022-04-14 11:13:45
41165c2343a2ad2e2486cf89bcf3ff5d9ff66d1d8dd6de1b424716d61b3b9b159e8c2b99353ebbd1	500	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-16 05:47:06	2021-09-16 05:47:06	2022-09-16 05:47:06
4150c1ac59b833d4162120a7dd8b5d445f467b7123e64c478c7a79970a470b03fd067031f4846944	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-05 06:11:47	2021-08-05 06:11:47	2022-08-05 06:11:47
433f0882431457ef6c4746eb50007565d0f69a1a3450bcffdaf88e5be2ec2806874a4b03e3780d98	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-09 15:34:48	2021-04-09 15:34:48	2022-04-09 12:34:48
44425780996cd24a260e32b6b99c69109d3a3386f6e514fc1da8c254f5a0c5efe77ad8d38c456b48	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-07-02 08:01:20	2021-07-02 08:01:20	2022-07-02 08:01:20
44bcdef26dd247bf3386adf13823b8cb52f91732127d637bfe8cba0234aee9de55fab77a91e2dac4	252	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-08-09 07:13:05	2021-08-09 07:13:05	2022-08-09 07:13:05
46f007c5fc6eedadf11354ffe8d6c4a5e3a9f9713240e14df97ddf440fdf34081ef78d7d227629fe	484	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-08-05 07:37:59	2021-08-05 07:37:59	2022-08-05 07:37:59
476fef1a657674bb84c67308933a2054c07807727fe0cbdff11e47cf2330e5ff15ccd56d50693090	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-16 07:29:34	2021-04-16 07:29:34	2022-04-16 07:29:34
47802552d13afc328d6a8737f27c3e4f9ea55145d458178cc9efa0c280ce8a3f24b749bfbbe626a9	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-12 13:04:18	2021-04-12 13:04:18	2022-04-12 13:04:18
48d77befa50f5e01bc3510e17d01539f07764f59509741a6eabac6b5d32299d5dee0538a4844542b	180	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-16 17:09:44	2021-06-16 17:09:44	2022-06-16 17:09:44
4904e0b92daae12894a0f51b4c789ffc17bdc6f35b16ea0e9e3d688269bf9aae79baf0f020547ec7	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-06 13:39:58	2021-09-06 13:39:58	2022-09-06 13:39:58
4a1acdc2c58265b7a04f6c1c6ae499168bb09fada5f093d6f857efa082373f2aded7fbd2bf6076e7	545	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-15 06:05:39	2021-09-15 06:05:39	2022-09-15 06:05:39
4b15a123697cd4a00b21c459e52b3695c135a7d8bcd67c205e417513f3ec7dc935dabaed0ff36433	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-11-06 18:19:53	2021-11-06 18:19:53	2022-11-06 18:19:53
4ef59129eb618cb6b2372a1f4da0ebc4cc4372fc4cf5e3d27810f23be6a2896c36f2208d5af4121c	313	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-10-14 06:28:36	2021-10-14 06:28:36	2022-10-14 06:28:36
507678a1a0112769f0f7ea973d0b5ae3b7628c535b0773c718fe577069eaefd59f294cfac88f43a6	484	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-15 10:29:32	2021-06-15 10:29:32	2022-06-15 10:29:32
51182f12c90f47f655a148a47448e61bd420c707518c961dee1f71c2c113f41d47affe72ec41f25f	313	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-14 09:14:59	2021-04-14 09:14:59	2022-04-14 09:14:59
51c67d574e21f1681e9c58c450afc271e6d3336ec0025d998f7511c62a9b590fbaa22e31434e2bc5	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-22 08:49:52	2021-09-22 08:49:52	2022-09-22 08:49:52
51e917293ebc664857be8fb044daec3ffbfca77293a2b72206820271b68cb2e0cbe45ce4df1876af	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-15 08:35:53	2021-09-15 08:35:53	2022-09-15 08:35:53
5230ab0dbb5b0f8c1c4ee7edb29079c5e513ebadd766b175f113bf1ad4d658022c30196d8bcae104	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-12 21:48:57	2021-04-12 21:48:57	2022-04-12 21:48:57
56afa74fbeeb54646da35066fd755c42a6131c180a813107b531f5515571c7214ff29de01355dc4d	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-11 12:26:15	2021-04-11 12:26:15	2022-04-11 12:26:15
58d84a3e8cf991595a69d0e6f753cc7f7aefb26277d112cb3bd4dfda3dd0bf1356d5727967228d7b	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-16 06:01:40	2021-08-16 06:01:40	2022-08-16 06:01:40
5af46c06c3f7c6bfbd20ee4160c2f8da6c48cbf9eda33d36d2c692d83e1f470e9cdcdd29f2eacc18	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-11 09:40:41	2021-04-11 09:40:41	2022-04-11 09:40:41
5b0ed53dbd71420b1ee699104131d268e711cbe10cfdac64aa89f3868bc6d09fef08e3efe6f49c85	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-14 08:49:04	2021-09-14 08:49:04	2022-09-14 08:49:04
5c4474ca7257e2c55431d5991f18a6ea429c9db9cdaa883c45fd682fb45274a83cc2dd1bf28c79f9	391	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-07-07 06:56:39	2021-07-07 06:56:39	2022-07-07 06:56:39
5c485af96a7c94afbcc9d85f7c215864ef787a548d211e7c232178da4840e194cfadcd735eb1d6e5	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-10 19:15:21	2021-04-10 19:15:21	2022-04-10 19:15:21
5e7898ac584cbc3891c0fbfb80f650728a054e64d54da7c0195dd0c76691383f7ab8afc646c58aff	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-10 21:38:33	2021-04-10 21:38:33	2022-04-10 21:38:33
62cd322f25242cf4a3eb3c262d6823a6bab9453c9ef6055c039cad6b7021f5a946d3a32c7efee525	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-10-14 04:39:38	2021-10-14 04:39:38	2022-10-14 04:39:38
63447f4624d96942927536a0e582a2dbffffdd52433f2cb7befb9c781a06d5c4e7956778b847f7d8	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-12 08:15:40	2021-04-12 08:15:40	2022-04-12 08:15:40
641b9bf3c1c41b40ff88b84ac0509220be0815ca6ba54876c79c0a721001cb36ad85f5fb41f17e96	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-07 06:25:19	2021-06-07 06:25:19	2022-06-07 06:25:19
64392744674992f887e54674e76c54cfd8ab19b1c514c7be193cce11e4390f47797e71b807279855	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-07-11 11:05:35	2021-07-11 11:05:35	2022-07-11 11:05:35
664fac31d675c7871e98bb7427aa3bbaa29ea17887ee36933aedc9014afa544095998fac2295f623	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-14 11:22:30	2021-04-14 11:22:30	2022-04-14 11:22:30
66a9153e15f275fefa1d3094f85d411f155950cf8d0eb12350ba4c6b39a827095d4389b5fecb7c9a	298	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-16 12:13:14	2021-06-16 12:13:14	2022-06-16 12:13:14
66cff077a6235b82a3e3c2c682bb690a82855ecc25b466a8a28721fad8522ad9aefbadef4d2eb96b	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-10-19 05:31:28	2021-10-19 05:31:28	2022-10-19 05:31:28
6805d453863bba3abe7ec6707e099683670e816b5894449886a4823f716278a4681a1012c770432f	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-10-05 06:23:03	2021-10-05 06:23:03	2022-10-05 06:23:03
689c59d582237cfc2ffc9c07c2e8fd3aed35f5368209f678c9de6221ce3dc95c712313da3e22c87a	500	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-16 06:13:42	2021-09-16 06:13:42	2022-09-16 06:13:42
6c82a04985ed91199a069b90831f3d7a1a8487b3428c2bebedd87c511aaf50417acaaca319eeead8	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-16 07:12:57	2021-04-16 07:12:57	2022-04-16 07:12:57
6e77c2da49a2e91b8b5b364134a2b1120ee5092b782e0f0feba851959a0ea1c780ab2edc16f984fd	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-15 10:28:05	2021-06-15 10:28:05	2022-06-15 10:28:05
6f3ee80cbde6ca6b0d1a850225b0bbc13f6ac0815a97e48b212acd771faea21a75e4126d5f4348a1	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-07-27 04:37:12	2021-07-27 04:37:12	2022-07-27 04:37:12
6fd942ea3dfa6636afd86d43792b32c951c7d5eb08ec3415c2dcf53b85a73dbd626c5dd4ae28b57a	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-07-06 13:43:12	2021-07-06 13:43:12	2022-07-06 13:43:12
7328a8bebdccd5fe1735a466d1b78343a1e1eeab228d6dc19f30c2f46baaebd675bac86f05fe3610	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-11 06:05:41	2021-04-11 06:05:41	2022-04-11 06:05:41
742f4a656ca083d52b2da327aed0c559a8196c2ef2ca7bdef927b50c1f6457c007f02c46369b6a72	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-30 07:56:53	2021-09-30 07:56:53	2022-09-30 07:56:53
75686c6ebd147fe6e16b9ad3974ddaa565de1d3a63984a01c6e65a7b338b4149af39866614ec3f91	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-05-16 14:39:39	2021-05-16 14:39:39	2022-05-16 14:39:39
774aa24127d462ca52a8784f8b7fc635fd8a36515e482e933ce5d0a64e1cf0bec48b738b2a154205	298	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-16 12:11:39	2021-06-16 12:11:39	2022-06-16 12:11:39
7807ab6094ea3514ac5237578621fd95e8fde48b047133604e145ef474e1f8c84aa26f6a8d43a5dc	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-14 08:03:14	2021-06-14 08:03:14	2022-06-14 08:03:14
783d091e348703bd76db71215e15e8254e1e6d78e0241c1dfda34912a65d595560462dd65f3ebf8e	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-10 19:16:35	2021-04-10 19:16:35	2022-04-10 19:16:35
78a234d8abf3aec55374b4e9bbabb4617037ea03e714a895cc462e60880ed395db399f0f2a763f5c	46	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-18 20:49:18	2021-09-18 20:49:18	2022-09-18 20:49:18
78fa9d7445d69562d14113949900636a0668c34c05d649dd4b199c92eebb934e20c12c8e5c03294f	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-07-06 15:37:24	2021-07-06 15:37:24	2022-07-06 15:37:24
7a68fa1e3e2eadaecd34f74186f73cb79300e53815bc19eb73988c29ae3493a3507227224f6e13fd	448	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-17 08:38:44	2021-06-17 08:38:44	2022-06-17 08:38:44
7b3d5128e4d784de7e2b0f007733d694c984708955d980bd5ab67233cf6d4d4d96ca5b35c859f973	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-26 08:29:25	2021-04-26 08:29:25	2022-04-26 08:29:25
7d4997254cc5fc0eed592047581fd9c784944e03b20f1cbe852d712d775c596708b026c45f9f3276	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-12 21:51:36	2021-04-12 21:51:36	2022-04-12 21:51:36
7d8ec9cf5933926e6b75726d09a516df4b8838d76c95d973d790ad59183df3b2a50db65fb213d57c	500	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-16 06:50:01	2021-09-16 06:50:01	2022-09-16 06:50:01
7ec32436d833b9dfd8cfd13f515639b654abcdb99bf6a5307cb14a00b011425925d9e0859437de46	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-09 22:59:54	2021-04-09 22:59:54	2022-04-09 19:59:54
82d94658267eab04b9850963179e7585a789aeb1e7dcc92c3b00cc287d2331f3474c2305ba0a3e35	248	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-16 12:13:49	2021-06-16 12:13:49	2022-06-16 12:13:49
840a17246e1bc7a846366a11035267286e06f9a8c5bf37cb54c267b2d2e73962a5de6a08be091b55	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-23 06:50:57	2021-08-23 06:50:57	2022-08-23 06:50:57
84ae278d5d84034db317410d1a39fc1e79d880d46baedd25b896a6ab9e15270710a163d6070d9100	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-12 21:53:48	2021-04-12 21:53:48	2022-04-12 21:53:48
84d4657a4f68ea5273ff62f1b6eb020d9e2840116ec40d4b26683de99b0c86110d0e64cc840f85a5	545	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-10-13 07:43:25	2021-10-13 07:43:25	2022-10-13 07:43:25
851b5b96b2d47c77846970b7dd4fa2dc5e9bbc2c3a0bc2965e7025a42d480f8b6b76eb2a1d0240de	46	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-29 21:35:39	2021-09-29 21:35:39	2022-09-29 21:35:39
85958689ce79fae791cd1fe7092dbcc09b5365f825b4cd42d7c2464c9e48ebdc68fae646be51e739	533	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-07 06:38:22	2021-06-07 06:38:22	2022-06-07 06:38:22
894310a2192d85884c0bd5b5b3a6c5e26ac5d3c697fb93dc31bd2cefe6eefaba0013c20ccf330c25	308	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-16 12:11:44	2021-06-16 12:11:44	2022-06-16 12:11:44
8a590e64c00a7d3ad13c092bdbaa23b0223e5a9f8fe7de8185f98e0d710ad10c3441920c9410ff07	533	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-07 06:29:46	2021-06-07 06:29:46	2022-06-07 06:29:46
8dff8a08b3c0df1cbf7f8c191357c81ce1e925dea6257a543f7f94141870e9ce7f5d17ffd513d4d6	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-31 16:55:35	2021-08-31 16:55:35	2022-08-31 16:55:35
93843bccec692fe9224ce54839c1094d546245ef4943c62a6933f04f72c4c6b2d0bcfc06d4b54b99	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-09 15:34:38	2021-04-09 15:34:38	2022-04-09 12:34:38
9499fa1df639453305eea95ed14470dab1dc97bd5b4c4f23edcfa8ff53876caf3a9071e9a5a8250e	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-16 07:11:29	2021-09-16 07:11:29	2022-09-16 07:11:29
9ad7a00685a44beeeb128650048ebaf45e05ff1e3f4beea36f275ebe320d68eccde24f8e7776310d	503	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-05 20:21:29	2021-04-05 20:21:29	2022-04-05 17:21:29
a087eca6ef096696c53b180cc54f62479f71f0c5e28c881fd4dc995e0746abda74a1d36f09ae455e	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-25 18:06:32	2021-08-25 18:06:32	2022-08-25 18:06:32
a0a11225f74a432b4afbbfccc7cbb1ae12b86b731796c7eeffbed359eac39be87b5a9ab9f30a0703	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-10-15 07:40:04	2021-10-15 07:40:04	2022-10-15 07:40:04
a0cf7c30c1896b4bca136a293a0e3fd4b7a68931e5ea6cf43849d05a131fcb1a7f83a6f5dfd078f1	358	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-10-05 16:18:51	2021-10-05 16:18:51	2022-10-05 16:18:51
a1681ae2a53c3a29a45c6d5edeaddb13f533b6751014ec4e724ecf8aa7c6ae8f6d83488d18612077	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-21 18:21:59	2021-09-21 18:21:59	2022-09-21 18:21:59
a64b0f711e0e132d05b76cfea3002bd1d757374baf4f0b328b4637a8150a7b3b0a516ac006b6d7f2	252	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-09 05:33:33	2021-09-09 05:33:33	2022-09-09 05:33:33
a929b03f011406f300ab9d4c04efb5b4ba8621313edf99295b9e22fdf38d816af99edc369a43b476	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-10-19 05:04:26	2021-10-19 05:04:26	2022-10-19 05:04:26
a989b98aecc9755db5c6318cc75917216fd0662ad9525e10e90cbd3897b930f47052dbd3daeb3953	46	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-16 12:58:57	2021-06-16 12:58:57	2022-06-16 12:58:57
a9a1eef3e1f1742a5342b015af04e0fb62db71ffa5367ec5b9b7ecfae5b17059a65b54e52ca9979c	98	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-27 06:12:59	2021-04-27 06:12:59	2022-04-27 06:12:59
a9cf4b7c6f625811bee843e211eb235681f964e3389d7b33c2993657be28f024a2ca9b01e8e9fe5a	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-14 12:20:24	2021-08-14 12:20:24	2022-08-14 12:20:24
aa9694d73b73c5ad29c8bb721334f1ea388c136e9f506ebeea2831eefec21181836d1a617a357da0	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-16 06:02:02	2021-09-16 06:02:02	2022-09-16 06:02:02
abdd1a39b780ccfd4ba13ffa164e5630c37ffb0e05598e23a062c018e61bdebc5db518a566c7eb03	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-06 13:08:16	2021-09-06 13:08:16	2022-09-06 13:08:16
ac8e7f1eae49496bbb7d893af969acd28586ef9f1e0af48d35d75a91e46635f92306231e9927531c	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-11-25 14:29:44	2021-11-25 14:29:44	2022-11-25 14:29:44
acc167b308be07454745afdb45d84fa018b506253079fe6ea29c1fccff7b3152eb1b805e20cb473c	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-09 22:59:42	2021-04-09 22:59:42	2022-04-09 19:59:42
af2bbf1b2b9c6111d585876b8520fd99a778a5739f7b5ad6cfbf9863cc84500ca4d4a0311e7372ec	503	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-09 00:23:56	2021-04-09 00:23:56	2022-04-08 21:23:56
afe08ceac2fc3d364f6ce5c788e9755c8b60b3698fe57824912dc5c0c96631474abc22660a8c0a61	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-08 19:09:03	2021-06-08 19:09:03	2022-06-08 19:09:03
b0d024c2d3eb88377bd0de045b9eb577c686e934b6505ed3168041285bc78bff54e67e87b885c67c	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-07-02 09:46:32	2021-07-02 09:46:32	2022-07-02 09:46:32
b0efaeb6113261ab01f388152e793fb53eec0b8c6edd27e753f75906f9d17a3fa4c40d3c3622fb2a	248	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-16 12:15:42	2021-06-16 12:15:42	2022-06-16 12:15:42
b37668bf206b8b2cde5755e26a5a831ee6273cf7f52bea496be1c6844c982767924c1c79b0bc6d5c	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-10-06 05:18:29	2021-10-06 05:18:29	2022-10-06 05:18:29
b3c354d6222e11cef05f09ddae7ecb32a189e1e26b5eaf60fc32cea9506c61d589bbb6d1d45a1746	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-10 21:31:49	2021-04-10 21:31:49	2022-04-10 21:31:49
b5a968a9b621104c7ad8ab0e302f8773af87f6a5c99398ab948f0cd4860bd6b29d0f4dc33acb7583	387	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-16 12:17:35	2021-06-16 12:17:35	2022-06-16 12:17:35
b5f8733e1435bbde06e65bb8745b46e39c086712f2ad884ae146e20253d3f491b6253c5a7990c67b	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-16 07:12:20	2021-09-16 07:12:20	2022-09-16 07:12:20
b646c33f4cf0f0c82a613e4c7e4444e8f5d38d46cecf9aa1327094930278fe734a1981b0bfb21bb1	151	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-07-02 09:03:17	2021-07-02 09:03:17	2022-07-02 09:03:17
b8260c7374072640620fb4e07f9edc5038898d6a3be73e2aa704bfc76944dafee54239fda1b3bc86	290	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-05-26 10:38:19	2021-05-26 10:38:19	2022-05-26 10:38:19
bd651cda6804663c5f83a0e63b18eabcebffb6a514f8b0e2bda616c30baebbc08d36e36141c129fa	484	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-01 08:28:47	2021-06-01 08:28:47	2022-06-01 08:28:47
bdff81b239b0b4d2271f943670a21ac453b9ec0b007aa6a4ba3cb18e31c853d6af13f2f06c712bdb	503	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-05 19:42:54	2021-04-05 19:42:54	2022-04-05 16:42:54
be25c9029f33e4d3bff13a86a3cd131b03d7bfe2f1af7cfcb3f70e4679dc601c35fb5c66c29182c4	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-09 16:13:52	2021-04-09 16:13:52	2022-04-09 13:13:52
bee12bc8cddb1f0d2b5f04b08f620df77810dc9dc6b644158a0976886f43c076297809d2549a0079	313	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-10-14 06:28:28	2021-10-14 06:28:28	2022-10-14 06:28:28
c0a4da355a8c31cec85966d2ffb375abe56cd0dffaa60aaac0803af3ae49266e70abdb285d30e639	252	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-07-07 08:48:11	2021-07-07 08:48:11	2022-07-07 08:48:11
c2ad248e24f19348d028fe400a669ecc03d173aa3ec31bb5d28fae7bd41a41c2b9ff005c757db4c1	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-08-17 04:59:53	2021-08-17 04:59:53	2022-08-17 04:59:53
c3855bdc9d09b90eab4d2b81285ddb54d30e7bac83ebbcc0a3e7efe577c146af700d2f14747bac40	185	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-16 07:13:48	2021-06-16 07:13:48	2022-06-16 07:13:48
c5530bb69b4a1ea607ca02410d4d15cc6df4d17146ae81438e66096e4e16be2fe592d6dfb7a063d2	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-10 21:41:20	2021-04-10 21:41:20	2022-04-10 21:41:20
c784f8fabc3cf377bcab09f229798eebcff2b3f95e03944fe6b286920ef8ac1ef571fe00c220b2b3	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-22 06:47:49	2021-09-22 06:47:49	2022-09-22 06:47:49
c7e10589fe4d7e2c918ad95d8ed5c56e1d1ee392a9d89af396fbbcc2ce4a2586be560235330b7f10	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-09 23:02:59	2021-04-09 23:02:59	2022-04-09 20:02:59
ca50317cbffc4897fa36e26ff4be2077f4bd4d94a8572f3ae651b12b4174685af6e2ea88ecd2ecc4	545	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-10-13 19:07:20	2021-10-13 19:07:20	2022-10-13 19:07:20
cb1ae46552aff7fed630546929b1c78eb1ee1b8b07769206bfbef22b19601c2265063067b7ad229c	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-10 18:59:24	2021-04-10 18:59:24	2022-04-10 18:59:24
cd846365dc82174110167f1ed1931af96da098abb238bc4fbbafdb53ed492ba236f80f0f8b75fdb1	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-10 07:00:49	2021-09-10 07:00:49	2022-09-10 07:00:49
cf4624a6c0fd0f26d257188ac53493dc1bc4730545be109f6f5756be8a64981eac6c3726293276b9	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-15 19:19:06	2021-06-15 19:19:06	2022-06-15 19:19:06
cf508c8445e2e3865bd45e8512426e31e1b944cae32e339ebd2d48aca612f666447d4ca8f2220355	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-14 11:12:36	2021-04-14 11:12:36	2022-04-14 11:12:36
d530a73e23ec7f892d5d386ccce5e100d9f3eb652c9a69c47b5e8e2d594fd301e1bcb5c2cdc9b0ba	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-15 08:34:32	2021-09-15 08:34:32	2022-09-15 08:34:32
d5509e4e515e1a17e430274c13bcd1ee826b2ac4fdf642eba16e7f969e045239ff106129029f1da1	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-10 21:39:09	2021-04-10 21:39:09	2022-04-10 21:39:09
d5b49a8f3365bda4586f37fe3d89793c2efd0a1e9dcdf41d029e4cecd5ca9e27ecade2a6bc7a707d	46	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-18 20:52:20	2021-09-18 20:52:20	2022-09-18 20:52:20
d69435fce62d76443f6fda439f04d1202b8657e543911549ffc8228901b95710029f046e1a076dc2	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-16 05:30:13	2021-09-16 05:30:13	2022-09-16 05:30:13
d7f4058b52c4cd2db4e495b3b5d92c98fc25e90b6beb455a6601aa7d85d637f6f7189074239c1495	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-16 07:14:28	2021-04-16 07:14:28	2022-04-16 07:14:28
d90fd04398b1a68fde977d511207cbc146308d0669257c63eba46fbe6123d2eb36b07b79cbfe7f46	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-14 11:14:14	2021-04-14 11:14:14	2022-04-14 11:14:14
da39700e9e215f6c89040329b532fe94ae50df0f92e4234d33641fe2f71306c46108e709cab924e2	379	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-07-20 07:56:09	2021-07-20 07:56:09	2022-07-20 07:56:09
db34e954f23ae3fa2458847edd63e69be0c4454729b554f394d1b03b15b0bdc0105e0b3444070fd4	205	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-27 06:04:34	2021-04-27 06:04:34	2022-04-27 06:04:34
dc99de34fd746d0f96628be419f8cea9bbaa4c865d7f99871ef679bc3d08612493b157a1e85a83c6	298	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-16 12:12:55	2021-06-16 12:12:55	2022-06-16 12:12:55
dd60f890bb36c7c02ba332bc91404979f08c4b11c9b63746923ca3b3184eb542244382384817d13c	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-12 21:47:51	2021-04-12 21:47:51	2022-04-12 21:47:51
dded9aae30348955d446119825d34d63922afa4bb9cf1530fe23cc3f857b707155b38f8d8cfa4d25	151	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-15 12:01:12	2021-06-15 12:01:12	2022-06-15 12:01:12
de0511a408c8a24dc0d5343d462ca890420cb1ecc9a8276f940888db4f975cc8be73a6a063e233ee	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-09 07:00:29	2021-09-09 07:00:29	2022-09-09 07:00:29
e31de45be07ebd436e9666f5b91c388e34e8bb4715044b38350e0060db1493d63f2ee8e41bbabc6f	545	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-10-18 20:45:54	2021-10-18 20:45:54	2022-10-18 20:45:54
e33ab52de9a81ce1c09aa56b3c4204e1703796cee05193cc4c240598af08342e3964187f97b3635c	503	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-06 20:43:47	2021-04-06 20:43:47	2022-04-06 17:43:47
e7715348b7ee92615581f89a021a2047757e91ba49184bb208a72818fea6eb20e2e6bc0567710906	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-10 19:15:41	2021-04-10 19:15:41	2022-04-10 19:15:41
e8b73540969bac76958f6e101fbb0f7855d3acc779effe734c3eed9a3455ff9b66315a4db2032d60	313	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-15 15:06:11	2021-06-15 15:06:11	2022-06-15 15:06:11
e8d3a37fee6d93b659529afec77ee63ec43560eb3cdb582e2848b2fdacdd586facb597440d48b240	242	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-18 13:20:13	2021-06-18 13:20:13	2022-06-18 13:20:13
e90eef890809b83ff75e3e8f4b96a0d6ac044c5ff0dab3fde2b7a411427e858f94d6df1ae8dc4ce7	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-15 06:24:46	2021-09-15 06:24:46	2022-09-15 06:24:46
ec159fc14d158d0438b9a9f3d5de6a99220029379ad8a6da1f2086b231b6a8e6204fa7295a54f5f8	451	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-16 13:51:20	2021-06-16 13:51:20	2022-06-16 13:51:20
ec906b76e95004adf90df7df64406bfc68186dcd3b0020287f93fe8606e0472ef639c2408effc9cf	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-27 05:38:48	2021-04-27 05:38:48	2022-04-27 05:38:48
ed1ae81c8b8992564c5a5e46e88c7bd89c8595ef386ce4f1533f59c2f40feba692bb55ade07e0be7	484	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-05-07 07:07:57	2021-05-07 07:07:57	2022-05-07 07:07:57
ee40588299eeffee7849c810a5a4b3e4045d97c1a6a5ee543d690059064629a77871af566d791aec	484	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-16 07:12:37	2021-09-16 07:12:37	2022-09-16 07:12:37
ee5ecd84cb1e301ea65e0f5b482cf10919329f391adb41ecb7fb4b8f86e5b28aeb426510bee05a26	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-09-16 08:08:43	2021-09-16 08:08:43	2022-09-16 08:08:43
eeb154181378e759f79c7446c22ee82a6dfac373c03b85a7a2d5976354ce91841a48bb9a76c18705	506	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-16 12:20:53	2021-06-16 12:20:53	2022-06-16 12:20:53
ef4332d1d9c79fc6eaf602be6cf52e043c832a46ed521d98f39a4ba6942071fa213e8abd53ba0de1	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-11 18:15:17	2021-04-11 18:15:17	2022-04-11 18:15:17
ef5d149e041c7edb2e0319a7fe84aff68e9b8cdf51d5fd2ebcdf77aac7f17dd0e65d8559237d6f27	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-10-08 06:45:39	2021-10-08 06:45:39	2022-10-08 06:45:39
efe99f4966afe0af9aa045811e9d1b93b03ca9d55bd0dce4933ac6a7535131afad492338a52a2926	342	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-06-09 21:05:51	2021-06-09 21:05:51	2022-06-09 21:05:51
f0214dc0b1f6c23e116dfcf4b902d8dc750d30145bcbd65a6486938fbf97fc1793d83cf13818f46b	500	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-09-16 06:01:45	2021-09-16 06:01:45	2022-09-16 06:01:45
f111e07e4c308acac3929f671249bb33752cb4a7ce5c6120dee129144bf815b7524ae1e34efd850a	530	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-16 19:19:03	2021-06-16 19:19:03	2022-06-16 19:19:03
f120563c4aa4a0edfa9a10e630827eb1139960add11a11f32052f5052d131384fdf0fc537f677b2d	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-12 21:54:06	2021-04-12 21:54:06	2022-04-12 21:54:06
f1befbe486722260cfa86e0705d4098885cd721721d5613f0360b75260e7db16e40d143091916781	116	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-10-13 10:08:16	2021-10-13 10:08:16	2022-10-13 10:08:16
f3ecab5ef0c23151b0a4cc87537535539448e507ff380e5da54529bbe0b3960ffffaa4a045e8c204	533	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-06-07 07:34:22	2021-06-07 07:34:22	2022-06-07 07:34:22
f524b4f1455c2043bc6cf0632367aa5077bfecbbe35ffc01ff5f2eba2eabd4ef71b39574de2d2e8f	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-10 21:39:43	2021-04-10 21:39:43	2022-04-10 21:39:43
f7574253327ac97ca7e7b7054d8e1f899b83ac262daa028b8017038eb2d54b13afeead5550b488d9	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-08-27 06:06:25	2021-08-27 06:06:25	2022-08-27 06:06:25
f7a13dd545f8c8a48be5850f62bbf17d151eeb00ba3bee99e6082f88a55bb3977ea467740b22b458	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-05-17 08:20:51	2021-05-17 08:20:51	2022-05-17 08:20:51
f9c46d9833f2587cee902384438599ea91ac2ef49ae171c9a41de428b25aa162a0a71762597334be	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	0	2021-04-15 15:34:40	2021-04-15 15:34:40	2022-04-15 15:34:40
fac76259acf26bf80171f9891942f85c98afba44750580dad8fa27d7efb8b393b4adc202d5883aa4	376	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-26 08:30:00	2021-04-26 08:30:00	2022-04-26 08:30:00
faf1b8ba914997229f0b9c47d223cc6a54440f38519942bcea7ce474a1b7961c5527553cc110126b	502	931fa389-4f6f-44e9-9c8f-7525be44c142	Personaldala	[]	1	2021-04-09 23:07:41	2021-04-09 23:07:41	2022-04-09 20:07:41
\.


--
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_clients (id, user_id, name, secret, provider, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
931fa389-4f6f-44e9-9c8f-7525be44c142	\N	Laravel Personal Access Client	l7JEnAlHByWKuej4jx0grmYQbuK55SeWbJj4QMAJ	\N	http://localhost	1	0	0	2021-04-05 19:42:49	2021-04-05 19:42:49
931fa389-5708-4ed6-a827-fc2bfffdf352	\N	Laravel Password Grant Client	krQdlbaasH2VCsKYazRvXFWXuML03OzcwIDiTotM	users	http://localhost	0	1	0	2021-04-05 19:42:49	2021-04-05 19:42:49
\.


--
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	931fa389-4f6f-44e9-9c8f-7525be44c142	2021-04-05 19:42:49	2021-04-05 19:42:49
\.


--
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.options (id, type, value, created_at, updated_at) FROM stdin;
1	0	Diploms	2021-04-09 15:19:16	2021-04-09 15:19:16
3	2	P??tera Stu??kas v??rd?? nosaukt?? Latvijas Valsts universit??te	2021-04-09 15:19:16	2021-04-09 15:19:16
4	3		2021-04-09 15:19:16	2021-04-09 15:19:16
5	0	Profesion??l??s kompetences pilnveides dokuments	2021-04-09 15:19:16	2021-04-09 15:19:16
7	2	LU Open Minded	2021-04-09 15:19:16	2021-04-09 15:19:16
8	2	Izgl??t??bas kvalit??tes valsts dienests	2021-04-09 15:19:16	2021-04-09 15:19:16
10	2	Latvijas Universit??te	2021-04-09 15:19:16	2021-04-09 15:19:16
11	1	Vid??j?? profesion??l?? izgl??t??ba	2021-04-09 15:19:16	2021-04-09 15:19:16
12	2	Profesion??l??s izgl??t??bas kompetences centrs "R??gas Valsts tehnikums"	2021-04-09 15:19:16	2021-04-09 15:19:16
13	0	Sertifik??ts	2021-04-09 15:19:16	2021-04-09 15:19:16
14	1	Pirm?? l??me??a profesion??l?? augst??k?? izgl??t??ba	2021-04-09 15:19:16	2021-04-09 15:19:16
15	2	Latvijas Lauksaimniec??bas universit??te	2021-04-09 15:19:16	2021-04-09 15:19:16
16	1	Vid??j?? speci??l?? izgl??t??ba	2021-04-09 15:19:16	2021-04-09 15:19:16
17	2	P. Stradi??a R??gas 2.medic??nas skola	2021-04-09 15:19:16	2021-04-09 15:19:16
18	2	Talsu Valsts ??imn??zija	2021-04-09 15:19:16	2021-04-09 15:19:16
19	2	Master Training	2021-04-09 15:19:16	2021-04-09 15:19:16
20	2	Biedr??ba "M????izgl??t??bas un kult??ras instit??ts VITAE"	2021-04-09 15:19:16	2021-04-09 15:19:16
21	2	Valsts izgl??t??bas satura centrs	2021-04-09 15:19:16	2021-04-09 15:19:16
22	2	R??gas Celtniec??bas koled??a	2021-04-09 15:19:16	2021-04-09 15:19:16
23	2	Ar Darba Sarkan?? Karoga ordeni apbalvotais R??gas Politehniskais instit??ts	2021-04-09 15:19:16	2021-04-09 15:19:16
24	2	AS "Sadales t??kls" M??c??bu centrs	2021-04-09 15:19:16	2021-04-09 15:19:16
25	2	R??gas Aeronavig??cijas instit??ts	2021-04-09 15:19:16	2021-04-09 15:19:16
26	2	R??gas Tehnisk?? universit??te	2021-04-09 15:19:16	2021-04-09 15:19:16
27	2	Latvijas Lauksaimniec??bas universit??tes M????izgl??t??bas centrs	2021-04-09 15:19:16	2021-04-09 15:19:16
28	2	SIA "DIJA" M??c??bu centrs	2021-04-09 15:19:16	2021-04-09 15:19:16
29	2	SIA "KOMERCIZGL??T??BAS CENTRS"	2021-04-09 15:19:16	2021-04-09 15:19:16
30	2	Izgl??t??bas iest??de "Pedago??isk??s meistar??bas skola"	2021-04-09 15:19:16	2021-04-09 15:19:16
31	2	Cargo.LT	2021-04-09 15:19:16	2021-04-09 15:19:16
33	2	R??gas Avi??cijas universit??te	2021-04-09 15:19:16	2021-04-09 15:19:16
34	3	Meh??nikas	2021-04-09 15:19:16	2021-04-09 15:19:16
35	1	Augst??k?? izgl??t??ba	2021-04-09 15:19:16	2021-04-09 15:19:16
36	2	Ar Darba Sarkan?? Karoga ordeni apbalvot?? Latvijas Lauksaimniec??bas akad??mija	2021-04-09 15:19:16	2021-04-09 15:19:16
37	3	Automob????u un automob????u saimniec??bas	2021-04-09 15:19:16	2021-04-09 15:19:16
38	2	Biedr??ba Latvijas profesion??lo autoskolu feder??cija	2021-04-09 15:19:16	2021-04-09 15:19:16
39	0	Atest??ts	2021-04-09 15:19:16	2021-04-09 15:19:16
40	1	Visp??r??j?? vid??j?? izgl??t??ba	2021-04-09 15:19:16	2021-04-09 15:19:16
41	2	Limba??u Jaunie??u un pieaugu??o vakara (mai??u) vidusskola	2021-04-09 15:19:16	2021-04-09 15:19:16
42	2	SIA "Uzdevumi.lv"	2021-04-09 15:19:16	2021-04-09 15:19:16
43	0	Izzi??a	2021-04-09 15:19:16	2021-04-09 15:19:16
44	2	Inter Cars 	2021-04-09 15:19:16	2021-04-09 15:19:16
45	2	R??gas Pedago??ijas un izgl??t??bas vad??bas akad??mija	2021-04-09 15:19:16	2021-04-09 15:19:16
46	2	Daugavpils Universit??te	2021-04-09 15:19:16	2021-04-09 15:19:16
47	2	Valsts Prieku??u lauksaimniec??bas tehnikums	2021-04-09 15:19:16	2021-04-09 15:19:16
48	2	M??c??bu centrs "Likums un uz????m??jdarb??ba"	2021-04-09 15:19:16	2021-04-09 15:19:16
49	2	Saldus tehnikums	2021-04-09 15:19:16	2021-04-09 15:19:16
50	2	"Latvijas Pa??vald??bu m??c??bu centrs"	2021-04-09 15:19:16	2021-04-09 15:19:16
51	2	C??su Valsts ??imn??zija	2021-04-09 15:19:16	2021-04-09 15:19:16
52	2	Profesion??l??s izgl??t??bas kompetences centrs "R??gas Tehnisk?? koled??a"	2021-04-09 15:19:16	2021-04-09 15:19:16
53	2	Latvijas amatniec??bas kamera	2021-04-09 15:19:16	2021-04-09 15:19:16
54	2	Talsu novada Vakara un nekl??tienes vidusskola	2021-04-09 15:19:16	2021-04-09 15:19:16
55	2	Juridisk?? koled??a	2021-04-09 15:19:16	2021-04-09 15:19:16
56	2	Sabiedr??ba ar ierobe??otu atbild??bu "BALTIJAS STARPTAUTISK?? AKAD??MIJA"	2021-04-09 15:19:16	2021-04-09 15:19:16
57	2	L??znavas Profesion??l?? vidusskola	2021-04-09 15:19:16	2021-04-09 15:19:16
58	2	SIA "LATVIKON"	2021-04-09 15:19:16	2021-04-09 15:19:16
59	2	Olaines 1. vidusskola	2021-04-09 15:19:16	2021-04-09 15:19:16
60	2	Ogres tehnikums	2021-04-09 15:19:16	2021-04-09 15:19:16
61	2	Junior Achievement Latvia	2021-04-09 15:19:16	2021-04-09 15:19:16
62	2	SIA "Datorzin??bu centrs"	2021-04-09 15:19:16	2021-04-09 15:19:16
63	2	Jaunatnes starptautisko programmu a??ent??ra	2021-04-09 15:19:17	2021-04-09 15:19:17
64	2	JA Latvia, A Member of JA Worldwide	2021-04-09 15:19:17	2021-04-09 15:19:17
65	2	M??c??bu centrs "Soci??lo Intere??u Instit??ts"	2021-04-09 15:19:17	2021-04-09 15:19:17
66	2	Sabiedr??ba ar ierobe??otu atbild??bu "BALTIJAS DATORU AKAD??MIJA"	2021-04-09 15:19:17	2021-04-09 15:19:17
67	2	Ar Darba Sarkan?? Karoga ordeni apbalvot?? P??tera Stu??kas Latvijas Valsts universit??te	2021-04-09 15:19:17	2021-04-09 15:19:17
68	2	R??gas medic??nas instit??ts	2021-04-09 15:19:17	2021-04-09 15:19:17
69	2	Latvijas Sporta pedago??ijas akad??mija	2021-04-09 15:19:17	2021-04-09 15:19:17
70	2	Latvijas Valsts fizisk??s kult??ras instit??ts	2021-04-09 15:19:17	2021-04-09 15:19:17
71	2	Balvu profesion??l?? un visp??rizgl??tojo???? vidusskola	2021-04-09 15:19:17	2021-04-09 15:19:17
72	2	Balvu Valsts ??imn??zija	2021-04-09 15:19:17	2021-04-09 15:19:17
73	2	Profesion??l??s t??l??kizgl??t??bas un pilnveides izgl??t??bas iest??de "Praktikums"	2021-04-09 15:19:17	2021-04-09 15:19:17
74	2	Latvijas Nacion??l?? bibliot??ka	2021-04-09 15:19:17	2021-04-09 15:19:17
75	2	Daugavpils Pedago??isk?? universit??te	2021-04-09 15:19:17	2021-04-09 15:19:17
76	2	Latvijas Republikas Izgl??t??bas un zin??tnes ministrija	2021-04-09 15:19:17	2021-04-09 15:19:17
77	2	Sabiedr??ba ar ierobe??otu atbild??bu "Latgales m??c??bu centrs"	2021-04-09 15:19:17	2021-04-09 15:19:17
78	2	Kr??slavas Valsts ??imn??zija	2021-04-09 15:19:17	2021-04-09 15:19:17
79	2	Latvijas uz????m??jdarb??bas un mened??menta akad??mija	2021-04-09 15:19:17	2021-04-09 15:19:17
80	2	Sabiedr??ba ar ierobe??otu atbild??bu "Data Experts"	2021-04-09 15:19:17	2021-04-09 15:19:17
81	2	Kr??slavas novada Izgl??t??bas un kult??ras noda??a	2021-04-09 15:19:17	2021-04-09 15:19:17
82	2	SIA "Tellyoustory "	2021-04-09 15:19:17	2021-04-09 15:19:17
83	2	LUMA m??c??bu centrs	2021-04-09 15:19:17	2021-04-09 15:19:17
84	2	Person??la apm??c??bu centrs "Agenda"	2021-04-09 15:19:17	2021-04-09 15:19:17
85	2	Latvijas M??jtur??bas pedagogu biedr??ba	2021-04-09 15:19:17	2021-04-09 15:19:17
86	2	Ar Darba Sarkan?? Karoga ordeni apbalvotais A.Pel??es R??gas Politehniskais instit??ts	2021-04-09 15:19:17	2021-04-09 15:19:17
87	2	50. profesion??li tehnisk?? vidusskola	2021-04-09 15:19:17	2021-04-09 15:19:17
88	2	Liep??jas Universit??te	2021-04-09 15:19:17	2021-04-09 15:19:17
89	2	Laidzes Profesion??l?? vidusskola	2021-04-09 15:19:17	2021-04-09 15:19:17
90	2	Biedr??ba "Siera klubs???	2021-04-09 15:19:17	2021-04-09 15:19:17
91	2	Daugavpils Pedago??iskais instit??ts	2021-04-09 15:19:17	2021-04-09 15:19:17
92	3	Filolo??ijas	2021-04-09 15:19:17	2021-04-09 15:19:17
93	2	LPSR Augst??k??s un vid??j??s speci??l??s izgl??t??bas ministrijas R??gas Pedago??isk?? skola	2021-04-09 15:19:17	2021-04-09 15:19:17
94	2	Balvu pamatskola	2021-04-09 15:19:17	2021-04-09 15:19:17
95	2	SIA "J??nis Roze"	2021-04-09 15:19:17	2021-04-09 15:19:17
96	2	PEARSON Longman Training Department	2021-04-09 15:19:17	2021-04-09 15:19:17
97	2	Izdevniec??ba Oxford University Press	2021-04-09 15:19:17	2021-04-09 15:19:17
98	3	R??gas pils??tas Poligr??fijas m??kslas profesion??li tehnisk?? vidusskola	2021-04-09 15:19:17	2021-04-09 15:19:17
99	2	ITC - International TEFL	2021-04-09 15:19:17	2021-04-09 15:19:17
100	2	Izgl??t??bas un zin??tnes ministrija	2021-04-09 15:19:17	2021-04-09 15:19:17
102	2	Latvijas Republikas Satiksmes ministrija	2021-04-09 15:19:17	2021-04-09 15:19:17
103	2	Visp??r??j??s izgl??t??bas kvalit??tes nov??rt????anas valsts a??ent??ra	2021-04-09 15:19:17	2021-04-09 15:19:17
104	3	Teolo??ijas fakult??te	2021-04-09 15:19:17	2021-04-09 15:19:17
105	2	"Latvijas Pa??vald??bu m??c??bu centrs" (LPMC)	2021-04-09 15:19:17	2021-04-09 15:19:17
106	3	V??stures	2021-04-09 15:19:17	2021-04-09 15:19:17
107	2	R??gas 2.pedago??isk?? skola	2021-04-09 15:19:18	2021-04-09 15:19:18
108	3	Fizisk?? kult??ra	2021-04-09 15:19:18	2021-04-09 15:19:18
109	2	Siguldas Valsts ??imn??zija	2021-04-09 15:19:18	2021-04-09 15:19:18
110	2	Profesion??l??s t??l??kizgl??t??bas un pilnveides izgl??t??bas iest??de "Lielv??rds Kompetences centrs"	2021-04-09 15:19:18	2021-04-09 15:19:18
111	2	SIA "Izgl??t??bas sist??mas" (e-klase)	2021-04-09 15:19:18	2021-04-09 15:19:18
112	2	Talsu 2. vidusskola	2021-04-09 15:19:18	2021-04-09 15:19:18
113	2	SIA "Partneri un Pakalpojumi"	2021-04-09 15:19:18	2021-04-09 15:19:18
114	2	Treneru skola	2021-04-09 15:19:18	2021-04-09 15:19:18
115	2	Profesion??l??s pilnveides un profesion??l??s t??l??kizgl??t??bas iest??de BVK	2021-04-09 15:19:18	2021-04-09 15:19:18
116	2	B??rnu un jaunie??u centrs "Laim??te"	2021-04-09 15:19:18	2021-04-09 15:19:18
117	2	R??gas Izgl??t??bas un informat??vi metodiskais centrs (RIIMC)	2021-04-09 15:19:18	2021-04-09 15:19:18
118	2	R??gas M??kslas un mediju tehnikums	2021-04-09 15:19:18	2021-04-09 15:19:18
119	2	Baltijas Datoru Akad??mija	2021-04-09 15:19:18	2021-04-09 15:19:18
120	2	SIA "Baltijas Datoru akad??mija"	2021-04-09 15:19:18	2021-04-09 15:19:18
121	2	Valsts Izgl??t??bas att??st??bas a??ent??ra	2021-04-09 15:19:18	2021-04-09 15:19:18
124	1	Otr?? l??me??a profesion??l?? augst??k?? izgl??t??ba	2021-04-09 15:19:18	2021-04-09 15:19:18
125	2	Liep??jas Pedago??ijas akad??mija	2021-04-09 15:19:18	2021-04-09 15:19:18
126	2	Limba??u 3. vidusskola	2021-04-09 15:19:18	2021-04-09 15:19:18
127	2	Sabiedr??ba ar ierobe??otu atbild??bu "Izgl??t??bas un att??st??bas centrs "EGO""	2021-04-09 15:19:18	2021-04-09 15:19:18
128	2	R??gas Valsts tehnikums	2021-04-09 15:19:18	2021-04-09 15:19:18
129	3	Ener????tikas un elektrotehnikas fakult??te	2021-04-09 15:19:18	2021-04-09 15:19:18
130	2	Jelgavas Tehnikums	2021-04-09 15:19:18	2021-04-09 15:19:18
131	2	Liep??jas Valsts tehnikums	2021-04-09 15:19:18	2021-04-09 15:19:18
132	2	Kandavas Lauksaimniec??bas tehnikums	2021-04-09 15:19:18	2021-04-09 15:19:18
133	3	Pedago??ijas un psiholo??ijas instit??ts	2021-04-09 15:19:18	2021-04-09 15:19:18
134	3	Pedago??ijas un psiholo??ijas fakult??te	2021-04-09 15:19:18	2021-04-09 15:19:18
135	3	Ekonomikas fakult??te	2021-04-09 15:19:18	2021-04-09 15:19:18
136	2	Latvijas PSR Augst??k??s un vid??j??s speci??l??s izgl??t??bas ministrijas Republikas padomju tirdzniec??bas tehnikums	2021-04-09 15:19:18	2021-04-09 15:19:18
137	2	Sia Freko	2021-04-09 15:19:18	2021-04-09 15:19:18
138	2	Latvijas Banka	2021-04-09 15:19:18	2021-04-09 15:19:18
139	2	Banku augstskola	2021-04-09 15:19:18	2021-04-09 15:19:18
140	2	SIA "Latgales m??c??bu centrs"	2021-04-09 15:19:18	2021-04-09 15:19:18
141	2	Latvijas Pi??u un mui??u asoci??cija	2021-04-09 15:19:18	2021-04-09 15:19:18
142	2	Latvijas Okup??cijas muzejs	2021-04-09 15:19:18	2021-04-09 15:19:18
143	3	Fizikas fakult??te	2021-04-09 15:19:18	2021-04-09 15:19:18
144	2	Profesion??l??s t??l??kizgl??t??bas un pilnveides izgl??t??bas iest??de "Dro??am darbam"	2021-04-09 15:19:18	2021-04-09 15:19:18
145	2	Latvijas Krist??go skolot??ju asoci??cija	2021-04-09 15:19:18	2021-04-09 15:19:18
146	2	Latvijas Nacion??lais m??kslas muzejs	2021-04-09 15:19:18	2021-04-09 15:19:18
147	2	AS Antalis	2021-04-09 15:19:18	2021-04-09 15:19:18
148	3	Humanit??rais instit??ts	2021-04-09 15:19:18	2021-04-09 15:19:18
149	2	Maskavas izdevniec??bas Poligr??fijas tehnikums	2021-04-09 15:19:18	2021-04-09 15:19:18
150	1	Arodizgl??t??ba	2021-04-09 15:19:18	2021-04-09 15:19:18
151	2	5. pils??tas profesion??li tehnisk?? poligr??fijas m??kslas skola	2021-04-09 15:19:18	2021-04-09 15:19:18
152	2	SIA "Saint-tech"	2021-04-09 15:19:18	2021-04-09 15:19:18
153	2	R??gas 9. vakara (mai??u) vidusskola	2021-04-09 15:19:19	2021-04-09 15:19:19
154	2	J??rmalas Valsts ??imn??zija	2021-04-09 15:19:19	2021-04-09 15:19:19
155	2	Daugavpils dzelzce??a transporta tehnikums	2021-04-09 15:19:19	2021-04-09 15:19:19
156	2	Speci??l?? pils??tas profesion??li tehnisk?? dzelzce??nieku vidusskola Nr. 11	2021-04-09 15:19:19	2021-04-09 15:19:19
157	2	Jelgavas Amatniec??bas vidusskola	2021-04-09 15:19:19	2021-04-09 15:19:19
158	2	Sv??tes pamatskola	2021-04-09 15:19:19	2021-04-09 15:19:19
159	2	Latvijas Republikas Vesel??bas ministrija	2021-04-09 15:19:19	2021-04-09 15:19:19
160	3	Autom??tikas un skait??o??anas tehnikas fakult??te	2021-04-09 15:19:19	2021-04-09 15:19:19
161	2	Latvijas Nacion??lais Kult??ras centrs	2021-04-09 15:19:19	2021-04-09 15:19:19
162	3	R??zeknes augstskola	2021-04-09 15:19:19	2021-04-09 15:19:19
163	2	Erasmus+	2021-04-09 15:19:19	2021-04-09 15:19:19
164	2	SIA ???Baltijas Datoru akad??mija???	2021-04-09 15:19:19	2021-04-09 15:19:19
165	2	Akad??misk??s inform??cijas centrs	2021-04-09 15:19:19	2021-04-09 15:19:19
166	2	Inform??cijas tehnolo??iju dro????bas incidentu nov??r??anas instit??cija CERT.LV	2021-04-09 15:19:19	2021-04-09 15:19:19
167	2	Valsts administr??cijas skola	2021-04-09 15:19:19	2021-04-09 15:19:19
168	2	Nodok??u likumdo??anas izgl??t??bas centrs	2021-04-09 15:19:19	2021-04-09 15:19:19
169	2	"Komplekss Citadele" SIA Profesion??lo Studiju Skola "Citadele"	2021-04-09 15:19:19	2021-04-09 15:19:19
170	2	M??c??bu centrs "Person??ls"	2021-04-09 15:19:19	2021-04-09 15:19:19
171	2	Soci??l??s integr??cijas valsts a??ent??ra	2021-04-09 15:19:19	2021-04-09 15:19:19
172	3	Pedago??ijas, psiholo??ijas un m??kslas fakult??te	2021-04-09 15:19:19	2021-04-09 15:19:19
173	2	Profesion??l??s t??l??kizgl??t??bas un pilnveides izgl??t??bas iest??de "ATBALSTS"	2021-04-09 15:19:19	2021-04-09 15:19:19
174	2	Polish Erasmus+ National Agency (Polijas Erasmus+ a??ent??ra)	2021-04-09 15:19:19	2021-04-09 15:19:19
175	2	Daugavpils universit??tes Profesion??l??s izaugsmes centrs	2021-04-09 15:19:19	2021-04-09 15:19:19
176	2	R??zeknes Tehnolo??iju akad??mija	2021-04-09 15:19:19	2021-04-09 15:19:19
177	2	Vad??bas un soci??l?? darba augstskola "Att??st??ba" SIA	2021-04-09 15:19:19	2021-04-09 15:19:19
178	3	Filolo??ijas fakult??te	2021-04-09 15:19:19	2021-04-09 15:19:19
179	2	Transporta un sakaru instit??ts	2021-04-09 15:19:19	2021-04-09 15:19:19
180	2	R??gas Tehnisk??s universit??tes Liep??jas fili??les profesion??l?? vidusskola	2021-04-09 15:19:19	2021-04-09 15:19:19
181	3	Liep??jas MZTK	2021-04-09 15:19:19	2021-04-09 15:19:19
182	2	Sabiedr??ba ar ierobe??otu atbild??bu "Profesion??l??s izgl??t??bas, t??l??kizgl??t??bas un eksamin??cijas centrs"	2021-04-09 15:19:19	2021-04-09 15:19:19
183	2	Ogres 1. vidusskola	2021-04-09 15:19:19	2021-04-09 15:19:19
184	2	Ma????nb??ves un met??lapstr??des r??pniec??bas asoci??cija	2021-04-09 15:19:20	2021-04-09 15:19:20
185	2	Zemgales re??iona Kompeten??u att??st??bas centrs	2021-04-09 15:19:20	2021-04-09 15:19:20
186	2	AHK V??cijas-Baltijas Tirdzniec??bas kamera	2021-04-09 15:19:20	2021-04-09 15:19:20
187	2	SIA Infleks	2021-04-09 15:19:20	2021-04-09 15:19:20
188	2	SIA Instro	2021-04-09 15:19:20	2021-04-09 15:19:20
189	3	fizikas un matem??tikas fakult??te	2021-04-09 15:19:20	2021-04-09 15:19:20
190	2	R??gas 88. vidusskola	2021-04-09 15:19:20	2021-04-09 15:19:20
191	2	Izgl??t??bas satura un eksamin??cijas centrs	2021-04-09 15:19:20	2021-04-09 15:19:20
192	2	Biznesa, m??kslas un tehnolo??iju augstskola "RISEBA"	2021-04-09 15:19:20	2021-04-09 15:19:20
193	2	R??gas 1. pamatskola-att??st??bas centrs	2021-04-09 15:19:20	2021-04-09 15:19:20
194	3	Auto noda??a	2021-04-09 15:19:20	2021-04-09 15:19:20
195	2	"Moto Remo"	2021-04-09 15:19:20	2021-04-09 15:19:20
196	2	V.L????a Liep??jas Valsts pedago??iskais instit??ts	2021-04-09 15:19:20	2021-04-09 15:19:20
197	2	Kuld??gas Tehnolo??iju un t??risma tehnikums	2021-04-09 15:19:20	2021-04-09 15:19:20
198	2	Latvijas Sporta feder??ciju padomes Sporta speci??listu sertifik??cijas komisija	2021-04-09 15:19:20	2021-04-09 15:19:20
199	2	Biedr??ba "Latvijas Sporta feder??ciju padome"	2021-04-09 15:19:20	2021-04-09 15:19:20
200	2	Baltkrievijas Valsts Darba sarkan?? orde??a fizisk??s kult??ras instit??ts	2021-04-09 15:19:20	2021-04-09 15:19:20
201	3	Filalo??ijas fakult??te	2021-04-09 15:19:20	2021-04-09 15:19:20
202	3	Soci??lo zin??t??u fakult??te	2021-04-09 15:19:20	2021-04-09 15:19:20
203	2	R??gas Kult??ras un izgl??t??bas darbinieku tehnikums	2021-04-09 15:19:20	2021-04-09 15:19:20
204	2	R??gas Tehnisk?? universit??te humanit??rais instit??ts	2021-04-09 15:19:20	2021-04-09 15:19:20
205	2	Eiropas T??lm??c??bas vidusskola	2021-04-09 15:19:20	2021-04-09 15:19:20
206	2	Auces novada Pieaugu??o izgl??t??bas un inform??cijas centrs	2021-04-09 15:19:20	2021-04-09 15:19:20
207	2	Latvijas Universit??tes Starpnozaru izgl??t??bas inov??ciju centrs	2021-04-09 15:19:20	2021-04-09 15:19:20
208	2	Latgales psiholo??isk??s pal??dz??bas centrs "Valentia"	2021-04-09 15:19:20	2021-04-09 15:19:20
209	3	5. profesion??li tehnisk?? poligr??fijas m??kslas vidusskola	2021-04-09 15:19:20	2021-04-09 15:19:20
210	2	SIA Poligr??fijas infocentrs	2021-04-09 15:19:20	2021-04-09 15:19:20
211	2	??e??ingradas Dzelzce??a transporta in??enieru instit??ts 	2021-04-09 15:19:20	2021-04-09 15:19:20
212	2	R??gas Dzelzce??a transporta tehnikums	2021-04-09 15:19:20	2021-04-09 15:19:20
213	2	Pieaugu??o neform??l??s izgl??t??bas iest??de "Att??st??bas centrs "TEMPS""	2021-04-09 15:19:20	2021-04-09 15:19:20
214	2	R??gas Valsts klasisk?? ??imn??zija	2021-04-09 15:19:20	2021-04-09 15:19:20
215	2	Ekonomikas un kult??ras augstskola	2021-04-09 15:19:20	2021-04-09 15:19:20
216	2	Latvie??u valodas a??ent??ra	2021-04-09 15:19:20	2021-04-09 15:19:20
217	2	R??gas Stradi??a universit??te	2021-04-09 15:19:20	2021-04-09 15:19:20
218	2	Valsts sabiedr??ba ar ierobe??otu atbild??bu "R??gas T??risma un rado????s industrijas tehnikums"	2021-04-09 15:19:20	2021-04-09 15:19:20
219	2	Daugavpils tehnikums	2021-04-09 15:19:20	2021-04-09 15:19:20
220	2	Vi????as Dzelzce??a transporta tehnikums	2021-04-09 15:19:21	2021-04-09 15:19:21
221	2	Profesion??l??s izgl??t??bas kompetences centra "R??gas Tehnisk?? koled??a" Liep??jas fili??le	2021-04-09 15:19:21	2021-04-09 15:19:21
222	3	B??vniec??bas fakult??te	2021-04-09 15:19:21	2021-04-09 15:19:21
223	2	R??gas Rai??a 8. vakara (mai??u) vidusskola	2021-04-09 15:19:21	2021-04-09 15:19:21
224	3	fizikas un matem??tikas	2021-04-09 15:19:21	2021-04-09 15:19:21
225	2	Kr??slavas pamatskola	2021-04-09 15:19:21	2021-04-09 15:19:21
226	2	Pieaugu??o izgl??t??bas iest??de "DZM"	2021-04-09 15:19:21	2021-04-09 15:19:21
227	3	Ma????nb??ves	2021-04-09 15:19:21	2021-04-09 15:19:21
228	2	Latvijas Fizikas skolot??ju asoci??cija	2021-04-09 15:19:21	2021-04-09 15:19:21
229	2	Ventspils Tehnikums	2021-04-09 15:19:21	2021-04-09 15:19:21
230	2	Profesora Bon??a-Bruj??vi??a v??rd?? nosauktais ??e??ingradas elektrotehniskais sakaru instit??ts 	2021-04-09 15:19:21	2021-04-09 15:19:21
231	2	Latvijas atv??rto tehnolo??iju asoci??cija	2021-04-09 15:19:21	2021-04-09 15:19:21
232	3	pamatskolas pedago??ika un metodika	2021-04-09 15:19:21	2021-04-09 15:19:21
233	2	Limba??u galven?? bibliot??ka	2021-04-09 15:19:21	2021-04-09 15:19:21
234	2	Kult??ras inform??cijas sist??mu centrs	2021-04-09 15:19:21	2021-04-09 15:19:21
235	2	"Narmadas Tautskola"	2021-04-09 15:19:21	2021-04-09 15:19:21
236	2	R??gas izgl??t??bas un informat??vi metodiskais centrs	2021-04-09 15:19:21	2021-04-09 15:19:21
237	2	SIA "Funditus"	2021-04-09 15:19:21	2021-04-09 15:19:21
238	2	Biznesa augstskola Tur??ba	2021-04-09 15:19:21	2021-04-09 15:19:21
239	3	Pedago??ijas un psiholo??ijas	2021-04-09 15:19:21	2021-04-09 15:19:21
240	3	Pedago??ijas	2021-04-09 15:19:21	2021-04-09 15:19:21
241	2	Katholiek Onderwijs Vlaanderen	2021-04-09 15:19:21	2021-04-09 15:19:21
242	2	N.K.Krupskas ??eningradas Valsts kult??ras instit??ts	2021-04-09 15:19:21	2021-04-09 15:19:21
243	3	Transporta un ma????nzin??bu fakult??te	2021-04-09 15:19:21	2021-04-09 15:19:21
244	2	Alojas Ausek??a vidusskola	2021-04-09 15:19:22	2021-04-09 15:19:22
245	2	R??gas 1. T??lm??c??bas vidusskola	2021-04-09 15:19:22	2021-04-09 15:19:22
246	2	Neform??l??s izgl??t??bas un valodu centrs "MIRTE"	2021-04-09 15:19:22	2021-04-09 15:19:22
247	2	Profesion??l??s pilnveides un t??l??kizgl??t??bas iest??de "MIERVIDI"	2021-04-09 15:19:22	2021-04-09 15:19:22
248	3	Pedago??ijas un psiholo??ijas  fakult??te	2021-04-09 15:19:22	2021-04-09 15:19:22
249	2	Malnavas koled??a	2021-04-09 15:19:22	2021-04-09 15:19:22
250	2	R??gas 61. vidusskola	2021-04-09 15:19:22	2021-04-09 15:19:22
251	2	Sanktp??terburgas  Akmeolo??ijas akad??mija	2021-04-09 15:19:22	2021-04-09 15:19:22
252	3	Pedago??ijas un skolvad??bas fakult??te	2021-04-09 15:19:22	2021-04-09 15:19:22
253	3	Psiholo??ijas katedra	2021-04-09 15:19:22	2021-04-09 15:19:22
254	2	R??gas Skolot??ju instit??ts	2021-04-09 15:19:22	2021-04-09 15:19:22
255	2	Pieaugu??o izgl??t??bas iest??de "Rado??uma pils"	2021-04-09 15:19:22	2021-04-09 15:19:22
256	2	Vesel??bas ministrijas Neatliekam??s medic??nisk??s pal??dz??bas dienests	2021-04-09 15:19:22	2021-04-09 15:19:22
257	2	Latvijas M??kslas akad??mija	2021-04-09 15:19:22	2021-04-09 15:19:22
258	2	Goethe Institut Riga	2021-04-09 15:19:22	2021-04-09 15:19:22
259	2	R??gas 5.arodvidusskola	2021-04-09 15:19:22	2021-04-09 15:19:22
260	2	Latvijas Inform??cijas tehnolo??iju un Telekomunik??ciju asoci??cija (LITTA)	2021-04-09 15:19:22	2021-04-09 15:19:22
261	2	M??c??bu centrs "BUTS"	2021-04-09 15:19:22	2021-04-09 15:19:22
262	2	Rug??ju novada vidusskola	2021-04-09 15:19:22	2021-04-09 15:19:22
263	0	Diploms - piel??dzin??ts	2021-04-09 15:19:22	2021-04-09 15:19:22
264	2	Nodibin??jums "Akad??misk??s inform??cijas centrs???	2021-04-09 15:19:22	2021-04-09 15:19:22
265	2	Inform??cijas sist??mu mened??menta augstskola	2021-04-09 15:19:22	2021-04-09 15:19:22
266	2	Smiltenes tehnikums	2021-04-09 15:19:22	2021-04-09 15:19:22
267	2	Sabiedr??ba ar ierobe??otu atbild??bu "ALBERTA KOLED??A"	2021-04-09 15:19:22	2021-04-09 15:19:22
268	2	LIKTA (Latvian Information and Communications Technology Association) 	2021-04-09 15:19:22	2021-04-09 15:19:22
269	2	Biedr??ba "Latvijas Samarie??u apvien??ba"	2021-04-09 15:19:22	2021-04-09 15:19:22
270	3	fizikas,matem??tikas	2021-04-09 15:19:22	2021-04-09 15:19:22
271	2	Vides izgl??t??bas fonds	2021-04-09 15:19:22	2021-04-09 15:19:22
272	2	R??gas Pedago??ijas un izgl??t??bas vad??bas augstskola	2021-04-09 15:19:22	2021-04-09 15:19:22
273	2	SIA "Latvijas Lauku konsult??ciju un izgl??t??bas centrs"	2021-04-09 15:19:22	2021-04-09 15:19:22
274	2	Latvijas invest??ciju un att??st??bas a??ent??ra	2021-04-09 15:19:22	2021-04-09 15:19:22
275	2	A.M.Gorkija v??rd?? nosauktais Kijevas Valsts pedago??iskais instit??ts	2021-04-09 15:19:22	2021-04-09 15:19:22
276	2	Linda Ostrovska, Re??. Nr. 04047011355	2021-04-09 15:19:23	2021-04-09 15:19:23
277	2	SIA "Akt??v?? t??risma centrs E??I"	2021-04-09 15:19:23	2021-04-09 15:19:23
278	2	Baldones vidusskola	2021-04-09 15:19:23	2021-04-09 15:19:23
279	3	Humanit??r??	2021-04-09 15:19:23	2021-04-09 15:19:23
280	2	Baltijas Mediju izcil??bas centrs	2021-04-09 15:19:23	2021-04-09 15:19:23
281	2	R??zeknes augstskola	2021-04-09 15:19:23	2021-04-09 15:19:23
282	3	Pedago??ijas fakult??te	2021-04-09 15:19:23	2021-04-09 15:19:23
283	2	G??tes instit??ts R??g??	2021-04-09 15:19:23	2021-04-09 15:19:23
284	2	Intere??u izgl??t??bas iest??de "M??cies IT"	2021-04-09 15:19:23	2021-04-09 15:19:23
285	2	Latvijas v??cu valodas skolot??ju asoci??cija	2021-04-09 15:19:23	2021-04-09 15:19:23
286	2	Deutsche Auslandsgesellschaft	2021-04-09 15:19:23	2021-04-09 15:19:23
287	2	Sabiedr??ba ar ierobe??otu atbild??bu "EuroFortis"	2021-04-09 15:19:23	2021-04-09 15:19:23
288	2	R??gas izgl??t??bas informat??vi metodiskais centrs	2021-04-09 15:19:23	2021-04-09 15:19:23
289	2	R??gas 5. pamatskola-att??st??bas centrs	2021-04-09 15:19:23	2021-04-09 15:19:23
290	3	psiholo??ijas fakult??te	2021-04-09 15:19:23	2021-04-09 15:19:23
291	2	Psihologu sertifik??cijas padome	2021-04-09 15:19:23	2021-04-09 15:19:23
292	2	Profesion??l??s pilnveides izgl??t??bas iest??de "Psiholo??ijas centrs"	2021-04-09 15:19:23	2021-04-09 15:19:23
293	2	Praktisk??s psiholo??ijas instit??ts "Imaton"	2021-04-09 15:19:23	2021-04-09 15:19:23
294	2	R??gas Centra dai??amatniec??bas pamatskola	2021-04-09 15:19:23	2021-04-09 15:19:23
295	0	Sporta speci??lista sertifik??ts	2021-04-09 15:19:23	2021-04-09 15:19:23
296	2	Sporta speci??listu sertifik??cijas komisija	2021-04-09 15:19:23	2021-04-09 15:19:23
297	2	Latvijas Skolu sporta izgl??t??bas centrs	2021-04-09 15:19:23	2021-04-09 15:19:23
298	2	Latvijas skolu sporta feder??cija	2021-04-09 15:19:23	2021-04-09 15:19:23
299	3	Vad??bas un ekonomikas inform??tikas fakult??te	2021-04-09 15:19:24	2021-04-09 15:19:24
300	2	Izgl??t??bas iniciat??vu centrs	2021-04-09 15:19:24	2021-04-09 15:19:24
301	2	Rasmas Urt??nes priv??tprakse	2021-04-09 15:19:24	2021-04-09 15:19:24
302	2	Latvijas Pa??vald??bu m??c??bu centrs	2021-04-09 15:19:24	2021-04-09 15:19:24
303	3	Humanit??ro zin??t??u	2021-04-09 15:19:24	2021-04-09 15:19:24
304	2	Vidzemes Tehnolo??iju un dizaina tehnikums	2021-04-09 15:19:24	2021-04-09 15:19:24
305	2	R??gas pils??tas profesion??li tehnisk?? vidusskola Nr.19	2021-04-09 15:19:24	2021-04-09 15:19:24
306	2	R??gas Izgl??t??bas Inform??cijas metodiskais centrs	2021-04-09 15:19:24	2021-04-09 15:19:24
307	2	Liep??jas pedago??ijas augstskola	2021-04-09 15:19:24	2021-04-09 15:19:24
308	2	R??zeknes augstskolas m????izgl??t??bas centrs	2021-04-09 15:19:24	2021-04-09 15:19:24
309	2	R??gas Juglas vidusskola	2021-04-09 15:19:24	2021-04-09 15:19:24
310	2	Vad??bas koled??a	2021-04-09 15:19:24	2021-04-09 15:19:24
311	2	Valsts Kandavas lauksaimniec??bas tehnikums	2021-04-09 15:19:24	2021-04-09 15:19:24
312	2	SIA "Kvadriga"	2021-04-09 15:19:24	2021-04-09 15:19:24
313	2	A/s "Datorzin??bu centrs" M??c??bu centrs	2021-04-09 15:19:24	2021-04-09 15:19:24
314	2	Tukuma novada speci??l??s izgl??t??bas iest??de	2021-04-09 15:19:24	2021-04-09 15:19:24
315	2	Izdevniec??bas "LIELV??RDS" T??l??kizgl??t??bas centrs	2021-04-09 15:19:24	2021-04-09 15:19:24
316	2	Riga Tech Girls	2021-04-09 15:19:24	2021-04-09 15:19:24
317	2	SIA "TA GROUP"	2021-04-09 15:19:24	2021-04-09 15:19:24
318	2	R??gas Valsts 2. ??imn??zija	2021-04-09 15:19:24	2021-04-09 15:19:24
319	2	J??zepa V??tola Latvijas M??zikas akad??mija	2021-04-09 15:19:24	2021-04-09 15:19:24
320	2	J??zepa V??tola Latvijas Valsts konservatorija	2021-04-09 15:19:24	2021-04-09 15:19:24
321	2	Tukuma profesion??l??s t??l??kizgl??t??bas un profesion??l??s pilnveides izgl??t??bas iest??de	2021-04-09 15:19:24	2021-04-09 15:19:24
322	2	M??c??bu centrs "MBR" SIA	2021-04-09 15:19:25	2021-04-09 15:19:25
323	2	Profesion??l??s izgl??t??bas kompetences centra "R??gas Tehnisk?? koled??a" Prieku??u fili??le	2021-04-09 15:19:25	2021-04-09 15:19:25
324	3	Sve??valodu fakult??te	2021-04-09 15:19:25	2021-04-09 15:19:25
325	2	Express Publishing	2021-04-09 15:19:25	2021-04-09 15:19:25
326	2	B??rnu un jaunie??u centrs "R??gas Skol??nu pils"	2021-04-09 15:19:25	2021-04-09 15:19:25
327	2	R??gas Volejbola skola	2021-04-09 15:19:25	2021-04-09 15:19:25
328	2	Latvijas Volejbola feder??cija	2021-04-09 15:19:25	2021-04-09 15:19:25
329	3	In??enieru fakult??te	2021-04-09 15:19:25	2021-04-09 15:19:25
330	2	Robotu skola	2021-04-09 15:19:25	2021-04-09 15:19:25
331	2	R??gas Starptautisk?? ekonomikas un biznesa administr??cijas augstskola	2021-04-09 15:19:25	2021-04-09 15:19:25
332	2	Latvijas PSR Kult??ras ministrijas R??zeknes lieti??????s m??kslas vidusskola	2021-04-09 15:19:25	2021-04-09 15:19:25
333	2	Dagdas vidusskola	2021-04-09 15:19:25	2021-04-09 15:19:25
334	2	Biedr??ba "Izgl??t??bas iniciat??vu centrs"	2021-04-09 15:19:25	2021-04-09 15:19:25
335	2	Daugavpils B??vniec??bas tehnikums	2021-04-09 15:19:25	2021-04-09 15:19:25
336	2	R??zeknes tehnikums 	2021-04-09 15:19:25	2021-04-09 15:19:25
337	2	Dataliner AB	2021-04-09 15:19:25	2021-04-09 15:19:25
338	3	Valsts izgl??t??bas satura centrs	2021-04-09 15:19:25	2021-04-09 15:19:25
339	2	Ideju un inov??ciju instit??ts	2021-04-09 15:19:25	2021-04-09 15:19:25
340	2	Dabas aizsardz??bas p??rvalde	2021-04-09 15:19:25	2021-04-09 15:19:25
341	2	R??gas Jauno tehni??u centrs	2021-04-09 15:19:25	2021-04-09 15:19:25
342	2	B??rnu un jaunie??u centrs R??gas Skol??nu pils	2021-04-09 15:19:25	2021-04-09 15:19:25
343	2	Sp??res intern??tpamatskola	2021-04-09 15:19:25	2021-04-09 15:19:25
344	2	Jaunpiebalgas M??zikas un m??kslas skola	2021-04-09 15:19:25	2021-04-09 15:19:25
345	2	Blomes pamatskola	2021-04-09 15:19:25	2021-04-09 15:19:25
346	2	C??su pils??tas Pastari??a s??kumskola	2021-04-09 15:19:25	2021-04-09 15:19:25
347	2	R??gas Valsts 1. ??imn??zija	2021-04-09 15:19:25	2021-04-09 15:19:25
348	2	Latvijas Sporta medic??nas asoci??cija	2021-04-09 15:19:25	2021-04-09 15:19:25
349	2	Latvijas vieglatl??tikas savien??ba	2021-04-09 15:19:25	2021-04-09 15:19:25
350	2	Maskavas Valsts industri??l?? universit??te	2021-04-09 15:19:25	2021-04-09 15:19:25
351	2	Biedr??ba "Metacognio"	2021-04-09 15:19:25	2021-04-09 15:19:25
352	2	Latvijas Basketbola savien??ba	2021-04-09 15:19:26	2021-04-09 15:19:26
353	2	SIA "L??ksnas nams" m??c??bu un kvalifik??cijas centrs	2021-04-09 15:19:26	2021-04-09 15:19:26
354	3	Moderno valodu fakult??te	2021-04-09 15:19:26	2021-04-09 15:19:26
355	2	Baltijas psiholo??ijas un mened??menta augstskola	2021-04-09 15:19:26	2021-04-09 15:19:26
356	2	Psiholo??ijas augstskola	2021-04-09 15:19:26	2021-04-09 15:19:26
357	2	SIA "Zin??bu Cietoksnis"	2021-04-09 15:19:26	2021-04-09 15:19:26
358	2	Latvijas inform??cijas un komunik??cijas tehnolo??iju asoci??cija	2021-04-09 15:19:26	2021-04-09 15:19:26
359	2	Kurzemes NVO atbalsta centrs	2021-04-09 15:19:26	2021-04-09 15:19:26
360	2	Talsu novada pa??vald??ba	2021-04-09 15:19:26	2021-04-09 15:19:26
361	2	Poligr??fijas tehnisk??s Jaunrades Tautas universit??te	2021-04-09 15:19:26	2021-04-09 15:19:26
362	2	Always Learning Pearson Training Departament	2021-04-09 15:19:26	2021-04-09 15:19:26
363	2	British Council (Britu padome)	2021-04-09 15:19:26	2021-04-09 15:19:26
364	2	Draudz??g?? Aicin??juma C??su Valsts ??imn??zija	2021-04-09 15:19:26	2021-04-09 15:19:26
365	2	Ida-Virumaa Vocational Centre	2021-04-09 15:19:26	2021-04-09 15:19:26
366	2	Sanktp??terburgas Speci??l??s pedago??ijas un psiholo??ijas instit??ts	2021-04-09 15:19:26	2021-04-09 15:19:26
367	2	Pieaugu??o neform??l??s izgl??t??bas centrs "Azote"	2021-04-09 15:19:26	2021-04-09 15:19:26
368	2	Vecbebru sovhoztehnikums	2021-04-09 15:19:27	2021-04-09 15:19:27
369	3	In??enierekonomikas fakult??te	2021-04-09 15:19:27	2021-04-09 15:19:27
370	3	Ekonomikas un vad??bas fakult??te	2021-04-09 15:19:27	2021-04-09 15:19:27
371	2	Pieaugu??o neform??l??s izgl??t??bas iest??de "BILANCES AKAD??MIJA"	2021-04-09 15:19:27	2021-04-09 15:19:27
372	2	R??gas Imantas vidusskola	2021-04-09 15:19:27	2021-04-09 15:19:27
373	3	Krievu valodas un literat??ras	2021-04-09 15:19:27	2021-04-09 15:19:27
374	2	Ar Darba Sarkan?? Ordeni apbalvotais R??gas Politehniskais instit??ts	2021-04-09 15:19:27	2021-04-09 15:19:27
375	2	M??c??bu centrs "PREVENTA"	2021-04-09 15:19:27	2021-04-09 15:19:27
376	2	R??gas Dzelzce??nieku skola	2021-04-09 15:19:27	2021-04-09 15:19:27
377	2	R??gas Valsts 3. ??imn??zija	2021-04-09 15:19:27	2021-04-09 15:19:27
378	2	Krievijas Feder??cijas izgl??t??bas un zin??tnes ministrija	2021-04-09 15:19:27	2021-04-09 15:19:27
379	2	Pleskavas Valsts Universit??te	2021-04-09 15:19:27	2021-04-09 15:19:27
380	2	Biedr??ba "Latvijas ????mijas skolot??ju asoci??cija"	2021-04-09 15:19:27	2021-04-09 15:19:27
381	2	R??gas Pedago??iskais instit??ts	2021-04-09 15:19:27	2021-04-09 15:19:27
382	2	SIA "Lattelecom"	2021-04-09 15:19:27	2021-04-09 15:19:27
383	3	Biolo??ijas un ????mijas	2021-04-09 15:19:28	2021-04-09 15:19:28
384	2	ESF	2021-04-09 15:19:28	2021-04-09 15:19:28
385	2	R??gas Domes Izgl??t??bas jaunatnes un sporta departaments	2021-04-09 15:19:28	2021-04-09 15:19:28
386	2	Biedr??ba "Papardes zieds"	2021-04-09 15:19:28	2021-04-09 15:19:28
387	2	Latvijas Republikas Satiksmes birojs	2021-04-09 15:19:28	2021-04-09 15:19:28
388	2	R??gas 25. vidusskola	2021-04-09 15:19:28	2021-04-09 15:19:28
389	2	Vidzemes Augstskola	2021-04-09 15:19:28	2021-04-09 15:19:28
390	2	Me??a un koksnes produktu p??tniec??bas un att??st??bas instit??ts	2021-04-09 15:19:28	2021-04-09 15:19:28
391	2	R??gas Anni??mui??as vidusskola	2021-04-09 15:19:28	2021-04-09 15:19:28
392	2	R??gas Tirdzniec??bas profesion??l?? vidusskola	2021-04-09 15:19:28	2021-04-09 15:19:28
393	2	Sabiedr??ba ar ierobe??otu atbild??bu "Biznesa vad??bas koled??a"	2021-04-09 15:19:28	2021-04-09 15:19:28
394	2	Valsts sabiedr??ba ar ierobe??otu atbild??bu "R??gas p??rtikas ra??ot??ju vidusskola" 	2021-04-09 15:19:28	2021-04-09 15:19:28
395	2	Vitebskas valsts pedago??iskais instit??ts	2021-04-09 15:19:28	2021-04-09 15:19:28
396	3	s??kumskola un vizu??l?? m??ksla	2021-04-09 15:19:28	2021-04-09 15:19:28
397	2	R??gas 17. vakara (mai??u) vidusskola	2021-04-09 15:19:28	2021-04-09 15:19:28
398	2	Sabiedr??bas ar ierobe??otu atbild??bu "Baltic Bright" M??c??bu un konsult??ciju centrs	2021-04-09 15:19:28	2021-04-09 15:19:28
399	2	Microsoft Latvia	2021-04-09 15:19:28	2021-04-09 15:19:28
400	2	Audiovizu??lo mediju pied??v??juma kritikas biedr??ba "??tikas Tilts Latvij??"	2021-04-09 15:19:28	2021-04-09 15:19:28
401	2	R??zeknes pamatskola-att??st??bas centrs	2021-04-09 15:19:28	2021-04-09 15:19:28
402	2	Biedr??ba "Multikult??ras integr??cijas centrs "Varav??ksnes laiva""	2021-04-09 15:19:28	2021-04-09 15:19:28
403	2	Ludzas novada pa??vald??ba	2021-04-09 15:19:29	2021-04-09 15:19:29
404	2	"AFS Latvija" Starpkult??ru programma	2021-04-09 15:19:29	2021-04-09 15:19:29
405	3	??.Gr??vas v.n. 5. profesion??li tehnisk?? vidusskola	2021-04-09 15:19:29	2021-04-09 15:19:29
406	3	5.Pils??tas profesion??li tehnisk?? Poligr??fijas m??kslas vidusskola	2021-04-09 15:19:29	2021-04-09 15:19:29
407	2	R??gas Tehnisk??s koled??as profesion??l?? vidusskola	2021-04-09 15:19:29	2021-04-09 15:19:29
408	2	Valsts a??ent??ra Latvijas Nacion??lais akredit??cijas birojs (LATAK)	2021-04-09 15:19:29	2021-04-09 15:19:29
409	3	Ma????nzin??bu fakult??te	2021-04-09 15:19:29	2021-04-09 15:19:29
410	2	Ventspils Jaunrades nams	2021-04-09 15:19:29	2021-04-09 15:19:29
411	2	Ventspils pils??tas pa??vald??bas iest??de "Ventspils Digit??lais centrs"	2021-04-09 15:19:29	2021-04-09 15:19:29
412	2	SIA "Izgl??t??bas un att??st??bas centra "EGO""	2021-04-09 15:19:29	2021-04-09 15:19:29
413	3	Matem??tikas un fizkas	2021-04-09 15:19:29	2021-04-09 15:19:29
414	2	AS "Datorzin??bu centrs"	2021-04-09 15:19:29	2021-04-09 15:19:29
415	2	SIA "Skolu ties??bu atbalsts"	2021-04-09 15:19:29	2021-04-09 15:19:29
416	2	R??gas 18. vakara (mai??u) vidusskola	2021-04-09 15:19:30	2021-04-09 15:19:30
417	3	Bulduru sovhoztehnikums	2021-04-09 15:19:30	2021-04-09 15:19:30
418	2	Kr??slavas 2. vidusskola	2021-04-09 15:19:30	2021-04-09 15:19:30
419	2	R??gas Celtniec??bas tehnikums	2021-04-09 15:19:30	2021-04-09 15:19:30
420	2	SIA TIKKURILA	2021-04-09 15:19:30	2021-04-09 15:19:30
421	2	SIA "Velve M.S. Tehnolo??ijas"	2021-04-09 15:19:30	2021-04-09 15:19:30
422	2	SIA ???KNAUF???	2021-04-09 15:19:30	2021-04-09 15:19:30
423	2	Latvijas Darba dev??ju konfeder??cija	2021-04-09 15:19:30	2021-04-09 15:19:30
424	2	Za??enieku komerci??l?? un amatniec??bas vidusskola	2021-04-09 15:19:30	2021-04-09 15:19:30
425	2	SIA "AUTOAMATNIEKS"	2021-04-09 15:19:30	2021-04-09 15:19:30
426	2	SIA ???Robert Bosch???	2021-04-09 15:19:30	2021-04-09 15:19:30
427	2	R??zeknes augstskolas T??lm??c??bas centrs	2021-04-09 15:19:30	2021-04-09 15:19:30
428	2	Ik????iles vidusskola	2021-04-09 15:19:30	2021-04-09 15:19:30
429	2	Latvijas Valsts universit??te	2021-04-09 15:19:30	2021-04-09 15:19:30
430	3	Finansu un tirdzniec??bas	2021-04-09 15:19:30	2021-04-09 15:19:30
431	2	Biedr??ba "Latvijas karjeras att??st??bas atbalsta asoci??cija" (LKAAA)	2021-04-09 15:19:30	2021-04-09 15:19:30
432	3	Izgl??t??bas un vad??bas fakult??te	2021-04-09 15:19:30	2021-04-09 15:19:30
433	2	Sabiedr??ba ar ierobe??otu atbild??bu "Soci??lo tehnolo??iju augstskola"	2021-04-09 15:19:31	2021-04-09 15:19:31
434	2	Daugavpils 38. arodvidusskola	2021-04-09 15:19:31	2021-04-09 15:19:31
435	3	Rehabilit??cijas fakult??te	2021-04-09 15:19:31	2021-04-09 15:19:31
436	2	Latvijas Zin??t??u Akad??mija	2021-04-09 15:19:31	2021-04-09 15:19:31
437	2	Madonas Valsts ??imn??zija	2021-04-09 15:19:31	2021-04-09 15:19:31
438	3	Datorikas fakult??te	2021-04-09 15:19:31	2021-04-09 15:19:31
439	2	"M??c??bu centrs Liepa"	2021-04-09 15:19:31	2021-04-09 15:19:31
440	2	Latvijas Kult??ras akad??mijas a??ent??ra "Latvijas Kult??ras akad??mijas Latvijas Kult??ras koled??a"	2021-04-09 15:19:31	2021-04-09 15:19:31
441	2	Omnia, the Joint Authority of Education in Espoo Region	2021-04-09 15:19:31	2021-04-09 15:19:31
442	2	Baltijas Krievu instit??ts	2021-04-09 15:19:31	2021-04-09 15:19:31
443	2	Latvijas republikas R??zeknes pedago??isk?? skola	2021-04-09 15:19:31	2021-04-09 15:19:31
444	2	R??zeknes Valsts 1. ??imn??zija	2021-04-09 15:19:31	2021-04-09 15:19:31
445	2	Maskavas Poligr??fijas instit??ts	2021-04-09 15:19:32	2021-04-09 15:19:32
446	3	Materi??lzin??tnes un lieti??????s ????mijas fakult??te	2021-04-09 15:19:32	2021-04-09 15:19:32
447	2	Leipcigas pils??tas profesion??l??s izgl??t??bas centrs (Berufsliches Shulzentrum der Stadt Leipzig)	2021-04-09 15:19:32	2021-04-09 15:19:32
448	2	???SIA Gr??bes Konsult??ciju Birojs???	2021-04-09 15:19:32	2021-04-09 15:19:32
449	2	Biedr??ba "Pieaugu??o izgl??t??bas iest??de "Profesion??l??s pilnveides m??c??bu centrs""	2021-04-09 15:19:32	2021-04-09 15:19:32
450	2	Alsungas novada dome	2021-04-09 15:19:32	2021-04-09 15:19:32
451	2	Latvijas Kult??ras akad??mija	2021-04-09 15:19:32	2021-04-09 15:19:32
452	2	Vides aizsardz??bas un re??ion??l??s att??st??bas ministrija (VARAM)	2021-04-09 15:19:32	2021-04-09 15:19:32
453	2	SIA "Dialogs AB" M??c??bu centrs	2021-04-09 15:19:32	2021-04-09 15:19:32
454	2	Latvijas Lauksaimniec??bas konsult??ciju un izgl??t??bas atbalsta centrs	2021-04-09 15:19:32	2021-04-09 15:19:32
455	2	Jelgavas novada pa??vald??ba	2021-04-09 15:19:32	2021-04-09 15:19:32
456	3	Sv??tes pamatskola	2021-04-09 15:19:32	2021-04-09 15:19:32
457	2	Jelgavas novada pa??vald??bas Izgl??t??bas p??rvalde	2021-04-09 15:19:32	2021-04-09 15:19:32
458	3	????mija	2021-04-09 15:19:32	2021-04-09 15:19:32
459	3	Fizikas matem??tikas	2021-04-09 15:19:32	2021-04-09 15:19:32
460	2	Profesion??l??s t??l??kizgl??t??bas un pilnveides izgl??t??bas iest??de "Baltijas Datoru akad??mija"	2021-04-09 15:19:32	2021-04-09 15:19:32
461	2	Nodibin??jums "IT Izgl??t??bas fonds"	2021-04-09 15:19:32	2021-04-09 15:19:32
462	3	Norwegian National Support Service	2021-04-09 15:19:32	2021-04-09 15:19:32
463	2	Gulbenes novada bibliot??ka	2021-04-09 15:19:32	2021-04-09 15:19:32
464	3	EUROPASS Mobilit??tes apliecin??jums	2021-04-09 15:19:32	2021-04-09 15:19:32
465	2	Ernsta Glika Al??ksnes Valsts ??imn??zija	2021-04-09 15:19:32	2021-04-09 15:19:32
466	2	R??gas Viegl??s r??pniec??bas tehnikums	2021-04-09 15:19:32	2021-04-09 15:19:32
467	2	Profesion??l??s pilnveides un t??l??kizgl??t??bas iest??de "M??c??bu centrs plus"	2021-04-09 15:19:32	2021-04-09 15:19:32
468	3	Ekonomikas	2021-04-09 15:19:32	2021-04-09 15:19:32
469	3	P??rtikas tehnolo??ijas	2021-04-09 15:19:32	2021-04-09 15:19:32
470	2	R??gas 31. vidusskola	2021-04-09 15:19:32	2021-04-09 15:19:32
471	2	Sanktp??terburgas Valsts universit??te	2021-04-09 15:19:32	2021-04-09 15:19:32
472	2	Krievijas Tautu draudz??bas universit??te	2021-04-09 15:19:32	2021-04-09 15:19:32
473	2	Cambridge University press	2021-04-09 15:19:32	2021-04-09 15:19:32
474	2	Oxford Professional Development	2021-04-09 15:19:32	2021-04-09 15:19:32
475	3	Fizikas-matem??tikas	2021-04-09 15:19:33	2021-04-09 15:19:33
477	0	B??rnu aizsardz??bas apliec??ba	2021-04-26 08:43:08	2021-04-26 08:43:08
479	0	Kvalit??tes pak??pe I	2021-04-26 08:47:57	2021-04-26 08:47:57
480	0	Kvalit??tes pak??pe II	2021-04-26 08:48:06	2021-04-26 08:48:06
481	0	Kvalit??tes pak??pe III	2021-04-26 08:48:14	2021-04-26 08:48:14
482	4	IT Noda??a	2021-05-27 14:48:22	2021-05-27 14:48:22
483	4	Datorikas noda??a	2021-05-27 16:07:09	2021-05-27 16:07:09
484	0	Testa tips	2021-06-09 17:21:53	2021-06-09 17:21:53
485	5	bakalaura gr??ds "Datorzin??tn??s"	2021-06-28 10:41:20	2021-06-28 10:41:20
486	6	m??zikas skolot??js	2021-07-16 11:54:32	2021-07-16 11:54:32
487	6	Vid??j??s izgl??t??bas krievu un latvie??u valodas skolot??ja	2021-07-19 07:55:20	2021-07-19 07:55:20
488	4	M??c??bu noda??a	2021-07-19 07:55:20	2021-07-19 07:55:20
489	5	Bakalaura gr??ds	2021-07-27 06:24:28	2021-07-27 06:24:28
490	4	Limba??u teritori??l?? strukt??rvien??ba	2021-07-27 06:24:28	2021-07-27 06:24:28
491	2	Mazsalacas vidusskola	2021-07-27 07:12:33	2021-07-27 07:12:33
492	5	Profesion??lais bakalaura gr??ds gr??matved??b??, audit?? un anal??z??.	2021-07-27 08:23:57	2021-07-27 08:23:57
493	6	Ekonomista	2021-07-27 08:23:57	2021-07-27 08:23:57
494	4	Komercdarb??bas noda??a	2021-07-27 08:23:57	2021-07-27 08:23:57
495	6	In??eniera- meh??ni??a	2021-07-27 08:36:57	2021-07-27 08:36:57
496	4	Iek????j??s k??rt??bas nodro??in??juma noda??a	2021-07-27 08:36:57	2021-07-27 08:36:57
497	5	Ekonomikas doktora zin??tniskais gr??ds	2021-07-27 08:47:47	2021-07-27 08:47:47
498	6	Ekonomika	2021-07-27 08:47:47	2021-07-27 08:47:47
499	4	Projekta noda??a	2021-07-27 08:47:47	2021-07-27 08:47:47
500	4	Tehnolo??iju un inov??ciju centrs	2021-07-28 07:09:49	2021-07-28 07:09:49
501	0	Apliec??ba	2021-07-28 07:26:37	2021-07-28 07:26:37
502	2	LETIJA MC	2021-07-28 07:44:59	2021-07-28 07:44:59
503	2	Leticija MC	2021-07-28 07:58:09	2021-07-28 07:58:09
504	0	Apliecin??jums	2021-07-28 07:58:47	2021-07-28 07:58:47
505	0	Bakalaura diploms	2021-07-28 07:59:34	2021-09-09 07:24:52
506	5	Doktors (zin??tniskais gr??ds)	2021-07-28 08:48:51	2021-07-28 08:48:51
507	6	In??enierzin??t??u doktora zin??tniskais gr??ds	2021-07-28 08:48:51	2021-07-28 08:48:51
508	4	Ma????nb??ves noda??a	2021-07-28 08:48:51	2021-07-28 08:48:51
509	6	In??enieris - tehnologs kokapstr??d??	2021-07-28 08:54:31	2021-07-28 08:54:31
510	4	Kokapstr??des noda??a	2021-07-28 08:54:31	2021-07-28 08:54:31
511	6	Radioin??eniera	2021-07-28 09:01:59	2021-07-28 09:01:59
512	4	Pieaugu??i izgl??t??bas centrs	2021-07-28 09:01:59	2021-07-28 09:01:59
513	6	Ekonomista kvalifik??cija gr??matved??b??.	2021-07-29 09:55:19	2021-07-29 09:55:19
514	4	Gr??matved??bas noda??a	2021-07-29 09:55:19	2021-07-29 09:55:19
515	6	Uz????m??jdarb??bas (komercdarb??bas) speci??lista kvalifik??cija	2021-07-29 10:09:35	2021-07-29 10:09:35
516	4	Audzin????anas noda??a	2021-07-29 10:09:35	2021-07-29 10:09:35
517	5	Profesion??lais ma??istra	2021-07-29 10:22:50	2021-07-29 10:22:50
518	6	in??eniera - elektri??a	2021-07-29 10:22:50	2021-07-29 10:22:50
519	6	Transporta uz????muma vad??t??ja profesion??l?? kvalifik??cija	2021-07-29 10:34:52	2021-07-29 10:34:52
520	5	Profesion??lais bakalaura	2021-07-29 10:37:20	2021-07-29 10:37:20
521	5	Doktora zin??tniskais gr??ds	2021-07-29 10:38:32	2021-07-29 10:38:32
522	1	Vid??ji profesion??l??	2021-07-29 10:50:15	2021-07-29 10:50:15
523	6	Pusvad??t??ju aparat??ras iest??d??t??ja	2021-07-29 10:50:15	2021-07-29 10:50:15
524	4	Saimniec??bas noda??a	2021-07-29 11:00:45	2021-07-29 11:00:45
525	6	In??eniera r??pniec??bas - siltumener????ti??a kvalifik??cija	2021-07-29 11:11:00	2021-07-29 11:11:00
526	4	Kr??slavas teritori??l?? strukt??rvien??ba	2021-07-29 11:16:44	2021-07-29 11:16:44
527	4	Laidzes teritori??l?? strukt??rvien??ba	2021-07-29 11:22:35	2021-07-29 11:22:35
528	6	In??enieris - meh??ni??is	2021-07-30 06:03:17	2021-07-30 06:03:17
529	4	Auto noda??a	2021-07-30 06:03:17	2021-07-30 06:03:17
530	6	Profesion??l??s izgl??t??bas skolot??ja un pedagoga	2021-07-30 06:10:54	2021-07-30 06:10:54
531	4	Dzelzce??a noda??a	2021-07-30 06:41:54	2021-07-30 06:41:54
532	5	Profesion??lais ma??istra gr??ds Valsts p??rvald??	2021-07-30 07:22:39	2021-07-30 07:22:39
533	6	Kokapstr??des tehnologa	2021-07-30 07:35:36	2021-07-30 07:35:36
534	5	Profesion??lais ma??istra gr??ds vad??bzin??tn??	2021-07-30 07:40:23	2021-07-30 07:40:23
535	6	????mi??a	2021-07-30 08:10:39	2021-07-30 08:10:39
536	4	????mijas tehnolo??ijas un ener????tikas noda??a	2021-07-30 08:10:39	2021-07-30 08:10:39
537	6	Vidusskolas biolo??ijas un m??jtur??bas skolot??ja	2021-07-30 08:38:31	2021-07-30 08:38:31
538	6	Profesion??l??s izgl??t??bas skolot??ja	2021-07-30 09:07:53	2021-07-30 09:07:53
539	5	Humanit??ro zin??t??u ma??istra gr??ds filolo??ij??	2021-07-30 09:20:49	2021-07-30 09:20:49
540	6	Augstspiediena iespied??ja	2021-07-30 09:27:59	2021-07-30 09:27:59
541	4	Drukas un mediju tehnolo??iju noda??a	2021-07-30 09:27:59	2021-07-30 09:27:59
542	5	Humanit??ro zin??t??u bakalaura gr??ds v??stur??	2021-07-30 09:50:37	2021-07-30 09:50:37
543	6	V??sturnieka, v??sture pasniedz??ja	2021-08-02 08:30:44	2021-08-02 08:30:44
544	4	Bibliot??ka	2021-08-02 08:30:44	2021-08-02 08:30:44
545	5	Pedago??ijas bakalaura gr??ds sporta zin??tn??	2021-08-02 08:38:21	2021-08-02 08:38:21
546	6	Izgl??t??bas un sporta mened??era un akt??v?? t??risma un br??v?? laika mened??era kvalifik??cija	2021-08-02 08:38:21	2021-08-02 08:38:21
547	6	Poligr??fijas ra??o??anas tehni??is	2021-08-02 08:54:22	2021-08-02 08:54:22
548	6	Fizisk??s kult??ras un sporta pasniedz??ja	2021-08-02 09:09:12	2021-08-02 09:09:12
549	6	Soci??lo zin??t??u ma??istrs vad??bzin??tn??	2021-08-02 09:51:11	2021-08-02 09:51:11
550	4	Metodisk?? noda??a	2021-08-02 09:51:11	2021-08-02 09:51:11
551	5	Akad??miskais ma????stra	2021-08-02 10:06:53	2021-08-02 10:06:53
552	6	Dabaszin??t??u ma??istrs datorzin??tn??s	2021-08-02 10:06:53	2021-08-02 10:06:53
553	6	Profesion??lais ma??istra gr??ds muitas un nodok??u administr????an??	2021-08-02 10:23:21	2021-08-02 10:23:21
554	6	In??enierzin??t??u ma??istra gr??ds ener????tik?? un elektrotehnik??.	2021-08-02 10:36:25	2021-08-02 10:36:25
555	4	??pa??umu apsaimnieko??anas noda??a	2021-08-02 10:36:25	2021-08-02 10:36:25
556	6	Pedago??ija	2021-08-02 11:08:35	2021-08-02 11:08:35
557	6	In??enierzin??t??u ma??istrs ????mij??	2021-08-02 11:32:49	2021-08-02 11:32:49
558	6	V??sturnieka, v??stures un  sabiedr??bas m??c??bas pasniedz??ja	2021-08-02 11:48:29	2021-08-02 11:48:29
559	6	Pasniedz??js fizik??	2021-08-03 06:55:50	2021-08-03 06:55:50
560	6	Vizu??l??s m??kslas un m??kslas v??stures skolot??ja	2021-08-03 08:16:36	2021-08-03 08:16:36
561	4	Kanceleja	2021-08-03 08:24:30	2021-08-03 08:24:30
562	6	Arodpedagoga	2021-08-03 09:34:21	2021-08-03 09:34:21
563	6	Izgl??t??bas vad??ba	2021-08-03 10:36:29	2021-08-03 10:36:29
564	6	Tehni??is - meh??ni??is	2021-08-03 10:50:20	2021-08-03 10:50:20
565	6	in??enierzin??t??u ma??istra gr??ds lieti??????s datorzin??tn??s	2021-08-03 11:04:37	2021-08-03 11:04:37
566	6	Automeh??ni??a	2021-08-04 06:37:26	2021-08-04 06:37:26
567	6	Filologa, ang??u valodas pasniedz??ja	2021-08-04 06:43:26	2021-08-04 06:43:26
568	6	Ma??istra gr??ds pedago??ij??	2021-08-04 06:49:58	2021-08-04 06:49:58
569	6	Vieglatl??tikas trenera	2021-08-04 07:05:19	2021-08-04 07:05:19
570	6	Uz????muma un iest??des vad??t??ja	2021-08-04 07:27:42	2021-08-04 07:27:42
571	6	Vidusskolas krievu valodas un literat??ras skolot??ja	2021-08-04 07:34:42	2021-08-04 07:34:42
572	6	Profesion??lais ma??istra gr??ds soci??laj?? darb??	2021-08-04 08:10:44	2021-08-04 08:10:44
573	6	Soci??lo zin??t??u bakalaurs vad??bzin??tn??	2021-08-04 08:22:48	2021-08-04 08:22:48
574	6	Vidusskolas krievu un latvie??u literat??ras un valodas k?? sve??valodas skolot??ja kvalifik??cija	2021-08-04 08:43:29	2021-08-04 08:43:29
575	6	Dabaszin??t??u ma??istrs ????mij??	2021-08-04 08:59:46	2021-08-04 08:59:46
576	6	In??enierzin??t??u doktors ma????nzin??tn??	2021-08-04 09:06:53	2021-08-04 09:06:53
577	5	Ma??istra gr??ds	2021-08-04 09:13:36	2021-08-04 09:13:36
578	6	Dabaszin??t??u ma??istrs matem??tik??	2021-08-04 09:13:36	2021-08-04 09:13:36
579	6	Transporta elektronik?? un telem??tik??.	2021-08-04 09:31:18	2021-08-04 09:31:18
580	6	Humanit??ro zin??t??u ma??istra gr??ds filolo??ij??	2021-08-04 09:46:01	2021-08-04 09:46:01
581	6	Filologa, krievu valodas un literat??ras pasniedz??ja	2021-08-04 09:56:28	2021-08-04 09:56:28
582	6	In??enierpedago??ija	2021-08-04 11:28:43	2021-08-04 11:28:43
583	6	Skolas pedago??ija	2021-08-04 11:50:25	2021-08-04 11:50:25
584	6	Izgl??t??bas zin??t??u ma??istra gr??ds	2021-08-05 07:55:22	2021-08-05 07:55:22
585	6	Komercpakalpojumu darbinieks	2021-08-05 09:37:59	2021-08-05 09:37:59
586	4	Audz??k??u serviss	2021-08-05 09:37:59	2021-08-05 09:37:59
587	6	Matem??tikas un fizikas skolot??ja	2021-08-05 09:50:59	2021-08-05 09:50:59
588	6	In??eniera - meh??ni??a	2021-08-05 10:09:05	2021-08-05 10:09:05
589	6	Elektrot??kla in??eniera	2021-08-05 10:14:21	2021-08-05 10:14:21
590	6	Pamatskolas skolot??ja	2021-08-05 10:23:43	2021-08-05 10:23:43
591	6	Pedago??ijas ma??istra gr??ds	2021-08-05 10:28:00	2021-08-05 10:28:00
592	6	??urn??lista	2021-08-05 10:46:02	2021-08-05 10:46:02
593	6	Bibliogr??fa - bibliotek??ra	2021-08-05 10:51:21	2021-08-05 10:51:21
594	6	Satiksmes ce??u in??eniera - celtnieka	2021-08-05 11:01:33	2021-08-05 11:01:33
595	6	Filologs, latvie??u valodas un literat??ras pasniedz??ja	2021-08-06 06:44:40	2021-08-06 06:44:40
596	6	Latvie??u valodas un literat??ras skolot??ja	2021-08-06 06:50:25	2021-08-06 06:50:25
597	6	Humanit??ro zin??t??u bakalaura gr??ds filolo??ij??	2021-08-06 07:42:20	2021-08-06 07:42:20
598	6	Psiholo??ija	2021-08-06 08:18:43	2021-08-06 08:18:43
599	6	Pedago??ij?? un m??ksl??	2021-08-06 08:27:11	2021-08-06 08:27:11
600	6	Pedago??ija, m??ksla, autom??tik??, datortehnik?? un t??klos.	2021-08-06 08:29:20	2021-08-06 08:29:20
601	6	In??eniera- ????mi??a	2021-08-06 08:52:44	2021-08-06 08:52:44
602	6	Iespied??js	2021-08-06 09:12:29	2021-08-06 09:12:29
603	6	Sist??mu anal??ti??a, in??eniera- meh??ni??a	2021-08-06 09:17:56	2021-08-06 09:17:56
604	6	Soci??lo zin??t??u bakalaurs ekonomik??	2021-08-06 09:22:55	2021-08-06 09:22:55
605	6	Fizi??a, pasniedz??ja; izgl??t??bas zin??t??u ma??istra gr??ds	2021-08-06 09:32:34	2021-08-06 09:32:34
606	6	In??eniera - tehnologa	2021-08-06 09:38:03	2021-08-06 09:38:03
607	6	Karjeras konsultanta	2021-08-06 10:14:53	2021-08-06 10:14:53
608	6	Izgl??t??bas zin??t??u ma??istra gr??ds Pedago??ij??	2021-08-06 10:26:12	2021-08-06 10:26:12
609	6	V??sture	2021-08-06 10:30:59	2021-08-06 10:30:59
610	6	Psihologa	2021-08-06 10:39:11	2021-08-06 10:39:11
611	6	Biznesa vad??b??	2021-08-06 11:01:57	2021-08-06 11:01:57
612	6	Speci??lista organiz??ciju dro????b??.	2021-08-17 08:17:17	2021-08-17 08:17:17
613	6	Matem??ti??a un fizikas skolot??ja	2021-08-17 11:39:31	2021-08-17 11:39:31
614	6	Elektromontiera	2021-08-17 11:47:43	2021-08-17 11:47:43
615	6	Datorsist??mu un datort??klu administratora	2021-08-18 09:00:42	2021-08-18 09:00:42
616	2	Pure Academy	2021-08-18 09:10:03	2021-08-18 09:10:03
617	2	Izgl??t??bas att??st??bas centrs	2021-08-18 09:10:35	2021-08-18 09:10:35
618	6	Komercdarb??bas speci??lista	2021-08-18 09:31:35	2021-08-18 09:31:35
619	6	In??eniera kvalifik??cija dzelzce??a transport??	2021-08-18 09:40:19	2021-08-18 09:40:19
620	6	????mi??a, pasniedz??ja	2021-08-18 09:44:16	2021-08-18 09:44:16
621	6	In??enierzin??t??u ma??istra gr??ds transporta un satiksmes zin??tn??	2021-08-18 10:56:00	2021-08-18 10:56:00
622	5	Profesion??lais bakalaura gr??ds izgl??t??b??	2021-08-18 11:43:24	2021-08-18 11:43:24
623	6	S??kumskolas skolot??ja ar ties??b??m m??c??t inform??tiku	2021-08-18 11:43:24	2021-08-18 11:43:24
624	6	In??eniera programm??t??ja	2021-08-18 11:58:20	2021-08-18 11:58:20
625	6	M??kslinieks noform??t??js	2021-08-19 07:43:00	2021-08-19 07:43:00
626	6	Skolvad??ba	2021-08-19 07:50:58	2021-08-19 07:50:58
627	6	Uz????muma un iest????u vad??t??ja	2021-08-19 08:18:39	2021-08-19 08:18:39
628	6	Satiksmes ce??u in??enieris - elektri??is; dzelzce??a elektrosist??m??s	2021-08-19 08:40:12	2021-08-19 08:40:12
629	5	Akad??miskais bakalaurs	2021-08-19 08:56:15	2021-08-19 08:56:15
630	6	Fizisk??s audzin????anas skolot??ja un kinezioterapeita kvalifik??cija	2021-08-19 09:38:33	2021-08-19 09:38:33
631	6	Mened??era	2021-08-19 11:32:56	2021-08-19 11:32:56
632	6	Soci??lo zin??t??u ma??istra ekonomik??	2021-08-19 11:39:40	2021-08-19 11:39:40
633	5	Akad??miskais kalaurs	2021-08-19 11:47:15	2021-08-19 11:47:15
634	6	Izgl??t??bas zin??t??u akad??miskais bakalaura gr??ds sport??	2021-08-19 11:47:15	2021-08-19 11:47:15
635	6	Uz????m??jdarb??bas vad??ba un administr????ana	2021-08-20 06:41:42	2021-08-20 06:41:42
636	6	Dabaszin??t??u ma??istra gr??ds datorzin??tn??s	2021-08-20 06:55:46	2021-08-20 06:55:46
637	6	D??ze??lokomot??ves, tvaika lokomot??ves remonta atsl??dznieka	2021-08-20 07:54:26	2021-08-20 07:54:26
638	6	In??eniera - matem??ti??a	2021-08-20 09:18:04	2021-08-20 09:18:04
639	6	V??stures un soci??lo zin??bu skolot??ja	2021-08-20 09:24:07	2021-08-20 09:24:07
640	6	Dabaszin??t??u bakalaura gr??ds datorzin??tn??s; biolo??ijas un fizikas skolot??ja	2021-08-20 10:26:11	2021-08-20 10:26:11
641	6	Pedago??ijas ma??istra gr??ds skolvad??b??; Ekonomista	2021-08-23 08:10:19	2021-08-23 08:10:19
642	6	Dabaszin??t??u bakalaura gr??ds datorzin??tn??s	2021-08-23 12:47:20	2021-08-23 12:47:20
643	6	Filaloga, krievu valodas un literat??ras pasniedz??ja	2021-08-27 10:00:24	2021-08-27 10:00:24
644	6	Vizu??l??s m??kslas  skolot??ja un inform??tikas un programm????anas skolot??ja	2021-08-30 08:46:41	2021-08-30 08:46:41
645	6	Vidusskolas fizisk??s audzin????anas, anatomijas un fiziolo??ijas skolot??ja	2021-08-30 10:43:13	2021-08-30 10:43:13
646	6	Pedagogs karjeras konsultants	2021-08-30 11:03:21	2021-08-30 11:03:21
647	6	Profesion??lais ma??istra gr??ds uz????mumu un iest????u vad??b??	2021-08-30 11:17:42	2021-08-30 11:17:42
648	4	Person??la un lietved??bas noda??a	2021-09-09 08:24:40	2021-09-09 08:24:40
649	5	Izgl??t??bas zin??t??u bakalaura gr??ds pedago??ij??	2021-09-09 08:27:53	2021-09-09 08:27:53
650	6	Person??la speci??lists	2021-09-13 11:20:52	2021-09-13 11:20:52
651	6	Vidusskolas biolo??ijas un ????mijas skolot??ja	2021-09-13 11:27:00	2021-09-13 11:27:00
652	6	Dabaszin??t??u bakalaurs datorzin??tn??s	2021-09-13 12:28:07	2021-09-13 12:28:07
653	6	Vid??j??s izgl??t??bas ang??u valodas un v??cu valodas skolot??ja	2021-09-14 12:11:26	2021-09-14 12:11:26
654	4	Vad??ba	2021-09-14 12:39:58	2021-09-14 12:39:58
655	1	Kompetences paaugstin????anas kursi	2021-09-15 13:59:55	2021-09-15 13:59:55
656	3	Pieaugu??o izgl??t??ba	2021-09-15 13:59:55	2021-09-15 13:59:55
657	1	-	2021-09-16 09:25:39	2021-09-16 09:25:39
658	5	Profesion??lais bakalaura gr??ds gr??matved??b??, audit?? un anal??z??	2021-09-16 09:30:57	2021-09-16 09:30:57
659	5	In??enierzin??t??u ma??istra	2021-09-16 10:11:25	2021-09-16 10:11:25
660	5	Soci??lo zin??t??u ma??istra gr??ds vad??bzin??tn??	2021-09-16 10:36:58	2021-09-16 10:36:58
661	5	Soci??lais ma??istra gr??ds vad??bzin??tn??	2021-09-16 11:30:51	2021-09-16 11:30:51
662	6	Humanit??ro zin??t??u ma??istrs filolo??ij??	2021-09-16 12:01:35	2021-09-16 12:01:35
663	5	Dabaszin??t??u ma??istra gr??ds Datorzin??tn??s	2021-09-17 06:18:06	2021-09-17 06:18:06
664	5	Izgl??t??bas zin??t??u ma??istra gr??ds pedago??ij??	2021-09-17 07:00:15	2021-09-17 07:00:15
665	5	In??enierzin??t??u ma??istra gr??ds ????mij??	2021-09-17 07:03:34	2021-09-17 07:03:34
666	6	Fizi??a, pasniedz??ja	2021-09-17 07:30:51	2021-09-17 07:30:51
668	5	Profesion??lais ma??istra gr??ds izgl??t??bas vad??b??	2021-09-20 11:44:01	2021-09-20 11:44:01
669	6	Ma??istrs izgl??t??bas vad??b??	2021-09-20 11:44:01	2021-09-20 11:44:01
670	5	In??enierzin??t??u ma??istra gr??ds lieti??????s datorzin??tn??s	2021-09-20 11:48:02	2021-09-20 11:48:02
671	5	Pedago??ijas ma??istra gr??ds	2021-09-20 11:57:47	2021-09-20 11:57:47
672	5	Profesion??lais ma??istra gr??ds vad??bzin??tn??s	2021-09-20 12:03:19	2021-09-20 12:03:19
673	5	Soci??lo zin??t??u bakalaura gr??ds vad??bzin??tn??	2021-09-20 12:08:58	2021-09-20 12:08:58
674	5	Profesion??lais ma??istra gr??ds soci??laj?? darb??	2021-09-20 12:11:45	2021-09-20 12:11:45
675	5	Profesion??lais ma??istra gr??ds muitas un nodok??u administr????an??	2021-09-20 12:26:51	2021-09-20 12:26:51
676	5	Dabaszin??t??u ma??istra gr??ds ????mij??	2021-09-20 12:31:08	2021-09-20 12:31:08
677	5	Dabaszin??t??u ma??istra gr??ds matem??tik??	2021-09-21 06:14:35	2021-09-21 06:14:35
678	5	Profesion??lais bakalaura gr??ds transporta elektronik?? un telem??tik??	2021-09-21 06:19:45	2021-09-21 06:19:45
679	6	In??eniera kvalifik??cija elektronik??	2021-09-21 06:19:45	2021-09-21 06:19:45
680	5	In??enierzin??t??u ma??istra gr??ds in??enierpedago??ij??	2021-09-21 07:43:19	2021-09-21 07:43:19
681	5	Profesion??lais ma??istra  gr??ds skolas pedago??ij??	2021-09-21 07:47:00	2021-09-21 07:47:00
682	5	Izgl??t??bas zin??t??u ma??istra gr??ds	2021-09-21 07:53:02	2021-09-21 07:53:02
683	5	Akad??miskais bakalaurs (Organiz??ciju un sabiedr??bas p??rvaldes sociolo??ija)	2021-09-21 08:50:05	2021-09-21 08:50:05
684	5	Humanit??ro zin??t??u bakalaura gr??ds filolo??ij??	2021-09-21 10:32:45	2021-09-21 10:32:45
685	6	Humanit??ro zin??t??u bakalaurs filolo??ij??	2021-09-21 10:32:45	2021-09-21 10:32:45
686	5	Bakalaura gr??ds psiholo??ij??	2021-09-21 10:53:33	2021-09-21 10:53:33
687	5	Profesion??lais ma??istra gr??ds datorsist??m??s	2021-09-21 11:22:22	2021-09-21 11:22:22
688	6	Sist??mu anal??ti??a kvalifik??cija	2021-09-21 11:22:22	2021-09-21 11:22:22
689	5	Soci??lo zin??t??u bakalaura gr??ds ekonomik??	2021-09-21 11:27:36	2021-09-21 11:27:36
690	5	Profesion??lais ma??istra gr??ds izgl??t??bas zin??tn??	2021-09-22 05:54:21	2021-09-22 05:54:21
691	5	Profesion??lais ma??istra gr??ds psiholo??ij??	2021-09-22 06:10:48	2021-09-22 06:10:48
692	6	Speci??lista organiz??ciju dro????b??	2021-09-22 06:35:14	2021-09-22 06:35:14
693	5	Humanit??ro zin??t??u ma??istra akad??miskais gr??ds filolo??ij??	2021-09-22 06:41:16	2021-09-22 06:41:16
694	5	Profesion??lais ma??istra gr??ds dzelzce??a transport??	2021-09-22 09:17:36	2021-09-22 09:17:36
695	5	In??enierzin??t??u ma??istra gr??ds transporta un satiksmes zin??tn??	2021-09-22 09:29:00	2021-09-22 09:29:00
696	6	In??enierzin??t??u ma??istrs transporta un satiksmes zin??tn??	2021-09-22 09:29:00	2021-09-22 09:29:00
697	6	Fizisk??s audzin????anas un m??jtur??bas skolot??js	2021-09-22 09:34:21	2021-09-22 09:34:21
698	6	Izgl??t??bas zin??t??u ma??istrs Pedago??ij??	2021-09-22 09:41:46	2021-09-22 09:41:46
699	5	Profesion??lais ma??istra gr??ds skolvd??b??	2021-09-22 09:45:10	2021-09-22 09:45:10
700	5	Profesion??lais ma??istra gr??ds skolvad??b??	2021-09-22 09:45:42	2021-09-22 09:45:42
701	5	Profesion??lais bakalaura gr??ds uz????m??jdarb??bas vad??b??	2021-09-22 09:47:57	2021-09-22 09:47:57
702	5	Izgl??t??bas zin??t??u akad??miskais bakalaura gr??ds sport??	2021-09-22 10:03:39	2021-09-22 10:03:39
703	5	Profesion??lais ma??istra gr??ds uz????m??jdarb??bas vad??b?? un administr????an??	2021-09-22 10:23:38	2021-09-22 10:23:38
704	6	Profesion??lais ma??istra gr??ds uz????m??jdarb??bas vad??b?? un administr????an??	2021-09-22 10:23:38	2021-09-22 10:23:38
705	5	Profesion??l?? bakalaura gr??ds izgl??t??b??	2021-09-22 10:33:55	2021-09-22 10:33:55
706	6	Vizu??l??s m??kslas skolot??ja un kult??ras v??stures skolot??ja	2021-09-22 10:33:55	2021-09-22 10:33:55
707	5	Dabaszin??t??u bakalaura gr??ds datorzin??tn??s	2021-09-22 10:42:26	2021-09-22 10:42:26
708	5	Pedago??ijas ma??istra gr??ds skolvad??b??	2021-09-22 11:10:12	2021-09-22 11:10:12
709	5	Soci??lo zin??t??u ma??istra ekonomik??	2021-09-22 11:13:13	2021-09-22 11:13:13
710	5	Soci??lo zin??t??u ma??istra gr??ds ekonomik??	2021-09-22 11:13:27	2021-09-22 11:13:27
711	5	Profesion??lais ma??istra gr??ds uz????mumu un iest????u vad??b??	2021-09-22 12:07:17	2021-09-22 12:07:17
712	5	Profesion??lais ma??istra gr??ds eknomik??	2021-09-22 12:11:31	2021-09-22 12:11:31
713	6	Profesion??lais ma??istra gr??ds eknomik??	2021-09-22 12:11:31	2021-09-22 12:11:31
714	6	Biologa, biolo??ijas un ????mijas pasniedz??ja	2021-09-22 12:19:20	2021-09-22 12:19:20
715	5	Profesion??lais ma??istra gr??ds uz????m??jdarb??b?? un vad????an??	2021-09-22 12:22:26	2021-09-22 12:22:26
716	5	Dabaszin??t??u bakalaurs datorzin??tn??s	2021-09-22 12:41:12	2021-09-22 12:41:12
717	6	Bibliotek??ra un bibliogr??fa	2021-09-23 05:25:13	2021-09-23 05:25:13
718	5	Profesion??lais ma??istra gr??ds izgl??t??b??	2021-09-23 05:43:51	2021-09-23 05:43:51
719	6	Vid??j??s izgl??t??bas matem??tikas un inform??tikas skolot??ja	2021-09-23 05:43:51	2021-09-23 05:43:51
720	6	Pamatskolas ang??u valodas skolot??ja	2021-09-23 06:53:57	2021-09-23 06:53:57
721	5	Dabaszin??t??u bakalaura gr??ds ????mij??	2021-09-23 07:05:12	2021-09-23 07:05:12
722	6	Dabaszin??t??u bakalaurs ????mij??	2021-09-23 07:05:12	2021-09-23 07:05:12
723	4	????mijas tehnolo??ijas noda??a	2021-09-23 07:05:12	2021-09-23 07:05:12
724	6	Iespieddarbu noform??juma speci??lists	2021-09-23 07:21:20	2021-09-23 07:21:20
726	6	xx	2021-09-23 07:27:38	2021-09-23 07:27:38
727	6	apdares gr??mats??j??ja	2021-09-23 07:31:56	2021-09-23 07:31:56
728	6	Augstspieduma iespied??ja	2021-09-23 12:42:43	2021-09-23 12:42:43
729	5	Profesion??lais bakalaura gr??ds ties??bu zin??tn??s	2021-09-24 06:22:57	2021-09-24 06:22:57
730	6	Juriskonsults	2021-09-24 06:22:57	2021-09-24 06:22:57
731	2	SIA Biznesa augstskola Tur??ba	2021-09-24 06:25:10	2021-09-24 06:25:10
732	5	Soci??lo zin??t??u bakalaura gr??ds psiholo??ij??	2021-09-24 07:57:53	2021-09-24 07:57:53
733	6	Telekomunik??ciju in??enieris	2021-09-24 08:05:10	2021-09-24 08:05:10
734	5	Ma??istra gr??ds vides zin??tn??	2021-09-24 09:45:44	2021-09-24 09:45:44
735	6	Vides zin??t??u ma??istra gr??ds	2021-09-24 09:45:44	2021-09-24 09:45:44
736	5	Dabaszin??t??u bakalaura gr??ds matem??tik??	2021-09-24 09:52:20	2021-09-24 09:52:20
737	6	Vidusskolas matem??tikas skolot??ja	2021-09-24 09:52:20	2021-09-24 09:52:20
738	5	Profesion??lais bakalaura gr??ds horeogr??fij??	2021-09-24 09:58:39	2021-09-24 09:58:39
739	6	Horeogr??fa	2021-09-24 09:58:39	2021-09-24 09:58:39
740	6	Profesion??l??s izgl??t??bas skolot??ja, pedagoga	2021-09-24 10:08:09	2021-09-24 10:08:09
741	6	Vizu??l??s m??kslas skolot??ja un m??kslas v??stures skolot??ja	2021-09-24 10:40:19	2021-09-24 10:40:19
742	6	Biroja administratora	2021-09-24 10:59:27	2021-09-24 10:59:27
743	5	Profesion??lais bakalaura gr??ds uz????m??jdarb??b?? un  vad????an??	2021-09-28 09:37:50	2021-09-28 09:37:50
744	5	In??enierzin??t??u bakalaura  gr??ds ma????nzin??tn??	2021-09-28 12:43:38	2021-09-28 12:43:38
745	6	In??enierzin??t??u bakalaura  gr??ds ma????nzin??tn??	2021-09-28 12:43:38	2021-09-28 12:43:38
746	5	In??enierzin??t??u ma??istra gr??ds datorsist??m??s	2021-09-29 06:24:05	2021-09-29 06:24:05
747	6	Ekonomists	2021-09-29 07:18:11	2021-09-29 07:18:11
748	6	Karjeras konsultanta un jaunatnes lietu speci??lista	2021-09-29 12:01:05	2021-09-29 12:01:05
749	5	Profesion??lais bakalaura gr??ds uz????m??jdarb??b??	2021-09-29 12:22:39	2021-09-29 12:22:39
750	2	Profesion??l??s izgl??t??bas biedr??ba	2021-10-01 05:06:10	2021-10-01 05:06:10
751	5	Profesion??lais ma??istra gr??ds uz????m??jdarb??bas vad??b??	2021-10-01 06:56:05	2021-10-01 06:56:05
752	6	sievie??u un v??rie??u frizieris	2021-10-01 09:23:40	2021-10-01 09:23:40
753	1	pamatizgl??t??ba	2021-10-01 09:30:49	2021-10-01 09:30:49
754	5	Profesion??lais bakalaura gr??ds vesel??bas apr??p??	2021-10-01 09:37:15	2021-10-01 09:37:15
755	6	Fizioterapeits	2021-10-01 09:37:15	2021-10-01 09:37:15
756	5	In??enierzin??t??u ma??istra gr??ds E-studiju tehnolo??ij??s un p??rvald??b??	2021-10-01 11:03:38	2021-10-01 11:03:38
757	6	In??enierzin??t??u ma??istra gr??ds E-studiju tehnolo??ij??s un p??rvald??b??	2021-10-01 11:03:38	2021-10-01 11:03:38
758	6	B??vgaldnieks	2021-10-01 11:42:01	2021-10-01 11:42:01
759	6	V??sturnieka, v??stures un sabiedr??bas m??c??bas pasniedz??ja	2021-10-01 11:47:52	2021-10-01 11:47:52
760	6	Vidusskolas latvie??u valodas un literat??ras skolot??js	2021-10-01 11:48:59	2021-10-01 11:48:59
761	5	Profesion??lais ma??istra gr??ds ekonomik??	2021-10-01 11:57:12	2021-10-01 11:57:12
762	6	Fizikas un matem??tikas skolot??js	2021-10-04 05:14:55	2021-10-04 05:14:55
763	6	In??enieris - tehnologs	2021-10-04 05:41:16	2021-10-04 05:41:16
764	6	Soci??l?? pedagoga	2021-10-04 08:09:06	2021-10-04 08:09:06
765	6	Soci??lo zin??t??u bakalaura gr??ds psiholo??ij??	2021-10-04 08:22:12	2021-10-04 08:22:12
766	5	filolo??ijas bakalaura gr??ds	2021-10-04 08:51:09	2021-10-04 08:51:09
767	6	In??eniera -tehnologa	2021-10-04 09:18:42	2021-10-04 09:18:42
768	6	Fizi??a - pasniedz??ja	2021-10-04 09:24:01	2021-10-04 09:24:01
769	6	Vid??j??s izgl??t??bas matem??tikas skolot??ja	2021-10-04 09:34:48	2021-10-04 09:34:48
770	6	Tehni??is - tehnologs	2021-10-04 10:22:18	2021-10-04 10:22:18
771	5	Ekonomikas ma??istra gr??ds	2021-10-04 10:43:19	2021-10-04 10:43:19
772	4	T??l??kizgl??t??bas noda??a	2021-10-04 11:07:58	2021-10-04 11:07:58
773	5	Ma??istra gr??ds filolo??ij??	2021-10-04 11:15:54	2021-10-04 11:15:54
774	6	Filolo??ija	2021-10-04 11:15:54	2021-10-04 11:15:54
775	5	filolo??ijas ma??istra gr??ds	2021-10-04 11:22:34	2021-10-04 11:22:34
776	6	Latvie??u valodas un literat??ras skolot??ja maz??kumtaut??bas skol??s	2021-10-04 11:29:03	2021-10-04 11:29:03
777	6	Vid??j??s izgl??t??bas ang??u  valodas skolot??ja	2021-10-04 11:42:21	2021-10-04 11:42:21
778	5	Profesion??lais  ma??istra gr??ds uz????m??jdarb??bas vad??b??	2021-10-06 05:24:40	2021-10-06 05:24:40
779	5	Psiholo??ijas bakalaura gr??ds	2021-10-06 09:15:11	2021-10-06 09:15:11
780	0	Ma??istra diploms	2021-10-06 11:26:10	2021-10-06 11:26:10
781	0	Skolot??ja diploms	2021-10-06 11:29:27	2021-10-06 11:29:27
782	2	Jelgavas Valsts ??imn??zija	2021-10-06 11:41:32	2021-10-06 11:41:32
783	0	Apliec??ba par profesion??l??s pilnveides izgl??t??bu	2021-10-06 11:51:54	2021-10-06 11:51:54
784	1	Profesion??l??s pilnveides izgl??t??ba	2021-10-06 11:51:54	2021-10-06 11:51:54
785	2	R??gas 15. arodvidusskola	2021-10-06 12:00:58	2021-10-06 12:00:58
786	3	Sporta pedago??ijas	2021-10-06 12:09:04	2021-10-06 12:09:04
787	0	Profesion??l??s kvalifik??cijas apliec??ba	2021-10-06 12:14:11	2021-10-06 12:14:11
788	2	Oxford University Press	2021-10-08 11:41:27	2021-10-08 11:41:27
789	2	Latvijas ang??u valodas skolot??ju asoci??cija	2021-10-08 11:52:51	2021-10-08 11:52:51
790	2	Profesion??l??s izgl??t??bas kompetences centrs "Daugavpils tehnikums"	2021-10-11 05:43:31	2021-10-11 05:43:31
791	2	Autodesk authorized training center	2021-10-11 05:49:15	2021-10-11 05:49:15
792	3	E-studiju tehnolo??iju un humanit??ro zin??t??u fakult??te	2021-10-11 06:27:26	2021-10-11 06:27:26
793	4	Ener????tikas noda??a	2021-10-11 09:19:28	2021-10-11 09:19:28
794	0	Apliec??ba par t??l??kizgl??t??bu	2021-10-11 09:30:14	2021-10-11 09:30:14
795	3	Automob????u un automob????u saimniec??ba	2021-10-11 10:50:58	2021-10-11 10:50:58
796	6	pirmsskolas skolot??js	2021-10-11 11:47:55	2021-10-11 11:47:55
797	6	lo??istikas darbinieks	2021-10-11 12:08:36	2021-10-11 12:08:36
798	6	Automatisko un pusautom??tisko kokapstr??des l??niju operatora, galdnieka	2021-10-12 06:58:25	2021-10-12 06:58:25
799	2	R??gas 17. profesion??li tehnisk?? vidusskola	2021-10-12 07:09:04	2021-10-12 07:09:04
800	0	Amata ze??la diploms	2021-10-12 08:46:29	2021-10-12 08:46:29
801	9	-	2021-10-14 05:48:56	2021-10-14 05:48:56
802	10	-	2021-10-14 05:48:56	2021-10-14 05:48:56
803	11	-	2021-10-14 05:48:56	2021-10-14 05:48:56
804	7	-	2021-10-14 05:59:54	2021-10-14 05:59:54
805	9	Latvijas Universit??te	2021-10-14 06:43:22	2021-10-14 06:43:22
806	10	Profesion??l??s kompetences pilnveides dokuments	2021-10-14 06:43:22	2021-10-14 06:43:22
807	9	M??c??bu process un v??rt????ana kompetenc??s balst??t?? izgl??t??b??	2021-10-14 06:54:16	2021-10-14 06:54:16
808	9	Apm??c??bu programma	2021-10-14 06:55:40	2021-10-14 06:55:40
809	10	Pedago??isk??s darb??bas pamati	2021-10-14 06:55:40	2021-10-14 06:55:40
810	9	Pedagoga profesion??l??s kompetences pilnveides programma	2021-10-14 06:56:34	2021-10-14 06:56:34
811	10	Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom??	2021-10-14 06:57:01	2021-10-14 06:57:01
812	10	???Runas m??ksla un kult??ra m??c??bu proces?????	2021-10-14 07:14:24	2021-10-14 07:14:24
813	5	Profesion??lais ma??istra gr??ds pedago??ij??	2021-10-14 07:54:42	2021-10-14 07:54:42
814	9	Profesion??l?? pilnveides izgl??t??bas programma	2021-10-14 10:24:14	2021-10-14 10:24:14
815	10	Gr??matvedis	2021-10-14 10:24:14	2021-10-14 10:24:14
816	2	Gr??matved??bas un finan??u koled??a	2021-10-14 10:26:04	2021-10-14 10:26:04
817	7	Gr??matved??ba un finanses	2021-10-14 10:26:04	2021-10-14 10:26:04
818	6	Gr??matve??a	2021-10-14 10:26:04	2021-10-14 10:26:04
819	7	Trikot????as r??pniec??bas	2021-10-14 10:39:02	2021-10-14 10:39:02
820	6	Tehnologs	2021-10-14 10:39:02	2021-10-14 10:39:02
821	7	Pirmskolas skolot??ja	2021-10-14 10:52:08	2021-10-14 10:52:08
822	6	Pirmskolas skolot??ja	2021-10-14 10:52:08	2021-10-14 10:52:08
823	0	Profesion??lais ma??istra diploms	2021-10-14 10:58:47	2021-10-14 10:58:47
824	7	Profesion??lais ma??istra gr??ds izgl??t??bas vad??b??	2021-10-14 10:58:47	2021-10-14 10:58:47
825	10	Projektu vad????ana	2021-10-14 11:06:15	2021-10-14 11:06:15
826	2	SIA Dialogs AB m??c??bu centrs	2021-10-14 11:11:31	2021-10-14 11:11:31
827	10	Ang??u valoda ( ar priek??zin????an??m)	2021-10-14 11:11:31	2021-10-14 11:11:31
828	2	M??c??bu centrs MKF	2021-10-14 11:16:01	2021-10-14 11:16:01
829	9	Kurss	2021-10-14 11:16:01	2021-10-14 11:16:01
830	10	Adobe Photoshop	2021-10-14 11:16:01	2021-10-14 11:16:01
831	2	Valsts policijas koled??a	2021-10-14 11:23:33	2021-10-14 11:23:33
832	9	Semin??rs	2021-10-14 11:23:33	2021-10-14 11:23:33
833	10	Komunik??cija un sadarb??ba ar klientiem	2021-10-14 11:23:33	2021-10-14 11:23:33
834	2	M??c??bu centrs Alfa	2021-10-14 11:29:06	2021-10-14 11:29:06
835	9	Pieaugu??o neform??l??s izgl??t??bas programma	2021-10-14 11:29:06	2021-10-14 11:29:06
836	10	Ang??u valoda, nodro??inot profesion??l??s leksikas minimuma apguvi (ar priek??zin????an??m)	2021-10-14 11:29:06	2021-10-14 11:29:06
837	10	Ir ieguvusi ties??bas veikt pedago??isko darb??bu	2021-10-14 11:39:08	2021-10-14 11:39:08
838	7	Biolo??ija un m??jtur??ba	2021-10-14 12:12:37	2021-10-14 12:12:37
839	6	Vidusskolas Biolo??ija un m??jtur??ba skolot??ja	2021-10-14 12:12:37	2021-10-14 12:12:37
840	10	ir ieguvis ties??bas m??c??t soci??l??s  zin??bas pamatizgl??t??bas pak??p??	2021-10-14 12:20:23	2021-10-14 12:20:23
841	9	Pedagogu profesion??l?? pilnveides  programma	2021-10-15 07:20:04	2021-10-15 07:20:04
842	10	Profesion??l??s kompetences pilnveides kursi b??rnu ties??bu aizsardz??bas jom?? "Vec??ku un b??rnu ties??bas, pien??kumi un atbild??ba"	2021-10-15 07:20:04	2021-10-15 07:20:04
843	9	Pedagogu profesion??l??s kompetences pilnveides programma	2021-10-15 07:21:59	2021-10-15 07:21:59
844	10	M??sdien??ga m??c??bu procesa ??steno??ana izgl??tojamiem ar speci??l??m vajadz??b??m???	2021-10-15 07:21:59	2021-10-15 07:21:59
845	10	"Vec??ku un b??rnu ties??bas, pien??kumi un atbild??ba"	2021-10-15 07:23:58	2021-10-15 07:23:58
846	9	Pedagogu profesion??l??s  kompetences pilnveides programma	2021-10-15 07:25:55	2021-10-15 07:25:55
847	10	Pedagogu profesion??l??s kompetences pilnveide tehnolo??iju m??c??bu jomas pedagogiem.	2021-10-15 07:25:55	2021-10-15 07:25:55
848	10	M??rketinga m??c??bu priek??meta saturs, m??r??i un uzdevumi	2021-10-15 07:27:10	2021-10-15 07:27:10
849	10	Kr??slavas un Dagdas novada pedagogu konference "M??sdien??ga m??c??bu stunda"	2021-10-15 07:28:50	2021-10-15 07:28:50
850	9	Neform??l??s izgl??t??bas programma	2021-10-15 07:30:43	2021-10-15 07:30:43
851	10	"Meto??u karuselis" - neform??l??s izgl??t??bas metodes un to izmanto??ana m??c??bu proces??	2021-10-15 07:30:43	2021-10-15 07:30:43
852	10	Likumdo??anas m??c??bu priek??meta saturs, m??r??is, uzdevumi.	2021-10-15 07:32:25	2021-10-15 07:32:25
853	10	Emocion??l?? un soci??l?? intelekta prasmes veiksm??gai stundai	2021-10-15 07:35:49	2021-10-15 07:35:49
854	9	Pedagogu profesion??l?? kvalifik??cijas  pilnveides progrgamma	2021-10-15 07:37:51	2021-10-15 07:37:51
855	10	P??rmai??u dom????anas strat????ija	2021-10-15 07:37:51	2021-10-15 07:37:51
856	5	Zootehni??is	2021-10-15 08:22:08	2021-10-15 08:22:08
857	6	Zooin??eniera	2021-10-15 08:22:08	2021-10-15 08:22:08
858	6	Datorsist??mu tehni??is	2021-10-15 09:29:08	2021-10-15 09:29:08
859	6	Fizisk??s audzin????anas pasniedz??ja	2021-10-15 10:07:49	2021-10-15 10:07:49
860	6	Vidusskolas krievu valodas un literat??ras un latvie??u valodas skolot??ja	2021-10-15 10:11:33	2021-10-15 10:11:33
861	7	Autom??tika un telemeh??nika	2021-10-15 11:51:52	2021-10-15 11:51:52
862	6	In??enieris - elektri??is	2021-10-15 11:51:52	2021-10-15 11:51:52
863	9	Profesion??l??s kompetences pilnveides tie??saistes kursu programma	2021-10-18 05:58:02	2021-10-18 05:58:02
864	10	Iek??aujo????s izgl??t??bas izaicin??jumi profesion??laj?? izgl??t??b??.	2021-10-18 05:58:02	2021-10-18 05:58:02
865	6	??rstniec??ba	2021-10-18 05:58:28	2021-10-18 05:58:28
866	10	Skol??nu m??c??bu uz????mumu  mentora sagatavo??ana jaunie??u uz????m??jsp??ju kompeten??u att??st????anai izgl??t??bas iest??d??.	2021-10-18 06:25:29	2021-10-18 06:25:29
867	9	Profesion??l??s kompetences pilnveides semin??ra programma	2021-10-18 08:58:55	2021-10-18 08:58:55
868	10	Koksnes un koksnes materi??li ar uzlabot??m ??pa????b??m, biorafin????ana, za???? ????mija	2021-10-18 08:58:55	2021-10-18 08:58:55
869	10	Emocion??l??s labsaj??tas veicin????ana pedagogam att??lin??t??s m??c????anas laik??.	2021-10-18 09:13:13	2021-10-18 09:13:13
870	6	programm??t??ja	2021-10-18 09:21:06	2021-10-18 09:21:06
871	1	R??gas kooperat??vais tehnikums	2021-10-18 09:27:40	2021-10-18 09:27:40
872	6	??dienu gatavo??anas tehnologs	2021-10-18 09:27:40	2021-10-18 09:27:40
873	10	Kursu izstr??de un automatiz??cija e- m??c??bu vides platform?? Moodle drukas un mediju tehnolo??iju nozar??	2021-10-18 09:49:49	2021-10-18 09:49:49
874	6	Sabiedrisk??s ??din????anas konditora	2021-10-18 13:07:29	2021-10-18 13:07:29
875	10	Speci??l?? izgl??t??ba (izgl??tojamie ar m??c????an??s trauc??jumiem un gar??g??s att??st??bas trauc??jumiem)	2021-10-18 13:12:33	2021-10-18 13:12:33
876	10	Ang??u valoda	2021-10-18 13:15:41	2021-10-18 13:15:41
877	1	Profesion??l?? vid??j?? izgl??t??ba	2021-10-19 06:16:33	2021-10-19 06:16:33
878	6	Programm????anas tehni??is	2021-10-19 06:16:33	2021-10-19 06:16:33
879	9	Profesion??l??s kompetences pilnveides programma	2021-10-19 06:22:45	2021-10-19 06:22:45
880	10	Darbn??ca izgl??t??bas iest??des darbiniekiem par priek??laic??gas m??c??bu p??rtrauk??anas (PMP) pas??kumu ??steno??anu izgl??t??bas iest??d??s.	2021-10-19 06:22:45	2021-10-19 06:22:45
881	9	Profesion??l?? pilnveide	2021-10-19 06:26:21	2021-10-19 06:26:21
882	10	Emocion??l?? inteli??ence izgl??t??b??	2021-10-19 06:26:21	2021-10-19 06:26:21
883	10	Pirms laika p??rtraukta izgl??t??bas apguve, t??s b??t??ba, c??lo??i un risin????anas iesp??jas izgl??t??bas vid??. Kompetents karjeras att??st??bas atbalsts izgl??tojamo skaita samazin????anai, kuri p??rtrauc izgl??t??bas apguvi pirms laika.	2021-10-19 06:32:59	2021-10-19 06:32:59
884	10	Pirms laika p??rtraukta izgl??t??bas apguve, t??s b??t??ba, c??lo??i un risin????anas iesp??jas	2021-10-19 06:36:27	2021-10-19 06:36:27
885	9	Pedagogu profesion??l??s kompetences pilnveides semin??ra programma	2021-10-19 06:39:32	2021-10-19 06:39:32
886	10	Vesel??ba, labs izskats, harmonija - ar Latvijas produktiem" jeb "Latvij?? ra??oti jaunie produkti un to izmanto??ana ??dienos"	2021-10-19 06:39:32	2021-10-19 06:39:32
887	7	Humanit??ro zin??t??u ma??istra gr??ds filolo??ij??	2021-10-19 07:21:45	2021-10-19 07:21:45
888	6	Humanit??ro zin??t??u ma??istra gr??ds filolo??ij?? (ang??u filolo??ija)	2021-10-19 07:21:45	2021-10-19 07:21:45
889	1	Augst??k??	2021-10-19 07:23:09	2021-10-19 07:23:09
890	11	Pedago??ija	2021-10-19 07:26:37	2021-10-19 07:26:37
891	10	Iesaistes veicin????ana p??rmai??u period??: rakst????anas un las????anas prasmju izstr??de	2021-10-19 07:30:46	2021-10-19 07:30:46
892	9	Intens??vais kurss.	2021-10-19 07:32:59	2021-10-19 07:32:59
893	10	Master Training	2021-10-19 07:32:59	2021-10-19 07:32:59
894	10	Efekt??vs vad??t??js vizu??l?? pl??no??ana	2021-10-19 07:34:23	2021-10-19 07:34:23
895	9	konferece	2021-10-19 11:27:44	2021-10-19 11:27:44
896	10	Datora aizsardz??ba.	2021-10-19 11:27:44	2021-10-19 11:27:44
897	9	Profesion??l??s kompetences pilnveides kursu  programma	2021-10-19 12:26:15	2021-10-19 12:26:15
898	10	Interakt??vi m??c??bu materi??li un to pielieto??ana m??c??bu proces??.	2021-10-19 12:26:15	2021-10-19 12:26:15
899	10	Diversity and Inclusion	2021-10-25 08:24:12	2021-10-25 08:24:12
900	10	How Languages Are Learned	2021-10-25 08:27:58	2021-10-25 08:27:58
901	10	Assessment for Learning	2021-10-25 08:31:23	2021-10-25 08:31:23
902	10	Pronunciation.	2021-10-25 08:34:43	2021-10-25 08:34:43
903	10	Vieglo transportl??dzek??u gr??matved??bas uzskaites aktualit??tes un ietekme uz nodok??u apr????in????anu.	2021-10-27 05:56:39	2021-10-27 05:56:39
904	9	Profesion??l??s kompetences pilnveides kursu programma	2021-10-27 09:34:22	2021-10-27 09:34:22
905	10	Visp??rizgl??tojo??o un profesion??lo  priek??metu pedagogu sadarb??ba , kompeten??u  pieejas m??c??bu  satura ??steno??an??	2021-10-27 12:48:17	2021-10-27 12:48:17
906	10	Akt??v??s m??c????an??s un iesaistes metodes tie??saistes darb??	2021-10-27 13:09:33	2021-10-27 13:09:33
907	5	Profesion??lais ma??istra gr??ds finan??u vad??b??	2021-10-28 11:23:58	2021-10-28 11:23:58
908	6	Finan??u anal??ti??a	2021-10-28 11:23:58	2021-10-28 11:23:58
909	0	Ekonomista diploms	2021-10-28 11:25:58	2021-10-28 11:25:58
910	7	Ekonomists	2021-10-28 11:25:58	2021-10-28 11:25:58
911	0	Profesion??l?? ma??istra diploms	2021-10-28 11:28:47	2021-10-28 11:28:47
912	7	Profesion??lais ma??istra gr??ds finan??u  vad??b??	2021-10-28 11:28:47	2021-10-28 11:28:47
913	10	Iek??aujo????s izgl??t??bas izaicin??jumi profesion??laj?? izgl??t??b??	2021-10-28 11:50:27	2021-10-28 11:50:27
914	10	Talanta potenci??ls jaunie??iem - k?? ieraudz??t un att??st??t.	2021-10-28 11:52:22	2021-10-28 11:52:22
915	6	Soci??lais darbinieks	2021-11-01 10:14:08	2021-11-01 10:14:08
916	11	 11.09.2018.	2021-11-02 11:02:10	2021-11-02 11:02:10
917	11	Gr??matved??ba, anal??ze un audits	2021-11-02 11:02:10	2021-11-02 11:02:10
918	11	33344021_##_Gr??matved??ba 	2021-11-02 11:02:10	2021-11-02 11:02:10
919	11	Starptautisko p??rvad??jumu uz????mumu vad??ba	2021-11-02 11:02:10	2021-11-02 11:02:10
920	11	Lo??istikas procesu vad????ana un eksped??cijas pakalpojumu organiz????ana	2021-11-02 11:02:10	2021-11-02 11:02:10
921	11	Arodskolot??ja pamata pedago??isk?? izgl??t??bas programma	2021-11-02 11:02:10	2021-11-02 11:02:10
922	11	Pedago??isk??s darb??bas pamati 	2021-11-02 11:02:10	2021-11-02 11:02:10
923	11	P??rmai??u un kvalit??tes vad??ba izgl??t??bas iest??d??	2021-11-02 11:02:10	2021-11-02 11:02:10
924	11	Pamatkurss pedago??ij??	2021-11-02 11:02:10	2021-11-02 11:02:10
925	11	M??be??u galdnieks amata zellis	2021-11-02 11:02:10	2021-11-02 11:02:10
926	11	visp??r??j?? vid??j?? izgl??t??ba	2021-11-02 11:02:10	2021-11-02 11:02:10
927	11	Ties??bu zin??tne	2021-11-02 11:02:10	2021-11-02 11:02:10
928	11	Profesion??l??s vid??j??s izgl??t??bas programma	2021-11-02 11:02:10	2021-11-02 11:02:10
929	11	Ties??bu zin??tnes 	2021-11-02 11:02:10	2021-11-02 11:02:10
930	11	????mija	2021-11-02 11:02:10	2021-11-02 11:02:10
931	11	??rstniec??ba	2021-11-02 11:02:10	2021-11-02 11:02:10
932	11	pedagogu profesion??la?? kompetences pilnveide 	2021-11-02 11:02:10	2021-11-02 11:02:10
933	11	v??stures un sabiedr??bas m??c??bas 	2021-11-02 11:02:10	2021-11-02 11:02:10
934	11	ma??istra 	2021-11-02 11:02:10	2021-11-02 11:02:10
935	11	Augstspiediena iespied??ja 	2021-11-02 11:02:10	2021-11-02 11:02:10
936	11	Humanit??ro zin??t??u bakalaurs v??stur?? 	2021-11-02 11:02:10	2021-11-02 11:02:10
937	11	v??sture 	2021-11-02 11:02:10	2021-11-02 11:02:10
938	11	Izgl??t??bas darba vad??t??js un viena m??c??bu priek??meta skolot??js 	2021-11-02 11:02:10	2021-11-02 11:02:10
939	11	pirm?? l??me??a augst??k?? izgl??t??ba 	2021-11-02 11:02:10	2021-11-02 11:02:10
940	11	 91/2019	2021-11-02 11:02:10	2021-11-02 11:02:10
941	11	 15/2018	2021-11-02 11:02:10	2021-11-02 11:02:10
942	11	 3-15/192	2021-11-02 11:02:10	2021-11-02 11:02:10
943	11	33545001_##_Poligr??fijas ra??o??anas tehnolo??ijas un izstr??d??jumu izgatavo??ana 	2021-11-02 11:02:10	2021-11-02 11:02:10
944	11	Fizisk?? kult??ra un sports 	2021-11-02 11:02:10	2021-11-02 11:02:10
945	11	bakalaura 	2021-11-02 11:02:10	2021-11-02 11:02:10
946	11	Bakalaura izgl??t??bas programma 	2021-11-02 11:02:10	2021-11-02 11:02:10
947	11	Muitas un nodok??u administr????ana 	2021-11-02 11:02:10	2021-11-02 11:02:10
948	11	Iest????u darba organiz??cija un vad??ba 	2021-11-02 11:02:10	2021-11-02 11:02:10
949	11	Ener????tika un elektrotehnika   	2021-11-02 11:02:10	2021-11-02 11:02:10
950	11	matem??tika 	2021-11-02 11:02:10	2021-11-02 11:02:10
951	11	????mija un ????mijas tehnolo??ija 	2021-11-02 11:02:10	2021-11-02 11:02:10
952	11	????mijas tehnolo??ija 	2021-11-02 11:02:10	2021-11-02 11:02:10
953	11	Pedago??ija un psiholo??ija 	2021-11-02 11:02:10	2021-11-02 11:02:10
954	11	Ekonomika uz????m??jdarb??bas tiesiskais nodro??in??jums 	2021-11-02 11:02:10	2021-11-02 11:02:10
955	11	Skolot??js 	2021-11-02 11:02:10	2021-11-02 11:02:10
956	11	Arodizgl??t??ba 	2021-11-02 11:02:10	2021-11-02 11:02:10
957	11	Visp??r??j??s vid??j??s izgl??t??bas humanit??r?? un soci??l?? virziena programma 31012012	2021-11-02 11:02:10	2021-11-02 11:02:10
958	11	Uz????m??jdarb??ba un vad????ana 	2021-11-02 11:02:10	2021-11-02 11:02:10
959	11	Izgl??t??bas vad??ba 	2021-11-02 11:02:10	2021-11-02 11:02:10
960	11	Visp??r??j??s vid??j??s izgl??t??bas visp??rizgl??tojo???? virziena programma 	2021-11-02 11:02:10	2021-11-02 11:02:10
961	11	"Inform??tikas un programm????anas skolot??js"profesion??l??s augst??k??s izgl??t??bas bakalaura studiju programma 	2021-11-02 11:02:10	2021-11-02 11:02:10
962	11	profesion??l??s augst??k??s izgl??t??bas bakalaura studiju programma "inform??tikas un programm????anas skolot??js" 	2021-11-02 11:02:10	2021-11-02 11:02:10
963	11	33 525 01 Autotransports 	2021-11-02 11:02:10	2021-11-02 11:02:10
964	11	Autotransports 	2021-11-02 11:02:10	2021-11-02 11:02:10
965	11	Lieti??????s datorzin??tnes 	2021-11-02 11:02:10	2021-11-02 11:02:10
966	11	Pamatskolas ang??u valodas skolot??ja 	2021-11-02 11:02:11	2021-11-02 11:02:11
967	11	Ang??u valoda un literat??ra 	2021-11-02 11:02:11	2021-11-02 11:02:11
968	11	Izgl??t??bas un sporta darba speci??lists 	2021-11-02 11:02:11	2021-11-02 11:02:11
969	11	Soci??lais pedagogs 	2021-11-02 11:02:11	2021-11-02 11:02:11
970	11	doktora studiju programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
971	11	Ma??istra programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
972	11	vidusskolas latvie??u valodas un literat??ras skolot??ja 	2021-11-02 11:02:11	2021-11-02 11:02:11
973	11	Bibliot??kzin??tne 	2021-11-02 11:02:11	2021-11-02 11:02:11
974	11	akad??misk?? bakalaura 	2021-11-02 11:02:11	2021-11-02 11:02:11
975	11	Komerczin??bas  	2021-11-02 11:02:11	2021-11-02 11:02:11
976	11	Visp??r??j??s vid??j??s izgl??t??bas matem??tikas, dabaszin??bu un tehnikas virziena  programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
977	11	doktorant??ra 	2021-11-02 11:02:11	2021-11-02 11:02:11
978	11	doktors 	2021-11-02 11:02:11	2021-11-02 11:02:11
979	11	in??enierzin??t??u doktora 	2021-11-02 11:02:11	2021-11-02 11:02:11
980	11	Visp??r??j??s vid??j??s izgl??t??bas izl??dzino???? programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
981	11	Elektronika 	2021-11-02 11:02:11	2021-11-02 11:02:11
982	11	Pedago??ijas ma??istrs Sporta zin??tn?? 	2021-11-02 11:02:11	2021-11-02 11:02:11
983	11	in??enierzin??t??u ma??istra 	2021-11-02 11:02:11	2021-11-02 11:02:11
984	11	Bakalaura programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
985	11	Pedago??ijas un psiholo??ijas 	2021-11-02 11:02:11	2021-11-02 11:02:11
986	11	B??vniec??ba 	2021-11-02 11:02:11	2021-11-02 11:02:11
987	11	B??vniec??ba un rekonstrukcijas 	2021-11-02 11:02:11	2021-11-02 11:02:11
988	11	Visp??r??j??s vid??j??s izgl??t??bas visp??rizgl??tojo???? virziena programma 31011012	2021-11-02 11:02:11	2021-11-02 11:02:11
989	11	pilnveides Bprogramma 	2021-11-02 11:02:11	2021-11-02 11:02:11
990	11	AKAD??MISK?? DOKTORA AUGST??K?? IZGL??T??BAS 	2021-11-02 11:02:11	2021-11-02 11:02:11
991	11	Arodpedago??isk??s izgl??t??bas pamatprogramma 	2021-11-02 11:02:11	2021-11-02 11:02:11
992	11	vid??ji profesion??l?? 	2021-11-02 11:02:11	2021-11-02 11:02:11
993	11	??urnalistika 	2021-11-02 11:02:11	2021-11-02 11:02:11
994	11	izgl??t??bas zin??tne 	2021-11-02 11:02:11	2021-11-02 11:02:11
995	11	Dzelzce??a  transportu instit??ta doktora studiju programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
996	11	Krievu filolo??ija 	2021-11-02 11:02:11	2021-11-02 11:02:11
997	11	Visp??r??j??s vid??j??s izgl??t??bas matem??tikas, dabaszin??bu un tehnikas virziena maz??kumtaut??bu programma 31013021	2021-11-02 11:02:11	2021-11-02 11:02:11
998	11	papildus profesion??l?? izgl??t??bas programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
999	11	Akad??miska studiju programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
1000	11	Profesion??l?? studiju programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
1001	11	Arodapm??c??bas programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
1002	11	profesion??li  tehnisk??s  vidusskolas izgl??t??bas programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
1003	11	M??ksla 	2021-11-02 11:02:11	2021-11-02 11:02:11
1004	11	Izgl??t??ba 	2021-11-02 11:02:11	2021-11-02 11:02:11
1005	11	Pedago??isk?? izgl??t??bas programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
1006	11	Karjeras konsultants 	2021-11-02 11:02:11	2021-11-02 11:02:11
1007	11	Visp??r??j??s vid??j??s izg??t??bas visp??rizgl??tojo???? virziena izgl??t??bas programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
1008	11	V??stures un soci??lo zin??bu skolot??js 	2021-11-02 11:02:11	2021-11-02 11:02:11
1009	11	ma??istra studijas programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
1010	11	Otr?? l??me??a profesion??l?? augst??k?? izgl??t??ba 	2021-11-02 11:02:11	2021-11-02 11:02:11
1011	11	Vidusskolas inform??tikas skolot??js 	2021-11-02 11:02:11	2021-11-02 11:02:11
1012	11	Vidusskolas v??cu valodas skolot??js 	2021-11-02 11:02:11	2021-11-02 11:02:11
1013	11	Sakumskolas skolot??ja 	2021-11-02 11:02:11	2021-11-02 11:02:11
1014	11	Biznesa vad??ba 	2021-11-02 11:02:11	2021-11-02 11:02:11
1015	11	Civil?? dro????ba un aizsardz??ba 	2021-11-02 11:02:11	2021-11-02 11:02:11
1016	11	33543041_##_Koka izstr??d??jumu izgatavo??ana 	2021-11-02 11:02:11	2021-11-02 11:02:11
1017	11	vidusskolas programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
1018	11	Datorsist??mu, datort??klu administr????ana un programm????ana 	2021-11-02 11:02:11	2021-11-02 11:02:11
1019	11	Visp??r??j??s vid??j??s izgl??t??bas profesion??li orient??ta virziena programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
1020	11	Lauksaimniec??bas mehaniz??cija 	2021-11-02 11:02:11	2021-11-02 11:02:11
1021	11	Dzelzce??a transports 	2021-11-02 11:02:11	2021-11-02 11:02:11
1022	11	Transports 	2021-11-02 11:02:11	2021-11-02 11:02:11
1023	11	S??kumskolas skolot??js ar ties??b??m m??c??t inform??tiku 	2021-11-02 11:02:11	2021-11-02 11:02:11
1024	11	Vidusskolas latvie??u valodas k?? otr??s valodas skolot??js 	2021-11-02 11:02:11	2021-11-02 11:02:11
1025	11	kompoz??cija 	2021-11-02 11:02:11	2021-11-02 11:02:11
1026	11	In??enierzin??t??u bakalaura meh??nikas profila studiju programma 	2021-11-02 11:02:11	2021-11-02 11:02:11
1027	11	Gr??matved??ba 	2021-11-02 11:02:11	2021-11-02 11:02:11
1028	11	profesion??l??s bakalaura augst??k??s izgl??t??bas programma "Sporta zin??tn??s 	2021-11-02 11:02:11	2021-11-02 11:02:11
1029	11	profesion??l??s izgl??t??bas skolot??js 	2021-11-02 11:02:11	2021-11-02 11:02:11
1030	11	Pieaugu??o izgl??t??bas pedagogu profesion??l??s pilnveides programma pedago??ij?? 	2021-11-02 11:02:11	2021-11-02 11:02:11
1031	11	ziedu dizaina skolot??js 	2021-11-02 11:02:11	2021-11-02 11:02:11
1032	11	Visp??r??j??s vid??j??s izgl??t??bas matem??tikas, dabaszin??bu un tehnikas virziena programma 31013011	2021-11-02 11:02:11	2021-11-02 11:02:11
1033	11	RDBF0 Autom??tika un datortehnika 	2021-11-02 11:02:11	2021-11-02 11:02:11
1034	11	izgl??t??bas zin??t??u bakalaura akad??miskais gr??ds sport?? 	2021-11-02 11:02:12	2021-11-02 11:02:12
1035	11	Visp??r??g?? pedago??ija 	2021-11-02 11:02:12	2021-11-02 11:02:12
1036	11	Uz????m??jdarb??bas vad??ba un administr????ana 	2021-11-02 11:02:12	2021-11-02 11:02:12
1037	11	automobi??u elektroiek??rtas un elektronika, iek??dedzes motori, automobi??u remonts. 	2021-11-02 11:02:12	2021-11-02 11:02:12
1038	11	Eiropas ekonomika un bizness 	2021-11-02 11:02:12	2021-11-02 11:02:12
1039	11	Datorzin??tnes 	2021-11-02 11:02:12	2021-11-02 11:02:12
1040	11	pedago??ijas,psiholo??ijas un m??kslas fakult??te 	2021-11-02 11:02:12	2021-11-02 11:02:12
1041	11	Pedago??isk?? prakse studiju laik??. 	2021-11-02 11:02:12	2021-11-02 11:02:12
1042	11	visp??r??j??s vid??j??s 	2021-11-02 11:02:12	2021-11-02 11:02:12
1043	11	Ma??istra studiju programma 	2021-11-02 11:02:12	2021-11-02 11:02:12
1044	11	Dabaszin??t??u bakalaurs datorzin??tn??s 	2021-11-02 11:02:12	2021-11-02 11:02:12
1045	11	Programm????anas un datort??klu administr????ana 	2021-11-02 11:02:12	2021-11-02 11:02:12
1046	11	Izgl??t??bas zin??tnes, valodniec??ba, literat??rzin??tne 	2021-11-02 11:02:12	2021-11-02 11:02:12
1047	11	Uz????m??jdarb??bas vad??ba 	2021-11-02 11:02:12	2021-11-02 11:02:12
1048	11	profesion??l?? bakalaura studiju programma 	2021-11-02 11:02:12	2021-11-02 11:02:12
1049	11	Augst??k?? profesion??l?? pedago??isk?? 	2021-11-02 11:02:12	2021-11-02 11:02:12
1050	11	Pedago??ija un skolvad??ba 	2021-11-02 11:02:12	2021-11-02 11:02:12
1051	11	Ekonomika 	2021-11-02 11:02:12	2021-11-02 11:02:12
1052	11	Uz????m??jdarb??bas ekonomika 	2021-11-02 11:02:12	2021-11-02 11:02:12
1053	11	krievu filolo??ijas bakalaura 	2021-11-02 11:02:12	2021-11-02 11:02:12
1054	11	vidussklas krievu valodas un literat??ras skolot??ja profesion??l?? programma 	2021-11-02 11:02:12	2021-11-02 11:02:12
1055	11	visp??r??j??s vid??j??s izgl??t??bas 	2021-11-02 11:02:12	2021-11-02 11:02:12
1056	11	Programm????ana 	2021-11-02 11:02:12	2021-11-02 11:02:12
1057	11	Pieaugu??o izgl??t??ba	2021-11-02 11:02:12	2021-11-02 11:02:12
1058	11	bakalaura studiju programma 	2021-11-02 11:02:12	2021-11-02 11:02:12
1059	11	Dabaszin??t??u un inform??cijas tehnolo??ijas skolot??js 	2021-11-02 11:02:12	2021-11-02 11:02:12
1060	11	Dabas zin??t??u fakult??te 	2021-11-02 11:02:12	2021-11-02 11:02:12
1061	11	Profesion??l?? ma??istra programma 	2021-11-02 11:02:12	2021-11-02 11:02:12
1062	11	Inform??cijas tehnolo??ijas 	2021-11-02 11:02:12	2021-11-02 11:02:12
1063	11	Ekonomista 	2021-11-02 11:02:12	2021-11-02 11:02:12
1064	11	Atbalsts visp??r??j??s izgl??t??bas pedagogu nodro??in????anai priorit??rajos m??c??bu priek??metos 	2021-11-02 11:02:12	2021-11-02 11:02:12
1065	11	Lauksaimniec??bas ener????tikas bakalaura 	2021-11-02 11:02:12	2021-11-02 11:02:12
1066	11	Dzelzce??a pakalpojumi 	2021-11-02 11:02:12	2021-11-02 11:02:12
1067	11	Telemeh??nika un lo??istika 	2021-11-02 11:02:12	2021-11-02 11:02:12
1068	11	Person??la psiholo??ija un cilv??kresursu vad??ba 	2021-11-02 11:02:12	2021-11-02 11:02:12
1069	11	Viesn??cu serviss 	2021-11-02 11:02:12	2021-11-02 11:02:12
1070	11	ma??istru studijas programma 	2021-11-02 11:02:12	2021-11-02 11:02:12
1071	11	Profesion??lais ma??istra gr??ds izgl??t??b?? 	2021-11-02 11:02:12	2021-11-02 11:02:12
1072	11	Filolo??ija 	2021-11-02 11:02:12	2021-11-02 11:02:12
1073	11	ang??u valoda pamatskol?? 	2021-11-02 11:02:12	2021-11-02 11:02:12
1074	11	Pamatizgl??t??bas programma 	2021-11-02 11:02:12	2021-11-02 11:02:12
1075	11	Ang??u filolo??ija 	2021-11-02 11:02:12	2021-11-02 11:02:12
1076	11	pedago??ijas ma??istra 	2021-11-02 11:02:12	2021-11-02 11:02:12
1077	11	Visp??r??j??s vid??j??s izgl??t??bas matem??tikas, dabaszin??bu un tehnikas virziena programma 	2021-11-02 11:02:12	2021-11-02 11:02:12
1078	11	33545021_##_Poligr??fija un izdev??jdarb??ba 	2021-11-02 11:02:12	2021-11-02 11:02:12
1079	11	Bakalura 	2021-11-02 11:02:12	2021-11-02 11:02:12
1080	11	Augst??k?? izgl??t??bas programma 	2021-11-02 11:02:12	2021-11-02 11:02:12
1081	11	Psiholo??ija 	2021-11-02 11:02:12	2021-11-02 11:02:12
1082	11	Arodpedago??ija 	2021-11-02 11:02:12	2021-11-02 11:02:12
1083	11	Telekomunik??cijas 	2021-11-02 11:02:12	2021-11-02 11:02:12
1084	11	Vides zin??tne 	2021-11-02 11:02:12	2021-11-02 11:02:12
1085	11	Izgl??t??bas zin??t??u ma??istrs pedago??ij?? 	2021-11-02 11:02:12	2021-11-02 11:02:12
1086	11	ma??istra studiju programma "Organiz??cijas vad??ba" 	2021-11-02 11:02:12	2021-11-02 11:02:12
1087	11	Saimniecisk??s darb??bas uzskaite, kontrole un anal??ze 	2021-11-02 11:02:12	2021-11-02 11:02:12
1088	11	D??rzkop??ba 	2021-11-02 11:02:12	2021-11-02 11:02:12
1089	11	soci??lo zin??t??u bakalaurs ekonomik?? 	2021-11-02 11:02:12	2021-11-02 11:02:12
1090	11	Lauksaimniec??bas in??enierzin??tne 	2021-11-02 11:02:12	2021-11-02 11:02:12
1091	11	Pedago??ija 72.st. 	2021-11-02 11:02:12	2021-11-02 11:02:12
1092	11	profesion??l?? mag??stra 	2021-11-02 11:02:12	2021-11-02 11:02:12
1093	11	Datorsist??mas 	2021-11-02 11:02:13	2021-11-02 11:02:13
1094	11	pilnvreides B programma 	2021-11-02 11:02:13	2021-11-02 11:02:13
1095	11	Karjeras konsultants un jaunatnes lietu speci??lists 	2021-11-02 11:02:13	2021-11-02 11:02:13
1096	11	Vad??bas zin??tne un administr????ana 	2021-11-02 11:02:13	2021-11-02 11:02:13
1097	11	Uz????m??jdarb??bas ekonomika un administrat??vais darbs 	2021-11-02 11:02:13	2021-11-02 11:02:13
1098	11	Pedagogu izgl??t??ba un izgl??t??bas zin??tnes 	2021-11-02 11:02:13	2021-11-02 11:02:13
1099	11	Kokizstr??d??jumu izgatavo??ana 	2021-11-02 11:02:13	2021-11-02 11:02:13
1100	11	visp??r??j?? vid??j??s izgl??t??bas programma 	2021-11-02 11:02:13	2021-11-02 11:02:13
1101	11	Projektu vad????ana 	2021-11-02 11:02:13	2021-11-02 11:02:13
1102	11	35b545001_##_Poligr??fijas ra??o??anas tehnolo??ijas un izstr??d??jumu izgatavo??ana 	2021-11-02 11:02:13	2021-11-02 11:02:13
1103	11	Poligr??fija un izdev??jdarb??ba  	2021-11-02 11:02:13	2021-11-02 11:02:13
1104	11	Starptautiskie tirdzniec??bas dar??jumi un lo??istika 	2021-11-02 11:02:13	2021-11-02 11:02:13
1105	11	profesion??l??s  augst??k??s izgl??t??bas  ma??istra 	2021-11-02 11:02:13	2021-11-02 11:02:13
1106	11	profesion??l?? augst??k?? izgl??t??bas ma??istra programma 	2021-11-02 11:02:13	2021-11-02 11:02:13
1107	11	Uz????m??jdarb??ba 	2021-11-02 11:02:13	2021-11-02 11:02:13
1108	11	poloigr??fijas ra??o??anas tehnolo??ijas 	2021-11-02 11:02:13	2021-11-02 11:02:13
1109	11	DOKTURANT??RA 	2021-11-02 11:02:13	2021-11-02 11:02:13
1110	11	Izgl??t??bas un sporta zin??tne 	2021-11-02 11:02:13	2021-11-02 11:02:13
1111	11	v??stures 	2021-11-02 11:02:13	2021-11-02 11:02:13
1112	11	vad??bzin??tn?? 	2021-11-02 11:02:13	2021-11-02 11:02:13
1113	11	Sekret??rs - Lietvedis 	2021-11-02 11:02:13	2021-11-02 11:02:13
1114	11	Doktora studiju programmas 	2021-11-02 11:02:13	2021-11-02 11:02:13
1115	11	Ang??u valoda 	2021-11-02 11:02:13	2021-11-02 11:02:13
1116	11	Visp??r??j??s vid??j??s izgl??t??bas visp??rizgl??tojo???? virziena maz??kumtaut??bu programma 	2021-11-02 11:02:13	2021-11-02 11:02:13
1117	11	??????anas r??pniec??ba 	2021-11-02 11:02:13	2021-11-02 11:02:13
1118	11	Profesion??l??s pilnveides izgl??t??bas programma	2021-11-02 11:02:13	2021-11-02 11:02:13
1119	11	profesion??l?? t??l??kizgl??t??bas programma	2021-11-02 11:02:13	2021-11-02 11:02:13
1120	10	Speci??l??s zin????anas b??rnu ties??bu  aizsardz??bas  jom??	2021-11-02 11:03:11	2021-11-02 11:03:11
1121	10	Efekt??vs audzin??t??js	2021-11-02 11:03:11	2021-11-02 11:03:11
1122	10	Priek??laic??gas m??c??bu p??rtrauk??anas (PMP) pas??kumu ??steno??ana izgl??t??bas iest??d??	2021-11-02 11:03:11	2021-11-02 11:03:11
1123	10	Pirms laika p??rtraukta izgl??t??bas apguve, t??s b??t??ba, c??lo??i un risin????anas iesp??jas izgl??t??bas vid??. Kompotents karjeras att??st??bas atbalsts izgl??tojamo skaita samazin????anai, kuri p??rtrauc izgl??t??bas apguvi pirms laika.	2021-11-02 11:03:11	2021-11-02 11:03:11
1124	10	Pirms laika p??rtraukta izgl??t??bas apguve, t??s b??t??ba, c??lo??i un risin????anas iesp??jas izgl??t??bas vid??.	2021-11-02 11:03:11	2021-11-02 11:03:11
1125	10	Speci??lo zin????anu  b??rnu ties??bu aizsardz??bas jom?? apguve	2021-11-02 11:03:11	2021-11-02 11:03:11
1126	10	Pedagogu iesaiste Erasmus+ programm??	2021-11-02 11:03:11	2021-11-02 11:03:11
1127	10	Lo??istikas procesu vad????ana un eksped??cijas pakalpojumu organiz????ana	2021-11-02 11:03:11	2021-11-02 11:03:11
1128	10	Ir ieguvis ties??bas veikt pedago??isko darb??bu	2021-11-02 11:03:11	2021-11-02 11:03:11
1129	10	B??rnu ties??bas un to  aizsardz??ba	2021-11-02 11:03:11	2021-11-02 11:03:11
1130	10	Prezent??ciju veido??ana darbam tie??sait??	2021-11-02 11:03:11	2021-11-02 11:03:11
1131	10	Noliktavas procesu optimiz??cija vado??ajam person??lam.	2021-11-02 11:03:11	2021-11-02 11:03:11
1132	10	Efekt??vas m??c????an??s pamati. M??c????an??s un uzved??bas motiv??cija. Labv??l??gs psiholo??isk??s vides veido??ana izgl??t??bas iest??d??. Labv??l??gas uzved??bas veido??anas pamati.	2021-11-02 11:03:11	2021-11-02 11:03:11
1133	10	Projekta m??r??a grupas sta??????an??s Latvij?? lo??histikas nozar??	2021-11-02 11:03:11	2021-11-02 11:03:11
1134	10	Noliktavas procesu optimiz??cija(iek????j?? lo??istika uz????mum??)	2021-11-02 11:03:11	2021-11-02 11:03:11
1135	10	Tehnisk??s inform??cijas un autop??rvad??jumi, profesion??lo C1, C, D1, D, E transporta l??dzek??u vad??t??ju autoskolas apm??c??bas   pasniedz??js	2021-11-02 11:03:11	2021-11-02 11:03:11
1136	10	Electude - virtu??l??s apm??c??bas programma	2021-11-02 11:03:11	2021-11-02 11:03:11
1137	10	Ir ties??bas str??d??t par pedagogu profesion??las izgl??t??bas iest??d??s	2021-11-02 11:03:11	2021-11-02 11:03:11
1138	10	Speci??l??s zin????anas pedagogiem b??rnu ties??bu aizsardz??bas jom?? (A)	2021-11-02 11:03:11	2021-11-02 11:03:11
1139	10	Darbs jaunatnes jom?? ar priek??laic??gas m??c??bu p??rtrauk??anas riska grupas jaunie??iem	2021-11-02 11:03:11	2021-11-02 11:03:11
1140	10	Efekt??va komunik??cija	2021-11-02 11:03:11	2021-11-02 11:03:11
1141	10	Port??la Uzdevumi.lv iek??au??ana skolas m??c??bu proces??	2021-11-02 11:03:11	2021-11-02 11:03:11
1142	10	P??rmai??u un kvalit??tes vad??ba izgl??t??bas iest??d??	2021-11-02 11:03:11	2021-11-02 11:03:11
1143	10	Speci??l??s zin????anas B??rnu ties??bu aizsardz??bas jaut??jumos	2021-11-02 11:03:11	2021-11-02 11:03:11
1144	10	Sabiedr??bas un cilv??ka dro????ba	2021-11-02 11:03:11	2021-11-02 11:03:11
1145	10	M??sdien??ga komunik??cija 21. gadsimt?? - soci??lo t??klu un interneta atbild??ga un dro??a lieto??ana. "Interneta atbild??ga lieto??ana"	2021-11-02 11:03:11	2021-11-02 11:03:11
1146	10	Darbs ar simul??cijas iek??rtu - programmu  "Mastercam Educational Suite"	2021-11-02 11:03:11	2021-11-02 11:03:11
1147	10	M??sdien??ga komunik??cija 21. gadsimt?? - soci??lo t??klu un interneta atbild??ga un dro??a lieto??ana. Interneta atbild??ga lieto??ana	2021-11-02 11:03:11	2021-11-02 11:03:11
1148	10	Rokas elektroinstrumentu pielieto??ana kokizstr??d??jumu izgatavo??an??	2021-11-02 11:03:11	2021-11-02 11:03:11
1149	10	Pedagogu profesion??lo kompete????u pilnveide m??sdien??gu, m??c??bu procesa efektivit??ti sekm??jo??u e-r??ku (e- skolvad??bas un e- studiju vides, mobil??s aplik??cijas t??mek??a vietnes un.c.) lieto??an??.	2021-11-02 11:03:11	2021-11-02 11:03:11
1150	10	Gr??matved??bas uzskaites pamati	2021-11-02 11:03:11	2021-11-02 11:03:11
1151	10	Arodskolot??ja pamata pedago??isk??s izgl??t??bas programma	2021-11-02 11:03:11	2021-11-02 11:03:11
1152	10	"Pedago??isk??s darb??bas pamati"	2021-11-02 11:03:11	2021-11-02 11:03:11
1153	10	B??rnu ties??bas un  to aizsardz??ba	2021-11-02 11:03:11	2021-11-02 11:03:11
1154	10	Lieti?????? eti??ete virtu??l?? telp??.	2021-11-02 11:03:11	2021-11-02 11:03:11
1155	10	Efekt??vas , uz skol??nu v??rstas  m??c??bu stundas organiz????ana	2021-11-02 11:03:11	2021-11-02 11:03:11
1156	10	Videi r??ku un video materi??lu izmanto??ana att??lin??to m??c??bu proces??	2021-11-02 11:03:11	2021-11-02 11:03:11
1157	10	,,Skol??nu m??c??bu uz????mumu (SMU) mentora sagatavo??ana jaunie??u uz????m??jsp??ju kompeten??u att??st????anai izgl??t??bas iest??d??"	2021-11-02 11:03:11	2021-11-02 11:03:11
1158	10	Microsoft Teams - efekt??vai skolas sazi??as  nodro??in????anai	2021-11-02 11:03:11	2021-11-02 11:03:11
1159	10	Komerczin??bu modul??r??s profesion??l??s  izgl??t??bas  programmu aprob??cija, m??c??bu sasniegumu rezult??tu v??rt????ana  un izaicin??jumi darba vid??	2021-11-02 11:03:11	2021-11-02 11:03:11
1160	10	Ievads  eTwinning	2021-11-02 11:03:11	2021-11-02 11:03:11
1161	10	Skol??nu m??c??bu uz????mumi k?? m??c??bu metode.	2021-11-02 11:03:11	2021-11-02 11:03:11
1162	10	,Skol??nu m??c??bu uz????mumu (SMU) mentora sagatavo??ana jaunie??u uz????m??jsp??ju kompeten??u att??st????anai izgl??t??bas iest??d??"	2021-11-02 11:03:11	2021-11-02 11:03:11
1163	10	Gr??matved??bas akad??mijas intens??vais kurss	2021-11-02 11:03:11	2021-11-02 11:03:11
1164	10	Rado??a pieeja darb??bai biznes?? un izgl??t??b??	2021-11-02 11:03:11	2021-11-02 11:03:11
1165	10	M??sdien??ga komunik??cija 21. gadsimt?? - soci??lo t??klu un interneta atbild??ga un dro??a lieto??ana. Interneta atbild??ga lieto??ana.	2021-11-02 11:03:11	2021-11-02 11:03:11
1166	10	Izgl??tojamo uzved??bas korekcijas iesp??jas un l??dzek??i	2021-11-02 11:03:11	2021-11-02 11:03:11
1167	10	Speci??l??s zin????anas  b??rnu ties??bu aizsardz??bas jom??	2021-11-02 11:03:11	2021-11-02 11:03:11
1168	10	????mja k?? priorit??te	2021-11-02 11:03:11	2021-11-02 11:03:11
1169	10	Skol??nu m??c??bu uz????mumi k?? m??c??bu metode	2021-11-02 11:03:11	2021-11-02 11:03:11
1170	10	5. moduli J??gpilnas m??c????an??s pamati	2021-11-02 11:03:11	2021-11-02 11:03:11
1171	10	Format??v?? v??rt????ana lietprat??bas kontekst??.	2021-11-02 11:03:11	2021-11-02 11:03:11
1172	10	Pedagogu profesion??lo kompete????u pilnveide v??rt????anas un p??rbaudes darbu izstr??des jaut??jumos	2021-11-02 11:03:11	2021-11-02 11:03:11
1173	10	????mija k?? priorit??te	2021-11-02 11:03:11	2021-11-02 11:03:11
1174	10	Efekt??va karjeras att??st??as atbalsta sist??ma izgl??t??bas iest??d??: pl??notais un idejas ??steno??anai. Audz??k??u m??c??bu sasniegumu v??rt????ana . Prasmes n??kotnes cilv??kiem. Metodisk?? darba pl??no??ana saska???? ar RVT darba pl??nu 2018/19. m.g. un.t.t.	2021-11-02 11:03:11	2021-11-02 11:03:11
1175	10	Vilnius vocational school of railway and business services, shared her Professional experience and increased knowiedge on vocational training system of the Republic of Lithuania	2021-11-02 11:03:11	2021-11-02 11:03:11
1176	10	Efekt??vs skolot??js	2021-11-02 11:03:11	2021-11-02 11:03:11
1177	10	M??c??bu  saturs un pieejas akcenti kult??ras pamatos un kult??ra un m??ksla	2021-11-02 11:03:11	2021-11-02 11:03:11
1178	10	Augsta l??me??a programm????anas m??c??bas  - 1.l??menis	2021-11-02 11:03:11	2021-11-02 11:03:11
1179	10	Latvie??u interpunkcija - teorija un prakse.	2021-11-02 11:03:11	2021-11-02 11:03:11
1180	10	Etnisk??s saska??as un starpkult??ru dialoga sekm????ana skol??s m??c??bu priek??metos un audzin????anas darb??.	2021-11-02 11:03:11	2021-11-02 11:03:11
1181	10	IT izmanto??ana m??sdien??g?? kl??tienes un att??lin??t?? m??c??bu proces??	2021-11-02 11:03:11	2021-11-02 11:03:11
1182	10	Kompete????u pieejas iesp??jas latvie??u valodas un literat??ras skolot??jiem	2021-11-02 11:03:11	2021-11-02 11:03:11
1183	10	Digit??l??s tehnolo??ijas un prasmes	2021-11-02 11:03:11	2021-11-02 11:03:11
1184	10	Sabiedr??ba un cilv??ku dro????ba	2021-11-02 11:03:11	2021-11-02 11:03:11
1185	10	T??m????anas pamati	2021-11-02 11:03:11	2021-11-02 11:03:11
1186	10	Uz????muma att??st??ba ??odien un r??t: digit??l?? laikmeta izaicin??jumi.	2021-11-02 11:03:11	2021-11-02 11:03:11
1187	10	Cilv??ks soci??laj?? vid??. Pedago??isk??s darb??bas pl??no??ana karjeras izv??les pas??kumos, sadarb??ba un mijiedarb??ba ar audz??k??iem satura un formu izv??le.	2021-11-02 11:03:11	2021-11-02 11:03:11
1188	10	Kompetenc??s balst??ta m??c????ana, savstarp??ji sadarbojoties un izejot ??rpus m??c??bu priek??meta tradicion??lajiem r??mjiem	2021-11-02 11:03:11	2021-11-02 11:03:11
1189	10	Liter??r?? mantojuma veiksm??ga integr??cija latvie??u valodas un literat??ras stund??s.	2021-11-02 11:03:11	2021-11-02 11:03:11
1190	10	Skol??na m??c????an??s iedzi??inoties	2021-11-02 11:03:11	2021-11-02 11:03:11
1191	10	izgl??t??bas iest??des darbiniekiem par priek??laic??gas m??c??bu  p??rtrauk??anas (PMP) pas??kuma ??steno??anu izgl??t??bas iest??d??s.	2021-11-02 11:03:11	2021-11-02 11:03:11
1192	10	Kompeten??u pieejas iesp??jas latvie??u valodas un literat??ras, un v??stures stund??s	2021-11-02 11:03:11	2021-11-02 11:03:11
1193	10	Profesion??l??s kvalifik??cijas pilnveides izgl. programma b??rnu ties??bu aizsardz??bas jom?? pedagogiem	2021-11-02 11:03:11	2021-11-02 11:03:11
1194	10	M??sdien??ga m??c??bu un audzin????anas procesa anal??zes teor??tiskie un praktiskie aspekti, v??rojot m??c??bu stundas.	2021-11-02 11:03:11	2021-11-02 11:03:11
1195	10	V??rds k?? nazis	2021-11-02 11:03:11	2021-11-02 11:03:11
1196	10	V??rds k?? nazis.	2021-11-02 11:03:11	2021-11-02 11:03:11
1197	10	Profesion??l??s izgl??t??bas iest????u visp??rizgl??tojo??o un profesion??lo m??c??bu priek??metu sadarb??ba kompeten??u pieejas ??steno??an??.	2021-11-02 11:03:11	2021-11-02 11:03:11
1198	10	Kompete????u pieejas iesp??jas latvie??u valodas un literat??ras, un v??stures stund??s.	2021-11-02 11:03:11	2021-11-02 11:03:11
1199	10	Etnisk??s saska??as un starpkult??ru dialoga jaut??jumi kompetenc??s balst??t?? izgl??t??bas satur??	2021-11-02 11:03:11	2021-11-02 11:03:11
1265	9	Digit??l?? sazi??a ar valsti: dz??ves situ??cij??s noder??gi e-risin??jumi 	2021-11-02 11:04:26	2021-11-02 11:04:26
1200	10	Kompetenc??s balst??ta m??c????ana, savstarp??ji sadarbojoties un izejot ??rpus m??c??bu priek??meta tradicion??lajiem r??mjiem.	2021-11-02 11:03:11	2021-11-02 11:03:11
1201	10	Culture - based Multilingual Blended -learning Language Course for the Enhancement of Adult Learners 21st Century Skills.	2021-11-02 11:03:11	2021-11-02 11:03:11
1202	10	Kvalitat??va tie??saistes m??c??bu procesa organiz????ana.	2021-11-02 11:03:11	2021-11-02 11:03:11
1203	10	Auto Cad met??lapstr??d??	2021-11-02 11:03:11	2021-11-02 11:03:11
1204	10	Produktivit??tes higi??na	2021-11-02 11:03:11	2021-11-02 11:03:11
1205	10	Motivating communicative activities	2021-11-02 11:03:11	2021-11-02 11:03:11
1206	10	Getting More Engagement wit Warrn-ups, Brain breaks and Wrap - ups.	2021-11-02 11:03:11	2021-11-02 11:03:11
1207	10	EXPRESS E-DAY 2021: ???Teaching at a time of change 2???	2021-11-02 11:03:11	2021-11-02 11:03:11
1208	10	Pedagogu digit??l??s lietprat??bas pilnveide e- vid?? par m??c????an??s vad??bas risin??jumu un  integr??to m??ko??pakalpojumu izmanto??anu???	2021-11-02 11:03:11	2021-11-02 11:03:11
1209	10	Microsoft  Office 365  izmanto??ana izgl??t??bas proces??	2021-11-02 11:03:11	2021-11-02 11:03:11
1210	10	Inform??cijas kr??ze, inform??cijas trauc??jumi, v??rtu sarg????ana un faktu p??rbaude.	2021-11-02 11:03:11	2021-11-02 11:03:11
1211	10	E -vides dro????ba m????izgl??t??bas modul?? "Inform??cijas un komunik??cijas tehnolo??ijas"	2021-11-02 11:03:11	2021-11-02 11:03:11
1212	10	Kompete????u pieejas ??steno??ana caur digit??laj??m prasm??m.	2021-11-02 11:03:11	2021-11-02 11:03:11
1213	10	Fusion 360 darbn??ca	2021-11-02 11:03:11	2021-11-02 11:03:11
1214	10	Pedagogu digit??l??s prasmes.	2021-11-02 11:03:11	2021-11-02 11:03:11
1215	10	Infografika - labs pal??gs datu vizu??lajai att??lo??anai.	2021-11-02 11:03:11	2021-11-02 11:03:11
1216	10	Pieaugu??o m??c????ana un m??c????an??s probl??mas risin??jumi.	2021-11-02 11:03:11	2021-11-02 11:03:11
1217	10	Visp??rizgl??tojo??o un profesion??lo m??c??bu priek??metu pedagogu sadarb??ba, ??stenojot m??sdien??gu m??c??bu procesu	2021-11-02 11:03:11	2021-11-02 11:03:11
1218	10	Pedago??iskie pamati	2021-11-02 11:03:11	2021-11-02 11:03:11
1219	10	Kvalitat??va tie??saistes m??c??bu procesa organiz????ana	2021-11-02 11:03:11	2021-11-02 11:03:11
1220	10	Pedagoga loma un l??dervad??bas pamati p??rmai??u laik??	2021-11-02 11:03:11	2021-11-02 11:03:11
1221	10	Kibersocializ??cijas att??st??ba, riski un risin??jumi izgl??t??bas proces??	2021-11-02 11:03:11	2021-11-02 11:03:11
1222	10	Sabiedr??bas un cilv??ka dro????ba.	2021-11-02 11:03:11	2021-11-02 11:03:11
1223	10	Sadarb??bas darbn??ca "Skolot??ji un vec??ki pret COVID-19 izaicin??jumiem"	2021-11-02 11:03:11	2021-11-02 11:03:11
1224	10	EPALE platformas un iesp??jas lieto??ana	2021-11-02 11:03:11	2021-11-02 11:03:11
1225	10	Androgo??ija 2.0 - m??c??bu procesa pl??no??ana, nov??rt????ana un izgl??t??bas tehnolo??ijas pieaugu??o izgl??t??b??	2021-11-02 11:03:11	2021-11-02 11:03:11
1226	9	M??c??mies m??c??ties sve??valodas 	2021-11-02 11:04:26	2021-11-02 11:04:26
1227	9	P??rmai??as izgl??t??bas iest????u darb??bas un izgl??t??bas programmu ??steno??anas kvalit??tes v??rt????an?? 2018./2019. m??c??bu gad?? un akredit??cijas procesa pilnveide A 	2021-11-02 11:04:26	2021-11-02 11:04:26
1228	9	Intens??vs kurss	2021-11-02 11:04:26	2021-11-02 11:04:26
1229	9	Profesion??l??s kompetences pilnveides kursi	2021-11-02 11:04:26	2021-11-02 11:04:26
1230	9	Pedagogu profesion??l??s kvalifik??cijas pilnveides programma	2021-11-02 11:04:26	2021-11-02 11:04:26
1231	9	Apm??c??bas kurss	2021-11-02 11:04:26	2021-11-02 11:04:26
1232	9	apguvis sta??????an??s programmu Ener????tikas nozar??  	2021-11-02 11:04:26	2021-11-02 11:04:26
1233	9	Profesion??l??s t??l??kizgl??t??bas kursu programma	2021-11-02 11:04:26	2021-11-02 11:04:26
1234	9	Kursu programma	2021-11-02 11:04:26	2021-11-02 11:04:26
1235	9	Sta??????an??s programma	2021-11-02 11:04:26	2021-11-02 11:04:26
1236	9	Kurss.	2021-11-02 11:04:26	2021-11-02 11:04:26
1237	9	TRANSPORTA UN KRAVAS BIRZAS CARGO.lT IZMANTO??ANA TRANSPORTA UN LO??ISTIKAS JOM??. 	2021-11-02 11:04:26	2021-11-02 11:04:26
1238	9	Lo??istikas procesu vad????ana un eksped??cijas pakalpojumu organiz????ana 	2021-11-02 11:04:26	2021-11-02 11:04:26
1239	9	Izgl??t??bas programma	2021-11-02 11:04:26	2021-11-02 11:04:26
1240	9	Profesion??l??s kompetences pilnveides semin??rs	2021-11-02 11:04:26	2021-11-02 11:04:26
1241	9	M??sdienu pedago??ijas psiholo??iskie aspekti. stresa vad??ba 	2021-11-02 11:04:26	2021-11-02 11:04:26
1242	9	Pedagogu profeison??lo sasniegumu mape -praktiskie padomi t?? izveidei un aktualiz??cijai. Efekt??vas karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d??. unt.t. 	2021-11-02 11:04:26	2021-11-02 11:04:26
1243	9	Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:26	2021-11-02 11:04:26
1244	9	,Projekta m??r??a grupas sta??????an??s Latvij?? transporta nozar??" dzelzce??a jom?? 	2021-11-02 11:04:26	2021-11-02 11:04:26
1245	9	ZF/SACHS piedzi??as sist??ma 	2021-11-02 11:04:26	2021-11-02 11:04:26
1246	9	Pedago??isk??s  darb??bas pamati (B) 	2021-11-02 11:04:26	2021-11-02 11:04:26
1247	9	Apm??c??bu kurss	2021-11-02 11:04:26	2021-11-02 11:04:26
1248	9	  Speci??l??s zin????anas  b??rnu ties??bu aizsardz??bas jom??  	2021-11-02 11:04:26	2021-11-02 11:04:26
1249	9	Attractive e-learning materials for provision of qualitative education. 	2021-11-02 11:04:26	2021-11-02 11:04:26
1250	9	M??c??bu programma	2021-11-02 11:04:26	2021-11-02 11:04:26
1251	9	Profesion??l?? pilnveides semin??rs	2021-11-02 11:04:26	2021-11-02 11:04:26
1252	9	"M??sdienu izgl??t??bas vad??bas psiholo??iskie aspekti. Konfliktu vad??ba. 	2021-11-02 11:04:26	2021-11-02 11:04:26
1253	9	Pedagoga loma eti??etes un saskarsmes kult??rprasmju, un caurviju kompete????u att??st??b?? m??c??bu stund??s un skol?? N??ciju ??tika. Komunik??ciju ??tika. A 	2021-11-02 11:04:26	2021-11-02 11:04:26
1254	9	M??sdienu izgl??t??bas , vad??bas psiholo??iskie aspekti konfliktu vad??ba 	2021-11-02 11:04:26	2021-11-02 11:04:26
1255	9	M??sdienu izgl??t??bas , vad??bas psiholo??iskie aspekti stresa vad??ba 	2021-11-02 11:04:26	2021-11-02 11:04:26
1256	9	Profesion??l??s pilnveides semin??rs	2021-11-02 11:04:26	2021-11-02 11:04:26
1257	9	Efekt??va karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d??: pl??notais un idejas ??steno??anai. Skolot??ja pozit??vais t??ls t.sk. masu m??dijos : praktiskie aspekti un.tt. 	2021-11-02 11:04:26	2021-11-02 11:04:26
1258	9	Gada kr??sa iek??telpu dizain??. 	2021-11-02 11:04:26	2021-11-02 11:04:26
1259	9	,,Modul??ro izgl??t??bas programmu ??steno??ana"" 	2021-11-02 11:04:26	2021-11-02 11:04:26
1260	9	   Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:26	2021-11-02 11:04:26
1261	9	Pedagoga profesion??l?? pilnveides kurss	2021-11-02 11:04:26	2021-11-02 11:04:26
1262	9	Tie??saistes m??c??bas - vebin??rs	2021-11-02 11:04:26	2021-11-02 11:04:26
1263	9	Apm??c??bu semin??rs	2021-11-02 11:04:26	2021-11-02 11:04:26
1264	9	Apguvusi pedagogu profesion??l??s pilnveides A programmu ,,Skol??nu m??c??bu uz????mumu (SMU) mentora sagatavo??ana jaunie??u uz????m??jsp??ju kompeten??u att??st????anai izgl??t??bas iest??d??"	2021-11-02 11:04:26	2021-11-02 11:04:26
1266	9	modularo programmu ??steno??anas praktiskie aspekti. Pedagoga profesion??lo sasniegumu mape - praktiski padomi t?? izveidei un aktualiz??cijai. Efekt??va karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d?? pl??notais un idejas ??steno??anai. Un t.t 	2021-11-02 11:04:26	2021-11-02 11:04:26
1267	9	Jaunie??u motiv????ana uz????m??jdarb??bas uzs??k??anai 	2021-11-02 11:04:26	2021-11-02 11:04:26
1268	9	Pedagogu sadarb??ba lietprat??b?? balst??tas m??c??bu stundas pl??no??an?? un vad????an?? 	2021-11-02 11:04:26	2021-11-02 11:04:26
1269	9	"M??c????an??s lietprat??bai matem??tikas, dabaszin??t??u, tehnolo??iju m??c??bu jom??s" II (turpin??jums) 	2021-11-02 11:04:26	2021-11-02 11:04:26
1270	9	Ir apguvusi pedagogu profesion??l??s kompetences pilnveides kursu programmu, piedaloties darbn??c?? izgl??t??bas iest??des darbiniekiem par priek??laic??gas m??c??bu p??rtrauk??anas (PMP) pas??kumu ??steno??anu izgl??t??bas iest??d??s 	2021-11-02 11:04:26	2021-11-02 11:04:26
1271	9	,,Mentorings - efekt??vs atbalsts jaunajiem pedagogiem" 	2021-11-02 11:04:26	2021-11-02 11:04:26
1272	9	 ,,M??c????an??s lietprat??bai  dabaszin??t??u m??c??bu jom??"  	2021-11-02 11:04:26	2021-11-02 11:04:26
1273	9	Darbs ar izgl??tojamajiem kuriem ir m??c????an??s trauc??jumi 	2021-11-02 11:04:26	2021-11-02 11:04:26
1274	9	Apm??c??bas programma visp??r??jo izgl??t??bas iest????u pedagogiem par vesel??bas izgl??t??bas jaut??jumiem darb?? ar 10. - 12.klases skol??niem par vesel??gu uzturu un fiziskaj??m aktivit??t??m   	2021-11-02 11:04:26	2021-11-02 11:04:26
1275	9	apguva pedagogu profesion??l??s kompetences pilnveides programmu "M??c????an??s lietprat??bai m??c??bu jom??" (vesel??bas un fizisk??s aktivit??tes m??c??bu jom??)" 	2021-11-02 11:04:26	2021-11-02 11:04:26
1276	9	apguva pedagogu profesion??l??s kompetences pilnveides programmu M??c????an??s lietprat??bai m??c??bu jom?? dabaszin??t??u, matem??tikas, tehnolo??iju m??c??bu jomas 	2021-11-02 11:04:26	2021-11-02 11:04:26
1277	9	APM??C??BAS PROGRAMMA VISP??R??J??S IZGL??T??BAS IEST????U PEDAGOGIEM PAR VESEL??BAS IZGL??T??BAS JAUT??JUMIEM DARB?? AR 7.-9. KLASES SKOL??NIEM PAR ATKAR??BU IZRAISO????M VIEL??M UN PROCESIEM 	2021-11-02 11:04:26	2021-11-02 11:04:26
1278	9	profesion??l??s pilnveides programma"Letonika.lv un digit??li zin??bu resursi izgl??t??bai" 	2021-11-02 11:04:26	2021-11-02 11:04:26
1279	9	K?? top produkts 	2021-11-02 11:04:26	2021-11-02 11:04:26
1280	9	Port??la Uzdevumi.lv iek??au??ana skolas m??c??bu poroces?? 	2021-11-02 11:04:26	2021-11-02 11:04:26
1281	9	Kla??u audzin??t??ju profesion??lo un pedago??isko kompeten??u pilnveide 	2021-11-02 11:04:26	2021-11-02 11:04:26
1282	9	Speci??lo zin????anu apguve b??rni ties??bu aizsardz??bas jom?? "Vec??ku un b??rnu ties??bas, pien??kumi un atbild??ba" 	2021-11-02 11:04:26	2021-11-02 11:04:26
1283	9	Kr??slavas un Dagdas novada pedagogu konference "M??sdien??ga m??c??bu stunda" 	2021-11-02 11:04:26	2021-11-02 11:04:26
1284	9	 Starpdisciplin??r??s m??c??bas 21. gadsimta aktu??lo kompeten??u veicin????anai 	2021-11-02 11:04:26	2021-11-02 11:04:26
1285	9	Personas datu aizsardz??ba Izgl??t??bas iest??d?? 	2021-11-02 11:04:26	2021-11-02 11:04:26
1286	9	Kr??slavas novada pedagogu ikgad??j?? augusta konference 	2021-11-02 11:04:26	2021-11-02 11:04:26
1287	9	Skaidras domas rada br??numu 	2021-11-02 11:04:26	2021-11-02 11:04:26
1288	9	Lietder??gs un ilgtsp??j??gs projekts no idejas l??dz realiz??cijai 	2021-11-02 11:04:26	2021-11-02 11:04:26
1289	9	Pirm??s pal??dz??bas snieg??ana ABC so??i. A 	2021-11-02 11:04:26	2021-11-02 11:04:26
1290	9	Uz????m??jsp??jas skolas vid??. Par uz????m??jsp??ju att??st????anu skol??nos 	2021-11-02 11:04:26	2021-11-02 11:04:26
1291	9	Skol??nu m??c??bu uz????mumu (SMU) mentora sagatavo??ana jaunie??u uz????m??jsp??ju kompeten??u att??st????anai izgl??t??bas iest??d?? A 	2021-11-02 11:04:26	2021-11-02 11:04:26
1292	9	Lekcija "Cimdi: vakar, ??odien, r??t" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1293	9	Modul??ro programmu ??steno??anas praktiskie aspekti.Efekt??va karjeras att??st??bas atbalsta sist??ma izgl??t??bas 	2021-11-02 11:04:27	2021-11-02 11:04:27
1294	9	Modul??ro programmu ??steno??anas praktiskie aspekti.  Efekt??vas karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d?? un .t.t. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1295	9	V??rt????anas veidi, pl??nojot un apg??stot prat??b??s balst??tu m??c??bu saturu soci??laj?? un pilsoniskaj?? m??c??bu jom?? 7. un 10.klas?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1296	9	M??c????an??s lietprat??bai soci??laj?? un pilsoniskaj?? m??c??bu jom?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1297	9	Noder??ga personaliz??ta atgriezenisk?? saite skol??nu individu??lo kompete????u att??st??bai un m??c??bu snieguma uzlabo??anai. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1298	9	Prat??b??s  balst??tas izgl??t??bas akcenti soci??laj?? un pilsoniskaj?? m??c??bu jom??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1299	9	5. moduli J??gpilnas m??c????an??s pamati 	2021-11-02 11:04:27	2021-11-02 11:04:27
1300	9	Da????du rado??uma l??me??u uzdevuma veido??ana un v??rt????ana. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1301	9	Zieme??latgale Latvijas neatkar??bai(1918-1920) A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1302	9	Audzin????anas stundu cikls "Es pasaul??, pasaule man??" A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1303	9	M??jtur??bas un tehnolo??iju, m??jsaimniec??bas, vizu??l??s m??kslas, intere??u izgl??t??bas skolot??ju profesion??lo un pedago??isko kompeten??u pilnveide A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1304	9	Teaching at a Time of Change 	2021-11-02 11:04:27	2021-11-02 11:04:27
1305	9	 "M??c????an??s lietprat??bai valodu jom??, ??stenojot m??c??bu saturu  "Ang??u valoda" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1306	9	Interakt??vi m??c??bu materi??li un to pielieto??ana m??c??bu proces??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1307	9	Skills for Now and the Future 	2021-11-02 11:04:27	2021-11-02 11:04:27
1308	9	 Professional Development Course Express Days'20 	2021-11-02 11:04:27	2021-11-02 11:04:27
1309	9	Pa??vad??tas m??c????anas un sadarb??bas prasmju pilnveides iesp??jas valodas stund??s. Differenc??cija: darbs klas??s ar at????ir??gu zin????anu l??meni. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1310	9	Psiholo??ijas loma m??c??bu proces??, sasniegumu veicin????an?? un izv??rt????an??. Sadarb??ba probl??mrisin????anas prasmju pilnveides proces?? A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1311	9	Metodisk?? darba pl??no??ana saska???? ar RVT darba pl??nu. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1312	9	Ir ties??bas veikt pedago??isko darb??bu 	2021-11-02 11:04:27	2021-11-02 11:04:27
1313	9	  Speci??l??s zin????anas  pedagogiem b??rnu ties??bu aizsardz??bas jom?? (A) 	2021-11-02 11:04:27	2021-11-02 11:04:27
1314	9	Izaicin??jumi m??sdienu profesion??l??s izgl??t??bas iest??des darb??b??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1315	9	Kursu izstr??de un automatiz??cija e- m??c??bu vides platform?? Moodle drukas un mediju tehnolo??iju nozar?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1316	9	Social dialogue and industrial relations 	2021-11-02 11:04:27	2021-11-02 11:04:27
1317	9	Profesion??la?? izgl??t??bas kvalit??tes nov??rt????ana profesion??l??s izgl??t??bas iest??d??s 	2021-11-02 11:04:27	2021-11-02 11:04:27
1318	9	Projekta m??r??a grupas sta??????an??s cit??s Eiropas Savien??bas   dal??bvalst??s poligr??fijas nozar?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1319	9	M??sdien??ga profesion??l?? izgl??t??ba Latvij??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1320	9	M??c??bu materi??la sagatavo??ana digitaliz??cijai un digit??l?? satura izstr??de 	2021-11-02 11:04:27	2021-11-02 11:04:27
1321	9	     B??rnu ties??bas un  aizsardz??ba 	2021-11-02 11:04:27	2021-11-02 11:04:27
1322	9	Efekt??va komunik??cija 	2021-11-02 11:04:27	2021-11-02 11:04:27
1323	9	M??sdien??ga komunik??cija 21. gadsimt?? - soci??lo t??klu un interneta atbild??ga un dro??a lieto??ana. "Interneta atbild??ga lieto??ana" A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1324	9	V??sture jaunajos m??c??bu priek??meta standartos A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1325	9	M??sdienu pedago??ijas psiholo??iskie aspekti. konfliktu vad??ba 	2021-11-02 11:04:27	2021-11-02 11:04:27
1326	9	Bibliot??ku zin??bu pamati 	2021-11-02 11:04:27	2021-11-02 11:04:27
1327	9	Skolas bibliot??kas kr??jums un t?? uzskaite A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1328	9	21.gasimta bibliot??ka 	2021-11-02 11:04:27	2021-11-02 11:04:27
1329	9	Modul??ro programmu ??steno??anas praktiskie aspekti. Audz??k??u m??c??bu sasniegumu v??rt????ana principi un krit??riji un p??rbaudes darbu veido??ana. Metodisk?? darba pl??no??ana saska???? ar RVT darba pl??nu 2018./19.m.g. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1330	9	B??rnu ties??bu aizsardz??bas sist??ma un normat??vie akti b??rnu ties??bu aizsardz??bas jaut??jumos 	2021-11-02 11:04:27	2021-11-02 11:04:27
1331	9	???Starpdisciplin??r??s pieejas ievie??ana pedagoga darb??: no teorijas l??dz praksei??? (1.modulis)  	2021-11-02 11:04:27	2021-11-02 11:04:27
1332	9	???Starpdisciplin??r??s pieejas ievie??ana pedagoga darb??: no teorijas l??dz praksei??? (2.modulis) 	2021-11-02 11:04:27	2021-11-02 11:04:27
1333	9	Skol??nu soci??li emocion??lo un vesel??bas prasmju att??st????ana un nov??rt????ana skol??s 	2021-11-02 11:04:27	2021-11-02 11:04:27
1334	9	V??rt????ana m??c????an??s atbalstam 	2021-11-02 11:04:27	2021-11-02 11:04:27
1335	9	Pamatkust??bu pielieto??ana un sekm????ana daudzveid??go prasmju sporta sp??l??s, viensp??l??s, orient????an??s da????d??s vid??s, br??v?? laika sp??l??s un to paveidos 	2021-11-02 11:04:27	2021-11-02 11:04:27
1336	9	apguva spei??l??s zin????anas zin????anas b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1337	9	Dal??ties ir izdev??gi 	2021-11-02 11:04:27	2021-11-02 11:04:27
1338	9	Jaunas rado??as idejas un zin????anu savstarp??ja integr??cija 	2021-11-02 11:04:27	2021-11-02 11:04:27
1339	9	Pedagogu digit??l??s lietprat??bas pilnveide m??c????an??s vad??bas risin??jumu um intrgr??to m??ko??pakalpojumu izmanto??an??( Microsoft Office 365) 	2021-11-02 11:04:27	2021-11-02 11:04:27
1340	9	  Konference par metodisko darbu  E - klase 2019 	2021-11-02 11:04:27	2021-11-02 11:04:27
1341	9	Lietprat??ba-zin??t, prast un lietot 	2021-11-02 11:04:27	2021-11-02 11:04:27
1342	9	Pedagogs, kur?? iedvesmo 	2021-11-02 11:04:27	2021-11-02 11:04:27
1343	9	Dokument????anas aktualit??tes 	2021-11-02 11:04:27	2021-11-02 11:04:27
1344	9	Por??la Uzdevumi.lv iek??au??ana skolas m??c??bu proces?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1345	9	Uz????m??jdarb??bas b??t??ba un noz??me Latvij?? un Eirop??. Lab??s prakses piem??ri 	2021-11-02 11:04:27	2021-11-02 11:04:27
1346	9	Efekt??vs audzin??t??js 	2021-11-02 11:04:27	2021-11-02 11:04:27
1347	9	  Pedago??ija 	2021-11-02 11:04:27	2021-11-02 11:04:27
1348	9	Microsoft Teams un citu Office 365 r??ku izmanot??ana izgl??t??bas iest??des darb?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1349	9	Att??lin??tais darbs lietojumprogramm?? Microsoft Teams 	2021-11-02 11:04:27	2021-11-02 11:04:27
1350	9	V??rt??bu un tikumu izpratnes pilnveido??anas iesp??jas skol??nu tikumiskaj?? audzin????ana 	2021-11-02 11:04:27	2021-11-02 11:04:27
1351	9	Testa ar dotiem atbil??u variantiem izstr??de un pielietojums att??lin??t?? m??c??bu procesa nodro??in????anai profesion??l??s izgl??t??bas iest??d??s 	2021-11-02 11:04:27	2021-11-02 11:04:27
1352	9	Prezent??ciju veido??ana darbam tie??saist?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1353	9	Komerczin??bu modul??r??s profesion??l??s  izgl??t??bas  programmu aprob??cija, m??c??bu sasniegumu rezult??tu v??rt????ana  un izaicin??jumi darba vid??   	2021-11-02 11:04:27	2021-11-02 11:04:27
1354	9	Koptas publisk??s runas visp??r??g??s iez??mes. A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1355	9	E- studiju tehnolo??ijas 	2021-11-02 11:04:27	2021-11-02 11:04:27
1356	9	Ang??u valoda 	2021-11-02 11:04:27	2021-11-02 11:04:27
1357	9	Microsoft Office 365 apm??c??bas 	2021-11-02 11:04:27	2021-11-02 11:04:27
1358	9	modularo programmu ??steno??anas praktiskie aspekti. Pedagoga profesion??lo sasniegumu mape - praktiski padomi t?? izveidei un aktualiz??cijai. Efekt??va karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d?? pl??notais un idejas ??steno??anai. Un t.t. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1359	9	Sapul??u vad????ana un l??mumu pie??em??ana 	2021-11-02 11:04:27	2021-11-02 11:04:27
1360	9	ITPM projektu vad??ba p??c Project + standarta 	2021-11-02 11:04:27	2021-11-02 11:04:27
1361	9	Agile un Scrum projekta vad??ba 	2021-11-02 11:04:27	2021-11-02 11:04:27
1362	9	    Speci??l??s zin????anas b??rnu ties??bu  aizsardz??bas jom?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1363	9	ir apguvis profesion??l??s kompetences pilnveides programmu, piedaloties darbn??c?? izgl??t??bas iest??des darbiniekiem par priek??laic??gas m??c??bu p??rtrauk??anas (PMP) pas??kumu ??steno??anu izgl??t??bas iest??d??s 	2021-11-02 11:04:27	2021-11-02 11:04:27
1364	9	M??sdien??ga komunik??cija 21. gadsimt?? - soci??lo t??klu un interneta atbild??ga un dro??a lieto??ana. "Interneta atbild??ga lieto??ana (A)" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1365	9	M??c??bu procesa ??steno??ana visp??rizgl??tojo????s skol??s skol??niem ar m??c????an??s trauc??jumiem un speci??l??m vajadz??b??m 	2021-11-02 11:04:27	2021-11-02 11:04:27
1366	9	     Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom??  	2021-11-02 11:04:27	2021-11-02 11:04:27
1367	9	Klientu apkalpo??anas speci??lists 	2021-11-02 11:04:27	2021-11-02 11:04:27
1368	9	Efekt??vs skolot??js A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1369	9	???Pedagogu digit??l??s lietprat??bas pilnveide evid?? par m??c????an??s vad??bas risin??jumu un integr??to m??ko??pakalpojumu izmanto??anu 	2021-11-02 11:04:27	2021-11-02 11:04:27
1370	9	Testa ar dotiem atbil??u variantiem izstr??de un pielietojums att??lin??t?? m??c??bu procesa nodro??in????anai profesion??l??s izgl??t??bas iest??d??s. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1371	9	Profesion??l??s izgl??t??bas iest????u visp??rizgl??tojo??o un profesion??lo m??c??bu priek??metu sadarb??ba kompeten??u pieejas ??steno??an?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1372	9	???Pedagogu digit??l??s lietprat??bas pilnveide e-vid??s veid?? izgl??t??bas tehnolo??iju izmanto??anai in??enierzin??bu m??c??bu satura apguves nodro??in????an??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1373	9	KNX b??t??ba un "Gudr??s m??jas " programm????ana programm?? ETS5 	2021-11-02 11:04:27	2021-11-02 11:04:27
1374	9	Pedagogu iesaiste Erasmus+ programm?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1375	9	semin??rs ener????tikas nozares izgl??t??bas programmu progfesion??lo m??c??bu priek??metu /kursu skolot??jiem  	2021-11-02 11:04:27	2021-11-02 11:04:27
1376	9	 Port??la Uzvedumi.lv iek??au??ana skolas m??c??bu proces?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1377	9	Format??v?? v??rt????ana lietprat??bas kontekst?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1378	9	Pedagogu profesion??lo kompete????u pilnveide v??rt????anas un p??rbaudes darbu izstr??des jaut??jumos 	2021-11-02 11:04:27	2021-11-02 11:04:27
1379	9	Modul??ro programmu ??steno??anas praktiskie aspekti. Skolot??j pozit??vais t??ls t.sk. masu m??dijos praktiskie aspekti. Praktiski padomi m??c??bu materi??lu veido??an??, izmantojot Kahhot vidi. Metodisk?? darba pl??no??ana saska???? ar RVT darba pl??nu 2018/19.m.g. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1380	9	Kurss darbam ar elektronisko kases apar??tu CHD 3050 	2021-11-02 11:04:27	2021-11-02 11:04:27
1381	9	Aktualit??tes ekonomik?? 2020 	2021-11-02 11:04:27	2021-11-02 11:04:27
1382	9	,,Skol??nu m??c??bu uz????mumu (SMU) mentora sagatavo??ana jaunie??u uz????m??jsp??ju kompeten??u att??st????anai izgl??t??bas iest??d??"  A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1383	9	Skol??nu m??c??bu uz????mumi k?? m??c??bu metode A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1384	9	Skol??nu m??c??bu uz????mumu (SMU) mentora sagatavo??ana jaunie??u uz????m??jsp??ju kompeten??u at??st????anai izgl??t??bas iest??d?? A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1385	9	semin??rs "Aktualit??tes ekonomik?? 2018 " 	2021-11-02 11:04:27	2021-11-02 11:04:27
1386	9	Digit??lo finan??u pakalpojumu att??st??ba Latvij??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1387	9	 profesion??l??s kompetences pilnveides  programma "Speci??lo zin????anu apguve b??rnu ties??bu aizsardz??bas jom??" Vec??ku un b??rnu ties??bas, pien??kumi un atbild??ba" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1388	9	Akcenti m??c??bu uzdevumu veido??an??, v??rt????an?? un caurviju prasmju apg????an?? soci??laj?? un pilsoniskaj?? jom?? vidusskolas posm??. Pieminek??i, k?? v??stures avots m??c??bu proces?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1389	9	Tradicion??l??s kr??sas v??sturisko ??ku restaur??cij?? un atjauno??an?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1390	9	Port??la uzdevmi.lv  iek??au??ana skolas m??c??bu proces?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1391	9	Latvijas valsts pamati. V??sture un m??sdienas A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1392	9	E-studiju tehnolo??ijas 	2021-11-02 11:04:27	2021-11-02 11:04:27
1393	9	 Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? (A) A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1394	9	Kompote????u pieeja m??c??bu satur??: Skolu vad??bas loma jaun?? m??c??bu satura un pieejas m??c??b??m ievie??anai skol?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1395	9	 Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom??  	2021-11-02 11:04:27	2021-11-02 11:04:27
1396	9	pedagogu visp??r??j??s kompetences pilnveido??ana izgl??t??bas satura izstr??dei un meto??u izv??lei 	2021-11-02 11:04:27	2021-11-02 11:04:27
1397	9	  Speci??l??s zin????anas pedagogiem b??rnu ties??bu aizsardz??bas jom?? (A) A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1398	9	Ir apguvis (-usi)   profesion??l??s kompetences pilnveides programmu, piedaloties darbn??c?? izgl??t??bas iest??des darbiniekiem par priek??laic??gas m??c??bu  p??rtrauk??anas (PMP) pas??kumu ??steno??anu izgl??t??bas iest??d??s 	2021-11-02 11:04:27	2021-11-02 11:04:27
1399	9	 Apliec??ba par pirm??s pal??dz??bas pamatzin????anu 12 stundu apm??c??bas kurss 	2021-11-02 11:04:27	2021-11-02 11:04:27
1400	9	B??beles principu integr??cija izgl??t??b?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1401	9	Starpdisciplinarit??te M??kslas muzej?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1402	9	Pap??ru un materi??lu skolas semin??ru kurss 	2021-11-02 11:04:27	2021-11-02 11:04:27
1403	9	Andrago??ija - pieaugu??o izgl??t??bas principi un prakse 	2021-11-02 11:04:27	2021-11-02 11:04:27
1404	9	Pedagogu profesion??lo kompete????u pilnveide m??sdien??gu, m??c??bu procesa efektivit??ti sekm??jo??u e-r??ku (e- skolvad??bas un e- studiju vides, mobil??s aplik??cijas t??mek??a vietnes un.c.) lieto??an??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1405	9	M??c??bu materi??lu sagatavo??ana digitiliz??cijai un digit??l?? satura izstr??de 	2021-11-02 11:04:27	2021-11-02 11:04:27
1406	9	Izgl??t??bas iest??des organiz??cijas kult??ras, efekt??va p??rvald??ba un kop??ga t.sk. starpdisciplin??ra, m??c????an??s metodisk?? darba pieredzes papildin????ana 	2021-11-02 11:04:27	2021-11-02 11:04:27
1407	9	     B??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1408	9	Modul??ro profesion??l??s izgl??t??bas programmu saturs, t?? ??steno??anas iesp??jas, visp??rizgl??tojo??o un profesion??lo m??c??bu priek??metu pedagogu sadarb??ba ma????nzin??bu jom?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1409	9	Video r??ku un video materi??lu   izmnto??ana att??lin??to m??c??bu proces?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1410	9	Darba vid?? balst??to m??c??bu lab??s prakses piem??ri un pieredze modul??r??s profesion??l??s izgl??t??bas programmu aprob??cij?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1411	9	M??sdien??ga komunik??cija 21. gadsimt?? - soci??lo t??klu un interneta atbild??ga un dro??a lieto??ana. Interneta atbild??ga lieto??ana A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1412	9	  Speci??l??s zin????anas  b??rnu ties??bu aizsardz??bas jom?? izgl??t??bas iest????u tehniskajiem darbiniekiem(A) 	2021-11-02 11:04:27	2021-11-02 11:04:27
1413	9	Mehatronika un m??sdienu tehnolo??ijas met??lapst??d??, kokapstr??d?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1414	9	M??c??bu satura izstr??d?? un diagnostic??jo??o darbu un eks??menu satura izveid??, pedagogu profesion??l??s kompetences programmu izst??d?? un m??c??bu materi??lu veido??an?? programmu ??steno??an?? iesaist??to pedagogu profesion??l??s kompetences pilnveide 	2021-11-02 11:04:27	2021-11-02 11:04:27
1415	9	Dabaszin??t??u izgl??t??ba ilgstsp??j??gai att??st??bai ANO 2030 m??r??u sasnieg??anai 	2021-11-02 11:04:27	2021-11-02 11:04:27
1416	9	N??kotnes darba skatuve. Intelekts. Rado??ums 	2021-11-02 11:04:27	2021-11-02 11:04:27
1417	9	Profesion??l??s pilnveides ekspertu sagatavo??ana kompeten??u pieejas ievie??anai skol?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1418	9	Pedago??ijas ABC darba vid?? balst??tu m??c??bu ??steno??an?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1419	9	A programma profesion??l??s kompetences pilnveides kurss b??rnu ties??bu aizsardz??bas jom?? pedagogiem A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1420	9	apliec??ba ir noklaus??jies pirm??s pal??dz??bas pamatzin????anu 12 stundu apm??c??bas kursu bez zin????anu p??rbaudes 	2021-11-02 11:04:27	2021-11-02 11:04:27
1421	9	M??sdien??ga m??c??bu un audzin????anas procesa anal??zes teor??tiskie un prakstiskie aspekti, v??rojot m????ibu stundas. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1422	9	Efekt??vs skolot??js 	2021-11-02 11:04:27	2021-11-02 11:04:27
1423	9	Pozit??vas audzin????anas principi digit??laj?? laikmet??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1424	9	Individu??l?? un grupu konsult????ana - profesion??lais darb??bas veids izgl??t??b?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1425	9	Social Justice in Lifelong Guidance for Adults 	2021-11-02 11:04:27	2021-11-02 11:04:27
1426	9	M??c??bu satura veido??ana ar tehnolo??iju pl??dz??bu(pamata l??menis) 	2021-11-02 11:04:27	2021-11-02 11:04:27
1427	9	"Letonika.lv un digit??li zin??bu resursi izgl??t??bai" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1428	9	Izgl??t??bas projektu organiz????ana, norise un p??rvald??ba, izmantojot mobil??s tehnolo??ijas 	2021-11-02 11:04:27	2021-11-02 11:04:27
1429	9	Pedagogu profesion??l??s kvalifik??cijas pilnveides A programma "Sve??valodas m??c????anas metodika 21.gadsimta izgl??t??bas kontekst??" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1430	9	Europass un aktualit??tes profesion??l??s izgl??t??bas iest????u  audz??k??u karjeras atbalsta veicin????ana Latvij?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1431	9	Within the framework of the erasmus programme has actively participated in the Vet contact seminar 	2021-11-02 11:04:27	2021-11-02 11:04:27
1432	9	Starptautisk?? kiberdro????bas konference "Kiber??ahs 2019" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1433	9	,,Visas aktu??l??s izmai??as nodok??u likumdo??an?? un gr??matved??bas uzsk ait?? uz 2020.gada 1. janv??ri, par kur??m j??b??t inform??tam katram uz????mumam un iest??dei" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1434	9	 Nodarbin??to personu profesion??l??s kompetences pilnveide 	2021-11-02 11:04:27	2021-11-02 11:04:27
1435	9	Komercdarb??bu modil??r??s profesion??l??s izgl??t??bas programmas adopt??cija, m??c??bu sasniegumu rezult??tu v??rt????ana un izaicin??jumi darba vid??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1436	9	Uz????mejdarb??ba un ekonomika 	2021-11-02 11:04:27	2021-11-02 11:04:27
1437	9	Gr??matved??bas akad??mijas intens??vais kurss A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1438	9	par kvalit??tes nov??rt????anas vadl??nij??m, metodiku un e- platformu akredit??cijas un licenz????anas procesa nodro??in????anai 	2021-11-02 11:04:27	2021-11-02 11:04:27
1439	9	"Nodok??u ietekme uz juridisko un fizisko personu ien??kumiem" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1440	9	Zin??tniski p??tniecisko darbu metodolo??ijas aktualit??tes 	2021-11-02 11:04:27	2021-11-02 11:04:27
1441	9	??odienas iesp??jas, izaugsme un patst??v??ba cilv??kiem ar invalidit??ti 	2021-11-02 11:04:27	2021-11-02 11:04:27
1442	9	Pilsonisk??s audzin????anas un pilsonisk??s l??dzdal??bas sekm????ana izgl??t??bas iest??d?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1443	9	Digit??lo finan??u pakalpojumu att??st??ba Latvij?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1444	9	  Speci??l??s zin????anas  pedagogiem b??rnu ties??bu aizsardz??bas jom??   (A) 	2021-11-02 11:04:27	2021-11-02 11:04:27
1445	9	M??c????an??s lietprat??bai vesel??bas un fizisk??s aktivit??tes m??c??bu jom?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1446	9	Aktualit??tes  profesion??l??s izgl??t??bas sporta organizatoru darb??  	2021-11-02 11:04:27	2021-11-02 11:04:27
1447	9	Pedagogu profesion??lo sasniegumu mape praktiskie padomi t?? izveidei un aktualiz??cijai. Efekt??vas karjeras at??st??bas atbalsta sist??ma izgl??t??bas iest??d??. un.t.t. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1448	9	K?? m??c??t b??rnam laika izj??tu 	2021-11-02 11:04:27	2021-11-02 11:04:27
1449	9	Efekt??vs vad??t??js 	2021-11-02 11:04:27	2021-11-02 11:04:27
1450	9	Be the change 	2021-11-02 11:04:27	2021-11-02 11:04:27
1451	9	  Skolot??ja pozit??vais t??ls t.sk. masu medijos: praktiskie aspekti. Ierosmes audz??k??u pieder??bas saj??tas skolai stiprin????anai un pilsonisk??s izgl??t??bas aspekti audzin??sanas prpces??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1452	9	M??sdienu izgl??t??bas vad??bas psiholo??iskie aspekti.Stresa vad??ba 	2021-11-02 11:04:27	2021-11-02 11:04:27
1453	9	Soci??li emocion??l??s audzin????anas loma priek??laic??g??s m??c??bu p??rtrauk??anas mazin????an?? izgl??t??bas iest??d?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1454	9	Skolot??jiem nepiecie??am??s prasmes, ??stenojot m??c??bu saturu kompeten??u pieej?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1455	9	M??sdien??ga komunik??cija 21. gadsimt?? - soci??lo t??un dro??a klu un interneta atbild??ga lieto??ana A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1456	9	Pieredze un anal??ze KAA ??steno??anas proces?? izgl??t??bas iest??d?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1457	9	'' Aktualit??tes pedago??isk medic??nisko komisiju darb??" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1458	9	Prevent??vais soci??li pedago??iskais un soci??lais darbs m??sdien??s: izaicin??jumi, risin??jumi, praktisk?? pieredze 	2021-11-02 11:04:27	2021-11-02 11:04:27
1459	9	Efekt??va karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1460	9	Personisk??s anal??zes un att??st??bas komandas darbs 	2021-11-02 11:04:27	2021-11-02 11:04:27
1461	9	Pedagogu profesion??l??s un prak??u vad??t??ju pedago??isk??s kompetences pilnveide sadar??b?? ar Latvijas darba dev??jiem un R??gas Tehnisko universit??ti. A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1462	9	Im??c??tais optimisms A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1463	9	M??sdienu pedago??ijas psiholo??iskie aspekti. Konfliktu vad??ba.  	2021-11-02 11:04:27	2021-11-02 11:04:27
1464	9	M??sdienu pedago??ijas psiholo??iskie aspekti. Stresa vad??ba. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1465	9	Vai sp????u elementi b??tu j??izmanto izgl??t??bas proces??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1466	9	Darbs jaunatnes jom?? ar priek??laic??gas m??c??bu p??rtrauk??anas riska grupas jaunie??iem 	2021-11-02 11:04:27	2021-11-02 11:04:27
1467	9	Pedago??isk??s darb??bas pamati 	2021-11-02 11:04:27	2021-11-02 11:04:27
1468	9	Modul??ro izgl??t??bas programmu izstr??des metodika un prakse 	2021-11-02 11:04:27	2021-11-02 11:04:27
1469	9	,,Projekta m??r??a grupas sta??????an??s Latvij?? lo??istikas nozar??" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1470	9	"Aktualit??tes ekonomik?? 2018 " 	2021-11-02 11:04:27	2021-11-02 11:04:27
1471	9	Moduli "Me??saimniec??bas pamati" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1472	9	 Speci??lo zin????anu apguve b??rnu ties??bu aizsardz??bas jom?? "Vec??ku un b??rnu ties??bas, pien??kumi un atbild??ba" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1473	9	Modul??r??s profesion??l??s izgl??t??bas programmas ar ieg??stamo kvalifik??ciju Ma????nb??ves tehni??is aprob??cijas aktu??lie jaut??jumi, modu??u izv??rt????ana un profesion??lo kompeten??u nov??rt????anas uzdevumu veido??ana, to izpildes v??rt????anas krit??riji 	2021-11-02 11:04:27	2021-11-02 11:04:27
1474	9	"Darbs ar stimul??cijas iek??rtu - programmu "Mastercam Educational Suite" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1475	9	Profesion??l??s kvalifik??cijas eks??menu uzdevumu un to izpildes v??rt????anas krit??riju  	2021-11-02 11:04:27	2021-11-02 11:04:27
1476	9	CNC ma??inas operators 	2021-11-02 11:04:27	2021-11-02 11:04:27
1477	9	Ievads CNC operatora kompetenc??s 	2021-11-02 11:04:27	2021-11-02 11:04:27
1478	9	Profesion??l??s izgl??t??bas iest????u pedagogu un uz????mumu darba vid?? balst??tu m??c??bu vad??t??ju "??nu dienas" met??lapstr??des jom??  	2021-11-02 11:04:27	2021-11-02 11:04:27
1479	9	Projekta m??r??a grupas sta??????an??s cit??s Eiropas Savien??bas dal??bvalst??s met??lapstr??des, ma????nb??ves un mehatronikas nozar?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1480	9	Ir noklaus??jies instrukt????u darbam ar iek??rt??m. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1481	9	ieguva pamata  zin????anas darbam ar materi??lu transport????anas rati??iem Fetra 1720x800x295mm Hahn + Kolb 	2021-11-02 11:04:27	2021-11-02 11:04:27
1482	9	ieguva pamata  zin????anas darbam ar apdares sit??mu Sataminijet 3000B HVLP 	2021-11-02 11:04:27	2021-11-02 11:04:27
1483	9	ieguva pamata  zin????anas darbam ar apdares materi??lu ????v????anas stat??vu Meta Multistrong L IPE120P 	2021-11-02 11:04:27	2021-11-02 11:04:27
1484	9	ieguva pamata  zin????anas darbam ar augstra????gu kompresoru Josval C-7'5/500 	2021-11-02 11:04:27	2021-11-02 11:04:27
1485	9	ieguva pamata  zin????anas darbam ar mobilu aspir??cijas iek??rtu Adamik FT 403 SF 	2021-11-02 11:04:27	2021-11-02 11:04:27
1486	9	par apm??c??b??m darbam ar galvaniz??cijas iek??rta, modelis 3001 D/Balco 	2021-11-02 11:04:27	2021-11-02 11:04:27
1487	9	Publisk?? komunik??cija 	2021-11-02 11:04:27	2021-11-02 11:04:27
1488	9	Video r??ku un video materi??lu izmanto??ana att??lin??to m??c??bu proces?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1489	9	Interakt??vi m??c??bu materi??li un to pielieto??ana m??c??bu proces??" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1490	9	Praktisk?? pieredze balst??ta matem??tika "Dom??! Dari! Zini!" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1491	9	Office365 un citu tie??saistes r??ku izmanto??ana m??c??bu proces?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1492	9	Tehnolo??ijas, t.sk. asist??v??s , un to sniegt??s iesp??jas speci??lo pedago??isko vajadz??bu mazin????anai m??c??bu proces?? izgl??tojamiem ar gar??g??s att??st??bas trauc??jumiem A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1493	9	M??c??bu procesa organiz????ana un alternat??v??s darba metodes izgl??tojamajiem ar speci??l??m vajadz??b??m. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1494	9	,,Prezent??ciju veido??ana darbam tie??sait?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1495	9	Electude - virtu??l??s apm??c??bas programma 	2021-11-02 11:04:27	2021-11-02 11:04:27
1496	9	BOSCH/ diagnostikas pamati ar Bosch KTS & Esi[tronic], SKF/produkcijas remonts un tehnisko apkopju darb??bas, FEBI/ Balstiek??rtas un st??res sist??mas sast??vda??as. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1497	9	Turbokompresoru uzb??ve un jaun??k??s tehnolo??ijas. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1498	9	 B??rnu uzved??bas trauc??jumi, to iesp??jamie risin??jumi 	2021-11-02 11:04:27	2021-11-02 11:04:27
1499	9	Liter??r?? mantojuma veiksm??ga integr??cija latvie??u valodas un literat??ras stund??s 	2021-11-02 11:04:27	2021-11-02 11:04:27
1500	9	Novit??tes latvie??u valodas, literat??ras un v??stures  m??c????an?? un apguv?? m??sdien??ga m??c??bu procesa nodro??in????anai  A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1501	9	K?? m??c??t un mac??ties latvie??u valodu akt??v?? darb??b?? un sadarb??b?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1502	9	  Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? (A) A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1503	9	apguvusi profesion??l??s pilnveides semin??ra  programmu "Trenera iesp??jas sportistu iztur??bas, musku??u sp??ka un jaudas inovat??v?? nov??rt????an??"  	2021-11-02 11:04:27	2021-11-02 11:04:27
1504	9	Sporta izgl??t??bas aktualit??tes. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1505	9	Sports un izgl??t??ba. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1506	9	Audzin????ana k?? m??c??bu procesa saast??vda??a A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1507	9	B??rnu nomet??u organiz????anas un vad????anas metodika 	2021-11-02 11:04:27	2021-11-02 11:04:27
1508	9	V??rt??bas, trad??cijas un inov??cijas m??sdien??g?? sport??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1509	9	Stresa menid??ments pedago??iskaj?? praks?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1510	9	M??c??bu strat????ijas ??steno??anas iesp??jas krievu valodas (sve??valodas )stund??s 	2021-11-02 11:04:27	2021-11-02 11:04:27
1511	9	Koptas publisk??s runas visp??r??g??s iez??mes. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1512	9	Komunik??cijas, paciet??bas un motiv??cijas veido??ana iek??ajo??aj?? izgl??t??b?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1513	9	Google servisi izgl??t??b?? A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1514	9	Modul??ro programmu ??steno??anas praktiskie aspekti.Efekt??va karjeras att??st??bas atbalsta sist??ma izgl??t??bas iet??d?? un.t.t. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1515	9	???Starpdisciplin??r??s pieejas ievie??ana pedagoga darb??: no teorijas l??dz praksei???;  1. modulis ??? Ievads starpdisciplin??r??s pieejas ievie??an?? pedagoga darb??; 2. modulis - Pilotstundu veido??ana un vad????ana ar starpdisciplin??ro pieeju 	2021-11-02 11:04:27	2021-11-02 11:04:27
1516	9	  Kompeten??u pieeja m??c??bu satur??: Skolu vad??bas loma jaun?? m??c??bu satura un pieejas m??c??b??m ievie??anai skol?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1517	9	pilsonisk??s audzin????anas jom??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1518	9	piedal??j??s lekcij?? "Skolot??jam nepiecie??am??s prasmes, ??stenojot m??c??bu saturu kompeten??u pieej??" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1519	9	Preto??an??s profesion??lajai izdeg??anai individu??l??s strat????ijas 	2021-11-02 11:04:27	2021-11-02 11:04:27
1520	9	Stereotipi un realit??te - karjeras iesp??jas b??vniec??bas nozar?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1521	9	Priek??laic??gas m??c??bu p??rtrauk??anas (PMP) pas??kumu ??steno??ana izgl??t??bas iest??d?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1522	9	M??kslas stili un to ietekme uz iespieddarbu izgatavo??anas tehnolo??ij??m un dizainu v??sturisk?? un m??sdienu skat??jum??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1523	9	Pedagoga profesion??lo sasniegumu mape -praktiskie padomi t?? izveidei un aktualiz??cijai. Efekt??va karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d??: pl??notais un idejas ??steno??anai un.t.t. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1524	9	Speci??l??s zin????anas pedagogiem b??rnu ties??bu aizsrdz??bas jom?? (A) 	2021-11-02 11:04:27	2021-11-02 11:04:27
1525	9	WBL - Pro Project  	2021-11-02 11:04:27	2021-11-02 11:04:27
1526	9	Pedagogu profesion??l??s kompetences pilnveide  valstisk??s un tikumisk??s audzin????anas jaut??jumos 	2021-11-02 11:04:27	2021-11-02 11:04:27
1527	9	Pedagogu digit??l??s prasmes 	2021-11-02 11:04:27	2021-11-02 11:04:27
1528	9	Stress un t?? rad??t??s vesel??bas probl??mas 	2021-11-02 11:04:27	2021-11-02 11:04:27
1529	9	MOODLE platformas izmanto??ana m??sdien??g?? m??c??bu proces?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1530	9	Rado???? pedagoga darbn??ca 	2021-11-02 11:04:27	2021-11-02 11:04:27
1531	9	K?? pal??dz??t pedagogiem darb?? ar jauniebrauc??ju, reemigrantu un patv??ruma mekl??t??ju b??rniem 	2021-11-02 11:04:27	2021-11-02 11:04:27
1532	9	Virtu??l?? realit??te un m??ksl??gais intelekts att??lin??to m??c??bu organiz????an?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1533	9	???M??c??bu procesa organiz????ana ar tehnolo??iju pal??dz??bu??? (Pamata l??menis) 	2021-11-02 11:04:27	2021-11-02 11:04:27
1534	9	Individu??la un grupu konsult????ana - profesion??l??s darb??bas veids izgl??t??b?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1535	9	ir apguvusi pedagogu profesion??l??s pilnveides programmu latvie??u valodas pilnveidei profesion??laj??m vajadz??b??m skolu pedagogiem "Profesion??l??s kompetences pilnveide pedagogiem, ??stenojot mac??bu saturu lingvistiski neviendab??g?? vid??" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1536	9	Atv??rt??s lekcijas skolot??jiem 	2021-11-02 11:04:27	2021-11-02 11:04:27
1537	9	Digit??lo r??ku izmanto??ana m??c????anas proces?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1538	9	M??c??bu satura integr??cija un dz??ves darb??bas prasmju att??st??ba A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1539	9	 ievads e Twinning 	2021-11-02 11:04:27	2021-11-02 11:04:27
1540	9	Pedagogu iesaiste Erasmus+ programm?? A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1541	9	Format??v?? v??rt????ana lietprat??bas kontekst??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1542	9	Projekta m??r??a grupas sta??????an??s cit?? Eiropas Savien??bas dal??bvalst?? elektronikas nozar?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1543	9	Pedagogu profesion??l??s kompetences pilveide digit??l?? komunik??cij?? un sadarb??b??. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1544	9	Darbn??ca izgl??t??bas iest??des darbiniekiem par priek??laic??gas m??c??bu p??rtrauk??anas (PMP) pas??kumu ??steno??anu izgl??t??bas iest??d??s. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1545	9	Microsoft Excell bez priek??zin????an??m 	2021-11-02 11:04:27	2021-11-02 11:04:27
1546	9	Pedagogu sadarb??ba jaun?? izgl??t??bas standarta kontekst?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1547	9	Att??lin??tu lekciju vad????ana 	2021-11-02 11:04:27	2021-11-02 11:04:27
1548	9	Projekta m??r??a grupas sta??????an??s Latvij?? transporta nozar??" dzelzce??a jom 	2021-11-02 11:04:27	2021-11-02 11:04:27
1549	9	Profesion??l??s kvalifik??cijas eks??menu uzdevumu un to izpildes v??rt????anas krit??riju izstr??de" 	2021-11-02 11:04:27	2021-11-02 11:04:27
1550	9	mobilit??tes projekts 	2021-11-02 11:04:27	2021-11-02 11:04:27
1551	9	,,Projekta m??r??a grupas sta??????an??s Latvij?? transporta nozar??" dzelzce??a jom?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1552	9	Pedgogu profesion??lo kompete????u pilnveide v??rte??anas un p??rbaudes darbu izstr??des jaut??jumos 	2021-11-02 11:04:27	2021-11-02 11:04:27
1553	9	Atractive e-learning materials for provision of qualitative education. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1554	9	M??sdienu izgl??t??bas vad??bas psihologo??iskie aspekti. Stresa vad??ba 	2021-11-02 11:04:27	2021-11-02 11:04:27
1555	9	Darbn??ca par priek??laic??gas m??c??bu p??rtrauk??anas (PMP) pas??kumu ??steno??anu izgl??t??bas iest??d??s 	2021-11-02 11:04:27	2021-11-02 11:04:27
1556	9	M??c??bu procesa organiz????ana e- kursu vad??bas sist??m?? Moodle A 	2021-11-02 11:04:27	2021-11-02 11:04:27
1557	9	M??sdienu pedago??ijas pedago??iskie aspekti. Konfliktu vad??ba. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1558	9	M??sdienu pedago??ijas psiholo??iskie aspekti.Stresa vad??ba 	2021-11-02 11:04:27	2021-11-02 11:04:27
1559	9	Speci??lo zin????anas apguve b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1560	9	Atbalsts matem??tikas un dabaszin??bu pedagogiem un skol??niem m??c??bu procesa pilnveido??anai ligvistiski neviendab??g?? vid?? un p??rejai uz m??c??b??m latvie??u valod?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1561	9	Gar??g??s vesel??bas veicin????ana skol??s 	2021-11-02 11:04:27	2021-11-02 11:04:27
1562	9	Da????diem kognit??vas darb??bas l??me??iem atbilsto??u m??c??bu uzdevumu veido??ana 	2021-11-02 11:04:27	2021-11-02 11:04:27
1563	9	2019./2020. m.g. aktualit??tes izgl??t??b?? 	2021-11-02 11:04:27	2021-11-02 11:04:27
1564	9	Kompetenc??s balst??ta m??c??bu stunda 	2021-11-02 11:04:27	2021-11-02 11:04:27
1565	9	Pieredze, izaicin??jumi un ieguvumi fizikas izgl??t??b?? - 2020 	2021-11-02 11:04:27	2021-11-02 11:04:27
1566	9	,,Pieredze, izaicin??jumi un ieguvumi fizikas izgl??t??b?? 2019"  	2021-11-02 11:04:27	2021-11-02 11:04:27
1567	9	Erasmus programmas apm??c??bas 	2021-11-02 11:04:27	2021-11-02 11:04:27
1568	9	Elektromobi??u uzl??de un aizsardz??bas iek??rtas tiem ener????tikas nozares 2. l??me??a modul??ro izgl??t??bas programmu izstr??de. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1569	9	M??c??bu metodes. Tendenciozilit??te. Orasmes un zin????anas k?? m??c??t dabas zin??t??u m??c??bu proek??metus. M??c??bu stundas pl??na izstr??d????ana, izmantojot rado??os instrumentus, Inovat??va pedago??isk?? l??dzek??a izgatavo??ana. Izgl??t??jam?? iepaz??stin????ana  	2021-11-02 11:04:27	2021-11-02 11:04:27
1570	9	Enhancing comprehension in science education in high scools. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1571	9	Pieredze izaicin??jumi un ieguvumi fizikas izgl??t??b?? 2018. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1572	9	Jauno tehnolo??iju iesp??jas un pielietojums. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1573	9	Atv??rta sadarb??ba inov??cij??m. 	2021-11-02 11:04:27	2021-11-02 11:04:27
1574	9	Starptautisk?? kiberdro????bas konference Kiber??ahs 2018 	2021-11-02 11:04:28	2021-11-02 11:04:28
1575	9	profesion??l??s kvalifik??cijas pilnveides programma b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1576	9	Dal??ba Limba??u un Alojas novadu publisko un skolu bibliot??ku m??c??bu semin??ros 	2021-11-02 11:04:28	2021-11-02 11:04:28
1577	9	Lieti?????? saskarsme jeb iest??des t??la veido??ana saskarsm?? ar klieientiem. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1578	9	"Latvijas V??stnesis" - valsts pilsonisk??s un tiesisk??s inform??ciajs platforma 	2021-11-02 11:04:28	2021-11-02 11:04:28
1579	9	Aktualit??tes pieaugu??o izgl??t??b??. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1580	9	M??sdienu izgl??t??bas vad??bas psiholo??iskie aspekti. Stresa vad??ba. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1581	9	 Profesion??l??s izdeg??anas mazin????ana, saskarsmes prasmju uzlabo??ana un rado??u meto??u apguve 	2021-11-02 11:04:28	2021-11-02 11:04:28
1582	9	Digit??l??s iesp??jas m??sdien??gam m??c??bu procesam 	2021-11-02 11:04:28	2021-11-02 11:04:28
1583	9	    speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1584	9	Pirms laika p??rtraukta izgl??t??bas apguve, t??s b??t??ba, c??lo??i un risin????anas iesp??jas izgl??t??bas vid??. Kompotents karjeras att??st??bas atbalsts izgl??tojamo skaita samazin????anai, kuri p??rtrauc izgl??t??bas apguvi pirms laika. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1585	9	M??kslas stili un to ietekme uz iespieddarbu izgatavo??anas tehnolo??ij??m un dizainu v??sturisk?? un m??sdienu skat??jum??. A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1586	9	M??c??bu procesa organiz????ana e- kursu vad??bas sist??m?? Moodle 	2021-11-02 11:04:28	2021-11-02 11:04:28
1587	9	Pedagogu profesion??loa sasniegumu mape - praktiskie padomi  t?? izveidei un aktualiz??cijai. Efekt??vas karjeras att??st??bas atbalsta sit??ma izgl??t??bas iest??d?? un t.t. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1588	9	Liter??r?? redi??????ana 	2021-11-02 11:04:28	2021-11-02 11:04:28
1589	9	Darba ar personu iesniegumiem un iest??des r??c??b?? eso????s inform??cijas izsnieg??anas nosac??jumi - likums un prakse. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1590	9	Jaunie ministru kabineta noteikumi par dokumentu izstr??d????anas un noform????anas k??rt??bu 	2021-11-02 11:04:28	2021-11-02 11:04:28
1591	9	Lieti?????? sarakste eti??ete un valodas aktualit??tes 	2021-11-02 11:04:28	2021-11-02 11:04:28
1592	9	Speci??lo zin????anu  b??rnu ties??bu aizsardz??bas jom?? apguve 	2021-11-02 11:04:28	2021-11-02 11:04:28
1593	9	online interactive training on the methodology of peer evaluation 	2021-11-02 11:04:28	2021-11-02 11:04:28
1594	9	Kompote????u pieeja m??c??bu satur??: Skolu vad??bas loma jaun?? m??c??bu satura un pieejas m??c??b??m ievie??anai skol?? A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1595	9	Mentorings - efekt??vs atbalsts jaunajiem pedagogiem. A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1652	9	Sabiedr??ba un cilv??ka dro????ba 	2021-11-02 11:04:28	2021-11-02 11:04:28
1596	9	  Ang??u valodas skolot??ju profesion??l??s  pilnveides konference (t??mas: Run????anas prasmju pilnveide stund??s. Sp??les elementu izmanto??ana gramatikas apguv??.) 	2021-11-02 11:04:28	2021-11-02 11:04:28
1597	9	Andrago??ija - pieaugu??o izgl??t??bas principi un prakse. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1598	9	Ilustr??ciju, paskaidrojumu un izteicienu izmanto??ana izpratnes veicin????ana 	2021-11-02 11:04:28	2021-11-02 11:04:28
1599	9	Profesion??lo izgl??t??bas iest????u direktoru vietnieku izgl??t??bas jom?? darba semin??rs 	2021-11-02 11:04:28	2021-11-02 11:04:28
1600	9	Atractive e-learing materials for provision of qualitative education. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1601	9	Kompete????u pieejas ievie??ana, str??d??jot skolot??ju komand?? A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1602	9	"M??sdienu izgl??t??bas vad??bas psiholo??iskie aspekti. stresa vad??ba. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1603	9	Pedagoga profesion??lo sasniegumu mape -praktiskie padomi t?? izveidei un aktualiz??cijai. Metodisk?? darba pl??no??ana saska???? ar RVT darba pl??nu 2018/19.m.g. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1604	9	Pilnveidotais m??c??bu saturs valodu jom?? un m??c??bu priek??met??, t?? pl??no??ana 	2021-11-02 11:04:28	2021-11-02 11:04:28
1605	9	"Digit??l?? m??c??bu satura veido??ana un izmanto??ana m??c??bu proces??" (Pamata l??menis) 	2021-11-02 11:04:28	2021-11-02 11:04:28
1606	9	Liter??r?? mantojuma veiksm??ga integr??cija latvie??u valodas un literat??ras stund??s A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1607	9	Ir apguvusi pedagogu profesion??l??s kompetences pilnveides A programmu "Novit??tes latvie??u valodas,literat??ras un v??stures m??c????an?? un apguv?? m??sdien??ga m??c??bu procesa nodro??in????anai" latvie??u valodas, literat??ras un v??stures skolot??jiem  A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1608	9	Kompete????u pieejasievie??ana, str??d??jot skolot??ju komand?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1609	9	B??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1610	9	Digit??l??s prasmes att??lin??t?? un kl??tienes m??c??bu procesa ??steno??anai 	2021-11-02 11:04:28	2021-11-02 11:04:28
1611	9	M??sdien??ga m??c??bu procesa ??steno??ana izgl??tojamiem ar speci??l??m vajadz??b??m 	2021-11-02 11:04:28	2021-11-02 11:04:28
1612	9	M??c????an??s lietprat??bai , ??stenojot m??c??bu saturu "Te??tra m??ksla" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1613	9	Efekt??va karjeras att??st??as atbalsta sist??ma izgl??t??bas iest??d?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1614	9	Pedagoga darb??ba, iev??rojot izgl??tojamo audzin????anas vadl??nijas m??c??bu proces?? un skolas/klases organiz??tajos pas??kumos (A) A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1615	9	Informat??vie un metodiskie resursi karjeras att??st??bas atbalsta ??steno??anai 	2021-11-02 11:04:28	2021-11-02 11:04:28
1616	9	Pedagogu digit??l??s lietprat??bas pilnveide evid?? par m??c????an??s vad??bas risin??jumu un integr??to m??ko??pakalpojumu izmanto??anu??? (E-kurss "Microsoft Office 365" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1617	9	Aptauju un testu veido??anas r??ki atgriezenisk??s saites nodro??ina??anai m??c??bu proces??  	2021-11-02 11:04:28	2021-11-02 11:04:28
1618	9	 Ang??u valoda ( ar priek??zin????an??m) -A2 - B1 l??menis 	2021-11-02 11:04:28	2021-11-02 11:04:28
1619	9	Praktiskie padomi m??c??bu materi??lu veido??an??. Izmantojot Kahoot vidi. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1620	9	Apzin??t??bas prakses pamatkurss 	2021-11-02 11:04:28	2021-11-02 11:04:28
1621	9	Pedago??isk??s  darb??bas pamati 	2021-11-02 11:04:28	2021-11-02 11:04:28
1622	9	The Creative workshops "Transport" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1623	9	Inov??cijas autotransport?? - izaicin??jums proffesion??lj?? izgl??t??b?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1624	9	speci??l??s zin????anas pedagogiem b??rnu ties??bu aizsardz??bas joma  	2021-11-02 11:04:28	2021-11-02 11:04:28
1625	9	Audzin????ana- personas pamatv??rt??bu izkop??anas process 	2021-11-02 11:04:28	2021-11-02 11:04:28
1626	9	 ir noklaus??jies pirm??s pal??dz??bas pamatzin????anu 12 stundu apm??c??bas kursu bez zin????anu p??rbaudes 	2021-11-02 11:04:28	2021-11-02 11:04:28
1627	9	Atbalsto??a m??c??bu vide -  resurss izgl??t??b?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1628	9	Microsoft Teams - efekt??vai skolas sazi??as  nodro??in????anai 	2021-11-02 11:04:28	2021-11-02 11:04:28
1629	9	M??c??bu procesa organiz????ana ar tehnolo??ijas pal??dz??bu 	2021-11-02 11:04:28	2021-11-02 11:04:28
1630	9	Efekt??vas karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d??: pl??notais un idejas ??steno??anai. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1631	9	V??cu valodas kursi. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1632	9	Projekta m??r??a sta??????an??s Latvij?? ????misk??s r??pniec??bas nozar??. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1633	9	 pedagogu profesion??l??s kompetences pilnveides A programma "Speci??lo zin????anu programma b??rnu ties??bu aizsardz??bas jom??"  	2021-11-02 11:04:28	2021-11-02 11:04:28
1634	9	pedagogu profesion??l??s kompetences pilnveide tehnolo??iju m??c??bu jomas pedagogiem 	2021-11-02 11:04:28	2021-11-02 11:04:28
1635	9	"M??c??bu procesa diferenci??cija, individualiz??cija un personaliz??cija' 	2021-11-02 11:04:28	2021-11-02 11:04:28
1636	9	Ieskats vizu??l??s programm????anas vid?? Scratch 	2021-11-02 11:04:28	2021-11-02 11:04:28
1637	9	Caurviju kompetenc??s balst??ta m??c??bu procesa izveide - darbs ar sevi un inform??cijas materi??liem efekt??vas sadarb??bas organiz????an?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1638	9	ir apguvusi pedagogu profesion??l??s pilnveides programmu "K?? veidot uzdevumus, kas veicina skol??nu iedzi??in????anos? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1639	9	Skol??nu pa??vad??tas m??c????an??s veicin????ana, m??c??bu procesa diferenci??cija un individualiz??cija 	2021-11-02 11:04:28	2021-11-02 11:04:28
1640	9	Pedagogu profesion??l??s kvalifik??cijas pilnveides A programma ,,M??c??bu procesa didaktiskie mode??i m??sdien??gas izgl??t??bas apguv??" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1641	9	Dom????anas un las????anas prasmju veicin????ana m??c??bu proces?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1642	9	Personisk??s l??der??bas pamatprincipi pedagoga pedago??iskaj?? darb??b?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1643	9	Nozaru kvalifik??cijas sist??mas pilnveide profesion??l??s izgl??t??bas att??st??bai un kvalit??tes nodro??in????anai 	2021-11-02 11:04:28	2021-11-02 11:04:28
1644	9	M??c??bu sasniegumu v??rt????ana, izaicin??jumi kompete????u izgl??t??b??. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1645	9	Jaun?? pasniedz??ja ABC 	2021-11-02 11:04:28	2021-11-02 11:04:28
1646	9	???Semin??rs ???Ievads medijprat??b??"" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1647	9	Rezultat??vas komandas veido??ana un vad????ana jeb ce???? no laba uz izcilu 	2021-11-02 11:04:28	2021-11-02 11:04:28
1648	9	Efekt??vas , uz skol??nu v??rstas  m??c??bu stundas organiz????ana 	2021-11-02 11:04:28	2021-11-02 11:04:28
1649	9	Lo??istikas pamati 	2021-11-02 11:04:28	2021-11-02 11:04:28
1650	9	apguva profesion??l??s kompetences pilnveides tie??saistes kursu programmu "Interakt??vi m??c??bu materi??li un to pielieto??ana m??c??bu proces??" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1651	9	Noliktavas uzskaite gr??matved??bas, uz????muma vad??bas un anal??zes sist??m?? Tildes Jumis 	2021-11-02 11:04:28	2021-11-02 11:04:28
1653	9	 Port??la "Uzdevumi.lv" iek??au??ana skolas m??c??bu proces?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1654	9	Inform??cijas tehnolo??ijas un mened??ments 	2021-11-02 11:04:28	2021-11-02 11:04:28
1655	9	CB36 IKT dro????ba profesion??laj?? izgl??t??b?? un apm??c??b?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1656	9	Cilv??ks ar invalidit??ti m??c??bu proces?? - jauns izaicin??jums, smaga probl??ma, parasta ikdiena, pat??kams iz????mums vai... 	2021-11-02 11:04:28	2021-11-02 11:04:28
1657	9	V??sture, kult??ra, soci??lie procesi un uz????m??jdarb??bas iesp??jas - viss svar??g??kais dz??vei Latvij?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1658	9	Forums "Izgl??t??ba izaugsmei 2018" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1659	9	Interneta atbild??ga lieto??ana (A) A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1660	9	 Apliec??ba par pirm??s pal??dz??bas pamatzin????anu 12 stundu apm??c??bas kursu  bez zin????anu p??rbaudes 	2021-11-02 11:04:28	2021-11-02 11:04:28
1661	9	M??c??bu pieejas mai??a uz kompotenc??m balst??t?? izgl??t??b??, pedagogu sadarb??bas iesp??jas jaun?? m??c??bu satura ??steno??an??. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1662	9	Short term staff training event 	2021-11-02 11:04:28	2021-11-02 11:04:28
1663	9	Apliec??ba par profesion??l??s kvalifik??cijas pilnveides programmas apguvi b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1664	9	apguva speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? ( profesion??l??s kvalifik??cijas pilnveides  programma) 	2021-11-02 11:04:28	2021-11-02 11:04:28
1665	9	M??c????an??s pamati kompeten??u pieej?? balst??t?? m??c??bu satura ??steno??an?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1666	9	Caurviju kompeten??u pieeja t??risma jomas modu??u programmu ??steno??an?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1667	9	Mentorings, mentoru t??kla izveido??ana 	2021-11-02 11:04:28	2021-11-02 11:04:28
1668	9	Uz????m??jdarb??bas b??t??ba un inov??ciju atbalsta iesp??jas 	2021-11-02 11:04:28	2021-11-02 11:04:28
1669	9	Cilv??ks ar invalidit??ti m??c??bu proces?? - jauns izaicin??jums, smaga probl??ma, parasta ikdiena, pat??kams iz????mums vai ... 	2021-11-02 11:04:28	2021-11-02 11:04:28
1670	9	Eti??etes un saskarsmes prasmes re??laj?? un virtu??laj?? vid?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1671	9	M??c??bu metodes. Tendenciozit??te. Prasmes un zin????anas, k?? m??c??t dabaszin??t??u m??c??bu priek??metus. M??c??bu stundas pl??na izstr??d????ana, izmantojot rado??os instrumentus. Inovat??va pedago??isk?? l??dzek??a izgatavo??ana. Izgl??tojam?? iepaz??stin????ana un iedro??in?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1672	9	Format??v??s v??rt????anas r??ki tie??saist?? A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1673	9	"M??c????an??s lietprat??bai m??c??bu jom??" (matem??tikas)  A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1674	9	Modul??r??s profesion??l??s izgl??t??bas programmu ??steno??ana 	2021-11-02 11:04:28	2021-11-02 11:04:28
1675	9	Interakt??vu un anim??tu ras????anas m??c??bu l??dzek??u attist??ba 	2021-11-02 11:04:28	2021-11-02 11:04:28
1676	9	 Apliec??ba par pirm??s pal??dz??bas pamatzin????anu 12 stundu apm??c??bas kursa beig??anu ar triju stundu zin????anu p??rbaudi 	2021-11-02 11:04:28	2021-11-02 11:04:28
1677	9	laik?? no 01.10.2018. l??dz 31.03.2019 piedal??jies anim??tu un interakt??vu materi??lu sagatavo??an?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1678	9	Komandas att??st??bas programma "R??diuss" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1679	9	Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom??. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1680	9	Caurviju prasmes karjeras vad??bai ikdien?? un m??c??bu proces?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1681	9	Labo darbu festiv??ls 	2021-11-02 11:04:28	2021-11-02 11:04:28
1682	9	Interakt??vi m??c??bu materi??li un to pielieto??ana m??c??bu proces?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1683	9	Baumo??anas, aprun????anas un favor??tisma kult??ra darba vid?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1684	9	Semin??rs "M??dijprat??ba: tendences un izaicin??jumi" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1685	9	M??c????an??s konsultantu sagatavo??ana re??iona vajadz??b??m. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1686	9	EPALE Vidzem??: Metodes pieaugu??o izgl??tot??ju darb?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1687	9	Modul??ro programmau ??steno??anas praktiskie aspekti. Pedagoga profesion??lo sasniegumu mape - praktiskie padomi t?? veido??an?? un aktualiz??cijai. Efekt??va karjeras att??st??bas atba;sta sist??ma izgl??t??bas iest??d?? un t.t. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1688	9	Jauni virzieni Holokausta izp??tes jaut??jumos Latvij?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1689	9	  Speci??l??s zin????anas pedagogiem  b??rnu ties??bu aizsardz??bas jom?? (A) A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1690	9	Modul??ro programmau ??steno??anas praktiskie aspekti.  Efekt??va karjeras att??st??bas atba;sta sist??ma izgl??t??bas iest??d?? un t.t 	2021-11-02 11:04:28	2021-11-02 11:04:28
1691	9	 Speci??l??s zin????anas programma  b??rnu ties??bu aizsardz??bas   jom?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1692	9	 ???M??c????an??s lietprat??bai valodu jom??, ??stenojot m??c??bu saturu ???V??cu valoda?????? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1693	9	Karjeras izgl??t??bas ??steno??anas efektivit??tes cel??ana skol?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1694	9	V??cu valodas skolot??ju - metodisk?? darba p??rst??vju semin??rs 	2021-11-02 11:04:28	2021-11-02 11:04:28
1695	9	ir apguvusi pedagogu profesion??l??s kompetences pilnveides programmu (A) ,,Programm????anas pamati un tehnolo??ijas m??sdien??g??m m??c??bu procesam" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1696	9	"V??cu valoda"- izaicin??jums, iedvesma, perspekt??va" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1697	9	Pedagogu profesion??l??s kvalifik??cijas pilnveides A programma ,,M??c??bu procesa didaktiskie mode??i m??sdien??gas izgl??t??bas apguv??" A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1698	9	Dom????anas un las????anas prasmju veicin????ana m??c??bu proces?? A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1699	9	Rolle der Lehrerpersonlichkeit 	2021-11-02 11:04:28	2021-11-02 11:04:28
1700	9	Hueber izdevniec??bas m??c??bu materi??lu izmanto??ana skol??nu sagatavo??anai v??cu valodas p??rbaud??jumiem B1, B2, C1 l??me??os A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1701	9	Pedagogu profesion??l??s kvalifik??cijas pilnveides A programmu  Audzin????anas stundu cikls "Es pasaul??, pasaule man??" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1702	9	Eiropa Mein Wahl. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1703	9	Uz????m??jdarb??bas izgl??t??ba profesion??l??s izgl??t??bas kvalit??tes cel??an?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1704	9	Speci??l??s zn????anas b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1705	9	Digit??l??s prasmes un / vai digit??l?? caurvija m??c??bu proces?? 21. gadsimta prasmju att??st????anai 	2021-11-02 11:04:28	2021-11-02 11:04:28
1706	9	B??rns ar autisk?? spektra trauc??jimiem (A) A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1707	9	apguva speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? - PSIHOLOGIEM 	2021-11-02 11:04:28	2021-11-02 11:04:28
1708	9	B??rnu un pusaud??u probl??mas kibersocializ??cij??. K?? saglab??t cilv??ciskumu un sagatavot dz??vi ciparu videi. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1709	9	Pedagogu un darba dev??ju izaicin??jumi un iesp??jas darb?? ar Millenium un post millenium paaudz??m 	2021-11-02 11:04:28	2021-11-02 11:04:28
1710	9	 Ievads  eTwinning 	2021-11-02 11:04:28	2021-11-02 11:04:28
1711	9	Profesion??l?? izgl??t??ba Latvij??. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1712	9	Izpratnes noz??mes pastiprin????ana m??cot zin??t??u priek??metu skol??s. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1713	9	Pedagogu izaicin??jumi un iesp??jas darb?? ar Millenium un post millenium paaudz??m. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1714	9	  Konference par metodisko darbu  E - klase 2016 	2021-11-02 11:04:28	2021-11-02 11:04:28
1715	9	Effective dialogue methods among the millenium generation and the teachers, employers. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1716	9	M??sdienu izgl??t??bas vad??bas psiholo??iskie aspekti. Stresa vad??ba 	2021-11-02 11:04:28	2021-11-02 11:04:28
1717	9	Efekt??vas karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d??: pl??notais un idejas ??steno??anai. un.t.t. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1718	9	Pa??izpausme vizu??l??s m??kslas veidos - pedagoga kompetenci papildino??s faktors A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1719	9	Metodiskais atbalsts sporta stundas un sporta intere??u izgl??t??bas nodab??bu organiz????an?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1720	9	Metodisks atbalsts sporta stundas un sporta intere??u izgl??t??bas nodarb??bu organiz????an?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1721	9	Efekt??va m??c??bu stunda - v??rt????ana m??c????an??s uzlabo??anai 	2021-11-02 11:04:28	2021-11-02 11:04:28
1722	9	"Vesel??ba, labs izskats, harmonija - ar Latvijas produktiem" jeb "Latvij?? ra??oti jaunie produkti un to izmanto??ana ??dienos" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1723	9	Rado??a pieeja darb??bai biznes?? un izgl??t??b?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1724	9	latvie??u valodas pilnveidei profesion??lajam vajadz??b??m skolu pedagogiem 	2021-11-02 11:04:28	2021-11-02 11:04:28
1725	9	apguva pedagogu profesion??l??s kompetences pilnveides kursus "Video mont????as" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1726	9	Digit??li un atrakt??vi m??c??bu materi??li 	2021-11-02 11:04:28	2021-11-02 11:04:28
1727	9	     B??rnu ties??bu aizsardz??ba A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1728	9	apguva "Projekta m??r??a grupas sta??????an??s Latvij?? kokr??pniec??bas nozar??, me??izstr??des jom??"  	2021-11-02 11:04:28	2021-11-02 11:04:28
1729	9	Skolot??jam nepiecie??am??s prasmes, ??stenojot m??c??bu saturu kompeten??u pieej??" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1730	9	Rokas elektroinstrumentu pieleito??ana kokizstr??d??jumu izgatavo??n??  	2021-11-02 11:04:28	2021-11-02 11:04:28
1731	9	M??sdien??ga komunik??cija 21. gadsimt?? - soci??lo t??klu un interneta atbild??ga un dro??a lieto??ana. "Interneta atbild??ga lieto??ana" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1732	9	T??risma att??st??ba Latvij?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1733	9	Dokumentu p??rvald??bas organiz????ana un dokumentu noform????ana. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1734	9	,,B??rnu ties??bu aizsardz??bas sist??ma un normat??vie akti b??rnu ties??bu aizsardz??bas jaut??jumos??? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1735	9	apguva pedagogu profesion??l??s kompetences pilnveides semin??ra programmu ,,Pedagogu darb??bas loma v??rt??bizgl??t??b??" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1736	9	Ir apg??ta pedagogu profesion??l??s kompetences pilnveides programmas apak??t??ma ,,Rezultat??vas komandas veido??ana un vad????ana jeb ce???? no laba uz izcilu??? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1737	9	Pedagogu profesion??l??s kompetences pilnveides programma ,,Padzi??in??ta IT prat??ba" (Pamata l??menis). 	2021-11-02 11:04:28	2021-11-02 11:04:28
1738	9	apguvusi pedagogu profesion??l??s kompetences pilnveides programmu ,,Profesion??l??s izgl??t??bas iest????u visp??rizgl??tojo??o un profesion??lo m??c??bu priek??metu sadarb??ba kompeten??u pieejas ??steno??an??. Valodu, dabasazin??t??u un matem??tikas jomas. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1739	9	Ir apg??ta pedagogu profesion??l??s kompetences pilnveides programmas apak??t??ma ,,M??c??bu satura apguves pl??no??ana starpdisciplin??r?? m??c??bu procesa realiz????anai??? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1740	9	ir apguvis pedagogu profesion??l??s kompetences pilnveides programmu "Kompeten??u pieeja m??c??bu satur??: Skolu vad??bas loma jaun?? m??c??bu satura  un pieejas m??c??b??m ievie??anai skol??" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1741	9	Metodisk?? diena-praktiskaj?? semin??r?? pedagogiem ,,Profesion??l??s izgl??t??bas izaicin??jumi??? apak??t??ma ,,Caurviju prasmes m??c??bu modu??os???  	2021-11-02 11:04:28	2021-11-02 11:04:28
1742	9	ir apguvis pedagogu profesion??l??s kompetences pilnveides programmu  	2021-11-02 11:04:28	2021-11-02 11:04:28
1743	9	    Speci??l??s zin????anas pedagogiem b??rnu ties??bu  aizsardz??bas  jom?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1744	9	Pedago??isk??s darb??bas pamati B 	2021-11-02 11:04:28	2021-11-02 11:04:28
1745	9	Prezent??ciju veido??ana darbam tie??sait?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1746	9	M??c??bu metodes darbam ar plan??etdatoru m??c??bu priek??meta ang??u valoda satura apguv??. A 	2021-11-02 11:04:28	2021-11-02 11:04:28
1747	9	Modul??ro programu ??steno??anas praktiskie aspekti. Skolot??ja pozit??vais t??ls t.sk. masu medijos:praktiskie aspekti. P??rbaudes darbu v??rt????anas krit??riji: teorija un prakse. un t.t. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1748	9	ir idenfic??ts Uzdevumi,lv skolot??ja ar pieeju visiem port??la apm??c??bas elementiem, dodot iesp??ju IKT izmantot m??c??bu stund??s un skol??nu past??v??gaj?? darb??, kas optimiz?? format??vo v??rt????anu un nodro??iana difirenc??tu pieeju un atbalstu katram skol??nam 	2021-11-02 11:04:28	2021-11-02 11:04:28
1749	9	  Speci??l??s zin????anas  pedagogiem b??rnu ties??bu aizsardz??bas jom??  	2021-11-02 11:04:28	2021-11-02 11:04:28
1750	9	Virsb??ves remonts un auto kr??so??ana. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1751	9	ZF / SACHS piedzi??as sist??ma 	2021-11-02 11:04:28	2021-11-02 11:04:28
1752	9	Moto Remo/Turbokompresoru uzb??ve un jaun??k??s tehnolo??ijas" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1753	9	Aktualit??tes autotransporta nozar?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1754	9	Androlio??ija - pieaugu??o izgl??t??bas principi un prakse. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1755	9	instit??ciju iek????jie pas??kumu koropcijas risku nov??r??anai 	2021-11-02 11:04:28	2021-11-02 11:04:28
1756	9	Profesion??l??s kvalifik??cijas pilnveides izgl??t??bas programmas apguve b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1757	9	"Inovat??vu m??c??bu meto??u un moderno izgl??t??bas tehnolo??iju izmanto??ana m??sdien??g?? m??c??bu proces?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1758	9	Ievads medijprat??b?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1759	9	???Pedagogu digit??l??s prat??bas pilnveide e -vides veid?? izgl??t??bas tehnolo??iju izmanto??anai 1.-6. kla??u datorikas m??c??atura apguves nodro??in????an????? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1760	9	???Pedagogu digit??l??s prat??bas pilnveide e -vides veid?? izgl??t??bas tehnolo??iju izmanto??anai 7.-9. kla??u datorikas m??c??atura apguves nodro??in????an????? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1761	9	Profesion??l??s izgl??t??bas iest????u visp??rizgl??tojo??o un profesion??lo m??c??bu priek??metu sadarb??ba kompeten??u pieejas ??steno??an??. M??c??bu satura apguves pl??no??ana starpdisciplin??r?? m??c??bu procesa realiz????anai. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1762	9	  Pedagogu  profesion??l??s kompetences pilnveide tehnolo??iju m??c??bu jomas pedagogiem 	2021-11-02 11:04:28	2021-11-02 11:04:28
1763	9	Iepaz??sti tehnolo??ijas 	2021-11-02 11:04:28	2021-11-02 11:04:28
1764	9	Port??la uzdevumi.lv  iek??au??ana skolas m??c??bu proces??. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1765	9	Dom????anas prasmju v??rt????anas instrumenti 	2021-11-02 11:04:28	2021-11-02 11:04:28
1766	9	Kompete????u pieeja speci??lajai izgl??t??bai 	2021-11-02 11:04:28	2021-11-02 11:04:28
1767	9	Iepaz??sti Lego un Miero:bit tehnolo??ijas 	2021-11-02 11:04:28	2021-11-02 11:04:28
1768	9	 Veiksm??gas audzin????anas pamatprincipi v??rt??bizgl??t??bas un tikumiskaj?? aspekt?? 	2021-11-02 11:04:28	2021-11-02 11:04:28
1769	9	Kompeten??u pieej??s balst??ts izgl??t??bas process, ??stenojot speci??l??s izgl??t??bas programmas B 	2021-11-02 11:04:28	2021-11-02 11:04:28
1770	9	Speci??l??s zin????anas pedagogiem b??rnu ties??bu aizsard??bas jom??  	2021-11-02 11:04:28	2021-11-02 11:04:28
1771	9	M??sdien??gas m??c??bu metodes pedago??ij?? un andrago??ij??, m??c??bu meto??u izv??le, pamatojoties uz m??c??bu m??r??i. M??c??bu izv??rt????ana androgo??ij??. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1772	9	Lo??istikas darbinieks 	2021-11-02 11:04:28	2021-11-02 11:04:28
1773	9	Modul??ro programmau ??steno??anas praktiskie aspekti.  Skolot??ja pozit??vais t??ls t.sk. masu medijos: praktiskie aspekti. un t.t. 	2021-11-02 11:04:28	2021-11-02 11:04:28
1774	9	    speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? apguve 	2021-11-02 11:04:28	2021-11-02 11:04:28
1775	9	B??rnu ties??bu aizsardz??bas kursi profesion??l??s kvalifik??cijas paaugstin????anai 	2021-11-02 11:04:28	2021-11-02 11:04:28
1776	9	ir apguvis pedagogu profesion??l??s pilnveides programmu "Pedagogu profesion??l??s kompetences pilnveido??ana audzin????anas jaut??jumos" 	2021-11-02 11:04:28	2021-11-02 11:04:28
1777	9	Veiksm??gas audzin????anas pamatprincipi v??rt??bizgl??t??bas un tikumiskaj?? aspekt?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1778	9	    Speci??l??s zin????anas b??rnu ties??bu  aizsardz??bas  jom?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1779	9	 Valsts valoda atbilsto??i augst??kajam valsts valodas prasmes l??menim (C2) 	2021-11-02 11:04:29	2021-11-02 11:04:29
1780	9	Pedagogu profesion??l??s kompetences pilnveide digit??l?? komunik??cij;a un sadarb??b??. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1781	9	Vilcienu kust??bas dro????bas nodro??in????ana veicot ce??a darbus. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1782	9	V??cu valodas kursi 	2021-11-02 11:04:29	2021-11-02 11:04:29
1783	9	apguva "Pedago??ijas ABC  darba vid?? balst??tu m??c??bu ??steno??anai" 	2021-11-02 11:04:29	2021-11-02 11:04:29
1784	9	 EXPRESS E-DAY 2021: ???Teaching at a time of change 2??? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1785	9	Pedagogu profesion??l??s kompetences pilnveides programma"M??c??bu procesa organiz????ana ar tehnolo??iju pal??dz??bu"(Pamata l??menis) 	2021-11-02 11:04:29	2021-11-02 11:04:29
1786	9	ELT Together 2020: How to keep students motivated with online learning 	2021-11-02 11:04:29	2021-11-02 11:04:29
1787	9	The following topics were covered in the course: Communicating with the modern world un.t.t 	2021-11-02 11:04:29	2021-11-02 11:04:29
1788	9	Psiholo??ijas loma m??c??bu proces??, sasniegumu veicin????n?? un izv??rt????an??. A 	2021-11-02 11:04:29	2021-11-02 11:04:29
1789	9	pedagoga profesion??lo sasniegumu mape - praktiskie padomi t?? izveidei un aktualiz??cijai. Efekt??va karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d?? un.tt. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1790	9	Apguva speci??l??s zin????anas b????nu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1791	9	Konflikti un to risin????anas strat????ijas A 	2021-11-02 11:04:29	2021-11-02 11:04:29
1792	9	Jaunatnes volejbola ytrenera kursi, volejbols ies??c??jiem un t.t.t 	2021-11-02 11:04:29	2021-11-02 11:04:29
1793	9	Pa??vad??ta m??c????an??s sporta nodarb??b??s pirmsskol?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1794	9	Gar??g??s vesel??bas veicin????ana skol?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1795	9	Audzin????ana k?? m??c??bu procesa sast??vda??a 	2021-11-02 11:04:29	2021-11-02 11:04:29
1796	9	Volejbola uzbrukuma sitiena apm??c??ba, pilnveido??ana unt.t. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1797	9	"Latvie??u valodas pilnveidei profesion??laj??m vajadz??b??m skolu pedagogiem 	2021-11-02 11:04:29	2021-11-02 11:04:29
1798	9	iRobot Sumo robotu b??ve un programm????ana 	2021-11-02 11:04:29	2021-11-02 11:04:29
1799	9	Projekta m??r??a grupas sta??????an??s Latvij?? izgl??t??bas nozar??, skolvad??bas jom??. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1800	9	Andrago??ija-pieaugu??o izgl??t??bas principi un prakse 	2021-11-02 11:04:29	2021-11-02 11:04:29
1801	9	  Profesion??l??s kompetences pilnveides  programma "Speci??lo zin????anu programma b??rnu ties??bu aizsardz??bas jom?? "Vec??ku un b??rnu ties??bas, pien??kumi un atbild??ba"  	2021-11-02 11:04:29	2021-11-02 11:04:29
1802	9	   B??rnu ties??bu aizsardz??ba A 	2021-11-02 11:04:29	2021-11-02 11:04:29
1803	9	Starpdisciplin??ro m??c??bu b??t??ba un noz??me, ievie??ot jauno kompeten??u pieeju m??c??bu satur?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1804	9	Kompeten??u pieej?? balst??ta v??rt??bizgl??t??ba 	2021-11-02 11:04:29	2021-11-02 11:04:29
1805	9	Digit??lie risin??jumi pedagogu darba kvalit??tes uzlabo??anai 	2021-11-02 11:04:29	2021-11-02 11:04:29
1806	9	V??rt????ana. Format??v?? v??rt????ana un atgriezenisk?? saite. Sasnieguma l??me??u apraksts prasmju v??rt????anai. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1807	9	Elektromobi??i 	2021-11-02 11:04:29	2021-11-02 11:04:29
1808	9	 Virtu??l??s atkar??bas: c??lo??i, izpausmes, korekcijas iesp??jas 	2021-11-02 11:04:29	2021-11-02 11:04:29
1809	9	P??rbaudes darbu veido??anas un noform????anas principi 	2021-11-02 11:04:29	2021-11-02 11:04:29
1810	9	Diagnostika ar iek??rtu LAUNCH X-431 Euro TAB 	2021-11-02 11:04:29	2021-11-02 11:04:29
1811	9	Skolot??jam nepiecie??am??s prasmes, ??stenojot m??c??bu saturu kompeten??u pieej?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1812	9	apguva "Projekta m??r??a grupas sta??????an??s Latvij?? transporta nozar??, automeh??nikas jom??" 	2021-11-02 11:04:29	2021-11-02 11:04:29
1813	9	The complete colliston repair system utilizing hydraulic re - alignment and Ez -Calipre measurement system, Piln??ga kolektora remonta sist??ma, kas izmanto hidraulisko regul????anu un EzCalipre m??r????anas sist??mu 	2021-11-02 11:04:29	2021-11-02 11:04:29
1814	9	Profesion??l??s  kvalifik??cijas eks??menu ??steno??ana 	2021-11-02 11:04:29	2021-11-02 11:04:29
1815	9	"Ideju fitness:Inov??cija un rado??ums person??gai un profesion??lai att??st??bai" 1. modulis- Rado??uma m??tu un inov??ciju med??bas 	2021-11-02 11:04:29	2021-11-02 11:04:29
1816	9	"Digit??l?? sazi??a ar valsti: dz??ves situ??cij??s noder??gi e-risin??jumi".  	2021-11-02 11:04:29	2021-11-02 11:04:29
1817	9	Semin??ru cikls organiz??ts Projekta "Piekrastes biotopu aizsardz??ba dabas park?? "Piej??ra" 	2021-11-02 11:04:29	2021-11-02 11:04:29
1818	9	Korupcija, t??s izpausmes, sekas un c????o??i. Korupcijas nov??r??ana. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1819	9	Metodisk?? un administrat??vi organizatorisk?? darba optimiz????ana ar Office 365 r??kiem 	2021-11-02 11:04:29	2021-11-02 11:04:29
1820	9	 Kompeten??u pieeja m??c??bu satur??: Skolu vad??bas loma jaun?? m??c??bu satura un pieejas m??c??b??m ievie??anai skol?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1821	9	Kompetence - kompekss sasniedzamais rezult??ts audz??knim efekt??v?? m??c??bu stund?? un skolot??ja profesion??la darb??ba audz??k??u m??c????an??s rezult??tu uzlabo??anai 	2021-11-02 11:04:29	2021-11-02 11:04:29
1822	9	Pilsonisk??s audzin????anas un pilsonisk??s l??dzdal??bas  sekm????ana izgl??t??bas iest??d?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1823	9	 "Izgl??tojamo uzved??bas korekcijas iesp??jas un l??dzek??i" (A programma 12 akad??misko stundu apjom??)  	2021-11-02 11:04:29	2021-11-02 11:04:29
1824	9	B??rnu ties??bu aizsardz??ba. Tiesiska r??c??ba vardarb??bas gad??jumos. Saskarsmes pamatprincipi. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1825	9	Audzin????anas process k?? m??c??bu procesa da??a 	2021-11-02 11:04:29	2021-11-02 11:04:29
1826	9	Lietprat??bas pieejas ??steno??ana, organiz??jot m??c??bu un audzin????anas darbu izgl??t??bas iest??d??. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1827	9	Dienas veido dz??vi 	2021-11-02 11:04:29	2021-11-02 11:04:29
1828	9	 latvie??u valodas pilnveidei profesion??lajam vajadz??b??m skolu pedagogiem 	2021-11-02 11:04:29	2021-11-02 11:04:29
1829	9	R??c??ba nestandarta situ??cij??s SCB ier????u boj??jumu gadijum??. Mikroprocesoru centraliz??cijas sist??ma Tales 	2021-11-02 11:04:29	2021-11-02 11:04:29
1830	9	Modul??ro programu ??steno??anas praktiskie aspekti. Pedagogu profesion??lo sasniegumu mape - praktiskie padomi t?? izveidei un aktualiz??cijai un.t.t. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1831	9	Ergonomika un rehabilit??cija 	2021-11-02 11:04:29	2021-11-02 11:04:29
1832	9	Speci??lo zin????anu apguve  bernu  ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1833	9	Audzin????anas darba izaicin??jumi, kompeten??u pieej?? balst??t?? izgl??t??bas proces?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1834	9	B??rnu vieglatl??tika ( A programma) 	2021-11-02 11:04:29	2021-11-02 11:04:29
1835	9	T??risma un orient????an??s prasmju pielieto??ana, organiz??jot sporta stundas un sporta pas??kumus. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1836	9	M??sdien??ga komunik??cija 21. gadsimt?? - soci??lo t??klu un interneta atbild??ga un dro??a lieto??ana. Interneta atbild??ga lieto??ana 	2021-11-02 11:04:29	2021-11-02 11:04:29
1837	9	  Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? (A)RIIMC 	2021-11-02 11:04:29	2021-11-02 11:04:29
1838	9	Talanta jaut??jums un izaugsmes dom????anas veida veicin????ana 	2021-11-02 11:04:29	2021-11-02 11:04:29
1839	9	Emocion??li inteli??ents treneris un emocion??l?? audzin????ana 	2021-11-02 11:04:29	2021-11-02 11:04:29
1840	9	Jaunatnes basketbola  treneru profesion??l??s kvalifik??cijas pilnveide 	2021-11-02 11:04:29	2021-11-02 11:04:29
1841	9	""Audzin????anas darba ??steno??ana - izgl??tojamo sevis izzin????anas un pa??att??st??bas sekm????ana 	2021-11-02 11:04:29	2021-11-02 11:04:29
1842	9	 Apm??c??bas programma visp??r??j??s izgl??t??bas iest????u pedagogiem par vesel??bas izgl??t??bas jaut??jumiem darb?? ar 7.-9. klases skol??niem par psihisko, seksu??lo un reprodukt??vo vesel??bu 	2021-11-02 11:04:29	2021-11-02 11:04:29
1843	9	Apm??c??bas programma visp??r??j??s izgl??t??bas iest????u pedagogiem par vesel??bas izgl??t??bas jaut??jumiem darb?? ar 10.-12. klases skol??niem par psihisko, seksu??lo un reprodukt??vo vesel??bu 	2021-11-02 11:04:29	2021-11-02 11:04:29
1844	9	Jaunatnes basketbola treneru profesion??l??s kvalifik??cijas pilnveide 	2021-11-02 11:04:29	2021-11-02 11:04:29
1845	9	P??rmai??u laika izaicin??jumi: superv??zijas sp??jas un iesp??jas 	2021-11-02 11:04:29	2021-11-02 11:04:29
1846	9	Publisk??  komunik??cija 	2021-11-02 11:04:29	2021-11-02 11:04:29
1847	9	Efekt??vs audzin??t??js. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1848	9	Pa??vald??bas m??c????an??s un sadarb??bas prasmju pilnveides iesp??jas valodu stund??s. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1849	9	 Interneta atbild??ga lieto??ana  	2021-11-02 11:04:29	2021-11-02 11:04:29
1850	9	Aktualit??tes m??be??u nozar?? - att;ist??ba un izaicin??jumi p??rmai??u laik??. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1851	9	Darbs ar simul??cijas iek??rtu - programmu "Mastercam Educational Suite" 	2021-11-02 11:04:29	2021-11-02 11:04:29
1852	9	"Profesion??l??s kvalifik??cijas eks??menu uzdevumu un to izpildes v??rt????anas krit??riju izstr??de" 	2021-11-02 11:04:29	2021-11-02 11:04:29
1853	9	instrukt????a  darbam ar iek??rt??m. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1854	9	,,Projekta m??r??a grupas sta??????an??s Latvij?? elektronikas nozar??" 	2021-11-02 11:04:29	2021-11-02 11:04:29
1855	9	Metodisk?? darba pl??no??ana saska???? ar RVT darba pl??nu 2018/19.m.g.. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1856	9	pamata zin????anas darbam ar apdares sist??mu Sataminijet 300B HVLP 	2021-11-02 11:04:29	2021-11-02 11:04:29
1857	9	pamata zin????anas darbam ar apdares materi??lu ????v????anas stat??vu Meta Multistrong LIPE 120P 	2021-11-02 11:04:29	2021-11-02 11:04:29
1858	9	pamata zin????anas darbam ar apdares materi??lu transport????anas rati??iem Fetra 1720x295mm Hahn + Kolb 	2021-11-02 11:04:29	2021-11-02 11:04:29
1859	9	pamata zin????anas darbam ar mobilu aspir??cijas iek??rtu Adamik FT 403 SF 	2021-11-02 11:04:29	2021-11-02 11:04:29
1860	9	pamata zin????anas darbam ar augstra????gu kompresoru Josval C-75/500 	2021-11-02 11:04:29	2021-11-02 11:04:29
1861	9	Inov??cijas autotransport?? - izaicin??jums profesion??laj?? izgl??t??b??. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1862	9	Autobrem??u ier????u ekspluat??cijas i??pa????bu p??t??jumu testgultn?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1863	9	Profesion??l??s kvalifik??cijas eks??menu uzdevumu un to izpildes v??rt????anas krit??riju izstr??de 	2021-11-02 11:04:29	2021-11-02 11:04:29
1864	9	B??rnu ties??bu aizsardz??ba 	2021-11-02 11:04:29	2021-11-02 11:04:29
1865	9	Pedagogu digit??l??s prat??bas pilnveide evides veid?? izgl??t??bas tehnolo??iju izmanto??anai 4.-9. kla??u dizains un tehnolo??ijas m??c??bu satura apguves nodro??in????ana 	2021-11-02 11:04:29	2021-11-02 11:04:29
1866	9	Jaunumi dokumentu noform????an?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1867	9	Dokumentu p??rvald??bas organiz????ana un dokumentu noform????ana 	2021-11-02 11:04:29	2021-11-02 11:04:29
1868	9	    speci??l??s zin????anas b??rnu ties??bu  jom?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1869	9	Facebook iesp??jas biznesa veicin????anai 	2021-11-02 11:04:29	2021-11-02 11:04:29
1870	9	Gada p??rskata sagatavo??ana 	2021-11-02 11:04:29	2021-11-02 11:04:29
1871	9	Latvijas invest??ciju un att??st??bas a??ent??ra 	2021-11-02 11:04:29	2021-11-02 11:04:29
1872	9	 E-r??ku ievie??ana m??c??bu proces??. 2018./19/m.g. audzin????anas darba pl??no??ana saska???? ar tehnikuma darba pl??nu. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1873	9	Uz????muma digit??l?? identit??te 	2021-11-02 11:04:29	2021-11-02 11:04:29
1874	9	Nodok??u aktivit??tes mazajiem uz????mumiem un pa??nodarbin??tajiem 	2021-11-02 11:04:29	2021-11-02 11:04:29
1986	9	Latvie??u valodas apguve pieaugu??ajiem 	2021-11-02 11:04:30	2021-11-02 11:04:30
1875	9	apguva profesion??l??s kompetences pilnveides semin??ra "M??sdienu izgl??t??bas vad??bas psiholo??iskie aspekti. Konfliktu vad??ba. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1876	9	 Speci??lo zin????anas b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1877	9	 Uz skol??na m??c????anos virz??ta  efekt??va m??c??bu stunda 	2021-11-02 11:04:29	2021-11-02 11:04:29
1878	9	,,Projekta m??r??a grupas sta??????an??s Latvij?? oligr??fijas nozar??" 	2021-11-02 11:04:29	2021-11-02 11:04:29
1879	9	Profesion??l??s izgl??t??bas iest????u visp??rizgl??tojo??o un profesion??lo m??c??bu priek??metu sadarb??ba kompeten??u pieejas ??steno??an??.  	2021-11-02 11:04:29	2021-11-02 11:04:29
1880	9	M??c??bu procesa organiz????ana ar tehnolo??iju pal??dz??bu (Pamata l??menis) 	2021-11-02 11:04:29	2021-11-02 11:04:29
1881	9	 Professional Development Course Express Days' 20 	2021-11-02 11:04:29	2021-11-02 11:04:29
1882	9	Pa??vad??tas m??c??????n??s un sadarb??bas prasmju pilnveides iesp??jas valodu stund??s. A 	2021-11-02 11:04:29	2021-11-02 11:04:29
1883	9	Konference ang??u valodas skolot??jiem 	2021-11-02 11:04:29	2021-11-02 11:04:29
1884	9	Project VET working@NET working 	2021-11-02 11:04:29	2021-11-02 11:04:29
1885	9	Together - Inspire, Empower, Achieve! 	2021-11-02 11:04:29	2021-11-02 11:04:29
1886	9	 Motiv??jo??as sarunas 	2021-11-02 11:04:29	2021-11-02 11:04:29
1887	9	Mobil??s tehnolo??ijas izgl??t??b?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1888	9	apguva "Projekta m??r??a grupas sta??????an??s Latvij?? izgl??t??bas nozar??, digitaliz??cijas jom??" 	2021-11-02 11:04:29	2021-11-02 11:04:29
1889	9	Datorgrafika 	2021-11-02 11:04:29	2021-11-02 11:04:29
1890	9	Tehnolo??ijas onlain??. K?? rad??t, p??rdot un pareizi novad??t vebin??ru. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1891	9	Creativity and the change of thinking paradigm. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1892	9	Kas ar mums notiek tagad? Multimodul??r?? terapija Kita Loringa m??ksla. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1893	9	Infografika: grafisk?? vizualiz??cija psihologa drb??, treneris, kau??s, koordinators 	2021-11-02 11:04:29	2021-11-02 11:04:29
1894	9	B??rbu ties??bu aizsardz??bas sist??ma un normat??vie akti b??rnu ties??bu aizsardz??bas jaut??jumos 	2021-11-02 11:04:29	2021-11-02 11:04:29
1895	9	Biznesa kanvu izaicin??jums 	2021-11-02 11:04:29	2021-11-02 11:04:29
1896	9	Jaunie??u motiv????ana uz??em??jdarb??as uzs??k??anai 	2021-11-02 11:04:29	2021-11-02 11:04:29
1897	9	Vair??ku likumu normu piem??ro??ana 2019.gad?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1898	9	M??jaslapas mekl????anas rezult??tu uzlabo??ana SEO tehnolo??ij??m 	2021-11-02 11:04:29	2021-11-02 11:04:29
1899	9	LEAN metodes izmanto??ana izmaksu samazin????an?? un resursu taup????an??. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1900	9	Modul??ro programmu ??steno??anas praktiskie aspekti. Pedagoga profesion??lo sasniegumu mape -praktiskie padomi t?? izveidei un aktualiz??cijai un t.t. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1901	9	apguva profesion??l??s kompetences pilnveides tie??saistes kursu programmu "Video r??ku un video materi??lu izmanto??ana  att??lin??to m??c??bu proces??" 	2021-11-02 11:04:29	2021-11-02 11:04:29
1902	9	THE PARTICIPANT MADE REMARKS ABOUT THE TOOLS AND PROVIDED SUGGESTIONS FOR FURTHER IMPROVEMENTS 	2021-11-02 11:04:29	2021-11-02 11:04:29
1903	9	M??c??bu metodes darbam ar plan??etdatoru m??c??bu priek??meta matem??tikas satura apguv??. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1904	9	Aktu??la pieeja krievu valodas k?? sve??valodas pasnieg??an??. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1905	9	M????ibu strat????ijas ??steno??anas iesp??jas krievu valodas (sve??valodas) stund??s. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1906	9	Pasaule bez robe????m: krievu valoda k?? sve??valoda. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1907	9	????mijas izgl??t??bas kvalit??tes paaugstin????ana ??? ce??i un l??dzek??i???  	2021-11-02 11:04:29	2021-11-02 11:04:29
1908	9	Pedagogu digit??l??s prat??bas pilnveide e - vides veid?? izgl??t??bas tehnolo??iju izmanto??anai m??sdien??gu ????mijas m??c??bu stundu organiz????ana', pielietojot digit??l??s ier??ces 	2021-11-02 11:04:29	2021-11-02 11:04:29
1909	9	Projekta m??r??a grupas sta??????an??s cit??s Eiropas Savien??bas dal??bvalst??s ????misk??s r??pniec??bas nozar?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1910	9	Projekta m??r??a grupas sta??????an??s Latvijas ????misk??s r??pniec??bas nozar?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1911	9	Cilv??ks ar invalidit??ti m??c??bu proces?? - jauns izaicin??jums, smaga probl??ma, parasta ikdiena, pat??kamu iz????mums vai 	2021-11-02 11:04:29	2021-11-02 11:04:29
1912	9	Speci??l??s zin????anas pedagogiem b??rnu ties??bu  aizsardz??bas  jom?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1913	9	Att??lin??tais darbs Zoom un Team platform??s 	2021-11-02 11:04:29	2021-11-02 11:04:29
1914	9	apguva profesion??l??s kompetences pilnveides tie??saistes kursu programmu "Video r??ku un video materi??lu izmanto??ana  att??lin??to m??c??bu proces?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1915	9	Apzin??t??ba un psihisk?? notur??ba, k?? l??dzeklis treni??u procesa efektivit??tes un sportisko rezult??tu paaugstin????anai augstu sasniegumu sport?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1916	9	Dokumentu un procesu vad??bas sist??mas DocLogix lieto??an?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1917	9	Biznesa kanvu izaicin??jums. 	2021-11-02 11:04:29	2021-11-02 11:04:29
1918	9	Efekt??vas karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d?? 	2021-11-02 11:04:29	2021-11-02 11:04:29
1919	9	Noliktavas uzsakite gr??matved??bas, uz????muma vad??bas un anal??zes sist??m?? "Tilde Jumis" 	2021-11-02 11:04:29	2021-11-02 11:04:29
1920	9	Tildes Jumis Person??ls 	2021-11-02 11:04:29	2021-11-02 11:04:29
1921	9	Nodok??u ietekme uz juridisko un fizisko personu ien??kumiem 	2021-11-02 11:04:29	2021-11-02 11:04:29
1922	9	Citi laiki - citas v??rt??bas? K??, mainoties tehnolo??ij??m, main??s jaunie??u paradumi un uztvere 	2021-11-02 11:04:29	2021-11-02 11:04:29
1923	9	Interneta vilin??jums: mulsino??ais un str??d??gais A 	2021-11-02 11:04:29	2021-11-02 11:04:29
1924	9	Modul??ro programmu ??steno??anas praktiskie aspekti. Pedagoga profesion??loa sasniegumu mape - praktiskie padomi t?? izveidei un aktiviz??cijai. un.t.t. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1925	9	DU Anatomijas un fiziolo??ijas katedras laboratoriju iesp??jas un iepaz????an??s ar ??erme??a kompoz??cijas noteik??anas iejk??rtu, k?? ar?? citu laboratorijas apr??kojumu. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1926	9	    speci??l??s zin????anas pedagogiem b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1927	9	Pedago??ijas ABC darba vid?? balst??tu m??c??bu ??steno??anai 	2021-11-02 11:04:30	2021-11-02 11:04:30
1928	9	Inov??cijas  autotransport?? - izaicin??jums profesion??laj?? izgl??t??b??  	2021-11-02 11:04:30	2021-11-02 11:04:30
1929	9	Konference "Vidzemes Augstskola:sadarb??bas partneris izgl??t??b??", apak??t??ma "Izgl??t??bas tehnolo??iju integr????ana m??c??bu proces??" 	2021-11-02 11:04:30	2021-11-02 11:04:30
1930	9	Aktivit??te "Atv??rt??s lekcijas skolot??jiem" 	2021-11-02 11:04:30	2021-11-02 11:04:30
1984	9	M??c??bu sasniegumu rezult??tu v??rt????ana modul??raj??s profesion??laj??s izgl??t??bas programm??s 	2021-11-02 11:04:30	2021-11-02 11:04:30
1931	9	apguva pedagogu profesion??l??s kompetences pilnveides programmu "M??c????an??s lietprat??bai valodu jom??, ??stenojot m??c??bu saturu "Sve??valoda" 	2021-11-02 11:04:30	2021-11-02 11:04:30
1932	9	" St??stu st??st????ana un veido??ana m??c??bu proces?? un eTwinning projektos sadarb??b?? ar I.Ziedo??a muzeju' 	2021-11-02 11:04:30	2021-11-02 11:04:30
1933	9	Ir apguvusi profesion??l??s kompetences pilnveides programmu, piedaloties darbn??c?? izgl??t??bas iest??des darbiniekiem par priek??laic??gas m??c??bu  p??rtrauk??anas (PMP) pas??kumu ??steno??anu izgl??t??bas iest??d??s 	2021-11-02 11:04:30	2021-11-02 11:04:30
1934	9	 Konference - praktiskais semin??rs pedagogiem "Vidzemes Augstskola: sadarb??bas partneris izgl??t??b??" 	2021-11-02 11:04:30	2021-11-02 11:04:30
1935	9	Pedagogu profesion??l??s kompetences pilnveide  vides izgl??t??b?? par ilgtsp??j??gu me??a   apsaimnieko??anu ( A ) 	2021-11-02 11:04:30	2021-11-02 11:04:30
1936	9	  Pedagogu  profesion??l??s kompetences pilnveides programma "Skaidras domas rada br??numus" 	2021-11-02 11:04:30	2021-11-02 11:04:30
1937	9	Tie??saistes r??ki valodu skolot??jiem A 	2021-11-02 11:04:30	2021-11-02 11:04:30
1938	9	M??c??bu metodes un eTwininning sadarb??bas projekti skol??nu kritisk??s dom????anas un argument??cijas prasmju att??st????anai A 	2021-11-02 11:04:30	2021-11-02 11:04:30
1939	9	Autentiska un m??r??tiec??ga runa 	2021-11-02 11:04:30	2021-11-02 11:04:30
1940	9	Iepirkumu un noliktavu darba organiz????ana. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1941	9	Lietved??ba, lieti?????? korespondence un arhiv????ana 	2021-11-02 11:04:30	2021-11-02 11:04:30
1942	9	Aptaujas un testu veido??anas r??ki atgriezenisk??s saites nodro??in????anai m??c??bu proces?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1943	9	Apguva profesion??l??s kompetences pilnveides semin??ra programmu transporta un lo??istikas nozar?? "Transporta un lo??istikas nozares modul??r??s profesion??l??s izgl??t??bas programmu aprob??cija, praktisko m??c??bu ??steno??anas veidi un modu??u apguves nov??rt????ana 	2021-11-02 11:04:30	2021-11-02 11:04:30
1944	9	Digit??lo r??ku izmanto??ana p??rbaudes darbu veido??an?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1945	9	Speci??lo zin????anu apguve b??rnu ties??bu aizsardz??bas jom??" Vec??ku un b??rnu ties??bas, pien??kumi un atbild??ba" 	2021-11-02 11:04:30	2021-11-02 11:04:30
1946	9	 Speci??l??s zin????anas pedagogiem b??rnu ties??bu  aizsardz??bas  jom?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1947	9	Attended a 5 hour Professional Development Course Express Days'20 	2021-11-02 11:04:30	2021-11-02 11:04:30
1948	9	Pedagogu profesion??lo kompete????u v??rt????ana un p??rbaudes darbu izstr??des jaut??jumos 	2021-11-02 11:04:30	2021-11-02 11:04:30
1949	9	M??c??bu pieejas mai??a uz kompetenc??m balst??t?? izgl??t??b??, pedagogu sadarb??bas iesp??jas jaun?? m??c??bu satura ??steno??an?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1950	9	V??st??juma vizualiz????ana izgl??t??bas jom??. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1951	9	Efekt??vs vad??t??js: Motiv??cija. Pien??kumu dele??????ana. Atgriezenisk?? saite. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1952	9	Aktu??lais profesion??laj?? un pieaugu??o izgl??t??b?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1953	9	digit??l??s sazi??as ar valsti: dz??ves situ??cij??s noder??gi e-risin??jumi 	2021-11-02 11:04:30	2021-11-02 11:04:30
1954	9	Profesion??l??s izgl??t??bas iest????u direktora vietnieku izgl??t??bas jom?? darba semin??rs 	2021-11-02 11:04:30	2021-11-02 11:04:30
1955	9	"M??sdienu pedago??ijas psiholo??iskie aspekti.Stresa vad??ba" 	2021-11-02 11:04:30	2021-11-02 11:04:30
1956	9	Speci??l??s zin????anas pedagogiem b??rnu ties??bu aizsardz??bas jom??(A) 	2021-11-02 11:04:30	2021-11-02 11:04:30
1957	9	Iem??c??tais optimisms 	2021-11-02 11:04:30	2021-11-02 11:04:30
1958	9	Pirms laika p??rtraukta izgl??t??bas apguve, t??s b??t??ba, c??lo??i un risin????anas iesp??jas izgl??t??bas vid??. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1959	9	2018./19.m??c??bu gada audzin????anas darba pl??no??ana saka???? ar tehnikuma darbu. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1960	9	Speci??lo zin????anu programma b??rnu ties??bu aizsardz??bas jom??. Vec??ku un b??rnu ties??bas, pien??kumi un atbild??ba. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1961	9	???M??sdien??ga m??c??bu procesa ??steno??ana izgl??tojamiem ar speci??l??m vajadz??b??m???  	2021-11-02 11:04:30	2021-11-02 11:04:30
1962	9	Office 365, Microsoft Teams Training  	2021-11-02 11:04:30	2021-11-02 11:04:30
1963	9	Videi r??ku un video materi??lu izmanto??ana att??lin??to m??c??bu proces?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1964	9	" M??sdien??ga komunik??cija 21. gs. soci??lo t??klu un interneta atbild??ga un dro??a lieto??ana. A 	2021-11-02 11:04:30	2021-11-02 11:04:30
1965	9	B??rnu ties??bas un ekr??nm??diju pied??v??jums. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1966	9	Ir piedal??jusies Kr??slavas novada pedagogu ikgad??j?? augusta konferenc?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1967	9	E-klase 2019 	2021-11-02 11:04:30	2021-11-02 11:04:30
1968	9	Individualiz??ta pedago??isk?? procesa pl??no??ana un vad????ana, skolas atbalsta komandas darba organiz????ana, str??d??jot ar izgl??tojamajiem ar kombin??tiem att??st??bas trauc??jumiem A 	2021-11-02 11:04:30	2021-11-02 11:04:30
1969	9	Individualiz??ta pedago??isk?? procesa pl??no??ana un vad????ana, skolas atbalsta komandas darba organiz????ana, str??d??jot ar izgl??tojamajiem ar kombin??tiem att??st??bas trauc??jumiem 	2021-11-02 11:04:30	2021-11-02 11:04:30
1970	9	Semin??rs "M??c??bu meto??u daudzveid??ba finan??u pat??bas apguvei"  	2021-11-02 11:04:30	2021-11-02 11:04:30
1971	9	Digit??l?? Eiropas Valodas portfe??a (EVP) izmanto??ana valodu apguves proces?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1972	9	E-klase 2018 	2021-11-02 11:04:30	2021-11-02 11:04:30
1973	9	Sadarb??bas darbn??ca "Skolot??ji un vec??ki pret COVID-19 izaicin??jumiem" 	2021-11-02 11:04:30	2021-11-02 11:04:30
1974	9	Pedagogu digit??l??s prat??bas pilnveide e - vides veid?? izgl??t??bas tehnolo??iju izmanto??anai 7.-9. kla??u datorikas m??c??bu satura apguves nodro??in????an?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1975	9	Main??gas situ??cijas izgl??t??bas jom?? izrais??ta stresa mazin????ana pedagogiem, skol??niem un vec??kiem 	2021-11-02 11:04:30	2021-11-02 11:04:30
1976	9	???Starpdisciplin??r??s pieejas ievie??ana pedagoga darb??: no teorijas l??dz praksei???;  3. modulis ??? starpdisciplinarit??te m??c??bu materi??la un satura izveid?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1977	9	Microsoft Teams - efekt??vai skolas sazi??as nodro??in????anai 	2021-11-02 11:04:30	2021-11-02 11:04:30
1978	9	Kr??slavas novada pedagogu metodisk?? konference "IT joma - kompetenc??m un karjeras izaugsmei" 	2021-11-02 11:04:30	2021-11-02 11:04:30
1979	9	Interneta atbild??ga lieto??ana (A) 	2021-11-02 11:04:30	2021-11-02 11:04:30
1980	9	Kr??slavas novada pedagogu konference 	2021-11-02 11:04:30	2021-11-02 11:04:30
1981	9	Ce???? uz m??sdien??gu izgl??t??bu 	2021-11-02 11:04:30	2021-11-02 11:04:30
1982	9	Viesskol??ns klas?? - ieguvumi un gr??t??bas 	2021-11-02 11:04:30	2021-11-02 11:04:30
1983	9	Pedagogu digit??l??s lietprat??bas pilnveide m??c????an??s vad??bas risin??jumu un integr??to m??ko??pakalpojumu izmanto??an?? (Office 365) 	2021-11-02 11:04:30	2021-11-02 11:04:30
1985	9	Latvie??u valodas apguve pieaugu??ajiem. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1987	9	Modul??ro programu ??steno??anas praktiskie aspekti. Skolot??ja pozit??vais t??ls t.sk. masu medijos:praktiskie aspekti. P??rbaudes darbu v??rt????anas krit??riji: teorija un prakse. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1988	9	M??sdienu izgl??t??bas vad??bas psiholo??iskie aspekti. Konfliktu vad??ba. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1989	9	Pedagogu digit??l??s prat??bas pilnveide e - vides veid?? izgl??t??bas tehnolo??iju izmanto??anai 10.-12. kla??u dizains un tehnolo??as m??c??bu satura apguves nodro??in????an?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1990	9	???Pedagogu digit??l??s prat??bas pilnveide e- vides veid?? izgl??t??bas tehnolo??iju izmanto??anai 10.-12. kla??u datorikas m??c??bu satura apguves nodro??in????an????? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1991	9	Modul??r??s profeasion??las izgl??t??bas programmas Datorsit??mu tehni??is aprob??cija un lab??s prakses piem??ri, modu??u nov??rt????anas uzdevumu veido??ana un to izpildes v??rt????anas krit??riji   	2021-11-02 11:04:30	2021-11-02 11:04:30
1992	9	modularo programmu ??steno??anas praktiskie aspekti. Skolot??ju pozit??vais t??ls t.sk. masu medijos praktiskie aspekti Audz??k??u m??c??bu sasniegumu v??rt????ana un p??rbaudes darbu veido??ana un t.t. 	2021-11-02 11:04:30	2021-11-02 11:04:30
1993	9	Apguva profesion??l??s kompetences pilnveides semin??ra "Digit??l??s iesp??jas m??sdien??gam m??c??bu procesam" programmu 	2021-11-02 11:04:30	2021-11-02 11:04:30
1994	9	Apguva profesion??l??s kompetences pilnveides semin??ra auto transporta  un met??lapstr??des nozar??s "Auto ??odien un r??t" 	2021-11-02 11:04:30	2021-11-02 11:04:30
1995	9	Personas datu apstr??de un aizsardz??bas izgl??t??bas iest??d?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
1996	9	 AutoCad 	2021-11-02 11:04:30	2021-11-02 11:04:30
1997	9	B??rnu ties??bas un to aizsardz??ba 	2021-11-02 11:04:30	2021-11-02 11:04:30
1998	9	Uzdevumi kompleksa snieguma m??r????anai dabaszin??tn??s: veido??ana un v??rt????ana 	2021-11-02 11:04:30	2021-11-02 11:04:30
1999	9	Pedago??isk??s  darb??bas pamati B 	2021-11-02 11:04:30	2021-11-02 11:04:30
2000	9	Test????anas un kalibr????ana laboratoiju kompetences visp??r??g??s pras??bas. 	2021-11-02 11:04:30	2021-11-02 11:04:30
2001	9	     B??rnu ties??bas un  to aizsardz??ba 	2021-11-02 11:04:30	2021-11-02 11:04:30
2002	9	Apguva profesion??l??s kompetences pilnveides semin??ru cikla programmu "Mentorings-efekt??vs atbalsts jaunajiem pedagogiem" 	2021-11-02 11:04:30	2021-11-02 11:04:30
2003	9	Publisk?? uzst????an??s un efekt??vas prezent??cijas metodes 	2021-11-02 11:04:30	2021-11-02 11:04:30
2004	9	M??c????ana un m??c????an??s kompeten??u pieej?? m??c??bu proces?? A 	2021-11-02 11:04:30	2021-11-02 11:04:30
2005	9	Online r??ki darba organiz????anai 	2021-11-02 11:04:30	2021-11-02 11:04:30
2006	9	Autorties??bas , to izmanto??ana un re??istr????ana intere??u izgl??t??bas kontekst?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2007	9	Microsoft Teams un citu Office 365 r??ku izmanto??ana izgl??t??bas iest??des darb?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2008	9	Nemateri??l?? kult??ras mantojumu apg????anas un p??rmanto??anas skola 	2021-11-02 11:04:30	2021-11-02 11:04:30
2009	9	Tautas deju lielkoncerta "Saule vija zelta rotu" repertu??ra preciz????ana 	2021-11-02 11:04:30	2021-11-02 11:04:30
2010	9	Pedago??isk??s strat????ijas skol??nu uzved??bas vad????anai klas?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2011	9	Deju kolekt??vu vad??t??ju profesion??l?? pilnveide 	2021-11-02 11:04:30	2021-11-02 11:04:30
2012	9	"XII Latvijas skolu jaunatnes dziesmu un deju sv??tku deju lielkoncerta "saule vija zelta rotu"repertu??ra preciz????ana" 	2021-11-02 11:04:30	2021-11-02 11:04:30
2013	9	 apguva speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2014	9	???Pedagogu digit??l??s prat??bas pilnveide e-vides veid?? izgl??t??bas tehnolo??iju izmanto??anai 7.-9. kla??u matem??tikas m??c??bu satura apguves nodro??in????an????? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2015	9	Pedagogu digit??l??s prat??bas pilnveide e-vides veid?? izgl??t??bas tehnolo??iju izmanto??anai 10.-12.kla??u matem??tikas m??c??bu satura apguves nodro??in????an?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2016	9	M??sdien??gu IT risin??jumu izmanto??ana m??c??bu procesa organiz????anai un p??rvald??bai 	2021-11-02 11:04:30	2021-11-02 11:04:30
2017	9	Algebras uzdevumi matem??tikas olimpi??d??s 	2021-11-02 11:04:30	2021-11-02 11:04:30
2018	9	Aktualit??tes matem??tikas m??c??bu jomas satur?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2019	9	Atbalsta snieg??ana jauniebrauc??ju integr??cijai skolas vid?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2020	9	J??gpilni uzdevumi matem??tik?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2021	9	Matem??tiskie mode??i 	2021-11-02 11:04:30	2021-11-02 11:04:30
2022	9	Modul??ro izgl??t??bas programmu ??steno??anas praktisie aspekti. Audz??k??u m??c??bu sasniegumu v??rt????ana principi un krit??riji un p??rbaudes darbu veido??ana. Metodisko darbu pl??no??ana saska??a ar RVT darba pl??nu. un t.t. 	2021-11-02 11:04:30	2021-11-02 11:04:30
2023	9	Iek????jie juridiskie dokumenti izgl??t??bas iest??d?? A 	2021-11-02 11:04:30	2021-11-02 11:04:30
2024	9	 Apliec??ba par pirm??s pal??dz??bas pamatzin????anu 12 stundu apm??c??bas kursus bez zin????anu p??rbaudes 	2021-11-02 11:04:30	2021-11-02 11:04:30
2025	9	,,Projekta m??r??a grupas sta??????an??s Latvij?? poligr??fijas nozar??" 	2021-11-02 11:04:30	2021-11-02 11:04:30
2026	9	Pedagogu profesiona??o sasniegumu mape - praktiskie padomi t?? izveidei un aktualiz??cijai. Efekt??vas karjeras att??t??bas atbalsta sit??ma izgl??t??bas iest??d??. un t.t. 	2021-11-02 11:04:30	2021-11-02 11:04:30
2027	9	Digit??lo m??c??bu un metodisko materi??lu veido??ana internet?? m??kslas un dizaina nozar?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2028	9	Speci??lo zin????anu  b??rnu ties??bu aizsardz??bas jom?? apguve. 	2021-11-02 11:04:30	2021-11-02 11:04:30
2029	9	apguva pedagog profesion??l??s kompotences pilnveides programmu "M??c????an??s lietprat??bai kult??ras izpratnes un pa??izpausmes m??ksl?? m??c??bu jom??-starpdisciplin??rit??te un m??c??bu priek??mets" 	2021-11-02 11:04:30	2021-11-02 11:04:30
2030	9	Dizaina v??sture k?? caurviju kompetence 	2021-11-02 11:04:30	2021-11-02 11:04:30
2031	9	Rot????ana un rot????an??s - mantotas un jaunrad??tas trad??cijas 	2021-11-02 11:04:30	2021-11-02 11:04:30
2032	9	Rot????ana un  rot????an??s - mantotas un jaunrad??tas trad??cijas 	2021-11-02 11:04:30	2021-11-02 11:04:30
2033	9	     B??rnu ties??bas un   to aizsardz??ba  	2021-11-02 11:04:30	2021-11-02 11:04:30
2034	9	Efekt??vas karjeras atbalsta att??st??bas sist??ma izgl??t??bas iest??d??. Skolot??ja pozit??vais t??ls t.sk. masu m??dijos: praktiskie aspekt. 2018./19.m.g. pl??no??ana un t.t.i   	2021-11-02 11:04:30	2021-11-02 11:04:30
2035	9	Emocion??l?? intele??ence izgl??t??b?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2036	9	Modul??ro programmu ??steno??anas praktiskie aspekti.Efekt??va karjeras att??st??bas atbalsta sist??ma izgl??t??bas iest??d?? un.t.t. 	2021-11-02 11:04:30	2021-11-02 11:04:30
2037	9	Uz????m??jdarb??ba un m??rketings rado??o industriju jom?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2038	9	Interjera polihromais kr??sojums 	2021-11-02 11:04:30	2021-11-02 11:04:30
2039	9	P??rliecino??a publisk?? runa m??c??bu proces?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2040	9	M??sdien??ga b??vniec??bas procesa vad????ana 	2021-11-02 11:04:30	2021-11-02 11:04:30
2041	9	M??sdienu pedago??ijas psiholo??iskie apsketi. Konfliktu vad??ba. 	2021-11-02 11:04:30	2021-11-02 11:04:30
2042	9	Andrago??ija- pieaugu??o izgl??t??bas principi un prakse 	2021-11-02 11:04:30	2021-11-02 11:04:30
2043	9	projekta m??r??a grupas sta??????ana?? Latvijas b??vniec??bas nozar??, apdares darbu jom?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2044	9	Gada kr??sa iek??telpu dizain?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2045	9	   Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? A 	2021-11-02 11:04:30	2021-11-02 11:04:30
2046	9	FSA s??rijas motor?? testeru pielieto??ana diagnostik??. 	2021-11-02 11:04:30	2021-11-02 11:04:30
2047	9	  Profesion??l??s kompetences pilnveides  programma "Speci??lo zin????anu programma b??rnu ties??bu aizsardz??bas jom?? "Vec??ku un b??rnu ties??bas, pien??kumi un atbild??ba""  	2021-11-02 11:04:30	2021-11-02 11:04:30
2048	9	 Speci??lo zin????anu apguve b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2049	9	???Starpdisciplin??r??s pieejas ievie??ana pedagoga darb??: no teorijas l??dz praksei???;  2. modulis ??? Pilotstundu veido??ana un vad????ana ar starpdisciplin??ro pieeju 	2021-11-02 11:04:30	2021-11-02 11:04:30
2050	9	???Starpdisciplin??r??s pieejas ievie??ana pedagoga darb??: no teorijas l??dz praksei???;  1. modulis ??? Ievads starpdisciplin??r??s pieejas ievie??an?? pedagoga darb?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2051	9	  Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2052	9	 ,,Modul??ro izgl??t??bas programmu ??steno??ana??? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2053	9	 speci??las zin????anas b??rnu  ties??bu aizsardz??bas jom?? 	2021-11-02 11:04:30	2021-11-02 11:04:30
2054	9	21.gadsimta bibliot??ka 	2021-11-02 11:04:30	2021-11-02 11:04:30
2055	9	M??sdienu izgl??bas vad??bas psiholo??iskie aspekti. konfliktu vad??ba 	2021-11-02 11:04:30	2021-11-02 11:04:30
2056	9	Inov??cijas uz????m??jdarb??b??. Lab??k??s m??c??bu metodes un pieredzes apg????ana. 	2021-11-02 11:04:31	2021-11-02 11:04:31
2057	9	piedal??j??s semin??r?? ``Aktualit??tes ekonomik?? 2020`` 	2021-11-02 11:04:31	2021-11-02 11:04:31
2058	9	Superv??zijas m??r??i 	2021-11-02 11:04:31	2021-11-02 11:04:31
2059	9	Skol??nu m??c??bu uz????muma (SMU) mentora sagatavo??ana jaunie??u uz????m??jsp??ju kompeten??u att??st????anai izgl??t??bas iest??d?? A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2060	9	International Student Company Festival 2018 	2021-11-02 11:04:31	2021-11-02 11:04:31
2061	9	 profesion??l??s kompetences pilnveides  programma Speci??lo zin????anu apguve b??rnu ties??bu aizsardz??bas jom?? " Vec??ku un b??rnu ties??bas, pien??kumi un atbild??ba" 	2021-11-02 11:04:31	2021-11-02 11:04:31
2062	9	???Starptautisk??s tirdzniec??bas un LR nodok??u sist??mas aktualit??tes skol??nu zin??tnisk??s p??tniec??bas darbu vad????anas kontekst????? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2063	9	Karjeras atbalsts ikdien?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2064	9	    Speci??l??s zin????anas programma  b??rnu ties??bu aizsardz??bas   jom?? A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2065	9	M??rketinga m??c??bu priek??meta saturs, m??r??i un uzdevumi 	2021-11-02 11:04:31	2021-11-02 11:04:31
2066	9	V??rt??bu at????ir??bas starp da????d??m paaudz??m un to ietekme uz skol??na m??c????an??s kvalit??ti un pedagogu darbu 	2021-11-02 11:04:31	2021-11-02 11:04:31
2067	9	Skol??nu m??c??bu uz????mumu (SMU) mentora sagatavo??ana jaunie??u uz????m??jsp??ju kompeten??u at??st????anai izgl??t??bas iest??d?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2068	9	Pedagogu profesion??l??s pilnveides programma "Likumdo??anas m??c??bu priek??metu saturs, m??r??i, uzdevumi." 	2021-11-02 11:04:31	2021-11-02 11:04:31
2069	9	Eksakto, humanit??ro un soci??lo m??c??bu priek??metu skolot??ju profesion??lo un pedago??isko kompeten??u pilnveide izmantojot IKT A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2070	9	Kla??u audzin??t??ju profesion??lo un pedago??isko kompeten??u pilnveide A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2071	9	M??sdienu paaudzes ietekme uz skol??na pan??kumiem un sadarb??bas form??m izgl??t??bas iest??d?? un neform??l?? vid??. 	2021-11-02 11:04:31	2021-11-02 11:04:31
2072	9	   B??rnu ties??bu aizsardz??ba  (A) A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2073	9	Rokas elektroinstrumentu pielieto??ana kokizstr??d??jumu izgatavo??an?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2074	9	Mentorings - efekt??vs atbalsts jaunajiem pedagogiem. 	2021-11-02 11:04:31	2021-11-02 11:04:31
2075	9	Pirms laika p??rtraukta izgl??t??bas apguve, t??s b??t??ba, c??lo??i un risin????anas iesp??jas izgl??t??bas vid??. A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2076	9	   Speci??l??s zin????anas pedagogiem b??rnu ties??bu aizsardz??bas jom?? A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2077	9	Sabiedr??ba un cilv??ku dro????ba 	2021-11-02 11:04:31	2021-11-02 11:04:31
2078	9	Ir ieguvusi ties??bas pasniegt visp??r??j?? un profesion??l?? izgl??t??b?? m??c??bu priek??metus jom?? Sabiedr??ba un cilv??ku dro??iba. 	2021-11-02 11:04:31	2021-11-02 11:04:31
2079	9	B??rnu ties??bu aizsardz??ba. 	2021-11-02 11:04:31	2021-11-02 11:04:31
2080	9	Profesion??l??s kompetences pilnveides A programma	2021-11-02 11:04:31	2021-11-02 11:04:31
2081	9	Individual approach and individual learning plan in WBL:Training for WBL tutors 	2021-11-02 11:04:31	2021-11-02 11:04:31
2082	9	Apguva profesion??l??s kompetences pilnveides semin??ra programmu transporta un lo??istikas nozar?? "Transporta un lo??istikas nozares modul??r??s profesion??l??s izgl??t??bas programmu aprob??cija, praktisko m??c??bu ??steno??anas veidi un modu??u apguves nov??rt????ana A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2083	9	Projekta m??r??a  grupas sta??????an??s cit?? Eiropas Savien??bas dal??bvalst?? lo??istikas nozar?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2084	9	Izpratnes noz??mes pastiprin????ana m??cot zin??t??u priek??metus skol??. 	2021-11-02 11:04:31	2021-11-02 11:04:31
2085	9	Jaun??ko IKT r??ku pielietojums m??c??bu procesa organiz????an?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2086	9	Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2087	9	"'Port??la Uzdevumi.lv iek??au??ana skolas m??c??bu proces??"' 	2021-11-02 11:04:31	2021-11-02 11:04:31
2088	9	Prevent??vais soci??li pedago??iskais un soci??lais darbs m??sdien??s: izaicin??jumi, risin??jumi, praktisk?? pieredze. 	2021-11-02 11:04:31	2021-11-02 11:04:31
2089	9	Caurviju prasmes pilsoniskaj?? un valstiskaj?? audzin????an?? uz kompetenc??m balst??t?? m??c??bu proces?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2090	9	Novadm??c??ba skol??: darbs ar programm??m un m??c??bu l??dzek??iem 	2021-11-02 11:04:31	2021-11-02 11:04:31
2091	9	   profesion??l??s kompetences pilnveides kursi b??rnu ties??bu aizsardz??bas jom?? "Vec??ku un b??rnu ties??bas, pien??kumi un atbild??ba" 	2021-11-02 11:04:31	2021-11-02 11:04:31
2092	9	Emocion??l?? un soci??l?? intelekta prasmes veiksm??gai stundai 	2021-11-02 11:04:31	2021-11-02 11:04:31
2093	9	 P??rmai??u dom????anas strat????ija 	2021-11-02 11:04:31	2021-11-02 11:04:31
2094	9	Pirm??s pal??dz??bas snieg??ana. ABC so??i. A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2095	9	Pirm??s pal??dz??bas snieg??ana. ABC so??i A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2096	9	Efekt??vs vad??t??js II 	2021-11-02 11:04:31	2021-11-02 11:04:31
2097	9	Best practise training for teacing printing tehnology(Lab??k??s prakses apm??c??ba druk????anas tehnolo??iju m??c????anai) 	2021-11-02 11:04:31	2021-11-02 11:04:31
2098	9	Efekt??vs vad??t??js valsts p??rvald??  	2021-11-02 11:04:31	2021-11-02 11:04:31
2099	9	 Virtu??l??s atkar??bas: c??lo??i, izpausmes, korekcijas iesp??jas. A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2100	9	M??c????an??s lietprat??bai- izgl??t??bas p??rvaldes loma A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2101	9	apguva pedagogu profesion??l??s kompetences pilnveides semin??ra programmu "Valsts.??rlietas.M??s" 	2021-11-02 11:04:31	2021-11-02 11:04:31
2102	9	"PuMPuRS" konference " Atbalsts priek??laic??gas m??c??bu p??rtrauk??anas samazin????anai" 	2021-11-02 11:04:31	2021-11-02 11:04:31
2103	9	Ties??bu dokumentu katalogs izgl??t??bas iest??d??m A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2104	9	M??sdien??gs m??c??bu process skol?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2105	9	Latvijas skolas soma, kult??ras kanona konkurss un m??c??bu satura pilnveide 	2021-11-02 11:04:31	2021-11-02 11:04:31
2106	9	Vispus??g?? fizisk?? sagatov??ba un t??s ietekme uz b??rnu un pusaud??u vesel??bu. 	2021-11-02 11:04:31	2021-11-02 11:04:31
2107	9	 apguva speci??l??s zin????anas b??rnu ties??bu aizsardz??bas jom?? ( profesion??l??s kvalifik??cijas pilnveides  programma) 	2021-11-02 11:04:31	2021-11-02 11:04:31
2108	9	Apliec??ba par profesion??l??s kvalifik??cijas pilnveides izgl??t??bas programmas apguvi b??rnu ties??bu aizsardz??bas jom??  	2021-11-02 11:04:31	2021-11-02 11:04:31
2109	9	B??rnu ties??bu aizsardz??ba pedagogiem 	2021-11-02 11:04:31	2021-11-02 11:04:31
2110	9	Personas datu aizsardz??ba (IT) un IT dro????ba 	2021-11-02 11:04:31	2021-11-02 11:04:31
2111	9	Starpdisciplin??r??s m??c??bu pieejas iedz??vin????ana Kandavas Lauksaimniec??bas tehnikum??-uz sadarb??bu v??rstas m??c??bu vides pilnveide 	2021-11-02 11:04:31	2021-11-02 11:04:31
2112	9	noklaus??j??s un apguva m??c??bu kursu "Digit??l?? sazi??a ar valsti: dz??ves situ??cij??s noder??gi e-risin??jumi" 	2021-11-02 11:04:31	2021-11-02 11:04:31
2113	9	Apguva profesion??l??s kompetences pilnveides semin??ra programmu "Kompetenc??s balst??tas pedago??isk??s pieejas teor??tiskie un praktiskie aspekti m??c??bu proces??" 	2021-11-02 11:04:31	2021-11-02 11:04:31
2114	9	Komercdarb??bas tiesiskais regul??jums 	2021-11-02 11:04:31	2021-11-02 11:04:31
2115	9	Par nodok??iem un nodev??m 	2021-11-02 11:04:31	2021-11-02 11:04:31
2116	9	A programma profesion??l??s kompetences pilnveides kursi b??rnu ties??bu aizsardz??bas jom?? pedagogiem A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2117	9	Uzved??bas probl??mas skol??. C??lo??sakar??bu mekl??jumos. K?? izprast? K?? pal??dz??t? K?? izdz??vot? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2118	9	"Pozit??v?? disciplin????ana. Veiksm??ga sadarb??ba ar vec??kiem. M??c????an??s motiv??cija" 	2021-11-02 11:04:31	2021-11-02 11:04:31
2119	9	M??sdien??ga m??c??bu un audzin????anas procesa anal??zes teor??tiskie un praktiskie aspekti, v??rojot m??c??bu stundas 	2021-11-02 11:04:31	2021-11-02 11:04:31
2120	9	Pedagogu lab??s prakses piem??ru skate 	2021-11-02 11:04:31	2021-11-02 11:04:31
2121	9	Apm??c??bas programma"Zin????anas b??rnu ties??bu aizsardz??bas jom??" 	2021-11-02 11:04:31	2021-11-02 11:04:31
2122	9	Darbs ar m??sdienu pusaud??iem. "M??c??bu stunda izgl??t??bas iest??d?? 21. gadsimt??." (A) A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2123	9	M??sdienu komunik??cija 21.gadsimt??  - soci??lo t??klu un interneta atbild??ga un dro??a lieto??ana A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2124	9	Profesion??l??s kvalifik??cijas pilnveides programma (A) "B??rnu ties??bu aizsardz??ba. Tiesiska r??c??ba vardarb??bas gad??jumos. Saskarsmes pamatprincipi". 	2021-11-02 11:04:31	2021-11-02 11:04:31
2125	9	Profesion??l??s kompetences pilnveides kurss "Programm????anas valoda Python" 	2021-11-02 11:04:31	2021-11-02 11:04:31
2126	9	Audzin????anas darba ??steno??ana - izgl??tojamo sevis izzin????anas un pa??att??st??bas sekm????ana 	2021-11-02 11:04:31	2021-11-02 11:04:31
2127	9	Datorikas  skolot??ju konference 	2021-11-02 11:04:31	2021-11-02 11:04:31
2128	9	eTwinning seminar "Coding and Computational Thinking" (Programm????anas un digit??l??s probl??mrisin????anas prasmes) 	2021-11-02 11:04:31	2021-11-02 11:04:31
2129	9	Medijprat??ba digit??lo algoritmu laikmet?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2130	9	ir apguvusi ES programmas izgl??t??bas, apm??c??bas, jaunatnes un sporta jom?? "Erasmus+" aktivit??tes eTwinning pedagogu profesion??l??s kompetences pilnveide programmu  Ievads eTwinning 	2021-11-02 11:04:31	2021-11-02 11:04:31
2131	9	Projekta m??r??a grupas sta??????an??s nozar??, me??izstr??des jom?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2132	9	Vides dizaina elementi 	2021-11-02 11:04:31	2021-11-02 11:04:31
2133	9	C??lkoka izmanto??anas dizaina m??b????u izgatavo??an??. 	2021-11-02 11:04:31	2021-11-02 11:04:31
2134	9	koka skulpt??ru m??ksliniecisk?? veido??ana  	2021-11-02 11:04:31	2021-11-02 11:04:31
2135	9	    Speci??l??s zin????anas b??rnu ties??bu aizsardz??bas   jom?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2136	9	Metakognitivit??te m??c??bu proces?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2137	9	ir apguvusi pedagogu profesion??l??s kvalifik??cijas pilnveides programmu "Pedagogu darba samaksas noteik??anas tiesiskie aspekti, problem??tika, risin??jumi" 	2021-11-02 11:04:31	2021-11-02 11:04:31
2138	9	Izgl??t??bas iest??des darb??bas organiz??cijas juridiskie aspekti 	2021-11-02 11:04:31	2021-11-02 11:04:31
2139	9	Izaicin??jumi un iesp??jas klases audzin??t??ja darb?? skol?? 21. gadsimt?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2140	9	  Konference par metodisko darbu  E - klase 2018 	2021-11-02 11:04:31	2021-11-02 11:04:31
2141	9	Konfliktsitu??ciju un agres??va kontakta situ??ciju risin????anas metodes 	2021-11-02 11:04:31	2021-11-02 11:04:31
2142	9	 Audzin????anas pieejas izgl??t??bas proces?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2143	9	Textile variations 	2021-11-02 11:04:31	2021-11-02 11:04:31
2144	9	M??c??bu procesa organiz????ana ar tehnolo??iju pal??dz??bu 	2021-11-02 11:04:31	2021-11-02 11:04:31
2145	9	M??c??bu procesa  organiz????ana ar tehnolo??iju pal??dz??bu 	2021-11-02 11:04:31	2021-11-02 11:04:31
2146	9	Teaching at a Time of Change, M??c????ana p??rmai??u laik??. 	2021-11-02 11:04:31	2021-11-02 11:04:31
2147	9	Pamata pasnieg??anas metodes krievu valoda k?? sve??valoda (las????ana) 	2021-11-02 11:04:31	2021-11-02 11:04:31
2148	9	Pamata pasnieg??anas metodes kroevu valoda k?? sve??valoda (v??stules un sarunvaloda) 	2021-11-02 11:04:31	2021-11-02 11:04:31
2149	9	Feeling ready for change, Finding the right balance ??? filling in the gaps while moving forward, Is it safe to do exams now?, Sensitivity, empowerment and compassion ??? emotionally supporting your students on return to the classroom 	2021-11-02 11:04:31	2021-11-02 11:04:31
2150	9	The future of English teaching, learning and assessment - in conversation with.., Time management. Practical ways to make your teaching life easier,  What makes for a positive learning environment?Optimising learning both at home and in school   	2021-11-02 11:04:31	2021-11-02 11:04:31
2151	9	"Port??la Uzdevumi.lv iek??au??ana skolas m??c??bu proces??" 	2021-11-02 11:04:31	2021-11-02 11:04:31
2152	9	Intercultural communication and translation. 	2021-11-02 11:04:31	2021-11-02 11:04:31
2153	9	Skol??nu m??c??bu uz????mumi k?? m??c??bu metode 	2021-11-02 11:04:31	2021-11-02 11:04:31
2154	9	V??rdu kr??jumu atk??rto??anas veidi un pa????mieni. Pilnv??rt??ga un daudzveid??ga m??c??bu gr??matas izmanto??ana. A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2155	9	Psiholo??ijas loma m??c??bu proces??, sasniegumu veicin????an?? un izv??rt????an??. Sadarb??ba probl??mrisin????anas prasmju pilnveide proces?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2156	9	Metodisk?? darba pl??no??ana saska???? ar RVT darba pl??nu 2018./19.m.g. Praktiski padomi m??c??bu materi??la veido??an??, izmantojot Kahoot vidi. E-r??ku ievie??ana m??c??bu proces??. Skolot??ja pozit??vais t??ls t.sk. masu m??dijos praktiskie aspekti. un t.t 	2021-11-02 11:04:31	2021-11-02 11:04:31
2157	9	 "M??c????an??s lietprat??bai valodu jom??, ??stenojot m??c??bu saturu  "Latvie??u valoda " 	2021-11-02 11:04:31	2021-11-02 11:04:31
2158	9	Ir apguvusi pedagogu profesion??l??s kvalifik??cijas pilnveides A programmu "Liter??r?? mantojuma veiksm??ga integr??cija latvie??u valodas un literat??ras stund??s" latvie??u valodas, literat??ras un v??stures skolot??jiem A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2159	9	Inov??cijas autotransport?? - izaicin??jums profesion??laj?? izgl??t??b?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2160	9	"Padzi??in??t?? IT prat??ba" (Profesion??l??is l??menis) 	2021-11-02 11:04:31	2021-11-02 11:04:31
2161	9	"M??c??bu procesa organiz????ana ar tehnolo??iju pal??dz??bu"(Pamata l??menis) 	2021-11-02 11:04:31	2021-11-02 11:04:31
2162	9	Pieredze, izaicin??jumi un ieguvumi fizikas izgl??t??b??  - 2020 	2021-11-02 11:04:31	2021-11-02 11:04:31
2163	9	K?? veidot uzdevumus, kas veicina skol??nu iedzi??in????anos? A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2164	9	Karjeras izgl??t??bas ??steno??anas efektivit??tes cel??ana skol?? A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2165	9	M??c????an??s lietprat??bai matem??tikas m??c??bu jom?? 	2021-11-02 11:04:31	2021-11-02 11:04:31
2166	9	Darbs ar izgl??tojamajiem kuriem ir m??c????an??s trauc??jumi A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2167	9	Skol??nu pa??vad??tas m??c????an??s veicin????ana, m??c??bu procesa diferenci??cija un individualiz??cija A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2168	9	 Apm??c??bas programma visp??r??j??s izgl??t??bas iest????u pedagogiem par vesel??bas izgl??t??bas jaut??jumiem darb?? ar 7.-9. klases skol??niem par atkar??bu izraiso????m viel??m un procesiem A 	2021-11-02 11:04:31	2021-11-02 11:04:31
2169	9	M??c??bas	2021-11-02 11:04:31	2021-11-02 11:04:31
2170	9	Neform??l?? izgl??t??bas programma	2021-11-02 11:04:31	2021-11-02 11:04:31
2171	9	Profesion??l??s pilnveides izgl??t??bas programma	2021-11-02 11:04:31	2021-11-02 11:04:31
2172	9	Darbsemin??rs	2021-11-02 11:04:31	2021-11-02 11:04:31
2173	9	profesion??l??s kompetences pilnveides tie??saistes kuru programma	2021-11-02 11:04:31	2021-11-02 11:04:31
2174	9	Konference	2021-11-02 11:04:31	2021-11-02 11:04:31
2175	9	Pedagoga profesion??l??s kompetences pilnveides A  programma	2021-11-02 11:04:31	2021-11-02 11:04:31
2176	9	Pedagogu profesion??l??s  kompetences pinveides programma	2021-11-02 11:04:31	2021-11-02 11:04:31
2177	9	Metodiskais semin??rs	2021-11-02 11:04:32	2021-11-02 11:04:32
2178	9	Profesion??l?? pilnveides programma	2021-11-02 11:04:32	2021-11-02 11:04:32
2179	9	Vebin??rs	2021-11-02 11:04:32	2021-11-02 11:04:32
2180	9	Tie??saistes platforma	2021-11-02 11:04:32	2021-11-02 11:04:32
2181	9	Pedagoga profesion??l??s kompetences pilnveides kurss	2021-11-02 11:04:32	2021-11-02 11:04:32
2182	9	Praktiskais semin??rs	2021-11-02 11:04:32	2021-11-02 11:04:32
2183	9	Profesion??l?? pilnveides kurss	2021-11-02 11:04:32	2021-11-02 11:04:32
2184	9	profesion??l?? t??l??kizgl??t??bas programma	2021-11-02 11:04:32	2021-11-02 11:04:32
2185	6	Filologs un vidusskolas latvie??u valodas un literat??ras skolot??js	2021-11-02 11:05:31	2021-11-02 11:05:31
2186	6	 Gr??matvedis	2021-11-02 11:05:31	2021-11-02 11:05:31
2187	6	Uz????m??jdarb??bas (komercdarb??bas) speci??lista	2021-11-02 11:05:31	2021-11-02 11:05:31
2188	6	Feld??eris	2021-11-02 11:05:31	2021-11-02 11:05:31
2189	6	Darbu vad??t??js celtniec??b??	2021-11-02 11:05:31	2021-11-02 11:05:31
2190	6	Pedago??isk??s darb??bas pamati	2021-11-02 11:05:31	2021-11-02 11:05:31
2191	6	Transporta uz????muma vad??t??js	2021-11-02 11:05:31	2021-11-02 11:05:31
2192	6	Transporta uz????muma vad??t??ja	2021-11-02 11:05:31	2021-11-02 11:05:31
2193	6	In??eniera-Meh??ni??a	2021-11-02 11:05:31	2021-11-02 11:05:31
2194	6	Tehnisk??s inform??cijas un autop??rvad??jumi, profesion??lo C1, C, D1, D, E transporta l??dzek??u vad??t??ju autoskolas apm??c??bas   pasniedz??js	2021-11-02 11:05:31	2021-11-02 11:05:31
2195	6	Soci??lo zin??t??u ma??istra gr??ds vad??bzin??tn??	2021-11-02 11:05:32	2021-11-02 11:05:32
2196	6	"Pedago??isk??s darb??bas pamati"	2021-11-02 11:05:32	2021-11-02 11:05:32
2197	6	Soci??lo zin??t??u bakalaura gr??du psiholo??ij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2198	6	Pamatkurss pedago??ij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2199	6	Kokapstr??des Tehnologs	2021-11-02 11:05:32	2021-11-02 11:05:32
2200	6	m??be??u galdnieks amata zellis	2021-11-02 11:05:32	2021-11-02 11:05:32
2201	6	Jurista pal??gs	2021-11-02 11:05:32	2021-11-02 11:05:32
2202	6	uz????m??jdarb??bas vad??t??ja	2021-11-02 11:05:32	2021-11-02 11:05:32
2203	6	Sekret??re	2021-11-02 11:05:32	2021-11-02 11:05:32
2204	6	Arodskolot??ja pamata pedago??isk??s izgl??t??bas programma	2021-11-02 11:05:32	2021-11-02 11:05:32
2205	6	Vidusskolas ????mijas skolot??ja	2021-11-02 11:05:32	2021-11-02 11:05:32
2206	6	??rsta	2021-11-02 11:05:32	2021-11-02 11:05:32
2207	6	Biolo??ijas Skolot??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2208	6	Fizisk??s Kult??ras Un Sporta Pasniedz??js, 5. l??me??a profesion??l?? kvalifik??cija, profesion??lais ma??istra gr??ds	2021-11-02 11:05:32	2021-11-02 11:05:32
2209	6	Pamatskolas ????mijas Skolot??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2210	6	Ir  ieguvusi ties??bas m??c??t soci??l??s zin??bas pamatizgl??t??bas pak??p??	2021-11-02 11:05:32	2021-11-02 11:05:32
2211	6	 Speci??l?? izgl??t??ba (izgl??tojamiem  ar m??c????an??s trauc??jumiem un gar??g??s att??st??bas trauc??jumiem)	2021-11-02 11:05:32	2021-11-02 11:05:32
2212	6	Ang??u valoda	2021-11-02 11:05:32	2021-11-02 11:05:32
2213	6	v??stures un sabiedr??bas m??c??bas pasniedz??ja	2021-11-02 11:05:32	2021-11-02 11:05:32
2214	6	Audzin??t??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2215	6	ir ieguvusi ties??bas veikt pedago??isko darb??bu	2021-11-02 11:05:32	2021-11-02 11:05:32
2216	6	Humanit??ro zin??t??u bakalaurs v??stur??	2021-11-02 11:05:32	2021-11-02 11:05:32
2217	6	Kravas autop??rvad??jumu/pasa??ieru autop??rvad??jumu profesion??l?? kompetence 	2021-11-02 11:05:32	2021-11-02 11:05:32
2218	6	V??stures Pasniedz??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2219	6	T??risma Mened??eris, Izgl??t??bas Un Sporta Darba Vad??t??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2220	6	Fizisk??s Kult??ras Skolot??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2221	6	uz????m??jdarb??bas ( komercdarb??bas) speci??lists	2021-11-02 11:05:32	2021-11-02 11:05:32
2222	6	 ir ieguvusi ties??bas veikt pedago??isko darb??bu 	2021-11-02 11:05:32	2021-11-02 11:05:32
2223	6	fizisk??s kult??ras un sporta pasniedz??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2224	6	boksa treneris	2021-11-02 11:05:32	2021-11-02 11:05:32
2225	6	 soci??lo zin??t??u ma??istra gr??du vad??bzin??tn??	2021-11-02 11:05:32	2021-11-02 11:05:32
2226	6	soci??lo zin??t??u bakalaura gr??ds vad??bzin??tn??	2021-11-02 11:05:32	2021-11-02 11:05:32
2227	6	Pedago??ijas darb??bas pamati 	2021-11-02 11:05:32	2021-11-02 11:05:32
2228	6	bakalaura gr??ds fizik??	2021-11-02 11:05:32	2021-11-02 11:05:32
2229	6	In??enierzin??t??u ma??istra gr??ds ener????tik?? un elektrotehnik??	2021-11-02 11:05:32	2021-11-02 11:05:32
2230	6	In??eniera kvalifik??cija ener????tik?? un elektrotehnik??	2021-11-02 11:05:32	2021-11-02 11:05:32
2231	6	Pamatizgl??t??bas Skolot??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2232	6	????mijas Pasniedz??js, Biologs, Biolo??ijas Pasniedz??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2233	6	Fizikas skolot??js pamatizgl??t??bas pak??p??	2021-11-02 11:05:32	2021-11-02 11:05:32
2234	6	muitas iest??des strukt??rvien??bas vad??t??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2235	6	muitas eksperts	2021-11-02 11:05:32	2021-11-02 11:05:32
2236	6	Biroja darba organizators	2021-11-02 11:05:32	2021-11-02 11:05:32
2237	6	In??enierzin??t??u bakalaura gr??ds elektrozin??tn??	2021-11-02 11:05:32	2021-11-02 11:05:32
2238	6	Ir ieguvis ties??bas pild??t profesion??l??s izgl??t??bas skolot??ja amatu.	2021-11-02 11:05:32	2021-11-02 11:05:32
2239	6	Matem??ti??is - pasniedz??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2240	6	Holokausta un genoc??da metodolo??ija	2021-11-02 11:05:32	2021-11-02 11:05:32
2241	6	In??enierzin??t??u ma??istra gr??ds ????mij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2242	6	Dabaszin??t??u bakalaura gr??ds ????mij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2243	6	 izgl??t??bas zin??t??u ma??istra gr??ds pedago??ij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2244	6	ekonomistes uz????m??jdarb??bas tiesiskaj?? nodro??in??jum??	2021-11-02 11:05:32	2021-11-02 11:05:32
2245	6	jurists	2021-11-02 11:05:32	2021-11-02 11:05:32
2246	6	pie????irta v??sturnieka, v??stures un sabiedr??bas m??c??bas pasniedz??ja kvalifik??cija	2021-11-02 11:05:32	2021-11-02 11:05:32
2247	6	Fizi??is, pasniedz??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2248	6	Vidusskolas Krievu Val. Un Lit. Un Skol??s Ar Krievu M??c??bu Valodu Latvie??u Val. Skolot??ja	2021-11-02 11:05:32	2021-11-02 11:05:32
2249	6	Deju un ritmikas skolot??js,  Pirmsskolas  izgl??t??bas skolot??js,  Skolot??js Logop??ds,  Pamatizgl??t??bas Skolot??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2250	6	Ir  ieguvusi ties??bas m??c??t speci??l??s izgl??t??bas programm??s pamatizgl??t??bas pak??p??	2021-11-02 11:05:32	2021-11-02 11:05:32
2251	6	Arodpedagogs	2021-11-02 11:05:32	2021-11-02 11:05:32
2252	6	iespieddarbu salic??ja amata meistars	2021-11-02 11:05:32	2021-11-02 11:05:32
2253	6	Rokas burtlicis	2021-11-02 11:05:32	2021-11-02 11:05:32
2254	6	par apm??c??bu darbam ar triecieniztur??bas apar??tu PENDULUM IMPACT CHARPY TESTER	2021-11-02 11:05:32	2021-11-02 11:05:32
2255	6	ieguva Valsts izgl??t??bas satura centra ??r??tata metodi??a statusu par ieguld??jumu profesion??l??s izgl??t??bas sist??mas att??st??b?? un pedagogu profesion??l??s pilnveid??	2021-11-02 11:05:32	2021-11-02 11:05:32
2256	6	Praktisk?? pedago??ija darba vid?? balst??tu m??c??bu ??steno??anai	2021-11-02 11:05:32	2021-11-02 11:05:32
2257	6	Inform??tikas un programm????anas skolot??ja un m??jsaimniec??bas, m??jtur??bas un tehnolo??iju skolot??ja kvalifik??cija	2021-11-02 11:05:32	2021-11-02 11:05:32
2258	6	Tehni??is- mehani??is	2021-11-02 11:05:32	2021-11-02 11:05:32
2259	6	D??ze??lokomot??vju un tvaika lokomot??vju remonta atsl??dznieks	2021-11-02 11:05:32	2021-11-02 11:05:32
2260	6	ir ieguvis pedago??isko izgl??t??bu	2021-11-02 11:05:32	2021-11-02 11:05:32
2261	6	Profesion??l?? izgl??t??bas skolot??ja kvalifik??cija, ceturtais profesion??l??s kvalifik??cijas l??menis	2021-11-02 11:05:32	2021-11-02 11:05:32
2262	6	Automeh??ni??is	2021-11-02 11:05:32	2021-11-02 11:05:32
2263	6	In??enierzin??t??u bakalaura gr??ds  sist??mprogram????an??	2021-11-02 11:05:32	2021-11-02 11:05:32
2264	6	Arodskolot??ju Pamata Pedago??isk?? Izgl??t??ba	2021-11-02 11:05:32	2021-11-02 11:05:32
2265	6	Vid??j??s izgl??t??bas ang??u valodas skolot??ja	2021-11-02 11:05:32	2021-11-02 11:05:32
2266	6	Filaloga, ang??u valodas pasniedz??ja	2021-11-02 11:05:32	2021-11-02 11:05:32
2267	6	darba aizsardz??bas vec??kais speci??lists	2021-11-02 11:05:32	2021-11-02 11:05:32
2268	6	Ekonomikas zin??t??u ma??istra gr??ds uz????m??jdarb??bas vad??b??	2021-11-02 11:05:32	2021-11-02 11:05:32
2269	6	 Pedagogs, Ma??istra  Gr??ds	2021-11-02 11:05:32	2021-11-02 11:05:32
2270	6	uz????m??jdarb??ba un ekonomika	2021-11-02 11:05:32	2021-11-02 11:05:32
2271	6	Soci??lais Pedagogs	2021-11-02 11:05:32	2021-11-02 11:05:32
2272	6	pedago??ijas bakalura gr??ds	2021-11-02 11:05:32	2021-11-02 11:05:32
2273	6	pedagoga sertifik??ts	2021-11-02 11:05:32	2021-11-02 11:05:32
2274	6	Pedagogs - karjeras konsultants	2021-11-02 11:05:32	2021-11-02 11:05:32
2275	6	Profesion??lais ma??istra gr??ds soci??l?? darb??	2021-11-02 11:05:32	2021-11-02 11:05:32
2276	6	Latvie??u valodas un literat??ras vidusskolas skolot??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2277	6	Bibliot??kzin??tnes un bibliogr??fijas	2021-11-02 11:05:32	2021-11-02 11:05:32
2278	6	(krievu filolo??ija)	2021-11-02 11:05:32	2021-11-02 11:05:32
2279	6	vad??t??ja kvalifik??cija transporta un biznesa lo??istik??	2021-11-02 11:05:32	2021-11-02 11:05:32
2280	6	Transporta p??rvad??jumu komercdarbinieks	2021-11-02 11:05:32	2021-11-02 11:05:32
2281	6	Dabaszin??t??u ma??istra gr??ds ????mij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2282	6	profesion??lais ma??istra gr??ds transportsist??mu in??enierij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2283	6	transportsist??mu in??enieris	2021-11-02 11:05:32	2021-11-02 11:05:32
2284	6	dabas zin??t??u ma??istra gr??ds matem??tik??	2021-11-02 11:05:32	2021-11-02 11:05:32
2285	6	5. profesion??l??s kvalifik??cijas l??me??a vidusskolas matem??tikas skolot??ja kvalifik??cija	2021-11-02 11:05:32	2021-11-02 11:05:32
2286	6	visp??r??j??s vid??j??s izgl??t??bas sertifik??ts	2021-11-02 11:05:32	2021-11-02 11:05:32
2287	6	Profesion??lais Bakalaura gr??ds transporta elektronik?? un telem??tik??	2021-11-02 11:05:32	2021-11-02 11:05:32
2288	6	 Ir ieguvis ties??bas veikt pedago??isko darb??bu 	2021-11-02 11:05:32	2021-11-02 11:05:32
2289	6	 Pedago??ijas ma??istra gr??ds	2021-11-02 11:05:32	2021-11-02 11:05:32
2290	6	 latvie??u valodas un literat??ras skolot??ja 	2021-11-02 11:05:32	2021-11-02 11:05:32
2291	6	pedago??ijas bakalaura gr??ds sport??	2021-11-02 11:05:32	2021-11-02 11:05:32
2292	6	Humanit??r??s zin??t??u ma??istra gr??ds filolo??ij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2293	6	ieguvusi vid??j??s izgl??t??bas krievu k?? sve??valodas un latvie??u valodas k?? otr??s valodas skolot??ja kvalifik??ciju	2021-11-02 11:05:32	2021-11-02 11:05:32
2294	6	soci??lo zin??t??u bakalura gr??ds bibliotek??rzin??tne un inform??cij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2295	6	Bibliot??k??rs	2021-11-02 11:05:32	2021-11-02 11:05:32
2296	6	Arodskolot??ja pamata pedago??isk?? Izgl??t??ba	2021-11-02 11:05:32	2021-11-02 11:05:32
2297	6	Krievu valodas un literat??ras pasniedz??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2298	6	arodpedago??ija	2021-11-02 11:05:32	2021-11-02 11:05:32
2299	6	Ma????nburtlicis	2021-11-02 11:05:32	2021-11-02 11:05:32
2300	6	Gr??matu un citu iespieddarbu noform????ana	2021-11-02 11:05:32	2021-11-02 11:05:32
2301	6	Pedago??isk??s kvalifik??cijas sertifik??ts	2021-11-02 11:05:32	2021-11-02 11:05:32
2302	6	Ir ieguvusi ties??bas veikt pedago??isko darb??bu profesion??laj??s  un intere??u izgl??t??bas programm??s	2021-11-02 11:05:32	2021-11-02 11:05:32
2303	6	in??enierzin??t??u ma??istra gr??ds in??enierpedago??ij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2304	6	Dzelzce??a  p??rvad??jumu procesa in??enieris	2021-11-02 11:05:32	2021-11-02 11:05:32
2305	6	ekspluat??cijas tehni??is	2021-11-02 11:05:32	2021-11-02 11:05:32
2306	6	ieguvusi Vaksts izgl??t??ba satura centra ??r??tata metodi??a statusu par  piedal????anos profesion??l??s   kvalifik??cijas eks??menu uzdevumu izstr??d??	2021-11-02 11:05:32	2021-11-02 11:05:32
2307	6	Profesion??lais ma??istra gr??ds skolas pedago??ij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2308	6	vid??j??s izgl??t??ibas matem??tikas  skolot??ja	2021-11-02 11:05:32	2021-11-02 11:05:32
2309	6	P??rvaldes Sekret??rs	2021-11-02 11:05:32	2021-11-02 11:05:32
2310	6	ir uzst??jusies ar refer??tu	2021-11-02 11:05:32	2021-11-02 11:05:32
2311	6	 izgl??t??bas zin??t??u ma??istra gr??ds	2021-11-02 11:05:32	2021-11-02 11:05:32
2312	6	b??vin??eniera	2021-11-02 11:05:32	2021-11-02 11:05:32
2313	6	B??vin??enieris	2021-11-02 11:05:32	2021-11-02 11:05:32
2314	6	in??enierzin??t??u bakalaura gr??ds b??vniec??b??	2021-11-02 11:05:32	2021-11-02 11:05:32
2315	6	  matem??tikas un fizikas vidusskolas  skolot??ja	2021-11-02 11:05:32	2021-11-02 11:05:32
2316	6	In??enieris-Meh??ni??is	2021-11-02 11:05:32	2021-11-02 11:05:32
2317	6	profesion??l??s izgl??tibas skolot??js un pedagogs	2021-11-02 11:05:32	2021-11-02 11:05:32
2318	6	elektrot??klu in??enieris	2021-11-02 11:05:32	2021-11-02 11:05:32
2319	6	Arodskolot??ju  pamata  pedago??isk??s  izgl??t??ba	2021-11-02 11:05:32	2021-11-02 11:05:32
2320	6	 pamatskolas skolot??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2321	6	ir ieguvusi ties??bas ??stenot pedago??isko procesu darb?? ar 6-gad??giem	2021-11-02 11:05:32	2021-11-02 11:05:32
2322	6	pedago??ijas bakalaurs sporta zin??tn??	2021-11-02 11:05:32	2021-11-02 11:05:32
2323	6	Diplom??ts agronoms	2021-11-02 11:05:32	2021-11-02 11:05:32
2324	6	Lauksaimniec??bas zin??t??u bakalaura gr??ds	2021-11-02 11:05:32	2021-11-02 11:05:32
2325	6	Pedagogs,  Pedago??ijas ma??istra gr??ds	2021-11-02 11:05:32	2021-11-02 11:05:32
2326	6	latvie??u vlaodas un literat??ras skolot??ja	2021-11-02 11:05:32	2021-11-02 11:05:32
2327	6	Latvie??u Val. Un Lit. Skolot??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2328	6	Bibliogr??fs. Bibliotek??rs	2021-11-02 11:05:32	2021-11-02 11:05:32
2329	6	Arodskolot??ja pamata pedago??.izgl??tibas programma	2021-11-02 11:05:32	2021-11-02 11:05:32
2330	6	Slie??u ce??u in??enieris- celtnieks	2021-11-02 11:05:32	2021-11-02 11:05:32
2331	6	Filaloga, lavie??u val. un literat??ras pasniedz??ja	2021-11-02 11:05:32	2021-11-02 11:05:32
2332	6	 Latvie??u valodas un literat??ras skolot??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2333	6	pedagogu karjeras konsultants 	2021-11-02 11:05:32	2021-11-02 11:05:32
2334	6	matem??tikas ma??istra gr??ds 	2021-11-02 11:05:32	2021-11-02 11:05:32
2335	6	"Ang??u Valoda Ar Priek??zin????an??m" 	2021-11-02 11:05:32	2021-11-02 11:05:32
2336	6	 Ang??u valoda ( ar priek??zin????an??m) -A2 - B1 l??menis	2021-11-02 11:05:32	2021-11-02 11:05:32
2337	6	Filologs	2021-11-02 11:05:32	2021-11-02 11:05:32
2338	6	treninga metodes	2021-11-02 11:05:32	2021-11-02 11:05:32
2339	6	ieguva soci??lo zin??t??u bakalaura gr??du psiholo??ij??	2021-11-02 11:05:32	2021-11-02 11:05:32
2340	6	skolas un ??imenes psihologs	2021-11-02 11:05:32	2021-11-02 11:05:32
2341	6	skolot??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2342	6	M??ksliniecisk??s Apdares Gr??mats??j??js	2021-11-02 11:05:32	2021-11-02 11:05:32
2343	6	Dizains, funkcion??lais dizains	2021-11-02 11:05:32	2021-11-02 11:05:32
2344	6	in??enierzin??t??u ma??istra gr??ds autom??tik??, datortehnik?? un t??klos	2021-11-02 11:05:32	2021-11-02 11:05:32
2345	6	in??eniera ??imi??a	2021-11-02 11:05:32	2021-11-02 11:05:32
2346	6	par apm??c??bu darbam ar Galvaniz??cijas iek??rta, modelis 3001 D/Balco	2021-11-02 11:05:32	2021-11-02 11:05:32
2347	6	Inform??tikas Skolot??js Vidusskol??	2021-11-02 11:05:32	2021-11-02 11:05:32
2348	6	Eiropas datorprasmes eksperta l??me??a sertifik??ts- ir sekm??gi nok??rtojusi visus eks??menus, kas ir nepiecie??ami Eiropas datorprasmes l??me??a sertifik??ta pie????ir??anai	2021-11-02 11:05:32	2021-11-02 11:05:32
2349	6	Eiropas datorprasmes sertifik??ts -ir sekm??gi nok??rtojusi visus septi??us Eiropas datorprasmes sertifik??ta ieg????anai nepiecie??amos eks??menus	2021-11-02 11:05:32	2021-11-02 11:05:32
2350	6	Matem??ti??is	2021-11-02 11:05:32	2021-11-02 11:05:32
2351	6	profesion??lo ma??istra gr??du datorsist??m??s un sist??mu anal??yti??a kvalifik??cija	2021-11-02 11:05:32	2021-11-02 11:05:32
2352	6	Sabiedr??ba un cilv??ka dro????ba	2021-11-02 11:05:32	2021-11-02 11:05:32
2353	6	Ir ieguvusi ties??bas veikt pedago??isko darb??bu (B)	2021-11-02 11:05:33	2021-11-02 11:05:33
2354	6	 Soci??lo zin??t??u bakalaura gr??ds ekonomik??	2021-11-02 11:05:33	2021-11-02 11:05:33
2355	6	 fizikas un matem??tikas skolot??ja	2021-11-02 11:05:33	2021-11-02 11:05:33
2356	6	ir ieguvusi profesion??lo ma??istra gr??du izgl??t??bas vad??b??	2021-11-02 11:05:33	2021-11-02 11:05:33
2357	6	Ekonomikas un uz????m??jdarb??bas skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2358	6	m??zikas skolot??ja	2021-11-02 11:05:33	2021-11-02 11:05:33
2359	6	Ir ieguvusi ties??bas str??d??t inere??u izgl??t??b??	2021-11-02 11:05:33	2021-11-02 11:05:33
2360	6	speci??lo priek??metu un darbm??c??bas un ras????anas skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2361	6	 Vizu??l??s m??kslas skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2362	6	 Pie????irts ??r??tata Metodi??a Statuss A programma	2021-11-02 11:05:33	2021-11-02 11:05:33
2363	6	Karjeras konsultants	2021-11-02 11:05:33	2021-11-02 11:05:33
2364	6	Izgl??t??bas darba vad??t??ja un latvie??u valodas un literat??ras skolot??ja pamatskol??	2021-11-02 11:05:33	2021-11-02 11:05:33
2365	6	pedagoga karjeras knsultants	2021-11-02 11:05:33	2021-11-02 11:05:33
2366	6	vidusskolas atvie??u valodas un literat??ras skolot??ja	2021-11-02 11:05:33	2021-11-02 11:05:33
2367	6	ieguvusi Izgl??t??bas satura un eksamin??cijas centra ??r??tata metodi??a statusu par piedal????anos latvie??u valodas centraliz??t?? eks??mena v??rt????an??	2021-11-02 11:05:33	2021-11-02 11:05:33
2368	6	V??stures Skolot??js, Soci??lo Zin??bu Skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2369	6	Civil??s aizsardz??ba	2021-11-02 11:05:33	2021-11-02 11:05:33
2370	6	v??sturnieks, v??stures pasniedz??ja	2021-11-02 11:05:33	2021-11-02 11:05:33
2371	6	v??stures ma??istra gr??ds	2021-11-02 11:05:33	2021-11-02 11:05:33
2372	6	Vid??j??s izgl??t??bas ang??u valodas skiolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2373	6	Ieg??t?? kvalifik??cija atbilst piektajam profesion??l??s kvalifik??cijas l??menim	2021-11-02 11:05:33	2021-11-02 11:05:33
2374	6	ieg??ta kvalifik??cija atbilst piektajam profesion??l??s izgl??t??bas l??menim, Tehnisk?? tulka referente	2021-11-02 11:05:33	2021-11-02 11:05:33
2375	6	humanit??ro zin????u ma??istra gr??ds filolo??ij??	2021-11-02 11:05:33	2021-11-02 11:05:33
2376	6	Vid??j??s Izgl??t??bas Inform??tikas Skolot??ja Kvalifik??cija	2021-11-02 11:05:33	2021-11-02 11:05:33
2377	6	Vidusskolas V??cu Valodas Skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2378	6	S??kumskolas Skolot??js, Pamatskolas V??cu Valodas Skolot??ja  Kvalifik??cija, 5. l??me??a profesion??l?? kvalifik??cija, profesion??lais ma??istra grads	2021-11-02 11:05:33	2021-11-02 11:05:33
2379	6	 Pedago??ijas bakalaura gr??ds	2021-11-02 11:05:33	2021-11-02 11:05:33
2380	6	Ieguva ties??bas pasniegt visp??r??j?? un profesion??l?? izgl??t??b?? m??c??bu priek??metus jom?? "Sabiedr??ba un cilv??ka dro????ba"	2021-11-02 11:05:33	2021-11-02 11:05:33
2381	6	Eiropas Datorprasmes (Ecdl) Sertifik??ts	2021-11-02 11:05:33	2021-11-02 11:05:33
2382	6	dabaszin??t??u ma??istra gr??ds matem??tik??	2021-11-02 11:05:33	2021-11-02 11:05:33
2383	6	 vidusskolas matem??tikas skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2384	6	ir ties??ga str??d??t speci??l??s izgl??t??bas programm??s, programmas nosaaukums "Kompeten??u pieej?? balst??ts izgl??t??bas process, ??stenojot speci??l??s izgl??t??bas programmas"	2021-11-02 11:05:33	2021-11-02 11:05:33
2385	6	Profesion??lais  ma??istra gr??ds psiholo??ij??	2021-11-02 11:05:33	2021-11-02 11:05:33
2386	6	 Soci??lo zin??t??u bakalaura gr??ds psiholo??ij??	2021-11-02 11:05:33	2021-11-02 11:05:33
2387	6	ir ieguvusi ties??bas patst??v??gi veikt psihologa peofesion??lo darb??bu izgl??t??bas un skolu psiholo??ijas jom??	2021-11-02 11:05:33	2021-11-02 11:05:33
2388	6	 B??rnu emocion??l?? audzin????anan	2021-11-02 11:05:33	2021-11-02 11:05:33
2389	6	Fizisk??s Audzin????anas Pasniedz??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2390	6	"B" Kategorijas Sporta Speci??lists ar ties??b??m str??d??t sporta jom?? par treneri futbol??	2021-11-02 11:05:33	2021-11-02 11:05:33
2391	6	 Ieguva ties??bas ??stenot programmu Speci??l?? izgl??t??ba (izgl??tojamiem  ar m??c????an??s trauc??jumiem un valodas trauc??jumiem)	2021-11-02 11:05:33	2021-11-02 11:05:33
2392	6	Biznesa vad??bas ma??istra gr??ds	2021-11-02 11:05:33	2021-11-02 11:05:33
2393	6	in??enierekonomists	2021-11-02 11:05:33	2021-11-02 11:05:33
2394	6	Speci??lists organiz??ciju dro????b??	2021-11-02 11:05:33	2021-11-02 11:05:33
2395	6	Koka izstr??d??jumu ra??o??anas tehni??is	2021-11-02 11:05:33	2021-11-02 11:05:33
2396	6	ra??o??anas tehni??is	2021-11-02 11:05:33	2021-11-02 11:05:33
2397	6	apguvusi pedago??isk??s zin????anas un pamatprasmes atbilsto??i profesion??l??s izgl??t??bas pedagogu pedago??isk??s pamatizgl??t??bas programmas saturam	2021-11-02 11:05:33	2021-11-02 11:05:33
2398	6	8 st.semin??rs lietved??b??	2021-11-02 11:05:33	2021-11-02 11:05:33
2399	6	Humanit??ro zin??t??u  ma??istra gr??ds filolo??ij??	2021-11-02 11:05:33	2021-11-02 11:05:33
2400	6	humanit??ro zin????u bakalaura gr??ds filolo??ij??	2021-11-02 11:05:33	2021-11-02 11:05:33
2401	6	matem??tikas un fizikas skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2402	6	ECDL Padzi??in??t?? L??me??a Sertifik??ts	2021-11-02 11:05:33	2021-11-02 11:05:33
2403	6	ECDL Eksperta L??me??a Sertifik??ts (Ecdl Advanced)	2021-11-02 11:05:33	2021-11-02 11:05:33
2404	6	Ecdl Padzi??in??ta L??me??a Sertifik??ts M??c??bu Programma V1.0	2021-11-02 11:05:33	2021-11-02 11:05:33
2405	6	elektromontieris	2021-11-02 11:05:33	2021-11-02 11:05:33
2406	6	Ieguvusi izgl??t??bas zin??t??u ma??istra gr??du pedago??ij??	2021-11-02 11:05:33	2021-11-02 11:05:33
2407	6	Matem??tikas Skolot??js Vidusskol??s	2021-11-02 11:05:33	2021-11-02 11:05:33
2408	6	Soci??lo zin??t??u ma??istra gr??ds ekonomik??	2021-11-02 11:05:33	2021-11-02 11:05:33
2409	6	Soci??lo zin??t??u bakalaura gr??ds ekonomik??	2021-11-02 11:05:33	2021-11-02 11:05:33
2410	6	ir ieguvusi ties??bas m??c??t profesion??l??s izgl??t??bas, profesion??l??s ievirzes izgl??t??bas un intere??u izgl??t??bas programm??s	2021-11-02 11:05:33	2021-11-02 11:05:33
2411	6	komercdarb??bas speci??lists	2021-11-02 11:05:33	2021-11-02 11:05:33
2412	6	vid??j??s izgl??t??bas inform??tikas un programm????anas pamatu skolot??ja	2021-11-02 11:05:33	2021-11-02 11:05:33
2413	6	S??kumskolas Skolot??js, Inform??tikas Skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2414	6	ir ties??ga str??d??t speci??l??s izgl??t??bas programm??s	2021-11-02 11:05:33	2021-11-02 11:05:33
2415	6	Skolu port??la inform??cijas sist??mas 2.k??rta- skolu administratoru apm??c??ba	2021-11-02 11:05:33	2021-11-02 11:05:33
2416	6	????mijas pasniedz??ja	2021-11-02 11:05:33	2021-11-02 11:05:33
2417	6	Docenta Akad??miskais Nosaukums	2021-11-02 11:05:33	2021-11-02 11:05:33
2418	6	kora diri??enta un kora priek??metu pedagogs	2021-11-02 11:05:33	2021-11-02 11:05:33
2419	6	Pedagogs, Komponists	2021-11-02 11:05:33	2021-11-02 11:05:33
2420	6	Kameransamb??a m??kslinieks, koncertmeistars, pasniedz??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2421	6	in??enierzin??t??u bakalaura gr??ds meh??nik??	2021-11-02 11:05:33	2021-11-02 11:05:33
2422	6	ir ieguvusi izgl??t??bas satura un eksamin??cijas centra ??r??tata metodi??a statusu par piedal????anoas ang??u valodas  centraliz??t?? eks??maen av??rt????an?? 	2021-11-02 11:05:33	2021-11-02 11:05:33
2423	6	volejbola vec??k?? trenere un sporta skolot??ja	2021-11-02 11:05:33	2021-11-02 11:05:33
2424	6	profesion??l??s izgl??t??bas skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2425	6	In??enieris programm??t??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2426	6	transporta l??dzek??u kr??sot??js amata meistars	2021-11-02 11:05:33	2021-11-02 11:05:33
2427	6	m??kslinieciskais noform??t??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2428	6	Ziedu Dizaina Skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2429	6	Pasniedz??js, ????mi??is	2021-11-02 11:05:33	2021-11-02 11:05:33
2430	6	Uz????muma un iest????u vad??t??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2431	6	profesion??lais ma??istra gr??ds dzelzce??a elektrosist??m??s	2021-11-02 11:05:33	2021-11-02 11:05:33
2432	6	Satiksmes Ce??u In??enieris - elektri??is	2021-11-02 11:05:33	2021-11-02 11:05:33
2433	6	fizisk??s audzin????anas skolot??js un kinezioterapeits	2021-11-02 11:05:33	2021-11-02 11:05:33
2434	6	 soci??lo zin??t??u ma??istra gr??ds ekonomik??	2021-11-02 11:05:33	2021-11-02 11:05:33
2435	6	Fizi??is	2021-11-02 11:05:33	2021-11-02 11:05:33
2436	6	uz????muma mened??eris	2021-11-02 11:05:33	2021-11-02 11:05:33
2437	6	sporta skolot??ja, basketbola vec??k?? trenera	2021-11-02 11:05:33	2021-11-02 11:05:33
2438	6	Uz????muma un iest????u vad??t??ja un uz????m??jdarb??ba	2021-11-02 11:05:33	2021-11-02 11:05:33
2439	6	Izgl??t??bas  zin??t??u ma??istra gr??ds pedago??ij??	2021-11-02 11:05:33	2021-11-02 11:05:33
2440	6	Vidusskolas Ang??u Valodas Skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2441	6	profesion??lais bakalaura gr??ds uz????m??jdarb??b?? un ekonomik??	2021-11-02 11:05:33	2021-11-02 11:05:33
2442	6	autoservisa speci??lists, atbilst 4.profesion??l??s kvalifik??cijas l??menim	2021-11-02 11:05:33	2021-11-02 11:05:33
2443	6	elektronikas tehni??is	2021-11-02 11:05:33	2021-11-02 11:05:33
2444	6	In??eniera-matem??ti??a	2021-11-02 11:05:33	2021-11-02 11:05:33
2445	6	Gr??mats??j??ja Amata meistars	2021-11-02 11:05:33	2021-11-02 11:05:33
2446	6	Tehni??is-tehnologs	2021-11-02 11:05:33	2021-11-02 11:05:33
2447	6	Dai??amatniece ??das Plastik??	2021-11-02 11:05:33	2021-11-02 11:05:33
2448	6	Ieguvis izgl??t??bas zin??t??u ma??istra gr??du pedago??ij??	2021-11-02 11:05:33	2021-11-02 11:05:33
2449	6	Krievu Val. Un Lit. Skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2450	6	biolo??ijas un fizikas skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2451	6	 Vidusskolas  inform??tikas skolot??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2452	6	"Ang??u Valodas Skolot??js"	2021-11-02 11:05:33	2021-11-02 11:05:33
2453	6	profesion??l??s izgl??t??bas skolot??ja, profesion??l??s izgl??t??bas pedagogs	2021-11-02 11:05:33	2021-11-02 11:05:33
2454	6	neredz??go un v??jredz??go skolas skolot??ja	2021-11-02 11:05:33	2021-11-02 11:05:33
2455	6	izgl??t??bas darba vad??t??ja	2021-11-02 11:05:33	2021-11-02 11:05:33
2456	6	Pedago??ijas ma??istra gr??ds skolvad??bas nozar??	2021-11-02 11:05:33	2021-11-02 11:05:33
2457	6	Tehni??is-Bi??kopis	2021-11-02 11:05:33	2021-11-02 11:05:33
2458	6	soci??lo zin??t??u ma??istrs ekonomik??	2021-11-02 11:05:33	2021-11-02 11:05:33
2459	6	Filolo??ijas bakalaura gr??ds krievu filolo??ij??	2021-11-02 11:05:33	2021-11-02 11:05:33
2460	6	vidusskolas  krievu valodas un literat??ras skolot??ja	2021-11-02 11:05:33	2021-11-02 11:05:33
2461	6	profesion??lais ma??istra gr??ds izgl??t??bas vad??b??	2021-11-02 11:05:33	2021-11-02 11:05:33
2462	6	fizikas un inform??tikas skolot??ja	2021-11-02 11:05:33	2021-11-02 11:05:33
2463	6	Pieaugu??o izgl??t??ba	2021-11-02 11:05:33	2021-11-02 11:05:33
2464	6	Folologa,krievu valodas un literat??ras pasniedz??js	2021-11-02 11:05:33	2021-11-02 11:05:33
2465	6	Civil?? aizsardz??ba	2021-11-02 11:05:34	2021-11-02 11:05:34
2466	6	vizu??l??s m??kslasskolot??js un inform??tikas un programm????anas skolot??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2467	6	Transporta Lokomot??vju Tehni??is	2021-11-02 11:05:34	2021-11-02 11:05:34
2468	6	Par apm??c??bu darbam ar Elektrol??zes iek??rta ar l??dzstr??vas taisngriezni un graf??ta elektrodiem	2021-11-02 11:05:34	2021-11-02 11:05:34
2469	6	Filologs , krievu valodas un literat??ras pasniedz??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2470	6	Pedago??isk??s specializ??cijas sertifik??ts.	2021-11-02 11:05:34	2021-11-02 11:05:34
2471	6	Krievu Val. Un Lit. Skolot??js Vidusskol??s	2021-11-02 11:05:34	2021-11-02 11:05:34
2472	6	Vidusskolas fizik??l??s audzin????anas, anatomijas un fiziolo??ijas skolot??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2473	6	Gr??matvedis ar specializ??ciju finans??s	2021-11-02 11:05:34	2021-11-02 11:05:34
2474	6	 Ieguva ties??bas ??stenot programmu Speci??l?? izgl??t??ba (izgl??tojamiem  ar m??c????an??s trauc??jumiem un gar??g??s att??st??bas trauc??jumiem)	2021-11-02 11:05:34	2021-11-02 11:05:34
2475	6	uz????mumu un iest????u vad??t??ja 	2021-11-02 11:05:34	2021-11-02 11:05:34
2476	6	 Ekonomists	2021-11-02 11:05:34	2021-11-02 11:05:34
2477	6	profesion??lais ma??istra gr??ds ekonomik??	2021-11-02 11:05:34	2021-11-02 11:05:34
2478	6	ir apguvis ties??bas veikt profesion??l??s izgl??t??bas skolot??ja un intere??u izgl??t??bas skolot??ja amatu	2021-11-02 11:05:34	2021-11-02 11:05:34
2479	6	Biologs, biolo??ijas un ????mijas pasniedz??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2480	6	Meistarklase "K?? m??cc??ties par me??u""	2021-11-02 11:05:34	2021-11-02 11:05:34
2481	6	ieguvusi ties??bas m??c??t vesel??bas m??c??bu visp??r??j??s vid??j??s izgl??t??bas pak??p??	2021-11-02 11:05:34	2021-11-02 11:05:34
2482	6	ir ieguvusi ties??bas m??c??t soci??lo zin??bas pamatizgl??t??bas pak??p??	2021-11-02 11:05:34	2021-11-02 11:05:34
2483	6	Profesion??l??s meistar??bas pilnveide soci??lo zin??bu skolot??jiem izgl??t??bas satura ??steno??anai pamatizgl??t??b?? (B2)	2021-11-02 11:05:34	2021-11-02 11:05:34
2484	6	Profesion??l??s meistar??bas pilnveide 5.-9. kla??u soci??lo zin??bu skolot??jiem izgl??t??bas satura ??steno??anai pamatizgl??t??b?? (??tikas komponente)	2021-11-02 11:05:34	2021-11-02 11:05:34
2485	6	Profesion??l??s meistar??bas pilnveide 5.-9. kla??u soci??lo zin??bu skolot??jiem izgl??t??bas satura ??steno??anai pamatizgl??t??b?? (ekonomikas komponente)	2021-11-02 11:05:34	2021-11-02 11:05:34
2486	6	Profesion??l??s meistar??bas pilnveide 5.-9.kla??u soci??lo zin??bu skolot??jiem izgl??t??bas satura ??steno??anai pamatizgl??t??b?? 	2021-11-02 11:05:34	2021-11-02 11:05:34
2487	6	ir ieguvusi ties??bas m??c??t vesel??bas m??c??bu visp??r??j??s vid??j??s izgl??t??bas pak??p??	2021-11-02 11:05:34	2021-11-02 11:05:34
2488	6	Uz????muma un iest??des vad??t??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2489	6	Lauksaimniec??bas ener????tikas in??enieris	2021-11-02 11:05:34	2021-11-02 11:05:34
2490	6	Lokomot??vju saimniec??bas tehni??is	2021-11-02 11:05:34	2021-11-02 11:05:34
2491	6	In??enieris	2021-11-02 11:05:34	2021-11-02 11:05:34
2492	6	ir ieguvis  ties??bas veikt profesion??l??s izgl??t??bas skolot??ja un intere??u izgl??t??bas skolot??ja amatu	2021-11-02 11:05:34	2021-11-02 11:05:34
2493	6	Var veikt sauszemes transportl??dzek??u tehnisk??s ekspert??zes	2021-11-02 11:05:34	2021-11-02 11:05:34
2494	6	Ang??u Val. Skolot??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2495	6	Ieguvusi Valsts izgl??t??bas satura centra ??r??tata metodi??a statusu par piedal????anos centraliz??t?? eks??mena v??rt????an?? 	2021-11-02 11:05:34	2021-11-02 11:05:34
2496	6	Viesm??l??bas pakalpojumu speci??lists	2021-11-02 11:05:34	2021-11-02 11:05:34
2497	6	??eogr??fijas un ????mijas skolot??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2498	6	dabaszin??t??u bakalaura gr??ds ????mij?? ar specializ??ciju atjaunojamo resursu ????mija	2021-11-02 11:05:34	2021-11-02 11:05:34
2499	6	vid??j??s izgl??t??bas ang??u valodas un v??cu valodas skolot??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2500	6	Pamatskolas Skolot??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2501	6	Profesion??l??s izgl??t??bas pedagogs	2021-11-02 11:05:34	2021-11-02 11:05:34
2502	6	Matem??ti??is, pasniedz??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2503	6	Vidusskolas latvie??u valodas un literat??ras skoilot??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2504	6	"Valodu Konsultants"	2021-11-02 11:05:34	2021-11-02 11:05:34
2505	6	ang??u valodas pamatskolas skolot??ja	2021-11-02 11:05:34	2021-11-02 11:05:34
2506	6	Profesion??l?? ma??istra gr??ds izgl??t??b?? un vid??j??s izgl??t??bas matem??tikas un inform??tikas skolot??ja kvalifik??cija	2021-11-02 11:05:34	2021-11-02 11:05:34
2507	6	dabaszin??t??u bakalaura grads matem??tik??	2021-11-02 11:05:34	2021-11-02 11:05:34
2508	6	Ieguva ties??bas m??c??t datoriku visp??r??j??s pamatizgl??t??bas pak??p??	2021-11-02 11:05:34	2021-11-02 11:05:34
2509	6	pedagoga kvalifik??cija	2021-11-02 11:05:34	2021-11-02 11:05:34
2510	6	Iespied??ja amata meistars	2021-11-02 11:05:34	2021-11-02 11:05:34
2511	6	augstspieduma iespied??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2512	6	Filalogs, latvie??u valodas un literat??ras pasniedz??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2513	6	datoriek??rtu tehni??is	2021-11-02 11:05:34	2021-11-02 11:05:34
2514	6	profesion??l??s izgl??t??bas skolot??ja un pedagogs 	2021-11-02 11:05:34	2021-11-02 11:05:34
2515	6	3114 16 Telekomunik??ciju in??enieris	2021-11-02 11:05:34	2021-11-02 11:05:34
2516	6	Ma??istra Gr??ds Vides Zin??tn??	2021-11-02 11:05:34	2021-11-02 11:05:34
2517	6	Nodok??u ekonomists, Muitas iest??des strukt??rvien??bas vad??t??js	2021-11-02 11:05:34	2021-11-02 11:05:34
2518	6	E- p??rvald??ba un dokumentu elektronisk?? aprite RTU	2021-11-02 11:05:34	2021-11-02 11:05:34
2519	6	 Latvie??u valodas un literat??ras skolot??js maz??kumtaut??bu skol??	2021-11-02 11:05:34	2021-11-02 11:05:34
2520	6	horeogr??fa kvalifik??cija	2021-11-02 11:05:34	2021-11-02 11:05:34
2521	6	has successfully completed the ECDL Core Certification 	2021-11-02 11:05:34	2021-11-02 11:05:34
2522	6	Datorprasmes inform??tikas priek??meta m??c????anai visp??r??j??s pamatizgl??t??bas pak??p??, inform??tikas skolot??ja visp??r??j??s pamatizgl??t??bas pak??p??	2021-11-02 11:05:34	2021-11-02 11:05:34
2523	6	ma????nburtli??a	2021-11-02 11:05:34	2021-11-02 11:05:34
2524	6	Ieguvusi vizu??l??s m??kslas un m??kslas v??stures skolot??ja kvalifik??ciju	2021-11-02 11:05:34	2021-11-02 11:05:34
2525	6	Biroja administrators	2021-11-02 11:05:34	2021-11-02 11:05:34
2526	6	Gr??matvedis	2021-11-02 11:05:34	2021-11-02 11:05:34
2527	6	namu nekustam?? ??pa??uma p??rvaldnieks	2021-11-02 11:05:34	2021-11-02 11:05:34
2528	6	Agronoms-D??rzkopis	2021-11-02 11:05:34	2021-11-02 11:05:34
2529	6	Sabiedr??bas un cilv??ka dro????ba - saturs un didaktika	2021-11-02 11:05:34	2021-11-02 11:05:34
2530	6	pedago??isk??s darb??bas pamti	2021-11-02 11:05:34	2021-11-02 11:05:34
2531	6	??ku Kr??sot??ja Amata Meistars	2021-11-02 11:05:34	2021-11-02 11:05:34
2532	6	tehni??is - celtnieks	2021-11-02 11:05:34	2021-11-02 11:05:34
2533	6	A Pie????irts ??r??tata Metodi??a Statuss	2021-11-02 11:05:34	2021-11-02 11:05:34
2534	6	Valsts izgl??t??bas satura centra ??r??tata metodi??a statuss par l??dzdal??bu valsts/starptautisko profesion??l??s izgl??t??bas iest????u audz??k??u un pedagogu profesion??l??s meistar??bas konkursu noris??	2021-11-02 11:05:34	2021-11-02 11:05:34
2535	6	energoefektivit??te KNAUF jaunie b??vmateri??li	2021-11-02 11:05:34	2021-11-02 11:05:34
2536	6	"Darba dev??ja apm??c??ba darba aizsardz??bas jaut??jumos"	2021-11-02 11:05:34	2021-11-02 11:05:34
2537	6	Noklaus??j??s un apguva profesion??l?? vadit??ja periodisko apm??ci??bu  kods(95) kursu.	2021-11-02 11:05:34	2021-11-02 11:05:34
2538	6	Humanit??ro zin??t??u bakalaura gr??ds ang??u filolo??ij??	2021-11-02 11:05:34	2021-11-02 11:05:34
2539	6	produktu dizainera	2021-11-02 11:05:34	2021-11-02 11:05:34
2540	6	in??enierzin??t??u ma??istra gr??ds datorsist??m??s	2021-11-02 11:05:34	2021-11-02 11:05:34
2541	6	ir ieguvis ties??bas m??c??t visp??r??j??s vid??j??s izgl??t??bas un profesion??l??s izgl??t??bas programm??s	2021-11-02 11:05:34	2021-11-02 11:05:34
2542	6	vid??j??s izgl??t??bas latvie??u valodas un literat??ras skolot??ja	2021-11-02 11:05:34	2021-11-02 11:05:34
2543	6	bibliotek??rs - bibliogr??fs	2021-11-02 11:05:34	2021-11-02 11:05:34
2544	6	ir ieguvusi ties??bas str??d??t intere??u izgl??t??b??	2021-11-02 11:05:34	2021-11-02 11:05:34
2545	6	Arodskolot??ju  pamata  pedago??isk??s  izgl??t??bas  programma	2021-11-02 11:05:34	2021-11-02 11:05:34
2546	6	tehni??is - ekonomists	2021-11-02 11:05:34	2021-11-02 11:05:34
2547	6	 ir ieguvis ties??bas str??d??t par pedagogu karjeras konsultantu	2021-11-02 11:05:34	2021-11-02 11:05:34
2548	6	ieguvusi ties??bas m??c??t biznesa ekonomiskos pamatus visp??r??j??s vid??j??s izgl??t??bas pak??p??	2021-11-02 11:05:34	2021-11-02 11:05:34
2549	6	Izgl??t??bas zin??tnes un karjeras konsultanta un jaunatnes lietu speci??lists 	2021-11-02 11:05:34	2021-11-02 11:05:34
2550	6	profesion??lais ma??istra gr??ds uz????m??jdarb??bas vad??b??	2021-11-02 11:05:34	2021-11-02 11:05:34
2551	6	Profesion??lais ma??istra gr??ds valsts p??rvald??	2021-11-02 11:05:34	2021-11-02 11:05:34
2552	6	Ir ieg??tas ties??bas m??c??t visp??r??j??s izgl??t??bas programm??s	2021-11-02 11:05:34	2021-11-02 11:05:34
2553	6	B??vgaldnieka amata meistars	2021-11-02 11:05:34	2021-11-02 11:05:34
2554	6	Galdnieks	2021-11-02 11:05:34	2021-11-02 11:05:34
2555	6	Slie??u ce??u saimniec??bas tehni??is	2021-11-02 11:05:35	2021-11-02 11:05:35
2556	6	profesion??lo ma??istra gr??ds soci??laj?? darb??	2021-11-02 11:05:35	2021-11-02 11:05:35
2557	6	v??stures doktora zin??tniskais gr??ds	2021-11-02 11:05:35	2021-11-02 11:05:35
2558	6	v??stures un sabiedr??bas m??c??bas pasniedz??js, v??sturnieks	2021-11-02 11:05:35	2021-11-02 11:05:35
2559	6	Fizioterapeita kvalifik??cija	2021-11-02 11:05:35	2021-11-02 11:05:35
2560	6	projekta vad??t??ja	2021-11-02 11:05:35	2021-11-02 11:05:35
2561	6	Bibliot??ku inform??cijas speci??lista	2021-11-02 11:05:35	2021-11-02 11:05:35
2562	6	poligr??fija un izdev??jdarb??ba ofseta iespied??js	2021-11-02 11:05:35	2021-11-02 11:05:35
2563	6	V??sturnieks, V??stures Un Sabiedr??bas M??c??bas Pasniedz??js	2021-11-02 11:05:35	2021-11-02 11:05:35
2564	6	Lo??istikas speci??lists	2021-11-02 11:05:35	2021-11-02 11:05:35
2565	6	profesion??l??s izgl??t??bas sskolot??js	2021-11-02 11:05:35	2021-11-02 11:05:35
2566	6	Uz??em??jdarb??bas vad??t??js	2021-11-02 11:05:35	2021-11-02 11:05:35
2567	6	skolas deju kolekt??va  vad??t??ja,  s??kumskolas skolot??ja	2021-11-02 11:05:35	2021-11-02 11:05:35
2568	6	pamatizgl??t??bas m??jtur??bas skolot??js	2021-11-02 11:05:35	2021-11-02 11:05:35
2569	6	??r??tata metodi??a pie????ir??ana	2021-11-02 11:05:35	2021-11-02 11:05:35
2570	6	ieguva ties??bas m??c??t m??jsaimniec??bu un m??jtur??bu visp??r??j??s vid??j??s izgl??t??bas pak??p?? 	2021-11-02 11:05:35	2021-11-02 11:05:35
2571	6	ir veiksm??gi nok??rtojis testu par zin????anu p??rbaudi attiec??b?? uz EP un Padomes regulas 2016/679 par fizisko personu aizsardz??bu attiec??b?? uz personas datu apstr??di un 	2021-11-02 11:05:35	2021-11-02 11:05:35
2572	6	Izgl??t??bas zin??t??u bakalaura akad??miskais gr??ds sport??	2021-11-02 11:05:35	2021-11-02 11:05:35
2573	6	Ir ieguvusi ties??bas str??d??t par pedagogu karjeras konsultantu	2021-11-02 11:05:35	2021-11-02 11:05:35
2574	6	Atbalsts pozit??vai uzved??bai	2021-11-02 11:05:35	2021-11-02 11:05:35
2575	6	Psiholo??ijas skolot??ju profesion??lo kompeten??u pilnveide	2021-11-02 11:05:35	2021-11-02 11:05:35
2576	6	Pozit??va un m??sdien??ga pedago??isk?? saskarsme	2021-11-02 11:05:35	2021-11-02 11:05:35
2577	6	Saskarsmes priek??meta skolot??ju kursi	2021-11-02 11:05:35	2021-11-02 11:05:35
2578	6	vidusskolas v??cu valodas skolot??ja	2021-11-02 11:05:35	2021-11-02 11:05:35
2579	6	Filolo??ijas bakalaura gr??ds	2021-11-02 11:05:35	2021-11-02 11:05:35
2580	6	Lieti??????s Ekonomikas Pasniedz??js Vidusskol??s	2021-11-02 11:05:35	2021-11-02 11:05:35
2581	6	Ir apguvis ties??bas veikt pedago??isko darb??bu	2021-11-02 11:05:35	2021-11-02 11:05:35
2582	6	Profesion??lais ma??istra gr??ds vad??bzin??tn??	2021-11-02 11:05:35	2021-11-02 11:05:35
2583	6	Vizu??l??s M??kslas Skolot??js, Darbm??c??bas Skolot??js	2021-11-02 11:05:35	2021-11-02 11:05:35
2584	6	 Pie????irts ??r??tata metodi??a statuss	2021-11-02 11:05:35	2021-11-02 11:05:35
2585	6	tehni??is- tehnologs	2021-11-02 11:05:35	2021-11-02 11:05:35
2586	6	Pedago??isk??s  darb??bas pamati	2021-11-02 11:05:35	2021-11-02 11:05:35
2587	6	In??enierzin??t??u bakalaura gr??ds	2021-11-02 11:05:35	2021-11-02 11:05:35
2588	6	Ir ieguvis ties??bas veikt pedago??isko darb??bu	2021-11-02 11:05:35	2021-11-02 11:05:35
2589	6	Komersants	2021-11-02 11:05:35	2021-11-02 11:05:35
2590	6	Sekret??rs - Lietvedis	2021-11-02 11:05:35	2021-11-02 11:05:35
2591	6	Filolo??ijas ma??istra gr??ds	2021-11-02 11:05:35	2021-11-02 11:05:35
2592	6	Filologa, latvie??u valodas un literat??ras pasniedz??ja	2021-11-02 11:05:35	2021-11-02 11:05:35
2593	6	Vid??j??s izgl??t??bas ang??u valodas skolot??js	2021-11-02 11:05:35	2021-11-02 11:05:35
2594	6	Pamatskolas  Ang??u Valodas Skolot??ja	2021-11-02 11:05:35	2021-11-02 11:05:35
2595	6	Vidusskolas latvie??u valodas un literat??ras skolot??ja	2021-11-02 11:05:35	2021-11-02 11:05:35
2596	6	Digit??l??s prasmes ( person??m ar priek??zin????an??m) att??lin??to m??c??bu nodro??in????anai.	2021-11-02 11:05:35	2021-11-02 11:05:35
2597	6	Fizisk??s audzin????anas un m??jtur??bas skolot??ja	2021-11-02 11:05:35	2021-11-02 11:05:35
2598	6	Kr??????u un kam??nu m??rnieks	2021-11-02 11:05:35	2021-11-02 11:05:35
2599	7	latvie??u valoda un literat??ra	2021-11-02 11:06:19	2021-11-02 11:06:19
2600	7	Gr??matved??ba	2021-11-02 11:06:19	2021-11-02 11:06:19
2601	7	Feld??eris	2021-11-02 11:06:19	2021-11-02 11:06:19
2602	7	Soci??lo zin??t??u ma??istra gr??ds vad??bzin??tn??	2021-11-02 11:06:19	2021-11-02 11:06:19
2603	7	Pedago??isk??s darb??bas pamati	2021-11-02 11:06:19	2021-11-02 11:06:19
2604	7	lauksaimniec??bas mehaniz??cija	2021-11-02 11:06:19	2021-11-02 11:06:19
2605	7	jurista paligs	2021-11-02 11:06:19	2021-11-02 11:06:19
2606	7	Biolo??ijas skolot??ja	2021-11-02 11:06:19	2021-11-02 11:06:19
2607	7	Fizisk?? Kult??ra	2021-11-02 11:06:19	2021-11-02 11:06:19
2608	7	Sabiedrisk??s ??din????anas konditora	2021-11-02 11:06:19	2021-11-02 11:06:19
2609	7	V??sture	2021-11-02 11:06:19	2021-11-02 11:06:19
2610	7	Audzin????ana Pirmsskolas Iest??d??s	2021-11-02 11:06:19	2021-11-02 11:06:19
2611	7	Pedago??ija	2021-11-02 11:06:20	2021-11-02 11:06:20
2612	7	Augstspiediena iespied??ja	2021-11-02 11:06:20	2021-11-02 11:06:20
2613	7	humanit??ro zin??t??u bakalaurs v??stur??	2021-11-02 11:06:20	2021-11-02 11:06:20
2614	7	Sporta Pedago??ija	2021-11-02 11:06:20	2021-11-02 11:06:20
2615	7	uz????m??jdarb??ba	2021-11-02 11:06:20	2021-11-02 11:06:20
2616	7	fizisk??s  kult??ras un sporta pasniedz??js	2021-11-02 11:06:20	2021-11-02 11:06:20
2617	7	Boksa treneris	2021-11-02 11:06:20	2021-11-02 11:06:20
2618	7	Vad??bzin??tne	2021-11-02 11:06:20	2021-11-02 11:06:20
2619	7	datorzin??tnes	2021-11-02 11:06:20	2021-11-02 11:06:20
2620	7	Fizika	2021-11-02 11:06:20	2021-11-02 11:06:20
2621	7	in??enierzin??t??u doktora zin??tniskais gr??ds	2021-11-02 11:06:20	2021-11-02 11:06:20
2622	7	In??enierzin??t??u ma??istra gr??ds ener????tik?? un elektrotehnik??	2021-11-02 11:06:20	2021-11-02 11:06:20
2623	7	In??eniera kvalifik??cija ener????tik?? un elektrotehnik??	2021-11-02 11:06:20	2021-11-02 11:06:20
2624	7	Biolo??ija	2021-11-02 11:06:20	2021-11-02 11:06:20
2625	7	muitas un nodok??u administr????ana	2021-11-02 11:06:20	2021-11-02 11:06:20
2626	7	Muitas eksperts	2021-11-02 11:06:20	2021-11-02 11:06:20
2627	7	Biroja darba organizators	2021-11-02 11:06:20	2021-11-02 11:06:20
2628	7	elektrozin??tne	2021-11-02 11:06:20	2021-11-02 11:06:20
2629	7	matem??tika	2021-11-02 11:06:20	2021-11-02 11:06:20
2630	7	In??enierzin??t??u ma??istra gr??ds ????mij??	2021-11-02 11:06:20	2021-11-02 11:06:20
2631	7	Dabaszin??t??u bakalaura gr??ds ????mij??	2021-11-02 11:06:20	2021-11-02 11:06:20
2632	7	 izgl??t??bas zin??t??u ma??istra gr??ds pedago??ij??	2021-11-02 11:06:20	2021-11-02 11:06:20
2633	7	ekonomists uz????m??jdarb??bas tiesiskaj?? nodro??in??jum??	2021-11-02 11:06:20	2021-11-02 11:06:20
2634	7	ties??bu zin??bas	2021-11-02 11:06:20	2021-11-02 11:06:20
2635	7	 V??stures	2021-11-02 11:06:20	2021-11-02 11:06:20
2636	7	Krievu Valoda Un Literat??ra Un Latvie??u Valoda	2021-11-02 11:06:20	2021-11-02 11:06:20
2637	7	Skolot??js	2021-11-02 11:06:20	2021-11-02 11:06:20
2638	7	Arodpedagogs	2021-11-02 11:06:20	2021-11-02 11:06:20
2639	7	iespieddarbu salic??ja	2021-11-02 11:06:20	2021-11-02 11:06:20
2640	7	augst??s iespie??anas tehnolo??ijas	2021-11-02 11:06:20	2021-11-02 11:06:20
2641	7	Uz????m??jdarb??ba un vad????ana	2021-11-02 11:06:20	2021-11-02 11:06:20
2642	7	Profesion??lais  bakalaura gr??gs izgl??t??b?? 	2021-11-02 11:06:20	2021-11-02 11:06:20
2643	7	Inform??tikas un programm????anas skolot??js un m??jsaimniec??bas, m??jtur??bas un tehnolo??iju skolot??js	2021-11-02 11:06:20	2021-11-02 11:06:20
2644	7	D??ze??lokomot??vju Un Lokomot??vju Saimniec??ba	2021-11-02 11:06:20	2021-11-02 11:06:20
2645	7	d??ze??lokomot??vju un tvaika lokomot??vju ma????nista pal??gs	2021-11-02 11:06:20	2021-11-02 11:06:20
2646	7	Profesion??las izgl??t??bas skolot??js 	2021-11-02 11:06:20	2021-11-02 11:06:20
2647	7	in??enierzin??t??u ma??istra gr??ds lieti??????s datorzin??tn??s	2021-11-02 11:06:20	2021-11-02 11:06:20
2648	7	Datoru zin??tne	2021-11-02 11:06:20	2021-11-02 11:06:20
2649	7	Vid??j??s izgl??t??bas ang??u valodas skolot??ja	2021-11-02 11:06:20	2021-11-02 11:06:20
2650	7	filologs, ang??u valodas pasniedz??js	2021-11-02 11:06:20	2021-11-02 11:06:20
2651	7	Darba aizsardz??bas vec??kais speci??lists	2021-11-02 11:06:20	2021-11-02 11:06:20
2652	7	 pedago??ija	2021-11-02 11:06:20	2021-11-02 11:06:20
2653	7	vieglatl??tikas treneris	2021-11-02 11:06:20	2021-11-02 11:06:20
2654	7	Profesion??lais ma??istra gr??ds vad??bzin??tn??s	2021-11-02 11:06:20	2021-11-02 11:06:20
2655	7	2.L??me??a Profesion??l??s Izgl??t.Studiju Programma	2021-11-02 11:06:20	2021-11-02 11:06:20
2656	7	Krievu Valoda Un Literat??ra	2021-11-02 11:06:20	2021-11-02 11:06:20
2657	7	profesion??lais ma??istra gr??ds soci??laj?? darb??	2021-11-02 11:06:20	2021-11-02 11:06:20
2658	7	 Latvie??u valoda un literat??ra	2021-11-02 11:06:20	2021-11-02 11:06:20
2659	7	Bibliot??kzin??tne un bibliogr??fija	2021-11-02 11:06:20	2021-11-02 11:06:20
2660	7	Soci??lo zin??t??u Bakalaura gr??ds vad??bzin??tn??	2021-11-02 11:06:20	2021-11-02 11:06:20
2661	7	karjeras konsultants	2021-11-02 11:06:20	2021-11-02 11:06:20
2662	7	Profesion??lais ma??istra gr??ds  muitas  un nodok??u administr????ana	2021-11-02 11:06:20	2021-11-02 11:06:20
2663	7	??imija	2021-11-02 11:06:20	2021-11-02 11:06:20
2664	7	????mijas zin??t??u doktors	2021-11-02 11:06:20	2021-11-02 11:06:20
2665	7	profesion??lais ma??istra gr??ds transportsist??mu in??enierij??	2021-11-02 11:06:20	2021-11-02 11:06:20
2666	7	transportsist??mu in??enieris	2021-11-02 11:06:20	2021-11-02 11:06:20
2667	7	dabas zin??t??u ma??istra gr??ds matem??tik??	2021-11-02 11:06:20	2021-11-02 11:06:20
2668	7	Izgl??t??bas un  sporta darba speci??lists	2021-11-02 11:06:20	2021-11-02 11:06:20
2669	7	pedago??ijas bakalaura gr??ds sport??	2021-11-02 11:06:20	2021-11-02 11:06:20
2670	7	Humanit??r??s zin??t??u ma??istra gr??ds filolo??ij??	2021-11-02 11:06:20	2021-11-02 11:06:20
2671	7	soci??lo zin??t??u bakalura gr??ds bibliotek??rzin??tne un inform??cij??	2021-11-02 11:06:20	2021-11-02 11:06:20
2672	7	Bibliotek??rs	2021-11-02 11:06:20	2021-11-02 11:06:20
2673	7	Krievu valoda un literat??ra latvie??u skol??s	2021-11-02 11:06:20	2021-11-02 11:06:20
2674	7	arodpedago??ija	2021-11-02 11:06:20	2021-11-02 11:06:20
2675	7	Ma????nburtlicis	2021-11-02 11:06:20	2021-11-02 11:06:20
2676	7	in??enierzin??t??u ma??istra gr??ds in??enierpedago??ij??	2021-11-02 11:06:20	2021-11-02 11:06:20
2677	7	Dzelzce??a p??rvad??jumu procesu vad??ba	2021-11-02 11:06:20	2021-11-02 11:06:20
2678	7	Dzelzce??a ekspluat??cija	2021-11-02 11:06:20	2021-11-02 11:06:20
2679	7	Profesion??lais ma??istra gr??ds skolas pedago??ij??	2021-11-02 11:06:20	2021-11-02 11:06:20
2680	7	profesion??lais bakalaura gr??ds dabaszin??tn??s un inform??cijas tehnolo??ij?? un vid??j??s izgl??t??bas matem??tikas skolot??ja	2021-11-02 11:06:20	2021-11-02 11:06:20
2681	7	p??rvaldes sekret??rs	2021-11-02 11:06:20	2021-11-02 11:06:20
2682	7	B??vin??enieris	2021-11-02 11:06:20	2021-11-02 11:06:20
2683	7	b??vniec??ba un rekonstrtikcija	2021-11-02 11:06:20	2021-11-02 11:06:20
2684	7	matem??tika un fizika	2021-11-02 11:06:20	2021-11-02 11:06:20
2685	7	ma????nb??ves tehnolo??ijas, met??lgrie??anas , darbagaldu un instrumentu	2021-11-02 11:06:20	2021-11-02 11:06:20
2686	7	elektrot??kli	2021-11-02 11:06:20	2021-11-02 11:06:20
2687	7	Pamatskolas pedago??ijas un metodika	2021-11-02 11:06:20	2021-11-02 11:06:20
2688	7	pedago??ijas bakalaurs sporta zin??tn??	2021-11-02 11:06:20	2021-11-02 11:06:20
2689	7	pedago??ijas  ma??istrs	2021-11-02 11:06:20	2021-11-02 11:06:20
2690	7	Agronoms	2021-11-02 11:06:20	2021-11-02 11:06:20
2691	7	Lauksaimniec??bas zin??t??u bakalaura gr??ds	2021-11-02 11:06:20	2021-11-02 11:06:20
2692	7	Sporta zin??tne	2021-11-02 11:06:20	2021-11-02 11:06:20
2693	7	??urnalistika	2021-11-02 11:06:20	2021-11-02 11:06:20
2694	7	Latvie??u valodas un literat??ras un audzin????anas darba metodika	2021-11-02 11:06:20	2021-11-02 11:06:20
2695	7	Latvie??u Val. Un Lit., Pedago??ijas bakalaura gr??ds 	2021-11-02 11:06:20	2021-11-02 11:06:20
2696	7	Bibliogr??fija	2021-11-02 11:06:20	2021-11-02 11:06:20
2697	7	Slie??u ce??u in??enieris- celtnieks	2021-11-02 11:06:20	2021-11-02 11:06:20
2698	7	Transports, dzelzce??a transports	2021-11-02 11:06:20	2021-11-02 11:06:20
2699	7	Filaloga, lavie??u val. un literat??ras pasniedz??ja	2021-11-02 11:06:20	2021-11-02 11:06:20
2700	7	matem??tikas ma??istra gr??ds 	2021-11-02 11:06:20	2021-11-02 11:06:20
2701	7	metem??tika	2021-11-02 11:06:20	2021-11-02 11:06:20
2702	7	Humanit??ro zin??tnu bakalaura gr??ds filolo??ij??	2021-11-02 11:06:20	2021-11-02 11:06:20
2703	7	treninga metodes	2021-11-02 11:06:20	2021-11-02 11:06:20
2704	7	ieguva soci??lo zin??t??u bakalaura gr??du psiholo??ij??	2021-11-02 11:06:20	2021-11-02 11:06:20
2705	7	skolas un ??imenes psihologs	2021-11-02 11:06:20	2021-11-02 11:06:20
2706	7	Arodamata apm??c??bas meistaru un speci??lo priek??metu skolot??ja	2021-11-02 11:06:20	2021-11-02 11:06:20
2707	7	M??ksliniecisk??s Apdares Gr??mats??j??js	2021-11-02 11:06:20	2021-11-02 11:06:20
2708	7	humanit??ro zin??tnu ma??istra gr??ds m??ksl??	2021-11-02 11:06:20	2021-11-02 11:06:20
2709	7	Poligr??fijas ra??o??anas tehnolo??ijas	2021-11-02 11:06:20	2021-11-02 11:06:20
2710	7	Poligr??fija un izdev??jdarb??ba	2021-11-02 11:06:20	2021-11-02 11:06:20
2711	7	Inform??tika	2021-11-02 11:06:20	2021-11-02 11:06:20
2712	7	Lieti?????? Matem??tika	2021-11-02 11:06:20	2021-11-02 11:06:20
2713	7	In??enieris - Meh??ni??is	2021-11-02 11:06:20	2021-11-02 11:06:20
2714	7	datorsist??mas un sist??mu anal??ti??is	2021-11-02 11:06:20	2021-11-02 11:06:20
2715	7	Ekonomika	2021-11-02 11:06:20	2021-11-02 11:06:20
2716	7	Autotransports	2021-11-02 11:06:20	2021-11-02 11:06:20
2717	7	fizika  un matem??tika	2021-11-02 11:06:20	2021-11-02 11:06:20
2718	7	izgl??t??bas vad??ba	2021-11-02 11:06:20	2021-11-02 11:06:20
2719	7	ekonomikas un uz????m??jdarb??bas skolot??ja	2021-11-02 11:06:20	2021-11-02 11:06:20
2720	7	 Izgl??t??bas zin??t??u ma??istra gr??ds 	2021-11-02 11:06:20	2021-11-02 11:06:20
2721	7	speci??lo priek??metu un darbm??c??bas un ras????anas skolot??js	2021-11-02 11:06:20	2021-11-02 11:06:20
2722	7	kokapstr??des tehnolo??ijas	2021-11-02 11:06:20	2021-11-02 11:06:20
2723	7	Profesion??lo ma??istra gr??ds izgl??t??bas zin??tn??	2021-11-02 11:06:20	2021-11-02 11:06:20
2724	7	 latvie??u valodas un literat??ras skolot??ja pamatskol??	2021-11-02 11:06:20	2021-11-02 11:06:20
2725	7	vidusskolas atvie??u valodas un literat??ras skolot??ja	2021-11-02 11:06:20	2021-11-02 11:06:20
2726	7	V??sture, Soci??l??s Zin??tnes	2021-11-02 11:06:20	2021-11-02 11:06:20
2727	7	Person??la vad??ba	2021-11-02 11:06:20	2021-11-02 11:06:20
2728	7	 V??sture	2021-11-02 11:06:20	2021-11-02 11:06:20
2729	7	Vid??j??s izgl??t??bas ang??u valodas skiolot??js	2021-11-02 11:06:20	2021-11-02 11:06:20
2730	7	Vid??j??s izgl??t??bas krievu valodas k?? sve??valodas un latvie??u valodas k?? otr??s valodas skolot??ja	2021-11-02 11:06:20	2021-11-02 11:06:20
2731	7	Tehnisk?? tulka referente	2021-11-02 11:06:20	2021-11-02 11:06:20
2732	7	Vidusskolas Inform??tikas Skolot??ja	2021-11-02 11:06:20	2021-11-02 11:06:20
2733	7	Vidusskolas V??cu valodas skolot??js	2021-11-02 11:06:20	2021-11-02 11:06:20
2734	7	1.-4. Kl. Skolot??js, V??cu Val. Skolot??js Pamatskol??	2021-11-02 11:06:20	2021-11-02 11:06:20
2735	7	 matem??tika	2021-11-02 11:06:20	2021-11-02 11:06:20
2736	7	Psihologs	2021-11-02 11:06:20	2021-11-02 11:06:20
2737	7	Fizisk?? Audzin????ana	2021-11-02 11:06:21	2021-11-02 11:06:21
2738	7	Sabiedrisk??s ??din????anas tehnolo??ija un organiz??cija	2021-11-02 11:06:21	2021-11-02 11:06:21
2739	7	ekonomisk??s inform??tikas un autom??tiz??to vad??bas sist??mu	2021-11-02 11:06:21	2021-11-02 11:06:21
2740	7	Speci??lists organiz??ciju dro????b??	2021-11-02 11:06:21	2021-11-02 11:06:21
2741	7	kokapstr??des tehnolo??ias un izstr??d??jumu izgatavo??ana	2021-11-02 11:06:21	2021-11-02 11:06:21
2742	7	Speci??lists organiz??cijas dro????b??	2021-11-02 11:06:21	2021-11-02 11:06:21
2743	7	Filolo??ija	2021-11-02 11:06:21	2021-11-02 11:06:21
2744	7	 latvie??u valodas un literat??ras skolot??ja	2021-11-02 11:06:21	2021-11-02 11:06:21
2745	7	Dabaszin??t??u ma??istra gr??ds matem??tik??	2021-11-02 11:06:21	2021-11-02 11:06:21
2746	7	Matem??tika, Matem??tika un fizika	2021-11-02 11:06:21	2021-11-02 11:06:21
2747	7	B??vgaldnieks	2021-11-02 11:06:21	2021-11-02 11:06:21
2748	7	Sp??ku un apgaismes iek??rtu elektromontieris	2021-11-02 11:06:21	2021-11-02 11:06:21
2749	7	Izgl??t??bas zin??t??u  ma??istra gr??ds pedago??ij??	2021-11-02 11:06:21	2021-11-02 11:06:21
2750	7	Soci??lo zin??t??u ma??istra gr??ds ekonomik??	2021-11-02 11:06:21	2021-11-02 11:06:21
2751	7	soci??lo zin??t??u bakalaura g??ds ekonomik??	2021-11-02 11:06:21	2021-11-02 11:06:21
2752	7	datorsist??mu un datort??klu administratora	2021-11-02 11:06:21	2021-11-02 11:06:21
2753	7	komercdarb??bas speci??lists	2021-11-02 11:06:21	2021-11-02 11:06:21
2754	7	Dzelzce??a transporta im??enieris	2021-11-02 11:06:21	2021-11-02 11:06:21
2755	7	in??enieris ma????nzin??tn??	2021-11-02 11:06:21	2021-11-02 11:06:21
2756	7	D??ze??lokomot??vju saimniec??ba	2021-11-02 11:06:21	2021-11-02 11:06:21
2757	7	S??kumskolas Skolot??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2758	7	Docenta akad??miskais nosaukums	2021-11-02 11:06:21	2021-11-02 11:06:21
2759	7	kordiri??????ana	2021-11-02 11:06:21	2021-11-02 11:06:21
2760	7	Kompoz??cija	2021-11-02 11:06:21	2021-11-02 11:06:21
2761	7	Klavieres, Klavieru specialit??te	2021-11-02 11:06:21	2021-11-02 11:06:21
2762	7	in??enierzin??t??u bakalaura gr??ds meh??nik??	2021-11-02 11:06:21	2021-11-02 11:06:21
2763	7	Filologs, ang??u filalo??ij??	2021-11-02 11:06:21	2021-11-02 11:06:21
2764	7	????mija,elektro????mija	2021-11-02 11:06:21	2021-11-02 11:06:21
2765	7	Profeson??lais bakalaura gr??ds sporta zin??tn??	2021-11-02 11:06:21	2021-11-02 11:06:21
2766	7	In??enieris - Programm??t??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2767	7	 Profesion??l??s izgl??t??bas skolot??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2768	7	Uz????m??jdarb??bas vad??ba	2021-11-02 11:06:21	2021-11-02 11:06:21
2769	7	transporta l??dzek??u kr??sot??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2770	7	m??ksliniecisk?? noform????ana	2021-11-02 11:06:21	2021-11-02 11:06:21
2771	7	 Pedago??ijas pamati	2021-11-02 11:06:21	2021-11-02 11:06:21
2772	7	skolvad??ba	2021-11-02 11:06:21	2021-11-02 11:06:21
2773	7	Profesion????ais bakalaura gr??ds uz????m??jdarb??bas vad??t??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2774	7	Profesion??lais  ma??istra gr??ds dzelzce??a elektrosist??m??s	2021-11-02 11:06:21	2021-11-02 11:06:21
2775	7	dzelzce??transporta autom??tikas un telemeh??nika	2021-11-02 11:06:21	2021-11-02 11:06:21
2776	7	Mened??eris	2021-11-02 11:06:21	2021-11-02 11:06:21
2777	7	Izgl??t??bas un sporta darba	2021-11-02 11:06:21	2021-11-02 11:06:21
2778	7	profesionalais ma??istra gr??ds izglitibas zinatne	2021-11-02 11:06:21	2021-11-02 11:06:21
2779	7	 uz????muma un iest????u vad??t??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2780	7	vidusskolas ang??u valodas skolot??ja	2021-11-02 11:06:21	2021-11-02 11:06:21
2781	7	Uz????m??jdarb??bas vad??ba un administr????ana	2021-11-02 11:06:21	2021-11-02 11:06:21
2782	7	ekonomika un uz????m??jdarb??ba	2021-11-02 11:06:21	2021-11-02 11:06:21
2783	7	Autoservisa speci??lists	2021-11-02 11:06:21	2021-11-02 11:06:21
2784	7	profesion??l??s izgl??t??bas skolot??js un pedagogs	2021-11-02 11:06:21	2021-11-02 11:06:21
2785	7	Ekonomists uz????m??jdarb??b??	2021-11-02 11:06:21	2021-11-02 11:06:21
2786	7	dabaszin??t??u ma??istra gr??ds datorzin??tn??	2021-11-02 11:06:21	2021-11-02 11:06:21
2787	7	Dabaszin??t??u bakalaurs datorzin??tn??s	2021-11-02 11:06:21	2021-11-02 11:06:21
2788	7	ESM tehnisk??s apkopesun remonts	2021-11-02 11:06:21	2021-11-02 11:06:21
2789	7	kokr??pniec??ba	2021-11-02 11:06:21	2021-11-02 11:06:21
2790	7	Lieti??????s matem??tikas	2021-11-02 11:06:21	2021-11-02 11:06:21
2791	7	Matem??tikas	2021-11-02 11:06:21	2021-11-02 11:06:21
2792	7	matem??ti??is - pasniedz??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2793	7	Gr??mats??j??ja 	2021-11-02 11:06:21	2021-11-02 11:06:21
2794	7	Gr??matu iesie??anas tehnolo??ija	2021-11-02 11:06:21	2021-11-02 11:06:21
2795	7	Dai??amatniece ??das plastikas apstr??d??	2021-11-02 11:06:21	2021-11-02 11:06:21
2796	7	ieguvusi izgl??t??bas zinat??u ma??istra gr??du pedago??ij??	2021-11-02 11:06:21	2021-11-02 11:06:21
2797	7	Krievu Valoda	2021-11-02 11:06:21	2021-11-02 11:06:21
2798	7	Dabaszin??t??u bakalaura gr??ds datorzin??tn??s	2021-11-02 11:06:21	2021-11-02 11:06:21
2799	7	Datorsist??mu un datort??klu administrators	2021-11-02 11:06:21	2021-11-02 11:06:21
2800	7	biolo??ijas un fizikas skolot??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2801	7	Automehani??is	2021-11-02 11:06:21	2021-11-02 11:06:21
2802	7	Ang??u valodas skolot??ja	2021-11-02 11:06:21	2021-11-02 11:06:21
2803	7	Profesion??l??s izgl??t??bas skolot??ja, pedagogs	2021-11-02 11:06:21	2021-11-02 11:06:21
2804	7	Pedago??ijas ma??istra gr??ds 	2021-11-02 11:06:21	2021-11-02 11:06:21
2805	7	Defektolo??ija, Tiflopedago??ija	2021-11-02 11:06:21	2021-11-02 11:06:21
2806	7	izgl??t??bas darba vad??t??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2807	7	Pedago??ijas ma??istra gr??ds skolvad??bas nozar??	2021-11-02 11:06:21	2021-11-02 11:06:21
2808	7	Ekonomikas	2021-11-02 11:06:21	2021-11-02 11:06:21
2809	7	Bi??kop??ba	2021-11-02 11:06:21	2021-11-02 11:06:21
2810	7	Ieg??st doktora gr??du	2021-11-02 11:06:21	2021-11-02 11:06:21
2811	7	Filolo??ijas bakalaura gr??ds krievu filolo??ij??	2021-11-02 11:06:21	2021-11-02 11:06:21
2812	7	Fizikas, inform??tikas un darbm??c??bas skolot??js 	2021-11-02 11:06:21	2021-11-02 11:06:21
2813	7	programm??t??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2814	7	programm????anas tehni??is	2021-11-02 11:06:21	2021-11-02 11:06:21
2815	7	Prec??z??s meh??nikas apar??ti	2021-11-02 11:06:21	2021-11-02 11:06:21
2816	7	Profesion??lais bakaluara gr??ds izgl??t??b??	2021-11-02 11:06:21	2021-11-02 11:06:21
2817	7	Lokomot??vju Saimniec??ba	2021-11-02 11:06:21	2021-11-02 11:06:21
2818	7	 Vizu??l??s m??kslas skolot??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2819	7	vid??j??s izgl??t??bas matem??tikas skolot??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2820	7	krievu valoda un literat??rat??ra	2021-11-02 11:06:21	2021-11-02 11:06:21
2821	7	Ekonomika ar specializ??ciju finansu un gr??matved??bas vad??ba	2021-11-02 11:06:21	2021-11-02 11:06:21
2822	7	Uz????mumu un iest????u vad??ba	2021-11-02 11:06:21	2021-11-02 11:06:21
2823	7	Profesion??lais bakalaura  gr??ds uz????m??jdarb??b?? un vad????ana  	2021-11-02 11:06:21	2021-11-02 11:06:21
2824	7	 izgl??t??bas zin??t??u bakalaura gr??ds pedago??ij??,  izgl??t??bas zin??t??u ma??istra gr??ds pedago??ij??	2021-11-02 11:06:21	2021-11-02 11:06:21
2825	7	Profesion??lais bakalaura gr??ds lauksaimniec??bas ener????tik??	2021-11-02 11:06:21	2021-11-02 11:06:21
2826	7	Lokomot??vju saimniec??bas tehni??is	2021-11-02 11:06:21	2021-11-02 11:06:21
2827	7	Ang??u Val.	2021-11-02 11:06:21	2021-11-02 11:06:21
2828	7	Telemeh??nika un lo??istika	2021-11-02 11:06:21	2021-11-02 11:06:21
2829	7	Person??la speci??lists	2021-11-02 11:06:21	2021-11-02 11:06:21
2830	7	viesm??l??bas pakalpojumu speci??lists	2021-11-02 11:06:21	2021-11-02 11:06:21
2831	7	biolo??ijas un ????mijas skolot??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2832	7	vid??j??s izgl??t??bas ang??u valodas un v??cu valodas skolot??js	2021-11-02 11:06:21	2021-11-02 11:06:21
2833	7	S??kumskolas Pedago??ija Un Metodika	2021-11-02 11:06:21	2021-11-02 11:06:21
2834	7	Ang??u filolo??ija ar krievu valodu	2021-11-02 11:06:22	2021-11-02 11:06:22
2835	7	Vidusskolas latvie??u valodas un literat??ras skoilot??js	2021-11-02 11:06:22	2021-11-02 11:06:22
2836	7	bibliotek??rzin??tnes un bibliogr??fija	2021-11-02 11:06:22	2021-11-02 11:06:22
2837	7	pamatskolas ang??u valodas skolot??ja	2021-11-02 11:06:22	2021-11-02 11:06:22
2838	7	Dizaina un tehnolo??ijas skolot??ja	2021-11-02 11:06:22	2021-11-02 11:06:22
2839	7	Iespied??js	2021-11-02 11:06:22	2021-11-02 11:06:22
2840	7	augstspieduma iespied??js	2021-11-02 11:06:22	2021-11-02 11:06:22
2841	7	 Latvie??u valodaun literat??ra	2021-11-02 11:06:22	2021-11-02 11:06:22
2842	7	ieguvis pedago??ijas ma??istra gr??du	2021-11-02 11:06:22	2021-11-02 11:06:22
2843	7	Elektronikas skait??o??anas ma????nu	2021-11-02 11:06:22	2021-11-02 11:06:22
2844	7	Dabaszin??t??u ma??istra gr??ds datorzin??tn??s	2021-11-02 11:06:22	2021-11-02 11:06:22
2845	7	Soci??lo zin??t??u bakal. gradu psiholo??ij??	2021-11-02 11:06:22	2021-11-02 11:06:22
2846	7	telekomunik??cijas	2021-11-02 11:06:22	2021-11-02 11:06:22
2847	7	 ma??istra gr??ds vides zin??tn??	2021-11-02 11:06:22	2021-11-02 11:06:22
2848	7	In??enierpedago??ija	2021-11-02 11:06:22	2021-11-02 11:06:22
2849	7	 Latvie??u valodas un literat??ras skolot??js maz??kumtaut??bu skol??	2021-11-02 11:06:22	2021-11-02 11:06:22
2850	7	Horeogr??fija	2021-11-02 11:06:22	2021-11-02 11:06:22
2851	7	Dabaszin??t??u bakalaura gr??ds ??eogr??fij??	2021-11-02 11:06:22	2021-11-02 11:06:22
2852	7	dabaszin??t??u bakalaura gr??ds matem??tika	2021-11-02 11:06:22	2021-11-02 11:06:22
2853	7	ma??istra studiju programmas "Organiz??cijas vad??ba" 1.kursa ma??istrante	2021-11-02 11:06:22	2021-11-02 11:06:22
2854	7	ma????nburtlice	2021-11-02 11:06:22	2021-11-02 11:06:22
2855	7	vizu??l??s m??kslas skolot??ja	2021-11-02 11:06:22	2021-11-02 11:06:22
2856	7	Biroja administrators	2021-11-02 11:06:22	2021-11-02 11:06:22
2857	7	Gr??matvedis	2021-11-02 11:06:22	2021-11-02 11:06:22
2858	7	namu (nekustam?? ??pa??uma) p??rvaldnieks	2021-11-02 11:06:22	2021-11-02 11:06:22
2859	7	D??rzkop??ba	2021-11-02 11:06:22	2021-11-02 11:06:22
2860	7	Zootehnikas	2021-11-02 11:06:22	2021-11-02 11:06:22
2861	7	soci??lo zin??t??u bakalaurs ekonomik??	2021-11-02 11:06:22	2021-11-02 11:06:22
2862	7	??ku kr??sot??ja 	2021-11-02 11:06:22	2021-11-02 11:06:22
2863	7	civilo un r??pniec??bas ??ku celtniec??ba	2021-11-02 11:06:22	2021-11-02 11:06:22
2864	7	Humanit??ro zin??t??u bakalaura gr??ds ang??u filolo??ij??	2021-11-02 11:06:22	2021-11-02 11:06:22
2865	7	 Profesion??lo bakalaura gr??ds materi??lu tehnolo??ij?? un dizain??	2021-11-02 11:06:22	2021-11-02 11:06:22
2866	7	in??enierzin??t??u ma??istra gr??ds datorsist??m??s	2021-11-02 11:06:22	2021-11-02 11:06:22
2867	7	vid??j??s izgl??t??bas latvie??u valodas un literat??ras skolot??ja	2021-11-02 11:06:22	2021-11-02 11:06:22
2868	7	bibliot??kzin??tnes un bibliogr??fijas	2021-11-02 11:06:22	2021-11-02 11:06:22
2869	7	mened??ments	2021-11-02 11:06:22	2021-11-02 11:06:22
2870	7	Uz????m??jdarb??bas ekonomikas 	2021-11-02 11:06:22	2021-11-02 11:06:22
2871	7	Tirdzniec??bas Ekonomika	2021-11-02 11:06:22	2021-11-02 11:06:22
2872	7	Pedago??isk??s darb??baspamati	2021-11-02 11:06:22	2021-11-02 11:06:22
2873	7	Bakalaura profesion??lais gr??ds izgl??t??b??	2021-11-02 11:06:22	2021-11-02 11:06:22
2874	7	"Karjeras konsultants un jaunatnes lietu speci??lists"	2021-11-02 11:06:22	2021-11-02 11:06:22
2875	7	Prec??z??s Meh??nikas Apar??tu	2021-11-02 11:06:22	2021-11-02 11:06:22
2876	7	Ma??istra profesion??lais gr??ds valsts p??rvald??	2021-11-02 11:06:22	2021-11-02 11:06:22
2877	7	sabiedrisk??s ??din????anas tehnolo??ijas un organiz??cija	2021-11-02 11:06:22	2021-11-02 11:06:22
2878	7	Komerczin??bas	2021-11-02 11:06:22	2021-11-02 11:06:22
2879	7	B??vgaldnieka amata meistars	2021-11-02 11:06:22	2021-11-02 11:06:22
2880	7	Slie??u ce??u saimniec??bas tehni??is	2021-11-02 11:06:22	2021-11-02 11:06:22
2881	7	v??stures doktors	2021-11-02 11:06:22	2021-11-02 11:06:22
2882	7	bakalaura profesion??lais gr??ds vesel??bas apr??p??	2021-11-02 11:06:22	2021-11-02 11:06:22
2883	7	Projektu vad??ba 	2021-11-02 11:06:22	2021-11-02 11:06:22
2884	7	Dabaszin??t??u un inform??cijas tehnolo??ijas skolot??js	2021-11-02 11:06:22	2021-11-02 11:06:22
2885	7	Dabaszin??tnes un inform??cijas tehnolo??ijas skolot??js	2021-11-02 11:06:22	2021-11-02 11:06:22
2886	7	 Latvie??u valodas un literat??ras skolot??js, audzin??t??js metodi??is	2021-11-02 11:06:22	2021-11-02 11:06:22
2887	7	Poligr??fijas ra??o??anas tehnolo??ijas un izstr??d??jumu izgatavo??ana	2021-11-02 11:06:22	2021-11-02 11:06:22
2888	7	Lo??istikas speci??lists	2021-11-02 11:06:22	2021-11-02 11:06:22
2889	7	eknomika	2021-11-02 11:06:22	2021-11-02 11:06:22
2890	7	GR??MATVED??BA UN AUDITS	2021-11-02 11:06:22	2021-11-02 11:06:22
2891	7	Transporta p??rvad??jumu komercdarbinieks	2021-11-02 11:06:22	2021-11-02 11:06:22
2892	7	Starptautiskie tirdzniec??bas dar??jumi un lo??istika	2021-11-02 11:06:22	2021-11-02 11:06:22
2893	7	Uz??em??jdarb??bas vad??t??js	2021-11-02 11:06:22	2021-11-02 11:06:22
2894	7	S??kumskolas  skolot??ja	2021-11-02 11:06:22	2021-11-02 11:06:22
2895	7	fizika un matem??tika	2021-11-02 11:06:22	2021-11-02 11:06:22
2896	7	uz????m??jdarb??bas vad??t??ja	2021-11-02 11:06:22	2021-11-02 11:06:22
2897	7	In??enieris - Tehnologs	2021-11-02 11:06:22	2021-11-02 11:06:22
2898	7	in??enierzin??t??u ma??istra gr??ds materi??lzin??tn??s	2021-11-02 11:06:22	2021-11-02 11:06:22
2899	7	 soci??lais pedagogs	2021-11-02 11:06:22	2021-11-02 11:06:22
2900	7	psiholo??ija	2021-11-02 11:06:22	2021-11-02 11:06:22
2901	7	izgl??t??bas zin??t??u bakalaura akad??miskais gr??ds sport??	2021-11-02 11:06:22	2021-11-02 11:06:22
2902	7	lauksaimniec??bas uz????mumu gr??matved??ba	2021-11-02 11:06:22	2021-11-02 11:06:22
2903	7	V??sture, Sabiedr??bas M??c??ba	2021-11-02 11:06:22	2021-11-02 11:06:22
2904	7	Filolo??ijas bakalaura gr??ds	2021-11-02 11:06:22	2021-11-02 11:06:22
2905	7	dabaszin??t??u ma??istra gr??ds ????mij??	2021-11-02 11:06:23	2021-11-02 11:06:23
2906	7	Lieti?????? Ekonomika	2021-11-02 11:06:23	2021-11-02 11:06:23
2907	7	kokapstr??des tehnolo??ija	2021-11-02 11:06:23	2021-11-02 11:06:23
2908	7	Darbm??c??ba	2021-11-02 11:06:23	2021-11-02 11:06:23
2909	7	??????anas r??pniec??ba	2021-11-02 11:06:23	2021-11-02 11:06:23
2910	7	In??enieris	2021-11-02 11:06:23	2021-11-02 11:06:23
2911	7	Komersants(uz????m??jdarb??bas speci??lists)	2021-11-02 11:06:23	2021-11-02 11:06:23
2912	7	profesion??l??s izgl??t??bas skolot??ja un pedagogs	2021-11-02 11:06:23	2021-11-02 11:06:23
2913	7	Vad??bzin??tne un ekonomika	2021-11-02 11:06:23	2021-11-02 11:06:23
2914	7	Ang??u filolo??ija	2021-11-02 11:06:23	2021-11-02 11:06:23
2915	7	Krievu  valoda  un literat??ra	2021-11-02 11:06:23	2021-11-02 11:06:23
2916	7	Filalogs	2021-11-02 11:06:23	2021-11-02 11:06:23
2917	7	|Latvie??u valoda un literat??ra	2021-11-02 11:06:23	2021-11-02 11:06:23
2918	7	Tehni??is - tehnologs	2021-11-02 11:06:23	2021-11-02 11:06:23
2919	7	Krievu valodas un literat??ra un latvie??u valoda un literat??ra	2021-11-02 11:06:23	2021-11-02 11:06:23
2920	7	Automobi??i Un Automobi??u Saimniec??ba	2021-11-02 11:06:23	2021-11-02 11:06:23
2921	7	Elektrisk??s piedzi??as un r??pniec??bas iek??rtu automatiz??cija	2021-11-02 11:06:23	2021-11-02 11:06:23
2922	7	profesion??lais bakalaura gr??ds ties??bu zin??tn??s	2021-11-02 11:06:23	2021-11-02 11:06:23
2923	7	Datorsist??mas, datub??zes un datort??kli	2021-11-02 11:06:23	2021-11-02 11:06:23
2924	7	In??enierzin??t??u ma??istra gr??ds E-studiju tehnolo??ij??s un p??rvald??b??	2021-11-02 11:06:23	2021-11-02 11:06:23
2925	12	245. kab. [Galven?? ??ka]	2021-12-07 22:01:23	2021-12-08 11:46:01
2926	13	Galven?? ??ka	2021-12-08 11:45:27	2021-12-08 11:45:27
2927	13	D??rzciema	2021-12-08 12:11:51	2021-12-08 12:11:51
2928	12	DK-120 [D??rzciema]	2021-12-08 12:13:40	2021-12-08 12:13:40
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id, name, guard_name, created_at, updated_at, display_name) FROM stdin;
1	documents.view	web	2021-07-05 15:20:18	2021-07-05 15:20:18	Skat??t visus dokumentus
2	statistics.view	web	2021-07-05 15:20:18	2021-07-05 15:20:18	Skat??t statistiku
3	users.create	web	2021-07-05 15:20:18	2021-07-05 15:20:18	Pievienot lietot??jus
4	users.update	web	2021-07-05 15:20:18	2021-07-05 15:20:18	Atjaunot lietot??jus
5	users.destroy	web	2021-07-05 15:20:18	2021-07-05 15:20:18	Arhiv??t lietot??jus
6	options.create	web	2021-07-05 15:20:18	2021-07-05 15:20:18	Pievienot izv??les laukus
7	options.update	web	2021-07-05 15:20:18	2021-07-05 15:20:18	Atjaunot izv??les laukus
8	options.destroy	web	2021-07-05 15:20:18	2021-07-05 15:20:18	Dz??st izv??les laukus
9	documents.create	web	2021-07-05 15:20:18	2021-07-05 15:20:18	Pievienot dokumentus
10	documents.update	web	2021-07-05 15:20:18	2021-07-05 15:20:18	Atjaunot dokumentus
11	documents.destroy	web	2021-07-05 15:20:18	2021-07-05 15:20:18	Arhiv??t dokumentus
12	regulations.manage	web	2021-07-05 15:20:18	2021-07-05 15:20:18	P??rvald??t normat??vos aktus
13	archives.manage	web	2021-07-05 15:20:18	2021-07-05 15:20:18	P??rvald??t arh??vus
14	roles.manage	web	2021-07-05 15:20:18	2021-07-05 15:20:18	P??rvald??t lomas
15	events.manage	web	2021-12-08 10:23:05	2021-12-08 10:23:05	P??rvald??t pas??kumus
17	employee.it	web	2021-12-08 10:23:05	2021-12-08 10:23:05	IT noda??as darbinieks
18	employee.as	web	2021-12-08 10:23:05	2021-12-08 10:23:05	Administrat??vi saimniecisk?? sektora darbinieks
19	employee.sa	web	2021-12-08 10:23:05	2021-12-08 10:23:05	Sabiedrisko attiec??bu speci??lists
20	employee.md	web	2021-12-08 10:23:05	2021-12-08 10:23:05	M??c??bu da??as darbinieks
\.


--
-- Data for Name: positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.positions (id, name, created_at, updated_at) FROM stdin;
1	Programm??t??js	2021-05-27 14:48:22	2021-12-08 15:31:47
2	IT noda??as vad??t??ja vietnieks	2021-05-27 16:06:26	2021-05-27 16:06:26
3	skolot??js	2021-05-27 16:07:09	2021-05-27 16:07:09
4	M??jas lapas administrators	2021-06-06 15:57:43	2021-06-06 15:57:43
5	Viesn??cas st??va p??rzinis	2021-07-27 06:24:28	2021-07-27 06:24:28
6	De??urants	2021-07-27 08:36:57	2021-07-27 08:36:57
7	Speci??lists	2021-07-27 08:47:47	2021-07-27 08:47:47
8	Lietvedis	2021-07-28 07:09:49	2021-07-28 07:09:49
9	Galven?? gr??matvede	2021-07-29 09:55:19	2021-07-29 09:55:19
10	Profesion??l??s izgl??t??bas skolot??js	2021-07-29 10:01:12	2021-07-29 10:01:12
11	Visp??????j??s vid??j??s izgl??t??bas skolot??js	2021-07-29 10:09:35	2021-07-29 10:09:35
12	Galvenais gr??matvedis	2021-07-29 10:11:39	2021-07-29 10:11:39
13	Apkop??js	2021-07-29 11:16:43	2021-07-29 11:16:43
14	Dienesta viesn??cas skolot??js	2021-07-29 11:22:35	2021-07-29 11:22:35
15	Saimniec??bas vad??t??js	2021-07-30 06:10:54	2021-07-30 06:10:54
16	Laborants	2021-07-30 06:23:09	2021-07-30 06:23:09
17	Darbn??cu vad??t??js	2021-07-30 06:23:09	2021-07-30 06:23:09
18	M??jas p??rvaldnieks	2021-07-30 06:41:54	2021-07-30 06:41:54
19	Izgl??t??bas metodi??is	2021-07-30 06:51:55	2021-07-30 06:51:55
20	Strukt??rvien??bas vad??t??js	2021-07-30 07:22:39	2021-07-30 07:22:39
21	Uzskaitvede	2021-07-30 07:56:32	2021-07-30 07:56:32
22	Strukt??rvien??bas vad??t??ja vietnieks	2021-07-30 10:05:09	2021-07-30 10:05:09
23	Bibliotek??rs	2021-08-02 08:30:44	2021-08-02 08:30:44
24	uzskaitvedis	2021-08-02 08:54:22	2021-08-02 08:54:22
25	Intere??u izgl??t??bas skolot??js	2021-08-02 09:19:16	2021-08-02 09:19:16
26	Noda??as vad??t??js	2021-08-02 10:23:21	2021-08-02 10:23:21
27	Elektroin??enieris	2021-08-02 10:36:25	2021-08-02 10:36:25
28	Vec??kais lietvedis	2021-08-03 08:22:02	2021-08-03 08:22:02
29	Izgl??t??bas metodi??a p.i.	2021-08-03 09:47:07	2021-08-03 09:47:07
30	Noliktavas darbinieks	2021-08-03 10:50:20	2021-08-03 10:50:20
31	Noliktavas p??rzinis	2021-08-03 10:50:20	2021-08-03 10:50:20
32	Sporta organizators	2021-08-04 07:05:19	2021-08-04 07:05:19
33	Soci??lais pedagogs	2021-08-04 07:27:42	2021-08-04 07:27:42
34	Pedagogs karjeras konsultants	2021-08-04 08:43:29	2021-08-04 08:43:29
35	Direktora vietnieks izgl??t??bas kvalit??tes un att??st??bas jom??	2021-08-05 11:08:44	2021-08-05 11:08:44
36	Maket??t??js	2021-08-06 08:18:43	2021-08-06 08:18:43
37	Iespied??js	2021-08-06 09:12:29	2021-08-06 09:12:29
38	Noda??as vad??t??ja	2021-08-06 10:14:53	2021-08-06 10:14:53
39	Izgl??t??bas psihologs	2021-08-06 10:39:11	2021-08-06 10:39:11
40	Administrators	2021-08-17 12:01:09	2021-08-17 12:01:09
41	Galdnieks	2021-08-17 12:07:28	2021-08-17 12:07:28
42	Datort??kla uztur????anas administrators	2021-08-18 09:00:42	2021-08-18 09:00:42
43	Vec??kais izgl??t??bas metodi??is	2021-08-19 07:50:58	2021-08-19 07:50:58
44	Galvenais speci??lists	2021-08-20 06:41:42	2021-08-20 06:41:42
45	Direktora vietnieks, noda??as vad??t??js	2021-08-23 08:29:40	2021-08-23 08:29:40
46	Gr??matvede	2021-08-23 12:12:59	2021-08-23 12:12:59
47	M??jaslapas administrators	2021-08-27 07:58:04	2021-08-27 07:58:04
48	Datora operators	2021-08-27 09:27:59	2021-08-27 09:27:59
49	Datoru operators	2021-08-30 11:17:42	2021-08-30 11:17:42
50	Inform??cijas tehnolo??iju administrators	2021-08-30 11:17:42	2021-08-30 11:17:42
51	person??la lietu p??rzinis	2021-09-09 08:24:40	2021-09-09 08:24:40
52	Direktora vietnieks izgl??t??bas organiz??cijas jom??	2021-09-14 12:39:58	2021-09-14 12:39:58
53	Lietvede	2021-09-15 08:16:09	2021-09-15 08:16:09
54	s??tnieks	2021-09-22 07:16:51	2021-09-22 07:16:51
55	str??dnieks	2021-09-22 07:22:34	2021-09-22 07:22:34
56	apkop??ja	2021-09-22 08:02:51	2021-09-22 08:02:51
57	ESF projekta koordinatora asistents	2021-09-22 11:25:49	2021-09-22 11:25:49
58	Direktora vietnieks	2021-09-24 07:17:59	2021-09-24 07:17:59
59	Namu p??rvaldniece	2021-09-24 11:11:59	2021-09-24 11:11:59
60	Direktora vietniecei darba vid?? balst??tas un m????izgl??t??b??s jom??	2021-09-30 11:32:47	2021-09-30 11:32:47
61	garderobists	2021-10-01 06:41:08	2021-10-01 06:41:08
62	profesion??lo priek??metu skolot??js	2021-10-01 06:56:05	2021-10-01 06:56:05
63	garderobiste	2021-10-01 09:30:49	2021-10-01 09:30:49
64	Inform??cijas t??kla p??rzinis	2021-10-01 10:06:54	2021-10-01 10:06:54
65	Direktora vietnieks ITK UN inov??cijas att??st??bas jom??	2021-10-01 10:06:54	2021-10-01 10:06:54
66	Direktora vietnieks izgl??t??bas att??st??bas jom??	2021-10-04 05:41:16	2021-10-04 05:41:16
67	Direktore	2021-10-04 07:40:47	2021-10-04 07:40:47
68	Centra vad??t??ja	2021-10-04 11:07:58	2021-10-04 11:07:58
69	Medic??nas m??sa	2021-10-18 05:58:28	2021-10-18 05:58:28
\.


--
-- Data for Name: regulations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regulations (id, type, name, file, created_at, updated_at) FROM stdin;
7	1	Instrukcija Nr. 1 par dro????bu kabinetos un telp??s, kur??s ir iek??rtas un vielas, kas var apdraud??t izgl??tojamo dro????bu un vesel??bu	JwtOvNqjriwQhodLPUJVtAqVWdOfiRiOzdJt2kCy.pdf	2021-06-14 07:55:09	2021-06-14 07:55:09
8	1	Instrukcija Nr. 2 par ugunsdro????bu	JfZpXBxCqeXRg7af1XM0DVD198FGNXHEQuerAcYp.pdf	2021-06-14 07:55:33	2021-06-14 07:55:33
9	1	Instrukcija Nr. 3 par elektrodro????bu	yBwqQBkpBkRUx5aDmW5O3cEX0LHEd7K6P2aJe7Rb.pdf	2021-06-14 07:55:48	2021-06-14 07:55:48
10	1	Instrukcija Nr. 4 par pirm??s pal??dz??bas snieg??anu	oij6dCDEV2gEk0zHJ1YXLpNNWquld58MGNWgLaVb.pdf	2021-06-14 07:56:01	2021-06-14 07:56:01
11	1	Instrukcija Nr. 5 par dro????bu ekskursij??s, p??rg??jienos un pastaig??s	i8OlAYCYUI0mk0hbsuVjd842MRjWvL3prSnhJJnD.pdf	2021-06-14 07:56:20	2021-06-14 07:56:20
12	1	Instrukcija Nr. 6 Dro????bas noteikumi masu pas??kumu laik??	NSCBH16nECYS9SVt6pFCAte3TeFnKwVPZPuslpyK.pdf	2021-06-14 07:56:38	2021-06-14 07:56:38
13	1	Instrukcija Nr. 7 par dro????bu sporta sacens??b??s un nodarb??b??s	I7PtKubdXK2R5kMkIDwYaHxIBCtn4kdioU9Mn0mp.pdf	2021-06-14 07:56:53	2021-06-14 07:56:53
14	0	PIKC "R??gas Valsts tehnikums" ??tikas kodekss	mMRv2aEE8L83LZoqOO2njAEu7ZOhHoluqQ726g2V.pdf	2021-06-14 08:00:00	2021-06-14 08:00:00
15	0	Lietu nomenklat??ra 2021	vBnXA1PIstMzdxrjwtQzZX1EpLEg6JorvkyOtQHf.pdf	2021-06-14 08:03:39	2021-06-14 08:03:39
16	0	Konventa nolikums	jiYJ8ZHFWFOZTIvs8HpW4rcV2BAro9HPOIcLdHFI.pdf	2021-06-14 08:05:27	2021-06-14 08:05:27
17	0	Speci??lo medic??niski optisko redzes korekcijasl??dzek??u (bri????u) ieg??des izdevumu kompens????anas k??rt??ba	HLVRUJoDXwmjQyEYv6HN9bNt7mbL5zbVjbZm1Ubv.pdf	2021-06-14 08:06:13	2021-06-14 08:06:13
18	0	Pieaugu??o izgl??t??bas centra reglaments	e44xWl4c4aBSpSkh5yEYXje5kMgJOFjS16GhCKq6.pdf	2021-06-14 08:09:50	2021-06-14 08:09:50
19	0	Pedagogu profesion??l??s darb??bas kvalit??tes novert????anas k??rt??ba	YRXjptt1GQw4pgLLBHAF1bgIJlNm458snNfUm2nV.pdf	2021-06-14 08:10:49	2021-06-14 08:10:49
20	0	Profesion??l??s izgl??t??bas kompetences centra "R??gas Valsts tehnikums" NOLIKUMS	3oJcfzfaPR9oopQGbqPEMNfgRN7B0J2BlMTePLNu.pdf	2021-06-14 08:11:25	2021-06-14 08:11:25
21	0	Administrat??vo izdevumu un ar tehnikuma darb??bas nodro??in????anu saist??to izdevumu veido??anas un uzskaites k??rt??ba	v1V0MzKh9N7EhL2TynWSUtKYcMdbYq5bTwuDVdWs.pdf	2021-06-14 08:11:54	2021-06-14 08:11:54
22	0	Metodisko izstr??d??u skates nolikums	jxvLxlOmiPTCzEEL7JP8n8FSYxCeoaXlRAx341tC.pdf	2021-06-14 08:16:56	2021-06-14 08:16:56
23	0	Arh??va dokumentu un izzi??u izsnieg??anas k??rt??ba	y6XCvYfLRmsc6UMGDrSKj5kPTK5KZ1Uh2TESju6L.pdf	2021-06-14 08:17:17	2021-06-14 08:17:17
24	0	Autotransporta izmanto??anas k??rt??ba	aKkyuoP9Qao8pUjMlqPvA6J3q4wHLiS3Cp9jvqte.pdf	2021-06-14 08:17:36	2021-06-14 08:17:36
25	0	Balvas Gada skolot??js pie????ir??anas nolikums	4DwHQM8yvH1RnSYFmyt3lyi8OUhfcCPOFDL913rv.pdf	2021-06-14 08:19:11	2021-06-14 08:19:11
26	0	Balvas Goda z??me pie????ir??anas nolikums	s2BOemVFinKquJxV26EDKEw6HR9Aces5IMhzxOeq.pdf	2021-06-14 08:19:34	2021-06-14 08:19:34
27	0	Bibliot??kas reglaments	EHQeaTzdykVoGzTBvl0l1zPOpSWJnJ0EtudWcDBf.pdf	2021-06-14 08:19:56	2021-06-14 08:19:56
28	0	Bibliot??kas un las??tavas lieto??anas noteikumi	yCFbqEW7853vUxDYwq5XaoanocwQAQiPe4oe6h9P.pdf	2021-06-14 08:20:14	2021-06-14 08:20:14
29	0	Darba k??rt??bas noteikumi	nLcB5g0azSPfmaNhXWPmVhHQHNPqGpgzDdoFHAat.pdf	2021-06-14 08:20:41	2021-06-14 08:20:41
30	0	Darba samaksas un materi??l??s stimul????anas sist??ma	snBKFa4OFxZBLsPCxXkwCoK3vxLaKhILi63A9Txw.pdf	2021-06-14 08:21:06	2021-06-14 08:21:06
31	0	Darbinieku materi??l??s stimul????anas k??rt??ba	vfIwwnHDqECdwGoEaOQ0pToqm9UEQy8cVEG0DiYK.pdf	2021-06-14 08:21:35	2021-06-14 08:21:35
32	0	De??urantu instrukcija	8IAsorUrKy8T8DuA6WrKWou7RNMSuPc1BOwM16db.pdf	2021-06-14 08:21:54	2021-06-14 08:21:54
33	0	Dienesta viesn??cas reglaments	IOD3WOTpAPkMG9jTbB6Ce75lpEdE7kz5DbssLv4a.pdf	2021-06-14 08:22:47	2021-06-14 08:22:47
34	0	M??c??bu procesa organiz????anas k??rt??ba COVID-19 infekcijas izplat??bas ierobe??o??anas laik??	mLq6QSE5cF5bAVVdv6lrc2Yto30lncxesW7hSxv9.pdf	2021-06-14 08:23:52	2021-06-14 08:23:52
35	0	DV iek????j??s k??rt??bas noteikumi	3xOpJrMxORvIgQh1cpsDSb3CkSgsPtXWOF6gPsVQ.pdf	2021-06-14 08:24:09	2021-06-14 08:24:09
36	0	Eks??menu organiz????anas k??rt??ba ekster??iem	yfD9u3xUYbKICld6PtAUIZtt50POrS8CBdVR6E3N.pdf	2021-06-14 08:24:28	2021-06-14 08:24:28
37	0	Ekspertu komisijas reglaments	jJDO9UQftvrUfGY9tcWUix0PVFB3zpkl27S9fj8F.pdf	2021-06-14 08:24:48	2021-06-14 08:24:48
38	0	Gr??matved??bas reglaments	impSpgUbZMj0nIcTXje00RvLdifsPpuetmRvFBV3.pdf	2021-06-14 08:25:02	2021-06-14 08:25:02
39	0	Gr??matved??bas uzskaites k??rt??ba	7QNxjhe8F5BdjHGXuDGsdfbBPOvuFap1I3ACjniL.pdf	2021-06-14 08:25:19	2021-06-14 08:25:19
40	0	Gr??matved??bas uzskaites k??rt??bas turpin??jums	RJeyYNX1dmGiceeH43cedKyKx0DabxooJdRFlqig.pdf	2021-06-14 08:25:33	2021-06-14 08:25:33
41	0	Gr??matve??u ??tikas kodekss	fwD0kNuvqB4RfbiEoM6EToImsNTAEdc7wYnVmd9C.pdf	2021-06-14 08:25:48	2021-06-14 08:25:48
42	0	Gustava Vanaga stipendijas pie????ir??anas nolikums	ojl6OGoyQZiBI1xJ2ZVXH3idtcKTQj4J4AGVP0xI.pdf	2021-06-14 08:26:08	2021-06-14 08:26:08
43	0	Iek????jas k??rt??bas noteikumi	y4ygTfqqyfE5Y0YYOpPSglYu1gNuH41lPaPqWeYM.pdf	2021-06-14 08:26:24	2021-06-14 08:26:24
44	0	Iepirkumu komisijas darba k??rt??ba	iND1r1ICk2ypt5eZZFLWglstNFy3gJHE5Ik53odu.pdf	2021-06-14 08:26:53	2021-06-14 08:26:53
45	0	Iek????j??s kontroles proced??ra dienas vid??j??s izpe????as apr????in??sana	u3Nt94K7njAKuUV6yJGTRo28Vs0NASCtqYZghyhT.pdf	2021-06-14 08:27:12	2021-06-14 08:27:12
46	0	Inform??cijas sist??mas dro????bas noteikumi	Y1V1z2y5vPjR7U4ms7n61az4HKGOr5tpAZf4Y6w5.pdf	2021-06-14 08:27:30	2021-06-14 08:27:51
47	0	Inform??cijas sist??mas lieto??anas noteikumi	Tgm3ZQw3eudf37il9847Hw0ZEv4UG7G1lSwMaGXm.pdf	2021-06-14 08:28:27	2021-06-14 08:28:27
48	0	Instrukcija par apbreibino????m viel??m	5b55ogmU4gb5umd2OyLtAw3VNiIZF1IszeLxCgdS.pdf	2021-06-14 08:28:44	2021-06-14 08:28:44
49	0	Interneta m??jas lapas uztur????anas, inform??cijas ievieto??anas un aktualiz????anas k??rt??ba	OIOzyYBsmMomuqqI05e2n7hVIlB6v5fwJMta8XtQ.pdf	2021-06-14 08:29:06	2021-06-14 08:29:06
50	0	Inventariz??cijas norises k??rt??ba	zTWEChqwOvtyubnXGgvHYyEnQkM5iybEs4cQoAca.pdf	2021-06-14 08:29:26	2021-06-14 08:29:26
51	0	Izglitojamo vecaku padomes reglaments	cirjUwuOJcnyxq8u2kDhKsGoF5GKyFB0nJThv0ed.pdf	2021-06-14 08:29:46	2021-06-14 08:29:46
52	0	Izgl??tojamo m??c??bu sasniegumu v??rt????anas k??rt??ba 2021. gada 07. janv??ris	7ESYwRL5GJvN6RVktqpC8ISndhcRSzLkF0PcZDle.pdf	2021-06-14 08:30:19	2021-06-14 08:30:19
53	0	Izgl??tojamo m??c??bu sasniegumu v??rt????anas k??rt??ba	yIBofHaLCjrICJ6N4oe4B9m44L4ZcgFWmJFTFPCX.pdf	2021-06-14 08:30:38	2021-06-14 08:30:38
54	0	Izgl??tojamo pa??p??rvaldes reglaments	ofxFS7csQg8OXldn9nYYZk2o1pOyxTLxxecLjx6v.pdf	2021-06-14 08:31:12	2021-06-14 08:31:12
55	0	Jaun??ko ????mi??u skola	jkCid3EvUaCaRDKS58vJ2ZJRamxg2jQU1Zjdtl4M.pdf	2021-06-14 08:31:43	2021-06-14 08:31:43
56	0	K??rt??ba r??c??bai, ja izgl??tojamais ir nesekm??gs, ??stenojot izgl??t??bas ieguvi kl??tienes form??	6luoE6oW6ptajPsTkHM1wAhHkqVqHevg7mJl6xyk.pdf	2021-06-14 08:32:20	2021-06-14 08:32:20
57	0	Izgl??tojamo ikm??ne??a atest??cijas k??rt??ba	Jne9gkO1Jn1K2JylZSLsG34xfAJXXcYnxcOtR2vv.pdf	2021-06-14 08:41:39	2021-06-14 08:41:39
58	0	Komand??jumu pie????ir??anas un komand??jumu izdevumu atl??dzin????anas noteikumi	vFHIgrNvCUSBiHP2x1I4bxcwgjzhPsrP29EOy5hv.pdf	2021-06-14 08:41:56	2021-06-14 08:41:56
60	0	Dokumentu p??rvald??bas un aprites k??rt??ba	LoC6ddsbsL4DgxTkRFeJUk4SjgGeTtMJEDbMOkVq.pdf	2021-06-14 08:42:29	2021-06-14 08:42:29
61	0	Lietved??bas un person??la noda??as reglaments	fuJeiY1F1QSBJX375uINnabbrzhzLl0mxWCI2rIz.pdf	2021-06-14 08:42:44	2021-06-14 08:42:44
62	0	Maksas pakalpojumu snieg??anas k??rt??ba	zZMNw0piZ0psYzhQOc48kss0rAg5PYhbVL4Eq3DL.pdf	2021-06-14 08:43:03	2021-06-14 08:43:03
63	0	Materi??lo v??rt??bu norakst????anas k??rt??ba	PyJizFBgVvnb57rRUu3uuD0jmGIvkyYrRHuiikWF.pdf	2021-06-14 08:43:17	2021-06-14 08:43:17
64	0	M??c??bu kvalifik??cijas prakses organiz??cijas	jNMmCP8ob2kNC0Kk6h8umgOE785DyAJ0xAY3eCAh.pdf	2021-06-14 08:43:31	2021-06-14 08:43:31
65	0	M??c??bu procesa organiz??cijas noteikumi	XSfcsg02B8Hc4LAkyTwpfKgmE0yo5LKZIPPpG2ow.pdf	2021-06-14 08:44:00	2021-06-14 08:44:00
66	0	Metodiskais materi??ls m??c??bu procesa organiz??cijas noteikumiem	U5IrV8yMEdPlYb7af7ovZmITWVS40PzVQSd7t3Fu.pdf	2021-06-14 08:44:18	2021-06-14 08:44:18
67	0	Metodisk??s padomes reglaments	0Y0d4RBmVcXjFWeLtw7wfkTXDOy3ijx3lId83QRy.pdf	2021-06-14 08:44:33	2021-06-14 08:44:33
68	0	Nolikums par J????a V??rs stipendijas pie????ir??anas k??rt??bu	khxpgd09Am2w7mt0vd7QjJVeKTpg1GnRrOtOjC5j.pdf	2021-06-14 08:44:48	2021-06-14 08:44:48
69	0	Nomas tiesisko attiec??bu nodibin????anas pamatot??bas izv??rt????anas k??rt??ba	GgQhvvvEef10dBVcnkRV7cFbOzwZs4iTCjM9Ga85.pdf	2021-06-14 08:45:03	2021-06-14 08:45:03
70	0	Par atk??rtota kvalifik??cijas eks??mena k??rto??anu	UjrCUouvqNgf8qyXKchypGp7pfrssxIFgOQpMqNe.pdf	2021-06-14 08:45:19	2021-06-14 08:45:19
71	0	Par sazi??as l??dzek??u izmanto??anu	7t3619oE4SumrB4dmhzkf9P3OMFXnQBspllgz1qS.pdf	2021-06-14 08:45:35	2021-06-14 08:45:35
72	0	Pedago??isk??s padomes reglaments	nXjKY1hgHxK6LHFspqSugkERrXeJaT3MCi6f9bI9.pdf	2021-06-14 08:45:50	2021-06-14 08:45:50
73	0	Pielikums gr??matved??bas uzskaites k??rt??ba	0IZ2RipBFgDIx9k41uYf7giSMbhMueSvvbN8B7Un.pdf	2021-06-14 08:46:02	2021-06-14 08:46:02
74	0	PIKC RVT noda??u reglaments	wL1Xue25XCB7ltyVGw0OBhxNjILcitv1XtbopvC8.pdf	2021-06-14 08:46:17	2021-06-14 08:46:17
75	0	Projektu nodalas reglaments	Viz6k5G9yeH6I6ttY5jJX4p1cEzGpS2TF6MHF1Vu.pdf	2021-06-14 08:46:34	2021-06-14 08:46:34
76	0	Sagavo??anas kursu noteikumi	ywzGJL3zylDlnkWH8LkkEeGbQL51nexBbHOUNIxT.pdf	2021-06-14 08:46:54	2021-06-14 08:46:54
77	0	Stipendiju pie????ir??anas nolikums	4c5veOSrMtcliLgYBWKxsgah7wCJ2QwEwAFRNlds.pdf	2021-06-14 08:47:09	2021-06-14 08:47:09
78	0	Stipendiju pie????ir??anas k??rt??bas pielikums	fdd1iZ30W6lI81Y10Lsz348ipRuOMlTaZmx8lMw7.xlsx	2021-06-14 08:47:34	2021-06-14 08:47:34
79	0	T??l??kizgl??t??bas noda??as reglaments	copXWqiu1VOl7ecuxq6DsrhIzpq88vWWoiYmFsbI.pdf	2021-06-14 08:49:48	2021-06-14 08:49:48
80	0	Padomes nolikums	1oWBMPTwD79m7zh1lyNRDSRvOgseGxRPyb3f3Y8h.pdf	2021-06-14 08:50:01	2021-06-14 08:50:01
81	0	Teriori??l??s strukt??rvien??bas reglaments	jAdrigkUHhjy2LMSXZrZs08kSQkXwnsNJjVmEoPq.pdf	2021-06-14 08:50:15	2021-06-14 08:50:15
82	0	Visp??rizgl??tojo??o un profesion??lo m??c??bu priek??metu metodisko komisiju reglaments	1O7svkkaQB8Y3nXl0IdNDBCxzdPvftl3hX5hJpRf.pdf	2021-06-14 08:50:30	2021-06-14 08:50:30
83	0	Inform??cijas tehnolo??iju noda??as reglaments	MOj9edC7Xn1bg0xadr7DDLwyhCBU9kPVcBvm9xdE.pdf	2021-06-14 08:51:03	2021-06-14 08:51:03
84	0	Pedagogu profesion??l??s darb??bas kvalit??tes nov??rt????anas komisijas nolikums ar pielikumiem	y9OSNuo37gZ6djRY0cA4kGPC1Br4Nc8HpM9eRu15.pdf	2021-06-14 08:51:56	2021-06-14 08:51:56
85	0	P??cp??rbaud??jumu organiz????ana un norises k??rt??ba	JjwAHPIxG11gdIYfVByODxYdi8LTp05upTAWNdKd.pdf	2021-06-14 08:54:12	2021-06-14 08:54:12
86	0	Inform??cijas un komunik??cijas tehnolo??iju sist??mu dro????bas politika	f28zSUwm92FXPlYDCscAcSeG01jll2tzC2aq2XzP.pdf	2021-06-14 08:56:01	2021-06-14 08:56:01
87	0	Korupcijas un intere??u konflikta riska nov??r??anas k??rt??ba	ABIh5GyErUU2u66fzYg6CmAFbkfVPw1uWhxL1v30.pdf	2021-06-14 08:56:20	2021-06-14 08:56:20
88	0	Nolikums par tehnikuma apbalvojuma pie????ir??anu izgl??tojamiem	LGVHXPqX02EdccnVaRCAdJI5Nhx6Hle0qdEut0J3.pdf	2021-06-14 08:56:40	2021-06-14 08:56:40
89	0	Skolot??ja asistenta piesaistes organiz????ana un nodro??in????anas k??rt??ba	SehLknLjfFFUBTfPddAMLLzFM8RQ0ScArSUk9zaL.pdf	2021-06-14 08:56:57	2021-06-14 08:56:57
90	0	Pedagogu m??ne??a darba algas likmes noteik??anas k??rt??ba	eNtsoFPdz4ZmRY0wfommx8l9DpXPL7pmEKjn0nnm.pdf	2021-06-14 08:57:16	2021-06-14 08:57:16
91	0	Inform??cijas un komunik??cijas tehnolo??iju sist??mu dro????bas politika	BKtPb4TPw5mFD2KQhORKirRLkit3TFxt8rT2Ytf9.pdf	2021-06-14 08:57:56	2021-06-14 08:57:56
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_has_permissions (permission_id, role_id) FROM stdin;
1	2
1	3
1	5
2	2
2	3
2	5
3	2
3	3
4	2
4	3
5	2
5	3
6	2
6	3
7	2
7	3
8	2
8	3
9	2
9	3
10	2
10	3
11	2
11	3
12	2
12	3
13	2
13	3
14	2
14	3
15	3
17	3
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	Skolot??js	web	2021-04-09 22:59:22	2021-04-09 22:59:22
2	Person??lda??as darbinieks	web	2021-04-09 22:59:22	2021-09-16 07:37:54
3	Administrators	web	2021-04-09 22:59:22	2021-04-09 22:59:22
4	Darbinieks	web	2021-07-06 07:21:23	2021-07-06 07:23:05
5	Vad??t??js	web	2021-09-09 07:36:33	2021-09-09 07:36:33
\.


--
-- Data for Name: user_positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_positions (id, user_id, position_id, department, start, "end", type, created_at, updated_at) FROM stdin;
52	538	8	500	2021-07-27	\N	0	\N	\N
295	539	3	508	2021-05-26	\N	0	\N	\N
337	512	10	526	2021-02-15	\N	0	\N	\N
349	513	34	499	2020-09-22	\N	0	\N	\N
399	366	10	531	2003-08-18	\N	0	\N	\N
428	302	37	500	2019-09-24	\N	0	\N	\N
429	302	10	541	2020-09-08	\N	2	\N	\N
442	517	10	483	2018-10-26	\N	0	\N	\N
482	542	6	496	1999-12-09	2013-01-09	0	\N	\N
483	542	5	496	2013-10-01	\N	0	\N	\N
485	363	40	555	2021-06-03	2021-08-11	0	\N	\N
486	72	41	526	2012-10-10	2021-08-13	0	\N	\N
494	53	10	529	2011-09-01	\N	0	\N	\N
507	345	10	526	2016-01-04	\N	0	\N	\N
513	521	10	483	2020-09-01	\N	0	\N	\N
519	178	10	529	2021-03-01	\N	0	\N	\N
523	143	11	488	2016-09-05	\N	0	\N	\N
559	47	10	531	2018-09-18	\N	0	\N	\N
564	544	15	526	2021-08-10	\N	0	\N	\N
584	523	10	529	2020-09-14	2020-12-30	0	\N	\N
585	523	10	529	2021-02-08	\N	0	\N	\N
624	145	10	508	2004-09-01	\N	0	\N	\N
665	118	10	494	2019-09-01	\N	0	\N	\N
666	144	11	526	2018-08-30	\N	0	\N	\N
686	452	11	526	2016-09-01	\N	0	\N	\N
730	500	1	482	2020-09-01	2021-08-30	0	\N	\N
769	300	21	488	2007-07-11	2017-07-31	0	\N	\N
770	300	10	494	2008-09-01	2017-07-31	2	\N	\N
771	300	10	494	2017-08-01	\N	0	\N	\N
781	114	10	527	2014-09-01	2018-08-31	0	\N	\N
782	114	11	516	2018-09-01	\N	0	\N	\N
783	169	10	541	2013-09-09	\N	0	\N	\N
790	505	11	488	2020-09-01	\N	0	\N	\N
791	427	24	541	2019-12-02	2020-10-18	0	\N	\N
792	427	11	541	2020-02-03	2020-10-18	2	\N	\N
793	427	11	541	2020-10-19	\N	0	\N	\N
794	476	14	516	2009-09-29	2011-08-31	0	\N	\N
795	476	11	488	2011-09-01	2011-09-18	0	\N	\N
796	476	11	488	2011-09-19	2016-08-31	2	\N	\N
797	476	11	488	2016-09-01	\N	0	\N	\N
798	476	25	516	2011-09-19	2016-08-31	0	\N	\N
799	142	19	550	2015-04-20	\N	0	\N	\N
800	142	10	494	2015-09-01	\N	2	\N	\N
801	506	11	488	2020-09-15	\N	0	\N	\N
802	199	19	488	2021-06-01	\N	0	\N	\N
803	199	10	494	2015-09-01	\N	2	\N	\N
804	199	8	541	2007-10-08	2014-03-05	0	\N	\N
805	199	21	488	2014-03-06	2020-12-31	0	\N	\N
806	199	26	488	2021-01-01	2021-05-31	0	\N	\N
807	421	10	536	2018-09-03	\N	0	\N	\N
808	421	27	555	2011-09-01	2018-09-02	0	\N	\N
809	421	10	536	2011-09-01	2018-09-02	2	\N	\N
812	94	10	494	2005-09-01	\N	0	\N	\N
814	68	11	488	1987-09-01	\N	0	\N	\N
815	540	3	510	2021-04-22	\N	0	\N	\N
817	124	11	526	2019-09-01	\N	0	\N	\N
818	7	11	488	2005-10-12	\N	0	\N	\N
842	342	10	483	2016-09-01	\N	0	\N	\N
858	384	11	488	1994-03-11	\N	0	\N	\N
859	218	10	494	2015-09-01	\N	0	\N	\N
860	454	11	488	1997-09-01	2009-09-01	0	\N	\N
861	454	32	516	2009-09-01	\N	0	\N	\N
862	454	11	488	2009-09-01	\N	2	\N	\N
863	170	19	516	2016-09-01	\N	0	\N	\N
864	170	33	516	2010-06-01	2011-01-08	0	\N	\N
865	170	26	516	2011-01-09	2016-09-01	0	\N	\N
866	170	11	516	2012-09-03	\N	2	\N	\N
868	172	20	490	2020-09-21	\N	0	\N	\N
869	172	25	516	2019-01-07	2020-09-20	0	\N	\N
873	171	11	516	2020-09-01	\N	0	\N	\N
874	171	23	531	1992-06-15	2020-08-31	0	\N	\N
875	171	11	531	1992-06-15	2020-08-31	2	\N	\N
876	273	10	494	2016-09-01	\N	0	\N	\N
878	470	10	536	2017-01-02	\N	0	\N	\N
881	492	11	526	2014-09-01	\N	0	\N	\N
882	256	10	508	2017-09-01	\N	0	\N	\N
883	385	11	488	2005-09-07	\N	0	\N	\N
885	127	10	529	2011-01-17	\N	0	\N	\N
889	228	11	526	2011-08-31	\N	0	\N	\N
890	451	10	541	2003-01-02	\N	0	\N	\N
891	251	10	531	2009-08-18	\N	0	\N	\N
892	217	11	488	2004-09-01	\N	0	\N	\N
905	405	8	550	2015-09-01	2018-09-02	0	\N	\N
906	405	10	494	2016-09-01	2019-08-31	2	\N	\N
907	405	19	586	2018-09-03	2019-08-31	0	\N	\N
908	405	10	494	2019-09-01	\N	0	\N	\N
913	387	11	526	2015-09-01	\N	0	\N	\N
914	456	10	536	2017-09-01	\N	0	\N	\N
915	408	10	483	2000-03-15	\N	0	\N	\N
917	188	11	488	2017-09-01	\N	0	\N	\N
919	11	10	494	2006-09-01	\N	0	\N	\N
926	332	11	488	2003-01-02	\N	0	\N	\N
928	161	10	526	2014-09-01	\N	0	\N	\N
929	515	11	488	2014-09-01	\N	0	\N	\N
930	173	10	541	2003-01-02	2012-09-30	0	\N	\N
931	173	19	541	2012-10-01	2013-06-10	0	\N	\N
932	173	10	541	2012-10-01	2013-06-10	2	\N	\N
933	173	10	541	2013-06-11	2015-10-07	0	\N	\N
934	173	10	541	2015-10-08	\N	2	\N	\N
935	173	36	500	2015-10-08	\N	0	\N	\N
936	154	10	541	2020-02-11	\N	0	\N	\N
940	28	10	529	2019-09-01	\N	0	\N	\N
946	136	11	488	1999-09-01	\N	0	\N	\N
947	495	10	500	2016-10-17	\N	0	\N	\N
948	371	11	488	2003-01-02	\N	0	\N	\N
950	368	11	488	2017-09-01	\N	0	\N	\N
952	489	39	550	2009-09-28	\N	0	\N	\N
953	263	10	483	2002-09-02	\N	0	\N	\N
954	242	16	526	2016-04-19	2017-08-31	0	\N	\N
955	242	10	526	2016-09-01	2017-08-31	2	\N	\N
956	242	10	526	2017-09-01	\N	0	\N	\N
957	135	14	516	2018-03-05	\N	0	\N	\N
967	550	21	483	2021-09-13	2022-01-19	0	\N	\N
969	552	56	555	2021-09-08	\N	0	\N	\N
970	52	10	500	2017-10-23	\N	0	\N	\N
971	150	11	488	2008-09-01	\N	0	\N	\N
974	123	10	531	2010-09-01	\N	0	\N	\N
975	87	10	494	2019-09-01	\N	0	\N	\N
976	215	11	488	2008-09-01	\N	0	\N	\N
977	294	25	516	2017-09-01	\N	0	\N	\N
979	344	25	516	2016-09-01	\N	0	\N	\N
981	330	11	488	1992-01-22	\N	0	\N	\N
984	548	10	526	2021-09-20	2022-06-30	0	\N	\N
985	177	10	483	2007-09-03	\N	0	\N	\N
986	162	19	512	2017-08-28	\N	0	\N	\N
989	519	19	550	2020-09-14	2020-12-13	0	\N	\N
990	519	43	550	2020-12-14	\N	0	\N	\N
991	520	10	529	2020-09-01	\N	0	\N	\N
992	232	11	526	2011-09-01	\N	0	\N	\N
993	153	32	516	2013-09-09	\N	0	\N	\N
994	153	11	488	2013-09-09	\N	2	\N	\N
995	206	34	499	2019-10-01	\N	0	\N	\N
996	493	11	488	2001-09-03	\N	0	\N	\N
997	243	19	508	2016-09-01	\N	0	\N	\N
998	243	10	508	2005-08-22	\N	2	\N	\N
999	243	44	529	2005-08-22	2006-05-14	0	\N	\N
1000	243	26	529	2006-05-15	2010-10-28	0	\N	\N
1001	243	24	529	2010-10-29	2015-08-31	0	\N	\N
1002	243	26	529	2015-09-01	2016-08-31	0	\N	\N
1006	252	10	483	2012-09-03	2014-08-31	2	\N	\N
1007	252	10	483	2014-09-01	\N	0	\N	\N
1008	252	21	555	2004-10-28	2014-08-31	0	\N	\N
1009	522	10	526	2020-09-01	\N	0	\N	\N
1010	42	11	527	2014-09-01	2019-08-31	0	\N	\N
1011	42	11	488	2019-09-01	\N	0	\N	\N
1017	362	11	488	2003-09-01	\N	0	\N	\N
1020	291	11	488	2006-09-01	\N	0	\N	\N
1021	524	19	512	2020-09-21	\N	0	\N	\N
1022	129	10	483	2013-09-13	\N	0	\N	\N
1023	525	10	500	2021-01-04	\N	0	\N	\N
1035	313	10	483	2013-09-02	\N	0	\N	\N
1043	314	11	488	2017-09-01	\N	0	\N	\N
1044	245	10	541	2010-09-01	\N	0	\N	\N
1047	230	11	488	2009-09-01	\N	0	\N	\N
1053	326	19	536	2018-08-30	\N	0	\N	\N
1054	326	11	488	2018-08-30	\N	2	\N	\N
1055	297	11	488	2016-09-26	\N	0	\N	\N
1056	57	11	488	1998-09-01	\N	0	\N	\N
1068	393	10	483	2019-09-15	\N	0	\N	\N
1069	393	10	483	2011-09-01	2019-09-14	2	\N	\N
1070	393	49	482	2006-05-22	2011-08-31	0	\N	\N
1071	393	50	482	2011-09-01	2019-09-14	0	\N	\N
1072	175	10	494	2013-09-02	\N	0	\N	\N
1073	61	11	488	2017-01-02	\N	0	\N	\N
1074	257	10	531	2018-09-01	\N	0	\N	\N
1075	412	10	529	2013-08-28	\N	0	\N	\N
1085	189	11	516	2018-08-28	\N	0	\N	\N
1086	526	10	526	2020-09-07	\N	0	\N	\N
1087	298	19	526	2018-08-24	2020-10-11	0	\N	\N
1088	298	20	526	2020-10-12	\N	0	\N	\N
1089	301	10	723	2016-09-01	\N	0	\N	\N
1090	527	36	500	2020-09-03	\N	0	\N	\N
1091	527	10	541	2020-09-03	\N	2	\N	\N
1093	403	10	541	2003-01-02	\N	0	\N	\N
1094	469	10	541	2003-01-02	2013-01-01	0	\N	\N
1095	469	20	541	2013-01-02	2016-08-31	0	\N	\N
1096	469	25	541	2016-09-01	2016-10-01	0	\N	\N
1097	469	10	541	2013-01-02	2016-09-30	2	\N	\N
1098	469	10	541	2016-10-01	\N	0	\N	\N
1100	220	10	541	2003-01-02	\N	0	\N	\N
1104	241	30	500	2011-09-01	\N	0	\N	\N
1105	241	10	531	2009-08-18	\N	2	\N	\N
1106	241	31	531	2009-08-18	2011-08-31	0	\N	\N
1107	181	19	531	2009-08-18	2012-09-10	0	\N	\N
1108	181	10	531	2009-08-18	\N	2	\N	\N
1109	181	20	531	2012-09-11	2016-08-31	0	\N	\N
1110	181	19	531	2016-09-01	\N	0	\N	\N
1112	360	10	531	2009-08-18	\N	0	\N	\N
1113	361	10	531	2008-08-18	\N	0	\N	\N
1117	24	10	541	2003-01-02	\N	0	\N	\N
1119	238	11	488	1998-09-01	\N	0	\N	\N
1132	391	16	488	1991-01-07	1993-01-03	0	\N	\N
1133	391	10	483	1993-01-04	1996-09-17	0	\N	\N
1134	391	10	483	1996-09-18	\N	2	\N	\N
1135	391	58	654	1996-09-18	2009-05-19	0	\N	\N
1136	391	26	483	2009-05-20	2016-08-31	0	\N	\N
1137	391	19	483	2016-09-01	\N	0	\N	\N
1138	485	10	483	2015-09-01	\N	0	\N	\N
1140	309	10	494	1999-09-13	\N	0	\N	\N
1141	528	10	512	2020-09-15	\N	0	\N	\N
1142	428	11	488	2020-02-03	\N	0	\N	\N
1143	453	11	488	2016-09-01	\N	0	\N	\N
1144	176	25	516	2013-01-23	\N	0	\N	\N
1145	338	10	541	2003-01-02	\N	0	\N	\N
1147	100	10	494	1999-09-01	2020-08-31	2	\N	\N
1148	100	7	488	1996-12-11	2008-09-14	0	\N	\N
1149	100	26	488	2008-09-15	2016-08-31	0	\N	\N
1150	100	19	488	2016-09-01	2020-08-31	0	\N	\N
1151	100	10	494	2020-09-01	\N	0	\N	\N
1155	197	59	555	1994-03-14	2011-09-01	0	\N	\N
1156	197	18	555	2011-09-01	\N	0	\N	\N
1157	197	10	494	1999-01-25	\N	2	\N	\N
1158	370	10	488	2002-01-07	2005-08-31	0	\N	\N
1159	370	10	494	2005-09-01	\N	2	\N	\N
1160	370	46	514	2005-09-01	\N	0	\N	\N
1164	115	24	488	2015-01-08	\N	0	\N	\N
1165	115	11	516	2018-09-01	\N	2	\N	\N
1168	287	17	500	2016-04-01	\N	0	\N	\N
1169	287	10	541	2016-10-24	\N	2	\N	\N
1172	461	17	500	2019-09-02	\N	0	\N	\N
1173	461	10	500	2019-09-02	\N	2	\N	\N
1174	77	42	482	2019-12-17	\N	0	\N	\N
1175	77	10	483	2020-10-12	\N	2	\N	\N
1183	106	53	500	2014-03-06	\N	0	\N	\N
1184	106	11	516	2018-09-01	\N	2	\N	\N
1185	106	21	500	2007-12-06	2009-08-31	0	\N	\N
1186	106	23	544	2009-09-01	2014-03-05	0	\N	\N
1187	106	23	544	2014-03-06	2017-08-16	2	\N	\N
1188	379	11	488	2019-09-02	2020-03-15	0	\N	\N
1189	379	21	483	2020-03-16	2021-08-31	0	\N	\N
1190	379	11	488	2020-03-16	2021-08-31	2	\N	\N
1191	379	11	488	2021-09-01	\N	0	\N	\N
1199	137	19	527	2014-09-01	2016-08-31	0	\N	\N
1200	137	10	527	2016-09-01	2018-03-11	0	\N	\N
1201	137	11	516	2019-09-01	\N	0	\N	\N
1202	137	19	527	2018-03-12	2019-06-28	0	\N	\N
1203	137	10	527	2014-09-01	2016-08-31	2	\N	\N
1204	137	10	527	2018-08-12	2019-06-28	2	\N	\N
1205	137	10	527	2019-06-29	2019-08-31	0	\N	\N
1215	38	53	499	2019-09-03	\N	0	\N	\N
1216	38	10	494	2019-09-03	\N	2	\N	\N
1218	152	10	529	2016-09-09	\N	0	\N	\N
1222	248	10	526	2010-09-06	2010-12-31	0	\N	\N
1223	248	48	526	2011-01-01	\N	0	\N	\N
1224	248	10	526	2011-01-01	\N	2	\N	\N
1225	437	23	544	1985-03-18	2009-12-31	0	\N	\N
1226	437	20	544	2010-01-01	2016-08-31	0	\N	\N
1227	437	19	544	2016-09-01	\N	0	\N	\N
1228	437	11	488	1985-03-18	\N	2	\N	\N
1229	56	10	531	2014-09-01	\N	0	\N	\N
1245	148	23	490	2014-09-01	\N	0	\N	\N
1247	438	11	490	2014-09-01	\N	0	\N	\N
1251	308	42	490	2014-09-01	\N	0	\N	\N
1252	308	10	490	2014-09-01	\N	2	\N	\N
1253	490	10	490	2014-09-01	\N	0	\N	\N
1254	119	10	490	2014-09-01	\N	0	\N	\N
1255	88	10	527	2014-09-01	2017-07-30	0	\N	\N
1256	88	20	527	2017-07-31	\N	0	\N	\N
1257	88	10	527	2017-07-31	\N	2	\N	\N
1258	249	16	483	2010-10-01	2011-08-31	0	\N	\N
1259	249	48	555	2011-09-01	2013-06-28	0	\N	\N
1260	249	21	483	2013-06-29	\N	0	\N	\N
1261	249	10	483	2018-09-03	\N	2	\N	\N
1263	66	10	500	1977-09-29	\N	0	\N	\N
1264	303	21	488	2006-02-03	2014-08-31	0	\N	\N
1265	303	10	494	2006-02-03	2014-08-31	2	\N	\N
1266	303	10	494	2014-09-01	\N	0	\N	\N
1269	553	61	555	2021-09-30	2022-05-06	0	\N	\N
1271	383	10	531	2014-09-05	\N	0	\N	\N
1272	541	3	512	2021-04-06	\N	0	\N	\N
1273	167	11	488	2018-09-01	\N	0	\N	\N
1275	125	10	541	2003-01-02	2021-08-31	0	\N	\N
1276	125	11	488	2021-09-01	\N	0	\N	\N
1277	555	13	500	2021-09-26	2022-09-26	0	\N	\N
1278	556	63	555	2021-09-29	2022-05-06	0	\N	\N
1279	530	11	516	2020-09-01	\N	0	\N	\N
1294	121	11	516	2019-10-10	\N	0	\N	\N
1295	377	10	541	2011-09-01	2015-08-31	0	\N	\N
1296	377	26	541	2015-09-01	2016-08-31	0	\N	\N
1297	377	19	541	2016-09-01	\N	0	\N	\N
1298	377	10	541	2015-09-01	\N	2	\N	\N
1299	67	10	541	2016-11-24	\N	0	\N	\N
1300	546	55	500	2021-09-22	2022-09-21	0	\N	\N
1301	203	19	510	2000-08-01	2001-09-30	0	\N	\N
1302	203	20	510	2001-10-01	2009-08-31	0	\N	\N
1303	203	21	510	2009-09-01	2010-01-31	0	\N	\N
1304	203	53	510	2010-02-01	2010-08-31	0	\N	\N
1305	203	19	510	2010-09-01	2012-08-27	0	\N	\N
1306	203	38	494	2012-08-28	2016-08-31	0	\N	\N
1307	203	19	494	2016-09-01	\N	0	\N	\N
1308	203	11	488	2001-10-01	\N	2	\N	\N
1311	292	10	494	2007-09-11	\N	0	\N	\N
1312	62	34	499	2018-09-14	2021-08-31	0	\N	\N
1313	62	11	516	2021-09-01	\N	0	\N	\N
1314	21	11	526	2015-09-01	\N	0	\N	\N
1326	213	19	550	2014-01-21	2014-08-31	0	\N	\N
1327	213	60	654	2014-09-01	\N	0	\N	\N
1328	185	48	482	2008-02-01	2011-08-31	0	\N	\N
1329	185	64	482	2011-09-01	2013-10-23	0	\N	\N
1330	185	50	482	2013-10-24	2014-12-31	0	\N	\N
1331	185	26	482	2015-01-01	2018-09-02	0	\N	\N
1332	185	65	482	2018-09-03	\N	0	\N	\N
1333	185	10	483	2008-02-01	2015-08-31	2	\N	\N
1334	185	10	483	2020-09-01	\N	2	\N	\N
1344	103	10	541	2007-09-03	2009-11-01	0	\N	\N
1345	103	20	541	2009-11-02	2011-08-31	0	\N	\N
1346	103	66	654	2011-09-01	2012-04-22	0	\N	\N
1347	103	67	654	2012-04-23	\N	0	\N	\N
1348	103	10	541	2009-11-02	2015-08-31	2	\N	\N
1349	8	33	516	2020-03-02	\N	0	\N	\N
1353	378	11	488	2008-09-01	\N	0	\N	\N
1354	44	11	488	2016-09-01	\N	0	\N	\N
1355	231	10	723	2009-09-12	\N	0	\N	\N
1356	58	10	490	2014-09-01	\N	0	\N	\N
1357	532	10	483	2020-09-01	\N	0	\N	\N
1358	531	11	488	2016-09-05	\N	0	\N	\N
1359	418	10	526	2015-09-01	\N	0	\N	\N
1360	43	11	488	2015-09-01	\N	0	\N	\N
1371	35	11	488	2017-01-02	\N	0	\N	\N
1372	108	11	488	1989-11-15	\N	0	\N	\N
1376	76	10	529	2000-09-01	\N	0	\N	\N
1377	254	11	488	2018-09-01	\N	0	\N	\N
1383	510	24	555	2009-09-21	2021-08-31	0	\N	\N
1384	510	11	488	2014-09-01	2021-08-31	2	\N	\N
1385	510	28	561	2009-06-15	2009-09-20	0	\N	\N
1386	510	10	488	2021-09-01	\N	0	\N	\N
1387	510	21	555	2009-03-19	2009-06-14	0	\N	\N
1388	180	10	483	1995-01-23	1998-01-04	0	\N	\N
1389	180	26	483	1998-01-05	2001-05-02	0	\N	\N
1390	180	10	483	1998-01-05	2001-05-02	2	\N	\N
1391	180	10	483	2001-05-03	2012-09-11	0	\N	\N
1392	180	19	483	2012-09-12	2013-09-01	0	\N	\N
1393	180	10	483	2012-09-12	2013-09-01	2	\N	\N
1394	180	10	483	2013-09-02	\N	0	\N	\N
1395	504	10	483	2020-09-01	\N	0	\N	\N
1396	448	11	488	2013-09-09	\N	0	\N	\N
1399	409	29	529	2020-09-01	\N	0	\N	\N
1400	409	11	516	2018-11-20	2020-08-31	0	\N	\N
1401	409	10	529	2020-09-01	\N	2	\N	\N
1408	255	23	544	2000-08-01	\N	0	\N	\N
1409	255	11	488	2000-08-01	2021-08-31	2	\N	\N
1410	508	11	723	2021-02-08	2021-08-31	0	\N	\N
1411	508	10	723	2021-09-01	\N	0	\N	\N
1412	235	10	526	2019-09-01	\N	0	\N	\N
1413	69	19	541	2003-01-02	\N	0	\N	\N
1414	69	10	541	2003-01-02	2021-08-31	2	\N	\N
1415	147	23	544	1982-07-12	\N	0	\N	\N
1416	147	11	488	1982-07-12	2021-08-31	2	\N	\N
1432	237	8	490	2014-09-01	2020-05-08	0	\N	\N
1433	237	10	490	2014-09-01	2021-08-31	2	\N	\N
1434	237	5	490	2020-05-09	\N	0	\N	\N
1435	84	11	488	1995-02-06	2000-10-01	0	\N	\N
1436	84	45	510	2000-10-02	2007-09-02	0	\N	\N
1437	84	19	510	2007-09-03	2013-09-30	0	\N	\N
1438	84	11	488	2000-10-02	2013-09-30	2	\N	\N
1439	84	11	488	2013-10-01	2021-08-31	0	\N	\N
1440	84	10	488	2021-09-01	\N	0	\N	\N
1441	98	52	654	2002-12-11	\N	0	\N	\N
1442	98	38	488	1999-05-10	2002-12-10	0	\N	\N
1443	98	11	488	1978-11-02	1999-05-09	0	\N	\N
1444	98	11	488	1999-05-10	2021-08-31	2	\N	\N
1445	48	20	529	2000-09-01	2016-08-31	0	\N	\N
1446	48	19	529	2016-09-01	\N	0	\N	\N
1447	48	10	529	2011-09-01	2021-08-31	2	\N	\N
1448	430	19	550	2019-09-02	2021-08-31	0	\N	\N
1449	430	25	516	2021-09-01	\N	0	\N	\N
1450	430	10	494	2019-09-02	2021-08-31	2	\N	\N
1451	430	11	516	2021-09-01	\N	2	\N	\N
1452	45	7	488	1994-11-11	2009-10-09	0	\N	\N
1453	45	20	772	2009-10-10	2016-08-31	0	\N	\N
1454	45	19	772	2016-09-01	2019-08-31	0	\N	\N
1455	45	68	512	2019-09-01	\N	0	\N	\N
1456	45	10	494	1994-11-11	2021-08-31	2	\N	\N
1457	445	20	586	2009-09-02	2016-08-31	0	\N	\N
1458	445	19	586	2016-09-01	2018-09-02	0	\N	\N
1459	445	34	499	2018-09-03	\N	0	\N	\N
1460	445	11	488	2011-09-01	2021-08-31	2	\N	\N
1461	295	10	490	2014-09-01	\N	0	\N	\N
1464	557	34	499	2021-09-10	\N	0	\N	\N
1465	78	10	512	2021-09-01	\N	0	\N	\N
1466	331	11	488	2002-06-25	\N	0	\N	\N
1468	205	19	550	2018-01-02	2018-09-02	0	\N	\N
1469	205	35	550	2018-09-03	\N	0	\N	\N
1471	558	46	514	2021-10-14	2022-10-13	0	\N	\N
1472	559	7	499	2021-10-12	2022-10-11	0	\N	\N
1473	560	21	494	2021-10-11	2022-10-10	0	\N	\N
1479	223	11	536	2003-01-10	\N	0	\N	\N
1482	116	51	648	2016-11-15	\N	0	\N	\N
1483	116	11	516	2017-09-01	\N	2	\N	\N
1484	536	5	490	2021-06-21	2021-10-15	0	\N	\N
1485	516	10	483	2020-09-01	2021-10-15	0	\N	\N
1486	549	6	496	2021-09-14	2021-10-15	0	\N	\N
1487	514	14	516	2020-09-14	2021-09-13	0	\N	\N
1488	372	13	500	2020-02-24	2021-10-04	0	\N	\N
1489	511	10	529	2020-03-01	2021-08-26	0	\N	\N
1490	112	11	488	2018-01-08	2021-09-30	0	\N	\N
1491	290	42	482	2019-10-01	\N	0	\N	\N
1492	111	11	490	2021-09-01	\N	0	\N	\N
1493	509	11	490	2021-09-01	\N	0	\N	\N
1494	425	11	490	2021-09-01	\N	0	\N	\N
1495	471	23	544	1987-07-22	\N	0	\N	\N
1497	325	69	500	2016-10-17	\N	0	\N	\N
1501	431	14	527	2014-09-01	\N	0	\N	\N
1502	186	56	490	2014-09-01	\N	0	\N	\N
1503	547	11	488	2021-09-21	2022-06-30	0	\N	\N
1507	146	5	490	2014-09-01	\N	0	\N	\N
1508	348	15	490	2014-09-01	\N	0	\N	\N
1509	23	10	793	2017-09-01	\N	0	\N	\N
1510	488	18	531	2012-09-04	\N	0	\N	\N
1511	46	10	494	2019-09-01	\N	0	\N	\N
1512	239	16	500	2018-02-05	\N	0	\N	\N
1513	503	10	494	2020-09-01	\N	0	\N	\N
1514	126	10	529	2002-09-02	\N	0	\N	\N
1515	110	10	490	2014-09-01	\N	0	\N	\N
1516	537	6	496	2010-02-19	\N	0	\N	\N
1518	561	10	510	2021-09-01	2022-06-30	0	\N	\N
1519	543	5	496	2021-05-24	2021-10-08	0	\N	\N
1520	250	13	526	2019-11-27	\N	0	\N	\N
1522	306	7	499	2019-06-04	\N	0	\N	\N
1523	397	41	526	2019-03-13	2021-10-18	0	\N	\N
1524	545	1	482	2021-04-01	2022-06-30	0	\N	\N
1526	22	10	510	2013-09-02	\N	0	\N	\N
1528	420	9	514	2015-08-04	\N	0	\N	\N
1529	563	56	555	2013-09-02	\N	0	\N	\N
1530	562	10	526	2021-09-01	2022-06-30	0	\N	\N
1531	564	11	490	2021-10-18	\N	0	\N	\N
1532	551	5	490	2021-09-09	2021-11-01	0	\N	\N
1535	565	10	526	2021-11-01	2022-06-30	0	\N	\N
1540	502	1	482	2014-01-01	2021-08-31	0	\N	\N
1580	5	40	524	1212-02-12	\N	0	\N	\N
1581	5	14	524	1212-02-12	\N	2	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, surname, personal_code, email, email_verified_at, password, remember_token, created_at, updated_at, phone, gender, education_type, grade, qual, edu, rights, courses, short_courses, category, status, agreement, agreement_date, comment, archived, birthdate) FROM stdin;
5	Agnese	Bedi??e	221077-12006	agnese.bedike@rvt.lv	\N	secret	\N	\N	2021-09-29 08:18:17	29591838	0	35	542	\N	1	1	1	1	0	0	1-2-14/63	2020-09-17	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 21.08.2000.	0	1977-10-22
7	Agris	B??manis	110763-10501	agris.bumanis@rvt.lv	\N	secret	\N	\N	2021-09-17 07:30:51	29105338	1	35	517	666	1	1	1	1	0	0	05/90	2005-10-12	\N	0	1963-07-11
8	A??da	Vanaga	091060-11762	aida.vanaga@rvt.lv	\N	secret	\N	\N	2021-10-04 08:09:06	29178602	0	35	\N	764	1	1	1	1	0	0	1-2-14/10	2020-03-02	\N	0	1960-10-09
9	Aigars	Kreituzis	\N	aigars.kreituzis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
11	Aija	Ivane	300956-10327	aija.ivane@rvt.lv	\N	secret	\N	\N	2021-09-21 09:05:33	26138435	0	35	\N	592	1	1	1	1	0	0	06/69	2006-09-01	\N	0	1956-09-30
15	Aina	Motiv??ne	151062-12506	aina.motivane@rvt.lv	\N	secret	\N	\N	2021-10-04 11:52:44	29405786	0	35	517	638	1	1	1	1	0	0	1-2-14/113	2021-08-31	\N	0	1962-10-15
20	Aivars	Br??ni????	\N	aivars.brunins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
21	Aivars	Vagalis	060166-10223	aivars.vagalis@rvt.lv	\N	secret	\N	\N	2021-10-04 05:14:55	26144293	1	35	517	762	1	1	1	1	0	0	01.2-14/57	2015-09-01	\N	0	1966-01-06
22	Aivis	??va	100484-11589	aivis.ava@rvt.lv	\N	secret	\N	\N	2021-10-19 12:03:15	22145980	1	14	\N	533	1	1	1	1	0	0	13/29	2013-08-28	\N	0	1984-04-10
23	Alberts	Andersons	080652-10428	alberts.andersons@rvt.lv	\N	secret	\N	\N	2021-10-18 09:50:59	29248348	1	35	517	518	1	1	1	1	0	0	01.2-14/43	2017-09-01	\N	0	1952-06-08
24	Aldis	R??ters	140664-10609	aldis.ruters@rvt.lv	\N	secret	\N	\N	2021-09-23 12:45:42	29395260	1	11	\N	728	1	1	1	1	0	0	8/128	2008-09-15	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 01.09.1974.	0	1964-06-14
25	Aldis	Teko	\N	aldis.teko@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
26	Aleksandrs	??etirkins	\N	aleksandrs.cetirkins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
27	Aleksandrs	Knohs	\N	aleksandrs.knohs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
28	Aleksejs	Karhu	150986-10650	aleksejs.karhu@rvt.lv	\N	secret	\N	\N	2021-09-21 11:27:36	24974355	1	35	689	604	1	1	1	1	0	0	01.2-14/47	2019-08-30	\N	0	1986-09-15
29	Alfons	Gaigals	\N	alfons.gaigals@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
30	Alina	Vestfale	\N	alina.vestfale@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
31	Al??na	Kuz??ecova	\N	alina.kuznecova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
32	Alisa	L??ce	\N	alisa.lace@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
33	Alla	Dimitrijeva	\N	alla.dimitrijeva@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
34	Alla	??teimaka	\N	alla.steimaka@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
35	Alla	Zhuchenko	301062-12755	alla.zhuchenko@rvt.lv	\N	secret	\N	\N	2021-10-04 11:16:08	22490716	0	35	773	774	1	1	1	1	0	0	01.02-14/96	2016-12-29	\N	0	1962-10-30
36	Alvine	Siballo	\N	alvine.siballo@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
37	Anastasija	Mah??ova	\N	anastasija.mahnova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
38	Anastasija	Solovei??ika	300795-10617	anastasija.soloveicika@rvt.lv	\N	secret	\N	\N	2021-09-28 12:45:08	29938481	0	35	743	493	1	1	1	1	1	1	01.2-14/52	2019-09-03	Stud?? RTU B??vuz????m??jdarb??bas un nekustam?? ??pa??uma vad????ana	0	1995-07-30
39	Anatolijs	Garjutkins	\N	anatolijs.garjutkins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
40	Anatolijs	Zukulis	1111111-11111	anatolijs.zukulis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	\N	2021-01-01	\N	0	2021-01-01
41	Anda	Uztice	\N	anda.uztice@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
42	Anda	Neimane	080160-12521	anda.neimane@rvt.lv	\N	secret	\N	\N	2021-09-22 10:37:10	26161723	0	35	\N	639	1	1	1	1	0	0	14/85	2014-08-29	\N	0	1960-01-08
43	Andis	Zavadskis	300972-12357	andis.zavadskis@rvt.lv	\N	secret	\N	\N	2021-10-04 10:43:19	28268378	1	35	771	\N	1	1	1	1	0	0	01.02.-14/48	2015-09-01	\N	0	1972-09-30
44	Andra	V??rtina	291269-10114	andra.vartina@rvt.lv	\N	secret	\N	\N	2021-10-04 08:51:09	26899038	0	35	766	\N	1	1	1	1	0	0	01.2-14/37	2016-09-01	\N	0	1969-12-29
45	Andra	Zen??aka	210873-10901	andra.zencaka@rvt.lv	\N	secret	\N	\N	2021-10-05 11:40:24	27260001	0	35	761	\N	1	1	1	1	0	0	06/54	2006-08-28	\N	0	1973-08-21
46	Andrejs	Andmanis	240280-10128	andrejs.andmanis@rvt.lv	\N	secret	\N	\N	2021-10-18 09:57:34	28167718	1	35	517	519	1	1	1	1	0	0	01.2-14/48	2019-08-30	\N	0	1980-02-24
47	Andrejs	Melderis	250257-12452	andrejs.melderis@rvt.lv	\N	secret	\N	\N	2021-08-20 07:54:26	26243610	1	11	\N	637	1	1	1	1	0	0	01.2-14/65	2018-09-17	\N	0	1957-02-25
48	Andrejs	St??ris	011254-10025	andrejs.sturis@rvt.lv	\N	secret	\N	\N	2021-10-05 11:31:50	20370863	1	35	\N	747	1	1	1	1	0	0	06/01	2006-01-02	\N	0	1954-12-01
49	Andrejs	Viku??ins	\N	andrejs.vikulins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
50	Andris	D??delis	\N	andris.dudelis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
51	Andris	??ezbers	\N	andris.kezbers@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
52	Andris	Kurlovi??s	250163-12166	andris.kurlovics@rvt.lv	\N	secret	\N	\N	2021-09-22 09:10:44	27123978	1	35	517	587	1	1	1	1	0	0	01.2-14/66	2017-10-20	\N	0	1963-01-25
53	Andris	Lagzdi????	311058-10686	andris.lagzdins@rvt.lv	\N	secret	\N	\N	2021-08-18 09:31:35	29166680	1	14	\N	618	1	1	1	1	0	0	11/44	2011-08-31	\N	0	1958-10-31
54	Andris	Rozanovs	280152-10137	andris.rozanovs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
55	Andris	Sp??lmanis	\N	andris.spelmanis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
56	Andris	Strauti????	280655-12758	andris.strautins@rvt.lv	\N	secret	\N	\N	2021-09-29 07:08:17	29823852	1	35	\N	588	1	1	1	1	0	0	14/30	2014-08-27	\N	0	1955-06-28
57	Andris Viktors	Purkalns	180335-10900	andris.purkalns@rvt.lv	\N	secret	\N	\N	2021-09-22 12:01:31	29420718	1	35	\N	645	1	1	1	1	0	0	04/56	2004-04-01	\N	0	1935-03-18
58	Andris	Vimba	150960-11566	andris.vimba@rvt.lv	\N	secret	\N	\N	2021-10-04 09:18:42	29351994	1	35	\N	767	1	1	1	1	0	0	14/41	2014-08-27	P??r??emtas darba tiesisk??s attiec??bas iepriek?? str??d??ja no 15.03.2010.	0	1960-09-15
59	Anita	??boli??a	280356-10621	anita.abolina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
60	Anita	Kri??mane	\N	anita.krismane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
61	Anita	Rek????a	131256-10711	anita.reksna@rvt.lv	\N	secret	\N	\N	2021-09-22 12:19:20	29378790	0	35	517	714	1	1	1	1	0	0	01.2-14/93	2016-12-29	\N	0	1956-12-13
62	Anita	Umbra??ko	310587-12759	anita.umbrasko@rvt.lv	\N	secret	\N	\N	2021-10-01 12:05:08	29886369	0	35	690	607	1	1	1	1	0	0	1-2-14/105	2021-08-26	\N	0	1987-05-31
63	Anita	??igalova	280255-11961	anita.zigalova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
64	Anna	Pu??karjova	\N	anna.puskarjova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
65	Anna	Spalve	\N	anna.spalve@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
66	Ansis	Sv??rpstons	110346-14451	ansis.svarpstons@rvt.lv	\N	secret	\N	\N	2021-09-29 12:07:09	27162530	1	35	\N	588	1	1	1	1	0	0	04/57	2004-04-01	\N	0	1946-03-11
67	Antons	Timofejevs	161092-10105	antons.timofejevs@rvt.lv	\N	secret	\N	\N	2021-10-01 11:10:40	27302086	1	11	\N	547	1	1	1	1	0	0	01.2-14/88	2011-11-24	\N	0	1993-10-16
68	Antra	Br??mane	140460-11846	antra.bremane@rvt.lv	\N	secret	\N	\N	2021-09-17 07:07:40	29121543	0	35	664	\N	1	1	1	1	0	0	04/61	2004-04-01	\N	0	1960-04-14
69	??rija	??erpinska	300848-12951	arija.cerpinska@rvt.lv	\N	secret	\N	\N	2021-10-05 10:53:52	29536779	0	14	\N	562	1	1	1	1	0	0	1-2-14/45	2020-08-31	\N	0	1948-08-30
70	??rija	Geiba	\N	arija.geiba@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
71	??rijs	Petrovs	300571-12730	arijs.petrovs@rvt.lv	\N	secret	\N	\N	2021-08-30 08:55:29	29221708	1	40	\N	\N	1	1	1	1	0	0	01.2-14/2	2020-01-16	\N	0	1971-05-30
72	??ris	Vanags	271288-12412	aris.vanags@rvt.lv	\N	secret	\N	\N	2021-08-17 12:07:53	22304871	1	14	\N	538	0	1	0	0	0	1	12/53	2012-10-09	\N	1	1988-12-27
73	Arita	Andendorfa	\N	arita.andendorfa@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
74	Arita	O??i??a	\N	arita.osina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
75	Armands	Ezeri????	\N	armands.ezerins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
76	Armands	??ebers	190248-12055	armands.zebers@rvt.lv	\N	secret	\N	\N	2021-10-04 11:37:28	26331817	1	35	671	\N	1	1	1	1	0	0	07/17	2000-08-29	\N	0	1948-02-19
77	Arnolds	??irsis	180594-11580	arnolds.kirsis@rvt.lv	\N	secret	\N	\N	2021-09-24 11:18:13	27335380	1	14	\N	615	1	1	1	1	1	1	01.2-14/88	2019-12-17	\N	0	1994-05-18
78	Artis	??rglis	120467-10533	artis.erglis@rvt.lv	\N	secret	\N	\N	2021-10-06 09:17:49	29516722	1	11	\N	\N	1	1	1	1	0	0	1-2-14/121.1	2021-09-01	ESF 8.4.1.	0	1967-04-12
79	Artjoms	Kar??evskis	\N	artjoms.karcevskis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
80	Art??rs	B??rzi????	\N	arturs.berzins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
81	Art??rs	Sedli????	\N	arturs.sedlins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
82	Arvids	Gailans	\N	arvids.gailans@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
83	Astr??da	Tima	\N	astrida.tima@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
84	Atis	Papins	130468-10053	atis.papins@rvt.lv	\N	secret	\N	\N	2021-10-05 11:25:20	29536116	1	35	708	\N	1	1	1	1	0	0	06/09	2007-09-03	\N	0	1968-04-13
85	Ausma	Kalni??a	\N	ausma.kalnina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
86	Baiba	Burkhardte	\N	baiba.burkhardte@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
87	Baiba	Lapinska	010464-10705	baiba.lapinska@rvt.lv	\N	secret	\N	\N	2021-09-22 09:19:12	29407688	0	35	\N	620	1	1	1	1	0	0	01.2-14/49	2019-08-30	\N	0	1964-04-01
88	Baiba	Purlica	150681-12511	baiba.purlica@rvt.lv	\N	secret	\N	\N	2021-09-29 11:27:48	27808440 ,28664996	0	35	690	607	1	1	1	1	0	0	14/83	2014-08-29	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 01.02.2000.	0	1981-06-15
89	Baiba	Putni??a	\N	baiba.putnina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
90	Benita	Legzdi??a	\N	benita.legzdina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
91	Biruta	????vele	041167-11954	biruta.savele@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
92	Biruta	Vizule	171268-11951	biruta.vizule@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
93	Brigita	Birkane	\N	brigita.birkane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
94	Brigita	Br??eska	300471-12753	brigita.brzeska@rvt.lv	\N	secret	\N	\N	2021-09-17 07:07:01	29512049	0	35	664	\N	1	1	1	1	0	0	05/54	2005-09-01	\N	0	1971-04-30
95	??eslava	Godap??tere	\N	ceslava.godapetere@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
96	Dace	K??rkle	\N	dace.karkle@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
97	Dace	L??ce	\N	dace.lace@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
98	Dace	Rozenblate	010657-11212	dace.rozenblate@rvt.lv	\N	secret	\N	\N	2021-10-05 11:28:09	27260013	0	35	664	\N	1	1	1	1	2	0	7/126	2007-11-13	\N	0	1957-06-01
99	Dace	Salta	\N	dace.salta@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
100	Dace	Skut??ne	050473-12902	dace.skutane@rvt.lv	\N	secret	\N	\N	2021-09-24 10:59:27	26351710	0	14	\N	742	1	1	1	1	0	0	1-2-14/46	2020-08-31	\N	0	1973-04-05
101	Dace	Hibnere	\N	dace.hibnere@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
102	Dagm??ra	L??ce	\N	dagmara.lace@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
103	Dagnija	Vanaga	311264-12505	dagnija.vanaga@rvt.lv	\N	secret	\N	\N	2021-10-04 08:02:46	27260006	0	35	517	763	1	1	1	1	2	0	14-15/4	2012-04-23	Ieg??st doktora gr??du.	0	1964-12-31
104	Daiga	Kante	020963-11961	daiga.kante@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
105	Daiga	Purklava	\N	daiga.purklava@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
106	Daiga	Rozent??le	040765-10110	daiga.rozentale@rvt.lv	\N	secret	\N	\N	2021-09-24 11:20:08	27260011	0	40	\N	\N	1	1	1	1	1	1	7/149	2007-12-06	\N	0	1965-07-04
107	Daiga	Silar??ja	291169-11631	daiga.silaraja@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
108	Daiga	Ziedi??a	161063-13117	daiga.ziedina@rvt.lv	\N	secret	\N	\N	2021-10-04 11:22:34	29894485	0	35	775	\N	1	1	1	1	0	0	04/23	2001-01-05	\N	0	1963-10-16
109	Daina	Br??ni??a	\N	daina.brunina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
110	Dainis	Augusts	301056-12001	dainis.augusts@rvt.lv	\N	secret	\N	\N	2021-10-18 10:11:26	22018110	1	35	532	\N	1	1	1	1	0	0	1-2-14/42	2020-08-31	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 21.12.1978.	0	1956-10-30
111	Dainis	Kr??ms	070254-12004	dainis.krums@rvt.lv	\N	secret	\N	\N	2021-10-15 10:07:49	20268676	1	35	517	859	1	1	1	1	0	0	1-2-14/118	2021-09-01	\N	0	1954-02-07
112	Dana	Kirmu??ka	221181-12006	dana.kirmuska@rvt.lv	\N	secret	\N	\N	2021-10-15 09:19:04	26009280	0	35	664	\N	1	1	1	1	0	0	01.2-14/3	2018-01-05	\N	1	1981-11-22
113	Danute	Gr??nfelde	\N	danute.grinfelde@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
114	Di??na	Bark??ne	210370-12500	diana.barkane@rvt.lv	\N	secret	\N	\N	2021-09-16 12:04:55	28719052	0	14	\N	538	1	1	1	1	0	0	14/87	2014-08-29	\N	0	1970-03-21
115	Di??na	Grosberga	080873-11588	diana.grosberga@rvt.lv	\N	secret	\N	\N	2021-09-24 11:15:23	29403688	0	40	\N	\N	1	1	1	1	1	1	1-2-14/69	2021-01-19	\N	0	1973-08-08
116	Di??na	Kau??ele-Miez??te	270477-11214	diana.kauselemiezite@rvt.lv	\N	secret	\N	\N	2021-10-14 08:09:26	26816616	0	35	813	486	1	1	1	1	1	1	01.2-14/86	2016-11-15	\N	0	1977-04-27
117	Di??na	Roga??eva	\N	diana.rogaleva@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
118	Di??na	Rogo??eva	190488-13108	diana.rogoleva@rvt.lv	\N	secret	\N	\N	2021-09-13 11:20:52	28803719	0	14	\N	650	1	1	1	1	0	0	01.2-14/43	2019-08-30	\N	0	1988-04-19
119	Dina	Spro??e	020862-12038	dina.sproge@rvt.lv	\N	secret	\N	\N	2021-09-29 11:24:43	29523831	0	35	689	\N	1	1	1	1	0	0	14/46	2014-08-27	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 05.03.1986.	0	1962-08-02
120	Dina	Spunde	\N	dina.spunde@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
121	Dita	Tiesnese	250770-10604	dita.tiesnese@rvt.lv	\N	secret	\N	\N	2021-10-01 10:45:16	29469162	0	35	\N	596	1	1	1	1	0	0	01.2-14/76	2019-10-09	\N	0	1970-07-25
122	Dmitrijs	Du??kins	\N	dmitrijs.duskins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
123	Dzintars	Laiz??ns	150262-13111	dzintars.laizans@rvt.lv	\N	secret	\N	\N	2021-09-22 09:17:36	28231813	1	35	694	619	1	1	1	1	0	0	10/68	2010-09-06	\N	0	1962-02-15
124	Dzintra	Bukevi??a	260565-12407	dzintra.bukevica@rvt.lv	\N	secret	\N	\N	2021-09-17 07:22:02	28708103	0	35	517	558	1	1	1	1	0	0	01.2-14/50	2019-08-30	\N	0	1965-05-26
125	Dzintra	??mite	101264-12713	dzintra.smite@rvt.lv	\N	secret	\N	\N	2021-10-01 08:55:05	29728832	0	14	\N	562	1	1	1	1	0	0	1-2-14/110	2021-08-30	P??r??emtas darba tiesisk??s attiec??bas pirms no 27.02.1995.	0	1964-12-10
126	Edgars	Aper??ns	100654-11222	edgars.aperans@rvt.lv	\N	secret	\N	\N	2021-10-18 10:07:09	29277198	1	35	659	\N	1	1	1	1	0	0	682	2002-09-02	\N	0	1954-06-10
127	Edgars	Geislers	300484-10509	edgars.geislers@rvt.lv	\N	secret	\N	\N	2021-09-21 06:20:30	29693012	1	35	678	679	1	1	1	1	0	0	11/3	2012-01-10	\N	0	1984-04-30
128	Edgars	Leit??ns	\N	edgars.leitans@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
129	Edgars	Olehnovi??s	231190-11287	edgars.olehnovics@rvt.lv	\N	secret	\N	\N	2021-09-22 11:04:48	29358659	1	35	707	642	1	1	1	1	0	0	13/60	2013-09-13	Turpina m??c??bas LU, Ma??istra studiju programma.	0	1990-11-23
130	Ed??te	Lisenoka	\N	edite.lisenoka@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
131	Eduards	Akulis	\N	eduards.akulis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
132	Eleonora	Bark??ne	230957-11958	eleonora.barkane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
133	Elga	Upeniece	\N	elga.upeniece@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
134	El??na	??er??e	120182-11956	elina.kerge@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
135	El??na	Kuple	130779-11711	elina.kuple@rvt.lv	\N	secret	\N	\N	2021-09-22 06:41:16	29477178	0	35	693	\N	1	1	1	1	0	0	01.2-14/15	2018-03-05	\N	0	1979-07-13
136	Elita	Kazak??vi??a	131263-10104	elita.kazakevica@rvt.lv	\N	secret	\N	\N	2021-09-21 11:39:11	29133510	0	35	682	\N	1	1	1	1	0	0	7/136	2007-11-27	\N	0	1963-12-13
137	Elita	Sniedzi??a	280462-12506	elita.sniedzina@rvt.lv	\N	secret	\N	\N	2021-09-24 12:05:14	28714153	0	35	671	\N	1	1	1	1	0	0	14/78	2014-08-29	\N	0	1962-04-28
138	Elma	Rudz??te	\N	elma.rudzite@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
139	Em??lija	??abina	\N	emilija.zabina@ervt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
140	??rika	Goba	\N	erika.goba@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
141	??riks	Livzenieks	\N	eriks.livzenieks@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
142	Eva	Bl??ma	190462-10952	eva.bluma@rvt.lv	\N	secret	\N	\N	2021-09-17 06:08:33	29111235	0	35	660	549	1	1	1	1	0	0	1-2-14/47	2020-08-31	\N	0	1962-04-19
143	Everita	L??rina	311054-10922	everita.lurina@rvt.lv	\N	secret	\N	\N	2021-09-22 10:01:44	29643382	0	35	577	632	1	1	1	1	0	0	01.2-14/48	2016-09-05	\N	1	1954-10-01
144	Evita	Romanovska - Dzalbe	250994-11142	evita.romanovska@rvt.lv	\N	secret	\N	\N	2021-09-13 11:27:00	27040590	0	35	517	651	1	1	1	1	0	0	01.2-14/46	2018-08-30	\N	0	1994-09-25
145	Felikss	Pavlovskis	140244-10539	felikss.pavlovskis@rvt.lv	\N	secret	\N	\N	2021-08-30 08:34:33	26189099	1	35	517	528	1	1	1	1	0	0	06/03	2006-01-02	\N	0	1944-02-14
146	Ga??ina	Avdejeva	200972-12024	galina.avdejeva@rvt.lv	\N	secret	\N	\N	2021-10-18 09:48:35	26553678	0	11	\N	870	0	1	0	0	0	1	1-2-14/48	2021-01-04	P??r??emtas darba tiesisk??s attiec??bas. Iepriek?? str??d??ja no 05.09.2006.	0	1972-09-20
147	Ga??ina	Gluhova	151249-11802	galina.gluhova@rvt.lv	\N	secret	\N	\N	2021-10-05 10:58:54	28770064	0	35	539	\N	1	1	1	1	0	0	878	2006-10-02	\N	0	1949-12-15
148	Ga??ina	Hitraja	240256-12000	galina.hitraja@rvt.lv	\N	secret	\N	\N	2021-09-29 08:19:26	25954944	0	35	\N	590	1	1	1	1	0	0	14/62	2014-08-27	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 08.01.2013.	0	1956-02-24
149	Ga??ina	Sereda	\N	galina.sereda@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
150	Gene	??ere	090354-10044	gene.kere@rvt.lv	\N	secret	\N	\N	2021-09-22 09:12:59	25911443	0	35	664	\N	1	1	1	1	0	0	8/91	2008-09-01	\N	0	1954-03-09
151	Gints	Feldbergs	211174-18172	gints.feldbergs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
152	Gints	Spruncis	251190-12211	gints.spruncis@rvt.lv	\N	secret	\N	\N	2021-09-28 12:46:05	29624035	1	35	744	745	1	1	1	1	0	0	01.2-14/60	2016-09-09	\N	0	1990-11-25
153	??irts	Magone	070887-11933	girts.magone@rvt.lv	\N	secret	\N	\N	2021-09-22 10:03:39	29642590	1	35	702	\N	1	1	1	1	0	0	13/57	2013-09-09	\N	0	1987-08-07
154	Gundega	Kalendra	231070-10551	gundega.kalendra@rvt.lv	\N	secret	\N	\N	2021-09-21 10:57:00	26644555	0	35	664	\N	1	1	1	1	0	0	1-2-14/7	2020-02-11	\N	0	1970-10-23
155	Gunita	????ni??a	\N	gunita.kenina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
156	Gunta	Berdigane	\N	gunta.berdigane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
157	Gunta	Blauma	\N	gunta.blauma@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
158	Gunta	Gromula	\N	gunta.gromula@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
159	Gunta	??irse	\N	gunta.kirse@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
160	Guntars	Bern??ts	\N	guntars.bernats@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
161	Guntars	Jeminejs	140260-10678	guntars.jeminejs@rvt.lv	\N	secret	\N	\N	2021-09-21 10:29:32	28252309	1	40	\N	\N	1	1	1	1	0	0	14/33	2014-08-27	\N	0	1960-02-14
162	Guntars	Loba	070568-12748	guntars.loba@rvt.lv	\N	secret	\N	\N	2021-09-22 09:41:46	29555700	1	35	664	698	1	1	1	1	0	0	01.2-14/19	2017-08-28	\N	0	1968-05-07
163	Guntars	Reveli????	\N	guntars.revelins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
164	Guntis	Ja??p??ters	\N	guntis.janpeters@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
165	Guntis	Kaufmanis	\N	guntis.kaufmanis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
166	Guntis	Namnieks	\N	guntis.namnieks@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
167	Hel??na	??imkuva	010957-10130	helena.simkuva@rvt.lv	\N	secret	\N	\N	2021-10-01 08:17:23	26486332	0	35	674	\N	1	1	1	1	0	0	01.2-14/38	2018-08-20	\N	0	1957-09-01
168	Henrihs	Dombrovskis	\N	henrihs.dombrovskis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
169	Ieva	Be??ere	111156-10620	ieva.becere@rvt.lv	\N	secret	\N	\N	2021-09-16 12:06:27	29491355	0	522	\N	540	1	1	1	1	0	0	13/54	2013-09-06	\N	0	1956-11-11
170	Ieva	Dorila	220170-10414	ieva.dorila@rvt.lv	\N	secret	\N	\N	2021-09-20 12:03:19	28809496	0	35	672	570	1	1	1	1	0	0	10/39	2010-05-31	\N	0	1970-01-22
171	Ieva	D??dele	190365-10628	ieva.dudele@rvt.lv	\N	secret	\N	\N	2021-09-20 12:21:13	29541906	0	35	674	\N	1	1	1	1	0	0	1-2-14/43	2020-08-31	\N	0	1965-03-19
172	Ieva - L??ga	Du??evska	240475-13054	ieva.dulevska@rvt.lv	\N	secret	\N	\N	2021-09-20 12:08:58	29119107	0	35	673	573	1	1	1	1	0	0	01.2-14/01	2019-01-04	\N	0	1975-04-24
173	Ieva	Jurgevica	010770-11088	ieva.jurgevica@rvt.lv	\N	secret	\N	\N	2021-09-21 10:53:33	29119148	0	35	686	\N	1	1	1	1	0	1	1-2-14/76	2021-01-19	\N	0	1970-07-01
174	Ieva	Leimane	\N	ieva.leimane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
175	Ieva	Rebi??a	080181-10627	ieva.rebina@rvt.lv	\N	secret	\N	\N	2021-09-22 12:11:31	28358031	0	35	712	713	1	1	1	1	0	0	13/43	2013-08-30	\N	0	1981-01-08
176	Ieva	S??le	160385-12850	ieva.sile@rvt.lv	\N	secret	\N	\N	2021-09-24 09:58:39	29451579	0	35	738	739	1	1	1	1	0	0	13/6	2013-01-23	\N	0	1985-03-16
177	Igors	Litvjakovs	120779-11450	igors.litvjakovs@rvt.lv	\N	secret	\N	\N	2021-09-22 09:38:27	28725870	1	35	\N	624	1	1	1	1	0	0	8/32	2008-01-21	\N	0	1979-07-12
178	Igors	Lu??ovs	091278-11283	igors.lusovs@rvt.lv	\N	secret	\N	\N	2021-08-19 11:32:56	27000837	1	35	\N	631	1	1	1	1	0	0	1-2-14/82	2021-02-24	\N	0	1978-12-09
179	Ilgvars	Forands	\N	ilgvars.forands@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
180	Ilona	Dem??enko	021174-10900	ilona.demcenko@rvt.lv	\N	secret	\N	\N	2021-10-05 05:11:31	29790361	0	35	670	\N	1	1	1	1	0	0	7/100	2007-10-15	\N	0	1974-11-02
181	Ilona	Grivane	250370-11629	ilona.grivane@rvt.lv	\N	secret	\N	\N	2021-09-23 08:25:38	20370853	0	35	682	\N	1	1	1	1	0	0	9/52	2009-08-18	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 26.08.1994.	0	1970-03-25
182	Ilona	Stepi??a	010986-12421	ilona.stepina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
183	Ilona	Var??ecka	300763-12519	ilona.varnecka@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
184	Iluta	Balule	130369-11969	iluta.balule@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
185	Ilvars	Tauri????	110485-12253	ilvars.taurins@rvt.lv	\N	secret	\N	\N	2021-10-04 05:43:02	28677666	1	35	663	\N	1	1	1	1	2	0	8/41	2018-08-31	Turpina studijas programm?? Kiberdro????bas in??enierija.	0	1985-04-11
186	Ilze	And????ne	090461-12018	ilze.andzane@rvt.lv	\N	secret	\N	\N	2021-10-18 09:27:40	29901755	0	871	\N	872	0	1	0	0	0	1	1-2-14/32	2021-01-04	\N	0	1961-04-09
187	Ilze	Elksn??te	\N	ilze.elksnite@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
188	Ilze	Holste	220172-10010	ilze.holste@rvt.lv	\N	secret	\N	\N	2021-09-21 09:01:32	29324371	0	35	671	\N	1	1	1	1	0	0	01.2-14/30	2017-08-29	\N	0	1972-01-22
189	Ilze	Rudaka	081064-10638	ilze.rudaka@rvt.lv	\N	secret	\N	\N	2021-09-23 05:27:17	29844908	0	35	520	717	1	1	1	1	0	0	01.2-14/36	2018-08-28	\N	0	1964-10-08
190	Ilze	Seipule	\N	ilze.seipule@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
191	Ilze	Zandersone	\N	ilze.zandersone@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
192	Ina ingr??da	Migla	100435-11812	ina.migla@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
193	Ina	J??valde	200369-11809	ina.javalde@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
194	Ina	Kr??ze	040962-12508	ina.kruze@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
195	Inara	Racenko	\N	inara.racenko@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
196	In??ra	Veismane	\N	inara.veismane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
197	Indra	Sloka	241260-10623	indra.sloka@rvt.lv	\N	secret	\N	\N	2021-09-24 11:13:02	27260005, 29748056	0	14	\N	562	1	1	1	1	1	1	8/150	2012-01-13	\N	0	1960-12-24
198	Inese	Blanka	\N	inese.blanka@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
199	Inese	Bra??a	110688-11808	inese.braza@rvt.lv	\N	secret	\N	\N	2021-09-17 06:23:56	27260016	0	35	517	553	1	1	1	1	0	0	1-2-14/66	2021-01-19	\N	0	1988-06-11
200	Inese	L??smane	\N	inese.lismane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
201	Inese	Logina	\N	inese.logina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
202	Inese	Pl??me	\N	inese.plume@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
203	Inese	Tiona	150668-12741	inese.tiona@rvt.lv	\N	secret	\N	\N	2021-10-01 11:47:52	29807231, 28809486	0	35	517	759	1	1	1	1	0	0	06/11	2006-01-26	P??rceltas darba tiesisk??s  attiec??bas pirms tam no 01.09.1998.	0	1968-06-15
204	Inese	V??rslav??ne	280764-10001	inese.varslavane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
205	Ineta	??v??ne	150371-12252	ineta.ivane@rvt.lv	\N	secret	\N	\N	2021-10-06 12:44:57	25916635	0	35	671	\N	1	1	1	1	2	0	01.2-14/01	2018-01-02	\N	0	1971-03-15
206	Ineta	Ma??inovska	140773-11016	ineta.malinovska@rvt.lv	\N	secret	\N	\N	2021-09-22 10:16:47	29256691	0	35	690	607	1	1	1	1	0	0	01.2-14/72	2019-09-30	\N	0	1973-07-14
207	Ineta	Pugovi??a	\N	ineta.pugovica@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
208	Ineta	Sku??enkova	\N	ineta.skucenkova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
209	Ineta	Strauti??a	\N	ineta.strautina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
210	Ineta	Urt??ne	190371-12824	ineta.urtane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
211	Inga	Bulaha	\N	inga.bulaha@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
212	Inga	Karlberga	291075-12508	inga.karlberga@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
213	Inga	??ikova	100566-10211	inga.sikova@rvt.lv	\N	secret	\N	\N	2021-10-04 05:42:42	29194365, 20011907	0	35	664	\N	1	1	1	1	2	0	14/2	2014-01-21	\N	0	1966-05-10
214	Inga	V??vere	\N	inga.vevere@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
215	Ingr??da	Lasinska	180766-10311	ingrida.lasinska@rvt.lv	\N	secret	\N	\N	2021-09-22 09:20:56	26013593	0	35	\N	596	1	1	1	1	0	0	8/90	2008-09-01	\N	0	1966-07-18
216	Ing??na	Br??di??a	\N	inguna.bridina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
217	Inna	Gri??i??eva	230581-10918	inna.griniceva@rvt.lv	\N	secret	\N	\N	2021-09-21 07:47:00	29917136	0	35	681	\N	1	1	1	1	0	0	06/73	2006-09-14	\N	0	1981-05-23
218	Inta	Dobele	040956-11646	inta.dobele@rvt.lv	\N	secret	\N	\N	2021-09-20 11:57:47	26130567	0	35	671	\N	1	1	1	1	0	0	01.2-14/45	2015-09-01	\N	0	1956-09-04
219	Inta	Kr??ze	\N	inta.kruze@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
220	Inta	R??tere	090167-10623	inta.rutere@rvt.lv	\N	secret	\N	\N	2021-09-23 07:58:54	26511468	0	11	\N	727	1	1	1	1	0	0	792	2003-01-02	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 01.09.1974.	0	1967-01-09
221	Inta	Za??kalna	\N	inta.zalkalna@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
222	Ira	Meik????na	\N	ira.meiksuna@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
223	Ir??na	Balti??a	210841-10904	irena.baltina@rvt.lv	\N	secret	\N	\N	2021-10-13 12:15:11	27095721	0	35	551	535	1	1	1	1	0	0	823	2003-06-02	\N	0	1941-08-21
224	Ir??na	Ungure	\N	irena.ungure@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
225	Irina	Bak??utova	\N	irina.baksutova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
226	Irina	??istova	\N	irina.cistova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
227	Irina	Fjodorova	\N	irina.fjodorova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
228	Irina	Gon??arova	050168-12410	irina.goncarova@rvt.lv	\N	secret	\N	\N	2021-09-21 07:39:35	22304231	0	35	\N	581	1	1	1	1	0	0	11/48	2011-08-31	\N	0	1968-01-05
229	Irina	Kovsova	130976-11951	irina.kovsova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
230	Irina	P??tersone	100753-11823	irina.petersone@rvt.lv	\N	secret	\N	\N	2021-09-22 11:41:17	29340578	0	35	\N	581	1	1	1	1	0	0	9/107	2009-09-08	\N	0	1953-07-10
231	Irina	Vdovi??a	220661-12724	irina.vdovica@rvt.lv	\N	secret	\N	\N	2021-10-04 09:03:11	29606075	0	35	676	\N	1	1	1	1	0	0	9/125	2009-09-18	\N	0	1961-06-22
232	Ivans	Luk??a	240678-12406	ivans.luksa@rvt.lv	\N	secret	\N	\N	2021-09-22 09:56:25	28480818	1	35	\N	630	1	1	1	1	0	0	11/50	2011-08-31	\N	0	1978-06-24
233	Ivars	Sokolovs	\N	ivars.sokolovs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
234	Ivars	Svarinskis	\N	ivars.svarinskis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
235	Iveta	Balule	140671-12400	iveta.balule@rvt.lv	\N	secret	\N	\N	2021-10-05 10:49:44	29735880	0	35	517	537	1	1	1	1	0	0	01.2-14/51	2019-09-02	\N	0	1971-06-14
236	Iveta	??irse	\N	iveta.kirse@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
237	Iveta	Kundrate	300559-12021	iveta.kundrate@rvt.lv	\N	secret	\N	\N	2021-10-05 11:18:42	29554908	0	40	\N	\N	0	1	0	0	0	1	1-2-14/52	2021-01-04	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 23.07.1979.	0	1959-05-30
238	Iveta	R??ti??a	270667-10639	iveta.rutina@rvt.lv	\N	secret	\N	\N	2021-09-24 06:54:47	28377684	0	35	517	595	1	1	1	1	0	0	04/70	2004-04-14	\N	0	1967-06-27
239	J??nis	Arkls	140779-11521	janis.arkls@rvt.lv	\N	secret	\N	\N	2021-10-18 09:58:55	29246869	1	35	660	\N	0	1	0	0	1	1	01.2-14/9	2018-02-02	\N	0	1979-07-14
240	J??nis	Da??eckis	\N	janis.daleckis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
241	J??nis	D??rznieks	240649-10107	janis.darznieks@rvt.lv	\N	secret	\N	\N	2021-09-23 08:24:40	29635810	1	522	\N	564	1	1	1	1	0	1	9/59	2012-01-16	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 16.11.1971.	0	1949-06-24
242	J??nis	Kuklis	230696-12120	janis.kuklis@rvt.lv	\N	secret	\N	\N	2021-09-22 06:35:14	26572418	1	14	\N	692	1	1	1	1	0	0	01.2-14/14	2017-09-04	\N	0	1996-06-23
243	J??nis	Markus	221082-10024	janis.markus@rvt.lv	\N	secret	\N	\N	2021-09-22 10:23:38	29516636	1	35	703	704	1	1	1	1	0	0	05/44	2011-12-19	\N	0	1982-10-22
244	J??nis	Motiv??ns	\N	janis.motivans@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
245	J??nis	Pavlovskis	270280-10703	janis.pavlovskis@rvt.lv	\N	secret	\N	\N	2021-09-22 11:37:42	29114687	1	35	622	644	1	1	1	1	0	0	10/65	2010-09-01	\N	0	1980-02-27
246	J??nis	Ratnieks	\N	janis.ratnieks@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
247	J??nis	Sprav??iks	\N	janis.spravniks@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
248	J??nis	Stepi????	221084-12400	janis.stepins@rvt.lv	\N	secret	\N	\N	2021-09-29 06:25:15	65621281, 28377235	1	35	746	\N	1	1	1	1	1	1	10/82	2012-02-20	\N	0	1984-10-22
249	Jekaterina	Suvorova	180989-10032	jekaterina.suvorova@rvt.lv	\N	secret	\N	\N	2021-09-29 11:52:48	22166008	0	35	707	\N	1	1	1	1	1	1	10/104	2012-02-20	\N	0	1989-09-18
250	Je??ena	Andrijevska	110567-12423	jelena.andrijevska@rvt.lv	\N	secret	\N	\N	2021-10-18 10:27:18	26410499	0	40	\N	\N	0	1	0	0	0	1	01.2-14/86	2019-11-27	\N	0	1967-05-11
251	Je??ena	Gri??evska	250762-11228	jelena.grinevska@rvt.lv	\N	secret	\N	\N	2021-09-21 07:43:19	22368465	0	35	680	\N	1	1	1	1	0	0	9/57	2009-08-18	\N	0	1962-07-25
252	Je??ena	Matvejeva	170776-12760	jelena.matvejeva@rvt.lv	\N	secret	\N	\N	2021-09-22 10:26:20	26334690	0	35	663	\N	1	1	1	1	0	0	04/167	2011-12-19	\N	0	1975-07-17
253	Je??ena	Zaiceva	\N	jelena.zaiceva@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
254	Je??ena	??ukova	230454-12730	jelena.zukova@rvt.lv	\N	secret	\N	\N	2021-10-04 11:42:21	27013084	0	35	\N	777	1	1	1	1	0	0	01.2-14/35	2018-08-28	\N	0	1954-04-23
255	Jevge??ija	Beigarte	050769-14400	jevgenija.beigarte@rvt.lv	\N	secret	\N	\N	2021-10-05 10:44:33	29713710	0	35	517	543	1	1	1	1	0	0	7/157	2007-12-11	\N	0	1969-07-05
256	Jevg????ijs	Garbuzs	211183-12767	jevgenijs.garbuzs@rvt.lv	\N	secret	\N	\N	2021-09-21 06:11:48	28220095	1	35	506	576	1	1	1	1	0	0	01.2-14/27	2017-08-29	\N	0	1983-11-21
257	Jevge??ijs	Ri??evs	271284-10018	jevgenijs.rilevs@rvt.lv	\N	secret	\N	\N	2021-09-22 12:22:26	29532961	1	35	715	627	1	1	1	1	0	0	01.2-14/56	2018-08-31	\N	0	1984-12-27
258	Jolanta	Plaude	\N	jolanta.plaude@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
259	Jolanta	Skotele	\N	jolanta.skotele@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
260	J??lija	Mi??elsone	\N	julija.mikelsone@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
261	J??lija	Orlova	\N	julija.orlova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
262	Jurijs	Glazkovs	030579-10704	jurijs.glazkovs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
263	Jurijs	Kudrins	041168-10506	jurijs.kudrins@rvt.lv	\N	secret	\N	\N	2021-09-22 06:31:35	29246648	1	35	577	611	1	1	1	1	0	0	698	2002-09-02	\N	0	1968-11-04
264	Juris	B??rzi????	\N	juris.berzins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
265	Juris	Gur??enoks	\N	juris.gurcenoks@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
266	Juris	Kondrovs	\N	juris.kondrovs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
267	Juris	Madel??ns	\N	juris.madelans@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
268	Juris	Za??is	\N	juris.zakis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
269	Kalvis	Ceizi????	\N	kalvis.ceizins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
270	Rvt	Kanceleja	\N	kanceleja@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
271	K??rlis	Jautai??is	\N	karlis.jautaikis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
272	K??rlis	Sprav??iks	\N	karlis.spravniks@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
273	Karmena	Freimane	040982-11904	karmena.freimane@rvt.lv	\N	secret	\N	\N	2021-09-20 12:26:51	29142274	0	35	675	\N	1	1	1	1	0	0	01.2-14/41	2016-09-01	\N	0	1982-09-04
274	Kaspars	??ins	\N	kaspars.sins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
275	Katr??na elizabete	S??le	\N	katrina.sile@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
276	Katr??na	K??rkle	\N	katrina.karkle@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
277	Katrine	Jansone	\N	katrine.jansone@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
278	Kintija	Putni??a-vizule	\N	kintija.putnina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
279	Kl??ra	Paipala	\N	klara.paipala@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
280	Klavdija	Naidjonova	\N	klavdija.naidjonova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
281	Klavdija	??ilova	\N	klavdija.silova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
282	Klavdija	Stavicka	\N	klavdija.stavicka@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
283	Konstantins	Zajakins	\N	konstantins.zajakins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
284	Krista	Za??kalne	\N	krista.zalkalne@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
285	Kristers	Dzenis	\N	kristers.dzenis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
286	Kristina	Barabanscikova	\N	kristina.barabanscikova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
287	Krist??ne	Kalni??a	120570-10807	kristine.kalnina@rvt.lv	\N	secret	\N	\N	2021-09-24 11:15:59	29279065	0	35	517	601	1	1	1	1	1	1	01.2-14/09	2016-03-30	\N	0	1970-05-12
288	Krist??ne	Kazak??vi??a	\N	kristine.kazakevica@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
289	Krist??ne	Pu??pure	\N	kristine.puspure@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
290	Krists Kristens	Jesikens	250900-21017	krists.jesikens@rvt.lv	\N	secret	\N	\N	2021-10-15 09:29:08	26758538	1	11	\N	858	0	1	0	0	0	1	01.2-14/71	2019-09-30	Turpina m??c??bas RTU, programma - Datorzin??tnes un inform??cijas tehnolo??ijas.	0	2000-09-25
291	Laila	Ozoli??a	240858-13146	laila.ozolina@rvt.lv	\N	secret	\N	\N	2021-09-22 10:55:59	29721552	0	35	539	662	1	1	1	1	0	0	06/57	2006-09-01	\N	0	1958-08-24
292	Laila	Umbra??ko	150387-11097	laila.umbrasko@rvt.lv	\N	secret	\N	\N	2021-10-01 11:57:12	22029163	0	35	761	\N	1	1	1	1	0	0	8/88	2007-08-29	\N	0	1987-03-15
293	Laila	V??tola	\N	laila.vitola@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
294	Laima brigita	Lasmane	310742-11217	laimabrigita.lasmane@rvt.lv	\N	secret	\N	\N	2021-09-22 09:22:38	29355853	0	35	671	\N	1	1	1	1	0	0	01.2-14/48	2017-09-01	\N	0	1942-07-31
295	Laimrota	Surska	010160-12044	laimrota.surska@rvt.lv	\N	secret	\N	\N	2021-10-05 12:35:09	29550412	0	35	682	\N	1	1	1	1	0	0	14/50	2014-08-29	P??r??emtas darba att. iepriek?? str??d??ja no 03.09.1987.	0	1960-01-01
296	Larisa	Iznova	\N	larisa.iznova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
297	Larisa	Preisa	031259-10010	larisa.preisa@rvt.lv	\N	secret	\N	\N	2021-09-22 11:56:06	29388834	0	35	517	571	1	1	1	1	0	0	01.2-14/66	2016-09-23	\N	0	1959-12-03
298	Larisa	Rukmane	280776-12406	larisa.rukmane@rvt.lv	\N	secret	\N	\N	2021-09-23 06:53:57	26568587	0	35	\N	720	1	1	1	1	0	0	01.2-14/33	2018-08-23	\N	0	1976-07-28
299	Larisa	????unceva	\N	larisa.slunceva@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
300	L??sma	Balceraite	180786-11975	lasma.balceraite@rvt.lv	\N	secret	\N	\N	2021-09-16 11:31:11	27186081	0	35	661	\N	1	1	1	1	0	0	07/38	2011-12-16	\N	0	1986-07-18
301	Lauma	Rusele	140678-10639	lauma.rusele@rvt.lv	\N	secret	\N	\N	2021-09-23 07:05:12	26198332	0	35	721	722	1	1	1	1	0	0	01.2-14/39	2016-09-01	\N	0	1978-06-14
302	Lauris	Kamparz??le	240982-10504	lauris.kamparzale@rvt.lv	\N	secret	\N	\N	2021-08-06 09:12:29	22064785	1	522	\N	602	1	1	1	1	0	1	01.2-14/59	2019-09-23	\N	0	1982-09-24
303	Lelde	????ra	200483-11915	lelde.sera@rvt.lv	\N	secret	\N	\N	2021-09-29 12:22:40	26391931	0	35	749	493	1	1	1	1	0	0	83	2011-12-19	\N	0	1983-04-20
304	Leokadija	Piz??ne	\N	leokadija.pizane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
305	Leon??ds	Ivanovskis	\N	leonids.ivanovskis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
306	Liena	??damsone	301272-12703	liena.adamsone@rvt.lv	\N	secret	\N	\N	2021-10-18 10:57:00	29366551	0	35	521	498	0	1	0	0	1	1	01.2-14/23	2019-05-30	\N	0	1972-12-30
307	Liene elizabete	Podkalne	\N	liene.podkalne@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
308	Liene	L??ne	110573-12018	liene.lane@rvt.lv	\N	secret	\N	\N	2021-09-29 11:23:37	29344060	0	35	622	623	1	1	1	1	1	1	14/57	2014-08-27	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 24.08.2005.	0	1973-05-11
309	Liene	Sastapa	140172-10520	liene.sastapa@rvt.lv	\N	secret	\N	\N	2021-09-24 07:59:00	29176544	0	35	732	\N	1	1	1	1	0	0	7/151	2007-12-10	\N	0	1972-01-14
310	Lien??te	Elnione	\N	lienite.elnione@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
311	L??ga	Aumeistere	\N	liga.aumeistere@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
312	L??ga	Kramp??ne	\N	liga.krampane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
313	L??ga	Paudere	070291-12762	liga.paudere@rvt.lv	\N	secret	\N	\N	2021-09-22 11:15:34	26179094	1	35	668	\N	1	1	1	1	0	0	13/27	2013-08-27	\N	0	1991-02-07
314	L??ga	Pav??re	260665-10624	liga.pavare@rvt.lv	\N	secret	\N	\N	2021-09-22 11:29:24	29474186	0	35	517	643	1	1	1	1	0	0	01.2-14/41	2017-08-30	\N	0	1965-06-26
315	Ligita	Druva	\N	ligita.druva@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
316	Ligita	Jursone	\N	ligita.jursone@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
317	Ligita	Samule	\N	ligita.samule@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
318	Lilita	Leisavniece	\N	lilita.leisavniece@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
319	Linda	Litvi??a	\N	linda.litvina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
320	Livars	Jankovskis	\N	livars.jankovskis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
321	L??vija	Ve??ik??nova	\N	livija.velikanova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
322	Lolita	Silaraja	220643-10110	lolita.silaraja@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
323	??ubova	Vol??a??ina	\N	lubova.volcanina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
324	Ludmila	Zalostiba	\N	ludmila.zalostiba@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
325	Ludmila	Mitrakova	200855-10112	ludmila.mitrakova@rvt.lv	\N	secret	\N	\N	2021-10-18 08:36:04	28226080	0	35	\N	865	0	1	0	0	0	1	1-2-14/67	2021-01-19	\N	0	1955-08-20
326	Madara	P??tersone	250276-12308	madara.petersone@rvt.lv	\N	secret	\N	\N	2021-09-22 11:52:53	22307969	0	35	665	\N	1	1	1	1	0	0	01.2-14/43	2018-08-28	\N	0	1976-02-25
327	Maija	Dreimane	\N	maija.dreimane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
328	Maija	Kuduma	\N	maija.kuduma@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
329	Maija	??u????a	\N	maija.sulga@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
330	Mairita	Lazdi??a	090555-11029	mairita.lazdina@rvt.lv	\N	secret	\N	\N	2021-09-22 09:30:37	29776061	0	35	539	\N	1	1	1	1	0	0	7/121	2007-11-09	\N	0	1955-05-09
331	M??ra	Glazjeva	290852-10014	mara.glazjeva@rvt.lv	\N	secret	\N	\N	2021-10-06 12:43:44	28201301	0	35	671	\N	1	1	1	1	0	0	04/110	2004-09-01	\N	0	1952-08-29
332	M??ra	Janevi??a	280560-11222	mara.janevica@rvt.lv	\N	secret	\N	\N	2021-09-21 10:25:10	26499003	0	35	517	595	1	1	1	1	0	0	787	2003-01-02	\N	0	1960-05-28
333	M??ra	Kina??a	\N	mara.kinaza@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
334	M??ra	Lazd??ne	\N	mara.lazdane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
335	M??ra	L??se	\N	mara.luse@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
336	Marija	Ganzina	\N	marija.ganzina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
337	Marija	Sen??enko	\N	marija.sencenko@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
338	Marija	Sjomina	300454-11813	marija.sjomina@rvt.lv	\N	secret	\N	\N	2021-09-24 10:08:09	26811765	0	14	\N	740	1	1	1	1	0	0	779	2003-01-02	P??r??emtas darba att. iepriek?? no 10.09.1975.	0	1954-04-30
339	Marina	A??e????enko	\N	marina.alescenko@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
340	Marina	Dmitrieva	\N	marina.dmitrieva@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
341	Marina	Lo??mele	\N	marina.locmele@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
342	M??ris	Danne	030291-11497	maris.danne@rvt.lv	\N	secret	\N	\N	2021-09-20 11:44:01	22140077	1	35	668	669	1	1	1	1	0	0	01.2-14/38	2016-09-01	\N	0	1991-02-03
343	M??ris	Kau??elis	\N	maris.kauselis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
344	M??ris	Lasmanis	150161-12755	maris.lasmanis@rvt.lv	\N	secret	\N	\N	2021-09-22 09:26:25	29207005	1	35	664	\N	1	1	1	1	0	0	01.2-14/47.1	2016-09-01	\N	0	1961-01-15
345	M??ris	Lo??melis	081266-12413	maris.locmelis@rvt.lv	\N	secret	\N	\N	2021-09-16 11:20:25	29716290	1	11	\N	625	1	1	1	1	0	0	01.2-14/102	2015-12-29	\N	1	1966-12-08
346	Marita	De??isova	040265-11959	marita.denisova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
347	Marita	Dusova	\N	marita.dusova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
348	M??r??te	Apine	300749-12000	marite.apine@rvt.lv	\N	secret	\N	\N	2021-10-18 09:49:29	29253499	0	14	\N	530	1	1	1	1	1	1	14/64	2014-08-27	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 01.12.1993.	0	1949-07-30
349	M??r??te	Banga	\N	marite.banga@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
350	M??r??te	K??rlsberga	\N	marite.karlsberga@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
351	M??r??te	Pudze	\N	marite.pudze@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
352	M??r??te	Tenberga	120464-12501	marite.tenberga@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
353	Marks	Millers	\N	marks.millers@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
354	Marta	De??isova	\N	marta.denisova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
355	Marta	Gaigala	\N	marta.gaigala@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
356	Marta	Marhela	\N	marta.marhela@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
357	Mihails	Jakov??evs	\N	mihails.jakovlevs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
358	Miks	Vollenbergs	\N	miks.vollenbergs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
359	Modris	Petruss	\N	modris.petruss@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
360	Nade??da	Lauhina	230275-12754	nadezda.lauhina@rvt.lv	\N	secret	\N	\N	2021-09-23 08:26:57	22187451	0	35	695	696	1	1	1	1	0	0	9/160	2009-12-30	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 01.09.2004.	0	1975-02-23
361	Nade??da	Lukja??enoka	250859-11090	nadezda.lukjanenoka@rvt.lv	\N	secret	\N	\N	2021-09-23 08:27:59	26805562	0	35	517	628	1	1	1	1	0	0	9/61	2009-08-18	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 07.11.2007.	0	1959-08-25
362	Nade??da	??i??ibicka	070472-12724	nadezda.nizibicka@rvt.lv	\N	secret	\N	\N	2021-09-22 10:39:52	29426813	0	35	664	\N	1	1	1	1	0	0	870	2003-09-01	\N	0	1972-04-07
363	Nade??da	Tarasova	010949-10501	nadezda.tarasova@rvt.lv	\N	secret	\N	\N	2021-08-17 12:01:39	27032577	0	35	\N	\N	0	1	0	0	0	1	1-2-14/95	2021-05-31	\N	1	1949-09-01
364	Nat??lija	Bodniece	\N	natalija.bodniece@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
365	Nat??lija	Kvitka	\N	natalija.kvitka@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
366	Nata??ja	Iva??kovska	220155-10319	natalja.ivaskovska@rvt.lv	\N	secret	\N	\N	2021-09-21 09:09:17	26857529	0	35	517	594	1	1	0	1	0	0	9/56	2009-09-18	\N	1	2021-12-06
367	Nata??ja	Kazakevi??a	\N	natalja.kazakevica@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
368	Nata??ja	Kova??evi??a	030280-12753	natalja.kovalevica@rvt.lv	\N	secret	\N	\N	2021-09-22 06:08:02	29174835	0	35	539	\N	1	1	1	1	0	0	01.2-14/42	2017-08-30	\N	0	1980-02-03
369	Nata??ja	Laura	\N	natalja.laura@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
370	Natalja	Paramonova	221175-10918	natalja.paramonova@rvt.lv	\N	secret	\N	\N	2021-09-24 11:14:07	29251325	0	35	710	\N	1	1	1	1	1	1	640	2011-12-05	\N	0	1975-11-22
371	Nellija	Kifa	111177-11564	nellija.kifa@rvt.lv	\N	secret	\N	\N	2021-09-22 05:59:30	29441951	0	35	684	\N	1	1	1	1	0	0	791	2003-01-02	\N	0	1977-11-11
372	Niks	Damarovskis	270701-22709	niks.damarovskis@rvt.lv	\N	secret	\N	\N	2021-10-15 08:33:24	22847662	1	753	\N	\N	0	1	0	0	0	1	1-2-14/8	2020-02-20	\N	1	2001-07-27
373	Nina	Sorina	\N	nina.sorina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
374	Nora	Vrub??evska	\N	nora.vrublevska@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
375	Normunds	Kupl??ns	\N	normunds.kuplens@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
376	Normunds	Pauders	180589-13052	normunds.pauders@rvt.lv	\N	$2y$10$0mlF4yHqcCzP1oqZP2IHTe1I.z1zS6AKkwLmYFaVVwMnAd9iCpf7S	\N	\N	2021-10-18 11:01:37	29872850	1	0	0	\N	1	1	1	1	1	1	11/25	2012-02-20	Turpina m??c??bas LU ma??istra programm??	0	1989-05-18
377	Normunds	Tilti????	160969-10507	normunds.tiltins@rvt.lv	\N	secret	\N	\N	2021-10-01 11:03:38	29256258	1	35	756	757	1	1	1	1	0	0	11/35	2011-08-29	\N	0	1969-09-16
378	Normunds	V??renbergs	240771-13051	normunds.varenbergs@rvt.lv	\N	secret	\N	\N	2021-10-04 08:45:15	26439493	1	35	702	\N	1	1	1	1	0	0	8/93	2008-09-01	\N	0	1971-07-24
379	Oksana	Roslova	021278-10414	oksana.roslova@rvt.lv	\N	secret	\N	\N	2021-09-24 11:23:13	20502168	0	35	716	\N	1	1	1	1	0	0	01.2-14/37	2019-08-30	\N	0	1978-12-02
380	O??egs	Bor????evskis	260381-10113	olegs.borscevskis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
381	O??egs	Lazarevs	\N	olegs.lazarevs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
382	O??egs	??andars	\N	olegs.sandars@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
383	O??egs	??ilovs	020548-10914	olegs.silovs@rvt.lv	\N	secret	\N	\N	2021-10-01 07:53:17	28269691	1	14	\N	562	1	1	1	1	0	0	14/135	2014-09-05	\N	0	1948-05-02
384	Olga	Dmitrijeva	210256-10300	olga.dmitrijeva@rvt.lv	\N	secret	\N	\N	2021-09-20 11:54:21	29734817	0	35	\N	567	1	1	1	1	0	0	04/54	2004-04-01	\N	0	1956-02-21
385	Olga	Geislere	300186-11238	olga.geislere@rvt.lv	\N	secret	\N	\N	2021-09-21 06:14:35	29701646	0	35	677	578	1	1	1	1	0	0	9/58	2009-08-18	\N	0	1986-01-30
386	Olga	Gogole	\N	olga.gogole@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
387	Olga	Grund??ne	060562-12422	olga.grundane@rvt.lv	\N	secret	\N	\N	2021-09-21 08:53:20	27014046	0	35	\N	587	1	1	1	1	0	0	01.2-14/60	2015-09-01	\N	0	1962-05-06
388	Olga	K??rkle	290556-12004	olga.karkle@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
389	Olga	Karpova	\N	olga.karpova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
390	Olga	Kozlovska	270281-11248	olga.kozlovska@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
391	Olga	Sabanska	151052-10701	olga.sabanska@rvt.lv	\N	secret	\N	\N	2021-09-24 07:23:52	20370859,  29450659	0	35	671	\N	1	1	1	1	0	0	04/5	2009-05-20	\N	0	1952-10-15
392	Olga	Bl??mbaha	\N	olga.blumbaha@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
393	Oskars	Putni????	160487-10148	oskars.putnins@rvt.lv	\N	secret	\N	\N	2021-09-22 12:09:07	29526469	1	35	711	\N	1	1	1	1	0	0	06/35	2012-01-17	\N	0	1987-04-16
394	Otil??ja	Fomina	\N	otilija.fomina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
395	P??rsla	Bute	\N	parsla.bute@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
396	Patr??cija	Pal??eja	\N	patricija.palceja@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
397	P??vels	Travkins	161183-12402	pavels.travkins@rvt.lv	\N	secret	\N	\N	2021-10-18 11:38:40	29582435	1	753	\N	\N	0	1	0	0	0	1	01.2-14/11	2019-03-12	\N	1	1983-11-16
398	Peteris	Zukulis	\N	peteris.zukulis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
399	Raisa	Potapenko	\N	raisa.potapenko@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
400	Raisa	Prostibo??enko	\N	raisa.prostibozenko@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
401	Raitis	Za??enieks	\N	raitis.zalenieks@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
402	Rasma	Cinovska	\N	rasma.cinovska@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
403	Rasma	Homatova	100253-12756	rasma.homatova@rvt.lv	\N	secret	\N	\N	2021-09-23 07:55:44	29785075	0	14	\N	562	1	1	1	1	0	0	781	2006-12-04	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 01.09.1972.	0	1953-02-10
404	Rayvis	Berzinsh	\N	rayvis.berzinsh@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
405	Rebeka	Gr??nfelde	130795-10903	rebeka.grinfelde@rvt.lv	\N	secret	\N	\N	2021-09-21 08:50:05	25445592	0	35	683	\N	1	1	1	1	0	0	01.2-14/56	2018-08-31	\N	0	1995-07-13
406	Ren??te	??e??e	\N	renate.keke@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
407	Renate	Neilande	291151-11085	renate.neilande@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
408	Revekka	Heimane	310748-11220	revekka.heimane@rvt.lv	\N	secret	\N	\N	2021-09-21 08:57:48	29744009	0	35	\N	589	1	1	1	1	0	0	05/11	2015-01-24	\N	0	1948-07-31
409	Rikarda	Damroze-Sprunce	160791-10305	rikarda.sprunce@rvt.lv	\N	secret	\N	\N	2021-10-05 05:57:53	22339969	0	40	\N	\N	1	1	1	1	0	0	01.2-14/87	2018-11-16	\N	0	1991-07-16
410	Rita	Maksima	\N	rita.maksima@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
411	Romualds	Jasjukevi??s	\N	romualds.jasjukevics@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
412	Romualds	Rimjans	050373-10057	romualds.rimjans@rvt.lv	\N	secret	\N	\N	2021-09-22 12:26:49	20247840	1	35	675	553	1	1	1	1	0	0	13/31	2013-08-28	\N	0	1973-03-05
413	R??dolfs jorens	Balti????-k??ava	\N	rudolfs.baltinsklava@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
414	R??dolfs	P??vul??ns	301098-11868	rudolfs.pavulens@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
415	Ruslans	Garasjuks	\N	ruslans.garasjuks@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
416	Ruta	Muskare	\N	ruta.muskare@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
417	R??ta	Cimi??a	\N	ruta.cimina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
418	Ruta	Zambare	271163-12402	ruta.zambare@rvt.lv	\N	secret	\N	\N	2021-10-04 10:22:18	29951306	0	11	\N	770	1	1	1	1	0	0	01.2-14/58	2015-09-01	\N	0	1963-11-27
419	Ruta	??anoglu	\N	ruta.canoglu@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
420	Sallija	Akmene	120170-11004	sallija.akmene@rvt.lv	\N	secret	\N	\N	2021-10-21 12:38:31	20040418	0	\N	\N	\N	0	1	0	0	1	1	01.2-14/28	2015-07-22	\N	0	1970-01-12
421	Sandis	Breiers	031186-12058	sandis.breiers@rvt.lv	\N	secret	\N	\N	2021-09-17 06:53:25	28809463	1	35	577	554	1	1	1	1	0	0	11/41	2018-08-30	\N	0	1986-11-03
422	Sandra	B??rzi??a	090280-12507	sandra.berzina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
423	Sandra	Bidz??ne	\N	sandra.bidzane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
424	Sandra	Pelnika	\N	sandra.pelnika@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
425	Sandra	Rituma	270867-12009	sandra.rituma@rvt.lv	\N	secret	\N	\N	2021-10-15 10:14:33	26577060	0	35	668	\N	1	1	1	1	0	0	1-2-14/111	2021-08-30	\N	0	1967-08-27
426	Sandra	Salcevi??a	\N	sandra.salcevica@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
427	Sanita	Bidz??ne	060588-11736	sanita.bidzane@rvt.lv	\N	secret	\N	\N	2021-09-17 05:56:43	27164948	0	522	\N	547	1	1	1	1	0	0	1-2-14/78	2020-10-05	profesion??l??s augst??k??s izgl??t??bas bakalaura\nstudiju programmas "Dizaina un tehnolo??iju skolot??js" (1-sem.) studente	0	1988-05-06
428	Sanita	Sereda	010187-10911	sanita.sereda@rvt.lv	\N	secret	\N	\N	2021-09-24 09:45:44	29814317	0	35	734	735	1	1	1	1	0	0	I-2-14/4	2020-01-31	Turpina studijas  doktorant??r??	0	1987-01-01
429	Santa	Ansone	\N	santa.ansone@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
430	Santa	Varenberga	180195-10613	santa.varenberga@rvt.lv	\N	secret	\N	\N	2021-10-05 11:37:28	20091070	0	35	732	765	1	1	1	1	0	0	01.2-14/38	2019-08-30	Turpina studijas (Izgl??t??bas un sporta darba speci??lists).	0	1995-01-18
431	Santa	Alksne	160864-12504	santa.alksne@rvt.lv	\N	secret	\N	\N	2021-10-18 09:23:55	29649616	0	14	\N	515	1	1	1	1	0	0	14/77	2014-08-29	\N	0	1964-08-16
432	Sarmite	Keisele	\N	sarmite.keisele@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
433	Sarm??te	Ozolniece	\N	sarmite.ozolniece@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
434	Sarm??te	Rozenberga	\N	sarmite.rozenberga@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
435	Sergejs	Maslovs	\N	sergejs.maslovs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
436	Sergejs	Sot??ikovs	081178-12405	sergejs.sotnikovs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
437	Signe	St??pniece	270563-10404	signe.stipniece@rvt.lv	\N	secret	\N	\N	2021-09-29 06:55:54	20370669	0	35	\N	717	1	1	1	1	0	0	9/12	2009-01-01	\N	0	1963-05-27
438	Silva	Jansone	040955-12023	silva.jansone@rvt.lv	\N	secret	\N	\N	2021-09-29 08:21:52	26037035	0	35	\N	596	1	1	1	1	0	0	14/52	2014-08-27	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 15.08.1978.	0	1955-09-04
439	Silva	Ziedi??a	\N	silva.ziedina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
440	Silvija	Auguste	\N	silvija.auguste@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
441	Silvija	Zelenkova	\N	silvija.zelenkova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
442	Sindija	Dzied??t??ja	\N	sindija.dziedataja@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
443	Sintija	Ogri??a	\N	sintija.ogrina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
444	Solomonida	Jer??ova	\N	solomonida.jersova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
445	Solveiga	Keistere	270183-11449	solveiga.keistere@rvt.lv	\N	secret	\N	\N	2021-10-05 12:04:02	26404118	0	35	690	607	1	1	1	1	0	0	9/76	2009-09-03	\N	0	1983-01-27
446	Solvita	Rozenberga	\N	solvita.rozenberga@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
447	Svetlana	Pavlovska	\N	svetlana.pavlovska@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
448	Svetlana	Batura	021082-13104	svetlana.batura@rvt.lv	\N	secret	\N	\N	2021-10-05 05:34:21	26537634	0	35	539	662	1	1	1	1	0	0	13/53	2013-09-06	\N	0	1982-10-02
449	Svetlana	Sen??enko	\N	svetlana.sencenko@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
450	Tamara	Sprancmane	\N	tamara.sprancmane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
451	Ta??a	Grafova	220254-10522	tana.grafova@rvt.lv	\N	secret	\N	\N	2021-09-21 07:40:49	26357150	0	14	\N	530	1	1	1	1	0	0	809	2003-01-02	\N	0	1954-02-22
452	Tatiana	Du??kina	210572-12446	tatiana.duskina@rvt.lv	\N	secret	\N	\N	2021-09-14 12:11:26	25976212	0	35	517	653	1	1	1	1	0	0	01.2-14/43	2016-09-01	\N	0	1972-05-21
453	Tatjana	Siva??ova	210877-10307	tatjana.sivacova@rvt.lv	\N	secret	\N	\N	2021-09-24 09:52:20	29737645	0	35	736	737	1	1	1	1	0	0	01.2-14/45	2016-09-01	\N	0	1977-08-21
454	Uldis	Doni????	230755-10542	uldis.donins@rvt.lv	\N	secret	\N	\N	2021-09-20 12:00:57	29793630	1	14	\N	569	1	1	1	1	0	0	7/109	2007-10-30	\N	0	1955-07-23
455	Uldis	Gr??nfelds	\N	uldis.grinfelds@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
456	Uldis	Heidingers	120155-10600	uldis.heidingers@rvt.lv	\N	secret	\N	\N	2021-09-21 08:55:19	26469549	1	35	517	588	1	1	1	1	0	0	01.2-14/28	2017-08-29	\N	0	1955-01-12
457	Uldis	Luka-ind??ns	\N	uldis.luka-indans@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
458	Und??ne	B??rzi??a	\N	undine.berzina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
459	Uvis	Millers	\N	uvis.millers@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
460	Valda	Luri??a	\N	valda.lurina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
461	Valdis	Kvilis	061158-10626	valdis.kvilis@rvt.lv	\N	secret	\N	\N	2021-09-24 11:17:32	28626200	1	11	\N	614	1	1	1	1	1	1	01.2-14/40	2019-08-30	\N	0	1958-11-06
462	Valentina	Peslaru	\N	valentina.peslaru@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
463	Valent??na	Mi??elsone	\N	valentina.mikelsone@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
464	Valent??na	Pavlovska	\N	valentina.pavlovska@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
465	Valent??na	Pecen??uka	\N	valentina.pecencuka@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
466	Val??rijs	Rojenko	\N	valerijs.rojenko@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
467	Valerjans	Leit??ns	\N	valerjans.leitans@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
468	Valters	??ilvinskus	\N	valters.zilvinskus@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
469	Velga	Niedre	291056-10518	velga.niedre@rvt.lv	\N	secret	\N	\N	2021-09-23 07:56:58	29637429	0	14	\N	562	1	1	1	1	0	0	796	2003-01-02	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 05.07.1976.	0	1956-10-29
470	Velta	Fridrihsone	280592-11369	velta.fridrihsone@rvt.lv	\N	secret	\N	\N	2021-09-20 12:32:23	29561221	0	35	676	575	1	1	1	1	0	0	01.2-14/94	2016-12-29	M??c??s doktorant??r??	0	1992-05-28
471	Vera	Ivanova	140964-10626	vera.ivanova@rvt.lv	\N	secret	\N	\N	2021-10-15 10:57:59	26836377	0	\N	\N	\N	1	1	1	1	0	0	951	2003-12-01	\N	0	1964-09-14
472	Verg??na	Priede	\N	vergina.priede@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
473	Vija	Bumbure	\N	vija.bumbure@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
474	Vija	Plotka	\N	vija.plotka@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
475	Viktorija	Bestikova	\N	viktorija.bestikova@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
476	Viktors	Bite	260555-10119	viktors.bite@rvt.lv	\N	secret	\N	\N	2021-09-17 06:00:18	20370852	1	35	\N	548	1	1	1	1	0	0	9/126	2009-09-23	\N	0	1955-05-26
477	Viktors	Gur??enoks	\N	viktors.gurcenoks@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
478	Viktors	Kalni??s	\N	viktors.kalniss@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
479	Viktors	Mihailovs	\N	ext.viktorsm@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
480	Viktors	??idlovskis	150377-12434	viktors.sidlovskis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
481	Vilm??rs	Bitte	\N	vilmars.bitte@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
482	Vilnis	Krievins	\N	vilnis.krievins@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
483	Vita	Gric??ne	\N	vita.gricane@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
484	Vita	Leimane	111111-11111	vita.leimane@rvt.lv	\N	secret	\N	\N	2021-07-19 06:09:49	\N	0	\N	\N	\N	\N	\N	\N	\N	1	1	\N	\N	\N	0	2021-12-06
485	Vit??lijs	Sabanskis	250684-10702	vitalijs.sabanskis@rvt.lv	\N	secret	\N	\N	2021-09-24 07:31:46	28808075	1	35	663	\N	1	1	1	1	0	0	01.2-14/47	2015-09-01	\N	0	1984-06-25
486	Vizma	Kakti??a	\N	vizma.kaktina@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
487	Vladimirs	Karevs	\N	karevs.vladimirs@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
488	Vladislavs	Ass??ns	180458-10329	vladislavs.assans@rvt.lv	\N	secret	\N	\N	2021-10-18 09:52:47	29126398	1	35	\N	518	1	1	1	1	1	1	12/35	2012-09-03	\N	0	1958-04-18
489	Zaiga	Kri??e	050869-11828	zaiga.krike@rvt.lv	\N	secret	\N	\N	2021-09-22 06:13:21	28809475	0	35	691	610	1	1	1	1	0	0	9/131	2009-09-28	\N	0	1969-08-05
490	Zane	Skrasti??a	110984-12007	zane.skrastina@rvt.lv	\N	secret	\N	\N	2021-09-29 11:24:17	26150367	0	35	622	741	1	1	1	1	0	0	14/40	2014-08-27	P??r??emtas darba attiec??bas, iepriek?? str??d??ja no 01.09.2009.	0	1984-09-11
491	??anete anna	Veisa	\N	zanete-anna.veisa@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
492	??anna	Drozdovska	060168-12407	zanna.drozdovska@rvt.lv	\N	secret	\N	\N	2021-09-20 12:38:11	26411187	0	35	\N	571	1	1	1	1	0	0	11/46	2011-08-31	\N	0	1968-01-06
493	Zarina	Mamedova	030479-10102	zarina.mamedova@rvt.lv	\N	secret	\N	\N	2021-09-22 10:18:45	26553678	0	35	664	\N	1	1	1	1	0	0	539	2001-09-01	\N	0	1979-04-03
494	Zigm??rs	Pelniks	\N	zigmars.pelniks@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
495	Zigmunds	Kazanovskis	030860-11353	zigmunds.kazanovskis@rvt.lv	\N	secret	\N	\N	2021-09-21 11:46:10	29276532	1	35	517	606	1	1	1	1	0	0	01.2-14/81	2016-10-17	\N	0	1960-08-03
496	Zigurds	Str??gelis	\N	zigurds.strigelis@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
497	Zina??da	Boi??ana	\N	zinaida.boicana@rvt.lv	\N	secret	\N	\N	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	0	2021-12-06
500	RVTInform??cijas	Sist??ma	111111-55555	is@rvt.lv	\N	secret	\N	2020-08-25 13:09:57	2021-09-16 08:50:53	212345678	1	2	485	624	0	0	1	0	0	1	123	2021-01-01	test	0	2021-01-01
501	[students]	Arnolds korzs	\N	Arnolds.Korzs@students.rvt.lv	\N	secret	\N	2020-10-20 07:10:44	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
502	Aleksis	??teinburgs	161001-20015	aleksis.steinburgs@rvt.lv	\N	$2y$10$0mlF4yHqcCzP1oqZP2IHTe1I.z1zS6AKkwLmYFaVVwMnAd9iCpf7S	\N	2021-04-01 13:31:52	2021-11-17 14:08:21	\N	1	\N	\N	\N	0	0	1	0	1	2	\N	2021-07-27	\N	0	2001-10-16
503	Oto Kristi??ns	Abrams	301096-10628	oto.abrams@rvt.lv	\N	secret	\N	2021-04-09 14:35:41	2021-10-18 10:03:50	22008116	1	35	658	493	1	1	1	1	0	0	1-2-14/33	2020-08-27	Turpina m??c??bas, profesion??l??s ma??istra studijas programma Starptautisk??s finanses	0	1996-10-30
504	Normunds	Barb??ns	080961-13065	normunds.barbans@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-10-05 05:33:11	29882088	1	35	\N	518	1	1	1	1	0	0	1-2-14/23	2020-08-26	\N	0	1961-09-08
505	Ina	Belinska	281067-12300	ina.belinska@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-09-17 05:50:59	26212817	0	35	545	546	1	1	1	1	0	0	1-2-14/37	2020-08-28	\N	0	1967-10-28
506	Vitauts	Borei??is	210968-11214	vitauts.boreisis@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-09-17 06:18:06	28340448	1	35	663	552	1	1	1	1	0	0	1-2-14/60	2020-09-15	\N	0	1968-09-21
507	Guntis	Brak??s	110556-12041	guntis.brakss@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
508	Imanta	Br??vere	241182-11759	imanta.bruvere@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-10-05 10:47:15	26551765	0	35	665	557	1	1	1	1	0	0	1-2-14/77	2021-02-02	\N	0	1982-11-24
509	Sandra	Bu??a	041159-12025	sandra.busa@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-10-15 10:11:51	28348169	0	35	\N	860	1	1	1	1	0	0	1-2-14/112	2021-08-30	\N	0	1959-11-04
510	Liene Elizabete	??akste	310570-10915	liene.cakste@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-10-05 05:10:49	26419345	0	35	\N	560	1	1	1	1	0	0	1-2-14/101	2021-08-24	\N	0	1970-05-31
511	Andris	Deiko	100187-10035	andris.deiko@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-10-15 08:36:26	27116635	1	14	\N	538	1	1	1	1	0	0	01.2-14/84	2021-02-24	\N	1	1987-01-10
512	Art??rs	Delvers	140586-12411	arturs.delvers@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-10-15 09:10:22	28468225	1	522	\N	566	1	1	1	1	0	0	1-2-14/80	2021-02-15	\N	0	1986-05-14
513	Ludmila	Fomkina	050277-11236	ludmila.fomkina@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-09-20 12:25:15	25605577	0	35	489	574	1	1	0	1	0	0	1-2-14/65	2020-09-21	\N	1	1977-02-05
514	??riks	J??kabsons	030459-14652	eriks.jekabsons@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-10-15 08:24:59	29376777	1	35	\N	\N	1	1	1	1	0	0	1-2-14/28	2020-08-27	\N	1	2021-12-06
515	Marija	Jevdokimova	140495-10421	marija.jevdokimova@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-09-21 10:32:45	29796778	0	35	684	685	1	1	1	1	0	0	1-2-14/50	2020-09-01	\N	0	1995-04-14
516	Natallia	Karatun	141172-14684	natallia.karatun@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-10-15 07:52:37	20024969	0	35	687	688	1	1	1	1	0	0	1-2-14/51	2020-09-01	\N	1	1972-11-14
517	M??rti????	Kot??ns	010369-11506	martins.kotans@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-09-22 06:02:57	29225956	1	35	577	609	1	1	0	1	\N	0	1-2-14/79	2020-10-23	\N	1	2021-12-06
518	Jana	Lielmane	301291-12650	jana.lielmane@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
519	Elita	Logina	060863-10509	elita.logina@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-09-22 09:45:42	20370862, 29293455	0	35	700	\N	1	1	1	1	0	0	1-2-14/59	2020-09-11	\N	0	1963-08-06
520	Juris	Lucavs	290667-10638	juris.lucavs@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-09-22 09:47:57	29213635	1	35	701	627	1	1	1	1	0	0	1-2-14/40	2020-08-31	\N	0	1967-06-29
521	Aleksejs	Luko??ins	120799-10742	aleksejs.lukonins@rvt.lv	\N	secret	\N	2021-04-09 14:35:42	2021-08-19 08:51:37	27001091	1	40	\N	\N	1	1	1	1	0	0	1-2-14/41	2020-08-31	Ieg??st augst??ko izgl??t??bu, RTU, izgl??t??bas programma - RDBF0 Autom??tika un datortehnika	0	1999-07-12
522	Julianna	Moisejenkova	311286-12404	julianna.moisejenkova@rvt.lv	\N	secret	\N	2021-04-09 14:35:43	2021-09-22 10:33:55	26302442	0	35	705	706	1	1	1	1	0	0	1-2-14/53	2020-09-01	\N	0	1986-12-31
523	J??nis	Otto	180485-10604	janis.otto@rvt.lv	\N	secret	\N	2021-04-09 14:35:43	2021-08-23 07:50:29	27008080	1	11	\N	566	1	1	1	1	0	0	1-2-14/78	2021-02-08	\N	0	1985-04-18
524	Sandra	Pallo	230263-10624	sandra.pallo@rvt.lv	\N	secret	\N	2021-04-09 14:35:43	2021-09-22 10:59:47	29334337	0	35	671	\N	1	1	1	1	0	0	1-2-14/61	2020-09-15	\N	0	1963-02-23
525	D??vids	Pa????ikovskis	210294-10410	davids.palcikovskis@rvt.lv	\N	secret	\N	2021-04-09 14:35:43	2021-09-22 11:06:36	26011154	1	35	701	627	1	1	1	1	0	0	1-2-14/01	2021-01-04	Turpina studijas RTU	0	1994-02-21
526	Marianna	Rukmane	200391-12404	marianna.rukmane@rvt.lv	\N	secret	\N	2021-04-09 14:35:43	2021-09-23 05:43:51	28720458	0	35	718	719	1	1	1	1	0	0	1-2-14/55	2021-01-01	\N	0	1991-03-20
527	Laura	R????e	110600-22716	elina-laura.ruke@rvt.lv	\N	secret	\N	2021-04-09 14:35:43	2021-09-23 07:21:20	29327055	0	11	\N	724	1	1	1	1	0	1	1-2-14/52	2020-09-01	Turpina studijas, LU, bakalaura programm?? dizaina un tehnolo??iju skolot??js.	0	2000-06-11
528	Edgars	Seimu??kins	110481-10107	edgars.seimuskins@rvt.lv	\N	secret	\N	2021-04-09 14:35:43	2021-09-24 08:05:35	20341117	1	14	\N	733	1	1	1	1	0	0	1-2-14/62	2020-09-15	ESF 8.4.1.	0	1981-04-11
529	L??ga	Strazdi??a	200291-10704	liga.strazdina@rvt.lv	\N	secret	\N	2021-04-09 14:35:43	2021-12-02 09:46:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
530	El??na	????epste - ??ivkule	220790-11703	elina.snepstecivkule@rvt.lv	\N	secret	\N	2021-04-09 14:35:43	2021-10-01 09:37:15	28942347	0	35	754	755	1	1	1	1	0	0	1-2-14/27	2020-08-26	\N	0	1990-07-22
531	Laila	Taz??ne	030495-10313	laila.tazane@rvt.lv	\N	secret	\N	2021-04-09 14:35:43	2021-10-04 09:34:48	29741964	0	35	520	769	1	1	1	1	0	0	01.2-14/49	2016-09-05	\N	0	1995-04-03
532	Vaira	Vilde	221165-12663	vaira.vilde@rvt.lv	\N	secret	\N	2021-04-09 14:35:43	2021-10-04 09:24:01	29102526	0	35	517	768	1	1	1	1	0	0	1-2-14/24	2020-08-26	\N	0	1965-11-22
533	Aleksis	??teinburgs	161001-20014	aleksis.steinburgs@students.rvt.lv	\N	secret	\N	2021-04-01 13:31:52	2021-11-17 14:08:05	\N	\N	\N	\N	\N	0	0	1	0	1	1	\N	\N	\N	1	2021-12-06
534	J??nis	Ozoli????	120456-12345	janis.ozolins@rvt.lv	\N		\N	2021-06-09 17:32:42	2021-12-02 09:46:57	12345678	\N	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	1	2021-12-06
536	L??ga	Sili??a	060575-10106	liga.silina@rvt.lv	\N		\N	2021-07-27 06:24:28	2021-10-15 07:46:29	29263695	0	35	673	\N	0	1	0	0	0	1	1-2-14/96	2021-06-21	\N	1	1975-05-06
537	Jevgenijs	Afanasjevs	260354-10436	jevgenijs.afanasjevs@rvt.lv	\N		\N	2021-07-27 08:36:57	2021-10-18 10:17:35	22306246	1	35	\N	495	0	1	0	0	0	1	1-2-14/45	2021-01-04	\N	0	1954-05-31
538	Marta	Kirmu??ka	040996-11096	marta.kirmuska@rvt.lv	\N		\N	2021-07-28 07:09:49	2021-07-28 07:09:49	24859834	0	40	\N	\N	0	1	0	0	1	1	1-2-14/98	2021-07-26	\N	0	1996-09-04
539	Aleksandrs	Boiko	260472-10706	aleksandrs.boiko@rvt.lv	\N		\N	2021-07-28 08:48:51	2021-08-03 10:19:38	20241257	1	35	506	507	1	1	1	1	0	0	1-2-14/94	2021-05-25	\N	0	1972-04-26
540	Anita	Bulgakova	301258-10929	anita.bulgakova@rvt.lv	\N		\N	2021-07-28 08:54:31	2021-09-17 07:12:57	29404826	0	35	\N	509	1	1	1	1	0	0	1-2-14/89	2021-04-15	\N	0	1958-12-30
541	Egons	??i????evs	140148-10117	egons.silnevs@rvt.lv	\N		\N	2021-07-28 09:01:59	2021-10-01 08:01:10	29470342	1	35	\N	511	1	1	1	1	0	0	1-2-14/87	2021-03-31	\N	0	1948-01-14
542	Je??ena	Andrejeva	290856-12953	jelena.andrejeva@rvt.lv	\N		\N	2021-07-29 10:50:15	2021-08-17 11:54:31	29811450	0	522	\N	523	0	1	0	0	0	1	1-2-14/47	2021-01-04	\N	0	1956-08-29
543	Val??rija	Andrejeva	190949-10101	valerija.andrejeva@rvt.lv	\N		\N	2021-07-29 11:11:00	2021-10-18 10:25:04	29826248	0	35	\N	525	0	1	0	0	0	1	1-2-14/93	2021-05-19	\N	0	1949-09-19
544	Vadims	Gon??arovs	030664-12408	vadims.goncarovs@rvt.lv	\N		\N	2021-08-20 09:29:21	2021-08-20 09:29:21	22304328	1	40	\N	\N	0	1	0	0	0	1	1-2-14/99	2021-08-09	\N	0	1964-06-03
545	Kaspars	Baldi????	250401-22805	kaspars.baldins@rvt.lv	\N		\N	2021-09-13 17:46:21	2021-10-19 06:16:33	27314063	1	877	\N	878	0	1	0	0	0	1	1-2-14/86	2021-03-30	\N	0	2001-04-25
546	Gatis	Sv??rups	110279-10703	gatis.svarups@rvt.lv	\N		\N	2021-09-22 07:16:51	2021-10-01 11:42:01	24786265	1	150	\N	758	0	1	0	0	0	1	1-2-14/136	2021-09-22	\N	0	1979-02-11
547	L??ga	Andronova	040776-11968	liga.andronova@rvt.lv	\N		\N	2021-09-22 07:32:50	2021-10-18 09:29:09	26456136	0	35	539	760	1	1	1	1	0	0	1-2-14/135	2021-09-21	\N	0	1976-07-04
548	Sergejs	??veds	111176-12400	sergejs.sveds@rvt.lv	\N		\N	2021-09-22 07:52:26	2021-09-22 09:34:21	22312190	1	35	\N	697	0	1	0	1	0	0	1-2-14/132	2021-09-20	\N	0	1976-11-11
549	Va??a	Mgebri??vili	300151-11393	vaza.mgebrisvili@rvt.lv	\N		\N	2021-09-22 07:55:30	2021-10-15 08:22:31	20369463	1	35	856	857	0	1	0	0	0	1	1-2-14/131	2021-09-14	\N	1	1951-01-20
550	Po??ina	Vlasova	310503-20611	polina.vlasova@rvt.lv	\N		\N	2021-09-22 07:58:15	2021-09-22 07:58:15	\N	0	\N	\N	\N	0	1	0	0	0	1	1-2-14/129	2021-09-13	\N	0	2003-05-31
551	L??ga	Miklava	290371-12014	liga.miklava@rvt.lv	\N		\N	2021-09-22 08:00:29	2021-10-29 06:33:57	26368720	0	35	729	730	0	1	0	0	0	1	1-2-4/128	2021-09-08	\N	0	1971-03-29
552	Elvira	Baranova	010567-10701	elvira.baranova@rvt.lv	\N		\N	2021-09-22 08:02:51	2021-09-22 08:02:51	25969647	0	\N	\N	\N	0	1	\N	0	0	1	1-2-14-/127	2021-09-07	\N	0	1967-05-01
553	Marta	Ju??k??vi??a	271083-10116	marta.juskevica@rvt.lv	\N		\N	2021-10-01 06:41:08	2021-10-01 06:41:08	27824082	0	40	\N	\N	0	1	0	0	0	1	1-2-14/140	2021-09-30	\N	0	1983-10-27
554	Leon??ds	Pavlovs	050374-11114	leonids.pavlovs@rvt.lv	\N		\N	2021-10-01 06:56:05	2021-10-06 05:24:40	29473696	1	\N	778	\N	1	1	1	1	0	0	1-2-14/139	2021-09-29	\N	0	1974-03-05
555	Ruslana	Da??ilova	100365-10328	ruslana.dalinova@rvt.lv	\N		\N	2021-10-01 09:23:40	2021-10-01 09:23:40	25885801	0	11	\N	752	0	1	0	0	0	1	1-2-14/137	2021-09-23	\N	0	1965-03-10
556	??enija	Zeharde-??damsone	281047-13107	zenija.zeharde-adamsone@rvt.lv	\N		\N	2021-10-01 09:30:49	2021-10-01 09:30:49	26025881	0	753	\N	\N	0	1	0	0	0	1	1-2-14/138	2021-09-27	\N	0	1947-10-28
557	Ieva	Dort??ne	200571-11616	ieva.dortane@rvt.lv	\N		\N	2021-10-06 09:15:11	2021-10-06 09:17:12	28648402	0	35	779	\N	1	1	1	1	0	0	1-2-14/130	2021-09-10	ESF 8.3.5.	0	1971-05-20
558	Aiva	Vaiteka	190276-12550	aiva.vaiteka@rvt.lv	\N		\N	2021-10-11 11:41:48	2021-10-11 11:41:48	29433418	0	\N	\N	\N	0	1	\N	0	0	1	1-2-14/143	2021-10-08	\N	0	1976-02-19
559	Aina	Ivan??ne	190274-12954	aina.ivanane@rvt.lv	\N		\N	2021-10-11 11:47:55	2021-10-11 11:47:55	29247202	0	124	668	796	0	1	0	0	0	1	1-2-14/142	2021-10-08	\N	0	1974-02-19
560	Ance	Me??ecka	271200-22854	ance.mezecka@rvt.lv	\N		\N	2021-10-11 12:08:36	2021-10-11 12:08:36	25525269	0	11	\N	797	0	1	0	0	0	1	1-2-13/141	2021-10-08	\N	0	2000-12-27
561	Indulis	Aukmanis	181268-10603	indulis.aukmanis@rvt.lv	\N		\N	2021-10-12 06:58:25	2021-10-18 10:23:02	27582363	1	11	\N	798	1	1	1	1	0	0	1-2-14/107	2021-08-27	\N	0	1968-12-18
562	D??vids	Babrovskis	150997-12413	davids.babrovskis@rvt.lv	\N		\N	2021-10-12 09:10:36	2021-10-21 12:58:22	25318804	1	40	\N	\N	1	1	1	1	0	0	1-2-14/157	2021-09-01	Turpina m??c??bas Daugavpils universit??t??, programma - inform??cijas tehnolo??ijas	0	1997-09-15
563	Nata??ja	Babajevska	140486-12709	Natalja.Babajevska@rvt.lv	\N		\N	2021-10-21 12:55:21	2021-10-21 12:55:21	27424012	0	753	\N	\N	0	1	0	0	0	1	1-2-14/4	2021-01-04	\N	0	1986-04-14
564	Dace	B??rzi??a	100666-12907	dace.berzina@rvt.lv	\N		\N	2021-10-28 11:23:58	2021-10-28 11:23:58	26564141	0	35	907	908	1	1	1	1	0	0	1-2-14/144	2021-10-14	\N	0	1966-06-10
565	Benita	Sili??a	270360-10228	benita.silina@rvt.lv	\N		\N	2021-11-01 10:08:21	2021-11-01 10:16:31	29775625	0	124	\N	915	1	1	1	1	0	0	1-2-14/147	2021-10-28	\N	0	1960-06-27
566	Aleksis	??teinburgs2	161001-21215	aleksis.steinburgs3@rvt.lv	\N		\N	2021-11-25 17:10:13	2021-12-02 09:46:57	\N	\N	\N	\N	\N	1	1	\N	1	\N	1	\N	\N	\N	1	2021-12-06
567	Aleksis	Steinburgs4	161001-21345	aleksis.steinburgs6@rvt.lv	\N		\N	2021-11-25 17:15:45	2021-12-02 09:46:57	\N	\N	\N	\N	\N	1	1	\N	1	\N	1	\N	\N	\N	1	2021-12-06
568	Aleksis	Steinburgs4	161001-21335	aleksis.steinburgs7@rvt.lv	\N		\N	2021-11-25 17:16:28	2021-12-02 09:42:32	\N	1	\N	\N	\N	1	1	\N	1	\N	1	123	2021-01-01	\N	0	2021-01-01
\.


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_id_seq', 2740, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 20, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 2, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 32, true);


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_personal_access_clients_id_seq', 1, true);


--
-- Name: options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.options_id_seq', 2928, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 20, true);


--
-- Name: positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.positions_id_seq', 69, true);


--
-- Name: regulations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regulations_id_seq', 91, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: user_positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_positions_id_seq', 1581, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 568, true);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_auth_codes oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_personal_access_clients oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_refresh_tokens oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: positions positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs public_failed_jobs_uuid1_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT public_failed_jobs_uuid1_idx UNIQUE (uuid);


--
-- Name: permissions public_permissions_name1_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT public_permissions_name1_idx UNIQUE (name, guard_name);


--
-- Name: roles public_roles_name1_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT public_roles_name1_idx UNIQUE (name, guard_name);


--
-- Name: users public_users_email2_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT public_users_email2_idx UNIQUE (email);


--
-- Name: users public_users_personal_code1_idx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT public_users_personal_code1_idx UNIQUE (personal_code);


--
-- Name: regulations regulations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regulations
    ADD CONSTRAINT regulations_pkey PRIMARY KEY (id);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: user_positions user_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_positions
    ADD CONSTRAINT user_positions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: public_documents_courses8_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_documents_courses8_idx ON public.documents USING btree (courses);


--
-- Name: public_documents_document_type2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_documents_document_type2_idx ON public.documents USING btree (document_type);


--
-- Name: public_documents_education_facility3_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_documents_education_facility3_idx ON public.documents USING btree (education_facility);


--
-- Name: public_documents_faculty4_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_documents_faculty4_idx ON public.documents USING btree (faculty);


--
-- Name: public_documents_program5_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_documents_program5_idx ON public.documents USING btree (program);


--
-- Name: public_documents_qualification7_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_documents_qualification7_idx ON public.documents USING btree (qualification);


--
-- Name: public_documents_specialization6_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_documents_specialization6_idx ON public.documents USING btree (specialization);


--
-- Name: public_documents_theme9_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_documents_theme9_idx ON public.documents USING btree (theme);


--
-- Name: public_documents_user1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_documents_user1_idx ON public.documents USING btree ("user");


--
-- Name: public_events_place_id2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_events_place_id2_idx ON public.events USING btree (place_id);


--
-- Name: public_events_user_id1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_events_user_id1_idx ON public.events USING btree (user_id);


--
-- Name: public_jobs_queue1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_jobs_queue1_idx ON public.jobs USING btree (queue);


--
-- Name: public_model_has_permissions_model_id1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_model_has_permissions_model_id1_idx ON public.model_has_permissions USING btree (model_id, model_type);


--
-- Name: public_model_has_roles_model_id1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_model_has_roles_model_id1_idx ON public.model_has_roles USING btree (model_id, model_type);


--
-- Name: public_oauth_access_tokens_user_id1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_oauth_access_tokens_user_id1_idx ON public.oauth_access_tokens USING btree (user_id);


--
-- Name: public_oauth_auth_codes_user_id1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_oauth_auth_codes_user_id1_idx ON public.oauth_auth_codes USING btree (user_id);


--
-- Name: public_oauth_clients_user_id1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_oauth_clients_user_id1_idx ON public.oauth_clients USING btree (user_id);


--
-- Name: public_oauth_refresh_tokens_access_token_id1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_oauth_refresh_tokens_access_token_id1_idx ON public.oauth_refresh_tokens USING btree (access_token_id);


--
-- Name: public_password_resets_email0_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_password_resets_email0_idx ON public.password_resets USING btree (email);


--
-- Name: public_role_has_permissions_role_id1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_role_has_permissions_role_id1_idx ON public.role_has_permissions USING btree (role_id);


--
-- Name: public_user_positions_department1_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_user_positions_department1_idx ON public.user_positions USING btree (department);


--
-- Name: public_user_positions_position_id2_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_user_positions_position_id2_idx ON public.user_positions USING btree (position_id);


--
-- Name: public_user_positions_user_id3_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_user_positions_user_id3_idx ON public.user_positions USING btree (user_id);


--
-- Name: public_users_education_type3_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_users_education_type3_idx ON public.users USING btree (education_type);


--
-- Name: public_users_grade4_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_users_grade4_idx ON public.users USING btree (grade);


--
-- Name: public_users_qual5_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX public_users_qual5_idx ON public.users USING btree (qual);


--
-- Name: documents documents_courses_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_courses_fkey FOREIGN KEY (courses) REFERENCES public.options(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: documents documents_document_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_document_type_fkey FOREIGN KEY (document_type) REFERENCES public.options(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: documents documents_education_facility_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_education_facility_fkey FOREIGN KEY (education_facility) REFERENCES public.options(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: documents documents_faculty_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_faculty_fkey FOREIGN KEY (faculty) REFERENCES public.options(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: documents documents_program_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_program_fkey FOREIGN KEY (program) REFERENCES public.options(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: documents documents_qualification_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_qualification_fkey FOREIGN KEY (qualification) REFERENCES public.options(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: documents documents_specialization_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_specialization_fkey FOREIGN KEY (specialization) REFERENCES public.options(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: documents documents_theme_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_theme_fkey FOREIGN KEY (theme) REFERENCES public.options(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: documents documents_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_user_fkey FOREIGN KEY ("user") REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: events events_place_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_place_id_fkey FOREIGN KEY (place_id) REFERENCES public.options(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: events events_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: model_has_permissions model_has_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: user_positions user_positions_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_positions
    ADD CONSTRAINT user_positions_department_fkey FOREIGN KEY (department) REFERENCES public.options(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: user_positions user_positions_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_positions
    ADD CONSTRAINT user_positions_position_id_fkey FOREIGN KEY (position_id) REFERENCES public.positions(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: user_positions user_positions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_positions
    ADD CONSTRAINT user_positions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

