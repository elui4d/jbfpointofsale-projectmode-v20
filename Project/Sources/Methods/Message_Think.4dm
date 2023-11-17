//%attributes = {}
C_TEXT:C284($1)

gMsg:=$1  //Load the passed message to the display variable
Open Centered window(375; 135; Movable dialog box:K34:7; "")  //Plain window
ALL RECORDS:C47([Dialogs:7])

FORM SET INPUT:C55([Dialogs:7]; "Message_Think")

gMsg:=$1
DISPLAY RECORD:C105([Dialogs:7])





