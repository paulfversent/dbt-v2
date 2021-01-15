select I.SCHDITMID, I.cstmr, I.CustName CustomerName, I.MajorClientName, I.MajorDvsnName, I.BranchName, I.srvcCd, I.ServiceDesc, I.FrequencyName, 
I.strtDt_L Delivery_Dt, 'Deposit' as Classification, 'MissedSchedule' as Status
from FACT_ALL_SCHEDULES I 
--inner join AGDF_CURATED_DB.NP.VW_FACT_CNTRLSHTS CS on CS.CNTRLSHTSID = (Select max(CNTRLSHTSID) from AGDF_CURATED_DB.NP.VW_FACT_DPST)
left join AGDF_RAW_DB.CHECKGUARD.DPST DP on DP.CSTMRNMBR=I.cstmr and DP.BRNCHCD=I.brnchCd and DP.RTINDCTRCD=I.rtIndctrCd and DP.SRVCCD=I.srvcCd and I.strtDt_L=DP.SRVCDT
where I.schdlCd<> 'X' and I.end_Dt >= current_date and DP.SRVCDT IS NULL and I.SRVCCD in (10,20,21,23,24,51,54,56,57)
--and I.strtDt_L <= CS.CNTRLSHTSDT 
ORDER BY I.SCHDITMID, I.cstmr, I.strtDt_L