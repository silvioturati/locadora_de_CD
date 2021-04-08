unit ClassClientes;

interface
Type
  TClientes = class(TObject)
  private
    aCodCliente: Double;
    aNome: String;
    aEndereco: String;
    aUsufruto: String;
  public
    procedure Inserir;
    procedure Alterar;
    procedure Salvar;
    procedure Excluir;
    procedure Cancelar;
    procedure Sair;
    function VerificaCliente(Codigo:string):Boolean;
    function VerificaUsufruto(Codigo:String):Boolean;
    procedure AlterarUsufruto(Codigo:String);
  end;

implementation

uses UnitClientes;

procedure TClientes.Inserir;
begin
  UnitClientes.frmClientes.Table1.Append;
end;

procedure TClientes.Alterar;
begin
  UnitClientes.frmClientes.Table1.Edit;
end;

procedure TClientes.Excluir;
Begin
  With UnitClientes.frmClientes Do
  begin
    Table1.Delete;
    Table1.First;
  end;
End;

procedure TClientes.Salvar;
begin
  UnitClientes.frmClientes.Table1.Post;
end;

procedure TClientes.Cancelar;
begin
  UnitClientes.frmClientes.Table1.Cancel;
end;

procedure TClientes.Sair;
begin
  UnitClientes.frmClientes.Table1.First;
end;

function TClientes.VerificaCliente(Codigo: String):Boolean;
begin
  With UnitClientes.frmClientes Do
  begin
    If not Table1.FindKey([Codigo]) then
      VerificaCliente:=False
    else
      VerificaCliente:=True;
  end;
end;

function TClientes.VerificaUsufruto(Codigo: String): Boolean;
begin
  With UnitClientes.frmClientes Do
  begin
    Table1.Findkey([Codigo]);
    If (Table1.FieldByName('Usufruto').AsString = 'N') then
      VerificaUsufruto:=False
    else
      VerificaUsufruto:=True;
  end;
end;

Procedure TClientes.AlterarUsufruto(Codigo:String);
Begin
  With UnitClientes.frmClientes Do
  begin
    Table1.FindKey([Codigo]);
    Table1.Edit;
    If Table1.FieldByName('Usufruto').AsString='N' Then
      Table1.FieldByName('Usufruto').AsString:='S'
    else
      Table1.FieldByName('Usufruto').AsString:='N';
    Table1.Post;
  end;
End;

end.

