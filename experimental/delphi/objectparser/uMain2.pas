unit uMain2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, VirtualTrees, libembroidery;

type
  TForm2 = class(TForm)
    dlgOpen1: TOpenDialog;
    vt: TVirtualStringTree;
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    procedure vtGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure vtInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure vtInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var ChildCount: Cardinal);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure vtGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
  private
    { Private declarations }
    //FPattern : PEmbPattern;
    FObject  : PEmbObjectList;
    procedure ParsePattern;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
type
  TFloatPoint = record
    x,y : double;
  end;
  TArrayOfFloatPoint = array of TFloatPoint;

  TData = record
    l : longint; //address of PEmbObjectList
    kind : char;
    points : TArrayOfFloatPoint;
  end;
  PData = ^TData;



procedure TForm2.vtGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := sizeof(TData);
end;


procedure TForm2.vtInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var Oparent,O : PEmbObjectList;
  Dparent,Data : PData;
  i : integer;
begin
  if (ParentNode = vt.RootNode) or (ParentNode = nil) then
  begin
    O := FObject;// FPattern.objectObjList;
  end
  else
  begin
    DParent := vt.GetNodeData(ParentNode);
    Oparent := PEmbObjectList(DParent^.l);
    O := Oparent.child;
    for i := 1 to Node.Index do
    begin
      O := O.next;      
    end;
  end;

  Data := vt.GetNodeData(Node);
  Data^.l := longint(@O);
  Data^.kind := O^.objectObj.kind;
  //setlength(Data^.points,0);
end;

procedure TForm2.vtInitChildren(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var ChildCount: Cardinal);
var Ochild,O : PEmbObjectList;
  Dparent,Data : PData;
  i : integer;
begin
  ChildCount:=0;
  Data := vt.GetNodeData(Node);
  O := PEmbObjectList(Data^.l);
  Ochild := O.child;
  if assigned(Ochild) then
  begin
    ChildCount := embObjectList_count(Ochild);
  end;

end;

procedure TForm2.ParsePattern;
begin
  vt.Clear;
  //if assigned(FPattern) and assigned(FPattern^.objectObjList) then
  if assigned(FObject) then
    vt.RootNodeCount := 1;//embObjectList_count(FPattern.objectObjList);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  //FPattern := embPattern_create();
  Button1Click(nil);
end;
             
procedure TForm2.Button1Click(Sender: TObject);
var FPattern : PEmbPattern;
begin
  FPattern := embPattern_create();
  embPattern_read(FPattern, pchar('help.svg'#0) );
  FObject := FPattern.objectObjList;
  FPattern.objectObjList := nil;
  FPattern.lastObjectObj := nil;
//  embPattern_free(FPattern);
  ParsePattern();
  vt.Expanded[vt.RootNode] := true;
end;

procedure TForm2.vtGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
var
  Data : PData;
begin
  Data := vt.GetNodeData(Node);
  if Column = 0 then
  begin
    Celltext := data^.kind
  end
  else
  begin
  end;
end;

end.
