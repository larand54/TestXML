unit uTestIWv2r31;

interface
uses Xml.xmldom, Xml.XMLDoc, Xml.XMLIntf;

type

{ Forward Decls }

  IXMLInvoiceWood = interface;
  IXMLInvoiceWoodHeader = interface;
  IXMLInvoiceReference = interface;
  IXMLInvoiceReferenceList = interface;

{ IXMLInvoiceWood }

  IXMLInvoiceWood = interface(IXMLNode)
    ['{0BCB4A29-D4E0-4BAA-BCCE-BAFB5E96ABB5}']
    { Property Accessors }
    function Get_InvoiceType: UnicodeString;
    procedure Set_InvoiceType(Value: UnicodeString);
    function Get_InvoiceWoodHeader: IXMLInvoiceWoodHeader;
    { Methods & Properties }
    property InvoiceType: UnicodeString read Get_InvoiceType write Set_InvoiceType;
    property InvoiceWoodHeader: IXMLInvoiceWoodHeader read Get_InvoiceWoodHeader;
  end;
{ IXMLInvoiceWoodHeader }

  IXMLInvoiceWoodHeader = interface(IXMLNode)
    ['{EBD1B5BE-710C-4E40-B4B6-5060D5E3A9D2}']
    { Property Accessors }
    function Get_InvoiceNumber: UnicodeString;
    function Get_InvoiceReference: IXMLInvoiceReferenceList;
    procedure Set_InvoiceNumber(Value: UnicodeString);
    { Methods & Properties }
    property InvoiceNumber: UnicodeString read Get_InvoiceNumber write Set_InvoiceNumber;
    property InvoiceReference: IXMLInvoiceReferenceList read Get_InvoiceReference;
  end;
{ IXMLInvoiceReference }

  IXMLInvoiceReference = interface(IXMLNode)
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

  IXMLInvoiceReferenceList = interface(IXMLNodeCollection)
    ['{BABABC39-EB29-46F4-AFFA-8DDD3539E2D8}']
    { Methods & Properties }
    function Add: IXMLInvoiceReference;
    function Insert(const Index: Integer): IXMLInvoiceReference;

    function Get_Item(Index: Integer): IXMLInvoiceReference;
    property Items[Index: Integer]: IXMLInvoiceReference read Get_Item; default;
  end;

{ Forward Decls }

  TXMLInvoiceWood = class;
  TXMLInvoiceWoodHeader = class;
  TXMLInvoiceReference = class;
  TXMLInvoiceReferenceList = class;

{ TXMLInvoiceWood }

  TXMLInvoiceWood = class(TXMLNode, IXMLInvoiceWood)
  private
  protected
    { IXMLInvoiceWood }
    function Get_InvoiceType: UnicodeString;
    function Get_InvoiceWoodHeader: IXMLInvoiceWoodHeader;
    procedure Set_InvoiceType(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInvoiceWoodHeader }

  TXMLInvoiceWoodHeader = class(TXMLNode, IXMLInvoiceWoodHeader)
  private
    FInvoiceReference: IXMLInvoiceReferenceList;
  protected
    { IXMLInvoiceWoodHeader }
    function Get_InvoiceNumber: UnicodeString;
    function Get_InvoiceReference: IXMLInvoiceReferenceList;
    procedure Set_InvoiceNumber(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLInvoiceReference }

  TXMLInvoiceReference = class(TXMLNode, IXMLInvoiceReference)
  protected
    { IXMLInvoiceReference }
    function Get_InvoiceReferenceType: UnicodeString;
    function Get_AssignedBy: UnicodeString;
    procedure Set_InvoiceReferenceType(Value: UnicodeString);
    procedure Set_AssignedBy(Value: UnicodeString);
  end;

{ TXMLInvoiceReferenceList }

  TXMLInvoiceReferenceList = class(TXMLNodeCollection, IXMLInvoiceReferenceList)
  protected
    { IXMLInvoiceReferenceList }
    function Add: IXMLInvoiceReference;
    function Insert(const Index: Integer): IXMLInvoiceReference;

    function Get_Item(Index: Integer): IXMLInvoiceReference;
  end;


{ Global Functions }

function GetInvoiceWood(Doc: IXMLDocument): IXMLInvoiceWood;
function LoadInvoiceWood(const FileName: string): IXMLInvoiceWood;
function NewInvoiceWood: IXMLInvoiceWood;

const
  TargetNamespace = '';


implementation
uses System.Variants, Xml.xmlutil;

{ Global Functions }

function GetInvoiceWood(Doc: IXMLDocument): IXMLInvoiceWood;
begin
  Result := Doc.GetDocBinding('InvoiceWood', TXMLInvoiceWood, TargetNamespace) as IXMLInvoiceWood;
end;

function LoadInvoiceWood(const FileName: string): IXMLInvoiceWood;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('InvoiceWood', TXMLInvoiceWood, TargetNamespace) as IXMLInvoiceWood;
end;

function NewInvoiceWood: IXMLInvoiceWood;
begin
  Result := NewXMLDocument.GetDocBinding('InvoiceWood', TXMLInvoiceWood, TargetNamespace) as IXMLInvoiceWood;
end;

{ TXMLInvoiceWood }

procedure TXMLInvoiceWood.AfterConstruction;
begin
  RegisterChildNode('InvoiceWoodHeader', TXMLInvoiceWoodHeader);
  inherited;
end;

function TXMLInvoiceWood.Get_InvoiceType: UnicodeString;
begin
  Result := AttributeNodes['InvoiceType'].Text;
end;

function TXMLInvoiceWood.Get_InvoiceWoodHeader: IXMLInvoiceWoodHeader;
begin
  Result := ChildNodes['InvoiceWoodHeader'] as IXMLInvoiceWoodHeader;
end;


procedure TXMLInvoiceWood.Set_InvoiceType(Value: UnicodeString);
begin
  SetAttribute('InvoiceType', Value);
end;

{ TXMLInvoiceWoodHeader }

procedure TXMLInvoiceWoodHeader.AfterConstruction;
begin
  RegisterChildNode('InvoiceReference', TXMLInvoiceReference);
  FInvoiceReference := CreateCollection(TXMLInvoiceReferenceList, IXMLInvoiceReference, 'InvoiceReference') as IXMLInvoiceReferenceList;
  inherited;
end;

function TXMLInvoiceWoodHeader.Get_InvoiceNumber: UnicodeString;
begin
  Result := ChildNodes['InvoiceNumber'].Text;
end;

procedure TXMLInvoiceWoodHeader.Set_InvoiceNumber(Value: UnicodeString);
begin
  ChildNodes['InvoiceNumber'].NodeValue := Value;
end;

function TXMLInvoiceWoodHeader.Get_InvoiceReference: IXMLInvoiceReferenceList;
begin
  Result := FInvoiceReference;
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

end.
