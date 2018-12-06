{Модуль с реализацией дерева-формулы}
unit UTree;

interface

Uses ComCtrls, SysUtils, UNodes;

type
  //класс "Дерево"
  TTree = class
  private
   Froot: TNode;
  public
    //создание пустого дерева
    constructor Create;
    //Разрушение дерева
    destructor Destroy; override;
    //очистка дерева
    Procedure Clear;
    //Процедура отображения элементов дерева на компонент TreeView
    procedure Show(TV: TTreeView);
    //функция поиска строки s в дереве
    function Find(s:string):boolean;
    //Процедура добавления узла в дерево
    Procedure Add(s:string);
    //свойство для получения значения TNode
    property Value: TNode read Froot write Froot;
  end;{TTree}

implementation

//TTree
procedure TTree.Clear;
Begin
   FreeAndNil(FRoot);
end;

constructor TTree.Create;
begin
  Froot:=nil;
end;

destructor TTree.Destroy;
begin
  Clear;
  inherited;
end;

procedure TTree.Show(TV: TTreeView);
begin
  TV.Items.Clear;
  if Froot<>nil then
    Froot.Show(TV,nil);
  TV.FullExpand;
end;

//метод добавления элемента в дерево
Procedure TTree.Add(s:string);
Var q,p:TNode;
Begin
    q:=Froot;
    p:=Froot;
    //пока p не равно nil выполняем
    while (p<>nil) do
    begin
      //в q запоминаем текущее значение p
      q:=p;
      //если значение добавляемого элемента меньше значения текущего элемента дерева то
      //переходим в левое поддерево
      if(AnsiLowerCase(s) < AnsiLowerCase(p.GetValue)) then p:=p.left
       //иначе если больше то переходим в правое поддерево
       else if(AnsiLowerCase(s) > AnsiLowerCase(p.GetValue)) then p:=p.right
        //иначе если равно то выходим из метода
        else exit;
    End;
    //создаём новый элемент дерева
    p:=TNode.Create(s);
    //если дерево пусто то ставим его в корень
    if(Froot = nil) then Froot:=p
     //иначе если добавляемый элемент меньше текущего то добавляем в левое поддерево
     else if(AnsiLowerCase(s) < AnsiLowerCase(q.getValue)) then q.left:=p
      //иначе в правое поддерево
      else q.right:=p;
End;

//метод поиска элемента со значением s в дереве
function TTree.Find(s:string):boolean;
Var p:TNode;
Begin
    p:=Froot;
    //пока p не равно nil выполняем
    While (p<>nil) do
    Begin
      //если значение искомого элемента меньше значения текущего элемента дерева то
      //переходим в левое поддерево
      if(AnsiLowerCase(s) < AnsiLowerCase(p.GetValue)) then p:=p.left
       //иначе если больше то переходим в правое поддерево
       else if(AnsiLowerCase(s) > AnsiLowerCase(p.GetValue)) then p:=p.right
        //иначе они равны, значит нашли искомый элемент
        else
        Begin
          //возвращаем true
          Result:=true;
          //выходим
          exit;
        End;
    End;
    //возвращаем false не нашли элемент со значением s
    Result:=false;
end;

end.
