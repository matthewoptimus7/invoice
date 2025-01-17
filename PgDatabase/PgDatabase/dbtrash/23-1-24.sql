PGDMP                          |            terion_billing    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    37871    terion_billing    DATABASE     �   CREATE DATABASE terion_billing WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE terion_billing;
                postgres    false            �            1255    37872    accesscontrolllog()    FUNCTION     �  CREATE FUNCTION public.accesscontrolllog() RETURNS trigger
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
       public          postgres    false            �            1255    37873    credentialslog()    FUNCTION     �  CREATE FUNCTION public.credentialslog() RETURNS trigger
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
       public          postgres    false                       1255    37874    districtlog()    FUNCTION     W  CREATE FUNCTION public.districtlog() RETURNS trigger
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
       public          postgres    false                       1255    37875    invoicelog()    FUNCTION     t  CREATE FUNCTION public.invoicelog() RETURNS trigger
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
       public          postgres    false                       1255    37876    positionlog()    FUNCTION     Q  CREATE FUNCTION public.positionlog() RETURNS trigger
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
       public          postgres    false                       1255    37877    previlagelog()    FUNCTION     [  CREATE FUNCTION public.previlagelog() RETURNS trigger
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
       public          postgres    false                       1255    37878 
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
       public          postgres    false                       1255    37879 	   userlog()    FUNCTION     �  CREATE FUNCTION public.userlog() RETURNS trigger
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
       public          postgres    false            �            1259    37880    accesscontroll    TABLE       CREATE TABLE public.accesscontroll (
    rno integer NOT NULL,
    distributer character varying(2),
    product character varying(2),
    invoice character varying(2),
    userid character varying(6),
    customer character varying(2),
    staff character varying(2)
);
 "   DROP TABLE public.accesscontroll;
       public         heap    postgres    false            �            1259    37883    accesscontroll_rno_seq    SEQUENCE     �   ALTER TABLE public.accesscontroll ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesscontroll_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    37884    accesscontroltrigger    TABLE     j  CREATE TABLE public.accesscontroltrigger (
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
       public         heap    postgres    false            �            1259    37887    accesscontroltrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.accesscontroltrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesscontroltrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    37888    credentials    TABLE     �   CREATE TABLE public.credentials (
    rno integer NOT NULL,
    userid character varying(20),
    username character varying(50),
    password character varying(50),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public.credentials;
       public         heap    postgres    false            �            1259    37891    credentials_rno_seq    SEQUENCE     �   ALTER TABLE public.credentials ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credentials_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    37892    credentialstrigger    TABLE     R  CREATE TABLE public.credentialstrigger (
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
       public         heap    postgres    false            �            1259    37895    credentialstrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.credentialstrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credentialstrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    37896    district    TABLE     �   CREATE TABLE public.district (
    rno integer NOT NULL,
    stateid character varying(6),
    districtid character varying(6),
    districtcode character varying(6),
    districtname character varying(50)
);
    DROP TABLE public.district;
       public         heap    postgres    false            �            1259    37899    district_rno_seq    SEQUENCE     �   ALTER TABLE public.district ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.district_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    37900    districttrigger    TABLE     -  CREATE TABLE public.districttrigger (
    rno integer NOT NULL,
    stateid character varying(6),
    districtid character varying(6),
    districtcode character varying(6),
    districtname character varying(50),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
 #   DROP TABLE public.districttrigger;
       public         heap    postgres    false            �            1259    37903    districttrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.districttrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.districttrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    37904    invoice    TABLE     �  CREATE TABLE public.invoice (
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
       public         heap    postgres    false            �            1259    37907    invoice_id_seq    SEQUENCE     z   CREATE SEQUENCE public.invoice_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.invoice_id_seq;
       public          postgres    false    226            �           0    0    invoice_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.invoice_id_seq OWNED BY public.invoice.invoiceid;
          public          postgres    false    227            �            1259    37908    invoice_rno_seq    SEQUENCE     �   ALTER TABLE public.invoice ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoice_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    37909    invoiceitem    TABLE     d  CREATE TABLE public.invoiceitem (
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
       public         heap    postgres    false            �            1259    37914    invoiceitem_rno_seq    SEQUENCE     �   ALTER TABLE public.invoiceitem ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoiceitem_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    229            �            1259    37915    invoiceslip    TABLE     �  CREATE TABLE public.invoiceslip (
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
       public         heap    postgres    false            �            1259    37920    invoiceslip_rno_seq    SEQUENCE     �   ALTER TABLE public.invoiceslip ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoiceslip_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            �            1259    37921    invoicetrigger    TABLE     "  CREATE TABLE public.invoicetrigger (
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
       public         heap    postgres    false            �            1259    37924    invoicetrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.invoicetrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoicetrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    37925    position    TABLE     �   CREATE TABLE public."position" (
    rno integer NOT NULL,
    positionid character varying(2),
    "position" character varying(20),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public."position";
       public         heap    postgres    false            �            1259    37928    position_rno_seq    SEQUENCE     �   ALTER TABLE public."position" ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.position_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    37929    positiontrigger    TABLE     0  CREATE TABLE public.positiontrigger (
    rno integer NOT NULL,
    positionid character varying(2),
    "position" character varying(20),
    lastupdatedby character varying(50),
    updatedon character varying(16),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
 #   DROP TABLE public.positiontrigger;
       public         heap    postgres    false            �            1259    37932    positiontrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.positiontrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.positiontrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    37933 	   previlage    TABLE     �   CREATE TABLE public.previlage (
    rno integer NOT NULL,
    previlageid character varying(6),
    previlage character varying(30),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public.previlage;
       public         heap    postgres    false            �            1259    37936    previlage_rno_seq    SEQUENCE     �   ALTER TABLE public.previlage ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.previlage_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    37937    previlagetrigger    TABLE     1  CREATE TABLE public.previlagetrigger (
    rno integer NOT NULL,
    previlageid character varying(6),
    previlage character varying(30),
    lastupdatedby character varying(50),
    updatedon character varying(16),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
 $   DROP TABLE public.previlagetrigger;
       public         heap    postgres    false            �            1259    37940    previlagetrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.previlagetrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.previlagetrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    37941    products    TABLE     V  CREATE TABLE public.products (
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
       public         heap    postgres    false            �            1259    37946    products_rno_seq    SEQUENCE     �   ALTER TABLE public.products ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    243            �            1259    37947    state    TABLE     �   CREATE TABLE public.state (
    rno integer NOT NULL,
    stateid character varying(6),
    statecode character varying(6),
    statename character varying(50),
    lastupdatedby character varying(50),
    updatedon character varying(16)
);
    DROP TABLE public.state;
       public         heap    postgres    false            �            1259    37950    state_rno_seq    SEQUENCE     �   ALTER TABLE public.state ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.state_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    245            �            1259    37951    statetrigger    TABLE     M  CREATE TABLE public.statetrigger (
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
       public         heap    postgres    false            �            1259    37954    statetrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.statetrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.statetrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    247            �            1259    37961    user    TABLE     _  CREATE TABLE public."user" (
    rno integer NOT NULL,
    userid character varying(20) NOT NULL,
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
       public         heap    postgres    false            �            1259    37967    user_rno_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    249            �            1259    37968    user_user_id_seq    SEQUENCE     |   CREATE SEQUENCE public.user_user_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_user_id_seq;
       public          postgres    false    249            �           0    0    user_user_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".userid;
          public          postgres    false    251            �            1259    37969    usertrigger    TABLE     �  CREATE TABLE public.usertrigger (
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
       public         heap    postgres    false            �            1259    37974    usertrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.usertrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usertrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    252            �           2604    37975    user userid    DEFAULT     |   ALTER TABLE ONLY public."user" ALTER COLUMN userid SET DEFAULT ('U'::text || nextval('public.user_user_id_seq'::regclass));
 <   ALTER TABLE public."user" ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    251    249            �          0    37880    accesscontroll 
   TABLE DATA           e   COPY public.accesscontroll (rno, distributer, product, invoice, userid, customer, staff) FROM stdin;
    public          postgres    false    214   ��       �          0    37884    accesscontroltrigger 
   TABLE DATA           �   COPY public.accesscontroltrigger (rno, distributer, product, invoice, userid, customer, staff, operation, dateandtime) FROM stdin;
    public          postgres    false    216   ;�       �          0    37888    credentials 
   TABLE DATA           `   COPY public.credentials (rno, userid, username, password, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    218   ��       �          0    37892    credentialstrigger 
   TABLE DATA              COPY public.credentialstrigger (rno, userid, username, password, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    220   ��       �          0    37896    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   ��       �          0    37900    districttrigger 
   TABLE DATA           w   COPY public.districttrigger (rno, stateid, districtid, districtcode, districtname, operation, dateandtime) FROM stdin;
    public          postgres    false    224   ��       �          0    37904    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    226   ��       �          0    37909    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, updatedon, hsncode) FROM stdin;
    public          postgres    false    229   �       �          0    37915    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    231   L�       �          0    37921    invoicetrigger 
   TABLE DATA           �   COPY public.invoicetrigger (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    233   z�       �          0    37925    position 
   TABLE DATA           [   COPY public."position" (rno, positionid, "position", lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    235   7�       �          0    37929    positiontrigger 
   TABLE DATA           x   COPY public.positiontrigger (rno, positionid, "position", lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    237   ��       �          0    37933 	   previlage 
   TABLE DATA           Z   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    239   ��       �          0    37937    previlagetrigger 
   TABLE DATA           y   COPY public.previlagetrigger (rno, previlageid, previlage, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    241   ��       �          0    37941    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, "Lastupdatedby", updatedon, productname, belongsto, status) FROM stdin;
    public          postgres    false    243   �       �          0    37947    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    245   ��       �          0    37951    statetrigger 
   TABLE DATA           |   COPY public.statetrigger (rno, stateid, statecode, statename, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    247   J�       �          0    37961    user 
   TABLE DATA           �   COPY public."user" (rno, userid, email, phno, altphoneno, aadhar, pan, name, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon) FROM stdin;
    public          postgres    false    249   g�       �          0    37969    usertrigger 
   TABLE DATA             COPY public.usertrigger (rno, userid, email, phno, altphoneno, aadhar, pan, name, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, dateandtime) FROM stdin;
    public          postgres    false    252   ��       �           0    0    accesscontroll_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 25, true);
          public          postgres    false    215            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 22, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.credentials_rno_seq', 27, true);
          public          postgres    false    219            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 30, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    districttrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.districttrigger_rno_seq', 1, false);
          public          postgres    false    225            �           0    0    invoice_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.invoice_id_seq', 1000, false);
          public          postgres    false    227            �           0    0    invoice_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.invoice_rno_seq', 30, true);
          public          postgres    false    228            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 22, true);
          public          postgres    false    230            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    232            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 46, true);
          public          postgres    false    234            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 4, true);
          public          postgres    false    236            �           0    0    positiontrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.positiontrigger_rno_seq', 1, true);
          public          postgres    false    238            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    240            �           0    0    previlagetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.previlagetrigger_rno_seq', 1, false);
          public          postgres    false    242            �           0    0    products_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.products_rno_seq', 33, true);
          public          postgres    false    244            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    246            �           0    0    statetrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.statetrigger_rno_seq', 1, false);
          public          postgres    false    248            �           0    0    user_rno_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.user_rno_seq', 88, true);
          public          postgres    false    250            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    251            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 466, true);
          public          postgres    false    253            �           2606    37977 "   accesscontroll accesscontroll_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.accesscontroll
    ADD CONSTRAINT accesscontroll_pkey PRIMARY KEY (rno);
 L   ALTER TABLE ONLY public.accesscontroll DROP CONSTRAINT accesscontroll_pkey;
       public            postgres    false    214            �           2606    37979 .   accesscontroltrigger accesscontroltrigger_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.accesscontroltrigger
    ADD CONSTRAINT accesscontroltrigger_pkey PRIMARY KEY (rno);
 X   ALTER TABLE ONLY public.accesscontroltrigger DROP CONSTRAINT accesscontroltrigger_pkey;
       public            postgres    false    216            �           2606    37981    credentials credentials_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.credentials DROP CONSTRAINT credentials_pkey;
       public            postgres    false    218            �           2606    37983 *   credentialstrigger credentialstrigger_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.credentialstrigger
    ADD CONSTRAINT credentialstrigger_pkey PRIMARY KEY (rno);
 T   ALTER TABLE ONLY public.credentialstrigger DROP CONSTRAINT credentialstrigger_pkey;
       public            postgres    false    220            �           2606    37985    district district_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (rno);
 @   ALTER TABLE ONLY public.district DROP CONSTRAINT district_pkey;
       public            postgres    false    222            �           2606    37987 $   districttrigger districttrigger_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.districttrigger
    ADD CONSTRAINT districttrigger_pkey PRIMARY KEY (rno);
 N   ALTER TABLE ONLY public.districttrigger DROP CONSTRAINT districttrigger_pkey;
       public            postgres    false    224            �           2606    37989    user email_already_exsist 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT email_already_exsist UNIQUE (email);
 E   ALTER TABLE ONLY public."user" DROP CONSTRAINT email_already_exsist;
       public            postgres    false    249            �           2606    37991 .   credentials email_already_exsist_in_user_table 
   CONSTRAINT     m   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT email_already_exsist_in_user_table UNIQUE (username);
 X   ALTER TABLE ONLY public.credentials DROP CONSTRAINT email_already_exsist_in_user_table;
       public            postgres    false    218            �           2606    37993    invoice invoice_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (rno);
 >   ALTER TABLE ONLY public.invoice DROP CONSTRAINT invoice_pkey;
       public            postgres    false    226            �           2606    37995    invoiceitem invoiceitem_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.invoiceitem
    ADD CONSTRAINT invoiceitem_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.invoiceitem DROP CONSTRAINT invoiceitem_pkey;
       public            postgres    false    229            �           2606    37997    invoiceslip invoiceslip_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.invoiceslip
    ADD CONSTRAINT invoiceslip_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.invoiceslip DROP CONSTRAINT invoiceslip_pkey;
       public            postgres    false    231            �           2606    37999 "   invoicetrigger invoicetrigger_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.invoicetrigger
    ADD CONSTRAINT invoicetrigger_pkey PRIMARY KEY (rno);
 L   ALTER TABLE ONLY public.invoicetrigger DROP CONSTRAINT invoicetrigger_pkey;
       public            postgres    false    233            �           2606    38001    position position_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (rno);
 B   ALTER TABLE ONLY public."position" DROP CONSTRAINT position_pkey;
       public            postgres    false    235            �           2606    38003 $   positiontrigger positiontrigger_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.positiontrigger
    ADD CONSTRAINT positiontrigger_pkey PRIMARY KEY (rno);
 N   ALTER TABLE ONLY public.positiontrigger DROP CONSTRAINT positiontrigger_pkey;
       public            postgres    false    237            �           2606    38005    previlage previlage_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.previlage
    ADD CONSTRAINT previlage_pkey PRIMARY KEY (rno);
 B   ALTER TABLE ONLY public.previlage DROP CONSTRAINT previlage_pkey;
       public            postgres    false    239            �           2606    38007 &   previlagetrigger previlagetrigger_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.previlagetrigger
    ADD CONSTRAINT previlagetrigger_pkey PRIMARY KEY (rno);
 P   ALTER TABLE ONLY public.previlagetrigger DROP CONSTRAINT previlagetrigger_pkey;
       public            postgres    false    241            �           2606    38009    products products_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (rno);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    243            �           2606    38011    user set_unique_email 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT set_unique_email UNIQUE (email);
 A   ALTER TABLE ONLY public."user" DROP CONSTRAINT set_unique_email;
       public            postgres    false    249            �           2606    38013    user set_unique_userid 
   CONSTRAINT     U   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT set_unique_userid UNIQUE (userid);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT set_unique_userid;
       public            postgres    false    249            �           2606    38015    state state_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (rno);
 :   ALTER TABLE ONLY public.state DROP CONSTRAINT state_pkey;
       public            postgres    false    245            �           2606    38017    statetrigger statetrigger_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.statetrigger
    ADD CONSTRAINT statetrigger_pkey PRIMARY KEY (rno);
 H   ALTER TABLE ONLY public.statetrigger DROP CONSTRAINT statetrigger_pkey;
       public            postgres    false    247            �           2606    38040    products unique_product_id 
   CONSTRAINT     Z   ALTER TABLE ONLY public.products
    ADD CONSTRAINT unique_product_id UNIQUE (productid);
 D   ALTER TABLE ONLY public.products DROP CONSTRAINT unique_product_id;
       public            postgres    false    243            �           2606    38019    user user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (rno);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    249            �           2606    38021    user userid_already_exsist 
   CONSTRAINT     Y   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT userid_already_exsist UNIQUE (userid);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT userid_already_exsist;
       public            postgres    false    249            �           2606    38023 /   credentials userid_already_exsist_in_user_table 
   CONSTRAINT     l   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT userid_already_exsist_in_user_table UNIQUE (userid);
 Y   ALTER TABLE ONLY public.credentials DROP CONSTRAINT userid_already_exsist_in_user_table;
       public            postgres    false    218            �           2606    38025    usertrigger usertrigger_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usertrigger
    ADD CONSTRAINT usertrigger_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.usertrigger DROP CONSTRAINT usertrigger_pkey;
       public            postgres    false    252            �           2620    38026 (   accesscontroll accesscontrolltriggername    TRIGGER     �   CREATE TRIGGER accesscontrolltriggername AFTER INSERT OR DELETE OR UPDATE ON public.accesscontroll FOR EACH ROW EXECUTE FUNCTION public.accesscontrolllog();
 A   DROP TRIGGER accesscontrolltriggername ON public.accesscontroll;
       public          postgres    false    254    214                        2620    38027 "   credentials credentialstriggername    TRIGGER     �   CREATE TRIGGER credentialstriggername AFTER INSERT OR DELETE OR UPDATE ON public.credentials FOR EACH ROW EXECUTE FUNCTION public.credentialslog();
 ;   DROP TRIGGER credentialstriggername ON public.credentials;
       public          postgres    false    218    255                       2620    38028    district districttriggername    TRIGGER     �   CREATE TRIGGER districttriggername AFTER INSERT OR DELETE OR UPDATE ON public.district FOR EACH ROW EXECUTE FUNCTION public.districtlog();
 5   DROP TRIGGER districttriggername ON public.district;
       public          postgres    false    267    222                       2620    38029    invoice invoicetriggername    TRIGGER     �   CREATE TRIGGER invoicetriggername AFTER INSERT OR DELETE OR UPDATE ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.invoicelog();
 3   DROP TRIGGER invoicetriggername ON public.invoice;
       public          postgres    false    226    268                       2620    38030    position positiontriggername    TRIGGER     �   CREATE TRIGGER positiontriggername AFTER INSERT OR DELETE OR UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.positionlog();
 7   DROP TRIGGER positiontriggername ON public."position";
       public          postgres    false    235    269                       2620    38031    previlage previlagetriggername    TRIGGER     �   CREATE TRIGGER previlagetriggername AFTER INSERT OR DELETE OR UPDATE ON public.previlage FOR EACH ROW EXECUTE FUNCTION public.previlagelog();
 7   DROP TRIGGER previlagetriggername ON public.previlage;
       public          postgres    false    239    270                       2620    38032    state statetriggername    TRIGGER     �   CREATE TRIGGER statetriggername AFTER INSERT OR DELETE OR UPDATE ON public.state FOR EACH ROW EXECUTE FUNCTION public.statelog();
 /   DROP TRIGGER statetriggername ON public.state;
       public          postgres    false    271    245                       2620    38033    user usertriggername    TRIGGER     �   CREATE TRIGGER usertriggername AFTER INSERT OR DELETE OR UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.userlog();
 /   DROP TRIGGER usertriggername ON public."user";
       public          postgres    false    272    249            �   �   x�M�K!C��0U>�v�]w�����i�Ovb���湘�qc�%����F#��}>Lϰ���M"H}�DJ�I,=rޫ��/��(ғ܅R���\��.�����-�I�-�749�L$��D�� 2�      �   r  x���KN�0 �u|�^����9;v� �B���;Fi!�,�h���hb�] p��t7=�\�����x�|�R%W�H))k��<?���7�Z٢f����N��	d�OH��<}��n� TH�9��R
��h�A�����6i�vzA��*�h�Q׹���bbK���Nx+�������#F�qgƋag9c����e1�5����GZ�/�I�@Q�0���Ȟi��gF�be�f?^��,S�P׽�����N���om�����X�b��@D����y���d8Y������83)QY${?e5�o�*JT��s�{(\ 7$\L��}�G�)�$��8B���P�}K~:���S!|���      �   �   x�}��
�0Eg�c��i�~A�nYL\C�B]���Wt� A Ή�G�(�Z�ˣ���W�� ˵?�LMkCm��R��SC4�Ԃ:��g����i﹨:Z�
�"
�� � �U�D .�E>��vD�7�9H����;l& ��G��#�(	��}���,;�G
���Fڌv������
�Bˤ��ge�M      �   �  x���Mn�1���)�@,Ϸ�UN�]w� �(A
�
T�~ǆl
����<�yo s�p|~ݯw�i�k^~\>��q�q
���2<�ʵ14.�s�Y"~�^������Zc�*UJ��.5���Dy�n������E}�n�F�4�v�^/����.�?���u	�H$ȱt�w�j �r,I-ְt�2+�&�Ȓ�H���������w��>��	�
�e�$�b lz;:l7� ��T��)v���&pn$	�n�P��y����A�8���|L��:F�@�$�;�S(X�D.�qL��.x�j�F����ٚ���Æ#L2C��0PB2�}^�a�9�n �I����Í20����x��O� ��a+�g������Fx*�R)E2G���%l�CǸe`LE|��c܍��耄��S��}9yC��G���r���+�"�*e1�XnZc
D���G�˩}8������@0y�|A��5R�m���xlGo�f�R�K�1�t�      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �      x������ � �      �   0   x�34��400��CG�p��	gveH��؀S��Ș��=... ��      �   5   x�34�,000���D\�fx$�9���9A�� C�"klb�i�.���� $��      �      x�3��CA��F�Fh\1z\\\ �	�      �   �  x���Mj�A���S������=A��"PJir�I��|�'C�[?��F��`Q����g���/׿��������1��(��p��A:�Q2���0�� �NF�A������z�Eڠ�ȕ$ �;}H"Gvw`گ�uH���Q�'�(k� ��tB;���N�]�m�9M�Z��R��w�#���Ԁc���=PE���WS)1L�,%�����vM��V�I��49\1�:��5���2��^�Ιǭ�v�؄����|:�]��?����?�L�U�Nd ����烱JcH���i�qʩ�d�
*;N�0�����<T��>/j������A� �uR�.�Ҽ����8K;u�(FUnuz�o7z:�I�j����`��B&Ǐ/ߍG|��bf��t�y���+�E��J�'��5�պW� � ���      �   J   x�3�4��M��LKL.)-J��".#N#Δ�⒢̤Ғ�"��1�1griqI~n*LȄӄ��$1-ʏ����       �   <   x�3�4�,.ILK���̼�ԢN##]C]CCC#+#+Ss=sCc3K#�=... �pg      �      x������ � �      �      x������ � �      �   �   x�M�A
�0E�?��	��Č�ݔ��H��4�z��Y|����e(<��b|��G�d�ᴳ�`*_�<�a�bJa�P)��U�	�SOC1R9nH؎��|�L�sh��i/�*���5ލ1_��(y      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �      x������ � �      �   `  x����n�0ƯO����FUM�.:�R�ir�P�6Ŏڽ�l��
4Q8q�����cs!��K��I�) I� �"�a� ��ʤ�n�$��£ӫ0�BVL��
���%��A��1!S¦\Ma����M��-��N.�J"g��<���O�'!܅zk�����p
�?�T��֏Ln]�����9�M7&�̕�ȠI�.7��I9C����iq+��s5��P�y�s�6��p�WC�	Xr�H��?
����'�F��N��R=X]I�$��!���[�fd�}|��֥�e�ڎ8��[��ۺ�!��h�*
e�֙]��J���Z�C��B;���]���_d���m���nOzw����}Z��E:��{8���ۓɦ!m���;�<�_� w�c�����'42xRh����a؛�6��r�U.W *Oa%�0v���~}�V��tq��܌��M�r6��_MFBV� �,�U$�.���SY�u ��'q�th��]��;k�b�b��})���̮m���x�J�XČ뷸��pE�19��b�����B���0<�[c9�F� �p�d      �      x�՝[o%��ǟO��!Ⱥ��ix$q�/�H�����H{��֟-i�3gti�Qӂb˚��_ɺ�UԲ��O���������g��N���k�-�0�?^�}yu}��fG��w��.�R����[f��D>����������{���D9���
���<�Wpy}����n~����>��O�g�Z�嶧�/-���N��ι쮿��W	�?�}O���q�dŧJ�?Mx����bu�S��H|�,�Γ���t�5*�}jO>M^�juO��]c����ӎ���<	��b���ڞ-i�\m*����vs��������ZjMX|*}��S��]������dJ�'����=�y_�_�=	�Ϛ��d��9�����������j��l^�����u��R�Zj+S���랧P�b�5��>1q�1�����gھ���b�Q3��Q�\���0B�n*�?�忿�*��iel5�S45,�^<Tl���#���V�>���?���[��EӁ�@�˩W->(~;?�+�y�4�c�$�>K�UB:ёy�wT����߾���������c�k*~�*?��t�akP��iKZ���B��3���Y�S������J�;��Ŧ0C�Y�NtL;o���`-R$��cl��o�&�rc��vZ����_Wa�rU�6q>\y9�v�q	�̳-�����D�����s�`�#n�B��k�g�#4�|ڥ����v���l���6�G�U䯙�y��՚27ú:�Bo /-0.,���|&�Ir+�&>��^4�J��I���:��^�#��⒩�$y���Һ-��M=���ݗ̯΄D���Nr$	���$�4�Ix��S���4�~�>g���y��� '�lB�k�����2�}.���nm���I��b4Ib>I��;w	G\�r�}����źӵ��B9)l2�mQ�tm���IJ��%cCgJv�G�9�9�7v]:�R���i�AT�C%H˒c�ml"��ȳ�N�hn�]=�k����Ck��8����c*�b���R��
�&Z��k6�H)CH��MF���Pk �0�TD�d�f��^n�Ϟ�2r��h����&�!l�F>�ڮ�2]�=X��*5�lm��p]:`�p	m���9�c����d#$D��qZ&��4�4���pV=�*qh��"���Ad�n�����"����k'D2پ�T[Ɯ�"���Ĝ��k;�ס#�6���G��g6K�Z���G��}�|���
��̻_� 2̯�&!A23I*�MB_�� �Ꞃ�d�1�N���y�y��)V�:�~'GR�<�L�d���)N)���@!����JO	������w6��B��:�ߙ"+REcO���lz�=K��K�k����%-fS=Y
g��j��w�I}�k+��ӫ��&l<ձ�=��	�Z�6BV|f�ɹ�Ȧ6��o4��*�6�SLp�k6�����΢Km^�6�n���R�_r��N}�hO��5lq��|E�&�J�ͦ6R�~f��gOm��,��k"o>���7�'�(Ia��0'��/�E�%s����;[��V[��,i�Tpp�W�W䓙���SO�$Q��,��N�BI.c=�����,�hV�\!�ߡ�R���9B�"��)ܱ�2��`v���d�Np��תg���F4�a-�Y��B>ѵ�`����Zp#ߙ�$Q	 j�(��q�&���{n:Ǵ`�ks�<3��������_��n0{�K� 8/��p,2��<Ӽj�G� �P5�T�1���.�T���R�"a�h�T?Jʰ�м���1�=�И��$�����(\Z��4Fڧ��bC�Hj��ܒ��rJ��Z5��%��NRi�K�����g(e*����3��ԜQD�|���z��'�-g�=�$�@�)�ݷ������?�|���*��Pb��}�#�Ǘ�W��=����_>�]ݜ]]���������?������g?}�x���������,~�+�N���2u�����O�dش�P��7�'������{|8�/�����%�>�`?��E�eƶ]3.�\��.&��4c)fU�%�
L��Xg��\:a%#�/1+��e[���D��R)���_v`����"XU��k��\7+_����s�5B}����ܼX���p�o�����r���5�'e݉��"VC[4���U�Z�PN�.�N�v ��̻ۯ/偯'?'�<y{�\���?�>�b�{;�x��r<2�G���FH���3��x�7�XO��1���:���W����W������Š��Ӕ)�"F���{�D=�D�p�]�>NsFDںz���ZK3�m�?���Y�@P���8i��3W4(�������z^	'��cK��6�k��y]���j{�Z8Z�~��$��eø|��MuT��7Ѿ��V�Ut8�}5V�<������qi�~"SE�c.,��<��Z����&b��ڞ��7�<��:'eb2wF~m.���q~�����@���F�R�J�y�GǞ�a-��u�ߌ�9|�i�p����w(>Ce�
"$������K#�|��!�ʍ-}uL�ޏ�Fg�љm Y�A�kE�*T��v^x�eӹk�0��x�շ�v9���mz�DuB��[F����`5ԕQhJ����[3��1J�'��-�6��{#�Rj�aŝV�㻛��?�^�w��#p����i(��#LBQ~ɢ0�.�2JI����[����ۊ]W���[�!�N�'�7l�H"�+���$/�l��{[.gg�6�r�'D��#Ʈ�ڑ/�C^���쪅4�C-î[F�Rjꨂ���'��'�R�myJ�F�	��������pJK9"TݪGnz���;m)��(ՆԂKB�f\m����Jj�ᘙ���+c�<\��}�iNZ����p�L>��R��DS���<�Pӭ��UN�"��F�3�&1�A�5�X�{2BEE ���j !��R�8l:���35���A[3�X(!��)��f|�PB�Es||Ź�v�J�7�*��J�6�Β�m���4Q^�&��#��eR�f�����#)�.B �^B�#��cG�@[�����\b�Q^S�/�P����'S^S�/��C=eR�@�'�з�����	"��R:t}���_(��*�8m���Ka�bJ�q}��}�pֱ�ʸ�z��+�h�P���b��� �.�Kj��g�r��C���&,�ɵ�:h���:bL���9�L�{{CIٝ	2��P �R�B
��
�eq�$S��bŋy�e��c�rߐ6�����f.��`ё��Z:N���f���ǒ;��Jf{�DU<0S�[���[������)wNC&���`�.�!���H�����#��ʡ���N��y�˨��%Q�-�q>a��:�Qѐ>��J1	����+���̱�C<�&��C�F����g,l$YF'qR�G�<u�eD�l�+�=�6�2�9�hL4B���8� �`�;�78W>��^n9�>��]�1wfLR�­�4�J�SP�;�-�W��ZX�Q G��u	9�ҕAM@{1w�2���Y����񁵊�J�afİ�9{F"W�;�� �űP�1	�ƶ�A� �#��J���8�Ik����l��G�r��5ޙ"0*Nx�� ����ȡ$
�d}�B��"j✛�H+��hɴ4��J�K���k�I7=�
�nEsi�E��i��2�F�5`�\��ⴂc���_<X�y�����г����Φ��q���e��3���ֲ�NLe�t�a�њ�b ����gxM�6�6�g N� �7�����_E��Řț�d\���Uc��N�ũ����N�-\�"���u2n�L�JE(g����S�P;�a��{�,�5.���N�q§�XY��Rvx;��b�� J8�q%)�枲��j-�|��2Y**���h厣�������0�'r| ��%��co���G(fr�V)S�,jAS�	�J�n���� ���|����iaZ�@�1Oa�r�@�f����o�Ԉ�j�X�n��B�Kn�y­�Ws����� �E��rb��^F���&pjObHS���Z�I�P2��N� �  �a��*�I������n[Π�p�_P-����K��۩��,�(@[h�8��a%4_���TD"n��e9���n��ê4���xgDo59Y�b��-c�zCn��k{���'�ۦ�Q9+j�����8ܫ݅C�Φu�8�Cp1�AzT����+
8z�sG�ŉ[��g��_���K8�{����b�%@}h��/��ԧ@_'Q�K�����s��D-�6��e�&u��Mռ�M����N
{����E;Q��*�����Փ�.ۥ
�#<7Lс�R�K.��Тe`���Ldb��ۥ��w�Ja���v����Z*a�l�zE%�NLۥ��i�CO�:e7�Re�0�ޘ�=7Ht`�TqHA�
_�2Q	�)��І	�8��B��i��]�n]@�[ٍ�Rn]~}����t��-�n�<�Y�S�Y��(�s��*8vΧ��~�� 8[jR�!�1[2͜��n�0��= NM����s�|3.P���n��n�)�w�j���8�?8%YiU�
��L�F�m����'/�^n������� 7��2_\@�#��5۶.3���`�f���7����p�3��˚m[KH��S����}�o�,�.�vL6��a�z	u&�ݾ�ĽH m�v��S(6Hh��3��D"Y�R��m�$h P��a��$,���	W����i{�����l�r�i�TO��2�zZ7��3���)C����
?�H�C����;C�R��TO�@޷I�� 4b�Ω@5x��i��(Է�/����xf B�P-*�舭��0Cn��b�Ӷ�����`ܻ��m��(BS��[��F��̜�*�>'�Rو��;�⩑	��v�W˓p�E$�#Vv�s�B�]�㚌�D&��>beGp��ƍR=G 0Wf�'��I᎓;R���&��Q�+���;�<h"Z�p mz��=ne�����;�@�:�YW����; )���)�M���@����0�[\��c��.v?cS�G��'v�z��I�fӶ79�@��6d}똡�5�KM�M}k�>�
��Rc�׭uz*ht�ƹ��h�sF8�ULI�s�TP	��ŧ� �q*�(lO%48�!��]�~�{�8�pC/���{�9{�J�B8Z=d��=gM$(E����'V0��P}���^ z�(
����������?�}�
����˫닏7�Q,<�,���F���n�_�j�k.�`(O�Vš�f .y�>�0���Үl�{˂�m���zi�&�Ù]�O�p{����7���u��P3�]1#�����{�=b��j�Xm�A<b��uτ`�(c�#8GL��qjI�qOdp�	W՗�l^��f�\�1+��6��y;8�J�J�����T��o^��o�V�Uq�sJ�6��j̃r�6���<�[�CP)8,"e4�u�(ɛ6�`<a���r�ܷ4L�����?ѓƪ�P�eL��*.�mIj<9�wqw�7T��1qw莳�g�M,)#n�cZB7�8߼K��KH��aSm}�߼K�s[
C���BZ��K5���:3#%R��F<�0s22ہE%�$��rRj5>c>���sv������	|���������z��4�Z���nH��������c��𧟟x����ov?����ǋ����������������T?����bw}sqqsu��b7�����]�����yU��+�N�~�#�(��CI�,��4M����O7?~�2q�m�9t��=d�����6g��_�,��ь���<LӔBr�.o~����糏gW�l�'c��|����v�����^y��W�������o���o��W�R�W?�Ŏ)�O���l4����l?"�T��?{�Ӹ'���]1y��R�]���h�(�CJ%����>�L7��9�g����Xg�~wuBA;8��XϏ�5�J�\#�R��I#y�]�#�e�$�!���r��bnx)J��oU�C���xq�U\	��T�w'�B�R��M�3��ͱ��iT�F��ͱˤ��HNb��$[[ ���L��I4�6܃�(CD�P���;�cƸ��r�u�(� �N�<��s0�ȁ�k�ME����<v�{@[ƍuH7�P�Ō<~|y@,���o~����x��K���4M��,�     