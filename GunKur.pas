unit Gunkur;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, ADODB, StdCtrls, Forms,
  DBCtrls, DB, Buttons, Spin, DBGrids, ExtCtrls, Dialogs, Utils, ComCtrls, Grids,
  Mask, Variants, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, JvMemoryDataset, JvExMask, JvToolEdit, JvExControls, JvSpin, IdCookie;

type
  TCurrencyForm = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    DSTemp: TDataSource;
    Label1: TLabel;
    Panel4: TPanel;
    SpBtnDate: TJvSpinButton;
    DBGrid1: TDBGrid;
    tblTemp: TJvMemoryData;
    tblTempkod: TStringField;
    tblTempad: TStringField;
    tblTempF1: TFloatField;
    tblTempF2: TFloatField;
    tblTempF3: TFloatField;
    tblTempF4: TFloatField;
    CGun: TJvDateEdit;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    btnTcmb: TButton;
    procedure SpBtnDateDownClick(Sender: TObject);
    procedure SpBtnDateUpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTcmbClick(Sender: TObject);
    procedure IdHTTP1Redirect(Sender: TObject; var dest: string;
      var NumRedirect: Integer; var Handled: Boolean; var VMethod: string);
    procedure IdCookieManager1NewCookie(ASender: TObject; ACookie: TIdCookie;
      var VAccept: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    procedure GetFile(const aaddr: String; var astr: String);
    procedure BufToTable(tar: TDateTime; const aTcmbBuf : string);
  public
  end;

var
  CurrencyForm1 : TCurrencyForm;

implementation

Uses ATCMBXml;

{$R *.DFM}

procedure TCurrencyForm.SpBtnDateUpClick(Sender: TObject);
begin
   CGun.Date := CGun.Date + 1;
end;

procedure TCurrencyForm.SpBtnDateDownClick(Sender: TObject);
begin
   CGun.Date := CGun.Date - 1;
end;

procedure TCurrencyForm.FormShow(Sender: TObject);
begin
  Caption := 'G�nl�k kurlar ('+ DateToStr(CGun.Date)+')';
end;

procedure TCurrencyForm.IdCookieManager1NewCookie(ASender: TObject;
  ACookie: TIdCookie; var VAccept: Boolean);
begin
  VAccept := True;
end;

procedure TCurrencyForm.IdHTTP1Redirect(Sender: TObject; var dest: string;
  var NumRedirect: Integer; var Handled: Boolean; var VMethod: string);
begin
  Handled := True;
end;

procedure TCurrencyForm.GetFile(const aaddr : String;var astr : String);
var
  ms : TStringStream;
begin
  astr := '';
  ms := TStringStream.Create;
  try
    IdHTTP1.Get(aaddr, ms);
    ms.Position := 0;
    astr := ms.ReadString(ms.Size);
  finally
    ms.Free;
  end;
end;

procedure TCurrencyForm.BufToTable(tar : TDateTime; const aTcmbBuf : string);
var
  IXmlP : IXMLTarih_DateType;
  i, stat : Integer;
  F1, F2, F3, F4 : Extended;
begin
  IXmlP := LoadTarih_DateDATA(aTcmbBuf);

  for i:=0 to IXmlP.Count-1 do
  begin
    F1 := 0;
    F2 := 0;
    F3 := 0;
    F4 := 0;

    if IXmlP.Currency[i].ForexBuying<>'' then
      Val(IXmlP.Currency[i].ForexBuying, F1, stat);
    if IXmlP.Currency[i].ForexSelling<>'' then
      Val(IXmlP.Currency[i].ForexSelling, F2, stat);
    if IXmlP.Currency[i].BanknoteBuying<>'' then
      Val(IXmlP.Currency[i].BanknoteSelling, F3, stat);
    if IXmlP.Currency[i].BanknoteSelling<>'' then
      Val(IXmlP.Currency[i].BanknoteSelling, F4, stat);
    TblTemp.Append;
    TblTempkod.AsString := IXmlP.Currency[i].CurrencyCode;
    TblTempad.AsString := IXmlP.Currency[i].CurrencyName;
    TblTempF1.AsFloat := F1;
    TblTempF2.AsFloat := F2;
    TblTempF3.AsFloat := F3;
    TblTempF4.AsFloat := F4;
    TblTemp.Post;
  end;
  TblTemp.First;

end;

procedure TCurrencyForm.btnTcmbClick(Sender: TObject);
var
  T : TDateTime;
  sbuf : string;
var
  bm : TBookmark;
begin

  T := CGun.Date;
  {
    Kurlar g�n sonunda belli oldu�u i�in Mali i�lerde kullan�rken bir �nceki i� g�n�
    esas al�n�r. Bu nedenle bu k�sm� kullanmak gerekebilir. �stedi�inizde buray� a�arsan�z
    kur al�nan tarihleri de�i�tirir.

  if DayOfWeek(T) = 1 then
    T := T-3      // Pazartesi kurlar�n� bir �nceki Cuma'dan alacak
  else
  if DayOfWeek(T) = 6 then
    T := T-1      // Cumartesi kurlar�n� bir �nceki Cuma'dan alacak
  else
  if DayOfWeek(T) = 0 then
    T := T-2      // Pazar kurlar�n� bir �nceki Cuma'dan alacak
  else
    T := T-1;  // TCMB'de bir g�n �ncenin kurlar�n� al�yor.

  }

  if T = Date then
    GetFile('https://www.tcmb.gov.tr/kurlar/today.xml', sbuf)
  else
    GetFile('https://www.tcmb.gov.tr/kurlar/'+FormatDateTime('yyyymm', T)+'/'+FormatDateTime('ddmmyyyy', T)+'.xml', sbuf);

  TblTemp.EmptyTable;
  TblTemp.Open;

  bm := tblTemp.GetBookmark;
  try
    BufToTable(T, sbuf);
  finally
    tblTemp.GotoBookmark(bm);
    tblTemp.FreeBookmark(bm);
  end;

  Caption := 'G�nl�k kurlar ('+ DateToStr(CGun.Date)+')';
end;

procedure TCurrencyForm.FormCreate(Sender: TObject);
begin
  CGun.Date := Date;
end;

end.
