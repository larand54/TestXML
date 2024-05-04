unit uInvoiceClasses;

interface
uses
  InvoiceWoodV2R31
  , uInvoiceType
  , IInvoiceInterfaces
  , System.Generics.Collections
  , system.classes
;
type
TCMInvoiceHeader = class;
TCMAddressInfo = class;
TCMParty = class;
//TCMDateBasis = class;
TCMCountryOfOrigin = class;

//TCMAddressInfo = class(TInterfacedObject, ICMNameAddress)
TCMAddressInfo = class
  private
    fName1: TCMName;
    fPostalCode: TCMPostalCode;
    fAddress1: TCMAddress;
    fAddress2: TCMAddress;
    fAddress3: TCMAddress;

    function Get_Name1: TCMName;
    function Get_Address1: TCMAddress;
    function Get_Address2: TCMAddress;
    function Get_Address3: TCMAddress;
    function Get_County: TCMCounty;
    function Get_City: TCMCity;
    function Get_Country: TCMCountry;
    function Get_StateOrProvince: TCMState;
    function Get_PostalCode: TCMPostalCode;

    procedure Set_Name1(const pmcValue: TCMName);
    procedure Set_Address1(const pmcValue: TCMAddress);
    procedure Set_Address2(const pmcValue: TCMAddress);
    procedure Set_Address3(const pmcValue: TCMAddress);
    procedure Set_County(const pmcCounty: TCMCounty);
    procedure Set_City(const pmcValue: TCMCity);
    procedure Set_Country(const pmcValue: TCMCountry);
    procedure Set_StateOrProvince(const pmcValue: TCMState);
    procedure Set_PostalCode(const pmcValue: TCMPostalCode);
  protected
  public
    property Name1: TCMName read Get_Name1 write Set_Name1;
    property Address1: TCMAddress read Get_Address1 write Set_Address1;
    property Address2: TCMAddress read Get_Address2 write Set_Address2;
    property Address3: TCMAddress read Get_Address3 write Set_Address3;
    property County: TCMCounty read Get_County write Set_County;
    property City: TCMCity read Get_City write Set_City;
    property Country: TCMCountry read Get_Country write Set_Country;
    property StateOrProvince: TCMState read Get_StateOrProvince write Set_StateOrProvince;
    property PostalCode: TCMPostalCode read Get_PostalCode write Set_PostalCode;
end;

TCMParty = class(TInterfacedObject, IUnknown)
    private
      fName: string;
      fAddress: ICMNameAddress;
    protected
    public
      constructor create(const pmcName: string; const pmcAddress: ICMNameAddress);
      property Name: string read fName;
      property Address: ICMNameAddress read fAddress;
  end;

TCMInvoice = class(TInterfacedObject, ICMInvoice)
  private
    fInvoiceHeader: ICMInvoiceHeader;
    fInvoiceDetails: ICMInvoiceDetails;
    fBillTo: TCMParty;
    fSupplier: TCMParty;
    fBuyer: TCMParty;
    fShipTo: TCMParty;
    function Get_InvoiceHeader: ICMInvoiceHeader;
    function Get_MonetaryAdjustment: ICMMonetaryAdjustmentList;
    function Get_InvoiceSummary: ICMInvoiceSummary;

  protected
  public
    constructor create;
    function Get_InvoiceType: TCM_XMLString;
    function Get_InvoiceContextType: TCM_XMLString;
    function Get_Reissued: TCM_XMLString;
    function Get_Language: TCM_XMLString;
    function Get_InvoiceShipment: ICMInvoiceShipmentList;
    function getInvoiceHeader: ICMInvoiceHeader;
    function getBillToParty: ICMParty;
    function getSupplierParty: ICMParty;
    function getBuyerParty: ICMParty;
    function getShipToParty: ICMParty;
    procedure Set_InvoiceType(const pmcValue: TCM_XMLString);
    procedure Set_InvoiceContextType(const pmcValue: TCM_XMLString);
    procedure Set_Reissued(const pmcValue: TCM_XMLString);
    procedure Set_Language(const pmcValue: TCM_XMLString);
    { Methods & Properties }
    property InvoiceType: TCM_XMLString read Get_InvoiceType write Set_InvoiceType;
    property InvoiceContextType: TCM_XMLString read Get_InvoiceContextType write Set_InvoiceContextType;
    property Reissued: TCM_XMLString read Get_Reissued write Set_Reissued;
    property Language: TCM_XMLString read Get_Language write Set_Language;
    property InvoiceHeader: ICMInvoiceHeader read Get_InvoiceHeader;
    property InvoiceShipment: ICMInvoiceShipmentList read Get_InvoiceShipment;
    property MonetaryAdjustment: ICMMonetaryAdjustmentList read Get_MonetaryAdjustment;
    property InvoiceSummary: ICMInvoiceSummary read Get_InvoiceSummary;
