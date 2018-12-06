{������ � ����������� ������-�������}
unit UTree;

interface

Uses ComCtrls, SysUtils, UNodes;

type
  //����� "������"
  TTree = class
  private
   Froot: TNode;
  public
    //�������� ������� ������
    constructor Create;
    //���������� ������
    destructor Destroy; override;
    //������� ������
    Procedure Clear;
    //��������� ����������� ��������� ������ �� ��������� TreeView
    procedure Show(TV: TTreeView);
    //������� ������ ������ s � ������
    function Find(s:string):boolean;
    //��������� ���������� ���� � ������
    Procedure Add(s:string);
    //�������� ��� ��������� �������� TNode
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

//����� ���������� �������� � ������
Procedure TTree.Add(s:string);
Var q,p:TNode;
Begin
    q:=Froot;
    p:=Froot;
    //���� p �� ����� nil ���������
    while (p<>nil) do
    begin
      //� q ���������� ������� �������� p
      q:=p;
      //���� �������� ������������ �������� ������ �������� �������� �������� ������ ��
      //��������� � ����� ���������
      if(AnsiLowerCase(s) < AnsiLowerCase(p.GetValue)) then p:=p.left
       //����� ���� ������ �� ��������� � ������ ���������
       else if(AnsiLowerCase(s) > AnsiLowerCase(p.GetValue)) then p:=p.right
        //����� ���� ����� �� ������� �� ������
        else exit;
    End;
    //������ ����� ������� ������
    p:=TNode.Create(s);
    //���� ������ ����� �� ������ ��� � ������
    if(Froot = nil) then Froot:=p
     //����� ���� ����������� ������� ������ �������� �� ��������� � ����� ���������
     else if(AnsiLowerCase(s) < AnsiLowerCase(q.getValue)) then q.left:=p
      //����� � ������ ���������
      else q.right:=p;
End;

//����� ������ �������� �� ��������� s � ������
function TTree.Find(s:string):boolean;
Var p:TNode;
Begin
    p:=Froot;
    //���� p �� ����� nil ���������
    While (p<>nil) do
    Begin
      //���� �������� �������� �������� ������ �������� �������� �������� ������ ��
      //��������� � ����� ���������
      if(AnsiLowerCase(s) < AnsiLowerCase(p.GetValue)) then p:=p.left
       //����� ���� ������ �� ��������� � ������ ���������
       else if(AnsiLowerCase(s) > AnsiLowerCase(p.GetValue)) then p:=p.right
        //����� ��� �����, ������ ����� ������� �������
        else
        Begin
          //���������� true
          Result:=true;
          //�������
          exit;
        End;
    End;
    //���������� false �� ����� ������� �� ��������� s
    Result:=false;
end;

end.
