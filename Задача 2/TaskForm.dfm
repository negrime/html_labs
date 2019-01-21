object Form1: TForm1
  Left = 285
  Top = 180
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FormTask2'
  ClientHeight = 351
  ClientWidth = 600
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
    Left = 160
    Top = 112
    Width = 103
    Height = 20
    Caption = #1055#1091#1090#1100' '#1082' '#1092#1072#1081#1083#1091
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblAnwser: TLabel
    Left = 304
    Top = 112
    Width = 52
    Height = 20
    Caption = #1054#1090#1074#1077#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object btnSelectFileA: TButton
    Left = 160
    Top = 160
    Width = 113
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083' A'
    TabOrder = 0
    OnClick = btnSelectFileAClick
  end
  object btnRun: TButton
    Left = 160
    Top = 192
    Width = 113
    Height = 25
    Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnRunClick
  end
  object edtanwser: TEdit
    Left = 296
    Top = 136
    Width = 153
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object filePath: TEdit
    Left = 160
    Top = 136
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object btnClear: TButton
    Left = 160
    Top = 224
    Width = 113
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnClearClick
  end
  object SelectFile: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' (*.txt)|*.txt'
    Left = 120
    Top = 136
  end
end
