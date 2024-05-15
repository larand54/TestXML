unit udmInvoicedata;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MSSQLDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.ODBCBase, FireDAC.Comp.UI
  , IInvoiceInterfaces
  , uInvoiceClasses
  , uInvoiceType
;

type
  TdmXMLInvoice = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    con1: TFDConnection;
    sp_Invoice: TFDStoredProc;
    sp_ShipTo: TFDStoredProc;
    sp_InvoicedLoad: TFDStoredProc;
    sp_CertWood: TFDStoredProc;
    sp_KD_Certification: TFDStoredProc;
    qry_InternalFromInvno: TFDQuery;
    sp_BillTo: TFDStoredProc;
    sp_Supplier: TFDStoredProc;
    sp_Buyer: TFDStoredProc;
  private
    { Private declarations }
    fInternalInvNo: integer;
    fDBReadComplete: boolean;
    fInvNo: integer;
    fDBComplete: boolean;
    fInvoice: ICMInvoice;
    fInvoiceHeader: ICMInvoiceHeader;
    function getInternalInvoiceNo(const pmcInvNo: integer): integer;
    function getInvoiceHeader(const pmcInvNo: integer): ICMInvoiceHeader;
    procedure DataModuleCreate(Sender: TObject);
  public
    { Public declarations }

//    function retrieveListOfInvoices(const pcmBuyer: string; const pcmFromDate: string);
    function collectInvoiceData(const pmcInvNo: string; const pmcInvoice: ICMInvoice; const pmcIdtls: ICMInvoiceDetails): boolean;
    function retrieveInvoiceHeader: ICMInvoiceHeader;
    function retrieveShipTo: ICMParty;
    function retrieveBillTo: ICMParty;
    function retrieveBuyer: ICMParty;
    property DBReadComplete: boolean read fDBComplete;
    property con: TFDConnection read con1;
    property invno: integer read fInvNo;
  end;

var
  dmXMLInvoice: TdmXMLInvoice;

implementation
uses
  uWS_Utils
  , strUtils
  , system.types
//  , vcl.dialogs
  , uInvoiceException
;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmXMLInvoice.collectInvoiceData(const pmcInvNo: string; const pmcInvoice: ICMInvoice; const pmcIdtls: ICMInvoiceDetails): boolean;


  function getShipToAddress: ICMNameAddress;
  begin
    result := TCMAddressInfo.create;
    result.Name1 := sp_ShipTo.FieldByName('AddressName').AsString;
    result.Address1 := sp_ShipTo.FieldByName('AddressLine1').AsString;
    result.Address2 := sp_ShipTo.FieldByName('AddressLine2').AsString;
    result.Address3 := sp_ShipTo.FieldByName('AddressLine3').AsString;
    result.PostalCode := sp_ShipTo.FieldByName('PostalCode').AsString;
    result.StateOrProvince := sp_ShipTo.FieldByName('StateOrProvince').AsString;
    result.City := sp_ShipTo.FieldByName('CityName').AsString;
    result.Country := sp_ShipTo.FieldByName('ISOCountryCode').AsString;
  end;

  function getBillToAddress: ICMNameAddress;
  begin
    result := TCMAddressInfo.create;
    result.Name1 := sp_BillTo.FieldByName('AddressName').AsString;
    result.Address1 := sp_BillTo.FieldByName('AddressLine1').AsString;
    result.Address2 := sp_BillTo.FieldByName('AddressLine2').AsString;
    result.Address3 := sp_BillTo.FieldByName('AddressLine3').AsString;
    result.PostalCode := sp_BillTo.FieldByName('PostalCode').AsString;
    result.StateOrProvince := sp_BillTo.FieldByName('StateOrProvince').AsString;
    result.City := sp_BillTo.FieldByName('CityName').AsString;
    result.Country := sp_BillTo.FieldByName('ISOCountryCode').AsString;
  end;

  function getSupplierAddress: ICMNameAddress;
  begin
    result := TCMAddressInfo.create;
    result.Name1 := sp_Supplier.FieldByName('AddressName').AsString;
    result.Address1 := sp_Supplier.FieldByName('AddressLine1').AsString;
    result.PostalCode := sp_Supplier.FieldByName('PostalCode').AsString;
    result.StateOrProvince := sp_Supplier.FieldByName('StateOrProvince').AsString;
    result.City := sp_Supplier.FieldByName('CityName').AsString;
    result.Country := sp_Supplier.FieldByName('ISOCountryCode').AsString;
  end;

  function getBuyerAddress: ICMNameAddress;
  begin
    result := TCMAddressInfo.create;
    result.Name1 := sp_Buyer.FieldByName('CustomerName').AsString;
    result.Address1 := sp_Buyer.FieldByName('AddressLine1').AsString;
    result.PostalCode := sp_Buyer.FieldByName('PostalCode').AsString;
    result.StateOrProvince := sp_Buyer.FieldByName('StateOrProvince').AsString;
    result.City := sp_Buyer.FieldByName('CityName').AsString;
    result.Country := sp_Buyer.FieldByName('ISOCountryCode').AsString;
  end;

  function collectInvoiceDetail(const pmcidt: ICMInvoiceDetail): ICMInvoicedetail;
