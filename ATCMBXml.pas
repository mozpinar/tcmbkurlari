
{**************************************************************************}
{                                                                          }
{                             XML Data Binding                             }
{                                                                          }
{ This unit is generated to build TCMB Central Bank Currency prices for    }
{                        Gözen Accounting System                           }
{**************************************************************************}

unit ATCMBXml;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLTarih_DateType = interface;
  IXMLCurrencyType = interface;

{ IXMLTarih_DateType }

  IXMLTarih_DateType = interface(IXMLNodeCollection)
    ['{5ED7E405-5F19-4FFD-B8EC-8A1D4DDFB3E0}']
    { Property Accessors }
    function Get_Tarih: WideString;
    function Get_Date: WideString;
    function Get_Bulten_No: WideString;
    function Get_Currency(Index: Integer): IXMLCurrencyType;
    procedure Set_Tarih(Value: WideString);
    procedure Set_Date(Value: WideString);
    procedure Set_Bulten_No(Value: WideString);
    { Methods & Properties }
    function Add: IXMLCurrencyType;
    function Insert(const Index: Integer): IXMLCurrencyType;
    property Tarih: WideString read Get_Tarih write Set_Tarih;
    property Date: WideString read Get_Date write Set_Date;
    property Bulten_No: WideString read Get_Bulten_No write Set_Bulten_No;
    property Currency[Index: Integer]: IXMLCurrencyType read Get_Currency; default;
  end;

{ IXMLCurrencyType }

  IXMLCurrencyType = interface(IXMLNode)
    ['{47B29DD5-1AA7-47B7-874F-CB76017EB301}']
    { Property Accessors }
    function Get_CrossOrder: Integer;
    function Get_Kod: WideString;
    function Get_CurrencyCode: WideString;
    function Get_Unit_: Integer;
    function Get_Isim: WideString;
    function Get_CurrencyName: WideString;
    function Get_ForexBuying: WideString;
    function Get_ForexSelling: WideString;
    function Get_BanknoteBuying: WideString;
    function Get_BanknoteSelling: WideString;
    function Get_CrossRateUSD: Integer;
    function Get_CrossRateOther: WideString;
    procedure Set_CrossOrder(Value: Integer);
    procedure Set_Kod(Value: WideString);
    procedure Set_CurrencyCode(Value: WideString);
    procedure Set_Unit_(Value: Integer);
    procedure Set_Isim(Value: WideString);
    procedure Set_CurrencyName(Value: WideString);
    procedure Set_ForexBuying(Value: WideString);
    procedure Set_ForexSelling(Value: WideString);
    procedure Set_BanknoteBuying(Value: WideString);
    procedure Set_BanknoteSelling(Value: WideString);
    procedure Set_CrossRateUSD(Value: Integer);
    procedure Set_CrossRateOther(Value: WideString);
    { Methods & Properties }
    property CrossOrder: Integer read Get_CrossOrder write Set_CrossOrder;
    property Kod: WideString read Get_Kod write Set_Kod;
    property CurrencyCode: WideString read Get_CurrencyCode write Set_CurrencyCode;
    property Unit_: Integer read Get_Unit_ write Set_Unit_;
    property Isim: WideString read Get_Isim write Set_Isim;
    property CurrencyName: WideString read Get_CurrencyName write Set_CurrencyName;
    property ForexBuying: WideString read Get_ForexBuying write Set_ForexBuying;
    property ForexSelling: WideString read Get_ForexSelling write Set_ForexSelling;
    property BanknoteBuying: WideString read Get_BanknoteBuying write Set_BanknoteBuying;
    property BanknoteSelling: WideString read Get_BanknoteSelling write Set_BanknoteSelling;
    property CrossRateUSD: Integer read Get_CrossRateUSD write Set_CrossRateUSD;
    property CrossRateOther: WideString read Get_CrossRateOther write Set_CrossRateOther;
  end;

{ Forward Decls }

  TXMLTarih_DateType = class;
  TXMLCurrencyType = class;

