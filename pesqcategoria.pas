unit pesqCategoria;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBCtrls,
  StdCtrls, Buttons, DBGrids, ZDataset, ZAbstractRODataset;

type

  { TpesqCategoriaF }

  TpesqCategoriaF = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    dsPesqCategoria: TDataSource;
    editPesqCategoriaId: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    qryPesqCategoria: TZQuery;
    qryPesqCategoriacategoria_produto_id: TZIntegerField;
    qryPesqCategoriads_categoria_produto: TZRawStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  pesqCategoriaF: TpesqCategoriaF;

implementation

uses
  produto;

{$R *.lfm}

{ TpesqCategoriaF }

procedure TpesqCategoriaF.FormCreate(Sender: TObject);
begin

end;

procedure TpesqCategoriaF.BitBtn1Click(Sender: TObject);
begin
  if editPesqCategoriaId.Text = '' then
   begin
     qryPesqCategoria.Close;
     qryPesqCategoria.SQL.Text:= 'select * from categoria_produto';
     qryPesqCategoria.Open;
   end
   else
   begin
     qryPesqCategoria.Close;
     qryPesqCategoria.SQL.Text:='select * from categoria_produto where categoria_produto_id = ' + editPesqCategoriaId.Text;
     qryPesqCategoria.Open;
   end;
end;

procedure TpesqCategoriaF.DBGrid1DblClick(Sender: TObject);
begin
  produtoF.qryProdutocategoria_produto_id.AsInteger := qryPesqCategoriacategoria_produto_id.AsInteger;
  close;
  //ou
  //produtoF.DBEdit2.text := qryPesqCategoriacategoria_produto_id.AsString;  //desse jeito é antigo
end;

procedure TpesqCategoriaF.FormShow(Sender: TObject);
begin
  qryPesqCategoria.Open;
end;

end.

