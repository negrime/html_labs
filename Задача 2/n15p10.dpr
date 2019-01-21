{ � ��������� ����� �������� ��� ������ ������� ���������� ����:
<�������>::=<�����>|M(<�������>,<�������>)|m(<�������>,<�������>)
<�����>::=0|1|2|3|4|5|6|7|8|9
� ���������� ������� max, a m - min. ��������� �������� ������ �������
(��������, �(5,m(6,8))=>6).}

program n15p10;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  windows,
  UStack in 'UStack.pas';

type
  TSet = set of TElem;

var f:TextFile;
    s:TStack;
    ch, a, b:TElem;
    Error : Boolean;
    res:string;

//����� ������������� �����
function Max (a,b:TElem) : TElem;
begin
  if a>=b
  then
    Result:=a
  else
    Result:=b;
end;

//����� ������������ �����
function Min (a,b:TElem) : TElem;
begin
  if a<=b
  then
    Result:=a
  else
    Result:=b;
end;

//������� ����� ���������� ������� �� �����
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

begin
SetConsoleCP(1251);
SetConsoleOutputCP(1251);

AssignFile(f, 'input.txt');
Reset(f);

//������������� �����
StackInit(s);
Error:=false;
res:='';

//������������ �����
  if Eof(f)
    then Error:=true
    else
      while (not Eof(f)) and (not Error) do
      begin
        read(f,ch);
        if StackIsEmpty(s) and (ch in ['0'..'9', '(', ')', ','])
        then Error:=True
        else
            case ch of
            ')': begin
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

//����� ����������
Error:= not TryPopEl(s, ['0'..'9'],ch);
if Error
then
  Writeln('������ ������������ �������!')
else
  begin
  Reset(f);
  read(f, res);
  Writeln(res, '=>', ch);
  end;

CloseFile(f);
StackDispose(s);

Readln;
end.
