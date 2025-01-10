unit FormRelease_s;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.ComCtrls, EhLibVCL, GridsEh, DBAxisGridsEh,
  DBGridEh, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
  Vcl.Mask, DBCtrlsEh, DBLookupEh, Vcl.DBCtrls, Registry;

type
  TFormRelease = class(TForm)
    DBGridRelease: TDBGridEh;
    StatusBarRelease: TStatusBar;
    Timer1: TTimer;
    ImageList1: TImageList;
    BBClose: TBitBtn;
    ComboBoxBase: TComboBox;
    DateFuture: TDateTimePicker;
    DatePast: TDateTimePicker;
    EditAgents: TButtonedEdit;
    EditNumber: TEdit;
    EditZakaz: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    procedure BBCloseClick(Sender: TObject);
    procedure DBGridReleaseDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure ConnectBase(ConnectNumber: Integer);
    procedure ComboBoxBaseClick(Sender: TObject);
    procedure SaveSettings;
    procedure LoadSettings;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridReleaseDblClick(Sender: TObject);
    procedure DatePastChange(Sender: TObject);
    procedure DateFutureChange(Sender: TObject);
    procedure EditNumberChange(Sender: TObject);
    procedure EditZakazChange(Sender: TObject);
    procedure DBGridReleaseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure EditAgentsRightButtonClick(Sender: TObject);
  private
    { Private declarations }
    T: TTime;
    Value1: Variant;
    Color1: TColor;
    DateP, DateF, EditNum, EditZak, DBClick: Boolean;
  public
    { Public declarations }
    RelStart: Boolean;
  end;

var
  FormRelease: TFormRelease;

implementation

{$R *.dfm}

uses DM_s, FormReleaseBody_s, FormAgentsRelease_s;

procedure TFormRelease.DateFutureChange(Sender: TObject);
begin
  DateF:= True;
end;

procedure TFormRelease.DatePastChange(Sender: TObject);
begin
  DateP:= True;
end;

procedure TFormRelease.EditNumberChange(Sender: TObject);
begin
  EditNum:= True;
end;

procedure TFormRelease.EditZakazChange(Sender: TObject);
begin
  EditZak:= True;
end;

procedure TFormRelease.EditAgentsRightButtonClick(Sender: TObject);
begin
  FormAgentsRelease.Position:= poMainFormCenter;
  FormAgentsRelease.Show;
end;

procedure TFormRelease.ConnectBase(ConnectNumber: Integer);//Подключение к базам
var
  i: Integer;
begin
  DM.ADOConnect.Connected:= False;
  i:= 1000;
  case ConnectNumber of
    0: DM.ADOConnect.ConnectString:= 'Data Source=ORAS;User ID=factory_hope;Password=hope;Login Prompt=False';
    1: DM.ADOConnect.ConnectString:= 'Data Source=OREL;User ID=factory_hope;Password=hope;Login Prompt=False';
    2: DM.ADOConnect.ConnectString:= 'Data Source=KRDAR;User ID=factory_hope;Password=hope;Login Prompt=False';
  end;

  try DM.ADOConnect.Connected:= True;
  except
    Application.MessageBox('Нет подключения к базе...', 'Упссс(((', 0);
  end;

  T:= (Time);

  if ConnectNumber = 0 then
    begin
      DM.QueryRelease.Active:= False;
      DM.QueryRelease.Params.ParamByName('datep').Value:= DatePast.Date;
      DM.QueryRelease.Params.ParamByName('datef').Value:= DateFuture.Date;
      DM.QueryRelease.Active:= True;
      DM.QueryRelease.Last;
      StatusBarRelease.Panels[1].Text := 'Всего записей: ' + IntToStr(DM.QueryRelease.RecordCount);
      StatusBarRelease.Panels[0].Text:= 'oracle-main.tmb.nf (Тамбов) Время: ' + TimeToStr(T);
    end;

  if ConnectNumber = 1 then
    begin
      DM.QueryRelease.Active:= False;
      DM.QueryRelease.Params.ParamByName('datep').Value:= DatePast.Date;
      DM.QueryRelease.Params.ParamByName('datef').Value:= DateFuture.Date;
      DM.QueryRelease.Active:= True;
      DM.QueryRelease.Last;
      StatusBarRelease.Panels[1].Text := 'Всего записей: ' + IntToStr(DM.QueryRelease.RecordCount);
      StatusBarRelease.Panels[0].Text:= 'oracle-main.orel.nf (Орёл) Время: ' + TimeToStr(T);
    end;

  if ConnectNumber = 2 then
    begin
      DM.QueryRelease.Active:= False;
      DM.QueryRelease.Params.ParamByName('datep').Value:= DatePast.Date;
      DM.QueryRelease.Params.ParamByName('datef').Value:= DateFuture.Date;
      DM.QueryRelease.Active:= True;
      DM.QueryRelease.Last;
      StatusBarRelease.Panels[1].Text := 'Всего записей: ' + IntToStr(DM.QueryRelease.RecordCount);
      StatusBarRelease.Panels[0].Text:= 'oracle-main.krdar.nf (Краснодар) Время: ' + TimeToStr(T);
    end;
