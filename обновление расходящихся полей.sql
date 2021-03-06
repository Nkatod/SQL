	Declare @NP datetime = Cast('2016-01-01T00:00:00' as datetime);
	Declare @KP datetime = DATEADD (week , 1 , @NP );
	if OBJECT_ID('tempdb..#Temp1') is not null Drop Table #Temp1;

	WHILE @NP <= GetDate()
	BEGIN
	if OBJECT_ID('tempdb..#Temp1') is not null Drop Table #Temp1;

	
Select
	Tender_ID
,	LotSpec_ID
,	ProductIdNx
,	Lot_ID
,	ContractIdNx
,	Form
,	ProdNm
,	Org_SubCustNm
,	InnrContr
--,	LotPriceDiff
,	PlanT_ID
,	PlanName
,	Id_FormNameCon
,	ConFormName
,	TradeNmRContr
,	InnR
,	ConDrugFmNmR
,	Id_DrugFmNmRCon
,	ATCCode
,	IsTheEnd
,	IsTheEndID
,	Id_DrugFmNmR
,	DrugFmNmR
,	CntLS
,	InnE
,	OGRN
,	CntWin
,	FormName
,	Id_FormName
,	Su_Inn
,	Su_Kpp
,	Su_OrganizationName
,	PlanTYear
,	TradeNmR
,	IsNotOnlyLS
,	TndCancelType
,	StatusT_ID
,	StatusT_name
,	TndCancelT_id
,	OrgType
,	Org_ProviderNm
,	OrgNmShot
,	Org_CustNm
,	ConsigneeNm
,	TradeNmE
,	Proizvoditel
,	LawNm
,	ContrObesp
--,	TenderSrcPlan     --не используется
	Into #Temp1
FROM [HWC_ORIGINAL].[HWC_DATA].[dbo].[export_lancetAll]
Where TenderSYSDATE>=@NP and TenderSYSDATE < @KP;

Insert HWC_DATA_LANCET.[dbo].[ForDownload]
(
	   LotSpec_ID)
select Distinct T1.LotSpec_ID as LotSpec_ID
,T1.Form, T2.Form 
,T1.ProdNm, T2.ProdNm 
,T1.Org_SubCustNm, T2.Org_SubCustNm 
,T1.InnrContr, T2.InnrContr 
----,T1.LotPriceDiff, T2.LotPriceDiff --Погрешность мала
,T1.PlanT_ID, T2.PlanT_ID 
,T1.PlanName, T2.PlanName 
,T1.Id_FormNameCon, T2.Id_FormNameCon 
,T1.ConFormName, T2.ConFormName 
,T1.TradeNmRContr, T2.TradeNmRContr 
,T1.InnR, T2.InnR 
,T1.ConDrugFmNmR, T2.ConDrugFmNmR 
,T1.Id_DrugFmNmRCon, T2.Id_DrugFmNmRCon 
,T1.ATCCode, T2.ATCCode 
,T1.IsTheEnd, T2.IsTheEnd 
,T1.IsTheEndID, T2.IsTheEndID 
,T1.Id_DrugFmNmR, T2.Id_DrugFmNmR 
,T1.DrugFmNmR, T2.DrugFmNmR 
,T1.CntLS, T2.CntLS 
,T1.InnE, T2.InnE 
,T1.OGRN, T2.OGRN 
,T1.CntWin, T2.CntWin 
,T1.FormName, T2.FormName 
,T1.Id_FormName, T2.Id_FormName 
,T1.Su_Inn, T2.Su_Inn 
,T1.Su_Kpp, T2.Su_Kpp 
,T1.Su_OrganizationName, T2.Su_OrganizationName 
,T1.PlanTYear, T2.PlanTYear 
,T1.TradeNmR, T2.TradeNmR 
,T1.IsNotOnlyLS, T2.IsNotOnlyLS 
,T1.TndCancelType, T2.TndCancelType 
,T1.StatusT_ID, T2.StatusT_ID 
,T1.StatusT_name, T2.StatusT_name 
,T1.TndCancelT_id, T2.TndCancelT_id 
,T1.OrgType, T2.OrgType 
,T1.Org_ProviderNm, T2.Org_ProviderNm 
,T1.OrgNmShot, T2.OrgNmShot 
,T1.Org_CustNm, T2.Org_CustNm 
,T1.ConsigneeNm, T2.ConsigneeNm 
,T1.TradeNmE, T2.TradeNmE 
,T1.Proizvoditel, T2.Proizvoditel 
------,T1.TenderSrcPlan, T2.TenderSrcPlan --Не используется в 1С
from #Temp1 as T1
Left join [HWC_DATA_LANCET].[dbo].[export_lancetAll] as T2
On
	T1.Tender_ID = T2.Tender_ID 
	and isnull(T1.LotSpec_ID, -111) = isnull(T2.LotSpec_ID, -111) 
	and isnull(T1.ProductIdNx, -111) = isnull(T2.ProductIdNx, -111) 
	and isnull(T1.Lot_ID, -111) = isnull(T2.Lot_ID, -111) 
	and isnull(T1.ContractIdNx, -111) = isnull(T2.ContractIdNx, -111)
	and T2.TenderSYSDATE>=@NP and T2.TenderSYSDATE < @KP
