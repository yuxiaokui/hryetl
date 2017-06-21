CREATE TABLE K_CHANNEL.DWD_CMF_ORDER_D 
   (	
   	CMF_SEQ_NO VARCHAR2(32 BYTE) NOT NULL primary key
   	,PAYMENT_SEQ_NO VARCHAR2(32 BYTE) NOT NULL ENABLE
	,REQUEST_BATCH_NO VARCHAR2(32 BYTE)
	,ORDER_TYPE CHAR(1 BYTE) NOT NULL ENABLE
	,PRODUCT_CODE VARCHAR2(32 BYTE) NOT NULL ENABLE
	,PAYMENT_CODE VARCHAR2(32 BYTE) NOT NULL ENABLE
	,MEMBER_ID VARCHAR2(64 BYTE)
	,AMOUNT NUMBER(15,2) NOT NULL ENABLE
	,CURRENCY CHAR(3 BYTE) NOT NULL ENABLE
	,INST_CODE VARCHAR2(32 BYTE)
	,PAYMENT_NOTIFY_STATUS CHAR(1 BYTE)
	,COMMUNICATE_TYPE CHAR(1 BYTE)
	,STATUS CHAR(1 BYTE)
	,OPERATOR VARCHAR2(32 BYTE)
	,GMT_SUBMIT TIMESTAMP (6)
	,INST_ORDER_ID NUMBER(15,0)
	,GMT_CREATE TIMESTAMP (6) NOT NULL ENABLE
	,BIZ_DATE CHAR(16 BYTE)
	,GMT_MODIFIED TIMESTAMP (6) NOT NULL ENABLE
	,MEMO VARCHAR2(128 BYTE)
	,CONFIRM_STATUS CHAR(1 BYTE) NOT NULL ENABLE
	,PAY_MODE VARCHAR2(32 BYTE)
	,SUBMIT_BATCH_NO VARCHAR2(32 BYTE)
	,ORGI_PAYMENT_SEQ_NO NUMBER(15,0)
	,EXPECT_TIME TIMESTAMP (6)
	,EXTENSION VARCHAR2(2048 BYTE)
	,SETTLEMENT_ID VARCHAR2(32 BYTE)
	,ORGI_SETTLEMENT_ID VARCHAR2(32 BYTE)
	,DW_CREATE_TIME DATE DEFAULT SYSDATE
	,DW_MODIFIED_TIME DATE 
   )
   PARTITION BY RANGE ("GMT_CREATE") 
	(
	 PARTITION P000000 VALUES LESS THAN(TO_DATE('201401','YYYYMM'))  
	,PARTITION P201401 VALUES LESS THAN(TO_DATE('201402','YYYYMM')) 
	,PARTITION P201402 VALUES LESS THAN(TO_DATE('201403','YYYYMM')) 
	,PARTITION P201403 VALUES LESS THAN(TO_DATE('201404','YYYYMM')) 
	,PARTITION P201404 VALUES LESS THAN(TO_DATE('201405','YYYYMM')) 
	,PARTITION P201405 VALUES LESS THAN(TO_DATE('201406','YYYYMM')) 
	,PARTITION P201406 VALUES LESS THAN(TO_DATE('201407','YYYYMM')) 
	,PARTITION P201407 VALUES LESS THAN(TO_DATE('201408','YYYYMM')) 
	,PARTITION P201408 VALUES LESS THAN(TO_DATE('201409','YYYYMM')) 
	,PARTITION P201409 VALUES LESS THAN(TO_DATE('201410','YYYYMM')) 
	,PARTITION P201410 VALUES LESS THAN(TO_DATE('201411','YYYYMM')) 
	,PARTITION P201411 VALUES LESS THAN(TO_DATE('201412','YYYYMM')) 
	,PARTITION P201412 VALUES LESS THAN(TO_DATE('201501','YYYYMM')) 
	,PARTITION P201501 VALUES LESS THAN(TO_DATE('201502','YYYYMM')) 
	,PARTITION P201502 VALUES LESS THAN(TO_DATE('201503','YYYYMM')) 
	,PARTITION P201503 VALUES LESS THAN(TO_DATE('201504','YYYYMM')) 
	,PARTITION P201504 VALUES LESS THAN(TO_DATE('201505','YYYYMM')) 
	,PARTITION P201505 VALUES LESS THAN(TO_DATE('201506','YYYYMM')) 
	,PARTITION P201506 VALUES LESS THAN(TO_DATE('201507','YYYYMM')) 
	,PARTITION P201507 VALUES LESS THAN(TO_DATE('201508','YYYYMM')) 
	,PARTITION P201508 VALUES LESS THAN(TO_DATE('201509','YYYYMM')) 
	,PARTITION P201509 VALUES LESS THAN(TO_DATE('201510','YYYYMM')) 
	,PARTITION P201510 VALUES LESS THAN(TO_DATE('201511','YYYYMM')) 
	,PARTITION P201511 VALUES LESS THAN(TO_DATE('201512','YYYYMM')) 
	,PARTITION P201512 VALUES LESS THAN(TO_DATE('201601','YYYYMM')) 
	,PARTITION P201601 VALUES LESS THAN(TO_DATE('201602','YYYYMM')) 
	,PARTITION P201602 VALUES LESS THAN(TO_DATE('201603','YYYYMM')) 
	,PARTITION P201603 VALUES LESS THAN(TO_DATE('201604','YYYYMM')) 
	,PARTITION P201604 VALUES LESS THAN(TO_DATE('201605','YYYYMM')) 
	,PARTITION P201605 VALUES LESS THAN(TO_DATE('201606','YYYYMM')) 
	,PARTITION P201606 VALUES LESS THAN(TO_DATE('201607','YYYYMM')) 
	,PARTITION P201607 VALUES LESS THAN(TO_DATE('201608','YYYYMM')) 
	,PARTITION P201608 VALUES LESS THAN(TO_DATE('201609','YYYYMM')) 
	,PARTITION P201609 VALUES LESS THAN(TO_DATE('201610','YYYYMM')) 
	,PARTITION P201610 VALUES LESS THAN(TO_DATE('201611','YYYYMM')) 
	,PARTITION P201611 VALUES LESS THAN(TO_DATE('201612','YYYYMM')) 
	,PARTITION P201612 VALUES LESS THAN(TO_DATE('201701','YYYYMM')) 
	,PARTITION P201701 VALUES LESS THAN(TO_DATE('201702','YYYYMM')) 
	,PARTITION P201702 VALUES LESS THAN(TO_DATE('201703','YYYYMM')) 
	,PARTITION P201703 VALUES LESS THAN(TO_DATE('201704','YYYYMM')) 
	,PARTITION P201704 VALUES LESS THAN(TO_DATE('201705','YYYYMM')) 
	,PARTITION P201705 VALUES LESS THAN(TO_DATE('201706','YYYYMM')) 
	,PARTITION P201706 VALUES LESS THAN(TO_DATE('201707','YYYYMM')) 
	,PARTITION P201707 VALUES LESS THAN(TO_DATE('201708','YYYYMM')) 
	,PARTITION P201708 VALUES LESS THAN(TO_DATE('201709','YYYYMM')) 
	,PARTITION P201709 VALUES LESS THAN(TO_DATE('201710','YYYYMM')) 
	,PARTITION P201710 VALUES LESS THAN(TO_DATE('201711','YYYYMM')) 
	,PARTITION P201711 VALUES LESS THAN(TO_DATE('201712','YYYYMM')) 
	,PARTITION P201712 VALUES LESS THAN(TO_DATE('201801','YYYYMM')) 
	,PARTITION P201801 VALUES LESS THAN(TO_DATE('201802','YYYYMM')) 
	,PARTITION P201802 VALUES LESS THAN(TO_DATE('201803','YYYYMM')) 
	,PARTITION P201803 VALUES LESS THAN(TO_DATE('201804','YYYYMM')) 
	,PARTITION P201804 VALUES LESS THAN(TO_DATE('201805','YYYYMM')) 
	,PARTITION P201805 VALUES LESS THAN(TO_DATE('201806','YYYYMM')) 
	,PARTITION P201806 VALUES LESS THAN(TO_DATE('201807','YYYYMM')) 
	,PARTITION P201807 VALUES LESS THAN(TO_DATE('201808','YYYYMM')) 
	,PARTITION P201808 VALUES LESS THAN(TO_DATE('201809','YYYYMM')) 
	,PARTITION P201809 VALUES LESS THAN(TO_DATE('201810','YYYYMM')) 
	,PARTITION P201810 VALUES LESS THAN(TO_DATE('201811','YYYYMM')) 
	,PARTITION P201811 VALUES LESS THAN(TO_DATE('201812','YYYYMM')) 
	,PARTITION P201812 VALUES LESS THAN(TO_DATE('201901','YYYYMM')) 
	,PARTITION P201901 VALUES LESS THAN(TO_DATE('201902','YYYYMM')) 
	,PARTITION P201902 VALUES LESS THAN(TO_DATE('201903','YYYYMM')) 
	,PARTITION P201903 VALUES LESS THAN(TO_DATE('201904','YYYYMM')) 
	,PARTITION P201904 VALUES LESS THAN(TO_DATE('201905','YYYYMM')) 
	,PARTITION P201905 VALUES LESS THAN(TO_DATE('201906','YYYYMM')) 
	,PARTITION P201906 VALUES LESS THAN(TO_DATE('201907','YYYYMM')) 
	,PARTITION P201907 VALUES LESS THAN(TO_DATE('201908','YYYYMM')) 
	,PARTITION P201908 VALUES LESS THAN(TO_DATE('201909','YYYYMM')) 
	,PARTITION P201909 VALUES LESS THAN(TO_DATE('201910','YYYYMM'))
	)
	;

