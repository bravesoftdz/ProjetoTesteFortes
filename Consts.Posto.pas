unit Consts.Posto;

interface

const
  ERRO_VALOR_PERCENTUAL = 'Valor do percentual do imposto deve ser entre 0 e 100';

  ERRO_CAPACIDADE_TANQUE_EXCEDIDA = 'Capacidade máxima do tanque não suporta o novo abastecimento de %f litros';
  ERRO_QUANTIDADE_MINIMA_INVALIDA = 'Quantidade deve ser maior que zero';
  ERRO_QUANTIDADE_INDISPONIVEL    = 'Quantidade indisponível';


  ERRO_VALOR_DIESEL_INVALIDO   = 'Valor do Diesel deve ser maior que zero';
  ERRO_VALOR_GASOLINA_INVALIDO = 'Valor da Gasolina deve ser maior que zero';

  SQL_SELECT_MODEL =
    ' SELECT ' +
    ' %s '+
    ' FROM  %s '+
    ' WHERE ID = :ID ';

  SQL_UPDATE_MODEL =
    ' UPDATE %s SET '+
    ' %s '+
    ' WHERE ID = :ID ';

  SQL_INSERT_MODEL =
    ' INSERT INTO %s '+
    ' ( %s '+
    ' ) VALUES ( '+
    ' %s )';

implementation

end.
