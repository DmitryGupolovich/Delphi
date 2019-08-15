unit U_CustomMemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure Memo1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Memo1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    point: TPoint;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//ShowMessage('Позиция курсора в строке '+IntToStr(Memo1.CaretPos.X)); // позиция курсора в строке;
//ShowMessage('Номер строки, где находится курсор '+IntToStr(Memo1.CaretPos.Y)); // номер строки где находится курсор;

//// запретить Ctrl+A
//if ((ssCtrl in Shift) AND (Key = ord('A')))  then
// begin
//  Key := 0;
// end;

// запрет удаления всех символов через выделение shift
  if (Length(Memo1.Text) = Memo1.SelText.Length) then
    begin
     key := 0;
     Memo1.SelStart := 16;
     Memo1.SelLength := 0;
    end;

if (Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Блок 1')) and (Memo1.CaretPos.X<=6) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('Блок 1')-Memo1.CaretPos.X;
    end;

if (Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Блок 2')) and (Memo1.CaretPos.X<=6) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('Блок 2')-Memo1.CaretPos.X;
    end;

if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Поле 1:') and (Memo1.CaretPos.X<=7) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('Поле 1:')-Memo1.CaretPos.X;
    end;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Поле 2:') and (Memo1.CaretPos.X<=7) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('Поле 2:')-Memo1.CaretPos.X;
    end;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Общая информация:') and (Memo1.CaretPos.X<=17) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('Общая информация:')-Memo1.CaretPos.X;
    end;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Результат:') and (Memo1.CaretPos.X<=10) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('Результат:')-Memo1.CaretPos.X;
    end;
        Memo1.SelLength := 0;
end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
// запрет изменения "Блок 1"
if Memo1.CaretPos.Y = 0 then key := #0;

// запрет изменения "Блок 2"
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Блок 2') and (Memo1.Lines[Memo1.CaretPos.Y].Length=6) then
   key := #0;

if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Поле 1:') and (Memo1.Lines[Memo1.CaretPos.Y].Length=7) and (Key = #8) then
   key := #0;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Поле 2:') and (Memo1.Lines[Memo1.CaretPos.Y].Length=7) and (Key = #8) then
   key := #0;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Общая информация:') and (Memo1.Lines[Memo1.CaretPos.Y].Length=17) and (Key = #8) then
   key := #0;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Результат:') and (Memo1.Lines[Memo1.CaretPos.Y].Length=10) and (Key = #8) then
   key := #0;

end;

procedure TForm1.Memo1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//ShowMessage('Номер строки, где находится курсор '+IntToStr(Memo1.CaretPos.Y));
end;

procedure TForm1.Memo1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Memo1.SelLength > 0 then
    Memo1.SelLength := 0;
end;

end.
