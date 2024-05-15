USE [WOODSUPPORT]
GO
/****** Object:  StoredProcedure [dbo].[vis_INVOICE_BILLTO_XML_Address]    Script Date: 2024-05-16 00:17:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- exec [dbo].[vis_INVOICE_BILLTO_XML_Address] 3252
-- exec [dbo].[vis_INVOICE_BILLTO_XML_Address] 9871

ALTER PROCEDURE [dbo].[vis_INVOICE_BILLTO_XML_Address] 
	-- Add the parameters for the stored procedure here
	@InvoiceNo int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ADR_PT.AddressName
	, ADR_PT.AddressLine1
	, ADR_PT.AddressLine2
	, ADR_PT.AddressLine3
	, ADR_PT.AddressLine4
	, ADR_PT.StateOrProvince
	, ADR_PT.PostalCode
	, CY.CityName
	, CTRY.ISOCountryCode

FROM
dbo.InvoiceHeader IH

LEFT OUTER JOIN dbo.Address ADR_PT
ON	ADR_PT.AddressNo = IH.ClientBillingAddressNo
	INNER JOIN dbo.Country	ADRCtr	
		ON	ADRCtr.CountryNo = ADR_PT.CountryNo
	INNER JOIN dbo.City CY ON CY.CityNo = ADR_PT.CityNo
	INNER JOIN dbo.Country CTRY ON CTRY.CountryNo = ADR_PT.CountryNo
WHERE IH.InternalInvoiceNo = @InvoiceNo
END
