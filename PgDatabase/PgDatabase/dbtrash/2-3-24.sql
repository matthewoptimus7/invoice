PGDMP             
            |            terion_billing    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public          postgres    false            �            1259    37880    accesscontroll    TABLE     X  CREATE TABLE public.accesscontroll (
    rno integer NOT NULL,
    distributer character varying,
    product character varying,
    invoicegenerator character varying,
    userid character varying(20) NOT NULL,
    customer character varying,
    staff character varying,
    invoicepayslip character varying,
    d_staff character varying
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
    distributer character varying,
    product character varying,
    invoicegenerator character varying,
    userid character varying(20),
    customer character varying,
    staff character varying,
    operation character varying,
    dateandtime timestamp(6) without time zone,
    invoicepayslip character varying,
    d_staff character varying
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
    username character varying,
    password character varying,
    lastupdatedby character varying,
    updatedon character varying
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
            public          postgres    false    218            �            1259    37892    credentialstrigger    TABLE     >  CREATE TABLE public.credentialstrigger (
    rno integer NOT NULL,
    userid character varying(20),
    username character varying,
    password character varying,
    lastupdatedby character varying,
    updatedon character varying,
    operation character varying,
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
            public          postgres    false    254            �            1259    37904    invoice    TABLE     6  CREATE TABLE public.invoice (
    rno integer NOT NULL,
    invoiceid character varying,
    senderid character varying(20),
    receiverid character varying(20),
    invoicedate date DEFAULT CURRENT_TIMESTAMP,
    sendernotes character varying,
    subtotal character varying,
    discount character varying,
    total character varying,
    invoicestatus character varying,
    lastupdatedby character varying,
    updatedon character varying,
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
            public          postgres    false    226            �            1259    37909    invoiceitem    TABLE     H  CREATE TABLE public.invoiceitem (
    rno integer NOT NULL,
    invoiceid character varying,
    productid character varying,
    quantity character varying,
    cost character varying,
    discountperitem character varying,
    lastupdatedby character varying,
    updatedon character varying,
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
            public          postgres    false    231            �            1259    37921    invoicetrigger    TABLE     �  CREATE TABLE public.invoicetrigger (
    rno integer NOT NULL,
    invoiceid character varying,
    senderid character varying,
    receiverid character varying,
    invoicedate date,
    sendernotes character varying,
    subtotal character varying,
    discount character varying,
    total character varying,
    invoicestatus character varying,
    lastupdatedby character varying,
    updatedon character varying,
    operation character varying,
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
    positionid character varying,
    "position" character varying,
    lastupdatedby character varying,
    updatedon character varying
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
            public          postgres    false    235            �            1259    37929    positiontrigger    TABLE       CREATE TABLE public.positiontrigger (
    rno integer NOT NULL,
    positionid character varying,
    "position" character varying,
    lastupdatedby character varying,
    updatedon character varying,
    operation character varying,
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
    previlageid character varying,
    previlage character varying,
    lastupdatedby character varying,
    updatedon character varying
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
            public          postgres    false    239            �            1259    37937    previlagetrigger    TABLE       CREATE TABLE public.previlagetrigger (
    rno integer NOT NULL,
    previlageid character varying,
    previlage character varying,
    lastupdatedby character varying,
    updatedon character varying,
    operation character varying,
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
    status character varying,
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
    stateid character varying,
    statecode character varying,
    statename character varying,
    lastupdatedby character varying,
    updatedon character varying
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
            public          postgres    false    245            �            1259    37951    statetrigger    TABLE     7  CREATE TABLE public.statetrigger (
    rno integer NOT NULL,
    stateid character varying,
    statecode character varying,
    statename character varying,
    lastupdatedby character varying,
    updatedon character varying,
    operation character varying,
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
            public          postgres    false    247            �            1259    37961    user    TABLE     �  CREATE TABLE public."user" (
    rno integer NOT NULL,
    userid character varying(20) NOT NULL,
    email character varying NOT NULL,
    phno character varying,
    aadhar character varying,
    pan character varying,
    positionid character varying,
    adminid character varying,
    updatedby character varying,
    status character varying,
    userprofile character varying,
    pstreetname character varying,
    pdistrictid character varying,
    pstateid character varying,
    ppostalcode character varying,
    cstreetname character varying,
    cdistrictid character varying,
    cstateid character varying,
    cpostalcode character varying,
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
          public          postgres    false    251            �            1259    37969    usertrigger    TABLE       CREATE TABLE public.usertrigger (
    rno integer NOT NULL,
    userid character varying(20),
    email character varying,
    phno character varying,
    aadhar character varying,
    pan character varying,
    positionid character varying,
    adminid character varying,
    updatedon character varying,
    updatedby character varying,
    status character varying,
    userprofile character varying,
    pstreetname character varying,
    pdistrictid character varying,
    pstateid character varying,
    ppostalcode character varying,
    cstreetname character varying,
    cdistrictid character varying,
    cstateid character varying,
    cpostalcode character varying,
    operation character varying,
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
            public          postgres    false    252            �           2604    38095    invoice invoiceid    DEFAULT     �   ALTER TABLE ONLY public.invoice ALTER COLUMN invoiceid SET DEFAULT ('INVOICE'::text || nextval('public.invoice_id_seq'::regclass));
 @   ALTER TABLE public.invoice ALTER COLUMN invoiceid DROP DEFAULT;
       public          postgres    false    227    226            �           2604    38121    user userid    DEFAULT     |   ALTER TABLE ONLY public."user" ALTER COLUMN userid SET DEFAULT ('U'::text || nextval('public.user_user_id_seq'::regclass));
 <   ALTER TABLE public."user" ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    251    249            �          0    37880    accesscontroll 
   TABLE DATA           �   COPY public.accesscontroll (rno, distributer, product, invoicegenerator, userid, customer, staff, invoicepayslip, d_staff) FROM stdin;
    public          postgres    false    214   �       �          0    37884    accesscontroltrigger 
   TABLE DATA           �   COPY public.accesscontroltrigger (rno, distributer, product, invoicegenerator, userid, customer, staff, operation, dateandtime, invoicepayslip, d_staff) FROM stdin;
    public          postgres    false    216   ��       �          0    37888    credentials 
   TABLE DATA           `   COPY public.credentials (rno, userid, username, password, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    218   4�       �          0    37892    credentialstrigger 
   TABLE DATA              COPY public.credentialstrigger (rno, userid, username, password, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    220   P�       �          0    37896    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   U�       �          0    37900    districttrigger 
   TABLE DATA           w   COPY public.districttrigger (rno, stateid, districtid, districtcode, districtname, operation, dateandtime) FROM stdin;
    public          postgres    false    224   i�       �          0    38062    feedback 
   TABLE DATA           9   COPY public.feedback (rno, userid, feedback) FROM stdin;
    public          postgres    false    254   ��       �          0    37904    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, senderstatus, date, reciverstatus, transactionid) FROM stdin;
    public          postgres    false    226   ��       �          0    37909    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, updatedon, hsncode) FROM stdin;
    public          postgres    false    229   ��       �          0    37915    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    231   V�       �          0    37921    invoicetrigger 
   TABLE DATA           �   COPY public.invoicetrigger (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    233   ��       �          0    37925    position 
   TABLE DATA           [   COPY public."position" (rno, positionid, "position", lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    235   %      �          0    37929    positiontrigger 
   TABLE DATA           x   COPY public.positiontrigger (rno, positionid, "position", lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    237   �      �          0    37933 	   previlage 
   TABLE DATA           Z   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    239   �      �          0    37937    previlagetrigger 
   TABLE DATA           y   COPY public.previlagetrigger (rno, previlageid, previlage, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    241         �          0    37941    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, "Lastupdatedby", updatedon, productname, belongsto, status, batchno, cgst, sgst) FROM stdin;
    public          postgres    false    243   )      �          0    37947    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    245         �          0    37951    statetrigger 
   TABLE DATA           |   COPY public.statetrigger (rno, stateid, statecode, statename, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    247   �      �          0    37961    user 
   TABLE DATA           I  COPY public."user" (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon, organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    249   �      �          0    37969    usertrigger 
   TABLE DATA           e  COPY public.usertrigger (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, dateandtime, organizationname, gstno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    252   �      �           0    0    accesscontroll_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 83, true);
          public          postgres    false    215            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 203, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.credentials_rno_seq', 96, true);
          public          postgres    false    219            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 153, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    districttrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.districttrigger_rno_seq', 1, false);
          public          postgres    false    225            �           0    0    feedback_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.feedback_rno_seq', 5, true);
          public          postgres    false    255            �           0    0    invoice_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_id_seq', 1249, true);
          public          postgres    false    227            �           0    0    invoice_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_rno_seq', 280, true);
          public          postgres    false    228            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 274, true);
          public          postgres    false    230            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    232            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 431, true);
          public          postgres    false    234            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 5, true);
          public          postgres    false    236            �           0    0    positiontrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.positiontrigger_rno_seq', 2, true);
          public          postgres    false    238            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    240            �           0    0    previlagetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.previlagetrigger_rno_seq', 1, false);
          public          postgres    false    242            �           0    0    products_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.products_rno_seq', 114, true);
          public          postgres    false    244            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    246            �           0    0    statetrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.statetrigger_rno_seq', 1, false);
          public          postgres    false    248            �           0    0    user_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.user_rno_seq', 194, true);
          public          postgres    false    250            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    251            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 803, true);
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
       public            postgres    false    224            �           2606    38137    user email_already_exsist 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT email_already_exsist UNIQUE (email);
 E   ALTER TABLE ONLY public."user" DROP CONSTRAINT email_already_exsist;
       public            postgres    false    249            �           2606    38099 .   credentials email_already_exsist_in_user_table 
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
       public            postgres    false    243            �           2606    38139    user set_unique_email 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT set_unique_email UNIQUE (email);
 A   ALTER TABLE ONLY public."user" DROP CONSTRAINT set_unique_email;
       public            postgres    false    249            �           2606    38123    user set_unique_userid 
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
       public            postgres    false    249                       2606    38125    user userid_already_exsist 
   CONSTRAINT     Y   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT userid_already_exsist UNIQUE (userid);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT userid_already_exsist;
       public            postgres    false    249            �           2606    38088 /   credentials userid_already_exsist_in_user_table 
   CONSTRAINT     l   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT userid_already_exsist_in_user_table UNIQUE (userid);
 Y   ALTER TABLE ONLY public.credentials DROP CONSTRAINT userid_already_exsist_in_user_table;
       public            postgres    false    218                       2606    38025    usertrigger usertrigger_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usertrigger
    ADD CONSTRAINT usertrigger_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.usertrigger DROP CONSTRAINT usertrigger_pkey;
       public            postgres    false    252                       2620    38026 (   accesscontroll accesscontrolltriggername    TRIGGER     �   CREATE TRIGGER accesscontrolltriggername AFTER INSERT OR DELETE OR UPDATE ON public.accesscontroll FOR EACH ROW EXECUTE FUNCTION public.accesscontrolllog();
 A   DROP TRIGGER accesscontrolltriggername ON public.accesscontroll;
       public          postgres    false    214    274                       2620    38027 "   credentials credentialstriggername    TRIGGER     �   CREATE TRIGGER credentialstriggername AFTER INSERT OR DELETE OR UPDATE ON public.credentials FOR EACH ROW EXECUTE FUNCTION public.credentialslog();
 ;   DROP TRIGGER credentialstriggername ON public.credentials;
       public          postgres    false    256    218                       2620    38028    district districttriggername    TRIGGER     �   CREATE TRIGGER districttriggername AFTER INSERT OR DELETE OR UPDATE ON public.district FOR EACH ROW EXECUTE FUNCTION public.districtlog();
 5   DROP TRIGGER districttriggername ON public.district;
       public          postgres    false    222    269                       2620    38029    invoice invoicetriggername    TRIGGER     �   CREATE TRIGGER invoicetriggername AFTER INSERT OR DELETE OR UPDATE ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.invoicelog();
 3   DROP TRIGGER invoicetriggername ON public.invoice;
       public          postgres    false    226    270                       2620    38030    position positiontriggername    TRIGGER     �   CREATE TRIGGER positiontriggername AFTER INSERT OR DELETE OR UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.positionlog();
 7   DROP TRIGGER positiontriggername ON public."position";
       public          postgres    false    235    271            	           2620    38031    previlage previlagetriggername    TRIGGER     �   CREATE TRIGGER previlagetriggername AFTER INSERT OR DELETE OR UPDATE ON public.previlage FOR EACH ROW EXECUTE FUNCTION public.previlagelog();
 7   DROP TRIGGER previlagetriggername ON public.previlage;
       public          postgres    false    239    272            
           2620    38032    state statetriggername    TRIGGER     �   CREATE TRIGGER statetriggername AFTER INSERT OR DELETE OR UPDATE ON public.state FOR EACH ROW EXECUTE FUNCTION public.statelog();
 /   DROP TRIGGER statetriggername ON public.state;
       public          postgres    false    245    273                       2620    38033    user usertriggername    TRIGGER     �   CREATE TRIGGER usertriggername AFTER INSERT OR DELETE OR UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.userlog();
 /   DROP TRIGGER usertriggername ON public."user";
       public          postgres    false    257    249            �   �  x�m�9n$1E��a.���@Ǔ&s溁�X���_�A7����R���㇎�?��X�c��32��yv���-�"/�3������y��<�"��Q�~.GQ���Ȑg������y�c�	"cJ)�6F�k�\��x]���n�O:^�Vun���8�I��=({)���f#=��KZ�_bjt�A-��7�}#�#�7(5Ou*ô3ץ��c�q����~B��K��ϰL��M�F	�������q�'��筵O,U.Wk}�Zk*k������&�[�Ut�!��Ybr깱U��K8J����g�kL^(�B�5��f�����ї��~�a1O
^�sp�A$xG�(��:KI*�s9ԭ��!�E���KpÎ��A[��V�o,�e�}���<��9�Ƽ)�Mkh8�Jm=^AJ��7�Ewh������ct�C����>Z���R�T�      �   ;  x���ˎ�Eץ���#�Ak7�ֳ1���1���0�����d1���	�B�4_�7L��M��gt������?������%�G(�hwN笢�C����_������'R�.iS�h��r$�zHM�,50VLn�Jn����ߎR��|�8E�>�֟����pLuz;���W��X#����]�mK��L?�5���-K��O��� �j<����U�8
����4vR �V�P�N҃\�q'c��n�y�?�7���x���)2������L�v(��<�4�m5�h���9��BU,s���*�v�?}����Ɉ���q''��rL������3�g=�4�Ʋ��hc��A�9�|��)�ʡ��34��h��t�4���E����bU�v�@),7	&�Qp���tTڨ߫�,Fe�jH��d6�ǉ\^�F�;�&��;����L�c���H.�g�P�*w�B�j��`%�!�c_�)��d�up�[Ǝ�4�̃=���^b�u쌄Kc��yp�ݣ�7��n8�~���b�+��ύs,�mD~"i5�_'ߗ��o���>�[2��;�J�v4O�xB�	�ΚRR��p8wU��s��"B���H���_d}Fjب�jic�5��κ�D�����AXy�x$Ƕ=�z��0�;�%����8��gP��Z9E�_D~�g$N2(헾.����������X��l��%+l�nO���H�+#�lbQ86R'�ސ������ɚ|��􁓄�;��\��d�HyC"J
�	��iߐ�ɈӔ>fi�_�����QR�M���L�h%.�[Q�y�?��,W�I����rb���/����\O!�zvNʗ���_k\1�.��x�d�6d�j�TT/�Xg�\252]$=. ��l�E�^��F�϶k��3��\�Ɉu� ;�Ȱ��J
ݩl��o'S��S�lc�y9)���:ȕj���E<F[�O����/HdK�ن-A��ԗd"�%��>���,]�)��ϳ�$���1-향ه��T*��q.�MRz!�c�$����Ji��5ҽ�,k���d/{� �^3ʭذ�T&0�m-���b�i����֒'�H�4�6e�j�܅H�h�B;������c�㑰'�� Nm��gG묨��^����6ϡ�«�"k����$��I�U�	Y�
�ڂ;Ɲ�c�"�2��R��}��X������ن�R�M
��.BRG5�����f'�����%���d�N,�&yS\� �-���Tz�7z!�Ű���RI�j|���"����eo���{Y��꧞hZ�Hf�+�P��`z�4���t�r�P<a�(��dll� ����U<�*�lHސ�����xde"�=ed�=z�.�7$"v�a�r����%�WE`�"��|E�1��*Qu�D1�wtv";#��$��#��f��5����dRn**i��|[Yn%%�R�B��oH�)�%�e���$l$�-e�ѩt�&���=�Bt4��6,�2�P:J��(jM�4h�>	i�E;[�1��SU
%��sg̓�"��1��G�l�⇃-�@�RG��e0"%R�ho)>:W�/�*LyaD���z2a{&��Q����}�\��wVk�6�$�O���Nj�M���B������r{���Ű%'��B$����cJ�FA�ֳ�x�U�SrG_+�5)ޕ�LBc�t�e���Q�=�m��O#ѭ�6���:*y��}X�K�;[���PJH�"�Q9\�ag�u�Jm\w�k�r� �\Jop�e�HR��E���z�XjO��{���b�0)�M�a��FyA��`Ï9]��yBQ��*�%
_D�D�ɩ˘/

yS5��u,���<���Xh�B�E4�0J�����jD����E=��nH���#��#yJ�;,qB��mG�T���Q}Aף��b��i�tE�K*C��/��=!�c�s���TC���Z�r������q��:`Y˻0]AR��K�t�����̫�L��ege#y�:�M�Wv9.X��Y,��bݢ�UY��V'6ʬc܃9-zY��C��{<�Ώ�hG'l}T�n���PGv�y^�2/�ڷR q46)�]QCՓE�:.O,�m>e��
Öh#Vj�8��"AU�t_�j�E_kg��ҏ�=i�!��oX�<`����H)��ac}�tmt����E )��^��Ϊ��s�`k��S����9/oQc���-�2�tnX�2���k 0�yl��n�SEf韛a���i����>K��WX�1��Φ9���~�"QE)�z3�Ҭ*^^|5�6�7q�?�Q⋬G/��ȅl�r��� ��i��U�S��K�1�~��;�F�"���4]�/X�!Fw�/{^��)�d!7}�[Q�O�b�:�_z�iI�{J�c�0J���u�Vt	9�Xk���2�3��&�Q!Y��CRg���?��wX(ϝ�e�mG[�n!c��#���2ghL[1.��r��m|޳&iWb��H��nOߕ����1����F����M[FJ_,��]M��]�VN:-���k6�!�1�����ߙtV�'���7�*����,�����g&3�LR[;5Pv��~�,�,�79ZNL�ߘ���q�Fބ�0ti�W�9�3���E������"�������yy������I
�_ʑ�S3�R�vP�2����ՠMEƻ :�L4v6��q��g����yc���������W�zM��cΣ�����Ù$t�8�Ϳ`������8��?�[Y�z��q���7��h�=��_��dq�k���q��Dm��2��c�R�!�<)��G�N��s2�q�N�*aG�35�+����_e�F��l���\��<��^O!����۷o��4�=%      �     x���Mk1���,�cƷ��\Jo��L�t����__[�Z�E��"��[z%�䈃�˶��_��~�{����yzl�S��a���9���{�n�����?��K��s�����~D�=�o�\Q�x� ƌ��E���>��ٵ��.Bl�*ca�2B������$I$�D�`!�N�[x �"RO��v�Kl�5	��X�@�7Ս�}l1�$�^�2�#0°#p$���Y�kVQ$��E$�	ՋI�4do��������\!����(M���Ro��1o)H��ՙZ�`M�k�!usƴ6����,�o�Sd��"����L���%cu&������83��n��Hڽ�Kd�ՙ�J�ԙ��qC7��z���l�&���
����1i׵s@&|Vg2ڍ��d %{u&���3$¬�b���ˑ����;~�K�^7�F�����;�G�����9@�<hB�J�:k���h]���fj
\p_�;e�u�����-�n��2|k���a+ٝ�@���<ݝN�_D�\�      �   �  x����n\7��ͧ���u�W�����.�m�Ċ9L�>)c,w�Pj�9�,~]$���txșo�����������{�������g�7���v��Q�m��{��ό>}���׏OG���V�ukI_����e�ZM,�K?���uS�^j*/�l+G)�Qɭ����������2!}9��hB�
lb�XSsV��l ��ܶb\S?�|�iup9��nUJ%K�}���~���鿷������1W,��f��Dt���᰻e��Ҷ^�T�#�c���(��;����X'�c�M�PA}�x,��%��I�$��a��Mc7m��%��/4L|�^�H�H�6���1��F0�
A�A6�Z|��5j�@�H�f��Z��F�2��H�g��3~��X�F���,�P�ŀ�@G�e����Z������v���G���b��j���a鶔�N��t0��<?��b^�g�#�h뒭J�v�5�@2���0��� ky�Yٜ@� ސ �۞$�w�}c���[��$:�; fa���L�sKwQH�0��@�!s�֐�Eb� ��Ή�G�MJ�o��b�0��~��I��U�.�=�����H��)IYr�3�l�,��H����va7��z:�	�kO*�_N���ʮhxY����8����{�X$h=澑��gd�_<��s�����5�cK:F��\d��q��?�1���:§o(wM1�k���(�����K�������@�
R�g��:���E�HIF���%�W�d0"��n��/0��$P�I����@���s�]�<�J�0G�1���)2.��٫�AB�X�۶d�*sB�"74�$��2G��5c��k�
�N�X`DW���bE����S*�c��!m�I2ک��\1'nǬ(�=KOe���\d��A}�%Y�{S
z[l�5�h(�^0g�!� ��, ��,�kK�#� �QJ�у�"q���|d����>p�e�F!��=y�k��	�O��	XS�{��I��|]���%A��y�Z/�h���[�,	�뢻h�T�;�2��V�j�5U�5n�;�D��,Ğt���v<zB��ǻm4��ڕ&J��f��Z~���%�U_�z���:1J~��'���մL�����&���ZS�?��8`���Pj�z�� �� ߐ�_g"�b����h��$��P���*�y�<�RK?�^�se�&kCo�[�
z�D�7���X�#���`�J��uC4Ym�� �'�o��>u+�ƞ��}���@kHs�\Kj����2�Р!M4�.�~)�?�0g�!_�����{nc~�d�2S+�[����`���!�s�ԇ�~_J�Ɖ��N�蒺����Z������	���N�N��N+��S;2H�#�|�P�\r��Z�X����/�����cF�������#��˟G���&+�R�c1h�)��!�PM��;G�O�$䲲�Z�j7�zW�
�]�T�5�<}fzоZL�J�:�*�Opn�L�+������!z��5a�a4�*���\Z����k;KDqw�"X!(�� ����|�50UB�:�^���$.;�I�(h�T�f���z�T�*�mp�~9u��u����048�K�4j%^'&䑹�2�Ŵi%b�Q�`:�J�B�,�y��1pE����*��f��uLw�ִau�;�Ө��:0�^Ps�Z}���4j���яl;\�}R/����S��s���9��U-�c}�������93��q�xg����ǐ���q_op�����_�[y�y��&z��+�sM?�UX����m�*��W�v�}џ�V����Z�̯z62*�X�>��#�9��)"қ�=�zAq�d��Yܟ��=�P��C����!p	 O�n�n���)\��
�/T��n���=�VL^��H[ީyJy�x��MV�Zg����%������O��w�������ג"�~�Y���v �:[!�+��]�Թ��'z1jD�r7������������n*fRf�5����X^�g񅚖�p�wq+��߳Ak�JJ�����	�#���v7���|�2k�u�
�5jqk�c�ufڙ�VD��?�%77�t�6_k4<���瞮����0�̑�f��|-b�5.�0h.vt�[4U�<jP4�L�]Mj����m�_Wg����[�E� �N�Ws�U��r���h8�hC�TOJF�6�~�k.���ZQ*�x��n}x�+�7�h���A& �<e4B��mK)�l("      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �      x������ � �      �   J   x�3��H��N100�2��H��ɇ�9�Ss��sS�|ΐԢ��<��Ԕ���l����\NC#c.S�R1z\\\ ��>      �     x���Mo7�ϻ�g�I����hz�%=�)��.ZM�����kϼ��f,���/����D�����~���/L�X����D�H�ڟ_>?4�yd�E�ҳ�OMD����,�Ӓ "�,�������W�:���w��P�tx�4�ה�^�����If��,$K �ҩ^Xu��#��E�E.��Լ��%�L�j_:� Ac�B�X�~�����������?�?�}}n�^�xN�&���r
r�}rK�[.rr� q,�̃�&6/T��7k��,�1C4cS�G�n8k#� Y�Y�iWܸ��g-~�X�?��|����gR�1>�s!j��8->��>�!�kG�\����W��>�?[�tb��NK�X�Y�zj�c�͚��5!��$/��t�=u�׬q�^X:�0�,�<@i�W�Ok���.�P��0��)�jy/߿?<��G�/�ԗlzج"�7.�ڕ��P^�uU]�m�=�v��T\�<A֞�ªRnH1���wl���k�u��d9Nk�J�p��AX�!XRu��z!���	�]>,ť}�8���*sk��*�Zdu-Z���V���l�ۭ�JLV%F���鲛^�r�:Ӿk�bd�^��zO��,�Z0{�fW�&��Z�~r�t�uz�ل{M�f�W� n6��.D�I�v) �M"�KFlb�Y*����a�����fKܾ b��)�ٲK�{K5�ܲL��A.�r떵��ل�"`zˬV�2�A{�>�`�\�k���٧5�(i(��m�2������ ���Y_:���-[|������!�����j�+@�V=@#��t��z�Ft�B*�Ft�)@G���|D�c}>���|�#:�Q����G>��H|T�or�o���%���z��4�_!�o��W��������m�z�����e8BP�rpЃ����Կ<^����<·���>�|���'|>�(|0�Qz��h��o�zҎ"�Q�`��8��@Gq�n�������8��c.t���0P��@̖���E��:�{�Ys��Z�=��"R����TD`����pu@F\��m\oAdڼ��	�9 ��i�6������Z�,�ZL���9��0&�6o�zp�/����;�W��|�=��p�/����;��x��۸��|(��|�lB؁�(;��q�#����� ^M�7�@�[��Y��z!Ǯ  ����8��ï�� ���֓,+;��_ D��N= DL@@�v�o>DL:��x�!��c���?޽��݆:���{��8��=v���0BUZ�Wf=�#�p��8�	�xu��-����Ep�F�LB@0�t��5	�G|����3M Q�}�\��#|أ�=rֱZ�;n4ˋ-o�ɢְ���� ����r���z��r���'OMV��Ӻ�ׂ/~�!����a�$́E��;��3,���d�f����x<�O�c      �   U  x���;��Hm�]���꯽!C��[K�?�V���$XoC��Č����G_��_������,~��G9�����U%U@5I�Q��)K�
j�:�L�b���&�L�	��<���ngB�7֞n�)��.)��!)8�����iI
���|yQT�/7I!�/��:|��k���L�����^��;+�P��}�;�� bb+% �j�@c#�����G	 ��� .c% L�J �l�������Ą��~	 ��� *c�% T�L�ʖ��P�2�*[�rBe��ʞz�ʞyX0�3&{�a�d�<,�왇�=�`rd�Z092&G�&����;�c(���:f�x�Y9�����ȷ^�R������Y5۳iΧT�Gm}�+}ȏ�k�@��@!b<G7O9L"�����&(#{?w����"�)��?J���~M}��+���/�-�6E��������|����� ����8i���4�ҫU �����?.����kvp�m �Gh�y^-���_I�_'���b>��������c�a��A��1�` ���Er�c<�����Hv��G����q^�k�t7���6�`(`;�9��7}�4(_��h�?p���d ڄDT�М�����9��Û>W�g���<��u�٫`�ٛ`���,P�vps�}
�}	��ӳ���Ն����(����@���+vخbwtخbw������w���a�I�y�����$�MzG1�IV�7��7�̷*)�oMRpߤ{�ƝjE�}��Q w��]�G���V�w��rg[Qpߥ{�˝nE�}���3w��]�G���~��i�8(���!ݣ{�t+
�t��ӭ(��=��N���~H�h�;݊��!ݣ��t+
�ro��;݊��yw?��w���I������4{�z��#N�(f0��u�\Q��T30�՝rEaS���Vw��,9�ԝrEaK��PQw����>���9o�(FX����%_����:�N��0�%g�Һ��[�3@i�iWT%g�ںS�(%�޺S��J�Ge�)W� %ݣ��+
�t��jE�Ga�"ݣ�Z��QX�H���;݊��"ݣ��t+
�t��jE�Gw����N��ʕz����w�Z	�my�v�����c���d�>2v��C�5���^�.�z9 Zs9 TZs9 �Zs)��\n[s���\�G���.��m���A�������-��7ʎ�����u���Q�q�2��:��4�z���K�5�[{��r<���ގ���藻��G}O)h���q�</��w
��j��V���yY���d�7�[�������?CY�`      �      x�3��CA��F�Fh\1z\\\ �	�      �      x��]ˮ�q\�����jT>�uV6,/f#/x����H#�3��;�Ε��S��%�+���������ΟD�����??������'M�I�T?�����Է�a��"���[���� '?��-y�uk�����ރ�G�/ʖ�l��b�8��}��[Λ��J졕�i@r}EZ��W�fe]d��� c��ԭ�&~ f�3��()�&��j ��Ku�r��s�MU�R��&�����޵ ����H�0M7͛�˫�l{贈��~�/l�%�o�G�ԇt�'{�6u�H_�u�ޔqG���}��N�{K�7-G`���	�X�琢;p��� �i^l3��S?�<�]�\j]�i��৺lv�u�7�߀rCH-��z_p.��	Ρ6�ɀ��L*B��ˆ&N�{R1߬_�ч��=k���:7�8���KD6?�@���7����ћ����)�K����C��݂�X=y��,�-�}����ˏ�a��������������/>�B?�����R�
�%�Ɋc�&#�	����������&o��hѸ��nY�bO���++]�[�}c�.��O/�W�����ؐ �x�'�������ֿ�o?����>c:���^ږ�퇼�%χ�8�*���l��|��}�K�����R$;"����<��g��9׭D�k�~	�¶K�_o�~yJ���K����҆�?�]e��L����E�m�o=�}��&[^�d�������>��
�§r��X����W�����,&(nT��An�-v�)~�b���A3J�$�歆���X.x�#<9���H�g��-έgHz���8�#,���)]��񄇨{�j��[�:rZ�QZ{RY[dkco@��*�
L��UnC��H+يn-�]�@���®ǰ+��;�w��B������r?���mE�Z
ژ�^�mh�5������_�z������v�rrײW�Z�mhy�U�o=�����$#�biny���MnC#��1�+"Vnm� �c�&^��C�2�]�&��փ[�M�F#�8�l����nhC��Mk�zpkko�����	&���I�c�=��,͑��#-s(��k�̵-¶�%��}v�m���9�����55`���s���Q)�^:��w�̻Oa{b���C��~[�9T�&;�eH6�')��q��#%��@K���vy���IP� ;��g�<�ݸni�&���Y�9�=�I����./}��S�9�]��V$�2��eF�c����.%�2��%�Un�����Y�e��K`���=�H�e��Kt���6�?���|���M�W�"|�^�Yx��O6A�*x�o�2����v�^�ۼ�);z�^؁��6/Q�r���x���s���o����M�.c��w/'܈�������
k�F{k��rӿ�9ͦ�eDYnt�.7�{`�]��D�y�]n�w�(�9Ͳub�.7�{`�O@Dp`�.7�{`��֭Vv��rӿ�o�;�5���v��w��=��^X,�w��ߝy�`մ�����ۄ��d����]𩂨�'@Xo; ���E�Z�,8`��(�ݟ��di��m��t �,�<8`��>v��D5Û�P�������sA�� ����M�CɁ X�hH<8w��ܕ���q�>�!x����rJ {S��\w`N�ɜ���^s��w��f�_m^(��g�Y�{�c��8��6�=�8��6�=𔸙|j�{;Ng�~�`��������S��#؁���G��\��(�v,������3��#�qwfJ{;��Όi`�}�Ss�#�q�|fP{;Η�w����]/O�S�`�ܙ��v���^�`�ܙ��v�����`�ܙ�� vT.������3���8?�U����3]��8?�U��#�ż��S��#�q���Qlpj�z;���2�N�S�`���b^F���q��8_��G�y��ƩG���p�G�ĩq��8:\��qt�ؿ�J��8�v��q��8�_��Q(qj�z;�<�w�<5N=�}u�z��D��Չ����ؚ�NT�`_����<5Q=���k�[����D�v�֮�F�G�5w����_Mk��y��һ ;���;米�V���l���Yl����J����O�����9e/KW�4J<���Һy�[�*<4�������.�J4�64&�*�����܌�{�db���O�����/�O�»����):0�W"�3��m+U%��9Q���eS���v��i�@��nB�<�:�[t���=��Ўp˪��u!5���+͍2'9\P��H��Q���a�̍{$u0G���Н�!ёY��D��
h�;zu��(�m�(��L�+��ѵ�D[�e�Ϧ�H\�wѨ��<j�[�DB�l�ۿ�a۫��~[�j
8�����WB���מ+�/jFnШz3�&!��4�9���</ �P��aӫ����={��sm	�5�]V��� ��?��yr����\�����=�}/{�\�F)WS����.�2�kTӬ �"�f,������'�o����2/�"�xA�C���qN.���!�﹣��*��V��<�P��Wk�����v��e�q�>��l�7��˘�d}����
y��2�N����o�u�7|�7�{�V*&hv(̟��������K7� .ޅU����-�g����J���Zp�Q;wf� ڹ�,9M��9��U��-1#�Tt&��.��Ќ{��X%����b���ϲ�9����hy}�ㅧ��T&�v|��£<�ka7�}-��X�c��3��� 74M�|d5fQ�͈A�<���_/�:����f���j]�#�u��T�fyZ� �7�#�)�s��o���#S�d�R��f߃?o �q<�Zf�.�*�;���g�o�+ݦ�jp�yh��A�#�n��'~�3'�OĘ ����as�R��:���ZG�W���2;ڋWry�f��:���,��z�٠�$8:j饢/
��Y���_`��ɝ��!�ዼ�Q�,<���[�q�\�x�2gHڳ�N~V]��D)��N������Q�WK����_���z$#���)sͫ��}��a�r�߃���H��G җE�Ɠ 2���� �<���	�����Xx�y�Ğ,|`�8���u����<��xs���}�!�8/i;ROW�� �8	>]97ʞ{�N����(s���*��謆>i��94ϼ�3�=N��W���b�8�	r�%��,�[����S~l�j�'���#��1�鑠�"4��j��3�R�ܮ�W>5����ܜ$�=���V��U�̱�4j
4D ϫ�3�E���#C�������f�I푡�$w"������̭�������W�ύ�^�� ����q孽 ���K3�͂�ClZ;'�� b.jA�!6�D������+���YB�hA������;W��rx`�M��	p[�}G=��-�?Ħ�?n�yi	 �Cm��s���+���1n���^x� *��ˍ� Dl��s��Ӝb^���3�j�!|<��4�����h1i8�3���o�]�b|Ё�ai�£�߿�I��;W��(K|������Y �Q������u�~�y�bϝ+<�|�06�<��k��b����k��C��(�'�u<�R5��>���m��x�	U>t'�}���E5�=t��i��!CB�3R*06�
�q�R��{ȃ�D�+�B�f�^�0,>(P$�"�!��{Qj����e�+��o��`�8�(�_q������sT�H��Y7 ��8A�"�>e}�ڞs���ye�Q����q���ye��u�BG�@ٲ�����<nֵ O���e�6�>�� Q����yLe�p�(S)�)����xG)�@�r���I<��C*b}������E�n朵�����>g3+Kn�;mH[���]�o��
3�6HV��'mf� �X�j\} myEZ��]^���DE�a����z��c����	�� �  h]�^9�E�T�+U�X7SS���ՊT[���G�E���+(������	��+(�#Sy��x�+ue9���I�qe�
�r���~[W0���m�o�����~���G�}�=�qe�
�Rތ`�ε��ζ�5���o*Y�꣔��ʳ����	U�ɨdi/�XKȟߞ�=`�	��qvTQ��VPևf�{�Y6�Y�
�>�	H��������>�n��2�(��ƙu=b=EI̲Q��Vp�/���Z�(ii+8˻���.M�jg�
��8�y���������۾6*c|�������V��&����1�����"N�����2c��pQ��r�Ps�$�Q��_����&�:$�[�}ޖ�-b��)TT����-�����{F2��~��e��)�:$\K�#��;W�45xT4<%{~Cّz:�a���e�;+�7d*2���l��Sw'u4���w�s���RG��d;����
_l�h��k:�	k�($v4������R��ɂdG�
΢�Q���tڦ���>5��We�	�M+(�y�	�6M(++(�u|	�@XYAX{~���L=\\������*���+��Iea-��cb���
�Z�5X>ȚTV�_t@&�-'@|�|u�d��Q9\>(�TV��u���T�6�� ���_
�|P7�� ,�2���C�M�+�c�\��nA������.�P���3���8A��㻓I�^���e������Ed*'��*�#1���D%"Vo���Y���pf_`j��I���*<��{��
��kA�AI5�ת�O�Λ�-�s�0ȝT�S����;�8�>�V�����e��&�����A�:��I�?U�{R��@Y�R�$�>售�o506(��:M�H���͓�}�r���?�cb@��i�=��Ɨ�9#�<�A��6M�g�u���z�4у�Im�e���Ӈ�F����ߏ���
��W�����o#n@Jz��M��с}��e|�qc���6�k�G+���:�;�zGq�A�6%m���LŇ���x������@Z�����?8ͪ6��q*\��w�@�O�lDgh��r��c�ЃJ�
�����|���%�:)�z'l%��Ӏ�/z�-�R@�@��%K�\|���T�_���x��	�J��	��Lfy�ʼ]���	
(����,z��(�A�\F�ڝI�����%�bt�<0�/��3��I˨�����z��>_���6��T�]�b�J}{)��!��L��_d@Qr���KI`k?����~�[��褶���̋��;�Z�'˴M��L�{�����<�fc��:�t�l��� ���oH"�i��}|a�;^*�#ag��Ӗ�Ě;��疮��_���b�S&��u�%�`��}۶�h��3      �   R   x�3�4��M��LKL.)-J��".#N#Δ�⒢̤Ғ�"��1�1griqI~n*LȄӄ��$1-�7�4�L�G����� ���      �   X   x�u��	�0��ni !o�u�����������(Ҙ{����u��$^������TM���%:��#� ���rE
��c��2�      �      x������ � �      �      x������ � �      �   �   x�}�A� E��)<��a(��p��Ijm����vcm����)�[�����C�a�������"d��Y�����`@c�C�����܎�k�B#�Tb�+��Eb��4���?'o�򘈾q��:-mU��	�P�t�����}**h�Sʍg�'��MR[`��y�P���,�}��%�v^�ӵi�J��x      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �      x������ � �      �   �  x��Zmoۺ���
��
<|�>]���:`يt0��M�Ǝk�-�_�!�XvE[v�lSS�N$���9���u�9���i��7S�q\X!$xH<��~sr�k��OW,��ZL��jѰ�մ�]U���7�t�ӏ�B���F���%������I�9g�,�>]] 7l�q<v�8�-�f�j��5�'��Y>����aVݏn��|Վ�x֢j�z�J*4�+�,�/�7��mU͖լ�a��w�qGj�����n�7���g�M�\4�Wˇ{�8���l[	2*�ű_	tcm��9���T_�Vm5]Ջj��~�OI�w#�%W���\Yy�6�������l���}%���(0����VT��_n�B�hpF� ;��W(��v{T��-��g���{���/t_�;�����'�#��Х6���	x�ܿ:E�$�g��������On/@�ZZ���QG�1F+ď?x��v�H�ZP#P��h�B� &����%�x\�ۄ�Uw�����Q�a��M~�-�i���V��q���/|���j�+ˮW:˕��O&�B�$=�|#�0��x��\��5,��Ǖ����A�즳��>e�a�����]寺0��Py��/U6� }���F�ܪS�� (�.�P��Գ�e1�t���](�R�t�-���n�J�[M�a8.e�(*S�Ϡ.̓?�IӀ�z(���l)�T�@�MT�u��"�Yէ�����~�G�M8,݅�K�W/�|"��8�F{��_�t�����\�-4�|X�Բ+��I{��ZT���Sy$�W���vv��z�a��I��b��g7�0����XH��k]�d M��-Af���}R5�~�3Ү�T̀"Mg��	6r%�B*��{m�z���߾��}�}+l���xC`
P�{aK�
a�עh	Z\p���*�[b��C��$��BR�	.�S������?�PrSJ^x��܋d,���óbu��<�N�(����QG�6Mg+���� ��/�*-��t���H�Rb���b2��VqM���I�J�V��ά���O�WV���,-|�l�9b��oK�/������S�RJ�����{� �d��I��XV]���B:�s;<۶���bI�q|��r�=%GVMf�RR7|6�$2j�]�����&��5���n�`M	ք�"�̐2T�A;&A`CH�rd/�L:��� "8��{�4@X�4v3R,S�����5]�v���!�b��8�e=,�=��!S(ɽ|V��
�z��>��U�7��Ǒ�PNѩ���ct��$�lD:k%B�o���jj�nhD���*�a,�cbg����9¸e)��	cj��o��!�h�FϹC�KE�;�nHa����6H��y]-'��G������Ťm[�T��Y��v����C=a�r2YΪ���eS�p��= ����[f��\N���;�lݰ?_��n#�碙��R��g$[E�
�cˊM�0����aY�솈㳺��g[]K��x�4	�:(���D�+�)���a��~ꔠ����N)���α E��є��O��T,qۘ��jU ���e���0Y?�^��5�0r<Q;�|�=:E.@�ɑ��/D�	V?�;�X�c�>�]w��<`�s�H� ;T�ػS��T������|T��^q��&�5���A=2��c��^̖��/��z�ߢ<*(�!���+���Z°�w�m�o�ɷ�N�H�,�H|��ʨY��z2{��#�؟���ޮf5��ib��q�o`P�d[�] '����-�بH��_΀ReK-�4�5�P3�{EzD}��V�($9�QG�M@��&�ǰ(�rD��/�]_�� (L�����M$���5�|�n)��(9P����(U�a�sB�_Z��,��@Me6�*C�#�K�No)UH������[�a]���-u�����/��W�9(Q3��������#'��b��>:� �Zޛ)%���BB��Y^�E.N�dy�ӂ=KC�ॆ\�t)�M�β4b!ƄC��Y�G}G�3"w�z㏟�.(��ʦrN�!�d|���~Z�����Sa�L��B��S��qq��KZ�R��G�7��<V��)5� ��0��9G��>���k�x���j�N�R���ޅ��,4$sy�.C�u��r�)w�N��Eo������ݪ]>L'}�}*...� , ��      �      x��}�n%Ǒ��L!㖗�kd��vv{�����n��jJn�,�O?YE6/�2�z��&���**3������q���Ͽ����w���~�>���b�N�0��Y���n?9�C�7���
�xߑw�T���l������/�_ф+��GN:] �7Ϡ<�g����n��#�W.1!uAē����98<�B���d��"'�%�	���!C`:���"�O
���s��G��(9:� �](AH�N���|�m���:ƔRYA�nR$�	x}n�Z���K���G�^Px����r � b��Jza:��b 9"�a���P>�r�11ܜ����ETGv�|�2
_4+$L���S�I��P��:b��}$)��ͩ<�:q���Nhɔ�GGNu�y���>����O�T镰y��I_Ts~䠆�y(
	�	!=!ă�����÷���y�^���ba�y��
�踋�M>%�xⰇG�<&�
B��'#�B7�|�T����:���n�
�	>r�����x�R����a
u���">���aDr�3�2���c
.�%|�'>��K�}��������2`4+碈+���V���$+@uA��ކ���)W������sOC1��p��y/��G`�S>�<G���0 ��^᫻���Ĥ;������+w�D\p�	�#&W���>r���D�z#���
u"�S���7�t����c���[�~݂���Nu��2��qƒ��Y��}�b(�'ҿg�;����du��S���rʔ��ŗ�O�!�I��� M͇�r�}��X��: ��|4����X�|�~h�����}�!p9���H~r������c����T�&E�JV�������Ii��Y�\�i^�W���^ex��r�x}��z�^89.��bh_����L�s@{���(jޠ#R�WV/�������r���[�������s����7Iy��\Me�E�_������	3�/Vv�]�P%�5���G��y�T. ����2�lez�LE��Wۏ��7X������&�}8:��I�o*G�IrHё5��JR�^���y��rr�7Ie|��)�E��$�z|�����V'���Gp]L�r?B��P�G����oX|,����>`,{�I����]�	��Qh}�c6 �� ��݇���"�b"�����M�C=>�����k��������o��Xt?_�~�r�*6�,���E����Ǣ��3A��2�&��`�)��i(��c��#�c��+���$���4��,����4����#q�58��5�L��R�Y��s\��Zv�����>�+�q��Xx��9���ʕ���x>5n�1��Ԥ���] �r� ��ɂ#`�\��(�P||D����V�#W~�T�̤&��_��!�oj|D�܎H�T)�&�#Z�J�AD/����>z|���[n�NM:�2>�
�T�4k���9��qmm}�c� )_���=�&$�˥iL��`��/~,�9��be�ȭ7!K%(�C��Ap�X� ʑ�XN�kR���N�p,9pM
 �����^4�&5�h9^���T�2�ʎx󳜸��IY�ʐd�)2T^1�2$y��+�r@+Kb}v�GRt� ZY�0FU#�Mڰz��!� * �D#� i�T�$'Ǭ�s�VS��M�zx�Π�R�
Gr�+�3X�ʎ�qA`yR �I��L�	���l���Ǝ9b,���C��$��s��a����[Z�&�H����1�F+�f����"�T�#�(�yj��LE�g/���r�ƒm��G�ż���P�_r��}<{Y�+@QE��P��ݒ|譫�c9*�K�Ɩ_��-� ���:֟S�� �	��|���/ן����_�*"�_��Xe�ߚ��=�sn�����χ�_�t��ϟ���t���\럾@�����nw��EBy"7��K���{�n�:�3��\���G�����b.H;��W�?�Yr&��h�?�aK��|�'�N�F�Xn�Ê���C|
��C��r�Ǳ��&��i�.=���j*���W���n��jbS	�L^*�
�sSG@QG�F+"(�ʙ]�r5�H<���RV �j+�\��^�I�ڔa���)`o�^�P%F�|�^�՗h��p��U�W �Ҳ_՟c}t�֖��@u��yE;i?��a��8*�j��T�'���Ӓ�h�E�ܿ��J3�����a�|&2H�k�"��������h�&�;������l2'�������UJ깭�2NK���~+MG��9�.�rs	�;��;7�AG�B�*[�C�ULAW9�f}��$T
�rQ��#v�����JK�ƛk8Ii�F���H��O��9�=�L�%,Pq�$y2����f`����r�(���
�PO�5�F�������\�ڶ�`�1Zi�S��3�g��%�`�Y���*��~ ^� ����YDK�
:�x��<�&����Q��0���f�����d�׫{S�3�~F�Ho�R�ĕ���B���g���u���#%,����H3�x��<�e�#{"�	P�a��T��b�I� eS��@����}ܫ�s��Rj@�c$��Ā���O���(U�����J5*Kyb��(L�j�Ryt�h�Z�z�@3�)@��w�L��@�i�C%�v�U2�)Ec� �R����e�8T��4{�r6F�/}�J.#��$�'2�eAf��G6�k�!����+B�@_���-���%g2�̧�ңR���ӂgG��7���!���P&؋��j������uIBe�&nb�V�ӦV��R�"��Z!�
;���v.o>��9��+�v��F��˛� %u��Pe%U�uf��#��W~6R��Z9�W[�6Bf0m�Pe1��f(e��PY��(�e�.Ɇe�l�I��@������7
ֺܐ�|^�d���u\E�뗠,���#VV�B�F��"�P�q�$A����:ƞ}�d>��(h�1s�F/_3����0������	�tj��dhC��P{��t$�r��Ö���k�p[��E�}�� �z�l�'0c9�E��d�W]�T��Н��W����|�ѭ7/e��9�J� �z�P��T�C	��xеJ�2�&.��еJ�q�K�+�M�֛��2�I�r���N��sMp���%�31{��T.5\B<��nZ��DG��x&Y���S�H�j�ƒ�<wB�9+�ݤܳ<�!�]�M�j4���jX?��k���[�"ȝ��i�V���.	�T���Y�����\v��;�e`��|Sy���3�� ��� ��ӈ�L���P���E|�w/��B��0�)�fLFI[[���R�I�Z��Z��]�j��th0��&��5���L���*��wRr�%7�����y�b+�:L��H�@�<_�{˻�m{O{�-}����7�Q�t�UVB 5�/P�z�+�_���D���*��
�8E�ڡ�L�7�P=X#-d�r� R� m���"T?�ɦ�g ht���+���5����XQ�����{R�F�	�\O@�u����n��KgVi��:�4H4�&$v6�\�I2n�R���+!���z�j�������o���W�ʔ�s�96F�����$ �tM �'/P�]�|~��'��	�/ϭ#�lr3�b}%!V�JP�Z�'��.;N�L�)9���(���@y��"'���m����o��!��s�BM�-Z�{��lMw,3���27��&Ymn�b�sC��\Z�o�D`�w�3آ��`d(�ѣoQ� ںK�`�������E�oد.����<���E�� �}���J�ޯ�#��Y労�#��� \n��LKS�1U:|+;�ٱ-گ$N|+;bk�;�!V"g�ʎd��:,��p~��'�ֶm{�� [ّ�F(T�š�!	����fB;Cb ��l���*"	殦䠒�	�,	����fB;K�
V�ǡ�%�ԩ+���Βt(Tz,B;K�ry��&�s    �2)>�J�nlbHp(Q�����M���T�z�^���[7=`��"�J�{�.��h�]�8c� 4�S�;��ն�I�j���*��b�<���/eB�-Z�`�	(NRшM�Q�P��� S;�'��r*�cڄ�fim�*�
T^yjG����˫�ͮ���&mi�%j@���+ݞ�i �G�����>�Z�L@U���L��e�tT�Q�ae�-[�����&Ж48P}�R����v<MɨJ@�5)���� �LHnu�� e�&(_r-�u��Z�}9�$ײ/ڀ��zc*C;�ZvF�@������%�� 4o���"���u�NػP��g(h+Q��5v/�T�ۤ3z�D}?�XQK;�RO$UV����F�,O��5�yj(��C����F�l�)2�k��S8J�+�Ak���O�rD[ۥh.�z>���(��K���!.���R���Z� hm�2�����Ak��G�"ڔ{(��K��'	W~���0�~r�W��	[��L)�T�hk��݃�C%8���	A}'W�Y lo��Be�-a{Äҹh�]h�RE��_��6�BcY��bܱ	�ۀ0t�#T�p� �`�H2BeT���4XW�4��K�<�KԚԭk<�.�r�D��``���l�PlJ��mt_I��6���=:�5�\^�A��{��;)J��S�pI�jD�E*$o���r;��z�'՗�D��K�L��c����ˌ)f�<�|ei#5"6�F�'Z�#^�h�X�l�E�r�'q��	B��J�2� q��	���z�$@YGr�}	@�(3��6ٗ0 ��%*�7ٗ�#�!�+S7ٗ`��>@�����G?e�9_D���A����+�� �M&O��A���<!Tm��K$,J��dCPf�%i`Qj@�+_i`P���P;�,J�0��#��CIڲ�e���D��rK���#B5.A��R����!ò���ǐ��e{Ī���R���쌐���6R�����(B���T��m:���)&��+q�m:�,�.��J��o2.�Z�h�zЕ9xɷ�zk{{(�${	F)'���1h;/�`���lg�P�Ģ�	��d3X�(C�d�}�*�#Bl+�Ph�+�	�/�+dPh�+�	��F��Ҥ�{B�ڈUR����G�T,RhP�yB(�$e&/
{��0Ɓ�_}W�����kU�<W�*���&J9}�;'1Uҽ�M(�r��x�Jshc_z����P���)�10!y��"�]���jt�`#{)S�Pl�s��G����ln����j#Vب�1IB�U@�PY��U۰$,>�=�L	,X�h̒�6v�F�P�IԳZ�v���h���C{3-������߮�?�|�������w����< ��8�|�U���������J�o��MU�.�(�Y��5��GE05ٓ�r��3e.�Z�n��B�������M�x���rT�nG��)�W6=2�<Y>��p-�X@�-��&v^�Z�C�]�$e�.�D�1vm���`: ە\+�\���_�[�S܏�kh���.v�"tD����"X�3م�tȝ��}�V�.^��C�Q�)�LHۂ[˹����/�!1l���4�GE?UM� �6#�v6�	(w!I¢Sϰ�^���D��iX��RL�:��Deu�����F=uV.?���=���A\9��ж��6�a�T�ݞ����c�Y����w��nYP�1�N���HS��N�oe1cS;��ꝲ���Ʀv��
�r�c�6�,Y�^`�A��u6��.E���E�`�$�!�+S�0^��2�y1F*��մ���Ow���Z~\����O��?|��C�.���_~�?9����o>�><<�?��=|�|��������on_no��_�=�_����搿@?�_r�Du����f2s�n,L�y-y���9�W�&��ۣ�W�:|:��L}��f����?ߊ�߽N#�vH�H:��}�����_�?_��.���j�����	 0�x�y~�����F����da'T���|�����g���♞.%�VB����o�����B�;�W��i�
tT6��?�MϟB�L���+��	���|@�^�?߷y0���,�__���^��7�x~>�Y��]HMfj�����;n��T�̓�XϿ"*���"�Rf���җ�~�
Q�LV��W�/�����+��+�3@&��1��y���e��b��G�TѸ���X�#���	q�#���@�&���A_�L��:���/*���[�����݂��B��~:�x��t��B���O�ݥ��!�%D����\jK�tI1�t�|9A�t�;n��V�m��g�����k]��_~��U�6�A���X!h��c���Z�����r�ɦ�'W�F‫�*Nw������i$͕l��7� � P(��\z�8���ܑ�\��'���0���B�)�ŝv�fb��a 6+���^o�f������>���B����\��,��)��.#R��"q�n��<h�d���Hq.Xh)���Bŕ��ڸ�UQqR\` G�yc�n��޺: D��H.Peb ōΩ[wN��W�ԉOP&��.�jeȶ,����y'������p� ]�pdɤD*�c���ی0� �o����0��-�IN���&����'+��{xE�����p������\a^�76�|6{�l��bR�gwD��:L�-ۂ�����(m�U�e㞹�)���	D�����C������'`��Qp�|�������m\-_ ��`^�8�x���`�mCw�)���p9�j=o���c�T��쑆��)���u;���-�;�L��`X�wC�J�#���c��1>n��'^6b��At��]0m��H�Q������b�jF��s�w/w2UF^�zC��Ǖٗ%��_�ip��C��]���@���n�G�^'t���r��\�	q�%�H�̾�'�^EWa9޼x�TW���	�^x�W,��d+��?�(��&�in�$���B��W&9�,�
�����뗉�zj#I��#�.T��z�M�BFiA�:��4Pj�3?�wQ�#�®-J=�B
eK�pe5!~�Q��6衦2���ջ ���F�ʉ��^X�Kl�XT�LGg�����'�Q�K͖��e��f�:���e��2�+yQ9%��y����B�nٯ�icp4��� �b��p٬��*IPi�=���9�!�-��e�����DPnC��f/��ˍ�"Y����!���r	�l��P'�����d#�/�o�O�Ro�K�n
��w�=@��nd�V޷���uWJ<7I�n 7v�1�nZ}�"��X]�"_�7x�8#��H,����Ⱥ�=�꓎kE^��q[+^o�����}�_B��t%P�\�/ø^�E�m+		�I�E��q����2���E�(Ɗ6���O���Ί��a��j3�U�oڦ<��u3�ev^	��!��[�T��X�.��*\;jΠMl�p3�Cf��3RW3RW½x�۹t�ՕsƆ3�3��K�!��;�=fgb��3�3�^N�ljj>�80�}�q&@������}�.ܙp��͖�|�x��3!�Ƴ����#z�-���KO����:�v�t&�f۳����t��[�g�݇�iS��̍�+���Ȝ�9e��l����ԙ�}�.�r��;���Y�0	2�s�.�2��P���\m^� `��|�$�3�	�,ڸ9ӑ�������\{����h����:O��N?����9�aƗ�~�44~��q �����������lڷ����>w}���/w?�������׏��x�z�������>�}<<X>��_����O��t���H��蹸w��s��`�!�ܙ�����U����=�lT;A��vMX%�3ݫӢ����d���֮�1�}d�[��+]�3*c���zbl<���vG�n��Z*e��]`L�I�n��`���r�N
I��.��+�����o�i�I�c� h  ]F�ne�{F�V6ϐ�Jg������)�R�{U ��A�
 �����W�w}�\p�#L�6�|�m�'��݆�>��0*��\�Г���;��������|��\���Y��M8c�F|�@ְ�˹Y�7M��:	(�����6=[�b�RG����W�?*�I�m<zp��� 4v/�_��t�>��2���;6(��"�#g�Os`�G��.�7��xV����"�HǑ������v��-ԇϜ���
b��W5q����ܠ� <o��P�}$ߤ�i? z�z~��n�3����绿�����W�����iޞ6�;��C�]~F��=�9_�H�L������.����}y|�Ā;-�����������U�5�'N��������?������/E����G��85q�}#�3����)ň���g���t#/bP /_����	A�+�l����a�C��r��Vr�b����/�.h'���.LN�����Of�?Q^˯�~�,Ɇ_��ӕ|q��n�Kr��;��L�1D�}чGϥ�c�����������8O���#����d��O��<+���ԉy�>������O��G�N Y�,��M$E[HJr�^zX'��N������]� >�0���*q���(��H�i�^?��r��%�LΚ�3S�j��G0�6�e�aq<:1���.G0�X�5n\�w�r�3�`.ztJGv��d�q~_�Ӟ�	v�ӂ��ۘ$�ff�Bx���r�����Lba`0[�L�r����2�}�
	������|�����$шw�O�G����y,t�0���ttA�tN�#����X�sQC�1{�bE�SA��b��":#O�J"��ة�
c��V4{�Bz�h�0����f��x_hygU���`��@`;*���LS7���_�!�iBG�>�H�<�2q@&.�>�q�����$ �tvs���t���eҰ�3��n�K���M����Do���]*N�&�N�U�.�ӯ��jΊ>C^�ǁ]�oe�yraJfuz����0V��ئ�v=���hp7Ł�ث����zd5��P*z���a9��3�<��|��}���'К�â�Ă
�!Q�?|��	Kn�K�|.�Ec$"��Bp>m�<b��9�b�[������ׯ'�`g[FƱZ���X��X�W��a>mx�@�F�$ ����B��1�~�9t>=_�Y�=/�Ž���	w�/�z���@?̣�M�>�$��<�%ܽ��{�#��0�+�
�%�[��$��'Y��u�]����o�t)#�R9Ʌ�	N��e�;)�������rߩ�g:Ou+�Ҷ�,�fO�Cջq4D��_�~4d�� �$���v/+�[9���)�b�a39E�N�$����|��h;9�ޗð������qwіT�Ώi�H���D�LƳ��x�nڈ��RB�З:���ӥ�icr"�@�� �s�.�M��7�ߢ29��������9[z9�SOҲP�a
F1r9�SO�ed��΢�S�I��雸Ĵǣ��nܸ��JR�ґ��t�4%�|�o{U��D)ổHB[�JO
�.\H#y�"<����J�Y��v!R\��\*�&i����c�`�MOE3�N�>:�B�F��)��\���\d�ϧ��Ͼ��wS�S�h	X���A��>���b>M�;�b���{�8	 �h�� �eR��qH��!��B���LN�4d�x��q%)��� ��p��[2|��j ��ͣ��D{pYЃ� �-s�����[b~:�n�lo'���D��� ����ӶG2ߴ����r/���H�Cp~S0�� &�`���������K����Չ�H!���������F?|���L�v�5j�0v��9��ٔ�ӹ Ȉ(�����2�C{̔~.�Z��N�0���Lq��c`�%������l�n���\�P�n5��eA>� "�"����G�(a8��ç�A0�d^�F�e qx+�6� 2at�ۏc���0�@�֣S+J����Y�aG^RM�<C*ꇃ���ӗ�7��w1X�.w����41p�ڼ��w��&Z�Z��p�R��=м �{D�9�W?A=�14�l���o�O!��&l��4�8��#&u��h�{��6Fs�Ma�mT�qll1`:ߛ"�d�;7��w��; {S�M<b��f6�N��7u�X�N-i����ϒ ⑰�o�G�:����O ��G����LR[0��H��_'�XL1�4a�9M�4�uy�L�
��!1�e;:�@a*�����8]���op���Ng
O?�?|ŝ�;��?���a<�N·����C^F�$��±��۟y���i����*�7@��_Ocd�A��!��1�j}���L��G6�8������'v��!d�F	+}�N�C�
�a�)��Qx���[�L�g�5���XU����9%��-�5U�+UU�]�AU�yH4��XV'O&�=���y��XV�����4��j�@�N=�ў� �V	(\��I��] ��i��,}5R�z;v�0�Te��,�1�t�ƀ��K$�[���Bi�-��]��__�|����w_~��|�����������~~�z�	���d����x}�����q��~bau3"&Y���R,y�{^u����߽�&�	x��KQd�7�/K0A�7��M�o�}=v{ɠ_Ej�V5м��SN������/�z��O�����P�>�~"+���ە2#�W��������"���?����g�f�"%��E~���F�O��[8�ǯ����R�$sA�O�_n?_�����Ґl�ѿ���	Oעm*�ٯ��$s4DGVH����ٹ����FO��7||����7͸��H80�q�`z�ק9̓\&x��G�^�t���s�	�&0ᡑD`J.�9����;-<�U�)�xN������/w@�W�:$g^�1u�W.�5"��)�%��[n6�hX7��X"��K�|������F�:�H���*��Z�hn�1<BL���;�����s����{�Ku23�k�cj�	G	�&�4�yq>�iO�R���۷2:�����Z�e?��b׉�J~5������ �h�&T8���w�x␳�p�..{�((�"��ݲ�!�j�x��O@�F�a4Ԍ��3�4m�[��k�B�G������;�iW�b�Js�#+�5.|�-C���� ��:�:	cK�� ^\�R>����A�y]���Q�;��$��G_��"XG-x�����g a5R���	b�zk���z��h��]dg�## �@��Gc�4�B]2c�*��A�U���h�0�:�jeB�<H�K���q�uj{��� ㍃��ٯI P��n�v����O8��6GK��LT�,,x5�9���a��R�d.E�X���P��&	���U���Os8�o��KP�'I!�[)`��+�X�d�$���v)>��`�F�w�.�Z)��t�K0��y$�z�e�r�n�����ȃ-�`�?�i�Jqsq1}�����x8��1}F�dA�{���l��w>�q�m�y���4r�g/��N1�����Y#���S����??|�����9�?w�|�����!     