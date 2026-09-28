unit uvector;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Dialogs;
const
  MAX_ELEM=120;
type

    { TVector }

    TVector=class
  private
    elem:array[1..MAX_ELEM]of integer;
    dim:integer;
    procedure quicksortRec(izq,der:integer);
  public
    constructor crear();
    procedure setDim(dime:integer);
    function getDim():integer;
    procedure setElem(pos,ele:integer);
    function getElem(pos:integer):integer;
    procedure cargar(n:integer);
    function mostrar():string;
    procedure adicionar(ele:integer);
    procedure insertar(ele,pos:integer);
    function obtener(pos:integer):string;
    function cantidad():integer;
    procedure invertir();
    procedure rotar();
    function busqsecuencial(ele:integer):integer;
    function busqbinaria(ele:integer):integer;
    procedure ordinsercion();
    procedure ordseleccion();
    procedure ordintercambio();
    procedure ordburbuja();
    procedure ordquicksort();
    procedure eliminarrep();
    procedure ordfrec();
    function comostring():string;
end;
implementation

{ TVector }

procedure TVector.quicksortRec(izq, der: integer);
var
  i,j,pivote,aux:integer;
begin
  pivote:=elem[(izq + der)div 2];
  i:=izq;
  j:=der;

  while(i<=j)do
  begin
    while(elem[i]<pivote)do
      i:=i+1;
    while(elem[j]>pivote)do
      j:=j-1;
    if(i<=j)then
    begin
      aux:=elem[i];
      elem[i]:=elem[j];
      elem[j]:=aux;
      i:=i+1;
      j:=j-1;
    end;
  end;
  if (izq<j)then
    quicksortRec(izq,j);
  if (i<der)then
    quicksortRec(i,der);
end;

constructor TVector.crear();
  var
  pos:integer;
begin
  dim:=0;
  for pos:=1 to MAX_ELEM do
     elem[pos]:=0;
end;

procedure TVector.setDim(dime: integer);
begin
  if(dime>=0) AND (dime<=MAX_ELEM)then
     dim:=dime
  else
    showMessage('TVector::setDim: Fuera de Rango...');
end;

function TVector.getDim(): integer;
begin
  result:=dim;
end;

procedure TVector.setElem(pos, ele: integer);
begin
  if(pos>=1)AND(pos<=dim)then
    elem[pos]:=ele
  else
    showMessage('TVector::setElem: Fuera de Rango...');
end;

function TVector.getElem(pos: integer): integer;
begin
  if(pos>=1)AND(pos<=dim)then
    result:=elem[pos]
  else
    result:=-999;
end;

procedure TVector.cargar(n: integer);
var
  pos:integer;
begin
  if(n>=1)AND(n<=MAX_ELEM)then
    begin
    dim:=n;
    for pos:=1 to dim do
       begin
         elem[pos]:=StrToInt(InputBox('Vector','Ingrese un número','0'));
       end;
    end;
end;

function TVector.mostrar: string;
var
  pos:integer;
  s:string;
begin
  s:='[';
  for pos:=1 to dim do
  begin
     s:=s+IntToStr(elem[pos]);
  if pos<dim then
    s:=s+', ';
  end;
  s:=s+']';
  result:=s;
end;

procedure TVector.adicionar(ele: integer);
begin
  if(dim<MAX_ELEM)then
  begin
    dim:=dim+1;      // Se incrementa el tamaño del vector
    elem[dim]:=ele;    // Se guarda en la nueva última posición
  end
  else
    ShowMessage('Almacenamiento lleno…');
end;

procedure TVector.insertar(ele, pos: integer);
var
  i:integer;
begin
  if(dim<MAX_ELEM)then
  begin
    if(pos>=1)and(pos<=dim)then
    begin
      for i:=dim downto pos do
        elem[i+1]:=elem[i];
      elem[pos]:=ele;
      dim:=dim+1;
    end
    else
      ShowMessage('TVector::insertar: Posición Fuera de Rango...');
  end
  else
    ShowMessage('TVector::insertar: Almacenamiento lleno...');
end;

function TVector.obtener(pos: integer): string;
begin
  if (pos>=1)and(pos<=dim)then
  begin
    result:=IntToStr(elem[pos]);
  end
  else
  begin
    showmessage('TVector::obtener: Posicion Fuera de Rango...');
    result:='';
  end;
end;

function TVector.cantidad(): integer;
begin
  result:=dim;
end;

procedure TVector.invertir();
var
  izq,der,aux:integer;
