object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Python4Delphi -> Crawler'
  ClientHeight = 532
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object SynEdit: TSynEdit
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 744
    Height = 318
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    Font.Quality = fqClearTypeNatural
    TabOrder = 0
    CodeFolding.GutterShapeSize = 11
    CodeFolding.CollapsedLineColor = clGrayText
    CodeFolding.FolderBarLinesColor = clGrayText
    CodeFolding.IndentGuidesColor = clGray
    CodeFolding.IndentGuides = True
    CodeFolding.ShowCollapsedLine = False
    CodeFolding.ShowHintMark = True
    UseCodeFolding = False
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Consolas'
    Gutter.Font.Style = []
    Highlighter = SynPythonSyn
    Lines.Strings = (
      'import requests'
      'from bs4 import BeautifulSoup'
      'from module_delphi import delphi_add_data'
      'from module_delphi import delphi_produto_info'
      'from module_delphi import delphi_search_info'
      'from module_delphi import delphi_add_search'
      ''
      'def get_value(node, nome, valor_default='#39#39'):    '
      '    campo = node.find(nome, class_="price-tag-fraction")'
      '    if campo is None: '
      '        return valor_default'
      '    return campo.text '
      ''
      'def get_cents(node, nome, valor_default='#39#39'):    '
      '    campo = node.find(nome, class_="price-tag-cents")'
      '    if campo is None: '
      '        return valor_default'
      '    return campo.text '
      ''
      ''
      'delphi_add_search()'
      'print('#39'Search: '#39' +  delphi_search_info.Text)'
      ''
      
        'headers = {'#39'User_Agent'#39': '#39'Mozilla/5.0 (Windows NT 6.1; Win64; x6' +
        '4; rv:25.0) Gecko/20100101 Firefox/25.0'#39'}'
      
        'page = requests.get("https://lista.mercadolivre.com.br/" + delph' +
        'i_search_info.Text + "#D[A:" + delphi_search_info.Text + "]", he' +
        'aders)'
      
        '#page = requests.get("https://lista.mercadolivre.com.br/mascara-' +
        'pff2#D[A:mascara%20pff2]", headers)'
      'soup = BeautifulSoup(page.content, "html.parser")'
      
        'for div in soup.find_all("div", class_="ui-search-result__conten' +
        't-wrapper"):'
      
        '    produto = div.find("div", class_="ui-search-item__group ui-s' +
        'earch-item__group--title").text'
      
        '    valor = get_value(div, "span") + "," +  get_cents(div, "span' +
        '")'
      
        '    #valor = div.find("span", class_="price-tag-fraction").text ' +
        '+ "," + div.find("span", class_="price-tag-cents").text'
      
        '    link = div.find("a", class_="ui-search-item__group__element ' +
        'ui-search-link")["href"]'
      
        '    if div.find("p", class_="ui-search-item__shipping ui-search-' +
        'item__shipping--free") == None:'
      '        freeShip = False'
      '    else:'
      '        freeShip = True'
      ''
      '    print('#39'Product: '#39' + produto)'
      '    print('#39'Value: '#39' + valor)'
      '    print('#39'Link: '#39' + link)'
      ''
      '    if freeShip:'
      '        print('#39'Free Shipping'#39')'
      ''
      '    delphi_produto_info.Product = produto'
      '    delphi_produto_info.Value = valor'
      '    delphi_produto_info.Link = link'
      '    delphi_produto_info.FreeShipping = freeShip'
      ''
      '    delphi_add_data()'
      ''
      '    print('#39'ID: '#39' +  str(delphi_produto_info.idcount))'
      ''
      '    print("==========================")')
    FontSmoothing = fsmNone
  end
  object pnlTop: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 744
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object buttonGetData: TBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 117
      Height = 35
      Align = alLeft
      Caption = 'Get the Data'
      TabOrder = 0
      OnClick = buttonGetDataClick
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitHeight = 33
    end
    object EditSearch: TEdit
      AlignWithMargins = True
      Left = 126
      Top = 10
      Width = 615
      Height = 21
      Margins.Top = 10
      Margins.Bottom = 10
      Align = alClient
      TabOrder = 1
      Text = 'mascara pff2'
      OnKeyDown = EditSearchKeyDown
      ExplicitLeft = 312
      ExplicitTop = 8
      ExplicitWidth = 121
      ExplicitHeight = 23
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 513
    Width = 750
    Height = 19
    Panels = <>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 371
    Width = 750
    Height = 142
    Align = alClient
    Caption = 'Output'
    TabOrder = 3
    object memOut: TMemo
      AlignWithMargins = True
      Left = 5
      Top = 20
      Width = 740
      Height = 117
      Align = alClient
      PopupMenu = PopupMenu
      ScrollBars = ssBoth
      TabOrder = 0
    end
  end
  object SynPythonSyn: TSynPythonSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 64
    Top = 96
  end
  object SynEditPythonBehaviour: TSynEditPythonBehaviour
    Editor = SynEdit
    Left = 56
    Top = 184
  end
  object PythonEngine: TPythonEngine
    IO = PythonGUIInputOutput
    Left = 352
    Top = 112
  end
  object PopupMenu: TPopupMenu
    Left = 448
    Top = 416
    object nuClear: TMenuItem
      Caption = 'Clear'
      OnClick = nuClearClick
    end
  end
  object PythonGUIInputOutput: TPythonGUIInputOutput
    UnicodeIO = True
    RawOutput = False
    Output = memOut
    Left = 352
    Top = 184
  end
  object py_module: TPythonModule
    Engine = PythonEngine
    Events = <
      item
        Name = 'delphi_add_data'
        OnExecute = DelphiProcEvents0Execute
      end
      item
        Name = 'delphi_add_search'
        OnExecute = py_moduleEvents1Execute
      end>
    ModuleName = 'module_delphi'
    Errors = <>
    Left = 480
    Top = 112
  end
  object PyDelphiWrapper: TPyDelphiWrapper
    Engine = PythonEngine
    Left = 480
    Top = 184
  end
end
