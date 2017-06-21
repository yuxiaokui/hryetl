select
TTTT.avg_aum_level,
count(*)
from (
select
TTT.hryid,
decode(greatest(TTT.avg_aum,49999),49999,'<l_0_5w',
      decode(greatest(TTT.avg_aum,99999),99999,'l_5w_10w',
        decode(greatest(TTT.avg_aum,199999),199999,'l_10w_20w',
          decode(greatest(TTT.avg_aum,499999),499999,'l_20w-50w',
            decode(greatest(TTT.avg_aum,999999),999999,'l_50w_100w',
              decode(greatest(TTT.avg_aum,4999999),4999999,'l_100w_500w',
          '>500w')))))) avg_aum_level
from (
select
TT.*,
(TT.p_aum_0129+TT.p_aum_0130+TT.p_aum_0131+TT.p_aum_0201+TT.p_aum_0202+TT.p_aum_0203+TT.p_aum_0204+TT.p_aum_0205+TT.p_aum_0206+TT.p_aum_0207+TT.p_aum_0208+TT.p_aum_0209+TT.p_aum_0210+TT.p_aum_0211+TT.p_aum_0212+TT.p_aum_0213+TT.p_aum_0214+TT.p_aum_0215+TT.p_aum_0216+TT.p_aum_0217+TT.p_aum_0218+TT.p_aum_0219+TT.p_aum_0220+TT.p_aum_0221+TT.p_aum_0222+TT.p_aum_0223+TT.p_aum_0224+TT.p_aum_0225+TT.p_aum_0226+TT.p_aum_0227)/30 avg_aum
from (
select
T.hryid,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170129','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170129','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0129,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170130','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170130','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0130,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170131','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170131','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0131,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170201','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170201','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0201,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170202','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170202','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0202,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170203','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170203','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0203,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170204','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170204','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0204,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170205','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170205','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0205,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170206','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170206','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0206,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170207','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170207','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0207,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170208','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170208','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0208,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170209','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170209','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0209,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170210','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170210','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0210,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170211','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170211','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0211,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170212','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170212','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0212,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170213','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170213','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0213,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170214','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170214','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0214,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170215','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170215','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0215,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170216','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170216','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0216,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170217','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170217','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0217,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170218','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170218','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0218,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170219','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170219','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0219,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170220','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170220','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0220,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170221','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170221','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0221,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170222','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170222','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0222,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170223','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170223','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0223,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170224','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170224','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0224,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170225','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170225','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0225,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170226','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170226','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0226,
nvl((select sum(p0.AMT) from TMP_P2P_PAY_BACK_PLAN p0 where p0.INCOME_DATE < to_date('20170227','yyyymmdd') and p0.TOPAY_DATE>=to_date('20170227','yyyymmdd') and p0.HRYID=T.hryid),0) p_aum_0227
from TMP_P2P_INVESTOR T
) TT
) TTT
) TTTT
group by TTTT.avg_aum_level
;
