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
TCMCountry = class;
TCMAddressInfo = class;
TCMParty = class;
//TCMDateBasis = class;
TCMCountryOfOrigin = class;
TCMShipToCharacteristics = class;
<<<<<<< HEAD
TCMBillToParty = class;
TCMTypedParty = class;
=======
>>>>>>> 8371b59a08ad358bd0ae54766786b6dbccdbf1fb

TCMAddressInfo = class(TInterfacedObject, ICMNameAddress)
  private
    fName1: TCMName;
    fPostalCode: TCM_XMLString;
    fAddress1: TCM_XMLString;
    fAddress2: TCM_XMLString;
    fAddress3: TCM_XMLString;
    fCounty: TCM_XMLString;
    fCity: TCM_XMLString;
    fStateOrProvince: TCM_XMLString;
    fCountry: TCM_XMLString;

    function Get_Name1: TCM_XMLString;
    function Get_Address1: TCM_XMLString;
    function Get_Address2: TCM_XMLString;
    function Get_Address3: TCM_XMLString;
    function Get_County: TCM_XMLString;
    function Get_City: TCM_XMLString;
    function Get_Country: TCM_XMLString;
    function Get_StateOrProvince: TCM_XMLString;
    function Get_PostalCode: TCM_XMLString;

    procedure Set_Name1(const pmcValue: TCM_XMLString);
    procedure Set_Address1(const pmcValue: TCM_XMLString);
    procedure Set_Address2(const pmcValue: TCM_XMLString);
    procedure Set_Address3(const pmcValue: TCM_XMLString);
    procedure Set_County(const pmcCounty: TCM_XMLString);
    procedure Set_City(const pmcValue: TCM_XMLString);
    procedure Set_Country(const pmcValue: TCM_XMLString);
    procedure Set_StateOrProvince(const pmcValue: TCM_XMLString);
    procedure Set_PostalCode(const pmcValue: TCM_XMLString);
  protected
  public
    property Name1: TCM_XMLString read Get_Name1 write Set_Name1;
    property Address1: TCM_XMLString read Get_Address1 write Set_Address1;
    property Address2: TCM_XMLString read Get_Address2 write Set_Address2;
    property Address3: TCM_XMLString read Get_Address3 write Set_Address3;
    property County: TCM_XMLString read Get_County write Set_County;
    property City: TCM_XMLString read Get_City write Set_City;
    property Country: TCM_XMLString read Get_Country write Set_Country;
    property StateOrProvince: TCM_XMLString read Get_StateOrProvince write Set_StateOrProvince;
    property PostalCode: TCM_XMLString read Get_PostalCode write Set_PostalCode;
end;

TCMParty = class(TInterfacedObject, ICMParty)
    private
      fName: string;
      fAddress: ICMNameAddress;
      fVATIdentificationNo: TCM_XMLString;
    protected
      function Get_Address: ICMNameAddress;
      procedure Set_Address(Value: ICMNameAddress);
      function Get_VATid: TCM_XMLString;
      procedure Set_VATid(Value: TCM_XMLString);
    public
      constructor create(const pmcName: string; const pmcAddress: ICMNameAddress);
      property Name: string read fName;
<<<<<<< HEAD
      property Address: ICMNameAddress read Get_Address write Set_Address;
      property VATid: TCM_XMLString read Get_VATId write SET_VATid;
  end;

TCMTypedParty = class(TCMParty, ICMTypedParty)
  private
    fPartyType: TCM_XMLString;
    function Get_PartyType: TCM_XMLString;
    procedure Set_PartyType(Value: TCM_XMLString);
  public
    { Methods & Properties }
    constructor create(const pmcName: string; const pmcAddress: ICMNameAddress; const pmcPartyType: TCM_XMLString);
    property PartyType: TCM_XMLString read Get_PartyType write Set_PartyType;
end;

TCMBillToParty = class(TCMTypedParty)
  public
    constructor create(const pmcName: string; const pmcAddress: ICMNameAddress);
=======
      property Address: ICMNameAddress read fAddress write fAddress;
  end;

TCMTypedParty = class(TCMParty)
  private
    fPartyType: TCM_XMLString;
    function Get_PartyType: TCM_XMLString;
  public
    { Methods & Properties }
    constructor create(const pmcName: string; const pmcAddress: ICMNameAddress; const pmcPartyType: TCM_XMLString);
    property PartyType: TCM_XMLString read Get_PartyType;
>>>>>>> 8371b59a08ad358bd0ae54766786b6dbccdbf1fb
end;

