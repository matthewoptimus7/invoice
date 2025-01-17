PGDMP     &    '    	            |            terion_billing    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    216   L�       �          0    37888    credentials 
   TABLE DATA           `   COPY public.credentials (rno, userid, username, password, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    218   "�       �          0    37892    credentialstrigger 
   TABLE DATA              COPY public.credentialstrigger (rno, userid, username, password, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    220   ��       �          0    37896    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   ��       �          0    37900    districttrigger 
   TABLE DATA           w   COPY public.districttrigger (rno, stateid, districtid, districtcode, districtname, operation, dateandtime) FROM stdin;
    public          postgres    false    224   ��       �          0    38062    feedback 
   TABLE DATA           9   COPY public.feedback (rno, userid, feedback) FROM stdin;
    public          postgres    false    254   ��       �          0    37904    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, senderstatus, date, reciverstatus, transactionid) FROM stdin;
    public          postgres    false    226   6�       �          0    37909    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, updatedon, hsncode) FROM stdin;
    public          postgres    false    229   ��       �          0    37915    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    231   x�       �          0    37921    invoicetrigger 
   TABLE DATA           �   COPY public.invoicetrigger (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    233   ��       �          0    37925    position 
   TABLE DATA           [   COPY public."position" (rno, positionid, "position", lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    235   Z�       �          0    37929    positiontrigger 
   TABLE DATA           x   COPY public.positiontrigger (rno, positionid, "position", lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    237   ��       �          0    37933 	   previlage 
   TABLE DATA           Z   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    239   $�       �          0    37937    previlagetrigger 
   TABLE DATA           y   COPY public.previlagetrigger (rno, previlageid, previlage, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    241   A�       �          0    37941    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, "Lastupdatedby", updatedon, productname, belongsto, status, batchno, cgst, sgst) FROM stdin;
    public          postgres    false    243   ^�       �          0    37947    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    245   ��       �          0    37951    statetrigger 
   TABLE DATA           |   COPY public.statetrigger (rno, stateid, statecode, statename, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    247   }�       �          0    37961    user 
   TABLE DATA           I  COPY public."user" (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon, organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    249   ��       �          0    37969    usertrigger 
   TABLE DATA           e  COPY public.usertrigger (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, dateandtime, organizationname, gstno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    252         �           0    0    accesscontroll_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 68, true);
          public          postgres    false    215            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 158, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.credentials_rno_seq', 79, true);
          public          postgres    false    219            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 117, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    districttrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.districttrigger_rno_seq', 1, false);
          public          postgres    false    225            �           0    0    feedback_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.feedback_rno_seq', 3, true);
          public          postgres    false    255            �           0    0    invoice_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_id_seq', 1132, true);
          public          postgres    false    227            �           0    0    invoice_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_rno_seq', 163, true);
          public          postgres    false    228            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 151, true);
          public          postgres    false    230            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    232            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 300, true);
          public          postgres    false    234            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 5, true);
          public          postgres    false    236            �           0    0    positiontrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.positiontrigger_rno_seq', 2, true);
          public          postgres    false    238            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    240            �           0    0    previlagetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.previlagetrigger_rno_seq', 1, false);
          public          postgres    false    242            �           0    0    products_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.products_rno_seq', 105, true);
          public          postgres    false    244            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    246            �           0    0    statetrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.statetrigger_rno_seq', 1, false);
          public          postgres    false    248            �           0    0    user_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.user_rno_seq', 166, true);
          public          postgres    false    250            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    251            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 719, true);
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
       public          postgres    false    249    257            �   {  x�m�Mn� ��p�jf`�YFʺ�����r���yX�#<����ȅ���X�Ƚ���uEk__��I��9�8�q��2�����oq���O�#�x:�ϣԋ����V�(�B?-�*���Ÿ"���m#�F�3�LP�2� �C<�FM�փK)�����z�$�,˶���ؽ�`/`��Z��y65�[����ZBluZ�\	f/�h$�>�>�x����SS�}����xGxN�ad�ZH�(�QnF<A֚�������Qp�8qe�,�<��L6yT�+�)�y�	=B[	�Iv�N�����9�}�j�	#���S&�y0�}�i�I��0��{�L����񄜍�D��$,�����NB�C      �   �  x��������O�P��ǟ�(��p���W��0������pfأ�B
