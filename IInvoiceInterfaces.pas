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
  ICMInvoiceDetails = interface;
  ICMShipToCharacteristics = interface;
  ICMInvoiceShipmentList = interface;
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

  ICMInvoice = interface(IInvokable)
    ['{8069589C-D3F9-4C56-BEB5-BE87C31536C8}']
    function Get_InvoiceType: TCM_XMLString;
//    function Get_InvoiceContextType: TCM_XMLString;
//    function Get_Reissued: TCM_XMLString;
    function Get_Language: TCM_XMLString;
    function Get_InvoiceHeader: ICMInvoiceHeader;
    function Get_InvoiceShipment: ICMInvoiceShipmentList;
//    function Get_MonetaryAdjustment: ICMMonetaryAdjustmentList;
    function Get_InvoiceSummary: ICMInvoiceSummary;
    procedure Set_InvoiceType(const pmcValue: TCM_XMLString);
//    procedure Set_InvoiceContextType(Value: TCM_XMLString);
//    procedure Set_Reissued(Value: TCM_XMLString);
    procedure Set_Language(const pmcValue: TCM_XMLString);
    { Methods & Properties }
    property InvoiceType: TCM_XMLString read Get_InvoiceType write Set_InvoiceType;
//    property InvoiceContextType: TCM_XMLString read Get_InvoiceContextType write Set_InvoiceContextType;
//    property Reissued: TCM_XMLString read Get_Reissued write Set_Reissued;
    property Language: TCM_XMLString read Get_Language write Set_Language;
//    property InvoiceHeader: ICMInvoiceHeader read Get_InvoiceHeader;
    property InvoiceShipment: ICMInvoiceShipmentList read Get_InvoiceShipment;
//    property MonetaryAdjustment: ICMMonetaryAdjustmentList read Get_MonetaryAdjustment;
    property InvoiceSummary: ICMInvoiceSummary read Get_InvoiceSummary;
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
    procedure Set_VATNo(Value: TCM_XMLString);
    procedure Set_CustomerNo(Value: TCM_XMLString);
    procedure Set_InvoiceNumber(const pmcValue: TCM_XMLString);
    procedure Set_InvoiceDate(const pmcValue: TCM_XMLString);
    { Methods & Properties }
    procedure Set_LoadingOrderNo(Value: TCM_XMLString);
    procedure Set_Contract(Value: TCM_XMLString);
    procedure Set_LoadNo(Value: TCM_XMLString);
    procedure Set_BillToParty(Value: ICMTypedParty);
    property LoadingOrderNo: TCM_XMLString read Get_LoadingOrderNo write Set_LoadingOrderNo;
    property Contract: TCM_XMLString read Get_Contract write Set_Contract;
    property LoadNo: TCM_XMLString read Get_LoadNo write Set_LoadNo;
    property InvoiceNumber: TCM_XMLString read Get_InvoiceNumber write Set_InvoiceNumber;
    property InvoiceDate: TCMInvoiceDate read Get_InvoiceDate;
    property InvoiceReference: ICMInvoiceReferenceList read Get_InvoiceReference;
    property BillToParty: ICMTypedParty read Get_BillToParty write Set_BillToParty;
    property SupplierParty: ICMTypedParty read Get_SupplierParty;
    property BuyerParty: ICMTypedParty read Get_BuyerParty;
    property ShipToCharacteristics: ICMShipToCharacteristics read Get_ShipToCharacteristics;
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

  ICMInvoiceDetail = interface(IInvokable)
    ['{74A0D07C-8663-4EAB-AF9D-8A3767727FC2}']
  end;
  ICMInvoiceDetails = interface(IInvokable)
    ['{15E7E9E8-8B9B-4CD8-9042-68C9BBE9F6E0}']
  end;

  ICMInvoiceShipmentList = interface(IInvokable)
    ['{D6D26F42-C885-4095-8A4C-0A7176A59B12}']
  end;
  ICMInvoiceSummary = interface(IInvokable)
    ['{6B4A48D8-5D9C-4A40-B194-B52B9FE340E6}']
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

(*
    ICMBillToParty = interface(ICMTypedParty)
      ['{4657D20A-9A7A-4BD7-A515-1C11771BBCFD}']
    end;

*)
  (*
    ICMGetInvoiceData = interface(IInvokable)
      function getBillTo: TCMBillTo;
      function getInvoiceHeader: ICMInvoice;
      function getInvoiceDetail: ICMInvoiceDetail;
      function ge
    end;

*)
implementation

end.
