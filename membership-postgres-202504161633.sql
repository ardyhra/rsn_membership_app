PGDMP  
    !                }            postgres    17.2    17.2 �    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            .           1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE postgres;
                     postgres    false            /           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    5166                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            0           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4                        1259    40971    admin    TABLE     �   CREATE TABLE public.admin (
    id bigint NOT NULL,
    "namaAdmin" text NOT NULL,
    nip text NOT NULL,
    "superAdmin" boolean NOT NULL
);
    DROP TABLE public.admin;
       public         heap r       postgres    false    4            �            1259    40970    admin_id_seq    SEQUENCE     u   CREATE SEQUENCE public.admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.admin_id_seq;
       public               postgres    false    4    256            1           0    0    admin_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;
          public               postgres    false    255            �            1259    24851    akun    TABLE     �   CREATE TABLE public.akun (
    id bigint NOT NULL,
    "relatedId" bigint NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    role text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public.akun;
       public         heap r       postgres    false    4            �            1259    24850    akun_id_seq    SEQUENCE     t   CREATE SEQUENCE public.akun_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.akun_id_seq;
       public               postgres    false    4    244            2           0    0    akun_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.akun_id_seq OWNED BY public.akun.id;
          public               postgres    false    243            �            1259    24860 	   broadcast    TABLE     �   CREATE TABLE public.broadcast (
    id bigint NOT NULL,
    pesan text NOT NULL,
    tujuan bigint NOT NULL,
    "tanggalDibuat" timestamp without time zone NOT NULL
);
    DROP TABLE public.broadcast;
       public         heap r       postgres    false    4            �            1259    24859    broadcast_id_seq    SEQUENCE     y   CREATE SEQUENCE public.broadcast_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.broadcast_id_seq;
       public               postgres    false    246    4            3           0    0    broadcast_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.broadcast_id_seq OWNED BY public.broadcast.id;
          public               postgres    false    245            �            1259    32779    database_member    TABLE     �   CREATE TABLE public.database_member (
    id bigint NOT NULL,
    "buktiPembayaran" text NOT NULL,
    keterangan text NOT NULL,
    "pelangganId" bigint NOT NULL
);
 #   DROP TABLE public.database_member;
       public         heap r       postgres    false    4            �            1259    32778    database_member_id_seq    SEQUENCE        CREATE SEQUENCE public.database_member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.database_member_id_seq;
       public               postgres    false    4    254            4           0    0    database_member_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.database_member_id_seq OWNED BY public.database_member.id;
          public               postgres    false    253            �            1259    24878 	   informasi    TABLE     �   CREATE TABLE public.informasi (
    id bigint NOT NULL,
    tujuan text NOT NULL,
    "tanggalDibuat" timestamp without time zone NOT NULL,
    judul text NOT NULL,
    deskripsi text NOT NULL
);
    DROP TABLE public.informasi;
       public         heap r       postgres    false    4            �            1259    24877    informasi_id_seq    SEQUENCE     y   CREATE SEQUENCE public.informasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.informasi_id_seq;
       public               postgres    false    4    248            5           0    0    informasi_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.informasi_id_seq OWNED BY public.informasi.id;
          public               postgres    false    247            �            1259    24974    member    TABLE     b  CREATE TABLE public.member (
    id bigint NOT NULL,
    "namaPelanggan" text NOT NULL,
    "noWhatsapp" text NOT NULL,
    nik bigint NOT NULL,
    "alamatKtp" text NOT NULL,
    kelurahan text NOT NULL,
    kecamatan text NOT NULL,
    kabupaten text NOT NULL,
    provinsi text NOT NULL,
    status text NOT NULL,
    ktp text,
    "tanggalDibuat" timestamp without time zone NOT NULL,
    "_salesPelangganSalesId" bigint,
    "alamatDomisili" text,
    "kelurahanDomisili" text,
    "kecamatanDomisili" text,
    "kabupatenDomisili" text,
    "provinsiDomisili" text,
    "salesPelangganSalesId" bigint
);
    DROP TABLE public.member;
       public         heap r       postgres    false    4            �            1259    24973    member_id_seq    SEQUENCE     v   CREATE SEQUENCE public.member_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.member_id_seq;
       public               postgres    false    252    4            6           0    0    member_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.member_id_seq OWNED BY public.member.id;
          public               postgres    false    251            �            1259    24896    sales    TABLE     �   CREATE TABLE public.sales (
    id bigint NOT NULL,
    "namaSales" text NOT NULL,
    nik text NOT NULL,
    "noWhatsapp" text NOT NULL
);
    DROP TABLE public.sales;
       public         heap r       postgres    false    4            �            1259    24895    sales_id_seq    SEQUENCE     u   CREATE SEQUENCE public.sales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sales_id_seq;
       public               postgres    false    4    250            7           0    0    sales_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sales_id_seq OWNED BY public.sales.id;
          public               postgres    false    249                       1259    40992    serverpod_auth_key    TABLE     �   CREATE TABLE public.serverpod_auth_key (
    id bigint NOT NULL,
    "userId" bigint NOT NULL,
    hash text NOT NULL,
    "scopeNames" json NOT NULL,
    method text NOT NULL
);
 &   DROP TABLE public.serverpod_auth_key;
       public         heap r       postgres    false    4                       1259    40991    serverpod_auth_key_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_auth_key_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.serverpod_auth_key_id_seq;
       public               postgres    false    260    4            8           0    0    serverpod_auth_key_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.serverpod_auth_key_id_seq OWNED BY public.serverpod_auth_key.id;
          public               postgres    false    259            �            1259    24649    serverpod_cloud_storage    TABLE       CREATE TABLE public.serverpod_cloud_storage (
    id bigint NOT NULL,
    "storageId" text NOT NULL,
    path text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    expiration timestamp without time zone,
    "byteData" bytea NOT NULL,
    verified boolean NOT NULL
);
 +   DROP TABLE public.serverpod_cloud_storage;
       public         heap r       postgres    false    4            �            1259    24660 %   serverpod_cloud_storage_direct_upload    TABLE     �   CREATE TABLE public.serverpod_cloud_storage_direct_upload (
    id bigint NOT NULL,
    "storageId" text NOT NULL,
    path text NOT NULL,
    expiration timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);
 9   DROP TABLE public.serverpod_cloud_storage_direct_upload;
       public         heap r       postgres    false    4            �            1259    24659 ,   serverpod_cloud_storage_direct_upload_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_cloud_storage_direct_upload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.serverpod_cloud_storage_direct_upload_id_seq;
       public               postgres    false    220    4            9           0    0 ,   serverpod_cloud_storage_direct_upload_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.serverpod_cloud_storage_direct_upload_id_seq OWNED BY public.serverpod_cloud_storage_direct_upload.id;
          public               postgres    false    219            �            1259    24648    serverpod_cloud_storage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_cloud_storage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.serverpod_cloud_storage_id_seq;
       public               postgres    false    218    4            :           0    0    serverpod_cloud_storage_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.serverpod_cloud_storage_id_seq OWNED BY public.serverpod_cloud_storage.id;
          public               postgres    false    217                       1259    41002    serverpod_email_auth    TABLE     �   CREATE TABLE public.serverpod_email_auth (
    id bigint NOT NULL,
    "userId" bigint NOT NULL,
    email text NOT NULL,
    hash text NOT NULL
);
 (   DROP TABLE public.serverpod_email_auth;
       public         heap r       postgres    false    4                       1259    41001    serverpod_email_auth_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_email_auth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.serverpod_email_auth_id_seq;
       public               postgres    false    262    4            ;           0    0    serverpod_email_auth_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.serverpod_email_auth_id_seq OWNED BY public.serverpod_email_auth.id;
          public               postgres    false    261                       1259    41012    serverpod_email_create_request    TABLE     �   CREATE TABLE public.serverpod_email_create_request (
    id bigint NOT NULL,
    "userName" text NOT NULL,
    email text NOT NULL,
    hash text NOT NULL,
    "verificationCode" text NOT NULL
);
 2   DROP TABLE public.serverpod_email_create_request;
       public         heap r       postgres    false    4                       1259    41011 %   serverpod_email_create_request_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_email_create_request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.serverpod_email_create_request_id_seq;
       public               postgres    false    4    264            <           0    0 %   serverpod_email_create_request_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.serverpod_email_create_request_id_seq OWNED BY public.serverpod_email_create_request.id;
          public               postgres    false    263            
           1259    41022    serverpod_email_failed_sign_in    TABLE     �   CREATE TABLE public.serverpod_email_failed_sign_in (
    id bigint NOT NULL,
    email text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "ipAddress" text NOT NULL
);
 2   DROP TABLE public.serverpod_email_failed_sign_in;
       public         heap r       postgres    false    4            	           1259    41021 %   serverpod_email_failed_sign_in_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_email_failed_sign_in_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.serverpod_email_failed_sign_in_id_seq;
       public               postgres    false    266    4            =           0    0 %   serverpod_email_failed_sign_in_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.serverpod_email_failed_sign_in_id_seq OWNED BY public.serverpod_email_failed_sign_in.id;
          public               postgres    false    265                       1259    41033    serverpod_email_reset    TABLE     �   CREATE TABLE public.serverpod_email_reset (
    id bigint NOT NULL,
    "userId" bigint NOT NULL,
    "verificationCode" text NOT NULL,
    expiration timestamp without time zone NOT NULL
);
 )   DROP TABLE public.serverpod_email_reset;
       public         heap r       postgres    false    4                       1259    41032    serverpod_email_reset_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_email_reset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.serverpod_email_reset_id_seq;
       public               postgres    false    4    268            >           0    0    serverpod_email_reset_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.serverpod_email_reset_id_seq OWNED BY public.serverpod_email_reset.id;
          public               postgres    false    267            �            1259    24670    serverpod_future_call    TABLE     �   CREATE TABLE public.serverpod_future_call (
    id bigint NOT NULL,
    name text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    identifier text
);
 )   DROP TABLE public.serverpod_future_call;
       public         heap r       postgres    false    4            �            1259    24669    serverpod_future_call_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_future_call_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.serverpod_future_call_id_seq;
       public               postgres    false    4    222            ?           0    0    serverpod_future_call_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.serverpod_future_call_id_seq OWNED BY public.serverpod_future_call.id;
          public               postgres    false    221                       1259    41043    serverpod_google_refresh_token    TABLE     �   CREATE TABLE public.serverpod_google_refresh_token (
    id bigint NOT NULL,
    "userId" bigint NOT NULL,
    "refreshToken" text NOT NULL
);
 2   DROP TABLE public.serverpod_google_refresh_token;
       public         heap r       postgres    false    4                       1259    41042 %   serverpod_google_refresh_token_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_google_refresh_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.serverpod_google_refresh_token_id_seq;
       public               postgres    false    270    4            @           0    0 %   serverpod_google_refresh_token_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.serverpod_google_refresh_token_id_seq OWNED BY public.serverpod_google_refresh_token.id;
          public               postgres    false    269            �            1259    24682     serverpod_health_connection_info    TABLE       CREATE TABLE public.serverpod_health_connection_info (
    id bigint NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    active bigint NOT NULL,
    closing bigint NOT NULL,
    idle bigint NOT NULL,
    granularity bigint NOT NULL
);
 4   DROP TABLE public.serverpod_health_connection_info;
       public         heap r       postgres    false    4            �            1259    24681 '   serverpod_health_connection_info_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_health_connection_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.serverpod_health_connection_info_id_seq;
       public               postgres    false    224    4            A           0    0 '   serverpod_health_connection_info_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.serverpod_health_connection_info_id_seq OWNED BY public.serverpod_health_connection_info.id;
          public               postgres    false    223            �            1259    24692    serverpod_health_metric    TABLE       CREATE TABLE public.serverpod_health_metric (
    id bigint NOT NULL,
    name text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    value double precision NOT NULL,
    granularity bigint NOT NULL
);
 +   DROP TABLE public.serverpod_health_metric;
       public         heap r       postgres    false    4            �            1259    24691    serverpod_health_metric_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_health_metric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.serverpod_health_metric_id_seq;
       public               postgres    false    226    4            B           0    0    serverpod_health_metric_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.serverpod_health_metric_id_seq OWNED BY public.serverpod_health_metric.id;
          public               postgres    false    225            �            1259    24702    serverpod_log    TABLE     \  CREATE TABLE public.serverpod_log (
    id bigint NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    reference text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    message text NOT NULL,
    error text,
    "stackTrace" text,
    "order" bigint NOT NULL
);
 !   DROP TABLE public.serverpod_log;
       public         heap r       postgres    false    4            �            1259    24701    serverpod_log_id_seq    SEQUENCE     }   CREATE SEQUENCE public.serverpod_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.serverpod_log_id_seq;
       public               postgres    false    4    228            C           0    0    serverpod_log_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.serverpod_log_id_seq OWNED BY public.serverpod_log.id;
          public               postgres    false    227            �            1259    24712    serverpod_message_log    TABLE     m  CREATE TABLE public.serverpod_message_log (
    id bigint NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    endpoint text NOT NULL,
    "messageName" text NOT NULL,
    duration double precision NOT NULL,
    error text,
    "stackTrace" text,
    slow boolean NOT NULL,
    "order" bigint NOT NULL
);
 )   DROP TABLE public.serverpod_message_log;
       public         heap r       postgres    false    4            �            1259    24711    serverpod_message_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_message_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.serverpod_message_log_id_seq;
       public               postgres    false    230    4            D           0    0    serverpod_message_log_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.serverpod_message_log_id_seq OWNED BY public.serverpod_message_log.id;
          public               postgres    false    229            �            1259    24721    serverpod_method    TABLE     w   CREATE TABLE public.serverpod_method (
    id bigint NOT NULL,
    endpoint text NOT NULL,
    method text NOT NULL
);
 $   DROP TABLE public.serverpod_method;
       public         heap r       postgres    false    4            �            1259    24720    serverpod_method_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_method_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.serverpod_method_id_seq;
       public               postgres    false    232    4            E           0    0    serverpod_method_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.serverpod_method_id_seq OWNED BY public.serverpod_method.id;
          public               postgres    false    231            �            1259    24731    serverpod_migrations    TABLE     �   CREATE TABLE public.serverpod_migrations (
    id bigint NOT NULL,
    module text NOT NULL,
    version text NOT NULL,
    "timestamp" timestamp without time zone
);
 (   DROP TABLE public.serverpod_migrations;
       public         heap r       postgres    false    4            �            1259    24730    serverpod_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.serverpod_migrations_id_seq;
       public               postgres    false    4    234            F           0    0    serverpod_migrations_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.serverpod_migrations_id_seq OWNED BY public.serverpod_migrations.id;
          public               postgres    false    233            �            1259    24741    serverpod_query_log    TABLE     T  CREATE TABLE public.serverpod_query_log (
    id bigint NOT NULL,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    query text NOT NULL,
    duration double precision NOT NULL,
    "numRows" bigint,
    error text,
    "stackTrace" text,
    slow boolean NOT NULL,
    "order" bigint NOT NULL
);
 '   DROP TABLE public.serverpod_query_log;
       public         heap r       postgres    false    4            �            1259    24740    serverpod_query_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_query_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.serverpod_query_log_id_seq;
       public               postgres    false    4    236            G           0    0    serverpod_query_log_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.serverpod_query_log_id_seq OWNED BY public.serverpod_query_log.id;
          public               postgres    false    235            �            1259    24751    serverpod_readwrite_test    TABLE     e   CREATE TABLE public.serverpod_readwrite_test (
    id bigint NOT NULL,
    number bigint NOT NULL
);
 ,   DROP TABLE public.serverpod_readwrite_test;
       public         heap r       postgres    false    4            �            1259    24750    serverpod_readwrite_test_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_readwrite_test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.serverpod_readwrite_test_id_seq;
       public               postgres    false    4    238            H           0    0    serverpod_readwrite_test_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.serverpod_readwrite_test_id_seq OWNED BY public.serverpod_readwrite_test.id;
          public               postgres    false    237            �            1259    24758    serverpod_runtime_settings    TABLE     �   CREATE TABLE public.serverpod_runtime_settings (
    id bigint NOT NULL,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);
 .   DROP TABLE public.serverpod_runtime_settings;
       public         heap r       postgres    false    4            �            1259    24757 !   serverpod_runtime_settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_runtime_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.serverpod_runtime_settings_id_seq;
       public               postgres    false    4    240            I           0    0 !   serverpod_runtime_settings_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.serverpod_runtime_settings_id_seq OWNED BY public.serverpod_runtime_settings.id;
          public               postgres    false    239            �            1259    24767    serverpod_session_log    TABLE     �  CREATE TABLE public.serverpod_session_log (
    id bigint NOT NULL,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    module text,
    endpoint text,
    method text,
    duration double precision,
    "numQueries" bigint,
    slow boolean,
    error text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "isOpen" boolean,
    touched timestamp without time zone NOT NULL
);
 )   DROP TABLE public.serverpod_session_log;
       public         heap r       postgres    false    4            �            1259    24766    serverpod_session_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_session_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.serverpod_session_log_id_seq;
       public               postgres    false    242    4            J           0    0    serverpod_session_log_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.serverpod_session_log_id_seq OWNED BY public.serverpod_session_log.id;
          public               postgres    false    241                       1259    41053    serverpod_user_image    TABLE     �   CREATE TABLE public.serverpod_user_image (
    id bigint NOT NULL,
    "userId" bigint NOT NULL,
    version bigint NOT NULL,
    url text NOT NULL
);
 (   DROP TABLE public.serverpod_user_image;
       public         heap r       postgres    false    4                       1259    41052    serverpod_user_image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_user_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.serverpod_user_image_id_seq;
       public               postgres    false    4    272            K           0    0    serverpod_user_image_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.serverpod_user_image_id_seq OWNED BY public.serverpod_user_image.id;
          public               postgres    false    271                       1259    41063    serverpod_user_info    TABLE     '  CREATE TABLE public.serverpod_user_info (
    id bigint NOT NULL,
    "userIdentifier" text NOT NULL,
    "userName" text,
    "fullName" text,
    email text,
    created timestamp without time zone NOT NULL,
    "imageUrl" text,
    "scopeNames" json NOT NULL,
    blocked boolean NOT NULL
);
 '   DROP TABLE public.serverpod_user_info;
       public         heap r       postgres    false    4                       1259    41062    serverpod_user_info_id_seq    SEQUENCE     �   CREATE SEQUENCE public.serverpod_user_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.serverpod_user_info_id_seq;
       public               postgres    false    4    274            L           0    0    serverpod_user_info_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.serverpod_user_info_id_seq OWNED BY public.serverpod_user_info.id;
          public               postgres    false    273                       1259    40980    session_token    TABLE     �   CREATE TABLE public.session_token (
    id bigint NOT NULL,
    "tokenHash" text NOT NULL,
    "userId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL
);
 !   DROP TABLE public.session_token;
       public         heap r       postgres    false    4                       1259    40979    session_token_id_seq    SEQUENCE     }   CREATE SEQUENCE public.session_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.session_token_id_seq;
       public               postgres    false    4    258            M           0    0    session_token_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.session_token_id_seq OWNED BY public.session_token.id;
          public               postgres    false    257            �           2604    40974    admin id    DEFAULT     d   ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);
 7   ALTER TABLE public.admin ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    255    256    256            �           2604    24854    akun id    DEFAULT     b   ALTER TABLE ONLY public.akun ALTER COLUMN id SET DEFAULT nextval('public.akun_id_seq'::regclass);
 6   ALTER TABLE public.akun ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    244    243    244            �           2604    24863    broadcast id    DEFAULT     l   ALTER TABLE ONLY public.broadcast ALTER COLUMN id SET DEFAULT nextval('public.broadcast_id_seq'::regclass);
 ;   ALTER TABLE public.broadcast ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    246    245    246            �           2604    32782    database_member id    DEFAULT     x   ALTER TABLE ONLY public.database_member ALTER COLUMN id SET DEFAULT nextval('public.database_member_id_seq'::regclass);
 A   ALTER TABLE public.database_member ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    254    253    254            �           2604    24881    informasi id    DEFAULT     l   ALTER TABLE ONLY public.informasi ALTER COLUMN id SET DEFAULT nextval('public.informasi_id_seq'::regclass);
 ;   ALTER TABLE public.informasi ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    247    248    248            �           2604    24977 	   member id    DEFAULT     f   ALTER TABLE ONLY public.member ALTER COLUMN id SET DEFAULT nextval('public.member_id_seq'::regclass);
 8   ALTER TABLE public.member ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    252    251    252            �           2604    24899    sales id    DEFAULT     d   ALTER TABLE ONLY public.sales ALTER COLUMN id SET DEFAULT nextval('public.sales_id_seq'::regclass);
 7   ALTER TABLE public.sales ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    250    249    250            �           2604    40995    serverpod_auth_key id    DEFAULT     ~   ALTER TABLE ONLY public.serverpod_auth_key ALTER COLUMN id SET DEFAULT nextval('public.serverpod_auth_key_id_seq'::regclass);
 D   ALTER TABLE public.serverpod_auth_key ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    259    260    260            �           2604    24652    serverpod_cloud_storage id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_cloud_storage ALTER COLUMN id SET DEFAULT nextval('public.serverpod_cloud_storage_id_seq'::regclass);
 I   ALTER TABLE public.serverpod_cloud_storage ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    24663 (   serverpod_cloud_storage_direct_upload id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_cloud_storage_direct_upload ALTER COLUMN id SET DEFAULT nextval('public.serverpod_cloud_storage_direct_upload_id_seq'::regclass);
 W   ALTER TABLE public.serverpod_cloud_storage_direct_upload ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    41005    serverpod_email_auth id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_email_auth ALTER COLUMN id SET DEFAULT nextval('public.serverpod_email_auth_id_seq'::regclass);
 F   ALTER TABLE public.serverpod_email_auth ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    261    262    262            �           2604    41015 !   serverpod_email_create_request id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_email_create_request ALTER COLUMN id SET DEFAULT nextval('public.serverpod_email_create_request_id_seq'::regclass);
 P   ALTER TABLE public.serverpod_email_create_request ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    263    264    264            �           2604    41025 !   serverpod_email_failed_sign_in id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_email_failed_sign_in ALTER COLUMN id SET DEFAULT nextval('public.serverpod_email_failed_sign_in_id_seq'::regclass);
 P   ALTER TABLE public.serverpod_email_failed_sign_in ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    265    266    266            �           2604    41036    serverpod_email_reset id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_email_reset ALTER COLUMN id SET DEFAULT nextval('public.serverpod_email_reset_id_seq'::regclass);
 G   ALTER TABLE public.serverpod_email_reset ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    267    268    268            �           2604    24673    serverpod_future_call id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_future_call ALTER COLUMN id SET DEFAULT nextval('public.serverpod_future_call_id_seq'::regclass);
 G   ALTER TABLE public.serverpod_future_call ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    41046 !   serverpod_google_refresh_token id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_google_refresh_token ALTER COLUMN id SET DEFAULT nextval('public.serverpod_google_refresh_token_id_seq'::regclass);
 P   ALTER TABLE public.serverpod_google_refresh_token ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    270    269    270            �           2604    24685 #   serverpod_health_connection_info id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_health_connection_info ALTER COLUMN id SET DEFAULT nextval('public.serverpod_health_connection_info_id_seq'::regclass);
 R   ALTER TABLE public.serverpod_health_connection_info ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    224    224            �           2604    24695    serverpod_health_metric id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_health_metric ALTER COLUMN id SET DEFAULT nextval('public.serverpod_health_metric_id_seq'::regclass);
 I   ALTER TABLE public.serverpod_health_metric ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    226    226            �           2604    24705    serverpod_log id    DEFAULT     t   ALTER TABLE ONLY public.serverpod_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_log_id_seq'::regclass);
 ?   ALTER TABLE public.serverpod_log ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    227    228            �           2604    24715    serverpod_message_log id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_message_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_message_log_id_seq'::regclass);
 G   ALTER TABLE public.serverpod_message_log ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    230    230            �           2604    24724    serverpod_method id    DEFAULT     z   ALTER TABLE ONLY public.serverpod_method ALTER COLUMN id SET DEFAULT nextval('public.serverpod_method_id_seq'::regclass);
 B   ALTER TABLE public.serverpod_method ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    232    231    232            �           2604    24734    serverpod_migrations id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_migrations ALTER COLUMN id SET DEFAULT nextval('public.serverpod_migrations_id_seq'::regclass);
 F   ALTER TABLE public.serverpod_migrations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    233    234    234            �           2604    24744    serverpod_query_log id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_query_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_query_log_id_seq'::regclass);
 E   ALTER TABLE public.serverpod_query_log ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    235    236    236            �           2604    24754    serverpod_readwrite_test id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_readwrite_test ALTER COLUMN id SET DEFAULT nextval('public.serverpod_readwrite_test_id_seq'::regclass);
 J   ALTER TABLE public.serverpod_readwrite_test ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    237    238    238            �           2604    24761    serverpod_runtime_settings id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_runtime_settings ALTER COLUMN id SET DEFAULT nextval('public.serverpod_runtime_settings_id_seq'::regclass);
 L   ALTER TABLE public.serverpod_runtime_settings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    240    239    240            �           2604    24770    serverpod_session_log id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_session_log ALTER COLUMN id SET DEFAULT nextval('public.serverpod_session_log_id_seq'::regclass);
 G   ALTER TABLE public.serverpod_session_log ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    241    242    242            �           2604    41056    serverpod_user_image id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_user_image ALTER COLUMN id SET DEFAULT nextval('public.serverpod_user_image_id_seq'::regclass);
 F   ALTER TABLE public.serverpod_user_image ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    272    271    272            �           2604    41066    serverpod_user_info id    DEFAULT     �   ALTER TABLE ONLY public.serverpod_user_info ALTER COLUMN id SET DEFAULT nextval('public.serverpod_user_info_id_seq'::regclass);
 E   ALTER TABLE public.serverpod_user_info ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    274    273    274            �           2604    40983    session_token id    DEFAULT     t   ALTER TABLE ONLY public.session_token ALTER COLUMN id SET DEFAULT nextval('public.session_token_id_seq'::regclass);
 ?   ALTER TABLE public.session_token ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    257    258    258                      0    40971    admin 
   TABLE DATA           C   COPY public.admin (id, "namaAdmin", nip, "superAdmin") FROM stdin;
    public               postgres    false    256   �8      
          0    24851    akun 
   TABLE DATA           P   COPY public.akun (id, "relatedId", username, email, role, password) FROM stdin;
    public               postgres    false    244   �8                0    24860 	   broadcast 
   TABLE DATA           G   COPY public.broadcast (id, pesan, tujuan, "tanggalDibuat") FROM stdin;
    public               postgres    false    246   �9                0    32779    database_member 
   TABLE DATA           [   COPY public.database_member (id, "buktiPembayaran", keterangan, "pelangganId") FROM stdin;
    public               postgres    false    254   :                0    24878 	   informasi 
   TABLE DATA           R   COPY public.informasi (id, tujuan, "tanggalDibuat", judul, deskripsi) FROM stdin;
    public               postgres    false    248   �:                0    24974    member 
   TABLE DATA           6  COPY public.member (id, "namaPelanggan", "noWhatsapp", nik, "alamatKtp", kelurahan, kecamatan, kabupaten, provinsi, status, ktp, "tanggalDibuat", "_salesPelangganSalesId", "alamatDomisili", "kelurahanDomisili", "kecamatanDomisili", "kabupatenDomisili", "provinsiDomisili", "salesPelangganSalesId") FROM stdin;
    public               postgres    false    252   W;                0    24896    sales 
   TABLE DATA           C   COPY public.sales (id, "namaSales", nik, "noWhatsapp") FROM stdin;
    public               postgres    false    250   @@                0    40992    serverpod_auth_key 
   TABLE DATA           V   COPY public.serverpod_auth_key (id, "userId", hash, "scopeNames", method) FROM stdin;
    public               postgres    false    260   �@      �          0    24649    serverpod_cloud_storage 
   TABLE DATA           w   COPY public.serverpod_cloud_storage (id, "storageId", path, "addedTime", expiration, "byteData", verified) FROM stdin;
    public               postgres    false    218   A      �          0    24660 %   serverpod_cloud_storage_direct_upload 
   TABLE DATA           m   COPY public.serverpod_cloud_storage_direct_upload (id, "storageId", path, expiration, "authKey") FROM stdin;
    public               postgres    false    220   "A                0    41002    serverpod_email_auth 
   TABLE DATA           I   COPY public.serverpod_email_auth (id, "userId", email, hash) FROM stdin;
    public               postgres    false    262   ?A                0    41012    serverpod_email_create_request 
   TABLE DATA           i   COPY public.serverpod_email_create_request (id, "userName", email, hash, "verificationCode") FROM stdin;
    public               postgres    false    264   \A                 0    41022    serverpod_email_failed_sign_in 
   TABLE DATA           X   COPY public.serverpod_email_failed_sign_in (id, email, "time", "ipAddress") FROM stdin;
    public               postgres    false    266   yA      "          0    41033    serverpod_email_reset 
   TABLE DATA           ]   COPY public.serverpod_email_reset (id, "userId", "verificationCode", expiration) FROM stdin;
    public               postgres    false    268   �A      �          0    24670    serverpod_future_call 
   TABLE DATA           m   COPY public.serverpod_future_call (id, name, "time", "serializedObject", "serverId", identifier) FROM stdin;
    public               postgres    false    222   �A      $          0    41043    serverpod_google_refresh_token 
   TABLE DATA           V   COPY public.serverpod_google_refresh_token (id, "userId", "refreshToken") FROM stdin;
    public               postgres    false    270   �A      �          0    24682     serverpod_health_connection_info 
   TABLE DATA           {   COPY public.serverpod_health_connection_info (id, "serverId", "timestamp", active, closing, idle, granularity) FROM stdin;
    public               postgres    false    224   �A      �          0    24692    serverpod_health_metric 
   TABLE DATA           u   COPY public.serverpod_health_metric (id, name, "serverId", "timestamp", "isHealthy", value, granularity) FROM stdin;
    public               postgres    false    226   �J      �          0    24702    serverpod_log 
   TABLE DATA           �   COPY public.serverpod_log (id, "sessionLogId", "messageId", reference, "serverId", "time", "logLevel", message, error, "stackTrace", "order") FROM stdin;
    public               postgres    false    228   �X      �          0    24712    serverpod_message_log 
   TABLE DATA           �   COPY public.serverpod_message_log (id, "sessionLogId", "serverId", "messageId", endpoint, "messageName", duration, error, "stackTrace", slow, "order") FROM stdin;
    public               postgres    false    230   v      �          0    24721    serverpod_method 
   TABLE DATA           @   COPY public.serverpod_method (id, endpoint, method) FROM stdin;
    public               postgres    false    232   (v                 0    24731    serverpod_migrations 
   TABLE DATA           P   COPY public.serverpod_migrations (id, module, version, "timestamp") FROM stdin;
    public               postgres    false    234   Ev                0    24741    serverpod_query_log 
   TABLE DATA           �   COPY public.serverpod_query_log (id, "serverId", "sessionLogId", "messageId", query, duration, "numRows", error, "stackTrace", slow, "order") FROM stdin;
    public               postgres    false    236   �v                0    24751    serverpod_readwrite_test 
   TABLE DATA           >   COPY public.serverpod_readwrite_test (id, number) FROM stdin;
    public               postgres    false    238   �{                0    24758    serverpod_runtime_settings 
   TABLE DATA           �   COPY public.serverpod_runtime_settings (id, "logSettings", "logSettingsOverrides", "logServiceCalls", "logMalformedCalls") FROM stdin;
    public               postgres    false    240   ��                0    24767    serverpod_session_log 
   TABLE DATA           �   COPY public.serverpod_session_log (id, "serverId", "time", module, endpoint, method, duration, "numQueries", slow, error, "stackTrace", "authenticatedUserId", "isOpen", touched) FROM stdin;
    public               postgres    false    242   ��      &          0    41053    serverpod_user_image 
   TABLE DATA           J   COPY public.serverpod_user_image (id, "userId", version, url) FROM stdin;
    public               postgres    false    272   �      (          0    41063    serverpod_user_info 
   TABLE DATA           �   COPY public.serverpod_user_info (id, "userIdentifier", "userName", "fullName", email, created, "imageUrl", "scopeNames", blocked) FROM stdin;
    public               postgres    false    274   �                0    40980    session_token 
   TABLE DATA           \   COPY public.session_token (id, "tokenHash", "userId", "createdAt", "expiresAt") FROM stdin;
    public               postgres    false    258   �      N           0    0    admin_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.admin_id_seq', 1, false);
          public               postgres    false    255            O           0    0    akun_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.akun_id_seq', 3, true);
          public               postgres    false    243            P           0    0    broadcast_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.broadcast_id_seq', 1, false);
          public               postgres    false    245            Q           0    0    database_member_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.database_member_id_seq', 4, true);
          public               postgres    false    253            R           0    0    informasi_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.informasi_id_seq', 16, true);
          public               postgres    false    247            S           0    0    member_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.member_id_seq', 28, true);
          public               postgres    false    251            T           0    0    sales_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.sales_id_seq', 11, true);
          public               postgres    false    249            U           0    0    serverpod_auth_key_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.serverpod_auth_key_id_seq', 1, false);
          public               postgres    false    259            V           0    0 ,   serverpod_cloud_storage_direct_upload_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.serverpod_cloud_storage_direct_upload_id_seq', 1, false);
          public               postgres    false    219            W           0    0    serverpod_cloud_storage_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.serverpod_cloud_storage_id_seq', 1, false);
          public               postgres    false    217            X           0    0    serverpod_email_auth_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.serverpod_email_auth_id_seq', 1, false);
          public               postgres    false    261            Y           0    0 %   serverpod_email_create_request_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.serverpod_email_create_request_id_seq', 1, false);
          public               postgres    false    263            Z           0    0 %   serverpod_email_failed_sign_in_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.serverpod_email_failed_sign_in_id_seq', 1, false);
          public               postgres    false    265            [           0    0    serverpod_email_reset_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.serverpod_email_reset_id_seq', 1, false);
          public               postgres    false    267            \           0    0    serverpod_future_call_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.serverpod_future_call_id_seq', 1, false);
          public               postgres    false    221            ]           0    0 %   serverpod_google_refresh_token_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.serverpod_google_refresh_token_id_seq', 1, false);
          public               postgres    false    269            ^           0    0 '   serverpod_health_connection_info_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.serverpod_health_connection_info_id_seq', 5259, true);
          public               postgres    false    223            _           0    0    serverpod_health_metric_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.serverpod_health_metric_id_seq', 5265, true);
          public               postgres    false    225            `           0    0    serverpod_log_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.serverpod_log_id_seq', 458, true);
          public               postgres    false    227            a           0    0    serverpod_message_log_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.serverpod_message_log_id_seq', 1, false);
          public               postgres    false    229            b           0    0    serverpod_method_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.serverpod_method_id_seq', 1, false);
          public               postgres    false    231            c           0    0    serverpod_migrations_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.serverpod_migrations_id_seq', 25, true);
          public               postgres    false    233            d           0    0    serverpod_query_log_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.serverpod_query_log_id_seq', 9, true);
          public               postgres    false    235            e           0    0    serverpod_readwrite_test_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.serverpod_readwrite_test_id_seq', 5136, true);
          public               postgres    false    237            f           0    0 !   serverpod_runtime_settings_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.serverpod_runtime_settings_id_seq', 1, true);
          public               postgres    false    239            g           0    0    serverpod_session_log_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.serverpod_session_log_id_seq', 423, true);
          public               postgres    false    241            h           0    0    serverpod_user_image_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.serverpod_user_image_id_seq', 1, false);
          public               postgres    false    271            i           0    0    serverpod_user_info_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.serverpod_user_info_id_seq', 1, false);
          public               postgres    false    273            j           0    0    session_token_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.session_token_id_seq', 6, true);
          public               postgres    false    257            8           2606    40978    admin admin_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public                 postgres    false    256            *           2606    24858    akun akun_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.akun
    ADD CONSTRAINT akun_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.akun DROP CONSTRAINT akun_pkey;
       public                 postgres    false    244            ,           2606    24867    broadcast broadcast_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.broadcast
    ADD CONSTRAINT broadcast_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.broadcast DROP CONSTRAINT broadcast_pkey;
       public                 postgres    false    246            6           2606    32786 $   database_member database_member_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.database_member
    ADD CONSTRAINT database_member_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.database_member DROP CONSTRAINT database_member_pkey;
       public                 postgres    false    254            .           2606    24885    informasi informasi_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.informasi
    ADD CONSTRAINT informasi_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.informasi DROP CONSTRAINT informasi_pkey;
       public                 postgres    false    248            3           2606    24981    member member_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.member DROP CONSTRAINT member_pkey;
       public                 postgres    false    252            1           2606    24903    sales sales_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public                 postgres    false    250            ?           2606    40999 *   serverpod_auth_key serverpod_auth_key_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.serverpod_auth_key
    ADD CONSTRAINT serverpod_auth_key_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.serverpod_auth_key DROP CONSTRAINT serverpod_auth_key_pkey;
       public                 postgres    false    260                       2606    24667 P   serverpod_cloud_storage_direct_upload serverpod_cloud_storage_direct_upload_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.serverpod_cloud_storage_direct_upload
    ADD CONSTRAINT serverpod_cloud_storage_direct_upload_pkey PRIMARY KEY (id);
 z   ALTER TABLE ONLY public.serverpod_cloud_storage_direct_upload DROP CONSTRAINT serverpod_cloud_storage_direct_upload_pkey;
       public                 postgres    false    220                       2606    24656 4   serverpod_cloud_storage serverpod_cloud_storage_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.serverpod_cloud_storage
    ADD CONSTRAINT serverpod_cloud_storage_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.serverpod_cloud_storage DROP CONSTRAINT serverpod_cloud_storage_pkey;
       public                 postgres    false    218            C           2606    41009 .   serverpod_email_auth serverpod_email_auth_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.serverpod_email_auth
    ADD CONSTRAINT serverpod_email_auth_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.serverpod_email_auth DROP CONSTRAINT serverpod_email_auth_pkey;
       public                 postgres    false    262            F           2606    41019 B   serverpod_email_create_request serverpod_email_create_request_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.serverpod_email_create_request
    ADD CONSTRAINT serverpod_email_create_request_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.serverpod_email_create_request DROP CONSTRAINT serverpod_email_create_request_pkey;
       public                 postgres    false    264            I           2606    41029 B   serverpod_email_failed_sign_in serverpod_email_failed_sign_in_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.serverpod_email_failed_sign_in
    ADD CONSTRAINT serverpod_email_failed_sign_in_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.serverpod_email_failed_sign_in DROP CONSTRAINT serverpod_email_failed_sign_in_pkey;
       public                 postgres    false    266            L           2606    41040 0   serverpod_email_reset serverpod_email_reset_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.serverpod_email_reset
    ADD CONSTRAINT serverpod_email_reset_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.serverpod_email_reset DROP CONSTRAINT serverpod_email_reset_pkey;
       public                 postgres    false    268            	           2606    24677 0   serverpod_future_call serverpod_future_call_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.serverpod_future_call
    ADD CONSTRAINT serverpod_future_call_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.serverpod_future_call DROP CONSTRAINT serverpod_future_call_pkey;
       public                 postgres    false    222            O           2606    41050 B   serverpod_google_refresh_token serverpod_google_refresh_token_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.serverpod_google_refresh_token
    ADD CONSTRAINT serverpod_google_refresh_token_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.serverpod_google_refresh_token DROP CONSTRAINT serverpod_google_refresh_token_pkey;
       public                 postgres    false    270                       2606    24689 F   serverpod_health_connection_info serverpod_health_connection_info_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.serverpod_health_connection_info
    ADD CONSTRAINT serverpod_health_connection_info_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.serverpod_health_connection_info DROP CONSTRAINT serverpod_health_connection_info_pkey;
       public                 postgres    false    224                       2606    24699 4   serverpod_health_metric serverpod_health_metric_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.serverpod_health_metric
    ADD CONSTRAINT serverpod_health_metric_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.serverpod_health_metric DROP CONSTRAINT serverpod_health_metric_pkey;
       public                 postgres    false    226                       2606    24709     serverpod_log serverpod_log_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.serverpod_log
    ADD CONSTRAINT serverpod_log_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.serverpod_log DROP CONSTRAINT serverpod_log_pkey;
       public                 postgres    false    228                       2606    24719 0   serverpod_message_log serverpod_message_log_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.serverpod_message_log
    ADD CONSTRAINT serverpod_message_log_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.serverpod_message_log DROP CONSTRAINT serverpod_message_log_pkey;
       public                 postgres    false    230                       2606    24728 &   serverpod_method serverpod_method_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.serverpod_method
    ADD CONSTRAINT serverpod_method_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.serverpod_method DROP CONSTRAINT serverpod_method_pkey;
       public                 postgres    false    232                       2606    24738 .   serverpod_migrations serverpod_migrations_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.serverpod_migrations
    ADD CONSTRAINT serverpod_migrations_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.serverpod_migrations DROP CONSTRAINT serverpod_migrations_pkey;
       public                 postgres    false    234                       2606    24748 ,   serverpod_query_log serverpod_query_log_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.serverpod_query_log
    ADD CONSTRAINT serverpod_query_log_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.serverpod_query_log DROP CONSTRAINT serverpod_query_log_pkey;
       public                 postgres    false    236            !           2606    24756 6   serverpod_readwrite_test serverpod_readwrite_test_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.serverpod_readwrite_test
    ADD CONSTRAINT serverpod_readwrite_test_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.serverpod_readwrite_test DROP CONSTRAINT serverpod_readwrite_test_pkey;
       public                 postgres    false    238            #           2606    24765 :   serverpod_runtime_settings serverpod_runtime_settings_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.serverpod_runtime_settings
    ADD CONSTRAINT serverpod_runtime_settings_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.serverpod_runtime_settings DROP CONSTRAINT serverpod_runtime_settings_pkey;
       public                 postgres    false    240            &           2606    24774 0   serverpod_session_log serverpod_session_log_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.serverpod_session_log
    ADD CONSTRAINT serverpod_session_log_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.serverpod_session_log DROP CONSTRAINT serverpod_session_log_pkey;
       public                 postgres    false    242            R           2606    41060 .   serverpod_user_image serverpod_user_image_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.serverpod_user_image
    ADD CONSTRAINT serverpod_user_image_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.serverpod_user_image DROP CONSTRAINT serverpod_user_image_pkey;
       public                 postgres    false    272            V           2606    41070 ,   serverpod_user_info serverpod_user_info_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.serverpod_user_info
    ADD CONSTRAINT serverpod_user_info_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.serverpod_user_info DROP CONSTRAINT serverpod_user_info_pkey;
       public                 postgres    false    274            ;           2606    40987     session_token session_token_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.session_token
    ADD CONSTRAINT session_token_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.session_token DROP CONSTRAINT session_token_pkey;
       public                 postgres    false    258            4           1259    24982    nik_pelanggan_idx    INDEX     J   CREATE UNIQUE INDEX nik_pelanggan_idx ON public.member USING btree (nik);
 %   DROP INDEX public.nik_pelanggan_idx;
       public                 postgres    false    252            /           1259    24923    nik_sales_idx    INDEX     E   CREATE UNIQUE INDEX nik_sales_idx ON public.sales USING btree (nik);
 !   DROP INDEX public.nik_sales_idx;
       public                 postgres    false    250            @           1259    41000    serverpod_auth_key_userId_idx    INDEX     b   CREATE INDEX "serverpod_auth_key_userId_idx" ON public.serverpod_auth_key USING btree ("userId");
 3   DROP INDEX public."serverpod_auth_key_userId_idx";
       public                 postgres    false    260                       1259    24668 2   serverpod_cloud_storage_direct_upload_storage_path    INDEX     �   CREATE UNIQUE INDEX serverpod_cloud_storage_direct_upload_storage_path ON public.serverpod_cloud_storage_direct_upload USING btree ("storageId", path);
 F   DROP INDEX public.serverpod_cloud_storage_direct_upload_storage_path;
       public                 postgres    false    220    220                        1259    24658 "   serverpod_cloud_storage_expiration    INDEX     l   CREATE INDEX serverpod_cloud_storage_expiration ON public.serverpod_cloud_storage USING btree (expiration);
 6   DROP INDEX public.serverpod_cloud_storage_expiration;
       public                 postgres    false    218                       1259    24657     serverpod_cloud_storage_path_idx    INDEX     x   CREATE UNIQUE INDEX serverpod_cloud_storage_path_idx ON public.serverpod_cloud_storage USING btree ("storageId", path);
 4   DROP INDEX public.serverpod_cloud_storage_path_idx;
       public                 postgres    false    218    218            D           1259    41020 /   serverpod_email_auth_create_account_request_idx    INDEX     �   CREATE UNIQUE INDEX serverpod_email_auth_create_account_request_idx ON public.serverpod_email_create_request USING btree (email);
 C   DROP INDEX public.serverpod_email_auth_create_account_request_idx;
       public                 postgres    false    264            A           1259    41010    serverpod_email_auth_email    INDEX     c   CREATE UNIQUE INDEX serverpod_email_auth_email ON public.serverpod_email_auth USING btree (email);
 .   DROP INDEX public.serverpod_email_auth_email;
       public                 postgres    false    262            G           1259    41030 (   serverpod_email_failed_sign_in_email_idx    INDEX     t   CREATE INDEX serverpod_email_failed_sign_in_email_idx ON public.serverpod_email_failed_sign_in USING btree (email);
 <   DROP INDEX public.serverpod_email_failed_sign_in_email_idx;
       public                 postgres    false    266            J           1259    41031 '   serverpod_email_failed_sign_in_time_idx    INDEX     t   CREATE INDEX serverpod_email_failed_sign_in_time_idx ON public.serverpod_email_failed_sign_in USING btree ("time");
 ;   DROP INDEX public.serverpod_email_failed_sign_in_time_idx;
       public                 postgres    false    266            M           1259    41041 &   serverpod_email_reset_verification_idx    INDEX     }   CREATE UNIQUE INDEX serverpod_email_reset_verification_idx ON public.serverpod_email_reset USING btree ("verificationCode");
 :   DROP INDEX public.serverpod_email_reset_verification_idx;
       public                 postgres    false    268                       1259    24680 $   serverpod_future_call_identifier_idx    INDEX     l   CREATE INDEX serverpod_future_call_identifier_idx ON public.serverpod_future_call USING btree (identifier);
 8   DROP INDEX public.serverpod_future_call_identifier_idx;
       public                 postgres    false    222            
           1259    24679 "   serverpod_future_call_serverId_idx    INDEX     l   CREATE INDEX "serverpod_future_call_serverId_idx" ON public.serverpod_future_call USING btree ("serverId");
 8   DROP INDEX public."serverpod_future_call_serverId_idx";
       public                 postgres    false    222                       1259    24678    serverpod_future_call_time_idx    INDEX     b   CREATE INDEX serverpod_future_call_time_idx ON public.serverpod_future_call USING btree ("time");
 2   DROP INDEX public.serverpod_future_call_time_idx;
       public                 postgres    false    222            P           1259    41051 )   serverpod_google_refresh_token_userId_idx    INDEX     �   CREATE UNIQUE INDEX "serverpod_google_refresh_token_userId_idx" ON public.serverpod_google_refresh_token USING btree ("userId");
 ?   DROP INDEX public."serverpod_google_refresh_token_userId_idx";
       public                 postgres    false    270                       1259    24690 .   serverpod_health_connection_info_timestamp_idx    INDEX     �   CREATE UNIQUE INDEX serverpod_health_connection_info_timestamp_idx ON public.serverpod_health_connection_info USING btree ("timestamp", "serverId", granularity);
 B   DROP INDEX public.serverpod_health_connection_info_timestamp_idx;
       public                 postgres    false    224    224    224                       1259    24700 %   serverpod_health_metric_timestamp_idx    INDEX     �   CREATE UNIQUE INDEX serverpod_health_metric_timestamp_idx ON public.serverpod_health_metric USING btree ("timestamp", "serverId", name, granularity);
 9   DROP INDEX public.serverpod_health_metric_timestamp_idx;
       public                 postgres    false    226    226    226    226                       1259    24710    serverpod_log_sessionLogId_idx    INDEX     d   CREATE INDEX "serverpod_log_sessionLogId_idx" ON public.serverpod_log USING btree ("sessionLogId");
 4   DROP INDEX public."serverpod_log_sessionLogId_idx";
       public                 postgres    false    228                       1259    24729 $   serverpod_method_endpoint_method_idx    INDEX     t   CREATE UNIQUE INDEX serverpod_method_endpoint_method_idx ON public.serverpod_method USING btree (endpoint, method);
 8   DROP INDEX public.serverpod_method_endpoint_method_idx;
       public                 postgres    false    232    232                       1259    24739    serverpod_migrations_ids    INDEX     b   CREATE UNIQUE INDEX serverpod_migrations_ids ON public.serverpod_migrations USING btree (module);
 ,   DROP INDEX public.serverpod_migrations_ids;
       public                 postgres    false    234                       1259    24749 $   serverpod_query_log_sessionLogId_idx    INDEX     p   CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON public.serverpod_query_log USING btree ("sessionLogId");
 :   DROP INDEX public."serverpod_query_log_sessionLogId_idx";
       public                 postgres    false    236            $           1259    24777     serverpod_session_log_isopen_idx    INDEX     f   CREATE INDEX serverpod_session_log_isopen_idx ON public.serverpod_session_log USING btree ("isOpen");
 4   DROP INDEX public.serverpod_session_log_isopen_idx;
       public                 postgres    false    242            '           1259    24775 "   serverpod_session_log_serverid_idx    INDEX     j   CREATE INDEX serverpod_session_log_serverid_idx ON public.serverpod_session_log USING btree ("serverId");
 6   DROP INDEX public.serverpod_session_log_serverid_idx;
       public                 postgres    false    242            (           1259    24776 !   serverpod_session_log_touched_idx    INDEX     f   CREATE INDEX serverpod_session_log_touched_idx ON public.serverpod_session_log USING btree (touched);
 5   DROP INDEX public.serverpod_session_log_touched_idx;
       public                 postgres    false    242            S           1259    41061    serverpod_user_image_user_id    INDEX     j   CREATE INDEX serverpod_user_image_user_id ON public.serverpod_user_image USING btree ("userId", version);
 0   DROP INDEX public.serverpod_user_image_user_id;
       public                 postgres    false    272    272            T           1259    41072    serverpod_user_info_email    INDEX     Z   CREATE INDEX serverpod_user_info_email ON public.serverpod_user_info USING btree (email);
 -   DROP INDEX public.serverpod_user_info_email;
       public                 postgres    false    274            W           1259    41071 #   serverpod_user_info_user_identifier    INDEX     v   CREATE UNIQUE INDEX serverpod_user_info_user_identifier ON public.serverpod_user_info USING btree ("userIdentifier");
 7   DROP INDEX public.serverpod_user_info_user_identifier;
       public                 postgres    false    274            9           1259    40990    session_token_expires_at_idx    INDEX     ]   CREATE INDEX session_token_expires_at_idx ON public.session_token USING btree ("expiresAt");
 0   DROP INDEX public.session_token_expires_at_idx;
       public                 postgres    false    258            <           1259    40988    session_token_token_hash_idx    INDEX     d   CREATE UNIQUE INDEX session_token_token_hash_idx ON public.session_token USING btree ("tokenHash");
 0   DROP INDEX public.session_token_token_hash_idx;
       public                 postgres    false    258            =           1259    40989    session_token_user_id_idx    INDEX     W   CREATE INDEX session_token_user_id_idx ON public.session_token USING btree ("userId");
 -   DROP INDEX public.session_token_user_id_idx;
       public                 postgres    false    258            ]           2606    32787 $   database_member database_member_fk_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.database_member
    ADD CONSTRAINT database_member_fk_0 FOREIGN KEY ("pelangganId") REFERENCES public.member(id);
 N   ALTER TABLE ONLY public.database_member DROP CONSTRAINT database_member_fk_0;
       public               postgres    false    254    252    4915            [           2606    32773    member member_fk_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_fk_0 FOREIGN KEY ("salesPelangganSalesId") REFERENCES public.sales(id);
 <   ALTER TABLE ONLY public.member DROP CONSTRAINT member_fk_0;
       public               postgres    false    250    4913    252            \           2606    32768    member member_fk_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_fk_1 FOREIGN KEY ("_salesPelangganSalesId") REFERENCES public.sales(id);
 <   ALTER TABLE ONLY public.member DROP CONSTRAINT member_fk_1;
       public               postgres    false    250    4913    252            X           2606    24778     serverpod_log serverpod_log_fk_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.serverpod_log
    ADD CONSTRAINT serverpod_log_fk_0 FOREIGN KEY ("sessionLogId") REFERENCES public.serverpod_session_log(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.serverpod_log DROP CONSTRAINT serverpod_log_fk_0;
       public               postgres    false    228    4902    242            Y           2606    24783 0   serverpod_message_log serverpod_message_log_fk_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.serverpod_message_log
    ADD CONSTRAINT serverpod_message_log_fk_0 FOREIGN KEY ("sessionLogId") REFERENCES public.serverpod_session_log(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.serverpod_message_log DROP CONSTRAINT serverpod_message_log_fk_0;
       public               postgres    false    242    4902    230            Z           2606    24788 ,   serverpod_query_log serverpod_query_log_fk_0    FK CONSTRAINT     �   ALTER TABLE ONLY public.serverpod_query_log
    ADD CONSTRAINT serverpod_query_log_fk_0 FOREIGN KEY ("sessionLogId") REFERENCES public.serverpod_session_log(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.serverpod_query_log DROP CONSTRAINT serverpod_query_log_fk_0;
       public               postgres    false    242    4902    236               &   x�3�����S��,��4426153���L����� {��      
   �   x�U��r�0 ��5<kF@v�*DHm-��t	r�e��}ծ��sV�8��Y�}cF�,�["�r�U�	�`�K>�R����hG6���0H���p�)������54�����|3��#O��PD~� ��j荒���`!�j�!({G���tM�.���k����E�FK>��܀<+W��'b�Z2܅�nyf��1�g�[��b�������yÀ�,�8��dW�6��1��D��� ��`�            x������ � �         v   x�3��())(���/6��K-K�O�JM.)��L�O,(��M�MJ-*��,�50�/H��M�+1�+�K� J%V&%�qYp��dPRivI�������������9�L'��
I��� 3c���� ��4]         �   x����
�0�s�}��&���Qv����,N���V�K'l
?���'$��޻ HQ](,�$�V�q�C�ކ(:Ƿ�'��O#hq���%1s��&)��6�s�a'N.D�WkT6?�/�Q����l���-&H��*�t[�`��FXRޏe���v~r���7���R�c_�         �  x��W�r�J}�������@i����R5���D���T�ן�x�L�0���T�-6�{��2��uU,HP4M	�Eu����eC��d�#�u���/�Rn�/�k9��x}���z��y\�MQ�K��맲jJ��?rQ�p#��ϊ�΋�\ʻtM7�5zNMBuG���o�����(��Ĳ�e���9��gY��˵�ODLf<��p<�R�xS��|>�f<�B�G)��G"$C�����x�;F|�#0�lV�sq���x��͏�v����B�V��byS��y�BF���9�3,:譪���*�|��9��U		G����BDSd�s�k�DI�!)O����PF��a���^ɔd���e	����>�0�7([�7��d+R�3��Y�i8��Q֧��MU�4�r�.אx	J�kd�1f��'Y��@�%�e:�o;�c����nKv��[aa��'�b8<����c�#CT�]2�h�c�]v�64���d�0��,%XApWd�v,0�� �[��Z��b4)�����]t_��fQ�"4���ֈ��ql�8	ݴ���Yt݅qtez�':���W+�`�ϲc�M�ͦ�Ϩ�l����&��^�w���Gw>�<f�]��C�-�Y
����̛F�4"��T�E��/�»,�Z;���bFx�U1w僄LE���H�eI&j��<�E�)S�1�AA�b*b���%d�ud9��c�կ?<��B�CQf"��o�� G��k��H5K�0֞Ԁ�Y��{��͆��JnMq�j��u��h��;�0.���My0̎�E|�Yj�[Wr��t��\u���Ԧxh���Ss�lv���X�����,@uGD��j�a�t���y*v�N)���X,
ݠ�ؗڧ�規e�M^���:@ͯ����&We^�u����p>yS�살�H�vMwAR�K�D��q�򔒟!�����oS:=��-��>n�����l6Ś$����/x�?��"s�����b������A�Ű��LW�6��|�F����+OӃ�od�l�}0S�ڽ�mk�H�{�U�̋�wo��F���3+>c�Q��Q.q�i6�
�녬~�D��]r�Ua\��s�*35��0�S��N��[��h�ʧ2'���~.���`��
�p�؛D-�趍EC?H"�}�|V��>��%(#-�9��`��0b�l=?�"�����;;;�H`aF         �   x�U��
1�u�1�G�K��n
�(�#�A��m��dynr���0dpBLBJ�"P`�>23F8��c�,<2��Q:�ƺ2õ�ӸNhM���5*�
��Lkw�_�X�#��t���!��C;�%�p��k���^���{�>ݾ���m��;
            x������ � �      �      x������ � �      �      x������ � �            x������ � �            x������ � �             x������ � �      "      x������ � �      �      x������ � �      $      x������ � �      �   �  x�u�A��D�U�������9�lᙕ�����*�!3��/ Q �	T��׿�������������w�_��q��z���ض����w�E~��ko��9�˨q�G�5�Ⱦ/����m��5�{��>ܠ�W�M��A�����p���A'���>}��>�%m�:�n��r�k.ia߃�t��:�ރ��A����}S~���3�����A�	��������>�X'tv9�v<������Or��yr��/r�z�+_�Fr^�[��5�hz�	Э���[�����b t�#v�n��m�o�.o�)n�9o�q�&�d�����9����!��z�/���y�9d�ϟ��3���@?p���9�o�p��[���Vq6�n�'f��}������Č_�op�O�C�<�;W��{�ez<C\�xM��v9�]`(�������L�����^��X� Ō,�	P�����@gf�L:3fҙ0��̀������̀������̀����۪9Am�#�NP�鈥�f:������9Am�#>nO�3�������
���N0`Fe�aF�aF�aF�aF�aF�aF�aF�aF=_��|=���|-f��@�Q��aF=_��|-fvg&afy�}�0�;3	3����ݙ�0����A�ٝ�3"�^ ���L����>��Ù�;@g�? :3f�+���Ù�`F��] �<�f3��/�㪝�f�K�����0���z�X3�3�l&^g/fg��L��|�����lv�<�̀�Ù0s83f����әa6{:3�fOg�����Н�@�זl���qm�fO�זl���qm�fO�א�Fk��h�,��E��f������.P�a��lv���=�MЙAUԚ3���5g&:��3@g&�g�'�E���O6�@g�Fg&`&��l ���lv��L&@g�FS@�@g�'��T@�X3�(�����lv��L� N�Ì� 
���5�:�aFu � 
ĚQ@���wT@�0�:��fTP��3��n�:�q73�]�l���3f_�}d����}����
4{M�l���=�MЙ�`���lV���ݴ�lv�����1{����3f7��33�f��E��f��$ �w�>��:3fL�~�b8Am&>��j3�l6Am&�E�L��f�fb�f�(kFu bͨ�@������ N��Lu �n�:�aFu � 
��3�(fTP ̨���^7R��`6��L@g�'r]�3��.ЙI<>TP pg&��@��(KAu b)��;��� 
�RP@�X
�(KAu b)��@�Q@�0�:�aFu � 
��� #�� b�\��%r� ��e:��V���fL�\a:�`�
�#W� P�MЙ��atf�[�tf��t ���F�0@`�r��̀��	:3fL��&���ϕ��6���&��$#W� ��t ���HF�0@2r�� ��+L��\a:�d�
�$#W� ��t ���HF�0@2r�� ��+L��\a:�d�
�$�0@�O� y�'L�<��H��	�$�0@��$�Y� ���t �l�Hf�0@2��� ��,L��fa:�d6�$�Y� ���t �l�Hf�0@2��� ��,L��fa:�d6�$�Y����&�� ��� x�l���Y����F����&��0�����&��0�����&��0�����&��0�����&��0�����&��0�����&���������y�5L	�g�jx�l�Z�MP�ၳ	j5<p6 <p6A���&������84% �MЙ���C�����������=�}�E.h;���E~V��E�����������u^|���Gr�2�ۆa
���0H�n��sC7L�y��ݬ�@7+� �f%6t� <l7A7+�`M��vtf�`M��vtf�`� ��i
���v���Й��n��sC7Mҹ��� �a�	:3�cDg�~�n��6t� �	6M��vtf:̘���:3̘���:3H�i
���� �L�i
���� �a�	:3H�i
���3��� �a�	:3H�i
���� �L�i
���� �L�i
���3��� �a�	:3H�i
�{V9Aafcԝ��|���^       �     x��\M��\Ϝ��!��}g	8��
��='珺���ϋ�m��P��*�*�(Y�>�����~�������￾���_??~��������n_}��?��>ʷRJ�w."}��s|P��� ֯�!������>+�G/��� ݣ�ֽ:�8z$M�\M���q[H��)��/�Acc]jP��[�d�jM��ut������z�]{4�����Z[������G�j����f�ќ���\�O0G{@�m@k	�1��{��= �Fw����z���λS��d�����{OӫG5�#q��?���ty���<�*�eI���t`�w���F�h��=��5v�=�V���YL�hK��Q�y|-�B	��u;{��:�U���o��vx��HF/�_�s S��s=B�!�?g��hP�;�f@��`>��hZAZh����Ϲ����C��s��v�\OlCEs�c�e\�3Ùs�}ވB��Zxse'i�����Q��f3ˎem�)v�)vD��V���ю��t�
$��m���M�Y��׺�B�G�ݱ����0���/������s[hT�/��1���&KQ��W(n��|��[�^��v K�
�RA�b XvS�����~`�H�#�<w  �
��:���p=h����1�r%�#,�S(<Yw�(K�3�o�) �K=��h�lO���L['(���� A�&!�k���c4�Z ���MK'P�n��e���1���$��fX
�I��9�ٗ���c������� �z4. �} ����f�p�{ ��n���{[� 0�6��W��޸���UsB�i��o�0�/n O�J6���ѰM��ɇ�e#h	"�#�iP�ɫ�1�-AD��,"���D�f=H��ZbFD��C&�$�H��}'S�����筧���)�L��v��?��N-AkZ3Nm{ $xW,���E
@�Y����ϮKx�� >�RS^��1
x]�$x�~�Z�$x�>���#&x͎�M,K!�v7�#"����1�7�YH0Q<{S��G�>u-`�� |�_�O	&JH�FeL7�cb�b=H0QZXL�L��l�2L�������� |��RL��"vV� 5U]3������v�b �S��`&�XE�v�f �����3�D��-�	&z_�}�k�sZD��tS�����
v6� ^w�y%��wm�0�� |H�ʂ��a��LV��^{��DH��ko�LV�����"�J�kp�b�J�kp� D���NlS>�53���%�pր֎]w� ۀ%��^�c�v$��U��&[�2�쉕 �YOS6 �D�L�
�1Q�iP�`LT���ϭ���`��ç���L�:\�((�Ġ�iYL�:���N��o|%l��gm��!�� 1�)l�$h�U�H�/�����2�.EJАÉ��4�Ǒx+�ˣ��%7@����b��(��˃�$8�5�0k,]�._� AC��m
��6& �A/��
�2'�Z: m����H���{�3� ^�XJ�m�b!�� �B���LH�P�ɍ�#СQ ǴYL��彿�!$�x�em�``��>?��(@8��E�3����á=n�T���9� >��k4g �
 �@��y�v4g`�&������&���B@����>[�ƌ��,Cw#�1� !7�b�1� �����3
ॉ�:��a��:��5�>b��^$�@�� tR`�(z(��o�u�_��!b�ů�R�r� f q\g�����RǼ�� f q܊fA�*Em|����e�*����tP���JFAE��(AĠ��~C�@����ĕ�@E<+�$��xNR����gþA��A�D�?����X �'
�yȶA�D^4��H�蟜 Qۚ����u�(@8b1m�'
�V�����>�T����Ø�'
��m���'
�u��@E���Rw��� ~['O@��
�Ӵ!$�-a;��F���������}����r$x�ncc�(�����(���@F#�?Q����m�	�L���	�`��'��n�PT��

W�X���HP08��O7N((�K�n��S�Z�
��n�P���$����YLw��=�PP���/�	��[�7�}�*�\=H1X��@���
֫j AĠr�@���:��n�P�]/���<*j��b�D�v��i��	{�K�~z#�=�v��p�����]����'�nS7�p������D�v;[`r4����n�p4�{�x��'�n-d 	���խ�<��-��	�[�8c$x��1><�jw�Ԉ��'�`m�`�׺G٥$h���$hH��z�H�y�����Sp��X��Íp��X��q��XnM�L�M�^�^6� 	�ܻ$h��nCH0�Õ1��<��B��^,�B�������p��R>r���(��uZ@���A*󴌀�(��q��|m0q������(���$X�`Yl=H�0(�n�7S8(�Z� D􊙛�C�M	�Ō$�͔X -l+7S��en��h=&�M����wSb4��#&�,�nbwSb�r=�9 Dl��&�p7%-�JĽ�G�r���<��/��{)������Rb��}f�{)Maҫ-��)�z�Vg������%94���������&F��R��v�u����pg%�CW��B��"���pc�Q�M���ʣz���򨆾h�+�jh�I� 0+c5�uw�pc�Qm7f7Vb54_' ��"�m�5�X���2�#$�Y���|0�H01\þ�?n��rh�Yĝ�G5t�؂;+�z��1��"����p�E�M{�K�_��tn���e��ĸ���gYN���.S7Xb�r�
� "���nCH0�c�gH0��o��q��X�,W�c�����+�|��bf�^q��gK�X�e�2����J,[������nl_7Vb�2k�ec�X�e�24�1n�Ĳ�ZT93n���em����k��/A������J�W>_�9 pG%�+K�<����EU7@��^t�mwT���X1���k��[*�^yV]���(X��	�x�c�O�0X�}�&h,j��ϸ����� A� ���
�~ʣZ���~�<4w�$Xxknm��_�e�K�e�\��q/%�)� ��u�)��.�Qr �FJ}��[�p/����`|(m�]��+#��*5><f�Y��*5J�j�	wUj�x�#}�]���P[�qW�F�ݚ}��5H�ff�+5Jm������Gč�ou_�s�X��屪GP�+5H�v)�X�O�m=H01H�f�wVj�ڵ�}^Ɲ����}!�Ġ����31c���7��=���Uڭ�9�ǻ�<��B�������8.1\Ow���1��{<����us���1+��=�/s���`�:�>��x�R�B5��u?�����������      �      x��]]�[Ǒ}�~7	X_wW��  $��+ر�΃�^i&������n�Cg�]w��!Z�e��ǭ:]��t�ά�}�L�,����������s��\8�ap��3;���f}3_,�����W�ƛ��g���bu>��/���ˏ�������'�8�o/׫�oۡ'4�Q9��ߚy���G��j<���O������������f��y��^/?�ܜ��������x���z��}y3n�����{�������|���ꏋ͛����z����7w��q���������v^-����_�F����Ktf��;��n�y9n;����ų��K�|�������Ꮛ�z����_�7w7�N9��0RF��\�Ѕ�Sv�:fY�S:������G�3�ڧ�.I��jy��\�H��_��S�tsqy����v��m������<����2���"�^|]@�����j������UkJv=���4�M�ۊ���_GP������n�%�S�����
�����m�g�����	���]��g�&�d�T����;r~G����9���������8�g&18N���0�M_�|G���5���7j�3�M�M�8rF�={9�>���zq5"u1��r���4#�"1.�P4��g�4(��cJ>����Q� e���M
��Q���b�3�2,�Qk},wf�����/�Q�b!ˀ�(Y��(kX�J�ʞ���gl�X���`�KY		l��������{|Fm��{A_��@�bV�Ҍ{Q(Ɗ:��sR���¾`y����*Xdf�{`�3C�e��θ���R�*͸���c�$�g���ǔl���X	{`9�=y�Ϝ��JC`k�l+�\?���r�z-$����^����U�t��a���a�!u�����^��PE�q@7��)��)�
�q��(t�9��t�m\?����S�
A�n\?�+ �������X�ӥͼ��~Իmt!R�n���G=�ig���i��3ߏz�bb��gL3ߏz����B
V��~�V�lТt㕨R/E炶��n���ʃe��W�h数�3��*كn�����X����+a���F�K@7���
�$�A�U�7������c4�8���$�]�NY9�7���"3��m��>�B?�A3���K�M臽@IyI���߄~�{/������{�*@R��M�G=�<X	�l�6����,b����Ϣ�A�"�Vb�E%�C��`���D%��(���,�&*1�P������D%�˺�.kE�&*1�Ό�y)��J�'�J��Qr\��O2��RpJ���J���hbV�\��O�3����Y�E}<sF��O�=�&���B��%��D�&���`a�)EҦ>�R/�+V�����&��XVv�� � �c�mR/�+�m��I���)NΑX	{�M�}�B�k�h��&�¾`93��IQ	U�M�}������wV��Ƕ��� �d%���&!h݊���}9�X7�6]i�����}ڒ��Jؓ�#Y��A�MV��d��9��tt����#G���M=�&+Q��,�Ar�q���D}���YeAç�J���p��5[X�(a%��"L� Q%����&�p�Dr�F���R��~��ºhX�%�ˡ��y�cM?��)�v�N��~�B�2�cM?�F4���R��~ ��kR��VH��3@�d���z�9���v�N�6E���=��3@���*�k�1�� �״�%�cm?dw����dm�� �� �1�-��*	�ئ����^M��=V_�HKua �4X���L��
�d�I$�4a��y��IN�l��B������h��X`!KJ"���Q�Sք?9��@c�H B�v"<d�nA��Ѧ$
ٮ�[��`�K�1�0��
�ͣ��աBE�+�4���M�p�특�h!k.dd�rnE����Ҏۄ�lWЭh[:�v�BF���V0�c�d�rJەt+X�K)�� ��+�F94��]R�݄�lW�-h(q��FX�����V4�EX���T��v�݊��G�s	ٮ�[�mأg��qW߭h���hJW�P�
oEK��_� 	ٮ��\���u��2oEcl�mL�[�+�4�O�Q� �~]���9,X�Q�hhh���4/N�n����U{+����q�"��{�,T�r8Eb�E�x�J�-b_��-���튾�4�����]ٷ��i���JC��v�ߊF�$����w�_���7>�� �uW�-hb7	���74��+���N;	2�]���
霪&ٮ\�2��өdd�*pG����Cu��/tu����H9h���F��'��bG"�,5���4+ .h�������-D�Z�K��Ճ+Z�wI�ωG��4/hV�zٮ$0[*$�5�p@��vEa�{�!`�Y�6|��*\���*�	ٮ0\�P e�ՁJuו�+Z��r%��v�ኆ/�8�<.S�ՇE'+���2AN�qECƩ�ѐ�"qA#��!Y5��2ԕ�+Z��-C�t�U�E�S�(��
�u���d��RA�M]���mKM6*�]���ɴ!���&��-�����I�R��W�8�HY���lW5Z9ȦH^-zE���M)$�[*dd��q*� =�R#$ɕ�x\�ҐM
jI#TW>Nb�ƪ�ɰ!H���\Ь�I�����J����N�yٮ�\����T�U��ve�$nmB��ϚqE��v���L���GI�R2�\�દS/��]/�r�n#��q'���v�]�{w�n�Q�o<e�����tW;t�Kw$엧]�+���sW�S��A��J2�˥;&��ݥ���KwR�ٮAgϔѱz�,"@עSМ�ݩ��D���t�\��z6Fs�JMf�>���}"5Yj2�u�r����%��5��zu
�/U^V�r��k�Z[�g9x��Pt;���}��޵��m�ɩW"�tM;���h�.Z��ZT��m'�%9�����~. M�8��j�����Ɲ�&G	I��!�u�;̧լS�0�>���١E��Q�6�u�;I�S&�I��C{P׺�K�h-�����4�v�QVj�A]�NE�=���*� ۊؠ^/{P׾S�mѰ���=���)h,�Ϊz��D]OE�C����u𤭇�0R��7؃����yK�y�
{P��S�đ�d�K؃����C�XcԾ!��Tva0��fB������Ɋ���������Y,yR/��?���)hr��k���u=<��\�O��E������Cr&kgt����4�Y��ZP���	�z�Nje)�A]OA+O8���zx������	P��S�0R� F3�
P��S���������H�ˉrP�[P��S��o�:R�B��SА� �1��u]<i�/�1��OP��S��=�V;������eY �kjB�5�b0�+N1h�"��x�֮�Q��A]O�f�y 8��L ؃���V,��^u�Ȅ��'��<�LNe�u=<�k=[� �����熶��"��]����g�v#�������g���lD�^aj�x�h$�`����6�T�X�4�U���6���P�`Ǧ���6���8�7e���>�m�١9;xk�&;
}P��SѲT��ũUR��&�=^�P���6�<nd�;β��[W���&�=�ܨ
�}P�j�xvhr#T�AQ��\h�x�hX�7�;;Nޗ��BA�z5Q}��������-L��5�B��S��	�ڠ;�>���١�z����p}P��SѼ�BJΫ����=��k�}P��S�ؖ�G���dG�j{x�h(SI�@54�B�ĳGK(S՗d�=���كe�Oz�I,�AmOE�R�b�e�s<aj�x�hXc�U���6��М���*�=�m�٣��Ω�؃�&���-���4�j�x�hI���X�j�xvh�J������g��׿�xC*�M<͖3$�v�V��&�=���5������wx4<��v���PY���   b��`?�&�=k�8�j�x�h�\0����yj�xvhrQֺ����&����mRk��=<��1�F��=<{�<���5>{P��S�b�>���44dB�óGs^��-<;0�n�ܤ�Аm�-��z�Lȃ���'���yP�³Gs��v�]ȃ�V.��"�yo��nBԖ�wh���w�{����V��`Y�׬�;��6��Pl-i�K�;��6W�����YGC&���ƒ��L�#����v��Q�T����V�p�����V��h7�yV�J����fˣh���G���ڼG�Cv֫4��j3o-��a�����j3oUz�X�U��n��;4����u��m�����`C�5_�����f�Ɖ�����r3o�^�|��h�\�*����5���֛y�c�C�iV���m���

6��l	��޼CC�GO�����}�~.����[�,/4�sh�"�T�n��;4���W��yC.���Fe�r��,���f�
`K;��d-r��7;9ǣ(�粼H�|S�n�����b��*r��7��%�'�q^�B[oޡ�C�4�����ƥ��Wp�+j��֛wh(�RC(�+��m��ݟ�ڜH;o�����yC����zV�?��7��oQ�Sk�{9Bܖ�ݽ�#&�#�>�-7�{C�
�b'��m�y�&O8�Uo�n��;4�wRV/�>�-7{	�k����s2ܖ�D�!�
�n��;4���>s,�����
K&`#�����V�+�\������sy���	M|j�ƪY*�����5��Z؃�rsA۾׊���Z����f��&�"7�y��=��7���b'�c-����\Ј��	����������#����_�޼C��8e��G��z���)���!�z����	j�e��Аm��oϴo	����>��7��I/�<�>�)��m�y�&�9��V���m��oOz�
n0���p[o�h\�<9�4�n��{����c�n��;4�d<g�w�m�y�F"N��p[o�h�j��i��g����7anc����O�?��n%?17.��__��/�����8W�$�*v;�RE�~y���X\^	ⷛ�f�Z��_�E��{���p� �!B4��7h�K����ϋ����z�ټ^�,����N}o7��Ɯ�̯�Ϯ1Զ,?�d]y�����;?7�wW��*8ҩ�Y��I�}���6�C��]	{^� ��$�����д+|.��R�����
���kh��"��'���#���ʎ%��^z��#=����#
-z 8��!����kG��)Lҟ��^�?�#y�^^͈�߻r���yG�6T�=��lʲS���C|�"7t�=>�:{�<)(/�������!�x|zؗgrCg/�d��<cB}x�!��ֆ�^�Y��P>�����f\������f^i�����?��ln[s[�LfW���v\�W������z����q5�b��8����.ً�.����������.艰)7�����Pgn��s82��ql��&;�qb[�&S6��f��ͧ���]w��Z�sc�+�����Q��Cvs	�I�|��O?N���	�憧�e���C*�9__�\��w��������v~3���?���~<`牨!��n���(|���Zܞ_ȃ�^�J��s��]ܔW^_�^Ƞ?������a���^]����_�y�/�n�������}9^�2�@z���/kM4̍��\s!�����w��&�OE�F_,/'������oPb�`n@o���(�G���7�&͍���M�d�pj.�m�q?�bj����� �:���朗�SQEm����?��O��S̍�j�z؍B~*���u��䩠ٛpڌ���1���y������ڧ��D��l>r��vjc���᝴�|���k��_zNRm�E��������<5���8a���Ͽ���!�f��\��^ژ47~"��^L�']p�_���ߞbn�U���n�>��k��&NDM�\<���_<����SLH��-���2X4T�c��&OE�C'���/��O077������;>�8en�85x��i����?�j��)�T��}��x�l����憧�� �'-T����ON17�↋u?�Po[w��/����5���i��Ok��_��cq�5�-���#~S�cq�MB�\98a<[��ݝ"�W�u���$��`�F␛�­<8-��_���?>�ŀ��F�ڲ���/ǧ����7�Ǜ���y���}8.n��m��������/bC�v��akr��Bq�՚p\��� k�������U�>d�;�c20b�{Hk<���o�~q6�!~=�����o��������f~�)'��Ջ˗w��b�m���������w"���(�ұC�[ˢӾ�����]�E2;�=O�G�i8��))����G�g��Z���Ƅ:106l�N�_�$����Y����$�ɇ��X����wS�}�x�Wv⛜�Z0r1��lոp��Dy�ǉ��ȂJT詭Qq¼�![��UW�y����#'.ω�Eq`��{��vq]��h����q��Z4ٿ�C�i�zɾ,���;b��Nḵ���y����4�P�75b��X�nW�������՛_-e<n��pjT�q�����Ƹ���cf�qh׆-���N0�8��d�)�G�(�\�.Ҿ�,������#ʓ[��q����5�C횠b�K����cDvrk)��}",)�q%k׆\�C^v����֐E��G�Hx�WC�ϼ��.䝪cLv�6�Ƶ���|r���#�O���<WC��KSd���4��*&�G�H������H�>>k�Ln->6kY�����\ܵ~`2��%V�ɭa��7"0C��{�֋Xe�&��w�즶Ʀ��1"0C�*�Dv1jR���_���w�E�7.2�b�˔��Pb�/.ެ����{�`6g��b��u��p��䖼��+:�f$w��A������2au8|0g&7ŵ������ �]�"'��✓���s���U�T'��|� ��<p�٭5���X4~-�cWH���#F$��Z�lع�`�A�c��\��Z�ׇ1"��֚U۠�L�zB�n]���K����Bkͪm�mF3���cF����r��a>"fh\.޵�˃�(��?6�<=��G��и�\�����ذY��Fnjk�W�y0C������~6�cOK}��E�̃7��mDq!�A��]�|�ܚ{�����ɓ'�	^�\      �      x������ � �      �      x������ � �          �   x�}�K
�0��q�
7��s�kk)��HCl����9���d�V�6C�
�BB�O�.���v�Ld��R�da���Kۗ�Ns��e��Te�i����e�2� ji������yQ�PD��!Կ���m�r
�. ��`�}�6�         �  x���O�8�.���P8m�/I�D�I�;n��Z�	�r��H�\���ߟ���J����֏�������%�P|�e\4n����awp�{�_Ps.�c�7�v3�s�1O�S�4ߢf���x!y��Rt��x���
;q��Y��\Ltբ��e�a
Y�^D���gY𢔦I��0��A4.y�#�c!o�u�0l�o����m�:q$9�$l�E-��l�m{�*�|ƪ��B�iR�3�1�u�OKӨS�ў).��}]�/��]�S]���#�<�R��H&i(�hΧBG)��;L�����Y�a��?Uu���h��'��a�7�K[�����I��$���5�O�/-��u�j"�"J�V�F�/�H5�fwX�χ�XN��4D���+[A��b��+���۝�I"&���ڎP�,yC�̣��L¡�,1Ia��c����	�"a?�ŭ�y�	ݶ�L'd˄ӡ�R5�S#d�+1)��MFT��\^'�Y�&i)�,e&���Ҳ+�~�Ƈ�,6���q����+d3���E��B�i�]��T�������_z-�zR�"������<�Y!r�{�gY5�;�s��rW��B���_7���h@�5�ڏ��T,̝�9�I_)��~�DJ�=O��z��N�T�����+h۴��o���G��&�	[c�_ch�^nԓ�+�M3�������&a�Fj�aXEj?ա&gQ6R�sT�3�Ģ�ܭڌ���e�oRm�C����$��I��8^5$KU#�`�	Z���P{�\�$Т����e�������47�_}�? N���<���� [������B��m�a�JL��q	p
p
p
p
p
pʫ�Vs
Ny~N���f��<�)6q�S�S�S�S�S�S^%��5�0�����Y��{��S�888888�Ur�Ss���Bh��z)���bc�HHHHHyAH!>@�KA�[C����A���HHHHHy�') � �]C����A
v�c� � � � � ��JH�jHi�/ �H]���rU��}Lq�KL��W=��      �U�_�g~�p�?�w,賿�:CT�a�FV�_�^R֭�RꚊXnaL]u+�q��3�^��q4U�B?�P�z+
q�K.�S̰��:z��"����j��fw���:��;�V΢Py,��=R`e ) ) )ܻ�2S��&QuF�R�m�(%�F
f���ʎ��*��)0�� )�)�Y[[[G�,            x�<�Y�%)�_��}���&ܩ�Y����T��=��~}�Z��g���7~��웿��������Z���:{+����Z�������j��Y��j��zF)_m�1V�y��9N�����Ǹ_��j���w�h7������_=�����W3�Q�V~�=���o��9T����]�+��'��+��X�6u�S�l�zY��y��v'�[������������~=����z�՛=�����1��=��zfqJ&���эV���o�]_?��{-�����s�{d���l��9�g���`�7z0��,h]��F�u�Z�d&���_��eB���$e�o���~�c��&T���No�lA�\����'+?���}|s�㟑�̕oP�\�ܿZ��|����Oɳ�ۗ�V�j�U�;�o��t|+_<�/������eY�Wgk���:�[+<g�o�ߩw�tw��N�yv��y�K6P��~�fdk��+�jY��ϑ���Nz��d�;�~g���ΞMw��J��H'yE����d���;��Z���ɉHì��J�6��'_c���;Y����_�oO��6'�'��;yǺ�����Qሔ�r���n��f�|���Z��������]�Ѳu��g���]��;ߠ�,�勯��7#��))yIϢ�`������ysNr�~�fˮ��$�f�j�ze�qVK�x��rK��)���as�;������~o��՜�lۛ�Zs��8y�]\2��y�iǟ�̹8����Q2�|�Eޛ3�K�5�L�ԛ_��߲T������ƻ��{gf?��l�h�w�vZ�����/����Q�g'7'$,)���~`b9�k�c�m@�Dp�����9S�0��i�����o��Z�$d��.c��fՙu��n_,'X-̴�����9�bB3+rm�z��~���/�~��WyYN`��n��3�p�5����%�|�uxB�l͡�0����2����k��xa�}�!g���v�o��,4��d3���*��������`��6�w��v�y_+dvc6kV�A�����!n�Z�"��m^�3P3�0	��=d���r�+l���O�q���=r�jE�~�>`���^q��Ms;��M�E6�`��]�v�~��A�%�~���Յt�L^q�%�;�s�x�m7]R�FX�8a�$G���ẇ��A�7��H���ޑ]Y�0����ф{���ƍ�6l!�#��na �mvf8�ɸ�pXH��ȏ7g2��ѓ�N�p�����vl-%��od!K.�0�� �R�L�\���D�_/wo�\�i�ُ����v�J~���[�Hw��O����i
� <$�M!�1�=L)J�s��.����U�^\��{��K��e���74vH�i�ȼ�K��D�y�DvΡm6�D�	&��i�0&2�����C���"t���7�
�36o� s+���D��ُ\]2/<?�2L��yW�*� 9�񲰐�'�F�'�kW>TX�ν��CX�i��,$�8C�}��z�a!w�ˊ���|D-���f�a!Y��/6"/��p�L0�0d����3s����#Z��\WG6yE�ha!�,�r*')dxH��	���sN�ixH���}�[#dvc6u��2�Ò#f����2�:����䎛ɰ
s�ጔ2�x/�<g(g*�>=�����0�0���D�r��܊_��V�
�̭¼"�D�l7�L.���H����������0�,n���9�Y��͘��GϷ�i�V�F����pN�DFOa"�y�S���1v@��F�)�s�?����4�HX'�'L�d��0�.űG�'�8�s�D����C�Lg!��{��H6\HY@�<k������Wt�ՈX�X�^��A��Myr���pr�zF.��~C6�,��B2��U��#�d�Mr���=o��]H���;�^V�(:O��$�m��A6�m�`�?,$3G��"�?�Ndc�_�s�/���`gda!�Y�Bާ7���!aB9�!+�厨��D"aT�0,�h���"�����a"#WM��}�0�͎����Ȭ�p�$�ՑC�P
ɢgl!�[wy;$?Na"��h=L�Fa�4�Jf���aB�uB^t��,�"#ZG�6��Y԰��)�g��;Q�2���a�A$�ƦA^�~#WE2�s�2��-���r��Pw[�i�|.r�{چ�dqs���BF���0�ф�D�A_�7E[��ݑM� �2�0��&��@���Og�)3[�v�&"&D�AG��9�ꋛ4����#٦�f�m��{$�%��n�
�B"��k��سy,$�+J�5$�����̒K5��5.{4$_!]Ew�uW1$�oB�l��b�=��dtB�QF
��a��3����퇧�5�|vO�����Q���D`��G���{��� �o�s�2��n�N&p2��S�VfE�l�l�L6�_;Bn���8r��GD�|���u��Ԙ�K�΋�\�!3��ѷA�ڃ�0��l^�3و����*B�y�GF��!��H���Ȱ����ٹ9�S���?����3Mr�dA�!��U�}ös^�e\a�2,�*�w�>�r�;Cn:�ɭ�7m#�3���N�2|�!֐WE�6�#���ѐ&����"d�p>e���%;#���!3�A|����Kg�m��-�"���F�KJ�G��LS��#�X7�b��Y~���Z\~�j1�zLf^��i"��e�,n������`a�䑥�ʑ���;�g!�d�!	�e!�]e$K�_�4�cpA�p����#����8W���1`4��t�t�sW�3�h4�0����&�8�c?1.G/�kz�prO��\3�V�����ȝ��p�:NԙP�-~�`"��yx/�ݒoD_���6�;�	G:��`܃�P4��r�E%���;r�
�8�c#yg��C�'4�#��m�?rus\���/L ��eS#HA���yKL�جnX-f��|l��(r!�\�!��s3-:W�8b[�HX���s�s�ΰ�L�=Nvz���=������B�Ҭ����8��N.����4m�쒼���K��,#�ΐ9�;
$&�g��9Y��&VQ���x�2�!4��������ϴE��WcI�����KE�:�0ڐ�#+��ŧ�������+x�aCG?
wX��㰹����k+�x���VY���l���2�#l�2���y�36=��Ȇ��8>0���,�C��
�p����Mbb��=:��¬G���Y[�N���:kA���Fs�lM� ��p�Hd9߄}��e�>:�ټ,�c��Xrw��t����:=�Ma�Q� �&�Gƅ���q�����7�j���N����F�ܥ���!Q)�H��7C��p�=j�f�=ja��)#:R�Qҹ�fXH6�⛩�`v�����d8H��{�A��G��'[�2��&����!S�Ig>A�"�+Hn��b�ύ��B®��&
L�p����\Y� �,�$*f�p�,�`�_���nT��8靯e1d.��l�U�!����NXB�������ц-Uq�3�����
�`�
L��Ua�~��օ��f��h�0�.�p���I@��D2C�^�N�g���Q�=����P7��Ҏz�,�����w�)[��D&�Bb ĭ{��pNB�Ñb�g4Y/H���х��!��D���p5MlXK;j-�b�|����\z!����B �R������Y�p����W`��������۲=r�"�er.�M.�HHe�t2�D�Ҏ~����·T ��-�J\ a!�v7@x����2=�C�z?ӋS�@�!G�+��&�qzM/��v
��3�&R���0�_�+�Y���a"ahnG�jx��%�_�����`���p�x[P�3�u��sd�.(�Q�VxHą�!5ɹ�6/�H�K#Hà���}�=��
RH��8,$<�ݞjz��N���\X@*�x�l���    �S�3�-+$cٸ��GcH�g�V9��b!�`Ig�@.j�
��V�q�����3p���%�ņUc�X
!oC����^19L�8HvrD���-��.h�QLjH8q.wHl ѷN��=�m'��y���)d�0�����!������n��j��{Ņ���Y
>�r�eN����+&
C��4���mF��[���O�L�m�������0fmt�\��m#mt���Yэ�#贐��"-���E3{��0���.��� #	�w�Ch�a�G���1���~u
"����	$�z@F��(�!Q�r�e�����0F\1K����ubG������l�d#�`p��`G��ɒ�B"�2��E���ۘ@pNe��b
N�/�H&���'��`!QX����w����dKݝ�&�Ɔ5x�Br|+�m�**�ƒ����":~r�b�ȏCb9H�1$_���ǘ��B���i�y?<1C�����V'�k(�mc��Y�*"��;jpϸ6��⒆��k���@:���H����C�/� ���l�A�]cc��n����,����CNт�]�U~�C�gm�a"m3��d��$�o&��r[�Y´�$a�!+j=7K�ƌ,�+m�Cr裱��n��7�*v��*���)���SվH�b+�����	�<ͫ����.ߙa�0�;�!����@�M�ĸӰ�������YH�3���9���݈�9g{p���>C���A���]EN���E�m9ԹL �:-2�8�:��4=��W4�GvTH�ӹ54�,I��U�A
	+�1:�Qqye��9�A[;�9"ieu�F?�V�7,$�a��oA������Z~�r#��3�)0$���/<�i.{z8(�4<$�)"Wus9� 8� ��R4�8S�{��r�M6�	��o}1��yvf�1����K���1�u�2��A�i� ,&�M�τ7�0������4����˗!`FŉNQp��3&8�ɰ��rpNv$]L
���Θ#��p	����������F2?8t#��]�"i&�1�����~�Qe""s(0���n�����t��DS�Tr�֐���leG���ɸ@n �Ln��;��ڥA��LV)<$cg[��`�fb�e�9�Uą�]2�B���b��Dz�=�B�>�|!���(2@HD���B�x�p|�"ޅf�ą�f����G^�-�����)d�'�a!U_PH|�d��S��/B���p� �]�̧3d������:��AՁ�ƾ�!H���E
)c����B����Α����>l�"�lԮ�G�Q���rfxbr����&'2l�-��E��*(!5�{�a�r�/�\.������h��`H͞���r=�N�]��3p,��~����*_E��'��3� ��Zv�ř~-���D6��:֋�%$�<��ȧ/����)����bH��H!d"K߁�)��e*|�0Xs�ѥ�,Mހ&2edĬ �rNKX�LlK7����'�r����."��� �#�	�,�vtu�4���&��ً��%�⅙�K8��_�G6?�{d���Bɖe+aI�"��Ô���+wpc}WԘ`��2�7�$�ⅉb>x*�������B.\xwo/e~u��8N�l����!�E����?�Mc<�����IW�lKȈ��Ϧ��\�On$A;Ӣ4xۑ�}�a �#��_1�J2w�du��ăs��Y�\���	�q/~��N|��MTHvR.���A
��0�p�(�ཊиh�и�&
E�h2:��cB�	��{E� r ��C�*��HY0�>�j@�����,��E����Ccy\�LA��pB�T߉?)t^ʉbX@CFDޥc�!��#�ǒ�O L.������S�)��*a*'�m���Ty/�M�|	�M�bh����L$��h��~xK��p@�b �y�ˌ��k�q�c�i��	��O���Z��<��������C�?�Xh�l����K�_$ iT�\�t�K#SR9\���V�rYe���Lb���f�������7ٛ.�h���}7@xvr�e"k�*���9�h�	g�N]�%�����=`8��i,o�1��8�(?Xn�����\��UP�"��T%?�ӥ؉�z����Y1`8I���W<ɾn<:(/�)��)��XZCs�֫Sl����*��mԡhC~D���E���l�|G	?�dk�G�$�h�}�������F�S�����F����,%���6?zWe��jA-�F�Ȏ����^Ώ�������@e}��ǘ�
�M������ݣ�~�g�!	�\�X\���[�\ ��kі�yo$];��p�`�G�� KA��c^U�;�b��������%�E�=9�g��܍��|\a�``A��&�� �@op"͙����A�Ǜ���L@�Q�8tXԮW�m���Y�FU�"d��x>���p�k�áB����=�k�
��L�W����s��G�;��X����Ñ�c��\�`'34��
0������������9�b�$c���S�h >�r�
U.m�k��e������F��ň�0����
J����%4�=@��HقE:
1��9���a"�es�G��CV/�}|��ǃF��aE�s�����$Zv`n@�Ѩα9�_��
K�=.>ZV����������'��(��o��&��`gq I�_M��F���S��i���G=K�sp}���S��W��fAs�A�����o�$����U0uh\HW��6r��U3i�+l2�gq[yv.��':W5�_U����{ɡ]�o"A���[��u��w���=h���a���㎅GE�`�ã"�aP��V�z�=pO����^��eQ���t>���ι��ql�K�'7&�Vahtm�m��Ux-'���\�D�D���!�}����z�l�!���G,d���A&������^|j���`�Y���来��v ��=JQK�4X[.(�n�J�1�VжMT��S���#*+
��p�(iY%H ��kz<�1� Fm ��z�ϑ�j&"�-��׏P%t�
���p\7�l`P�/��h�E=�<���u�����V�>�:�V` �`p�[��R\W�6p�t�kE��´}XE�Cpc�4i��s���/���g���9a��E�q��'!�q'n<����qۢ�6�3 ��e@��tx�QkM��C�D��1���r�rh�G*g����f�7��}��E���� �8A�d�zL�� �f0´}��\��Vd�VU�� >���qT����e#I��Ћ*�v�����l�P9���H
�;"VP<?z�#�)����g����]@6�s�����XW �����3Yrm���n(��O�J1����#�͑c/���=�҃���P_�kxւF,�� �;^��`tYk �Q`}��� zwk"��w���p��|���Ye��vy��uG�q:r=P��
;[���b��T�xpb]�D����Ǹ�:jxʛ������N�����~�QU༷�B����Ⓜ�Żw��z���'��2ާ 0�j���z�R�� �=�s��� ���u	�c�����
�waBc8�e*�.5V���A�F��0D��9d�{1u�[w�S,Ӹ��Q2HV
�4���:��AՋ"f@�lz��l�TΘ���#��^�M�/C@�4�Oy�S7���헨9B�<���HQ����]{��.]��.�Z�m�Ǽ�x �,��oA�0D0�á�A�G�b�aR�[��yT@�p��]-�~�|[`�	 �R�q�\5R�/�n�,1�4Ѷ�+
�/'����e�q����#,Bs&�z`�G]#*4kQ�P�g�@��e�`�	����Z�:¦qQ������p���n 8�VbT.3nsA���!q�z�.�y����_�n��a�U��؈�����/��    �}���-�������i��8S*�V�T )V��;ִ<�p�M]E	����{|n�(���p��~;����b�*M[Xa(ݸ�|��(pa� l��� ��-@��Mh>h����f��C����������#K�U�pV�8L��5�PY�9�N�\��ĉg��|h �؀ΊNN�P�/0�{6� 1,MZk��%b 3��`��������c�k�mӅ�"j���x�/�hk$y�c-��!�$~`�
��#����.�2��05�+�����s�p�W���:�����bք$�蕥�GQP1�M�Ô�L\qf�`qĞGr�	;t�mt �s�˲���Y�6q��r��F�.�#��L�z��1�ξ����h=e|�3oB�sEp���]\4��xhn���G�2��q�t�g�Ԩ�vε x�7�j� V|l��R�Q_*<��2e{`a��XKtX�!��X�8oLl2��Wl�����!M�Z�<�`a�2��BL24��$��h3�-^��WwN7=Z��?K�26%� ��B"L���<H �o� �k@32Q���m-��ˢ � � �A��(���e����[���%4r�U`�u�,Z��#��m4��߂aY�@�[��+!�mМaϢ�,���Q��u/�c���罯	�Ja��2r#�'F�ڢ���8	4�����|7�+��'�H��i������^�[�OL��s䨡JFyWU$0ʈ,�`@�r��8�_�4x�%�I����G�YMA*/p?Y�r��4�jQ����d W+~;A�á� �Y� �8p�����Y&y����:m��*��-n��I�3[�0қX�=����88�D�C�ƍ �:�FЀF%�n ���xͳ�	`��0}̹����/���6���1�yj�:�O��כn`�ٕ��0Ppܯ�PYs�\�̀�@�q�Li���(`f��+HRX��!	���6��D�#,�f7����0-�Qw{�j� ��
_}GO�y�,�׼��B�Sg�lA�C<�l3�X)<z�|p3�� 9*�Px��
�9˧q|s�4\8�/� �m�L#��A$��u��A((:=;��On��s\��.K�@i���@:7l����4��u��Eؙ�*�s��	Jp�E)c�wnD��&[*�����^�0�v�ż�9�!�6��n�N�]�L���l $��O���6k ��&Z����M���įG�=m�����4�,���l�F�#J�����^f���'`�7`(&�q'�Ҵ:.3ˌk?�sM"� �&��F��E�
�W�!�Y�̬�E
�/CF��x�+hh�CïW�� i��[E@t��^O����i�t��x�W��W3�S�&r�Lt��rO3�k���җab�lb�>����2T�	(4�bB���T��@j�m��_y�Y�U�@�y�AHo�\sQ�s�sF�@@�^0��(������s"?'v�d�i*�1IK�qǃ�+�ya3�g���*FT�H=�J'���P��;��{��|��T�c�/�-�������U�ȴ��Ǥ�Ю!3͜�Q��r<d��N��|:�ȥ ~�T�h@?�ö�?�2s3@PGh�K�O{����b�b ����� 	����!3b�����4�Q7��d)nW��ȩ�P+Xj6��;�U��~z�N������[!�m�:+$���|'�⒢GRZ�Od\�����������n��f7�t�1*ۚ�fZ>�D�����`5>��o�z;��A����@��_b��W�2��.D\
�
����_�KSU�u��2�-�Ķ=o���X#)9�MG(�H�~����dm�Y��U�t>GZ�{�/��y�W�����
�����(Ch�VQZA[Wb��6m�!�e|�Z[�[gr{��<m�pk�p9���M׹S���&���>��{ ]c;����@$3�A��F�:��[���s��&No��lB��^��hE|����ơG�"�� ����1 YS�x��Ȁj8q՚	;����T�U�aTt=����bw��w�T=(v��s�9�����܉�w����oS����O��u�W�ׂ��q 5+ ������q�g2��Q�s^ەR�)r�v}�ӭO�=Hγ��S�FiXb��ϾX���.VEh�$���K0�r�To�h��;QZ$B~JsS`ڜm3U��@�+@mʈ� �sW�}%�	�MΜK&�
V����������ֹ�� d��0(���J�����d;�D��67��<�-��p��|�y�с�^��b���jJn ��8@����O�۸���y]b@o#?�Ҁoϫ��vn���ml����_
�Fr�_��H2^��v% n��_��SPܛ���_�Vk��V������lN1���l�`i�m4�z���9��xG{��x�	�;Y�@tG�/��m� ]�2����Xw��r'��C ����P5�m�23�K�����%̱K�%>pwN��O��D�EFu+ ��G���ld����:�P�>�˧9�yC�(o�A�<x�X|z�6�=���v�8�;={�5>y�����@1�a�.�"���؏� �y���7)E`|@��F� ��>'ѫ���(���&��-�2e@�}^��*�;��5�߹	���NШ�{?��7Y�o<�a ��ݻ�������0`�8W*� |>�p�Z��~Yҧ�kF�\��� E7]Y�a:2xTnu&���Q��+���� V�q���~6�&�r��Q����|���/u�h��
$|�1e��;Px�6h{=�z6������/Mh}�:���p�AU W���	r��s�)�h�=�5�uϗ�mjn��o�}��)����#V��G���_��d)�6��������6�|$܁F��Z�����~,Kv�	Yk��$w�6 ��5�Ѓ2�q�����4���jx(z*�q�W��\�mN��a�N9������v�)���]�w�E@�a��I:�
^�{q�/q��S\`��30��~Baǃ�]�QM�0r<�n%�Q�fS�W�(`�$7��6�g��`����6xr3���ețQ�eǨk�4��
+� )'w�6O{m�^@�0�-���%=�_IN�_�����m�������`/71FQ?N�,?��G՛�v�F+���m��kCީ���
� s��o�R*�3'��X�/�Rh����́�3��'j����AhH�9�ѣ9�4��H���j�7���8�E��E}��B�A��e��5'6�Ë���=ph�V�hSr������l�@���Մ��tb��ՠ��Y�jB�d�5�!�TlFo�����L����w��L���!ͣ��'�&Ձ�u�5߄�J��l�d#��Y4i�h��S���4���o�d���P��<�z�D��|�d hB͑]�s �RR%�1�����͏�"�e�O�	5a� �~�=�nF��I��b�-[��4�`�}�@�#��9`��S��6��� �V���J$���bFdĦVD��W[�w�b&W�N�t���@��_�h�8�g�B�m ��;���!&�|�&M�I� ��� G�x�Ȑ9q\@O�R�aS��4� �A\�p����'��ߢ�]�IA��`�x�<��h"<�\��m�˛xD����h�;�֋ulNX��0׀�s׻��Hc�Ps2f���9f0gL�٠1���9ԯ׮���b��:�z{����_��ym��;A�o,��K]RB�iP4���gd���=�@�Қ�F�;v�V��)?E�c��D'�9Hs�؝Ħ�͏q��~5a"��N~J���� G9Z̈^�q���@�'1o��G�K��]
4�YX�� d����	6/f6k^����5I�'�T25�湻I��̼ͽ�{���c�W�?��U�    �����A���d�Xh~H1#m6SϦ��#�T�!�E�,�����J����箵O��N�ƕ	N�4?'@j�?��%����]b�XQ�C�C�I��&�v8p�����F�S��Ъ�g ���*��Qb5?:��I�Q�9�I�k�k�=j��@���aߠ��=��~��@ t�&����擈h�1 Ac�����h,sM�9ܛ~p�Ϳq¡��a1�0�w0��8rV��h2�$@����`t�<@s�'�{Tp�o�q�J���H^��`�]�c>��aQQ@�4׏������~̽�]7D)'i�՜L�<��w�|mՄ#$/��?ªU���M��R=(�J{'������1���W�6��y��ln�	>��L�;��m/b����?�	��%W�4܄r"HB�8�-}��g�i������C?)ɑ��c6�y�/�C k��t���G�s���G��k�x�;v��c�U���k��4��vp� 6_D.J7���.����o�eo��I�X�f��ns|"'x{p󋏫5Ӓ��ěk.���k��M�9h³�A�/yps6���\���̑F�Ch/K�8n�+ �r�;) �=�V�<g��� z~Zv;`s�P�	/�yM^`״������k?�KQG?/JXAM�9@}^�$����)|�f<����QG���h�5���0��#/�4�6@�EL+4X?����lps�{6|�	Ji��I���Y�x<Watt��M<�&�/4�����]L��ql��B���Ĥ'=L%ƒ��pf��"�T34%�eQ�f���N�@�gQ���TT�?�yA�k~��`6訤�ܵ&�ı��̷�����E����U kmN �ꚥ��(�MHڂG$�IYd�p-0�;��1E4Yu�.շ��M�vk�g�1�怲Hm^|��`�IL��1����؜��/�:���$� ��"�؛���oI��0�7�� �X*��X+�	��s������l7l�mВkv�{К��kC��UZl~�@��vb����UmJ`�~�t��
��,����6ߓ\Z��Q��i�I޸�0�@�s5W�?~���Yh�.p�Ԛt����K�v ;I���5��"2��@ m��L��d�ae�H5������D)����ħ����kN�_s��_�&�(6���x��s� 6Ga�6?/Q0�м9���7� i�L3��?�,6�Tn�Z�&�Iy�@/�9�A�o�8�6�}X$�Fe2��8d8�ͱ��KM.ݧ�WW�s��:�����ќ��Q�:@�֍�����ˊ(�ŉ��W"r�����iT�͑��A��Ά/�6�H����W��w�7U�}��t���C�k����H�	�Z��9�S�J�����x6X��R6�n�����I���ۭ~M�T5�G��ڝp��� q��s��ۙ��5�t!R9*ܲ�@�x�4I�ޝ�D2� @�ɽ����c�� 5'
���|m����#Ɉ�0��%�ҵLe3�Q�g�k�m����g��lk�4*Q�x/yT@���j�����h���& j��5'i$�3�����|T�� ��~[+���X,B4�� ̃�������|·ŚWktǉ���
������.�Ś�7�	h,�"��VĠ.1ļC�߭��k@��lvl8�`^m@��DkZ�5�(�Iu��
G)b���3Wg��6�3��e���ClV`�,hR��C���)Ʉ�/�gj����ڔ��0� 5']��F�H|+>��Z�\�(4��r���@'ay26Wg*5g��w������Q¢0n���g�ӦQ�øb�BW�6?�""����۝�Ƌ
dh|�}�����|��`ܞf��|�"Q�`����� ��@���pa���U6�l1�k��tQ�J��p�K��4f���bf�!|��5_p\��XYc[�D>��r3��E� �����v��%ͬ��E�)�5ǵʫL�������Xs�I�>�曪0�y-�F"�֜"t��;�"_�&�V{�������E	�<���l�s����RY��s���tֽr!9M�ɽ�-Gc�k�S���ي�����]�8I~{ʵT=��`1�u�Y��&�zX`��ܜ��+(7�9W�n�QV}N�����|�=M��� � �*^�7�sP}.X���,��Ipk �KH���;�����U���|�j1p�{�����S>?ps��u�i&	k�D ��i��޷�O���LF�41��@���.��D�Cbn�o� ^�Bn>�q�fC��y�0W�r��e��͜�uB��L�إx�k��K�7����'�x=�y���s�4�̩���+Fk����Z���R��,1��sʢ�wT��j��sDU�L��˶!J^��9|��Z��A6�ԇ\�����`eb"�� 0 sEm|���x"�7�4�, e�؟��؞B�B��"̈�+�Y��9e.�\�yQL��-�6�~�.��G�-h�C��V����ՖV��o<4DoR-C#������gچ��-�	b��0)�|�����k���4$Y����9�[ȉjG�l��b%/�Dw���,V�q��!�8'�垊�Rt��Z��z�'L��-�W��Cr���Ӎ� �n�X�4�bg����_������R�3�prN|l�,۹���g���̳�bUx���Aq�:/ݣ�LԲ4d/#�؋&�1���0�m�E5��B~�Vy�m�$��ލ��<�h=�1.OR��O��K���� �<�>'a]�������Cda�a�o�[�����n�^f�.Q�q1!]5S�PC����ob�|n�h�K ܚ�ѕ%r�X��y���`��'A:�Jە&3���H�DhC�|MUo3qq}mYԐxD�k!���}�
�|��q)�����l¬@(A��;;��[b硑����p7�y 線H�9'm����K��˛���~�**��f	�¼�1r�q�%�V�$�ar>��%��,�]��)��h�T���������K�9_؟����W����6�5��X6�������<���	�< �nN@��F8�����4~#��|���"د�� >�u�<��EEp����<������;[�Rp�rs��j���"��i���%���[�x����;1�V�+�$������B�w�m#ʨ����s�h �[8<��aQ��D6!���"��$G(�� {)�~�G�(�s��pe�9'����S\�='vi�s��eA��ym�;�m0�Zq͈�n��z�j�=���n�=�ڣpI,����hI��oz� ����L�M�A� ? ��!b3�e�y���A��p����/]�������"���w��)��_��"2�����sNm�ϑT5����ť53|S��!k�2�%&*v���B=M��+@�<r��Y��:����׺��L�hB���9VRw�IZ̦0��a����	r���|h���Ҁ���i9��S��:� :��-���9��/�M������]D�;�c���d�45j�%=�G)qG!G��ف$ 74i��ہ�Qs�ckLL��O�?Ґ��W?^�L��w���k�5;A׻��@���X-qߗ��M�F�/!��O����3rO�YZ�ۈ�c�LҲ4�l�H�ԋĳ7�`	:G̢Ld᭖�m���9nR+M�
�b���U`�	`��$�0���{�AΩ7	M�� �L!`,�q�E39p5M��+�� ��w�U�%;���& p� p>�ySSl#$����+*k �/J��uȻ�Gc��� �Z�D�옱V|�漊�¾��SK�<B�#_�{�9 �(xs�@�� 8�/�<��Ϫ$����YP�9An��"��B�՜�~��,e�c�)H�y�q.繠��C�6?҃5�d$�D8�.>��A��֚���=-�&�|�xղ�������>�>���K!�^+G��V.p�,��~�"(M�D�q���uC[�C[!x��jB63�S    ���d�?B��#[�F�� �ܷ[ڰ����9)�sC'�k	�,�a#C���o!#"޷Ռ�#��>���Np� ,�{>e�9r!�4�s�s!���^K@��@����#�2��\���������zǾ�8*�����	Lvk��|Z���l�;+	8'�
	�9i��U���!�W]#���1�J0���8Vט���W�yd*�s2w^�y���7 ��B���!Z��:��h�ЁB�>F���I>Dq���
����Ej�tc�٦װ��O��!�dq�����0�"�z�Y��S�6�ō��ʒ��95Pa� ��V\��l1  ��~�Fp~��@L,��ﵬ�l����*��<у ��~�1�s��\(�����O�SA�+�&����ޜ��s���{��##[�w`�<
o��I�R��{�߄���7^�9
���+��M�m_n�ۙ�����	�X#p��4����`��&p�R�j��D�'���UbpsRi���:{����O���������P�h����E��W*�ܜ<�L�^1�Mn�i��YR�j~i�#WpI<�psP"~�MCWnn��n�M�.j�L���-�N��!´��M�E�u�K�i�@@���3V!3�5���a�QT���q�����OS�nNDo=:�����[n�����5���u���KԭZ�Ě�g�k���O�U(�Gm�b͗AT�9�."ҵ$�xk�c��3���/)��RBN��{Q�#����0.�.Ԝ�픝} \ß�rj~p�S�mY��+�h&24Z��Z�@���%IAaX�>����E���ۺ��?�Eh�n���ba�b����ׁ��������B	8� N*,Y���J�>��":d2q1���	��3B�����73u���B���0~l���yN\�e����<V��V�&���j��*�����5����L�^�*WS`s��)UA���l�Rds㧤5��k��V�.V��h+�2���#��,�[�6Br��Ì ��ݴ棓���5��9mQ���d�-�}G�`�BJ�D��K�+hK7t�)��\�8ݲ@����A-����M���	�#���1����"�Иh�(wĵ���&[[�q���`��$M�)&��նn���v]��Ӥ��s�}#$��4�`s��Y���Mm��\Ϯ�y�ls�'�)H�K�4�8syl4�s�a�㍇�k)QCT�q���D���$(�����}F5L��՝��ڋ&s��n�n¤�c6�������~{ �6 W'��nbs�\�&9&u��_�:��c�ʥ����g�0B�{%.�q��n��z�A��ԥ��HƉ�حC��<KܼO��ܜk���3�`p*�h��+�Ѡy/e��	!�|	/^z��6�����І���j](�ɠ))��o_r��hr(^��M�#s�����Yq���)�Jn����ȇ�8�T�6�n�c�&�T9ś�{��V�����|���LO4����n�v�m>�n�~��?br�/Qlӭ�z膜��HH�g��=N6Bԡ�yO&s��K_��q�9� ��Wdc�*�
�@��7�f%̓`nQx	)o0>�iY#Õ��_�9`��9���T�tG��t3�Ϧ�e���L�����dU7)()�l��2Y�����#1����LA���pmE8¾{�٧{Y
�:�%mp�Z �"3=�"/��9��sV�<^k γ�o���ȱ.-L�6�7ơ��� ,2}8�:�s���U��5Bk�T��Y�yna��&��o`�҈�g�)Lv���η��R��� �ɳ�شJ`��M7R6���%i��Y��gi�ֈY���7��m�<���
x�(���&r����%o޻y�{S�#l�#��f��j�=Qa�*d��&7��:�s"�3�.P)h�#���/K� 4���-��" 8'��96qaY��7��&N����"%�4W=V�e|_��M�&���$��l�9�`� ΁���];��✴�H* �'	�l>���� λ�̻�ͩ|�*w�˻���e�^0�m�k�E,����T��i}�5�9ɡ�4{
3<���|� � �z[�y
ȹퟴ�j���	��֜A�FV��H9+���{3睒$��Q��A�cVqߡ��M�6g���y�� 4o����� �ͺ����S�r���9e�9Z_!;:��{^�@�/r��E2��9�v��,��ǀs/Rݛ���DhR��#��wh��H�+��
����m�9hW
�	���X���?ʘ�3	������{�근�h����5-SQ�Z2	`�"�p(~��.�J ��
�YB�cxuQ+��9����e��m3�̷3�R������<J
S���^�l�FB'�1!�Wy��+p�.�Vӡq𝡹n���-fE.h�{0Bs~H������$@��6�y/�th���.�<�?Ss�p�.|�L�6=��#�s�:2 ��]�f�|���sX4o&� �m�/�� t@r�S�8%�����Co$q�A�R&1JlSۛ�9�lR ��o���h	����B+�������)<*���8gG2����Z���K���]��&���퐯�=��S��AC��e��Q�,��\��<o�ٗK������ α��xZ�m	���ߘ���Chk��\���������@�YN�͂�>V�9�;5H�MJ���ڵJ]�+�k<b�xs.g�\&���$����2- �ֺ��)L�-QOJ�ޭ����$E���a�m���9hR���WȩN<��Ly��擐\h�x-F���d��yI{����QJN!��Y(�x�3��	�T�	'�U�
�9H;�&�Z����|Su{J9����� * �ak/����w���0��RT����e����˯F�δ�\�0ڜ���?�9�e���G0K]�y��Hl>�z`s��rLl�9~B�H���
�l�sI�	hPJו7�y�;�y���h.��uU��;B��g	1�95�1�3��?@�;Xsj�� b�;I*�1�U�T}B����fX����;H��H-�9ա�͑�����64Hw��/S�)(�`�Ԝ"����o�o����v�*�F��j�eN �u�1J���6�|�)�j���`�خ���y�p,QU���?�}�:� ͩ��mc��fX�&�r'	Ps������O��܄w�φ�<�zJ{x�l@͑(�<^V�U	�9���d��� ��Y[�_&5�!]�L��tD�K���]�zU���iZs�jyA{���/�
X�nS�i�-�*l�� ӆ���
�&�>ҿ�N"��C�DF6����栣��Д�5ǪJ���3��p��Bs_/��yU�����ׂ����.����s~V{�YZ��;P�HX��Q_�l���w�S�����F]YƠ �|�yݧ�B<׏�����ldiY��:Psr�>��(,���^�E�ӣП�{��22�en��*v����Q l��r�Ub��hT�Bs(��|����5���k{c4أ(wB�P�u���^sR�<�9���>��9A-(Ӳs�Lk���s
���uu�7�H`�7��'j�1���S@�Gl,WڊC��B�u>��59=��Th��Q������́�C�(�	�9����e��-(�iM�>�׳� �#ar�BA�|/V}4\�˰�Eu8���"�9�s�����@�0��Q���c>'0��Ȁ2'ۙ�б�Q����|7C�2X�ޯ��d�&L�̱���)@4�7��p(�͌U0�C�ih?���>�� �f�P���l�*���7��4F�'���"Sa��9v�̉��3�-��8�������Q�v����LҾ
�Y틞9��Ĳ�Q��*h*$��E���K����}�GJ#2�@�龗��$D�=�!��P�q�*7M�X����2��T����: s�'��`�������J�\<S, s`Cn��x��oZ��-��=x���X    s
sQ��|Fї{��^�9!>��������Cc{�1'��M���z��A*s+��8Ҡ0fN�j�/�Q1�@c�j��}�<�hL\���θ4D��8�%ocN4Z�]W�?�a����Ml.�
�?�84�16is.�Er��LpԏԔo��x}�(����{�1G�l��K3�_��QEw+��*$�&;�xH�E$�0���h�&Ho��D^���ww��1��e�9l����{?-�-��Ř�یe���Ę/�h�E� ���()l��UC��6���h��j;`��6a�pm�^0�h|�rE:`9cNY.E0�侲9z^{n��!����H)h.ڪ��9%Ɯ�"��Th0�y�~�'>����u@ڲ�Ӛ������2� �w�vӚ��"l��QBힷm�S��^x�q��� �9p5O��rʞBwUc2 ��}�$UG`	+���E�v��*�jf���y�~tգ&縦%+��9����e��E���Ɏ������\3r����9Y�`���>�I`�T���d�R�����2_f���)B�*�2'�|ʜ(�e7d��18s*���+��_hr��^ez,�����2)3ne�%�����#�R@s2��LJ�8�S�!8sPZ�*S�[.�3�+oE��<Y���݇�̵CAl�D"� ̸��m1+$C`�$P��f����u�[� �q�q~�a�s9�g��ہ�S͗I��-�'�2{��Ҡ���uy�4Ti��h'j�܃���67�TjN��s������к�1���@���6i�I�@�)��x���X�B��S�4Z+	��kk��%�Z~Eu��Űg����9��:�����;��c�9���)֨�L�@�)��y�K)���ܨb��(�KrD��j��,�Z�ڢ��~��
yI�9���8�ń��|Un�!��j~WԼ[�[5�$�6! ������,T`
}^m?w7��~4��1 ����4�$`�I�� ���9�34�y�[������'5a���A�e�ߤ���vx(s�nB����r	:L�(�wCk;pV�q�?����;4QXE�g�XݔHA���9Vҽ:�A��O��K�z�����Y�iC�~YE�7}b�A�_h�o�4:���Ե�b�7H4h4�����$o-�Iv ��x�>�h�S ���.$F�!Ҹ�>�����,��h\c�өX��4�w�X Aß�†������y�NM<�w��ɏ��|��@P����&��U��Ps����Q0UP���@NyCC�i��i�:(h��|!�a����ɴۤ��Ձ�6̛1lc��+n���c��l��4�=Mf�ćM�ys	�������d|^m%]
`��#��)��S2ј�8��#;Z�uY<��:(h����xį�:(h��ؿh�G�A�Z�<�p!S)�Wޫj#���R:["��y��&4p􎀂�$[�Ъ\�k��Fu�.��V��A��â�����0�Z��c�F�TvM�[� ��5W��&s��X�j�ЦI�Qw��6w��^�Z�$=c������w�$��ӄc�w���q�����{>`dC	���S�AA㳇��W�[��5$__� h��$�l7�W��̛u��̀C�\2���`I3ۮ�
L��${낂��g��H ދ��9C��
��=�����7��߁A_�8�x�Ɖk*�{��ìZ�@A�t�n�0�`��=�CޑM��# ��LJ��k�H�A/�v���F���K;�O%�vG]�LM�f�����0 hJ�T�ML�z8�o�U��q@Д����~�P�A�Y-�A���ASȚ~�e{���L�@��S{����&�I�тP4�;`�@��|w�&a�7�.\���;�hJ���G��W�)��i3C��l45ю��k,��W�A�%�# F�u����/RL[ɥF48��V�[~����V��x�r�*��Ν��ȥ&�� MƮ0�!n����L�b $� EH��z��L9)4F�KNJ�K�`�D�G���� +�D�$�.�k<q�<�J��1	� ��9I�@�� ���)Цޡ�� M��Ð�S�R(4���x��պ�|E�p��s5�����!�ݟ��$Fi�`��V�}�b
�CQ�
�<
�cIW��?c��-��`� ���X���Q�����t=L�m�p�&�oLD�N���M-SOSnvB�����!l�(fH���[��B�,H�B1q$�!
:w`�{�k������N���6�'�H�E"b�ŉ�^mV%�34����E�'"���J�E�k\]��Vd��͈��=�L�����^ܶ.E ��'N3�2N��Z
URg��Tw"��5@ [EuT�&�4�#� mb^�kD�&W�������Z�e_4���즊�;3��pЧe�@�����i�'�"Y$A�|��׍L��%s��R�G������'��Z���k.N�5����?@��k|-D��Ã˨8�k�^�rx�D�N0��C��5�;9Ͱ)���	ZX��@�P�~b�5��z���چ j��Ь��bqL��=�rԤ\� ��Z�m�=����)�J�6R� �FQ��gts�%ۖǀ~�Ǘ�L��ie�� ����u�	�tT�:^���!}*�o^����g�\A�Ɖz�j̝�&`��Q�c�];�>߮���f�O�4��2�\�,���i��8|%�R���%����Y�|H�;��d�^0UyN?�5�K���"�`3q���S֘L���OO�@��c2����^��)�A�@W��:��t�ui���v8�?0�����	��n�a�mX`��n2)t��d���^���ȏMn���9�ٻ	�����x]�)�g����t�����j$�F��9$�q��d���C�S�^wB������1�R>4��%uTҎ��lO�����E0��T�6���K��Q�nR@;����-�l�$U@gnE |�+��o�x;w<Xs���oMij��y��i�7J���xI<p�
#W�C֐����ӂ&�O.���t�?]�5l.YE`n��)h֩�H�㡟!X�l��I��O� � �G�ٶXh�F,E��x!��?'��2NB�>L��K�J�̾u��æ�}�4���֌�/�gHʵ�:��ʍ�C37X�1����:�,!�g
�O��?dB$C(v�d�'T�ض�|��"�V8ri�)ɦCC�,�HlD�d�S�[Qh�o{l�R��\F�⦾GZh+�w�H8Y�� �L�\�3n�	n�x��R�������?e<&��p4�!�a��n�}r	�m���8�T�]����K�K4��"h���l3,�� @cE�)��9�[3�1�S{�T}����o�Rp��a�s�<�  �xE�_H�F�)h�{B t�" h��^�?.�{nauO h�vѽ�����RV)�?���v��@uP"�H�! ��|�mG[��þ�(���_��	~g\~S��L~�n��ٙ�vQ7�>�������<�����qh>�9ɚVln���	�9R�u�aS$��WLz3�4�LA٧�j7DE���4:�� �>����8�J��h!D �R ?��/eUT�qd�{Є�;�.Nz��$� t/��L�+ڨ�y>�>�������m�7��l���j��nT� �L��m{�j5@��X.3]h"
�tI*v�kX�>ן�\���d�g��@�M����@!���\�C��u�}F�B��|�I:@>�	Q��z^D|z�:1�� I�)D�2e��.��
ɅG7�-�Th>,��?��r�@��?G�a��e�=��d�Y�j�h�Nw�ޢ04�ѣRԟ��}����k�3��ޠ����p����a�m��(��0|��ʯ$���F���6E@������k�m��ϔ��˅aHX��L    td��lv�]������K�˨��q�z�� �T�MF���������z�������N�!����ڍ�?*4��Db�˝��$�>���zU)�L���w��C�ӱ��r�)ڏF[�%@�����

��s�!ٶ)��5,�y��)�`1ǹ?�>���M2	u`��y{4
��C����>?�%�6�ת2���m�.&��`+f�&�pAw7���0�k��|������a ��ܱP�,�����h{�� $ϟ�����M����#���x��J�ƼY��DtCK�&�sS��C�c�o�9�G�3$��3�ٟ�7dj��Y���:L�ݞ"���>D?SK�7�o��g�(+�}`��sXfy�g"{a�����m�5Ǹ�@?�D����~�ā���_C��!��'�(��q8�ЄITo$�ϔP����JOU@�c���S��A�>��Q�5ؙg��=F�@�F���3*�g�'�RӠPU�߳�;
=��`��v���`j#!m1������ 1?��A^B~���uhz�D�R�I�����U�����K�xם��x�mN�3�a��"��⠉t���x��mϏ� �稻ť�f��易,��S����Fn�`
��j�����s��o�n=L��Oed�zU���a��9"h��1Y����Du ���p;Z� ?�G|_��g̴!�{?�ق?����&�jw��ᘞ�\ss�5?���=��Ej�mn0F��d����oH�"�9[q�Lۗs�>5�;����}��
�a�~�D���j�)z���)Yu�-�C����ʗ��&'��gXl���{�h����4�MA�,ۦІV��ȯ��i��8�fD�thy���Gd�����/����<X>y�I�-����y���ЃJ�W���x� �M��J�5J��F��}�Qj�y��K�����M%�D�� 4��!�]n�d�5��&&���	 � ��I�9�4��q��Xʆ �q��E���8�F]z�l�M�9:ށAc[���4�T�%p���+����\�dE� B�\��Zo�?��q��z5iكT�&d��E�j"{�O�A��Lqh�Q��%�r�`L֒%��L�Q�!c���7]¢�.�����6FUQt�+ȩ���?�������S���߭ ��Ҡ|���K3�Gu�U�π�����.���oX� �LC��S1ʪ�d�ŝ��t)�������^� ��I؃`$��(aV��o�����A̱��79 @���*3��6����AS��i����(�b������
Є�C&�9�9<@Ӂ #��XFglO<�gl�~Y��bMЦG�6�V4� ��sZx0��2�*���:[����`N���ء �л��iA?"�|.6J�
�y�!��I�M��
�]L�����g0��6z_�����4�A��F`j�1��z���9�*������-�\�iy�y��4,�c{}��f��\�bk	���ڰa/��%�� �|����Ju1�����3������ 4
~��ɢ�ƀ�CQ:�DF`5?%F�>&�y7W 9a���^���6����yi/_���uB�U2I��L>|ƀ�g�� �L�j���������2�*y��=�3ؒ)�s��17������"V��ٵ�U��x�՛~*���u����)�1�Q�oK� �(` ���������q�oA���;�?A��e�7۠^�^�t��ق���������R�w�۫�ڜ"�uiC}J��x/i��N7��c�2uF�c���Ǚc0_S��y��S�Lv!�?�gr���?ο��0N�걍t-j� �����,*���3�~�RM?v��9�]�6�oQ�@
��8�E� �\�	�IQ��H���g��\���9<^���Jmu�!ߎ�4c�a9r^�7 �5ьı��9�Jy4�S� �~��g�<[�y�)�m���0	 � �b?��Z  }���k鎒0eu _�,����^�������]�RD�I���� �
?�5��ᤫ���q�*�k��q8�ن�ݪJM�����/�؛
@ԥ�`���F|�e�#�d��U�y6��Z��Ld�+���=��[�_�g�����B�4��eo�T��61mG�z?�7�8��x�Аi�6��N�;�v-��]�$i��B����t�r�K����E����x�:8Gs�)R��B#a�;�m%K����o��%�f��\)�������7Ɏ�j��x�j����mh -��]����h�?A�c�����6w��0�_�*��,�f�"�{ǅ��CoM0ʲ�M�d5�f���L�Q&��l%���5���p�3o��c�(�]j�ٞ���Etz�QX�u���ۺ�6)L�k<���<���}���%@���y�V�ޥI�l�u��l����:n���� ύf�[$��ǳ-1�s���������/�������R�A��.g���´��,CTa����|��?���h�[�;��W����{y٘���<[�ݘE��}8�� \)��]�J�u�o�f�x@̕�zA���O�����L6��q�{Ѩomiv�Ø�� 2G�ev�Mbۯy��= �C���@�rn+m[v��U���Zf�oG!o s����.��m�e�{�h\�:(�E�N;h�@"f�������|�B/̂��i<�r_�5�TEU�^�еs�r��G0�*�k���|u�R�P0��0�@�#!��g?�F�3Q}#��9Ѯ�縃�ۡy� 棭rD����W߸�\<�z4�NOE2��|Gg;�s�N�7O�xAIvs���7�mY]P�z��0�JH��!ϫ6���j��M
5�,�1'�e� cY �P��Nq�2$0�3M��t@s�Hw��c��)i�P�3��]R�Zgu'�J��#�����>eZo���|�͵}��2��n͌P��<���[K�U���]����| bu��Ū�]��2�3{�m��b~P�)3�W�M���mU����/=Cgt
2ǲ8;;�9�
t�T`�︶��􊓥��=3s�>�#�92���G9��f�2�=�.#�|�o�QmϽT�2'l�m;[%Vt����}��k�6����6�،���u\Y)��0�%��<��~���*Za��rdǱe1G��N��H����a�a�Э{�q4�1��}aݴջ�=�$k��Ǯ�j\�_k���u���\���a̩��y��{�W����'rH
W�}�x�'ЧyI �٘`�vƐwO����>e��tXţ(��i�͜)���^C%���r��	cކJ��_}1��OԪ���FA<�m�U�]����$o��g��h����ٖs�G��81�1��䦰Q�͵@��-��RF���VL�D3�FD��}�����!�A���U�|��M����5����W_�*#^,8W���~��B�/�$����]�����#Ƶo�q�!�Aj�桇���)�E,�N����b�`����؎ �'�2��}��v��m��`.�����J�K��~0��#��C� 0R��Ȁ0f����:��'͂϶���5���F�������ɾ��]pӫ%2t�8���Fb+9ţ�~6����TTȞiཱུu � 0W�����,l訙��aN�l�W;��1����d��=a���r�����V#���Y�'D��](k�� i�Kp� �8;n�l�!ZN�Ǯ�"QB��Ĉf�[�6j�)�8{&:���lN�y ���Ψ@��ZJ%�1 �O�+ڄ0_j�ءv(���S8z�c��n}�z�d��J|��6-4��(w2B�����9�����ݛ���qR׻ok)�PWמl��Ҹh���'�mI0����q�~��s��i��-��dty�__��\�G票^�3�7��b�6�.҇��\:�8��䥈x2�84b5:�s�G�-�FvLvxJ�"?�׮����b��kG� ^��.�|�a^�+��w[5]
&���m߅J��]��Tl�4�{0��^# �    �3��ql�Y'��������U~���URۘ��o�:��8SH��9)0�����R~8@�כ�5I
 DuؽT&HJ���8E�G�}�1�3Ć��ie+�=�8����U�xGϤ�-��'�g������g�|Z�<-)nĜ�ƪ1d�I�2?�K����l��G�� 1G:X3�Qg4]�ֺ��նY�F�ڿt}���߿���/         �   x�3�V��O�I-K�Q�2�qsr�S��3�󊕬�s�Sa��E��(��9���%E�Pᒢ���̼t��s~^If^i~iqN%�:�v��pQ��̜�,�B$�4#��RZ�X��^�3�ȀW���rF�r�q�q��qqq �/[�            x��}moe�����0�|�1Y�Wa0@f�x�d=�.�K��Һn�-i$uϯ�*�{�xDVQ��^���.=E��b��7ׇo�>}xz��}������.}^J���?������w�o�|���z:|}�o�X�|�o�o�|}���7�W�?}<�>���7�~���rs��ˋ�}z|���{������Ӈo��^������՟��rw{{x�tsw��j.~}��?��.9<��]�������/|yu}u�txx�����������Oo�=�]_=<]��.�o�t�n��w��z�%V{�?@���cO0_"0"����������������?S����{u�v�U�?�H���Ӈ^U�K���ʿP����������bB�F��������n?��T�ڰ�ݴ=.7�7O74�������������ݧǋw�?=����Ԡ� ��X?Y\��������������p�/W>H_mӰ�N6_�ǫ��o�}�pwˍ}��x�}���O�+�t����l^�J��>ѕ]���黯�����-A~���.'�d:�V�'�KL8�LFg2:�љ��>2jx�`OF���K�.�_�|2��a�\]_�n���AO��.~�{�_]�<V��������ۋ�����ps��$n���z|j���n>�����W{Z��|�p��2�UuR^�_���{�_�����?��]"6�t{���ڡ���L�U�8�2�|�=�<�=ݽ���\�V~��	��}�Gr;R�����᛫�������������7�~w�p��n]5�l+�_oﯞ�}��}x�~����ww�G6�{x���k�4`�&�'���A�@y�O�w6�z^&��L��_�R홚^RS�:&��� X�G�6_��9������͇�~����w�����#$���V�1I�ES�ڥ��KR�YWte-�	Q�YY&E��
�eڵ�8a �E�җ![�4uQ��Ǆ$w������qڹ�I�P��%b�^�6�"-�	Y�X�ĸDj�տڬc��	 kˋ��9eF:0׶�$}4KF���|���	�D+i�=h�����HƉ����x��y�����9k���1�)��K��jC���m8&I��H�e]��<�l+�����(����LR>���Z�s�I
쒓��+��ݬc�I�Z���~dAe,g]{�1�K��O\
�Q>���N���E.XlR��^_i;�M����6�*�l�a70��ǌE#m/m��X[뙵���(n3�7#�K�k6�j"c�p'�QpIٱ!�َ���(�`�UD,���d�iqL�����RtE[���V[�CC)�o��&e�&��ӡ<�(2I���;_��I�>/�[ "�,9QՀ�8�?�����UV77g��I�&J������#�09k�8&�[[�S}[O��2%�l484��I��:��+����C��$n���J!du�Ф�wn�1I��H*,4����Q68��W }�L[n�����d�C�Ɠ�J���&mˡߟQI�C�Ƴr+KI�+}��!yC�Ƴ�J��g��%@;�\�	�ԍ��*F{|(%(C�'��=�镭��u���>�:'�Fγ��l�<9Z#g�:��2�h�#����i���;3ԙ��uf���P���qB>�g�b:��Xҙ��uf�3C}V�j����6�.Ca�\��=�Aq�%�%��c�C"�j.�%�UXR��ts��.ʒ��Y��ĒA{ߤ&���'����Q� 8�Z�'�{���*��
$�o8yt���PJf7�� :��:���Z����Qqɀ9j��=�@LSH���-6BT�XTc��8��v�YRH��f!(˭�1y���6
���6I��\��1y��BRp��(����K��FR2(��Q3�٤���<~	Y���h67p�����1qU)"SG?�	�lR68&���*�K�N}��ɻ��q ���Gм�0�/�{SDRv��4��$!�'�	����I��PI��{�c�Ȓ�.!���w��w;�"%�F.G�hg����"2�%���r,A6�O�m8����/m�����7����8��\��8�!�O�8����J"O��c��hg����"R	I�B� �6~&�j�p��"�$f�9k��~6'R'�If򦃙�6Ln��R'�If�N���`��]�8�N����.�i�Gm�����r�j/^?�`H�D'���a���&��=p�C�$>a1��%k�ʹ��tIlBb�Z�P��!�k'�~
��`�O���p�Z�>Y��D�H�\����8'Jp|�Lt;)����̰�!u��X\b���w8��Z�N��6�PD:�"��;Y�-�����]�R�������l�<�<&���:���NB�tc�(+����LMgj:S�g�����{�?a)��ՙv��R�~�P�ơ�O_������bKwPS�@�'j�K6Z�ں�u�ͻ���x����ه.3��Jc���ihj�?%�I������/�Ɔ��јF-����/���2Nx˼�-[y���!t�������C�����lWy���1�Y��6]Xw|����4}���7�7�o��}æ/����K2�Q{��bP���٩�1N����jR�X�p�0�kp�w�U���E �$"���n�!u�UؠC.N����g��Sr��A�V��Y3�����p4k�+�X͖�z����s���CL4��T�	�R
���~Q�a4���P�D�c}|�6+w��<�&'�@49�)p���0����#���bԢL'18-�L�n�W��r��̑2Y {��*�C���.;�i@����X�1�k,v��L�?��q�w��e|JA�t6̌��a����/�i2(k��1R'��W����-q��TipH���bt�Q|��9��!u"Y"�6��)��<�:����2�6�f�rJc�������ұ��cG�$�	�֔$-���xW�8�N�_�����Ζ{R'.����hm����qH���=�QȀ��ġ5Su���{/�O�׏���qH���=�s��R�����6����0_7(M[yE�N8�N��Yi�E�>RN�C{R'�I�L��GՃd����'��_���6�����p�+Q��gre�Ĝ���p�Q'����n����I���)�v����p佬��6j�x��63x�_MX8���*������x"�������]}����o�oYO��������WZط�ɲ�3�w�rf^��þ�xu�������?{�2��S������pl[�~w�i�y|:\������$Q��A���� ���RD��ߕ��:~O�'����]H��|�8��j���~X��U�e�]���<Uq�۩�����Zb��^�^%SaS�v���hq��W��(��ts]S�c)}:�����lf�3�� �?�q ^rW[��EK��e(�☁��QZ�~����Hsf�3۟����g�۟���)NR��Ѓ5�hH�'�ߙ~��{��3����5�{"V�TȫI$.)�W�#'qh{3�2[�-�SkB��1�c��3۟�����\���pf�_۷�jn�G���{�:��e�A�rb��8!�}� ,>F�M.ͽ)3�=6*�G���8�&��Ic.�.q��f"O1�$*W��i�0�	i����0>ͫ+�|�>�:ѣ�sZ�.��0��op����ep�V+�kx���C%ϡ��P�s����6;�1?��T��%X�X�2�V��LQg�:Sԙ�>'E5�c�=,Es&p����e�X+��X�}����(B	���"8��E�����B����(��HCR���B#���(�`�r�:q��o=������__�D�%��TAs���͸�����i]��?SM��Y�'���kр�Ґ��6��'�x�g�j�˚j�$2B�$�q�3fJK�fz�=���7f�Z���Y�8FZ�R��>�(��1B�b��~��Q�֧�C�Q��HR�����j$'�յ58Fp�����c(j�    u��l`�Y+=�bV����gc��ȵ�5(G�KO�� ������I��vz��Q�$U��C���e��$Q��!(r���Up���ж�!&��L�yq19��;=�s�c���*,͡�&5�g}kp��YT�v���c��f}kp�Y��lfq��&���ᐫ��M�{����s�c�h�*Di$�UTp^/,��1B0�*�|T�K�<������g����N�i�a�	�/�ם�6=m����� W��DY-p`���{#DA�T`/��@�!N�%��1B�*T��C��B�I<�������m$�B�Q�y��1Be�U���G-xuڷ���}M���Ƥ�^����1B��U�s(;�Eʺ8#��U������h1�nR|�c�Bϫ����� [f���u��9\�ܗ�q��ٱ�1B��U
��>�SdZ1��1B�������!���&d�c�*ϫTZ0j�s���Wkp�*���nXY;Eҧ�?.Q�6���Za��YM�3/8��P��,\��%�H;��+L����V!�cj#)-
L*��0�M������Z����s�SE�����.���58�N�/��$ E:o���K��qH��sYx��`���f��Jx�5�#n�E�.�Y����I�*,�:�j�l�su��|U�fm,@�	-��$Vl�C�$�"1疄`��9\rm��C�$J!1`[Cq^�ڐtc���I��b��ڜ��ɔ�Z�*n�:�s2Ŭ-:�������I����y)Q7��|�ZR'1
�j%�m���9�����z{�&�Q,%ԭ����c�PV�J�I0�cN{�@9�l�0�L��vٴ�i����tU-�qBM�*��B���֋�y·0�	5�r5��%�Jz5�	/�8�N��,L����QQ/��!u�p�WZ4{�����!u��X�}�$���6�fJ�C�$2Y��޻����T�lqH�D&�����z?�I��=��؄�(�编�jV^v�c@(�V�8Lۧ�&��ea�c@(����%��S�%2!���I�Bb!ӥ(Ͱ�^�r�C�$VYŒ�EKt<?[�8�Nb��Y6Ti�Q�0ւ�&�P�BŃ���;�ǀPW��!.tL-ZJ`��	%rZJ:}jS�#���VR%�	���`��˒�K�M��!u"��c���ygK�1 �T�bȵТ�X٧M>Ð2�Gx�_�MI{(��f�c@(����!y=R��H�C�D��ܗ��l�0y���:�G�Z�/��ݔJB:�U�T��x�O'3�lpH�H&�9��ԇS�ue�C�D2)|�j��I����TR���A��^�-��ԉTR�I ڤyЊ��;�ҥW1���֪��nv@oq9�W1\������{�c@�Ωb!-�+��I�`hqH��'���<NrO�-��?���K�x��>�xZR'��Z����ϵS#TC�$6	5f�e����q��ZR'�	������U��=��K���͌lӞ�\��lqH��)��r�V��hg_�ƀ�S��	r�j���dg��:�Qִ�!�eA�͖x�c@pةb\n1�	�af�jqH��(�:�v�L�e��\vrͭK�'�ٷkpH��(5�{���0���9%����\4Ú0^W���:�S�%�C ��i6U��N�<��iB�����{��NC����MY3S[�c`亳>OF���mH�^��x�������zR�3�sy�:S��l�6�3 00�:���BHQDT����������}Z��|h�`�|��F��G_Tb��Ĭs'#���T[���X��j�Cc9�r� �%�쵊��˧���P�ļ�*�i�h����ᐺ1���^��Ʈ�y�����O�:�z[�JDAVn��n�l�¼$ڝ�U����!u�}`�n	N�J�CsCc9^��	�v^�
Z~	C��ӲJ-����q���v8�n<-W1��uN��y�������4�Z����F��<ov8�n<M�m�1k�!:Ȫ�<{R78.�b�Md9'�c4��=:�w'Y��U�v�b��pDi�CW�݀�}�<��kCڤ���<��I���VJ��!uY�X�+f���7���������q�����W��pH��(X�F�3�v3F��H;R'1
V*Hɫ�D��u8�N�~y�����8�*��QM��X\�'�h`����:�R�����ۯ<U����:�TX,s�P͠=�|��%z��j��l��Tsv8�NbK8���J��pH��*�����-L[�lqH��*,FDNpj�;T^p;R'���ū��s��c�D]�C�$VY�0����zZ��:�U�e!.s�|r�)���I��b���5�G����mu���4�T��W\:R'�J��yu7�^(:#��*,�DۢV��{�c��!u��XY�Jۀ��8���I�Bwv���N8T��_2�SX�/6'�:�ٗkqH��)|�E��E����a-��8��"?F�o'���I��L��1\Z �Z_��!u���o���������o�	��g��`Ո���v�c`为�!,���fw���8F��'�����2�Qv0�lL(U��H���7H���y��b���f��o�;R6&�B�T��U�g���!mc>�b��RWeV8�F��!uc>a_a���Q��7�)��*E��A5d�*Y2:R7����B�j�C������pH�D',���1ja���k����skDL�Q	ك�^��=����*݄��aP=}�����nb\8E=�]���ᐺ1��z룭�.F��O>��ԍ�$�E��a����?�aHۘK�4m��v
�W�Ƥ��R7��K�/9e��r��]u�cp䶊�'�7�ŝ�M��ԍ٤�� �MV{��]@�8�n�&U�5�Wz��g�C�$6aw���BU��.]�����{u�@��ϣ�5ԓ����}uC�mb���r{�#��Uꐗ�:���DLt8�N�P��������6�=������(H|�cS��������He���d��Z��*�pH݀TNb�恨�Z���pH݀T61"rˎ���KP�{���k�z_���EӬ�� =6���FDǥ� ���:�#�U��ۅ�1JpeC�l�<r��4/�';�#�U_���gA�,h��՞�a�W���<݆�j�M��q�C��L��]������w�3�*V��A����8bu8G���{㔀Z��u�!]	<s� ���	@������!u�b4y��"�q�Qٽ_�y�nR��\P#U��������b��h�T;�rB�`HۀKV1N۰мU���l7����j�0N��:�!�����!e6٤���r4C��,���I��?��t�ř��!u6	��]��_I;�ql��I�q��ͪPRV�;�#��*P�oB��4�����iu�@Fڥ�+Acp䳺�j�G�E�ju��q�|Vó���A}1֒�u0G�������1;5�����w��O g�E���k��/aH٘Q�#6m��Ju��(ka��-7�@� ����ĕ�J}�veIQO}������q�5�F�QVMZ��:�P|�~'u���؆:���s���K�t1�ޣ��;R'1
��BM�=��u���yp�b�ۮ�w�};�8�v8;'g���.�RZy�q{'���O�\����FUI�F��%��b�����뎟�ý��3B0ع�6b>W��8T�������5v�,r"j��1a�H�#R��>Nb��0Q_��N�DK��;gؓXMs�NDv4n��3B0ع��b���Z���q����df ���<�H�tqɏ#<h��nh#����I�%#�X���du��;�דrgJ���ȋR���Y����0%�[��'h��;/�M�Y6\xb��>�R����`��zs���]֫Q��J9"F;�֓��L0&1�����������F��(f� ��!!�=�m�[�F�żF'yW� Hϐ8�w���@��軁�h�@����bk��,�yT�q/ �  v~���b��{�^���Mm�{� �<V�4:�Z�I�.��T�P��a�,A������OO5^΋����M�$�j��D�?�4a�
i��&����Ŵ;*
E�} ��q�a���!�IF�<j�� Mb����v��ￒ��ߎ v�'1�G�q;ZJ%�l��]`��Dm�Ғs>�{�z��3�0�y˜�9k�_���`0�u�π���p8G'�8�O��ю v^��?�t��
}�D�qτ�q�f��	O�f'�u�`��=59�VFa*Hq�#R$rV'���"^��Ac7�ݮ>:����n���� uH�ԚC��8$��K^A�DJ��xp���1p̏����!��qd�ʌ7<�X1k�@=�;�PgK�:$O�����w�<�D \j��bN����o�s-;u�p��h���S7� $C��`�_��q)A>*Ѫ\'��Ǜۣ!���j��I��l_�����^^���t�}�yW�^py�����r��V}+ö����������9<|�y�_�)�v*��em�����:}ӊ�nԞ��?�eZ�l\���(�y.�Gp��н�X��ɊťR,n4�v��g��xk��5g�y�'�����h�;g�U��cZ�PFW���b��v���ԫ�(Z�=����z^a���`�53�`et�N5�1��KCs����Z�;G�m!���$�d��{�rϖr�@��1gP{ruv�����X�m�@��=r5��[J�r�UKr@!�Ѝ�Z��L�C�b�K��p ԟ����K�[A��K��n�`|հ5�+i�%����>i6���/Z��iMj����%ݎ�G0�e8��Җ9ƈC�9��5B0�bh�B��l���.1���.|a�p�nxs�4�a@j��.�'!fΑ9�O��;;R4�9�0��i�
��&�=��]���­.����H? `����z� �M�Ʒ��+;�PIy	F��煣X��m�pц�&HI
�A߅&4b.�X�C�-B��o�`|�Јѽ+�i�@��+.�������0#r8,��]�%N�+*�HQO��G�Hse�<|�ub����.���f��L��}\���԰�Aߏ@�PQ�RV���]��&ƞ���冗��Rv���]��&j�_|sj(���Hр"S��Y8�,�.�"��!��3T1��W�����A��!�E���O����(����i1��_���      &      x������ � �      (      x������ � �         �  x�eһ��@ ��X�b���Ҵ����rjo���:<�J�KI����K�T�`e��6��M�H&�^b��-���Z����y�ֳp	PuY�c�+8@ �O@>������A
�C�_��=I���?b�/�K��ͬ��%�8�qxV��Y��͞�c�qaNt������;ޗ_�
���In���MMT����U��Aan��79ÍLq�!ܻjP'8 �z0�h����2� `�b
&3�_&�I"�,��~��8�N=_Nj�B=k�M}�-<�Pm+���q�.�����s�/�ٗ�Ar@{�;I��|� �ϼ͛<�F@�c��y��trT綾�]$ٓ���x��S�hsO֗�$
�`�]�$Im��%�.��ƣ�S3�!kdR�(v��v�<4�����R��F,��yi!�P�Ɉ�7"�u$�&w��K�$�/�
�|     