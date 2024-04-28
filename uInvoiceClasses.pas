unit uInvoiceClasses;

interface
uses
  InvoiceWoodV2R31
  , IInvoiceInterfaces
  , uInvoiceType
;
type
(*
TCMInvoiceHeader = class(TInterfacedObject, ICMInvoiceHeader)
  private
  public
end;
*)

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

    procedure Set_Name1(const pcmValue: TCMName);
    procedure Set_Address1(const pcmValue: TCMAddress);
    procedure Set_Address2(const pcmValue: TCMAddress);
    procedure Set_Address3(const pcmValue: TCMAddress);
    procedure Set_County(const pcmCounty: TCMCounty);
    procedure Set_City(const pcmValue: TCMCity);
    procedure Set_Country(const pcmValue: TCMCountry);
    procedure Set_StateOrProvince(const pcmValue: TCMState);
    procedure Set_PostalCode(const pcmValue: TCMPostalCode);
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
      fName1, fName2: string;
      fAddress: ICMNameAddress;
      fPostalCode: string;
      fCity: string;
      fCountry: string;
    protected
    public
      constructor create(const pmcName1, pmcName2, pmcAddress, pmcPostCode, pmcCity, pmcCountry: string);
      property Name1: string read fName1;
      property Name2: string read fName2;
      property Address: ICMNameAddress read fAddress;
      property PostCode: string read fPostalCode;
      property City: string read fCity;
      property Country: string read fCountry;
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
    function Get_InvoiceType: UnicodeString;
    function Get_InvoiceContextType: UnicodeString;
    function Get_Reissued: UnicodeString;
    function Get_Language: UnicodeString;
    function Get_InvoiceShipment: ICMInvoiceShipmentList;
    procedure Set_InvoiceType(const pcmValue: UnicodeString);
    procedure Set_InvoiceContextType(const pcmValue: UnicodeString);
    procedure Set_Reissued(const pcmValue: UnicodeString);
    procedure Set_Language(const pcmValue: UnicodeString);
    { Methods & Properties }
    property InvoiceType: UnicodeString read Get_InvoiceType write Set_InvoiceType;
    property InvoiceContextType: UnicodeString read Get_InvoiceContextType write Set_InvoiceContextType;
    property Reissued: UnicodeString read Get_Reissued write Set_Reissued;
    property Language: UnicodeString read Get_Language write Set_Language;
    property InvoiceHeader: ICMInvoiceHeader read Get_InvoiceHeader;
    property InvoiceShipment: ICMInvoiceShipmentList read Get_InvoiceShipment;
    property MonetaryAdjustment: ICMMonetaryAdjustmentList read Get_MonetaryAdjustment;
    property InvoiceSummary: ICMInvoiceSummary read Get_InvoiceSummary;
    function getInvoiceHeader: ICMInvoiceHeader;
    function getBillToParty: ICMParty;
    function getSupplierParty: ICMParty;
    function getBuyerParty: ICMParty;
    function getShipToParty: ICMParty;
end;

implementation

{ TCMParty }

constructor TCMParty.create(const pmcName1, pmcName2,
  pmcAddress, pmcPostCode, pmcCity, pmcCountry: string);
begin

end;


{ TCMInvoice }

constructor TCMInvoice.create;
begin

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

end;

function TCMInvoice.Get_InvoiceShipment: ICMInvoiceShipmentList;
begin

end;

function TCMInvoice.Get_InvoiceSummary: ICMInvoiceSummary;
begin

end;

function TCMInvoice.Get_InvoiceType: UnicodeString;
begin

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

procedure TCMInvoice.Set_InvoiceContextType(const pcmValue: UnicodeString);
begin

end;

procedure TCMInvoice.Set_InvoiceType(const pcmValue: UnicodeString);
begin

end;

procedure TCMInvoice.Set_Language(const pcmValue: UnicodeString);
begin

end;

procedure TCMInvoice.Set_Reissued(const pcmValue: UnicodeString);
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

procedure TCMAddressInfo.Set_Address1(const pcmValue: TCMAddress);
begin

end;

procedure TCMAddressInfo.Set_Address2(const pcmValue: TCMAddress);
begin

end;

procedure TCMAddressInfo.Set_Address3(const pcmValue: TCMAddress);
begin

end;

procedure TCMAddressInfo.Set_City(const pcmValue: TCMCity);
begin

end;

procedure TCMAddressInfo.Set_Country(const pcmValue: TCMCountry);
begin

end;

procedure TCMAddressInfo.Set_County(const pcmCounty: TCMCounty);
begin

end;

procedure TCMAddressInfo.Set_Name1(const pcmValue: TCMName);
begin

end;

procedure TCMAddressInfo.Set_PostalCode(const pcmValue: TCMPostalCode);
begin

end;

procedure TCMAddressInfo.Set_StateOrProvince(const pcmValue: TCMState);
begin

end;

end.