TCMInvoice = class(TInterfacedObject, ICMInvoice)
  private
    fInvoiceHeader: ICMInvoiceHeader;
    fInvoiceDetails: ICMInvoiceDetails;
    fLanguage: TCMLanguage;
    fShipToCharacteristics: ICMShipToCharacteristics;
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
<<<<<<< HEAD
    fLoadingOrderNo: TCM_XMLString;
    fContract: TCM_XMLString;
    fLoadNo: TCM_XMLString;
    fBillTo: ICMTypedParty;
    fSupplier: ICMTypedParty;
    fBuyer: ICMTypedParty;
    fShipTo: ICMTypedParty;
=======
    fBillTo: TCMParty;
    fSupplier: TCMParty;
    fBuyer: TCMParty;
    fShipTo: TCMParty;
>>>>>>> 8371b59a08ad358bd0ae54766786b6dbccdbf1fb
    fShipToCharacteristics: ICMShipToCharacteristics;
    FInvoiceReference: ICMInvoiceReferenceList;
    FRemitToParty: ICMPartyList;
    FOtherParty: ICMPartyList;
    FReceiverParty: ICMPartyList;
    FLocationParty: ICMPartyList;
    FAdditionalText: TStringList;
    fCustomerNo: TCM_XMLString;
    fVATNo: TCM_XMLString;
    function Get_CarrierParty: ICMTypedParty;
    function Get_CountryOfConsumption: ICMCountryOfConsumption;
  protected
    function Get_InvoiceNumber: TCM_XMLString;
    function Get_InvoiceDate: TCM_XMLString;
    function Get_InvoiceReference: ICMInvoiceReferenceList;
    function Get_BillToParty: ICMTypedParty;
    function Get_SupplierParty: ICMTypedParty;
    function Get_BuyerParty: ICMTypedParty;
    function Get_RemitToParty: ICMPartyList;
    function Get_ShipToCharacteristics: ICMShipToCharacteristics;
    function Get_OtherParty: ICMPartyList;
    function Get_SenderParty: ICMTypedParty;
    function Get_ReceiverParty: ICMPartyList;
    function Get_CountryOfOrigin: ICMCountryOfOrigin;
    function Get_CountryOfDestination: ICMCountryOfDestination;
    function Get_LoadingOrderNo: TCM_XMLString;
    function Get_Contract: TCM_XMLString;
    function Get_LoadNo: TCM_XMLString;
//    function Get_AdditionalText: TStringList;
    function Get_CustomerNo: TCM_XMLString;
    function Get_VATNo: TCM_XMLString;
    procedure Set_VATNo(Value: TCM_XMLString);
    procedure Set_CustomerNo(Value: TCM_XMLString);
    procedure Set_InvoiceNumber(const pmcValue: TCM_XMLString);
    procedure Set_InvoiceDate(const pmcValue: TCM_XMLString);
    procedure Set_LoadingOrderNo(Value: TCM_XMLString);
    procedure Set_Contract(Value: TCM_XMLString);
    procedure Set_LoadNo(Value: TCM_XMLString);
    procedure Set_BillToParty(Value: ICMTypedParty);
  public
    constructor create;
    property Invoicedate: TCMInvoiceDate read get_InvoiceDate;
<<<<<<< HEAD
    property LoadingOrderNo: TCM_XMLString read fLoadingOrderNo write fLoadingOrderNo;
    property Contract: TCM_XMLString read Get_Contract write Set_Contract;
    property LoadNo: TCM_XMLString read Get_LoadNo write Set_LoadNo;
    property ShipToCharacteristics: ICMShipToCharacteristics read fShipToCharacteristics;
    property BillToParty: ICMTypedParty read Get_BillToParty write Set_BillToParty;
    property CustomerNo: TCM_XMLString read Get_CustomerNo write Set_CustomerNo;
    property VATNo: TCM_XMLString read Get_VATNo write Set_VATNo;
=======
    property ShipToCharacteristics: ICMShipToCharacteristics read fShipToCharacteristics;
>>>>>>> 8371b59a08ad358bd0ae54766786b6dbccdbf1fb
//    property
  end;

