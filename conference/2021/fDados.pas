unit fDados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, MidasLib,
  ShellAPI, Model.Product;

type
  TfrmDados = class(TForm)
    cdsDados: TClientDataSet;
    cdsDadosID: TAutoIncField;
    cdsDadosProduto: TStringField;
    cdsDadosValor: TCurrencyField;
    cdsDadosFreteGratis: TBooleanField;
    dbgDados: TDBGrid;
    dbnDados: TDBNavigator;
    dsDados: TDataSource;
    cdsDadosLink: TStringField;
    DBMemo1: TDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure DBMemo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function AddData(pProduct: TProdutoInfo): Boolean;
  end;

var
  frmDados: TfrmDados;

implementation

{$R *.dfm}

{ TfrmDados }

function TfrmDados.AddData(pProduct: TProdutoInfo): Boolean;
begin
  try
    cdsDados.Append;
    try
      cdsDadosProduto.AsString:= pProduct.Product;
      cdsDadosValor.AsFloat:= StrToFloat(StringReplace(pProduct.Value, '.', '', []));
      cdsDadosFreteGratis.AsBoolean:= pProduct.FreeShipping;
      cdsDadosLink.AsString:= pProduct.Link;
    finally
      cdsDados.Post;
    end;
    Result:= True;
  except
    Result:= False;
  end;
end;

procedure TfrmDados.DBMemo1Click(Sender: TObject);
begin
  ShellExecute(Self.Handle, 'open', PWideChar(cdsDadosLink.AsString), '', '', 0);
end;

procedure TfrmDados.FormCreate(Sender: TObject);
begin
  cdsDados.CreateDataSet;
end;

end.
