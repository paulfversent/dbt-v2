{{ config(
    schema = "sirius",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:cd::varchar   AS cd
        , value:nm::varchar AS nm
        , 'sirius'          AS sys_load_src
        , CURRENT_DATE()    AS sys_load_ts
FROM {{ source('sirius','ext_schdlstts') }}
    