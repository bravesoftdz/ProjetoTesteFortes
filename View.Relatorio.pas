unit View.Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, RLParser;

type
  TFormRelatorioAbastecimento = class(TForm)
    dsAbastecimento: TDataSource;
    cdsAbastecimento: TFDMemTable;
    cdsAbastecimentoDATA: TDateField;
    cdsAbastecimentoTANQUE: TStringField;
    cdsAbastecimentoBOMBA: TStringField;
    repAbastecimento: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLLabel3: TRLLabel;
    RLDBText1: TRLDBText;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLBand5: TRLBand;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand6: TRLBand;
    RLLabel7: TRLLabel;
    cdsAbastecimentoVALOR_TOTAL: TFloatField;
    cdsAbastecimentoID: TIntegerField;
    cdsAbastecimentoVALOR_BRUTO: TFloatField;
    cdsAbastecimentoVALOR_IMPOSTO: TFloatField;
    RLDBText5: TRLDBText;
    cdsAbastecimentoLITROS: TFloatField;
    RLDBText6: TRLDBText;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel11: TRLLabel;
    RLDBText8: TRLDBText;
    RLDBResult2: TRLDBResult;
    RLDBResult4: TRLDBResult;
  private
    procedure Imprimir(const AData: TDateTime);
  public
    class procedure Abrir(const AData: TDateTime);
  end;

const
  SQL_ABASTECIMENTO =
   ' SELECT '+
   '  A.ID, '+
   '  A.DATA, '+
   '  T.DESCRICAO AS TANQUE, '+
   '  B.DESCRICAO AS BOMBA, '+
   '  CAST(A.QTD_LITROS AS DECIMAL(9,2)) AS LITROS, '+
   '  CAST(A.VALOR_BRUTO AS DECIMAL(9,2)) AS VALOR_BRUTO, '+
   '  CAST(A.VALOR_IMPOSTO AS DECIMAL(9,2)) AS VALOR_IMPOSTO, '+
   '  CAST(A.VALOR_TOTAL AS DECIMAL(9,2)) AS VALOR_TOTAL '+
   ' FROM ABASTECIMENTOS A '+
   '   INNER JOIN TANQUES T  '+
   '     ON (T.ID = A.ID_TANQUE) '+
   '   INNER JOIN BOMBAS B '+
   '     ON (B.ID = A.ID_BOMBA) '+
   ' WHERE A.DATA >= :DATA '+
   ' ORDER BY A.DATA, 2, 3 ';

var
  FormRelatorioAbastecimento: TFormRelatorioAbastecimento;

implementation
  uses
    DB.Connection;

{$R *.dfm}

{ TFormRelatorioAbastecimento }

class procedure TFormRelatorioAbastecimento.Abrir(const AData: TDateTime);
begin
  try
    Application.CreateForm(TFormRelatorioAbastecimento, FormRelatorioAbastecimento);
    FormRelatorioAbastecimento.Imprimir(AData);
  finally
    FreeAndNil(FormRelatorioAbastecimento);
  end;
end;

procedure TFormRelatorioAbastecimento.Imprimir(const AData: TDateTime);
var
  FConnection : TFDCustomConnection;
  FData: TFDQuery;
begin
  FConnection := FDManager.AcquireConnection('DBPosto', 'MODEL');
  try
    FData := TFDQuery.Create(Self);
    FData.Connection := FConnection;
    FData.SQL.Add(SQL_ABASTECIMENTO);
    FData.ParamByName('DATA').Value := AData;
    FData.Prepare;
    FData.Open;

    cdsAbastecimento.Data := FData.Data;
    cdsAbastecimento.Open;

    repAbastecimento.PreviewModal;
  finally
    FreeAndNil(FData);
  end;
end;

end.
