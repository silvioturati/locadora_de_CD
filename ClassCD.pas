unit ClassCD;

interface
Type
  TCD = class(TObject)
  private
    aCodDisco: Double;
    aNomeDisco: String;
    aNomeArtista: String;
    aPresenca: String;
  public
    procedure Inserir;
    procedure Alterar;
    procedure Salvar;
    procedure Excluir;
    procedure Cancelar;
    procedure Sair;
    function VerificaCD(Codigo:string): Boolean;
    function VerificaPresenca(Codigo:string):Boolean;
    procedure AlterarPresenca(Codigo:string);
  end;

implementation

uses UnitCd;

Procedure TCd.Inserir;
begin
    UnitCd.frmCd.Table1.Append;
end;

Procedure TCD.Alterar;
begin
  UnitCD.frmCD.Table1.Edit;
end;

procedure TCD.Salvar;
begin
  UnitCD.frmCD.Table1.Post;
end;

procedure TCD.Excluir;
begin
  With UnitCD.frmCD Do
   begin
     Table1.Delete;
     Table1.First;
   end;
end;

procedure TCD.Cancelar;
begin
  UnitCD.frmCD.Table1.Cancel;
end;

procedure TCD.Sair;
begin
  UnitCD.frmCd.Table1.First;
end;

function TCD.VerificaCD(Codigo:String):Boolean;
begin
  With UnitCd.frmCd Do
  begin
    If Not Table1.FindKey([Codigo]) then
      VerificaCD:=False
    else
      VerificaCD:=True;
  end;
end;

function TCd.VerificaPresenca(Codigo:String): Boolean;
Begin
  With UnitCD.frmCD Do
  begin
    Table1.Findkey([Codigo]);
    If (Table1.FieldByName('Presenca').AsString = 'N')then
      VerificaPresenca:=False
    else
      VerificaPresenca:=True;
  end;
end;

Procedure TCD.AlterarPresenca(Codigo:String);
Begin
  With UnitCD.frmCD do
  begin
    Table1.FindKey([Codigo]);
    Table1.Edit;
    If Table1.FieldByName('Presenca').AsString='N' Then
      Table1.FieldByName('Presenca').AsString:='S'
    else
      Table1.FieldByName('Presenca').AsString:='N';
    Table1.Post;
  end;
end;

end.
