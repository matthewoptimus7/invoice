PGDMP     /    3                 |            terion_billing    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    37871    terion_billing    DATABASE     �   CREATE DATABASE terion_billing WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE terion_billing;
                postgres    false                       1255    37872    accesscontrolllog()    FUNCTION     =  CREATE FUNCTION public.accesscontrolllog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO accesscontroltrigger(distributer,product,invoicegenerator,userid,customer,staff,invoicepayslip,operation,dateandtime)
	VALUES(NEW.distributer,NEW.product,NEW.invoicegenerator,NEW.userid,NEW.customer,NEW.staff,NEW.invoicepayslip,'insert',current_timestamp);
   
   ELSIF TG_OP = 'DELETE' THEN
       
        INSERT INTO accesscontroltrigger(distributer,product,invoicegenerator,userid,customer,staff,invoicepayslip,operation,dateandtime)
	VALUES(OLD.distributer,OLD.product,OLD.invoicegenerator,OLD.userid,OLD.customer,OLD.staff,OLD.invoicepayslip,'delete',current_timestamp);
     
	 ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO accesscontroltrigger(distributer,product,invoicegenerator,userid,customer,staff,invoicepayslip,operation,dateandtime)
	VALUES(NEW.distributer,NEW.product,NEW.invoicegenerator,NEW.userid,NEW.customer,NEW.staff,NEW.invoicepayslip,'update',current_timestamp);
       
   
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
       public          postgres    false            �            1255    37879 	   userlog()    FUNCTION     �	  CREATE FUNCTION public.userlog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO usertrigger(userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,dateandtime,organizationname,gstno,bussinesstype,fname,lname,upiid,bankname,bankaccno,passbookimg)
	VALUES( NEW.userid, NEW.email, NEW.phno, NEW.aadhar,NEW.pan, NEW.positionid, NEW.adminid, NEW.updatedby, NEW.status, NEW.userprofile, NEW.pstreetname, NEW.pdistrictid, NEW.pstateid, NEW.ppostalcode, NEW.cstreetname, NEW.cdistrictid, NEW.cstateid, NEW.cpostalcode,'insert',current_timestamp,NEW.organizationname,NEW.gstnno,NEW.bussinesstype,NEW.fname,NEW.lname,NEW.upiid,NEW.bankname,NEW.bankaccno,NEW.passbookimg);
   
   ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO usertrigger( userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,dateandtime,organizationname,gstno,bussinesstype,fname,lname,upiid,bankname,bankaccno,passbookimg)
	VALUES( OLD.userid, OLD.email, OLD.phno, OLD.aadhar,OLD.pan, OLD.positionid, OLD.adminid,OLD.updatedby, OLD.status, OLD.userprofile, OLD.pstreetname, OLD.pdistrictid, OLD.pstateid, OLD.ppostalcode, OLD.cstreetname, OLD.cdistrictid, OLD.cstateid, OLD.cpostalcode,'delete',current_timestamp,OLD.organizationname,OLD.gstnno,OLD.bussinesstype,OLD.fname,OLD.lname,OLD.upiid,OLD.bankname,OLD.bankaccno,OLD.passbookimg);
     
	 ELSIF TG_OP = 'UPDATE' THEN
       
        INSERT INTO usertrigger( userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,dateandtime,organizationname,gstno,bussinesstype,fname,lname,upiid,bankname,bankaccno,passbookimg)
	VALUES( NEW.userid, NEW.email, NEW.phno, NEW.aadhar,NEW.pan, NEW.positionid, NEW.adminid, NEW.updatedby, NEW.status, NEW.userprofile, NEW.pstreetname, NEW.pdistrictid, NEW.pstateid, NEW.ppostalcode, NEW.cstreetname, NEW.cdistrictid, NEW.cstateid, NEW.cpostalcode,'update',current_timestamp,NEW.organizationname,NEW.gstnno,NEW.bussinesstype,NEW.fname,NEW.lname,NEW.upiid,NEW.bankname,NEW.bankaccno,NEW.passbookimg);
   
		END IF;
    
    
    RETURN OLD; 
