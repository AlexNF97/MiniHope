object DM: TDM
  Height = 397
  Width = 537
  object ADOConnect: TOraSession
    Username = 'factory_hope'
    Server = 'ORAS'
    Connected = True
    LoginPrompt = False
    Left = 256
    Top = 8
    EncryptedPassword = '97FF90FF8FFF9AFF'
  end
  object QueryInvoice: TOraQuery
    Session = ADOConnect
    SQL.Strings = (
      'select '
      
        '      case when ia.is_mdlp = 1 then '#39#1052#1072#1088#1082#39' else '#39#1053#1077#1084#1072#1088#1082#39' end as ' +
        #1055#1088#1080#1079#1085#1072#1082','
      
        '      case when ia.inet_zakaz = 1 then '#39#1048#1085#1077#1090'-'#1079#1072#1082#1072#1079#39' end as '#1048#1085#1090#1077#1088 +
        #1085#1077#1090'_'#1079#1072#1082#1072#1079','
      '      case '
      
        '        when ia.completed is null and ia.is_connect = 0 then '#39#1053#1077 +
        ' '#1087#1088#1080#1074#1103#1079#1072#1085#1072#39' '
      
        '        when ia.completed = 1 and ia.is_connect = 0 then '#39#1055#1088#1080#1074#1103#1079 +
        #1072#1085#1072#39
      
        '        when ia.completed is null and ia.is_connect = 1 then '#39#1047#1072 +
        #1075#1088#1091#1078#1077#1085#1072#39
      '      end as '#1057#1090#1072#1090#1091#1089','
      '      a1.name as Provider,'
      '      ia.doc_number,'
      '      ia.income_date,'
      '      ia.summa_doc,'
      '      ia.summa_nds,'
      '      ia.id_zakaz,'
      '      a2.name as Apteka_GP,'
      '      ia.mess'
      'from income_acts ia'
      'left join agents a1 on ia.id_agent = a1.id_agent'
      'left join agents a2 on ia.id_agent_gp = a2.id_agent'
      'where ia.income_date between :date1 and :date2'
      'order by  6')
    Left = 40
    Top = 192
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date1'
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'date2'
        Value = nil
      end>
    object QueryInvoiceПРИЗНАК: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082
      DisplayWidth = 60
      FieldName = #1055#1056#1048#1047#1053#1040#1050
      Size = 6
    end
    object QueryInvoiceИНТЕРНЕТ_ЗАКАЗ: TStringField
      DisplayLabel = #1048#1085#1090#1077#1088#1085#1077#1090' '#1079#1072#1082#1072#1079
      DisplayWidth = 89
      FieldName = #1048#1053#1058#1045#1056#1053#1045#1058'_'#1047#1040#1050#1040#1047
      FixedChar = True
      Size = 10
    end
    object QueryInvoiceСТАТУС: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 70
      FieldName = #1057#1058#1040#1058#1059#1057
      Size = 12
    end
    object QueryInvoicePROVIDER: TStringField
      DisplayLabel = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      DisplayWidth = 234
      FieldName = 'PROVIDER'
      Size = 80
    end
    object QueryInvoiceDOC_NUMBER: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
      DisplayWidth = 190
      FieldName = 'DOC_NUMBER'
      Size = 50
    end
    object QueryInvoiceINCOME_DATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1075#1088#1091#1079#1082#1080
      DisplayWidth = 104
      FieldName = 'INCOME_DATE'
      Required = True
    end
    object QueryInvoiceSUMMA_DOC: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 66
      FieldName = 'SUMMA_DOC'
    end
    object QueryInvoiceSUMMA_NDS: TFloatField
      DisplayLabel = #1053#1044#1057
      DisplayWidth = 58
      FieldName = 'SUMMA_NDS'
    end
    object QueryInvoiceID_ZAKAZ: TFloatField
      DisplayLabel = #1050#1086#1076' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 55
      FieldName = 'ID_ZAKAZ'
      Required = True
    end
    object QueryInvoiceAPTEKA_GP: TStringField
      DisplayLabel = #1040#1087#1090#1077#1082#1072' '#1043#1055
      DisplayWidth = 267
      FieldName = 'APTEKA_GP'
      Size = 80
    end
    object QueryInvoiceMESS: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 60
      FieldName = 'MESS'
      Size = 500
    end
  end
  object DSInvoice: TOraDataSource
    DataSet = QueryInvoice
    Left = 88
    Top = 192
  end
  object QueryInvoiceBody: TOraQuery
    Session = ADOConnect
    SQL.Strings = (
      'select'
      '    case when ii.is_mark = 1 then '#39#1052#1072#1088#1082#39' end as '#1055#1088#1080#1079#1085#1072#1082','
      
        '    case when ii.is_connect = 1 or ii.is_connect = 0 then '#39#1055#1088#1080#1074#1103 +
        #1079#1072#1085#1086#39' else '#39#1053#1077' '#1087#1088#1080#1074#1103#1079#39' end as '#1057#1090#1072#1090#1091#1089','
      '    ii.name_good      as '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077','
      '    g.name_good       as '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'_'#1085#1072#1096#1077','
      '    ii.name_firm      as '#1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100','
      '    fp.firm_name      as '#1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100'_'#1085#1072#1096#1077','
      '    ii.name_country   as '#1057#1090#1088#1072#1085#1072','
      '    ii.sum_nds        as '#1057#1091#1084#1084#1072'_'#1053#1044#1057','
      '    ii.quantity       as '#1050#1086#1083'_'#1074#1086','
      '    ii.price_out      as '#1062#1077#1085#1072','
      '    ii.sum_out        as '#1057#1091#1084#1084#1072','
      '    ii.proc_nds       as '#1053#1044#1057','
      '    ii.price_reestr   as '#1062#1077#1085#1072#1043#1056','
      '    ii.series         as '#1057#1077#1088#1080#1103','
      '    ii.best_series    as '#1043#1086#1076#1077#1085'_'#1076#1086','
      '    ii.code_ean13     as '#1064#1090#1088#1080#1093#1082#1086#1076','
      '    ii.price_producer as '#1062#1077#1085#1072'_'#1087#1088#1086#1080#1079#1074','
      '    ii.gtin           as GTIN,'
      '    ii.date_issue     as '#1044#1072#1090#1072'_'#1080#1079#1075#1086#1090#1086#1074
      'from income_item ii'
      'left join goods g on g.id_good = ii.id_good'
      'left join firm_producer fp on fp.id_firm = ii.id_firm'
      'where id_zakaz = :zakaz'
      'order by 3')
    Left = 40
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'zakaz'
        Value = nil
      end>
    object QueryInvoiceBodyПРИЗНАК: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082
      DisplayWidth = 15
      FieldName = #1055#1056#1048#1047#1053#1040#1050
      FixedChar = True
      Size = 4
    end
    object QueryInvoiceBodyСТАТУС: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 20
      FieldName = #1057#1058#1040#1058#1059#1057
      FixedChar = True
      Size = 9
    end
    object QueryInvoiceBodyНАИМЕНОВАНИЕ: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
      Size = 250
    end
    object QueryInvoiceBodyНАИМЕНОВАНИЕ_НАШЕ: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'('#1085#1072#1096#1077')'
      DisplayWidth = 50
      FieldName = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045'_'#1053#1040#1064#1045
      Size = 231
    end
    object QueryInvoiceBodyПРОИЗВОДИТЕЛЬ: TStringField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      DisplayWidth = 50
      FieldName = #1055#1056#1054#1048#1047#1042#1054#1044#1048#1058#1045#1051#1068
      Size = 150
    end
    object QueryInvoiceBodyПРОИЗВОДИТЕЛЬ_НАШЕ: TStringField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100'('#1085#1072#1096#1077')'
      DisplayWidth = 50
      FieldName = #1055#1056#1054#1048#1047#1042#1054#1044#1048#1058#1045#1051#1068'_'#1053#1040#1064#1045
      Size = 150
    end
    object QueryInvoiceBodyСТРАНА: TStringField
      DisplayLabel = #1057#1090#1088#1072#1085#1072
      DisplayWidth = 30
      FieldName = #1057#1058#1056#1040#1053#1040
      Size = 80
    end
    object QueryInvoiceBodyСУММА_НДС: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1053#1044#1057
      DisplayWidth = 20
      FieldName = #1057#1059#1052#1052#1040'_'#1053#1044#1057
    end
    object QueryInvoiceBodyКОЛ_ВО: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = #1050#1054#1051'_'#1042#1054
    end
    object QueryInvoiceBodyЦЕНА: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = #1062#1045#1053#1040
    end
    object QueryInvoiceBodyСУММА: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = #1057#1059#1052#1052#1040
    end
    object QueryInvoiceBodyНДС: TFloatField
      DisplayWidth = 5
      FieldName = #1053#1044#1057
    end
    object QueryInvoiceBodyЦЕНАГР: TFloatField
      DisplayLabel = #1062#1077#1085#1072#1043#1056
      FieldName = #1062#1045#1053#1040#1043#1056
    end
    object QueryInvoiceBodyСЕРИЯ: TStringField
      DisplayLabel = #1057#1077#1088#1080#1103
      DisplayWidth = 20
      FieldName = #1057#1045#1056#1048#1071
      Size = 150
    end
    object QueryInvoiceBodyГОДЕН_ДО: TDateTimeField
      DisplayLabel = #1043#1086#1076#1077#1085
      FieldName = #1043#1054#1044#1045#1053'_'#1044#1054
    end
    object QueryInvoiceBodyШТРИХКОД: TStringField
      DisplayLabel = #1064#1090#1088#1080#1093'-'#1082#1086#1076
      DisplayWidth = 15
      FieldName = #1064#1058#1056#1048#1061#1050#1054#1044
      Size = 25
    end
    object QueryInvoiceBodyЦЕНА_ПРОИЗВ: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1088#1086#1080#1079#1074
      FieldName = #1062#1045#1053#1040'_'#1055#1056#1054#1048#1047#1042
    end
    object QueryInvoiceBodyGTIN: TStringField
      DisplayWidth = 15
      FieldName = 'GTIN'
      Size = 100
    end
    object QueryInvoiceBodyДАТА_ИЗГОТОВ: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074
      FieldName = #1044#1040#1058#1040'_'#1048#1047#1043#1054#1058#1054#1042
    end
  end
  object DSInvoiceBody: TOraDataSource
    DataSet = QueryInvoiceBody
    Left = 88
    Top = 240
  end
  object QueryProvider: TOraQuery
    Session = ADOConnect
    SQL.Strings = (
      'select'
      '          name "'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077'",'
      '          id_agent "'#1050#1086#1076'",'
      '          u.user_real_name "'#1052#1077#1085#1077#1076#1078#1077#1088'"'
      'from agents a'
      'join users u on u.id_user = a.id_manager order by 1')
    Left = 136
    Top = 192
    object QueryProviderНаименование: TStringField
      DisplayWidth = 80
      FieldName = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Size = 80
    end
    object QueryProviderКод: TFloatField
      FieldName = #1050#1086#1076
      Required = True
    end
    object QueryProviderМенеджер: TStringField
      DisplayWidth = 40
      FieldName = #1052#1077#1085#1077#1076#1078#1077#1088
      Size = 60
    end
  end
  object DSProvider: TOraDataSource
    DataSet = QueryProvider
    Left = 136
    Top = 240
  end
  object QueryRelease: TOraQuery
    Session = ADOConnect
    SQL.Strings = (
      'select '
      '      case'
      '        when a.type_edo = 0 then '#39#1058#1077#1085#1079#1086#1088'/'#1057#1041#1048#1057#39
      '        when a.type_edo = 1 then '#39#1050#1086#1085#1090#1091#1088'/'#1044#1080#1072#1076#1086#1082#39
      '        when a.type_edo = -1 then '#39'-'#39
      '      end as '#1069#1044#1054','
      
        '      ot.name                                                   ' +
        '         as '#1058#1080#1087','
      
        '      o.order_date                                              ' +
        '         as '#1044#1072#1090#1072'_'#1089#1095#1105#1090#1072','
      
        '      o.order_number                                            ' +
        '         as '#1053#1086#1084#1077#1088','
      
        '      cast(o.order_number_index as varchar2(3))                 ' +
        '         as '#1048#1085#1076#1077#1082#1089','
      
        '      o.order_zakaz                                             ' +
        '         as '#1047#1072#1082#1072#1079','
      
        '      a.name                                                    ' +
        '         as '#1040#1075#1077#1085#1090','
      
        '      d.sum_pay                                                 ' +
        '         as '#1057#1091#1084#1084#1072','
      
        '      d.sum_nds                                                 ' +
        '         as '#1053#1044#1057','
      
        '      (select count(id_item) from orders_item where id_order=o.i' +
        'd_order) as NN_'#1089#1090#1088#1086#1082','
      
        '      o.date_create                                             ' +
        '         as '#1057#1086#1079#1076#1072#1085','
      
        '      u.user_real_name                                          ' +
        '         as '#1054#1087#1077#1088#1072#1090#1086#1088','
      
        '      o.date_and_time_send_mail                                 ' +
        '         as '#1044#1072#1090#1072'_'#1076#1086#1089#1090#1072#1074','
      
        '      u1.user_real_name                                         ' +
        '         as '#1052#1077#1085#1077#1076#1078#1077#1088','
      
        '      a1.name                                                   ' +
        '         as '#1040#1075#1077#1085#1090'_'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100','
      
        '      o.id_order                                                ' +
        '         as Id_order,'
      
        '      o.id_document                                             ' +
        '         as '#1050#1086#1076'_'#1076#1086#1082#1091#1084#1077#1085#1090#1072','
      
        '      o.id_firm                                                 ' +
        '         as '#1057#1082#1083#1072#1076','
      
        '      o.message                                                 ' +
        '         as '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077','
      '      case'
      
        '      /*'#1041#1048#1056#1070#1047#1054#1042#1067#1049'*/when o.is_commited = 1 then '#39#1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#39'   ' +
        ' '
      
        '      /*'#1047#1045#1051#1045#1053#1067#1049'*/when o.is_ready=0 and o.is_ready_status=0 then ' +
        #39#1042' '#1088#1072#1073#1086#1090#1077' '#1091' '#1086#1087#1077#1088#1072#1090#1086#1088#1072#39
      
        '      /*'#1050#1056#1040#1057#1053#1067#1049'*/when o.is_ready=1 and o.is_ready_status=0 then ' +
        #39#1042' '#1088#1072#1073#1086#1090#1077' '#1085#1072' '#1089#1082#1083#1072#1076#1077#39
      
        '      /*'#1054#1056#1040#1053#1046#1042#1049'*/when o.is_ready = 1 and o.is_ready_status = 10 ' +
        'then '#39#1042' '#1088#1072#1073#1086#1090#1077' ('#1074#1086#1079#1074#1088#1072#1090')'#39
      
        '      /*'#1054#1056#1040#1053#1046#1042#1049'*/when o.is_ready = 1 and o.is_ready_status = 11 ' +
        'then '#39#1042' '#1088#1072#1073#1086#1090#1077' ('#1074#1086#1079#1074#1088#1072#1090')'#39
      
        '      /*'#1054#1056#1040#1053#1046#1042#1049'*/when o.is_ready = 1 and o.is_ready_status = 12 ' +
        'then '#39#1042' '#1088#1072#1073#1086#1090#1077' ('#1074#1086#1079#1074#1088#1072#1090')'#39
      
        '      /*'#1054#1056#1040#1053#1046#1042#1049'*/when o.is_ready = 1 and o.is_ready_status = 13 ' +
        'then '#39#1042' '#1088#1072#1073#1086#1090#1077' ('#1074#1086#1079#1074#1088#1072#1090')'#39
      
        '      /*'#1054#1056#1040#1053#1046#1042#1049'*/when o.is_ready=1 and o.is_ready_status=2 then ' +
        #39#1054#1090#1087#1088#1072#1074#1083#1077#1085' '#1074' '#1088#1072#1073#1086#1090#1091' '#1085#1072' '#1089#1082#1083#1072#1076#39
      
        '      /*'#1043#1054#1051#1059#1041#1054#1049'*/when o.is_ready=1 and o.is_ready_status=3 then ' +
        #39#1050#1086#1085#1090#1088#1086#1083#1100' '#1079#1072#1074#1077#1088#1096#1105#1085#39
      
        '      /*'#1057#1048#1056#1045#1053#1045#1042#1067#1049'*/when o.is_ready=1 and o.is_ready_status=4 the' +
        'n '#39#1054#1073#1088#1072#1073#1086#1090#1082#1072' '#1085#1072' '#1096#1077#1076#1091#1083#1083#1077#1088#1077#39
      
        '      /*'#1057#1048#1053#1048#1049'*/when o.is_ready=1 and o.is_ready_status=5 then '#39#1055 +
        #1086#1076#1075#1086#1090#1086#1074#1083#1077#1085' '#1082' '#1087#1077#1095#1072#1090#1080#39
      
        '      /*'#1046#1045#1051#1058#1067#1049'*/when o.is_commited = 0 and o.is_ready=2 and o.is' +
        '_ready_status=5 then '#39#1042#1089#1105' '#1075#1086#1090#1086#1074#1086', '#1076#1072#1083#1100#1096#1077' '#1092#1080#1082#1089#1072#1094#1080#1103#39
      '      end as '#1057#1090#1072#1090#1091#1089'1'
      'from orders o'
      'join agents a       on a.id_agent = o.id_agent'
      'join documents d    on d.id_document = o.id_document'
      'join users u        on u.id_user = o.id_user'
      'left join orders_type ot on ot.id_order_type = o.id_order_type'
      'left join users u1  on u1.id_user = a.id_manager'
      'left join agents a1 on a1.id_agent = o.id_agent_recipient'
      'where o.order_date between :datep and :datef'
      'order by 6')
    Left = 376
    Top = 40
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'datep'
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'datef'
        Value = nil
      end>
    object QueryReleaseЭДО: TStringField
      FieldName = #1069#1044#1054
      Size = 13
    end
    object QueryReleaseДАТА_СЧЁТА: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1095#1105#1090#1072
      FieldName = #1044#1040#1058#1040'_'#1057#1063#1025#1058#1040
      Required = True
    end
    object QueryReleaseНОМЕР: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = #1053#1054#1052#1045#1056
    end
    object QueryReleaseИНДЕКС: TStringField
      DisplayLabel = #8470
      DisplayWidth = 2
      FieldName = #1048#1053#1044#1045#1050#1057
      Size = 3
    end
    object QueryReleaseЗАКАЗ: TFloatField
      DisplayLabel = #8470' '#1079#1072#1082#1072#1079#1072
      FieldName = #1047#1040#1050#1040#1047
    end
    object QueryReleaseАГЕНТ: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090
      FieldName = #1040#1043#1045#1053#1058
      Size = 80
    end
    object QueryReleaseСУММА: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 13
      FieldName = #1057#1059#1052#1052#1040
    end
    object QueryReleaseНДС: TFloatField
      DisplayWidth = 13
      FieldName = #1053#1044#1057
    end
    object QueryReleaseNN_СТРОК: TFloatField
      DisplayLabel = 'NN_'#1089#1090#1088#1086#1082
      FieldName = 'NN_'#1057#1058#1056#1054#1050
    end
    object QueryReleaseСОЗДАН: TDateTimeField
      DisplayLabel = #1057#1086#1079#1076#1072#1085
      FieldName = #1057#1054#1047#1044#1040#1053
    end
    object QueryReleaseОПЕРАТОР: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1090#1086#1088
      FieldName = #1054#1055#1045#1056#1040#1058#1054#1056
      Size = 60
    end
    object QueryReleaseДАТА_ДОСТАВ: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1076#1086#1089#1090#1072#1074
      FieldName = #1044#1040#1058#1040'_'#1044#1054#1057#1058#1040#1042
    end
    object QueryReleaseМЕНЕДЖЕР: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 35
      FieldName = #1052#1045#1053#1045#1044#1046#1045#1056
      Size = 60
    end
    object QueryReleaseАГЕНТ_ПОЛУЧАТЕЛЬ: TStringField
      DisplayLabel = #1040#1075#1077#1085#1090' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 35
      FieldName = #1040#1043#1045#1053#1058'_'#1055#1054#1051#1059#1063#1040#1058#1045#1051#1068
      Size = 80
    end
    object QueryReleaseID_ORDER: TFloatField
      DisplayWidth = 20
      FieldName = 'ID_ORDER'
      Required = True
    end
    object QueryReleaseКОД_ДОКУМЕНТА: TFloatField
      DisplayLabel = #1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      DisplayWidth = 20
      FieldName = #1050#1054#1044'_'#1044#1054#1050#1059#1052#1045#1053#1058#1040
      Required = True
    end
    object QueryReleaseСКЛАД: TFloatField
      DisplayLabel = #1057#1082#1083#1072#1076
      FieldName = #1057#1050#1051#1040#1044
      Required = True
    end
    object QueryReleaseПРИМЕЧАНИЕ: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
      Size = 500
    end
    object QueryReleaseСТАТУС1: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 25
      FieldName = #1057#1058#1040#1058#1059#1057'1'
      Size = 27
    end
    object QueryReleaseТИП: TStringField
      DisplayLabel = #1058#1080#1087
      DisplayWidth = 25
      FieldName = #1058#1048#1055
      Size = 30
    end
  end
  object DSRelease: TOraDataSource
    DataSet = QueryRelease
    Left = 440
    Top = 40
  end
  object QueryReleaseBody: TOraQuery
    Session = ADOConnect
    SQL.Strings = (
      'select'
      '      case'
      
        '          when s.is_marked = 1 and sg.gtin_code is not null then' +
        ' '#39#1052#1072#1088#1082#39
      
        '          when s.is_marked is null and sg.gtin_code is not null ' +
        'then '#39#1054#1057#1059#39
      
        '          when s.is_marked is null and sg.gtin_code is null then' +
        ' '#39#1053#1077#1084#1072#1088#1082#39
      '      end as '#1055#1088#1080#1079#1085#1072#1082','
      '      g.name_good as '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077','
      '      oi.price_out as '#1062#1077#1085#1072','
      '      oi.quant_out as '#1050#1086#1083'_'#1074#1086','
      '      oi.sum_out as '#1057#1091#1084#1084#1072','
      '      oi.proc_nds as '#1053#1044#1057','
      '      oi.nds as '#1057#1091#1084#1084#1072'_'#1053#1044#1057','
      '      oi.price_reestr_item as '#1062#1077#1085#1072'_'#1043#1056','
      '      s.id_pack as '#1059#1087#1072#1082','
      '      oi.profit as '#1053#1072#1094','
      '      oi.price_retail as '#1056#1086#1079#1085#1080#1094#1072'_'#1062#1077#1085#1072','
      '      (oi.price_retail * oi.quant_out) as '#1056#1086#1079#1085#1080#1094#1072'_'#1057#1091#1084#1084#1072','
      '      oi.PROC_ROZN as '#1056#1086#1079#1085#1080#1094#1072'_'#1055#1056#1054#1062','
      '      oi.id_store as '#1050#1072#1088#1090#1086#1095#1082#1072','
      
        '      trim(ss.series) || '#39' '#1076#1086' '#39' || (trim(ss.date_best)) as '#1057#1077#1088#1080#1103 +
        ','
      '      ss.date_issue as '#1044#1072#1090#1072'_'#1074#1099#1087'_'#1089#1077#1088#1080#1080','
      '      oi.id_item as ID,'
      '      oi.price_prod_item as '#1062#1077#1085#1072'_'#1087#1088#1086#1080#1079#1074','
      '      oi.price_in as '#1041#1072#1079#1086#1074#1072#1103','
      
        '      trim(round((extract (day from (ss.date_best - sysdate)day ' +
        'to second))/extract (day from (ss.date_best - ss.date_issue)day ' +
        'to second) * 100)) || '#39'%'#39' as '#1087#1088#1086#1094'_'#1089#1088#1086#1082'_'#1075#1086#1076#1085','
      
        '      case when oi.is_commited = 1 then '#39#1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1072#39' else '#39#1042' ' +
        #1088#1072#1073#1086#1090#1077#39' end as '#1057#1090#1072#1090#1091#1089','
      
        '      case when oi.is_complete = 1 then '#39#1057#1090#1088#1086#1082#1072' '#1091#1082#1086#1084#1087#1083#1077#1082#1090#1086#1074#1072#1085#1072' '#1089 +
        #1077#1088#1080#1103#1084#1080#39' else '#39#1042' '#1088#1072#1073#1086#1090#1077#39' end as '#1057#1090#1072#1090#1091#1089'1'
      'from orders_item oi'
      'join store s on oi.id_store = s.id_store'
      'left join store_gtin sg on sg.id_store = s.id_store'
      'left join goods g on s.id_good = g.id_good'
      'left join store_series sss on sss.id_store = oi.id_store'
      'left join series ss on ss.id_series = sss.id_series_in'
      'where oi.id_order = :ord'
      'order by g.name_good')
    Left = 376
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ord'
        Value = nil
      end>
    object QueryReleaseBodyПРИЗНАК1: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082
      FieldName = #1055#1056#1048#1047#1053#1040#1050
      Size = 6
    end
    object QueryReleaseBodyНАИМЕНОВАНИЕ: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
      Size = 231
    end
    object QueryReleaseBodyЦЕНА: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 13
      FieldName = #1062#1045#1053#1040
      Required = True
    end
    object QueryReleaseBodyКОЛ_ВО: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 13
      FieldName = #1050#1054#1051'_'#1042#1054
      Required = True
    end
    object QueryReleaseBodyСУММА: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 13
      FieldName = #1057#1059#1052#1052#1040
    end
    object QueryReleaseBodyНДС: TFloatField
      DisplayWidth = 6
      FieldName = #1053#1044#1057
    end
    object QueryReleaseBodyСУММА_НДС: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072' '#1053#1044#1057
      DisplayWidth = 13
      FieldName = #1057#1059#1052#1052#1040'_'#1053#1044#1057
    end
    object QueryReleaseBodyЦЕНА_ГР: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1043#1056
      FieldName = #1062#1045#1053#1040'_'#1043#1056
    end
    object QueryReleaseBodyУПАК: TFloatField
      DisplayLabel = #1059#1087#1072#1082
      FieldName = #1059#1055#1040#1050
    end
    object QueryReleaseBodyНАЦ: TFloatField
      DisplayLabel = #1053#1072#1094'.'
      FieldName = #1053#1040#1062
    end
    object QueryReleaseBodyРОЗНИЦА_ЦЕНА: TFloatField
      DisplayLabel = #1062#1077#1085#1072
      FieldName = #1056#1054#1047#1053#1048#1062#1040'_'#1062#1045#1053#1040
    end
    object QueryReleaseBodyРОЗНИЦА_СУММА: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = #1056#1054#1047#1053#1048#1062#1040'_'#1057#1059#1052#1052#1040
    end
    object QueryReleaseBodyРОЗНИЦА_ПРОЦ: TFloatField
      DisplayLabel = #1055#1088#1086#1094
      FieldName = #1056#1054#1047#1053#1048#1062#1040'_'#1055#1056#1054#1062
    end
    object QueryReleaseBodyКАРТОЧКА: TFloatField
      DisplayLabel = #1050#1072#1088#1090#1086#1095#1082#1072
      FieldName = #1050#1040#1056#1058#1054#1063#1050#1040
      Required = True
    end
    object QueryReleaseBodyСЕРИЯ: TStringField
      DisplayLabel = #1043#1086#1076#1077#1085' '#1076#1086
      DisplayWidth = 25
      FieldName = #1057#1045#1056#1048#1071
      Size = 57
    end
    object QueryReleaseBodyДАТА_ВЫП_СЕРИИ: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1087#1091#1089#1082#1072
      FieldName = #1044#1040#1058#1040'_'#1042#1067#1055'_'#1057#1045#1056#1048#1048
    end
    object QueryReleaseBodyID: TFloatField
      DisplayLabel = 'Id_item'
      FieldName = 'ID'
      Required = True
    end
    object QueryReleaseBodyЦЕНА_ПРОИЗВ: TFloatField
      DisplayLabel = #1062#1077#1085#1072' '#1087#1088#1086#1080#1079#1074'.'
      FieldName = #1062#1045#1053#1040'_'#1055#1056#1054#1048#1047#1042
    end
    object QueryReleaseBodyБАЗОВАЯ: TFloatField
      DisplayLabel = #1041#1072#1079#1086#1074#1072#1103
      FieldName = #1041#1040#1047#1054#1042#1040#1071
      Required = True
    end
    object QueryReleaseBodyПРОЦ_СРОК_ГОДН: TStringField
      DisplayLabel = '% '#1089#1088#1086#1082#1072' '#1075#1086#1076#1085'.'
      DisplayWidth = 20
      FieldName = #1055#1056#1054#1062'_'#1057#1056#1054#1050'_'#1043#1054#1044#1053
      Size = 41
    end
    object QueryReleaseBodyСТАТУС: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 15
      FieldName = #1057#1058#1040#1058#1059#1057
      Size = 8
    end
    object QueryReleaseBodyСТАТУС1: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1089#1077#1088#1080#1080
      DisplayWidth = 35
      FieldName = #1057#1058#1040#1058#1059#1057'1'
      Size = 11
    end
  end
  object DSReleaseBody: TOraDataSource
    DataSet = QueryReleaseBody
    Left = 440
    Top = 88
  end
  object QueryReleaseSum: TOraQuery
    Session = ADOConnect
    SQL.Strings = (
      'select'
      '      sum(oi.sum_out) as '#1057#1091#1084#1084#1072','
      '      sum(oi.quant_out) as '#1042#1089#1077#1075#1086','
      '      sum(oi.nds) as '#1053#1044#1057','
      
        '      sum(case when s.is_marked = 1 then oi.sum_out end) as '#1057#1091#1084#1084 +
        #1072#1088#1082','
      
        '      sum(case when s.is_marked = 1 then oi.quant_out end) as '#1052#1072 +
        #1088#1082','
      '      sum(case when s.is_marked = 1 then oi.nds end) as '#1053#1044#1057#1084#1072#1088#1082','
      
        '      count(case when s.is_marked = 1 then oi.quant_out end) as ' +
        #1050#1086#1083'_'#1074#1086'_'#1084#1072#1088#1082','
      '      count(oi.quant_out) as '#1050#1086#1083'_'#1074#1086'_'#1089#1090#1088#1086#1082
      'from orders_item oi'
      'join store s on s.id_store = oi.id_store'
      'where id_order = :ord'
      'group by 1,2,3,4,5,6,7,8')
    Left = 408
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ord'
        Value = nil
      end>
    object QueryReleaseSumСУММА: TFloatField
      DisplayWidth = 39
      FieldName = #1057#1059#1052#1052#1040
    end
    object QueryReleaseSumВСЕГО: TFloatField
      FieldName = #1042#1057#1045#1043#1054
    end
    object QueryReleaseSumНДС: TFloatField
      FieldName = #1053#1044#1057
    end
    object QueryReleaseSumСУММАРК: TFloatField
      FieldName = #1057#1059#1052#1052#1040#1056#1050
    end
    object QueryReleaseSumМАРК: TFloatField
      FieldName = #1052#1040#1056#1050
    end
    object QueryReleaseSumНДСМАРК: TFloatField
      FieldName = #1053#1044#1057#1052#1040#1056#1050
    end
    object QueryReleaseSumКОЛ_ВО_МАРК: TFloatField
      FieldName = #1050#1054#1051'_'#1042#1054'_'#1052#1040#1056#1050
    end
    object QueryReleaseSumКОЛ_ВО_СТРОК: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1088#1086#1082
      DisplayWidth = 5
      FieldName = #1050#1054#1051'_'#1042#1054'_'#1057#1058#1056#1054#1050
    end
  end
  object QueryAgentsRelease: TOraQuery
    Session = ADOConnect
    SQL.Strings = (
      'select'
      '          name as '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077','
      '          id_agent as '#1050#1086#1076','
      '          u.user_real_name as '#1052#1077#1085#1077#1076#1078#1077#1088
      'from agents a'
      'join users u on u.id_user = a.id_manager')
    Left = 368
    Top = 200
    object QueryAgentsReleaseНАИМЕНОВАНИЕ: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
      Size = 80
    end
    object QueryAgentsReleaseКОД: TFloatField
      DisplayLabel = #1050#1086#1076' '#1072#1075#1077#1085#1090#1072
      FieldName = #1050#1054#1044
      Required = True
    end
    object QueryAgentsReleaseМЕНЕДЖЕР: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 25
      FieldName = #1052#1045#1053#1045#1044#1046#1045#1056
      Size = 60
    end
  end
  object DSAgentsRelease: TOraDataSource
    DataSet = QueryAgentsRelease
    Left = 448
    Top = 200
  end
  object QuerySearchIP: TOraQuery
    Session = ADOConnect
    SQL.Strings = (
      'SELECT wl.ip,  '
      '       wl.person_id,'
      '       wl.ldate,'
      '       p.lastname,'
      '       p.firstname,'
      '       p.patronymic'
      'from   NFLOG.WEBLOGIN wl'
      'join   NFGLOBALS.person p '
      '  on   p.person_id=wl.person_id'
      'where  ip like :ip'
      'and ldate >= :dat'
      
        'group by wl.ldate, wl.ip, wl.person_id, wl.ldate, p.lastname, p.' +
        'firstname, p.patronymic'
      'order by wl.ldate')
    Left = 64
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'ip'
        Value = Null
      end
      item
        DataType = ftDateTime
        Name = 'dat'
        Value = Null
      end>
    object QuerySearchIPPERSON_ID: TFloatField
      DisplayLabel = 'Person_id'
      FieldName = 'PERSON_ID'
    end
    object QuerySearchIPLASTNAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'LASTNAME'
      Size = 60
    end
    object QuerySearchIPFIRSTNAME: TStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 20
      FieldName = 'FIRSTNAME'
      Size = 32
    end
    object QuerySearchIPIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object QuerySearchIPLDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1093#1086#1076#1072
      FieldName = 'LDATE'
    end
  end
  object DSSearchIP: TOraDataSource
    DataSet = QuerySearchIP
    Left = 136
    Top = 40
  end
  object QuerySearchLastname: TOraQuery
    Session = ADOConnect
    SQL.Strings = (
      'SELECT wl.ip,  '
      '       wl.person_id,'
      '       wl.ldate,'
      '       p.lastname,'
      '       p.firstname,'
      '       p.patronymic'
      'from   NFLOG.WEBLOGIN wl'
      'join   NFGLOBALS.person p '
      '  on   p.person_id=wl.person_id'
      'where  lower(p.lastname) like :lsname'
      'and ldate >= :dat'
      
        'group by wl.ldate, wl.ip, wl.person_id, wl.ldate, p.lastname, p.' +
        'firstname, p.patronymic'
      'order by wl.ldate')
    Left = 64
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'lsname'
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'dat'
        Value = nil
      end>
    object QuerySearchLastnamePERSON_ID: TFloatField
      DisplayLabel = 'Person_id'
      FieldName = 'PERSON_ID'
    end
    object QuerySearchLastnameLASTNAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'LASTNAME'
      Size = 60
    end
    object QuerySearchLastnameFIRSTNAME: TStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 20
      FieldName = 'FIRSTNAME'
      Size = 32
    end
    object QuerySearchLastnameIP: TStringField
      FieldName = 'IP'
      Size = 15
    end
    object QuerySearchLastnameLDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1093#1086#1076#1072
      FieldName = 'LDATE'
    end
  end
  object DSSearchLastName: TOraDataSource
    DataSet = QuerySearchLastname
    Left = 136
    Top = 88
  end
  object QueryZakaz: TOraQuery
    Session = ADOConnect
    SQL.Strings = (
      'select'
      
        '      a.name                                                    ' +
        '                        as '#1050#1083#1080#1077#1085#1090','
      
        '      ztp.name_prog                                             ' +
        '                        as '#1055#1088#1086#1075'_'#1079#1072#1082#1072#1079#1086#1074','
      
        '      z.date_zakaz                                              ' +
        '                        as '#1042#1088#1077#1084#1103'_'#1079#1072#1082#1072#1079#1072','
      '      case'
      '          when z.state_zakaz = 0 then '#39#1053#1072#1095#1072#1083#1100#1085#1099#1081#39
      '          when z.state_zakaz = 1 then '#39#1053#1077' '#1086#1073#1088#1072#1073#1086#1090#1072#1085#39
      '          when z.state_zakaz = 2 then '#39#1054#1073#1088#1072#1073#1086#1090#1072#1085#39
      
        '      end                                                       ' +
        '                        as '#1057#1086#1089#1090#1086#1103#1085#1080#1077','
      
        '      --o.order_zakaz                                           ' +
        '                          as '#1053#1086#1084#1077#1088'_'#1089#1092#1086#1088#1084'_'#1079#1072#1082#1072#1079#1072','
      
        '      (select o.order_zakaz from orders o where o.id_order = z.i' +
        'd_order)                  as '#1053#1086#1084#1077#1088'_'#1089#1092#1086#1088#1084'_'#1079#1072#1082#1072#1079#1072','
      
        '      z.number_zakaz_s                                          ' +
        '                        as '#1053#1086#1084#1077#1088'_'#1079#1072#1082#1072#1079#1072'2,'
      '      case'
      '          when z.result_exec = 4 then '#39#1055#1088#1086#1089#1088#1086#1095#1077#1085#1085#1099#1077' '#1087#1083#1072#1090#1077#1078#1080#39
      '          when z.result_exec = 3 then '#39#1055#1088#1077#1074#1099#1096#1077#1085' '#1076#1086#1083#1075' '#1086#1089#1090#1088#1086#1095#1082#1080#39
      '          when z.result_exec = 2 then '#39#1055#1088#1077#1074#1099#1096#1077#1085' '#1076#1086#1083#1075#39
      '          when z.result_exec = 1 then '#39#1052#1077#1085#1100#1096#1077' '#1084#1080#1085'. '#1089#1091#1084#1084#1099#39
      '          when z.result_exec = 0 then '#39#1054#1073#1088#1072#1073#1086#1090#1072#1085#39
      '          when z.result_exec is null then '#39' '#39
      
        '      end                                                       ' +
        '                        as '#1056#1077#1079#1091#1083#1100#1090#1072#1090','
      
        '      z.id_zakaz                                                ' +
        '                        as '#1050#1086#1076'_'#1079#1072#1082#1072#1079#1072','
      
        '      z.message_zakaz                                           ' +
        '                        as '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077','
      
        '      (select sum(price * quantity) from zakaz_items zi where zi' +
        '.id_zakaz = z.id_zakaz) as '#1057#1091#1084#1084#1072','
      
        '      u.user_real_name                                          ' +
        '                        as '#1052#1077#1085#1077#1076#1078#1077#1088','
      
        '      o.office_name                                             ' +
        '                        as '#1056#1077#1075#1080#1086#1085'_'#1084#1077#1085#1077#1076#1078#1077#1088#1072
      'from zakaz z'
      'join agents a on a.id_agent = z.id_agent'
      'join users u on a.id_manager = u.id_user'
      'join NFGLOBALS.person p on p.person_id = u.id_user'
      'join NFGLOBALS.office o on o.office_id = p.office_id'
      'join zakaz_type_prog ztp on ztp.id_type_zakaz = z.type_zakaz'
      'where z.date_zakaz between :date1 and :date2')
    Left = 376
    Top = 272
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'date1'
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'date2'
        Value = nil
      end>
    object QueryZakazКЛИЕНТ: TStringField
      DisplayLabel = #1050#1083#1080#1077#1085#1090
      DisplayWidth = 50
      FieldName = #1050#1051#1048#1045#1053#1058
      Size = 80
    end
    object QueryZakazПРОГ_ЗАКАЗОВ: TStringField
      DisplayLabel = #1055#1088#1086#1075'. '#1079#1072#1082#1072#1079#1086#1074
      FieldName = #1055#1056#1054#1043'_'#1047#1040#1050#1040#1047#1054#1042
      Size = 30
    end
    object QueryZakazВРЕМЯ_ЗАКАЗА: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1079#1072#1082#1072#1079#1072
      FieldName = #1042#1056#1045#1052#1071'_'#1047#1040#1050#1040#1047#1040
    end
    object QueryZakazСОСТОЯНИЕ: TStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      DisplayWidth = 15
      FieldName = #1057#1054#1057#1058#1054#1071#1053#1048#1045
      Size = 12
    end
    object QueryZakazНОМЕР_СФОРМ_ЗАКАЗА: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1089#1092#1086#1088#1084'. '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 25
      FieldName = #1053#1054#1052#1045#1056'_'#1057#1060#1054#1056#1052'_'#1047#1040#1050#1040#1047#1040
    end
    object QueryZakazНОМЕР_ЗАКАЗА2: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 15
      FieldName = #1053#1054#1052#1045#1056'_'#1047#1040#1050#1040#1047#1040'2'
      Size = 50
    end
    object QueryZakazРЕЗУЛЬТАТ: TStringField
      DisplayLabel = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      DisplayWidth = 15
      FieldName = #1056#1045#1047#1059#1051#1068#1058#1040#1058
      Size = 22
    end
    object QueryZakazКОД_ЗАКАЗА: TFloatField
      DisplayLabel = #1050#1086#1076' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 13
      FieldName = #1050#1054#1044'_'#1047#1040#1050#1040#1047#1040
      Required = True
    end
    object QueryZakazПРИМЕЧАНИЕ: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = #1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
      Size = 900
    end
    object QueryZakazСУММА: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 13
      FieldName = #1057#1059#1052#1052#1040
    end
    object QueryZakazМЕНЕДЖЕР: TStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 30
      FieldName = #1052#1045#1053#1045#1044#1046#1045#1056
      Size = 60
    end
    object QueryZakazРЕГИОН_МЕНЕДЖЕРА: TStringField
      DisplayLabel = #1056#1077#1075#1080#1086#1085' '#1084#1077#1085#1077#1076#1078#1077#1088#1072
      DisplayWidth = 15
      FieldName = #1056#1045#1043#1048#1054#1053'_'#1052#1045#1053#1045#1044#1046#1045#1056#1040
      Size = 30
    end
  end
  object DSZakaz: TOraDataSource
    DataSet = QueryZakaz
    Left = 440
    Top = 272
  end
  object QueryGoods: TOraQuery
    Session = ADOConnect
    SQL.Strings = (
      'select '
      '       g.id_good,'
      '       g.name_good,'
      '       ii.code_ean13,'
      '       ii.is_mark,'
      '       gg.id_group,'
      '       gg.name_group'
      'from goods g'
      'join goods_group gg on g.id_group = gg.id_group'
      'join income_item ii on ii.id_good = g.id_good'
      'order by g.name_good')
    Left = 56
    Top = 312
    object QueryGoodsID_GOOD: TFloatField
      DisplayLabel = #1050#1086#1076' '#1090#1086#1074#1072#1088#1072
      FieldName = 'ID_GOOD'
      Required = True
    end
    object QueryGoodsNAME_GOOD: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'NAME_GOOD'
      Size = 231
    end
    object QueryGoodsCODE_EAN13: TStringField
      DisplayLabel = #1064#1050
      DisplayWidth = 15
      FieldName = 'CODE_EAN13'
      Size = 25
    end
    object QueryGoodsIS_MARK: TStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082
      DisplayWidth = 8
      FieldName = 'IS_MARK'
      Size = 1
    end
    object QueryGoodsID_GROUP: TFloatField
      DisplayLabel = #1050#1086#1076' '#1075#1088#1091#1087#1087#1099
      FieldName = 'ID_GROUP'
    end
    object QueryGoodsNAME_GROUP: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
      DisplayWidth = 40
      FieldName = 'NAME_GROUP'
      Size = 120
    end
  end
  object DSGoods: TOraDataSource
    DataSet = QueryGoods
    Left = 120
    Top = 312
  end
end
