unit UnitCd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Db, DBTables, Menus;

type
  TfrmCd = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Table1: TTable;
    DataSource1: TDataSource;
    txtCoddisco: TDBEdit;
    txtNomeDisco: TDBEdit;
    txtNomeArtista: TDBEdit;
    txtPresenca: TDBEdit;
    btnInserir: TButton;
    btnAlterar: TButton;
    btnSalvar: TButton;
    btnExcluir: TButton;
    DBNavigator1: TDBNavigator;
    btnCancelar: TButton;
    PopupMenu1: TPopupMenu;
    ImprimeCDs1: TMenuItem;
    ImprimeClientes1: TMenuItem;
    MovimentoporData1: TMenuItem;
    procedure btnInserirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ImprimeCDs1Click(Sender: TObject);
    procedure ImprimeClientes1Click(Sender: TObject);
    procedure MovimentoporData1Click(Sender: TObject);

private
  { Private declarations }
public
  { Public declarations }
end;

var
  frmCd: TfrmCd;

implementation

uses ClassCD, RelatClientes, unitPesqdata, RelatCD;

var
   CdNovo:TCD;

{$R *.DFM}


procedure TfrmCd.btnInserirClick(Sender: TObject);
begin
  CdNovo.Inserir;
  btnAlterar.Enabled:=False;
  btnInserir.Enabled:=False;
  btnExcluir.Enabled:=False;
  btnSalvar.Enabled :=True;
  btnCancelar.Caption:='Cancelar';
end;

procedure TfrmCd.btnAlterarClick(Sender: TObject);
begin
  CdNovo.Alterar;
  btnAlterar.Enabled:=False;
  btnInserir.Enabled:=False;
  btnExcluir.Enabled:=False;
  btnSalvar.Enabled:=True;
  btnCancelar.Caption:='Cancelar';
end;

procedure TfrmCd.btnSalvarClick(Sender: TObject);
begin
  CDNovo.Salvar;
  btnSalvar.Enabled:=False;
  btnAlterar.Enabled:=True;
  btnInserir.Enabled:=True;
  btnExcluir.Enabled:=True;
  btnCancelar.Caption:='Sair';
end;

procedure TfrmCd.btnExcluirClick(Sender: TObject);
begin
  CdNovo.Excluir;
  ShowMessage ('CD Excluído!');
end;

procedure TfrmCd.btnCancelarClick(Sender: TObject);
begin
  If (btnInserir.Enabled=False) OR (btnAlterar.Enabled=False) then
    begin
      CdNovo.Cancelar;
      btnSalvar.Enabled:=False;
      btnAlterar.Enabled:=True;
      btnInserir.Enabled:=True;
      btnExcluir.Enabled:=True;
      btnCancelar.Caption:='Sair';
    end
  else
  begin
    CdNovo.Sair;
    Close;
  end
end;

procedure TfrmCd.FormCreate(Sender: TObject);
begin
  CdNovo:=TCD.Create;
  btnSalvar.Enabled:=False;
end;

procedure TfrmCd.FormDestroy(Sender: TObject);
begin
  CdNovo.Free;
end;

procedure TfrmCd.ImprimeCDs1Click(Sender: TObject);
begin
   RelatCD.RelCD.QuickRep1.Preview;
end;

procedure TfrmCd.ImprimeClientes1Click(Sender: TObject);
begin
   RelatClientes.RelClientes.QuickRep1.Preview;
end;

procedure TfrmCd.MovimentoporData1Click(Sender: TObject);
begin
   UnitPesqData.frmPesqData.ShowModal;
   UnitPesqData.frmPesqData.Close;
end;

end.

