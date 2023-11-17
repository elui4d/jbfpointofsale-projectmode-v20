ACCEPT:C269

Tools_VoidCreditCard


If (vTransID#"") & (vStatusCode="1")
	//CCTransactionRequest 
	ccTransactionRequestVoid
	
	QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
	If (Records in selection:C76([Preferences:3])>0)
		vReceiptCopies:=[Preferences:3]ReceiptCopies:9
		vPrintDialog:=[Preferences:3]PrintDialog:10
	End if 
	UNLOAD RECORD:C212([Preferences:3])
	
	For ($k; 1; vReceiptCopies)
		
		//Print_TransaxReceipt 
		Print_TransaxReceiptVoid
		
		
	End for 
	
End if 




