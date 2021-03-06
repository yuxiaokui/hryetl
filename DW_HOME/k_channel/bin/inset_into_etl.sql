--- 171*** 渠道路由
---  渠道路由订单入 ODS
delete from bipay.bi_daily_tasks_etl where id  = 171001;
INSERT INTO bipay.bi_daily_tasks_etl
SELECT 
171001
,'ODS--渠道路由订单入ODS'
,'${email_ok}'
,null
,'TRUNCATE TABLE K_CHANNEL_ODS.CMF_ORDER_INC;INSERT /*+ append nologging */ INTO K_CHANNEL_ODS.CMF_ORDER_INC SELECT * FROM cmf.tt_cmf_order@kjtdb WHERE GMT_CREATE >= last_day(add_months(trunc(sysdate),-2)) +1;'
,null
,null
,null
,'ODS'
,null
,null
,0
,null
,1
,'D'
,'张家欢'
,null
,sysdate
FROM DUAL;

--- 渠道路由入 DW
delete from bipay.bi_daily_tasks_etl where id  = 171002;
INSERT INTO bipay.bi_daily_tasks_etl
SELECT 
171002
,'DW--渠道路由订单入 DW'
,'${email_ok}'
,null
,'CALL TRUNCATE_PARTITIONS(''K_CHANNEL'',''DWD_CMF_ORDER_D'',last_day(add_months(trunc(sysdate),-2)) +1 );INSERT /*+ append nologging */ INTO K_CHANNEL.DWD_CMF_ORDER_D SELECT t.*,sysdate DW_CREATE_TIME,sysdate DW_MODIFIED_TIME FROM K_CHANNEL_ODS.CMF_ORDER_INC t WHERE GMT_CREATE >= last_day(add_months(trunc(sysdate),-2)) +1;'
,null
,null
,null
,'DW'
,null
,null
,0
,null
,1
,'D'
,'张家欢'
,null
,sysdate
FROM DUAL;


--- 172*** 机构订单
---  机构订单入 ODS
delete from bipay.bi_daily_tasks_etl where id  = 172001;
INSERT INTO bipay.bi_daily_tasks_etl
SELECT 
172001
,'ODS--机构订单订单入 ODS'
,'${email_ok}'
,null
,'TRUNCATE TABLE K_CHANNEL_ODS.INST_ORDER_INC;INSERT /*+ append nologging */ INTO K_CHANNEL_ODS.INST_ORDER_INC SELECT * FROM cmf.tt_inst_order@kjtdb WHERE GMT_CREATE >= last_day(add_months(trunc(sysdate),-2)) +1;'
,null
,null
,null
,'ODS'
,null
,null
,0
,null
,1
,'D'
,'张家欢'
,null
,sysdate
FROM DUAL;

--- 机构订单入 DW
delete from bipay.bi_daily_tasks_etl where id  = 172002;
INSERT INTO bipay.bi_daily_tasks_etl
SELECT 
172002
,'DW--机构订单入 DW'
,'${email_ok}'
,null
,'CALL TRUNCATE_PARTITIONS(''K_CHANNEL'',''DWD_INST_ORDER_D'',last_day(add_months(trunc(sysdate),-2)) +1 );
INSERT /*+ append nologging */ INTO K_CHANNEL.DWD_INST_ORDER_D SELECT t.*,sysdate DW_CREATE_TIME,sysdate DW_MODIFIED_TIME FROM K_CHANNEL_ODS.INST_ORDER_INC t WHERE GMT_CREATE >= last_day(add_months(trunc(sysdate),-2)) +1;'
,null
,null
,null
,'DW'
,null
,null
,0
,null
,1
,'D'
,'张家欢'
,null
,sysdate
FROM DUAL;

commit;




--- 179 所有明细关联和汇总数据
--- 渠道订单交易表 179001
delete from bipay.bi_daily_tasks_etl where id  = 179001;
INSERT INTO bipay.bi_daily_tasks_etl
SELECT
179001
,'DW-- 渠道层订单宽表'
,'${email_ok}'
,null
,'CALL TRUNCATE_PARTITIONS(''K_CHANNEL'',''DWD_CHANNEL_ORDER_D'',last_day(add_months(trunc(sysdate),-2)) +1 );INSERT /*+ append nologging */ INTO K_CHANNEL.DWD_CHANNEL_ORDER_D SELECT S0.CMF_SEQ_NO,S0.PAYMENT_SEQ_NO,S0.ORDER_TYPE ,s6.REMARK order_type_des,S0.PRODUCT_CODE,S0.PAYMENT_CODE ,S0.MEMBER_ID,S0.AMOUNT,S0.CURRENCY,S0.INST_CODE TARGET_INST_CODE,S5.TARGET_INST_NAME,S0.PAYMENT_NOTIFY_STATUS,S0.STATUS CMF_ORDER_STATUS,s7.remark CMF_ORDER_STATUS_des,S0.INST_ORDER_ID,S0.BIZ_DATE,S0.GMT_CREATE,S0.GMT_MODIFIED,S0.CONFIRM_STATUS,S0.PAY_MODE DECLARE_PAY_MODE_CODE,S3.REMARK  DECLARE_PAY_MODE_des,S0.SETTLEMENT_ID,S1.INST_ORDER_NO,S1.STATUS INST_ORDER_STATUS,S1.COMMUNICATE_TYPE,s8.REMARK COMMUNICATE_TYPE_des,S1.COMMUNICATE_STATUS,S1.GMT_MODIFIED INST_ORDER_MODIFIED_TIME,S1.MEMO,S1.FUND_CHANNEL_CODE,S1.FUND_CHANNEL_API,S1.FLAG,S2.FUND_CHANNEL_NAME,S2.FUND_CHANNEL_DES,S2.FUND_CHANNEL_INST_CODE,S2.PAY_MODE REAL_PAY_MODE_CODE,S4.REMARK REAL_PAY_MODE_des,S2.IS_BFJ,S2.CONNECTTYPE,SYSDATE DW_CREATE_TIME,SYSDATE DW_MODIFIED_TIME FROM K_CHANNEL.DWD_CMF_ORDER_D S0 INNER JOIN K_CHANNEL.DWD_INST_ORDER_D S1 ON S0.INST_ORDER_ID=S1.INST_ORDER_ID LEFT JOIN K_CHANNEL.DIM_BANK_FUND_CHANNEL_D S2 ON S1.FUND_CHANNEL_CODE=S2.FUND_CHANNEL_CODE LEFT JOIN K_LKP.PAY_MODE S3 ON S0.PAY_MODE=S3.PAY_MODE LEFT JOIN K_LKP.PAY_MODE S4 ON S2.PAY_MODE=S4.PAY_MODE LEFT JOIN K_CHANNEL.DIM_FUND_CHANNEL_TARGET_INST_D S5 ON S0.INST_CODE=S5.TARGET_INST_CODE left join K_LKP.CHANNEL_ORDER_TYPE s6 on s0.ORDER_TYPE=s6.ORDER_TYPE left join K_LKP.CMF_ORDER_STATUS_REMARK s7 on S0.STATUS=s7.STATUS_CODE left join K_LKP.INST_ORDER_COMMUNICATE_TYPE s8 on S1.COMMUNICATE_TYPE=s8.communicate_type where s0.GMT_CREATE >= last_day(add_months(trunc(sysdate),-2)) +1;'
,null
,null
,null
,'DW'
,null
,null
,0
,null
,1
,'D'
,'张家欢'
,null
,sysdate
FROM DUAL
;
commit;