end;

procedure TFormRelease.ComboBoxBaseClick(Sender: TObject);
begin
  case ComboBoxBase.ItemIndex of
    0: ConnectBase(0); //Тамбов
    1: ConnectBase(1); //Орёл
    2: ConnectBase(2); //Краснодар
  end;
end;

procedure TFormRelease.DBGridReleaseDblClick(Sender: TObject);
begin
  DM.QueryReleaseBody.Active:= False;
  DM.QueryReleaseSum.Active:= False;
  DM.QueryReleaseBody.Params.ParamByName('ORD').Value:= DM.QueryRelease.FieldByName('ID_ORDER').AsString;
  DM.QueryReleaseSum.Params.ParamByName('ORD').Value:= DM.QueryRelease.FieldByName('ID_ORDER').AsString;
  DM.QueryReleaseBody.Active:= True;
  DM.QueryReleaseSum.Active:= True;

  if DM.QueryRelease.FieldByName('МЕНЕДЖЕР').Value = 'Аптека' then
    begin
      DM.QueryReleaseBody.FieldByName('РОЗНИЦА_ЦЕНА').Visible:= True;
      DM.QueryReleaseBody.FieldByName('РОЗНИЦА_СУММА').Visible:= True;
      DM.QueryReleaseBody.FieldByName('РОЗНИЦА_ПРОЦ').Visible:= True;
    end
  else
    begin
      DM.QueryReleaseBody.FieldByName('РОЗНИЦА_ЦЕНА').Visible:= False;
      DM.QueryReleaseBody.FieldByName('РОЗНИЦА_СУММА').Visible:= False;
      DM.QueryReleaseBody.FieldByName('РОЗНИЦА_ПРОЦ').Visible:= False;
    end;

  FormReleaseBody.Position:= poMainFormCenter;
  FormReleaseBody.Show;
end;

