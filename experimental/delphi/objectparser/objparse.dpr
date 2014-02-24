program objparse;

uses
  Forms,
  uMain in 'uMain.pas' {Form1},
  libembroidery in '..\binding\libembroidery.pas',
  libembroidery_formats in '..\binding\libembroidery_formats.pas',
  uMain2 in 'uMain2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
//  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
