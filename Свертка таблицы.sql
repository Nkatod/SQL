if OBJECT_ID('tempdb..#Temp1') is not null Drop Table #Temp1;


SELECT        Tender_ID, PublDt, LancetUPDATEPartition, TenderSYSDATE, NotifNr, StatusT_ID, StatusT_name, FormT_ID, FormT_name, T_RegID, RegNm, Org_CustNm, INN, KPP, OGRN, Org_SubCustNm, Org_ProviderNm, 
                         ClaimReglament, ClaimDtBeg, ClaimDtEnd, TendDt, Budget, Budgets_Name, TenderDocReglament, TendNm, TenderPrice, TenderLot, SMP, PaymentReglament, LotNr, LotNm, LotType, pozicion, OKEI_Name, 
                         Lot_ID_tmp, LotPriceStart, LotPriceMax, LotPriceDiff, LotPos, LotSpecPos, InnR, TradeNmR, ProdNm, Form, LotSpecPrice, LotSpecNum, LotSpecValue, Unit_ID, UnitsName, LotRegion, ConsigneeNm, 
                         ConsigneeInfo, PlanT_ID, PlanName, PlanTYear, PlanTVal, WinnerOrg, WinnerInfo, SupplyReglament, LotPriceOther, SrcInf, ClaimObesp, ContrObesp, LS_TradeNm_ID, LS_MNN_ID, Reg_ID, Lot_ID, Lot_Reg_ID, 
                         LotSpec_ID, OrgType, TenderUPDDATE, FO_ID, FO_Nm, Cust_ID, consID, Winner_ID, Id_DrugFmNmR, Id_FormName, DrugFmNmR, FormName, MunLevel, Org_ID, Pr_Name, Pr_Price, Pr_Quantity, Pr_Sum, 
                         NumberContract, SignDate, Su_OrganizationName, Su_Inn, Su_Kpp, IDLOTSPEC, ShortName, Lgotaname, Tender_ID_tmp, CntWin, lotTypeID, Proizvoditel, lssysdate, ProductIdNx, OrgNmShot, TndChangeType, 
                         TndChangeT_id, TndCancelType, TndCancelT_id, IsTheEnd, IsTheEndID, CnPrice, Cnhref, CntLS, isMultiple, ProdTypeDescr, ProdType_id, ContractsATC, ContractsTheEnd, ProductsProducer, TenderSrcPlan, 
                         ClaimProcDtEnd, ContractsRegNum, LotSpecNumPack, LotSpecPricePack, ConCustNM, cust_regNum, ContractStageCode, ContractStageNM, HandChek, comment, ContractIdNx, ConDrugFmNmR, ConFormName, 
                         TradeNmRContr, InnrContr, ContractsNoTRADE, INNCONCUST, NumberCustinn, LotSpecUPDDATE, Addr1, InnE, TradeNmE, InnNxCon, TradeNmNxCon, Id_DrugFmNmRCon, Id_FormNameCon, Org_SubCastId, 
                         Org_ProviderId, Enddate, IsNotOnlyLS, PrUppdate, PrInsertDate, AVGPriceStart, PriceEnd, ChannelFinanceNm, StartDateExec, EndDateExec, ATCCode, ATCmNR, Org_SubCast_INN, Org_SubCastKPP, WinnerINN, 
                         LawNm, PlatformNm, SUM(1) AS KolVo
