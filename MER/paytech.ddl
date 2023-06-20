-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2023-05-29 19:19:55 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_analise_mensal (
    cd_analise    INTEGER NOT NULL,
    mes           VARCHAR2(9) NOT NULL,
    receita_total NUMBER NOT NULL,
    despesa_total NUMBER NOT NULL,
    lucro_liq     NUMBER NOT NULL
);

ALTER TABLE t_analise_mensal ADD CONSTRAINT t_analise_mensal_pk PRIMARY KEY ( cd_analise );

CREATE TABLE t_cadastro (
    cd_cadastro INTEGER NOT NULL,
    cd_usuario  INTEGER NOT NULL
);

CREATE UNIQUE INDEX t_cadastro__idx ON
    t_cadastro (
        cd_usuario
    ASC );

ALTER TABLE t_cadastro ADD CONSTRAINT t_cadastro_pk PRIMARY KEY ( cd_cadastro );

CREATE TABLE t_cidade (
    cd_estado INTEGER NOT NULL,
    cd_cidade INTEGER NOT NULL,
    nm_cidade VARCHAR2(30) NOT NULL
);

ALTER TABLE t_cidade ADD CONSTRAINT t_cidade_pk PRIMARY KEY ( cd_cidade );

CREATE TABLE t_conta (
    cd_usuario     INTEGER NOT NULL,
    cd_conta       INTEGER NOT NULL,
    cd_maquina     INTEGER NOT NULL,
    cd_trans_ctgzd INTEGER NOT NULL,
    cd_analise     INTEGER NOT NULL,
    tp_conta       VARCHAR2(4000) NOT NULL,
    saldo_conta    NUMBER NOT NULL
);

ALTER TABLE t_conta ADD CONSTRAINT t_conta_pk PRIMARY KEY ( cd_conta );

CREATE TABLE t_ctg_transacao (
    cd_categoria INTEGER NOT NULL,
    cd_transacao INTEGER NOT NULL,
    nm_categoria VARCHAR2(30) NOT NULL
);

ALTER TABLE t_ctg_transacao ADD CONSTRAINT t_ctg_transacao_pk PRIMARY KEY ( cd_categoria );

CREATE TABLE t_email (
    cd_email      INTEGER NOT NULL,
    ds_email      VARCHAR2(10) NOT NULL,
    dominio_email VARCHAR2(30) NOT NULL
);

ALTER TABLE t_email ADD CONSTRAINT t_email_pk PRIMARY KEY ( cd_email );

CREATE TABLE t_endereco (
    cd_endereco   INTEGER NOT NULL,
    cd_logradouro INTEGER NOT NULL
);

ALTER TABLE t_endereco ADD CONSTRAINT t_endereco_pk PRIMARY KEY ( cd_endereco );

CREATE TABLE t_estado (
    cd_pais   INTEGER NOT NULL,
    cd_estado INTEGER NOT NULL,
    nm_estado VARCHAR2(30) NOT NULL
);

ALTER TABLE t_estado ADD CONSTRAINT t_estado_pk PRIMARY KEY ( cd_estado );

CREATE TABLE t_info_usuario (
    cd_cadastro INTEGER NOT NULL,
    cd_usuario  INTEGER NOT NULL,
    cd_telefone INTEGER NOT NULL,
    cd_email    INTEGER NOT NULL,
    cd_endereco INTEGER NOT NULL,
    nm_usuario  VARCHAR2(30) NOT NULL,
    doc_usuario NUMBER NOT NULL,
    dt_nasc     DATE NOT NULL
);

CREATE UNIQUE INDEX t_info_usuario__idx ON
    t_info_usuario (
        cd_cadastro
    ASC );

ALTER TABLE t_info_usuario ADD CONSTRAINT t_info_usuario_pk PRIMARY KEY ( cd_usuario );

CREATE TABLE t_login (
    cd_cadastro   INTEGER NOT NULL,
    cd_login      INTEGER NOT NULL,
    cd_usuario    INTEGER NOT NULL,
    login_usuario VARCHAR2(30) NOT NULL,
    senha_usuario NUMBER NOT NULL
);

CREATE UNIQUE INDEX t_login__idx ON
    t_login (
        cd_usuario
    ASC );

CREATE UNIQUE INDEX t_login__idxv1 ON
    t_login (
        cd_cadastro
    ASC );

ALTER TABLE t_login ADD CONSTRAINT t_login_pk PRIMARY KEY ( cd_login );

CREATE TABLE t_logradouro (
    cd_cidade     INTEGER NOT NULL,
    cd_logradouro INTEGER NOT NULL,
    nm_rua        VARCHAR2(30) NOT NULL,
    cep_rua       NUMBER NOT NULL,
    nm_bairro     VARCHAR2(30) NOT NULL
);

ALTER TABLE t_logradouro ADD CONSTRAINT t_logradouro_pk PRIMARY KEY ( cd_logradouro );

CREATE TABLE t_maquina_cartao (
    cd_maquina INTEGER NOT NULL,
    nm_serial  NUMBER NOT NULL
);

ALTER TABLE t_maquina_cartao ADD CONSTRAINT t_maquina_cartao_pk PRIMARY KEY ( cd_maquina );

CREATE TABLE t_pais (
    cd_pais INTEGER NOT NULL,
    nm_pais VARCHAR2(30) NOT NULL
);

