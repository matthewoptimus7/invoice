PGDMP         1                 |            billing    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    37706    billing    DATABASE     z   CREATE DATABASE billing WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE billing;
                postgres    false            �            1255    37707    accesscontrolllog()    FUNCTION     �  CREATE FUNCTION public.accesscontrolllog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO accesscontroltrigger(distributer,product,invoice,userid,customer,staff,operation,dateandtime)
	VALUES(NEW.distributer,NEW.product,NEW.invoice,NEW.userid,NEW.customer,NEW.staff,'insert',current_timestamp);
   
   ELSIF TG_OP = 'DELETE' THEN
       
        INSERT INTO accesscontroltrigger(distributer,product,invoice,userid,customer,staff,operation,dateandtime)
	VALUES(OLD.distributer,OLD.product,OLD.invoice,OLD.userid,OLD.customer,OLD.staff,'delete',current_timestamp);
     
	 ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO accesscontroltrigger(distributer,product,invoice,userid,customer,staff,operation,dateandtime)
	VALUES(NEW.distributer,NEW.product,NEW.invoice,NEW.userid,NEW.customer,NEW.staff,'update',current_timestamp);
       
   
		END IF;
    
    RETURN OLD;
END;
$$;
 *   DROP FUNCTION public.accesscontrolllog();
       public          postgres    false                       1255    37708    credentialslog()    FUNCTION     �  CREATE FUNCTION public.credentialslog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO credentialstrigger(userid,username,password,lastupdatedby,updatedon,operation,dateandtime)
	VALUES(NEW.userid,NEW.username,NEW.password,NEW.lastupdatedby,NEW.updatedon,'insert',current_timestamp);
   
   ELSIF TG_OP = 'DELETE' THEN
       
        INSERT INTO  credentialstrigger(userid,username,password,lastupdatedby,updatedon,operation,dateandtime)
	VALUES(OLD.userid,OLD.username,OLD.password,OLD.lastupdatedby,OLD.updatedon,'delete',current_timestamp);

	 ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO  credentialstrigger(userid,username,password,lastupdatedby,updatedon,operation,dateandtime)
	VALUES(NEW.userid,NEW.username,NEW.password,NEW.lastupdatedby,NEW.updatedon,'update',current_timestamp);
   
       
   
		END IF;
    
    RETURN OLD;
END;
$$;
 '   DROP FUNCTION public.credentialslog();
       public          postgres    false                       1255    37709    districtlog()    FUNCTION     W  CREATE FUNCTION public.districtlog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO districttrigger(stateid,districtid,districtcode,districtname,operation,dateandtime)
	VALUES(NEW.stateid,NEW.districtid,NEW.districtcode,NEW.districtname,'insert',current_timestamp);
   
   ELSIF TG_OP = 'DELETE' THEN
       
        INSERT INTO districttrigger (stateid,districtid,districtcode,districtname,operation,dateandtime)
	VALUES(OLD.stateid,OLD.districtid,OLD.districtcode,OLD.districtname,'delete',current_timestamp);
     
	 ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO districttrigger(stateid,districtid,districtcode,districtname,operation,dateandtime)
	VALUES(NEW.stateid,NEW.districtid,NEW.districtcode,NEW.districtname,'update',current_timestamp);
       
   
		END IF;
    
    RETURN OLD;
END;
$$;
 $   DROP FUNCTION public.districtlog();
       public          postgres    false                       1255    37710    invoicelog()    FUNCTION     t  CREATE FUNCTION public.invoicelog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	
	
	BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO invoicetrigger( invoiceid, senderid, receiverid, invoicedate, sendernotes,subtotal, discount, total, invoicestatus, lastupdatedby, updatedon,operation,dateandtime)
	VALUES(NEW.invoiceid,NEW.senderid,NEW.receiverid,NEW.invoicedate,NEW.sendernotes,NEW.subtotal,NEW.discount,NEW.total,NEW.invoicestatus,NEW.lastupdatedby,NEW.updatedon,'insert',current_timestamp);
   
   ELSIF TG_OP = 'DELETE' THEN
         INSERT INTO invoicetrigger( invoiceid, senderid, receiverid, invoicedate, sendernotes,subtotal, discount, total, invoicestatus, lastupdatedby, updatedon,operation,dateandtime)
	VALUES(OLD.invoiceid,OLD.senderid,OLD.receiverid,OLD.invoicedate,OLD.sendernotes,OLD.subtotal,OLD.discount,OLD.total,OLD.invoicestatus,OLD.lastupdatedby,OLD.updatedon,'delete',current_timestamp);  
       

	 ELSIF TG_OP = 'UPDATE' THEN
           INSERT INTO invoicetrigger( invoiceid, senderid, receiverid, invoicedate, sendernotes,subtotal, discount, total, invoicestatus, lastupdatedby, updatedon,operation,dateandtime)
	VALUES(NEW.invoiceid,NEW.senderid,NEW.receiverid,NEW.invoicedate,NEW.sendernotes,NEW.subtotal,NEW.discount,NEW.total,NEW.invoicestatus,NEW.lastupdatedby,NEW.updatedon,'update',current_timestamp);
       
   
		END IF;
    
    RETURN OLD;
END;
$$;
 #   DROP FUNCTION public.invoicelog();
       public          postgres    false                       1255    37711    positionlog()    FUNCTION     Q  CREATE FUNCTION public.positionlog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO positiontrigger(positionid,position,lastupdatedby,updatedon,operation,dateandtime)
	VALUES(NEW.positionid,NEW.position,NEW.lastupdatedby,NEW.updatedon,'insert',current_timestamp);
   
   ELSIF TG_OP = 'DELETE' THEN
       
        INSERT INTO positiontrigger(positionid,position,lastupdatedby,updatedon,operation,dateandtime)  
	VALUES(OLD.positionid,OLD.position,OLD.lastupdatedby,OLD.updatedon,'delete',current_timestamp);

	 ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO positiontrigger(positionid,position,lastupdatedby,updatedon,operation,dateandtime)
	VALUES(NEW.positionid,NEW.position,NEW.lastupdatedby,NEW.updatedon,'update',current_timestamp);
   
       
   
		END IF;
    
    RETURN OLD;
