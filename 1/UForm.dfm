object mainForm: TmainForm
  Left = 173
  Top = 137
  Width = 786
  Height = 389
  Caption = #1044#1074#1086#1080#1095#1085#1099#1077' '#1076#1077#1088#1077#1074#1100#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblWordsB: TLabel
    Left = 320
    Top = 24
    Width = 119
    Height = 20
    Caption = #1057#1083#1086#1074#1072' '#1092#1072#1081#1083#1072' B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblWordsA: TLabel
    Left = 64
    Top = 24
    Width = 119
    Height = 20
    Caption = #1057#1083#1086#1074#1072' '#1092#1072#1081#1083#1072' A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblWordsC: TLabel
    Left = 568
    Top = 24
    Width = 119
    Height = 20
    Caption = #1057#1083#1086#1074#1072' '#1092#1072#1081#1083#1072' C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lblPathFileA: TLabel
    Left = 8
    Top = 224
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
  object lblPathFileB: TLabel
    Left = 264
    Top = 224
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
  object lblPathFileC: TLabel
    Left = 520
    Top = 224
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
  object btnSelectFileA: TButton
    Left = 64
    Top = 256
    Width = 113
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083' A'
    TabOrder = 0
    OnClick = btnSelectFileAClick
  end
  object btnSelectFileB: TButton
    Left = 336
    Top = 256
    Width = 113
    Height = 25
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083' B'
    TabOrder = 1
    OnClick = btnSelectFileBClick
  end
  object tvWordsFileB: TTreeView
    Left = 264
    Top = 48
    Width = 233
    Height = 169
    Indent = 19
    ReadOnly = True
    TabOrder = 2
  end
  object mmWordsFileA: TMemo
    Left = 16
    Top = 48
    Width = 225
    Height = 169
    ReadOnly = True
    TabOrder = 3
  end
  object mmWordsFileC: TMemo
    Left = 520
    Top = 48
    Width = 233
    Height = 169
    ReadOnly = True
    TabOrder = 4
  end
  object etPathFileA: TEdit
    Left = 120
    Top = 224
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object etPathFileB: TEdit
    Left = 376
    Top = 224
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object etPathFileC: TEdit
    Left = 632
    Top = 224
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object btnSelectFileC: TButton
    Left = 592
    Top = 256
    Width = 113
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074
    TabOrder = 8
    OnClick = btnSelectFileCClick
  end
  object btnRun: TButton
    Left = 320
    Top = 296
    Width = 145
    Height = 41
    Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnRunClick
  end
  object SelectFile: TOpenDialog
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' (*.txt)|*.txt'
    Top = 256
  end
  object SaveFile: TSaveDialog
    DefaultExt = '.txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' (*.txt)|*.txt'
    Left = 32
    Top = 256
  end
end
