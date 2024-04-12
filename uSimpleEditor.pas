﻿unit uSimpleEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList, PngImageList, Vcl.Menus, Vcl.ComCtrls,
  System.Actions, Vcl.ActnList, Vcl.StdActns, Vcl.ToolWin, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmSimpleEditor = class(TForm)
    PngImgListActMng: TPngImageList;
    actList: TActionList;
    mnuMain: TMainMenu;
    StatusBar1: TStatusBar;
    ActFileNew: TAction;
    ActFileOpen: TAction;
    ActSaveAs: TAction;
    ActPgStp: TAction;
    ActPrint: TAction;
    ActCloseFileWSave: TAction;
    ActCloseFileWOSave: TAction;
    ActCutToClipbrd: TAction;
    ActCopyToClipbrd: TAction;
    ActPasteToClipbrd: TAction;
    ActSelectAll: TAction;
    ActUndo: TAction;
    ActRedo: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    ActSearchText: TAction;
    ActReplaceText: TAction;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    ActFontChoice: TAction;
    ActFontColor: TAction;
    ActFontBackgrnd: TAction;
    ActFontForegrnd: TAction;
    ActFontSizeInc: TAction;
    ActFontSizeDec: TAction;
    ActToUpperCase: TAction;
    ActToLowerCase: TAction;
    actFontBold: TAction;
    actFontItalic: TAction;
    actFontUnderline: TAction;
    actFontStrikeOut: TAction;
    actInsertBullets: TAction;
    ActInsertSymbol: TAction;
    ActChrSubScript: TAction;
    ActChrSupraScript: TAction;
    ActDivString: TAction;
    actAlignLeft: TAction;
    actAlignCenter: TAction;
    actAlignRight: TAction;
    actLineSpacing_1: TAction;
    actLineSpacing_2: TAction;
    actLineSpacing_3: TAction;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    CoolBar1: TCoolBar;
    tbFile: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    tbEdit: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    tbCbb: TToolBar;
    tbFont: TToolBar;
    tbFontEdit: TToolBar;
    cbbFontFamily: TComboBox;
    ToolButton19: TToolButton;
    cbbFontSize: TComboBox;
    ToolButton20: TToolButton;
    ToolButton22: TToolButton;
    ToolButton21: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    ToolButton35: TToolButton;
    ToolButton36: TToolButton;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    tbTextEdit: TToolBar;
    ToolButton39: TToolButton;
    ToolButton40: TToolButton;
    ToolButton41: TToolButton;
    ToolButton42: TToolButton;
    ToolButton43: TToolButton;
    ToolButton44: TToolButton;
    ToolButton45: TToolButton;
    ToolButton46: TToolButton;
    ToolButton47: TToolButton;
    ToolButton48: TToolButton;
    ToolButton49: TToolButton;
    r_edt: TRichEdit;
    ColorDlg: TColorDialog;
    FontDlg: TFontDialog;
    PrnDlg: TPrintDialog;
    FileOpenDlg: TOpenDialog;
    FileSaveDlg: TSaveDialog;
    PgStpDlg: TPageSetupDialog;
    FindDlg: TFindDialog;
    ReplaceDlg: TReplaceDialog;
    procedure ActFileNewExecute(Sender: TObject);
    procedure ActToLowerCaseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActFileOpenExecute(Sender: TObject);
    procedure ActSaveAsExecute(Sender: TObject);
    procedure ActPgStpExecute(Sender: TObject);
    procedure ActPrintExecute(Sender: TObject);
    procedure ActCloseFileWSaveExecute(Sender: TObject);
    procedure ActCloseFileWOSaveExecute(Sender: TObject);
    procedure ActCutToClipbrdExecute(Sender: TObject);
    procedure ActCopyToClipbrdExecute(Sender: TObject);
    procedure ActPasteToClipbrdExecute(Sender: TObject);
    procedure ActSelectAllExecute(Sender: TObject);
    procedure ActSearchTextExecute(Sender: TObject);
    procedure ActReplaceTextExecute(Sender: TObject);
    procedure ActFontColorExecute(Sender: TObject);
    procedure ActFontBackgrndExecute(Sender: TObject);
    procedure ActFontForegrndExecute(Sender: TObject);
    procedure ActFontSizeIncExecute(Sender: TObject);
    procedure ActFontSizeDecExecute(Sender: TObject);
    procedure ActToUpperCaseExecute(Sender: TObject);
    procedure actFontBoldExecute(Sender: TObject);
    procedure actFontItalicExecute(Sender: TObject);
    procedure actFontUnderlineExecute(Sender: TObject);
    procedure actFontStrikeOutExecute(Sender: TObject);
    procedure actInsertBulletsExecute(Sender: TObject);
    procedure ActInsertSymbolExecute(Sender: TObject);
    procedure ActChrSubScriptExecute(Sender: TObject);
    procedure ActChrSupraScriptExecute(Sender: TObject);
    procedure ActDivStringExecute(Sender: TObject);
    procedure actAlignLeftExecute(Sender: TObject);
    procedure actAlignCenterExecute(Sender: TObject);
    procedure actAlignRightExecute(Sender: TObject);
    procedure actLineSpacing_1Execute(Sender: TObject);
    procedure actLineSpacing_2Execute(Sender: TObject);
    procedure actLineSpacing_3Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSimpleEditor: TfrmSimpleEditor;

implementation

{$R *.dfm}

procedure TfrmSimpleEditor.actAlignCenterExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.actAlignLeftExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.actAlignRightExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActChrSubScriptExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActChrSupraScriptExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActCloseFileWOSaveExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActCloseFileWSaveExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActCopyToClipbrdExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActCutToClipbrdExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActDivStringExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActFileNewExecute(Sender: TObject);
begin
  r_edt.Text:= 'Привет, Камиль!';
end;

procedure TfrmSimpleEditor.ActFileOpenExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActFontBackgrndExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.actFontBoldExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActFontColorExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActFontForegrndExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.actFontItalicExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActFontSizeDecExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActFontSizeIncExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.actFontStrikeOutExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.actFontUnderlineExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.actInsertBulletsExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActInsertSymbolExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.actLineSpacing_1Execute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.actLineSpacing_2Execute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.actLineSpacing_3Execute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActPasteToClipbrdExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActPgStpExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActPrintExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActReplaceTextExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActSaveAsExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActSearchTextExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActSelectAllExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActToLowerCaseExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.ActToUpperCaseExecute(Sender: TObject);
begin
//
end;

procedure TfrmSimpleEditor.FormCreate(Sender: TObject);
var
  i: Integer;
  tmpTB: TToolBar;
begin
  Self.ModalResult:= mrCancel;
  cbbFontFamily.Height:= 20;
  cbbFontSize.Height:= 20;

  with CoolBar1 do
  begin
    BandBorderStyle:= bsNone;
    AutoSize:= True;
    DoubleBuffered:= True;
    EdgeBorders:= [];
  end;

  for i := 0 to Pred(CoolBar1.ControlCount) do
    if TControl(CoolBar1.Controls[i]).InheritsFrom(TToolBar) then
    begin
      tmpTB:= TToolBar(CoolBar1.Controls[i]);
      with tmpTB do
      begin
        Align:= alNone;
        AutoSize:= True;
        DoubleBuffered:= True;
      end;
    end;

end;

end.
