PGDMP         )    	            |            terion_billing    15.2    15.2 y    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    38558    terion_billing    DATABASE     �   CREATE DATABASE terion_billing WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE terion_billing;
                postgres    false            �            1255    38559    accesscontrol_log_trigger()    FUNCTION     �  CREATE FUNCTION public.accesscontrol_log_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO accesscontrol_log(distributer,product,invoicegenerator,userid,customer,staff,invoicepayslip,operation,last_updated_on,d_staff,last_updated_by)
	VALUES(NEW.distributer,NEW.product,NEW.invoicegenerator,NEW.userid,NEW.customer,NEW.staff,NEW.invoicepayslip,'insert',current_timestamp,NEW.d_staff,NEW.last_updated_by);
   
   ELSIF TG_OP = 'DELETE' THEN
       
        INSERT INTO accesscontrol_log(distributer,product,invoicegenerator,userid,customer,staff,invoicepayslip,operation,last_updated_on,d_staff,last_updated_by)
	VALUES(OLD.distributer,OLD.product,OLD.invoicegenerator,OLD.userid,OLD.customer,OLD.staff,OLD.invoicepayslip,'delete',current_timestamp,OLD.d_staff,OLD.last_updated_by);
     
	 ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO accesscontrol_log(distributer,product,invoicegenerator,userid,customer,staff,invoicepayslip,operation,last_updated_on,d_staff,last_updated_by)
	VALUES(NEW.distributer,NEW.product,NEW.invoicegenerator,NEW.userid,NEW.customer,NEW.staff,NEW.invoicepayslip,'update',current_timestamp,NEW.d_staff,NEW.last_updated_by);
       
   
		END IF;
    
    RETURN NEW;
END;
$$;
 2   DROP FUNCTION public.accesscontrol_log_trigger();
       public          postgres    false            �            1255    38560    credentials_log_trigger()    FUNCTION     M  CREATE FUNCTION public.credentials_log_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO credentials_log(userid,username,password,lastupdatedby,operation,last_updated_on)
	VALUES(NEW.userid,NEW.username,NEW.password,NEW.lastupdatedby,'insert',current_timestamp);
   
   ELSIF TG_OP = 'DELETE' THEN
       
        INSERT INTO  credentials_log(userid,username,password,lastupdatedby,operation,last_updated_on)
	VALUES(OLD.userid,OLD.username,OLD.password,OLD.lastupdatedby,'delete',current_timestamp);

	 ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO  credentials_log(userid,username,password,lastupdatedby,operation,last_updated_on)
	VALUES(NEW.userid,NEW.username,NEW.password,NEW.lastupdatedby,'update',current_timestamp);
   
       
   
		END IF;
    
    RETURN NEW;
END;

$$;
 0   DROP FUNCTION public.credentials_log_trigger();
       public          postgres    false                       1255    38561    invoice_log_trigger()    FUNCTION     B  CREATE FUNCTION public.invoice_log_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	
BEGIN
    IF TG_OP = 'INSERT' THEN
      INSERT INTO invoice_log( invoiceid, senderid, receiverid, invoicedate, sendernotes,subtotal, discount, total, invoicestatus, last_updated_by, last_updated_on,operation)
	VALUES(NEW.invoiceid,NEW.senderid,NEW.receiverid,NEW.invoicedate,NEW.sendernotes,NEW.subtotal,NEW.discount,NEW.total,NEW.invoicestatus,NEW.lastupdatedby,NEW.last_updated_on,'insert');
   
   ELSIF TG_OP = 'DELETE' THEN
         INSERT INTO invoice_log( invoiceid, senderid, receiverid, invoicedate, sendernotes,subtotal, discount, total, invoicestatus, last_updated_by, last_updated_on,operation)
	VALUES(OLD.invoiceid,OLD.senderid,OLD.receiverid,OLD.invoicedate,OLD.sendernotes,OLD.subtotal,OLD.discount,OLD.total,OLD.invoicestatus,OLD.lastupdatedby,OLD.last_updated_on,'delete');  
       

	 ELSIF TG_OP = 'UPDATE' THEN
           INSERT INTO invoice_log( invoiceid, senderid, receiverid, invoicedate, sendernotes,subtotal, discount, total, invoicestatus, last_updated_by, last_updated_on,operation)
	VALUES(NEW.invoiceid,NEW.senderid,NEW.receiverid,NEW.invoicedate,NEW.sendernotes,NEW.subtotal,NEW.discount,NEW.total,NEW.invoicestatus,NEW.lastupdatedby,NEW.last_updated_on,'update');
       
   
		END IF;
    
    RETURN NEW;
END;

$$;
 ,   DROP FUNCTION public.invoice_log_trigger();
       public          postgres    false                       1255    38562    products_log_trigger()    FUNCTION     �  CREATE FUNCTION public.products_log_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN
    IF TG_OP = 'INSERT' THEN
	  INSERT INTO public.product_log(productid, quantity, priceperitem, last_updated_by, productname, belongsto, status, batchno, cgst, sgst,operation)
		VALUES(NEW.productid,NEW.quantity,NEW.priceperitem,NEW.last_updated_by,NEW.productname,NEW.belongsto,NEW.status,NEW.batchno,NEW.cgst,NEW.sgst,'insert');
   
   ELSIF TG_OP = 'DELETE' THEN
       
        INSERT INTO public.product_log(productid, quantity, priceperitem, last_updated_by, productname, belongsto, status, batchno, cgst, sgst,operation)
		VALUES(OLD.productid,OLD.quantity,OLD.priceperitem,OLD.last_updated_by,OLD.productname,OLD.belongsto,OLD.status,OLD.batchno,OLD.cgst,OLD.sgst,'delete');
   
	 ELSIF TG_OP = 'UPDATE' THEN
       INSERT INTO public.product_log(productid, quantity, priceperitem, last_updated_by, productname, belongsto, status, batchno, cgst, sgst,operation)
		VALUES(NEW.productid,NEW.quantity,NEW.priceperitem,NEW.last_updated_by,NEW.productname,NEW.belongsto,NEW.status,NEW.batchno,NEW.cgst,NEW.sgst,'update');
   
       
   
		END IF;
    
    RETURN NEW;
END;

$$;
 -   DROP FUNCTION public.products_log_trigger();
       public          postgres    false                       1255    38563    user_log_trigger()    FUNCTION     Z
  CREATE FUNCTION public.user_log_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

	
	

BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO user_log(userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,last_updated_on,organizationname,gstno,bussinesstype,fname,lname,upiid,bankname,bankaccno,passbookimg,accholdername,ifsccode)
	VALUES( NEW.userid, NEW.email, NEW.phno, NEW.aadhar,NEW.pan, NEW.positionid, NEW.adminid, NEW.updatedby, NEW.status, NEW.userprofile, NEW.pstreetname, NEW.pdistrictid, NEW.pstateid, NEW.ppostalcode, NEW.cstreetname, NEW.cdistrictid, NEW.cstateid, NEW.cpostalcode,'insert',current_timestamp,NEW.organizationname,NEW.gstnno,NEW.bussinesstype,NEW.fname,NEW.lname,NEW.upiid,NEW.bankname,NEW.bankaccno,NEW.passbookimg,NEW.accholdername,NEW.ifsccode);
   
   ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO user_log( userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,last_updated_on,organizationname,gstno,bussinesstype,fname,lname,upiid,bankname,bankaccno,passbookimg,accholdername,ifsccode)
	VALUES( OLD.userid, OLD.email, OLD.phno, OLD.aadhar,OLD.pan, OLD.positionid, OLD.adminid,OLD.updatedby, OLD.status, OLD.userprofile, OLD.pstreetname, OLD.pdistrictid, OLD.pstateid, OLD.ppostalcode, OLD.cstreetname, OLD.cdistrictid, OLD.cstateid, OLD.cpostalcode,'delete',current_timestamp,OLD.organizationname,OLD.gstnno,OLD.bussinesstype,OLD.fname,OLD.lname,OLD.upiid,OLD.bankname,OLD.bankaccno,OLD.passbookimg,OLD.accholdername,OLD.ifsccode);
     
	 ELSIF TG_OP = 'UPDATE' THEN
       
        INSERT INTO user_log( userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode,operation,last_updated_on,organizationname,gstno,bussinesstype,fname,lname,upiid,bankname,bankaccno,passbookimg,accholdername,ifsccode)
	VALUES( NEW.userid, NEW.email, NEW.phno, NEW.aadhar,NEW.pan, NEW.positionid, NEW.adminid, NEW.updatedby, NEW.status, NEW.userprofile, NEW.pstreetname, NEW.pdistrictid, NEW.pstateid, NEW.ppostalcode, NEW.cstreetname, NEW.cdistrictid, NEW.cstateid, NEW.cpostalcode,'update',current_timestamp,NEW.organizationname,NEW.gstnno,NEW.bussinesstype,NEW.fname,NEW.lname,NEW.upiid,NEW.bankname,NEW.bankaccno,NEW.passbookimg,NEW.accholdername,NEW.ifsccode);
   
		END IF;
    
    
    RETURN OLD; 
END;


