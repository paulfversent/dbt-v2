{{ config(
    schema = "checkguard",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:CNTRLSHTSDT::varchar  AS CNTRLSHTSDT
        , value:CNTRLSHTSID::number AS CNTRLSHTSID
        , value:RNDTTM::varchar     AS RNDTTM
        , 'checkguard'              AS sys_load_src
        , CURRENT_DATE()            AS sys_load_ts
FROM {{ source('checkguard','ext_cntrlshts') }}
    