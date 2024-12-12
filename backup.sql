--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

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

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: mg_clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mg_clientes (
    codigo_cliente integer NOT NULL,
    identificacion character varying(12) NOT NULL,
    nombres character varying(25) NOT NULL,
    apellidos character varying(25) NOT NULL,
    sexo character varying(1) NOT NULL,
    fecha_nacimiento date NOT NULL,
    codigo_ciudad character varying(10),
    ocupacion character varying(12) NOT NULL,
    direccion character varying(50) NOT NULL,
    referencia character varying(50) NOT NULL,
    telefono character varying(12),
    celular character varying(12),
    correo character varying(30) NOT NULL,
    estado boolean DEFAULT true NOT NULL,
    codigo_usuario integer NOT NULL
);


ALTER TABLE public.mg_clientes OWNER TO postgres;

--
-- Name: mg_clientes_codigo_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mg_clientes_codigo_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mg_clientes_codigo_cliente_seq OWNER TO postgres;

--
-- Name: mg_clientes_codigo_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mg_clientes_codigo_cliente_seq OWNED BY public.mg_clientes.codigo_cliente;


--
-- Name: mg_empresas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mg_empresas (
    id_empresa integer NOT NULL,
    nombre character varying(30) NOT NULL,
    codigo_ciudad character varying(10) NOT NULL,
    ocupacion character varying(12) NOT NULL,
    direccion character varying(50) NOT NULL,
    referencia character varying(50) NOT NULL,
    telefono character varying(12),
    celular character varying(12),
    correo character varying(30) NOT NULL,
    estado boolean DEFAULT false NOT NULL
);


ALTER TABLE public.mg_empresas OWNER TO postgres;

--
-- Name: mg_empresas_id_empresa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mg_empresas_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mg_empresas_id_empresa_seq OWNER TO postgres;

--
-- Name: mg_empresas_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mg_empresas_id_empresa_seq OWNED BY public.mg_empresas.id_empresa;


