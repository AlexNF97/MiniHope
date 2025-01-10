unit FormSearch_s;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, System.ImageList, Vcl.ImgList, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.WinXCtrls, Registry, Vcl.ToolWin;

type
  TFormSearch = class(TForm)
    DBGridSearch: TDBGridEh;
    StatusBarSearch: TStatusBar;
    DBGridEh1: TDBGridEh;
    SearchEdit: TEdit;
    DTime: TDateTimePicker;
    LsnameEdit: TEdit;
    BBClose: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure SearchEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SaveSettings;
    procedure LoadSettings;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure LsnameEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BBCloseClick(Sender: TObject);
    procedure SearchEditClick(Sender: TObject);
    procedure LsnameEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSearch: TFormSearch;

implementation

{$R *.dfm}

uses DM_s;


procedure TFormSearch.BBCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormSearch.DBGridEh1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if LsnameEdit.Text <> '' then
    begin
      DM.QuerySearchLastname.Active:= False;
      DM.QuerySearchLastname.Params.ParamByName('lsname').Value:= LsnameEdit.Text;
      DM.QuerySearchLastname.Params.ParamByName('dat').Value:= DTime.Date;
      DM.QuerySearchLastname.Active:= True;
    end;
end;

procedure TFormSearch.FormActivate(Sender: TObject);
begin
  DTime.Date:= now;
end;

procedure TFormSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
end;

procedure TFormSearch.FormCreate(Sender: TObject);
begin
  LoadSettings;
  StatusBarSearch.Panels[0].Text:= 'oracle-main.tmb.nf (врьсют)';
end;

procedure TFormSearch.SearchEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if SearchEdit.Text <> '' then
    if Key = VK_RETURN then
      begin
        DM.QuerySearchIP.Active:= False;
        DM.QuerySearchIP.Params.ParamByName('ip').Value:= SearchEdit.Text;
        DM.QuerySearchIP.Params.ParamByName('dat').Value:= DTime.Date;
        DM.QuerySearchIP.Active:= True;
      end;
end;

procedure TFormSearch.SearchEditClick(Sender: TObject);
begin
  SearchEdit.Clear;
end;

procedure TFormSearch.SaveSettings;
var
  Reg: TRegistry;
begin
  Reg:= TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope\FormSearch', true) then
      begin
        Reg.WriteInteger('Left', FormSearch.Left);
        Reg.WriteInteger('Top', FormSearch.Top);
        Reg.WriteInteger('Width', FormSearch.Width);
        Reg.WriteInteger('Height', FormSearch.Height);
        Reg.CloseKey;
      end;
    finally
      Reg.Free;
  end;
end;

procedure TFormSearch.LoadSettings;
var
  Reg: TRegistry;
begin
  Reg:= TRegistry.Create;
  try
    Reg.RootKey:= HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope\FormSearch', false) then
      begin
        if Reg.ValueExists('Left') then FormSearch.Left := Reg.ReadInteger('Left');
        if Reg.ValueExists('Top') then FormSearch.Top := Reg.ReadInteger('Top');
        if Reg.ValueExists('Width') then FormSearch.Width := Reg.ReadInteger('Width');
        if Reg.ValueExists('Height') then FormSearch.Height := Reg.ReadInteger('Height');
        Reg.CloseKey;
      end;
    finally
      Reg.free;
  end;
end;

procedure TFormSearch.LsnameEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if LsnameEdit.Text <> '' then
      if Key = VK_RETURN then
        begin
          DM.QuerySearchLastname.Active:= False;
          DM.QuerySearchLastname.Params.ParamByName('lsname').Value:= LsnameEdit.Text;
          DM.QuerySearchLastname.Params.ParamByName('dat').Value:= DTime.Date;
          DM.QuerySearchLastname.Active:= True;
        end;
end;

procedure TFormSearch.LsnameEditClick(Sender: TObject);
begin
  LsnameEdit.Clear;
end;

end.