END;
$$;
     DROP FUNCTION public.userlog();
       public          postgres    false            �            1259    37880    accesscontroll    TABLE     J  CREATE TABLE public.accesscontroll (
    rno integer NOT NULL,
    distributer character varying(2),
    product character varying(2),
    invoicegenerator character varying(2),
    userid character varying(6) NOT NULL,
    customer character varying(2),
    staff character varying(2),
    invoicepayslip character varying(2)
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
            public          postgres    false    214            �            1259    37884    accesscontroltrigger    TABLE     �  CREATE TABLE public.accesscontroltrigger (
    rno integer NOT NULL,
    distributer character varying(2),
    product character varying(2),
    invoicegenerator character varying(2),
    userid character varying(6),
    customer character varying(2),
    staff character varying(2),
    operation character varying(10),
    dateandtime timestamp(6) without time zone,
    invoicepayslip character varying(2)
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
    invoicedate date DEFAULT CURRENT_TIMESTAMP,
    sendernotes character varying(50),
    subtotal character varying(20),
    discount character varying(20),
    total character varying(10),
    invoicestatus character varying(10),
    lastupdatedby character varying(50),
    updatedon character varying(16),
    status integer
);
    DROP TABLE public.invoice;
       public         heap    postgres    false            �            1259    37907    invoice_id_seq    SEQUENCE     y   CREATE SEQUENCE public.invoice_id_seq
    START WITH 1000
    INCREMENT BY 1
    MINVALUE 0
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
            public          postgres    false    241            �            1259    37941    products    TABLE     �  CREATE TABLE public.products (
    rno integer NOT NULL,
    productid character varying,
    quantity integer,
    priceperitem character varying,
    "Lastupdatedby" character varying,
    updatedon timestamp with time zone[],
    productname character varying,
    belongsto character varying,
    status character varying(2),
    batchno character varying,
    cgst character varying,
    sgst character varying
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
            public          postgres    false    247            �            1259    37961    user    TABLE     ?  CREATE TABLE public."user" (
    rno integer NOT NULL,
    userid character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    phno character varying(10),
    aadhar character varying(20),
    pan character varying(12),
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
    updatedon timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    organizationname character varying,
    gstnno character varying,
    bussinesstype character varying,
    fname character varying,
    lname character varying,
    upiid character varying,
    bankname character varying,
    bankaccno character varying,
    passbookimg character varying
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
          public          postgres    false    251            �            1259    37969    usertrigger    TABLE     f  CREATE TABLE public.usertrigger (
    rno integer NOT NULL,
    userid character varying(20),
    email character varying(50),
    phno character varying(10),
    aadhar character varying(20),
    pan character varying(12),
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
    dateandtime timestamp(6) without time zone,
    organizationname character varying,
    gstno character varying,
    bussinesstype character varying,
    fname character varying,
    lname character varying,
    upiid character varying,
    bankname character varying,
    bankaccno character varying,
    passbookimg character varying
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
            public          postgres    false    252            �           2604    38043    invoice invoiceid    DEFAULT     �   ALTER TABLE ONLY public.invoice ALTER COLUMN invoiceid SET DEFAULT ('INVOICE'::text || nextval('public.invoice_id_seq'::regclass));
 @   ALTER TABLE public.invoice ALTER COLUMN invoiceid DROP DEFAULT;
       public          postgres    false    227    226            �           2604    37975    user userid    DEFAULT     |   ALTER TABLE ONLY public."user" ALTER COLUMN userid SET DEFAULT ('U'::text || nextval('public.user_user_id_seq'::regclass));
 <   ALTER TABLE public."user" ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    251    249            �          0    37880    accesscontroll 
   TABLE DATA           ~   COPY public.accesscontroll (rno, distributer, product, invoicegenerator, userid, customer, staff, invoicepayslip) FROM stdin;
    public          postgres    false    214   ��       �          0    37884    accesscontroltrigger 
   TABLE DATA           �   COPY public.accesscontroltrigger (rno, distributer, product, invoicegenerator, userid, customer, staff, operation, dateandtime, invoicepayslip) FROM stdin;
    public          postgres    false    216   ��       �          0    37888    credentials 
   TABLE DATA           `   COPY public.credentials (rno, userid, username, password, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    218   �       �          0    37892    credentialstrigger 
   TABLE DATA              COPY public.credentialstrigger (rno, userid, username, password, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    220   7�       �          0    37896    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   ��       �          0    37900    districttrigger 
   TABLE DATA           w   COPY public.districttrigger (rno, stateid, districtid, districtcode, districtname, operation, dateandtime) FROM stdin;
    public          postgres    false    224   ��       �          0    37904    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, status) FROM stdin;
    public          postgres    false    226   �       �          0    37909    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, updatedon, hsncode) FROM stdin;
    public          postgres    false    229   ��       �          0    37915    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    231   c�       �          0    37921    invoicetrigger 
   TABLE DATA           �   COPY public.invoicetrigger (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    233   ��       �          0    37925    position 
   TABLE DATA           [   COPY public."position" (rno, positionid, "position", lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    235   6�       �          0    37929    positiontrigger 
   TABLE DATA           x   COPY public.positiontrigger (rno, positionid, "position", lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    237   ��       �          0    37933 	   previlage 
   TABLE DATA           Z   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    239   ��       �          0    37937    previlagetrigger 
   TABLE DATA           y   COPY public.previlagetrigger (rno, previlageid, previlage, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    241   ��       �          0    37941    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, "Lastupdatedby", updatedon, productname, belongsto, status, batchno, cgst, sgst) FROM stdin;
    public          postgres    false    243   �       �          0    37947    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    245   �       �          0    37951    statetrigger 
   TABLE DATA           |   COPY public.statetrigger (rno, stateid, statecode, statename, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    247   ��       �          0    37961    user 
   TABLE DATA           I  COPY public."user" (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon, organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    249   ��       �          0    37969    usertrigger 
   TABLE DATA           e  COPY public.usertrigger (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, dateandtime, organizationname, gstno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    252   �       �           0    0    accesscontroll_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 42, true);
          public          postgres    false    215            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 71, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.credentials_rno_seq', 51, true);
          public          postgres    false    219            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 81, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    districttrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.districttrigger_rno_seq', 1, false);
          public          postgres    false    225            �           0    0    invoice_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_id_seq', 1086, true);
          public          postgres    false    227            �           0    0    invoice_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_rno_seq', 117, true);
          public          postgres    false    228            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 107, true);
          public          postgres    false    230            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    232            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 146, true);
          public          postgres    false    234            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 4, true);
          public          postgres    false    236            �           0    0    positiontrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.positiontrigger_rno_seq', 1, true);
          public          postgres    false    238            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    240            �           0    0    previlagetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.previlagetrigger_rno_seq', 1, false);
          public          postgres    false    242            �           0    0    products_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.products_rno_seq', 68, true);
          public          postgres    false    244            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    246            �           0    0    statetrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.statetrigger_rno_seq', 1, false);
          public          postgres    false    248            �           0    0    user_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.user_rno_seq', 124, true);
          public          postgres    false    250            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    251            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 623, true);
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
       public            postgres    false    247            �           2606    38019    user user_pkey 
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
       public          postgres    false    272    214                        2620    38027 "   credentials credentialstriggername    TRIGGER     �   CREATE TRIGGER credentialstriggername AFTER INSERT OR DELETE OR UPDATE ON public.credentials FOR EACH ROW EXECUTE FUNCTION public.credentialslog();
 ;   DROP TRIGGER credentialstriggername ON public.credentials;
       public          postgres    false    218    254                       2620    38028    district districttriggername    TRIGGER     �   CREATE TRIGGER districttriggername AFTER INSERT OR DELETE OR UPDATE ON public.district FOR EACH ROW EXECUTE FUNCTION public.districtlog();
 5   DROP TRIGGER districttriggername ON public.district;
       public          postgres    false    222    267                       2620    38029    invoice invoicetriggername    TRIGGER     �   CREATE TRIGGER invoicetriggername AFTER INSERT OR DELETE OR UPDATE ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.invoicelog();
 3   DROP TRIGGER invoicetriggername ON public.invoice;
       public          postgres    false    268    226                       2620    38030    position positiontriggername    TRIGGER     �   CREATE TRIGGER positiontriggername AFTER INSERT OR DELETE OR UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.positionlog();
 7   DROP TRIGGER positiontriggername ON public."position";
       public          postgres    false    269    235                       2620    38031    previlage previlagetriggername    TRIGGER     �   CREATE TRIGGER previlagetriggername AFTER INSERT OR DELETE OR UPDATE ON public.previlage FOR EACH ROW EXECUTE FUNCTION public.previlagelog();
 7   DROP TRIGGER previlagetriggername ON public.previlage;
       public          postgres    false    270    239                       2620    38032    state statetriggername    TRIGGER     �   CREATE TRIGGER statetriggername AFTER INSERT OR DELETE OR UPDATE ON public.state FOR EACH ROW EXECUTE FUNCTION public.statelog();
 /   DROP TRIGGER statetriggername ON public.state;
       public          postgres    false    245    271                       2620    38033    user usertriggername    TRIGGER     �   CREATE TRIGGER usertriggername AFTER INSERT OR DELETE OR UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.userlog();
 /   DROP TRIGGER usertriggername ON public."user";
       public          postgres    false    255    249            �   �   x�M�;��0�:>�ʯ(G�z��v�-7���:�[����1�`��Em��y�a��qoHXx$D�H^~w�rbO�N��_.���l����#y��OO��Z
���Q)�&m[��Ĕp5�ͳ���l��,#����ݓlO|��9>�+�i�	u��� HbF�����z=��q�	����\���t���P��V�\�ݓa?�3�M���� 9S���+�:*'l1���c�p�� ���r�      �   /  x����n�FEc�+���z������61v0����*R��R �^�n�h�I��3My������o����8�~��%���m�ĵ��4�v{�����3[�$k��:&�<f%(*��4���L?����1�%�E$qQ�e�Հ��רY���ߗ�z��O�"]�.�R٘�%xsF�L��T�T���-(E"z!���2�k�)o���Ư��l�!����Z1͋X"d�����=IR�9)j+&wL�0Tt�I4�A���1�&6n����N��%�UWR�F��	F�b�_N��%l�F�w�CSR�֎�@��d���d������s�y!M���.rް�錫/��8�ҋ���r�A�TSk�P�s�M�aW�yQ���-|ڃ�-�/�!�x�1��R.��kúÆ�a}!JR:>���:x��B�K�c��|N�ŉ�1�v���i�G�c���?d�*��o��0����d8  ɗ��6�_B
�д��כχ���χ�vc���F�|C����i������_�]��x9����V+Ń�U
��n�tf)W
�V�(��!b���a�u2��]�X�$��֏���v�C�z?�> ahhU�ݡu^���HY�a�ކ.������Ĳ!\��W?_�ܝ���͓�h�όO���gX[�a�I�
�����sHxU�V��;��+/���1,��2k�a��+&� $[��v�>��c��ID��[������qo�������c�.�n~`:��6uv������^���f���UT�Y�S�L|L�ɧI�;���!��5��$��| f�1�V��J�����8N�,5���X�̍4�|W����&�uLQ[���c��n��B=a��.`%��&�� ���cBܛ�V�6w�и!�_ϖC�e���	'�!ɜ
�l.�";lx�q��ŚZ��,�����7 kc��콤��sq��)�����95��w��R�a�\xn�)��K{�� �%���j%��r�Hrv��yGj��H��Uvϕ>�L�;	��,iSr����<���l��      �     x����j�0���	�J�ϭy�^Bn��4�څ��ׯv6��*�3�ά<y4�m�_޷y�8,���_��k����s�J�N��,��qEL?� �ߋ�C��r{��>D��3�O�����)W�� =ƚ�Q���B��vY�zs��A��Z��B0en@a�c��B�ްO��}]['�t,��,h�7�ZDt����$�U�P/��D�2��2?G���Ȟ�����HPm�#��j�����Mڦ�>��F��͝y&�-�+����з�w�g���?vs9t]��	0f      �   �  x����n\7��GO�� �D���n��1<Fc v��E_����"�LG�b�ߡx�I���Rh{�����ݷ|������㿻����O��>��*mW�5��֊%�����ۧ���uW�ެY$}��c���Ē���&;{V�V=��~��.5�5�K������Gb9B���p��G��k�Ay��nΑ������aո�f�xv�N��t{��>~������� #�"ً# ��<<m7=v��P"�*���;b�-�X&��r ���X'�^8+U
��c���֑&њȶ��,�F�Q�2��/�
��\Q�4*q4Ҫ��؄�aÉF�f���h�,^{�F-�(�5�^@ڲ�jD�Q�60��4C䙷?�X��_��HG��j@�@Ԏ��t%y�+�X7��v�.�B���jU�7cP����������℀R�G�R�����?(F�I1��q�4�@2�KhM��zr�Z]hV�3*�7~ڒ��%r���m�E8@���z��AH4��D�D�~�d�ךt��F@�E���H��v�,��I��0Y�d��Y�D�'�{6��㫐�`JR�J��ݫI�K�X řl,�»��	�kK*ۧCG�s%+:��{bٵ'��S��76Z��2���%��ؕm�+���{�-��y.2b7O���tZ�<�X|ZƸ�]bĔ�¨]����m�ԤmX����#�+X� m�>˰�y�3jg(�Ej2�>�*��Z%�1�H�Q����R�z�,�v0�K�f`/�NG�w�=�p����d�&wЇXn,P����˝��B{��������":�w�B�ɍ�`��pX��GF��y�+�r���ʐ25���Ԅ�<W���(�j+�R��2�E�u?�e!n�$����ҕ
o[$܂Uϸ����!�&��l@&pI,��F;�\����IZYq����Ί�ҥ'|
p��2C� `o]<k�7K���'%7� k�����lZK��^	�]��`�zY��(���ө�,o_���%�Xˌ��[s��r�q��s4,������Eڅ�>B��~�k����NeԥA
��_����:�G��뢌�:1F~��E.j�D!o(��^���ի{��\`�&����"]a7�N��CX� @_rJ�?<��      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �      x������ � �      �   �  x����JAE��I�7��̛NP�4��҈�L,��q�B�2;�.�=w��KԆ���ns}+At�A����u�rxܿ���CQWAVцݶ�	�fX��+
+iي�Z`%Ӓ��0R�GnN߇�0�G,�H=�\����C#�¡	��c���[fY�hz����:����9d�¡�8:�f+���8�&�P�"������y��5q^3xM��]
0�8��j��{��2�A����vP0�-�~z��O�p'�穃BO�ꩃBO�ꩃBOں�CMڪ��BM���P�q59�d\M5W�CM���P��~u:(�d\M5W�CM��T�&�j��5s^+x͜�
^3終��y��5s^+x͜�
^3�U�͜���-ܝ�n��ک@`9� ,gH(*�"	ਐ�ґ�#'	s玹�uү�_'�
��ν�"Іsm���8~�O4h      �   u  x���1n�0D�Z:L@���R�q�T��9��#��� �'�=�v���^ߎv�-�����q�g?���T������ʾ�.��o꜉"da(�,���M���{���l��
6}~�\+�t++�t/+���Ƥ�*+X�VV�GU�F/+��1�
^��2x/ς�xީ�]`��p�e�!娮'8trO" LNI�j.I��9��C:TsG" h�H��� �9 @r*I�������P��D �\�@��(��PNE���2@9e�Һ
@i���$M9,H�rX�4� i�aAҔÂ��+� ��aAҥ$����Z�ӽ��Tu����	`���y姝���1��s�u�u�(I/��9��v      �      x�3��CA��F�Fh\1z\\\ �	�      �   �  x���O�5���O�gZ��r���C.p@����A���g!f�Izڃ4�H��\~�\�^{ ��������O��}���i�O�?V_��V���^�G��X��D�fъ�[+/Q����x0��~~z�t�bG&�[釂����}��ìP=�+��=� :7�'	i��^ IЙ�#�X�\H`v���/��J��l4�0-MH�j�0=5hmf���	���,��0qL?�'�\��.l���h�j��^���������T�{�!y$_�g<�w���?
J��%8���o�} ?�6LO�kԪ���U~.E4�T'Up�t8���D�M���?���N�5��E�<'���T��q]'��JjC�(r�pN��Ё�r(ZD�Qz$N':9���$Z����J��-�U��On�[�{Q�C��o�a_�.�G�9�i������;�~��]Ēݓ�Uy����ë7������7�oz���_��y���_�F��K�����S���#k8W4#�	R�>���ۯ_}�%�d`*hڪ��!���,{7nHG�:S��{>�iƕ�*�3*��v=.H+vF�{�z�Ԯ�����c{�G��ttKM�E�6���N.���4��b�x��t��;��Z�B�^kd�Ehz��\1�g6��F���v�򆲭�����"h��HQ�e�� ��l%�:i7M&���΢O��}��.��*>�
#�ӤY�D�Q|�&�;����9����#����_e��ܢ��L���g��*:������1�U��Vr��Cy|,�p�[y�r�^|���p}�ۙZ��{�KS�Glp��Pz�E�ӊEXՋ�Y�EΠ)/C��ZMV���/c��y�Ѯ 518�i���D3i\b�5���������3�ֳ~W�h�b�?_^N������c~mcL��6�F[?z*1h�}�3���P��1��|�cɨ]s�F��㌚��A�Rg�iF�b+}���4��quT�>�Z��|v��W��4�%���I郬eR�$k���	4R� k��5Ђ�{�>�Z�{.Y��:S2[愝oi�{	�G�:H[��-�[�#Z��}��=h[��}�VmK7�`��=q���Y��Eo�Aݺ���Z�F�*��v�N�9?5�dϳ.��+�6�䷞�+!؃-uϖ���Z���{����6vd��&���{��m��9)�V˳|�{���m5ϲwUL�D�/mڗ��GP�1��,i�M��j~΃���g�/mڗ`��/3��K��%�Tˇ6V�Nh�M��i~�sc�o���������Ǆк��i_�m�Jt��E�/mڗ�%e���]�|iӾD��ɽɦ���6�˞/K��0}!��&�ݶ�޾h��$�{R�m%^�eo�o��&���shC��݃�ۤ�76β� ��y�w��w˧ȼ�Ĥ'{�w���ƆN`Tp�}�I}ol�E��؃�ۤ�[v���5܏7�;�O�;[b1���I}���{�;QgNdзO�[(�A��NL2HЧ%x�+G=y�OdSdw�� � }Z�h�	ӟ�����i�v� �ٰ� ���n_�0D��$uh|b����w#��(�:�;&���_r���$:�;&������#?1B�:�,ޞ��w�q�f܃sb�9�|qk\�|��R��H��      �   J   x�3�4��M��LKL.)-J��".#N#Δ�⒢̤Ғ�"��1�1griqI~n*LȄӄ��$1-ʏ����       �   <   x�3�4�,.ILK���̼�ԢN##]C]CCC#+#+Ss=sCc3K#�=... �pg      �      x������ � �      �      x������ � �      �   �   x�m���0���S�����vwq1&�,I$"����5@���_��{l��0"X��+\����e�����-:�T�W�P7]{x�n��=6 z���?u��>�.'�lʙ��H�8�g��q�� �+�I<Jt�q�j�pV'NJ�r/�^3��l��)�5E�3���86�I�̉��`��p��,��릑�AGb�+;��&�I)�qUn�      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �      x������ � �      �   >  x��X�n�F}�~ ���Oa�H\IQ�PlD�fmҊ(�ү��/�*�ZI1J�CZX�gϜ��r.�C�O��U��brׂ��24��A���\��bE}xr|������~��7�ѷ�����KЂ^���W��B=BQ2W
Q�Vȧ1]��n֞_�q&����d��݉V]��;�nǩFܖ
K�a�@�l$B9���z���B'��;Q�3���W%����t
��)��֯�r�hd�q���{��sȳ܌K����D)髃���U�sU�
-˭I~�T�0NB1�'x"��J)
#Sjd���ۦ[���.�=�����rV�Ŵ��#���|=��}Owu�/��dA�����lrWO�_L��ηSH�ESC@�4�09($J��iA?iT���j@�tF�ʭ���2��2�,������WkqM�	�i�(ϐ9���7?��B]��-�r*��`�I���
�����^q(K&a���l�F��FD�kܴ!n���dHi>T7�l���c�Ws�{�.��U���c��)3�cTôи�>�,}��]3tUU�}���
~�_����Es��ER��5*uev��n�	��ii�|�mf�߳�ՙV�yM1[|���3%�!�z�		�]�k=Gt�o�ThT�9�@]qud�>���%��T�uˎ�,іL�9&� 8
� +A�ǁ����%ӥ`�C����wu󵩗�.�{���"����s%;�IJS���ԩ��&Wd��d\n�x����Bf]��T��wW���+�1B"|y>�5�y�)8�-O�GU쯟���L��v�bX8(Wr^����Z��3�b���Zl�N$Fncݡ�]��b8�Y��E4�Ď��,b��Ǻ�@��0�&�9�/i�/y���)%;��~��VF�:`�*t����<wGO�h�q���T-N�#�9��&{2=�$㮁��V2�(Eħ���:�	]
qII�J�����U4�y��<���d_x�E�=)��l�V&�5٥q��+ʹ_hZ�Xt'����*�N��qn"F��� {w��o�7\!8:;��qqvv�/�u�      �      x�՝[o\Ǒ��ǿB ��[_�)J��Y��Fdl&�r.�뷪ϐ��Q���L�y,S4�:�]��������|��_�w���������_��j�)
�����������F�_D�E�7 {�=�@)��?�9����w�>��71��\�X�K�;@���g(����������M�{�{�!�$��v�1�����G�(�"W*o���94����P!�r>)0���)�K!�Q
�� �c�����P���,�j���Q!�1�Z�@�٤ iO)�X���[ =D�d�2����ʁ���Z(�QB��s�t��b �#�bH5��G�ݚn�����!�E��R�"�jb�$�IB0��z��+Ⱦ$�A�i
N��_e�Uy"����9�����愑��fI���Ix�����b�C�cK�J�_Qu�笊$&p��񈐞	q�>��7�{"!oH��sI��Ue���5�P�>�. �>r(�M> Y�����$����O&$�0�%<���ѭf�� �of����Q4���(����~	>uS($�z�|i��bD��]����K�5�B��}����9�8�X)%��֍���1����E$�6(�Հ0�O���@%�M�t���3>��k�}	��������#f�<K�?�C`�1~�!pз��Z;�_����*���@\���H5u�����0%FL��G�0>��c��Q�^I,z���HA�$���z%��2%�9bq�/ǵ�7.x���0zVJ��V�K�_�h���+�G¿�G��\#YM�a|*?��Ly��P��vr(j������q4'MՇT?�Z,�}� �ɏG�j���O�no ��C]�!�U��͙}'�� ��8TU������c����T�&�}%����|�p?H ��gV'WB%u�]<7t.��	�(��}e���x�ٽ<�J��y�W��H��1�s��i/�� ���/����|�|����V�ˎi��qZ��/	%s����|�E�ߐ��|��������[�3ʏ�1�*ԉ�'����}T��J�/��j�~��l���) X]��V독�7���|䛧i�y��Q�o��[]�(	)Y���Q_zC����CA?8����qJ��=���ħ��s鮿�:8��/�!�Rcg�!���G�G]�W;�o��A�X|� �>&�J��{Gy����M��HY�k����Ǣ��Dh����C�C���?����z|��1G��������P�����2H`��K�1��+띏E�C�g�+oH�*�m
-t���x�{4>V߈�{)C|�Ƨ�%pa�����e˯�C���������jH,��ù�]-[~u��>�7�e��X����T����2Hy�*7�R\��Y��J���(�Q�9��>� �C���(1�k��Q���f.տ��Cn�'��~�\�[�8E=�=R�Z;WGu��(�R>(���7��c�K�~��~]�d65>*�s�+͆�J�a` �ա���X&@j$���8D�4�v5������Kh~��)%��U�R	J��;q} k���(� �8��cLA�p��! PR��fߊ�8��X�7�����UFG�dvV��ѯ���I����a�"i��I��$�Q����,���5� Fi�X�#�!iX @p�7�XI�%_�-���������5���۲`�;���Qz��� �J�!��
X����њ K`.X�G���{�!�}����+:r%b�vcSs�䟂8H���
*�r3�AzZBA��ւV����LG��T��&+K���T�q7���qP� �"��^�Z���A�jP���$� �eU&��b:�ci^���n��ȴ�X�ǯ� j	��?~w���?n>�<���'fT"�_��X5ܷ&�;��7O����w_w����?~�����������F����z �����ѣH�+"�pv\��R�ݚ�X̸T���v��}���1;�nk��{�%g"������O�l)+�g=*W�p�Z���	$Ɗ�e�">��ts���r��)->.ۥ+��RM*v��z$��]�n�1���sk^	:�
�K��0@QC�J+
(@gͮ�r5[I<R Ք@^�ŖK��밊�2,]�[n"N��1�)��ѹm�v���M�p5\�́z�w �گ�Ҳ_���<����~#!Џz���h;i�t��bʝb5`Y*�#�e�ji�(�jQ����[���afɑ��b�|kdP3�N�l��&�)�W��w�i�*�CDe�#ܴC�I++e���z�R@]�U�u�9��<lu�ѡ���&?�$^��;�[[�@��i�*[�C��OAoZ���+I�\ �U�CO�h>K��+-=4^mÓ�������?�j{�d�alʹ�:��K�F9��or�l�������T{���@=.��Y"�N<g*�or]�ۖ�V�h�^O�`�ɿ�K���b�$��3ub�S�l��o�YD�
F�X�S=�&�=��R�)�Ɯ|�6�ǟ�H2ݛԼ��a����RJ���%^��v1�/�R�Z,T�oxIF��N�E�K����G�I
'��R%��9RS���e�'��T����T�c^�b�~�R�#��d��oS=���@��'U;��De�+�!���i���*#�����jԣ�����׸C�a}��>bɝ G>���@O�(Z�
�,��y8(C��]�2����2���3vb9�n�|$R��"��N��K0���m�?�:�jutv�&�(.Y��Z?�L��\�m�gLs�#��oP6�Cq�ޡ�`� �5�P`�'+�Ur���l��V�ӪVB���
��j!�Nw(GfK��z�	j��wR�ʑ�tg��|����H�������H�[CY|�ѡY-5�s��h%d
�&u�@��j�B�:����hM�K�a�m2i�D�3��E���kYn��/��W!Y]�m���~�2�X�(���=
���Jh�P��	�V'C5��҉|��^�Bb�eZ�tlͺ�Z(��,^n�T��c�/$C+���S�WpFr�������~��nC�B�)�ya�g;x23�/F%�d���HT�j�x�[�-�3���1�W/e؊��N� �z��P�َƈ��{�`d�V���5�]�qT��KX*��؄q�zY(��3>0�ql=�T�����)��V�������b�v��At�k�g�9_`�>�F�F��l�s'�'gG��\�,�jH3�l��� c����e�t��(Ud�b��]F�"#L�
�tWW�,����橒ſv��3�E0]��9"^���	�R�	��F�ad5��M&v�V�^.�r�N1�x�X�{Gk�Ԝ����I�R��j�Ԓ]�z�_�h6�ԓ��;E�R�/!��y��Zcg��&!�u���H�����=ih��+6�#p�şn�{�K6�k�r�Jip��X��cg$����ԍ��	�'R�ԑ��P�ʱ����Ô��5�Z�B����8Ah�m����l
���ҁ���a'|M��|&VK$���Ʃ)� �c���c:����f�񉅳3�4���#����	���7�����J�<�TKǥ��ĩZ>�;�n^����9> &=;������,��zf��_	�S��!�j��fW"_���3 !H~�:��$7�+ɥ�V�2T�L��gt,w9c�ϩ�(����@��)$���՜`'�ٞ{e���?�0�����$G�ZO�mLw�;���R7�
�$Y�n?b�ss�=�\F��d���r�:kpą�'����cq�s �q�*A��>��`E�'�V_���+���`q�c�m�sN�sA�V�U|����"���<���Tx��,��9�F��ۼ�N�$��#6v:���9�Qz��[�?���v>Zڶ��G�	P=�wq�H�Y�YJ�3y�"1�;��1��H����F�o�8M�)�0u��<N�4@�N�8��$X��2�IA��4	A�L��c��i����7,C	��ʪ| �4�2D���2�$c�l����fm�Mj7    D�8et����_���}���u�K�a������G���l��V8�@~]/N�����J�7��2"%� K@q�N�F��&@@�	��q�מA9r��cݤ��һ�	Tԙ�<�:��Z��F�Y7;������-���V=�r�d{֡ h��ؔ/���`�3} U�&b�u֑9��j�*�f>�Ȕ����)�:��T���ڹp�C3�@k�V(�!W7��� H�R\�)-�ֻ�	��CqD�������G�E��S�;�S�Cqdf���f�ly�.�����6�Z�c��&sx�I��p�ٵ�h�P0V�j���TQ�$3z�D�T��9��ؗ�t�,�3�`d?�h���~���~��٪��r��M��V����f�N�`�b�{�A����K�L��T;Kt�^*f��哣��h����D�̮�N0Z/ˎ]�~v�h����D��_���K����U���8Z/��?U G���h�T�ʍ�ɞ&��J�`J9֎DG+�b�L	:�1��Lj;E?g�p�b�\`ȝ1���J��|;tL	�V��B9�U<4����к���Q�8��ہ0H:��mz�) l��$�S*A��4Xw�i�5T����n�6�Z5���(��7��զ	��CZ�N�6�ER'8O�46X��1Z[c���xڦ���go��"�����G�D:M�h���<��c]���!�.!LSh������;Z/S����Ś:CiPc����<�N_:���ː-�(�'~�p L�F�����L���`�GU2�g$��p �@��O8d^0=����B<d^�D(1 s�[��`�l�>@ �E��뽟�2�/��'{��(�Mlc�u'S���� �Q�	�4L�~�� �2�C�!�ْ�(O���$�΍�P(O��J93��� �2�v1ň~�P�������8%e��2 ��D��%�;�2 �6�uXx�ؾlO�*�$P:��i����(������F�%Tǟ�J'��Ɔ�&�6L���I�Kc�iO��C�ĝ@ڤ\h�dц�`�{�R[/�ks{��${J�ZO���e0�^Ha���lf��Wb��	a�d,���9w��i�-�!���$�̊{������f�=�l��;I�y���gB=�8S't�̊{"dH��Hy���3����N^�ϕf�c,���j{��-i{���v���*C��1�q�j���N�7�q�j�}!Hb��7�1�e"��[�ߎ����ڑ��1(��q	V�s�-��oqCeH��� ��%��ܨ��U�t���M���5T�q� �6]��	���T��[�5u�a7�zVK��=r����/0��ٴ�R��~��<޼������/�)�x�����`%�S�j꘠j]�H�������_P���ȡ�"�Z�����̣&��|���Z/��_u�ǸP����r��fk�^�>�{��س��J��έ�<Y<��l�S4�bK˧)!�^�3�8�R�f�i@��)��86H�+�lV�+�l���_�[�U<���k�~i�tg�Mv��"�ۙ�I:��zNɿ��X�Hҹͨ�Zz*d�[��v���B�!1l2��x����'tҌ��gP�JEרg�d.�r�JlD��0,��R�ʙ��v"����
M�_�^����coݞ`m�a���޺=��9̝B���nϬ)X�?
�p��H��Ŷ�̩�R{+����N�A�og0�P=�@uOYa�? �q���@1�P���Ǧ�L�d�{@��
�h� ����.�(,i~A��V*�W���ƨ~
�������}�����%�
iz�g���)\8����e_���7���O���?ܿ��|�h�?����������Ǉ��w��?����7迧o9�D�4��K1��df�ݚ�r�R򊭟���^�B�'����^�7 s~`��sO�������0lGJ� i�p�����q���a����V7��MW �a�������(|i�����?�a+T���>�v���g|����9��V"Pw�'{�y��n�Ӌ���N��T6Tl/s���H��3xe�}º��-��[���1"���������=�p�/�}�+���G���|Ɖ���v��5���#���	)����OH_��!Y(a�Y���P��"�)W�\\�� 1�+��=����$h��8�ܢ� d���G��&n������ȋ�IH�=��Q��\�ӹe�o:`:�s:C�ݟ�Z�ý?�^��'H�Z�ӑ�<��q�5\jKF�&�tl�'�t�3N��V�c��g����푶׵�ˇ��:�E�6�!K�\S�4h�<�������|XN\�*�R�~5g\mp5W�t�� S�_�A=i�D+.?� (@�/B�Op���$���^��\�<�S��Z��S��]����d(q�#6�F;bs��k������tu���O��=Ź�2�S���������\�|��\�(ę=,�y&h�d��ROq.,�W"� Wq%rZ���T<�/� {Jmc�޸^<u� �V�Qc�N�@-�Ӹn�fk^k�T�o�͵^��j�6,�bJn����?�2�����s@z�5%�ܩ�Xvoa{=A�o���͘��$#�e��?e`�������ݽh�����a�3�Z���&}_�,mN�l��J�◌
���4D,A&ʶ`����D�}�?l<g��y&�D��ϩ�a�>.�շ�;�߬Qp�x�)�׆��M\�7�{4����[�ƶ��)�M����%�׋�}�T�������@կ��H��z����u;���[$*L��`^̻�x��#�7L~�`i���-C����X$���j���M:z��qk�K�⶚Q�����"/u�:%�B����ue�e�rHoT5Djˡ&��}�	���a�mU&z�}�;���:7��8+u�˻?4��'�^������$=���nBr.^�5J�6"�J6�åL��vMs�$P?}�-�J���Ԉ�A�By[`�U�p���f?���I]�=Ő:szD��!K�Q�Ӡ�-�8TRb돟b��\8���U�!��kZ�V'��X�]����zWD]�}C��Y4�
k���E�q�vtַu���[��Ь�+�!_�A
1G�}�t�6��*@g=�+��LH9T�������%\��ş �����M�����>�/�)��k:���M�Û��OC�+8�/���D_����Z�sӐ u�`��6�^(��y�g��v[ɋ��CM5v�����Z�]k����~7�n+�����qw�x�l2� ��R���v�r�A,��nQ��R�~Ƶ&��g�6�nk�C���ȽK޴�r[+�d�)���>���uk�"�d�+�u(7�M��m�	��kp�`O�,J�ȹ�ʧ�Pnʋ(g��iv�m����m��B���f)C�,ߺ���z^�f�P�7�}�H��d�S5�KGCd�����T���Md�p3��҉!3����+q���+q�����t�ѕs	����Zj�q�x�0��p&��\�͡�ᕏ3��╏3�
�f"��Y�3q��Ֆ���
jKg"�����p��Kז�d�����m�ţN��-�	=lz�\��1��;<�&�y�<m��/����\IF���hqz��Z޴�3���b���C��l��Zh���s�,msZ4�����K0���C�A�g>A�+7g���d�t ��u5�6���3��C��L�t������aƷ������ݮ�31��������_��t�[���Ǉoo������_v����������>� }�!�׿ܿ��{�x�7�����?�?�p���H���sq�Q@/�q�e�`!3g:R��I���K;�����	d�p��U��о:.��3F�|&ٔ��I���%���f�l=��4�/xs+6�c�y{:m�x(C\.���2��,u0N�I�~��`��.���
I��P��8����w�q�J+�c:���g+��3"6�y��T:K�������Pˡ�W`��1� �� �   ���~�{w?]��\a�@�V�l��3�Go�d
^>nT�P1���/��>������Ǜ���m�
c�b��Һ���ϲnV�E���N2JwG-V;g���}�bs�j ���w?<�?	���ʣ���=(��
�I����Jʦ'�<�����u_;���h��E>Ỳշ�YL���XV�b��D��G �Cĳ[V߄�����k���     