unit UStack;

interface

type
  TElem = char;
  TStack = ^TList;
  TList = record
          info: TElem;
          next: TStack;
          end;

//������������� �����
procedure StackInit (var s : TStack);
//�������� �� �������
function StackIsEmpty (s : TStack) : Boolean;
//�������� ������� � ����
procedure StackPush(var s: TStack; e : TElem);
//����� ������� �� �����
procedure StackPop(var s: TStack; var e : TElem);
//������� �����
procedure StackDispose(var s: TStack);

implementation

//������������� �����
procedure StackInit (var s : TStack);
begin
  s:=nil;
end;  

//�������� �� �������
function StackIsEmpty (s : TStack) : Boolean;
begin
  StackIsEmpty:= s=nil;
end;  

//�������� ������� � ����
procedure StackPush(var s: TStack; e : TElem);
var z:TStack;
begin
  New(z);
  z.info:=e;
  z^.next:=s;
  s:=z;
end;

//����� ������� �� �����
procedure StackPop(var s: TStack; var e : TElem);
var z:TStack;
begin
  z:=s;
  e:=s^.info;
  s:=s^.next;
  Dispose(z);
end;

//������� �����
procedure StackDispose(var s: TStack);
var z:TStack;
begin
  while s<>nil do
  begin
    z:=s;
    s:=s^.next;
    Dispose(z);
  end;
end;

end.
