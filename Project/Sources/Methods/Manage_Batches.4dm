//%attributes = {}
SET MENU BAR:C67(1)

ALL RECORDS:C47([Point of Sale:5])
ORDER BY:C49([Point of Sale:5]Batch ID:1)

FORM SET INPUT:C55([Point of Sale:5]; "Input")
FORM SET OUTPUT:C54([Point of Sale:5]; "Output")

$windowNumber:=Open form window:C675([Point of Sale:5]; "Input"; Plain form window:K39:10; On the left:K39:2; At the top:K39:5)
MAXIMIZE WINDOW:C453
SET WINDOW TITLE:C213(WindowTitle)

MODIFY SELECTION:C204([Point of Sale:5]; *)

CLOSE WINDOW:C154($windowNumber)