CREATE TABLE K_CHANNEL_ODS.DIM_FC_TARGET_INST_R_INC
(
	ID	NUMBER(11,0)
	,FUND_CHANNEL_CODE	VARCHAR2(32 BYTE)
	,TARGET_INST_CODE	VARCHAR2(16 BYTE)
)
;

COMMENT ON TABLE K_CHANNEL_ODS.DIM_FC_TARGET_INST_R_INC IS '渠道和目标机构关系表';

COMMENT ON column K_CHANNEL_ODS.DIM_FC_TARGET_INST_R_INC.ID IS '关系ID';
COMMENT ON column K_CHANNEL_ODS.DIM_FC_TARGET_INST_R_INC.FUND_CHANNEL_CODE IS '渠道编码';
COMMENT ON column K_CHANNEL_ODS.DIM_FC_TARGET_INST_R_INC.TARGET_INST_CODE IS '目标机构编码';