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
  private
    { Private declarations }
    const Block2 = 'Блок 2';
    const Field1 = 'Поле 1';
    const Field2 = 'Поле 2';
    const CommonInformation = 'Общая информация:';
    const Result = 'Результат:';

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  procedure CheckPosition(str:String; needPosition:Integer);
  begin
    if Memo1.Lines[Memo1.CaretPos.Y].StartsWith(str) and
      ( (Memo1.CaretPos.X<=needPosition) or (Memo1.CaretPos.X=Memo1.Lines[Memo1.CaretPos.Y].Length)  )
    then
         key := 0;

  end;

begin
//ShowMessage('Позиция курсора в строке '+IntToStr(Memo1.CaretPos.X)); // позиция курсора в строке;
//ShowMessage('Номер строки, где находится курсор '+IntToStr(Memo1.CaretPos.Y)); // номер строки где находится курсор;

if not (key in [VK_LEFT,VK_RIGHT,VK_UP,VK_DOWN]) then
 begin
  if (Length(Memo1.Text) = Memo1.SelText.Length) then
    begin
     key := 0;
     Memo1.SelStart := 16;
     Memo1.SelLength := 0;
    end;
  if (Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Блок 1')) and  (Memo1.CaretPos.X<=6) then
       key := 0;
  if (Memo1.Lines[Memo1.CaretPos.Y].StartsWith('Блок 2')) and (Memo1.CaretPos.X<=6) then
       key := 0;

    CheckPosition(Field1,7);
    CheckPosition(Field2,7);
    CheckPosition(CommonInformation,17);
    CheckPosition(Result,10);


 Memo1.SelLength := 0;
 end;
end;


procedure TForm1.Memo1KeyPress(Sender: TObject; var Key: Char);

// Y (Номер строки, где находится курсор) X (Позиция, где находится курсор)
  procedure CheckPosition(str: string;needPosition:Integer);
  begin
      if Memo1.Lines[Memo1.CaretPos.Y].StartsWith(str) then
       begin
    //   ShowMessage('Курсор позиция '+IntTostr(cursorPosition)+' Длина строки '+IntTostr(Memo1.Lines[rowNumber].Length));
          if (Memo1.CaretPos.X<=needPosition) then
            key := #0
       end;
  end;

    begin

      if (Key<>#37) and (Key<>#38) and (Key<>#39) and (key<>#40) then
       begin
        // запрет изменения "Блок 1"
        if Memo1.CaretPos.Y = 0 then key := #0;
        // запрет изменения "Блок 2"
        if Memo1.Lines[Memo1.CaretPos.Y].StartsWith(Block2) and (Memo1.Lines[Memo1.CaretPos.Y].Length=6) then
           key := #0;
          if (Key=#8) then
          begin
            CheckPosition(Field1,7);
            CheckPosition(Field2,7);
            CheckPosition(CommonInformation,17);
            CheckPosition(Result,10);

          end;
       end;

    end;

procedure TForm1.Memo1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Memo1.SelLength > 0 then
    Memo1.SelLength := 0;
end;

end.
