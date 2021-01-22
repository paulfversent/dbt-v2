{{ config(
    schema = "sirius",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:cd::varchar AS cd
        , value:cnclFlg::number AS cnclFlg
        , value:grpPrio::number AS grpPrio
        , value:mnthCnt::number AS mnthCnt
        , value:nm::varchar AS nm
        , value:prio::number AS prio
        , value:tmpFlg::number AS tmpFlg
        , value:wkCnt::number AS wkCnt
        , 'sirius'          AS sys_load_src
        , CURRENT_DATE()    AS sys_load_ts
FROM {{ source('sirius','ext_schdlfrqncy') }}
    