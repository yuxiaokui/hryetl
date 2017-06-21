--有推荐码的渠道数据
select channel_name,count(1) from (
select to_char(a.created_time,'yyyymmdd') created_time,a.f01 user_id,b.promoter_id,
       decode(c.channel_name,null,decode(d.channelname,'youmi',d.channelname,'推荐码'),c.channel_name) as channel_name 
  from s_s61_t6110 a left join s_promo_promotion_relation b on a.f01=b.promoted_id left join s_promo_channel_info c on b.promoter_id = c.ID
left join bi_offline_usr d on a.kjtid = d.memberid
where promoter_id is not null
and a.f01 in (select f03 from s_s62_t6250 where f07 = 'F')
)
group by channel_name



-- 无推荐码的渠道数据
select platform,channelname,count(1) from (
select distinct a.logtime as rptdt,
a.sys_type as platform, 
case when a.channel = 'apple_normal' then nvl(b.channel_name,'其他'） else nvl(a.channel,'H5'） end as channelname
,a.user_id as memberid,upper(sys_name) as systemverion,a.log_time as createdate
from (
  select * from -- 创建bi_login_h5_app
  (
  select network,network_manager,to_char(log_time,'yyyyMMdd') as logtime,log_time,channel,device_id,user_id,sys_type,sys_name,ip_add,event_type,event_status,rn,rn2,cts,cts2,
  start_num as login_num2,sum(case when cts>30 then 1 else 0 end ) over(partition by user_id,event_type)+1 as login_num,province,city
  from 
  (
  select network,
  case when network_manager='UNKNOWN' then null else network_manager end as network_manager,log_time,channel,device_id,user_id,
   case when REGEXP_LIKE(sys_name, 'android', 'i') then 'ANDROID'
    when  REGEXP_LIKE(sys_name, 'ios', 'i') then 'IOS'when REGEXP_LIKE(sys_name, 'h5', 'i') then 'H5' else 'NULL' end sys_type,sys_name,ip_add,event_type,event_status,
  row_number() over(partition by user_id,event_type order by log_time) as rn,
  row_number() over(partition by user_id, event_type order by log_time desc) as rn2,
  count(1) over(partition by user_id,event_type) as start_num,
  oracle_to_unix(log_time) - oracle_to_unix(lead(log_time,1,log_time) over(partition by user_id,event_type order by log_time desc)) as cts,
  oracle_to_unix(lead(log_time,1,log_time) over(partition by user_id,event_type order by log_time)) - oracle_to_unix(log_time)  as cts2,province,city
  from bi_log where to_char(log_time,'yyyyMMdd')<20170203  and user_id is not null and event_type in ('register','login') and event_status ='success'
  and user_id in (select b.kjtid from s_s62_t6250 a inner join s_s61_t6110 b on a.f03 = b.f01 where a.f07 = 'F')
  and user_id not in (select b.kjtid from s_promo_promotion_relation a inner join s_s61_t6110 b on a.promoted_id = b.f01 where kjtid is not null)
  ) t 
  ) t
)
 a
left join ODS_CHANNEl_DEVICE_MSG b on b.idfa=a.device_id
where event_type='register' and event_status='success'
)
group by channelname,platform


--实名未交易人数
select count(1) from s_s61_t6110 a inner join s_s61_t6141 b on a.f01 = b.f01 where a.f01 not in (select f03 from s_s62_t6250 where f07 = 'F') AND B.F04 = 'TG'

--实名人数
select count(1) from s_s61_t6141 where f04 = 'TG'




-- 无推广码的用户
select count(distinct(user_id)) from 
  (-- 创建的bi_login_h5_app
  select network,network_manager,to_char(log_time,'yyyyMMdd') as logtime,log_time,channel,device_id,user_id,sys_type,sys_name,ip_add,event_type,event_status,rn,rn2,cts,cts2,
  start_num as login_num2,sum(case when cts>30 then 1 else 0 end ) over(partition by user_id,event_type)+1 as login_num,province,city
  from 
  (
  select network,
  case when network_manager='UNKNOWN' then null else network_manager end as network_manager,log_time,channel,device_id,user_id,
   case when REGEXP_LIKE(sys_name, 'android', 'i') then 'ANDROID'
    when  REGEXP_LIKE(sys_name, 'ios', 'i') then 'IOS'when REGEXP_LIKE(sys_name, 'h5', 'i') then 'H5' else 'NULL' end sys_type,sys_name,ip_add,event_type,event_status,
  row_number() over(partition by user_id,event_type order by log_time) as rn,
  row_number() over(partition by user_id, event_type order by log_time desc) as rn2,
  count(1) over(partition by user_id,event_type) as start_num,
  oracle_to_unix(log_time) - oracle_to_unix(lead(log_time,1,log_time) over(partition by user_id,event_type order by log_time desc)) as cts,
  oracle_to_unix(lead(log_time,1,log_time) over(partition by user_id,event_type order by log_time)) - oracle_to_unix(log_time)  as cts2,province,city
  from bi_log where to_char(log_time,'yyyyMMdd')<20170203  and user_id is not null and event_type in ('register','login') and event_status ='success'
  --and user_id in (select b.kjtid from s_s62_t6250 a inner join s_s61_t6110 b on a.f03 = b.f01 where a.f07 = 'F') -- 交易用户
  and user_id not in (select b.kjtid from s_promo_promotion_relation a inner join s_s61_t6110 b on a.promoted_id = b.f01 where kjtid is not null)
  ) t
  ) t
;

-- 有推广码的用户
select count(distinct(user_id)) from (
select to_char(a.created_time,'yyyymmdd') created_time,a.f01 user_id,b.promoter_id,
       decode(c.channel_name,null,decode(d.channelname,'youmi',d.channelname,'推荐码'),c.channel_name) as channel_name 
  from s_s61_t6110 a left join s_promo_promotion_relation b on a.f01=b.promoted_id left join s_promo_channel_info c on b.promoter_id = c.ID
left join bi_offline_usr d on a.kjtid = d.memberid
where promoter_id is not null
--and a.f01 in (select f03 from s_s62_t6250 where f07 = 'F' and f03 is not null) --交易用户
)


-- 最早记录为 15年11月17日
select * from bi_log order by create_time asc

-- 20151201这一天注册用户有567432 说明是之前注册的都算到这一天了
select count(1) from s_s61_t6110 where to_char(created_time,'yyyymmdd') = 20151201


