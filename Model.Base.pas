unit Model.Base;

interface
  uses
    System.TypInfo,
    System.Rtti,
    System.Classes,
    System.SysUtils,
    System.Variants,
    System.Generics.Collections,
    Data.DB,
    DB.Connection,
    FireDAC.Stan.Param,
    FireDAC.Stan.Intf,
    FireDAC.Comp.DataSet,
    FireDAC.Comp.Client;

type
  TTableName = class(TCustomAttribute)
  private
    FTableName : string;
  public
    constructor Create(const ATableName: string);
    property TableName : string read FTableName write FTableName;
  end;

  TAttibuteField = class(TCustomAttribute)
  private
    FFieldType  : TFieldType;
    FFieldName : string;
    FFieldSize : Integer;
    FFieldKey  : Boolean;
  public
    constructor Create(const AFieldType: TFieldType;
      const AFieldName: string;
      AFieldSize: Integer = 0;
      AFieldKey: Boolean = False);

    property FieldType : TFieldType read FFieldType write FFieldType;
    property FieldKey  : Boolean    read FFieldKey  write FFieldKey;
    property FieldName : string     read FFieldName write FFieldName;
    property FieldSize : Integer    read FFieldSize write FFieldSize;
  end;

  [Weak]
  DataArray<T> = class
    class var Items: array of T;
    procedure Append(const Value: T);
    function Count: integer;
    procedure DeleteItems;
  end;

  TObjectHelper = class helper for TObject
  public
    procedure SetValue(APropertyName: string; AValue: TValue);
  end;

  TModelBase = class
  private
    FData       : TFDMemTable;
    ModelValues : DataArray<Variant>;
    ModelTypes  : DataArray<TFieldType>;

    function GetTableName: string;

    function GetSQLSelect: string;
    function GetSQLUpdate: string;
    function GetSQLInsert: string;

    procedure SetData;
  public
    destructor Destroy; override;

    procedure Abrir(const AID: Integer);
    procedure Gravar;
    procedure Incluir;

    procedure ExecutarAposAbrir; virtual;
  end;

implementation
  uses Consts.Posto;

{ TAttibuteField }
constructor TAttibuteField.Create(const AFieldType: TFieldType;
    const AFieldName: string;
    AFieldSize: Integer = 0;
    AFieldKey: Boolean = False);
begin
  Self.FFieldType := AFieldType;
  Self.FFieldKey  := AFieldKey;
  Self.FFieldName := AFieldName;
  Self.FieldSize  := AFieldSize;
end;

{ TTableName }
constructor TTableName.Create(const ATableName: string);
begin
  Self.FTableName := ATableName;
end;

destructor TModelBase.Destroy;
begin
  if Assigned(FData) then
    FreeAndNil(FData);

  inherited;
end;

procedure TModelBase.ExecutarAposAbrir;
begin
//
end;

function TModelBase.GetSQLInsert: string;
var
  Contexto   : TRttiContext;
  Tipo       : TRttiType;
  Atributo   : TCustomAttribute;
  Propriedade: TRttiProperty;

  FieldNames,
  FieldParams : string;
begin
  try
    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(TObject(Self).ClassInfo);

    ModelValues.DeleteItems;
    ModelTypes.DeleteItems;

    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TAttibuteField then
        begin
          FieldNames  := FieldNames + TAttibuteField(Atributo).FieldName + ', ';
          FieldParams := FieldParams + ':' + TAttibuteField(Atributo).FieldName + ', ';
          ModelValues.Append(Propriedade.GetValue(Self).AsVariant);
          ModelTypes.Append(TAttibuteField(Atributo).FieldType);
        end;
      end;
    end;
  finally
    Contexto.Free;
  end;

  Result := Format(SQL_INSERT_MODEL, [
                    GetTableName,
                    Copy(FieldNames, 0, Length(FieldNames) -2),
                    Copy(FieldParams, 0, Length(FieldParams) -2)]);
