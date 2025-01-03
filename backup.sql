PGDMP      
                |            projects    17.2    17.2 E    i           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            j           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            k           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            l           1262    16386    projects    DATABASE     }   CREATE DATABASE projects WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE projects;
                     postgres    false                        3079    32768    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                        false            m           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                             false    2            �            1259    40995    mg_clientes    TABLE     �  CREATE TABLE public.mg_clientes (
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
    DROP TABLE public.mg_clientes;
       public         heap r       postgres    false            �            1259    40994    mg_clientes_codigo_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.mg_clientes_codigo_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.mg_clientes_codigo_cliente_seq;
       public               postgres    false    227            n           0    0    mg_clientes_codigo_cliente_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.mg_clientes_codigo_cliente_seq OWNED BY public.mg_clientes.codigo_cliente;
          public               postgres    false    226            �            1259    41009    mg_empresas    TABLE     �  CREATE TABLE public.mg_empresas (
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
    DROP TABLE public.mg_empresas;
       public         heap r       postgres    false            �            1259    41008    mg_empresas_id_empresa_seq    SEQUENCE     �   CREATE SEQUENCE public.mg_empresas_id_empresa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.mg_empresas_id_empresa_seq;
       public               postgres    false    229            o           0    0    mg_empresas_id_empresa_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.mg_empresas_id_empresa_seq OWNED BY public.mg_empresas.id_empresa;
          public               postgres    false    228            �            1259    40962 
   mg_estados    TABLE     b   CREATE TABLE public.mg_estados (
    id_estado integer NOT NULL,
    descripcion text NOT NULL
);
    DROP TABLE public.mg_estados;
       public         heap r       postgres    false            �            1259    40960    mg_estados_id_estado_seq    SEQUENCE     �   CREATE SEQUENCE public.mg_estados_id_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.mg_estados_id_estado_seq;
       public               postgres    false    219            p           0    0    mg_estados_id_estado_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.mg_estados_id_estado_seq OWNED BY public.mg_estados.id_estado;
          public               postgres    false    218            �            1259    41017    mg_mensajes    TABLE       CREATE TABLE public.mg_mensajes (
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
    DROP TABLE public.mg_mensajes;
       public         heap r       postgres    false            �            1259    41016    mg_mensajes_id_envio_seq    SEQUENCE     �   CREATE SEQUENCE public.mg_mensajes_id_envio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.mg_mensajes_id_envio_seq;
       public               postgres    false    231            q           0    0    mg_mensajes_id_envio_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.mg_mensajes_id_envio_seq OWNED BY public.mg_mensajes.id_envio;
          public               postgres    false    230            �            1259    40986    mg_operadoras    TABLE     �   CREATE TABLE public.mg_operadoras (
    id_operadora integer NOT NULL,
    codigo_pais character varying(6) NOT NULL,
    descripcion text NOT NULL
);
 !   DROP TABLE public.mg_operadoras;
       public         heap r       postgres    false            �            1259    40985    mg_operadoras_id_operadora_seq    SEQUENCE     �   CREATE SEQUENCE public.mg_operadoras_id_operadora_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.mg_operadoras_id_operadora_seq;
       public               postgres    false    225            r           0    0    mg_operadoras_id_operadora_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.mg_operadoras_id_operadora_seq OWNED BY public.mg_operadoras.id_operadora;
          public               postgres    false    224            �            1259    40971    mg_plataformas    TABLE     {   CREATE TABLE public.mg_plataformas (
    id_plataforma integer NOT NULL,
    descripcion character varying(16) NOT NULL
);
 "   DROP TABLE public.mg_plataformas;
       public         heap r       postgres    false            �            1259    40970     mg_plataformas_id_plataforma_seq    SEQUENCE     �   CREATE SEQUENCE public.mg_plataformas_id_plataforma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.mg_plataformas_id_plataforma_seq;
       public               postgres    false    221            s           0    0     mg_plataformas_id_plataforma_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.mg_plataformas_id_plataforma_seq OWNED BY public.mg_plataformas.id_plataforma;
          public               postgres    false    220            �            1259    40978    mg_usuarios    TABLE     %  CREATE TABLE public.mg_usuarios (
    codigo_usuario integer NOT NULL,
    password character varying(255) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    estado boolean DEFAULT false NOT NULL,
    correo character varying(255),
    usuario character varying(50)
);
    DROP TABLE public.mg_usuarios;
       public         heap r       postgres    false            �            1259    40977    mg_usuarios_codigo_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.mg_usuarios_codigo_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.mg_usuarios_codigo_usuario_seq;
       public               postgres    false    223            t           0    0    mg_usuarios_codigo_usuario_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.mg_usuarios_codigo_usuario_seq OWNED BY public.mg_usuarios.codigo_usuario;
          public               postgres    false    222            �           2604    40998    mg_clientes codigo_cliente    DEFAULT     �   ALTER TABLE ONLY public.mg_clientes ALTER COLUMN codigo_cliente SET DEFAULT nextval('public.mg_clientes_codigo_cliente_seq'::regclass);
 I   ALTER TABLE public.mg_clientes ALTER COLUMN codigo_cliente DROP DEFAULT;
       public               postgres    false    227    226    227            �           2604    41012    mg_empresas id_empresa    DEFAULT     �   ALTER TABLE ONLY public.mg_empresas ALTER COLUMN id_empresa SET DEFAULT nextval('public.mg_empresas_id_empresa_seq'::regclass);
 E   ALTER TABLE public.mg_empresas ALTER COLUMN id_empresa DROP DEFAULT;
       public               postgres    false    229    228    229            �           2604    40965    mg_estados id_estado    DEFAULT     |   ALTER TABLE ONLY public.mg_estados ALTER COLUMN id_estado SET DEFAULT nextval('public.mg_estados_id_estado_seq'::regclass);
 C   ALTER TABLE public.mg_estados ALTER COLUMN id_estado DROP DEFAULT;
       public               postgres    false    218    219    219            �           2604    41020    mg_mensajes id_envio    DEFAULT     |   ALTER TABLE ONLY public.mg_mensajes ALTER COLUMN id_envio SET DEFAULT nextval('public.mg_mensajes_id_envio_seq'::regclass);
 C   ALTER TABLE public.mg_mensajes ALTER COLUMN id_envio DROP DEFAULT;
       public               postgres    false    231    230    231            �           2604    40989    mg_operadoras id_operadora    DEFAULT     �   ALTER TABLE ONLY public.mg_operadoras ALTER COLUMN id_operadora SET DEFAULT nextval('public.mg_operadoras_id_operadora_seq'::regclass);
 I   ALTER TABLE public.mg_operadoras ALTER COLUMN id_operadora DROP DEFAULT;
       public               postgres    false    225    224    225            �           2604    40974    mg_plataformas id_plataforma    DEFAULT     �   ALTER TABLE ONLY public.mg_plataformas ALTER COLUMN id_plataforma SET DEFAULT nextval('public.mg_plataformas_id_plataforma_seq'::regclass);
 K   ALTER TABLE public.mg_plataformas ALTER COLUMN id_plataforma DROP DEFAULT;
       public               postgres    false    220    221    221            �           2604    40981    mg_usuarios codigo_usuario    DEFAULT     �   ALTER TABLE ONLY public.mg_usuarios ALTER COLUMN codigo_usuario SET DEFAULT nextval('public.mg_usuarios_codigo_usuario_seq'::regclass);
 I   ALTER TABLE public.mg_usuarios ALTER COLUMN codigo_usuario DROP DEFAULT;
       public               postgres    false    222    223    223            b          0    40995    mg_clientes 
   TABLE DATA           �   COPY public.mg_clientes (codigo_cliente, identificacion, nombres, apellidos, sexo, fecha_nacimiento, codigo_ciudad, ocupacion, direccion, referencia, telefono, celular, correo, estado, codigo_usuario) FROM stdin;
    public               postgres    false    227   ]       d          0    41009    mg_empresas 
   TABLE DATA           �   COPY public.mg_empresas (id_empresa, nombre, codigo_ciudad, ocupacion, direccion, referencia, telefono, celular, correo, estado) FROM stdin;
    public               postgres    false    229   �]       Z          0    40962 
   mg_estados 
   TABLE DATA           <   COPY public.mg_estados (id_estado, descripcion) FROM stdin;
    public               postgres    false    219   �]       f          0    41017    mg_mensajes 
   TABLE DATA           �   COPY public.mg_mensajes (id_envio, id_estado, id_operadora, id_plataforma, id_empresa, codigo_cliente, codigo_usuario, numero_celular, mensaje, estado_envio, fecha_envio, fecha_confirmacion) FROM stdin;
    public               postgres    false    231   �]       `          0    40986    mg_operadoras 
   TABLE DATA           O   COPY public.mg_operadoras (id_operadora, codigo_pais, descripcion) FROM stdin;
    public               postgres    false    225   ^       \          0    40971    mg_plataformas 
   TABLE DATA           D   COPY public.mg_plataformas (id_plataforma, descripcion) FROM stdin;
    public               postgres    false    221   !^       ^          0    40978    mg_usuarios 
   TABLE DATA           q   COPY public.mg_usuarios (codigo_usuario, password, fecha_inicio, fecha_fin, estado, correo, usuario) FROM stdin;
    public               postgres    false    223   >^       u           0    0    mg_clientes_codigo_cliente_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.mg_clientes_codigo_cliente_seq', 10, true);
          public               postgres    false    226            v           0    0    mg_empresas_id_empresa_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.mg_empresas_id_empresa_seq', 1, false);
          public               postgres    false    228            w           0    0    mg_estados_id_estado_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.mg_estados_id_estado_seq', 1, false);
          public               postgres    false    218            x           0    0    mg_mensajes_id_envio_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.mg_mensajes_id_envio_seq', 1, false);
          public               postgres    false    230            y           0    0    mg_operadoras_id_operadora_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.mg_operadoras_id_operadora_seq', 1, false);
          public               postgres    false    224            z           0    0     mg_plataformas_id_plataforma_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.mg_plataformas_id_plataforma_seq', 1, false);
          public               postgres    false    220            {           0    0    mg_usuarios_codigo_usuario_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.mg_usuarios_codigo_usuario_seq', 1, true);
          public               postgres    false    222            �           2606    40993 ,   mg_operadoras PK_3ad60dc94eaed7752ebc57cc938 
   CONSTRAINT     v   ALTER TABLE ONLY public.mg_operadoras
    ADD CONSTRAINT "PK_3ad60dc94eaed7752ebc57cc938" PRIMARY KEY (id_operadora);
 X   ALTER TABLE ONLY public.mg_operadoras DROP CONSTRAINT "PK_3ad60dc94eaed7752ebc57cc938";
       public                 postgres    false    225            �           2606    40984 *   mg_usuarios PK_5fb102070a6e1dcbdc8e08d55e8 
   CONSTRAINT     v   ALTER TABLE ONLY public.mg_usuarios
    ADD CONSTRAINT "PK_5fb102070a6e1dcbdc8e08d55e8" PRIMARY KEY (codigo_usuario);
 V   ALTER TABLE ONLY public.mg_usuarios DROP CONSTRAINT "PK_5fb102070a6e1dcbdc8e08d55e8";
       public                 postgres    false    223            �           2606    40969 )   mg_estados PK_676692abb26ed9b6be177a53d35 
   CONSTRAINT     p   ALTER TABLE ONLY public.mg_estados
    ADD CONSTRAINT "PK_676692abb26ed9b6be177a53d35" PRIMARY KEY (id_estado);
 U   ALTER TABLE ONLY public.mg_estados DROP CONSTRAINT "PK_676692abb26ed9b6be177a53d35";
       public                 postgres    false    219            �           2606    41001 *   mg_clientes PK_a7bd393a2c5c3ea528c7fca4842 
   CONSTRAINT     v   ALTER TABLE ONLY public.mg_clientes
    ADD CONSTRAINT "PK_a7bd393a2c5c3ea528c7fca4842" PRIMARY KEY (codigo_cliente);
 V   ALTER TABLE ONLY public.mg_clientes DROP CONSTRAINT "PK_a7bd393a2c5c3ea528c7fca4842";
       public                 postgres    false    227            �           2606    40976 -   mg_plataformas PK_ab3063ed9987e995836b1266580 
   CONSTRAINT     x   ALTER TABLE ONLY public.mg_plataformas
    ADD CONSTRAINT "PK_ab3063ed9987e995836b1266580" PRIMARY KEY (id_plataforma);
 Y   ALTER TABLE ONLY public.mg_plataformas DROP CONSTRAINT "PK_ab3063ed9987e995836b1266580";
       public                 postgres    false    221            �           2606    41015 *   mg_empresas PK_cb449ecee728a1216b86723c44e 
   CONSTRAINT     r   ALTER TABLE ONLY public.mg_empresas
    ADD CONSTRAINT "PK_cb449ecee728a1216b86723c44e" PRIMARY KEY (id_empresa);
 V   ALTER TABLE ONLY public.mg_empresas DROP CONSTRAINT "PK_cb449ecee728a1216b86723c44e";
       public                 postgres    false    229            �           2606    41025 *   mg_mensajes PK_ed0ced9f97961fbdbfb6121b055 
   CONSTRAINT     p   ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "PK_ed0ced9f97961fbdbfb6121b055" PRIMARY KEY (id_envio);
 V   ALTER TABLE ONLY public.mg_mensajes DROP CONSTRAINT "PK_ed0ced9f97961fbdbfb6121b055";
       public                 postgres    false    231            �           2606    41027 *   mg_mensajes UQ_5d90a721ea3a5f0be73a9f5b3b4 
   CONSTRAINT     q   ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "UQ_5d90a721ea3a5f0be73a9f5b3b4" UNIQUE (codigo_usuario);
 V   ALTER TABLE ONLY public.mg_mensajes DROP CONSTRAINT "UQ_5d90a721ea3a5f0be73a9f5b3b4";
       public                 postgres    false    231            �           2606    41005 *   mg_clientes UQ_5d97e2ad7096054fb5bb703ba80 
   CONSTRAINT     j   ALTER TABLE ONLY public.mg_clientes
    ADD CONSTRAINT "UQ_5d97e2ad7096054fb5bb703ba80" UNIQUE (celular);
 V   ALTER TABLE ONLY public.mg_clientes DROP CONSTRAINT "UQ_5d97e2ad7096054fb5bb703ba80";
       public                 postgres    false    227            �           2606    41064 *   mg_usuarios UQ_5fb102070a6e1dcbdc8e08d55e8 
   CONSTRAINT     q   ALTER TABLE ONLY public.mg_usuarios
    ADD CONSTRAINT "UQ_5fb102070a6e1dcbdc8e08d55e8" UNIQUE (codigo_usuario);
 V   ALTER TABLE ONLY public.mg_usuarios DROP CONSTRAINT "UQ_5fb102070a6e1dcbdc8e08d55e8";
       public                 postgres    false    223            �           2606    41007 *   mg_clientes UQ_b461890629fddd66fa5bd93f541 
   CONSTRAINT     i   ALTER TABLE ONLY public.mg_clientes
    ADD CONSTRAINT "UQ_b461890629fddd66fa5bd93f541" UNIQUE (correo);
 V   ALTER TABLE ONLY public.mg_clientes DROP CONSTRAINT "UQ_b461890629fddd66fa5bd93f541";
       public                 postgres    false    227            �           2606    41003 *   mg_clientes UQ_bc4b502866e0428ccb21984be17 
   CONSTRAINT     q   ALTER TABLE ONLY public.mg_clientes
    ADD CONSTRAINT "UQ_bc4b502866e0428ccb21984be17" UNIQUE (identificacion);
 V   ALTER TABLE ONLY public.mg_clientes DROP CONSTRAINT "UQ_bc4b502866e0428ccb21984be17";
       public                 postgres    false    227            �           2606    41086 "   mg_usuarios mg_usuarios_correo_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.mg_usuarios
    ADD CONSTRAINT mg_usuarios_correo_key UNIQUE (correo);
 L   ALTER TABLE ONLY public.mg_usuarios DROP CONSTRAINT mg_usuarios_correo_key;
       public                 postgres    false    223            �           2606    41090 #   mg_usuarios mg_usuarios_usuario_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.mg_usuarios
    ADD CONSTRAINT mg_usuarios_usuario_key UNIQUE (usuario);
 M   ALTER TABLE ONLY public.mg_usuarios DROP CONSTRAINT mg_usuarios_usuario_key;
       public                 postgres    false    223            �           2606    41043 *   mg_mensajes FK_1bbf03191f072de43936fba21cb    FK CONSTRAINT     �   ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_1bbf03191f072de43936fba21cb" FOREIGN KEY (id_plataforma) REFERENCES public.mg_plataformas(id_plataforma);
 V   ALTER TABLE ONLY public.mg_mensajes DROP CONSTRAINT "FK_1bbf03191f072de43936fba21cb";
       public               postgres    false    4776    231    221            �           2606    41038 *   mg_mensajes FK_428a18465af34c9b5ba00a8a203    FK CONSTRAINT     �   ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_428a18465af34c9b5ba00a8a203" FOREIGN KEY (id_estado) REFERENCES public.mg_estados(id_estado);
 V   ALTER TABLE ONLY public.mg_mensajes DROP CONSTRAINT "FK_428a18465af34c9b5ba00a8a203";
       public               postgres    false    219    4774    231            �           2606    41058 *   mg_mensajes FK_5ac2ec5791f425f149371716394    FK CONSTRAINT     �   ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_5ac2ec5791f425f149371716394" FOREIGN KEY (codigo_cliente) REFERENCES public.mg_clientes(codigo_cliente);
 V   ALTER TABLE ONLY public.mg_mensajes DROP CONSTRAINT "FK_5ac2ec5791f425f149371716394";
       public               postgres    false    4788    231    227            �           2606    41070 *   mg_mensajes FK_5d90a721ea3a5f0be73a9f5b3b4    FK CONSTRAINT     �   ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_5d90a721ea3a5f0be73a9f5b3b4" FOREIGN KEY (codigo_usuario) REFERENCES public.mg_usuarios(codigo_usuario);
 V   ALTER TABLE ONLY public.mg_mensajes DROP CONSTRAINT "FK_5d90a721ea3a5f0be73a9f5b3b4";
       public               postgres    false    223    231    4778            �           2606    41033 *   mg_mensajes FK_858a8a8cbfe4d6283a427da2751    FK CONSTRAINT     �   ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_858a8a8cbfe4d6283a427da2751" FOREIGN KEY (id_empresa) REFERENCES public.mg_empresas(id_empresa);
 V   ALTER TABLE ONLY public.mg_mensajes DROP CONSTRAINT "FK_858a8a8cbfe4d6283a427da2751";
       public               postgres    false    4796    231    229            �           2606    41053 *   mg_mensajes FK_8ab12a11fa2659485e6e5453813    FK CONSTRAINT     �   ALTER TABLE ONLY public.mg_mensajes
    ADD CONSTRAINT "FK_8ab12a11fa2659485e6e5453813" FOREIGN KEY (id_operadora) REFERENCES public.mg_operadoras(id_operadora);
 V   ALTER TABLE ONLY public.mg_mensajes DROP CONSTRAINT "FK_8ab12a11fa2659485e6e5453813";
       public               postgres    false    4786    225    231            �           2606    41065 *   mg_clientes FK_ea51c2074e12f2b13d9b2f595af    FK CONSTRAINT     �   ALTER TABLE ONLY public.mg_clientes
    ADD CONSTRAINT "FK_ea51c2074e12f2b13d9b2f595af" FOREIGN KEY (codigo_usuario) REFERENCES public.mg_usuarios(codigo_usuario);
 V   ALTER TABLE ONLY public.mg_clientes DROP CONSTRAINT "FK_ea51c2074e12f2b13d9b2f595af";
       public               postgres    false    223    227    4778            b   �   x�5�K
�0F��Ud����Y! (.�ɥ^B!M5Zw�:ܘ��3�Ȁlݴ]?8CǍ��O�7N ���P	ޔR�4K^�9F�{����<��J�7��M�*��wmS[~I��s��u��.�R�Mw#�      d      x������ � �      Z      x������ � �      f      x������ � �      `      x������ � �      \      x������ � �      ^   s   x�3�T1JR14R�(�4��1�����(MNu�׳p
��J3�����02��)7)͈�I��4202�50"��H�ؐ��31=�"5�!=713G/9?��,����� X/ '     