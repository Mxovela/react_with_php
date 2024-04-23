unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  Vcl.Imaging.pngimage, uniImage, uniLabel, uniButton, uniEdit, uniDBNavigator,
  uniBasicGrid, uniDBGrid, uniTreeView, uniRadioButton, Data.DB, DBAccess, Uni,
  MemDS, MainModule;

type
  TMainForm = class(TUniForm)
    backgroundPanel: TUniPanel;
    topPanel: TUniPanel;
    leftPanel: TUniPanel;
    rightPanel: TUniPanel;
    staffedit: TUniEdit;
    passedit: TUniEdit;
    loginbtn: TUniButton;
    stafflbl: TUniLabel;
    passlbl: TUniLabel;
    UniImage1: TUniImage;
    UniTreeView1: TUniTreeView;
    diskGrid: TUniDBGrid;
    UniDBNavigator1: TUniDBNavigator;
    searchedit: TUniEdit;
    searchbtn: TUniButton;
    userrad: TUniRadioButton;
    departmentrad: TUniRadioButton;
    facultyrad: TUniRadioButton;
    vehiclemakerad: TUniRadioButton;
    UniLabel1: TUniLabel;
    seqedit: TUniEdit;
    regnoedit: TUniEdit;
    receiptedit: TUniEdit;
    bayedit: TUniEdit;
    regyearedit: TUniEdit;
    contactedit: TUniEdit;
    addressedit: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    savebtn: TUniButton;
    submitbtn: TUniButton;
    regdateedit: TUniEdit;
    UniLabel8: TUniLabel;
    procedure loginbtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.loginbtnClick(Sender: TObject);
var
  Username, Password: string;
  Query: TUniQuery;
begin
  Username := staffedit.Text;
  Password := passedit.Text;

    // Check if the staff number or password fields are empty
  if (Username = '') or (password = '') then
  begin
    ShowMessage('Please enter staff number and password as required');
    Exit;
  end;

  Query := TUniQuery.Create(nil);
  try
   // Query.Connection := UniMainModule.UniConnection1; // Set your database connection

    // Prepare SQL query to check credentials
    Query.SQL.Text := 'SELECT COUNT(*) FROM staff_log WHERE staff_number = :staff_number AND password = :password';
    Query.ParamByName('staff_number').AsString := Username;
    Query.ParamByName('password').AsString := Password;
    Query.Open;

    if Query.Fields[0].AsInteger > 0 then
    begin
      ShowMessage('Login successful'); // You can replace this with actual navigation to grid form
      // Add code to navigate to the form displaying the grid
    end
    else
    begin
      ShowMessage('Invalid username or password'); // Display error message
    end;
  finally
    Query.Free;
  end;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
