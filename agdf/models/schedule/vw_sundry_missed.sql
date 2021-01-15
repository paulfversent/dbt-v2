select I.SCHDITMID, I.cstmr, I.CustName CustomerName, I.MajorClientName, I.MajorDvsnName, I.BranchName, I.srvcCd, I.ServiceDesc, I.FrequencyName, 
I.strtDt_L Delivery_Dt, 'Sundry' as Classification, 'MissedSchedule' as Status
from FACT_ALL_SCHEDULES I 
--inner join AGDF_CURATED_DB.NP.VW_FACT_CNTRLSHTS CS on CS.CNTRLSHTSID = (Select max(CSID) from AGDF_CURATED_DB.NP.VW_FACT_SNDRY)
left join AGDF_RAW_DB.CHECKGUARD.SNDRY SY on SY.CSTMRNMBR=I.cstmr and SY.SRVCBRNCH=I.brnchCd and SY.RTINDCTRCD=I.rtIndctrCd and SY.SRVCCD=I.srvcCd and I.strtDt_L=SY.SRVCDT
where I.schdlCd<> 'X' and I.end_Dt >= current_date and SY.SRVCDT IS NULL and I.SRVCCD in (13,22,32,35)
--and I.strtDt_L <= CS.CNTRLSHTSDT
ORDER BY I.SCHDITMID, I.cstmr, I.strtDt_L