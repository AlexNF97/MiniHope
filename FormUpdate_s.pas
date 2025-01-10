unit FormUpdate_s;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP,
  Winapi.ShellAPI, Vcl.StdCtrls, Vcl.Buttons, IniFiles, Vcl.ComCtrls, IdHTTP, Vcl.ExtCtrls, IdGlobal, IdException;

type
  TFormUpdate = class(TForm)

  public
    { Public declarations }
  end;

var
  FormUpdate: TFormUpdate;

implementation

{$R *.dfm}

end.
