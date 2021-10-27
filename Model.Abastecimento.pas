unit Model.Abastecimento;

interface
  uses
    Data.DB,
    Model.Base,
    Types.Posto;

type
  [TTableName('ABASTECIMENTOS')]
  TAbastecimento = class(TModelBase)
  private
    FID             : Integer;
    FIDPosto        : Integer;
    FIDTanque       : Integer;
    FIDBomba        : Integer;
    FData           : TDate;
    FTipoCombustivel: string;
    FQuantidade     : Double;
    FValorBruto     : Double;
    FValorImposto   : Double;
    FValorTotal     : Double;
  protected
    [TAttibuteField(ftInteger, 'ID', 1)]
    property ID : Integer read FID write FID;
  public
    [TAttibuteField(ftInteger, 'ID_POSTO', 1)]
    property IDPosto : Integer read FIDPosto write FIDPosto;

    [TAttibuteField(ftInteger, 'ID_TANQUE', 1)]
    property IDTanque : Integer read FIDTanque write FIDTanque;

    [TAttibuteField(ftInteger, 'ID_BOMBA', 1)]
    property IDBomba : Integer read FIDBomba write FIDBomba;

    [TAttibuteField(ftDate, 'DATA', 1)]
    property Data : TDate read FData write FData;

    [TAttibuteField(ftString, 'TIPO_COMBUSTIVEL', 1)]
    property TipoCombustivel : string read FTipoCombustivel write FTipoCombustivel;

    [TAttibuteField(ftFMTBcd, 'QTD_LITROS', 18)]
    property Quantidade : Double  read FQuantidade write FQuantidade;

    [TAttibuteField(ftFMTBcd, 'VALOR_BRUTO', 18)]
    property ValorBruto : Double  read FValorBruto write FValorBruto;

    [TAttibuteField(ftFMTBcd, 'VALOR_IMPOSTO', 18)]
    property ValorImposto : Double  read FValorImposto write FValorImposto;

    [TAttibuteField(ftFMTBcd, 'VALOR_TOTAL', 18)]
    property ValorTotal : Double  read FValorTotal write FValorTotal;
  end;

implementation

end.
