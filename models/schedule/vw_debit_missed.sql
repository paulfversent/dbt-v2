SELECT  I.SCHDITMID
        , I.cstmr
        , I.CustName CustomerName
        , I.MajorClientName
        , I.MajorDvsnName
        , I.BranchName
        , I.srvcCd
        , I.ServiceDesc
        , I.FrequencyName
        , I.strtDt_L Delivery_Dt
        , 'Debit' as Classification
        , 'MissedSchedule' as Status
FROM    FACT_ALL_SCHEDULES I 
--inner join AGDF_CURATED_DB.NP.VW_FACT_CNTRLSHTS CS on CS.CNTRLSHTSID = (Select max(CNTRLSHTSID) from AGDF_CURATED_DB.NP.VW_FACT_DBT)
LEFT JOIN AGDF_RAW_DB.CHECKGUARD.DBT DB
ON DB.CSTMRNMBR=I.cstmr
    AND coalesce(DB.TRNSPRTBRNCHCD,DB.PRCSSNGBRNCHCD)=I.brnchCd
    AND DB.RTINDCTRCD=I.rtIndctrCd
    AND DB.SRVCCD=I.srvcCd
    AND I.strtDt_L=DB.DBTSRVCDT
WHERE I.schdlCd<> 'X'
    AND I.end_Dt >= current_date
    AND DB.DBTSRVCDT IS NULL
    AND I.SRVCCD in (1,2,11,12,26,29,30)
    --AND I.strtDt_L <= CS.CNTRLSHTSDT
ORDER BY I.SCHDITMID, I.cstmr, I.strtDt_L