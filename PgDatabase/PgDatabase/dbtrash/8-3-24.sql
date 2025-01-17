PGDMP     4                    |            terion_billing    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    38189    terion_billing    DATABASE     �   CREATE DATABASE terion_billing WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE terion_billing;
                postgres    false                        1255    38190    accesscontrolllog()    FUNCTION     =  CREATE FUNCTION public.accesscontrolllog() RETURNS trigger
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
       public          postgres    false                       1255    38191    credentialslog()    FUNCTION     �  CREATE FUNCTION public.credentialslog() RETURNS trigger
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
       public          postgres    false                       1255    38192    districtlog()    FUNCTION     W  CREATE FUNCTION public.districtlog() RETURNS trigger
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
       public          postgres    false                       1255    38193    invoicelog()    FUNCTION     t  CREATE FUNCTION public.invoicelog() RETURNS trigger
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
       public          postgres    false                       1255    38194    positionlog()    FUNCTION     Q  CREATE FUNCTION public.positionlog() RETURNS trigger
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
       public          postgres    false                       1255    38195    previlagelog()    FUNCTION     [  CREATE FUNCTION public.previlagelog() RETURNS trigger
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
       public          postgres    false                       1255    38196 
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
       public          postgres    false                       1255    38197 	   userlog()    FUNCTION     F
  CREATE FUNCTION public.userlog() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO usertrigger(userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,dateandtime,organizationname,gstno,bussinesstype,fname,lname,upiid,bankname,bankaccno,passbookimg,accholdername,ifsccode)
	VALUES( NEW.userid, NEW.email, NEW.phno, NEW.aadhar,NEW.pan, NEW.positionid, NEW.adminid, NEW.updatedby, NEW.status, NEW.userprofile, NEW.pstreetname, NEW.pdistrictid, NEW.pstateid, NEW.ppostalcode, NEW.cstreetname, NEW.cdistrictid, NEW.cstateid, NEW.cpostalcode,'insert',current_timestamp,NEW.organizationname,NEW.gstnno,NEW.bussinesstype,NEW.fname,NEW.lname,NEW.upiid,NEW.bankname,NEW.bankaccno,NEW.passbookimg,NEW.accholdername,NEW.ifsccode);
   
   ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO usertrigger( userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,dateandtime,organizationname,gstno,bussinesstype,fname,lname,upiid,bankname,bankaccno,passbookimg,accholdername,ifsccode)
	VALUES( OLD.userid, OLD.email, OLD.phno, OLD.aadhar,OLD.pan, OLD.positionid, OLD.adminid,OLD.updatedby, OLD.status, OLD.userprofile, OLD.pstreetname, OLD.pdistrictid, OLD.pstateid, OLD.ppostalcode, OLD.cstreetname, OLD.cdistrictid, OLD.cstateid, OLD.cpostalcode,'delete',current_timestamp,OLD.organizationname,OLD.gstnno,OLD.bussinesstype,OLD.fname,OLD.lname,OLD.upiid,OLD.bankname,OLD.bankaccno,OLD.passbookimg,OLD.accholdername,OLD.ifsccode);
     
	 ELSIF TG_OP = 'UPDATE' THEN
       
        INSERT INTO usertrigger( userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,dateandtime,organizationname,gstno,bussinesstype,fname,lname,upiid,bankname,bankaccno,passbookimg,accholdername,ifsccode)
	VALUES( NEW.userid, NEW.email, NEW.phno, NEW.aadhar,NEW.pan, NEW.positionid, NEW.adminid, NEW.updatedby, NEW.status, NEW.userprofile, NEW.pstreetname, NEW.pdistrictid, NEW.pstateid, NEW.ppostalcode, NEW.cstreetname, NEW.cdistrictid, NEW.cstateid, NEW.cpostalcode,'update',current_timestamp,NEW.organizationname,NEW.gstnno,NEW.bussinesstype,NEW.fname,NEW.lname,NEW.upiid,NEW.bankname,NEW.bankaccno,NEW.passbookimg,NEW.accholdername,NEW.ifsccode);
   
		END IF;
    
    
    RETURN OLD; 
END;
$$;
     DROP FUNCTION public.userlog();
       public          postgres    false            �            1259    38198    accesscontroll    TABLE     X  CREATE TABLE public.accesscontroll (
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
       public         heap    postgres    false            �            1259    38203    accesscontroll_rno_seq    SEQUENCE     �   ALTER TABLE public.accesscontroll ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesscontroll_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    38204    accesscontroltrigger    TABLE     �  CREATE TABLE public.accesscontroltrigger (
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
       public         heap    postgres    false            �            1259    38209    accesscontroltrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.accesscontroltrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesscontroltrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    38210    credentials    TABLE     �   CREATE TABLE public.credentials (
    rno integer NOT NULL,
    userid character varying(20),
    username character varying,
    password character varying,
    lastupdatedby character varying,
    updatedon character varying
);
    DROP TABLE public.credentials;
       public         heap    postgres    false            �            1259    38215    credentials_rno_seq    SEQUENCE     �   ALTER TABLE public.credentials ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credentials_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    38216    credentialstrigger    TABLE     >  CREATE TABLE public.credentialstrigger (
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
       public         heap    postgres    false            �            1259    38221    credentialstrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.credentialstrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credentialstrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    38222    district    TABLE     �   CREATE TABLE public.district (
    rno integer NOT NULL,
    stateid character varying(6),
    districtid character varying(6),
    districtcode character varying(6),
    districtname character varying(50)
);
    DROP TABLE public.district;
       public         heap    postgres    false            �            1259    38225    district_rno_seq    SEQUENCE     �   ALTER TABLE public.district ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.district_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    38226    districttrigger    TABLE     -  CREATE TABLE public.districttrigger (
    rno integer NOT NULL,
    stateid character varying(6),
    districtid character varying(6),
    districtcode character varying(6),
    districtname character varying(50),
    operation character varying(10),
    dateandtime timestamp(6) without time zone
);
 #   DROP TABLE public.districttrigger;
       public         heap    postgres    false            �            1259    38229    districttrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.districttrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.districttrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    38230    feedback    TABLE     y   CREATE TABLE public.feedback (
    rno integer NOT NULL,
    userid character varying,
    feedback character varying
);
    DROP TABLE public.feedback;
       public         heap    postgres    false            �            1259    38235    feedback_rno_seq    SEQUENCE     �   ALTER TABLE public.feedback ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.feedback_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    38236    invoice    TABLE     6  CREATE TABLE public.invoice (
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
       public         heap    postgres    false            �            1259    38242    invoice_id_seq    SEQUENCE     y   CREATE SEQUENCE public.invoice_id_seq
    START WITH 1000
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.invoice_id_seq;
       public          postgres    false    228            �           0    0    invoice_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.invoice_id_seq OWNED BY public.invoice.invoiceid;
          public          postgres    false    229            �            1259    38243    invoice_rno_seq    SEQUENCE     �   ALTER TABLE public.invoice ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoice_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    38244    invoiceitem    TABLE     H  CREATE TABLE public.invoiceitem (
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
       public         heap    postgres    false            �            1259    38249    invoiceitem_rno_seq    SEQUENCE     �   ALTER TABLE public.invoiceitem ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoiceitem_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    231            �            1259    38250    invoiceslip    TABLE     �  CREATE TABLE public.invoiceslip (
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
       public         heap    postgres    false            �            1259    38255    invoiceslip_rno_seq    SEQUENCE     �   ALTER TABLE public.invoiceslip ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoiceslip_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    233            �            1259    38256    invoicetrigger    TABLE     �  CREATE TABLE public.invoicetrigger (
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
       public         heap    postgres    false            �            1259    38261    invoicetrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.invoicetrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoicetrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    38262    position    TABLE     �   CREATE TABLE public."position" (
    rno integer NOT NULL,
    positionid character varying,
    "position" character varying,
    lastupdatedby character varying,
    updatedon character varying
);
    DROP TABLE public."position";
       public         heap    postgres    false            �            1259    38267    position_rno_seq    SEQUENCE     �   ALTER TABLE public."position" ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.position_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    38268    positiontrigger    TABLE       CREATE TABLE public.positiontrigger (
    rno integer NOT NULL,
    positionid character varying,
    "position" character varying,
    lastupdatedby character varying,
    updatedon character varying,
    operation character varying,
    dateandtime timestamp(6) without time zone
);
 #   DROP TABLE public.positiontrigger;
       public         heap    postgres    false            �            1259    38273    positiontrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.positiontrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.positiontrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    239            �            1259    38274 	   previlage    TABLE     �   CREATE TABLE public.previlage (
    rno integer NOT NULL,
    previlageid character varying,
    previlage character varying,
    lastupdatedby character varying,
    updatedon character varying
);
    DROP TABLE public.previlage;
       public         heap    postgres    false            �            1259    38279    previlage_rno_seq    SEQUENCE     �   ALTER TABLE public.previlage ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.previlage_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    38280    previlagetrigger    TABLE       CREATE TABLE public.previlagetrigger (
    rno integer NOT NULL,
    previlageid character varying,
    previlage character varying,
    lastupdatedby character varying,
    updatedon character varying,
    operation character varying,
    dateandtime timestamp(6) without time zone
);
 $   DROP TABLE public.previlagetrigger;
       public         heap    postgres    false            �            1259    38285    previlagetrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.previlagetrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.previlagetrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    243            �            1259    38286    products    TABLE     �  CREATE TABLE public.products (
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
       public         heap    postgres    false            �            1259    38291    products_rno_seq    SEQUENCE     �   ALTER TABLE public.products ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    245            �            1259    38292    state    TABLE     �   CREATE TABLE public.state (
    rno integer NOT NULL,
    stateid character varying,
    statecode character varying,
    statename character varying,
    lastupdatedby character varying,
    updatedon character varying
);
    DROP TABLE public.state;
       public         heap    postgres    false            �            1259    38297    state_rno_seq    SEQUENCE     �   ALTER TABLE public.state ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.state_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    247            �            1259    38298    statetrigger    TABLE     7  CREATE TABLE public.statetrigger (
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
       public         heap    postgres    false            �            1259    38303    statetrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.statetrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.statetrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    249            �            1259    38304    user    TABLE     D  CREATE TABLE public."user" (
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
    passbookimg character varying,
    accholdername character varying,
    ifsccode character varying
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    38310    user_rno_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    251            �            1259    38311    user_user_id_seq    SEQUENCE     |   CREATE SEQUENCE public.user_user_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_user_id_seq;
       public          postgres    false    251            �           0    0    user_user_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".userid;
          public          postgres    false    253            �            1259    38312    usertrigger    TABLE     c  CREATE TABLE public.usertrigger (
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
    passbookimg character varying,
    accholdername character varying,
    ifsccode character varying
);
    DROP TABLE public.usertrigger;
       public         heap    postgres    false            �            1259    38317    usertrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.usertrigger ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usertrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    254            �           2604    38318    invoice invoiceid    DEFAULT     �   ALTER TABLE ONLY public.invoice ALTER COLUMN invoiceid SET DEFAULT ('INVOICE'::text || nextval('public.invoice_id_seq'::regclass));
 @   ALTER TABLE public.invoice ALTER COLUMN invoiceid DROP DEFAULT;
       public          postgres    false    229    228            �           2604    38319    user userid    DEFAULT     |   ALTER TABLE ONLY public."user" ALTER COLUMN userid SET DEFAULT ('U'::text || nextval('public.user_user_id_seq'::regclass));
 <   ALTER TABLE public."user" ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    253    251            �          0    38198    accesscontroll 
   TABLE DATA           �   COPY public.accesscontroll (rno, distributer, product, invoicegenerator, userid, customer, staff, invoicepayslip, d_staff) FROM stdin;
    public          postgres    false    214   q�       �          0    38204    accesscontroltrigger 
   TABLE DATA           �   COPY public.accesscontroltrigger (rno, distributer, product, invoicegenerator, userid, customer, staff, operation, dateandtime, invoicepayslip, d_staff) FROM stdin;
    public          postgres    false    216   ^�       �          0    38210    credentials 
   TABLE DATA           `   COPY public.credentials (rno, userid, username, password, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    218   ��       �          0    38216    credentialstrigger 
   TABLE DATA              COPY public.credentialstrigger (rno, userid, username, password, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    220   ��       �          0    38222    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   ��       �          0    38226    districttrigger 
   TABLE DATA           w   COPY public.districttrigger (rno, stateid, districtid, districtcode, districtname, operation, dateandtime) FROM stdin;
    public          postgres    false    224   ��       �          0    38230    feedback 
   TABLE DATA           9   COPY public.feedback (rno, userid, feedback) FROM stdin;
    public          postgres    false    226   ��       �          0    38236    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, senderstatus, date, reciverstatus, transactionid) FROM stdin;
    public          postgres    false    228   �       �          0    38244    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, updatedon, hsncode) FROM stdin;
    public          postgres    false    231   ��       �          0    38250    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    233   ��       �          0    38256    invoicetrigger 
   TABLE DATA           �   COPY public.invoicetrigger (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    235   �       �          0    38262    position 
   TABLE DATA           [   COPY public."position" (rno, positionid, "position", lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    237   @      �          0    38268    positiontrigger 
   TABLE DATA           x   COPY public.positiontrigger (rno, positionid, "position", lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    239   �      �          0    38274 	   previlage 
   TABLE DATA           Z   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    241   
      �          0    38280    previlagetrigger 
   TABLE DATA           y   COPY public.previlagetrigger (rno, previlageid, previlage, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    243   '      �          0    38286    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, "Lastupdatedby", updatedon, productname, belongsto, status, batchno, cgst, sgst) FROM stdin;
    public          postgres    false    245   D      �          0    38292    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    247   �      �          0    38298    statetrigger 
   TABLE DATA           |   COPY public.statetrigger (rno, stateid, statecode, statename, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    249   O      �          0    38304    user 
   TABLE DATA           b  COPY public."user" (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon, organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg, accholdername, ifsccode) FROM stdin;
    public          postgres    false    251   l      �          0    38312    usertrigger 
   TABLE DATA           ~  COPY public.usertrigger (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, dateandtime, organizationname, gstno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg, accholdername, ifsccode) FROM stdin;
    public          postgres    false    254   Y!      �           0    0    accesscontroll_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 87, true);
          public          postgres    false    215            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 221, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.credentials_rno_seq', 100, true);
          public          postgres    false    219            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 160, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    districttrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.districttrigger_rno_seq', 1, false);
          public          postgres    false    225            �           0    0    feedback_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.feedback_rno_seq', 5, true);
          public          postgres    false    227            �           0    0    invoice_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_id_seq', 1265, true);
          public          postgres    false    229            �           0    0    invoice_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_rno_seq', 296, true);
          public          postgres    false    230            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 293, true);
          public          postgres    false    232            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    234            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 452, true);
          public          postgres    false    236            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 5, true);
          public          postgres    false    238            �           0    0    positiontrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.positiontrigger_rno_seq', 2, true);
          public          postgres    false    240            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    242            �           0    0    previlagetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.previlagetrigger_rno_seq', 1, false);
          public          postgres    false    244            �           0    0    products_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.products_rno_seq', 125, true);
          public          postgres    false    246            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    248            �           0    0    statetrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.statetrigger_rno_seq', 1, false);
          public          postgres    false    250            �           0    0    user_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.user_rno_seq', 201, true);
          public          postgres    false    252            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    253            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 838, true);
          public          postgres    false    255            �           2606    38321 "   accesscontroll accesscontroll_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.accesscontroll
    ADD CONSTRAINT accesscontroll_pkey PRIMARY KEY (rno);
 L   ALTER TABLE ONLY public.accesscontroll DROP CONSTRAINT accesscontroll_pkey;
       public            postgres    false    214            �           2606    38323 .   accesscontroltrigger accesscontroltrigger_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.accesscontroltrigger
    ADD CONSTRAINT accesscontroltrigger_pkey PRIMARY KEY (rno);
 X   ALTER TABLE ONLY public.accesscontroltrigger DROP CONSTRAINT accesscontroltrigger_pkey;
       public            postgres    false    216            �           2606    38325    credentials credentials_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.credentials DROP CONSTRAINT credentials_pkey;
       public            postgres    false    218            �           2606    38327 *   credentialstrigger credentialstrigger_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.credentialstrigger
    ADD CONSTRAINT credentialstrigger_pkey PRIMARY KEY (rno);
 T   ALTER TABLE ONLY public.credentialstrigger DROP CONSTRAINT credentialstrigger_pkey;
       public            postgres    false    220            �           2606    38329    district district_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (rno);
 @   ALTER TABLE ONLY public.district DROP CONSTRAINT district_pkey;
       public            postgres    false    222            �           2606    38331 $   districttrigger districttrigger_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.districttrigger
    ADD CONSTRAINT districttrigger_pkey PRIMARY KEY (rno);
 N   ALTER TABLE ONLY public.districttrigger DROP CONSTRAINT districttrigger_pkey;
       public            postgres    false    224            �           2606    38333    user email_already_exsist 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT email_already_exsist UNIQUE (email);
 E   ALTER TABLE ONLY public."user" DROP CONSTRAINT email_already_exsist;
       public            postgres    false    251            �           2606    38335 .   credentials email_already_exsist_in_user_table 
   CONSTRAINT     m   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT email_already_exsist_in_user_table UNIQUE (username);
 X   ALTER TABLE ONLY public.credentials DROP CONSTRAINT email_already_exsist_in_user_table;
       public            postgres    false    218            �           2606    38337    invoice invoice_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (rno);
 >   ALTER TABLE ONLY public.invoice DROP CONSTRAINT invoice_pkey;
       public            postgres    false    228            �           2606    38339    invoiceitem invoiceitem_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.invoiceitem
    ADD CONSTRAINT invoiceitem_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.invoiceitem DROP CONSTRAINT invoiceitem_pkey;
       public            postgres    false    231            �           2606    38341    invoiceslip invoiceslip_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.invoiceslip
    ADD CONSTRAINT invoiceslip_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.invoiceslip DROP CONSTRAINT invoiceslip_pkey;
       public            postgres    false    233            �           2606    38343 "   invoicetrigger invoicetrigger_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.invoicetrigger
    ADD CONSTRAINT invoicetrigger_pkey PRIMARY KEY (rno);
 L   ALTER TABLE ONLY public.invoicetrigger DROP CONSTRAINT invoicetrigger_pkey;
       public            postgres    false    235            �           2606    38345    position position_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (rno);
 B   ALTER TABLE ONLY public."position" DROP CONSTRAINT position_pkey;
       public            postgres    false    237            �           2606    38347 $   positiontrigger positiontrigger_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.positiontrigger
    ADD CONSTRAINT positiontrigger_pkey PRIMARY KEY (rno);
 N   ALTER TABLE ONLY public.positiontrigger DROP CONSTRAINT positiontrigger_pkey;
       public            postgres    false    239            �           2606    38349    previlage previlage_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.previlage
    ADD CONSTRAINT previlage_pkey PRIMARY KEY (rno);
 B   ALTER TABLE ONLY public.previlage DROP CONSTRAINT previlage_pkey;
       public            postgres    false    241            �           2606    38351 &   previlagetrigger previlagetrigger_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.previlagetrigger
    ADD CONSTRAINT previlagetrigger_pkey PRIMARY KEY (rno);
 P   ALTER TABLE ONLY public.previlagetrigger DROP CONSTRAINT previlagetrigger_pkey;
       public            postgres    false    243            �           2606    38353    products products_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (rno);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    245            �           2606    38355    user set_unique_email 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT set_unique_email UNIQUE (email);
 A   ALTER TABLE ONLY public."user" DROP CONSTRAINT set_unique_email;
       public            postgres    false    251            �           2606    38357    user set_unique_userid 
   CONSTRAINT     U   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT set_unique_userid UNIQUE (userid);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT set_unique_userid;
       public            postgres    false    251            �           2606    38359    state state_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (rno);
 :   ALTER TABLE ONLY public.state DROP CONSTRAINT state_pkey;
       public            postgres    false    247            �           2606    38361    statetrigger statetrigger_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.statetrigger
    ADD CONSTRAINT statetrigger_pkey PRIMARY KEY (rno);
 H   ALTER TABLE ONLY public.statetrigger DROP CONSTRAINT statetrigger_pkey;
       public            postgres    false    249            �           2606    38363    user user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (rno);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    251                       2606    38365    user userid_already_exsist 
   CONSTRAINT     Y   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT userid_already_exsist UNIQUE (userid);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT userid_already_exsist;
       public            postgres    false    251            �           2606    38367 /   credentials userid_already_exsist_in_user_table 
   CONSTRAINT     l   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT userid_already_exsist_in_user_table UNIQUE (userid);
 Y   ALTER TABLE ONLY public.credentials DROP CONSTRAINT userid_already_exsist_in_user_table;
       public            postgres    false    218                       2606    38369    usertrigger usertrigger_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.usertrigger
    ADD CONSTRAINT usertrigger_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.usertrigger DROP CONSTRAINT usertrigger_pkey;
       public            postgres    false    254                       2620    38370 (   accesscontroll accesscontrolltriggername    TRIGGER     �   CREATE TRIGGER accesscontrolltriggername AFTER INSERT OR DELETE OR UPDATE ON public.accesscontroll FOR EACH ROW EXECUTE FUNCTION public.accesscontrolllog();
 A   DROP TRIGGER accesscontrolltriggername ON public.accesscontroll;
       public          postgres    false    214    256                       2620    38371 "   credentials credentialstriggername    TRIGGER     �   CREATE TRIGGER credentialstriggername AFTER INSERT OR DELETE OR UPDATE ON public.credentials FOR EACH ROW EXECUTE FUNCTION public.credentialslog();
 ;   DROP TRIGGER credentialstriggername ON public.credentials;
       public          postgres    false    218    257                       2620    38372    district districttriggername    TRIGGER     �   CREATE TRIGGER districttriggername AFTER INSERT OR DELETE OR UPDATE ON public.district FOR EACH ROW EXECUTE FUNCTION public.districtlog();
 5   DROP TRIGGER districttriggername ON public.district;
       public          postgres    false    270    222                       2620    38373    invoice invoicetriggername    TRIGGER     �   CREATE TRIGGER invoicetriggername AFTER INSERT OR DELETE OR UPDATE ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.invoicelog();
 3   DROP TRIGGER invoicetriggername ON public.invoice;
       public          postgres    false    271    228                       2620    38374    position positiontriggername    TRIGGER     �   CREATE TRIGGER positiontriggername AFTER INSERT OR DELETE OR UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.positionlog();
 7   DROP TRIGGER positiontriggername ON public."position";
       public          postgres    false    237    272            	           2620    38375    previlage previlagetriggername    TRIGGER     �   CREATE TRIGGER previlagetriggername AFTER INSERT OR DELETE OR UPDATE ON public.previlage FOR EACH ROW EXECUTE FUNCTION public.previlagelog();
 7   DROP TRIGGER previlagetriggername ON public.previlage;
       public          postgres    false    273    241            
           2620    38376    state statetriggername    TRIGGER     �   CREATE TRIGGER statetriggername AFTER INSERT OR DELETE OR UPDATE ON public.state FOR EACH ROW EXECUTE FUNCTION public.statelog();
 /   DROP TRIGGER statetriggername ON public.state;
       public          postgres    false    274    247                       2620    38377    user usertriggername    TRIGGER     �   CREATE TRIGGER usertriggername AFTER INSERT OR DELETE OR UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.userlog();
 /   DROP TRIGGER usertriggername ON public."user";
       public          postgres    false    258    251            �   �  x�m�ˎ\!D��1�<�#�z6Qv�����)@\���R�c(L�P���G��s�b#2���͙����D�<���g犼8O�S������Z�|�K�����@��C��'���` ۑG�	vȌ)��$Ť^3x�����{-��s�[�k����8
x�}vwʖ�_l�v��vv���>�Q�X��	���@G�(6K5|���d���?���6�W��q�n�N>cf�2�e� /�	88�+�$=��(m�ە)�ǳ�Pڄ�0���>�|�vޝ3�]�fJ�ru~5s9:E�W�E��e�wD��)� g�胈���Q�Ľ��T�r�f��*�P�F��y��׳Wj�~�G��k���˹��k�9c�ud/Y������nuޯü���vp:�>o���1j���c�=X ����R�[�}�p�R����P*��wz�v�_瓔��W�z6�U��V1Q��ׯ�?�s      �   E  x��������㧘؂H�շ|�K��^�Ao�??U�Zխ�.$��1ߨ$Q?R����}������?����8��`��ܢ�8m�������7~"�~��ǟ?H՛�M���Fʑ�!5U�R���X1� P��}��8 �[�7��ST�j�������T?o���*��s�9R�i��m�Y��/�d����y˒2��(m<�����?T���yl�F�q�;)�m+I(J'�N.縓1�D7�w��!��/�6�[�-R"���xFz��ue��c�b��sJc]Vc��)����"P�ܸ�8b�R�ʟ�����Ɉ���q'�������Nr���>�1��k,�J�6�Y��7��rб��W:C�'� �F)IJ��Qʛ�)f�Pn�	��r� "��������J�{՟Ũ�5�G|2g��D.�g#ˍh�T��9�D�c���H.�{�Pz��C�X�o��אް.u!��F���:8�-c�YW����AT1C:vF¥���<�������.8�~���b�+����s,�mD~ i5�'_���o���}��d�v�"V4�"m�h�Dh'�v֔ڐz�¹��G9��L �:#W���SX��6*�Zژv�d��n"��4�<z�5)/ɱ-O�=ఙX�J��}���#�UT���"]/"?&�3;��C_'�~�����z�X��XX�KV�D]�'2��vSF�Ģpl�N�� ];6�+������|��􉝄�;��\��d�HyA"K
l��󴉌/��d�nJ�4�/5����YR�M�
�o�L>oh%*�[Q���ܷBw�vR��Pr������8f�tՓ�eQ�;'���Vҏ5���t2^#æ.[���e�̔K�F������ �m�H��(���1���Y�V��d�<K�&_ZdXHf%�nT6H�o'S��S��.�t�rR���y&:��H��E<G[���Zz_�pK��[B�k��$�t�\Z�q�,g�q������d�3����4�PY�J%c�>�e�IJO�rL��Q����`)_#]��ȲFj���im$ݪ�܊Je��Ғva�f[��,-�Y����"(ӻYJpBn ݢE
m73�3����1`�G�n*�A���d�ώ�YQ������6ϩ��s$ �k�	��&��I1T����T�g�;9�E�d�J��5�s�"�v2�d��Bn��m��"%uT�m�nr�{}_�DvR����Bn!oaJ��"���y�JO�FO�c0�y��T��_&��p��|�<��#��J����~�F��E2{^I�z�eӋ���g�1�9��9�G�O$ca����\����g9�!yA�/l�1����D�2z>�p�={�@'j2Hd��4�C-ޗ�������u�CP��>�\Dե�b�����.'ZQ�7�-��lM&/ ��r���&��+ɭ���@
"�(�<����j-�.k�]$!� �Fj)s��.W���= Q�N���ֆ,c
��tm��VK�A��!�VZ���)sݪR8D�Z;w�<�+\�qg=Jg�,�9Xbd)u�Q��P�#R"Ŏ���s�@��2�GF���Q;�'aawr��|��?������u}g���a�H"}g��I-���V�+bQ�}�C@-:��n'p`1lɉ���3�8�~���QP�u�A���y�C��sſ&Ż��Ih��.�1���{5˓}��~5]*phc�=�ϣ��(]�^r��ڦ��R�Q�<F�pe����3�qܙ��ѓ$s)��A̗Q�D��.�\Dճ�@R��"�����0)�M�a��ByA��`C�9]�dsBQ��PK��L�B�Sc�P�MU�B�1ً��Kc�.��O�Q2��x���?����\�����;Q?<r1�\b�3O)}�%Nh9?�H�
�@4�uT������Z̖��&I�QT��2�P�eR�'�y�t����^I��0�.�D�%)����/��PZ',k��+0��_R�����-E8��3�7��������=TC꠾5Q���`��ba�������z�*�Qf��i���_�?���ǃ�|?�q�vt��K��r׆:��x��|���j�.Hm���ؤhGt�EU7��:O,�e>e��
Öh#Wj�8��"!���}�z��}���K�"�4BC*�`�x@�C,��`c������!��K	��z�C:G/��[�%�1����xy�[��nѨ���sÒ�&wgc���8�Ts��O#2{_M�4Dc4�'�14J���� SK�l�}�>�3F�p��dJsT���s����o�H���Y�^���l�r�O�� ��i��U�S��K�1��]�E#�)��.�ֻl�aC�}�eϫ���D�rӛ݊R�*P�#���'HK��S#�Q�pe��[E�%x�1�<�e�gj�&�P����#���m-�;��C�P�;��~ێ��-�B��G$��2ghL[1.��r�6���I�#�Po�SN����~��F��s�o����M[��/r{W@SG�>�K��I�e��͆4�6�?H�>��Ig5�	d��a�,��B�.���f��}�LfviR[;5Pv��~{X.Y�79Z�NL�ޘ>��1�lͼ	9aĥ�Z�{�G�?��EϞ����2�����^��<H������&���r��Ԍ����j�3�>x����ȸ�Cǜ�Fcg��׷=þz�}��Ϊ?�+B!����$�B��7�����Ù$t�8��߰ы�d�^��^W�/�-�,c���`���j������,B�8�c���q��dm��2��e�26�E2�)��#��@'z��;n>4�iY%�?S��r(]�9�U�k��V:;���{n/�<�z=?�����èRo<��)8��*��B��EcB�E)���|���4����lq�o����R����������T[��	�9��*ʲ��]���0}���L��J�.�L4�s3��d���7�&0�[�D�;��垸�	Ŧ*� ��Z{��i�q-j=�hrSO4����4����,'"v�>��\�?Ri/�z/����q�;�6�KԎ�iQ_K��[���d�"�g�q�;�/�P	�]V>4��Y���>�>Jqh��H�͑Z5f��}�߾}��_���      �   <  x���Ao�0��ʏ)$ْ�[
�]��z1�n10;E��h�$>�Ȇ(��,�O�؛���������q1������<}/�!�ǳ��7�x9���>���������ĶA?r�ٗo��P�x��N���Ez���t�FS���L��/�4*�������5G	�H����B�U�7�.��	�m�[����r�,%��Su���(1�H�<Ue`[`�ö�$H�AzXZE�R�P�gJ�4dO�y#r����|>� �z�I�v���B=�3��~�$�:��h,%���@��Vh���p��N
�ݭ'K�yXFD-ի�L١J��QFP�Ո�,=n�YN�{�KD�߫��J�QF���0�j��ފL���&\���Ե� I�QFO#����Ve��r�3�D�U�iȵ�ί�4�ƅ�H���e���������7�C��-6ΚeTǶ���(�fJ�˘u^L��E�4p:��xI7�toE���H9��\���C�*�����1��uN^��u���'�EY�L�� �?̼�:n/ϧyz?�ߪ�^[��a������-      �   �	  x���ˎT9��駨��q�%W��vf�fכ�%5�h���~�;KC�YǐH�(�_����a's�����|���c{������?���|=pf}��Un7����6ͽgK����������rT�j�n-�v;rٸVK���mr亩R/5��l+G)�Qɭ����ۻ����eB��|w��	+��UbM�!XA^��ԇsۊqM�p��V���Q�V�T�D����������{����^�ݐsłllV[MD�w��_F(m�EH%;b<�	��b�n���uB=fޔ
5���"KZbK�DK";v~�4v�qӖ(�P����B��7�U����js�A�c8Q�a�����������Pk��@�7���7Z`�	�G��8V���/���i�����^	DqDYF *�n�5˚XH j�w��1pDL-fȪ��x�!,ݖ��ݹ�<��%Ϗ"�����p�m]�UI�κ�H��B�t�d-O4+��~ړ��.�o�6�v+Y��Dg�u�� l4��znI��&
I<�5�>d���H���9�H�I��i=SLf�4ҏ�6ɒ�*�$�gx�:>iô1%)K�q����ށIR�vc�.���RTOG>7Au�I��۝�⹲+^V}c�j7N���5	Z��o$����G�l�\��bq�aͣ�ؒ��u<�h�����t�n�΀���]S̥Ś�x�0�'Fdzg@m䒴��G+%k2�����c���:�8C/R���mx��U/��"1��&��=7	b�lk�:�`&{�g@�#O��:��k���b��K�d�S� !n��m[�r�9�P�t�՟2G��5c��k�
�N�X`DW���Ŋ8-�3�!�T�ƚ9pCڨ�d�S��bN44܎YQV{���-��0���&�J��;��(���pk��P�`�*
�CA��Y@p)Y4זFG�[A����iE�rw	���
aY�7|$�>���B��{�,-,�,0���3����D˳j-��	s)J�[�b�^@�^3L��Y��Ew�j��7�eF�v��k�2k�Bw~��Y�=�Tݥ�x��ُw�h�S�+M��K͂-H���K�u����Z%Zub��T�/2Q��i�j���kM4�k-�����q�Ps3����M�hhZT�|Cj|��n����6�c����^CU?Db��p���8XK-YP��{�ϕ����nu�V(�!8mߠ��b�GP�@�O��*���Q�d������}�VJ+�=�?H����@kHs�\Kj����2�Р!M4�.�~)��0g�!_�����{nc~�d�2S+�[���O��g�йp�C�]�/�C�D�}�ttI]�B�|�PJx`���ψ�n�7w�N�-�.
V<���vd�>:G��Z��a�䨉�p�ԇ�_����ǌ�!�P��G�ݗ?'���&+�R�c1h�)��!�PM��;G���$䲲�Z�j7�zW�
�]�T�5�<}fzоZL�J�:�*�Opn�L�+������!z��5a�a4�*���\Z����k;KDqw�"X!(�� ����|�50UB�:�^���$.;�I�(h�T�f���z�T�*�mp�~9u��u����048�N�o����܋@��bڴ�O(���Ұ�3r��u\Q 졮
0ã��k�]�5mX`��4j%����ܸV_�C<�Z�A��#�a�ԏ��o�)~�9ru��⪖憱��������93���sK����Ma�cHt{t���78T�\z���V^a��&���N{z�}.��g�
���U�-P�Z��֮�/�SӪ���\k��U�FF�+חo4�G�<��6E�Cz���U�"(n�L�"���w���_p�bԁ���7.�I����-��=����QA�ł
_�M��ܶgՊ���a�;5O�"//V�ɊS�=_P��ɽ?�~�p�p����Ϸ��A�{�rd̷���
��������.?ыQC ��øم�vW�>���?.�n�b�P e&Z���=��5Q:p_�iY*�y�2i��=����tx�&/� �1��Hlw3���.��\�o�PY��V:6Zg��	hE4���C\rs�Ll�FAcA!���:o�x���!̩���h�)��"�\���bGG�E�PeɣE�΄�դ����۶��uu��l.��_�>��İy5w_u�?n��Gm(��I��d���|`ͅU�^+J������ҭ�{e�F��"��d��`���F^�L/��=Z�7�SY�i㰫���Nݝ��4�����{���P��hK�v���Q���%�����>1]�mЍ!�m������-���蛀������:��z�����w_���dR�\��僾���̼��bR�����A�g4��o)��X3�      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �      x������ � �      �   J   x�3��H��N100�2��H��ɇ�9�Ss��sS�|ΐԢ��<��Ԕ���l����\NC#c.S�R1z\\\ ��>      �   �  x���M��6������ޙ���֢�!����\�l�.�4@w�?Jٻ�+yd�+E���!�ϐ��,t����?��S�w��H�!�ɩ���'�?�zd�	����@�" ����\ ᓜʧ�88����ItE ����XL�_#�<L�<���!�$�D�s�E��Б�4Dk��&��8��$'�U�t�I���G�	c���ߧ���~���ϧ�_|��^�H���q
8�>ܔ��\����/T������7k��Y�����*cd��� }.f%0+^x�[������2ce�`��ߟO7ղ��L�Wf��Z�Jt�a��1��c���֎2s%�h��Ƀ{�DS8>Ac%�)�{	L%,�zrn	��a������� �:��n��5ΰ��^�	!�2wP���y-���i��S�Z
�S��]N������Y�+c��BS}��KTDt3ķ�����|-�K�#�i�+�ޙ� �8�5�ꀳ�4��R��b(w)6����P�>?��rv�)*i��v��ڝ�Py}�y�rP���	��Q>Lť|�8��)*�h�=*ص�ڵh}g^Ft�&�=*��dUb��	������L��Q���:����nC�,`֜��o���d�=�58N�󁖝^An6�^�ш{��fS��(0�M#���H6�܎���h3*��u��a�����斸}A��������ʵ�T�E�G��s&n=���X� #�2�&L�U�X��2�����vm�}�)�[����(����"���G����ړY�;��[��V��
oCj#X��\մ���0�x���<�a<w����+�n��A������~���	���H����G?|?2��;�������~�~d�o���S~ӻy�߰?�B��P˯$9s�����[����W�_�����]Կ���	A�������!~��~���~���O�H�`�#u����T;P�n����Y+D�#u������;R;�������ۜ:��cN�.2�v@C�s;���y��Y��O�=k�U?\���T!�!�n��j��H�� 9wPz$�;(-���7)2���x�N�px��S�uPWB��Yu�B�� ���u����m7^�u���w�^�w���w�^�w���w���Ƿ�<��;���w�z�����p?<�!������H�z>��F���x �-���?�|@G���
A��\k�ӀA���~��l�DY9N�A�|Bo� b
�\I��1�h[-p�C�iG#���^�poC\;��8s�h���=y �3wh�*��+#�p��<�Ùr`�WW��4`�Ùv ����BY�i =I���i^��ŵ��g
Qs�@�˾�?��o�!:V�~ǝ�r���Σ@7Y�jv�BL�	�Ժ�ш���-ĭ�ؽ^yz,DPX�;O�.��~�&��u��	}`Q�Eø�L��j�+id^�^�^��}���Dv�{J���^>�B�y8"n�2	���xʅ�_yv��6���
5:�nv�4�qb�H���F�zA�d4��s��xv���Ep�Fk�����4X�F��16h3��f^L�z��`�]��5=f1z̭C���,hV���`�?CiL*�jD�_������9��l��p_����)��      �   �  x���;��Fm�]4����
t(O�U0�	L=C�� �����~������H{�ۨ��Ͷ߿��젊��*)�#*�jO����[�N1B���!ѿ	�Cb�H!�f��P������O
n�I
~�K
�l�iTz�����K
�rRT��l�B.s�|e��W�r-��+Si�@ ˷W�<���E� ���\�Î� ��J���;) E�H�7�a��Q @�o� �K�E ��� &kd��d�5�;1�ҷ_ @�� �J�t �5R9��F*T�H���P�,�����E&L��Ä�y�0�"&[�a�d�<L��Q�&L��Ä�z���������wE�R����6 3F v�1���J�����}��(��Q5�C*���[�m�3|���k0A���@�c<z�r�����l��)��<w̎��<�!�<� ��}O}>�� 挗���R"�;c}�#�ߠ��8-}�g	�=g��I�f@�~@�.�ZR��~N����� �֪�f��:�x�6.�y5�S~�v%��O��)8�|�L�����W���h3H�?�'��`�޷H���o��)��d��d����G���m��kuB�n�Q�4�&l�0f ��q��M��������_��D���
�3�x�{̠�����U�9[�\�s��s.���\�Y�%n7f�9��s����rz�{�������*
���h�v�b��"vG��"vj�J��|�&��K���!)X/SR�^�wÕdE�{5I�{͒��Z$��J
�t�ڸR�(���=
�J���I�h�+ي��&ݣS�l+
�t�v�ҭ(�o�=z�J���I�h�+�Ǟ���)���=��J���K�h�+݊��.ݣ��t+
�t�f�ҭ(���=:�J���~(����ҭ(�O�����u��	B�8^�y�f�Te;��B1��f`h�+���������+
3j���R�(�`�����+
3�*����R�(���{?����1�dD1�y`���Z�&f0��YW��L9��)g��j��J�J��(9�֕rEeP2��+努��{T֕rEuP�=��J���>I�����{VK�=�%��Ւt�ʺҭ(�O�=j�J���>I�����{tוnA���t+*ݩ�na�k��`�l�뇧�;�&'�k&'�&k��d���K�2k�5��^<o�z9 Z�r@����Pj-K������@��,գ�Z��Qn��M��e��n��}!X�r���������P�.7b�*m�[�3Q�u��V��ּ�[C�������`
Ώ�^��ח��]A�Q�C
�_��O�����W���Po�TI������
o��&+��ޚ���zk�
�>d^��Z�L�3����2iT[{�|��������%k}�$�^{2��򋘡��� o�/�}2������;����F��z~k�\�E�]�Uq-��gċ��4L���A��q��b(���O��c�uPa����Q`�q-�>>
��7t&������`��"      �      x�3��CA��F�Fh\1z\\\ �	�      �      x��]Ɏ%Gr<w~�'��V'	�2:�i.�!!��H�/�xE�WuT�\�@���2���oa�����/��g~��O?��?�hR�M�ߤ�]�/���{*%��<A����d/"���[���� '�$�[�T�֞/�����?~xR_~Q��e�3�i/�w)��I����^��:� H��H��*֬l����@W~`����5���LWc��%%�$_]`T�bb�nR��t�`.��
P����ⶻw-�ik`����;L�M���j�K����R�T���6���҇��N�t�'{�6u�H��u�ޔqG���}��N�{K�7-G`����X�琢;p��� �i^l3��S�yq�w�s���fv�1����ٱ���@?冐Z16;���\za�C/l��%��T�k�M����b�Y���/�_4�Y��\����������^"��!��GG�����܏�� N���Xj�t���
d�����������ۗ�������~����������������o9�B?�����R�
�%�Ɋc�&#�	����w����ݿ���Z�֢eD�3�e��=]7\��t�l���M�(R>�<_��W�6�cC��[���3�~�R{�[��~�7�w��騖�{i[.����<�_�i�V�\Dg��?䃪��/�ߥ�'��"���������?{U͹n%�_[�K��]��V�ׇ�D��N��)�,m�/�S�U&M͔m0IP(�]��f��!��M4�j�*� ��ff�����V�P>���lĲoU������|g1Aq����s�o�O��;��+Y���P�&�5o5����r�����ȩ��F�?�o�sn=C�Kߋ#>���_��%�Ox��׭ڿ���!W�����'E���@��6���Q��4-0\�6����������5����v=�]i����%B-��>&'��1�N�(h+��R�ƴ��ZnC���5�l-���{�x��Sw��-x���Е���ո����oC��S�Z}���-�E&�Ks�[nmr���^�zpk���5�R�R��m�Bh5�Ŷ��n�5��Ɉf��l=���vk@
�nZ�փ[[{��n�O0I4M��96gi��i�C�\�g�m����P�?�Q�71`���o���/^�������>s�s؝!*��Kv�n�y�)lO�Q B�v(��oc+7�
�d����$E��6��t��V�h�3Z��./��p ���/�a7�[�	�1}�o�a�qRk)e���K���vN|�����	�̷y�Q��7�>�K	�̷y�v��yp�{x�o����eC�'x�o�]j�M=�O$�2��%zS��լ�"��yV��f�MP��^�ۼ�y�*�%���6/3Cʎ^�Wv�e��KT��$�ņ^����,!Ƃ��h��rӿ���݋�	7b}ž���E��
k�F{k��rӿ�9ͦ�eDYnt�.7�{`�]��D�y�]n�w�(�9Ͳub�.7�{`�O@Dp`�.7�{`��֭Vv��rӿ�o�;�5���+v��w��=��^X,�w��ߝy�`մ�����ۄ��d����]𡂨�'@Xo; ���E�Z�,8`��(�ݟ��di��m��t �,�<8`��>v��D5Û�P�������sA�� ����M�CɁ X�hH<8w��ܕ���q�>�!x����rJ {S��\w`N�ɜ���^s��w��f�o6/�;�Y�{�c��8��6�=�8��6�=𔸙|j�{;Ng�~�`��������S��#؁���G��\��(�v,������3��#�qwfJ{;��Όi`�}�Ss�#�q�|fP{;Η�w����]/O�S�`�ܙ��v���^�`�ܙ��v�����`�ܙ�� vT.������3���8?�U����3]��8?�U��#�ż��S��#�q���Qlpj�z;���2�N�S�`���b^F���q��8_��G�y��ƩG���p�G�ĩq��8:\��qt�ؿ�J��8�v��q��8�_��Q(qj�z;�<�w�<5N=�}u�z��D��Չ����ؚ�NT�`_����<5Q=���k�[����D�v�֮�F�G��;�Gs�7��v�|�F��.��l�r�<v�݊؁��[����Ϟ��N�����ο ۯa�S�"�t�M�ģ�/ؗ��c��JV�a`^�G]uu�T�q���a�0ITat����fD޳'v�NP�7�G4��k<��2����d�oD�g�)�V�0Js���;˦���xۭ��Eqz�	����nЁ7�?�,bC;�-�����8���47ʜ�pAM#՛��SӏÆ��H�`��5�ϡ;�C�#�7�ڑДw�ꌁQ:rڨQ�-���WB�k+b���ˠ�M}��P�Q7rZyԨ�J��F����a۫��~[�j
8�����WB���מ+�/jFnШz3�&!��4�9�� �</ �P��aӫ����={��sm	�5�]V��� ��?��yr����\�����=�}/{�\�F)WS����.�2�kTӬ �"�f,�������o����2/�"�xA�C���qN�.���!�﹣��*�_W��G�h�P��������v��e�q�>��l�7��˘�d}����
y���2�N�����:����^��
�	�
�'er�?�f��ҍ)��waU��*�{�<�Y`�}�Ri���y�Ν�"�v�C+KNӽ{i�u�EUa{M̈-�	����-4����V�i-x�ؿ{#����f��E:|<�Z���C��x�)���0�ɳ]����(���Z�f_>.�Xy����O�MS-�YF�Ye3b�"��r���^�u4�^mS��S��|����J�,OK����8�b9Y���+�>2�OV/��7��q�����2�tIW����<�|�^�6EV����C��b�t�,<�Þ9�}"����l�u�ӕ2��a��:�R�x����^�b����5{w�թ��f��m���e'��aPK/}Q�Ԉ���[l���&w����/�*G���<soIƭkr|��ʜ!i��;�Yu5���::�3v�gFQ^-�[GȪ~z�ꑌ�*��5�W����Q�U7|��~D#9K�<H_aO�(.�΃����g�i�'4�:�c�A�q{�����s@���K��� n�́�<0�9����x��H=]����$�t��8({�:m^V��̵�F������Y��<�Ϡ�8	>_�2�u�0'�=��#��n��Kh�{�N��E>�q�:���Z�0�G�ΊЈު=�0KUp�^^��,���ss���r��_
[��W�2�66Ш)�<��`��J����$jC���&�G�N�܉p>n*tК2���ClZ:_�>6nP�{5ND��ClZ;Ǖ���+�{.�T6��i�|�D/�D��`���4��+�c��0*�f	=���v��\={����6��'�}l���7���������%  �)Cρg^����Ǹ-�?xz�6x�U���/7�)Cρ7Ns�yzK`���a����[Өr�ʣŤQ��8z��vqT�	�A"���}
��~�8���w�Q���S�'�/�� �(Emˇ�>��>���&�;Wx���al|y ��ƕ�&��	���j��v�[Qp5N��x�j,3Z#|`����#��.
�|,�N��
����j�{��'��xC���g�T`l��㢥*������g�=�����$TaX|P�H~F�C���(��h�����g�=ߘ��q>Q$?��t���k7� F�|��>n@N;Zp�E�}�� �=�T��e�
�f�0/����e�
�>n1꼅����ee�cyܬkA��C��˨mX}�SA�"ee��4
 �Q�R�S6��k����<�e�}�f&�;����Q�R�s��s��s�J�Ζ��ͬ,Q��5�} m�J�v�=�?(�@� Y�r���U�c��q����i��vy/c�i6�V�}Ύ	Pvn�'p6�   Vx�uz��i�+RI�T]�be�LM�*T+Rm�&5P�2(W������&Sd�&P�����L��;�Y������S'��	��+(�iP��r�M`l]�Xn���6�Y����i��q���x�	�m+(Ky3�1:��78�Vp�x?��d��R��,�~���
=:
��Q�Ҟ����??��>`�	��qvTQ��VPևf�{�Y6�Y�
�>�	H��������>�n��2�(��ƙu=b=EI̲Q��Vp�/���Z�(ii+8˻���.M�jg�
��8�y����������6*c|�������V��&����1�����"N�����2c�x���[9e��z�n��y�]�g���_aB�-�>o���U�**\�}ޖQ|S]�=#F�K���2�o��G�����G��*���?���H=��0\NÃ����B�2����
x�V���;��:���v����t�A���~�W�R�X�/6�u4�ϵ���q;�Vpv|rsO�P�dA��ig����h{:mS�
�R���ҫ2�َ���<
̄b������:>��x �� �=�`ӊr�.�QYAX{\�\��AӤ����Gy�11�aea����,dM*+�/: ����
��p2j�.�M*+��:��qΊ*h�TV�a�/�q>��TV��y{��!�&���1\.�z��pR}F�֟g��s��\`� r���ɤB�^���ywt��"����t���k��7�^��I�,���U8�/��A�A^v��J�=�Z��ŵ vҠ���k��
�|�MӖŹI�N��)�Ix�i� h�S����2�g���PD� wR�R������=)_k��M){^rJ�ƷOW���}$~�\��̓�I�>c�����11���4ǞBo���U� {R�&�3�:��V\�P��A��6ͲA����h��{؏���^Z|�M�z
^Ƿ7 �=�զt���>��2�
޸���W��5�x�_i�]������R��6�g~��S��M<M�T�I| �OIkq���fUǇ�8�e|�;H�ԧi6�3�~�Ώ9J˱C�A�s�I��g>R� ���Nʷ�	[	��4��^t�7
��ռdi�������iړת�P�p�Tnnz�@��d�gѩ��5;���R��,Ϣ�q	��$��e��ݙ��^�
]�.Fױ���{��:������+
�����ok#�I��5-F�Է��ɀ����I�%Gｔ���i����5~P��Nj�ѩ�ϼ(��s��{�L�D����gM?><�3n6V_��OW�V� ���|C)N۴���C��R�	;G����'���M>�t~��:/�2Y��8h-��'�HE�.�����H"����	�H�>�����w�H��>�@~~��q�`o���~�3��O.��'��V?�g�:���S��w1G�Мk� ���G~~�"����]U;�����ɯ��h�F��G�(��H�A�}���������o��W�ia�(����b���g���w�w�!y���绕�S�B}E��g�%R��!�[���<������ߎx߭\?�y�
D����]�����<k
[l�ʬ葰�6��ާ珎�����iS���}�N$�g���_�K���P:Q��
"2'�RF1dP:�������s�S�y���N��g=�8��NPA�D
|�*n���ZE�

(��߂k����/�m4�y[��m���mv�      �   R   x�3�4��M��LKL.)-J��".#N#Δ�⒢̤Ғ�"��1�1griqI~n*LȄӄ��$1-�7�4�L�G����� ���      �   X   x�u��	�0��ni !o�u�����������(Ҙ{����u��$^������TM���%:��#� ���rE
��c��2�      �      x������ � �      �      x������ � �      �   [  x�}�?o�0��˧`�Ju����ХCg���"�������,�~�޽;�P��J
v��w��ݭ�����@�P2-�\�8��%(���|mO���ڮI2b�.�	�$��(m(
>�o�\,�x� )���'ʣS�+�gp�m���5?��4�����R�}(mR'!-HQ�<ۂ������:�b"�P���8#�s�z!��T|^9�p�j����H`ʹTz?�
>�_�>����l�cd��d�p�[��q��s�eC�A���>lv�chdAG�[V�-�n3����kz	j�jR��A���:��yw�^zK�b�д�t�k���Q�{���f
�      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �      x������ � �      �   �	  x��Z�r�F}> F���'KfRqj���Z�*���%D"%�b����=3$ 
�"
@� �s�/��c�|,(e���z��w��~N�֖rù ���\~���2..'+���wğ��&_��Ͳ$W���K��ņh?�����\���%�	u��P�
��gQ�o�ڷ�/�4�bES�R1�:k�VRp6�?m,!��m�G���d2a2�4�2U��j���x���υo�y����c��/�D@k��N�%h���	D�%�%�e\gܥ�Y����?��	O�P��IE��G�����<�f��L�Tr)���Vx��d�>�g��{d��o�κ9�����:���$%��{k�4�<F*�o�*j�}0S�&�g���Ze3��\�����~I.��������iX�5��u�A���v����:t'��3�`�) �p}�]>^����\x��s��X��f���L�mFe������H�_�jq�#�ԡa����2E3�S� �ڂ��W~��7��Q,���1�
����%*�Hf�e4���)�R��52��ex�i&�J��k��4@��d/�! 3E�b�|~X/#>_��Ah(�i  ht ��uC�C�W	���̬Sa�THE�֦:�Zq���A�*��b��9S'���iN��Ӓ���m���b��A���,V�0�5�3i��]\����)��/G>,���������ے�h-)�j���$�ܘ)�0x!O
̓B��J��^p9V���;���.�����Zc�o����7��ȿ����lu�#_O܏���m9-�d��?~�+ҿf�;db��3DG�|���ΔK�ST����s���w�v�
����8��m?W@F���7�t�bV9�{��\��
�|�n%�L�P�E����ݔ3�Ψ@VA��E��,�֒�2���Q�S�H������2e��3���=0�����`��}b|�����qǨ���&_�!���;��mFp��h��g=
:��	��wu˼�WHL�8P�I��)��=r4�I�!�!�Kj��^A�s��9k�f��P#�cs�� R�\�	�r`o��N Ҙ���NTD��!?`�)0���S<�m����0l��6BP���6�;&�0��=u�a�E�l���rU�������i>ج�mV8�vh��iA+N`��x�(��e���zc�cռh�@k.�	0��� ���~gͽ�v�hRn�7q�a;ڕ;�ߕ�V~x�q��@1B&�8����������aTlDhP�v> �k�� s}@�h0��*��~I`1��͇�}& �(9�c9\�@h��ڼA�[�TH�`0�i�sd�c�T��}(�i�DSy�����y���v��	��y`�?m���g@ro'�ͦ�C��Z�#���"Eapgt ��g�&{CI6S,u�I��^���b79/�幓kU:2�	�
�3�kխm�����rV͖K��� V�F�xe�<Q�4�{���(^�IӠ�c����6��ܼb��sx�����!q��R֋W��z�L�sn�A5:�<
+#KQ�6�)WFC���v:�!���#hJ� )�o��ӽ���Y��� @�ZiQ����8��n¥� G�ۇ�{·���w�;eH���
�V�^Gm��dT��8pr�/n�����x�L��U�N\��3�6a�1nD�(z�`��F�X�a�����v�a �ÜP�;fl�t/� �B1,Y�B��|>3��2�J�e�kG���EU�VSZ+̀�+BOD�>S6����V^۷@3
��RT�g�ǝĉ~�d�A���wb��$O�vݭ_��:�0Z�\�A�pA�t��k�����Z*���0�RA6uθ�?�ӭx�ʫ�V��Y����Ԅ5&� `�s3H:��k����:mؠ2�i�,'2d��:ׂV[�cU��y�ŉ/����ֻ�z�����<��8>V���E{CO�֛�;o����ˢ6�𵳦=l#����B;ܳ��xz�l�B�J-�L�m��=>y����=7�&#37`i}Ȫ�M��^�\Uo*y�h7DH{����|p��R�@�X��OW5�|0�}��wܮ[�%+~,2���I2�JѤ])j�q���{�_}�HSE����s�2���j}?��o{e.0d7��s�pςǖ>	�IȟL�j�x2��3�rR�;!φx&��7=���2�v�+��Y����T7�A�}�!�ݧB����[Vc,�W�@���Y�X��/��MoV������:�[�ͻ�%EU�~�H��z�j=[����}�
4w:��BK�n�'�X66E��_�-�N~I>D��M�\��_���lqآ(1��"t�dB\����O�I������������n��2:�uŒ�>��uUT��෮���C�tT�N����N���Ōiޭv�ʢBp[�kߕ������./o�c��)�3����E��� o[�T}��K�)�B�F��9=c��8/9L��Ky��mq���x���Y,�      �      x��}�rǑ���S�������%s7�O�����ވG��	X�Z��h[���Y������L(�h�:�*�����O����ݧ���~�������?}ؔ�b&���I���>=m0 �"�/]\^C�(b:�-�Y��ݏwOw_0������tBL�$��� z��ы���ۛ]�*�k,�P�$I���c�y܇c�K�@(]#v�\( y�f*�k�C�� "�I�Yw�����%"�A:@���)#@x�@�5�S�Y�������1�R<
V���k��@9:��@����[�R��qD��E������(�
%wQ�dL��q�	�5��XbL��*�[��^�/n�Lⵈ��.QL��G���$��`3�r�y��4.�yP�,�L�9*y�3�J��$d�bۣaKI�5���KQx�����XTa�!�s�c(�:
ל� ��a�#�g���_p��_~��'/�^���'��*��9{%�;:
�:p�3�����=W!mq�!q�)��~"N�N��AYL��#+���������`�eNA\n�>�p�0Q!��p���P�X�����>Sr�5�``�<��Dɱ�b���ʇ���3��Y$8�]
�a��(�*Lu,
�Ǳ������>�bG^�/�s��#m��	N�+��!�b
�}��in���^��<׫x��S1威qݐ0�H����{�s�R�� 1�=N�PR�8�����Io\�:P'�#y��|3Is�L0;�8��o<Lx�ZA�T�J��L9��e�8&t��'�}&YrP�\��!�ТJ�%H񤂹��Q�E}�.�������%��H�f۞�(�:@�ѓs�ٶg2J�bAt����KVۣo<%�7\�R����f�s�e��(K1o�B��s��Z}2J�.sOCiu֠[�Bǋ/��h�j-ǭ��PH�+.��z2E�%��L�f�֕e�0�����h�j-'8^�H�T[z���b2J{�\�s.g+�i�H�������MVт3B+��%R#���(J;��̎;G�%+ʒ�Cꊐ+�G�%+ʒ�C��#�S&���iZ����B�8,d�m{&��d!��$���:�/zǋ#4�MRY���QOP�$�XE��z�zRY�I*��Du�	CrX��$�գ� �5�u��4;�5e����\�'5IeU�d(��Ê��A��;�,�f����D==���X���&QO��Ƨ�$8�4?Ꙥ�L�v.!y
�I*�G���їMRY�Jp��B
�s9��L�=�2uY��'��L�$�)D�(���g��QG���d�t[2j8y��I�SQ�Ff��Qn�T��g��_��v,�5q�5�٤~߃,]d��P�y~�mڱ,ס�B��� �6<�e1�
��N�C��1g�sY��Pz��K�Ik�V��Xh�=(=�҂�"9�������x�\<��Ҥ~ߣ,]ѿ$�/M�����5Rǥ��f���ɖnS��Q]�&��e���z��K�ޱ��r�©x��$�rM^b�@�N�_�&L��'��<���(kKv�"�=S�i!E��!���TiJ�P�qO�����4�r�؉���� 4���0c��<{�$�&�
SbbI�B��O��u@u3K�L�Ahe��ypABBϤuhe�*̒\/Z�:�������G�	'q8q ��P�����&�n=L�T.�M��-�B�y������M�P��y���$���D� Z�+�l�`��Au�Ԅ�� h�Ȭ0K2S�]�d�z��cΘ=/}>M�4iB�ꩤ��1�ؤdc�V�*)S�hMld���]e��!`#�Y���l6J�Ae��F���� \�l��FgsDG�ƙ�P�_`r�x�#<{�����y��<��3Z�kDO�N{��N~���{��C��s<�4@5�����w�?����̓��K�bBŅ����
�[���e���?�~޼���Ӈ���?�o�p���ǫ����~�����i�dyI��Y \�	p��|�	�ʲ�x��@�yo?ݞ�~n�|�/p0�'ɜ�j�%�-�GNEL�#�+c���8eO;*�b�N=�� O=�,�z@]I}�Sa����lͿ]Y~U���N���J�v��)���P>7a��utm\&�p���|m'��g�ԑZYL�m�K�Z��G�2L=�K^1��5��r��*���y��x�*hc�A��#A������џf���K`{��@���^���O�z���%��"�L}!{���STA�h�G��9	\Y~+�E��!�C��(�}z%��s�(�W���1�� t�'��ղTng�)�)�i��K�yvC.S�"��a)�H��DO�H8�f��ԁ�@�E`,K�a�TCW5Kh��$�
�rQq��	Тc2MU,�.�K������H.�ӳ8�9�!=�J',�r���*֓O�"�� 'ې �<���s:(�s �/�\��fWƩ�w�2�k�C.�ʦі��s=��K7�B�`̀1%reI{JY�_��|�-�+��w����z�������=&�'\X�*����,y���g]h5�l�0�+n�<�?�q�F���R��T�C�QZ㭬�YC\�X�M����Xav�����t�_AՀ�[�kz�y�mB��5��rSg�rBW:�u��
���U�V5�j`� ��\��e�r	�3�m�l�W��� g_$l&�-\	���J�����
�#]4�,.�!qs�'�ѕfgA����bH�ʰ�8�2}Ob\�&�5��ʾ6ߔ�N��'w%�����X�0�V�Ty#�� Siv���Z�3�y&�,�D��3}���qȮHrMI�E,���$RWBqѹA���UF��ހ�g���e�-L(]�(��Ҙ�l�\�̻�)�S/�\+�rl�c��,��߆<�Ƶ��-ֈ�ɻʮ�3�k�\k| �6a�r�^�z��D�JwJ�Bf�zܥ "�P��΃����<���EHY�q]�� <q�4/\QR�"�k�1n�+N�gW�H;y��9fWV�̏�&�+�o���e���k�<�z���5/T�-b=�<��A|�\�N�Z�5e���0e��#`���b�t_`�VG�ME%f�����<�Mh�R<� �������:i{�>���i�<�(��Jb`�o�&�3�*():T�V�A[�Q�[�=E:�����ca����i�<k�B��)����f�T�Ep	qT��R���Gek00��) \BU,���\3��r�pRM��"������w����m��&Bg�G���ʌL�BJ�I!�2c�3vE Ņs�\մL�H%�$����am2�3uz��3��x���-Ly Ȟ�;"4�&���l����Ӆ���5"l
��0K�Y��_��V)�p%��ad�ĶV)ֆ!&�Y��%,��n�I�qK�"t�b�Ѓ!������R�kI�"i�y����%O�"��<�ZlO�1d�^Z$�)�d�mL��&R�f1��.׊�ѶCѪr`v������c�r�V_7��w�-B ����������=-�HM�/��F�$QM�!FÞӢ�E�+��Ժ��#F�����Ǟ梑���������B�'�P�%��L<��[3�[�8
�w�]$�8O}q�}bɮ��[Fj=Z�BH�����M���fT]�<�#سi�9JG�t��A�4(�M`j� ��s�|~6�g��	A�� �l&4�b]9)��rP�Z�-��W� +Nty�JG!�
���(��Ƶ�.N@"$���O40Ps��(�'���=LpQ�����2U��F"�m�&�t��SN���2Uј��:]g�E�����~�آ�5��ո*M��-
\=Lɝ��x�y�]���2�g6c������SL�6�8��Bi����%3���=�j
3W�Ele�*˼� \����٪�.DȮH>��A��=j3�����5��@�V6����ynzje��y�Irv)�������/����9ťp��R;+��ar)���
U����xjg��t����/��B�$J�ޔ�    �
U��Y�����Z�-���>��!
��Dq9Hy���9��rT/$�K7�֍�d�[��5�гV4�,���!��ܼ]����lO�1/�.1�p��<S��3Z��l�/���s��u��k����nr[�ôt��2�ҎL�.w�\<d�Xab�ځ���\���#�p!�����e�����5�E�Wʮ��Ҵ[����m�c�z.,-���*�H졿�Ҳ��������0ږm�Z���nKj���I�UT)M�)�pK1���p)4)Uo��� �C�Iav�6&U�&�\-
-�������'ޥвw�����z�\CYZv��p՝M�����%� ׶��(,
�lК']�cH?�z拶�U/<$�QX�{}�tc?��R`+���&)�U�-�q���[=3"-�qm��Jų��i����L�̞���F-]K�]Ak��ͱQ�@�ut[۴l��Q)x�.��i�%) %v$Z۴l�$�'��OB�ڦUn� �=�G��6��e4�\lm�*'UH�s��Q��Ntu��6j�r�R
�%��F-[�SW������c���A�ިY�6$��l��F��"K�6�Ŋ��FJ�3�Emh3����I�&$���A��J,Õ1g��B֣���Z�+c^i� ��0$��6Qk����S^<]@/�A�J�m`�M�u{��I���@�f�;�\$�g�-C�1�4d�"�,��i
WRE\���q�tkE]Op���5���QX<���᧙c����D�:WjD���̶��ŶH<�~�<ٲ�"��[�&KK���՜�M�&KKlC6X��H�N�&;K��Q���l��d��:�`��"n����)�C��!�!n���p��̀@�8Ϗ�&ʓk^���I���5�W�.��N���k���5zƩ�32{��HX�gȰ���L��mqj �]Upi`��0E�{b��֨Ǚj9�=D�$m�+d�rL�r�A:p�SSҿtf�A:�ǉ�N. ��O$my��U�Q �
�������Z�[�(�	l���*_Ķ)�r]�Z��w5ƶ)�-dH]�Ȯ2F\dl��іma�USl;���nQ�I�Z1v��ރ�vL!��	�6��3uG=�FK)WȨq���l�U�-Nh�Qj�'����C��Pj�'��t�rr5ҧ{"�q���D��@j�'r���C��UJ
Y�8�����CGi���cH�mC=�����+�l��:g\��&+5�� ��RשMVj�D&W�yjc�z�����y��)�1N'��.�$�]YR!��Q<�K���	AA�5�^}�vB�M�N��]��Ԙ|#]���JF.��\i�e�7&��r��tMv4f�x��;d��@^$ښ-e��	<j�����0ߞ�_������7�7>�~��p����?<�}z�}#f��LT���U��#�c�S�1<�_;e��:I]�Y\s %v����4�d�˻�z�rL�{&��:,#�0��{/oA�=�3�?=�1����|eS��l �Sx��.��z*x�=I��z=_ڦWKu�Ь'p�>qh�^�B�l��,r_7֝v���FA�{��q��Gz�d�CA��!]��S���=�Z�����mj�>�Ӷ�X!s�1i@=4]�,���sDgo�6A W�C;����T��#t`XdC�t�J���Ȟ42Êb�hS'z�ȣ���1T�Zσ����5n!�*�$��eh[k�B�;�]�Q����gı3�"OV�aE֮�7���Yzs�Y��pK�ܵ������p���еgmcS���������mcM��� �����:� cW2�nl�0vRc��(x|/��亢�x����~�����Ȗ뗨��i��͗?l�g���?��l>����Ow�������ǧO���O����n�6�OwwO7�6�<>��n����K�<����Rf�Ӣg�߭F�/߂�ק=���*A��;����(�8L�Y�T������x-ҿ|�2�K�`Pi�p�������t�pr����Z���+�	����3��G��Wr~��{U#vr�h�2J�5��������)�%�PM��w}���H�j�o��i��ɀ� c�pj�a�if�d�ҾN��cD{�zdNUzh)�d��ə���\��.?�Sk
��o���Åԝ�`�K�o��|�}�+ȹy�w2��/z�(��H�xX˘Ͽ�G-G����v�y���������Pǳ��M�&&�f��<M���ߍSa��9u3�j���zټ�� S�d����f8���M��T��P'�֙�S�E�NE/mr��%NE��gNE�/#�p*�r����#�KI8�
.!�p*�V�-��.)�?<_N8*��ƭ!�s� �ͻ���ǹ�Ч��=�_��#p��s�.zAN=b�?����??L�]l��b	�	3N8ۉ���߉3��֙S��<�r(� �9���L J�1"}�K�S�=��;N���$��p�vq�4��B��i��
�$$94 �!���4��ډ��i0����i�����i��m�:�"�ZN�S�!M��NcUӠ7k7��,��ej�:24�S��E�ǹ1ȋ��+1��k�u���^��:<�D��)!�k£��o�w~�ѡ��I,�!��R.��U�X�B��I6���������n&]�t�Rɱ �f%�ͷg�������?�y����b�nL\<��i-ԛĳ/�:���pq���|e���l�m=d�I<���g��b���"������G[������q�\�G��x����Gq�Ð=�8�'���Tp�|��M�A��{��e�\/ԃ�hF�xڱ5�([1�!�&-0{��c_4�x굿�:ױ��1P�L]
�xS�qꃧx9Y��_;�L��`��zAQK���=�ق��>.��8M�l�5Iy�����Q
�c�6�#�
9Av��ynYD͝i�h��Tc�qffh��WjP�R����=\�?6]��%��	��{��l:V2&
�\����?�{�?7�rLG]В�3��F!Y���X��z�"��ָ�����)���1�1ec3*�'�J�¶�٧��S��.�(^S蒀k��hd��pT����]
��X�!���@8�Ū�7A*�c�Π��J�]�D;y�)D��a�F0�����*jb�$���2E�-n��=��fYjكZ.C�6Wօ�#����!k�8K#Z �	I��i�RW��K���@3h.�m�ņsA��񘰸ҷ�<6ܢ����x���e���y�D�i ��{5��	=��"Yƹ��"At�r	�QQ[�*��ϣ�d!�85�o�J,�UY�K��
ٸ�m�@׹^�2μ����W�*cI^$ٻ ����Y�k5��8 b� Ģ+�C��3h�i�YV(q!�8��D�����B�q����k$G��ޒx	!cE-�a�D�Rm��h�c��kv�0�%��pMjbrG��+�/�0*j��Rbt��0��T�m�u٘x��@�ދ	��X�e���Q[�G��a���H/�+�\�h�_u�ˮ$����L�)O䒰U��$��n����\J^�������z��X�_[;gn85:	p����)�sXcjth95:	��O�N�'^'��O�N�)0�1	xl�=	t����Iϑ/`�x��x�x
�~���œ��c�Z�������O��l��4���=u�1�I���[h:sc�"�������T��l�p���T�m{��OE%�����Q�Tj�b}������c+���&����8Hwe�S����隸��3����~����5�-���E�tz����x�'9�K_>hZ�k=��6X����_��,��������y����6��|�����q󛝼��C��޿��y���Ǜ������??�}�,(�.�]��(��'��	�zh0�9DGĤ�&�'�ϻ���9%��:H�2����,���P�䢁0�*��v�P�vy$�)�)���<|��h�QUs5��c#����ū�l���Res��Ih�����~��`���r    ���J��.��,p&Q�������sH6r�t&Iћ�T�[�~��TF�eŗP�\�B���a�[�`'!���w��~� {s?�ls�M-<�,�F�L�xM�=||;�X��`$=Ňoͯn��v����S-� �Dr�����/0\�20����3������e����Z�̾xf�g{��n���l�a�0#
h,�ds��P�j���u�I�����t$��w��ak�\\mx|��Ɣ^���}�p!C��3�>^���G_6h�xATI���,��돀�h�7�)y�n��D20��3C�s���g����PEP�=+m�L�A���䢛N����wQ��m�9`���MZ��x���Cس׾t�w��w��������OW���f�L�ϟ�77C��ΓZ����ӕ�4�VU!��i�<#I��������7*9+�嵽���)��^>^U�h#>�"�����U�ǭú��'O�g�oY?��}�fR���Wr ~�@S����ѝ�yWos=��N���2(�}��z������+�j����!_Cϧ`���&�[�<�����[���f��@H�4�	b�"�>8$M�j�~U�]0��.؏ݼ+wn)�qG�k ��v~����6d�!%��w[,���EԳ����z'���dx^>�Xۅ^��caw���ӳ�o���~�"M�5ݥ}�W�&��%��(��D^���TiAQg	q�y�*�*�=��|FC�$��4���j�=�E�$�R.Ӭ�|�h�F�}2��1Ŭq8&� �$#24\�V��rͳ]�x���иt�nvJ��N;I T�9؞����`����|�3C����N�.i������rt���LhJi��[�ɤ�$��e���'QF���o+S�,	��PE����)S�'��z&��,4�0�Qτ�t��PP� %��C)kKE�hօ�A�8���r2�Q/V��5�c�2[e0
֕J�"�S�����''�.Z^.��p�j#˱BxJ��B�|�����p������a��a�_���-�0�)<裂�?k��o>~��Z�o����
4��.ؾ�)�]�(K���yF�b �yM�X�M�|�P��3ȱ�Q�HN]�[V�Iȵ��b:Ǽ�4��V�r�ŗ6$_�C�Z?M�Z�~��&ժ�op'�<sE�gz���.}��|���~�@�:4��'�/��Pr�d��?�T&o���WZ(�u�������-�(����w�,�y�Z���QL�*�9^�"�y���X�1r!��w�=���a���%�XK��Fr��\��t�U0�fG�!2��#�������/�B�`�Sf�����:��yPĒ���tچZ>���u�Kڙ�8ށ�N����s�b�]�{�iI���'��>����Q�Y<!�z�2dkOG��aq}�����k���Ҍ�-TQ�Ә�z$�~���껛���ӕ����YZr�҂=�C�ef]�UBJc}vKK+�YiA�ԑó����׶�N���\5Qݜ�� )_�����lu&�Rd,���+oVZ�E*a4񱰴rx����S*q��kii��JӰ��N��Rȸ:�lK����S�7z��u �3�|�.�iZu��`�_ZZ����YwXNpγu�.�!iE,ғsJ+�Mi���]�U����B-�%�d<���B-AG�8/�Z��^h/�]!����|-�3��Z���NE����j��*�#�)�y��'�
߬�@:Z��;"*�pQ����x���DŗU�r�g�K�����%�"��0��!�0t(4jʖ�H>N9�DN���Lj��
�1��я0�|�����\��(�E���kM9��R7�|�o���4��2J臆2~�ԤgD�������XΈr���,>-\�G���*/H(���������x��$c?�a<�B�P�+(��DF��u���P�������w�$ā�B�?������i��>P�aJu:��q��#��(�Gy�Tw���SZ�z����l<�}��z������(���KXC�I>-z�r�����E��[F����V>
5,`���Q(C�ah
�dN��V9���i�|9�&OHp:]	%��@P��O+@�e5V%��[(���
P��kά��h(�q��<�h̘ґS�W�Ӣ�t�J�^TO����1(/u��.�z�5ev��#P�颩���?�͒?���1�7A��S��+�	rXu?�p�yB?������{/S���c&k`��Jr��k�A}���1ų��2֩��|DNi!Lc��&�ƢNZ<2]�J��1�wX�A�IzMX����j3�`�����H������䔯1ub�3�g|�M;��,��X�q�g�(����o��L�ǡLmp�bT�����{|ؼ�$�:��xz�L��01_�ei��D�K����ܹR�~�GHat�j�pL�y�i���^C���id<�v��j��S]V$%�Z���ې��1Gj����Z�p�+��#e����=Ņ��|=�����R �<������{�;��A�7�p���?�	��f/�Q�����,D�ؼi��395Vj�׭O���@�Sj<S��:�0(55� ��d%v��	ѳ������]gr��E:Јq
�K����.��aNr�=F.�������5��X�u~�;��v�;��֡d���nK@��v�G��8���<<�\}~���ݧ�����>�}�o~�z����ǫm��������IO��'���U>';n��5��	��Q�XdF��>��M�8Y���/߿�&�c�<���@�[�����L�mOѵw��'}=�kI�_?j�f5���sޭ�E�����â��c�m\Vj'�G���\!�0��Xr�K��ђ�m<n�B1����í����h	��/����X�$�k!�w�Ow���O��~�W�x*�����]�@V��l~�.�y>)�U'���w�>�ʾīb��P'~�Y����>G|��Ï�<[\����"��0�Qm`)!��E���)�/B�Q]�%�|~�D���"�}��n��EXVL%�U�u!N�G*����ŗKB�;$fB��FfB�?�7��lu�4hR�Т��~]����?໻����pw�7��ݿ�j�_�� &xh�V9'ƕmiM<�Z�y�"�3�2Ҧ��k��ފf~-�sk����Հ�4�hO���v��[���mY��(���^HHyț:���eP����!2��欜A̓K2�&-�q�T���A�����Gd���h��"��u�"+��7)<"ۦ�E�|{(�V��Y��x�Q��P�:�c9��Ǯ�"�#��@�աԤP��|���P���B�
�8�x(Vg�q�a!��PJo��T�B����UeJ>�]���\�漯E�+�e\ŕ�:�*�<9Rf,0�hų�"F���%�xI��<��R��X�`�y��5���ؠa������_go�b�P�X�9�/FJO�]�b�fh=y�KE?� �yt'�"�(
<�(�6��9�p��9v����w{�,қ�֎ ŗG{%N�E^J�*�dasL��Ѯ�2�(Ki�3mzYd�i��~�"�3��8×�F��$3�q���ظUGi}..���z���Hg8W$�� �	��Y�Ϩb����0��W�{_g���(v^ ���>��f�v6#��_��ϏO?}�;<s���Bo�@�
��1�5?P��Q�GX�D�1��i�	�q���ʄqy`����g��/�v�h���<��r��v$��H�w�^��)W겷���%֥1�Sӓ3��˃����p;BA�8���E&q�6�<�͗�S����[U"��Ǧe o��zW.�ӯ�)���m��Y�v���#㴡���,Ocf�o��|G\ꟈa}>$z�8%���˟�!�,(E�s��}"�7�^�#�]d_U���:I�Vz6�/�o�}�W�[�h�^�!��j��V6ޠ-�Ø�^9O�y�C[�A�A�̻���'�s�wRK�������F��:B�?��tK���I�����~����{�D���N����� H  ����'��狈�b���H��}�p����v�����J�O��f��9r
^;�SL�г�f:������q���*=Gn����0xj��yp��<�k�i�7Pz8Ax�	?^|�>Z�?��S%S֗�^��HAG��o�w�%�ŢU,i�V��2N�[_�&�pi�۔�m��DPxQ��Uj��ٖ�o��\�QY�N*�<Z/E!��얦o�ĥ��P��dNFN;ׅBui��8@ȣ=���!������˧;��?��S��ī\�pr�N������><�p�����O����w/2B�~��GK{@�@�2�����}�����?0���_��?����ϛ�~�p����u���?��I���_.S�[kYG����o��z���y�S�տ��?\���nn7�z ����-�g°�]����z��v��oOW?>�b�Pd��*WnȺ��Jv_Jp�v=�u/�O4R�T64���ś^P��@)r�#>��6��ͻ�eQ��7|��|�:?A�[�n���iW���,�Z�����T��-r�d��*���ג��v�e�z욫�?u�|��� ���     