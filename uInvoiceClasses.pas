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
TCMBillToParty = class;
TCMSupplierParty = class;
TCMBuyerParty = class;
TCMShipToParty = class;
TCMTypedParty = class;

TCMInvoiceDetail = class(TInterfacedObject, ICMInvoiceDetail)
  private
    fProdGroup: TCM_XMLString;
    flineNo: TCM_XMLString;
    fPurchaseOrderNo: TCM_XMLString;
    fProductNo: TCM_XMLString;
    fProductDescr: TCM_XMLString;
    fQuantityType: TCM_XMLString;
    fQUOM: double;
    fUOM: TCM_XMLString;
    fCurrencyType: TCM_XMLString;
    fCurrencyValue: double;
    fPrice: double;
    fTaxType: TCM_XMLString;
    fTaxPercent: double;
    fTaxValue: double;
    fLineValue: double;
    fTaxLocation: TCM_XMLString;


    function Get_ProdGroup: TCM_XMLString;
    function Get_lineNo: TCM_XMLString;
    function Get_PurchaseOrderNo: TCM_XMLString;
    function Get_ProductNo: TCM_XMLString;
    function Get_ProductDescr: TCM_XMLString;
    function Get_QuantityType: TCM_XMLString;
    function Get_QUOM: double;
    function Get_UOM: TCM_XMLString;
    function Get_CurrencyType: TCM_XMLString;
    function Get_CurrencyValue: double;
    function Get_Price: double;
    function Get_TaxType: TCM_XMLString;
    function Get_TaxPercent: double;
    function Get_TaxValue: double;
    function Get_LineValue: double;
    function Get_TaxLocation: TCM_XMLString;

    procedure Set_ProdGroup(Value: TCM_XMLString);
    procedure Set_lineNo(Value: TCM_XMLString);
    procedure Set_PurchaseOrderNo(Value: TCM_XMLString);
    procedure Set_ProductNo(Value: TCM_XMLString);
    procedure Set_ProductDescr(Value: TCM_XMLString);
    procedure Set_QuantityType(Value: TCM_XMLString);
    procedure Set_QUOM(Value: double);
    procedure Set_UOM(Value: TCM_XMLString);
    procedure Set_CurrencyType(Value: TCM_XMLString);
    procedure Set_CurrencyValue(Value: double);
    procedure Set_Price(Value: double);
    procedure Set_TaxType(Value: TCM_XMLString);
    procedure Set_TaxPercent(Value: double);
    procedure Set_TaxValue(Value: double);
    procedure Set_LineValue(Value: double);
    procedure Set_TaxLocation(Value: TCM_XMLString);
  public
    property prodGroup: TCM_XMLString read Get_ProdGroup write Set_ProdGroup;
    property lineNo: TCM_XMLString read Get_LineNo write Set_lineNo;
    property PurchaseOrderNo: TCM_XMLString read Get_PurchaseOrderNo write Set_PurchaseOrderNo;
    property ProductNo: TCM_XMLString read Get_ProductNo write Set_ProductNo;
    property ProductDescr: TCM_XMLString read Get_ProductDescr write Set_ProductDescr;
    property QuantityType: TCM_XMLString read Get_QuantityType write Set_QuantityType;
    property QUOM: double read Get_QUOM write Set_QUOM;
    property UOM: TCM_XMLString read Get_UOM write Set_UOM;
    property CurrencyType: TCM_XMLString read Get_CurrencyType write Set_CurrencyType;
    property CurrencyValue: double read Get_CurrencyValue write Set_CurrencyValue;
    property Price: double read Get_Price write Set_Price;           // Currencyvalue/QUOM
    property TaxType: TCM_XMLString read Get_TaxType write Set_TaxType;
    property TaxPercent: double read Get_TaxPercent write Set_TaxPercent;
    property TaxValue: double read Get_TaxValue write Set_TaxValue;
    property LineValue: double read Get_LineValue write Set_LineValue;
    property TaxLocation: TCM_XMLString read Get_TaxLocation write Set_TaxLocation;
