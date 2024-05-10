unit frmMainTestXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, InvoiceWoodV2R31, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  Datasnap.Xmlxform, IInvoiceInterfaces, uInvoiceClasses, uInvoiceType,
  udmInvoicedata, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    btnCreateInvoiceXML: TButton;
    mmo1: TMemo;
    btnGetInvoicenumbers: TButton;
    FDQuery1: TFDQuery;
    ds1: TDataSource;
    cbb1: TComboBox;
    btnCreateXML: TButton;
    dbgrd1: TDBGrid;
    ds2: TDataSource;
    edtInvno: TEdit;
    lblInvNo: TLabel;
    procedure btnCreateInvoiceXMLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGetInvoicenumbersClick(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btnCreateXMLClick(Sender: TObject);
    procedure edtInvnoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    fXMLInvoice: IXMLInvoiceWood;
    fInvoicedata: TCMInvoice;
    fInv: IXMLInvoiceWood;
    fdm: TdmXMLInvoice;
//     function setupDBConnection: boolean;
  public
    { Public declarations }
    function createInvoiceXML(const pmcINvNo: string): boolean;
    property dm: TdmXMLInvoice read fdm;
  end;

procedure CreateInvoice(const pmcInvoiceNo: TCMInvoiceNo);

var
  Form1: TForm1;

const
  backspace = #8; {key code for backspace character}
  enter = #13;
  space = ' ';

var
  validchars: set of char = [backspace, enter, ' ', '0'..'9'];

implementation

uses
  uInvoiceException, mask;

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
  if InNode = nil then
    Exit;
  if InNode.ParentNode = nil then
    Exit;

  for I := InNode.ChildNodes.Count - 1 downto 0 do
    DeleteEmptyNode(InNode.ChildNodes[I]);

  if InNode.ChildNodes.Count <= 0 then
  begin
    if InNode.Text = '' then
    begin
      bEmpty := True;
      for I := 0 to InNode.AttributeNodes.Count - 1 do
      begin
        if InNode.AttributeNodes.Nodes[I].Text <> '' then
          bEmpty := False
      end;
      if bEmpty then
        InNode.ParentNode.ChildNodes.Delete(InNode.ParentNode.ChildNodes.IndexOf(InNode));
    end;
  end
  else


end;

function doSaveXML(const pmcInvoice: IXMLInvoiceWood; pmcClearEmpty: Boolean = False): Boolean;
begin
  Result := False;
  if pmcClearEmpty then
    DeleteEmptyNode(pmcInvoice);
  pmcInvoice.OwnerDocument.SaveToFile(pmcInvoice.OwnerDocument.FileName);
  Result := True;
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
  procedure setBillToParty(const pmcInv: IXMLInvoiceWood; const pmcIH: ICMInvoiceHeader);
  var
    btb: IXMLParty;
    btbId: IXMLPartyIdentifier;
    btbAd: IXMLNameAddress;
  begin
    btb := pmcInv.InvoiceWoodHeader.BillToParty;
    btb.NameAddress.Name1 := pmcIH.BillToParty.Get_Address.Name1;
    btb.NameAddress.Address1 := pmcIH.BillToParty.Get_Address.Address1;
    btb.NameAddress.Address2 := pmcIH.BillToParty.Get_Address.Address2;
    btb.NameAddress.Address3 := pmcIH.BillToParty.Get_Address.Address3;
    btb.NameAddress.City := pmcIH.BillToParty.Get_Address.City;
    btb.NameAddress.County := pmcIH.BillToParty.Get_Address.County;
    btb.NameAddress.StateOrProvince := pmcIH.BillToParty.Get_Address.StateOrProvince;
    btb.NameAddress.PostalCode.text := pmcIH.BillToParty.Get_Address.PostalCode;
    btb.NameAddress.Country.ISOCountryCode := pmcIH.BillToParty.Get_Address.country;
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType', '', 'AssignedBySeller');
    btbId.nodeValue := pmcIH.CustomerNo;
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType', '', 'VATIdentificationNumber');
    btbId.nodeValue := pmcIH.BillToParty.Get_VATid;
  end;

  procedure setSupplierParty(const pmcInv: IXMLInvoiceWood; const pmcIH: ICMInvoiceHeader);
  var
    spp: IXMLParty;
    sppId: IXMLPartyIdentifier;
    sppAdr: IXMLNameAddress;
  begin
    spp := pmcInv.InvoiceWoodHeader.SupplierParty;
    sppAdr := spp.NameAddress;
    sppAdr.Name1 := pmcIH.SupplierParty.Get_Address.Name1;
    sppAdr.Address1 := pmcIH.SupplierParty.Get_Address.Address1;
    sppAdr.Address2 := pmcIH.SupplierParty.Get_Address.Address2;
    sppAdr.Address3 := pmcIH.SupplierParty.Get_Address.Address3;
    sppAdr.PostalCode.Text := pmcIH.SupplierParty.Get_Address.PostalCode;
    sppAdr.City := pmcIH.SupplierParty.Get_Address.City;
    sppAdr.County := pmcIH.SupplierParty.Get_Address.County;
    sppAdr.StateOrProvince := pmcIH.SupplierParty.Get_Address.StateOrProvince;
    sppAdr.Country.ISOCountryCode := pmcIH.SupplierParty.Get_Address.Country;

    sppId := spp.PartyIdentifier.Add;
    sppId.SetAttributeNS('PartyidentifierType', '', 'AssignedBySeller');
    sppId.nodeValue := '741'; //WoodSupport always
    sppId := spp.PartyIdentifier.Add;
    sppId.SetAttributeNS('PartyidentifierType', '', 'VATIdentificationNumber');
    sppId.nodeValue := '556620-1082'; // Woodsupport always
  end;

  procedure setBuyerParty(const pmcInv: IXMLInvoiceWood; const pmcIH: ICMInvoiceHeader);
  var
    bp: IXMLParty;
    bpId: IXMLPartyIdentifier;
    bpAd: IXMLNameAddress;
  begin
    bp := pmcInv.InvoiceWoodHeader.BuyerParty;
    bpId := bp.PartyIdentifier.Add;
    bpId.SetAttributeNS('PartyidentifierType', '', 'AssignedBySeller');
    bpId.nodeValue := pmcIH.CustomerNo;
    bpId := bp.PartyIdentifier.Add;
    bpId.SetAttributeNS('PartyidentifierType', '', 'VATIdentificationNumber');
    bpId.nodeValue := pmcIH.VATNo;

    bpAd := bp.NameAddress;
    bpAd.Name1 := pmcIH.BuyerParty.Get_Address.Name1;
    bpAd.Address1 := pmcIH.BuyerParty.Get_Address.Address1;
    bpAd.Address2 := pmcIH.BuyerParty.Get_Address.Address2;
    bpAd.Address3 := pmcIH.BuyerParty.Get_Address.Address3;
    bpAd.PostalCode.Text := pmcIH.BuyerParty.Get_Address.PostalCode;
    bpAd.City := pmcIH.BuyerParty.Get_Address.City;
    bpAd.Country.ISOCountryCode := pmcIH.BuyerParty.Get_Address.Country;
  end;

  procedure setShipmentCharacteristics(const pmcInv: IXMLInvoiceWood; const pmcIH: ICMInvoiceHeader);
  var
    stc: IXMLParty;
    stcId: IXMLPartyIdentifier;
    stcAd: IXMLNameAddress;
    ShipToChar: IXMLShipToCharacteristics;
    TD: ICMTermsOfDelivery;
    TSC: ICMShipToCharacteristics;
  begin
    ShipToChar := pmcInv.InvoiceWoodHeader.ShipToCharacteristics;
    ShipToChar.ShipToParty.SetAttributeNS('PartyType', '', 'PlaceFinalDestination');
    stc := pmcInv.InvoiceWoodHeader.ShipToCharacteristics.ShipToParty;
    stcId := stc.PartyIdentifier.Add;
    stcId.SetAttributeNS('PartyidentifierType', '', 'AssignedBySeller');
    stcId.nodeValue := pmcIH.CustomerNo;
    stcId := stc.PartyIdentifier.Add;
    stcId.SetAttributeNS('PartyidentifierType', '', 'VATIdentificationNumber');
    stcId.nodeValue := pmcIH.VATNo;

    stcAd := stc.NameAddress;
    stcAd.Name1 := pmcIH.ShipToCharacteristics.ShipToParty.Get_Address.Name1;
    stcAd.Address1 := pmcIH.ShipToCharacteristics.ShipToParty.Get_Address.Address1;
    stcAd.Address2 := pmcIH.ShipToCharacteristics.ShipToParty.Get_Address.Address2;
    stcAd.Address3 := pmcIH.ShipToCharacteristics.ShipToParty.Get_Address.Address3;
    stcAd.PostalCode.Text := pmcIH.ShipToCharacteristics.ShipToParty.Get_Address.PostalCode;
    stcAd.City := pmcIH.ShipToCharacteristics.ShipToParty.Get_Address.City;
    stcAd.Country.ISOCountryCode := pmcIH.ShipToCharacteristics.ShipToParty.Get_Address.Country;

    TSC := pmcIH.ShipToCharacteristics;
    TD := TSC.TermsOfDelivery;
    ShipToChar.TermsOfDelivery.IncotermsLocation.setAttributeNS('Incoterms', '', TD.AdditionalText);
    ShipToChar.TermsOfDelivery.IncotermsLocation.nodeValue := '???';
  end;

  procedure setSenderParty(const pmcInv: IXMLInvoiceWood; const pmcAssignedBy, pmcRefName, pmcReference: string);
  var
    btb: IXMLParty;
    btbId: IXMLPartyIdentifier;
    btbAd: IXMLNameAddress;
  begin

    btb := pmcInv.InvoiceWoodHeader.SenderParty;
    btb.SetAttributeNS('PartyType', '', 'Seller');
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType', '', 'AssignedBySeller');
    btbId.nodeValue := '498';
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType', '', 'VATIdentificationNumber');
    btbId.nodeValue := '556645-6215';

    btbAd := btb.NameAddress;
    btbAd.Name1 := 'Byggmax Norge';
    btbAd.Name2 := 'Peter Lyvestand';
    btbAd.Address1 := 'Box 6063';
    btbAd.PostalCode.Text := '171 06';
    btbAd.City := 'Solna';
    btbAd.Country.SetAttributeNS('ISOCountrycode', '', 'FI');
    btbAd.Country.nodeValue := 'SE';
  end;

  procedure setInvoiceShipment(const pmcInv: IXMLInvoiceWood; const pmcI: ICMInvoice; pmcIdtls: ICMInvoiceDetails);
  var
    i, k: integer;
    pg: IXMLInvoiceProductGroup;
    iwli: IXMLInvoiceWoodLineItem;
    prid: IXMLProductIdentifier;
    prdescr: IXMLProductDescription;
    iqty: IXMLInformationalQuantity;
    qty: IXMLQuantity;
    qtyv: IXMLNode;
    PriceDet: IXMLPriceDetails;
    ppu: IXMLNode;
    cv: IXMLNode;
    tq: IXMLNode;
    valuePerUnit: IXMLNode;
    pgsum: IXMLProductGroupSummary;
    iwsum: IXMLInvoiceWoodSummary;
    list: IXMLNode;
    listcv: IXMLNode;
    listv: IXMLNode;
    madj: IXMLNode;
    node, node1, node2, node3, date: IXMLNode;
    ISH: IXMLInvoiceShipment;
    idtls: ICMInvoiceDetails;
    idt: ICMInvoiceDetail;
    IH: ICMInvoiceHeader;
  begin
    inv := pmcInv;
//    idtls := pmcI.InvoiceDetails;
    ISH := inv.InvoiceShipment.Add;
    ISH.ShipmentID.SetAttributeNS('ShipmentIDType', '', 'LotIdentifier');
    ISH.ShipmentID.NodeValue := 'SHID';
    for i := 1 to 1 do
    begin             // ProductGroup(s)
      pg := ISH.InvoiceProductGroup.Add;
      pg.ProductGroupID.NodeValue := 'BOL' + intToStr(i);
      k := 0;
      while pmcidtls.getInvoiceDetail(k) <> nil do//(k < pmcidtls.length) do
      begin            // InvoiceLineItem(s)
        idt := pmcidtls.getInvoiceDetail(k);
        iwli := pg.InvoiceWoodLineItem.Add;
        iwli.InvoiceLineNumber := k;
        prid := iwli.Product.ProductIdentifier.add;
        prid.SetAttributeNS('Agency', '', 'Supplier');
        prid.SetAttributeNS('ProductIdentifierType', '', 'Partnumber');
        prid.NodeValue := idt.ProductNo; // productNo
        prdescr := iwli.Product.ProductDescription.Add;
        prdescr.NodeValue := idt.ProductDescr;

        qty := iwli.Quantity;
        qty.SetAttributeNS('QuantityType', '', 'Actual Volume');
        qtyv := qty.AddChild('Value');
        qtyv.SetAttributeNS('UOM', '', 'CubicMeter');
        qtyv.NodeValue := idt.QUOM;

        PriceDet := iwli.InvoiceLineBaseAmountInformation.PriceDetails;
        PriceDet.SetAttributeNS('PriceQuantitybasis', '', 'Volume');
        ppu := PriceDet.AddChild('PricePerUnit');
        cv := ppu.AddChild('CurrencyValue');
        cv.SetAttributeNS('CurrencyType', '', 'EUR');
        cv.NodeValue := idt.CurrencyValue;

        valuePerUnit := ppu.AddChild('Value');
        valuePerUnit.SetAttributeNS('UOM', '', 'CubicMeter');
        valuePerUnit.NodeValue := 1;

 // Monetary adjustments
 // =======================
   // Tax adjustments
        madj := iwli.MonetaryAdjustment;
        madj.SetAttributeNS('AdjustmentType','','Tax');
        node := madj.AddChild('MonetaryAdjustmentLine');
        node.NodeValue := 1;

        node := madj.AddChild('Taxadjustment');
        node.SetAttributeNS('TaxType','','VAT');

        node1 := node.AddChild('TaxPercent');
        node1.SetAttributeNS('CurrencyType','','EUR');
        node1.NodeValue := '0.00'; //floatToStr(idt.TaxPercent);

        node1 := node.AddChild('TaxAmount');
        node2 := node1.AddChild('CurrencyValue');
        node2.SetAttributeNS('CurrencyType','','EUR');
        node2.NodeValue := '0.00';

        node1 := node.AddChild('TaxLocation');
        node1.NodeValue := 'TAX LOCATION';

 // INVOICE Line amount
 // ====================
        node := iwli.InvoiceLineAmount;
        node1 := node.AddChild('CurrencyValue');
        node1.SetAttributeNS('CurrencyType','','EUR');
        node1.NodeValue := idt.LineValue;
   //
      inc(k);
      end;

      iwsum := inv.InvoiceWoodSummary;
      iwsum.TotalNumberOfLineItems := k;
    // <TotalQuantity QuantityType="Volume">
      tq := iwsum.AddChild('TotalQuantity');
      tq.SetAttributeNS('QuantityType', '', 'Volume');
      qtyv := tq.AddChild('Value');
      qtyv.SetAttributeNS('UOM', '', 'CubicMeter');
      qtyv.Nodevalue := idt.QUOM;

    // <TotalQuantity QuantityType="Grossweight">
      tq := iwsum.AddChild('TotalQuantity');
      tq.SetAttributeNS('QuantityType', '', 'Grossweight');
      qtyv := tq.AddChild('Value');
      qtyv.SetAttributeNS('UOM', '', 'Kilogram');
      qtyv.Nodevalue := 5 * 0.998 * 0.57 * 1000;

    // <LineItemSubTotal>
      list := iwsum.AddChild('LineItemSubTotal');
      listcv := list.AddChild('CurrencyValue');
      listcv.SetAttributeNS('CurrencyType', '', 'EUR');
      listcv.NodeValue := 10.25 * 5 * 0.998;

    // <TotalAdjustments>
      node := iwsum.AddChild('TotalAdjustments');
      node1 := node.AddChild('CurrencyValue');
      node1.SetAttributeNS('CurrencyType', '', 'EUR');
      node1.NodeValue := 0.0;
    // <TotalTaxAmount>
      node := iwsum.AddChild('TotalTaxAmount');
      node1 := node.AddChild('CurrencyValue');
      node1.SetAttributeNS('CurrencyType', '', 'EUR');
      node1.NodeValue := 0.0;
    // <TotalFASAmount>
      node := iwsum.AddChild('TotalFASAmount');
      node1 := node.AddChild('CurrencyValue');
      node1.SetAttributeNS('CurrencyType', '', 'EUR');
      node1.NodeValue := 0.0;
    // <TotalAmount>
      node := iwsum.AddChild('TotalAmount');
      node1 := node.AddChild('CurrencyValue');
      node1.SetAttributeNS('CurrencyType', '', 'EUR');
      node1.NodeValue := 0.0;
    // <TermsOfPayment>
      node := iwsum.AddChild('TermsOfPayment');
      node.SetAttributeNS('TermsbasisType', '', 'Invoicedate');
      node1 := node.AddChild('TermsDescription');
      node1.NodeValue := '45 Dagar netto';
    // TermsBasisDate
      node1 := node.AddChild('TermsBasisDate');
      date := node1.AddChild('Date');
      node1 := date.AddChild('Year');
      node1.NodeValue := '2024';
      node1 := date.AddChild('Month');
      node1.NodeValue := '4';
      node1 := date.AddChild('Day');
      node1.NodeValue := '1';
    // <TermsDiscountDueDate>
      node1 := node.AddChild('TermsDiscountDueDate');
      date := node1.AddChild('Date');
      node1 := date.AddChild('Year');
      node1.NodeValue := '2024';
      node1 := date.AddChild('Month');
      node1.NodeValue := '4';
      node1 := date.AddChild('Day');
      node1.NodeValue := '15';
    // <TermsNetDueDate>
      node1 := node.AddChild('TermsNetDueDate');
      date := node1.AddChild('Date');
      node1 := date.AddChild('Year');
      node1.NodeValue := '2024';
      node1 := date.AddChild('Month');
      node1.NodeValue := '5';
      node1 := date.AddChild('Day');
      node1.NodeValue := '15';

    // <InvoiceWoodSummary>
      node := iwsum.AddChild('InvoiceWoodSummary');
      node := node.AddChild('CustomsTotals');
      node1 := node.AddChild('CustomsTariffCode');
      node1.NodeValue := 'CustomsTariffCode';

      node1 := node.AddChild('TotalQuantity');
      node1.SetAttributeNS('QuantityType', '', 'Volume');
      node1 := node1.AddChild('Value');
      node1.SetAttributeNS('UOM', '', 'CubicMeter');
      node1.NodeValue := 5 * 0.998;

      node1 := node.AddChild('InformationalQuantity');
      node1.SetAttributeNS('QuantityType', '', 'ActualVolume');
      node1 := node1.AddChild('Value');
      node1.SetAttributeNS('UOM', '', 'Kilogram');
      node1.NodeValue := 5 * 0.998 * 10.25 * 0.57;

      node1 := node.AddChild('InformationalQuantity');
      node1.SetAttributeNS('QuantityType', '', 'Count');
      node1 := node1.AddChild('Value');
      node1.SetAttributeNS('UOM', '', 'Package');
      node1.NodeValue := 2;

      node1 := node.AddChild('InformationalQuantity');
      node1.SetAttributeNS('QuantityType', '', 'Volume');
      node1 := node1.AddChild('Value');
      node1.SetAttributeNS('UOM', '', 'CubicMeter');
      node1.NodeValue := 5 * 0.998;
    end;

  end;

const
  XML_Template = 'Invoice_%s.xml';
var
  inv: IXMLInvoiceWood;
  invNo: TCM_XMLString;
  InvoiceData: ICMInvoice;
  IH: ICMInvoiceHeader;
  Idtls: ICMInvoiceDetails;
  XMLFile: string;
begin
  invNo := edtInvNo.text;
  XMLFile := format(XML_Template, [invNo]);
  if inv = nil then
    inv := NewInvoiceWood;
  inv.OwnerDocument.Encoding := 'utf-8';
  inv.OwnerDocument.SaveToFile(XMLFile);
  inv := LoadInvoiceWood(XMLFile);
  inv.OwnerDocument.Options := inv.OwnerDocument.Options - [doAttrNull] + [doAutoSave] + [doNodeAutoIndent] + [doNodeAutoCreate];

  InvoiceData := TCMInvoice.create;
  Idtls := TCMInvoiceDetails.Create;
  if not dmXMLInvoice.collectInvoiceData(invNo, InvoiceData, Idtls) then
    TInvoiceException.RaiseDBError(9901, 'Can not retrieve InvoiceData');
  inv.InvoiceType := InvoiceData.InvoiceType;
  IH := InvoiceData.Get_InvoiceHeader;
  if IH.InvoiceNumber = '' then
    TInvoiceException.RaiseInvoiceHeader(2001, 'Could not get InvoiceNumber');

  inv.InvoiceType := 'Invoice';
  inv.InvoiceWoodHeader.InvoiceNumber := IH.InvoiceNumber;
  SetMessageDate(inv, now);

  SetReference(inv, 'seller', 'LoadingOrderNo', InvoiceData.Get_InvoiceHeader.LoadingOrderNo);
  SetReference(inv, 'seller', 'Contract', InvoiceData.Get_InvoiceHeader.Contract);
  SetReference(inv, 'seller', 'Delivery note', InvoiceData.Get_InvoiceHeader.LoadNo);

  setBillToParty(inv, IH);
  setSupplierParty(inv, IH);
  setBuyerParty(inv, IH);
  setShipmentCharacteristics(inv, IH);
//  setSenderparty(inv, '', '', '');
  setInvoiceShipment(inv, InvoiceData, Idtls);
  doSaveXML(inv);
  form1.mmo1.Lines.LoadFromFile(XMLFile);
end;

procedure TForm1.btnGetInvoicenumbersClick(Sender: TObject);
var
  invoiceNo, InternalInvoiceNo: integer;
  name: string;
begin
  FDQuery1.ParamByName('name').AsString := 'alm';
  FDQuery1.Open;
  FDQuery1.First;
  cbb1.Text := FDQuery1.FieldByName('CustomerName').AsString;
  while not FDQuery1.EOF do
  begin
    invoiceNo := FDQuery1.FieldByName('InvoiceNo').AsInteger;
    name := FDQuery1.FieldByName('CustomerName').AsString;
    cbb1.Items.AddPair(intToStr(invoiceNo), name, TObject(invoiceNo));
    FDQuery1.Next;
  end;
end;

procedure TForm1.cbb1Change(Sender: TObject);
begin
  cbb1.Text := cbb1.items[cbb1.ItemIndex];
  edtInvno.Text := intToStr(integer(cbb1.Items.Objects[cbb1.itemindex]));
end;

function TForm1.createInvoiceXML(const pmcINvNo: string): boolean;
begin

end;

procedure TForm1.edtInvnoKeyPress(Sender: TObject; var Key: Char);
begin
  if Sender is TEdit then
  begin
    if Key in validchars then
      exit;
    Key := #0;
    beep;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fdm := udmInvoicedata.dmXMLInvoice;
  dm.con1.Close;
end;

procedure TForm1.btnCreateInvoiceXMLClick(Sender: TObject);
var
  InvoiceNo: integer;
  IntInvNo: integer;
  IWNo: TCMInvoiceNo;
begin
  IWNo := '108645';
  if cbb1.ItemIndex > -1 then
    IWNo := intToStr(integer(cbb1.Items.Objects[cbb1.itemindex]));
  createInvoice(IWNo);
end;

procedure CreateInvoice(const pmcInvoiceNo: TCMInvoiceNo);
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
    btbId.SetAttributeNS('PartyidentifierType', '', 'AssignedBySeller');
    btbId.nodeValue := '498';
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType', '', 'VATIdentificationNumber');
    btbId.nodeValue := '556645-6215';

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
    btbId.SetAttributeNS('PartyidentifierType', '', 'AssignedBySeller');
    btbId.nodeValue := '498';
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType', '', 'VATIdentificationNumber');
    btbId.nodeValue := '556645-6215';

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
    btbId.SetAttributeNS('PartyidentifierType', '', 'AssignedBySeller');
    btbId.nodeValue := '498';
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType', '', 'VATIdentificationNumber');
    btbId.nodeValue := '556645-6215';

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
    ShipToChar.ShipToParty.SetAttributeNS('PartyType', '', 'PlaceFinalDestination');
    btb := pmcInv.InvoiceWoodHeader.ShipToCharacteristics.ShipToParty;
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType', '', 'AssignedBySeller');
    btbId.nodeValue := '498';
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType', '', 'VATIdentificationNumber');
    btbId.nodeValue := '556645-6215';

    btbAd := btb.NameAddress;
    btbAd.Name1 := 'Byggmax Norge';
    btbAd.Name2 := 'Peter Lyvestand';
    btbAd.Address1 := 'Box 6063';
    btbAd.PostalCode.Text := '171 06';
    btbAd.City := 'Solna';
    btbAd.Country.ISOCountryCode := 'FI';
    ShipToChar.TermsOfDelivery.IncotermsLocation.setAttributeNS('Incoterms', '', 'CIP');
    ShipToChar.TermsOfDelivery.IncotermsLocation.nodeValue := 'Oslo';
  end;

  procedure setSenderParty(const pmcInv: IXMLInvoiceWood; const pmcAssignedBy, pmcRefName, pmcReference: string);
  var
    btb: IXMLParty;
    btbId: IXMLPartyIdentifier;
    btbAd: IXMLNameAddress;
  begin

    btb := pmcInv.InvoiceWoodHeader.SenderParty;
    btb.SetAttributeNS('PartyType', '', 'Seller');
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType', '', 'AssignedBySeller');
    btbId.nodeValue := '498';
    btbId := btb.PartyIdentifier.Add;
    btbId.SetAttributeNS('PartyidentifierType', '', 'VATIdentificationNumber');
    btbId.nodeValue := '556645-6215';

    btbAd := btb.NameAddress;
    btbAd.Name1 := 'Byggmax Norge';
    btbAd.Name2 := 'Peter Lyvestand';
    btbAd.Address1 := 'Box 6063';
    btbAd.PostalCode.Text := '171 06';
    btbAd.City := 'Solna';
    btbAd.Country.SetAttributeNS('ISOCountrycode', '', 'FI');
    btbAd.Country.nodeValue := 'SE';
  end;

  procedure setInvoiceShipment(const pmcInv: IXMLInvoiceWood);
  var
    i, k: integer;
    pg: IXMLInvoiceProductGroup;
    iwli: IXMLInvoiceWoodLineItem;
    prid: IXMLProductIdentifier;
    prdescr: IXMLProductDescription;
    iqty: IXMLInformationalQuantity;
    qty: IXMLQuantity;
    qtyv: IXMLNode;
    PriceDet: IXMLPriceDetails;
    ppu: IXMLNode;
    cv: IXMLNode;
    tq: IXMLNode;
    valuePerUnit: IXMLNode;
    pgsum: IXMLProductGroupSummary;
    iwsum: IXMLInvoiceWoodSummary;
    list: IXMLNode;
    listcv: IXMLNode;
    listv: IXMLNode;
    node, node1, date: IXMLNode;
  begin
    inv := pmcInv;
    ISH := inv.InvoiceShipment.Add;
    ISH.ShipmentID.SetAttributeNS('ShipmentIDType', '', 'LotIdentifier');
    ISH.ShipmentID.NodeValue := 'SHID';
    for i := 1 to 1 do
    begin             // ProductGroup(s)
      pg := ISH.InvoiceProductGroup.Add;
      pg.ProductGroupID.NodeValue := 'BOL' + intToStr(i);
      k := 1;
      while (k <= 5) do
      begin            // InvoiceLineItem(s)
        iwli := pg.InvoiceWoodLineItem.Add;
        iwli.InvoiceLineNumber := k;
        prid := iwli.Product.ProductIdentifier.add;
        prid.SetAttributeNS('Agency', '', 'Supplier');
        prid.SetAttributeNS('ProductIdentifierType', '', 'partnumber');
        prid.NodeValue := 100742; // productNo
        prdescr := iwli.Product.ProductDescription.Add;
        prdescr.NodeValue := '32X125(28X120) Klyvtrall, Furu, Hyvlat 4 runda hörn, IMP AB';

        qty := iwli.Quantity;
        qty.SetAttributeNS('QuantityType', '', 'Actual Volume');
        qtyv := qty.AddChild('Value');
        qtyv.SetAttributeNS('UOM', '', 'CubicMeter');
        qtyv.NodeValue := 10.25;

        PriceDet := iwli.InvoiceLineBaseAmountInformation.PriceDetails;
        PriceDet.SetAttributeNS('PriceQuantitybasis', '', 'Volume');
        ppu := PriceDet.AddChild('PricePerUnit');
        cv := ppu.AddChild('CurrencyValue');
        cv.SetAttributeNS('CurrencyType', '', 'EUR');
        cv.NodeValue := 10.25;

        valuePerUnit := ppu.AddChild('Value');
        valuePerUnit.SetAttributeNS('UOM', '', 'CubicMeter');
        valuePerUnit.NodeValue := 0.998;
        inc(k);
      end;

      iwsum := inv.InvoiceWoodSummary;
      iwsum.TotalNumberOfLineItems := k - 1;
    // <TotalQuantity QuantityType="Volume">
      tq := iwsum.AddChild('TotalQuantity');
      tq.SetAttributeNS('QuantityType', '', 'Volume');
      qtyv := tq.AddChild('Value');
      qtyv.SetAttributeNS('UOM', '', 'CubicMeter');
      qtyv.Nodevalue := 5 * 0.998;

    // <TotalQuantity QuantityType="Grossweight">
      tq := iwsum.AddChild('TotalQuantity');
      tq.SetAttributeNS('QuantityType', '', 'Grossweight');
      qtyv := tq.AddChild('Value');
      qtyv.SetAttributeNS('UOM', '', 'Kilogram');
      qtyv.Nodevalue := 5 * 0.998 * 0.57 * 1000;

    // <LineItemSubTotal>
      list := iwsum.AddChild('LineItemSubTotal');
      listcv := list.AddChild('CurrencyValue');
      listcv.SetAttributeNS('CurrencyType', '', 'EUR');
      listcv.NodeValue := 10.25 * 5 * 0.998;

    // <TotalAdjustments>
      node := iwsum.AddChild('TotalAdjustments');
      node1 := node.AddChild('CurrencyValue');
      node1.SetAttributeNS('CurrencyType', '', 'EUR');
      node1.NodeValue := 0.0;
    // <TotalTaxAmount>
      node := iwsum.AddChild('TotalTaxAmount');
      node1 := node.AddChild('CurrencyValue');
      node1.SetAttributeNS('CurrencyType', '', 'EUR');
      node1.NodeValue := 0.0;
    // <TotalFASAmount>
      node := iwsum.AddChild('TotalFASAmount');
      node1 := node.AddChild('CurrencyValue');
      node1.SetAttributeNS('CurrencyType', '', 'EUR');
      node1.NodeValue := 0.0;
    // <TotalAmount>
      node := iwsum.AddChild('TotalAmount');
      node1 := node.AddChild('CurrencyValue');
      node1.SetAttributeNS('CurrencyType', '', 'EUR');
      node1.NodeValue := 0.0;
    // <TermsOfPayment>
      node := iwsum.AddChild('TermsOfPayment');
      node.SetAttributeNS('TermsbasisType', '', 'Invoicedate');
      node1 := node.AddChild('TermsDescription');
      node1.NodeValue := '45 Dagar netto';
    // TermsBasisDate
      node1 := node.AddChild('TermsBasisDate');
      date := node1.AddChild('Date');
      node1 := date.AddChild('Year');
      node1.NodeValue := '2024';
      node1 := date.AddChild('Month');
      node1.NodeValue := '4';
      node1 := date.AddChild('Day');
      node1.NodeValue := '1';
    // <TermsDiscountDueDate>
      node1 := node.AddChild('TermsDiscountDueDate');
      date := node1.AddChild('Date');
      node1 := date.AddChild('Year');
      node1.NodeValue := '2024';
      node1 := date.AddChild('Month');
      node1.NodeValue := '4';
      node1 := date.AddChild('Day');
      node1.NodeValue := '15';
    // <TermsNetDueDate>
      node1 := node.AddChild('TermsNetDueDate');
      date := node1.AddChild('Date');
      node1 := date.AddChild('Year');
      node1.NodeValue := '2024';
      node1 := date.AddChild('Month');
      node1.NodeValue := '5';
      node1 := date.AddChild('Day');
      node1.NodeValue := '15';

    // <InvoiceWoodSummary>
      node := iwsum.AddChild('InvoiceWoodSummary');
      node := node.AddChild('CustomsTotals');
      node1 := node.AddChild('CustomsTariffCode');
      node1.NodeValue := 'CustomsTariffCode';

      node1 := node.AddChild('TotalQuantity');
      node1.SetAttributeNS('QuantityType', '', 'Volume');
      node1 := node1.AddChild('Value');
      node1.SetAttributeNS('UOM', '', 'CubicMeter');
      node1.NodeValue := 5 * 0.998;

      node1 := node.AddChild('InformationalQuantity');
      node1.SetAttributeNS('QuantityType', '', 'ActualVolume');
      node1 := node1.AddChild('Value');
      node1.SetAttributeNS('UOM', '', 'Kilogram');
      node1.NodeValue := 5 * 0.998 * 10.25 * 0.57;

      node1 := node.AddChild('InformationalQuantity');
      node1.SetAttributeNS('QuantityType', '', 'Count');
      node1 := node1.AddChild('Value');
      node1.SetAttributeNS('UOM', '', 'Package');
      node1.NodeValue := 2;

      node1 := node.AddChild('InformationalQuantity');
      node1.SetAttributeNS('QuantityType', '', 'Volume');
      node1 := node1.AddChild('Value');
      node1.SetAttributeNS('UOM', '', 'CubicMeter');
      node1.NodeValue := 5 * 0.998;
    end;

  end;

var
  InvoiceData: ICMInvoice;
  inv: IXMLInvoiceWood;
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
    SetReference(inv, 'seller', 'LoadingOrderNo', intToStr(17166));
    SetReference(inv, 'seller', 'Contract', 'F22/1291');
    SetReference(inv, 'seller', 'Delivery note', intToStr(26871));

    setBillToParty(inv, '', '', '');
    setSupplierParty(inv, '', '', '');
    setBuyerParty(inv, '', '', '');
    setShipmentCharacteristics(inv, '', '', '');
    setSenderparty(inv, '', '', '');
    setInvoiceShipment(inv);
    doSaveXML(inv);
    form1.mmo1.Lines.LoadFromFile(XMLFile);
  end;
end;

end.

