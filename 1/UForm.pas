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

//обработчик события создания формы
procedure TmainForm.FormCreate(Sender: TObject);
begin
  //создание дерева
  Tree:=TTree.Create;
  //задаём начальный каталог для диалога выбора и сохранения файла
  //равным каталогу в котором находится исполняемый файл программы
  SelectFile.InitialDir:= ExtractFilePath(Application.ExeName);
  SaveFile.InitialDir:= ExtractFilePath(Application.ExeName);
end;

//обработчик события нажатия на кнопку обработать
procedure TmainForm.btnRunClick(Sender: TObject);
//множество символов-разделителей слов
Const mn=[' ', ',', '.'];
Var f,g:textfile;
    s,sl:string;
    i:integer;
begin
  //если хотя бы один Edit пустой то
  if (etPathFileA.Text = '') or (etPathFileB.Text = '') or (etPathFileC.Text = '') then
  begin
    //выводим сообщение об этом
    ShowMessage('Не заданы имена пути к файлам');
    //выходим
    Exit;
  end;
  //если пути к файлам для каких либо файлов совпадают то
  if (etPathFileA.Text = etPathFileB.Text) or (etPathFileA.Text = etPathFileC.Text) or (etPathFileB.Text = etPathFileC.Text) then
  begin
    //выводим сообщение об этом
    ShowMessage('Необходимо выбрать разные файла.');
    //выходим
    Exit;
  end;
  //вызываем метод очистки дерева
  Tree.Clear;
  //очищаем Memo
  mmWordsFileA.Clear;
  mmWordsFileC.Clear;
  //связываем файловую переменную с файлом etPathFileB.Text
  AssignFile(f, etPathFileB.Text);
  //открываем файл для чтения
  Reset(f);
  //пока не конец файла
  While not Eof(f) do
  Begin
    //считываем из файла строку
    readln(f, s);
    //добавляем в конец пробел, чтобы обработать и последнее слово
    s:=s+' ';
    //инициализируем переменную в которой буденм собирать слово
    sl:='';
    //цикл по всем символам строки s
    For i:=1 to Length(s) do
     //если очередной символ строки не из множества разделителей то добавляем его к sl
     if not(s[i] in mn) then sl:=sl+s[i]
     //иначе
     else
     begin
       //если слово собрали то
       //добавляем его в дерево
       if sl <> '' then Tree.Add(sl);
       //инициализируем переменную в которой буденм собирать слово
       sl:='';
     end;
  End;
  //закрываем файл
  CloseFile(f);
  //вызываем метод вывода дерева
  Tree.Show(tvWordsFileB);

  AssignFile(f, etPathFileA.Text);
  //Открываем файл B для чтения
  Reset(f);
  AssignFile(g, etPathFileC.Text);
  //открываем файл C для записи
  Rewrite(g);
  //пока не конец файла
  While not Eof(f) do
  Begin
    //тут всё аналогично тому, что было выше
    readln(f, s);
    s:=s+' ';
    sl:='';
    For i:=1 to Length(s) do
     if not(s[i] in mn) then sl:=sl+s[i]
     else
     begin
       if sl <> '' then
       Begin
         //если очередного слова файла A нету в дереве то записываем его в файл C
         if not Tree.Find(sl) then writeln(g, sl);
         //добавляем слово в mmWordsFileA
         mmWordsFileA.Lines.Add(sl);
       End;
       sl:='';
     end;
  End;
  //закрываем файлы
  CloseFile(f);
  CloseFile(g);
  //загружаем файл C в mmWordsFileC
  mmWordsFileC.Lines.LoadFromFile(etPathFileC.Text);
end;

//обработчик события нажатия на кнопку выбрать файл A
procedure TmainForm.btnSelectFileAClick(Sender: TObject);
begin
  //вызываем диалог открытия файла
  if (selectFile.Execute) then
  Begin
    //если выбранный файл существует то
    if (FileExists(selectFile.FileName)) then
    begin
      //заносим путь до него в etPathFileA.Text
      etPathFileA.Text:=selectFile.FileName;
    End;
  End;
end;

//обработчик события нажатия на кнопку выбрать файл B
procedure TmainForm.btnSelectFileBClick(Sender: TObject);
begin
  //тут всё аналогично как и для файла A
  if (selectFile.Execute) then
  Begin
    if (FileExists(selectFile.FileName)) then
    begin
      etPathFileB.Text:=selectFile.FileName;
    End;
  End;
end;

//обработчик события нажатия на кнопку сохранить в
procedure TmainForm.btnSelectFileCClick(Sender: TObject);
begin
  //вызываем метод выбора файла для сохранения
  if (saveFile.Execute) then
  Begin
    //записываем в etPathFileC.Text путь к файлу
    etPathFileC.Text:=saveFile.FileName;
  End;
end;

end.
