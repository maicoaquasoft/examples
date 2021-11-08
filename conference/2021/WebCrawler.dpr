program WebCrawler;

uses
  Vcl.Forms,
  fPrincipal in 'fPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  fDados in 'fDados.pas' {frmDados},
  Model.Product in 'Model.Product.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
