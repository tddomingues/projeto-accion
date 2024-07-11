unit orcamento;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  DBCtrls, StdCtrls, Buttons, ZDataset, ZAbstractRODataset, cadModelo, DB, dataModule, DateUtils, buscarClientes, buscarOrcItens;

type

  { TorcamentoF }

  TorcamentoF = class(TcadModeloF)
    btnAddOrcamentoItem: TBitBtn;
    btnExcluirOrcamento: TBitBtn;
    btnAddCliente: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBGrid2: TDBGrid;
    dsOrcamentoItem: TDataSource;
    dsOrcamento: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    qryOrcamento: TZQuery;
    qryOrcamentocliente_id: TZIntegerField;
    qryOrcamentodt_orcamento: TZDateTimeField;
    qryOrcamentodt_validade_orcamento: TZDateTimeField;
    qryOrcamentoItemorcamento_id: TZIntegerField;
    qryOrcamentoItemorcamento_item_id: TZIntegerField;
    qryOrcamentoItemproduto_id: TZIntegerField;
    qryOrcamentoItemqt_produto: TZBCDField;
    qryOrcamentoItemvl_total: TZBCDField;
    qryOrcamentoItemvl_unitario: TZBCDField;
    qryOrcamentoorcamento_id: TZIntegerField;
    qryOrcamentovl_total_orcamento: TZBCDField;
    qryOrcamentoItem: TZQuery;
    qryGenerica: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnAddClienteClick(Sender: TObject);
    procedure btnAddOrcamentoItemClick(Sender: TObject);
    procedure btnBuscarCodClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnExcluirOrcamentoClick(Sender: TObject);
    procedure btnFecharCadModClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject;
    var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AbreOrcItens(orcamentoid: Integer);
    procedure PageControl1Change(Sender: TObject);
    procedure qryOrcamentoItemAfterDelete(DataSet: TDataSet);
    procedure qryOrcamentoItemAfterPost(DataSet: TDataSet);
    procedure somarVTotalOrcItens;
  private

  public

  end;

var
  orcamentoF: TorcamentoF;

implementation

{$R *.lfm}

{ TorcamentoF }

procedure TorcamentoF.somarVTotalOrcItens;
var
  VTotalOrcItens: Double;
begin

   if not (qryOrcamentoItem.State in [dsEdit, dsInsert]) then
     qryOrcamento.Edit;

  if not (qryOrcamentoItem.State in [dsEdit, dsInsert]) then
     qryOrcamento.Edit;

  VTotalOrcItens:=0;

  try
    qryOrcamentoItem.First;
    while not qryOrcamentoItem.EOF do
    begin
      VTotalOrcItens:=VTotalOrcItens + qryOrcamentoItem.FieldByName('vl_total').AsFloat;
      qryOrcamentoItem.next;
    end;
  finally
    qryOrcamentovl_total_orcamento.AsFloat:=VTotalOrcItens;
  end;

end;

procedure TorcamentoF.AbreOrcItens(orcamentoid : Integer);
begin
  if orcamentoid <> 0 then
  begin
      qryOrcamentoItem.Close;
      qryOrcamentoItem.SQL.Clear;
      qryOrcamentoItem.SQL.Add(
                      'SELECT '+
                      'orcamento_item_id, '+
                      'orcamento_id, '+
                      'produto_id, '+
                      'qt_produto, '+
                      'vl_unitario, '+
                      'vl_total '+
                      'FROM orcamento_item ' +
                      'WHERE orcamento_id = '+ inttostr(orcamentoid) + ' ' +
                      'ORDER BY orcamento_id');
       qryOrcamentoItem.Open;
  end;
end;

procedure TorcamentoF.PageControl1Change(Sender: TObject);
begin
   AbreOrcItens(qryOrcamentoorcamento_id.AsInteger);
end;

procedure TorcamentoF.qryOrcamentoItemAfterDelete(DataSet: TDataSet);
begin
  if qryOrcamentoItem.IsEmpty then
     Exit;
  somarVTotalOrcItens;
end;

