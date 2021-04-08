program Locadora;

uses
  Forms,
  UnitClientes in 'UnitClientes.pas' {frmClientes},
  ClassClientes in 'ClassClientes.pas',
  UnitCd in 'UnitCd.pas' {frmCd},
  UnitMovimentos in 'UnitMovimentos.pas' {frmMovimentos},
  UnitPrincipal in 'UnitPrincipal.pas' {frmPrincipal},
  ClassCD in 'ClassCD.pas',
  ClassMovimentos in 'ClassMovimentos.pas',
  UnitSobre in 'UnitSobre.pas' {frmSobre},
  RelatClientes in 'RelatClientes.pas' {RelClientes},
  RelatCD in 'RelatCD.pas' {RelCD},
  relatData in 'relatData.pas' {RelData},
  UnitPesqData in 'UnitPesqData.pas' {frmPesqdata},
  RelatCompro in 'RelatCompro.pas' {RelCompro},
  Pesq in 'Pesq.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmMovimentos, frmMovimentos);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.CreateForm(TfrmCd, frmCd);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TRelClientes, RelClientes);
  Application.CreateForm(TRelCD, RelCD);
  Application.CreateForm(TRelData, RelData);
  Application.CreateForm(TfrmPesqdata, frmPesqdata);
  Application.CreateForm(TRelCompro, RelCompro);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
