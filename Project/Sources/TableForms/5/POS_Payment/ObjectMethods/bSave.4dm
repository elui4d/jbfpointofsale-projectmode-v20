[Point of Sale:5]Paid_Cash:19:=Round:C94(Variable1; 2)
[Point of Sale:5]Paid_Check:20:=Round:C94(Variable2; 2)
[Point of Sale:5]Paid_Visa:21:=Round:C94(Variable3; 2)
[Point of Sale:5]Paid_Mastercard:22:=Round:C94(Variable4; 2)
[Point of Sale:5]Paid_Discover:23:=Round:C94(Variable5; 2)
[Point of Sale:5]Paid_AMEX:24:=Round:C94(Variable6; 2)
[Point of Sale:5]Paid_GiftCard:25:=Round:C94(Variable7; 2)
[Point of Sale:5]Paid_IOU:26:=Round:C94(Variable8; 2)
[Point of Sale:5]Paid_Other:29:=Round:C94(Variable9; 2)
[Point of Sale:5]Paid_ChangeDue:28:=Round:C94(vChange; 2)

If (Variable1=0) & (Variable2=0) & (Variable3=0) & (Variable4=0) & (Variable5=0) & (Variable6=0) & (Variable7=0) & (Variable8=0) & (Variable9=0)
	MessageBox("Warning"; "Unable to save, please select a payment type."; "OKBox"; "red")
	
Else 
	
	
	ACCEPT:C269
	
End if 


//3/21/15 -----Replaced with POS_CCFire and moved to POS output after save and reciept print


//
//  //If paid with CC
//If (vePNJPOS_Enabled=True)
//
//vCCAmount:=0
//
//If (Variable3>0)
//vCCAmount:=Variable3
//CreateCCBatchFile 
//End if 
//
//If (Variable4>0)
//vCCAmount:=Variable4
//CreateCCBatchFile 
//End if 
//
//If (Variable5>0)
//vCCAmount:=Variable5
//CreateCCBatchFile 
//End if 
//
//If (Variable6>0)
//vCCAmount:=Variable6
//CreateCCBatchFile 
//End if 
//
//End if 
