//%attributes = {}
SET MENU BAR:C67(1)

ALL RECORDS:C47([Preferences:3])


FORM SET INPUT:C55([Preferences:3]; "Input")
FORM SET OUTPUT:C54([Preferences:3]; "Output")

$windowNumber:=Open form window:C675([Preferences:3]; "Input"; Plain form window:K39:10; On the left:K39:2; At the top:K39:5)
SET WINDOW TITLE:C213(WindowTitle)

MODIFY SELECTION:C204([Preferences:3]; *)

CLOSE WINDOW:C154($windowNumber)