Where
	T2.Tender_ID is NULL	
	or isnull(T1.Form, '') <> isnull(T2.Form, '')
	or isnull(T1.ProdNm, '') <> isnull(T2.ProdNm, '')
	or isnull(T1.Org_SubCustNm, '') <> isnull(T2.Org_SubCustNm, '')
	or isnull(T1.InnrContr, '') <> isnull(T2.InnrContr, '')
	--or isnull(T1.LotPriceDiff, -111) <> isnull(T2.LotPriceDiff, -111)
	or isnull(T1.PlanT_ID, -111) <> isnull(T2.PlanT_ID, -111)
	or isnull(T1.PlanName, '') <> isnull(T2.PlanName, '')
	or isnull(T1.Id_FormNameCon, -111) <> isnull(T2.Id_FormNameCon, -111)
	or isnull(T1.ConFormName, '') <> isnull(T2.ConFormName, '')
	or isnull(T1.TradeNmRContr, '') <> isnull(T2.TradeNmRContr, '')
	or isnull(T1.InnR, '') <> isnull(T2.InnR, '')
	or isnull(T1.ConDrugFmNmR, '') <> isnull(T2.ConDrugFmNmR, '')
	or isnull(T1.Id_DrugFmNmRCon, -111) <> isnull(T2.Id_DrugFmNmRCon, -111)
	or isnull(T1.ATCCode, '') <> isnull(T2.ATCCode, '')
	or isnull(T1.IsTheEnd, -111) <> isnull(T2.IsTheEnd, -111)
	or isnull(T1.IsTheEndID, -111) <> isnull(T2.IsTheEndID, -111)
	or isnull(T1.Id_DrugFmNmR, -111) <> isnull(T2.Id_DrugFmNmR, -111)
	or isnull(T1.DrugFmNmR, '') <> isnull(T2.DrugFmNmR, '')
	or isnull(T1.CntLS, -111) <> isnull(T2.CntLS, -111)
	or isnull(T1.InnE, '') <> isnull(T2.InnE, '')
	or isnull(T1.OGRN, '') <> isnull(T2.OGRN, '')
	or isnull(T1.CntWin, -111) <> isnull(T2.CntWin, -111)
	or isnull(T1.FormName, '') <> isnull(T2.FormName, '')
	or isnull(T1.Id_FormName, -111) <> isnull(T2.Id_FormName, -111)
	or isnull(T1.Su_Inn, '') <> isnull(T2.Su_Inn, '')
	or isnull(T1.Su_Kpp, '') <> isnull(T2.Su_Kpp, '')
	or isnull(T1.Su_OrganizationName, '') <> isnull(T2.Su_OrganizationName, '')
	or isnull(T1.PlanTYear, -111) <> isnull(T2.PlanTYear, -111)
	or isnull(T1.TradeNmR, '') <> isnull(T2.TradeNmR, '')
	or isnull(T1.IsNotOnlyLS, 0) <> isnull(T2.IsNotOnlyLS, 0)
	or isnull(T1.TndCancelType, '') <> isnull(T2.TndCancelType, '')
	or isnull(T1.StatusT_ID, -111) <> isnull(T2.StatusT_ID, -111)
	or isnull(T1.StatusT_name, '') <> isnull(T2.StatusT_name, '')
	or isnull(T1.TndCancelT_id, -111) <> isnull(T2.TndCancelT_id, -111)
	or isnull(T1.OrgType, '') <> isnull(T2.OrgType, '')
	or isnull(T1.Org_ProviderNm, '') <> isnull(T2.Org_ProviderNm, '')
	or isnull(T1.OrgNmShot, '') <> isnull(T2.OrgNmShot, '')
	or isnull(T1.Org_CustNm, '') <> isnull(T2.Org_CustNm, '')
	or isnull(T1.ConsigneeNm, '') <> isnull(T2.ConsigneeNm, '')
	or isnull(T1.TradeNmE, '') <> isnull(T2.TradeNmE, '')
	or isnull(T1.Proizvoditel, '') <> isnull(T2.Proizvoditel, '')
	or isnull(T1.LawNm, '') <> isnull(T2.LawNm, '')
	or isnull(T1.ContrObesp, -111) <> isnull(T2.ContrObesp, -111)
	--or isnull(T1.TenderSrcPlan, '') <> isnull(T2.TenderSrcPlan, '')

	

	Set @NP =  DATEADD (week , 1 , @NP );
	Set @KP =  DATEADD (week , 1 , @NP );

	Print @NP;
	WAITFOR DELAY '00:00:10.500' ;

	END;



