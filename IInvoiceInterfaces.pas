unit IInvoiceInterfaces;

interface
uses
  InvoiceWoodV2R31
  , uInvoiceType
;

type
{ Forward Decls }
  ICMInvoice = interface;
  ICMInvoiceHeader = interface;
  ICMInvoiceDetails = interface;
  ICMInvoiceShipmentList = interface;
  ICMInvoiceSummary = interface;
  ICMMonetaryAdjustmentList = interface;

  ICMInvoice = interface(IInvokable)
    ['{8069589C-D3F9-4C56-BEB5-BE87C31536C8}']
(*    function Get_InvoiceType: TCM_XMLString;
    function Get_InvoiceContextType: TCM_XMLString;
    function Get_Reissued: TCM_XMLString;
    function Get_Language: TCM_XMLString;
    function Get_InvoiceHeader: ICMInvoiceHeader;
    function Get_InvoiceShipment: ICMInvoiceShipmentList;
    function Get_MonetaryAdjustment: ICMMonetaryAdjustmentList;
    function Get_InvoiceSummary: ICMInvoiceSummary;
    procedure Set_InvoiceType(Value: TCM_XMLString);
    procedure Set_InvoiceContextType(Value: TCM_XMLString);
    procedure Set_Reissued(Value: TCM_XMLString);
    procedure Set_Language(Value: TCM_XMLString);
    { Methods & Properties }
    property InvoiceType: TCM_XMLString read Get_InvoiceType write Set_InvoiceType;
    property InvoiceContextType: TCM_XMLString read Get_InvoiceContextType write Set_InvoiceContextType;
    property Reissued: TCM_XMLString read Get_Reissued write Set_Reissued;
    property Language: TCM_XMLString read Get_Language write Set_Language;
    property InvoiceHeader: ICMInvoiceHeader read Get_InvoiceHeader;
    property InvoiceShipment: ICMInvoiceShipmentList read Get_InvoiceShipment;
    property MonetaryAdjustment: ICMMonetaryAdjustmentList read Get_MonetaryAdjustment;
    property InvoiceSummary: ICMInvoiceSummary read Get_InvoiceSummary;   *)
  end;
  ICMInvoiceHeader = interface(IInvokable)
    ['{93ED2DB8-59C6-4CAF-AA8A-FD85162208E0}']
    function Get_InvoiceNumber: UnicodeString;
(*    function Get_InvoiceDate: ICMInvoiceDate;
    function Get_OtherDate: ICMOtherDateList;
    function Get_InvoiceReference: ICMInvoiceReferenceList;
    function Get_BillToParty: ICMParty;
    function Get_SupplierParty: ICMParty;
    function Get_BuyerParty: ICMParty;
    function Get_RemitToParty: ICMPartyList;
    function Get_ShipToCharacteristics: ICMShipToCharacteristics;
    function Get_OtherParty: ICMTypedPartyList;
    function Get_SenderParty: ICMTypedParty;
    function Get_ReceiverParty: ICMTypedPartyList;
    function Get_LocationParty: ICMLocationPartyList;
    function Get_CountryOfOrigin: ICMCountryOfOrigin;
    function Get_CountryOfDestination: ICMCountryOfDestination;
    function Get_CountryOfConsumption: ICMCountryOfConsumption;
    function Get_CarrierParty: ICMParty;
    function Get_TransportVehicleIdentifier: ICMTransportVehicleIdentifier;
    function Get_TransportUnitIdentifier: ICMTransportUnitIdentifier;
    function Get_Insurance: ICMInsurance;
    function Get_CreditDebitNoteReason: ICMCreditDebitNoteReason;
    function Get_AdditionalText: ICMS255List;
    procedure Set_InvoiceNumber(Value: UnicodeString);
    { Methods & Properties }
    property InvoiceNumber: UnicodeString read Get_InvoiceNumber write Set_InvoiceNumber;
    property InvoiceDate: ICMInvoiceDate read Get_InvoiceDate;
    property OtherDate: ICMOtherDateList read Get_OtherDate;
    property InvoiceReference: ICMInvoiceReferenceList read Get_InvoiceReference;
    property BillToParty: ICMParty read Get_BillToParty;
    property SupplierParty: ICMParty read Get_SupplierParty;
    property BuyerParty: ICMParty read Get_BuyerParty;
    property RemitToParty: ICMPartyList read Get_RemitToParty;
    property ShipToCharacteristics: ICMShipToCharacteristics read Get_ShipToCharacteristics;
    property OtherParty: ICMTypedPartyList read Get_OtherParty;
    property SenderParty: ICMTypedParty read Get_SenderParty;
    property ReceiverParty: ICMTypedPartyList read Get_ReceiverParty;
    property LocationParty: ICMLocationPartyList read Get_LocationParty;
    property CountryOfOrigin: ICMCountryOfOrigin read Get_CountryOfOrigin;
    property CountryOfDestination: ICMCountryOfDestination read Get_CountryOfDestination;
    property CountryOfConsumption: ICMCountryOfConsumption read Get_CountryOfConsumption;
    property CarrierParty: ICMParty read Get_CarrierParty;
    property TransportVehicleIdentifier: ICMTransportVehicleIdentifier read Get_TransportVehicleIdentifier;
    property TransportUnitIdentifier: ICMTransportUnitIdentifier read Get_TransportUnitIdentifier;
    property Insurance: ICMInsurance read Get_Insurance;
    property CreditDebitNoteReason: ICMCreditDebitNoteReason read Get_CreditDebitNoteReason;
    property AdditionalText: ICMS255List read Get_AdditionalText;
*)
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


{ IXMLNameAddress }

  ICMNameAddress = interface
    ['{0089A8FA-9504-430B-BFF9-6C3AB84F5A3F}']
    { Property Accessors }
//    function Get_CommunicationRole: UnicodeString;
//    function Get_AddressRoleType: UnicodeString;
    function Get_Name1: UnicodeString;
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
