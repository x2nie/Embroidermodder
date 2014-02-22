unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, libembroidery, StdCtrls, VirtualTrees;

type
  TForm1 = class(TForm)
    dlgOpen1: TOpenDialog;
    Button1: TButton;
    vt: TVirtualStringTree;
    Memo1: TMemo;
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
    procedure ParsePattern;
    procedure AddNode(Parent: PVirtualNode; PO: PEmbObjectList);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  libembroidery_formats;

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
  self.ParsePattern;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  s : string;
  i, successful : Integer;
begin
  if dlgOpen1.Execute then
  begin
    //if (p) then  raise excepion. 'libembroidery-convert-main.c main(), cannot allocate memory for p'); exit(1); }
    s := dlgOpen1.FileName;
    successful := embPattern_read(FPattern, pchar(s) );

  end;
end;

procedure TForm1.ParsePattern;
begin
  vt.Clear;
  AddNode(vt.RootNode, self.FPattern.objectObjList);
end;

procedure TForm1.AddNode(Parent: PVirtualNode; PO: PEmbObjectList);
var Cur : PVirtualNode;
begin
  Cur := vt.AddChild(Parent, PO);
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
begin
  CellText := '?';
  data := vt.GetNodeData(Node);
  if assigned(data^.objectObj) then
    CellText := inttostr( ord(data^.objectObj^.kind));
end;

end.
