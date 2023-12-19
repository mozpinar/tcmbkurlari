program GunlukKurlar;

uses
  Vcl.Forms,
  GunKur in 'GunKur.pas' {CurrencyForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCurrencyForm, CurrencyForm1);
  Application.Run;
end.
