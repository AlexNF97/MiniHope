program MiniHope;

uses
  Vcl.Forms,
  FormFirst_s in 'FormFirst_s.pas' {FormFirst},
  DM_s in 'DM_s.pas' {DM: TDataModule},
  FormSearch_s in 'FormSearch_s.pas' {FormSearch},
  Vcl.Themes,
  Vcl.Styles,
  FormInvoice_s in 'FormInvoice_s.pas' {FormInvoice},
  FormUpdate_s in 'FormUpdate_s.pas' {FormUpdate},
  FormInvoiceBody_s in 'FormInvoiceBody_s.pas' {FormInvoiceBody},
  FormRelease_s in 'FormRelease_s.pas' {FormRelease},
  FormAgentsRelease_s in 'FormAgentsRelease_s.pas' {FormAgentsRelease},
  FormReleaseBody_s in 'FormReleaseBody_s.pas' {FormReleaseBody},
  FormZakaz_s in 'FormZakaz_s.pas' {FormZakaz},
  FormGoods_s in 'FormGoods_s.pas' {FormGoods};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');
  Application.CreateForm(TFormFirst, FormFirst);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormSearch, FormSearch);
  Application.CreateForm(TFormInvoice, FormInvoice);
  Application.CreateForm(TFormUpdate, FormUpdate);
  Application.CreateForm(TFormInvoiceBody, FormInvoiceBody);
  Application.CreateForm(TFormRelease, FormRelease);
  Application.CreateForm(TFormAgentsRelease, FormAgentsRelease);
  Application.CreateForm(TFormReleaseBody, FormReleaseBody);
  Application.CreateForm(TFormZakaz, FormZakaz);
  Application.CreateForm(TFormGoods, FormGoods);
  //  Application.CreateForm(TFormUpdate, FormUpdate);
  Application.Run;
end.