{ TXMLTarih_DateType }

  TXMLTarih_DateType = class(TXMLNodeCollection, IXMLTarih_DateType)
  protected
    { IXMLTarih_DateType }
    function Get_Tarih: WideString;
    function Get_Date: WideString;
    function Get_Bulten_No: WideString;
    function Get_Currency(Index: Integer): IXMLCurrencyType;
    procedure Set_Tarih(Value: WideString);
    procedure Set_Date(Value: WideString);
    procedure Set_Bulten_No(Value: WideString);
    function Add: IXMLCurrencyType;
    function Insert(const Index: Integer): IXMLCurrencyType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCurrencyType }

  TXMLCurrencyType = class(TXMLNode, IXMLCurrencyType)
  protected
    { IXMLCurrencyType }
    function Get_CrossOrder: Integer;
    function Get_Kod: WideString;
    function Get_CurrencyCode: WideString;
    function Get_Unit_: Integer;
    function Get_Isim: WideString;
    function Get_CurrencyName: WideString;
    function Get_ForexBuying: WideString;
    function Get_ForexSelling: WideString;
    function Get_BanknoteBuying: WideString;
    function Get_BanknoteSelling: WideString;
    function Get_CrossRateUSD: Integer;
    function Get_CrossRateOther: WideString;
    procedure Set_CrossOrder(Value: Integer);
    procedure Set_Kod(Value: WideString);
    procedure Set_CurrencyCode(Value: WideString);
    procedure Set_Unit_(Value: Integer);
    procedure Set_Isim(Value: WideString);
    procedure Set_CurrencyName(Value: WideString);
    procedure Set_ForexBuying(Value: WideString);
    procedure Set_ForexSelling(Value: WideString);
    procedure Set_BanknoteBuying(Value: WideString);
    procedure Set_BanknoteSelling(Value: WideString);
    procedure Set_CrossRateUSD(Value: Integer);
    procedure Set_CrossRateOther(Value: WideString);
  end;

{ Global Functions }

function GetTarih_Date(Doc: IXMLDocument): IXMLTarih_DateType;
function LoadTarih_Date(const FileName: WideString): IXMLTarih_DateType;
function LoadTarih_DateDATA(const XMLData: DOMString): IXMLTarih_DateType;
function NewTarih_Date: IXMLTarih_DateType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetTarih_Date(Doc: IXMLDocument): IXMLTarih_DateType;
begin
  Result := Doc.GetDocBinding('Tarih_Date', TXMLTarih_DateType, TargetNamespace) as IXMLTarih_DateType;
end;

function LoadTarih_Date(const FileName: WideString): IXMLTarih_DateType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Tarih_Date', TXMLTarih_DateType, TargetNamespace) as IXMLTarih_DateType;
end;

function LoadTarih_DateDATA(const XMLData: DOMString): IXMLTarih_DateType;
begin
  Result := LoadXMLData(XmlData).GetDocBinding('Tarih_Date', TXMLTarih_DateType, TargetNamespace) as IXMLTarih_DateType;
  //Result := LoadXMLData(const XMLData: DOMString):
end;

function NewTarih_Date: IXMLTarih_DateType;
begin
  Result := NewXMLDocument.GetDocBinding('Tarih_Date', TXMLTarih_DateType, TargetNamespace) as IXMLTarih_DateType;
end;

{ TXMLTarih_DateType }

procedure TXMLTarih_DateType.AfterConstruction;
begin
  RegisterChildNode('Currency', TXMLCurrencyType);
  ItemTag := 'Currency';
  ItemInterface := IXMLCurrencyType;
  inherited;
end;

function TXMLTarih_DateType.Get_Tarih: WideString;
begin
  Result := AttributeNodes['Tarih'].Text;
end;

procedure TXMLTarih_DateType.Set_Tarih(Value: WideString);
begin
  SetAttribute('Tarih', Value);
end;

function TXMLTarih_DateType.Get_Date: WideString;
begin
  Result := AttributeNodes['Date'].Text;
end;

procedure TXMLTarih_DateType.Set_Date(Value: WideString);
begin
  SetAttribute('Date', Value);
end;

function TXMLTarih_DateType.Get_Bulten_No: WideString;
begin
  Result := AttributeNodes['Bulten_No'].Text;
end;

procedure TXMLTarih_DateType.Set_Bulten_No(Value: WideString);
begin
  SetAttribute('Bulten_No', Value);
