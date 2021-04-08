unit RelatCD;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TRelCD = class(TForm)
    Table1 : TTable;
    QuickRep1 : TQuickRep;
    TitleBand1 : TQRBand;
    QRLabel1 : TQRLabel;
    PageFooterBand1 : TQRBand;
    QRSysData1 : TQRSysData;
    ColumnHeaderBand1 : TQRBand;
    DetailBand1 : TQRBand;
    QRLabel2 : TQRLabel;
    QRExpr1 : TQRExpr;
    QRLabel3 : TQRLabel;
    QRExpr2 : TQRExpr;
    QRLabel4 : TQRLabel;
    QRExpr3 : TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
  private
  end;

var
  RelCD: TRelCD;

implementation

{$R *.DFM}

   end.