Into #Temp1
FROM            export_lancetAll_UPDATE
GROUP BY Tender_ID, PublDt, LancetUPDATEPartition, TenderSYSDATE, NotifNr, StatusT_ID, StatusT_name, FormT_ID, FormT_name, T_RegID, RegNm, Org_CustNm, INN, KPP, OGRN, Org_SubCustNm, Org_ProviderNm, 
                         ClaimReglament, ClaimDtBeg, ClaimDtEnd, TendDt, Budget, Budgets_Name, TenderDocReglament, TendNm, TenderPrice, TenderLot, SMP, PaymentReglament, LotNr, LotNm, LotType, pozicion, OKEI_Name, 
                         Lot_ID_tmp, LotPriceStart, LotPriceMax, LotPriceDiff, LotPos, LotSpecPos, InnR, TradeNmR, ProdNm, Form, LotSpecPrice, LotSpecNum, LotSpecValue, Unit_ID, UnitsName, LotRegion, ConsigneeNm, 
                         ConsigneeInfo, PlanT_ID, PlanName, PlanTYear, PlanTVal, WinnerOrg, WinnerInfo, SupplyReglament, LotPriceOther, SrcInf, ClaimObesp, ContrObesp, LS_TradeNm_ID, LS_MNN_ID, Reg_ID, Lot_ID, Lot_Reg_ID, 
                         LotSpec_ID, OrgType, TenderUPDDATE, FO_ID, FO_Nm, Cust_ID, consID, Winner_ID, Id_DrugFmNmR, Id_FormName, DrugFmNmR, FormName, MunLevel, Org_ID, Pr_Name, Pr_Price, Pr_Quantity, Pr_Sum, 
                         NumberContract, SignDate, Su_OrganizationName, Su_Inn, Su_Kpp, IDLOTSPEC, ShortName, Lgotaname, Tender_ID_tmp, CntWin, lotTypeID, Proizvoditel, lssysdate, ProductIdNx, OrgNmShot, TndChangeType, 
                         TndChangeT_id, TndCancelType, TndCancelT_id, IsTheEnd, IsTheEndID, CnPrice, Cnhref, CntLS, isMultiple, ProdTypeDescr, ProdType_id, ContractsATC, ContractsTheEnd, ProductsProducer, TenderSrcPlan, 
                         ClaimProcDtEnd, ContractsRegNum, LotSpecNumPack, LotSpecPricePack, ConCustNM, cust_regNum, ContractStageCode, ContractStageNM, HandChek, comment, ContractIdNx, ConDrugFmNmR, ConFormName, 
                         TradeNmRContr, InnrContr, ContractsNoTRADE, INNCONCUST, NumberCustinn, LotSpecUPDDATE, Addr1, InnE, TradeNmE, InnNxCon, TradeNmNxCon, Id_DrugFmNmRCon, Id_FormNameCon, Org_SubCastId, 
                         Org_ProviderId, Enddate, IsNotOnlyLS, PrUppdate, PrInsertDate, AVGPriceStart, PriceEnd, ChannelFinanceNm, StartDateExec, EndDateExec, ATCCode, ATCmNR, Org_SubCast_INN, Org_SubCastKPP, WinnerINN, 
                         LawNm, PlatformNm
HAVING        (SUM(1) > 1);

DELETE 
FROM            export_lancetAll_UPDATE
where  Tender_ID IN
(
SELECT distinct Tender_ID from #Temp1 
)

Insert into export_lancetAll_UPDATE (Tender_ID, PublDt, LancetUPDATEPartition, TenderSYSDATE, NotifNr, StatusT_ID, StatusT_name, FormT_ID, FormT_name, T_RegID, RegNm, Org_CustNm, INN, KPP, OGRN, Org_SubCustNm, Org_ProviderNm, 
                         ClaimReglament, ClaimDtBeg, ClaimDtEnd, TendDt, Budget, Budgets_Name, TenderDocReglament, TendNm, TenderPrice, TenderLot, SMP, PaymentReglament, LotNr, LotNm, LotType, pozicion, OKEI_Name, 
                         Lot_ID_tmp, LotPriceStart, LotPriceMax, LotPriceDiff, LotPos, LotSpecPos, InnR, TradeNmR, ProdNm, Form, LotSpecPrice, LotSpecNum, LotSpecValue, Unit_ID, UnitsName, LotRegion, ConsigneeNm, 
                         ConsigneeInfo, PlanT_ID, PlanName, PlanTYear, PlanTVal, WinnerOrg, WinnerInfo, SupplyReglament, LotPriceOther, SrcInf, ClaimObesp, ContrObesp, LS_TradeNm_ID, LS_MNN_ID, Reg_ID, Lot_ID, Lot_Reg_ID, 
                         LotSpec_ID, OrgType, TenderUPDDATE, FO_ID, FO_Nm, Cust_ID, consID, Winner_ID, Id_DrugFmNmR, Id_FormName, DrugFmNmR, FormName, MunLevel, Org_ID, Pr_Name, Pr_Price, Pr_Quantity, Pr_Sum, 
                         NumberContract, SignDate, Su_OrganizationName, Su_Inn, Su_Kpp, IDLOTSPEC, ShortName, Lgotaname, Tender_ID_tmp, CntWin, lotTypeID, Proizvoditel, lssysdate, ProductIdNx, OrgNmShot, TndChangeType, 
                         TndChangeT_id, TndCancelType, TndCancelT_id, IsTheEnd, IsTheEndID, CnPrice, Cnhref, CntLS, isMultiple, ProdTypeDescr, ProdType_id, ContractsATC, ContractsTheEnd, ProductsProducer, TenderSrcPlan, 
                         ClaimProcDtEnd, ContractsRegNum, LotSpecNumPack, LotSpecPricePack, ConCustNM, cust_regNum, ContractStageCode, ContractStageNM, HandChek, comment, ContractIdNx, ConDrugFmNmR, ConFormName, 
                         TradeNmRContr, InnrContr, ContractsNoTRADE, INNCONCUST, NumberCustinn, LotSpecUPDDATE, Addr1, InnE, TradeNmE, InnNxCon, TradeNmNxCon, Id_DrugFmNmRCon, Id_FormNameCon, Org_SubCastId, 
                         Org_ProviderId, Enddate, IsNotOnlyLS, PrUppdate, PrInsertDate, AVGPriceStart, PriceEnd, ChannelFinanceNm, StartDateExec, EndDateExec, ATCCode, ATCmNR, Org_SubCast_INN, Org_SubCastKPP, WinnerINN, 
                         LawNm, PlatformNm)
