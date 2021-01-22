{{ config(
    schema = "sirius",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:cmmnts::varchar AS cmmnts
        , value:flNm::varchar AS flNm
        , value:imprtDtTm::varchar AS imprtDtTm
        , value:schdlBtchID::number AS schdlBtchID
        , value:usrNm::varchar AS usrNm
        , 'sirius'          AS sys_load_src
        , CURRENT_DATE()    AS sys_load_ts
FROM {{ source('sirius','ext_schdlbtch') }}
    