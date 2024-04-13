program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uSimpleEditor in 'uSimpleEditor.pas' {frmSimpleEditor},
  Arm.Settings.Common in 'Arm.Settings.Common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmSimpleEditor, frmSimpleEditor);
  Application.Run;
end.
