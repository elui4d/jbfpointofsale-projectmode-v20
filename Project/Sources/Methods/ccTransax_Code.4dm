//%attributes = {}
Tools_ManualCreditCard
If ([Point of Sale:5]Batch ID:1="")
	QUERY:C277([Point of Sale:5]; [Point of Sale:5]Batch ID:1=vBID)
End if 



If (vTransID#"") & (vStatusCode="1")
	CCTransactionRequest
	[Point of Sale:5]CCTrans:30:=vTransID
	[Point of Sale:5]Shopper First Name:9:=vTRANSfirstname
	[Point of Sale:5]Shopper Last Name:10:=vTRANSlastname
	SAVE RECORD:C53([Point of Sale:5])
	
	For ($k; 1; vReceiptCopies)
		
		Print_TransaxReceipt
		
	End for 
	
End if 