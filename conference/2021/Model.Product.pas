unit Model.Product;

interface

type
  TSearchInfo = class
  private
    FText: string;
  public
    property Text: string read FText write FText;
  end;

  TProdutoInfo = class
  private
    Fproduto: string;
    Fvalor: string;
    Flink: string;
    FFreeShipping: boolean;
    Fidcount: Integer;
  public
    property Product: string read Fproduto write Fproduto;
    property Value: string read Fvalor write Fvalor;
    property Link: string read Flink write Flink;
    property FreeShipping: Boolean read FFreeShipping write FFreeShipping;
    property IdCount: Integer read Fidcount write Fidcount;
  end;

implementation

end.
