unit IInvoiceInterfaces;

interface
uses
  InvoiceWoodV2R31
  , uInvoiceType
  , system.Generics.Collections
  , system.classes
;

type
{ Forward Decls }
  ICMInvoice = interface;
  ICMInvoiceHeader = interface;
  ICMInvoiceDetail = interface;
  ICMShipToCharacteristics = interface;
//  ICMInvoiceShipmentList = interface;
  ICMInvoiceShipment = interface;
  ICMInvoiceSummary = interface;
  ICMMonetaryAdjustmentList = interface;
  ICMNameAddress = interface;
  ICMDateBasis = interface;
  ICMParty = interface;
  ICMPartyList = interface;
  ICMCountry = interface;
  ICMCountryOfOrigin = interface;
  ICMCountryOfDestination = interface;
  ICMInvoiceReference = interface;
  ICMInvoiceReferenceList = interface;
  ICMCountryOfConsumption = interface;
  ICMTypedParty = interface;
  TCMS255List = TStrings;

  ICMInvoiceDetail = interface(IInvokable)
    ['{ED65CC0B-455B-4140-94A1-9DB8D36E9D53}']
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

  ICMInvoiceDetails = interface(IInvokable)
    ['{37EEFCF8-3A11-4B32-9ED3-E4AD8540EC98}']
    function getNext: ICMInvoiceDetail;
    function Length: integer;
    function getInvoiceDetail(index: integer): ICMInvoiceDetail;
    procedure add(const pmcInvDet: ICMInvoiceDetail);
    procedure rewind;
  end;

  ICMInvoiceSummary = interface(IInvokable)
    ['{491A2A8C-7F4E-4C7B-A60E-18A3B4352E2F}']
    function Get_TotalQty: double;
    function Get_TotWeight: double;
    function Get_LineSubTotal: double;
    function Get_TotalAdjustments: double;
    function Get_TotalTaxAmt: double;
    function Get_TotalFASAmt: double;
    function Get_TotalAmt: double;
    function getQty_AsString: string;

    procedure Set_TotalQty(Value: double);
    procedure Set_TotWeight(Value: double);
    procedure Set_LineSubTotal(Value: double);
    procedure Set_TotalAdjustments(Value: double);
    procedure Set_TotalTaxAmt(Value: double);
    procedure Set_TotalFASAmt(Value: double);
    procedure Set_TotalAmt(Value: double);

    property TotalQty: double Read Get_TotalQty write Set_TotalQty ;
    property TotWeight: double Read Get_TotWeight write Set_TotWeight ;
    property LineSubTotal: double Read Get_LineSubTotal write Set_LineSubTotal ;
    property TotalAdjustments: double Read Get_TotalAdjustments write Set_TotalAdjustments ;
    property TotalTaxAmt: double Read Get_TotalTaxAmt write Set_TotalTaxAmt ;
    property TotalFASAmt: double Read Get_TotalFASAmt write Set_TotalFASAmt ;
    property TotalAmt: double Read Get_TotalAmt write Set_TotalAmt ;
    property strQty: string read getQty_AsString;
  end;

  ICMInvoice = interface(IInvokable)
    ['{8069589C-D3F9-4C56-BEB5-BE87C31536C8}']
    function Get_InvoiceType: TCM_XMLString;
    function Get_Language: TCM_XMLString;
    function Get_InvoiceHeader: ICMInvoiceHeader;
    function Get_InvoiceDetails: ICMInvoiceDetails;
    function Get_InvoiceSummary: ICMInvoiceSummary;
    function Get_LineTotal: TCM_XMLString;
    function Get_CurrencyType: TCM_XMLString;
    function Get_InvoiceDate: TCM_XMLString;
    function Get_TermsOfPayment: TCM_XMLString;
    function Get_DeliveryTerms: TCM_XMLString;
    function Get_InvoiceDuedate: TCM_XMLString;
    function Get_PaymentDesciption: TCM_XMLString;

    procedure Set_InvoiceSummary(const pmcInvSum : ICMInvoiceSummary);
    procedure Set_InvoiceType(const pmcValue: TCM_XMLString);
    procedure Set_Language(const pmcValue: TCM_XMLString);
    procedure Set_LineTotal(Value: TCM_XMLString);
    procedure Set_CurrencyType(Value: TCM_XMLString);
    procedure Set_InvoiceDate(const Value: TCM_XMLString);
    procedure Set_TermsOfpayment(const Value: TCM_XMLString);
    procedure Set_DeliveryTerms(const Value: TCM_XMLString);
    procedure Set_InvoiceDueDate(const Value: TCM_XMLString);
    procedure Set_PaymentDescription(const Value: TCM_XMLString);