end;



{ TCMInvoiceDetails }
{ To contain all invoice detail lines for an Invoice.}

{ Array indexes:
   - rix: Read index
   - wix Write index
}

TInvoiceDetailArray = array of ICMInvoiceDetail;

TCMInvoiceDetails = class(TInterfacedObject, ICMInvoiceDetails)
private
  fList: TInvoiceDetailArray;
  rix: integer;  // Read index
  wix: integer;
    function getInvoiceDetail(index: integer): ICMInvoiceDetail;  // write index
public
  function Length: integer;
  function getNext: ICMInvoiceDetail ;
  procedure add(const pmcInvDet: ICMInvoiceDetail);
  procedure rewind;
  property idtarr[index: integer]: ICMInvoiceDetail read getInvoiceDetail ;
end;

TCMInvoiceSummary = class(TInterfacedObject, ICMInvoiceSummary)
  private
    fTotalQty: double;
    fTotWeight: double;
    fLineSubTotal: double;
    fTotalAdjustments: double;
    fTotalTaxAmt: double;
    fTotalFASAmt: double;
    fTotalAmt: double;

    function Get_TotalQty: double;
    function Get_TotWeight: double;
    function Get_LineSubTotal: double;
    function Get_TotalAdjustments: double;
    function Get_TotalTaxAmt: double;
    function Get_TotalFASAmt: double;
    function Get_TotalAmt: double;

    procedure Set_TotalQty(Value: double);
    procedure Set_TotWeight(Value: double);
    procedure Set_LineSubTotal(Value: double);
    procedure Set_TotalAdjustments(Value: double);
    procedure Set_TotalTaxAmt(Value: double);
    procedure Set_TotalFASAmt(Value: double);
    procedure Set_TotalAmt(Value: double);
    function getQty_AsString: string;

  public
    constructor create(const pmcInvoice: ICMInvoice);
    property TotalQty: double Read Get_TotalQty write Set_TotalQty ;
    property TotWeight: double Read Get_TotWeight write Set_TotWeight ;
    property LineSubTotal: double Read Get_LineSubTotal write Set_LineSubTotal ;
    property TotalAdjustments: double Read Get_TotalAdjustments write Set_TotalAdjustments ;
    property TotalTaxAmt: double Read Get_TotalTaxAmt write Set_TotalTaxAmt ;
    property TotalFASAmt: double Read Get_TotalFASAmt write Set_TotalFASAmt ;
    property TotalAmt: double Read Get_TotalAmt write Set_TotalAmt ;
    property strQty: string read getQty_AsString;
end;

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
end;

TCMSupplierParty = class(TCMTypedParty)
  public
    constructor create(const pmcName: string; const pmcAddress: ICMNameAddress);
end;

TCMBuyerParty = class(TCMTypedParty)
  public
    constructor create(const pmcName: string; const pmcAddress: ICMNameAddress);
end;

TCMShipToParty = class(TCMTypedParty)
  public
    constructor create(const pmcName: string; const pmcAddress: ICMNameAddress);
end;