procedure TFormRelease.DBGridReleaseDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  Value1:= DBGridRelease.Fields[18].Value;

  if DataCol = 3 then
    begin
      if Value1 = 'В работе у оператора' then
        Color1:= clWebGreen
      else if Value1 = 'В работе на складе' then
        Color1:= clWebRed
      else if Value1 = 'В работе (возврат)' then
        Color1:= clWebCoral
      else if Value1 = 'В работе (возврат)' then
        Color1:= clWebCoral
      else if Value1 = 'В работе (возврат)' then
        Color1:= clWebCoral
      else if Value1 = 'В работе (возврат)' then
        Color1:= clWebCoral
      else if Value1 = 'Отправлен в работу на склад' then
        Color1:= clWebCoral
      else if Value1 = 'Контроль завершён' then
        Color1:= clWebDodgerBlue
      else if Value1 = 'Обработка на шедуллере' then
        Color1:= clWebDarkOrchid
      else if Value1 = 'Подготовлен к печати' then
        Color1:= clWebBlue
      else if Value1 = 'Всё готово, дальше фиксация' then
        Color1:= clWebGold
      else if Value1 = 'Зафиксирован' then
        Color1:= clWebDarkTurquoise;

      DBGridRelease.Canvas.Brush.Color:= Color1;
      DBGridRelease.Canvas.FillRect(Rect);
    end;

  DBGridRelease.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormRelease.DBGridReleaseMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DBClick:= True;
  try
    if EditZak = True then
      if EditZakaz.Text <> '' then
        begin
          DM.QueryRelease.Filtered:= False;
          DM.QueryRelease.Filter:= 'Заказ = ' + EditZakaz.Text;
          DM.QueryRelease.Filtered:= True;
          DM.QueryRelease.Last;
          StatusBarRelease.Panels[1].Text := 'Всего записей: ' + IntToStr(DM.QueryRelease.RecordCount);
          EditZak:= False;
          DBClick:= False;
        end
      else DM.QueryRelease.Filtered:= False;

    if EditNum = True then
      if EditNumber.Text <> '' then
        begin
          DM.QueryRelease.Filtered:= False;
          DM.QueryRelease.Filter:= 'Номер = ' + EditNumber.Text;
          DM.QueryRelease.Filtered:= True;
          DM.QueryRelease.Last;
          StatusBarRelease.Panels[1].Text := 'Всего записей: ' + IntToStr(DM.QueryRelease.RecordCount);
          EditNum:= False;
          DBClick:= False;
        end
      else DM.QueryRelease.Filtered:= False;

    if DateP = True then
      begin
        DM.QueryRelease.Active:= False;
        DM.QueryRelease.Params.ParamByName('datep').Value:= DatePast.Date;
        DM.QueryRelease.Params.ParamByName('datef').Value:= DateFuture.Date;
        DM.QueryRelease.Active:= True;
        DM.QueryRelease.Last;
        StatusBarRelease.Panels[1].Text := 'Всего записей: ' + IntToStr(DM.QueryRelease.RecordCount);
        DBClick:= False;
        DateP:= False;
      end;

    if DateF = True then
      begin
        DM.QueryRelease.Active:= False;
        DM.QueryRelease.Params.ParamByName('datep').Value:= DatePast.Date;
        DM.QueryRelease.Params.ParamByName('datef').Value:= DateFuture.Date;
        DM.QueryRelease.Active:= True;
        DM.QueryRelease.Last;
        StatusBarRelease.Panels[1].Text := 'Всего записей: ' + IntToStr(DM.QueryRelease.RecordCount);
        DBClick:= False;
        DateF:= False;
      end;
  except
    on E: Exception do
      begin
        ShowMessage('Ошибка: ' + E.Message);
      end;
  end;
end;

procedure TFormRelease.BBCloseClick(Sender: TObject);
begin
  DM.QueryRelease.Active:= False;
  Close;
end;

procedure TFormRelease.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  RelStart:= False;
  SaveSettings;
end;

procedure TFormRelease.FormShow(Sender: TObject);
begin
  RelStart:= True;
  DBClick:= False;
  LoadSettings;
  DateFuture.DateTime:= Now;
  DatePast.DateTime:= Now - 1;
  ConnectBase(0);

  DM.QueryRelease.Active:= False;
  DM.QueryRelease.Params.ParamByName('datep').Value:= DatePast.Date;
  DM.QueryRelease.Params.ParamByName('datef').Value:= DateFuture.Date;
  DM.QueryRelease.Active:= True;
  DM.QueryRelease.Last;
  StatusBarRelease.Panels[1].Text := 'Всего записей: ' + IntToStr(DM.QueryRelease.RecordCount);
end;

//Загрузка из реестра
procedure TFormRelease.LoadSettings;
var
  Reg: TRegistry;
begin
  Reg:= TRegistry.Create;
  try
    Reg.RootKey:= HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope\FormRelease', false) then
      begin
        if Reg.ValueExists('Left') then FormRelease.Left := Reg.ReadInteger('Left');
        if Reg.ValueExists('Top') then FormRelease.Top := Reg.ReadInteger('Top');
        if Reg.ValueExists('Width') then FormRelease.Width := Reg.ReadInteger('Width');
        if Reg.ValueExists('Height') then FormRelease.Height := Reg.ReadInteger('Height');
        Reg.CloseKey;
      end;
    finally
      Reg.free;
  end;
end;

//Сохранение в реестр
procedure TFormRelease.SaveSettings;
var
  Reg: TRegistry;
begin
  Reg:= TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope\FormRelease', true) then
      begin
        Reg.WriteInteger('Left', FormRelease.Left);
        Reg.WriteInteger('Top', FormRelease.Top);
        Reg.WriteInteger('Width', FormRelease.Width);
        Reg.WriteInteger('Height', FormRelease.Height);
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
  end;
end;

end.