--
-- Name: mg_estados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mg_estados (
    id_estado integer NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.mg_estados OWNER TO postgres;

--
-- Name: mg_estados_id_estado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mg_estados_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mg_estados_id_estado_seq OWNER TO postgres;

--
-- Name: mg_estados_id_estado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mg_estados_id_estado_seq OWNED BY public.mg_estados.id_estado;


--
-- Name: mg_mensajes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mg_mensajes (
    id_envio integer NOT NULL,
    id_estado integer NOT NULL,
    id_operadora integer NOT NULL,
    id_plataforma integer NOT NULL,
    id_empresa integer NOT NULL,
    codigo_cliente integer NOT NULL,
    codigo_usuario integer NOT NULL,
    numero_celular character varying(16) NOT NULL,
    mensaje character varying(500) NOT NULL,
    estado_envio boolean NOT NULL,
    fecha_envio timestamp with time zone DEFAULT now() NOT NULL,
    fecha_confirmacion timestamp with time zone NOT NULL
);


ALTER TABLE public.mg_mensajes OWNER TO postgres;

--
-- Name: mg_mensajes_id_envio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mg_mensajes_id_envio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mg_mensajes_id_envio_seq OWNER TO postgres;

--
-- Name: mg_mensajes_id_envio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mg_mensajes_id_envio_seq OWNED BY public.mg_mensajes.id_envio;


--
-- Name: mg_operadoras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mg_operadoras (
    id_operadora integer NOT NULL,
    codigo_pais character varying(6) NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.mg_operadoras OWNER TO postgres;

--
-- Name: mg_operadoras_id_operadora_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mg_operadoras_id_operadora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mg_operadoras_id_operadora_seq OWNER TO postgres;

--
-- Name: mg_operadoras_id_operadora_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mg_operadoras_id_operadora_seq OWNED BY public.mg_operadoras.id_operadora;


--
-- Name: mg_plataformas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mg_plataformas (
    id_plataforma integer NOT NULL,
    descripcion character varying(16) NOT NULL
);


ALTER TABLE public.mg_plataformas OWNER TO postgres;

--
-- Name: mg_plataformas_id_plataforma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mg_plataformas_id_plataforma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mg_plataformas_id_plataforma_seq OWNER TO postgres;

--
-- Name: mg_plataformas_id_plataforma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mg_plataformas_id_plataforma_seq OWNED BY public.mg_plataformas.id_plataforma;


--
-- Name: mg_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mg_usuarios (
    codigo_usuario integer NOT NULL,
    password character varying(255) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    estado boolean DEFAULT false NOT NULL
);


ALTER TABLE public.mg_usuarios OWNER TO postgres;

--
-- Name: mg_usuarios_codigo_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mg_usuarios_codigo_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mg_usuarios_codigo_usuario_seq OWNER TO postgres;

--
-- Name: mg_usuarios_codigo_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mg_usuarios_codigo_usuario_seq OWNED BY public.mg_usuarios.codigo_usuario;


--
-- Name: py_activities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.py_activities (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying,
    start_date date NOT NULL,
    end_date date NOT NULL,
    days integer NOT NULL,
    estimation numeric(10,2) NOT NULL,
    progress integer NOT NULL,
    evidence character varying NOT NULL,
    budget_advance integer NOT NULL,
    cutoff_date timestamp without time zone,
    created timestamp without time zone DEFAULT now() NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    "userId" integer,
    "stateId" integer,
    "priorityId" integer,
    "responsibleId" integer,
    "activityId" integer
);


ALTER TABLE public.py_activities OWNER TO postgres;

--
-- Name: py_activities_closure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.py_activities_closure (
    id_ancestor integer NOT NULL,
    id_descendant integer NOT NULL
);


ALTER TABLE public.py_activities_closure OWNER TO postgres;

--
-- Name: py_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.py_activities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.py_activities_id_seq OWNER TO postgres;

--
-- Name: py_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.py_activities_id_seq OWNED BY public.py_activities.id;


--
-- Name: py_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.py_permissions (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.py_permissions OWNER TO postgres;

--
-- Name: py_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.py_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.py_permissions_id_seq OWNER TO postgres;

--
-- Name: py_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.py_permissions_id_seq OWNED BY public.py_permissions.id;


--
-- Name: py_priorities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.py_priorities (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.py_priorities OWNER TO postgres;

--
-- Name: py_priorities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.py_priorities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.py_priorities_id_seq OWNER TO postgres;

--
-- Name: py_priorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.py_priorities_id_seq OWNED BY public.py_priorities.id;


--
-- Name: py_responsibles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.py_responsibles (
    id integer NOT NULL,
    "userId" integer,
    "rolesId" integer
);


ALTER TABLE public.py_responsibles OWNER TO postgres;

--
-- Name: py_responsibles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.py_responsibles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.py_responsibles_id_seq OWNER TO postgres;

--
-- Name: py_responsibles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.py_responsibles_id_seq OWNED BY public.py_responsibles.id;


--
-- Name: py_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.py_roles (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.py_roles OWNER TO postgres;

--
-- Name: py_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.py_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.py_roles_id_seq OWNER TO postgres;

--
-- Name: py_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.py_roles_id_seq OWNED BY public.py_roles.id;


--
-- Name: py_roles_permissions_py_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.py_roles_permissions_py_permissions (
    "pyRolesId" integer NOT NULL,
    "pyPermissionsId" integer NOT NULL
);


ALTER TABLE public.py_roles_permissions_py_permissions OWNER TO postgres;

--
-- Name: py_states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.py_states (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.py_states OWNER TO postgres;

--
-- Name: py_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.py_states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.py_states_id_seq OWNER TO postgres;

--
-- Name: py_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.py_states_id_seq OWNED BY public.py_states.id;


--
-- Name: py_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.py_users (
    id integer NOT NULL,
    username character varying NOT NULL,
    name character varying,
    last_name character varying,
    email character varying NOT NULL,
    password character varying,
    active boolean DEFAULT true NOT NULL,
    created timestamp without time zone DEFAULT now() NOT NULL,
    updated timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.py_users OWNER TO postgres;

--
-- Name: py_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.py_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.py_users_id_seq OWNER TO postgres;

--
-- Name: py_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.py_users_id_seq OWNED BY public.py_users.id;


--
-- Name: mg_clientes codigo_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_clientes ALTER COLUMN codigo_cliente SET DEFAULT nextval('public.mg_clientes_codigo_cliente_seq'::regclass);


--
-- Name: mg_empresas id_empresa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_empresas ALTER COLUMN id_empresa SET DEFAULT nextval('public.mg_empresas_id_empresa_seq'::regclass);


--
-- Name: mg_estados id_estado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_estados ALTER COLUMN id_estado SET DEFAULT nextval('public.mg_estados_id_estado_seq'::regclass);


--
-- Name: mg_mensajes id_envio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_mensajes ALTER COLUMN id_envio SET DEFAULT nextval('public.mg_mensajes_id_envio_seq'::regclass);


--
-- Name: mg_operadoras id_operadora; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_operadoras ALTER COLUMN id_operadora SET DEFAULT nextval('public.mg_operadoras_id_operadora_seq'::regclass);


--
-- Name: mg_plataformas id_plataforma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_plataformas ALTER COLUMN id_plataforma SET DEFAULT nextval('public.mg_plataformas_id_plataforma_seq'::regclass);


--
-- Name: mg_usuarios codigo_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_usuarios ALTER COLUMN codigo_usuario SET DEFAULT nextval('public.mg_usuarios_codigo_usuario_seq'::regclass);


--
-- Name: py_activities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_activities ALTER COLUMN id SET DEFAULT nextval('public.py_activities_id_seq'::regclass);


--
-- Name: py_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_permissions ALTER COLUMN id SET DEFAULT nextval('public.py_permissions_id_seq'::regclass);


--
-- Name: py_priorities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_priorities ALTER COLUMN id SET DEFAULT nextval('public.py_priorities_id_seq'::regclass);


--
-- Name: py_responsibles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_responsibles ALTER COLUMN id SET DEFAULT nextval('public.py_responsibles_id_seq'::regclass);


--
-- Name: py_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_roles ALTER COLUMN id SET DEFAULT nextval('public.py_roles_id_seq'::regclass);


--
-- Name: py_states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_states ALTER COLUMN id SET DEFAULT nextval('public.py_states_id_seq'::regclass);


--
-- Name: py_users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_users ALTER COLUMN id SET DEFAULT nextval('public.py_users_id_seq'::regclass);


--
-- Data for Name: mg_clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mg_clientes (codigo_cliente, identificacion, nombres, apellidos, sexo, fecha_nacimiento, codigo_ciudad, ocupacion, direccion, referencia, telefono, celular, correo, estado, codigo_usuario) FROM stdin;
10	123456789012	Juan	Pérez	M	1990-01-01	C001	Ingeniero	Calle Falsa 123	Cerca del parque	1234567	987654321	juan.perez@example.com	t	1
\.


--
-- Data for Name: mg_empresas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mg_empresas (id_empresa, nombre, codigo_ciudad, ocupacion, direccion, referencia, telefono, celular, correo, estado) FROM stdin;
\.


--
-- Data for Name: mg_estados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mg_estados (id_estado, descripcion) FROM stdin;
\.


--
-- Data for Name: mg_mensajes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mg_mensajes (id_envio, id_estado, id_operadora, id_plataforma, id_empresa, codigo_cliente, codigo_usuario, numero_celular, mensaje, estado_envio, fecha_envio, fecha_confirmacion) FROM stdin;
\.


--
-- Data for Name: mg_operadoras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mg_operadoras (id_operadora, codigo_pais, descripcion) FROM stdin;
\.


--
-- Data for Name: mg_plataformas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mg_plataformas (id_plataforma, descripcion) FROM stdin;
\.


--
-- Data for Name: mg_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mg_usuarios (codigo_usuario, password, fecha_inicio, fecha_fin, estado) FROM stdin;
1	securepassword123	2024-01-01	2024-12-31	t
\.


--
-- Data for Name: py_activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.py_activities (id, name, description, start_date, end_date, days, estimation, progress, evidence, budget_advance, cutoff_date, created, updated, "userId", "stateId", "priorityId", "responsibleId", "activityId") FROM stdin;
1	Obras preliminares	asdasdadad	2024-12-07	2024-12-14	2	2.00	2	Evidencia cositas	2	\N	2024-12-07 14:58:12.305594	2024-12-07 14:58:12.305594	\N	\N	\N	\N	\N
2	Axel	asdasdasa	2024-12-07	2024-12-15	2	2.00	2	Evidencia cositas	2	\N	2024-12-07 15:03:33.892861	2024-12-07 15:03:33.892861	\N	\N	\N	\N	\N
3	Obras preliminares2	asdasdd	2024-12-07	2024-12-14	2	2.00	2	Evidencia cositas	2	\N	2024-12-07 15:08:07.350561	2024-12-07 15:08:07.350561	\N	\N	\N	\N	1
\.


--
-- Data for Name: py_activities_closure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.py_activities_closure (id_ancestor, id_descendant) FROM stdin;
1	1
2	2
3	3
1	3
\.


--
-- Data for Name: py_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.py_permissions (id, name) FROM stdin;
1	create_project
2	update_project
3	delete_project
4	view_project
5	manage_roles
6	assign_tasks
\.


--
-- Data for Name: py_priorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.py_priorities (id, name) FROM stdin;
1	Baja
2	Media
3	Alta
4	Cr¡tica
\.


--
-- Data for Name: py_responsibles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.py_responsibles (id, "userId", "rolesId") FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
\.


--
-- Data for Name: py_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.py_roles (id, name) FROM stdin;
1	Administrador
2	Gerente
3	Supervisor
4	Colaborador
\.


--
-- Data for Name: py_roles_permissions_py_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.py_roles_permissions_py_permissions ("pyRolesId", "pyPermissionsId") FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
2	1
2	4
2	6
3	4
3	6
4	4
\.


--
-- Data for Name: py_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.py_states (id, name) FROM stdin;
1	Pendiente
2	En Progreso
3	Completado
4	En Espera
5	Cancelado
\.


--
-- Data for Name: py_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.py_users (id, username, name, last_name, email, password, active, created, updated) FROM stdin;
1	Agaxel128	Axel	Menendez	gabrielmen564@gmail.com	$2a$06$d3KJ1Aalayb5TJA.8soy3.DL.03Zdslle7o9La6LB/J5JP.LbECB6	t	2024-11-30 17:50:38.353856	2024-12-02 13:50:46.082379
2	manager1	Manager	One	manager1@example.com	$2a$06$d3KJ1Aalayb5TJA.8soy3.DL.03Zdslle7o9La6LB/J5JP.LbECB6	t	2024-12-02 14:57:30.509056	2024-12-02 14:57:30.509056
3	supervisor1	Supervisor	One	supervisor1@example.com	$2a$06$d3KJ1Aalayb5TJA.8soy3.DL.03Zdslle7o9La6LB/J5JP.LbECB6	t	2024-12-02 14:57:30.509056	2024-12-02 14:57:30.509056
4	collaborator1	Collaborator	One	collaborator1@example.com	$2a$06$d3KJ1Aalayb5TJA.8soy3.DL.03Zdslle7o9La6LB/J5JP.LbECB6	t	2024-12-02 14:57:30.509056	2024-12-02 14:57:30.509056
\.


--
-- Name: mg_clientes_codigo_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mg_clientes_codigo_cliente_seq', 10, true);


--
-- Name: mg_empresas_id_empresa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mg_empresas_id_empresa_seq', 1, false);


--
-- Name: mg_estados_id_estado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mg_estados_id_estado_seq', 1, false);


--
-- Name: mg_mensajes_id_envio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mg_mensajes_id_envio_seq', 1, false);


--
-- Name: mg_operadoras_id_operadora_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mg_operadoras_id_operadora_seq', 1, false);


--
-- Name: mg_plataformas_id_plataforma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mg_plataformas_id_plataforma_seq', 1, false);


--
-- Name: mg_usuarios_codigo_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mg_usuarios_codigo_usuario_seq', 1, true);


--
-- Name: py_activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.py_activities_id_seq', 3, true);


--
-- Name: py_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.py_permissions_id_seq', 1, false);


--
-- Name: py_priorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.py_priorities_id_seq', 1, false);


--
-- Name: py_responsibles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.py_responsibles_id_seq', 1, false);


--
-- Name: py_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.py_roles_id_seq', 1, false);


--
-- Name: py_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.py_states_id_seq', 1, false);


--
-- Name: py_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.py_users_id_seq', 1, true);


--
-- Name: py_activities PK_0626d95229ab37300e392aaf60a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_activities
    ADD CONSTRAINT "PK_0626d95229ab37300e392aaf60a" PRIMARY KEY (id);


--
-- Name: py_states PK_352505862c4082241583a6295da; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_states
    ADD CONSTRAINT "PK_352505862c4082241583a6295da" PRIMARY KEY (id);


--
-- Name: mg_operadoras PK_3ad60dc94eaed7752ebc57cc938; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_operadoras
    ADD CONSTRAINT "PK_3ad60dc94eaed7752ebc57cc938" PRIMARY KEY (id_operadora);


--
-- Name: py_responsibles PK_4afcdce2acdf80d3b26615c2e2d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_responsibles
    ADD CONSTRAINT "PK_4afcdce2acdf80d3b26615c2e2d" PRIMARY KEY (id);


--
-- Name: mg_usuarios PK_5fb102070a6e1dcbdc8e08d55e8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_usuarios
    ADD CONSTRAINT "PK_5fb102070a6e1dcbdc8e08d55e8" PRIMARY KEY (codigo_usuario);


--
-- Name: py_activities_closure PK_6672d7fcbb51aed91ed31d95833; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_activities_closure
    ADD CONSTRAINT "PK_6672d7fcbb51aed91ed31d95833" PRIMARY KEY (id_ancestor, id_descendant);


--
-- Name: mg_estados PK_676692abb26ed9b6be177a53d35; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_estados
    ADD CONSTRAINT "PK_676692abb26ed9b6be177a53d35" PRIMARY KEY (id_estado);


--
-- Name: py_priorities PK_77d69e6cc8fee77702104c8332b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_priorities
    ADD CONSTRAINT "PK_77d69e6cc8fee77702104c8332b" PRIMARY KEY (id);


--
-- Name: py_permissions PK_7ae04a30d77c23f59c622bb368b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_permissions
    ADD CONSTRAINT "PK_7ae04a30d77c23f59c622bb368b" PRIMARY KEY (id);


--
-- Name: mg_clientes PK_a7bd393a2c5c3ea528c7fca4842; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_clientes
    ADD CONSTRAINT "PK_a7bd393a2c5c3ea528c7fca4842" PRIMARY KEY (codigo_cliente);


--
-- Name: mg_plataformas PK_ab3063ed9987e995836b1266580; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_plataformas
    ADD CONSTRAINT "PK_ab3063ed9987e995836b1266580" PRIMARY KEY (id_plataforma);


--
-- Name: py_roles PK_adfc79e72b30e08d7acd7a5eba8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_roles
    ADD CONSTRAINT "PK_adfc79e72b30e08d7acd7a5eba8" PRIMARY KEY (id);


--
-- Name: py_users PK_ca8f62fd45e7fa31d05cb897114; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_users
    ADD CONSTRAINT "PK_ca8f62fd45e7fa31d05cb897114" PRIMARY KEY (id);


--
-- Name: mg_empresas PK_cb449ecee728a1216b86723c44e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_empresas
    ADD CONSTRAINT "PK_cb449ecee728a1216b86723c44e" PRIMARY KEY (id_empresa);


--
-- Name: py_roles_permissions_py_permissions PK_d21b07775c7a5f2b438abede768; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_roles_permissions_py_permissions
    ADD CONSTRAINT "PK_d21b07775c7a5f2b438abede768" PRIMARY KEY ("pyRolesId", "pyPermissionsId");


--
-- Name: mg_mensajes PK_ed0ced9f97961fbdbfb6121b055; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "PK_ed0ced9f97961fbdbfb6121b055" PRIMARY KEY (id_envio);


--
-- Name: py_responsibles REL_a2b138eebea34e883d75b2953e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_responsibles
    ADD CONSTRAINT "REL_a2b138eebea34e883d75b2953e" UNIQUE ("userId");


--
-- Name: mg_mensajes UQ_5d90a721ea3a5f0be73a9f5b3b4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "UQ_5d90a721ea3a5f0be73a9f5b3b4" UNIQUE (codigo_usuario);


--
-- Name: mg_clientes UQ_5d97e2ad7096054fb5bb703ba80; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_clientes
    ADD CONSTRAINT "UQ_5d97e2ad7096054fb5bb703ba80" UNIQUE (celular);


--
-- Name: mg_usuarios UQ_5fb102070a6e1dcbdc8e08d55e8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_usuarios
    ADD CONSTRAINT "UQ_5fb102070a6e1dcbdc8e08d55e8" UNIQUE (codigo_usuario);


--
-- Name: mg_clientes UQ_b461890629fddd66fa5bd93f541; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_clientes
    ADD CONSTRAINT "UQ_b461890629fddd66fa5bd93f541" UNIQUE (correo);


--
-- Name: py_users UQ_bbea980d6edbea6abc99456b0fe; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_users
    ADD CONSTRAINT "UQ_bbea980d6edbea6abc99456b0fe" UNIQUE (username);


--
-- Name: mg_clientes UQ_bc4b502866e0428ccb21984be17; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_clientes
    ADD CONSTRAINT "UQ_bc4b502866e0428ccb21984be17" UNIQUE (identificacion);


--
-- Name: py_users UQ_e4e8a20dc57dc6868d29897ad1a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_users
    ADD CONSTRAINT "UQ_e4e8a20dc57dc6868d29897ad1a" UNIQUE (email);


--
-- Name: IDX_1b0172f0d27f891fb95d923fcc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_1b0172f0d27f891fb95d923fcc" ON public.py_activities_closure USING btree (id_descendant);


--
-- Name: IDX_9ac23f2005d1a959196e82e9b4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_9ac23f2005d1a959196e82e9b4" ON public.py_roles_permissions_py_permissions USING btree ("pyPermissionsId");


--
-- Name: IDX_ad32146fdd254b21f2768428dc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_ad32146fdd254b21f2768428dc" ON public.py_roles_permissions_py_permissions USING btree ("pyRolesId");


--
-- Name: IDX_bf310bfbb40d5971b8287a35ff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IDX_bf310bfbb40d5971b8287a35ff" ON public.py_activities_closure USING btree (id_ancestor);


--
-- Name: email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX email_index ON public.py_users USING btree (email);


--
-- Name: username_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX username_index ON public.py_users USING btree (username);


--
-- Name: py_activities FK_15dae76752408d7aa9a2b56d40f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_activities
    ADD CONSTRAINT "FK_15dae76752408d7aa9a2b56d40f" FOREIGN KEY ("stateId") REFERENCES public.py_states(id);


--
-- Name: py_activities_closure FK_1b0172f0d27f891fb95d923fcc8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_activities_closure
    ADD CONSTRAINT "FK_1b0172f0d27f891fb95d923fcc8" FOREIGN KEY (id_descendant) REFERENCES public.py_activities(id) ON DELETE CASCADE;


--
-- Name: mg_mensajes FK_1bbf03191f072de43936fba21cb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_1bbf03191f072de43936fba21cb" FOREIGN KEY (id_plataforma) REFERENCES public.mg_plataformas(id_plataforma);


--
-- Name: py_activities FK_2f2e8b276f441771055dabc9020; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_activities
    ADD CONSTRAINT "FK_2f2e8b276f441771055dabc9020" FOREIGN KEY ("activityId") REFERENCES public.py_activities(id);


--
-- Name: mg_mensajes FK_428a18465af34c9b5ba00a8a203; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_428a18465af34c9b5ba00a8a203" FOREIGN KEY (id_estado) REFERENCES public.mg_estados(id_estado);


--
-- Name: mg_mensajes FK_5ac2ec5791f425f149371716394; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_5ac2ec5791f425f149371716394" FOREIGN KEY (codigo_cliente) REFERENCES public.mg_clientes(codigo_cliente);


--
-- Name: mg_mensajes FK_5d90a721ea3a5f0be73a9f5b3b4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_5d90a721ea3a5f0be73a9f5b3b4" FOREIGN KEY (codigo_usuario) REFERENCES public.mg_usuarios(codigo_usuario);


--
-- Name: py_activities FK_814d69f3d70d22da645f36688a0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_activities
    ADD CONSTRAINT "FK_814d69f3d70d22da645f36688a0" FOREIGN KEY ("responsibleId") REFERENCES public.py_responsibles(id);


--
-- Name: mg_mensajes FK_858a8a8cbfe4d6283a427da2751; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_858a8a8cbfe4d6283a427da2751" FOREIGN KEY (id_empresa) REFERENCES public.mg_empresas(id_empresa);


--
-- Name: mg_mensajes FK_8ab12a11fa2659485e6e5453813; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_8ab12a11fa2659485e6e5453813" FOREIGN KEY (id_operadora) REFERENCES public.mg_operadoras(id_operadora);


--
-- Name: py_roles_permissions_py_permissions FK_9ac23f2005d1a959196e82e9b47; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_roles_permissions_py_permissions
    ADD CONSTRAINT "FK_9ac23f2005d1a959196e82e9b47" FOREIGN KEY ("pyPermissionsId") REFERENCES public.py_permissions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: py_activities FK_9ddf401a11014d642ee31144ada; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_activities
    ADD CONSTRAINT "FK_9ddf401a11014d642ee31144ada" FOREIGN KEY ("priorityId") REFERENCES public.py_priorities(id);


--
-- Name: py_responsibles FK_a2b138eebea34e883d75b2953e1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_responsibles
    ADD CONSTRAINT "FK_a2b138eebea34e883d75b2953e1" FOREIGN KEY ("userId") REFERENCES public.py_users(id);


--
-- Name: py_roles_permissions_py_permissions FK_ad32146fdd254b21f2768428dc5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_roles_permissions_py_permissions
    ADD CONSTRAINT "FK_ad32146fdd254b21f2768428dc5" FOREIGN KEY ("pyRolesId") REFERENCES public.py_roles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: py_activities_closure FK_bf310bfbb40d5971b8287a35ffa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_activities_closure
    ADD CONSTRAINT "FK_bf310bfbb40d5971b8287a35ffa" FOREIGN KEY (id_ancestor) REFERENCES public.py_activities(id) ON DELETE CASCADE;


--
-- Name: py_responsibles FK_bfb728cb77ed825e516c6b48977; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_responsibles
    ADD CONSTRAINT "FK_bfb728cb77ed825e516c6b48977" FOREIGN KEY ("rolesId") REFERENCES public.py_roles(id);


--
-- Name: mg_clientes FK_ea51c2074e12f2b13d9b2f595af; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mg_clientes
    ADD CONSTRAINT "FK_ea51c2074e12f2b13d9b2f595af" FOREIGN KEY (codigo_usuario) REFERENCES public.mg_usuarios(codigo_usuario);


--
-- Name: py_activities FK_fcd6cf49cba61a1457d81d75481; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.py_activities
    ADD CONSTRAINT "FK_fcd6cf49cba61a1457d81d75481" FOREIGN KEY ("userId") REFERENCES public.py_users(id);


--
-- PostgreSQL database dump complete
--

