unit buscarOrcItens;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  DBCtrls, StdCtrls, Buttons, ZDataset, buscarProdutos;

type

  { TbuscarOrcItensF }

  TbuscarOrcItensF = class(TForm)
    btnGravarOrcItem: TBitBtn;
    btnCancOrcItem: TBitBtn;
    btnBuscarProdutos: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    procedure btnBuscarProdutosClick(Sender: TObject);
    procedure btnCancOrcItemClick(Sender: TObject);
    procedure btnGravarOrcItemClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
  private

  public

  end;

var
  buscarOrcItensF: TbuscarOrcItensF;

implementation

uses
  orcamento;

{$R *.lfm}

{ TbuscarOrcItensF }



procedure TbuscarOrcItensF.btnCancOrcItemClick(Sender: TObject);
begin
 orcamentoF.qryOrcamentoItem.Cancel;

  Close;
end;

procedure TbuscarOrcItensF.btnGravarOrcItemClick(Sender: TObject);
begin
  orcamentoF.qryOrcamentoItem.Post;

   close;
end;

procedure TbuscarOrcItensF.DBEdit3Exit(Sender: TObject);
var
   valor_total: Double;
begin
valor_total := orcamentoF.qryOrcamentoItemvl_unitario.AsFloat * orcamentoF.qryOrcamentoItemqt_produto.AsFloat;

orcamentoF.qryOrcamentoItemvl_total.AsFloat:=valor_total;
end;

procedure TbuscarOrcItensF.btnBuscarProdutosClick(Sender: TObject);
begin
   buscarProdutosF := TbuscarProdutosF.Create(Self);
   buscarProdutosF.ShowModal;
end;

end.

