program Project1;

uses
  Forms,
  UForm in 'UForm.pas' {mainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TmainForm, mainForm);
  Application.Run;
end.
