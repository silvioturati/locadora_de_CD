unit ClassMovimentos;

interface
Type
  TMovimentos = class(TObject)
  private
    aData:TDateTime;
    aCliente:Double;
    aCD:Double;
    aTipo:String;
  public
    procedure Inserir;
    procedure Alterar;
    procedure Excluir;
    procedure Salvar;
    procedure Cancelar;
    procedure Sair;
  end;

implementation

uses UnitMovimentos, ClassClientes, ClassCD, Dialogs;

procedure TMovimentos.Inserir;
begin
  UnitMovimentos.frmMovimentos.Table1.Append;
end;

Procedure TMovimentos.Alterar;
begin
  UnitMovimentos.frmMovimentos.Table1.Edit;
end;

procedure TMovimentos.Salvar;
var
   ClienteNovo: TClientes;
   CdNovo: TCD;
begin
  With UnitMovimentos.frmMovimentos Do
  begin
    ClienteNovo:= TClientes.Create;
    If Not ClienteNovo.VerificaCliente(txtCliente.Text) then
    begin
      ShowMessage('Cliente Inexistente!');
      Table1.Cancel;
      ClienteNovo.Free;
      Exit;
    end;
    If Not ClienteNovo.VerificaUsufruto(txtCliente.Text) then
    begin
      If txtTipo.Text = 'D' then
      begin
        ShowMessage('Cliente não tem CD alugado');
        Table1.Cancel;
        ClienteNovo.Free;
        Exit;
      end
    end
    else If txtTipo.Text = 'E' then
    begin
      ShowMessage('Cliente já tem CD alugado');
      Table1.Cancel;
      ClienteNovo.Free;
      Exit;
    end;

    CdNovo:= TCd.Create;
    If not CdNovo.VerificaCD(txtCD.Text) then
    begin
      ShowMessage('CD Inexistente!');
      Table1.Cancel;
      ClienteNovo.Free;
      CdNovo.Free;
      Exit;
    end;
    If Not CdNovo.VerificaPresenca(txtcd.text) then
    begin
      If txtTipo.Text = 'E' then
      begin
        ShowMessage('CD não está disponível na loja');
        Table1.Cancel;
        ClienteNovo.Free;
        CdNovo.Free;
        Exit;
      end
    end
    else If txtTipo.Text = 'D' then
    begin
      ShowMessage('CD presente na loja');
      Table1.Cancel;
      ClienteNovo.Free;
      CdNovo.Free;
      Exit;
    end;
    If txtTipo.Text = 'E' then locacao:='OK';
    Table1.Post;
    ClienteNovo.AlterarUsufruto(txtCliente.Text);
    CdNovo.AlterarPresenca(txtCD.Text);
    end;
End;

procedure TMovimentos.Excluir;
Begin
  With UnitMovimentos.frmMovimentos Do
  begin
    Table1.Delete;
    Table1.First;
  end;
End;

procedure TMovimentos.Cancelar;
begin
  UnitMovimentos.frmMovimentos.Table1.Cancel;
end;

procedure TMovimentos.Sair;
begin
  UnitMovimentos.frmMovimentos.Table1.First;
end;

end.