(*
	<xs:simpleType name="quantityType">
		<xs:restriction base="xs:string">
			<xs:enumeration value="ActualVolume"/>
			<xs:enumeration value="AirDryWeight"/>
			<xs:enumeration value="Area"/>
			<xs:enumeration value="BoneDry"/>
			<xs:enumeration value="Count"/>
			<xs:enumeration value="Distance"/>
			<xs:enumeration value="GrossWeight"/>
			<xs:enumeration value="Energy"/>
			<xs:enumeration value="Length"/>
			<xs:enumeration value="LogisticsGrossWeight"/>
			<xs:enumeration value="LogisticsNetWeight"/>
			<xs:enumeration value="LogPileGrossVolume"/>
			<xs:enumeration value="LogPileVolume"/>
			<xs:enumeration value="NetWeight"/>
			<xs:enumeration value="NetNetWeight"/>
			<xs:enumeration value="NominalWeight"/>
			<xs:enumeration value="Percent"/>
			<xs:enumeration value="RunningLength"/>
			<xs:enumeration value="ShortLengthVolume"/>
			<xs:enumeration value="SolidWoodGrossVolume"/>
			<xs:enumeration value="SolidWoodVolume"/>
			<xs:enumeration value="TareWeight"/>
			<xs:enumeration value="Time"/>
			<xs:enumeration value="TippedLooseGrossVolume"/>
			<xs:enumeration value="TippedLooseVolume"/>
			<xs:enumeration value="Volume"/>
			<xs:enumeration value="WoodGrossVolume"/>
			<xs:enumeration value="WoodVolume"/>
		</xs:restriction>
	</xs:simpleType>
*)