//    function Get_InvoiceContextType: TCM_XMLString;
//    function Get_Reissued: TCM_XMLString;
//    function GetInvoiceShipments: ICMInvoiceShipmentList;
//    function Get_MonetaryAdjustment: ICMMonetaryAdjustmentList;
//    procedure Set_InvoiceContextType(Value: TCM_XMLString);
//    procedure Set_Reissued(Value: TCM_XMLString);
    { Methods & Properties }
//    property InvoiceContextType: TCM_XMLString read Get_InvoiceContextType write Set_InvoiceContextType;
//    property Reissued: TCM_XMLString read Get_Reissued write Set_Reissued;
//    property InvoiceHeader: ICMInvoiceHeader read Get_InvoiceHeader;
//    property InvoiceShipment: ICMInvoiceShipmentList read Get_InvoiceShipments;
//    property MonetaryAdjustment: ICMMonetaryAdjustmentList read Get_MonetaryAdjustment;
    property InvoiceType: TCM_XMLString read Get_InvoiceType write Set_InvoiceType;
    property Language: TCM_XMLString read Get_Language write Set_Language;
    property InvoiceSummary: ICMInvoiceSummary read Get_InvoiceSummary write Set_InvoiceSummary;
    property InvoiceDetails: ICMInvoiceDetails read Get_InvoiceDetails;
    property LineTotal: TCM_XMLString read Get_LineTotal write Set_LineTotal;
    property CurrencyType: TCM_XMLString read Get_CurrencyType write Set_CurrencyType;
    property TermsOfPayment: TCM_XMLString read Get_TermsOfPayment write Set_TermsOfpayment;
    property InvoiceDate: TCM_XMLString read Get_InvoiceDate write Set_InvoiceDate;
    property InvoiceDuedate: TCM_XMLString read Get_InvoiceDuedate write Set_InvoiceDueDate;
    property PaymentDescription: TCM_XMLString read Get_PaymentDesciption write Set_PaymentDescription;
    property DeliveryTerms: TCM_XMLString read Get_DeliveryTerms write Set_DeliveryTerms;
  end;

  ICMInvoiceHeader = interface(IInvokable)
    ['{79155B8E-B06B-4F7C-BB49-23B19193B626}']
    function Get_InvoiceNumber: TCM_XMLString;
    function Get_InvoiceDate: TCM_XMLString;
    function Get_InvoiceReference: ICMInvoiceReferenceList;
    function Get_BillToParty: ICMTypedParty;
    function Get_SupplierParty: ICMTypedParty;
    function Get_BuyerParty: ICMTypedParty;
    function Get_ShipToCharacteristics: ICMShipToCharacteristics;
    function Get_SenderParty: ICMTypedParty;
    function Get_ReceiverParty: ICMPartyList;
    function Get_CountryOfOrigin: ICMCountryOfOrigin;
    function Get_CountryOfDestination: ICMCountryOfDestination;
    function Get_CountryOfConsumption: ICMCountryOfConsumption;
    function Get_LoadingOrderNo: TCM_XMLString;
    function Get_Contract: TCM_XMLString;
    function Get_LoadNo: TCM_XMLString;
    function Get_CustomerNo: TCM_XMLString;
    function Get_VATNo: TCM_XMLString;
    { Methods & Properties }

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

    property LoadingOrderNo: TCM_XMLString read Get_LoadingOrderNo write Set_LoadingOrderNo;
    property Contract: TCM_XMLString read Get_Contract write Set_Contract;
    property LoadNo: TCM_XMLString read Get_LoadNo write Set_LoadNo;
    property InvoiceNumber: TCM_XMLString read Get_InvoiceNumber write Set_InvoiceNumber;
    property InvoiceDate: TCMInvoiceDate read Get_InvoiceDate;
    property InvoiceReference: ICMInvoiceReferenceList read Get_InvoiceReference;
    property BillToParty: ICMTypedParty read Get_BillToParty write Set_BillToParty;
    property SupplierParty: ICMTypedParty read Get_SupplierParty write Set_SupplierParty;
    property BuyerParty: ICMTypedParty read Get_BuyerParty write Set_BuyerParty;
    property ShipToCharacteristics: ICMShipToCharacteristics read Get_ShipToCharacteristics write Set_ShipToCharacterisics;
    property SenderParty: ICMTypedParty read Get_SenderParty;
    property ReceiverParty: ICMPartyList read Get_ReceiverParty;
    property CountryOfOrigin: ICMCountryOfOrigin read Get_CountryOfOrigin;
    property CountryOfDestination: ICMCountryOfDestination read Get_CountryOfDestination;
    property CustomerNo: TCM_XMLString read Get_CustomerNo write Set_CustomerNo;
    property VATNo: TCM_XMLString read Get_VATNo write Set_VATNo;
  end;

