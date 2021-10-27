program Posto;

uses
  Vcl.Forms,
  View.Main in 'View.Main.pas' {FormPrincipal},
  Consts.Posto in 'Consts.Posto.pas',
  Exceptions.Posto in 'Exceptions.Posto.pas',
  Model.Base in 'Model.Base.pas',
  Model.Bomba in 'Model.Bomba.pas',
  Model.Posto in 'Model.Posto.pas',
  Model.Tanque in 'Model.Tanque.pas',
  Types.Posto in 'Types.Posto.pas',
  DB.Connection in 'DB.Connection.pas',
  Controller.Posto in 'Controller.Posto.pas',
  Model.Abastecimento in 'Model.Abastecimento.pas',
  View.Bomba in 'View.Bomba.pas' {FrameBomba: TFrame},
  View.Relatorio in 'View.Relatorio.pas' {FormRelatorioAbastecimento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
