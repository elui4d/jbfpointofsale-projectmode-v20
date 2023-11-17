//%attributes = {}
SET MENU BAR:C67(1)

ALL RECORDS:C47([Consignors:1])
ORDER BY:C49([Consignors:1]Consignor Number:1; >)
//removed for UCN
//ORDER BY FORMULA([Consignors];([Consignors]Consignor Number);>)



FORM SET INPUT:C55([Consignors:1]; "Input")
FORM SET OUTPUT:C54([Consignors:1]; "Output")

$windowNumber:=Open form window:C675([Consignors:1]; "Input"; Plain form window:K39:10; On the left:K39:2; At the top:K39:5)
MAXIMIZE WINDOW:C453
SET WINDOW TITLE:C213(WindowTitle)

MODIFY SELECTION:C204([Consignors:1]; *)

CLOSE WINDOW:C154($windowNumber)
