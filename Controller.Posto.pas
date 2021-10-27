unit Controller.Posto;

interface
  uses
    System.SysUtils,
    Types.Posto,
    Consts.Posto,
    Model.Posto,
    Model.Tanque,
    Model.Bomba,
    Model.Abastecimento;

type
  IPosto = interface
  ['{C1E3D0BD-6977-4E81-AF20-8F58F0C6F530}']

    function Abastecer(const AIDBomba: Integer;
      const ATipoCombustivel: TTipoCombustivel;
      const AQuantidade: Double): IPosto;

    function Atualizar(const AValorDiesel: Double;
      const AValorGasolina: Double;
      const AValorImposto: Double;
      const ADataMovimento: TDateTime): IPosto;

    function Posto: TPosto;
  end;

  TControlePosto = class(TInterfacedObject, IPosto)
  private
    FIDPosto: Integer;
    FPosto  : TPosto;
  public
    constructor Create(const AIDPosto: Integer);
    destructor Destroy; override;

    class function New(const AIDPosto: Integer): IPosto;

    function Abastecer(const AIDBomba: Integer;
      const ATipoCombustivel: TTipoCombustivel;
      const AQuantidade: Double): IPosto;

    function Atualizar(const AValorDiesel: Double;
      const AValorGasolina: Double;
      const AValorImposto: Double;
      const ADataMovimento: TDateTime): IPosto;

    function Posto: TPosto;
  end;

implementation

{ TControlePosto }
function TControlePosto.Abastecer(const AIDBomba: Integer;
  const ATipoCombustivel: TTipoCombustivel;
  const AQuantidade: Double): IPosto;
var
  FAbastecimento: TAbastecimento;
begin
  Result := Self;

  try
    FAbastecimento := TAbastecimento.Create;
    FAbastecimento.IDPosto        := Self.Posto.ID;
    FAbastecimento.IDTanque       := Self.Posto.Tanque(ATipoCombustivel).ID;
    FAbastecimento.IDBomba        := Self.Posto.Bombas[AIDBomba-1].ID;
    FAbastecimento.Data           := Self.Posto.DataAbertura;
    FAbastecimento.TipoCombustivel:= ATipoCombustivel.Value;
    FAbastecimento.Quantidade     := AQuantidade;
    FAbastecimento.ValorBruto     := Self.Posto.ValorCombustivel(ATipoCombustivel);
    FAbastecimento.ValorImposto   := Self.Posto.Imposto;

    FAbastecimento.ValorTotal :=
      Self.Posto.ValorCombustivelComImposto(ATipoCombustivel) * AQuantidade;

    FAbastecimento.Incluir;
    Self.Posto.Tanque(ATipoCombustivel).Consumir(AQuantidade);
  finally
    if Assigned(FAbastecimento) then
      FreeAndNil(FAbastecimento);
  end;
end;

function TControlePosto.Atualizar(const AValorDiesel, AValorGasolina,
  AValorImposto: Double; const ADataMovimento: TDateTime): IPosto;
begin
  Self.Posto.ValorDiesel   := AValorDiesel;
  Self.Posto.ValorGasolina := AValorGasolina;
  Self.Posto.Imposto       := AValorImposto;
  Self.Posto.DataAbertura  := ADataMovimento;

  Self.Posto.Gravar;
end;

constructor TControlePosto.Create(const AIDPosto: Integer);
begin
  FIDPosto := AIDPosto;
end;

destructor TControlePosto.Destroy;
begin
  if Assigned(FPosto) then
    FreeAndNil(FPosto);

  inherited;
end;

class function TControlePosto.New(const AIDPosto: Integer): IPosto;
begin
  Result := Self.Create(AIDPosto);
end;

function TControlePosto.Posto: TPosto;
begin
  if not Assigned(FPosto) then
  begin
    FPosto := TPosto.Create;
    FPosto.Abrir(Self.FIDPosto);
  end;

  Result := Self.FPosto;
end;

end.
