object Form1: TForm1
  Left = 127
  Top = 194
  Width = 1044
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
    Left = 289
    Top = 49
    Height = 306
  end
  object spl2: TSplitter
    Left = 561
    Top = 49
    Height = 306
  end
  object mmo1: TMemo
    Left = 0
    Top = 355
    Width = 1036
    Height = 98
    Align = alBottom
    Lines.Strings = (
      'mmo1')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1036
    Height = 49
    Align = alTop
    BevelOuter = bvNone
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
    Width = 289
    Height = 306
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
    OnGetNodeDataSize = vtOpenGetNodeDataSize
    Columns = <>
  end
  object vtExts: TVirtualStringTree
    Left = 292
    Top = 49
    Width = 269
    Height = 306
    Align = alLeft
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'MS Sans Serif'
    Header.Font.Style = []
    Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
    TabOrder = 3
    TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
    TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowTreeLines, toThemeAware, toUseBlendedImages]
    TreeOptions.SelectionOptions = [toFullRowSelect]
    OnChecked = vtExtsChecked
    OnGetText = vtExtsGetText
    OnGetNodeDataSize = vtExtsGetNodeDataSize
    OnInitNode = vtExtsInitNode
    Columns = <
      item
        Position = 0
        Width = 55
        WideText = 'Format'
      end
      item
        Position = 1
        Width = 200
        WideText = 'Description'
      end>
  end
  object pnlOutput: TPanel
    Left = 564
    Top = 49
    Width = 421
    Height = 306
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 4
    object pnlOutputConfig: TPanel
      Left = 0
      Top = 0
      Width = 421
      Height = 185
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        421
        185)
      object rgAdditionalDir: TRadioGroup
        Left = 16
        Top = 104
        Width = 393
        Height = 57
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Additional directory'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Filename'
          'File Extension'
          'None')
        TabOrder = 0
      end
      object grpTargetDir: TGroupBox
        Left = 16
        Top = 0
        Width = 393
        Height = 97
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Target directory'
        TabOrder = 1
        DesignSize = (
          393
          97)
        object rbInPlace: TRadioButton
          Left = 8
          Top = 24
          Width = 185
          Height = 17
          Caption = 'In the same directory of source'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object rbOutputDifferentDir: TRadioButton
          Left = 8
          Top = 48
          Width = 113
          Height = 17
          Caption = 'Other:'
          TabOrder = 1
        end
        object edtOutputDir: TEdit
          Left = 25
          Top = 64
          Width = 358
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnChange = edtOutputDirChange
        end
      end
    end
    object vtResult: TVirtualStringTree
      Left = 0
      Top = 185
      Width = 421
      Height = 121
      Align = alClient
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'MS Sans Serif'
      Header.Font.Style = []
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
end
