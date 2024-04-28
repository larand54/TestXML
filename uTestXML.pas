
{****************************************************************************************************************************************}
{                                                                                                                                        }
{                                                            XML Data Binding                                                            }
{                                                                                                                                        }
{         Generated on: 2024-03-27 20:47:32                                                                                              }
{       Generated from: C:   }
{   Settings stored in: Q:                                                   }
{                                                                                                                                        }
{****************************************************************************************************************************************}

unit uTestXML;

interface

uses Xml.xmldom, Xml.XMLDoc, Xml.XMLIntf
;

type

{ Forward Decls }

  IXMLInvoice = interface;
  IXMLInvoiceHeader = interface;
  IXMLAreaInfo = interface;
  IXMLAreaInfoList = interface;
  IXMLCodeInfo = interface;
  IXMLCodeInfoList = interface;
  IXMLCodeValue = interface;
  IXMLCodeValueList = interface;
  IXMLPropertyValue = interface;

{ IXMLInvoice }

  IXMLInvoice = interface(IXMLNode)
    ['{01B566EB-50B3-4758-B5D3-29653695BC63}']
    { Property Accessors }
    function Get_InvoiceHeader: IXMLInvoiceHeader;
    property InvoiceHeader: IXMLInvoiceHeader read Get_InvoiceHeader;
  end;

{ IXMLInvoiceHeader }

  IXMLInvoiceHeader = interface(IXMLNode)
    ['{A49BD082-0E29-40BC-B718-A7AA0E49B5C2}']
    { Property Accessors }
    function Get_InvoiceNumber: UnicodeString;
    procedure Set_InvoiceNumber(Value: UnicodeString);
    { Methods & Properties }
    property InvoiceNumber: UnicodeString read Get_InvoiceNumber write Set_InvoiceNumber;
  end;

{ IXMLAreaInfo }

  IXMLAreaInfo = interface(IXMLNode)
    ['{F15FF19F-B43B-47DB-A717-E28ECF738850}']
    { Property Accessors }
    function Get_AreaProperty: IXMLCodeInfoList;
    function Get_MapPoint: IXMLMapPointList;
    function Get_PropertyValue: IXMLPropertyValueList;
    function Get_EAttachment: IXMLEAttachment;
    function Get_AdditionalText: IXMLS255List;
    { Methods & Properties }
    property AreaProperty: IXMLCodeInfoList read Get_AreaProperty;
    property MapPoint: IXMLMapPointList read Get_MapPoint;
    property PropertyValue: IXMLPropertyValueList read Get_PropertyValue;
    property EAttachment: IXMLEAttachment read Get_EAttachment;
    property AdditionalText: IXMLS255List read Get_AdditionalText;
  end;
{ IXMLAreaInfoList }

  IXMLAreaInfoList = interface(IXMLNodeCollection)
    ['{2E3A4E2E-3F74-488E-996E-16B42120172E}']
    { Methods & Properties }
    function Add: IXMLAreaInfo;
    function Insert(const Index: Integer): IXMLAreaInfo;

    function Get_Item(Index: Integer): IXMLAreaInfo;
    property Items[Index: Integer]: IXMLAreaInfo read Get_Item; default;
  end;

{ IXMLCodeInfo }

  IXMLCodeInfo = interface(IXMLNode)
    ['{25132DC0-9EB9-4446-8420-60D9B8C1608F}']
    { Property Accessors }
    function Get_Code: UnicodeString;
    function Get_CodeValue: IXMLCodeValue;
    procedure Set_Code(Value: UnicodeString);
    { Methods & Properties }
    property Code: UnicodeString read Get_Code write Set_Code;
    property CodeValue: IXMLCodeValue read Get_CodeValue;
  end;

{ IXMLCodeInfoList }

  IXMLCodeInfoList = interface(IXMLNodeCollection)
    ['{8F5767D7-02C6-48B1-A3C7-8FB02CE175DB}']
    { Methods & Properties }
    function Add: IXMLCodeInfo;
    function Insert(const Index: Integer): IXMLCodeInfo;

    function Get_Item(Index: Integer): IXMLCodeInfo;
    property Items[Index: Integer]: IXMLCodeInfo read Get_Item; default;
  end;

{ IXMLPropertyValue }

  IXMLPropertyValue = interface(IXMLNode)
    ['{ADF33B1E-8283-4434-B249-FDA0ECCB49D0}']
    { Property Accessors }
    function Get_PropertyType: UnicodeString;
    function Get_MeasuringMethodType: UnicodeString;
    function Get_MeasuringAgency: UnicodeString;
    function Get_MeasuringMethod: UnicodeString;
    function Get_IsAverageValue: UnicodeString;
    function Get_ItemType: UnicodeString;
    function Get_PositionOnItem: IXMLPositionOnItem;
    function Get_BinaryValue: UnicodeString;
    function Get_BooleanValue: Boolean;
    function Get_DateTimeValue: UnicodeString;
    function Get_NumericValue: IXMLDetailMeasurement;
    function Get_TextValue: UnicodeString;
    function Get_PropertySubValue: IXMLPropertySubValueList;
    procedure Set_PropertyType(Value: UnicodeString);
    procedure Set_MeasuringMethodType(Value: UnicodeString);
    procedure Set_MeasuringAgency(Value: UnicodeString);
    procedure Set_MeasuringMethod(Value: UnicodeString);
    procedure Set_IsAverageValue(Value: UnicodeString);
    procedure Set_ItemType(Value: UnicodeString);
    procedure Set_BinaryValue(Value: UnicodeString);
    procedure Set_BooleanValue(Value: Boolean);
    procedure Set_DateTimeValue(Value: UnicodeString);
    procedure Set_TextValue(Value: UnicodeString);
    { Methods & Properties }
    property PropertyType: UnicodeString read Get_PropertyType write Set_PropertyType;
    property MeasuringMethodType: UnicodeString read Get_MeasuringMethodType write Set_MeasuringMethodType;
    property MeasuringAgency: UnicodeString read Get_MeasuringAgency write Set_MeasuringAgency;
    property MeasuringMethod: UnicodeString read Get_MeasuringMethod write Set_MeasuringMethod;
    property IsAverageValue: UnicodeString read Get_IsAverageValue write Set_IsAverageValue;
    property ItemType: UnicodeString read Get_ItemType write Set_ItemType;
    property PositionOnItem: IXMLPositionOnItem read Get_PositionOnItem;
    property BinaryValue: UnicodeString read Get_BinaryValue write Set_BinaryValue;
    property BooleanValue: Boolean read Get_BooleanValue write Set_BooleanValue;
    property DateTimeValue: UnicodeString read Get_DateTimeValue write Set_DateTimeValue;
    property NumericValue: IXMLDetailMeasurement read Get_NumericValue;
    property TextValue: UnicodeString read Get_TextValue write Set_TextValue;
    property PropertySubValue: IXMLPropertySubValueList read Get_PropertySubValue;
  end;

  TXMLInvoice = class;
  TXMLInvoiceHeader = class;
  TXMLAreaInfo = class;

{ TXMLInvoice }

  TXMLInvoice = class(TXMLNode, IXMLInvoice)
  private
    FInvoiceLineItem: IXMLInvoiceLineItemList;
    FMonetaryAdjustment: IXMLMonetaryAdjustmentList;
  protected
    { IXMLInvoice }
    function Get_InvoiceType: UnicodeString;
    function Get_InvoiceContextType: UnicodeString;
    function Get_Reissued: UnicodeString;
    function Get_Language: UnicodeString;
    function Get_InvoiceHeader: IXMLInvoiceHeader;
    function Get_InvoiceLineItem: IXMLInvoiceLineItemList;
    function Get_MonetaryAdjustment: IXMLMonetaryAdjustmentList;
    function Get_InvoiceSummary: IXMLInvoiceSummary;
    procedure Set_InvoiceType(Value: UnicodeString);
    procedure Set_InvoiceContextType(Value: UnicodeString);
    procedure Set_Reissued(Value: UnicodeString);
    procedure Set_Language(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInvoiceHeader }

  TXMLInvoiceHeader = class(TXMLNode, IXMLInvoiceHeader)
  private
    FOtherDate: IXMLOtherDateList;
    FInvoiceReference: IXMLInvoiceReferenceList;
    FDocumentReferenceInformation: IXMLDocumentReferenceInformationList;
    FRemitToParty: IXMLPartyList;
    FOtherParty: IXMLTypedPartyList;
    FReceiverParty: IXMLTypedPartyList;
    FLocationInfo: IXMLLocationInfoList;
    FLocationParty: IXMLLocationPartyList;
    FSafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
    FAdditionalText: IXMLS255List;
  protected
    { IXMLInvoiceHeader }
    function Get_InvoiceNumber: UnicodeString;
    function Get_InvoiceDate: IXMLInvoiceDate;
    function Get_OtherDate: IXMLOtherDateList;
    function Get_InvoiceReference: IXMLInvoiceReferenceList;
    function Get_DocumentReferenceInformation: IXMLDocumentReferenceInformationList;
    function Get_BillToParty: IXMLParty;
    function Get_SupplierParty: IXMLParty;
    function Get_BuyerParty: IXMLParty;
    function Get_RemitToParty: IXMLPartyList;
    function Get_ShipToCharacteristics: IXMLShipToCharacteristics;
    function Get_OtherParty: IXMLTypedPartyList;
    function Get_SenderParty: IXMLTypedParty;
    function Get_ReceiverParty: IXMLTypedPartyList;
    function Get_LocationInfo: IXMLLocationInfoList;
    function Get_LocationParty: IXMLLocationPartyList;
    function Get_CountryOfOrigin: IXMLCountryOfOrigin;
    function Get_CountryOfDestination: IXMLCountryOfDestination;
    function Get_CountryOfConsumption: IXMLCountryOfConsumption;
    function Get_CreditDebitNoteReason: IXMLCreditDebitNoteReason;
    function Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
    function Get_AdditionalText: IXMLS255List;
    procedure Set_InvoiceNumber(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLAreaInfo }

  TXMLAreaInfo = class(TXMLNode, IXMLAreaInfo)
  private
    FAreaProperty: IXMLCodeInfoList;
  protected
    { IXMLAreaInfo }
    function Get_AreaProperty: IXMLCodeInfoList;
  public
    procedure AfterConstruction; override;
  end;


{ Global Functions }

function GetInvoice(Doc: IXMLDocument): IXMLInvoice;
function LoadInvoice(const FileName: string): IXMLInvoice;
function NewInvoice: IXMLInvoice;

const
  TargetNamespace = '';

implementation

uses System.Variants, Xml.xmlutil;

{ Global Functions }

function GetInvoice(Doc: IXMLDocument): IXMLInvoice;
begin
  Result := Doc.GetDocBinding('Invoice', TXMLInvoice, TargetNamespace) as IXMLInvoice;
end;

function LoadInvoice(const FileName: string): IXMLInvoice;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Invoice', TXMLInvoice, TargetNamespace) as IXMLInvoice;
end;

function NewInvoice: IXMLInvoice;
begin
  Result := NewXMLDocument.GetDocBinding('Invoice', TXMLInvoice, TargetNamespace) as IXMLInvoice;
end;

{ TXMLInvoice }

procedure TXMLInvoice.AfterConstruction;
begin
  RegisterChildNode('InvoiceHeader', TXMLInvoiceHeader);
  RegisterChildNode('InvoiceLineItem', TXMLInvoiceLineItem);
  RegisterChildNode('MonetaryAdjustment', TXMLMonetaryAdjustment);
  RegisterChildNode('InvoiceSummary', TXMLInvoiceSummary);
  FInvoiceLineItem := CreateCollection(TXMLInvoiceLineItemList, IXMLInvoiceLineItem, 'InvoiceLineItem') as IXMLInvoiceLineItemList;
  FMonetaryAdjustment := CreateCollection(TXMLMonetaryAdjustmentList, IXMLMonetaryAdjustment, 'MonetaryAdjustment') as IXMLMonetaryAdjustmentList;
  inherited;
end;

function TXMLInvoice.Get_InvoiceType: UnicodeString;
begin
  Result := AttributeNodes['InvoiceType'].Text;
end;

procedure TXMLInvoice.Set_InvoiceType(Value: UnicodeString);
begin
  SetAttribute('InvoiceType', Value);
end;

function TXMLInvoice.Get_InvoiceContextType: UnicodeString;
begin
  Result := AttributeNodes['InvoiceContextType'].Text;
end;

procedure TXMLInvoice.Set_InvoiceContextType(Value: UnicodeString);
begin
  SetAttribute('InvoiceContextType', Value);
end;

function TXMLInvoice.Get_Reissued: UnicodeString;
begin
  Result := AttributeNodes['Reissued'].Text;
end;

procedure TXMLInvoice.Set_Reissued(Value: UnicodeString);
begin
  SetAttribute('Reissued', Value);
end;

function TXMLInvoice.Get_Language: UnicodeString;
begin
  Result := AttributeNodes['Language'].Text;
end;

procedure TXMLInvoice.Set_Language(Value: UnicodeString);
begin
  SetAttribute('Language', Value);
end;

function TXMLInvoice.Get_InvoiceHeader: IXMLInvoiceHeader;
begin
  Result := ChildNodes['InvoiceHeader'] as IXMLInvoiceHeader;
end;

function TXMLInvoice.Get_InvoiceLineItem: IXMLInvoiceLineItemList;
begin
  Result := FInvoiceLineItem;
end;

function TXMLInvoice.Get_MonetaryAdjustment: IXMLMonetaryAdjustmentList;
begin
  Result := FMonetaryAdjustment;
end;

function TXMLInvoice.Get_InvoiceSummary: IXMLInvoiceSummary;
begin
  Result := ChildNodes['InvoiceSummary'] as IXMLInvoiceSummary;
end;

{ TXMLInvoiceHeader }

procedure TXMLInvoiceHeader.AfterConstruction;
begin
  RegisterChildNode('InvoiceDate', TXMLInvoiceDate);
  RegisterChildNode('OtherDate', TXMLOtherDate);
  RegisterChildNode('InvoiceReference', TXMLInvoiceReference);
  RegisterChildNode('DocumentReferenceInformation', TXMLDocumentReferenceInformation);
  RegisterChildNode('BillToParty', TXMLParty);
  RegisterChildNode('SupplierParty', TXMLParty);
  RegisterChildNode('BuyerParty', TXMLParty);
  RegisterChildNode('RemitToParty', TXMLParty);
  RegisterChildNode('ShipToCharacteristics', TXMLShipToCharacteristics);
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('SenderParty', TXMLTypedParty);
  RegisterChildNode('ReceiverParty', TXMLTypedParty);
  RegisterChildNode('LocationInfo', TXMLLocationInfo);
  RegisterChildNode('LocationParty', TXMLLocationParty);
  RegisterChildNode('CountryOfOrigin', TXMLCountryOfOrigin);
  RegisterChildNode('CountryOfDestination', TXMLCountryOfDestination);
  RegisterChildNode('CountryOfConsumption', TXMLCountryOfConsumption);
  RegisterChildNode('CreditDebitNoteReason', TXMLCreditDebitNoteReason);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FOtherDate := CreateCollection(TXMLOtherDateList, IXMLOtherDate, 'OtherDate') as IXMLOtherDateList;
  FInvoiceReference := CreateCollection(TXMLInvoiceReferenceList, IXMLInvoiceReference, 'InvoiceReference') as IXMLInvoiceReferenceList;
  FDocumentReferenceInformation := CreateCollection(TXMLDocumentReferenceInformationList, IXMLDocumentReferenceInformation, 'DocumentReferenceInformation') as IXMLDocumentReferenceInformationList;
  FRemitToParty := CreateCollection(TXMLPartyList, IXMLParty, 'RemitToParty') as IXMLPartyList;
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FReceiverParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'ReceiverParty') as IXMLTypedPartyList;
  FLocationInfo := CreateCollection(TXMLLocationInfoList, IXMLLocationInfo, 'LocationInfo') as IXMLLocationInfoList;
  FLocationParty := CreateCollection(TXMLLocationPartyList, IXMLLocationParty, 'LocationParty') as IXMLLocationPartyList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLInvoiceHeader.Get_InvoiceNumber: UnicodeString;
begin
  Result := ChildNodes['InvoiceNumber'].Text;
end;

procedure TXMLInvoiceHeader.Set_InvoiceNumber(Value: UnicodeString);
begin
  ChildNodes['InvoiceNumber'].NodeValue := Value;
end;

function TXMLInvoiceHeader.Get_InvoiceDate: IXMLInvoiceDate;
begin
  Result := ChildNodes['InvoiceDate'] as IXMLInvoiceDate;
end;

function TXMLInvoiceHeader.Get_OtherDate: IXMLOtherDateList;
begin
  Result := FOtherDate;
end;

function TXMLInvoiceHeader.Get_InvoiceReference: IXMLInvoiceReferenceList;
begin
  Result := FInvoiceReference;
end;

function TXMLInvoiceHeader.Get_DocumentReferenceInformation: IXMLDocumentReferenceInformationList;
begin
  Result := FDocumentReferenceInformation;
end;

function TXMLInvoiceHeader.Get_BillToParty: IXMLParty;
begin
  Result := ChildNodes['BillToParty'] as IXMLParty;
end;

function TXMLInvoiceHeader.Get_SupplierParty: IXMLParty;
begin
  Result := ChildNodes['SupplierParty'] as IXMLParty;
end;

function TXMLInvoiceHeader.Get_BuyerParty: IXMLParty;
begin
  Result := ChildNodes['BuyerParty'] as IXMLParty;
end;

function TXMLInvoiceHeader.Get_RemitToParty: IXMLPartyList;
begin
  Result := FRemitToParty;
end;

function TXMLInvoiceHeader.Get_ShipToCharacteristics: IXMLShipToCharacteristics;
begin
  Result := ChildNodes['ShipToCharacteristics'] as IXMLShipToCharacteristics;
end;

function TXMLInvoiceHeader.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLInvoiceHeader.Get_SenderParty: IXMLTypedParty;
begin
  Result := ChildNodes['SenderParty'] as IXMLTypedParty;
end;

function TXMLInvoiceHeader.Get_ReceiverParty: IXMLTypedPartyList;
begin
  Result := FReceiverParty;
end;

function TXMLInvoiceHeader.Get_LocationInfo: IXMLLocationInfoList;
begin
  Result := FLocationInfo;
end;

function TXMLInvoiceHeader.Get_LocationParty: IXMLLocationPartyList;
begin
  Result := FLocationParty;
end;

function TXMLInvoiceHeader.Get_CountryOfOrigin: IXMLCountryOfOrigin;
begin
  Result := ChildNodes['CountryOfOrigin'] as IXMLCountryOfOrigin;
end;

function TXMLInvoiceHeader.Get_CountryOfDestination: IXMLCountryOfDestination;
begin
  Result := ChildNodes['CountryOfDestination'] as IXMLCountryOfDestination;
end;

function TXMLInvoiceHeader.Get_CountryOfConsumption: IXMLCountryOfConsumption;
begin
  Result := ChildNodes['CountryOfConsumption'] as IXMLCountryOfConsumption;
end;

function TXMLInvoiceHeader.Get_CreditDebitNoteReason: IXMLCreditDebitNoteReason;
begin
  Result := ChildNodes['CreditDebitNoteReason'] as IXMLCreditDebitNoteReason;
end;

function TXMLInvoiceHeader.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

function TXMLInvoiceHeader.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLInvoiceDate }

procedure TXMLInvoiceDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLInvoiceDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLInvoiceDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLInvoiceDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLDateBasis }

function TXMLDateBasis.Get_Year: UnicodeString;
begin
  Result := ChildNodes['Year'].Text;
end;

procedure TXMLDateBasis.Set_Year(Value: UnicodeString);
begin
  ChildNodes['Year'].NodeValue := Value;
end;

function TXMLDateBasis.Get_Month: LongWord;
begin
  Result := ChildNodes['Month'].NodeValue;
end;

procedure TXMLDateBasis.Set_Month(Value: LongWord);
begin
  ChildNodes['Month'].NodeValue := Value;
end;

function TXMLDateBasis.Get_Day: LongWord;
begin
  Result := ChildNodes['Day'].NodeValue;
end;

procedure TXMLDateBasis.Set_Day(Value: LongWord);
begin
  ChildNodes['Day'].NodeValue := Value;
end;

{ TXMLOtherDate }

procedure TXMLOtherDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  RegisterChildNode('DateTimeRange', TXMLDateTimeRange);
  inherited;
end;

function TXMLOtherDate.Get_DateType: UnicodeString;
begin
  Result := AttributeNodes['DateType'].Text;
end;

procedure TXMLOtherDate.Set_DateType(Value: UnicodeString);
begin
  SetAttribute('DateType', Value);
end;

function TXMLOtherDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLOtherDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLOtherDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

function TXMLOtherDate.Get_Year: UnicodeString;
begin
  Result := ChildNodes['Year'].Text;
end;

procedure TXMLOtherDate.Set_Year(Value: UnicodeString);
begin
  ChildNodes['Year'].NodeValue := Value;
end;

function TXMLOtherDate.Get_YearMonth: UnicodeString;
begin
  Result := ChildNodes['YearMonth'].Text;
end;

procedure TXMLOtherDate.Set_YearMonth(Value: UnicodeString);
begin
  ChildNodes['YearMonth'].NodeValue := Value;
end;

function TXMLOtherDate.Get_Week: UnicodeString;
begin
  Result := ChildNodes['Week'].Text;
end;

procedure TXMLOtherDate.Set_Week(Value: UnicodeString);
begin
  ChildNodes['Week'].NodeValue := Value;
end;

function TXMLOtherDate.Get_DateTimeRange: IXMLDateTimeRange;
begin
  Result := ChildNodes['DateTimeRange'] as IXMLDateTimeRange;
end;

{ TXMLOtherDateList }

function TXMLOtherDateList.Add: IXMLOtherDate;
begin
  Result := AddItem(-1) as IXMLOtherDate;
end;

function TXMLOtherDateList.Insert(const Index: Integer): IXMLOtherDate;
begin
  Result := AddItem(Index) as IXMLOtherDate;
end;

function TXMLOtherDateList.Get_Item(Index: Integer): IXMLOtherDate;
begin
  Result := List[Index] as IXMLOtherDate;
end;

{ TXMLDateTimeRange }

procedure TXMLDateTimeRange.AfterConstruction;
begin
  RegisterChildNode('DateTimeFrom', TXMLDateTimeFrom);
  RegisterChildNode('DateTimeTo', TXMLDateTimeTo);
  inherited;
end;

function TXMLDateTimeRange.Get_DateTimeFrom: IXMLDateTimeFrom;
begin
  Result := ChildNodes['DateTimeFrom'] as IXMLDateTimeFrom;
end;

function TXMLDateTimeRange.Get_DateTimeTo: IXMLDateTimeTo;
begin
  Result := ChildNodes['DateTimeTo'] as IXMLDateTimeTo;
end;

{ TXMLDateTimeRangeList }

function TXMLDateTimeRangeList.Add: IXMLDateTimeRange;
begin
  Result := AddItem(-1) as IXMLDateTimeRange;
end;

function TXMLDateTimeRangeList.Insert(const Index: Integer): IXMLDateTimeRange;
begin
  Result := AddItem(Index) as IXMLDateTimeRange;
end;

function TXMLDateTimeRangeList.Get_Item(Index: Integer): IXMLDateTimeRange;
begin
  Result := List[Index] as IXMLDateTimeRange;
end;

{ TXMLDateTimeFrom }

procedure TXMLDateTimeFrom.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDateTimeFrom.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDateTimeFrom.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDateTimeFrom.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLDateTimeTo }

procedure TXMLDateTimeTo.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDateTimeTo.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDateTimeTo.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDateTimeTo.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLInvoiceReference }

function TXMLInvoiceReference.Get_InvoiceReferenceType: UnicodeString;
begin
  Result := AttributeNodes['InvoiceReferenceType'].Text;
end;

procedure TXMLInvoiceReference.Set_InvoiceReferenceType(Value: UnicodeString);
begin
  SetAttribute('InvoiceReferenceType', Value);
end;

function TXMLInvoiceReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLInvoiceReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLInvoiceReferenceList }

function TXMLInvoiceReferenceList.Add: IXMLInvoiceReference;
begin
  Result := AddItem(-1) as IXMLInvoiceReference;
end;

function TXMLInvoiceReferenceList.Insert(const Index: Integer): IXMLInvoiceReference;
begin
  Result := AddItem(Index) as IXMLInvoiceReference;
end;

function TXMLInvoiceReferenceList.Get_Item(Index: Integer): IXMLInvoiceReference;
begin
  Result := List[Index] as IXMLInvoiceReference;
end;

{ TXMLDocumentReferenceInformation }

procedure TXMLDocumentReferenceInformation.AfterConstruction;
begin
  RegisterChildNode('DocumentReferenceID', TXMLDocumentReferenceID);
  RegisterChildNode('Date', TXMLDateBasis);
  RegisterChildNode('DocumentReference', TXMLDocumentReference);
  FDocumentReference := CreateCollection(TXMLDocumentReferenceList, IXMLDocumentReference, 'DocumentReference') as IXMLDocumentReferenceList;
  inherited;
end;

function TXMLDocumentReferenceInformation.Get_DocumentReferenceID: IXMLDocumentReferenceID;
begin
  Result := ChildNodes['DocumentReferenceID'] as IXMLDocumentReferenceID;
end;

function TXMLDocumentReferenceInformation.Get_DocumentReferenceIDLineItemNumber: LongWord;
begin
  Result := ChildNodes['DocumentReferenceIDLineItemNumber'].NodeValue;
end;

procedure TXMLDocumentReferenceInformation.Set_DocumentReferenceIDLineItemNumber(Value: LongWord);
begin
  ChildNodes['DocumentReferenceIDLineItemNumber'].NodeValue := Value;
end;

function TXMLDocumentReferenceInformation.Get_TransactionHistoryNumber: LongWord;
begin
  Result := ChildNodes['TransactionHistoryNumber'].NodeValue;
end;

procedure TXMLDocumentReferenceInformation.Set_TransactionHistoryNumber(Value: LongWord);
begin
  ChildNodes['TransactionHistoryNumber'].NodeValue := Value;
end;

function TXMLDocumentReferenceInformation.Get_DocumentVersionNumber: UnicodeString;
begin
  Result := ChildNodes['DocumentVersionNumber'].Text;
end;

procedure TXMLDocumentReferenceInformation.Set_DocumentVersionNumber(Value: UnicodeString);
begin
  ChildNodes['DocumentVersionNumber'].NodeValue := Value;
end;

function TXMLDocumentReferenceInformation.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDocumentReferenceInformation.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDocumentReferenceInformation.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

function TXMLDocumentReferenceInformation.Get_NumberOfDocumentsRequired: LongWord;
begin
  Result := ChildNodes['NumberOfDocumentsRequired'].NodeValue;
end;

procedure TXMLDocumentReferenceInformation.Set_NumberOfDocumentsRequired(Value: LongWord);
begin
  ChildNodes['NumberOfDocumentsRequired'].NodeValue := Value;
end;

function TXMLDocumentReferenceInformation.Get_DocumentReference: IXMLDocumentReferenceList;
begin
  Result := FDocumentReference;
end;

{ TXMLDocumentReferenceInformationList }

function TXMLDocumentReferenceInformationList.Add: IXMLDocumentReferenceInformation;
begin
  Result := AddItem(-1) as IXMLDocumentReferenceInformation;
end;

function TXMLDocumentReferenceInformationList.Insert(const Index: Integer): IXMLDocumentReferenceInformation;
begin
  Result := AddItem(Index) as IXMLDocumentReferenceInformation;
end;

function TXMLDocumentReferenceInformationList.Get_Item(Index: Integer): IXMLDocumentReferenceInformation;
begin
  Result := List[Index] as IXMLDocumentReferenceInformation;
end;

{ TXMLDocumentReferenceID }

function TXMLDocumentReferenceID.Get_DocumentReferenceIDType: UnicodeString;
begin
  Result := AttributeNodes['DocumentReferenceIDType'].Text;
end;

procedure TXMLDocumentReferenceID.Set_DocumentReferenceIDType(Value: UnicodeString);
begin
  SetAttribute('DocumentReferenceIDType', Value);
end;

function TXMLDocumentReferenceID.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLDocumentReferenceID.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLDocumentReference }

function TXMLDocumentReference.Get_DocumentReferenceType: UnicodeString;
begin
  Result := AttributeNodes['DocumentReferenceType'].Text;
end;

procedure TXMLDocumentReference.Set_DocumentReferenceType(Value: UnicodeString);
begin
  SetAttribute('DocumentReferenceType', Value);
end;

function TXMLDocumentReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLDocumentReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLDocumentReferenceList }

function TXMLDocumentReferenceList.Add: IXMLDocumentReference;
begin
  Result := AddItem(-1) as IXMLDocumentReference;
end;

function TXMLDocumentReferenceList.Insert(const Index: Integer): IXMLDocumentReference;
begin
  Result := AddItem(Index) as IXMLDocumentReference;
end;

function TXMLDocumentReferenceList.Get_Item(Index: Integer): IXMLDocumentReference;
begin
  Result := List[Index] as IXMLDocumentReference;
end;

{ TXMLParty }

procedure TXMLParty.AfterConstruction;
begin
  RegisterChildNode('PartyIdentifier', TXMLPartyIdentifier);
  RegisterChildNode('NameAddress', TXMLNameAddress);
  RegisterChildNode('URL', TXMLURL);
  RegisterChildNode('CommonContact', TXMLCommonContact);
  FPartyIdentifier := CreateCollection(TXMLPartyIdentifierList, IXMLPartyIdentifier, 'PartyIdentifier') as IXMLPartyIdentifierList;
  FCommonContact := CreateCollection(TXMLCommonContactList, IXMLCommonContact, 'CommonContact') as IXMLCommonContactList;
  inherited;
end;

function TXMLParty.Get_LogisticsRole: UnicodeString;
begin
  Result := AttributeNodes['LogisticsRole'].Text;
end;

procedure TXMLParty.Set_LogisticsRole(Value: UnicodeString);
begin
  SetAttribute('LogisticsRole', Value);
end;

function TXMLParty.Get_PartyIdentifier: IXMLPartyIdentifierList;
begin
  Result := FPartyIdentifier;
end;

function TXMLParty.Get_NameAddress: IXMLNameAddress;
begin
  Result := ChildNodes['NameAddress'] as IXMLNameAddress;
end;

function TXMLParty.Get_URL: IXMLURL;
begin
  Result := ChildNodes['URL'] as IXMLURL;
end;

function TXMLParty.Get_CommonContact: IXMLCommonContactList;
begin
  Result := FCommonContact;
end;

{ TXMLPartyList }

function TXMLPartyList.Add: IXMLParty;
begin
  Result := AddItem(-1) as IXMLParty;
end;

function TXMLPartyList.Insert(const Index: Integer): IXMLParty;
begin
  Result := AddItem(Index) as IXMLParty;
end;

function TXMLPartyList.Get_Item(Index: Integer): IXMLParty;
begin
  Result := List[Index] as IXMLParty;
end;

{ TXMLPartyIdentifier }

function TXMLPartyIdentifier.Get_PartyIdentifierType: UnicodeString;
begin
  Result := AttributeNodes['PartyIdentifierType'].Text;
end;

procedure TXMLPartyIdentifier.Set_PartyIdentifierType(Value: UnicodeString);
begin
  SetAttribute('PartyIdentifierType', Value);
end;

function TXMLPartyIdentifier.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLPartyIdentifier.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLPartyIdentifierList }

function TXMLPartyIdentifierList.Add: IXMLPartyIdentifier;
begin
  Result := AddItem(-1) as IXMLPartyIdentifier;
end;

function TXMLPartyIdentifierList.Insert(const Index: Integer): IXMLPartyIdentifier;
begin
  Result := AddItem(Index) as IXMLPartyIdentifier;
end;

function TXMLPartyIdentifierList.Get_Item(Index: Integer): IXMLPartyIdentifier;
begin
  Result := List[Index] as IXMLPartyIdentifier;
end;

{ TXMLNameAddress }

procedure TXMLNameAddress.AfterConstruction;
begin
  RegisterChildNode('OrganisationUnit', TXMLOrganisationUnit);
  RegisterChildNode('PostalCode', TXMLPostalCode);
  RegisterChildNode('Country', TXMLCountry);
  RegisterChildNode('GPSCoordinates', TXMLGPSCoordinates);
  RegisterChildNode('MapCoordinates', TXMLMapCoordinates);
  FMapCoordinates := CreateCollection(TXMLMapCoordinatesList, IXMLMapCoordinates, 'MapCoordinates') as IXMLMapCoordinatesList;
  inherited;
end;

function TXMLNameAddress.Get_CommunicationRole: UnicodeString;
begin
  Result := AttributeNodes['CommunicationRole'].Text;
end;

procedure TXMLNameAddress.Set_CommunicationRole(Value: UnicodeString);
begin
  SetAttribute('CommunicationRole', Value);
end;

function TXMLNameAddress.Get_AddressRoleType: UnicodeString;
begin
  Result := AttributeNodes['AddressRoleType'].Text;
end;

procedure TXMLNameAddress.Set_AddressRoleType(Value: UnicodeString);
begin
  SetAttribute('AddressRoleType', Value);
end;

function TXMLNameAddress.Get_Name1: UnicodeString;
begin
  Result := ChildNodes['Name1'].Text;
end;

procedure TXMLNameAddress.Set_Name1(Value: UnicodeString);
begin
  ChildNodes['Name1'].NodeValue := Value;
end;

function TXMLNameAddress.Get_Name2: UnicodeString;
begin
  Result := ChildNodes['Name2'].Text;
end;

procedure TXMLNameAddress.Set_Name2(Value: UnicodeString);
begin
  ChildNodes['Name2'].NodeValue := Value;
end;

function TXMLNameAddress.Get_Name3: UnicodeString;
begin
  Result := ChildNodes['Name3'].Text;
end;

procedure TXMLNameAddress.Set_Name3(Value: UnicodeString);
begin
  ChildNodes['Name3'].NodeValue := Value;
end;

function TXMLNameAddress.Get_OrganisationUnit: IXMLOrganisationUnit;
begin
  Result := ChildNodes['OrganisationUnit'] as IXMLOrganisationUnit;
end;

function TXMLNameAddress.Get_Address1: UnicodeString;
begin
  Result := ChildNodes['Address1'].Text;
end;

procedure TXMLNameAddress.Set_Address1(Value: UnicodeString);
begin
  ChildNodes['Address1'].NodeValue := Value;
end;

function TXMLNameAddress.Get_Address2: UnicodeString;
begin
  Result := ChildNodes['Address2'].Text;
end;

procedure TXMLNameAddress.Set_Address2(Value: UnicodeString);
begin
  ChildNodes['Address2'].NodeValue := Value;
end;

function TXMLNameAddress.Get_Address3: UnicodeString;
begin
  Result := ChildNodes['Address3'].Text;
end;

procedure TXMLNameAddress.Set_Address3(Value: UnicodeString);
begin
  ChildNodes['Address3'].NodeValue := Value;
end;

function TXMLNameAddress.Get_Address4: UnicodeString;
begin
  Result := ChildNodes['Address4'].Text;
end;

procedure TXMLNameAddress.Set_Address4(Value: UnicodeString);
begin
  ChildNodes['Address4'].NodeValue := Value;
end;

function TXMLNameAddress.Get_City: UnicodeString;
begin
  Result := ChildNodes['City'].Text;
end;

procedure TXMLNameAddress.Set_City(Value: UnicodeString);
begin
  ChildNodes['City'].NodeValue := Value;
end;

function TXMLNameAddress.Get_County: UnicodeString;
begin
  Result := ChildNodes['County'].Text;
end;

procedure TXMLNameAddress.Set_County(Value: UnicodeString);
begin
  ChildNodes['County'].NodeValue := Value;
end;

function TXMLNameAddress.Get_StateOrProvince: UnicodeString;
begin
  Result := ChildNodes['StateOrProvince'].Text;
end;

procedure TXMLNameAddress.Set_StateOrProvince(Value: UnicodeString);
begin
  ChildNodes['StateOrProvince'].NodeValue := Value;
end;

function TXMLNameAddress.Get_PostalCode: IXMLPostalCode;
begin
  Result := ChildNodes['PostalCode'] as IXMLPostalCode;
end;

function TXMLNameAddress.Get_Country: IXMLCountry;
begin
  Result := ChildNodes['Country'] as IXMLCountry;
end;

function TXMLNameAddress.Get_GPSCoordinates: IXMLGPSCoordinates;
begin
  Result := ChildNodes['GPSCoordinates'] as IXMLGPSCoordinates;
end;

function TXMLNameAddress.Get_MapCoordinates: IXMLMapCoordinatesList;
begin
  Result := FMapCoordinates;
end;

{ TXMLOrganisationUnit }

function TXMLOrganisationUnit.Get_OrganisationUnitType: UnicodeString;
begin
  Result := AttributeNodes['OrganisationUnitType'].Text;
end;

procedure TXMLOrganisationUnit.Set_OrganisationUnitType(Value: UnicodeString);
begin
  SetAttribute('OrganisationUnitType', Value);
end;

function TXMLOrganisationUnit.Get_OrganisationUnitName: UnicodeString;
begin
  Result := ChildNodes['OrganisationUnitName'].Text;
end;

procedure TXMLOrganisationUnit.Set_OrganisationUnitName(Value: UnicodeString);
begin
  ChildNodes['OrganisationUnitName'].NodeValue := Value;
end;

function TXMLOrganisationUnit.Get_OrganisationUnitCode: UnicodeString;
begin
  Result := ChildNodes['OrganisationUnitCode'].Text;
end;

procedure TXMLOrganisationUnit.Set_OrganisationUnitCode(Value: UnicodeString);
begin
  ChildNodes['OrganisationUnitCode'].NodeValue := Value;
end;

{ TXMLPostalCode }

{ TXMLCountry }

function TXMLCountry.Get_ISOCountryCode: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCode'].Text;
end;

procedure TXMLCountry.Set_ISOCountryCode(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCode', Value);
end;

function TXMLCountry.Get_ISOCountryCodeAlpha3: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCodeAlpha3'].Text;
end;

procedure TXMLCountry.Set_ISOCountryCodeAlpha3(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCodeAlpha3', Value);
end;

function TXMLCountry.Get_ISOCountryCodeNumeric: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCodeNumeric'].Text;
end;

procedure TXMLCountry.Set_ISOCountryCodeNumeric(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCodeNumeric', Value);
end;

{ TXMLGPSCoordinates }

procedure TXMLGPSCoordinates.AfterConstruction;
begin
  RegisterChildNode('Height', TXMLMeasurement);
  inherited;
end;

function TXMLGPSCoordinates.Get_GPSSystem: UnicodeString;
begin
  Result := AttributeNodes['GPSSystem'].Text;
end;

procedure TXMLGPSCoordinates.Set_GPSSystem(Value: UnicodeString);
begin
  SetAttribute('GPSSystem', Value);
end;

function TXMLGPSCoordinates.Get_Latitude: Double;
begin
  Result := XmlStrToFloatExt(ChildNodes['Latitude'].Text);
end;

procedure TXMLGPSCoordinates.Set_Latitude(Value: Double);
begin
  ChildNodes['Latitude'].NodeValue := Value;
end;

function TXMLGPSCoordinates.Get_Longitude: Double;
begin
  Result := XmlStrToFloatExt(ChildNodes['Longitude'].Text);
end;

procedure TXMLGPSCoordinates.Set_Longitude(Value: Double);
begin
  ChildNodes['Longitude'].NodeValue := Value;
end;

function TXMLGPSCoordinates.Get_Height: IXMLMeasurement;
begin
  Result := ChildNodes['Height'] as IXMLMeasurement;
end;

{ TXMLMeasurement }

procedure TXMLMeasurement.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  RegisterChildNode('RangeMin', TXMLRangeMin);
  RegisterChildNode('RangeMax', TXMLRangeMax);
  inherited;
end;

function TXMLMeasurement.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

function TXMLMeasurement.Get_RangeMin: IXMLRangeMin;
begin
  Result := ChildNodes['RangeMin'] as IXMLRangeMin;
end;

function TXMLMeasurement.Get_RangeMax: IXMLRangeMax;
begin
  Result := ChildNodes['RangeMax'] as IXMLRangeMax;
end;

{ TXMLMeasurementList }

function TXMLMeasurementList.Add: IXMLMeasurement;
begin
  Result := AddItem(-1) as IXMLMeasurement;
end;

function TXMLMeasurementList.Insert(const Index: Integer): IXMLMeasurement;
begin
  Result := AddItem(Index) as IXMLMeasurement;
end;

function TXMLMeasurementList.Get_Item(Index: Integer): IXMLMeasurement;
begin
  Result := List[Index] as IXMLMeasurement;
end;

{ TXMLValue }

function TXMLValue.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLValue.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLRangeMin }

function TXMLRangeMin.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLRangeMin.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLRangeMax }

function TXMLRangeMax.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLRangeMax.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLMapCoordinates }

procedure TXMLMapCoordinates.AfterConstruction;
begin
  RegisterChildNode('Coordinates', TXMLCoordinates);
  RegisterChildNode('Altitude', TXMLMeasurement);
  FCoordinates := CreateCollection(TXMLCoordinatesList, IXMLCoordinates, 'Coordinates') as IXMLCoordinatesList;
  FAltitude := CreateCollection(TXMLMeasurementList, IXMLMeasurement, 'Altitude') as IXMLMeasurementList;
  inherited;
end;

function TXMLMapCoordinates.Get_MapReferenceSystem: UnicodeString;
begin
  Result := AttributeNodes['MapReferenceSystem'].Text;
end;

procedure TXMLMapCoordinates.Set_MapReferenceSystem(Value: UnicodeString);
begin
  SetAttribute('MapReferenceSystem', Value);
end;

function TXMLMapCoordinates.Get_MapCoordinateType: UnicodeString;
begin
  Result := AttributeNodes['MapCoordinateType'].Text;
end;

procedure TXMLMapCoordinates.Set_MapCoordinateType(Value: UnicodeString);
begin
  SetAttribute('MapCoordinateType', Value);
end;

function TXMLMapCoordinates.Get_MapAreaBorderType: UnicodeString;
begin
  Result := AttributeNodes['MapAreaBorderType'].Text;
end;

procedure TXMLMapCoordinates.Set_MapAreaBorderType(Value: UnicodeString);
begin
  SetAttribute('MapAreaBorderType', Value);
end;

function TXMLMapCoordinates.Get_Coordinates: IXMLCoordinatesList;
begin
  Result := FCoordinates;
end;

function TXMLMapCoordinates.Get_Altitude: IXMLMeasurementList;
begin
  Result := FAltitude;
end;

{ TXMLMapCoordinatesList }

function TXMLMapCoordinatesList.Add: IXMLMapCoordinates;
begin
  Result := AddItem(-1) as IXMLMapCoordinates;
end;

function TXMLMapCoordinatesList.Insert(const Index: Integer): IXMLMapCoordinates;
begin
  Result := AddItem(Index) as IXMLMapCoordinates;
end;

function TXMLMapCoordinatesList.Get_Item(Index: Integer): IXMLMapCoordinates;
begin
  Result := List[Index] as IXMLMapCoordinates;
end;

{ TXMLCoordinates }

function TXMLCoordinates.Get_CoordinateFormatType: UnicodeString;
begin
  Result := AttributeNodes['CoordinateFormatType'].Text;
end;

procedure TXMLCoordinates.Set_CoordinateFormatType(Value: UnicodeString);
begin
  SetAttribute('CoordinateFormatType', Value);
end;

function TXMLCoordinates.Get_CoordinateDisplayOrder: LongWord;
begin
  Result := AttributeNodes['CoordinateDisplayOrder'].NodeValue;
end;

procedure TXMLCoordinates.Set_CoordinateDisplayOrder(Value: LongWord);
begin
  SetAttribute('CoordinateDisplayOrder', Value);
end;

{ TXMLCoordinatesList }

function TXMLCoordinatesList.Add: IXMLCoordinates;
begin
  Result := AddItem(-1) as IXMLCoordinates;
end;

function TXMLCoordinatesList.Insert(const Index: Integer): IXMLCoordinates;
begin
  Result := AddItem(Index) as IXMLCoordinates;
end;

function TXMLCoordinatesList.Get_Item(Index: Integer): IXMLCoordinates;
begin
  Result := List[Index] as IXMLCoordinates;
end;

{ TXMLURL }

function TXMLURL.Get_URLContext: UnicodeString;
begin
  Result := AttributeNodes['URLContext'].Text;
end;

procedure TXMLURL.Set_URLContext(Value: UnicodeString);
begin
  SetAttribute('URLContext', Value);
end;

{ TXMLURLList }

function TXMLURLList.Add: IXMLURL;
begin
  Result := AddItem(-1) as IXMLURL;
end;

function TXMLURLList.Insert(const Index: Integer): IXMLURL;
begin
  Result := AddItem(Index) as IXMLURL;
end;

function TXMLURLList.Get_Item(Index: Integer): IXMLURL;
begin
  Result := List[Index] as IXMLURL;
end;

{ TXMLCommonContact }

procedure TXMLCommonContact.AfterConstruction;
begin
  RegisterChildNode('ContactIdentifier', TXMLContactIdentifier);
  RegisterChildNode('ContactAvailability', TXMLContactAvailability);
  RegisterChildNode('GPSCoordinates', TXMLGPSCoordinates);
  RegisterChildNode('MapCoordinates', TXMLMapCoordinates);
  FContactAvailability := CreateCollection(TXMLContactAvailabilityList, IXMLContactAvailability, 'ContactAvailability') as IXMLContactAvailabilityList;
  FMapCoordinates := CreateCollection(TXMLMapCoordinatesList, IXMLMapCoordinates, 'MapCoordinates') as IXMLMapCoordinatesList;
  inherited;
end;

function TXMLCommonContact.Get_ContactType: UnicodeString;
begin
  Result := AttributeNodes['ContactType'].Text;
end;

procedure TXMLCommonContact.Set_ContactType(Value: UnicodeString);
begin
  SetAttribute('ContactType', Value);
end;

function TXMLCommonContact.Get_ContactName: UnicodeString;
begin
  Result := ChildNodes['ContactName'].Text;
end;

procedure TXMLCommonContact.Set_ContactName(Value: UnicodeString);
begin
  ChildNodes['ContactName'].NodeValue := Value;
end;

function TXMLCommonContact.Get_ContactIdentifier: IXMLContactIdentifier;
begin
  Result := ChildNodes['ContactIdentifier'] as IXMLContactIdentifier;
end;

function TXMLCommonContact.Get_Telephone: UnicodeString;
begin
  Result := ChildNodes['Telephone'].Text;
end;

procedure TXMLCommonContact.Set_Telephone(Value: UnicodeString);
begin
  ChildNodes['Telephone'].NodeValue := Value;
end;

function TXMLCommonContact.Get_MobilePhone: UnicodeString;
begin
  Result := ChildNodes['MobilePhone'].Text;
end;

procedure TXMLCommonContact.Set_MobilePhone(Value: UnicodeString);
begin
  ChildNodes['MobilePhone'].NodeValue := Value;
end;

function TXMLCommonContact.Get_Email: UnicodeString;
begin
  Result := ChildNodes['Email'].Text;
end;

procedure TXMLCommonContact.Set_Email(Value: UnicodeString);
begin
  ChildNodes['Email'].NodeValue := Value;
end;

function TXMLCommonContact.Get_Fax: UnicodeString;
begin
  Result := ChildNodes['Fax'].Text;
end;

procedure TXMLCommonContact.Set_Fax(Value: UnicodeString);
begin
  ChildNodes['Fax'].NodeValue := Value;
end;

function TXMLCommonContact.Get_ContactAvailability: IXMLContactAvailabilityList;
begin
  Result := FContactAvailability;
end;

function TXMLCommonContact.Get_GPSCoordinates: IXMLGPSCoordinates;
begin
  Result := ChildNodes['GPSCoordinates'] as IXMLGPSCoordinates;
end;

function TXMLCommonContact.Get_MapCoordinates: IXMLMapCoordinatesList;
begin
  Result := FMapCoordinates;
end;

{ TXMLCommonContactList }

function TXMLCommonContactList.Add: IXMLCommonContact;
begin
  Result := AddItem(-1) as IXMLCommonContact;
end;

function TXMLCommonContactList.Insert(const Index: Integer): IXMLCommonContact;
begin
  Result := AddItem(Index) as IXMLCommonContact;
end;

function TXMLCommonContactList.Get_Item(Index: Integer): IXMLCommonContact;
begin
  Result := List[Index] as IXMLCommonContact;
end;

{ TXMLContactIdentifier }

function TXMLContactIdentifier.Get_ContactIdentifierType: UnicodeString;
begin
  Result := AttributeNodes['ContactIdentifierType'].Text;
end;

procedure TXMLContactIdentifier.Set_ContactIdentifierType(Value: UnicodeString);
begin
  SetAttribute('ContactIdentifierType', Value);
end;

{ TXMLContactAvailability }

procedure TXMLContactAvailability.AfterConstruction;
begin
  RegisterChildNode('TimeSlot', TXMLTimeSlot);
  RegisterChildNode('DateTimeRange', TXMLDateTimeRange);
  FTimeSlot := CreateCollection(TXMLTimeSlotList, IXMLTimeSlot, 'TimeSlot') as IXMLTimeSlotList;
  FDateTimeRange := CreateCollection(TXMLDateTimeRangeList, IXMLDateTimeRange, 'DateTimeRange') as IXMLDateTimeRangeList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLContactAvailability.Get_CalendarPeriod: UnicodeString;
begin
  Result := AttributeNodes['CalendarPeriod'].Text;
end;

procedure TXMLContactAvailability.Set_CalendarPeriod(Value: UnicodeString);
begin
  SetAttribute('CalendarPeriod', Value);
end;

function TXMLContactAvailability.Get_IsTimeSlotAvailable: UnicodeString;
begin
  Result := AttributeNodes['IsTimeSlotAvailable'].Text;
end;

procedure TXMLContactAvailability.Set_IsTimeSlotAvailable(Value: UnicodeString);
begin
  SetAttribute('IsTimeSlotAvailable', Value);
end;

function TXMLContactAvailability.Get_TimeSlot: IXMLTimeSlotList;
begin
  Result := FTimeSlot;
end;

function TXMLContactAvailability.Get_DateTimeRange: IXMLDateTimeRangeList;
begin
  Result := FDateTimeRange;
end;

function TXMLContactAvailability.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLContactAvailabilityList }

function TXMLContactAvailabilityList.Add: IXMLContactAvailability;
begin
  Result := AddItem(-1) as IXMLContactAvailability;
end;

function TXMLContactAvailabilityList.Insert(const Index: Integer): IXMLContactAvailability;
begin
  Result := AddItem(Index) as IXMLContactAvailability;
end;

function TXMLContactAvailabilityList.Get_Item(Index: Integer): IXMLContactAvailability;
begin
  Result := List[Index] as IXMLContactAvailability;
end;

{ TXMLTimeSlot }

function TXMLTimeSlot.Get_From: UnicodeString;
begin
  Result := ChildNodes['From'].Text;
end;

procedure TXMLTimeSlot.Set_From(Value: UnicodeString);
begin
  ChildNodes['From'].NodeValue := Value;
end;

function TXMLTimeSlot.Get_To_: UnicodeString;
begin
  Result := ChildNodes['To'].Text;
end;

procedure TXMLTimeSlot.Set_To_(Value: UnicodeString);
begin
  ChildNodes['To'].NodeValue := Value;
end;

{ TXMLTimeSlotList }

function TXMLTimeSlotList.Add: IXMLTimeSlot;
begin
  Result := AddItem(-1) as IXMLTimeSlot;
end;

function TXMLTimeSlotList.Insert(const Index: Integer): IXMLTimeSlot;
begin
  Result := AddItem(Index) as IXMLTimeSlot;
end;

function TXMLTimeSlotList.Get_Item(Index: Integer): IXMLTimeSlot;
begin
  Result := List[Index] as IXMLTimeSlot;
end;

{ TXMLShipToCharacteristics }

procedure TXMLShipToCharacteristics.AfterConstruction;
begin
  RegisterChildNode('ShipToParty', TXMLTypedParty);
  RegisterChildNode('SupplyPoint', TXMLSupplyPoint);
  RegisterChildNode('LocationCode', TXMLLocationCode);
  RegisterChildNode('TermsOfDelivery', TXMLTermsOfDelivery);
  RegisterChildNode('DeliveryRouteCode', TXMLDeliveryRouteCode);
  FSupplyPoint := CreateCollection(TXMLSupplyPointList, IXMLSupplyPoint, 'SupplyPoint') as IXMLSupplyPointList;
  inherited;
end;

function TXMLShipToCharacteristics.Get_ShipToParty: IXMLTypedParty;
begin
  Result := ChildNodes['ShipToParty'] as IXMLTypedParty;
end;

function TXMLShipToCharacteristics.Get_SupplyPoint: IXMLSupplyPointList;
begin
  Result := FSupplyPoint;
end;

function TXMLShipToCharacteristics.Get_LocationCode: IXMLLocationCode;
begin
  Result := ChildNodes['LocationCode'] as IXMLLocationCode;
end;

function TXMLShipToCharacteristics.Get_TermsOfDelivery: IXMLTermsOfDelivery;
begin
  Result := ChildNodes['TermsOfDelivery'] as IXMLTermsOfDelivery;
end;

function TXMLShipToCharacteristics.Get_DeliveryRouteCode: IXMLDeliveryRouteCode;
begin
  Result := ChildNodes['DeliveryRouteCode'] as IXMLDeliveryRouteCode;
end;

{ TXMLTypedParty }

function TXMLTypedParty.Get_PartyType: UnicodeString;
begin
  Result := AttributeNodes['PartyType'].Text;
end;

procedure TXMLTypedParty.Set_PartyType(Value: UnicodeString);
begin
  SetAttribute('PartyType', Value);
end;

{ TXMLTypedPartyList }

function TXMLTypedPartyList.Add: IXMLTypedParty;
begin
  Result := AddItem(-1) as IXMLTypedParty;
end;

function TXMLTypedPartyList.Insert(const Index: Integer): IXMLTypedParty;
begin
  Result := AddItem(Index) as IXMLTypedParty;
end;

function TXMLTypedPartyList.Get_Item(Index: Integer): IXMLTypedParty;
begin
  Result := List[Index] as IXMLTypedParty;
end;

{ TXMLSupplyPoint }

procedure TXMLSupplyPoint.AfterConstruction;
begin
  RegisterChildNode('SupplyPointCode', TXMLSupplyPointCode);
  RegisterChildNode('MapCoordinates', TXMLMapCoordinates);
  RegisterChildNode('SupplyPointCharacteristics', TXMLSupplyPointCharacteristics);
  FSupplyPointCode := CreateCollection(TXMLSupplyPointCodeList, IXMLSupplyPointCode, 'SupplyPointCode') as IXMLSupplyPointCodeList;
  FSupplyPointDescription := CreateCollection(TXMLS255List, IXMLNode, 'SupplyPointDescription') as IXMLS255List;
  FMapCoordinates := CreateCollection(TXMLMapCoordinatesList, IXMLMapCoordinates, 'MapCoordinates') as IXMLMapCoordinatesList;
  inherited;
end;

function TXMLSupplyPoint.Get_LocationType: UnicodeString;
begin
  Result := AttributeNodes['LocationType'].Text;
end;

procedure TXMLSupplyPoint.Set_LocationType(Value: UnicodeString);
begin
  SetAttribute('LocationType', Value);
end;

function TXMLSupplyPoint.Get_SupplyPointCode: IXMLSupplyPointCodeList;
begin
  Result := FSupplyPointCode;
end;

function TXMLSupplyPoint.Get_SupplyPointDescription: IXMLS255List;
begin
  Result := FSupplyPointDescription;
end;

function TXMLSupplyPoint.Get_MapCoordinates: IXMLMapCoordinatesList;
begin
  Result := FMapCoordinates;
end;

function TXMLSupplyPoint.Get_SupplyPointCharacteristics: IXMLSupplyPointCharacteristics;
begin
  Result := ChildNodes['SupplyPointCharacteristics'] as IXMLSupplyPointCharacteristics;
end;

{ TXMLSupplyPointList }

function TXMLSupplyPointList.Add: IXMLSupplyPoint;
begin
  Result := AddItem(-1) as IXMLSupplyPoint;
end;

function TXMLSupplyPointList.Insert(const Index: Integer): IXMLSupplyPoint;
begin
  Result := AddItem(Index) as IXMLSupplyPoint;
end;

function TXMLSupplyPointList.Get_Item(Index: Integer): IXMLSupplyPoint;
begin
  Result := List[Index] as IXMLSupplyPoint;
end;

{ TXMLSupplyPointCode }

function TXMLSupplyPointCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLSupplyPointCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLSupplyPointCodeList }

function TXMLSupplyPointCodeList.Add: IXMLSupplyPointCode;
begin
  Result := AddItem(-1) as IXMLSupplyPointCode;
end;

function TXMLSupplyPointCodeList.Insert(const Index: Integer): IXMLSupplyPointCode;
begin
  Result := AddItem(Index) as IXMLSupplyPointCode;
end;

function TXMLSupplyPointCodeList.Get_Item(Index: Integer): IXMLSupplyPointCode;
begin
  Result := List[Index] as IXMLSupplyPointCode;
end;

{ TXMLSupplyPointCharacteristics }

procedure TXMLSupplyPointCharacteristics.AfterConstruction;
begin
  RegisterChildNode('SupplyPointProperty', TXMLSupplyPointProperty);
  RegisterChildNode('QuantityInformation', TXMLQuantityInformation);
  RegisterChildNode('MapPoint', TXMLMapPoint);
  RegisterChildNode('AreaInfo', TXMLAreaInfo);
  RegisterChildNode('DocumentReferenceInformation', TXMLDocumentReferenceInformation);
  FSupplyPointProperty := CreateCollection(TXMLSupplyPointPropertyList, IXMLSupplyPointProperty, 'SupplyPointProperty') as IXMLSupplyPointPropertyList;
  FMapPoint := CreateCollection(TXMLMapPointList, IXMLMapPoint, 'MapPoint') as IXMLMapPointList;
  FAreaInfo := CreateCollection(TXMLAreaInfoList, IXMLAreaInfo, 'AreaInfo') as IXMLAreaInfoList;
  FDocumentReferenceInformation := CreateCollection(TXMLDocumentReferenceInformationList, IXMLDocumentReferenceInformation, 'DocumentReferenceInformation') as IXMLDocumentReferenceInformationList;
  inherited;
end;

function TXMLSupplyPointCharacteristics.Get_SupplyPointProperty: IXMLSupplyPointPropertyList;
begin
  Result := FSupplyPointProperty;
end;

function TXMLSupplyPointCharacteristics.Get_QuantityInformation: IXMLQuantityInformation;
begin
  Result := ChildNodes['QuantityInformation'] as IXMLQuantityInformation;
end;

function TXMLSupplyPointCharacteristics.Get_MapPoint: IXMLMapPointList;
begin
  Result := FMapPoint;
end;

function TXMLSupplyPointCharacteristics.Get_AreaInfo: IXMLAreaInfoList;
begin
  Result := FAreaInfo;
end;

function TXMLSupplyPointCharacteristics.Get_DocumentReferenceInformation: IXMLDocumentReferenceInformationList;
begin
  Result := FDocumentReferenceInformation;
end;

{ TXMLSupplyPointProperty }

procedure TXMLSupplyPointProperty.AfterConstruction;
begin
  RegisterChildNode('SupplyPointPropertyCode', TXMLSupplyPointPropertyCode);
  RegisterChildNode('SupplyPointPropertyCodeValue', TXMLSupplyPointPropertyCodeValue);
  FSupplyPointPropertyDescription := CreateCollection(TXMLS255List, IXMLNode, 'SupplyPointPropertyDescription') as IXMLS255List;
  inherited;
end;

function TXMLSupplyPointProperty.Get_SupplyPointPropertyCode: IXMLSupplyPointPropertyCode;
begin
  Result := ChildNodes['SupplyPointPropertyCode'] as IXMLSupplyPointPropertyCode;
end;

function TXMLSupplyPointProperty.Get_SupplyPointPropertyCodeValue: IXMLSupplyPointPropertyCodeValue;
begin
  Result := ChildNodes['SupplyPointPropertyCodeValue'] as IXMLSupplyPointPropertyCodeValue;
end;

function TXMLSupplyPointProperty.Get_SupplyPointPropertyDescription: IXMLS255List;
begin
  Result := FSupplyPointPropertyDescription;
end;

{ TXMLSupplyPointPropertyList }

function TXMLSupplyPointPropertyList.Add: IXMLSupplyPointProperty;
begin
  Result := AddItem(-1) as IXMLSupplyPointProperty;
end;

function TXMLSupplyPointPropertyList.Insert(const Index: Integer): IXMLSupplyPointProperty;
begin
  Result := AddItem(Index) as IXMLSupplyPointProperty;
end;

function TXMLSupplyPointPropertyList.Get_Item(Index: Integer): IXMLSupplyPointProperty;
begin
  Result := List[Index] as IXMLSupplyPointProperty;
end;

{ TXMLSupplyPointPropertyCode }

function TXMLSupplyPointPropertyCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLSupplyPointPropertyCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLSupplyPointPropertyCodeValue }

procedure TXMLSupplyPointPropertyCodeValue.AfterConstruction;
begin
  RegisterChildNode('NumericValue', TXMLDetailMeasurement);
  inherited;
end;

function TXMLSupplyPointPropertyCodeValue.Get_BooleanValue: Boolean;
begin
  Result := ChildNodes['BooleanValue'].NodeValue;
end;

procedure TXMLSupplyPointPropertyCodeValue.Set_BooleanValue(Value: Boolean);
begin
  ChildNodes['BooleanValue'].NodeValue := Value;
end;

function TXMLSupplyPointPropertyCodeValue.Get_NumericValue: IXMLDetailMeasurement;
begin
  Result := ChildNodes['NumericValue'] as IXMLDetailMeasurement;
end;

function TXMLSupplyPointPropertyCodeValue.Get_TextValue: UnicodeString;
begin
  Result := ChildNodes['TextValue'].Text;
end;

procedure TXMLSupplyPointPropertyCodeValue.Set_TextValue(Value: UnicodeString);
begin
  ChildNodes['TextValue'].NodeValue := Value;
end;

{ TXMLDetailMeasurement }

procedure TXMLDetailMeasurement.AfterConstruction;
begin
  RegisterChildNode('DetailValue', TXMLDetailValue);
  RegisterChildNode('DetailRangeMin', TXMLDetailRangeMin);
  RegisterChildNode('DetailRangeMax', TXMLDetailRangeMax);
  RegisterChildNode('StandardDeviation', TXMLStandardDeviation);
  RegisterChildNode('TwoSigmaLower', TXMLTwoSigmaLower);
  RegisterChildNode('TwoSigmaUpper', TXMLTwoSigmaUpper);
  inherited;
end;

function TXMLDetailMeasurement.Get_DetailValue: IXMLDetailValue;
begin
  Result := ChildNodes['DetailValue'] as IXMLDetailValue;
end;

function TXMLDetailMeasurement.Get_DetailRangeMin: IXMLDetailRangeMin;
begin
  Result := ChildNodes['DetailRangeMin'] as IXMLDetailRangeMin;
end;

function TXMLDetailMeasurement.Get_DetailRangeMax: IXMLDetailRangeMax;
begin
  Result := ChildNodes['DetailRangeMax'] as IXMLDetailRangeMax;
end;

function TXMLDetailMeasurement.Get_StandardDeviation: IXMLStandardDeviation;
begin
  Result := ChildNodes['StandardDeviation'] as IXMLStandardDeviation;
end;

function TXMLDetailMeasurement.Get_SampleSize: LongWord;
begin
  Result := ChildNodes['SampleSize'].NodeValue;
end;

procedure TXMLDetailMeasurement.Set_SampleSize(Value: LongWord);
begin
  ChildNodes['SampleSize'].NodeValue := Value;
end;

function TXMLDetailMeasurement.Get_TwoSigmaLower: IXMLTwoSigmaLower;
begin
  Result := ChildNodes['TwoSigmaLower'] as IXMLTwoSigmaLower;
end;

function TXMLDetailMeasurement.Get_TwoSigmaUpper: IXMLTwoSigmaUpper;
begin
  Result := ChildNodes['TwoSigmaUpper'] as IXMLTwoSigmaUpper;
end;

{ TXMLDetailValue }

function TXMLDetailValue.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLDetailValue.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLDetailRangeMin }

function TXMLDetailRangeMin.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLDetailRangeMin.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLDetailRangeMax }

function TXMLDetailRangeMax.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLDetailRangeMax.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLStandardDeviation }

function TXMLStandardDeviation.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLStandardDeviation.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLTwoSigmaLower }

function TXMLTwoSigmaLower.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLTwoSigmaLower.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLTwoSigmaUpper }

function TXMLTwoSigmaUpper.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLTwoSigmaUpper.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLQuantityInformation }

procedure TXMLQuantityInformation.AfterConstruction;
begin
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  inherited;
end;

function TXMLQuantityInformation.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLQuantityInformation.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

{ TXMLQuantity }

function TXMLQuantity.Get_QuantityType: UnicodeString;
begin
  Result := AttributeNodes['QuantityType'].Text;
end;

procedure TXMLQuantity.Set_QuantityType(Value: UnicodeString);
begin
  SetAttribute('QuantityType', Value);
end;

function TXMLQuantity.Get_QuantityTypeContext: UnicodeString;
begin
  Result := AttributeNodes['QuantityTypeContext'].Text;
end;

procedure TXMLQuantity.Set_QuantityTypeContext(Value: UnicodeString);
begin
  SetAttribute('QuantityTypeContext', Value);
end;

function TXMLQuantity.Get_AdjustmentType: UnicodeString;
begin
  Result := AttributeNodes['AdjustmentType'].Text;
end;

procedure TXMLQuantity.Set_AdjustmentType(Value: UnicodeString);
begin
  SetAttribute('AdjustmentType', Value);
end;

function TXMLQuantity.Get_MeasuringMethodType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethodType'].Text;
end;

procedure TXMLQuantity.Set_MeasuringMethodType(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethodType', Value);
end;

function TXMLQuantity.Get_MeasuringAgency: UnicodeString;
begin
  Result := AttributeNodes['MeasuringAgency'].Text;
end;

procedure TXMLQuantity.Set_MeasuringAgency(Value: UnicodeString);
begin
  SetAttribute('MeasuringAgency', Value);
end;

function TXMLQuantity.Get_MeasuringMethod: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethod'].Text;
end;

procedure TXMLQuantity.Set_MeasuringMethod(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethod', Value);
end;

{ TXMLInformationalQuantity }

function TXMLInformationalQuantity.Get_QuantityType: UnicodeString;
begin
  Result := AttributeNodes['QuantityType'].Text;
end;

procedure TXMLInformationalQuantity.Set_QuantityType(Value: UnicodeString);
begin
  SetAttribute('QuantityType', Value);
end;

function TXMLInformationalQuantity.Get_QuantityTypeContext: UnicodeString;
begin
  Result := AttributeNodes['QuantityTypeContext'].Text;
end;

procedure TXMLInformationalQuantity.Set_QuantityTypeContext(Value: UnicodeString);
begin
  SetAttribute('QuantityTypeContext', Value);
end;

function TXMLInformationalQuantity.Get_AdjustmentType: UnicodeString;
begin
  Result := AttributeNodes['AdjustmentType'].Text;
end;

procedure TXMLInformationalQuantity.Set_AdjustmentType(Value: UnicodeString);
begin
  SetAttribute('AdjustmentType', Value);
end;

function TXMLInformationalQuantity.Get_MeasuringMethodType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethodType'].Text;
end;

procedure TXMLInformationalQuantity.Set_MeasuringMethodType(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethodType', Value);
end;

function TXMLInformationalQuantity.Get_MeasuringAgency: UnicodeString;
begin
  Result := AttributeNodes['MeasuringAgency'].Text;
end;

procedure TXMLInformationalQuantity.Set_MeasuringAgency(Value: UnicodeString);
begin
  SetAttribute('MeasuringAgency', Value);
end;

function TXMLInformationalQuantity.Get_MeasuringMethod: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethod'].Text;
end;

procedure TXMLInformationalQuantity.Set_MeasuringMethod(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethod', Value);
end;

{ TXMLInformationalQuantityList }

function TXMLInformationalQuantityList.Add: IXMLInformationalQuantity;
begin
  Result := AddItem(-1) as IXMLInformationalQuantity;
end;

function TXMLInformationalQuantityList.Insert(const Index: Integer): IXMLInformationalQuantity;
begin
  Result := AddItem(Index) as IXMLInformationalQuantity;
end;

function TXMLInformationalQuantityList.Get_Item(Index: Integer): IXMLInformationalQuantity;
begin
  Result := List[Index] as IXMLInformationalQuantity;
end;

{ TXMLMapPoint }

procedure TXMLMapPoint.AfterConstruction;
begin
  RegisterChildNode('MapPointID', TXMLMapPointID);
  RegisterChildNode('MapCoordinates', TXMLMapCoordinates);
  FMapPointID := CreateCollection(TXMLMapPointIDList, IXMLMapPointID, 'MapPointID') as IXMLMapPointIDList;
  FMapPointComment := CreateCollection(TXMLS255List, IXMLNode, 'MapPointComment') as IXMLS255List;
  FMapCoordinates := CreateCollection(TXMLMapCoordinatesList, IXMLMapCoordinates, 'MapCoordinates') as IXMLMapCoordinatesList;
  inherited;
end;

function TXMLMapPoint.Get_MapPointType: UnicodeString;
begin
  Result := AttributeNodes['MapPointType'].Text;
end;

procedure TXMLMapPoint.Set_MapPointType(Value: UnicodeString);
begin
  SetAttribute('MapPointType', Value);
end;

function TXMLMapPoint.Get_MapPointDisplayType: UnicodeString;
begin
  Result := AttributeNodes['MapPointDisplayType'].Text;
end;

procedure TXMLMapPoint.Set_MapPointDisplayType(Value: UnicodeString);
begin
  SetAttribute('MapPointDisplayType', Value);
end;

function TXMLMapPoint.Get_MapPointName: UnicodeString;
begin
  Result := ChildNodes['MapPointName'].Text;
end;

procedure TXMLMapPoint.Set_MapPointName(Value: UnicodeString);
begin
  ChildNodes['MapPointName'].NodeValue := Value;
end;

function TXMLMapPoint.Get_MapPointID: IXMLMapPointIDList;
begin
  Result := FMapPointID;
end;

function TXMLMapPoint.Get_MapPointComment: IXMLS255List;
begin
  Result := FMapPointComment;
end;

function TXMLMapPoint.Get_MapCoordinates: IXMLMapCoordinatesList;
begin
  Result := FMapCoordinates;
end;

{ TXMLMapPointList }

function TXMLMapPointList.Add: IXMLMapPoint;
begin
  Result := AddItem(-1) as IXMLMapPoint;
end;

function TXMLMapPointList.Insert(const Index: Integer): IXMLMapPoint;
begin
  Result := AddItem(Index) as IXMLMapPoint;
end;

function TXMLMapPointList.Get_Item(Index: Integer): IXMLMapPoint;
begin
  Result := List[Index] as IXMLMapPoint;
end;

{ TXMLMapPointID }

function TXMLMapPointID.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLMapPointID.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLMapPointIDList }

function TXMLMapPointIDList.Add: IXMLMapPointID;
begin
  Result := AddItem(-1) as IXMLMapPointID;
end;

function TXMLMapPointIDList.Insert(const Index: Integer): IXMLMapPointID;
begin
  Result := AddItem(Index) as IXMLMapPointID;
end;

function TXMLMapPointIDList.Get_Item(Index: Integer): IXMLMapPointID;
begin
  Result := List[Index] as IXMLMapPointID;
end;

{ TXMLAreaInfo }

procedure TXMLAreaInfo.AfterConstruction;
begin
  RegisterChildNode('AreaProperty', TXMLCodeInfo);
  RegisterChildNode('MapPoint', TXMLMapPoint);
  RegisterChildNode('PropertyValue', TXMLPropertyValue);
  RegisterChildNode('eAttachment', TXMLEAttachment);
  FAreaProperty := CreateCollection(TXMLCodeInfoList, IXMLCodeInfo, 'AreaProperty') as IXMLCodeInfoList;
  FMapPoint := CreateCollection(TXMLMapPointList, IXMLMapPoint, 'MapPoint') as IXMLMapPointList;
  FPropertyValue := CreateCollection(TXMLPropertyValueList, IXMLPropertyValue, 'PropertyValue') as IXMLPropertyValueList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLAreaInfo.Get_AreaProperty: IXMLCodeInfoList;
begin
  Result := FAreaProperty;
end;

function TXMLAreaInfo.Get_MapPoint: IXMLMapPointList;
begin
  Result := FMapPoint;
end;

function TXMLAreaInfo.Get_PropertyValue: IXMLPropertyValueList;
begin
  Result := FPropertyValue;
end;

function TXMLAreaInfo.Get_EAttachment: IXMLEAttachment;
begin
  Result := ChildNodes['eAttachment'] as IXMLEAttachment;
end;

function TXMLAreaInfo.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLAreaInfoList }

function TXMLAreaInfoList.Add: IXMLAreaInfo;
begin
  Result := AddItem(-1) as IXMLAreaInfo;
end;

function TXMLAreaInfoList.Insert(const Index: Integer): IXMLAreaInfo;
begin
  Result := AddItem(Index) as IXMLAreaInfo;
end;

function TXMLAreaInfoList.Get_Item(Index: Integer): IXMLAreaInfo;
begin
  Result := List[Index] as IXMLAreaInfo;
end;

{ TXMLCodeInfo }

procedure TXMLCodeInfo.AfterConstruction;
begin
  RegisterChildNode('CodeValue', TXMLCodeValue);
  FCodeDescription := CreateCollection(TXMLS255List, IXMLNode, 'CodeDescription') as IXMLS255List;
  inherited;
end;

function TXMLCodeInfo.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLCodeInfo.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

function TXMLCodeInfo.Get_Code: UnicodeString;
begin
  Result := ChildNodes['Code'].Text;
end;

procedure TXMLCodeInfo.Set_Code(Value: UnicodeString);
begin
  ChildNodes['Code'].NodeValue := Value;
end;

function TXMLCodeInfo.Get_CodeValue: IXMLCodeValue;
begin
  Result := ChildNodes['CodeValue'] as IXMLCodeValue;
end;

function TXMLCodeInfo.Get_CodeDescription: IXMLS255List;
begin
  Result := FCodeDescription;
end;

{ TXMLCodeInfoList }

function TXMLCodeInfoList.Add: IXMLCodeInfo;
begin
  Result := AddItem(-1) as IXMLCodeInfo;
end;

function TXMLCodeInfoList.Insert(const Index: Integer): IXMLCodeInfo;
begin
  Result := AddItem(Index) as IXMLCodeInfo;
end;

function TXMLCodeInfoList.Get_Item(Index: Integer): IXMLCodeInfo;
begin
  Result := List[Index] as IXMLCodeInfo;
end;

{ TXMLCodeValue }

procedure TXMLCodeValue.AfterConstruction;
begin
  RegisterChildNode('NumericValue', TXMLDetailMeasurement);
  inherited;
end;

function TXMLCodeValue.Get_BooleanValue: Boolean;
begin
  Result := ChildNodes['BooleanValue'].NodeValue;
end;

procedure TXMLCodeValue.Set_BooleanValue(Value: Boolean);
begin
  ChildNodes['BooleanValue'].NodeValue := Value;
end;

function TXMLCodeValue.Get_NumericValue: IXMLDetailMeasurement;
begin
  Result := ChildNodes['NumericValue'] as IXMLDetailMeasurement;
end;

function TXMLCodeValue.Get_TextValue: UnicodeString;
begin
  Result := ChildNodes['TextValue'].Text;
end;

procedure TXMLCodeValue.Set_TextValue(Value: UnicodeString);
begin
  ChildNodes['TextValue'].NodeValue := Value;
end;

{ TXMLCodeValueList }

function TXMLCodeValueList.Add: IXMLCodeValue;
begin
  Result := AddItem(-1) as IXMLCodeValue;
end;

function TXMLCodeValueList.Insert(const Index: Integer): IXMLCodeValue;
begin
  Result := AddItem(Index) as IXMLCodeValue;
end;

function TXMLCodeValueList.Get_Item(Index: Integer): IXMLCodeValue;
begin
  Result := List[Index] as IXMLCodeValue;
end;

{ TXMLPropertyValue }

procedure TXMLPropertyValue.AfterConstruction;
begin
  RegisterChildNode('PositionOnItem', TXMLPositionOnItem);
  RegisterChildNode('NumericValue', TXMLDetailMeasurement);
  RegisterChildNode('PropertySubValue', TXMLPropertySubValue);
  FPropertySubValue := CreateCollection(TXMLPropertySubValueList, IXMLPropertySubValue, 'PropertySubValue') as IXMLPropertySubValueList;
  inherited;
end;

function TXMLPropertyValue.Get_PropertyType: UnicodeString;
begin
  Result := AttributeNodes['PropertyType'].Text;
end;

procedure TXMLPropertyValue.Set_PropertyType(Value: UnicodeString);
begin
  SetAttribute('PropertyType', Value);
end;

function TXMLPropertyValue.Get_MeasuringMethodType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethodType'].Text;
end;

procedure TXMLPropertyValue.Set_MeasuringMethodType(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethodType', Value);
end;

function TXMLPropertyValue.Get_MeasuringAgency: UnicodeString;
begin
  Result := AttributeNodes['MeasuringAgency'].Text;
end;

procedure TXMLPropertyValue.Set_MeasuringAgency(Value: UnicodeString);
begin
  SetAttribute('MeasuringAgency', Value);
end;

function TXMLPropertyValue.Get_MeasuringMethod: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethod'].Text;
end;

procedure TXMLPropertyValue.Set_MeasuringMethod(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethod', Value);
end;

function TXMLPropertyValue.Get_IsAverageValue: UnicodeString;
begin
  Result := AttributeNodes['IsAverageValue'].Text;
end;

procedure TXMLPropertyValue.Set_IsAverageValue(Value: UnicodeString);
begin
  SetAttribute('IsAverageValue', Value);
end;

function TXMLPropertyValue.Get_ItemType: UnicodeString;
begin
  Result := AttributeNodes['ItemType'].Text;
end;

procedure TXMLPropertyValue.Set_ItemType(Value: UnicodeString);
begin
  SetAttribute('ItemType', Value);
end;

function TXMLPropertyValue.Get_PositionOnItem: IXMLPositionOnItem;
begin
  Result := ChildNodes['PositionOnItem'] as IXMLPositionOnItem;
end;

function TXMLPropertyValue.Get_BinaryValue: UnicodeString;
begin
  Result := ChildNodes['BinaryValue'].Text;
end;

procedure TXMLPropertyValue.Set_BinaryValue(Value: UnicodeString);
begin
  ChildNodes['BinaryValue'].NodeValue := Value;
end;

function TXMLPropertyValue.Get_BooleanValue: Boolean;
begin
  Result := ChildNodes['BooleanValue'].NodeValue;
end;

procedure TXMLPropertyValue.Set_BooleanValue(Value: Boolean);
begin
  ChildNodes['BooleanValue'].NodeValue := Value;
end;

function TXMLPropertyValue.Get_DateTimeValue: UnicodeString;
begin
  Result := ChildNodes['DateTimeValue'].Text;
end;

procedure TXMLPropertyValue.Set_DateTimeValue(Value: UnicodeString);
begin
  ChildNodes['DateTimeValue'].NodeValue := Value;
end;

function TXMLPropertyValue.Get_NumericValue: IXMLDetailMeasurement;
begin
  Result := ChildNodes['NumericValue'] as IXMLDetailMeasurement;
end;

function TXMLPropertyValue.Get_TextValue: UnicodeString;
begin
  Result := ChildNodes['TextValue'].Text;
end;

procedure TXMLPropertyValue.Set_TextValue(Value: UnicodeString);
begin
  ChildNodes['TextValue'].NodeValue := Value;
end;

function TXMLPropertyValue.Get_PropertySubValue: IXMLPropertySubValueList;
begin
  Result := FPropertySubValue;
end;

{ TXMLPositionOnItem }

function TXMLPositionOnItem.Get_PositionMeasuredFrom: UnicodeString;
begin
  Result := AttributeNodes['PositionMeasuredFrom'].Text;
end;

procedure TXMLPositionOnItem.Set_PositionMeasuredFrom(Value: UnicodeString);
begin
  SetAttribute('PositionMeasuredFrom', Value);
end;

function TXMLPositionOnItem.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLPositionOnItem.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLPropertySubValue }

procedure TXMLPropertySubValue.AfterConstruction;
begin
  RegisterChildNode('PositionOnItem', TXMLPositionOnItem);
  RegisterChildNode('NumericValue', TXMLDetailMeasurement);
  inherited;
end;

function TXMLPropertySubValue.Get_PropertyType: UnicodeString;
begin
  Result := AttributeNodes['PropertyType'].Text;
end;

procedure TXMLPropertySubValue.Set_PropertyType(Value: UnicodeString);
begin
  SetAttribute('PropertyType', Value);
end;

function TXMLPropertySubValue.Get_MeasuringMethodType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethodType'].Text;
end;

procedure TXMLPropertySubValue.Set_MeasuringMethodType(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethodType', Value);
end;

function TXMLPropertySubValue.Get_MeasuringAgency: UnicodeString;
begin
  Result := AttributeNodes['MeasuringAgency'].Text;
end;

procedure TXMLPropertySubValue.Set_MeasuringAgency(Value: UnicodeString);
begin
  SetAttribute('MeasuringAgency', Value);
end;

function TXMLPropertySubValue.Get_MeasuringMethod: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethod'].Text;
end;

procedure TXMLPropertySubValue.Set_MeasuringMethod(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethod', Value);
end;

function TXMLPropertySubValue.Get_IsAverageValue: UnicodeString;
begin
  Result := AttributeNodes['IsAverageValue'].Text;
end;

procedure TXMLPropertySubValue.Set_IsAverageValue(Value: UnicodeString);
begin
  SetAttribute('IsAverageValue', Value);
end;

function TXMLPropertySubValue.Get_ItemType: UnicodeString;
begin
  Result := AttributeNodes['ItemType'].Text;
end;

procedure TXMLPropertySubValue.Set_ItemType(Value: UnicodeString);
begin
  SetAttribute('ItemType', Value);
end;

function TXMLPropertySubValue.Get_PositionOnItem: IXMLPositionOnItem;
begin
  Result := ChildNodes['PositionOnItem'] as IXMLPositionOnItem;
end;

function TXMLPropertySubValue.Get_BinaryValue: UnicodeString;
begin
  Result := ChildNodes['BinaryValue'].Text;
end;

procedure TXMLPropertySubValue.Set_BinaryValue(Value: UnicodeString);
begin
  ChildNodes['BinaryValue'].NodeValue := Value;
end;

function TXMLPropertySubValue.Get_BooleanValue: Boolean;
begin
  Result := ChildNodes['BooleanValue'].NodeValue;
end;

procedure TXMLPropertySubValue.Set_BooleanValue(Value: Boolean);
begin
  ChildNodes['BooleanValue'].NodeValue := Value;
end;

function TXMLPropertySubValue.Get_DateTimeValue: UnicodeString;
begin
  Result := ChildNodes['DateTimeValue'].Text;
end;

procedure TXMLPropertySubValue.Set_DateTimeValue(Value: UnicodeString);
begin
  ChildNodes['DateTimeValue'].NodeValue := Value;
end;

function TXMLPropertySubValue.Get_NumericValue: IXMLDetailMeasurement;
begin
  Result := ChildNodes['NumericValue'] as IXMLDetailMeasurement;
end;

function TXMLPropertySubValue.Get_TextValue: UnicodeString;
begin
  Result := ChildNodes['TextValue'].Text;
end;

procedure TXMLPropertySubValue.Set_TextValue(Value: UnicodeString);
begin
  ChildNodes['TextValue'].NodeValue := Value;
end;

{ TXMLPropertySubValueList }

function TXMLPropertySubValueList.Add: IXMLPropertySubValue;
begin
  Result := AddItem(-1) as IXMLPropertySubValue;
end;

function TXMLPropertySubValueList.Insert(const Index: Integer): IXMLPropertySubValue;
begin
  Result := AddItem(Index) as IXMLPropertySubValue;
end;

function TXMLPropertySubValueList.Get_Item(Index: Integer): IXMLPropertySubValue;
begin
  Result := List[Index] as IXMLPropertySubValue;
end;

{ TXMLEAttachment }

procedure TXMLEAttachment.AfterConstruction;
begin
  RegisterChildNode('AttachmentFileName', TXMLAttachmentFileName);
  RegisterChildNode('URL', TXMLURL);
  FAttachmentFileName := CreateCollection(TXMLAttachmentFileNameList, IXMLAttachmentFileName, 'AttachmentFileName') as IXMLAttachmentFileNameList;
  FURL := CreateCollection(TXMLURLList, IXMLURL, 'URL') as IXMLURLList;
  inherited;
end;

function TXMLEAttachment.Get_AttachmentFileName: IXMLAttachmentFileNameList;
begin
  Result := FAttachmentFileName;
end;

function TXMLEAttachment.Get_NumberOfAttachments: LongWord;
begin
  Result := ChildNodes['NumberOfAttachments'].NodeValue;
end;

procedure TXMLEAttachment.Set_NumberOfAttachments(Value: LongWord);
begin
  ChildNodes['NumberOfAttachments'].NodeValue := Value;
end;

function TXMLEAttachment.Get_URL: IXMLURLList;
begin
  Result := FURL;
end;

{ TXMLAttachmentFileName }

function TXMLAttachmentFileName.Get_AttachmentContext: UnicodeString;
begin
  Result := AttributeNodes['AttachmentContext'].Text;
end;

procedure TXMLAttachmentFileName.Set_AttachmentContext(Value: UnicodeString);
begin
  SetAttribute('AttachmentContext', Value);
end;

{ TXMLAttachmentFileNameList }

function TXMLAttachmentFileNameList.Add: IXMLAttachmentFileName;
begin
  Result := AddItem(-1) as IXMLAttachmentFileName;
end;

function TXMLAttachmentFileNameList.Insert(const Index: Integer): IXMLAttachmentFileName;
begin
  Result := AddItem(Index) as IXMLAttachmentFileName;
end;

function TXMLAttachmentFileNameList.Get_Item(Index: Integer): IXMLAttachmentFileName;
begin
  Result := List[Index] as IXMLAttachmentFileName;
end;

{ TXMLLocationCode }

function TXMLLocationCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLLocationCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTermsOfDelivery }

procedure TXMLTermsOfDelivery.AfterConstruction;
begin
  RegisterChildNode('IncotermsLocation', TXMLIncotermsLocation);
  RegisterChildNode('ShipmentMethodOfPayment', TXMLShipmentMethodOfPayment);
  RegisterChildNode('ServiceLevel', TXMLServiceLevel);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  FServiceLevel := CreateCollection(TXMLServiceLevelList, IXMLServiceLevel, 'ServiceLevel') as IXMLServiceLevelList;
  inherited;
end;

function TXMLTermsOfDelivery.Get_IncotermsLocation: IXMLIncotermsLocation;
begin
  Result := ChildNodes['IncotermsLocation'] as IXMLIncotermsLocation;
end;

function TXMLTermsOfDelivery.Get_ShipmentMethodOfPayment: IXMLShipmentMethodOfPayment;
begin
  Result := ChildNodes['ShipmentMethodOfPayment'] as IXMLShipmentMethodOfPayment;
end;

function TXMLTermsOfDelivery.Get_FreightPayableAt: UnicodeString;
begin
  Result := ChildNodes['FreightPayableAt'].Text;
end;

procedure TXMLTermsOfDelivery.Set_FreightPayableAt(Value: UnicodeString);
begin
  ChildNodes['FreightPayableAt'].NodeValue := Value;
end;

function TXMLTermsOfDelivery.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLTermsOfDelivery.Get_ServiceLevel: IXMLServiceLevelList;
begin
  Result := FServiceLevel;
end;

{ TXMLIncotermsLocation }

function TXMLIncotermsLocation.Get_Incoterms: UnicodeString;
begin
  Result := AttributeNodes['Incoterms'].Text;
end;

procedure TXMLIncotermsLocation.Set_Incoterms(Value: UnicodeString);
begin
  SetAttribute('Incoterms', Value);
end;

function TXMLIncotermsLocation.Get_IncotermsVersion: UnicodeString;
begin
  Result := AttributeNodes['IncotermsVersion'].Text;
end;

procedure TXMLIncotermsLocation.Set_IncotermsVersion(Value: UnicodeString);
begin
  SetAttribute('IncotermsVersion', Value);
end;

{ TXMLShipmentMethodOfPayment }

function TXMLShipmentMethodOfPayment.Get_LocationQualifier: UnicodeString;
begin
  Result := AttributeNodes['LocationQualifier'].Text;
end;

procedure TXMLShipmentMethodOfPayment.Set_LocationQualifier(Value: UnicodeString);
begin
  SetAttribute('LocationQualifier', Value);
end;

function TXMLShipmentMethodOfPayment.Get_Method: UnicodeString;
begin
  Result := AttributeNodes['Method'].Text;
end;

procedure TXMLShipmentMethodOfPayment.Set_Method(Value: UnicodeString);
begin
  SetAttribute('Method', Value);
end;

{ TXMLServiceLevel }

procedure TXMLServiceLevel.AfterConstruction;
begin
  RegisterChildNode('ServiceLevelReference', TXMLServiceLevelReference);
  FServiceLevelText := CreateCollection(TXMLS255List, IXMLNode, 'ServiceLevelText') as IXMLS255List;
  FServiceLevelReference := CreateCollection(TXMLServiceLevelReferenceList, IXMLServiceLevelReference, 'ServiceLevelReference') as IXMLServiceLevelReferenceList;
  inherited;
end;

function TXMLServiceLevel.Get_ServiceLevelContextType: UnicodeString;
begin
  Result := AttributeNodes['ServiceLevelContextType'].Text;
end;

procedure TXMLServiceLevel.Set_ServiceLevelContextType(Value: UnicodeString);
begin
  SetAttribute('ServiceLevelContextType', Value);
end;

function TXMLServiceLevel.Get_ServiceLevelText: IXMLS255List;
begin
  Result := FServiceLevelText;
end;

function TXMLServiceLevel.Get_ServiceLevelReference: IXMLServiceLevelReferenceList;
begin
  Result := FServiceLevelReference;
end;

{ TXMLServiceLevelList }

function TXMLServiceLevelList.Add: IXMLServiceLevel;
begin
  Result := AddItem(-1) as IXMLServiceLevel;
end;

function TXMLServiceLevelList.Insert(const Index: Integer): IXMLServiceLevel;
begin
  Result := AddItem(Index) as IXMLServiceLevel;
end;

function TXMLServiceLevelList.Get_Item(Index: Integer): IXMLServiceLevel;
begin
  Result := List[Index] as IXMLServiceLevel;
end;

{ TXMLServiceLevelReference }

function TXMLServiceLevelReference.Get_ServiceLevelReferenceType: UnicodeString;
begin
  Result := AttributeNodes['ServiceLevelReferenceType'].Text;
end;

procedure TXMLServiceLevelReference.Set_ServiceLevelReferenceType(Value: UnicodeString);
begin
  SetAttribute('ServiceLevelReferenceType', Value);
end;

function TXMLServiceLevelReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLServiceLevelReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLServiceLevelReferenceList }

function TXMLServiceLevelReferenceList.Add: IXMLServiceLevelReference;
begin
  Result := AddItem(-1) as IXMLServiceLevelReference;
end;

function TXMLServiceLevelReferenceList.Insert(const Index: Integer): IXMLServiceLevelReference;
begin
  Result := AddItem(Index) as IXMLServiceLevelReference;
end;

function TXMLServiceLevelReferenceList.Get_Item(Index: Integer): IXMLServiceLevelReference;
begin
  Result := List[Index] as IXMLServiceLevelReference;
end;

{ TXMLDeliveryRouteCode }

function TXMLDeliveryRouteCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLDeliveryRouteCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLLocationInfo }

procedure TXMLLocationInfo.AfterConstruction;
begin
  RegisterChildNode('LocationParty', TXMLLocationParty);
  RegisterChildNode('LocationCharacteristics', TXMLLocationCharacteristics);
  RegisterChildNode('SupplyPoint', TXMLSupplyPoint);
  FSupplyPoint := CreateCollection(TXMLSupplyPointList, IXMLSupplyPoint, 'SupplyPoint') as IXMLSupplyPointList;
  inherited;
end;

function TXMLLocationInfo.Get_LocationParty: IXMLLocationParty;
begin
  Result := ChildNodes['LocationParty'] as IXMLLocationParty;
end;

function TXMLLocationInfo.Get_LocationCharacteristics: IXMLLocationCharacteristics;
begin
  Result := ChildNodes['LocationCharacteristics'] as IXMLLocationCharacteristics;
end;

function TXMLLocationInfo.Get_SupplyPoint: IXMLSupplyPointList;
begin
  Result := FSupplyPoint;
end;

{ TXMLLocationInfoList }

function TXMLLocationInfoList.Add: IXMLLocationInfo;
begin
  Result := AddItem(-1) as IXMLLocationInfo;
end;

function TXMLLocationInfoList.Insert(const Index: Integer): IXMLLocationInfo;
begin
  Result := AddItem(Index) as IXMLLocationInfo;
end;

function TXMLLocationInfoList.Get_Item(Index: Integer): IXMLLocationInfo;
begin
  Result := List[Index] as IXMLLocationInfo;
end;

{ TXMLLocationParty }

function TXMLLocationParty.Get_LocationType: UnicodeString;
begin
  Result := AttributeNodes['LocationType'].Text;
end;

procedure TXMLLocationParty.Set_LocationType(Value: UnicodeString);
begin
  SetAttribute('LocationType', Value);
end;

{ TXMLLocationPartyList }

function TXMLLocationPartyList.Add: IXMLLocationParty;
begin
  Result := AddItem(-1) as IXMLLocationParty;
end;

function TXMLLocationPartyList.Insert(const Index: Integer): IXMLLocationParty;
begin
  Result := AddItem(Index) as IXMLLocationParty;
end;

function TXMLLocationPartyList.Get_Item(Index: Integer): IXMLLocationParty;
begin
  Result := List[Index] as IXMLLocationParty;
end;

{ TXMLLocationCharacteristics }

procedure TXMLLocationCharacteristics.AfterConstruction;
begin
  RegisterChildNode('LocationProperty', TXMLCodeInfo);
  RegisterChildNode('MapPoint', TXMLMapPoint);
  RegisterChildNode('AreaInfo', TXMLAreaInfo);
  RegisterChildNode('OtherDate', TXMLOtherDate);
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('DocumentReferenceInformation', TXMLDocumentReferenceInformation);
  RegisterChildNode('eAttachment', TXMLEAttachment);
  FLocationProperty := CreateCollection(TXMLCodeInfoList, IXMLCodeInfo, 'LocationProperty') as IXMLCodeInfoList;
  FMapPoint := CreateCollection(TXMLMapPointList, IXMLMapPoint, 'MapPoint') as IXMLMapPointList;
  FAreaInfo := CreateCollection(TXMLAreaInfoList, IXMLAreaInfo, 'AreaInfo') as IXMLAreaInfoList;
  FOtherDate := CreateCollection(TXMLOtherDateList, IXMLOtherDate, 'OtherDate') as IXMLOtherDateList;
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FDocumentReferenceInformation := CreateCollection(TXMLDocumentReferenceInformationList, IXMLDocumentReferenceInformation, 'DocumentReferenceInformation') as IXMLDocumentReferenceInformationList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLLocationCharacteristics.Get_LocationProperty: IXMLCodeInfoList;
begin
  Result := FLocationProperty;
end;

function TXMLLocationCharacteristics.Get_MapPoint: IXMLMapPointList;
begin
  Result := FMapPoint;
end;

function TXMLLocationCharacteristics.Get_AreaInfo: IXMLAreaInfoList;
begin
  Result := FAreaInfo;
end;

function TXMLLocationCharacteristics.Get_OtherDate: IXMLOtherDateList;
begin
  Result := FOtherDate;
end;

function TXMLLocationCharacteristics.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLLocationCharacteristics.Get_DocumentReferenceInformation: IXMLDocumentReferenceInformationList;
begin
  Result := FDocumentReferenceInformation;
end;

function TXMLLocationCharacteristics.Get_EAttachment: IXMLEAttachment;
begin
  Result := ChildNodes['eAttachment'] as IXMLEAttachment;
end;

function TXMLLocationCharacteristics.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLCountryOfOrigin }

procedure TXMLCountryOfOrigin.AfterConstruction;
begin
  RegisterChildNode('Country', TXMLCountry);
  inherited;
end;

function TXMLCountryOfOrigin.Get_Country: IXMLCountry;
begin
  Result := ChildNodes['Country'] as IXMLCountry;
end;

{ TXMLCountryOfDestination }

procedure TXMLCountryOfDestination.AfterConstruction;
begin
  RegisterChildNode('Country', TXMLCountry);
  inherited;
end;

function TXMLCountryOfDestination.Get_Country: IXMLCountry;
begin
  Result := ChildNodes['Country'] as IXMLCountry;
end;

{ TXMLCountryOfConsumption }

procedure TXMLCountryOfConsumption.AfterConstruction;
begin
  RegisterChildNode('Country', TXMLCountry);
  inherited;
end;

function TXMLCountryOfConsumption.Get_Country: IXMLCountry;
begin
  Result := ChildNodes['Country'] as IXMLCountry;
end;

{ TXMLCreditDebitNoteReason }

procedure TXMLCreditDebitNoteReason.AfterConstruction;
begin
  RegisterChildNode('CreditDebitNoteReasonCode', TXMLCreditDebitNoteReasonCode);
  inherited;
end;

function TXMLCreditDebitNoteReason.Get_CreditDebitNoteReasonCode: IXMLCreditDebitNoteReasonCode;
begin
  Result := ChildNodes['CreditDebitNoteReasonCode'] as IXMLCreditDebitNoteReasonCode;
end;

function TXMLCreditDebitNoteReason.Get_ReasonDescription: UnicodeString;
begin
  Result := ChildNodes['ReasonDescription'].Text;
end;

procedure TXMLCreditDebitNoteReason.Set_ReasonDescription(Value: UnicodeString);
begin
  ChildNodes['ReasonDescription'].NodeValue := Value;
end;

{ TXMLCreditDebitNoteReasonCode }

function TXMLCreditDebitNoteReasonCode.Get_CreditDebitNoteReasonType: UnicodeString;
begin
  Result := AttributeNodes['CreditDebitNoteReasonType'].Text;
end;

procedure TXMLCreditDebitNoteReasonCode.Set_CreditDebitNoteReasonType(Value: UnicodeString);
begin
  SetAttribute('CreditDebitNoteReasonType', Value);
end;

function TXMLCreditDebitNoteReasonCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLCreditDebitNoteReasonCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLSafetyAndEnvironmentalInformationClass }

procedure TXMLSafetyAndEnvironmentalInformationClass.AfterConstruction;
begin
  RegisterChildNode('ChainOfCustody', TXMLChainOfCustody);
  RegisterChildNode('SafetyAndEnvironmentalCertification', TXMLMeasurement);
  RegisterChildNode('Quantity', TXMLQuantity);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLSafetyAndEnvironmentalInformationClass.Get_SafetyAndEnvironmentalType: UnicodeString;
begin
  Result := AttributeNodes['SafetyAndEnvironmentalType'].Text;
end;

procedure TXMLSafetyAndEnvironmentalInformationClass.Set_SafetyAndEnvironmentalType(Value: UnicodeString);
begin
  SetAttribute('SafetyAndEnvironmentalType', Value);
end;

function TXMLSafetyAndEnvironmentalInformationClass.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLSafetyAndEnvironmentalInformationClass.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

function TXMLSafetyAndEnvironmentalInformationClass.Get_LicenceNumber: UnicodeString;
begin
  Result := ChildNodes['LicenceNumber'].Text;
end;

procedure TXMLSafetyAndEnvironmentalInformationClass.Set_LicenceNumber(Value: UnicodeString);
begin
  ChildNodes['LicenceNumber'].NodeValue := Value;
end;

function TXMLSafetyAndEnvironmentalInformationClass.Get_ChainOfCustody: IXMLChainOfCustody;
begin
  Result := ChildNodes['ChainOfCustody'] as IXMLChainOfCustody;
end;

function TXMLSafetyAndEnvironmentalInformationClass.Get_SafetyAndEnvironmentalCertification: IXMLMeasurement;
begin
  Result := ChildNodes['SafetyAndEnvironmentalCertification'] as IXMLMeasurement;
end;

function TXMLSafetyAndEnvironmentalInformationClass.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLSafetyAndEnvironmentalInformationClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLSafetyAndEnvironmentalInformationClassList }

function TXMLSafetyAndEnvironmentalInformationClassList.Add: IXMLSafetyAndEnvironmentalInformationClass;
begin
  Result := AddItem(-1) as IXMLSafetyAndEnvironmentalInformationClass;
end;

function TXMLSafetyAndEnvironmentalInformationClassList.Insert(const Index: Integer): IXMLSafetyAndEnvironmentalInformationClass;
begin
  Result := AddItem(Index) as IXMLSafetyAndEnvironmentalInformationClass;
end;

function TXMLSafetyAndEnvironmentalInformationClassList.Get_Item(Index: Integer): IXMLSafetyAndEnvironmentalInformationClass;
begin
  Result := List[Index] as IXMLSafetyAndEnvironmentalInformationClass;
end;

{ TXMLChainOfCustody }

function TXMLChainOfCustody.Get_CertificationBody: UnicodeString;
begin
  Result := AttributeNodes['CertificationBody'].Text;
end;

procedure TXMLChainOfCustody.Set_CertificationBody(Value: UnicodeString);
begin
  SetAttribute('CertificationBody', Value);
end;

{ TXMLInvoiceLineItem }

procedure TXMLInvoiceLineItem.AfterConstruction;
begin
  RegisterChildNode('PurchaseOrderInformation', TXMLPurchaseOrderInformation);
  RegisterChildNode('ChargeOrAllowance', TXMLChargeOrAllowance);
  RegisterChildNode('Product', TXMLProductClass);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('InvoiceLineBaseAmountInformation', TXMLInvoiceLineBaseAmountInformation);
  RegisterChildNode('MonetaryAdjustment', TXMLMonetaryAdjustment);
  RegisterChildNode('ChargeInformation', TXMLChargeInformation);
  RegisterChildNode('InvoiceLineAmount', TXMLInvoiceLineAmount);
  RegisterChildNode('InvoiceDeliveryInformation', TXMLInvoiceDeliveryInformation);
  RegisterChildNode('InvoiceReference', TXMLInvoiceReference);
  RegisterChildNode('DocumentReferenceInformation', TXMLDocumentReferenceInformation);
  RegisterChildNode('GeneralLedgerAccount', TXMLGeneralLedgerAccount);
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('ShipToCharacteristics', TXMLShipToCharacteristics);
  RegisterChildNode('MillCharacteristics', TXMLMillCharacteristics);
  RegisterChildNode('ItemInformation', TXMLItemInformation);
  RegisterChildNode('TransportModeCharacteristics', TXMLTransportModeCharacteristics);
  RegisterChildNode('TransportUnitCharacteristics', TXMLTransportUnitCharacteristics);
  RegisterChildNode('TransportVehicleCharacteristics', TXMLTransportVehicleCharacteristics);
  RegisterChildNode('CountryOfOrigin', TXMLCountryOfOrigin);
  RegisterChildNode('CountryOfDestination', TXMLCountryOfDestination);
  RegisterChildNode('CountryOfConsumption', TXMLCountryOfConsumption);
  RegisterChildNode('LocationInfo', TXMLLocationInfo);
  RegisterChildNode('LocationParty', TXMLLocationParty);
  RegisterChildNode('DeliveryDateWindow', TXMLDeliveryDateWindow);
  RegisterChildNode('TaxStatement', TXMLTaxStatement);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  RegisterChildNode('StatisticalGoodsInformation', TXMLStatisticalGoodsInformation);
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FMonetaryAdjustment := CreateCollection(TXMLMonetaryAdjustmentList, IXMLMonetaryAdjustment, 'MonetaryAdjustment') as IXMLMonetaryAdjustmentList;
  FChargeInformation := CreateCollection(TXMLChargeInformationList, IXMLChargeInformation, 'ChargeInformation') as IXMLChargeInformationList;
  FInvoiceDeliveryInformation := CreateCollection(TXMLInvoiceDeliveryInformationList, IXMLInvoiceDeliveryInformation, 'InvoiceDeliveryInformation') as IXMLInvoiceDeliveryInformationList;
  FInvoiceReference := CreateCollection(TXMLInvoiceReferenceList, IXMLInvoiceReference, 'InvoiceReference') as IXMLInvoiceReferenceList;
  FDocumentReferenceInformation := CreateCollection(TXMLDocumentReferenceInformationList, IXMLDocumentReferenceInformation, 'DocumentReferenceInformation') as IXMLDocumentReferenceInformationList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FItemInformation := CreateCollection(TXMLItemInformationList, IXMLItemInformation, 'ItemInformation') as IXMLItemInformationList;
  FTransportModeCharacteristics := CreateCollection(TXMLTransportModeCharacteristicsList, IXMLTransportModeCharacteristics, 'TransportModeCharacteristics') as IXMLTransportModeCharacteristicsList;
  FTransportUnitCharacteristics := CreateCollection(TXMLTransportUnitCharacteristicsList, IXMLTransportUnitCharacteristics, 'TransportUnitCharacteristics') as IXMLTransportUnitCharacteristicsList;
  FLocationInfo := CreateCollection(TXMLLocationInfoList, IXMLLocationInfo, 'LocationInfo') as IXMLLocationInfoList;
  FLocationParty := CreateCollection(TXMLLocationPartyList, IXMLLocationParty, 'LocationParty') as IXMLLocationPartyList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLInvoiceLineItem.Get_IsFinalInvoice: UnicodeString;
begin
  Result := AttributeNodes['IsFinalInvoice'].Text;
end;

procedure TXMLInvoiceLineItem.Set_IsFinalInvoice(Value: UnicodeString);
begin
  SetAttribute('IsFinalInvoice', Value);
end;

function TXMLInvoiceLineItem.Get_InvoiceLineNumber: LongWord;
begin
  Result := ChildNodes['InvoiceLineNumber'].NodeValue;
end;

procedure TXMLInvoiceLineItem.Set_InvoiceLineNumber(Value: LongWord);
begin
  ChildNodes['InvoiceLineNumber'].NodeValue := Value;
end;

function TXMLInvoiceLineItem.Get_PurchaseOrderInformation: IXMLPurchaseOrderInformation;
begin
  Result := ChildNodes['PurchaseOrderInformation'] as IXMLPurchaseOrderInformation;
end;

function TXMLInvoiceLineItem.Get_PurchaseOrderLineItemNumber: LongWord;
begin
  Result := ChildNodes['PurchaseOrderLineItemNumber'].NodeValue;
end;

procedure TXMLInvoiceLineItem.Set_PurchaseOrderLineItemNumber(Value: LongWord);
begin
  ChildNodes['PurchaseOrderLineItemNumber'].NodeValue := Value;
end;

function TXMLInvoiceLineItem.Get_ChargeOrAllowance: IXMLChargeOrAllowance;
begin
  Result := ChildNodes['ChargeOrAllowance'] as IXMLChargeOrAllowance;
end;

function TXMLInvoiceLineItem.Get_Product: IXMLProductClass;
begin
  Result := ChildNodes['Product'] as IXMLProductClass;
end;

function TXMLInvoiceLineItem.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLInvoiceLineItem.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLInvoiceLineItem.Get_InvoiceLineBaseAmountInformation: IXMLInvoiceLineBaseAmountInformation;
begin
  Result := ChildNodes['InvoiceLineBaseAmountInformation'] as IXMLInvoiceLineBaseAmountInformation;
end;

function TXMLInvoiceLineItem.Get_MonetaryAdjustment: IXMLMonetaryAdjustmentList;
begin
  Result := FMonetaryAdjustment;
end;

function TXMLInvoiceLineItem.Get_ChargeInformation: IXMLChargeInformationList;
begin
  Result := FChargeInformation;
end;

function TXMLInvoiceLineItem.Get_InvoiceLineAmount: IXMLInvoiceLineAmount;
begin
  Result := ChildNodes['InvoiceLineAmount'] as IXMLInvoiceLineAmount;
end;

function TXMLInvoiceLineItem.Get_InvoiceDeliveryInformation: IXMLInvoiceDeliveryInformationList;
begin
  Result := FInvoiceDeliveryInformation;
end;

function TXMLInvoiceLineItem.Get_InvoiceReference: IXMLInvoiceReferenceList;
begin
  Result := FInvoiceReference;
end;

function TXMLInvoiceLineItem.Get_DocumentReferenceInformation: IXMLDocumentReferenceInformationList;
begin
  Result := FDocumentReferenceInformation;
end;

function TXMLInvoiceLineItem.Get_GeneralLedgerAccount: IXMLGeneralLedgerAccount;
begin
  Result := ChildNodes['GeneralLedgerAccount'] as IXMLGeneralLedgerAccount;
end;

function TXMLInvoiceLineItem.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLInvoiceLineItem.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLInvoiceLineItem.Get_ShipToCharacteristics: IXMLShipToCharacteristics;
begin
  Result := ChildNodes['ShipToCharacteristics'] as IXMLShipToCharacteristics;
end;

function TXMLInvoiceLineItem.Get_MillCharacteristics: IXMLMillCharacteristics;
begin
  Result := ChildNodes['MillCharacteristics'] as IXMLMillCharacteristics;
end;

function TXMLInvoiceLineItem.Get_ItemInformation: IXMLItemInformationList;
begin
  Result := FItemInformation;
end;

function TXMLInvoiceLineItem.Get_TransportModeCharacteristics: IXMLTransportModeCharacteristicsList;
begin
  Result := FTransportModeCharacteristics;
end;

function TXMLInvoiceLineItem.Get_TransportUnitCharacteristics: IXMLTransportUnitCharacteristicsList;
begin
  Result := FTransportUnitCharacteristics;
end;

function TXMLInvoiceLineItem.Get_TransportVehicleCharacteristics: IXMLTransportVehicleCharacteristics;
begin
  Result := ChildNodes['TransportVehicleCharacteristics'] as IXMLTransportVehicleCharacteristics;
end;

function TXMLInvoiceLineItem.Get_CountryOfOrigin: IXMLCountryOfOrigin;
begin
  Result := ChildNodes['CountryOfOrigin'] as IXMLCountryOfOrigin;
end;

function TXMLInvoiceLineItem.Get_CountryOfDestination: IXMLCountryOfDestination;
begin
  Result := ChildNodes['CountryOfDestination'] as IXMLCountryOfDestination;
end;

function TXMLInvoiceLineItem.Get_CountryOfConsumption: IXMLCountryOfConsumption;
begin
  Result := ChildNodes['CountryOfConsumption'] as IXMLCountryOfConsumption;
end;

function TXMLInvoiceLineItem.Get_LocationInfo: IXMLLocationInfoList;
begin
  Result := FLocationInfo;
end;

function TXMLInvoiceLineItem.Get_LocationParty: IXMLLocationPartyList;
begin
  Result := FLocationParty;
end;

function TXMLInvoiceLineItem.Get_DeliveryDateWindow: IXMLDeliveryDateWindow;
begin
  Result := ChildNodes['DeliveryDateWindow'] as IXMLDeliveryDateWindow;
end;

function TXMLInvoiceLineItem.Get_TaxStatement: IXMLTaxStatement;
begin
  Result := ChildNodes['TaxStatement'] as IXMLTaxStatement;
end;

function TXMLInvoiceLineItem.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

function TXMLInvoiceLineItem.Get_StatisticalGoodsInformation: IXMLStatisticalGoodsInformation;
begin
  Result := ChildNodes['StatisticalGoodsInformation'] as IXMLStatisticalGoodsInformation;
end;

{ TXMLInvoiceLineItemList }

function TXMLInvoiceLineItemList.Add: IXMLInvoiceLineItem;
begin
  Result := AddItem(-1) as IXMLInvoiceLineItem;
end;

function TXMLInvoiceLineItemList.Insert(const Index: Integer): IXMLInvoiceLineItem;
begin
  Result := AddItem(Index) as IXMLInvoiceLineItem;
end;

function TXMLInvoiceLineItemList.Get_Item(Index: Integer): IXMLInvoiceLineItem;
begin
  Result := List[Index] as IXMLInvoiceLineItem;
end;

{ TXMLPurchaseOrderInformation }

procedure TXMLPurchaseOrderInformation.AfterConstruction;
begin
  RegisterChildNode('PurchaseOrderIssuedDate', TXMLDateTimeBasis);
  RegisterChildNode('PurchaseOrderReference', TXMLPurchaseOrderReference);
  RegisterChildNode('ServiceLevel', TXMLServiceLevel);
  FOrderTitle := CreateCollection(TXMLS255List, IXMLNode, 'OrderTitle') as IXMLS255List;
  FPurchaseOrderReference := CreateCollection(TXMLPurchaseOrderReferenceList, IXMLPurchaseOrderReference, 'PurchaseOrderReference') as IXMLPurchaseOrderReferenceList;
  FServiceLevel := CreateCollection(TXMLServiceLevelList, IXMLServiceLevel, 'ServiceLevel') as IXMLServiceLevelList;
  inherited;
end;

function TXMLPurchaseOrderInformation.Get_PurchaseOrderNumber: UnicodeString;
begin
  Result := ChildNodes['PurchaseOrderNumber'].Text;
end;

procedure TXMLPurchaseOrderInformation.Set_PurchaseOrderNumber(Value: UnicodeString);
begin
  ChildNodes['PurchaseOrderNumber'].NodeValue := Value;
end;

function TXMLPurchaseOrderInformation.Get_PurchaseOrderReleaseNumber: UnicodeString;
begin
  Result := ChildNodes['PurchaseOrderReleaseNumber'].Text;
end;

procedure TXMLPurchaseOrderInformation.Set_PurchaseOrderReleaseNumber(Value: UnicodeString);
begin
  ChildNodes['PurchaseOrderReleaseNumber'].NodeValue := Value;
end;

function TXMLPurchaseOrderInformation.Get_PurchaseOrderIssuedDate: IXMLDateTimeBasis;
begin
  Result := ChildNodes['PurchaseOrderIssuedDate'] as IXMLDateTimeBasis;
end;

function TXMLPurchaseOrderInformation.Get_OrderTitle: IXMLS255List;
begin
  Result := FOrderTitle;
end;

function TXMLPurchaseOrderInformation.Get_PurchaseOrderReference: IXMLPurchaseOrderReferenceList;
begin
  Result := FPurchaseOrderReference;
end;

function TXMLPurchaseOrderInformation.Get_ServiceLevel: IXMLServiceLevelList;
begin
  Result := FServiceLevel;
end;

{ TXMLDateTimeBasis }

procedure TXMLDateTimeBasis.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDateTimeBasis.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDateTimeBasis.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDateTimeBasis.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLPurchaseOrderReference }

function TXMLPurchaseOrderReference.Get_PurchaseOrderReferenceType: UnicodeString;
begin
  Result := AttributeNodes['PurchaseOrderReferenceType'].Text;
end;

procedure TXMLPurchaseOrderReference.Set_PurchaseOrderReferenceType(Value: UnicodeString);
begin
  SetAttribute('PurchaseOrderReferenceType', Value);
end;

function TXMLPurchaseOrderReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLPurchaseOrderReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLPurchaseOrderReferenceList }

function TXMLPurchaseOrderReferenceList.Add: IXMLPurchaseOrderReference;
begin
  Result := AddItem(-1) as IXMLPurchaseOrderReference;
end;

function TXMLPurchaseOrderReferenceList.Insert(const Index: Integer): IXMLPurchaseOrderReference;
begin
  Result := AddItem(Index) as IXMLPurchaseOrderReference;
end;

function TXMLPurchaseOrderReferenceList.Get_Item(Index: Integer): IXMLPurchaseOrderReference;
begin
  Result := List[Index] as IXMLPurchaseOrderReference;
end;

{ TXMLChargeOrAllowance }

function TXMLChargeOrAllowance.Get_ChargeOrAllowanceType: UnicodeString;
begin
  Result := AttributeNodes['ChargeOrAllowanceType'].Text;
end;

procedure TXMLChargeOrAllowance.Set_ChargeOrAllowanceType(Value: UnicodeString);
begin
  SetAttribute('ChargeOrAllowanceType', Value);
end;

{ TXMLProductClass }

procedure TXMLProductClass.AfterConstruction;
begin
  RegisterChildNode('ProductIdentifier', TXMLProductIdentifier);
  RegisterChildNode('ProductDescription', TXMLProductDescription);
  RegisterChildNode('Classification', TXMLClassification);
  RegisterChildNode('ProductReference', TXMLProductReference);
  RegisterChildNode('BookManufacturing', TXMLBookManufacturing);
  RegisterChildNode('ForestWood', TXMLForestWood);
  RegisterChildNode('LabelStock', TXMLLabelStock);
  RegisterChildNode('Paper', TXMLPaper);
  RegisterChildNode('Pulp', TXMLPulpClass);
  RegisterChildNode('RecoveredPaper', TXMLRecoveredPaper);
  RegisterChildNode('VirginFibre', TXMLVirginFibre);
  RegisterChildNode('WoodProducts', TXMLWoodProducts);
  RegisterChildNode('OtherProducts', TXMLOtherProducts);
  FProductIdentifier := CreateCollection(TXMLProductIdentifierList, IXMLProductIdentifier, 'ProductIdentifier') as IXMLProductIdentifierList;
  FProductDescription := CreateCollection(TXMLProductDescriptionList, IXMLProductDescription, 'ProductDescription') as IXMLProductDescriptionList;
  FClassification := CreateCollection(TXMLClassificationList, IXMLClassification, 'Classification') as IXMLClassificationList;
  FProductReference := CreateCollection(TXMLProductReferenceList, IXMLProductReference, 'ProductReference') as IXMLProductReferenceList;
  inherited;
end;

function TXMLProductClass.Get_ProductIdentifier: IXMLProductIdentifierList;
begin
  Result := FProductIdentifier;
end;

function TXMLProductClass.Get_ProductDescription: IXMLProductDescriptionList;
begin
  Result := FProductDescription;
end;

function TXMLProductClass.Get_Classification: IXMLClassificationList;
begin
  Result := FClassification;
end;

function TXMLProductClass.Get_ProductReference: IXMLProductReferenceList;
begin
  Result := FProductReference;
end;

function TXMLProductClass.Get_BookManufacturing: IXMLBookManufacturing;
begin
  Result := ChildNodes['BookManufacturing'] as IXMLBookManufacturing;
end;

function TXMLProductClass.Get_ForestWood: IXMLForestWood;
begin
  Result := ChildNodes['ForestWood'] as IXMLForestWood;
end;

function TXMLProductClass.Get_LabelStock: IXMLLabelStock;
begin
  Result := ChildNodes['LabelStock'] as IXMLLabelStock;
end;

function TXMLProductClass.Get_Paper: IXMLPaper;
begin
  Result := ChildNodes['Paper'] as IXMLPaper;
end;

function TXMLProductClass.Get_Pulp: IXMLPulpClass;
begin
  Result := ChildNodes['Pulp'] as IXMLPulpClass;
end;

function TXMLProductClass.Get_RecoveredPaper: IXMLRecoveredPaper;
begin
  Result := ChildNodes['RecoveredPaper'] as IXMLRecoveredPaper;
end;

function TXMLProductClass.Get_VirginFibre: IXMLVirginFibre;
begin
  Result := ChildNodes['VirginFibre'] as IXMLVirginFibre;
end;

function TXMLProductClass.Get_WoodProducts: IXMLWoodProducts;
begin
  Result := ChildNodes['WoodProducts'] as IXMLWoodProducts;
end;

function TXMLProductClass.Get_OtherProducts: IXMLOtherProducts;
begin
  Result := ChildNodes['OtherProducts'] as IXMLOtherProducts;
end;

{ TXMLProductIdentifier }

function TXMLProductIdentifier.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLProductIdentifier.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

function TXMLProductIdentifier.Get_ProductIdentifierType: UnicodeString;
begin
  Result := AttributeNodes['ProductIdentifierType'].Text;
end;

procedure TXMLProductIdentifier.Set_ProductIdentifierType(Value: UnicodeString);
begin
  SetAttribute('ProductIdentifierType', Value);
end;

{ TXMLProductIdentifierList }

function TXMLProductIdentifierList.Add: IXMLProductIdentifier;
begin
  Result := AddItem(-1) as IXMLProductIdentifier;
end;

function TXMLProductIdentifierList.Insert(const Index: Integer): IXMLProductIdentifier;
begin
  Result := AddItem(Index) as IXMLProductIdentifier;
end;

function TXMLProductIdentifierList.Get_Item(Index: Integer): IXMLProductIdentifier;
begin
  Result := List[Index] as IXMLProductIdentifier;
end;

{ TXMLProductDescription }

function TXMLProductDescription.Get_Language: UnicodeString;
begin
  Result := AttributeNodes['Language'].Text;
end;

procedure TXMLProductDescription.Set_Language(Value: UnicodeString);
begin
  SetAttribute('Language', Value);
end;

{ TXMLProductDescriptionList }

function TXMLProductDescriptionList.Add: IXMLProductDescription;
begin
  Result := AddItem(-1) as IXMLProductDescription;
end;

function TXMLProductDescriptionList.Insert(const Index: Integer): IXMLProductDescription;
begin
  Result := AddItem(Index) as IXMLProductDescription;
end;

function TXMLProductDescriptionList.Get_Item(Index: Integer): IXMLProductDescription;
begin
  Result := List[Index] as IXMLProductDescription;
end;

{ TXMLClassification }

procedure TXMLClassification.AfterConstruction;
begin
  RegisterChildNode('ClassificationCode', TXMLClassificationCode);
  FClassificationDescription := CreateCollection(TXMLS255List, IXMLNode, 'ClassificationDescription') as IXMLS255List;
  inherited;
end;

function TXMLClassification.Get_ClassificationCode: IXMLClassificationCode;
begin
  Result := ChildNodes['ClassificationCode'] as IXMLClassificationCode;
end;

function TXMLClassification.Get_ClassificationDescription: IXMLS255List;
begin
  Result := FClassificationDescription;
end;

{ TXMLClassificationList }

function TXMLClassificationList.Add: IXMLClassification;
begin
  Result := AddItem(-1) as IXMLClassification;
end;

function TXMLClassificationList.Insert(const Index: Integer): IXMLClassification;
begin
  Result := AddItem(Index) as IXMLClassification;
end;

function TXMLClassificationList.Get_Item(Index: Integer): IXMLClassification;
begin
  Result := List[Index] as IXMLClassification;
end;

{ TXMLClassificationCode }

function TXMLClassificationCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLClassificationCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

function TXMLClassificationCode.Get_ClassificationCodeType: UnicodeString;
begin
  Result := AttributeNodes['ClassificationCodeType'].Text;
end;

procedure TXMLClassificationCode.Set_ClassificationCodeType(Value: UnicodeString);
begin
  SetAttribute('ClassificationCodeType', Value);
end;

{ TXMLProductReference }

function TXMLProductReference.Get_ProductReferenceType: UnicodeString;
begin
  Result := AttributeNodes['ProductReferenceType'].Text;
end;

procedure TXMLProductReference.Set_ProductReferenceType(Value: UnicodeString);
begin
  SetAttribute('ProductReferenceType', Value);
end;

function TXMLProductReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLProductReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLProductReferenceList }

function TXMLProductReferenceList.Add: IXMLProductReference;
begin
  Result := AddItem(-1) as IXMLProductReference;
end;

function TXMLProductReferenceList.Insert(const Index: Integer): IXMLProductReference;
begin
  Result := AddItem(Index) as IXMLProductReference;
end;

function TXMLProductReferenceList.Get_Item(Index: Integer): IXMLProductReference;
begin
  Result := List[Index] as IXMLProductReference;
end;

{ TXMLBookManufacturing }

procedure TXMLBookManufacturing.AfterConstruction;
begin
  RegisterChildNode('BookClassification', TXMLBookClassification);
  RegisterChildNode('ProofInformationalQuantity', TXMLProofInformationalQuantity);
  RegisterChildNode('PrepInformation', TXMLPrepInformation);
  RegisterChildNode('SuppliedComponentInformation', TXMLSuppliedComponentInformation);
  RegisterChildNode('PackagingCharacteristics', TXMLPackagingCharacteristics);
  FBookClassification := CreateCollection(TXMLBookClassificationList, IXMLBookClassification, 'BookClassification') as IXMLBookClassificationList;
  FProofInformationalQuantity := CreateCollection(TXMLProofInformationalQuantityList, IXMLProofInformationalQuantity, 'ProofInformationalQuantity') as IXMLProofInformationalQuantityList;
  FPrepInformation := CreateCollection(TXMLPrepInformationList, IXMLPrepInformation, 'PrepInformation') as IXMLPrepInformationList;
  FSuppliedComponentInformation := CreateCollection(TXMLSuppliedComponentInformationList, IXMLSuppliedComponentInformation, 'SuppliedComponentInformation') as IXMLSuppliedComponentInformationList;
  FPackagingCharacteristics := CreateCollection(TXMLPackagingCharacteristicsList, IXMLPackagingCharacteristics, 'PackagingCharacteristics') as IXMLPackagingCharacteristicsList;
  inherited;
end;

function TXMLBookManufacturing.Get_BookClassification: IXMLBookClassificationList;
begin
  Result := FBookClassification;
end;

function TXMLBookManufacturing.Get_ProofInformationalQuantity: IXMLProofInformationalQuantityList;
begin
  Result := FProofInformationalQuantity;
end;

function TXMLBookManufacturing.Get_PrepInformation: IXMLPrepInformationList;
begin
  Result := FPrepInformation;
end;

function TXMLBookManufacturing.Get_SuppliedComponentInformation: IXMLSuppliedComponentInformationList;
begin
  Result := FSuppliedComponentInformation;
end;

function TXMLBookManufacturing.Get_PackagingCharacteristics: IXMLPackagingCharacteristicsList;
begin
  Result := FPackagingCharacteristics;
end;

{ TXMLBookClassification }

procedure TXMLBookClassification.AfterConstruction;
begin
  RegisterChildNode('BookSubClassification', TXMLBookSubClassification);
  FClassificationDescription := CreateCollection(TXMLS255List, IXMLNode, 'ClassificationDescription') as IXMLS255List;
  FBookSubClassification := CreateCollection(TXMLBookSubClassificationList, IXMLBookSubClassification, 'BookSubClassification') as IXMLBookSubClassificationList;
  inherited;
end;

function TXMLBookClassification.Get_BookClassificationType: UnicodeString;
begin
  Result := AttributeNodes['BookClassificationType'].Text;
end;

procedure TXMLBookClassification.Set_BookClassificationType(Value: UnicodeString);
begin
  SetAttribute('BookClassificationType', Value);
end;

function TXMLBookClassification.Get_ClassificationDescription: IXMLS255List;
begin
  Result := FClassificationDescription;
end;

function TXMLBookClassification.Get_BookSubClassification: IXMLBookSubClassificationList;
begin
  Result := FBookSubClassification;
end;

{ TXMLBookClassificationList }

function TXMLBookClassificationList.Add: IXMLBookClassification;
begin
  Result := AddItem(-1) as IXMLBookClassification;
end;

function TXMLBookClassificationList.Insert(const Index: Integer): IXMLBookClassification;
begin
  Result := AddItem(Index) as IXMLBookClassification;
end;

function TXMLBookClassificationList.Get_Item(Index: Integer): IXMLBookClassification;
begin
  Result := List[Index] as IXMLBookClassification;
end;

{ TXMLBookSubClassification }

procedure TXMLBookSubClassification.AfterConstruction;
begin
  ItemTag := 'ClassificationDescription';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLBookSubClassification.Get_BookSubClassificationType: UnicodeString;
begin
  Result := AttributeNodes['BookSubClassificationType'].Text;
end;

procedure TXMLBookSubClassification.Set_BookSubClassificationType(Value: UnicodeString);
begin
  SetAttribute('BookSubClassificationType', Value);
end;

function TXMLBookSubClassification.Get_ClassificationDescription(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLBookSubClassification.Add(const ClassificationDescription: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := ClassificationDescription;
end;

function TXMLBookSubClassification.Insert(const Index: Integer; const ClassificationDescription: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := ClassificationDescription;
end;

{ TXMLBookSubClassificationList }

function TXMLBookSubClassificationList.Add: IXMLBookSubClassification;
begin
  Result := AddItem(-1) as IXMLBookSubClassification;
end;

function TXMLBookSubClassificationList.Insert(const Index: Integer): IXMLBookSubClassification;
begin
  Result := AddItem(Index) as IXMLBookSubClassification;
end;

function TXMLBookSubClassificationList.Get_Item(Index: Integer): IXMLBookSubClassification;
begin
  Result := List[Index] as IXMLBookSubClassification;
end;

{ TXMLProofInformationalQuantity }

procedure TXMLProofInformationalQuantity.AfterConstruction;
begin
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('ProofApprovalDate', TXMLProofApprovalDate);
  RegisterChildNode('ProofDueDate', TXMLProofDueDate);
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLProofInformationalQuantity.Get_ProofType: UnicodeString;
begin
  Result := AttributeNodes['ProofType'].Text;
end;

procedure TXMLProofInformationalQuantity.Set_ProofType(Value: UnicodeString);
begin
  SetAttribute('ProofType', Value);
end;

function TXMLProofInformationalQuantity.Get_ProofColourType: UnicodeString;
begin
  Result := AttributeNodes['ProofColourType'].Text;
end;

procedure TXMLProofInformationalQuantity.Set_ProofColourType(Value: UnicodeString);
begin
  SetAttribute('ProofColourType', Value);
end;

function TXMLProofInformationalQuantity.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLProofInformationalQuantity.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLProofInformationalQuantity.Get_OtherParty: IXMLTypedParty;
begin
  Result := ChildNodes['OtherParty'] as IXMLTypedParty;
end;

function TXMLProofInformationalQuantity.Get_ProofApprovalDate: IXMLProofApprovalDate;
begin
  Result := ChildNodes['ProofApprovalDate'] as IXMLProofApprovalDate;
end;

function TXMLProofInformationalQuantity.Get_ProofDueDate: IXMLProofDueDate;
begin
  Result := ChildNodes['ProofDueDate'] as IXMLProofDueDate;
end;

function TXMLProofInformationalQuantity.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLProofInformationalQuantityList }

function TXMLProofInformationalQuantityList.Add: IXMLProofInformationalQuantity;
begin
  Result := AddItem(-1) as IXMLProofInformationalQuantity;
end;

function TXMLProofInformationalQuantityList.Insert(const Index: Integer): IXMLProofInformationalQuantity;
begin
  Result := AddItem(Index) as IXMLProofInformationalQuantity;
end;

function TXMLProofInformationalQuantityList.Get_Item(Index: Integer): IXMLProofInformationalQuantity;
begin
  Result := List[Index] as IXMLProofInformationalQuantity;
end;

{ TXMLProofApprovalDate }

procedure TXMLProofApprovalDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLProofApprovalDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLProofApprovalDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLProofApprovalDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLProofDueDate }

procedure TXMLProofDueDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLProofDueDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLProofDueDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLProofDueDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLPrepInformation }

procedure TXMLPrepInformation.AfterConstruction;
begin
  RegisterChildNode('SupplierParty', TXMLParty);
  RegisterChildNode('PrepShipDate', TXMLDateTimeBasis);
  RegisterChildNode('PrepDueDate', TXMLDateTimeBasis);
  RegisterChildNode('PrepNeededDate', TXMLDateTimeBasis);
  RegisterChildNode('PrepReference', TXMLPrepReference);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  FPrepReference := CreateCollection(TXMLPrepReferenceList, IXMLPrepReference, 'PrepReference') as IXMLPrepReferenceList;
  inherited;
end;

function TXMLPrepInformation.Get_PrepType: UnicodeString;
begin
  Result := AttributeNodes['PrepType'].Text;
end;

procedure TXMLPrepInformation.Set_PrepType(Value: UnicodeString);
begin
  SetAttribute('PrepType', Value);
end;

function TXMLPrepInformation.Get_SupplierParty: IXMLParty;
begin
  Result := ChildNodes['SupplierParty'] as IXMLParty;
end;

function TXMLPrepInformation.Get_PrepShipDate: IXMLDateTimeBasis;
begin
  Result := ChildNodes['PrepShipDate'] as IXMLDateTimeBasis;
end;

function TXMLPrepInformation.Get_PrepDueDate: IXMLDateTimeBasis;
begin
  Result := ChildNodes['PrepDueDate'] as IXMLDateTimeBasis;
end;

function TXMLPrepInformation.Get_PrepNeededDate: IXMLDateTimeBasis;
begin
  Result := ChildNodes['PrepNeededDate'] as IXMLDateTimeBasis;
end;

function TXMLPrepInformation.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLPrepInformation.Get_PrepReference: IXMLPrepReferenceList;
begin
  Result := FPrepReference;
end;

{ TXMLPrepInformationList }

function TXMLPrepInformationList.Add: IXMLPrepInformation;
begin
  Result := AddItem(-1) as IXMLPrepInformation;
end;

function TXMLPrepInformationList.Insert(const Index: Integer): IXMLPrepInformation;
begin
  Result := AddItem(Index) as IXMLPrepInformation;
end;

function TXMLPrepInformationList.Get_Item(Index: Integer): IXMLPrepInformation;
begin
  Result := List[Index] as IXMLPrepInformation;
end;

{ TXMLPrepReference }

function TXMLPrepReference.Get_PrepReferenceType: UnicodeString;
begin
  Result := AttributeNodes['PrepReferenceType'].Text;
end;

procedure TXMLPrepReference.Set_PrepReferenceType(Value: UnicodeString);
begin
  SetAttribute('PrepReferenceType', Value);
end;

function TXMLPrepReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLPrepReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLPrepReferenceList }

function TXMLPrepReferenceList.Add: IXMLPrepReference;
begin
  Result := AddItem(-1) as IXMLPrepReference;
end;

function TXMLPrepReferenceList.Insert(const Index: Integer): IXMLPrepReference;
begin
  Result := AddItem(Index) as IXMLPrepReference;
end;

function TXMLPrepReferenceList.Get_Item(Index: Integer): IXMLPrepReference;
begin
  Result := List[Index] as IXMLPrepReference;
end;

{ TXMLSuppliedComponentInformation }

procedure TXMLSuppliedComponentInformation.AfterConstruction;
begin
  RegisterChildNode('SupplierParty', TXMLParty);
  RegisterChildNode('ProductIdentifier', TXMLProductIdentifier);
  RegisterChildNode('ProductDescription', TXMLProductDescription);
  RegisterChildNode('Classification', TXMLClassification);
  RegisterChildNode('BookClassification', TXMLBookClassification);
  RegisterChildNode('Paper', TXMLPaper);
  RegisterChildNode('SuppliedComponentReference', TXMLSuppliedComponentReference);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('ComponentShipDate', TXMLComponentShipDate);
  RegisterChildNode('ComponentDueDate', TXMLComponentDueDate);
  RegisterChildNode('ComponentNeededDate', TXMLComponentNeededDate);
  RegisterChildNode('OrderStatusInformation', TXMLOrderStatusInformation);
  FProductIdentifier := CreateCollection(TXMLProductIdentifierList, IXMLProductIdentifier, 'ProductIdentifier') as IXMLProductIdentifierList;
  FProductDescription := CreateCollection(TXMLProductDescriptionList, IXMLProductDescription, 'ProductDescription') as IXMLProductDescriptionList;
  FClassification := CreateCollection(TXMLClassificationList, IXMLClassification, 'Classification') as IXMLClassificationList;
  FBookClassification := CreateCollection(TXMLBookClassificationList, IXMLBookClassification, 'BookClassification') as IXMLBookClassificationList;
  FSuppliedComponentReference := CreateCollection(TXMLSuppliedComponentReferenceList, IXMLSuppliedComponentReference, 'SuppliedComponentReference') as IXMLSuppliedComponentReferenceList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLSuppliedComponentInformation.Get_SuppliedComponentType: UnicodeString;
begin
  Result := AttributeNodes['SuppliedComponentType'].Text;
end;

procedure TXMLSuppliedComponentInformation.Set_SuppliedComponentType(Value: UnicodeString);
begin
  SetAttribute('SuppliedComponentType', Value);
end;

function TXMLSuppliedComponentInformation.Get_SupplierParty: IXMLParty;
begin
  Result := ChildNodes['SupplierParty'] as IXMLParty;
end;

function TXMLSuppliedComponentInformation.Get_ProductIdentifier: IXMLProductIdentifierList;
begin
  Result := FProductIdentifier;
end;

function TXMLSuppliedComponentInformation.Get_ProductDescription: IXMLProductDescriptionList;
begin
  Result := FProductDescription;
end;

function TXMLSuppliedComponentInformation.Get_Classification: IXMLClassificationList;
begin
  Result := FClassification;
end;

function TXMLSuppliedComponentInformation.Get_BookClassification: IXMLBookClassificationList;
begin
  Result := FBookClassification;
end;

function TXMLSuppliedComponentInformation.Get_Paper: IXMLPaper;
begin
  Result := ChildNodes['Paper'] as IXMLPaper;
end;

function TXMLSuppliedComponentInformation.Get_SuppliedComponentReference: IXMLSuppliedComponentReferenceList;
begin
  Result := FSuppliedComponentReference;
end;

function TXMLSuppliedComponentInformation.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLSuppliedComponentInformation.Get_ComponentShipDate: IXMLComponentShipDate;
begin
  Result := ChildNodes['ComponentShipDate'] as IXMLComponentShipDate;
end;

function TXMLSuppliedComponentInformation.Get_ComponentDueDate: IXMLComponentDueDate;
begin
  Result := ChildNodes['ComponentDueDate'] as IXMLComponentDueDate;
end;

function TXMLSuppliedComponentInformation.Get_ComponentNeededDate: IXMLComponentNeededDate;
begin
  Result := ChildNodes['ComponentNeededDate'] as IXMLComponentNeededDate;
end;

function TXMLSuppliedComponentInformation.Get_OrderStatusInformation: IXMLOrderStatusInformation;
begin
  Result := ChildNodes['OrderStatusInformation'] as IXMLOrderStatusInformation;
end;

function TXMLSuppliedComponentInformation.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLSuppliedComponentInformationList }

function TXMLSuppliedComponentInformationList.Add: IXMLSuppliedComponentInformation;
begin
  Result := AddItem(-1) as IXMLSuppliedComponentInformation;
end;

function TXMLSuppliedComponentInformationList.Insert(const Index: Integer): IXMLSuppliedComponentInformation;
begin
  Result := AddItem(Index) as IXMLSuppliedComponentInformation;
end;

function TXMLSuppliedComponentInformationList.Get_Item(Index: Integer): IXMLSuppliedComponentInformation;
begin
  Result := List[Index] as IXMLSuppliedComponentInformation;
end;

{ TXMLPaper }

procedure TXMLPaper.AfterConstruction;
begin
  RegisterChildNode('PaperCharacteristics', TXMLPaperCharacteristics);
  RegisterChildNode('Reel', TXMLReel);
  RegisterChildNode('Sheet', TXMLSheet);
  inherited;
end;

function TXMLPaper.Get_PaperCharacteristics: IXMLPaperCharacteristics;
begin
  Result := ChildNodes['PaperCharacteristics'] as IXMLPaperCharacteristics;
end;

function TXMLPaper.Get_Reel: IXMLReel;
begin
  Result := ChildNodes['Reel'] as IXMLReel;
end;

function TXMLPaper.Get_Sheet: IXMLSheet;
begin
  Result := ChildNodes['Sheet'] as IXMLSheet;
end;

{ TXMLPaperCharacteristics }

procedure TXMLPaperCharacteristics.AfterConstruction;
begin
  RegisterChildNode('Abrasion', TXMLAbrasion);
  RegisterChildNode('AbsorptionInk', TXMLAbsorptionInk);
  RegisterChildNode('AbsorptionLight', TXMLAbsorptionLight);
  RegisterChildNode('AbsorptionWater', TXMLAbsorptionWater);
  RegisterChildNode('Appearance', TXMLAppearance);
  RegisterChildNode('Ash', TXMLAsh);
  RegisterChildNode('BasisWeight', TXMLBasisWeight);
  RegisterChildNode('BendingResistance', TXMLBendingResistance);
  RegisterChildNode('BendingStiffness', TXMLBendingStiffness);
  RegisterChildNode('Brightness', TXMLBrightness);
  RegisterChildNode('Bulk', TXMLBulk);
  RegisterChildNode('Burst', TXMLBurst);
  RegisterChildNode('BurstIndex', TXMLBurstIndex);
  RegisterChildNode('Caliper', TXMLCaliper);
  RegisterChildNode('CoatWeight', TXMLCoatWeight);
  RegisterChildNode('ColourDetail', TXMLColourDetail);
  RegisterChildNode('Density', TXMLDensity);
  RegisterChildNode('Dirt', TXMLDirt);
  RegisterChildNode('DominantWavelength', TXMLDominantWavelength);
  RegisterChildNode('ExcitationPurity', TXMLExcitationPurity);
  RegisterChildNode('FibreLength', TXMLFibreLength);
  RegisterChildNode('FibreClassification', TXMLFibreClassification);
  RegisterChildNode('Folding', TXMLFolding);
  RegisterChildNode('Formation', TXMLFormation);
  RegisterChildNode('Freeness', TXMLFreeness);
  RegisterChildNode('Friction', TXMLFriction);
  RegisterChildNode('Gloss', TXMLGloss);
  RegisterChildNode('LightScattering', TXMLLightScattering);
  RegisterChildNode('Luminance', TXMLLuminance);
  RegisterChildNode('Moisture', TXMLMoisture);
  RegisterChildNode('Mullen', TXMLMullen);
  RegisterChildNode('Opacity', TXMLOpacity);
  RegisterChildNode('Permeability', TXMLPermeability);
  RegisterChildNode('pH', TXMLPH);
  RegisterChildNode('PlyBond', TXMLPlyBond);
  RegisterChildNode('Porosity', TXMLPorosity);
  RegisterChildNode('PostConsumerWaste', TXMLPostConsumerWaste);
  RegisterChildNode('PPI', TXMLMeasurement);
  RegisterChildNode('PreConsumerWaste', TXMLPreConsumerWaste);
  RegisterChildNode('Recycled', TXMLRecycled);
  RegisterChildNode('Resistance', TXMLResistance);
  RegisterChildNode('RingCrush', TXMLRingCrush);
  RegisterChildNode('Roughness', TXMLRoughness);
  RegisterChildNode('RunnabilityIndex', TXMLRunnabilityIndex);
  RegisterChildNode('ShowThrough', TXMLShowThrough);
  RegisterChildNode('Sizing', TXMLSizing);
  RegisterChildNode('Smoothness', TXMLSmoothness);
  RegisterChildNode('Stiffness', TXMLStiffness);
  RegisterChildNode('Stretch', TXMLStretch);
  RegisterChildNode('SurfaceStrength', TXMLSurfaceStrength);
  RegisterChildNode('TEA', TXMLTEA);
  RegisterChildNode('Tear', TXMLTear);
  RegisterChildNode('TearIndex', TXMLTearIndex);
  RegisterChildNode('Tensile', TXMLTensile);
  RegisterChildNode('TensileIndex', TXMLTensileIndex);
  RegisterChildNode('Whiteness', TXMLWhiteness);
  RegisterChildNode('AdditionalTest', TXMLAdditionalTest);
  RegisterChildNode('PlyAttributes', TXMLPlyAttributes);
  RegisterChildNode('PlySet', TXMLPlySet);
  FAbrasion := CreateCollection(TXMLAbrasionList, IXMLAbrasion, 'Abrasion') as IXMLAbrasionList;
  FAbsorptionInk := CreateCollection(TXMLAbsorptionInkList, IXMLAbsorptionInk, 'AbsorptionInk') as IXMLAbsorptionInkList;
  FAbsorptionLight := CreateCollection(TXMLAbsorptionLightList, IXMLAbsorptionLight, 'AbsorptionLight') as IXMLAbsorptionLightList;
  FAbsorptionWater := CreateCollection(TXMLAbsorptionWaterList, IXMLAbsorptionWater, 'AbsorptionWater') as IXMLAbsorptionWaterList;
  FAppearance := CreateCollection(TXMLAppearanceList, IXMLAppearance, 'Appearance') as IXMLAppearanceList;
  FAsh := CreateCollection(TXMLAshList, IXMLAsh, 'Ash') as IXMLAshList;
  FBasisWeight := CreateCollection(TXMLBasisWeightList, IXMLBasisWeight, 'BasisWeight') as IXMLBasisWeightList;
  FBendingResistance := CreateCollection(TXMLBendingResistanceList, IXMLBendingResistance, 'BendingResistance') as IXMLBendingResistanceList;
  FBendingStiffness := CreateCollection(TXMLBendingStiffnessList, IXMLBendingStiffness, 'BendingStiffness') as IXMLBendingStiffnessList;
  FBrightness := CreateCollection(TXMLBrightnessList, IXMLBrightness, 'Brightness') as IXMLBrightnessList;
  FBulk := CreateCollection(TXMLBulkList, IXMLBulk, 'Bulk') as IXMLBulkList;
  FBurst := CreateCollection(TXMLBurstList, IXMLBurst, 'Burst') as IXMLBurstList;
  FBurstIndex := CreateCollection(TXMLBurstIndexList, IXMLBurstIndex, 'BurstIndex') as IXMLBurstIndexList;
  FCaliper := CreateCollection(TXMLCaliperList, IXMLCaliper, 'Caliper') as IXMLCaliperList;
  FCoatWeight := CreateCollection(TXMLCoatWeightList, IXMLCoatWeight, 'CoatWeight') as IXMLCoatWeightList;
  FColourDetail := CreateCollection(TXMLColourDetailList, IXMLColourDetail, 'ColourDetail') as IXMLColourDetailList;
  FDensity := CreateCollection(TXMLDensityList, IXMLDensity, 'Density') as IXMLDensityList;
  FDirt := CreateCollection(TXMLDirtList, IXMLDirt, 'Dirt') as IXMLDirtList;
  FDominantWavelength := CreateCollection(TXMLDominantWavelengthList, IXMLDominantWavelength, 'DominantWavelength') as IXMLDominantWavelengthList;
  FExcitationPurity := CreateCollection(TXMLExcitationPurityList, IXMLExcitationPurity, 'ExcitationPurity') as IXMLExcitationPurityList;
  FFibreLength := CreateCollection(TXMLFibreLengthList, IXMLFibreLength, 'FibreLength') as IXMLFibreLengthList;
  FFibreClassification := CreateCollection(TXMLFibreClassificationList, IXMLFibreClassification, 'FibreClassification') as IXMLFibreClassificationList;
  FFolding := CreateCollection(TXMLFoldingList, IXMLFolding, 'Folding') as IXMLFoldingList;
  FFormation := CreateCollection(TXMLFormationList, IXMLFormation, 'Formation') as IXMLFormationList;
  FFreeness := CreateCollection(TXMLFreenessList, IXMLFreeness, 'Freeness') as IXMLFreenessList;
  FFriction := CreateCollection(TXMLFrictionList, IXMLFriction, 'Friction') as IXMLFrictionList;
  FGloss := CreateCollection(TXMLGlossList, IXMLGloss, 'Gloss') as IXMLGlossList;
  FLightScattering := CreateCollection(TXMLLightScatteringList, IXMLLightScattering, 'LightScattering') as IXMLLightScatteringList;
  FLuminance := CreateCollection(TXMLLuminanceList, IXMLLuminance, 'Luminance') as IXMLLuminanceList;
  FMoisture := CreateCollection(TXMLMoistureList, IXMLMoisture, 'Moisture') as IXMLMoistureList;
  FMullen := CreateCollection(TXMLMullenList, IXMLMullen, 'Mullen') as IXMLMullenList;
  FOpacity := CreateCollection(TXMLOpacityList, IXMLOpacity, 'Opacity') as IXMLOpacityList;
  FPermeability := CreateCollection(TXMLPermeabilityList, IXMLPermeability, 'Permeability') as IXMLPermeabilityList;
  FPH := CreateCollection(TXMLPHList, IXMLPH, 'pH') as IXMLPHList;
  FPlyBond := CreateCollection(TXMLPlyBondList, IXMLPlyBond, 'PlyBond') as IXMLPlyBondList;
  FPorosity := CreateCollection(TXMLPorosityList, IXMLPorosity, 'Porosity') as IXMLPorosityList;
  FPostConsumerWaste := CreateCollection(TXMLPostConsumerWasteList, IXMLPostConsumerWaste, 'PostConsumerWaste') as IXMLPostConsumerWasteList;
  FPPI := CreateCollection(TXMLMeasurementList, IXMLMeasurement, 'PPI') as IXMLMeasurementList;
  FPreConsumerWaste := CreateCollection(TXMLPreConsumerWasteList, IXMLPreConsumerWaste, 'PreConsumerWaste') as IXMLPreConsumerWasteList;
  FRecycled := CreateCollection(TXMLRecycledList, IXMLRecycled, 'Recycled') as IXMLRecycledList;
  FResistance := CreateCollection(TXMLResistanceList, IXMLResistance, 'Resistance') as IXMLResistanceList;
  FRingCrush := CreateCollection(TXMLRingCrushList, IXMLRingCrush, 'RingCrush') as IXMLRingCrushList;
  FRoughness := CreateCollection(TXMLRoughnessList, IXMLRoughness, 'Roughness') as IXMLRoughnessList;
  FRunnabilityIndex := CreateCollection(TXMLRunnabilityIndexList, IXMLRunnabilityIndex, 'RunnabilityIndex') as IXMLRunnabilityIndexList;
  FShowThrough := CreateCollection(TXMLShowThroughList, IXMLShowThrough, 'ShowThrough') as IXMLShowThroughList;
  FSizing := CreateCollection(TXMLSizingList, IXMLSizing, 'Sizing') as IXMLSizingList;
  FSmoothness := CreateCollection(TXMLSmoothnessList, IXMLSmoothness, 'Smoothness') as IXMLSmoothnessList;
  FStiffness := CreateCollection(TXMLStiffnessList, IXMLStiffness, 'Stiffness') as IXMLStiffnessList;
  FStretch := CreateCollection(TXMLStretchList, IXMLStretch, 'Stretch') as IXMLStretchList;
  FSurfaceStrength := CreateCollection(TXMLSurfaceStrengthList, IXMLSurfaceStrength, 'SurfaceStrength') as IXMLSurfaceStrengthList;
  FTEA := CreateCollection(TXMLTEAList, IXMLTEA, 'TEA') as IXMLTEAList;
  FTear := CreateCollection(TXMLTearList, IXMLTear, 'Tear') as IXMLTearList;
  FTearIndex := CreateCollection(TXMLTearIndexList, IXMLTearIndex, 'TearIndex') as IXMLTearIndexList;
  FTensile := CreateCollection(TXMLTensileList, IXMLTensile, 'Tensile') as IXMLTensileList;
  FTensileIndex := CreateCollection(TXMLTensileIndexList, IXMLTensileIndex, 'TensileIndex') as IXMLTensileIndexList;
  FWhiteness := CreateCollection(TXMLWhitenessList, IXMLWhiteness, 'Whiteness') as IXMLWhitenessList;
  FNumberOfPlies := CreateCollection(TXMLNni1List, IXMLNode, 'NumberOfPlies') as IXMLNni1List;
  FPlyAttributes := CreateCollection(TXMLPlyAttributesList, IXMLPlyAttributes, 'PlyAttributes') as IXMLPlyAttributesList;
  FPlySet := CreateCollection(TXMLPlySetList, IXMLPlySet, 'PlySet') as IXMLPlySetList;
  inherited;
end;

function TXMLPaperCharacteristics.Get_CoatingTop: UnicodeString;
begin
  Result := AttributeNodes['CoatingTop'].Text;
end;

procedure TXMLPaperCharacteristics.Set_CoatingTop(Value: UnicodeString);
begin
  SetAttribute('CoatingTop', Value);
end;

function TXMLPaperCharacteristics.Get_CoatingBottom: UnicodeString;
begin
  Result := AttributeNodes['CoatingBottom'].Text;
end;

procedure TXMLPaperCharacteristics.Set_CoatingBottom(Value: UnicodeString);
begin
  SetAttribute('CoatingBottom', Value);
end;

function TXMLPaperCharacteristics.Get_FinishType: UnicodeString;
begin
  Result := AttributeNodes['FinishType'].Text;
end;

procedure TXMLPaperCharacteristics.Set_FinishType(Value: UnicodeString);
begin
  SetAttribute('FinishType', Value);
end;

function TXMLPaperCharacteristics.Get_PrintType: UnicodeString;
begin
  Result := AttributeNodes['PrintType'].Text;
end;

procedure TXMLPaperCharacteristics.Set_PrintType(Value: UnicodeString);
begin
  SetAttribute('PrintType', Value);
end;

function TXMLPaperCharacteristics.Get_Abrasion: IXMLAbrasionList;
begin
  Result := FAbrasion;
end;

function TXMLPaperCharacteristics.Get_AbsorptionInk: IXMLAbsorptionInkList;
begin
  Result := FAbsorptionInk;
end;

function TXMLPaperCharacteristics.Get_AbsorptionLight: IXMLAbsorptionLightList;
begin
  Result := FAbsorptionLight;
end;

function TXMLPaperCharacteristics.Get_AbsorptionWater: IXMLAbsorptionWaterList;
begin
  Result := FAbsorptionWater;
end;

function TXMLPaperCharacteristics.Get_Appearance: IXMLAppearanceList;
begin
  Result := FAppearance;
end;

function TXMLPaperCharacteristics.Get_Ash: IXMLAshList;
begin
  Result := FAsh;
end;

function TXMLPaperCharacteristics.Get_BasisWeight: IXMLBasisWeightList;
begin
  Result := FBasisWeight;
end;

function TXMLPaperCharacteristics.Get_BendingResistance: IXMLBendingResistanceList;
begin
  Result := FBendingResistance;
end;

function TXMLPaperCharacteristics.Get_BendingStiffness: IXMLBendingStiffnessList;
begin
  Result := FBendingStiffness;
end;

function TXMLPaperCharacteristics.Get_Brightness: IXMLBrightnessList;
begin
  Result := FBrightness;
end;

function TXMLPaperCharacteristics.Get_Bulk: IXMLBulkList;
begin
  Result := FBulk;
end;

function TXMLPaperCharacteristics.Get_Burst: IXMLBurstList;
begin
  Result := FBurst;
end;

function TXMLPaperCharacteristics.Get_BurstIndex: IXMLBurstIndexList;
begin
  Result := FBurstIndex;
end;

function TXMLPaperCharacteristics.Get_Caliper: IXMLCaliperList;
begin
  Result := FCaliper;
end;

function TXMLPaperCharacteristics.Get_CoatWeight: IXMLCoatWeightList;
begin
  Result := FCoatWeight;
end;

function TXMLPaperCharacteristics.Get_ColourDetail: IXMLColourDetailList;
begin
  Result := FColourDetail;
end;

function TXMLPaperCharacteristics.Get_Density: IXMLDensityList;
begin
  Result := FDensity;
end;

function TXMLPaperCharacteristics.Get_Dirt: IXMLDirtList;
begin
  Result := FDirt;
end;

function TXMLPaperCharacteristics.Get_DominantWavelength: IXMLDominantWavelengthList;
begin
  Result := FDominantWavelength;
end;

function TXMLPaperCharacteristics.Get_ExcitationPurity: IXMLExcitationPurityList;
begin
  Result := FExcitationPurity;
end;

function TXMLPaperCharacteristics.Get_FibreLength: IXMLFibreLengthList;
begin
  Result := FFibreLength;
end;

function TXMLPaperCharacteristics.Get_FibreClassification: IXMLFibreClassificationList;
begin
  Result := FFibreClassification;
end;

function TXMLPaperCharacteristics.Get_Folding: IXMLFoldingList;
begin
  Result := FFolding;
end;

function TXMLPaperCharacteristics.Get_Formation: IXMLFormationList;
begin
  Result := FFormation;
end;

function TXMLPaperCharacteristics.Get_Freeness: IXMLFreenessList;
begin
  Result := FFreeness;
end;

function TXMLPaperCharacteristics.Get_Friction: IXMLFrictionList;
begin
  Result := FFriction;
end;

function TXMLPaperCharacteristics.Get_Gloss: IXMLGlossList;
begin
  Result := FGloss;
end;

function TXMLPaperCharacteristics.Get_LightScattering: IXMLLightScatteringList;
begin
  Result := FLightScattering;
end;

function TXMLPaperCharacteristics.Get_Luminance: IXMLLuminanceList;
begin
  Result := FLuminance;
end;

function TXMLPaperCharacteristics.Get_Moisture: IXMLMoistureList;
begin
  Result := FMoisture;
end;

function TXMLPaperCharacteristics.Get_Mullen: IXMLMullenList;
begin
  Result := FMullen;
end;

function TXMLPaperCharacteristics.Get_Opacity: IXMLOpacityList;
begin
  Result := FOpacity;
end;

function TXMLPaperCharacteristics.Get_Permeability: IXMLPermeabilityList;
begin
  Result := FPermeability;
end;

function TXMLPaperCharacteristics.Get_PH: IXMLPHList;
begin
  Result := FPH;
end;

function TXMLPaperCharacteristics.Get_PlyBond: IXMLPlyBondList;
begin
  Result := FPlyBond;
end;

function TXMLPaperCharacteristics.Get_Porosity: IXMLPorosityList;
begin
  Result := FPorosity;
end;

function TXMLPaperCharacteristics.Get_PostConsumerWaste: IXMLPostConsumerWasteList;
begin
  Result := FPostConsumerWaste;
end;

function TXMLPaperCharacteristics.Get_PPI: IXMLMeasurementList;
begin
  Result := FPPI;
end;

function TXMLPaperCharacteristics.Get_PreConsumerWaste: IXMLPreConsumerWasteList;
begin
  Result := FPreConsumerWaste;
end;

function TXMLPaperCharacteristics.Get_Recycled: IXMLRecycledList;
begin
  Result := FRecycled;
end;

function TXMLPaperCharacteristics.Get_Resistance: IXMLResistanceList;
begin
  Result := FResistance;
end;

function TXMLPaperCharacteristics.Get_RingCrush: IXMLRingCrushList;
begin
  Result := FRingCrush;
end;

function TXMLPaperCharacteristics.Get_Roughness: IXMLRoughnessList;
begin
  Result := FRoughness;
end;

function TXMLPaperCharacteristics.Get_RunnabilityIndex: IXMLRunnabilityIndexList;
begin
  Result := FRunnabilityIndex;
end;

function TXMLPaperCharacteristics.Get_ShowThrough: IXMLShowThroughList;
begin
  Result := FShowThrough;
end;

function TXMLPaperCharacteristics.Get_Sizing: IXMLSizingList;
begin
  Result := FSizing;
end;

function TXMLPaperCharacteristics.Get_Smoothness: IXMLSmoothnessList;
begin
  Result := FSmoothness;
end;

function TXMLPaperCharacteristics.Get_Stiffness: IXMLStiffnessList;
begin
  Result := FStiffness;
end;

function TXMLPaperCharacteristics.Get_Stretch: IXMLStretchList;
begin
  Result := FStretch;
end;

function TXMLPaperCharacteristics.Get_SurfaceStrength: IXMLSurfaceStrengthList;
begin
  Result := FSurfaceStrength;
end;

function TXMLPaperCharacteristics.Get_TEA: IXMLTEAList;
begin
  Result := FTEA;
end;

function TXMLPaperCharacteristics.Get_Tear: IXMLTearList;
begin
  Result := FTear;
end;

function TXMLPaperCharacteristics.Get_TearIndex: IXMLTearIndexList;
begin
  Result := FTearIndex;
end;

function TXMLPaperCharacteristics.Get_Tensile: IXMLTensileList;
begin
  Result := FTensile;
end;

function TXMLPaperCharacteristics.Get_TensileIndex: IXMLTensileIndexList;
begin
  Result := FTensileIndex;
end;

function TXMLPaperCharacteristics.Get_Whiteness: IXMLWhitenessList;
begin
  Result := FWhiteness;
end;

function TXMLPaperCharacteristics.Get_AdditionalTest: IXMLAdditionalTest;
begin
  Result := ChildNodes['AdditionalTest'] as IXMLAdditionalTest;
end;

function TXMLPaperCharacteristics.Get_NumberOfPlies: IXMLNni1List;
begin
  Result := FNumberOfPlies;
end;

function TXMLPaperCharacteristics.Get_PlyAttributes: IXMLPlyAttributesList;
begin
  Result := FPlyAttributes;
end;

function TXMLPaperCharacteristics.Get_PlySet: IXMLPlySetList;
begin
  Result := FPlySet;
end;

{ TXMLAbrasion }

function TXMLAbrasion.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLAbrasion.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLAbrasion.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLAbrasion.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLAbrasion.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLAbrasion.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLAbrasion.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLAbrasion.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLAbrasionList }

function TXMLAbrasionList.Add: IXMLAbrasion;
begin
  Result := AddItem(-1) as IXMLAbrasion;
end;

function TXMLAbrasionList.Insert(const Index: Integer): IXMLAbrasion;
begin
  Result := AddItem(Index) as IXMLAbrasion;
end;

function TXMLAbrasionList.Get_Item(Index: Integer): IXMLAbrasion;
begin
  Result := List[Index] as IXMLAbrasion;
end;

{ TXMLAbsorptionInk }

function TXMLAbsorptionInk.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLAbsorptionInk.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLAbsorptionInk.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLAbsorptionInk.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLAbsorptionInk.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLAbsorptionInk.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLAbsorptionInk.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLAbsorptionInk.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLAbsorptionInkList }

function TXMLAbsorptionInkList.Add: IXMLAbsorptionInk;
begin
  Result := AddItem(-1) as IXMLAbsorptionInk;
end;

function TXMLAbsorptionInkList.Insert(const Index: Integer): IXMLAbsorptionInk;
begin
  Result := AddItem(Index) as IXMLAbsorptionInk;
end;

function TXMLAbsorptionInkList.Get_Item(Index: Integer): IXMLAbsorptionInk;
begin
  Result := List[Index] as IXMLAbsorptionInk;
end;

{ TXMLAbsorptionLight }

function TXMLAbsorptionLight.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLAbsorptionLight.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLAbsorptionLight.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLAbsorptionLight.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLAbsorptionLight.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLAbsorptionLight.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLAbsorptionLight.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLAbsorptionLight.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLAbsorptionLightList }

function TXMLAbsorptionLightList.Add: IXMLAbsorptionLight;
begin
  Result := AddItem(-1) as IXMLAbsorptionLight;
end;

function TXMLAbsorptionLightList.Insert(const Index: Integer): IXMLAbsorptionLight;
begin
  Result := AddItem(Index) as IXMLAbsorptionLight;
end;

function TXMLAbsorptionLightList.Get_Item(Index: Integer): IXMLAbsorptionLight;
begin
  Result := List[Index] as IXMLAbsorptionLight;
end;

{ TXMLAbsorptionWater }

function TXMLAbsorptionWater.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLAbsorptionWater.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLAbsorptionWater.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLAbsorptionWater.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLAbsorptionWater.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLAbsorptionWater.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLAbsorptionWater.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLAbsorptionWater.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLAbsorptionWaterList }

function TXMLAbsorptionWaterList.Add: IXMLAbsorptionWater;
begin
  Result := AddItem(-1) as IXMLAbsorptionWater;
end;

function TXMLAbsorptionWaterList.Insert(const Index: Integer): IXMLAbsorptionWater;
begin
  Result := AddItem(Index) as IXMLAbsorptionWater;
end;

function TXMLAbsorptionWaterList.Get_Item(Index: Integer): IXMLAbsorptionWater;
begin
  Result := List[Index] as IXMLAbsorptionWater;
end;

{ TXMLAppearance }

function TXMLAppearance.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLAppearance.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLAppearance.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLAppearance.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLAppearance.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLAppearance.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLAppearance.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLAppearance.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLAppearanceList }

function TXMLAppearanceList.Add: IXMLAppearance;
begin
  Result := AddItem(-1) as IXMLAppearance;
end;

function TXMLAppearanceList.Insert(const Index: Integer): IXMLAppearance;
begin
  Result := AddItem(Index) as IXMLAppearance;
end;

function TXMLAppearanceList.Get_Item(Index: Integer): IXMLAppearance;
begin
  Result := List[Index] as IXMLAppearance;
end;

{ TXMLAsh }

function TXMLAsh.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLAsh.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLAsh.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLAsh.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLAsh.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLAsh.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLAsh.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLAsh.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLAshList }

function TXMLAshList.Add: IXMLAsh;
begin
  Result := AddItem(-1) as IXMLAsh;
end;

function TXMLAshList.Insert(const Index: Integer): IXMLAsh;
begin
  Result := AddItem(Index) as IXMLAsh;
end;

function TXMLAshList.Get_Item(Index: Integer): IXMLAsh;
begin
  Result := List[Index] as IXMLAsh;
end;

{ TXMLBasisWeight }

procedure TXMLBasisWeight.AfterConstruction;
begin
  RegisterChildNode('DetailValue', TXMLDetailValue);
  RegisterChildNode('DetailRangeMin', TXMLDetailRangeMin);
  RegisterChildNode('DetailRangeMax', TXMLDetailRangeMax);
  RegisterChildNode('StandardDeviation', TXMLStandardDeviation);
  RegisterChildNode('TwoSigmaLower', TXMLTwoSigmaLower);
  RegisterChildNode('TwoSigmaUpper', TXMLTwoSigmaUpper);
  RegisterChildNode('IncrementalValue', TXMLIncrementalValue);
  FIncrementalValue := CreateCollection(TXMLIncrementalValueList, IXMLIncrementalValue, 'IncrementalValue') as IXMLIncrementalValueList;
  inherited;
end;

function TXMLBasisWeight.Get_ProductBasisSizeType: UnicodeString;
begin
  Result := AttributeNodes['ProductBasisSizeType'].Text;
end;

procedure TXMLBasisWeight.Set_ProductBasisSizeType(Value: UnicodeString);
begin
  SetAttribute('ProductBasisSizeType', Value);
end;

function TXMLBasisWeight.Get_DetailValue: IXMLDetailValue;
begin
  Result := ChildNodes['DetailValue'] as IXMLDetailValue;
end;

function TXMLBasisWeight.Get_DetailRangeMin: IXMLDetailRangeMin;
begin
  Result := ChildNodes['DetailRangeMin'] as IXMLDetailRangeMin;
end;

function TXMLBasisWeight.Get_DetailRangeMax: IXMLDetailRangeMax;
begin
  Result := ChildNodes['DetailRangeMax'] as IXMLDetailRangeMax;
end;

function TXMLBasisWeight.Get_StandardDeviation: IXMLStandardDeviation;
begin
  Result := ChildNodes['StandardDeviation'] as IXMLStandardDeviation;
end;

function TXMLBasisWeight.Get_SampleSize: LongWord;
begin
  Result := ChildNodes['SampleSize'].NodeValue;
end;

procedure TXMLBasisWeight.Set_SampleSize(Value: LongWord);
begin
  ChildNodes['SampleSize'].NodeValue := Value;
end;

function TXMLBasisWeight.Get_TwoSigmaLower: IXMLTwoSigmaLower;
begin
  Result := ChildNodes['TwoSigmaLower'] as IXMLTwoSigmaLower;
end;

function TXMLBasisWeight.Get_TwoSigmaUpper: IXMLTwoSigmaUpper;
begin
  Result := ChildNodes['TwoSigmaUpper'] as IXMLTwoSigmaUpper;
end;

function TXMLBasisWeight.Get_IncrementalValue: IXMLIncrementalValueList;
begin
  Result := FIncrementalValue;
end;

{ TXMLIncrementalValue }

function TXMLIncrementalValue.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLIncrementalValue.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLIncrementalValueList }

function TXMLIncrementalValueList.Add: IXMLIncrementalValue;
begin
  Result := AddItem(-1) as IXMLIncrementalValue;
end;

function TXMLIncrementalValueList.Insert(const Index: Integer): IXMLIncrementalValue;
begin
  Result := AddItem(Index) as IXMLIncrementalValue;
end;

function TXMLIncrementalValueList.Get_Item(Index: Integer): IXMLIncrementalValue;
begin
  Result := List[Index] as IXMLIncrementalValue;
end;

{ TXMLBendingResistance }

function TXMLBendingResistance.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLBendingResistance.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLBendingResistance.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLBendingResistance.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLBendingResistance.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLBendingResistance.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLBendingResistance.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLBendingResistance.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLBendingResistanceList }

function TXMLBendingResistanceList.Add: IXMLBendingResistance;
begin
  Result := AddItem(-1) as IXMLBendingResistance;
end;

function TXMLBendingResistanceList.Insert(const Index: Integer): IXMLBendingResistance;
begin
  Result := AddItem(Index) as IXMLBendingResistance;
end;

function TXMLBendingResistanceList.Get_Item(Index: Integer): IXMLBendingResistance;
begin
  Result := List[Index] as IXMLBendingResistance;
end;

{ TXMLBendingStiffness }

function TXMLBendingStiffness.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLBendingStiffness.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLBendingStiffness.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLBendingStiffness.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLBendingStiffness.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLBendingStiffness.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLBendingStiffness.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLBendingStiffness.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLBendingStiffnessList }

function TXMLBendingStiffnessList.Add: IXMLBendingStiffness;
begin
  Result := AddItem(-1) as IXMLBendingStiffness;
end;

function TXMLBendingStiffnessList.Insert(const Index: Integer): IXMLBendingStiffness;
begin
  Result := AddItem(Index) as IXMLBendingStiffness;
end;

function TXMLBendingStiffnessList.Get_Item(Index: Integer): IXMLBendingStiffness;
begin
  Result := List[Index] as IXMLBendingStiffness;
end;

{ TXMLBrightness }

function TXMLBrightness.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLBrightness.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLBrightness.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLBrightness.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLBrightness.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLBrightness.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLBrightness.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLBrightness.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLBrightnessList }

function TXMLBrightnessList.Add: IXMLBrightness;
begin
  Result := AddItem(-1) as IXMLBrightness;
end;

function TXMLBrightnessList.Insert(const Index: Integer): IXMLBrightness;
begin
  Result := AddItem(Index) as IXMLBrightness;
end;

function TXMLBrightnessList.Get_Item(Index: Integer): IXMLBrightness;
begin
  Result := List[Index] as IXMLBrightness;
end;

{ TXMLBulk }

function TXMLBulk.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLBulk.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLBulk.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLBulk.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLBulk.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLBulk.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLBulk.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLBulk.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLBulkList }

function TXMLBulkList.Add: IXMLBulk;
begin
  Result := AddItem(-1) as IXMLBulk;
end;

function TXMLBulkList.Insert(const Index: Integer): IXMLBulk;
begin
  Result := AddItem(Index) as IXMLBulk;
end;

function TXMLBulkList.Get_Item(Index: Integer): IXMLBulk;
begin
  Result := List[Index] as IXMLBulk;
end;

{ TXMLBurst }

function TXMLBurst.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLBurst.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLBurst.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLBurst.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLBurst.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLBurst.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLBurst.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLBurst.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLBurstList }

function TXMLBurstList.Add: IXMLBurst;
begin
  Result := AddItem(-1) as IXMLBurst;
end;

function TXMLBurstList.Insert(const Index: Integer): IXMLBurst;
begin
  Result := AddItem(Index) as IXMLBurst;
end;

function TXMLBurstList.Get_Item(Index: Integer): IXMLBurst;
begin
  Result := List[Index] as IXMLBurst;
end;

{ TXMLBurstIndex }

function TXMLBurstIndex.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLBurstIndex.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLBurstIndex.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLBurstIndex.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLBurstIndex.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLBurstIndex.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLBurstIndex.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLBurstIndex.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLBurstIndexList }

function TXMLBurstIndexList.Add: IXMLBurstIndex;
begin
  Result := AddItem(-1) as IXMLBurstIndex;
end;

function TXMLBurstIndexList.Insert(const Index: Integer): IXMLBurstIndex;
begin
  Result := AddItem(Index) as IXMLBurstIndex;
end;

function TXMLBurstIndexList.Get_Item(Index: Integer): IXMLBurstIndex;
begin
  Result := List[Index] as IXMLBurstIndex;
end;

{ TXMLCaliper }

function TXMLCaliper.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLCaliper.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLCaliper.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLCaliper.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLCaliper.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLCaliper.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLCaliper.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLCaliper.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLCaliperList }

function TXMLCaliperList.Add: IXMLCaliper;
begin
  Result := AddItem(-1) as IXMLCaliper;
end;

function TXMLCaliperList.Insert(const Index: Integer): IXMLCaliper;
begin
  Result := AddItem(Index) as IXMLCaliper;
end;

function TXMLCaliperList.Get_Item(Index: Integer): IXMLCaliper;
begin
  Result := List[Index] as IXMLCaliper;
end;

{ TXMLCoatWeight }

function TXMLCoatWeight.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLCoatWeight.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLCoatWeight.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLCoatWeight.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLCoatWeight.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLCoatWeight.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLCoatWeight.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLCoatWeight.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLCoatWeightList }

function TXMLCoatWeightList.Add: IXMLCoatWeight;
begin
  Result := AddItem(-1) as IXMLCoatWeight;
end;

function TXMLCoatWeightList.Insert(const Index: Integer): IXMLCoatWeight;
begin
  Result := AddItem(Index) as IXMLCoatWeight;
end;

function TXMLCoatWeightList.Get_Item(Index: Integer): IXMLCoatWeight;
begin
  Result := List[Index] as IXMLCoatWeight;
end;

{ TXMLColourDetail }

procedure TXMLColourDetail.AfterConstruction;
begin
  RegisterChildNode('CMYK', TXMLCMYK);
  RegisterChildNode('ColourShade', TXMLColourShade);
  RegisterChildNode('HSB', TXMLHSB);
  RegisterChildNode('Lab', TXMLLab);
  RegisterChildNode('RGB', TXMLRGB);
  RegisterChildNode('ColourCode', TXMLColourCode);
  FColourDescription := CreateCollection(TXMLS72List, IXMLNode, 'ColourDescription') as IXMLS72List;
  inherited;
end;

function TXMLColourDetail.Get_CMYK: IXMLCMYK;
begin
  Result := ChildNodes['CMYK'] as IXMLCMYK;
end;

function TXMLColourDetail.Get_ColourShade: IXMLColourShade;
begin
  Result := ChildNodes['ColourShade'] as IXMLColourShade;
end;

function TXMLColourDetail.Get_HSB: IXMLHSB;
begin
  Result := ChildNodes['HSB'] as IXMLHSB;
end;

function TXMLColourDetail.Get_Lab: IXMLLab;
begin
  Result := ChildNodes['Lab'] as IXMLLab;
end;

function TXMLColourDetail.Get_RGB: IXMLRGB;
begin
  Result := ChildNodes['RGB'] as IXMLRGB;
end;

function TXMLColourDetail.Get_ColourDescription: IXMLS72List;
begin
  Result := FColourDescription;
end;

function TXMLColourDetail.Get_ColourCode: IXMLColourCode;
begin
  Result := ChildNodes['ColourCode'] as IXMLColourCode;
end;

{ TXMLColourDetailList }

function TXMLColourDetailList.Add: IXMLColourDetail;
begin
  Result := AddItem(-1) as IXMLColourDetail;
end;

function TXMLColourDetailList.Insert(const Index: Integer): IXMLColourDetail;
begin
  Result := AddItem(Index) as IXMLColourDetail;
end;

function TXMLColourDetailList.Get_Item(Index: Integer): IXMLColourDetail;
begin
  Result := List[Index] as IXMLColourDetail;
end;

{ TXMLCMYK }

procedure TXMLCMYK.AfterConstruction;
begin
  RegisterChildNode('Cyan', TXMLDetailMeasurement);
  RegisterChildNode('Magenta', TXMLDetailMeasurement);
  RegisterChildNode('Yellow', TXMLDetailMeasurement);
  RegisterChildNode('Black', TXMLDetailMeasurement);
  inherited;
end;

function TXMLCMYK.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLCMYK.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLCMYK.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLCMYK.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLCMYK.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLCMYK.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLCMYK.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLCMYK.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

function TXMLCMYK.Get_Cyan: IXMLDetailMeasurement;
begin
  Result := ChildNodes['Cyan'] as IXMLDetailMeasurement;
end;

function TXMLCMYK.Get_Magenta: IXMLDetailMeasurement;
begin
  Result := ChildNodes['Magenta'] as IXMLDetailMeasurement;
end;

function TXMLCMYK.Get_Yellow: IXMLDetailMeasurement;
begin
  Result := ChildNodes['Yellow'] as IXMLDetailMeasurement;
end;

function TXMLCMYK.Get_Black: IXMLDetailMeasurement;
begin
  Result := ChildNodes['Black'] as IXMLDetailMeasurement;
end;

{ TXMLColourShade }

function TXMLColourShade.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLColourShade.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLHSB }

procedure TXMLHSB.AfterConstruction;
begin
  RegisterChildNode('Hue', TXMLDetailMeasurement);
  RegisterChildNode('Saturation', TXMLDetailMeasurement);
  RegisterChildNode('Brilliance', TXMLDetailMeasurement);
  inherited;
end;

function TXMLHSB.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLHSB.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLHSB.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLHSB.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLHSB.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLHSB.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLHSB.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLHSB.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

function TXMLHSB.Get_Hue: IXMLDetailMeasurement;
begin
  Result := ChildNodes['Hue'] as IXMLDetailMeasurement;
end;

function TXMLHSB.Get_Saturation: IXMLDetailMeasurement;
begin
  Result := ChildNodes['Saturation'] as IXMLDetailMeasurement;
end;

function TXMLHSB.Get_Brilliance: IXMLDetailMeasurement;
begin
  Result := ChildNodes['Brilliance'] as IXMLDetailMeasurement;
end;

{ TXMLLab }

procedure TXMLLab.AfterConstruction;
begin
  RegisterChildNode('L', TXMLDetailMeasurement);
  RegisterChildNode('a', TXMLDetailMeasurement);
  RegisterChildNode('b', TXMLDetailMeasurement);
  inherited;
end;

function TXMLLab.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLLab.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLLab.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLLab.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLLab.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLLab.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLLab.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLLab.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

function TXMLLab.Get_L: IXMLDetailMeasurement;
begin
  Result := ChildNodes[WideString('L')] as IXMLDetailMeasurement;
end;

function TXMLLab.Get_A: IXMLDetailMeasurement;
begin
  Result := ChildNodes[WideString('a')] as IXMLDetailMeasurement;
end;

function TXMLLab.Get_B: IXMLDetailMeasurement;
begin
  Result := ChildNodes[WideString('b')] as IXMLDetailMeasurement;
end;

{ TXMLRGB }

procedure TXMLRGB.AfterConstruction;
begin
  RegisterChildNode('Red', TXMLDetailMeasurement);
  RegisterChildNode('Green', TXMLDetailMeasurement);
  RegisterChildNode('Blue', TXMLDetailMeasurement);
  inherited;
end;

function TXMLRGB.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLRGB.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLRGB.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLRGB.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLRGB.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLRGB.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLRGB.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLRGB.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

function TXMLRGB.Get_Red: IXMLDetailMeasurement;
begin
  Result := ChildNodes['Red'] as IXMLDetailMeasurement;
end;

function TXMLRGB.Get_Green: IXMLDetailMeasurement;
begin
  Result := ChildNodes['Green'] as IXMLDetailMeasurement;
end;

function TXMLRGB.Get_Blue: IXMLDetailMeasurement;
begin
  Result := ChildNodes['Blue'] as IXMLDetailMeasurement;
end;

{ TXMLColourCode }

function TXMLColourCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLColourCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLDensity }

function TXMLDensity.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLDensity.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLDensity.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLDensity.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLDensity.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLDensity.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLDensity.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLDensity.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLDensityList }

function TXMLDensityList.Add: IXMLDensity;
begin
  Result := AddItem(-1) as IXMLDensity;
end;

function TXMLDensityList.Insert(const Index: Integer): IXMLDensity;
begin
  Result := AddItem(Index) as IXMLDensity;
end;

function TXMLDensityList.Get_Item(Index: Integer): IXMLDensity;
begin
  Result := List[Index] as IXMLDensity;
end;

{ TXMLDirt }

function TXMLDirt.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLDirt.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLDirt.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLDirt.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLDirt.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLDirt.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLDirt.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLDirt.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLDirtList }

function TXMLDirtList.Add: IXMLDirt;
begin
  Result := AddItem(-1) as IXMLDirt;
end;

function TXMLDirtList.Insert(const Index: Integer): IXMLDirt;
begin
  Result := AddItem(Index) as IXMLDirt;
end;

function TXMLDirtList.Get_Item(Index: Integer): IXMLDirt;
begin
  Result := List[Index] as IXMLDirt;
end;

{ TXMLDominantWavelength }

function TXMLDominantWavelength.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLDominantWavelength.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLDominantWavelength.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLDominantWavelength.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLDominantWavelength.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLDominantWavelength.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLDominantWavelength.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLDominantWavelength.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLDominantWavelengthList }

function TXMLDominantWavelengthList.Add: IXMLDominantWavelength;
begin
  Result := AddItem(-1) as IXMLDominantWavelength;
end;

function TXMLDominantWavelengthList.Insert(const Index: Integer): IXMLDominantWavelength;
begin
  Result := AddItem(Index) as IXMLDominantWavelength;
end;

function TXMLDominantWavelengthList.Get_Item(Index: Integer): IXMLDominantWavelength;
begin
  Result := List[Index] as IXMLDominantWavelength;
end;

{ TXMLExcitationPurity }

function TXMLExcitationPurity.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLExcitationPurity.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLExcitationPurity.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLExcitationPurity.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLExcitationPurity.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLExcitationPurity.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLExcitationPurity.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLExcitationPurity.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLExcitationPurityList }

function TXMLExcitationPurityList.Add: IXMLExcitationPurity;
begin
  Result := AddItem(-1) as IXMLExcitationPurity;
end;

function TXMLExcitationPurityList.Insert(const Index: Integer): IXMLExcitationPurity;
begin
  Result := AddItem(Index) as IXMLExcitationPurity;
end;

function TXMLExcitationPurityList.Get_Item(Index: Integer): IXMLExcitationPurity;
begin
  Result := List[Index] as IXMLExcitationPurity;
end;

{ TXMLFibreLength }

function TXMLFibreLength.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLFibreLength.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLFibreLength.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLFibreLength.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLFibreLength.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLFibreLength.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLFibreLength.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLFibreLength.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLFibreLengthList }

function TXMLFibreLengthList.Add: IXMLFibreLength;
begin
  Result := AddItem(-1) as IXMLFibreLength;
end;

function TXMLFibreLengthList.Insert(const Index: Integer): IXMLFibreLength;
begin
  Result := AddItem(Index) as IXMLFibreLength;
end;

function TXMLFibreLengthList.Get_Item(Index: Integer): IXMLFibreLength;
begin
  Result := List[Index] as IXMLFibreLength;
end;

{ TXMLFibreClassification }

function TXMLFibreClassification.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLFibreClassification.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLFibreClassification.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLFibreClassification.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLFibreClassification.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLFibreClassification.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLFibreClassification.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLFibreClassification.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLFibreClassificationList }

function TXMLFibreClassificationList.Add: IXMLFibreClassification;
begin
  Result := AddItem(-1) as IXMLFibreClassification;
end;

function TXMLFibreClassificationList.Insert(const Index: Integer): IXMLFibreClassification;
begin
  Result := AddItem(Index) as IXMLFibreClassification;
end;

function TXMLFibreClassificationList.Get_Item(Index: Integer): IXMLFibreClassification;
begin
  Result := List[Index] as IXMLFibreClassification;
end;

{ TXMLFolding }

function TXMLFolding.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLFolding.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLFolding.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLFolding.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLFolding.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLFolding.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLFolding.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLFolding.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLFoldingList }

function TXMLFoldingList.Add: IXMLFolding;
begin
  Result := AddItem(-1) as IXMLFolding;
end;

function TXMLFoldingList.Insert(const Index: Integer): IXMLFolding;
begin
  Result := AddItem(Index) as IXMLFolding;
end;

function TXMLFoldingList.Get_Item(Index: Integer): IXMLFolding;
begin
  Result := List[Index] as IXMLFolding;
end;

{ TXMLFormation }

function TXMLFormation.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLFormation.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLFormation.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLFormation.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLFormation.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLFormation.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLFormation.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLFormation.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLFormationList }

function TXMLFormationList.Add: IXMLFormation;
begin
  Result := AddItem(-1) as IXMLFormation;
end;

function TXMLFormationList.Insert(const Index: Integer): IXMLFormation;
begin
  Result := AddItem(Index) as IXMLFormation;
end;

function TXMLFormationList.Get_Item(Index: Integer): IXMLFormation;
begin
  Result := List[Index] as IXMLFormation;
end;

{ TXMLFreeness }

function TXMLFreeness.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLFreeness.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLFreeness.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLFreeness.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLFreeness.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLFreeness.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLFreeness.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLFreeness.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLFreenessList }

function TXMLFreenessList.Add: IXMLFreeness;
begin
  Result := AddItem(-1) as IXMLFreeness;
end;

function TXMLFreenessList.Insert(const Index: Integer): IXMLFreeness;
begin
  Result := AddItem(Index) as IXMLFreeness;
end;

function TXMLFreenessList.Get_Item(Index: Integer): IXMLFreeness;
begin
  Result := List[Index] as IXMLFreeness;
end;

{ TXMLFriction }

function TXMLFriction.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLFriction.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLFriction.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLFriction.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLFriction.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLFriction.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLFriction.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLFriction.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLFrictionList }

function TXMLFrictionList.Add: IXMLFriction;
begin
  Result := AddItem(-1) as IXMLFriction;
end;

function TXMLFrictionList.Insert(const Index: Integer): IXMLFriction;
begin
  Result := AddItem(Index) as IXMLFriction;
end;

function TXMLFrictionList.Get_Item(Index: Integer): IXMLFriction;
begin
  Result := List[Index] as IXMLFriction;
end;

{ TXMLGloss }

function TXMLGloss.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLGloss.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLGloss.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLGloss.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLGloss.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLGloss.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLGloss.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLGloss.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLGlossList }

function TXMLGlossList.Add: IXMLGloss;
begin
  Result := AddItem(-1) as IXMLGloss;
end;

function TXMLGlossList.Insert(const Index: Integer): IXMLGloss;
begin
  Result := AddItem(Index) as IXMLGloss;
end;

function TXMLGlossList.Get_Item(Index: Integer): IXMLGloss;
begin
  Result := List[Index] as IXMLGloss;
end;

{ TXMLLightScattering }

function TXMLLightScattering.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLLightScattering.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLLightScattering.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLLightScattering.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLLightScattering.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLLightScattering.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLLightScattering.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLLightScattering.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLLightScatteringList }

function TXMLLightScatteringList.Add: IXMLLightScattering;
begin
  Result := AddItem(-1) as IXMLLightScattering;
end;

function TXMLLightScatteringList.Insert(const Index: Integer): IXMLLightScattering;
begin
  Result := AddItem(Index) as IXMLLightScattering;
end;

function TXMLLightScatteringList.Get_Item(Index: Integer): IXMLLightScattering;
begin
  Result := List[Index] as IXMLLightScattering;
end;

{ TXMLLuminance }

function TXMLLuminance.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLLuminance.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLLuminance.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLLuminance.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLLuminance.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLLuminance.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLLuminance.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLLuminance.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLLuminanceList }

function TXMLLuminanceList.Add: IXMLLuminance;
begin
  Result := AddItem(-1) as IXMLLuminance;
end;

function TXMLLuminanceList.Insert(const Index: Integer): IXMLLuminance;
begin
  Result := AddItem(Index) as IXMLLuminance;
end;

function TXMLLuminanceList.Get_Item(Index: Integer): IXMLLuminance;
begin
  Result := List[Index] as IXMLLuminance;
end;

{ TXMLMoisture }

function TXMLMoisture.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLMoisture.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLMoisture.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLMoisture.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLMoisture.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLMoisture.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLMoisture.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLMoisture.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLMoistureList }

function TXMLMoistureList.Add: IXMLMoisture;
begin
  Result := AddItem(-1) as IXMLMoisture;
end;

function TXMLMoistureList.Insert(const Index: Integer): IXMLMoisture;
begin
  Result := AddItem(Index) as IXMLMoisture;
end;

function TXMLMoistureList.Get_Item(Index: Integer): IXMLMoisture;
begin
  Result := List[Index] as IXMLMoisture;
end;

{ TXMLMullen }

function TXMLMullen.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLMullen.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLMullen.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLMullen.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLMullen.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLMullen.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLMullen.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLMullen.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLMullenList }

function TXMLMullenList.Add: IXMLMullen;
begin
  Result := AddItem(-1) as IXMLMullen;
end;

function TXMLMullenList.Insert(const Index: Integer): IXMLMullen;
begin
  Result := AddItem(Index) as IXMLMullen;
end;

function TXMLMullenList.Get_Item(Index: Integer): IXMLMullen;
begin
  Result := List[Index] as IXMLMullen;
end;

{ TXMLOpacity }

function TXMLOpacity.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLOpacity.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLOpacity.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLOpacity.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLOpacity.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLOpacity.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLOpacity.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLOpacity.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLOpacityList }

function TXMLOpacityList.Add: IXMLOpacity;
begin
  Result := AddItem(-1) as IXMLOpacity;
end;

function TXMLOpacityList.Insert(const Index: Integer): IXMLOpacity;
begin
  Result := AddItem(Index) as IXMLOpacity;
end;

function TXMLOpacityList.Get_Item(Index: Integer): IXMLOpacity;
begin
  Result := List[Index] as IXMLOpacity;
end;

{ TXMLPermeability }

function TXMLPermeability.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLPermeability.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLPermeability.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLPermeability.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLPermeability.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLPermeability.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLPermeability.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLPermeability.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLPermeabilityList }

function TXMLPermeabilityList.Add: IXMLPermeability;
begin
  Result := AddItem(-1) as IXMLPermeability;
end;

function TXMLPermeabilityList.Insert(const Index: Integer): IXMLPermeability;
begin
  Result := AddItem(Index) as IXMLPermeability;
end;

function TXMLPermeabilityList.Get_Item(Index: Integer): IXMLPermeability;
begin
  Result := List[Index] as IXMLPermeability;
end;

{ TXMLPH }

function TXMLPH.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLPH.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLPH.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLPH.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLPH.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLPH.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLPH.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLPH.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLPHList }

function TXMLPHList.Add: IXMLPH;
begin
  Result := AddItem(-1) as IXMLPH;
end;

function TXMLPHList.Insert(const Index: Integer): IXMLPH;
begin
  Result := AddItem(Index) as IXMLPH;
end;

function TXMLPHList.Get_Item(Index: Integer): IXMLPH;
begin
  Result := List[Index] as IXMLPH;
end;

{ TXMLPlyBond }

function TXMLPlyBond.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLPlyBond.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLPlyBond.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLPlyBond.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLPlyBond.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLPlyBond.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLPlyBond.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLPlyBond.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLPlyBondList }

function TXMLPlyBondList.Add: IXMLPlyBond;
begin
  Result := AddItem(-1) as IXMLPlyBond;
end;

function TXMLPlyBondList.Insert(const Index: Integer): IXMLPlyBond;
begin
  Result := AddItem(Index) as IXMLPlyBond;
end;

function TXMLPlyBondList.Get_Item(Index: Integer): IXMLPlyBond;
begin
  Result := List[Index] as IXMLPlyBond;
end;

{ TXMLPorosity }

function TXMLPorosity.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLPorosity.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLPorosity.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLPorosity.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLPorosity.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLPorosity.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLPorosity.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLPorosity.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLPorosityList }

function TXMLPorosityList.Add: IXMLPorosity;
begin
  Result := AddItem(-1) as IXMLPorosity;
end;

function TXMLPorosityList.Insert(const Index: Integer): IXMLPorosity;
begin
  Result := AddItem(Index) as IXMLPorosity;
end;

function TXMLPorosityList.Get_Item(Index: Integer): IXMLPorosity;
begin
  Result := List[Index] as IXMLPorosity;
end;

{ TXMLPostConsumerWaste }

function TXMLPostConsumerWaste.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLPostConsumerWaste.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLPostConsumerWaste.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLPostConsumerWaste.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLPostConsumerWaste.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLPostConsumerWaste.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLPostConsumerWaste.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLPostConsumerWaste.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLPostConsumerWasteList }

function TXMLPostConsumerWasteList.Add: IXMLPostConsumerWaste;
begin
  Result := AddItem(-1) as IXMLPostConsumerWaste;
end;

function TXMLPostConsumerWasteList.Insert(const Index: Integer): IXMLPostConsumerWaste;
begin
  Result := AddItem(Index) as IXMLPostConsumerWaste;
end;

function TXMLPostConsumerWasteList.Get_Item(Index: Integer): IXMLPostConsumerWaste;
begin
  Result := List[Index] as IXMLPostConsumerWaste;
end;

{ TXMLPreConsumerWaste }

function TXMLPreConsumerWaste.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLPreConsumerWaste.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLPreConsumerWaste.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLPreConsumerWaste.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLPreConsumerWaste.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLPreConsumerWaste.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLPreConsumerWaste.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLPreConsumerWaste.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLPreConsumerWasteList }

function TXMLPreConsumerWasteList.Add: IXMLPreConsumerWaste;
begin
  Result := AddItem(-1) as IXMLPreConsumerWaste;
end;

function TXMLPreConsumerWasteList.Insert(const Index: Integer): IXMLPreConsumerWaste;
begin
  Result := AddItem(Index) as IXMLPreConsumerWaste;
end;

function TXMLPreConsumerWasteList.Get_Item(Index: Integer): IXMLPreConsumerWaste;
begin
  Result := List[Index] as IXMLPreConsumerWaste;
end;

{ TXMLRecycled }

function TXMLRecycled.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLRecycled.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLRecycled.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLRecycled.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLRecycled.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLRecycled.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLRecycled.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLRecycled.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLRecycledList }

function TXMLRecycledList.Add: IXMLRecycled;
begin
  Result := AddItem(-1) as IXMLRecycled;
end;

function TXMLRecycledList.Insert(const Index: Integer): IXMLRecycled;
begin
  Result := AddItem(Index) as IXMLRecycled;
end;

function TXMLRecycledList.Get_Item(Index: Integer): IXMLRecycled;
begin
  Result := List[Index] as IXMLRecycled;
end;

{ TXMLResistance }

function TXMLResistance.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLResistance.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLResistance.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLResistance.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLResistance.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLResistance.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLResistance.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLResistance.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLResistanceList }

function TXMLResistanceList.Add: IXMLResistance;
begin
  Result := AddItem(-1) as IXMLResistance;
end;

function TXMLResistanceList.Insert(const Index: Integer): IXMLResistance;
begin
  Result := AddItem(Index) as IXMLResistance;
end;

function TXMLResistanceList.Get_Item(Index: Integer): IXMLResistance;
begin
  Result := List[Index] as IXMLResistance;
end;

{ TXMLRingCrush }

function TXMLRingCrush.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLRingCrush.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLRingCrush.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLRingCrush.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLRingCrush.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLRingCrush.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLRingCrush.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLRingCrush.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLRingCrushList }

function TXMLRingCrushList.Add: IXMLRingCrush;
begin
  Result := AddItem(-1) as IXMLRingCrush;
end;

function TXMLRingCrushList.Insert(const Index: Integer): IXMLRingCrush;
begin
  Result := AddItem(Index) as IXMLRingCrush;
end;

function TXMLRingCrushList.Get_Item(Index: Integer): IXMLRingCrush;
begin
  Result := List[Index] as IXMLRingCrush;
end;

{ TXMLRoughness }

function TXMLRoughness.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLRoughness.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLRoughness.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLRoughness.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLRoughness.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLRoughness.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLRoughness.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLRoughness.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLRoughnessList }

function TXMLRoughnessList.Add: IXMLRoughness;
begin
  Result := AddItem(-1) as IXMLRoughness;
end;

function TXMLRoughnessList.Insert(const Index: Integer): IXMLRoughness;
begin
  Result := AddItem(Index) as IXMLRoughness;
end;

function TXMLRoughnessList.Get_Item(Index: Integer): IXMLRoughness;
begin
  Result := List[Index] as IXMLRoughness;
end;

{ TXMLRunnabilityIndex }

function TXMLRunnabilityIndex.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLRunnabilityIndex.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLRunnabilityIndex.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLRunnabilityIndex.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLRunnabilityIndex.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLRunnabilityIndex.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLRunnabilityIndex.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLRunnabilityIndex.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLRunnabilityIndexList }

function TXMLRunnabilityIndexList.Add: IXMLRunnabilityIndex;
begin
  Result := AddItem(-1) as IXMLRunnabilityIndex;
end;

function TXMLRunnabilityIndexList.Insert(const Index: Integer): IXMLRunnabilityIndex;
begin
  Result := AddItem(Index) as IXMLRunnabilityIndex;
end;

function TXMLRunnabilityIndexList.Get_Item(Index: Integer): IXMLRunnabilityIndex;
begin
  Result := List[Index] as IXMLRunnabilityIndex;
end;

{ TXMLShowThrough }

function TXMLShowThrough.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLShowThrough.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLShowThrough.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLShowThrough.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLShowThrough.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLShowThrough.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLShowThrough.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLShowThrough.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLShowThroughList }

function TXMLShowThroughList.Add: IXMLShowThrough;
begin
  Result := AddItem(-1) as IXMLShowThrough;
end;

function TXMLShowThroughList.Insert(const Index: Integer): IXMLShowThrough;
begin
  Result := AddItem(Index) as IXMLShowThrough;
end;

function TXMLShowThroughList.Get_Item(Index: Integer): IXMLShowThrough;
begin
  Result := List[Index] as IXMLShowThrough;
end;

{ TXMLSizing }

function TXMLSizing.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLSizing.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLSizing.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLSizing.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLSizing.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLSizing.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLSizing.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLSizing.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLSizingList }

function TXMLSizingList.Add: IXMLSizing;
begin
  Result := AddItem(-1) as IXMLSizing;
end;

function TXMLSizingList.Insert(const Index: Integer): IXMLSizing;
begin
  Result := AddItem(Index) as IXMLSizing;
end;

function TXMLSizingList.Get_Item(Index: Integer): IXMLSizing;
begin
  Result := List[Index] as IXMLSizing;
end;

{ TXMLSmoothness }

function TXMLSmoothness.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLSmoothness.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLSmoothness.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLSmoothness.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLSmoothness.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLSmoothness.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLSmoothness.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLSmoothness.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLSmoothnessList }

function TXMLSmoothnessList.Add: IXMLSmoothness;
begin
  Result := AddItem(-1) as IXMLSmoothness;
end;

function TXMLSmoothnessList.Insert(const Index: Integer): IXMLSmoothness;
begin
  Result := AddItem(Index) as IXMLSmoothness;
end;

function TXMLSmoothnessList.Get_Item(Index: Integer): IXMLSmoothness;
begin
  Result := List[Index] as IXMLSmoothness;
end;

{ TXMLStiffness }

function TXMLStiffness.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLStiffness.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLStiffness.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLStiffness.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLStiffness.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLStiffness.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLStiffness.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLStiffness.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLStiffnessList }

function TXMLStiffnessList.Add: IXMLStiffness;
begin
  Result := AddItem(-1) as IXMLStiffness;
end;

function TXMLStiffnessList.Insert(const Index: Integer): IXMLStiffness;
begin
  Result := AddItem(Index) as IXMLStiffness;
end;

function TXMLStiffnessList.Get_Item(Index: Integer): IXMLStiffness;
begin
  Result := List[Index] as IXMLStiffness;
end;

{ TXMLStretch }

function TXMLStretch.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLStretch.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLStretch.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLStretch.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLStretch.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLStretch.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLStretch.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLStretch.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLStretchList }

function TXMLStretchList.Add: IXMLStretch;
begin
  Result := AddItem(-1) as IXMLStretch;
end;

function TXMLStretchList.Insert(const Index: Integer): IXMLStretch;
begin
  Result := AddItem(Index) as IXMLStretch;
end;

function TXMLStretchList.Get_Item(Index: Integer): IXMLStretch;
begin
  Result := List[Index] as IXMLStretch;
end;

{ TXMLSurfaceStrength }

function TXMLSurfaceStrength.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLSurfaceStrength.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLSurfaceStrength.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLSurfaceStrength.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLSurfaceStrength.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLSurfaceStrength.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLSurfaceStrength.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLSurfaceStrength.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLSurfaceStrengthList }

function TXMLSurfaceStrengthList.Add: IXMLSurfaceStrength;
begin
  Result := AddItem(-1) as IXMLSurfaceStrength;
end;

function TXMLSurfaceStrengthList.Insert(const Index: Integer): IXMLSurfaceStrength;
begin
  Result := AddItem(Index) as IXMLSurfaceStrength;
end;

function TXMLSurfaceStrengthList.Get_Item(Index: Integer): IXMLSurfaceStrength;
begin
  Result := List[Index] as IXMLSurfaceStrength;
end;

{ TXMLTEA }

function TXMLTEA.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLTEA.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLTEA.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLTEA.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLTEA.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLTEA.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLTEA.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLTEA.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLTEAList }

function TXMLTEAList.Add: IXMLTEA;
begin
  Result := AddItem(-1) as IXMLTEA;
end;

function TXMLTEAList.Insert(const Index: Integer): IXMLTEA;
begin
  Result := AddItem(Index) as IXMLTEA;
end;

function TXMLTEAList.Get_Item(Index: Integer): IXMLTEA;
begin
  Result := List[Index] as IXMLTEA;
end;

{ TXMLTear }

function TXMLTear.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLTear.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLTear.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLTear.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLTear.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLTear.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLTear.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLTear.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLTearList }

function TXMLTearList.Add: IXMLTear;
begin
  Result := AddItem(-1) as IXMLTear;
end;

function TXMLTearList.Insert(const Index: Integer): IXMLTear;
begin
  Result := AddItem(Index) as IXMLTear;
end;

function TXMLTearList.Get_Item(Index: Integer): IXMLTear;
begin
  Result := List[Index] as IXMLTear;
end;

{ TXMLTearIndex }

function TXMLTearIndex.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLTearIndex.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLTearIndex.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLTearIndex.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLTearIndex.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLTearIndex.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLTearIndex.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLTearIndex.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLTearIndexList }

function TXMLTearIndexList.Add: IXMLTearIndex;
begin
  Result := AddItem(-1) as IXMLTearIndex;
end;

function TXMLTearIndexList.Insert(const Index: Integer): IXMLTearIndex;
begin
  Result := AddItem(Index) as IXMLTearIndex;
end;

function TXMLTearIndexList.Get_Item(Index: Integer): IXMLTearIndex;
begin
  Result := List[Index] as IXMLTearIndex;
end;

{ TXMLTensile }

function TXMLTensile.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLTensile.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLTensile.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLTensile.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLTensile.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLTensile.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLTensile.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLTensile.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLTensileList }

function TXMLTensileList.Add: IXMLTensile;
begin
  Result := AddItem(-1) as IXMLTensile;
end;

function TXMLTensileList.Insert(const Index: Integer): IXMLTensile;
begin
  Result := AddItem(Index) as IXMLTensile;
end;

function TXMLTensileList.Get_Item(Index: Integer): IXMLTensile;
begin
  Result := List[Index] as IXMLTensile;
end;

{ TXMLTensileIndex }

function TXMLTensileIndex.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLTensileIndex.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLTensileIndex.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLTensileIndex.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLTensileIndex.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLTensileIndex.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLTensileIndex.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLTensileIndex.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLTensileIndexList }

function TXMLTensileIndexList.Add: IXMLTensileIndex;
begin
  Result := AddItem(-1) as IXMLTensileIndex;
end;

function TXMLTensileIndexList.Insert(const Index: Integer): IXMLTensileIndex;
begin
  Result := AddItem(Index) as IXMLTensileIndex;
end;

function TXMLTensileIndexList.Get_Item(Index: Integer): IXMLTensileIndex;
begin
  Result := List[Index] as IXMLTensileIndex;
end;

{ TXMLWhiteness }

function TXMLWhiteness.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLWhiteness.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLWhiteness.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLWhiteness.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLWhiteness.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLWhiteness.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLWhiteness.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLWhiteness.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLWhitenessList }

function TXMLWhitenessList.Add: IXMLWhiteness;
begin
  Result := AddItem(-1) as IXMLWhiteness;
end;

function TXMLWhitenessList.Insert(const Index: Integer): IXMLWhiteness;
begin
  Result := AddItem(Index) as IXMLWhiteness;
end;

function TXMLWhitenessList.Get_Item(Index: Integer): IXMLWhiteness;
begin
  Result := List[Index] as IXMLWhiteness;
end;

{ TXMLAdditionalTest }

procedure TXMLAdditionalTest.AfterConstruction;
begin
  RegisterChildNode('DetailValue', TXMLDetailValue);
  RegisterChildNode('DetailRangeMin', TXMLDetailRangeMin);
  RegisterChildNode('DetailRangeMax', TXMLDetailRangeMax);
  RegisterChildNode('StandardDeviation', TXMLStandardDeviation);
  RegisterChildNode('TwoSigmaLower', TXMLTwoSigmaLower);
  RegisterChildNode('TwoSigmaUpper', TXMLTwoSigmaUpper);
  inherited;
end;

function TXMLAdditionalTest.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLAdditionalTest.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLAdditionalTest.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLAdditionalTest.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLAdditionalTest.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLAdditionalTest.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLAdditionalTest.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLAdditionalTest.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

function TXMLAdditionalTest.Get_AdditionalTestName: UnicodeString;
begin
  Result := ChildNodes['AdditionalTestName'].Text;
end;

procedure TXMLAdditionalTest.Set_AdditionalTestName(Value: UnicodeString);
begin
  ChildNodes['AdditionalTestName'].NodeValue := Value;
end;

function TXMLAdditionalTest.Get_DetailValue: IXMLDetailValue;
begin
  Result := ChildNodes['DetailValue'] as IXMLDetailValue;
end;

function TXMLAdditionalTest.Get_DetailRangeMin: IXMLDetailRangeMin;
begin
  Result := ChildNodes['DetailRangeMin'] as IXMLDetailRangeMin;
end;

function TXMLAdditionalTest.Get_DetailRangeMax: IXMLDetailRangeMax;
begin
  Result := ChildNodes['DetailRangeMax'] as IXMLDetailRangeMax;
end;

function TXMLAdditionalTest.Get_StandardDeviation: IXMLStandardDeviation;
begin
  Result := ChildNodes['StandardDeviation'] as IXMLStandardDeviation;
end;

function TXMLAdditionalTest.Get_SampleSize: LongWord;
begin
  Result := ChildNodes['SampleSize'].NodeValue;
end;

procedure TXMLAdditionalTest.Set_SampleSize(Value: LongWord);
begin
  ChildNodes['SampleSize'].NodeValue := Value;
end;

function TXMLAdditionalTest.Get_TwoSigmaLower: IXMLTwoSigmaLower;
begin
  Result := ChildNodes['TwoSigmaLower'] as IXMLTwoSigmaLower;
end;

function TXMLAdditionalTest.Get_TwoSigmaUpper: IXMLTwoSigmaUpper;
begin
  Result := ChildNodes['TwoSigmaUpper'] as IXMLTwoSigmaUpper;
end;

{ TXMLPlyAttributes }

procedure TXMLPlyAttributes.AfterConstruction;
begin
  RegisterChildNode('Abrasion', TXMLAbrasion);
  RegisterChildNode('AbsorptionInk', TXMLAbsorptionInk);
  RegisterChildNode('AbsorptionLight', TXMLAbsorptionLight);
  RegisterChildNode('AbsorptionWater', TXMLAbsorptionWater);
  RegisterChildNode('Appearance', TXMLAppearance);
  RegisterChildNode('Ash', TXMLAsh);
  RegisterChildNode('BasisWeight', TXMLBasisWeight);
  RegisterChildNode('BendingResistance', TXMLBendingResistance);
  RegisterChildNode('BendingStiffness', TXMLBendingStiffness);
  RegisterChildNode('Brightness', TXMLBrightness);
  RegisterChildNode('Bulk', TXMLBulk);
  RegisterChildNode('Burst', TXMLBurst);
  RegisterChildNode('BurstIndex', TXMLBurstIndex);
  RegisterChildNode('Caliper', TXMLCaliper);
  RegisterChildNode('CoatWeight', TXMLCoatWeight);
  RegisterChildNode('ColourDetail', TXMLColourDetail);
  RegisterChildNode('Density', TXMLDensity);
  RegisterChildNode('Dirt', TXMLDirt);
  RegisterChildNode('DominantWavelength', TXMLDominantWavelength);
  RegisterChildNode('FibreLength', TXMLFibreLength);
  RegisterChildNode('FibreClassification', TXMLFibreClassification);
  RegisterChildNode('Folding', TXMLFolding);
  RegisterChildNode('Formation', TXMLFormation);
  RegisterChildNode('Freeness', TXMLFreeness);
  RegisterChildNode('Friction', TXMLFriction);
  RegisterChildNode('Gloss', TXMLGloss);
  RegisterChildNode('LightScattering', TXMLLightScattering);
  RegisterChildNode('Moisture', TXMLMoisture);
  RegisterChildNode('Opacity', TXMLOpacity);
  RegisterChildNode('Permeability', TXMLPermeability);
  RegisterChildNode('pH', TXMLPH);
  RegisterChildNode('PlyBond', TXMLPlyBond);
  RegisterChildNode('Porosity', TXMLPorosity);
  RegisterChildNode('PostConsumerWaste', TXMLPostConsumerWaste);
  RegisterChildNode('PPI', TXMLMeasurement);
  RegisterChildNode('PreConsumerWaste', TXMLPreConsumerWaste);
  RegisterChildNode('Recycled', TXMLRecycled);
  RegisterChildNode('Resistance', TXMLResistance);
  RegisterChildNode('RingCrush', TXMLRingCrush);
  RegisterChildNode('Roughness', TXMLRoughness);
  RegisterChildNode('RunnabilityIndex', TXMLRunnabilityIndex);
  RegisterChildNode('ShowThrough', TXMLShowThrough);
  RegisterChildNode('Sizing', TXMLSizing);
  RegisterChildNode('Smoothness', TXMLSmoothness);
  RegisterChildNode('Stiffness', TXMLStiffness);
  RegisterChildNode('Stretch', TXMLStretch);
  RegisterChildNode('SurfaceStrength', TXMLSurfaceStrength);
  RegisterChildNode('TEA', TXMLTEA);
  RegisterChildNode('Tear', TXMLTear);
  RegisterChildNode('TearIndex', TXMLTearIndex);
  RegisterChildNode('Tensile', TXMLTensile);
  RegisterChildNode('TensileIndex', TXMLTensileIndex);
  RegisterChildNode('Whiteness', TXMLWhiteness);
  RegisterChildNode('AdditionalTest', TXMLAdditionalTest);
  FAbrasion := CreateCollection(TXMLAbrasionList, IXMLAbrasion, 'Abrasion') as IXMLAbrasionList;
  FAbsorptionInk := CreateCollection(TXMLAbsorptionInkList, IXMLAbsorptionInk, 'AbsorptionInk') as IXMLAbsorptionInkList;
  FAbsorptionLight := CreateCollection(TXMLAbsorptionLightList, IXMLAbsorptionLight, 'AbsorptionLight') as IXMLAbsorptionLightList;
  FAbsorptionWater := CreateCollection(TXMLAbsorptionWaterList, IXMLAbsorptionWater, 'AbsorptionWater') as IXMLAbsorptionWaterList;
  FAppearance := CreateCollection(TXMLAppearanceList, IXMLAppearance, 'Appearance') as IXMLAppearanceList;
  FAsh := CreateCollection(TXMLAshList, IXMLAsh, 'Ash') as IXMLAshList;
  FBasisWeight := CreateCollection(TXMLBasisWeightList, IXMLBasisWeight, 'BasisWeight') as IXMLBasisWeightList;
  FBendingResistance := CreateCollection(TXMLBendingResistanceList, IXMLBendingResistance, 'BendingResistance') as IXMLBendingResistanceList;
  FBendingStiffness := CreateCollection(TXMLBendingStiffnessList, IXMLBendingStiffness, 'BendingStiffness') as IXMLBendingStiffnessList;
  FBrightness := CreateCollection(TXMLBrightnessList, IXMLBrightness, 'Brightness') as IXMLBrightnessList;
  FBulk := CreateCollection(TXMLBulkList, IXMLBulk, 'Bulk') as IXMLBulkList;
  FBurst := CreateCollection(TXMLBurstList, IXMLBurst, 'Burst') as IXMLBurstList;
  FBurstIndex := CreateCollection(TXMLBurstIndexList, IXMLBurstIndex, 'BurstIndex') as IXMLBurstIndexList;
  FCaliper := CreateCollection(TXMLCaliperList, IXMLCaliper, 'Caliper') as IXMLCaliperList;
  FCoatWeight := CreateCollection(TXMLCoatWeightList, IXMLCoatWeight, 'CoatWeight') as IXMLCoatWeightList;
  FColourDetail := CreateCollection(TXMLColourDetailList, IXMLColourDetail, 'ColourDetail') as IXMLColourDetailList;
  FDensity := CreateCollection(TXMLDensityList, IXMLDensity, 'Density') as IXMLDensityList;
  FDirt := CreateCollection(TXMLDirtList, IXMLDirt, 'Dirt') as IXMLDirtList;
  FDominantWavelength := CreateCollection(TXMLDominantWavelengthList, IXMLDominantWavelength, 'DominantWavelength') as IXMLDominantWavelengthList;
  FFibreLength := CreateCollection(TXMLFibreLengthList, IXMLFibreLength, 'FibreLength') as IXMLFibreLengthList;
  FFibreClassification := CreateCollection(TXMLFibreClassificationList, IXMLFibreClassification, 'FibreClassification') as IXMLFibreClassificationList;
  FFolding := CreateCollection(TXMLFoldingList, IXMLFolding, 'Folding') as IXMLFoldingList;
  FFormation := CreateCollection(TXMLFormationList, IXMLFormation, 'Formation') as IXMLFormationList;
  FFreeness := CreateCollection(TXMLFreenessList, IXMLFreeness, 'Freeness') as IXMLFreenessList;
  FFriction := CreateCollection(TXMLFrictionList, IXMLFriction, 'Friction') as IXMLFrictionList;
  FGloss := CreateCollection(TXMLGlossList, IXMLGloss, 'Gloss') as IXMLGlossList;
  FLightScattering := CreateCollection(TXMLLightScatteringList, IXMLLightScattering, 'LightScattering') as IXMLLightScatteringList;
  FMoisture := CreateCollection(TXMLMoistureList, IXMLMoisture, 'Moisture') as IXMLMoistureList;
  FOpacity := CreateCollection(TXMLOpacityList, IXMLOpacity, 'Opacity') as IXMLOpacityList;
  FPermeability := CreateCollection(TXMLPermeabilityList, IXMLPermeability, 'Permeability') as IXMLPermeabilityList;
  FPH := CreateCollection(TXMLPHList, IXMLPH, 'pH') as IXMLPHList;
  FPlyBond := CreateCollection(TXMLPlyBondList, IXMLPlyBond, 'PlyBond') as IXMLPlyBondList;
  FPorosity := CreateCollection(TXMLPorosityList, IXMLPorosity, 'Porosity') as IXMLPorosityList;
  FPostConsumerWaste := CreateCollection(TXMLPostConsumerWasteList, IXMLPostConsumerWaste, 'PostConsumerWaste') as IXMLPostConsumerWasteList;
  FPPI := CreateCollection(TXMLMeasurementList, IXMLMeasurement, 'PPI') as IXMLMeasurementList;
  FPreConsumerWaste := CreateCollection(TXMLPreConsumerWasteList, IXMLPreConsumerWaste, 'PreConsumerWaste') as IXMLPreConsumerWasteList;
  FRecycled := CreateCollection(TXMLRecycledList, IXMLRecycled, 'Recycled') as IXMLRecycledList;
  FResistance := CreateCollection(TXMLResistanceList, IXMLResistance, 'Resistance') as IXMLResistanceList;
  FRingCrush := CreateCollection(TXMLRingCrushList, IXMLRingCrush, 'RingCrush') as IXMLRingCrushList;
  FRoughness := CreateCollection(TXMLRoughnessList, IXMLRoughness, 'Roughness') as IXMLRoughnessList;
  FRunnabilityIndex := CreateCollection(TXMLRunnabilityIndexList, IXMLRunnabilityIndex, 'RunnabilityIndex') as IXMLRunnabilityIndexList;
  FShowThrough := CreateCollection(TXMLShowThroughList, IXMLShowThrough, 'ShowThrough') as IXMLShowThroughList;
  FSizing := CreateCollection(TXMLSizingList, IXMLSizing, 'Sizing') as IXMLSizingList;
  FSmoothness := CreateCollection(TXMLSmoothnessList, IXMLSmoothness, 'Smoothness') as IXMLSmoothnessList;
  FStiffness := CreateCollection(TXMLStiffnessList, IXMLStiffness, 'Stiffness') as IXMLStiffnessList;
  FStretch := CreateCollection(TXMLStretchList, IXMLStretch, 'Stretch') as IXMLStretchList;
  FSurfaceStrength := CreateCollection(TXMLSurfaceStrengthList, IXMLSurfaceStrength, 'SurfaceStrength') as IXMLSurfaceStrengthList;
  FTEA := CreateCollection(TXMLTEAList, IXMLTEA, 'TEA') as IXMLTEAList;
  FTear := CreateCollection(TXMLTearList, IXMLTear, 'Tear') as IXMLTearList;
  FTearIndex := CreateCollection(TXMLTearIndexList, IXMLTearIndex, 'TearIndex') as IXMLTearIndexList;
  FTensile := CreateCollection(TXMLTensileList, IXMLTensile, 'Tensile') as IXMLTensileList;
  FTensileIndex := CreateCollection(TXMLTensileIndexList, IXMLTensileIndex, 'TensileIndex') as IXMLTensileIndexList;
  FWhiteness := CreateCollection(TXMLWhitenessList, IXMLWhiteness, 'Whiteness') as IXMLWhitenessList;
  inherited;
end;

function TXMLPlyAttributes.Get_CoatingLocation: UnicodeString;
begin
  Result := AttributeNodes['CoatingLocation'].Text;
end;

procedure TXMLPlyAttributes.Set_CoatingLocation(Value: UnicodeString);
begin
  SetAttribute('CoatingLocation', Value);
end;

function TXMLPlyAttributes.Get_PlyNumber: LongWord;
begin
  Result := ChildNodes['PlyNumber'].NodeValue;
end;

procedure TXMLPlyAttributes.Set_PlyNumber(Value: LongWord);
begin
  ChildNodes['PlyNumber'].NodeValue := Value;
end;

function TXMLPlyAttributes.Get_Abrasion: IXMLAbrasionList;
begin
  Result := FAbrasion;
end;

function TXMLPlyAttributes.Get_AbsorptionInk: IXMLAbsorptionInkList;
begin
  Result := FAbsorptionInk;
end;

function TXMLPlyAttributes.Get_AbsorptionLight: IXMLAbsorptionLightList;
begin
  Result := FAbsorptionLight;
end;

function TXMLPlyAttributes.Get_AbsorptionWater: IXMLAbsorptionWaterList;
begin
  Result := FAbsorptionWater;
end;

function TXMLPlyAttributes.Get_Appearance: IXMLAppearanceList;
begin
  Result := FAppearance;
end;

function TXMLPlyAttributes.Get_Ash: IXMLAshList;
begin
  Result := FAsh;
end;

function TXMLPlyAttributes.Get_BasisWeight: IXMLBasisWeightList;
begin
  Result := FBasisWeight;
end;

function TXMLPlyAttributes.Get_BendingResistance: IXMLBendingResistanceList;
begin
  Result := FBendingResistance;
end;

function TXMLPlyAttributes.Get_BendingStiffness: IXMLBendingStiffnessList;
begin
  Result := FBendingStiffness;
end;

function TXMLPlyAttributes.Get_Brightness: IXMLBrightnessList;
begin
  Result := FBrightness;
end;

function TXMLPlyAttributes.Get_Bulk: IXMLBulkList;
begin
  Result := FBulk;
end;

function TXMLPlyAttributes.Get_Burst: IXMLBurstList;
begin
  Result := FBurst;
end;

function TXMLPlyAttributes.Get_BurstIndex: IXMLBurstIndexList;
begin
  Result := FBurstIndex;
end;

function TXMLPlyAttributes.Get_Caliper: IXMLCaliperList;
begin
  Result := FCaliper;
end;

function TXMLPlyAttributes.Get_CoatWeight: IXMLCoatWeightList;
begin
  Result := FCoatWeight;
end;

function TXMLPlyAttributes.Get_ColourDetail: IXMLColourDetailList;
begin
  Result := FColourDetail;
end;

function TXMLPlyAttributes.Get_Density: IXMLDensityList;
begin
  Result := FDensity;
end;

function TXMLPlyAttributes.Get_Dirt: IXMLDirtList;
begin
  Result := FDirt;
end;

function TXMLPlyAttributes.Get_DominantWavelength: IXMLDominantWavelengthList;
begin
  Result := FDominantWavelength;
end;

function TXMLPlyAttributes.Get_FibreLength: IXMLFibreLengthList;
begin
  Result := FFibreLength;
end;

function TXMLPlyAttributes.Get_FibreClassification: IXMLFibreClassificationList;
begin
  Result := FFibreClassification;
end;

function TXMLPlyAttributes.Get_Folding: IXMLFoldingList;
begin
  Result := FFolding;
end;

function TXMLPlyAttributes.Get_Formation: IXMLFormationList;
begin
  Result := FFormation;
end;

function TXMLPlyAttributes.Get_Freeness: IXMLFreenessList;
begin
  Result := FFreeness;
end;

function TXMLPlyAttributes.Get_Friction: IXMLFrictionList;
begin
  Result := FFriction;
end;

function TXMLPlyAttributes.Get_Gloss: IXMLGlossList;
begin
  Result := FGloss;
end;

function TXMLPlyAttributes.Get_LightScattering: IXMLLightScatteringList;
begin
  Result := FLightScattering;
end;

function TXMLPlyAttributes.Get_Moisture: IXMLMoistureList;
begin
  Result := FMoisture;
end;

function TXMLPlyAttributes.Get_Opacity: IXMLOpacityList;
begin
  Result := FOpacity;
end;

function TXMLPlyAttributes.Get_Permeability: IXMLPermeabilityList;
begin
  Result := FPermeability;
end;

function TXMLPlyAttributes.Get_PH: IXMLPHList;
begin
  Result := FPH;
end;

function TXMLPlyAttributes.Get_PlyBond: IXMLPlyBondList;
begin
  Result := FPlyBond;
end;

function TXMLPlyAttributes.Get_Porosity: IXMLPorosityList;
begin
  Result := FPorosity;
end;

function TXMLPlyAttributes.Get_PostConsumerWaste: IXMLPostConsumerWasteList;
begin
  Result := FPostConsumerWaste;
end;

function TXMLPlyAttributes.Get_PPI: IXMLMeasurementList;
begin
  Result := FPPI;
end;

function TXMLPlyAttributes.Get_PreConsumerWaste: IXMLPreConsumerWasteList;
begin
  Result := FPreConsumerWaste;
end;

function TXMLPlyAttributes.Get_Recycled: IXMLRecycledList;
begin
  Result := FRecycled;
end;

function TXMLPlyAttributes.Get_Resistance: IXMLResistanceList;
begin
  Result := FResistance;
end;

function TXMLPlyAttributes.Get_RingCrush: IXMLRingCrushList;
begin
  Result := FRingCrush;
end;

function TXMLPlyAttributes.Get_Roughness: IXMLRoughnessList;
begin
  Result := FRoughness;
end;

function TXMLPlyAttributes.Get_RunnabilityIndex: IXMLRunnabilityIndexList;
begin
  Result := FRunnabilityIndex;
end;

function TXMLPlyAttributes.Get_ShowThrough: IXMLShowThroughList;
begin
  Result := FShowThrough;
end;

function TXMLPlyAttributes.Get_Sizing: IXMLSizingList;
begin
  Result := FSizing;
end;

function TXMLPlyAttributes.Get_Smoothness: IXMLSmoothnessList;
begin
  Result := FSmoothness;
end;

function TXMLPlyAttributes.Get_Stiffness: IXMLStiffnessList;
begin
  Result := FStiffness;
end;

function TXMLPlyAttributes.Get_Stretch: IXMLStretchList;
begin
  Result := FStretch;
end;

function TXMLPlyAttributes.Get_SurfaceStrength: IXMLSurfaceStrengthList;
begin
  Result := FSurfaceStrength;
end;

function TXMLPlyAttributes.Get_TEA: IXMLTEAList;
begin
  Result := FTEA;
end;

function TXMLPlyAttributes.Get_Tear: IXMLTearList;
begin
  Result := FTear;
end;

function TXMLPlyAttributes.Get_TearIndex: IXMLTearIndexList;
begin
  Result := FTearIndex;
end;

function TXMLPlyAttributes.Get_Tensile: IXMLTensileList;
begin
  Result := FTensile;
end;

function TXMLPlyAttributes.Get_TensileIndex: IXMLTensileIndexList;
begin
  Result := FTensileIndex;
end;

function TXMLPlyAttributes.Get_Whiteness: IXMLWhitenessList;
begin
  Result := FWhiteness;
end;

function TXMLPlyAttributes.Get_AdditionalTest: IXMLAdditionalTest;
begin
  Result := ChildNodes['AdditionalTest'] as IXMLAdditionalTest;
end;

{ TXMLPlyAttributesList }

function TXMLPlyAttributesList.Add: IXMLPlyAttributes;
begin
  Result := AddItem(-1) as IXMLPlyAttributes;
end;

function TXMLPlyAttributesList.Insert(const Index: Integer): IXMLPlyAttributes;
begin
  Result := AddItem(Index) as IXMLPlyAttributes;
end;

function TXMLPlyAttributesList.Get_Item(Index: Integer): IXMLPlyAttributes;
begin
  Result := List[Index] as IXMLPlyAttributes;
end;

{ TXMLPlySet }

procedure TXMLPlySet.AfterConstruction;
begin
  RegisterChildNode('PlyAttributes', TXMLPlyAttributes);
  FNumberOfPlies := CreateCollection(TXMLNni1List, IXMLNode, 'NumberOfPlies') as IXMLNni1List;
  FPlyAttributes := CreateCollection(TXMLPlyAttributesList, IXMLPlyAttributes, 'PlyAttributes') as IXMLPlyAttributesList;
  inherited;
end;

function TXMLPlySet.Get_EdgePaddable: UnicodeString;
begin
  Result := AttributeNodes['EdgePaddable'].Text;
end;

procedure TXMLPlySet.Set_EdgePaddable(Value: UnicodeString);
begin
  SetAttribute('EdgePaddable', Value);
end;

function TXMLPlySet.Get_NumberOfPlies: IXMLNni1List;
begin
  Result := FNumberOfPlies;
end;

function TXMLPlySet.Get_PlyAttributes: IXMLPlyAttributesList;
begin
  Result := FPlyAttributes;
end;

{ TXMLPlySetList }

function TXMLPlySetList.Add: IXMLPlySet;
begin
  Result := AddItem(-1) as IXMLPlySet;
end;

function TXMLPlySetList.Insert(const Index: Integer): IXMLPlySet;
begin
  Result := AddItem(Index) as IXMLPlySet;
end;

function TXMLPlySetList.Get_Item(Index: Integer): IXMLPlySet;
begin
  Result := List[Index] as IXMLPlySet;
end;

{ TXMLReel }

procedure TXMLReel.AfterConstruction;
begin
  RegisterChildNode('ReelConversionCharacteristics', TXMLReelConversionCharacteristicsClass);
  RegisterChildNode('ReelPackagingCharacteristics', TXMLReelPackagingCharacteristicsClass);
  inherited;
end;

function TXMLReel.Get_ReelConversionCharacteristics: IXMLReelConversionCharacteristicsClass;
begin
  Result := ChildNodes['ReelConversionCharacteristics'] as IXMLReelConversionCharacteristicsClass;
end;

function TXMLReel.Get_ReelPackagingCharacteristics: IXMLReelPackagingCharacteristicsClass;
begin
  Result := ChildNodes['ReelPackagingCharacteristics'] as IXMLReelPackagingCharacteristicsClass;
end;

{ TXMLReelConversionCharacteristicsClass }

procedure TXMLReelConversionCharacteristicsClass.AfterConstruction;
begin
  RegisterChildNode('ConversionCode', TXMLConversionCode);
  RegisterChildNode('ReelWidth', TXMLMeasurement);
  RegisterChildNode('ReelDiameter', TXMLMeasurement);
  RegisterChildNode('ReelLength', TXMLMeasurement);
  RegisterChildNode('TargetProductWeight', TXMLMeasurement);
  RegisterChildNode('CoreCharacteristics', TXMLCoreCharacteristics);
  RegisterChildNode('Embossing', TXMLEmbossing);
  RegisterChildNode('Watermark', TXMLWatermark);
  FReelWidth := CreateCollection(TXMLMeasurementList, IXMLMeasurement, 'ReelWidth') as IXMLMeasurementList;
  FReelDiameter := CreateCollection(TXMLMeasurementList, IXMLMeasurement, 'ReelDiameter') as IXMLMeasurementList;
  FReelLength := CreateCollection(TXMLMeasurementList, IXMLMeasurement, 'ReelLength') as IXMLMeasurementList;
  FCoreCharacteristics := CreateCollection(TXMLCoreCharacteristicsList, IXMLCoreCharacteristics, 'CoreCharacteristics') as IXMLCoreCharacteristicsList;
  FEmbossing := CreateCollection(TXMLEmbossingList, IXMLEmbossing, 'Embossing') as IXMLEmbossingList;
  FWatermark := CreateCollection(TXMLWatermarkList, IXMLWatermark, 'Watermark') as IXMLWatermarkList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLReelConversionCharacteristicsClass.Get_ConversionCode: IXMLConversionCode;
begin
  Result := ChildNodes['ConversionCode'] as IXMLConversionCode;
end;

function TXMLReelConversionCharacteristicsClass.Get_WindingDirection: UnicodeString;
begin
  Result := ChildNodes['WindingDirection'].Text;
end;

procedure TXMLReelConversionCharacteristicsClass.Set_WindingDirection(Value: UnicodeString);
begin
  ChildNodes['WindingDirection'].NodeValue := Value;
end;

function TXMLReelConversionCharacteristicsClass.Get_MakeTo: UnicodeString;
begin
  Result := ChildNodes['MakeTo'].Text;
end;

procedure TXMLReelConversionCharacteristicsClass.Set_MakeTo(Value: UnicodeString);
begin
  ChildNodes['MakeTo'].NodeValue := Value;
end;

function TXMLReelConversionCharacteristicsClass.Get_ReelWidth: IXMLMeasurementList;
begin
  Result := FReelWidth;
end;

function TXMLReelConversionCharacteristicsClass.Get_ReelDiameter: IXMLMeasurementList;
begin
  Result := FReelDiameter;
end;

function TXMLReelConversionCharacteristicsClass.Get_ReelLength: IXMLMeasurementList;
begin
  Result := FReelLength;
end;

function TXMLReelConversionCharacteristicsClass.Get_TargetProductWeight: IXMLMeasurement;
begin
  Result := ChildNodes['TargetProductWeight'] as IXMLMeasurement;
end;

function TXMLReelConversionCharacteristicsClass.Get_CoreCharacteristics: IXMLCoreCharacteristicsList;
begin
  Result := FCoreCharacteristics;
end;

function TXMLReelConversionCharacteristicsClass.Get_Embossing: IXMLEmbossingList;
begin
  Result := FEmbossing;
end;

function TXMLReelConversionCharacteristicsClass.Get_Watermark: IXMLWatermarkList;
begin
  Result := FWatermark;
end;

function TXMLReelConversionCharacteristicsClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLConversionCode }

function TXMLConversionCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLConversionCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLCoreCharacteristics }

procedure TXMLCoreCharacteristics.AfterConstruction;
begin
  RegisterChildNode('CoreCode', TXMLCoreCode);
  RegisterChildNode('CoreDiameterInside', TXMLMeasurement);
  RegisterChildNode('CoreDiameterOutside', TXMLMeasurement);
  RegisterChildNode('CoreStrengthCode', TXMLCoreStrengthCode);
  inherited;
end;

function TXMLCoreCharacteristics.Get_CoreEndType: UnicodeString;
begin
  Result := AttributeNodes['CoreEndType'].Text;
end;

procedure TXMLCoreCharacteristics.Set_CoreEndType(Value: UnicodeString);
begin
  SetAttribute('CoreEndType', Value);
end;

function TXMLCoreCharacteristics.Get_CoreMaterialType: UnicodeString;
begin
  Result := AttributeNodes['CoreMaterialType'].Text;
end;

procedure TXMLCoreCharacteristics.Set_CoreMaterialType(Value: UnicodeString);
begin
  SetAttribute('CoreMaterialType', Value);
end;

function TXMLCoreCharacteristics.Get_CoreCode: IXMLCoreCode;
begin
  Result := ChildNodes['CoreCode'] as IXMLCoreCode;
end;

function TXMLCoreCharacteristics.Get_CoreDiameterInside: IXMLMeasurement;
begin
  Result := ChildNodes['CoreDiameterInside'] as IXMLMeasurement;
end;

function TXMLCoreCharacteristics.Get_CoreDiameterOutside: IXMLMeasurement;
begin
  Result := ChildNodes['CoreDiameterOutside'] as IXMLMeasurement;
end;

function TXMLCoreCharacteristics.Get_CoreStrengthCode: IXMLCoreStrengthCode;
begin
  Result := ChildNodes['CoreStrengthCode'] as IXMLCoreStrengthCode;
end;

{ TXMLCoreCharacteristicsList }

function TXMLCoreCharacteristicsList.Add: IXMLCoreCharacteristics;
begin
  Result := AddItem(-1) as IXMLCoreCharacteristics;
end;

function TXMLCoreCharacteristicsList.Insert(const Index: Integer): IXMLCoreCharacteristics;
begin
  Result := AddItem(Index) as IXMLCoreCharacteristics;
end;

function TXMLCoreCharacteristicsList.Get_Item(Index: Integer): IXMLCoreCharacteristics;
begin
  Result := List[Index] as IXMLCoreCharacteristics;
end;

{ TXMLCoreCode }

function TXMLCoreCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLCoreCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLCoreStrengthCode }

function TXMLCoreStrengthCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLCoreStrengthCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLEmbossing }

procedure TXMLEmbossing.AfterConstruction;
begin
  RegisterChildNode('EmbossingCode', TXMLEmbossingCode);
  FEmbossingDescription := CreateCollection(TXMLS60List, IXMLNode, 'EmbossingDescription') as IXMLS60List;
  inherited;
end;

function TXMLEmbossing.Get_EmbossingCode: IXMLEmbossingCode;
begin
  Result := ChildNodes['EmbossingCode'] as IXMLEmbossingCode;
end;

function TXMLEmbossing.Get_EmbossingDescription: IXMLS60List;
begin
  Result := FEmbossingDescription;
end;

{ TXMLEmbossingList }

function TXMLEmbossingList.Add: IXMLEmbossing;
begin
  Result := AddItem(-1) as IXMLEmbossing;
end;

function TXMLEmbossingList.Insert(const Index: Integer): IXMLEmbossing;
begin
  Result := AddItem(Index) as IXMLEmbossing;
end;

function TXMLEmbossingList.Get_Item(Index: Integer): IXMLEmbossing;
begin
  Result := List[Index] as IXMLEmbossing;
end;

{ TXMLEmbossingCode }

function TXMLEmbossingCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLEmbossingCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLWatermark }

procedure TXMLWatermark.AfterConstruction;
begin
  RegisterChildNode('WatermarkCode', TXMLWatermarkCode);
  FWatermarkDescription := CreateCollection(TXMLS60List, IXMLNode, 'WatermarkDescription') as IXMLS60List;
  inherited;
end;

function TXMLWatermark.Get_WatermarkCode: IXMLWatermarkCode;
begin
  Result := ChildNodes['WatermarkCode'] as IXMLWatermarkCode;
end;

function TXMLWatermark.Get_WatermarkDescription: IXMLS60List;
begin
  Result := FWatermarkDescription;
end;

{ TXMLWatermarkList }

function TXMLWatermarkList.Add: IXMLWatermark;
begin
  Result := AddItem(-1) as IXMLWatermark;
end;

function TXMLWatermarkList.Insert(const Index: Integer): IXMLWatermark;
begin
  Result := AddItem(Index) as IXMLWatermark;
end;

function TXMLWatermarkList.Get_Item(Index: Integer): IXMLWatermark;
begin
  Result := List[Index] as IXMLWatermark;
end;

{ TXMLWatermarkCode }

function TXMLWatermarkCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLWatermarkCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLReelPackagingCharacteristicsClass }

procedure TXMLReelPackagingCharacteristicsClass.AfterConstruction;
begin
  RegisterChildNode('PackagingCode', TXMLPackagingCode);
  RegisterChildNode('PackagingDescription', TXMLPackagingDescription);
  RegisterChildNode('Wrap', TXMLWrap);
  RegisterChildNode('BandCharacteristics', TXMLBandCharacteristics);
  RegisterChildNode('PalletCharacteristics', TXMLPalletCharacteristics);
  RegisterChildNode('LabelCharacteristics', TXMLLabelCharacteristics);
  RegisterChildNode('StencilCharacteristics', TXMLStencilCharacteristics);
  RegisterChildNode('MaximumHeight', TXMLMeasurement);
  RegisterChildNode('MaximumGrossWeight', TXMLMeasurement);
  RegisterChildNode('MaximumClampingForce', TXMLMaximumClampingForce);
  FWrap := CreateCollection(TXMLWrapList, IXMLWrap, 'Wrap') as IXMLWrapList;
  FEndCaps := CreateCollection(TXMLS20List, IXMLNode, 'EndCaps') as IXMLS20List;
  FCorePlugs := CreateCollection(TXMLBooleanList, IXMLNode, 'CorePlugs') as IXMLBooleanList;
  FBandCharacteristics := CreateCollection(TXMLBandCharacteristicsList, IXMLBandCharacteristics, 'BandCharacteristics') as IXMLBandCharacteristicsList;
  FPalletCharacteristics := CreateCollection(TXMLPalletCharacteristicsList, IXMLPalletCharacteristics, 'PalletCharacteristics') as IXMLPalletCharacteristicsList;
  FLabelCharacteristics := CreateCollection(TXMLLabelCharacteristicsList, IXMLLabelCharacteristics, 'LabelCharacteristics') as IXMLLabelCharacteristicsList;
  FStencilCharacteristics := CreateCollection(TXMLStencilCharacteristicsList, IXMLStencilCharacteristics, 'StencilCharacteristics') as IXMLStencilCharacteristicsList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLReelPackagingCharacteristicsClass.Get_ActionType: UnicodeString;
begin
  Result := AttributeNodes['ActionType'].Text;
end;

procedure TXMLReelPackagingCharacteristicsClass.Set_ActionType(Value: UnicodeString);
begin
  SetAttribute('ActionType', Value);
end;

function TXMLReelPackagingCharacteristicsClass.Get_PackagingCode: IXMLPackagingCode;
begin
  Result := ChildNodes['PackagingCode'] as IXMLPackagingCode;
end;

function TXMLReelPackagingCharacteristicsClass.Get_PackagingDescription: IXMLPackagingDescription;
begin
  Result := ChildNodes['PackagingDescription'] as IXMLPackagingDescription;
end;

function TXMLReelPackagingCharacteristicsClass.Get_ReelsPerPack: LongWord;
begin
  Result := ChildNodes['ReelsPerPack'].NodeValue;
end;

procedure TXMLReelPackagingCharacteristicsClass.Set_ReelsPerPack(Value: LongWord);
begin
  ChildNodes['ReelsPerPack'].NodeValue := Value;
end;

function TXMLReelPackagingCharacteristicsClass.Get_Wrap: IXMLWrapList;
begin
  Result := FWrap;
end;

function TXMLReelPackagingCharacteristicsClass.Get_EndCaps: IXMLS20List;
begin
  Result := FEndCaps;
end;

function TXMLReelPackagingCharacteristicsClass.Get_CorePlugs: IXMLBooleanList;
begin
  Result := FCorePlugs;
end;

function TXMLReelPackagingCharacteristicsClass.Get_BandCharacteristics: IXMLBandCharacteristicsList;
begin
  Result := FBandCharacteristics;
end;

function TXMLReelPackagingCharacteristicsClass.Get_PalletCharacteristics: IXMLPalletCharacteristicsList;
begin
  Result := FPalletCharacteristics;
end;

function TXMLReelPackagingCharacteristicsClass.Get_LabelCharacteristics: IXMLLabelCharacteristicsList;
begin
  Result := FLabelCharacteristics;
end;

function TXMLReelPackagingCharacteristicsClass.Get_StencilCharacteristics: IXMLStencilCharacteristicsList;
begin
  Result := FStencilCharacteristics;
end;

function TXMLReelPackagingCharacteristicsClass.Get_MaximumHeight: IXMLMeasurement;
begin
  Result := ChildNodes['MaximumHeight'] as IXMLMeasurement;
end;

function TXMLReelPackagingCharacteristicsClass.Get_MaximumGrossWeight: IXMLMeasurement;
begin
  Result := ChildNodes['MaximumGrossWeight'] as IXMLMeasurement;
end;

function TXMLReelPackagingCharacteristicsClass.Get_MaximumClampingForce: IXMLMaximumClampingForce;
begin
  Result := ChildNodes['MaximumClampingForce'] as IXMLMaximumClampingForce;
end;

function TXMLReelPackagingCharacteristicsClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLPackagingCode }

function TXMLPackagingCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLPackagingCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLPackagingCodeList }

function TXMLPackagingCodeList.Add: IXMLPackagingCode;
begin
  Result := AddItem(-1) as IXMLPackagingCode;
end;

function TXMLPackagingCodeList.Insert(const Index: Integer): IXMLPackagingCode;
begin
  Result := AddItem(Index) as IXMLPackagingCode;
end;

function TXMLPackagingCodeList.Get_Item(Index: Integer): IXMLPackagingCode;
begin
  Result := List[Index] as IXMLPackagingCode;
end;

{ TXMLPackagingDescription }

function TXMLPackagingDescription.Get_Language: UnicodeString;
begin
  Result := AttributeNodes['Language'].Text;
end;

procedure TXMLPackagingDescription.Set_Language(Value: UnicodeString);
begin
  SetAttribute('Language', Value);
end;

{ TXMLPackagingDescriptionList }

function TXMLPackagingDescriptionList.Add: IXMLPackagingDescription;
begin
  Result := AddItem(-1) as IXMLPackagingDescription;
end;

function TXMLPackagingDescriptionList.Insert(const Index: Integer): IXMLPackagingDescription;
begin
  Result := AddItem(Index) as IXMLPackagingDescription;
end;

function TXMLPackagingDescriptionList.Get_Item(Index: Integer): IXMLPackagingDescription;
begin
  Result := List[Index] as IXMLPackagingDescription;
end;

{ TXMLWrap }

function TXMLWrap.Get_WrapType: UnicodeString;
begin
  Result := AttributeNodes['WrapType'].Text;
end;

procedure TXMLWrap.Set_WrapType(Value: UnicodeString);
begin
  SetAttribute('WrapType', Value);
end;

function TXMLWrap.Get_WrapProperties: UnicodeString;
begin
  Result := AttributeNodes['WrapProperties'].Text;
end;

procedure TXMLWrap.Set_WrapProperties(Value: UnicodeString);
begin
  SetAttribute('WrapProperties', Value);
end;

function TXMLWrap.Get_WrapLocation: UnicodeString;
begin
  Result := AttributeNodes['WrapLocation'].Text;
end;

procedure TXMLWrap.Set_WrapLocation(Value: UnicodeString);
begin
  SetAttribute('WrapLocation', Value);
end;

function TXMLWrap.Get_NumberOfWraps: Double;
begin
  Result := XmlStrToFloatExt(ChildNodes['NumberOfWraps'].Text);
end;

procedure TXMLWrap.Set_NumberOfWraps(Value: Double);
begin
  ChildNodes['NumberOfWraps'].NodeValue := Value;
end;

function TXMLWrap.Get_Brand: UnicodeString;
begin
  Result := ChildNodes['Brand'].Text;
end;

procedure TXMLWrap.Set_Brand(Value: UnicodeString);
begin
  ChildNodes['Brand'].NodeValue := Value;
end;

{ TXMLWrapList }

function TXMLWrapList.Add: IXMLWrap;
begin
  Result := AddItem(-1) as IXMLWrap;
end;

function TXMLWrapList.Insert(const Index: Integer): IXMLWrap;
begin
  Result := AddItem(Index) as IXMLWrap;
end;

function TXMLWrapList.Get_Item(Index: Integer): IXMLWrap;
begin
  Result := List[Index] as IXMLWrap;
end;

{ TXMLBandCharacteristics }

procedure TXMLBandCharacteristics.AfterConstruction;
begin
  FBandColour := CreateCollection(TXMLS20List, IXMLNode, 'BandColour') as IXMLS20List;
  inherited;
end;

function TXMLBandCharacteristics.Get_BandType: UnicodeString;
begin
  Result := AttributeNodes['BandType'].Text;
end;

procedure TXMLBandCharacteristics.Set_BandType(Value: UnicodeString);
begin
  SetAttribute('BandType', Value);
end;

function TXMLBandCharacteristics.Get_BandsRequired: UnicodeString;
begin
  Result := AttributeNodes['BandsRequired'].Text;
end;

procedure TXMLBandCharacteristics.Set_BandsRequired(Value: UnicodeString);
begin
  SetAttribute('BandsRequired', Value);
end;

function TXMLBandCharacteristics.Get_BandDirection: UnicodeString;
begin
  Result := AttributeNodes['BandDirection'].Text;
end;

procedure TXMLBandCharacteristics.Set_BandDirection(Value: UnicodeString);
begin
  SetAttribute('BandDirection', Value);
end;

function TXMLBandCharacteristics.Get_NumberOfBands: LongWord;
begin
  Result := ChildNodes['NumberOfBands'].NodeValue;
end;

procedure TXMLBandCharacteristics.Set_NumberOfBands(Value: LongWord);
begin
  ChildNodes['NumberOfBands'].NodeValue := Value;
end;

function TXMLBandCharacteristics.Get_BandColour: IXMLS20List;
begin
  Result := FBandColour;
end;

{ TXMLBandCharacteristicsList }

function TXMLBandCharacteristicsList.Add: IXMLBandCharacteristics;
begin
  Result := AddItem(-1) as IXMLBandCharacteristics;
end;

function TXMLBandCharacteristicsList.Insert(const Index: Integer): IXMLBandCharacteristics;
begin
  Result := AddItem(Index) as IXMLBandCharacteristics;
end;

function TXMLBandCharacteristicsList.Get_Item(Index: Integer): IXMLBandCharacteristics;
begin
  Result := List[Index] as IXMLBandCharacteristics;
end;

{ TXMLPalletCharacteristics }

procedure TXMLPalletCharacteristics.AfterConstruction;
begin
  RegisterChildNode('ProductIdentification', TXMLProductIdentification);
  RegisterChildNode('PalletLength', TXMLMeasurement);
  RegisterChildNode('PalletWidth', TXMLMeasurement);
  RegisterChildNode('PalletHeight', TXMLMeasurement);
  RegisterChildNode('MaximumHeight', TXMLMeasurement);
  RegisterChildNode('LabelCharacteristics', TXMLLabelCharacteristics);
  inherited;
end;

function TXMLPalletCharacteristics.Get_MixedProductPalletIndicator: UnicodeString;
begin
  Result := AttributeNodes['MixedProductPalletIndicator'].Text;
end;

procedure TXMLPalletCharacteristics.Set_MixedProductPalletIndicator(Value: UnicodeString);
begin
  SetAttribute('MixedProductPalletIndicator', Value);
end;

function TXMLPalletCharacteristics.Get_PalletType: UnicodeString;
begin
  Result := AttributeNodes['PalletType'].Text;
end;

procedure TXMLPalletCharacteristics.Set_PalletType(Value: UnicodeString);
begin
  SetAttribute('PalletType', Value);
end;

function TXMLPalletCharacteristics.Get_PalletLedgeType: UnicodeString;
begin
  Result := AttributeNodes['PalletLedgeType'].Text;
end;

procedure TXMLPalletCharacteristics.Set_PalletLedgeType(Value: UnicodeString);
begin
  SetAttribute('PalletLedgeType', Value);
end;

function TXMLPalletCharacteristics.Get_PalletCoverType: UnicodeString;
begin
  Result := AttributeNodes['PalletCoverType'].Text;
end;

procedure TXMLPalletCharacteristics.Set_PalletCoverType(Value: UnicodeString);
begin
  SetAttribute('PalletCoverType', Value);
end;

function TXMLPalletCharacteristics.Get_PalletAdditionsType: UnicodeString;
begin
  Result := AttributeNodes['PalletAdditionsType'].Text;
end;

procedure TXMLPalletCharacteristics.Set_PalletAdditionsType(Value: UnicodeString);
begin
  SetAttribute('PalletAdditionsType', Value);
end;

function TXMLPalletCharacteristics.Get_PalletTopType: UnicodeString;
begin
  Result := AttributeNodes['PalletTopType'].Text;
end;

procedure TXMLPalletCharacteristics.Set_PalletTopType(Value: UnicodeString);
begin
  SetAttribute('PalletTopType', Value);
end;

function TXMLPalletCharacteristics.Get_IsPartialPalletsAllowed: UnicodeString;
begin
  Result := AttributeNodes['IsPartialPalletsAllowed'].Text;
end;

procedure TXMLPalletCharacteristics.Set_IsPartialPalletsAllowed(Value: UnicodeString);
begin
  SetAttribute('IsPartialPalletsAllowed', Value);
end;

function TXMLPalletCharacteristics.Get_PalletMaterialType: UnicodeString;
begin
  Result := AttributeNodes['PalletMaterialType'].Text;
end;

procedure TXMLPalletCharacteristics.Set_PalletMaterialType(Value: UnicodeString);
begin
  SetAttribute('PalletMaterialType', Value);
end;

function TXMLPalletCharacteristics.Get_ProductIdentification: IXMLProductIdentification;
begin
  Result := ChildNodes['ProductIdentification'] as IXMLProductIdentification;
end;

function TXMLPalletCharacteristics.Get_PalletLength: IXMLMeasurement;
begin
  Result := ChildNodes['PalletLength'] as IXMLMeasurement;
end;

function TXMLPalletCharacteristics.Get_PalletWidth: IXMLMeasurement;
begin
  Result := ChildNodes['PalletWidth'] as IXMLMeasurement;
end;

function TXMLPalletCharacteristics.Get_PalletHeight: IXMLMeasurement;
begin
  Result := ChildNodes['PalletHeight'] as IXMLMeasurement;
end;

function TXMLPalletCharacteristics.Get_ItemsPerPallet: LongWord;
begin
  Result := ChildNodes['ItemsPerPallet'].NodeValue;
end;

procedure TXMLPalletCharacteristics.Set_ItemsPerPallet(Value: LongWord);
begin
  ChildNodes['ItemsPerPallet'].NodeValue := Value;
end;

function TXMLPalletCharacteristics.Get_StacksPerPallet: LongWord;
begin
  Result := ChildNodes['StacksPerPallet'].NodeValue;
end;

procedure TXMLPalletCharacteristics.Set_StacksPerPallet(Value: LongWord);
begin
  ChildNodes['StacksPerPallet'].NodeValue := Value;
end;

function TXMLPalletCharacteristics.Get_TiersPerPallet: LongWord;
begin
  Result := ChildNodes['TiersPerPallet'].NodeValue;
end;

procedure TXMLPalletCharacteristics.Set_TiersPerPallet(Value: LongWord);
begin
  ChildNodes['TiersPerPallet'].NodeValue := Value;
end;

function TXMLPalletCharacteristics.Get_MaximumHeight: IXMLMeasurement;
begin
  Result := ChildNodes['MaximumHeight'] as IXMLMeasurement;
end;

function TXMLPalletCharacteristics.Get_StackingMethod: UnicodeString;
begin
  Result := ChildNodes['StackingMethod'].Text;
end;

procedure TXMLPalletCharacteristics.Set_StackingMethod(Value: UnicodeString);
begin
  ChildNodes['StackingMethod'].NodeValue := Value;
end;

function TXMLPalletCharacteristics.Get_LabelCharacteristics: IXMLLabelCharacteristics;
begin
  Result := ChildNodes['LabelCharacteristics'] as IXMLLabelCharacteristics;
end;

function TXMLPalletCharacteristics.Get_ItemsPerTier: LongWord;
begin
  Result := ChildNodes['ItemsPerTier'].NodeValue;
end;

procedure TXMLPalletCharacteristics.Set_ItemsPerTier(Value: LongWord);
begin
  ChildNodes['ItemsPerTier'].NodeValue := Value;
end;

{ TXMLPalletCharacteristicsList }

function TXMLPalletCharacteristicsList.Add: IXMLPalletCharacteristics;
begin
  Result := AddItem(-1) as IXMLPalletCharacteristics;
end;

function TXMLPalletCharacteristicsList.Insert(const Index: Integer): IXMLPalletCharacteristics;
begin
  Result := AddItem(Index) as IXMLPalletCharacteristics;
end;

function TXMLPalletCharacteristicsList.Get_Item(Index: Integer): IXMLPalletCharacteristics;
begin
  Result := List[Index] as IXMLPalletCharacteristics;
end;

{ TXMLProductIdentification }

procedure TXMLProductIdentification.AfterConstruction;
begin
  RegisterChildNode('ProductIdentifier', TXMLProductIdentifier);
  RegisterChildNode('ProductDescription', TXMLProductDescription);
  FProductDescription := CreateCollection(TXMLProductDescriptionList, IXMLProductDescription, 'ProductDescription') as IXMLProductDescriptionList;
  inherited;
end;

function TXMLProductIdentification.Get_ProductIdentifier: IXMLProductIdentifier;
begin
  Result := ChildNodes['ProductIdentifier'] as IXMLProductIdentifier;
end;

function TXMLProductIdentification.Get_ProductDescription: IXMLProductDescriptionList;
begin
  Result := FProductDescription;
end;

{ TXMLProductIdentificationList }

function TXMLProductIdentificationList.Add: IXMLProductIdentification;
begin
  Result := AddItem(-1) as IXMLProductIdentification;
end;

function TXMLProductIdentificationList.Insert(const Index: Integer): IXMLProductIdentification;
begin
  Result := AddItem(Index) as IXMLProductIdentification;
end;

function TXMLProductIdentificationList.Get_Item(Index: Integer): IXMLProductIdentification;
begin
  Result := List[Index] as IXMLProductIdentification;
end;

{ TXMLLabelCharacteristics }

procedure TXMLLabelCharacteristics.AfterConstruction;
begin
  RegisterChildNode('CustomerMarks', TXMLCustomerMarks);
  RegisterChildNode('Length', TXMLMeasurement);
  RegisterChildNode('Width', TXMLMeasurement);
  RegisterChildNode('ColourCode', TXMLColourCode);
  FCustomerMarks := CreateCollection(TXMLCustomerMarksList, IXMLCustomerMarks, 'CustomerMarks') as IXMLCustomerMarksList;
  inherited;
end;

function TXMLLabelCharacteristics.Get_CustomerMarks: IXMLCustomerMarksList;
begin
  Result := FCustomerMarks;
end;

function TXMLLabelCharacteristics.Get_LabelStyle: UnicodeString;
begin
  Result := ChildNodes['LabelStyle'].Text;
end;

procedure TXMLLabelCharacteristics.Set_LabelStyle(Value: UnicodeString);
begin
  ChildNodes['LabelStyle'].NodeValue := Value;
end;

function TXMLLabelCharacteristics.Get_LabelBrandName: UnicodeString;
begin
  Result := ChildNodes['LabelBrandName'].Text;
end;

procedure TXMLLabelCharacteristics.Set_LabelBrandName(Value: UnicodeString);
begin
  ChildNodes['LabelBrandName'].NodeValue := Value;
end;

function TXMLLabelCharacteristics.Get_LabelPosition: UnicodeString;
begin
  Result := ChildNodes['LabelPosition'].Text;
end;

procedure TXMLLabelCharacteristics.Set_LabelPosition(Value: UnicodeString);
begin
  ChildNodes['LabelPosition'].NodeValue := Value;
end;

function TXMLLabelCharacteristics.Get_NumberOfLabels: LongWord;
begin
  Result := ChildNodes['NumberOfLabels'].NodeValue;
end;

procedure TXMLLabelCharacteristics.Set_NumberOfLabels(Value: LongWord);
begin
  ChildNodes['NumberOfLabels'].NodeValue := Value;
end;

function TXMLLabelCharacteristics.Get_Length: IXMLMeasurement;
begin
  Result := ChildNodes['Length'] as IXMLMeasurement;
end;

function TXMLLabelCharacteristics.Get_Width: IXMLMeasurement;
begin
  Result := ChildNodes['Width'] as IXMLMeasurement;
end;

function TXMLLabelCharacteristics.Get_ColourCode: IXMLColourCode;
begin
  Result := ChildNodes['ColourCode'] as IXMLColourCode;
end;

function TXMLLabelCharacteristics.Get_ColourDescription: UnicodeString;
begin
  Result := ChildNodes['ColourDescription'].Text;
end;

procedure TXMLLabelCharacteristics.Set_ColourDescription(Value: UnicodeString);
begin
  ChildNodes['ColourDescription'].NodeValue := Value;
end;

{ TXMLLabelCharacteristicsList }

function TXMLLabelCharacteristicsList.Add: IXMLLabelCharacteristics;
begin
  Result := AddItem(-1) as IXMLLabelCharacteristics;
end;

function TXMLLabelCharacteristicsList.Insert(const Index: Integer): IXMLLabelCharacteristics;
begin
  Result := AddItem(Index) as IXMLLabelCharacteristics;
end;

function TXMLLabelCharacteristicsList.Get_Item(Index: Integer): IXMLLabelCharacteristics;
begin
  Result := List[Index] as IXMLLabelCharacteristics;
end;

{ TXMLCustomerMarks }

function TXMLCustomerMarks.Get_CustomerMarksType: UnicodeString;
begin
  Result := AttributeNodes['CustomerMarksType'].Text;
end;

procedure TXMLCustomerMarks.Set_CustomerMarksType(Value: UnicodeString);
begin
  SetAttribute('CustomerMarksType', Value);
end;

function TXMLCustomerMarks.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLCustomerMarks.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLCustomerMarksList }

function TXMLCustomerMarksList.Add: IXMLCustomerMarks;
begin
  Result := AddItem(-1) as IXMLCustomerMarks;
end;

function TXMLCustomerMarksList.Insert(const Index: Integer): IXMLCustomerMarks;
begin
  Result := AddItem(Index) as IXMLCustomerMarks;
end;

function TXMLCustomerMarksList.Get_Item(Index: Integer): IXMLCustomerMarks;
begin
  Result := List[Index] as IXMLCustomerMarks;
end;

{ TXMLStencilCharacteristics }

procedure TXMLStencilCharacteristics.AfterConstruction;
begin
  ItemTag := 'StencilText';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLStencilCharacteristics.Get_StencilType: UnicodeString;
begin
  Result := AttributeNodes['StencilType'].Text;
end;

procedure TXMLStencilCharacteristics.Set_StencilType(Value: UnicodeString);
begin
  SetAttribute('StencilType', Value);
end;

function TXMLStencilCharacteristics.Get_StencilInkType: UnicodeString;
begin
  Result := AttributeNodes['StencilInkType'].Text;
end;

procedure TXMLStencilCharacteristics.Set_StencilInkType(Value: UnicodeString);
begin
  SetAttribute('StencilInkType', Value);
end;

function TXMLStencilCharacteristics.Get_StencilLocation: UnicodeString;
begin
  Result := AttributeNodes['StencilLocation'].Text;
end;

procedure TXMLStencilCharacteristics.Set_StencilLocation(Value: UnicodeString);
begin
  SetAttribute('StencilLocation', Value);
end;

function TXMLStencilCharacteristics.Get_StencilFormat: UnicodeString;
begin
  Result := AttributeNodes['StencilFormat'].Text;
end;

procedure TXMLStencilCharacteristics.Set_StencilFormat(Value: UnicodeString);
begin
  SetAttribute('StencilFormat', Value);
end;

function TXMLStencilCharacteristics.Get_StencilContent: UnicodeString;
begin
  Result := AttributeNodes['StencilContent'].Text;
end;

procedure TXMLStencilCharacteristics.Set_StencilContent(Value: UnicodeString);
begin
  SetAttribute('StencilContent', Value);
end;

function TXMLStencilCharacteristics.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLStencilCharacteristics.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

function TXMLStencilCharacteristics.Get_StencilText(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLStencilCharacteristics.Add(const StencilText: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := StencilText;
end;

function TXMLStencilCharacteristics.Insert(const Index: Integer; const StencilText: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := StencilText;
end;

{ TXMLStencilCharacteristicsList }

function TXMLStencilCharacteristicsList.Add: IXMLStencilCharacteristics;
begin
  Result := AddItem(-1) as IXMLStencilCharacteristics;
end;

function TXMLStencilCharacteristicsList.Insert(const Index: Integer): IXMLStencilCharacteristics;
begin
  Result := AddItem(Index) as IXMLStencilCharacteristics;
end;

function TXMLStencilCharacteristicsList.Get_Item(Index: Integer): IXMLStencilCharacteristics;
begin
  Result := List[Index] as IXMLStencilCharacteristics;
end;

{ TXMLMaximumClampingForce }

procedure TXMLMaximumClampingForce.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  RegisterChildNode('RangeMin', TXMLRangeMin);
  RegisterChildNode('RangeMax', TXMLRangeMax);
  inherited;
end;

function TXMLMaximumClampingForce.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

function TXMLMaximumClampingForce.Get_RangeMin: IXMLRangeMin;
begin
  Result := ChildNodes['RangeMin'] as IXMLRangeMin;
end;

function TXMLMaximumClampingForce.Get_RangeMax: IXMLRangeMax;
begin
  Result := ChildNodes['RangeMax'] as IXMLRangeMax;
end;

{ TXMLSheet }

procedure TXMLSheet.AfterConstruction;
begin
  RegisterChildNode('SheetConversionCharacteristics', TXMLSheetConversionCharacteristicsClass);
  RegisterChildNode('SheetPackagingCharacteristics', TXMLSheetPackagingCharacteristicsClass);
  inherited;
end;

function TXMLSheet.Get_SheetConversionCharacteristics: IXMLSheetConversionCharacteristicsClass;
begin
  Result := ChildNodes['SheetConversionCharacteristics'] as IXMLSheetConversionCharacteristicsClass;
end;

function TXMLSheet.Get_SheetPackagingCharacteristics: IXMLSheetPackagingCharacteristicsClass;
begin
  Result := ChildNodes['SheetPackagingCharacteristics'] as IXMLSheetPackagingCharacteristicsClass;
end;

{ TXMLSheetConversionCharacteristicsClass }

procedure TXMLSheetConversionCharacteristicsClass.AfterConstruction;
begin
  RegisterChildNode('ConversionCode', TXMLConversionCode);
  RegisterChildNode('SheetSize', TXMLSheetSize);
  RegisterChildNode('TargetProductWeight', TXMLMeasurement);
  RegisterChildNode('PunchedHoleDetails', TXMLPunchedHoleDetails);
  RegisterChildNode('CuttingDetails', TXMLCuttingDetails);
  RegisterChildNode('Embossing', TXMLEmbossing);
  RegisterChildNode('Watermark', TXMLWatermark);
  FSheetSize := CreateCollection(TXMLSheetSizeList, IXMLSheetSize, 'SheetSize') as IXMLSheetSizeList;
  FPunchedHoleDetails := CreateCollection(TXMLPunchedHoleDetailsList, IXMLPunchedHoleDetails, 'PunchedHoleDetails') as IXMLPunchedHoleDetailsList;
  FCuttingDetails := CreateCollection(TXMLCuttingDetailsList, IXMLCuttingDetails, 'CuttingDetails') as IXMLCuttingDetailsList;
  FEmbossing := CreateCollection(TXMLEmbossingList, IXMLEmbossing, 'Embossing') as IXMLEmbossingList;
  FWatermark := CreateCollection(TXMLWatermarkList, IXMLWatermark, 'Watermark') as IXMLWatermarkList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLSheetConversionCharacteristicsClass.Get_ConversionCode: IXMLConversionCode;
begin
  Result := ChildNodes['ConversionCode'] as IXMLConversionCode;
end;

function TXMLSheetConversionCharacteristicsClass.Get_GrainDirection: UnicodeString;
begin
  Result := ChildNodes['GrainDirection'].Text;
end;

procedure TXMLSheetConversionCharacteristicsClass.Set_GrainDirection(Value: UnicodeString);
begin
  ChildNodes['GrainDirection'].NodeValue := Value;
end;

function TXMLSheetConversionCharacteristicsClass.Get_WindingDirection: UnicodeString;
begin
  Result := ChildNodes['WindingDirection'].Text;
end;

procedure TXMLSheetConversionCharacteristicsClass.Set_WindingDirection(Value: UnicodeString);
begin
  ChildNodes['WindingDirection'].NodeValue := Value;
end;

function TXMLSheetConversionCharacteristicsClass.Get_SheetSize: IXMLSheetSizeList;
begin
  Result := FSheetSize;
end;

function TXMLSheetConversionCharacteristicsClass.Get_TargetProductWeight: IXMLMeasurement;
begin
  Result := ChildNodes['TargetProductWeight'] as IXMLMeasurement;
end;

function TXMLSheetConversionCharacteristicsClass.Get_PunchedHoleDetails: IXMLPunchedHoleDetailsList;
begin
  Result := FPunchedHoleDetails;
end;

function TXMLSheetConversionCharacteristicsClass.Get_CuttingDetails: IXMLCuttingDetailsList;
begin
  Result := FCuttingDetails;
end;

function TXMLSheetConversionCharacteristicsClass.Get_Embossing: IXMLEmbossingList;
begin
  Result := FEmbossing;
end;

function TXMLSheetConversionCharacteristicsClass.Get_Watermark: IXMLWatermarkList;
begin
  Result := FWatermark;
end;

function TXMLSheetConversionCharacteristicsClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLSheetSize }

procedure TXMLSheetSize.AfterConstruction;
begin
  RegisterChildNode('Length', TXMLMeasurement);
  RegisterChildNode('Width', TXMLMeasurement);
  inherited;
end;

function TXMLSheetSize.Get_Length: IXMLMeasurement;
begin
  Result := ChildNodes['Length'] as IXMLMeasurement;
end;

function TXMLSheetSize.Get_Width: IXMLMeasurement;
begin
  Result := ChildNodes['Width'] as IXMLMeasurement;
end;

function TXMLSheetSize.Get_PaperSizeType: UnicodeString;
begin
  Result := ChildNodes['PaperSizeType'].Text;
end;

procedure TXMLSheetSize.Set_PaperSizeType(Value: UnicodeString);
begin
  ChildNodes['PaperSizeType'].NodeValue := Value;
end;

{ TXMLSheetSizeList }

function TXMLSheetSizeList.Add: IXMLSheetSize;
begin
  Result := AddItem(-1) as IXMLSheetSize;
end;

function TXMLSheetSizeList.Insert(const Index: Integer): IXMLSheetSize;
begin
  Result := AddItem(Index) as IXMLSheetSize;
end;

function TXMLSheetSizeList.Get_Item(Index: Integer): IXMLSheetSize;
begin
  Result := List[Index] as IXMLSheetSize;
end;

{ TXMLPunchedHoleDetails }

procedure TXMLPunchedHoleDetails.AfterConstruction;
begin
  RegisterChildNode('NumberOfHoles', TXMLNumberOfHoles);
  RegisterChildNode('SizeOfHolePunch', TXMLSizeOfHolePunch);
  RegisterChildNode('HoleSpacing', TXMLHoleSpacing);
  RegisterChildNode('DistanceFromEdge', TXMLDistanceFromEdge);
  FDistanceFromEdge := CreateCollection(TXMLDistanceFromEdgeList, IXMLDistanceFromEdge, 'DistanceFromEdge') as IXMLDistanceFromEdgeList;
  FHolePunchTemplateReference := CreateCollection(TXMLS72List, IXMLNode, 'HolePunchTemplateReference') as IXMLS72List;
  inherited;
end;

function TXMLPunchedHoleDetails.Get_NumberOfHoles: IXMLNumberOfHoles;
begin
  Result := ChildNodes['NumberOfHoles'] as IXMLNumberOfHoles;
end;

function TXMLPunchedHoleDetails.Get_HoleReinforcement: UnicodeString;
begin
  Result := ChildNodes['HoleReinforcement'].Text;
end;

procedure TXMLPunchedHoleDetails.Set_HoleReinforcement(Value: UnicodeString);
begin
  ChildNodes['HoleReinforcement'].NodeValue := Value;
end;

function TXMLPunchedHoleDetails.Get_HolePunchType: UnicodeString;
begin
  Result := ChildNodes['HolePunchType'].Text;
end;

procedure TXMLPunchedHoleDetails.Set_HolePunchType(Value: UnicodeString);
begin
  ChildNodes['HolePunchType'].NodeValue := Value;
end;

function TXMLPunchedHoleDetails.Get_StandardSpacing: UnicodeString;
begin
  Result := ChildNodes['StandardSpacing'].Text;
end;

procedure TXMLPunchedHoleDetails.Set_StandardSpacing(Value: UnicodeString);
begin
  ChildNodes['StandardSpacing'].NodeValue := Value;
end;

function TXMLPunchedHoleDetails.Get_SizeOfHolePunch: IXMLSizeOfHolePunch;
begin
  Result := ChildNodes['SizeOfHolePunch'] as IXMLSizeOfHolePunch;
end;

function TXMLPunchedHoleDetails.Get_HoleSpacing: IXMLHoleSpacing;
begin
  Result := ChildNodes['HoleSpacing'] as IXMLHoleSpacing;
end;

function TXMLPunchedHoleDetails.Get_DistanceFromEdge: IXMLDistanceFromEdgeList;
begin
  Result := FDistanceFromEdge;
end;

function TXMLPunchedHoleDetails.Get_HolePunchTemplateReference: IXMLS72List;
begin
  Result := FHolePunchTemplateReference;
end;

{ TXMLPunchedHoleDetailsList }

function TXMLPunchedHoleDetailsList.Add: IXMLPunchedHoleDetails;
begin
  Result := AddItem(-1) as IXMLPunchedHoleDetails;
end;

function TXMLPunchedHoleDetailsList.Insert(const Index: Integer): IXMLPunchedHoleDetails;
begin
  Result := AddItem(Index) as IXMLPunchedHoleDetails;
end;

function TXMLPunchedHoleDetailsList.Get_Item(Index: Integer): IXMLPunchedHoleDetails;
begin
  Result := List[Index] as IXMLPunchedHoleDetails;
end;

{ TXMLNumberOfHoles }

{ TXMLSizeOfHolePunch }

function TXMLSizeOfHolePunch.Get_ShapeOfHole: UnicodeString;
begin
  Result := AttributeNodes['ShapeOfHole'].Text;
end;

procedure TXMLSizeOfHolePunch.Set_ShapeOfHole(Value: UnicodeString);
begin
  SetAttribute('ShapeOfHole', Value);
end;

{ TXMLHoleSpacing }

procedure TXMLHoleSpacing.AfterConstruction;
begin
  RegisterChildNode('EvenSpacing', TXMLEvenSpacing);
  inherited;
end;

function TXMLHoleSpacing.Get_EvenSpacing: IXMLEvenSpacing;
begin
  Result := ChildNodes['EvenSpacing'] as IXMLEvenSpacing;
end;

function TXMLHoleSpacing.Get_UnevenSpacing: UnicodeString;
begin
  Result := ChildNodes['UnevenSpacing'].Text;
end;

procedure TXMLHoleSpacing.Set_UnevenSpacing(Value: UnicodeString);
begin
  ChildNodes['UnevenSpacing'].NodeValue := Value;
end;

{ TXMLEvenSpacing }

procedure TXMLEvenSpacing.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  inherited;
end;

function TXMLEvenSpacing.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

{ TXMLDistanceFromEdge }

function TXMLDistanceFromEdge.Get_EdgeType: UnicodeString;
begin
  Result := AttributeNodes['EdgeType'].Text;
end;

procedure TXMLDistanceFromEdge.Set_EdgeType(Value: UnicodeString);
begin
  SetAttribute('EdgeType', Value);
end;

function TXMLDistanceFromEdge.Get_DistanceMeasuredTo: UnicodeString;
begin
  Result := AttributeNodes['DistanceMeasuredTo'].Text;
end;

procedure TXMLDistanceFromEdge.Set_DistanceMeasuredTo(Value: UnicodeString);
begin
  SetAttribute('DistanceMeasuredTo', Value);
end;

{ TXMLDistanceFromEdgeList }

function TXMLDistanceFromEdgeList.Add: IXMLDistanceFromEdge;
begin
  Result := AddItem(-1) as IXMLDistanceFromEdge;
end;

function TXMLDistanceFromEdgeList.Insert(const Index: Integer): IXMLDistanceFromEdge;
begin
  Result := AddItem(Index) as IXMLDistanceFromEdge;
end;

function TXMLDistanceFromEdgeList.Get_Item(Index: Integer): IXMLDistanceFromEdge;
begin
  Result := List[Index] as IXMLDistanceFromEdge;
end;

{ TXMLCuttingDetails }

procedure TXMLCuttingDetails.AfterConstruction;
begin
  RegisterChildNode('CuttingTemplateCode', TXMLCuttingTemplateCode);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLCuttingDetails.Get_CuttingTemplateCode: IXMLCuttingTemplateCode;
begin
  Result := ChildNodes['CuttingTemplateCode'] as IXMLCuttingTemplateCode;
end;

function TXMLCuttingDetails.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLCuttingDetailsList }

function TXMLCuttingDetailsList.Add: IXMLCuttingDetails;
begin
  Result := AddItem(-1) as IXMLCuttingDetails;
end;

function TXMLCuttingDetailsList.Insert(const Index: Integer): IXMLCuttingDetails;
begin
  Result := AddItem(Index) as IXMLCuttingDetails;
end;

function TXMLCuttingDetailsList.Get_Item(Index: Integer): IXMLCuttingDetails;
begin
  Result := List[Index] as IXMLCuttingDetails;
end;

{ TXMLCuttingTemplateCode }

function TXMLCuttingTemplateCode.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLCuttingTemplateCode.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

function TXMLCuttingTemplateCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLCuttingTemplateCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLSheetPackagingCharacteristicsClass }

procedure TXMLSheetPackagingCharacteristicsClass.AfterConstruction;
begin
  RegisterChildNode('PackagingCode', TXMLPackagingCode);
  RegisterChildNode('PackagingDescription', TXMLPackagingDescription);
  RegisterChildNode('ReamWeight', TXMLMeasurement);
  RegisterChildNode('MWeight', TXMLMeasurement);
  RegisterChildNode('SheetCount', TXMLSheetCount);
  RegisterChildNode('UnitsPerCarton', TXMLMeasurement);
  RegisterChildNode('Wrap', TXMLWrap);
  RegisterChildNode('BandCharacteristics', TXMLBandCharacteristics);
  RegisterChildNode('PalletCharacteristics', TXMLPalletCharacteristics);
  RegisterChildNode('LabelCharacteristics', TXMLLabelCharacteristics);
  RegisterChildNode('StencilCharacteristics', TXMLStencilCharacteristics);
  RegisterChildNode('MaximumHeight', TXMLMeasurement);
  RegisterChildNode('MaximumGrossWeight', TXMLMeasurement);
  FPackagingCode := CreateCollection(TXMLPackagingCodeList, IXMLPackagingCode, 'PackagingCode') as IXMLPackagingCodeList;
  FPackagingDescription := CreateCollection(TXMLPackagingDescriptionList, IXMLPackagingDescription, 'PackagingDescription') as IXMLPackagingDescriptionList;
  FReamType := CreateCollection(TXMLReamTypeList, IXMLNode, 'ReamType') as IXMLReamTypeList;
  FReamWeight := CreateCollection(TXMLMeasurementList, IXMLMeasurement, 'ReamWeight') as IXMLMeasurementList;
  FMWeight := CreateCollection(TXMLMeasurementList, IXMLMeasurement, 'MWeight') as IXMLMeasurementList;
  FSheetCount := CreateCollection(TXMLSheetCountList, IXMLSheetCount, 'SheetCount') as IXMLSheetCountList;
  FUnitsPerCarton := CreateCollection(TXMLMeasurementList, IXMLMeasurement, 'UnitsPerCarton') as IXMLMeasurementList;
  FWrap := CreateCollection(TXMLWrapList, IXMLWrap, 'Wrap') as IXMLWrapList;
  FBandCharacteristics := CreateCollection(TXMLBandCharacteristicsList, IXMLBandCharacteristics, 'BandCharacteristics') as IXMLBandCharacteristicsList;
  FPalletCharacteristics := CreateCollection(TXMLPalletCharacteristicsList, IXMLPalletCharacteristics, 'PalletCharacteristics') as IXMLPalletCharacteristicsList;
  FLabelCharacteristics := CreateCollection(TXMLLabelCharacteristicsList, IXMLLabelCharacteristics, 'LabelCharacteristics') as IXMLLabelCharacteristicsList;
  FStencilCharacteristics := CreateCollection(TXMLStencilCharacteristicsList, IXMLStencilCharacteristics, 'StencilCharacteristics') as IXMLStencilCharacteristicsList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_ActionType: UnicodeString;
begin
  Result := AttributeNodes['ActionType'].Text;
end;

procedure TXMLSheetPackagingCharacteristicsClass.Set_ActionType(Value: UnicodeString);
begin
  SetAttribute('ActionType', Value);
end;

function TXMLSheetPackagingCharacteristicsClass.Get_PackagingCode: IXMLPackagingCodeList;
begin
  Result := FPackagingCode;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_PackagingDescription: IXMLPackagingDescriptionList;
begin
  Result := FPackagingDescription;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_ReamType: IXMLReamTypeList;
begin
  Result := FReamType;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_ReamWeight: IXMLMeasurementList;
begin
  Result := FReamWeight;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_MWeight: IXMLMeasurementList;
begin
  Result := FMWeight;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_SheetCount: IXMLSheetCountList;
begin
  Result := FSheetCount;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_UnitsPerCarton: IXMLMeasurementList;
begin
  Result := FUnitsPerCarton;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_Wrap: IXMLWrapList;
begin
  Result := FWrap;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_BandCharacteristics: IXMLBandCharacteristicsList;
begin
  Result := FBandCharacteristics;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_PalletCharacteristics: IXMLPalletCharacteristicsList;
begin
  Result := FPalletCharacteristics;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_LabelCharacteristics: IXMLLabelCharacteristicsList;
begin
  Result := FLabelCharacteristics;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_StencilCharacteristics: IXMLStencilCharacteristicsList;
begin
  Result := FStencilCharacteristics;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_MaximumHeight: IXMLMeasurement;
begin
  Result := ChildNodes['MaximumHeight'] as IXMLMeasurement;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_MaximumGrossWeight: IXMLMeasurement;
begin
  Result := ChildNodes['MaximumGrossWeight'] as IXMLMeasurement;
end;

function TXMLSheetPackagingCharacteristicsClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLSheetCount }

function TXMLSheetCount.Get_SheetCountMethodType: UnicodeString;
begin
  Result := AttributeNodes['SheetCountMethodType'].Text;
end;

procedure TXMLSheetCount.Set_SheetCountMethodType(Value: UnicodeString);
begin
  SetAttribute('SheetCountMethodType', Value);
end;

function TXMLSheetCount.Get_PerCarton: LongWord;
begin
  Result := ChildNodes['PerCarton'].NodeValue;
end;

procedure TXMLSheetCount.Set_PerCarton(Value: LongWord);
begin
  ChildNodes['PerCarton'].NodeValue := Value;
end;

function TXMLSheetCount.Get_PerReam: LongWord;
begin
  Result := ChildNodes['PerReam'].NodeValue;
end;

procedure TXMLSheetCount.Set_PerReam(Value: LongWord);
begin
  ChildNodes['PerReam'].NodeValue := Value;
end;

function TXMLSheetCount.Get_PerPallet: LongWord;
begin
  Result := ChildNodes['PerPallet'].NodeValue;
end;

procedure TXMLSheetCount.Set_PerPallet(Value: LongWord);
begin
  ChildNodes['PerPallet'].NodeValue := Value;
end;

function TXMLSheetCount.Get_PerTab: LongWord;
begin
  Result := ChildNodes['PerTab'].NodeValue;
end;

procedure TXMLSheetCount.Set_PerTab(Value: LongWord);
begin
  ChildNodes['PerTab'].NodeValue := Value;
end;

{ TXMLSheetCountList }

function TXMLSheetCountList.Add: IXMLSheetCount;
begin
  Result := AddItem(-1) as IXMLSheetCount;
end;

function TXMLSheetCountList.Insert(const Index: Integer): IXMLSheetCount;
begin
  Result := AddItem(Index) as IXMLSheetCount;
end;

function TXMLSheetCountList.Get_Item(Index: Integer): IXMLSheetCount;
begin
  Result := List[Index] as IXMLSheetCount;
end;

{ TXMLSuppliedComponentReference }

function TXMLSuppliedComponentReference.Get_SuppliedComponentReferenceType: UnicodeString;
begin
  Result := AttributeNodes['SuppliedComponentReferenceType'].Text;
end;

procedure TXMLSuppliedComponentReference.Set_SuppliedComponentReferenceType(Value: UnicodeString);
begin
  SetAttribute('SuppliedComponentReferenceType', Value);
end;

function TXMLSuppliedComponentReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLSuppliedComponentReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLSuppliedComponentReferenceList }

function TXMLSuppliedComponentReferenceList.Add: IXMLSuppliedComponentReference;
begin
  Result := AddItem(-1) as IXMLSuppliedComponentReference;
end;

function TXMLSuppliedComponentReferenceList.Insert(const Index: Integer): IXMLSuppliedComponentReference;
begin
  Result := AddItem(Index) as IXMLSuppliedComponentReference;
end;

function TXMLSuppliedComponentReferenceList.Get_Item(Index: Integer): IXMLSuppliedComponentReference;
begin
  Result := List[Index] as IXMLSuppliedComponentReference;
end;

{ TXMLComponentShipDate }

procedure TXMLComponentShipDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLComponentShipDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLComponentShipDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLComponentShipDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLComponentDueDate }

procedure TXMLComponentDueDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLComponentDueDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLComponentDueDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLComponentDueDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLComponentNeededDate }

procedure TXMLComponentNeededDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLComponentNeededDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLComponentNeededDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLComponentNeededDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLOrderStatusInformation }

procedure TXMLOrderStatusInformation.AfterConstruction;
begin
  RegisterChildNode('OrderPrimaryStatus', TXMLOrderPrimaryStatus);
  RegisterChildNode('OrderSecondaryStatus', TXMLOrderSecondaryStatus);
  RegisterChildNode('OrderStatusInformationDate', TXMLOrderStatusInformationDate);
  RegisterChildNode('QuantityInformation', TXMLQuantityInformation);
  inherited;
end;

function TXMLOrderStatusInformation.Get_OrderPrimaryStatus: IXMLOrderPrimaryStatus;
begin
  Result := ChildNodes['OrderPrimaryStatus'] as IXMLOrderPrimaryStatus;
end;

function TXMLOrderStatusInformation.Get_OrderSecondaryStatus: IXMLOrderSecondaryStatus;
begin
  Result := ChildNodes['OrderSecondaryStatus'] as IXMLOrderSecondaryStatus;
end;

function TXMLOrderStatusInformation.Get_OrderStatusInformationDate: IXMLOrderStatusInformationDate;
begin
  Result := ChildNodes['OrderStatusInformationDate'] as IXMLOrderStatusInformationDate;
end;

function TXMLOrderStatusInformation.Get_QuantityInformation: IXMLQuantityInformation;
begin
  Result := ChildNodes['QuantityInformation'] as IXMLQuantityInformation;
end;

{ TXMLOrderPrimaryStatus }

function TXMLOrderPrimaryStatus.Get_OrderStatusCode: UnicodeString;
begin
  Result := AttributeNodes['OrderStatusCode'].Text;
end;

procedure TXMLOrderPrimaryStatus.Set_OrderStatusCode(Value: UnicodeString);
begin
  SetAttribute('OrderStatusCode', Value);
end;

{ TXMLOrderSecondaryStatus }

function TXMLOrderSecondaryStatus.Get_OrderStatusCode: UnicodeString;
begin
  Result := AttributeNodes['OrderStatusCode'].Text;
end;

procedure TXMLOrderSecondaryStatus.Set_OrderStatusCode(Value: UnicodeString);
begin
  SetAttribute('OrderStatusCode', Value);
end;

{ TXMLOrderStatusInformationDate }

procedure TXMLOrderStatusInformationDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLOrderStatusInformationDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLOrderStatusInformationDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLOrderStatusInformationDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLPackagingCharacteristics }

procedure TXMLPackagingCharacteristics.AfterConstruction;
begin
  RegisterChildNode('BoxCharacteristics', TXMLBoxCharacteristics);
  RegisterChildNode('PalletPackagingCharacteristics', TXMLPalletPackagingCharacteristics);
  RegisterChildNode('BookUnitPacking', TXMLBookUnitPacking);
  RegisterChildNode('DocumentInformation', TXMLDocumentInformation);
  FDocumentInformation := CreateCollection(TXMLDocumentInformationList, IXMLDocumentInformation, 'DocumentInformation') as IXMLDocumentInformationList;
  inherited;
end;

function TXMLPackagingCharacteristics.Get_IsBoxed: UnicodeString;
begin
  Result := AttributeNodes['IsBoxed'].Text;
end;

procedure TXMLPackagingCharacteristics.Set_IsBoxed(Value: UnicodeString);
begin
  SetAttribute('IsBoxed', Value);
end;

function TXMLPackagingCharacteristics.Get_IsPalletized: UnicodeString;
begin
  Result := AttributeNodes['IsPalletized'].Text;
end;

procedure TXMLPackagingCharacteristics.Set_IsPalletized(Value: UnicodeString);
begin
  SetAttribute('IsPalletized', Value);
end;

function TXMLPackagingCharacteristics.Get_BoxCharacteristics: IXMLBoxCharacteristics;
begin
  Result := ChildNodes['BoxCharacteristics'] as IXMLBoxCharacteristics;
end;

function TXMLPackagingCharacteristics.Get_PalletPackagingCharacteristics: IXMLPalletPackagingCharacteristics;
begin
  Result := ChildNodes['PalletPackagingCharacteristics'] as IXMLPalletPackagingCharacteristics;
end;

function TXMLPackagingCharacteristics.Get_BookUnitPacking: IXMLBookUnitPacking;
begin
  Result := ChildNodes['BookUnitPacking'] as IXMLBookUnitPacking;
end;

function TXMLPackagingCharacteristics.Get_DocumentInformation: IXMLDocumentInformationList;
begin
  Result := FDocumentInformation;
end;

{ TXMLPackagingCharacteristicsList }

function TXMLPackagingCharacteristicsList.Add: IXMLPackagingCharacteristics;
begin
  Result := AddItem(-1) as IXMLPackagingCharacteristics;
end;

function TXMLPackagingCharacteristicsList.Insert(const Index: Integer): IXMLPackagingCharacteristics;
begin
  Result := AddItem(Index) as IXMLPackagingCharacteristics;
end;

function TXMLPackagingCharacteristicsList.Get_Item(Index: Integer): IXMLPackagingCharacteristics;
begin
  Result := List[Index] as IXMLPackagingCharacteristics;
end;

{ TXMLBoxCharacteristics }

procedure TXMLBoxCharacteristics.AfterConstruction;
begin
  RegisterChildNode('ProductIdentification', TXMLProductIdentification);
  RegisterChildNode('Height', TXMLMeasurement);
  RegisterChildNode('Length', TXMLMeasurement);
  RegisterChildNode('Width', TXMLMeasurement);
  RegisterChildNode('Weight', TXMLMeasurement);
  RegisterChildNode('Burst', TXMLBurst);
  RegisterChildNode('BurstIndex', TXMLBurstIndex);
  RegisterChildNode('UnitsPerCarton', TXMLMeasurement);
  RegisterChildNode('LabelCharacteristics', TXMLLabelCharacteristics);
  RegisterChildNode('StencilCharacteristics', TXMLStencilCharacteristics);
  RegisterChildNode('WrapCharacteristics', TXMLWrapCharacteristics);
  RegisterChildNode('BandCharacteristics', TXMLBandCharacteristics);
  FLabelCharacteristics := CreateCollection(TXMLLabelCharacteristicsList, IXMLLabelCharacteristics, 'LabelCharacteristics') as IXMLLabelCharacteristicsList;
  FStencilCharacteristics := CreateCollection(TXMLStencilCharacteristicsList, IXMLStencilCharacteristics, 'StencilCharacteristics') as IXMLStencilCharacteristicsList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLBoxCharacteristics.Get_BoxType: UnicodeString;
begin
  Result := AttributeNodes['BoxType'].Text;
end;

procedure TXMLBoxCharacteristics.Set_BoxType(Value: UnicodeString);
begin
  SetAttribute('BoxType', Value);
end;

function TXMLBoxCharacteristics.Get_BoxMeasurementsAppliesTo: UnicodeString;
begin
  Result := AttributeNodes['BoxMeasurementsAppliesTo'].Text;
end;

procedure TXMLBoxCharacteristics.Set_BoxMeasurementsAppliesTo(Value: UnicodeString);
begin
  SetAttribute('BoxMeasurementsAppliesTo', Value);
end;

function TXMLBoxCharacteristics.Get_IsRFTagRequired: UnicodeString;
begin
  Result := AttributeNodes['IsRFTagRequired'].Text;
end;

procedure TXMLBoxCharacteristics.Set_IsRFTagRequired(Value: UnicodeString);
begin
  SetAttribute('IsRFTagRequired', Value);
end;

function TXMLBoxCharacteristics.Get_ProductIdentification: IXMLProductIdentification;
begin
  Result := ChildNodes['ProductIdentification'] as IXMLProductIdentification;
end;

function TXMLBoxCharacteristics.Get_Height: IXMLMeasurement;
begin
  Result := ChildNodes['Height'] as IXMLMeasurement;
end;

function TXMLBoxCharacteristics.Get_Length: IXMLMeasurement;
begin
  Result := ChildNodes['Length'] as IXMLMeasurement;
end;

function TXMLBoxCharacteristics.Get_Width: IXMLMeasurement;
begin
  Result := ChildNodes['Width'] as IXMLMeasurement;
end;

function TXMLBoxCharacteristics.Get_Weight: IXMLMeasurement;
begin
  Result := ChildNodes['Weight'] as IXMLMeasurement;
end;

function TXMLBoxCharacteristics.Get_Burst: IXMLBurst;
begin
  Result := ChildNodes['Burst'] as IXMLBurst;
end;

function TXMLBoxCharacteristics.Get_BurstIndex: IXMLBurstIndex;
begin
  Result := ChildNodes['BurstIndex'] as IXMLBurstIndex;
end;

function TXMLBoxCharacteristics.Get_UnitsPerCarton: IXMLMeasurement;
begin
  Result := ChildNodes['UnitsPerCarton'] as IXMLMeasurement;
end;

function TXMLBoxCharacteristics.Get_LabelCharacteristics: IXMLLabelCharacteristicsList;
begin
  Result := FLabelCharacteristics;
end;

function TXMLBoxCharacteristics.Get_StencilCharacteristics: IXMLStencilCharacteristicsList;
begin
  Result := FStencilCharacteristics;
end;

function TXMLBoxCharacteristics.Get_WrapCharacteristics: IXMLWrapCharacteristics;
begin
  Result := ChildNodes['WrapCharacteristics'] as IXMLWrapCharacteristics;
end;

function TXMLBoxCharacteristics.Get_BandCharacteristics: IXMLBandCharacteristics;
begin
  Result := ChildNodes['BandCharacteristics'] as IXMLBandCharacteristics;
end;

function TXMLBoxCharacteristics.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLWrapCharacteristics }

procedure TXMLWrapCharacteristics.AfterConstruction;
begin
  RegisterChildNode('Wrap', TXMLWrap);
  FWrap := CreateCollection(TXMLWrapList, IXMLWrap, 'Wrap') as IXMLWrapList;
  inherited;
end;

function TXMLWrapCharacteristics.Get_PackagesPerWrap: LongWord;
begin
  Result := ChildNodes['PackagesPerWrap'].NodeValue;
end;

procedure TXMLWrapCharacteristics.Set_PackagesPerWrap(Value: LongWord);
begin
  ChildNodes['PackagesPerWrap'].NodeValue := Value;
end;

function TXMLWrapCharacteristics.Get_Wrap: IXMLWrapList;
begin
  Result := FWrap;
end;

{ TXMLPalletPackagingCharacteristics }

procedure TXMLPalletPackagingCharacteristics.AfterConstruction;
begin
  RegisterChildNode('PackagingCode', TXMLPackagingCode);
  RegisterChildNode('PackagingDescription', TXMLPackagingDescription);
  RegisterChildNode('WrapCharacteristics', TXMLWrapCharacteristics);
  RegisterChildNode('PalletCharacteristics', TXMLPalletCharacteristics);
  RegisterChildNode('BandCharacteristics', TXMLBandCharacteristics);
  RegisterChildNode('LabelCharacteristics', TXMLLabelCharacteristics);
  RegisterChildNode('StencilCharacteristics', TXMLStencilCharacteristics);
  RegisterChildNode('MaximumHeight', TXMLMeasurement);
  RegisterChildNode('MaximumGrossWeight', TXMLMeasurement);
  FLabelCharacteristics := CreateCollection(TXMLLabelCharacteristicsList, IXMLLabelCharacteristics, 'LabelCharacteristics') as IXMLLabelCharacteristicsList;
  FStencilCharacteristics := CreateCollection(TXMLStencilCharacteristicsList, IXMLStencilCharacteristics, 'StencilCharacteristics') as IXMLStencilCharacteristicsList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLPalletPackagingCharacteristics.Get_PackagingCode: IXMLPackagingCode;
begin
  Result := ChildNodes['PackagingCode'] as IXMLPackagingCode;
end;

function TXMLPalletPackagingCharacteristics.Get_PackagingDescription: IXMLPackagingDescription;
begin
  Result := ChildNodes['PackagingDescription'] as IXMLPackagingDescription;
end;

function TXMLPalletPackagingCharacteristics.Get_WrapCharacteristics: IXMLWrapCharacteristics;
begin
  Result := ChildNodes['WrapCharacteristics'] as IXMLWrapCharacteristics;
end;

function TXMLPalletPackagingCharacteristics.Get_PalletCharacteristics: IXMLPalletCharacteristics;
begin
  Result := ChildNodes['PalletCharacteristics'] as IXMLPalletCharacteristics;
end;

function TXMLPalletPackagingCharacteristics.Get_BandCharacteristics: IXMLBandCharacteristics;
begin
  Result := ChildNodes['BandCharacteristics'] as IXMLBandCharacteristics;
end;

function TXMLPalletPackagingCharacteristics.Get_LabelCharacteristics: IXMLLabelCharacteristicsList;
begin
  Result := FLabelCharacteristics;
end;

function TXMLPalletPackagingCharacteristics.Get_StencilCharacteristics: IXMLStencilCharacteristicsList;
begin
  Result := FStencilCharacteristics;
end;

function TXMLPalletPackagingCharacteristics.Get_MaximumHeight: IXMLMeasurement;
begin
  Result := ChildNodes['MaximumHeight'] as IXMLMeasurement;
end;

function TXMLPalletPackagingCharacteristics.Get_MaximumGrossWeight: IXMLMeasurement;
begin
  Result := ChildNodes['MaximumGrossWeight'] as IXMLMeasurement;
end;

function TXMLPalletPackagingCharacteristics.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLBookUnitPacking }

procedure TXMLBookUnitPacking.AfterConstruction;
begin
  RegisterChildNode('UnitCharacteristics', TXMLUnitCharacteristics);
  RegisterChildNode('LabelCharacteristics', TXMLLabelCharacteristics);
  RegisterChildNode('StencilCharacteristics', TXMLStencilCharacteristics);
  RegisterChildNode('WrapCharacteristics', TXMLWrapCharacteristics);
  FLabelCharacteristics := CreateCollection(TXMLLabelCharacteristicsList, IXMLLabelCharacteristics, 'LabelCharacteristics') as IXMLLabelCharacteristicsList;
  FStencilCharacteristics := CreateCollection(TXMLStencilCharacteristicsList, IXMLStencilCharacteristics, 'StencilCharacteristics') as IXMLStencilCharacteristicsList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLBookUnitPacking.Get_BookUnitType: UnicodeString;
begin
  Result := AttributeNodes['BookUnitType'].Text;
end;

procedure TXMLBookUnitPacking.Set_BookUnitType(Value: UnicodeString);
begin
  SetAttribute('BookUnitType', Value);
end;

function TXMLBookUnitPacking.Get_PackageType: UnicodeString;
begin
  Result := AttributeNodes['PackageType'].Text;
end;

procedure TXMLBookUnitPacking.Set_PackageType(Value: UnicodeString);
begin
  SetAttribute('PackageType', Value);
end;

function TXMLBookUnitPacking.Get_UnitCharacteristics: IXMLUnitCharacteristics;
begin
  Result := ChildNodes['UnitCharacteristics'] as IXMLUnitCharacteristics;
end;

function TXMLBookUnitPacking.Get_LabelCharacteristics: IXMLLabelCharacteristicsList;
begin
  Result := FLabelCharacteristics;
end;

function TXMLBookUnitPacking.Get_StencilCharacteristics: IXMLStencilCharacteristicsList;
begin
  Result := FStencilCharacteristics;
end;

function TXMLBookUnitPacking.Get_WrapCharacteristics: IXMLWrapCharacteristics;
begin
  Result := ChildNodes['WrapCharacteristics'] as IXMLWrapCharacteristics;
end;

function TXMLBookUnitPacking.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLUnitCharacteristics }

procedure TXMLUnitCharacteristics.AfterConstruction;
begin
  RegisterChildNode('Height', TXMLMeasurement);
  RegisterChildNode('Thickness', TXMLMeasurement);
  RegisterChildNode('Width', TXMLMeasurement);
  RegisterChildNode('Weight', TXMLMeasurement);
  inherited;
end;

function TXMLUnitCharacteristics.Get_Height: IXMLMeasurement;
begin
  Result := ChildNodes['Height'] as IXMLMeasurement;
end;

function TXMLUnitCharacteristics.Get_Thickness: IXMLMeasurement;
begin
  Result := ChildNodes['Thickness'] as IXMLMeasurement;
end;

function TXMLUnitCharacteristics.Get_Width: IXMLMeasurement;
begin
  Result := ChildNodes['Width'] as IXMLMeasurement;
end;

function TXMLUnitCharacteristics.Get_Weight: IXMLMeasurement;
begin
  Result := ChildNodes['Weight'] as IXMLMeasurement;
end;

{ TXMLDocumentInformation }

procedure TXMLDocumentInformation.AfterConstruction;
begin
  RegisterChildNode('NumberOfDocuments', TXMLNumberOfDocuments);
  RegisterChildNode('DocumentInstruction', TXMLDocumentInstruction);
  FNumberOfDocuments := CreateCollection(TXMLNumberOfDocumentsList, IXMLNumberOfDocuments, 'NumberOfDocuments') as IXMLNumberOfDocumentsList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLDocumentInformation.Get_DocumentType: UnicodeString;
begin
  Result := AttributeNodes['DocumentType'].Text;
end;

procedure TXMLDocumentInformation.Set_DocumentType(Value: UnicodeString);
begin
  SetAttribute('DocumentType', Value);
end;

function TXMLDocumentInformation.Get_NumberOfDocuments: IXMLNumberOfDocumentsList;
begin
  Result := FNumberOfDocuments;
end;

function TXMLDocumentInformation.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLDocumentInformation.Get_DocumentInstruction: IXMLDocumentInstruction;
begin
  Result := ChildNodes['DocumentInstruction'] as IXMLDocumentInstruction;
end;

{ TXMLDocumentInformationList }

function TXMLDocumentInformationList.Add: IXMLDocumentInformation;
begin
  Result := AddItem(-1) as IXMLDocumentInformation;
end;

function TXMLDocumentInformationList.Insert(const Index: Integer): IXMLDocumentInformation;
begin
  Result := AddItem(Index) as IXMLDocumentInformation;
end;

function TXMLDocumentInformationList.Get_Item(Index: Integer): IXMLDocumentInformation;
begin
  Result := List[Index] as IXMLDocumentInformation;
end;

{ TXMLNumberOfDocuments }

function TXMLNumberOfDocuments.Get_Original: UnicodeString;
begin
  Result := AttributeNodes['Original'].Text;
end;

procedure TXMLNumberOfDocuments.Set_Original(Value: UnicodeString);
begin
  SetAttribute('Original', Value);
end;

{ TXMLNumberOfDocumentsList }

function TXMLNumberOfDocumentsList.Add: IXMLNumberOfDocuments;
begin
  Result := AddItem(-1) as IXMLNumberOfDocuments;
end;

function TXMLNumberOfDocumentsList.Insert(const Index: Integer): IXMLNumberOfDocuments;
begin
  Result := AddItem(Index) as IXMLNumberOfDocuments;
end;

function TXMLNumberOfDocumentsList.Get_Item(Index: Integer): IXMLNumberOfDocuments;
begin
  Result := List[Index] as IXMLNumberOfDocuments;
end;

{ TXMLDocumentInstruction }

procedure TXMLDocumentInstruction.AfterConstruction;
begin
  RegisterChildNode('DocumentContent', TXMLDocumentContent);
  FDocumentInstructionText := CreateCollection(TXMLS255List, IXMLNode, 'DocumentInstructionText') as IXMLS255List;
  FDocumentContent := CreateCollection(TXMLDocumentContentList, IXMLDocumentContent, 'DocumentContent') as IXMLDocumentContentList;
  inherited;
end;

function TXMLDocumentInstruction.Get_DocumentInstructionText: IXMLS255List;
begin
  Result := FDocumentInstructionText;
end;

function TXMLDocumentInstruction.Get_DocumentContent: IXMLDocumentContentList;
begin
  Result := FDocumentContent;
end;

{ TXMLDocumentContent }

procedure TXMLDocumentContent.AfterConstruction;
begin
  ItemTag := 'DocumentContentText';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLDocumentContent.Get_DocumentContentType: UnicodeString;
begin
  Result := AttributeNodes['DocumentContentType'].Text;
end;

procedure TXMLDocumentContent.Set_DocumentContentType(Value: UnicodeString);
begin
  SetAttribute('DocumentContentType', Value);
end;

function TXMLDocumentContent.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLDocumentContent.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

function TXMLDocumentContent.Get_DocumentContentText(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLDocumentContent.Add(const DocumentContentText: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := DocumentContentText;
end;

function TXMLDocumentContent.Insert(const Index: Integer; const DocumentContentText: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := DocumentContentText;
end;

{ TXMLDocumentContentList }

function TXMLDocumentContentList.Add: IXMLDocumentContent;
begin
  Result := AddItem(-1) as IXMLDocumentContent;
end;

function TXMLDocumentContentList.Insert(const Index: Integer): IXMLDocumentContent;
begin
  Result := AddItem(Index) as IXMLDocumentContent;
end;

function TXMLDocumentContentList.Get_Item(Index: Integer): IXMLDocumentContent;
begin
  Result := List[Index] as IXMLDocumentContent;
end;

{ TXMLForestWood }

procedure TXMLForestWood.AfterConstruction;
begin
  RegisterChildNode('TreeSpeciesGroup', TXMLTreeSpeciesGroup);
  RegisterChildNode('ForestWoodClass', TXMLForestWoodClass);
  RegisterChildNode('ForestWoodCharacteristics', TXMLForestWoodCharacteristics);
  RegisterChildNode('ForestWoodPackagingCharacteristics', TXMLForestWoodPackagingCharacteristics);
  RegisterChildNode('ForestWoodProcessingCharacteristics', TXMLForestWoodProcessingCharacteristics);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FTreeSpeciesGroup := CreateCollection(TXMLTreeSpeciesGroupList, IXMLTreeSpeciesGroup, 'TreeSpeciesGroup') as IXMLTreeSpeciesGroupList;
  FForestWoodClass := CreateCollection(TXMLForestWoodClassList, IXMLForestWoodClass, 'ForestWoodClass') as IXMLForestWoodClassList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLForestWood.Get_ForestWoodType: UnicodeString;
begin
  Result := AttributeNodes['ForestWoodType'].Text;
end;

procedure TXMLForestWood.Set_ForestWoodType(Value: UnicodeString);
begin
  SetAttribute('ForestWoodType', Value);
end;

function TXMLForestWood.Get_ForestWoodItemType: UnicodeString;
begin
  Result := AttributeNodes['ForestWoodItemType'].Text;
end;

procedure TXMLForestWood.Set_ForestWoodItemType(Value: UnicodeString);
begin
  SetAttribute('ForestWoodItemType', Value);
end;

function TXMLForestWood.Get_IsForestWoodReject: UnicodeString;
begin
  Result := AttributeNodes['IsForestWoodReject'].Text;
end;

procedure TXMLForestWood.Set_IsForestWoodReject(Value: UnicodeString);
begin
  SetAttribute('IsForestWoodReject', Value);
end;

function TXMLForestWood.Get_TreeSpeciesGroup: IXMLTreeSpeciesGroupList;
begin
  Result := FTreeSpeciesGroup;
end;

function TXMLForestWood.Get_ForestWoodClass: IXMLForestWoodClassList;
begin
  Result := FForestWoodClass;
end;

function TXMLForestWood.Get_ForestWoodCharacteristics: IXMLForestWoodCharacteristics;
begin
  Result := ChildNodes['ForestWoodCharacteristics'] as IXMLForestWoodCharacteristics;
end;

function TXMLForestWood.Get_ForestWoodPackagingCharacteristics: IXMLForestWoodPackagingCharacteristics;
begin
  Result := ChildNodes['ForestWoodPackagingCharacteristics'] as IXMLForestWoodPackagingCharacteristics;
end;

function TXMLForestWood.Get_ForestWoodProcessingCharacteristics: IXMLForestWoodProcessingCharacteristics;
begin
  Result := ChildNodes['ForestWoodProcessingCharacteristics'] as IXMLForestWoodProcessingCharacteristics;
end;

function TXMLForestWood.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

{ TXMLTreeSpeciesGroup }

procedure TXMLTreeSpeciesGroup.AfterConstruction;
begin
  RegisterChildNode('TreeSpeciesGroupCode', TXMLTreeSpeciesGroupCode);
  FTreeSpeciesGroupDescription := CreateCollection(TXMLS255List, IXMLNode, 'TreeSpeciesGroupDescription') as IXMLS255List;
  inherited;
end;

function TXMLTreeSpeciesGroup.Get_TreeSpeciesGroupCode: IXMLTreeSpeciesGroupCode;
begin
  Result := ChildNodes['TreeSpeciesGroupCode'] as IXMLTreeSpeciesGroupCode;
end;

function TXMLTreeSpeciesGroup.Get_TreeSpeciesGroupDescription: IXMLS255List;
begin
  Result := FTreeSpeciesGroupDescription;
end;

{ TXMLTreeSpeciesGroupList }

function TXMLTreeSpeciesGroupList.Add: IXMLTreeSpeciesGroup;
begin
  Result := AddItem(-1) as IXMLTreeSpeciesGroup;
end;

function TXMLTreeSpeciesGroupList.Insert(const Index: Integer): IXMLTreeSpeciesGroup;
begin
  Result := AddItem(Index) as IXMLTreeSpeciesGroup;
end;

function TXMLTreeSpeciesGroupList.Get_Item(Index: Integer): IXMLTreeSpeciesGroup;
begin
  Result := List[Index] as IXMLTreeSpeciesGroup;
end;

{ TXMLTreeSpeciesGroupCode }

function TXMLTreeSpeciesGroupCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTreeSpeciesGroupCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLForestWoodClass }

procedure TXMLForestWoodClass.AfterConstruction;
begin
  RegisterChildNode('ForestWoodClassCode', TXMLForestWoodClassCode);
  FForestWoodClassDescription := CreateCollection(TXMLS255List, IXMLNode, 'ForestWoodClassDescription') as IXMLS255List;
  inherited;
end;

function TXMLForestWoodClass.Get_ForestWoodClassType: UnicodeString;
begin
  Result := AttributeNodes['ForestWoodClassType'].Text;
end;

procedure TXMLForestWoodClass.Set_ForestWoodClassType(Value: UnicodeString);
begin
  SetAttribute('ForestWoodClassType', Value);
end;

function TXMLForestWoodClass.Get_ForestWoodClassCode: IXMLForestWoodClassCode;
begin
  Result := ChildNodes['ForestWoodClassCode'] as IXMLForestWoodClassCode;
end;

function TXMLForestWoodClass.Get_ForestWoodClassDescription: IXMLS255List;
begin
  Result := FForestWoodClassDescription;
end;

{ TXMLForestWoodClassList }

function TXMLForestWoodClassList.Add: IXMLForestWoodClass;
begin
  Result := AddItem(-1) as IXMLForestWoodClass;
end;

function TXMLForestWoodClassList.Insert(const Index: Integer): IXMLForestWoodClass;
begin
  Result := AddItem(Index) as IXMLForestWoodClass;
end;

function TXMLForestWoodClassList.Get_Item(Index: Integer): IXMLForestWoodClass;
begin
  Result := List[Index] as IXMLForestWoodClass;
end;

{ TXMLForestWoodClassCode }

function TXMLForestWoodClassCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLForestWoodClassCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLForestWoodCharacteristics }

procedure TXMLForestWoodCharacteristics.AfterConstruction;
begin
  RegisterChildNode('PropertyValue', TXMLPropertyValue);
  RegisterChildNode('ProductAdaptedFor', TXMLProductAdaptedFor);
  FPropertyValue := CreateCollection(TXMLPropertyValueList, IXMLPropertyValue, 'PropertyValue') as IXMLPropertyValueList;
  inherited;
end;

function TXMLForestWoodCharacteristics.Get_PropertyValue: IXMLPropertyValueList;
begin
  Result := FPropertyValue;
end;

function TXMLForestWoodCharacteristics.Get_ProductAdaptedFor: IXMLProductAdaptedFor;
begin
  Result := ChildNodes['ProductAdaptedFor'] as IXMLProductAdaptedFor;
end;

{ TXMLProductAdaptedFor }

procedure TXMLProductAdaptedFor.AfterConstruction;
begin
  RegisterChildNode('OtherParty', TXMLTypedParty);
  inherited;
end;

function TXMLProductAdaptedFor.Get_OtherParty: IXMLTypedParty;
begin
  Result := ChildNodes['OtherParty'] as IXMLTypedParty;
end;

{ TXMLForestWoodPackagingCharacteristics }

procedure TXMLForestWoodPackagingCharacteristics.AfterConstruction;
begin
  RegisterChildNode('PackagingCodeSpecification', TXMLPackagingCodeSpecification);
  ItemTag := 'PackagingCodeSpecification';
  ItemInterface := IXMLPackagingCodeSpecification;
  inherited;
end;

function TXMLForestWoodPackagingCharacteristics.Get_PackagingCodeSpecification(Index: Integer): IXMLPackagingCodeSpecification;
begin
  Result := List[Index] as IXMLPackagingCodeSpecification;
end;

function TXMLForestWoodPackagingCharacteristics.Add: IXMLPackagingCodeSpecification;
begin
  Result := AddItem(-1) as IXMLPackagingCodeSpecification;
end;

function TXMLForestWoodPackagingCharacteristics.Insert(const Index: Integer): IXMLPackagingCodeSpecification;
begin
  Result := AddItem(Index) as IXMLPackagingCodeSpecification;
end;

{ TXMLPackagingCodeSpecification }

procedure TXMLPackagingCodeSpecification.AfterConstruction;
begin
  RegisterChildNode('PackagingCode', TXMLPackagingCode);
  RegisterChildNode('PackagingDescription', TXMLPackagingDescription);
  FPackagingDescription := CreateCollection(TXMLPackagingDescriptionList, IXMLPackagingDescription, 'PackagingDescription') as IXMLPackagingDescriptionList;
  inherited;
end;

function TXMLPackagingCodeSpecification.Get_PackagingCode: IXMLPackagingCode;
begin
  Result := ChildNodes['PackagingCode'] as IXMLPackagingCode;
end;

function TXMLPackagingCodeSpecification.Get_PackagingDescription: IXMLPackagingDescriptionList;
begin
  Result := FPackagingDescription;
end;

{ TXMLForestWoodProcessingCharacteristics }

procedure TXMLForestWoodProcessingCharacteristics.AfterConstruction;
begin
  RegisterChildNode('ProcessingCodeSpecification', TXMLProcessingCodeSpecification);
  ItemTag := 'ProcessingCodeSpecification';
  ItemInterface := IXMLProcessingCodeSpecification;
  inherited;
end;

function TXMLForestWoodProcessingCharacteristics.Get_ProcessingCodeSpecification(Index: Integer): IXMLProcessingCodeSpecification;
begin
  Result := List[Index] as IXMLProcessingCodeSpecification;
end;

function TXMLForestWoodProcessingCharacteristics.Add: IXMLProcessingCodeSpecification;
begin
  Result := AddItem(-1) as IXMLProcessingCodeSpecification;
end;

function TXMLForestWoodProcessingCharacteristics.Insert(const Index: Integer): IXMLProcessingCodeSpecification;
begin
  Result := AddItem(Index) as IXMLProcessingCodeSpecification;
end;

{ TXMLProcessingCodeSpecification }

procedure TXMLProcessingCodeSpecification.AfterConstruction;
begin
  RegisterChildNode('ProcessingCode', TXMLProcessingCode);
  FProcessingDescription := CreateCollection(TXMLS255List, IXMLNode, 'ProcessingDescription') as IXMLS255List;
  inherited;
end;

function TXMLProcessingCodeSpecification.Get_ProcessingCode: IXMLProcessingCode;
begin
  Result := ChildNodes['ProcessingCode'] as IXMLProcessingCode;
end;

function TXMLProcessingCodeSpecification.Get_ProcessingDescription: IXMLS255List;
begin
  Result := FProcessingDescription;
end;

{ TXMLProcessingCode }

function TXMLProcessingCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLProcessingCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLLabelStock }

procedure TXMLLabelStock.AfterConstruction;
begin
  RegisterChildNode('LabelStockCharacteristics', TXMLLabelStockCharacteristics);
  RegisterChildNode('SingleWidthReel', TXMLSingleWidthReel);
  RegisterChildNode('TrimmedReel', TXMLTrimmedReel);
  RegisterChildNode('Sheet', TXMLSheet);
  inherited;
end;

function TXMLLabelStock.Get_LabelStockCharacteristics: IXMLLabelStockCharacteristics;
begin
  Result := ChildNodes['LabelStockCharacteristics'] as IXMLLabelStockCharacteristics;
end;

function TXMLLabelStock.Get_SingleWidthReel: IXMLSingleWidthReel;
begin
  Result := ChildNodes['SingleWidthReel'] as IXMLSingleWidthReel;
end;

function TXMLLabelStock.Get_TrimmedReel: IXMLTrimmedReel;
begin
  Result := ChildNodes['TrimmedReel'] as IXMLTrimmedReel;
end;

function TXMLLabelStock.Get_Sheet: IXMLSheet;
begin
  Result := ChildNodes['Sheet'] as IXMLSheet;
end;

{ TXMLLabelStockCharacteristics }

procedure TXMLLabelStockCharacteristics.AfterConstruction;
begin
  RegisterChildNode('LabelStockLayer', TXMLLabelStockLayer);
  RegisterChildNode('ExtraFeature', TXMLExtraFeature);
  FLabelStockLayer := CreateCollection(TXMLLabelStockLayerList, IXMLLabelStockLayer, 'LabelStockLayer') as IXMLLabelStockLayerList;
  FExtraFeature := CreateCollection(TXMLExtraFeatureList, IXMLExtraFeature, 'ExtraFeature') as IXMLExtraFeatureList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLLabelStockCharacteristics.Get_LabelStockLayer: IXMLLabelStockLayerList;
begin
  Result := FLabelStockLayer;
end;

function TXMLLabelStockCharacteristics.Get_ExtraFeature: IXMLExtraFeatureList;
begin
  Result := FExtraFeature;
end;

function TXMLLabelStockCharacteristics.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLLabelStockLayer }

procedure TXMLLabelStockLayer.AfterConstruction;
begin
  RegisterChildNode('LayerMaterial', TXMLLayerMaterial);
  inherited;
end;

function TXMLLabelStockLayer.Get_LabelStockLayerType: UnicodeString;
begin
  Result := ChildNodes['LabelStockLayerType'].Text;
end;

procedure TXMLLabelStockLayer.Set_LabelStockLayerType(Value: UnicodeString);
begin
  ChildNodes['LabelStockLayerType'].NodeValue := Value;
end;

function TXMLLabelStockLayer.Get_LabelStockLayerNumber: LongWord;
begin
  Result := ChildNodes['LabelStockLayerNumber'].NodeValue;
end;

procedure TXMLLabelStockLayer.Set_LabelStockLayerNumber(Value: LongWord);
begin
  ChildNodes['LabelStockLayerNumber'].NodeValue := Value;
end;

function TXMLLabelStockLayer.Get_LayerMaterial: IXMLLayerMaterial;
begin
  Result := ChildNodes['LayerMaterial'] as IXMLLayerMaterial;
end;

{ TXMLLabelStockLayerList }

function TXMLLabelStockLayerList.Add: IXMLLabelStockLayer;
begin
  Result := AddItem(-1) as IXMLLabelStockLayer;
end;

function TXMLLabelStockLayerList.Insert(const Index: Integer): IXMLLabelStockLayer;
begin
  Result := AddItem(Index) as IXMLLabelStockLayer;
end;

function TXMLLabelStockLayerList.Get_Item(Index: Integer): IXMLLabelStockLayer;
begin
  Result := List[Index] as IXMLLabelStockLayer;
end;

{ TXMLLayerMaterial }

procedure TXMLLayerMaterial.AfterConstruction;
begin
  RegisterChildNode('ProductIdentifier', TXMLProductIdentifier);
  inherited;
end;

function TXMLLayerMaterial.Get_ProductIdentifier: IXMLProductIdentifier;
begin
  Result := ChildNodes['ProductIdentifier'] as IXMLProductIdentifier;
end;

function TXMLLayerMaterial.Get_LayerMaterialName: UnicodeString;
begin
  Result := ChildNodes['LayerMaterialName'].Text;
end;

procedure TXMLLayerMaterial.Set_LayerMaterialName(Value: UnicodeString);
begin
  ChildNodes['LayerMaterialName'].NodeValue := Value;
end;

{ TXMLExtraFeature }

procedure TXMLExtraFeature.AfterConstruction;
begin
  RegisterChildNode('ProductIdentifier', TXMLProductIdentifier);
  inherited;
end;

function TXMLExtraFeature.Get_ProductIdentifier: IXMLProductIdentifier;
begin
  Result := ChildNodes['ProductIdentifier'] as IXMLProductIdentifier;
end;

function TXMLExtraFeature.Get_ExtraFeatureDescription: UnicodeString;
begin
  Result := ChildNodes['ExtraFeatureDescription'].Text;
end;

procedure TXMLExtraFeature.Set_ExtraFeatureDescription(Value: UnicodeString);
begin
  ChildNodes['ExtraFeatureDescription'].NodeValue := Value;
end;

{ TXMLExtraFeatureList }

function TXMLExtraFeatureList.Add: IXMLExtraFeature;
begin
  Result := AddItem(-1) as IXMLExtraFeature;
end;

function TXMLExtraFeatureList.Insert(const Index: Integer): IXMLExtraFeature;
begin
  Result := AddItem(Index) as IXMLExtraFeature;
end;

function TXMLExtraFeatureList.Get_Item(Index: Integer): IXMLExtraFeature;
begin
  Result := List[Index] as IXMLExtraFeature;
end;

{ TXMLSingleWidthReel }

procedure TXMLSingleWidthReel.AfterConstruction;
begin
  RegisterChildNode('SingleWidthReelConversionCharacteristics', TXMLSingleWidthReelConversionCharacteristics);
  RegisterChildNode('ReelPackagingCharacteristics', TXMLReelPackagingCharacteristicsClass);
  inherited;
end;

function TXMLSingleWidthReel.Get_SingleWidthReelConversionCharacteristics: IXMLSingleWidthReelConversionCharacteristics;
begin
  Result := ChildNodes['SingleWidthReelConversionCharacteristics'] as IXMLSingleWidthReelConversionCharacteristics;
end;

function TXMLSingleWidthReel.Get_ReelPackagingCharacteristics: IXMLReelPackagingCharacteristicsClass;
begin
  Result := ChildNodes['ReelPackagingCharacteristics'] as IXMLReelPackagingCharacteristicsClass;
end;

{ TXMLSingleWidthReelConversionCharacteristics }

procedure TXMLSingleWidthReelConversionCharacteristics.AfterConstruction;
begin
  RegisterChildNode('ReelWidth', TXMLMeasurement);
  RegisterChildNode('ReelDiameter', TXMLMeasurement);
  RegisterChildNode('ReelLength', TXMLMeasurement);
  RegisterChildNode('CoreCharacteristics', TXMLCoreCharacteristics);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLSingleWidthReelConversionCharacteristics.Get_WindingDirection: UnicodeString;
begin
  Result := ChildNodes['WindingDirection'].Text;
end;

procedure TXMLSingleWidthReelConversionCharacteristics.Set_WindingDirection(Value: UnicodeString);
begin
  ChildNodes['WindingDirection'].NodeValue := Value;
end;

function TXMLSingleWidthReelConversionCharacteristics.Get_TrimmedOrderType: UnicodeString;
begin
  Result := ChildNodes['TrimmedOrderType'].Text;
end;

procedure TXMLSingleWidthReelConversionCharacteristics.Set_TrimmedOrderType(Value: UnicodeString);
begin
  ChildNodes['TrimmedOrderType'].NodeValue := Value;
end;

function TXMLSingleWidthReelConversionCharacteristics.Get_ReelWidth: IXMLMeasurement;
begin
  Result := ChildNodes['ReelWidth'] as IXMLMeasurement;
end;

function TXMLSingleWidthReelConversionCharacteristics.Get_ReelDiameter: IXMLMeasurement;
begin
  Result := ChildNodes['ReelDiameter'] as IXMLMeasurement;
end;

function TXMLSingleWidthReelConversionCharacteristics.Get_ReelLength: IXMLMeasurement;
begin
  Result := ChildNodes['ReelLength'] as IXMLMeasurement;
end;

function TXMLSingleWidthReelConversionCharacteristics.Get_CoreCharacteristics: IXMLCoreCharacteristics;
begin
  Result := ChildNodes['CoreCharacteristics'] as IXMLCoreCharacteristics;
end;

function TXMLSingleWidthReelConversionCharacteristics.Get_MaximumNumberOfJoins: LongWord;
begin
  Result := ChildNodes['MaximumNumberOfJoins'].NodeValue;
end;

procedure TXMLSingleWidthReelConversionCharacteristics.Set_MaximumNumberOfJoins(Value: LongWord);
begin
  ChildNodes['MaximumNumberOfJoins'].NodeValue := Value;
end;

function TXMLSingleWidthReelConversionCharacteristics.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLTrimmedReel }

procedure TXMLTrimmedReel.AfterConstruction;
begin
  RegisterChildNode('TrimmedReelConversionCharacteristics', TXMLTrimmedReelConversionCharacteristics);
  RegisterChildNode('ReelPackagingCharacteristics', TXMLReelPackagingCharacteristicsClass);
  inherited;
end;

function TXMLTrimmedReel.Get_TrimmedReelConversionCharacteristics: IXMLTrimmedReelConversionCharacteristics;
begin
  Result := ChildNodes['TrimmedReelConversionCharacteristics'] as IXMLTrimmedReelConversionCharacteristics;
end;

function TXMLTrimmedReel.Get_ReelPackagingCharacteristics: IXMLReelPackagingCharacteristicsClass;
begin
  Result := ChildNodes['ReelPackagingCharacteristics'] as IXMLReelPackagingCharacteristicsClass;
end;

{ TXMLTrimmedReelConversionCharacteristics }

procedure TXMLTrimmedReelConversionCharacteristics.AfterConstruction;
begin
  RegisterChildNode('MasterReelWidth', TXMLMeasurement);
  RegisterChildNode('ReelDiameter', TXMLMeasurement);
  RegisterChildNode('ReelLength', TXMLMeasurement);
  RegisterChildNode('MaximumOffcut', TXMLMeasurement);
  RegisterChildNode('CoreCharacteristics', TXMLCoreCharacteristics);
  RegisterChildNode('SlitReel', TXMLSlitReel);
  FSlitReel := CreateCollection(TXMLSlitReelList, IXMLSlitReel, 'SlitReel') as IXMLSlitReelList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLTrimmedReelConversionCharacteristics.Get_WindingDirection: UnicodeString;
begin
  Result := ChildNodes['WindingDirection'].Text;
end;

procedure TXMLTrimmedReelConversionCharacteristics.Set_WindingDirection(Value: UnicodeString);
begin
  ChildNodes['WindingDirection'].NodeValue := Value;
end;

function TXMLTrimmedReelConversionCharacteristics.Get_TrimmedOrderType: UnicodeString;
begin
  Result := ChildNodes['TrimmedOrderType'].Text;
end;

procedure TXMLTrimmedReelConversionCharacteristics.Set_TrimmedOrderType(Value: UnicodeString);
begin
  ChildNodes['TrimmedOrderType'].NodeValue := Value;
end;

function TXMLTrimmedReelConversionCharacteristics.Get_MasterReelWidth: IXMLMeasurement;
begin
  Result := ChildNodes['MasterReelWidth'] as IXMLMeasurement;
end;

function TXMLTrimmedReelConversionCharacteristics.Get_ReelDiameter: IXMLMeasurement;
begin
  Result := ChildNodes['ReelDiameter'] as IXMLMeasurement;
end;

function TXMLTrimmedReelConversionCharacteristics.Get_ReelLength: IXMLMeasurement;
begin
  Result := ChildNodes['ReelLength'] as IXMLMeasurement;
end;

function TXMLTrimmedReelConversionCharacteristics.Get_MaximumOffcut: IXMLMeasurement;
begin
  Result := ChildNodes['MaximumOffcut'] as IXMLMeasurement;
end;

function TXMLTrimmedReelConversionCharacteristics.Get_CoreCharacteristics: IXMLCoreCharacteristics;
begin
  Result := ChildNodes['CoreCharacteristics'] as IXMLCoreCharacteristics;
end;

function TXMLTrimmedReelConversionCharacteristics.Get_MaximumNumberOfJoins: LongWord;
begin
  Result := ChildNodes['MaximumNumberOfJoins'].NodeValue;
end;

procedure TXMLTrimmedReelConversionCharacteristics.Set_MaximumNumberOfJoins(Value: LongWord);
begin
  ChildNodes['MaximumNumberOfJoins'].NodeValue := Value;
end;

function TXMLTrimmedReelConversionCharacteristics.Get_SlitReel: IXMLSlitReelList;
begin
  Result := FSlitReel;
end;

function TXMLTrimmedReelConversionCharacteristics.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLSlitReel }

procedure TXMLSlitReel.AfterConstruction;
begin
  RegisterChildNode('SlitReelWidth', TXMLMeasurement);
  RegisterChildNode('SlitReelOrderQuantity', TXMLSlitReelOrderQuantity);
  RegisterChildNode('SlitReelReference', TXMLSlitReelReference);
  FSlitReelReference := CreateCollection(TXMLSlitReelReferenceList, IXMLSlitReelReference, 'SlitReelReference') as IXMLSlitReelReferenceList;
  inherited;
end;

function TXMLSlitReel.Get_DeliveryIndicator: UnicodeString;
begin
  Result := ChildNodes['DeliveryIndicator'].Text;
end;

procedure TXMLSlitReel.Set_DeliveryIndicator(Value: UnicodeString);
begin
  ChildNodes['DeliveryIndicator'].NodeValue := Value;
end;

function TXMLSlitReel.Get_SlitReelLineNumber: LongWord;
begin
  Result := ChildNodes['SlitReelLineNumber'].NodeValue;
end;

procedure TXMLSlitReel.Set_SlitReelLineNumber(Value: LongWord);
begin
  ChildNodes['SlitReelLineNumber'].NodeValue := Value;
end;

function TXMLSlitReel.Get_SlitReelWidth: IXMLMeasurement;
begin
  Result := ChildNodes['SlitReelWidth'] as IXMLMeasurement;
end;

function TXMLSlitReel.Get_SlitReelOrderQuantity: IXMLSlitReelOrderQuantity;
begin
  Result := ChildNodes['SlitReelOrderQuantity'] as IXMLSlitReelOrderQuantity;
end;

function TXMLSlitReel.Get_SlitReelsInSet: LongWord;
begin
  Result := ChildNodes['SlitReelsInSet'].NodeValue;
end;

procedure TXMLSlitReel.Set_SlitReelsInSet(Value: LongWord);
begin
  ChildNodes['SlitReelsInSet'].NodeValue := Value;
end;

function TXMLSlitReel.Get_SlitReelReference: IXMLSlitReelReferenceList;
begin
  Result := FSlitReelReference;
end;

{ TXMLSlitReelList }

function TXMLSlitReelList.Add: IXMLSlitReel;
begin
  Result := AddItem(-1) as IXMLSlitReel;
end;

function TXMLSlitReelList.Insert(const Index: Integer): IXMLSlitReel;
begin
  Result := AddItem(Index) as IXMLSlitReel;
end;

function TXMLSlitReelList.Get_Item(Index: Integer): IXMLSlitReel;
begin
  Result := List[Index] as IXMLSlitReel;
end;

{ TXMLSlitReelOrderQuantity }

function TXMLSlitReelOrderQuantity.Get_QuantityType: UnicodeString;
begin
  Result := AttributeNodes['QuantityType'].Text;
end;

procedure TXMLSlitReelOrderQuantity.Set_QuantityType(Value: UnicodeString);
begin
  SetAttribute('QuantityType', Value);
end;

function TXMLSlitReelOrderQuantity.Get_QuantityTypeContext: UnicodeString;
begin
  Result := AttributeNodes['QuantityTypeContext'].Text;
end;

procedure TXMLSlitReelOrderQuantity.Set_QuantityTypeContext(Value: UnicodeString);
begin
  SetAttribute('QuantityTypeContext', Value);
end;

function TXMLSlitReelOrderQuantity.Get_AdjustmentType: UnicodeString;
begin
  Result := AttributeNodes['AdjustmentType'].Text;
end;

procedure TXMLSlitReelOrderQuantity.Set_AdjustmentType(Value: UnicodeString);
begin
  SetAttribute('AdjustmentType', Value);
end;

{ TXMLSlitReelReference }

function TXMLSlitReelReference.Get_SlitReelReferenceType: UnicodeString;
begin
  Result := AttributeNodes['SlitReelReferenceType'].Text;
end;

procedure TXMLSlitReelReference.Set_SlitReelReferenceType(Value: UnicodeString);
begin
  SetAttribute('SlitReelReferenceType', Value);
end;

function TXMLSlitReelReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLSlitReelReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLSlitReelReferenceList }

function TXMLSlitReelReferenceList.Add: IXMLSlitReelReference;
begin
  Result := AddItem(-1) as IXMLSlitReelReference;
end;

function TXMLSlitReelReferenceList.Insert(const Index: Integer): IXMLSlitReelReference;
begin
  Result := AddItem(Index) as IXMLSlitReelReference;
end;

function TXMLSlitReelReferenceList.Get_Item(Index: Integer): IXMLSlitReelReference;
begin
  Result := List[Index] as IXMLSlitReelReference;
end;

{ TXMLPulpClass }

procedure TXMLPulpClass.AfterConstruction;
begin
  RegisterChildNode('PulpCharacteristics', TXMLPulpCharacteristics);
  RegisterChildNode('Bale', TXMLBale);
  RegisterChildNode('Reel', TXMLReel);
  RegisterChildNode('Slurry', TXMLSlurry);
  RegisterChildNode('NonStandardPulp', TXMLNonStandardPulp);
  inherited;
end;

function TXMLPulpClass.Get_PulpCharacteristics: IXMLPulpCharacteristics;
begin
  Result := ChildNodes['PulpCharacteristics'] as IXMLPulpCharacteristics;
end;

function TXMLPulpClass.Get_Bale: IXMLBale;
begin
  Result := ChildNodes['Bale'] as IXMLBale;
end;

function TXMLPulpClass.Get_Reel: IXMLReel;
begin
  Result := ChildNodes['Reel'] as IXMLReel;
end;

function TXMLPulpClass.Get_Slurry: IXMLSlurry;
begin
  Result := ChildNodes['Slurry'] as IXMLSlurry;
end;

function TXMLPulpClass.Get_NonStandardPulp: IXMLNonStandardPulp;
begin
  Result := ChildNodes['NonStandardPulp'] as IXMLNonStandardPulp;
end;

{ TXMLPulpCharacteristics }

procedure TXMLPulpCharacteristics.AfterConstruction;
begin
  RegisterChildNode('Ash', TXMLAsh);
  RegisterChildNode('BasisWeight', TXMLBasisWeight);
  RegisterChildNode('Brightness', TXMLBrightness);
  RegisterChildNode('Burst', TXMLBurst);
  RegisterChildNode('BurstIndex', TXMLBurstIndex);
  RegisterChildNode('ColourDetail', TXMLColourDetail);
  RegisterChildNode('Density', TXMLDensity);
  RegisterChildNode('Dirt', TXMLDirt);
  RegisterChildNode('DrainageResistance', TXMLDrainageResistance);
  RegisterChildNode('FibreLength', TXMLFibreLength);
  RegisterChildNode('FibreClassification', TXMLFibreClassification);
  RegisterChildNode('Freeness', TXMLFreeness);
  RegisterChildNode('LightScattering', TXMLLightScattering);
  RegisterChildNode('Moisture', TXMLMoisture);
  RegisterChildNode('Opacity', TXMLOpacity);
  RegisterChildNode('pH', TXMLPH);
  RegisterChildNode('PostConsumerWaste', TXMLPostConsumerWaste);
  RegisterChildNode('PreConsumerWaste', TXMLPreConsumerWaste);
  RegisterChildNode('Recycled', TXMLRecycled);
  RegisterChildNode('Tear', TXMLTear);
  RegisterChildNode('TearIndex', TXMLTearIndex);
  RegisterChildNode('Tensile', TXMLTensile);
  RegisterChildNode('TensileIndex', TXMLTensileIndex);
  RegisterChildNode('Viscosity', TXMLViscosity);
  RegisterChildNode('Whiteness', TXMLWhiteness);
  RegisterChildNode('AdditionalTest', TXMLAdditionalTest);
  FAsh := CreateCollection(TXMLAshList, IXMLAsh, 'Ash') as IXMLAshList;
  FBasisWeight := CreateCollection(TXMLBasisWeightList, IXMLBasisWeight, 'BasisWeight') as IXMLBasisWeightList;
  FBrightness := CreateCollection(TXMLBrightnessList, IXMLBrightness, 'Brightness') as IXMLBrightnessList;
  FBurst := CreateCollection(TXMLBurstList, IXMLBurst, 'Burst') as IXMLBurstList;
  FBurstIndex := CreateCollection(TXMLBurstIndexList, IXMLBurstIndex, 'BurstIndex') as IXMLBurstIndexList;
  FColourDetail := CreateCollection(TXMLColourDetailList, IXMLColourDetail, 'ColourDetail') as IXMLColourDetailList;
  FDensity := CreateCollection(TXMLDensityList, IXMLDensity, 'Density') as IXMLDensityList;
  FDirt := CreateCollection(TXMLDirtList, IXMLDirt, 'Dirt') as IXMLDirtList;
  FDrainageResistance := CreateCollection(TXMLDrainageResistanceList, IXMLDrainageResistance, 'DrainageResistance') as IXMLDrainageResistanceList;
  FFibreLength := CreateCollection(TXMLFibreLengthList, IXMLFibreLength, 'FibreLength') as IXMLFibreLengthList;
  FFibreClassification := CreateCollection(TXMLFibreClassificationList, IXMLFibreClassification, 'FibreClassification') as IXMLFibreClassificationList;
  FFreeness := CreateCollection(TXMLFreenessList, IXMLFreeness, 'Freeness') as IXMLFreenessList;
  FLightScattering := CreateCollection(TXMLLightScatteringList, IXMLLightScattering, 'LightScattering') as IXMLLightScatteringList;
  FMoisture := CreateCollection(TXMLMoistureList, IXMLMoisture, 'Moisture') as IXMLMoistureList;
  FOpacity := CreateCollection(TXMLOpacityList, IXMLOpacity, 'Opacity') as IXMLOpacityList;
  FPH := CreateCollection(TXMLPHList, IXMLPH, 'pH') as IXMLPHList;
  FPostConsumerWaste := CreateCollection(TXMLPostConsumerWasteList, IXMLPostConsumerWaste, 'PostConsumerWaste') as IXMLPostConsumerWasteList;
  FPreConsumerWaste := CreateCollection(TXMLPreConsumerWasteList, IXMLPreConsumerWaste, 'PreConsumerWaste') as IXMLPreConsumerWasteList;
  FRecycled := CreateCollection(TXMLRecycledList, IXMLRecycled, 'Recycled') as IXMLRecycledList;
  FTear := CreateCollection(TXMLTearList, IXMLTear, 'Tear') as IXMLTearList;
  FTearIndex := CreateCollection(TXMLTearIndexList, IXMLTearIndex, 'TearIndex') as IXMLTearIndexList;
  FTensile := CreateCollection(TXMLTensileList, IXMLTensile, 'Tensile') as IXMLTensileList;
  FTensileIndex := CreateCollection(TXMLTensileIndexList, IXMLTensileIndex, 'TensileIndex') as IXMLTensileIndexList;
  FViscosity := CreateCollection(TXMLViscosityList, IXMLViscosity, 'Viscosity') as IXMLViscosityList;
  FWhiteness := CreateCollection(TXMLWhitenessList, IXMLWhiteness, 'Whiteness') as IXMLWhitenessList;
  inherited;
end;

function TXMLPulpCharacteristics.Get_PulpingProcess: UnicodeString;
begin
  Result := AttributeNodes['PulpingProcess'].Text;
end;

procedure TXMLPulpCharacteristics.Set_PulpingProcess(Value: UnicodeString);
begin
  SetAttribute('PulpingProcess', Value);
end;

function TXMLPulpCharacteristics.Get_BleachingProcess: UnicodeString;
begin
  Result := AttributeNodes['BleachingProcess'].Text;
end;

procedure TXMLPulpCharacteristics.Set_BleachingProcess(Value: UnicodeString);
begin
  SetAttribute('BleachingProcess', Value);
end;

function TXMLPulpCharacteristics.Get_FibreSource: UnicodeString;
begin
  Result := AttributeNodes['FibreSource'].Text;
end;

procedure TXMLPulpCharacteristics.Set_FibreSource(Value: UnicodeString);
begin
  SetAttribute('FibreSource', Value);
end;

function TXMLPulpCharacteristics.Get_Ash: IXMLAshList;
begin
  Result := FAsh;
end;

function TXMLPulpCharacteristics.Get_BasisWeight: IXMLBasisWeightList;
begin
  Result := FBasisWeight;
end;

function TXMLPulpCharacteristics.Get_Brightness: IXMLBrightnessList;
begin
  Result := FBrightness;
end;

function TXMLPulpCharacteristics.Get_Burst: IXMLBurstList;
begin
  Result := FBurst;
end;

function TXMLPulpCharacteristics.Get_BurstIndex: IXMLBurstIndexList;
begin
  Result := FBurstIndex;
end;

function TXMLPulpCharacteristics.Get_ColourDetail: IXMLColourDetailList;
begin
  Result := FColourDetail;
end;

function TXMLPulpCharacteristics.Get_Density: IXMLDensityList;
begin
  Result := FDensity;
end;

function TXMLPulpCharacteristics.Get_Dirt: IXMLDirtList;
begin
  Result := FDirt;
end;

function TXMLPulpCharacteristics.Get_DrainageResistance: IXMLDrainageResistanceList;
begin
  Result := FDrainageResistance;
end;

function TXMLPulpCharacteristics.Get_FibreLength: IXMLFibreLengthList;
begin
  Result := FFibreLength;
end;

function TXMLPulpCharacteristics.Get_FibreClassification: IXMLFibreClassificationList;
begin
  Result := FFibreClassification;
end;

function TXMLPulpCharacteristics.Get_Freeness: IXMLFreenessList;
begin
  Result := FFreeness;
end;

function TXMLPulpCharacteristics.Get_LightScattering: IXMLLightScatteringList;
begin
  Result := FLightScattering;
end;

function TXMLPulpCharacteristics.Get_Moisture: IXMLMoistureList;
begin
  Result := FMoisture;
end;

function TXMLPulpCharacteristics.Get_Opacity: IXMLOpacityList;
begin
  Result := FOpacity;
end;

function TXMLPulpCharacteristics.Get_PH: IXMLPHList;
begin
  Result := FPH;
end;

function TXMLPulpCharacteristics.Get_PostConsumerWaste: IXMLPostConsumerWasteList;
begin
  Result := FPostConsumerWaste;
end;

function TXMLPulpCharacteristics.Get_PreConsumerWaste: IXMLPreConsumerWasteList;
begin
  Result := FPreConsumerWaste;
end;

function TXMLPulpCharacteristics.Get_Recycled: IXMLRecycledList;
begin
  Result := FRecycled;
end;

function TXMLPulpCharacteristics.Get_Tear: IXMLTearList;
begin
  Result := FTear;
end;

function TXMLPulpCharacteristics.Get_TearIndex: IXMLTearIndexList;
begin
  Result := FTearIndex;
end;

function TXMLPulpCharacteristics.Get_Tensile: IXMLTensileList;
begin
  Result := FTensile;
end;

function TXMLPulpCharacteristics.Get_TensileIndex: IXMLTensileIndexList;
begin
  Result := FTensileIndex;
end;

function TXMLPulpCharacteristics.Get_Viscosity: IXMLViscosityList;
begin
  Result := FViscosity;
end;

function TXMLPulpCharacteristics.Get_Whiteness: IXMLWhitenessList;
begin
  Result := FWhiteness;
end;

function TXMLPulpCharacteristics.Get_AdditionalTest: IXMLAdditionalTest;
begin
  Result := ChildNodes['AdditionalTest'] as IXMLAdditionalTest;
end;

{ TXMLDrainageResistance }

function TXMLDrainageResistance.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLDrainageResistance.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLDrainageResistance.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLDrainageResistance.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLDrainageResistance.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLDrainageResistance.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLDrainageResistance.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLDrainageResistance.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLDrainageResistanceList }

function TXMLDrainageResistanceList.Add: IXMLDrainageResistance;
begin
  Result := AddItem(-1) as IXMLDrainageResistance;
end;

function TXMLDrainageResistanceList.Insert(const Index: Integer): IXMLDrainageResistance;
begin
  Result := AddItem(Index) as IXMLDrainageResistance;
end;

function TXMLDrainageResistanceList.Get_Item(Index: Integer): IXMLDrainageResistance;
begin
  Result := List[Index] as IXMLDrainageResistance;
end;

{ TXMLViscosity }

function TXMLViscosity.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLViscosity.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLViscosity.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLViscosity.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLViscosity.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLViscosity.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLViscosity.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLViscosity.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLViscosityList }

function TXMLViscosityList.Add: IXMLViscosity;
begin
  Result := AddItem(-1) as IXMLViscosity;
end;

function TXMLViscosityList.Insert(const Index: Integer): IXMLViscosity;
begin
  Result := AddItem(Index) as IXMLViscosity;
end;

function TXMLViscosityList.Get_Item(Index: Integer): IXMLViscosity;
begin
  Result := List[Index] as IXMLViscosity;
end;

{ TXMLBale }

procedure TXMLBale.AfterConstruction;
begin
  RegisterChildNode('BaleConversionCharacteristics', TXMLBaleConversionCharacteristics);
  RegisterChildNode('BalePackagingCharacteristics', TXMLBalePackagingCharacteristics);
  inherited;
end;

function TXMLBale.Get_BaleType: UnicodeString;
begin
  Result := AttributeNodes['BaleType'].Text;
end;

procedure TXMLBale.Set_BaleType(Value: UnicodeString);
begin
  SetAttribute('BaleType', Value);
end;

function TXMLBale.Get_BaleConversionCharacteristics: IXMLBaleConversionCharacteristics;
begin
  Result := ChildNodes['BaleConversionCharacteristics'] as IXMLBaleConversionCharacteristics;
end;

function TXMLBale.Get_BalePackagingCharacteristics: IXMLBalePackagingCharacteristics;
begin
  Result := ChildNodes['BalePackagingCharacteristics'] as IXMLBalePackagingCharacteristics;
end;

{ TXMLBaleConversionCharacteristics }

procedure TXMLBaleConversionCharacteristics.AfterConstruction;
begin
  RegisterChildNode('ConversionCode', TXMLConversionCode);
  RegisterChildNode('BaleHeight', TXMLMeasurement);
  RegisterChildNode('BaleWidth', TXMLMeasurement);
  RegisterChildNode('BaleDepth', TXMLMeasurement);
  RegisterChildNode('BaleStandardWeight', TXMLMeasurement);
  inherited;
end;

function TXMLBaleConversionCharacteristics.Get_ConversionCode: IXMLConversionCode;
begin
  Result := ChildNodes['ConversionCode'] as IXMLConversionCode;
end;

function TXMLBaleConversionCharacteristics.Get_BaleHeight: IXMLMeasurement;
begin
  Result := ChildNodes['BaleHeight'] as IXMLMeasurement;
end;

function TXMLBaleConversionCharacteristics.Get_BaleWidth: IXMLMeasurement;
begin
  Result := ChildNodes['BaleWidth'] as IXMLMeasurement;
end;

function TXMLBaleConversionCharacteristics.Get_BaleDepth: IXMLMeasurement;
begin
  Result := ChildNodes['BaleDepth'] as IXMLMeasurement;
end;

function TXMLBaleConversionCharacteristics.Get_BaleStandardWeight: IXMLMeasurement;
begin
  Result := ChildNodes['BaleStandardWeight'] as IXMLMeasurement;
end;

{ TXMLBalePackagingCharacteristics }

procedure TXMLBalePackagingCharacteristics.AfterConstruction;
begin
  RegisterChildNode('PackagingCode', TXMLPackagingCode);
  RegisterChildNode('CustomerMarks', TXMLCustomerMarks);
  RegisterChildNode('StencilCharacteristics', TXMLStencilCharacteristics);
  RegisterChildNode('PulpUnitCharacteristics', TXMLPulpUnitCharacteristics);
  FStencilCharacteristics := CreateCollection(TXMLStencilCharacteristicsList, IXMLStencilCharacteristics, 'StencilCharacteristics') as IXMLStencilCharacteristicsList;
  inherited;
end;

function TXMLBalePackagingCharacteristics.Get_PackagingCode: IXMLPackagingCode;
begin
  Result := ChildNodes['PackagingCode'] as IXMLPackagingCode;
end;

function TXMLBalePackagingCharacteristics.Get_CustomerMarks: IXMLCustomerMarks;
begin
  Result := ChildNodes['CustomerMarks'] as IXMLCustomerMarks;
end;

function TXMLBalePackagingCharacteristics.Get_StencilCharacteristics: IXMLStencilCharacteristicsList;
begin
  Result := FStencilCharacteristics;
end;

function TXMLBalePackagingCharacteristics.Get_PulpUnitCharacteristics: IXMLPulpUnitCharacteristics;
begin
  Result := ChildNodes['PulpUnitCharacteristics'] as IXMLPulpUnitCharacteristics;
end;

{ TXMLPulpUnitCharacteristics }

procedure TXMLPulpUnitCharacteristics.AfterConstruction;
begin
  RegisterChildNode('PackagingDescription', TXMLPackagingDescription);
  RegisterChildNode('Wrap', TXMLWrap);
  RegisterChildNode('PalletCharacteristics', TXMLPalletCharacteristics);
  RegisterChildNode('LabelCharacteristics', TXMLLabelCharacteristics);
  RegisterChildNode('StencilCharacteristics', TXMLStencilCharacteristics);
  RegisterChildNode('MaximumGrossWeight', TXMLMeasurement);
  FStencilCharacteristics := CreateCollection(TXMLStencilCharacteristicsList, IXMLStencilCharacteristics, 'StencilCharacteristics') as IXMLStencilCharacteristicsList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLPulpUnitCharacteristics.Get_PackagingDescription: IXMLPackagingDescription;
begin
  Result := ChildNodes['PackagingDescription'] as IXMLPackagingDescription;
end;

function TXMLPulpUnitCharacteristics.Get_Wrap: IXMLWrap;
begin
  Result := ChildNodes['Wrap'] as IXMLWrap;
end;

function TXMLPulpUnitCharacteristics.Get_PalletCharacteristics: IXMLPalletCharacteristics;
begin
  Result := ChildNodes['PalletCharacteristics'] as IXMLPalletCharacteristics;
end;

function TXMLPulpUnitCharacteristics.Get_BalesPerUnit: LongWord;
begin
  Result := ChildNodes['BalesPerUnit'].NodeValue;
end;

procedure TXMLPulpUnitCharacteristics.Set_BalesPerUnit(Value: LongWord);
begin
  ChildNodes['BalesPerUnit'].NodeValue := Value;
end;

function TXMLPulpUnitCharacteristics.Get_LayersPerUnit: LongWord;
begin
  Result := ChildNodes['LayersPerUnit'].NodeValue;
end;

procedure TXMLPulpUnitCharacteristics.Set_LayersPerUnit(Value: LongWord);
begin
  ChildNodes['LayersPerUnit'].NodeValue := Value;
end;

function TXMLPulpUnitCharacteristics.Get_LabelCharacteristics: IXMLLabelCharacteristics;
begin
  Result := ChildNodes['LabelCharacteristics'] as IXMLLabelCharacteristics;
end;

function TXMLPulpUnitCharacteristics.Get_StencilCharacteristics: IXMLStencilCharacteristicsList;
begin
  Result := FStencilCharacteristics;
end;

function TXMLPulpUnitCharacteristics.Get_MaximumGrossWeight: IXMLMeasurement;
begin
  Result := ChildNodes['MaximumGrossWeight'] as IXMLMeasurement;
end;

function TXMLPulpUnitCharacteristics.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLSlurry }

procedure TXMLSlurry.AfterConstruction;
begin
  RegisterChildNode('TargetSolidsContent', TXMLMeasurement);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLSlurry.Get_TargetSolidsContent: IXMLMeasurement;
begin
  Result := ChildNodes['TargetSolidsContent'] as IXMLMeasurement;
end;

function TXMLSlurry.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLNonStandardPulp }

procedure TXMLNonStandardPulp.AfterConstruction;
begin
  RegisterChildNode('TargetMoisture', TXMLMeasurement);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLNonStandardPulp.Get_TargetMoisture: IXMLMeasurement;
begin
  Result := ChildNodes['TargetMoisture'] as IXMLMeasurement;
end;

function TXMLNonStandardPulp.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLRecoveredPaper }

function TXMLRecoveredPaper.Get_RecoveredPaperAttributes: UnicodeString;
begin
  Result := ChildNodes['RecoveredPaperAttributes'].Text;
end;

procedure TXMLRecoveredPaper.Set_RecoveredPaperAttributes(Value: UnicodeString);
begin
  ChildNodes['RecoveredPaperAttributes'].NodeValue := Value;
end;

{ TXMLVirginFibre }

procedure TXMLVirginFibre.AfterConstruction;
begin
  RegisterChildNode('TimberCharacteristics', TXMLTimberCharacteristics);
  RegisterChildNode('Log', TXMLLog);
  RegisterChildNode('Chip', TXMLChip);
  inherited;
end;

function TXMLVirginFibre.Get_TimberCharacteristics: IXMLTimberCharacteristics;
begin
  Result := ChildNodes['TimberCharacteristics'] as IXMLTimberCharacteristics;
end;

function TXMLVirginFibre.Get_Log: IXMLLog;
begin
  Result := ChildNodes['Log'] as IXMLLog;
end;

function TXMLVirginFibre.Get_Chip: IXMLChip;
begin
  Result := ChildNodes['Chip'] as IXMLChip;
end;

{ TXMLTimberCharacteristics }

procedure TXMLTimberCharacteristics.AfterConstruction;
begin
  RegisterChildNode('LumberSpecies', TXMLLumberSpeciesClass);
  RegisterChildNode('Age', TXMLMeasurement);
  FLumberSpecies := CreateCollection(TXMLLumberSpeciesClassList, IXMLLumberSpeciesClass, 'LumberSpecies') as IXMLLumberSpeciesClassList;
  inherited;
end;

function TXMLTimberCharacteristics.Get_LumberSpecies: IXMLLumberSpeciesClassList;
begin
  Result := FLumberSpecies;
end;

function TXMLTimberCharacteristics.Get_Age: IXMLMeasurement;
begin
  Result := ChildNodes['Age'] as IXMLMeasurement;
end;

function TXMLTimberCharacteristics.Get_Grade: UnicodeString;
begin
  Result := ChildNodes['Grade'].Text;
end;

procedure TXMLTimberCharacteristics.Set_Grade(Value: UnicodeString);
begin
  ChildNodes['Grade'].NodeValue := Value;
end;

{ TXMLLumberSpeciesClass }

function TXMLLumberSpeciesClass.Get_SpeciesType: UnicodeString;
begin
  Result := AttributeNodes['SpeciesType'].Text;
end;

procedure TXMLLumberSpeciesClass.Set_SpeciesType(Value: UnicodeString);
begin
  SetAttribute('SpeciesType', Value);
end;

function TXMLLumberSpeciesClass.Get_SpeciesOrigin: UnicodeString;
begin
  Result := AttributeNodes['SpeciesOrigin'].Text;
end;

procedure TXMLLumberSpeciesClass.Set_SpeciesOrigin(Value: UnicodeString);
begin
  SetAttribute('SpeciesOrigin', Value);
end;

function TXMLLumberSpeciesClass.Get_SpeciesAgency: UnicodeString;
begin
  Result := AttributeNodes['SpeciesAgency'].Text;
end;

procedure TXMLLumberSpeciesClass.Set_SpeciesAgency(Value: UnicodeString);
begin
  SetAttribute('SpeciesAgency', Value);
end;

function TXMLLumberSpeciesClass.Get_SpeciesCode: UnicodeString;
begin
  Result := ChildNodes['SpeciesCode'].Text;
end;

procedure TXMLLumberSpeciesClass.Set_SpeciesCode(Value: UnicodeString);
begin
  ChildNodes['SpeciesCode'].NodeValue := Value;
end;

function TXMLLumberSpeciesClass.Get_AdditionalText: UnicodeString;
begin
  Result := ChildNodes['AdditionalText'].Text;
end;

procedure TXMLLumberSpeciesClass.Set_AdditionalText(Value: UnicodeString);
begin
  ChildNodes['AdditionalText'].NodeValue := Value;
end;

{ TXMLLumberSpeciesClassList }

function TXMLLumberSpeciesClassList.Add: IXMLLumberSpeciesClass;
begin
  Result := AddItem(-1) as IXMLLumberSpeciesClass;
end;

function TXMLLumberSpeciesClassList.Insert(const Index: Integer): IXMLLumberSpeciesClass;
begin
  Result := AddItem(Index) as IXMLLumberSpeciesClass;
end;

function TXMLLumberSpeciesClassList.Get_Item(Index: Integer): IXMLLumberSpeciesClass;
begin
  Result := List[Index] as IXMLLumberSpeciesClass;
end;

{ TXMLLog }

procedure TXMLLog.AfterConstruction;
begin
  RegisterChildNode('LogCharacteristics', TXMLLogCharacteristics);
  RegisterChildNode('LogPackagingCharacteristics', TXMLLogPackagingCharacteristics);
  inherited;
end;

function TXMLLog.Get_LogCharacteristics: IXMLLogCharacteristics;
begin
  Result := ChildNodes['LogCharacteristics'] as IXMLLogCharacteristics;
end;

function TXMLLog.Get_LogPackagingCharacteristics: IXMLLogPackagingCharacteristics;
begin
  Result := ChildNodes['LogPackagingCharacteristics'] as IXMLLogPackagingCharacteristics;
end;

{ TXMLLogCharacteristics }

procedure TXMLLogCharacteristics.AfterConstruction;
begin
  RegisterChildNode('Length', TXMLMeasurement);
  RegisterChildNode('SmallEndDiameter', TXMLMeasurement);
  RegisterChildNode('LargeEndDiameter', TXMLMeasurement);
  RegisterChildNode('DiameterBreastHeight', TXMLMeasurement);
  inherited;
end;

function TXMLLogCharacteristics.Get_LogLengthType: UnicodeString;
begin
  Result := AttributeNodes['LogLengthType'].Text;
end;

procedure TXMLLogCharacteristics.Set_LogLengthType(Value: UnicodeString);
begin
  SetAttribute('LogLengthType', Value);
end;

function TXMLLogCharacteristics.Get_Debarked: UnicodeString;
begin
  Result := AttributeNodes['Debarked'].Text;
end;

procedure TXMLLogCharacteristics.Set_Debarked(Value: UnicodeString);
begin
  SetAttribute('Debarked', Value);
end;

function TXMLLogCharacteristics.Get_LogConversionRule: UnicodeString;
begin
  Result := AttributeNodes['LogConversionRule'].Text;
end;

procedure TXMLLogCharacteristics.Set_LogConversionRule(Value: UnicodeString);
begin
  SetAttribute('LogConversionRule', Value);
end;

function TXMLLogCharacteristics.Get_Length: IXMLMeasurement;
begin
  Result := ChildNodes['Length'] as IXMLMeasurement;
end;

function TXMLLogCharacteristics.Get_SmallEndDiameter: IXMLMeasurement;
begin
  Result := ChildNodes['SmallEndDiameter'] as IXMLMeasurement;
end;

function TXMLLogCharacteristics.Get_LargeEndDiameter: IXMLMeasurement;
begin
  Result := ChildNodes['LargeEndDiameter'] as IXMLMeasurement;
end;

function TXMLLogCharacteristics.Get_DiameterBreastHeight: IXMLMeasurement;
begin
  Result := ChildNodes['DiameterBreastHeight'] as IXMLMeasurement;
end;

{ TXMLLogPackagingCharacteristics }

procedure TXMLLogPackagingCharacteristics.AfterConstruction;
begin
  RegisterChildNode('Identifier', TXMLIdentifierS60);
  RegisterChildNode('ItemCount', TXMLMeasurement);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  FIdentifier := CreateCollection(TXMLIdentifierS60List, IXMLIdentifierS60, 'Identifier') as IXMLIdentifierS60List;
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  inherited;
end;

function TXMLLogPackagingCharacteristics.Get_DoubleBunked: UnicodeString;
begin
  Result := AttributeNodes['DoubleBunked'].Text;
end;

procedure TXMLLogPackagingCharacteristics.Set_DoubleBunked(Value: UnicodeString);
begin
  SetAttribute('DoubleBunked', Value);
end;

function TXMLLogPackagingCharacteristics.Get_Identifier: IXMLIdentifierS60List;
begin
  Result := FIdentifier;
end;

function TXMLLogPackagingCharacteristics.Get_ItemCount: IXMLMeasurement;
begin
  Result := ChildNodes['ItemCount'] as IXMLMeasurement;
end;

function TXMLLogPackagingCharacteristics.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLLogPackagingCharacteristics.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

{ TXMLIdentifierS60 }

function TXMLIdentifierS60.Get_IdentifierCodeType: UnicodeString;
begin
  Result := AttributeNodes['IdentifierCodeType'].Text;
end;

procedure TXMLIdentifierS60.Set_IdentifierCodeType(Value: UnicodeString);
begin
  SetAttribute('IdentifierCodeType', Value);
end;

function TXMLIdentifierS60.Get_IdentifierType: UnicodeString;
begin
  Result := AttributeNodes['IdentifierType'].Text;
end;

procedure TXMLIdentifierS60.Set_IdentifierType(Value: UnicodeString);
begin
  SetAttribute('IdentifierType', Value);
end;

function TXMLIdentifierS60.Get_IdentifierFormatType: UnicodeString;
begin
  Result := AttributeNodes['IdentifierFormatType'].Text;
end;

procedure TXMLIdentifierS60.Set_IdentifierFormatType(Value: UnicodeString);
begin
  SetAttribute('IdentifierFormatType', Value);
end;

{ TXMLIdentifierS60List }

function TXMLIdentifierS60List.Add: IXMLIdentifierS60;
begin
  Result := AddItem(-1) as IXMLIdentifierS60;
end;

function TXMLIdentifierS60List.Insert(const Index: Integer): IXMLIdentifierS60;
begin
  Result := AddItem(Index) as IXMLIdentifierS60;
end;

function TXMLIdentifierS60List.Get_Item(Index: Integer): IXMLIdentifierS60;
begin
  Result := List[Index] as IXMLIdentifierS60;
end;

{ TXMLChip }

procedure TXMLChip.AfterConstruction;
begin
  RegisterChildNode('ChipCharacteristics', TXMLChipCharacteristics);
  RegisterChildNode('ChipPackagingCharacteristics', TXMLChipPackagingCharacteristics);
  inherited;
end;

function TXMLChip.Get_ChipCharacteristics: IXMLChipCharacteristics;
begin
  Result := ChildNodes['ChipCharacteristics'] as IXMLChipCharacteristics;
end;

function TXMLChip.Get_ChipPackagingCharacteristics: IXMLChipPackagingCharacteristics;
begin
  Result := ChildNodes['ChipPackagingCharacteristics'] as IXMLChipPackagingCharacteristics;
end;

{ TXMLChipCharacteristics }

procedure TXMLChipCharacteristics.AfterConstruction;
begin
  RegisterChildNode('Thickness', TXMLMeasurement);
  RegisterChildNode('Moisture', TXMLMoisture);
  RegisterChildNode('Dirt', TXMLDirt);
  RegisterChildNode('Bark', TXMLBark);
  RegisterChildNode('Sawdust', TXMLSawdust);
  inherited;
end;

function TXMLChipCharacteristics.Get_Screened: UnicodeString;
begin
  Result := AttributeNodes['Screened'].Text;
end;

procedure TXMLChipCharacteristics.Set_Screened(Value: UnicodeString);
begin
  SetAttribute('Screened', Value);
end;

function TXMLChipCharacteristics.Get_Debarked: UnicodeString;
begin
  Result := AttributeNodes['Debarked'].Text;
end;

procedure TXMLChipCharacteristics.Set_Debarked(Value: UnicodeString);
begin
  SetAttribute('Debarked', Value);
end;

function TXMLChipCharacteristics.Get_Thickness: IXMLMeasurement;
begin
  Result := ChildNodes['Thickness'] as IXMLMeasurement;
end;

function TXMLChipCharacteristics.Get_Moisture: IXMLMoisture;
begin
  Result := ChildNodes['Moisture'] as IXMLMoisture;
end;

function TXMLChipCharacteristics.Get_Dirt: IXMLDirt;
begin
  Result := ChildNodes['Dirt'] as IXMLDirt;
end;

function TXMLChipCharacteristics.Get_Bark: IXMLBark;
begin
  Result := ChildNodes['Bark'] as IXMLBark;
end;

function TXMLChipCharacteristics.Get_Sawdust: IXMLSawdust;
begin
  Result := ChildNodes['Sawdust'] as IXMLSawdust;
end;

{ TXMLBark }

function TXMLBark.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLBark.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLBark.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLBark.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLBark.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLBark.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLBark.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLBark.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLSawdust }

function TXMLSawdust.Get_TestMethod: UnicodeString;
begin
  Result := AttributeNodes['TestMethod'].Text;
end;

procedure TXMLSawdust.Set_TestMethod(Value: UnicodeString);
begin
  SetAttribute('TestMethod', Value);
end;

function TXMLSawdust.Get_TestAgency: UnicodeString;
begin
  Result := AttributeNodes['TestAgency'].Text;
end;

procedure TXMLSawdust.Set_TestAgency(Value: UnicodeString);
begin
  SetAttribute('TestAgency', Value);
end;

function TXMLSawdust.Get_SampleType: UnicodeString;
begin
  Result := AttributeNodes['SampleType'].Text;
end;

procedure TXMLSawdust.Set_SampleType(Value: UnicodeString);
begin
  SetAttribute('SampleType', Value);
end;

function TXMLSawdust.Get_ResultSource: UnicodeString;
begin
  Result := AttributeNodes['ResultSource'].Text;
end;

procedure TXMLSawdust.Set_ResultSource(Value: UnicodeString);
begin
  SetAttribute('ResultSource', Value);
end;

{ TXMLChipPackagingCharacteristics }

procedure TXMLChipPackagingCharacteristics.AfterConstruction;
begin
  RegisterChildNode('Identifier', TXMLIdentifierS60);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  inherited;
end;

function TXMLChipPackagingCharacteristics.Get_Identifier: IXMLIdentifierS60;
begin
  Result := ChildNodes['Identifier'] as IXMLIdentifierS60;
end;

function TXMLChipPackagingCharacteristics.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLChipPackagingCharacteristics.Get_InformationalQuantity: IXMLInformationalQuantity;
begin
  Result := ChildNodes['InformationalQuantity'] as IXMLInformationalQuantity;
end;

{ TXMLWoodProducts }

procedure TXMLWoodProducts.AfterConstruction;
begin
  RegisterChildNode('WoodTimbersDimensionalLumberBoards', TXMLWoodTimbersDimensionalLumberBoards);
  RegisterChildNode('RoofingSidingDeckingFencing', TXMLRoofingSidingDeckingFencing);
  RegisterChildNode('CompositeAndVeneerWoodPanels', TXMLCompositeAndVeneerWoodPanels);
  RegisterChildNode('ConstructionPackagesAndPreFabPanels', TXMLConstructionPackagesAndPreFabPanels);
  RegisterChildNode('ProofInformationalQuantity', TXMLProofInformationalQuantity);
  RegisterChildNode('SuppliedComponentInformation', TXMLSuppliedComponentInformation);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FProofInformationalQuantity := CreateCollection(TXMLProofInformationalQuantityList, IXMLProofInformationalQuantity, 'ProofInformationalQuantity') as IXMLProofInformationalQuantityList;
  FSuppliedComponentInformation := CreateCollection(TXMLSuppliedComponentInformationList, IXMLSuppliedComponentInformation, 'SuppliedComponentInformation') as IXMLSuppliedComponentInformationList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLWoodProducts.Get_WoodTimbersDimensionalLumberBoards: IXMLWoodTimbersDimensionalLumberBoards;
begin
  Result := ChildNodes['WoodTimbersDimensionalLumberBoards'] as IXMLWoodTimbersDimensionalLumberBoards;
end;

function TXMLWoodProducts.Get_RoofingSidingDeckingFencing: IXMLRoofingSidingDeckingFencing;
begin
  Result := ChildNodes['RoofingSidingDeckingFencing'] as IXMLRoofingSidingDeckingFencing;
end;

function TXMLWoodProducts.Get_CompositeAndVeneerWoodPanels: IXMLCompositeAndVeneerWoodPanels;
begin
  Result := ChildNodes['CompositeAndVeneerWoodPanels'] as IXMLCompositeAndVeneerWoodPanels;
end;

function TXMLWoodProducts.Get_ConstructionPackagesAndPreFabPanels: IXMLConstructionPackagesAndPreFabPanels;
begin
  Result := ChildNodes['ConstructionPackagesAndPreFabPanels'] as IXMLConstructionPackagesAndPreFabPanels;
end;

function TXMLWoodProducts.Get_Millwork: UnicodeString;
begin
  Result := ChildNodes['Millwork'].Text;
end;

procedure TXMLWoodProducts.Set_Millwork(Value: UnicodeString);
begin
  ChildNodes['Millwork'].NodeValue := Value;
end;

function TXMLWoodProducts.Get_Gypsum: UnicodeString;
begin
  Result := ChildNodes['Gypsum'].Text;
end;

procedure TXMLWoodProducts.Set_Gypsum(Value: UnicodeString);
begin
  ChildNodes['Gypsum'].NodeValue := Value;
end;

function TXMLWoodProducts.Get_ProofInformationalQuantity: IXMLProofInformationalQuantityList;
begin
  Result := FProofInformationalQuantity;
end;

function TXMLWoodProducts.Get_SuppliedComponentInformation: IXMLSuppliedComponentInformationList;
begin
  Result := FSuppliedComponentInformation;
end;

function TXMLWoodProducts.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

{ TXMLWoodTimbersDimensionalLumberBoards }

procedure TXMLWoodTimbersDimensionalLumberBoards.AfterConstruction;
begin
  RegisterChildNode('SoftwoodLumber', TXMLSoftwoodLumber);
  RegisterChildNode('HardwoodLumber', TXMLHardwoodLumber);
  inherited;
end;

function TXMLWoodTimbersDimensionalLumberBoards.Get_SoftwoodLumber: IXMLSoftwoodLumber;
begin
  Result := ChildNodes['SoftwoodLumber'] as IXMLSoftwoodLumber;
end;

function TXMLWoodTimbersDimensionalLumberBoards.Get_HardwoodLumber: IXMLHardwoodLumber;
begin
  Result := ChildNodes['HardwoodLumber'] as IXMLHardwoodLumber;
end;

{ TXMLSoftwoodLumber }

procedure TXMLSoftwoodLumber.AfterConstruction;
begin
  RegisterChildNode('SoftwoodLumberCharacteristics', TXMLSoftwoodLumberCharacteristicsClass);
  RegisterChildNode('Packaging', TXMLPackaging);
  inherited;
end;

function TXMLSoftwoodLumber.Get_SoftwoodLumberCharacteristics: IXMLSoftwoodLumberCharacteristicsClass;
begin
  Result := ChildNodes['SoftwoodLumberCharacteristics'] as IXMLSoftwoodLumberCharacteristicsClass;
end;

function TXMLSoftwoodLumber.Get_Packaging: IXMLPackaging;
begin
  Result := ChildNodes['Packaging'] as IXMLPackaging;
end;

{ TXMLSoftwoodLumberCharacteristicsClass }

procedure TXMLSoftwoodLumberCharacteristicsClass.AfterConstruction;
begin
  RegisterChildNode('LumberSpecies', TXMLLumberSpeciesClass);
  RegisterChildNode('LumberGrade', TXMLLumberGradeClass);
  RegisterChildNode('Length', TXMLDimensionConstructionClass);
  RegisterChildNode('Width', TXMLDimensionConstructionClass);
  RegisterChildNode('Thickness', TXMLDimensionThicknessClass);
  RegisterChildNode('Seasoning', TXMLLumberSeasoningClass);
  RegisterChildNode('MoistureContent', TXMLLumberMoistureContentClass);
  RegisterChildNode('HeatTreatment', TXMLHeatTreatmentClass);
  RegisterChildNode('ManufacturingProcess', TXMLLumberManufacturingProcessClass);
  RegisterChildNode('PatternProfile', TXMLLumberPatternProfileClass);
  RegisterChildNode('Trim', TXMLLumberTrimClass);
  RegisterChildNode('Joining', TXMLLumberJoiningClass);
  RegisterChildNode('PressureTreatment', TXMLPressureTreatmentClass);
  RegisterChildNode('FireTreatment', TXMLFireTreatmentClass);
  RegisterChildNode('OtherTreatment', TXMLOtherTreatmentClass);
  RegisterChildNode('GradeStamp', TXMLConstructionGradeStampClass);
  RegisterChildNode('ExLog', TXMLExLogClass);
  RegisterChildNode('ClassIdentifier', TXMLIdentifierS60);
  RegisterChildNode('Weight', TXMLMeasurement);
  RegisterChildNode('LabelCharacteristics', TXMLLabelCharacteristics);
  RegisterChildNode('StencilCharacteristics', TXMLStencilCharacteristics);
  RegisterChildNode('Wrap', TXMLWrap);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  RegisterChildNode('LengthCutDescription', TXMLLengthCutDescription);
  FLumberSpecies := CreateCollection(TXMLLumberSpeciesClassList, IXMLLumberSpeciesClass, 'LumberSpecies') as IXMLLumberSpeciesClassList;
  FLength := CreateCollection(TXMLDimensionConstructionClassList, IXMLDimensionConstructionClass, 'Length') as IXMLDimensionConstructionClassList;
  FWidth := CreateCollection(TXMLDimensionConstructionClassList, IXMLDimensionConstructionClass, 'Width') as IXMLDimensionConstructionClassList;
  FThickness := CreateCollection(TXMLDimensionThicknessClassList, IXMLDimensionThicknessClass, 'Thickness') as IXMLDimensionThicknessClassList;
  FManufacturingProcess := CreateCollection(TXMLLumberManufacturingProcessClassList, IXMLLumberManufacturingProcessClass, 'ManufacturingProcess') as IXMLLumberManufacturingProcessClassList;
  FClassIdentifier := CreateCollection(TXMLIdentifierS60List, IXMLIdentifierS60, 'ClassIdentifier') as IXMLIdentifierS60List;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_LumberSpecies: IXMLLumberSpeciesClassList;
begin
  Result := FLumberSpecies;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_LumberGrade: IXMLLumberGradeClass;
begin
  Result := ChildNodes['LumberGrade'] as IXMLLumberGradeClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_Length: IXMLDimensionConstructionClassList;
begin
  Result := FLength;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_Width: IXMLDimensionConstructionClassList;
begin
  Result := FWidth;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_Thickness: IXMLDimensionThicknessClassList;
begin
  Result := FThickness;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_Seasoning: IXMLLumberSeasoningClass;
begin
  Result := ChildNodes['Seasoning'] as IXMLLumberSeasoningClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_MoistureContent: IXMLLumberMoistureContentClass;
begin
  Result := ChildNodes['MoistureContent'] as IXMLLumberMoistureContentClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_HeatTreatment: IXMLHeatTreatmentClass;
begin
  Result := ChildNodes['HeatTreatment'] as IXMLHeatTreatmentClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_ManufacturingProcess: IXMLLumberManufacturingProcessClassList;
begin
  Result := FManufacturingProcess;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_PatternProfile: IXMLLumberPatternProfileClass;
begin
  Result := ChildNodes['PatternProfile'] as IXMLLumberPatternProfileClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_Trim: IXMLLumberTrimClass;
begin
  Result := ChildNodes['Trim'] as IXMLLumberTrimClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_Joining: IXMLLumberJoiningClass;
begin
  Result := ChildNodes['Joining'] as IXMLLumberJoiningClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_PressureTreatment: IXMLPressureTreatmentClass;
begin
  Result := ChildNodes['PressureTreatment'] as IXMLPressureTreatmentClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_FireTreatment: IXMLFireTreatmentClass;
begin
  Result := ChildNodes['FireTreatment'] as IXMLFireTreatmentClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_OtherTreatment: IXMLOtherTreatmentClass;
begin
  Result := ChildNodes['OtherTreatment'] as IXMLOtherTreatmentClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_GradeStamp: IXMLConstructionGradeStampClass;
begin
  Result := ChildNodes['GradeStamp'] as IXMLConstructionGradeStampClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_ExLog: IXMLExLogClass;
begin
  Result := ChildNodes['ExLog'] as IXMLExLogClass;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_ClassIdentifier: IXMLIdentifierS60List;
begin
  Result := FClassIdentifier;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_Weight: IXMLMeasurement;
begin
  Result := ChildNodes['Weight'] as IXMLMeasurement;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_LabelCharacteristics: IXMLLabelCharacteristics;
begin
  Result := ChildNodes['LabelCharacteristics'] as IXMLLabelCharacteristics;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_StencilCharacteristics: IXMLStencilCharacteristics;
begin
  Result := ChildNodes['StencilCharacteristics'] as IXMLStencilCharacteristics;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_Wrap: IXMLWrap;
begin
  Result := ChildNodes['Wrap'] as IXMLWrap;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_LengthCutDescription: IXMLLengthCutDescription;
begin
  Result := ChildNodes['LengthCutDescription'] as IXMLLengthCutDescription;
end;

function TXMLSoftwoodLumberCharacteristicsClass.Get_ShippingMark: UnicodeString;
begin
  Result := ChildNodes['ShippingMark'].Text;
end;

procedure TXMLSoftwoodLumberCharacteristicsClass.Set_ShippingMark(Value: UnicodeString);
begin
  ChildNodes['ShippingMark'].NodeValue := Value;
end;

{ TXMLLumberGradeClass }

function TXMLLumberGradeClass.Get_GradeType: UnicodeString;
begin
  Result := AttributeNodes['GradeType'].Text;
end;

procedure TXMLLumberGradeClass.Set_GradeType(Value: UnicodeString);
begin
  SetAttribute('GradeType', Value);
end;

function TXMLLumberGradeClass.Get_GradingRule: UnicodeString;
begin
  Result := AttributeNodes['GradingRule'].Text;
end;

procedure TXMLLumberGradeClass.Set_GradingRule(Value: UnicodeString);
begin
  SetAttribute('GradingRule', Value);
end;

function TXMLLumberGradeClass.Get_GradeAgency: UnicodeString;
begin
  Result := AttributeNodes['GradeAgency'].Text;
end;

procedure TXMLLumberGradeClass.Set_GradeAgency(Value: UnicodeString);
begin
  SetAttribute('GradeAgency', Value);
end;

function TXMLLumberGradeClass.Get_ModulusElasticity: UnicodeString;
begin
  Result := AttributeNodes['ModulusElasticity'].Text;
end;

procedure TXMLLumberGradeClass.Set_ModulusElasticity(Value: UnicodeString);
begin
  SetAttribute('ModulusElasticity', Value);
end;

function TXMLLumberGradeClass.Get_Face: UnicodeString;
begin
  Result := AttributeNodes['Face'].Text;
end;

procedure TXMLLumberGradeClass.Set_Face(Value: UnicodeString);
begin
  SetAttribute('Face', Value);
end;

function TXMLLumberGradeClass.Get_GradeName: UnicodeString;
begin
  Result := ChildNodes['GradeName'].Text;
end;

procedure TXMLLumberGradeClass.Set_GradeName(Value: UnicodeString);
begin
  ChildNodes['GradeName'].NodeValue := Value;
end;

function TXMLLumberGradeClass.Get_GradeCode: UnicodeString;
begin
  Result := ChildNodes['GradeCode'].Text;
end;

procedure TXMLLumberGradeClass.Set_GradeCode(Value: UnicodeString);
begin
  ChildNodes['GradeCode'].NodeValue := Value;
end;

function TXMLLumberGradeClass.Get_AdditionalText: UnicodeString;
begin
  Result := ChildNodes['AdditionalText'].Text;
end;

procedure TXMLLumberGradeClass.Set_AdditionalText(Value: UnicodeString);
begin
  ChildNodes['AdditionalText'].NodeValue := Value;
end;

{ TXMLDimensionConstructionClass }

procedure TXMLDimensionConstructionClass.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  RegisterChildNode('RangeMin', TXMLRangeMin);
  RegisterChildNode('RangeMax', TXMLRangeMax);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLDimensionConstructionClass.Get_ActualNominal: UnicodeString;
begin
  Result := AttributeNodes['ActualNominal'].Text;
end;

procedure TXMLDimensionConstructionClass.Set_ActualNominal(Value: UnicodeString);
begin
  SetAttribute('ActualNominal', Value);
end;

function TXMLDimensionConstructionClass.Get_WithGrain: UnicodeString;
begin
  Result := AttributeNodes['WithGrain'].Text;
end;

procedure TXMLDimensionConstructionClass.Set_WithGrain(Value: UnicodeString);
begin
  SetAttribute('WithGrain', Value);
end;

function TXMLDimensionConstructionClass.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

function TXMLDimensionConstructionClass.Get_RangeMin: IXMLRangeMin;
begin
  Result := ChildNodes['RangeMin'] as IXMLRangeMin;
end;

function TXMLDimensionConstructionClass.Get_RangeMax: IXMLRangeMax;
begin
  Result := ChildNodes['RangeMax'] as IXMLRangeMax;
end;

function TXMLDimensionConstructionClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLDimensionConstructionClassList }

function TXMLDimensionConstructionClassList.Add: IXMLDimensionConstructionClass;
begin
  Result := AddItem(-1) as IXMLDimensionConstructionClass;
end;

function TXMLDimensionConstructionClassList.Insert(const Index: Integer): IXMLDimensionConstructionClass;
begin
  Result := AddItem(Index) as IXMLDimensionConstructionClass;
end;

function TXMLDimensionConstructionClassList.Get_Item(Index: Integer): IXMLDimensionConstructionClass;
begin
  Result := List[Index] as IXMLDimensionConstructionClass;
end;

{ TXMLDimensionThicknessClass }

procedure TXMLDimensionThicknessClass.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  RegisterChildNode('RangeMin', TXMLRangeMin);
  RegisterChildNode('RangeMax', TXMLRangeMax);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLDimensionThicknessClass.Get_ActualNominal: UnicodeString;
begin
  Result := AttributeNodes['ActualNominal'].Text;
end;

procedure TXMLDimensionThicknessClass.Set_ActualNominal(Value: UnicodeString);
begin
  SetAttribute('ActualNominal', Value);
end;

function TXMLDimensionThicknessClass.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

function TXMLDimensionThicknessClass.Get_RangeMin: IXMLRangeMin;
begin
  Result := ChildNodes['RangeMin'] as IXMLRangeMin;
end;

function TXMLDimensionThicknessClass.Get_RangeMax: IXMLRangeMax;
begin
  Result := ChildNodes['RangeMax'] as IXMLRangeMax;
end;

function TXMLDimensionThicknessClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLDimensionThicknessClassList }

function TXMLDimensionThicknessClassList.Add: IXMLDimensionThicknessClass;
begin
  Result := AddItem(-1) as IXMLDimensionThicknessClass;
end;

function TXMLDimensionThicknessClassList.Insert(const Index: Integer): IXMLDimensionThicknessClass;
begin
  Result := AddItem(Index) as IXMLDimensionThicknessClass;
end;

function TXMLDimensionThicknessClassList.Get_Item(Index: Integer): IXMLDimensionThicknessClass;
begin
  Result := List[Index] as IXMLDimensionThicknessClass;
end;

{ TXMLLumberSeasoningClass }

function TXMLLumberSeasoningClass.Get_SeasoningType: UnicodeString;
begin
  Result := AttributeNodes['SeasoningType'].Text;
end;

procedure TXMLLumberSeasoningClass.Set_SeasoningType(Value: UnicodeString);
begin
  SetAttribute('SeasoningType', Value);
end;

function TXMLLumberSeasoningClass.Get_AdditionalText: UnicodeString;
begin
  Result := ChildNodes['AdditionalText'].Text;
end;

procedure TXMLLumberSeasoningClass.Set_AdditionalText(Value: UnicodeString);
begin
  ChildNodes['AdditionalText'].NodeValue := Value;
end;

{ TXMLLumberMoistureContentClass }

function TXMLLumberMoistureContentClass.Get_MoistureContentPercentage: UnicodeString;
begin
  Result := AttributeNodes['MoistureContentPercentage'].Text;
end;

procedure TXMLLumberMoistureContentClass.Set_MoistureContentPercentage(Value: UnicodeString);
begin
  SetAttribute('MoistureContentPercentage', Value);
end;

function TXMLLumberMoistureContentClass.Get_AdditionalText: UnicodeString;
begin
  Result := ChildNodes['AdditionalText'].Text;
end;

procedure TXMLLumberMoistureContentClass.Set_AdditionalText(Value: UnicodeString);
begin
  ChildNodes['AdditionalText'].NodeValue := Value;
end;

{ TXMLHeatTreatmentClass }

procedure TXMLHeatTreatmentClass.AfterConstruction;
begin
  ItemTag := 'AdditionalText';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLHeatTreatmentClass.Get_HeatTreatmentType: UnicodeString;
begin
  Result := AttributeNodes['HeatTreatmentType'].Text;
end;

procedure TXMLHeatTreatmentClass.Set_HeatTreatmentType(Value: UnicodeString);
begin
  SetAttribute('HeatTreatmentType', Value);
end;

function TXMLHeatTreatmentClass.Get_AdditionalText(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLHeatTreatmentClass.Add(const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := AdditionalText;
end;

function TXMLHeatTreatmentClass.Insert(const Index: Integer; const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := AdditionalText;
end;

{ TXMLLumberManufacturingProcessClass }

procedure TXMLLumberManufacturingProcessClass.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  inherited;
end;

function TXMLLumberManufacturingProcessClass.Get_ManufacturingProcessType: UnicodeString;
begin
  Result := AttributeNodes['ManufacturingProcessType'].Text;
end;

procedure TXMLLumberManufacturingProcessClass.Set_ManufacturingProcessType(Value: UnicodeString);
begin
  SetAttribute('ManufacturingProcessType', Value);
end;

function TXMLLumberManufacturingProcessClass.Get_ManufacturingProcessAgency: UnicodeString;
begin
  Result := AttributeNodes['ManufacturingProcessAgency'].Text;
end;

procedure TXMLLumberManufacturingProcessClass.Set_ManufacturingProcessAgency(Value: UnicodeString);
begin
  SetAttribute('ManufacturingProcessAgency', Value);
end;

function TXMLLumberManufacturingProcessClass.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

function TXMLLumberManufacturingProcessClass.Get_AdditionalText: UnicodeString;
begin
  Result := ChildNodes['AdditionalText'].Text;
end;

procedure TXMLLumberManufacturingProcessClass.Set_AdditionalText(Value: UnicodeString);
begin
  ChildNodes['AdditionalText'].NodeValue := Value;
end;

{ TXMLLumberManufacturingProcessClassList }

function TXMLLumberManufacturingProcessClassList.Add: IXMLLumberManufacturingProcessClass;
begin
  Result := AddItem(-1) as IXMLLumberManufacturingProcessClass;
end;

function TXMLLumberManufacturingProcessClassList.Insert(const Index: Integer): IXMLLumberManufacturingProcessClass;
begin
  Result := AddItem(Index) as IXMLLumberManufacturingProcessClass;
end;

function TXMLLumberManufacturingProcessClassList.Get_Item(Index: Integer): IXMLLumberManufacturingProcessClass;
begin
  Result := List[Index] as IXMLLumberManufacturingProcessClass;
end;

{ TXMLLumberPatternProfileClass }

function TXMLLumberPatternProfileClass.Get_PatternProfileType: UnicodeString;
begin
  Result := AttributeNodes['PatternProfileType'].Text;
end;

procedure TXMLLumberPatternProfileClass.Set_PatternProfileType(Value: UnicodeString);
begin
  SetAttribute('PatternProfileType', Value);
end;

function TXMLLumberPatternProfileClass.Get_PatternProfileAgency: UnicodeString;
begin
  Result := AttributeNodes['PatternProfileAgency'].Text;
end;

procedure TXMLLumberPatternProfileClass.Set_PatternProfileAgency(Value: UnicodeString);
begin
  SetAttribute('PatternProfileAgency', Value);
end;

function TXMLLumberPatternProfileClass.Get_PatternProfileCode: UnicodeString;
begin
  Result := ChildNodes['PatternProfileCode'].Text;
end;

procedure TXMLLumberPatternProfileClass.Set_PatternProfileCode(Value: UnicodeString);
begin
  ChildNodes['PatternProfileCode'].NodeValue := Value;
end;

function TXMLLumberPatternProfileClass.Get_AdditionalText: UnicodeString;
begin
  Result := ChildNodes['AdditionalText'].Text;
end;

procedure TXMLLumberPatternProfileClass.Set_AdditionalText(Value: UnicodeString);
begin
  ChildNodes['AdditionalText'].NodeValue := Value;
end;

{ TXMLLumberTrimClass }

function TXMLLumberTrimClass.Get_TrimType: UnicodeString;
begin
  Result := AttributeNodes['TrimType'].Text;
end;

procedure TXMLLumberTrimClass.Set_TrimType(Value: UnicodeString);
begin
  SetAttribute('TrimType', Value);
end;

function TXMLLumberTrimClass.Get_AdditionalText: UnicodeString;
begin
  Result := ChildNodes['AdditionalText'].Text;
end;

procedure TXMLLumberTrimClass.Set_AdditionalText(Value: UnicodeString);
begin
  ChildNodes['AdditionalText'].NodeValue := Value;
end;

{ TXMLLumberJoiningClass }

function TXMLLumberJoiningClass.Get_JoiningType: UnicodeString;
begin
  Result := AttributeNodes['JoiningType'].Text;
end;

procedure TXMLLumberJoiningClass.Set_JoiningType(Value: UnicodeString);
begin
  SetAttribute('JoiningType', Value);
end;

function TXMLLumberJoiningClass.Get_AdditionalText: UnicodeString;
begin
  Result := ChildNodes['AdditionalText'].Text;
end;

procedure TXMLLumberJoiningClass.Set_AdditionalText(Value: UnicodeString);
begin
  ChildNodes['AdditionalText'].NodeValue := Value;
end;

{ TXMLPressureTreatmentClass }

procedure TXMLPressureTreatmentClass.AfterConstruction;
begin
  RegisterChildNode('PressureTreatmentCompound', TXMLPressureTreatmentCompoundClass);
  RegisterChildNode('PressureTreatmentConcentration', TXMLPressureTreatmentConcentration);
  inherited;
end;

function TXMLPressureTreatmentClass.Get_PressureTreatmentCompound: IXMLPressureTreatmentCompoundClass;
begin
  Result := ChildNodes['PressureTreatmentCompound'] as IXMLPressureTreatmentCompoundClass;
end;

function TXMLPressureTreatmentClass.Get_PressureTreatmentConcentration: IXMLPressureTreatmentConcentration;
begin
  Result := ChildNodes['PressureTreatmentConcentration'] as IXMLPressureTreatmentConcentration;
end;

function TXMLPressureTreatmentClass.Get_PressureTreatmentComStdorUseCategory: UnicodeString;
begin
  Result := ChildNodes['PressureTreatmentComStdorUseCategory'].Text;
end;

procedure TXMLPressureTreatmentClass.Set_PressureTreatmentComStdorUseCategory(Value: UnicodeString);
begin
  ChildNodes['PressureTreatmentComStdorUseCategory'].NodeValue := Value;
end;

{ TXMLPressureTreatmentCompoundClass }

procedure TXMLPressureTreatmentCompoundClass.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLPressureTreatmentCompoundClass.Get_CompoundType: UnicodeString;
begin
  Result := AttributeNodes['CompoundType'].Text;
end;

procedure TXMLPressureTreatmentCompoundClass.Set_CompoundType(Value: UnicodeString);
begin
  SetAttribute('CompoundType', Value);
end;

function TXMLPressureTreatmentCompoundClass.Get_CompoundAgency: UnicodeString;
begin
  Result := AttributeNodes['CompoundAgency'].Text;
end;

procedure TXMLPressureTreatmentCompoundClass.Set_CompoundAgency(Value: UnicodeString);
begin
  SetAttribute('CompoundAgency', Value);
end;

function TXMLPressureTreatmentCompoundClass.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

function TXMLPressureTreatmentCompoundClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLPressureTreatmentConcentration }

function TXMLPressureTreatmentConcentration.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLPressureTreatmentConcentration.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLFireTreatmentClass }

procedure TXMLFireTreatmentClass.AfterConstruction;
begin
  ItemTag := 'AdditionalText';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLFireTreatmentClass.Get_FireTreatmentType: UnicodeString;
begin
  Result := AttributeNodes['FireTreatmentType'].Text;
end;

procedure TXMLFireTreatmentClass.Set_FireTreatmentType(Value: UnicodeString);
begin
  SetAttribute('FireTreatmentType', Value);
end;

function TXMLFireTreatmentClass.Get_AdditionalText(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLFireTreatmentClass.Add(const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := AdditionalText;
end;

function TXMLFireTreatmentClass.Insert(const Index: Integer; const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := AdditionalText;
end;

{ TXMLOtherTreatmentClass }

procedure TXMLOtherTreatmentClass.AfterConstruction;
begin
  ItemTag := 'AdditionalText';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLOtherTreatmentClass.Get_AdditionalText(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLOtherTreatmentClass.Add(const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := AdditionalText;
end;

function TXMLOtherTreatmentClass.Insert(const Index: Integer; const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := AdditionalText;
end;

{ TXMLConstructionGradeStampClass }

procedure TXMLConstructionGradeStampClass.AfterConstruction;
begin
  FGradeStampMillNumber := CreateCollection(TXMLS255List, IXMLNode, 'GradeStampMillNumber') as IXMLS255List;
  inherited;
end;

function TXMLConstructionGradeStampClass.Get_GradeStamped: UnicodeString;
begin
  Result := AttributeNodes['GradeStamped'].Text;
end;

procedure TXMLConstructionGradeStampClass.Set_GradeStamped(Value: UnicodeString);
begin
  SetAttribute('GradeStamped', Value);
end;

function TXMLConstructionGradeStampClass.Get_GradeStampMillNumber: IXMLS255List;
begin
  Result := FGradeStampMillNumber;
end;

function TXMLConstructionGradeStampClass.Get_GradeStampLocation: UnicodeString;
begin
  Result := ChildNodes['GradeStampLocation'].Text;
end;

procedure TXMLConstructionGradeStampClass.Set_GradeStampLocation(Value: UnicodeString);
begin
  ChildNodes['GradeStampLocation'].NodeValue := Value;
end;

{ TXMLExLogClass }

procedure TXMLExLogClass.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  inherited;
end;

function TXMLExLogClass.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

{ TXMLLengthCutDescription }

function TXMLLengthCutDescription.Get_LengthCutType: UnicodeString;
begin
  Result := AttributeNodes['LengthCutType'].Text;
end;

procedure TXMLLengthCutDescription.Set_LengthCutType(Value: UnicodeString);
begin
  SetAttribute('LengthCutType', Value);
end;

{ TXMLPackaging }

procedure TXMLPackaging.AfterConstruction;
begin
  RegisterChildNode('ProductPackaging', TXMLProductPackagingClass);
  inherited;
end;

function TXMLPackaging.Get_ProductPackaging: IXMLProductPackagingClass;
begin
  Result := ChildNodes['ProductPackaging'] as IXMLProductPackagingClass;
end;

{ TXMLProductPackagingClass }

procedure TXMLProductPackagingClass.AfterConstruction;
begin
  RegisterChildNode('QuantityInUnit', TXMLMeasurement);
  RegisterChildNode('UnitDimension', TXMLUnitDimensionType);
  RegisterChildNode('Weight', TXMLMeasurement);
  RegisterChildNode('PackageIDInformation', TXMLLumberPackageCodeClass);
  RegisterChildNode('LabelCharacteristics', TXMLLabelCharacteristics);
  RegisterChildNode('StencilCharacteristics', TXMLStencilCharacteristics);
  RegisterChildNode('BandCharacteristics', TXMLBandCharacteristics);
  RegisterChildNode('PalletCharacteristics', TXMLPalletCharacteristics);
  RegisterChildNode('Wrap', TXMLWrap);
  FLabelCharacteristics := CreateCollection(TXMLLabelCharacteristicsList, IXMLLabelCharacteristics, 'LabelCharacteristics') as IXMLLabelCharacteristicsList;
  FStencilCharacteristics := CreateCollection(TXMLStencilCharacteristicsList, IXMLStencilCharacteristics, 'StencilCharacteristics') as IXMLStencilCharacteristicsList;
  FBandCharacteristics := CreateCollection(TXMLBandCharacteristicsList, IXMLBandCharacteristics, 'BandCharacteristics') as IXMLBandCharacteristicsList;
  FPalletCharacteristics := CreateCollection(TXMLPalletCharacteristicsList, IXMLPalletCharacteristics, 'PalletCharacteristics') as IXMLPalletCharacteristicsList;
  FWrap := CreateCollection(TXMLWrapList, IXMLWrap, 'Wrap') as IXMLWrapList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLProductPackagingClass.Get_QuantityInUnit: IXMLMeasurement;
begin
  Result := ChildNodes['QuantityInUnit'] as IXMLMeasurement;
end;

function TXMLProductPackagingClass.Get_UnitDimension: IXMLUnitDimensionType;
begin
  Result := ChildNodes['UnitDimension'] as IXMLUnitDimensionType;
end;

function TXMLProductPackagingClass.Get_Weight: IXMLMeasurement;
begin
  Result := ChildNodes['Weight'] as IXMLMeasurement;
end;

function TXMLProductPackagingClass.Get_PackageIDInformation: IXMLLumberPackageCodeClass;
begin
  Result := ChildNodes['PackageIDInformation'] as IXMLLumberPackageCodeClass;
end;

function TXMLProductPackagingClass.Get_LabelCharacteristics: IXMLLabelCharacteristicsList;
begin
  Result := FLabelCharacteristics;
end;

function TXMLProductPackagingClass.Get_StencilCharacteristics: IXMLStencilCharacteristicsList;
begin
  Result := FStencilCharacteristics;
end;

function TXMLProductPackagingClass.Get_BandCharacteristics: IXMLBandCharacteristicsList;
begin
  Result := FBandCharacteristics;
end;

function TXMLProductPackagingClass.Get_PalletCharacteristics: IXMLPalletCharacteristicsList;
begin
  Result := FPalletCharacteristics;
end;

function TXMLProductPackagingClass.Get_Wrap: IXMLWrapList;
begin
  Result := FWrap;
end;

function TXMLProductPackagingClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLProductPackagingClass.Get_PackageType: UnicodeString;
begin
  Result := ChildNodes['PackageType'].Text;
end;

procedure TXMLProductPackagingClass.Set_PackageType(Value: UnicodeString);
begin
  ChildNodes['PackageType'].NodeValue := Value;
end;

{ TXMLUnitDimensionType }

procedure TXMLUnitDimensionType.AfterConstruction;
begin
  RegisterChildNode('Length', TXMLDimensionMeasurementClass);
  RegisterChildNode('Width', TXMLDimensionMeasurementClass);
  RegisterChildNode('Height', TXMLDimensionMeasurementClass);
  inherited;
end;

function TXMLUnitDimensionType.Get_Length: IXMLDimensionMeasurementClass;
begin
  Result := ChildNodes['Length'] as IXMLDimensionMeasurementClass;
end;

function TXMLUnitDimensionType.Get_Width: IXMLDimensionMeasurementClass;
begin
  Result := ChildNodes['Width'] as IXMLDimensionMeasurementClass;
end;

function TXMLUnitDimensionType.Get_Height: IXMLDimensionMeasurementClass;
begin
  Result := ChildNodes['Height'] as IXMLDimensionMeasurementClass;
end;

function TXMLUnitDimensionType.Get_PiecesPerRow: LongWord;
begin
  Result := ChildNodes['PiecesPerRow'].NodeValue;
end;

procedure TXMLUnitDimensionType.Set_PiecesPerRow(Value: LongWord);
begin
  ChildNodes['PiecesPerRow'].NodeValue := Value;
end;

function TXMLUnitDimensionType.Get_RowsPerUnit: LongWord;
begin
  Result := ChildNodes['RowsPerUnit'].NodeValue;
end;

procedure TXMLUnitDimensionType.Set_RowsPerUnit(Value: LongWord);
begin
  ChildNodes['RowsPerUnit'].NodeValue := Value;
end;

{ TXMLDimensionMeasurementClass }

procedure TXMLDimensionMeasurementClass.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  RegisterChildNode('RangeMin', TXMLRangeMin);
  RegisterChildNode('RangeMax', TXMLRangeMax);
  inherited;
end;

function TXMLDimensionMeasurementClass.Get_ActualNominal: UnicodeString;
begin
  Result := AttributeNodes['ActualNominal'].Text;
end;

procedure TXMLDimensionMeasurementClass.Set_ActualNominal(Value: UnicodeString);
begin
  SetAttribute('ActualNominal', Value);
end;

function TXMLDimensionMeasurementClass.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

function TXMLDimensionMeasurementClass.Get_RangeMin: IXMLRangeMin;
begin
  Result := ChildNodes['RangeMin'] as IXMLRangeMin;
end;

function TXMLDimensionMeasurementClass.Get_RangeMax: IXMLRangeMax;
begin
  Result := ChildNodes['RangeMax'] as IXMLRangeMax;
end;

{ TXMLLumberPackageCodeClass }

function TXMLLumberPackageCodeClass.Get_PackageAgency: UnicodeString;
begin
  Result := AttributeNodes['PackageAgency'].Text;
end;

procedure TXMLLumberPackageCodeClass.Set_PackageAgency(Value: UnicodeString);
begin
  SetAttribute('PackageAgency', Value);
end;

function TXMLLumberPackageCodeClass.Get_PackageCode: UnicodeString;
begin
  Result := ChildNodes['PackageCode'].Text;
end;

procedure TXMLLumberPackageCodeClass.Set_PackageCode(Value: UnicodeString);
begin
  ChildNodes['PackageCode'].NodeValue := Value;
end;

function TXMLLumberPackageCodeClass.Get_PackageName: UnicodeString;
begin
  Result := ChildNodes['PackageName'].Text;
end;

procedure TXMLLumberPackageCodeClass.Set_PackageName(Value: UnicodeString);
begin
  ChildNodes['PackageName'].NodeValue := Value;
end;

{ TXMLHardwoodLumber }

procedure TXMLHardwoodLumber.AfterConstruction;
begin
  RegisterChildNode('Packaging', TXMLPackaging);
  inherited;
end;

function TXMLHardwoodLumber.Get_HardwoodLumberCharacteristics: UnicodeString;
begin
  Result := ChildNodes['HardwoodLumberCharacteristics'].Text;
end;

procedure TXMLHardwoodLumber.Set_HardwoodLumberCharacteristics(Value: UnicodeString);
begin
  ChildNodes['HardwoodLumberCharacteristics'].NodeValue := Value;
end;

function TXMLHardwoodLumber.Get_Packaging: IXMLPackaging;
begin
  Result := ChildNodes['Packaging'] as IXMLPackaging;
end;

{ TXMLRoofingSidingDeckingFencing }

procedure TXMLRoofingSidingDeckingFencing.AfterConstruction;
begin
  RegisterChildNode('NaturalWoodSiding', TXMLNaturalWoodSiding);
  RegisterChildNode('NaturalWoodSiding-Other', TXMLNaturalWoodSidingOther);
  RegisterChildNode('DeckAndPorchFlooringMaterials-NaturalWood', TXMLDeckAndPorchFlooringMaterialsNaturalWood);
  inherited;
end;

function TXMLRoofingSidingDeckingFencing.Get_NaturalWoodSiding: IXMLNaturalWoodSiding;
begin
  Result := ChildNodes['NaturalWoodSiding'] as IXMLNaturalWoodSiding;
end;

function TXMLRoofingSidingDeckingFencing.Get_NaturalWoodSidingOther: IXMLNaturalWoodSidingOther;
begin
  Result := ChildNodes['NaturalWoodSiding-Other'] as IXMLNaturalWoodSidingOther;
end;

function TXMLRoofingSidingDeckingFencing.Get_DeckAndPorchFlooringMaterialsNaturalWood: IXMLDeckAndPorchFlooringMaterialsNaturalWood;
begin
  Result := ChildNodes['DeckAndPorchFlooringMaterials-NaturalWood'] as IXMLDeckAndPorchFlooringMaterialsNaturalWood;
end;

{ TXMLNaturalWoodSiding }

procedure TXMLNaturalWoodSiding.AfterConstruction;
begin
  RegisterChildNode('NaturalWoodSidingCharacteristics', TXMLSoftwoodLumberCharacteristicsClass);
  RegisterChildNode('Packaging', TXMLPackaging);
  inherited;
end;

function TXMLNaturalWoodSiding.Get_NaturalWoodSidingCharacteristics: IXMLSoftwoodLumberCharacteristicsClass;
begin
  Result := ChildNodes['NaturalWoodSidingCharacteristics'] as IXMLSoftwoodLumberCharacteristicsClass;
end;

function TXMLNaturalWoodSiding.Get_Packaging: IXMLPackaging;
begin
  Result := ChildNodes['Packaging'] as IXMLPackaging;
end;

{ TXMLNaturalWoodSidingOther }

procedure TXMLNaturalWoodSidingOther.AfterConstruction;
begin
  RegisterChildNode('NaturalWoodSiding-OtherCharacteristics', TXMLSoftwoodLumberCharacteristicsClass);
  RegisterChildNode('Packaging', TXMLPackaging);
  inherited;
end;

function TXMLNaturalWoodSidingOther.Get_NaturalWoodSidingOtherCharacteristics: IXMLSoftwoodLumberCharacteristicsClass;
begin
  Result := ChildNodes['NaturalWoodSiding-OtherCharacteristics'] as IXMLSoftwoodLumberCharacteristicsClass;
end;

function TXMLNaturalWoodSidingOther.Get_Packaging: IXMLPackaging;
begin
  Result := ChildNodes['Packaging'] as IXMLPackaging;
end;

{ TXMLDeckAndPorchFlooringMaterialsNaturalWood }

procedure TXMLDeckAndPorchFlooringMaterialsNaturalWood.AfterConstruction;
begin
  RegisterChildNode('DeckAndPorchFlooringMaterials-NaturalWoodCharacteristics', TXMLSoftwoodLumberCharacteristicsClass);
  RegisterChildNode('Packaging', TXMLPackaging);
  inherited;
end;

function TXMLDeckAndPorchFlooringMaterialsNaturalWood.Get_DeckAndPorchFlooringMaterialsNaturalWoodCharacteristics: IXMLSoftwoodLumberCharacteristicsClass;
begin
  Result := ChildNodes['DeckAndPorchFlooringMaterials-NaturalWoodCharacteristics'] as IXMLSoftwoodLumberCharacteristicsClass;
end;

function TXMLDeckAndPorchFlooringMaterialsNaturalWood.Get_Packaging: IXMLPackaging;
begin
  Result := ChildNodes['Packaging'] as IXMLPackaging;
end;

{ TXMLCompositeAndVeneerWoodPanels }

procedure TXMLCompositeAndVeneerWoodPanels.AfterConstruction;
begin
  RegisterChildNode('SoftwoodPlywood', TXMLNAPlywoodOSBCharacteristicsClass);
  RegisterChildNode('WoodPanelProducts', TXMLWoodPanelProductsClass);
  RegisterChildNode('Packaging', TXMLPackaging);
  inherited;
end;

function TXMLCompositeAndVeneerWoodPanels.Get_SoftwoodPlywood: IXMLNAPlywoodOSBCharacteristicsClass;
begin
  Result := ChildNodes['SoftwoodPlywood'] as IXMLNAPlywoodOSBCharacteristicsClass;
end;

function TXMLCompositeAndVeneerWoodPanels.Get_WoodPanelProducts: IXMLWoodPanelProductsClass;
begin
  Result := ChildNodes['WoodPanelProducts'] as IXMLWoodPanelProductsClass;
end;

function TXMLCompositeAndVeneerWoodPanels.Get_Packaging: IXMLPackaging;
begin
  Result := ChildNodes['Packaging'] as IXMLPackaging;
end;

{ TXMLNAPlywoodOSBCharacteristicsClass }

procedure TXMLNAPlywoodOSBCharacteristicsClass.AfterConstruction;
begin
  RegisterChildNode('PlywoodOSBGrade', TXMLPlywoodOSBGradeClass);
  RegisterChildNode('Thickness', TXMLDimensionThicknessClass);
  RegisterChildNode('Width', TXMLDimensionConstructionClass);
  RegisterChildNode('Length', TXMLDimensionConstructionClass);
  RegisterChildNode('Surface', TXMLPlywoodOSBSurfaceClass);
  RegisterChildNode('Overlay', TXMLPlywoodOSBOverlayClass);
  RegisterChildNode('Edge', TXMLPlywoodOSBEdgeClass);
  RegisterChildNode('PressureTreatment', TXMLPressureTreatmentClass);
  RegisterChildNode('FireTreatment', TXMLFireTreatmentClass);
  RegisterChildNode('Supplemental', TXMLPlywoodOSBSupplementalClass);
  RegisterChildNode('GradeStamp', TXMLConstructionGradeStampClass);
  RegisterChildNode('ClassIdentifier', TXMLIdentifierS60);
  RegisterChildNode('LabelCharacteristics', TXMLLabelCharacteristics);
  RegisterChildNode('StencilCharacteristics', TXMLStencilCharacteristics);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FWidth := CreateCollection(TXMLDimensionConstructionClassList, IXMLDimensionConstructionClass, 'Width') as IXMLDimensionConstructionClassList;
  FLength := CreateCollection(TXMLDimensionConstructionClassList, IXMLDimensionConstructionClass, 'Length') as IXMLDimensionConstructionClassList;
  FPlywoodOSBSpecies := CreateCollection(TXMLPlywoodOSBSpeciesTypeList, IXMLNode, 'PlywoodOSBSpecies') as IXMLPlywoodOSBSpeciesTypeList;
  FOverlay := CreateCollection(TXMLPlywoodOSBOverlayClassList, IXMLPlywoodOSBOverlayClass, 'Overlay') as IXMLPlywoodOSBOverlayClassList;
  FSupplemental := CreateCollection(TXMLPlywoodOSBSupplementalClassList, IXMLPlywoodOSBSupplementalClass, 'Supplemental') as IXMLPlywoodOSBSupplementalClassList;
  FLabelCharacteristics := CreateCollection(TXMLLabelCharacteristicsList, IXMLLabelCharacteristics, 'LabelCharacteristics') as IXMLLabelCharacteristicsList;
  FStencilCharacteristics := CreateCollection(TXMLStencilCharacteristicsList, IXMLStencilCharacteristics, 'StencilCharacteristics') as IXMLStencilCharacteristicsList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_PlywoodOSBGrade: IXMLPlywoodOSBGradeClass;
begin
  Result := ChildNodes['PlywoodOSBGrade'] as IXMLPlywoodOSBGradeClass;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_Thickness: IXMLDimensionThicknessClass;
begin
  Result := ChildNodes['Thickness'] as IXMLDimensionThicknessClass;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_Width: IXMLDimensionConstructionClassList;
begin
  Result := FWidth;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_Length: IXMLDimensionConstructionClassList;
begin
  Result := FLength;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_PlywoodOSBSpecies: IXMLPlywoodOSBSpeciesTypeList;
begin
  Result := FPlywoodOSBSpecies;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_PlyNumber: LongWord;
begin
  Result := ChildNodes['PlyNumber'].NodeValue;
end;

procedure TXMLNAPlywoodOSBCharacteristicsClass.Set_PlyNumber(Value: LongWord);
begin
  ChildNodes['PlyNumber'].NodeValue := Value;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_Surface: IXMLPlywoodOSBSurfaceClass;
begin
  Result := ChildNodes['Surface'] as IXMLPlywoodOSBSurfaceClass;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_Overlay: IXMLPlywoodOSBOverlayClassList;
begin
  Result := FOverlay;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_GlueExposure: UnicodeString;
begin
  Result := ChildNodes['GlueExposure'].Text;
end;

procedure TXMLNAPlywoodOSBCharacteristicsClass.Set_GlueExposure(Value: UnicodeString);
begin
  ChildNodes['GlueExposure'].NodeValue := Value;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_Edge: IXMLPlywoodOSBEdgeClass;
begin
  Result := ChildNodes['Edge'] as IXMLPlywoodOSBEdgeClass;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_PressureTreatment: IXMLPressureTreatmentClass;
begin
  Result := ChildNodes['PressureTreatment'] as IXMLPressureTreatmentClass;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_FireTreatment: IXMLFireTreatmentClass;
begin
  Result := ChildNodes['FireTreatment'] as IXMLFireTreatmentClass;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_Supplemental: IXMLPlywoodOSBSupplementalClassList;
begin
  Result := FSupplemental;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_Brand: UnicodeString;
begin
  Result := ChildNodes['Brand'].Text;
end;

procedure TXMLNAPlywoodOSBCharacteristicsClass.Set_Brand(Value: UnicodeString);
begin
  ChildNodes['Brand'].NodeValue := Value;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_GradeAgency: UnicodeString;
begin
  Result := ChildNodes['GradeAgency'].Text;
end;

procedure TXMLNAPlywoodOSBCharacteristicsClass.Set_GradeAgency(Value: UnicodeString);
begin
  ChildNodes['GradeAgency'].NodeValue := Value;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_GradeStamp: IXMLConstructionGradeStampClass;
begin
  Result := ChildNodes['GradeStamp'] as IXMLConstructionGradeStampClass;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_ClassIdentifier: IXMLIdentifierS60;
begin
  Result := ChildNodes['ClassIdentifier'] as IXMLIdentifierS60;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_LabelCharacteristics: IXMLLabelCharacteristicsList;
begin
  Result := FLabelCharacteristics;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_StencilCharacteristics: IXMLStencilCharacteristicsList;
begin
  Result := FStencilCharacteristics;
end;

function TXMLNAPlywoodOSBCharacteristicsClass.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

{ TXMLPlywoodOSBGradeClass }

function TXMLPlywoodOSBGradeClass.Get_Face: UnicodeString;
begin
  Result := AttributeNodes['Face'].Text;
end;

procedure TXMLPlywoodOSBGradeClass.Set_Face(Value: UnicodeString);
begin
  SetAttribute('Face', Value);
end;

function TXMLPlywoodOSBGradeClass.Get_SpanRating: UnicodeString;
begin
  Result := ChildNodes['SpanRating'].Text;
end;

procedure TXMLPlywoodOSBGradeClass.Set_SpanRating(Value: UnicodeString);
begin
  ChildNodes['SpanRating'].NodeValue := Value;
end;

function TXMLPlywoodOSBGradeClass.Get_StrengthGroup: UnicodeString;
begin
  Result := ChildNodes['StrengthGroup'].Text;
end;

procedure TXMLPlywoodOSBGradeClass.Set_StrengthGroup(Value: UnicodeString);
begin
  ChildNodes['StrengthGroup'].NodeValue := Value;
end;

{ TXMLPlywoodOSBSurfaceClass }

procedure TXMLPlywoodOSBSurfaceClass.AfterConstruction;
begin
  ItemTag := 'AdditionalText';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLPlywoodOSBSurfaceClass.Get_SurfaceType: UnicodeString;
begin
  Result := AttributeNodes['SurfaceType'].Text;
end;

procedure TXMLPlywoodOSBSurfaceClass.Set_SurfaceType(Value: UnicodeString);
begin
  SetAttribute('SurfaceType', Value);
end;

function TXMLPlywoodOSBSurfaceClass.Get_AdditionalText(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLPlywoodOSBSurfaceClass.Add(const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := AdditionalText;
end;

function TXMLPlywoodOSBSurfaceClass.Insert(const Index: Integer; const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := AdditionalText;
end;

{ TXMLPlywoodOSBOverlayClass }

procedure TXMLPlywoodOSBOverlayClass.AfterConstruction;
begin
  ItemTag := 'AdditionalText';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLPlywoodOSBOverlayClass.Get_OverlaySide: UnicodeString;
begin
  Result := AttributeNodes['OverlaySide'].Text;
end;

procedure TXMLPlywoodOSBOverlayClass.Set_OverlaySide(Value: UnicodeString);
begin
  SetAttribute('OverlaySide', Value);
end;

function TXMLPlywoodOSBOverlayClass.Get_AdditionalText(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLPlywoodOSBOverlayClass.Add(const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := AdditionalText;
end;

function TXMLPlywoodOSBOverlayClass.Insert(const Index: Integer; const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := AdditionalText;
end;

{ TXMLPlywoodOSBOverlayClassList }

function TXMLPlywoodOSBOverlayClassList.Add: IXMLPlywoodOSBOverlayClass;
begin
  Result := AddItem(-1) as IXMLPlywoodOSBOverlayClass;
end;

function TXMLPlywoodOSBOverlayClassList.Insert(const Index: Integer): IXMLPlywoodOSBOverlayClass;
begin
  Result := AddItem(Index) as IXMLPlywoodOSBOverlayClass;
end;

function TXMLPlywoodOSBOverlayClassList.Get_Item(Index: Integer): IXMLPlywoodOSBOverlayClass;
begin
  Result := List[Index] as IXMLPlywoodOSBOverlayClass;
end;

{ TXMLPlywoodOSBEdgeClass }

procedure TXMLPlywoodOSBEdgeClass.AfterConstruction;
begin
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLPlywoodOSBEdgeClass.Get_EdgeType: UnicodeString;
begin
  Result := AttributeNodes['EdgeType'].Text;
end;

procedure TXMLPlywoodOSBEdgeClass.Set_EdgeType(Value: UnicodeString);
begin
  SetAttribute('EdgeType', Value);
end;

function TXMLPlywoodOSBEdgeClass.Get_EdgeLocation: UnicodeString;
begin
  Result := AttributeNodes['EdgeLocation'].Text;
end;

procedure TXMLPlywoodOSBEdgeClass.Set_EdgeLocation(Value: UnicodeString);
begin
  SetAttribute('EdgeLocation', Value);
end;

function TXMLPlywoodOSBEdgeClass.Get_EdgeMachiningProfile: UnicodeString;
begin
  Result := ChildNodes['EdgeMachiningProfile'].Text;
end;

procedure TXMLPlywoodOSBEdgeClass.Set_EdgeMachiningProfile(Value: UnicodeString);
begin
  ChildNodes['EdgeMachiningProfile'].NodeValue := Value;
end;

function TXMLPlywoodOSBEdgeClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLPlywoodOSBSupplementalClass }

procedure TXMLPlywoodOSBSupplementalClass.AfterConstruction;
begin
  ItemTag := 'AdditionalText';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLPlywoodOSBSupplementalClass.Get_SupplementalSpecification: UnicodeString;
begin
  Result := AttributeNodes['SupplementalSpecification'].Text;
end;

procedure TXMLPlywoodOSBSupplementalClass.Set_SupplementalSpecification(Value: UnicodeString);
begin
  SetAttribute('SupplementalSpecification', Value);
end;

function TXMLPlywoodOSBSupplementalClass.Get_AdditionalText(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLPlywoodOSBSupplementalClass.Add(const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := AdditionalText;
end;

function TXMLPlywoodOSBSupplementalClass.Insert(const Index: Integer; const AdditionalText: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := AdditionalText;
end;

{ TXMLPlywoodOSBSupplementalClassList }

function TXMLPlywoodOSBSupplementalClassList.Add: IXMLPlywoodOSBSupplementalClass;
begin
  Result := AddItem(-1) as IXMLPlywoodOSBSupplementalClass;
end;

function TXMLPlywoodOSBSupplementalClassList.Insert(const Index: Integer): IXMLPlywoodOSBSupplementalClass;
begin
  Result := AddItem(Index) as IXMLPlywoodOSBSupplementalClass;
end;

function TXMLPlywoodOSBSupplementalClassList.Get_Item(Index: Integer): IXMLPlywoodOSBSupplementalClass;
begin
  Result := List[Index] as IXMLPlywoodOSBSupplementalClass;
end;

{ TXMLWoodPanelProductsClass }

procedure TXMLWoodPanelProductsClass.AfterConstruction;
begin
  RegisterChildNode('WoodBasedPanelGrade', TXMLPlywoodOSBGradeClass);
  RegisterChildNode('WoodPanelSpecies', TXMLLumberSpeciesClass);
  RegisterChildNode('Thickness', TXMLDimensionThicknessClass);
  RegisterChildNode('Width', TXMLDimensionConstructionClass);
  RegisterChildNode('Length', TXMLDimensionConstructionClass);
  RegisterChildNode('PlywoodLayupStructure', TXMLPlywoodLayupStructureClass);
  RegisterChildNode('Edge', TXMLEdgeClass);
  RegisterChildNode('Side', TXMLPlywoodSideClass);
  RegisterChildNode('PressureTreatment', TXMLPressureTreatmentClass);
  RegisterChildNode('FireTreatment', TXMLFireTreatmentClass);
  RegisterChildNode('Supplemental', TXMLPlywoodOSBSupplementalClass);
  RegisterChildNode('GradeStamp', TXMLConstructionGradeStampClass);
  RegisterChildNode('ClassIdentifier', TXMLIdentifierS60);
  RegisterChildNode('LabelCharacteristics', TXMLLabelCharacteristics);
  RegisterChildNode('StencilCharacteristics', TXMLStencilCharacteristics);
  FWoodPanelSpecies := CreateCollection(TXMLLumberSpeciesClassList, IXMLLumberSpeciesClass, 'WoodPanelSpecies') as IXMLLumberSpeciesClassList;
  FThickness := CreateCollection(TXMLDimensionThicknessClassList, IXMLDimensionThicknessClass, 'Thickness') as IXMLDimensionThicknessClassList;
  FWidth := CreateCollection(TXMLDimensionConstructionClassList, IXMLDimensionConstructionClass, 'Width') as IXMLDimensionConstructionClassList;
  FLength := CreateCollection(TXMLDimensionConstructionClassList, IXMLDimensionConstructionClass, 'Length') as IXMLDimensionConstructionClassList;
  FEdge := CreateCollection(TXMLEdgeClassList, IXMLEdgeClass, 'Edge') as IXMLEdgeClassList;
  FSide := CreateCollection(TXMLPlywoodSideClassList, IXMLPlywoodSideClass, 'Side') as IXMLPlywoodSideClassList;
  FSupplemental := CreateCollection(TXMLPlywoodOSBSupplementalClassList, IXMLPlywoodOSBSupplementalClass, 'Supplemental') as IXMLPlywoodOSBSupplementalClassList;
  FLabelCharacteristics := CreateCollection(TXMLLabelCharacteristicsList, IXMLLabelCharacteristics, 'LabelCharacteristics') as IXMLLabelCharacteristicsList;
  FStencilCharacteristics := CreateCollection(TXMLStencilCharacteristicsList, IXMLStencilCharacteristics, 'StencilCharacteristics') as IXMLStencilCharacteristicsList;
  inherited;
end;

function TXMLWoodPanelProductsClass.Get_WoodBasedPanelGrade: IXMLPlywoodOSBGradeClass;
begin
  Result := ChildNodes['WoodBasedPanelGrade'] as IXMLPlywoodOSBGradeClass;
end;

function TXMLWoodPanelProductsClass.Get_WoodPanelSpecies: IXMLLumberSpeciesClassList;
begin
  Result := FWoodPanelSpecies;
end;

function TXMLWoodPanelProductsClass.Get_Thickness: IXMLDimensionThicknessClassList;
begin
  Result := FThickness;
end;

function TXMLWoodPanelProductsClass.Get_Width: IXMLDimensionConstructionClassList;
begin
  Result := FWidth;
end;

function TXMLWoodPanelProductsClass.Get_Length: IXMLDimensionConstructionClassList;
begin
  Result := FLength;
end;

function TXMLWoodPanelProductsClass.Get_PlywoodLayupStructure: IXMLPlywoodLayupStructureClass;
begin
  Result := ChildNodes['PlywoodLayupStructure'] as IXMLPlywoodLayupStructureClass;
end;

function TXMLWoodPanelProductsClass.Get_Edge: IXMLEdgeClassList;
begin
  Result := FEdge;
end;

function TXMLWoodPanelProductsClass.Get_Side: IXMLPlywoodSideClassList;
begin
  Result := FSide;
end;

function TXMLWoodPanelProductsClass.Get_PressureTreatment: IXMLPressureTreatmentClass;
begin
  Result := ChildNodes['PressureTreatment'] as IXMLPressureTreatmentClass;
end;

function TXMLWoodPanelProductsClass.Get_FireTreatment: IXMLFireTreatmentClass;
begin
  Result := ChildNodes['FireTreatment'] as IXMLFireTreatmentClass;
end;

function TXMLWoodPanelProductsClass.Get_Supplemental: IXMLPlywoodOSBSupplementalClassList;
begin
  Result := FSupplemental;
end;

function TXMLWoodPanelProductsClass.Get_Brand: UnicodeString;
begin
  Result := ChildNodes['Brand'].Text;
end;

procedure TXMLWoodPanelProductsClass.Set_Brand(Value: UnicodeString);
begin
  ChildNodes['Brand'].NodeValue := Value;
end;

function TXMLWoodPanelProductsClass.Get_GradeAgency: UnicodeString;
begin
  Result := ChildNodes['GradeAgency'].Text;
end;

procedure TXMLWoodPanelProductsClass.Set_GradeAgency(Value: UnicodeString);
begin
  ChildNodes['GradeAgency'].NodeValue := Value;
end;

function TXMLWoodPanelProductsClass.Get_GradeStamp: IXMLConstructionGradeStampClass;
begin
  Result := ChildNodes['GradeStamp'] as IXMLConstructionGradeStampClass;
end;

function TXMLWoodPanelProductsClass.Get_ClassIdentifier: IXMLIdentifierS60;
begin
  Result := ChildNodes['ClassIdentifier'] as IXMLIdentifierS60;
end;

function TXMLWoodPanelProductsClass.Get_LabelCharacteristics: IXMLLabelCharacteristicsList;
begin
  Result := FLabelCharacteristics;
end;

function TXMLWoodPanelProductsClass.Get_StencilCharacteristics: IXMLStencilCharacteristicsList;
begin
  Result := FStencilCharacteristics;
end;

{ TXMLPlywoodLayupStructureClass }

procedure TXMLPlywoodLayupStructureClass.AfterConstruction;
begin
  RegisterChildNode('PlywoodPlySet', TXMLPlywoodPlySetClass);
  RegisterChildNode('GlueExposure', TXMLWoodPanelGlueExposureClass);
  FGlueExposure := CreateCollection(TXMLWoodPanelGlueExposureClassList, IXMLWoodPanelGlueExposureClass, 'GlueExposure') as IXMLWoodPanelGlueExposureClassList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLPlywoodLayupStructureClass.Get_PlywoodPlySet: IXMLPlywoodPlySetClass;
begin
  Result := ChildNodes['PlywoodPlySet'] as IXMLPlywoodPlySetClass;
end;

function TXMLPlywoodLayupStructureClass.Get_GlueExposure: IXMLWoodPanelGlueExposureClassList;
begin
  Result := FGlueExposure;
end;

function TXMLPlywoodLayupStructureClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLPlywoodPlySetClass }

procedure TXMLPlywoodPlySetClass.AfterConstruction;
begin
  RegisterChildNode('PlywoodPlyCharacteristics', TXMLPlywoodPlyCharacteristicsClass);
  FPlywoodPlyCharacteristics := CreateCollection(TXMLPlywoodPlyCharacteristicsClassList, IXMLPlywoodPlyCharacteristicsClass, 'PlywoodPlyCharacteristics') as IXMLPlywoodPlyCharacteristicsClassList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLPlywoodPlySetClass.Get_NumberOfPlies: LongWord;
begin
  Result := ChildNodes['NumberOfPlies'].NodeValue;
end;

procedure TXMLPlywoodPlySetClass.Set_NumberOfPlies(Value: LongWord);
begin
  ChildNodes['NumberOfPlies'].NodeValue := Value;
end;

function TXMLPlywoodPlySetClass.Get_PlywoodPlyCharacteristics: IXMLPlywoodPlyCharacteristicsClassList;
begin
  Result := FPlywoodPlyCharacteristics;
end;

function TXMLPlywoodPlySetClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLPlywoodPlyCharacteristicsClass }

procedure TXMLPlywoodPlyCharacteristicsClass.AfterConstruction;
begin
  RegisterChildNode('WoodPanelChracteristics', TXMLWoodPanelCharacteristicsClass);
  inherited;
end;

function TXMLPlywoodPlyCharacteristicsClass.Get_PlyNumber: LongWord;
begin
  Result := ChildNodes['PlyNumber'].NodeValue;
end;

procedure TXMLPlywoodPlyCharacteristicsClass.Set_PlyNumber(Value: LongWord);
begin
  ChildNodes['PlyNumber'].NodeValue := Value;
end;

function TXMLPlywoodPlyCharacteristicsClass.Get_WoodPanelChracteristics: IXMLWoodPanelCharacteristicsClass;
begin
  Result := ChildNodes['WoodPanelChracteristics'] as IXMLWoodPanelCharacteristicsClass;
end;

{ TXMLPlywoodPlyCharacteristicsClassList }

function TXMLPlywoodPlyCharacteristicsClassList.Add: IXMLPlywoodPlyCharacteristicsClass;
begin
  Result := AddItem(-1) as IXMLPlywoodPlyCharacteristicsClass;
end;

function TXMLPlywoodPlyCharacteristicsClassList.Insert(const Index: Integer): IXMLPlywoodPlyCharacteristicsClass;
begin
  Result := AddItem(Index) as IXMLPlywoodPlyCharacteristicsClass;
end;

function TXMLPlywoodPlyCharacteristicsClassList.Get_Item(Index: Integer): IXMLPlywoodPlyCharacteristicsClass;
begin
  Result := List[Index] as IXMLPlywoodPlyCharacteristicsClass;
end;

{ TXMLWoodPanelCharacteristicsClass }

procedure TXMLWoodPanelCharacteristicsClass.AfterConstruction;
begin
  RegisterChildNode('WoodPanelSpecies', TXMLLumberSpeciesClass);
  RegisterChildNode('PlywoodPlyGrade', TXMLPlywoodPlyGrade);
  RegisterChildNode('Thickness', TXMLDimensionThicknessClass);
  RegisterChildNode('Width', TXMLDimensionConstructionClass);
  RegisterChildNode('Length', TXMLDimensionConstructionClass);
  FWoodPanelSpecies := CreateCollection(TXMLLumberSpeciesClassList, IXMLLumberSpeciesClass, 'WoodPanelSpecies') as IXMLLumberSpeciesClassList;
  FThickness := CreateCollection(TXMLDimensionThicknessClassList, IXMLDimensionThicknessClass, 'Thickness') as IXMLDimensionThicknessClassList;
  FWidth := CreateCollection(TXMLDimensionConstructionClassList, IXMLDimensionConstructionClass, 'Width') as IXMLDimensionConstructionClassList;
  FLength := CreateCollection(TXMLDimensionConstructionClassList, IXMLDimensionConstructionClass, 'Length') as IXMLDimensionConstructionClassList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLWoodPanelCharacteristicsClass.Get_OrientationWithFaceWoodPanelGrain: UnicodeString;
begin
  Result := AttributeNodes['OrientationWithFaceWoodPanelGrain'].Text;
end;

procedure TXMLWoodPanelCharacteristicsClass.Set_OrientationWithFaceWoodPanelGrain(Value: UnicodeString);
begin
  SetAttribute('OrientationWithFaceWoodPanelGrain', Value);
end;

function TXMLWoodPanelCharacteristicsClass.Get_WoodPanelSpecies: IXMLLumberSpeciesClassList;
begin
  Result := FWoodPanelSpecies;
end;

function TXMLWoodPanelCharacteristicsClass.Get_PlywoodPlyGrade: IXMLPlywoodPlyGrade;
begin
  Result := ChildNodes['PlywoodPlyGrade'] as IXMLPlywoodPlyGrade;
end;

function TXMLWoodPanelCharacteristicsClass.Get_WoodPanelManufacturingMethod: UnicodeString;
begin
  Result := ChildNodes['WoodPanelManufacturingMethod'].Text;
end;

procedure TXMLWoodPanelCharacteristicsClass.Set_WoodPanelManufacturingMethod(Value: UnicodeString);
begin
  ChildNodes['WoodPanelManufacturingMethod'].NodeValue := Value;
end;

function TXMLWoodPanelCharacteristicsClass.Get_Thickness: IXMLDimensionThicknessClassList;
begin
  Result := FThickness;
end;

function TXMLWoodPanelCharacteristicsClass.Get_Width: IXMLDimensionConstructionClassList;
begin
  Result := FWidth;
end;

function TXMLWoodPanelCharacteristicsClass.Get_Length: IXMLDimensionConstructionClassList;
begin
  Result := FLength;
end;

function TXMLWoodPanelCharacteristicsClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLPlywoodPlyGrade }

function TXMLPlywoodPlyGrade.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLPlywoodPlyGrade.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLWoodPanelGlueExposureClass }

procedure TXMLWoodPanelGlueExposureClass.AfterConstruction;
begin
  FGlueExposureID := CreateCollection(TXMLGlueExposureIDTypeList, IXMLNode, 'GlueExposureID') as IXMLGlueExposureIDTypeList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLWoodPanelGlueExposureClass.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLWoodPanelGlueExposureClass.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

function TXMLWoodPanelGlueExposureClass.Get_GlueExposureID: IXMLGlueExposureIDTypeList;
begin
  Result := FGlueExposureID;
end;

function TXMLWoodPanelGlueExposureClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLWoodPanelGlueExposureClassList }

function TXMLWoodPanelGlueExposureClassList.Add: IXMLWoodPanelGlueExposureClass;
begin
  Result := AddItem(-1) as IXMLWoodPanelGlueExposureClass;
end;

function TXMLWoodPanelGlueExposureClassList.Insert(const Index: Integer): IXMLWoodPanelGlueExposureClass;
begin
  Result := AddItem(Index) as IXMLWoodPanelGlueExposureClass;
end;

function TXMLWoodPanelGlueExposureClassList.Get_Item(Index: Integer): IXMLWoodPanelGlueExposureClass;
begin
  Result := List[Index] as IXMLWoodPanelGlueExposureClass;
end;

{ TXMLEdgeClass }

procedure TXMLEdgeClass.AfterConstruction;
begin
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLEdgeClass.Get_EdgeType: UnicodeString;
begin
  Result := AttributeNodes['EdgeType'].Text;
end;

procedure TXMLEdgeClass.Set_EdgeType(Value: UnicodeString);
begin
  SetAttribute('EdgeType', Value);
end;

function TXMLEdgeClass.Get_EdgeLocation: UnicodeString;
begin
  Result := AttributeNodes['EdgeLocation'].Text;
end;

procedure TXMLEdgeClass.Set_EdgeLocation(Value: UnicodeString);
begin
  SetAttribute('EdgeLocation', Value);
end;

function TXMLEdgeClass.Get_EdgeMachiningProfile: UnicodeString;
begin
  Result := ChildNodes['EdgeMachiningProfile'].Text;
end;

procedure TXMLEdgeClass.Set_EdgeMachiningProfile(Value: UnicodeString);
begin
  ChildNodes['EdgeMachiningProfile'].NodeValue := Value;
end;

function TXMLEdgeClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLEdgeClassList }

function TXMLEdgeClassList.Add: IXMLEdgeClass;
begin
  Result := AddItem(-1) as IXMLEdgeClass;
end;

function TXMLEdgeClassList.Insert(const Index: Integer): IXMLEdgeClass;
begin
  Result := AddItem(Index) as IXMLEdgeClass;
end;

function TXMLEdgeClassList.Get_Item(Index: Integer): IXMLEdgeClass;
begin
  Result := List[Index] as IXMLEdgeClass;
end;

{ TXMLPlywoodSideClass }

procedure TXMLPlywoodSideClass.AfterConstruction;
begin
  RegisterChildNode('Surface', TXMLPlywoodOSBSurfaceClass);
  RegisterChildNode('PlywoodPlyGrade', TXMLPlywoodPlyGrade);
  RegisterChildNode('Embossing', TXMLEmbossing);
  RegisterChildNode('PlywoodMachining', TXMLPlywoodMachining);
  inherited;
end;

function TXMLPlywoodSideClass.Get_TopSide: UnicodeString;
begin
  Result := AttributeNodes['TopSide'].Text;
end;

procedure TXMLPlywoodSideClass.Set_TopSide(Value: UnicodeString);
begin
  SetAttribute('TopSide', Value);
end;

function TXMLPlywoodSideClass.Get_Surface: IXMLPlywoodOSBSurfaceClass;
begin
  Result := ChildNodes['Surface'] as IXMLPlywoodOSBSurfaceClass;
end;

function TXMLPlywoodSideClass.Get_PlywoodPlyGrade: IXMLPlywoodPlyGrade;
begin
  Result := ChildNodes['PlywoodPlyGrade'] as IXMLPlywoodPlyGrade;
end;

function TXMLPlywoodSideClass.Get_Embossing: IXMLEmbossing;
begin
  Result := ChildNodes['Embossing'] as IXMLEmbossing;
end;

function TXMLPlywoodSideClass.Get_PlywoodMachining: IXMLPlywoodMachining;
begin
  Result := ChildNodes['PlywoodMachining'] as IXMLPlywoodMachining;
end;

{ TXMLPlywoodSideClassList }

function TXMLPlywoodSideClassList.Add: IXMLPlywoodSideClass;
begin
  Result := AddItem(-1) as IXMLPlywoodSideClass;
end;

function TXMLPlywoodSideClassList.Insert(const Index: Integer): IXMLPlywoodSideClass;
begin
  Result := AddItem(Index) as IXMLPlywoodSideClass;
end;

function TXMLPlywoodSideClassList.Get_Item(Index: Integer): IXMLPlywoodSideClass;
begin
  Result := List[Index] as IXMLPlywoodSideClass;
end;

{ TXMLPlywoodMachining }

function TXMLPlywoodMachining.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLPlywoodMachining.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLConstructionPackagesAndPreFabPanels }

procedure TXMLConstructionPackagesAndPreFabPanels.AfterConstruction;
begin
  RegisterChildNode('Floor', TXMLFloor);
  RegisterChildNode('Wall', TXMLWall);
  RegisterChildNode('Roof', TXMLRoof);
  RegisterChildNode('Packaging', TXMLPackaging);
  inherited;
end;

function TXMLConstructionPackagesAndPreFabPanels.Get_Floor: IXMLFloor;
begin
  Result := ChildNodes['Floor'] as IXMLFloor;
end;

function TXMLConstructionPackagesAndPreFabPanels.Get_Wall: IXMLWall;
begin
  Result := ChildNodes['Wall'] as IXMLWall;
end;

function TXMLConstructionPackagesAndPreFabPanels.Get_Roof: IXMLRoof;
begin
  Result := ChildNodes['Roof'] as IXMLRoof;
end;

function TXMLConstructionPackagesAndPreFabPanels.Get_Packaging: IXMLPackaging;
begin
  Result := ChildNodes['Packaging'] as IXMLPackaging;
end;

{ TXMLFloor }

function TXMLFloor.Get_FloorPanel: UnicodeString;
begin
  Result := ChildNodes['FloorPanel'].Text;
end;

procedure TXMLFloor.Set_FloorPanel(Value: UnicodeString);
begin
  ChildNodes['FloorPanel'].NodeValue := Value;
end;

function TXMLFloor.Get_FloorPackage: UnicodeString;
begin
  Result := ChildNodes['FloorPackage'].Text;
end;

procedure TXMLFloor.Set_FloorPackage(Value: UnicodeString);
begin
  ChildNodes['FloorPackage'].NodeValue := Value;
end;

function TXMLFloor.Get_FloorTruss: UnicodeString;
begin
  Result := ChildNodes['FloorTruss'].Text;
end;

procedure TXMLFloor.Set_FloorTruss(Value: UnicodeString);
begin
  ChildNodes['FloorTruss'].NodeValue := Value;
end;

{ TXMLWall }

function TXMLWall.Get_WallPanel: UnicodeString;
begin
  Result := ChildNodes['WallPanel'].Text;
end;

procedure TXMLWall.Set_WallPanel(Value: UnicodeString);
begin
  ChildNodes['WallPanel'].NodeValue := Value;
end;

function TXMLWall.Get_WallPackage: UnicodeString;
begin
  Result := ChildNodes['WallPackage'].Text;
end;

procedure TXMLWall.Set_WallPackage(Value: UnicodeString);
begin
  ChildNodes['WallPackage'].NodeValue := Value;
end;

{ TXMLRoof }

function TXMLRoof.Get_RoofPanel: UnicodeString;
begin
  Result := ChildNodes['RoofPanel'].Text;
end;

procedure TXMLRoof.Set_RoofPanel(Value: UnicodeString);
begin
  ChildNodes['RoofPanel'].NodeValue := Value;
end;

function TXMLRoof.Get_RoofPackage: UnicodeString;
begin
  Result := ChildNodes['RoofPackage'].Text;
end;

procedure TXMLRoof.Set_RoofPackage(Value: UnicodeString);
begin
  ChildNodes['RoofPackage'].NodeValue := Value;
end;

function TXMLRoof.Get_RoofTruss: UnicodeString;
begin
  Result := ChildNodes['RoofTruss'].Text;
end;

procedure TXMLRoof.Set_RoofTruss(Value: UnicodeString);
begin
  ChildNodes['RoofTruss'].NodeValue := Value;
end;

{ TXMLOtherProducts }

procedure TXMLOtherProducts.AfterConstruction;
begin
  RegisterChildNode('OtherProductsItemCodeInfo', TXMLCodeInfo);
  RegisterChildNode('OtherProductsClass', TXMLOtherProductsClass);
  RegisterChildNode('OtherProductsCharacteristics', TXMLOtherProductsCharacteristics);
  RegisterChildNode('OtherProductsPackagingCharacteristics', TXMLOtherProductsPackagingCharacteristics);
  RegisterChildNode('OtherProductsProcessingCharacteristics', TXMLOtherProductsProcessingCharacteristics);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FOtherProductsClass := CreateCollection(TXMLOtherProductsClassList, IXMLOtherProductsClass, 'OtherProductsClass') as IXMLOtherProductsClassList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLOtherProducts.Get_OtherProductsType: UnicodeString;
begin
  Result := AttributeNodes['OtherProductsType'].Text;
end;

procedure TXMLOtherProducts.Set_OtherProductsType(Value: UnicodeString);
begin
  SetAttribute('OtherProductsType', Value);
end;

function TXMLOtherProducts.Get_OtherProductsItemType: UnicodeString;
begin
  Result := AttributeNodes['OtherProductsItemType'].Text;
end;

procedure TXMLOtherProducts.Set_OtherProductsItemType(Value: UnicodeString);
begin
  SetAttribute('OtherProductsItemType', Value);
end;

function TXMLOtherProducts.Get_OtherProductsItemCodeInfo: IXMLCodeInfo;
begin
  Result := ChildNodes['OtherProductsItemCodeInfo'] as IXMLCodeInfo;
end;

function TXMLOtherProducts.Get_OtherProductsClass: IXMLOtherProductsClassList;
begin
  Result := FOtherProductsClass;
end;

function TXMLOtherProducts.Get_OtherProductsCharacteristics: IXMLOtherProductsCharacteristics;
begin
  Result := ChildNodes['OtherProductsCharacteristics'] as IXMLOtherProductsCharacteristics;
end;

function TXMLOtherProducts.Get_OtherProductsPackagingCharacteristics: IXMLOtherProductsPackagingCharacteristics;
begin
  Result := ChildNodes['OtherProductsPackagingCharacteristics'] as IXMLOtherProductsPackagingCharacteristics;
end;

function TXMLOtherProducts.Get_OtherProductsProcessingCharacteristics: IXMLOtherProductsProcessingCharacteristics;
begin
  Result := ChildNodes['OtherProductsProcessingCharacteristics'] as IXMLOtherProductsProcessingCharacteristics;
end;

function TXMLOtherProducts.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

{ TXMLOtherProductsClass }

procedure TXMLOtherProductsClass.AfterConstruction;
begin
  RegisterChildNode('ClassCodeInfo', TXMLCodeInfo);
  inherited;
end;

function TXMLOtherProductsClass.Get_OtherProductsClassType: UnicodeString;
begin
  Result := AttributeNodes['OtherProductsClassType'].Text;
end;

procedure TXMLOtherProductsClass.Set_OtherProductsClassType(Value: UnicodeString);
begin
  SetAttribute('OtherProductsClassType', Value);
end;

function TXMLOtherProductsClass.Get_ClassCodeInfo: IXMLCodeInfo;
begin
  Result := ChildNodes['ClassCodeInfo'] as IXMLCodeInfo;
end;

{ TXMLOtherProductsClassList }

function TXMLOtherProductsClassList.Add: IXMLOtherProductsClass;
begin
  Result := AddItem(-1) as IXMLOtherProductsClass;
end;

function TXMLOtherProductsClassList.Insert(const Index: Integer): IXMLOtherProductsClass;
begin
  Result := AddItem(Index) as IXMLOtherProductsClass;
end;

function TXMLOtherProductsClassList.Get_Item(Index: Integer): IXMLOtherProductsClass;
begin
  Result := List[Index] as IXMLOtherProductsClass;
end;

{ TXMLOtherProductsCharacteristics }

procedure TXMLOtherProductsCharacteristics.AfterConstruction;
begin
  RegisterChildNode('PropertyValue', TXMLPropertyValue);
  ItemTag := 'PropertyValue';
  ItemInterface := IXMLPropertyValue;
  inherited;
end;

function TXMLOtherProductsCharacteristics.Get_PropertyValue(Index: Integer): IXMLPropertyValue;
begin
  Result := List[Index] as IXMLPropertyValue;
end;

function TXMLOtherProductsCharacteristics.Add: IXMLPropertyValue;
begin
  Result := AddItem(-1) as IXMLPropertyValue;
end;

function TXMLOtherProductsCharacteristics.Insert(const Index: Integer): IXMLPropertyValue;
begin
  Result := AddItem(Index) as IXMLPropertyValue;
end;

{ TXMLOtherProductsPackagingCharacteristics }

procedure TXMLOtherProductsPackagingCharacteristics.AfterConstruction;
begin
  RegisterChildNode('PackagingCodeInfo', TXMLCodeInfo);
  ItemTag := 'PackagingCodeInfo';
  ItemInterface := IXMLCodeInfo;
  inherited;
end;

function TXMLOtherProductsPackagingCharacteristics.Get_PackagingCodeInfo(Index: Integer): IXMLCodeInfo;
begin
  Result := List[Index] as IXMLCodeInfo;
end;

function TXMLOtherProductsPackagingCharacteristics.Add: IXMLCodeInfo;
begin
  Result := AddItem(-1) as IXMLCodeInfo;
end;

function TXMLOtherProductsPackagingCharacteristics.Insert(const Index: Integer): IXMLCodeInfo;
begin
  Result := AddItem(Index) as IXMLCodeInfo;
end;

{ TXMLOtherProductsProcessingCharacteristics }

procedure TXMLOtherProductsProcessingCharacteristics.AfterConstruction;
begin
  RegisterChildNode('ProcessingCodeInfo', TXMLCodeInfo);
  ItemTag := 'ProcessingCodeInfo';
  ItemInterface := IXMLCodeInfo;
  inherited;
end;

function TXMLOtherProductsProcessingCharacteristics.Get_ProcessingCodeInfo(Index: Integer): IXMLCodeInfo;
begin
  Result := List[Index] as IXMLCodeInfo;
end;

function TXMLOtherProductsProcessingCharacteristics.Add: IXMLCodeInfo;
begin
  Result := AddItem(-1) as IXMLCodeInfo;
end;

function TXMLOtherProductsProcessingCharacteristics.Insert(const Index: Integer): IXMLCodeInfo;
begin
  Result := AddItem(Index) as IXMLCodeInfo;
end;

{ TXMLInvoiceLineBaseAmountInformation }

procedure TXMLInvoiceLineBaseAmountInformation.AfterConstruction;
begin
  RegisterChildNode('PriceDetails', TXMLPriceDetails);
  RegisterChildNode('InvoiceLineBaseAmount', TXMLInvoiceLineBaseAmount);
  inherited;
end;

function TXMLInvoiceLineBaseAmountInformation.Get_PriceDetails: IXMLPriceDetails;
begin
  Result := ChildNodes['PriceDetails'] as IXMLPriceDetails;
end;

function TXMLInvoiceLineBaseAmountInformation.Get_InvoiceLineBaseAmount: IXMLInvoiceLineBaseAmount;
begin
  Result := ChildNodes['InvoiceLineBaseAmount'] as IXMLInvoiceLineBaseAmount;
end;

{ TXMLPriceDetails }

procedure TXMLPriceDetails.AfterConstruction;
begin
  RegisterChildNode('PricePerUnit', TXMLPricePerUnit);
  RegisterChildNode('InformationalPricePerUnit', TXMLInformationalPricePerUnit);
  RegisterChildNode('ExchangeRate', TXMLExchangeRate);
  RegisterChildNode('MonetaryAdjustment', TXMLMonetaryAdjustment);
  RegisterChildNode('GeneralLedgerAccount', TXMLGeneralLedgerAccount);
  RegisterChildNode('PriceSpecification', TXMLPriceSpecification);
  FInformationalPricePerUnit := CreateCollection(TXMLInformationalPricePerUnitList, IXMLInformationalPricePerUnit, 'InformationalPricePerUnit') as IXMLInformationalPricePerUnitList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  FMonetaryAdjustment := CreateCollection(TXMLMonetaryAdjustmentList, IXMLMonetaryAdjustment, 'MonetaryAdjustment') as IXMLMonetaryAdjustmentList;
  FPriceSpecification := CreateCollection(TXMLPriceSpecificationList, IXMLPriceSpecification, 'PriceSpecification') as IXMLPriceSpecificationList;
  inherited;
end;

function TXMLPriceDetails.Get_PriceQuantityBasis: UnicodeString;
begin
  Result := AttributeNodes['PriceQuantityBasis'].Text;
end;

procedure TXMLPriceDetails.Set_PriceQuantityBasis(Value: UnicodeString);
begin
  SetAttribute('PriceQuantityBasis', Value);
end;

function TXMLPriceDetails.Get_PriceTaxBasis: UnicodeString;
begin
  Result := AttributeNodes['PriceTaxBasis'].Text;
end;

procedure TXMLPriceDetails.Set_PriceTaxBasis(Value: UnicodeString);
begin
  SetAttribute('PriceTaxBasis', Value);
end;

function TXMLPriceDetails.Get_PricePerUnit: IXMLPricePerUnit;
begin
  Result := ChildNodes['PricePerUnit'] as IXMLPricePerUnit;
end;

function TXMLPriceDetails.Get_InformationalPricePerUnit: IXMLInformationalPricePerUnitList;
begin
  Result := FInformationalPricePerUnit;
end;

function TXMLPriceDetails.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLPriceDetails.Get_ExchangeRate: IXMLExchangeRate;
begin
  Result := ChildNodes['ExchangeRate'] as IXMLExchangeRate;
end;

function TXMLPriceDetails.Get_MonetaryAdjustment: IXMLMonetaryAdjustmentList;
begin
  Result := FMonetaryAdjustment;
end;

function TXMLPriceDetails.Get_GeneralLedgerAccount: IXMLGeneralLedgerAccount;
begin
  Result := ChildNodes['GeneralLedgerAccount'] as IXMLGeneralLedgerAccount;
end;

function TXMLPriceDetails.Get_PriceSpecification: IXMLPriceSpecificationList;
begin
  Result := FPriceSpecification;
end;

{ TXMLPricePerUnit }

procedure TXMLPricePerUnit.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  RegisterChildNode('Value', TXMLValue);
  RegisterChildNode('RangeMin', TXMLRangeMin);
  RegisterChildNode('RangeMax', TXMLRangeMax);
  inherited;
end;

function TXMLPricePerUnit.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

function TXMLPricePerUnit.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

function TXMLPricePerUnit.Get_RangeMin: IXMLRangeMin;
begin
  Result := ChildNodes['RangeMin'] as IXMLRangeMin;
end;

function TXMLPricePerUnit.Get_RangeMax: IXMLRangeMax;
begin
  Result := ChildNodes['RangeMax'] as IXMLRangeMax;
end;

{ TXMLCurrencyValue }

function TXMLCurrencyValue.Get_CurrencyType: UnicodeString;
begin
  Result := AttributeNodes['CurrencyType'].Text;
end;

procedure TXMLCurrencyValue.Set_CurrencyType(Value: UnicodeString);
begin
  SetAttribute('CurrencyType', Value);
end;

{ TXMLInformationalPricePerUnit }

procedure TXMLInformationalPricePerUnit.AfterConstruction;
begin
  RegisterChildNode('Country', TXMLCountry);
  inherited;
end;

function TXMLInformationalPricePerUnit.Get_InformationalPricePerUnitType: UnicodeString;
begin
  Result := AttributeNodes['InformationalPricePerUnitType'].Text;
end;

procedure TXMLInformationalPricePerUnit.Set_InformationalPricePerUnitType(Value: UnicodeString);
begin
  SetAttribute('InformationalPricePerUnitType', Value);
end;

function TXMLInformationalPricePerUnit.Get_Country: IXMLCountry;
begin
  Result := ChildNodes['Country'] as IXMLCountry;
end;

{ TXMLInformationalPricePerUnitList }

function TXMLInformationalPricePerUnitList.Add: IXMLInformationalPricePerUnit;
begin
  Result := AddItem(-1) as IXMLInformationalPricePerUnit;
end;

function TXMLInformationalPricePerUnitList.Insert(const Index: Integer): IXMLInformationalPricePerUnit;
begin
  Result := AddItem(Index) as IXMLInformationalPricePerUnit;
end;

function TXMLInformationalPricePerUnitList.Get_Item(Index: Integer): IXMLInformationalPricePerUnit;
begin
  Result := List[Index] as IXMLInformationalPricePerUnit;
end;

{ TXMLExchangeRate }

procedure TXMLExchangeRate.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  RegisterChildNode('MinCurrencyValue', TXMLMinCurrencyValue);
  RegisterChildNode('MaxCurrencyValue', TXMLMaxCurrencyValue);
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLExchangeRate.Get_ExchangeRateType: UnicodeString;
begin
  Result := AttributeNodes['ExchangeRateType'].Text;
end;

procedure TXMLExchangeRate.Set_ExchangeRateType(Value: UnicodeString);
begin
  SetAttribute('ExchangeRateType', Value);
end;

function TXMLExchangeRate.Get_CurrencyFromType: UnicodeString;
begin
  Result := AttributeNodes['CurrencyFromType'].Text;
end;

procedure TXMLExchangeRate.Set_CurrencyFromType(Value: UnicodeString);
begin
  SetAttribute('CurrencyFromType', Value);
end;

function TXMLExchangeRate.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

function TXMLExchangeRate.Get_MinCurrencyValue: IXMLMinCurrencyValue;
begin
  Result := ChildNodes['MinCurrencyValue'] as IXMLMinCurrencyValue;
end;

function TXMLExchangeRate.Get_MaxCurrencyValue: IXMLMaxCurrencyValue;
begin
  Result := ChildNodes['MaxCurrencyValue'] as IXMLMaxCurrencyValue;
end;

function TXMLExchangeRate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

{ TXMLMinCurrencyValue }

function TXMLMinCurrencyValue.Get_CurrencyType: UnicodeString;
begin
  Result := AttributeNodes['CurrencyType'].Text;
end;

procedure TXMLMinCurrencyValue.Set_CurrencyType(Value: UnicodeString);
begin
  SetAttribute('CurrencyType', Value);
end;

{ TXMLMaxCurrencyValue }

function TXMLMaxCurrencyValue.Get_CurrencyType: UnicodeString;
begin
  Result := AttributeNodes['CurrencyType'].Text;
end;

procedure TXMLMaxCurrencyValue.Set_CurrencyType(Value: UnicodeString);
begin
  SetAttribute('CurrencyType', Value);
end;

{ TXMLMonetaryAdjustment }

procedure TXMLMonetaryAdjustment.AfterConstruction;
begin
  RegisterChildNode('MonetaryAdjustmentComponent', TXMLCodeInfo);
  RegisterChildNode('MonetaryAdjustmentStartAmount', TXMLMonetaryAdjustmentStartAmount);
  RegisterChildNode('MonetaryAdjustmentStartQuantity', TXMLMonetaryAdjustmentStartQuantity);
  RegisterChildNode('PriceAdjustment', TXMLPriceAdjustment);
  RegisterChildNode('FlatAmountAdjustment', TXMLFlatAmountAdjustment);
  RegisterChildNode('TaxAdjustment', TXMLTaxAdjustment);
  RegisterChildNode('InformationalAmount', TXMLInformationalAmount);
  RegisterChildNode('GeneralLedgerAccount', TXMLGeneralLedgerAccount);
  RegisterChildNode('MonetaryAdjustmentAmount', TXMLMonetaryAdjustmentAmount);
  RegisterChildNode('MonetaryAdjustmentReference', TXMLMonetaryAdjustmentReference);
  FMonetaryAdjustmentComponent := CreateCollection(TXMLCodeInfoList, IXMLCodeInfo, 'MonetaryAdjustmentComponent') as IXMLCodeInfoList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  FMonetaryAdjustmentReference := CreateCollection(TXMLMonetaryAdjustmentReferenceList, IXMLMonetaryAdjustmentReference, 'MonetaryAdjustmentReference') as IXMLMonetaryAdjustmentReferenceList;
  inherited;
end;

function TXMLMonetaryAdjustment.Get_AdjustmentType: UnicodeString;
begin
  Result := AttributeNodes['AdjustmentType'].Text;
end;

procedure TXMLMonetaryAdjustment.Set_AdjustmentType(Value: UnicodeString);
begin
  SetAttribute('AdjustmentType', Value);
end;

function TXMLMonetaryAdjustment.Get_MonetaryAdjustmentLine: LongWord;
begin
  Result := ChildNodes['MonetaryAdjustmentLine'].NodeValue;
end;

procedure TXMLMonetaryAdjustment.Set_MonetaryAdjustmentLine(Value: LongWord);
begin
  ChildNodes['MonetaryAdjustmentLine'].NodeValue := Value;
end;

function TXMLMonetaryAdjustment.Get_MonetaryAdjustmentComponent: IXMLCodeInfoList;
begin
  Result := FMonetaryAdjustmentComponent;
end;

function TXMLMonetaryAdjustment.Get_MonetaryAdjustmentStartAmount: IXMLMonetaryAdjustmentStartAmount;
begin
  Result := ChildNodes['MonetaryAdjustmentStartAmount'] as IXMLMonetaryAdjustmentStartAmount;
end;

function TXMLMonetaryAdjustment.Get_MonetaryAdjustmentStartQuantity: IXMLMonetaryAdjustmentStartQuantity;
begin
  Result := ChildNodes['MonetaryAdjustmentStartQuantity'] as IXMLMonetaryAdjustmentStartQuantity;
end;

function TXMLMonetaryAdjustment.Get_PriceAdjustment: IXMLPriceAdjustment;
begin
  Result := ChildNodes['PriceAdjustment'] as IXMLPriceAdjustment;
end;

function TXMLMonetaryAdjustment.Get_FlatAmountAdjustment: IXMLFlatAmountAdjustment;
begin
  Result := ChildNodes['FlatAmountAdjustment'] as IXMLFlatAmountAdjustment;
end;

function TXMLMonetaryAdjustment.Get_TaxAdjustment: IXMLTaxAdjustment;
begin
  Result := ChildNodes['TaxAdjustment'] as IXMLTaxAdjustment;
end;

function TXMLMonetaryAdjustment.Get_InformationalAmount: IXMLInformationalAmount;
begin
  Result := ChildNodes['InformationalAmount'] as IXMLInformationalAmount;
end;

function TXMLMonetaryAdjustment.Get_MonetaryAdjustmentReferenceLine: LongWord;
begin
  Result := ChildNodes['MonetaryAdjustmentReferenceLine'].NodeValue;
end;

procedure TXMLMonetaryAdjustment.Set_MonetaryAdjustmentReferenceLine(Value: LongWord);
begin
  ChildNodes['MonetaryAdjustmentReferenceLine'].NodeValue := Value;
end;

function TXMLMonetaryAdjustment.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLMonetaryAdjustment.Get_GeneralLedgerAccount: IXMLGeneralLedgerAccount;
begin
  Result := ChildNodes['GeneralLedgerAccount'] as IXMLGeneralLedgerAccount;
end;

function TXMLMonetaryAdjustment.Get_MonetaryAdjustmentAmount: IXMLMonetaryAdjustmentAmount;
begin
  Result := ChildNodes['MonetaryAdjustmentAmount'] as IXMLMonetaryAdjustmentAmount;
end;

function TXMLMonetaryAdjustment.Get_AdjustmentTypeReason: UnicodeString;
begin
  Result := ChildNodes['AdjustmentTypeReason'].Text;
end;

procedure TXMLMonetaryAdjustment.Set_AdjustmentTypeReason(Value: UnicodeString);
begin
  ChildNodes['AdjustmentTypeReason'].NodeValue := Value;
end;

function TXMLMonetaryAdjustment.Get_MonetaryAdjustmentReference: IXMLMonetaryAdjustmentReferenceList;
begin
  Result := FMonetaryAdjustmentReference;
end;

{ TXMLMonetaryAdjustmentList }

function TXMLMonetaryAdjustmentList.Add: IXMLMonetaryAdjustment;
begin
  Result := AddItem(-1) as IXMLMonetaryAdjustment;
end;

function TXMLMonetaryAdjustmentList.Insert(const Index: Integer): IXMLMonetaryAdjustment;
begin
  Result := AddItem(Index) as IXMLMonetaryAdjustment;
end;

function TXMLMonetaryAdjustmentList.Get_Item(Index: Integer): IXMLMonetaryAdjustment;
begin
  Result := List[Index] as IXMLMonetaryAdjustment;
end;

{ TXMLMonetaryAdjustmentStartAmount }

procedure TXMLMonetaryAdjustmentStartAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLMonetaryAdjustmentStartAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLMonetaryAdjustmentStartQuantity }

function TXMLMonetaryAdjustmentStartQuantity.Get_QuantityType: UnicodeString;
begin
  Result := AttributeNodes['QuantityType'].Text;
end;

procedure TXMLMonetaryAdjustmentStartQuantity.Set_QuantityType(Value: UnicodeString);
begin
  SetAttribute('QuantityType', Value);
end;

function TXMLMonetaryAdjustmentStartQuantity.Get_QuantityTypeContext: UnicodeString;
begin
  Result := AttributeNodes['QuantityTypeContext'].Text;
end;

procedure TXMLMonetaryAdjustmentStartQuantity.Set_QuantityTypeContext(Value: UnicodeString);
begin
  SetAttribute('QuantityTypeContext', Value);
end;

function TXMLMonetaryAdjustmentStartQuantity.Get_AdjustmentType: UnicodeString;
begin
  Result := AttributeNodes['AdjustmentType'].Text;
end;

procedure TXMLMonetaryAdjustmentStartQuantity.Set_AdjustmentType(Value: UnicodeString);
begin
  SetAttribute('AdjustmentType', Value);
end;

function TXMLMonetaryAdjustmentStartQuantity.Get_MeasuringMethodType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethodType'].Text;
end;

procedure TXMLMonetaryAdjustmentStartQuantity.Set_MeasuringMethodType(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethodType', Value);
end;

function TXMLMonetaryAdjustmentStartQuantity.Get_MeasuringAgency: UnicodeString;
begin
  Result := AttributeNodes['MeasuringAgency'].Text;
end;

procedure TXMLMonetaryAdjustmentStartQuantity.Set_MeasuringAgency(Value: UnicodeString);
begin
  SetAttribute('MeasuringAgency', Value);
end;

function TXMLMonetaryAdjustmentStartQuantity.Get_MeasuringMethod: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethod'].Text;
end;

procedure TXMLMonetaryAdjustmentStartQuantity.Set_MeasuringMethod(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethod', Value);
end;

{ TXMLPriceAdjustment }

procedure TXMLPriceAdjustment.AfterConstruction;
begin
  RegisterChildNode('AdjustmentPercentage', TXMLMeasurement);
  RegisterChildNode('AdjustmentValue', TXMLPricePerUnit);
  inherited;
end;

function TXMLPriceAdjustment.Get_AdjustmentPercentage: IXMLMeasurement;
begin
  Result := ChildNodes['AdjustmentPercentage'] as IXMLMeasurement;
end;

function TXMLPriceAdjustment.Get_AdjustmentValue: IXMLPricePerUnit;
begin
  Result := ChildNodes['AdjustmentValue'] as IXMLPricePerUnit;
end;

{ TXMLFlatAmountAdjustment }

procedure TXMLFlatAmountAdjustment.AfterConstruction;
begin
  RegisterChildNode('AdjustmentPercentage', TXMLMeasurement);
  RegisterChildNode('AdjustmentFixedAmount', TXMLAdjustmentFixedAmount);
  inherited;
end;

function TXMLFlatAmountAdjustment.Get_AdjustmentPercentage: IXMLMeasurement;
begin
  Result := ChildNodes['AdjustmentPercentage'] as IXMLMeasurement;
end;

function TXMLFlatAmountAdjustment.Get_AdjustmentFixedAmount: IXMLAdjustmentFixedAmount;
begin
  Result := ChildNodes['AdjustmentFixedAmount'] as IXMLAdjustmentFixedAmount;
end;

{ TXMLAdjustmentFixedAmount }

procedure TXMLAdjustmentFixedAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLAdjustmentFixedAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTaxAdjustment }

procedure TXMLTaxAdjustment.AfterConstruction;
begin
  RegisterChildNode('TaxAmount', TXMLTaxAmount);
  RegisterChildNode('InformationalAmount', TXMLInformationalAmount);
  FInformationalAmount := CreateCollection(TXMLInformationalAmountList, IXMLInformationalAmount, 'InformationalAmount') as IXMLInformationalAmountList;
  inherited;
end;

function TXMLTaxAdjustment.Get_TaxCategoryType: UnicodeString;
begin
  Result := AttributeNodes['TaxCategoryType'].Text;
end;

procedure TXMLTaxAdjustment.Set_TaxCategoryType(Value: UnicodeString);
begin
  SetAttribute('TaxCategoryType', Value);
end;

function TXMLTaxAdjustment.Get_TaxType: UnicodeString;
begin
  Result := AttributeNodes['TaxType'].Text;
end;

procedure TXMLTaxAdjustment.Set_TaxType(Value: UnicodeString);
begin
  SetAttribute('TaxType', Value);
end;

function TXMLTaxAdjustment.Get_TaxPercent: Double;
begin
  Result := XmlStrToFloatExt(ChildNodes['TaxPercent'].Text);
end;

procedure TXMLTaxAdjustment.Set_TaxPercent(Value: Double);
begin
  ChildNodes['TaxPercent'].NodeValue := Value;
end;

function TXMLTaxAdjustment.Get_TaxAmount: IXMLTaxAmount;
begin
  Result := ChildNodes['TaxAmount'] as IXMLTaxAmount;
end;

function TXMLTaxAdjustment.Get_TaxLocation: UnicodeString;
begin
  Result := ChildNodes['TaxLocation'].Text;
end;

procedure TXMLTaxAdjustment.Set_TaxLocation(Value: UnicodeString);
begin
  ChildNodes['TaxLocation'].NodeValue := Value;
end;

function TXMLTaxAdjustment.Get_InformationalAmount: IXMLInformationalAmountList;
begin
  Result := FInformationalAmount;
end;

{ TXMLTaxAmount }

procedure TXMLTaxAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLTaxAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLInformationalAmount }

procedure TXMLInformationalAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  RegisterChildNode('ExchangeRate', TXMLExchangeRate);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLInformationalAmount.Get_AmountType: UnicodeString;
begin
  Result := AttributeNodes['AmountType'].Text;
end;

procedure TXMLInformationalAmount.Set_AmountType(Value: UnicodeString);
begin
  SetAttribute('AmountType', Value);
end;

function TXMLInformationalAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

function TXMLInformationalAmount.Get_ExchangeRate: IXMLExchangeRate;
begin
  Result := ChildNodes['ExchangeRate'] as IXMLExchangeRate;
end;

function TXMLInformationalAmount.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLInformationalAmountList }

function TXMLInformationalAmountList.Add: IXMLInformationalAmount;
begin
  Result := AddItem(-1) as IXMLInformationalAmount;
end;

function TXMLInformationalAmountList.Insert(const Index: Integer): IXMLInformationalAmount;
begin
  Result := AddItem(Index) as IXMLInformationalAmount;
end;

function TXMLInformationalAmountList.Get_Item(Index: Integer): IXMLInformationalAmount;
begin
  Result := List[Index] as IXMLInformationalAmount;
end;

{ TXMLGeneralLedgerAccount }

function TXMLGeneralLedgerAccount.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLGeneralLedgerAccount.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLMonetaryAdjustmentAmount }

procedure TXMLMonetaryAdjustmentAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLMonetaryAdjustmentAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLMonetaryAdjustmentReference }

function TXMLMonetaryAdjustmentReference.Get_MonetaryAdjustmentReferenceType: UnicodeString;
begin
  Result := AttributeNodes['MonetaryAdjustmentReferenceType'].Text;
end;

procedure TXMLMonetaryAdjustmentReference.Set_MonetaryAdjustmentReferenceType(Value: UnicodeString);
begin
  SetAttribute('MonetaryAdjustmentReferenceType', Value);
end;

function TXMLMonetaryAdjustmentReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLMonetaryAdjustmentReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLMonetaryAdjustmentReferenceList }

function TXMLMonetaryAdjustmentReferenceList.Add: IXMLMonetaryAdjustmentReference;
begin
  Result := AddItem(-1) as IXMLMonetaryAdjustmentReference;
end;

function TXMLMonetaryAdjustmentReferenceList.Insert(const Index: Integer): IXMLMonetaryAdjustmentReference;
begin
  Result := AddItem(Index) as IXMLMonetaryAdjustmentReference;
end;

function TXMLMonetaryAdjustmentReferenceList.Get_Item(Index: Integer): IXMLMonetaryAdjustmentReference;
begin
  Result := List[Index] as IXMLMonetaryAdjustmentReference;
end;

{ TXMLPriceSpecification }

procedure TXMLPriceSpecification.AfterConstruction;
begin
  RegisterChildNode('ProductIdentification', TXMLProductIdentification);
  RegisterChildNode('BookSpecIdentification', TXMLBookSpecIdentification);
  inherited;
end;

function TXMLPriceSpecification.Get_ProductIdentification: IXMLProductIdentification;
begin
  Result := ChildNodes['ProductIdentification'] as IXMLProductIdentification;
end;

function TXMLPriceSpecification.Get_BookSpecIdentification: IXMLBookSpecIdentification;
begin
  Result := ChildNodes['BookSpecIdentification'] as IXMLBookSpecIdentification;
end;

{ TXMLPriceSpecificationList }

function TXMLPriceSpecificationList.Add: IXMLPriceSpecification;
begin
  Result := AddItem(-1) as IXMLPriceSpecification;
end;

function TXMLPriceSpecificationList.Insert(const Index: Integer): IXMLPriceSpecification;
begin
  Result := AddItem(Index) as IXMLPriceSpecification;
end;

function TXMLPriceSpecificationList.Get_Item(Index: Integer): IXMLPriceSpecification;
begin
  Result := List[Index] as IXMLPriceSpecification;
end;

{ TXMLBookSpecIdentification }

procedure TXMLBookSpecIdentification.AfterConstruction;
begin
  RegisterChildNode('SpecIssueDate', TXMLSpecIssueDate);
  inherited;
end;

function TXMLBookSpecIdentification.Get_SpecificationNumber: UnicodeString;
begin
  Result := ChildNodes['SpecificationNumber'].Text;
end;

procedure TXMLBookSpecIdentification.Set_SpecificationNumber(Value: UnicodeString);
begin
  ChildNodes['SpecificationNumber'].NodeValue := Value;
end;

function TXMLBookSpecIdentification.Get_SpecVersion: UnicodeString;
begin
  Result := ChildNodes['SpecVersion'].Text;
end;

procedure TXMLBookSpecIdentification.Set_SpecVersion(Value: UnicodeString);
begin
  ChildNodes['SpecVersion'].NodeValue := Value;
end;

function TXMLBookSpecIdentification.Get_SpecIssueDate: IXMLSpecIssueDate;
begin
  Result := ChildNodes['SpecIssueDate'] as IXMLSpecIssueDate;
end;

{ TXMLSpecIssueDate }

procedure TXMLSpecIssueDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLSpecIssueDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLSpecIssueDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLSpecIssueDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLInvoiceLineBaseAmount }

procedure TXMLInvoiceLineBaseAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLInvoiceLineBaseAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLChargeInformation }

procedure TXMLChargeInformation.AfterConstruction;
begin
  RegisterChildNode('DocumentReferenceInformation', TXMLDocumentReferenceInformation);
  RegisterChildNode('CostComponent', TXMLCostComponent);
  RegisterChildNode('PriceDetails', TXMLPriceDetails);
  RegisterChildNode('MonetaryAdjustment', TXMLMonetaryAdjustment);
  RegisterChildNode('QuantityInformation', TXMLQuantityInformation);
  RegisterChildNode('TransportUnitCharacteristics', TXMLTransportUnitCharacteristics);
  RegisterChildNode('TransportVehicleCharacteristics', TXMLTransportVehicleCharacteristics);
  RegisterChildNode('ChargeReference', TXMLChargeReference);
  RegisterChildNode('ChargeAmount', TXMLChargeAmount);
  RegisterChildNode('ChargeNetAmount', TXMLChargeNetAmount);
  RegisterChildNode('InformationalAmount', TXMLInformationalAmount);
  FDocumentReferenceInformation := CreateCollection(TXMLDocumentReferenceInformationList, IXMLDocumentReferenceInformation, 'DocumentReferenceInformation') as IXMLDocumentReferenceInformationList;
  FCostComponent := CreateCollection(TXMLCostComponentList, IXMLCostComponent, 'CostComponent') as IXMLCostComponentList;
  FMonetaryAdjustment := CreateCollection(TXMLMonetaryAdjustmentList, IXMLMonetaryAdjustment, 'MonetaryAdjustment') as IXMLMonetaryAdjustmentList;
  FTransportUnitCharacteristics := CreateCollection(TXMLTransportUnitCharacteristicsList, IXMLTransportUnitCharacteristics, 'TransportUnitCharacteristics') as IXMLTransportUnitCharacteristicsList;
  FChargeReference := CreateCollection(TXMLChargeReferenceList, IXMLChargeReference, 'ChargeReference') as IXMLChargeReferenceList;
  FInformationalAmount := CreateCollection(TXMLInformationalAmountList, IXMLInformationalAmount, 'InformationalAmount') as IXMLInformationalAmountList;
  inherited;
end;

function TXMLChargeInformation.Get_DocumentReferenceInformation: IXMLDocumentReferenceInformationList;
begin
  Result := FDocumentReferenceInformation;
end;

function TXMLChargeInformation.Get_CostComponent: IXMLCostComponentList;
begin
  Result := FCostComponent;
end;

function TXMLChargeInformation.Get_PriceDetails: IXMLPriceDetails;
begin
  Result := ChildNodes['PriceDetails'] as IXMLPriceDetails;
end;

function TXMLChargeInformation.Get_MonetaryAdjustment: IXMLMonetaryAdjustmentList;
begin
  Result := FMonetaryAdjustment;
end;

function TXMLChargeInformation.Get_QuantityInformation: IXMLQuantityInformation;
begin
  Result := ChildNodes['QuantityInformation'] as IXMLQuantityInformation;
end;

function TXMLChargeInformation.Get_TransportUnitCharacteristics: IXMLTransportUnitCharacteristicsList;
begin
  Result := FTransportUnitCharacteristics;
end;

function TXMLChargeInformation.Get_TransportVehicleCharacteristics: IXMLTransportVehicleCharacteristics;
begin
  Result := ChildNodes['TransportVehicleCharacteristics'] as IXMLTransportVehicleCharacteristics;
end;

function TXMLChargeInformation.Get_ChargeReference: IXMLChargeReferenceList;
begin
  Result := FChargeReference;
end;

function TXMLChargeInformation.Get_ChargeAmount: IXMLChargeAmount;
begin
  Result := ChildNodes['ChargeAmount'] as IXMLChargeAmount;
end;

function TXMLChargeInformation.Get_ChargeNetAmount: IXMLChargeNetAmount;
begin
  Result := ChildNodes['ChargeNetAmount'] as IXMLChargeNetAmount;
end;

function TXMLChargeInformation.Get_InformationalAmount: IXMLInformationalAmountList;
begin
  Result := FInformationalAmount;
end;

{ TXMLChargeInformationList }

function TXMLChargeInformationList.Add: IXMLChargeInformation;
begin
  Result := AddItem(-1) as IXMLChargeInformation;
end;

function TXMLChargeInformationList.Insert(const Index: Integer): IXMLChargeInformation;
begin
  Result := AddItem(Index) as IXMLChargeInformation;
end;

function TXMLChargeInformationList.Get_Item(Index: Integer): IXMLChargeInformation;
begin
  Result := List[Index] as IXMLChargeInformation;
end;

{ TXMLCostComponent }

procedure TXMLCostComponent.AfterConstruction;
begin
  RegisterChildNode('CostComponentCode', TXMLCostComponentCode);
  RegisterChildNode('CostComponentCodeValue', TXMLCostComponentCodeValue);
  RegisterChildNode('CostComponentDescription', TXMLCostComponentDescription);
  FCostComponentDescription := CreateCollection(TXMLCostComponentDescriptionList, IXMLCostComponentDescription, 'CostComponentDescription') as IXMLCostComponentDescriptionList;
  inherited;
end;

function TXMLCostComponent.Get_CostComponentCode: IXMLCostComponentCode;
begin
  Result := ChildNodes['CostComponentCode'] as IXMLCostComponentCode;
end;

function TXMLCostComponent.Get_CostComponentCodeValue: IXMLCostComponentCodeValue;
begin
  Result := ChildNodes['CostComponentCodeValue'] as IXMLCostComponentCodeValue;
end;

function TXMLCostComponent.Get_CostComponentDescription: IXMLCostComponentDescriptionList;
begin
  Result := FCostComponentDescription;
end;

{ TXMLCostComponentList }

function TXMLCostComponentList.Add: IXMLCostComponent;
begin
  Result := AddItem(-1) as IXMLCostComponent;
end;

function TXMLCostComponentList.Insert(const Index: Integer): IXMLCostComponent;
begin
  Result := AddItem(Index) as IXMLCostComponent;
end;

function TXMLCostComponentList.Get_Item(Index: Integer): IXMLCostComponent;
begin
  Result := List[Index] as IXMLCostComponent;
end;

{ TXMLCostComponentCode }

function TXMLCostComponentCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLCostComponentCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLCostComponentCodeValue }

procedure TXMLCostComponentCodeValue.AfterConstruction;
begin
  RegisterChildNode('NumericValue', TXMLDetailMeasurement);
  inherited;
end;

function TXMLCostComponentCodeValue.Get_NumericValue: IXMLDetailMeasurement;
begin
  Result := ChildNodes['NumericValue'] as IXMLDetailMeasurement;
end;

function TXMLCostComponentCodeValue.Get_TextValue: UnicodeString;
begin
  Result := ChildNodes['TextValue'].Text;
end;

procedure TXMLCostComponentCodeValue.Set_TextValue(Value: UnicodeString);
begin
  ChildNodes['TextValue'].NodeValue := Value;
end;

{ TXMLCostComponentDescription }

function TXMLCostComponentDescription.Get_Language: UnicodeString;
begin
  Result := AttributeNodes['Language'].Text;
end;

procedure TXMLCostComponentDescription.Set_Language(Value: UnicodeString);
begin
  SetAttribute('Language', Value);
end;

{ TXMLCostComponentDescriptionList }

function TXMLCostComponentDescriptionList.Add: IXMLCostComponentDescription;
begin
  Result := AddItem(-1) as IXMLCostComponentDescription;
end;

function TXMLCostComponentDescriptionList.Insert(const Index: Integer): IXMLCostComponentDescription;
begin
  Result := AddItem(Index) as IXMLCostComponentDescription;
end;

function TXMLCostComponentDescriptionList.Get_Item(Index: Integer): IXMLCostComponentDescription;
begin
  Result := List[Index] as IXMLCostComponentDescription;
end;

{ TXMLTransportUnitCharacteristics }

procedure TXMLTransportUnitCharacteristics.AfterConstruction;
begin
  RegisterChildNode('TransportUnitCode', TXMLTransportUnitCode);
  RegisterChildNode('CodeValue', TXMLCodeValue);
  RegisterChildNode('TransportUnitMeasurements', TXMLTransportUnitMeasurements);
  RegisterChildNode('TransportUnitEquipment', TXMLTransportUnitEquipment);
  RegisterChildNode('TransportUnitIdentifier', TXMLTransportUnitIdentifier);
  RegisterChildNode('TransportUnitDetail', TXMLTransportUnitDetail);
  RegisterChildNode('TransportUnitReferenceIDInfo', TXMLTransportUnitReferenceIDInfo);
  FCodeDescription := CreateCollection(TXMLS255List, IXMLNode, 'CodeDescription') as IXMLS255List;
  FTransportUnitMeasurements := CreateCollection(TXMLTransportUnitMeasurementsList, IXMLTransportUnitMeasurements, 'TransportUnitMeasurements') as IXMLTransportUnitMeasurementsList;
  FTransportUnitEquipment := CreateCollection(TXMLTransportUnitEquipmentList, IXMLTransportUnitEquipment, 'TransportUnitEquipment') as IXMLTransportUnitEquipmentList;
  FTransportUnitIdentifier := CreateCollection(TXMLTransportUnitIdentifierList, IXMLTransportUnitIdentifier, 'TransportUnitIdentifier') as IXMLTransportUnitIdentifierList;
  FTransportUnitReferenceIDInfo := CreateCollection(TXMLTransportUnitReferenceIDInfoList, IXMLTransportUnitReferenceIDInfo, 'TransportUnitReferenceIDInfo') as IXMLTransportUnitReferenceIDInfoList;
  inherited;
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitType: UnicodeString;
begin
  Result := AttributeNodes['TransportUnitType'].Text;
end;

procedure TXMLTransportUnitCharacteristics.Set_TransportUnitType(Value: UnicodeString);
begin
  SetAttribute('TransportUnitType', Value);
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitVariable: UnicodeString;
begin
  Result := AttributeNodes['TransportUnitVariable'].Text;
end;

procedure TXMLTransportUnitCharacteristics.Set_TransportUnitVariable(Value: UnicodeString);
begin
  SetAttribute('TransportUnitVariable', Value);
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitLevel: LongWord;
begin
  Result := AttributeNodes['TransportUnitLevel'].NodeValue;
end;

procedure TXMLTransportUnitCharacteristics.Set_TransportUnitLevel(Value: LongWord);
begin
  SetAttribute('TransportUnitLevel', Value);
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitHorizontalOrder: LongWord;
begin
  Result := AttributeNodes['TransportUnitHorizontalOrder'].NodeValue;
end;

procedure TXMLTransportUnitCharacteristics.Set_TransportUnitHorizontalOrder(Value: LongWord);
begin
  SetAttribute('TransportUnitHorizontalOrder', Value);
end;

function TXMLTransportUnitCharacteristics.Get_ChangesAllowed: UnicodeString;
begin
  Result := AttributeNodes['ChangesAllowed'].Text;
end;

procedure TXMLTransportUnitCharacteristics.Set_ChangesAllowed(Value: UnicodeString);
begin
  SetAttribute('ChangesAllowed', Value);
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitCode: IXMLTransportUnitCode;
begin
  Result := ChildNodes['TransportUnitCode'] as IXMLTransportUnitCode;
end;

function TXMLTransportUnitCharacteristics.Get_CodeValue: IXMLCodeValue;
begin
  Result := ChildNodes['CodeValue'] as IXMLCodeValue;
end;

function TXMLTransportUnitCharacteristics.Get_CodeDescription: IXMLS255List;
begin
  Result := FCodeDescription;
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitMeasurements: IXMLTransportUnitMeasurementsList;
begin
  Result := FTransportUnitMeasurements;
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitEquipment: IXMLTransportUnitEquipmentList;
begin
  Result := FTransportUnitEquipment;
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitCount: LongWord;
begin
  Result := ChildNodes['TransportUnitCount'].NodeValue;
end;

procedure TXMLTransportUnitCharacteristics.Set_TransportUnitCount(Value: LongWord);
begin
  ChildNodes['TransportUnitCount'].NodeValue := Value;
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitIdentifier: IXMLTransportUnitIdentifierList;
begin
  Result := FTransportUnitIdentifier;
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitText: UnicodeString;
begin
  Result := ChildNodes['TransportUnitText'].Text;
end;

procedure TXMLTransportUnitCharacteristics.Set_TransportUnitText(Value: UnicodeString);
begin
  ChildNodes['TransportUnitText'].NodeValue := Value;
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitDetail: IXMLTransportUnitDetail;
begin
  Result := ChildNodes['TransportUnitDetail'] as IXMLTransportUnitDetail;
end;

function TXMLTransportUnitCharacteristics.Get_TransportUnitReferenceIDInfo: IXMLTransportUnitReferenceIDInfoList;
begin
  Result := FTransportUnitReferenceIDInfo;
end;

{ TXMLTransportUnitCharacteristicsList }

function TXMLTransportUnitCharacteristicsList.Add: IXMLTransportUnitCharacteristics;
begin
  Result := AddItem(-1) as IXMLTransportUnitCharacteristics;
end;

function TXMLTransportUnitCharacteristicsList.Insert(const Index: Integer): IXMLTransportUnitCharacteristics;
begin
  Result := AddItem(Index) as IXMLTransportUnitCharacteristics;
end;

function TXMLTransportUnitCharacteristicsList.Get_Item(Index: Integer): IXMLTransportUnitCharacteristics;
begin
  Result := List[Index] as IXMLTransportUnitCharacteristics;
end;

{ TXMLTransportUnitCode }

function TXMLTransportUnitCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTransportUnitCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTransportUnitMeasurements }

procedure TXMLTransportUnitMeasurements.AfterConstruction;
begin
  RegisterChildNode('TransportUnitLength', TXMLMeasurement);
  RegisterChildNode('TransportUnitWidth', TXMLMeasurement);
  RegisterChildNode('TransportUnitHeight', TXMLMeasurement);
  RegisterChildNode('TransportUnitWeight', TXMLMeasurement);
  RegisterChildNode('TransportUnitCapacity', TXMLMeasurement);
  FTransportUnitCapacity := CreateCollection(TXMLMeasurementList, IXMLMeasurement, 'TransportUnitCapacity') as IXMLMeasurementList;
  inherited;
end;

function TXMLTransportUnitMeasurements.Get_AppliesTo: UnicodeString;
begin
  Result := AttributeNodes['AppliesTo'].Text;
end;

procedure TXMLTransportUnitMeasurements.Set_AppliesTo(Value: UnicodeString);
begin
  SetAttribute('AppliesTo', Value);
end;

function TXMLTransportUnitMeasurements.Get_IsLoaded: UnicodeString;
begin
  Result := AttributeNodes['IsLoaded'].Text;
end;

procedure TXMLTransportUnitMeasurements.Set_IsLoaded(Value: UnicodeString);
begin
  SetAttribute('IsLoaded', Value);
end;

function TXMLTransportUnitMeasurements.Get_TransportUnitLength: IXMLMeasurement;
begin
  Result := ChildNodes['TransportUnitLength'] as IXMLMeasurement;
end;

function TXMLTransportUnitMeasurements.Get_TransportUnitWidth: IXMLMeasurement;
begin
  Result := ChildNodes['TransportUnitWidth'] as IXMLMeasurement;
end;

function TXMLTransportUnitMeasurements.Get_TransportUnitHeight: IXMLMeasurement;
begin
  Result := ChildNodes['TransportUnitHeight'] as IXMLMeasurement;
end;

function TXMLTransportUnitMeasurements.Get_TransportUnitWeight: IXMLMeasurement;
begin
  Result := ChildNodes['TransportUnitWeight'] as IXMLMeasurement;
end;

function TXMLTransportUnitMeasurements.Get_TransportUnitCapacity: IXMLMeasurementList;
begin
  Result := FTransportUnitCapacity;
end;

{ TXMLTransportUnitMeasurementsList }

function TXMLTransportUnitMeasurementsList.Add: IXMLTransportUnitMeasurements;
begin
  Result := AddItem(-1) as IXMLTransportUnitMeasurements;
end;

function TXMLTransportUnitMeasurementsList.Insert(const Index: Integer): IXMLTransportUnitMeasurements;
begin
  Result := AddItem(Index) as IXMLTransportUnitMeasurements;
end;

function TXMLTransportUnitMeasurementsList.Get_Item(Index: Integer): IXMLTransportUnitMeasurements;
begin
  Result := List[Index] as IXMLTransportUnitMeasurements;
end;

{ TXMLTransportUnitEquipment }

procedure TXMLTransportUnitEquipment.AfterConstruction;
begin
  RegisterChildNode('TransportUnitEquipmentCode', TXMLTransportUnitEquipmentCode);
  RegisterChildNode('CodeValue', TXMLCodeValue);
  RegisterChildNode('TransportUnitEquipmentDescription', TXMLTransportUnitEquipmentDescription);
  RegisterChildNode('EquipmentPropertyValue', TXMLEquipmentPropertyValue);
  FTransportUnitEquipmentDescription := CreateCollection(TXMLTransportUnitEquipmentDescriptionList, IXMLTransportUnitEquipmentDescription, 'TransportUnitEquipmentDescription') as IXMLTransportUnitEquipmentDescriptionList;
  FEquipmentPropertyValue := CreateCollection(TXMLEquipmentPropertyValueList, IXMLEquipmentPropertyValue, 'EquipmentPropertyValue') as IXMLEquipmentPropertyValueList;
  inherited;
end;

function TXMLTransportUnitEquipment.Get_TransportUnitEquipmentType: UnicodeString;
begin
  Result := AttributeNodes['TransportUnitEquipmentType'].Text;
end;

procedure TXMLTransportUnitEquipment.Set_TransportUnitEquipmentType(Value: UnicodeString);
begin
  SetAttribute('TransportUnitEquipmentType', Value);
end;

function TXMLTransportUnitEquipment.Get_TransportUnitEquipmentCode: IXMLTransportUnitEquipmentCode;
begin
  Result := ChildNodes['TransportUnitEquipmentCode'] as IXMLTransportUnitEquipmentCode;
end;

function TXMLTransportUnitEquipment.Get_CodeValue: IXMLCodeValue;
begin
  Result := ChildNodes['CodeValue'] as IXMLCodeValue;
end;

function TXMLTransportUnitEquipment.Get_TransportUnitEquipmentDescription: IXMLTransportUnitEquipmentDescriptionList;
begin
  Result := FTransportUnitEquipmentDescription;
end;

function TXMLTransportUnitEquipment.Get_EquipmentPropertyValue: IXMLEquipmentPropertyValueList;
begin
  Result := FEquipmentPropertyValue;
end;

{ TXMLTransportUnitEquipmentList }

function TXMLTransportUnitEquipmentList.Add: IXMLTransportUnitEquipment;
begin
  Result := AddItem(-1) as IXMLTransportUnitEquipment;
end;

function TXMLTransportUnitEquipmentList.Insert(const Index: Integer): IXMLTransportUnitEquipment;
begin
  Result := AddItem(Index) as IXMLTransportUnitEquipment;
end;

function TXMLTransportUnitEquipmentList.Get_Item(Index: Integer): IXMLTransportUnitEquipment;
begin
  Result := List[Index] as IXMLTransportUnitEquipment;
end;

{ TXMLTransportUnitEquipmentCode }

function TXMLTransportUnitEquipmentCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTransportUnitEquipmentCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTransportUnitEquipmentDescription }

function TXMLTransportUnitEquipmentDescription.Get_Language: UnicodeString;
begin
  Result := AttributeNodes['Language'].Text;
end;

procedure TXMLTransportUnitEquipmentDescription.Set_Language(Value: UnicodeString);
begin
  SetAttribute('Language', Value);
end;

{ TXMLTransportUnitEquipmentDescriptionList }

function TXMLTransportUnitEquipmentDescriptionList.Add: IXMLTransportUnitEquipmentDescription;
begin
  Result := AddItem(-1) as IXMLTransportUnitEquipmentDescription;
end;

function TXMLTransportUnitEquipmentDescriptionList.Insert(const Index: Integer): IXMLTransportUnitEquipmentDescription;
begin
  Result := AddItem(Index) as IXMLTransportUnitEquipmentDescription;
end;

function TXMLTransportUnitEquipmentDescriptionList.Get_Item(Index: Integer): IXMLTransportUnitEquipmentDescription;
begin
  Result := List[Index] as IXMLTransportUnitEquipmentDescription;
end;

{ TXMLEquipmentPropertyValue }

procedure TXMLEquipmentPropertyValue.AfterConstruction;
begin
  RegisterChildNode('PositionOnItem', TXMLPositionOnItem);
  RegisterChildNode('NumericValue', TXMLDetailMeasurement);
  inherited;
end;

function TXMLEquipmentPropertyValue.Get_EquipmentPropertyType: UnicodeString;
begin
  Result := AttributeNodes['EquipmentPropertyType'].Text;
end;

procedure TXMLEquipmentPropertyValue.Set_EquipmentPropertyType(Value: UnicodeString);
begin
  SetAttribute('EquipmentPropertyType', Value);
end;

function TXMLEquipmentPropertyValue.Get_AppliesTo: UnicodeString;
begin
  Result := AttributeNodes['AppliesTo'].Text;
end;

procedure TXMLEquipmentPropertyValue.Set_AppliesTo(Value: UnicodeString);
begin
  SetAttribute('AppliesTo', Value);
end;

function TXMLEquipmentPropertyValue.Get_IsAverageValue: UnicodeString;
begin
  Result := AttributeNodes['IsAverageValue'].Text;
end;

procedure TXMLEquipmentPropertyValue.Set_IsAverageValue(Value: UnicodeString);
begin
  SetAttribute('IsAverageValue', Value);
end;

function TXMLEquipmentPropertyValue.Get_PositionOnItem: IXMLPositionOnItem;
begin
  Result := ChildNodes['PositionOnItem'] as IXMLPositionOnItem;
end;

function TXMLEquipmentPropertyValue.Get_BinaryValue: UnicodeString;
begin
  Result := ChildNodes['BinaryValue'].Text;
end;

procedure TXMLEquipmentPropertyValue.Set_BinaryValue(Value: UnicodeString);
begin
  ChildNodes['BinaryValue'].NodeValue := Value;
end;

function TXMLEquipmentPropertyValue.Get_BooleanValue: Boolean;
begin
  Result := ChildNodes['BooleanValue'].NodeValue;
end;

procedure TXMLEquipmentPropertyValue.Set_BooleanValue(Value: Boolean);
begin
  ChildNodes['BooleanValue'].NodeValue := Value;
end;

function TXMLEquipmentPropertyValue.Get_DateTimeValue: UnicodeString;
begin
  Result := ChildNodes['DateTimeValue'].Text;
end;

procedure TXMLEquipmentPropertyValue.Set_DateTimeValue(Value: UnicodeString);
begin
  ChildNodes['DateTimeValue'].NodeValue := Value;
end;

function TXMLEquipmentPropertyValue.Get_NumericValue: IXMLDetailMeasurement;
begin
  Result := ChildNodes['NumericValue'] as IXMLDetailMeasurement;
end;

function TXMLEquipmentPropertyValue.Get_TextValue: UnicodeString;
begin
  Result := ChildNodes['TextValue'].Text;
end;

procedure TXMLEquipmentPropertyValue.Set_TextValue(Value: UnicodeString);
begin
  ChildNodes['TextValue'].NodeValue := Value;
end;

{ TXMLEquipmentPropertyValueList }

function TXMLEquipmentPropertyValueList.Add: IXMLEquipmentPropertyValue;
begin
  Result := AddItem(-1) as IXMLEquipmentPropertyValue;
end;

function TXMLEquipmentPropertyValueList.Insert(const Index: Integer): IXMLEquipmentPropertyValue;
begin
  Result := AddItem(Index) as IXMLEquipmentPropertyValue;
end;

function TXMLEquipmentPropertyValueList.Get_Item(Index: Integer): IXMLEquipmentPropertyValue;
begin
  Result := List[Index] as IXMLEquipmentPropertyValue;
end;

{ TXMLTransportUnitIdentifier }

function TXMLTransportUnitIdentifier.Get_TransportUnitIdentifierType: UnicodeString;
begin
  Result := AttributeNodes['TransportUnitIdentifierType'].Text;
end;

procedure TXMLTransportUnitIdentifier.Set_TransportUnitIdentifierType(Value: UnicodeString);
begin
  SetAttribute('TransportUnitIdentifierType', Value);
end;

function TXMLTransportUnitIdentifier.Get_StateOrProvince: UnicodeString;
begin
  Result := AttributeNodes['StateOrProvince'].Text;
end;

procedure TXMLTransportUnitIdentifier.Set_StateOrProvince(Value: UnicodeString);
begin
  SetAttribute('StateOrProvince', Value);
end;

function TXMLTransportUnitIdentifier.Get_ISOCountryCode: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCode'].Text;
end;

procedure TXMLTransportUnitIdentifier.Set_ISOCountryCode(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCode', Value);
end;

function TXMLTransportUnitIdentifier.Get_ISOCountryCodeAlpha3: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCodeAlpha3'].Text;
end;

procedure TXMLTransportUnitIdentifier.Set_ISOCountryCodeAlpha3(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCodeAlpha3', Value);
end;

function TXMLTransportUnitIdentifier.Get_ISOCountryCodeNumeric: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCodeNumeric'].Text;
end;

procedure TXMLTransportUnitIdentifier.Set_ISOCountryCodeNumeric(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCodeNumeric', Value);
end;

function TXMLTransportUnitIdentifier.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTransportUnitIdentifier.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTransportUnitIdentifierList }

function TXMLTransportUnitIdentifierList.Add: IXMLTransportUnitIdentifier;
begin
  Result := AddItem(-1) as IXMLTransportUnitIdentifier;
end;

function TXMLTransportUnitIdentifierList.Insert(const Index: Integer): IXMLTransportUnitIdentifier;
begin
  Result := AddItem(Index) as IXMLTransportUnitIdentifier;
end;

function TXMLTransportUnitIdentifierList.Get_Item(Index: Integer): IXMLTransportUnitIdentifier;
begin
  Result := List[Index] as IXMLTransportUnitIdentifier;
end;

{ TXMLTransportUnitDetail }

procedure TXMLTransportUnitDetail.AfterConstruction;
begin
  RegisterChildNode('TransportUnitDetailCode', TXMLTransportUnitDetailCode);
  RegisterChildNode('CodeValue', TXMLCodeValue);
  FCodeDescription := CreateCollection(TXMLS255List, IXMLNode, 'CodeDescription') as IXMLS255List;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLTransportUnitDetail.Get_TransportUnitDetailType: UnicodeString;
begin
  Result := AttributeNodes['TransportUnitDetailType'].Text;
end;

procedure TXMLTransportUnitDetail.Set_TransportUnitDetailType(Value: UnicodeString);
begin
  SetAttribute('TransportUnitDetailType', Value);
end;

function TXMLTransportUnitDetail.Get_LoadOpeningSide: UnicodeString;
begin
  Result := AttributeNodes['LoadOpeningSide'].Text;
end;

procedure TXMLTransportUnitDetail.Set_LoadOpeningSide(Value: UnicodeString);
begin
  SetAttribute('LoadOpeningSide', Value);
end;

function TXMLTransportUnitDetail.Get_FrontCouplingType: UnicodeString;
begin
  Result := AttributeNodes['FrontCouplingType'].Text;
end;

procedure TXMLTransportUnitDetail.Set_FrontCouplingType(Value: UnicodeString);
begin
  SetAttribute('FrontCouplingType', Value);
end;

function TXMLTransportUnitDetail.Get_RearCouplingType: UnicodeString;
begin
  Result := AttributeNodes['RearCouplingType'].Text;
end;

procedure TXMLTransportUnitDetail.Set_RearCouplingType(Value: UnicodeString);
begin
  SetAttribute('RearCouplingType', Value);
end;

function TXMLTransportUnitDetail.Get_TransportUnitDetailCode: IXMLTransportUnitDetailCode;
begin
  Result := ChildNodes['TransportUnitDetailCode'] as IXMLTransportUnitDetailCode;
end;

function TXMLTransportUnitDetail.Get_CodeValue: IXMLCodeValue;
begin
  Result := ChildNodes['CodeValue'] as IXMLCodeValue;
end;

function TXMLTransportUnitDetail.Get_CodeDescription: IXMLS255List;
begin
  Result := FCodeDescription;
end;

function TXMLTransportUnitDetail.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLTransportUnitDetailCode }

function TXMLTransportUnitDetailCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTransportUnitDetailCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTransportUnitReferenceIDInfo }

procedure TXMLTransportUnitReferenceIDInfo.AfterConstruction;
begin
  RegisterChildNode('TransportUnitIdentifier', TXMLTransportUnitIdentifier);
  ItemTag := 'TransportUnitIdentifier';
  ItemInterface := IXMLTransportUnitIdentifier;
  inherited;
end;

function TXMLTransportUnitReferenceIDInfo.Get_TransportUnitType: UnicodeString;
begin
  Result := AttributeNodes['TransportUnitType'].Text;
end;

procedure TXMLTransportUnitReferenceIDInfo.Set_TransportUnitType(Value: UnicodeString);
begin
  SetAttribute('TransportUnitType', Value);
end;

function TXMLTransportUnitReferenceIDInfo.Get_TransportUnitLevel: LongWord;
begin
  Result := AttributeNodes['TransportUnitLevel'].NodeValue;
end;

procedure TXMLTransportUnitReferenceIDInfo.Set_TransportUnitLevel(Value: LongWord);
begin
  SetAttribute('TransportUnitLevel', Value);
end;

function TXMLTransportUnitReferenceIDInfo.Get_TransportUnitIdentifier(Index: Integer): IXMLTransportUnitIdentifier;
begin
  Result := List[Index] as IXMLTransportUnitIdentifier;
end;

function TXMLTransportUnitReferenceIDInfo.Add: IXMLTransportUnitIdentifier;
begin
  Result := AddItem(-1) as IXMLTransportUnitIdentifier;
end;

function TXMLTransportUnitReferenceIDInfo.Insert(const Index: Integer): IXMLTransportUnitIdentifier;
begin
  Result := AddItem(Index) as IXMLTransportUnitIdentifier;
end;

{ TXMLTransportUnitReferenceIDInfoList }

function TXMLTransportUnitReferenceIDInfoList.Add: IXMLTransportUnitReferenceIDInfo;
begin
  Result := AddItem(-1) as IXMLTransportUnitReferenceIDInfo;
end;

function TXMLTransportUnitReferenceIDInfoList.Insert(const Index: Integer): IXMLTransportUnitReferenceIDInfo;
begin
  Result := AddItem(Index) as IXMLTransportUnitReferenceIDInfo;
end;

function TXMLTransportUnitReferenceIDInfoList.Get_Item(Index: Integer): IXMLTransportUnitReferenceIDInfo;
begin
  Result := List[Index] as IXMLTransportUnitReferenceIDInfo;
end;

{ TXMLTransportVehicleCharacteristics }

procedure TXMLTransportVehicleCharacteristics.AfterConstruction;
begin
  RegisterChildNode('TransportVehicleCode', TXMLTransportVehicleCode);
  RegisterChildNode('CodeValue', TXMLCodeValue);
  RegisterChildNode('TransportVehicleMeasurements', TXMLTransportVehicleMeasurements);
  RegisterChildNode('TransportVehicleEquipment', TXMLTransportVehicleEquipment);
  RegisterChildNode('TransportVehicleIdentifier', TXMLTransportVehicleIdentifier);
  RegisterChildNode('BrandAndModel', TXMLBrandAndModel);
  RegisterChildNode('TransportVehicleEmissionClass', TXMLCodeInfo);
  RegisterChildNode('TransportVehicleDetail', TXMLTransportVehicleDetail);
  FCodeDescription := CreateCollection(TXMLS255List, IXMLNode, 'CodeDescription') as IXMLS255List;
  FTransportVehicleEquipment := CreateCollection(TXMLTransportVehicleEquipmentList, IXMLTransportVehicleEquipment, 'TransportVehicleEquipment') as IXMLTransportVehicleEquipmentList;
  FTransportVehicleIdentifier := CreateCollection(TXMLTransportVehicleIdentifierList, IXMLTransportVehicleIdentifier, 'TransportVehicleIdentifier') as IXMLTransportVehicleIdentifierList;
  FTransportVehicleEmissionClass := CreateCollection(TXMLCodeInfoList, IXMLCodeInfo, 'TransportVehicleEmissionClass') as IXMLCodeInfoList;
  inherited;
end;

function TXMLTransportVehicleCharacteristics.Get_TransportVehicleType: UnicodeString;
begin
  Result := AttributeNodes['TransportVehicleType'].Text;
end;

procedure TXMLTransportVehicleCharacteristics.Set_TransportVehicleType(Value: UnicodeString);
begin
  SetAttribute('TransportVehicleType', Value);
end;

function TXMLTransportVehicleCharacteristics.Get_ChangesAllowed: UnicodeString;
begin
  Result := AttributeNodes['ChangesAllowed'].Text;
end;

procedure TXMLTransportVehicleCharacteristics.Set_ChangesAllowed(Value: UnicodeString);
begin
  SetAttribute('ChangesAllowed', Value);
end;

function TXMLTransportVehicleCharacteristics.Get_TransportVehicleCode: IXMLTransportVehicleCode;
begin
  Result := ChildNodes['TransportVehicleCode'] as IXMLTransportVehicleCode;
end;

function TXMLTransportVehicleCharacteristics.Get_CodeValue: IXMLCodeValue;
begin
  Result := ChildNodes['CodeValue'] as IXMLCodeValue;
end;

function TXMLTransportVehicleCharacteristics.Get_CodeDescription: IXMLS255List;
begin
  Result := FCodeDescription;
end;

function TXMLTransportVehicleCharacteristics.Get_TransportVehicleMeasurements: IXMLTransportVehicleMeasurements;
begin
  Result := ChildNodes['TransportVehicleMeasurements'] as IXMLTransportVehicleMeasurements;
end;

function TXMLTransportVehicleCharacteristics.Get_TransportVehicleEquipment: IXMLTransportVehicleEquipmentList;
begin
  Result := FTransportVehicleEquipment;
end;

function TXMLTransportVehicleCharacteristics.Get_TransportVehicleCount: LongWord;
begin
  Result := ChildNodes['TransportVehicleCount'].NodeValue;
end;

procedure TXMLTransportVehicleCharacteristics.Set_TransportVehicleCount(Value: LongWord);
begin
  ChildNodes['TransportVehicleCount'].NodeValue := Value;
end;

function TXMLTransportVehicleCharacteristics.Get_TransportVehicleIdentifier: IXMLTransportVehicleIdentifierList;
begin
  Result := FTransportVehicleIdentifier;
end;

function TXMLTransportVehicleCharacteristics.Get_BrandAndModel: IXMLBrandAndModel;
begin
  Result := ChildNodes['BrandAndModel'] as IXMLBrandAndModel;
end;

function TXMLTransportVehicleCharacteristics.Get_TransportVehicleText: UnicodeString;
begin
  Result := ChildNodes['TransportVehicleText'].Text;
end;

procedure TXMLTransportVehicleCharacteristics.Set_TransportVehicleText(Value: UnicodeString);
begin
  ChildNodes['TransportVehicleText'].NodeValue := Value;
end;

function TXMLTransportVehicleCharacteristics.Get_TransportVehicleEmissionClass: IXMLCodeInfoList;
begin
  Result := FTransportVehicleEmissionClass;
end;

function TXMLTransportVehicleCharacteristics.Get_TransportVehicleDetail: IXMLTransportVehicleDetail;
begin
  Result := ChildNodes['TransportVehicleDetail'] as IXMLTransportVehicleDetail;
end;

{ TXMLTransportVehicleCode }

function TXMLTransportVehicleCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTransportVehicleCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTransportVehicleMeasurements }

procedure TXMLTransportVehicleMeasurements.AfterConstruction;
begin
  RegisterChildNode('TransportVehicleLength', TXMLMeasurement);
  RegisterChildNode('TransportVehicleWidth', TXMLMeasurement);
  RegisterChildNode('TransportVehicleHeight', TXMLMeasurement);
  RegisterChildNode('TransportVehicleWeight', TXMLMeasurement);
  inherited;
end;

function TXMLTransportVehicleMeasurements.Get_TransportVehicleLength: IXMLMeasurement;
begin
  Result := ChildNodes['TransportVehicleLength'] as IXMLMeasurement;
end;

function TXMLTransportVehicleMeasurements.Get_TransportVehicleWidth: IXMLMeasurement;
begin
  Result := ChildNodes['TransportVehicleWidth'] as IXMLMeasurement;
end;

function TXMLTransportVehicleMeasurements.Get_TransportVehicleHeight: IXMLMeasurement;
begin
  Result := ChildNodes['TransportVehicleHeight'] as IXMLMeasurement;
end;

function TXMLTransportVehicleMeasurements.Get_TransportVehicleWeight: IXMLMeasurement;
begin
  Result := ChildNodes['TransportVehicleWeight'] as IXMLMeasurement;
end;

{ TXMLTransportVehicleEquipment }

procedure TXMLTransportVehicleEquipment.AfterConstruction;
begin
  RegisterChildNode('TransportVehicleEquipmentCode', TXMLTransportVehicleEquipmentCode);
  RegisterChildNode('CodeValue', TXMLCodeValue);
  RegisterChildNode('TransportVehicleEquipmentDescription', TXMLTransportVehicleEquipmentDescription);
  FTransportVehicleEquipmentDescription := CreateCollection(TXMLTransportVehicleEquipmentDescriptionList, IXMLTransportVehicleEquipmentDescription, 'TransportVehicleEquipmentDescription') as IXMLTransportVehicleEquipmentDescriptionList;
  inherited;
end;

function TXMLTransportVehicleEquipment.Get_TransportVehicleEquipmentCode: IXMLTransportVehicleEquipmentCode;
begin
  Result := ChildNodes['TransportVehicleEquipmentCode'] as IXMLTransportVehicleEquipmentCode;
end;

function TXMLTransportVehicleEquipment.Get_CodeValue: IXMLCodeValue;
begin
  Result := ChildNodes['CodeValue'] as IXMLCodeValue;
end;

function TXMLTransportVehicleEquipment.Get_TransportVehicleEquipmentDescription: IXMLTransportVehicleEquipmentDescriptionList;
begin
  Result := FTransportVehicleEquipmentDescription;
end;

{ TXMLTransportVehicleEquipmentList }

function TXMLTransportVehicleEquipmentList.Add: IXMLTransportVehicleEquipment;
begin
  Result := AddItem(-1) as IXMLTransportVehicleEquipment;
end;

function TXMLTransportVehicleEquipmentList.Insert(const Index: Integer): IXMLTransportVehicleEquipment;
begin
  Result := AddItem(Index) as IXMLTransportVehicleEquipment;
end;

function TXMLTransportVehicleEquipmentList.Get_Item(Index: Integer): IXMLTransportVehicleEquipment;
begin
  Result := List[Index] as IXMLTransportVehicleEquipment;
end;

{ TXMLTransportVehicleEquipmentCode }

function TXMLTransportVehicleEquipmentCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTransportVehicleEquipmentCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTransportVehicleEquipmentDescription }

function TXMLTransportVehicleEquipmentDescription.Get_Language: UnicodeString;
begin
  Result := AttributeNodes['Language'].Text;
end;

procedure TXMLTransportVehicleEquipmentDescription.Set_Language(Value: UnicodeString);
begin
  SetAttribute('Language', Value);
end;

{ TXMLTransportVehicleEquipmentDescriptionList }

function TXMLTransportVehicleEquipmentDescriptionList.Add: IXMLTransportVehicleEquipmentDescription;
begin
  Result := AddItem(-1) as IXMLTransportVehicleEquipmentDescription;
end;

function TXMLTransportVehicleEquipmentDescriptionList.Insert(const Index: Integer): IXMLTransportVehicleEquipmentDescription;
begin
  Result := AddItem(Index) as IXMLTransportVehicleEquipmentDescription;
end;

function TXMLTransportVehicleEquipmentDescriptionList.Get_Item(Index: Integer): IXMLTransportVehicleEquipmentDescription;
begin
  Result := List[Index] as IXMLTransportVehicleEquipmentDescription;
end;

{ TXMLTransportVehicleIdentifier }

function TXMLTransportVehicleIdentifier.Get_TransportVehicleIdentifierType: UnicodeString;
begin
  Result := AttributeNodes['TransportVehicleIdentifierType'].Text;
end;

procedure TXMLTransportVehicleIdentifier.Set_TransportVehicleIdentifierType(Value: UnicodeString);
begin
  SetAttribute('TransportVehicleIdentifierType', Value);
end;

function TXMLTransportVehicleIdentifier.Get_StateOrProvince: UnicodeString;
begin
  Result := AttributeNodes['StateOrProvince'].Text;
end;

procedure TXMLTransportVehicleIdentifier.Set_StateOrProvince(Value: UnicodeString);
begin
  SetAttribute('StateOrProvince', Value);
end;

function TXMLTransportVehicleIdentifier.Get_ISOCountryCode: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCode'].Text;
end;

procedure TXMLTransportVehicleIdentifier.Set_ISOCountryCode(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCode', Value);
end;

function TXMLTransportVehicleIdentifier.Get_ISOCountryCodeAlpha3: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCodeAlpha3'].Text;
end;

procedure TXMLTransportVehicleIdentifier.Set_ISOCountryCodeAlpha3(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCodeAlpha3', Value);
end;

function TXMLTransportVehicleIdentifier.Get_ISOCountryCodeNumeric: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCodeNumeric'].Text;
end;

procedure TXMLTransportVehicleIdentifier.Set_ISOCountryCodeNumeric(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCodeNumeric', Value);
end;

function TXMLTransportVehicleIdentifier.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTransportVehicleIdentifier.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTransportVehicleIdentifierList }

function TXMLTransportVehicleIdentifierList.Add: IXMLTransportVehicleIdentifier;
begin
  Result := AddItem(-1) as IXMLTransportVehicleIdentifier;
end;

function TXMLTransportVehicleIdentifierList.Insert(const Index: Integer): IXMLTransportVehicleIdentifier;
begin
  Result := AddItem(Index) as IXMLTransportVehicleIdentifier;
end;

function TXMLTransportVehicleIdentifierList.Get_Item(Index: Integer): IXMLTransportVehicleIdentifier;
begin
  Result := List[Index] as IXMLTransportVehicleIdentifier;
end;

{ TXMLBrandAndModel }

procedure TXMLBrandAndModel.AfterConstruction;
begin
  RegisterChildNode('Model', TXMLModel);
  inherited;
end;

function TXMLBrandAndModel.Get_Brand: UnicodeString;
begin
  Result := ChildNodes['Brand'].Text;
end;

procedure TXMLBrandAndModel.Set_Brand(Value: UnicodeString);
begin
  ChildNodes['Brand'].NodeValue := Value;
end;

function TXMLBrandAndModel.Get_Model: IXMLModel;
begin
  Result := ChildNodes['Model'] as IXMLModel;
end;

{ TXMLModel }

function TXMLModel.Get_ModelYear: UnicodeString;
begin
  Result := AttributeNodes['ModelYear'].Text;
end;

procedure TXMLModel.Set_ModelYear(Value: UnicodeString);
begin
  SetAttribute('ModelYear', Value);
end;

{ TXMLTransportVehicleDetail }

function TXMLTransportVehicleDetail.Get_RearCouplingType: UnicodeString;
begin
  Result := AttributeNodes['RearCouplingType'].Text;
end;

procedure TXMLTransportVehicleDetail.Set_RearCouplingType(Value: UnicodeString);
begin
  SetAttribute('RearCouplingType', Value);
end;

{ TXMLChargeReference }

function TXMLChargeReference.Get_ChargeReferenceType: UnicodeString;
begin
  Result := AttributeNodes['ChargeReferenceType'].Text;
end;

procedure TXMLChargeReference.Set_ChargeReferenceType(Value: UnicodeString);
begin
  SetAttribute('ChargeReferenceType', Value);
end;

function TXMLChargeReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLChargeReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLChargeReferenceList }

function TXMLChargeReferenceList.Add: IXMLChargeReference;
begin
  Result := AddItem(-1) as IXMLChargeReference;
end;

function TXMLChargeReferenceList.Insert(const Index: Integer): IXMLChargeReference;
begin
  Result := AddItem(Index) as IXMLChargeReference;
end;

function TXMLChargeReferenceList.Get_Item(Index: Integer): IXMLChargeReference;
begin
  Result := List[Index] as IXMLChargeReference;
end;

{ TXMLChargeAmount }

procedure TXMLChargeAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLChargeAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLChargeNetAmount }

procedure TXMLChargeNetAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLChargeNetAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLInvoiceLineAmount }

procedure TXMLInvoiceLineAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLInvoiceLineAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLInvoiceDeliveryInformation }

procedure TXMLInvoiceDeliveryInformation.AfterConstruction;
begin
  RegisterChildNode('DeliveryMessageDate', TXMLDeliveryMessageDate);
  RegisterChildNode('DeliveryDate', TXMLDeliveryDate);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('ChargeInformation', TXMLChargeInformation);
  RegisterChildNode('CountryOfOrigin', TXMLCountryOfOrigin);
  RegisterChildNode('CountryOfDestination', TXMLCountryOfDestination);
  RegisterChildNode('CountryOfConsumption', TXMLCountryOfConsumption);
  RegisterChildNode('TransportVehicleIdentifier', TXMLTransportVehicleIdentifier);
  RegisterChildNode('TransportUnitIdentifier', TXMLTransportUnitIdentifier);
  RegisterChildNode('DocumentReferenceInformation', TXMLDocumentReferenceInformation);
  RegisterChildNode('DeliveryMessageReference', TXMLDeliveryMessageReference);
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FChargeInformation := CreateCollection(TXMLChargeInformationList, IXMLChargeInformation, 'ChargeInformation') as IXMLChargeInformationList;
  FTransportVehicleIdentifier := CreateCollection(TXMLTransportVehicleIdentifierList, IXMLTransportVehicleIdentifier, 'TransportVehicleIdentifier') as IXMLTransportVehicleIdentifierList;
  FTransportUnitIdentifier := CreateCollection(TXMLTransportUnitIdentifierList, IXMLTransportUnitIdentifier, 'TransportUnitIdentifier') as IXMLTransportUnitIdentifierList;
  FDocumentReferenceInformation := CreateCollection(TXMLDocumentReferenceInformationList, IXMLDocumentReferenceInformation, 'DocumentReferenceInformation') as IXMLDocumentReferenceInformationList;
  FDeliveryMessageReference := CreateCollection(TXMLDeliveryMessageReferenceList, IXMLDeliveryMessageReference, 'DeliveryMessageReference') as IXMLDeliveryMessageReferenceList;
  inherited;
end;

function TXMLInvoiceDeliveryInformation.Get_DeliveryMessageNumber: UnicodeString;
begin
  Result := ChildNodes['DeliveryMessageNumber'].Text;
end;

procedure TXMLInvoiceDeliveryInformation.Set_DeliveryMessageNumber(Value: UnicodeString);
begin
  ChildNodes['DeliveryMessageNumber'].NodeValue := Value;
end;

function TXMLInvoiceDeliveryInformation.Get_DeliveryMessageLineItemNumber: LongWord;
begin
  Result := ChildNodes['DeliveryMessageLineItemNumber'].NodeValue;
end;

procedure TXMLInvoiceDeliveryInformation.Set_DeliveryMessageLineItemNumber(Value: LongWord);
begin
  ChildNodes['DeliveryMessageLineItemNumber'].NodeValue := Value;
end;

function TXMLInvoiceDeliveryInformation.Get_DeliveryMessageDate: IXMLDeliveryMessageDate;
begin
  Result := ChildNodes['DeliveryMessageDate'] as IXMLDeliveryMessageDate;
end;

function TXMLInvoiceDeliveryInformation.Get_DeliveryDate: IXMLDeliveryDate;
begin
  Result := ChildNodes['DeliveryDate'] as IXMLDeliveryDate;
end;

function TXMLInvoiceDeliveryInformation.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLInvoiceDeliveryInformation.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLInvoiceDeliveryInformation.Get_ChargeInformation: IXMLChargeInformationList;
begin
  Result := FChargeInformation;
end;

function TXMLInvoiceDeliveryInformation.Get_CountryOfOrigin: IXMLCountryOfOrigin;
begin
  Result := ChildNodes['CountryOfOrigin'] as IXMLCountryOfOrigin;
end;

function TXMLInvoiceDeliveryInformation.Get_CountryOfDestination: IXMLCountryOfDestination;
begin
  Result := ChildNodes['CountryOfDestination'] as IXMLCountryOfDestination;
end;

function TXMLInvoiceDeliveryInformation.Get_CountryOfConsumption: IXMLCountryOfConsumption;
begin
  Result := ChildNodes['CountryOfConsumption'] as IXMLCountryOfConsumption;
end;

function TXMLInvoiceDeliveryInformation.Get_TransportVehicleIdentifier: IXMLTransportVehicleIdentifierList;
begin
  Result := FTransportVehicleIdentifier;
end;

function TXMLInvoiceDeliveryInformation.Get_TransportUnitIdentifier: IXMLTransportUnitIdentifierList;
begin
  Result := FTransportUnitIdentifier;
end;

function TXMLInvoiceDeliveryInformation.Get_DocumentReferenceInformation: IXMLDocumentReferenceInformationList;
begin
  Result := FDocumentReferenceInformation;
end;

function TXMLInvoiceDeliveryInformation.Get_DeliveryMessageReference: IXMLDeliveryMessageReferenceList;
begin
  Result := FDeliveryMessageReference;
end;

{ TXMLInvoiceDeliveryInformationList }

function TXMLInvoiceDeliveryInformationList.Add: IXMLInvoiceDeliveryInformation;
begin
  Result := AddItem(-1) as IXMLInvoiceDeliveryInformation;
end;

function TXMLInvoiceDeliveryInformationList.Insert(const Index: Integer): IXMLInvoiceDeliveryInformation;
begin
  Result := AddItem(Index) as IXMLInvoiceDeliveryInformation;
end;

function TXMLInvoiceDeliveryInformationList.Get_Item(Index: Integer): IXMLInvoiceDeliveryInformation;
begin
  Result := List[Index] as IXMLInvoiceDeliveryInformation;
end;

{ TXMLDeliveryMessageDate }

procedure TXMLDeliveryMessageDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDeliveryMessageDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDeliveryMessageDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDeliveryMessageDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLDeliveryDate }

procedure TXMLDeliveryDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDeliveryDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDeliveryDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDeliveryDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLDeliveryMessageReference }

function TXMLDeliveryMessageReference.Get_DeliveryMessageReferenceType: UnicodeString;
begin
  Result := AttributeNodes['DeliveryMessageReferenceType'].Text;
end;

procedure TXMLDeliveryMessageReference.Set_DeliveryMessageReferenceType(Value: UnicodeString);
begin
  SetAttribute('DeliveryMessageReferenceType', Value);
end;

function TXMLDeliveryMessageReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLDeliveryMessageReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLDeliveryMessageReferenceList }

function TXMLDeliveryMessageReferenceList.Add: IXMLDeliveryMessageReference;
begin
  Result := AddItem(-1) as IXMLDeliveryMessageReference;
end;

function TXMLDeliveryMessageReferenceList.Insert(const Index: Integer): IXMLDeliveryMessageReference;
begin
  Result := AddItem(Index) as IXMLDeliveryMessageReference;
end;

function TXMLDeliveryMessageReferenceList.Get_Item(Index: Integer): IXMLDeliveryMessageReference;
begin
  Result := List[Index] as IXMLDeliveryMessageReference;
end;

{ TXMLMillCharacteristics }

procedure TXMLMillCharacteristics.AfterConstruction;
begin
  RegisterChildNode('MillParty', TXMLParty);
  inherited;
end;

function TXMLMillCharacteristics.Get_MillParty: IXMLParty;
begin
  Result := ChildNodes['MillParty'] as IXMLParty;
end;

function TXMLMillCharacteristics.Get_MachineID: UnicodeString;
begin
  Result := ChildNodes['MachineID'].Text;
end;

procedure TXMLMillCharacteristics.Set_MachineID(Value: UnicodeString);
begin
  ChildNodes['MachineID'].NodeValue := Value;
end;

{ TXMLItemInformation }

procedure TXMLItemInformation.AfterConstruction;
begin
  RegisterChildNode('Identifier', TXMLIdentifierS60);
  RegisterChildNode('MillCharacteristics', TXMLMillCharacteristics);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FIdentifier := CreateCollection(TXMLIdentifierS60List, IXMLIdentifierS60, 'Identifier') as IXMLIdentifierS60List;
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLItemInformation.Get_ItemType: UnicodeString;
begin
  Result := AttributeNodes['ItemType'].Text;
end;

procedure TXMLItemInformation.Set_ItemType(Value: UnicodeString);
begin
  SetAttribute('ItemType', Value);
end;

function TXMLItemInformation.Get_Identifier: IXMLIdentifierS60List;
begin
  Result := FIdentifier;
end;

function TXMLItemInformation.Get_MillCharacteristics: IXMLMillCharacteristics;
begin
  Result := ChildNodes['MillCharacteristics'] as IXMLMillCharacteristics;
end;

function TXMLItemInformation.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLItemInformation.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLItemInformation.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

{ TXMLItemInformationList }

function TXMLItemInformationList.Add: IXMLItemInformation;
begin
  Result := AddItem(-1) as IXMLItemInformation;
end;

function TXMLItemInformationList.Insert(const Index: Integer): IXMLItemInformation;
begin
  Result := AddItem(Index) as IXMLItemInformation;
end;

function TXMLItemInformationList.Get_Item(Index: Integer): IXMLItemInformation;
begin
  Result := List[Index] as IXMLItemInformation;
end;

{ TXMLTransportModeCharacteristics }

procedure TXMLTransportModeCharacteristics.AfterConstruction;
begin
  RegisterChildNode('TransportModeCode', TXMLTransportModeCode);
  inherited;
end;

function TXMLTransportModeCharacteristics.Get_TransportModeType: UnicodeString;
begin
  Result := AttributeNodes['TransportModeType'].Text;
end;

procedure TXMLTransportModeCharacteristics.Set_TransportModeType(Value: UnicodeString);
begin
  SetAttribute('TransportModeType', Value);
end;

function TXMLTransportModeCharacteristics.Get_TransportModeCode: IXMLTransportModeCode;
begin
  Result := ChildNodes['TransportModeCode'] as IXMLTransportModeCode;
end;

function TXMLTransportModeCharacteristics.Get_TransportModeText: UnicodeString;
begin
  Result := ChildNodes['TransportModeText'].Text;
end;

procedure TXMLTransportModeCharacteristics.Set_TransportModeText(Value: UnicodeString);
begin
  ChildNodes['TransportModeText'].NodeValue := Value;
end;

{ TXMLTransportModeCharacteristicsList }

function TXMLTransportModeCharacteristicsList.Add: IXMLTransportModeCharacteristics;
begin
  Result := AddItem(-1) as IXMLTransportModeCharacteristics;
end;

function TXMLTransportModeCharacteristicsList.Insert(const Index: Integer): IXMLTransportModeCharacteristics;
begin
  Result := AddItem(Index) as IXMLTransportModeCharacteristics;
end;

function TXMLTransportModeCharacteristicsList.Get_Item(Index: Integer): IXMLTransportModeCharacteristics;
begin
  Result := List[Index] as IXMLTransportModeCharacteristics;
end;

{ TXMLTransportModeCode }

function TXMLTransportModeCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTransportModeCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLDeliveryDateWindow }

procedure TXMLDeliveryDateWindow.AfterConstruction;
begin
  RegisterChildNode('DateTimeRange', TXMLDateTimeRange);
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDeliveryDateWindow.Get_DeliveryDateType: UnicodeString;
begin
  Result := AttributeNodes['DeliveryDateType'].Text;
end;

procedure TXMLDeliveryDateWindow.Set_DeliveryDateType(Value: UnicodeString);
begin
  SetAttribute('DeliveryDateType', Value);
end;

function TXMLDeliveryDateWindow.Get_DateTimeRange: IXMLDateTimeRange;
begin
  Result := ChildNodes['DateTimeRange'] as IXMLDateTimeRange;
end;

function TXMLDeliveryDateWindow.Get_Year: UnicodeString;
begin
  Result := ChildNodes['Year'].Text;
end;

procedure TXMLDeliveryDateWindow.Set_Year(Value: UnicodeString);
begin
  ChildNodes['Year'].NodeValue := Value;
end;

function TXMLDeliveryDateWindow.Get_YearMonth: UnicodeString;
begin
  Result := ChildNodes['YearMonth'].Text;
end;

procedure TXMLDeliveryDateWindow.Set_YearMonth(Value: UnicodeString);
begin
  ChildNodes['YearMonth'].NodeValue := Value;
end;

function TXMLDeliveryDateWindow.Get_Month: LongWord;
begin
  Result := ChildNodes['Month'].NodeValue;
end;

procedure TXMLDeliveryDateWindow.Set_Month(Value: LongWord);
begin
  ChildNodes['Month'].NodeValue := Value;
end;

function TXMLDeliveryDateWindow.Get_Week: UnicodeString;
begin
  Result := ChildNodes['Week'].Text;
end;

procedure TXMLDeliveryDateWindow.Set_Week(Value: UnicodeString);
begin
  ChildNodes['Week'].NodeValue := Value;
end;

function TXMLDeliveryDateWindow.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDeliveryDateWindow.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDeliveryDateWindow.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLDeliveryDateWindowList }

function TXMLDeliveryDateWindowList.Add: IXMLDeliveryDateWindow;
begin
  Result := AddItem(-1) as IXMLDeliveryDateWindow;
end;

function TXMLDeliveryDateWindowList.Insert(const Index: Integer): IXMLDeliveryDateWindow;
begin
  Result := AddItem(Index) as IXMLDeliveryDateWindow;
end;

function TXMLDeliveryDateWindowList.Get_Item(Index: Integer): IXMLDeliveryDateWindow;
begin
  Result := List[Index] as IXMLDeliveryDateWindow;
end;

{ TXMLTaxStatement }

procedure TXMLTaxStatement.AfterConstruction;
begin
  RegisterChildNode('TaxStatementCode', TXMLTaxStatementCode);
  inherited;
end;

function TXMLTaxStatement.Get_TaxStatementCode: IXMLTaxStatementCode;
begin
  Result := ChildNodes['TaxStatementCode'] as IXMLTaxStatementCode;
end;

function TXMLTaxStatement.Get_TaxStatementDescription: UnicodeString;
begin
  Result := ChildNodes['TaxStatementDescription'].Text;
end;

procedure TXMLTaxStatement.Set_TaxStatementDescription(Value: UnicodeString);
begin
  ChildNodes['TaxStatementDescription'].NodeValue := Value;
end;

{ TXMLTaxStatementCode }

function TXMLTaxStatementCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTaxStatementCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLStatisticalGoodsInformation }

procedure TXMLStatisticalGoodsInformation.AfterConstruction;
begin
  RegisterChildNode('CommodityGoodsCode', TXMLCommodityGoodsCode);
  RegisterChildNode('PriceDetails', TXMLPriceDetails);
  inherited;
end;

function TXMLStatisticalGoodsInformation.Get_CommodityGoodsCode: IXMLCommodityGoodsCode;
begin
  Result := ChildNodes['CommodityGoodsCode'] as IXMLCommodityGoodsCode;
end;

function TXMLStatisticalGoodsInformation.Get_PriceDetails: IXMLPriceDetails;
begin
  Result := ChildNodes['PriceDetails'] as IXMLPriceDetails;
end;

{ TXMLCommodityGoodsCode }

function TXMLCommodityGoodsCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLCommodityGoodsCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLInvoiceSummary }

procedure TXMLInvoiceSummary.AfterConstruction;
begin
  RegisterChildNode('TotalQuantity', TXMLTotalQuantity);
  RegisterChildNode('TotalInformationalQuantity', TXMLTotalInformationalQuantity);
  RegisterChildNode('LineItemSubTotal', TXMLLineItemSubTotal);
  RegisterChildNode('TotalAdjustments', TXMLTotalAdjustments);
  RegisterChildNode('TotalTaxAmount', TXMLTotalTaxAmount);
  RegisterChildNode('TotalNetAmount', TXMLTotalNetAmount);
  RegisterChildNode('TotalAmount', TXMLTotalAmount);
  RegisterChildNode('InformationalAmount', TXMLInformationalAmount);
  RegisterChildNode('TermsOfPayment', TXMLTermsOfPayment);
  RegisterChildNode('TotalNetOfTermsDiscount', TXMLTotalNetOfTermsDiscount);
  RegisterChildNode('TermsAndDisclaimers', TXMLTermsAndDisclaimers);
  RegisterChildNode('TaxStatement', TXMLTaxStatement);
  FTotalQuantity := CreateCollection(TXMLTotalQuantityList, IXMLTotalQuantity, 'TotalQuantity') as IXMLTotalQuantityList;
  FTotalInformationalQuantity := CreateCollection(TXMLTotalInformationalQuantityList, IXMLTotalInformationalQuantity, 'TotalInformationalQuantity') as IXMLTotalInformationalQuantityList;
  FInformationalAmount := CreateCollection(TXMLInformationalAmountList, IXMLInformationalAmount, 'InformationalAmount') as IXMLInformationalAmountList;
  FTermsOfPayment := CreateCollection(TXMLTermsOfPaymentList, IXMLTermsOfPayment, 'TermsOfPayment') as IXMLTermsOfPaymentList;
  FTotalNetOfTermsDiscount := CreateCollection(TXMLTotalNetOfTermsDiscountList, IXMLTotalNetOfTermsDiscount, 'TotalNetOfTermsDiscount') as IXMLTotalNetOfTermsDiscountList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  FTermsAndDisclaimers := CreateCollection(TXMLTermsAndDisclaimersList, IXMLTermsAndDisclaimers, 'TermsAndDisclaimers') as IXMLTermsAndDisclaimersList;
  inherited;
end;

function TXMLInvoiceSummary.Get_TotalNumberOfLineItems: LongWord;
begin
  Result := ChildNodes['TotalNumberOfLineItems'].NodeValue;
end;

procedure TXMLInvoiceSummary.Set_TotalNumberOfLineItems(Value: LongWord);
begin
  ChildNodes['TotalNumberOfLineItems'].NodeValue := Value;
end;

function TXMLInvoiceSummary.Get_TotalQuantity: IXMLTotalQuantityList;
begin
  Result := FTotalQuantity;
end;

function TXMLInvoiceSummary.Get_TotalInformationalQuantity: IXMLTotalInformationalQuantityList;
begin
  Result := FTotalInformationalQuantity;
end;

function TXMLInvoiceSummary.Get_LineItemSubTotal: IXMLLineItemSubTotal;
begin
  Result := ChildNodes['LineItemSubTotal'] as IXMLLineItemSubTotal;
end;

function TXMLInvoiceSummary.Get_TotalAdjustments: IXMLTotalAdjustments;
begin
  Result := ChildNodes['TotalAdjustments'] as IXMLTotalAdjustments;
end;

function TXMLInvoiceSummary.Get_TotalTaxAmount: IXMLTotalTaxAmount;
begin
  Result := ChildNodes['TotalTaxAmount'] as IXMLTotalTaxAmount;
end;

function TXMLInvoiceSummary.Get_TotalNetAmount: IXMLTotalNetAmount;
begin
  Result := ChildNodes['TotalNetAmount'] as IXMLTotalNetAmount;
end;

function TXMLInvoiceSummary.Get_TotalAmount: IXMLTotalAmount;
begin
  Result := ChildNodes['TotalAmount'] as IXMLTotalAmount;
end;

function TXMLInvoiceSummary.Get_InformationalAmount: IXMLInformationalAmountList;
begin
  Result := FInformationalAmount;
end;

function TXMLInvoiceSummary.Get_TermsOfPayment: IXMLTermsOfPaymentList;
begin
  Result := FTermsOfPayment;
end;

function TXMLInvoiceSummary.Get_TotalNetOfTermsDiscount: IXMLTotalNetOfTermsDiscountList;
begin
  Result := FTotalNetOfTermsDiscount;
end;

function TXMLInvoiceSummary.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLInvoiceSummary.Get_TermsAndDisclaimers: IXMLTermsAndDisclaimersList;
begin
  Result := FTermsAndDisclaimers;
end;

function TXMLInvoiceSummary.Get_TaxStatement: IXMLTaxStatement;
begin
  Result := ChildNodes['TaxStatement'] as IXMLTaxStatement;
end;

{ TXMLTotalQuantity }

function TXMLTotalQuantity.Get_QuantityType: UnicodeString;
begin
  Result := AttributeNodes['QuantityType'].Text;
end;

procedure TXMLTotalQuantity.Set_QuantityType(Value: UnicodeString);
begin
  SetAttribute('QuantityType', Value);
end;

function TXMLTotalQuantity.Get_QuantityTypeContext: UnicodeString;
begin
  Result := AttributeNodes['QuantityTypeContext'].Text;
end;

procedure TXMLTotalQuantity.Set_QuantityTypeContext(Value: UnicodeString);
begin
  SetAttribute('QuantityTypeContext', Value);
end;

function TXMLTotalQuantity.Get_AdjustmentType: UnicodeString;
begin
  Result := AttributeNodes['AdjustmentType'].Text;
end;

procedure TXMLTotalQuantity.Set_AdjustmentType(Value: UnicodeString);
begin
  SetAttribute('AdjustmentType', Value);
end;

function TXMLTotalQuantity.Get_MeasuringMethodType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethodType'].Text;
end;

procedure TXMLTotalQuantity.Set_MeasuringMethodType(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethodType', Value);
end;

function TXMLTotalQuantity.Get_MeasuringAgency: UnicodeString;
begin
  Result := AttributeNodes['MeasuringAgency'].Text;
end;

procedure TXMLTotalQuantity.Set_MeasuringAgency(Value: UnicodeString);
begin
  SetAttribute('MeasuringAgency', Value);
end;

function TXMLTotalQuantity.Get_MeasuringMethod: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethod'].Text;
end;

procedure TXMLTotalQuantity.Set_MeasuringMethod(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethod', Value);
end;

{ TXMLTotalQuantityList }

function TXMLTotalQuantityList.Add: IXMLTotalQuantity;
begin
  Result := AddItem(-1) as IXMLTotalQuantity;
end;

function TXMLTotalQuantityList.Insert(const Index: Integer): IXMLTotalQuantity;
begin
  Result := AddItem(Index) as IXMLTotalQuantity;
end;

function TXMLTotalQuantityList.Get_Item(Index: Integer): IXMLTotalQuantity;
begin
  Result := List[Index] as IXMLTotalQuantity;
end;

{ TXMLTotalInformationalQuantity }

function TXMLTotalInformationalQuantity.Get_QuantityType: UnicodeString;
begin
  Result := AttributeNodes['QuantityType'].Text;
end;

procedure TXMLTotalInformationalQuantity.Set_QuantityType(Value: UnicodeString);
begin
  SetAttribute('QuantityType', Value);
end;

function TXMLTotalInformationalQuantity.Get_QuantityTypeContext: UnicodeString;
begin
  Result := AttributeNodes['QuantityTypeContext'].Text;
end;

procedure TXMLTotalInformationalQuantity.Set_QuantityTypeContext(Value: UnicodeString);
begin
  SetAttribute('QuantityTypeContext', Value);
end;

function TXMLTotalInformationalQuantity.Get_AdjustmentType: UnicodeString;
begin
  Result := AttributeNodes['AdjustmentType'].Text;
end;

procedure TXMLTotalInformationalQuantity.Set_AdjustmentType(Value: UnicodeString);
begin
  SetAttribute('AdjustmentType', Value);
end;

function TXMLTotalInformationalQuantity.Get_MeasuringMethodType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethodType'].Text;
end;

procedure TXMLTotalInformationalQuantity.Set_MeasuringMethodType(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethodType', Value);
end;

function TXMLTotalInformationalQuantity.Get_MeasuringAgency: UnicodeString;
begin
  Result := AttributeNodes['MeasuringAgency'].Text;
end;

procedure TXMLTotalInformationalQuantity.Set_MeasuringAgency(Value: UnicodeString);
begin
  SetAttribute('MeasuringAgency', Value);
end;

function TXMLTotalInformationalQuantity.Get_MeasuringMethod: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethod'].Text;
end;

procedure TXMLTotalInformationalQuantity.Set_MeasuringMethod(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethod', Value);
end;

{ TXMLTotalInformationalQuantityList }

function TXMLTotalInformationalQuantityList.Add: IXMLTotalInformationalQuantity;
begin
  Result := AddItem(-1) as IXMLTotalInformationalQuantity;
end;

function TXMLTotalInformationalQuantityList.Insert(const Index: Integer): IXMLTotalInformationalQuantity;
begin
  Result := AddItem(Index) as IXMLTotalInformationalQuantity;
end;

function TXMLTotalInformationalQuantityList.Get_Item(Index: Integer): IXMLTotalInformationalQuantity;
begin
  Result := List[Index] as IXMLTotalInformationalQuantity;
end;

{ TXMLLineItemSubTotal }

procedure TXMLLineItemSubTotal.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLLineItemSubTotal.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTotalAdjustments }

procedure TXMLTotalAdjustments.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLTotalAdjustments.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTotalTaxAmount }

procedure TXMLTotalTaxAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLTotalTaxAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTotalNetAmount }

procedure TXMLTotalNetAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLTotalNetAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTotalAmount }

procedure TXMLTotalAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLTotalAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTermsOfPayment }

procedure TXMLTermsOfPayment.AfterConstruction;
begin
  RegisterChildNode('TermsOfPaymentCode', TXMLTermsOfPaymentCode);
  RegisterChildNode('TermsBasisDate', TXMLTermsBasisDate);
  RegisterChildNode('TermsDiscountPercent', TXMLMeasurement);
  RegisterChildNode('TermsDiscountDueDate', TXMLTermsDiscountDueDate);
  RegisterChildNode('TermsNetDueDate', TXMLTermsNetDueDate);
  RegisterChildNode('ExchangeRate', TXMLExchangeRate);
  inherited;
end;

function TXMLTermsOfPayment.Get_TermsBasisDateType: UnicodeString;
begin
  Result := AttributeNodes['TermsBasisDateType'].Text;
end;

procedure TXMLTermsOfPayment.Set_TermsBasisDateType(Value: UnicodeString);
begin
  SetAttribute('TermsBasisDateType', Value);
end;

function TXMLTermsOfPayment.Get_TermsOfPaymentCode: IXMLTermsOfPaymentCode;
begin
  Result := ChildNodes['TermsOfPaymentCode'] as IXMLTermsOfPaymentCode;
end;

function TXMLTermsOfPayment.Get_TermsDescription: UnicodeString;
begin
  Result := ChildNodes['TermsDescription'].Text;
end;

procedure TXMLTermsOfPayment.Set_TermsDescription(Value: UnicodeString);
begin
  ChildNodes['TermsDescription'].NodeValue := Value;
end;

function TXMLTermsOfPayment.Get_TermsBasisDate: IXMLTermsBasisDate;
begin
  Result := ChildNodes['TermsBasisDate'] as IXMLTermsBasisDate;
end;

function TXMLTermsOfPayment.Get_TermsDiscountPercent: IXMLMeasurement;
begin
  Result := ChildNodes['TermsDiscountPercent'] as IXMLMeasurement;
end;

function TXMLTermsOfPayment.Get_TermsDiscountDueDate: IXMLTermsDiscountDueDate;
begin
  Result := ChildNodes['TermsDiscountDueDate'] as IXMLTermsDiscountDueDate;
end;

function TXMLTermsOfPayment.Get_TermsDiscountDaysDue: LongWord;
begin
  Result := ChildNodes['TermsDiscountDaysDue'].NodeValue;
end;

procedure TXMLTermsOfPayment.Set_TermsDiscountDaysDue(Value: LongWord);
begin
  ChildNodes['TermsDiscountDaysDue'].NodeValue := Value;
end;

function TXMLTermsOfPayment.Get_TermsNetDueDate: IXMLTermsNetDueDate;
begin
  Result := ChildNodes['TermsNetDueDate'] as IXMLTermsNetDueDate;
end;

function TXMLTermsOfPayment.Get_TermsNetDaysDue: LongWord;
begin
  Result := ChildNodes['TermsNetDaysDue'].NodeValue;
end;

procedure TXMLTermsOfPayment.Set_TermsNetDaysDue(Value: LongWord);
begin
  ChildNodes['TermsNetDaysDue'].NodeValue := Value;
end;

function TXMLTermsOfPayment.Get_TermsInterestPenaltyPercent: Double;
begin
  Result := XmlStrToFloatExt(ChildNodes['TermsInterestPenaltyPercent'].Text);
end;

procedure TXMLTermsOfPayment.Set_TermsInterestPenaltyPercent(Value: Double);
begin
  ChildNodes['TermsInterestPenaltyPercent'].NodeValue := Value;
end;

function TXMLTermsOfPayment.Get_ExchangeRate: IXMLExchangeRate;
begin
  Result := ChildNodes['ExchangeRate'] as IXMLExchangeRate;
end;

function TXMLTermsOfPayment.Get_MethodOfPayment: UnicodeString;
begin
  Result := ChildNodes['MethodOfPayment'].Text;
end;

procedure TXMLTermsOfPayment.Set_MethodOfPayment(Value: UnicodeString);
begin
  ChildNodes['MethodOfPayment'].NodeValue := Value;
end;

{ TXMLTermsOfPaymentList }

function TXMLTermsOfPaymentList.Add: IXMLTermsOfPayment;
begin
  Result := AddItem(-1) as IXMLTermsOfPayment;
end;

function TXMLTermsOfPaymentList.Insert(const Index: Integer): IXMLTermsOfPayment;
begin
  Result := AddItem(Index) as IXMLTermsOfPayment;
end;

function TXMLTermsOfPaymentList.Get_Item(Index: Integer): IXMLTermsOfPayment;
begin
  Result := List[Index] as IXMLTermsOfPayment;
end;

{ TXMLTermsOfPaymentCode }

function TXMLTermsOfPaymentCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTermsOfPaymentCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTermsBasisDate }

procedure TXMLTermsBasisDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLTermsBasisDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLTermsBasisDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLTermsBasisDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLTermsDiscountDueDate }

procedure TXMLTermsDiscountDueDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLTermsDiscountDueDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLTermsDiscountDueDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLTermsDiscountDueDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLTermsNetDueDate }

procedure TXMLTermsNetDueDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLTermsNetDueDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLTermsNetDueDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLTermsNetDueDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLTotalNetOfTermsDiscount }

procedure TXMLTotalNetOfTermsDiscount.AfterConstruction;
begin
  RegisterChildNode('AmountSubjectToTermsDiscount', TXMLAmountSubjectToTermsDiscount);
  RegisterChildNode('TotalTermsDiscountNetAmount', TXMLTotalTermsDiscountNetAmount);
  RegisterChildNode('TotalTermsDiscountNetAmountTax', TXMLTotalTermsDiscountNetAmountTax);
  RegisterChildNode('TotalTermsDiscountAmount', TXMLTotalTermsDiscountAmount);
  RegisterChildNode('TotalTermsDiscountNetAmountDue', TXMLTotalTermsDiscountNetAmountDue);
  RegisterChildNode('TotalTermsDiscountTaxAmount', TXMLTotalTermsDiscountTaxAmount);
  RegisterChildNode('TotalTermsDiscountAmountDue', TXMLTotalTermsDiscountAmountDue);
  RegisterChildNode('InformationalAmount', TXMLInformationalAmount);
  FInformationalAmount := CreateCollection(TXMLInformationalAmountList, IXMLInformationalAmount, 'InformationalAmount') as IXMLInformationalAmountList;
  inherited;
end;

function TXMLTotalNetOfTermsDiscount.Get_AmountSubjectToTermsDiscount: IXMLAmountSubjectToTermsDiscount;
begin
  Result := ChildNodes['AmountSubjectToTermsDiscount'] as IXMLAmountSubjectToTermsDiscount;
end;

function TXMLTotalNetOfTermsDiscount.Get_TotalTermsDiscountNetAmount: IXMLTotalTermsDiscountNetAmount;
begin
  Result := ChildNodes['TotalTermsDiscountNetAmount'] as IXMLTotalTermsDiscountNetAmount;
end;

function TXMLTotalNetOfTermsDiscount.Get_TotalTermsDiscountNetAmountTax: IXMLTotalTermsDiscountNetAmountTax;
begin
  Result := ChildNodes['TotalTermsDiscountNetAmountTax'] as IXMLTotalTermsDiscountNetAmountTax;
end;

function TXMLTotalNetOfTermsDiscount.Get_TotalTermsDiscountAmount: IXMLTotalTermsDiscountAmount;
begin
  Result := ChildNodes['TotalTermsDiscountAmount'] as IXMLTotalTermsDiscountAmount;
end;

function TXMLTotalNetOfTermsDiscount.Get_TotalTermsDiscountNetAmountDue: IXMLTotalTermsDiscountNetAmountDue;
begin
  Result := ChildNodes['TotalTermsDiscountNetAmountDue'] as IXMLTotalTermsDiscountNetAmountDue;
end;

function TXMLTotalNetOfTermsDiscount.Get_TotalTermsDiscountTaxAmount: IXMLTotalTermsDiscountTaxAmount;
begin
  Result := ChildNodes['TotalTermsDiscountTaxAmount'] as IXMLTotalTermsDiscountTaxAmount;
end;

function TXMLTotalNetOfTermsDiscount.Get_TotalTermsDiscountAmountDue: IXMLTotalTermsDiscountAmountDue;
begin
  Result := ChildNodes['TotalTermsDiscountAmountDue'] as IXMLTotalTermsDiscountAmountDue;
end;

function TXMLTotalNetOfTermsDiscount.Get_InformationalAmount: IXMLInformationalAmountList;
begin
  Result := FInformationalAmount;
end;

{ TXMLTotalNetOfTermsDiscountList }

function TXMLTotalNetOfTermsDiscountList.Add: IXMLTotalNetOfTermsDiscount;
begin
  Result := AddItem(-1) as IXMLTotalNetOfTermsDiscount;
end;

function TXMLTotalNetOfTermsDiscountList.Insert(const Index: Integer): IXMLTotalNetOfTermsDiscount;
begin
  Result := AddItem(Index) as IXMLTotalNetOfTermsDiscount;
end;

function TXMLTotalNetOfTermsDiscountList.Get_Item(Index: Integer): IXMLTotalNetOfTermsDiscount;
begin
  Result := List[Index] as IXMLTotalNetOfTermsDiscount;
end;

{ TXMLAmountSubjectToTermsDiscount }

procedure TXMLAmountSubjectToTermsDiscount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLAmountSubjectToTermsDiscount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTotalTermsDiscountNetAmount }

procedure TXMLTotalTermsDiscountNetAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLTotalTermsDiscountNetAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTotalTermsDiscountNetAmountTax }

procedure TXMLTotalTermsDiscountNetAmountTax.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLTotalTermsDiscountNetAmountTax.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTotalTermsDiscountAmount }

procedure TXMLTotalTermsDiscountAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLTotalTermsDiscountAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTotalTermsDiscountNetAmountDue }

procedure TXMLTotalTermsDiscountNetAmountDue.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLTotalTermsDiscountNetAmountDue.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTotalTermsDiscountTaxAmount }

procedure TXMLTotalTermsDiscountTaxAmount.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLTotalTermsDiscountTaxAmount.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTotalTermsDiscountAmountDue }

procedure TXMLTotalTermsDiscountAmountDue.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  inherited;
end;

function TXMLTotalTermsDiscountAmountDue.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

{ TXMLTermsAndDisclaimers }

function TXMLTermsAndDisclaimers.Get_Language: UnicodeString;
begin
  Result := AttributeNodes['Language'].Text;
end;

procedure TXMLTermsAndDisclaimers.Set_Language(Value: UnicodeString);
begin
  SetAttribute('Language', Value);
end;

{ TXMLTermsAndDisclaimersList }

function TXMLTermsAndDisclaimersList.Add: IXMLTermsAndDisclaimers;
begin
  Result := AddItem(-1) as IXMLTermsAndDisclaimers;
end;

function TXMLTermsAndDisclaimersList.Insert(const Index: Integer): IXMLTermsAndDisclaimers;
begin
  Result := AddItem(Index) as IXMLTermsAndDisclaimers;
end;

function TXMLTermsAndDisclaimersList.Get_Item(Index: Integer): IXMLTermsAndDisclaimers;
begin
  Result := List[Index] as IXMLTermsAndDisclaimers;
end;

{ TXMLBusinessParty }

procedure TXMLBusinessParty.AfterConstruction;
begin
  RegisterChildNode('PartyIdentifier', TXMLPartyIdentifier);
  RegisterChildNode('NameAddress', TXMLNameAddress);
  RegisterChildNode('URL', TXMLURL);
  RegisterChildNode('CommonContact', TXMLCommonContact);
  FPartyIdentifier := CreateCollection(TXMLPartyIdentifierList, IXMLPartyIdentifier, 'PartyIdentifier') as IXMLPartyIdentifierList;
  FCommonContact := CreateCollection(TXMLCommonContactList, IXMLCommonContact, 'CommonContact') as IXMLCommonContactList;
  inherited;
end;

function TXMLBusinessParty.Get_PartyType: UnicodeString;
begin
  Result := AttributeNodes['PartyType'].Text;
end;

procedure TXMLBusinessParty.Set_PartyType(Value: UnicodeString);
begin
  SetAttribute('PartyType', Value);
end;

function TXMLBusinessParty.Get_PartyIdentifier: IXMLPartyIdentifierList;
begin
  Result := FPartyIdentifier;
end;

function TXMLBusinessParty.Get_NameAddress: IXMLNameAddress;
begin
  Result := ChildNodes['NameAddress'] as IXMLNameAddress;
end;

function TXMLBusinessParty.Get_URL: IXMLURL;
begin
  Result := ChildNodes['URL'] as IXMLURL;
end;

function TXMLBusinessParty.Get_CommonContact: IXMLCommonContactList;
begin
  Result := FCommonContact;
end;

{ TXMLCurrencyPerUnit }

procedure TXMLCurrencyPerUnit.AfterConstruction;
begin
  RegisterChildNode('CurrencyValue', TXMLCurrencyValue);
  RegisterChildNode('Value', TXMLValue);
  RegisterChildNode('RangeMin', TXMLRangeMin);
  RegisterChildNode('RangeMax', TXMLRangeMax);
  inherited;
end;

function TXMLCurrencyPerUnit.Get_CurrencyValue: IXMLCurrencyValue;
begin
  Result := ChildNodes['CurrencyValue'] as IXMLCurrencyValue;
end;

function TXMLCurrencyPerUnit.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

function TXMLCurrencyPerUnit.Get_RangeMin: IXMLRangeMin;
begin
  Result := ChildNodes['RangeMin'] as IXMLRangeMin;
end;

function TXMLCurrencyPerUnit.Get_RangeMax: IXMLRangeMax;
begin
  Result := ChildNodes['RangeMax'] as IXMLRangeMax;
end;

{ TXMLDeliveryInformationType }

procedure TXMLDeliveryInformationType.AfterConstruction;
begin
  RegisterChildNode('DeliveryMessageDate', TXMLDeliveryMessageDate);
  RegisterChildNode('DeliveryDate', TXMLDeliveryDate);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('ChargeInformation', TXMLChargeInformation);
  RegisterChildNode('CountryOfOrigin', TXMLCountryOfOrigin);
  RegisterChildNode('CountryOfDestination', TXMLCountryOfDestination);
  RegisterChildNode('CountryOfConsumption', TXMLCountryOfConsumption);
  RegisterChildNode('TransportVehicleIdentifier', TXMLTransportVehicleIdentifier);
  RegisterChildNode('TransportUnitIdentifier', TXMLTransportUnitIdentifier);
  RegisterChildNode('DeliveryMessageReference', TXMLDeliveryMessageReference);
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FChargeInformation := CreateCollection(TXMLChargeInformationList, IXMLChargeInformation, 'ChargeInformation') as IXMLChargeInformationList;
  FTransportVehicleIdentifier := CreateCollection(TXMLTransportVehicleIdentifierList, IXMLTransportVehicleIdentifier, 'TransportVehicleIdentifier') as IXMLTransportVehicleIdentifierList;
  FTransportUnitIdentifier := CreateCollection(TXMLTransportUnitIdentifierList, IXMLTransportUnitIdentifier, 'TransportUnitIdentifier') as IXMLTransportUnitIdentifierList;
  FDeliveryMessageReference := CreateCollection(TXMLDeliveryMessageReferenceList, IXMLDeliveryMessageReference, 'DeliveryMessageReference') as IXMLDeliveryMessageReferenceList;
  inherited;
end;

function TXMLDeliveryInformationType.Get_DeliveryMessageNumber: UnicodeString;
begin
  Result := ChildNodes['DeliveryMessageNumber'].Text;
end;

procedure TXMLDeliveryInformationType.Set_DeliveryMessageNumber(Value: UnicodeString);
begin
  ChildNodes['DeliveryMessageNumber'].NodeValue := Value;
end;

function TXMLDeliveryInformationType.Get_DeliveryMessageLineItemNumber: LongWord;
begin
  Result := ChildNodes['DeliveryMessageLineItemNumber'].NodeValue;
end;

procedure TXMLDeliveryInformationType.Set_DeliveryMessageLineItemNumber(Value: LongWord);
begin
  ChildNodes['DeliveryMessageLineItemNumber'].NodeValue := Value;
end;

function TXMLDeliveryInformationType.Get_DeliveryMessageDate: IXMLDeliveryMessageDate;
begin
  Result := ChildNodes['DeliveryMessageDate'] as IXMLDeliveryMessageDate;
end;

function TXMLDeliveryInformationType.Get_DeliveryDate: IXMLDeliveryDate;
begin
  Result := ChildNodes['DeliveryDate'] as IXMLDeliveryDate;
end;

function TXMLDeliveryInformationType.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLDeliveryInformationType.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLDeliveryInformationType.Get_ChargeInformation: IXMLChargeInformationList;
begin
  Result := FChargeInformation;
end;

function TXMLDeliveryInformationType.Get_CountryOfOrigin: IXMLCountryOfOrigin;
begin
  Result := ChildNodes['CountryOfOrigin'] as IXMLCountryOfOrigin;
end;

function TXMLDeliveryInformationType.Get_CountryOfDestination: IXMLCountryOfDestination;
begin
  Result := ChildNodes['CountryOfDestination'] as IXMLCountryOfDestination;
end;

function TXMLDeliveryInformationType.Get_CountryOfConsumption: IXMLCountryOfConsumption;
begin
  Result := ChildNodes['CountryOfConsumption'] as IXMLCountryOfConsumption;
end;

function TXMLDeliveryInformationType.Get_TransportVehicleIdentifier: IXMLTransportVehicleIdentifierList;
begin
  Result := FTransportVehicleIdentifier;
end;

function TXMLDeliveryInformationType.Get_TransportUnitIdentifier: IXMLTransportUnitIdentifierList;
begin
  Result := FTransportUnitIdentifier;
end;

function TXMLDeliveryInformationType.Get_DeliveryMessageReference: IXMLDeliveryMessageReferenceList;
begin
  Result := FDeliveryMessageReference;
end;

{ TXMLDeliveryMessageHeader }

procedure TXMLDeliveryMessageHeader.AfterConstruction;
begin
  RegisterChildNode('DeliveryMessageDate', TXMLDeliveryMessageDate);
  RegisterChildNode('DeliveryMessageReason', TXMLDeliveryMessageReason);
  RegisterChildNode('DeliveryMessageReference', TXMLDeliveryMessageReference);
  RegisterChildNode('BuyerParty', TXMLParty);
  RegisterChildNode('BillToParty', TXMLParty);
  RegisterChildNode('SupplierParty', TXMLParty);
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('SenderParty', TXMLTypedParty);
  RegisterChildNode('ReceiverParty', TXMLTypedParty);
  RegisterChildNode('ShipToCharacteristics', TXMLShipToCharacteristics);
  RegisterChildNode('DocumentInformation', TXMLDocumentInformation);
  RegisterChildNode('CoLoading', TXMLCoLoading);
  RegisterChildNode('DeliveryLeg', TXMLDeliveryLeg);
  RegisterChildNode('CountryOfOrigin', TXMLCountryOfOrigin);
  RegisterChildNode('CountryOfDestination', TXMLCountryOfDestination);
  RegisterChildNode('CountryOfConsumption', TXMLCountryOfConsumption);
  RegisterChildNode('AdditionalItemInfo', TXMLCodeInfo);
  FDeliveryMessageReason := CreateCollection(TXMLDeliveryMessageReasonList, IXMLDeliveryMessageReason, 'DeliveryMessageReason') as IXMLDeliveryMessageReasonList;
  FDeliveryMessageReference := CreateCollection(TXMLDeliveryMessageReferenceList, IXMLDeliveryMessageReference, 'DeliveryMessageReference') as IXMLDeliveryMessageReferenceList;
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FReceiverParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'ReceiverParty') as IXMLTypedPartyList;
  FDocumentInformation := CreateCollection(TXMLDocumentInformationList, IXMLDocumentInformation, 'DocumentInformation') as IXMLDocumentInformationList;
  FCoLoading := CreateCollection(TXMLCoLoadingList, IXMLCoLoading, 'CoLoading') as IXMLCoLoadingList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  FDeliveryLeg := CreateCollection(TXMLDeliveryLegList, IXMLDeliveryLeg, 'DeliveryLeg') as IXMLDeliveryLegList;
  FAdditionalItemInfo := CreateCollection(TXMLCodeInfoList, IXMLCodeInfo, 'AdditionalItemInfo') as IXMLCodeInfoList;
  inherited;
end;

function TXMLDeliveryMessageHeader.Get_DeliveryMessageNumber: UnicodeString;
begin
  Result := ChildNodes['DeliveryMessageNumber'].Text;
end;

procedure TXMLDeliveryMessageHeader.Set_DeliveryMessageNumber(Value: UnicodeString);
begin
  ChildNodes['DeliveryMessageNumber'].NodeValue := Value;
end;

function TXMLDeliveryMessageHeader.Get_TransactionHistoryNumber: LongWord;
begin
  Result := ChildNodes['TransactionHistoryNumber'].NodeValue;
end;

procedure TXMLDeliveryMessageHeader.Set_TransactionHistoryNumber(Value: LongWord);
begin
  ChildNodes['TransactionHistoryNumber'].NodeValue := Value;
end;

function TXMLDeliveryMessageHeader.Get_DeliveryMessageDate: IXMLDeliveryMessageDate;
begin
  Result := ChildNodes['DeliveryMessageDate'] as IXMLDeliveryMessageDate;
end;

function TXMLDeliveryMessageHeader.Get_DeliveryMessageReason: IXMLDeliveryMessageReasonList;
begin
  Result := FDeliveryMessageReason;
end;

function TXMLDeliveryMessageHeader.Get_DeliveryMessageReference: IXMLDeliveryMessageReferenceList;
begin
  Result := FDeliveryMessageReference;
end;

function TXMLDeliveryMessageHeader.Get_BuyerParty: IXMLParty;
begin
  Result := ChildNodes['BuyerParty'] as IXMLParty;
end;

function TXMLDeliveryMessageHeader.Get_BillToParty: IXMLParty;
begin
  Result := ChildNodes['BillToParty'] as IXMLParty;
end;

function TXMLDeliveryMessageHeader.Get_SupplierParty: IXMLParty;
begin
  Result := ChildNodes['SupplierParty'] as IXMLParty;
end;

function TXMLDeliveryMessageHeader.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLDeliveryMessageHeader.Get_SenderParty: IXMLTypedParty;
begin
  Result := ChildNodes['SenderParty'] as IXMLTypedParty;
end;

function TXMLDeliveryMessageHeader.Get_ReceiverParty: IXMLTypedPartyList;
begin
  Result := FReceiverParty;
end;

function TXMLDeliveryMessageHeader.Get_ShipToCharacteristics: IXMLShipToCharacteristics;
begin
  Result := ChildNodes['ShipToCharacteristics'] as IXMLShipToCharacteristics;
end;

function TXMLDeliveryMessageHeader.Get_DocumentInformation: IXMLDocumentInformationList;
begin
  Result := FDocumentInformation;
end;

function TXMLDeliveryMessageHeader.Get_CoLoading: IXMLCoLoadingList;
begin
  Result := FCoLoading;
end;

function TXMLDeliveryMessageHeader.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLDeliveryMessageHeader.Get_DeliveryLeg: IXMLDeliveryLegList;
begin
  Result := FDeliveryLeg;
end;

function TXMLDeliveryMessageHeader.Get_CountryOfOrigin: IXMLCountryOfOrigin;
begin
  Result := ChildNodes['CountryOfOrigin'] as IXMLCountryOfOrigin;
end;

function TXMLDeliveryMessageHeader.Get_CountryOfDestination: IXMLCountryOfDestination;
begin
  Result := ChildNodes['CountryOfDestination'] as IXMLCountryOfDestination;
end;

function TXMLDeliveryMessageHeader.Get_CountryOfConsumption: IXMLCountryOfConsumption;
begin
  Result := ChildNodes['CountryOfConsumption'] as IXMLCountryOfConsumption;
end;

function TXMLDeliveryMessageHeader.Get_AdditionalItemInfo: IXMLCodeInfoList;
begin
  Result := FAdditionalItemInfo;
end;

{ TXMLDeliveryMessageReason }

procedure TXMLDeliveryMessageReason.AfterConstruction;
begin
  RegisterChildNode('DeliveryMessageReasonCode', TXMLDeliveryMessageReasonCode);
  FDeliveryMessageReasonDescription := CreateCollection(TXMLS255List, IXMLNode, 'DeliveryMessageReasonDescription') as IXMLS255List;
  inherited;
end;

function TXMLDeliveryMessageReason.Get_DeliveryMessageReasonCode: IXMLDeliveryMessageReasonCode;
begin
  Result := ChildNodes['DeliveryMessageReasonCode'] as IXMLDeliveryMessageReasonCode;
end;

function TXMLDeliveryMessageReason.Get_DeliveryMessageReasonDescription: IXMLS255List;
begin
  Result := FDeliveryMessageReasonDescription;
end;

{ TXMLDeliveryMessageReasonList }

function TXMLDeliveryMessageReasonList.Add: IXMLDeliveryMessageReason;
begin
  Result := AddItem(-1) as IXMLDeliveryMessageReason;
end;

function TXMLDeliveryMessageReasonList.Insert(const Index: Integer): IXMLDeliveryMessageReason;
begin
  Result := AddItem(Index) as IXMLDeliveryMessageReason;
end;

function TXMLDeliveryMessageReasonList.Get_Item(Index: Integer): IXMLDeliveryMessageReason;
begin
  Result := List[Index] as IXMLDeliveryMessageReason;
end;

{ TXMLDeliveryMessageReasonCode }

function TXMLDeliveryMessageReasonCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLDeliveryMessageReasonCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLCoLoading }

procedure TXMLCoLoading.AfterConstruction;
begin
  RegisterChildNode('CoLoadingNumber', TXMLCoLoadingNumber);
  RegisterChildNode('CoLoadingReference', TXMLCoLoadingReference);
  FCoLoadingReference := CreateCollection(TXMLCoLoadingReferenceList, IXMLCoLoadingReference, 'CoLoadingReference') as IXMLCoLoadingReferenceList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLCoLoading.Get_CoLoadingType: UnicodeString;
begin
  Result := AttributeNodes['CoLoadingType'].Text;
end;

procedure TXMLCoLoading.Set_CoLoadingType(Value: UnicodeString);
begin
  SetAttribute('CoLoadingType', Value);
end;

function TXMLCoLoading.Get_CoLoadingNumber: IXMLCoLoadingNumber;
begin
  Result := ChildNodes['CoLoadingNumber'] as IXMLCoLoadingNumber;
end;

function TXMLCoLoading.Get_DeliveryInstructionNumber: UnicodeString;
begin
  Result := ChildNodes['DeliveryInstructionNumber'].Text;
end;

procedure TXMLCoLoading.Set_DeliveryInstructionNumber(Value: UnicodeString);
begin
  ChildNodes['DeliveryInstructionNumber'].NodeValue := Value;
end;

function TXMLCoLoading.Get_DeliveryInstructionSequenceNumber: LongWord;
begin
  Result := ChildNodes['DeliveryInstructionSequenceNumber'].NodeValue;
end;

procedure TXMLCoLoading.Set_DeliveryInstructionSequenceNumber(Value: LongWord);
begin
  ChildNodes['DeliveryInstructionSequenceNumber'].NodeValue := Value;
end;

function TXMLCoLoading.Get_CoLoadingReference: IXMLCoLoadingReferenceList;
begin
  Result := FCoLoadingReference;
end;

function TXMLCoLoading.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLCoLoadingList }

function TXMLCoLoadingList.Add: IXMLCoLoading;
begin
  Result := AddItem(-1) as IXMLCoLoading;
end;

function TXMLCoLoadingList.Insert(const Index: Integer): IXMLCoLoading;
begin
  Result := AddItem(Index) as IXMLCoLoading;
end;

function TXMLCoLoadingList.Get_Item(Index: Integer): IXMLCoLoading;
begin
  Result := List[Index] as IXMLCoLoading;
end;

{ TXMLCoLoadingNumber }

function TXMLCoLoadingNumber.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLCoLoadingNumber.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLCoLoadingReference }

function TXMLCoLoadingReference.Get_CoLoadingReferenceType: UnicodeString;
begin
  Result := AttributeNodes['CoLoadingReferenceType'].Text;
end;

procedure TXMLCoLoadingReference.Set_CoLoadingReferenceType(Value: UnicodeString);
begin
  SetAttribute('CoLoadingReferenceType', Value);
end;

function TXMLCoLoadingReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLCoLoadingReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLCoLoadingReferenceList }

function TXMLCoLoadingReferenceList.Add: IXMLCoLoadingReference;
begin
  Result := AddItem(-1) as IXMLCoLoadingReference;
end;

function TXMLCoLoadingReferenceList.Insert(const Index: Integer): IXMLCoLoadingReference;
begin
  Result := AddItem(Index) as IXMLCoLoadingReference;
end;

function TXMLCoLoadingReferenceList.Get_Item(Index: Integer): IXMLCoLoadingReference;
begin
  Result := List[Index] as IXMLCoLoadingReference;
end;

{ TXMLDeliveryLeg }

procedure TXMLDeliveryLeg.AfterConstruction;
begin
  RegisterChildNode('DeliveryOrigin', TXMLDeliveryOrigin);
  RegisterChildNode('CarrierParty', TXMLParty);
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('TransportModeCharacteristics', TXMLTransportModeCharacteristics);
  RegisterChildNode('TransportVehicleCharacteristics', TXMLTransportVehicleCharacteristics);
  RegisterChildNode('TransportUnitCharacteristics', TXMLTransportUnitCharacteristics);
  RegisterChildNode('ResourceInformation', TXMLResourceInformation);
  RegisterChildNode('TransportLoadingCharacteristics', TXMLTransportLoadingCharacteristics);
  RegisterChildNode('TransportUnloadingCharacteristics', TXMLTransportUnloadingCharacteristics);
  RegisterChildNode('TransportOtherInstructions', TXMLTransportOtherInstructions);
  RegisterChildNode('Route', TXMLRoute);
  RegisterChildNode('DeliveryTransitTime', TXMLDeliveryTransitTime);
  RegisterChildNode('DeliveryDestination', TXMLDeliveryDestination);
  RegisterChildNode('DeliveryDateWindow', TXMLDeliveryDateWindow);
  RegisterChildNode('DeliveryLegReference', TXMLDeliveryLegReference);
  RegisterChildNode('TermsOfChartering', TXMLTermsOfChartering);
  RegisterChildNode('BusinessChainInfo', TXMLBusinessChainInfo);
  FDeliveryOrigin := CreateCollection(TXMLDeliveryOriginList, IXMLDeliveryOrigin, 'DeliveryOrigin') as IXMLDeliveryOriginList;
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FTransportUnitCharacteristics := CreateCollection(TXMLTransportUnitCharacteristicsList, IXMLTransportUnitCharacteristics, 'TransportUnitCharacteristics') as IXMLTransportUnitCharacteristicsList;
  FTransportLoadingCharacteristics := CreateCollection(TXMLTransportLoadingCharacteristicsList, IXMLTransportLoadingCharacteristics, 'TransportLoadingCharacteristics') as IXMLTransportLoadingCharacteristicsList;
  FTransportUnloadingCharacteristics := CreateCollection(TXMLTransportUnloadingCharacteristicsList, IXMLTransportUnloadingCharacteristics, 'TransportUnloadingCharacteristics') as IXMLTransportUnloadingCharacteristicsList;
  FTransportOtherInstructions := CreateCollection(TXMLTransportOtherInstructionsList, IXMLTransportOtherInstructions, 'TransportOtherInstructions') as IXMLTransportOtherInstructionsList;
  FRoute := CreateCollection(TXMLRouteList, IXMLRoute, 'Route') as IXMLRouteList;
  FDeliveryDestination := CreateCollection(TXMLDeliveryDestinationList, IXMLDeliveryDestination, 'DeliveryDestination') as IXMLDeliveryDestinationList;
  FDeliveryDateWindow := CreateCollection(TXMLDeliveryDateWindowList, IXMLDeliveryDateWindow, 'DeliveryDateWindow') as IXMLDeliveryDateWindowList;
  FDeliveryLegReference := CreateCollection(TXMLDeliveryLegReferenceList, IXMLDeliveryLegReference, 'DeliveryLegReference') as IXMLDeliveryLegReferenceList;
  FTermsOfChartering := CreateCollection(TXMLTermsOfCharteringList, IXMLTermsOfChartering, 'TermsOfChartering') as IXMLTermsOfCharteringList;
  inherited;
end;

function TXMLDeliveryLeg.Get_DeliveryModeType: UnicodeString;
begin
  Result := AttributeNodes['DeliveryModeType'].Text;
end;

procedure TXMLDeliveryLeg.Set_DeliveryModeType(Value: UnicodeString);
begin
  SetAttribute('DeliveryModeType', Value);
end;

function TXMLDeliveryLeg.Get_DeliveryLegType: UnicodeString;
begin
  Result := AttributeNodes['DeliveryLegType'].Text;
end;

procedure TXMLDeliveryLeg.Set_DeliveryLegType(Value: UnicodeString);
begin
  SetAttribute('DeliveryLegType', Value);
end;

function TXMLDeliveryLeg.Get_EventType: UnicodeString;
begin
  Result := AttributeNodes['EventType'].Text;
end;

procedure TXMLDeliveryLeg.Set_EventType(Value: UnicodeString);
begin
  SetAttribute('EventType', Value);
end;

function TXMLDeliveryLeg.Get_LegStageType: UnicodeString;
begin
  Result := AttributeNodes['LegStageType'].Text;
end;

procedure TXMLDeliveryLeg.Set_LegStageType(Value: UnicodeString);
begin
  SetAttribute('LegStageType', Value);
end;

function TXMLDeliveryLeg.Get_TransportContextType: UnicodeString;
begin
  Result := AttributeNodes['TransportContextType'].Text;
end;

procedure TXMLDeliveryLeg.Set_TransportContextType(Value: UnicodeString);
begin
  SetAttribute('TransportContextType', Value);
end;

function TXMLDeliveryLeg.Get_IsOpenDeliveryAgreement: UnicodeString;
begin
  Result := AttributeNodes['IsOpenDeliveryAgreement'].Text;
end;

procedure TXMLDeliveryLeg.Set_IsOpenDeliveryAgreement(Value: UnicodeString);
begin
  SetAttribute('IsOpenDeliveryAgreement', Value);
end;

function TXMLDeliveryLeg.Get_DeliveryLegSequenceNumber: LongWord;
begin
  Result := ChildNodes['DeliveryLegSequenceNumber'].NodeValue;
end;

procedure TXMLDeliveryLeg.Set_DeliveryLegSequenceNumber(Value: LongWord);
begin
  ChildNodes['DeliveryLegSequenceNumber'].NodeValue := Value;
end;

function TXMLDeliveryLeg.Get_DeliveryOrigin: IXMLDeliveryOriginList;
begin
  Result := FDeliveryOrigin;
end;

function TXMLDeliveryLeg.Get_CarrierParty: IXMLParty;
begin
  Result := ChildNodes['CarrierParty'] as IXMLParty;
end;

function TXMLDeliveryLeg.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLDeliveryLeg.Get_TransportModeCharacteristics: IXMLTransportModeCharacteristics;
begin
  Result := ChildNodes['TransportModeCharacteristics'] as IXMLTransportModeCharacteristics;
end;

function TXMLDeliveryLeg.Get_TransportVehicleCharacteristics: IXMLTransportVehicleCharacteristics;
begin
  Result := ChildNodes['TransportVehicleCharacteristics'] as IXMLTransportVehicleCharacteristics;
end;

function TXMLDeliveryLeg.Get_TransportUnitCharacteristics: IXMLTransportUnitCharacteristicsList;
begin
  Result := FTransportUnitCharacteristics;
end;

function TXMLDeliveryLeg.Get_ResourceInformation: IXMLResourceInformation;
begin
  Result := ChildNodes['ResourceInformation'] as IXMLResourceInformation;
end;

function TXMLDeliveryLeg.Get_TransportLoadingCharacteristics: IXMLTransportLoadingCharacteristicsList;
begin
  Result := FTransportLoadingCharacteristics;
end;

function TXMLDeliveryLeg.Get_TransportUnloadingCharacteristics: IXMLTransportUnloadingCharacteristicsList;
begin
  Result := FTransportUnloadingCharacteristics;
end;

function TXMLDeliveryLeg.Get_TransportOtherInstructions: IXMLTransportOtherInstructionsList;
begin
  Result := FTransportOtherInstructions;
end;

function TXMLDeliveryLeg.Get_Route: IXMLRouteList;
begin
  Result := FRoute;
end;

function TXMLDeliveryLeg.Get_DeliveryTransitTime: IXMLDeliveryTransitTime;
begin
  Result := ChildNodes['DeliveryTransitTime'] as IXMLDeliveryTransitTime;
end;

function TXMLDeliveryLeg.Get_DeliveryDestination: IXMLDeliveryDestinationList;
begin
  Result := FDeliveryDestination;
end;

function TXMLDeliveryLeg.Get_DeliveryDateWindow: IXMLDeliveryDateWindowList;
begin
  Result := FDeliveryDateWindow;
end;

function TXMLDeliveryLeg.Get_DeliveryLegReference: IXMLDeliveryLegReferenceList;
begin
  Result := FDeliveryLegReference;
end;

function TXMLDeliveryLeg.Get_TermsOfChartering: IXMLTermsOfCharteringList;
begin
  Result := FTermsOfChartering;
end;

function TXMLDeliveryLeg.Get_BusinessChainInfo: IXMLBusinessChainInfo;
begin
  Result := ChildNodes['BusinessChainInfo'] as IXMLBusinessChainInfo;
end;

{ TXMLDeliveryLegList }

function TXMLDeliveryLegList.Add: IXMLDeliveryLeg;
begin
  Result := AddItem(-1) as IXMLDeliveryLeg;
end;

function TXMLDeliveryLegList.Insert(const Index: Integer): IXMLDeliveryLeg;
begin
  Result := AddItem(Index) as IXMLDeliveryLeg;
end;

function TXMLDeliveryLegList.Get_Item(Index: Integer): IXMLDeliveryLeg;
begin
  Result := List[Index] as IXMLDeliveryLeg;
end;

{ TXMLDeliveryOrigin }

procedure TXMLDeliveryOrigin.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  RegisterChildNode('LocationParty', TXMLLocationParty);
  RegisterChildNode('LocationCharacteristics', TXMLLocationCharacteristics);
  RegisterChildNode('SupplyPoint', TXMLSupplyPoint);
  RegisterChildNode('LocationCode', TXMLLocationCode);
  RegisterChildNode('GPSCoordinates', TXMLGPSCoordinates);
  RegisterChildNode('MapCoordinates', TXMLMapCoordinates);
  FSupplyPoint := CreateCollection(TXMLSupplyPointList, IXMLSupplyPoint, 'SupplyPoint') as IXMLSupplyPointList;
  FMapCoordinates := CreateCollection(TXMLMapCoordinatesList, IXMLMapCoordinates, 'MapCoordinates') as IXMLMapCoordinatesList;
  inherited;
end;

function TXMLDeliveryOrigin.Get_IsOptionalDeliveryOrigin: UnicodeString;
begin
  Result := AttributeNodes['IsOptionalDeliveryOrigin'].Text;
end;

procedure TXMLDeliveryOrigin.Set_IsOptionalDeliveryOrigin(Value: UnicodeString);
begin
  SetAttribute('IsOptionalDeliveryOrigin', Value);
end;

function TXMLDeliveryOrigin.Get_PriorityOrder: LongWord;
begin
  Result := AttributeNodes['PriorityOrder'].NodeValue;
end;

procedure TXMLDeliveryOrigin.Set_PriorityOrder(Value: LongWord);
begin
  SetAttribute('PriorityOrder', Value);
end;

function TXMLDeliveryOrigin.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDeliveryOrigin.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDeliveryOrigin.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

function TXMLDeliveryOrigin.Get_LocationParty: IXMLLocationParty;
begin
  Result := ChildNodes['LocationParty'] as IXMLLocationParty;
end;

function TXMLDeliveryOrigin.Get_LocationCharacteristics: IXMLLocationCharacteristics;
begin
  Result := ChildNodes['LocationCharacteristics'] as IXMLLocationCharacteristics;
end;

function TXMLDeliveryOrigin.Get_SupplyPoint: IXMLSupplyPointList;
begin
  Result := FSupplyPoint;
end;

function TXMLDeliveryOrigin.Get_LocationCode: IXMLLocationCode;
begin
  Result := ChildNodes['LocationCode'] as IXMLLocationCode;
end;

function TXMLDeliveryOrigin.Get_GPSCoordinates: IXMLGPSCoordinates;
begin
  Result := ChildNodes['GPSCoordinates'] as IXMLGPSCoordinates;
end;

function TXMLDeliveryOrigin.Get_MapCoordinates: IXMLMapCoordinatesList;
begin
  Result := FMapCoordinates;
end;

{ TXMLDeliveryOriginList }

function TXMLDeliveryOriginList.Add: IXMLDeliveryOrigin;
begin
  Result := AddItem(-1) as IXMLDeliveryOrigin;
end;

function TXMLDeliveryOriginList.Insert(const Index: Integer): IXMLDeliveryOrigin;
begin
  Result := AddItem(Index) as IXMLDeliveryOrigin;
end;

function TXMLDeliveryOriginList.Get_Item(Index: Integer): IXMLDeliveryOrigin;
begin
  Result := List[Index] as IXMLDeliveryOrigin;
end;

{ TXMLResourceInformation }

procedure TXMLResourceInformation.AfterConstruction;
begin
  RegisterChildNode('ResourceInformationIssueDate', TXMLResourceInformationIssueDate);
  RegisterChildNode('ResourceCharacteristics', TXMLResourceCharacteristics);
  FResourceCharacteristics := CreateCollection(TXMLResourceCharacteristicsList, IXMLResourceCharacteristics, 'ResourceCharacteristics') as IXMLResourceCharacteristicsList;
  inherited;
end;

function TXMLResourceInformation.Get_ResourceInformationNumber: UnicodeString;
begin
  Result := ChildNodes['ResourceInformationNumber'].Text;
end;

procedure TXMLResourceInformation.Set_ResourceInformationNumber(Value: UnicodeString);
begin
  ChildNodes['ResourceInformationNumber'].NodeValue := Value;
end;

function TXMLResourceInformation.Get_ResourceInformationIssueDate: IXMLResourceInformationIssueDate;
begin
  Result := ChildNodes['ResourceInformationIssueDate'] as IXMLResourceInformationIssueDate;
end;

function TXMLResourceInformation.Get_ResourceCharacteristics: IXMLResourceCharacteristicsList;
begin
  Result := FResourceCharacteristics;
end;

{ TXMLResourceInformationIssueDate }

procedure TXMLResourceInformationIssueDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLResourceInformationIssueDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLResourceInformationIssueDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLResourceInformationIssueDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLResourceCharacteristics }

procedure TXMLResourceCharacteristics.AfterConstruction;
begin
  RegisterChildNode('ResourceTypeCode', TXMLResourceTypeCode);
  RegisterChildNode('ResourceIDInfo', TXMLResourceIDInfo);
  RegisterChildNode('ResourceReferenceIDInfo', TXMLResourceReferenceIDInfo);
  RegisterChildNode('ResourceReference', TXMLResourceReference);
  RegisterChildNode('ResourceIntroductionDate', TXMLResourceIntroductionDate);
  RegisterChildNode('ResourceAvailability', TXMLResourceAvailability);
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('ResourcePropertyValue', TXMLResourcePropertyValue);
  FResourceTypeDescription := CreateCollection(TXMLS255List, IXMLNode, 'ResourceTypeDescription') as IXMLS255List;
  FResourceIDInfo := CreateCollection(TXMLResourceIDInfoList, IXMLResourceIDInfo, 'ResourceIDInfo') as IXMLResourceIDInfoList;
  FResourceReferenceIDInfo := CreateCollection(TXMLResourceReferenceIDInfoList, IXMLResourceReferenceIDInfo, 'ResourceReferenceIDInfo') as IXMLResourceReferenceIDInfoList;
  FResourceReference := CreateCollection(TXMLResourceReferenceList, IXMLResourceReference, 'ResourceReference') as IXMLResourceReferenceList;
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FResourcePropertyValue := CreateCollection(TXMLResourcePropertyValueList, IXMLResourcePropertyValue, 'ResourcePropertyValue') as IXMLResourcePropertyValueList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLResourceCharacteristics.Get_ResourceTypeCode: IXMLResourceTypeCode;
begin
  Result := ChildNodes['ResourceTypeCode'] as IXMLResourceTypeCode;
end;

function TXMLResourceCharacteristics.Get_ResourceTypeDescription: IXMLS255List;
begin
  Result := FResourceTypeDescription;
end;

function TXMLResourceCharacteristics.Get_ResourceIDInfo: IXMLResourceIDInfoList;
begin
  Result := FResourceIDInfo;
end;

function TXMLResourceCharacteristics.Get_ResourceReferenceIDInfo: IXMLResourceReferenceIDInfoList;
begin
  Result := FResourceReferenceIDInfo;
end;

function TXMLResourceCharacteristics.Get_ResourceReference: IXMLResourceReferenceList;
begin
  Result := FResourceReference;
end;

function TXMLResourceCharacteristics.Get_ResourceIntroductionDate: IXMLResourceIntroductionDate;
begin
  Result := ChildNodes['ResourceIntroductionDate'] as IXMLResourceIntroductionDate;
end;

function TXMLResourceCharacteristics.Get_ResourceAvailability: IXMLResourceAvailability;
begin
  Result := ChildNodes['ResourceAvailability'] as IXMLResourceAvailability;
end;

function TXMLResourceCharacteristics.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLResourceCharacteristics.Get_ResourcePropertyValue: IXMLResourcePropertyValueList;
begin
  Result := FResourcePropertyValue;
end;

function TXMLResourceCharacteristics.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLResourceCharacteristicsList }

function TXMLResourceCharacteristicsList.Add: IXMLResourceCharacteristics;
begin
  Result := AddItem(-1) as IXMLResourceCharacteristics;
end;

function TXMLResourceCharacteristicsList.Insert(const Index: Integer): IXMLResourceCharacteristics;
begin
  Result := AddItem(Index) as IXMLResourceCharacteristics;
end;

function TXMLResourceCharacteristicsList.Get_Item(Index: Integer): IXMLResourceCharacteristics;
begin
  Result := List[Index] as IXMLResourceCharacteristics;
end;

{ TXMLResourceTypeCode }

function TXMLResourceTypeCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLResourceTypeCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLResourceIDInfo }

procedure TXMLResourceIDInfo.AfterConstruction;
begin
  RegisterChildNode('ResourceIdentifier', TXMLResourceIdentifier);
  FResourceDescription := CreateCollection(TXMLS255List, IXMLNode, 'ResourceDescription') as IXMLS255List;
  inherited;
end;

function TXMLResourceIDInfo.Get_ResourceIdentifier: IXMLResourceIdentifier;
begin
  Result := ChildNodes['ResourceIdentifier'] as IXMLResourceIdentifier;
end;

function TXMLResourceIDInfo.Get_ResourceDescription: IXMLS255List;
begin
  Result := FResourceDescription;
end;

{ TXMLResourceIDInfoList }

function TXMLResourceIDInfoList.Add: IXMLResourceIDInfo;
begin
  Result := AddItem(-1) as IXMLResourceIDInfo;
end;

function TXMLResourceIDInfoList.Insert(const Index: Integer): IXMLResourceIDInfo;
begin
  Result := AddItem(Index) as IXMLResourceIDInfo;
end;

function TXMLResourceIDInfoList.Get_Item(Index: Integer): IXMLResourceIDInfo;
begin
  Result := List[Index] as IXMLResourceIDInfo;
end;

{ TXMLResourceIdentifier }

function TXMLResourceIdentifier.Get_ResourceIdentifierType: UnicodeString;
begin
  Result := AttributeNodes['ResourceIdentifierType'].Text;
end;

procedure TXMLResourceIdentifier.Set_ResourceIdentifierType(Value: UnicodeString);
begin
  SetAttribute('ResourceIdentifierType', Value);
end;

function TXMLResourceIdentifier.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLResourceIdentifier.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

function TXMLResourceIdentifier.Get_StateOrProvince: UnicodeString;
begin
  Result := AttributeNodes['StateOrProvince'].Text;
end;

procedure TXMLResourceIdentifier.Set_StateOrProvince(Value: UnicodeString);
begin
  SetAttribute('StateOrProvince', Value);
end;

function TXMLResourceIdentifier.Get_ISOCountryCode: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCode'].Text;
end;

procedure TXMLResourceIdentifier.Set_ISOCountryCode(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCode', Value);
end;

function TXMLResourceIdentifier.Get_ISOCountryCodeAlpha3: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCodeAlpha3'].Text;
end;

procedure TXMLResourceIdentifier.Set_ISOCountryCodeAlpha3(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCodeAlpha3', Value);
end;

function TXMLResourceIdentifier.Get_ISOCountryCodeNumeric: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCodeNumeric'].Text;
end;

procedure TXMLResourceIdentifier.Set_ISOCountryCodeNumeric(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCodeNumeric', Value);
end;

{ TXMLResourceReferenceIDInfo }

procedure TXMLResourceReferenceIDInfo.AfterConstruction;
begin
  RegisterChildNode('ResourceIDInfo', TXMLResourceIDInfo);
  ItemTag := 'ResourceIDInfo';
  ItemInterface := IXMLResourceIDInfo;
  inherited;
end;

function TXMLResourceReferenceIDInfo.Get_ResourceReferenceIDType: UnicodeString;
begin
  Result := AttributeNodes['ResourceReferenceIDType'].Text;
end;

procedure TXMLResourceReferenceIDInfo.Set_ResourceReferenceIDType(Value: UnicodeString);
begin
  SetAttribute('ResourceReferenceIDType', Value);
end;

function TXMLResourceReferenceIDInfo.Get_ResourceIDInfo(Index: Integer): IXMLResourceIDInfo;
begin
  Result := List[Index] as IXMLResourceIDInfo;
end;

function TXMLResourceReferenceIDInfo.Add: IXMLResourceIDInfo;
begin
  Result := AddItem(-1) as IXMLResourceIDInfo;
end;

function TXMLResourceReferenceIDInfo.Insert(const Index: Integer): IXMLResourceIDInfo;
begin
  Result := AddItem(Index) as IXMLResourceIDInfo;
end;

{ TXMLResourceReferenceIDInfoList }

function TXMLResourceReferenceIDInfoList.Add: IXMLResourceReferenceIDInfo;
begin
  Result := AddItem(-1) as IXMLResourceReferenceIDInfo;
end;

function TXMLResourceReferenceIDInfoList.Insert(const Index: Integer): IXMLResourceReferenceIDInfo;
begin
  Result := AddItem(Index) as IXMLResourceReferenceIDInfo;
end;

function TXMLResourceReferenceIDInfoList.Get_Item(Index: Integer): IXMLResourceReferenceIDInfo;
begin
  Result := List[Index] as IXMLResourceReferenceIDInfo;
end;

{ TXMLResourceReference }

function TXMLResourceReference.Get_ResourceReferenceType: UnicodeString;
begin
  Result := AttributeNodes['ResourceReferenceType'].Text;
end;

procedure TXMLResourceReference.Set_ResourceReferenceType(Value: UnicodeString);
begin
  SetAttribute('ResourceReferenceType', Value);
end;

function TXMLResourceReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLResourceReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLResourceReferenceList }

function TXMLResourceReferenceList.Add: IXMLResourceReference;
begin
  Result := AddItem(-1) as IXMLResourceReference;
end;

function TXMLResourceReferenceList.Insert(const Index: Integer): IXMLResourceReference;
begin
  Result := AddItem(Index) as IXMLResourceReference;
end;

function TXMLResourceReferenceList.Get_Item(Index: Integer): IXMLResourceReference;
begin
  Result := List[Index] as IXMLResourceReference;
end;

{ TXMLResourceIntroductionDate }

procedure TXMLResourceIntroductionDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLResourceIntroductionDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

{ TXMLResourceAvailability }

procedure TXMLResourceAvailability.AfterConstruction;
begin
  RegisterChildNode('DateTimeRange', TXMLDateTimeRange);
  RegisterChildNode('ResourceShiftInformation', TXMLResourceShiftInformation);
  FDateTimeRange := CreateCollection(TXMLDateTimeRangeList, IXMLDateTimeRange, 'DateTimeRange') as IXMLDateTimeRangeList;
  FResourceShiftInformation := CreateCollection(TXMLResourceShiftInformationList, IXMLResourceShiftInformation, 'ResourceShiftInformation') as IXMLResourceShiftInformationList;
  inherited;
end;

function TXMLResourceAvailability.Get_DateTimeRange: IXMLDateTimeRangeList;
begin
  Result := FDateTimeRange;
end;

function TXMLResourceAvailability.Get_ResourceShiftInformation: IXMLResourceShiftInformationList;
begin
  Result := FResourceShiftInformation;
end;

{ TXMLResourceShiftInformation }

procedure TXMLResourceShiftInformation.AfterConstruction;
begin
  RegisterChildNode('ResourceShiftCode', TXMLResourceShiftCode);
  FResourceShiftDescription := CreateCollection(TXMLS255List, IXMLNode, 'ResourceShiftDescription') as IXMLS255List;
  inherited;
end;

function TXMLResourceShiftInformation.Get_ResourceShiftCode: IXMLResourceShiftCode;
begin
  Result := ChildNodes['ResourceShiftCode'] as IXMLResourceShiftCode;
end;

function TXMLResourceShiftInformation.Get_ResourceShiftDescription: IXMLS255List;
begin
  Result := FResourceShiftDescription;
end;

{ TXMLResourceShiftInformationList }

function TXMLResourceShiftInformationList.Add: IXMLResourceShiftInformation;
begin
  Result := AddItem(-1) as IXMLResourceShiftInformation;
end;

function TXMLResourceShiftInformationList.Insert(const Index: Integer): IXMLResourceShiftInformation;
begin
  Result := AddItem(Index) as IXMLResourceShiftInformation;
end;

function TXMLResourceShiftInformationList.Get_Item(Index: Integer): IXMLResourceShiftInformation;
begin
  Result := List[Index] as IXMLResourceShiftInformation;
end;

{ TXMLResourceShiftCode }

function TXMLResourceShiftCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLResourceShiftCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLResourcePropertyValue }

procedure TXMLResourcePropertyValue.AfterConstruction;
begin
  RegisterChildNode('PropertyCode', TXMLPropertyCode);
  RegisterChildNode('NumericValue', TXMLDetailMeasurement);
  RegisterChildNode('QuantityValue', TXMLQuantityValue);
  FPropertyDescription := CreateCollection(TXMLS255List, IXMLNode, 'PropertyDescription') as IXMLS255List;
  FQuantityValue := CreateCollection(TXMLQuantityValueList, IXMLQuantityValue, 'QuantityValue') as IXMLQuantityValueList;
  inherited;
end;

function TXMLResourcePropertyValue.Get_PropertyCode: IXMLPropertyCode;
begin
  Result := ChildNodes['PropertyCode'] as IXMLPropertyCode;
end;

function TXMLResourcePropertyValue.Get_PropertyDescription: IXMLS255List;
begin
  Result := FPropertyDescription;
end;

function TXMLResourcePropertyValue.Get_BinaryValue: UnicodeString;
begin
  Result := ChildNodes['BinaryValue'].Text;
end;

procedure TXMLResourcePropertyValue.Set_BinaryValue(Value: UnicodeString);
begin
  ChildNodes['BinaryValue'].NodeValue := Value;
end;

function TXMLResourcePropertyValue.Get_BooleanValue: Boolean;
begin
  Result := ChildNodes['BooleanValue'].NodeValue;
end;

procedure TXMLResourcePropertyValue.Set_BooleanValue(Value: Boolean);
begin
  ChildNodes['BooleanValue'].NodeValue := Value;
end;

function TXMLResourcePropertyValue.Get_DateTimeValue: UnicodeString;
begin
  Result := ChildNodes['DateTimeValue'].Text;
end;

procedure TXMLResourcePropertyValue.Set_DateTimeValue(Value: UnicodeString);
begin
  ChildNodes['DateTimeValue'].NodeValue := Value;
end;

function TXMLResourcePropertyValue.Get_NumericValue: IXMLDetailMeasurement;
begin
  Result := ChildNodes['NumericValue'] as IXMLDetailMeasurement;
end;

function TXMLResourcePropertyValue.Get_TextValue: UnicodeString;
begin
  Result := ChildNodes['TextValue'].Text;
end;

procedure TXMLResourcePropertyValue.Set_TextValue(Value: UnicodeString);
begin
  ChildNodes['TextValue'].NodeValue := Value;
end;

function TXMLResourcePropertyValue.Get_QuantityValue: IXMLQuantityValueList;
begin
  Result := FQuantityValue;
end;

{ TXMLResourcePropertyValueList }

function TXMLResourcePropertyValueList.Add: IXMLResourcePropertyValue;
begin
  Result := AddItem(-1) as IXMLResourcePropertyValue;
end;

function TXMLResourcePropertyValueList.Insert(const Index: Integer): IXMLResourcePropertyValue;
begin
  Result := AddItem(Index) as IXMLResourcePropertyValue;
end;

function TXMLResourcePropertyValueList.Get_Item(Index: Integer): IXMLResourcePropertyValue;
begin
  Result := List[Index] as IXMLResourcePropertyValue;
end;

{ TXMLPropertyCode }

function TXMLPropertyCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLPropertyCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLQuantityValue }

function TXMLQuantityValue.Get_QuantityType: UnicodeString;
begin
  Result := AttributeNodes['QuantityType'].Text;
end;

procedure TXMLQuantityValue.Set_QuantityType(Value: UnicodeString);
begin
  SetAttribute('QuantityType', Value);
end;

function TXMLQuantityValue.Get_QuantityTypeContext: UnicodeString;
begin
  Result := AttributeNodes['QuantityTypeContext'].Text;
end;

procedure TXMLQuantityValue.Set_QuantityTypeContext(Value: UnicodeString);
begin
  SetAttribute('QuantityTypeContext', Value);
end;

function TXMLQuantityValue.Get_AdjustmentType: UnicodeString;
begin
  Result := AttributeNodes['AdjustmentType'].Text;
end;

procedure TXMLQuantityValue.Set_AdjustmentType(Value: UnicodeString);
begin
  SetAttribute('AdjustmentType', Value);
end;

{ TXMLQuantityValueList }

function TXMLQuantityValueList.Add: IXMLQuantityValue;
begin
  Result := AddItem(-1) as IXMLQuantityValue;
end;

function TXMLQuantityValueList.Insert(const Index: Integer): IXMLQuantityValue;
begin
  Result := AddItem(Index) as IXMLQuantityValue;
end;

function TXMLQuantityValueList.Get_Item(Index: Integer): IXMLQuantityValue;
begin
  Result := List[Index] as IXMLQuantityValue;
end;

{ TXMLTransportLoadingCharacteristics }

procedure TXMLTransportLoadingCharacteristics.AfterConstruction;
begin
  RegisterChildNode('TransportLoadingCode', TXMLTransportLoadingCode);
  RegisterChildNode('TransportLoadingCodeDescription', TXMLTransportLoadingCodeDescription);
  RegisterChildNode('GoodsLoadingSequence', TXMLGoodsLoadingSequence);
  RegisterChildNode('LoadingFrom', TXMLLoadingFrom);
  FTransportLoadingText := CreateCollection(TXMLS255List, IXMLNode, 'TransportLoadingText') as IXMLS255List;
  inherited;
end;

function TXMLTransportLoadingCharacteristics.Get_MixProductIndicator: UnicodeString;
begin
  Result := AttributeNodes['MixProductIndicator'].Text;
end;

procedure TXMLTransportLoadingCharacteristics.Set_MixProductIndicator(Value: UnicodeString);
begin
  SetAttribute('MixProductIndicator', Value);
end;

function TXMLTransportLoadingCharacteristics.Get_TransportLoadingType: UnicodeString;
begin
  Result := AttributeNodes['TransportLoadingType'].Text;
end;

procedure TXMLTransportLoadingCharacteristics.Set_TransportLoadingType(Value: UnicodeString);
begin
  SetAttribute('TransportLoadingType', Value);
end;

function TXMLTransportLoadingCharacteristics.Get_TransportDeckOption: UnicodeString;
begin
  Result := AttributeNodes['TransportDeckOption'].Text;
end;

procedure TXMLTransportLoadingCharacteristics.Set_TransportDeckOption(Value: UnicodeString);
begin
  SetAttribute('TransportDeckOption', Value);
end;

function TXMLTransportLoadingCharacteristics.Get_LoadingTolerance: UnicodeString;
begin
  Result := AttributeNodes['LoadingTolerance'].Text;
end;

procedure TXMLTransportLoadingCharacteristics.Set_LoadingTolerance(Value: UnicodeString);
begin
  SetAttribute('LoadingTolerance', Value);
end;

function TXMLTransportLoadingCharacteristics.Get_DirectLoading: UnicodeString;
begin
  Result := AttributeNodes['DirectLoading'].Text;
end;

procedure TXMLTransportLoadingCharacteristics.Set_DirectLoading(Value: UnicodeString);
begin
  SetAttribute('DirectLoading', Value);
end;

function TXMLTransportLoadingCharacteristics.Get_GoodsLoadingPrinciple: UnicodeString;
begin
  Result := AttributeNodes['GoodsLoadingPrinciple'].Text;
end;

procedure TXMLTransportLoadingCharacteristics.Set_GoodsLoadingPrinciple(Value: UnicodeString);
begin
  SetAttribute('GoodsLoadingPrinciple', Value);
end;

function TXMLTransportLoadingCharacteristics.Get_LabelOrientation: UnicodeString;
begin
  Result := AttributeNodes['LabelOrientation'].Text;
end;

procedure TXMLTransportLoadingCharacteristics.Set_LabelOrientation(Value: UnicodeString);
begin
  SetAttribute('LabelOrientation', Value);
end;

function TXMLTransportLoadingCharacteristics.Get_IsSlotManaged: UnicodeString;
begin
  Result := AttributeNodes['IsSlotManaged'].Text;
end;

procedure TXMLTransportLoadingCharacteristics.Set_IsSlotManaged(Value: UnicodeString);
begin
  SetAttribute('IsSlotManaged', Value);
end;

function TXMLTransportLoadingCharacteristics.Get_IsCarrierLoadingOperator: UnicodeString;
begin
  Result := AttributeNodes['IsCarrierLoadingOperator'].Text;
end;

procedure TXMLTransportLoadingCharacteristics.Set_IsCarrierLoadingOperator(Value: UnicodeString);
begin
  SetAttribute('IsCarrierLoadingOperator', Value);
end;

function TXMLTransportLoadingCharacteristics.Get_TransportLoadingCode: IXMLTransportLoadingCode;
begin
  Result := ChildNodes['TransportLoadingCode'] as IXMLTransportLoadingCode;
end;

function TXMLTransportLoadingCharacteristics.Get_TransportLoadingCodeDescription: IXMLTransportLoadingCodeDescription;
begin
  Result := ChildNodes['TransportLoadingCodeDescription'] as IXMLTransportLoadingCodeDescription;
end;

function TXMLTransportLoadingCharacteristics.Get_TransportLoadingText: IXMLS255List;
begin
  Result := FTransportLoadingText;
end;

function TXMLTransportLoadingCharacteristics.Get_GoodsLoadingSequence: IXMLGoodsLoadingSequence;
begin
  Result := ChildNodes['GoodsLoadingSequence'] as IXMLGoodsLoadingSequence;
end;

function TXMLTransportLoadingCharacteristics.Get_LoadingFrom: IXMLLoadingFrom;
begin
  Result := ChildNodes['LoadingFrom'] as IXMLLoadingFrom;
end;

{ TXMLTransportLoadingCharacteristicsList }

function TXMLTransportLoadingCharacteristicsList.Add: IXMLTransportLoadingCharacteristics;
begin
  Result := AddItem(-1) as IXMLTransportLoadingCharacteristics;
end;

function TXMLTransportLoadingCharacteristicsList.Insert(const Index: Integer): IXMLTransportLoadingCharacteristics;
begin
  Result := AddItem(Index) as IXMLTransportLoadingCharacteristics;
end;

function TXMLTransportLoadingCharacteristicsList.Get_Item(Index: Integer): IXMLTransportLoadingCharacteristics;
begin
  Result := List[Index] as IXMLTransportLoadingCharacteristics;
end;

{ TXMLTransportLoadingCode }

function TXMLTransportLoadingCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTransportLoadingCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTransportLoadingCodeDescription }

procedure TXMLTransportLoadingCodeDescription.AfterConstruction;
begin
  RegisterChildNode('e-Attachment', TXMLEAttachment);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLTransportLoadingCodeDescription.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLTransportLoadingCodeDescription.Get_EAttachment: IXMLEAttachment;
begin
  Result := ChildNodes['e-Attachment'] as IXMLEAttachment;
end;

{ TXMLGoodsLoadingSequence }

procedure TXMLGoodsLoadingSequence.AfterConstruction;
begin
  RegisterChildNode('TransportUnitReferenceIDInfo', TXMLTransportUnitReferenceIDInfo);
  RegisterChildNode('LoadingSequence', TXMLLoadingSequence);
  FTransportUnitReferenceIDInfo := CreateCollection(TXMLTransportUnitReferenceIDInfoList, IXMLTransportUnitReferenceIDInfo, 'TransportUnitReferenceIDInfo') as IXMLTransportUnitReferenceIDInfoList;
  FLoadingSequence := CreateCollection(TXMLLoadingSequenceList, IXMLLoadingSequence, 'LoadingSequence') as IXMLLoadingSequenceList;
  inherited;
end;

function TXMLGoodsLoadingSequence.Get_LoadingSequenceType: UnicodeString;
begin
  Result := AttributeNodes['LoadingSequenceType'].Text;
end;

procedure TXMLGoodsLoadingSequence.Set_LoadingSequenceType(Value: UnicodeString);
begin
  SetAttribute('LoadingSequenceType', Value);
end;

function TXMLGoodsLoadingSequence.Get_TransportUnitReferenceIDInfo: IXMLTransportUnitReferenceIDInfoList;
begin
  Result := FTransportUnitReferenceIDInfo;
end;

function TXMLGoodsLoadingSequence.Get_LoadingSequence: IXMLLoadingSequenceList;
begin
  Result := FLoadingSequence;
end;

{ TXMLLoadingSequence }

procedure TXMLLoadingSequence.AfterConstruction;
begin
  RegisterChildNode('DocumentReferenceInformation', TXMLDocumentReferenceInformation);
  FDocumentReferenceInformation := CreateCollection(TXMLDocumentReferenceInformationList, IXMLDocumentReferenceInformation, 'DocumentReferenceInformation') as IXMLDocumentReferenceInformationList;
  inherited;
end;

function TXMLLoadingSequence.Get_SequenceNumber: LongWord;
begin
  Result := ChildNodes['SequenceNumber'].NodeValue;
end;

procedure TXMLLoadingSequence.Set_SequenceNumber(Value: LongWord);
begin
  ChildNodes['SequenceNumber'].NodeValue := Value;
end;

function TXMLLoadingSequence.Get_DocumentReferenceInformation: IXMLDocumentReferenceInformationList;
begin
  Result := FDocumentReferenceInformation;
end;

{ TXMLLoadingSequenceList }

function TXMLLoadingSequenceList.Add: IXMLLoadingSequence;
begin
  Result := AddItem(-1) as IXMLLoadingSequence;
end;

function TXMLLoadingSequenceList.Insert(const Index: Integer): IXMLLoadingSequence;
begin
  Result := AddItem(Index) as IXMLLoadingSequence;
end;

function TXMLLoadingSequenceList.Get_Item(Index: Integer): IXMLLoadingSequence;
begin
  Result := List[Index] as IXMLLoadingSequence;
end;

{ TXMLLoadingFrom }

procedure TXMLLoadingFrom.AfterConstruction;
begin
  RegisterChildNode('TransportUnitCharacteristics', TXMLTransportUnitCharacteristics);
  inherited;
end;

function TXMLLoadingFrom.Get_TransportUnitCharacteristics: IXMLTransportUnitCharacteristics;
begin
  Result := ChildNodes['TransportUnitCharacteristics'] as IXMLTransportUnitCharacteristics;
end;

{ TXMLTransportUnloadingCharacteristics }

procedure TXMLTransportUnloadingCharacteristics.AfterConstruction;
begin
  RegisterChildNode('TransportUnloadingCode', TXMLTransportUnloadingCode);
  RegisterChildNode('TransportUnloadingCodeDescription', TXMLTransportUnloadingCodeDescription);
  FTransportUnloadingText := CreateCollection(TXMLS255List, IXMLNode, 'TransportUnloadingText') as IXMLS255List;
  inherited;
end;

function TXMLTransportUnloadingCharacteristics.Get_TransportUnloadingType: UnicodeString;
begin
  Result := AttributeNodes['TransportUnloadingType'].Text;
end;

procedure TXMLTransportUnloadingCharacteristics.Set_TransportUnloadingType(Value: UnicodeString);
begin
  SetAttribute('TransportUnloadingType', Value);
end;

function TXMLTransportUnloadingCharacteristics.Get_DirectUnloading: UnicodeString;
begin
  Result := AttributeNodes['DirectUnloading'].Text;
end;

procedure TXMLTransportUnloadingCharacteristics.Set_DirectUnloading(Value: UnicodeString);
begin
  SetAttribute('DirectUnloading', Value);
end;

function TXMLTransportUnloadingCharacteristics.Get_IsSlotManaged: UnicodeString;
begin
  Result := AttributeNodes['IsSlotManaged'].Text;
end;

procedure TXMLTransportUnloadingCharacteristics.Set_IsSlotManaged(Value: UnicodeString);
begin
  SetAttribute('IsSlotManaged', Value);
end;

function TXMLTransportUnloadingCharacteristics.Get_IsCarrierUnloadingOperator: UnicodeString;
begin
  Result := AttributeNodes['IsCarrierUnloadingOperator'].Text;
end;

procedure TXMLTransportUnloadingCharacteristics.Set_IsCarrierUnloadingOperator(Value: UnicodeString);
begin
  SetAttribute('IsCarrierUnloadingOperator', Value);
end;

function TXMLTransportUnloadingCharacteristics.Get_TransportUnloadingCode: IXMLTransportUnloadingCode;
begin
  Result := ChildNodes['TransportUnloadingCode'] as IXMLTransportUnloadingCode;
end;

function TXMLTransportUnloadingCharacteristics.Get_TransportUnloadingCodeDescription: IXMLTransportUnloadingCodeDescription;
begin
  Result := ChildNodes['TransportUnloadingCodeDescription'] as IXMLTransportUnloadingCodeDescription;
end;

function TXMLTransportUnloadingCharacteristics.Get_TransportUnloadingText: IXMLS255List;
begin
  Result := FTransportUnloadingText;
end;

{ TXMLTransportUnloadingCharacteristicsList }

function TXMLTransportUnloadingCharacteristicsList.Add: IXMLTransportUnloadingCharacteristics;
begin
  Result := AddItem(-1) as IXMLTransportUnloadingCharacteristics;
end;

function TXMLTransportUnloadingCharacteristicsList.Insert(const Index: Integer): IXMLTransportUnloadingCharacteristics;
begin
  Result := AddItem(Index) as IXMLTransportUnloadingCharacteristics;
end;

function TXMLTransportUnloadingCharacteristicsList.Get_Item(Index: Integer): IXMLTransportUnloadingCharacteristics;
begin
  Result := List[Index] as IXMLTransportUnloadingCharacteristics;
end;

{ TXMLTransportUnloadingCode }

function TXMLTransportUnloadingCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTransportUnloadingCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTransportUnloadingCodeDescription }

procedure TXMLTransportUnloadingCodeDescription.AfterConstruction;
begin
  RegisterChildNode('e-Attachment', TXMLEAttachment);
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLTransportUnloadingCodeDescription.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLTransportUnloadingCodeDescription.Get_EAttachment: IXMLEAttachment;
begin
  Result := ChildNodes['e-Attachment'] as IXMLEAttachment;
end;

{ TXMLTransportOtherInstructions }

procedure TXMLTransportOtherInstructions.AfterConstruction;
begin
  RegisterChildNode('TransportInstructionCode', TXMLTransportInstructionCode);
  RegisterChildNode('TransportPropertyValue', TXMLTransportPropertyValue);
  RegisterChildNode('OtherDate', TXMLOtherDate);
  RegisterChildNode('LocationParty', TXMLLocationParty);
  FTransportInstructionText := CreateCollection(TXMLS255List, IXMLNode, 'TransportInstructionText') as IXMLS255List;
  FTransportPropertyValue := CreateCollection(TXMLTransportPropertyValueList, IXMLTransportPropertyValue, 'TransportPropertyValue') as IXMLTransportPropertyValueList;
  FOtherDate := CreateCollection(TXMLOtherDateList, IXMLOtherDate, 'OtherDate') as IXMLOtherDateList;
  FLocationParty := CreateCollection(TXMLLocationPartyList, IXMLLocationParty, 'LocationParty') as IXMLLocationPartyList;
  inherited;
end;

function TXMLTransportOtherInstructions.Get_TransportInstructionType: UnicodeString;
begin
  Result := AttributeNodes['TransportInstructionType'].Text;
end;

procedure TXMLTransportOtherInstructions.Set_TransportInstructionType(Value: UnicodeString);
begin
  SetAttribute('TransportInstructionType', Value);
end;

function TXMLTransportOtherInstructions.Get_TransportInstructionCode: IXMLTransportInstructionCode;
begin
  Result := ChildNodes['TransportInstructionCode'] as IXMLTransportInstructionCode;
end;

function TXMLTransportOtherInstructions.Get_TransportInstructionText: IXMLS255List;
begin
  Result := FTransportInstructionText;
end;

function TXMLTransportOtherInstructions.Get_TransportPropertyValue: IXMLTransportPropertyValueList;
begin
  Result := FTransportPropertyValue;
end;

function TXMLTransportOtherInstructions.Get_OtherDate: IXMLOtherDateList;
begin
  Result := FOtherDate;
end;

function TXMLTransportOtherInstructions.Get_LocationParty: IXMLLocationPartyList;
begin
  Result := FLocationParty;
end;

{ TXMLTransportOtherInstructionsList }

function TXMLTransportOtherInstructionsList.Add: IXMLTransportOtherInstructions;
begin
  Result := AddItem(-1) as IXMLTransportOtherInstructions;
end;

function TXMLTransportOtherInstructionsList.Insert(const Index: Integer): IXMLTransportOtherInstructions;
begin
  Result := AddItem(Index) as IXMLTransportOtherInstructions;
end;

function TXMLTransportOtherInstructionsList.Get_Item(Index: Integer): IXMLTransportOtherInstructions;
begin
  Result := List[Index] as IXMLTransportOtherInstructions;
end;

{ TXMLTransportInstructionCode }

function TXMLTransportInstructionCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLTransportInstructionCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLTransportPropertyValue }

procedure TXMLTransportPropertyValue.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  RegisterChildNode('RangeMin', TXMLRangeMin);
  RegisterChildNode('RangeMax', TXMLRangeMax);
  RegisterChildNode('PriceDetails', TXMLPriceDetails);
  inherited;
end;

function TXMLTransportPropertyValue.Get_TransportPropertyType: UnicodeString;
begin
  Result := AttributeNodes['TransportPropertyType'].Text;
end;

procedure TXMLTransportPropertyValue.Set_TransportPropertyType(Value: UnicodeString);
begin
  SetAttribute('TransportPropertyType', Value);
end;

function TXMLTransportPropertyValue.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

function TXMLTransportPropertyValue.Get_RangeMin: IXMLRangeMin;
begin
  Result := ChildNodes['RangeMin'] as IXMLRangeMin;
end;

function TXMLTransportPropertyValue.Get_RangeMax: IXMLRangeMax;
begin
  Result := ChildNodes['RangeMax'] as IXMLRangeMax;
end;

function TXMLTransportPropertyValue.Get_PriceDetails: IXMLPriceDetails;
begin
  Result := ChildNodes['PriceDetails'] as IXMLPriceDetails;
end;

{ TXMLTransportPropertyValueList }

function TXMLTransportPropertyValueList.Add: IXMLTransportPropertyValue;
begin
  Result := AddItem(-1) as IXMLTransportPropertyValue;
end;

function TXMLTransportPropertyValueList.Insert(const Index: Integer): IXMLTransportPropertyValue;
begin
  Result := AddItem(Index) as IXMLTransportPropertyValue;
end;

function TXMLTransportPropertyValueList.Get_Item(Index: Integer): IXMLTransportPropertyValue;
begin
  Result := List[Index] as IXMLTransportPropertyValue;
end;

{ TXMLRoute }

procedure TXMLRoute.AfterConstruction;
begin
  RegisterChildNode('RouteLocation', TXMLRouteLocation);
  RegisterChildNode('SupplyPoint', TXMLSupplyPoint);
  RegisterChildNode('MapPoint', TXMLMapPoint);
  RegisterChildNode('RouteReference', TXMLRouteReference);
  RegisterChildNode('RouteLength', TXMLRouteLength);
  RegisterChildNode('RouteDefinition', TXMLRouteDefinition);
  RegisterChildNode('eAttachment', TXMLEAttachment);
  RegisterChildNode('RouteLeg', TXMLRouteLeg);
  FRouteComment := CreateCollection(TXMLS255List, IXMLNode, 'RouteComment') as IXMLS255List;
  FRouteLocation := CreateCollection(TXMLRouteLocationList, IXMLRouteLocation, 'RouteLocation') as IXMLRouteLocationList;
  FSupplyPoint := CreateCollection(TXMLSupplyPointList, IXMLSupplyPoint, 'SupplyPoint') as IXMLSupplyPointList;
  FMapPoint := CreateCollection(TXMLMapPointList, IXMLMapPoint, 'MapPoint') as IXMLMapPointList;
  FRouteReference := CreateCollection(TXMLRouteReferenceList, IXMLRouteReference, 'RouteReference') as IXMLRouteReferenceList;
  FRouteLength := CreateCollection(TXMLRouteLengthList, IXMLRouteLength, 'RouteLength') as IXMLRouteLengthList;
  FRouteLeg := CreateCollection(TXMLRouteLegList, IXMLRouteLeg, 'RouteLeg') as IXMLRouteLegList;
  inherited;
end;

function TXMLRoute.Get_RouteType: UnicodeString;
begin
  Result := AttributeNodes['RouteType'].Text;
end;

procedure TXMLRoute.Set_RouteType(Value: UnicodeString);
begin
  SetAttribute('RouteType', Value);
end;

function TXMLRoute.Get_IsWithLoad: UnicodeString;
begin
  Result := AttributeNodes['IsWithLoad'].Text;
end;

procedure TXMLRoute.Set_IsWithLoad(Value: UnicodeString);
begin
  SetAttribute('IsWithLoad', Value);
end;

function TXMLRoute.Get_RouteSeasonType: UnicodeString;
begin
  Result := AttributeNodes['RouteSeasonType'].Text;
end;

procedure TXMLRoute.Set_RouteSeasonType(Value: UnicodeString);
begin
  SetAttribute('RouteSeasonType', Value);
end;

function TXMLRoute.Get_IsRouteAsInstructed: UnicodeString;
begin
  Result := AttributeNodes['IsRouteAsInstructed'].Text;
end;

procedure TXMLRoute.Set_IsRouteAsInstructed(Value: UnicodeString);
begin
  SetAttribute('IsRouteAsInstructed', Value);
end;

function TXMLRoute.Get_RouteName: UnicodeString;
begin
  Result := ChildNodes['RouteName'].Text;
end;

procedure TXMLRoute.Set_RouteName(Value: UnicodeString);
begin
  ChildNodes['RouteName'].NodeValue := Value;
end;

function TXMLRoute.Get_RouteComment: IXMLS255List;
begin
  Result := FRouteComment;
end;

function TXMLRoute.Get_RouteLocation: IXMLRouteLocationList;
begin
  Result := FRouteLocation;
end;

function TXMLRoute.Get_SupplyPoint: IXMLSupplyPointList;
begin
  Result := FSupplyPoint;
end;

function TXMLRoute.Get_MapPoint: IXMLMapPointList;
begin
  Result := FMapPoint;
end;

function TXMLRoute.Get_RouteReference: IXMLRouteReferenceList;
begin
  Result := FRouteReference;
end;

function TXMLRoute.Get_RouteLength: IXMLRouteLengthList;
begin
  Result := FRouteLength;
end;

function TXMLRoute.Get_RouteDefinition: IXMLRouteDefinition;
begin
  Result := ChildNodes['RouteDefinition'] as IXMLRouteDefinition;
end;

function TXMLRoute.Get_EAttachment: IXMLEAttachment;
begin
  Result := ChildNodes['eAttachment'] as IXMLEAttachment;
end;

function TXMLRoute.Get_RouteLeg: IXMLRouteLegList;
begin
  Result := FRouteLeg;
end;

{ TXMLRouteList }

function TXMLRouteList.Add: IXMLRoute;
begin
  Result := AddItem(-1) as IXMLRoute;
end;

function TXMLRouteList.Insert(const Index: Integer): IXMLRoute;
begin
  Result := AddItem(Index) as IXMLRoute;
end;

function TXMLRouteList.Get_Item(Index: Integer): IXMLRoute;
begin
  Result := List[Index] as IXMLRoute;
end;

{ TXMLRouteLocation }

procedure TXMLRouteLocation.AfterConstruction;
begin
  RegisterChildNode('LocationParty', TXMLLocationParty);
  RegisterChildNode('SupplyPoint', TXMLSupplyPoint);
  inherited;
end;

function TXMLRouteLocation.Get_LocationParty: IXMLLocationParty;
begin
  Result := ChildNodes['LocationParty'] as IXMLLocationParty;
end;

function TXMLRouteLocation.Get_SupplyPoint: IXMLSupplyPoint;
begin
  Result := ChildNodes['SupplyPoint'] as IXMLSupplyPoint;
end;

{ TXMLRouteLocationList }

function TXMLRouteLocationList.Add: IXMLRouteLocation;
begin
  Result := AddItem(-1) as IXMLRouteLocation;
end;

function TXMLRouteLocationList.Insert(const Index: Integer): IXMLRouteLocation;
begin
  Result := AddItem(Index) as IXMLRouteLocation;
end;

function TXMLRouteLocationList.Get_Item(Index: Integer): IXMLRouteLocation;
begin
  Result := List[Index] as IXMLRouteLocation;
end;

{ TXMLRouteReference }

function TXMLRouteReference.Get_RouteReferenceType: UnicodeString;
begin
  Result := AttributeNodes['RouteReferenceType'].Text;
end;

procedure TXMLRouteReference.Set_RouteReferenceType(Value: UnicodeString);
begin
  SetAttribute('RouteReferenceType', Value);
end;

function TXMLRouteReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLRouteReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLRouteReferenceList }

function TXMLRouteReferenceList.Add: IXMLRouteReference;
begin
  Result := AddItem(-1) as IXMLRouteReference;
end;

function TXMLRouteReferenceList.Insert(const Index: Integer): IXMLRouteReference;
begin
  Result := AddItem(Index) as IXMLRouteReference;
end;

function TXMLRouteReferenceList.Get_Item(Index: Integer): IXMLRouteReference;
begin
  Result := List[Index] as IXMLRouteReference;
end;

{ TXMLRouteLength }

function TXMLRouteLength.Get_LengthType: UnicodeString;
begin
  Result := AttributeNodes['LengthType'].Text;
end;

procedure TXMLRouteLength.Set_LengthType(Value: UnicodeString);
begin
  SetAttribute('LengthType', Value);
end;

function TXMLRouteLength.Get_LengthTypeVersion: UnicodeString;
begin
  Result := AttributeNodes['LengthTypeVersion'].Text;
end;

procedure TXMLRouteLength.Set_LengthTypeVersion(Value: UnicodeString);
begin
  SetAttribute('LengthTypeVersion', Value);
end;

function TXMLRouteLength.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLRouteLength.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLRouteLengthList }

function TXMLRouteLengthList.Add: IXMLRouteLength;
begin
  Result := AddItem(-1) as IXMLRouteLength;
end;

function TXMLRouteLengthList.Insert(const Index: Integer): IXMLRouteLength;
begin
  Result := AddItem(Index) as IXMLRouteLength;
end;

function TXMLRouteLengthList.Get_Item(Index: Integer): IXMLRouteLength;
begin
  Result := List[Index] as IXMLRouteLength;
end;

{ TXMLRouteDefinition }

function TXMLRouteDefinition.Get_RouteDefinitionFormat: UnicodeString;
begin
  Result := AttributeNodes['RouteDefinitionFormat'].Text;
end;

procedure TXMLRouteDefinition.Set_RouteDefinitionFormat(Value: UnicodeString);
begin
  SetAttribute('RouteDefinitionFormat', Value);
end;

{ TXMLRouteLeg }

procedure TXMLRouteLeg.AfterConstruction;
begin
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('MapPoint', TXMLMapPoint);
  RegisterChildNode('RouteReference', TXMLRouteReference);
  RegisterChildNode('RouteLegLength', TXMLRouteLegLength);
  RegisterChildNode('RoadCharacteristics', TXMLRoadCharacteristics);
  RegisterChildNode('eAttachment', TXMLEAttachment);
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FMapPoint := CreateCollection(TXMLMapPointList, IXMLMapPoint, 'MapPoint') as IXMLMapPointList;
  FRouteReference := CreateCollection(TXMLRouteReferenceList, IXMLRouteReference, 'RouteReference') as IXMLRouteReferenceList;
  FRouteLegLength := CreateCollection(TXMLRouteLegLengthList, IXMLRouteLegLength, 'RouteLegLength') as IXMLRouteLegLengthList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLRouteLeg.Get_RouteLegNumber: LongWord;
begin
  Result := ChildNodes['RouteLegNumber'].NodeValue;
end;

procedure TXMLRouteLeg.Set_RouteLegNumber(Value: LongWord);
begin
  ChildNodes['RouteLegNumber'].NodeValue := Value;
end;

function TXMLRouteLeg.Get_RouteLegName: UnicodeString;
begin
  Result := ChildNodes['RouteLegName'].Text;
end;

procedure TXMLRouteLeg.Set_RouteLegName(Value: UnicodeString);
begin
  ChildNodes['RouteLegName'].NodeValue := Value;
end;

function TXMLRouteLeg.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLRouteLeg.Get_MapPoint: IXMLMapPointList;
begin
  Result := FMapPoint;
end;

function TXMLRouteLeg.Get_RouteReference: IXMLRouteReferenceList;
begin
  Result := FRouteReference;
end;

function TXMLRouteLeg.Get_RouteLegLength: IXMLRouteLegLengthList;
begin
  Result := FRouteLegLength;
end;

function TXMLRouteLeg.Get_RoadCharacteristics: IXMLRoadCharacteristics;
begin
  Result := ChildNodes['RoadCharacteristics'] as IXMLRoadCharacteristics;
end;

function TXMLRouteLeg.Get_EAttachment: IXMLEAttachment;
begin
  Result := ChildNodes['eAttachment'] as IXMLEAttachment;
end;

function TXMLRouteLeg.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLRouteLegList }

function TXMLRouteLegList.Add: IXMLRouteLeg;
begin
  Result := AddItem(-1) as IXMLRouteLeg;
end;

function TXMLRouteLegList.Insert(const Index: Integer): IXMLRouteLeg;
begin
  Result := AddItem(Index) as IXMLRouteLeg;
end;

function TXMLRouteLegList.Get_Item(Index: Integer): IXMLRouteLeg;
begin
  Result := List[Index] as IXMLRouteLeg;
end;

{ TXMLRouteLegLength }

function TXMLRouteLegLength.Get_LengthType: UnicodeString;
begin
  Result := AttributeNodes['LengthType'].Text;
end;

procedure TXMLRouteLegLength.Set_LengthType(Value: UnicodeString);
begin
  SetAttribute('LengthType', Value);
end;

function TXMLRouteLegLength.Get_LengthTypeVersion: UnicodeString;
begin
  Result := AttributeNodes['LengthTypeVersion'].Text;
end;

procedure TXMLRouteLegLength.Set_LengthTypeVersion(Value: UnicodeString);
begin
  SetAttribute('LengthTypeVersion', Value);
end;

function TXMLRouteLegLength.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLRouteLegLength.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLRouteLegLengthList }

function TXMLRouteLegLengthList.Add: IXMLRouteLegLength;
begin
  Result := AddItem(-1) as IXMLRouteLegLength;
end;

function TXMLRouteLegLengthList.Insert(const Index: Integer): IXMLRouteLegLength;
begin
  Result := AddItem(Index) as IXMLRouteLegLength;
end;

function TXMLRouteLegLengthList.Get_Item(Index: Integer): IXMLRouteLegLength;
begin
  Result := List[Index] as IXMLRouteLegLength;
end;

{ TXMLRoadCharacteristics }

procedure TXMLRoadCharacteristics.AfterConstruction;
begin
  RegisterChildNode('RoadClassification', TXMLRoadClassification);
  RegisterChildNode('RoadBearingCapacity', TXMLRoadBearingCapacity);
  RegisterChildNode('RoadObstruction', TXMLRoadObstruction);
  RegisterChildNode('RoadMaintenanceInfo', TXMLRoadMaintenanceInfo);
  FRoadClassification := CreateCollection(TXMLRoadClassificationList, IXMLRoadClassification, 'RoadClassification') as IXMLRoadClassificationList;
  FRoadAvailability := CreateCollection(TXMLRoadAvailabilityTypeList, IXMLNode, 'RoadAvailability') as IXMLRoadAvailabilityTypeList;
  FRoadBearingCapacity := CreateCollection(TXMLRoadBearingCapacityList, IXMLRoadBearingCapacity, 'RoadBearingCapacity') as IXMLRoadBearingCapacityList;
  FRoadObstruction := CreateCollection(TXMLRoadObstructionList, IXMLRoadObstruction, 'RoadObstruction') as IXMLRoadObstructionList;
  FRoadMaintenanceInfo := CreateCollection(TXMLRoadMaintenanceInfoList, IXMLRoadMaintenanceInfo, 'RoadMaintenanceInfo') as IXMLRoadMaintenanceInfoList;
  inherited;
end;

function TXMLRoadCharacteristics.Get_RoadOwnerType: UnicodeString;
begin
  Result := AttributeNodes['RoadOwnerType'].Text;
end;

procedure TXMLRoadCharacteristics.Set_RoadOwnerType(Value: UnicodeString);
begin
  SetAttribute('RoadOwnerType', Value);
end;

function TXMLRoadCharacteristics.Get_RoadKeeperType: UnicodeString;
begin
  Result := AttributeNodes['RoadKeeperType'].Text;
end;

procedure TXMLRoadCharacteristics.Set_RoadKeeperType(Value: UnicodeString);
begin
  SetAttribute('RoadKeeperType', Value);
end;

function TXMLRoadCharacteristics.Get_RoadAccessibilityType: UnicodeString;
begin
  Result := AttributeNodes['RoadAccessibilityType'].Text;
end;

procedure TXMLRoadCharacteristics.Set_RoadAccessibilityType(Value: UnicodeString);
begin
  SetAttribute('RoadAccessibilityType', Value);
end;

function TXMLRoadCharacteristics.Get_RoadTurningPossibilityType: UnicodeString;
begin
  Result := AttributeNodes['RoadTurningPossibilityType'].Text;
end;

procedure TXMLRoadCharacteristics.Set_RoadTurningPossibilityType(Value: UnicodeString);
begin
  SetAttribute('RoadTurningPossibilityType', Value);
end;

function TXMLRoadCharacteristics.Get_RoadTurningPointType: UnicodeString;
begin
  Result := AttributeNodes['RoadTurningPointType'].Text;
end;

procedure TXMLRoadCharacteristics.Set_RoadTurningPointType(Value: UnicodeString);
begin
  SetAttribute('RoadTurningPointType', Value);
end;

function TXMLRoadCharacteristics.Get_RoadPassingPossibility: UnicodeString;
begin
  Result := AttributeNodes['RoadPassingPossibility'].Text;
end;

procedure TXMLRoadCharacteristics.Set_RoadPassingPossibility(Value: UnicodeString);
begin
  SetAttribute('RoadPassingPossibility', Value);
end;

function TXMLRoadCharacteristics.Get_IsDeadEndRoad: UnicodeString;
begin
  Result := AttributeNodes['IsDeadEndRoad'].Text;
end;

procedure TXMLRoadCharacteristics.Set_IsDeadEndRoad(Value: UnicodeString);
begin
  SetAttribute('IsDeadEndRoad', Value);
end;

function TXMLRoadCharacteristics.Get_RoadName: UnicodeString;
begin
  Result := ChildNodes['RoadName'].Text;
end;

procedure TXMLRoadCharacteristics.Set_RoadName(Value: UnicodeString);
begin
  ChildNodes['RoadName'].NodeValue := Value;
end;

function TXMLRoadCharacteristics.Get_RoadNumber: UnicodeString;
begin
  Result := ChildNodes['RoadNumber'].Text;
end;

procedure TXMLRoadCharacteristics.Set_RoadNumber(Value: UnicodeString);
begin
  ChildNodes['RoadNumber'].NodeValue := Value;
end;

function TXMLRoadCharacteristics.Get_RoadClassification: IXMLRoadClassificationList;
begin
  Result := FRoadClassification;
end;

function TXMLRoadCharacteristics.Get_RoadAvailability: IXMLRoadAvailabilityTypeList;
begin
  Result := FRoadAvailability;
end;

function TXMLRoadCharacteristics.Get_RoadBearingCapacity: IXMLRoadBearingCapacityList;
begin
  Result := FRoadBearingCapacity;
end;

function TXMLRoadCharacteristics.Get_RoadObstruction: IXMLRoadObstructionList;
begin
  Result := FRoadObstruction;
end;

function TXMLRoadCharacteristics.Get_RoadMaintenanceInfo: IXMLRoadMaintenanceInfoList;
begin
  Result := FRoadMaintenanceInfo;
end;

{ TXMLRoadClassification }

procedure TXMLRoadClassification.AfterConstruction;
begin
  RegisterChildNode('RoadClassificationCode', TXMLRoadClassificationCode);
  RegisterChildNode('CodeValue', TXMLCodeValue);
  FRoadClassificationDescription := CreateCollection(TXMLS255List, IXMLNode, 'RoadClassificationDescription') as IXMLS255List;
  inherited;
end;

function TXMLRoadClassification.Get_RoadClassificationCode: IXMLRoadClassificationCode;
begin
  Result := ChildNodes['RoadClassificationCode'] as IXMLRoadClassificationCode;
end;

function TXMLRoadClassification.Get_CodeValue: IXMLCodeValue;
begin
  Result := ChildNodes['CodeValue'] as IXMLCodeValue;
end;

function TXMLRoadClassification.Get_RoadClassificationDescription: IXMLS255List;
begin
  Result := FRoadClassificationDescription;
end;

{ TXMLRoadClassificationList }

function TXMLRoadClassificationList.Add: IXMLRoadClassification;
begin
  Result := AddItem(-1) as IXMLRoadClassification;
end;

function TXMLRoadClassificationList.Insert(const Index: Integer): IXMLRoadClassification;
begin
  Result := AddItem(Index) as IXMLRoadClassification;
end;

function TXMLRoadClassificationList.Get_Item(Index: Integer): IXMLRoadClassification;
begin
  Result := List[Index] as IXMLRoadClassification;
end;

{ TXMLRoadClassificationCode }

function TXMLRoadClassificationCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLRoadClassificationCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLRoadBearingCapacity }

function TXMLRoadBearingCapacity.Get_RoadBearingCapacityType: UnicodeString;
begin
  Result := AttributeNodes['RoadBearingCapacityType'].Text;
end;

procedure TXMLRoadBearingCapacity.Set_RoadBearingCapacityType(Value: UnicodeString);
begin
  SetAttribute('RoadBearingCapacityType', Value);
end;

{ TXMLRoadBearingCapacityList }

function TXMLRoadBearingCapacityList.Add: IXMLRoadBearingCapacity;
begin
  Result := AddItem(-1) as IXMLRoadBearingCapacity;
end;

function TXMLRoadBearingCapacityList.Insert(const Index: Integer): IXMLRoadBearingCapacity;
begin
  Result := AddItem(Index) as IXMLRoadBearingCapacity;
end;

function TXMLRoadBearingCapacityList.Get_Item(Index: Integer): IXMLRoadBearingCapacity;
begin
  Result := List[Index] as IXMLRoadBearingCapacity;
end;

{ TXMLRoadObstruction }

procedure TXMLRoadObstruction.AfterConstruction;
begin
  RegisterChildNode('MapCoordinates', TXMLMapCoordinates);
  RegisterChildNode('RoadBearingCapacity', TXMLRoadBearingCapacity);
  RegisterChildNode('Length', TXMLMeasurement);
  RegisterChildNode('Width', TXMLMeasurement);
  RegisterChildNode('Height', TXMLMeasurement);
  RegisterChildNode('eAttachment', TXMLEAttachment);
  FMapPointComment := CreateCollection(TXMLS255List, IXMLNode, 'MapPointComment') as IXMLS255List;
  FMapCoordinates := CreateCollection(TXMLMapCoordinatesList, IXMLMapCoordinates, 'MapCoordinates') as IXMLMapCoordinatesList;
  FRoadBearingCapacity := CreateCollection(TXMLRoadBearingCapacityList, IXMLRoadBearingCapacity, 'RoadBearingCapacity') as IXMLRoadBearingCapacityList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLRoadObstruction.Get_RoadObstructionType: UnicodeString;
begin
  Result := AttributeNodes['RoadObstructionType'].Text;
end;

procedure TXMLRoadObstruction.Set_RoadObstructionType(Value: UnicodeString);
begin
  SetAttribute('RoadObstructionType', Value);
end;

function TXMLRoadObstruction.Get_MapPointName: UnicodeString;
begin
  Result := ChildNodes['MapPointName'].Text;
end;

procedure TXMLRoadObstruction.Set_MapPointName(Value: UnicodeString);
begin
  ChildNodes['MapPointName'].NodeValue := Value;
end;

function TXMLRoadObstruction.Get_MapPointComment: IXMLS255List;
begin
  Result := FMapPointComment;
end;

function TXMLRoadObstruction.Get_MapCoordinates: IXMLMapCoordinatesList;
begin
  Result := FMapCoordinates;
end;

function TXMLRoadObstruction.Get_RoadSlopePercent: Double;
begin
  Result := XmlStrToFloatExt(ChildNodes['RoadSlopePercent'].Text);
end;

procedure TXMLRoadObstruction.Set_RoadSlopePercent(Value: Double);
begin
  ChildNodes['RoadSlopePercent'].NodeValue := Value;
end;

function TXMLRoadObstruction.Get_RoadBearingCapacity: IXMLRoadBearingCapacityList;
begin
  Result := FRoadBearingCapacity;
end;

function TXMLRoadObstruction.Get_Length: IXMLMeasurement;
begin
  Result := ChildNodes['Length'] as IXMLMeasurement;
end;

function TXMLRoadObstruction.Get_Width: IXMLMeasurement;
begin
  Result := ChildNodes['Width'] as IXMLMeasurement;
end;

function TXMLRoadObstruction.Get_Height: IXMLMeasurement;
begin
  Result := ChildNodes['Height'] as IXMLMeasurement;
end;

function TXMLRoadObstruction.Get_EAttachment: IXMLEAttachment;
begin
  Result := ChildNodes['eAttachment'] as IXMLEAttachment;
end;

function TXMLRoadObstruction.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLRoadObstructionList }

function TXMLRoadObstructionList.Add: IXMLRoadObstruction;
begin
  Result := AddItem(-1) as IXMLRoadObstruction;
end;

function TXMLRoadObstructionList.Insert(const Index: Integer): IXMLRoadObstruction;
begin
  Result := AddItem(Index) as IXMLRoadObstruction;
end;

function TXMLRoadObstructionList.Get_Item(Index: Integer): IXMLRoadObstruction;
begin
  Result := List[Index] as IXMLRoadObstruction;
end;

{ TXMLRoadMaintenanceInfo }

procedure TXMLRoadMaintenanceInfo.AfterConstruction;
begin
  RegisterChildNode('RoadMaintenanceCodeInfo', TXMLCodeInfo);
  RegisterChildNode('OtherDate', TXMLOtherDate);
  FOtherDate := CreateCollection(TXMLOtherDateList, IXMLOtherDate, 'OtherDate') as IXMLOtherDateList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLRoadMaintenanceInfo.Get_RoadMaintenanceCodeInfo: IXMLCodeInfo;
begin
  Result := ChildNodes['RoadMaintenanceCodeInfo'] as IXMLCodeInfo;
end;

function TXMLRoadMaintenanceInfo.Get_OtherDate: IXMLOtherDateList;
begin
  Result := FOtherDate;
end;

function TXMLRoadMaintenanceInfo.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLRoadMaintenanceInfoList }

function TXMLRoadMaintenanceInfoList.Add: IXMLRoadMaintenanceInfo;
begin
  Result := AddItem(-1) as IXMLRoadMaintenanceInfo;
end;

function TXMLRoadMaintenanceInfoList.Insert(const Index: Integer): IXMLRoadMaintenanceInfo;
begin
  Result := AddItem(Index) as IXMLRoadMaintenanceInfo;
end;

function TXMLRoadMaintenanceInfoList.Get_Item(Index: Integer): IXMLRoadMaintenanceInfo;
begin
  Result := List[Index] as IXMLRoadMaintenanceInfo;
end;

{ TXMLDeliveryTransitTime }

function TXMLDeliveryTransitTime.Get_Days: LongWord;
begin
  Result := ChildNodes['Days'].NodeValue;
end;

procedure TXMLDeliveryTransitTime.Set_Days(Value: LongWord);
begin
  ChildNodes['Days'].NodeValue := Value;
end;

function TXMLDeliveryTransitTime.Get_Hours: LongWord;
begin
  Result := ChildNodes['Hours'].NodeValue;
end;

procedure TXMLDeliveryTransitTime.Set_Hours(Value: LongWord);
begin
  ChildNodes['Hours'].NodeValue := Value;
end;

function TXMLDeliveryTransitTime.Get_Minutes: LongWord;
begin
  Result := ChildNodes['Minutes'].NodeValue;
end;

procedure TXMLDeliveryTransitTime.Set_Minutes(Value: LongWord);
begin
  ChildNodes['Minutes'].NodeValue := Value;
end;

{ TXMLDeliveryDestination }

procedure TXMLDeliveryDestination.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  RegisterChildNode('LocationParty', TXMLLocationParty);
  RegisterChildNode('SupplyPoint', TXMLSupplyPoint);
  RegisterChildNode('LocationCode', TXMLLocationCode);
  RegisterChildNode('GPSCoordinates', TXMLGPSCoordinates);
  RegisterChildNode('MapCoordinates', TXMLMapCoordinates);
  FSupplyPoint := CreateCollection(TXMLSupplyPointList, IXMLSupplyPoint, 'SupplyPoint') as IXMLSupplyPointList;
  FMapCoordinates := CreateCollection(TXMLMapCoordinatesList, IXMLMapCoordinates, 'MapCoordinates') as IXMLMapCoordinatesList;
  inherited;
end;

function TXMLDeliveryDestination.Get_IsOptionalDestination: UnicodeString;
begin
  Result := AttributeNodes['IsOptionalDestination'].Text;
end;

procedure TXMLDeliveryDestination.Set_IsOptionalDestination(Value: UnicodeString);
begin
  SetAttribute('IsOptionalDestination', Value);
end;

function TXMLDeliveryDestination.Get_PriorityOrder: LongWord;
begin
  Result := AttributeNodes['PriorityOrder'].NodeValue;
end;

procedure TXMLDeliveryDestination.Set_PriorityOrder(Value: LongWord);
begin
  SetAttribute('PriorityOrder', Value);
end;

function TXMLDeliveryDestination.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDeliveryDestination.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDeliveryDestination.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

function TXMLDeliveryDestination.Get_LocationParty: IXMLLocationParty;
begin
  Result := ChildNodes['LocationParty'] as IXMLLocationParty;
end;

function TXMLDeliveryDestination.Get_SupplyPoint: IXMLSupplyPointList;
begin
  Result := FSupplyPoint;
end;

function TXMLDeliveryDestination.Get_LocationCode: IXMLLocationCode;
begin
  Result := ChildNodes['LocationCode'] as IXMLLocationCode;
end;

function TXMLDeliveryDestination.Get_GPSCoordinates: IXMLGPSCoordinates;
begin
  Result := ChildNodes['GPSCoordinates'] as IXMLGPSCoordinates;
end;

function TXMLDeliveryDestination.Get_MapCoordinates: IXMLMapCoordinatesList;
begin
  Result := FMapCoordinates;
end;

{ TXMLDeliveryDestinationList }

function TXMLDeliveryDestinationList.Add: IXMLDeliveryDestination;
begin
  Result := AddItem(-1) as IXMLDeliveryDestination;
end;

function TXMLDeliveryDestinationList.Insert(const Index: Integer): IXMLDeliveryDestination;
begin
  Result := AddItem(Index) as IXMLDeliveryDestination;
end;

function TXMLDeliveryDestinationList.Get_Item(Index: Integer): IXMLDeliveryDestination;
begin
  Result := List[Index] as IXMLDeliveryDestination;
end;

{ TXMLDeliveryLegReference }

function TXMLDeliveryLegReference.Get_DeliveryLegReferenceType: UnicodeString;
begin
  Result := AttributeNodes['DeliveryLegReferenceType'].Text;
end;

procedure TXMLDeliveryLegReference.Set_DeliveryLegReferenceType(Value: UnicodeString);
begin
  SetAttribute('DeliveryLegReferenceType', Value);
end;

function TXMLDeliveryLegReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLDeliveryLegReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLDeliveryLegReferenceList }

function TXMLDeliveryLegReferenceList.Add: IXMLDeliveryLegReference;
begin
  Result := AddItem(-1) as IXMLDeliveryLegReference;
end;

function TXMLDeliveryLegReferenceList.Insert(const Index: Integer): IXMLDeliveryLegReference;
begin
  Result := AddItem(Index) as IXMLDeliveryLegReference;
end;

function TXMLDeliveryLegReferenceList.Get_Item(Index: Integer): IXMLDeliveryLegReference;
begin
  Result := List[Index] as IXMLDeliveryLegReference;
end;

{ TXMLTermsOfChartering }

function TXMLTermsOfChartering.Get_TermsOfCharteringType: UnicodeString;
begin
  Result := AttributeNodes['TermsOfCharteringType'].Text;
end;

procedure TXMLTermsOfChartering.Set_TermsOfCharteringType(Value: UnicodeString);
begin
  SetAttribute('TermsOfCharteringType', Value);
end;

{ TXMLTermsOfCharteringList }

function TXMLTermsOfCharteringList.Add: IXMLTermsOfChartering;
begin
  Result := AddItem(-1) as IXMLTermsOfChartering;
end;

function TXMLTermsOfCharteringList.Insert(const Index: Integer): IXMLTermsOfChartering;
begin
  Result := AddItem(Index) as IXMLTermsOfChartering;
end;

function TXMLTermsOfCharteringList.Get_Item(Index: Integer): IXMLTermsOfChartering;
begin
  Result := List[Index] as IXMLTermsOfChartering;
end;

{ TXMLBusinessChainInfo }

procedure TXMLBusinessChainInfo.AfterConstruction;
begin
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('ValidityPeriod', TXMLValidityPeriod);
  RegisterChildNode('BusinessChainSequence', TXMLBusinessChainSequence);
  FBusinessChainDescription := CreateCollection(TXMLS255List, IXMLNode, 'BusinessChainDescription') as IXMLS255List;
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FBusinessChainSequence := CreateCollection(TXMLBusinessChainSequenceList, IXMLBusinessChainSequence, 'BusinessChainSequence') as IXMLBusinessChainSequenceList;
  inherited;
end;

function TXMLBusinessChainInfo.Get_BusinessChainContextType: UnicodeString;
begin
  Result := AttributeNodes['BusinessChainContextType'].Text;
end;

procedure TXMLBusinessChainInfo.Set_BusinessChainContextType(Value: UnicodeString);
begin
  SetAttribute('BusinessChainContextType', Value);
end;

function TXMLBusinessChainInfo.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLBusinessChainInfo.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

function TXMLBusinessChainInfo.Get_ValidityStatus: UnicodeString;
begin
  Result := AttributeNodes['ValidityStatus'].Text;
end;

procedure TXMLBusinessChainInfo.Set_ValidityStatus(Value: UnicodeString);
begin
  SetAttribute('ValidityStatus', Value);
end;

function TXMLBusinessChainInfo.Get_BusinessChainNumber: UnicodeString;
begin
  Result := ChildNodes['BusinessChainNumber'].Text;
end;

procedure TXMLBusinessChainInfo.Set_BusinessChainNumber(Value: UnicodeString);
begin
  ChildNodes['BusinessChainNumber'].NodeValue := Value;
end;

function TXMLBusinessChainInfo.Get_BusinessChainDescription: IXMLS255List;
begin
  Result := FBusinessChainDescription;
end;

function TXMLBusinessChainInfo.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLBusinessChainInfo.Get_ValidityPeriod: IXMLValidityPeriod;
begin
  Result := ChildNodes['ValidityPeriod'] as IXMLValidityPeriod;
end;

function TXMLBusinessChainInfo.Get_BusinessChainSequence: IXMLBusinessChainSequenceList;
begin
  Result := FBusinessChainSequence;
end;

{ TXMLValidityPeriod }

procedure TXMLValidityPeriod.AfterConstruction;
begin
  RegisterChildNode('DateTimeFrom', TXMLDateTimeFrom);
  RegisterChildNode('DateTimeTo', TXMLDateTimeTo);
  inherited;
end;

function TXMLValidityPeriod.Get_DateTimeFrom: IXMLDateTimeFrom;
begin
  Result := ChildNodes['DateTimeFrom'] as IXMLDateTimeFrom;
end;

function TXMLValidityPeriod.Get_DateTimeTo: IXMLDateTimeTo;
begin
  Result := ChildNodes['DateTimeTo'] as IXMLDateTimeTo;
end;

{ TXMLBusinessChainSequence }

procedure TXMLBusinessChainSequence.AfterConstruction;
begin
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('ShipToCharacteristics', TXMLShipToCharacteristics);
  RegisterChildNode('DocumentReferenceInformation', TXMLDocumentReferenceInformation);
  RegisterChildNode('DocumentRequiredInfo', TXMLDocumentRequiredInfo);
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FDocumentReferenceInformation := CreateCollection(TXMLDocumentReferenceInformationList, IXMLDocumentReferenceInformation, 'DocumentReferenceInformation') as IXMLDocumentReferenceInformationList;
  FDocumentRequiredInfo := CreateCollection(TXMLDocumentRequiredInfoList, IXMLDocumentRequiredInfo, 'DocumentRequiredInfo') as IXMLDocumentRequiredInfoList;
  inherited;
end;

function TXMLBusinessChainSequence.Get_IsBusinessChainSequenceApplicable: UnicodeString;
begin
  Result := AttributeNodes['IsBusinessChainSequenceApplicable'].Text;
end;

procedure TXMLBusinessChainSequence.Set_IsBusinessChainSequenceApplicable(Value: UnicodeString);
begin
  SetAttribute('IsBusinessChainSequenceApplicable', Value);
end;

function TXMLBusinessChainSequence.Get_BusinessChainSequenceNumber: LongWord;
begin
  Result := ChildNodes['BusinessChainSequenceNumber'].NodeValue;
end;

procedure TXMLBusinessChainSequence.Set_BusinessChainSequenceNumber(Value: LongWord);
begin
  ChildNodes['BusinessChainSequenceNumber'].NodeValue := Value;
end;

function TXMLBusinessChainSequence.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLBusinessChainSequence.Get_ShipToCharacteristics: IXMLShipToCharacteristics;
begin
  Result := ChildNodes['ShipToCharacteristics'] as IXMLShipToCharacteristics;
end;

function TXMLBusinessChainSequence.Get_DocumentReferenceInformation: IXMLDocumentReferenceInformationList;
begin
  Result := FDocumentReferenceInformation;
end;

function TXMLBusinessChainSequence.Get_DocumentRequiredInfo: IXMLDocumentRequiredInfoList;
begin
  Result := FDocumentRequiredInfo;
end;

{ TXMLBusinessChainSequenceList }

function TXMLBusinessChainSequenceList.Add: IXMLBusinessChainSequence;
begin
  Result := AddItem(-1) as IXMLBusinessChainSequence;
end;

function TXMLBusinessChainSequenceList.Insert(const Index: Integer): IXMLBusinessChainSequence;
begin
  Result := AddItem(Index) as IXMLBusinessChainSequence;
end;

function TXMLBusinessChainSequenceList.Get_Item(Index: Integer): IXMLBusinessChainSequence;
begin
  Result := List[Index] as IXMLBusinessChainSequence;
end;

{ TXMLDocumentRequiredInfo }

procedure TXMLDocumentRequiredInfo.AfterConstruction;
begin
  RegisterChildNode('RespondToParty', TXMLTypedParty);
  FRespondToParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'RespondToParty') as IXMLTypedPartyList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLDocumentRequiredInfo.Get_DocumentName: UnicodeString;
begin
  Result := AttributeNodes['DocumentName'].Text;
end;

procedure TXMLDocumentRequiredInfo.Set_DocumentName(Value: UnicodeString);
begin
  SetAttribute('DocumentName', Value);
end;

function TXMLDocumentRequiredInfo.Get_DocumentType: UnicodeString;
begin
  Result := AttributeNodes['DocumentType'].Text;
end;

procedure TXMLDocumentRequiredInfo.Set_DocumentType(Value: UnicodeString);
begin
  SetAttribute('DocumentType', Value);
end;

function TXMLDocumentRequiredInfo.Get_DocumentFormatType: UnicodeString;
begin
  Result := AttributeNodes['DocumentFormatType'].Text;
end;

procedure TXMLDocumentRequiredInfo.Set_DocumentFormatType(Value: UnicodeString);
begin
  SetAttribute('DocumentFormatType', Value);
end;

function TXMLDocumentRequiredInfo.Get_DocumentExchangeType: UnicodeString;
begin
  Result := AttributeNodes['DocumentExchangeType'].Text;
end;

procedure TXMLDocumentRequiredInfo.Set_DocumentExchangeType(Value: UnicodeString);
begin
  SetAttribute('DocumentExchangeType', Value);
end;

function TXMLDocumentRequiredInfo.Get_RespondToParty: IXMLTypedPartyList;
begin
  Result := FRespondToParty;
end;

function TXMLDocumentRequiredInfo.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLDocumentRequiredInfoList }

function TXMLDocumentRequiredInfoList.Add: IXMLDocumentRequiredInfo;
begin
  Result := AddItem(-1) as IXMLDocumentRequiredInfo;
end;

function TXMLDocumentRequiredInfoList.Insert(const Index: Integer): IXMLDocumentRequiredInfo;
begin
  Result := AddItem(Index) as IXMLDocumentRequiredInfo;
end;

function TXMLDocumentRequiredInfoList.Get_Item(Index: Integer): IXMLDocumentRequiredInfo;
begin
  Result := List[Index] as IXMLDocumentRequiredInfo;
end;

{ TXMLDeliveryMessageLineItem }

procedure TXMLDeliveryMessageLineItem.AfterConstruction;
begin
  RegisterChildNode('PurchaseOrderInformation', TXMLPurchaseOrderInformation);
  RegisterChildNode('DeliveryMessageReference', TXMLDeliveryMessageReference);
  RegisterChildNode('Product', TXMLProductClass);
  RegisterChildNode('InventoryClass', TXMLInventoryClass);
  RegisterChildNode('SupplyPoint', TXMLSupplyPoint);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('TransportOtherInstructions', TXMLTransportOtherInstructions);
  RegisterChildNode('TransportLoadingCharacteristics', TXMLTransportLoadingCharacteristics);
  RegisterChildNode('TransportUnloadingCharacteristics', TXMLTransportUnloadingCharacteristics);
  RegisterChildNode('BillToParty', TXMLParty);
  RegisterChildNode('MillCharacteristics', TXMLMillCharacteristics);
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('StatisticalGoodsInformation', TXMLStatisticalGoodsInformation);
  RegisterChildNode('PackageInformation', TXMLPackageInformationClass);
  RegisterChildNode('CountryOfOrigin', TXMLCountryOfOrigin);
  RegisterChildNode('CountryOfDestination', TXMLCountryOfDestination);
  RegisterChildNode('CountryOfConsumption', TXMLCountryOfConsumption);
  RegisterChildNode('OtherDate', TXMLOtherDate);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  RegisterChildNode('MeasuringSpecification', TXMLMeasuringSpecification);
  RegisterChildNode('AdditionalItemInfo', TXMLCodeInfo);
  FDeliveryMessageReference := CreateCollection(TXMLDeliveryMessageReferenceList, IXMLDeliveryMessageReference, 'DeliveryMessageReference') as IXMLDeliveryMessageReferenceList;
  FSupplyPoint := CreateCollection(TXMLSupplyPointList, IXMLSupplyPoint, 'SupplyPoint') as IXMLSupplyPointList;
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FTransportOtherInstructions := CreateCollection(TXMLTransportOtherInstructionsList, IXMLTransportOtherInstructions, 'TransportOtherInstructions') as IXMLTransportOtherInstructionsList;
  FTransportLoadingCharacteristics := CreateCollection(TXMLTransportLoadingCharacteristicsList, IXMLTransportLoadingCharacteristics, 'TransportLoadingCharacteristics') as IXMLTransportLoadingCharacteristicsList;
  FTransportUnloadingCharacteristics := CreateCollection(TXMLTransportUnloadingCharacteristicsList, IXMLTransportUnloadingCharacteristics, 'TransportUnloadingCharacteristics') as IXMLTransportUnloadingCharacteristicsList;
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FPackageInformation := CreateCollection(TXMLPackageInformationClassList, IXMLPackageInformationClass, 'PackageInformation') as IXMLPackageInformationClassList;
  FOtherDate := CreateCollection(TXMLOtherDateList, IXMLOtherDate, 'OtherDate') as IXMLOtherDateList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  FMeasuringSpecification := CreateCollection(TXMLMeasuringSpecificationList, IXMLMeasuringSpecification, 'MeasuringSpecification') as IXMLMeasuringSpecificationList;
  FAdditionalItemInfo := CreateCollection(TXMLCodeInfoList, IXMLCodeInfo, 'AdditionalItemInfo') as IXMLCodeInfoList;
  inherited;
end;

function TXMLDeliveryMessageLineItem.Get_ShipmentComplete: UnicodeString;
begin
  Result := AttributeNodes['ShipmentComplete'].Text;
end;

procedure TXMLDeliveryMessageLineItem.Set_ShipmentComplete(Value: UnicodeString);
begin
  SetAttribute('ShipmentComplete', Value);
end;

function TXMLDeliveryMessageLineItem.Get_InstructionByType: UnicodeString;
begin
  Result := AttributeNodes['InstructionByType'].Text;
end;

procedure TXMLDeliveryMessageLineItem.Set_InstructionByType(Value: UnicodeString);
begin
  SetAttribute('InstructionByType', Value);
end;

function TXMLDeliveryMessageLineItem.Get_DeliveryMessageLineItemNumber: LongWord;
begin
  Result := ChildNodes['DeliveryMessageLineItemNumber'].NodeValue;
end;

procedure TXMLDeliveryMessageLineItem.Set_DeliveryMessageLineItemNumber(Value: LongWord);
begin
  ChildNodes['DeliveryMessageLineItemNumber'].NodeValue := Value;
end;

function TXMLDeliveryMessageLineItem.Get_PurchaseOrderInformation: IXMLPurchaseOrderInformation;
begin
  Result := ChildNodes['PurchaseOrderInformation'] as IXMLPurchaseOrderInformation;
end;

function TXMLDeliveryMessageLineItem.Get_PurchaseOrderLineItemNumber: LongWord;
begin
  Result := ChildNodes['PurchaseOrderLineItemNumber'].NodeValue;
end;

procedure TXMLDeliveryMessageLineItem.Set_PurchaseOrderLineItemNumber(Value: LongWord);
begin
  ChildNodes['PurchaseOrderLineItemNumber'].NodeValue := Value;
end;

function TXMLDeliveryMessageLineItem.Get_DeliveryMessageReference: IXMLDeliveryMessageReferenceList;
begin
  Result := FDeliveryMessageReference;
end;

function TXMLDeliveryMessageLineItem.Get_Product: IXMLProductClass;
begin
  Result := ChildNodes['Product'] as IXMLProductClass;
end;

function TXMLDeliveryMessageLineItem.Get_InventoryClass: IXMLInventoryClass;
begin
  Result := ChildNodes['InventoryClass'] as IXMLInventoryClass;
end;

function TXMLDeliveryMessageLineItem.Get_NumberOfPackages: LongWord;
begin
  Result := ChildNodes['NumberOfPackages'].NodeValue;
end;

procedure TXMLDeliveryMessageLineItem.Set_NumberOfPackages(Value: LongWord);
begin
  ChildNodes['NumberOfPackages'].NodeValue := Value;
end;

function TXMLDeliveryMessageLineItem.Get_SupplyPoint: IXMLSupplyPointList;
begin
  Result := FSupplyPoint;
end;

function TXMLDeliveryMessageLineItem.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLDeliveryMessageLineItem.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLDeliveryMessageLineItem.Get_TransportOtherInstructions: IXMLTransportOtherInstructionsList;
begin
  Result := FTransportOtherInstructions;
end;

function TXMLDeliveryMessageLineItem.Get_TransportLoadingCharacteristics: IXMLTransportLoadingCharacteristicsList;
begin
  Result := FTransportLoadingCharacteristics;
end;

function TXMLDeliveryMessageLineItem.Get_TransportUnloadingCharacteristics: IXMLTransportUnloadingCharacteristicsList;
begin
  Result := FTransportUnloadingCharacteristics;
end;

function TXMLDeliveryMessageLineItem.Get_BillToParty: IXMLParty;
begin
  Result := ChildNodes['BillToParty'] as IXMLParty;
end;

function TXMLDeliveryMessageLineItem.Get_MillCharacteristics: IXMLMillCharacteristics;
begin
  Result := ChildNodes['MillCharacteristics'] as IXMLMillCharacteristics;
end;

function TXMLDeliveryMessageLineItem.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLDeliveryMessageLineItem.Get_StatisticalGoodsInformation: IXMLStatisticalGoodsInformation;
begin
  Result := ChildNodes['StatisticalGoodsInformation'] as IXMLStatisticalGoodsInformation;
end;

function TXMLDeliveryMessageLineItem.Get_PackageInformation: IXMLPackageInformationClassList;
begin
  Result := FPackageInformation;
end;

function TXMLDeliveryMessageLineItem.Get_CountryOfOrigin: IXMLCountryOfOrigin;
begin
  Result := ChildNodes['CountryOfOrigin'] as IXMLCountryOfOrigin;
end;

function TXMLDeliveryMessageLineItem.Get_CountryOfDestination: IXMLCountryOfDestination;
begin
  Result := ChildNodes['CountryOfDestination'] as IXMLCountryOfDestination;
end;

function TXMLDeliveryMessageLineItem.Get_CountryOfConsumption: IXMLCountryOfConsumption;
begin
  Result := ChildNodes['CountryOfConsumption'] as IXMLCountryOfConsumption;
end;

function TXMLDeliveryMessageLineItem.Get_OtherDate: IXMLOtherDateList;
begin
  Result := FOtherDate;
end;

function TXMLDeliveryMessageLineItem.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

function TXMLDeliveryMessageLineItem.Get_MeasuringSpecification: IXMLMeasuringSpecificationList;
begin
  Result := FMeasuringSpecification;
end;

function TXMLDeliveryMessageLineItem.Get_AdditionalItemInfo: IXMLCodeInfoList;
begin
  Result := FAdditionalItemInfo;
end;

{ TXMLInventoryClass }

procedure TXMLInventoryClass.AfterConstruction;
begin
  RegisterChildNode('InventoryClassCode', TXMLInventoryClassCode);
  FInventoryClassCode := CreateCollection(TXMLInventoryClassCodeList, IXMLInventoryClassCode, 'InventoryClassCode') as IXMLInventoryClassCodeList;
  FInventoryClassDescription := CreateCollection(TXMLS72List, IXMLNode, 'InventoryClassDescription') as IXMLS72List;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLInventoryClass.Get_InventoryStatusType: UnicodeString;
begin
  Result := AttributeNodes['InventoryStatusType'].Text;
end;

procedure TXMLInventoryClass.Set_InventoryStatusType(Value: UnicodeString);
begin
  SetAttribute('InventoryStatusType', Value);
end;

function TXMLInventoryClass.Get_InventoryOwnedBy: UnicodeString;
begin
  Result := AttributeNodes['InventoryOwnedBy'].Text;
end;

procedure TXMLInventoryClass.Set_InventoryOwnedBy(Value: UnicodeString);
begin
  SetAttribute('InventoryOwnedBy', Value);
end;

function TXMLInventoryClass.Get_InventoryClassCode: IXMLInventoryClassCodeList;
begin
  Result := FInventoryClassCode;
end;

function TXMLInventoryClass.Get_InventoryClassDescription: IXMLS72List;
begin
  Result := FInventoryClassDescription;
end;

function TXMLInventoryClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLInventoryClassCode }

function TXMLInventoryClassCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLInventoryClassCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

function TXMLInventoryClassCode.Get_InventoryClassLevel: LongWord;
begin
  Result := AttributeNodes['InventoryClassLevel'].NodeValue;
end;

procedure TXMLInventoryClassCode.Set_InventoryClassLevel(Value: LongWord);
begin
  SetAttribute('InventoryClassLevel', Value);
end;

{ TXMLInventoryClassCodeList }

function TXMLInventoryClassCodeList.Add: IXMLInventoryClassCode;
begin
  Result := AddItem(-1) as IXMLInventoryClassCode;
end;

function TXMLInventoryClassCodeList.Insert(const Index: Integer): IXMLInventoryClassCode;
begin
  Result := AddItem(Index) as IXMLInventoryClassCode;
end;

function TXMLInventoryClassCodeList.Get_Item(Index: Integer): IXMLInventoryClassCode;
begin
  Result := List[Index] as IXMLInventoryClassCode;
end;

{ TXMLPackageInformationClass }

procedure TXMLPackageInformationClass.AfterConstruction;
begin
  RegisterChildNode('Identifier', TXMLIdentifierS60);
  RegisterChildNode('RawMaterialSet', TXMLIdentifierS60);
  RegisterChildNode('PartyIdentifier', TXMLPartyIdentifier);
  RegisterChildNode('ItemCount', TXMLMeasurement);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('InventoryClass', TXMLInventoryClass);
  RegisterChildNode('PackageCharacteristics', TXMLPackageCharacteristics);
  RegisterChildNode('BaleItem', TXMLBaleItem);
  RegisterChildNode('BoxItem', TXMLBoxItem);
  RegisterChildNode('ReelItem', TXMLReelItem);
  RegisterChildNode('ReamItem', TXMLReamItem);
  RegisterChildNode('SheetItem', TXMLSheetItem);
  RegisterChildNode('UnitItem', TXMLUnitItem);
  RegisterChildNode('WoodItem', TXMLWoodItem);
  RegisterChildNode('OtherDate', TXMLOtherDate);
  RegisterChildNode('e-Attachment', TXMLEAttachment);
  RegisterChildNode('PackageReference', TXMLPackageReference);
  FIdentifier := CreateCollection(TXMLIdentifierS60List, IXMLIdentifierS60, 'Identifier') as IXMLIdentifierS60List;
  FSupplierMarks := CreateCollection(TXMLS30List, IXMLNode, 'SupplierMarks') as IXMLS30List;
  FRawMaterialSet := CreateCollection(TXMLIdentifierS60List, IXMLIdentifierS60, 'RawMaterialSet') as IXMLIdentifierS60List;
  FPartyIdentifier := CreateCollection(TXMLPartyIdentifierList, IXMLPartyIdentifier, 'PartyIdentifier') as IXMLPartyIdentifierList;
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FBaleItem := CreateCollection(TXMLBaleItemList, IXMLBaleItem, 'BaleItem') as IXMLBaleItemList;
  FBoxItem := CreateCollection(TXMLBoxItemList, IXMLBoxItem, 'BoxItem') as IXMLBoxItemList;
  FReelItem := CreateCollection(TXMLReelItemList, IXMLReelItem, 'ReelItem') as IXMLReelItemList;
  FReamItem := CreateCollection(TXMLReamItemList, IXMLReamItem, 'ReamItem') as IXMLReamItemList;
  FSheetItem := CreateCollection(TXMLSheetItemList, IXMLSheetItem, 'SheetItem') as IXMLSheetItemList;
  FUnitItem := CreateCollection(TXMLUnitItemList, IXMLUnitItem, 'UnitItem') as IXMLUnitItemList;
  FWoodItem := CreateCollection(TXMLWoodItemList, IXMLWoodItem, 'WoodItem') as IXMLWoodItemList;
  FOtherDate := CreateCollection(TXMLOtherDateList, IXMLOtherDate, 'OtherDate') as IXMLOtherDateList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  FPackageReference := CreateCollection(TXMLPackageReferenceList, IXMLPackageReference, 'PackageReference') as IXMLPackageReferenceList;
  inherited;
end;

function TXMLPackageInformationClass.Get_PackageType: UnicodeString;
begin
  Result := AttributeNodes['PackageType'].Text;
end;

procedure TXMLPackageInformationClass.Set_PackageType(Value: UnicodeString);
begin
  SetAttribute('PackageType', Value);
end;

function TXMLPackageInformationClass.Get_MixedProductPalletIndicator: UnicodeString;
begin
  Result := AttributeNodes['MixedProductPalletIndicator'].Text;
end;

procedure TXMLPackageInformationClass.Set_MixedProductPalletIndicator(Value: UnicodeString);
begin
  SetAttribute('MixedProductPalletIndicator', Value);
end;

function TXMLPackageInformationClass.Get_PackageLevel: Double;
begin
  Result := XmlStrToFloatExt(AttributeNodes['PackageLevel'].Text);
end;

procedure TXMLPackageInformationClass.Set_PackageLevel(Value: Double);
begin
  SetAttribute('PackageLevel', Value);
end;

function TXMLPackageInformationClass.Get_Identifier: IXMLIdentifierS60List;
begin
  Result := FIdentifier;
end;

function TXMLPackageInformationClass.Get_SupplierMarks: IXMLS30List;
begin
  Result := FSupplierMarks;
end;

function TXMLPackageInformationClass.Get_RawMaterialSet: IXMLIdentifierS60List;
begin
  Result := FRawMaterialSet;
end;

function TXMLPackageInformationClass.Get_PartyIdentifier: IXMLPartyIdentifierList;
begin
  Result := FPartyIdentifier;
end;

function TXMLPackageInformationClass.Get_MachineID: UnicodeString;
begin
  Result := ChildNodes['MachineID'].Text;
end;

procedure TXMLPackageInformationClass.Set_MachineID(Value: UnicodeString);
begin
  ChildNodes['MachineID'].NodeValue := Value;
end;

function TXMLPackageInformationClass.Get_ItemCount: IXMLMeasurement;
begin
  Result := ChildNodes['ItemCount'] as IXMLMeasurement;
end;

function TXMLPackageInformationClass.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLPackageInformationClass.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLPackageInformationClass.Get_InventoryClass: IXMLInventoryClass;
begin
  Result := ChildNodes['InventoryClass'] as IXMLInventoryClass;
end;

function TXMLPackageInformationClass.Get_PackageCharacteristics: IXMLPackageCharacteristics;
begin
  Result := ChildNodes['PackageCharacteristics'] as IXMLPackageCharacteristics;
end;

function TXMLPackageInformationClass.Get_BaleItem: IXMLBaleItemList;
begin
  Result := FBaleItem;
end;

function TXMLPackageInformationClass.Get_BoxItem: IXMLBoxItemList;
begin
  Result := FBoxItem;
end;

function TXMLPackageInformationClass.Get_ReelItem: IXMLReelItemList;
begin
  Result := FReelItem;
end;

function TXMLPackageInformationClass.Get_ReamItem: IXMLReamItemList;
begin
  Result := FReamItem;
end;

function TXMLPackageInformationClass.Get_SheetItem: IXMLSheetItemList;
begin
  Result := FSheetItem;
end;

function TXMLPackageInformationClass.Get_UnitItem: IXMLUnitItemList;
begin
  Result := FUnitItem;
end;

function TXMLPackageInformationClass.Get_WoodItem: IXMLWoodItemList;
begin
  Result := FWoodItem;
end;

function TXMLPackageInformationClass.Get_OtherDate: IXMLOtherDateList;
begin
  Result := FOtherDate;
end;

function TXMLPackageInformationClass.Get_EAttachment: IXMLEAttachment;
begin
  Result := ChildNodes['e-Attachment'] as IXMLEAttachment;
end;

function TXMLPackageInformationClass.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLPackageInformationClass.Get_PackageReference: IXMLPackageReferenceList;
begin
  Result := FPackageReference;
end;

{ TXMLPackageInformationClassList }

function TXMLPackageInformationClassList.Add: IXMLPackageInformationClass;
begin
  Result := AddItem(-1) as IXMLPackageInformationClass;
end;

function TXMLPackageInformationClassList.Insert(const Index: Integer): IXMLPackageInformationClass;
begin
  Result := AddItem(Index) as IXMLPackageInformationClass;
end;

function TXMLPackageInformationClassList.Get_Item(Index: Integer): IXMLPackageInformationClass;
begin
  Result := List[Index] as IXMLPackageInformationClass;
end;

{ TXMLPackageCharacteristics }

procedure TXMLPackageCharacteristics.AfterConstruction;
begin
  RegisterChildNode('Height', TXMLMeasurement);
  RegisterChildNode('Width', TXMLMeasurement);
  RegisterChildNode('Length', TXMLMeasurement);
  RegisterChildNode('LengthCutDescription', TXMLLengthCutDescription);
  RegisterChildNode('PropertyValue', TXMLPropertyValue);
  FPropertyValue := CreateCollection(TXMLPropertyValueList, IXMLPropertyValue, 'PropertyValue') as IXMLPropertyValueList;
  inherited;
end;

function TXMLPackageCharacteristics.Get_Height: IXMLMeasurement;
begin
  Result := ChildNodes['Height'] as IXMLMeasurement;
end;

function TXMLPackageCharacteristics.Get_Width: IXMLMeasurement;
begin
  Result := ChildNodes['Width'] as IXMLMeasurement;
end;

function TXMLPackageCharacteristics.Get_Length: IXMLMeasurement;
begin
  Result := ChildNodes['Length'] as IXMLMeasurement;
end;

function TXMLPackageCharacteristics.Get_LengthCutDescription: IXMLLengthCutDescription;
begin
  Result := ChildNodes['LengthCutDescription'] as IXMLLengthCutDescription;
end;

function TXMLPackageCharacteristics.Get_PropertyValue: IXMLPropertyValueList;
begin
  Result := FPropertyValue;
end;

{ TXMLBaleItem }

procedure TXMLBaleItem.AfterConstruction;
begin
  RegisterChildNode('Identifier', TXMLIdentifierS60);
  RegisterChildNode('PartyIdentifier', TXMLPartyIdentifier);
  RegisterChildNode('Product', TXMLProductClass);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('InventoryClass', TXMLInventoryClass);
  RegisterChildNode('BaleCharacteristics', TXMLBaleCharacteristics);
  RegisterChildNode('BaleReference', TXMLBaleReference);
  RegisterChildNode('OtherDate', TXMLOtherDate);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FIdentifier := CreateCollection(TXMLIdentifierS60List, IXMLIdentifierS60, 'Identifier') as IXMLIdentifierS60List;
  FPartyIdentifier := CreateCollection(TXMLPartyIdentifierList, IXMLPartyIdentifier, 'PartyIdentifier') as IXMLPartyIdentifierList;
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FBaleReference := CreateCollection(TXMLBaleReferenceList, IXMLBaleReference, 'BaleReference') as IXMLBaleReferenceList;
  FOtherDate := CreateCollection(TXMLOtherDateList, IXMLOtherDate, 'OtherDate') as IXMLOtherDateList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLBaleItem.Get_Identifier: IXMLIdentifierS60List;
begin
  Result := FIdentifier;
end;

function TXMLBaleItem.Get_PartyIdentifier: IXMLPartyIdentifierList;
begin
  Result := FPartyIdentifier;
end;

function TXMLBaleItem.Get_MachineID: UnicodeString;
begin
  Result := ChildNodes['MachineID'].Text;
end;

procedure TXMLBaleItem.Set_MachineID(Value: UnicodeString);
begin
  ChildNodes['MachineID'].NodeValue := Value;
end;

function TXMLBaleItem.Get_Product: IXMLProductClass;
begin
  Result := ChildNodes['Product'] as IXMLProductClass;
end;

function TXMLBaleItem.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLBaleItem.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLBaleItem.Get_InventoryClass: IXMLInventoryClass;
begin
  Result := ChildNodes['InventoryClass'] as IXMLInventoryClass;
end;

function TXMLBaleItem.Get_BaleCharacteristics: IXMLBaleCharacteristics;
begin
  Result := ChildNodes['BaleCharacteristics'] as IXMLBaleCharacteristics;
end;

function TXMLBaleItem.Get_BaleReference: IXMLBaleReferenceList;
begin
  Result := FBaleReference;
end;

function TXMLBaleItem.Get_OtherDate: IXMLOtherDateList;
begin
  Result := FOtherDate;
end;

function TXMLBaleItem.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

{ TXMLBaleItemList }

function TXMLBaleItemList.Add: IXMLBaleItem;
begin
  Result := AddItem(-1) as IXMLBaleItem;
end;

function TXMLBaleItemList.Insert(const Index: Integer): IXMLBaleItem;
begin
  Result := AddItem(Index) as IXMLBaleItem;
end;

function TXMLBaleItemList.Get_Item(Index: Integer): IXMLBaleItem;
begin
  Result := List[Index] as IXMLBaleItem;
end;

{ TXMLBaleCharacteristics }

procedure TXMLBaleCharacteristics.AfterConstruction;
begin
  RegisterChildNode('BaleHeight', TXMLMeasurement);
  RegisterChildNode('BaleWidth', TXMLMeasurement);
  RegisterChildNode('BaleDepth', TXMLMeasurement);
  RegisterChildNode('DateMade', TXMLDateMade);
  RegisterChildNode('DateFinished', TXMLDateFinished);
  inherited;
end;

function TXMLBaleCharacteristics.Get_BaleHeight: IXMLMeasurement;
begin
  Result := ChildNodes['BaleHeight'] as IXMLMeasurement;
end;

function TXMLBaleCharacteristics.Get_BaleWidth: IXMLMeasurement;
begin
  Result := ChildNodes['BaleWidth'] as IXMLMeasurement;
end;

function TXMLBaleCharacteristics.Get_BaleDepth: IXMLMeasurement;
begin
  Result := ChildNodes['BaleDepth'] as IXMLMeasurement;
end;

function TXMLBaleCharacteristics.Get_DateMade: IXMLDateMade;
begin
  Result := ChildNodes['DateMade'] as IXMLDateMade;
end;

function TXMLBaleCharacteristics.Get_DateFinished: IXMLDateFinished;
begin
  Result := ChildNodes['DateFinished'] as IXMLDateFinished;
end;

{ TXMLDateMade }

procedure TXMLDateMade.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDateMade.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDateMade.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDateMade.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLDateFinished }

procedure TXMLDateFinished.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDateFinished.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDateFinished.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDateFinished.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLBaleReference }

function TXMLBaleReference.Get_BaleReferenceType: UnicodeString;
begin
  Result := AttributeNodes['BaleReferenceType'].Text;
end;

procedure TXMLBaleReference.Set_BaleReferenceType(Value: UnicodeString);
begin
  SetAttribute('BaleReferenceType', Value);
end;

function TXMLBaleReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLBaleReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLBaleReferenceList }

function TXMLBaleReferenceList.Add: IXMLBaleReference;
begin
  Result := AddItem(-1) as IXMLBaleReference;
end;

function TXMLBaleReferenceList.Insert(const Index: Integer): IXMLBaleReference;
begin
  Result := AddItem(Index) as IXMLBaleReference;
end;

function TXMLBaleReferenceList.Get_Item(Index: Integer): IXMLBaleReference;
begin
  Result := List[Index] as IXMLBaleReference;
end;

{ TXMLBoxItem }

procedure TXMLBoxItem.AfterConstruction;
begin
  RegisterChildNode('Identifier', TXMLIdentifierS60);
  RegisterChildNode('PartyIdentifier', TXMLPartyIdentifier);
  RegisterChildNode('ItemCount', TXMLMeasurement);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('ReamItem', TXMLReamItem);
  RegisterChildNode('SheetItem', TXMLSheetItem);
  RegisterChildNode('UnitItem', TXMLUnitItem);
  RegisterChildNode('BoxCharacteristics', TXMLBoxCharacteristics);
  RegisterChildNode('InventoryClass', TXMLInventoryClass);
  RegisterChildNode('BoxReference', TXMLBoxReference);
  RegisterChildNode('OtherDate', TXMLOtherDate);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FIdentifier := CreateCollection(TXMLIdentifierS60List, IXMLIdentifierS60, 'Identifier') as IXMLIdentifierS60List;
  FPartyIdentifier := CreateCollection(TXMLPartyIdentifierList, IXMLPartyIdentifier, 'PartyIdentifier') as IXMLPartyIdentifierList;
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FReamItem := CreateCollection(TXMLReamItemList, IXMLReamItem, 'ReamItem') as IXMLReamItemList;
  FUnitItem := CreateCollection(TXMLUnitItemList, IXMLUnitItem, 'UnitItem') as IXMLUnitItemList;
  FBoxReference := CreateCollection(TXMLBoxReferenceList, IXMLBoxReference, 'BoxReference') as IXMLBoxReferenceList;
  FOtherDate := CreateCollection(TXMLOtherDateList, IXMLOtherDate, 'OtherDate') as IXMLOtherDateList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLBoxItem.Get_MixProductIndicator: UnicodeString;
begin
  Result := AttributeNodes['MixProductIndicator'].Text;
end;

procedure TXMLBoxItem.Set_MixProductIndicator(Value: UnicodeString);
begin
  SetAttribute('MixProductIndicator', Value);
end;

function TXMLBoxItem.Get_IsPartialIndicator: UnicodeString;
begin
  Result := AttributeNodes['IsPartialIndicator'].Text;
end;

procedure TXMLBoxItem.Set_IsPartialIndicator(Value: UnicodeString);
begin
  SetAttribute('IsPartialIndicator', Value);
end;

function TXMLBoxItem.Get_Identifier: IXMLIdentifierS60List;
begin
  Result := FIdentifier;
end;

function TXMLBoxItem.Get_PartyIdentifier: IXMLPartyIdentifierList;
begin
  Result := FPartyIdentifier;
end;

function TXMLBoxItem.Get_MachineID: UnicodeString;
begin
  Result := ChildNodes['MachineID'].Text;
end;

procedure TXMLBoxItem.Set_MachineID(Value: UnicodeString);
begin
  ChildNodes['MachineID'].NodeValue := Value;
end;

function TXMLBoxItem.Get_ItemCount: IXMLMeasurement;
begin
  Result := ChildNodes['ItemCount'] as IXMLMeasurement;
end;

function TXMLBoxItem.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLBoxItem.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLBoxItem.Get_ReamItem: IXMLReamItemList;
begin
  Result := FReamItem;
end;

function TXMLBoxItem.Get_SheetItem: IXMLSheetItem;
begin
  Result := ChildNodes['SheetItem'] as IXMLSheetItem;
end;

function TXMLBoxItem.Get_UnitItem: IXMLUnitItemList;
begin
  Result := FUnitItem;
end;

function TXMLBoxItem.Get_BoxCharacteristics: IXMLBoxCharacteristics;
begin
  Result := ChildNodes['BoxCharacteristics'] as IXMLBoxCharacteristics;
end;

function TXMLBoxItem.Get_InventoryClass: IXMLInventoryClass;
begin
  Result := ChildNodes['InventoryClass'] as IXMLInventoryClass;
end;

function TXMLBoxItem.Get_BoxReference: IXMLBoxReferenceList;
begin
  Result := FBoxReference;
end;

function TXMLBoxItem.Get_OtherDate: IXMLOtherDateList;
begin
  Result := FOtherDate;
end;

function TXMLBoxItem.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

{ TXMLBoxItemList }

function TXMLBoxItemList.Add: IXMLBoxItem;
begin
  Result := AddItem(-1) as IXMLBoxItem;
end;

function TXMLBoxItemList.Insert(const Index: Integer): IXMLBoxItem;
begin
  Result := AddItem(Index) as IXMLBoxItem;
end;

function TXMLBoxItemList.Get_Item(Index: Integer): IXMLBoxItem;
begin
  Result := List[Index] as IXMLBoxItem;
end;

{ TXMLReamItem }

procedure TXMLReamItem.AfterConstruction;
begin
  RegisterChildNode('Identifier', TXMLIdentifierS60);
  RegisterChildNode('ItemCount', TXMLMeasurement);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('SheetItem', TXMLSheetItem);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FIdentifier := CreateCollection(TXMLIdentifierS60List, IXMLIdentifierS60, 'Identifier') as IXMLIdentifierS60List;
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLReamItem.Get_Identifier: IXMLIdentifierS60List;
begin
  Result := FIdentifier;
end;

function TXMLReamItem.Get_ItemCount: IXMLMeasurement;
begin
  Result := ChildNodes['ItemCount'] as IXMLMeasurement;
end;

function TXMLReamItem.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLReamItem.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLReamItem.Get_SheetItem: IXMLSheetItem;
begin
  Result := ChildNodes['SheetItem'] as IXMLSheetItem;
end;

function TXMLReamItem.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

{ TXMLReamItemList }

function TXMLReamItemList.Add: IXMLReamItem;
begin
  Result := AddItem(-1) as IXMLReamItem;
end;

function TXMLReamItemList.Insert(const Index: Integer): IXMLReamItem;
begin
  Result := AddItem(Index) as IXMLReamItem;
end;

function TXMLReamItemList.Get_Item(Index: Integer): IXMLReamItem;
begin
  Result := List[Index] as IXMLReamItem;
end;

{ TXMLSheetItem }

procedure TXMLSheetItem.AfterConstruction;
begin
  RegisterChildNode('DateSheeted', TXMLDateSheeted);
  RegisterChildNode('DateFinished', TXMLDateFinished);
  inherited;
end;

function TXMLSheetItem.Get_DateSheeted: IXMLDateSheeted;
begin
  Result := ChildNodes['DateSheeted'] as IXMLDateSheeted;
end;

function TXMLSheetItem.Get_DateFinished: IXMLDateFinished;
begin
  Result := ChildNodes['DateFinished'] as IXMLDateFinished;
end;

{ TXMLSheetItemList }

function TXMLSheetItemList.Add: IXMLSheetItem;
begin
  Result := AddItem(-1) as IXMLSheetItem;
end;

function TXMLSheetItemList.Insert(const Index: Integer): IXMLSheetItem;
begin
  Result := AddItem(Index) as IXMLSheetItem;
end;

function TXMLSheetItemList.Get_Item(Index: Integer): IXMLSheetItem;
begin
  Result := List[Index] as IXMLSheetItem;
end;

{ TXMLDateSheeted }

procedure TXMLDateSheeted.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDateSheeted.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDateSheeted.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDateSheeted.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLUnitItem }

procedure TXMLUnitItem.AfterConstruction;
begin
  RegisterChildNode('Identifier', TXMLIdentifierS60);
  RegisterChildNode('Product', TXMLProductClass);
  RegisterChildNode('UnitCharacteristics', TXMLUnitCharacteristics);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('UnitReference', TXMLUnitReference);
  RegisterChildNode('OtherDate', TXMLOtherDate);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FIdentifier := CreateCollection(TXMLIdentifierS60List, IXMLIdentifierS60, 'Identifier') as IXMLIdentifierS60List;
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FUnitReference := CreateCollection(TXMLUnitReferenceList, IXMLUnitReference, 'UnitReference') as IXMLUnitReferenceList;
  FOtherDate := CreateCollection(TXMLOtherDateList, IXMLOtherDate, 'OtherDate') as IXMLOtherDateList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLUnitItem.Get_Identifier: IXMLIdentifierS60List;
begin
  Result := FIdentifier;
end;

function TXMLUnitItem.Get_Product: IXMLProductClass;
begin
  Result := ChildNodes['Product'] as IXMLProductClass;
end;

function TXMLUnitItem.Get_UnitCharacteristics: IXMLUnitCharacteristics;
begin
  Result := ChildNodes['UnitCharacteristics'] as IXMLUnitCharacteristics;
end;

function TXMLUnitItem.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLUnitItem.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLUnitItem.Get_UnitReference: IXMLUnitReferenceList;
begin
  Result := FUnitReference;
end;

function TXMLUnitItem.Get_OtherDate: IXMLOtherDateList;
begin
  Result := FOtherDate;
end;

function TXMLUnitItem.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

{ TXMLUnitItemList }

function TXMLUnitItemList.Add: IXMLUnitItem;
begin
  Result := AddItem(-1) as IXMLUnitItem;
end;

function TXMLUnitItemList.Insert(const Index: Integer): IXMLUnitItem;
begin
  Result := AddItem(Index) as IXMLUnitItem;
end;

function TXMLUnitItemList.Get_Item(Index: Integer): IXMLUnitItem;
begin
  Result := List[Index] as IXMLUnitItem;
end;

{ TXMLUnitReference }

function TXMLUnitReference.Get_UnitReferenceType: UnicodeString;
begin
  Result := AttributeNodes['UnitReferenceType'].Text;
end;

procedure TXMLUnitReference.Set_UnitReferenceType(Value: UnicodeString);
begin
  SetAttribute('UnitReferenceType', Value);
end;

function TXMLUnitReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLUnitReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLUnitReferenceList }

function TXMLUnitReferenceList.Add: IXMLUnitReference;
begin
  Result := AddItem(-1) as IXMLUnitReference;
end;

function TXMLUnitReferenceList.Insert(const Index: Integer): IXMLUnitReference;
begin
  Result := AddItem(Index) as IXMLUnitReference;
end;

function TXMLUnitReferenceList.Get_Item(Index: Integer): IXMLUnitReference;
begin
  Result := List[Index] as IXMLUnitReference;
end;

{ TXMLBoxReference }

function TXMLBoxReference.Get_BoxReferenceType: UnicodeString;
begin
  Result := AttributeNodes['BoxReferenceType'].Text;
end;

procedure TXMLBoxReference.Set_BoxReferenceType(Value: UnicodeString);
begin
  SetAttribute('BoxReferenceType', Value);
end;

function TXMLBoxReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLBoxReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLBoxReferenceList }

function TXMLBoxReferenceList.Add: IXMLBoxReference;
begin
  Result := AddItem(-1) as IXMLBoxReference;
end;

function TXMLBoxReferenceList.Insert(const Index: Integer): IXMLBoxReference;
begin
  Result := AddItem(Index) as IXMLBoxReference;
end;

function TXMLBoxReferenceList.Get_Item(Index: Integer): IXMLBoxReference;
begin
  Result := List[Index] as IXMLBoxReference;
end;

{ TXMLReelItem }

procedure TXMLReelItem.AfterConstruction;
begin
  RegisterChildNode('Identifier', TXMLIdentifierS60);
  RegisterChildNode('PartyIdentifier', TXMLPartyIdentifier);
  RegisterChildNode('DeliveryMessageReelCharacteristics', TXMLDeliveryMessageReelCharacteristics);
  RegisterChildNode('InventoryClass', TXMLInventoryClass);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FIdentifier := CreateCollection(TXMLIdentifierS60List, IXMLIdentifierS60, 'Identifier') as IXMLIdentifierS60List;
  FPartyIdentifier := CreateCollection(TXMLPartyIdentifierList, IXMLPartyIdentifier, 'PartyIdentifier') as IXMLPartyIdentifierList;
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLReelItem.Get_Identifier: IXMLIdentifierS60List;
begin
  Result := FIdentifier;
end;

function TXMLReelItem.Get_PartyIdentifier: IXMLPartyIdentifierList;
begin
  Result := FPartyIdentifier;
end;

function TXMLReelItem.Get_MachineID: UnicodeString;
begin
  Result := ChildNodes['MachineID'].Text;
end;

procedure TXMLReelItem.Set_MachineID(Value: UnicodeString);
begin
  ChildNodes['MachineID'].NodeValue := Value;
end;

function TXMLReelItem.Get_DeliveryMessageReelCharacteristics: IXMLDeliveryMessageReelCharacteristics;
begin
  Result := ChildNodes['DeliveryMessageReelCharacteristics'] as IXMLDeliveryMessageReelCharacteristics;
end;

function TXMLReelItem.Get_InventoryClass: IXMLInventoryClass;
begin
  Result := ChildNodes['InventoryClass'] as IXMLInventoryClass;
end;

function TXMLReelItem.Get_MillOrderNumber: UnicodeString;
begin
  Result := ChildNodes['MillOrderNumber'].Text;
end;

procedure TXMLReelItem.Set_MillOrderNumber(Value: UnicodeString);
begin
  ChildNodes['MillOrderNumber'].NodeValue := Value;
end;

function TXMLReelItem.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLReelItem.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLReelItem.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

{ TXMLReelItemList }

function TXMLReelItemList.Add: IXMLReelItem;
begin
  Result := AddItem(-1) as IXMLReelItem;
end;

function TXMLReelItemList.Insert(const Index: Integer): IXMLReelItem;
begin
  Result := AddItem(Index) as IXMLReelItem;
end;

function TXMLReelItemList.Get_Item(Index: Integer): IXMLReelItem;
begin
  Result := List[Index] as IXMLReelItem;
end;

{ TXMLDeliveryMessageReelCharacteristics }

procedure TXMLDeliveryMessageReelCharacteristics.AfterConstruction;
begin
  RegisterChildNode('ReelWidth', TXMLMeasurement);
  RegisterChildNode('ReelDiameter', TXMLMeasurement);
  RegisterChildNode('ReelLength', TXMLMeasurement);
  RegisterChildNode('MillJoinLocation', TXMLMillJoinLocation);
  RegisterChildNode('DateFinished', TXMLDateFinished);
  RegisterChildNode('DateWound', TXMLDateWound);
  RegisterChildNode('Caliper', TXMLCaliper);
  FMillJoinLocation := CreateCollection(TXMLMillJoinLocationList, IXMLMillJoinLocation, 'MillJoinLocation') as IXMLMillJoinLocationList;
  inherited;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_ReelWidth: IXMLMeasurement;
begin
  Result := ChildNodes['ReelWidth'] as IXMLMeasurement;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_ReelDiameter: IXMLMeasurement;
begin
  Result := ChildNodes['ReelDiameter'] as IXMLMeasurement;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_ReelLength: IXMLMeasurement;
begin
  Result := ChildNodes['ReelLength'] as IXMLMeasurement;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_MachineID: UnicodeString;
begin
  Result := ChildNodes['MachineID'].Text;
end;

procedure TXMLDeliveryMessageReelCharacteristics.Set_MachineID(Value: UnicodeString);
begin
  ChildNodes['MachineID'].NodeValue := Value;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_TambourID: UnicodeString;
begin
  Result := ChildNodes['TambourID'].Text;
end;

procedure TXMLDeliveryMessageReelCharacteristics.Set_TambourID(Value: UnicodeString);
begin
  ChildNodes['TambourID'].NodeValue := Value;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_SetNumber: LongWord;
begin
  Result := ChildNodes['SetNumber'].NodeValue;
end;

procedure TXMLDeliveryMessageReelCharacteristics.Set_SetNumber(Value: LongWord);
begin
  ChildNodes['SetNumber'].NodeValue := Value;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_SetPosition: LongWord;
begin
  Result := ChildNodes['SetPosition'].NodeValue;
end;

procedure TXMLDeliveryMessageReelCharacteristics.Set_SetPosition(Value: LongWord);
begin
  ChildNodes['SetPosition'].NodeValue := Value;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_TotalSetPositions: LongWord;
begin
  Result := ChildNodes['TotalSetPositions'].NodeValue;
end;

procedure TXMLDeliveryMessageReelCharacteristics.Set_TotalSetPositions(Value: LongWord);
begin
  ChildNodes['TotalSetPositions'].NodeValue := Value;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_TotalSetNumbers: LongWord;
begin
  Result := ChildNodes['TotalSetNumbers'].NodeValue;
end;

procedure TXMLDeliveryMessageReelCharacteristics.Set_TotalSetNumbers(Value: LongWord);
begin
  ChildNodes['TotalSetNumbers'].NodeValue := Value;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_NumberOfMillJoins: LongWord;
begin
  Result := ChildNodes['NumberOfMillJoins'].NodeValue;
end;

procedure TXMLDeliveryMessageReelCharacteristics.Set_NumberOfMillJoins(Value: LongWord);
begin
  ChildNodes['NumberOfMillJoins'].NodeValue := Value;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_MillJoinLocation: IXMLMillJoinLocationList;
begin
  Result := FMillJoinLocation;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_DateFinished: IXMLDateFinished;
begin
  Result := ChildNodes['DateFinished'] as IXMLDateFinished;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_DateWound: IXMLDateWound;
begin
  Result := ChildNodes['DateWound'] as IXMLDateWound;
end;

function TXMLDeliveryMessageReelCharacteristics.Get_Caliper: IXMLCaliper;
begin
  Result := ChildNodes['Caliper'] as IXMLCaliper;
end;

{ TXMLMillJoinLocation }

procedure TXMLMillJoinLocation.AfterConstruction;
begin
  RegisterChildNode('LengthFromCore', TXMLMeasurement);
  RegisterChildNode('DistanceFromCore', TXMLMeasurement);
  inherited;
end;

function TXMLMillJoinLocation.Get_MillJoinNumber: LongWord;
begin
  Result := ChildNodes['MillJoinNumber'].NodeValue;
end;

procedure TXMLMillJoinLocation.Set_MillJoinNumber(Value: LongWord);
begin
  ChildNodes['MillJoinNumber'].NodeValue := Value;
end;

function TXMLMillJoinLocation.Get_LengthFromCore: IXMLMeasurement;
begin
  Result := ChildNodes['LengthFromCore'] as IXMLMeasurement;
end;

function TXMLMillJoinLocation.Get_DistanceFromCore: IXMLMeasurement;
begin
  Result := ChildNodes['DistanceFromCore'] as IXMLMeasurement;
end;

{ TXMLMillJoinLocationList }

function TXMLMillJoinLocationList.Add: IXMLMillJoinLocation;
begin
  Result := AddItem(-1) as IXMLMillJoinLocation;
end;

function TXMLMillJoinLocationList.Insert(const Index: Integer): IXMLMillJoinLocation;
begin
  Result := AddItem(Index) as IXMLMillJoinLocation;
end;

function TXMLMillJoinLocationList.Get_Item(Index: Integer): IXMLMillJoinLocation;
begin
  Result := List[Index] as IXMLMillJoinLocation;
end;

{ TXMLDateWound }

procedure TXMLDateWound.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDateWound.Get_RewoundIndicator: UnicodeString;
begin
  Result := AttributeNodes['RewoundIndicator'].Text;
end;

procedure TXMLDateWound.Set_RewoundIndicator(Value: UnicodeString);
begin
  SetAttribute('RewoundIndicator', Value);
end;

function TXMLDateWound.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDateWound.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDateWound.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLWoodItem }

procedure TXMLWoodItem.AfterConstruction;
begin
  RegisterChildNode('Product', TXMLProductClass);
  RegisterChildNode('PackagingInformation', TXMLProductPackagingClass);
  RegisterChildNode('ProductSummary', TXMLProductSummary);
  RegisterChildNode('LengthSpecification', TXMLLengthSpecification);
  FLengthSpecification := CreateCollection(TXMLLengthSpecificationList, IXMLLengthSpecification, 'LengthSpecification') as IXMLLengthSpecificationList;
  inherited;
end;

function TXMLWoodItem.Get_Product: IXMLProductClass;
begin
  Result := ChildNodes['Product'] as IXMLProductClass;
end;

function TXMLWoodItem.Get_PackagingInformation: IXMLProductPackagingClass;
begin
  Result := ChildNodes['PackagingInformation'] as IXMLProductPackagingClass;
end;

function TXMLWoodItem.Get_ProductSummary: IXMLProductSummary;
begin
  Result := ChildNodes['ProductSummary'] as IXMLProductSummary;
end;

function TXMLWoodItem.Get_LengthSpecification: IXMLLengthSpecificationList;
begin
  Result := FLengthSpecification;
end;

{ TXMLWoodItemList }

function TXMLWoodItemList.Add: IXMLWoodItem;
begin
  Result := AddItem(-1) as IXMLWoodItem;
end;

function TXMLWoodItemList.Insert(const Index: Integer): IXMLWoodItem;
begin
  Result := AddItem(Index) as IXMLWoodItem;
end;

function TXMLWoodItemList.Get_Item(Index: Integer): IXMLWoodItem;
begin
  Result := List[Index] as IXMLWoodItem;
end;

{ TXMLProductSummary }

procedure TXMLProductSummary.AfterConstruction;
begin
  RegisterChildNode('TotalQuantity', TXMLTotalQuantity);
  RegisterChildNode('TotalInformationalQuantity', TXMLTotalInformationalQuantity);
  FTotalInformationalQuantity := CreateCollection(TXMLTotalInformationalQuantityList, IXMLTotalInformationalQuantity, 'TotalInformationalQuantity') as IXMLTotalInformationalQuantityList;
  inherited;
end;

function TXMLProductSummary.Get_TotalQuantity: IXMLTotalQuantity;
begin
  Result := ChildNodes['TotalQuantity'] as IXMLTotalQuantity;
end;

function TXMLProductSummary.Get_TotalInformationalQuantity: IXMLTotalInformationalQuantityList;
begin
  Result := FTotalInformationalQuantity;
end;

{ TXMLLengthSpecification }

procedure TXMLLengthSpecification.AfterConstruction;
begin
  RegisterChildNode('LengthCategory', TXMLLengthCategory);
  RegisterChildNode('TotalNumberOfUnits', TXMLMeasurement);
  inherited;
end;

function TXMLLengthSpecification.Get_LengthCategory: IXMLLengthCategory;
begin
  Result := ChildNodes['LengthCategory'] as IXMLLengthCategory;
end;

function TXMLLengthSpecification.Get_TotalNumberOfUnits: IXMLMeasurement;
begin
  Result := ChildNodes['TotalNumberOfUnits'] as IXMLMeasurement;
end;

{ TXMLLengthSpecificationList }

function TXMLLengthSpecificationList.Add: IXMLLengthSpecification;
begin
  Result := AddItem(-1) as IXMLLengthSpecification;
end;

function TXMLLengthSpecificationList.Insert(const Index: Integer): IXMLLengthSpecification;
begin
  Result := AddItem(Index) as IXMLLengthSpecification;
end;

function TXMLLengthSpecificationList.Get_Item(Index: Integer): IXMLLengthSpecification;
begin
  Result := List[Index] as IXMLLengthSpecification;
end;

{ TXMLLengthCategory }

function TXMLLengthCategory.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLLengthCategory.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLPackageReference }

function TXMLPackageReference.Get_PackageReferenceType: UnicodeString;
begin
  Result := AttributeNodes['PackageReferenceType'].Text;
end;

procedure TXMLPackageReference.Set_PackageReferenceType(Value: UnicodeString);
begin
  SetAttribute('PackageReferenceType', Value);
end;

function TXMLPackageReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLPackageReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLPackageReferenceList }

function TXMLPackageReferenceList.Add: IXMLPackageReference;
begin
  Result := AddItem(-1) as IXMLPackageReference;
end;

function TXMLPackageReferenceList.Insert(const Index: Integer): IXMLPackageReference;
begin
  Result := AddItem(Index) as IXMLPackageReference;
end;

function TXMLPackageReferenceList.Get_Item(Index: Integer): IXMLPackageReference;
begin
  Result := List[Index] as IXMLPackageReference;
end;

{ TXMLMeasuringSpecification }

procedure TXMLMeasuringSpecification.AfterConstruction;
begin
  RegisterChildNode('MeasuringParty', TXMLParty);
  RegisterChildNode('MeasuringLocation', TXMLMeasuringLocation);
  RegisterChildNode('MeasuringReference', TXMLMeasuringReference);
  RegisterChildNode('MeasuringCodeInfo', TXMLMeasuringCodeInfo);
  RegisterChildNode('MeasuringCode', TXMLMeasuringCode);
  RegisterChildNode('MeasuringProduct', TXMLMeasuringProduct);
  RegisterChildNode('MeasurementSpecification', TXMLMeasurementSpecification);
  FMeasuringReference := CreateCollection(TXMLMeasuringReferenceList, IXMLMeasuringReference, 'MeasuringReference') as IXMLMeasuringReferenceList;
  FMeasuringCodeInfo := CreateCollection(TXMLMeasuringCodeInfoList, IXMLMeasuringCodeInfo, 'MeasuringCodeInfo') as IXMLMeasuringCodeInfoList;
  FMeasuringDescription := CreateCollection(TXMLS255List, IXMLNode, 'MeasuringDescription') as IXMLS255List;
  inherited;
end;

function TXMLMeasuringSpecification.Get_MeasuringType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringType'].Text;
end;

procedure TXMLMeasuringSpecification.Set_MeasuringType(Value: UnicodeString);
begin
  SetAttribute('MeasuringType', Value);
end;

function TXMLMeasuringSpecification.Get_PrioritisedMeasuringType: UnicodeString;
begin
  Result := AttributeNodes['PrioritisedMeasuringType'].Text;
end;

procedure TXMLMeasuringSpecification.Set_PrioritisedMeasuringType(Value: UnicodeString);
begin
  SetAttribute('PrioritisedMeasuringType', Value);
end;

function TXMLMeasuringSpecification.Get_CompensationMeasuringType: UnicodeString;
begin
  Result := AttributeNodes['CompensationMeasuringType'].Text;
end;

procedure TXMLMeasuringSpecification.Set_CompensationMeasuringType(Value: UnicodeString);
begin
  SetAttribute('CompensationMeasuringType', Value);
end;

function TXMLMeasuringSpecification.Get_MeasuringParty: IXMLParty;
begin
  Result := ChildNodes['MeasuringParty'] as IXMLParty;
end;

function TXMLMeasuringSpecification.Get_MeasuringLocation: IXMLMeasuringLocation;
begin
  Result := ChildNodes['MeasuringLocation'] as IXMLMeasuringLocation;
end;

function TXMLMeasuringSpecification.Get_MeasuringReference: IXMLMeasuringReferenceList;
begin
  Result := FMeasuringReference;
end;

function TXMLMeasuringSpecification.Get_MeasuringCodeInfo: IXMLMeasuringCodeInfoList;
begin
  Result := FMeasuringCodeInfo;
end;

function TXMLMeasuringSpecification.Get_MeasuringCode: IXMLMeasuringCode;
begin
  Result := ChildNodes['MeasuringCode'] as IXMLMeasuringCode;
end;

function TXMLMeasuringSpecification.Get_MeasuringDescription: IXMLS255List;
begin
  Result := FMeasuringDescription;
end;

function TXMLMeasuringSpecification.Get_MeasuringProduct: IXMLMeasuringProduct;
begin
  Result := ChildNodes['MeasuringProduct'] as IXMLMeasuringProduct;
end;

function TXMLMeasuringSpecification.Get_MeasurementSpecification: IXMLMeasurementSpecification;
begin
  Result := ChildNodes['MeasurementSpecification'] as IXMLMeasurementSpecification;
end;

{ TXMLMeasuringSpecificationList }

function TXMLMeasuringSpecificationList.Add: IXMLMeasuringSpecification;
begin
  Result := AddItem(-1) as IXMLMeasuringSpecification;
end;

function TXMLMeasuringSpecificationList.Insert(const Index: Integer): IXMLMeasuringSpecification;
begin
  Result := AddItem(Index) as IXMLMeasuringSpecification;
end;

function TXMLMeasuringSpecificationList.Get_Item(Index: Integer): IXMLMeasuringSpecification;
begin
  Result := List[Index] as IXMLMeasuringSpecification;
end;

{ TXMLMeasuringLocation }

procedure TXMLMeasuringLocation.AfterConstruction;
begin
  RegisterChildNode('LocationParty', TXMLLocationParty);
  RegisterChildNode('MeasuringUnitIdentifier', TXMLMeasuringUnitIdentifier);
  RegisterChildNode('MeasuringUnitBrandAndModel', TXMLMeasuringUnitBrandAndModel);
  RegisterChildNode('MeasuringEquipment', TXMLMeasuringEquipment);
  FMeasuringUnitIdentifier := CreateCollection(TXMLMeasuringUnitIdentifierList, IXMLMeasuringUnitIdentifier, 'MeasuringUnitIdentifier') as IXMLMeasuringUnitIdentifierList;
  FMeasuringEquipment := CreateCollection(TXMLMeasuringEquipmentList, IXMLMeasuringEquipment, 'MeasuringEquipment') as IXMLMeasuringEquipmentList;
  inherited;
end;

function TXMLMeasuringLocation.Get_LocationParty: IXMLLocationParty;
begin
  Result := ChildNodes['LocationParty'] as IXMLLocationParty;
end;

function TXMLMeasuringLocation.Get_MeasuringUnitIdentifier: IXMLMeasuringUnitIdentifierList;
begin
  Result := FMeasuringUnitIdentifier;
end;

function TXMLMeasuringLocation.Get_MeasuringUnitBrandAndModel: IXMLMeasuringUnitBrandAndModel;
begin
  Result := ChildNodes['MeasuringUnitBrandAndModel'] as IXMLMeasuringUnitBrandAndModel;
end;

function TXMLMeasuringLocation.Get_MeasuringEquipment: IXMLMeasuringEquipmentList;
begin
  Result := FMeasuringEquipment;
end;

function TXMLMeasuringLocation.Get_MeasuringLineID: UnicodeString;
begin
  Result := ChildNodes['MeasuringLineID'].Text;
end;

procedure TXMLMeasuringLocation.Set_MeasuringLineID(Value: UnicodeString);
begin
  ChildNodes['MeasuringLineID'].NodeValue := Value;
end;

{ TXMLMeasuringUnitIdentifier }

function TXMLMeasuringUnitIdentifier.Get_MeasuringUnitIdentifierType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringUnitIdentifierType'].Text;
end;

procedure TXMLMeasuringUnitIdentifier.Set_MeasuringUnitIdentifierType(Value: UnicodeString);
begin
  SetAttribute('MeasuringUnitIdentifierType', Value);
end;

function TXMLMeasuringUnitIdentifier.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLMeasuringUnitIdentifier.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

function TXMLMeasuringUnitIdentifier.Get_StateOrProvince: UnicodeString;
begin
  Result := AttributeNodes['StateOrProvince'].Text;
end;

procedure TXMLMeasuringUnitIdentifier.Set_StateOrProvince(Value: UnicodeString);
begin
  SetAttribute('StateOrProvince', Value);
end;

function TXMLMeasuringUnitIdentifier.Get_ISOCountryCode: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCode'].Text;
end;

procedure TXMLMeasuringUnitIdentifier.Set_ISOCountryCode(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCode', Value);
end;

function TXMLMeasuringUnitIdentifier.Get_ISOCountryCodeAlpha3: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCodeAlpha3'].Text;
end;

procedure TXMLMeasuringUnitIdentifier.Set_ISOCountryCodeAlpha3(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCodeAlpha3', Value);
end;

function TXMLMeasuringUnitIdentifier.Get_ISOCountryCodeNumeric: UnicodeString;
begin
  Result := AttributeNodes['ISOCountryCodeNumeric'].Text;
end;

procedure TXMLMeasuringUnitIdentifier.Set_ISOCountryCodeNumeric(Value: UnicodeString);
begin
  SetAttribute('ISOCountryCodeNumeric', Value);
end;

{ TXMLMeasuringUnitIdentifierList }

function TXMLMeasuringUnitIdentifierList.Add: IXMLMeasuringUnitIdentifier;
begin
  Result := AddItem(-1) as IXMLMeasuringUnitIdentifier;
end;

function TXMLMeasuringUnitIdentifierList.Insert(const Index: Integer): IXMLMeasuringUnitIdentifier;
begin
  Result := AddItem(Index) as IXMLMeasuringUnitIdentifier;
end;

function TXMLMeasuringUnitIdentifierList.Get_Item(Index: Integer): IXMLMeasuringUnitIdentifier;
begin
  Result := List[Index] as IXMLMeasuringUnitIdentifier;
end;

{ TXMLMeasuringUnitBrandAndModel }

procedure TXMLMeasuringUnitBrandAndModel.AfterConstruction;
begin
  RegisterChildNode('Model', TXMLModel);
  inherited;
end;

function TXMLMeasuringUnitBrandAndModel.Get_Brand: UnicodeString;
begin
  Result := ChildNodes['Brand'].Text;
end;

procedure TXMLMeasuringUnitBrandAndModel.Set_Brand(Value: UnicodeString);
begin
  ChildNodes['Brand'].NodeValue := Value;
end;

function TXMLMeasuringUnitBrandAndModel.Get_Model: IXMLModel;
begin
  Result := ChildNodes['Model'] as IXMLModel;
end;

{ TXMLMeasuringEquipment }

procedure TXMLMeasuringEquipment.AfterConstruction;
begin
  RegisterChildNode('MeasuringEquipmentCode', TXMLMeasuringEquipmentCode);
  RegisterChildNode('CodeValue', TXMLCodeValue);
  RegisterChildNode('MeasurementModule', TXMLMeasurementModule);
  RegisterChildNode('Calibration', TXMLCalibration);
  FMeasuringEquipmentCode := CreateCollection(TXMLMeasuringEquipmentCodeList, IXMLMeasuringEquipmentCode, 'MeasuringEquipmentCode') as IXMLMeasuringEquipmentCodeList;
  FCodeValue := CreateCollection(TXMLCodeValueList, IXMLCodeValue, 'CodeValue') as IXMLCodeValueList;
  FMeasuringEquipmentDescription := CreateCollection(TXMLS72List, IXMLNode, 'MeasuringEquipmentDescription') as IXMLS72List;
  inherited;
end;

function TXMLMeasuringEquipment.Get_MeasuringEquipmentCode: IXMLMeasuringEquipmentCodeList;
begin
  Result := FMeasuringEquipmentCode;
end;

function TXMLMeasuringEquipment.Get_CodeValue: IXMLCodeValueList;
begin
  Result := FCodeValue;
end;

function TXMLMeasuringEquipment.Get_MeasuringEquipmentDescription: IXMLS72List;
begin
  Result := FMeasuringEquipmentDescription;
end;

function TXMLMeasuringEquipment.Get_MeasurementSystem: UnicodeString;
begin
  Result := ChildNodes['MeasurementSystem'].Text;
end;

procedure TXMLMeasuringEquipment.Set_MeasurementSystem(Value: UnicodeString);
begin
  ChildNodes['MeasurementSystem'].NodeValue := Value;
end;

function TXMLMeasuringEquipment.Get_MeasurementModule: IXMLMeasurementModule;
begin
  Result := ChildNodes['MeasurementModule'] as IXMLMeasurementModule;
end;

function TXMLMeasuringEquipment.Get_Calibration: IXMLCalibration;
begin
  Result := ChildNodes['Calibration'] as IXMLCalibration;
end;

{ TXMLMeasuringEquipmentList }

function TXMLMeasuringEquipmentList.Add: IXMLMeasuringEquipment;
begin
  Result := AddItem(-1) as IXMLMeasuringEquipment;
end;

function TXMLMeasuringEquipmentList.Insert(const Index: Integer): IXMLMeasuringEquipment;
begin
  Result := AddItem(Index) as IXMLMeasuringEquipment;
end;

function TXMLMeasuringEquipmentList.Get_Item(Index: Integer): IXMLMeasuringEquipment;
begin
  Result := List[Index] as IXMLMeasuringEquipment;
end;

{ TXMLMeasuringEquipmentCode }

function TXMLMeasuringEquipmentCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLMeasuringEquipmentCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLMeasuringEquipmentCodeList }

function TXMLMeasuringEquipmentCodeList.Add: IXMLMeasuringEquipmentCode;
begin
  Result := AddItem(-1) as IXMLMeasuringEquipmentCode;
end;

function TXMLMeasuringEquipmentCodeList.Insert(const Index: Integer): IXMLMeasuringEquipmentCode;
begin
  Result := AddItem(Index) as IXMLMeasuringEquipmentCode;
end;

function TXMLMeasuringEquipmentCodeList.Get_Item(Index: Integer): IXMLMeasuringEquipmentCode;
begin
  Result := List[Index] as IXMLMeasuringEquipmentCode;
end;

{ TXMLMeasurementModule }

function TXMLMeasurementModule.Get_BrandName: UnicodeString;
begin
  Result := AttributeNodes['BrandName'].Text;
end;

procedure TXMLMeasurementModule.Set_BrandName(Value: UnicodeString);
begin
  SetAttribute('BrandName', Value);
end;

function TXMLMeasurementModule.Get_ModelYear: UnicodeString;
begin
  Result := AttributeNodes['ModelYear'].Text;
end;

procedure TXMLMeasurementModule.Set_ModelYear(Value: UnicodeString);
begin
  SetAttribute('ModelYear', Value);
end;

{ TXMLCalibration }

procedure TXMLCalibration.AfterConstruction;
begin
  RegisterChildNode('CalibrationDate', TXMLCalibrationDate);
  FCalibrationDescription := CreateCollection(TXMLS255List, IXMLNode, 'CalibrationDescription') as IXMLS255List;
  inherited;
end;

function TXMLCalibration.Get_CalibrationNumber: UnicodeString;
begin
  Result := ChildNodes['CalibrationNumber'].Text;
end;

procedure TXMLCalibration.Set_CalibrationNumber(Value: UnicodeString);
begin
  ChildNodes['CalibrationNumber'].NodeValue := Value;
end;

function TXMLCalibration.Get_CalibrationDescription: IXMLS255List;
begin
  Result := FCalibrationDescription;
end;

function TXMLCalibration.Get_CalibrationDate: IXMLCalibrationDate;
begin
  Result := ChildNodes['CalibrationDate'] as IXMLCalibrationDate;
end;

{ TXMLCalibrationDate }

procedure TXMLCalibrationDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLCalibrationDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLCalibrationDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLCalibrationDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLMeasuringReference }

function TXMLMeasuringReference.Get_MeasuringReferenceType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringReferenceType'].Text;
end;

procedure TXMLMeasuringReference.Set_MeasuringReferenceType(Value: UnicodeString);
begin
  SetAttribute('MeasuringReferenceType', Value);
end;

function TXMLMeasuringReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLMeasuringReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLMeasuringReferenceList }

function TXMLMeasuringReferenceList.Add: IXMLMeasuringReference;
begin
  Result := AddItem(-1) as IXMLMeasuringReference;
end;

function TXMLMeasuringReferenceList.Insert(const Index: Integer): IXMLMeasuringReference;
begin
  Result := AddItem(Index) as IXMLMeasuringReference;
end;

function TXMLMeasuringReferenceList.Get_Item(Index: Integer): IXMLMeasuringReference;
begin
  Result := List[Index] as IXMLMeasuringReference;
end;

{ TXMLMeasuringCodeInfo }

function TXMLMeasuringCodeInfo.Get_MeasuringCodeType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringCodeType'].Text;
end;

procedure TXMLMeasuringCodeInfo.Set_MeasuringCodeType(Value: UnicodeString);
begin
  SetAttribute('MeasuringCodeType', Value);
end;

{ TXMLMeasuringCodeInfoList }

function TXMLMeasuringCodeInfoList.Add: IXMLMeasuringCodeInfo;
begin
  Result := AddItem(-1) as IXMLMeasuringCodeInfo;
end;

function TXMLMeasuringCodeInfoList.Insert(const Index: Integer): IXMLMeasuringCodeInfo;
begin
  Result := AddItem(Index) as IXMLMeasuringCodeInfo;
end;

function TXMLMeasuringCodeInfoList.Get_Item(Index: Integer): IXMLMeasuringCodeInfo;
begin
  Result := List[Index] as IXMLMeasuringCodeInfo;
end;

{ TXMLMeasuringCode }

function TXMLMeasuringCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLMeasuringCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLMeasuringProduct }

procedure TXMLMeasuringProduct.AfterConstruction;
begin
  RegisterChildNode('Product', TXMLProductClass);
  inherited;
end;

function TXMLMeasuringProduct.Get_Product: IXMLProductClass;
begin
  Result := ChildNodes['Product'] as IXMLProductClass;
end;

{ TXMLMeasurementSpecification }

procedure TXMLMeasurementSpecification.AfterConstruction;
begin
  RegisterChildNode('PropertySpecification', TXMLPropertySpecification);
  RegisterChildNode('QuantitySpecification', TXMLQuantitySpecification);
  FPropertySpecification := CreateCollection(TXMLPropertySpecificationList, IXMLPropertySpecification, 'PropertySpecification') as IXMLPropertySpecificationList;
  FQuantitySpecification := CreateCollection(TXMLQuantitySpecificationList, IXMLQuantitySpecification, 'QuantitySpecification') as IXMLQuantitySpecificationList;
  inherited;
end;

function TXMLMeasurementSpecification.Get_PropertySpecification: IXMLPropertySpecificationList;
begin
  Result := FPropertySpecification;
end;

function TXMLMeasurementSpecification.Get_QuantitySpecification: IXMLQuantitySpecificationList;
begin
  Result := FQuantitySpecification;
end;

{ TXMLPropertySpecification }

procedure TXMLPropertySpecification.AfterConstruction;
begin
  RegisterChildNode('PositionOnItem', TXMLPositionOnItem);
  RegisterChildNode('PropertySubSpecification', TXMLPropertySubSpecification);
  FPropertySubSpecification := CreateCollection(TXMLPropertySubSpecificationList, IXMLPropertySubSpecification, 'PropertySubSpecification') as IXMLPropertySubSpecificationList;
  inherited;
end;

function TXMLPropertySpecification.Get_PropertyType: UnicodeString;
begin
  Result := AttributeNodes['PropertyType'].Text;
end;

procedure TXMLPropertySpecification.Set_PropertyType(Value: UnicodeString);
begin
  SetAttribute('PropertyType', Value);
end;

function TXMLPropertySpecification.Get_MeasuringMethodType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethodType'].Text;
end;

procedure TXMLPropertySpecification.Set_MeasuringMethodType(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethodType', Value);
end;

function TXMLPropertySpecification.Get_MeasuringAgency: UnicodeString;
begin
  Result := AttributeNodes['MeasuringAgency'].Text;
end;

procedure TXMLPropertySpecification.Set_MeasuringAgency(Value: UnicodeString);
begin
  SetAttribute('MeasuringAgency', Value);
end;

function TXMLPropertySpecification.Get_MeasuringMethod: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethod'].Text;
end;

procedure TXMLPropertySpecification.Set_MeasuringMethod(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethod', Value);
end;

function TXMLPropertySpecification.Get_ValueType: UnicodeString;
begin
  Result := AttributeNodes['ValueType'].Text;
end;

procedure TXMLPropertySpecification.Set_ValueType(Value: UnicodeString);
begin
  SetAttribute('ValueType', Value);
end;

function TXMLPropertySpecification.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLPropertySpecification.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

function TXMLPropertySpecification.Get_ItemType: UnicodeString;
begin
  Result := AttributeNodes['ItemType'].Text;
end;

procedure TXMLPropertySpecification.Set_ItemType(Value: UnicodeString);
begin
  SetAttribute('ItemType', Value);
end;

function TXMLPropertySpecification.Get_PositionOnItem: IXMLPositionOnItem;
begin
  Result := ChildNodes['PositionOnItem'] as IXMLPositionOnItem;
end;

function TXMLPropertySpecification.Get_PropertySubSpecification: IXMLPropertySubSpecificationList;
begin
  Result := FPropertySubSpecification;
end;

{ TXMLPropertySpecificationList }

function TXMLPropertySpecificationList.Add: IXMLPropertySpecification;
begin
  Result := AddItem(-1) as IXMLPropertySpecification;
end;

function TXMLPropertySpecificationList.Insert(const Index: Integer): IXMLPropertySpecification;
begin
  Result := AddItem(Index) as IXMLPropertySpecification;
end;

function TXMLPropertySpecificationList.Get_Item(Index: Integer): IXMLPropertySpecification;
begin
  Result := List[Index] as IXMLPropertySpecification;
end;

{ TXMLPropertySubSpecification }

procedure TXMLPropertySubSpecification.AfterConstruction;
begin
  RegisterChildNode('PositionOnItem', TXMLPositionOnItem);
  inherited;
end;

function TXMLPropertySubSpecification.Get_PropertyType: UnicodeString;
begin
  Result := AttributeNodes['PropertyType'].Text;
end;

procedure TXMLPropertySubSpecification.Set_PropertyType(Value: UnicodeString);
begin
  SetAttribute('PropertyType', Value);
end;

function TXMLPropertySubSpecification.Get_MeasuringMethodType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethodType'].Text;
end;

procedure TXMLPropertySubSpecification.Set_MeasuringMethodType(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethodType', Value);
end;

function TXMLPropertySubSpecification.Get_MeasuringAgency: UnicodeString;
begin
  Result := AttributeNodes['MeasuringAgency'].Text;
end;

procedure TXMLPropertySubSpecification.Set_MeasuringAgency(Value: UnicodeString);
begin
  SetAttribute('MeasuringAgency', Value);
end;

function TXMLPropertySubSpecification.Get_MeasuringMethod: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethod'].Text;
end;

procedure TXMLPropertySubSpecification.Set_MeasuringMethod(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethod', Value);
end;

function TXMLPropertySubSpecification.Get_ValueType: UnicodeString;
begin
  Result := AttributeNodes['ValueType'].Text;
end;

procedure TXMLPropertySubSpecification.Set_ValueType(Value: UnicodeString);
begin
  SetAttribute('ValueType', Value);
end;

function TXMLPropertySubSpecification.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLPropertySubSpecification.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

function TXMLPropertySubSpecification.Get_ItemType: UnicodeString;
begin
  Result := AttributeNodes['ItemType'].Text;
end;

procedure TXMLPropertySubSpecification.Set_ItemType(Value: UnicodeString);
begin
  SetAttribute('ItemType', Value);
end;

function TXMLPropertySubSpecification.Get_PositionOnItem: IXMLPositionOnItem;
begin
  Result := ChildNodes['PositionOnItem'] as IXMLPositionOnItem;
end;

{ TXMLPropertySubSpecificationList }

function TXMLPropertySubSpecificationList.Add: IXMLPropertySubSpecification;
begin
  Result := AddItem(-1) as IXMLPropertySubSpecification;
end;

function TXMLPropertySubSpecificationList.Insert(const Index: Integer): IXMLPropertySubSpecification;
begin
  Result := AddItem(Index) as IXMLPropertySubSpecification;
end;

function TXMLPropertySubSpecificationList.Get_Item(Index: Integer): IXMLPropertySubSpecification;
begin
  Result := List[Index] as IXMLPropertySubSpecification;
end;

{ TXMLQuantitySpecification }

function TXMLQuantitySpecification.Get_QuantityType: UnicodeString;
begin
  Result := AttributeNodes['QuantityType'].Text;
end;

procedure TXMLQuantitySpecification.Set_QuantityType(Value: UnicodeString);
begin
  SetAttribute('QuantityType', Value);
end;

function TXMLQuantitySpecification.Get_QuantityTypeContext: UnicodeString;
begin
  Result := AttributeNodes['QuantityTypeContext'].Text;
end;

procedure TXMLQuantitySpecification.Set_QuantityTypeContext(Value: UnicodeString);
begin
  SetAttribute('QuantityTypeContext', Value);
end;

function TXMLQuantitySpecification.Get_AdjustmentType: UnicodeString;
begin
  Result := AttributeNodes['AdjustmentType'].Text;
end;

procedure TXMLQuantitySpecification.Set_AdjustmentType(Value: UnicodeString);
begin
  SetAttribute('AdjustmentType', Value);
end;

function TXMLQuantitySpecification.Get_MeasuringMethodType: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethodType'].Text;
end;

procedure TXMLQuantitySpecification.Set_MeasuringMethodType(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethodType', Value);
end;

function TXMLQuantitySpecification.Get_MeasuringAgency: UnicodeString;
begin
  Result := AttributeNodes['MeasuringAgency'].Text;
end;

procedure TXMLQuantitySpecification.Set_MeasuringAgency(Value: UnicodeString);
begin
  SetAttribute('MeasuringAgency', Value);
end;

function TXMLQuantitySpecification.Get_MeasuringMethod: UnicodeString;
begin
  Result := AttributeNodes['MeasuringMethod'].Text;
end;

procedure TXMLQuantitySpecification.Set_MeasuringMethod(Value: UnicodeString);
begin
  SetAttribute('MeasuringMethod', Value);
end;

function TXMLQuantitySpecification.Get_UOM: UnicodeString;
begin
  Result := AttributeNodes['UOM'].Text;
end;

procedure TXMLQuantitySpecification.Set_UOM(Value: UnicodeString);
begin
  SetAttribute('UOM', Value);
end;

{ TXMLQuantitySpecificationList }

function TXMLQuantitySpecificationList.Add: IXMLQuantitySpecification;
begin
  Result := AddItem(-1) as IXMLQuantitySpecification;
end;

function TXMLQuantitySpecificationList.Insert(const Index: Integer): IXMLQuantitySpecification;
begin
  Result := AddItem(Index) as IXMLQuantitySpecification;
end;

function TXMLQuantitySpecificationList.Get_Item(Index: Integer): IXMLQuantitySpecification;
begin
  Result := List[Index] as IXMLQuantitySpecification;
end;

{ TXMLDeliveryMessageSummary }

procedure TXMLDeliveryMessageSummary.AfterConstruction;
begin
  RegisterChildNode('TotalQuantity', TXMLTotalQuantity);
  RegisterChildNode('TotalInformationalQuantity', TXMLTotalInformationalQuantity);
  RegisterChildNode('TermsAndDisclaimers', TXMLTermsAndDisclaimers);
  FTotalQuantity := CreateCollection(TXMLTotalQuantityList, IXMLTotalQuantity, 'TotalQuantity') as IXMLTotalQuantityList;
  FTotalInformationalQuantity := CreateCollection(TXMLTotalInformationalQuantityList, IXMLTotalInformationalQuantity, 'TotalInformationalQuantity') as IXMLTotalInformationalQuantityList;
  FTermsAndDisclaimers := CreateCollection(TXMLTermsAndDisclaimersList, IXMLTermsAndDisclaimers, 'TermsAndDisclaimers') as IXMLTermsAndDisclaimersList;
  inherited;
end;

function TXMLDeliveryMessageSummary.Get_TotalNumberOfLineItems: LongWord;
begin
  Result := ChildNodes['TotalNumberOfLineItems'].NodeValue;
end;

procedure TXMLDeliveryMessageSummary.Set_TotalNumberOfLineItems(Value: LongWord);
begin
  ChildNodes['TotalNumberOfLineItems'].NodeValue := Value;
end;

function TXMLDeliveryMessageSummary.Get_TotalQuantity: IXMLTotalQuantityList;
begin
  Result := FTotalQuantity;
end;

function TXMLDeliveryMessageSummary.Get_TotalInformationalQuantity: IXMLTotalInformationalQuantityList;
begin
  Result := FTotalInformationalQuantity;
end;

function TXMLDeliveryMessageSummary.Get_TermsAndDisclaimers: IXMLTermsAndDisclaimersList;
begin
  Result := FTermsAndDisclaimers;
end;

{ TXMLDeliveryPlanningBucket }

procedure TXMLDeliveryPlanningBucket.AfterConstruction;
begin
  RegisterChildNode('TimePeriod', TXMLTimePeriod);
  RegisterChildNode('PlanningOutcome', TXMLPlanningOutcome);
  FPlanningOutcome := CreateCollection(TXMLPlanningOutcomeList, IXMLPlanningOutcome, 'PlanningOutcome') as IXMLPlanningOutcomeList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLDeliveryPlanningBucket.Get_BucketStatusType: UnicodeString;
begin
  Result := AttributeNodes['BucketStatusType'].Text;
end;

procedure TXMLDeliveryPlanningBucket.Set_BucketStatusType(Value: UnicodeString);
begin
  SetAttribute('BucketStatusType', Value);
end;

function TXMLDeliveryPlanningBucket.Get_TimePeriod: IXMLTimePeriod;
begin
  Result := ChildNodes['TimePeriod'] as IXMLTimePeriod;
end;

function TXMLDeliveryPlanningBucket.Get_PlanningOutcome: IXMLPlanningOutcomeList;
begin
  Result := FPlanningOutcome;
end;

function TXMLDeliveryPlanningBucket.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLTimePeriod }

procedure TXMLTimePeriod.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  RegisterChildNode('DateTimeRange', TXMLDateTimeRange);
  inherited;
end;

function TXMLTimePeriod.Get_PeriodType: UnicodeString;
begin
  Result := AttributeNodes['PeriodType'].Text;
end;

procedure TXMLTimePeriod.Set_PeriodType(Value: UnicodeString);
begin
  SetAttribute('PeriodType', Value);
end;

function TXMLTimePeriod.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLTimePeriod.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLTimePeriod.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

function TXMLTimePeriod.Get_DateTimeRange: IXMLDateTimeRange;
begin
  Result := ChildNodes['DateTimeRange'] as IXMLDateTimeRange;
end;

function TXMLTimePeriod.Get_Week: UnicodeString;
begin
  Result := ChildNodes['Week'].Text;
end;

procedure TXMLTimePeriod.Set_Week(Value: UnicodeString);
begin
  ChildNodes['Week'].NodeValue := Value;
end;

{ TXMLPlanningOutcome }

procedure TXMLPlanningOutcome.AfterConstruction;
begin
  RegisterChildNode('QuantityInformation', TXMLQuantityInformation);
  RegisterChildNode('PlanningPropertyValue', TXMLPlanningPropertyValue);
  RegisterChildNode('DeviationReason', TXMLDeviationReason);
  RegisterChildNode('PlanningReferenceInformation', TXMLPlanningReferenceInformation);
  RegisterChildNode('ResourceInformation', TXMLResourceInformation);
  FPlanningPropertyValue := CreateCollection(TXMLPlanningPropertyValueList, IXMLPlanningPropertyValue, 'PlanningPropertyValue') as IXMLPlanningPropertyValueList;
  FDeviationReason := CreateCollection(TXMLDeviationReasonList, IXMLDeviationReason, 'DeviationReason') as IXMLDeviationReasonList;
  FPlanningReferenceInformation := CreateCollection(TXMLPlanningReferenceInformationList, IXMLPlanningReferenceInformation, 'PlanningReferenceInformation') as IXMLPlanningReferenceInformationList;
  inherited;
end;

function TXMLPlanningOutcome.Get_PlanningOutcomeType: UnicodeString;
begin
  Result := AttributeNodes['PlanningOutcomeType'].Text;
end;

procedure TXMLPlanningOutcome.Set_PlanningOutcomeType(Value: UnicodeString);
begin
  SetAttribute('PlanningOutcomeType', Value);
end;

function TXMLPlanningOutcome.Get_PlanningOutcomePeriodType: UnicodeString;
begin
  Result := AttributeNodes['PlanningOutcomePeriodType'].Text;
end;

procedure TXMLPlanningOutcome.Set_PlanningOutcomePeriodType(Value: UnicodeString);
begin
  SetAttribute('PlanningOutcomePeriodType', Value);
end;

function TXMLPlanningOutcome.Get_PlanningOutcomeContextType: UnicodeString;
begin
  Result := AttributeNodes['PlanningOutcomeContextType'].Text;
end;

procedure TXMLPlanningOutcome.Set_PlanningOutcomeContextType(Value: UnicodeString);
begin
  SetAttribute('PlanningOutcomeContextType', Value);
end;

function TXMLPlanningOutcome.Get_TransportModeType: UnicodeString;
begin
  Result := AttributeNodes['TransportModeType'].Text;
end;

procedure TXMLPlanningOutcome.Set_TransportModeType(Value: UnicodeString);
begin
  SetAttribute('TransportModeType', Value);
end;

function TXMLPlanningOutcome.Get_TransportContextType: UnicodeString;
begin
  Result := AttributeNodes['TransportContextType'].Text;
end;

procedure TXMLPlanningOutcome.Set_TransportContextType(Value: UnicodeString);
begin
  SetAttribute('TransportContextType', Value);
end;

function TXMLPlanningOutcome.Get_IsTotal: UnicodeString;
begin
  Result := AttributeNodes['IsTotal'].Text;
end;

procedure TXMLPlanningOutcome.Set_IsTotal(Value: UnicodeString);
begin
  SetAttribute('IsTotal', Value);
end;

function TXMLPlanningOutcome.Get_QuantityInformation: IXMLQuantityInformation;
begin
  Result := ChildNodes['QuantityInformation'] as IXMLQuantityInformation;
end;

function TXMLPlanningOutcome.Get_PlanningPropertyValue: IXMLPlanningPropertyValueList;
begin
  Result := FPlanningPropertyValue;
end;

function TXMLPlanningOutcome.Get_DeviationReason: IXMLDeviationReasonList;
begin
  Result := FDeviationReason;
end;

function TXMLPlanningOutcome.Get_PlanningReferenceInformation: IXMLPlanningReferenceInformationList;
begin
  Result := FPlanningReferenceInformation;
end;

function TXMLPlanningOutcome.Get_ResourceInformation: IXMLResourceInformation;
begin
  Result := ChildNodes['ResourceInformation'] as IXMLResourceInformation;
end;

{ TXMLPlanningOutcomeList }

function TXMLPlanningOutcomeList.Add: IXMLPlanningOutcome;
begin
  Result := AddItem(-1) as IXMLPlanningOutcome;
end;

function TXMLPlanningOutcomeList.Insert(const Index: Integer): IXMLPlanningOutcome;
begin
  Result := AddItem(Index) as IXMLPlanningOutcome;
end;

function TXMLPlanningOutcomeList.Get_Item(Index: Integer): IXMLPlanningOutcome;
begin
  Result := List[Index] as IXMLPlanningOutcome;
end;

{ TXMLPlanningPropertyValue }

procedure TXMLPlanningPropertyValue.AfterConstruction;
begin
  RegisterChildNode('NumericValue', TXMLDetailMeasurement);
  inherited;
end;

function TXMLPlanningPropertyValue.Get_PlanningPropertyType: UnicodeString;
begin
  Result := AttributeNodes['PlanningPropertyType'].Text;
end;

procedure TXMLPlanningPropertyValue.Set_PlanningPropertyType(Value: UnicodeString);
begin
  SetAttribute('PlanningPropertyType', Value);
end;

function TXMLPlanningPropertyValue.Get_BinaryValue: UnicodeString;
begin
  Result := ChildNodes['BinaryValue'].Text;
end;

procedure TXMLPlanningPropertyValue.Set_BinaryValue(Value: UnicodeString);
begin
  ChildNodes['BinaryValue'].NodeValue := Value;
end;

function TXMLPlanningPropertyValue.Get_BooleanValue: Boolean;
begin
  Result := ChildNodes['BooleanValue'].NodeValue;
end;

procedure TXMLPlanningPropertyValue.Set_BooleanValue(Value: Boolean);
begin
  ChildNodes['BooleanValue'].NodeValue := Value;
end;

function TXMLPlanningPropertyValue.Get_DateTimeValue: UnicodeString;
begin
  Result := ChildNodes['DateTimeValue'].Text;
end;

procedure TXMLPlanningPropertyValue.Set_DateTimeValue(Value: UnicodeString);
begin
  ChildNodes['DateTimeValue'].NodeValue := Value;
end;

function TXMLPlanningPropertyValue.Get_NumericValue: IXMLDetailMeasurement;
begin
  Result := ChildNodes['NumericValue'] as IXMLDetailMeasurement;
end;

function TXMLPlanningPropertyValue.Get_TextValue: UnicodeString;
begin
  Result := ChildNodes['TextValue'].Text;
end;

procedure TXMLPlanningPropertyValue.Set_TextValue(Value: UnicodeString);
begin
  ChildNodes['TextValue'].NodeValue := Value;
end;

{ TXMLPlanningPropertyValueList }

function TXMLPlanningPropertyValueList.Add: IXMLPlanningPropertyValue;
begin
  Result := AddItem(-1) as IXMLPlanningPropertyValue;
end;

function TXMLPlanningPropertyValueList.Insert(const Index: Integer): IXMLPlanningPropertyValue;
begin
  Result := AddItem(Index) as IXMLPlanningPropertyValue;
end;

function TXMLPlanningPropertyValueList.Get_Item(Index: Integer): IXMLPlanningPropertyValue;
begin
  Result := List[Index] as IXMLPlanningPropertyValue;
end;

{ TXMLDeviationReason }

procedure TXMLDeviationReason.AfterConstruction;
begin
  RegisterChildNode('DeviationReasonCode', TXMLDeviationReasonCode);
  FDeviationReasonDescription := CreateCollection(TXMLS255List, IXMLNode, 'DeviationReasonDescription') as IXMLS255List;
  inherited;
end;

function TXMLDeviationReason.Get_DeviationReasonCode: IXMLDeviationReasonCode;
begin
  Result := ChildNodes['DeviationReasonCode'] as IXMLDeviationReasonCode;
end;

function TXMLDeviationReason.Get_DeviationReasonDescription: IXMLS255List;
begin
  Result := FDeviationReasonDescription;
end;

{ TXMLDeviationReasonList }

function TXMLDeviationReasonList.Add: IXMLDeviationReason;
begin
  Result := AddItem(-1) as IXMLDeviationReason;
end;

function TXMLDeviationReasonList.Insert(const Index: Integer): IXMLDeviationReason;
begin
  Result := AddItem(Index) as IXMLDeviationReason;
end;

function TXMLDeviationReasonList.Get_Item(Index: Integer): IXMLDeviationReason;
begin
  Result := List[Index] as IXMLDeviationReason;
end;

{ TXMLDeviationReasonCode }

function TXMLDeviationReasonCode.Get_Agency: UnicodeString;
begin
  Result := AttributeNodes['Agency'].Text;
end;

procedure TXMLDeviationReasonCode.Set_Agency(Value: UnicodeString);
begin
  SetAttribute('Agency', Value);
end;

{ TXMLPlanningReferenceInformation }

procedure TXMLPlanningReferenceInformation.AfterConstruction;
begin
  RegisterChildNode('Document', TXMLDocument);
  inherited;
end;

function TXMLPlanningReferenceInformation.Get_Document: IXMLDocument;
begin
  Result := ChildNodes['Document'] as IXMLDocument;
end;

{ TXMLPlanningReferenceInformationList }

function TXMLPlanningReferenceInformationList.Add: IXMLPlanningReferenceInformation;
begin
  Result := AddItem(-1) as IXMLPlanningReferenceInformation;
end;

function TXMLPlanningReferenceInformationList.Insert(const Index: Integer): IXMLPlanningReferenceInformation;
begin
  Result := AddItem(Index) as IXMLPlanningReferenceInformation;
end;

function TXMLPlanningReferenceInformationList.Get_Item(Index: Integer): IXMLPlanningReferenceInformation;
begin
  Result := List[Index] as IXMLPlanningReferenceInformation;
end;

{ TXMLDocument }

procedure TXMLDocument.AfterConstruction;
begin
  RegisterChildNode('DocumentDate', TXMLDocumentDate);
  RegisterChildNode('DocumentReference', TXMLDocumentReference);
  FDocumentReference := CreateCollection(TXMLDocumentReferenceList, IXMLDocumentReference, 'DocumentReference') as IXMLDocumentReferenceList;
  inherited;
end;

function TXMLDocument.Get_DocumentName: UnicodeString;
begin
  Result := AttributeNodes['DocumentName'].Text;
end;

procedure TXMLDocument.Set_DocumentName(Value: UnicodeString);
begin
  SetAttribute('DocumentName', Value);
end;

function TXMLDocument.Get_DocumentType: UnicodeString;
begin
  Result := AttributeNodes['DocumentType'].Text;
end;

procedure TXMLDocument.Set_DocumentType(Value: UnicodeString);
begin
  SetAttribute('DocumentType', Value);
end;

function TXMLDocument.Get_OtherDocumentName: UnicodeString;
begin
  Result := AttributeNodes['OtherDocumentName'].Text;
end;

procedure TXMLDocument.Set_OtherDocumentName(Value: UnicodeString);
begin
  SetAttribute('OtherDocumentName', Value);
end;

function TXMLDocument.Get_OtherDocumentType: UnicodeString;
begin
  Result := AttributeNodes['OtherDocumentType'].Text;
end;

procedure TXMLDocument.Set_OtherDocumentType(Value: UnicodeString);
begin
  SetAttribute('OtherDocumentType', Value);
end;

function TXMLDocument.Get_DocumentNumber: UnicodeString;
begin
  Result := ChildNodes['DocumentNumber'].Text;
end;

procedure TXMLDocument.Set_DocumentNumber(Value: UnicodeString);
begin
  ChildNodes['DocumentNumber'].NodeValue := Value;
end;

function TXMLDocument.Get_DocumentVersionNumber: UnicodeString;
begin
  Result := ChildNodes['DocumentVersionNumber'].Text;
end;

procedure TXMLDocument.Set_DocumentVersionNumber(Value: UnicodeString);
begin
  ChildNodes['DocumentVersionNumber'].NodeValue := Value;
end;

function TXMLDocument.Get_DocumentDate: IXMLDocumentDate;
begin
  Result := ChildNodes['DocumentDate'] as IXMLDocumentDate;
end;

function TXMLDocument.Get_TransactionHistoryNumber: LongWord;
begin
  Result := ChildNodes['TransactionHistoryNumber'].NodeValue;
end;

procedure TXMLDocument.Set_TransactionHistoryNumber(Value: LongWord);
begin
  ChildNodes['TransactionHistoryNumber'].NodeValue := Value;
end;

function TXMLDocument.Get_DocumentReference: IXMLDocumentReferenceList;
begin
  Result := FDocumentReference;
end;

{ TXMLDocumentDate }

procedure TXMLDocumentDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDocumentDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDocumentDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDocumentDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLDeliverySchedule }

procedure TXMLDeliverySchedule.AfterConstruction;
begin
  RegisterChildNode('ProductionStatus', TXMLProductionStatus);
  RegisterChildNode('DeliveryStatus', TXMLDeliveryStatus);
  RegisterChildNode('DeliveryDateWindow', TXMLDeliveryDateWindow);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('PriceDetails', TXMLPriceDetails);
  RegisterChildNode('MonetaryAdjustment', TXMLMonetaryAdjustment);
  RegisterChildNode('DeliveryLeg', TXMLDeliveryLeg);
  RegisterChildNode('DeliveryScheduleReference', TXMLDeliveryScheduleReference);
  FDeliveryDateWindow := CreateCollection(TXMLDeliveryDateWindowList, IXMLDeliveryDateWindow, 'DeliveryDateWindow') as IXMLDeliveryDateWindowList;
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FMonetaryAdjustment := CreateCollection(TXMLMonetaryAdjustmentList, IXMLMonetaryAdjustment, 'MonetaryAdjustment') as IXMLMonetaryAdjustmentList;
  FDeliveryLeg := CreateCollection(TXMLDeliveryLegList, IXMLDeliveryLeg, 'DeliveryLeg') as IXMLDeliveryLegList;
  FDeliveryScheduleReference := CreateCollection(TXMLDeliveryScheduleReferenceList, IXMLDeliveryScheduleReference, 'DeliveryScheduleReference') as IXMLDeliveryScheduleReferenceList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLDeliverySchedule.Get_DeliveryLineNumber: LongWord;
begin
  Result := ChildNodes['DeliveryLineNumber'].NodeValue;
end;

procedure TXMLDeliverySchedule.Set_DeliveryLineNumber(Value: LongWord);
begin
  ChildNodes['DeliveryLineNumber'].NodeValue := Value;
end;

function TXMLDeliverySchedule.Get_ProductionStatus: IXMLProductionStatus;
begin
  Result := ChildNodes['ProductionStatus'] as IXMLProductionStatus;
end;

function TXMLDeliverySchedule.Get_DeliveryStatus: IXMLDeliveryStatus;
begin
  Result := ChildNodes['DeliveryStatus'] as IXMLDeliveryStatus;
end;

function TXMLDeliverySchedule.Get_DeliveryDateWindow: IXMLDeliveryDateWindowList;
begin
  Result := FDeliveryDateWindow;
end;

function TXMLDeliverySchedule.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLDeliverySchedule.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLDeliverySchedule.Get_PriceDetails: IXMLPriceDetails;
begin
  Result := ChildNodes['PriceDetails'] as IXMLPriceDetails;
end;

function TXMLDeliverySchedule.Get_MonetaryAdjustment: IXMLMonetaryAdjustmentList;
begin
  Result := FMonetaryAdjustment;
end;

function TXMLDeliverySchedule.Get_DeliveryLeg: IXMLDeliveryLegList;
begin
  Result := FDeliveryLeg;
end;

function TXMLDeliverySchedule.Get_DeliveryScheduleReference: IXMLDeliveryScheduleReferenceList;
begin
  Result := FDeliveryScheduleReference;
end;

function TXMLDeliverySchedule.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLDeliveryScheduleList }

function TXMLDeliveryScheduleList.Add: IXMLDeliverySchedule;
begin
  Result := AddItem(-1) as IXMLDeliverySchedule;
end;

function TXMLDeliveryScheduleList.Insert(const Index: Integer): IXMLDeliverySchedule;
begin
  Result := AddItem(Index) as IXMLDeliverySchedule;
end;

function TXMLDeliveryScheduleList.Get_Item(Index: Integer): IXMLDeliverySchedule;
begin
  Result := List[Index] as IXMLDeliverySchedule;
end;

{ TXMLProductionStatus }

procedure TXMLProductionStatus.AfterConstruction;
begin
  RegisterChildNode('ProductionLastDateOfChange', TXMLProductionLastDateOfChange);
  inherited;
end;

function TXMLProductionStatus.Get_ProductionStatusType: UnicodeString;
begin
  Result := AttributeNodes['ProductionStatusType'].Text;
end;

procedure TXMLProductionStatus.Set_ProductionStatusType(Value: UnicodeString);
begin
  SetAttribute('ProductionStatusType', Value);
end;

function TXMLProductionStatus.Get_ProductionLastDateOfChange: IXMLProductionLastDateOfChange;
begin
  Result := ChildNodes['ProductionLastDateOfChange'] as IXMLProductionLastDateOfChange;
end;

{ TXMLProductionLastDateOfChange }

procedure TXMLProductionLastDateOfChange.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLProductionLastDateOfChange.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLProductionLastDateOfChange.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLProductionLastDateOfChange.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLDeliveryStatus }

procedure TXMLDeliveryStatus.AfterConstruction;
begin
  RegisterChildNode('DeliveryLastDateOfChange', TXMLDeliveryLastDateOfChange);
  inherited;
end;

function TXMLDeliveryStatus.Get_DeliveryStatusType: UnicodeString;
begin
  Result := AttributeNodes['DeliveryStatusType'].Text;
end;

procedure TXMLDeliveryStatus.Set_DeliveryStatusType(Value: UnicodeString);
begin
  SetAttribute('DeliveryStatusType', Value);
end;

function TXMLDeliveryStatus.Get_DeliveryLastDateOfChange: IXMLDeliveryLastDateOfChange;
begin
  Result := ChildNodes['DeliveryLastDateOfChange'] as IXMLDeliveryLastDateOfChange;
end;

{ TXMLDeliveryLastDateOfChange }

procedure TXMLDeliveryLastDateOfChange.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLDeliveryLastDateOfChange.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLDeliveryLastDateOfChange.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLDeliveryLastDateOfChange.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLDeliveryScheduleReference }

function TXMLDeliveryScheduleReference.Get_DeliveryScheduleReferenceType: UnicodeString;
begin
  Result := AttributeNodes['DeliveryScheduleReferenceType'].Text;
end;

procedure TXMLDeliveryScheduleReference.Set_DeliveryScheduleReferenceType(Value: UnicodeString);
begin
  SetAttribute('DeliveryScheduleReferenceType', Value);
end;

function TXMLDeliveryScheduleReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLDeliveryScheduleReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLDeliveryScheduleReferenceList }

function TXMLDeliveryScheduleReferenceList.Add: IXMLDeliveryScheduleReference;
begin
  Result := AddItem(-1) as IXMLDeliveryScheduleReference;
end;

function TXMLDeliveryScheduleReferenceList.Insert(const Index: Integer): IXMLDeliveryScheduleReference;
begin
  Result := AddItem(Index) as IXMLDeliveryScheduleReference;
end;

function TXMLDeliveryScheduleReferenceList.Get_Item(Index: Integer): IXMLDeliveryScheduleReference;
begin
  Result := List[Index] as IXMLDeliveryScheduleReference;
end;

{ TXMLGoodsReceiptHeader }

procedure TXMLGoodsReceiptHeader.AfterConstruction;
begin
  RegisterChildNode('GoodsReceiptIssueDate', TXMLGoodsReceiptIssueDate);
  RegisterChildNode('GoodsReceiptArrivalDate', TXMLGoodsReceiptArrivalDate);
  RegisterChildNode('TimePeriod', TXMLTimePeriod);
  RegisterChildNode('GoodsReceiptUnloadDate', TXMLGoodsReceiptUnloadDate);
  RegisterChildNode('GoodsReceiptReference', TXMLGoodsReceiptReference);
  RegisterChildNode('DeliveryMessageDate', TXMLDeliveryMessageDate);
  RegisterChildNode('OtherDate', TXMLOtherDate);
  RegisterChildNode('BuyerParty', TXMLParty);
  RegisterChildNode('BillToParty', TXMLParty);
  RegisterChildNode('SupplierParty', TXMLParty);
  RegisterChildNode('CarrierParty', TXMLParty);
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('SenderParty', TXMLTypedParty);
  RegisterChildNode('ReceiverParty', TXMLTypedParty);
  RegisterChildNode('ShipToCharacteristics', TXMLShipToCharacteristics);
  RegisterChildNode('TransportVehicleCharacteristics', TXMLTransportVehicleCharacteristics);
  RegisterChildNode('TransportUnitCharacteristics', TXMLTransportUnitCharacteristics);
  RegisterChildNode('TransportationComment', TXMLTransportationComment);
  FGoodsReceiptReference := CreateCollection(TXMLGoodsReceiptReferenceList, IXMLGoodsReceiptReference, 'GoodsReceiptReference') as IXMLGoodsReceiptReferenceList;
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FReceiverParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'ReceiverParty') as IXMLTypedPartyList;
  FTransportUnitCharacteristics := CreateCollection(TXMLTransportUnitCharacteristicsList, IXMLTransportUnitCharacteristics, 'TransportUnitCharacteristics') as IXMLTransportUnitCharacteristicsList;
  FTransportationComment := CreateCollection(TXMLTransportationCommentList, IXMLTransportationComment, 'TransportationComment') as IXMLTransportationCommentList;
  inherited;
end;

function TXMLGoodsReceiptHeader.Get_GoodsReceiptHeaderAcceptance: UnicodeString;
begin
  Result := AttributeNodes['GoodsReceiptHeaderAcceptance'].Text;
end;

procedure TXMLGoodsReceiptHeader.Set_GoodsReceiptHeaderAcceptance(Value: UnicodeString);
begin
  SetAttribute('GoodsReceiptHeaderAcceptance', Value);
end;

function TXMLGoodsReceiptHeader.Get_GoodsReceiptNumber: UnicodeString;
begin
  Result := ChildNodes['GoodsReceiptNumber'].Text;
end;

procedure TXMLGoodsReceiptHeader.Set_GoodsReceiptNumber(Value: UnicodeString);
begin
  ChildNodes['GoodsReceiptNumber'].NodeValue := Value;
end;

function TXMLGoodsReceiptHeader.Get_GoodsReceiptIssueDate: IXMLGoodsReceiptIssueDate;
begin
  Result := ChildNodes['GoodsReceiptIssueDate'] as IXMLGoodsReceiptIssueDate;
end;

function TXMLGoodsReceiptHeader.Get_TransactionHistoryNumber: LongWord;
begin
  Result := ChildNodes['TransactionHistoryNumber'].NodeValue;
end;

procedure TXMLGoodsReceiptHeader.Set_TransactionHistoryNumber(Value: LongWord);
begin
  ChildNodes['TransactionHistoryNumber'].NodeValue := Value;
end;

function TXMLGoodsReceiptHeader.Get_GoodsReceiptArrivalDate: IXMLGoodsReceiptArrivalDate;
begin
  Result := ChildNodes['GoodsReceiptArrivalDate'] as IXMLGoodsReceiptArrivalDate;
end;

function TXMLGoodsReceiptHeader.Get_TimePeriod: IXMLTimePeriod;
begin
  Result := ChildNodes['TimePeriod'] as IXMLTimePeriod;
end;

function TXMLGoodsReceiptHeader.Get_GoodsReceiptUnloadDate: IXMLGoodsReceiptUnloadDate;
begin
  Result := ChildNodes['GoodsReceiptUnloadDate'] as IXMLGoodsReceiptUnloadDate;
end;

function TXMLGoodsReceiptHeader.Get_GoodsReceiptReference: IXMLGoodsReceiptReferenceList;
begin
  Result := FGoodsReceiptReference;
end;

function TXMLGoodsReceiptHeader.Get_DeliveryMessageNumber: UnicodeString;
begin
  Result := ChildNodes['DeliveryMessageNumber'].Text;
end;

procedure TXMLGoodsReceiptHeader.Set_DeliveryMessageNumber(Value: UnicodeString);
begin
  ChildNodes['DeliveryMessageNumber'].NodeValue := Value;
end;

function TXMLGoodsReceiptHeader.Get_DeliveryMessageDate: IXMLDeliveryMessageDate;
begin
  Result := ChildNodes['DeliveryMessageDate'] as IXMLDeliveryMessageDate;
end;

function TXMLGoodsReceiptHeader.Get_OtherDate: IXMLOtherDate;
begin
  Result := ChildNodes['OtherDate'] as IXMLOtherDate;
end;

function TXMLGoodsReceiptHeader.Get_BuyerParty: IXMLParty;
begin
  Result := ChildNodes['BuyerParty'] as IXMLParty;
end;

function TXMLGoodsReceiptHeader.Get_BillToParty: IXMLParty;
begin
  Result := ChildNodes['BillToParty'] as IXMLParty;
end;

function TXMLGoodsReceiptHeader.Get_SupplierParty: IXMLParty;
begin
  Result := ChildNodes['SupplierParty'] as IXMLParty;
end;

function TXMLGoodsReceiptHeader.Get_CarrierParty: IXMLParty;
begin
  Result := ChildNodes['CarrierParty'] as IXMLParty;
end;

function TXMLGoodsReceiptHeader.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLGoodsReceiptHeader.Get_SenderParty: IXMLTypedParty;
begin
  Result := ChildNodes['SenderParty'] as IXMLTypedParty;
end;

function TXMLGoodsReceiptHeader.Get_ReceiverParty: IXMLTypedPartyList;
begin
  Result := FReceiverParty;
end;

function TXMLGoodsReceiptHeader.Get_ShipToCharacteristics: IXMLShipToCharacteristics;
begin
  Result := ChildNodes['ShipToCharacteristics'] as IXMLShipToCharacteristics;
end;

function TXMLGoodsReceiptHeader.Get_TransportVehicleCharacteristics: IXMLTransportVehicleCharacteristics;
begin
  Result := ChildNodes['TransportVehicleCharacteristics'] as IXMLTransportVehicleCharacteristics;
end;

function TXMLGoodsReceiptHeader.Get_TransportUnitCharacteristics: IXMLTransportUnitCharacteristicsList;
begin
  Result := FTransportUnitCharacteristics;
end;

function TXMLGoodsReceiptHeader.Get_TransportationComment: IXMLTransportationCommentList;
begin
  Result := FTransportationComment;
end;

{ TXMLGoodsReceiptIssueDate }

procedure TXMLGoodsReceiptIssueDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLGoodsReceiptIssueDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLGoodsReceiptIssueDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLGoodsReceiptIssueDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLGoodsReceiptArrivalDate }

procedure TXMLGoodsReceiptArrivalDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLGoodsReceiptArrivalDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLGoodsReceiptArrivalDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLGoodsReceiptArrivalDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLGoodsReceiptUnloadDate }

procedure TXMLGoodsReceiptUnloadDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  RegisterChildNode('DateTimeRange', TXMLDateTimeRange);
  inherited;
end;

function TXMLGoodsReceiptUnloadDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLGoodsReceiptUnloadDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLGoodsReceiptUnloadDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

function TXMLGoodsReceiptUnloadDate.Get_DateTimeRange: IXMLDateTimeRange;
begin
  Result := ChildNodes['DateTimeRange'] as IXMLDateTimeRange;
end;

{ TXMLGoodsReceiptReference }

function TXMLGoodsReceiptReference.Get_GoodsReceiptReferenceType: UnicodeString;
begin
  Result := AttributeNodes['GoodsReceiptReferenceType'].Text;
end;

procedure TXMLGoodsReceiptReference.Set_GoodsReceiptReferenceType(Value: UnicodeString);
begin
  SetAttribute('GoodsReceiptReferenceType', Value);
end;

function TXMLGoodsReceiptReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLGoodsReceiptReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLGoodsReceiptReferenceList }

function TXMLGoodsReceiptReferenceList.Add: IXMLGoodsReceiptReference;
begin
  Result := AddItem(-1) as IXMLGoodsReceiptReference;
end;

function TXMLGoodsReceiptReferenceList.Insert(const Index: Integer): IXMLGoodsReceiptReference;
begin
  Result := AddItem(Index) as IXMLGoodsReceiptReference;
end;

function TXMLGoodsReceiptReferenceList.Get_Item(Index: Integer): IXMLGoodsReceiptReference;
begin
  Result := List[Index] as IXMLGoodsReceiptReference;
end;

{ TXMLTransportationComment }

function TXMLTransportationComment.Get_AdditionalText: UnicodeString;
begin
  Result := ChildNodes['AdditionalText'].Text;
end;

procedure TXMLTransportationComment.Set_AdditionalText(Value: UnicodeString);
begin
  ChildNodes['AdditionalText'].NodeValue := Value;
end;

{ TXMLTransportationCommentList }

function TXMLTransportationCommentList.Add: IXMLTransportationComment;
begin
  Result := AddItem(-1) as IXMLTransportationComment;
end;

function TXMLTransportationCommentList.Insert(const Index: Integer): IXMLTransportationComment;
begin
  Result := AddItem(Index) as IXMLTransportationComment;
end;

function TXMLTransportationCommentList.Get_Item(Index: Integer): IXMLTransportationComment;
begin
  Result := List[Index] as IXMLTransportationComment;
end;

{ TXMLGoodsReceiptLineItem }

procedure TXMLGoodsReceiptLineItem.AfterConstruction;
begin
  RegisterChildNode('PurchaseOrderInformation', TXMLPurchaseOrderInformation);
  RegisterChildNode('MillParty', TXMLParty);
  RegisterChildNode('GoodsReceiptReference', TXMLGoodsReceiptReference);
  RegisterChildNode('Product', TXMLProductClass);
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  RegisterChildNode('GoodsReceiptPackage', TXMLGoodsReceiptPackage);
  RegisterChildNode('SafetyAndEnvironmentalInformation', TXMLSafetyAndEnvironmentalInformationClass);
  FGoodsReceiptReference := CreateCollection(TXMLGoodsReceiptReferenceList, IXMLGoodsReceiptReference, 'GoodsReceiptReference') as IXMLGoodsReceiptReferenceList;
  FInformationalQuantity := CreateCollection(TXMLInformationalQuantityList, IXMLInformationalQuantity, 'InformationalQuantity') as IXMLInformationalQuantityList;
  FGoodsReceiptPackage := CreateCollection(TXMLGoodsReceiptPackageList, IXMLGoodsReceiptPackage, 'GoodsReceiptPackage') as IXMLGoodsReceiptPackageList;
  FSafetyAndEnvironmentalInformation := CreateCollection(TXMLSafetyAndEnvironmentalInformationClassList, IXMLSafetyAndEnvironmentalInformationClass, 'SafetyAndEnvironmentalInformation') as IXMLSafetyAndEnvironmentalInformationClassList;
  inherited;
end;

function TXMLGoodsReceiptLineItem.Get_GoodsReceiptAcceptance: UnicodeString;
begin
  Result := AttributeNodes['GoodsReceiptAcceptance'].Text;
end;

procedure TXMLGoodsReceiptLineItem.Set_GoodsReceiptAcceptance(Value: UnicodeString);
begin
  SetAttribute('GoodsReceiptAcceptance', Value);
end;

function TXMLGoodsReceiptLineItem.Get_GoodsReceivedRejectedType: UnicodeString;
begin
  Result := AttributeNodes['GoodsReceivedRejectedType'].Text;
end;

procedure TXMLGoodsReceiptLineItem.Set_GoodsReceivedRejectedType(Value: UnicodeString);
begin
  SetAttribute('GoodsReceivedRejectedType', Value);
end;

function TXMLGoodsReceiptLineItem.Get_GoodsReceiptLineItemNumber: LongWord;
begin
  Result := ChildNodes['GoodsReceiptLineItemNumber'].NodeValue;
end;

procedure TXMLGoodsReceiptLineItem.Set_GoodsReceiptLineItemNumber(Value: LongWord);
begin
  ChildNodes['GoodsReceiptLineItemNumber'].NodeValue := Value;
end;

function TXMLGoodsReceiptLineItem.Get_DeliveryMessageLineItemNumber: LongWord;
begin
  Result := ChildNodes['DeliveryMessageLineItemNumber'].NodeValue;
end;

procedure TXMLGoodsReceiptLineItem.Set_DeliveryMessageLineItemNumber(Value: LongWord);
begin
  ChildNodes['DeliveryMessageLineItemNumber'].NodeValue := Value;
end;

function TXMLGoodsReceiptLineItem.Get_PurchaseOrderInformation: IXMLPurchaseOrderInformation;
begin
  Result := ChildNodes['PurchaseOrderInformation'] as IXMLPurchaseOrderInformation;
end;

function TXMLGoodsReceiptLineItem.Get_PurchaseOrderLineItemNumber: LongWord;
begin
  Result := ChildNodes['PurchaseOrderLineItemNumber'].NodeValue;
end;

procedure TXMLGoodsReceiptLineItem.Set_PurchaseOrderLineItemNumber(Value: LongWord);
begin
  ChildNodes['PurchaseOrderLineItemNumber'].NodeValue := Value;
end;

function TXMLGoodsReceiptLineItem.Get_MillParty: IXMLParty;
begin
  Result := ChildNodes['MillParty'] as IXMLParty;
end;

function TXMLGoodsReceiptLineItem.Get_GoodsReceiptReference: IXMLGoodsReceiptReferenceList;
begin
  Result := FGoodsReceiptReference;
end;

function TXMLGoodsReceiptLineItem.Get_Product: IXMLProductClass;
begin
  Result := ChildNodes['Product'] as IXMLProductClass;
end;

function TXMLGoodsReceiptLineItem.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLGoodsReceiptLineItem.Get_InformationalQuantity: IXMLInformationalQuantityList;
begin
  Result := FInformationalQuantity;
end;

function TXMLGoodsReceiptLineItem.Get_NumberOfGoodsReceiptPackages: LongWord;
begin
  Result := ChildNodes['NumberOfGoodsReceiptPackages'].NodeValue;
end;

procedure TXMLGoodsReceiptLineItem.Set_NumberOfGoodsReceiptPackages(Value: LongWord);
begin
  ChildNodes['NumberOfGoodsReceiptPackages'].NodeValue := Value;
end;

function TXMLGoodsReceiptLineItem.Get_GoodsReceiptPackage: IXMLGoodsReceiptPackageList;
begin
  Result := FGoodsReceiptPackage;
end;

function TXMLGoodsReceiptLineItem.Get_SafetyAndEnvironmentalInformation: IXMLSafetyAndEnvironmentalInformationClassList;
begin
  Result := FSafetyAndEnvironmentalInformation;
end;

{ TXMLGoodsReceiptPackage }

procedure TXMLGoodsReceiptPackage.AfterConstruction;
begin
  RegisterChildNode('PackageInformation', TXMLPackageInformationClass);
  inherited;
end;

function TXMLGoodsReceiptPackage.Get_GoodsReceiptAcceptance: UnicodeString;
begin
  Result := AttributeNodes['GoodsReceiptAcceptance'].Text;
end;

procedure TXMLGoodsReceiptPackage.Set_GoodsReceiptAcceptance(Value: UnicodeString);
begin
  SetAttribute('GoodsReceiptAcceptance', Value);
end;

function TXMLGoodsReceiptPackage.Get_VarianceType: UnicodeString;
begin
  Result := AttributeNodes['VarianceType'].Text;
end;

procedure TXMLGoodsReceiptPackage.Set_VarianceType(Value: UnicodeString);
begin
  SetAttribute('VarianceType', Value);
end;

function TXMLGoodsReceiptPackage.Get_GoodsReceivedRejectedType: UnicodeString;
begin
  Result := AttributeNodes['GoodsReceivedRejectedType'].Text;
end;

procedure TXMLGoodsReceiptPackage.Set_GoodsReceivedRejectedType(Value: UnicodeString);
begin
  SetAttribute('GoodsReceivedRejectedType', Value);
end;

function TXMLGoodsReceiptPackage.Get_PackageInformation: IXMLPackageInformationClass;
begin
  Result := ChildNodes['PackageInformation'] as IXMLPackageInformationClass;
end;

{ TXMLGoodsReceiptPackageList }

function TXMLGoodsReceiptPackageList.Add: IXMLGoodsReceiptPackage;
begin
  Result := AddItem(-1) as IXMLGoodsReceiptPackage;
end;

function TXMLGoodsReceiptPackageList.Insert(const Index: Integer): IXMLGoodsReceiptPackage;
begin
  Result := AddItem(Index) as IXMLGoodsReceiptPackage;
end;

function TXMLGoodsReceiptPackageList.Get_Item(Index: Integer): IXMLGoodsReceiptPackage;
begin
  Result := List[Index] as IXMLGoodsReceiptPackage;
end;

{ TXMLGoodsReceiptSummary }

procedure TXMLGoodsReceiptSummary.AfterConstruction;
begin
  RegisterChildNode('TotalQuantity', TXMLTotalQuantity);
  RegisterChildNode('TotalInformationalQuantity', TXMLTotalInformationalQuantity);
  RegisterChildNode('TermsAndDisclaimers', TXMLTermsAndDisclaimers);
  FTotalQuantity := CreateCollection(TXMLTotalQuantityList, IXMLTotalQuantity, 'TotalQuantity') as IXMLTotalQuantityList;
  FTotalInformationalQuantity := CreateCollection(TXMLTotalInformationalQuantityList, IXMLTotalInformationalQuantity, 'TotalInformationalQuantity') as IXMLTotalInformationalQuantityList;
  FTermsAndDisclaimers := CreateCollection(TXMLTermsAndDisclaimersList, IXMLTermsAndDisclaimers, 'TermsAndDisclaimers') as IXMLTermsAndDisclaimersList;
  inherited;
end;

function TXMLGoodsReceiptSummary.Get_TotalNumberOfLineItems: LongWord;
begin
  Result := ChildNodes['TotalNumberOfLineItems'].NodeValue;
end;

procedure TXMLGoodsReceiptSummary.Set_TotalNumberOfLineItems(Value: LongWord);
begin
  ChildNodes['TotalNumberOfLineItems'].NodeValue := Value;
end;

function TXMLGoodsReceiptSummary.Get_TotalQuantity: IXMLTotalQuantityList;
begin
  Result := FTotalQuantity;
end;

function TXMLGoodsReceiptSummary.Get_TotalInformationalQuantity: IXMLTotalInformationalQuantityList;
begin
  Result := FTotalInformationalQuantity;
end;

function TXMLGoodsReceiptSummary.Get_TermsAndDisclaimers: IXMLTermsAndDisclaimersList;
begin
  Result := FTermsAndDisclaimers;
end;

{ TXMLMeasurementWithText }

procedure TXMLMeasurementWithText.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  RegisterChildNode('RangeMin', TXMLRangeMin);
  RegisterChildNode('RangeMax', TXMLRangeMax);
  inherited;
end;

function TXMLMeasurementWithText.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

function TXMLMeasurementWithText.Get_RangeMin: IXMLRangeMin;
begin
  Result := ChildNodes['RangeMin'] as IXMLRangeMin;
end;

function TXMLMeasurementWithText.Get_RangeMax: IXMLRangeMax;
begin
  Result := ChildNodes['RangeMax'] as IXMLRangeMax;
end;

function TXMLMeasurementWithText.Get_AdditionalText: UnicodeString;
begin
  Result := ChildNodes['AdditionalText'].Text;
end;

procedure TXMLMeasurementWithText.Set_AdditionalText(Value: UnicodeString);
begin
  ChildNodes['AdditionalText'].NodeValue := Value;
end;

{ TXMLPlanningOutcomeBucket }

procedure TXMLPlanningOutcomeBucket.AfterConstruction;
begin
  RegisterChildNode('TimePeriod', TXMLTimePeriod);
  RegisterChildNode('PlanningOutcome', TXMLPlanningOutcome);
  FPlanningOutcome := CreateCollection(TXMLPlanningOutcomeList, IXMLPlanningOutcome, 'PlanningOutcome') as IXMLPlanningOutcomeList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLPlanningOutcomeBucket.Get_BucketStatusType: UnicodeString;
begin
  Result := AttributeNodes['BucketStatusType'].Text;
end;

procedure TXMLPlanningOutcomeBucket.Set_BucketStatusType(Value: UnicodeString);
begin
  SetAttribute('BucketStatusType', Value);
end;

function TXMLPlanningOutcomeBucket.Get_TimePeriod: IXMLTimePeriod;
begin
  Result := ChildNodes['TimePeriod'] as IXMLTimePeriod;
end;

function TXMLPlanningOutcomeBucket.Get_PlanningOutcome: IXMLPlanningOutcomeList;
begin
  Result := FPlanningOutcome;
end;

function TXMLPlanningOutcomeBucket.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLScaleHouse }

procedure TXMLScaleHouse.AfterConstruction;
begin
  RegisterChildNode('Quantity', TXMLQuantity);
  RegisterChildNode('InformationalQuantity', TXMLInformationalQuantity);
  inherited;
end;

function TXMLScaleHouse.Get_ScaleHouseID: UnicodeString;
begin
  Result := ChildNodes['ScaleHouseID'].Text;
end;

procedure TXMLScaleHouse.Set_ScaleHouseID(Value: UnicodeString);
begin
  ChildNodes['ScaleHouseID'].NodeValue := Value;
end;

function TXMLScaleHouse.Get_ScaleHouseName: UnicodeString;
begin
  Result := ChildNodes['ScaleHouseName'].Text;
end;

procedure TXMLScaleHouse.Set_ScaleHouseName(Value: UnicodeString);
begin
  ChildNodes['ScaleHouseName'].NodeValue := Value;
end;

function TXMLScaleHouse.Get_ScalerID: UnicodeString;
begin
  Result := ChildNodes['ScalerID'].Text;
end;

procedure TXMLScaleHouse.Set_ScalerID(Value: UnicodeString);
begin
  ChildNodes['ScalerID'].NodeValue := Value;
end;

function TXMLScaleHouse.Get_ScalerName: UnicodeString;
begin
  Result := ChildNodes['ScalerName'].Text;
end;

procedure TXMLScaleHouse.Set_ScalerName(Value: UnicodeString);
begin
  ChildNodes['ScalerName'].NodeValue := Value;
end;

function TXMLScaleHouse.Get_Quantity: IXMLQuantity;
begin
  Result := ChildNodes['Quantity'] as IXMLQuantity;
end;

function TXMLScaleHouse.Get_InformationalQuantity: IXMLInformationalQuantity;
begin
  Result := ChildNodes['InformationalQuantity'] as IXMLInformationalQuantity;
end;

{ TXMLShippingInstructionsHeader }

procedure TXMLShippingInstructionsHeader.AfterConstruction;
begin
  RegisterChildNode('ShippingInstructionsInformation', TXMLShippingInstructionsInformation);
  RegisterChildNode('BuyerParty', TXMLParty);
  RegisterChildNode('BillToParty', TXMLParty);
  RegisterChildNode('SupplierParty', TXMLParty);
  RegisterChildNode('OtherParty', TXMLTypedParty);
  RegisterChildNode('SenderParty', TXMLTypedParty);
  RegisterChildNode('ReceiverParty', TXMLTypedParty);
  FOtherParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'OtherParty') as IXMLTypedPartyList;
  FReceiverParty := CreateCollection(TXMLTypedPartyList, IXMLTypedParty, 'ReceiverParty') as IXMLTypedPartyList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  inherited;
end;

function TXMLShippingInstructionsHeader.Get_ShippingInstructionsHeaderStatusType: UnicodeString;
begin
  Result := AttributeNodes['ShippingInstructionsHeaderStatusType'].Text;
end;

procedure TXMLShippingInstructionsHeader.Set_ShippingInstructionsHeaderStatusType(Value: UnicodeString);
begin
  SetAttribute('ShippingInstructionsHeaderStatusType', Value);
end;

function TXMLShippingInstructionsHeader.Get_ShippingInstructionsInformation: IXMLShippingInstructionsInformation;
begin
  Result := ChildNodes['ShippingInstructionsInformation'] as IXMLShippingInstructionsInformation;
end;

function TXMLShippingInstructionsHeader.Get_BuyerParty: IXMLParty;
begin
  Result := ChildNodes['BuyerParty'] as IXMLParty;
end;

function TXMLShippingInstructionsHeader.Get_BillToParty: IXMLParty;
begin
  Result := ChildNodes['BillToParty'] as IXMLParty;
end;

function TXMLShippingInstructionsHeader.Get_SupplierParty: IXMLParty;
begin
  Result := ChildNodes['SupplierParty'] as IXMLParty;
end;

function TXMLShippingInstructionsHeader.Get_OtherParty: IXMLTypedPartyList;
begin
  Result := FOtherParty;
end;

function TXMLShippingInstructionsHeader.Get_SenderParty: IXMLTypedParty;
begin
  Result := ChildNodes['SenderParty'] as IXMLTypedParty;
end;

function TXMLShippingInstructionsHeader.Get_ReceiverParty: IXMLTypedPartyList;
begin
  Result := FReceiverParty;
end;

function TXMLShippingInstructionsHeader.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

{ TXMLShippingInstructionsInformation }

procedure TXMLShippingInstructionsInformation.AfterConstruction;
begin
  RegisterChildNode('ShippingInstructionsIssuedDate', TXMLShippingInstructionsIssuedDate);
  RegisterChildNode('ShippingInstructionsConfirmationIssuedDate', TXMLShippingInstructionsConfirmationIssuedDate);
  RegisterChildNode('ShippingInstructionsReference', TXMLShippingInstructionsReference);
  FShippingInstructionsReference := CreateCollection(TXMLShippingInstructionsReferenceList, IXMLShippingInstructionsReference, 'ShippingInstructionsReference') as IXMLShippingInstructionsReferenceList;
  inherited;
end;

function TXMLShippingInstructionsInformation.Get_ShippingInstructionsNumber: UnicodeString;
begin
  Result := ChildNodes['ShippingInstructionsNumber'].Text;
end;

procedure TXMLShippingInstructionsInformation.Set_ShippingInstructionsNumber(Value: UnicodeString);
begin
  ChildNodes['ShippingInstructionsNumber'].NodeValue := Value;
end;

function TXMLShippingInstructionsInformation.Get_ShippingInstructionsIssuedDate: IXMLShippingInstructionsIssuedDate;
begin
  Result := ChildNodes['ShippingInstructionsIssuedDate'] as IXMLShippingInstructionsIssuedDate;
end;

function TXMLShippingInstructionsInformation.Get_ShippingInstructionsConfirmationIssuedDate: IXMLShippingInstructionsConfirmationIssuedDate;
begin
  Result := ChildNodes['ShippingInstructionsConfirmationIssuedDate'] as IXMLShippingInstructionsConfirmationIssuedDate;
end;

function TXMLShippingInstructionsInformation.Get_TransactionHistoryNumber: LongWord;
begin
  Result := ChildNodes['TransactionHistoryNumber'].NodeValue;
end;

procedure TXMLShippingInstructionsInformation.Set_TransactionHistoryNumber(Value: LongWord);
begin
  ChildNodes['TransactionHistoryNumber'].NodeValue := Value;
end;

function TXMLShippingInstructionsInformation.Get_TransactionHistoryConfirmationNumber: LongWord;
begin
  Result := ChildNodes['TransactionHistoryConfirmationNumber'].NodeValue;
end;

procedure TXMLShippingInstructionsInformation.Set_TransactionHistoryConfirmationNumber(Value: LongWord);
begin
  ChildNodes['TransactionHistoryConfirmationNumber'].NodeValue := Value;
end;

function TXMLShippingInstructionsInformation.Get_ShippingInstructionsReference: IXMLShippingInstructionsReferenceList;
begin
  Result := FShippingInstructionsReference;
end;

{ TXMLShippingInstructionsIssuedDate }

procedure TXMLShippingInstructionsIssuedDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLShippingInstructionsIssuedDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLShippingInstructionsIssuedDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLShippingInstructionsIssuedDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLShippingInstructionsConfirmationIssuedDate }

procedure TXMLShippingInstructionsConfirmationIssuedDate.AfterConstruction;
begin
  RegisterChildNode('Date', TXMLDateBasis);
  inherited;
end;

function TXMLShippingInstructionsConfirmationIssuedDate.Get_Date: IXMLDateBasis;
begin
  Result := ChildNodes['Date'] as IXMLDateBasis;
end;

function TXMLShippingInstructionsConfirmationIssuedDate.Get_Time: UnicodeString;
begin
  Result := ChildNodes['Time'].Text;
end;

procedure TXMLShippingInstructionsConfirmationIssuedDate.Set_Time(Value: UnicodeString);
begin
  ChildNodes['Time'].NodeValue := Value;
end;

{ TXMLShippingInstructionsReference }

function TXMLShippingInstructionsReference.Get_ShippingInstructionsReferenceType: UnicodeString;
begin
  Result := AttributeNodes['ShippingInstructionsReferenceType'].Text;
end;

procedure TXMLShippingInstructionsReference.Set_ShippingInstructionsReferenceType(Value: UnicodeString);
begin
  SetAttribute('ShippingInstructionsReferenceType', Value);
end;

function TXMLShippingInstructionsReference.Get_AssignedBy: UnicodeString;
begin
  Result := AttributeNodes['AssignedBy'].Text;
end;

procedure TXMLShippingInstructionsReference.Set_AssignedBy(Value: UnicodeString);
begin
  SetAttribute('AssignedBy', Value);
end;

{ TXMLShippingInstructionsReferenceList }

function TXMLShippingInstructionsReferenceList.Add: IXMLShippingInstructionsReference;
begin
  Result := AddItem(-1) as IXMLShippingInstructionsReference;
end;

function TXMLShippingInstructionsReferenceList.Insert(const Index: Integer): IXMLShippingInstructionsReference;
begin
  Result := AddItem(Index) as IXMLShippingInstructionsReference;
end;

function TXMLShippingInstructionsReferenceList.Get_Item(Index: Integer): IXMLShippingInstructionsReference;
begin
  Result := List[Index] as IXMLShippingInstructionsReference;
end;

{ TXMLShippingInstructionsLineItemByProduct }

procedure TXMLShippingInstructionsLineItemByProduct.AfterConstruction;
begin
  RegisterChildNode('ShippingInstructionsReference', TXMLShippingInstructionsReference);
  RegisterChildNode('ShipToInformation', TXMLShipToInformation);
  RegisterChildNode('PackagingCharacteristics', TXMLPackagingCharacteristics);
  RegisterChildNode('DocumentReferenceInformation', TXMLDocumentReferenceInformation);
  FShippingInstructionsReference := CreateCollection(TXMLShippingInstructionsReferenceList, IXMLShippingInstructionsReference, 'ShippingInstructionsReference') as IXMLShippingInstructionsReferenceList;
  FShipToInformation := CreateCollection(TXMLShipToInformationList, IXMLShipToInformation, 'ShipToInformation') as IXMLShipToInformationList;
  FPackagingCharacteristics := CreateCollection(TXMLPackagingCharacteristicsList, IXMLPackagingCharacteristics, 'PackagingCharacteristics') as IXMLPackagingCharacteristicsList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  FDocumentReferenceInformation := CreateCollection(TXMLDocumentReferenceInformationList, IXMLDocumentReferenceInformation, 'DocumentReferenceInformation') as IXMLDocumentReferenceInformationList;
  inherited;
end;

function TXMLShippingInstructionsLineItemByProduct.Get_ShippingInstructionsLineItemStatusType: UnicodeString;
begin
  Result := AttributeNodes['ShippingInstructionsLineItemStatusType'].Text;
end;

procedure TXMLShippingInstructionsLineItemByProduct.Set_ShippingInstructionsLineItemStatusType(Value: UnicodeString);
begin
  SetAttribute('ShippingInstructionsLineItemStatusType', Value);
end;

function TXMLShippingInstructionsLineItemByProduct.Get_IsThirdPartyShipment: UnicodeString;
begin
  Result := AttributeNodes['IsThirdPartyShipment'].Text;
end;

procedure TXMLShippingInstructionsLineItemByProduct.Set_IsThirdPartyShipment(Value: UnicodeString);
begin
  SetAttribute('IsThirdPartyShipment', Value);
end;

function TXMLShippingInstructionsLineItemByProduct.Get_ShippingInstructionsLineItemNumber: LongWord;
begin
  Result := ChildNodes['ShippingInstructionsLineItemNumber'].NodeValue;
end;

procedure TXMLShippingInstructionsLineItemByProduct.Set_ShippingInstructionsLineItemNumber(Value: LongWord);
begin
  ChildNodes['ShippingInstructionsLineItemNumber'].NodeValue := Value;
end;

function TXMLShippingInstructionsLineItemByProduct.Get_ShippingInstructionsReference: IXMLShippingInstructionsReferenceList;
begin
  Result := FShippingInstructionsReference;
end;

function TXMLShippingInstructionsLineItemByProduct.Get_ShipToInformation: IXMLShipToInformationList;
begin
  Result := FShipToInformation;
end;

function TXMLShippingInstructionsLineItemByProduct.Get_PackagingCharacteristics: IXMLPackagingCharacteristicsList;
begin
  Result := FPackagingCharacteristics;
end;

function TXMLShippingInstructionsLineItemByProduct.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLShippingInstructionsLineItemByProduct.Get_DocumentReferenceInformation: IXMLDocumentReferenceInformationList;
begin
  Result := FDocumentReferenceInformation;
end;

{ TXMLShipToInformation }

procedure TXMLShipToInformation.AfterConstruction;
begin
  RegisterChildNode('ShipToCharacteristics', TXMLShipToCharacteristics);
  RegisterChildNode('DeliverySchedule', TXMLDeliverySchedule);
  FDeliverySchedule := CreateCollection(TXMLDeliveryScheduleList, IXMLDeliverySchedule, 'DeliverySchedule') as IXMLDeliveryScheduleList;
  inherited;
end;

function TXMLShipToInformation.Get_ShipToCharacteristics: IXMLShipToCharacteristics;
begin
  Result := ChildNodes['ShipToCharacteristics'] as IXMLShipToCharacteristics;
end;

function TXMLShipToInformation.Get_DeliverySchedule: IXMLDeliveryScheduleList;
begin
  Result := FDeliverySchedule;
end;

{ TXMLShipToInformationList }

function TXMLShipToInformationList.Add: IXMLShipToInformation;
begin
  Result := AddItem(-1) as IXMLShipToInformation;
end;

function TXMLShipToInformationList.Insert(const Index: Integer): IXMLShipToInformation;
begin
  Result := AddItem(Index) as IXMLShipToInformation;
end;

function TXMLShipToInformationList.Get_Item(Index: Integer): IXMLShipToInformation;
begin
  Result := List[Index] as IXMLShipToInformation;
end;

{ TXMLShippingInstructionsLineItemByShipTo }

procedure TXMLShippingInstructionsLineItemByShipTo.AfterConstruction;
begin
  RegisterChildNode('ShippingInstructionsReference', TXMLShippingInstructionsReference);
  RegisterChildNode('Product', TXMLProductClass);
  RegisterChildNode('ShippingInstructionsPurchaseOrderLineItem', TXMLShippingInstructionsPurchaseOrderLineItem);
  RegisterChildNode('OtherDate', TXMLOtherDate);
  RegisterChildNode('DeliverySchedule', TXMLDeliverySchedule);
  RegisterChildNode('PackagingCharacteristics', TXMLPackagingCharacteristics);
  RegisterChildNode('DocumentReferenceInformation', TXMLDocumentReferenceInformation);
  FShippingInstructionsReference := CreateCollection(TXMLShippingInstructionsReferenceList, IXMLShippingInstructionsReference, 'ShippingInstructionsReference') as IXMLShippingInstructionsReferenceList;
  FOtherDate := CreateCollection(TXMLOtherDateList, IXMLOtherDate, 'OtherDate') as IXMLOtherDateList;
  FDeliverySchedule := CreateCollection(TXMLDeliveryScheduleList, IXMLDeliverySchedule, 'DeliverySchedule') as IXMLDeliveryScheduleList;
  FPackagingCharacteristics := CreateCollection(TXMLPackagingCharacteristicsList, IXMLPackagingCharacteristics, 'PackagingCharacteristics') as IXMLPackagingCharacteristicsList;
  FAdditionalText := CreateCollection(TXMLS255List, IXMLNode, 'AdditionalText') as IXMLS255List;
  FDocumentReferenceInformation := CreateCollection(TXMLDocumentReferenceInformationList, IXMLDocumentReferenceInformation, 'DocumentReferenceInformation') as IXMLDocumentReferenceInformationList;
  inherited;
end;

function TXMLShippingInstructionsLineItemByShipTo.Get_ShippingInstructionsLineItemStatusType: UnicodeString;
begin
  Result := AttributeNodes['ShippingInstructionsLineItemStatusType'].Text;
end;

procedure TXMLShippingInstructionsLineItemByShipTo.Set_ShippingInstructionsLineItemStatusType(Value: UnicodeString);
begin
  SetAttribute('ShippingInstructionsLineItemStatusType', Value);
end;

function TXMLShippingInstructionsLineItemByShipTo.Get_ShippingInstructionsLineItemNumber: LongWord;
begin
  Result := ChildNodes['ShippingInstructionsLineItemNumber'].NodeValue;
end;

procedure TXMLShippingInstructionsLineItemByShipTo.Set_ShippingInstructionsLineItemNumber(Value: LongWord);
begin
  ChildNodes['ShippingInstructionsLineItemNumber'].NodeValue := Value;
end;

function TXMLShippingInstructionsLineItemByShipTo.Get_ShippingInstructionsReference: IXMLShippingInstructionsReferenceList;
begin
  Result := FShippingInstructionsReference;
end;

function TXMLShippingInstructionsLineItemByShipTo.Get_Product: IXMLProductClass;
begin
  Result := ChildNodes['Product'] as IXMLProductClass;
end;

function TXMLShippingInstructionsLineItemByShipTo.Get_ShippingInstructionsPurchaseOrderLineItem: IXMLShippingInstructionsPurchaseOrderLineItem;
begin
  Result := ChildNodes['ShippingInstructionsPurchaseOrderLineItem'] as IXMLShippingInstructionsPurchaseOrderLineItem;
end;

function TXMLShippingInstructionsLineItemByShipTo.Get_OtherDate: IXMLOtherDateList;
begin
  Result := FOtherDate;
end;

function TXMLShippingInstructionsLineItemByShipTo.Get_DeliverySchedule: IXMLDeliveryScheduleList;
begin
  Result := FDeliverySchedule;
end;

function TXMLShippingInstructionsLineItemByShipTo.Get_PackagingCharacteristics: IXMLPackagingCharacteristicsList;
begin
  Result := FPackagingCharacteristics;
end;

function TXMLShippingInstructionsLineItemByShipTo.Get_AdditionalText: IXMLS255List;
begin
  Result := FAdditionalText;
end;

function TXMLShippingInstructionsLineItemByShipTo.Get_DocumentReferenceInformation: IXMLDocumentReferenceInformationList;
begin
  Result := FDocumentReferenceInformation;
end;

{ TXMLShippingInstructionsPurchaseOrderLineItem }

procedure TXMLShippingInstructionsPurchaseOrderLineItem.AfterConstruction;
begin
  RegisterChildNode('PurchaseOrderInformation', TXMLPurchaseOrderInformation);
  RegisterChildNode('PackageIdentifier', TXMLPackageIdentifier);
  RegisterChildNode('ProductIdentification', TXMLProductIdentification);
  RegisterChildNode('Classification', TXMLClassification);
  FProductIdentification := CreateCollection(TXMLProductIdentificationList, IXMLProductIdentification, 'ProductIdentification') as IXMLProductIdentificationList;
  FClassification := CreateCollection(TXMLClassificationList, IXMLClassification, 'Classification') as IXMLClassificationList;
  inherited;
end;

function TXMLShippingInstructionsPurchaseOrderLineItem.Get_PurchaseOrderLineItemNumber: LongWord;
begin
  Result := ChildNodes['PurchaseOrderLineItemNumber'].NodeValue;
end;

procedure TXMLShippingInstructionsPurchaseOrderLineItem.Set_PurchaseOrderLineItemNumber(Value: LongWord);
begin
  ChildNodes['PurchaseOrderLineItemNumber'].NodeValue := Value;
end;

function TXMLShippingInstructionsPurchaseOrderLineItem.Get_PurchaseOrderInformation: IXMLPurchaseOrderInformation;
begin
  Result := ChildNodes['PurchaseOrderInformation'] as IXMLPurchaseOrderInformation;
end;

function TXMLShippingInstructionsPurchaseOrderLineItem.Get_PackageIdentifier: IXMLPackageIdentifier;
begin
  Result := ChildNodes['PackageIdentifier'] as IXMLPackageIdentifier;
end;

function TXMLShippingInstructionsPurchaseOrderLineItem.Get_ProductIdentification: IXMLProductIdentificationList;
begin
  Result := FProductIdentification;
end;

function TXMLShippingInstructionsPurchaseOrderLineItem.Get_Classification: IXMLClassificationList;
begin
  Result := FClassification;
end;

{ TXMLPackageIdentifier }

procedure TXMLPackageIdentifier.AfterConstruction;
begin
  RegisterChildNode('Identifier', TXMLIdentifierS60);
  inherited;
end;

function TXMLPackageIdentifier.Get_Identifier: IXMLIdentifierS60;
begin
  Result := ChildNodes['Identifier'] as IXMLIdentifierS60;
end;

{ TXMLShippingInstructionsSummary }

procedure TXMLShippingInstructionsSummary.AfterConstruction;
begin
  RegisterChildNode('TotalQuantity', TXMLTotalQuantity);
  RegisterChildNode('TotalInformationalQuantity', TXMLTotalInformationalQuantity);
  RegisterChildNode('TermsAndDisclaimers', TXMLTermsAndDisclaimers);
  FTotalQuantity := CreateCollection(TXMLTotalQuantityList, IXMLTotalQuantity, 'TotalQuantity') as IXMLTotalQuantityList;
  FTotalInformationalQuantity := CreateCollection(TXMLTotalInformationalQuantityList, IXMLTotalInformationalQuantity, 'TotalInformationalQuantity') as IXMLTotalInformationalQuantityList;
  FTermsAndDisclaimers := CreateCollection(TXMLTermsAndDisclaimersList, IXMLTermsAndDisclaimers, 'TermsAndDisclaimers') as IXMLTermsAndDisclaimersList;
  inherited;
end;

function TXMLShippingInstructionsSummary.Get_TotalNumberOfLineItems: LongWord;
begin
  Result := ChildNodes['TotalNumberOfLineItems'].NodeValue;
end;

procedure TXMLShippingInstructionsSummary.Set_TotalNumberOfLineItems(Value: LongWord);
begin
  ChildNodes['TotalNumberOfLineItems'].NodeValue := Value;
end;

function TXMLShippingInstructionsSummary.Get_TotalQuantity: IXMLTotalQuantityList;
begin
  Result := FTotalQuantity;
end;

function TXMLShippingInstructionsSummary.Get_TotalInformationalQuantity: IXMLTotalInformationalQuantityList;
begin
  Result := FTotalInformationalQuantity;
end;

function TXMLShippingInstructionsSummary.Get_TermsAndDisclaimers: IXMLTermsAndDisclaimersList;
begin
  Result := FTermsAndDisclaimers;
end;

{ TXMLTrimSize }

procedure TXMLTrimSize.AfterConstruction;
begin
  RegisterChildNode('Length', TXMLMeasurement);
  RegisterChildNode('Width', TXMLMeasurement);
  RegisterChildNode('BookBlockBulk', TXMLBookBlockBulk);
  RegisterChildNode('SpineSize', TXMLSpineSize);
  inherited;
end;

function TXMLTrimSize.Get_Length: IXMLMeasurement;
begin
  Result := ChildNodes['Length'] as IXMLMeasurement;
end;

function TXMLTrimSize.Get_Width: IXMLMeasurement;
begin
  Result := ChildNodes['Width'] as IXMLMeasurement;
end;

function TXMLTrimSize.Get_BookBlockBulk: IXMLBookBlockBulk;
begin
  Result := ChildNodes['BookBlockBulk'] as IXMLBookBlockBulk;
end;

function TXMLTrimSize.Get_SpineSize: IXMLSpineSize;
begin
  Result := ChildNodes['SpineSize'] as IXMLSpineSize;
end;

{ TXMLBookBlockBulk }

procedure TXMLBookBlockBulk.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  inherited;
end;

function TXMLBookBlockBulk.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

{ TXMLSpineSize }

procedure TXMLSpineSize.AfterConstruction;
begin
  RegisterChildNode('Value', TXMLValue);
  inherited;
end;

function TXMLSpineSize.Get_Value: IXMLValue;
begin
  Result := ChildNodes['Value'] as IXMLValue;
end;

{ TXMLPlywoodOSBSpeciesTypeList }

function TXMLPlywoodOSBSpeciesTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLPlywoodOSBSpeciesTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLPlywoodOSBSpeciesTypeList.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLS60List }

function TXMLS60List.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLS60List.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLS60List.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLS72List }

function TXMLS72List.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLS72List.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLS72List.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLS20List }

function TXMLS20List.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLS20List.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLS20List.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLNni1List }

function TXMLNni1List.Add(const Value: LongWord): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLNni1List.Insert(const Index: Integer; const Value: LongWord): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLNni1List.Get_Item(Index: Integer): LongWord;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLReamTypeList }

function TXMLReamTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLReamTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLReamTypeList.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLRoadAvailabilityTypeList }

function TXMLRoadAvailabilityTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLRoadAvailabilityTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLRoadAvailabilityTypeList.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLGlueExposureIDTypeList }

function TXMLGlueExposureIDTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLGlueExposureIDTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLGlueExposureIDTypeList.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLBooleanList }

function TXMLBooleanList.Add(const Value: Boolean): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLBooleanList.Insert(const Index: Integer; const Value: Boolean): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLBooleanList.Get_Item(Index: Integer): Boolean;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLS30List }

function TXMLS30List.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLS30List.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLS30List.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLS255List }

function TXMLS255List.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLS255List.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLS255List.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

end.