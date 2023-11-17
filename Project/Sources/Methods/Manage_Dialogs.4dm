//%attributes = {}
SET MENU BAR:C67(1)

ALL RECORDS:C47([Dialogs:7])
//v12
FORM SET INPUT:C55([Dialogs:7]; "CheckIn")
FORM SET OUTPUT:C54([Dialogs:7]; "Output")
$windowNumber:=Open form window:C675([Dialogs:7]; "CheckIn"; Plain form window:K39:10; On the left:K39:2; At the top:K39:5)
<>dialogOutputWindow:=$windowNumber

SET WINDOW TITLE:C213(WindowTitle)

MODIFY SELECTION:C204([Dialogs:7]; *)

//Dialogs process will remain open
If ($windowNumber>0)
	CLOSE WINDOW:C154($windowNumber)
End if 