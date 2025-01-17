PGDMP     8        
            |            terion_billing    15.2    15.2 q    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    117675    terion_billing    DATABASE     �   CREATE DATABASE terion_billing WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE terion_billing;
                postgres    false            �            1255    117676    accesscontrol_log_trigger()    FUNCTION     �  CREATE FUNCTION public.accesscontrol_log_trigger() RETURNS trigger
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
       public          postgres    false            �            1255    117677    credentials_log_trigger()    FUNCTION     M  CREATE FUNCTION public.credentials_log_trigger() RETURNS trigger
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
       public          postgres    false                       1255    117678    invoice_log_trigger()    FUNCTION     B  CREATE FUNCTION public.invoice_log_trigger() RETURNS trigger
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
       public          postgres    false                       1255    117679    products_log_trigger()    FUNCTION     �  CREATE FUNCTION public.products_log_trigger() RETURNS trigger
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
       public          postgres    false            	           1255    117680    user_log_trigger()    FUNCTION     Z
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
       public          postgres    false            �            1259    117681    accesscontrol_log    TABLE     �  CREATE TABLE public.accesscontrol_log (
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
       public         heap    postgres    false            �            1259    117687    accesscontroll    TABLE     �  CREATE TABLE public.accesscontroll (
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
       public         heap    postgres    false            �            1259    117693    accesscontroll_rno_seq    SEQUENCE     �   ALTER TABLE public.accesscontroll ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesscontroll_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    117694    accesscontroltrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.accesscontrol_log ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.accesscontroltrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    117695    credentials    TABLE       CREATE TABLE public.credentials (
    rno integer NOT NULL,
    userid character varying(20),
    username character varying,
    password character varying,
    lastupdatedby character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.credentials;
       public         heap    postgres    false            �            1259    117701    credentials_log    TABLE     5  CREATE TABLE public.credentials_log (
    rno integer NOT NULL,
    userid character varying(20),
    username character varying,
    password character varying,
    lastupdatedby character varying,
    operation character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
 #   DROP TABLE public.credentials_log;
       public         heap    postgres    false            �            1259    117707    credentials_rno_seq    SEQUENCE     �   ALTER TABLE public.credentials ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credentials_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    117708    credentialstrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.credentials_log ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.credentialstrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    117709    district    TABLE     �   CREATE TABLE public.district (
    rno integer NOT NULL,
    stateid character varying(6),
    districtid character varying(6),
    districtcode character varying(6),
    districtname character varying(50)
);
    DROP TABLE public.district;
       public         heap    postgres    false            �            1259    117712    district_rno_seq    SEQUENCE     �   ALTER TABLE public.district ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.district_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    117713    feedback    TABLE     �   CREATE TABLE public.feedback (
    rno integer NOT NULL,
    userid character varying,
    feedback character varying,
    last_updated_by character varying(90),
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.feedback;
       public         heap    postgres    false            �            1259    117719    feedback_rno_seq    SEQUENCE     �   ALTER TABLE public.feedback ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.feedback_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    117720    invoice    TABLE     `  CREATE TABLE public.invoice (
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
       public         heap    postgres    false            �            1259    117727    invoice_id_seq    SEQUENCE     y   CREATE SEQUENCE public.invoice_id_seq
    START WITH 1000
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.invoice_id_seq;
       public          postgres    false    226            �           0    0    invoice_id_seq    SEQUENCE OWNED BY     H   ALTER SEQUENCE public.invoice_id_seq OWNED BY public.invoice.invoiceid;
          public          postgres    false    227            �            1259    117728    invoice_log    TABLE     �  CREATE TABLE public.invoice_log (
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
       public         heap    postgres    false            �            1259    117734    invoice_rno_seq    SEQUENCE     �   ALTER TABLE public.invoice ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoice_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226            �            1259    117735    invoiceitem    TABLE     r  CREATE TABLE public.invoiceitem (
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
       public         heap    postgres    false            �            1259    117741    invoiceitem_rno_seq    SEQUENCE     �   ALTER TABLE public.invoiceitem ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoiceitem_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230            �            1259    117742    invoiceslip    TABLE        CREATE TABLE public.invoiceslip (
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
       public         heap    postgres    false            �            1259    117748    invoiceslip_rno_seq    SEQUENCE     �   ALTER TABLE public.invoiceslip ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoiceslip_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    232            �            1259    117749    invoicetrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.invoice_log ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoicetrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    228            �            1259    117750    position    TABLE     �   CREATE TABLE public."position" (
    rno integer NOT NULL,
    positionid character varying,
    "position" character varying,
    lastupdatedby character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public."position";
       public         heap    postgres    false            �            1259    117756    position_rno_seq    SEQUENCE     �   ALTER TABLE public."position" ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.position_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    235            �            1259    117757 	   previlage    TABLE     �   CREATE TABLE public.previlage (
    rno integer NOT NULL,
    previlageid character varying,
    previlage character varying,
    lastupdatedby character varying,
    last_updated_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.previlage;
       public         heap    postgres    false            �            1259    117763    previlage_rno_seq    SEQUENCE     �   ALTER TABLE public.previlage ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.previlage_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    237            �            1259    117764    product_log    TABLE       CREATE TABLE public.product_log (
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
       public         heap    postgres    false            �            1259    117770    product_log_rno_seq    SEQUENCE     �   CREATE SEQUENCE public.product_log_rno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_log_rno_seq;
       public          postgres    false    239            �           0    0    product_log_rno_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_log_rno_seq OWNED BY public.product_log.rno;
          public          postgres    false    240            �            1259    117771    products    TABLE     �  CREATE TABLE public.products (
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
       public         heap    postgres    false            �            1259    117777    products_rno_seq    SEQUENCE     �   ALTER TABLE public.products ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    241            �            1259    117778    state    TABLE     �   CREATE TABLE public.state (
    rno integer NOT NULL,
    stateid character varying,
    statecode character varying,
    statename character varying,
    lastupdatedby character varying,
    updatedon character varying
);
    DROP TABLE public.state;
       public         heap    postgres    false            �            1259    117783    state_rno_seq    SEQUENCE     �   ALTER TABLE public.state ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.state_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    243            �            1259    117784    user    TABLE     D  CREATE TABLE public."user" (
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
       public         heap    postgres    false            �            1259    117790    user_log    TABLE     c  CREATE TABLE public.user_log (
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
       public         heap    postgres    false            �            1259    117795    user_rno_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    245            �            1259    117796    user_user_id_seq    SEQUENCE     |   CREATE SEQUENCE public.user_user_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_user_id_seq;
       public          postgres    false    245            �           0    0    user_user_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".userid;
          public          postgres    false    248            �            1259    117797    usertrigger_rno_seq    SEQUENCE     �   ALTER TABLE public.user_log ALTER COLUMN rno ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.usertrigger_rno_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    246            �           2604    117798    invoice invoiceid    DEFAULT     �   ALTER TABLE ONLY public.invoice ALTER COLUMN invoiceid SET DEFAULT ('INVOICE'::text || nextval('public.invoice_id_seq'::regclass));
 @   ALTER TABLE public.invoice ALTER COLUMN invoiceid DROP DEFAULT;
       public          postgres    false    227    226            �           2604    117799    product_log rno    DEFAULT     r   ALTER TABLE ONLY public.product_log ALTER COLUMN rno SET DEFAULT nextval('public.product_log_rno_seq'::regclass);
 >   ALTER TABLE public.product_log ALTER COLUMN rno DROP DEFAULT;
       public          postgres    false    240    239            �           2604    117800    user userid    DEFAULT     |   ALTER TABLE ONLY public."user" ALTER COLUMN userid SET DEFAULT ('U'::text || nextval('public.user_user_id_seq'::regclass));
 <   ALTER TABLE public."user" ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    248    245            �          0    117681    accesscontrol_log 
   TABLE DATA           �   COPY public.accesscontrol_log (rno, distributer, product, invoicegenerator, userid, customer, staff, operation, invoicepayslip, d_staff, last_updated_on, last_updated_by) FROM stdin;
    public          postgres    false    214   x�       �          0    117687    accesscontroll 
   TABLE DATA           �   COPY public.accesscontroll (rno, distributer, product, invoicegenerator, userid, customer, staff, invoicepayslip, d_staff, last_updated_on, last_updated_by) FROM stdin;
    public          postgres    false    215   U�       �          0    117695    credentials 
   TABLE DATA           f   COPY public.credentials (rno, userid, username, password, lastupdatedby, last_updated_on) FROM stdin;
    public          postgres    false    218   A�       �          0    117701    credentials_log 
   TABLE DATA           u   COPY public.credentials_log (rno, userid, username, password, lastupdatedby, operation, last_updated_on) FROM stdin;
    public          postgres    false    219   |�       �          0    117709    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   ڸ       �          0    117713    feedback 
   TABLE DATA           [   COPY public.feedback (rno, userid, feedback, last_updated_by, last_updated_on) FROM stdin;
    public          postgres    false    224   �       �          0    117720    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, senderstatus, date, reciverstatus, transactionid, last_updated_on) FROM stdin;
    public          postgres    false    226   g�       �          0    117728    invoice_log 
   TABLE DATA           �   COPY public.invoice_log (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, operation, last_updated_by, last_updated_on) FROM stdin;
    public          postgres    false    228   ��       �          0    117735    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, hsncode, last_updated_on) FROM stdin;
    public          postgres    false    230   ��       �          0    117742    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, last_updated_on) FROM stdin;
    public          postgres    false    232   U�       �          0    117750    position 
   TABLE DATA           a   COPY public."position" (rno, positionid, "position", lastupdatedby, last_updated_on) FROM stdin;
    public          postgres    false    235   r�       �          0    117757 	   previlage 
   TABLE DATA           `   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, last_updated_on) FROM stdin;
    public          postgres    false    237   ��       �          0    117764    product_log 
   TABLE DATA           �   COPY public.product_log (productid, quantity, priceperitem, last_updated_by, productname, belongsto, status, batchno, cgst, sgst, last_updated_on, operation, rno) FROM stdin;
    public          postgres    false    239   �       �          0    117771    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, last_updated_by, productname, belongsto, status, batchno, cgst, sgst, last_updated_on) FROM stdin;
    public          postgres    false    241   ��       �          0    117778    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    243   ��       �          0    117784    user 
   TABLE DATA           b  COPY public."user" (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon, organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg, accholdername, ifsccode) FROM stdin;
    public          postgres    false    245   ��       �          0    117790    user_log 
   TABLE DATA           ~  COPY public.user_log (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, last_update_on, organizationname, gstno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg, accholdername, ifsccode) FROM stdin;
    public          postgres    false    246   ��       �           0    0    accesscontroll_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 99, true);
          public          postgres    false    216            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 233, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.credentials_rno_seq', 114, true);
          public          postgres    false    220            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 242, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    feedback_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.feedback_rno_seq', 5, true);
          public          postgres    false    225            �           0    0    invoice_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_id_seq', 1470, true);
          public          postgres    false    227            �           0    0    invoice_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_rno_seq', 501, true);
          public          postgres    false    229            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 516, true);
          public          postgres    false    231            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    233            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 1109, true);
          public          postgres    false    234            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 5, true);
          public          postgres    false    236            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    238            �           0    0    product_log_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.product_log_rno_seq', 390, true);
          public          postgres    false    240            �           0    0    products_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.products_rno_seq', 145, true);
          public          postgres    false    242            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    244            �           0    0    user_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.user_rno_seq', 220, true);
          public          postgres    false    247            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    248            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 845, true);
          public          postgres    false    249            �           2606    117802 "   accesscontroll accesscontroll_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.accesscontroll
    ADD CONSTRAINT accesscontroll_pkey PRIMARY KEY (rno);
 L   ALTER TABLE ONLY public.accesscontroll DROP CONSTRAINT accesscontroll_pkey;
       public            postgres    false    215            �           2606    117804 +   accesscontrol_log accesscontroltrigger_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.accesscontrol_log
    ADD CONSTRAINT accesscontroltrigger_pkey PRIMARY KEY (rno);
 U   ALTER TABLE ONLY public.accesscontrol_log DROP CONSTRAINT accesscontroltrigger_pkey;
       public            postgres    false    214            �           2606    117806    credentials credentials_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT credentials_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.credentials DROP CONSTRAINT credentials_pkey;
       public            postgres    false    218            �           2606    117808 '   credentials_log credentialstrigger_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.credentials_log
    ADD CONSTRAINT credentialstrigger_pkey PRIMARY KEY (rno);
 Q   ALTER TABLE ONLY public.credentials_log DROP CONSTRAINT credentialstrigger_pkey;
       public            postgres    false    219            �           2606    117810    district district_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (rno);
 @   ALTER TABLE ONLY public.district DROP CONSTRAINT district_pkey;
       public            postgres    false    222            �           2606    117812    user email_already_exsist 
   CONSTRAINT     W   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT email_already_exsist UNIQUE (email);
 E   ALTER TABLE ONLY public."user" DROP CONSTRAINT email_already_exsist;
       public            postgres    false    245            �           2606    117814 .   credentials email_already_exsist_in_user_table 
   CONSTRAINT     m   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT email_already_exsist_in_user_table UNIQUE (username);
 X   ALTER TABLE ONLY public.credentials DROP CONSTRAINT email_already_exsist_in_user_table;
       public            postgres    false    218            �           2606    117816    invoice invoice_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.invoice
    ADD CONSTRAINT invoice_pkey PRIMARY KEY (rno);
 >   ALTER TABLE ONLY public.invoice DROP CONSTRAINT invoice_pkey;
       public            postgres    false    226            �           2606    117818    invoiceitem invoiceitem_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.invoiceitem
    ADD CONSTRAINT invoiceitem_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.invoiceitem DROP CONSTRAINT invoiceitem_pkey;
       public            postgres    false    230            �           2606    117820    invoiceslip invoiceslip_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.invoiceslip
    ADD CONSTRAINT invoiceslip_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.invoiceslip DROP CONSTRAINT invoiceslip_pkey;
       public            postgres    false    232            �           2606    117822    invoice_log invoicetrigger_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.invoice_log
    ADD CONSTRAINT invoicetrigger_pkey PRIMARY KEY (rno);
 I   ALTER TABLE ONLY public.invoice_log DROP CONSTRAINT invoicetrigger_pkey;
       public            postgres    false    228            �           2606    117824    position position_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."position"
    ADD CONSTRAINT position_pkey PRIMARY KEY (rno);
 B   ALTER TABLE ONLY public."position" DROP CONSTRAINT position_pkey;
       public            postgres    false    235            �           2606    117826    previlage previlage_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.previlage
    ADD CONSTRAINT previlage_pkey PRIMARY KEY (rno);
 B   ALTER TABLE ONLY public.previlage DROP CONSTRAINT previlage_pkey;
       public            postgres    false    237            �           2606    117828    product_log product_log_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.product_log
    ADD CONSTRAINT product_log_pkey PRIMARY KEY (rno);
 F   ALTER TABLE ONLY public.product_log DROP CONSTRAINT product_log_pkey;
       public            postgres    false    239            �           2606    117830    products products_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (rno);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    241            �           2606    117832    user set_unique_email 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT set_unique_email UNIQUE (email);
 A   ALTER TABLE ONLY public."user" DROP CONSTRAINT set_unique_email;
       public            postgres    false    245            �           2606    117834    user set_unique_userid 
   CONSTRAINT     U   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT set_unique_userid UNIQUE (userid);
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT set_unique_userid;
       public            postgres    false    245            �           2606    117836    state state_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (rno);
 :   ALTER TABLE ONLY public.state DROP CONSTRAINT state_pkey;
       public            postgres    false    243            �           2606    117838    user user_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (rno);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    245            �           2606    117840    user userid_already_exsist 
   CONSTRAINT     Y   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT userid_already_exsist UNIQUE (userid);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT userid_already_exsist;
       public            postgres    false    245            �           2606    117842 /   credentials userid_already_exsist_in_user_table 
   CONSTRAINT     l   ALTER TABLE ONLY public.credentials
    ADD CONSTRAINT userid_already_exsist_in_user_table UNIQUE (userid);
 Y   ALTER TABLE ONLY public.credentials DROP CONSTRAINT userid_already_exsist_in_user_table;
       public            postgres    false    218            �           2606    117844    user_log usertrigger_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.user_log
    ADD CONSTRAINT usertrigger_pkey PRIMARY KEY (rno);
 C   ALTER TABLE ONLY public.user_log DROP CONSTRAINT usertrigger_pkey;
       public            postgres    false    246            �           2620    117845     accesscontroll accesscontrol_log    TRIGGER     �   CREATE TRIGGER accesscontrol_log AFTER INSERT ON public.accesscontroll FOR EACH ROW EXECUTE FUNCTION public.accesscontrol_log_trigger();
 9   DROP TRIGGER accesscontrol_log ON public.accesscontroll;
       public          postgres    false    215    250            �           2620    117846    credentials credentials_log    TRIGGER     �   CREATE TRIGGER credentials_log AFTER INSERT OR DELETE OR UPDATE ON public.credentials FOR EACH ROW EXECUTE FUNCTION public.credentials_log_trigger();
 4   DROP TRIGGER credentials_log ON public.credentials;
       public          postgres    false    218    251            �           2620    117847    invoice invoice_log    TRIGGER     �   CREATE TRIGGER invoice_log AFTER INSERT OR DELETE OR UPDATE ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.invoice_log_trigger();
 ,   DROP TRIGGER invoice_log ON public.invoice;
       public          postgres    false    263    226            �           2620    117848    products product_log    TRIGGER     �   CREATE TRIGGER product_log AFTER INSERT OR DELETE OR UPDATE ON public.products FOR EACH ROW EXECUTE FUNCTION public.products_log_trigger();
 -   DROP TRIGGER product_log ON public.products;
       public          postgres    false    264    241            �   �   x�}�=j1�Z{�\�b�g4��4i�R�q���d%"�L!$�xz�(��� �����u��$'��Br$j��ry߈����a���ͳJ��*�2�/�tlɒ�U���ı$��dɖ��U�u�`>�I�6p�60Â�c�$beea��/���;V�����g��qm\1����T�Y�ٙyI������i�rǗ�m�/�l*      �   �   x�u�KjC1E�ϫ�"���Y��N:d���������u8W�R���:߾F�+���S�9��m�g��}Q�Ӆ0e$���b��Z��ӄ���2ʉȴw-H6����(`��t����$e�d�njb��?�������[�5�@LT��QmT3I���|�Ē�1�x��O�de��T�4����4��_�Mh���O�6���o7h�� �\h      �   +  x��һN�@�z����汳��H�P@	YN +aGS��g�))�\YZ����1�;@S��C;펥?~lL���"��<rk�5�a�����o�_fC_b}��W7N�X���m��{��pW�cF��S���|f�-Ve�Ņ�����1���]�B)xR&�6d�2���(�>� NXD�Q6Oe�����7};.1S�	I�8ָ3����b��2�ea݄&�&E����M�n�	���P[�����*��.B��u�|-�"�83YH>�y�v��C��C�8U��%�fc���.o�o      �   N  x����J�@���)|�sns[Up��$���T�ta�ޓт��C��ϙ<�[pL^v�q�/��sg�]o�u_�% �Ճ9���qc�!/-n\���M��	���D�O�_�8����;,_���UU-=e8l��o\��A,{�^52Og��k1���X5���G��4���#+��GդfC3�q[f�y|F�AXHT�U �X�n�ٯ��YEb�d�(I�P6��rIȎ3�%!&P V@8��vܶ�nf)?�D)a�х0Qi����K��N�����Ǯ>��lH�к�S�m3�Q��P2�� �QA���s��>)�6h;�� Ԭl�4_)���      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �   i   x���1�  ����HZ
�� GYk4�$.~�'h��ָ�0#�,ZW!W���5�w�&����Ur.�,�-9�C>i�\[9u'2O1�z)�d�%��1���9v      �   7
  x������9F����r���7C@�ɒ�DD@!<��z��vK��jW�3�[>.�O�ꗟ����HH���j�/��s��+�OU~b���/�~�����������=�բuT�7QK��Cn{��P��:�Mj	dWA\�Rk�����CTT}P�z�� ��D Y�:)q|��@}cDc���ꆏ�&Vg\��cT�
����w׫}̋7j��ġ��`�8*�[���{ �u�W+��NQr���R�S�e�1@�
���A�����i�P�/�p
�Gk���b�x��է��Z�����^h!�^Y�5���t�OaKV�����*z�����f�Fq�d^X�3��n"���� +d�K��	v�Qjc�#��d����<dCg���� +r�Z�56�IR��9�]b4���Q�6�l6$�'Av������2�'	Av��ɡ��p�y<tВdC��;D:zl�-�@.� �����P��IrQ4�8/��9V�'�>���(�l�x����`w_৶6T5| O:��Bq�J�1G�|�;>�h
�+K<A/��N��G��(�d�hp,�4��9p�����G���w�?�����q�B��\[�������R�&g����z�� ��tTS�[OF��?RgW���'%����L��@=�.6����i���IvW8��
g�Fe�$�*�ha����`W�`�@�F�U�=	��
� ��@�N2�m��ve���QصjT\R�]T�pR��]�HJ��J�y��P�J��#)�]l$�T�|=<�d��0�|���G��f��Sj�W0#)�-��A�ب6I�M�fx�=��B
����ܽ��X�4|8ڑ���R� �&ۤy��vd(6����ZȤ�	�΋2Ʀ�䅶�»r؞:����{�r�m�ò�Ċ96;p��B�>ѫ��'v�8�ō��oZ���'Ǳ�(��Q�Z�|�CN���6��N��xa���e��&'i�7��ϙ�ұ�֘�$ߐ�'
���JE���$ߐ�����<V���%%���9bq*��L�d��,�Uca'�V�}�|G��Ѹ�@]���Dk�o����q��ס��������C�J����t�G��Y�d�~�K�y��zB�t�/�����k��t�7t��iqR͋��d�~�-N��A��P�A�h��@\m�8��bо=R�NQpI���#qS��
�mJ:�u���[��'�>�yG�qu�x8	a\�G{ \H�F9	a\l|>�R+�'�`\�G�k�o��N>}�q�v�̘��q��̩+�uo�}��E��k|`^cޒ�E�Cq�����N>}9��*q�6���E�X��ÌJxSI>}�獹c���>�#�Mͷ�p58�8}П�T�a�I��������=�C��`��&�B��1۷�a��%�Bgl��5f�����Y�����n�Rl≳��;Ϋ>q������'����h�4�5F4h!�S�>����	� �	�0�!H�Q/
�(��I	�P���#���U��49�N8):�==z��mMN��N�p�m���b���-��ۈG�V*����-���ݖ�D�NSnQW��#��s4'��%���
.���{�p��!u\<a�A������Up��40���1�7M�E]�O�����SD`4u\<ψy�aQ�)������꼯h]�6)�u[<��c(l�9kI	����������ۥ̢�2��������IBXEO9}�RkG��"���,�,�<`������,��f��m��RfQW��SP\&j��Т�B�� ��ң�Bq)�����)���ʡ��>!�u�Z<y���QcD�
���)�c�(�7j(��[�Un�D?��ouA�N��*�x�i�=�wt=�I^X�&��r5�� �cdJ.�*�x8�`����)�����!Gc���'Ya]<�x| �%bq�j�袮��g���q�t�uB�.�*��9!�]Z*�2�z��V���Eq�
;%u�\<��Pڑ�^�ࢮ��������0Po)�����'~�b`ښ�n�r���-r"��3W��SnQW��Cμ��d����ࢮ���梱Wc�N�E]9׿hzF�u
.�*�xșט��|�N�E]�8Z�/ؠ�o)�����!��o�p<��I�E]�O8��M\��j�'�`�[<��#�æ�;�u[<��<>�f��N�E]�9��lC�4�u[<�0EX�G	�آ�b�����3�qw�R��J-�qt>�����)�u�Z<䌸Q�n�OJ-�*�x����uU<���Z�Uj�3�s�6�Ƴz
-�*��2�U��~���u�]P5
;eu�Yl�5'"~V�w�w�Y�Ud�3c6�%�єW�U^1a��.��Q�q�sw�+�*��8�|�� V�:H>X�O���\�����a�NqE}W����Z�"��H�7�i��b��@}s���:Ŏ�2@�<�r��}�ݽ��З���/�ǿ��W�_�7x?:�8c�h~-ooo����1      �   
  x�����e���9O�� �DiuA�ӥ2��4A���o�{��)���� 3S�����"�����ǿ��?����w����ؑ���=�~��]����?���ӷ����zAo�W�XI��k�J-�.�W�����c�cq�R�}��6%�q��@c�.�I\ߋ�]�M\\|z�%�ύ��;m�����i������h���i��M��6_�M�sϤ�_S,S�u���J�x&n9�IH,�*#��p���p[�h�N,��-q��[X(��&��Ă�'�zqo4��%����Я�r,4-G�<�xIgh[ȁ�d�YF�HtbA秃WY�8.�6duOđ�Ă���"n�B�_3�I�Y�.Y!N�%V�-�M<�I��g�@��9�褂��êVs�e},MpR��ey���ä���歴H4e�1];�I;d�kO뜍�];�I;`�h�խ�x�ձԄ%m`y/mX�b��7MX�!��=���C�Y���C,!�mc��e�&,y�7����0���*�j,^}����x����彸���)�O>�����((��|���L>$�;X��E�>�Ld�!��-��m质�v"��4m����j�{&2��L�!� �>���D&��Nφ�(�D&��>�����{L�r�0�J_��Lh�a�4���wFx"S�i��f�= �Q��r�-�[-D�,\	L9����������c0%�*6G����r����*����A&��,�^ϫ�rg˔�ДC4��یb� �n��r�&�|?��0�����i��۾�z-&+�9
2i+�) �eӶ���Jh��,.h��F����h�p|�X�stfyU`B�J���U?B�z�gV't+ۦ5�����Q���u�{$]�����2!.�<U�r��( }�3)I�'O���Oa/���}��]vMWO���ݸ�g;������ĩ�>��r�%sE���꽸�f�e��O�����ߦu��a���n`��ڲ�G�6Mq���n`zt��t�T��	R݀�^���,�C�3���Q����ZД�yBTw�98�Zk�(���hO���o�Ň"�e%"� �C@�7!�m����yȧ�ξ���J�s�6R��"�PH��C@ů�^�s�&@��w���!�NΑ����|߇���Eu�1�9��Em�7>���󰇎��0t��&@�!��"_�!v�.�	�y���/��M��A��P�[h�j�<!�Uo����/���	�u�B5�=f�9��\<�	U/\��l�����]���߳��"�>�R"t�WD��1ux�)�	������D�:$��������D�:$ԟ�}���b�LD��uH�t���l�wB)�	�qUi�?B�q�o�r?$t^q�l��d�:��!���,�{��] *;��da�r��'���+Ɩi��bH������(ZP`y�3&����|2m���S/ �$^E/u�x���˜�B�{��lX�qvI��O����/���<�z��u拵1�	�z�
H��!l[\�ɞ(���ݔ�F�Gm�x�c�)��²�>irq�z��w��Ä=y���=PG��'\ю�y�+�ж:�����xO�d��>�D=nї�b/��?ĕ聺%�5j��lp�je �M�s�®̎i2qe zrr���	�fn�	��B������K^٘ �,D���c���z!Y���=�K,I#(�Aĕ��A�%������ ��A�D\_w�3B�D\9���/Iۤ��b4Y���m��O��� ,~�'D+�u�x&VYQ^���+�u_Jm�F�8{���=P����#�Krq�$z�.~��,}z/MV"��DO��W�!c�8{�2=Q�V{ۘ��d'��N�[���v;[xm�p�Dje(��['�K<�Z9���2�%Q�M��b���+Oу��3�u;�qϘ\E\����w;��9����hW\=�8�[\blL�"�|E����b-M�"��EY�K蝺�Sh������(��E����&+F.&F+g�������k�H�"��Eė����_wM<!Z9������,*C�e$kW֢�n��E`@�u�[ĕ��x\�u�>$wW�G∍��y�K�"��E��/�lX���_ĕ��x�Jɜ���d0��`�/��'/2>�זd0��`�@��L�I:�<Z9�v��ӆ7�t?y�qe1���#[��_/u�bĕ��8��b�D=�ǈ+��q�k)�e��'B+�Ѿ8��Rly��?���r=w�X�7�eĕ�h_��	��|��'�W6��˯��K���3��g�/��Wt�h��hĕ�hW|�u:����;`2qe4Y���F��
QkV��"$�W>��s�w�����9zB��=�����$�W��=Y��-�� Y���%q�y�F�/_����O�V�ݨ����CAP�x"��ň~G��F�H4�&D?Y�
�����sY/�g�ߥ�����_~~�>������)��&e��K#���S������h�      �   z	  x�����%�E��_�� R�(�m��7�.���w�^U;C�{�Ahޜ�*鈤�7l�������?�)C���|�7��M���?�j����o"/���f}w��a�`;����z�d����G���D{Mk�h���g��/��if��t$:>h9��5����(?{%z}����5y�h��v'v���\���y���K�^-�L�s]+�z9[Z׹:iM�4���x��=�j{rL�/�xsk;b��N��]2����ǑLbZ�N��]�����6f��'��n��&���֦�Xܯd���l�-֖�t@2O��M���|�Ѧ�~�+I�7�v���6�d�_�ơ"�n}*vt�lH�d/��=�dCKv�t4��lRl���ةƧN�ɯa�~����&����Bk���6�5杕W���ܠX3�5�B�.��Df�j^���k�cp��W��JN��6�x`w#ye�������M��d$���@�O>��_�+��CSj�z�>�Nf�=x=�qz�f�HrY!����i{l�X��
��:�&^l��
���kHCv�HrY!�2�#҇��cI.+�R
b���:?7�e�\ʌ�b�vw�;�$��AK_��8ݷ�XI//��E5��)�x%��Z`�`��S�C̕��_P�@�8Pjܧ���R-sy��j`%��T�O��6;��Jjy��1����&��qK�a���8��Múq��^^�x�P�z�EYm���z���������^��]���b�O	��\���	��H?��Nz�{�:��$Ϧ�C����[�}����X��*�����y����e�����e�F��v}���7k�b�[�7Z���ؽ�~�S_#�mS��3͍����_��e�P��v.S�lAֿ��o���Y���Ί��a���Ј��fŢ�,����y��$;���f�a����^��c� ����L�)N3��?ظЇ]�R��k�%�����4���>l�+��Z�x�Eq
l�+F�Z(��l��r�I��e��Q�	W�u�+
5QS8K�X��8�G.}S��W1׸�H��z��܊[���������4������BFQ"�k5y�W��z����$i�jZ�^d���q=��Ze^�Sp��^��I�U�弝?k5'�:���`=Y`�U���դ�*��,�!�� �Ԥ�*��\-Qܡ���MZ�"f͏v��XN^�«����} ���*��,��v�(�V#��
����M�|n2kfn�b[yF2k+N��s�'pö��څW�À���g��W��*x_DfwU#y���u^���b�{�W��j��3��G�;'�v�Xa�Ȥ�pr$�v���]t1�[�j^-��l)���,y����&������+�|+��a�Hl��z�#ܰC������~��iD�&?��P#��Y�U�>�y�^����,�
!�o,ۛz�,�*�� ���-��{��>t�ώ��<��G�R����m䤎g�.=K��6\���$�&�>=���6{Y4��z�>�I�h9�*TK[�ڠ�`r�a��������&�`B���{۳`I0�_}z�y��|rR��AZ��A݃�K-z+fP��c,�=�'�r'͊!�C��n]�p(S�ޤ�̸Ո~�����vB=,�#�t�d M�I�;M�%�[j��u
���/m۹W�KoZfA�^�k�:Mmz��0c�ޱO(��&��������� ��?=p<��u>8�UL�x#ǵ5z�}-�ꭘ>9��~��(���I/-�rv�|�T;��M�(�G0��SC��԰7-�^�ItX`���6�(��l���Ȼ�R��ƽ��`!4}��g'�ƽe����5erՒi�1��n�Bxa�_�I���Y�~�Q��l�l��M���[���H]{�N��]Y�!Y�F���]GQkC��6u��:��Sdw�d9�a�J={����G�-�6��Գ��Q���%�3aL��\:�eE���m�ilSjٛ1,ί%6�'즖�Y�V���F��\��u
uXN�7^yAj��u
���� �Oa�I�z�N���f�8��`�X�1�_�j3F��ԯ���a����=J�z�����|�ӸI�z�"5�w�VM�z�vB=�R��H���ԩ���?n`�u>7y�W�6�R��t}R�ޮ#�������=J^]GP��o^`�W��aU8QA1�djқ^-���rU��&�]�O������7lO-z�Οv�J���b�ɫ���?��7N�ɫYx��-Y�܊G�M^�y~���M�A���Jf]��e��q_]�l2k��z�Ӌ�:��ĺ6��ǽ7?�/�>�Z�,Ҕ~�d|���MQ��_�So��7�^�/�ɭ�Da�u]�j��=��ݺ��y�Se�W�6�u/0'K�g�;Ƅ�������9h�i��K��dW���_���G�Mnu��������_��)E      �      x������ � �      �   g   x���M
� ���)����Dw�a?B�
t�G��[<Ḋ�k��f,3�[�:�#�Q\/�E���{�-�`�)5�@p�������57Ko�� ��2R      �      x������ � �      �      x���͏9r�����*AF��6�ؗ���qC����A��ߛdv%_i�D�kh� ��7Q�||�`��ՋZ�)?yq�?���Ƿ?^����o|�U�/qb�Χ�����hR��>�����Sx��p���m�:���_~�|{��	N�Żͅ\����1��JOZI��ӕ��'�ZXZ9���]�\�nA���O/���xyJW��%w��ҧ�;����Ͽ�����>|�����D�ktqܽ$��E�{|m����������L|�����Ç͏|X�Y�R������?����w��J��I5�W��A����_口u����s����<���;�߾���x�s*��l��#�|.��7�kG��{�x��4���������z������5N��8SS� �������R���e��|*������#�5�c��lz�ޟ>����{�����^�g�\y`�WY���S�����������^:h>ު��0�{pya)�x ?���CX�[X=����QZ�y@��~��2�ϯ��׏�w�%�>���kR��S�"w�tOR�y�8�r�).<��_���OT���~�/��}���߿����������I���&EJ�k6��-?������/�N�rή�Z�ԧ���N��/�Zh�8����Ӈ6"y�}U�O����u�a��c�s!ǹ\|�8�\�������o�#�;���?�!gv��E�Ets.j8�1�B�9VlJo��3�f��h;Тl�g�ppc|Cȡ�������P��w(/>d�M�ϡ�tz(O�)����!�%�M�j]1���!G6�3�������Җ���� c�8���lq��ʏq�������@�Y"���;�gB�\��6߇-6�?t��BfB�q��Կ!�� m+)�L�@��|��.	�w�>@��S���+:�e�x�s�p>.����bnӘ$�/�+Dr1��!��{���h�tۢ��D� �{��c���ܢ����m�VӖß�^!��9wH�K.:Y�Eu���1š�B$s.��".�-��z$�"��s��ݤC���Z�ﲹ(u�<���F6��k|���I�ش/p,g9��4t7r��>��q��N�m��U$���#��9w���vr����F"`���M�Cu\$�5o]Aj�� gP�͹�:�_��l3�j����K|��)������eKÕ2�.1�S��4���'I��J�c��AsD�9�1�B��m�N��j�y�p�F�;Dǥŝ�j
i�هtL�DG��s��1٬���?e&!&Z��⨴xV��J���P6�9�����@g6�n��F�.A,/t��J�g`P`It*+�4�Re
��>/\.;��#���_d��2��v��}�c+ǙN����uUmE�����R�Y0n:��Ж�f�>�AE
���Ȩ�D����.�7o>逃��'�5�颴z��-��#���e�3rƸ�Q��X��'	��9
�8N��F�tr#��,�Yq�����J.���Q���䢮�6\��=�R��aFFU�7��f�N��x=�Ҹ�aFF]�7x�����b���.�5�s2�����V�W3@1��<�2��~Jԥ��--�"MM�:�2�nyNF]��2�]��9�8�����9uiopˠ��B)�0*�����9u�o�J��I2gC����Q�J������ͅ:�6����΄��Krg���hO�;/:���Y�Q�J���ň��+�w�t�8ߙ�Q����U�t	m�����W�e&|gAF]:�w:]j�7�����
zg<�E� �u�Q�D�XX���{a9�J�qV���$���$�2g����z�*dø9���� ���=@܄U.��斖:��K�
�T���|��l��ϑ��dA�0�DV� ���zvh���ig���}�o`�����Ɓ�H�vz��0�b���6L�aA��F�氠��՘�ÜM65n.����;�D�G��Ƙ�Âj�z	hP���.���&X�A���,���zj�x��������H�:=�
t���X�BӍ1Ũ99�6oj�{'狆-$�c@��<��=�B����}�vpak�Xe����P�)�-Ȇq�+iK;�:�L ��c�grĸ�A����K��>h�a�g2�,����J��*v����ٜ��8���\��`��y()f0���fd�%Y������撄<J.t��d�%Y���-!�\!آ�&c�~2�,�uz;����:f��d�~2�Rh��6�Zټ� /!�2q6y.�%�Υ�m�
�~�X^�&o]ZpQ�B�����s�����Aώ%�&'`T��.i��C��6^=hױę��*�v����0!%4?�#[-�7�,��BO�z��ϩ�ad�9W?'6�DO�zh���fb�Aw̜��ȨFO�zl��.M�r̜��ȨGO�zl�5g��):2s�>#�;z��cS��-i�0?����s��F�����3�u���F�8�%�����%]Ήmo�J}��.WΙ�Q���Fbk�h��b27�-;��Z�Q��V^�ݧ~���N0*�Kr+oFF]��b���T6_�SxA��،��t�_�~�2o����f.вc�ɧ9YF�����u�ƚ4�')#om\"5��o$I[|j�6�Ht�$g�3�$i�O��,7s���$g�3�$i��}ݤ��Br�4Q�����7��-��}�Pne�q�J���	�u��-�]����KeQ�J��g�]���1�v6Z�����	���t�[]:���B�u2�
�|t����x���/�pӦ)�8�%Эg�3rƸi�ϗ�#ou���s�s06��|臼�%=5ǌ� �@�Np��/Ȃqsn��K�kd-�COUI��|�J�-;�.�j�V��/c�5T%��*9���֎և�<����$�rAFUf�-wzj���w�@�	W�O�圌];!qn��m��VrWt�!�rAF]��;�.�>M�q����oX�Q�ƹe��],mf��	k��qB �rAF]*疡��e�R�5fY��	�p�u��[��Ж1&���}'D�-�`��	J��o�V�e)�ځ�9���Q�B��o�&ִS<�
�2qn9#�*��q�����R�^�5'0��UI�-C�u��r���<ܝ�����V�������R;�s��ǹ�|s�N����[W��RR�]FϹ�,7�֮zњ#'�ai���3�	Ty�%�N�4R�p�@K�u���1n�+��SS���)iH:z��D�g`�d���ڥ}mC4f0&�I�rBƆ#������L�	%��D�>�9h���~�R�i$���sm�"�>�"������/ ��D�wjF=��S;�\\]A�s�aR��'2�S2*Rh��N*�zp����L�KN�x������n�
�B������&낌�$+�;��*n>VG�Q�{��
��T��N��Z�� w����\³ �.���g��֢�,�<V~pOb��Y���G�)Co�oa����]&�)�Ɋ�=h��t�m1G�]&�rF����v{U�粤b6�K�,gd�e��2^���A���匌�4�/cs��Zv�
�=)p~9#�.ɻ�wz�����|-}
�=��zN��5�/c�W���V�6��.�32��h�L�-�����F�N��'E�/gdԥ�~ym	����WTh�I���uI6�����[qSt�%ӽ� �.�����-[�1YAoOJ�휃�6�k��KG���P#P��'���U)��^)-[]S�*�m���ȨJ�]'��U_�Ì�è�*�:3�*i�I���v�٨���*9י�oTI�Nj���؏�Ƿ�ʒs�	Yot�שt��ڕg2�K��	d�%y��N��eVW�f+��I̭62��ӫ�����"�1+�����Uڌ���opKs��Tu���!���z���q��Q��ё�.-��!��H������#s2v�(yt$�v#j�w̹1*����rF��%헽ˬ�)�cb��nE����7���2�}�a��k5�%�3�.i���*Y�O����;����F��_�vIw�ɦ76�%� �  r��%헹eU=!ԕ���I�ёuI�t��d�&W��I�ёuI�����d��ᓘ�#2�<:�����4��:|stdAF]�GGB���֕-[,��A7�������G���ؿ�����j��`����t�.Ȃqs~������嚮���㓙���0n�/wz?�D���_��4�����Xd�L|�Z��l
��:|2�)� g��s�}�2{�u�d���͂:�������$o�[�A���{2��웎�.�*��A��CP���L�􂌺$;�t�%�	� �.�N��w���8|��Bz�A�L+؜�]>B��Ŷ�aq��Yu\������i�?����m>�d�Ӄo�uɝ�4}>��U��`����_�J���]�ǧyKW|=��[	B��T}2�ҷ _�g��foG�����og��)�ݻ7߾�k|�:��������ƭV,��ǥ�?�Q�+�}��������n������3�      �   �   x�}��j�0���y�}��ĺ�ة�ca�v�^Z����MJB�F��[Puo�}OĎف����u�]���t;?Nw��$W�@�0��$=��4$PI졼�����-`:((e
��T��S(�*��}�Vx~���h��q
 �Q
��5�[�O�*���b4� �1��r��}�L?������8��+��yu�[q]mK̆�He��c���V�k�      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �     x��U�n�@}^�� ww��\HTԆ��)�Tm�	n�Pc���w���F�BR[���\Ι3���/J
��w��%�d}��p�<�,�M���Q@�J�)9\�`� �,��8 ����f2��i�Yt^\�s/��Kc2p�Q:Y�s2v�x���[t��@t)�k3r2F���\�O���h2#�/.{W��f��H�1�W��ˤ�K�;�Z�s�^_�`n]~�|�'x�~2ݬ�F��a�_>�]P\��lcdT!�Vě +��b�2E����qku4�R0)����m�(!�rԊ���LC?%�<K��}?�,��<d�B.B��C
�Խ���Q�n���{6="^���x�q�&^���D�f�T��ɺ��I�l��F+%%��h%���gZ��-���3������4+�q6�E��]8gP��W�8ѹ4!��R�棕r����w��I�Y3^��W�8�1��䂳|���Q锕&bT�Y��$�-��VCUE5+ir���f5uY4���?	��i߹5�c��X�.��,B���/E)�Ggi�.�m�BB2�ȱq~qu?�cL�[�0l������_��>��W�����^���h��5��PkC{��ڹ��j}s�͎u�Z�����@?�|����&��ʲnT���j�5^cu�/��q/M����s��/m�k�,���mț�'�'��"�j�R�Z$QJ��AU;�|o�?�uR&oO�������(sOO��"*�xZ��?��/�      �      x������ � �     