TCMInvoice = class(TInterfacedObject, ICMInvoice)
  private
    fInvoiceHeader: ICMInvoiceHeader;
    fInvoiceDetails: ICMInvoiceDetails;
    fInvoiceSummary: ICMInvoiceSummary;
    fLanguage: TCMLanguage;
    fLineTotal: TCM_XMLString;
    fCurrencyType: TCM_XMLString;
    fTermsOfPayment: TCM_XMLString;
    fInvoiceDate: TCM_XMLString;
    fInvoiceDuedate: TCM_XMLString;
    fPaymentDescription: TCM_XMLString;
    fDeliveryTerms: TCM_XMLString;


    function Get_InvoiceHeader: ICMInvoiceHeader;
    function Get_MonetaryAdjustment: ICMMonetaryAdjustmentList;
    function Get_InvoiceSummary: ICMInvoiceSummary;
    function Get_InvoiceDetails: ICMInvoiceDetails;
    function Get_InvoiceType: TCM_XMLString;
    function Get_InvoiceContextType: TCM_XMLString;
    function Get_Reissued: TCM_XMLString;
    function Get_Language: TCM_XMLString;
    function Get_LineTotal: TCM_XMLString;
    function Get_CurrencyType: TCM_XMLString;
    function Get_InvoiceDate: TCM_XMLString;
    function Get_TermsOfPayment: TCM_XMLString;
    function Get_DeliveryTerms: TCM_XMLString;
    function Get_InvoiceDuedate: TCM_XMLString;
    function Get_PaymentDesciption: TCM_XMLString;

    procedure Set_InvoiceSummary(const pmcInvSum : ICMInvoiceSummary);
    procedure Set_InvoiceType(const pmcValue: TCM_XMLString);
    procedure Set_InvoiceContextType(const pmcValue: TCM_XMLString);
    procedure Set_Reissued(const pmcValue: TCM_XMLString);
    procedure Set_Language(const pmcValue: TCM_XMLString);
    procedure Set_LineTotal(Value: TCM_XMLString);
    procedure Set_CurrencyType(Value: TCM_XMLString);
    procedure Set_InvoiceDate(const Value: TCM_XMLString);
    procedure Set_TermsOfpayment(const Value: TCM_XMLString);
    procedure Set_DeliveryTerms(const Value: TCM_XMLString);
    procedure Set_InvoiceDueDate(const Value: TCM_XMLString);
    procedure Set_PaymentDescription(const Value: TCM_XMLString);
  protected
  public
    constructor create;
    { Methods & Properties }
    property InvoiceType: TCM_XMLString read Get_InvoiceType write Set_InvoiceType;
    property InvoiceContextType: TCM_XMLString read Get_InvoiceContextType write Set_InvoiceContextType;
    property Reissued: TCM_XMLString read Get_Reissued write Set_Reissued;
    property Language: TCM_XMLString read Get_Language write Set_Language;
    property InvoiceHeader: ICMInvoiceHeader read Get_InvoiceHeader;
    property InvoiceDetails: ICMInvoiceDetails read Get_InvoiceDetails;
    property MonetaryAdjustment: ICMMonetaryAdjustmentList read Get_MonetaryAdjustment;
    property InvoiceSummary: ICMInvoiceSummary read Get_InvoiceSummary write Set_InvoiceSummary;
    property LineTotal: TCM_XMLString read Get_LineTotal write Set_LineTotal;
    property CurrencyType: TCM_XMLString read Get_CurrencyType write Set_CurrencyType;
    property TermsOfPayment: TCM_XMLString read Get_TermsOfPayment write Set_TermsOfpayment;
    property InvoiceDate: TCM_XMLString read Get_InvoiceDate write Set_InvoiceDate;
    property InvoiceDuedate: TCM_XMLString read Get_InvoiceDuedate write Set_InvoiceDueDate;
    property PaymentDescription: TCM_XMLString read Get_PaymentDesciption write Set_PaymentDescription;
    property DeliveryTerms: TCM_XMLString read Get_DeliveryTerms write Set_DeliveryTerms;

end;

