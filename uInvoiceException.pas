unit uInvoiceException;

interface
uses
  sysUtils
;

type
TInvoiceException = class
public
  class procedure RaiseDBError(const pmError:integer; const pmMessage: string);
end;
implementation

{ TInvoiceException }

class procedure TInvoiceException.RaiseDBError(const pmError: integer;
  const pmMessage: string);
begin
  raise Exception.CreateFmt('DBError: (%d), Message: %s', [pmError, pmMessage]);
end;

end.
