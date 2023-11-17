//%attributes = {}
vReason1:=""
vCash1:=0
vCashTally:=0
vTotalCashinDrawer:=0
vPartialPrint:=""
SET PRINT OPTION:C733(2; 1)  //Port
QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
If (Records in selection:C76([Preferences:3])>0)
	vPrintDialog:=[Preferences:3]PrintDialog:10
End if 
UNLOAD RECORD:C212([Preferences:3])

If (vPrintDialog=False:C215)
	PRINT SETTINGS:C106
End if 

If (ok=1)
	
	vDate:=Current date:C33
	vTime:=String:C10(Current time:C178)
	
	vComputerNumber:=<>Computer
	Print form:C5([Cash:10]; "Print_CashManager"; 200)
	
	
	ALL RECORDS:C47([Point of Sale:5])
	
	QUERY:C277([Point of Sale:5]; [Point of Sale:5]Entered Date Stamp:4=Current date:C33)
	CREATE SET:C116([Point of Sale:5]; "SearchSet")
	If (Records in selection:C76([Point of Sale:5])>0)
		
		vBatches:=String:C10(Records in selection:C76([Point of Sale:5]))
		DISTINCT VALUES:C339([Point of Sale:5]Batch ID:1; asBatches)
		QUERY WITH ARRAY:C644([Sales:2]Batch ID:12; asBatches)
		
		vItemsSold:=Records in selection:C76([Sales:2])
		vTransactionSubtotal:=Sum:C1([Sales:2]Sold Price:2)
		vTransactionSubtotal:=Round:C94(vTransactionSubtotal; 2)
		
		
		vTransactionSubtotalTax:=Round:C94(Sum:C1([Sales:2]Sold Price:2)+Sum:C1([Sales:2]TaxAmount:17)+Sum:C1([Sales:2]AltTaxAmount:20); 2)
		
		USE SET:C118("SearchSet")
		QUERY SELECTION:C341([Point of Sale:5]; [Point of Sale:5]Paid_Cash:19>0)
		vCashIn:=Sum:C1([Point of Sale:5]Paid_Cash:19)
		
		USE SET:C118("SearchSet")
		QUERY SELECTION:C341([Point of Sale:5]; [Point of Sale:5]Paid_ChangeDue:28>0)
		vCashOut:=Sum:C1([Point of Sale:5]Paid_ChangeDue:28)
		
		
		vCashX:=vCashIn-vCashOut
		
		USE SET:C118("SearchSet")
		QUERY SELECTION:C341([Point of Sale:5]; [Point of Sale:5]Paid_Check:20>0)
		vCheck:=Sum:C1([Point of Sale:5]Paid_Check:20)
		
		USE SET:C118("SearchSet")
		QUERY SELECTION:C341([Point of Sale:5]; [Point of Sale:5]Paid_AMEX:24>0)
		vAMEX:=Sum:C1([Point of Sale:5]Paid_AMEX:24)
		
		USE SET:C118("SearchSet")
		QUERY SELECTION:C341([Point of Sale:5]; [Point of Sale:5]Paid_Discover:23>0)
		vDiscover:=Sum:C1([Point of Sale:5]Paid_Discover:23)
		
		USE SET:C118("SearchSet")
		QUERY SELECTION:C341([Point of Sale:5]; [Point of Sale:5]Paid_GiftCard:25>0)
		vGiftCard:=Sum:C1([Point of Sale:5]Paid_GiftCard:25)
		
		USE SET:C118("SearchSet")
		QUERY SELECTION:C341([Point of Sale:5]; [Point of Sale:5]Paid_IOU:26>0)
		vIOU:=Sum:C1([Point of Sale:5]Paid_IOU:26)
		
		USE SET:C118("SearchSet")
		QUERY SELECTION:C341([Point of Sale:5]; [Point of Sale:5]Paid_Other:29>0)
		vOther:=Sum:C1([Point of Sale:5]Paid_Other:29)
		
		USE SET:C118("SearchSet")
		QUERY SELECTION:C341([Point of Sale:5]; [Point of Sale:5]Paid_Mastercard:22>0)
		vMasterCard:=Sum:C1([Point of Sale:5]Paid_Mastercard:22)
		
		USE SET:C118("SearchSet")
		QUERY SELECTION:C341([Point of Sale:5]; [Point of Sale:5]Paid_Visa:21>0)
		vVisa:=Sum:C1([Point of Sale:5]Paid_Visa:21)
		
		USE SET:C118("SearchSet")
		vBatches:=String:C10(Records in selection:C76([Point of Sale:5]))
		DISTINCT VALUES:C339([Point of Sale:5]Batch ID:1; asBatches)
		QUERY WITH ARRAY:C644([Sales:2]Batch ID:12; asBatches)
		vTransactionSubtotalTax:=Round:C94(Sum:C1([Sales:2]Sold Price:2)+Sum:C1([Sales:2]TaxAmount:17)+Sum:C1([Sales:2]AltTaxAmount:20); 2)
		vTotalSales9:=vTransactionSubtotalTax
		
		ALL RECORDS:C47([Cash:10])
		
		For ($i; 1; Records in selection:C76([Cash:10]))
			vReason1:=[Cash:10]Reason:4
			vCash1:=[Cash:10]Cash:3
			vCashTally:=vCashTally+vCash1
			Print form:C5([Cash:10]; "Print_CashManager"; 0)
			NEXT RECORD:C51([Cash:10])
		End for 
		vCash1:=vCashX
		vReason1:="Cash from Sales"
		
		Print form:C5([Cash:10]; "Print_CashManager"; 0)
		
		vTotalCashinDrawer:=vCashTally+vCashX
		
		
		Print form:C5([Cash:10]; "Print_CashManager"; 100)
		PAGE BREAK:C6
	Else 
		//MessageBox ("";"You don't have any sales for today on this register.";"OKBox";"Red")
		vBatches:=""
		vItemsSold:=0
		vTransactionSubtotal:=0
		vTransactionSubtotalTax:=0
		vCashX:=0
		vCheck:=0
		vAMEX:=0
		vDiscover:=0
		vGiftCard:=0
		vIOU:=0
		vOther:=0
		vMasterCard:=0
		vVisa:=0
		vTransactionSubtotalTax:=0
		vTotalSales9:=0
		ALL RECORDS:C47([Cash:10])
		
		For ($i; 1; Records in selection:C76([Cash:10]))
			vReason1:=[Cash:10]Reason:4
			vCash1:=[Cash:10]Cash:3
			vCashTally:=vCashTally+vCash1
			Print form:C5([Cash:10]; "Print_CashManager"; 0)
			NEXT RECORD:C51([Cash:10])
		End for 
		vCash1:=vCashX
		vReason1:="Cash from Sales"
		
		Print form:C5([Cash:10]; "Print_CashManager"; 0)
		
		vTotalCashinDrawer:=vCashTally+vCashX
		
		
		Print form:C5([Cash:10]; "Print_CashManager"; 100)
		PAGE BREAK:C6
	End if 
	
End if 