object FormRelatorioAbastecimento: TFormRelatorioAbastecimento
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Abastecimento'
  ClientHeight = 625
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object repAbastecimento: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = dsAbastecimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Relat'#243'rio de Abastecimento'
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 27
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 259
        Top = 0
        Width = 200
        Height = 18
        Align = faCenterTop
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Abastecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 628
        Top = 2
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 32
      BandType = btFooter
      object RLLabel2: TRLLabel
        Left = 0
        Top = 17
        Width = 718
        Height = 15
        Align = faBottom
        Caption = 'Posto ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 65
      Width = 718
      Height = 96
      DataFields = 'DATA;TANQUE;BOMBA'
      FooterMeasuring = fmBeforeDetail
      object RLBand3: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        BandType = btHeader
        Color = cl3DLight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
        object RLLabel3: TRLLabel
          Left = 0
          Top = 0
          Width = 45
          Height = 17
          Align = faLeft
          AutoSize = False
          Caption = 'Data:  '
          Transparent = False
        end
        object RLDBText1: TRLDBText
          Left = 45
          Top = 0
          Width = 99
          Height = 17
          Align = faLeft
          DataField = 'DATA'
          DataSource = dsAbastecimento
          Text = ''
          Transparent = False
        end
        object RLDBText5: TRLDBText
          Left = 217
          Top = 0
          Width = 192
          Height = 17
          Align = faLeft
          AutoSize = False
          DataField = 'TANQUE'
          DataSource = dsAbastecimento
          Text = ''
          Transparent = False
        end
        object RLDBText6: TRLDBText
          Left = 475
          Top = 0
          Width = 242
          Height = 17
          Align = faLeft
          AutoSize = False
          DataField = 'BOMBA'
          DataSource = dsAbastecimento
          Text = ''
          Transparent = False
        end
        object RLLabel8: TRLLabel
          Left = 144
          Top = 0
          Width = 73
          Height = 17
          Align = faLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Tanque:  '
          Transparent = False
        end
        object RLLabel9: TRLLabel
          Left = 409
          Top = 0
          Width = 66
          Height = 17
          Align = faLeft
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Bomba:  '
          Transparent = False
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 17
        Width = 718
        Height = 16
        BandType = btColumnHeader
        object RLLabel4: TRLLabel
          Left = 0
          Top = 0
          Width = 35
          Height = 16
          Align = faLeft
          AutoSize = False
          Caption = 'ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel6: TRLLabel
          Left = 187
          Top = 0
          Width = 170
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Litros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel11: TRLLabel
          Left = 467
          Top = 0
          Width = 170
          Height = 16
          AutoSize = False
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 33
        Width = 718
        Height = 16
        object RLDBText2: TRLDBText
          Left = 0
          Top = 0
          Width = 35
          Height = 16
          Align = faLeft
          AutoSize = False
          DataField = 'ID'
          DataSource = dsAbastecimento
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 187
          Top = 0
          Width = 170
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'LITROS'
          DataSource = dsAbastecimento
          DisplayMask = '0.00'
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 467
          Top = 0
          Width = 170
          Height = 16
          AutoSize = False
          DataField = 'VALOR_TOTAL'
          DataSource = dsAbastecimento
          DisplayMask = '0.00'
          Text = ''
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 49
        Width = 718
        Height = 16
        BandType = btFooter
        Color = clInfoBk
        ParentColor = False
        Transparent = False
        object RLLabel7: TRLLabel
          Left = 0
          Top = 0
          Width = 35
          Height = 16
          Align = faLeft
          AutoSize = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBResult2: TRLDBResult
          Left = 187
          Top = 0
          Width = 170
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'LITROS'
          DataSource = dsAbastecimento
          DisplayMask = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
          Text = ''
          Transparent = False
        end
        object RLDBResult4: TRLDBResult
          Left = 467
          Top = 0
          Width = 170
          Height = 16
          AutoSize = False
          DataField = 'VALOR_TOTAL'
          DataSource = dsAbastecimento
          DisplayMask = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          ResetAfterPrint = True
          Text = ''
          Transparent = False
        end
      end
    end
  end
  object dsAbastecimento: TDataSource
    DataSet = cdsAbastecimento
    Left = 432
    Top = 240
  end
  object cdsAbastecimento: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 304
    Top = 240
    object cdsAbastecimentoID: TIntegerField
      FieldName = 'ID'
    end
    object cdsAbastecimentoDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
      Required = True
    end
    object cdsAbastecimentoTANQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TANQUE'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object cdsAbastecimentoBOMBA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BOMBA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object cdsAbastecimentoLITROS: TFloatField
      FieldName = 'LITROS'
    end
    object cdsAbastecimentoVALOR_BRUTO: TFloatField
      FieldName = 'VALOR_BRUTO'
    end
    object cdsAbastecimentoVALOR_IMPOSTO: TFloatField
      FieldName = 'VALOR_IMPOSTO'
    end
    object cdsAbastecimentoVALOR_TOTAL: TFloatField
      FieldName = 'VALOR_TOTAL'
    end
  end
end