end;

function TModelBase.GetSQLSelect: string;
var
  Contexto   : TRttiContext;
  Tipo       : TRttiType;
  Atributo   : TCustomAttribute;
  Propriedade: TRttiProperty;
begin
  try
    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(TObject(Self).ClassInfo);

    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TAttibuteField then
          Result := Result + TAttibuteField(Atributo).FieldName + ', ';
      end;
    end;
  finally
    Contexto.Free;
  end;

  Result := Format(SQL_SELECT_MODEL, [
                    Copy(Result, 0, Length(Result) -2),
                    GetTableName]);
end;

function TModelBase.GetSQLUpdate: string;
var
  Contexto   : TRttiContext;
  Tipo       : TRttiType;
  Atributo   : TCustomAttribute;
  Propriedade: TRttiProperty;

  KeyValue    : Variant;
  KeyFieldName: string;
begin
  try
    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(TObject(Self).ClassInfo);

    ModelValues.DeleteItems;
    ModelTypes.DeleteItems;

    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
      begin
        if Atributo is TAttibuteField then
        begin
          if TAttibuteField(Atributo).FieldKey then
          begin
            KeyFieldName := TAttibuteField(Atributo).FieldName;
            KeyValue     := Propriedade.GetValue(Self).AsVariant;
          end
          else
          begin
            Result := Result + TAttibuteField(Atributo).FieldName + ' = :' + TAttibuteField(Atributo).FieldName + ', ';
            ModelValues.Append(Propriedade.GetValue(Self).AsVariant);
            ModelTypes.Append(TAttibuteField(Atributo).FieldType);
          end;
        end;
      end;
    end;
    ModelValues.Append(KeyValue);
    ModelTypes.Append(ftInteger);
  finally
    Contexto.Free;
  end;

  Result := Format(SQL_UPDATE_MODEL, [
                    GetTableName,
                    Copy(Result, 0, Length(Result) -2)]);
end;

function TModelBase.GetTableName: string;
var
  Contexto   : TRttiContext;
  Tipo       : TRttiType;
  Atributo   : TCustomAttribute;
begin
  try
    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(TObject(Self).ClassInfo);

    for Atributo in Tipo.GetAttributes do
    begin
      if Atributo is TTableName then
      begin
        Result := TTableName(Atributo).TableName;
        Break;
      end;
    end;
  finally
    Contexto.Free;
  end;
end;

procedure TModelBase.Gravar;
var
  FConnection : TFDCustomConnection;
begin
  try
    FConnection := FDManager.AcquireConnection('DBPosto', 'MODEL');
    try
      FConnection.StartTransaction;
      FConnection.ExecSQL(GetSQLUpdate, ModelValues.Items, ModelTypes.Items);
      FConnection.Commit;
    except
      on E:Exception do
      begin
        FConnection.Rollback;
        raise Exception.Create('Erro ao tentar gravar');
      end;
    end;
  finally
    if Assigned(FConnection) then
      FreeAndNil(FConnection);
  end;
end;

procedure TModelBase.Incluir;
var
  FConnection : TFDCustomConnection;
begin
  try
    FConnection := FDManager.AcquireConnection('DBPosto', 'MODEL');
    try
      FConnection.StartTransaction;
      FConnection.ExecSQL(GetSQLInsert, ModelValues.Items, ModelTypes.Items);
      FConnection.Commit;
    except
      on E:Exception do
      begin
        FConnection.Rollback;
        raise Exception.Create('Erro ao tentar gravar');
      end;
    end;
  finally
    if Assigned(FConnection) then
      FreeAndNil(FConnection);
  end;
end;

procedure TModelBase.Abrir(const AID: Integer);
var
  FConnection : TFDCustomConnection;
  FParam: TFDParams;
