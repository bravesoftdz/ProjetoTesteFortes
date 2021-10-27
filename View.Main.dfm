object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Controle de Abastecimento'
  ClientHeight = 503
  ClientWidth = 805
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 805
    Height = 49
    Align = alTop
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 12
      Width = 60
      Height = 25
      Caption = 'Posto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 86
      Top = 12
      Width = 14
      Height = 25
      Caption = 'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 105
      Top = 12
      Width = 14
      Height = 25
      Caption = 'B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 125
      Top = 12
      Width = 14
      Height = 25
      Caption = 'C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 805
    Height = 152
    Align = alTop
    TabOrder = 1
    object grpPosto: TGroupBox
      Left = 1
      Top = 1
      Width = 252
      Height = 150
      Align = alLeft
      Caption = 'Posto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label6: TLabel
        Left = 13
        Top = 19
        Width = 55
        Height = 13
        Caption = 'Valor Diesel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 82
        Top = 19
        Width = 67
        Height = 13
        Caption = 'Valor Gasolina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 160
        Top = 19
        Width = 53
        Height = 13
        Caption = '% Imposto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtValorDiesel: TEdit
        Left = 13
        Top = 38
        Width = 60
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = SomenteNumeros
      end
      object edtValorGasolina: TEdit
        Left = 79
        Top = 38
        Width = 67
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = SomenteNumeros
      end
      object edtPostoImposto: TSpinEdit
        Left = 160
        Top = 38
        Width = 52
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxLength = 3
        MaxValue = 100
        MinValue = 0
        ParentFont = False
        TabOrder = 2
        Value = 0
      end
      object btnImprimirMovimento: TButton
        Left = 13
        Top = 113
        Width = 200
        Height = 25
        Caption = 'Imprimir Movimento'
        TabOrder = 3
        OnClick = btnImprimirMovimentoClick
      end
      object btnAtualizar: TButton
        Left = 124
        Top = 65
        Width = 89
        Height = 25
        Caption = 'Atualizar'
        TabOrder = 4
        OnClick = btnAtualizarClick
      end
      object edtDataMovimento: TDateTimePicker
        Left = 13
        Top = 69
        Width = 102
        Height = 21
        Date = 44493.000000000000000000
        Time = 0.467508275462023400
        TabOrder = 5
      end
    end
    object grpTanques: TGroupBox
      Left = 253
      Top = 1
      Width = 551
      Height = 150
      Align = alClient
      Caption = 'Tanques'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = 243
      ExplicitWidth = 561
      ExplicitHeight = 174
      object GroupBox1: TGroupBox
        AlignWithMargins = True
        Left = 279
        Top = 18
        Width = 267
        Height = 127
        Align = alClient
        Caption = 'Tanque Gasolina'
        TabOrder = 0
        ExplicitLeft = 295
        ExplicitWidth = 261
        ExplicitHeight = 151
        object Label10: TLabel
          Left = 130
          Top = 65
          Width = 90
          Height = 13
          Caption = 'Capacidade (litros)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 30
          Top = 68
          Width = 82
          Height = 13
          Caption = 'Dispon'#237'vel (litros)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCapacidadeGasolina: TLabel
          Left = 130
          Top = 84
          Width = 90
          Height = 13
          AutoSize = False
          Caption = '...'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object lblDisponivelGasolina: TLabel
          Left = 30
          Top = 84
          Width = 88
          Height = 13
          AutoSize = False
          Caption = '...'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object btnAbastecerTanqueGasolina: TButton
          Left = 110
          Top = 18
          Width = 110
          Height = 25
          Caption = 'Abastecer'
          TabOrder = 0
          OnClick = btnAbastecerTanqueGasolinaClick
        end
        object edtLitrosGasolina: TSpinEdit
          Left = 30
          Top = 20
          Width = 65
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 100
          OnKeyPress = SomenteNumeros
        end
        object pgbTanque2: TProgressBar
          AlignWithMargins = True
          Left = 30
          Top = 103
          Width = 190
          Height = 17
          TabOrder = 2
        end
      end
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 268
        Height = 127
        Align = alLeft
        Caption = 'Tanque Diesel'
        TabOrder = 1
        object Label13: TLabel
          Left = 131
          Top = 62
          Width = 90
          Height = 13
          Caption = 'Capacidade (litros)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 35
          Top = 62
          Width = 82
          Height = 13
          Caption = 'Dispon'#237'vel (litros)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCapacidadeDiesel: TLabel
          Left = 131
          Top = 81
          Width = 86
          Height = 13
          AutoSize = False
          Caption = '...'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object lblDisponivelDiesel: TLabel
          Left = 35
          Top = 81
          Width = 69
          Height = 13
          AutoSize = False
          Caption = '...'
          Color = clWindow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object btnAbastecerTanqueDiesel: TButton
          Left = 116
          Top = 18
          Width = 110
          Height = 25
          Caption = 'Abastecer'
          TabOrder = 0
          OnClick = btnAbastecerTanqueDieselClick
        end
        object edtLitrosDiesel: TSpinEdit
          Left = 35
          Top = 20
          Width = 65
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 100
          OnKeyPress = SomenteNumeros
        end
        object pgbTanque1: TProgressBar
          AlignWithMargins = True
          Left = 35
          Top = 103
          Width = 190
          Height = 17
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
        end
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 201
    Width = 805
    Height = 302
    Align = alClient
    Caption = 'Abastecer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    ExplicitTop = 225
    ExplicitHeight = 301
    inline FrameBomba1: TFrameBomba
      Left = 2
      Top = 15
      Width = 200
      Height = 285
      Align = alLeft
      AutoSize = True
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 15
      ExplicitHeight = 284
      inherited pnlBomba1: TPanel
        Height = 285
        ExplicitHeight = 284
        inherited pnlTitulo: TPanel
          Color = clHotLight
        end
        inherited Panel4: TPanel
          Color = clCream
          inherited Label22: TLabel
            Width = 75
            ExplicitWidth = 75
          end
        end
        inherited pnlTipoCombustivel: TPanel
          Font.Color = clBlack
        end
      end
    end
    inline FrameBomba2: TFrameBomba
      Left = 202
      Top = 15
      Width = 200
      Height = 285
      Align = alLeft
      AutoSize = True
      TabOrder = 1
      ExplicitLeft = 202
      ExplicitTop = 15
      ExplicitHeight = 284
      inherited pnlBomba1: TPanel
        Height = 285
        ExplicitHeight = 284
        inherited pnlTitulo: TPanel
          Color = clHotLight
        end
        inherited Panel4: TPanel
          Color = clCream
          inherited Label22: TLabel
            Width = 75
            ExplicitWidth = 75
          end
        end
      end
    end
    inline FrameBomba3: TFrameBomba
      Left = 402
      Top = 15
      Width = 200
      Height = 285
      Align = alLeft
      AutoSize = True
      TabOrder = 2
      ExplicitLeft = 402
      ExplicitTop = 15
      ExplicitHeight = 284
      inherited pnlBomba1: TPanel
        Height = 285
        ExplicitHeight = 284
        inherited pnlTitulo: TPanel
          Color = 22704
        end
        inherited Panel4: TPanel
          Color = cl3DLight
          inherited Label22: TLabel
            Width = 75
            ExplicitWidth = 75
          end
          inherited lblValorTotalPagar: TLabel
            Color = clWhite
          end
          inherited lblPrecoLitro: TLabel
            Color = clWhite
          end
          inherited lblValorImposto: TLabel
            Color = clWhite
          end
        end
        inherited pnlTipoCombustivel: TPanel
          Font.Color = clBlack
        end
      end
    end
    inline FrameBomba4: TFrameBomba
      Left = 602
      Top = 15
      Width = 200
      Height = 285
      Align = alLeft
      AutoSize = True
      TabOrder = 3
      ExplicitLeft = 602
      ExplicitTop = 15
      ExplicitHeight = 284
      inherited pnlBomba1: TPanel
        Height = 285
        ExplicitHeight = 284
        inherited pnlTitulo: TPanel
          Color = 22704
        end
        inherited Panel4: TPanel
          Color = cl3DLight
          ExplicitLeft = 6
          inherited Label22: TLabel
            Width = 75
            ExplicitWidth = 75
          end
          inherited lblValorTotalPagar: TLabel
            Color = clWhite
          end
          inherited lblPrecoLitro: TLabel
            Color = clWhite
          end
          inherited lblValorImposto: TLabel
            Color = clWhite
          end
        end
      end
    end
  end
end