{ ICMInvoiceReference }

  ICMInvoiceReference = interface(IInvokable)
    ['{491DBE2A-F120-4459-A957-38111F468EF7}']
    { Property Accessors }
    function Get_InvoiceReferenceType: TCM_XMLString;
    function Get_AssignedBy: TCM_XMLString;
    procedure Set_InvoiceReferenceType(Value: TCM_XMLString);
    procedure Set_AssignedBy(Value: TCM_XMLString);
    { Methods & Properties }
    property InvoiceReferenceType: TCM_XMLString read Get_InvoiceReferenceType write Set_InvoiceReferenceType;
    property AssignedBy: TCM_XMLString read Get_AssignedBy write Set_AssignedBy;
  end;

{ ICMInvoiceReferenceList }

  ICMInvoiceReferenceList = interface(IInvokable)
    ['{BABABC39-EB29-46F4-AFFA-8DDD3539E2D8}']
    { Methods & Properties }
    function Add: ICMInvoiceReference;
    function Insert(const Index: Integer): ICMInvoiceReference;

    function Get_Item(Index: Integer): ICMInvoiceReference;
    property Items[Index: Integer]: ICMInvoiceReference read Get_Item; default;
  end;


  ICMMonetaryAdjustmentList = interface(IInvokable)
    ['{88FC62E5-D3CF-4061-BEBA-94F982C72EC6}']
  end;

  ICMInvoiceWoodSummary = interface(IInvokable)
    ['{1970C3E6-8053-4A84-A39F-AA7BFEF09AF2}']
  end;

  ICMParty = interface(IInvokable)
    ['{7EFB8784-F935-480C-A388-D5013ED16A80}']
      function Get_VATid: TCM_XMLString;
      procedure Set_VATid(Value: TCM_XMLString);
      function Get_Address: ICMNameAddress;
      procedure Set_Address(Value: ICMNameAddress);
  end;

  ICMPartyList = interface(IInvokable)
    ['{DA303883-BF5B-4CFC-B6D3-94303710BB9D}']
  end;

  ICMInvoicedate = interface(IInvokable)
    ['{7E13378D-8785-40EA-A53E-01169895FAE5}']
  end;

  ICMDateBasis = interface(IInvokable)
    ['{39EA7A5C-E2AB-4EF8-A784-A68FA50EBFEB}']
  end;
  ICMShipmentMethodOfPayment = interface(IInvokable)
    ['{7CC597C6-1715-41A6-A876-B196A81784F9}']
  end;
{ ICMTermsOfDelivery }

  ICMTermsOfDelivery = interface(IInvokable)
    ['{C4E3FCEA-A8B4-4F8B-8EB3-954CE896DEEB}']
    { Property Accessors }
    (*
    function Get_IncotermsLocation: ICMIncotermsLocation;
    function Get_ShipmentMethodOfPayment: ICMShipmentMethodOfPayment;
    function Get_FreightPayableAt: UnicodeString;
    function Get_ServiceLevel: ICMServiceLevelList;
    procedure Set_FreightPayableAt(Value: UnicodeString);
    { Methods & Properties }
    property IncotermsLocation: ICMIncotermsLocation read Get_IncotermsLocation;
    property ShipmentMethodOfPayment: ICMShipmentMethodOfPayment read Get_ShipmentMethodOfPayment;
    property FreightPayableAt: UnicodeString read Get_FreightPayableAt write Set_FreightPayableAt;
    property ServiceLevel: ICMServiceLevelList read Get_ServiceLevel;
    *)
    function Get_AdditionalText: TCM_XMLString;
    function Get_ShipmentMethodOfPayment: ICMShipmentMethodOfPayment;
    procedure Set_AdditionalText(Value: TCM_XMLString);
    property ShipmentMethodOfPayment: ICMShipmentMethodOfPayment read Get_ShipmentMethodOfPayment;
    property AdditionalText: TCM_XMLString read Get_AdditionalText write Set_AdditionalText;
  end;

