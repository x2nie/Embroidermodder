unit libembroidery_formats;
{see: http://www.swissdelphicenter.ch/torry/showcode.php?id=1133}
interface

uses
    libembroidery, Classes, Windows, Messages, SysUtils, Variants;


{$DEFINE EMBFORMAT_SUPPORTEDONLY} //Strict to lists only implemented format 

const
  EmbFormatSupportedCount = 59;
  EmbFormatSupportedFiles : array[0..EmbFormatSupportedCount-1, 0..3] of string =
    (//      R    W    Description
    ('10o', 'U', ' ', 'Toyota Embroidery Format'),
    ('100', 'U', ' ', 'Toyota Embroidery Format'),
    ('art', ' ', ' ', 'Bernina Embroidery Format'),
    ('bmc', ' ', ' ', 'Bitmap Cache Embroidery Format'),
    ('bro', 'U', ' ', 'Bits & Volts Embroidery Format'),
    ('cnd', ' ', ' ', 'Melco Embroidery Format'),
    ('col', 'U', 'U', 'Embroidery Thread Color Format'),
    ('csd', 'U', ' ', 'Singer Embroidery Format'),
    ('csv', 'U', 'U', 'Comma Separated Values'),
    ('dat', 'U', ' ', 'Barudan Embroidery Format'),
    ('dem', ' ', ' ', 'Melco Embroidery Format'),
    ('dsb', 'U', ' ', 'Barudan Embroidery Format'),
    ('dst', 'U', 'U', 'Tajima Embroidery Format'),
    ('dsz', 'U', ' ', 'ZSK USA Embroidery Format'),
    ('dxf', ' ', ' ', 'Drawing Exchange Format'),
    ('edr', 'U', 'U', 'Embird Embroidery Format'),
    ('emd', 'U', ' ', 'Elna Embroidery Format'),
    ('exp', 'U', 'U', 'Melco Embroidery Format'),
    ('exy', 'U', ' ', 'Eltac Embroidery Format'),
    ('eys', ' ', ' ', 'Sierra Expanded Embroidery Format'),
    ('fxy', 'U', ' ', 'Fortron Embroidery Format'),
    ('gnc', ' ', ' ', 'Great Notions Embroidery Format'),
    ('gt' , 'U', ' ', 'Gold Thread Embroidery Format'),
    ('hus', 'U', 'U', 'Husqvarna Viking Embroidery Format'),
    ('inb', 'U', ' ', 'Inbro Embroidery Format'),
    ('inf', 'U', 'U', 'Embroidery Color Format'),
    ('jef', 'U', 'U', 'Janome Embroidery Format'),
    ('ksm', 'U', 'U', 'Pfaff Embroidery Format'),
    ('max', 'U', ' ', 'Pfaff Embroidery Format'),
    ('mit', 'U', ' ', 'Mitsubishi Embroidery Format'),
    ('new', 'U', ' ', 'Ameco Embroidery Format'),
    ('ofm', 'U', ' ', 'Melco Embroidery Format'),
    ('pcd', 'U', 'U', 'Pfaff Embroidery Format'),
    ('pcm', 'U', ' ', 'Pfaff Embroidery Format'),
    ('pcq', 'U', 'U', 'Pfaff Embroidery Format'),
    ('pcs', 'U', 'U', 'Pfaff Embroidery Format'),
    ('pec', 'U', 'U', 'Brother Embroidery Format'),
    ('pel', ' ', ' ', 'Brother Embroidery Format'),
    ('pem', ' ', ' ', 'Brother Embroidery Format'),
    ('pes', 'U', 'U', 'Brother Embroidery Format'),
    ('phb', 'U', ' ', 'Brother Embroidery Format'),
    ('phc', 'U', ' ', 'Brother Embroidery Format'),
    ('plt', 'U', 'U', 'AutoCAD plot drawing'),
    ('rgb', 'U', 'U', 'RGB Embroidery Format'),
    ('sew', 'U', ' ', 'Janome Embroidery Format'),
    ('shv', 'U', ' ', 'Husqvarna Viking Embroidery Format'),
    ('sst', 'U', ' ', 'Sunstar Embroidery Format'),
    ('stx', 'U', ' ', 'Data Stitch Embroidery Format'),
    ('svg', 'U', 'U', 'Scalable Vector Graphics'),
    ('t09', 'U', ' ', 'Pfaff Embroidery Format'),
    ('tap', 'U', ' ', 'Happy Embroidery Format'),
    ('thr', 'U', 'U', 'ThredWorks Embroidery Format'),
    ('txt', ' ', 'U', 'Text File'),
    ('u00', 'U', ' ', 'Barudan Embroidery Format'),
    ('u01', ' ', ' ', 'Barudan Embroidery Format'),
    ('vip', 'U', ' ', 'Pfaff Embroidery Format'),
    ('vp3', 'U', ' ', 'Pfaff Embroidery Format'),
    ('xxx', 'U', 'U', 'Singer Embroidery Format'),
    ('zsk', 'U', ' ', 'ZSK USA Embroidery Format')
  );


function EmbReadersFilter(): string ;
procedure EmbFillWriter(AList: TStrings);

implementation

uses
  dllExportList;

var
  GReaders : TStrings = nil;
  GWriters : TStrings = nil;

function NameOfExt(ext: string; ColumnU: integer; defaultName: string = ''): string;
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
end;

procedure ScanDLL_AssumedReaderOrWriterEXT;
var
  LList : TStrings;
  s,ext,name : string;
  i : integer;
begin
  GReaders := TStringList.Create;
  GWriters := TStringList.Create;
  LList := TStringList.Create;

  try
    ListDLLExports(emblib, LList);
    for i := 0 to LList.Count - 1 do
    begin
      s := LList[i];
      //READ
      if (length(s) <= 7) and(copy(s,1,4) = 'read') then
      begin
        ext := lowerCase( copy(s, 5, length(s)) );
        if GReaders.IndexOfName(ext) < 0 then
        begin
          {$IFNDEF EMBFORMAT_SUPPORTEDONLY}
          GReaders.Values[ext] := NameOfExt(ext,1,'Embroidery Format');
          {$ELSE}
          name := NameOfExt(ext,1);
          if name <> '' then
            GReaders.Values[ext] := name;
          {$ENDIF}
        end;
      end

      //WRITE
      else if (length(s) <= 8) and (copy(s,1,5) = 'write') then
      begin
        ext := lowerCase( copy(s, 6, length(s)) );
        if GWriters.IndexOfName(ext) < 0 then
        begin
          {$IFNDEF EMBFORMAT_SUPPORTEDONLY}
          GWriters.Values[ext] := NameOfExt(ext,2,'Embroidery Format');
          {$ELSE}
          name := NameOfExt(ext,1);
          if name <> '' then
            GWriters.Values[ext] := name;
          {$ENDIF}
        end;

      end;

    end;
  finally
    LList.Free
  end;
end;

procedure EmbFillWriter(AList: TStrings);
begin
  if not assigned(GReaders) then
     ScanDLL_AssumedReaderOrWriterEXT;
  AList.Assign(GWriters);
end;

function EmbReadersFilter(): string ;
var i,j : integer;
  LList : TStrings;
  all,s : string;
begin
  if not assigned(GReaders) then
     ScanDLL_AssumedReaderOrWriterEXT;
  result := '';
  all := '';
  {$IFNDEF EMBSORTEDFILTER}
  for i := 0 to GReaders.Count-1 do
  begin
    if result <> '' then
      result := result + '|';
    result := result + format('%s  (*.%1:s)|*.%1:s',[GReaders.ValueFromIndex[i],GReaders.Names[i] ]);
    if all <> '' then
      all := all + ';';
    all := all + format('*.%s', [GReaders.Names[i]]);
  end;
  result := format('%s  (%1:s)|*.%1:s',['All embroidery format',all ]) +'|'+ result;

  {$ELSE}



  LList1 := TStringList.Create;
  try
    for i := 0 to GReaders.Count-1 do
    begin
      LList1.Add( format('%s (*.%1:s)|*.%1:s',[GReaders.ValueFromIndex[i],GReaders.Names[i] ]) );
    end;
    TStringList(LList1).Sort;
    for i := 0 to LList1.Count-1 do
    begin
      if result <> '' then
        result := result + '|';
      result := result + LList1[i];
    end;
  finally
    LList1.Free;
  end;

  {$ENDIF}

end;
     

end.
