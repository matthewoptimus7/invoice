PGDMP         3    	            |            terion_billing    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
            public          postgres    false    224            �            1259    37904    invoice    TABLE       CREATE TABLE public.invoice (
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
    status integer,
    date character varying
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
    public          postgres    false    216   �       �          0    37888    credentials 
   TABLE DATA           `   COPY public.credentials (rno, userid, username, password, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    218   ��       �          0    37892    credentialstrigger 
   TABLE DATA              COPY public.credentialstrigger (rno, userid, username, password, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    220   (�       �          0    37896    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   `�       �          0    37900    districttrigger 
   TABLE DATA           w   COPY public.districttrigger (rno, stateid, districtid, districtcode, districtname, operation, dateandtime) FROM stdin;
    public          postgres    false    224   t�       �          0    37904    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, status, date) FROM stdin;
    public          postgres    false    226   ��       �          0    37909    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, updatedon, hsncode) FROM stdin;
    public          postgres    false    229   _�       �          0    37915    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    231   �       �          0    37921    invoicetrigger 
   TABLE DATA           �   COPY public.invoicetrigger (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    233   ;�       �          0    37925    position 
   TABLE DATA           [   COPY public."position" (rno, positionid, "position", lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    235   ��       �          0    37929    positiontrigger 
   TABLE DATA           x   COPY public.positiontrigger (rno, positionid, "position", lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    237   U�       �          0    37933 	   previlage 
   TABLE DATA           Z   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    239   ��       �          0    37937    previlagetrigger 
   TABLE DATA           y   COPY public.previlagetrigger (rno, previlageid, previlage, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    241   ��       �          0    37941    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, "Lastupdatedby", updatedon, productname, belongsto, status, batchno, cgst, sgst) FROM stdin;
    public          postgres    false    243   ��       �          0    37947    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    245   ��       �          0    37951    statetrigger 
   TABLE DATA           |   COPY public.statetrigger (rno, stateid, statecode, statename, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    247   ��       �          0    37961    user 
   TABLE DATA           I  COPY public."user" (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon, organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    249   ��       �          0    37969    usertrigger 
   TABLE DATA           e  COPY public.usertrigger (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, dateandtime, organizationname, gstno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    252   �       �           0    0    accesscontroll_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 49, true);
          public          postgres    false    215            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 79, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.credentials_rno_seq', 58, true);
          public          postgres    false    219            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 90, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    districttrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.districttrigger_rno_seq', 1, false);
          public          postgres    false    225            �           0    0    invoice_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_id_seq', 1094, true);
          public          postgres    false    227            �           0    0    invoice_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_rno_seq', 125, true);
          public          postgres    false    228            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 112, true);
          public          postgres    false    230            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    232            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 213, true);
          public          postgres    false    234            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 4, true);
          public          postgres    false    236            �           0    0    positiontrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.positiontrigger_rno_seq', 1, true);
          public          postgres    false    238            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    240            �           0    0    previlagetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.previlagetrigger_rno_seq', 1, false);
          public          postgres    false    242            �           0    0    products_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.products_rno_seq', 73, true);
          public          postgres    false    244            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    246            �           0    0    statetrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.statetrigger_rno_seq', 1, false);
          public          postgres    false    248            �           0    0    user_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.user_rno_seq', 131, true);
          public          postgres    false    250            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    251            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 633, true);
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
       public          postgres    false    254    218                       2620    38028    district districttriggername    TRIGGER     �   CREATE TRIGGER districttriggername AFTER INSERT OR DELETE OR UPDATE ON public.district FOR EACH ROW EXECUTE FUNCTION public.districtlog();
 5   DROP TRIGGER districttriggername ON public.district;
       public          postgres    false    222    267                       2620    38029    invoice invoicetriggername    TRIGGER     �   CREATE TRIGGER invoicetriggername AFTER INSERT OR DELETE OR UPDATE ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.invoicelog();
 3   DROP TRIGGER invoicetriggername ON public.invoice;
       public          postgres    false    268    226                       2620    38030    position positiontriggername    TRIGGER     �   CREATE TRIGGER positiontriggername AFTER INSERT OR DELETE OR UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.positionlog();
 7   DROP TRIGGER positiontriggername ON public."position";
       public          postgres    false    235    269                       2620    38031    previlage previlagetriggername    TRIGGER     �   CREATE TRIGGER previlagetriggername AFTER INSERT OR DELETE OR UPDATE ON public.previlage FOR EACH ROW EXECUTE FUNCTION public.previlagelog();
 7   DROP TRIGGER previlagetriggername ON public.previlage;
       public          postgres    false    239    270                       2620    38032    state statetriggername    TRIGGER     �   CREATE TRIGGER statetriggername AFTER INSERT OR DELETE OR UPDATE ON public.state FOR EACH ROW EXECUTE FUNCTION public.statelog();
 /   DROP TRIGGER statetriggername ON public.state;
       public          postgres    false    245    271                       2620    38033    user usertriggername    TRIGGER     �   CREATE TRIGGER usertriggername AFTER INSERT OR DELETE OR UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.userlog();
 /   DROP TRIGGER usertriggername ON public."user";
       public          postgres    false    249    255            �     x�Mһn�0�Y��B|H�� ��ݲ����)�\Z�Mjʉǅ�2n9}����V�灘�dϙ��?uI��$E�/�GOVG9��tO�zz�I=��J��X��/F���h�N�b��j�=6��M�1�Br7�p{��,X��@�:�|'\׫�%�g��2Ā͐����P�aM����4p����癈u��� na�m�(�B�ah�J|M-��J�����T�<j�0����Ű���
h�K�ES{�w��>_ ��L�      �   �  x���=n$G���S�[(��:[`c'��MK��0�����nI���ف�| �||�D��^k�K�|����߯/���pe�R�K�Ou��Wn��MZ�{~�����f�J+�Y�&��:f-)j���4�������CQ]��"��g(ˏ&|}�j��FY�����w���+��v��	>#s�e��4�,��#��Y$�'����.3��Nu��8)��	�^FRI�>��6L�*Vm� ���$��V.J�����gX*��$�� �{v��f;w��G�N�O+<\7R�[�	NZ�a�o.��!N��F�7�CS�m/�A �h�KQG1Q����f��JZ��mU�c���O���2�m�v�A���nxLp�w�iU�uUA��-�v$'{�o�!�x���Rn�oc�z���cc%*�~���u���T�!>:ڴp�91V� �@���}�V"�����;�;dV�ŧ �c�+��	ʉd8  �E�hl����f_��?<)tb��v���0�E�	�BTLrOL.[�������~m��c#\M䜂f4��Z�G)�S�!�Y�=�0PЫc�tB���7z=ìd6"ZcYي�2�ظ��s
�; q�z�� ����RG@[��蚲4þ�!9����CǪ!\�o�.����;�O�j�H����36<-��ϰ���t�0;`�P�U�z`��S`��'t��3���0��a�	.��o�L�`-0E�$���5u|���bb�%JbѪ#v۸���eX��m=�M�,&(&��Ac،o��hK�%�8dmZL~�db1��\��>�1��c�z4��aos��X{��W�3Iˁ��I3�7�<�q��<iS�mT	���	��KLh�Q0�P�V}�Lr-�'0!=���6kw�и!$�g�)�vT�����Őd-Z�W�6��x��b-�]R�Mo��$c�	��؈�iG/�$��\�c3��n�i4�=��c����1,���M)���M%'�yǕ�7+i�@��BR8�t0�.*���BR�8H�94�8��eR�I`�dE�R�}q����|ld,�8��#ܢ .�����m��9<rܜ%mҏ��m���>�l7V�����*�k����Ɔ;n��Z|�<T�Zo�E9n��Z|�cڑ$��x?>n�;�8�1��W�7�|���`�,��z���eY���9T9      �   K  x���Kk�@���	�}�qk �^Jo�oi��B�~W�rP�`Ƙ���H2�@s����s�ׯ��ݞ�9�֫��8�T;a<� ��iW���Xb��X8$��(_�G��|����{zg�z�U, HcM�h�C�������B
IRHj����}BÙ���6�0ұHz��7�ZDt����$<�j�EU����%���*#{^�{ ^�@�j�DU3�OK4�1i7��Ih4�ޜ{B�e����F���������/���d�E��d�S@>v����6$U�P�W5	��ts{�nv���f2#���,���u��tD      �   (  x����n\7��WO�� ����躛��l���H�"N���4)g&W�2b��P"yHm�������O�����>m�~?��x���e����Ы7��J�F��Z��?�>�}��r���w�\�5��?�ٱ�g��Ē��g��\�*5�����w�l�%<��oO��^���ߧ��]�x�,V�5E��y��nΑݸ�����i��w�]j��,Q���=��p�����Ϸ����d/�٬FMD���v��P"7RI�1�e��],�F:�t�y��^8+9ڍ�H���	��'�m;�{����H4�PƱ���B��3��HD�8
i�g?aa�p�����l� _�A2K��n#u$��JO m�D5"��F�e�N����噷?�X�F��}��Pin@�@xG�2UI5G�M�@m{�.�D���nU�gc�������l�KWyjqR�G�������_)F�I�*��bj,�dƗP�p���@��Ьg TPo��%)�S����x��E8@���z b� ��D�D�~�d�ךT��# �"�x�V��h;Qo�m��Lni�D�"���=������`J�K�q���فIR��� �+�Xx����M�][R�ޜ:j�+Qёe���6�z��ycC�u/-�H��P�7�]�ƹ⍍�A��W��%��u���؍��*�3��1�u����Bq�o��\axF(}g`�(������uf�z��g�:�u�w��^ē��vd���,��QEb��M�WGi2P�I��:��L�ܹ��\��w�%�p��{p2{�;�C7H�H�/rgL�І��d�Y��	��X�:�w�Bܩ���5���ό��W�r���Ґ25��ujBx�+�c/��ڊ���Z�Ȱ��,����?��4P�mp.X(\������!�"��l@&pI,�ϖF;��t��a=I+#.�>�Y1XV���������.�Ã��R3���Iɍ!���-O���̕`�ŕ-���n����e�.���dL�}�v��*�ZfDu��[MU�=na;�FÐ��]t��2�����mK��Be�AR�_����:j��Re���h���/rQ�V�jCⵗ�h(,̯�kMQ~����ZR��]���i�q�(�e.2�c��>�,c�{_��P���XW���k�q��V�A�_���Ke�Ls�ƶ:�P�C�ږ1���Ϣ��v,��1�T����dŬ�I:��{jvg�lf�$O�_X)p*�S̖Ct��L1,h��PD1�k��#�u���/
��]N)�H��      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �      x������ � �      �   �   x��ұ
�0��9y���˥M6E��Ap�"
Z�:���=DJ�PJ��$b4e�۔�5B,�7�# b�䳮�< /����9��i>�7O��p��Iq|��ӽ����ё#/��
<k�#��
����k�87�S�o.���1�Fvù
�B�B��P�k��ʟ�C�r/F֑���� ?|�uf�}IW��      �   �  x��սN$AE��aP�tٮ��F��s�Y�∾FH��Q��+{z����������>�X�������j����VY�_U�����.T~�s����ز�b4Y�.8�Q���D5ol����W�VV�^V0Q�Ƣ�.+X�VV𚽪^s��rβ��,�^�˳�5?f��[�\/q�r����r��'8tr�D �\%`Ws�D�Q�E�?�C5�H �5,s�D �\ @r)I�����P��� ��y" e.�@�e�r)� �R�ʥ(�6T J��4�!i�aCҔÆ�)�IS��6$]�Ԇ�+�I����7�
��U�P=� ���	`���9�ˮ9d��s�9�:�v�:�y���2?�eѶ���������B\B�q��);�D�g7�j����<�S�      �      x�3��CA��F�Fh\1z\\\ �	�      �   �  x���ˎ���ç k7X7^�U�$m�E���1��3�-���ϩ�'ViԒ�f�����&�)O����=|��~��������Y���M���ެ�,o�K�=���!��F�q/�J�g'��2o-k�5��O���OO�^C�-�L2�ԇ&s�i7������OEr���
@t~F\��*I�������<0"��.�� �p6"����)���0L[�\�s����	3�R�=(妲�v.��k0��3�䊥�8��M��l��Kb~xƆ�.�����<R�Q���6�+�:�@�U�K�o���=�z<�/������r��e�j}��lt˕T�����IԴH>é�D7Ey��J��I�<�yE�?Y)��v�^������T�$C�5�9�a��;�P��PE�vz��c[�L�I�I��nl�q��I���u��a���^D�tH@���yCx�E'Ց�p����Vc��;�Y�P!{5!ߔ7opZh{x��?�<������>��ǟ��i�ᗟGg��{�Ѷ�[�a?>�q���j�$�o����������K���W3�k2:�>�7$�-+���́���nƑ�*�3*���xl8 -��q,<�S{������=�>򽦣[*��%+˃�~�� �F��*.Ql�˃|��}�$��3F��+�L1-��I�~��lVS��k�=	�ʶR�?�R?��7�%����������N:\&��I�F{ї��s��n��h�jP� .�z1Q�G�AV��\8Jq��E�4U^������W+FhnQT�NS�sY_��Qt}�F��ӊ��-o�Z-�P_.�l�^Ņ�[O5��^��⏳4�?Kߊ�>B`��/��K��fª5�`��+�>�4�a��Z3��J-�����f޻@�+X�δ�ޓ�VL
�l�[�N��ۏ�u�]}��{�Β����''��}��]������Z
�1-���2m�D�i(��u�kh�!~����s[FWO�����/���Ϛ5� kɫd7#v�4K=�Zh�b�T��X=�Z���n�����%��.�f!+�z��,�����@#�Y˲��4�]��ԃ���`O������K�-k��,Mq�A#�<�A�z$m�Clɏh��l4���m=���nZ�n\s;�[��=��^���^:�A�z��)�f�Q �J��.�e6�ˡ��쾗�Q;8"����z:��V���#[α�-�"Av��r��|��PM���G��{��Z��|/�/�ȗSl˾����K|i˾4t<��[���/mٗ����<|{|i˾��}�p�#
��e_�j��tB����K�M��]5F�&
���&p��7B�J|i˾4�k���:��/mٗ�%e�]�W;�Җ}���_��"���/mݗݓ%�X�>}�E}�=�����>��]n�7)�7_o�.�����~im�*�/���ˢ�w6�2�F�s�wY�w�(��41���.�����	��
v�wY���ޤK�v�wY�w���f�c��]ϝ�-m�Z�.L�]�����)����}�e}y?H��I���_AT��� � A6�F�Zq0H`] {��OK��R� � u?t�fo�4�-P��i�D5�Njh|�b㳳!�B�k�jw[wݿ�@,}��hw[w���n���P��b�`����y�E��l�[����2��2ߏ^^0��#�,�{��c�}�ȞK}GF����w`��2y*�a�tv&�a�xv&�a�N�#��ک�v�s�(k��噈v���(k�3���v�#���v�߻O�#�/��#�/_����]�/���v��f��v��f��v��f��#���tF#���tF����T�:��Lg4��̭b���[�;F�3��v��.�e��`*Na��b_Ə���v��.�e��`*Na�h�b_�����v��/�e���ž��GLũ#�^�����T�:����������_ILũ#��˩8u�#���?���SG�1�X�=�r*Na��SG�g���Du�}6Q�:���Du�}6Qa_N%�#��^�o��xL%�#��^���x�O��t��(���m� ��F��.`_�O�3�6ޤ(�`_�O�3���?�Ii������?���آ��a�+%��xt��}j��g��*���h���~��NۿD�7�Òį0��M��2�6�,$�-��_(_\      �   J   x�3�4��M��LKL.)-J��".#N#Δ�⒢̤Ғ�"��1�1griqI~n*LȄӄ��$1-ʏ����       �   <   x�3�4�,.ILK���̼�ԢN##]C]CCC#+#+Ss=sCc3K#�=... �pg      �      x������ � �      �      x������ � �      �   
  x�mRMk�0=˿b�^���>z٥v��t��eih���b�v甘�����g�Pp:�g���_w��0K� KF ������JJ��$?����_A�ʝ��J��_�-�c�ˀ`<XN���4��m|�=_�����uX��E{ng��9�H�U��-R�8B����?��Ll�_��ܭv����o�����z��k}F�ъ/BXd��˙�O�0���@���K��N�������^�-�%�
&Ǒ~�jۅ�F����<�ݧw!�(�      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �      x������ � �      �   M  x��YmO�8�������<~w>m��J{8!���	�d�9h)M�,��ol�4-IHhA�I�N����g�@��R������w��~F�R�2�'��������>����0R�;/NI0d|�3�X-s������VDq|���?�2��'����Ԧ�'\2��v�</o�.N@�Ku�up�
��g����8�L*Y*T�L��)M䥨��V+F9 �h�H�V2�cVK�/~ڸ=d,e"�&L|k&�����,ھ~�B�E\t0O�M�UQ����G�� e*x�9�R����{C�չ��u/'_�F-��Op��������LӋ�_����������	�_"$�T�=��3�<�/V�L|6=�cF4�����4�Q�Z@�LM�,�f6�~Q�V���[W��*[�&�[G\�r�'vH)J����'����K7�'���h��'lI������+��99E������n^�����|��(p2d����E��bz=P�=�Wn<�Fy�E7{/G�l�W��W��p��!�?��"s�4�|���.[N����,/�e>)�(qYL�))�鴜�ٔ�E�g$�s�e#�E�H�.,�~L�dK��@B1˪�ǈ4���ͧ��T(&�5��E6�/��}��/��<Я{�vR�E��d�tJ}B
+�0�D�TF)�L���<����ݑq^,��Uy�^>���/3�߃);TfE��[#v�5���"�!�����DQK�m��I$�����X�6	��%���|<�M)K�F8�EB+�;�*�h(�Q`:������R�nl�zL���fC�T���`�v�� p!d��ST��I��vo�6L:P�^x��?<v��@��)��X��sA�A 2�1nΎ0'�Rv}T��7��c�j������
U��nA8������=3469�R�r�X�+�w�P��OF$�_�~%r��$!�(\��ב���.����Y1�0#����>���'Fk.yx����w��T�큮O]Rp���K@zq��!� �m̿`7�����[ ��@�B&�J��{ �uk�a}:��k�0�o�R]e�ʠ�,ڃV)?/�;MR�[��Q���@��[SƐ?���w����$LXK"�"�����O)�ӓ؋�G.K,	��_����è��搽���m|?`����w��Q��m3"`U�YO뱾؏xC��sw��w���=�Qx�(Ah&ڣ�c�}���1B���_��]�]Y��R�^�D��Ƭ����2�C�<v^��|���+��/8���=Ć56��K��j��/�nB3ٴ��r�GH��[�ڑꀑG{����k�78�6Ḽ6���H���      �      x�՝[�\Ǒ��K��`����ȣ`��ó`a`�f���-�M�������IvWGֹTe��K4E��'3�q������������?���������Zr��_��y��x���#�?E��H� ��{H�R$&�?�fs�ۻ�>�}���b����D�w�Ļ�/P��5�J��Ϸ7_�w��,�H<�=���c�_IC��G�\�x�	�������C��"�����?Cd��.�tF)�>J ��C��B�c
�����G� ��k��g���=� �bI.n�p�Xݓ5����R�v.(g�ck��D	I�G�΅�	^�d�l�!Ք��ewkb�=*��kZ(���32dJ|�䪉��&	��
��=�7�}I����
��$�6��8D���sD9%k�	#E=;̒������w���Ī��ǖ(�(=���|�YIL�
	�!=�.}&�ݿ���	yCBx��K����U�7D謱���t���C)l�� ��b�O���;�r�K>��<�8���jG���R�H���B�G����t�c�%��M�� ���A|b�)rvf<�.��|
�������b����[7�{��u`1-�HtmP��a>��PM�J��4�ٽ?f
|!#�>{��������#f�<K���C`�1~�!pз��Z;�_����*���@\���H5u�����0%FL��G�0>��c��Q�^I,z���HA�$���z%��2%�9bq�/ǵ�7.x���0zVJ��V�K�_�h���+�G¿�G��\#YM�a|*?��Ly��P��vr(j������q4'MՇT?�Z,�}� �ɏG�j���O�no ��C]�!�U��͙}'�� ��8TU������c����T�&�}%����|�p?H ��gV'WB%u�]<7t.��	�(��}e���x�ٽ<�F��y�W��H��1�s��i/�� ���/����|�~����V�ˎi��qZ��/	%s����|�E�ߐ��|��������[�3ʏ�1�*ԉ�'����}T��J�/��j�~��l���) X]��V독�7���|䛧i�y��Q�o��[]�(	)Y��~Q_zC����CA?8����qJ��=���ħ��s鮿�:8��/�!�Rcg�!���G�G]�W;�o��A�X|� �>&�J��{Gy����M��HY�k����Ǣ��Dh����C�C���?����z|��1G��������P�o�We���l���cr�W�;����!V,>ސ�U6�Z�4���2��h|��c'�R���O}K�����W�˖_��-���r3=�ՐX ��sY�Z���>��}�o��j�p�U3N�2�7�e��0>Un����_r�0�	��Qڣ�s�}�A·��Qb"�����G���\�3S��LO|5T�Mr�o�|���H�k�\�!��X�J�����.ߐ���/�{���:$���Q	(��_i6$xUZ�q�m���2R� ���=�!
��i��=` ���X*@3�+�N)Q\�B�JPr@u��A��X� e�D� �!�`
����� � i��BL5�V4�!w �b���կ2�8J�$���Č~�l�H`-�W�I�5N��'� ��$�ggq�,��0J�4�R�� IÚ 9 � :�C��'�J�/���h��e֠���t��D�	���ݖ�ܑv�U�� ��#�\��W
 I�U�:��\��%����Xs����E��$��%Gf_��++����%��Az� �UP锛�#��jO�࠰���d�e:���:�w�XY�����Ѝ��_�}���3 ���e����EjV����&��,�2��ӑK�ʖ_ v˖'@�=���=~�P�Hh�p�釻�~��x����<1��� �����~k��v�_��i��p���n>~����������p������~E�S�;���<z�~E$n��K�_ʽ�[s�������}���#fG�mͿ �`���Ld��5t���-e���G�NY�P�!��X�}�]��P�.b�� ]���7����e�t�2[��@�N4\������/8&6�pn�+ A�P�r��(j�ZiE���]�f+�g@
���ȫ��r	ZzV�OS��kr�M��ɚ?&=�:>:���U^��n��k�9PO���]��ZZ���=�G�CV��o$��'~ϋ���=IK+ơ�)V���?�^������E?��+mf��[,��F5s���l�}�9�����r;DT?R�M;����R�K`�W)�u�Qe\��s����N::�65#=��'����t�qk+�T:�Xe���)�]��Y�`%ɝD�*���`��~���ƫmxҡq��=#u��Tm��;L�����@� �v��(g��MN5��֗]���Q�j�����ZZ"K�҉�Le�M�ku�r�j�����L5��}i�5X����r�N�q*��-`����5�h�Q�(�x���D���]
8� ֘��֦��3��I�{��7~�1L5� �UJ	w<��!���.���}RjY��*�� �h��i��{�wY��9I��V�DX:Gjʗ0��${��*Ps��b��y̫]���Rj��c��┌��m��qu(u@��j畞�,~�8�x>P8�USe$�t��Z�z��@[S�R�w�8L�O��G,���g�U�)E�Z����3e��KT��yyVF�6}�N,#��M��D�}A6@�=۩Tz	�9_��gBVG_���.�D�%k��R맗����밭�i�s$���&z(.�;��@��
���dq�J��ҔM��
yZ�J��vbA��U-D�� ��l�3_o>BQ}�N�]92���כO�R��=�IU��3���)~a(�o~6:4��r��La���`(��PmPH7CgPW���ItI4���M&9���W��ߛ���L��x�����q��뇠,����rH��ѣPy�}���
E.� h�q2T�8q*��G]�-�!�^�%I�֬뽠�2l����-�
�zl��dhE���{��
�Hnם���׏a\��m�W(1%?� #�z�lOfF��ň�d�,W]��[m/?c�3�erf��5���e�[q ��	`\�^�0��Qrr���l֊�Z�&���0�
�qiK�;�0�W/e؂B~��:N���*`��5�3�Y���t65\�?S��Nq?��p�L5�,���H�h���m}����Hv���Qi�M��o�dlT���c��������C̙���(Ud�)T����e�_��<U���θ~�������2G��א>Z
=A��ӈ0L���P���.������B��)�o� k�"�cO�h͒��s�;I[J�X͒Z�SO���+��z|���!SJ~�%�Q>�T�Sk��A�$������R��g m� ��|�&|N����mz�x�fs-S�\�!N0k�r쌄@�_����;�_���D
b�:��
[9�ڡs�R��&XkZȂ~� �'����"�|�M�ԁ`�V:pZ_1섯i���Ċb���y�85%d�`lw�5 tLg^��,1>�pvf����y�B2��4�r��ft�`ܺC��'�j�t<�c�8U�ǘc'�ͫ��8���gg�[B����¾1��X�L�+qjw0P-y���J����y� ɯ[G��f�by%�t�JP�j����쁎�.g��9�S�X��(84�$��|⹚��5�s���r����s"�ܓ�T�	���.~��Q�� X��#����W�~n.���(u��?X�]g����X�4zL#.|�6�R%�o�4��g���������u|E��L#.|��s�)w.��j=���R�;[d���灳��
o�����v2�(=Һc���	��Qz��N���t<�4J�4@uK#��`�|��g@K۶�`>�(=2��B�.ΣI6k0K)�c&�S$�bgr7�QI6s����M�I0��1��i�(؉�q�kPS:)hy�&!�)wr,�8M� ���e�"�v]Y����[�(<\Q���c̔M���ܬM    �I�ȝ��Nz>�Z��;��Sw�ᰢ�s�~� ,�S �z������߶�MR V�
�ȯ�ũ��xX�_	��XF�D`i(��)�(C��h(=�|�:���3(B�~[c��t�Yz�>��:��W^�5_k���;�f��u����5ЪGR.�l�:4 ������x�#s��*�D��:2gzUmTE����2}���1Ş@G��9�ꛗ\;uh��h�֊��8���z:`I~�@��=����zw0��y(�(�9 ��B�|_��ȼhs�u�t�v(�̌�@��̜-����� �&S�Q�d�:�RN1��M
�JT�c����*��dF��h�j;���R���vF���z -ֿү0 ��8[�P���C������ٚ~���߉�VLy/9v#��z��)��jg���K�L�|r�OQ��Z_����u�	F�b��+�ώ ��Z�(P��7��z���*wG����
��z���T��:�ӄ�SiL)�ڑ�h�T,݃)A�9��	Am���,�WL��3�p�bB	��o烎)!U�j�]('���ƴ78Z��R:��4u;� �@'аMO�5�V�$#tJ%h���4��ʐ�b\��M�&X�á�r�%����� ��4!vHKщ�&�H��i����=Fkk,R��A�46X���C�Z���4�]RP��H��m��`���v{�+5�y"D��%�i
V?�x}G�e�[߼XSgh#jl0�'��KG����b��E��O�!�)�H>�� �	6����J���!���u��	��K8���}_���K�%d�~��!�����$��x���P���ET�d�%��m��dJT�>$4�3�����/X"�Q&�th6~7[��P��ܹ�
�	PT)g��2�Q&��.��oJ2�;[�0����[�֞U�d��΅��M�h��C2�/��J3	��5t�g��*�l"�o�QzF	��g��	��	�S�j�w���p�,�P1q'П6)Z-Y�a=�����=���*=�^�R��-q��RX��1��%��X4uB)���e`Νhpp�DH`�m~	�����2D� ��Yqτ6��N�v0+�PO#��	����t,Rp��L(A*f���s��ˡ���sK����(��:����йx�c\���)D)���c\��|_��:��y�~����E�#�2F�4B�v�5u�2v\B�U�\a'�[�Ps��=�nkI~77*CbnBՆ;ݨip���� j�E��N a�.	�W��Zv�wIx�-ٚ:���x=�%k�9��V��o0��ٴ�R��q�׿�<�|����͇7Џ
�?<�}���XI�ġ�:&�ZW� � �}���|u�ڀZ@mGE����d�w�`5ٓ��^̷gj�@�����8ƅr_'����4[�����A�+�xƞ�UR�Y�pn�����>(^`[��[Z>M	I�����ql��6�Mb�N�ǱA�'X� d��}X�d��N���ݪ��^]k�K�8��8#&h��4A��䘯Hҹe�sJ�]%�rE��mF5��S!c/�,��u���a��ǻxt��'P=)��f�0N�=�r�U*�F=�&s)�KTb� J�a�8��T�D���-�Vhj����d�l~{��k��D?��0���	��a��2��t{fM����Q�3�F��-��eN=��[g�t*h�;�A���{�
k�!�C��������86Md�%�+ �TG{`X��M�ua�@aI�r��Ra��e�m0F�Sh�մ}�����/`->.IUH����v���ӗ���7�����������������������������?���?��}z��p�������]����y �3�.�R�~2��h��ܾ��b�s�ѯ�U(��gB�/<�u|2���)lx;�����_��/߿#�v��v��~�{��כ�7��Əx���^@o�w�_����D��J�w��#�V�t��|8����/�����4[�@-��������Nл�O/��;5g�3P�P�}��#]v������	� z[ s���ƈ<l['K�ׯy�O{���"^��,>�Wr'3��%2<���k7��pgk��GD5>�)R�+����l�C�P.�~�:^?"}� �ETS�ܹ�0"�b6	V,�O{��#җIЪ�)p*ԹE�A�*cu��1�L$�c���?���O�9��F{����U���s���t�t6��t�<ܻ?��\�{:p�R���'H�Z�ӑ�<��q�5\jKF�&�tl�'�t�3N��V�c��g���w핶ϵ���O����"Uѐ�y��t�q�Xq�\K�?~XN\�*�R�~5g\mp5W�t�� S�_�A=i�D+.?� (@�/B�'�vOq�ɥ=Ź��o@7�0��碖+��r�38b3J��e�ю�\���if(`. ]��8�	x��8Y�z�sq71�S�˘��S��}�8s��%7�����X�)΅���Jd�*�DNk����'��dO�M`��׋�� �j0j�ԩ�e�u׭�l�+b�*�;����Zن�RLɭw���^�w?�}	H�b޳��D�;�c���F�>O�鷿����՘��5�IF���&����'+��Ż{ъ�����g��Z;r�M�
��Y�ڜ�FǕ��/8O!�i�X�L��m�8�e'�6���x�X�)�L�?*����S�}\$�o�o@�Y�����S�	��g���o ��hV���<�m��S8&��֋�5J�_/�}�S���V�U�Op"���1�7W�v�-��H
T�����wC�JkG�_��2\��@�[�扗��HV'�o�.X��u�t��k����'��m5�����&/u�:%�B����se�e�rH�T5Djˡ&��}�	���a�mU&z�}�;���97��8+u�˻?6��'�^������$=���nBr.^�5J�6"�J6�åL��vMs�$P?=�b�b}ej�� l��-��*}��:��mdkRqO1d�ΜQk}�Rh��4�q��;NՁ����X�/)�c)u�f�5������	��D-ֵA5��D��Qk�� wV���/�EbQm\���ml�=�uz,4���u��j�B�Q�F�7]�|�*�
�Y�
x�:RUq}��/�ˠ>��3�7����iᔱv��2�G{��"�\}M'p��zx3�i�"x�Y�e�w ���+��v[+�bn��,נ���=���L6�n+yQr����}�\�vSX�k��3t��F�m�~�z�������MB��� \�?p��W�b9�E��-J�xC��#�ϸ��2�?�L�F�m�rHv?�wɛ6Rnkś,0"%�?�G�5�n�W$`�L�ue��f�)�m;�t��I�E	9w\�t�My����9ͮC�MUc6���-�U(7���,e���[��^�k��ߝW�&y������,|��w�h�נ�V��3𽉌�nfr^:1d&_�"u%�\�"u%��w���@�]9���!��Z���pw��!�� #kg�^���j^�8�/^�8P��(`&r��;7__m��'(WP[:��-��;��]��t&�%��no{-u�mm�L�aӳ�^G��t��)�3y���iS�|��ܕ��J22�0�F��琴��U����k�oR�g��B�$h͟�ei���*��s�\�^ʀ	�7�=3�	�X�9Ӟ8��'ç0O����ݭπ6Hx1$�3ҁ^��K>Ì?���!�]gb��m���o���7��-�������<����O�?=������'���w��"��C��O��~�h���o~���?�����{�,ї�>��^��& ��Bf�t�d�V	滗v�%e����=�,�ɫDs�}u\4�5f���L�)���&Y�6�\�#�����4��a̭�XW������=�q��F�\����8QP&��%2�U2��j:*$�^�BQ;W��B«�q�e�*]�T���2�X�����3d��Y"%�w�� `o�Z�* ��`�Q !  Pwx�H�O�w���>�
C��m��f�DO��<z&S�����F5�P��}{����������r��\���Ya_L8o�I�,a�,�f�-<X4�*�$�tw�b�s�Z��G(6������O��WA<[y�2p�Ŕ_�?)��鯤lz�ϓ��_��{C�8���E�=��d1V�^d1�BbY�ݯ�d͏@��緬�Ȭ�K�n�>|�I��TA)��$=&�:!qz��7(� _��|kԯ)I~"�*@���_����������?��駏���ۻ���y��쿹y8$ٵg�{���!�#2 ��c����j�
vK�^���z���x\RO�-�#׷�/�ߵ����D�C�t�L���mZ��CIj[�S��V�W��8^��7�[�'�k-O`|�vm[����{�E��_Mm1�-��rY!4խ_n��B�7hN6����8�C���y�	��U`q��O����c
f���|K�ⷞ%M����%�ڍD}3�k9r��6��I�Pb����{��RZ����7��� �     