unit UNodes;

interface

Uses SysUtils, ComCtrls;

type
//узел дерева(базовый класс)
TNode=class
private
  FValue:string;
  FLeft,FRight:TNode;
public
  //создание узла
  constructor Create(Value:string);
  //деструктор
  destructor Destroy;override;
  //получение значения, находящегося в узле
  function GetValue:string;
  //вывод в TreeView
  procedure Show(TV: TTreeView; pn: TTreeNode);
  property Left: TNode read FLeft write FLeft;
  property Right: TNode read FRight write FRight;
  property Value: string read FValue write FValue;
end;

implementation

//TNode
constructor TNode.Create(Value:string);
begin
  FLeft:=nil;
  FRight:=nil;
  FValue:=Value;
end;

destructor TNode.Destroy;
begin
  FLeft.Free;
  FRight.Free;
end;

procedure TNode.Show(TV: TTreeView; pn: TTreeNode);
var
  node: TTreeNode;
begin
  node:=TV.Items.AddChild(pn, GetValue);
  if (FLeft<>nil) or (Fright<>nil) then
    begin
      if FLeft = nil then
        TV.Items.AddChild(node,'')
      else
        Fleft.Show(TV,node);
      if FRight = nil then
        TV.Items.AddChild(node,'')
      else
        FRight.Show(Tv,node);
    end;
end;

function TNode.GetValue:string;
begin
   Result:=Fvalue;
end;

end.

