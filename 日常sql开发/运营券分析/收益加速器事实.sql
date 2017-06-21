with TMP_ACCELERATION_GRANT_FACT AS (
select
t0.PROMOTION_ACTIVITY_ID,
t1.ACTIVITY_TYPE ACTIVITY_TYPE_id,
decode(t1.ACTIVITY_TYPE,1,'推广',2,'刮刮乐',3,'收益加速器',4,'领券中心',5,'唤醒用户',6,'回款奖励') ACTIVITY_TYPE_NAME,
t1.PROMOTION_ACTIVITY_NAME,
t0.ORDER_ID,
t0.PRODUCT_ID,
t0.PRODUCT_NAME,
t0.PRODUCT_RATE,
t0.ORDER_AMOUNT,
t0.ORDER_OWNER_HRY_ID OWNER_HRY_ID,
t0.ORDER_OWNER_NAME OWNER_NAME,
t0.ACCELERATOR_HRY_ID,
t0.ACCELERATOR_NAME,
t0.ACCELERATION_START_TIME,
t0.ACCELERATION_END_TIME,
t0.ACCELERATION_RATE,
t0.ACCELERATION_BENIFIT/100 ACCELERATION_BENIFIT,
decode(t0.BENIFIT_STATUS,1,'奖励生成',5,'生成还款信息') BENIFIT_STATUS
from BIDATA.S_PROMO_ACCELERATION_ORDER t0
left join BIDATA.S_PROMO_PROMOTION_ACTIVITY t1
on t0.PROMOTION_ACTIVITY_ID=t1.ID
WHERE t0.STATUS=1 --- 只看有效
)

select
'线上活动' AS dis_channel_type
,t0.activity_type_name
,'使用' AS action_type
,to_char(t0.ACCELERATION_START_TIME,'yyyymm') d_month
,sum(t0.ACCELERATION_BENIFIT) amt
from TMP_ACCELERATION_GRANT_FACT t0
group by '线上活动',t0.activity_type_name,'使用',to_char(t0.ACCELERATION_START_TIME,'yyyymm')
;