end;

{ TXMLInvoiceWoodHeader }

  TCMInvoiceHeader = class(TInterfacedObject, ICMInvoiceHeader)
  private
    fInvoicedate: TCM_XMLString;
    fInvoiceNo: TCM_XMLString;
    FInvoiceReference: ICMInvoiceReferenceList;
    FRemitToParty: ICMPartyList;
    FOtherParty: ICMPartyList;
    FReceiverParty: ICMPartyList;
    FLocationParty: ICMPartyList;
    FAdditionalText: TStringList;
    function Get_CarrierParty: ICMParty;
    function Get_CountryOfConsumption: ICMCountryOfConsumption;
  protected
    function Get_InvoiceNumber: TCM_XMLString;
    function Get_InvoiceDate: TCM_XMLString;
    function Get_InvoiceReference: ICMInvoiceReferenceList;
    function Get_BillToParty: ICMParty;
    function Get_SupplierParty: ICMParty;
    function Get_BuyerParty: ICMParty;
    function Get_RemitToParty: ICMPartyList;
    function Get_ShipToCharacteristics: ICMShipToCharacteristics;
    function Get_OtherParty: ICMPartyList;
    function Get_SenderParty: ICMParty;
    function Get_ReceiverParty: ICMPartyList;
    function Get_CountryOfOrigin: ICMCountryOfOrigin;
    function Get_CountryOfDestination: ICMCountryOfDestination;
//    function Get_AdditionalText: TStringList;
    procedure Set_InvoiceNumber(const pmcValue: TCM_XMLString);
    procedure Set_InvoiceDate(const pmcValue: TCM_XMLString);
  public
    property Invoicedate: TCMInvoiceDate read get_InvoiceDate;
  end;


{ TXMLCountryOfOrigin }

  TCMCountryOfOrigin = class(TInterfacedObject, ICMCountryOfOrigin)
  protected
    { IXMLCountryOfOrigin }
    function Get_Country: ICMCountry;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCountryOfDestination }

  TCMCountryOfDestination = class(TInterfacedObject, ICMCountryOfDestination)
  protected
    { IXMLCountryOfDestination }
    function Get_Country: ICMCountry;
  public
    procedure AfterConstruction; override;
  end;


implementation
uses
  system.SysUtils
;
{ TCMParty }

constructor TCMParty.create(const pmcName: string; const pmcAddress: ICMNameAddress);
begin
  inherited create;
  fName := pmcname;
  fAddress := pmcAddress;
end;


{ TCMInvoice }

constructor TCMInvoice.create;
begin
   inherited create;
   fInvoiceHeader := TCMInvoiceHeader.create;
end;

function TCMInvoice.getBillToParty: ICMParty;
begin

end;

function TCMInvoice.getBuyerParty: ICMParty;
begin

end;

function TCMInvoice.getInvoiceHeader: ICMInvoiceHeader;
begin

end;

function TCMInvoice.getShipToParty: ICMParty;
begin

end;

function TCMInvoice.getSupplierParty: ICMParty;
begin

end;

function TCMInvoice.Get_InvoiceContextType: UnicodeString;
begin

end;

function TCMInvoice.Get_InvoiceHeader: ICMInvoiceHeader;
begin
  if fInvoiceHeader = nil then
    fInvoiceHeader := TCMInvoiceHeader.Create;
  result := fInvoiceheader;
end;

function TCMInvoice.Get_InvoiceShipment: ICMInvoiceShipmentList;
begin

end;

function TCMInvoice.Get_InvoiceSummary: ICMInvoiceSummary;
begin

end;

function TCMInvoice.Get_InvoiceType: UnicodeString;
begin
  result := '';
end;


function TCMInvoice.Get_Language: UnicodeString;
begin

end;

function TCMInvoice.Get_MonetaryAdjustment: ICMMonetaryAdjustmentList;
begin

end;

function TCMInvoice.Get_Reissued: UnicodeString;
begin

end;

