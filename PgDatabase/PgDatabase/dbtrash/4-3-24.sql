PGDMP     2                    |            terion_billing    15.2    15.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
       public          postgres    false                       1255    38197 	   userlog()    FUNCTION     �	  CREATE FUNCTION public.userlog() RETURNS trigger
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
            public          postgres    false    249            �            1259    38304    user    TABLE     �  CREATE TABLE public."user" (
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
          public          postgres    false    253            �            1259    38312    usertrigger    TABLE       CREATE TABLE public.usertrigger (
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
    public          postgres    false    214   �       �          0    38204    accesscontroltrigger 
   TABLE DATA           �   COPY public.accesscontroltrigger (rno, distributer, product, invoicegenerator, userid, customer, staff, operation, dateandtime, invoicepayslip, d_staff) FROM stdin;
    public          postgres    false    216   ��       �          0    38210    credentials 
   TABLE DATA           `   COPY public.credentials (rno, userid, username, password, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    218   �       �          0    38216    credentialstrigger 
   TABLE DATA              COPY public.credentialstrigger (rno, userid, username, password, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    220   ;�       �          0    38222    district 
   TABLE DATA           X   COPY public.district (rno, stateid, districtid, districtcode, districtname) FROM stdin;
    public          postgres    false    222   ��       �          0    38226    districttrigger 
   TABLE DATA           w   COPY public.districttrigger (rno, stateid, districtid, districtcode, districtname, operation, dateandtime) FROM stdin;
    public          postgres    false    224   ��       �          0    38230    feedback 
   TABLE DATA           9   COPY public.feedback (rno, userid, feedback) FROM stdin;
    public          postgres    false    226   ��       �          0    38236    invoice 
   TABLE DATA           �   COPY public.invoice (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, senderstatus, date, reciverstatus, transactionid) FROM stdin;
    public          postgres    false    228   �       �          0    38244    invoiceitem 
   TABLE DATA           �   COPY public.invoiceitem (rno, invoiceid, productid, quantity, cost, discountperitem, lastupdatedby, updatedon, hsncode) FROM stdin;
    public          postgres    false    231   Z�       �          0    38250    invoiceslip 
   TABLE DATA           �   COPY public.invoiceslip (rno, invoiceid, senderid, receiverid, invoicedate, hsncode, productid, quantity, discount, originalprice, afterdiscount, totalprice, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    233   ��       �          0    38256    invoicetrigger 
   TABLE DATA           �   COPY public.invoicetrigger (rno, invoiceid, senderid, receiverid, invoicedate, sendernotes, subtotal, discount, total, invoicestatus, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    235   �       �          0    38262    position 
   TABLE DATA           [   COPY public."position" (rno, positionid, "position", lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    237   E      �          0    38268    positiontrigger 
   TABLE DATA           x   COPY public.positiontrigger (rno, positionid, "position", lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    239   �      �          0    38274 	   previlage 
   TABLE DATA           Z   COPY public.previlage (rno, previlageid, previlage, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    241         �          0    38280    previlagetrigger 
   TABLE DATA           y   COPY public.previlagetrigger (rno, previlageid, previlage, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    243   ,      �          0    38286    products 
   TABLE DATA           �   COPY public.products (rno, productid, quantity, priceperitem, "Lastupdatedby", updatedon, productname, belongsto, status, batchno, cgst, sgst) FROM stdin;
    public          postgres    false    245   I      �          0    38292    state 
   TABLE DATA           ]   COPY public.state (rno, stateid, statecode, statename, lastupdatedby, updatedon) FROM stdin;
    public          postgres    false    247   q      �          0    38298    statetrigger 
   TABLE DATA           |   COPY public.statetrigger (rno, stateid, statecode, statename, lastupdatedby, updatedon, operation, dateandtime) FROM stdin;
    public          postgres    false    249         �          0    38304    user 
   TABLE DATA           I  COPY public."user" (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, updatedon, organizationname, gstnno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    251   .      �          0    38312    usertrigger 
   TABLE DATA           e  COPY public.usertrigger (rno, userid, email, phno, aadhar, pan, positionid, adminid, updatedon, updatedby, status, userprofile, pstreetname, pdistrictid, pstateid, ppostalcode, cstreetname, cdistrictid, cstateid, cpostalcode, operation, dateandtime, organizationname, gstno, bussinesstype, fname, lname, upiid, bankname, bankaccno, passbookimg) FROM stdin;
    public          postgres    false    254   r      �           0    0    accesscontroll_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.accesscontroll_rno_seq', 85, true);
          public          postgres    false    215            �           0    0    accesscontroltrigger_rno_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accesscontroltrigger_rno_seq', 217, true);
          public          postgres    false    217            �           0    0    credentials_rno_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.credentials_rno_seq', 98, true);
          public          postgres    false    219            �           0    0    credentialstrigger_rno_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.credentialstrigger_rno_seq', 157, true);
          public          postgres    false    221            �           0    0    district_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.district_rno_seq', 1, false);
          public          postgres    false    223            �           0    0    districttrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.districttrigger_rno_seq', 1, false);
          public          postgres    false    225            �           0    0    feedback_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.feedback_rno_seq', 5, true);
          public          postgres    false    227            �           0    0    invoice_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_id_seq', 1252, true);
          public          postgres    false    229            �           0    0    invoice_rno_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.invoice_rno_seq', 283, true);
          public          postgres    false    230            �           0    0    invoiceitem_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.invoiceitem_rno_seq', 278, true);
          public          postgres    false    232            �           0    0    invoiceslip_rno_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.invoiceslip_rno_seq', 5, true);
          public          postgres    false    234            �           0    0    invoicetrigger_rno_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.invoicetrigger_rno_seq', 439, true);
          public          postgres    false    236            �           0    0    position_rno_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.position_rno_seq', 5, true);
          public          postgres    false    238            �           0    0    positiontrigger_rno_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.positiontrigger_rno_seq', 2, true);
          public          postgres    false    240            �           0    0    previlage_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.previlage_rno_seq', 1, false);
          public          postgres    false    242            �           0    0    previlagetrigger_rno_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.previlagetrigger_rno_seq', 1, false);
          public          postgres    false    244            �           0    0    products_rno_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.products_rno_seq', 120, true);
          public          postgres    false    246            �           0    0    state_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.state_rno_seq', 1, false);
          public          postgres    false    248            �           0    0    statetrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.statetrigger_rno_seq', 1, false);
          public          postgres    false    250            �           0    0    user_rno_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.user_rno_seq', 196, true);
          public          postgres    false    252            �           0    0    user_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_user_id_seq', 1010, true);
          public          postgres    false    253            �           0    0    usertrigger_rno_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.usertrigger_rno_seq', 829, true);
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
       public          postgres    false    256    214                       2620    38371 "   credentials credentialstriggername    TRIGGER     �   CREATE TRIGGER credentialstriggername AFTER INSERT OR DELETE OR UPDATE ON public.credentials FOR EACH ROW EXECUTE FUNCTION public.credentialslog();
 ;   DROP TRIGGER credentialstriggername ON public.credentials;
       public          postgres    false    257    218                       2620    38372    district districttriggername    TRIGGER     �   CREATE TRIGGER districttriggername AFTER INSERT OR DELETE OR UPDATE ON public.district FOR EACH ROW EXECUTE FUNCTION public.districtlog();
 5   DROP TRIGGER districttriggername ON public.district;
       public          postgres    false    270    222                       2620    38373    invoice invoicetriggername    TRIGGER     �   CREATE TRIGGER invoicetriggername AFTER INSERT OR DELETE OR UPDATE ON public.invoice FOR EACH ROW EXECUTE FUNCTION public.invoicelog();
 3   DROP TRIGGER invoicetriggername ON public.invoice;
       public          postgres    false    271    228                       2620    38374    position positiontriggername    TRIGGER     �   CREATE TRIGGER positiontriggername AFTER INSERT OR DELETE OR UPDATE ON public."position" FOR EACH ROW EXECUTE FUNCTION public.positionlog();
 7   DROP TRIGGER positiontriggername ON public."position";
       public          postgres    false    272    237            	           2620    38375    previlage previlagetriggername    TRIGGER     �   CREATE TRIGGER previlagetriggername AFTER INSERT OR DELETE OR UPDATE ON public.previlage FOR EACH ROW EXECUTE FUNCTION public.previlagelog();
 7   DROP TRIGGER previlagetriggername ON public.previlage;
       public          postgres    false    273    241            
           2620    38376    state statetriggername    TRIGGER     �   CREATE TRIGGER statetriggername AFTER INSERT OR DELETE OR UPDATE ON public.state FOR EACH ROW EXECUTE FUNCTION public.statelog();
 /   DROP TRIGGER statetriggername ON public.state;
       public          postgres    false    274    247                       2620    38377    user usertriggername    TRIGGER     �   CREATE TRIGGER usertriggername AFTER INSERT OR DELETE OR UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.userlog();
 /   DROP TRIGGER usertriggername ON public."user";
       public          postgres    false    258    251            �   �  x�m�K�$!D�p��?|�-պ7���n�}i�48��ʒ
=����(��X4�?
ߟ�����7g
���y2��g犼8O�S���� ���|�P��L!߀��(#O��2Q�@�-� ��K/I�I�f �����=���:�5��u��^g��N�J�⋭���SK��N���gت��:���t�[�b�R��,�N�Z-���`�j}}Aw��v��32�v�I.�xN��ɬ�Y�'�筵	glW���Bkv�C~E����q����R������a.G����aQs�0�OD�xR�yA�������x�\�R��IP��U�#�����굯g����x���Es�sO��b9#��eoY},�-��-��y��r��jN����z�.��c��+j'�
"{<� ���Υv���4�l���y�ӡTmwyz;�_瓔�������c�TWd      �     x��������㧘؂H�շ|�K��^�Ao�??U�Zխ�.$��1ߨ$Q?R����}������?����8��`��ܢ�8m�������7~"�~��ǟ?H՛�M���Fʑ�!5U�R���X1� P��}��8 �[�7��ST�j�������T?o���*��s�9R�i��m�Y��/�d����y˒2��(m<�����?T���yl�F�q�;)�m+I(J'�N.縓1�D7�w��!��/�6�[�-R"���xFz��ue��c�b��sJc]Vc��)����"P�ܸ�8b�R�ʟ�����Ɉ���q'�������Nr���>�1��k,�J�6�Y��7��rб��W:C�'� �F)IJ��Qʛ�)f�Pn�	��r� "��������J�{՟Ũ�5�G|2g��D.�g#ˍh�T��9�D�c���H.�{�Pz��C�X�o��אް.u!��F���:8�-c�YW����AT1C:vF¥���<�������.8�~���b�+����s,�mD~ i5�'_���o���}��d�v�"V4�"m�h�Dh'�v֔ڐz�¹��G9��L �:#W���SX��6*�Zژv�d��n"��4�<z�5)/ɱ-O�=ఙX�J��}���#�UT���"]/"?&�3;��C_'�~�����z�X��XX�KV�D]�'2��vSF�Ģpl�N�� ];6�+������|��􉝄�;��\��d�HyA"K
l��󴉌/��d�nJ�4�/5����YR�M�
�o�L>oh%*�[Q���ܷBw�vR��Pr������8f�tՓ�eQ�;'���Vҏ5���t2^#æ.[���e�̔K�F������ �m�H��(���1���Y�V��d�<K�&_ZdXHf%�nT6H�o'S��S��.�t�rR���y&:��H��E<G[���Zz_�pK��[B�k��$�t�\Z�q�,g�q������d�3����4�PY�J%c�>�e�IJO�rL��Q����`)_#]��ȲFj���im$ݪ�܊Je��Ғva�f[��,-�Y����"(ӻYJpBn ݢE
m73�3����1`�G�n*�A���d�ώ�YQ������6ϩ��s$ �k�	��&��I1T����T�g�;9�E�d�J��5�s�"�v2�d��Bn��m��"%uT�m�nr�{}_�DvR����Bn!oaJ��"���y�JO�FO�c0�y��T��_&��p��|�<��#��J����~�F��E2{^I�z�eӋ���g�1�9��9�G�O$ca����\����g9�!yA�/l�1����D�2z>�p�={�@'j2Hd��4�C-ޗ�������u�CP��>�\Dե�b�����.'ZQ�7�-��lM&/ ��r���&��+ɭ���@
"�(�<����j-�.k�]$!� �Fj)s��.W���= Q�N���ֆ,c
��tm��VK�A��!�VZ���)sݪR8D�Z;w�<�+\�qg=Jg�,�9Xbd)u�Q��P�#R"Ŏ���s�@��2�GF���Q;�'aawr��|��?������u}g���a�H"}g��I-���V�+bQ�}�C@-:��n'p`1lɉ���3�8�~���QP�u�A���y�C��sſ&Ż��Ih��.�1���{5˓}��~5]*phc�=�ϣ��(]�^r��ڦ��R�Q�<F�pe����3�qܙ��ѓ$s)��A̗Q�D��.�\Dճ�@R��"�����0)�M�a��ByA��`C�9]�dsBQ��PK��L�B�Sc�P�MU�B�1ً��Kc�.��O�Q2��x���?����\�����;Q?<r1�\b�3O)}�%Nh9?�H�
�@4�uT������Z̖��&I�QT��2�P�eR�'�y�t����^I��0�.�D�%)����/��PZ',k��+0��_R�����-E8��3�7��������=TC꠾5Q���`��ba�������z�*�Qf��i���_�?���ǃ�|?�q�vt��K��r׆:��x��|���j�.Hm���ؤhGt�EU7��:O,�e>e��
Öh#Wj�8��"!���}�z��}���K�"�4BC*�`�x@�C,��`c������!��K	��z�C:G/��[�%�1����xy�[��nѨ���sÒ�&wgc���8�Ts��O#2{_M�4Dc4�'�14J���� SK�l�}�>�3F�p��dJsT���s����o�H���Y�^���l�r�O�� ��i��U�S��K�1��]�E#�)��.�ֻl�aC�}�eϫ���D�rӛ݊R�*P�#���'HK��S#�Q�pe��[E�%x�1�<�e�gj�&�P����#���m-�;��C�P�;��~ێ��-�B��G$��2ghL[1.��r�6���I�#�Po�SN����~��F��s�o����M[��/r{W@SG�>�K��I�e��͆4�6�?H�>��Ig5�	d��a�,��B�.���f��}�LfviR[;5Pv��~{X.Y�79Z�NL�ޘ>��1�lͼ	9aĥ�Z�{�G�?��EϞ����2�����^��<H������&���r��Ԍ����j�3�>x����ȸ�Cǜ�Fcg��׷=þz�}��Ϊ?�+B!����$�B��7�����Ù$t�8��߰ы�d�^��^W�/�-�,c���`���j������,B�8�c���q��dm��2��e�26�E2�)��#��@'z��;n>4�iY%�?S��r(]�9�U�k��V:;���{n/�<�z=?�����èRo<��)8��*��B��EcB�E)���|���4����lq�o����R����������T[��	�9��*ʲ��]���0}���L��J�.�L4�s3��d���7�&0�[�D�;��垸�	Ŧ*� ��Z{��i�q-j=�hrSO4����4����,'"v�>��\�?Ri/�z/����q�;�6�K��߷o߾���<      �      x���Mk1���l�k|K`�ͥ����)݁�$tJ��k�Նm�:�zƖ^˲3����l�?ֺ��;=���<=��C
�a����)���Z
f���-��K�Ȓ�����|�9�o�\Q�x�!�F���E��d�9k�i�'�]��vTF̘y�侏�=�&9����������/,u�ն�c�J���U	�p���!��-�`	7���L��̌x�81`�*
ǐbԈ5�zQ	����FsdX�my=��W���jf�젤؏n����9Ygũ�6ªb	V%C�j+F�ikl8��̑:ެ�p��F$)�ĩLۡKF�TFի�p5&X��yf9>�E]"a� NeD�(Ne��;0�Q�T?�T�xq4��R��YN]
Q$���8���(�TR��2�H9q3�D�UHy*����m����H��������5����(����E�L��ģI��@<�LU�
fA��yQ0�L(U�,�|��M�m�H%�#_��'�C�*����P0��eN^~�u����IOw���/�]w~      �   <	  x����n\7��ͧ���u�W���Ƙ]6�eLĊ9L�~�*���ܭC��ز�u���_d��1g:<������߷O|9�����������Y�ez��M�G���Ms���0���}~>���ڭ[K���nG.�jb�^��&G��*�RSy�g[9JٌJn%�G��}�xO,��׻�M�X�M�kj�
��>��V�k�;|�:�͎R�*��%�>^��~����n��}��`D7$�\� ��V��/���J�zRIĎ�e���F��@��c�P��7�B���H����&ђ����7�]hܴ%
/�x,~"��0�{U8"�'F ��\ff�Nn�d+9�l,����/j8���;���D�����e�t3Ά�g>��&bi��8B�BQQ��J�[kͲ&�����zbp�S����o4���Rr�;7�烑�����Q$�����=N��K�*��Y�X��_Bh��fes��xC��O{�|�E��A���n%7�謻���"3Q�-	>D!��´ч�YZC"����:'��6)?M�g���l�F�Q�&Y2V�����_ǧ"m�6�$e�5�p���;� �"I��n,�څ�XX�����&��=�~�sT<WvE�˪o,W��I�|Uݳ�"A�1��D�>#����-�+�X,6�y�[�1���"��C�4����m<�>}C�k���XS�F�ĈL���\��=�h�dM�W ��ڠ>s���\gg(�EJ2:|/���%�Q$�p�d|���&�BL�mU�dϜ��r��VZ�9z�9�]L�qi���d���ܶ%+W�
��A'Y}�9B�0�+V�]cP�w��s �"=�-V��hQ�Q1��/0�́�F�$���s���v̊�ڳ�T�h�E���7!�P�E.ر7�@��ņ[㌆��sVQ��R��2�Kɢ��4:R�
"堔=H+��K��GV�*��#��\fh�ݓgia��f���A��$o���5��'Z�Uk�7ЕH��KQ�ؚ�����a:��ΒP�.��VK��c-3�o���^S�Y���K4��B�I��.mǣ'��~��Fӟ�]i��_jlA���(^B �[�U�ך(Ѫ���~���]M�T;�_k�!��_k�5���L����	�Fo7�n��iQq�	��u&2�!���یf�1�Kb{U��Ѯ�����`-�dA�c��e>Wh�6�6���Z����H�}��ϊ�A1m?�F�T+[G1D��F�~�~bT��[)�0�lx� �+��!5̅r-���C4_�C��4�������Ü�|-#H��?﹍�铉�LQ���n}6�?����C@�©>t����Y����%u��B)���>#�>܍:}�t�0(X�f�ڑA��I�k��咣&���R�7|q�w�3�w��F@U�g�Iw_��X��t�@K��Š�Z��B���4C5����?������j����]y�*tw�R�׈����A�j50�*��4�l>���3��/�4�?���B�ք40���X����ri�o;���,�݉�`�����O#�b��HT	��z��f���'����S�����S��Ķ��J��L�u��1��ch���$:��i�J�NL�#s/e��i�J�>Q�`:�J�B�,�y��1pE����*��f��uLw�ִau�;�Ө��:0�^Ps�Z}���4j���яl;\�}R�����S��s���9��U-�c}�������93���sK����Ma�cHt{t����*B.����i+�0�Cq���D�=��>���3\��j����r-~UkW���iUO�\�����g#�≕��7�?"P����"�!����תg�M�]�������/8t1�@H~�� �$�v������ELߨ��bA�/��zn۳j���؏İ坚�d��+�dũu��/(Y���_n��v�p��ۯ_ox-)�����Șoҭ��?����EK��]~���@/�q�?����z���Y6T��MŬ�@�L�C��{�k�t�,�PӲTN�.ne���{6h�BI���C^<A8c$Bӑ��f^?�/\f���@��F-n�tl��L;Њh��������A���k��ƂB��;�u������30B�S��9���S��E��%�Ŏ�v��ʒG�Ɲ	��Im�{��mA���u�\~k�(}`щa�j��_o��Gm(��I��d��g>��ªY���ЊG��a�և署z#�fz
dr�`P��SF#�r���-��,tE��q��OGp���NT���Eze��DG(�OO��U;���(m����eu��|��.�6�Fʿn)��	rp�      �     x�5��n�0E�寘/�sفV��r�YD�����v#Z���u�ٜ�-���rBYF	�tE����_g��,����|���~�eYU���A��N�����=�w���2[��ʏ�k߳��c�h?�x>��N=��
�U�л���s̞i��ϗު��PY�T��<b���Tr'�����Q	߃���g�$RI��(̐J�
,�;����O7HD��#��c?B�ُ�ȗa+�ؼj���q\���"X�{����3�3Dl�{�<��U"�`�ZQkq�/y�D|��4Ԯ�:^�'��� �.���7�T�A�Ԃ���m�)vt`o�Ld�C���p}���4偌#_�)h>4���_���!��i�ڀ����B����1ťb�N�/�a�b��A~��mǵw*E��O22噧	�PE�4��,X��"����A#��T������)��
����Y�5=�!e�y�&�W�|�%W��5�U�:��Og"v5u�K#m�k�'�Ê�Ƴ��[)��R�.      �      x������ � �      �   J   x�3��H��N100�2��H��ɇ�9�Ss��sS�|ΐԢ��<��Ԕ���l����\NC#c.S�R1z\\\ ��>      �   8  x���M��6��������p�uk���Kz�S.E�Hh����l����Ғ@�����g�␅v?����_cJy��v���x'$z 9�_�|2���랅'�Lg�_��n�Qd�%D�,��>ȡ<���AG7#w�"��ˠq`���'9MJyr���&�QH�@��c�Yu�О��"��"�I@r��(�IC��K��ĩ�W����_�~����?��9~���*\���H ������䦄�\(��u�E�\��\P1R��<PJ��p�Y�c�h�>����1<p��BV��Y�eW\���#V��=�n�ee���/D�w�R��u�!N��~�����Q"W�a���� 9��ٚ��d0V2��{��T̂֓���b֠���Ae$�j|x*�R��Э޲�za��BO(2-s���>�,��~1�����0�򫔀w9����ק�������M�UDt��]�r����m�0� P�(��A���)�ꀳ�43�Rz �P�RܰQ�ˏ��}~��e?t��*��񽃰ڝ���y&���	����R^�%|���ڬ�
�Y]��;�U�3��z���U��*'t�wӛC,�PgʻF-f@��g��nC�, j����]U �L����8w�tz�ل{I�F�7� n6�^/D�I�z) �M"�KFlb�Z*��u��a�����fK\� |��)��2K�kK5�<�L�AΙr˖��m��l�8�>2����E��oX�b.إ�}��S�[����(�c�"���O�5@Jk_fu5�(Z�lY�+����@��z���v��i�hx��s=`�w8BJ���p���~n�	��>���;�߁�|�|d��w�#���Ȑ��!�����w�A~C{~� ���_Ir��7�����W�_��|A����Կ�^�������'|�v>����·�;���Gl���G���|����*Z�F�����t�t0Б:��@G�@��qj�os�@��9u��Ȝ;�e���2��ݳ��w�3k�U>\���TQBr��U���r��H8w@F\��]oBdؼ��	�u@&q��]OA�"0���B`f!ԡ���A�0'���	��[��u�N��;�G����s~�|�a�p>��_�p�gؾ��܁>�0���L�;�����>��G����4�o�!���G=�C�t�s�W�4����a .~�_ �KV��DY�N� b~�o�@��r%p�CĤc�j���L:6�p��ݫ�m��@\�gv��z �3��F=�Ù�F�JK�ʨp8��z �3���.���a�Ùt� ����Y�Iz���&!x�o�}�<S� 5�ʹ�+r��=��"�`�u��A��=4�y�&�Z��@ N��`A�uK�=v�+OOEV��Ӳ�������ZԺΰ]����M�~���պW�Q�l',���,��ϯ��+�MR���������q�.���t��B�0��7�<�hxoi����~���Em      �   y  x���;��Fm�]4��B�l:�'��?���	L=�kq2@��A������??��Q��ۨ��Ͷ߿��u�IPUR�G��jw�� շl�
b�D1S���� QR���S�=�����O7��X��X��PӨ�4%W�K
��(������KwI��K_��˵��W����@Vl�dx���\(�M��B���O	 1�� {5vR ���>o��j����F	 ��� &c% L��d��jk\Wb@el����y	 ��� *k�r@e�T�����5S9��Y@eK=@e�<L�l��	�-�0a�e&L��Äɖy�0ٳHM�왇	�=� ���u�IAg�*;���8�m@f�@��sj#�n)���}��84ۣj·T���Q��g����`������B�x�f�r�D�����WMPF$�~���9DfS3�� ��}O}��� �̗���R�"�;c}�Gn�A�O�����`v?��'M�q���'.��丿��9�����[��\>B�@��8!ϫE���ۙ���>��8���U�����_���h3(���	(.��-�3�����8�G��u`>��k[���_����i�0�@��C[!�������A��D����e/L'�&$��������}������*<���U��]��~��
�]�%n7g�ه`�٧`��xz��]��P�Vrׇ=7��o�t�ۇ���;PWz����h��a�蒂�cH
֏))x��;��J��ཚ�ེ�`����Z%�U�Gm\�V�W�r%[Qpߤ{4ɕlE�}���)W��M�G�\�V�7�=s�[Qpߤ{4Ε�Ǟv��)���=��J���K�h�+݊��.ݣ��t+
�t�f�ҭ(���=:�J���~(����ҭ(�w����:|��<^��N�{9n������������+
3j���R�(�`���J��0�)g���R�(�`��*�J���~>����}��mlňb �1���k�Ӛ���3@g]iWf0�XZ��z��r(�+�*��P[W��d��[W�UAI���+�ꠤ{וrE�}��QY�H�(�V�{�U+�=
���u�[Qp_�{�֕nE�}��Q]�H��+݂B{]�VT�R���_�P+���-�/�^�ܛ�z�������'�n�o:�Y��1���y� ���К��Қ��ԚK����rs�ؚK����R=�훺�B�5����M]�u�[���m�7���u��}Peq�2����4��J�m�S�5�[{���=���^�����]A�������{�&���I���Q%�
�P0/+��ޚ���zk��ꭽ*��!����������+c[k�VO�F��Wɷ8��������?�v�      �      x�3��CA��F�Fh\1z\\\ �	�      �      x��]ˎ%�u\O}� ^��瑯^ٰ��F^�JA$�$J0i�#�65g��}�\3QyO�8���ʟD��?��?_~������&��%�]��S}��%��S)�o�	���${ٵ���V�.8�%�ޒ�Z��|1���~��-H}I�Eْ��Z���hߥ���&���{�J� ��"-�ګX����2]�a�1�s��t? 3]�^���d�|u5�Qً���I��郹�*@��~Pʋ��޵ ����H�0M7͛�˫�/���SKeS��/l�o%�w�#�Y�t�'{�6u�H��u�ޔqG���}��N�{K�7-G`����X�琢;p��� �i^l3��S?��8»���u3���Q�Ou����zk�_�rCH-��z_p.��	Ρ6�ɀ��L*B��ˆ&N�{R1߬_���/���Ɋo����t�x�h�z@/���M�#�~W�Go�G�s �\�],5�
���^�7Rc����ug��l���w?��߾���������_������/�����]!��G�ko�c���dō1\���r�����߿���W�Z��h\s�]�,W���K㕕�Ҁ����IEʧ��+^�
�FzlH�y�W�|���O}Tjo�?�����Y1�Rq/m���C����C��8�*���l�ㇼSվ�%�sJx�^)���y�K���W՜�V���u��aۥ�o�~}J���K����҆�?�]e��L����E�m����D���B��L�`f�x[n�e�S
��F,�V��+�߿��7�*�i��?��;��o�Oɿ���_%o�Z�VCx|m,�����Z�j��#p��?��3$����8�#,���)]��񄇨{�j��k�:rZ�QZ{RY[dmco@��*�
L��UnC��H+يn-�]�@�����ǰ+��;�w��B������r?���mE�Z
ژ�^�mh�5������_�z������v�rrײW�Z�mhy�U�o=�����$#�biny���MnC#��1�+"Vnm� �c�&^��C�2�]�&��փ[�M�F#�8�l����nhC��Mk�zpkk������	&���I�c�=��,͑��#-s(��k�̵-¶�%��}v�m���9���e�Ykj���3�>���Rn�t`���w���� D)`����6�rs��Mv�ːl<OR�9l�^OGJh؁�>��9���'A��K���v㺥!�;�g���'��R���/Oa��wٻ;:X���|���!x��û���|��hW���g���6/��N^6�x"���6/ѥf��3�D/�m^�7��]͊�-x�gE�Ylv>���H�e��˜G�2�Yx�o�23���5{u`^�ۼD��M�Zl�w�e�����b,H���.7���ao߽�p#�W��]^D_��6n���.7����lZ[F��Fw��rӿ6�e�M������"��,['v��rӿ6��Av��rӿ��n�j`�.7�������XC~ܐ��bכyg`[�s��ł���ݙw
VM�X��zۿMXJ�>�Xp�z�*��x�����9;^d��������^��y�L���v@I�ʂ̓���c7MT3�I�O�Y�l8w������t�:�����ăs���]9�����w��+��7�9�u洛�ع�5M|�q{m�����o~F�E�?9�O��kS�#O��kc�O��ɧ�G��t����vϞ����=5�=�X{j@{;Εό��`�����8Y>3�:�gpg��G���̘� v�w?5�=���g�G��|y��8`^��%���8�v���^�`�ܙ��v��ik�`�ܙ��v����`G�©q��8?S����3]��8?�U����3]��8�[�˨>85N=�Gp�y��ƩG��n1/����8�v�/�e�������żlq4���Qqj�z;��wTH��������G���;�$N�S�`^����#�����ƩG���s����S��#�W�G��NT�`_����:Q}����D��Չ����S�#�qZ�ֿ5J<NMT�`�i�Z�h�x�_s��h��ʹ���� ��(��/ۯ�s;�nŁ����k����Ϟ��N�����ο ۯa�S�"�t�M�ģ�?�/���P����C���쏺�격D�aCÐa����~oُ͈�gO&�@����O�@����4,���8��2�s��~%�=NٶR�Q��E��Y6����n=0-���Mh��T'w��A��g�nY����ġ��6x��Q�$�j���9J�<5�8l��q���\3���<$:2�p��YMyG���#����ݲ�)�}%�1��"�h�������.u#���G�z��Hh���a�{����
�췅���3���|�}%�I�����f�A ���7^`L�ȑ���� uy&1�
>Y�سw�<ז]��e8P�Q��S��'�м_a����-_�sp���7�Uh�r5�L��=�R-3�F5�
�/biƂ*�i�=�����x(�+�p�T>�z?Q���ҩR��;�� ����u�?�牆
�?[���kW>`]���s�A��y�Ⱥ�9N�'٩OȠ�G~~-c��(�kz���_�޼�Z�p��١0R&����G&o,ݘ��xV���������g+�F/k��G�ܙ)�h�>���4ݻ��\w[T��Č�Rљ0�z_�p�B3��j�J`��ւg���7�?�jl�^���sL��	88����RH,S�<�U�����h\���`����b����������4��eԘEQ6#)�\.7��|�븎�ҫm�r|�u��ցSi��i	wX���G�S,� k�z��G���꥾�f߂?n �q<�Zf�.�*����g�o�+ݦ�jp�yh��A�#�n��'~�3'�OĘ ����as�R��:���ZGW���2;ڋWry�f��:���,��z�٠�$8:j饢/
��Y��۟`��ɝ��!�ዼ�Q�,<���[�q�\�x�2gHڳ�N~V]��D)��N������Q�WK����_���z$#���)sͫ��}��a�r�߂���H��G җE�Ɠ 2���� �<���	�����Xx�y�Ğ,|`�8���u����8��xs���}�!�8/i;ROW�� �8	>]97ʞ{�N����(s���*��謆>i��94ϼ�3�=N��W���b�8�	r�%��,�[����S~l�j����#��1�鑠�"4��j��3�R�ܮ�W>5����ܜ$�=���V��U�̱�4j
4D ϫ�3�E���#C�������f�I푡�$w"������̭�������W����^�� ����q�=���K3�͂�ClZ;'�� b.jA�!6�D������+���YB�hA������;W��rx`�M��	p[�}G=��-�?Ħ�?n�yi	 �Cm��s���+���1n���^x� *��ˍ� Dl��s��Ӝb^���3�j�!|<��4�����h1i8�3���o�]�b|Ё�ei�£���Ϥ��GC�%>���	�G��, �(JQ[���q��m���Ε�z�m_@�q���xy�����]�V\�� E�ˌ����6�c��*��~������ �Ɛ!!�)�e��h�J�=�A~"�a�s�~/	U(���|�=�(5Z�u����e�7�?A0F�B��8{����ڍ9*�Q$�笏���V��G�|��>Hm�9�a�@ټ���(������@ټ���[�:o�#|�lYA���E7�Z������2jV�T��HYA�<�2�@�e������/���xG)�@�r���I<��C*b}������E�n朵�����>g3+Kn�;mH[���]�o��
3�6HV��'mf� �X�j\} myFZ��]����DE�a����z��c����	��   h]�^9�E�T�+U�X7SS���ՊT[���G�E���+(������	��+(�#Sy��x�+ue9���I�qe�
�r���~[W0���m�o�����~���G�}�=�qe�
�Rތ`�ε��ζ�5���o*Y�꣔�=˳�o�B����*�dT���}�%����|�{B�o�UT��������kC��z����i�����������۴��oAʶ��qf]�XOQ�lԴ����K��E��V?JZ�
���/j�KS���پ���!m����(i�+8������ E-�~m����{ļ�	���}Em����9<����-�)k����.��VNj���9�[�s�rW�����W�P�D}K���2��Cl�8��
�~��e�Tv�H�Q�����!9�Q��kixDv|�ꑦo����d�Ïc(;ROg2����xg���L�A������"~��������n{.��CP�h��l�U��0V�bM�s�@G:Abm��������S*T1Y��hZ�Y4>j;ڞN۔����ԧ����8A��ie5�3�ئ�eee��O#�!++k�/ش�����kTV�W%uze�4�� ��QsL�@XYAX�cC ��Y��
���ļ�聯���.��:*��e��
���3p����
�&���AX�Ka��&����@^ƞ3w��Iua}�˻�-(�T�Q����*�\yF?'��x|w2��ë��q��>��lA�:BEx$�����D�ꍣנt� ���|��lC�C�:i��]��R~϶V�wq-��4(���Z�����yӴeqn���t
u�zG�C4��ꔶ�?���dw0�2ȝT��=i��*�wO��(kSʞ�ׇ�ҵ����U��c�_=�b}�yR��Xn�p��{L聰6ͱ�����;gD��@=ȞԦI����W/�&z>�M�l�{�0���������V�jS�����m��Hi@t�)]::�C�����7n� ?�զ|��h��WZ�tGW�(.=(�Ԧ�������qO2w� H�S�Z\��Y���2N�k��(�i������A��r�zP@�\u�񙏔9��oP'�[o���|��E/��7
��ռdi�������Ӵ'�U9���P���� �R��,ϢS��kv^9�A�>�Y�E/��9H����S�3I�� ��d]��c�����%�u&=i�q!V62@���k��F���kZ�^�o/�#�=$X�)\#��h#J���{)	l����xk��v��֣S��yQ"�}5|�T+�d���t��Ϛ~|x�g�l��\������#@ _��$R��i������=v&�>m�1O���|n�:�|�u^,68e�^Gq�Z��O:���]�7��!���D^w�[$� }�U	���?�o�Pu�W�������h���o���3<q�X�7����Z��m��O)W��|�Bs"�1��7K�	<T�ыpκ�vUi�P���#&�b<"�	B-|D�-�\�L�ܷm��[r�      �   R   x�3�4��M��LKL.)-J��".#N#Δ�⒢̤Ғ�"��1�1griqI~n*LȄӄ��$1-�7�4�L�G����� ���      �   X   x�u��	�0��ni !o�u�����������(Ҙ{����u��$^������TM���%:��#� ���rE
��c��2�      �      x������ � �      �      x������ � �      �     x�}��n�0�g�)�-H���-K��Y�TE������QْX%�x����x�;0�S���B����>^���
<
BUi�=�e���+�@"�a��s������XF5E�� �Ҥj��L��tXə>���)� (bY�ŉ��6�k;��K�6}`����|j*�
�2č��6<IjJ�N��NK����g1�ރN�c���I�ɧ�~�q7��(t8Т�OU}Yz����Y/��ػo�ºJ��Ӭ2��
�țܲ>�]6����x��      �   �  x����n�0�����6�v	�"BT��洠�I�#c���3��I*}+����

q�x쌣�v���u��C�(����A��>]�"���D��,�D� ���䬰�s�gc�{;�ȉW��F#�"��`�4G:�ɑ��-��d�n4��v�!����[�P!�<C��^��h*0E���H�.b
J�)�(zGWY���5J�����L��Ω�d��C������=�STk0�e�f�M��S������;j�ڣ������_x��d�{u�g���x�QS`��i�<G���q(p�������BK��u��.���=|���z�mкS��5�c����~0��Mw�Xo��&x�'$=�{���@N�05(x�+�����b��&�      �      x������ � �      �   4	  x��Zm��H���+����ş�	�ڜt��&��N�N&3���h�뷪�܌Ͱ�3����UO�=Um�$�+)e��������ӜX�-�sA8	�����1e\�	'5~��{�Od�P���r����b^=���h_�����\����#.r�r!2��rϢZ?T�O}zä!�2��!0u�h����?�XB$���2A������9���^T8�u��K<�q���3d^��E�\,���E4A��J�Ȁ�Ι@_���g9�9ws��Ԅ��/Dޅ���>|�Td�Xt��Wv ['�̌8�se3ɥT�ħn�$S���J��Ȥ�/�N�9�����"�IJ&���p�2x�T�^$^T�<��.Ԏ�%C���0f��IU�W����iEn������B��?���#�p)����x����`�\�\�t��;B���r^f�f�!*���L�n\����6�2��Q�N�"��%��u(ҡ�S��9�d������������"2h/��̈́d�<)�
َ�x��w�\�qG�Lx��K�x���|�i.� ���L$�V2�i��bZ˜Aq�XD+�0t�r��%������iP:X���,�m�C�W#fs�Ug�B�n�����,�B�R��@A�Gb1m��T2m9��d8�.m���������\)�N�&��^1g�	��u�۷�pJ��ב�{�)?�u�� �t*JK*@%d�X	"��9O�2���'d&��[�!�B0U8_���w#�Y�5F@������o�!$ �"�>ϳ��G���ꗧ�մ����,���e��rv��T�B/��ܳ�+�I��d{s�s�&B��c�U~^X_��}�)`���k��\A��3�l�]��[Y��G���q�Y*󉸃`3�B��ү������uN2 *E`�e�(�֒��:�!��u�,b��K�d�1
=͜�m���s�Z�d�z����O�nS�t9v�5�|��5��T��6����S����p�
��VE�=��P��&�*Q4�{����0>¢���'P`�:s�Z�A;�q ��Aj��7���Cg-���`Z�@�^4�d)��p��Ah��%&P~��SZ�S���
6BP��
�W*�=�=����p�X�͢�>[���y��݃d��hZ̗�z�������\�8-h����w���^���
<V�qz��2�'����Z&�β�Ć� �7�z8��ճvGT��h�;���7�
d!�:P����׆����ڠ���;�C;�}zU ����˦����k�`_�~�@�!:��:e�s,rup���(���b78"��1��9OB�#0S�FD��O;#�EOk��ǧ�������偔��Vbg );M-��<ܩ9�6^f�����.�`������/q��e��OJ*�1��]N�Z9���
}����3�k��(����{��D
h�\]9P�8� P�N��F}�� S���xC�sB����iF�Y�����������~��v@���~��qV�g��_����0L�q�q�qN��\��+����v/,����&9ai)������0��,^.�5�/�Yiqڐ"1r7��G���ҎR�����@]�(s_�)C:N�U�U�s'jr�+�+�TG���kS_kpk�
��G[57\��3�2�1b�C��Z���t��<ǰ��K3��	�RQa��u�\di���a��ibe�:'TndPֹ�B�ʠP�o�����ʠ:$�����%�;'�h(�P�T�b"t�a���I.1H�}+o='@s
�L)*��s��ㅮ��@���ɍ�*����k=�=嵚1����F�mǶ/�O�]�cE�B��"�i�;9�g�{z�C�>k_K��*|:���7�$��=����uu���\a5<
2���l�1d��<ׂ6���ٍ3�ќ���9s�v��Q#�3�?�Ǔ�n���>��.F�_m����i�,�����������r5��^���kx	�������� �����H��^W%�7�5�rB߽�����Mfߣ��E�V�ɯo�-()j����`O���?/Z&;˿��I��Lh��8�M|<8l+P��c-��.魙<_�6�ך�37`���&�;d��_������

�j�~[>��C#���x�s,n�\����g���%�"೼��X��y�$?��c)�����f��-��6ST8�=�}an�vS��泮�c���Mw4�\$�U�ز?!r	�I�,��� \T{tUWmn�As#��4x6��(8c�蠝|�!O֟��q���������=q      �      x��}�rǱ���S�\Qy���:����F�w��Fl8b"`	�"$�e��Oeu8LW�uj@� EA���Uy�/v���?�?��p�?|�}��|���.�0a�ד~?<>���C��;��t�܃3�,1��oVGsw������h���{�=G��[D�;@������c|����A��q�q�xGRB@�'ka�t��W�!��#D�Jx��!C`ڋ3\�l'���Xf�ţ�6���@`�Kb/Bأ3轔O#�5 ����a�1�l&q{rF����pgՂ�;M�L\<
��B�1$�5S�D0N����#x-�=�����(�;��Y1��i��^$�H��y(�pE3�@^%!h\�KO���$����I�H�uN�yn`Ć��:�%c�-٤;ԓЗ����?�߿`LJ��͑Vj�B2�{�ɐXE!�=#�g��s_��~7!��^�����H�0��p��M�
ioل�*�@<s��!���PF������NE8_T՝�J�F������Yu���Rq��)�K�Ka
6��">���aD��3�3���c
.�%|�%>v�Fr��~�J���0���A�}P���t|�`r"A��Ά���9W�HFE�l��������θ��<���~�#0�9~�#p`�����'��n�4|E#1�ؙw@��]厞�.!?5b�d+w�7�Gְ��N-7�ޯ�ޒ	���o������Ԉy������kg�_�m��+ŗ�-�3朿�O�]�<CI>������&|]�IN.~3|I~ ��2�&�#��O6!��>�I��� -�����b�1�- t�|4/���h�\�~�����d?�����A�F�=������,�3�'�`�oR��d�~�����PNH#��)�)�Ex��V�U�'h�����+�ԳW���r�x��s@��/�֗3�R�m垺�$��(i��zY���Ƨ�#���b�<O�Hv89����\�����P��Tv_��kr?>=�����U��G{�M���]�����xoSx%��n�{?O?k�^;cѾ���c����%|TvO]���m��1��X�\��PBG�(�~P����X��/9��8,'�\��PƇ�9%��h=|��P�/o������C3�=X����$9���#�E��3�����ށo}t��	.B9:�M����X�b�޽_}��/*B=���{�$9��c���_�䐖�������|��ۏY�C�y�w)'�B#��^�/�[W_X|̺�y&06b(�k����BN��rj<4�=2>N�c%���_�-�K��./M�;~aOl����&��^4�\Q9�婫y�/�m��c�r���/�sJ��\����Kƍ1����T:|�x*�b+�58��e|����O��`����|�ʯ�˕�ؤ2��&������M���"�=��+����~M]%|0��E|MJ>g���ۯc�Φ���Aa˓fM�W!'��0��Ж�>�	���\N݃mb@2�\���
����\��)TF��r2W����\�<�5���$���&���3����ۤ ��3�E_���6����ZLn`��)#���S?ˊ�X����IC�C+C�g�]�Wn�heI��N�^��@+K����H`�6� �$�
�&��`�/�-��1�˜A��T�p�F�'g�V)Z�#���� leG�
�<) ФU6��	����l��� �0�_���y��B�l�IID�-�b} Wւ�Ȏ(@�

�q3�FvrCA��l�ւ<��\�"�����ؠc�:v��b��s�[(� �@$e_/^V�
P����P�^ܒ|贫�a9*�3K�ƖO Vǖ;�L{����)O] 刄v�������O���O�"L�(���+�}��~��cn����ݗ��o?}���˧��_n?>�t����/�0� ����ѣ�/OD�
�q.�S�g�J��9��5[ �}П���!悴�?A�QN�3��G�#����6+M�zV���%�A(�!�D�b�0���:��՜��XI~����l�\fm5�XɆ'��Ao݇jbU	�L^*�
�KSG(@I���VH *gv1��d#��%KYȋ��|	j{F)kS��gr�K� ;%tIUbt�>�U^|�f^�W�90i���]��ZZ���s������2��G�sNh'��tX�0�ʰ�����2�d�()�"[���|��af��]�h
>D�5m�h�	'
�U���l�����b�P�Tp���V�vX:p���tn+���\=�}\K�Q�m�N����\b/���ÍyP�R�P����S�Mθi�`$��\U<t��c�Ը_i��xuG)��h!���b?�i{�dޡ�ɴ�*��"OF9������W^vI?��?
��}{	���r#��P��tc�Y�Km�|�Q�R�S�t3�{�e�h�I�yO�\c7 /k�����,��F�T<�n~َ�{�(`��we�֍�o wHR��{S�3�nF�H��R�ĕ���L���Wf���H)w-�X&<'��f�����x�Ώl�F@ͣJ���R������G��MArj-�.l�^���e�R�#y'x��o]�&��@�4i����Fe)O�����q@9Y*�T�UZ�V��3�L`
By�<6����#_Ip��b�t�DQY+��T����@���fo^n@����X�ex����L��,�yϪ�B������PE�)�O^G喯b��3��R���T�Q���y��������U쐝}w(���5h{�I�L_��	�X��ԩm�bA��MV�� ��n��˛��M�q��.��H�qy� P�I~UVR�XgF�;"�L!av�g%��5�}}�Uk#�S7U�@hm�bf@�t*���e�,�9ٰ�u3��D�:>�Ek~�`����G �UH6�׼��u��y�q�G�8���Q���?N5�*I�(�d�c�.T2qy4S���L�����GA3e������	�xn��d�C��P{��
t$�r��Ö���kg�p]�e�u��W�Z�pV�㙱��V2tګ��X���^~��W����|��.7/3e��9�J� �r�2S�^U�E�xжJ�)T�&.��жJ�q�K�+�Mh����2�I�r���N��s-��=�k�gB��S@S��p�L��j�r�♨�h�O�"u��K6��	%�Y��*��Y��n�(W��mVC�ѭѮ���oe� �=��.�L�"t&
�T.��������\v��;��e�7�|Sy���3���BO��iDh&AN����E|�w��3�ceT^3F�Abş�֖�����Xf�֖�����f��i��%���I�qM'E0��+/!��y��me��*)�e���J-��|�=i� h��+��ð���;\���������JI�q��(����qA.>s%�K�\�HF��"Oi|�0�cQP�*ʔ\�ՁU�B,�"5	�PG۴/"�2�v��R�SyŰ����5�+�6V�}cGJ��1A�k�� T\g^^���(>�t��$��]�I�f҄�VǛ�@WI�-SJ�#C%��S�3Yyk��$�yq�ی����eJ�.#h������$ vtM &O^������7� ��+ϭ#�lrS��}%>T�JP�Z�'%��]6���SY��(��3N�<�[�L�	�m�����o��!���X��&���@���;�VPZ��`�J�,67�_q�s}�\Z���D��w�3آ��``(�ѣkQ����$��%q-
>@	F	E�o�-.�,��<���E�G�}���J��-�#��i労�#��ܰ.��k��)�+�������W'��ѵ��:��ٵ�#`
K-�ՠ�<m�3@m�ֽ`e���H0E(T�ž�!��z	��f|;C� ��l�F�*"���h�����,	:�TQ3��%� +�c�Β`4ɕ�J�ogI�x��Βd�\^����    !�\��	H�M741$ؗ(]tRqf�*M�K*kX����Z7=�`��"�J�{�.����9�2q��- ��,jwؖ�ma���`�$T��Ŏy�=X�_ʄZ�D+��P�2��أ�&���*���מ��!�X�5Ƹ
����zTR0+Py��Z
6��S6�������͗��I%�P���M; P��8�/.���زg��$���a[�Lw@�5��~Xg˖�����ڒ��޼�X)8Ħ�1*A	(�&��tP�ĕ	�.��f������C�ŰN�bW�5ɶ�V��Aq�1���-;�;����쵯��%�g4o���"���e%#�/zs�1��h�S�^n�"�Jg�2��nƱ��6��K��D%h���_Y�0 h��8�����}�Mۣ��YI?b`.��	Z&�o+�Ak��I�b制�KA]���x[֢��.e^�����KA�#$��rwAk��yt�@(�Zۥ<ZP�܋@��]��?Q����ֆ)t���=M��0��`J�ƊD[���L*�1��L�w�����I{��W���7L(����@ی�&�Qo��w�)jCo�#T��*��������hX��`� a��$#TF%hN�e%MMd��a\�֤nX��H�r,Jt�
VĨۄ�`�P�vu���Jr��!6X���*��H��zZ��`ٻW�l� e;O�å4E�N�B�F�̷��餺r�Q�p	��B���yL���z�1�̛g��,m�F� �D+�t���gː5�(Rn�$n�0�G茮�+�7Y��{mA�GQ<�u$7ٗ�dC�����ɾ��7I/Q����ɾ��X�̶L�A�d_�"d�� W�'^�̔!�|�r�I��nl^�n29�e��a҆��<�D���t]O6e6[��04�R�� P�Q��c���t}.L1b�<��-;[+�>Np�+.�4H�&���_V
�� ��!DeX������l�I�N T�Ю���R�Fʲ��Zٙ�0��Q*	~�6�ց��c��+q�m:� ��踒�w��-�,��e^rm煞���
5�^�Q�ʉ�~��%��Sc��	�/ObQǄ�R�,�(��d�]�*�!���H�7��P����2�7���Pw�_i��v�=#Lڈ=UR����B����v�������E~�6��г�'��V���m='�ժc��t�£o
Ŝ>p�J��t�o
����T�o�m�K�0��t��t������<��CڮK�`St��vR����$�	�AҵWfs��$��#L�0`����$�H
(*K�v��:,	�Og6SV��$<�YI�`W�zKV�=������?�h�&��S���ۿ�����㗻O���|x|�����t��K�Pt4yW� N�M}�'�\:~�@�@���Tf	�S�`w�i�I��7�{�؞)s����E���Δ�2�����}mR�+�,G�l7�쮘�p���>�ɓ���@��r�L�%����]+w(�m�����A��h�2&öm�� V� ��2XY庽n��vݢ��n>��X�b�BGt�I+i,�e?���"I��Y�Εk�l�I���C̈́�-�e���/)Tpe2$�U�R�g���Ф)��f����=e�D,:��쥘/Q��@东�e�p/�X��H�NTV��ڠ%�WרG��c��C۪��.?�b�)E��U�ؼ��R!dh[t{�ꌲǔ�r#����ҠC�������&���bƦv*MwJk�B�ک(��f?ƶm"X��}�e��XM��m�`��`I��'[�Ra���`�b�Xn�U�i���w��j~\\2!�O����aץ�~��o�7�_���ݧ���������ϟ>|N|�� ������������ۏ����>?�����ݗ�y I:M�z��r3��hw�ܝJ>�N�9�W�*��ۡؓ�{���� �.mx7U���_����N�H�R�
�v�������O���K�g��t�N@�z6��O�?Q:�d�x�kVzB�mO�����}8���Gz��4[�r�;�هs�IײַN��G՚���P1���?�t��W���=�S���L��}l#r�`�9�㿾Ļ=ڭ�����|�𱽒��4�p-��	�7�X��l�[�^~ETƗ~���
��7�ϻ��4�p�����H�)@�U�#W
WV�g��U��/�=����$���d��TѸ����tGTM�&b�FX?���M\?`��ȉ�ud?*_Uh?�����t���1����x��:����������k	��C�k�����j�Ԛ�b���z���7�8��t�v�O�w��+���.�>�6�I�6�B���P!hc�a���R����q>�S	�-O#���W�;\
����7)��J����{�� ȗ�P�\{�8���ґ�T��'���з��BW)N�7�&b�a 6+�Ħ^n�&������>���B����T��,��)N��#R�
�*q��n��<h\e���Hq*Xh).��BŅ��Ҹन8*.P�=����R7�o]���`D�21�J��.;�^�+l4�"�ɾ9��Z�.�%�\q�I9�>w�?����,��|ezLlؽ���2}�����7����0G91�9"��M��c�OV�o�wwB�y�⹿��zVcE��
��+�U>�D��q!x)��
l3�;"���mA��e;]������q�\�y:��"eu�[Z�>�X������'`��Qp�|�������n\-_ L�I���q��Tl+(OQ���P.�S��z6�r8�z&�!�Z�@�<�'�!���sxO�z��[�
L�����wE�J�#J?Е�pC�\3%0M���">�e�v���"IGM�:<�t>6xE���^Z��x٤��2�*�Z�>.̾�9�&�K�8D���2�(u�����<�iB��(w��u��l��ty�]����{]��x��IJ����MH��[�b%F]�ū�QD�vw�Ls7'Q�=�b���2�be��_�V�>ݾLl�S^I�,��/P��#�[or2J�s��+Aņ(1��;�<R.lۢL�ԃ��li.��F�jQֆt���- ��]��p�DPk/,�%�L,&�LG������g�!=��-�됯� �m��x�u�W�r� ��� /(3!yܲ_�҆�2�X�;�W�і�e���c�$A�y�v���Xr>�-��u�u���DPnC�+�f/'<�}EV�nK�4LCW	����B{!#��YY��J�m!^L��Dm��$�`�X��Ubt��u[x�:�N��R⑰J�t�� �X^�����8���J�����g�Jbi���L�J�m�qpZ��\+򺕌�R�:M�Hp\��#�B��W�`O�r���x�	ɷ�$��5�n��d,�!˾ʻ�0n	/�!�+��:�[75�[;+��]�qS�I�9�r|�:���x���C(��_�/����Nӧ�����o��' �3(G[5�L�y�Ɛ���ԅp�ԅp���v�]~u�T����D��Zf��v����D��S<����O>N��|�P�`(`"d׸w"\}��� \�l�Dȱ�l�4�݈ޥgK'b�����}�٫Nם-������@�#�8o���x�ayZ��pc�B��J:2�`�-v�����<u�{���\yp�n�|2L�L��K��;�}l%W��R�C1�z�nx�9:nδ'6�����]����a���;=�"�=X�H����z��}��3L���G�}�w.{b��c��ݻw���ڴw��d��>�p������??������s��O�?e���?~��Ç��'��r��w?=�b�����d���Ž��N�q�v�` ug*J�f�-��S?���I�	xe�D4~�h.t�΋�ebFK�7�Mx���i�6��MWl�?.t�/��9���y�8h��2���j��9�R�1RP*��92�E2��i:+�����\�ͅ�W���(O��    ���2�7+��3"��y���t�H��!8#ث�!C?ޛ����&�ݟ_��U=��CW"O����vt�Y7�{��nC�
��N�EC�Dt�N�������?���4�n�Ij�N�e6���ƞq8�cF��>���o�o{��#/ccX��_��wq���~����o,���Q��`���l�{����EC����W?������u�N����+�#����{w�}������c�f��@���eQ�;�8�z��G�nz@$%m1,n��g�n9���K1�kATrIM\u#e�@�)&���Z^Y��\���n�ґ�xAO��#����ӧ��|�����������i�����o�Ϩ�ʧ�!��i�;���Ƙ9&|��J���+��$��%u8��p�);��N�o2׮�Uqˠ_�������L���Od�h=�E��1����k �i���c8:��>��|f����+����::���N�B6�釫a�B����j]��ِh���ǯ�.hG��֏N�N���K��	KP^�d2�ʵ�������HTw�^B�3��a:����!X����PK����u������2���GmRH�'�>yt~��Y9��s'�T}HI�wE�%�$F j��"�rM$EkH*)�(8�d�LP~�6�Ǌ�����]���FaE�8"��Px��L�>����l.dt���b[_�8��).�����Č����e�Oq�\�[�^�ut֣Sܳ�M*s��,9_��v�ӂո[0�g�Bx���r,���HM���g^[�L�r2���X3�]�*
	������|���֛(A	7�O�G����y4t$�』�[::(�J�$C �֒-=Rh4�g���w&�-�hM@��� `[IdLR\~��]�pv�X��fì5�݋��c�S���x�������#��%$��ѯ�2�US!	POS���?������_~�=H��h�ŞB6�@7}��l���ߞ�
�Ѩ��(�m�W�6Y�y�L�\�-���kqoI@�I!䆇	��s�{{��7�H��Ǎ���6�����M*N�m`#b��p���o5�)=C^�Ȟ��ߩ'��ۚaL�w|)��5��0TJqئ�w����w~�B�U]���t����P*�/��bq��3�*:C�kA���F��,Òn��8�|�
�{�Ѿ���.;�\v:JDPA�'�����9i�����=?�: N_O�Vw9F�C�����BC�e D��)��m!����(iߴx 8jv*�M�i|Ͱn����ㅢ%�����g2�>��[�1�*7*�4�u����(x��_��y̝�<�{���!h*ϲɓd_�$+�ꡞ��oo��O�Wʮ$'�r9����F9���K�d��ɽY9�3�������i�h�m�'�!Bһa0D���_�4d�� �(���z/+�Y9%�Q����jr
���I4�M>�bw�zr��/?�~돾��?�� ������@���	Z'&1��ݴ9j��$�+�q�'�kwӆ�D�<\�<]��6$'�n�Fer9��)'V��X]�z	9�QOR�Pb0z%j���ި'��2��t����$;i�M\cZ��^�Q�W���H*W:"\��Ο���3�_�;RJ�f�b@h�Z�Y!ѕi o��D��^@H|]%�,I�(,�.�T��z�a�!a0*��e��A���4ȾLi��t�Fw<�]�w?��?>�s��%�N�|zS�H�[ە���4�b�nl�8?w|��A��q:ͤ�g,Ð�C:+�)E_J�bq�>�����+�Hy*1�<�@��>�%��5A �`
 �2�9t0�h�6� :��ՕxN�{9�oM̏������5b]?V��At;��?�{d!�v[�,L>w��=�8x�VsrX{0y3 ���-�N��H��m��u�ծN�^@	*�pz_RP߈��O�ޡ��Y@/r��]�WH_83	;)�'`�>�}�o��O�Z�� C���Vؿ�1��tlM��������h�O��%��ص�< ��,��@D]'8��u�H���� �s2/����;�ؿ�U��z�v;�ۏC��pJ N��؊D����bh�I�� ���#���p�D~�������h<����n4�����<��w���&h�Z��Cc�J�@��s8�����q���}��.�0(����d������}O,�2��o
socr��(=�˽)�J��b��sC�r�ا`����7Ep9ل=z#:�1t�{��K�FvɒFM����,i"�	M�fnб!����~�BI���2x�i�F�a�xJ�4��u~�)=�5H�^"�z$��X����?@\����ۃ`S\_r�g��?�v���:������c�����*Bǯ}^�����3ϗ��y����h���b�W@�kh�cd���=&��1���ҏ�L�9K:�7�Q����g6�!L�vpHXA�+�t ��W��� ��hX.��jnVYì<�U��i-=S$��YSU�PU�^�UU2� ����;evbIg4�xrz���q � @�ֆ@����8�x���Z/Ֆ(\�����jz�h)ܳ��)��z;�6���n��x��P�f�ƀC���`��[�P=�ɶl_����7_�y�����o7��H�n��p��/O7����{'��A�ye���Rr��ۉ���0ʂ��bɫ�������T�� ���#�"�Ȯ��/�WA�o8E�>���9?�	ұ�J�b\H�hQ#�K<�:Z���i
O��d��E�:�eeJ�F7�Lș��2�br�b�]1���W����䣺�O_�R�����
����S�B2L"!��r�����M��?��!��_gI�:�� 7$ �}��깝�U�S;χ���ic��US+���O܆ ���qNs/�A��A�-8����v�{�	Tx�d�tI��7v���tГB!\Rxa�����˝�+$9$^�0u�76�� �xv���.��+v��+�H���5�RJ�����&�u���&/\�����������������c�'s�r��R�L������`�^�z��g0�������}z+����.�o�;{��f�/{��I���D�=�p����ۋ'��$W��X<��Y�8GW��<��Ad<���,{z���Y�+)��S�֞I����j?j ���	Z>j��$�.�6�v ��B2�C�6�� ^�R��xu D��H`� �DN�	̃�C6��V�@��Ъ$��C��A��~"ع�o!)@e�j�� �p��u�C|��boB�DE1����k�*0,�EX�X�@��ޤ��i�\q��"7��p�[�e�kL�T ;h;��Z���+�<~�%�m�؈ꈟ�N��tB�Gw���11���k�O�ܗ<�QBp�����3���7;�h#��QR�oV
���	_(���BXK
���KR�I��wQ/�R)ĵt����z$A��e�rv����Ƚ-��w�[%g��(:O�QP8��Qt�đf��{���t`���p�uS��y�ø����F��o/c�YδuK�)�_3��/O��xn9��T����ٜ·�q�R��Ѵ'����1��#9噅���f�^�g����g��&
b�ɗh�	��K�z9u�dֈ#
GN>�ʪ�t����%��:��ɦ�B���h�Ց8����~��[��z��:{���\�����O�����5Kě�G����	6 ^#����R�:�t�tS:�fۣ���Q��#��E'��R{�� $�$J8rPa���R�&��� �y�EM^����yS�cs�����I�\4�"�� �0�n�1�\k�O
�s@4�f��eһg��b���~�ѵ=J��؆N'^��X��K�G??m%�In��?�ש����F��SE��׵?W�=���*];�W;�Z��k�y�<j�t���Z�}��/7)˿.��WLQy�]�i �   �ؾ��8��]nW�7_��R�/8ه�>	N-97������v�G������9`Ņ.����H����\���er�'�5:`XƷ�%�b����Rt_��fĘ�E���=W
��6�Ũ;2D^UZ��$����J��o��/üH�     