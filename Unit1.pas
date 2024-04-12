unit Unit1;

interface

uses
  Winapi.Windows
  , Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    rEdt: TRichEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  fn = 'c:\proj\test_delphi\delphi-SimpleEditor\рыба.rtf';

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uSimpleEditor;

procedure TForm1.Button1Click(Sender: TObject);
var
  tmpFrm: TFrmSimpleEditor;
  ms: TMemoryStream;
begin
  tmpFrm:= TFrmSimpleEditor.Create(Self);
  ms:= TMemoryStream.Create;
  try
     tmpFrm.ShowModal;

     if (tmpFrm.ModalResult = mrOk) then
     begin
//       rEdt.Lines.Assign(tmpFrm.RichEdtSimple.Lines);
     end;

  finally
    ms.Free;
    FreeAndNil(tmpFrm);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  rEdt.WantReturns:= True;
  rEdt.ScrollBars:= TScrollStyle.ssVertical;
  if FileExists(fn) then rEdt.Lines.LoadFromFile(fn);
end;

end.
