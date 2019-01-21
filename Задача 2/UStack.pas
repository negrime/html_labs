unit UStack;

interface

type
  TElem = char;
  TStack = ^TList;
  TList = record
          info: TElem;
          next: TStack;
          end;

//инициализация стека
procedure StackInit (var s : TStack);
//проверка на пустоту
function StackIsEmpty (s : TStack) : Boolean;
//положить элемент в стек
procedure StackPush(var s: TStack; e : TElem);
//взять элемент из стека
procedure StackPop(var s: TStack; var e : TElem);
//очистка стека
procedure StackDispose(var s: TStack);

implementation

//инициализация стека
procedure StackInit (var s : TStack);
begin
  s:=nil;
end;  

//проверка на пустоту
function StackIsEmpty (s : TStack) : Boolean;
begin
  StackIsEmpty:= s=nil;
end;  

//положить элемент в стек
procedure StackPush(var s: TStack; e : TElem);
var z:TStack;
begin
  New(z);
  z.info:=e;
  z^.next:=s;
  s:=z;
end;

//взять элемент из стека
procedure StackPop(var s: TStack; var e : TElem);
var z:TStack;
begin
  z:=s;
  e:=s^.info;
  s:=s^.next;
  Dispose(z);
end;

//очистка стека
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