(*
	<xs:simpleType name="uOM">
		<xs:restriction base="xs:string">
			<xs:enumeration value="AirDryMetricTonne"/>
			<xs:enumeration value="AirDryPercent"/>
			<xs:enumeration value="AirDryShortTon"/>
			<xs:enumeration value="Bale"/>
			<xs:enumeration value="BoardFoot"/>
			<xs:enumeration value="BookUnit"/>
			<xs:enumeration value="Box"/>
			<xs:enumeration value="Bundle"/>
			<xs:enumeration value="C-Size"/>
			<xs:enumeration value="Celsius"/>
			<xs:enumeration value="Centimeter"/>
			<xs:enumeration value="CentimeterPerSecond"/>
			<xs:enumeration value="Cord"/>
			<xs:enumeration value="CubicCentimeterPerGram"/>
			<xs:enumeration value="CubicCentimeterPerSecond"/>
			<xs:enumeration value="CubicFoot"/>
			<xs:enumeration value="CubicInchesPerSecond"/>
			<xs:enumeration value="CubicMeter"/>
			<xs:enumeration value="CubicMeterKilometer"/>
			<xs:enumeration value="CubicMeterPerKilogram"/>
			<xs:enumeration value="Cubit"/>
			<xs:enumeration value="Day"/>
			<xs:enumeration value="Decilitre"/>
			<xs:enumeration value="Decimeter"/>
			<xs:enumeration value="Degree"/>
			<xs:enumeration value="DegreesSchopperRiegler"/>
			<xs:enumeration value="DotsPerInch"/>
			<xs:enumeration value="Envelope"/>
			<xs:enumeration value="Fahrenheit"/>
			<xs:enumeration value="Foot"/>
			<xs:enumeration value="Gallon"/>
			<xs:enumeration value="Gauge"/>
			<xs:enumeration value="Gram"/>
			<xs:enumeration value="GramCentimeter"/>
			<xs:enumeration value="GramForce"/>
			<xs:enumeration value="GramPerCubicCentimeter"/>
			<xs:enumeration value="GramPerMeter"/>
			<xs:enumeration value="GramsPerSquareMeter"/>
			<xs:enumeration value="Hectare"/>
			<xs:enumeration value="Hour"/>
			<xs:enumeration value="HundredBoardFeet"/>
			<xs:enumeration value="HundredLinealFeet"/>
			<xs:enumeration value="HundredPound"/>
			<xs:enumeration value="HundredSquareFeet"/>
			<xs:enumeration value="ImpressionCount"/>
			<xs:enumeration value="Inch"/>
			<xs:enumeration value="JoulePerSquareMeter"/>
			<xs:enumeration value="Kilogram"/>
			<xs:enumeration value="KilogramCO2e"/>
			<xs:enumeration value="KilogramCO2ePerMetricTon"/>
			<xs:enumeration value="KilogramForcePerSquareCentimeter"/>
			<xs:enumeration value="KilogramForcePerCentimeter"/>
			<xs:enumeration value="KilogramPerCubicMeter"/>
			<xs:enumeration value="KilogramPerSquareMeter"/>
			<xs:enumeration value="KilogramsPerDay"/>
			<xs:enumeration value="KilogramsPerWeek"/>
			<xs:enumeration value="Kilometer"/>
			<xs:enumeration value="KiloNewton"/>
			<xs:enumeration value="KiloNewtonPerMeter"/>
			<xs:enumeration value="KiloPascal"/>
			<xs:enumeration value="KiloWattHour"/>
			<xs:enumeration value="KiloWattHourPerMetricTon"/>
			<xs:enumeration value="KnownBreaks"/>
			<xs:enumeration value="Layer"/>
			<xs:enumeration value="Leaves"/>
			<xs:enumeration value="LinearFoot"/>
			<xs:enumeration value="LinesPerInch"/>
			<xs:enumeration value="Litre"/>
			<xs:enumeration value="Load"/>
			<xs:enumeration value="Log"/>
			<xs:enumeration value="LogPile"/>
			<xs:enumeration value="LooseVolumeItem"/>
			<xs:enumeration value="MagazineUnit"/>
			<xs:enumeration value="Megabyte"/>
			<xs:enumeration value="MegaJoulePerKilogram"/>
			<xs:enumeration value="MegaWattHour"/>
			<xs:enumeration value="MegaWattHourPerMetricTon"/>
			<xs:enumeration value="Meter"/>
			<xs:enumeration value="MeterPerSecond"/>
			<xs:enumeration value="MetricTon"/>
			<xs:enumeration value="MetricTonKilometer"/>
			<xs:enumeration value="MetricTonsPerDay"/>
			<xs:enumeration value="MetricTonsPerHour"/>
			<xs:enumeration value="MetricTonsPerWeek"/>
			<xs:enumeration value="MicroMeterPerPascalSecond"/>
			<xs:enumeration value="Micron"/>
			<xs:enumeration value="MilligramKOHPerGram"/>
			<xs:enumeration value="MilligramPerKilogram"/>
			<xs:enumeration value="MillilitrePerGram"/>
			<xs:enumeration value="MilliLitersPerMinute"/>
			<xs:enumeration value="Millimeter"/>
			<xs:enumeration value="MillimeterPerMeter"/>
			<xs:enumeration value="MilliNewton"/>
			<xs:enumeration value="MilliNewtonMeter"/>
			<xs:enumeration value="MilliNewtonSquareMeterPerGram"/>
			<xs:enumeration value="MilliPascalSecond"/>
			<xs:enumeration value="Minute"/>
			<xs:enumeration value="Month"/>
			<xs:enumeration value="NanoMeter"/>
			<xs:enumeration value="Newton"/>
			<xs:enumeration value="NewtonMeterPerGram"/>
			<xs:enumeration value="None"/>
			<xs:enumeration value="Package"/>
			<xs:enumeration value="Page"/>
			<xs:enumeration value="PagesPerForm"/>
			<xs:enumeration value="PagesPerImpression"/>
			<xs:enumeration value="PagesPerInch"/>
			<xs:enumeration value="PalletUnit"/>
			<xs:enumeration value="PartsPerMillion"/>
			<xs:enumeration value="PascalSecond"/>
			<xs:enumeration value="Percentage"/>
			<xs:enumeration value="PerThousand"/>
			<xs:enumeration value="pH"/>
			<xs:enumeration value="Picas"/>
			<xs:enumeration value="Piece"/>
			<xs:enumeration value="PiecesPerDay"/>
			<xs:enumeration value="PiecesPerHour"/>
			<xs:enumeration value="PiecesPerMeter"/>
			<xs:enumeration value="PixelsPerInch"/>
			<xs:enumeration value="Pound"/>
			<xs:enumeration value="PoundCO2e"/>
			<xs:enumeration value="PoundCO2ePerShortTon"/>
			<xs:enumeration value="PoundForce"/>
			<xs:enumeration value="PoundPerCubicFoot"/>
			<xs:enumeration value="PoundPerSixInchDiameter"/>
			<xs:enumeration value="PoundPerSquareInch"/>
			<xs:enumeration value="PoundsPerDay"/>
			<xs:enumeration value="PoundsPerHour"/>
			<xs:enumeration value="PoundsPerWeek"/>
			<xs:enumeration value="PulpUnit"/>
			<xs:enumeration value="Ream"/>
			<xs:enumeration value="Reel"/>
			<xs:enumeration value="Second"/>
			<xs:enumeration value="Set"/>
			<xs:enumeration value="Sheet"/>
			<xs:enumeration value="ShortTon"/>
			<xs:enumeration value="ShortTonsPerDay"/>
			<xs:enumeration value="ShortTonsPerHour"/>
			<xs:enumeration value="ShortTonsPerWeek"/>
			<xs:enumeration value="Signature"/>
			<xs:enumeration value="Skid"/>
			<xs:enumeration value="SquareDecimeter"/>
			<xs:enumeration value="SquareFeet"/>
			<xs:enumeration value="SquareInch"/>
			<xs:enumeration value="SquareMeter"/>
			<xs:enumeration value="SquareMeterPerKilogram"/>
			<xs:enumeration value="SquareMillimeterPerKilogram"/>
			<xs:enumeration value="SquareMillimeterPerSecond"/>
			<xs:enumeration value="TenKilometer"/>
			<xs:enumeration value="ThousandBoardFeet"/>
			<xs:enumeration value="ThousandLinealFeet"/>
			<xs:enumeration value="ThousandPieces"/>
			<xs:enumeration value="ThousandSheet"/>
			<xs:enumeration value="ThousandSquareCentimeters"/>
			<xs:enumeration value="ThousandSquareFeet"/>
			<xs:enumeration value="ThousandSquareInch"/>
			<xs:enumeration value="Ton"/>
			<xs:enumeration value="TonsPerHour"/>
			<xs:enumeration value="Unit"/>
			<xs:enumeration value="UnknownBreaks"/>
			<xs:enumeration value="Week"/>
			<xs:enumeration value="Yard"/>
			<xs:enumeration value="Year"/>
		</xs:restriction>
	</xs:simpleType>
*)
  var
    PU: string;
  begin
    pmcidt.lineNo := sp_Invoice.FieldByName('InvoiceDetailNo').AsString;
    pmcidt.ProductDescr := sp_Invoice.FieldByName('ProductDescription').AsString;
    pmcidt.ProductNo := sp_Invoice.FieldByName('productNo').AsString;
    pmcidt.prodGroup := sp_Invoice.FieldByName('productGroupNo').AsString;
    PU := sp_Invoice.FieldByName('VolumeUnit').AsString;
    pmcidt.QuantityType := '000';
    if PU = 'Kvm aB' then begin
      pmcidt.QuantityType := 'Area';
      pmcidt.UOM := 'SquareMeter';
    end
    else if PU = 'Kvm tB' then begin
      pmcidt.QuantityType := 'Area';
      pmcidt.UOM := 'SquareMeter';
    end
    else if PU = 'Lopm' then begin
      pmcidt.QuantityType := 'Length';
      pmcidt.UOM := 'Meter';
    end
    else if PU = 'm3 aDxaL' then begin
      pmcidt.QuantityType := 'Volume';
      pmcidt.UOM := 'CubicMeter';
    end
    else if PU = 'm3 aDxnL' then begin
      pmcidt.QuantityType := 'Volume';
      pmcidt.UOM := 'CubicMeter';
    end
    else if PU = 'm3 nDxaL' then begin
      pmcidt.QuantityType := 'Volume';
      pmcidt.UOM := 'CubicMeter';
    end
    else if PU = 'm3 nDxnL' then begin
      pmcidt.QuantityType := 'Volume';
      pmcidt.UOM := 'CubicMeter';
    end
    else if PU = 'MFBM Nom' then begin
      pmcidt.QuantityType := 'Volume';
      pmcidt.UOM := 'MFBM';
    end
    else if PU = 'Packages' then begin
      pmcidt.QuantityType := 'Count';
      pmcidt.UOM := 'Package';
    end
    else if PU = 'Stycketal' then
      pmcidt.UOM := 'Count'
    else begin
      pmcidt.UOM := 'UnKnown';
    end;
    pmcidt.QUOM := sp_Invoice.FieldByName('Volume_OrderUnit').AsFloat;
    pmcidt.CurrencyType := sp_Invoice.FieldByName('Currency').AsString;
    pmcidt.CurrencyValue := sp_Invoice.FieldByName('Price').AsFloat;
    pmcidt.LineValue := sp_Invoice.FieldByName('ProductValue').AsFloat;
