unit frmMainTestXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls
  ,   InvoiceWoodV2R31, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Datasnap.Xmlxform
  , IInvoiceInterfaces
  , uInvoiceClasses
  , udmInvoicedata, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client
;

type
  TForm1 = class(TForm)
    btnCreateInvoiceXML: TButton;
    mmo1: TMemo;
    btnTest2: TButton;
    btnGetInvoicenumbers: TButton;
    FDQuery1: TFDQuery;
    ds1: TDataSource;
    cbb1: TComboBox;
    btnCreateXML: TButton;
    procedure btnCreateInvoiceXMLClick(Sender: TObject);
    procedure btnTest2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGetInvoicenumbersClick(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btnCreateXMLClick(Sender: TObject);
  private
    { Private declarations }
     fXMLInvoice: IXMLInvoiceWood;
     fInvoicedata: TCMInvoice;
     fInv: IXMLInvoiceWood;
    function GetInternalInvoiceNoFromInvoiceNo(const pmcInvNo: integer): integer;
    function createInternalInvoiceObject(const pmcIntInvNo): ICMInvoice;
//     function setupDBConnection: boolean;
  public
    { Public declarations }
    function createInvoiceXML(const pmcINvNo: integer): boolean;
  end;


var
  Form1: TForm1;

implementation

var
  inv: IXMLInvoiceWood;
const
  XMLFile = 'TestInvoiceFile.xml';

{$R *.dfm}
procedure DeleteEmptyNode(InNode: IXMLNode);
var
  I, J: Integer;
  bEmpty: Boolean;
begin
  if InNode = nil then Exit;
  if InNode.ParentNode = nil then Exit;

  for i := InNode.ChildNodes.Count - 1 Downto 0  do
    DeleteEmptyNode(InNode.ChildNodes[i]);

  if InNode.ChildNodes.Count <= 0 then
  begin
    if InNode.Text = '' then
    begin
      bEmpty := True;
      for i := 0 to InNode.AttributeNodes.Count - 1 do
      begin
        if InNode.AttributeNodes.Nodes[i].Text <> '' then
          bEmpty := False
      end;
      if bEmpty then
        InNode.ParentNode.ChildNodes.Delete(InNode.ParentNode.ChildNodes.IndexOf(InNode));
    end;
  end
  else

end;

function doSaveXML(ClearEmpty: Boolean = False): Boolean;
begin
  Result := False;
  if ClearEmpty then
    DeleteEmptyNode(Inv);
  Inv.OwnerDocument.SaveToFile(inv.OwnerDocument.FileName);
  Result := True;
end;

function doClearEmptyNode: Boolean;
begin
  Result := doSaveXML(True);
end;

function DoCreateEmptyInvoiceFile: Boolean;
var
  sl: TStringList;
begin
  Result := False;
  sl := TStringList.Create;
  try
//    sl.Text := '<?xml version="1.0" encoding="ISO-8859-1"?><InvoiceWood />';
//    sl.add('<?xml version="1.0" encoding="UTF-8"?><?xml-stylesheet href="InvoiceWoodV2R31_Build20081207.xsl" type="text/xsl"?>');
    sl.add('<InvoiceWood xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" InvoiceType="Invoice" xsi:noNamespaceSchemaLocation="InvoiceWoodV2R31.xsd"/>');
    sl.SaveToFile(XMLFile);
    Result := True;
  finally
    sl.Free;
  end;

end;

procedure TForm1.btnCreateXMLClick(Sender: TObject);
var
  intInvno: integer;
  Invoice: ICMInvoice;
begin
// First get the internal invoice number by choice
  intInvNo := GetInternalInvoiceNoFromInvoiceNo(integer(cbb1.Items.Objects[cbb1.itemIndex]));

  if intInvNo > 0  then begin
    Invoice := createInternalInvoiceObject(intInvNo);
  end;
end;

procedure TForm1.btnGetInvoicenumbersClick(Sender: TObject);
var
  invoiceNo
  , InternalInvoiceNo: integer;
  name: string;
begin
  FDQuery1.ParamByName('name').AsString := 'alm';
  FDQuery1.Open;
  FDQuery1.First;
  cbb1.Text := FDQuery1.FieldByName('CustomerName').AsString;
  while not FDQuery1.EOF do begin
    invoiceNo := FDQuery1.FieldByName('InvoiceNo').AsInteger;
    name := FDQuery1.FieldByName('CustomerName').AsString;
    cbb1.Items.AddPair(intToStr(InvoiceNo), name, TObject(InvoiceNo));
    FDQuery1.Next;
  end;
end;

procedure TForm1.btnTest2Click(Sender: TObject);
var
  iXml: IDOMDocument;
  iRoot, iNode, iNode2, iChild, iAttribute: IDOMNode;
  XMLDoc: TXMLDocument;
begin
  // empty the document
  XMLDoc := TXMLDocument.Create(nil);
  XMLDoc.Active := False;
  XMLDoc.XML.Text := '';
  XMLDoc.Active := True;

  // root
  iXml := XmlDoc.DOMDocument;
  iRoot := iXml.appendChild (iXml.createElement ('xml'));
  // node "test"
  iNode := iRoot.appendChild (iXml.createElement ('test'));
  iNode.appendChild (iXml.createElement ('test2'));
  iChild := iNode.appendChild (iXml.createElement ('test3'));
  iChild.appendChild (iXml.createTextNode('simple value'));
  iNode.insertBefore (iXml.createElement ('test4'), iChild);

  // node replication
  iNode2 := iNode.cloneNode (True);
  iRoot.appendChild (iNode2);

  // add an attribute
  iAttribute := iXml.createAttribute ('color');
  iAttribute.nodeValue := 'red';
  iNode2.attributes.setNamedItem (iAttribute);

  // show XML in memo
  Mmo1.Lines.Text := FormatXMLData (XMLDoc.XML.Text);

end;

procedure TForm1.cbb1Change(Sender: TObject);
begin
  cbb1.Text := cbb1.items[cbb1.ItemIndex];
end;

function TForm1.createInternalInvoiceObject(const pmcIntInvNo): ICMInvoice;
begin

end;

function TForm1.createInvoiceXML(const pmcINvNo: integer): boolean;
var
  intInvNo: integer;
begin
  IntInvNo := GetInternalInvoiceNoFromInvoiceNo(pmcInvno);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  dmXMLInvoice.con1.Close;
end;

function TForm1.GetInternalInvoiceNoFromInvoiceNo(
  const pmcInvNo: integer): integer;
begin
  dmXMLInvoice.qry_InternalFromInvno.Close;
  dmXMLInvoice.qry_InternalFromInvno.ParamByName('InvNo').AsInteger := pmcInvNo;
  dmXMLInvoice.qry_InternalFromInvno.Open;
  if dmXMLInvoice.qry_InternalFromInvno.EOF then
    result := 0
  else
    result := dmXMLInvoice.qry_InternalFromInvno.FieldByName('InternalInvoiceNo').AsInteger;

end;

procedure TForm1.btnCreateInvoiceXMLClick(Sender: TObject);
var
  sFileName: string;
  ref: IXMLInvoiceReference;
  refList: IXMLInvoiceReferenceList;
  btp, stp: IXMLParty;
  btpId: IXMLPartyIdentifier;
  ISH: IXMLInvoiceShipment;
  i: integer;

  procedure SetMessageDate(aInv: IXMLInvoiceWood; MsgDate: TDateTime);
  var
    wY, wM, wD: word;

  begin
    DecodeDate(MsgDate, wY, wM, wD);
    with aInv.InvoiceWoodHeader.InvoiceDate.Date do
    begin
      Year := IntToStr(wY);
      Month := wM;
      Day := wD;
    end;
  end;


  procedure setReference(const pmcInv: IXMLInvoiceWood; const pmcAssignedBy, pmcRefName, pmcReference: string);
  var
    Ref: IXMLInvoiceReference;
  begin
    Ref := pmcInv.InvoiceWoodHeader.InvoiceReference.Add;
    Ref.SetAttributeNS('AssignedBy', '', pmcAssignedBy);
    Ref.SetAttributeNS('InvoiceReferenceType', '', pmcRefName);
    Ref.nodeValue := pmcReference;
  end;

//  procedure setBillToParty(const pmcInv: IXMLInvoiceWood; const pmcPartyAddr: ICMNameAddress);
  procedure setBillToParty(const pmcInv: IXMLInvoiceWood; const pmcAssignedBy, pmcRefName, pmcReference: string);
  var
    btb: IXMLParty;
    btbId: IXMLPartyIdentifier;
    btbAd: IXMLNameAddress;
  begin
    btb := pmcInv.InvoiceWoodHeader.BillToParty;
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType','','AssignedBySeller');
    btbId.nodeValue :='498';
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType','','VATIdentificationNumber');
    btbId.nodeValue :='556645-6215';

    btbAd := btb.NameAddress;
    btbAd.Name1 := 'Byggmax Norge';
    btbAd.Name2 := 'Peter Lyvestand';
    btbAd.Address1 := 'Box 6063';
    btbAd.PostalCode.Text := '171 06';
    btbAd.City := 'Solna';
    btbAd.Country.ISOCountryCode := 'FI';
  end;
{
        <BillToParty>
            <PartyIdentifier PartyIdentifierType="AssignedBySeller">100222</PartyIdentifier>
            <PartyIdentifier PartyIdentifierType="VATIdentificationNumber">IT00549301208</PartyIdentifier>
            <NameAddress>
                <Name1>DE LEGNO</Name1>
                <Address1>VIA DON LUIGI 10</Address1>
                <City>MILANO</City>
                <PostalCode>20026</PostalCode>
                <Country ISOCountryCode="IT">IT</Country>
            </NameAddress>
        </BillToParty>
}
  procedure setSupplierParty(const pmcInv: IXMLInvoiceWood; const pmcAssignedBy, pmcRefName, pmcReference: string);
  var
    btb: IXMLParty;
    btbId: IXMLPartyIdentifier;
    btbAd: IXMLNameAddress;
  begin
    btb := pmcInv.InvoiceWoodHeader.SupplierParty;
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType','','AssignedBySeller');
    btbId.nodeValue :='498';
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType','','VATIdentificationNumber');
    btbId.nodeValue :='556645-6215';

    btbAd := btb.NameAddress;
    btbAd.Name1 := 'Byggmax Norge';
    btbAd.Name2 := 'Peter Lyvestand';
    btbAd.Address1 := 'Box 6063';
    btbAd.PostalCode.Text := '171 06';
    btbAd.City := 'Solna';
    btbAd.Country.ISOCountryCode := 'FI';
  end;

  procedure setBuyerParty(const pmcInv: IXMLInvoiceWood; const pmcAssignedBy, pmcRefName, pmcReference: string);
  var
    btb: IXMLParty;
    btbId: IXMLPartyIdentifier;
    btbAd: IXMLNameAddress;
  begin
    btb := pmcInv.InvoiceWoodHeader.BuyerParty;
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType','','AssignedBySeller');
    btbId.nodeValue :='498';
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType','','VATIdentificationNumber');
    btbId.nodeValue :='556645-6215';

    btbAd := btb.NameAddress;
    btbAd.Name1 := 'Byggmax Norge';
    btbAd.Name2 := 'Peter Lyvestand';
    btbAd.Address1 := 'Box 6063';
    btbAd.PostalCode.Text := '171 06';
    btbAd.City := 'Solna';
    btbAd.Country.ISOCountryCode := 'FI';
  end;

  procedure setShipmentCharacteristics(const pmcInv: IXMLInvoiceWood; const pmcAssignedBy, pmcRefName, pmcReference: string);
  var
    btb: IXMLParty;
    btbId: IXMLPartyIdentifier;
    btbAd: IXMLNameAddress;
    ShipToChar: IXMLShipToCharacteristics;
  begin
    ShipToChar := pmcInv.InvoiceWoodHeader.ShipToCharacteristics;
    ShipToChar.ShipToParty.SetAttributeNS('PartyType','','PlaceFinalDestination');
    btb := pmcInv.InvoiceWoodHeader.ShipToCharacteristics.ShipToParty;
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType','','AssignedBySeller');
    btbId.nodeValue :='498';
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType','','VATIdentificationNumber');
    btbId.nodeValue :='556645-6215';

    btbAd := btb.NameAddress;
    btbAd.Name1 := 'Byggmax Norge';
    btbAd.Name2 := 'Peter Lyvestand';
    btbAd.Address1 := 'Box 6063';
    btbAd.PostalCode.Text := '171 06';
    btbAd.City := 'Solna';
    btbAd.Country.ISOCountryCode := 'FI';
    ShipToChar.TermsOfDelivery.IncotermsLocation.setAttributeNS('Incoterms','','CIP');
    ShipToChar.TermsOfDelivery.IncotermsLocation.nodeValue := 'Oslo';
  end;

  procedure setSenderParty(const pmcInv: IXMLInvoiceWood; const pmcAssignedBy, pmcRefName, pmcReference: string);
  var
    btb: IXMLParty;
    btbId: IXMLPartyIdentifier;
    btbAd: IXMLNameAddress;
  begin
    btb := pmcInv.InvoiceWoodHeader.SenderParty;
    btb.SetAttributeNS('PartyType','','Seller');
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType','','AssignedBySeller');
    btbId.nodeValue :='498';
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType','','VATIdentificationNumber');
    btbId.nodeValue :='556645-6215';

    btbAd := btb.NameAddress;
    btbAd.Name1 := 'Byggmax Norge';
    btbAd.Name2 := 'Peter Lyvestand';
    btbAd.Address1 := 'Box 6063';
    btbAd.PostalCode.Text := '171 06';
    btbAd.City := 'Solna';
    btbAd.Country.SetAttributeNS('ISOCountrycode','','FI');
    btbAd.Country.nodeValue :='SE';
  end;

procedure setInvoiceShipment;
var
  i,k: integer;
  pg: IXMLInvoiceProductGroup;
  iwli: IXMLInvoiceWoodLineItem;
begin
  ISH := inv.InvoiceShipment.Add;
  ISH.ShipmentID.SetAttributeNS('ShipmentIDType','','LotIdentifier');
  ISH.ShipmentID.NodeValue := 'SHID';
  for i := 1 to 1 do begin
    pg := ISH.InvoiceProductGroup.Add;
    pg.ProductGroupID.NodeValue := 'BOL'+intToStr(i);
    k := 1;
    while (k <= 5) do begin
      iwli := pg.InvoiceWoodLineItem.Add;
      iwli.InvoiceLineNumber := k;
      inc(k);
    end;
  end;

end;

begin
  if inv = nil then
  inv := NewInvoiceWood;
  begin
    inv.OwnerDocument.Encoding := 'utf-8';
    inv.OwnerDocument.SaveToFile(XMLFile);
    inv := LoadInvoiceWood(XMLFile);
    inv.OwnerDocument.Options := inv.OwnerDocument.Options - [doAttrNull] + [doAutoSave] + [doNodeAutoIndent] + [doNodeAutoCreate];
    inv.InvoiceType := 'Invoice';
    inv.InvoiceWoodHeader.InvoiceNumber := '107924';
    SetMessageDate(inv, now);
    SetReference(Inv, 'seller', 'LoadingOrderNo', intToStr(17166));
    SetReference(Inv, 'seller', 'Contract', 'F22/1291');
    SetReference(Inv, 'seller', 'Delivery note', intToStr(26871));

    btp := inv.InvoiceWoodHeader.BillToParty;
    btpID := btp.PartyIdentifier.Add;
    setBillToParty(Inv,'','','');
    setSupplierParty(Inv,'','','');
    setBuyerParty(Inv,'','','');
    setShipmentCharacteristics(Inv,'','','');
    setSenderparty(Inv,'','','');
    setInvoiceShipment;
    doSaveXML();
    mmo1.Lines.LoadFromFile(XMLFile);
  end;
end;


end.
