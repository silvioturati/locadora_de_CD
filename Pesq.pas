unit Pesq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Buttons, Db, DBTables, Grids, DBGrids;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Query1: TQuery;
    GroupBox1: TGroupBox;
    optCliente: TRadioButton;
    optDisco: TRadioButton;
    BitBtn1: TBitBtn;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    AreaPesquisa: TGroupBox;
    EditOpcao: TEdit;
    btnPesquisa: TButton;
    procedure FormCreate(Sender: TObject);
    procedure optClienteClick(Sender: TObject);
    procedure optDiscoClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure EditOpcaoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  tesnome,pesqnome,inicioaspas,fimaspas:string;
implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin

label1.Caption := DateToStr(Date);
if query1.state <>dsInactive then
   query1.close;

query1.sql.clear;


query1.sql.add('SELECT NomeDisco, NomeArtista, Nome, Data FROM CD, Clientes, Movimentos WHERE IDDiscos = CodDisco and  IDCliente=CodCliente order by NomeDisco');


query1.open;

end;

procedure TForm1.optClienteClick(Sender: TObject);

begin
editOpcao.text:='';
areapesquisa.Caption := 'Digite o Cliente desejado ';
areapesquisa.Visible :=true;
EditOpcao.Visible :=true;
EditOpcao.SetFocus
end;
procedure TForm1.optDiscoClick(Sender: TObject);
begin
editOpcao.text:='';
areapesquisa.Caption := 'Digite o CD desejado ';
areapesquisa.Visible :=true;
EditOpcao.Visible :=true;
EditOpcao.SetFocus
end;

procedure TForm1.btnPesquisaClick(Sender: TObject);
begin
if areapesquisa.Caption <> 'Digite o CD desejado '  then begin
   if editopcao.text <> '' then begin
   if query1.State <> dsinactive then
      query1.close;

   query1.sql.clear;
   inicioaspas:='"%';
   fimaspas:='%"';
   tesnome:= EditOpcao.Text;
   pesqnome:='SELECT NomeDisco, NomeArtista, Nome, Data FROM CD, Clientes, Movimentos WHERE IDDiscos=coddisco and idcliente=codcliente and Nome like ';
   pesqnome:=pesqnome + inicioaspas + tesnome + fimaspas;
   query1.sql.add(pesqnome);
   query1.Open;
       end;
       end

else if areapesquisa.Caption <> 'Digite o Nome desejado '  then begin
if editopcao.text <>'' then begin
 if query1.State <> dsinactive then

       if query1.State <> dsinactive then
      query1.close;

   query1.sql.clear;
   inicioaspas:='"%';
   fimaspas:='%"';
   tesnome:= EditOpcao.Text;
   pesqnome:='SELECT NomeDisco, NomeArtista, Nome, Data FROM CD, Clientes, Movimentos WHERE IDDiscos=coddisco and idcliente=codcliente and NomeDisco like ';
   pesqnome:=pesqnome + inicioaspas + tesnome + fimaspas;
   query1.sql.add(pesqnome);
   query1.Open;
     end
 end;
   end;
procedure TForm1.EditOpcaoChange(Sender: TObject);
begin
if EditOpcao.Text <> ''  then
btnPesquisa.Enabled:=true
else
btnPesquisa.enabled:=false;
end;


end.
