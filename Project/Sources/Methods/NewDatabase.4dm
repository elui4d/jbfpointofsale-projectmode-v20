//%attributes = {}

vTempFileName:=""

Open Centered window(330; 100; Movable dialog box:K34:7; "Create New Database")  // Open a modal window 

DIALOG:C40([Dialogs:7]; "NewDatabase")

$element:=vDBPath+vTempFileName+".4dd"

If (ok=1) & (vTempFileName#"")
	CREATE DATA FILE:C313($element)
End if 