{ TXMLInvoiceWoodHeader }

  TCMInvoiceHeader = class(TInterfacedObject, ICMInvoiceHeader)
  private
    fInvoicedate: TCM_XMLString;
    fInvoiceNo: TCM_XMLString;
    fLoadingOrderNo: TCM_XMLString;
    fContract: TCM_XMLString;
    fLoadNo: TCM_XMLString;
    fBillTo: ICMTypedParty;
    fSupplier: ICMTypedParty;
    fBuyer: ICMTypedParty;
    fShipTo: ICMTypedParty;
    fShipToCharacteristics: ICMShipToCharacteristics;
    FInvoiceReference: ICMInvoiceReferenceList;
    FRemitToParty: ICMPartyList;
    FOtherParty: ICMPartyList;
    FReceiverParty: ICMPartyList;
    FLocationParty: ICMPartyList;
    FAdditionalText: TStringList;
    fCustomerNo: TCM_XMLString;
    fVATNo: TCM_XMLString;
  protected
    function Get_CarrierParty: ICMTypedParty;
    function Get_CountryOfConsumption: ICMCountryOfConsumption;
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
    procedure Set_SupplierParty(Value: ICMTypedParty);
    procedure Set_BuyerParty(Value: ICMTypedParty);
    procedure Set_ShipToCharacterisics(Value: ICMShipToCharacteristics);
  public
    constructor create;
    property Invoicedate: TCMInvoiceDate read get_InvoiceDate;
    property LoadingOrderNo: TCM_XMLString read fLoadingOrderNo write fLoadingOrderNo;
    property Contract: TCM_XMLString read Get_Contract write Set_Contract;
    property LoadNo: TCM_XMLString read Get_LoadNo write Set_LoadNo;
    property ShipToCharacteristics: ICMShipToCharacteristics read Get_ShipToCharacteristics write Set_ShipToCharacterisics;
    property BillToParty: ICMTypedParty read Get_BillToParty write Set_BillToParty;
    property SupplierParty: ICMTypedParty read Get_SupplierParty write Set_SupplierParty;
    property BuyerParty: ICMTypedParty read Get_BuyerParty write Set_BuyerParty;
    property CustomerNo: TCM_XMLString read Get_CustomerNo write Set_CustomerNo;
    property VATNo: TCM_XMLString read Get_VATNo write Set_VATNo;
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
    constructor create(const pmcName: string; const pmcAddress: ICMNameAddress);
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
  fInvoiceDetails := TCMInvoiceDetails.Create;
end;


function TCMInvoice.Get_CurrencyType: TCM_XMLString;
begin
  result := fCurrencyType;
end;

function TCMInvoice.Get_DeliveryTerms: TCM_XMLString;
begin
  result := fDeliveryTerms
end;

function TCMInvoice.Get_InvoiceContextType: TCM_XMLString;
begin

end;

function TCMInvoice.Get_InvoiceDate: TCM_XMLString;
begin
  result := fInvoiceDate;
end;

function TCMInvoice.Get_InvoiceDetails: ICMInvoiceDetails;
begin
  if fInvoiceDetails = nil then
    fInvoiceDetails := TCMInvoiceDetails.Create;
  result := fInvoiceDetails;
end;

function TCMInvoice.Get_InvoiceDuedate: TCM_XMLString;
begin
  result := fInvoiceDueDate;
end;

function TCMInvoice.Get_InvoiceHeader: ICMInvoiceHeader;
begin
  result := fInvoiceheader;
end;


function TCMInvoice.Get_InvoiceSummary: ICMInvoiceSummary;
begin
  result := fInvoiceSummary;
end;

function TCMInvoice.Get_InvoiceType: TCM_XMLString;
begin
  result := 'Invoice';
end;


function TCMInvoice.Get_Language: TCM_XMLString;
begin
  result := 'Swedish';
end;

function TCMInvoice.Get_LineTotal: TCM_XMLString;
begin
  result := fLineTotal;
end;

function TCMInvoice.Get_MonetaryAdjustment: ICMMonetaryAdjustmentList;
begin

end;

function TCMInvoice.Get_PaymentDesciption: TCM_XMLString;
begin
  result := fPaymentDescription;
end;

function TCMInvoice.Get_Reissued: TCM_XMLString;
begin

end;

function TCMInvoice.Get_TermsOfPayment: TCM_XMLString;
begin
  result := fTermsOfPayment;
end;

procedure TCMInvoice.Set_CurrencyType(Value: TCM_XMLString);
begin
  fCurrencyType := Value;
end;

