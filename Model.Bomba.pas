unit Model.Bomba;

interface
  uses
    Data.DB,
    Model.Base;

type
  [TTableName('BOMBAS')]
  TBomba = class(TModelBase)
  private
    FID: Integer;
    FDescricao: string;
  public
    [TAttibuteField(ftInteger, 'ID', 1, True)]
    property ID : Integer read FID write FID;

    [TAttibuteField(ftString, 'DESCRICAO', 60)]
    property Descricao : string read FDescricao write FDescricao;
  end;

implementation


end.
