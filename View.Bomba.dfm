object FrameBomba: TFrameBomba
  Left = 0
  Top = 0
  Width = 200
  Height = 290
  AutoSize = True
  TabOrder = 0
  object pnlBomba1: TPanel
    Left = 0
    Top = 0
    Width = 200
    Height = 290
    Align = alLeft
    TabOrder = 0
    object Label17: TLabel
      Left = 11
      Top = 254
      Width = 26
      Height = 13
      Caption = 'Litros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlTitulo: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 192
      Height = 37
      Align = alTop
      Caption = 'Bomba 1'
      Color = clOlive
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 94
      Width = 192
      Height = 133
      Align = alTop
      Color = 14017279
      ParentBackground = False
      TabOrder = 1
      object Label21: TLabel
        Left = 18
        Top = 18
        Width = 70
        Height = 13
        Caption = 'Pre'#231'o por Litro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 13
        Top = 97
        Width = 64
        Height = 13
        Caption = 'Total '#224' Pagar'
      end
      object lblValorTotalPagar: TLabel
        Left = 102
        Top = 96
        Width = 75
        Height = 14
        AutoSize = False
        Caption = 'R$ 0,00'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object lblPrecoLitro: TLabel
        Left = 102
        Top = 17
        Width = 75
        Height = 14
        AutoSize = False
        Caption = 'R$ 0,00'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
      object Label25: TLabel
        Left = 8
        Top = 56
        Width = 88
        Height = 13
        Caption = 'Valor com Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblValorImposto: TLabel
        Left = 102
        Top = 55
        Width = 75
        Height = 14
        AutoSize = False
        Caption = 'R$ 0,00'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = False
      end
    end
    object edtQtdeLitros: TSpinEdit
      Left = 43
      Top = 251
      Width = 47
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxValue = 100
      MinValue = 1
      ParentFont = False
      TabOrder = 2
      Value = 10
      OnChange = edtQtdeLitrosChange
    end
    object btnAbastecer: TButton
      Left = 104
      Top = 249
      Width = 69
      Height = 25
      Caption = 'Abastecer'
      TabOrder = 3
      OnClick = btnAbastecerClick
    end
    object pnlTipoCombustivel: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 47
      Width = 192
      Height = 41
      Align = alTop
      Caption = '...'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
    end
  end
end