procedure TCMInvoice.Set_DeliveryTerms(const Value: TCM_XMLString);
begin
  fDeliveryTerms := Value;
end;

procedure TCMInvoice.Set_InvoiceContextType(const pmcValue: TCM_XMLString);
begin

end;

procedure TCMInvoice.Set_InvoiceDate(const Value: TCM_XMLString);
begin
  fInvoiceDate := Value;
end;

procedure TCMInvoice.Set_InvoiceDueDate(const Value: TCM_XMLString);
begin
  fInvoiceDueDate := Value;
end;

procedure TCMInvoice.Set_InvoiceSummary(const pmcInvSum: ICMInvoiceSummary);
begin
  fInvoiceSummary := pmcInvSum;
end;

procedure TCMInvoice.Set_InvoiceType(const pmcValue: TCM_XMLString);
begin

end;

procedure TCMInvoice.Set_Language(const pmcValue: TCM_XMLString);
begin

end;

procedure TCMInvoice.Set_LineTotal(Value: TCM_XMLString);
begin
  fLineTotal := Value;
end;

procedure TCMInvoice.Set_PaymentDescription(const Value: TCM_XMLString);
begin
  fPaymentDescription := Value;
end;

procedure TCMInvoice.Set_Reissued(const pmcValue: TCM_XMLString);
begin

end;

procedure TCMInvoice.Set_TermsOfpayment(const Value: TCM_XMLString);
begin
  fTermsOfPayment := Value;
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
end;

function TCMInvoiceHeader.Get_BillToParty: ICMTypedParty;
begin
  result := fBillTo;
end;

function TCMInvoiceHeader.Get_BuyerParty: ICMTypedParty;
begin
  result := fBuyer;
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
end;

function TCMInvoiceHeader.Get_SupplierParty: ICMTypedParty;
begin
  result := fSupplier;
end;

function TCMInvoiceHeader.Get_VATNo: TCM_XMLString;
begin
  result := fVATNo;
end;

procedure TCMInvoiceHeader.Set_BillToParty(Value: ICMTypedParty);
begin
  fBillTo := Value;
end;

procedure TCMInvoiceHeader.Set_BuyerParty(Value: ICMTypedParty);
begin
  fBuyer := Value;
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

procedure TCMInvoiceHeader.Set_LoadingOrderNo(Value: TCM_XMLString);
begin
  fLoadingOrderNo := Value;
end;

procedure TCMInvoiceHeader.Set_LoadNo(Value: TCM_XMLString);
begin
  fLoadNo := Value;
end;

procedure TCMInvoiceHeader.Set_ShipToCharacterisics(Value: ICMShipToCharacteristics);
begin
  fShipToCharacteristics := Value;
end;

procedure TCMInvoiceHeader.Set_SupplierParty(Value: ICMTypedParty);
begin
  fSupplier := Value;
end;

procedure TCMInvoiceHeader.Set_VATNo(Value: TCM_XMLString);
begin
  fVATNo := Value;
end;


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
  fPartyType := pmcPartyType;
end;

function TCMTypedParty.Get_PartyType: TCM_XMLString;
begin
  result := fPartyType;
end;


procedure TCMTypedParty.Set_PartyType(Value: TCM_XMLString);
begin
  fPartyType := Value;
end;

{ TCMShipToCharacteristics }

constructor TCMShipToCharacteristics.create(const pmcName: string; const pmcAddress: ICMNameAddress);
begin
  fTermsOfDelivery := TCMTermsOfDelivery.Create;
  fShipToParty := TCMShipToParty.create(pmcName, pmcAddress);
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

{ TCMBillTo }

constructor TCMBillToParty.create(const pmcName: string;
  const pmcAddress: ICMNameAddress);
begin
  inherited create(pmcName, pmcAddress, 'BillToType');
end;


{ TCMSupplierParty }

constructor TCMSupplierParty.create(const pmcName: string;
  const pmcAddress: ICMNameAddress);
