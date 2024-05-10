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

  function ParseAddress(const pmcAddress: string): ICMNameAddress;
  var
    sArr: TStringDynArray;
    count: integer;
    s: string;
  const
    delim = #13;
  begin
    sArr := SplitString(pmcAddress, delim);
    count := length(sArr);
    if count < 6 then
      TInvoiceException.RaiseInvoiceHeader(count,'Not enough items in address string - should be 6');
    result := TCMAddressInfo.Create;
    result.Address1 := sArr[1];
    result.Address2 := sArr[2];
    result.Address3 := sArr[3];
    result.PostalCode := sArr[4];
    result.StateOrProvince := sArr[5];
  end;

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
  var
    PU: string;
  begin
    pmcidt.lineNo := sp_Invoice.FieldByName('OrderLineNo').AsString;
    pmcidt.ProductDescr := sp_Invoice.FieldByName('ProductDescription').AsString;
    pmcidt.ProductNo := '000';
    PU := sp_Invoice.FieldByName('VolumeUnit').AsString;
    pmcidt.QuantityType := '000';
    if PU = 'Kvm aB' then
      pmcidt.QuantityType := 'Square meter'
    else if PU = 'Kvm tB' then
      pmcidt.QuantityType := 'Square meter'
    else if PU = 'Lopm' then
      pmcidt.QuantityType := 'Length meter'
    else if PU = 'm3 aDxal' then
      pmcidt.QuantityType := 'Cubic meter'
    else if PU = 'm3 aDxnl' then
      pmcidt.QuantityType := 'Cubic meter'
    else if PU = 'm3 nDxal' then
      pmcidt.QuantityType := 'Cubic meter'
    else if PU = 'm3 nDxnl' then
      pmcidt.QuantityType := 'Cubic meter'
    else if PU = 'MFBM Nom' then
      pmcidt.QuantityType := 'MFBM'
    else if PU = 'Packages' then
      pmcidt.QuantityType := 'Package'
    else if PU = 'Stycketal' then
      pmcidt.QuantityType := 'PCS'
    else
      pmcidt.QuantityType := 'UnKnown';
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
  s: string;
  i: integer;
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

//  Get data from Supplier proc.
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


      idt := TCMInvoiceDetail.Create;
      idt := collectInvoiceDetail(idt);
      pmcIdtls.add(idt);
      sp_invoice.next;
      while not sp_invoice.Eof do begin
        idt := TCMInvoiceDetail.Create;
        idt := collectInvoiceDetail(idt);
        pmcIdtls.add(idt);
        inc(i);
        sp_invoice.next;
      end;
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
