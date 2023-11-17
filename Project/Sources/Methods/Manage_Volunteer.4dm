//%attributes = {}
SET MENU BAR:C67(1)

ALL RECORDS:C47([Volunteers:9])
ORDER BY:C49([Volunteers:9]Consignor Number:1)

FORM SET INPUT:C55([Volunteers:9]; "Input")
FORM SET OUTPUT:C54([Volunteers:9]; "Output")

$windowNumber:=Open form window:C675([Volunteers:9]; "Input"; Plain form window:K39:10; On the left:K39:2; At the top:K39:5)
MAXIMIZE WINDOW:C453
SET WINDOW TITLE:C213(WindowTitle)

MODIFY SELECTION:C204([Volunteers:9]; *)

CLOSE WINDOW:C154($windowNumber)