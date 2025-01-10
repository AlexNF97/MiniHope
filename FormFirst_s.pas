unit FormFirst_s;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus, Registry,
  Vcl.AppEvnts, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFormFirst = class(TForm)
    BBSearchIP: TBitBtn;
    BBClose: TBitBtn;
    BBInvoice: TBitBtn;
    BBRelease: TBitBtn;
    BBZakaz: TBitBtn;
    BBGoods: TBitBtn;
    procedure BBSearchIPClick(Sender: TObject);
    procedure BBCloseClick(Sender: TObject);
    procedure SaveSettings;
    procedure LoadSettings;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BBInvoiceClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BBUpdateClick(Sender: TObject);
    procedure BBReleaseClick(Sender: TObject);
    procedure BBZakazClick(Sender: TObject);
    procedure BBGoodsClick(Sender: TObject);
  private
    { Private declarations }
    Reg: TRegistry;
  public
    { Public declarations }
  end;

var
  FormFirst: TFormFirst;
  T: TTime;

implementation

{$R *.dfm}

uses FormSearch_s, FormInvoice_s, FormUpdate_s, FormRelease_s, DM_s, FormZakaz_s, FormGoods_s;

procedure TFormFirst.BBCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormFirst.BBReleaseClick(Sender: TObject);
begin
  FormRelease.Position:= poMainFormCenter;
  FormRelease.Show;
end;

procedure TFormFirst.BBSearchIPClick(Sender: TObject);
begin
  FormSearch.Position:= poMainFormCenter;
  FormSearch.Show;
end;

procedure TFormFirst.BBUpdateClick(Sender: TObject);
begin
  FormUpdate.Position:= poMainFormCenter;
  FormUpdate.Show;
end;

procedure TFormFirst.BBZakazClick(Sender: TObject);
begin
  FormZakaz.Position:= poMainFormCenter;
  FormZakaz.Show;
end;

procedure TFormFirst.BBGoodsClick(Sender: TObject);
begin
  FormGoods.Position:= poMainFormCenter;
  FormGoods.Show;
end;

procedure TFormFirst.BBInvoiceClick(Sender: TObject);
begin
  FormInvoice.Position:= poMainFormCenter;
  FormInvoice.Show;
end;

procedure TFormFirst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
end;

procedure TFormFirst.FormCreate(Sender: TObject);
begin
  LoadSettings;
end;

procedure TFormFirst.SaveSettings;
begin
  Reg:= TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope', true) then
      begin
        Reg.WriteInteger('Left', FormFirst.Left);
        Reg.WriteInteger('Top', FormFirst.Top);
        Reg.WriteInteger('Width', FormFirst.Width);
        Reg.WriteInteger('Height', FormFirst.Height);
        Reg.CloseKey;
      end;
  finally
    Reg.Free;
  end;
end;

procedure TFormFirst.LoadSettings;
begin
  Reg:= TRegistry.Create;
  try
    Reg.RootKey:= HKEY_CURRENT_USER;
    if Reg.OpenKey('\SOFTWARE\MiniHope', false) then
      begin
        if Reg.ValueExists('Left') then FormFirst.Left := Reg.ReadInteger('Left');
        if Reg.ValueExists('Top') then FormFirst.Top := Reg.ReadInteger('Top');
        if Reg.ValueExists('Width') then FormFirst.Width := Reg.ReadInteger('Width');
        if Reg.ValueExists('Height') then FormFirst.Height := Reg.ReadInteger('Height');
        Reg.CloseKey;
      end;
  finally
    Reg.free;
  end;
end;

procedure TFormFirst.N2Click(Sender: TObject);
begin
  Close;
end;

end.
