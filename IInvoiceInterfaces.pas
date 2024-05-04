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
  ICMDateBasis = interface;
  ICMParty = interface;
  ICMPartyList = interface;
  ICMCountry = interface;
  ICMCountryOfOrigin = interface;
  ICMCountryOfDestination = interface;
  ICMInvoiceReference = interface;
  ICMInvoiceReferenceList = interface;
  ICMCountryOfConsumption = interface;
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
    function Get_BillToParty: ICMParty;
    function Get_SupplierParty: ICMParty;
    function Get_BuyerParty: ICMParty;
    function Get_ShipToCharacteristics: ICMShipToCharacteristics;
    function Get_SenderParty: ICMParty;
    function Get_ReceiverParty: ICMPartyList;
    function Get_CountryOfOrigin: ICMCountryOfOrigin;
    function Get_CountryOfDestination: ICMCountryOfDestination;
    function Get_CountryOfConsumption: ICMCountryOfConsumption;
    procedure Set_InvoiceNumber(const pmcValue: TCM_XMLString);
    procedure Set_InvoiceDate(const pmcValue: TCM_XMLString);
    { Methods & Properties }
    property InvoiceNumber: TCM_XMLString read Get_InvoiceNumber write Set_InvoiceNumber;
    property InvoiceDate: TCMInvoiceDate read Get_InvoiceDate;
    property InvoiceReference: ICMInvoiceReferenceList read Get_InvoiceReference;
    property BillToParty: ICMParty read Get_BillToParty;
    property SupplierParty: ICMParty read Get_SupplierParty;
    property BuyerParty: ICMParty read Get_BuyerParty;
    property ShipToCharacteristics: ICMShipToCharacteristics read Get_ShipToCharacteristics;
    property SenderParty: ICMParty read Get_SenderParty;
    property ReceiverParty: ICMPartyList read Get_ReceiverParty;
    property CountryOfOrigin: ICMCountryOfOrigin read Get_CountryOfOrigin;
    property CountryOfDestination: ICMCountryOfDestination read Get_CountryOfDestination;

  end;

{ IXMLInvoiceReference }

  ICMInvoiceReference = interface(IInvokable)
    ['{491DBE2A-F120-4459-A957-38111F468EF7}']
    { Property Accessors }
    function Get_InvoiceReferenceType: UnicodeString;
    function Get_AssignedBy: UnicodeString;
    procedure Set_InvoiceReferenceType(Value: UnicodeString);
    procedure Set_AssignedBy(Value: UnicodeString);
    { Methods & Properties }
    property InvoiceReferenceType: UnicodeString read Get_InvoiceReferenceType write Set_InvoiceReferenceType;
    property AssignedBy: UnicodeString read Get_AssignedBy write Set_AssignedBy;
  end;

{ IXMLInvoiceReferenceList }

  ICMInvoiceReferenceList = interface(IInvokable)
    ['{BABABC39-EB29-46F4-AFFA-8DDD3539E2D8}']
    { Methods & Properties }
    function Add: ICMInvoiceReference;
    function Insert(const Index: Integer): IXMLInvoiceReference;

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

{ IXMLNameAddress }

  ICMNameAddress = interface
    ['{969DE82C-A366-43D1-8789-AF81F9FEFFFC}']
    { Property Accessors }
//    function Get_CommunicationRole: UnicodeString;
//    function Get_AddressRoleType: UnicodeString;
    function Get_Name1: TCM_XMLString;
//    function Get_Name2: UnicodeString;
//    function Get_Name3: UnicodeString;
//    function Get_OrganisationUnit: IXMLOrganisationUnit;
    function Get_Address1: TCMAddress;
    function Get_Address2: TCMAddress;
    function Get_Address3: TCMAddress;
//    function Get_Address4: UnicodeString;
    function Get_City: TCMCity;
    function Get_County: TCMCounty;
    function Get_StateOrProvince: TCMState;
    function Get_PostalCode: TCMPostalCode;
    function Get_Country: TCMCountry;
//    function Get_GPSCoordinates: IXMLGPSCoordinates;
//    function Get_MapCoordinates: IXMLMapCoordinatesList;
//    procedure Set_CommunicationRole(Value: UnicodeString);
//    procedure Set_AddressRoleType(Value: UnicodeString);
    procedure Set_Name1(const pcmValue: TCMName);
//    procedure Set_Name2(Value: UnicodeString);
//    procedure Set_Name3(Value: UnicodeString);
    procedure Set_Address1(const pcmValue: TCMAddress);
    procedure Set_Address2(const pcmValue: TCMAddress);
    procedure Set_Address3(const pcmValue: TCMAddress);
