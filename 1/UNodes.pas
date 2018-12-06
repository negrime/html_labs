unit UNodes;

interface

Uses SysUtils, ComCtrls;

type
//���� ������(������� �����)
TNode=class
private
  FValue:string;
  FLeft,FRight:TNode;
public
  //�������� ����
  constructor Create(Value:string);
  //����������
  destructor Destroy;override;
  //��������� ��������, ������������ � ����
  function GetValue:string;
  //����� � TreeView
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

