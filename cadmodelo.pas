unit cadModelo;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, ExtCtrls, Menus,
  ComCtrls, StdCtrls, Buttons, Grids, DBGrids, TADbSource, ZDataset;

type

  { TcadModeloF }

  TcadModeloF = class(TForm)
    BitBtn1: TBitBtn;
    btnBuscarCod: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnFecharCadMod: TBitBtn;
    btnGravar: TBitBtn;
    btnImprimir: TBitBtn;
    DBGrid1: TDBGrid;
    editQryCod: TEdit;
    Label1: TLabel;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    tsPesquisa: TTabSheet;
    tsCadastro: TTabSheet;
  private

  public

  end;

var
  cadModeloF: TcadModeloF;

implementation

{$R *.lfm}

{ TcadModeloF }



end.

