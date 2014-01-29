object Form1: TForm1
  Left = 133
  Top = 130
  Width = 928
  Height = 480
  Caption = 'Embroidery Convert'
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
  object spl1: TSplitter
    Left = 433
    Top = 49
    Height = 290
  end
  object mmo1: TMemo
    Left = 0
    Top = 339
    Width = 1314
    Height = 98
    Align = alBottom
    Lines.Strings = (
      'mmo1')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1314
    Height = 49
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object Button1: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
    end
    object btnEmbOpen: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Open'
      TabOrder = 1
      OnClick = btnEmbOpenClick
    end
  end
  object vtOpen: TVirtualStringTree
    Left = 0
    Top = 49
    Width = 433
    Height = 290
    Align = alLeft
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.MainColumn = -1
    TabOrder = 2
    OnGetText = vtOpenGetText
    Columns = <>
  end
  object VirtualStringTree1: TVirtualStringTree
    Left = 436
    Top = 49
    Width = 433
    Height = 290
    Align = alLeft
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.MainColumn = -1
    TabOrder = 3
    Columns = <>
  end
  object dlgOpen1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 64
    Top = 40
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 112
    Top = 48
  end
end
