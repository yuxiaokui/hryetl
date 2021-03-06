----- 收单
select 
v0.MEMBER_TYPE,
v0.ECOLOGY_TYPE,
v0.GROUP_TYPE,
v0.B_PROJECT,
v1.TRADE_TYPE,
sum(v1.SUCCESS_BILL_COUNT) SUCCESS_BILL_COUNT,
sum(v1.total_amount) total_amount
from BIDATA.V_BUSINESS_TAG v0
left join BIDATA.V_SD_WEEK_3RD v1
on v0.MEMBER_ID=v1.MEMBER_ID
WHERE v1.TOTAL_AMOUNT is not NULL
and v0.ECOLOGY_TYPE !='社会化'
group by
v0.MEMBER_TYPE,
v0.ECOLOGY_TYPE,
v0.GROUP_TYPE,
v0.B_PROJECT,
v1.TRADE_TYPE
;

----- 出款
select 
v0.MEMBER_TYPE,
v0.ECOLOGY_TYPE,
v0.GROUP_TYPE,
v0.B_PROJECT,
sum(v1.SUCCESS_BILL_COUNT) SUCCESS_BILL_COUNT,
sum(v1.total_amount) total_amount
from V_BUSINESS_TAG v0
left join V_CK_WEEK_3RD v1
on v0.MEMBER_ID=v1.MEMBER_ID
WHERE v1.TOTAL_AMOUNT is not NULL
and v0.ECOLOGY_TYPE !='社会化'
group by 
v0.MEMBER_TYPE,
v0.ECOLOGY_TYPE,
v0.GROUP_TYPE,
v0.B_PROJECT,
v1.submit_date
ORDER BY v0.MEMBER_TYPE,
v0.ECOLOGY_TYPE,
v0.GROUP_TYPE,
v0.B_PROJECT
;


select 
*
from V_BUSINESS_TAG v0
left join V_CK_WEEK_3RD v1
on v0.MEMBER_ID=v1.MEMBER_ID
WHERE v1.TOTAL_AMOUNT is not NULL
and v0.ECOLOGY_TYPE !='社会化'
order by v1.SUBMIT_DATE,v0.MEMBER_TYPE,v0.MEMBER_ID
;