$$;
 )   DROP FUNCTION public.user_log_trigger();
       public          postgres    false            �            1259    38564    accesscontrol_log    TABLE     �  CREATE TABLE public.accesscontrol_log (
    rno integer NOT NULL,
    distributer character varying,
    product character varying,
    invoicegenerator character varying,
    userid character varying(20),
    customer character varying,
    staff character varying,
    operation character varying,
    invoicepayslip character varying,
    d_staff character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    last_updated_by character varying(90)
);
 %   DROP TABLE public.accesscontrol_log;
       public         heap    postgres    false            �            1259    38570    accesscontroll    TABLE     �  CREATE TABLE public.accesscontroll (
    rno integer NOT NULL,
    distributer character varying,
    product character varying,
    invoicegenerator character varying,
    userid character varying(20) NOT NULL,
    customer character varying,
    staff character varying,
    invoicepayslip character varying,
    d_staff character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    last_updated_by character varying(90)
);
 "   DROP TABLE public.accesscontroll;
       public         heap    postgres    false            �            1259    38576    accesscontroll_rno_seq    SEQUENCE     �   ALTER TABLE public.accesscontroll ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesscontroll_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    38577    accesscontroltrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.accesscontrol_log ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesscontroltrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    38578    credentials    TABLE       CREATE TABLE public.credentials (
    rno integer NOT NULL,
    userid character varying(20),
    username character varying,
    password character varying,
    lastupdatedby character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.credentials;
       public         heap    postgres    false            �            1259    38584    credentials_log    TABLE     5  CREATE TABLE public.credentials_log (
    rno integer NOT NULL,
    userid character varying(20),
    username character varying,
    password character varying,
    lastupdatedby character varying,
    operation character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.credentials_log;
       public         heap    postgres    false            �            1259    38590    credentials_rno_seq    SEQUENCE     �   ALTER TABLE public.credentials ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credentials_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    38591    credentialstrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.credentials_log ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credentialstrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    38592    district    TABLE     �   CREATE TABLE public.district (
    rno integer NOT NULL,
    stateid character varying(6),
    districtid character varying(6),
    districtcode character varying(6),
    districtname character varying(50)
);
    DROP TABLE public.district;
       public         heap    postgres    false            �            1259    38595    district_rno_seq    SEQUENCE     �   ALTER TABLE public.district ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.district_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    38596    feedback    TABLE     �   CREATE TABLE public.feedback (
    rno integer NOT NULL,
    userid character varying,
    feedback character varying,
    last_updated_by character varying(90),
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.feedback;
       public         heap    postgres    false            �            1259    38602    feedback_rno_seq    SEQUENCE     �   ALTER TABLE public.feedback ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.feedback_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    38603    invoice    TABLE     `  CREATE TABLE public.invoice (
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
    senderstatus integer,
    date character varying,
    reciverstatus integer,
    transactionid character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.invoice;
       public         heap    postgres    false            �            1259    38610    invoice_id_seq    SEQUENCE     y   CREATE SEQUENCE public.invoice_id_seq
    START WITH 1000
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.invoice_id_seq;
       public          postgres    false    226            �           0    0    invoice_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.invoice_id_seq OWNED BY public.invoice.invoiceid;
          public          postgres    false    227            �            1259    38611    invoice_log    TABLE     �  CREATE TABLE public.invoice_log (
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
    operation character varying,
    last_updated_by character varying(90),
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.invoice_log;
       public         heap    postgres    false            �            1259    38617    invoice_rno_seq    SEQUENCE     �   ALTER TABLE public.invoice ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoice_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    38618    invoiceitem    TABLE     r  CREATE TABLE public.invoiceitem (
    rno integer NOT NULL,
    invoiceid character varying,
    productid character varying,
    quantity character varying,
    cost character varying,
    discountperitem character varying,
    lastupdatedby character varying,
    hsncode character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.invoiceitem;
       public         heap    postgres    false            �            1259    38624    invoiceitem_rno_seq    SEQUENCE     �   ALTER TABLE public.invoiceitem ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoiceitem_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    38625    invoiceslip    TABLE        CREATE TABLE public.invoiceslip (
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
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.invoiceslip;
       public         heap    postgres    false            �            1259    38631    invoiceslip_rno_seq    SEQUENCE     �   ALTER TABLE public.invoiceslip ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoiceslip_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    38632    invoicetrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.invoice_log ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoicetrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    38633    position    TABLE     �   CREATE TABLE public."position" (
    rno integer NOT NULL,
    positionid character varying,
    "position" character varying,
    lastupdatedby character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."position";
       public         heap    postgres    false            �            1259    38639    position_rno_seq    SEQUENCE     �   ALTER TABLE public."position" ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.position_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    38640 	   previlage    TABLE     �   CREATE TABLE public.previlage (
    rno integer NOT NULL,
    previlageid character varying,
    previlage character varying,
    lastupdatedby character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.previlage;
       public         heap    postgres    false            �            1259    38646    previlage_rno_seq    SEQUENCE     �   ALTER TABLE public.previlage ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.previlage_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    38647    product_log    TABLE       CREATE TABLE public.product_log (
    productid character varying(200),
    quantity integer,
    priceperitem character varying(90),
    last_updated_by character varying(90),
    productname character varying(90),
    belongsto character varying(90),
    status character varying(90),
    batchno character varying(90),
    cgst character varying(90),
    sgst character varying(90),
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    operation character varying(90),
    rno integer NOT NULL
);
    DROP TABLE public.product_log;
       public         heap    postgres    false            �            1259    38653    product_log_rno_seq    SEQUENCE     �   CREATE SEQUENCE public.product_log_rno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_log_rno_seq;
       public          postgres    false    239            �           0    0    product_log_rno_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_log_rno_seq OWNED BY public.product_log.rno;
          public          postgres    false    240            �            1259    38654    products    TABLE     �  CREATE TABLE public.products (
    rno integer NOT NULL,
    productid character varying,
    quantity integer,
    priceperitem character varying,
    last_updated_by character varying,
    productname character varying,
    belongsto character varying,
    status character varying,
    batchno character varying,
    cgst character varying,
    sgst character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    38660    products_rno_seq    SEQUENCE     �   ALTER TABLE public.products ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    38733    proformainvoice    TABLE     �  CREATE TABLE public.proformainvoice (
    rno integer NOT NULL,
    invoiceid character varying DEFAULT ('INVOICE'::text || nextval('public.invoice_id_seq'::regclass)),
    senderid character varying(20),
    receiverid character varying(20),
    invoicedate date DEFAULT CURRENT_TIMESTAMP,
    sendernotes character varying,
    subtotal character varying,
    discount character varying,
    total character varying,
    invoicestatus character varying,
    lastupdatedby character varying,
    senderstatus integer,
    date character varying,
    reciverstatus integer,
    transactionid character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.proformainvoice;
       public         heap    postgres    false    227            �            1259    38747    proformainvoice_rno_seq    SEQUENCE     �   ALTER TABLE public.proformainvoice ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.proformainvoice_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    250            �            1259    38741    proformainvoiceitem    TABLE     z  CREATE TABLE public.proformainvoiceitem (
    rno integer NOT NULL,
    invoiceid character varying,
    productid character varying,
    quantity character varying,
    cost character varying,
    discountperitem character varying,
    lastupdatedby character varying,
    hsncode character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 '   DROP TABLE public.proformainvoiceitem;
       public         heap    postgres    false            �            1259    38748    proformainvoiceitem_rno_seq    SEQUENCE     �   ALTER TABLE public.proformainvoiceitem ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.proformainvoiceitem_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    251            �            1259    38661    state    TABLE     �   CREATE TABLE public.state (
    rno integer NOT NULL,
    stateid character varying,
    statecode character varying,
    statename character varying,
    lastupdatedby character varying,
    updatedon character varying
);
    DROP TABLE public.state;
       public         heap    postgres    false            �            1259    38666    state_rno_seq    SEQUENCE     �   ALTER TABLE public.state ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.state_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    243            �            1259    38667    user    TABLE     D  CREATE TABLE public."user" (
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
       public         heap    postgres    false            �            1259    38673    user_log    TABLE     c  CREATE TABLE public.user_log (
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
    last_update_on timestamp(6) without time zone,
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
    DROP TABLE public.user_log;
       public         heap    postgres    false            �            1259    38678    user_rno_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    245            �            1259    38679    user_user_id_seq    SEQUENCE     |   CREATE SEQUENCE public.user_user_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_user_id_seq;
       public          postgres    false    245            �           0    0    user_user_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".userid;
          public          postgres    false    248            �            1259    38680    usertrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.user_log ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usertrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    246            �           2604    38681    invoice invoiceid    DEFAULT     �   ALTER TABLE ONLY public.invoice ALTER COLUMN invoiceid SET DEFAULT ('INVOICE'::text || nextval('public.invoice_id_seq'::regclass));
 @   ALTER TABLE public.invoice ALTER COLUMN invoiceid DROP DEFAULT;
       public          postgres    false    227    226            �           2604    38682    product_log rno    DEFAULT     r   ALTER TABLE ONLY public.product_log ALTER COLUMN rno SET DEFAULT nextval('public.product_log_rno_seq'::regclass);
 >   ALTER TABLE public.product_log ALTER COLUMN rno DROP DEFAULT;
       public          postgres    false    240    239            �           2604    38683    user userid    DEFAULT     |   ALTER TABLE ONLY public."user" ALTER COLUMN userid SET DEFAULT ('U'::text || nextval('public.user_user_id_seq'::regclass));
 <   ALTER TABLE public."user" ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    248    245            �          0    38564    accesscontrol_log 
   TABLE DATA           �   COPY public.accesscontrol_log (rno, distributer, product, invoicegenerator, userid, customer, staff, operation, invoicepayslip, d_staff, last_updated_on, last_updated_by) FROM stdin;
    public          postgres    false    214   �       �          0    38570    accesscontroll 
   TABLE DATA           �   COPY public.accesscontroll (rno, distributer, product, invoicegenerator, userid, customer, staff, invoicepayslip, d_staff, last_updated_on, last_updated_by) FROM stdin;
    public          postgres    false    215   W�       �          0    38578    credentials 
   TABLE DATA           f   COPY public.credentials (rno, userid, username, password, lastupdatedby, last_updated_on) FROM stdin;
    public          postgres    false    218   ��       �          0    38584    credentials_log 
   TABLE DATA           u   COPY public.credentials_log (rno, userid, username, password, lastupdatedby, operation, last_updated_on) FROM stdin;
    public          postgres    false    219   S�       �          0    38592    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   y�       �          0    38596    feedback 
   TABLE DATA           [   COPY public.feedback (rno, userid, feedback, last_updated_by, last_updated_on) FROM stdin;
    public          postgres    false    224   ��       �          0    38603    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, senderstatus, date, reciverstatus, transactionid, last_updated_on) FROM stdin;
    public          postgres    false    226   �       �          0    38611    invoice_log 
   TABLE DATA           �   COPY public.invoice_log (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, operation, last_updated_by, last_updated_on) FROM stdin;
    public          postgres    false    228   ��       �          0    38618    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, hsncode, last_updated_on) FROM stdin;
    public          postgres    false    230   =�       �          0    38625    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, last_updated_on) FROM stdin;
    public          postgres    false    232   �       �          0    38633    position 
   TABLE DATA           a   COPY public."position" (rno, positionid, "position", lastupdatedby, last_updated_on) FROM stdin;
    public          postgres    false    235   !�       �          0    38640 	   previlage 
   TABLE DATA           `   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, last_updated_on) FROM stdin;
    public          postgres    false    237   ��       �          0    38647    product_log 
   TABLE DATA           �   COPY public.product_log (productid, quantity, priceperitem, last_updated_by, productname, belongsto, status, batchno, cgst, sgst, last_updated_on, operation, rno) FROM stdin;
    public          postgres    false    239   ��       �          0    38654    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, last_updated_by, productname, belongsto, status, batchno, cgst, sgst, last_updated_on) FROM stdin;
    public          postgres    false    241   ��       �          0    38733    proformainvoice 
   TABLE DATA           �   COPY public.proformainvoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, senderstatus, date, reciverstatus, transactionid, last_updated_on) FROM stdin;
    public          postgres    false    250   ��       �          0    38741    proformainvoiceitem 
   TABLE DATA           �   COPY public.proformainvoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, hsncode, last_updated_on) FROM stdin;
    public          postgres    false    251   -       �          0    38661    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    243   �      �          0    38667    user 
   TABLE DATA           b  COPY public."user" (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon, organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg, accholdername, ifsccode) FROM stdin;
    public          postgres    false    245   0      �          0    38673    user_log 
   TABLE DATA           ~  COPY public.user_log (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, last_update_on, organizationname, gstno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg, accholdername, ifsccode) FROM stdin;
    public          postgres    false    246   �      �           0    0    accesscontroll_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 104, true);
          public          postgres    false    216            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 238, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.credentials_rno_seq', 119, true);
          public          postgres    false    220            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 252, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    feedback_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.feedback_rno_seq', 5, true);
          public          postgres    false    225            �           0    0    invoice_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_id_seq', 1515, true);
          public          postgres    false    227            �           0    0    invoice_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_rno_seq', 504, true);
          public          postgres    false    229            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 520, true);
          public          postgres    false    231            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    233            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 1116, true);
          public          postgres    false    234            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 5, true);
          public          postgres    false    236            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    238            �           0    0    product_log_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.product_log_rno_seq', 404, true);
          public          postgres    false    240            �           0    0    products_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.products_rno_seq', 148, true);
          public          postgres    false    242            �           0    0    proformainvoice_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.proformainvoice_rno_seq', 40, true);
          public          postgres    false    252            �           0    0    proformainvoiceitem_rno_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.proformainvoiceitem_rno_seq', 43, true);
          public          postgres    false    253            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    244            �           0    0    user_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.user_rno_seq', 228, true);
          public          postgres    false    247            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    248            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 845, true);
          public          postgres    false    249            �           2606    38685 "   accesscontroll accesscontroll_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.accesscontroll
    ADD CONSTRAINT accesscontroll_pkey PRIMARY KEY (rno);
 L   ALTER TABLE ONLY public.accesscontroll DROP CONSTRAINT accesscontroll_pkey;
       public            postgres    false    215            �           2606    38687 +   accesscontrol_log accesscontroltrigger_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.accesscontrol_log
    ADD CONSTRAINT accesscontroltrigger_pkey PRIMARY KEY (rno);
 U   ALTER TABLE ONLY public.accesscontrol_log DROP CONSTRAINT accesscontroltrigger_pkey;
       public            postgres    false    214            �           2606    38689    credentials credentials_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.credentials DROP CONSTRAINT credentials_pkey;
       public            postgres    false    218            �           2606    38691 '   credentials_log credentialstrigger_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.credentials_log
    ADD CONSTRAINT credentialstrigger_pkey PRIMARY KEY (rno);
 Q   ALTER TABLE ONLY public.credentials_log DROP CONSTRAINT credentialstrigger_pkey;
       public            postgres    false    219            �           2606    38693    district district_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (rno);
 @   ALTER TABLE ONLY public.district DROP CONSTRAINT district_pkey;
       public            postgres    false    222            �           2606    38695    user email_already_exsist 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT email_already_exsist UNIQUE (email);
 E   ALTER TABLE ONLY public."user" DROP CONSTRAINT email_already_exsist;
       public            postgres    false    245            �           2606    38697 .   credentials email_already_exsist_in_user_table 
   CONSTRAINT     m   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT email_already_exsist_in_user_table UNIQUE (username);
 X   ALTER TABLE ONLY public.credentials DROP CONSTRAINT email_already_exsist_in_user_table;
       public            postgres    false    218            �           2606    38699    invoice invoice_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (rno);
 >   ALTER TABLE ONLY public.invoice DROP CONSTRAINT invoice_pkey;
       public            postgres    false    226            �           2606    38701    invoiceitem invoiceitem_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.invoiceitem
    ADD CONSTRAINT invoiceitem_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.invoiceitem DROP CONSTRAINT invoiceitem_pkey;
       public            postgres    false    230            �           2606    38703    invoiceslip invoiceslip_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.invoiceslip
    ADD CONSTRAINT invoiceslip_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.invoiceslip DROP CONSTRAINT invoiceslip_pkey;
       public            postgres    false    232            �           2606    38705    invoice_log invoicetrigger_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.invoice_log
    ADD CONSTRAINT invoicetrigger_pkey PRIMARY KEY (rno);
 I   ALTER TABLE ONLY public.invoice_log DROP CONSTRAINT invoicetrigger_pkey;
       public            postgres    false    228            �           2606    38707    position position_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (rno);
 B   ALTER TABLE ONLY public."position" DROP CONSTRAINT position_pkey;
       public            postgres    false    235            �           2606    38709    previlage previlage_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.previlage
    ADD CONSTRAINT previlage_pkey PRIMARY KEY (rno);
 B   ALTER TABLE ONLY public.previlage DROP CONSTRAINT previlage_pkey;
       public            postgres    false    237            �           2606    38711    product_log product_log_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.product_log
    ADD CONSTRAINT product_log_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.product_log DROP CONSTRAINT product_log_pkey;
       public            postgres    false    239            �           2606    38713    products products_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (rno);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    241            �           2606    38715    user set_unique_email 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT set_unique_email UNIQUE (email);
 A   ALTER TABLE ONLY public."user" DROP CONSTRAINT set_unique_email;
       public            postgres    false    245                       2606    38717    user set_unique_userid 
   CONSTRAINT     U   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT set_unique_userid UNIQUE (userid);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT set_unique_userid;
       public            postgres    false    245            �           2606    38719    state state_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (rno);
 :   ALTER TABLE ONLY public.state DROP CONSTRAINT state_pkey;
       public            postgres    false    243                       2606    38721    user user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (rno);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    245                       2606    38723    user userid_already_exsist 
   CONSTRAINT     Y   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT userid_already_exsist UNIQUE (userid);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT userid_already_exsist;
       public            postgres    false    245            �           2606    38725 /   credentials userid_already_exsist_in_user_table 
   CONSTRAINT     l   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT userid_already_exsist_in_user_table UNIQUE (userid);
 Y   ALTER TABLE ONLY public.credentials DROP CONSTRAINT userid_already_exsist_in_user_table;
       public            postgres    false    218                       2606    38727    user_log usertrigger_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_log
    ADD CONSTRAINT usertrigger_pkey PRIMARY KEY (rno);
 C   ALTER TABLE ONLY public.user_log DROP CONSTRAINT usertrigger_pkey;
       public            postgres    false    246                       2620    38728     accesscontroll accesscontrol_log    TRIGGER     �   CREATE TRIGGER accesscontrol_log AFTER INSERT ON public.accesscontroll FOR EACH ROW EXECUTE FUNCTION public.accesscontrol_log_trigger();
 9   DROP TRIGGER accesscontrol_log ON public.accesscontroll;
       public          postgres    false    215    254            	           2620    38729    credentials credentials_log    TRIGGER     �   CREATE TRIGGER credentials_log AFTER INSERT OR DELETE OR UPDATE ON public.credentials FOR EACH ROW EXECUTE FUNCTION public.credentials_log_trigger();
 4   DROP TRIGGER credentials_log ON public.credentials;
       public          postgres    false    255    218            
           2620    38730    invoice invoice_log    TRIGGER     �   CREATE TRIGGER invoice_log AFTER INSERT OR DELETE OR UPDATE ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.invoice_log_trigger();
 ,   DROP TRIGGER invoice_log ON public.invoice;
       public          postgres    false    226    267                       2620    38731    products product_log    TRIGGER     �   CREATE TRIGGER product_log AFTER INSERT OR DELETE OR UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.products_log_trigger();
 -   DROP TRIGGER product_log ON public.products;
       public          postgres    false    241    268            �   +  x�}�;n�0��>E.�oJ�3w��CӡK���G�H5��|�E�&������	�������$ 9	�9P�e[�/+�-��k����
�	U�e`��i/؂%��Rq���L��ܓ-���(��e¼�5�T�IK��=�����q`��nbk5W��$���:>�c��	S�b%����d�K���j�L�+,=���rm�ƹW��Jk�z��M�Ba9]���d�h���N�����?�%$'w�z�~K���'�z�PJT4۽ֺA�6؞�r@�G�]� �}�sZ��U���      �   6  x�u��j�0E��W�"��̮�u7��h� ���j�"0��\͵.��������\�/�Q�K�L�T��~������7���I2��Z����0�Ҟ����P�L:ē�NE�F��G:�L�n�n�A�LEY;���@Z�<9�w(O��B ��XY;T�1�w�����N����������I��gS��I%I�a�)^~�W��QG�����W�ˁ���>m�6����h`�\���l��80
���n���x��R)�̀e���<�'-WPr(%r-�VI�ȓ�}C��n*DP� oi]�	+��      �   �  x����n�@Eף��d��p^+�6]�� � 9��HFmE���@.��
t�.�K4� �0=���8tǷ���i�q��Hl�r7�77�Y(s��;Fn��},���I�^�in��;m���Rq
Yq7�cF��S�	��'� ��G�Eq!8���>0|%�gv�
��I1��!3�~�Z�Ձ��6������0w�ݱ_�_�%fJ6A I*�*wfT���1fpѲ�nB�T�����������㮾��ɗ�$κ!��$��R�f�ʉe�/1�F�.��ъq1e�%��d!��T���������i��~��2L��Ņ�	e�Dř��ԭp��c;�{�����2z $Д`0}��z����9DRvц�5����z�t��H��h)I���T��ԫ(i��X���V"5�i�?�      �     x����j1��~�i>4�N.���k�,�M�$�n��y���u�ݵ��`̏��f���9o��q���C�=����~0M;�����O��{�L�t���ڥ�m�APV�`�J���?^�qj�~{�|����j���a:���gKbP͗7��[1���L"��l�G�۴���Cː$�j\���i�/
X�h���UU@󹟶����Ȣ�1C��	pRE�Bf�R��᳣�EFB�@� +��:4Ӯ�;~�
�'J1Y�N�Pi��X��q���d�1jq���{����K!E�6�%j1pF�^(*���6�|�<)�4�t�¨.���.���j@�1EJ:�������;U����VNׇ�<@	��p�!IG&X��r����'���Ќ�������$�i�U����ܳ�Lъ��Ҷx�[�l������,*ե��|�hn�D���`!q�yv��D3v>�d�VJC+6��yU���XfK�����i��b�����	}8Vv�Z�ߖ�4      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �   i   x���1�  ����HZ
�� GYk4�$.~�'h��ָ�0#�,ZW!W���5�w�&����Ur.�,�-9�C>i�\[9u'2O1�z)�d�%��1���9v      �   �
  x�����e�E���X��"O&��ș#,���w���3���4�� �Z"Oq�H�՗��~��IH^~�Z����re����L/?���U��w�����]�բuT�WQK��Cn�@�~U-u���Ȏ��^,��&�'N;�የ��� ��Ar�d���F�#w9J�x�n�H�b5q�Q_FE���z�p=��˼x�F1N:Z	���R�� I >B]�z���%gI
|C
�a�w!(Y�V��@�5����:�V o� %+��
� ��i�-�.i�Z�Q��_���I��NZ��2��s��HKW�V�d^X�a@OV�s�K�45��%+��
��q�wA%�dYX!s���9H��Rc�� -�H�"+�:c�dYXa��`���N��,������i�$%�%�Ƙ͆D���$#�#��tt
E�Ћ��� w�p�CW����x�%���@�!��cSmIrP�4�*hEPm�t u@����:�c�xҁ���'8�5�)�A;�l�wlpw_૶6T5| O:�;:�
�1*��Q����'@Sp]Y����z�<w:t=:dD)$#�A#�c�����́���� �_B��c��d=h��E��b_�d=h����09>OOFЃF�8�\���b�z2��l��:;�:(v=)�6��POeR���v�A �/�O#�0OOB��B���V8�5*�'!�Q!�E�c�8��$;*�b4�E�IvT8A6:6p���ݮl�<:
�V��KJ��J@ÃNJ5��I	vP	2�Z�S�V~$%��M�ĖJ8�����HFh#�G+H��l��8��y3��B	d���&��	��o��G�B[H!��=��� ����G;2��B
$��6i�%���h$-��2�}�󢌱�(y�-��P���f���^�\G�B[xa����b���������'z��>���g����Uk�B[xag�8��]�2�[k�/����q�І�1�I^�;^�ωK�2Po����7�p�3Q�c_�1oI
~C
�(�"k+-c7�����(��c��qL\R��P�}�X���7'�?6�ͅ�����z��>I~G7��qg��6x��$�!�Op,F�_����4��Ko]+%�6��I�y�f����.��I���	P�A?���߷2h-&.����]N��*8h^4V%�6hqR���vX���A�(��h;��I6�����a��w��K:�u�.�;�"�U�mS�A?���x�j8��8���ϫ8*��;��I�<��B:84�I�`{��Y��Z�ap��Axx�6�v�:��q�qhGɌ��I>}�ל�R[��'�`�A�����5�-�`�8g�h{���q��㈮��h9�`�A�uj�8̨�W��q�}ޘ{1��1y�AQNrh��x�����9�~�-���ۜH�,t``�k�����T4q:��پu��T,q:��`ۆ�1k4�|�%�B��u�b[O��8����#h��3b_��@l��A�2�`��H��vAz�..&���&��� �K�(��P�&%�B	[ ��h8�V�"��Z8a��(�T�譢�59�:��	��1tVB�-�*��;o#i,Z�P��*��	b�w[�;M�E]��@�AМ�+S�\��*����A�}(��\�Upq�E�~�"Z��V�ŝ��H�6"�X^5�u�[����N��\�Upqs<#�M�Ei�ܢ�r�{��u�ۤ[�Ulq�c�����%%�B����f��?��.eu�Y����;C��'	aY��t��K��o�,�*���87��y�NP�*��	R�I��K�E]ewAq�P��F�B��
-n��gK�ťԢ�R�� ��+��:���Z�Ujq�q�n�F�%+�b������ި�RnQW���X,#���-8����������'ya\ܚ���<^�,��)������"0��z�g�袮�����;�C�d�Utq��񁸗��E������.�qޮ���]�Ut1sB�wAh�����JNXe7�]:(�\�Urq�CqhGf{����
.nrFlw��@��ܢ�r�{��s��<v��[�Unq�<��E��r���-nr��o%���'u\��0���w
.�*���Ѹ�E�3��SpQW��Mμƴ��#t
.�*����}��~K�E]�79~��	�O�-�*��Ù��h�"�Wc<����'�q6���)�����&G��6s�u�-�*�����dbX�)������)�j8=Jx'�u[��D���I����Z�Ujq���NF��N)�����&gčRu��RjQW��=Η?[WţI�E]�w8c>qi�k<��Т�B�-s�5��kP��.��*�Fa�̢�2��=�D��J�N��"���,nrf̦�D?���+&L7���>gi��ܝ⊺�+&��ɉW �tD$��;�fq.A@�ְo���>������3�,���jZ����ߜ���N����P2�C.r1������	�����������`��qtFq��6���X
/Ƒ���_F��|����G���y~0���:w�Һ]�ɤ���Oo?W������"׸��Q"KI�8�*���vP��3P��^~�YL��p�y��h�.����"��      �   y
  x���ˮ^���>O�� �Diϊ��L�YG��ɠ��h��/�߆y
p���{Y��ǋ�����ǿ��?����w������#��{�O?���t����_�����g_�w ��q_�m	$m�XTj�u��:��H�M���c��Z�Ĵ)i�sm� �.pqN���8݅����'0��\���8���f�HL����H��X/�F�윦�_��k�%�t� ?�L�p�5�2Z�1���$�g▃ΐ���b�2���G�nK� M<щ��%��u������X��D\/��$<��sW���Bn���e�Hxb�g/�m9p�l5���N,�|w�*�C�EԆ��8�X��@{]�MU��k&:��3k�%+�ɺ�j}�幉'<��s��LH#�=��T��@{X�jι���	N*�|��,��z�tB�vм���L:�k'2i��{�i��1�k'0i�m��U�:����,�K�V����	K:�Ҵ��h6�y�$,�K�)Eۘ j٭	K���m���0���*�j,^}����x����彸���)�O>�����QP&#�H;�|H&Fw�nϋ�}Ι��C2M[����iQ1�D&�i�z49���Ld�!��C�@�}x���L>$��AQ<܉L>$}���W��$2�a�E=&�����ДÆi�ӱ���D�6LӶ���{ v�~%0�L[ z�Z��Y��r&��?V	�/+�)�`J,U6l�n-s%0�L�L1U�s'2e�L�Yh��WC�Ζ)+�)�hZ����o��~%4�M��~ZIa�qs%4�a�$o=�}��ZLV"sd�V�S@j˦m==����Y\�
��:Z���x3�D�(���:�����,#�ի���W�ϬN0�V>�Mkʋ���� 4ˏ�9�=�t�zbt��Nʄ�D�TT�������A��$M�f�<A:
H߅��CS\�M�w�5]=a:
Lwゞ��+'�+�Zp�@|��9��AO�����~�Ֆe�K<���ދ�~�։������_Ԗ�>Z��h��'Lu����դc��H�����$�f�B��ՏE���=ѭ�M��'Duћ������b�[�6�n ����P���D��z(�&D�́Q!�9���ٷ\�AI|��F*1�Cdy 
	�y��5��{��q��� �N|�:d���9�����������?&>�!�ÿ(�m��'�x�s������N�t��<t\�y#�N��0:����):>h"t�q�m`W��'D�!��-�Ж��Q�0!�[�ƻ�l6Ǚ��'B�!��˚�͝���P�{�@�]J��CB��ȴ>��9%B�!�3���=]���8�v��:��]���3�6P̘�(�	���C�m�N(%B�!�3�*m�G�3N��P�+.�m<��Ag?$t^Qқ%�x����@eG[�,lv�A��$^ �@|��2��8CI� t_ܺ�E
,Os�$^ �@���O��qrJ����ˡ襮� o!_Qr��zA�uo�Җ�=�.I�@�:_b���3�GR/}��|�6f2aWO�B�:ă�m��#��PP��2�������tL��!���ZX���'M�!��CO²��[|��'�Wޡ����� �Q2qe�Vg�C�C~�	��C\ه���-�R]�7����=P�d�Fm����@�D�)��bNVؕ�1M"�DON�q=���M=aZY��|yXx�+���h_[z,�cR\/$W��r��"i%9��r=��b�o���D\9�����NwFȓ��+��e#i��{\�&W�mu�i���/��h�!z����*+�Krq�"z��K��ҨgO�V>��1�Z~DyIN"��DO��o0��O��Jĕ�艺�j7d�gO�Vf�'��jos���D\ىv��x��ng�M.�H�E�����8�_���Q���,��m���<E\y�ݟ1����{��*��U�@������!�8�lE���A����cc�q�+�]���ki2qe,��^B�ԭ�B[m,u�Die-zpt��6Y1r11Z9�hO//֧_Frq�,z ��g,��k�	��Y�/�n�eQ-#Y���=w+�-b�K�"��E�㲮���1 ���r=Gl��{]�qe/z �~Yg#��TL�"��E��VJ�|��%�W�}q�>y��9��$�W���e�Mґ���a�+w�6��Q��ɓň+�Ѿ�_��%�z�K#�,F�)�+$꩘<F\y���_K�,�H]<Z����ܖb���eĕ�聸�ƚ���H.#�\F��O���>ٌ��=_~�`]_��'�W>�}������F�NF#��F��+�ӱ��=��ш+�����<7�W��Z���=!����������u�M���i�����x��w$�� y���%�)p�m�B�o�T�bĕ�(��͓7�~�j7���x"���FE|��
�2����,F�;�e�6F@�4!��bT��v�P��z��8��.�����������'J+Ի�ϛ��7R�.����@��~9���x��U����Q#k�����0%���ϡ���o��x����~�}���Ͽ�;�r')�1@l���������/��ȷ�����z.i�S�^���/��a��0�0?��������f      �   �	  x���Mn%9��ϧ�tB�HQz��,zӳ�U���|�E�m�F�7Q�)~�O�u�?�����׿�K���C��C���?mj�������S�em5��n�Ķ��X��z�|6�����'��jmO�Wk�;�#������b	Ց��R����N��gϤ��3�ϴ&��L�wC��v�Z}�\�u<�{���Vj��qŐ!x�K�J}^�Ö�阍jMj-ԈI�k(b���Ę�/���v��.
u�Lϐ鏆7�2�au�Lϐ��xZ��|�D��)�Ҟ-�j�0��J�i����Ůi���dz�lku<{����Õ �d�v=�]�;l$�z;^�����jCm�f]�'[�_�OS� �Zjn�E}A���.D��S���n��}'�cR���^j'r�e*�^�&��8k��@5?7�H`����J'.ĚL"#q�������{�)'�z���|ט��F��N����o]n�&#Qe���>����>��ő��s��jB�8/_�ى,;'�[�����2\V��; m��'��.h�I�m��
���g��-p�#�e\ʒ�L��a$���K	��K%���	.+�RVd4���y&��LZ��m�鶄��Lxy����D����g�ˋ�-
<D��	-�Z�ZÅRc�fB�K�̙�q������-�j�h�[3��%Z��@��BZ�6��7[��ZE?��uiX3v����/���/�(�͙�������Y�V�k��3�Yl�n!V�k�sW߉>�{�i�]\	�q�][����RťB�V���ީ?�ꏴ�N�l~���P�$�Ʃ�o-�3�h��oh�7����Zk��P���o<9#v�o��Qߖ)�����n��߯���S*����)E��ֿ����;�g��#uF�@��wm�hڌX��B��~y�N��d�f��,6�u9��	uf�@omp��0�m���K�zk'G��|.|�$��T�o-��kᤷ6�E
C/C��Ay
�W����*�q543ӡNxũ:�W7#$\��	�(�DO�l�c�q�+6\�P��G9�a�WA?�Nlũ񻥝Ar`��n�ЊSe���FF�"�k5qW����k�M҄�,�b��Y�c<�6a5˺��^��	�Y�����o���E�l��U��j�jX6� Zp�Hj�jX��(f(`%�&�f����.�Sx҉�Yp50z1q`�oI�'�f��`{M�i�]�Y��,��=3�5�E𹉬U�LX�Ŗ�.�D�*Vl��9�	L��W��*x�rPwc�U�j\�ETqWE�W��*����6f~o�j\͝r:��h|���*��V�"��(�쉫UpE�)��N&wK\���I6��"�'pe��Up5����I�M>�Wl�*�l�%&�:�=i��s_�r\�dԳ��\�ۈ�&?���@#����*���y�^��\z6z�)�o,�M=�Jk4@}b��sgҞ}�[��񽋗0y�l�J5S�_5���ɥg�W�C��l���ӳ�+�fO�l4^ɧ7i�Z�Y�ni)N��� ���ąd�`%�ޤ L^z-�,&���V/�7���''Ċ�V���չʱd�[��r�}�N��ǝ0+�P�z�?����R&�ޤ��jd?${$�7K>��P��W:p3 M�I��&���lz;n�n��K�r�*���`���1;��dӛ�mzG���S� +�O�x�&fX$�d�[�~��qO�sp«�>��w���d�[�}r��m��h�m�^Z��ti>�/���z�2�����<;��%a���B�&�ɰ�^f1g���2�DK���sc�������0�g��VO��k�!���H;��n�b+�F��6�v�C9[�W5QکM����AR<8%;����quk��"���\{;��n�1�J�ɵ��*�w��h�r)�Z�<{;���W�-������k�Z򟩑��ZMQ�N|Y��b��`aJ��Y��b�Zb���n���
�b��u-T�ŃNh�P[���+�`"H���P��[T�!,4ɯ�����i��c�6�u\C�Ԫ^�l����z;��n�q�A�\�Q�������{2�9�q��z�4�w�T ��z;.�n���(��or�������T�UP�sW^p����n��I&�WP���6�c��:��nmp4P_h��M\WP[�
��N&�Io^p5�3�ʽ7t��Lz;ֶ+���'�ގ��[�إ�p|1�����ik_?�i����Qp�����X�GC��*�Gc����ͅ�Ԝ���:.%��6�c^���D�8�uk�ٴ:�u4��kn������ɚiQP���&�#��]����E������Xۗĉ��Fa�WqZ z!Ƣ��f�Nwi��T���ՇA��:7���̽��}��l�l0?6�څm��T>;���\���xm�t�}�J%ގ�؟�*Y�t&ގ��U�nCHc��6v���`��]��+�pپ�'��λ���}������X�      �      x������ � �      �   g   x���M
� ���)����Dw�a?B�
t�G��[<Ḋ�k��f,3�[�:�#�Q\/�E���{�-�`�)5�@p�������57Ko�� ��2R      �      x������ � �      �      x���K�9r�ץ_���J������{30<^`R�-�G#H����If���I��SF�ݭ�����߼������K�~�������O�_�*�/qb�~�ާ�����hR���|�����Sx���گ��]��q߾�����NNp.�m.��\|���������?>]9�|v������@���U����Kx�������t%��Pr'*�(}�?bG=��巿~}����~����@�;��]�w/ɻkt��_������k|%�'�;�,�'����G~X�Y�R������?�����w��J��I5���A��lo���G��w��w�j���*+���ߏ�x��S�g_���pI���0\;�>�;Hǫ/�A}z��wvף4������q��ę��`O���X�A�M ���^��̧� o_��d�F�q�?�MoR���ǟ�~����v:���K��l�+L"�"�x��J��=����K��[�wFw.�!,%��(�1>8�e����*?u�ś�� ��:,#�~%���zgX����|�zM*���_%)r'O�$���g�3*��»��?���G�ŷ��/��|������o�~��;�����?�`�M����lJ�Z^�����_?���]3���O9ǃ�v),�_,�$�\q�?����mD����W����u�a��c�s!ǹ\|�8�\�������o�#�;�/�?�!gv��E�Ets.j8�1�B�9VlJo��3�f��h;Тl�g�ppc|Cȡ�������P��w(/>d�M�ϡ�tz(O�)����!�%�M�j]1���!G6�3�������Җ���� c�8���lq��ʏq�������@�Y"���;�gB�\��6߇-6�?t��BfB�q��Կ!�� m+)�L�@��|��.	���>@��S���:�e�x�s�p>.����bnӘ$�/�+Dr1��!��{���h�tۢ��D� �{��c���ܢ����m�VӖß�^!��9wH�K.:Y�Eu���1š�B$s.��".�-��z$�"��s��ݤC���Z�ﲹ(u�<���F6��k|���I�ش/p,g9��4t7r��>��q��N�m��U$���#��9w���vr����F"`���M�Cu\$�5o]Aj�� gP�͹�:�_��l3�j����K|��)������eKÕ2�.1�S��4���'I��J�c��AsD�9�1�B��m�N��j�y�p�F�;Dǥŝ�j
i�هtL�DG��s��1٬����e&!&Z��⨴xV��J���P6�9�����@g6�n��F�.A,/t��J�g`P`It*+�4�Re
��>/\.;��#���_d��2��v��}�c+ǙN����uUmE�����R�Y0n:��Ж�f�>�AE
���Ȩ�D����.�7o>逃��'�5�颴z��-��#���e�3rƸ�Q��X��'	��9
�8N��F�tr#��,�Yq�����J.���Q���䢮�6\��=�R��aFFU�7��f�N��x=�Ҹ�aFF]�7x�����b���.�5�s2�����V�W3@1��<�2��~Jԥ��--�"MM�:�2�nyNF]��2�]��9�8�����9uiopˠ��B)�0*�����9u�o�J��I2gC����Q�J������ͅ:�6����΄��Krg���hO�;/:���Y�Q�J���ň��+�w�t�8ߙ�Q����U�t	m�����W�e&|gAF]:�w:]j�7�����
zg<�E� �u�Q�D�XX���{a9�J�qV���$���$�2g����z�*dø9���� ���=@܄U.��斖:��K�
�T���|��l��ϑ��dA�0�DV� ���zvh���ig���}�o`�����Ɓ�H�vz��0�b���6L�aA��F�氠��՘�ÜM65n.����;�D�G��Ƙ�Âj�z	hP���.���&X�A���,���zj�x��������H�:=�
t���X�BӍ1Ũ99�6oj�{'狆-$�c@��<��=�B����}�vpak�Xe����P�)�-Ȇq�+iK;�:�L ��c�grĸ�A����K��>h�a�g2�,����J��*v����ٜ��8���\����<�3c�V32�,���xqqsIB%��d�~2�,��˖�o��lQ@��1E�uI�:��X�[]��l]2E�u)�OZ�e�l^s��d�8�<��T���6O�j�P,/`���.-��G�}�Z�ٹMD�x��g�g�0�Qh����y�����X�Lr�t�|;�~rk����䑭��_\T��]=�p��T�2̜���v��]=���]31ʠ�;f��gdT��]=�F�J��@9f��gdԣ�]=�F��3T	��9W���=�걩�˖�z�tp�̹��|�K����˺��c#\�s�	���.�ċ���M���y�A��+��ȨKGg#�5z�cu1�ꁖcf-ȨK~+/��S���J'�%��7#�.�}���|*���)���Kr_lFF]:�/S?~���_�h3h�1��Ӝ,#oewNSKy�IcM�Ɠ���6.����7��->�T�A$:J����F��ŧK���9��
J����F����n�jh!9x�(I��g�I�_�m(��׸�@%�Y����:��߮�he�%�2�(Z%g�3�.i���B;-a��
t��Y����.��kn��:FN>:��gd<�Xh�ϗ~�iӔm���	���9cܴ��Kϑ�:W��
D��9�9vB�>�C�����c�q Y�a'8��d��9����5��ѡ'��$�rA�Q%疝^�Q5]��җ1���p��F��[�tkG�Cv�LCUn� �*3�;=�ke�;X ̈́�p�'�rNƮ��8�����[+9���v�n� �.����n�P���8��
^���7,ȨK�ܲ��.�63uㄵ��8!n� �.�s�����L)u��,��H�傌�T�-wzh˿LVо"�S0v����7O�ϲC�@�N��[�ȨJ���7Ok�)FT�8���Q�d���E�ac)
W�	ܚ��񂌪$ז���hn9�z~h��	��rAU^+`\���WI���9�p����rB��A'�nim��+�h))Ї.���rF��vKkW�h͑�ٰ4������sQ�~){��E��线O�}J�7�����4$=�v
"�30j2�Ni�Ҿ�!�ФrV9!cC���q��p	u����y"s����SVx�|)��4�z�湶fQ��Q�d��O{�r�zy"�;5��֩^.���Թ�0)���֩)�K�V'�R=���@E&�%'d�|��M�N�~�tL�@� W�Df�uAFM�؝�v7��è�=�LvAU*yO����51���'1��,ȠK%o��页($.��\Ó�kxd���w����[bq0*C��t�s�bs��)C?�m[���8�C��8���㦽��^���,��:�4�uh�����l�tХqv9#�.�����!�ր���BsO
�_�ȨK�n��.0�k(�GK�BsObn�����G������"�U�����匌�4�/S{%o���Q�Sh�I���u��_^[B|�2��{R��rFF]�ͻ;�� �V��Tt�t�.ȨK�}'�n˖dLV�ۓg;�`��G�Zf�_�(��j
��$��9#�*�v��+�e�kj��B����Ό���uRkX��>̘<�
�2q�3#ߨ�v��+�nk7���
��s��F��뤶�ێ���y|�GP���L�z��7�N��l֮<�A]2_'X�Q��6;�Z�Y]q����'1��,ȨKO��Rk�Vs�Ǭ�{R�Vi32�ҿ�-͵�R�y�#�����e��}NF]�GGv��"��G#�B�Ob�������ё�ҍ���1�ƨ����F��_�.�֧��)~݊����otI�en��m�L�=�j�K�/g�]�~��U�R�f][w0�%�3�.i����P�M
nl�K� �  /'�p�K�/s�"�zB�+�1*�ᓘ�#2�<:���h��M��ᓘ�#2�<:��K��w)Ȓ��'1GGd�%yt��_���4��:|stdAF]�GGB��X�ʖ-q㠛B�Ob������#dgi�jjg����9����'3���`ܜ_vz��%l���n���d��tA6���˝ޏ�;Q()ᇱ���9��Ev�ė����ͦp\L��'3�2rƸ9�YЇ*�'\gN���,���*=1.ȨJ���T�ܾ� �*ɾ�x������B�Of��d�%�	���.�N�uIv�ž�/��ჴ҃�dZ��d���,����Ϫ�� �6���N�~�~=�|$p�`��6F�;Ci�|�;ܫ���v/xq��#��G��B�O��r�շ�h� 4�d��oA�
�Ϭ��ގ����/��"�S~�w#n�}�k|s[}^�ec�Fz�V+@����W��}T��n�6�B����st��f���g$?��sw�+��O��{��Y�!��D5����˥�\(O����?�8y�-�,�>��س���}�&fP�.p�����wD]o�� U<��ң��E@����jʕ=9
�>]@B	���9g��������N������s�_W\��DIa3��qSA�W�\��z�Z,�sx[��7�.�r�6�FM�5��%{D��_�j���y{����1�T      �      x�}��J1��s�)��73�77A�S��+��B[�߄�[-i!�%��7(���zE�.��v�6���4������߈�ȵ]���XW$+��&y�B� �9��w�6��M3�FbE4�j�b2ݩ�zdG�#�i4�� ���r:��N����b|�Ĺ]Z���D��{@G�?v�:T��Rα�t��b	-����x�<O}WM�sᒥ�����;�����{b1d#�T$�b8��J-���������`�8G�\���z��V�ƚ���jT�a�a�8N�'      �   d  x���M�1FםSp����8;,f3,�X���o���0��HK�Z��z��y�����_�?}Aq�����ï�{n?�����F�7.���G�����__׸�߆��C� �T� 
ؤp┃�� R��ݙD��4��D4�H:Y��;y�B��$?)Щy!�vRL�Nf�3m��>����{�B�� +$�<:v������(�)��HbA���ì�D�zC*(?E��
i5a!�9�"�1v�b��0��E#Ηom�'�Nfܰx"�(�.(0rVE��׏h��J��"���$�h=�PG�"��C��'S�cv(���!���$�mH�"��S����qV�tFT�F�����U��s?(+ ۀ6*���Q�D�͠����0gT��F7C(�~�f�uRjd��ȰG^@��v��˃4
��<GQ@�D�Gp��1�>�W�	bM�,�W�"�mc*������,iV8s!�'�UҘ�8�J^h���G�fe��ȍ� p{�8.5a��"�<B���(@MA�U��g�U�^}����&p{���g���YQ�!m���q/oP��]�*�<E����X8����Z�	А+v      �   S  x���Mn1FףS���G���&]�*�?G9�"�]LTð���)�%/�~�|�u?�^;4���3�L�O$OB�0��e�I�и�=e˯%��zwa���#:�S�D8~�~}"�{�-�n�����~O��
�E��p���G�F�����E�R�<Fv��G�F�� �E�"^�N�ɽ�
CO��%?/c��2�7� lZ*���P��c{%H-�ȕT9oD�.<?/���5dUι��%�c�*����Ƣ�Yhi(v���+�fVQ��.�y���J���g�6BFc�l(~�l/D��#Bd4.z�n��c���1�q�3nz�a��|I���I�g����{�1�-$b�ָ�s �s�0�e,�d�>h ����c6��͈��Y�g��^b؉Mo<K�/ci��I4G�a����,M����ϐT�	J̾��-�%6vu�Q��M� |a�~���B�ۄ���$��7���ar;�Ƙ�l|�
�#L�j(QD^5�`�6B��T��E6�6�n����I�#,o[9�#�M���>am��<����Gq������Q�KBq�gt�x�|�d�T�;ET�[o��A9�      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �   Q  x��WkO�F�<��� pg�<<�O$dQ�J�j��`�&v�T���z�;�.�UW��Il���9��q�Q2�B)#@��7�]٬�Y���MV^�N��>�HD�P���������T3d�j;�g�@1����E�Ey�.m���*�yBf�>��u�"s�&��F6��ց8��؈р�IO(Њ��ra���n=��a0��L?0��}����}�e��ڹ�lc�;�OO����?^/�Or�EU�a��M�|6�P\��< ���a�"^Xq�(��H��C�؁u{�P�1)|_�Og�1�3�F���q�4�q�}�ȳ6�<}�&�o��K�k+��W��G
�ԝ���8�x,/��U�a�D�]�ʞ- N�e�{@mWY��u YR.���`��JII�Ѿ�����1���/���1���bA���9��Ϥq5���g�'^��\� �g���O�.�y��w�*'�g�����ċ�����1�K.8����ur�:e��~\�y��n����f%u�ӯ"[�����$\��������a����1�t���\)J��:�I�1�@H=BHM�9v �'n.��}�����/�!�4[}j�U��ӓN���h^v�(��0zx,G���j\s�Î}�Z���;��@߽|��}�&��ʶnT��<j��.�:n��j��!���fx_�wK��j'�c��6�M��=�E�H�	M}�	�ɵI��&P��������0����u{��K^?�*��2��]@�EX[ʚ����m6�5�����.�����|��(|L8�FE?���r�"L�(�)g�"����F�;���Ѷ|��.K�D L���S�`��i,��r�"�`����Y���w�n�d3M�2On�r�7H=gޖ�ۥl6��l�w���/�ծ�qoi�jG���n�d�= '�m��A��[pm �i�� î8�\��ʹ�h�������ʓWI���az�B{��(��C���l�lپ�D�Ʊr`B3�ҦH^S�l��_�ѷ'��U��Ԋ��	_��{Q
���ؔ)�_�iF��?�Z|;��]4����Sz�g����_b�      �      x������ � �     