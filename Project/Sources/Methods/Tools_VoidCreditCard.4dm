//%attributes = {}
vTransaxCCAmount:=""
vCCSwipe:=""
vResult:=""
vTransID:=""
vStatusCode:=""




QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
If (Records in selection:C76([Preferences:3])>0)
	vePNJPOS_Clerk:=[Preferences:3]ePNJPOS_Clerk:22
	vePNJPOS_Password:=[Preferences:3]ePNJPOS_Password:23
	vePNJPOS_Path:=[Preferences:3]ePNJPOS_Path:21
	vTransaxAccountNumber:=[Preferences:3]Transax_AccountNumber:32
	
End if 
UNLOAD RECORD:C212([Preferences:3])

Open Centered window(470; 350; Movable dialog box:K34:7; " ")
//DIALOG([Point of Sale];"CreditCard")
vCCTransactionID:=""
DIALOG:C40([Point of Sale:5]; "CreditCardVoid")  // Display a custom search dialog 

CLOSE WINDOW:C154  // No longer need the modal window 
