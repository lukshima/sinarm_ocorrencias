-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2025-04-11 16:32:04 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE armas (
    arm_id       INTEGER NOT NULL,
    arm_especie  VARCHAR2(200) NOT NULL,
    arm_mar_id   INTEGER NOT NULL,
    arm_clb_id   INTEGER NOT NULL
);

COMMENT ON TABLE armas IS
    'Tabela que contém as armas, detalhadas de acordo com seu calibre e marca, trazidos por FK.
';

COMMENT ON COLUMN armas.arm_id IS
    'Identificador da arma (PK).';

COMMENT ON COLUMN armas.arm_especie IS
    'Espécie da arma (pistola, espingarda, etc)';

COMMENT ON COLUMN armas.arm_mar_id IS
    'Identificador da marca utilizada na arma(FK).';

COMMENT ON COLUMN armas.arm_clb_id IS
    'Identificador do calibre utilizado na arma (FK)';

ALTER TABLE armas ADD CONSTRAINT pk_arm PRIMARY KEY ( arm_id );

CREATE TABLE calibres (
    clb_id         INTEGER NOT NULL,
    clb_descricao  VARCHAR2(30) NOT NULL
);

COMMENT ON TABLE calibres IS
    'Tabela que contém todos os calibres possíveis das armas ';

COMMENT ON COLUMN calibres.clb_id IS
    'Identificador do calibre (PK).';

COMMENT ON COLUMN calibres.clb_descricao IS
    'Calibre da arma envolvida na ocorrência';

ALTER TABLE calibres ADD CONSTRAINT pk_clb PRIMARY KEY ( clb_id );

CREATE TABLE estados (
    est_id  INTEGER NOT NULL,
    est_uf  CHAR(2) NOT NULL
);

COMMENT ON TABLE estados IS
    'Tabela que contém todos os estados, que abrigam os municípios';

COMMENT ON COLUMN estados.est_id IS
    'Identificador do estado (PK)';

COMMENT ON COLUMN estados.est_uf IS
    'Sigla do estado, apenas duas letras (ex: SP, RJ)';

ALTER TABLE estados ADD CONSTRAINT pk_est PRIMARY KEY ( est_id );

CREATE TABLE h_armas (
    harm_id       INTEGER NOT NULL,
    harm_especie  VARCHAR2(200) NOT NULL,
    harm_mar_id   INTEGER NOT NULL,
    harm_clb_id   INTEGER NOT NULL,
    harm_data     DATE NOT NULL
);

COMMENT ON TABLE h_armas IS
    'Tabela de histórico que contém as armas, detalhadas de acordo com seu calibre e marca, trazidos por FK.
';

COMMENT ON COLUMN h_armas.harm_id IS
    'Identificador da arma registrada no histórico  (PK).';

COMMENT ON COLUMN h_armas.harm_especie IS
    'Espécie da arma (pistola, espingarda, etc) registrada no histórico';

COMMENT ON COLUMN h_armas.harm_mar_id IS
    'Identificador do calibre utilizado na arma registrado no histórico';

COMMENT ON COLUMN h_armas.harm_clb_id IS
    'Identificador da marca utilizada na arma registrada no histórico';

COMMENT ON COLUMN h_armas.harm_data IS
    'Data do registro da arma no histórico';

ALTER TABLE h_armas ADD CONSTRAINT pk_harm PRIMARY KEY ( harm_id,
                                                         harm_data );

CREATE TABLE h_calibres (
    hclb_id         INTEGER NOT NULL,
    hclb_descricao  VARCHAR2(30) NOT NULL,
    hclb_data       DATE NOT NULL
);

COMMENT ON TABLE h_calibres IS
    'Tabela de histórico que contém todos os calibres possíveis das armas ';

COMMENT ON COLUMN h_calibres.hclb_id IS
    'Identificador do calibre registrado no histórico  (PK).';

COMMENT ON COLUMN h_calibres.hclb_descricao IS
    'Calibre da arma envolvida na ocorrência registrada no histórico';

COMMENT ON COLUMN h_calibres.hclb_data IS
    'Data de registro do calibre no histórico';

ALTER TABLE h_calibres ADD CONSTRAINT pk_hclb PRIMARY KEY ( hclb_id,
                                                            hclb_data );

CREATE TABLE h_estados (
    hest_id    INTEGER NOT NULL,
    hest_uf    CHAR(2) NOT NULL,
    hest_data  DATE NOT NULL
);

COMMENT ON TABLE h_estados IS
    'Tabela de histórico que contém todos os estados, que abrigam os municípios';

COMMENT ON COLUMN h_estados.hest_id IS
    'Identificador do estado registrado no histórico (PK)';

