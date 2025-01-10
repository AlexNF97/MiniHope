unit DM_s;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, DBAccess, Ora,
  MemDS, OraCall;

type
  TDM = class(TDataModule)
    ADOConnect: TOraSession;
    QueryInvoice: TOraQuery;
    DSInvoice: TOraDataSource;
    QueryInvoiceÏĞÈÇÍÀÊ: TStringField;
    QueryInvoiceÈÍÒÅĞÍÅÒ_ÇÀÊÀÇ: TStringField;
    QueryInvoiceÑÒÀÒÓÑ: TStringField;
    QueryInvoicePROVIDER: TStringField;
    QueryInvoiceDOC_NUMBER: TStringField;
    QueryInvoiceINCOME_DATE: TDateTimeField;
    QueryInvoiceSUMMA_DOC: TFloatField;
    QueryInvoiceSUMMA_NDS: TFloatField;
    QueryInvoiceID_ZAKAZ: TFloatField;
    QueryInvoiceAPTEKA_GP: TStringField;
    QueryInvoiceMESS: TStringField;
    QueryInvoiceBody: TOraQuery;
    DSInvoiceBody: TOraDataSource;
    QueryInvoiceBodyÏĞÈÇÍÀÊ: TStringField;
    QueryInvoiceBodyÑÒÀÒÓÑ: TStringField;
    QueryInvoiceBodyÍÀÈÌÅÍÎÂÀÍÈÅ: TStringField;
    QueryInvoiceBodyÍÀÈÌÅÍÎÂÀÍÈÅ_ÍÀØÅ: TStringField;
    QueryInvoiceBodyÏĞÎÈÇÂÎÄÈÒÅËÜ: TStringField;
    QueryInvoiceBodyÏĞÎÈÇÂÎÄÈÒÅËÜ_ÍÀØÅ: TStringField;
    QueryInvoiceBodyÑÒĞÀÍÀ: TStringField;
    QueryInvoiceBodyÑÓÌÌÀ_ÍÄÑ: TFloatField;
    QueryInvoiceBodyÊÎË_ÂÎ: TFloatField;
    QueryInvoiceBodyÖÅÍÀ: TFloatField;
    QueryInvoiceBodyÑÓÌÌÀ: TFloatField;
    QueryInvoiceBodyÍÄÑ: TFloatField;
    QueryInvoiceBodyÖÅÍÀÃĞ: TFloatField;
    QueryInvoiceBodyÑÅĞÈß: TStringField;
    QueryInvoiceBodyÃÎÄÅÍ_ÄÎ: TDateTimeField;
    QueryInvoiceBodyØÒĞÈÕÊÎÄ: TStringField;
    QueryInvoiceBodyÖÅÍÀ_ÏĞÎÈÇÂ: TFloatField;
    QueryInvoiceBodyGTIN: TStringField;
    QueryInvoiceBodyÄÀÒÀ_ÈÇÃÎÒÎÂ: TDateTimeField;
    QueryProvider: TOraQuery;
    DSProvider: TOraDataSource;
    QueryRelease: TOraQuery;
    DSRelease: TOraDataSource;
    QueryReleaseÒÈÏ: TStringField;
    QueryReleaseÄÀÒÀ_Ñ×¨ÒÀ: TDateTimeField;
    QueryReleaseÍÎÌÅĞ: TFloatField;
    QueryReleaseÈÍÄÅÊÑ: TStringField;
    QueryReleaseÇÀÊÀÇ: TFloatField;
    QueryReleaseÀÃÅÍÒ: TStringField;
    QueryReleaseÑÓÌÌÀ: TFloatField;
    QueryReleaseÍÄÑ: TFloatField;
    QueryReleaseNN_ÑÒĞÎÊ: TFloatField;
    QueryReleaseÑÎÇÄÀÍ: TDateTimeField;
    QueryReleaseÎÏÅĞÀÒÎĞ: TStringField;
    QueryReleaseÄÀÒÀ_ÄÎÑÒÀÂ: TDateTimeField;
    QueryReleaseÌÅÍÅÄÆÅĞ: TStringField;
    QueryReleaseÀÃÅÍÒ_ÏÎËÓ×ÀÒÅËÜ: TStringField;
    QueryReleaseID_ORDER: TFloatField;
    QueryReleaseÊÎÄ_ÄÎÊÓÌÅÍÒÀ: TFloatField;
    QueryReleaseÑÊËÀÄ: TFloatField;
    QueryReleaseÏĞÈÌÅ×ÀÍÈÅ: TStringField;
    QueryReleaseÑÒÀÒÓÑ1: TStringField;
    QueryReleaseBody: TOraQuery;
    DSReleaseBody: TOraDataSource;
    QueryReleaseBodyÑÒÀÒÓÑ: TStringField;
    QueryReleaseBodyÑÒÀÒÓÑ1: TStringField;
    QueryReleaseBodyÍÀÈÌÅÍÎÂÀÍÈÅ: TStringField;
    QueryReleaseBodyÖÅÍÀ: TFloatField;
    QueryReleaseBodyÊÎË_ÂÎ: TFloatField;
    QueryReleaseBodyÑÓÌÌÀ: TFloatField;
    QueryReleaseBodyÍÄÑ: TFloatField;
    QueryReleaseBodyÑÓÌÌÀ_ÍÄÑ: TFloatField;
    QueryReleaseBodyÖÅÍÀ_ÃĞ: TFloatField;
    QueryReleaseBodyÓÏÀÊ: TFloatField;
    QueryReleaseBodyÍÀÖ: TFloatField;
    QueryReleaseBodyĞÎÇÍÈÖÀ_ÖÅÍÀ: TFloatField;
    QueryReleaseBodyĞÎÇÍÈÖÀ_ÑÓÌÌÀ: TFloatField;
    QueryReleaseBodyĞÎÇÍÈÖÀ_ÏĞÎÖ: TFloatField;
    QueryReleaseBodyÊÀĞÒÎ×ÊÀ: TFloatField;
    QueryReleaseBodyÑÅĞÈß: TStringField;
    QueryReleaseBodyÄÀÒÀ_ÂÛÏ_ÑÅĞÈÈ: TDateTimeField;
    QueryReleaseBodyID: TFloatField;
    QueryReleaseBodyÖÅÍÀ_ÏĞÎÈÇÂ: TFloatField;
    QueryReleaseBodyÁÀÇÎÂÀß: TFloatField;
    QueryReleaseBodyÏĞÎÖ_ÑĞÎÊ_ÃÎÄÍ: TStringField;
    QueryReleaseSum: TOraQuery;
    QueryReleaseSumÑÓÌÌÀ: TFloatField;
    QueryReleaseSumÂÑÅÃÎ: TFloatField;
    QueryReleaseSumÍÄÑ: TFloatField;
    QueryReleaseSumÑÓÌÌÀĞÊ: TFloatField;
    QueryReleaseSumÌÀĞÊ: TFloatField;
    QueryReleaseSumÍÄÑÌÀĞÊ: TFloatField;
    QueryReleaseSumÊÎË_ÂÎ_ÌÀĞÊ: TFloatField;
    QueryReleaseSumÊÎË_ÂÎ_ÑÒĞÎÊ: TFloatField;
    QueryAgentsRelease: TOraQuery;
    DSAgentsRelease: TOraDataSource;
    QueryAgentsReleaseÍÀÈÌÅÍÎÂÀÍÈÅ: TStringField;
    QueryAgentsReleaseÊÎÄ: TFloatField;
    QueryAgentsReleaseÌÅÍÅÄÆÅĞ: TStringField;
    QuerySearchIP: TOraQuery;
    DSSearchIP: TOraDataSource;
    QuerySearchIPIP: TStringField;
    QuerySearchIPPERSON_ID: TFloatField;
    QuerySearchIPLDATE: TDateTimeField;
    QuerySearchIPLASTNAME: TStringField;
    QuerySearchIPFIRSTNAME: TStringField;
    QuerySearchLastname: TOraQuery;
    DSSearchLastName: TOraDataSource;
    QuerySearchLastnameIP: TStringField;
    QuerySearchLastnamePERSON_ID: TFloatField;
    QuerySearchLastnameLDATE: TDateTimeField;
    QuerySearchLastnameLASTNAME: TStringField;
    QuerySearchLastnameFIRSTNAME: TStringField;
    QueryReleaseİÄÎ: TStringField;
    QueryZakaz: TOraQuery;
    DSZakaz: TOraDataSource;
    QueryZakazÊËÈÅÍÒ: TStringField;
    QueryZakazÏĞÎÃ_ÇÀÊÀÇÎÂ: TStringField;
    QueryZakazÂĞÅÌß_ÇÀÊÀÇÀ: TDateTimeField;
    QueryZakazÑÎÑÒÎßÍÈÅ: TStringField;
    QueryZakazÍÎÌÅĞ_ÑÔÎĞÌ_ÇÀÊÀÇÀ: TFloatField;
    QueryZakazÍÎÌÅĞ_ÇÀÊÀÇÀ2: TStringField;
    QueryZakazĞÅÇÓËÜÒÀÒ: TStringField;
    QueryZakazÊÎÄ_ÇÀÊÀÇÀ: TFloatField;
    QueryZakazÏĞÈÌÅ×ÀÍÈÅ: TStringField;
    QueryZakazÑÓÌÌÀ: TFloatField;
    QueryZakazÌÅÍÅÄÆÅĞ: TStringField;
    QueryZakazĞÅÃÈÎÍ_ÌÅÍÅÄÆÅĞÀ: TStringField;
    QueryGoods: TOraQuery;
    DSGoods: TOraDataSource;
    QueryProviderÍàèìåíîâàíèå: TStringField;
    QueryProviderÊîä: TFloatField;
    QueryProviderÌåíåäæåğ: TStringField;
    QueryGoodsID_GOOD: TFloatField;
    QueryGoodsNAME_GOOD: TStringField;
    QueryGoodsCODE_EAN13: TStringField;
    QueryGoodsIS_MARK: TStringField;
    QueryGoodsID_GROUP: TFloatField;
    QueryGoodsNAME_GROUP: TStringField;
    QueryReleaseBodyÏĞÈÇÍÀÊ1: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
