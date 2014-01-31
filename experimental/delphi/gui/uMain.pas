{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
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
    vtExts: TVirtualStringTree;
    spl2: TSplitter;
    pnlOutput: TPanel;
    pnlOutputConfig: TPanel;
    vtResult: TVirtualStringTree;
    rgAdditionalDir: TRadioGroup;
    grpTargetDir: TGroupBox;
    rbInPlace: TRadioButton;
    rbOutputDifferentDir: TRadioButton;
    edtOutputDir: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnEmbOpenClick(Sender: TObject);
    procedure vtOpenGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vtExtsGetText(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vtExtsInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure vtOpenGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure vtExtsGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure vtExtsChecked(Sender: TBaseVirtualTree;
      Node: PVirtualNode);
    procedure vtResultGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure vtResultGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure edtOutputDirChange(Sender: TObject);
  private
    { Private declarations }
    FInputFiles : TStrings;
    //FOutputExts : TStrings;
    procedure AddOpenFile(AFilePath: string);
    procedure FillExts;
    procedure RebuildOutputResult;
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
    Txt : string;
  end;

  PEmbExt = ^TEmbExt;
  TEmbExt = record
    Ext : string;
    Desc : string;
  end;

  PResult = ^TResult;
  TResult = record
    Txt : string;
    Source : string;
    SourcePath : string;
    processed : boolean;
  end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //mmo1.Lines.Add( EmbReadersFilter() );
  FInputFiles := TStringList.Create;
  dlgOpen1.Filter := EmbReadersFilter();
  FillExts();
  pnlOutput.Align := alClient;
end;

procedure TForm1.FillExts();
var
  LExt : PEmbExt;
  function AddNew(Parent: PVirtualNode; AExt, ADesc: string):PVirtualNode;
  begin
    result := vtExts.AddChild(Parent);
    LExt := vtExts.GetNodeData(result);
    LExt^.Ext := AExt;
    LExt^.Desc := ADesc;
  end;
var i : integer;
  LExtList : TStringList;
begin
  LExtList := TStringList.Create;
  EmbFillWriter(LExtList);
  //vtOutExt.RootNodeCount := LExtList.Count;
  for i := 0 to LExtList.Count -1 do
  begin
    AddNew(vtExts.RootNode, '.'+LExtList.Names[i], LExtList.ValueFromIndex[i]);
  end;
  LExtList.Free;

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
      AddOpenFile(dlgOpen1.Files[i]);
    end;
    //vtOpen.RootNodeCount := FInputFiles.Count;
  end;
  vtOpen.FullExpand();
end;

procedure TForm1.AddOpenFile(AFilePath: string);
var
  Data : PData;
  function AddNew(Parent: PVirtualNode; AText: string):PVirtualNode;
  begin
    result := vtOpen.AddChild(Parent);
    data := vtOpen.GetNodeData(result);
    data^.Txt := Atext;
    data^.processed := False;
  end;

var
  LFile, LPath : string;
  Parent, Node : PVirtualNode;
  i : integer;
begin
  LFile := ExtractFileName(AFilePath);
  LPath := ExtractFilePath(AFilePath);

  //find parent
  Parent := vtOpen.RootNode.FirstChild;
  while Parent <> nil do
  begin
    Data := vtOpen.GetNodeData(Parent);
    if Data^.Txt = LPath then
    begin
      break; //found.
    end
    else
    begin
      Parent := Parent.NextSibling;
    end;
  end;
  if Not Assigned(Parent) then
  begin
    //append parent to root
    Parent := AddNew(vtOpen.RootNode, LPath);
  end;

  //append child to parent
  AddNew(Parent, LFile);
end;


procedure TForm1.vtOpenGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  Data : PData;
begin
  Data := vtOpen.GetNodeData(Node);
  CellText := Data^.Txt;// FInputFiles[Node^.index];
end;

procedure TForm1.vtExtsGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  Ext : PEmbExt;
begin
  Ext := vtExts.GetNodeData(Node);
  if assigned(Ext) then
  case Column of
    0 : CellText := Ext^.Ext;
    1 : CellText := Ext^.Desc;
  end;
end;

procedure TForm1.vtExtsInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
begin
  Node^.CheckType := ctCheckBox;
end;

procedure TForm1.vtOpenGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := sizeof(TData);
end;

procedure TForm1.vtExtsGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := sizeof(TEmbExt);
end;

procedure TForm1.vtExtsChecked(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
begin
  RebuildOutputResult();
end;

procedure TForm1.RebuildOutputResult();
var LExts : array of string;

  procedure ScanExts();
  var Node : PVirtualNode;
    i : integer;
    R : PEmbExt;
  begin
    SetLength(LExts,0);
    Node := vtExts.RootNode;
    repeat
      Node := vtExts.GetNextChecked(Node, csCheckedNormal, true);
      if assigned(Node) then
      begin
        i := Length(LExts);
        SetLength(LExts, i+1);
        R := vtExts.GetNodeData(Node);
        LExts[i] := '.'+ R^.Ext;
      end;
    until Node = nil;

  end;

  var
    RData : PResult;
  function AddNew(Parent: PVirtualNode; AText: string; ASource: string=''; APath: string=''):PVirtualNode;
  begin
    result := vtResult.AddChild(Parent);
    RData := vtResult.GetNodeData(result);
    RData^.Txt := Atext;
    RData^.processed := False;
    RData^.Source := ASource;
    RData^.SourcePath := APath;
  end;
  procedure AttachManyExt(Parent: PVirtualNode; AText: string; ASource: string=''; APath: string='');
  begin

  end;

  procedure AddNewResult(AFile, APath: string);
  var Parent : PVirtualNode;
    i : integer;
  begin
    //find parent
    Parent := vtResult.RootNode.FirstChild;
    while Parent <> nil do
    begin
      RData := vtResult.GetNodeData(Parent);
      if RData^.Txt = APath then
      begin
        break; //found.
      end
      else
      begin
        Parent := Parent.NextSibling;
      end;
    end;
    if Not Assigned(Parent) then
    begin
      //append parent to root
      Parent := AddNew(vtResult.RootNode, APath);
    end;

    //append child to parent
    for i := 0 to length(LExts) -1 do
    begin
      AddNew(Parent, ChangeFileExt(AFile, LExts[i]), AFile, APath );
    end;
  end;

var
  Parent, Node, RNode : PVirtualNode;
  R : PResult;
  ParentData, Data : PData;

begin
  //result count = checked.count * open.count
  vtResult.BeginUpdate;
  try
    vtResult.Clear;
    ScanExts();
    Parent := vtOpen.RootNode.FirstChild;
    while Parent <> nil do
    begin
      ParentData := vtOpen.GetNodeData(Parent);

      Node := Parent.FirstChild;
      while Node <> nil do
      begin
        Data := vtOpen.GetNodeData(Node);
        {RNode := vtResult.AddChild(nil);
        R := vtResult.GetNodeData(RNode);
        R^.Txt := Data^.Txt;}
        AddNewResult(Data^.Txt, ParentData^.Txt);
        Node := Node.NextSibling;
      end;
      
      {Node := vtExts.GetNextChecked(Node, csCheckedNormal, true);
      if assigned(Node) then
      begin
        i := Length(LExts);
        SetLength(LExts, i+1);
        R := vtExts.GetNodeData(Node);
        LExts[i] := R^.Ext;
      end;}
      Parent := Parent.NextSibling;
    end;
  finally
    vtResult.FullExpand();
    vtResult.EndUpdate;
  end;
end;

procedure TForm1.vtResultGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := sizeOf(TResult);
end;

procedure TForm1.vtResultGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var Data : PResult;
begin
  data := vtResult.GetNodeData(Node);
  case column of
    0 : CellText := data^.Txt;
    1 : CellText := data^.Source;
    2 : CellText := data^.SourcePath;
  end;
end;

procedure TForm1.edtOutputDirChange(Sender: TObject);
begin
  rbOutputDifferentDir.Checked := true;
end;

end.
