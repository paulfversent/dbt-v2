{{ config(
    schema = "checkguard",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:ATMHRSDBLTM::number AS ATMHRSDBLTM
        , value:ATMHRSNRMLTM::number AS ATMHRSNRMLTM
        , value:ATMHRSTMHLF::number AS ATMHRSTMHLF
        , value:ATMMNTNNCOVRRD::number AS ATMMNTNNCOVRRD
        , value:CNTRLSHTSID::number AS CNTRLSHTSID
        , value:CNVLMCD::varchar AS CNVLMCD
        , value:CSSTTS::number AS CSSTTS
        , value:CSTMRNMBR::varchar AS CSTMRNMBR
        , value:DBTCHNGRLLS::number AS DBTCHNGRLLS
        , value:DBTCN10::varchar AS DBTCN10
        , value:DBTCN20::varchar AS DBTCN20
        , value:DBTCN5::varchar AS DBTCN5
        , value:DBTCN50::varchar AS DBTCN50
        , value:DBTCSHTTL::varchar AS DBTCSHTTL
        , value:DBTDLLR1::varchar AS DBTDLLR1
        , value:DBTDLLR10::varchar AS DBTDLLR10
        , value:DBTDLLR100::varchar AS DBTDLLR100
        , value:DBTDLLR2::varchar AS DBTDLLR2
        , value:DBTDLLR20::varchar AS DBTDLLR20
        , value:DBTDLLR5::varchar AS DBTDLLR5
        , value:DBTDLLR50::varchar AS DBTDLLR50
        , value:DBTMJRCLNTCD::varchar AS DBTMJRCLNTCD
        , value:DBTMJRCLNTDVSNCD::number AS DBTMJRCLNTDVSNCD
        , value:DBTNMBR::number AS DBTNMBR
        , value:DBTSRVCDT::varchar AS DBTSRVCDT
        , value:DBTSRVCSSSN::varchar AS DBTSRVCSSSN
        , value:DBTSTTSCD::varchar AS DBTSTTSCD
        , value:DCKTNMBR::number AS DCKTNMBR
        , value:ENVLPNMBR::number AS ENVLPNMBR
        , value:ISCLM::number AS ISCLM
        , value:NMBRDLVRY::number AS NMBRDLVRY
        , value:NMBROFNTS::number AS NMBROFNTS
        , value:NTOFFEXPRTD::number AS NTOFFEXPRTD
        , value:PRCSSNGBRNCHCD::varchar AS PRCSSNGBRNCHCD
        , value:PRNTJRNL::varchar AS PRNTJRNL
        , value:PYNM::varchar AS PYNM
        , value:RTINDCTRCD::number AS RTINDCTRCD
        , value:SCHTRQRDFLG::number AS SCHTRQRDFLG
        , value:SRVCCD::number AS SRVCCD
        , value:SRVCMDCD::varchar AS SRVCMDCD
        , value:STTLMNTMTHD::varchar AS STTLMNTMTHD
        , value:TRNSPRTBRNCHCD::varchar AS TRNSPRTBRNCHCD
        , 'checkguard'      AS sys_load_src
        , CURRENT_DATE()    AS sys_load_ts
FROM {{ source('checkguard','ext_dbt') }}
    