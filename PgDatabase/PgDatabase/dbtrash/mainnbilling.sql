PGDMP         8                {            mainnbilling    15.2    15.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16458    mainnbilling    DATABASE        CREATE DATABASE mainnbilling WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE mainnbilling;
                postgres    false            �            1259    16471    accesscontrol    TABLE     �   CREATE TABLE public.accesscontrol (
    rno character varying(2),
    manufacturer character varying(2),
    distributer character varying(2),
    customer character varying(2)
);
 !   DROP TABLE public.accesscontrol;
       public         heap    postgres    false            �            1259    16468    credentials    TABLE     �   CREATE TABLE public.credentials (
    rno character varying(6),
    userid character varying(20),
    username character varying(50),
    password character varying(50),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public.credentials;
       public         heap    postgres    false            �            1259    16459    district    TABLE     �   CREATE TABLE public.district (
    rno character varying(6),
    stateid character varying(6),
    districtid character varying(6),
    districtcode character varying(6),
    districtname character varying(50)
);
    DROP TABLE public.district;
       public         heap    postgres    false            �            1259    16465    position    TABLE     �   CREATE TABLE public."position" (
    rno character varying(6),
    positionid character varying(2),
    "position" character varying(20),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public."position";
       public         heap    postgres    false            �            1259    16474 	   previlage    TABLE     �   CREATE TABLE public.previlage (
    rno character varying(6),
    previlageid character varying(6),
    previlage character varying(30),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public.previlage;
       public         heap    postgres    false            �            1259    16462    state    TABLE     �   CREATE TABLE public.state (
    rno character varying(6),
    stateid character varying(6),
    statecode character varying(6),
    statename character varying(50),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public.state;
       public         heap    postgres    false            �            1259    16477    user    TABLE     1  CREATE TABLE public."user" (
    rno character varying(6),
    userid character varying(20),
    email character varying(50),
    phno character varying(10),
    altphoneno character varying(10),
    aadhar character varying(20),
    pan character varying(12),
    name character varying(50),
    positionid character varying(2),
    adminid character varying(20),
    updatedon character varying(16),
    updatedby character varying(50),
    status character varying(9),
    userprofile character varying(10),
    pstreetname character varying(50),
    pdistrictid character varying(50),
    pstateid character varying(30),
    ppostalcode character varying(6),
    cstreetname character varying(50),
    cdistrictid character varying(50),
    cstateid character varying(30),
    cpostalcode character varying(6)
);
    DROP TABLE public."user";
       public         heap    postgres    false                      0    16471    accesscontrol 
   TABLE DATA           Q   COPY public.accesscontrol (rno, manufacturer, distributer, customer) FROM stdin;
    public          postgres    false    218                    0    16468    credentials 
   TABLE DATA           `   COPY public.credentials (rno, userid, username, password, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    217   *       
          0    16459    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    214   G                 0    16465    position 
   TABLE DATA           [   COPY public."position" (rno, positionid, "position", lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    216   [                 0    16474 	   previlage 
   TABLE DATA           Z   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    219   x                 0    16462    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    215   �                 0    16477    user 
   TABLE DATA           �   COPY public."user" (rno, userid, email, phno, altphoneno, aadhar, pan, name, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode) FROM stdin;
    public          postgres    false    220   5             x������ � �            x������ � �      
     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.            x������ � �            x������ � �         �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�            x������ � �     