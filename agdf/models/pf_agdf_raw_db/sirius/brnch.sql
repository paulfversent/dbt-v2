{{ config(
    schema = "sirius",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:GLDvsnCd::number                      AS GLDvsnCd
        , value:GLSttCd::number                     AS GLSttCd
        , value:brnchCGFlg::varchar                 AS brnchCGFlg
        , value:brnchCITInsrncDclrtnFlg::varchar    AS brnchCITInsrncDclrtnFlg
        , value:brnchCd::varchar                    AS brnchCd
        , value:brnchCntctPhn::varchar              AS brnchCntctPhn
        , value:brnchCshPrcssngFlg::varchar         AS brnchCshPrcssngFlg
        , value:brnchNm::varchar                    AS brnchNm
        , value:brnchTyp::varchar                   AS brnchTyp
        , value:brnchWORFlg::varchar                AS brnchWORFlg
        , value:dpstAccntCd::varchar                AS dpstAccntCd
        , value:fndsLdgrCd::number                  AS fndsLdgrCd
        , value:stt::number                         AS stt
        , value:sttCd::number                       AS sttCd
        , 'sirius'                                  AS sys_load_src
        , CURRENT_DATE()                            AS sys_load_ts
FROM {{ source('sirius','ext_brnch') }}
    