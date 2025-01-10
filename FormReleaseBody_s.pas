unit FormReleaseBody_s;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  Vcl.Grids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.DBGrids;

type
  TFormReleaseBody = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EditNumber: TEdit;
    EditZakaz: TEdit;
    Label3: TLabel;
    EditDate: TEdit;
    Label4: TLabel;
    EditAgent: TEdit;
    StatusBarAll: TStatusBar;
    BBClose: TBitBtn;
    DBGridReleaseBody: TDBGridEh;
    StatusBarMark: TStatusBar;
    procedure BBCloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridReleaseBodyDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    Value1, Value2: Variant;
  end;

var
  FormReleaseBody: TFormReleaseBody;
  Color1, Color2: TColor;
  CellRect: TRect;

implementation

{$R *.dfm}

uses DM_s, FormRelease_s;

procedure TFormReleaseBody.BBCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormReleaseBody.DBGridReleaseBodyDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//  Value1:= DBGridReleaseBody.Fields[20].Value;
//  Value2:= DBGridReleaseBody.Fields[21].Value;

  Value1:= DM.QueryReleaseBody.FieldByName('Статус').Value;
  Value2:= DM.QueryReleaseBody.FieldByName('Статус1').Value;

  if DataCol = 0 then
    begin
      if Value1 = 'Зафиксирована' then
        Color1:= clWebDarkTurquoise;

        DBGridReleaseBody.Canvas.Brush.Color:= Color1;
        DBGridReleaseBody.Canvas.FillRect(Cellrect);
    end;

  if DataCol = 1 then
    begin
      if Value2 = 'Строка укомплектована сериями' then
        Color2:= clWebSeaGreen;

        DBGridReleaseBody.Canvas.Brush.Color:= Color2;
        DBGridReleaseBody.Canvas.FillRect(Cellrect);
    end;

  DBGridReleaseBody.DefaultDrawColumnCell(Rect, DataCol, Column, GridsEh.TGridDrawState(State));
end;

procedure TFormReleaseBody.FormActivate(Sender: TObject);
begin
  if DM.QueryRelease.FieldByName('МЕНЕДЖЕР').Value = 'Аптека' then
    begin
      DBGridReleaseBody.Columns[10].Title.Caption:= 'Розница|Цена';
      DBGridReleaseBody.Columns[11].Title.Caption:= 'Розница|Сумма';
      DBGridReleaseBody.Columns[12].Title.Caption:= 'Розница|Проц.';
    end;

  StatusBarAll.Panels[1].Text:= 'кол-во строк = ' + DM.QueryReleaseSum.FieldByName('КОЛ_ВО_СТРОК').AsString;
  StatusBarAll.Panels[2].Text:= 'общее кол-во = ' + DM.QueryreleaseSum.fieldByName('ВСЕГО').AsString;
  StatusBarAll.Panels[3].Text:= 'общая сумма = ' + DM.QueryreleaseSum.fieldByName('СУММА').AsString;
  StatusBarAll.Panels[4].Text:= 'общий НДС = ' + DM.QueryreleaseSum.fieldByName('НДС').AsString;

  StatusBarMark.Panels[1].Text:= 'марк строк = ' + DM.QueryReleaseSum.FieldByName('КОЛ_ВО_МАРК').AsString;
  StatusBarMark.Panels[2].Text:= 'кол-во марк = ' + DM.QueryReleaseSum.FieldByName('МАРК').AsString;;
  StatusBarMark.Panels[3].Text:= 'сумма марк = ' + DM.QueryreleaseSum.fieldByName('СУММАРК').AsString;;
  StatusBarMark.Panels[4].Text:= 'НДС марк = ' + DM.QueryreleaseSum.fieldByName('НДСМАРК').AsString;

  if DM.QueryRelease.FieldByName('НОМЕР').AsString <> '' then
    EditNumber.Text:= DM.QueryRelease.FieldByName('НОМЕР').AsString + '/' + DM.QueryRelease.FieldByName('ИНДЕКС').AsString
  else EditNumber.Text:= '/' + DM.QueryRelease.FieldByName('ИНДЕКС').AsString;

  EditZakaz.Text:= DM.QueryRelease.FieldByName('ЗАКАЗ').AsString;
  EditDate.Text:= DM.QueryRelease.FieldByName('ДАТА_СЧЁТА').AsString;
  EditAgent.Text:= DM.QueryRelease.FieldByName('АГЕНТ').AsString;
end;

end.
