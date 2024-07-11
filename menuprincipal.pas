unit menuPrincipal;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, categoriaProdutos, cliente, produto, relatorioCliente, orcamento, relatorioProduto, relatorioOrcamento,
  relatorioCategoria, sobre;

type

  { TmenuPrincipalF }

  TmenuPrincipalF = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    menuItemOrcamento: TMenuItem;
    menuItemRelCliente: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Separator1: TMenuItem;
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure menuItemOrcamentoClick(Sender: TObject);
    procedure menuItemRelClienteClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
  private

  public

  end;

var
  menuPrincipalF: TmenuPrincipalF;

implementation

{$R *.lfm}

{ TmenuPrincipalF }

procedure TmenuPrincipalF.MenuItem2Click(Sender: TObject);
begin
   cadCategoriaProdutosF := TcadCategoriaProdutosF.Create(self);
   cadCategoriaProdutosF.showModal;
end;

procedure TmenuPrincipalF.menuItemRelClienteClick(Sender: TObject);
begin
    relatorioClienteF := TrelatorioClienteF.Create(self);
   relatorioClienteF.showModal;
end;


procedure TmenuPrincipalF.menuItemOrcamentoClick(Sender: TObject);
begin
    relatorioOrcamentoF:= TrelatorioOrcamentoF.Create(Self);
   relatorioOrcamentoF.ShowModal;
end;

procedure TmenuPrincipalF.MenuItem10Click(Sender: TObject);
begin
   orcamentoF := TorcamentoF.Create(Self);
   orcamentoF.ShowModal;
end;

procedure TmenuPrincipalF.MenuItem11Click(Sender: TObject);
begin
   relatorioProdutoF := TrelatorioProdutoF.Create(Self);
   relatorioProdutoF.ShowModal;
end;

procedure TmenuPrincipalF.MenuItem12Click(Sender: TObject);
begin
   relatorioCategoriaF := TrelatorioCategoriaF.Create(Self);
   relatorioCategoriaF.ShowModal;
end;

procedure TmenuPrincipalF.MenuItem5Click(Sender: TObject);
begin
   sobreF := TsobreF.Create(Self);
   sobreF.ShowModal;
end;

procedure TmenuPrincipalF.MenuItem6Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TmenuPrincipalF.MenuItem7Click(Sender: TObject);
begin
   clienteF := TclienteF.Create(Self);
   clienteF.ShowModal;
end;

procedure TmenuPrincipalF.MenuItem8Click(Sender: TObject);
begin
    produtoF := TprodutoF.Create(Self);
    produtoF.ShowModal;
end;

end.