SELECT DISTINCT Tender_ID, PublDt, LancetUPDATEPartition, TenderSYSDATE, NotifNr, StatusT_ID, StatusT_name, FormT_ID, FormT_name, T_RegID, RegNm, Org_CustNm, INN, KPP, OGRN, Org_SubCustNm, Org_ProviderNm, 
                         ClaimReglament, ClaimDtBeg, ClaimDtEnd, TendDt, Budget, Budgets_Name, TenderDocReglament, TendNm, TenderPrice, TenderLot, SMP, PaymentReglament, LotNr, LotNm, LotType, pozicion, OKEI_Name, 
                         Lot_ID_tmp, LotPriceStart, LotPriceMax, LotPriceDiff, LotPos, LotSpecPos, InnR, TradeNmR, ProdNm, Form, LotSpecPrice, LotSpecNum, LotSpecValue, Unit_ID, UnitsName, LotRegion, ConsigneeNm, 
                         ConsigneeInfo, PlanT_ID, PlanName, PlanTYear, PlanTVal, WinnerOrg, WinnerInfo, SupplyReglament, LotPriceOther, SrcInf, ClaimObesp, ContrObesp, LS_TradeNm_ID, LS_MNN_ID, Reg_ID, Lot_ID, Lot_Reg_ID, 
                         LotSpec_ID, OrgType, TenderUPDDATE, FO_ID, FO_Nm, Cust_ID, consID, Winner_ID, Id_DrugFmNmR, Id_FormName, DrugFmNmR, FormName, MunLevel, Org_ID, Pr_Name, Pr_Price, Pr_Quantity, Pr_Sum, 
                         NumberContract, SignDate, Su_OrganizationName, Su_Inn, Su_Kpp, IDLOTSPEC, ShortName, Lgotaname, Tender_ID_tmp, CntWin, lotTypeID, Proizvoditel, lssysdate, ProductIdNx, OrgNmShot, TndChangeType, 
                         TndChangeT_id, TndCancelType, TndCancelT_id, IsTheEnd, IsTheEndID, CnPrice, Cnhref, CntLS, isMultiple, ProdTypeDescr, ProdType_id, ContractsATC, ContractsTheEnd, ProductsProducer, TenderSrcPlan, 
                         ClaimProcDtEnd, ContractsRegNum, LotSpecNumPack, LotSpecPricePack, ConCustNM, cust_regNum, ContractStageCode, ContractStageNM, HandChek, comment, ContractIdNx, ConDrugFmNmR, ConFormName, 
                         TradeNmRContr, InnrContr, ContractsNoTRADE, INNCONCUST, NumberCustinn, LotSpecUPDDATE, Addr1, InnE, TradeNmE, InnNxCon, TradeNmNxCon, Id_DrugFmNmRCon, Id_FormNameCon, Org_SubCastId, 
                         Org_ProviderId, Enddate, IsNotOnlyLS, PrUppdate, PrInsertDate, AVGPriceStart, PriceEnd, ChannelFinanceNm, StartDateExec, EndDateExec, ATCCode, ATCmNR, Org_SubCast_INN, Org_SubCastKPP, WinnerINN, 
                         LawNm, PlatformNm from #Temp1