
Open Centered window(600; 365; Movable dialog box:K34:7; " ")
DIALOG:C40([Point of Sale:5]; "POS_Payment")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal windowOpen Centered window (620;570;Movable dialog box ;" ")

If (ok=1)
	
	POS_ReportVars
	vPOSPrint:=1
	vPOSLaunchCC:=1
	POS_SaveCode
	
	If (vSave=1)  //If batch contains sales items
		ACCEPT:C269
		FLUSH CACHE:C297
		
	Else 
		CANCEL:C270
	End if 
	
End if 
