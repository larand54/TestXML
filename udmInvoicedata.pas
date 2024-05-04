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
    function collectInvoiceData(const pmcInvNo: string; const pmcInvoice: ICMInvoice): boolean;
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
//  , vcl.dialogs
  , uInvoiceException
;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmXMLInvoice.collectInvoiceData(const pmcInvNo: string; const pmcInvoice: ICMInvoice): boolean;
var
  intInvNo: integer;
  invHead: TCMInvoiceHeader;
begin
  fInvoice := pmcInvoice;
  fDBReadComplete := false;
  result := false;
  if sp_Invoice.Active then
    sp_Invoice.Close;
  if sp_ShipTo.Active then
    sp_ShipTo.Close;
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

//  Get data from ShipTo proc.
      sp_ShipTo.ParamByName('@InvoiceNo').AsInteger := fInternalInvNo;
      sp_ShipTo.Active := true;

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
      fInvoice.Get_InvoiceHeader;
      fInvoiceHeader.InvoiceNumber := pmcInvNo;
      fInvoiceHeader.Set_InvoiceDate(sp_Invoice.FieldByName('Invoicedate').AsString);
    finally
  if sp_Invoice.Active then
    sp_Invoice.Close;
  if sp_ShipTo.Active then
    sp_ShipTo.Close;
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
