{{ config(
    schema = "checkguard",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:CSID::number              AS CSID
        , value:CSTMRNMBR::varchar      AS CSTMRNMBR
        , value:CSTMRSHRTNM::varchar    AS CSTMRSHRTNM
        , value:DCKTNMBR::varchar       AS DCKTNMBR
        , value:DLVRT::varchar          AS DLVRT
        , value:NMBROFDLVRS::number     AS NMBROFDLVRS
        , value:RNNMBR::varchar         AS RNNMBR
        , value:RTINDCTRCD::number      AS RTINDCTRCD
        , value:SNDRYID::number         AS SNDRYID
        , value:SNDRYSTTSCD::varchar    AS SNDRYSTTSCD
        , value:SRVCBRNCH::varchar      AS SRVCBRNCH
        , value:SRVCCD::number          AS SRVCCD
        , value:SRVCDT::varchar         AS SRVCDT
        , value:SRVCMD::varchar         AS SRVCMD
        , 'checkguard'                  AS sys_load_src
        , CURRENT_DATE()                AS sys_load_ts
FROM {{ source('checkguard','ext_sndry') }}
    