END;
$$;
 $   DROP FUNCTION public.positionlog();
       public          postgres    false                       1255    37712    previlagelog()    FUNCTION     [  CREATE FUNCTION public.previlagelog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO previlagetrigger(previlageid,previlage,lastupdatedby,updatedon,operation,dateandtime)
	VALUES(NEW.previlageid,NEW.previlage,NEW.lastupdatedby,NEW.updatedon,'insert',current_timestamp);
   
   ELSIF TG_OP = 'DELETE' THEN
       
        INSERT INTO  previlagetrigger(previlageid,previlage,lastupdatedby,updatedon,operation,dateandtime)
	VALUES(OLD.previlageid,OLD.previlage,OLD.lastupdatedby,OLD.updatedon,'delete',current_timestamp);

	 ELSIF TG_OP = 'UPDATE' THEN
     
         INSERT INTO previlagetrigger(previlageid,previlage,lastupdatedby,updatedon,operation,dateandtime)
	VALUES(NEW.previlageid,NEW.previlage,NEW.lastupdatedby,NEW.updatedon,'update',current_timestamp);
   
		END IF;
    
    RETURN OLD;
END;
$$;
 %   DROP FUNCTION public.previlagelog();
       public          postgres    false                       1255    37713 
   statelog()    FUNCTION     �  CREATE FUNCTION public.statelog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO statetrigger(stateid,statecode,statename,lastupdatedby,updatedon,operation,dateandtime)
	VALUES(NEW.stateid,NEW.statecode,NEW.statename,NEW.lastupdatedby,NEW.updatedon,'insert',current_timestamp);
   
   ELSIF TG_OP = 'DELETE' THEN
       
        INSERT INTO statetrigger(stateid,statecode,statename,lastupdatedby,updatedon,operation,dateandtime)
	VALUES(OLD.stateid,OLD.statecode,OLD.statename,OLD.lastupdatedby,OLD.updatedon,'delete',current_timestamp);
     
	 ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO statetrigger(stateid,statecode,statename,lastupdatedby,updatedon,operation,dateandtime)
	VALUES(NEW.stateid,NEW.statecode,NEW.statename,NEW.lastupdatedby,NEW.updatedon,'update',current_timestamp);
       
   
		END IF;
    
    RETURN OLD;
END;
$$;
 !   DROP FUNCTION public.statelog();
       public          postgres    false                        1255    37714 	   userlog()    FUNCTION     �  CREATE FUNCTION public.userlog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO usertrigger(userid, email, phno, altphoneno, aadhar, pan, name, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,dateandtime)
	VALUES( NEW.userid, NEW.email, NEW.phno,NEW.altphoneno, NEW.aadhar,NEW.pan, NEW.name, NEW.positionid, NEW.adminid, NEW.updatedby, NEW.status, NEW.userprofile, NEW.pstreetname, NEW.pdistrictid, NEW.pstateid, NEW.ppostalcode, NEW.cstreetname, NEW.cdistrictid, NEW.cstateid, NEW.cpostalcode,'insert',current_timestamp);
   
   ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO usertrigger( userid, email, phno, altphoneno, aadhar, pan, name, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,dateandtime)
	VALUES( OLD.userid, OLD.email, OLD.phno,OLD.altphoneno, OLD.aadhar,OLD.pan, OLD.name, OLD.positionid, OLD.adminid,OLD.updatedon, OLD.updatedby, OLD.status, OLD.userprofile, OLD.pstreetname, OLD.pdistrictid, OLD.pstateid, OLD.ppostalcode, OLD.cstreetname, OLD.cdistrictid, OLD.cstateid, OLD.cpostalcode,'delete',current_timestamp);
     
	 ELSIF TG_OP = 'UPDATE' THEN
       
        INSERT INTO usertrigger( userid, email, phno, altphoneno, aadhar, pan, name, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,dateandtime)
	VALUES( NEW.userid, NEW.email, NEW.phno,NEW.altphoneno, NEW.aadhar,NEW.pan, NEW.name, NEW.positionid, NEW.adminid, NEW.updatedby, NEW.status, NEW.userprofile, NEW.pstreetname, NEW.pdistrictid, NEW.pstateid, NEW.ppostalcode, NEW.cstreetname, NEW.cdistrictid, NEW.cstateid, NEW.cpostalcode,'update',current_timestamp);
   
		END IF;
    
    
    RETURN OLD; 
END;
$$;
     DROP FUNCTION public.userlog();
       public          postgres    false            �            1259    37715    accesscontroll    TABLE       CREATE TABLE public.accesscontroll (
    rno integer NOT NULL,
    distributer character varying(2),
    product character varying(2),
    invoice character varying(2),
    userid character varying(6),
    customer character varying(2),
    staff character varying(2)
);
 "   DROP TABLE public.accesscontroll;
       public         heap    postgres    false            �            1259    37718    accesscontroll_rno_seq    SEQUENCE     �   ALTER TABLE public.accesscontroll ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesscontroll_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    37719    accesscontroltrigger    TABLE     j  CREATE TABLE public.accesscontroltrigger (
    rno integer NOT NULL,
    distributer character varying(2),
    product character varying(2),
    invoice character varying(2),
    userid character varying(6),
    customer character varying(2),
    staff character varying(2),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
 (   DROP TABLE public.accesscontroltrigger;
       public         heap    postgres    false            �            1259    37722    accesscontroltrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.accesscontroltrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesscontroltrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    37723    credentials    TABLE     �   CREATE TABLE public.credentials (
    rno integer NOT NULL,
    userid character varying(20),
    username character varying(50),
    password character varying(50),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public.credentials;
       public         heap    postgres    false            �            1259    37726    credentials_rno_seq    SEQUENCE     �   ALTER TABLE public.credentials ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credentials_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    37727    credentialstrigger    TABLE     R  CREATE TABLE public.credentialstrigger (
    rno integer NOT NULL,
    userid character varying(20),
    username character varying(50),
    password character varying(50),
    lastupdatedby character varying(50),
    updatedon character varying(16),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
 &   DROP TABLE public.credentialstrigger;
       public         heap    postgres    false            �            1259    37730    credentialstrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.credentialstrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credentialstrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    37731    district    TABLE     �   CREATE TABLE public.district (
    rno integer NOT NULL,
    stateid character varying(6),
    districtid character varying(6),
    districtcode character varying(6),
    districtname character varying(50)
);
    DROP TABLE public.district;
       public         heap    postgres    false            �            1259    37734    district_rno_seq    SEQUENCE     �   ALTER TABLE public.district ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.district_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    37735    districttrigger    TABLE     -  CREATE TABLE public.districttrigger (
    rno integer NOT NULL,
    stateid character varying(6),
    districtid character varying(6),
    districtcode character varying(6),
    districtname character varying(50),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
 #   DROP TABLE public.districttrigger;
       public         heap    postgres    false            �            1259    37738    districttrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.districttrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.districttrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    37739    invoice    TABLE     �  CREATE TABLE public.invoice (
    rno integer NOT NULL,
    invoiceid character varying(20),
    senderid character varying(20),
    receiverid character varying(20),
    invoicedate date,
    sendernotes character varying(50),
    subtotal character varying(20),
    discount character varying(20),
    total character varying(10),
    invoicestatus character varying(10),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public.invoice;
       public         heap    postgres    false            �            1259    37870    invoice_id_seq    SEQUENCE     z   CREATE SEQUENCE public.invoice_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.invoice_id_seq;
       public          postgres    false    226            �           0    0    invoice_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.invoice_id_seq OWNED BY public.invoice.invoiceid;
          public          postgres    false    254            �            1259    37742    invoice_rno_seq    SEQUENCE     �   ALTER TABLE public.invoice ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoice_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    37743    invoiceitem    TABLE     d  CREATE TABLE public.invoiceitem (
    rno integer NOT NULL,
    invoiceid character varying(20),
    productid character varying(10),
    quantity character varying(10),
    cost character varying(10),
    discountperitem character varying(10),
    lastupdatedby character varying(50),
    updatedon character varying(16),
    hsncode character varying
);
    DROP TABLE public.invoiceitem;
       public         heap    postgres    false            �            1259    37746    invoiceitem_rno_seq    SEQUENCE     �   ALTER TABLE public.invoiceitem ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoiceitem_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    37850    invoiceslip    TABLE     �  CREATE TABLE public.invoiceslip (
    rno integer NOT NULL,
    invoiceid character varying,
    senderid character varying,
    receiverid character varying,
    invoicedate character varying,
    hsncode character varying,
    productid character varying,
    quantity character varying,
    discount character varying,
    originalprice character varying,
    afterdiscount character varying,
    totalprice character varying,
    lastupdatedby character varying,
    updatedon character varying
);
    DROP TABLE public.invoiceslip;
       public         heap    postgres    false            �            1259    37857    invoiceslip_rno_seq    SEQUENCE     �   ALTER TABLE public.invoiceslip ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoiceslip_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    250            �            1259    37747    invoicetrigger    TABLE     "  CREATE TABLE public.invoicetrigger (
    rno integer NOT NULL,
    invoiceid character varying(20),
    senderid character varying(20),
    receiverid character varying(20),
    invoicedate date,
    sendernotes character varying(50),
    subtotal character varying(20),
    discount character varying(20),
    total character varying(10),
    invoicestatus character varying(10),
    lastupdatedby character varying(50),
    updatedon character varying(16),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
 "   DROP TABLE public.invoicetrigger;
       public         heap    postgres    false            �            1259    37750    invoicetrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.invoicetrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoicetrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    37751    position    TABLE     �   CREATE TABLE public."position" (
    rno integer NOT NULL,
    positionid character varying(2),
    "position" character varying(20),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public."position";
       public         heap    postgres    false            �            1259    37754    position_rno_seq    SEQUENCE     �   ALTER TABLE public."position" ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.position_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    37755    positiontrigger    TABLE     0  CREATE TABLE public.positiontrigger (
    rno integer NOT NULL,
    positionid character varying(2),
    "position" character varying(20),
    lastupdatedby character varying(50),
    updatedon character varying(16),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
 #   DROP TABLE public.positiontrigger;
       public         heap    postgres    false            �            1259    37758    positiontrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.positiontrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.positiontrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234            �            1259    37759 	   previlage    TABLE     �   CREATE TABLE public.previlage (
    rno integer NOT NULL,
    previlageid character varying(6),
    previlage character varying(30),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public.previlage;
       public         heap    postgres    false            �            1259    37762    previlage_rno_seq    SEQUENCE     �   ALTER TABLE public.previlage ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.previlage_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236            �            1259    37763    previlagetrigger    TABLE     1  CREATE TABLE public.previlagetrigger (
    rno integer NOT NULL,
    previlageid character varying(6),
    previlage character varying(30),
    lastupdatedby character varying(50),
    updatedon character varying(16),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
 $   DROP TABLE public.previlagetrigger;
       public         heap    postgres    false            �            1259    37766    previlagetrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.previlagetrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.previlagetrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    238            �            1259    37842    products    TABLE     V  CREATE TABLE public.products (
    rno integer NOT NULL,
    productid character varying,
    quantity character varying,
    priceperitem character varying,
    "Lastupdatedby" character varying,
    updatedon timestamp with time zone[],
    productname character varying,
    belongsto character varying,
    status character varying(2)
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    37849    products_rno_seq    SEQUENCE     �   ALTER TABLE public.products ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    248            �            1259    37767    state    TABLE     �   CREATE TABLE public.state (
    rno integer NOT NULL,
    stateid character varying(6),
    statecode character varying(6),
    statename character varying(50),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public.state;
       public         heap    postgres    false            �            1259    37770    state_rno_seq    SEQUENCE     �   ALTER TABLE public.state ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.state_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    240            �            1259    37771    statetrigger    TABLE     M  CREATE TABLE public.statetrigger (
    rno integer NOT NULL,
    stateid character varying(6),
    statecode character varying(6),
    statename character varying(50),
    lastupdatedby character varying(50),
    updatedon character varying(16),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
     DROP TABLE public.statetrigger;
       public         heap    postgres    false            �            1259    37774    statetrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.statetrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.statetrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242            �            1259    37863    summa    TABLE        CREATE TABLE public.summa (
    t1 time with time zone,
    t2 time without time zone,
    t3 timestamp with time zone,
    t4 timestamp without time zone,
    name character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.summa;
       public         heap    postgres    false            �            1259    37775    user    TABLE     V  CREATE TABLE public."user" (
    rno integer NOT NULL,
    userid character varying(20),
    email character varying(50) NOT NULL,
    phno character varying(10),
    altphoneno character varying(10),
    aadhar character varying(20),
    pan character varying(12),
    name character varying(50),
    positionid character varying(2),
    adminid character varying(20),
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
    cpostalcode character varying(6),
    updatedon timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    37780    user_rno_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    244            �            1259    37860    user_user_id_seq    SEQUENCE     |   CREATE SEQUENCE public.user_user_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_user_id_seq;
       public          postgres    false    244            �           0    0    user_user_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".userid;
          public          postgres    false    252            �            1259    37781    usertrigger    TABLE     �  CREATE TABLE public.usertrigger (
    rno integer NOT NULL,
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
    status character varying(1),
    userprofile character varying(10),
    pstreetname character varying(50),
    pdistrictid character varying(50),
    pstateid character varying(30),
    ppostalcode character varying(6),
    cstreetname character varying(50),
    cdistrictid character varying(50),
    cstateid character varying(30),
    cpostalcode character varying(6),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
    DROP TABLE public.usertrigger;
       public         heap    postgres    false            �            1259    37786    usertrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.usertrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usertrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    246            �           2604    37861    user userid    DEFAULT     |   ALTER TABLE ONLY public."user" ALTER COLUMN userid SET DEFAULT ('U'::text || nextval('public.user_user_id_seq'::regclass));
 <   ALTER TABLE public."user" ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    252    244            �          0    37715    accesscontroll 
   TABLE DATA           e   COPY public.accesscontroll (rno, distributer, product, invoice, userid, customer, staff) FROM stdin;
    public          postgres    false    214   ��       �          0    37719    accesscontroltrigger 
   TABLE DATA           �   COPY public.accesscontroltrigger (rno, distributer, product, invoice, userid, customer, staff, operation, dateandtime) FROM stdin;
    public          postgres    false    216   =�       �          0    37723    credentials 
   TABLE DATA           `   COPY public.credentials (rno, userid, username, password, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    218   ��       �          0    37727    credentialstrigger 
   TABLE DATA              COPY public.credentialstrigger (rno, userid, username, password, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    220   ��       �          0    37731    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   ��       �          0    37735    districttrigger 
   TABLE DATA           w   COPY public.districttrigger (rno, stateid, districtid, districtcode, districtname, operation, dateandtime) FROM stdin;
    public          postgres    false    224   ��       �          0    37739    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    226   ��       �          0    37743    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, updatedon, hsncode) FROM stdin;
    public          postgres    false    228   ��       �          0    37850    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    250   ?�       �          0    37747    invoicetrigger 
   TABLE DATA           �   COPY public.invoicetrigger (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    230   m�       �          0    37751    position 
   TABLE DATA           [   COPY public."position" (rno, positionid, "position", lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    232   *�       �          0    37755    positiontrigger 
   TABLE DATA           x   COPY public.positiontrigger (rno, positionid, "position", lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    234   ��       �          0    37759 	   previlage 
   TABLE DATA           Z   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    236   ��       �          0    37763    previlagetrigger 
   TABLE DATA           y   COPY public.previlagetrigger (rno, previlageid, previlage, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    238   ��       �          0    37842    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, "Lastupdatedby", updatedon, productname, belongsto, status) FROM stdin;
    public          postgres    false    248   
�       �          0    37767    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    240   ��       �          0    37771    statetrigger 
   TABLE DATA           |   COPY public.statetrigger (rno, stateid, statecode, statename, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    242   z�       �          0    37863    summa 
   TABLE DATA           A   COPY public.summa (t1, t2, t3, t4, name, created_at) FROM stdin;
    public          postgres    false    253   ��       �          0    37775    user 
   TABLE DATA           �   COPY public."user" (rno, userid, email, phno, altphoneno, aadhar, pan, name, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon) FROM stdin;
    public          postgres    false    244   ��       �          0    37781    usertrigger 
   TABLE DATA             COPY public.usertrigger (rno, userid, email, phno, altphoneno, aadhar, pan, name, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, dateandtime) FROM stdin;
    public          postgres    false    246   N�       �           0    0    accesscontroll_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 25, true);
          public          postgres    false    215            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 22, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.credentials_rno_seq', 27, true);
          public          postgres    false    219            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 29, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    districttrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.districttrigger_rno_seq', 1, false);
          public          postgres    false    225            �           0    0    invoice_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.invoice_id_seq', 1000, false);
          public          postgres    false    254            �           0    0    invoice_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.invoice_rno_seq', 30, true);
          public          postgres    false    227            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 22, true);
          public          postgres    false    229            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    251            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 46, true);
          public          postgres    false    231            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 4, true);
          public          postgres    false    233            �           0    0    positiontrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.positiontrigger_rno_seq', 1, true);
          public          postgres    false    235            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    237            �           0    0    previlagetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.previlagetrigger_rno_seq', 1, false);
          public          postgres    false    239            �           0    0    products_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.products_rno_seq', 14, true);
          public          postgres    false    249            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    241            �           0    0    statetrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.statetrigger_rno_seq', 1, false);
          public          postgres    false    243            �           0    0    user_rno_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.user_rno_seq', 88, true);
          public          postgres    false    245            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    252            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 401, true);
          public          postgres    false    247            �           2606    37788 "   accesscontroll accesscontroll_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.accesscontroll
    ADD CONSTRAINT accesscontroll_pkey PRIMARY KEY (rno);
 L   ALTER TABLE ONLY public.accesscontroll DROP CONSTRAINT accesscontroll_pkey;
       public            postgres    false    214            �           2606    37790 .   accesscontroltrigger accesscontroltrigger_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.accesscontroltrigger
    ADD CONSTRAINT accesscontroltrigger_pkey PRIMARY KEY (rno);
 X   ALTER TABLE ONLY public.accesscontroltrigger DROP CONSTRAINT accesscontroltrigger_pkey;
       public            postgres    false    216            �           2606    37792    credentials credentials_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.credentials DROP CONSTRAINT credentials_pkey;
       public            postgres    false    218            �           2606    37794 *   credentialstrigger credentialstrigger_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.credentialstrigger
    ADD CONSTRAINT credentialstrigger_pkey PRIMARY KEY (rno);
 T   ALTER TABLE ONLY public.credentialstrigger DROP CONSTRAINT credentialstrigger_pkey;
       public            postgres    false    220            �           2606    37796    district district_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (rno);
 @   ALTER TABLE ONLY public.district DROP CONSTRAINT district_pkey;
       public            postgres    false    222            �           2606    37798 $   districttrigger districttrigger_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.districttrigger
    ADD CONSTRAINT districttrigger_pkey PRIMARY KEY (rno);
 N   ALTER TABLE ONLY public.districttrigger DROP CONSTRAINT districttrigger_pkey;
       public            postgres    false    224            �           2606    37800    user email_already_exsist 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT email_already_exsist UNIQUE (email);
 E   ALTER TABLE ONLY public."user" DROP CONSTRAINT email_already_exsist;
       public            postgres    false    244            �           2606    37802 .   credentials email_already_exsist_in_user_table 
   CONSTRAINT     m   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT email_already_exsist_in_user_table UNIQUE (username);
 X   ALTER TABLE ONLY public.credentials DROP CONSTRAINT email_already_exsist_in_user_table;
       public            postgres    false    218            �           2606    37804    invoice invoice_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (rno);
 >   ALTER TABLE ONLY public.invoice DROP CONSTRAINT invoice_pkey;
       public            postgres    false    226            �           2606    37806    invoiceitem invoiceitem_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.invoiceitem
    ADD CONSTRAINT invoiceitem_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.invoiceitem DROP CONSTRAINT invoiceitem_pkey;
       public            postgres    false    228                       2606    37856    invoiceslip invoiceslip_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.invoiceslip
    ADD CONSTRAINT invoiceslip_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.invoiceslip DROP CONSTRAINT invoiceslip_pkey;
       public            postgres    false    250            �           2606    37808 "   invoicetrigger invoicetrigger_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.invoicetrigger
    ADD CONSTRAINT invoicetrigger_pkey PRIMARY KEY (rno);
 L   ALTER TABLE ONLY public.invoicetrigger DROP CONSTRAINT invoicetrigger_pkey;
       public            postgres    false    230            �           2606    37810    position position_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (rno);
 B   ALTER TABLE ONLY public."position" DROP CONSTRAINT position_pkey;
       public            postgres    false    232            �           2606    37812 $   positiontrigger positiontrigger_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.positiontrigger
    ADD CONSTRAINT positiontrigger_pkey PRIMARY KEY (rno);
 N   ALTER TABLE ONLY public.positiontrigger DROP CONSTRAINT positiontrigger_pkey;
       public            postgres    false    234            �           2606    37814    previlage previlage_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.previlage
    ADD CONSTRAINT previlage_pkey PRIMARY KEY (rno);
 B   ALTER TABLE ONLY public.previlage DROP CONSTRAINT previlage_pkey;
       public            postgres    false    236            �           2606    37816 &   previlagetrigger previlagetrigger_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.previlagetrigger
    ADD CONSTRAINT previlagetrigger_pkey PRIMARY KEY (rno);
 P   ALTER TABLE ONLY public.previlagetrigger DROP CONSTRAINT previlagetrigger_pkey;
       public            postgres    false    238            �           2606    37848    products products_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (rno);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    248            �           2606    37818    user set_unique_email 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT set_unique_email UNIQUE (email);
 A   ALTER TABLE ONLY public."user" DROP CONSTRAINT set_unique_email;
       public            postgres    false    244            �           2606    37820    user set_unique_userid 
   CONSTRAINT     U   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT set_unique_userid UNIQUE (userid);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT set_unique_userid;
       public            postgres    false    244            �           2606    37822    state state_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (rno);
 :   ALTER TABLE ONLY public.state DROP CONSTRAINT state_pkey;
       public            postgres    false    240            �           2606    37824    statetrigger statetrigger_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.statetrigger
    ADD CONSTRAINT statetrigger_pkey PRIMARY KEY (rno);
 H   ALTER TABLE ONLY public.statetrigger DROP CONSTRAINT statetrigger_pkey;
       public            postgres    false    242            �           2606    37826    user user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (rno);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    244            �           2606    37828    user userid_already_exsist 
   CONSTRAINT     Y   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT userid_already_exsist UNIQUE (userid);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT userid_already_exsist;
       public            postgres    false    244            �           2606    37830 /   credentials userid_already_exsist_in_user_table 
   CONSTRAINT     l   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT userid_already_exsist_in_user_table UNIQUE (userid);
 Y   ALTER TABLE ONLY public.credentials DROP CONSTRAINT userid_already_exsist_in_user_table;
       public            postgres    false    218            �           2606    37832    usertrigger usertrigger_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usertrigger
    ADD CONSTRAINT usertrigger_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.usertrigger DROP CONSTRAINT usertrigger_pkey;
       public            postgres    false    246                       2620    37833 (   accesscontroll accesscontrolltriggername    TRIGGER     �   CREATE TRIGGER accesscontrolltriggername AFTER INSERT OR DELETE OR UPDATE ON public.accesscontroll FOR EACH ROW EXECUTE FUNCTION public.accesscontrolllog();
 A   DROP TRIGGER accesscontrolltriggername ON public.accesscontroll;
       public          postgres    false    255    214                       2620    37834 "   credentials credentialstriggername    TRIGGER     �   CREATE TRIGGER credentialstriggername AFTER INSERT OR DELETE OR UPDATE ON public.credentials FOR EACH ROW EXECUTE FUNCTION public.credentialslog();
 ;   DROP TRIGGER credentialstriggername ON public.credentials;
       public          postgres    false    218    257                       2620    37835    district districttriggername    TRIGGER     �   CREATE TRIGGER districttriggername AFTER INSERT OR DELETE OR UPDATE ON public.district FOR EACH ROW EXECUTE FUNCTION public.districtlog();
 5   DROP TRIGGER districttriggername ON public.district;
       public          postgres    false    222    269                       2620    37836    invoice invoicetriggername    TRIGGER     �   CREATE TRIGGER invoicetriggername AFTER INSERT OR DELETE OR UPDATE ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.invoicelog();
 3   DROP TRIGGER invoicetriggername ON public.invoice;
       public          postgres    false    226    270                       2620    37837    position positiontriggername    TRIGGER     �   CREATE TRIGGER positiontriggername AFTER INSERT OR DELETE OR UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.positionlog();
 7   DROP TRIGGER positiontriggername ON public."position";
       public          postgres    false    271    232                       2620    37838    previlage previlagetriggername    TRIGGER     �   CREATE TRIGGER previlagetriggername AFTER INSERT OR DELETE OR UPDATE ON public.previlage FOR EACH ROW EXECUTE FUNCTION public.previlagelog();
 7   DROP TRIGGER previlagetriggername ON public.previlage;
       public          postgres    false    236    272                       2620    37839    state statetriggername    TRIGGER     �   CREATE TRIGGER statetriggername AFTER INSERT OR DELETE OR UPDATE ON public.state FOR EACH ROW EXECUTE FUNCTION public.statelog();
 /   DROP TRIGGER statetriggername ON public.state;
       public          postgres    false    273    240            	           2620    37840    user usertriggername    TRIGGER     �   CREATE TRIGGER usertriggername AFTER INSERT OR DELETE OR UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.userlog();
 /   DROP TRIGGER usertriggername ON public."user";
       public          postgres    false    256    244            �   �   x�M�K!C��0U>�v�]w�����i�Ovb���湘�qc�%����F#��}>Lϰ���M"H}�DJ�I,=rޫ��/��(ғ܅R���\��.�����-�I�-�749�L$��D�� 2�      �   r  x���KN�0 �u|�^����9;v� �B���;Fi!�,�h���hb�] p��t7=�\�����x�|�R%W�H))k��<?���7�Z٢f����N��	d�OH��<}��n� TH�9��R
��h�A�����6i�vzA��*�h�Q׹���bbK���Nx+�������#F�qgƋag9c����e1�5����GZ�/�I�@Q�0���Ȟi��gF�be�f?^��,S�P׽�����N���om�����X�b��@D����y���d8Y������83)QY${?e5�o�*JT��s�{(\ 7$\L��}�G�)�$��8B���P�}K~:���S!|���      �   �   x�}�=
�0Fg�0%��n=A�nYL\C�B]���Od� F ޳�H�d�Q�kٮ�5��i~�{2��1��`�v;�a�|�	��A�N��V�ˣ.��I[�U�ьV�U�X���T�?���W�Ht���k'A�er^��Y�$��a2A��nwA/E��&8< ߆��-�C��Ȃ�챧�h��,Qkg:c�Pܯ      �   �  x���Mn1���)|�⿤UN�]w�<Fb v��E�_Jv6q��f0�#E>�)g���òM�_�����쏧��9`F~���&��и$εf���zݽ�λ�jm�ɪT)��]jB3!�rol������E�7�h#M��F�U/�a|�+���u�M���� 9��
�\�]�%����.^g��DY2R�����q~ٝ^�.o���'` ����PĊE������4��RRU���c����$��@]|9�	�2&�����1I��h	�F���_xt�`�a���1�](~��؍Éc�fs��ftF6�$3zJH��nË<5G���5	1�q�Qf��؀�`�<b�	W��5l��L�TUA����J�TJ��9�`	����1nDSߪ��w��X�\t@���U>�}9yA��G���r����;E U�b�|j�)]�>��N�����Ls�������)��ٳ�      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �      x������ � �      �   0   x�34��400��CG�p��	gveH��؀S��Ș��=... ��      �   5   x�34�,000���D\�fx$�9���9A�� C�"klb�i�.���� $��      �      x�3��CA��F�Fh\1z\\\ �	�      �   �  x���Mj�A���S������=A��"PJir�I��|�'C�[?��F��`Q����g���/׿��������1��(��p��A:�Q2���0�� �NF�A������z�Eڠ�ȕ$ �;}H"Gvw`گ�uH���Q�'�(k� ��tB;���N�]�m�9M�Z��R��w�#���Ԁc���=PE���WS)1L�,%�����vM��V�I��49\1�:��5���2��^�Ιǭ�v�؄����|:�]��?����?�L�U�Nd ����烱JcH���i�qʩ�d�
*;N�0�����<T��>/j������A� �uR�.�Ҽ����8K;u�(FUnuz�o7z:�I�j����`��B&Ǐ/ߍG|��bf��t�y���+�E��J�'��5�պW� � ���      �   J   x�3�4��M��LKL.)-J��".#N#Δ�⒢̤Ғ�"��1�1griqI~n*LȄӄ��$1-ʏ����       �   <   x�3�4�,.ILK���̼�ԢN##]C]CCC#+#+Ss=sCc3K#�=... �pg      �      x������ � �      �      x������ � �      �   �   x���=�0�g�=��Gغv�	X�6*�zդ��
�e�)��+��A��!^}��~�P޷@���.�� 6�,�)J:�%�C� o]�����2�!~�1IBV��H�4��4#�<,k����a
�;^��~�خ��9�U�%I+^Wb:��[`��s�4��o�-���l���4�����L�����lp�      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �      x������ � �      �   6   x���㌁��̒�ĢN##]C]Cs##+#c+cs=S3S#�=... i|�      �   a  x����n�0��'O�h�3&W��Z��h�m����r1iP�0�ݷ_�s(d��� 0�����(�`l�?^r����U�mB�H��HI�m�c�y�.�kk��>��KX�1�L�s�f3W�YR���|X'+���Ҵ*L�¦��2��?o�0���W426fb,�H0!��
������s�����!1�����8�|���Z��B��/�b�+&	�[MgHd��5P�8R�pO^�����t�E��.�	
�])"�z�PJ�"�?Ш2�q�	�i&(�����)*Sd���b�x���)s����vES�8Y�L��ݔ��חR�&�2��!���Y4�6��v9E�����>�n��f��An�;�BjI��T���P�!W;ӚR�L����+��6$��~��3=�����ElO
���μ�g�ږ&?!G�;;�$�����1`Ѭv �A�V��u�aJ"EZA�^Fi�nS$�0��}٭���K1�ķ���������}��b�iy����� ���"��a6W�z��#�o�q���9��Y�"S��#��U�,�Z
v�U��ؚ��Y�=��쒨�k��`0��Ɲ�      �      x�՝�n��ǯ�O���&��&�^d��{�e�d����� ٷ����l��X�[}�\a0�8���"Y_d�n��ۛ�y��_������}��������^M������o߿z��+�/*����񉼈WQY�4��W{��է��E���I{�Z[��o�Eo^~6�O~���޽�ӏ���;��xy����E�'�'�%�\l����������$��$N̅Y��Ew�K���TN�E���Ů�m��O����տ�N�
1i��?8�>��ډ�p��"���h?���Q�{����f~/F^�/������������,�@/��h,4�\���}_ꂍH:�kōs�����=v��ى���=r���K|��{��,��'��+%ăr@����|�q�F��B�}�x���r*��=撟6�9����Ն�A���U*���a���Mo~�����{�������jѴ�T'�T��)�$�gXE��#7���_�y� �o��/�����oׁ�"�G�Ig�9B�����4��0_X�qG��H�׿��w�������⇨�s�S*���~��'�=��CE�d�X#O�/�2�T81-��-��NdK_Y�SMջ���f0C,U�-|I;�6�`#%M�v}��gbS/��{�i�.��W��6�sT�Y�E�����l(�4�](ͳ���n���;�(��~�6�����n��?%y�a�@sɧ�j�/��o�/���v������{�S�nݸv��*ݱ�.�����ET*�S��$�h��x��)�Msh|�R̚K���)�M�1C�4*��[,Zw�˺a.}�.��,�io�}��LH��ۢ����Ik2iwYT�aJ9��H��{2��9KK�.���9iE`�j�z[to����N�
{�}��^��d��;9/ڦXO��<�.B��>���DZz���w���('�M�-���373)��A�:S3���%�����q<��2ЌK5���M�:*A{՚Sxon�y��QCl�{s�������PI��*�j.�f6̩v�u��Jݦ*l�hM����3�4!�0%����@�a������f��_nr�Q�	r�~o���妧�!l�α�ޮ�6]�3X��w]|o��q_d�t	}�9N5�c�����3$D�Hp[&��R�I�'[:�Q܌%5�L	���� 
��%fH��Lif}��"��D��^��c���`0�Զ�����}�=���������K�Ny��}���/U"?a��y��tD��E�x�$+����j�	�PO�LT�溺�~ߴ����oqZ���I	�꺴�9�|:�B�vn�6C
'���H	F�����6��B��6�?�2#mj9�W;�ܶ��I�x����tsE����}iWK�l[^�T�i0[,moe�qyu8��U\�6��["����gȊ�L��P�l�i��@���&�N}2��oՅ�>��'���-}��Ε���)}�38�-#�K��q��g��)�d���-}�T���c�,}��,�MZa�����7m$��(��r����	N�&�Z%�fR��m�ro=ᮖ��*88�]�+��L�V�Y�p�9ᮖ��g'�b	W�f�߯P^r6�`�͐�P�z��!�ߐϬ��X�kk2;��}��`O�����M	�I��Q��9�4�%��+��Z�Mf	\k�5 7���JS
 P3DwP]26I�����5f�s�͙.�h�NZ]K�'�yM������(���"�4��ZdB�u�EwԐϐZ�ZQm�rw/N�&)�8۲��i�x�T?J�p�У���9�=�И��$�x}O��P���H�Ш,v4���f9̥��6�S�D֛�&�,��OpZ�K��)��c�OP��T�qM��5�'(ǭ9�&�B����_�<Xo�⨜��-���^n޾��ë�?��������/%��9�g���������Ty�o�~�}����7�yo��o^�x��n߽��Ǐ�^�|w����^��6��'�_t� z�m�,Z��հy+����h��<i�D�-7����%X������X�_���7IW�v݅й*㾘����[)1�In��4`���>����>�D�W|_��ݺJUq�Ш32��Ku'E��\c�ʓ�i�������=���>z@�~}n�Y�đ"i߀������=+��Oi߅��&HVG[4O���U�^�P��	6n�A�v ���,7矟�?�:ܠ��i�r���u_�`ï��Q� �*R�W��|�R�I�Fzf:����=&��QG�CǮ0�j�����a3����TN���u(��=Ѯ"�-�r׹O
��Ѿ�^�?��K3ɹ�|�ڝ2�:�f�L��}�*
�z����ˋ�W��.8Ʋ���6�kW�e_����(�p��y���$��t`\�B��:�F�Ml@��fz]�@s_��Z�絜89���,�6�@Tn�r���C��1Q�9;Z�d�0R�k����_zQ��+.1y� �����8������@�j�F�R�+J�q��׋a���uZ���1|���H����w*>Ge��("$ק���_�B�Q�Ð2.�5��h�ksB�~�-#8O��� Hz�nP��yE�}�M���Ӥ��ޞ�#�����`�h�0J$Z0��ޟ3��� c����RS����Q���Ǩiw�����l�u0�F�D�մ�����ŇW���taށZ���2��`|�0E�T�`�C'eT*뚴��^
|�FF!|Ǯ�����m�
�������[���{EKR�,��(�-W�3E�l;|$D�Z%2�n�ڑ�y?�h�Ո-�C�i���T�tTA�kۓ'�u�׎�<�dj��QF�8���<����R3B�խv���:��ñ^�q���|J-ر%�Z��&;���;��i��_�Ә���+oNs�G���7e������$���-���RMw��쫜�T�*9�'�g�M܃�{>��YM�⌊��Ý�B�Q�!q�m	�g�����g|�QB<Z678x}��b��F��������'��]B�L6�1e}Z����y��K^go˔V�/���3���� >^B�+��cgܒ@G���	��Bs�q�S�o�Ш���'s�S�o�P@=U��@�'�з���&��	"m�Q:St}ầ�(�ɚ��8}���Ki�rIӼ�z�e:��z4���p�
%J�h^_�#� \�}�>R;�<G�+ˈ
��x��=&��렅�X2ڌ19nׂ;���x��a��xC /݈@�,l�0��c-na5Ŏ�n�0�/0�"���!Xw���B�r�����-M'#DA��S�ۅ�%�Q�%s�pz�fϩ�}���Bdsjp�T�
�)��`0���Y�dd�c�g����`�r���+�t��2�d)��o�p\�*<�e44�/�q.B�b��DyB/���{Hlh�P���9˼g�ə[	Gљ��R�Q O�r�([����'ŧ�F+'��e(��G�b�t���������˙��U��$a�d�/���k��T>�q��<\��ha�GC64�[W'5- ��]SȘ�+f���ct��"*�/�Y�J��\��J҆ ��s&��2!�����%q�x����ƻe�6����ń�B�w�����p1�mB#�"J*	��l�^��XD+Rkלi�Y��Q�D������5�Q��v�mT�+Z��١�QW�x��t��p���k����<Y�E�����ѳ�p�	k��s�O8M��d���g�Z��ɥ쇞3�8�
Z�\�~�O�i��&����d���t��t�hp��p���_��)c���g��q������a(x?\'�5�R�B9?\'���*�ډ��}���R<�8���'}jɝ�+倷�6zL����O�r�)������ę@+�2l��@+c�c�̽�9'�ȉ	��P����vL���r��v�R�qXԓ��	۱J��gB��`��oa>�lc��4�U� ڜ�0Ϝ(o�o���I9-�V6ŤG��F{j��Z{r^�h�ɜ��R�x��hwVNl�����h���NI�;��XK�� ��J&q���;l= 4  �^A�k~~�^����c��2@3��)�P�� �^J�ݯ}wg�D�S�D��>�	+���6����qp���1�袖��wIteL��-�M���{b��ę1�ڢ#7�'<��c�u���c������y g�(e#��jw��{�sh���Sw(^ �:�EO��x��GE��I�z����KO�I�̝A�C���D�O,�-Q)�^C4��h��/@�}�i���
Jh�>�{K�KXǫqB�6�;�64U����6��;!�^%Ag�%�v����M�0��8Yc1Bۥ�#7�t,щ�R�K�.P�Ԣ4�]m&*K(%��v����r�rZz��.�>ը1���vi�Q4F��"<�]�>�QԜz��0��*�㖪�Ć���|�C���K
*N|yj�Ĕ�SUOΩnqR�B�[��]�]�@��$\�R]~}B��`����Lg�(䍐5�f��S��g.-eµs�f���N��KW��<�lɴr�@:�=���2 8�P�?$��m�V <`��@W<��sE�N��q�cpjq���
˼�L�f��f��$W/��n�y����L��7�aZ.�.p�m[�C}�jw<�%��V�@x�Y�zJt϶��%�H���_���g /xK��Ӄ�n�5A�1L��Tgzp��3�-@���g�(� �!���n�@V�VMK����� �c��$l����4K�b��iQ���sq�5״��?�rՖz���+��{�PŔ���ҏwV�Pڡj���Ґ��XB���(�1�2;�f�48��4�wi��x�R}G�%����
��jd������3��F�~�V7�ن�ݭt�x��@��v�b->c.g�OI��9q��g���qR�ήH�;�,O����`r�X��2H��dtt r=�����I(���Ԣf �Vf�'����sR�~�!��J�8�8����<h"JU%�}~�#^e��	t��;�Ruh��q��;w@J���Ԕġy��@V�s�4�G<��c;w�N�_q(3���'M�F͕p�t�K�+���WkY�8:fo��RW�}�8Z��@�Bs��\��h�>��n��8�m�G���kr�
���Yn>���SAg��=���T�������q<�^�f����r�n��ĸZ=e��G�VXQ���W�,O�`֠T}�n�@ }�()�����_o�߾����7_��PV����W�>|Ύb�5e!���u�v߇�=�ƾ�l �2��Z3\��`�7��0{ >]� ��Ve�,���}�Z�.�݄���nç�=9$g���ٻ�>`��L�hW,H0/,˲�ҍ�\     