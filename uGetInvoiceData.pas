unit uGetInvoiceData;

interface
uses
  System.Generics.Collections, System.Variants, System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, frxDesgn, frxVariables,FireDAC.Comp.UI, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client

;

type
  TCMInvoiceHeader = class
    private
      fInvoiceNo: integer;

    public
  end;

  TInvoiceDetail = class
  end;

  TCMInvoice = class
    private
      fHeader: ICMInvoiceHeader;
      fInvoiceNo: integer;
      fInternalInvoiceNo: integer;
      finvoiceDetails: TStrings;
    protected
    public
      constructor create(const aInternalInvoiceNo: integer);
  end;


implementation

{ TInvoice }

constructor TInvoice.create(const aInternalInvoiceNo: integer);
begin

end;

end.
