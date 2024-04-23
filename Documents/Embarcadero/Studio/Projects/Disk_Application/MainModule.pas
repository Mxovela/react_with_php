unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, Data.DB, DBAccess, Uni;

type
  TUniMainModule = class(TUniGUIMainModule)
    UniConnection1: TUniConnection;
  private
    { Private declarations }
  public
   procedure InitializeDatabaseConnection;
    procedure FinalizeDatabaseConnection;
  end;

function UniMainModule: TUniMainModule;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function UniMainModule: TUniMainModule;
begin
  Result := TUniMainModule(UniApplication.UniMainModule)
end;

procedure TUniMainModule.InitializeDatabaseConnection;
begin
  UniConnection1 := TUniConnection.Create(nil);
  UniConnection1.ProviderName := 'MySQL';
  UniConnection1.Server := 'localhost';
  UniConnection1.Port := 3306; // Default MySQL port
  UniConnection1.Database := 'disk_application';
  UniConnection1.Username := 'root';
  UniConnection1.Password := '';
  UniConnection1.Connect;
end;

procedure TUniMainModule.FinalizeDatabaseConnection;
begin
  if Assigned(UniConnection1) then
  begin
    UniConnection1.Disconnect;
    UniConnection1.Free;
    UniConnection1 := nil;
  end;
end;

initialization
  RegisterMainModuleClass(TUniMainModule);
end.