procedure TCMInvoice.Set_InvoiceContextType(const pmcValue: UnicodeString);
begin

end;

procedure TCMInvoice.Set_InvoiceType(const pmcValue: TCM_XMLString);
begin

end;

procedure TCMInvoice.Set_Language(const pmcValue: UnicodeString);
begin

end;

procedure TCMInvoice.Set_Reissued(const pmcValue: UnicodeString);
begin

end;

{ TCMAddressInfo }

function TCMAddressInfo.Get_Address1: TCMAddress;
begin

end;

function TCMAddressInfo.Get_Address2: TCMAddress;
begin

end;

function TCMAddressInfo.Get_Address3: TCMAddress;
begin

end;

function TCMAddressInfo.Get_City: TCMCity;
begin

end;

function TCMAddressInfo.Get_Country: TCMCountry;
begin

end;

function TCMAddressInfo.Get_County: TCMCounty;
begin

end;

function TCMAddressInfo.Get_Name1: TCMName;
begin

end;

function TCMAddressInfo.Get_PostalCode: TCMPostalCode;
begin

end;

function TCMAddressInfo.Get_StateOrProvince: TCMState;
begin

end;

procedure TCMAddressInfo.Set_Address1(const pmcValue: TCMAddress);
begin

end;

procedure TCMAddressInfo.Set_Address2(const pmcValue: TCMAddress);
begin

end;

procedure TCMAddressInfo.Set_Address3(const pmcValue: TCMAddress);
begin

end;

procedure TCMAddressInfo.Set_City(const pmcValue: TCMCity);
begin

end;

procedure TCMAddressInfo.Set_Country(const pmcValue: TCMCountry);
begin

end;

procedure TCMAddressInfo.Set_County(const pmcCounty: TCMCounty);
begin

end;

procedure TCMAddressInfo.Set_Name1(const pmcValue: TCMName);
begin

end;

procedure TCMAddressInfo.Set_PostalCode(const pmcValue: TCMPostalCode);
begin

end;

procedure TCMAddressInfo.Set_StateOrProvince(const pmcValue: TCMState);
begin

end;



{ TCMCountryOfOrigin }

procedure TCMCountryOfOrigin.AfterConstruction;
begin
  inherited;

end;

function TCMCountryOfOrigin.Get_Country: ICMCountry;
begin

end;

{ TCMCountryOfDestination }

procedure TCMCountryOfDestination.AfterConstruction;
begin
  inherited;

end;

function TCMCountryOfDestination.Get_Country: ICMCountry;
begin

end;



{ TCMInvoiceHeader }


function TCMInvoiceHeader.Get_BillToParty: ICMParty;
begin

end;

function TCMInvoiceHeader.Get_BuyerParty: ICMParty;
begin

end;

function TCMInvoiceHeader.Get_CarrierParty: ICMParty;
begin

end;

function TCMInvoiceHeader.Get_CountryOfConsumption: ICMCountryOfConsumption;
begin

end;

function TCMInvoiceHeader.Get_CountryOfDestination: ICMCountryOfDestination;
begin

end;

function TCMInvoiceHeader.Get_CountryOfOrigin: ICMCountryOfOrigin;
begin

end;

function TCMInvoiceHeader.Get_InvoiceDate: TCMInvoiceDate;
begin
  result := fInvoicedate;
end;

function TCMInvoiceHeader.Get_InvoiceNumber: TCM_XMLString;
begin

end;

function TCMInvoiceHeader.Get_InvoiceReference: ICMInvoiceReferenceList;
begin

end;

function TCMInvoiceHeader.Get_OtherParty: ICMPartyList;
begin

end;

function TCMInvoiceHeader.Get_ReceiverParty: ICMPartyList;
begin

end;

function TCMInvoiceHeader.Get_RemitToParty: ICMPartyList;
begin

end;

function TCMInvoiceHeader.Get_SenderParty: ICMParty;
begin

end;

function TCMInvoiceHeader.Get_ShipToCharacteristics: ICMShipToCharacteristics;
begin

end;

function TCMInvoiceHeader.Get_SupplierParty: ICMParty;
begin

end;

procedure TCMInvoiceHeader.Set_InvoiceDate(const pmcValue: TCM_XMLString);
begin
  fInvoicedate := pmcValue;
end;

procedure TCMInvoiceHeader.Set_InvoiceNumber(const pmcValue: TCM_XMLString);
begin
  fInvoiceNo := pmcValue;
end;

end.
