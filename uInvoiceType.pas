unit uInvoiceType;

interface
type
  TInvoiceType = (Approximate, CreditNote, DebitNote, Duplicate, Invoice, PrePayment, ProForma, ProFormaCreditNote, SelfBillingStatement);
const
  TInvoiceTypeString = 'Approximate, CreditNote, DebitNote, Duplicate, Invoice, PrePayment, ProForma, ProFormaCreditNote, SelfBillingStatement';
type
TCMInvoiceNo = unicodeString;
TCM_XMLString = UnicodeString;
TCMPostalCode = TCM_XMLString;
TCMCountry = TCM_XMLString;
TCMCity = TCM_XMLString;
TCMAddress = TCM_XMLString;
TCMState = TCM_XMLString;
TCMName = TCM_XMLString;
TCMCounty = TCM_XMLString;
TCMInvoiceType = TCM_XMLString;
TCMInvoiceContextType = TCM_XMLString;
TCMInvoiceDate = TCM_XMLString;
(*TCMInvoiceType = TCM_XMLString;
TCMInvoiceType = TCM_XMLString;
TCMInvoiceType = TCM_XMLString;    *)
implementation

end.
