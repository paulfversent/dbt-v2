{{ config(
    schema = "sirius",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:cgSrvcFlg::varchar AS cgSrvcFlg
        , value:drctnFlg::varchar AS drctnFlg
        , value:srvcCd::number AS srvcCd
        , value:srvcCdCshVlmTyp::varchar AS srvcCdCshVlmTyp
        , value:srvcCdDpstSrvcFlg::varchar AS srvcCdDpstSrvcFlg
        , value:srvcCdVlmTyp::varchar AS srvcCdVlmTyp
        , value:srvcDscrptn::varchar AS srvcDscrptn
        , value:srvcGrpCd::number AS srvcGrpCd
        , value:sttlmntMthdMndtryFlg::varchar AS sttlmntMthdMndtryFlg
        , value:tmstmp::varchar AS tmstmp
        , value:vmsSrvcFlg::varchar AS vmsSrvcFlg
        , 'sirius'          AS sys_load_src
        , CURRENT_DATE()    AS sys_load_ts
FROM {{ source('sirius','ext_srvccd') }}
