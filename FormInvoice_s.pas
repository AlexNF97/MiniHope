unit FormInvoice_s;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DBGridEhGrouping,
  Vcl.ExtCtrls, Vcl.ComCtrls, DBGridEh, Vcl.Buttons, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, Vcl.Menus, Registry, DB,
  Vcl.Mask, DBCtrlsEh, DBLookupEh, Vcl.DBCtrls, Vcl.WinXCtrls,
  Vcl.Imaging.pngimage, Clipbrd, System.ImageList, Vcl.ImgList;

type
  TFormInvoice = class(TForm)
    DBGridInvoice: TDBGridEh;
    StatusBarInvoice: TStatusBar;
    DatePast: TDateTimePicker;
    DateFuture: TDateTimePicker;
    Label1: TLabel;
    по: TLabel;
    Label2: TLabel;
    EditNumber: TEdit;
    Label3: TLabel;
    Panel1: TPanel;
    RBAll: TRadioButton;
    RBNo: TRadioButton;
    RBYes: TRadioButton;
    RBGood: TRadioButton;
    BitBtn1: TBitBtn;
    RBInet: TRadioButton;
    ComboBoxBase: TComboBox;
    Image1: TImage;
    Timer1: TTimer;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    EditProvider: TButtonedEdit;
    ImageList1: TImageList;
    BBEditClear: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridInvoiceTitleClick(Column: TColumnEh);
    procedure RBNoClick(Sender: TObject);
    procedure RBAllClick(Sender: TObject);
    procedure RBYesClick(Sender: TObject);
    procedure RBGoodClick(Sender: TObject);
    procedure ComboBoxBaseClick(Sender: TObject);
    procedure ConnectBase(ConnectNumber: Integer);
    procedure DBGridInvoiceDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure RBInetClick(Sender: TObject);
    procedure SaveSettings;
    procedure LoadSettings;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridInvoiceDblClick(Sender: TObject);
    procedure EditNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure EditNumberChange(Sender: TObject);
    procedure DatePastChange(Sender: TObject);
    procedure DateFutureChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditProviderRightButtonClick(Sender: TObject);
    procedure BBEditClearClick(Sender: TObject);
    procedure DBGridInvoiceMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    EditNum, DateP, DateF, MClick: Boolean;
  public
    { Public declarations }
    InvStart: Boolean;
  end;

var
  FormInvoice: TFormInvoice;
  T: TTime;
  fs: string;
  Value1, Value2, Value3: Variant;
  Color1, Color2, Color3: TColor;


implementation

{$R *.dfm}

uses DM_s, FormInvoiceBody_s, FormAgentsRelease_s;

//////////////////////////Основная часть программы//////////////////////////////
procedure TFormInvoice.BBEditClearClick(Sender: TObject);
begin
  EditProvider.Clear;
  DM.QueryInvoice.Filtered:= False;
  DM.QueryInvoice.Last;
  StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
end;

procedure TFormInvoice.BitBtn1Click(Sender: TObject);
begin
  Close; //Выход из программы
end;

procedure TFormInvoice.ConnectBase(ConnectNumber: Integer); //Подключение к базам
begin
  DM.QueryInvoice.Filtered:= False;
  DM.QueryInvoice.Active:= False;
  DM.ADOConnect.Connected:= False;

  case ConnectNumber of
    0: DM.ADOConnect.ConnectString:= 'Data Source=ORAS;User ID=factory_hope;Password=hope;Login Prompt=False';
    1: DM.ADOConnect.ConnectString:= 'Data Source=OREL;User ID=factory_hope;Password=hope;Login Prompt=False';
    2: DM.ADOConnect.ConnectString:= 'Data Source=KRDAR;User ID=factory_hope;Password=hope;Login Prompt=False';
  end;

  try DM.ADOConnect.Connected:= True;
  except
    Application.MessageBox('Нет подключения к базе...', 'Упссс(((', 0);
  end;

  DM.QueryInvoice.Active:= True;
  T:= (Time);

  if ConnectNumber = 0 then
    StatusBarInvoice.Panels[0].Text:= 'oracle-main.tmb.nf (Тамбов) Время: ' + TimeToStr(T);
    StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
  if ConnectNumber = 1 then
    StatusBarInvoice.Panels[0].Text:= 'oracle-main.orel.nf (Орёл) Время: ' + TimeToStr(T);
    StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
  if ConnectNumber = 2 then
    StatusBarInvoice.Panels[0].Text:= 'oracle-main.krdar.nf (Краснодар) Время: ' + TimeToStr(T);
    StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
