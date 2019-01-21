unit TaskForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UStack;

type
  TSet = set of TElem;
  TForm1 = class(TForm)
    btnSelectFileA: TButton;
    SelectFile: TOpenDialog;
    lblPathFileA: TLabel;
    btnRun: TButton;
    edtanwser: TEdit;
    filePath: TEdit;
    btnClear: TButton;
    lblAnwser: TLabel;
    procedure btnRunClick(Sender: TObject);
    procedure btnSelectFileAClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

 f:TextFile;
    s:TStack;
    ch, a, b:TElem;
    Error : Boolean;
    res:string;

implementation

{$R *.dfm}

//поиск максимального числа
function Max (a,b:TElem) : TElem;
begin
  if a>=b
  then
    Result:=a
  else
    Result:=b;
end;

//поиск минимального числа
function Min (a,b:TElem) : TElem;
begin
  if a<=b
  then
    Result:=a
  else
    Result:=b;
end;

//попытка взять корректный элемент из стека
function TryPopEl (var s : TStack; EnabledSet : TSet; var el : TElem) : Boolean;
begin
  if StackIsEmpty(s)
    then Result := False
    else
      begin
        StackPop(s,el);
        Result:= el in EnabledSet;
      end;
end;

procedure TForm1.btnRunClick(Sender: TObject);
begin
  if (filePath.Text = '') then
  begin
    //выводим сообщение об этом
    ShowMessage('Не задан путь к файлу');
    //выходим
    Exit;
  end;
  AssignFile(f, filePath.Text);
  Reset(f);
  //инициализация стека
  StackInit(s);
  Error:=false;
  res:='';
  //формирование стека
if Eof(f)
    then Error:=true
    else
      while (not Eof(f)) and (not Error) do
      begin
        read(f,ch);
        if StackIsEmpty(s) and (ch in ['0'..'9', '(', ')', ','])
        then Error:=True
        else
            case ch
            of ')':
            begin
              if (not TryPopEl(s, ['0'..'9'], a)) or
                                            (not TryPopEl(s,['0'..'9'],b)) or
                                            (not TryPopEl(s, ['m','M'], ch))
               then Error:=true
              else
                if ch='m'
                then StackPush(s, Min(a,b))
                else StackPush(s, Max(a,b));
            end;
            'M','m','0'..'9': StackPush(s,ch);
            ',', ' ', '(', #13, #10 : ;
            else
              Error:= true;
            end;
      end;
   //вывод результата
 Error:= not TryPopEl(s, ['0'..'9'],ch);
if Error
then
  ShowMessage('Задано некорректное условие')
else
  begin
  Reset(f);
  read(f, res);
  edtanwser.Text := res + '=>' +ch;
  end;

CloseFile(f);
StackDispose(s);


end;

procedure TForm1.btnSelectFileAClick(Sender: TObject);
begin
 //вызываем диалог открытия файла
  if (selectFile.Execute) then
  Begin
    //если выбранный файл существует то
    if (FileExists(selectFile.FileName)) then
    begin
      //заносим путь до него в etPathFileA.Text
      filePath.Text:=selectFile.FileName;
    End;

  End;
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
 filePath.Text := '';
 edtanwser.Text := '';
end;

end.