COMMENT ON TABLE K_CHANNEL.DWD_CMF_ORDER_D IS '渠道路由订单';

COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.CMF_SEQ_NO IS '渠道流水号，yyyymmdd+seq_cmf_order';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.PAYMENT_SEQ_NO IS '支付流水号';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.REQUEST_BATCH_NO IS '请求批次号';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.ORDER_TYPE IS '订单类型：I（入款），B（退款），O（出款）';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.PRODUCT_CODE IS '产品码';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.PAYMENT_CODE IS '支付编码';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.MEMBER_ID IS '会员ID,现阶段是PT帐号';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.AMOUNT IS '金额';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.CURRENCY IS '币种';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.INST_CODE IS '机构编码';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.PAYMENT_NOTIFY_STATUS IS '支付结果通知状态：S（通知成功），F（通知失败），N（不通知）';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.COMMUNICATE_TYPE IS '通信类型，S（单笔通信），B（批量通信）';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.STATUS IS '状态：A（待处理），C（已撤销），I（处理中），S（成功），F（失败）';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.OPERATOR IS '操作员，默认SYSTEM';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.GMT_SUBMIT IS '提交时间';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.INST_ORDER_ID IS '机构订单ID';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.GMT_CREATE IS '创建时间';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.BIZ_DATE IS '业务发生时间';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.GMT_MODIFIED IS '最后修改时间';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.MEMO IS '备注';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.EXTENSION IS '扩展信息';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.SETTLEMENT_ID IS '结算id';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.ORGI_SETTLEMENT_ID IS '原订单结算id';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.DW_CREATE_TIME IS '数仓创建时间';
COMMENT ON COLUMN K_CHANNEL.DWD_CMF_ORDER_D.DW_MODIFIED_TIME IS '数仓更新时间';