{ ICMNameAddress }

  ICMNameAddress = interface
    ['{969DE82C-A366-43D1-8789-AF81F9FEFFFC}']
    { Property Accessors }
    function Get_Name1: TCM_XMLString;
    function Get_Address1: TCM_XMLString;
    function Get_Address2: TCM_XMLString;
    function Get_Address3: TCM_XMLString;
    function Get_City: TCM_XMLString;
    function Get_County: TCM_XMLString;
    function Get_StateOrProvince: TCM_XMLString;
    function Get_PostalCode: TCM_XMLString;
    function Get_Country: TCM_XMLString;
    procedure Set_Name1(const pcmValue: TCM_XMLString);
    procedure Set_Address1(const pcmValue: TCM_XMLString);
    procedure Set_Address2(const pcmValue: TCM_XMLString);
    procedure Set_Address3(const pcmValue: TCM_XMLString);
    procedure Set_City(const pcmValue: TCM_XMLString);
    procedure Set_County(const pcmValue: TCM_XMLString);
    procedure Set_StateOrProvince(const pcmValue: TCM_XMLString);
    procedure Set_Country(const pcmValue: TCM_XMLString);
    procedure Set_PostalCode(const pcmValue: TCM_XMLString);

    { Methods & Properties }
    property Name1: TCM_XMLString read Get_Name1 write Set_Name1;
    property Address1: TCM_XMLString read Get_Address1 write Set_Address1;
    property Address2: TCM_XMLString read Get_Address2 write Set_Address2;
    property Address3: TCM_XMLString read Get_Address3 write Set_Address3;
    property City: TCM_XMLString read Get_City write Set_City;
    property County: TCM_XMLString read Get_County write Set_County;
    property StateOrProvince: TCM_XMLString read Get_StateOrProvince write Set_StateOrProvince;
    property PostalCode: TCM_XMLString read Get_PostalCode write set_PostalCode;
    property Country: TCM_XMLString read Get_Country write set_country;
  end;

{ ICMCountryOfOrigin }

  ICMCountryOfOrigin = interface(IInvokable)
    ['{FB045998-AB4D-460A-A813-B0423AB848E7}']
    { Property Accessors }
    function Get_Country: ICMCountry;
    { Methods & Properties }
    property Country: ICMCountry read Get_Country;
  end;

{ ICMCountryOfDestination }

  ICMCountryOfDestination = interface(IInvokable)
    ['{C76085B9-D190-425F-A0C6-7AA3B7FD9D58}']
    { Property Accessors }
    function Get_Country: ICMCountry;
    { Methods & Properties }
    property Country: ICMCountry read Get_Country;
  end;

{ ICMCountry }

  ICMCountry = interface(IInvokable)
    ['{BE5FEAC4-13AA-4BDD-AA15-60FE2D135F7A}']
    { Property Accessors }
    function Get_ISOCountryCode: TCM_XMLString;
    function Get_ISOCountryCodeAlpha3: TCM_XMLString;
    function Get_ISOCountryCodeNumeric: TCM_XMLString;
    procedure Set_ISOCountryCode(Value: TCM_XMLString);
    procedure Set_ISOCountryCodeAlpha3(Value: TCM_XMLString);
    procedure Set_ISOCountryCodeNumeric(Value: TCM_XMLString);
    { Methods & Properties }
    property ISOCountryCode: TCM_XMLString read Get_ISOCountryCode write Set_ISOCountryCode;
    property ISOCountryCodeAlpha3: TCM_XMLString read Get_ISOCountryCodeAlpha3 write Set_ISOCountryCodeAlpha3;
    property ISOCountryCodeNumeric: TCM_XMLString read Get_ISOCountryCodeNumeric write Set_ISOCountryCodeNumeric;
  end;

  ICMCountryOfConsumption = interface(IInvokable)
  ['{1318B23C-66F5-44E8-8956-0962292E90C8}']
  end;

{ ICMShipToCharacteristics }

  ICMShipToCharacteristics = interface(IInvokable)
    ['{01D7E060-33F6-4AB5-9741-20E86463CAAB}']
    { Property Accessors }
    function Get_ShipToParty: ICMTypedParty;
//    function Get_SupplyPoint: ICMSupplyPointList;
//    function Get_LocationCode: ICMLocationCode;
    function Get_TermsOfDelivery: ICMTermsOfDelivery;
    procedure Set_TermsOfDelivery(Value: ICMTermsOfDelivery);
//    function Get_DeliveryRouteCode: ICMDeliveryRouteCode;
    { Methods & Properties }
    property ShipToParty: ICMTypedParty read Get_ShipToParty;
//    property SupplyPoint: ICMSupplyPointList read Get_SupplyPoint;
//    property LocationCode: ICMLocationCode read Get_LocationCode;
    property TermsOfDelivery: ICMTermsOfDelivery read Get_TermsOfDelivery  write set_TermsOfDelivery;
//    property DeliveryRouteCode: ICMDeliveryRouteCode read Get_DeliveryRouteCode;
  end;

{ ICMTypedParty }

  ICMTypedParty = interface(ICMParty)
    ['{F0A5C4DE-1AD1-4B8C-80CB-C719A46B0A07}']
    { Property Accessors }
    function Get_PartyType: TCM_XMLString;
    procedure Set_PartyType(Value: TCM_XMLString);
    { Methods & Properties }
    property PartyType: TCM_XMLString read Get_PartyType write Set_PartyType;
  end;

{ ICMInvoiceShipment }

  ICMInvoiceShipment = interface(IInvokable)
    ['{B7816101-FE85-4806-9F5E-360CC4798BE7}']
  end;

implementation

end.
