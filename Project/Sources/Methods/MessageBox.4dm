//%attributes = {}
C_TEXT:C284(vTitle; vMessage; vTextColor)

vTitle:=$1
vMessage:=$2
vTextColor:=$4


//BEEP
Open Centered window(370; 150; Movable dialog box:K34:7; $1)  // Open a modal window 

Case of 
	: ($3="YesNoBox")
		DIALOG:C40([Dialogs:7]; "Message_YesNo")  // Display a custom search dialog 
	: ($3="OKBox")
		DIALOG:C40([Dialogs:7]; "Message_OK")  // Display a custom search dialog 
End case 
CLOSE WINDOW:C154