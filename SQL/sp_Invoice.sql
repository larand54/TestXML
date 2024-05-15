USE [WOODSUPPORT]
GO
/****** Object:  StoredProcedure [dbo].[vis_INVOICE_XML]    Script Date: 2024-05-15 11:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec [dbo].[vis_INVOICE_XML] 3252
-- exec [dbo].[vis_INVOICE_XML] 9871
-- exec [dbo].[vis_INVOICE_XML] 8850  -- 4 rader
ALTER PROCEDURE [dbo].[vis_INVOICE_XML]

@INVOICENO INT

AS
DECLARE @Language int = 0, 
	@CustomerName varchar(100)=null,
	@AddressLine1 varchar(50)=null, 
	@AddressLine2 varchar(50)=null, 
	@AddressLine3 varchar(50)=null, 
	@AddressLine4 varchar(50)=null, 
	@PostalCode varchar(10)=null,
	@CityName varchar(50)=null, 
	@CityNameDelivery varchar(50)=null, 
	@CountryName varchar(50)=null, 
	@StateOrProvince varchar(50)=null, 
	@InvoiceAddress varchar(450) = NULL,
	@DeliveryTerm varchar(100) = NULL,
	@ISOCountryCode varchar(3) = NULL
	
SELECT @CustomerName = RTRIM(isnull(IH.CustomerName,'')),
	@AddressLine1 = RTRIM(isnull(IH.AddressLine1,'')),
	@AddressLine2 = RTRIM(isnull(IH.AddressLine2,'')),
	@AddressLine3 = RTRIM(isnull(IH.AddressLine3,'')),
	@AddressLine4 = RTRIM(isnull(IH.AddressLine4,'')),
	@PostalCode = RTRIM(isnull(IH.PostalCode,'')),
	@CityName = RTRIM(isnull(IH.CityName,'')),
	@CountryName = RTRIM(isnull(IH.CountryName,'')),
	@StateOrProvince = RTRIM(isnull(IH.StateOrProvince,'')),
	@Language = isnull(IH.LanguageCode,0),
	@DeliveryTerm = isnull(IH.DeliveryTerm,'')	
FROM InvoiceHeader IH 
WHERE IH.InternalInvoiceNo = @INVOICENO

SELECT 	@ISOCountryCode = RTRIM(isnull(cy.ISOCountryCode,''))
FROM dbo.Country cy
WHERE RTRIM(cy.CountryName)=@CountryName
 
DECLARE @ShPNo int, @BookingNo int, @TRPID VARCHAR(50), @VESSEL VARCHAR(50), @ETA DateTime, @ETD DateTime, @SHIPPER VARCHAR(80), @SHIPCOMPBOOKID VARCHAR(20)
SELECT     @ShPNo = Bk.ShippingPlanNo, @BookingNo= Bk.BookingNo, 
		@ETD=Vg.ETD, @ETA=Vg.ETA, 
			
		   @VESSEL = Cr.CarrierName, @SHIPPER=SC.ClientName, 
   --                   Bk.PreliminaryRequestedPeriod AS READYDATE, Bk.ShippersShipDate AS SHIPLOADDATE, Bk.ShippersShipTime AS SHIPLOADTIME,
           @TRPID=Bk.SupplierReference,
           @SHIPCOMPBOOKID=Bk.ShippingCompanyBookingID
FROM         dbo.BookingInvoice AS Bk LEFT OUTER JOIN
                      dbo.VoyageInvoice AS Vg ON Bk.VoyageNo = Vg.VoyageNo AND Bk.InternalInvoiceNo = Vg.InternalInvoiceNo LEFT OUTER JOIN
                      dbo.Client AS SC ON Bk.ShippingCompanyNo = SC.ClientNo LEFT OUTER JOIN
                      dbo.Carrier AS Cr ON Vg.CarrierNo = Cr.CarrierNo
WHERE Bk.InternalInvoiceNo=@INVOICENO 
 
 
 
UPDATE dbo.InvoiceHeader SET PaymentText = Null
WHERE 
InternalInvoiceNo = @INVOICENO
AND SupplierNo = 5666

DECLARE @TLoads TABLE
(
	ShippingPlanNo int,
	NoOfLoads int
)
INSERT INTO @TLoads(ShippingPlanNo, NoOfLoads)
 (SELECT ILO.ShippingPlanNo, COUNT(L.LoadNo)
	FROM dbo.InvoiceLO ILO 
	inner join dbo.LoadShippingPlan LS ON LS.ShippingPlanNo = ILO.ShippingPlanNo
	INNER JOIN dbo.Loads L ON L.LoadNo=LS.LoadNo
	WHERE ILO.InternalInvoiceNo=@INVOICENO
	GROUP BY ILO.ShippingPlanNo) 


--
Select @CityNameDelivery = isnull(AdrCY.CityName,'')
FROM
dbo.InvoiceHeader IH
INNER JOIN dbo.InvoiceLO LO		ON LO.InternalInvoiceNo = IH.InternalInvoiceNo
INNER JOIN dbo.InvoiceDetail IDT	ON IDT.InternalInvoiceNo = LO.InternalInvoiceNo
					AND IDT.ShippingPlanNo = LO.ShippingPlanNo

LEFT OUTER JOIN   dbo.InvoiceShipToAddress AS InSh 
INNER JOIN   dbo.Address AS ADR ON ADR.AddressNo = InSh.AddressNo 
INNER JOIN   dbo.City AS AdrCY ON AdrCY.CityNo = ADR.CityNo 
INNER JOIN   dbo.Country AS AdrCtry ON AdrCtry.CountryNo = ADR.CountryNo 
 ON IH.InternalInvoiceNo = InSh.InternalInvoiceNo
			and	  LTRIM(RTRIM(IDT.Reference)) = LTRIM(RTRIM(InSh.Reference))
WHERE
IH.InternalInvoiceNo = @INVOICENO
and IDT.TypeOfRow in(1,2)

--

-- print('@CityNameDelivery = ' + @CityNameDelivery)


IF @Language <> 1 SET @Language = 0

SELECT
IH.InternalInvoiceNo		AS	INT_INVOICENO, 
IH.TotalAM3 AS TotalQuantity,
IH.Inv_Value_To_Be_Paid_2 AS ValueToBePaid,
OL.OrderLineNo,

--IH.CustomerNo,
INO.InvoiceNo			AS	INV_NO, 
IH.InvoiceType			AS	INV_TYPE, 
IH.InvoiceDate			AS	INV_DATE, 
RTRIM(IH.CustomerName) AS CustomerName, 
RTRIM(IH.SearchName) AS SearchName,
RTRIM(IH.AgentName) AS AgentName, 
IH.AgentCommission		AS	AGENT_COMM, 
IH.SendInvoiceToAgent		AS	SEND_INV_TOAGENT, 
IH.CommissionPaidByCustomer	AS	CUST_PAY_COMM, 
rtrim(CONVERT(VARCHAR(MAX),IH.InvoiceText)) 			AS	INV_TEXT, 
IH.PaymentText			AS	PAYMENT_TEXT, 
--PayText.PaymentText			AS	PAYMENT_TEXT, 
IH.VAT_OnInvoice, 
IH.VAT,
LO.CarrierName, 
--LO.ETD,  
--LO.ETA, 
@Customername AS CustomerName,
@Addressline1 AS CustomerAddressLine1,
@Addressline2 AS CustomerAddressLine2,
@Addressline3 AS CustomerAddressLine3,
@PostalCode AS CustomerPostalCode, 
@CityName AS CustomerCityName, 
@StateOrProvince AS CustomerStateOrProvince,
@CountryName AS CustomerCountryName, 
@ISOCountryCode AS ISOCountryCode,

CASE 
	WHEN IH.DeliveryTerm like '%Fritt levererat kund%'
		THEN 'Fritt levererat ' + @CityNameDelivery
	ELSE IH.DeliveryTerm
END AS DeliveryTerm,
-- IH.DeliveryTerm,
IH.PaymentDescription, 
IH.Destination, 
IH.FreightInDiscount, 
IH.FreightInCommission, 
IH.Discount1,
IH.Discount*(IH.Inv_Value_To_Be_Paid_2/IH.Tot_Inv_Inc_Freight_Extras) AS DISCOUNT_INCLVAT,
IH.CurrencyName			AS CURRENCY,

IH.Tot_Inv_Inc_Freight_Extras,
IH.SUM_FreigthCost,
IH.Total_Product_Value_No_Freight,
IH.Discount,
IH.Commission,
IH.Commission_and_Discount,
IH.Inv_Value_Deduct_Com_Dis,
isnull(IH.VAT_Value,0) AS VAT_Value,
IH.Inv_Value_To_Be_Paid,
IH.Inv_Value_To_Be_Paid_2,

LO.OrderNoText,
LO.Reference AS CUSTREF,
LO.ShippingPlanNo,
LO.OurReference,
LO.SalesMan,
LO.BookingNo,
LO.TotalFreightCost,
LO.FreightCostPerUnit,
LO.InvoiceAdditionAmount,
LO.InvoiceAdditionUnitNo,
LO.InvoiceAdditionDescription,
--LO.TrpID,
(SELECT L.NoOfLoads FROM @TLoads L WHERE L.ShippingPlanNo = LO.ShippingPlanNo) AS NoOfLoads, 

IDT.TypeOfRow,
IDT.LoadNo,
IDT.LoadID,
RTRIM(LTRIM(IDT.Reference)) AS SHIPREF,
IDT.ProductDescription,
IDT.LengthDescription,
IDT.Price,
IDT.VolumeUnit,
--IDT.PriceUnit,
IDT.ProductValue,
IDT.Volume_OrderUnit,
IDT.ActualThicknessMM,
IDT.ActualWidthMM,
IDT.NominalThicknessMM,
IDT.NominalWidthMM,
IDT.NominalThicknessINCH,
IDT.NominalWidthINCH,
IDT.LinealMeter,
IDT.NoOfPieces,
IDT.NoOfPkgs,
PL.ActualLengthMM,
IDT.NominalM3 AS NominalM3,
CAST(ROUND(IDT.NominalThicknessMM*IDT.NominalWidthMM*IDT.LinealMeter/1000000, 4) AS NUMERIC(12,3)) AS NM3,
IDT.ActualNetM3 AS ActualNetM3,
CAST(ROUND(IDT.ActualThicknessMM*IDT.ActualWidthMM*IDT.LinealMeter/1000000, 4) AS NUMERIC(12,3)) AS AM3,

	CASE
		WHEN IDT.PriceUnit = 'Kvm aB' THEN 'M2'
		WHEN IDT.PriceUnit = 'Kvm tB' THEN 'M2'
		WHEN IDT.PriceUnit = 'Lopm a' THEN 'LPM'
		WHEN IDT.PriceUnit = 'm3 aDxaL' THEN 'AM3'
		WHEN IDT.PriceUnit = 'm3 aDxnL' THEN 'AM3'
		WHEN IDT.PriceUnit = 'm3 nDxaL' THEN 'NM3'
		WHEN IDT.PriceUnit = 'm3 nDxnL' THEN 'NM3'
		WHEN IDT.PriceUnit = 'MFBM Nom' THEN 'MFBM'
		WHEN IDT.PriceUnit = 'Packages' THEN 'PKGS'
		WHEN IDT.PriceUnit = 'Stycketal' THEN 'PCS'
	END AS PRICE_UNIT,


IsNull(Payt.NoOfDaysDiscount2,0) AS NoOfDaysDiscount1,
IH.SalesOrgNo,
IDT.InvoiceDetailNo,
IH.SupplierNo,
OL.PackageCode,
IDT.OL_Reference AS KR_REF
, isnull(IH.ST_PostalCode,'') 	AS ST_Postalcode
, isnull(IH.ST_CityName,'')	AS ST_CITY
, isnull(IH.DestinationText,'')	AS ST_DestText
, isnull(IH.ST_AddressLine1,'') AS ST_AddressLine1
, isnull(IH.ST_AddressLine2,'') AS ST_AddressLine2
, isnull(IH.ST_AddressLine3,'') AS ST_AddressLine3
, isnull(IH.ST_AddressLine4,'') AS ST_AddressLine4
, isnull(IH.ST_CountryName,'')  AS ST_CountryName
, isnull(IH.ST_StateOrProvince,'') AS ST_StateOrProvince

, IH.QuickInvoice,

CASE
	WHEN OH.SU = 1 AND OH.CustomerNo = 388 -- Skatteupplag + BYGGMAX = ByggMax Norge 
--	THEN  convert(nvarchar(MAX), DATEADD(day,15,IH.InvoiceDate), 23)+', '+convert(nvarchar(MAX), DATEADD(day,30,IH.InvoiceDate), 23)
    THEN convert(nvarchar(MAX), DATEADD(day,30,IH.InvoiceDate), 23)
	WHEN OH.CustomerNo in (366,30518) -- Skatteupplag + BYGGMAX = ByggMax Sverige 
--	THEN  convert(nvarchar(MAX), DATEADD(day,15,IH.InvoiceDate), 23)+', '+convert(nvarchar(MAX), DATEADD(day,30,IH.InvoiceDate), 23)
    THEN convert(nvarchar(MAX), DATEADD(day,30,IH.InvoiceDate), 23)
	ELSE convert(nvarchar(MAX), IH.Duedate, 23) -- Use VAT
END AS strDueDate

,IH.DueDate
,csd.ProductCodeInfo
,@SHIPPER AS SHIPPER
,@TRPID AS TRPID
,CASE WHEN @ETA='1900-01-01 00:00:00.000' THEN '' ELSE CONVERT(VARCHAR(10),@ETA,21) END AS ETA
,CASE WHEN @ETD='1900-01-01 00:00:00.000' THEN '' ELSE CONVERT(VARCHAR(10),@ETD,21) END AS ETD
,@VESSEL AS VESSEL
,@SHIPCOMPBOOKID AS SHIPCOMPBOOKID
,pin.PET

,PC.ProductCode AS ArticleNo

-- Bill to address
,ADR_PT.AddressName AS BillTo_Name
,ADR_PT.AddressLine1 AS BillTo_AddressLine1
,ADR_PT.AddressLine2 AS BillTo_AddressLine2
,ADR_PT.AddressLine3 AS BillTo_AddressLine3
,ADR_PT.AddressLine4 AS BillTo_AddressLine4
,PT_CY.CityName AS BillTo_City
,ADRCTR.CountryName AS BillTo_Country
,ADRCTR.ISOCountryCode AS BillTo_CountryCodeISO
,ADR_PT.PostalCode AS BillTo_PostalCode
,ADR_PT.StateOrProvince AS BillTo_StateOrProvince



,CASE
	WHEN OH.SU = 1 AND OH.SpecialMoms = 0
	THEN (select LTrim(RTrim(TC.Text)) FROM Text_Common TC where TC.name='Skatteupplag' AND TC.language = @Language)
	--THEN 'Skatteupplag, hänvisar till den relevanta bestämmelsen i mervärdesskattelagen.' 
	ELSE ''
END	AS SkatteUpplag

,CASE
	WHEN OH.SU = 1 AND OH.SpecialMoms = 0 
	THEN 1 -- No use of VAT
	WHEN C.SalesRegionNo != OH.SalesRegionNo
	THEN 1 -- No use of VAT
	ELSE 0 -- Use VAT
END AS USE_VAT
, InSh.Reference
, InSh.ShippingPlanNo
, ADR.AddressName
, ADR.AddressLine1
, ADR.AddressLine2
, ADR.AddressLine3
, ADR.AddressLine4
, ADR.StateOrProvince
, ADR.PostalCode
, AdrCY.CityName AS AddressCity
, AdrCtry.CountryName AS AddressCountry
, InSh.AddressNo
, C.Kundnr
, C.VATNo

FROM
dbo.InvoiceHeader IH
INNER JOIN dbo.Client 			C	ON 	C.ClientNo		= IH.CustomerNo
INNER JOIN dbo.InvoiceLO LO		ON LO.InternalInvoiceNo = IH.InternalInvoiceNo
INNER JOIN dbo.InvoiceDetail IDT	ON IDT.InternalInvoiceNo = LO.InternalInvoiceNo
					AND IDT.ShippingPlanNo = LO.ShippingPlanNo
LEFT JOIN dbo.InvoiceNos INO		ON INO.InternalInvoiceNo = IH.InternalInvoiceNo
Left Outer Join dbo.ProductLength PL ON pl.ProductLengthNo = IDT.ProductLengthNo
Left Outer Join dbo.PaymentTerms payt on payt.PaymentTermsNo = IH.PaymentTermsNo

Left Outer Join dbo.CustomerShippingPlanDetails csd 
Inner Join dbo.Orders OH ON  OH.OrderNo = csd.OrderNo
Inner Join dbo.OrderLine OL on OL.OrderNo = csd.OrderNo and OL.OrderLineNo = csd.OrderLineNo
Left Outer join dbo.ProdInstru pin on pin.ProdInstruNo = OL.ProdInstructNo
on csd.CustShipPlanDetailObjectNo = idt.CustShipPlanDetailObjectNo


LEFT OUTER JOIN   dbo.InvoiceShipToAddress AS InSh 
INNER JOIN   dbo.Address AS ADR ON ADR.AddressNo = InSh.AddressNo 
INNER JOIN   dbo.City AS AdrCY ON AdrCY.CityNo = ADR.CityNo 
INNER JOIN   dbo.Country AS AdrCtry ON AdrCtry.CountryNo = ADR.CountryNo 
 ON IH.InternalInvoiceNo = InSh.InternalInvoiceNo
			and	  LTRIM(RTRIM(IDT.Reference)) = LTRIM(RTRIM(InSh.Reference))

-- PaymentClientNames text
LEFT OUTER JOIN dbo.Address ADR_PT
	INNER JOIN dbo.Country	ADRCtr	
		ON	ADRCtr.CountryNo 	= ADR_PT.CountryNo
	ON	ADR_PT.AddressNo = OH.ClientBillingAddressNo
	inner join dbo.city PT_CY ON PT_CY.CityNo = ADR_PT.CityNo 
LEFT OUTER Join dbo.PaymentTextII PayText 
	ON      PayText.CurrencyNo = OH.CurrencyNo
    AND     PayText.LanguageCode = OH.LanguageCode
    AND     PayText.CountryNo = ADR_PT.CountryNo
    AND     PayText.SalesRegionNo = OH.SalesRegionNo

-- Artikelnummer
  left outer join Product_code          PC ON PC.ClientNo = OH.CustomerNo AND PC.ProductNo=OL.ProductNo AND PL.ActualLengthMM = PC.ALMM
-- End Artikelnummer  

WHERE
IH.InternalInvoiceNo = @INVOICENO
order by TypeOfRow
-- order by IH.InternalInvoiceNo, INO.InvoiceNo, IH.InvoiceType, InSh.Reference