//    pmcidt.TaxPercent := sp_Invoice.FieldByName('VATPercent').AsFloat;
    result := pmcidt;
  end;
var
  intInvNo: integer;
  invHead: TCMInvoiceHeader;
  adr: ICMNameAddress;
  TD: ICMTermsOfDelivery;
  BTP: TCMBillToParty;
  SUP: TCMSupplierParty;
  BP: TCMBuyerParty;
  STP: TCMShipToParty;
  STC: TCMShipToCharacteristics;
  idtls: ICMInvoiceDetails;
  idt: ICMInvoiceDetail;
  invSum: ICMInvoiceSummary;

  s: string;
  i: integer;
  // Summeringar
  TotalQty: double;
  TotWeight: double;
  LineSubTotal: double;
  TotalAdjustments: double;
  TotalTaxAmt: double;
  TotalFASAmt: double;
  TotalAmt: double;

begin
  fInvoice := pmcInvoice;
  fDBReadComplete := false;
  result := false;
  if sp_Invoice.Active then
    sp_Invoice.Close;
  if sp_ShipTo.Active then
    sp_ShipTo.Close;
  if sp_BillTo.Active then
    sp_BillTo.Close;
  if sp_Supplier.Active then
    sp_Supplier.Close;
  if sp_Buyer.Active then
    sp_Buyer.Close;
  if sp_InvoicedLoad.Active then
    sp_InvoicedLoad.Close;
  if sp_CertWood.Active then
    sp_CertWood.Close;
  if sp_KD_Certification.Active then
    sp_KD_Certification.Close;
  if qry_InternalFromInvno.Active then
    qry_InternalFromInvno.Close;

  fInternalInvNo := getInternalInvoiceNo(strToInt(pmcInvNo));
  if fInternalInvNo > 0 then
  begin
    try

