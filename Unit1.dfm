object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 221
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  DesignSize = (
    431
    221)
  TextHeight = 15
  object rEdt: TRichEdit
    Left = 8
    Top = 8
    Width = 334
    Height = 205
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'rEdt')
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 348
    Top = 8
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end