unit buscarClientes;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, DBGrids,
  ZDataset, ZAbstractRODataset;

type

  { TbuscarClientesF }

  TbuscarClientesF = class(TForm)
    dsBuscarCliente: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    qryBuscarCliente: TZQuery;
    qryBuscarClientecliente_id: TZIntegerField;
    qryBuscarClientecpf_cnpj_cliente: TZRawStringField;
    qryBuscarClientenome_cliente: TZRawStringField;
    qryBuscarClientetipo_cliente: TZRawStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  buscarClientesF: TbuscarClientesF;

implementation

uses
    orcamento;

{$R *.lfm}

{ TbuscarClientesF }

procedure TbuscarClientesF.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  qryBuscarCliente.Close;
end;

procedure TbuscarClientesF.DBGrid1DblClick(Sender: TObject);
begin
   orcamentoF.qryOrcamentocliente_id.AsInteger:=qryBuscarClientecliente_id.AsInteger;

   close;
end;

procedure TbuscarClientesF.FormShow(Sender: TObject);
begin
  qryBuscarCliente.Open;
end;

end.