//  Get Data From invoice stored procedure
      sp_Invoice.ParamByName('@InvoiceNo').AsInteger := fInternalInvNo;
      sp_Invoice.Active := true;
      sp_invoice.first;

//  Get data from ShipTo proc.
      sp_ShipTo.ParamByName('@InvoiceNo').AsInteger := fInternalInvNo;
      sp_ShipTo.Active := true;

//  Get data from BillTo proc.
      sp_BillTo.ParamByName('@InvoiceNo').AsInteger := fInternalInvNo;
      sp_BillTo.Active := true;

//  Get data from Supplier proc.
      sp_Supplier.ParamByName('@InvoiceNo').AsInteger := fInternalInvNo;
      sp_Supplier.Active := true;

//  Get data from Buyer proc.
      sp_Buyer.ParamByName('@InvoiceNo').AsInteger := fInternalInvNo;
      sp_Buyer.Active := true;

//  Get data from InvoiceLoad proc.
      sp_InvoicedLoad.ParamByName('@InvoiceNo').AsInteger := fInternalInvNo;
      sp_InvoicedLoad.Active := true;

//  Get data from CertWood proc.
      sp_CertWood.ParamByName('@InvoiceNo').AsInteger := fInternalInvNo;
      sp_CertWood.Active := true;

//  Get data from KD_Certification proc.
      sp_KD_Certification.ParamByName('@InvoiceNo').AsInteger := fInternalInvNo;
      sp_KD_Certification.Active := true;

      fDBReadComplete := true;
      result := true;

