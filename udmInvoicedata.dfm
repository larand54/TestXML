object dmXMLInvoice: TdmXMLInvoice
  Height = 432
  Width = 640
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 128
    Top = 32
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 272
    Top = 32
  end
  object con1: TFDConnection
    Params.Strings = (
      'OSAuthent=Yes'
      'Database=woodsupport'
      'Server=JME-SSD\SQLEXPRESS01'
      'DriverID=MSSQL')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object sp_Invoice: TFDStoredProc
    Connection = con1
    SchemaName = 'dbo'
    StoredProcName = 'vis_INVOICE_XML'
    Left = 40
    Top = 160
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end
      item
        Position = 2
        Name = '@INVOICENO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sp_ShipTo: TFDStoredProc
    Connection = con1
    SchemaName = 'dbo'
    StoredProcName = 'vis_shipto_XML'
    Left = 136
    Top = 160
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end
      item
        Position = 2
        Name = '@INVOICENO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sp_InvoicedLoad: TFDStoredProc
    Connection = con1
    SchemaName = 'dbo'
    StoredProcName = 'InvoicedLoad'
    Left = 240
    Top = 160
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end
      item
        Position = 2
        Name = '@INVOICENO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sp_CertWood: TFDStoredProc
    Connection = con1
    SchemaName = 'dbo'
    StoredProcName = 'vis_invoice_CertText_FR'
    Left = 360
    Top = 160
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end
      item
        Position = 2
        Name = '@INVOICENO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sp_KD_Certification: TFDStoredProc
    Connection = con1
    SchemaName = 'dbo'
    StoredProcName = 'vis_invoice_KD_CertText_FR'
    Left = 464
    Top = 160
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end
      item
        Position = 2
        Name = '@INVOICENO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qry_InternalFromInvno: TFDQuery
    Connection = con1
    SQL.Strings = (
      
        'SELECT InternalInvoiceNo from dbo.InvoiceNumber where InvoiceNo=' +
        ':invno')
    Left = 40
    Top = 96
    ParamData = <
      item
        Name = 'INVNO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 100997
      end>
  end
  object sp_BillTo: TFDStoredProc
    Connection = con1
    SchemaName = 'dbo'
    StoredProcName = 'vis_INVOICE_BILLTO_XML_Address'
    Left = 40
    Top = 224
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end
      item
        Position = 2
        Name = '@InvoiceNo'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sp_Supplier: TFDStoredProc
    Connection = con1
    SchemaName = 'dbo'
    StoredProcName = 'vis_INVOICE_SUPPLIER_XML_Address'
    Left = 128
    Top = 224
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end
      item
        Position = 2
        Name = '@INVOICENO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object sp_Buyer: TFDStoredProc
    Connection = con1
    SchemaName = 'dbo'
    StoredProcName = '[dbo].[vis_Buyer_XML]'
    Left = 216
    Top = 224
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end
      item
        Position = 2
        Name = '@INVOICENO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end
