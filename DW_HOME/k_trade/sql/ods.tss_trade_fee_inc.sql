CREATE TABLE K_TRADE_ODS.TSS_TRADE_FEE_INC
(
  TRADE_FEE_ID NUMBER(12, 0) NOT NULL PRIMARY KEY
, TRADE_VOUCHER_NO VARCHAR2(32 BYTE) NOT NULL 
, PAYMENT_VOUCHER_NO VARCHAR2(32 BYTE) NOT NULL 
, AMOUNT NUMBER(15, 2) NOT NULL 
, REFUNDED_AMOUNT NUMBER(15, 2) 
, FEE_AMOUNT NUMBER(15, 2) 
, REFUNDED_FEE_AMOUNT NUMBER(15, 2) 
, MEMBER_ID VARCHAR2(32 BYTE) 
, MEMBER_ACCOUNT_NO VARCHAR2(32 BYTE) 
, BIZ_PRODUCT_CODE VARCHAR2(32 BYTE) 
, PAY_MODE VARCHAR2(32 BYTE) NOT NULL 
, PAY_CHANNEL VARCHAR2(32 BYTE) NOT NULL 
, PARTY_ROLE VARCHAR2(32 BYTE) 
, STATUS VARCHAR2(32 BYTE) 
, EXTENSION VARCHAR2(1000 BYTE) 
, GMT_CREATE TIMESTAMP(6) DEFAULT SYSDATE NOT NULL 
, GMT_MODIFIED TIMESTAMP(6) 
);




TRUNCATE TABLE K_TRADE_ODS.TSS_TRADE_FEE_INC;
INSERT /*+ append nologging */ INTO K_TRADE_ODS.TSS_TRADE_FEE_INC
SELECT *
FROM tss.T_TRADE_FEE@kjtdb  
WHERE GMT_CREATE >= last_day(add_months(trunc(sysdate),-2)) +1;


DELETE FROM  K_TRADE.DWD_TSS_TRADE_FEE_D WHERE GMT_CREATE >= last_day(add_months(trunc(sysdate),-2)) +1;
 
INSERT /*+   nologging */ INTO K_TRADE.DWD_TSS_TRADE_FEE_D
SELECT 
	  t.*
	  ,sysdate DW_CREATE_TIME
	  ,sysdate DW_MODIFIED_TIME
FROM K_TRADE_ODS.TSS_TRADE_FEE_INC t;
 