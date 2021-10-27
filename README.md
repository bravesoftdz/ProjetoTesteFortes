# ProjetoTeste
Projeto de Avaliação 

# Requisitos Funcionais

1.  Controle de abastecimentos feitos durante cada dia, identificando a bomba utilizada, a quantidade de litros e o valor abastecido;

2.  Possibilidade de alteração do valor de cada combustível e imposto a ser cobrado para cada abastecimento a ser registrado;

3.  Os abastecimentos são feitos por Bomba e direcionado para Tanque conforme o tipo de combustível. Cada abastecimento feito é deduzido o combustível do tanque utilizado;

4.  Disponibilizado relatório demonstrando os abastecimentos agrupados por dia, tanque, bomba, quantidade de litros e o valor;

# Requisitos não funcionais Executados

1.    A aplicação foi feita no padrão MVC, utilizando código nativo;

2.    Algumas práticas foram utilizadas para interface visual, reutilizando view com frames e reutilização de métodos para ações de controles visuais;

3.    O projeto contém testes unitários para classes principais de regras de negócio conforme requisitos;

4.    Foi utilizado a versão Delphi 10.3 sem dependencias de componentes e/ou lib de terceiros;

5.    O relatório foi desenvolvido com a versão Fortes Report CE;

6.    O banco de dados utilizado foi o Firebird 2.5.9

7.    Disponibilizado executável do projeto na subpasta BIN.

8.    Junto ao projeto, contém um arquivo "config.ini" para parametros de acesso ao banco de dados. Caso não tenha sido configurado, o sitema tentará registrar o acesso ao banco de dados da subpasta BD do projeto.

# Detalhes do Desenvolvimento

1.  O projeto teve duração de 12 horas.

2.  Foi desenvolvido utilizando Orientação a Objetos, construindo um miniORM.

3.  Foram utilizadas técnicas com RTTI e Helpers para mapeamento de dados.

4.  Foi utilizado Firedac, com FDManager e Pooling de conexão (vide "DB.Connection").

5.  Para o controller, foi criado uma Interface "IPosto" visando separação e independencia e controle do escopo de acesso dos Models e View.


# Observações Gerais

A maioria das técnicas utilizadas para este teste foram baseadas em conceitos e técnicas minimalistas, afim de atender apenas o requisito proposto.
O objetivo foi demonstrar de forma simples porém com potencial de expansão de funcionalidades que serviriam para atender um sistema mais robusto, contendo algumas outras técnicas como paralelismo, multithread etc.

Grato,

Carlos Eduardo Paulino.
