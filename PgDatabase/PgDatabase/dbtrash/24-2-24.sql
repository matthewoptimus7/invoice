PGDMP                         |            terion_billing    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
    public          postgres    false    218   '�       �          0    37892    credentialstrigger 
   TABLE DATA              COPY public.credentialstrigger (rno, userid, username, password, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    220    �       �          0    37896    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   u�       �          0    37900    districttrigger 
   TABLE DATA           w   COPY public.districttrigger (rno, stateid, districtid, districtcode, districtname, operation, dateandtime) FROM stdin;
    public          postgres    false    224   ��       �          0    38062    feedback 
   TABLE DATA           9   COPY public.feedback (rno, userid, feedback) FROM stdin;
    public          postgres    false    254   ��       �          0    37904    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, senderstatus, date, reciverstatus, transactionid) FROM stdin;
    public          postgres    false    226   ��       �          0    37909    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, updatedon, hsncode) FROM stdin;
    public          postgres    false    229   ~�       �          0    37915    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    231   ��       �          0    37921    invoicetrigger 
   TABLE DATA           �   COPY public.invoicetrigger (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    233   ��       �          0    37925    position 
   TABLE DATA           [   COPY public."position" (rno, positionid, "position", lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    235   	      �          0    37929    positiontrigger 
   TABLE DATA           x   COPY public.positiontrigger (rno, positionid, "position", lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    237   s	      �          0    37933 	   previlage 
   TABLE DATA           Z   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    239   �	      �          0    37937    previlagetrigger 
   TABLE DATA           y   COPY public.previlagetrigger (rno, previlageid, previlage, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    241   �	      �          0    37941    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, "Lastupdatedby", updatedon, productname, belongsto, status, batchno, cgst, sgst) FROM stdin;
    public          postgres    false    243   
      �          0    37947    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    245   �
      �          0    37951    statetrigger 
   TABLE DATA           |   COPY public.statetrigger (rno, stateid, statecode, statename, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    247   i      �          0    37961    user 
   TABLE DATA           I  COPY public."user" (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon, organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    249   �      �          0    37969    usertrigger 
   TABLE DATA           e  COPY public.usertrigger (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, dateandtime, organizationname, gstno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    252   �      �           0    0    accesscontroll_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 77, true);
          public          postgres    false    215            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 186, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.credentials_rno_seq', 90, true);
          public          postgres    false    219            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 142, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    districttrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.districttrigger_rno_seq', 1, false);
          public          postgres    false    225            �           0    0    feedback_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.feedback_rno_seq', 3, true);
          public          postgres    false    255            �           0    0    invoice_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_id_seq', 1239, true);
          public          postgres    false    227            �           0    0    invoice_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_rno_seq', 270, true);
          public          postgres    false    228            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 264, true);
          public          postgres    false    230            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    232            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 407, true);
          public          postgres    false    234            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 5, true);
          public          postgres    false    236            �           0    0    positiontrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.positiontrigger_rno_seq', 2, true);
          public          postgres    false    238            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    240            �           0    0    previlagetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.previlagetrigger_rno_seq', 1, false);
          public          postgres    false    242            �           0    0    products_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.products_rno_seq', 112, true);
          public          postgres    false    244            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    246            �           0    0    statetrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.statetrigger_rno_seq', 1, false);
          public          postgres    false    248            �           0    0    user_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.user_rno_seq', 181, true);
          public          postgres    false    250            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    251            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 778, true);
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
       public          postgres    false    257    249            �   �  x�m��n� E��c*�`�J���nv���K�a�ͨJ�����:8t�����>t<��J[�a�ə�/"A����qu�g�	x:�g�<vx8=��Q�^ݑ b�"R���e�P+�m0AeLI<�T�F����%[�G?�<���N�t<���؈:V||_~��@ԭ�S�R���F#-zw�%-Ż�ѻ� A̖�7f�K���n~�	��+�J
���C��% EK��z�>�	�u��Ơ���iJ4�O�\u7I�\=nD7	����do�	��q-��p�v[�yu��W(�Lȣ�ۯ���,ȋ�[_N�7��s.�<#g稃�����|�� .�Ѭ�ݖ52��F�Źb��nU�\SI�X ���R�i��I���+m�@e���a��Y}LQ(�&�����.�)Yl�2���G����      �   Q
  x���͎���=O1/�3�I&�&@���b��`�0���;�E��ݬ���A�,��ȟ*��E��3�����.������q���[�o��C�F�r�8g����?�����_��UҦ��r#�됚*H)Xj`��\��\����?�R��|�8E�P�OW�E8��x;���g�|[#���U�mK7�ړ~8&k,�=�[����Fi� �*�;�?��U�8
����4vR �V�P�Nҍ\�q'c��n���!��/�6�k�-R"���xD���2I�ڡ����X��آuJo�x���b���V)����']�NF��-0~�;9iG�1���Nr���$�uLir�eS���:ˍ�c��JqS:��C#�NGh~��(%�@iB�1��By33Ū��4�RXnL$\��T!>�o騴�?��,�2W5$W|2w��D.�g#˕h�T��Y}&±y��V$�s(}�+�C�X5�7X�kH�ؗz��dj�쵳Nu��q�ƕ9؃�7��%fX��H8��̃��]ބ.��|��s���W����X�[D~ iӯ��K���N�e����8�kĎ�R���%^��v�����B�Y���\:�H��uF�2k󓬏HR--��#Y���H�(�,�5����Grl�O��CYBi�~�S�{�����S��E��yD�$�"h��u���������Q��O��~�����=1Nd>"�����E��H�H{A�wl�Ws#S'k�"�;NF�$�s]��y"��,)([$h_�Md|A&'#NSz��ȿU��ų�(��R?|>�J2\���^�6r?~�Q����텓#��v9���ǘ��\O!�zvNʗO[I�ָb(]�����6T�j�TTO�Xg�\252�$=/�����d����bڮ��ߏt[km'#�Y�4��rG��eVR�Je�%@~;��t�R�v���I!.�֙�\)���(\�s����4khY��D��xڰ%H^���L䲢����q����6�'��i+��wwLK�ei���<�J��}��p����eL��QQ�Z)��R>G��!�e�Ԕ��io$]kE�6�����%70\��0ͶA9��Z�b��f֦�L_�R��r�-Rh���ݱ��;ƀ=	{Q	���'� ?;z�Ίz�^���,�n��(<+(�f�J@�/(�䡡ڕ�5���-�c��9�-2� �k(%K��h�e���Ɉ�mxZ
�I!ۼ�EJ���~0��$w�X�DvR��Չ��$oaJ��&���y�JO�FO�vҼ}W*��B�O��\T��~�<��#���bo�7t��M�'��y%���LO��<��U��� ,�?����'@��Rs�
�g_�\�R|c3
����L$� �磌�g��t�&�D�.8L�A�>���D��,��6�ϣh�"g��rU�N4s�|Gg'�#��N�:�o�[��ٚL�@f!妢�&�͗��VRB �^(�<����Z2ZB_�H;I��A���RfJ�k���M�hD���E�:�@ɘB�(�ۣ��$ҠiD}�ʋv�b�����Ν5O��*�F�ُ��#��XYJ}4�#�=���H��}�x�\-�j���0呄���:jw���X�+9�g����e�zy��c=B�Y�}w�$�H?Y�:�%v4]k�
-J����b����.,����<��q��)���Z�:��yV=Oq�}��פ�TR3	���43�Tc�f{�˪ �_�D�
\ژjO�sT������w���ϡ�P(EQ9��ag�u�Jm\w�sa9z�d.�8��4
M$)a�"�IT=�,�ZĽ��j�(�ަsX=�Q�P�8���cN'ټ�(l}��/"S����e�'����[�:{RP^ryk,4D!�$��%Ӂ��St5��Q�ݍ夞��n(���#'��#�yJ�;,qB��mG�T���Q}B�Q��k1[�4I:���%��CɧI��ҹ_g�J��C���Z�r�>����q��:aY��𸂢�ח�$�)kK�W?��J?>���F��!uP?�(��2.X��Y,�����$��>��Nl�YG�;sZ̲��;C��g<�η�lGl}�ݎQ����6��e]@un�@�lR�{tqDU/Q
�<��o�!믮�D�R�ɸn�U��r���[̵v��X�ầ!�+��V�Xp�31һ�^����tmt�NU�%�RB	��!�Uŋ�Ƀ��rL}�C:�P��E�->g�h��`�y`��"wgc���8�U��}�&��R�1��(�R��zG����t6�uԾ�#�*Z�ԇɔfU���s�ŵy�i�#��%>�z�BߏZ�+gY����:�R<ˢsʛz�9��ۼ��a%BJiH�n
��S6�a�����˙WC�w
0�[�M_�ѭ(�W�b�:�_z�iI�����a��9�Y�^�"�j���<�e�gjEMp�B��8I��Z�tЇ�>a�<O2��m[�����ܾ�9Bcڊq�q(�����=k�v%�t����]ٚ�_ !�hsn��_�ޙ|h�(鋅ܾ+�i"^?�K����e��͆4�6��Y���;��j�"���FYe��`^u���=�����df�EJc������7�?�.�%��M����7���F���7!']��U{����sѳg�h}x�s{{{�Ҙs�      �   �  x�}�Mk�0�ϞS,�#񭅹n/eos	��	4iٴ,�_��^-��axŠ'���#n��e�Y���������9=��!G�0{_�pL�a���[��˴-���ic����O�Ew�ψ\Q�j� b�ssI�h�9���}v5�l�5!�S:��0n�!C;�|K��D�$�Z"����f�@�H��u\���&�2� 5	�0��1���#h'���u�� 큃 �GA"Ԭ��)&�H�&�^L�!{sш��{[>.���
�S��픔��v���}KA�%��d0�5	�2�$�C��*&�i]l��Q
:ެ�Ȓ1�"���jL���Z�jLFh�W#�����E2���?�1m]Rc2���$ԫ��v+0AM��Z���N]1dІ�jLF�QԘZ�^���%EjL�0�1$�A�Ō-��.yK[��s��_�j�1����W(�?�owg�����2�7�w������Y��TOw���/�*Y      �   E  x���Mo7���_�?��,��|ݽ��"x���H1"�ͯ�[d���gԔƀ���3E�>�"�O9����n�_>��p���ۿ�ǧ�?�8����.�Mn�Ҫ�hn-[�F�~��z�|tY��ڬ�'}�g��e�ZM,�k?�d庨R+5��~��U�bT��T}{|�|O,�/��M�X�E�k�`y��ξ��������j�J]��J�(�x9<��|������>��	�ɚ+da��5>�r�~!��Ҋ�J"�xL4�b�n�I�yB]3/J����1I����%L�%�;o�w���u/����Dx�a���pD��i��af��D�{0�AN� K-�n��;��r8���D�=q�F�i�J�g��3~�15�z��Y�Ҋ!QQ��J���[��z@P;|�O��#Z��b��jo��a��9�M��`$',(E~��0��8|τ�hi��Jb?�S �KM��bs��"��lNG� ސ �ۖ$�w�}c�}m���$:�; � a���LԲ'�Ç^H�sbZ���C�,�H�"}� ͤ��V�EJ�o��b21����/�%cU�K~�*��s|*҆�3%)S�q���ށIR�vc�vcb)j��������r�������^Vcc�j3N���5����-$��䗧�l�9c�����yD��%��xN2|5��U�g:F�x�3 |ڂr犹x_S�F�ĈL��\��>z��L���^��Bj���}���<�C/R���c����^2=��n��/0�ܤ��d���@���s�]�<����k��b���s2{�9�C�s��'+W��*r�C'Y}�9B�0͍��ט����������qcx�Ψ��R�s��i�F��N��9��a_����,-�1Z�s�aa�E��d�v�M����b��9��(z��Y��0�3���d�-�V�KA����GҌ��(��
aY%6|$�6��텀k��Y�[0��*&`P$>�Kc$`M�퉖g�Z�t%0�R�%���j=���f��ou��+��E���߱�[���Te�q��%Df!��Su����4�~��Fӟ�]i�t��,؂T��1Q��@\{�U�ך(�U'F�O���]�g��׮5�XЯ�Ԛ<�$�C�nB���&��4-*A�!9_g"���v	y�ь1�}Ilϡj"1�U8�G�<�TK�)qТ���M�Co�[�
z-P�Y��#(F��'���*���P�d���A�O��}�R�ƞ��}�b�5$�\(ג|���5M14hH����.����~��A���y�m,N�LBf�b� �w����ę:t.�ڐ�C��K���~"�S���c�y{�PJ�@���ψ�f��Q��S�����,R;2H�#������rɽ&���R�7|q�w�8fD�������=���91�&ViXO��Š�5I��P�4C5����?��.����*V�׻�Uh�ʥR���g6�W��[�p��ܶ{K�3������!z��5���h_���r��vq�v����I�`�����O;F�׌Q#�J�Ԡԋ�9�$d'<�m���l3�>05�Jlܨt��u�^���14ahp�J�f�L�n�.�,���\l6�D�7
LC[iX�-r�^���@�C]`�G3m�yL���X`��f�LR�(�ٹ�X�C�5�q�G�.�1������)~ǹ�j�����c}�������93���sS����Ma�cHt{t����*B.����i+�0���&���N{z�}!�{��p֫��q[�ʵ�U�]m_�OM�Fr�r�}W=�H�\_�����ܿ�("қ�_�V=��~�d��Y�^��=����C��䗾!p	 O�n��n���)\Ĵ�
�/T��n��=�VLQ��H[��#%��H�X�6V?����%K������Ϸ����������"�q�YV�|�a������]�4�-�'z1r�D9�7�������#��a�P[3G��-����a,ωҁ����R	8ͻ��I[�߳Ak�%���y�጑�@b�ݢ~*_���s��Be��ؽ4O�-)� �O�      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �      x������ � �      �   ,   x�3��H��N100�2��H��ɇ�9�Ss��sS��=... "��      �   �  x���MoG��ڿѳ$��}k���Kz�S.E]������Y��}%q5����~�Cr��B�O����/�2�cq�/OD��'��?�~V~h�s`�Y��I�C��DDx�h�9��4��������񛌑�ۋ����˨qత�r����G�L*��́�9��re�͇��,���g)i�GMN�U���I��c�����?�?�������&\���HA.��y�s^s�!� r�rA�<Hm�����Rzw�k̒3D3$�16|dN񁓡T�2��Nz/k���U8����0���ts-�N�~!b�K�BT��8�>��>�.�kG�\����V���'k�NȐ���`N�Qs5ZO)[��Y���*���M��S�f��nu�腹���|���||Y���a��C�@���@S�ߤ�+�]���>�����P_h�/I��ZEDw.^�`��o�.E��	U�
�?T\u�<Bp�LseU���]N5>�kݗ��X��c�V������&U�,WRj0i=������\\�׆���V���z��k�ֵh�3�Z:�ɯ�
*1i��rB��nz31�*u�~W����3�#�nCp, jN���]� 6�`_���ӵ���{��U���h��Xp�
�z) �U"�K���^
0b��R�SG���*�-q���2�s��j�Un���e~�rN�[��~`k<��*�W�̪e,A^#h�XQ�R����-�^�r�y	�����H�z�o=:�@�������V��[�Ak|���cCoM.���d���ܯ��X_� �@z�F`=`#����F0x�������3�^d�#𑁏`�G>��|�#�Q��h�G��F���o��߭�������V~%ˁz��ԟ���ן_!�I��!�/9=����	A�K��O�H�|��!�#���G���G6����l��5PC��͹���o(ـ:�td:�"���@�u9g:`�ـ�Js1��\�]5���Y)�ӳ��K�W��!7���&�����H1@v�\��D`e6o�z3"��֯'�g�l���_σ�"�2h!�2h!��2��B|��a޺�`Y d�l�������76���|�A؀�4�o�z���6�v�|��B؀� |����4���4�o�!���'=�C�t�s)4������a .��_ �K[��$Y� gQ��7� �z���C"�ұ���Eq*���M����@���Aĩ�c�����Q�pj�����%xe�8�
�F=�ép���/���a�ét� �N�JZ�J�����0���q'      �     x���;��Hm�]���꯽!C��[K�?�v���$XoC!YbF�zE�����׿����G9���Q;~��ߏz���*����(��%T5��b�D�Rb|v��QR���S�3����kO7��X��ؐ�T�h��$W~J
��(�×���KwI��K_�|ȳ��#S�|C k�Wr<��ڇ\(�K�~��O	 1{� ��7)ŽH�79`u�Q@�^��˽E	 �{� &[fr�d�ו�P��/�ro^@�^��ʖ��P�2�*[�rBe�TN��P�SP�3&{�a�d�<,�왇�=�`�gL�,R&G�a��H=�����y��sE�R���ۀ���y���ȷ^�R������Y5۳iΧT�?6���<W�������;��b;�st��$vX�������{�X�msؙM���Q��������m�r�Z�Q��#�)��|el���7h��x[z?�
0����=N�4���_��jH�������y\�`;zS����� ������Γ�F%�~���������ⴿ���ze��}��0�r� a࿘`0�₁��"9�{�L}ɍC�Nv~��h�������!H7q�(a��l�!�������Ҡ|i������`�`:�6!,�3�x�3gP�"��s5xv˟����8��
��	�]�%.��3��S0��K0�\���엯6ԷH����s��q�/W�]�vtخb;P#��j�]��s�CRp^��`�.I�{��Q#Ɋ��f���撂�V%��I
�t���V�7�2��(���=�d$[Qpߥ{t�ȶ��K�h��nE�}���3#݊��.ݣqF�;;��_�H�����=#݊��!ݣ�F��C�G�t+
�t�f�V��5ҭ(��ʽ��F����~��s���I������m�,�V�G�>Q�`�k�\Q��T30��H��0��f`h��rEaK� =5R�(�`��*j�\Qp���˿�y��<�� �c q��8��L�`���F��,9��%g��j��Jk�]Q��jk�\QJ��5R��J�Ge��+j���Q\#劂�"ݣ�Z��QX�H���V�{V+�=*k�[Qp_�{��H���H���V�{t�H���^#݊*W�[�kl�:	�m9�xF�rporB�frBh�f��e0��M�2k64���x].H�r@(��r@���r@(��R>j��\[s���\�G���.��m�����~Q׃`������K�BѺ\�noT9�~�2�uZ�i��J��Z/�������?�8�N      �      x�3��CA��F�Fh\1z\\\ �	�      �      x��]ˮ�q\�����jT>�uV6,/f#/x���������Q�J̹Ӽ���pE��u�3�UQ����y����}��ˏ?���?Ҥ��$�I�s��\9�JI}+/�A�#�Cd�^r+[����Gҽ%O�n��b����?���{��H�Eْ���Z�1N{hߥ���&���{h�uZ��_�`�U�Y�DW���0���9uk����9\�^���d�|w5�Qً���I��郹�*@��~P��mw�Z ����ۿ	$w����M����G����R�T?}�;����7�#�Y�C:ד��]�:�� H_�u�ޔqG�/��H0�T���oZ�����Ʊ�Sw�����)Ҽ�fz�~y8»���u3���Q�Ou����zo��冐Z16;��N��za8�^�!N��fRz��64q�ޓ��f�&�>$?4�Y��\?���������^"��):���|#�]���Y�	�r�w���+�;{=��-H�Փ������ۧ�~�߿~���?~��������/���׿�]!���G�ko�c�����c�&#�	����������&o�Z��h\s�]�,w����++]�[���IEʧ��;^��FzlH�y�w��'���������o?����>c:���^ږ��C����C�C��m�Et���C�Qվ�%�sJx�^)��釼�%χd�٫j�u+��ں_��������[�_��':咧d������Oiw�th�l�I�B�O��[q�o��V�W�Yh&g03s����B���)�\g#�}�:����o�����-�
{�"��m�b'���;���d1��MRk�j�o�傗?£ёS�[�t����L=C҃�����`��oM钇��'<D��V��Z��;��d��ړ���Z �[;�:�@�+0MW����V��Z�5�������î4v���
��_���w��r�?f��k)hcZpz-��(k�'AM#[��u������6]9�kY��~�}E�r��[nmi�d�[,�-o=���44�	S�"b��֦�9vk�n=�(�i�Bh5�Ŷ��&��d�dD��G��ڦ�І��ֶ�����`o��LRM�Ƕ9��,͑��#-s(��k��k[:�m�3J�'6
�&���~��װ���޳�Ԁ�ۏ��vg�J��ҁ�ۏ���'�( !J;�]����͡�7��.C��|�"�a�z:RB+���#Z^�.�Tv8	
`^�/�a7�[�	�1�(�\���R�|���~��K�9�]��V$�2O�2��1ot}x�x��y�v��yp�{x��y	lu��	��ӼD��9hS��	��ӼDo�����[$�2�W���d��"��y��9�Xe>��$�2O�23���5{u`^�i^�z�&y-6�;�2��s���o���ˤ�1����n���=���!���ڸ����L�77�ٴ��(ˍ���eҿ6�e�M����eҿG��i��;�w���?u����L���6ݭ[����eҿ�o�;�5���+v��;�ڞke/,����wg�)X5mb�������}b���u��*��x���u���/�׊�`����t^:�����#� ZY�yp�6�>v��D5Û�P����g`ù���F���mҹ�Pr �>��&��r��u7n1�=�6�+��7�9�u�I��\���&��8��7�����_~F�E�?9�O��{S�3O��{c�O��ɗ�g��t����v�^������4�=�X{i@{;Ε����`�����8Y�2�:�gpW��g���ʘ�v�w�4�=���W�g��|y��8`^��%���8�v�]�^�`�ܕ��v�]ik�`�ܕ��v�]��N`G�¥q��8�R�����+]��8��U�����+]��8�[�˨>�4N=�Gp�y��Ʃg��n1/����8�v�/�e�\������żlq4���Qqi�z;��wTH\��������G���;�$.�S�`^^����#�����Ʃg���s����K��3�w�g��NT�`ߝ����;Q}����D��݉����K�3�qZ�ֿ5J<.MT�`�i�Z�h�x�_s������'v�|�F��.��l���u쬻:�/ۯ�s��?{��:�/��;�l��mNً��U6��.����nC�V�
;�?못˦�;�C�I�
��ܲ��yϞL؁:�I��~}F���Ӱ�n/�lnʀ�A����
8e�JF�"`Na�:�l
8���n=0-���$��S���u@� ��YĆv�[V%'��+q�1��47ʜ�pAM7#�/�(OM?fn�#��9*�~�y�u�IԎ�����Wg�ґih�Fy�,f
h_	m����%�:/�6x6�E�B��F��<��Qo�	���+l��6�m��#�m�)�L#l+_c_	�C�_{�p���6�Q7�f�+LB��0r�h��� HC]^�IL��|��;V�kK��A���(��T���̓�м_a����-�����eo���(�n�9G���K����4+������ ������������ý^P����B}�ӇK��yH�{�(3���������-O4T�����a��]��us���u5[��#�2�8Y�d�>!�B������F�^�7�:�;>қ��T+4;���������K7� .ޅU����-�g����J���Zp�Q;wf� ڙ�V���{�Ҝ�n������[*:\��[h�=Z]	���Z�L��F�gY��׋t�x�	�� �>���S
��a*�g�~��£<�ka7�}-��X�c��3��� 74M�|d5fQ�͈A�<�����x��Xz�M]�O�.��:�c*mGyZ� �7�#�)�s��o���#S���~�;�@��x���4]�]�wvy�<*߲W�M���;���=�XG$M��'~�3'�OĘ �9d]��t���u����<�ԛ�2;ڋWry�fo\���j������Ѡ�"8:j饢/
�����Kl���&w����/�&G�Yx���$��5�~��ʜ!i��;�Yu5���::�+v�WFQ^-�[GȪ~�x�#�U&N�k^��C5���n�����Fr�>y��,�6��Q\���C���q�����8?����E샅l�r�� �XޞqoԠ������?$� ��#mG�銐��W΍���^���e58�\km��A�!zTC_4���g^����W���b�8�	r�%��,�[�������"ԸOpGGj-c��#A��Јު��0KUp��^��YT����$Q������������@��@C�<��^��*=2�05_ Q#8�l�4�=2�0�]��bA�)s+!�>�K��+����~�Ɖh~���q孽 ���K3�͂�C�v>O"��A"�\0Ԃ�C�0��+�c��0*�f	=���vN�w������P;���}l���7���;��5p��KK(  j���y��~㶠����i�«Q�'^n b���8�)�E�-��~�P3��ܚF�[8�S-&�G�����kG�� t �_Y��Q���Τo�GC�%>����G��, �(JQ[���q�w޶��s��O=O�Ɨzm\�aAl"^^��~��vh׼W��D�.�GQ��2�5��z��a�wQ�P�cAw"�W��}]T�C��=����2$�<#�c���-U���<�O$�"�)tn��%�
��E�+�/�G�F˼�>P6���)���'ƈ�A�"�gϠ{^_�1G1��y���9� hE�	z���1@j{Ω�����Fa^f������}�b�y�e�
���.�Yׂ<��V��Q۰� ��DE�
��1�i �-�L��S6?Ƶ�{�R���e���I<��C*b}���y��"x7s�Zi���2����ş[�N�Җ��m���s�����)�ͬ`+]���-�H���x���8L�Q�R�9;&@ٹ���� Z�� 0  ��_���H%Q�Ru���q35�X|P�H��p�@YDˠ\����*ϛL�Ih�@ٺ��:2�'�gQ�RWP��Nm�$'P���,�A�*��7��uc�=����f	[��,/?��;���(�VP��fct��o6p����&~~S�2V�,�U�������H(��OF%K{��ZB������cO�����j����>4��{mȲQ��VP�)M@�`T����qw�6��-�@�6_g����%1�FMK[�Yo�d�_�kh������,�����4���+8�����߫������o�ڨ��Q���k�筭�#�uM���+jct=��D�(l�/YKe����>o唡��I������-w�_�+L~�	uHԷ�yޖ�-b��)TT��yޖQ|S]�=#F�K��m�7Brʣ	��������#M�O��Ïc(;ROg2����xg���L�A�����"~�����y�x�=���!(u4�'�q�(5�U�b�XG�|��H'H���� �Ѵ��㓛{J�*&�M+8��GmG��i��WP��Դ�^�'�v4����Q`&�4}�������id8$�aea���V�3�pq��
����N��&���<�c���++kul��`� kRYAX~����� =�UV�Յ�QCG�p��lRY�W�q�sVPAۤ���>)��Aݤ���<���s�a�7�� ���"py׻���+ʶ��8Ce�+�������L*���e|.k�wG��/"[P9��"<�K|MT"b���kP:i���_�
g����!H�4�����P)�g[���N�T��Z����	�yӴeqn�����"<��4�h���C����2�g���PD� wR=��E�?U�{R��@Y;��Ex}�)]�j`lP<�u�:����s)�7�'�y�r���?�cb@���{	��/�sFTyԃ�I�0�^���W����D�'��,�ߞ>�6:����~l�U���!_/���6b��4���!]::�C�����7n� ?�����
�����鎮�Q\zP@��6�g~��C��M<M�T�I�~�o����      �   R   x�3�4��M��LKL.)-J��".#N#Δ�⒢̤Ғ�"��1�1griqI~n*LȄӄ��$1-�7�4�L�G����� ���      �   X   x�u��	�0��ni !o�u�����������(Ҙ{����u��$^������TM���%:��#� ���rE
��c��2�      �      x������ � �      �      x������ � �      �   �   x�u�K
�0D��a�Fr�Y�]t�eS�RB�O��JݏA���@��* �`�O�����f:^�1�2� /\�,?�q�~h���n����'�x6<�,��\_H���S����w�Ui����l&�W�C��t��Z5퍎MzM*�ֿ�ċxp�=@V_"      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �      x������ � �      �     x��Z�n����z
�@��_�+Jܢ)P��S8p����ƢQJ�<}gvW�p%J�sNi{��H����Y2&�MI)���yQ�gӇ9�Z[��p8���_�&�q1!�4x��k�ruW,��b��Ȼb^ݏ��rM��)���S._P���19u��P�
����Vw��]�G�j2���0��\����u]��u�e�l���x9����~<-�u3��Uˢ"���)W��}�D�\f�����^u5%�M&��o`Er���ț���T庸'WU�ZV֫�%y�8)�U�+�`��-|����¯ŧOES��岘�_�Ky A�ќ�\�L)*�8_ [�^>|��� ���ǯ�������XR�~��>>޶�D�؀��̘�hl&������[���bĎ[7�.T�u|�z��'��c>�r�3�����7��5G���}���^�nGL�Xʘ�SK0lGk%�g?����#^�3�K
j��l�Ѭ���������.���SE=�ꗀf�Կ�GQX��n|,��ʢm��P���
�L��>gc�r�s�2�,Eu�'D�J^��w/b2m}Z��3��4��CV�FZ�)�G�Ⱥ�P&#QpЧu�Am�ɝ<u�����)<L�.�5P�J+���c>�%Ôn�a�෻����]D���N��J���ei�g���-�4��n��YY���RaO3SaLǩGx?�@a&,�"�tP؍�_����f��T����2�u�-Wn>d�:*�A�p�Koʓ�)X�zvP�ʀ����򌂃��z�����re��}-�E2�e?><=-�}G�9���!�S�C�o������q���q<����.�R�Bˣa�t�A9+#�?u)i_C2Da�At���l�h&$`u�*�+��z}�����Wvd~w�" H\=79�7�)�v�� LA��*�GB	��",��C��\"��m�=@&nLYNu.h�8Ԕ�= %sD����^JF~~���IH��:a�
0��8�RE.tƸ�j�;��HZ�i �|�i. x�LC2g"AZ�@��i0�eΠ����#vqq��� ��l�4w>�����|i,]�����P�����|�|0�N!�d��� lsH�6WP�LX��[��]U�x')I����{N�=�����`ݛ���>�~-�6
�:7&�*��h���ѹ���Bd�*��;%@@Q����/�L*Y�88�}xH@��C즅␦��=��-��M�<��T�˽��a|��y�(��:U!u�(��:"���|:�<�n��C�#d&��K��y�Qa��X�a��# �|>,�`U}P�nA�c��Z��1��%*3E%۪Ï;:"��WAu����}Q��2��?��n�x��#��zQ�Y��?���r9k��Jo���6+��,��4��lU�	4��$���% t�, ~w�ع�}��.�"�\��z�E�s�wx/��|�w*�p�Y�Z��X&��N�P�F�P��8����N�j�/�ΐ��]6�b=T�'�{+�aq�����Zi��8kɟc�����y�U2�?	Q]f�����?��5��?�7���t�"�V�|k�M �,'�X�k)����:�,$��O6׽�\Zw���G<�A-˝�W*b� �.#e;{�G7� +�q�3�k���ƋG�q�����b����2H���(
�����:�K�h����^�RxOQ$����'ce���_�#���>�l Fj�u	0tޅ�(�n���I�G�bD)�{V�f ��cO�	{��x��Sw�����Ya���Z�e�<��@��23���ڤH��n�� EG�%����Ƥ��*t9��`\;���J���nҖ��+�w��t����m���7��g`�36���Q��VW���u��^�ѷ�6�Z�/k`���J�r�u{s.ϯ{���ܸ�/���~��}f����T͉$����!������d��[��������l4�P���      �      x��}�r\Ǒ���S����V��5�5��F�w��Fl8b&`	c�	ʲ���Y� ĥ��ϭ�AӀD�����{~)����v�u�������������>�r����<�������/;������<]��OL�?���hnn��r�M��q/������hpH��y��?�~����9�t�����"����v��������@��Gt��)� �*^���i/�1dU��������G!l(�{q��>� �
^&����0F��F�k@8(�=Fǘs�+�L
��@�)T!���;�]�L\=
P����Tm͔p�\�C������C�!��y�ݍ�����4Sa/�:�E
�(B�L,�D4I�� �ړ|�.�e �,�DR?i�SyD�8񩡢hɜc@O^u�y��b��������U�հ
�K_Rs�稆��
	�!=!�]���v�������yNA?CU1a���	i�٥�&�@<p��#B>&�B9�%���j�T���˦�խ��$A���*�.�ț×����}H����)�x��U|�>1È�9Vf<d΁��\Ǘj�`K|��B�������<`2+瓈��������(@u2A�������!W������1�F�j:�:�O�^��'8����9 ���i y��
_����j$N�~���<�и��s�O��1�����w�3��EˍĬ�+���DR���[n$f�`!3b�=���e�����7�Nu��:��qƜ�W�Y��C�j(�ҿg�{��9T�du��S���zʔ��ŗ�OvI]И������[���Cr=��~��{ C=͋��l|"V��P��t9��C�o�\28w���]V�[����~̔���jߤ�_�b�<�K��$�N��5��I��*�jh+���t^�����^�9�z��Z<�F�9�m�F�p�怶rO�^Լ�#R�WW/�������r���[���)��s���/tI��\Mu�E�_������	3W�o�V6��}tY�������<K���b�~�~�2�u
�}�����-|S|TwOC�>��߬�7W���%9�����ԥ��z(>u��"XO�.ɡ��9%��j=b��ЀO�7��z�����L|aޥ��#vI|d��|��������-y"��w�D��R�P��b��#�q����w�G�����z�>vI�؁��u��%9d��=*>�����r�1�~���-��U�d?0Z�%D��K˃�Y�C�g�3�:�.��h�)��i���S�أ�c�����%�(�4�N,����4=���=��j�T�x�U圖�����������yZl<f�l�)e�ze0u2�O�cJU�/w�,���TO�^�#[p���:�ς��U����|��o�땙ܥ2=��.�/R���.�G��m��8�F�(w��RW�jxY�ץ�1����z�u���T�Qr(s}ҬK�*��:������<R� ��{�]H�WJӘSU��_^��+@s�3��(�_nB�JP�C��A��X� ʞщ�'��w� ��7��F|�H(���c݋ߥ�,��Q����SF�{ّ`~��>)�{�0'��+�^����Wo��eI����Q��@/KR ��j��K� ��
��K4�0��KuKrp��<gP�j5�;ܥk����&eA�p�Ժ�9����H4�' ���*�<����	K�.�`r�	S�/�'A�V/�����Dl��*69&
u-���4���7�dG�4��Ni-(S���e<{Q��O6�lc�!��ݠ>׽���
�d�P�e��e�� E5�C]xvK�`��ʀ���p,M[~�9�< dڣw��S�� *	���|����ן����_�#*"��?X�L�v����|�t�����?����w�?^����w���/�b����-�G�X�����\��^����S��l�h��>װ�B�i�3�
�'8I�DV́���6+M�zP�z�kJ�FH 1�X�L=ć��=��-gz�o
s��ܓ�l���pU���}��&V�p,���P:7u�uDm�"�h���,W���@r����[����:�Rצs�䚗H#��1:�_�*/�D3�P�k���q hW~����h~���E5��	�>ꉟ�v�>'�a)�8�j�2W�����R�h�E�޿\�J�����a�|!2ȑ[�"��N�����h�&��G�P�Tp���V�vXz�*%�zn���\=��_K���mjN�ϡ�\�Ϭ���eP�SjP����S�UɸY�`&���\T<�-�`iq��\�����4��R�c������y�`!�h8DR�<�����V3��x�E?��?
�콂=��rM���cj�s�1�"ץ�m>�l�V����L����v�
X�֤b�F�q��5����g�R��^�0��lO�{�(���}u�6��o ��d�7�{S�3�aF��`�R�č�-�L���g���m�T�e��A��H�x��>�e�#["���Q%��P�!���2�'�TL���ې�q�v��:K�5��2��"6�!o��� ����+ը,��q�~;�pPVK�ꣻFk���sZLR�ϸC�n}*^c�	��Q�R��"Q4�
�,��;PǱyD�ۛ�+�1�r�#6r1,&y>���� D޳i��j0���4�_���u4n�*���9�(>�H����]�'�<{��AZ���w�
�^��PC��w�l �e��Y���Z O�Zq��!$�/P�B�vHvKm\�|�y���v��F��˛� %;�{���*��:3��Iu
aH�+?+)�l��۫�z!3��y��Ro3�
�eh,��k�ъD�d�
X�ͤ.z���g��k]n�T?/B�z^�:�*��KP��Ǌ����գ����-�I�,�d��q�����<
�)C,\�)H���ˣ��2,d����ƄI>�\�L2��|Ah��|:�K���a����5�3_�-�rɇP�+@�^8���X�x�c/�U�@"׽6��߱��urF�_k����L��@N��.@�ܼ̔a4��Qb�*���lFş�����*���l���R�c���e�KR@���>��`�\S\�'p	�L*^�4�K��$+���'�.!��|����/Ұ���dϝ�jΆdW)���jHq�l�D�� }�֏�u�4�~/Sd ����vA�e�apY ��p��ͼ�H!O�(��3.�1?/�k ���M�1G��ϐ>�z�TOO#B7	��C�6W�-�<_��ň�aPSx��&�{[�P��s�I�Z��Z�P�]�Z�;�th4��%��5��"�P'^B���;9�ƒ�URj�<_��Z3�:{�*�2�WlÇ��S}w�m��/�h�e���R�1
}c%R��ũ����%�.N$'ƈԐ�t�PXƱ(��eJ���i!����Ah�m����N6�A��4�4^1l���w�g��b���}�8�trLЗ�xv י�~f�%�O,�Y�Q���� �B����xs�*ɸeJ�K$rj�t�3bp���>�F��7���G�Aug�SB��}p���\�:듀8�t���@kw%���o� ��P�[G���f@��Jbj���t�8NR��]6��9�8�>׹7P�?���@}��"'���m������̡���yȱ%���@���;�VPz��`�F�,67�_�ƹ1�V@.��M0~"�޻��Q��
01���1�(�� mݥJ�~IB��� P�3B���>��%���`�Q�1�e�s�Q����"|��߸"���<w���i�
0�F�@�eG
;�E���I�eGl���R#r��H�a�Ǻ���|hm۶��� j�B�[{�h�`��j&�3$0���n��"�h�j���ϒ`p L5�Y�P��?��,	f��4Z�b?KB�$Rl�X�~�� ���7L]	�reV| �6��    Ő�X�9HÙI�4=/��`���'�nz��E����]�;X��9�:q��- h�,fw�׫mi���`�������<��ݯ uBL=Z�`*	(���H]�� �P��� s?�'��9�i�1��z3��> f�<�#_+@���w�fW��y����5�YURL�n�ܵ �Ύ�m���z�={�G�*�@\��ܳgz ��(�~Xgϖ������ړg�o^bnr��G�9A(�.��t0�$�	�/��f������C�ǰ�Uq�ǚ�{�EP��XoLch�|����������V��������RWC�W�óL�䄃�Uo����U�Xc�zK�U:��I43���!/��@���JT��|�#�d���	��|���Lm�\�wHе=ڨ���#'�zM���a�{�N���K�\��G��]J撨�}]�Bo�Txi<R�j�N��.%�=�����v���x�T/���Ke�(�M�W�bo�T��@��W��S&7B�{���aJ�������6L��=�4�c�o��w�������z�!6���7L(�'���@���*�l�](����7�JJ�]H�F��AH�H4��i�d����#��Q	Z��`YI��f�b}��7�� �x8�]��@�.�������m�PlJ��mt��H��:���=z�5I\_�A�,{��]���n�s��@5�"�7Z��`���R=֓�}"D��%�a�z�1�rF�y�o�ϡ���:��m��/g��-C�ܢH���ap���N>H�ea����e�Pב�e_���:�.�F�ѩ^�:�q�}	B��}����˾C����>tO�<��)C.�"J�f�%\��Xo2�u��	�j��\X"�`Q�a$�:�-I��P��ܨ�J��P�(G��1�`Q����NJҗ���0'���[:���q������tH�����<��//�#V�fH�2t�eg��E�����^vFj�Ϝ���}�iزL1��h�}�i�`!������ʸ�bɢ-�A_���w^�	����Ԓ�%�l�h��Ǡ０����M�b}�&���-`Q�����@�	l��>@B�î�'�F��>�A�î�'��=�F�v�+�	�j#��H����28$h,X�ء��P�d�u&/�[��0���_}ߨ�ƾ�kU�2W���'�%}������'�%�'�����ؗ��o=Tu:rJ}LAFG�CáH}�%��+��A�7����@��D���:��.9��ZÄ6j�L��@P!T��	�uXf��l�lLtfIx���:����,���{�u5�a����LF��E�?������O?�|��t��A������_�?���IʡႪwe���x�O���Ԧ*�K)Ic� C~�QLCM����ܓ��L���V�{?S��������k�9^�9X�J�o���0%�ʦ�ca�'��ׁ���)PaK�I.�]�w(����A���1&þo�����]�u���u{��5��e;�����X�b.BG��*i,�u?�}� I��Y�!�k���I:�՜S˄�-��\�/*�:�*k)�x4t�#P��h3b�g㞀��Y2V�z�U�R̗��R 
\O�2l���T�щ^'��[�m����5��q�ظ�з��֖F���"Cߪ�#ز��Q!d�[t{����Գr#���ݲ�Sn����N�����bƮv� �;e���!�]�� 
�z�c�6�,Y�^`�A��w6�E��v�*�0XR��שT/�`ز#�[h�j�>������3����&�����w_�a7�����/�+������ۇ������/��>~�|�b ������×��/�ןnw�ox�rw�+�A������4+���d��X�r�Z�
[��_ٛT��π�_E���u蜟0iÛ�����|+ƿ|�:��!%o iw���ۇ���|}?�4~ ���
��'��`����	��G���7������;�Ҍ�'�����>>���;���Z�l!*���f��O�$��~z�>?�֜�@'@e�������!����ҿ����A/d�U��}�G[����%���n�}E���C������d���K�O�����Ue�=ؚ���+�
>�)�B�:+/ߐ>��C�PL�u�:^�"}� �eTC��(\uX�^ b4	fL�����W�ϓ�M�㐨QE�N�&c�����'LĿ�����>q�� ;�ENDH�#�ӡ�E����>��� �f���b���t��2������O~��/%�?2\B�:ܭ�K���.)�>6_N}:�7N�+ݾ����ݷ啖�K]��_~9�VmD�,%r�A��q���ץ��������M%PȾ>��;\%T<��2���W��H�ي�o��XB�'��Hq�ɹ#ũ �O@7a�)N��.$R��;o�MĐ|�@l*V��M��2MLLH)N}�)N�,}#ũpWY11R��1^F�8�E�Lݭ�y"м�j����T��!R\;��!��q����Iq�q��)����q>{��m#�H����V:�~�9�F^᳓��N��9_��*�mY,���N�Q��1�����9@��q�RH� 6��ħ݇��|=A�~��o��0��-̓���9"��M��s�OV n�w���������3�Y���*��olV�l�Vǥ�>2*�� �i19u��[�}ߗlQ$�����-s���30d��#��ҏi�6\$�o�O�:Y�����S�^Y϶q�~�P܃y����i�VP�b�}�=`\�U����l���T�xS����r}Op@����=���7n��(1��q6��+��H?0��pS:~]3%0M�l�"Q��:U�`^o���%_7:�"�*Ռ����Q��4dj��
����/s�C�R���Ի�����ܲ�*�N辁; ��k7����Ԑ.��P|�?��{U]��x��IR]U_�&$[�_����H�������R�����p�R2^�챱[(�تJ��_&6۩�h$u��]h���ֻ��҂un1q#h��%~����Gʅ}_�zJ#�떖����a@-�ڠ�����W�P'�o�'�z{a/�ebQ}�:��v��&z,5[�+�!_�Ar>z��x�e�Wʢr� ��/ /3!E�nݯ�i��2h,���+�hK�Y�17���=F{���y
1�-��e����DPoC��f/��덾"+Y���M�!Ah�r	�l���Q}VWg��u[��'��oԛ����5�]#F��8�+Y���m��g}ݍ��UR�+�M8���M��\�qˠkX���;g��������3	+Y���!X}�s��V2nK�,1")p}���K�
^�I"�˕�2���.�o�H��K�`Oj,�#ϱʇ�0n��Q��mv�m����k.¸\�f!�o߼Nyx9^�f����W�}C$z
�`�Su�S�BD���p��9�z4�W��D��n���\H]W�\H]��Yn�>��WWNE�:�N��/e�p�䷘!��z�N�z9ų)�����D�|��ǉ ��&B��p'�7[:�	�̖N��;ϖN�;��{�t"�s,=]�����t��҉��mϚ
�2R������?�6,O�B�gn�]7]HG�̹���k���tU��l�c���+��� ��B�IPȟ�ui�a������j�R� s��C�(э�`Β��3퉝`��f�0���b����g@[$��	�;^���|�	���#�񻔏#1������Ç_��l����_�������������~�����׏��=� ={���_�>�}�=X>���_���ݏ�~��NE$�E�\�
��9.B��Ld�LC@�l�`�"�|��=�lT;��h���&.͙��aфB��	�F�I���k�F��6����ׅ���1�ac=16���Gm��R?_P=�2��.0N�I�n��`���r�
I�"����\Hx�7ʤ���1m.#z�2*=#b+� �  '�H�3GJ|	��A������^���{�Ȼ߿=$��Fػ��D�����vl��6�G��n��
�_�OUDC�e�'�������?�n~��a��V�,p��&�c�F�C kX���,��;�&�d�D�捚mv6����B��Eّ�_��w�?*�I�l<zp��� 4v/�_���>�2���;"v�P�E�G�2�,���G��.�7��xV����"�����q{�
�
;w���N�BS)Q}�&������nPT ���|0�o)ti~D:L���_���G�����ݟ���W�����iޞ6�3��c�]yF��=9]�H�L������&����Cy|�Ā?,���^��������U�5�'���7����_�2|��/���$�94,�^������5^��o�9%<9��m�������ȋ���A-�pE�� �B1���f�������l���������Z��&�8��''I'��1$���Q^�~�,)�_��ӕ|q��n�Kr��{���cH>F�M�>�x.���W6t��?��X�~D�b�^���B���/���;tb^��"���蓤Ҟ�	dKER���hI�B΂���	*.�F��"8�D��C%��i���J<B`V��ȗi�^?O����%���5�f�ط��$�h�m����M���Ĝ4�t9�I�z�q�\�۔��s֣S޳��$s���Z��L�ӟ����$a43������O�Ffc�#���g���O�Ė���@�PI ��(����Ķ�dIF��y~�Optx��Q��BGr�1�1xKG���=�1ykI����O1���Q�;X+6z��y���$
INW<���E�7s,d ����e/6;���B��;��<=��"����ӓs��~�"�aNz���qE���
qy
��+�%�'a���TZ�$�sL}͓�m�q�����.�b7�Z_������w�8�����7��MgX�1��}��ʏ#�G����qlȅS2��/iX�Ǌ�TѮ����xP[U��ûA����jE�%w�W,gx�����(D+�W�Y�Z�eX��XP!fj`	�oo��%�}����14Ќ!8��VU����a1��������ׯ��`o[3&�c�����`)�į��G0�i���~�9 %e��ڋ*�g��4����B~�
��{Z��L��'�e�0�
��q��f��� >穯�<��{>�{��� Y�̳�Ir�y���.��_]��՞.�hdS*'�p9���r2��v'"�Z��zr
�VN��^x��Զ�/mM�m�D%DP����1]���Ï�l5Ĝ��pZ�e�w+'��e_M=�&��ߩ�Ĳ�s���''���c��؛?|�n"ْ�ɇc(�;=1�*����,�"]��vDN�V)!�j������ݴcr"�@J� �s�.�M;&�`n�Eer9��)'6��y[z9�SOҲP�0G�9��ީ'i�2��t�g��y�$i雸Ĵ��Dg7�\�}%�R��p�R:|��u>qԷ����D)ổ���k��D.�#y�"<����J�E����(-�i��T��z���Ǆ�����fj�,R{t��,&��/S��F����OEW&̟���ߝ2X��EK�
�.0D}S�H z?��a�vZ��é��<P�IFC��Y&%>a9��tHE��4�2��@3L<~[���T� UFQ�p��[2~[�j ��-`�c���` /@x[����3����� غز�N|�
��� A��A�u�,�iO���)�^�#=чU��:�#��C�[h�Wg@Cd�>s��ZW'm/ ��F���K1��m�;�
!
�E֨)������1�N�=�
���0[�c�~l�9%��
��!�ӎa���RNq֧c`��^��ıl�~���R�P�n5�# ˂0~� D�E�������@"����\�y	c<z.���[Y�ilQ���~<�:C�k=zjE	�u�yk1t$� ���gHE�p��}���q"��G_:��e��7���8^m���{��&Y�Z���H;���[�yA����K8�~�z.�Є�������c:*���ڰ���Չ
G���H�2��o
Ko�����#��)�J�-�c���Nq�`���co��|�I{�Nlf��)���!Kة%͖�;�����#��'t�����q����'F�����L�Z0���H��_g�X�b������kj�#;P�����,�nY֣ÈO�8=���P�.}~6���H�3���?|��:��?����;�x���oU���ǲ�(K�Յc�Ϸ?� P���(���U�o��9���6�`�Crcy��ҟ�l�=�l���7 �~��z!{5"H�@�+�p ��W��� 1n���\��g:�����=�U��i+�S&8�E���x�����0�*5� ���-F���ɓ�@��QU�|��YVf��N!4�<�%�N��zTG{��4[%�r�'!�w��a���q�H���xب�tS���d1�Ihx쌰D�e�/��Hز-/������O�w����p�嗫Ϸ�)���>^�񧇫Ǟ��{��\�!������3�\�N,�nF�,Z�^��,s/��Rq��ע��C� /�:)��Z����e�&��h��۟�G�@��V2Vт��E4/e��t��{���\����=�r:�Fsȶ���ᤶ�v�L����q��:}9���?�G�~;|�`�!��Q��\䇟�o4P�th�������x� 9&�T
z�}�r���|����#�1�"*��k��E�TγSI�hH���xL@��÷����lX�6z:Ŀ���3m��i�ŲF1�����?~��<���`x�dы�.B�Bx~;��&<4���':���;;y��G6�J)���)�����ww������7L��Oe�Hv��c���E�뀀;f��{;f�(�pɛ��Q�8=ڨ_gɳ�W���U�������x;�v���o~���1�-��^�R�L����`�^�y��μ8��4�'i��^��[�O��p�p-Ͳ��p�w��R�D�=�p���!<�'ٺ	N���],�4�,O8G��|'���|je����7�|���UZ     