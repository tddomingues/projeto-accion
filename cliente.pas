unit cliente;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  DBCtrls, ZDataset, ZAbstractRODataset, cadModelo, DB, dataModule;

type

  { TclienteF }

  TclienteF = class(TcadModeloF)
    DBComboBox1: TDBComboBox;
    dsCliente: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel4: TPanel;
    qryCliente: TZQuery;
    qryClientecliente_id: TZIntegerField;
    qryClientecpf_cnpj_cliente: TZRawStringField;
    qryClientenome_cliente: TZRawStringField;
    qryClientetipo_cliente: TZRawStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnBuscarCodClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharCadModClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qryClienteNewRecord(DataSet: TDataSet);
  private

  public

  end;

var
  clienteF: TclienteF;

implementation

{$R *.lfm}

{ TclienteF }

procedure TclienteF.FormShow(Sender: TObject);
begin
  qryCliente.Open;

  PageControl1.ActivePage := tsPesquisa;
end;

procedure TclienteF.qryClienteNewRecord(DataSet: TDataSet);
begin
  //qryCategoriaProdutocategoria_produto_id.AsInteger:=  StrToInt(DataModule1.getSequence('categoria_produto_categoriaprodutoid_seq'));

  qryClientecliente_id.AsInteger := StrToInt(DataModule1.getSequence('cliente_clienteid'));
end;

procedure TclienteF.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  qryCliente.Close;
end;

procedure TclienteF.btnFecharCadModClick(Sender: TObject);
begin
  Close;
end;

procedure TclienteF.btnGravarClick(Sender: TObject);
begin
  PageControl1.ActivePage := tsPesquisa;

  qryCliente.Post;
end;

procedure TclienteF.BitBtn1Click(Sender: TObject);
begin
  PageControl1.ActivePage := tsCadastro;

  qryCliente.Insert;
end;

procedure TclienteF.btnBuscarCodClick(Sender: TObject);
var
  codConv: Integer;
begin
  if TryStrToInt(editQryCod.Text, codConv)  then
   begin
     qryCliente.Close;
     qryCliente.SQL.Text:='select * from cliente where cliente_id = ' + editQryCod.Text;
     qryCliente.Open;
   end
   else
   begin
     qryCliente.Close;
     qryCliente.SQL.Text:= 'select * from cliente';
     qryCliente.Open;
   end;

   editQryCod.Text:='';
end;

procedure TclienteF.btnCancelarClick(Sender: TObject);
begin
  qryCliente.Cancel;
  PageControl1.ActivePage := tsPesquisa;
end;

procedure TclienteF.btnExcluirClick(Sender: TObject);
begin
   If  MessageDlg('Você tem certeza que deseja excluir o cliente?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    PageControl1.ActivePage := tsPesquisa;

    qryCliente.Delete;
  end;

end;

end.

