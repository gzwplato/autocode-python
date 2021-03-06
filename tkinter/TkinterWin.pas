unit TkinterWin;

interface

uses
     //
     JsonDataObjects,

     //
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,ComObj,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, ImgList, ToolWin, System.ImageList, Vcl.Buttons, SynEdit,
  Vcl.Samples.Spin, dxGDIPlusClasses;

type
  TForm_TkinterEditor = class(TForm)
    ToolBar1: TToolBar;
    ToolButton_Label: TToolButton;
    ToolButton_Button: TToolButton;
    ToolButton_Checkbutton: TToolButton;
    ToolButton_Radiobutton: TToolButton;
    ToolButton_Entry: TToolButton;
    ToolButton_Listbox: TToolButton;
    ToolButton_Scale: TToolButton;
    Panel_Left: TPanel;
    Splitter1: TSplitter;
    Panel_Client: TPanel;
    Panel_Form: TPanel;
    Panel_FormTitle: TPanel;
    Panel_FormClient: TPanel;
    Image_FormIcon: TImage;
    Label_Caption: TLabel;
    SpeedButton_FormClose: TSpeedButton;
    SpeedButton_Min: TSpeedButton;
    SpeedButton_Max: TSpeedButton;
    ToolButton_Text: TToolButton;
    ToolButton1: TToolButton;
    ToolButton_Generate: TToolButton;
    ToolButton_Delete: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    ImageList: TImageList;
    ToolButton_Cancel: TToolButton;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    procedure ControlMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure ControlMouseMove(Sender: TObject; Shift: TShiftState; X,  Y: Integer);
    //
    procedure Label_CaptionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Label_CaptionMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure ToolButton_DeleteClick(Sender: TObject);
    procedure ToolButton_CancelClick(Sender: TObject);
  private
    { Private declarations }
  public
     PythonCode : string;
     gjoTkinter : TJsonObject;
     procedure ShowComponentInfo(ACtrl:TControl);
     procedure SelectComponent(APanel:TPanel);

  end;

var
     Form_TkinterEditor  : TForm_TkinterEditor;

implementation

{$R *.dfm}

procedure TForm_TkinterEditor.ControlMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
     oControl  : TControl;
     iTag      : Integer;
begin
     ReleaseCapture;
     oControl  := TControl(Sender);
     //
     iTag := oControl.Tag;
     while iTag > 0 do begin
          oControl  := oControl.Parent;
          Dec(iTag);
     end;
     //
     ShowComponentInfo(oControl);
     //
     if (x>=0)and(x<=3) then begin
          if (y>=0)and(y<=3) then oControl.Perform(WM_SysCommand,$F004,0);
          if (y>3)and(y<oControl.Height-3) then oControl.Perform(WM_SysCommand,$F001,0);
          if (y>=oControl.Height-3)and(y<=oControl.Height) then oControl.Perform(WM_SysCommand,$F007,0);
     end else if (x>3)and(x<oControl.Width-3) then begin
          if (y>=0)and(y<=3) then oControl.Perform(WM_SysCommand,$F003,0);
          if (y>3)and(y<oControl.Height-3) then oControl.Perform(WM_SysCommand,$F012,0);
          if (y>=oControl.Height-3)and(y<=oControl.Width) then oControl.Perform(WM_SysCommand,$F006,0);
     end else if (x>=oControl.Width-3)and(x<=oControl.Width) then begin
          if (y>=0)and(y<=3) then oControl.Perform(WM_SysCommand,$F005,0);
          if (y>3)and(y<oControl.Height-3) then oControl.Perform(WM_SysCommand,$F002,0);
          if (y>=oControl.Height-3)and(y<=oControl.Width) then oControl.Perform(WM_SysCommand,$F008,0);
     end;

     //TPanel(oControl).BevelOuter     := bvSpace;
end;

procedure TForm_TkinterEditor.ControlMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
     oControl  : TControl;
     iTag      : Integer;
