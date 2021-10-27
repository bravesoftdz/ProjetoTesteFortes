unit Tanque.Testes;

interface
  uses
    System.SysUtils,
    Model.Tanque,
    Types.Posto,
    Exceptions.Posto,
    DUnitX.TestFramework;

type
  [TestFixture]
  TTanqueTests = class(TObject)
  private
    FTanque: TTanque;
  public
    [Test]
    procedure AbastecerLimiteExcedidoTest;
    [Test]
    procedure AbastecerLimiteTest;

    [Test]
    procedure AbastecerQuantidadeMinimaTest;

    [Test]
    procedure ConsumirQuantidadeIndisponivelTest;
    [Test]
    procedure ConsumirTest;
  end;

implementation

procedure TTanqueTests.AbastecerLimiteExcedidoTest;
begin
  Assert.WillRaiseWithMessage(
    procedure
    begin
      try
        FTanque := TTanque.Create;
        FTanque.Capacidade := 10000;
        FTanque.Abastecer(5000);
        FTanque.Abastecer(5000);
        FTanque.Abastecer(1250);
      finally
        FreeAndNil(FTanque);
      end;

    end, EPostoException, 'Capacidade máxima do tanque não suporta o novo abastecimento de 1250,00 litros');
end;

procedure TTanqueTests.AbastecerLimiteTest;
const
  MSG = 'FTanque.Disponivel Deveria ter o valor de 10000 :-(';
  ValorEsperado: Double = 10000;
begin
  try
    FTanque := TTanque.Create;
    FTanque.Capacidade := 10000;
    FTanque.Abastecer(5000);
    FTanque.Abastecer(5000);

    Assert.AreEqual(ValorEsperado, FTanque.Disponivel, MSG);
  finally
    FreeAndNil(FTanque);
  end;
end;

procedure TTanqueTests.AbastecerQuantidadeMinimaTest;
begin
  Assert.WillRaiseWithMessage(
    procedure
    begin
      try
        FTanque := TTanque.Create;
        FTanque.Capacidade := 1500;
        FTanque.Abastecer(0);
      finally
        FreeAndNil(FTanque);
      end;
    end, EPostoException, 'Quantidade deve ser maior que zero');
end;

procedure TTanqueTests.ConsumirQuantidadeIndisponivelTest;
begin
  Assert.WillRaiseWithMessage(
    procedure
    begin
      try
        FTanque := TTanque.Create;
        FTanque.Capacidade := 1500;
        FTanque.Abastecer(1000);
        FTanque.Consumir(900);
        FTanque.Consumir(200);
      finally
        FreeAndNil(FTanque);
      end;
    end, EPostoException, 'Quantidade indisponível');
end;

procedure TTanqueTests.ConsumirTest;
const
  MSG = 'FTanque.Disponivel Deveria ter o valor de 146.80 :-(';
  ValorEsperado: Double = 146.80;
begin
  try
    FTanque := TTanque.Create;
    FTanque.Capacidade := 1500;
    FTanque.Abastecer(1000);
    FTanque.Consumir(853.20);

    Assert.AreEqual(ValorEsperado, FTanque.Disponivel, MSG);
  finally
    FreeAndNil(FTanque);
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTanqueTests);
end.