//    procedure Set_Address4(Value: UnicodeString);
    procedure Set_City(const pcmValue: TCMCity);
    procedure Set_County(const pcmValue: TCMCounty);
    procedure Set_StateOrProvince(const pcmValue: TCMState);
    { Methods & Properties }
//    property CommunicationRole: UnicodeString read Get_CommunicationRole write Set_CommunicationRole;
//    property AddressRoleType: UnicodeString read Get_AddressRoleType write Set_AddressRoleType;
    property Name1: TCMName read Get_Name1 write Set_Name1;
//    property Name2: UnicodeString read Get_Name2 write Set_Name2;
//    property Name3: UnicodeString read Get_Name3 write Set_Name3;
//    property OrganisationUnit: IXMLOrganisationUnit read Get_OrganisationUnit;
    property Address1: TCMAddress read Get_Address1 write Set_Address1;
    property Address2: TCMAddress read Get_Address2 write Set_Address2;
    property Address3: TCMAddress read Get_Address3 write Set_Address3;
//    property Address4: UnicodeString read Get_Address4 write Set_Address4;
    property City: TCMCity read Get_City write Set_City;
    property County: TCMCounty read Get_County write Set_County;
    property StateOrProvince: TCMState read Get_StateOrProvince write Set_StateOrProvince;
    property PostalCode: TCMPostalCode read Get_PostalCode;
    property Country: TCMCountry read Get_Country;
//    property GPSCoordinates: IXMLGPSCoordinates read Get_GPSCoordinates;
//    property MapCoordinates: IXMLMapCoordinatesList read Get_MapCoordinates;
  end;

{ IXMLCountryOfOrigin }

  ICMCountryOfOrigin = interface(IInvokable)
    ['{FB045998-AB4D-460A-A813-B0423AB848E7}']
    { Property Accessors }
    function Get_Country: ICMCountry;
    { Methods & Properties }
    property Country: ICMCountry read Get_Country;
  end;

{ IXMLCountryOfDestination }

  ICMCountryOfDestination = interface(IInvokable)
    ['{C76085B9-D190-425F-A0C6-7AA3B7FD9D58}']
    { Property Accessors }
    function Get_Country: ICMCountry;
    { Methods & Properties }
    property Country: ICMCountry read Get_Country;
  end;

{ IXMLCountry }

  ICMCountry = interface(IInvokable)
    ['{BE5FEAC4-13AA-4BDD-AA15-60FE2D135F7A}']
    { Property Accessors }
    function Get_ISOCountryCode: UnicodeString;
    function Get_ISOCountryCodeAlpha3: UnicodeString;
    function Get_ISOCountryCodeNumeric: UnicodeString;
    procedure Set_ISOCountryCode(Value: UnicodeString);
    procedure Set_ISOCountryCodeAlpha3(Value: UnicodeString);
    procedure Set_ISOCountryCodeNumeric(Value: UnicodeString);
    { Methods & Properties }
    property ISOCountryCode: UnicodeString read Get_ISOCountryCode write Set_ISOCountryCode;
    property ISOCountryCodeAlpha3: UnicodeString read Get_ISOCountryCodeAlpha3 write Set_ISOCountryCodeAlpha3;
    property ISOCountryCodeNumeric: UnicodeString read Get_ISOCountryCodeNumeric write Set_ISOCountryCodeNumeric;
  end;

  ICMCountryOfConsumption = interface(IInvokable)
  ['{1318B23C-66F5-44E8-8956-0962292E90C8}']
  end;

{ IXMLShipToCharacteristics }

  ICMShipToCharacteristics = interface(IInvokable)
    ['{9A494238-9B35-45FA-BC05-44666A28C218}']
    { Property Accessors }
    function Get_ShipToParty: IXMLTypedParty;
    function Get_SupplyPoint: IXMLSupplyPointList;
    function Get_LocationCode: IXMLLocationCode;
    function Get_TermsOfDelivery: IXMLTermsOfDelivery;
    function Get_DeliveryRouteCode: IXMLDeliveryRouteCode;
    { Methods & Properties }
    property ShipToParty: IXMLTypedParty read Get_ShipToParty;
    property SupplyPoint: IXMLSupplyPointList read Get_SupplyPoint;
    property LocationCode: IXMLLocationCode read Get_LocationCode;
    property TermsOfDelivery: IXMLTermsOfDelivery read Get_TermsOfDelivery;
    property DeliveryRouteCode: IXMLDeliveryRouteCode read Get_DeliveryRouteCode;
  end;

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
