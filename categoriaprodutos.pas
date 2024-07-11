unit categoriaProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, DBCtrls, DBGrids, ZDataset, ZAbstractRODataset, cadModelo, DB,
  dataModule;

type

  { TcadCategoriaProdutosF }

  TcadCategoriaProdutosF = class(TcadModeloF)
    dbEditDescricao: TDBEdit;
    dbEditId: TDBEdit;
    dsCategoriaProduto: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Panel4: TPanel;
    qryCategoriaProduto: TZQuery;
    qryCategoriaProdutocategoria_produto_id: TZIntegerField;
    qryCategoriaProdutods_categoria_produto: TZRawStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnBuscarCodClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharCadModClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryCategoriaProdutoNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  cadCategoriaProdutosF: TcadCategoriaProdutosF;

implementation

{$R *.lfm}

{ TcadCategoriaProdutosF }

procedure TcadCategoriaProdutosF.BitBtn1Click(Sender: TObject);
begin
   PageControl1.ActivePage := tsCadastro;

   qryCategoriaProduto.Insert;
end;

procedure TcadCategoriaProdutosF.btnBuscarCodClick(Sender: TObject);
var
  codConv: Integer;
begin
   if TryStrToInt(editQryCod.Text, codConv)  then
   begin
     qryCategoriaProduto.Close;
     qryCategoriaProduto.SQL.Text:='select * from categoria_produto where categoria_produto_id = ' + editQryCod.Text;
     qryCategoriaProduto.Open;
   end
   else
   begin
     qryCategoriaProduto.Close;
     qryCategoriaProduto.SQL.Text:= 'select * from categoria_produto';
     qryCategoriaProduto.Open;
   end;


end;

procedure TcadCategoriaProdutosF.btnCancelarClick(Sender: TObject);
begin
  qryCategoriaProduto.Cancel;

  PageControl1.ActivePage := tsPesquisa;
end;

procedure TcadCategoriaProdutosF.btnExcluirClick(Sender: TObject);
begin
  If  MessageDlg('Você tem certeza que deseja excluir o registro?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    qryCategoriaProduto.Delete;
    PageControl1.ActivePage := tsPesquisa;
  end;
end;

procedure TcadCategoriaProdutosF.btnFecharCadModClick(Sender: TObject);
begin
  cadCategoriaProdutosF.Close;
end;

procedure TcadCategoriaProdutosF.btnGravarClick(Sender: TObject);
begin
  qryCategoriaProduto.Post;

  PageControl1.ActivePage := tsPesquisa;
end;

procedure TcadCategoriaProdutosF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  qryCategoriaProduto.Close;
end;

procedure TcadCategoriaProdutosF.FormShow(Sender: TObject);
begin
  qryCategoriaProduto.Open;

  PageControl1.ActivePage := tsPesquisa;
end;

procedure TcadCategoriaProdutosF.qryCategoriaProdutoNewRecord(DataSet: TDataSet
  );
begin
   qryCategoriaProdutocategoria_produto_id.AsInteger:=  StrToInt(DataModule1.getSequence('categoria_produto_categoriaprodutoid_seq'));
end;


end.