end;

procedure TFormInvoice.ComboBoxBaseClick(Sender: TObject);
begin
  case ComboBoxBase.ItemIndex of
    0: ConnectBase(0); //Тамбов
    1: ConnectBase(1); //Орёл
    2: ConnectBase(2); //Краснодар
  end;

  //В зависимости от базы сохраняет положение RadioButton и фильтрует данные
  if ComboBoxBase.ItemIndex = 0 then
    if RBAll.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Active:= False;
        DM.QueryInvoice.Params.ParamByName('date1').Value:= DatePast.Date;
        DM.QueryInvoice.Params.ParamByName('date2').Value:= DateFuture.Date;
        DM.QueryInvoice.Active:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBGood.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Загружена''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBInet.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Интернет_заказ like ''Инет-заказ''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBNo.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Не привязана''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBYes.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Привязана''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
  else
    DM.QueryInvoice.Filtered:= False;

  if ComboBoxBase.ItemIndex = 1 then
    if RBAll.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Active:= False;
        DM.QueryInvoice.Params.ParamByName('date1').Value:= DatePast.Date;
        DM.QueryInvoice.Params.ParamByName('date2').Value:= DateFuture.Date;
        DM.QueryInvoice.Active:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBGood.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Загружена''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBInet.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Интернет_заказ like ''Инет-заказ''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBNo.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Не привязана''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBYes.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Привязана''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
  else
    DM.QueryInvoice.Filtered:= False;

  if ComboBoxBase.ItemIndex = 2 then
    if RBAll.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Active:= False;
        DM.QueryInvoice.Params.ParamByName('date1').Value:= DatePast.Date;
        DM.QueryInvoice.Params.ParamByName('date2').Value:= DateFuture.Date;
        DM.QueryInvoice.Active:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBGood.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Загружена''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBInet.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Интернет_заказ like ''Инет-заказ''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBNo.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Не привязана''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
    else if RBYes.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Привязана''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
  else
    DM.QueryInvoice.Filtered:= False;
end;

/////////////////////////////Поиск по поставщику////////////////////////////////
procedure TFormInvoice.DateFutureChange(Sender: TObject);
begin
  DateF:= True;
end;

procedure TFormInvoice.DatePastChange(Sender: TObject);
begin
  DateP:= True;
end;

//////////////////////////Поиск по номеру накладной/////////////////////////////
procedure TFormInvoice.EditNumberChange(Sender: TObject);
begin
  EditNum:= True;
end;

procedure TFormInvoice.EditNumberKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditNumber.Text <> '' then
    if Key = VK_RETURN then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'DOC_NUMBER like ' + QuotedStr('%'+EditNumber.Text+'%');
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
  else
    DM.QueryInvoice.Filtered:= False;
    StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
end;

procedure TFormInvoice.EditProviderRightButtonClick(Sender: TObject);
begin
  FormAgentsRelease.Position:= poMainFormCenter;
  FormAgentsRelease.Show;
end;

////////////////////////////////////RB-кнопки///////////////////////////////////
procedure TFormInvoice.RBAllClick(Sender: TObject);
begin
  if RBAll.Checked = True then
    begin
      DM.QueryInvoice.Filtered:= False;
      DM.QueryInvoice.Active:= False;
      DM.QueryInvoice.Params.ParamByName('date1').Value:= DatePast.Date;
      DM.QueryInvoice.Params.ParamByName('date2').Value:= DateFuture.Date;
      DM.QueryInvoice.Active:= True;
      DM.QueryInvoice.Last;
      StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
    end
  else
    DM.QueryInvoice.Filtered:= False;
