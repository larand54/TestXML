program TestXML;

uses
  Vcl.Forms,
  frmMainTestXML in 'frmMainTestXML.pas' {Form1},
  InvoiceWoodV2R31 in 'InvoiceWoodV2R31.pas',
  uInvoiceClasses in 'uInvoiceClasses.pas',
  IInvoiceInterfaces in 'IInvoiceInterfaces.pas',
  udmInvoicedata in 'udmInvoicedata.pas' {dmXMLInvoice: TDataModule},
  uInvoiceException in 'uInvoiceException.pas',
  uInvoiceType in 'uInvoiceType.pas',
  uWS_UTILS in '..\WoodSupport\WSCommonSources\uWS_UTILS.pas',
  uUtilsInterfaces in '..\WoodSupport\WSCommonSources\uUtilsInterfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmXMLInvoice, dmXMLInvoice);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
