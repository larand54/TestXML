unit frmMainReferenceTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls
  , uTestIWv2r31, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Datasnap.Xmlxform

;

type
  TForm2 = class(TForm)
    btn1: TButton;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
var
  inv: IXMLInvoiceWood;
const
  XMLFile = '../../../TestInvoiceFile.xml';

{$R *.dfm}

procedure setReference(const pmcInv: IXMLInvoiceWood; const pmcAssignedBy, pmcRefName: string);
var
  Ref: IXMLInvoiceReference;
begin
  ref := pmcInv.InvoiceWoodHeader.InvoiceReference.Add;
  ref.SetAttributeNS('AssignedBy','',pmcAssignedBy);
  ref.SetAttributeNS('InvoiceReferenceType','',pmcRefName);
  ref.NodeValue := 87532;
end;

procedure TForm2.btn1Click(Sender: TObject);
begin
  if inv = nil then
  inv := NewInvoiceWood;
  begin
    inv.OwnerDocument.Encoding := 'utf-8';
    inv.OwnerDocument.Options := inv.OwnerDocument.Options - [doAttrNull] + [doAutoSave] + [doNodeAutoIndent] + [doNodeAutoCreate];
    inv.InvoiceType := 'Invoice';
    inv.InvoiceWoodHeader.InvoiceNumber := '123456789';
    SetReference(Inv, 'seller', 'LoadingOrderNo');
    Inv.OwnerDocument.SaveToFile(XMLFile);

    mmo1.Lines.LoadFromFile(XMLFile);
  end;

end;

end.
