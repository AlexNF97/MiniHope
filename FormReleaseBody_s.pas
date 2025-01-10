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

  Value1:= DM.QueryReleaseBody.FieldByName('������').Value;
  Value2:= DM.QueryReleaseBody.FieldByName('������1').Value;

  if DataCol = 0 then
    begin
      if Value1 = '�������������' then
        Color1:= clWebDarkTurquoise;

        DBGridReleaseBody.Canvas.Brush.Color:= Color1;
        DBGridReleaseBody.Canvas.FillRect(Cellrect);
    end;

  if DataCol = 1 then
    begin
      if Value2 = '������ �������������� �������' then
        Color2:= clWebSeaGreen;

        DBGridReleaseBody.Canvas.Brush.Color:= Color2;
        DBGridReleaseBody.Canvas.FillRect(Cellrect);
    end;

  DBGridReleaseBody.DefaultDrawColumnCell(Rect, DataCol, Column, GridsEh.TGridDrawState(State));
end;

procedure TFormReleaseBody.FormActivate(Sender: TObject);
begin
  if DM.QueryRelease.FieldByName('��������').Value = '������' then
    begin
      DBGridReleaseBody.Columns[10].Title.Caption:= '�������|����';
      DBGridReleaseBody.Columns[11].Title.Caption:= '�������|�����';
      DBGridReleaseBody.Columns[12].Title.Caption:= '�������|����.';
    end;

  StatusBarAll.Panels[1].Text:= '���-�� ����� = ' + DM.QueryReleaseSum.FieldByName('���_��_�����').AsString;
  StatusBarAll.Panels[2].Text:= '����� ���-�� = ' + DM.QueryreleaseSum.fieldByName('�����').AsString;
  StatusBarAll.Panels[3].Text:= '����� ����� = ' + DM.QueryreleaseSum.fieldByName('�����').AsString;
  StatusBarAll.Panels[4].Text:= '����� ��� = ' + DM.QueryreleaseSum.fieldByName('���').AsString;

  StatusBarMark.Panels[1].Text:= '���� ����� = ' + DM.QueryReleaseSum.FieldByName('���_��_����').AsString;
  StatusBarMark.Panels[2].Text:= '���-�� ���� = ' + DM.QueryReleaseSum.FieldByName('����').AsString;;
  StatusBarMark.Panels[3].Text:= '����� ���� = ' + DM.QueryreleaseSum.fieldByName('�������').AsString;;
  StatusBarMark.Panels[4].Text:= '��� ���� = ' + DM.QueryreleaseSum.fieldByName('�������').AsString;

  if DM.QueryRelease.FieldByName('�����').AsString <> '' then
    EditNumber.Text:= DM.QueryRelease.FieldByName('�����').AsString + '/' + DM.QueryRelease.FieldByName('������').AsString
  else EditNumber.Text:= '/' + DM.QueryRelease.FieldByName('������').AsString;

  EditZakaz.Text:= DM.QueryRelease.FieldByName('�����').AsString;
  EditDate.Text:= DM.QueryRelease.FieldByName('����_�ר��').AsString;
  EditAgent.Text:= DM.QueryRelease.FieldByName('�����').AsString;
end;

end.
