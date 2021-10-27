unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.DBActns, System.Actions, Vcl.ActnList, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Samples.Spin,

  Controller.Posto,
  Types.Posto,
  View.Bomba;

type
  TFormPrincipal = class(TForm)
    pnlTitulo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    grpPosto: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtValorDiesel: TEdit;
    edtValorGasolina: TEdit;
    edtPostoImposto: TSpinEdit;
    btnImprimirMovimento: TButton;
    btnAtualizar: TButton;
    grpTanques: TGroupBox;
    GroupBox1: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    lblCapacidadeGasolina: TLabel;
    lblDisponivelGasolina: TLabel;
    btnAbastecerTanqueGasolina: TButton;
    edtLitrosGasolina: TSpinEdit;
    pgbTanque2: TProgressBar;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    lblCapacidadeDiesel: TLabel;
    lblDisponivelDiesel: TLabel;
    btnAbastecerTanqueDiesel: TButton;
    edtLitrosDiesel: TSpinEdit;
    pgbTanque1: TProgressBar;
    GroupBox3: TGroupBox;
    FrameBomba1: TFrameBomba;
    FrameBomba2: TFrameBomba;
    FrameBomba3: TFrameBomba;
    FrameBomba4: TFrameBomba;
    edtDataMovimento: TDateTimePicker;
    procedure btnAbastecerTanqueDieselClick(Sender: TObject);
    procedure btnAbastecerTanqueGasolinaClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnImprimirMovimentoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SomenteNumeros(Sender: TObject; var Key: Char);
  private
    FControlePosto: IPosto;

    function ControlePosto: IPosto;

    procedure ObterDadosPosto;
    procedure AtualizarBombas;
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation
  uses View.Relatorio;

{$R *.dfm}

procedure TFormPrincipal.AtualizarBombas;
begin
  FrameBomba1.ControlePosto   := ControlePosto;
  FrameBomba1.IDBomba         := 1;
  FrameBomba1.TipoCombustivel := tcDiesel;
  FrameBomba1.OnAbastecer     := ObterDadosPosto;

  FrameBomba2.ControlePosto   := ControlePosto;
  FrameBomba2.IDBomba         := 1;
  FrameBomba2.TipoCombustivel := tcGasolina;
  FrameBomba2.OnAbastecer     := ObterDadosPosto;

  FrameBomba3.ControlePosto   := ControlePosto;
  FrameBomba3.IDBomba         := 2;
  FrameBomba3.TipoCombustivel := tcDiesel;
  FrameBomba3.OnAbastecer     := ObterDadosPosto;

  FrameBomba4.ControlePosto   := ControlePosto;
  FrameBomba4.IDBomba         := 2;
  FrameBomba4.TipoCombustivel := tcGasolina;
  FrameBomba4.OnAbastecer     := ObterDadosPosto;
end;

procedure TFormPrincipal.btnAbastecerTanqueDieselClick(Sender: TObject);
begin
  ControlePosto.Posto.AbastecerTanque(1, edtLitrosDiesel.Value);
  ObterDadosPosto;
end;

procedure TFormPrincipal.btnAbastecerTanqueGasolinaClick(Sender: TObject);
begin
  ControlePosto.Posto.AbastecerTanque(2, edtLitrosGasolina.Value);
  ObterDadosPosto;
end;

procedure TFormPrincipal.btnAtualizarClick(Sender: TObject);
begin
  ControlePosto.Atualizar(
    StrToFloat(edtValorDiesel.Text),
    StrToFloat(edtValorGasolina.Text),
    edtPostoImposto.Value,
    edtDataMovimento.Date);

  ObterDadosPosto;
  AtualizarBombas;
end;

procedure TFormPrincipal.btnImprimirMovimentoClick(Sender: TObject);
begin
  TFormRelatorioAbastecimento.Abrir(edtDataMovimento.Date);
end;

function TFormPrincipal.ControlePosto: IPosto;
begin
  if FControlePosto = nil then
    FControlePosto := TControlePosto.New(1);

  Result := FControlePosto;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  ObterDadosPosto;
  AtualizarBombas;
end;

procedure TFormPrincipal.ObterDadosPosto;
begin
  edtValorDiesel.Text   := ControlePosto.Posto.ValorDiesel.ToString;
  edtValorGasolina.Text := ControlePosto.Posto.ValorGasolina.ToString;
  edtPostoImposto.Text  := ControlePosto.Posto.Imposto.ToString;

  lblCapacidadeDiesel.Caption := ControlePosto.Posto.Tanques[0].Capacidade.ToString;
  lblDisponivelDiesel.Caption := ControlePosto.Posto.Tanques[0].Disponivel.ToString;
  pgbTanque1.Max              := Round(ControlePosto.Posto.Tanques[0].Capacidade);
  pgbTanque1.Position         := Round(ControlePosto.Posto.Tanques[0].Disponivel);

  lblCapacidadeGasolina.Caption := ControlePosto.Posto.Tanques[1].Capacidade.ToString;
  lblDisponivelGasolina.Caption := ControlePosto.Posto.Tanques[1].Disponivel.ToString;
  pgbTanque2.Max                := Round(ControlePosto.Posto.Tanques[1].Capacidade);
  pgbTanque2.Position           := Round(ControlePosto.Posto.Tanques[1].Disponivel);
end;

procedure TFormPrincipal.SomenteNumeros(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', #44, #8]) then
    Key := #0;
end;

end.
