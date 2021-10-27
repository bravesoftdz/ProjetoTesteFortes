unit DB.Connection;

interface
  uses
    System.Classes,
    System.SysUtils,
    System.Variants,
    System.StrUtils,
    Vcl.Dialogs,
    IniFiles,
    FireDAC.Stan.Intf,
    FireDAC.Stan.Option,
    FireDAC.Stan.Error,
    FireDAC.UI.Intf,
    FireDAC.Phys.Intf,
    FireDAC.Stan.Def,
    FireDAC.Stan.Pool,
    FireDAC.Stan.Async,
    FireDAC.Phys,
    FireDAC.Phys.FB,
    FireDAC.Phys.FBDef,
    FireDAC.VCLUI.Wait,
    FireDAC.Stan.Param,
    FireDAC.DatS,
    FireDAC.DApt.Intf,
    FireDAC.DApt,
    FireDAC.VCLUI.Error,
    FireDAC.VCLUI.Login,
    FireDAC.VCLUI.Async,
    FireDAC.VCLUI.Script,
    FireDAC.Comp.UI,
    FireDAC.Phys.IBBase,
    Data.DB,
    FireDAC.Comp.DataSet,
    FireDAC.Comp.Client;

type
  TConnection = class
  public
    class function Connect: Boolean;
  end;

implementation

class function TConnection.Connect: Boolean;
var
  oParams: TStringList;
  oIniFile: TIniFile;
  sDatabaseFile: string;
begin
  if not FileExists(GetCurrentDir + '\config.ini') then
  begin
    raise Exception.Create('Arquivo "config.ini" não encontrado.');
    Exit;
  end;

  oIniFile := nil;
  oParams  := nil;
  try
    oIniFile := TIniFile.Create(GetCurrentDir + '\config.ini');

    oParams := TStringList.Create;

    oParams.Add('DriverID=FB');
    oParams.Add('SERVER='       + oIniFile.ReadString('CONNECTION', 'SERVER',        'localhost'));
    oParams.Add('SERVER_PORT='  + oIniFile.ReadString('CONNECTION', 'SERVER_PORT',   '3050'));
    oParams.Add('PROTOCOL='     + oIniFile.ReadString('CONNECTION', 'PROTOCOL',      'TCPIP'));

    sDatabaseFile := oIniFile.ReadString('CONNECTION', 'Database',      '');

    if not FileExists(sDatabaseFile) then
    begin
      sDatabaseFile := GetCurrentDir + '\DB\POSTOABC.FDB';
      oIniFile.WriteString('CONNECTION', 'Database', sDatabaseFile);
    end;

    oParams.Add('Database='     + sDatabaseFile);
    oParams.Add('User_Name='    + oIniFile.ReadString('CONNECTION', 'User_Name',     'SYSDBA'));
    oParams.Add('Password='     + oIniFile.ReadString('CONNECTION', 'Password',      'masterkey'));
    oParams.Add('PAGE_SIZE='    + oIniFile.ReadString('CONNECTION', 'PAGE_SIZE',     'ps4096'));
    oParams.Add('CHARACTER_SET='+ oIniFile.ReadString('CONNECTION', 'CHARACTER_SET', 'WIN1252'));

    if oIniFile.ReadBool('CONNECTION', 'Pooled', False) then
      oParams.Add('Pooled=True');

    FDManager.AddConnectionDef('DBPosto', 'FB', oParams);
    FDManager.Open;
    FDManager.Active := True;

    Result := True;
  finally
    oParams.Free;
    oIniFile.Free;
  end;
end;

initialization
  TConnection.Connect;

finalization

end.