�~*�u�T�-��M��gt������?���֯����%�]��q�L����>������x"�v��e֜)�dX��XA�!�j��F,�����|��1 �=�]d��=�՟����2���꟯��G>�#�ni��;��J?�5뙦-ILԳQZ<���G��jH�Yɠ��?N�q�8o%
�t���r��a���!��oV�i�)Eʃ�;�g�+��+�h�i��9eZ�5s��)���t��a���C�[*�J�<H�o�ㇸ��vlSz}@t���t&��cJ����D5�}�;i�$�N��ʡ��34}�Q�m�4��E�P�rΆ]5�[6�RXL$�*�*ć�-��{��ET檆芏9�c��ey6��D�Ă�����{2��B[�T��Ρ�k��,���	�J�C��\ja��"���:8�-��YW�`O�� �Ḛ���p){΃���]>�n��|������+����I�q��O$�bz9����܎HoɄt���HK�S�AH;B��bl!�*�sW�E9�l d�Ы2InӋ��H2+-f�F��l���J#���a�⑤�x�z�!�8JJ�<Nm��j����"�/����LC�^�u����O�7�ӳb�Wp��K6�D=ՉLgdލ�@6�*�����oH���*kjd�d>Vd��L�ȝD=�=9�&Rސ蒂�E��}��7dtR�M�1K#�V�~N�b����y
g�5��d�8o�|�m�~�٬t��ㅓ��h+N��9f�vד�%����I��j+�e���"��k$#l�0e[nY1�Lb��RI��x����94H�M�Z��3i_m���g������}� ;�<�aa��کl��� c��)u���n^N
q�m��ȕꈏ�E�G��g-g_����[�䭩/�D.'J.M}�[NI�n���ϫ�$��
j�J��8�PYf��Z��Sn����+���\Js�����}hdɔ�b~9�I{�(����2���h��]��(�+GK>�c�����W���.��@�iV
-��[�}[��~$�C%<�c;�$���ч}V�G�R�3�t�Ms+������*��`�on����䄬}�ڂ�Nνl�y�\C1�����^�輝TTv�j)�&���.ZRG-xi{b��I�*��~9Hs�N'9�&��6����4�0�������}��Y���nT"��f�L�p1�����r��`�Q��Z���O}��z�L�Wb�}�u�l��<��]��s��?���M@ܥ��z4Ͼ�y�7���&&��2���T�G	���M��]��l��}��}�z�,�p	l(_Gqq��ݣ�E��:q���;:;Q>#��$����f�嵙����$d�TT�d�鶲�JJ�HA�
%M��!���9�^��|��̓�<ZK�et*]�.o���Et
�o����1��ҵ3R�#��#ꓐV^t��Q@��>�RxP��;6{�7Lq4��~ϖ,���1v�ِ�P�#R����I��r�@��2n�1�&�.������,��>��?�]�/��ǣ��'�z��(���R��]�@�^WhQ�=샠/�ܾN�`����^��}�{|L	��QpW�S�^g����������DB#j��j�5��8�ٞ�m5�FԭE�i��}�J�F�>,�%G��g�k(EJ�#*�+'�l-w�4�rg��՛$s)����/��D��/�\Dͻ��R��E�����,&����.�_��98���/.9�B*��*�%
_D��E�c�1_�jn!���EA���Wc�!
	���)f�E=��㏙v7��z:��a�ԋG.��-F���OXtB�y��U�j��Q{A�Q��k�r�4I���K&C��.��oB��N�|��+i�1c\�kI�eT��K���,�u��m��rCm�/I�"�-k��ɫgF������kge��5�uPO��+���g��nz��%���v[�8Sbq�i��_��0ğ����^�:u;:a�G5u;�Ԇ{d�qM�~�s�w� �D��&i~D)j����Q�F�hy<�S�?]!l�<z���q�	�¢�v��n�x�:X�b�)B��!{��V�?x��C#{��V�'L�FGTUޢh %�Я=d��x�9y��]B������3/�����ٳf��`�����C����F�9�qT�s�*2���d�b7�߷����?((      �   �  x�}�;k�@��ӏ1w{I]�ӄtn�bC�@�����\��,a>�}�\���z��|^�����}���s|���6��:H�������ɝ�ۄ��YQ���Y��D���=�P_'H*��>�P����}qkĶ�T��H�qk�{�.렁6����ɽs�F�[�����6�*kVo�2"y����k;�*%�%(%�{[[U;#��mw�Xh��8)��t�Y=�Hs��Ml}�FC��fA���v�=l�$ܯ:��3Rn��@nO��6���J	xJ	xh�F1#�5�(���A:<�g֐	��F+��oX���B{�-��4
~�������j�@\h.��G�o�Yn��|4�w�vf��V(�� &<a2�h+���`��:�m��Ѣd��ԍv��
e�ĳ�`��P��`�2hD�
eЈD+�9�a�L;&�      �   �  x����n7E�ͯ��`��b���l��<B" v��A~?�Ȗ��3i�2 �!A<S,��VmO�����������|�~���y����ק��Bo�ߕ�+��YK���������^rnݺyү�l߹fn�Ē}�g��ܲ*��R��϶�K�F�xM��������������&4x �5bMx��l ����ԷKl��n���.-7��,Q���}|�����o���u��/���H�����f�["�އ;���P<�*���1�e��],�F8��湬�^8+Ur46�e� ��q%L�5�m�����[pv�D#
e,���(4<so�@��#�Vm�G�N4�p$���9$��~��#��T"��gU��#m`�	�;i6.�3o?ӁX:F���"�P�Հ������d%���V4�n( j�����L�f����D�!-Ö: ���Q^nFq�C)�H������g&<S�r�bM���Xɼ_Bj����f�rB�����$�z�����͵;Ht5\O@��E��Lԋ'���h$c]8�d �P9�;
���<A+��@��(K��k��LN�2�w�,E
������ǧ�l�:S��W8��p��H��t �q�hQ��l��ړ���%Pc]�Q��b�i7N�׻�56
��g���J��ST���Xc�9�0��1��sw��"�w�!x\q�s��u���3ڝ+��ç<�F�J��R���{��J�:�^��Bi��,c��u�Q�����h�iD�O�Q2#��a��o0��d���d��u��L�̹΀.G�����k��b���s2�&s��7�[OV_e�P���d��
�in������p�Ԍ�@t��pY��GwF?đj��X3aH�:I�85!<�s�@þE[�Ez�s��u�aa�,�J��;Ύ4P�mq��\0PT�a�*
�CI��ـL�R��ЖF;�\��h��ݓ�"q��*��BX6����u���p�Q<��5K���'%wF�T��hyѭ��AW� �,UI�b[Y��(:���UK���]�Yj��2��C5���=na:�E�Ȭ�Qt���N"��ƻ���1��f�4QF\j\Aj���(�B ����kM�1������D�������5ѐXЯ����|'��V܄�ӷ�Hw�д�8����:�!�k�ۂa�q�[b{��%c\E z���d-�d��z���X��|�mL��B������_��I1���O�P�VsG3Đ�3&�Xf4̩�V��;��?I�����ѐg��j��r���2�0��L��S�U���a�/�� I�y<�����'�������a}����x�]*�>e����Rj2t���ةSR��h>+�:"�c>A�3�����2��e��¤�㣛EiG�sr$9+��\�艭r��g��X<�#^3bv��FB5�g�E�\�<3�kY:<���:�A��(3����+�q2�r�Z�Z7���<�U�ʵQ���3G��Ձ�R��Sc��}��E|�P��\�aM�at�����R�ķv��N\D㻓�
)@3�����&FF�PiAi7)k6I�NDR�
�|�BG�������*qm�:��(��x�c$���'�s�;�Z��3�E�r��æ���L���+�>� �㱎A(
�=�UfF4��X��i�� 3o��V��ĨFC-έ����a�j����ʶ#D��_rJ�_J;},      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �      x������ � �      �   ,   x�3��H��N100�2��H��ɇ�9�Ss��sS��=... "��      �     x����n�@�k�5RS�����)�8��Tn�(H�1����(��Q$-@d��0;7;G���}}���)���T�["���6$��|y*|h�Y�p�$:B>)Į�@x��Tb "G�B!�H��}�8��Ub�1�� �}Ǹ0�M�l+m&�,��$�c~XR�����N�>���sma@���������_��w6?�^O`5fR�`���s��,���p���;޹����A�4�Wg�����h�3����!�%MZ���#o�$g�9sm���5���z ��NL�U�Iiu7W��k�����IU�Z�CҚ��F9.��a���-ãʂ�Li�,�eu�ݛ��''��V�2�w׶�Dq�.�3]�!9�Ƃ�3�a?u���&���K`y\�x4X~B	L���}8l����UJ�JCqBUEDW#�uy�e�ɯ�6Heeh�'0*�咽a��u1t��z���䑪o��)�/�u����ɢ�`_����+U.*]��I�*7�>�(�s*�9M�1�((**���f|9\\XA����l����(�l[�2�욅�R1�arTcuz�X,;��wV��b`�� e\L�rt���܅����[�r���ݼ��V=���B���YU���ף�:{�+���xS�z�(�˦���C��      �   �  x���;��@c�.Vq �/v9�d�9����%KM���U�] ��3�s������篲_Fm�,�|}�ﲭ���*�jJٷ(�v���ꋪSAI4S�E�*��H�ͲU�UP~�����͙�k)?�S
�ldݨ�4S
�|M)��Q��R
�tO)���W�/�i-��[��zB +�KԀ���(�@QչB���'@L�� 0�1I@c���a5�H c$ ��) L� 	 &�2�a�ڭ]�Ā�?@eL� �2�N PY���U�PY���U�P�LP٤�l�Äɦ<L�l�Äɦ<L�l�Äɦ<L��*R&��0a�K0����9S��{F�R�P����ĎU#P��ms�Ͽ�ǖc�=j���H��3`}�j딋��~�|�D"ƣ7sɡ�g���ЌH�~��A"�A�G�������:�0�.��K�D&�g��b�ܾ@[���t�g�퇳��I3 �/���ɷm@�}�u���X֥���n�u ��6��m�'��v$�<O�5)8�\���|}�����@Ρe �/�0h@����{����q��d�:0ю_miq^��	A�%�KX�@�%��B�@���G�._9Ѷ/86��0�D["W�[@53�������%�^��
�nr]_����!w94      �      x�3��CA��F�Fh\1z\\\ �	�      �   �  x���ˎ%���]O�@�.�7]�*A��7�"@V��A2�o�8y���i{8=��R����|�C�HU�@,j�}��߇�>�����X�J�U*���,�,�rNm�o�!���F�s�V�V�.�%�k�T�V�^̻�?����sH�%�"��ykC�9����r�f����ŭS3@t~E���I��_��a��얚T�H0����D��� ôg!Ie�|��-��L��s�	�|S�Ug`�5�v�7A�
�4a�8�^M��쭥�����v�o)��C�H�F��cZ����A| �7A�:m��q�����b��\�ZSҍ��}��jtO�T�)���IT5�&|�S�n��N��b�7����d�Mƶ빁~YEH͈��� �Ԇp�6�c@�.B�G�iC;����D7i'9|#����I�n���w���"�M���>����j��Mud=�|�wy���v�2Ȟ-�ų'm7��S�Z���?������>�������a���?��������԰�v
|���1����,=|�����͟�BOXZ4�h\�`���,�p�pilYnLl�uc�\G�{����'L��c�i����#���z�Ԟ�������f}�{LG��Us�,/?��/�?��Hݰ�����V^�Y��_b�)�	�{9�)B�y�K�1��٬l9�_�� �!l+U��-�OA��ѝ����"��O�g�th&��$B���h�fz�!�;a'*m%xJ�ͤ�D����V�P.|Jv�{!f�^�������g#$�*^�dB}.�x��[l�)����M��&*Ŷ��Say����(�ȩ��D�����s��A�濥�Y�`A�OE�%��&<�U�V��J���3h����&F��� ��2v�ܳ@�+0M
gZF��H�&��d���S���3vc7�5��I���g�6Fn���~�eLN�y��z"�4����\���C��]�*B�u]�sW��W���2I��Y��Z�*�ň]�UŶ�Zh�`�-�X-���ho�U�\��(�etv4Y����E�F!��3�&���e�Z��7�R��Z��4\<>�$h7IplYsl�)�5�H5o
���z�ڒ�ؒ����H�+	����ȷ��vӼ7�*����ȹ���CT��r;x�y�[��(���i��2���P�N6��pب�sl�w=GB�`Y�,�����'AvХ�r�]}�TM���G�����jM�|/�.�H�SlK������%
��e]2A�FՇ���K[�%�U��oς.mY�`��.+j<��K[�%�T�F��O(�Җu�����c�o��K;Jg�^��RW��K[֥Y�U��u]ڲ.�CʎZ�;�Җu���_��,ݿ�.m]��;K���F�;/�w��޶k8��O�E��7�dύ�ۛ��E����^�VC������w6�2�J�s�����[�~��Isv���ߝ?�t��������wiR
��;/�w��ʎd����,�;�-u�R�&	�]�������j���.��-�� ��'&	.X�]�>QO@X�dSld+�,��ĞP�in~XJp������6X�P��4QU������t6�;jmA�]���I��zA����s�?`��_1�5���w	`o�Q_wPN]TNg[ًeN���{���������8�����OJlȞ���<%vdϵ}�_&O�}Gر;;��a���L�w�T;՟a�N5hGر�<��a���L�v�;�3��v���tiGر7Ӧ`���S}�vl/�4jGر�|���`�ؿs��T;u�[p3��;��f��vl�͔�#�؂�ɌFر7�����T;u�[�3��;��g��vl��T#����*Fرw�.���T;u�[p�2L�SGرw�.��T;u�[��2�L�SGر5~�.kl�_��81�Na�����'$�ک#��:�ڿc��b��SS��v��T;u�[��w��j���c��b�nA�S����~��lGu�}��:�>�Q}���lGu�}��:���ꨎ�c��Z��8�1�Qa�n����8�Q�Ԏ��c�g��;��@���@����_jg�m�KV����_jg��ov�\���.�];[ϱE}�`�B��F��O�ۯ���d&�4v�e��Ug��h����`0�$Na4][��e���IH��iw�|�=2����߆�wk�ws����!���m�Oad#�r�F++���zӺKC�	�iu�tձ&��?k�>;⯬�%_�'����2�����$�r:�>�J�~k�~����=u(�������C�"�7��#W�}���GG���3ʻ�0�z%Z<��L���vZ��>_DJ>��qnd�~ը��#�Ff���+¶�+���U� g�a�}ەh�#��Y��ř�e� ���U!�d�P#tFF�f����@4>��`�����w���[�	�5�\�K>�Q|���9y���+�V��[�l�>���^��Vȍ��9�pDnM;1�q��
x�/����0N��w���>�����{;������D~l�ե��s�o֐f���lZ�Ǘ<Q����֮7���4�\wb�{�VvH�6���u'f�Y�h����4��S[�­��u�Ǜ�=�fv|0� M�Oj���z��G�/^ɳB���疹�=��~�\���Z��U;U?)���:�=�ޛ檾�zQVX�fĖ������_���Ѫ�J`K��͇��VW���l?�Z��x��7��Ы>���B��0e��M��V��*�_�k%{5hz-�X�a���3���M%�f?E�6#1�9��/�<���Hz�M���Ӻ~!����ztNS����qH������ɿz嫏Jm�����>�߿@��z�T�c:���gvy��_�����&��p��P�=ðQZ4����9a?c°�Q#k��ݕ�?��~�֡�'������E�+�qz���
��'k�H��6��5�&�0|��
�0SCt�>g�lT�0��w�y��=���,�za�5Q����x9��Ai7i��Y�j8�);::�[���o����6���g�ǫ��2y����p�:�S7J>��ᵿ��.��z �/��oPO.���ጳ��S���P�r�?���9�I���;�y�9�3z\����տ�a��/��U���;���Ya�c~�rq�wk���<_G�+��R1{�Гf��c@������㕳��$M���=.�#��.�_��0�A|���&z%ǽù_)%�fN�=JB#�yn0Kao�6>��C�0w?��.�&���?e/��5�1[��FN��p�nP�f��*-*��h�Qu8Z�i�[T��!7����	4'�W	a��0u_9�_� ��"��$��s\y�o�}�[�´I�� 9̝�E���E���~�o��?	�l�      �   R   x�3�4��M��LKL.)-J��".#N#Δ�⒢̤Ғ�"��1�1griqI~n*LȄӄ��$1-�7�4�L�G����� ���      �   X   x�u��	�0��ni !o�u�����������(Ҙ{����u��$^������TM���%:��#� ���rE
��c��2�      �      x������ � �      �      x������ � �      �   o   x�}�1
�0��9=��4�5���:����G-F�dz��o���3M$ ��;Z�i��5O>O���8g|m�	���PN{K˓F���O\}������x0�~��+����8�      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �      x������ � �      �   [  x��Z�n�F}^�~ ��ޗO��H\NQ�0P0�b��dG�s��wf��I��I�"(�RLi�~�B���s��W���Mw+�q\X!$���P�`����0� �)��<g@����M��V�&[���l���6������y�?0#�K��K5\�W^	?�<U&�.�Kn��l���ł	?��߼Ci�������ٮ�[��bw]�u�������X�����Ͼ_��ɿ�˫ �.r�!��"ؖ>��J�vx���QS32�>�2�Z8���Y]���<?�(y�ƵM܁.��E��z.���H��P��BJ��hM�v�������M
4=�RQ�%^q7�r��%ZseeO��[�ŗ"�n�Y��m����;�>�Wź%���zv��oH'�,*�N��Q����{k���e�δFG�o�l8/>�"�L�T(�!%��S�<&l��O���C��I� �D��$�;'`h=���j�QT�3 ]n�pr�H����5<��u5�*��I4j�c��>}*W|�hO1��E��`�)H${�~�$�,+��a��ax�����߾5���U��$!L ؆��5�dk��/�ʧ�Zy�v0��hv��Td�������==�F��� am�W� ��Rh�Y�9�(���<�ḵ�)@X,��o�6�	"$�;m,����;Jt#(�d-^�� d�Ffq�S�,�TFW�pҫ�?����}������������v��Wy0�b�/����~q�/�.��u�Z�x�vW�,\�{�d�1=���)6EX�Y�%4GP��U-Ɉ2 �u @�r��_C�����&hx'�rPW��CL�JH�LPa��" ��Q� ����x�"�"���L��01�s�{�"�6�<�w����S�
� 9|�E±ȡ�Q�������*ԪN��(�u6V�n�4��E�EEB�I��Xl��Ӭ����"dTX��Z�luy��4E�����G?�Tߵ9��!�P��$>2�G.� H��^��a�ݭxM��雳����F����)�"�M9M!�ע��	:\p����*�����/,�Y�*�X�:j������#Nf �&�<��H�"Ճ�}ױ��8c�q�	���%h�&�5h�q��[Gk"��Xoh�֢�3#�:���!�r��e*M��5��Яʣu�Mp��	�J,�<1H:@v��\�M��JA%ځ]'�˗ۄ'+L^�4��:���
^n�������`��~��Z�W�m���,�Zz��hg���-�1�T.�6��5�M;<h�-���(7��!�
�d���d��a/�9���u�����R���eA���Lt$�hGhC�@w�>>0���ގ�}�����Bĕz��=�����)�]��%�q�@�.�BI��Q�nʲe.ç�֪qqb[��h��7B���꼒Z9��;k%"��w�z�d��%��^� ��"ܭ��MsO�ke"�AIi�YϜo����h�N�
�co'�mX��?�$t5�3i����"�vvx��E~�A�*	�޾T�+簧~��n�j�z�"�GMe�|\�:�h�vY�`ç �4���ju��	͋�S'��Lt��J���w`�4oA����]��ֳ ��qW5�|9-����)}���I�M����3�3Nwgө �a���]���:��<��r���k�D�6��G|�(;Ē�ޑ��C)�� 1��a0��16�:c@�n_@�M�y{�M┣;�MF���2���� ��qku^`��E^�^#�rT2���P5�Љ�o�8u5�#���d�yd\��	5��Bj��� ��?�L9D�6�,E����vL�.������"�a      �      x�՝[�\Ǒ��K��`����У`��ó`a`�f�V�EZfSck�F�n5�U�u.UY��j�"�߉��q���᷻�~�闇����w?�w���%�(L������È�O�)��=�R������mNs�������J��ļ�sc�.� �w�/P��3�K��O�w/	ʛX�X�PCI$�c���1�寤!P�#D�T<���{hL{I��Br�rR`֟!2Sv�B��d% ��!T��	��1�Y��q��B�c��V����IAҞRH�$�@8z,���jebw)@;��3豵P���$�#x���_�d�l�!Ք��ewob�?*��kZ(���32dJ|�䪉��&	��
��=�w�}I����
��$�6��8D���sD9%k�	#E=;̒������7����Ī��ǖ(�(=���|�YIL�
	�!=�.�JH����3	yCB�z=���CUN��Yc	%�{�"�#�R����Ş���;�r�K>��<�8���jG���R�H���B�G����t�c�5��M�� ���A|b�)rvf<����|
�������b����[7������ �i�XD�k�R\����j
T��I����1S���\�������|GG��y������<�c6�<C��o��v�+��0��Ug큸pH	�j���#~�5�'`J��bg��a|�
�5�h��X�~���HI䯿�Jb�,dJ,s��_�k�o\�~S�a������3����g�.N]W����$?���5�F�����T~ �����|U��P����1��hN���~�}��X�� �����c1��eo ��C]�!�U��͙}'�� ��8TU������c����T�&�}%����|�p?H ��gV'WB%u�]<7t)��	�(��}e���x��M|'n��+s�~$\�Х�ӴUo�������b>{�\�_���eǋ4��8��񗆄���G���&�|Q�7d(��?afw�&7�pA��>�P�:1���.(?�GuϫT?�V����gK�[��`u�[Z�?��l��o��!�}�GݿU�ou��4$8�td�b������=�O������4$8��P�S]푇�&>u�X�Kw������|i1�;�#	5>2>��j߼��X��R��[y��1�PR�;�C���o
$D�]�>��>�/&B[���}��8@����7$8d��=*����^,�ƗCѿ�^�A��_R��_Y�|,�j<�X��xCBW�lSh�����ߣ��F���K�{4>�-���~ק��-��')Z���7$3=�ՐX ��sY�Z���>��>���Zy,\~ՌS�L~f�RƧʍ����C2_	����A�=�9G�P���|(�9%&r��:J}��o�R��L����j�����:��(����I�!��X�J�����.ߐ��ė���~�uR�������4�*-�����ׇ�>��L��6Hd?tq�i|-5�����ɏ�4�R���*d�%T���B\�Z({� 
�� �L�)�.���8$� %��j��h�Cr �b�����2�8J�$���Č~�l�H`-�W�I�5N��� ��$Vggq�,��0J�4�R�� )Ú 9 � :�C��'�J�/���h��u֠��j:{xH!ք�j��ȂQ�H�uU3;���Hk4�� CJe�N+0W?`	8$�5��\���x}S�2	B�|����+:��vK���\(�� �#h��J��p��VPDP{z���u�'.ӑ�Փ���bm��v�JB7�~_�%�_9@��-�WO��
(zP��>��5ɯ�ɪ*�^1��4�m�`�myd�c���� j	�>>|������t�Q���<1��� �����5A�����<����w��p����O?z���݇����N��W�z �����ѣH�;"�pv\��Z�݆�X̸T?gD�w�}���1;�nk���%g"ˏ�DЙ��l)+�g=*W�p�Z��_	$Ɗ�c�">��ts���r��)->.ۥ+��JM*v��z$��]�n�1���s^	:�
�k��0@QC�Z+
(@gͮ�r5[I<R Ք@^�ŖK��밊�2,]�[n"N6�1�)��ѹm�v���M�p5\�́z�w �ڏ��e?�����r������@����j�}����5�P�4��R�Y/WK�EQW��_��敶	3K��-���� ���wZdm6�L�~�9�����s;DT?R�M;����R�K`�iV)�u�Qe\��s���[�tt�mjFz��/.�W>����(�tF���m�SЛq�:�J�;	D�)���`��~����W��C�8-�<#u���m׌;L�m���@� ���i����&���f��.���Q�z�����ZZ!K�҉�Lm�M�ku�r�j����e	������6�,F+RK9S'�85������5�h�Q�(�x��D���]
8� ֘��֦����I�{��7~�1L=� �uJ	w<��!��.���}RjU��*�� �h�6i��{�wY��%I��֪DX:Gj��0��,{��*Ps�Wb��e̫]�џRj�6c��┌��m��qu(u@��j畞�,~�8�x9P8�USe$�u��Z�z��@� S�R�w�8L�O��G,����U�9E�Z����3e��KT��yy�F�6}�N,#��C��D�}A6@�=۩Tz�9_}������Z�]��&�K�d�6O/S�F-�a[�Ӝ�H~��M�P\�w��+�~5����B���)�h�򴮕Pc�ĂB��Z��3ʑ��.��|���ƝR�r�F��7� ��{�s%UI���j{G��#��,��lthV+�ܿ�j�2�i7u.�2Z�6�t3t.�[�њD�D�,�ͤ!G���
W�����*7d�@ś����v�����e���Q	�s�(Td+��B�K'Ze��0N�J'�Q�{Ae�m�iIұ5�z/h�۰x�{K�ä�\�J2��|A��zg$�t���/��a\��풯PbJ~]F����̌�ǋG�0Y��:շ�0^���_	��3���1�W/eؚ��N� �z��P�َƈ��{�`d�Q���5����8*�ƥ]X*ܙ؄q�zY(��+>0�ql3�T��n��)��V�������b	t;�� :�-�3՜/�z#MW��l�s'�'gG���{�G5��kv����F��Q�G���f:o�*2@1g��.�T��PP:���o�EE��T�⧝q��ˢ����o����C�h%��O#�0	��C�n&v�V��\�)䌝fP;��	�,R;�$��,�99W���č�,��0�TN�h6�ԓ�����"�L)���G�<S�N��s��&!�u��ؕZ+ez�&�:�W솏�)��p��g�d���)wRzH��F��;WB �/PN��̝�/�pq"��Hy������Y��9L)�P�-dA�|i����fuz>�æp�@0h+8m�v��4:�3��X!a�o��2L0��x ә�'~�%�'�ά���:�THچ&T����n�[w(q�DR-��GzL�j�s��yu���� �����H�f\�7F� �	�~' N�� �%/л����o�9A��֑G��X]I.����g�$={�c��;~��@1V�
�M!	�=�x��38A���k����9����5�$9��z�h�t�
�(us ��)����f�+V?7��s�e��I6�����G$|~,~=�	��]w��7I�� �(��:᳎��߻�iD�� �}�9�N�>��#������EF���<p�K�-�2��N�@�G�tl��;��4J�ص�!&(�9��#P�҈�1��?���ʶ�^0p�� �C!�Q�$�5����1��)L�ss7�QI6s����M�I0��1��i�(؉�q�kPS:%hy�&!�)wj,�8M� ٿ��E�-]Y��S�[�(<�(SM�1f�&E�k2kl    R�!r��)����6���N��4]`8���\�?8�� ��,�w8�ٶ�I	�jX� z �}�8Mk�+�?ˈ�h,- �U:-e�>� - �'�X�_{�@��k�u��7Ks���3+�y�u��
�]}g����nR��\�Z�HʥS�Y�V ����b�|��֑5�P�h"�G�aY3=��6�����Y2}���1Ş@G��9�ꛗ\;	�:�B�	�VE��R�����@�? ��jOi! ��L�o�#�u���'�פ8�.�@Ŝb�1���#+�'P573g�+uAG��<�����?�(nr�:�RN1��M
�JT�c����*��TF��h�z;���R���v�D%9� Zl~��a@0r�q��-�\��	��Gۨg�Q��'���^r�8F��R1SD7<������$j��蟢0Z/��4)����KŪ#DW�_A0Z/�9:Q���7��z���.wG�6��
��z���Թ�:�ӄ�SiL)�ڑ�h�T�܃)A�9��	Am���,�WLV�s�-�xńb1���B���v�PN~�op �)+�t�;�v �R�N�a��k�.IF�J�63֥4��ʐ�f\��C�&X�á�r�%����� ��mB.쐑����"���m�{�m��Ha�z�f���wo��"�����G�D:C�h���<�챮��׉v��[h������'Z/S����Ś:�6Ҡ�a��D;s��O�^,C�آ�_�I<�a
v%�?|�xȅ	v�-X��J���!�% 9P����/�@���K��}!r_�D(1 s�G�/���}�@���{?e�-^D�/� �Qқخ֝L��?�d�Fy&��01�K$4�D�Æ��fK2@�<�C��;_�P� E�rf�-�e"�-1ň��P�������8%e��2 ��D��%�/v�2 �6�MX����sٞXU�I�t��i���Tٍ����F�%Tǟ�J'��Ɔ�&�v�bU�S�ƆӞ`!���;���I��jɢ]փџ�Kil��3���C�'�[PJ�f�%�/���B
�5fw6A�~'M�FJ���z�s'�d��	���o �<ஸg@��oȠ<ஸgB���N�vpW�3��F��:��{"dHй`����3����I^�/Uf�c,���j{�N�4���(�e[_eb�$�W���A
QJ�{�W�6��$�N}s�_&B=�uQ��ȩ�Q0�lyM����.���w�����#n������D��$��!1��jÂ�i�4xHB~z ��ʢ]'��͔�ūs�m#�;���$<Ö�lC|�M��Ւ�}���?F+��7��lZ|-�����_��>�|����	�#��������~
�PMT�+{�d��>�c|Nm@-���"�R�tz	j2j��wJ0���I�r/��3�Y Q��n�B�����^��Mfx��A�+�x���UR�X�pn�����>(^a[��[Z=M	I��_��ql��6�Mb�N�ǱA�'X� dw%����v���k�v����6xu��o��n⌘��2i,����1ߐ�s����\%�rC���j���B�&�,����
��İɵǧxt��'P=)�Sf�0N�=�r�U*�F=�&�R,��Ė J�a.x/Ź�9�n'�[�����k�k�����al��	�.?���"�ج�l����!d�t{fM����Q��F��-��eN=��[��t.h�;�0�ST��5���0�S(�~���2�	�,p� �OPa�`1�v��{
K�_�3E�
�(,�mcT���FM�����������%�
i����ݯ����7���/�+������������O���?=������� z����������x���n����w�7���y �3͒z)f���L�{sS�_K^��9O�+�*��3��W�:���� �6��{���_��O~F��H)$�>>|������t�qvj��W����+���qw�r�%
�V�W�����툰*]o{N������xqN{A�������>{�������}~�Ss�:������1�e�^�OX� ��������q�ȳ��u��~���򴗺}C���C����Fr2��V"�3�/xc����l�`��Q�O���ş
��oH_��!Y(aX��"}� �ETS��I\�"�b6	V,�/{��W�/��uS�T��E�A�:cu��1�L$~n��c����E�$�ў���|S����2Ʒ?0]̹?�!���g-��ޟ\oԿ?�	R��|d��|�K].�%#ݒ}>6ߎ}>�o��V�c��g����핶ϵ�˧Ͽ����Tѐ�y��t�q�Xq�\K�?����ZW��n$θ��j������_�A=i�D+�#�P��߄�Op����k{�s�?�n.a�)�E-7�)��p�f2�8���
�����5��P�\@�9Oq��xOq.�����nra�LOq.c�Oq.�M4�̅V�<�nr��ROq.,�W"� Wq%rZ��J*����=�vc'o\�^�z D���1S�c����i\�N���5H����Zock5d�,�bJn��ͨ��2�������&�=KJ��=&���6��y�L���_��Wc���1�2b^ǈ��j�\�y��R��W�8_�x>�f[��#W�d��W:�_�"��q�d�[F.ӈ{"���˶`���]�v������s�l~0T�#���?���H�߮��a��[�[�1�'�v	<ۍ��B]p�f���y���68<ŀc�z�fq�F������x��T��pc`����	N�y�<�{r�n'��f��@��O`�ż�W�8"���o�,��eH`�x��du��Q�u^wHGO��<n�|b�P�Q3j^[�'y9���iy�-N�+�/K�Cz��!R[5�u��N�4}�m�Qe��ݯp'P�>��6�b��ty��f{��L��5��'I�*�R7!����%V�"�J6�åL�����_��p�R��25b�"l��-�e�>�}��6������@�Qk}�Rh��4�q��;NՁ����X�o)�c)u�f�5����
����D-6�A5��D��Q�� wV���/�EbQm\��ml�=�uz,4���m��z�B�Q�F�7݆|�]TN�����M&����v_�I;�ˠ>��wo䣭�e��)c�Ae�����5DJ���N�6x���f"��PE�N���j�@F��Wd#��V���4$H'XnA��]h/D�<�3�H���E�ɡ�;�&����6��g�ߍ����6��g}ݝ��MB��� \���Wnb9�E��-J�xC��#�ϸ6�2���������,?���M)���M��ؿ�G�-�n�W$`�L~�2݆r3��ڶ������ʢ��;�|�妼H�rf�f��ܦ�1����-�M(7���,e���[�I��j�ş�+y��Я����,|��w�h����V��3𽉌�
nfr^�0d&_9��W��H]�{�Sn�>�����KX��D���C8���K��d��=�3Yo'y6���w>��w>��h
���W���ͷ�[:�	����D��{K��N-z��-��x�KO���_u�mo�L�a�g�������K�g�^f�Ӧ��ʅ�+qˍTd�a����!e��M�:�{S���<�/쯅�IІ?W���1�U@��(�Z��`-n<4$za�3�Y�vs�=q,�/�O`�>Wcosu�>�E�{�!��_ɐ�2}^�f��׏X��-}��q��ַo��˿�N{�Gv��ӟ�>>���������w?뿾{���E��C��_���������?����~
����?��d��^���z�����:�9���-LZ%��_ۡה��N �􀋈&�͕��qѤ6�1�ɦ|��&Y�6�\.#�)�z�\i_�0��l�+�����t�^�P��\P#e.OU�`�)(����*]e5�Z/D���+pq!����2j�.֪�tq�7+�V3"ve��t�H�o�8"���C��C{�
   ��?cT���^$��ػ�)E�����z���n�'�|��)|��vܨ&��b"]���ȿ�������~���U8+��	�Ժ��
�/�nV�E���N2JwG-V;녞}�bs�j ѿ�����tX~T���G/'{QL�+�'e�%���MO�y���u'Ď����Q��'���-�U�W�C,+^����l�H�����+�ڥ[��f�1UP
�M6I���.H�h��j ���F��#�!��O�SG 蒛�k�6c_�(�?<~z��ϟ����ys��4_�6�3wEv�-��8=��cD�`�x���YY�.b���]9�����%�����>��=�x�D��ͬ��O\%2�o���?�i���/��JRۊ�
�OXQ_p,*���5� o��n��<;��}۵m��ċ8 _���bN[�r]!4խ���%��o�0�l������C����6hW���
1�$�!��:����|K�ⷙ%M��zޒ_�F���%��ឆ�F ;�J��~��O/�5�L�ʦ������:�׏(����ӎ�T��8�k��[1��"��賤ʞ$T�\ERi��hI�\�O=�T^wŗ��'J�>t	YR-��iT6<OA��J��D�M5��yқX-`Ц�������Ǟ8��đmp�q��pq<1gu'ݎ`�M�W�q�ە^�sѣS�s�I�*��k}�kL������I6ffՁ��������G#S�9�����$#;|���-R�1�iЃ �?Q����2�=�J����O��/�1���H30�6_��y�@	Qj$9Q/-	��S�E]�S��}�!\�S!�J�1��ц�����J�AH	zp�S��Vc���L�hѰC����_�~q��7�y~Pu8d��bIM�yǍ�g/��f4a$*�2�Ș8�2q@\^R�K�GcĒ�%ag��\I@���Z&�q&@i��VF���}��r}�ZI�f�[�ɃӪ	8�D�w��3���zƊ>C�ʏ3�'��Ø�CA.�Y=?y1A��F@8��H8&�vw�����ܔ
q�LZ�opo��TC�^�{����YG����1J��n:+�1�d��s* �J����~Xrzb��D_j��bm��@��N�/������������a��6�_O��h�V,��r�y��Z�����'������9����I��E���M��qs���
�����^8���/����y�~�7z�b�N���
��S�qO�d=�྄�\QUP,xٜ�$9{�d'B|����o�>�Ş��læTNr�r�#B�dJY�NF�^��vrJ߬� 5��J멯��m4K��5A��r�E���_4dˉ �*^�i��U�Y9����F7����J�F�$��\�[O����қ��{��7��C��*C���	T�]1�2����*�ܺ�vBN��)!�������t�f�)9�U �L �YO�n���S2�߼2����)'6�/D��r�F-I�BI��m��5��Z�(#N�z�s�N��$�u��ಗ��ƍ3��$�2n^J�WS��'���WU��)%�f�@h�\�Q!э�D�F�D6�T	� $���j���7�!*�j���j�Q~zz�)a��MO��Z'��o�B�Z����F��^vE;�/���i,���%`	ΐ����H �8����弌��s3��9x'`j=��f����r��|���U$��l�I�s�&>|�8���� UF�QN$ps<ķ��eK�7�D��l	�
���D |�2�$<����χ`�v`�������� ��	A��A�/�.Yh�#��L�Ւ�?��q�1m
�j�`�� ,أɗ�:��0���T5��:��R$�����#�C!F:|�t�6l#�ה��F~��qH���{:�l%`�:�����<�~.[.B�L;�p8V/�c}>�Pc�r�)$�_. �Rz�[N�ĤY_. Q�"����O�Q�aA"�l�܂ys>�.�����i�����������C����?�D1m     