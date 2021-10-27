unit View.Bomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.ExtCtrls,

  Model.Bomba,
  Types.Posto,
  Controller.Posto;

type
  TOnAbastecer = reference to procedure;

  TFrameBomba = class(TFrame)
    pnlBomba1: TPanel;
    Label17: TLabel;
    pnlTitulo: TPanel;
    Panel4: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    lblValorTotalPagar: TLabel;
    lblPrecoLitro: TLabel;
    Label25: TLabel;
    lblValorImposto: TLabel;
    edtQtdeLitros: TSpinEdit;
    btnAbastecer: TButton;
    pnlTipoCombustivel: TPanel;
    procedure btnAbastecerClick(Sender: TObject);
    procedure edtQtdeLitrosChange(Sender: TObject);
  private
    FControlePosto  : IPosto;
    FIDBomba        : Integer;
    FOnAbastecer    : TOnAbastecer;
    FTipoCombustivel: TTipoCombustivel;

    procedure SetPosto(const APosto: IPosto);
    procedure SetIDBomba(const AIDBomba: Integer);
    procedure SetTipoCombustivel(const ATipoCombustivel: TTipoCombustivel);

    procedure ExibirValores;
    procedure AtualizarValorAPagar;
  public
    property ControlePosto  : IPosto       read FControlePosto write SetPosto;
    property IDBomba        : Integer      read FIDBomba       write SetIDBomba;
    property TipoCombustivel: TTipoCombustivel read FTipoCombustivel write SetTipoCombustivel;

    property OnAbastecer    : TOnAbastecer read FOnAbastecer   write FOnAbastecer;
  end;

implementation

{$R *.dfm}

procedure TFrameBomba.AtualizarValorAPagar;
begin
  if edtQtdeLitros.Value <= 0 then
  begin
    lblValorTotalPagar.Caption := 'R$ 0.00';
    Exit;
  end;

  lblValorTotalPagar.Caption :=
    FormatFloat('R$ 0.00',
      (ControlePosto.Posto
        .ValorCombustivelComImposto(TipoCombustivel)) * edtQtdeLitros.Value);
end;

procedure TFrameBomba.btnAbastecerClick(Sender: TObject);
begin
  ControlePosto
    .Abastecer(Self.FIDBomba, TipoCombustivel, edtQtdeLitros.Value);

  if Assigned(FOnAbastecer) then
    FOnAbastecer;
end;

procedure TFrameBomba.edtQtdeLitrosChange(Sender: TObject);
begin
  AtualizarValorAPagar;
end;

procedure TFrameBomba.ExibirValores;
begin
  lblPrecoLitro.Caption :=
    FormatFloat('R$ 0.00',
      ControlePosto.Posto
      .ValorCombustivel(TipoCombustivel));

  lblValorImposto.Caption :=
    FormatFloat('R$ 0.00',
      ControlePosto.Posto
        .ValorCombustivelComImposto(TipoCombustivel));

  AtualizarValorAPagar;
end;

{ TFrameBomba }
procedure TFrameBomba.SetIDBomba(const AIDBomba: Integer);
begin
  FIDBomba := AIDBomba;
  pnlTitulo.Caption := FControlePosto.Posto.Bombas[FIDBomba-1].Descricao;
end;

procedure TFrameBomba.SetPosto(const APosto: IPosto);
begin
  FControlePosto := APosto;
end;

procedure TFrameBomba.SetTipoCombustivel(const ATipoCombustivel: TTipoCombustivel);
begin
  FTipoCombustivel := ATipoCombustivel;
  pnlTipoCombustivel.Caption := TipoCombustivel.ToString;
  ExibirValores;
end;

end.
