object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object btnCreateInvoiceXML: TButton
    Left = 24
    Top = 8
    Width = 137
    Height = 25
    Caption = 'btnCreateInvoiceXML'
    TabOrder = 0
    OnClick = btnCreateInvoiceXMLClick
  end
  object mmo1: TMemo
    Left = 24
    Top = 39
    Width = 793
    Height = 362
    Lines.Strings = (
      'mmo1')
    TabOrder = 1
  end
  object btnTest2: TButton
    Left = 280
    Top = 407
    Width = 75
    Height = 25
    Caption = 'btnTest2'
    TabOrder = 2
    OnClick = btnTest2Click
  end
  object btnGetInvoicenumbers: TButton
    Left = 176
    Top = 8
    Width = 161
    Height = 25
    Caption = 'btnGetInvoicenumbers'
    TabOrder = 3
    OnClick = btnGetInvoicenumbersClick
  end
  object cbb1: TComboBox
    Left = 343
    Top = 9
    Width = 145
    Height = 23
    TabOrder = 4
    Text = 'cbb1'
    OnChange = cbb1Change
  end
  object btnCreateXML: TButton
    Left = 560
    Top = 8
    Width = 201
    Height = 25
    Caption = 'Create XML for selected Invoice'
    TabOrder = 5
    OnClick = btnCreateXMLClick
  end
  object FDQuery1: TFDQuery
    Connection = dmXMLInvoice.con1
    SQL.Strings = (
      
        'SELECT IH.CustomerName, IVN.InvoiceNo, IH.InternalInvoiceNo FROM' +
        ' dbo.InvoiceHeader IH'
      
        'join dbo.invoiceNumber IVN ON IVN.InternalInvoiceNo = IH.Interna' +
        'lInvoiceNo'
      'WHERE IH.CustomerName like '#39'%'#39'+:name+'#39'%'#39)
    Left = 736
    Top = 80
    ParamData = <
      item
        Name = 'NAME'
        DataType = ftString
        ParamType = ptInput
        Value = 'Ringalm AS'
      end>
  end
  object ds1: TDataSource
    DataSet = dmXMLInvoice.qry_InternalFromInvno
    Left = 688
    Top = 72
  end
end