begin
  inherited create(pmcName, pmcAddress, 'SupplierType');
end;

{ TCMBuyerParty }

constructor TCMBuyerParty.create(const pmcName: string;
  const pmcAddress: ICMNameAddress);
begin
  inherited create(pmcName, pmcAddress, 'BuyerType');
end;

{ TCMShipToParty }

constructor TCMShipToParty.create(const pmcName: string;
  const pmcAddress: ICMNameAddress);
begin
  inherited create(pmcName, pmcAddress, 'ShipToType');
end;


{ TCMInvoiceSummary }

constructor TCMInvoiceSummary.create(const pmcInvoice: ICMInvoice);
var
  i: integer;
begin
  fTotalQty := 0.0;
  for i := 1 to pmcInvoice.InvoiceDetails.Length do
    fTotalQty := fTotalQty + pmcInvoice.InvoiceDetails.getInvoiceDetail(i-1).QUOM;
//    fTotWeight := fTotWeight + pmcIdtls.getInvoiceDetail(i).
//    fTotalAdjustments := fTotalAdjustments + pmcIdtls.getInvoiceDetail(i).
//  fTotalTaxAmt := ;
//    fTotalFASAmt := fTotalFASAmt + pmcIdtls.getInvoiceDetail(i).
//  fLineSubTotal := ;
//  fTotalAmt := ;
end;

function TCMInvoiceSummary.getQty_AsString: string;
begin
  result := floatToStr(fTotalQty);
end;

function TCMInvoiceSummary.Get_LineSubTotal: double;
begin

end;

function TCMInvoiceSummary.Get_TotalAdjustments: double;
begin

end;

function TCMInvoiceSummary.Get_TotalAmt: double;
begin

end;

function TCMInvoiceSummary.Get_TotalFASAmt: double;
begin

end;

function TCMInvoiceSummary.Get_TotalQty: double;
begin

end;

function TCMInvoiceSummary.Get_TotalTaxAmt: double;
begin

end;

function TCMInvoiceSummary.Get_TotWeight: double;
begin

end;

procedure TCMInvoiceSummary.Set_LineSubTotal(Value: double);
begin

end;

procedure TCMInvoiceSummary.Set_TotalAdjustments(Value: double);
begin

end;

procedure TCMInvoiceSummary.Set_TotalAmt(Value: double);
begin

end;

procedure TCMInvoiceSummary.Set_TotalFASAmt(Value: double);
begin

end;

procedure TCMInvoiceSummary.Set_TotalQty(Value: double);
begin

end;

procedure TCMInvoiceSummary.Set_TotalTaxAmt(Value: double);
begin

end;

procedure TCMInvoiceSummary.Set_TotWeight(Value: double);
begin

end;

{ TCMInvoiceDetail }

function TCMInvoiceDetail.Get_CurrencyType: TCM_XMLString;
begin
  result :=  fCurrencyType
end;

function TCMInvoiceDetail.Get_CurrencyValue: double;
begin
  result := fCurrencyValue;
end;

function TCMInvoiceDetail.Get_lineNo: TCM_XMLString;
begin
  result := fLineNo;
end;

function TCMInvoiceDetail.Get_LineValue: double;
begin
  result := fLineValue;
end;

function TCMInvoiceDetail.Get_Price: double;
begin
  result := fPrice;
end;

function TCMInvoiceDetail.Get_ProdGroup: TCM_XMLString;
begin
  result :=  fProdGroup;
end;

function TCMInvoiceDetail.Get_ProductDescr: TCM_XMLString;
begin
  result := fProductDescr;
end;

function TCMInvoiceDetail.Get_ProductNo: TCM_XMLString;
begin
  result := fProductNo;
end;

function TCMInvoiceDetail.Get_PurchaseOrderNo: TCM_XMLString;
begin
  result := PurchaseOrderNo;
end;

function TCMInvoiceDetail.Get_QuantityType: TCM_XMLString;
begin
  result := fQuantityType;
