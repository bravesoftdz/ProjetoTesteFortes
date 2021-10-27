unit Types.Posto;

interface

type
  TTipoCombustivel = (tcDiesel, tcGasolina);

  TTipoCombustivelHelper = record helper for TTipoCombustivel
    function ToString: string;
    function Value: string;
  end;

implementation

{ TTipoCombustivelHelper }
function TTipoCombustivelHelper.ToString: string;
begin
  case Self of
    tcDiesel   : Result := 'Diesel';
    tcGasolina : Result := 'Gasolina';
  end;
end;

function TTipoCombustivelHelper.Value: string;
begin
  case Self of
    tcDiesel   : Result := 'D';
    tcGasolina : Result := 'G';
  end;
end;

end.
