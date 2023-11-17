//%attributes = {}
SET MENU BAR:C67(1)

ALL RECORDS:C47([Inventory:4])
ORDER BY:C49([Inventory:4]Barcode Item Number:1)

FORM SET INPUT:C55([Inventory:4]; "Input")
FORM SET OUTPUT:C54([Inventory:4]; "Output")

$windowNumber:=Open form window:C675([Inventory:4]; "Input"; Plain form window:K39:10; On the left:K39:2; At the top:K39:5)
MAXIMIZE WINDOW:C453
SET WINDOW TITLE:C213(WindowTitle)

MODIFY SELECTION:C204([Inventory:4]; *)

CLOSE WINDOW:C154($windowNumber)