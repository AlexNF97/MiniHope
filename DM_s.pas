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
    QueryInvoice�������: TStringField;
    QueryInvoice��������_�����: TStringField;
    QueryInvoice������: TStringField;
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
    QueryInvoiceBody�������: TStringField;
    QueryInvoiceBody������: TStringField;
    QueryInvoiceBody������������: TStringField;
    QueryInvoiceBody������������_����: TStringField;
    QueryInvoiceBody�������������: TStringField;
    QueryInvoiceBody�������������_����: TStringField;
    QueryInvoiceBody������: TStringField;
    QueryInvoiceBody�����_���: TFloatField;
    QueryInvoiceBody���_��: TFloatField;
    QueryInvoiceBody����: TFloatField;
    QueryInvoiceBody�����: TFloatField;
    QueryInvoiceBody���: TFloatField;
    QueryInvoiceBody������: TFloatField;
    QueryInvoiceBody�����: TStringField;
    QueryInvoiceBody�����_��: TDateTimeField;
    QueryInvoiceBody��������: TStringField;
    QueryInvoiceBody����_������: TFloatField;
    QueryInvoiceBodyGTIN: TStringField;
    QueryInvoiceBody����_�������: TDateTimeField;
    QueryProvider: TOraQuery;
    DSProvider: TOraDataSource;
    QueryRelease: TOraQuery;
    DSRelease: TOraDataSource;
    QueryRelease���: TStringField;
    QueryRelease����_�ר��: TDateTimeField;
    QueryRelease�����: TFloatField;
    QueryRelease������: TStringField;
    QueryRelease�����: TFloatField;
    QueryRelease�����: TStringField;
    QueryRelease�����: TFloatField;
    QueryRelease���: TFloatField;
    QueryReleaseNN_�����: TFloatField;
    QueryRelease������: TDateTimeField;
    QueryRelease��������: TStringField;
    QueryRelease����_������: TDateTimeField;
    QueryRelease��������: TStringField;
    QueryRelease�����_����������: TStringField;
    QueryReleaseID_ORDER: TFloatField;
    QueryRelease���_���������: TFloatField;
    QueryRelease�����: TFloatField;
    QueryRelease����������: TStringField;
    QueryRelease������1: TStringField;
    QueryReleaseBody: TOraQuery;
    DSReleaseBody: TOraDataSource;
    QueryReleaseBody������: TStringField;
    QueryReleaseBody������1: TStringField;
    QueryReleaseBody������������: TStringField;
    QueryReleaseBody����: TFloatField;
    QueryReleaseBody���_��: TFloatField;
    QueryReleaseBody�����: TFloatField;
    QueryReleaseBody���: TFloatField;
    QueryReleaseBody�����_���: TFloatField;
    QueryReleaseBody����_��: TFloatField;
    QueryReleaseBody����: TFloatField;
    QueryReleaseBody���: TFloatField;
    QueryReleaseBody�������_����: TFloatField;
    QueryReleaseBody�������_�����: TFloatField;
    QueryReleaseBody�������_����: TFloatField;
    QueryReleaseBody��������: TFloatField;
    QueryReleaseBody�����: TStringField;
    QueryReleaseBody����_���_�����: TDateTimeField;
    QueryReleaseBodyID: TFloatField;
    QueryReleaseBody����_������: TFloatField;
    QueryReleaseBody�������: TFloatField;
    QueryReleaseBody����_����_����: TStringField;
    QueryReleaseSum: TOraQuery;
    QueryReleaseSum�����: TFloatField;
    QueryReleaseSum�����: TFloatField;
    QueryReleaseSum���: TFloatField;
    QueryReleaseSum�������: TFloatField;
    QueryReleaseSum����: TFloatField;
    QueryReleaseSum�������: TFloatField;
    QueryReleaseSum���_��_����: TFloatField;
    QueryReleaseSum���_��_�����: TFloatField;
    QueryAgentsRelease: TOraQuery;
    DSAgentsRelease: TOraDataSource;
    QueryAgentsRelease������������: TStringField;
    QueryAgentsRelease���: TFloatField;
    QueryAgentsRelease��������: TStringField;
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
    QueryRelease���: TStringField;
    QueryZakaz: TOraQuery;
    DSZakaz: TOraDataSource;
    QueryZakaz������: TStringField;
    QueryZakaz����_�������: TStringField;
    QueryZakaz�����_������: TDateTimeField;
    QueryZakaz���������: TStringField;
    QueryZakaz�����_�����_������: TFloatField;
    QueryZakaz�����_������2: TStringField;
    QueryZakaz���������: TStringField;
    QueryZakaz���_������: TFloatField;
    QueryZakaz����������: TStringField;
    QueryZakaz�����: TFloatField;
    QueryZakaz��������: TStringField;
    QueryZakaz������_���������: TStringField;
    QueryGoods: TOraQuery;
    DSGoods: TOraDataSource;
    QueryProvider������������: TStringField;
    QueryProvider���: TFloatField;
    QueryProvider��������: TStringField;
    QueryGoodsID_GOOD: TFloatField;
    QueryGoodsNAME_GOOD: TStringField;
    QueryGoodsCODE_EAN13: TStringField;
    QueryGoodsIS_MARK: TStringField;
    QueryGoodsID_GROUP: TFloatField;
    QueryGoodsNAME_GROUP: TStringField;
    QueryReleaseBody�������1: TStringField;
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