end;

function TCMInvoiceDetail.Get_QUOM: double;
begin
  result := fQUOM;
end;

function TCMInvoiceDetail.Get_TaxLocation: TCM_XMLString;
begin
  result := fTaxLocation
end;

function TCMInvoiceDetail.Get_TaxPercent: double;
begin
   result := TaxPercent;
end;

function TCMInvoiceDetail.Get_TaxType: TCM_XMLString;
begin
  result := fTaxType
end;

function TCMInvoiceDetail.Get_TaxValue: double;
begin
  result := fTaxValue;
end;

function TCMInvoiceDetail.Get_UOM: TCM_XMLString;
begin
  result := fUOM;
end;

procedure TCMInvoiceDetail.Set_CurrencyType(Value: TCM_XMLString);
begin
  fCurrencyType := Value;
end;

procedure TCMInvoiceDetail.Set_CurrencyValue(Value: double);
begin
  fCurrencyValue := Value;
end;

procedure TCMInvoiceDetail.Set_lineNo(Value: TCM_XMLString);
begin
  flineNo := Value
end;

procedure TCMInvoiceDetail.Set_LineValue(Value: double);
begin
  fLineValue := Value;
end;

procedure TCMInvoiceDetail.Set_Price(Value: double);
begin
  fPrice := Value;
end;

procedure TCMInvoiceDetail.Set_ProdGroup(Value: TCM_XMLString);
begin
  fProdGroup := Value;
end;

procedure TCMInvoiceDetail.Set_ProductDescr(Value: TCM_XMLString);
begin
  fProductDescr := Value;
end;

procedure TCMInvoiceDetail.Set_ProductNo(Value: TCM_XMLString);
begin
  fProductNo := Value;
end;

procedure TCMInvoiceDetail.Set_PurchaseOrderNo(Value: TCM_XMLString);
begin
  fPurchaseOrderNo := Value;
end;

procedure TCMInvoiceDetail.Set_QuantityType(Value: TCM_XMLString);
begin
  fQuantityType := Value;
end;

procedure TCMInvoiceDetail.Set_QUOM(Value: double);
begin
  fQUOM := Value;
end;

procedure TCMInvoiceDetail.Set_TaxLocation(Value: TCM_XMLString);
begin
  fTaxLocation := Value;
end;

procedure TCMInvoiceDetail.Set_TaxPercent(Value: double);
begin
  fTaxPercent := Value;
end;

procedure TCMInvoiceDetail.Set_TaxType(Value: TCM_XMLString);
begin
  fTaxType := Value;
end;

procedure TCMInvoiceDetail.Set_TaxValue(Value: double);
begin
  fTaxValue := value;
end;

procedure TCMInvoiceDetail.Set_UOM(Value: TCM_XMLString);
begin
  fUOM := Value;
end;

{ TCMInvoiceDetails }
{ To contain all invoice detail lines for an Invoice.}

{ Array indexes:
   - rix: Read index  -- can also be used as no of lines in actual invoice after all lines are added.
   - wix Write index
}
procedure TCMInvoiceDetails.add(const pmcInvDet: ICMInvoiceDetail);
begin
  if (system.length(fList) <= wix) then begin
    setlength(fList, system.length(fList)+50); // Allocate space for 50 invoice lines each time it's filled up.
  end;
  fList[wix] := pmcInvDet;
  inc(wix);   // This is the only time (wix) changes.
end;

function TCMInvoiceDetails.getInvoiceDetail(index: integer): ICMInvoiceDetail;
begin
  result := fList[index];
end;

function TCMInvoiceDetails.getNext: ICMInvoiceDetail;
begin
  result := fList[rix];
  inc(rix);
end;

function TCMInvoiceDetails.Length: integer;
begin
  result := wix;   // No of added invoice lines.
end;

procedure TCMInvoiceDetails.rewind;
begin
  rix := 0;
end;

end.