begin
  if(dim<MAX_ELEM)then
  begin
    izq:=1; der:=dim;
    while(izq<der)do
    begin
      aux:=elem[izq];
      elem[izq]:=elem[der];
      elem[der]:=aux;
      izq:=izq+1; der:=der-1;
    end;
  end
  else
    showmessage('TVector::invertir: Posicion Fuera de Rango');
end;

procedure TVector.rotar();
var
  aux,pos:integer;
begin
  if(dim>1)then
  begin
    pos:=dim;
    aux:=elem[dim];
    while(pos>1)do
    begin
      elem[pos]:=elem[pos-1];
      pos:=pos-1;
    end;
    elem[1]:=aux;
  end;
end;

function TVector.busqsecuencial(ele: integer): integer;
var
  pos:integer;
begin
  pos:=1;
  while(pos<=dim)and(elem[pos]<>ele)do
    pos:=pos+1;
  if(pos<=dim)then
    result:=pos
  else
    result:=0;
end;

function TVector.busqbinaria(ele: integer): integer;
var
  izq,der,med:integer;
begin
  izq:=1; der:=dim;
  while(izq<=der)do
  begin
    med:=(izq+der)Div 2;
    if(elem[med]=ele)then
    begin
      result:=med;
      exit;
    end
    else
      if(elem[med]>ele)then
        der:=med-1
      else
        izq:=med+1;
  end;
  result:=0;
end;

procedure TVector.ordinsercion();
var
  i,j,aux:integer;
begin
  for i:=2 to dim do
  begin
    aux:=elem[i];
    j:=i-1;
    while(j>0)and(elem[j]>aux)do
    begin
      elem[j+1]:=elem[j];
      j:=j-1;
    end;
    elem[j+1]:=aux;
  end;
end;

procedure TVector.ordseleccion();
var
  i,j,posMenor,aux:integer;
begin
  for i:=1 to (dim-1)do
  begin
    posMenor:=i;
    for j:=(i+1)to dim do
    begin
      if(elem[j]<elem[posMenor])then
        posMenor:=j;
    end;
    if(posMenor <> i)then
    begin
      aux:=elem[i];
      elem[i]:=elem[posMenor];
      elem[posMenor]:=aux;
    end;
  end;
end;

procedure TVector.ordintercambio();
var
  p,d,aux:integer;
begin
  for p:=1 to dim-1 do
  begin
    for d:=p+1 to dim do
    begin
      if(elem[d]<elem[p])then
      begin
        aux:=elem[d];
        elem[d]:=elem[p];
        elem[p]:=aux;
      end;
    end;
  end;
end;

procedure TVector.ordburbuja();
var
  p,d,aux:integer;
begin
  p:=dim;
  for p:=dim downto 2 do
  begin
    for d:=1 to p-1 do
    begin
      if elem[d]>elem[d+1] then
      begin
        aux:=elem[d+1];
        elem[d+1]:=elem[d];
        elem[d]:=aux;
      end;
    end;
  end;
end;

procedure TVector.ordquicksort();
begin
  if (dim>1)then
    quicksortRec(1,dim);
end;

procedure TVector.eliminarrep();
var
  i,j,k:integer;
begin
  i:=1;
  while(i<dim)do
  begin
    j:=i+1;
    while(j<=dim)do
    begin
      if(elem[i]=elem[j])then
      begin
        k:=j;
        while(k<dim)do
        begin
          elem[k]:=elem[k+1];
          k:=k+1;
        end;
        dim:=dim-1;
      end
      else
      begin
        j:=j+1;
      end;
    end;
    i:=i+1;
  end;
end;

procedure TVector.ordfrec();
var
  frec:array[1..MAX_ELEM]of integer;
  i,j,c,auxElem,auxFrec:integer;
begin
  for i:=1 to dim do
  begin
    c:=0;
    for j:=1 to dim do
    begin
      if elem[j]=elem[i]then
        c:=c+1;
    end;
    frec[i]:=c;
  end;
  for i:=1 to dim - 1 do
  begin
    for j:=i+1 to dim do
    begin
      if(frec[j]>frec[i])or((frec[j] = frec[i]) and (elem[j] < elem[i])) then
      begin
        auxElem:=elem[i];
        elem[i]:=elem[j];
        elem[j]:=auxElem;
        auxFrec:=frec[i];
        frec[i]:=frec[j];
        frec[j]:=auxFrec;
      end;
    end;
  end;
end;

function TVector.comoString(): string;
var
  pos:integer; s:string;
begin
  pos:=1;
  s:='[ ';
  while(pos<=dim)do
  begin
    s:=s+IntToStr(elem[pos])+', ';
    pos:=pos+1;
  end;
  s:=s+']';
  Delete(s,(length(s)-2),1) ;
  result:=s;
end;

end.

