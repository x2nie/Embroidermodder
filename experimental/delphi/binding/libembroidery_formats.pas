unit libembroidery_formats;

interface

uses
    libembroidery, Classes, Windows, SysUtils;



function EmbReadersFilter: string ;
procedure EmbFillWriter(AList: TStrings);

implementation

type
  TEmbFileFormat = record
    extension : string;
    description: string;
    state     : Char;
    version   : Word;
    formatType: Word;
  end;

  TArayOfEmbFileFormat = array of TEmbFileFormat;


var
  GReaders : TArayOfEmbFileFormat = nil;
  GWriters : TArayOfEmbFileFormat = nil;

(*function NameOfExt(ext: string; ColumnU: integer; defaultName: string = ''): string;
var i : integer;
begin
  result := defaultName;
  for i := 0 to EmbFormatSupportedCount-1 do
  begin
    if EmbFormatSupportedFiles[i][0] = ext then //MATCH
    begin
      {$IFNDEF EMBFORMAT_SUPPORTEDONLY}
      result := EmbFormatSupportedFiles[i][3];
      {$ELSE}
      if trim(EmbFormatSupportedFiles[i][ColumnU]) <> '' then
        result := EmbFormatSupportedFiles[i][3];

      {$ENDIF}
      break;
    end;
  end;
end;*)

procedure build_RW;
var
  i : integer;

  hformats : PEmbFormatList;
  current : PEmbFormat;
  pext, description: PChar;
  stateReader, stateWriter : char;
  formatType : integer;
  formatCount: integer;
  readerCount: integer;
  writerCount: integer;
  extensions : array of string;
begin
  hformats := embFormatList_create();
  formatCount := hformats^.formatCount;
  setlength(extensions, formatCount);
  current  := hformats.firstFormat;
  i := 0;
  while current <> nil do
  begin
    extensions[i] := current.extension;
    current := current.next;
    inc(i);
    if i > formatCount then break;
  end;
  embFormatList_free(hformats);
  SetLength(GReaders, formatCount);
  SetLength(GWriters, formatCount);
  readerCount := 0;
  writerCount := 0;


  try
    //while current <> nil do
    for i := 0 to formatCount -1 do
    begin
      embFormat_info( pchar(extensions[i]), pext, description, stateReader, stateWriter, formatType );
      //READ
      if stateReader <> ' ' then
      begin
          GReaders[readerCount].extension   := pext;
          GReaders[readerCount].description := description;
          GReaders[readerCount].state       := stateReader;
          GReaders[readerCount].formatType  := formatType;
          inc(readerCount);
      end;

      //WRITE
      if stateWriter <> ' ' then
      begin
          GWriters[writerCount].extension   := pext;
          GWriters[writerCount].description := description;
          GWriters[writerCount].state       := stateWriter;
          GWriters[writerCount].formatType  := formatType;
          inc(writerCount);
      end;
    end;
  finally
    SetLength(GReaders, readerCount);
    SetLength(GWriters, writerCount);
    SetLength( extensions, 0);
  end;

    
end;

procedure EmbFillWriter(AList: TStrings);
var i : integer;
begin
  if not assigned(GWriters) then
     build_RW;
  if Assigned(GWriters) then
  begin
    for i := 0 to length(GWriters)-1 do
    begin
      AList.Add(format('%s=%s',[GWriters[i].extension, GWriters[i].description]) );
    end;

  end;
//  AList.Assign(GWriters);
end;

function EmbReadersFilter: string ;
var i : integer;
  pool,allExt : string;
begin
  if not assigned(GReaders) then
  begin
     build_RW;
  end;
  
  pool := '';
  allExt := '';
  if assigned(GReaders) then
  begin
    for i := 0 to length(GReaders) -1 do
    begin
      if pool <> '' then
        pool := pool + '|';
      pool := pool + format('%s  (*%1:s)|*%1:s',[GReaders[i].description,GReaders[i].extension ]);
      if allExt <> '' then
        allExt := allExt + ';';
      allExt := allExt + format('*%s', [GReaders[i].extension ]);
    end;
  end;
  pool := format('%s  (%1:s)|*%1:s',['All embroidery format',allExt ]) +'|'+ pool;
  result := pool;
end;
     

end.
