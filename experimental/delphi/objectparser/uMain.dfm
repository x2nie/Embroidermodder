object Form1: TForm1
  Left = 192
  Top = 124
  Width = 928
  Height = 480
  Caption = 'Form1'
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
  object Button1: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object vt: TVirtualStringTree
    Left = 160
    Top = 16
    Width = 609
    Height = 417
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.MainColumn = -1
    TabOrder = 1
    OnGetText = vtGetText
    OnGetNodeDataSize = vtGetNodeDataSize
    Columns = <>
  end
  object Memo1: TMemo
    Left = 32
    Top = 272
    Width = 841
    Height = 137
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object dlgOpen1: TOpenDialog
    Filter = 'SVG|*.svg'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 64
    Top = 40
  end
end
