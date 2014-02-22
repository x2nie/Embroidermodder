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

procedure TForm1.FormCreate(Sender: TObject);
begin
//  dlgOpen1.Filter := EmbReadersFilter();
  FPattern := embPattern_create();
  memo1.Lines.Add(format('Sizeof(TEmbPattern)= %d',[sizeof(TEmbPattern)] ));
  memo1.Lines.Add(format('Sizeof(TEmbObjectList)= %d',[sizeof(TEmbObjectList)] ));
  memo1.Lines.Add(format('Sizeof(TEmbObject)= %d',[sizeof(TEmbObject)] ));
  memo1.Lines.Add(format('Sizeof(TEmbColor)= %d',[sizeof(TEmbColor)] ));

  embPattern_read(FPattern, pchar('help.svg') );
  self.ParsePattern(FPattern);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  s : string;
  i, successful : Integer;
  LPattern : PEmbPattern;
begin
  if dlgOpen1.Execute then
  begin
    //if (p) then  raise excepion. 'libembroidery-convert-main.c main(), cannot allocate memory for p'); exit(1); }
    s := dlgOpen1.FileName;
    s := StringReplace(s,'\','\\',[rfReplaceAll]);
    s := s+#0;
    if assigned(FPattern) then
    begin

      LPattern := FPattern;
      embPattern_free(LPattern);
      vt.Clear;
      //FPattern := embPattern_create();
    end;
      LPattern := embPattern_create();
    //successful := embPattern_read(FPattern, pchar(s) );
      embPattern_read(LPattern, pchar('help.svg') );

    ParsePattern(LPattern);

  end;
end;

procedure TForm1.ParsePattern(APattern : PEmbPattern);
begin
  vt.Clear;
  if assigned(APattern.objectObjList) then
  AddNode(vt.RootNode, APattern.objectObjList);
end;

procedure TForm1.AddNode(Parent: PVirtualNode; PO: PEmbObjectList);
var Cur : PVirtualNode;
var data : PEmbObjectList;
begin
  Cur := vt.AddChild(Parent, PO);
  data := vt.GetNodeData(cur);
  data^ := PO^;
  if assigned(PO.child) then
    AddNode(Cur, PO.child);
  if assigned(PO.next) then
    AddNode(Parent, PO.next);
end;


procedure TForm1.vtGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := sizeof(TEmbObjectList);
end;

procedure TForm1.vtGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: WideString);
var data : PEmbObjectList;
  c : char;
  pl : PEmbPointList;
  s : string;
begin
  CellText := '?';
  data := vt.GetNodeData(Node);
  if assigned(data^.objectObj) then
  begin
    if Column = 0 then
    begin
      //c := chr(data^.objectObj^.kind);
      c := data^.objectObj^.kind;
      if c in ['0'..'9','A'..'Z','a'..'z'] then
        CellText := c
      else
        CellText := '#'+inttostr( ord(C));
//      CellText := CellText + '#'+ chr(data^.objectObj^.unused);
    end
    else
    if assigned(data^.objectObj^.pointList) then
    begin
//      exit;
      s := '-->';
      pl := data^.objectObj^.pointList;
      try
      while pl <> nil do
      begin
        //s := s+ format('%d,%d ',[round(pl.point.xx), round(pl.point.yy)]);
        //s := s + format('%f, %f   ',[pl^.memPoint^.xx, pl^.memPoint^.yy]);
        s := s+ format('(%f, %f)    ',[pl^.point.xx, pl^.point.yy]);
        { CellText := //CellText +
        FloatToStr(pl^.memPoint^.xx) +
        FloatToStr(pl^.memPoint^.yy);}
        pl := pl.next;
        //break;
      end;
      except
      end;
      CellText := s;
    end;
  end;
end;

end.
