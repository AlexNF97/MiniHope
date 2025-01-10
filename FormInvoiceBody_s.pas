unit FormInvoiceBody_s;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin, Vcl.ComCtrls, Registry, Vcl.Menus, Clipbrd,
  Vcl.ExtCtrls;

type
  TFormInvoiceBody = class(TForm)
    DBGridInvoiceBody: TDBGridEh;
    StatusBarInvoiceBody: TStatusBar;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Timer1: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridInvoiceBodyDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure SaveSettings;
    procedure LoadSettings;
    procedure DBGridInvoiceBodyColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    T: TTime;
  end;

var
  FormInvoiceBody: TFormInvoiceBody;
  Value1, Value2: Variant;
  Color1, Color2: TColor;

implementation

{$R *.dfm}

uses DM_s, FormInvoice_s;

procedure TFormInvoiceBody.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormInvoiceBody.DBGridInvoiceBodyColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
   DBGridInvoiceBody.Columns[ToIndex].Index := FromIndex;
end;

procedure TFormInvoiceBody.DBGridInvoiceBodyDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  Value1:= DBGridInvoiceBody.Fields[0].Value;
  Value2:= DBGridInvoiceBody.Fields[1].Value;

  if DataCol = 0 then
    begin
      if Value1 = 'Марк' then
        Color1:= clTeal
      else
        Color1:= clWebIndianRed;

      DBGridInvoiceBody.Canvas.Brush.Color:= Color1;
      DBGridInvoiceBody.Canvas.FillRect(Rect);
    end;

  if DataCol = 1 then
    begin
      if Value2 = 'Привязано' then
        Color2:= clWebMediumAquamarine
      else if Value2 = 'Не привяз' then
        Color2:= clWebIndianRed;

      DBGridInvoiceBody.Canvas.Brush.Color:= Color2;
      DBGridInvoiceBody.Canvas.FillRect(Rect);
    end;
  DBGridInvoiceBody.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFormInvoiceBody.FormActivate(Sender: TObject);
begin
  LoadSettings;
  StatusBarInvoiceBody.Panels[1].Text:= 'Всего записей: ' + IntToStr(DM.QueryInvoiceBody.RecordCount);
  FormInvoiceBody.Caption:= 'Электронная накладная: ' + DM.QueryInvoice.FieldByName('DOC_NUMBER').AsString;
end;

procedure TFormInvoiceBody.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.QueryInvoiceBody.Active:= False;
  SaveSettings;
end;

//Загрузка из реестра
procedure TFormInvoiceBody.LoadSettings;
var
  Reg: TRegistry;
begin
  Reg:= TRegistry.Create;
  try
    Reg.RootKey:= HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope\FormInvoice\FormInvoiceBody', false) then
      begin
        if Reg.ValueExists('Left') then FormInvoice.Left := Reg.ReadInteger('Left');
        if Reg.ValueExists('Top') then FormInvoice.Top := Reg.ReadInteger('Top');
        if Reg.ValueExists('Width') then FormInvoice.Width := Reg.ReadInteger('Width');
        if Reg.ValueExists('Height') then FormInvoice.Height := Reg.ReadInteger('Height');
        Reg.CloseKey;
      end;
    finally
      Reg.free;
  end;
end;

procedure TFormInvoiceBody.N1Click(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    if ActiveControl.Focused then
      Clipboard.AsText := TDBGridEh(ActiveControl).SelectedField.AsString
    else
      if TDBGridEh(ActiveControl).InplaceEditor.Focused then
        Clipboard.AsText := TDBGridEh(ActiveControl).InplaceEditor.SelText;
end;

//Сохранение в реестр
procedure TFormInvoiceBody.SaveSettings;
var
  Reg: TRegistry;
begin
  Reg:= TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope\FormInvoice\FormInvoiceBody', true) then
      begin
        Reg.WriteInteger('Left', FormInvoice.Left);
        Reg.WriteInteger('Top', FormInvoice.Top);
        Reg.WriteInteger('Width', FormInvoice.Width);
        Reg.WriteInteger('Height', FormInvoice.Height);
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
  end;
end;

end.