{ TCMCountry }
  TCMCountry = class(TInterfacedObject, ICMCountry)
  private
    fCountryCode: TCM_XMLString;
    fCountryCodeAlpha3: TCM_XMLString;
    fCountryCodeNumeric: TCM_XMLString;
  protected
    function Get_ISOCountryCode: TCM_XMLString;
    function Get_ISOCountryCodeAlpha3: TCM_XMLString;
    function Get_ISOCountryCodeNumeric: TCM_XMLString;
    procedure Set_ISOCountryCode(Value: TCM_XMLString);
    procedure Set_ISOCountryCodeAlpha3(Value: TCM_XMLString);
    procedure Set_ISOCountryCodeNumeric(Value: TCM_XMLString);
  public
    property ISOCountryCode: TCM_XMLString read Get_ISOCountryCode write Set_ISOCountryCode;
    property ISOCountryCodeAlpha3: TCM_XMLString read Get_ISOCountryCodeAlpha3 write Set_ISOCountryCodeAlpha3;
    property ISOCountryCodeNumeric: TCM_XMLString read Get_ISOCountryCodeNumeric write Set_ISOCountryCodeNumeric;
  end;

{ TXMLCountryOfOrigin }

  TCMCountryOfOrigin = class(TCMCountry)
  end;

{ TXMLCountryOfDestination }

  TCMCountryOfDestination = class(TCMCountry)
  end;

{TCMShipToCharacteristics}
  TCMShipToCharacteristics = class(TInterfacedObject, ICMShipToCharacteristics)
  private
    fShipToParty: ICMTypedParty;
    fTermsOfDelivery: ICMTermsOfDelivery;
    function Get_ShipToParty: ICMTypedParty;
//    function Get_SupplyPoint: ICMSupplyPointList;
//    function Get_LocationCode: ICMLocationCode;
    function Get_TermsOfDelivery: ICMTermsOfDelivery;
    procedure Set_TermsOfDelivery(Value: ICMTermsOfDelivery);
//    function Get_DeliveryRouteCode: ICMDeliveryRouteCode;
  public
    constructor create;
    { Methods & Properties }
    property ShipToParty: ICMTypedParty read Get_ShipToParty;
//    property SupplyPoint: ICMSupplyPointList read Get_SupplyPoint;
//    property LocationCode: ICMLocationCode read Get_LocationCode;
    property TermsOfDelivery: ICMTermsOfDelivery read Get_TermsOfDelivery write fTermsOfDelivery;
//    property DeliveryRouteCode: ICMDeliveryRouteCode read Get_DeliveryRouteCode;
  end;

  TCMTermsOfDelivery = class(TInterfacedObject, ICMTermsOfDelivery)
    private
      fAdditionalText: TCM_XMLString;
      function Get_AdditionalText: TCM_XMLString;
      function Get_ShipmentMethodOfPayment: ICMShipmentMethodOfPayment;
      procedure Set_AdditionalText(Value: TCM_XMLString);
    public
      property ShipmentMethodOfPayment: ICMShipmentMethodOfPayment read Get_ShipmentMethodOfPayment;
      property AdditionalText: TCM_XMLString read Get_AdditionalText write Set_AdditionalText;
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


function TCMParty.Get_Address: ICMNameAddress;
begin
  result := fAddress;
end;

function TCMParty.Get_VATid: TCM_XMLString;
begin
  result := fVATIdentificationNo;
end;

procedure TCMParty.Set_Address(Value: ICMNameAddress);
begin
  fAddress := Value;
end;

procedure TCMParty.Set_VATid(Value: TCM_XMLString);
begin
  fVATIdentificationNo := Value;
end;

{ TCMInvoice }

constructor TCMInvoice.create;
begin
  inherited create;
  fInvoiceHeader := TCMInvoiceHeader.create;
//  fBillTo := TCMBi.
end;


function TCMInvoice.Get_InvoiceContextType: TCM_XMLString;
begin

end;

function TCMInvoice.Get_InvoiceHeader: ICMInvoiceHeader;
begin
  result := fInvoiceheader;
end;

function TCMInvoice.Get_InvoiceShipment: ICMInvoiceShipmentList;
begin

end;

function TCMInvoice.Get_InvoiceSummary: ICMInvoiceSummary;
begin

end;

function TCMInvoice.Get_InvoiceType: TCM_XMLString;
begin
  result := 'Invoice';
end;


function TCMInvoice.Get_Language: TCM_XMLString;
begin
  result := 'Swedish';
end;

function TCMInvoice.Get_MonetaryAdjustment: ICMMonetaryAdjustmentList;
begin

end;

function TCMInvoice.Get_Reissued: TCM_XMLString;
begin

end;

procedure TCMInvoice.Set_InvoiceContextType(const pmcValue: TCM_XMLString);
begin

end;

procedure TCMInvoice.Set_InvoiceType(const pmcValue: TCM_XMLString);
begin

end;