//      Fill invoice with collected data
      fInvoiceheader := fInvoice.Get_InvoiceHeader;
      fInvoiceHeader.InvoiceNumber := pmcInvNo;
      fInvoiceHeader.Set_InvoiceDate(sp_Invoice.FieldByName('INV_DATE').AsString);
      fInvoiceHeader.LoadingOrderNo := sp_Invoice.FieldByName('ShippingPlanNo').AsString;
      fInvoiceHeader.Contract := sp_Invoice.FieldByName('OrderNoText').AsString;
      fInvoiceHeader.LoadNo := sp_InvoicedLoad.FieldByName('LoadNo').AsString;
      fInvoiceHeader.CustomerNo := sp_Invoice.FieldByName('KundNr').AsString;
      fInvoiceHeader.VATno := sp_Invoice.FieldByName('VAT').AsString;

      adr := getBillToAddress;
      BTP := TCMBillToParty.create(sp_invoice.FieldByName('CustomerName').AsString, adr );
      BTP.VATid := sp_Invoice.FieldByName('VATno').AsString;
      fInvoiceHeader.BillToParty := BTP;

      adr := getSupplierAddress;
      SUP := TCMSupplierParty.Create(sp_Supplier.FieldByName('AddressName').AsString, adr);
      SUP.VATid := '556620-1082';  // WoodSupport always
      fInvoiceHeader.SupplierParty := SUP;

      adr := getBuyerAddress;
      BP := TCMBuyerParty.Create(sp_Buyer.FieldByName('CustomerName').AsString, adr);
      BP.VATid := fInvoiceHeader.VATNo;
      fInvoiceHeader.BuyerParty := BP;

      adr := getShipToAddress;
      STC := TCMShipToCharacteristics.create(sp_ShipTo.FieldByName('AddressName').AsString, adr);
      fInvoiceHeader.ShipToCharacteristics := STC;

      TD := fInvoiceheader.ShipToCharacteristics.TermsOfDelivery;
      TD.AdditionalText := sp_Invoice.FieldByName('DeliveryTerm').AsString;
      fInvoiceHeader.ShipToCharacteristics.TermsOfDelivery := TD;