ALTER TABLE t_pais ADD CONSTRAINT t_pais_pk PRIMARY KEY ( cd_pais );

CREATE TABLE t_telefone (
    cd_telefone INTEGER NOT NULL,
    nr_telefone NUMBER NOT NULL,
    ds_telefone VARCHAR2(10)
);

ALTER TABLE t_telefone ADD CONSTRAINT t_telefone_pk PRIMARY KEY ( cd_telefone );

CREATE TABLE t_transacao (
    cd_transacao    INTEGER NOT NULL,
    tp_transacao    VARCHAR2(4000) NOT NULL,
    valor_transacao NUMBER NOT NULL,
    dt_transacao    DATE
);

ALTER TABLE t_transacao ADD CONSTRAINT t_transacao_pk PRIMARY KEY ( cd_transacao );

CREATE TABLE t_transcacao_ctgzd (
    cd_transac_ctgzd INTEGER NOT NULL,
    cd_categoria     INTEGER NOT NULL
);

ALTER TABLE t_transcacao_ctgzd ADD CONSTRAINT t_transcacao_ctgzd_pk PRIMARY KEY ( cd_transac_ctgzd );

CREATE TABLE t_usuario (
    cd_login      INTEGER NOT NULL,
    cd_usuario    INTEGER NOT NULL,
    nm_usuario    VARCHAR2(30) NOT NULL,
    email_usuario VARCHAR2(30) NOT NULL,
    senha_usuario VARCHAR2(30) NOT NULL
);

CREATE UNIQUE INDEX t_usuario__idx ON
    t_usuario (
        cd_login
    ASC );

ALTER TABLE t_usuario ADD CONSTRAINT t_usuario_pk PRIMARY KEY ( cd_usuario );

ALTER TABLE t_conta
    ADD CONSTRAINT t_analise_mensal_fk FOREIGN KEY ( cd_analise )
        REFERENCES t_analise_mensal ( cd_analise );

ALTER TABLE t_login
    ADD CONSTRAINT t_cadastro_fk FOREIGN KEY ( cd_cadastro )
        REFERENCES t_cadastro ( cd_cadastro );

ALTER TABLE t_info_usuario
    ADD CONSTRAINT t_cadastro_fkv2 FOREIGN KEY ( cd_cadastro )
        REFERENCES t_cadastro ( cd_cadastro );

ALTER TABLE t_logradouro
    ADD CONSTRAINT t_cidade_fk FOREIGN KEY ( cd_cidade )
        REFERENCES t_cidade ( cd_cidade );

ALTER TABLE t_transcacao_ctgzd
    ADD CONSTRAINT t_ctg_transacao_fk FOREIGN KEY ( cd_categoria )
        REFERENCES t_ctg_transacao ( cd_categoria );

ALTER TABLE t_info_usuario
    ADD CONSTRAINT t_email_fk FOREIGN KEY ( cd_email )
        REFERENCES t_email ( cd_email );

ALTER TABLE t_info_usuario
    ADD CONSTRAINT t_endereco_fk FOREIGN KEY ( cd_endereco )
        REFERENCES t_endereco ( cd_endereco );

ALTER TABLE t_cidade
    ADD CONSTRAINT t_estado_fk FOREIGN KEY ( cd_estado )
        REFERENCES t_estado ( cd_estado );

ALTER TABLE t_cadastro
    ADD CONSTRAINT t_info_usuario_fk FOREIGN KEY ( cd_usuario )
        REFERENCES t_info_usuario ( cd_usuario );

ALTER TABLE t_endereco
    ADD CONSTRAINT t_logradouro_fk FOREIGN KEY ( cd_logradouro )
        REFERENCES t_logradouro ( cd_logradouro );

ALTER TABLE t_conta
    ADD CONSTRAINT t_maquina_cartao_fk FOREIGN KEY ( cd_maquina )
        REFERENCES t_maquina_cartao ( cd_maquina );

ALTER TABLE t_estado
    ADD CONSTRAINT t_pais_fk FOREIGN KEY ( cd_pais )
        REFERENCES t_pais ( cd_pais );

ALTER TABLE t_info_usuario
    ADD CONSTRAINT t_telefone_fk FOREIGN KEY ( cd_telefone )
        REFERENCES t_telefone ( cd_telefone );

ALTER TABLE t_ctg_transacao
    ADD CONSTRAINT t_transacao_fk FOREIGN KEY ( cd_transacao )
        REFERENCES t_transacao ( cd_transacao );

ALTER TABLE t_conta
    ADD CONSTRAINT t_transcacao_ctgzd_fk FOREIGN KEY ( cd_trans_ctgzd )
        REFERENCES t_transcacao_ctgzd ( cd_transac_ctgzd );

ALTER TABLE t_conta
    ADD CONSTRAINT t_usuario_fk FOREIGN KEY ( cd_usuario )
        REFERENCES t_usuario ( cd_usuario );

ALTER TABLE t_login
    ADD CONSTRAINT t_usuario_fkv2 FOREIGN KEY ( cd_usuario )
        REFERENCES t_usuario ( cd_usuario );

ALTER TABLE t_usuario
    ADD CONSTRAINT t_usuario_t_login_fk FOREIGN KEY ( cd_login )
        REFERENCES t_login ( cd_login );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             5
-- ALTER TABLE                             35
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
