{{ config(
    schema = "sirius",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:brnchCd::varchar AS brnchCd
        , value:cstmrNmbr::varchar AS cstmrNmbr
        , value:endDt::varchar AS endDt
        , value:excptnFlg::number AS excptnFlg
        , value:rtIndctrCd::number AS rtIndctrCd
        , value:rvwAdmnDtTm::varchar AS rvwAdmnDtTm
        , value:rvwAdmnUsrNm::varchar AS rvwAdmnUsrNm
        , value:schdlBtchID::number AS schdlBtchID
        , value:schdlFrqncyCd::varchar AS schdlFrqncyCd
        , value:schdlItmID::number AS schdlItmID
        , value:schdlTypCd::varchar AS schdlTypCd
        , value:srvcCd::number AS srvcCd
        , value:strtDt::varchar AS strtDt
        , value:sttsCd::varchar AS sttsCd
        , value:wkDy::number AS wkDy
        , 'sirius'          AS sys_load_src
        , CURRENT_DATE()    AS sys_load_ts
FROM {{ source('sirius','ext_schdlitm') }}
    