//      TermsOfDelivery;//ShipToParty.fAddress.Name1 := adr.Name1;
//      fInvoiceHeader.InvoiceReference :=
//      fInvoiceHeader.(sp_Invoice.FieldByName('').AsString);)


      // Invoice details(lines)
      sp_invoice.first;
      fInvoice.LineTotal := sp_Invoice.FieldByName('ValueToBePaid').AsString;
      fInvoice.CurrencyType := sp_Invoice.FieldByName('Currency').AsString;
      while not sp_invoice.Eof do begin
        idt := TCMInvoiceDetail.Create;
        idt := collectInvoiceDetail(idt);
        pmcIdtls.add(idt);
        sp_invoice.next;
      end;
      fInvoice.InvoiceSummary := TCMInvoiceSummary.create(fInvoice);
      fInvoice.DeliveryTerms := sp_Invoice.FieldByName('DeliveryTerm').AsString;
      fInvoice.PaymentDescription := sp_Invoice.FieldByName('PaymentDescription').AsString;
      fInvoice.InvoiceDate := sp_Invoice.FieldByName('INV_DATE').AsString;
      fInvoice.InvoiceDueDate := sp_Invoice.FieldByName('DueDate').AsString;
      pmcIdtls.rewind;  // To be sure readindex is set to first record.
    finally
  if sp_Invoice.Active then
    sp_Invoice.Close;
  if sp_ShipTo.Active then
    sp_ShipTo.Close;
  if sp_BillTo.Active then
    sp_BillTo.Close;
  if sp_Supplier.Active then
    sp_Supplier.Close;
  if sp_Buyer.Active then
    sp_Buyer.Close;
  if sp_InvoicedLoad.Active then
    sp_InvoicedLoad.Close;
  if sp_CertWood.Active then
    sp_CertWood.Close;
  if sp_KD_Certification.Active then
    sp_KD_Certification.Close;
  if qry_InternalFromInvno.Active then
    qry_InternalFromInvno.Close;
    end;
  end;

//  fInvoiceHeader := getInvoiceHeader(fInternalInvNo);

end;

procedure TdmXMLInvoice.DataModuleCreate(Sender: TObject);
begin

// Setup connection
  with con1 do
  begin
    Params.Clear;
    Params.Add('Server=' + getDBServerName);
    Params.Add('Database=' + 'Woodsupport');
    Params.Add('MetaDefSchema=dbo');
    Params.Add('DriverID=MSSQL');
    Params.Add('OSAuthent=Yes');
  end;
// Check if we can connect
  try
    con1.Open;
//    con1.close;
  except
//    ShowMessage(con1.Params.text);
  end;

end;

function TdmXMLInvoice.getInternalInvoiceNo(const pmcInvNo: integer): integer;
var
  intInvNo: integer;
begin
  qry_InternalFromInvno.ParamByName('InvNo').AsInteger := pmcInvNo;
  qry_InternalFromInvno.Open;
  if qry_InternalFromInvno.IsEmpty then begin
    result := 0;
    TInvoiceException.RaiseDBError(pmcInvNo,'No corresponding internal invoice with this invoicenumber!')
  end
  else begin
    qry_InternalFromInvno.First;
    try
      intInvNo := qry_InternalFromInvno.FieldByName('InternalInvoiceNo').AsInteger;
    finally
      result := intInvNo;
    end;
  end;
end;

function TdmXMLInvoice.getInvoiceHeader(
  const pmcInvNo: integer): ICMInvoiceHeader;
begin

end;

function TdmXMLInvoice.retrieveBillTo: ICMParty;
begin

end;

function TdmXMLInvoice.retrieveBuyer: ICMParty;
begin

end;

function TdmXMLInvoice.retrieveInvoiceHeader: ICMInvoiceHeader;
begin

end;

function TdmXMLInvoice.retrieveShipTo: ICMParty;
begin

end;

{ TDataModule2 }

end.