COMMENT ON COLUMN h_estados.hest_uf IS
    'Sigla do estado registrado no histórico, apenas duas letras (ex: SP, RJ)';

COMMENT ON COLUMN h_estados.hest_data IS
    'Data de registro do estado no histórico';

ALTER TABLE h_estados ADD CONSTRAINT pk_hest PRIMARY KEY ( hest_id,
                                                           hest_data );

CREATE TABLE h_marcas (
    hmar_id    INTEGER NOT NULL,
    hmar_nome  VARCHAR2(200) NOT NULL,
    hmar_data  DATE NOT NULL
);

COMMENT ON TABLE h_marcas IS
    'Tabela sw histórico que contém todas as marcas possíveis de arma';

COMMENT ON COLUMN h_marcas.hmar_id IS
    'Identificador da marca registrada no histórico (PK).';

COMMENT ON COLUMN h_marcas.hmar_nome IS
    'Nome da marca da arma registrada no histórico';

COMMENT ON COLUMN h_marcas.hmar_data IS
    'Data de registro da marca no histórico';

ALTER TABLE h_marcas ADD CONSTRAINT pk_hmar PRIMARY KEY ( hmar_id,
                                                          hmar_data );

CREATE TABLE h_municipios (
    hmun_id      INTEGER NOT NULL,
    hmun_nome    VARCHAR2(200) NOT NULL,
    hmun_est_id  INTEGER NOT NULL,
    hmun_data    DATE NOT NULL
);

COMMENT ON TABLE h_municipios IS
    'Tabela de histórico que contém os municípios, que possuem a chave estrangeira do estado em que ele se encontra.';

COMMENT ON COLUMN h_municipios.hmun_id IS
    'Identificador do município registrado no histórico (PK)	';

COMMENT ON COLUMN h_municipios.hmun_nome IS
    'Nome do município registrado no histórico';

COMMENT ON COLUMN h_municipios.hmun_est_id IS
    'Identificador do estado em que o município se encontra registrado no histórico.';

COMMENT ON COLUMN h_municipios.hmun_data IS
    'Data de registro do município no histórico';

ALTER TABLE h_municipios ADD CONSTRAINT pk_hmun PRIMARY KEY ( hmun_id,
                                                              hmun_data );

CREATE TABLE h_ocorrencias (
    hoco_id      INTEGER NOT NULL,
    hoco_mes     VARCHAR2(3) NOT NULL,
    hoco_arm_id  INTEGER NOT NULL,
    hoco_toc_id  INTEGER NOT NULL,
    hoco_mun_id  INTEGER NOT NULL,
    hoco_data    DATE NOT NULL
);

COMMENT ON TABLE h_ocorrencias IS
    'Tabela de histórico  das ocorrências, que abriga grande parte das chaves estrangeiras, para descrever as ocorrências';

COMMENT ON COLUMN h_ocorrencias.hoco_id IS
    'Identificador da ocorrência registrada no histórico  (PK)';

COMMENT ON COLUMN h_ocorrencias.hoco_mes IS
    'Mês da ocorrência em número (1 para Janeiro, 2 para Fevereiro, etc) registrado no histórico';

COMMENT ON COLUMN h_ocorrencias.hoco_arm_id IS
    'Identificador do município envolvido na ocorrência registrado no histórico.';

COMMENT ON COLUMN h_ocorrencias.hoco_toc_id IS
    'Identificador da descrição do tipo de ocorrência registrada no histórico';

COMMENT ON COLUMN h_ocorrencias.hoco_mun_id IS
    'Identificador da arma utilizada na ocorrência registrada no histórico.';

COMMENT ON COLUMN h_ocorrencias.hoco_data IS
    'Data de registro da ocorrência no histórico';

ALTER TABLE h_ocorrencias ADD CONSTRAINT pk_hoco PRIMARY KEY ( hoco_id,
                                                               hoco_data );

CREATE TABLE h_tipos_ocorrencia (
    htoc_id         INTEGER NOT NULL,
    htoc_descricao  VARCHAR2(200) NOT NULL,
    htoc_data       DATE NOT NULL
);

COMMENT ON TABLE h_tipos_ocorrencia IS
    'Tabela de histórico que armazena os tipos de ocorrência presentes.';

COMMENT ON COLUMN h_tipos_ocorrencia.htoc_id IS
    'Identificador do histórico do tipo de ocorrência (PK)';

COMMENT ON COLUMN h_tipos_ocorrencia.htoc_descricao IS
    'Descrilção do histórico do tipo da ocorrência';

