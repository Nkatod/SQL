SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
Declare @tID int   = 3561643;
Declare @LotSpec int   = 29600961;

WITH ActualTenders(Tender_ID, MAXTenderUPDDATE, MaxLotSpecUPDDATE, MaxPrUppdate, LotSpec_ID)  
AS  
(  
       SELECT        T8.Tender_ID, MAX(dateadd(millisecond, -datepart(millisecond, T8.TenderUPDDATE), T8.TenderUPDDATE)) AS MAXTenderUPDDATE, MAX(ISNULL(T8.LotSpecUPDDATE, CAST('1970-01-01T00:00:01' AS datetime))) AS MaxLotSpecUPDDATE, MAX(ISNULL(T8.PrUppdate, 
                         CAST('1970-01-01T00:00:01' AS datetime))) AS MaxPrUppdate, T8.LotSpec_ID
FROM            (SELECT        T2.Tender_ID, MAX(dateadd(millisecond, -datepart(millisecond, T2.TenderUPDDATE), T2.TenderUPDDATE)) AS MAXTenderUPDDATE, MAX(ISNULL(T2.LotSpecUPDDATE, CAST('1970-01-01T00:00:01' AS datetime))) AS MaxLotSpecUPDDATE, T2.LotSpec_ID
                          FROM            export_lancetAll_UPDATE AS T2 
						  INNER JOIN
                                                        (SELECT        Tender_ID, MAX(dateadd(millisecond, -datepart(millisecond, TenderUPDDATE), TenderUPDDATE)) AS MAXTenderUPDDATE
                                                          FROM            export_lancetAll_UPDATE -- with (INDEX(NCI_Join))
                                                          GROUP BY Tender_ID) AS T1 ON T2.Tender_ID = T1.Tender_ID AND dateadd(millisecond, -datepart(millisecond, T2.TenderUPDDATE), T2.TenderUPDDATE) = T1.MAXTenderUPDDATE
                         WHERE        (T2.Tender_ID = @tID) AND (T2.LotSpec_ID = @LotSpec)
                          GROUP BY T2.Tender_ID, T2.LotSpec_ID) AS T7 INNER JOIN
                         export_lancetAll_UPDATE  AS T8 
						 ON T8.Tender_ID = T7.Tender_ID AND dateadd(millisecond, -datepart(millisecond, T8.TenderUPDDATE), T8.TenderUPDDATE) = T7.MAXTenderUPDDATE AND T8.LotSpecUPDDATE = T7.MaxLotSpecUPDDATE AND 
                         T8.LotSpec_ID = T7.LotSpec_ID
GROUP BY T8.Tender_ID, T8.LotSpec_ID
)  


SELECT T5.Tender_ID
,T5.LotSpec_ID
,T5.TenderUPDDATE
,isNull(T5.LotSpecUPDDATE, cast('1970-01-01T00:00:01' as datetime))
,isNull(T5.PrUppdate, cast('1970-01-01T00:00:01' as datetime))
FROM
ActualTenders as T4
INNER JOIN
export_lancetAll_UPDATE as T5
on T4.Tender_ID = T5.Tender_ID 
and dateadd(millisecond, -datepart(millisecond, T5.TenderUPDDATE), T5.TenderUPDDATE) = T4.MAXTenderUPDDATE
and isNull(T5.LotSpecUPDDATE, cast('1970-01-01T00:00:01' as datetime)) = T4.MaxLotSpecUPDDATE
and isNull(T5.PrUppdate, cast('1970-01-01T00:00:01' as datetime)) = T4.MaxPrUppdate
and T4.LotSpec_ID = T5.LotSpec_ID

where T4.Tender_ID is null