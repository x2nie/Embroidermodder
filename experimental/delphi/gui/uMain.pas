unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, libembroidery, StdCtrls, ExtDlgs, ExtCtrls, VirtualTrees;

type
  TForm1 = class(TForm)
    mmo1: TMemo;
    dlgOpen1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel1: TPanel;
    Button1: TButton;
    btnEmbOpen: TButton;
    vtOpen: TVirtualStringTree;
    spl1: TSplitter;
    vtOutExt: TVirtualStringTree;
    procedure FormCreate(Sender: TObject);
    procedure btnEmbOpenClick(Sender: TObject);
    procedure vtOpenGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vtOutExtGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vtOutExtInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
  private
    { Private declarations }
    FInputFiles : TStrings;
    FOutputExts : TStrings;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses dllExportList, libembroidery_formats;

{$R *.dfm}

type
  PData = ^TData;
  TData = record
    processed : boolean;
    fileName : string;
  end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  mmo1.Lines.Add( EmbReadersFilter() );
  FInputFiles := TStringList.Create;
  FOutputExts := TStringList.Create;
  EmbFillWriter(FOutputExts);
  vtOutExt.RootNodeCount := FOutputExts.Count;
  self.dlgOpen1.Filter := EmbReadersFilter();

end;

procedure TForm1.btnEmbOpenClick(Sender: TObject);
var i : integer;
begin
  if dlgOpen1.Filter = '' then
    dlgOpen1.Filter := EmbReadersFilter();
    //self.mmo1.Lines.Assign(GReaders);

  if dlgOpen1.Execute then
  begin
    for i := 0 to dlgOpen1.Files.Count -1 do
    begin
      if FInputFiles.IndexOf(dlgOpen1.Files[i]) < 0 then
        FInputFiles.Add(dlgOpen1.Files[i]);
    end;
    vtOpen.RootNodeCount := FInputFiles.Count;

  end;
end;

procedure TForm1.vtOpenGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
begin
  CellText := FInputFiles[Node^.index];
end;

procedure TForm1.vtOutExtGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
begin
  CellText := FOutputExts[Node^.index];
end;

procedure TForm1.vtOutExtInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node^.CheckType := ctCheckBox;
end;

end.