COMMENT ON COLUMN h_tipos_ocorrencia.htoc_data IS
    'Data do tipo de ocorrência modificado';

ALTER TABLE h_tipos_ocorrencia ADD CONSTRAINT pk_htoc PRIMARY KEY ( htoc_id,
                                                                    htoc_data );

CREATE TABLE marcas (
    mar_id    INTEGER NOT NULL,
    mar_nome  VARCHAR2(200) NOT NULL
);

COMMENT ON TABLE marcas IS
    'Tabela que contém todas as marcas possíveis de arma';

COMMENT ON COLUMN marcas.mar_id IS
    'Identificador da marca (PK).';

COMMENT ON COLUMN marcas.mar_nome IS
    'Nome da marca da arma';

ALTER TABLE marcas ADD CONSTRAINT pk_mar PRIMARY KEY ( mar_id );

CREATE TABLE municipios (
    mun_id      INTEGER NOT NULL,
    mun_nome    VARCHAR2(200) NOT NULL,
    mun_est_id  INTEGER NOT NULL
);

COMMENT ON TABLE municipios IS
    'Tabela que contém os municípios, que possuem a chave estrangeira do estado em que ele se encontra.';

COMMENT ON COLUMN municipios.mun_id IS
    'Identificador do município (PK)	';

COMMENT ON COLUMN municipios.mun_nome IS
    'Nome do município';

COMMENT ON COLUMN municipios.mun_est_id IS
    'Identificador do estado em que o município se encontra (FK)';

ALTER TABLE municipios ADD CONSTRAINT pk_mun PRIMARY KEY ( mun_id );

CREATE TABLE ocorrencias (
    oco_id      INTEGER NOT NULL,
    oco_mes     VARCHAR2(3) NOT NULL,
    oco_arm_id  INTEGER NOT NULL,
    oco_toc_id  INTEGER NOT NULL,
    oco_mun_id  INTEGER NOT NULL
);

COMMENT ON TABLE ocorrencias IS
    'Tabela principal das ocorrências, que abriga grande parte das chaves estrangeiras, para descrever as ocorrências';

COMMENT ON COLUMN ocorrencias.oco_id IS
    'Identificador da ocorrência (PK)';

COMMENT ON COLUMN ocorrencias.oco_mes IS
    'Mês da ocorrência em número (1 para Janeiro, 2 para Fevereiro, etc)';

COMMENT ON COLUMN ocorrencias.oco_arm_id IS
    'Identificador da arma utilizada na ocorrência (FK).';

COMMENT ON COLUMN ocorrencias.oco_toc_id IS
    'Identificador da descrição do tipo de ocorrência (FK)';

COMMENT ON COLUMN ocorrencias.oco_mun_id IS
    'Identificador do município envolvido na ocorrência (FK)';

ALTER TABLE ocorrencias ADD CONSTRAINT pk_oco PRIMARY KEY ( oco_id );

CREATE TABLE tipos_ocorrencia (
    toc_id         INTEGER NOT NULL,
    toc_descricao  VARCHAR2(200) NOT NULL
);

COMMENT ON TABLE tipos_ocorrencia IS
    'Tabela que armazena os tipos de ocorrência presentes.';

COMMENT ON COLUMN tipos_ocorrencia.toc_id IS
    'Identificador do tipo de ocorrência (PK)';

COMMENT ON COLUMN tipos_ocorrencia.toc_descricao IS
    'Descrilção do tipo da ocorrência';

ALTER TABLE tipos_ocorrencia ADD CONSTRAINT pk_toc PRIMARY KEY ( toc_id );

ALTER TABLE armas
    ADD CONSTRAINT fk_arm_clb FOREIGN KEY ( arm_clb_id )
        REFERENCES calibres ( clb_id );

ALTER TABLE armas
    ADD CONSTRAINT fk_arm_mar FOREIGN KEY ( arm_mar_id )
        REFERENCES marcas ( mar_id );

ALTER TABLE municipios
    ADD CONSTRAINT fk_mun_est FOREIGN KEY ( mun_est_id )
        REFERENCES estados ( est_id );

ALTER TABLE ocorrencias
    ADD CONSTRAINT fk_oco_arm FOREIGN KEY ( oco_arm_id )
        REFERENCES armas ( arm_id );

ALTER TABLE ocorrencias
    ADD CONSTRAINT fk_oco_mun FOREIGN KEY ( oco_mun_id )
        REFERENCES municipios ( mun_id );

ALTER TABLE ocorrencias
    ADD CONSTRAINT fk_oco_toc FOREIGN KEY ( oco_toc_id )
        REFERENCES tipos_ocorrencia ( toc_id );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             0
-- ALTER TABLE                             20
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
