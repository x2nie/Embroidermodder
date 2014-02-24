object Form2: TForm2
  Left = 315
  Top = 124
  Width = 928
  Height = 480
  Caption = 'Form2'
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
  object vt: TVirtualStringTree
    Left = 0
    Top = 49
    Width = 912
    Height = 256
    Align = alClient
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
    TabOrder = 0
    OnGetText = vtGetText
    OnGetNodeDataSize = vtGetNodeDataSize
    OnInitChildren = vtInitChildren
    OnInitNode = vtInitNode
    Columns = <
      item
        Position = 0
        Width = 150
        WideText = 'kind'
      end
      item
        Position = 1
        Width = 450
        WideText = 'Points'
      end>
  end
  object Memo1: TMemo
    Left = 0
    Top = 305
    Width = 912
    Height = 137
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 49
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 2
    object Button1: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object dlgOpen1: TOpenDialog
    Filter = 'SVG|*.svg'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 64
    Top = 40
  end
end
