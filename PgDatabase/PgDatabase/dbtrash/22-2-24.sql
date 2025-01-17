PGDMP     '                    |            terion_billing    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    37871    terion_billing    DATABASE     �   CREATE DATABASE terion_billing WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE terion_billing;
                postgres    false                       1255    37872    accesscontrolllog()    FUNCTION     =  CREATE FUNCTION public.accesscontrolllog() RETURNS trigger
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
       public          postgres    false                        1255    37873    credentialslog()    FUNCTION     �  CREATE FUNCTION public.credentialslog() RETURNS trigger
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
       public          postgres    false                       1255    37874    districtlog()    FUNCTION     W  CREATE FUNCTION public.districtlog() RETURNS trigger
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
       public          postgres    false                       1255    37875    invoicelog()    FUNCTION     t  CREATE FUNCTION public.invoicelog() RETURNS trigger
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
       public          postgres    false                       1255    37876    positionlog()    FUNCTION     Q  CREATE FUNCTION public.positionlog() RETURNS trigger
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
       public          postgres    false                       1255    37877    previlagelog()    FUNCTION     [  CREATE FUNCTION public.previlagelog() RETURNS trigger
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
       public          postgres    false                       1255    37878 
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
       public          postgres    false                       1255    37879 	   userlog()    FUNCTION     �	  CREATE FUNCTION public.userlog() RETURNS trigger
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
       public          postgres    false            �            1259    37880    accesscontroll    TABLE     l  CREATE TABLE public.accesscontroll (
    rno integer NOT NULL,
    distributer character varying(2),
    product character varying(2),
    invoicegenerator character varying(2),
    userid character varying(6) NOT NULL,
    customer character varying(2),
    staff character varying(2),
    invoicepayslip character varying(2),
    d_staff character varying(2)
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
    invoicepayslip character varying(2),
    d_staff character varying(2)
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
            public          postgres    false    224            �            1259    38062    feedback    TABLE     y   CREATE TABLE public.feedback (
    rno integer NOT NULL,
    userid character varying,
    feedback character varying
);
    DROP TABLE public.feedback;
       public         heap    postgres    false            �            1259    38067    feedback_rno_seq    SEQUENCE     �   ALTER TABLE public.feedback ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.feedback_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    254            �            1259    37904    invoice    TABLE     V  CREATE TABLE public.invoice (
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
    senderstatus integer,
    date character varying,
    reciverstatus integer,
    transactionid character varying
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
   TABLE DATA           �   COPY public.accesscontroll (rno, distributer, product, invoicegenerator, userid, customer, staff, invoicepayslip, d_staff) FROM stdin;
    public          postgres    false    214   ��       �          0    37884    accesscontroltrigger 
   TABLE DATA           �   COPY public.accesscontroltrigger (rno, distributer, product, invoicegenerator, userid, customer, staff, operation, dateandtime, invoicepayslip, d_staff) FROM stdin;
    public          postgres    false    216   `�       �          0    37888    credentials 
   TABLE DATA           `   COPY public.credentials (rno, userid, username, password, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    218   ��       �          0    37892    credentialstrigger 
   TABLE DATA              COPY public.credentialstrigger (rno, userid, username, password, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    220   ��       �          0    37896    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   ��       �          0    37900    districttrigger 
   TABLE DATA           w   COPY public.districttrigger (rno, stateid, districtid, districtcode, districtname, operation, dateandtime) FROM stdin;
    public          postgres    false    224   �       �          0    38062    feedback 
   TABLE DATA           9   COPY public.feedback (rno, userid, feedback) FROM stdin;
    public          postgres    false    254   �       �          0    37904    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, senderstatus, date, reciverstatus, transactionid) FROM stdin;
    public          postgres    false    226   [�       �          0    37909    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, updatedon, hsncode) FROM stdin;
    public          postgres    false    229   (�       �          0    37915    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    231   ��       �          0    37921    invoicetrigger 
   TABLE DATA           �   COPY public.invoicetrigger (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    233   (�       �          0    37925    position 
   TABLE DATA           [   COPY public."position" (rno, positionid, "position", lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    235   O�       �          0    37929    positiontrigger 
   TABLE DATA           x   COPY public.positiontrigger (rno, positionid, "position", lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    237   ��       �          0    37933 	   previlage 
   TABLE DATA           Z   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    239   �       �          0    37937    previlagetrigger 
   TABLE DATA           y   COPY public.previlagetrigger (rno, previlageid, previlage, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    241   6�       �          0    37941    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, "Lastupdatedby", updatedon, productname, belongsto, status, batchno, cgst, sgst) FROM stdin;
    public          postgres    false    243   S�       �          0    37947    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    245   ��       �          0    37951    statetrigger 
   TABLE DATA           |   COPY public.statetrigger (rno, stateid, statecode, statename, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    247   c       �          0    37961    user 
   TABLE DATA           I  COPY public."user" (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon, organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    249   �       �          0    37969    usertrigger 
   TABLE DATA           e  COPY public.usertrigger (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, dateandtime, organizationname, gstno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    252   �      �           0    0    accesscontroll_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 72, true);
          public          postgres    false    215            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 170, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.credentials_rno_seq', 84, true);
          public          postgres    false    219            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 126, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    districttrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.districttrigger_rno_seq', 1, false);
          public          postgres    false    225            �           0    0    feedback_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.feedback_rno_seq', 3, true);
          public          postgres    false    255            �           0    0    invoice_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_id_seq', 1139, true);
          public          postgres    false    227            �           0    0    invoice_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_rno_seq', 170, true);
          public          postgres    false    228            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 158, true);
          public          postgres    false    230            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    232            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 307, true);
          public          postgres    false    234            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 5, true);
          public          postgres    false    236            �           0    0    positiontrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.positiontrigger_rno_seq', 2, true);
          public          postgres    false    238            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    240            �           0    0    previlagetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.previlagetrigger_rno_seq', 1, false);
          public          postgres    false    242            �           0    0    products_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.products_rno_seq', 106, true);
          public          postgres    false    244            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    246            �           0    0    statetrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.statetrigger_rno_seq', 1, false);
          public          postgres    false    248            �           0    0    user_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.user_rno_seq', 171, true);
          public          postgres    false    250            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    251            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 738, true);
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
       public            postgres    false    249                       2606    38021    user userid_already_exsist 
   CONSTRAINT     Y   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT userid_already_exsist UNIQUE (userid);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT userid_already_exsist;
       public            postgres    false    249            �           2606    38023 /   credentials userid_already_exsist_in_user_table 
   CONSTRAINT     l   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT userid_already_exsist_in_user_table UNIQUE (userid);
 Y   ALTER TABLE ONLY public.credentials DROP CONSTRAINT userid_already_exsist_in_user_table;
       public            postgres    false    218                       2606    38025    usertrigger usertrigger_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usertrigger
    ADD CONSTRAINT usertrigger_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.usertrigger DROP CONSTRAINT usertrigger_pkey;
       public            postgres    false    252                       2620    38026 (   accesscontroll accesscontrolltriggername    TRIGGER     �   CREATE TRIGGER accesscontrolltriggername AFTER INSERT OR DELETE OR UPDATE ON public.accesscontroll FOR EACH ROW EXECUTE FUNCTION public.accesscontrolllog();
 A   DROP TRIGGER accesscontrolltriggername ON public.accesscontroll;
       public          postgres    false    274    214                       2620    38027 "   credentials credentialstriggername    TRIGGER     �   CREATE TRIGGER credentialstriggername AFTER INSERT OR DELETE OR UPDATE ON public.credentials FOR EACH ROW EXECUTE FUNCTION public.credentialslog();
 ;   DROP TRIGGER credentialstriggername ON public.credentials;
       public          postgres    false    256    218                       2620    38028    district districttriggername    TRIGGER     �   CREATE TRIGGER districttriggername AFTER INSERT OR DELETE OR UPDATE ON public.district FOR EACH ROW EXECUTE FUNCTION public.districtlog();
 5   DROP TRIGGER districttriggername ON public.district;
       public          postgres    false    222    269                       2620    38029    invoice invoicetriggername    TRIGGER     �   CREATE TRIGGER invoicetriggername AFTER INSERT OR DELETE OR UPDATE ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.invoicelog();
 3   DROP TRIGGER invoicetriggername ON public.invoice;
       public          postgres    false    270    226                       2620    38030    position positiontriggername    TRIGGER     �   CREATE TRIGGER positiontriggername AFTER INSERT OR DELETE OR UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.positionlog();
 7   DROP TRIGGER positiontriggername ON public."position";
       public          postgres    false    271    235            	           2620    38031    previlage previlagetriggername    TRIGGER     �   CREATE TRIGGER previlagetriggername AFTER INSERT OR DELETE OR UPDATE ON public.previlage FOR EACH ROW EXECUTE FUNCTION public.previlagelog();
 7   DROP TRIGGER previlagetriggername ON public.previlage;
       public          postgres    false    272    239            
           2620    38032    state statetriggername    TRIGGER     �   CREATE TRIGGER statetriggername AFTER INSERT OR DELETE OR UPDATE ON public.state FOR EACH ROW EXECUTE FUNCTION public.statelog();
 /   DROP TRIGGER statetriggername ON public.state;
       public          postgres    false    273    245                       2620    38033    user usertriggername    TRIGGER     �   CREATE TRIGGER usertriggername AFTER INSERT OR DELETE OR UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.userlog();
 /   DROP TRIGGER usertriggername ON public."user";
       public          postgres    false    249    257            �   �  x�u�ˎ� E��ǌ��$,G�z6�����/���U*�?�	q�M�â�����)��(+�����L�4�'� �'W�q8t��s�ȣ� <���$nɨ����J��g�	�pqnȵ�_~10D4X׮��$c�A��pCI^םK�)nu���s�b�v�s<͠�V�ݳo�]`����)�Vj��ډ��k`li����>F	4�
�4\r?'=������PR�G�Z5ő@�������}��-�X���L�k�_�@�03_�^�
�tr�`�np��F1z��"T������(�������䜑��pC�i��\�/_P�q� ?�/�=�/CL���󈜝�"��KcoqG,.�A8��+�9fZ9ຸ.��$��So	G(�_�����	      �   l	  x���ˎ�E��_�?���G�h=���1��0`�{����$Y�*fub�YB�	�qy#��t���gt	���]����_����[�o!��r�|�qJ&�?��7~"?~���_�H����2kN��{2�CZ� Őc�br!Pr��>�q��5����Q�{@�?]9�_��`���A�?K���`��WKW�[�a����1Yc��iڒ�D=��(�xD�$�PC��H�F�y����y+QH��t#�{�IW����!��b����7�Hy�r#��t��se��!m�<�L�fΚ;e�<�B5ls�th�bK姯t�ʝT��[`�wrҎ-cJ���x;�I>���e3Q�c��F�1�|%݌��s���?�M���8�R��&4��(����aW�M���	Wd�ÿ��J�����"*sUCt�ǜ�c����ld�m���6���DX�mERɞ;���P��8J�&�+y��R�K�)�v���m	'�Ҹ2{��Q����	�b��<�����M����/N���<o�����@�*�_'?����;)�=�K2!�Wŉ�R������AH;B��bl!�,�sW�E9�l d�P�2Inӓ��H2+-f>G�\�6e�F��`���#I���	��C2q:�$���y���#h�Ts+9E�_(?�#�����������o��GŚ�6�`=�l��z<����|5F�$��6�&2� �;6ԫ�������X�����;��\��d�HyA�J
�	���'R_��IE6��,������,^%�8K;!���sB+�pqފy���=�0��^i'�'G��v9���ǘ��\O ��;'���Vү5�Z餞#a�.�rˊ�i�L�J�FƓ����AR_m:I�8���v}�y���k;��g	�����YI�+�� ��dS>��v���I!.��3��RBm�Ѹ�����㬡e�ݒa�a���5�E��eGɥ��u�)I�m�'�q��d�;f�ݲ8�PYf��Z��Sn�����T�o.�9XL�H�>�dJM	1?�키k�(����2���h��0L�P
g���YG#d��)(�W���.��@�iV
-������c�둰7�� ��|��w�����^����6ͥ�³��k����&��I�S�Y�
�ڂ;Ɲ�k٢�2��b̑�͵lQy;�������R�7�(I��W���NRWя���N���;�!5��0������|��Í���LO�v2��nT"��f>M�pх�����l���X�a��hf=I&�+1c�k�!�I2{�dc������c�'�q���YZj�7A�컜�!yA�lBc��Q.�/H�z�����Y���d�����6�ه�ޗ�_������y�C0��UN��։a����D��d�� �V���r�s1[���$d�TT�d�鲲�JJ�HA�7
%M�� ���9b.kd>I��AR���2:�.��7�7b��ꋠ��-c��t��jKd��� ���l}Ф����Ν�^�]���ţ%�'Gl�r�}4�#����%�hR��\-�j���0�Q�Q��>��Ѓ�X�;9�g����m�z{��c����V��H�,uA�;��q�%���	j�����.,���<��q��)�_5
f��u�yּNqH}��פ���%Q�iT�t�f{ʗUC�Q�
\ZM�O�sT�7J�aA/9�l}�>�RD��<�r8s���뎝�qݙ΅e�"�\J� ��(4���,'Q�#���h����͢a2x��a��A�@���9?�xr���R�<�gA-Q�"*%M�]�|RP蛪��dc�'�-���BCN��o@��m�'���F�?f��XN�i���;R�<rROn1╧�~¢Z�o;J��(�&��'t�x��)��H���(&]2:�t��4v:����^I�ah��]KRN��_2�Wg)�Vn}�+hj{IJ'Q/Y[Tt^=3��~|���U�7Ԍ�A=5*��2.X��Yr���u������mu�L�mĽ3��[#~g�?������T�耭���]��n���.���vA����M�|�.R�P�f���ˣ���Y�t��E�N�u[$�
��۵��n񮵳���S���4쮅J/X�_����&Fv�B���O����ީ��DQ@J(��=d��x�9y��\B������=/oQc���g���`�����M�Ϊ�B�9�qT�s*2���d��0���=���(�+�O��VJg��G�{?BѨb��1��*^^|����ofԑ�A�"�d�za�G/�+gY����sE=�brJ���9�ڗǼ��a-B�qH����_�І��{_�y5���L�Vr�_t+J�S����F��O���$�{J�c�0F���u�VQt	=B��������c¶G      �   �  x�}��j1�k��i%ݝ�\�	��+��S\ޟH;p1�Y�|H�w
.Ht�z��/_���}����wNo�7�{�>@�] ��M���.��݊*ԟ���$����B}� �0_4��B��}�gW�0 �>�VŠE���#d���^�BM$k"�'�G��We �ս�*UZVQo�2"y�p�J	q��G���ɽ׾�����j�tΊt.�D�\IPZEQ)�=��&�^(�Ґ=�Y���o���������.�� ����v�����Q��e0���J	xH��bƚ��G���Z��i=E�L����T�@�vC��2v�5�~3>�J	��@�B�t!6z^��H#Pƚ�-PF_� &<a2:b�m�\�Dt��X!t��+���b#Y-P��U,P�o�2h��A""(�D$Z`��0M�
`�      �   A  x���ˎ7E�ů��x��\ـ׳1f�MC�7`����s��F�*'�K��		�`07�tz)�N/?������㟟N��c������/'.�
}(�P����g-�K�7��O<}yz��nʹu��I��۾q�ܚ�%{�o�lܲ*��R}�o[ݤf�Z���������?��ϿϏߛ���,ֈ5y@�A^��4���j�R?�c�yuq��6i�Imd�J�����/�?����ǿ?��0���48$�Y�N�{^F(�{RIā��e��M,�F8����X'��pV�� h,��E\ZǑ0��Dv:��q
ή�hD����/"
�ܛ"iD�H�U�랄����0�d+�$�d�V�o#u��J��l��xD��2�y#����y��?iG,m�=`}�@��j@�@�@�e��Zvw+�XO( j���!0D�V�PU��D�!-Ö: �󵭼^���R�G�R���ˏL�P�r�bM���X�<_Bj����f�pB����I��96i;|�kv��j���������O§_F#υmM����������R:wD߈�ԎM�W���nPF�&��H�W�)~�:����U�SgJR�B�
5;�IҖNc�7Nc�-�Q�M�]{R9�|�x����(kq�ܴ'��]��Z��3�DF%��%*�x�Xc�980��1��su��E�o�C�
�L�j��u�O�hw�؋��|�0jFT�`@m������VZ��@�
J�g�u>�5�|���N��(�u5J&cd�#l���Q�r�,;�4�ɑ9����^����.!�ȸ:'�w��<��1G�z�z�9C��68t��w�#
��X����p�Ԍ�@t��p^�;�GwF?Ėj��X3aH�:I�85!<�+持�}+��ڋ�T�j��E��Գw(�*7�8��@a�Ł�s�@Q��9�(Ha$)vf2�K��C[mTrE���:VOҊ�����
a�$|�>����[��Y}X0�Yj&`P>)�3
��ڏD˫n-��{�J���b�^@��0L׏:X2o���R�oX�����[j������"�G�izH;��w?1mc�O��4QF\jAj�ǘ(�B ���۽&�Չ��S�d��T�ZG��{M4$�k��%/?��q�Њ�Prz��� m M��C�o(@������]C�c�}��k��H�q��+/��4�J\�h�@���ۘV�k���G���(<?�b&�q����R��f�!�gL�q���h�Ss�^g6#������ѐ{��j��r���2�0��L��S�U���a��|^�$�8�������$d�(<�qX_��_a5��!�K�ԧ���XJM��و��1%u�����B�#=�$>#��~9�>}^�]�x|t�(�� }N�$�k�2.˥���*WK}�ߌ���q0��#�7�a?s�,����O�e����ާ3h-R8!Ի��PK�W��d�e����n���<�*���(|De��=������Q)Bǩ�����K�J�"~� (�c�^�Da�0�&��0:\UB_X�^�k��<���v"X!�`� �Ӂ���b����*-(�&e�&	ىH�UA��*�'�J�L��ǆ0�#.�B���:F���08�.�o7j%_w̐GQ��.v�V2�+
�c�48z��\��:�(�PW��L�k�C��:��<!ލZ)���8��'ĻQ�1��ʶ#D86�vY��<���Z�QCXB��~`�o������1:F�^Nn�wռ�RX��]N�����Pjo���r�w��Cq���D�3�þ�c�g�
�����Z�ʭƧZ�۾1��6����^�,>�d2�(����� 4>�      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �      x������ � �      �   ,   x�3��H��N100�2��H��ɇ�9�Ss��sS��=... "��      �   �  x���Mk�`��������߷���\�C��\J]ZC�@��O�_��^Y�b��av<��P�������/L�4,�y^q#$~A�З/O�u/[�!��O
�� � 3�8��R)���w�98~�Y���� ��qap#���zR�%�X�8�KI�jf�O�5����0 ���������_��7�?�^O`5fTag�����<���p���E�.���B����LUS��CMqBs�7D��Iː�t�mkrƚ��:��0aˮ�~ fjG&�&���v?W�)�k�&����54�C�r�����	�sr��*Vg)sd�Q֞�yS�����xX+P&��o�s���.��<B�X:b΀���g�(.����,�s�G��'��t%�+߻�z��錰J�_�ɜPU�Ոg]d�|��b[�	�*F��o�.���<�p�M����a=�4��w���'����8����!�ZCU�,��C֍!x�`i�闋>�� ��<����ʐueh��]���yD�U�&&k�*'�^����{F�5v1Ce��������\s�m��C��,�p�������e�Pn6�=��wV�f���(h$���GA#�ld=
j�f��Q�̯�����y�T����V �<���2�r�3q�����ed����-Y��L̀�]����}Y�m�U#      �   �  x���;��@c�.Vq �/v9�d�9���� %K-���U�] ��3�s������篲_Fm�,�|}�ﲭ���*�jJٷ(����ꋪSAI4S�I�*��H�ͲU�UP~�����͙�k)?�S
�ldݨ�4S
�|M)��Q��R
�tO)���W�/�i-��=Se=!��%j�SLVy�(��\��N̓  &FI �՘$ �1H��s$ �1 \�	 &c� �U��0Ymo�;1�2�O P�' ��� TV�r@eU*TV�r@eU*T6S T6�*��0a�)&��0a�)&��0a�)&��Ԅɮ<L���L��n�t��Qe��>T�co25�c��F�k��$������l��cp>R��X_���:�" ?����#��ф����\r�D����­&(4#{�;fG�@ЇȬDЃ�@�?r�����W�S�z��S+�	䑱��-�O���vZ:׳̎�Y�vҤ�h��ɷm@�c�u��X֥���n�u ��6^���"O~�핤��8��8��s)N�����ov�9���`�X ��cD4�1 wf{ɍC|$[ׁ��v�jK��ڏN�-�h\�r�-Y.`{5��n�>4�|�D۱��b�t2m�D\���jf|��g_5�K�^��
�nz]�ݓ:��[���ׄ�gOz�K�\������g����^.���^mn      �      x�3��CA��F�Fh\1z\\\ �	�      �     x���ˎ%���]O�@�.�7]�*A��7�"@V��A2�o�8y���i{8=��R����|�#�H��=���w߾��᧏����'֯}��c*7�7K���S���cH�%��ܲռ����n���4��շ����}�Rn	��$q���`�9��m�ܪ�F���"�q�٩ :?"�`텤Jވ�����0`DvKM*o���ш`�wPR����h�aڳ���Q>�in��wa&Pʹ�J��쪍30�L;�� r��4a�8�M��쭥�����v�o)��C�H�F��cZ����A| �7An:m��~�����2?�;��Ե���̳��c��=R��8�'Q�,��Ny$�)�;햋5�D�s�{T蓕6[����*\j���dh�8��3�`��v*p=ROO�slo�It�v��7��n�$����i�q��x /"�tȀ��~C�]����g����.5��c��9�gb��I�My���ևo~��������������~����#t�=��{i55�������`>A6K�|���~����,��7.f����,�p�0i,YnLl���v�0�|�r;c�O�ڷǊ�6;c�G?��=����k����w��h)��Y^���_r�H����ւ�"[y�#/D���=��/���L��-��/���f���h~��_���T�\>}!�G7�K�b��Ҋ�?��U��4�t%�E[���>��V��V�U!�p�ԝ��b=��
ʅ_ɮuO�L���K��_�}�l��-���4������|E�gl�+��1ћ �MT�m%�ǧ�����QܐSm[�r�;����,}���K۳�?���ڟ��K>�?M�����?���#g��!BkM� k�A�Oi���G�W055(�i�+#5�d�j�5��N�ۻ��e�]|����N��`�|��<#�1rs{4��k�Hcj0z��h�5�!���[粆���U�j�p���╻j,>�`�ܖ���Gͺ�`֒V�.F�b�*��`�B�h8(�h��j���/@{٭�沵�E�,���YȲl-��,�5��6��l-��,�5Ђ �	���`�R������	SR��)	�-k���4ž��E�L[�L[�[�#B�;�}%;ض���n��f\R;�����JV[n`��#�bkr��!�R]f�e�d�����9�?�i�j;�R�d9�η�w	��.�H�s���
o�� L=�o�ؽ�TkJ�kt�G��b[�lM,QХ-����7�>�%]ڲ.���q���]ڲ.�fu]V�xDA���Kd��6V��PХ-�����c�o��K;
gٞ��BW��K[֥Y�U��8��.mY��.eG�ي�ti˺D���%K��K[�e��|,D��΋��{���F�9�{Ѿ��&�c�������}��'���e��;�w^����Z�V��y���;{)��41i������a'�<8����}w��.MJ!��}�E��}S��aܰ#b��}����V���$��˺}7�w2F�s"��˲}y<H���$�˲	޻ 
�	�� ˲�l��l�`c�`�e� ��?��7K	X�P��4{��� �j?MCU+�!𩋁Ogø3!׆�`�uѸK��̭'$��.w���]��6��y�E�]�J�����q��E�t���X��k��j��^0��G�Yl�Ч�}�WbA�\�w�+�"{��;�x�<U�a���L�w�˳3��vP�T}v�T;U�aǺ�L)k��3%�v�,ϔ�Fر7S�a��L�v��ݧ�#�X^�)Ԏ�c}�b�α�|�}�˩r�;��f��v,��D/#�X��IkGر7��c	n&2`�΅�r�;��g"�v,��d#�X��*Fر4>�U��c	�b]�r�;��.�el6�*���c	�b]�&��r�;��/�el3�*���ci�b]�X�X��?b��:�Ë�;vHL�SGرtx�}������$�ʩ#�˩r�;��/���(1UNaǒ���݂.�ʩ#����ي��lEu�}���6��ي��lEu�t9UQa�j���ͱ�c��:��k�ñţ~��G��Ϫ�w���|?�@����_jg�m�KV����_jg���?�I���A����?���آ��B��B��F��O�ۯ��Q2�_;��㪳��N4?!�HS�0���~a�i��t�]:?C������aaݚ���d@�`���w�m��]و��؄��ʰ���޴�Ґ��ᴺ�V���X�t������;�GVْ���p��p^|��$�	r:�>�J�~k�~�����:��tn���C"#�3��#W����u[G���=ʻ�0�z%Zܻ�L�|��2��������߅c��:���Q��[$8��̨�%4W�m-�W�녣����6�2�+��[�K��=#�4�V��� ��F�Ѝ�\͸Ë��h�/�aJ���F���#�R�khv����x���}���+�V��[��>��{/{U+䓒�n9�pxnM;1w����
x�/�����N��w���>�����{;��������ҫC����*߬!�5���4�/Y� Bmo�]o�[i��n�����fm���u;f�Y�h����4��S['�[I/�u�ۛ�=�zv�1� L�'�צ�z��[�^ɣB����3s�{��������k��W�T}�M;�h��Sxo�����EQa}ژ�[
2w��.��B��Ѫ�J0+����7�7��~��پǵL6nq�o���Wm<�-���aʄ)79?y��~5���٠����P�ȳ�gTgy.H�J~mfX|E����,/�>�ܟ���47�r�w��~�~�J��>M����!�*�z!k'��G��FO兕}��@��z�T�m:���g��7�*_M��M����;���{�f��8-~��s����	�:DG��9�WWrZ�s�ЭC�'������E�)�vzzfo�ꝵE$yv�u��
e�pd�KOyQ�!:�_���62~L���q���QWn=1ך���Fg�VξgP�MZs}�ΰDʎ�F��:��[����D�.��Y���f��L^e.v5�=��'%�5�����#��3���C��El� ԃ�����x���5�T/�'$���c��c�}0��Fp޼@�������"n��9tz�����
���ᑺc�i�Z=&�#����[+E}���p��RkOC��Q=9-�{H������1	?9��O�ċ9���8<��b���v�C}6�+1����H)�sZ�Q���pô�n��#?��n�V�E��r�!��bӳ�r�O�S !ܮ����\�E�n�"��B���&�E�nrTLȠ9�%�����y|�|?�AЯE�"?Hc�8�Z߀��m�\�i���Ar;���ṋ>
���Ar�����~�+�*	9����ڹoi�xP�z�	����#��%t��.>�& ��ʡB����+ ��k��?���2<�S��̓?n@H:�^�ɢ���ݾm�� j��      �   R   x�3�4��M��LKL.)-J��".#N#Δ�⒢̤Ғ�"��1�1griqI~n*LȄӄ��$1-�7�4�L�G����� ���      �   X   x�u��	�0��ni !o�u�����������(Ҙ{����u��$^������TM���%:��#� ���rE
��c��2�      �      x������ � �      �      x������ � �      �   `   x�340�435162�4�460������̼��"N�CN��%�����	L�9N�@s`��a��L�(7�)7�;� �����Y�ksL� �&�      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �      x������ � �      �   m  x��Z�n�8}f��?P��;�T��݇,�t��"�B��D��Im�����!�Dr$G����K:�lrxfΜ�`��>�o��Eu�]�͙3�qa��L�C�C����q�A�)S'vqʀ�ߋ��bU��e1g'��r^�?,+���W��Ӣ|`F◪��j&�Po8�~�y�L�]&��ܰ/�b],�K&�t:}�w���f,����+��݂�V��*���uͬ�w7�%~x�V�����mu��{?�:P���8�P[�'7���:����h���s�K�I-�TO�,�-�O]��p�2��&~+�Ţ}�t@�XG�=�q��m�f9�}P;"�PSB)�v��aQV_�򡸭��i9��A6E�]��������d�x��x��~�i͕���?�V�e��a}�|<��K(��bqC6yg�`v���\���{k���e�ִF�s�j����M[�m�e1aV:�?	�/���)�$&�!�sm2�З\��z4�o1��D� :M���b$��������<6�����Gh2̓��X��ϟӈ�#��G0�E��f��D��g�N��D뇻	����0�v����W�#��	��S�&���/�a)�I�yFz�< ��(B=%|-�����7�fر�=m6�]����f��̅1�yeN�W��1@Q������Բ�D5P"���,��"W@Y�i`��f���"�� �j[x
}z��Ǟ^��x�/������d���r�Z��U�\�K����_ޕ3��l�(�3/X����p���9�g�5 �	q�a��v�/�h�O}����{� 젰&M,f�b���Q�����G���r%34�DW|��k��r���.�ڎ�p�h�Cy���;�EPą �v���Wm55 8����#u B�D���զ�R�Kl)��9��t�)�|7���AI����Ha�y�^ȑ�!��xP����^ i�<ns�3��Ը�\����6B*���Q02#��0H���1oM�+�����N~�W﷘�q�w{�v/lΩ(W^�z ����#����z���I�'��
�	��S�R�k�GlT@�Q���#����}tǡM�F���SwBS2�R��9�Fj���h���u�%�X�zC�K^(ʛ�?����i��/si2�J��ԯ��:M#,-&��I�gX� Ȏ���k�4�f��KXVt��4�Oӈ++^�4��:���
��і����؎:� �I����IQ>���ݦ�I�<�.FZ�!@϶u��휁���C�I���5=�P5�AF�����+a�]��B�Id��]�z[K���α�S@�ji��)BbY4���d�)hs�3܊A��MA"o������5�LH�m��4��,}PTQ]k���:�I,�4�6R̦17D���[;xU�-�HQ�A�E*��!)�1��0���˃�I+�Րܧ�P��&�<��Re�Q�+	A��_]�S	L�pg�D��e�Ý"�Y�$G*#h�C���T�j��	�060��)I
��O_X߄��h��w��סk!�xP���E�0�����@)�4�w��S>� d��uv7�I�*G�뤤ʳ\u6�ҏ2�Cs��@*M�9e� �؟@�q9��'���r2�� )Ne��]��YC�a�B.?��Y���S��������.{��16�$�&e���������Sa��uK���>����3
�!p_7E�8����t��ؾ:�2�i���G�9�{�Q	D-u�`���rwWW�I%Hd�y2��^���$S�+ɝ6:��=x٣\��[q*=�7Fw��#�8���*�|�j̻~��~� �4�3)E�]�H����S�nS�N,�Zm�ޱ�|��[�\dGGG�[�>      �      x�՝[�\�q��k~����'S;�~ІB�pĆ"6ZlJ�֐�9�f�"q�{�ͪD�K�4]=C����@��?�v���?�������������v%k���������O�w��)�?Ez��C
�"19��w��ܿ�������蛨{�=��1�����xw����s	~����%A~��JP�D���1F�=#X�J�1 r��!�&��CC`�K
�� ��s�"3���� �(8��P^'���PU��q��Bڣ�R�@�Ť iO)�����[ =���Jabw)@;*g���B9 7�������|-�=�-�TRR=����pT�״Pi/R�Ƞ�|�䪉�P��`Hr��;P_� �4�L�/��ͪ<�� Ab�QGN�R4a�X��$�ei���w���X��%J9J�/Wu�g��$&p��񈐞	q�~%�ݿ��홄�!!|��s�?��ie8!Bg�%�X�Ki9��&�,v}"�S"��/�lB��\�s���լ�$C���*�!|����cx;د�W�
	b=�]�4�OL1"EV�`�c��|ͧ``�/{|pI>N!J��e#����>0���Y$�6(�Հ0�O�XM�B��4�ٽ;f