begin
     oControl  := TControl(Sender);
     //
     iTag := oControl.Tag;
     while iTag > 0 do begin
          oControl  := oControl.Parent;
          Dec(iTag);
     end;
     //
     if (x>=0)and(x<=3) then begin
          if (y>=0)and(y<=3) then oControl.Cursor:=crSizeNWSE;
          if (y>3)and(y<oControl.Height-3) then oControl.Cursor:=crSizeWE;
          if (y>=oControl.Height-3)and(y<=oControl.Height) then oControl.Cursor:=crSizeNESW;
     end else if (x>3)and(x<oControl.Width-3) then begin
          if (y>=0)and(y<=3) then oControl.Cursor:=crSizeNS;
          if (y>3)and(y<oControl.Height-3) then oControl.Cursor:=crArrow;
          if (y>=oControl.Height-3)and(y<=oControl.Width) then oControl.Cursor:=crSizeNS;
     end else if (x>=oControl.Width-3)and(x<=oControl.Width) then begin
          if (y>=0)and(y<=3) then oControl.Cursor:=crSizeNESW;
          if (y>3)and(y<oControl.Height-3) then oControl.Cursor:=crSizeWE;
          if (y>=oControl.Height-3)and(y<=oControl.Width) then oControl.Cursor:=crSizeNWSE;
     end;
end;

procedure TForm_TkinterEditor.Label_CaptionMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
     oControl  : TControl;
     oPanel         : TPanel;
begin
     ReleaseCapture;
     oControl  := TControl(Sender);
     if (x>0)and(x<oControl.Width-1) then begin
          if (y>0)and(y<oControl.Height-1) then oControl.Parent.Parent.Perform(WM_SysCommand,$F012,0);
     end;
     //
     oPanel    := Panel_Form;
     //

end;

procedure TForm_TkinterEditor.Label_CaptionMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
     oControl  : TControl;
begin
     oControl  := TControl(Sender);
     if (x>3)and(x<oControl.Width-3) then begin
          if (y>3)and(y<oControl.Height-3) then oControl.Parent.Parent.Cursor:=crArrow;
     end;
end;

procedure TForm_TkinterEditor.FormShow(Sender: TObject);
var
     iTab      : Integer;
begin


     //Ĭ��ѡ����
     Label_Caption.OnMouseDown(Label_Caption,mbLeft, [], 10, 10);
end;

procedure TForm_TkinterEditor.SelectComponent(APanel: TPanel);
var
     iCtrl     : Integer;
     oPanel    : TPanel;
begin
     //Exit;
     //
     for iCtrl := 0 to Panel_FormClient.ControlCount-1 do begin
          oPanel    := TPanel(Panel_FormClient.Controls[iCtrl]);
          if oPanel <> APanel then begin
               oPanel.Color        := clBtnFace;
          end;
     end;
     APanel.Color   := clMedGray;
end;

procedure TForm_TkinterEditor.ShowComponentInfo(ACtrl: TControl);
var
     oPanel         : TPanel;
     //
     oLabel         : TPanel;
     oCheckbutton   : TCheckBox;
     oRadiobutton   : TRadioButton;
     oButton        : TButton;
     oEntry         : TEdit;
     oListBox       : TListBox;
     oText          : TMemo;
     oScale         : TProgressBar;
begin
     //
     if ACtrl = nil then begin
          Exit;
     end;

     //
     if ACtrl.Tag = - 1 then begin
          oPanel    := TPanel(ACtrl);
     end else begin
          oPanel    := TPanel(ACtrl.Parent);
     end;
     //
     if oPanel = Panel_Client then Exit;

     //
     SelectComponent(oPanel);

end;

procedure TForm_TkinterEditor.ToolButton_CancelClick(Sender: TObject);
begin
     ModalResult    := mrCancel;
end;

procedure TForm_TkinterEditor.ToolButton_DeleteClick(Sender: TObject);
var
     iCtrl     : Integer;
     oPanel    : TPanel;
begin
     oPanel := nil;
     for iCtrl := 0 to Panel_FormClient.ControlCount-1 do begin
          if TPanel(Panel_FormClient.Controls[iCtrl]).Color <> clBtnFace then begin
               oPanel    := TPanel(Panel_FormClient.Controls[iCtrl]);
               Break;
          end;
     end;

     //
     if oPanel = nil then begin
          Exit;
     end;

     //
     if MessageDlg('Are you sure delete the component ?',mtConfirmation,[mbOK,mbCancel],0)= mrOk then begin
          oPanel.Destroy;
          //select form_window as default
          Label_Caption.OnMouseDown(Label_Caption,mbLeft, [], 10, 10);
     end;

end;

end.
