program RefTest;

uses
  Vcl.Forms,
  frmMainReferenceTest in 'frmMainReferenceTest.pas' {Form2},
  uTestIWv2r31 in 'uTestIWv2r31.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
