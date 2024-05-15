object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 634
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object lblInvNo: TLabel
    Left = 181
    Top = 13
    Width = 35
    Height = 15
    Caption = 'InvNo:'
  end
  object mmo1: TMemo
    Left = 24
    Top = 39
    Width = 793
    Height = 362
    Lines.Strings = (
      'mmo1')
    TabOrder = 0
  end
  object btnGetInvoicenumbers: TButton
    Left = 298
    Top = 8
    Width = 161
    Height = 25
    Caption = 'H'#228'mta faktura lista'
    TabOrder = 1
    OnClick = btnGetInvoicenumbersClick
  end
  object cbb1: TComboBox
    Left = 465
    Top = 10
    Width = 145
    Height = 23
    TabOrder = 2
    Text = 'Fakturanr att v'#228'lja'
    OnChange = cbb1Change
  end
  object btnCreateXML: TButton
    Left = 616
    Top = 8
    Width = 201
    Height = 25
    Caption = 'Skapa XML f'#246'r vald faktura'
    TabOrder = 3
    OnClick = btnCreateXMLClick
  end
  object dbgrd1: TDBGrid
    Left = 64
    Top = 480
    Width = 697
    Height = 120
    DataSource = ds2
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object edtInvno: TEdit
    Left = 222
    Top = 10
    Width = 70
    Height = 23
    TabOrder = 5
    Text = '107648'
    OnKeyPress = edtInvnoKeyPress
  end
  object mmo2: TMemo
    Left = 8
    Top = 416
    Width = 809
    Height = 58
    Lines.Strings = (
      'mmo2')
    TabOrder = 6
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
  object ds2: TDataSource
    DataSet = dmXMLInvoice.sp_BillTo
    Left = 672
    Top = 440
  end
end
