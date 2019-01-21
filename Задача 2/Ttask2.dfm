object Form1: TForm1
  Left = 387
  Top = 242
  Width = 389
  Height = 283
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblPathFileA: TLabel
    Left = 24
    Top = 48
    Width = 113
    Height = 20
    Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btnSelectFileA: TButton
    Left = 24
    Top = 97
    Width = 113
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083' A'
    TabOrder = 0
    OnClick = btnSelectFileAClick
  end
  object edtPathFileA: TEdit
    Left = 24
    Top = 72
    Width = 113
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object anwaer: TEdit
    Left = 166
    Top = 72
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object btnRun: TButton
    Left = 152
    Top = 121
    Width = 145
    Height = 41
    Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object SelectFile: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' (*.txt)|*.txt'
    Top = 256
  end
end
