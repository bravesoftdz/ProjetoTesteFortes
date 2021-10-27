unit Model.Posto;

interface
  uses
    System.SysUtils,
    System.Generics.Collections,
    Data.DB,
    Exceptions.Posto,
    Consts.Posto,
    Types.Posto,
    Model.Base,
    Model.Tanque,
    Model.Bomba;

type
  [TTableName('POSTOS')]
  TPosto = class(TModelBase)
  private
    FNome          : string;
    FID            : Integer;
    FImposto       : Double;
    FValorGasolina : Double;
    FValorDiesel   : Double;
    FDataAbertura  : TDateTime;
    FTanques       : TObjectList<TTanque>;
    FBombas        : TObjectList<TBomba>;

    procedure SetImposto(const Value: Double);
    procedure SetValorDiesel(const Value: Double);
    procedure SetValorGasolina(const Value: Double);
  protected
    procedure Carregar;
    procedure LiberarObjetos;
  public
    destructor Destroy; override;

    procedure ExecutarAposAbrir; override;

    [TAttibuteField(ftInteger, 'ID', 1, True)]
    property ID : Integer read FID write FID;

    [TAttibuteField(ftString, 'NOME', 60)]
    property Nome : string  read FNome write FNome;

    [TAttibuteField(ftFMTBcd, 'IMPOSTO', 18)]
    property Imposto : Double  read FImposto write SetImposto;

    [TAttibuteField(ftFMTBcd, 'VALOR_DIESEL', 18)]
    property ValorDiesel   : Double read FValorDiesel write SetValorDiesel;

    [TAttibuteField(ftFMTBcd, 'VALOR_GASOLINA', 18)]
    property ValorGasolina : Double read FValorGasolina write SetValorGasolina;

    property DataAbertura : TDateTime read FDataAbertura write FDataAbertura;

    property Tanques: TObjectList<TTanque> read FTanques write FTanques;
    property Bombas : TObjectList<TBomba>  read FBombas  write FBombas;

    function ValorCombustivelComImposto(const ATipoCombustivel: TTipoCombustivel): Double;
    function ValorCombustivel(const ATipoCombustivel: TTipoCombustivel): Double;
    procedure AbastecerTanque(const AID: Integer;const AQuantidade: Double);
    function Tanque(const AID: Integer): TTanque; overload;
    function Tanque(const ATipoCombustivel: TTipoCombustivel): TTanque; overload;
  end;

implementation

procedure TPosto.AbastecerTanque(const AID: Integer;const AQuantidade: Double);
var
  oTanque: TTanque;
begin
  oTanque := Self.Tanque(AID);

  if not Assigned(oTanque) then
    raise EPostoException.CreateFmt('Tanque %d informado inexistente', [AID]);

  oTanque.Abastecer(AQuantidade);
end;

procedure TPosto.Carregar;
var
  oTanque: TTanque;
  oBomba : TBomba;
begin
  FDataAbertura := Date;

  LiberarObjetos;

  FTanques := TObjectList<TTanque>.Create;
  FBombas  := TObjectList<TBomba>.Create;

  oTanque := TTanque.Create;
  oTanque.Abrir(1);
  Tanques.Add(oTanque);

  oTanque := TTanque.Create;
  oTanque.Abrir(2);
  Tanques.Add(oTanque);

  oBomba := TBomba.Create;
  oBomba.Abrir(1);
  Bombas.Add(oBomba);

  oBomba := TBomba.Create;
  oBomba.Abrir(2);

  Bombas.Add(oBomba);
end;

destructor TPosto.Destroy;
begin
  LiberarObjetos;

  inherited;
end;

procedure TPosto.ExecutarAposAbrir;
begin
  inherited;
  Carregar;
end;

procedure TPosto.LiberarObjetos;
begin
  if Assigned(FTanques) then
  begin
    FTanques.Clear;
    FreeAndNil(FTanques);
  end;

  if Assigned(FBombas) then
  begin
    FBombas.Clear;
    FreeAndNil(FBombas);
  end;
end;

procedure TPosto.SetImposto(const Value: Double);
begin
  FImposto := Value;
  if (Value < 0) or (Value > 100) then
    raise EPostoException.Create(ERRO_VALOR_PERCENTUAL);
end;

procedure TPosto.SetValorDiesel(const Value: Double);
begin
  if (Value <= 0) then
    raise EPostoException.Create(ERRO_VALOR_DIESEL_INVALIDO);

  FValorDiesel := Value;
end;

procedure TPosto.SetValorGasolina(const Value: Double);
begin
  if (Value <= 0) then
    raise EPostoException.Create(ERRO_VALOR_GASOLINA_INVALIDO);

  FValorGasolina := Value;
end;

function TPosto.Tanque(const ATipoCombustivel: TTipoCombustivel): TTanque;
var
  oTanque: TTanque;
begin
  Result := nil;
  for oTanque in Self.Tanques do
  begin
    if oTanque.TipoCombustivel = ATipoCombustivel.Value then
    begin
      Result := oTanque;
      Break
    end;
  end;
end;

function TPosto.Tanque(const AID: Integer): TTanque;
var
  oTanque: TTanque;
begin
  Result := nil;
  for oTanque in Self.Tanques do
  begin
    if oTanque.ID = AID then
    begin
      Result := oTanque;
      Break
    end;
  end;
end;

function TPosto.ValorCombustivel(const ATipoCombustivel: TTipoCombustivel): Double;
begin
  Result := 0;
  case ATipoCombustivel of
    tcDiesel  : Result := Self.ValorDiesel;
    tcGasolina: Result := Self.ValorGasolina;
  end;
end;

function TPosto.ValorCombustivelComImposto(const ATipoCombustivel: TTipoCombustivel): Double;
begin
  Result := ValorCombustivel(ATipoCombustivel);

  Result :=  Result + (Result * (Self.Imposto/100));
end;

end.
