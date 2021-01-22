{{ config(
    schema = "sirius",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:mdfdBy::varchar AS mdfdBy
        , value:mdfdDtTm::varchar AS mdfdDtTm
        , value:mjrClntCd::varchar AS mjrClntCd
        , value:mjrClntNm::varchar AS mjrClntNm
        , value:mjrClntRprtngFlg::varchar AS mjrClntRprtngFlg
        , value:tmstmp::varchar AS tmstmp
        , 'sirius'          AS sys_load_src
        , CURRENT_DATE()    AS sys_load_ts
FROM {{ source('sirius','ext_mjrclnt') }}
    