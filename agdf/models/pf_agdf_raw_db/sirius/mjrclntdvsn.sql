{{ config(
    schema = "sirius",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:CGClntDtRqrd::varchar AS CGClntDtRqrd
        , value:cstmrDpstSttlmntTyp::varchar AS cstmrDpstSttlmntTyp
        , value:cstmrShrtNm::varchar AS cstmrShrtNm
        , value:indstryCd::number AS indstryCd
        , value:mdfdBy::varchar AS mdfdBy
        , value:mdfdDtTm::varchar AS mdfdDtTm
        , value:mjrClntCd::varchar AS mjrClntCd
        , value:mjrClntDvsnATMFndsLdgrFlg::varchar AS mjrClntDvsnATMFndsLdgrFlg
        , value:mjrClntDvsnCd::number AS mjrClntDvsnCd
        , value:mjrClntDvsnClntDtRqrd::varchar AS mjrClntDvsnClntDtRqrd
        , value:mjrClntDvsnLctnStt1SttlStt::number AS mjrClntDvsnLctnStt1SttlStt
        , value:mjrClntDvsnLctnStt2SttlStt::number AS mjrClntDvsnLctnStt2SttlStt
        , value:mjrClntDvsnLctnStt3SttlStt::number AS mjrClntDvsnLctnStt3SttlStt
        , value:mjrClntDvsnLctnStt4SttlStt::number AS mjrClntDvsnLctnStt4SttlStt
        , value:mjrClntDvsnLctnStt5SttlStt::number AS mjrClntDvsnLctnStt5SttlStt
        , value:mjrClntDvsnLctnStt6SttlStt::number AS mjrClntDvsnLctnStt6SttlStt
        , value:mjrClntDvsnLctnStt7SttlStt::number AS mjrClntDvsnLctnStt7SttlStt
        , value:mjrClntDvsnLctnStt8SttlStt::number AS mjrClntDvsnLctnStt8SttlStt
        , value:mjrClntDvsnNm::varchar AS mjrClntDvsnNm
        , value:mjrClntDvsnSttmntCstmrNmbr::varchar AS mjrClntDvsnSttmntCstmrNmbr
        , value:rtRvwTypCd::varchar AS rtRvwTypCd
        , value:tmstmp::varchar AS tmstmp
        , value:vmsPlCd::varchar AS vmsPlCd
        , 'sirius'          AS sys_load_src
        , CURRENT_DATE()    AS sys_load_ts
FROM {{ source('sirius','ext_mjrclntdvsn') }}
    