procedure TCMInvoice.Set_Language(const pmcValue: TCM_XMLString);
begin

end;

procedure TCMInvoice.Set_Reissued(const pmcValue: TCM_XMLString);
begin

end;

{ TCMAddressInfo }

function TCMAddressInfo.Get_Address1: TCM_XMLString;
begin
  result := fAddress1;
end;

function TCMAddressInfo.Get_Address2: TCM_XMLString;
begin
  result := fAddress2;
end;

function TCMAddressInfo.Get_Address3: TCM_XMLString;
begin
  result := fAddress3;
end;

function TCMAddressInfo.Get_City: TCM_XMLString;
begin
  result := fCity;
end;

function TCMAddressInfo.Get_Country: TCM_XMLString;
begin
  result := fCountry;
end;

function TCMAddressInfo.Get_County: TCM_XMLString;
begin
  result := fCounty;
end;

function TCMAddressInfo.Get_Name1: TCM_XMLString;
begin
  result := fName1
end;

function TCMAddressInfo.Get_PostalCode: TCM_XMLString;
begin
  result := fPostalCode
end;

function TCMAddressInfo.Get_StateOrProvince: TCM_XMLString;
begin
  result := fStateOrProvince;
end;

procedure TCMAddressInfo.Set_Address1(const pmcValue: TCM_XMLString);
begin
  fAddress1 := pmcValue;
end;

procedure TCMAddressInfo.Set_Address2(const pmcValue: TCM_XMLString);
begin
  fAddress2 := pmcValue;
end;

procedure TCMAddressInfo.Set_Address3(const pmcValue: TCM_XMLString);
begin
  fAddress3 := pmcValue;
end;

procedure TCMAddressInfo.Set_City(const pmcValue: TCM_XMLString);
begin
  fCity := pmcValue;
end;

procedure TCMAddressInfo.Set_Country(const pmcValue: TCM_XMLString);
begin
  fCountry := pmcValue;
end;

procedure TCMAddressInfo.Set_County(const pmcCounty: TCM_XMLString);
begin
  fCounty := pmcCounty;
end;

procedure TCMAddressInfo.Set_Name1(const pmcValue: TCM_XMLString);
begin
  fName1 := pmcValue;
end;

procedure TCMAddressInfo.Set_PostalCode(const pmcValue: TCM_XMLString);
begin
  fPostalCode := pmcValue;
end;

procedure TCMAddressInfo.Set_StateOrProvince(const pmcValue: TCM_XMLString);
begin
  fStateOrProvince := pmcValue;
end;


{ TCMInvoiceHeader }


constructor TCMInvoiceHeader.create;
begin
  inherited create;
  fShipToCharacteristics := TCMShipToCharacteristics.Create;
end;

<<<<<<< HEAD
function TCMInvoiceHeader.Get_BillToParty: ICMTypedParty;
begin
  result := fBillTo;
end;

function TCMInvoiceHeader.Get_BuyerParty: ICMTypedParty;
=======
function TCMInvoiceHeader.Get_BillToParty: ICMParty;
>>>>>>> 8371b59a08ad358bd0ae54766786b6dbccdbf1fb
begin

end;

function TCMInvoiceHeader.Get_CarrierParty: ICMTypedParty;
begin

end;

function TCMInvoiceHeader.Get_Contract: TCM_XMLString;
begin
  result := fContract;
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

function TCMInvoiceHeader.Get_CustomerNo: TCM_XMLString;
begin
  result := fCustomerNo;
end;

function TCMInvoiceHeader.Get_InvoiceDate: TCMInvoiceDate;
begin
  result := fInvoicedate;
end;

function TCMInvoiceHeader.Get_InvoiceNumber: TCM_XMLString;
begin
  result := fInvoiceNo;
end;

function TCMInvoiceHeader.Get_InvoiceReference: ICMInvoiceReferenceList;
begin

end;

function TCMInvoiceHeader.Get_LoadingOrderNo: TCM_XMLString;
begin
  result := fLoadingOrderNo;
end;

function TCMInvoiceHeader.Get_LoadNo: TCM_XMLString;
begin
  result := fLoadNo
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

function TCMInvoiceHeader.Get_SenderParty: ICMTypedParty;
begin

end;

function TCMInvoiceHeader.Get_ShipToCharacteristics: ICMShipToCharacteristics;
begin
  result := fShipToCharacteristics;
<<<<<<< HEAD
end;

function TCMInvoiceHeader.Get_SupplierParty: ICMTypedParty;
begin

=======
>>>>>>> 8371b59a08ad358bd0ae54766786b6dbccdbf1fb
end;

