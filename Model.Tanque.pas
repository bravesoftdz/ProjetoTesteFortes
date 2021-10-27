unit Model.Tanque;

interface
  uses
    Data.DB,
    Model.Base,
    Types.Posto;

type
  [TTableName('TANQUES')]
  TTanque = class(TModelBase)
  private
    FIDPosto        : Integer;
    FDescricao      : string;
    FID             : Integer;
    FCapacidade     : Double;
    FDisponivel     : Double;
    FTipoCombustivel: string;
  public
    [TAttibuteField(ftInteger, 'ID', 1, True)]
    property ID : Integer read FID  write FID;

    property IDPosto : Integer read FIDPosto write FIDPosto;

    [TAttibuteField(ftString, 'DESCRICAO', 60)]
    property Descricao : string  read FDescricao write FDescricao;

    [TAttibuteField(ftFMTBcd, 'CAPACIDADE', 18)]
    property Capacidade : Double  read FCapacidade write FCapacidade;

    [TAttibuteField(ftFMTBcd, 'DISPONIVEL', 18)]
    property Disponivel : Double  read FDisponivel write FDisponivel;

    [TAttibuteField(ftString, 'TIPO_COMBUSTIVEL', 1)]
    property TipoCombustivel : string  read FTipoCombustivel write FTipoCombustivel;

    procedure Abastecer(const AQuantidade: Double);
    procedure Consumir(const AQuantidade: Double);
  end;

implementation
  uses
    Consts.Posto,
    Exceptions.Posto;

{ TTanque }
procedure TTanque.Abastecer(const AQuantidade: Double);
begin
  if AQuantidade < 1 then
     raise EPostoException.CreateFmt(ERRO_QUANTIDADE_MINIMA_INVALIDA, [AQuantidade]);

  if (Self.Disponivel + AQuantidade) > Self.Capacidade then
     raise EPostoException.CreateFmt(ERRO_CAPACIDADE_TANQUE_EXCEDIDA, [AQuantidade])
  else
    Self.Disponivel := Self.Disponivel + AQuantidade;

  Self.Gravar;
end;

procedure TTanque.Consumir(const AQuantidade: Double);
begin
  if AQuantidade > Self.FDisponivel then
     raise EPostoException.Create(ERRO_QUANTIDADE_INDISPONIVEL)
  else
    Self.FDisponivel := Self.FDisponivel - AQuantidade;

  Self.Gravar;
  Self.Abrir(Self.FID);
end;

end.
