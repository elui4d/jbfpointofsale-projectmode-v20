//%attributes = {}
SET MENU BAR:C67(1)

ALL RECORDS:C47([Sales:2])
ORDER BY:C49([Sales:2]; [Sales:2]Entered Date Stamp:7; >; [Sales:2]Entered Time Stamp:8; >)

FORM SET INPUT:C55([Sales:2]; "Input")
FORM SET OUTPUT:C54([Sales:2]; "Output")

//$windowNumber:=Open form window([Sales];"Input";Standard form window ;Horizontally Centered ;Vertically Centered )
$windowNumber:=Open form window:C675([Sales:2]; "Input"; Plain form window:K39:10; On the left:K39:2; At the top:K39:5)
MAXIMIZE WINDOW:C453
SET WINDOW TITLE:C213(WindowTitle)

MODIFY SELECTION:C204([Sales:2]; *)

CLOSE WINDOW:C154($windowNumber)