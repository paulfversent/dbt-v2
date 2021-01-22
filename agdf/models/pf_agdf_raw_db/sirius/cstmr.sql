{{ config(
    schema = "sirius",
    materialized = "table",
    tags = ["full-refresh"]
) }}

SELECT	value:ITSMntnncFlg::varchar AS ITSMntnncFlg
        , value:addrssVldtnStts::varchar AS addrssVldtnStts
        , value:cstmrAddrssNm::varchar AS cstmrAddrssNm
        , value:cstmrAddrssPstcd::varchar AS cstmrAddrssPstcd
        , value:cstmrAddrssSbrb::varchar AS cstmrAddrssSbrb
        , value:cstmrAddrssStrtLn1::varchar AS cstmrAddrssStrtLn1
        , value:cstmrAddrssStt::varchar AS cstmrAddrssStt
        , value:cstmrArCd::varchar AS cstmrArCd
        , value:cstmrCrtDttm::varchar AS cstmrCrtDttm
        , value:cstmrCshngSttlmntTyp::varchar AS cstmrCshngSttlmntTyp
        , value:cstmrDpstSttlmntTyp::varchar AS cstmrDpstSttlmntTyp
        , value:cstmrInvcID::varchar AS cstmrInvcID
        , value:cstmrLctnSttCd::varchar AS cstmrLctnSttCd
        , value:cstmrLstAtrtDt::varchar AS cstmrLstAtrtDt
        , value:cstmrNmbr::varchar AS cstmrNmbr
        , value:cstmrRcptSttlmntTrms::varchar AS cstmrRcptSttlmntTrms
        , value:cstmrShrtNm::varchar AS cstmrShrtNm
        , value:cstmrStts::varchar AS cstmrStts
        , value:cstmrSttsDt::varchar AS cstmrSttsDt
        , value:cstmrUpdtDttm::varchar AS cstmrUpdtDttm
        , value:fndsLdgrTypCd::varchar AS fndsLdgrTypCd
        , value:gglLctnTyp::varchar AS gglLctnTyp
        , value:indstryCd::varchar AS indstryCd
        , value:mjrClntCd::varchar AS mjrClntCd
        , value:mjrClntDvsnCd::varchar AS mjrClntDvsnCd
        , value:prmrySrvcngBrnchCd::varchar AS prmrySrvcngBrnchCd
        , value:rtRvwTypCd::varchar AS rtRvwTypCd
        , value:srvcngSttCd::number AS srvcngSttCd
        , value:tmstmp::varchar AS tmstmp
        , 'sirius'          AS sys_load_src
        , CURRENT_DATE()    AS sys_load_ts
FROM {{ source('sirius','ext_cstmr') }}
    