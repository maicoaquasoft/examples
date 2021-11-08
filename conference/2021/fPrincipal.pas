unit fPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  fDados, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynEditHighlighter, SynEditCodeFolding,
  SynHighlighterPython, SynEdit, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, SynEditPythonBehaviour, PythonEngine, Vcl.Menus,
  Vcl.PythonGUIInputOutput, WrapDelphi, Model.Product, System.NetEncoding;

type
  TfrmPrincipal = class(TForm)
    SynEdit: TSynEdit;
    SynPythonSyn: TSynPythonSyn;
    pnlTop: TPanel;
    buttonGetData: TBitBtn;
    StatusBar1: TStatusBar;
    SynEditPythonBehaviour: TSynEditPythonBehaviour;
    PythonEngine: TPythonEngine;
    PopupMenu: TPopupMenu;
    nuClear: TMenuItem;
    PythonGUIInputOutput: TPythonGUIInputOutput;
    py_module: TPythonModule;
    GroupBox1: TGroupBox;
    memOut: TMemo;
    PyDelphiWrapper: TPyDelphiWrapper;
    EditSearch: TEdit;
    procedure nuClearClick(Sender: TObject);
    procedure buttonGetDataClick(Sender: TObject);
    procedure DelphiProcEvents0Execute(Sender: TObject; PSelf, Args: PPyObject;
      var Result: PPyObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure py_moduleEvents1Execute(Sender: TObject; PSelf, Args: PPyObject;
      var Result: PPyObject);
    procedure EditSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  OProdutoInfo: TProdutoInfo;
  OSearchInfo: TSearchInfo;
  OPyObject: PPyObject;
  OPyOSearch: PPyObject;

implementation

{$R *.dfm}

procedure TfrmPrincipal.buttonGetDataClick(Sender: TObject);
begin
  GetPythonEngine.ExecString(UTF8Encode(SynEdit.Text));
  frmDados.Show;
end;

procedure TfrmPrincipal.DelphiProcEvents0Execute(Sender: TObject; PSelf, Args: PPyObject; var Result: PPyObject);
begin
  frmDados.AddData(OProdutoInfo);
  OProdutoInfo.idcount := GetTickCount;
  Result:= PPyObject(GetPythonEngine.Py_True);
end;

procedure TfrmPrincipal.EditSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    buttonGetData.Click;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OProdutoInfo.Free;
  OSearchInfo.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmDados:= TfrmDados.Create(Application);

  OProdutoInfo:= TProdutoInfo.Create;
  OSearchInfo := TSearchInfo.Create;

  OPyObject:= PyDelphiWrapper.Wrap(OProdutoInfo);
  OPyOSearch:= PyDelphiWrapper.Wrap(OSearchInfo);
  py_module.SetVar('delphi_produto_info', OPyObject);
  py_module.SetVar('delphi_search_info', OPyOSearch);
  //PythonEngine.Py_DECREF(OPyObject);
end;

procedure TfrmPrincipal.nuClearClick(Sender: TObject);
begin
  memOut.Lines.Clear;
end;

procedure TfrmPrincipal.py_moduleEvents1Execute(Sender: TObject; PSelf,
  Args: PPyObject; var Result: PPyObject);
begin
  OSearchInfo.Text := TNetEncoding.URL.Encode(EditSearch.Text);
end;

end.
