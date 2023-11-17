//%attributes = {}
//[Point of Sale]Paid_Cash:=Variable1
//[Point of Sale]Paid_Check:=Variable2
//[Point of Sale]Paid_Visa:=Variable3
//[Point of Sale]Paid_Mastercard:=Variable4
//[Point of Sale]Paid_Discover:=Variable5
//[Point of Sale]Paid_AMEX:=Variable6
//[Point of Sale]Paid_GiftCard:=Variable7
//[Point of Sale]Paid_IOU:=Variable8
//[Point of Sale]Paid_ChangeDue:=vChange
//
//ACCEPT

//If paid with CC
If (vePNJPOS_Enabled=True:C214)
	
	vCCAmount:=0
	
	If (Variable3>0)
		vCCAmount:=Variable3
		CreateCCBatchFile
	End if 
	
	If (Variable4>0)
		vCCAmount:=Variable4
		CreateCCBatchFile
	End if 
	
	If (Variable5>0)
		vCCAmount:=Variable5
		CreateCCBatchFile
	End if 
	
	If (Variable6>0)
		vCCAmount:=Variable6
		CreateCCBatchFile
	End if 
	
End if 
