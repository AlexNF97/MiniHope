unit FormAgentsRelease_s;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Vcl.StdCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Buttons, Registry;

type
  TFormAgentsRelease = class(TForm)
    DBGridAgentsRelease: TDBGridEh;
    ToolBarAgents: TToolBar;
    Label1: TLabel;
    ToolButton1: TToolButton;
    EditName: TEdit;
    BBClose: TBitBtn;
    ToolButton2: TToolButton;
    BBClear: TBitBtn;
    ToolButton3: TToolButton;
    procedure FormActivate(Sender: TObject);
    procedure BBCloseClick(Sender: TObject);
    procedure DBGridAgentsReleaseMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BBClearClick(Sender: TObject);
    procedure DBGridAgentsReleaseDblClick(Sender: TObject);
    procedure EditNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LoadSettings;
    procedure SaveSettings;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    BBClick: Boolean;
  public
    { Public declarations }
  end;

var
  FormAgentsRelease: TFormAgentsRelease;

implementation

{$R *.dfm}

uses DM_s, FormRelease_s, FormZakaz_s, FormInvoice_s;

procedure TFormAgentsRelease.BBCloseClick(Sender: TObject);
begin
  DM.QueryAgentsRelease.Active:= False;
  FormAgentsRelease.Close;
  DM.QueryRelease.Filtered:= False;
  DM.QueryZakaz.Filtered:= False;
  DM.QueryInvoice.Filtered:= False;
end;

procedure TFormAgentsRelease.BBClearClick(Sender: TObject);
begin
  EditName.Clear;

  if FormRelease.RelStart = True then
    DM.QueryRelease.Filtered:= False;
    FormRelease.EditAgents.Clear;
    DM.QueryAgentsRelease.Active:= False;
    DM.QueryAgentsRelease.SQL.Clear;
    DM.QueryAgentsRelease.SQL.Add('select a.name as Наименование, a.id_agent as Код, u.user_real_name as Менеджер from agents a join users u on u.id_user=a.id_manager');
    DM.QueryAgentsRelease.Active:= True;

  if FormZakaz.ZakStart = True then
    DM.QueryZakaz.Filtered:= False;
    FormZakaz.EditAgents.Clear;
    DM.QueryAgentsRelease.Active:= False;
    DM.QueryAgentsRelease.SQL.Clear;
    DM.QueryAgentsRelease.SQL.Add('select a.name as Наименование, a.id_agent as Код, u.user_real_name as Менеджер from agents a join users u on u.id_user=a.id_manager');
    DM.QueryAgentsRelease.Active:= True;

  if FormInvoice.InvStart = True then
    DM.QueryInvoice.Filtered:= False;
    FormInvoice.EditProvider.Clear;
    DM.QueryAgentsRelease.Active:= False;
    DM.QueryAgentsRelease.SQL.Clear;
    DM.QueryAgentsRelease.SQL.Add('select a.name as Наименование, a.id_agent as Код, u.user_real_name as Менеджер from agents a join users u on u.id_user=a.id_manager');
    DM.QueryAgentsRelease.Active:= True;
end;

