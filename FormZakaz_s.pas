unit FormZakaz_s;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.ComCtrls, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Buttons;

type
  TFormZakaz = class(TForm)
    DBGridZakaz: TDBGridEh;
    EditAgents: TButtonedEdit;
    Label1: TLabel;
    ImageList1: TImageList;
    Label2: TLabel;
    DatePast: TDateTimePicker;
    Label3: TLabel;
    DateFuture: TDateTimePicker;
    BBClose: TBitBtn;
    CheckBoxZakaz: TCheckBox;
    StatusBarZakaz: TStatusBar;
    Label4: TLabel;
    ComboBoxBase: TComboBox;
    procedure DatePastChange(Sender: TObject);
    procedure DateFutureChange(Sender: TObject);
    procedure BBCloseClick(Sender: TObject);
    procedure EditAgentsRightButtonClick(Sender: TObject);
    procedure BBClearClick(Sender: TObject);
    procedure CheckBoxZakazClick(Sender: TObject);
    procedure DBGridZakazCellClick(Column: TColumnEh);
    procedure DBGridZakazGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ComboBoxBaseClick(Sender: TObject);
    procedure ConnectBase(ConnectNumber: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridZakazMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FDatesChanged: Boolean;
    FEditAgentsCleared: Boolean;
    FCheckBoxZakazChanged: Boolean;
    DateP, DateF: Boolean;
    PrevRow: Integer;
  public
    { Public declarations }
    ZakStart: Boolean;
  end;

var
  FormZakaz: TFormZakaz;

implementation

{$R *.dfm}

uses DM_s, FormAgentsRelease_s;

procedure TFormZakaz.BBClearClick(Sender: TObject);
begin
//  EditAgents.Clear;
//  FEditAgentsCleared:= True;
//  DM.QueryZakaz.Filtered:= False;
end;

procedure TFormZakaz.BBCloseClick(Sender: TObject);
begin
  FormZakaz.Close;
end;

procedure TFormZakaz.CheckBoxZakazClick(Sender: TObject);
begin
  FCheckBoxZakazChanged:= True;
  if CheckBoxZakaz.Checked = True then
    begin
      DM.QueryZakaz.Filtered:= False;
      DM.QueryZakaz.Filter:= 'СОСТОЯНИЕ = ' + QuotedStr('Не обработан');
      DM.QueryZakaz.Filtered:= True;
      DM.QueryZakaz.Last;
      StatusBarZakaz.Panels[2].Text:= 'Всего записей: ' + IntToStr(DM.QueryZakaz.RecordCount);
    end
  else DM.QueryZakaz.Filtered:= False;
end;

procedure TFormZakaz.DateFutureChange(Sender: TObject);
begin
  DateF:= True;
end;

procedure TFormZakaz.DatePastChange(Sender: TObject);
begin
  DateP:= True;
end;

procedure TFormZakaz.DBGridZakazCellClick(Column: TColumnEh);
begin
  StatusBarZakaz.Panels[1].Text:= DBGridZakaz.Columns[8].Field.AsString;
end;

procedure TFormZakaz.DBGridZakazGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if DBGridZakaz.Row <> PrevRow then
  begin
    PrevRow:= DBGridZakaz.Row;
    StatusBarZakaz.Panels[1].Text:= DBGridZakaz.Columns[8].Field.AsString;
  end;
end;

procedure TFormZakaz.DBGridZakazMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if DateP = True then
  begin
    FDatesChanged:= True;
    DM.QueryZakaz.Active:= False;
    DM.QueryZakaz.Params.ParamByName('date1').Value:= DatePast.Date;
    DM.QueryZakaz.Params.ParamByName('date2').Value:= DateFuture.Date;
    DM.QueryZakaz.Active:= True;
    DM.QueryZakaz.Last;
    StatusBarZakaz.Panels[2].Text:= 'Всего записей: ' + IntToStr(DM.QueryZakaz.RecordCount);
  end;

if DateF = True then
  begin
    FDatesChanged:= True;
    DM.QueryZakaz.Active:= False;
    DM.QueryZakaz.Params.ParamByName('date1').Value:= DatePast.Date;
    DM.QueryZakaz.Params.ParamByName('date2').Value:= DateFuture.Date;
    DM.QueryZakaz.Active:= True;
    DM.QueryZakaz.Last;
    StatusBarZakaz.Panels[2].Text:= 'Всего записей: ' + IntToStr(DM.QueryZakaz.RecordCount);
  end;
end;

procedure TFormZakaz.EditAgentsRightButtonClick(Sender: TObject);
begin
  FormAgentsRelease.Show;
end;

procedure TFormZakaz.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ZakStart:= False;
end;

procedure TFormZakaz.FormShow(Sender: TObject);
begin
  ZakStart:= True;
  ConnectBase(0);
  DatePast.Date:= Now - 1;
  DateFuture.Date:= Now + 1;
  PrevRow:= -1;

  CheckBoxZakaz.Checked:= False;
  CheckBoxZakaz.Checked := False;
  FDatesChanged := False;
  FEditAgentsCleared := False;
  FCheckBoxZakazChanged := False;

  DM.QueryZakaz.Active:= False;
  DM.QueryZakaz.Params.ParamByName('date1').Value:= DatePast.Date;
  DM.QueryZakaz.Params.ParamByName('date2').Value:= DateFuture.Date;
  DM.QueryZakaz.Active:= True;
  DM.QueryZakaz.Last;
  StatusBarZakaz.Panels[2].Text:= 'Всего записей: ' + IntToStr(DM.QueryZakaz.RecordCount);
end;

procedure TFormZakaz.ConnectBase(ConnectNumber: Integer);//Подключение к базам
begin
  DM.QueryZakaz.Active:= False;
  DM.QueryZakaz.Filtered:= False;
  DM.ADOConnect.Connected:= False;

  case ConnectNumber of
    0: DM.ADOConnect.ConnectString:= 'Data Source=ORAS;User ID=factory_hope;Password=hope;Login Prompt=False';
    1: DM.ADOConnect.ConnectString:= 'Data Source=OREL;User ID=factory_hope;Password=hope;Login Prompt=False';
  end;

  try DM.ADOConnect.Connected:= True;
  except
    Application.MessageBox('Нет подключения к базе...', 'Упссс(((', 0);
  end;

  DM.QueryZakaz.Active:= True;
  DM.QueryZakaz.Last;

  if ConnectNumber = 0 then
    StatusBarZakaz.Panels[0].Text:= 'oracle-main.tmb.nf (Тамбов)';
    StatusBarZakaz.Panels[2].Text:= 'Всего записей: ' + IntToStr(DM.QueryZakaz.RecordCount);

  if ConnectNumber = 1 then
    StatusBarZakaz.Panels[0].Text:= 'oracle-main.tmb.nf (Орёл)';
    StatusBarZakaz.Panels[2].Text:= 'Всего записей: ' + IntToStr(DM.QueryZakaz.RecordCount);
end;

procedure TFormZakaz.ComboBoxBaseClick(Sender: TObject);
begin
  case ComboBoxBase.ItemIndex of
    0: ConnectBase(0); //Тамбов
    1: ConnectBase(1); //Орёл
  end;

  if ComboBoxBase.ItemIndex = 0 then
    DatePast.Date:= Now - 1;
    DateFuture.Date:= Now + 1;
    PrevRow:= -1;

    DM.QueryZakaz.Active:= False;
    DM.QueryZakaz.Params.ParamByName('date1').Value:= DatePast.Date;
    DM.QueryZakaz.Params.ParamByName('date2').Value:= DateFuture.Date;
    DM.QueryZakaz.Active:= True;
    DM.QueryZakaz.Last;
    StatusBarZakaz.Panels[2].Text:= 'Всего записей: ' + IntToStr(DM.QueryZakaz.RecordCount);

  if ComboBoxBase.ItemIndex = 1 then
    DatePast.Date:= Now - 1;
    DateFuture.Date:= Now + 1;
    PrevRow:= -1;

    DM.QueryZakaz.Active:= False;
    DM.QueryZakaz.Params.ParamByName('date1').Value:= DatePast.Date;
    DM.QueryZakaz.Params.ParamByName('date2').Value:= DateFuture.Date;
    DM.QueryZakaz.Active:= True;
    DM.QueryZakaz.Last;
    StatusBarZakaz.Panels[2].Text:= 'Всего записей: ' + IntToStr(DM.QueryZakaz.RecordCount);
end;

end.