procedure TorcamentoF.qryOrcamentoItemAfterPost(DataSet: TDataSet);
begin
  if qryOrcamentoItem.IsEmpty then
     Exit;
  somarVTotalOrcItens;
end;

procedure TorcamentoF.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  qryOrcamento.Close;
end;

procedure TorcamentoF.DBGrid1DblClick(Sender: TObject);
begin
  AbreOrcItens(qryOrcamentoorcamento_id.AsInteger);

  PageControl1.ActivePage := tsCadastro;

end;

procedure TorcamentoF.BitBtn1Click(Sender: TObject);
begin
  qryOrcamentoItem.SQL.Clear;

  qryOrcamento.Insert;
  PageControl1.ActivePage := tsCadastro;

  qryOrcamentoorcamento_id.AsInteger:=StrToInt(DataModule1.getSequence('orcamento_orcamentoid_seq'));

  qryOrcamentodt_orcamento.AsString:=FormatDateTime('dd/mm/yyyy', now);
  qryOrcamentodt_validade_orcamento.AsString:=FormatDateTime('dd/mm/yyyy', IncDay(now, 5));

  btnAddCliente.Enabled:=true;
  qryOrcamentovl_total_orcamento.AsInteger:=0;

end;

procedure TorcamentoF.btnAddClienteClick(Sender: TObject);
begin
  buscarClientesF := TbuscarClientesF.Create(Self);
   buscarClientesF.ShowModal;
end;

procedure TorcamentoF.btnAddOrcamentoItemClick(Sender: TObject);
begin

  qryOrcamentoItem.Insert;

  //qryClientecliente_id.AsInteger := StrToInt(DataModule1.getSequence('cliente_clienteid'));

   qryOrcamentoItemorcamento_item_id.AsInteger:=StrToInt(DataModule1.getSequence('orcamento_item_seq'));
   qryOrcamentoItemorcamento_id.AsInteger:=qryOrcamentoorcamento_id.AsInteger;

   buscarOrcItensF := TbuscarOrcItensF.Create(Self);
   buscarOrcItensF.ShowModal;
end;

procedure TorcamentoF.btnBuscarCodClick(Sender: TObject);
var
  codConv: Integer;
begin
  if TryStrToInt(editQryCod.Text, codConv)  then
   begin
     qryOrcamento.Close;
     qryOrcamento.SQL.Text:='select * from orcamento where orcamento_id = ' + editQryCod.Text;
     qryOrcamento.Open;
   end
   else
   begin
     qryOrcamento.Close;
     qryOrcamento.SQL.Text:= 'select * from orcamento';
     qryOrcamento.Open;
   end;
end;

procedure TorcamentoF.btnCancelarClick(Sender: TObject);
begin
   PageControl1.ActivePage := tsPesquisa;
end;

procedure TorcamentoF.btnExcluirClick(Sender: TObject);
begin

  If  MessageDlg('Você tem certeza que deseja excluir o orçamento (itens relacionados ao orçamento serão excluidos)?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    If not (qryOrcamentoItem.IsEmpty) then
    begin
       qryGenerica.Close;
       qryGenerica.SQL.Text :=
          'DELETE FROM ORCAMENTO_ITEM WHERE ORCAMENTO_ID = ' + qryOrcamentoorcamento_id.AsString;
       qryGenerica.ExecSQL;
    end;

    qryOrcamento.Delete;
    PageControl1.ActivePage := tsPesquisa;
  end;


end;

procedure TorcamentoF.btnExcluirOrcamentoClick(Sender: TObject);
begin

  If  MessageDlg('Você tem certeza que deseja excluir o item?', mtConfirmation,[mbyes,mbno],0)= mryes then
  begin
    qryOrcamentoItem.Delete;
  end;
end;

procedure TorcamentoF.btnFecharCadModClick(Sender: TObject);
begin
  close;
end;

procedure TorcamentoF.btnGravarClick(Sender: TObject);
begin
  qryOrcamento.Post;
  PageControl1.ActivePage := tsPesquisa;
end;

procedure TorcamentoF.FormShow(Sender: TObject);
begin
  qryOrcamento.Open;

  PageControl1.ActivePage := tsPesquisa;
end;

end.

