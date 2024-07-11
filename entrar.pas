unit entrar;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  ZDataset, menuPrincipal;

type

  { TentrarF }

  TentrarF = class(TForm)
    btnEntrar: TButton;
    btnSair: TButton;
    editUsuario: TEdit;
    editSenha: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    qryGenerica: TZQuery;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    function ValidaUsuario(pUsusario: String; pSenha: String): Boolean;
  private

  public

  end;

var
  entrarF: TentrarF;

implementation

{$R *.lfm}

{ TentrarF }

function TentrarF.ValidaUsuario(pUsusario: String; pSenha: String): Boolean;
begin

  if  (pUsusario <> '') AND (pSenha <> '') then
  begin
    qryGenerica.Close;
    qryGenerica.SQL.Clear;
    qryGenerica.SQL.Add('SELECT COUNT(*) AS NUMBER '+
                                   'FROM USUARIOS '+
                                   'WHERE USUARIO = ' +  QuotedStr(pUsusario) + ' ' +
                                   'AND SENHA = ' + QuotedStr(pSenha));
    qryGenerica.Open;

  if qryGenerica.FieldByName('NUMBER').AsInteger = 0 then
  Begin
      ShowMessage('Senha ou Usuário incorretos!');
      Result := False
  end
  else
      Result := True;
  end
  else
    begin
      Result := False;
      ShowMessage('Favor Preencha o(s) campo(s)!');
    end;

end;


procedure TentrarF.btnEntrarClick(Sender: TObject);
begin
   if ValidaUsuario(editUsuario.Text,editSenha.Text) = True then
   begin
     menuPrincipalF:= TmenuPrincipalF.create(Self);
     menuPrincipalF.ShowModal;
   end;
end;

procedure TentrarF.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;


end.

