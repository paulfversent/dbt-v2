{{ config(
    schema = "checkguard",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:ADJSTMNTAMNT::varchar AS ADJSTMNTAMNT
        , value:BGSLSCNT::number AS BGSLSCNT
        , value:BGSRLLDCNT::number AS BGSRLLDCNT
        , value:BRNCHCD::varchar AS BRNCHCD
        , value:CGSTTSCD::varchar AS CGSTTSCD
        , value:CNTRLSHTSID::number AS CNTRLSHTSID
        , value:CRTDBY::varchar AS CRTDBY
        , value:CRTDDTTM::varchar AS CRTDDTTM
        , value:CSTMRDT::varchar AS CSTMRDT
        , value:CSTMRNMBR::varchar AS CSTMRNMBR
        , value:DCMNTTYP::varchar AS DCMNTTYP
        , value:DLVRYCNT::number AS DLVRYCNT
        , value:DPSTAMNT::varchar AS DPSTAMNT
        , value:DPSTDLLR10::varchar AS DPSTDLLR10
        , value:DPSTDLLR100::varchar AS DPSTDLLR100
        , value:DPSTDLLR20::varchar AS DPSTDLLR20
        , value:DPSTDLLR5::varchar AS DPSTDLLR5
        , value:DPSTDLLR50::varchar AS DPSTDLLR50
        , value:DPSTDYOFWK::number AS DPSTDYOFWK
        , value:DPSTID::number AS DPSTID
        , value:DPSTNMBR::number AS DPSTNMBR
        , value:DPSTSTTSCD::varchar AS DPSTSTTSCD
        , value:ENVLPCNT::number AS ENVLPCNT
        , value:ITMCNT::number AS ITMCNT
        , value:LNKDTPRNTFLG::varchar AS LNKDTPRNTFLG
        , value:MDFDBY::varchar AS MDFDBY
        , value:MDFDDTTM::varchar AS MDFDDTTM
        , value:MJRCLNTCD::varchar AS MJRCLNTCD
        , value:MJRCLNTDVSNCD::number AS MJRCLNTDVSNCD
        , value:NTCNT::number AS NTCNT
        , value:PYNM::varchar AS PYNM
        , value:RTINDCTRCD::number AS RTINDCTRCD
        , value:SRVCCD::number AS SRVCCD
        , value:SRVCDT::varchar AS SRVCDT
        , value:SRVCMDCD::varchar AS SRVCMDCD
        , value:STTCHNGDBY::varchar AS STTCHNGDBY
        , value:STTCHNGDDTTM::varchar AS STTCHNGDDTTM
        , value:TRNSCTNCD::number AS TRNSCTNCD
        , value:TRNSMSSNNMBR::varchar AS TRNSMSSNNMBR
        , value:TRNSPRTBRNCHCD::varchar AS TRNSPRTBRNCHCD
        , value:WKENDNGDT::varchar AS WKENDNGDT
        , 'checkguard'      AS sys_load_src
        , CURRENT_DATE()    AS sys_load_ts
FROM {{ source('checkguard','ext_dpst') }}
    