unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, libembroidery, StdCtrls, VirtualTrees, ExtCtrls;

type
  TForm1 = class(TForm)
    dlgOpen1: TOpenDialog;
    vt: TVirtualStringTree;
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure vtGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure vtGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vtInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure vtInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var ChildCount: Cardinal);
  private
    { Private declarations }
    FPattern : PEmbPattern;
    procedure ParsePattern(APattern : PEmbPattern);
    procedure AddNode(Parent: PVirtualNode; PO: PEmbObjectList);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  libembroidery_formats, strutils;

{$R *.dfm}

type
  TFloatPoint = record
    x,y : double;
  end;
  TArrayOfFloatPoint = array of TFloatPoint;
  TEmbShape = packed record
    kind : char;
    points : TArrayOfFloatPoint;
  end;
  PEmbShape = ^TEmbShape;

procedure TForm1.FormCreate(Sender: TObject);
var  LPattern : PEmbPattern;
begin
//  dlgOpen1.Filter := EmbReadersFilter();
  //LPattern := embPattern_create();
  memo1.Lines.Add(format('Sizeof(TEmbPattern)= %d',[sizeof(TEmbPattern)] ));
  memo1.Lines.Add(format('Sizeof(TEmbObjectList)= %d',[sizeof(TEmbObjectList)] ));
  memo1.Lines.Add(format('Sizeof(TEmbObject)= %d',[sizeof(TEmbObject)] ));
  memo1.Lines.Add(format('Sizeof(TEmbColor)= %d',[sizeof(TEmbColor)] ));

  //embPattern_read(LPattern, pchar('help.svg') );
  //self.ParsePattern(LPattern);
  //Button1Click(nil);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  //s : string;
  i, successful : Integer;
  LPattern : PEmbPattern;
begin
//  if dlgOpen1.Execute then
  begin
    //if (p) then  raise excepion. 'libembroidery-convert-main.c main(), cannot allocate memory for p'); exit(1); }
    {s := dlgOpen1.FileName;
    s := StringReplace(s,'\','\\',[rfReplaceAll]);
    s := s+#0;}
    {if assigned(FPattern) then
    begin

      //LPattern := FPattern;
      embPattern_free(FPattern);
      vt.Clear;
      //FPattern := embPattern_create();
    end;}
    LPattern := embPattern_create();
    //successful := embPattern_read(FPattern, pchar(s) );
    embPattern_read(LPattern, pchar('help.svg') );

    ParsePattern(LPattern);
//    embPattern_free(LPattern);
  end;
end;

procedure TForm1.ParsePattern(APattern : PEmbPattern);
begin
  vt.Clear;
  if assigned(APattern.objectObjList) then
  AddNode(vt.RootNode, APattern.objectObjList);
  //vt.ReinitChildren(nil,true);
//  vt.InvalidateChildren(nil,true);
end;

procedure TForm1.AddNode(Parent: PVirtualNode; PO: PEmbObjectList);
var Cur : PVirtualNode;
var data : TEmbShape;
  PLen : integer;
  i : integer;
  pl : PEmbPointList;

begin
  //Cur := vt.AddChild(Parent);
  //data := vt.GetNodeData(cur);
  //new(data);
  setlength(data.points, 0);
  i := 0;
  if assigned(PO.objectObj) then
  begin
    data.kind := PO.objectObj^.kind;
    if  assigned(PO.objectObj.pointList) then
    begin
      pl := PO.objectObj.pointList;
      while assigned(pl) do
      begin
        setlength(data.points, i+1);
        data.points[i].x := pl.point.xx;//
        data.points[i].y := pl.point.yy;//
        pl := pl.next;
        inc(i);
      end;
    end;
    pl := nil;
  end;
  Cur := vt.AddChild(Parent,@Data);
  vt.InvalidateNode(cur);

  if assigned(PO.child) then
    AddNode(Cur, PO.child);
  if assigned(PO.next) then
    AddNode(Parent, PO.next);
end;


procedure TForm1.vtGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := sizeof(TEmbShape);
end;

procedure TForm1.vtGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
var data : PEmbShape;
  c : char;
  pl : PEmbPointList;
  s : string;
  i : integer;
begin
  CellText := '?';
  data := vt.GetNodeData(Node);
  //if assigned(data^.objectObj) then
  begin
    if Column = 0 then
    begin
      //c := chr(data^.objectObj^.kind);
      c := data^.kind;
      if c in ['0'..'9','A'..'Z','a'..'z'] then
        CellText := c
      else
        CellText := '#'+inttostr( ord(C));
//      CellText := CellText + '#'+ chr(data^.objectObj^.unused);
    end
    else
    if assigned(data^.points) then
    begin
//      exit;
      s := '-->';
      //pl := data^.objectObj^.pointList;
      try
      //while pl <> nil do
      for i := 0 to length(data^.points) -1 do
      begin
        //s := s+ format('%d,%d ',[round(pl.point.xx), round(pl.point.yy)]);
        //s := s + format('%f, %f   ',[pl^.memPoint^.xx, pl^.memPoint^.yy]);
        //s := s+ format('(%f, %f)    ',[pl^.point.xx, pl^.point.yy]);
        s := s + format('(%f, %f)   ',[data^.points[i].x, data^.points[i].y] );
        { CellText := //CellText +
        FloatToStr(pl^.memPoint^.xx) +
        FloatToStr(pl^.memPoint^.yy);}
        //pl := pl.next;
        //break;
      end;
      except
      end;
      CellText := s;
    end;
  end;
end;

procedure TForm1.vtInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  //InitialStates := InitialStates + [ivsExpanded] - [ivsReInit];
end;

procedure TForm1.vtInitChildren(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var ChildCount: Cardinal);
begin
//
end;

end.
