CREATE SEQUENCE  "SEQ_AUD"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

CREATE OR REPLACE NONEDITIONABLE TRIGGER "TG_SEQ_AUD" 
BEFORE INSERT ON AUDITORIA
FOR EACH ROW
BEGIN
	:NEW.AUD_ID := SEQ_AUD.NEXTVAL;
END;
/
ALTER TRIGGER "TG_SEQ_AUD" ENABLE;
