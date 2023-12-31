PGDMP          4                {           devils_test    15.1    15.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    33211    devils_test    DATABASE        CREATE DATABASE devils_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE devils_test;
                postgres    false            �            1259    41886 
   book_infos    TABLE       CREATE TABLE public.book_infos (
    id integer NOT NULL,
    description character varying(2047) NOT NULL,
    text character varying(2047) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "bookId" integer
);
    DROP TABLE public.book_infos;
       public         heap    postgres    false            �            1259    41885    book_infos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.book_infos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.book_infos_id_seq;
       public          postgres    false    219                       0    0    book_infos_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.book_infos_id_seq OWNED BY public.book_infos.id;
          public          postgres    false    218            �            1259    41872    books    TABLE     4  CREATE TABLE public.books (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);
    DROP TABLE public.books;
       public         heap    postgres    false            �            1259    41871    books_id_seq    SEQUENCE     �   CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.books_id_seq;
       public          postgres    false    217                       0    0    books_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;
          public          postgres    false    216            �            1259    41795    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) DEFAULT 0,
    email character varying(255) NOT NULL,
    password character varying(255) DEFAULT 0,
    role character varying(255) DEFAULT 'user'::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "managerId" integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    41794    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    215                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    214            t           2604    41889    book_infos id    DEFAULT     n   ALTER TABLE ONLY public.book_infos ALTER COLUMN id SET DEFAULT nextval('public.book_infos_id_seq'::regclass);
 <   ALTER TABLE public.book_infos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            s           2604    41875    books id    DEFAULT     d   ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);
 7   ALTER TABLE public.books ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            o           2604    41798    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                      0    41886 
   book_infos 
   TABLE DATA           _   COPY public.book_infos (id, description, text, "createdAt", "updatedAt", "bookId") FROM stdin;
    public          postgres    false    219   �"                 0    41872    books 
   TABLE DATA           \   COPY public.books (id, name, author, title, "createdAt", "updatedAt", "userId") FROM stdin;
    public          postgres    false    217   Z)                 0    41795    users 
   TABLE DATA           g   COPY public.users (id, name, email, password, role, "createdAt", "updatedAt", "managerId") FROM stdin;
    public          postgres    false    215   �*                  0    0    book_infos_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.book_infos_id_seq', 24, true);
          public          postgres    false    218                        0    0    books_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.books_id_seq', 24, true);
          public          postgres    false    216            !           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 23, true);
          public          postgres    false    214            ~           2606    41893    book_infos book_infos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.book_infos
    ADD CONSTRAINT book_infos_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.book_infos DROP CONSTRAINT book_infos_pkey;
       public            postgres    false    219            |           2606    41879    books books_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
       public            postgres    false    217            v           2606    41809    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            x           2606    41807    users users_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.users DROP CONSTRAINT users_name_key;
       public            postgres    false    215            z           2606    41805    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            �           2606    41894 !   book_infos book_infos_bookId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.book_infos
    ADD CONSTRAINT "book_infos_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES public.books(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.book_infos DROP CONSTRAINT "book_infos_bookId_fkey";
       public          postgres    false    219    3196    217            �           2606    41880    books books_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.books
    ADD CONSTRAINT "books_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.books DROP CONSTRAINT "books_userId_fkey";
       public          postgres    false    215    217    3194                       2606    41810    users users_managerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_managerId_fkey" FOREIGN KEY ("managerId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.users DROP CONSTRAINT "users_managerId_fkey";
       public          postgres    false    215    215    3194               �  x^�Z�N[G}�_1��,�`���
ߐo�B�nR�!�h��c�m����_ȗt��g��oVu����ٳ/k�=�O����7����n8t~����ah�����3�㧉��<sz�������z��z~�'~���<|�cy.t�}h�^���
'�n�C8²6&� �3�}��Wȝ�����_F�(��qҊ*�G�J�^ha��A�B�N_9���у��wЊ�b����Хr��iU8sP���_~��E��+?L
��r��#��M/�~O�+�`:d@�HlR:,w��D�a�-��CJ�6���?��^�K����&���cy�:
�f���-0�bjfB�}a�y��d�ZM�����_0֊��1�sx� �G\`H��X���X�U��m!B������Ё�/�!r���gԈ�h9�Id�%*��g�y��Lc�?� ��h�A|<�0�3��/�����$�������N�Ҳ���J�+x�WF�OC'��o�M\6�"X�{1�y&�B7�h���k(0�{���1�QN��4���5�bɄ]�I3�8�5���y>)� ��v�Xy��a������ ���w��^,t$��#�(�O��X � �0"�8��t����:"+�A.�~��g:ĳa��N��_������֨�%��*Ob���p�{(��%ȝf$��H�Y� ����WZ�"#�@��<��x�o?}K� F&3��Cy�V�w���4�,�@��}��1��L��<=���2�E֦H14����U�����v���Fm�Q��k��O����JYu�_Q%c~#R����A�h�E�,���h���GA���a����=�;��gJ%Gw���A4V�M�U*��8�H[b��uI�����RDF��n�Ԫ�m�� +R�����r�י9^0��\�l�>����F�C��5�|���F�/�lg1��ۑ{�.c8%xMAgVK�PL��o���`F�ܰ>�	��XH&�?V�I�#Q���ǀ���)�a⇘~J,�O�
++�HRc�؁$�̜Z�o��� �Qԋ���s0)?�,�:QE׮��t�p���X� vdC�z�f�{��X��oc�(���O��%�F ?��C�g��^��c1���F�t�s����eАz���0@��g�
J�	v�#���udc��$�p2�`w�':�-�5G�pYA9�B9�%s�Qy]���UӅ�j)�
hմ����XT�t�-��[xq����s^q��ܫ��9����[y��k�ט��J��y�R��eSͳ�:�jZ{��xGCKM2�.���;��ud���O���l�U��
�)v�g?ͮ`y*v�/�J*;�ۚ1蔱��/	zSWG6Z�T��/��R/�����Y��?_g�YWk�i��
ͷ{:��[��Y�P�4g�s��t��҅��5���iu������2�N-���ta��l:ׄz[��	C�Q�E~�#M=�[�Owx}C���+�ԲS��{�q"�emA~�H�D��n�����G�m�4����=׎R�|�iR �@�f"��̂2�{�A�0`n$0�N��Jc�^~S_sB]��)e��P�6�P �@�"s��Qԫ���\�[ǷS��~�T*���r         {  x^͔�NA��ۧ��°ُ;.{����l�5*&D
;� 11����ю�S���
3o��Q�ц\6w���g&�9-��[X�Ї��"��3��D����ǅR�t�P̯��6i3Jq�n6p]a|w[�7I3���D0�V��	==Cz�%�|�:���xMA�a&X�[��)"�=����I5���!v8�S���$?�䤒�=��;����j޹8:�7&����@�µ���~��eZoL�8mzk�/�r�6���֚uZۦ��R�i�R	������2J,�+��8�	�����|�$���s���Y�d`<�[���yI1��N�K�Ҡs���-��0��{~rY����B�*0Z(�dH�9ɰ}�� �Dˉ         e  x^}��r�@�>�,��JCws߁��&�DV6��xD��S�82�N�U�W�i�u��>N��
�h�i=���8�Nl��{�i�^Gp�`��3�ì��Uz�&�BqV������"D#�L�������Dc "�7����]�w�t����`v�qN�oe�1(��eoeL�	�X+Vx���A!�26kE&١������Hh�p�G�?��~4��NqQ�/��1)�õ�G��BF��P�6������@o��+#j�����e[8�ѕ�p���:��my�}lx�^��Pٮ��L�f����^�i�{��'x�Sr?�͑�Ɲ��oU��*�i��1�U%~b�ީ������sl��[��k@���9Te������p��Ym/�y�j�$́�G��@���O���Vw��G�)���u���e�����+^�g�8L*3�͒���d�e���b1ԲMN��n.�I�?�f����./�|�ur�p��F�(��dYz��֙M��=ha��mB@$��x�+�B�ǚn￡]�N��4R���TS1��7݅*��YU���oצ `oÌ�`�fl�mjQ<���K,�V�Wt���n����F�     