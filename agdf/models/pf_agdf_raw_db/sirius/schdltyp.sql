{{ config(
    schema = "sirius",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:cd::varchar AS cd
        , value:nm::varchar AS nm
        , value:schdlTypID::number AS schdlTypID
        , 'sirius' AS sys_load_src
        , CURRENT_DATE()    AS sys_load_ts
FROM {{ source('sirius','ext_schdltyp') }}
    