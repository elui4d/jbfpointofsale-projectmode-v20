//%attributes = {}
// Method: WindowTitle

C_TEXT:C284($0; $prefix; $windowTitle; $pName)

C_LONGINT:C283($pState; $pTime)

PROCESS PROPERTIES:C336(Current process:C322; $pName; $pState; $pTime)

$windowTitle:=<>Version+"  -  "+<>vDataBaseName+"  -  User:"+<>User+"  -  Computer:"+<>Computer+"  -  Discount:"+String:C10(<>Discount)

$0:=$windowTitle