begin
  try
    FParam := TFDParams.Create;
    FParam.CreateParam(ftInteger, 'ID', ptInput).Value := AID;

    FConnection := FDManager.AcquireConnection('DBPosto', 'MODEL');
    FConnection.ExecSQL(GetSQLSelect, FParam, TDataSet(FData));

    if not FData.IsEmpty then
      SetData;

  finally
    if Assigned(FParam) then
    begin
      FParam.ClearAndResetID;
      FreeAndNil(FParam);
    end;

    if Assigned(FConnection) then
      FreeAndNil(FConnection);

    ExecutarAposAbrir;
  end;
end;

procedure TModelBase.SetData;
var
  Contexto   : TRttiContext;
  Tipo       : TRttiType;
  Atributo   : TCustomAttribute;
  Propriedade: TRttiProperty;
  FField     : TField;
begin
  try
    Contexto := TRttiContext.Create;
    Tipo := Contexto.GetType(TObject(Self).ClassInfo);

    for Propriedade in Tipo.GetProperties do
    begin
      for Atributo in Propriedade.GetAttributes do
        if Atributo is TAttibuteField then
        begin
          FField := FData.FindField(TAttibuteField(Atributo).FieldName);
          if Assigned(FField) then
          begin
            Self.SetValue(Propriedade.Name, TValue.From(FField.Value));
          end;
        end;
    end;
  finally
    Contexto.Free;
  end;
end;

{ TObjectHelper }
procedure TObjectHelper.SetValue(APropertyName: string; AValue: TValue);
var
  eContext  : TRttiContext;
  eProperty : TRttiProperty;
  ePropInfo : PPropInfo;
  eValue    : TValue;
begin
  eContext := TRttiContext.create;
  try
    eProperty := eContext.GetType(Self.ClassType).GetProperty(APropertyName);

    if Assigned(eProperty) then
    begin
      case eProperty.PropertyType.TypeKind of
        tkString,
        tkChar,
        tkWChar,
        tkLString,
        tkWString,
        tkUString : eProperty.SetValue(Self, AValue.AsString);
        tkInteger,
        tkInt64   :
        begin
          if AValue.Kind in [tkString, tkChar, tkWChar, tkLString, tkWString, tkUString] then
          begin
            if AValue.AsString.IsEmpty then
              eProperty.SetValue(Self, 0)
            else
              eProperty.SetValue(Self, AValue.AsString.ToInteger);
          end
          else
            eProperty.SetValue(Self, AValue.AsInteger);
        end;
        tkFloat   :
        begin
          if AValue.ToString.IsEmpty then
            Exit;
          if CompareText(eProperty.PropertyType.Name, 'TDateTime') = 0 then
            eValue := StrToDate(AValue.AsString)
          else if CompareText(eProperty.PropertyType.Name, 'TTime') = 0 then
            eValue := StrToTime(AValue.AsString)
          else
            eValue := TValue.From(StrToFloat(AValue.AsVariant));

          eProperty.SetValue(Self, eValue);
        end;
        tkEnumeration:
        begin
          ePropInfo := GetPropInfo(Self.ClassInfo, APropertyName);
          if ePropInfo <> nil then
          begin
            if CompareText(eProperty.PropertyType.Name, 'Boolean') = 0 then
              SetOrdProp(Self, ePropInfo, AValue.AsInteger);
          end;
        end
        else
          eProperty.SetValue(Self, AValue);
      end;
    end
    else
      raise Exception.Create(APropertyName + ' inv?lido para valor de dados.' );

  finally
    eContext.Free;
  end;
end;

procedure DataArray<T>.Append(const Value: T);
begin
  SetLength(Items, length(Items) + 1);
  Items[high(Items)] := Value;
end;

function DataArray<T>.Count: integer;
begin
  Result := Length(Items);
end;

procedure DataArray<T>.DeleteItems;
begin
  if Items = nil then
    Exit;

  while Length(Items) > 0 do
    Delete(Items, 0, 1);
end;

end.
