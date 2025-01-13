object FrmGitUpdate: TFrmGitUpdate
  Left = 0
  Top = 0
  Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 595
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object sLVFiles: TListView
    Left = 8
    Top = 411
    Width = 845
    Height = 174
    Columns = <
      item
        Caption = #8470
      end
      item
        Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
      end
      item
        Caption = #1056#1072#1079#1084#1077#1088
      end
      item
        Caption = 'URL '#1060#1072#1081#1083#1072
      end>
    SmallImages = ImageList
    TabOrder = 0
  end
  object mmInfo: TMemo
    Left = 8
    Top = 59
    Width = 845
    Height = 346
    TabOrder = 1
  end
  object sEdURLApiReliases: TEdit
    Left = 8
    Top = 32
    Width = 457
    Height = 21
    TabOrder = 2
    Text = 'https://github.com/AlexNF97/MiniHope.git'
  end
  object sBtnCheckUpdate: TButton
    Left = 471
    Top = 31
    Width = 138
    Height = 23
    Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077
    TabOrder = 3
    OnClick = sBtnCheckUpdateClick
  end
  object sBtnUpdate: TButton
    Left = 615
    Top = 31
    Width = 130
    Height = 23
    Caption = #1057#1082#1072#1095#1072#1090#1100
    TabOrder = 4
    OnClick = sBtnUpdateClick
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'https://github.com/AlexNF97/MiniHope.git'
    Params = <>
    RaiseExceptionOn500 = False
    SynchronizedEvents = False
    Left = 152
    Top = 120
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 224
    Top = 120
  end
  object RESTResponse: TRESTResponse
    Left = 304
    Top = 120
  end
  object ImageList: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 376
    Top = 120
    Bitmap = {
      494C010104000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000202020304040405020202030202
      0203020202030A0A0A0B2A2A2A2C2829292A2829292A2B2B2B2D000000000202
      020302020203020202030909090A000000009B705FFF9B705FFF9B705FFF9B70
      5FFF9B705FFF9B705FFF9B715FFF9A6E5DFF8C5546FF8B5244FF8C5445FF8C54
      45FF8C5445FF8C5445FF8C5445FF8C5445FF000000000000000047C8EBFF46C7
      EBFF46C6EAFF46C6EAFF45C5E9FF45C4E9FF8D8D8DFF7B7B7BFF44C2E8FF44C2
      E7FF43C1E7FF54B9D9EF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000018410BFF143A09FF143A09FF143A
      09FF143A09FF1445C2FF082788FF072685FF072688FF062381FF091D03FF1032
      08FF133609FF143909FF143909FF6670639C9B705FFF9B705FFF9B705FFF9B70
      5FFF9B705FFF9B705FFF9B715FFF9A6E5DFF8C5546FF8B5244FF8C5445FF8C54
      45FF8C5445FF8C5445FF8C5445FF8C5445FF000000000000000047C8ECFF71DD
      FDFF8DE3FFFF8BE3FFFF8AE2FFFF88E2FFFFD3D3D3FF8D8D8DFF84E0FFFF46C6
      EEFF72DAFFFF43C1E7FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000266811FF0BA7E9FF276811FF2769
      11FF276911FF226BD1FF0F47B2FF1049BBFF1048BFFF0E46B6FF0F2A06FF1C4A
      0CFF245D0EFF276911FF276911FF467A38E69B705FFF9B705FFF9B705FFF9B70
      5FFF9A705FFF9B6F5EFF9D6E5BFF9C6B59FF8F5241FF8E4F3FFF8C5344FF8B54
      45FF8C5445FF8C5445FF8C5445FF8C5445FF000000000000000047C9ECFF72DD
      FDFF8EE4FFFF8DE3FFFF8BE3FFFF8AE2FFFF326575FF4893AAFF85E1FFFF44C6
      EEFF74DBFFFF44C2E7FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002D7914FF0DB1EBFF2D7914FF2D79
      14FF2D7A14FF2475D5FF114FBCFF114DBEFF0E45B0FF0E48B8FF123508FF2158
      0DFF287012FF2D7A14FF2D7A14FF328917FF9B705FFF9B705FFF9B705FFF9B70
      5FFF9B6F5EFF997160FF947767FF937366FF845B50FF83584EFF8A5547FF8C53
      44FF8C5445FF8C5445FF8C5445FF8C5445FF000000000000000048CAEDFF73DD
      FDFF90E4FFFF8EE4FFFF8DE3FFFF8BE3FFFF326575FF4893AAFF87E1FFFF55CC
      F1FF77DCFFFF44C2E8FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000549F30FF25C3EAFF549D30FF549D
      30FF549D30FF1E63C0FF0D419CFF0C3892FF0B3991FF0D4199FF214412FF4183
      25FF4D942BFF549C30FF549C30FF659A4CE59B705FFF9B705FFF9B705FFF9B70
      5FFFA06A56FF888379FF3CCBE1FF3BC5E1FF18ADDCFF17ADDCFF726563FF934E
      3BFF8C5445FF8C5445FF8C5445FF8C5445FF000000000000000048CAEDFF74DD
      FDFF91E5FFFF90E4FFFF8EE4FFFF8DE3FFFF326575FF4893AAFF88E2FFFF57CC
      F1FF79DDFFFF44C3E8FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001C3610FF1A310FFF1A310FFF1A31
      0FFF182E0EFFC8CDF2FFCAD2FAFF646A80FF99A1C0FFCBD1FBFF686A72FF1326
      0CFF182C0DFF1A310FFF1A310FFF686E659C9B705FFF9B705FFF9B705FFF9B70
      5FFF9B6F5EFF987262FF977463FF9B6C5BFF8D5344FF875549FF885648FF8C53
      44FF8C5445FF8C5445FF8C5445FF8C5445FF000000000000000048CBEEFF75DE
      FDFF93E5FFFF91E5FFFF90E4FFFF8EE4FFFF326575FF4993AAFF8AE2FFFFA8E9
      FDFF67D6FAFF739BA7AF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008D3332FF0A90C7FF802F2EFF802F
      2EFF6F2928FFFFFFFFFF0E3C9CFFF5F3F1FF0A2551FF325395FFFFFFFFFF6325
      24FF762A29FF802F2EFF802F2EFF816D6D9C9B705FFF9B7160FFA26955FFA665
      50FFA56650FFA96149FF93786AFF778E88FF657375FF805951FF9E452BFF984A
      34FF994933FF964D39FF8C5546FF8C5445FF000000000000000048CCEEFF76DE
      FDFF94E6FFFF93E5FFFF91E5FFFF90E4FFFF336575FF4993AAFF8BE3FFFF94E5
      FFFF42C4E9FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009D3D3BFF0DAFEBFF9D3D3BFF9D3D
      3BFF913533FFFFFFFFFF0F4093FFF2EFECFF0F315EFF123A75FFFFFFFFFF8630
      2EFF993A37FF9D3D3AFF9D3D3AFFB05D58E6997569E897604EFF768D8CFF699F
      A1FF6C9CA1FF729697FF40C6E0FF1AE5FFFF00CDFFFF17A9D9FF587886FF5180
      90FF518491FF5D6F77FF844433FF8A6257E5000000000000000049CCEFFF77DF
      FDFF96E6FFFF94E6FFFF93E5FFFF8EDFF9FF29515DFF3B7588FF8DE3FFFF8BE3
      FFFF46C6EAFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AA4846FF10BBEEFFAC4A47FFAC4A
      47FFA2403EFFDAD1C3FF1763CEFF1048ABFF124BB7FF1B55D5FFE5D9CDFFA040
      3DFFA94643FFAC4A47FFAD4A47FFD55954FF17171718996053D841B5CCFF19ED
      FFFF21E3FFFF20E4FFFF27DEFFFF28D7FDFF00BFFCFF00C2FFFF00C9FFFF00C8
      FFFF00D2FFFF199AC4FF8B4E40D914141415000000000000000049CDEFFF77DF
      FDFF97E7FFFF96E6FFFF94E6FFFF73B7CCFF1A343CFFBABABAFF8EE4FFFF8DE3
      FFFF46C6EAFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD6461FF1FC7F1FFBA625FFFBA62
      5FFFB45956FF7B666BFF218DDFFF1C6EB0FF2D8AE9FF2571E1FF86686FFFAD54
      51FFB95E5DFFBB6260FFBB6360FFC37976E500000000343433364BB1C3FC26E1
      FFFF2BDAFFFF2BDAFFFF2CDAFFFF28D8FEFF00C1FCFF00BEFBFF00BEFDFF00BF
      FDFF00C5FFFF2B97BAF83433333600000000000000000000000049CEF0FF77DF
      FDFF97E7FFFF97E7FFFF96E6FFFF75B8CCFFC8C8C8FFC1C1C1FF90E4FFFF8EE4
      FFFF46C7EBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000633333FF572E2DFF572E2CFF572E
      2CFF572E2DFF2489DAFF249AE2FF1E6FCCFF1E6CCCFF2D8AEBFF2A1615FF4C29
      28FF552D2BFF582E2CFF582E2DFF7C6E6E9C000000000000000067ACBCBC2BDA
      FFFF2BDAFFFF2BDAFFFF2CDAFFFF28D8FEFF00C0FDFF00BFFBFF00C1FCFF00C0
      FCFF00C0FDFF51A5BEC1000000000000000000000000000000004ACEF0FF77DF
      FDFF97E7FFFF97E7FFFF97E7FFFF76B8CCFFCFCFCFFFC8C8C8FF91E5FFFF90E4
      FFFF47C8EBFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001D1391FF0364C3FF160A80FF160A
      80FF160A80FF1150ADFF1B73ADFF1869ACFF1A68B2FF236DC4FF0D054EFF1409
      74FF160A80FF160A80FF150A80FF706E889C00000000000000001313131431B5
      E0E201C1FDFF01C1FDFF01C1FCFF01BDFDFF0094FEFF009DFDFF00BDFCFF00BC
      FCFF04BBFAFC5E95A7A9000000000000000000000000000000004ACFF1FF77DF
      FDFF97E7FFFF97E7FFFF97E7FFFF72A3B2FFD6D6D6FFCFCFCFFF93E5FFFF91E5
      FFFF47C8ECFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002011A4FF0689E1FF1F0FA3FF1F0F
      A2FF1F0FA2FF2CBAFEFF28ABFFFF28ADFFFF26A9FFFF24A9FFFF130973FF1F0F
      A0FF1F0FA2FF1F0FA2FF1F0FA2FF584EBFE60000000000000000000000005C9B
      AFB109BFF9FB02C1FDFF02C2FCFF02BFFDFF0094FDFF0088FFFF008FFFFF0090
      FEFF2F94E2E207070808000000000000000000000000000000004AD0F1FF77DF
      FDFF97E7FFFF97E7FFFF97E7FFFF77949CFFDBDBDBFFABABABFF94E6FFFF93E5
      FFFF47C9ECFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003D21C0FF0DB0EBFF3B1FC2FF3B1F
      C2FF3B1FC0FF1757D0FF4BD7FFFF3DCCF7FF30BDF3FF47E3F2FF2E1798FF3B1F
      BEFF3B1FC0FF3B1FC0FF3B1FC0FF5F42FFFF0000000000000000000000000505
      06062CD9FEFE2BDAFFFF2FDCFFFF29DBFFFF00BDFCFF009CFDFF0099FEFF0A9B
      F8F961859C9D00000000000000000000000000000000000000004BD0F2FF97E7
      FFFF97E7FFFF97E7FFFF97E7FFFFBAC0C2FFDBDBDBFF737373FF8EDBF2FF94E6
      FFFF48CAEDFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009368EDFF39DDF7FF8B60E4FF8B60
      E4FF8A60E4FF35ABE2FF1A69AEFF61E2EFFF3BBCD8FF104DB1FF6C4DB5FF8A60
      E3FF8B60E4FF8B60E4FF8A60E4FFB291E5E50000000000000000000000000000
      01016A8C94946C96A1A16895A0A1679DA9AC06BFF8FB00C1FBFF00C1FCFF26B9
      E6E9000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A2A2A2AFCDCDCDFFC2C2C2FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AA8AFFFFA183ECFFA183ECFFA183
      ECFFA183ECFF3EC2EBFF5BD3F1FF5BD4F2FF4ACBEDFF47C6ECFF8A6DCAFFA082
      EBFFA183ECFFA183ECFFA183ECFF88829C9C0000000000000000000000000000
      00000000000000000000000000000000000043ACCFD100BEFCFF00BFFDFF22B8
      E9EB07070708000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00210000C003FFFF00000000
      C003000000000000C0037FFE00000000C003404600000000C003445E00000000
      C003444E00000000C007446600000000C007424600000000C0075F7E00000000
      C007407E00000000C007407E00000000C0077FFE00000000C007000000000000
      C007FFFF00000000FE3FFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
