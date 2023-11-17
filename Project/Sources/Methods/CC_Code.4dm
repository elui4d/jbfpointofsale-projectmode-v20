//%attributes = {}
[Point of Sale:5]Paid_Cash:19:=Variable1
[Point of Sale:5]Paid_Check:20:=Variable2
[Point of Sale:5]Paid_Visa:21:=Variable3
[Point of Sale:5]Paid_Mastercard:22:=Variable4
[Point of Sale:5]Paid_Discover:23:=Variable5
[Point of Sale:5]Paid_AMEX:24:=Variable6
[Point of Sale:5]Paid_GiftCard:25:=Variable7
[Point of Sale:5]Paid_IOU:26:=Variable8
[Point of Sale:5]Paid_Other:29:=Variable9
[Point of Sale:5]Paid_ChangeDue:28:=vChange

ACCEPT:C269

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