function TCMInvoiceHeader.Get_VATNo: TCM_XMLString;
begin
  result := fVATNo;
end;

procedure TCMInvoiceHeader.Set_BillToParty(Value: ICMTypedParty);
begin
  fBillTo := Value;
end;

procedure TCMInvoiceHeader.Set_Contract(Value: TCM_XMLString);
begin
  fContract := Value;
end;

procedure TCMInvoiceHeader.Set_CustomerNo(Value: TCM_XMLString);
begin
  fCustomerNo := Value;
end;

procedure TCMInvoiceHeader.Set_InvoiceDate(const pmcValue: TCM_XMLString);
begin
  fInvoicedate := pmcValue;
end;

procedure TCMInvoiceHeader.Set_InvoiceNumber(const pmcValue: TCM_XMLString);
begin
  fInvoiceNo := pmcValue;
end;

<<<<<<< HEAD
procedure TCMInvoiceHeader.Set_LoadingOrderNo(Value: TCM_XMLString);
begin
  fLoadingOrderNo := Value;
end;

procedure TCMInvoiceHeader.Set_LoadNo(Value: TCM_XMLString);
begin
  fLoadNo := Value;
end;

procedure TCMInvoiceHeader.Set_VATNo(Value: TCM_XMLString);
begin
  fVATNo := Value;
end;

=======
>>>>>>> 8371b59a08ad358bd0ae54766786b6dbccdbf1fb
{ TCMCountry }

function TCMCountry.Get_ISOCountryCode: TCM_XMLString;
begin
  result := fCountryCode;
end;

function TCMCountry.Get_ISOCountryCodeAlpha3: TCM_XMLString;
begin
  result := fCountryCode;
end;

function TCMCountry.Get_ISOCountryCodeNumeric: TCM_XMLString;
begin
  result := fCountryCode;
end;

procedure TCMCountry.Set_ISOCountryCode(Value: TCM_XMLString);
begin
  fCountryCode := Value;
end;

procedure TCMCountry.Set_ISOCountryCodeAlpha3(Value: TCM_XMLString);
begin
  fCountryCodeAlpha3 := Value;
end;

procedure TCMCountry.Set_ISOCountryCodeNumeric(Value: TCM_XMLString);
begin
  fCountryCodeNumeric := Value;
end;

{ TCMTypedParty }

constructor TCMTypedParty.create(const pmcName: string; const pmcAddress: ICMNameAddress; const pmcPartyType: TCM_XMLString);
begin
  inherited create(pmcName, pmcAddress);
<<<<<<< HEAD
  fPartyType := pmcPartyType;
=======
>>>>>>> 8371b59a08ad358bd0ae54766786b6dbccdbf1fb
end;

function TCMTypedParty.Get_PartyType: TCM_XMLString;
begin
  result := fPartyType;
end;


<<<<<<< HEAD
procedure TCMTypedParty.Set_PartyType(Value: TCM_XMLString);
begin
  fPartyType := Value;
end;

=======
>>>>>>> 8371b59a08ad358bd0ae54766786b6dbccdbf1fb
{ TCMShipToCharacteristics }

constructor TCMShipToCharacteristics.create;
begin
  fTermsOfDelivery := TCMTermsOfDelivery.Create;
end;

function TCMShipToCharacteristics.Get_ShipToParty: ICMTypedParty;
begin
  result := fShipToParty;
end;

function TCMShipToCharacteristics.Get_TermsOfDelivery: ICMTermsOfDelivery;
begin
  result := fTermsOfDelivery;
end;

procedure TCMShipToCharacteristics.Set_TermsOfDelivery(
  Value: ICMTermsOfDelivery);
begin
  fTermsOfDelivery := value;
end;

{ TCMTermsOfDelivery }

function TCMTermsOfDelivery.Get_AdditionalText: TCM_XMLString;
begin
  result := fAdditionaltext;
end;

function TCMTermsOfDelivery.Get_ShipmentMethodOfPayment: ICMShipmentMethodOfPayment;
begin

end;

procedure TCMTermsOfDelivery.Set_AdditionalText(Value: TCM_XMLString);
begin
  fAdditionalText := Value;
end;

<<<<<<< HEAD
{ TCMBillTo }

constructor TCMBillToParty.create(const pmcName: string;
  const pmcAddress: ICMNameAddress);
begin
  inherited create(pmcName, pmcAddress, 'BillToType');
end;


=======
>>>>>>> 8371b59a08ad358bd0ae54766786b6dbccdbf1fb
end.
