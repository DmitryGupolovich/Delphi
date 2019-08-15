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
//ShowMessage('������� ������� � ������ '+IntToStr(Memo1.CaretPos.X)); // ������� ������� � ������;
//ShowMessage('����� ������, ��� ��������� ������ '+IntToStr(Memo1.CaretPos.Y)); // ����� ������ ��� ��������� ������;

//// ��������� Ctrl+A
//if ((ssCtrl in Shift) AND (Key = ord('A')))  then
// begin
//  Key := 0;
// end;

// ������ �������� ���� �������� ����� ��������� shift
  if (Length(Memo1.Text) = Memo1.SelText.Length) then
    begin
     key := 0;
     Memo1.SelStart := 16;
     Memo1.SelLength := 0;
    end;

if (Memo1.Lines[Memo1.CaretPos.Y].StartsWith('���� 1')) and (Memo1.CaretPos.X<=6) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('���� 1')-Memo1.CaretPos.X;
    end;

if (Memo1.Lines[Memo1.CaretPos.Y].StartsWith('���� 2')) and (Memo1.CaretPos.X<=6) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('���� 2')-Memo1.CaretPos.X;
    end;

if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('���� 1:') and (Memo1.CaretPos.X<=7) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('���� 1:')-Memo1.CaretPos.X;
    end;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('���� 2:') and (Memo1.CaretPos.X<=7) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('���� 2:')-Memo1.CaretPos.X;
    end;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('����� ����������:') and (Memo1.CaretPos.X<=17) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('����� ����������:')-Memo1.CaretPos.X;
    end;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('���������:') and (Memo1.CaretPos.X<=10) then
    begin
       key := 0;
        Memo1.SelStart := Memo1.SelStart + Length('���������:')-Memo1.CaretPos.X;
    end;
        Memo1.SelLength := 0;
end;

procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
// ������ ��������� "���� 1"
if Memo1.CaretPos.Y = 0 then key := #0;

// ������ ��������� "���� 2"
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('���� 2') and (Memo1.Lines[Memo1.CaretPos.Y].Length=6) then
   key := #0;

if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('���� 1:') and (Memo1.Lines[Memo1.CaretPos.Y].Length=7) and (Key = #8) then
   key := #0;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('���� 2:') and (Memo1.Lines[Memo1.CaretPos.Y].Length=7) and (Key = #8) then
   key := #0;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('����� ����������:') and (Memo1.Lines[Memo1.CaretPos.Y].Length=17) and (Key = #8) then
   key := #0;
if Memo1.Lines[Memo1.CaretPos.Y].StartsWith('���������:') and (Memo1.Lines[Memo1.CaretPos.Y].Length=10) and (Key = #8) then
   key := #0;

end;

procedure TForm1.Memo1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//ShowMessage('����� ������, ��� ��������� ������ '+IntToStr(Memo1.CaretPos.Y));
end;

procedure TForm1.Memo1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Memo1.SelLength > 0 then
    Memo1.SelLength := 0;
end;

end.