���k��B0�T�p�wt�L�g	|�ןa��;f��3� �v�<@^k�����\%q��������=�\C~�Ĉ)v���8ȮE�Ģ�+��Dr"��W��`!Sb���~9�}�q��MM�a�g��Ϸ��X���E�8)��$	�^I~+������W�R��)���T;9�j�jq�d��8��VՇ?�Z,�}� �ɏG�j���OĲ7�\�Q]�!돫���W�}'�� ��8��~��+���B���X������>��1��
~�@��\�\	����1�K�WO0D�����Qǳ���%��<�N��e�jT?.n�R�i�KUo����/����|�~����V�ˎi�W㴸�_J�Z��|�*�!�����fv�or�����"ԉ�'7�pA��>V��H��i�y��|�4�U
W����c��Us�*��ib��>��[��-�s���*Y�X�AE|���������4$8�����Q]��C�C_u޸:��������|i1�;�C��Qt���v>�_��AR̾u�C���/��
�ޑ�>t�H��]�^�{����?P?x�C�C���?���,=���Q�����E���4������<H�Z�%iL���z�c����3A���7$t�f�B���C|����7b��^�ߣ�U�8���w}jz���{␢8xxC2�^	��{8����e˯�c�죟9ϫ����W�8���g� �a|U�1��eHfa��A	��Qڣ�s�}�A�G�3�#�D��WF����U���̔!�鉯�R��\�[�8�zn{���tRGe�����|����.ߐ��ė���~�uR���(��w�	^����@��C[��X&@j$���8D�4���ƒ�����R��_(wZ��z�T�����g!�`-�=c�
�� �L�)�7�}%qH�J
1��h�Cr �b��X��eq�IfgE��~�l�H`��W�I�5N�/��I����*��0J�4���1�R�5r@�� �F� U��$G۬��,W���C
�&<��`�,厴\W1c�8J��vA��) 0�T��ij���C"Z`�����7u/� D��Ff_�ᐔ��[ZƦh�䟂8H���
ʝv3�AzZAA��ւֵ�l�LG�WO�C|��%[�y�	ݸ�}ݗ8�� �"��^=��+�ԃ��A�^]��
���2��ӑK�ږ_vۖ'@�=�����]@�#��Ǉ�?����w��>�-OT�DXQ���W�}k�~�㗳y���?����Ӈ��~����ϻ?���]��/^M�xc�[ͣG�;"�pv\��Z�݆�X�8?gD�w�s���1;�nk���%g"ˏ�DЙ�W�RV��zT�u�U�,��BH 1Vls�1ԥ����,�.�N��R��]�r���T�`'^��w���-8&6������c�P����j�ZkE�
�Y���\�Vπ�j� ��b�%h�uX�?M���-7QN6�1�S��s���\�՛h�j�6��	�Y �k���������Ӡխ�	A}�3Ϋ���sR],���Ӭ,K�d�,\-��Z��=�6��M�Yr�n�X,���i��l���s�a1-[�v�X�H7��f��J�.���Y���ێ*����?|�ꤣ�lS3�cI~q	H��Iw��F�H�3�U���h+��޴���	�$���'v4��7���_mó����x���S�=\3�0�aZ��HZ��Q�~���j�6�]�O��Ga꽯��@=.��
Y"�N<gj�or]�ۖ��hU��^�`�ɿ�k���b�"��J�X�� /[���ϋ�,��F�t,�~ٞ�{t)�TX�&_�M���=�L��j��u�0���L�)%L���/���?���/�R�Z�T�xIF��I㹺�~{���\��@m�J��s�&���e�g��TA5z%�)_Ƽ���)�j3FZ/NV��oS����@�ZO�v^��������@�j*E�[wm�ըW��0���q�a}�X}Ĭ� �^�Wi��HmjD���W�X�KT��yy�F�6�b'��i���#�z_�y�v*�^�����P�J��ѯVGg�o���5�@���S�Ԩi�u�1�y��7�A�D��{�ڀ���PC��{��!.�N/M�D���u��Kg d/Ъ�;� �[����'@(!V߸Sj���Hw�����P��\I���3�����aȋ3?��JY�W[�VB�0���� �G���&�P�����i�&�%Ѱ�v3i�"�_�9���V�L�(x���]�墮�e�}\�HCB�\=
��Ǖ�\�ȹ-2N��0N�r'�Q�{Ae�m�iNұ5�z/h�۰����N�I9v��dhM���{���Hn�N�_��_ø���%_!ǔ���0ꅳ<ʌ�ǋG�0Y�zu$�o�a��[�Z%����1�W/eؚ9�N� �z��P�jGcD��<G�l�yM짫0�
�qn�
w&6a\�^ʰ����e��̵���}����fuW�������l	t;�� :�-�3Ŝ/�z#MW��l�s'TOΎd7I�,�jH3��&	?� c�V��U�t��(Ud��*�a�Q��S((���7ˢ�"mx���ig\����j���6G����>Z	=A��ӈ0L�\�!���]��w/`
��i�o� K�,�cO�h͒��Z�I�V7V��V���S-88�c�j��'��9�
��R�/!��y��Rb��MBj�,_�+�Rz�&�:�W솏�)f��p��g�d�\ˤ�����*Ac�J�����n|�N�x�8���D��<e���֎E٬v���o�	ֆ��_>�4�	Bkm���z>�æp�@0h+8m�v��4:�3��X!a�o��2L0��x	 ә�'~�%�'�V����:�THچ&����n�[w(q�DR���GzLg��1j��yu���� ��٩�H�f\�7F� �3�N@�����@��J��Ͽy� ��[GY�f�bu%�;e%(C5��I�쁎�.��9�S�X��(84�$��|⥆���j�k���j����s"�IrD���Ѯ�����Q�� X�S#����W\�\��s�e��I6�����G$|~�~=�	��]wY%�o�4"�3J6P��iu�g_�wӈ�����5i'A�V�U|V���"���yX��Rx��̥S9�F�6ۼ�N�$��#v�t�	r�sN��H�niD����|��m���G&�ꡐ��u�"Q�Ur�3:N�`����QGy$j�j):��I0��1��4I�ďu�&��)�4�I�(i��B�i����o��(l��R�@:e�y�"�C�2�$c&oR��&�6�    �j7D�8yt����_�ة}�����8���<� m�)���~�-oR�V8@=���^�&��������yDI����"��<DM���'�X�_{�@��k�e��7Ks��TgV���˸�kb��Φ���}٤,m�D��#Is�ڳ� @g��n�b�z,#k��U����ed��Z�Q���|Α%�N	�)�:r���y��I8��O���(��ԍ�t0����W{J���`�PѬs �z
q�}M�#�T�)�;�ӴCqde�Z�Me��Rt���h��Z�c��&��(�յ�h�P0V��>���_REq���uMS�c�X��\��AUJ�JT���@���W�#�g�����wH0�<�F=�Џ����8�hŤ{� �q�F�l�H��T:Kt�^�f�T�G���h����D$e�y'���UGH]�~u�h����D��'�F��Z�Ѻ�]P����"���8Z1�s#u��	G+��&���ґ�hŔ�܃)A�9��	��NѯY ����s�-�xńb6���BZ	��v!M~�op �)+9w�;�v � )C'а�L�5��.IF�J�63֥4�� ~3.��n����r�%����� ��mB.쐑����"���m�{�m��Hf�z�f���wo��,�����R�}�y�m,��ز�u�&�N�h���0�B�ů<&^?�z�2�67/�Թ��6���'ڙKG�~��b��E��O�!&S�+����C.L�{m��GE�3��ܗp �@m�O8侄��z.�?��x�}	�Ā���A<�#d���o�'^��,�!�xe�؃d�FIob���dJT�9$4�3a=�߰D2@�L��0l�i�$4�auhr'�+��T���e8@�L��S��%;���
����r����'ª\��a'!)Bk!ڄe�/�!;�퉵J3	�N:��3B��"���7w�(=S	���\��Oc�il�L�T�S�ƆӞ`AC�ĝ@ڤ]h�d�.�����4�_�����ܓ�-(�b3�����~�
�5fw6AV���I#%�`�z�ډ�Y�'Bkl�HH��h��!���{&��ѳv��u�]qτ�4b�N�\��D���s�"���3�)��$/�K���a��=b'K�c�9ֲ���21t�:�*-|�B�\:�^�
���B��ԩo�1�e"��w]T�8r�cL#G^RǠ�c�Kh��;�����#n(��A��=H�֒�in�����Uf�L���C���T���u�LIX�:'�6X��0xJ�3l�6������Y-Y���
�1Z`���h�g��k����_�r�x����OwN�i|������`-�S�J꘠պ�H� i�<������j;*4䜥�KP�QCܽ��ɞ�/ �l�=S�럺ڍc\(�ub��s�����s��J9^pfwG��7�=�m�<Y<��+l�s4`ŖVO�C�{ͯP�86HY�Ƀ�1B�M��� ��@ ���}X�d�}]�5o�[�S|u��o��n⌘��2i,����QoH��*�9%?W�1ߐ���Q�%�T�؄[����B�!1lr-��)�3�	���)3b��A9h���Qϰɽ�%*�%��aX��Kq.��ۉ��F+�j��5�%pV�l~�u{���U�Rd�u{�m�0w2�c�nϬ)��?
�p��H��Ŷ�̩�\z+�����-����� �C�T�{�k�B��	
�_��8�Ld�%�W �'�0����J��օ��%�/P��Ra��e��b���ڨi��w�>�������B�?=�����M���������O����������O���?=��\��������w��߿�����������w����[�<��3͒z)�_Lf&ڽ�)��%_��s��W�U(��wB��<�u|*���)lx?����?����:�ۑR4H�}|������~���������n�WЛ� ������OKN���d�����a+T���>�v������xqN{A�������>{�������}~�Ss�:������1�e�^�OX� ��������q���`�:Yb�~�{y�K]��!������x#9�y�p+�����vS�w�f�^����W����O���7�/���,�Y�V��H_(�dդ�;��W�7@T�`��~�#��"}�����L�,�@�[���~�D��֟�@0Ư?p@]�LB�ٟ��7�ڟ�-c|���Ŝ��t�w>k���|�r����O��8��#�-x���^�r�-�|���v���/x�Զ�[�?Vw߷W�>ך.�>�r�RmDC�湦���:��������q9q��J%��H����j������_�P=i�D+�#�P��oB�Op����k{�s�?�n.�������r�8b3r��e�ю�\���if(`. ݜ�8�	x��8Y�z�sq7�0b��8�Qo�S��}�8s��7�-�\-��S�<ŕ�8�U\�������g�6dO��������� �z0JT�t���:��֩���X����o.�6�VC��b)���;ٌ�K/���?�	Ho��Y�P"�N��ļ{���2}����_��߾�<ˈy#�_�	P���d�R��W�8_�x>�f[��#W�d��W:�_�"��q9��-��i�=s��˶`���]�v������s�l~0�#���?���H��^������c@Ox�x�W��u�=���>�-Oc�����n����%�?/�}�s�g�ͭ7*~��D���1ޓ�u;��6[$�L~CP�n(^i��L~�`n���-C���6XD��j,��C:z��q��BvG�T����=�ˡ�L��W�I����2��d9�7U5Djˡ�j]��(M��p�}TJ�:������0���P,ԑ.�~�l�ߟi{���r�v�$ճʿ�MH.��o�F�ŮH,�f��iw��4�K��n!V�6W�D�\�-��[V��ݗ��~hCmH]�=Š�{z�Z�C�B�4������4PH�m>~�Y��r�8���R-�kZ�+Vg���Ԇ��ɟ- u��u��3pgE�h+��[$��돣������g�\����r��5V���M�!_i�S��^�Ʉ��T\߮�;i�p�,����hkqٴpR,� ��ўx��HI���n�7�o&�Uo�4k�\�P�}E6�nk��MC��q���؅�BA��g�q&i���Xs(��N�InA�UX��k��:�w#��r�M3����N�G�&!�ps �ſp��+7��"��-J�xC��#�ϸ6�2���������,?���M)���M��ؿ�G�-�n�W$`%?]�nC�o
�ڶ�����T�EY;�|��Vy��2vN��PnSט�����&�����,)���-ۤ���Z5�B���nR�� �s��O��;B��oŵP��ބ⨂����.���WN��ĕ+'RW����۹t��+��=�3Q˭�����=�3`d�L��I�͡�ᝏ3��ꝏ3��f"��U�3q��zKg>A���ҙ�epo�<ܩE�ڽ�3�q������N��-�	=������b<�wx	�L��Ly�Q�\��7�HE���hq�R��ߴ�3��1���C��b��Zh�m�s�*msZ4}����K0���C�A�>C�ek7g���b�t ��s5�6Ww�g@�Hx1$�+ҁ^��k>Ìo}���P����J������}��_��t�[�?��_��|�����}~�����~��������o_D�^<�?��/���-���/������?��s�,�Kq_P@��q�U�`&3g:�d�V	���v�5eSO'�6=�"��U��Ҿ:.��3FB��l�l��k#A�|�L����J����1�f�b�=�oO��e��5�P��T%P�3e�yX"#X%�����B��Q��������w�q�Nk�c���蛕Q���y���t�H�o�8"���C��C{o O	  ��0�XPv��z���:`��y}��0��`��v=��e�6L�����q��h(�����=�G������<��|��\�]�����pN�I��`�"�f�-<X4j�u�(��X�\�z���-*����/����a�EP/����E1�W�O��K�i���u���u'Ď����Q��'���G��*����XV�b��D��G �3C��[Vx䮰k�na}�6�������o�I�����遦٠X xY�֨�~�4���t���������6��������~z��_��==�׫������"�����{�r�1"b0M<�
Xڬ�`��������H��zZ�mqI�~�~"|�f���'.�~���O�>�˴D�JRڊ�
�OXQ_p,*���5� o㟪�XJ�xv ���kۚ�==݉q8@�|4�Ŝ��	�Bh���pS̗B}��dS��h'�e�o��A�@�X�zv�t�@LS0������-Y��,i���G�[��H�7þD�#9���d'C���M�?Q����2�+���Od�O���D,^?�X��n�v���gǉ�\+/��؊y}|�I-7E�%��$A�X�*�JC$E[H��E����:A��(�<�<Qj��KPI%��(ox$����T
�S�6����Iob��A���AΎ��SS{�����6㲿�"�x2b��N��d�z_�ƥ�nW.x��E�Ne��n$Y������^c����h~�M��13��/�G��>?�JT�����$#;|���-R���4��	 ��(}[��g��S$��ċ�'�C����y�u��
�儍��4t� PB�INA�KKB,�b���)�������Y!�J�1��ц�����J�AH���S��Vc���L�hѰC����_�~q��7�y~��pP��bIM�yǍ�g/��f4a$��2�Ș8�2q@\�S�K�GcĒ�%ag��\I@���Z&�q&@n��VF��}��r}Z�$z��-���i�D������VZL=c�>C�ʏ���	k�0��P��DV�O^Ly��N%/�ɢ�����`nJ�
q�LZ�opo��TC*^�{����YG����1Jj�{7���k����s* i�K�}?,�?=�dq�/�D_�6Fb ����×M��b~�Xl��I��0�q�ׯ�Ap�[f�S��üF`-�X෺�'t��|���@�Z�D��Ey��x�I�p9n�@��˫0=�y��I�3:�����XWU:���y��/&���	���9��d1O��	�K��Uقg�͉��$�gIv"ħ�������_��JV6U�$7.'8� ��L)W��H��om'����	R��^i=������f�6{��"�s7�t4����㏆l9�R�8m���7+�jc%*�=l&��Q9�E�IKr뉶�\z�7|�g�8D�K�rL�N�L��ɖ�&�WQ��ʹr"�L	I��UNo'�[7�Nɉ�)+\g=ݺ�vJN��~���:r�oSNl�_�"v=�5��Z����Em��5��Z�(#N�r�s�L��$�u���fp�ƙ�W�j��7/�㫩X�k}۫�Nϔ~�R	 �u�����ƅt"nS�D6�^AH|[)�&��͔��4{)�"�����S�`���\5�N��:��,f���;4ZqM�3cz��t����x8�������%8Cb���.#�qJ���y��f��s�4:N`j=��f�}f9�Dx>�Q�V��}� ��� "L|��q&��V���H�j<ķ��eK�7X��l	�
�kl"�	���v�[�^�����C�U;�E{��thdl�� � ×m�,�yӑ��&m����'j4�Ma^-�L�C�{4zɭ3���X8OUc���//���6��/��P��_6�C�D���kJpj#?M�8$���=�A6��X�	�C��Ps�?�-!v��b8���r��>��c(�D9�����×@�F=�-�|b�,�/�(vj���ȣ�aA"�l�܂yUO��iA��lZ4v�h�K��x�u<-��9znF	�U�E+1����0���R�p��}��Ӆ8��M4�cl���e�/�1�x�ڼ����}x�l5j�J��ռ����h����N���)�t5�X�WCLE�I��F4^���X��NV��a���4�����j>�j[T,�{Sd��DO���[�Z����N�)���&�Q�X�ƩU|�7u�X��j�b!�S4t9Mz��{�P��tҰ!�C,-�~��1>�z9��Iz��e��ꯁ�e,�Q�t�������J'�@]*�O��!1�e�qJz����Ĉӵ���Q�ۍt<Rx��ϰ�W왩����YO�?��������?     