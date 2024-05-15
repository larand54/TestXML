USE [WOODSUPPORT]
GO
/****** Object:  StoredProcedure [dbo].[vis_INVOICE_SUPPLIER_XML_Address]    Script Date: 2024-05-16 00:19:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec [dbo].[vis_INVOICE_SUPPLIER_XML_Address] 3252
-- exec [dbo].[vis_INVOICE_SUPPLIER_XML_Address] 9871

ALTER PROCEDURE [dbo].[vis_INVOICE_SUPPLIER_XML_Address] 
	-- Add the parameters for the stored procedure here
	@InvoiceNo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ADR_SUP.AddressName
	, ADR_SUP.AddressLine1
	, ADR_SUP.AddressLine2
	, ADR_SUP.AddressLine3
	, ADR_SUP.AddressLine4
	, ADR_SUP.StateOrProvince
	, ADR_SUP.PostalCode
	, CY.CityName
	, CTRY.ISOCountryCode

FROM
dbo.InvoiceHeader IH

LEFT OUTER JOIN dbo.Address ADR_SUP
ON	ADR_SUP.AddressNo = 13
	INNER JOIN dbo.Country	ADRCtr	
		ON	ADRCtr.CountryNo = ADR_SUP.CountryNo
	INNER JOIN dbo.City CY ON CY.CityNo = ADR_SUP.CityNo
	INNER JOIN dbo.Country CTRY ON CTRY.CountryNo = ADR_SUP.CountryNo
WHERE IH.InternalInvoiceNo = @InvoiceNo
END
