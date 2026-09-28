unit fventana;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,uvector;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    POS: TEdit;
    ELE: TEdit;
    Label1: TLabel;
    SG: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
  private
    V:TVector;
    procedure updateSG();
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
begin
  V:=TVector.crear(); //inicializar instancia
  showMessage('VECTOR INICIALIZADO');
  updateSG();
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  V.setDim(StrToInt(pos.Text));
  updatesg();
  pos.Text:='';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  pos.Text:=IntToStr(V.getDim());
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  V.setElem(StrToInt(pos.Text),StrToInt(ele.Text));
  updateSG();
  pos.Text:='';
  ele.Text:='';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ele.Text:=IntToStr(V.getElem(StrToInt(pos.Text)));
  pos.Text:='';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  V.cargar(StrToInt(ele.Text));
  updateSG();
  ele.Text:='';
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  ele.Text:=(V.mostrar());
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  V.adicionar(StrToInt(ele.Text));
  updateSG();
  ele.Text:='';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  V.insertar(StrToInt(ele.Text),StrToInt(pos.Text));
  updateSG();
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  ele.Text:=V.obtener(StrToInt(pos.Text));
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  ShowMessage('El vector tiene : '+IntToStr(V.cantidad())+' elementos');
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  V.invertir();
  updateSG();
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  V.rotar();
  updateSG();
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  if(V.busqsecuencial(StrToInt(ele.Text))=0)then
    showMessage('El elemento '+ele.Text+' no se encuentra en el Vector')
  else
    showMessage('El elemento '+ele.Text+' se ecuentra en la Posicion : '+IntToStr(V.busqsecuencial(StrToInt(ele.Text))));
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  if(V.busqbinaria(StrToInt(ele.Text))=0)then
     showMessage('El elemento '+ele.Text+' no se encuentra en el Vector')
   else
     showMessage('El elemento '+ele.Text+' se ecuentra en la Posicion : '+IntToStr(V.busqbinaria(StrToInt(ele.Text))));
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  V.ordinsercion();
  updatesg();
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  V.ordseleccion();
  updateSG();
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  V.ordintercambio();
  updateSG();
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  V.ordburbuja();
  updateSG();
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  V.ordquicksort();
  updateSG();
end;


procedure TForm1.Button21Click(Sender: TObject);
begin
  V.eliminarrep();
  updateSG();
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  V.ordfrec();
  updateSG();
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
  showMessage(V.comostring());
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
  close();
end;

procedure TForm1.updateSG();
var
  i:integer;
begin
  SG.ColCount:=V.getDim();
  for i:=1 to V.getDim() do
      SG.Cells[i-1,0]:=IntToStr(V.getElem(i));
end;

end.