procedure TFormAgentsRelease.DBGridAgentsReleaseDblClick(Sender: TObject);
begin
  if FormRelease.RelStart = True then
    FormRelease.EditAgents.Text:= DM.QueryAgentsRelease.FieldByName('Наименование').AsString;
    FormAgentsRelease.Close;
    if FormRelease.EditAgents.Text <> '' then
      begin
        DM.QueryRelease.Filtered:= False;
        DM.QueryRelease.Filter:= 'АГЕНТ = ' + QuotedStr(FormRelease.EditAgents.Text);
        DM.QueryRelease.Filtered:= True;
        FormRelease.StatusBarRelease.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryRelease.RecordCount);
      end;

  if FormZakaz.ZakStart = True then
    FormZakaz.EditAgents.Text:= DM.QueryAgentsRelease.FieldByName('Наименование').AsString;
    FormAgentsRelease.Close;
    if FormZakaz.EditAgents.Text <> '' then
      begin
        DM.QueryZakaz.Filtered:= False;
        DM.QueryZakaz.Filter:= 'КЛИЕНТ = ' + QuotedStr(FormZakaz.EditAgents.Text);
        DM.QueryZakaz.Filtered:= True;
        DM.QueryZakaz.Last;
        FormZakaz.StatusBarZakaz.Panels[2].Text:= 'Всего записей: ' + IntToStr(DM.QueryZakaz.RecordCount);
      end;

  if FormInvoice.InvStart = True then
    FormInvoice.EditProvider.Text:= DM.QueryAgentsRelease.FieldByName('Наименование').AsString;
    FormAgentsRelease.Close;
    if FormInvoice.EditProvider.Text <> '' then
      begin
        DM.QueryInvoice.Filtered:= False;
        DM.QueryInvoice.Filter:= 'PROVIDER = ' + QuotedStr(FormInvoice.EditProvider.Text);
        DM.QueryInvoice.Filtered:= True;
        FormInvoice.StatusBarInvoice.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoice.RecordCount);
      end;
end;

procedure TFormAgentsRelease.DBGridAgentsReleaseMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if EditName.Text <> '' then
    begin
      DM.QueryAgentsRelease.Active:= False;
      DM.QueryAgentsRelease.SQL.Clear;
      DM.QueryAgentsRelease.SQL.Add('select a.name as Наименование, a.id_agent as Код, u.user_real_name as Менеджер from agents a join users u on u.id_user=a.id_manager where lower(name) like ' + QuotedStr('%'+EditName.Text+'%'));
      DM.QueryAgentsRelease.Active:= True
    end;
end;

procedure TFormAgentsRelease.EditNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if EditName.Text <> '' then
    if Key = VK_RETURN then
      begin
        DM.QueryAgentsRelease.Active:= False;
        DM.QueryAgentsRelease.SQL.Clear;
        DM.QueryAgentsRelease.SQL.Add('select a.name as Наименование, a.id_agent as Код, u.user_real_name as Менеджер from agents a join users u on u.id_user=a.id_manager where lower(name) like ' + QuotedStr('%'+EditName.Text+'%'));
        DM.QueryAgentsRelease.Active:= True
      end;
end;

procedure TFormAgentsRelease.FormActivate(Sender: TObject);
begin
  DM.QueryAgentsRelease.Active:= True;
  LoadSettings;
end;

procedure TFormAgentsRelease.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
end;

//Загрузка из реестра
procedure TFormAgentsRelease.LoadSettings;
var
  Reg: TRegistry;
begin
  Reg:= TRegistry.Create;
  try
    Reg.RootKey:= HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope\FormRelease\FormAgents', false) then
      begin
        if Reg.ValueExists('Left') then FormAgentsRelease.Left := Reg.ReadInteger('Left');
        if Reg.ValueExists('Top') then FormAgentsRelease.Top := Reg.ReadInteger('Top');
        if Reg.ValueExists('Width') then FormAgentsRelease.Width := Reg.ReadInteger('Width');
        if Reg.ValueExists('Height') then FormAgentsRelease.Height := Reg.ReadInteger('Height');
        Reg.CloseKey;
      end;
    finally
      Reg.free;
  end;
end;

//Сохранение в реестр
procedure TFormAgentsRelease.SaveSettings;
var
  Reg: TRegistry;
begin
  Reg:= TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope\FormRelease\FormAgents', true) then
      begin
        Reg.WriteInteger('Left', FormAgentsRelease.Left);
        Reg.WriteInteger('Top', FormAgentsRelease.Top);
        Reg.WriteInteger('Width', FormAgentsRelease.Width);
        Reg.WriteInteger('Height', FormAgentsRelease.Height);
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
  end;
end;

end.
