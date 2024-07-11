unit buscarProdutos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  ZDataset, ZAbstractRODataset;

type

  { TbuscarProdutosF }

  TbuscarProdutosF = class(TForm)
    dsBuscarProdutos: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    qryBuscarProdutos: TZQuery;
    qryBuscarProdutoscategoria_produto_id: TZIntegerField;
    qryBuscarProdutosds_produto: TZRawStringField;
    qryBuscarProdutosdt_cadastro_produto: TZDateTimeField;
    qryBuscarProdutosobs_produto: TZRawStringField;
    qryBuscarProdutosproduto_id: TZIntegerField;
    qryBuscarProdutosstatus_produto: TZRawStringField;
    qryBuscarProdutosvl_venda_produto: TZBCDField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  buscarProdutosF: TbuscarProdutosF;

implementation

uses
  orcamento, buscarOrcItens;

{$R *.lfm}

{ TbuscarProdutosF }

procedure TbuscarProdutosF.DBGrid1DblClick(Sender: TObject);
begin
     orcamentoF.qryOrcamentoItemproduto_id.AsInteger:=qryBuscarProdutosproduto_id.AsInteger;

     orcamentoF.qryOrcamentoItemvl_unitario.AsFloat:=qryBuscarProdutosvl_venda_produto.AsFloat;

     buscarOrcItensF.DBEdit3.Enabled:=true;

     close;
end;

procedure TbuscarProdutosF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  qryBuscarProdutos.close;
end;

procedure TbuscarProdutosF.FormShow(Sender: TObject);
begin
  qryBuscarProdutos.Open;
end;

end.

