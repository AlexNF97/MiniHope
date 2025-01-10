unit FormGoods_s;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.Menus;

type
  TFormGoods = class(TForm)
    EditGoods: TEdit;
    BBClose: TBitBtn;
    EditNumber: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBGridGoods: TDBGridEh;
    Label3: TLabel;
    EditEAN13: TEdit;
    StatusBarGoods: TStatusBar;
    procedure BBCloseClick(Sender: TObject);
    procedure EditGoodsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditNumberKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridGoodsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EditGoodsChange(Sender: TObject);
    procedure EditNumberChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EditEAN13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditEAN13Change(Sender: TObject);
  private
    { Private declarations }
    Good, Cod, DBClick, Ean: Boolean;
    T: TTime;
  public
    { Public declarations }
  end;

var
  FormGoods: TFormGoods;

implementation

{$R *.dfm}

uses DM_s;

procedure TFormGoods.EditGoodsChange(Sender: TObject);
begin
  Good:= True;
end;

procedure TFormGoods.EditNumberChange(Sender: TObject);
begin
  Cod:= True;
end;

procedure TFormGoods.EditEAN13Change(Sender: TObject);
begin
  Ean:= True;
end;

procedure TFormGoods.BBCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormGoods.DBGridGoodsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  DBClick:= True;
  if Good = True then
    if EditGoods.Text <> '' then
      begin
        DM.QueryGoods.Active:= False;
        DM.QueryGoods.SQL.Clear;
        DM.QueryGoods.SQL.Add('select g.id_good, g.name_good, ii.code_ean13, ii.is_mark, gg.id_group, gg.name_group from goods g ' +
                              'join goods_group gg on g.id_group = gg.id_group ' +
                              'join income_item ii on ii.id_good = g.id_good ' +
                              'where lower(g.name_good) like ' + QuotedStr('%'+EditGoods.Text+'%'));
        DM.QueryGoods.Active:= True;
        Good:= False;
        DBClick:= False;
      end
    else
      begin
        Good:= False;
        DM.QueryGoods.Active:= False;
      end;

  if Cod = True then
    if EditNumber.Text <> '' then
      begin
        DM.QueryGoods.Active:= False;
        DM.QueryGoods.SQL.Clear;
        DM.QueryGoods.SQL.Add('select g.id_good, g.name_good, ii.code_ean13, ii.is_mark, gg.id_group, gg.name_group from goods g ' +
                              'join goods_group gg on g.id_group = gg.id_group ' +
                              'join income_item ii on ii.id_good = g.id_good ' +
                              'where g.id_good = ' + EditNumber.Text);
        DM.QueryGoods.Active:= True;
        Cod:= False;
        DBClick:= False;
      end
    else
      begin
        Cod:= False;
        DM.QueryGoods.Active:= False;
      end;

  if Ean = True then
    if EditEAN13.Text <> '' then
      begin
        DM.QueryGoods.Active:= False;
        DM.QueryGoods.SQL.Clear;
        DM.QueryGoods.SQL.Add('select g.id_good, g.name_good, ii.code_ean13, ii.is_mark, gg.id_group, gg.name_group from goods g ' +
                              'join goods_group gg on g.id_group = gg.id_group ' +
                              'join income_item ii on ii.id_good = g.id_good ' +
                              'where lower(ii.code_ean13) like ' + QuotedStr('%'+EditEAN13.Text+'%'));
        DM.QueryGoods.Active:= True;
        Ean:= False;
        DBClick:= False;
      end
    else
      begin
        Ean:= False;
        DM.QueryGoods.Active:= False;
      end;
end;

procedure TFormGoods.EditEAN13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      DM.QueryGoods.Active:= False;
      DM.QueryGoods.SQL.Clear;
      DM.QueryGoods.SQL.Add('select g.id_good, g.name_good, ii.code_ean13, ii.is_mark, gg.id_group, gg.name_group from goods g ' +
                            'join goods_group gg on g.id_group = gg.id_group ' +
                            'join income_item ii on ii.id_good = g.id_good ' +
                            'where lower(ii.code_ean13) like ' + QuotedStr('%'+EditEAN13.Text+'%'));
      DM.QueryGoods.Active:= True;
    end
  else DM.QueryGoods.Active:= False;
end;

procedure TFormGoods.EditGoodsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      DM.QueryGoods.Active:= False;
      DM.QueryGoods.SQL.Clear;
      DM.QueryGoods.SQL.Add('select g.id_good, g.name_good, ii.code_ean13, ii.is_mark, gg.id_group, gg.name_group from goods g ' +
                            'join goods_group gg on g.id_group = gg.id_group ' +
                            'join income_item ii on ii.id_good = g.id_good ' +
                            'where lower(g.name_good) like ' + QuotedStr('%'+EditGoods.Text+'%'));
      DM.QueryGoods.Active:= True;
    end
  else DM.QueryGoods.Active:= False;
end;

procedure TFormGoods.EditNumberKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    begin
      DM.QueryGoods.Active:= False;
      DM.QueryGoods.SQL.Clear;
      DM.QueryGoods.SQL.Add('select g.id_good, g.name_good, ii.code_ean13, ii.is_mark, gg.id_group, gg.name_group from goods g ' +
                            'join goods_group gg on g.id_group = gg.id_group ' +
                            'join income_item ii on ii.id_good = g.id_good ' +
                            'where g.id_good = ' + EditNumber.Text);
      DM.QueryGoods.Active:= True;
    end
  else DM.QueryGoods.Active:= False;
end;

procedure TFormGoods.FormActivate(Sender: TObject);
begin
  T:= (Time);
  if DM.QueryGoods.Session.Server = 'ORAS' then
    StatusBarGoods.Panels[0].Text:= 'oracle-main.tmb.nf (врьсют) ' + TimeToStr(T);
end;

end.
