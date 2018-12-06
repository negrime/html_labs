unit UForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, UTree, UNodes;

type
  TmainForm = class(TForm)
    SelectFile: TOpenDialog;
    btnSelectFileA: TButton;
    btnSelectFileB: TButton;
    tvWordsFileB: TTreeView;
    lblWordsB: TLabel;
    mmWordsFileA: TMemo;
    lblWordsA: TLabel;
    lblWordsC: TLabel;
    mmWordsFileC: TMemo;
    etPathFileA: TEdit;
    lblPathFileA: TLabel;
    etPathFileB: TEdit;
    lblPathFileB: TLabel;
    etPathFileC: TEdit;
    SaveFile: TSaveDialog;
    btnSelectFileC: TButton;
    lblPathFileC: TLabel;
    btnRun: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRunClick(Sender: TObject);
    procedure btnSelectFileAClick(Sender: TObject);
    procedure btnSelectFileBClick(Sender: TObject);
    procedure btnSelectFileCClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;
  Tree: TTree;
implementation

{$R *.dfm}

//���������� ������� �������� �����
procedure TmainForm.FormCreate(Sender: TObject);
begin
  //�������� ������
  Tree:=TTree.Create;
  //����� ��������� ������� ��� ������� ������ � ���������� �����
  //������ �������� � ������� ��������� ����������� ���� ���������
  SelectFile.InitialDir:= ExtractFilePath(Application.ExeName);
  SaveFile.InitialDir:= ExtractFilePath(Application.ExeName);
end;

//���������� ������� ������� �� ������ ����������
procedure TmainForm.btnRunClick(Sender: TObject);
//��������� ��������-������������ ����
Const mn=[' ', ',', '.'];
Var f,g:textfile;
    s,sl:string;
    i:integer;
begin
  //���� ���� �� ���� Edit ������ ��
  if (etPathFileA.Text = '') or (etPathFileB.Text = '') or (etPathFileC.Text = '') then
  begin
    //������� ��������� �� ����
    ShowMessage('�� ������ ����� ���� � ������');
    //�������
    Exit;
  end;
  //���� ���� � ������ ��� ����� ���� ������ ��������� ��
  if (etPathFileA.Text = etPathFileB.Text) or (etPathFileA.Text = etPathFileC.Text) or (etPathFileB.Text = etPathFileC.Text) then
  begin
    //������� ��������� �� ����
    ShowMessage('���������� ������� ������ �����.');
    //�������
    Exit;
  end;
  //�������� ����� ������� ������
  Tree.Clear;
  //������� Memo
  mmWordsFileA.Clear;
  mmWordsFileC.Clear;
  //��������� �������� ���������� � ������ etPathFileB.Text
  AssignFile(f, etPathFileB.Text);
  //��������� ���� ��� ������
  Reset(f);
  //���� �� ����� �����
  While not Eof(f) do
  Begin
    //��������� �� ����� ������
    readln(f, s);
    //��������� � ����� ������, ����� ���������� � ��������� �����
    s:=s+' ';
    //�������������� ���������� � ������� ������ �������� �����
    sl:='';
    //���� �� ���� �������� ������ s
    For i:=1 to Length(s) do
     //���� ��������� ������ ������ �� �� ��������� ������������ �� ��������� ��� � sl
     if not(s[i] in mn) then sl:=sl+s[i]
     //�����
     else
     begin
       //���� ����� ������� ��
       //��������� ��� � ������
       if sl <> '' then Tree.Add(sl);
       //�������������� ���������� � ������� ������ �������� �����
       sl:='';
     end;
  End;
  //��������� ����
  CloseFile(f);
  //�������� ����� ������ ������
  Tree.Show(tvWordsFileB);

  AssignFile(f, etPathFileA.Text);
  //��������� ���� B ��� ������
  Reset(f);
  AssignFile(g, etPathFileC.Text);
  //��������� ���� C ��� ������
  Rewrite(g);
  //���� �� ����� �����
  While not Eof(f) do
  Begin
    //��� �� ���������� ����, ��� ���� ����
    readln(f, s);
    s:=s+' ';
    sl:='';
    For i:=1 to Length(s) do
     if not(s[i] in mn) then sl:=sl+s[i]
     else
     begin
       if sl <> '' then
       Begin
         //���� ���������� ����� ����� A ���� � ������ �� ���������� ��� � ���� C
         if not Tree.Find(sl) then writeln(g, sl);
         //��������� ����� � mmWordsFileA
         mmWordsFileA.Lines.Add(sl);
       End;
       sl:='';
     end;
  End;
  //��������� �����
  CloseFile(f);
  CloseFile(g);
  //��������� ���� C � mmWordsFileC
  mmWordsFileC.Lines.LoadFromFile(etPathFileC.Text);
end;

//���������� ������� ������� �� ������ ������� ���� A
procedure TmainForm.btnSelectFileAClick(Sender: TObject);
begin
  //�������� ������ �������� �����
  if (selectFile.Execute) then
  Begin
    //���� ��������� ���� ���������� ��
    if (FileExists(selectFile.FileName)) then
    begin
      //������� ���� �� ���� � etPathFileA.Text
      etPathFileA.Text:=selectFile.FileName;
    End;
  End;
end;

//���������� ������� ������� �� ������ ������� ���� B
procedure TmainForm.btnSelectFileBClick(Sender: TObject);
begin
  //��� �� ���������� ��� � ��� ����� A
  if (selectFile.Execute) then
  Begin
    if (FileExists(selectFile.FileName)) then
    begin
      etPathFileB.Text:=selectFile.FileName;
    End;
  End;
end;

//���������� ������� ������� �� ������ ��������� �
procedure TmainForm.btnSelectFileCClick(Sender: TObject);
begin
  //�������� ����� ������ ����� ��� ����������
  if (saveFile.Execute) then
  Begin
    //���������� � etPathFileC.Text ���� � �����
    etPathFileC.Text:=saveFile.FileName;
  End;
end;

end.
