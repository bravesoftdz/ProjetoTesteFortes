unit Posto.Testes;

interface
  uses
    Model.Posto,
    Exceptions.Posto,
    Types.Posto,
    DUnitX.TestFramework;

type
  [TestFixture]
  TPostoTests = class(TObject)
  private
    FPosto: TPosto;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [TestCase('Diesel-1', '-1')]
    [TestCase('DieselZero','0')]
    procedure AtualizarPrecoDieselInvalidoTest(const AValue: Double);

    [TestCase('Gasolina-1', '-1')]
    [TestCase('GasolinaZero','0')]
    procedure AtualizarPrecoGasolinaInvalidoTest(const AValue: Double);

    [TestCase('Imposto-1', '-1')]
    [TestCase('Imposto101','101')]
    procedure AtualizarImpostoInvalidoTest(const AValue: Double);

    [Test]
    procedure AtualizarImpostoPadraoTest;

    [TestCase('Imposto-10', '10')]
    [TestCase('Imposto-20', '20')]
    procedure AtualizarValorComImpostoTest(const AValue: Double);
  end;

implementation

procedure TPostoTests.AtualizarImpostoPadraoTest;
const
  MSG_1 = 'Valor da gasolina com o imposto padrão deveria ser de 5.65 :-(';
  MSG_2 = 'Valor do diesel com o imposto padrão deveria ser de 3.39 :-(';
  ValorEsperado1: Double = 5.65;
  ValorEsperado2: Double = 3.39;
begin
  FPosto.ValorDiesel   := 3;
  FPosto.ValorGasolina := 5;
  FPosto.Imposto       := 13;

  Assert.AreEqual(ValorEsperado1, FPosto.ValorCombustivelComImposto(tcGasolina), MSG_1);
  Assert.AreEqual(ValorEsperado2, FPosto.ValorCombustivelComImposto(tcDiesel),   MSG_2);
end;

procedure TPostoTests.AtualizarPrecoGasolinaInvalidoTest(const AValue: Double);
begin
  Assert.WillRaiseWithMessage(
    procedure
    begin
      FPosto.ValorDiesel   := 3;
      FPosto.ValorGasolina := 0;
      FPosto.Imposto       := AValue;
    end, EPostoException, 'Valor da Gasolina deve ser maior que zero');
end;

procedure TPostoTests.AtualizarValorComImpostoTest(const AValue: Double);
var
  AValorEsperadoDiesel,
  AValorEsperadoGasolina: Double;
begin
  FPosto.ValorDiesel   := 3;
  FPosto.ValorGasolina := 5;
  FPosto.Imposto       := AValue;

  AValorEsperadoDiesel   := 3 + (3 * (AValue/100));
  AValorEsperadoGasolina := 5 + (5 * (AValue/100));

  Assert.AreEqual(AValorEsperadoDiesel,   FPosto.ValorCombustivelComImposto(tcDiesel),   'Valor do Diesel com imposto diferente do esperado :-\');
  Assert.AreEqual(AValorEsperadoGasolina, FPosto.ValorCombustivelComImposto(tcGasolina), 'Valor da Gasolina com imposto diferente do esperado :-\');
end;

procedure TPostoTests.Setup;
begin
  FPosto := TPosto.Create;
  FPosto.Abrir(1);
end;

procedure TPostoTests.TearDown;
begin
  FPosto.Free;
end;

procedure TPostoTests.AtualizarPrecoDieselInvalidoTest(const AValue: Double);
begin
  Assert.WillRaiseWithMessage(
    procedure
    begin
      FPosto.ValorDiesel   := 0;
      FPosto.ValorGasolina := 5;
      FPosto.Imposto       := AValue;
    end, EPostoException, 'Valor do Diesel deve ser maior que zero');
end;

procedure TPostoTests.AtualizarImpostoInvalidoTest(const AValue: Double);
begin
  Assert.WillRaiseWithMessage(
    procedure
    begin
      FPosto.ValorDiesel   := 3;
      FPosto.ValorGasolina := 5;
      FPosto.Imposto       := AValue;
    end, EPostoException, 'Valor do percentual do imposto deve ser entre 0 e 100');
end;

initialization
  TDUnitX.RegisterTestFixture(TPostoTests);
end.
