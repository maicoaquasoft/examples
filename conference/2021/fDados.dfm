object frmDados: TfrmDados
  Left = 0
  Top = 0
  Caption = 'Data'
  ClientHeight = 441
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object dbgDados: TDBGrid
    Left = 0
    Top = 25
    Width = 594
    Height = 321
    Align = alClient
    DataSource = dsDados
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Width = 31
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Produto'
        Width = 409
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FreteGratis'
        Visible = True
      end>
  end
  object dbnDados: TDBNavigator
    Left = 0
    Top = 0
    Width = 594
    Height = 25
    DataSource = dsDados
    Align = alTop
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    AlignWithMargins = True
    Left = 3
    Top = 349
    Width = 588
    Height = 89
    Cursor = crHandPoint
    Align = alBottom
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Color = clBtnFace
    DataField = 'Link'
    DataSource = dsDados
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Courier'
    Font.Style = [fsUnderline]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    OnClick = DBMemo1Click
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 304
    Top = 224
    object cdsDadosID: TAutoIncField
      FieldName = 'ID'
    end
    object cdsDadosProduto: TStringField
      DisplayLabel = 'Product'
      FieldName = 'Produto'
      Size = 100
    end
    object cdsDadosValor: TCurrencyField
      DisplayLabel = 'Value'
      FieldName = 'Valor'
    end
    object cdsDadosFreteGratis: TBooleanField
      DisplayLabel = 'FreeShipping'
      FieldName = 'FreteGratis'
    end
    object cdsDadosLink: TStringField
      FieldName = 'Link'
      Size = 1000
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 232
    Top = 224
  end
end
