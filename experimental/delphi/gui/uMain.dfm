object Form1: TForm1
  Left = 251
  Top = 89
  Width = 1013
  Height = 649
  Caption = 'Embroidery Convert'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object spl1: TSplitter
    Left = 356
    Top = 46
    Height = 416
  end
  object spl2: TSplitter
    Left = 690
    Top = 46
    Width = 4
    Height = 416
  end
  object mmo1: TMemo
    Left = 0
    Top = 462
    Width = 1212
    Height = 121
    Align = alBottom
    Lines.Strings = (
      'mmo1')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1212
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 118
      Top = 8
      Width = 92
      Height = 31
      Caption = 'Button1'
      TabOrder = 0
    end
    object btnEmbOpen: TButton
      Left = 10
      Top = 8
      Width = 92
      Height = 31
      Caption = '&Open'
      TabOrder = 1
      OnClick = btnEmbOpenClick
    end
  end
  object vtOpen: TVirtualStringTree
    Left = 0
    Top = 46
    Width = 356
    Height = 416
    Align = alLeft
    DefaultNodeHeight = 22
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -15
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.Height = 23
    Header.MainColumn = -1
    TabOrder = 2
    OnGetText = vtOpenGetText
    OnGetNodeDataSize = vtOpenGetNodeDataSize
    Columns = <>
  end
  object vtExts: TVirtualStringTree
    Left = 359
    Top = 46
    Width = 331
    Height = 416
    Align = alLeft
    DefaultNodeHeight = 22
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -15
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.Height = 25
    Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible, hoHeaderClickAutoSort]
    Header.SortColumn = 1
    TabOrder = 3
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
    TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowTreeLines, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toFullRowSelect]
    OnChecked = vtExtsChecked
    OnColumnClick = vtExtsColumnClick
    OnGetText = vtExtsGetText
    OnGetNodeDataSize = vtExtsGetNodeDataSize
    OnInitNode = vtExtsInitNode
    Columns = <
      item
        Position = 0
        Width = 65
        WideText = 'Format'
      end
      item
        Position = 1
        Width = 200
        WideText = 'Description'
      end>
  end
  object pnlOutput: TPanel
    Left = 694
    Top = 46
    Width = 518
    Height = 416
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 4
    object pnlOutputConfig: TPanel
      Left = 0
      Top = 0
      Width = 518
      Height = 326
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        518
        326)
      object rgAdditionalDir: TRadioGroup
        Left = 20
        Top = 128
        Width = 483
        Height = 70
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Additional directory'
        Columns = 2
        ItemIndex = 2
        Items.Strings = (
          'Source Filename'
          'Source File Extension'
          'Destination File Extension'
          'None')
        TabOrder = 0
        OnClick = RebuildOutputResult
      end
      object grpTargetDir: TGroupBox
        Left = 20
        Top = 0
        Width = 483
        Height = 119
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Target directory'
        TabOrder = 1
        DesignSize = (
          483
          119)
        object rbInPlace: TRadioButton
          Left = 10
          Top = 30
          Width = 228
          Height = 20
          Caption = '&In the same directory of source'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RebuildOutputResult
        end
        object rbOutputDifferentDir: TRadioButton
          Left = 10
          Top = 59
          Width = 139
          Height = 21
          Caption = 'O&ther:'
          TabOrder = 1
          OnClick = RebuildOutputResult
        end
        object edtOutputDifferentDir: TEdit
          Left = 31
          Top = 79
          Width = 440
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnChange = edtOutputDifferentDirChange
        end
      end
      object GroupBox1: TGroupBox
        Left = 20
        Top = 207
        Width = 483
        Height = 70
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Additional name'
        TabOrder = 2
        object lblPrefix: TLabel
          Left = 20
          Top = 30
          Width = 33
          Height = 16
          Caption = '&Prefix'
          FocusControl = edtPrefix
        end
        object lblSuffix: TLabel
          Left = 236
          Top = 30
          Width = 31
          Height = 16
          Caption = '&Suffix'
          FocusControl = edtSuffix
        end
        object edtPrefix: TEdit
          Left = 69
          Top = 30
          Width = 149
          Height = 21
          TabOrder = 0
          OnChange = RebuildOutputResult
        end
        object edtSuffix: TEdit
          Left = 286
          Top = 30
          Width = 148
          Height = 21
          TabOrder = 1
          OnChange = RebuildOutputResult
        end
      end
    end
    object vtResult: TVirtualStringTree
      Left = 0
      Top = 326
      Width = 518
      Height = 90
      Align = alClient
      DefaultNodeHeight = 22
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -15
      Header.Font.Name = 'MS Sans Serif'
      Header.Font.Style = []
      Header.Height = 25
      Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
      TabOrder = 1
      OnGetText = vtResultGetText
      OnGetNodeDataSize = vtResultGetNodeDataSize
      Columns = <
        item
          Position = 0
          Width = 300
          WideText = 'Output file'
        end
        item
          Position = 1
          Width = 100
          WideText = 'Source File'
        end
        item
          Position = 2
          Width = 300
          WideText = 'Source Path'
        end>
    end
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
  object XPManifest1: TXPManifest
    Left = 616
    Top = 32
  end
end