end;

function TXMLTarih_DateType.Get_Currency(Index: Integer): IXMLCurrencyType;
begin
  Result := List[Index] as IXMLCurrencyType;
end;

function TXMLTarih_DateType.Add: IXMLCurrencyType;
begin
  Result := AddItem(-1) as IXMLCurrencyType;
end;

function TXMLTarih_DateType.Insert(const Index: Integer): IXMLCurrencyType;
begin
  Result := AddItem(Index) as IXMLCurrencyType;
end;

{ TXMLCurrencyType }

function TXMLCurrencyType.Get_CrossOrder: Integer;
begin
  Result := AttributeNodes['CrossOrder'].NodeValue;
end;

procedure TXMLCurrencyType.Set_CrossOrder(Value: Integer);
begin
  SetAttribute('CrossOrder', Value);
end;

function TXMLCurrencyType.Get_Kod: WideString;
begin
  Result := AttributeNodes['Kod'].Text;
end;

procedure TXMLCurrencyType.Set_Kod(Value: WideString);
begin
  SetAttribute('Kod', Value);
end;

function TXMLCurrencyType.Get_CurrencyCode: WideString;
begin
  Result := AttributeNodes['CurrencyCode'].Text;
end;

procedure TXMLCurrencyType.Set_CurrencyCode(Value: WideString);
begin
  SetAttribute('CurrencyCode', Value);
end;

function TXMLCurrencyType.Get_Unit_: Integer;
begin
  Result := ChildNodes['Unit'].NodeValue;
end;

procedure TXMLCurrencyType.Set_Unit_(Value: Integer);
begin
  ChildNodes['Unit'].NodeValue := Value;
end;

function TXMLCurrencyType.Get_Isim: WideString;
begin
  Result := ChildNodes['Isim'].Text;
end;

procedure TXMLCurrencyType.Set_Isim(Value: WideString);
begin
  ChildNodes['Isim'].NodeValue := Value;
end;

function TXMLCurrencyType.Get_CurrencyName: WideString;
begin
  Result := ChildNodes['CurrencyName'].Text;
end;

procedure TXMLCurrencyType.Set_CurrencyName(Value: WideString);
begin
  ChildNodes['CurrencyName'].NodeValue := Value;
end;

function TXMLCurrencyType.Get_ForexBuying: WideString;
begin
  Result := ChildNodes['ForexBuying'].Text;
end;

procedure TXMLCurrencyType.Set_ForexBuying(Value: WideString);
begin
  ChildNodes['ForexBuying'].NodeValue := Value;
end;

function TXMLCurrencyType.Get_ForexSelling: WideString;
begin
  Result := ChildNodes['ForexSelling'].Text;
end;

procedure TXMLCurrencyType.Set_ForexSelling(Value: WideString);
begin
  ChildNodes['ForexSelling'].NodeValue := Value;
end;

function TXMLCurrencyType.Get_BanknoteBuying: WideString;
begin
  Result := ChildNodes['BanknoteBuying'].Text;
end;

procedure TXMLCurrencyType.Set_BanknoteBuying(Value: WideString);
begin
  ChildNodes['BanknoteBuying'].NodeValue := Value;
end;

function TXMLCurrencyType.Get_BanknoteSelling: WideString;
begin
  Result := ChildNodes['BanknoteSelling'].Text;
end;

procedure TXMLCurrencyType.Set_BanknoteSelling(Value: WideString);
begin
  ChildNodes['BanknoteSelling'].NodeValue := Value;
end;

function TXMLCurrencyType.Get_CrossRateUSD: Integer;
begin
  Result := ChildNodes['CrossRateUSD'].NodeValue;
end;

procedure TXMLCurrencyType.Set_CrossRateUSD(Value: Integer);
begin
  ChildNodes['CrossRateUSD'].NodeValue := Value;
end;

function TXMLCurrencyType.Get_CrossRateOther: WideString;
begin
  Result := ChildNodes['CrossRateOther'].Text;
end;

procedure TXMLCurrencyType.Set_CrossRateOther(Value: WideString);
begin
  ChildNodes['CrossRateOther'].NodeValue := Value;
end;

end. 