end;

procedure TFormInvoice.RBGoodClick(Sender: TObject);
begin
  if RBGood.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Загружена''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
  else
    DM.QueryInvoice.Filtered:= False;
end;

procedure TFormInvoice.RBInetClick(Sender: TObject);
begin
  if RBInet.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Интернет_заказ like ''Инет-заказ''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
  else
    DM.QueryInvoice.Filtered:= False;
end;

procedure TFormInvoice.RBNoClick(Sender: TObject);
begin
  if RBNo.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Не привязана''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
  else
    DM.QueryInvoice.Filtered:= False;
end;

procedure TFormInvoice.RBYesClick(Sender: TObject);
begin
  if RBYes.Checked = True then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'Статус like ''Привязана''';
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
  else
    DM.QueryInvoice.Filtered:= False;
end;
//////////////////////////////////ПРОЧЕЕ////////////////////////////////////////
procedure TFormInvoice.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  InvStart:= False;
//  SaveSettings;
end;

procedure TFormInvoice.FormShow(Sender: TObject);
begin
  InvStart:= True;
//  LoadSettings;
  DatePast.Date:= Now - 4; //текущая дата минус 4 дня
  DateFuture.Date:= Now;   //текущая дата
  ConnectBase(0);          //к какой базе будет подключение при запуске окна

  DM.QueryInvoice.Active:= False;
  DM.QueryInvoice.Params.ParamByName('date1').Value:= DatePast.Date;
  DM.QueryInvoice.Params.ParamByName('date2').Value:= DateFuture.Date;
  DM.QueryInvoice.Active:= True;
  DM.QueryInvoice.Last;
  StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
end;

//Загрузка из реестра
procedure TFormInvoice.LoadSettings;
var
  Reg: TRegistry;
begin
{  Reg:= TRegistry.Create;
  try
    Reg.RootKey:= HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope\FormInvoice', false) then
      begin
        if Reg.ValueExists('Left') then FormInvoice.Left := Reg.ReadInteger('Left');
        if Reg.ValueExists('Top') then FormInvoice.Top := Reg.ReadInteger('Top');
        if Reg.ValueExists('Width') then FormInvoice.Width := Reg.ReadInteger('Width');
        if Reg.ValueExists('Height') then FormInvoice.Height := Reg.ReadInteger('Height');
        Reg.CloseKey;
      end;
    finally
      Reg.free;
  end;}
end;

