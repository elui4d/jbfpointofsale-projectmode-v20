//%attributes = {}


vTransaxCCAmount:=String:C10(vCCAmount)
vCCSwipe:=""
vResult:=""
vTransID:=""
vStatusCode:=""


//If (Variable3>0)
//vTransaxCCAmount:=String(Variable3)
//
//End if 
//
//If (Variable4>0)
//vTransaxCCAmount:=String(Variable4)
//
//End if 
//
//If (Variable5>0)
//vTransaxCCAmount:=String(Variable5)
//
//End if 
//
//If (Variable6>0)
//vTransaxCCAmount:=String(Variable6)
//
//End if 

//Run Transax CC
If (vTransaxCCAmount#"")
	
	QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
	If (Records in selection:C76([Preferences:3])>0)
		vePNJPOS_Clerk:=[Preferences:3]ePNJPOS_Clerk:22
		vePNJPOS_Password:=[Preferences:3]ePNJPOS_Password:23
		vePNJPOS_Path:=[Preferences:3]ePNJPOS_Path:21
		vTransaxAccountNumber:=[Preferences:3]Transax_AccountNumber:32
		
	End if 
	UNLOAD RECORD:C212([Preferences:3])
	
	Open Centered window(470; 350; Movable dialog box:K34:7; " ")
	DIALOG:C40([Point of Sale:5]; "CreditCard")  // Display a custom search dialog 
	
	CLOSE WINDOW:C154  // No longer need the modal window 
End if 


