SELECT *
FROM K_TRADE.DWS_TRADE_ACCOUNTING_D


DROP TABLE K_TRADE.DWS_TRADE_ACCOUNTING_D ;

CREATE TABLE K_TRADE.DWS_TRADE_ACCOUNTING_D
AS
SELECT 
   TO_CHAR(TRADE_GMT_CREATE,'YYYYMMDD') DATE_ID
  ,TRADE_SOURCE
  ,PRODUCT_CODE
  ,BIZ_PRODUCT_CODE
  ,BIZ_PRODUCT_CODE_DESC
  ,TRADE_TYPE
  ,TRADE_TYPE_DESC
  ,TRADE_PAYMENT_TYPE
  ,PAY_MODE
  ,PAY_MODE_DESC
  ,PAYEE_MEMBER_ID
  ,PAYEE_MEMBER_TYPE
  ,PAYER_MEMBER_ID
  ,PAYER_MEMBER_TYPE
  ,Accounting_TYPE
  ,Accounting_OWNER_ID
  ,CHANNEL_ORDER_TYPE
  ,REAL_PAY_MODE 
  ,COUNT(1) CNT
  ,SUM(AMOUNT) AMOUNT
FROM K_TRADE.DWD_TRADE_DETAIL_D_1 --PARTITION(P201705)
WHERE   TRADE_PAYMENT_STATUS in ('S')
AND TRADE_SOURCE ='TSS'
AND (
           TRADE_TYPE in ('01') 
        or (TRADE_TYPE in ('14')  and TRADE_PAYMENT_TYPE in ( '04'))
        or (TRADE_TYPE not in ('01','14') and TRADE_PAYMENT_TYPE in ( '01','04'))
       )
GROUP BY   
   TO_CHAR(TRADE_GMT_CREATE,'YYYYMMDD')  
  ,TRADE_SOURCE
  ,PRODUCT_CODE
  ,BIZ_PRODUCT_CODE
  ,BIZ_PRODUCT_CODE_DESC
  ,TRADE_TYPE
  ,TRADE_TYPE_DESC
  ,TRADE_PAYMENT_TYPE
  ,PAY_MODE
  ,PAY_MODE_DESC
  ,PAYEE_MEMBER_ID
  ,PAYEE_MEMBER_TYPE
  ,PAYER_MEMBER_ID
  ,PAYER_MEMBER_TYPE
  ,Accounting_TYPE
  ,Accounting_OWNER_ID
  ,CHANNEL_ORDER_TYPE
  ,REAL_PAY_MODE    
/*ORDER BY 
  Accounting_TYPE
  ,TRADE_TYPE
  ,TRADE_PAYMENT_TYPE
  ,PAY_MODE 
*/  
UNION ALL  

  
SELECT 
   TO_CHAR(TRADE_GMT_CREATE,'YYYYMMDD') DATE_ID
  ,TRADE_SOURCE
  ,PRODUCT_CODE
  ,BIZ_PRODUCT_CODE
  ,BIZ_PRODUCT_CODE_DESC
  ,'提现' TRADE_TYPE
  ,TRADE_TYPE_DESC
  ,NULL TRADE_PAYMENT_TYPE
  ,PAY_MODE
  ,PAY_MODE_DESC
  ,PAYEE_MEMBER_ID
  ,PAYEE_MEMBER_TYPE
  ,PAYER_MEMBER_ID
  ,PAYER_MEMBER_TYPE
  ,'提现' Accounting_TYPE
  ,Accounting_OWNER_ID
  ,COUNT(1) CNT
  ,SUM(AMOUNT) AMOUNT 
FROM K_TRADE.DWD_TRADE_DETAIL_D --PARTITION(P201705)
WHERE   TRADE_PAYMENT_STATUS in ('S')
AND TRADE_SOURCE ='FOS'
GROUP BY   
   TO_CHAR(TRADE_GMT_CREATE,'YYYYMMDD')  
  ,TRADE_SOURCE
  ,PRODUCT_CODE
  ,BIZ_PRODUCT_CODE
  ,BIZ_PRODUCT_CODE_DESC
  ,'提现'  
  ,TRADE_TYPE_DESC
  ,NULL  
  ,PAY_MODE
  ,PAY_MODE_DESC
  ,PAYEE_MEMBER_ID
  ,PAYEE_MEMBER_TYPE
  ,PAYER_MEMBER_ID
  ,PAYER_MEMBER_TYPE
  ,'提现'  
  ,Accounting_OWNER_ID  
