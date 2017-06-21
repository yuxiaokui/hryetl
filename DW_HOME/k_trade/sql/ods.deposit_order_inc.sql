CREATE TABLE K_TRADE_ODS.DWD_DEPOSIT_ORDER_INC
(
  TRADE_VOUCHER_NO VARCHAR2(32 BYTE) NOT NULL PRIMARY KEY
, BIZ_PRODUCT_CODE VARCHAR2(16 BYTE) 
, AMOUNT NUMBER(15, 2) 
, ACCESS_CHANNEL VARCHAR2(16 BYTE) 
, GMT_SUBMIT TIMESTAMP(6) 
, TRADE_STATUS VARCHAR2(16 BYTE) NOT NULL 
, GMT_CREATE TIMESTAMP(6) NOT NULL 
, GMT_MODIFIED TIMESTAMP(6) 
, BIZNO VARCHAR2(32 BYTE) 

) ;





TRUNCATE TABLE K_TRADE_ODS.DWD_DEPOSIT_ORDER_INC;
INSERT /*+ append nologging */ INTO K_TRADE_ODS.DWD_DEPOSIT_ORDER_INC
SELECT *
FROM DEPOSIT.t_deposit_order@kjtdb  
WHERE GMT_CREATE >= last_day(add_months(trunc(sysdate),-2)) +1;


DELETE FROM  K_TRADE.DWD_DEPOSIT_ORDER_D WHERE GMT_CREATE >= last_day(add_months(trunc(sysdate),-2)) +1;
 
INSERT /*+   nologging */ INTO K_TRADE.DWD_DEPOSIT_ORDER_D
SELECT 
	  t.*
	  ,sysdate DW_CREATE_TIME
	  ,sysdate DW_MODIFIED_TIME
FROM K_TRADE_ODS.DWD_DEPOSIT_ORDER_INC t;