procedure TFormInvoice.N1Click(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    if ActiveControl.Focused then
      Clipboard.AsText := TDBGridEh(ActiveControl).SelectedField.AsString
    else
      if TDBGridEh(ActiveControl).InplaceEditor.Focused then
        Clipboard.AsText := TDBGridEh(ActiveControl).InplaceEditor.SelText;
end;

//Сохранение в реестр
procedure TFormInvoice.SaveSettings;
var
  Reg: TRegistry;
begin
{  Reg:= TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope\FormInvoice', true) then
      begin
        Reg.WriteInteger('Left', FormInvoice.Left);
        Reg.WriteInteger('Top', FormInvoice.Top);
        Reg.WriteInteger('Width', FormInvoice.Width);
        Reg.WriteInteger('Height', FormInvoice.Height);
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
  end;}
end;

// Сортировка по возрастанию/убыванию
procedure TFormInvoice.DBGridInvoiceTitleClick(Column: TColumnEh);
var
  s: string;
begin
  if DM.QueryInvoice.FieldByName(Column.FieldName).Tag = 0 then
    begin
      s:= ' DESC';
      DM.QueryInvoice.FieldByName(Column.FieldName).Tag:= 1;
    end
  else
    begin
      s:= ' ASC';
      DM.QueryInvoice.FieldByName(Column.FieldName).Tag:= 0;
    end;

  DM.QueryInvoice.IndexFieldNames:= Column.FieldName + s;
  StatusBarInvoice.Panels[2].Text:= 'Сортировка по:  ' + Column.Title.Caption;
end;

procedure TFormInvoice.DBGridInvoiceDblClick(Sender: TObject);
begin
  DM.QueryInvoiceBody.Active:= False;
  DM.QueryInvoiceBody.Params.ParamByName('ZAKAZ').Value:= DM.QueryInvoice.FieldByName('ID_ZAKAZ').AsString;
  DM.QueryInvoiceBody.Active:= True;
  FormInvoiceBody.T:= (Time);

  if DM.QueryInvoiceBody.Session.Server = 'ORAS' then
    FormInvoiceBody.StatusBarInvoiceBody.Panels[0].Text:= 'oracle-main.tmb.nf (Тамбов) Время: ' + TimeToStr(FormInvoiceBody.T);
  if DM.QueryInvoiceBody.Session.Server = 'OREL' then
    FormInvoiceBody.StatusBarInvoiceBody.Panels[0].Text:= 'oracle-main.orel.nf (Орёл) Время: ' + TimeToStr(FormInvoiceBody.T);
  if DM.QueryInvoiceBody.Session.Server = 'KRDAR' then
    FormInvoiceBody.StatusBarInvoiceBody.Panels[0].Text:= 'oracle-main.krdar.nf (Краснодар) Время: ' + TimeToStr(FormInvoiceBody.T);

  FormInvoiceBody.Show;
end;

// Закрашивание ячеек в зависимости от данных
procedure TFormInvoice.DBGridInvoiceDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  Value1:= DBGridInvoice.Fields[0].Value;
  Value2:= DBGridInvoice.Fields[1].Value;
  Value3:= DBGridInvoice.Fields[2].Value;

  if DataCol = 0 then
    begin
      if Value1 = 'Марк' then
        Color1:= clTeal
      else
        Color1:= clWebIndianRed;

      DBGridInvoice.Canvas.Brush.Color:= Color1;
      DBGridInvoice.Canvas.FillRect(Rect);
    end;

  if DataCol = 1 then
    begin
      if Value2 = 'Инет-заказ' then //интернет-заказ в нашу аптеку
        Color2:= clWebDarkViolet
      else
        Color2:= clWebIndianRed;

      DBGridInvoice.Canvas.Brush.Color:= Color2;
      DBGridInvoice.Canvas.FillRect(Rect);
    end;

  if DataCol = 2 then
    begin
      if Value3 = 'Загружена' then //загружена в п/а
        Color3:= clWebMediumAquamarine
      else if Value3 = 'Привязана' then //привязаны наименование/производитель
        Color3:= clWebGreen;

      DBGridInvoice.Canvas.Brush.Color:= Color3;
      DBGridInvoice.Canvas.FillRect(Rect);
    end;

  DBGridInvoice.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormInvoice.DBGridInvoiceMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if EditNum = True then
    if EditNumber.Text <> '' then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'DOC_NUMBER like ' + QuotedStr(EditNumber.Text);
        DM.QueryInvoice.Filtered:= True;
        DM.QueryInvoice.Last;
        EditNum:= False;
        StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end
  else
    DM.QueryInvoice.Filtered:= False;
    StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);

  if DateP = True then
    begin
      DM.QueryInvoice.Active:= False;
      DM.QueryInvoice.Params.ParamByName('date1').Value:= DatePast.Date;
      DM.QueryInvoice.Params.ParamByName('date2').Value:= DateFuture.Date;
      DM.QueryInvoice.Active:= True;
      DM.QueryInvoice.Last;
      DateP:= False;
      StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
    end;

  if DateF = True then
    begin
      DM.QueryInvoice.Active:= False;
      DM.QueryInvoice.Params.ParamByName('date1').Value:= DatePast.Date;
      DM.QueryInvoice.Params.ParamByName('date2').Value:= DateFuture.Date;
      DM.QueryInvoice.Active:= True;
      DM.QueryInvoice.Last;
      DateF:= False;
      StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
    end;
end;

end.