/*ORDER BY 
  Accounting_TYPE
  ,TRADE_TYPE
  ,TRADE_PAYMENT_TYPE
  ,PAY_MODE 
*/
  
UNION ALL  


SELECT 
   TO_CHAR(TRADE_GMT_CREATE,'YYYYMMDD') DATE_ID
  ,TRADE_SOURCE
  ,PRODUCT_CODE
  ,BIZ_PRODUCT_CODE
  ,BIZ_PRODUCT_CODE_DESC
  ,'充值'  TRADE_TYPE
  ,TRADE_TYPE_DESC
  ,NULL TRADE_PAYMENT_TYPE
  ,PAY_MODE
  ,PAY_MODE_DESC
  ,PAYEE_MEMBER_ID
  ,PAYEE_MEMBER_TYPE
  ,PAYER_MEMBER_ID
  ,PAYER_MEMBER_TYPE
  ,'充值' Accounting_TYPE
  ,Accounting_OWNER_ID
  ,COUNT(1) CNT
  ,SUM(AMOUNT) AMOUNT
FROM K_TRADE.DWD_TRADE_DETAIL_D --PARTITION(P201705)
WHERE   TRADE_PAYMENT_STATUS in ('S')
AND TRADE_SOURCE ='DEPOSIT'
GROUP BY   
   TO_CHAR(TRADE_GMT_CREATE,'YYYYMMDD')  
  ,TRADE_SOURCE
  ,PRODUCT_CODE
  ,BIZ_PRODUCT_CODE
  ,BIZ_PRODUCT_CODE_DESC
  ,'充值'  
  ,TRADE_TYPE_DESC
  ,NULL  
  ,PAY_MODE
  ,PAY_MODE_DESC
  ,PAYEE_MEMBER_ID
  ,PAYEE_MEMBER_TYPE
  ,PAYER_MEMBER_ID
  ,PAYER_MEMBER_TYPE
  ,'充值'  
  ,Accounting_OWNER_ID  
  
/*ORDER BY 
  Accounting_TYPE
  ,TRADE_TYPE
  ,TRADE_PAYMENT_TYPE
  ,PAY_MODE 
*/
17331921
SELECT COUNT(*) FROM K_TRADE.DWD_TRADE_DETAIL_D_1  t WHERE to_char(t.TRADE_GMT_CREATE,'YYYYMM') >= '201701' AND TRADE_PAYMENT_STATUS in ('S')
25802214

SELECT PAY_MODE, REAL_PAY_MODE 
FROM K_TRADE.DWD_TRADE_DETAIL_D_1 
WHERE   TRADE_PAYMENT_STATUS in ('S')
AND TRADE_SOURCE ='TSS'

DROP TABLE K_TRADE.DWD_TRADE_DETAIL_D_1;

CREATE TABLE K_TRADE.DWD_TRADE_DETAIL_D_1 AS
SELECT 
   t.*
  ,c.CMF_SEQ_NO
  ,c.CMF_ORDER_STATUS  
  ,c.INST_ORDER_NO 
  ,c.INST_ORDER_STATUS
  ,c.FUND_CHANNEL_CODE
  ,c.FUND_CHANNEL_NAME
  ,c.ORDER_TYPE CHANNEL_ORDER_TYPE
  ,c.REAL_PAY_MODE REAL_PAY_MODE
FROM K_TRADE.DWD_TRADE_DETAIL_D   t 
LEFT OUTER JOIN K_CHANNEL.DWD_FUND_CHANNEL_ORDER_D  c
on t.PAYMENT_SEQ_NO = c.PAYMENT_SEQ_NO
WHERE to_char(t.TRADE_GMT_CREATE,'YYYYMM') >= '201701'




SELECT PAYMENT_SEQ_NO ,COUNT(*)
FROM K_TRADE.DWD_TRADE_DETAIL_D
WHERE TRADE_PAYMENT_STATUS in ('S')
GROUP BY PAYMENT_SEQ_NO
HAVING COUNT(*) > 1


  