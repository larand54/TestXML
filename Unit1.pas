unit Unit1;

interface
uses Xml.xmldom, Xml.XMLDoc, Xml.XMLIntf;
type
  IXMLInvoiceDocument = interface;
  IXMLInvoiceDocument = interface(IXMLNode)
    ['{45C18F63-21C7-4785-9182-B72AA887507E}']
    { Property Accessors }
(*
      function Get_DocumentName: UnicodeString;
      function Get_DocumentType: UnicodeString;
      function Get_OtherDocumentName: UnicodeString;
      function Get_OtherDocumentType: UnicodeString;
      function Get_DocumentNumber: UnicodeString;
      function Get_DocumentVersionNumber: UnicodeString;
      function Get_DocumentDate: IXMLDocumentDate;
      function Get_TransactionHistoryNumber: LongWord;
      function Get_DocumentReference: IXMLDocumentReferenceList;
      procedure Set_DocumentName(Value: UnicodeString);
      procedure Set_DocumentType(Value: UnicodeString);
      procedure Set_OtherDocumentName(Value: UnicodeString);
      procedure Set_OtherDocumentType(Value: UnicodeString);
      procedure Set_DocumentNumber(Value: UnicodeString);
      procedure Set_DocumentVersionNumber(Value: UnicodeString);
      procedure Set_TransactionHistoryNumber(Value: LongWord);
      { Methods & Properties }
      property DocumentName: UnicodeString read Get_DocumentName write Set_DocumentName;
      property DocumentType: UnicodeString read Get_DocumentType write Set_DocumentType;
      property OtherDocumentName: UnicodeString read Get_OtherDocumentName write Set_OtherDocumentName;
      property OtherDocumentType: UnicodeString read Get_OtherDocumentType write Set_OtherDocumentType;
      property DocumentNumber: UnicodeString read Get_DocumentNumber write Set_DocumentNumber;
      property DocumentVersionNumber: UnicodeString read Get_DocumentVersionNumber write Set_DocumentVersionNumber;
      property DocumentDate: IXMLDocumentDate read Get_DocumentDate;
      property TransactionHistoryNumber: LongWord read Get_TransactionHistoryNumber write Set_TransactionHistoryNumber;
      property DocumentReference: IXMLDocumentReferenceList read Get_DocumentReference;

*)  end;

{ IXMLInvoiceWood }

  IXMLInvoiceWood = interface(IXMLNode)
    ['{0BCB4A29-D4E0-4BAA-BCCE-BAFB5E96ABB5}']
    { Property Accessors }
(*
      function Get_InvoiceType: UnicodeString;
      function Get_InvoiceContextType: UnicodeString;
      function Get_Reissued: UnicodeString;
      function Get_Language: UnicodeString;
      function Get_InvoiceWoodHeader: IXMLInvoiceWoodHeader;
      function Get_InvoiceShipment: IXMLInvoiceShipmentList;
      function Get_MonetaryAdjustment: IXMLMonetaryAdjustmentList;
      function Get_InvoiceWoodSummary: IXMLInvoiceWoodSummary;
      procedure Set_InvoiceType(Value: UnicodeString);
      procedure Set_InvoiceContextType(Value: UnicodeString);
      procedure Set_Reissued(Value: UnicodeString);
      procedure Set_Language(Value: UnicodeString);
      { Methods & Properties }
      property InvoiceType: UnicodeString read Get_InvoiceType write Set_InvoiceType;
      property InvoiceContextType: UnicodeString read Get_InvoiceContextType write Set_InvoiceContextType;
      property Reissued: UnicodeString read Get_Reissued write Set_Reissued;
      property Language: UnicodeString read Get_Language write Set_Language;
      property InvoiceWoodHeader: IXMLInvoiceWoodHeader read Get_InvoiceWoodHeader;
      property InvoiceShipment: IXMLInvoiceShipmentList read Get_InvoiceShipment;
      property MonetaryAdjustment: IXMLMonetaryAdjustmentList read Get_MonetaryAdjustment;
      property InvoiceWoodSummary: IXMLInvoiceWoodSummary read Get_InvoiceWoodSummary;

*)  end;




  TXMLInvoiceWood = class(TXMLNode, IXMLInvoiceWood)
(*
    private
      FInvoiceShipment: IXMLInvoiceShipmentList;
      FMonetaryAdjustment: IXMLMonetaryAdjustmentList;
    protected
      { IXMLInvoiceWood }
      function Get_InvoiceType: UnicodeString;
      function Get_InvoiceContextType: UnicodeString;
      function Get_Reissued: UnicodeString;
      function Get_Language: UnicodeString;
      function Get_InvoiceWoodHeader: IXMLInvoiceWoodHeader;
      function Get_InvoiceShipment: IXMLInvoiceShipmentList;
      function Get_MonetaryAdjustment: IXMLMonetaryAdjustmentList;
      function Get_InvoiceWoodSummary: IXMLInvoiceWoodSummary;
      procedure Set_InvoiceType(Value: UnicodeString);
      procedure Set_InvoiceContextType(Value: UnicodeString);
      procedure Set_Reissued(Value: UnicodeString);
      procedure Set_Language(Value: UnicodeString);
    public
      procedure AfterConstruction; override;
*)
  end;

function GetInvoiceWood(Doc: IXMLInvoiceDocument): IXMLInvoiceWood;
const
  TargetNamespace = '';
implementation
function GetInvoiceWood(Doc: IXMLInvoiceDocument): IXMLInvoiceWood;
begin
  Result := Doc.GetDocBinding('InvoiceWood', TXMLInvoiceWood, TargetNamespace) as IXMLInvoiceWood;
end;
{ TXMLInvoiceWood }


end.
