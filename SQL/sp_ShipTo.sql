USE [WOODSUPPORT]
GO
/****** Object:  StoredProcedure [dbo].[vis_shipto_XML]    Script Date: 2024-05-15 11:42:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--exec dbo.vis_shipto_XML 3249
ALTER PROCEDURE [dbo].[vis_shipto_XML] 
	-- Add the parameters for the stored procedure here
	@INVOICENO int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT     DISTINCT Adr.AddressName, Adr.AddressLine1, Adr.AddressLine2, Adr.AddressLine3, Adr.AddressLine4
                         , Adr.StateOrProvince, Adr.PostalCode,  adrCy.CityName
						 , AdrCtry.CountryName, AdrCtry.ISOCountryCode, AdrCtry.CountryPhoneCode 

FROM         dbo.InvoiceShipToAddress AS InSh INNER JOIN
                      dbo.Address AS ADR ON ADR.AddressNo = InSh.AddressNo INNER JOIN
                      dbo.City AS AdrCY ON AdrCY.CityNo = ADR.CityNo INNER JOIN
                      dbo.Country AS AdrCtry ON AdrCtry.CountryNo = ADR.CountryNo INNER JOIN
                      dbo.InvoiceLO ILO ON Insh.InternalInvoiceNo = ILO.InternalInvoiceNo INNER JOIN
                      dbo.InvoiceDetail ID ON ID.InternalInvoiceNo = Insh.InternalInvoiceNo AND
                      ID.ShippingPlanNo = ILo.ShippingPlanNo 
WHERE @INVOICENO = InSh.InternalInvoiceNo 
and	  ID.Reference = InSh.Reference
END
