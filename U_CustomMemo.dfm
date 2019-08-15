object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 348
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 120
  TextHeight = 16
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 629
    Height = 348
    Align = alClient
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Times New Roman'
    Font.Style = []
    Lines.Strings = (
      #1041#1083#1086#1082' 1'
      #1055#1086#1083#1077' 1:'
      #1055#1086#1083#1077' 2:'
      #1054#1073#1097#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103':'
      #1041#1083#1086#1082' 2'
      #1056#1077#1079#1091#1083#1100#1090#1072#1090':')
    ParentFont = False
    TabOrder = 0
    OnKeyDown = Memo1KeyDown
    OnKeyPress = Memo1KeyPress
    OnMouseDown = Memo1MouseDown
    OnMouseUp = Memo1MouseUp
    ExplicitLeft = 72
    ExplicitTop = 8
    ExplicitWidth = 321
  end
end
