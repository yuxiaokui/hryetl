INSERT INTO K_CHANNEL_ODS.CMF_ORDER_INC NOLOGGING
SELECT * FROM CMF.TT_CMF_ORDER@KJTDB S0
WHERE S0.GMT_CREATE >= TO_DATE('20170101','YYYYMMDD') AND S0.GMT_CREATE<TO_DATE('20170616','YYYYMMDD')
--WHERE S0.GMT_CREATE>=TO_DATE('20160101','YYYYMMDD') AND S0.GMT_CREATE<TO_DATE('2017101','YYYYMMDD')
--WHERE S0.GMT_CREATE>=TO_DATE('20150101','YYYYMMDD') AND S0.GMT_CREATE<TO_DATE('20160101','YYYYMMDD')
--WHERE S0.GMT_CREATE<TO_DATE('20150101','YYYYMMDD')
;

COMMIT;