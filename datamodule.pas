unit dataModule;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection, ZDataset;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    ZConnection1: TZConnection;
    qryGenerica: TZQuery;
    procedure ZConnection1AfterConnect(Sender: TObject);
  private

  public
     function getSequence(const pNomeSequence: String): String;
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

{ TDataModule1 }

function TDataModule1.getSequence(const pNomeSequence: String): String;
begin
     Result := '';
 try
     qryGenerica.close;
     qryGenerica.SQL.Clear;
     qryGenerica.SQL.Add('SELECT NEXTVAL(' + QuotedStr(pNomeSequence) + ') AS CODIGO');
     qryGenerica.Open;
     Result := qryGenerica.FieldByName('CODIGO').AsString;
 finally
   qryGenerica.Close;
 end;
end;

procedure TDataModule1.ZConnection1AfterConnect(Sender: TObject);
begin
    ZConnection1.HostName := 'localhost';
    ZConnection1.DataBase := 'postgres';
    ZConnection1.User     := 'postgres';
    ZConnection1.Password := '1234';
    ZConnection1.Port     := 5432;
    ZConnection1.Protocol := 'postgresql';
    ZConnection1.Connected := True;
end;

end.

