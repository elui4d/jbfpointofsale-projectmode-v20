//%attributes = {}

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
	
	vComputerNumber:=<>Computer
	Print form:C5([Point of Sale:5]; "Print_CloseOutRegister"; 200)
	
	ALL RECORDS:C47([Point of Sale:5])
	//Commented on 4/1/12 because it was only showing current computer number
	//QUERY([Point of Sale];[Point of Sale]Computer Number=vComputerNumber)
	
	DISTINCT VALUES:C339([Point of Sale:5]Sold Date:5; asSoldDate)
	
	For ($i; 1; Size of array:C274(asSoldDate))
		//Commented on 4/1/12 because it was only showing current computer number
		
		//QUERY([Point of Sale];[Point of Sale]Computer Number=vComputerNumber;*)
		
		QUERY:C277([Point of Sale:5]; [Point of Sale:5]Sold Date:5=asSoldDate{$i})
		CREATE SET:C116([Point of Sale:5]; "SearchSet")
		If (Records in selection:C76([Point of Sale:5])>0)
			
			vSoldDate:=asSoldDate{$i}
			vSoldDate2:=String:C10(vSoldDate)
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
			
			
			vCash:=vCashIn-vCashOut
			
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
			
			Print form:C5([Point of Sale:5]; "Print_CloseOutRegister"; 0)
		End if 
	End for 
	
	//************Totals Line****************
	ALL RECORDS:C47([Point of Sale:5])
	//QUERY([Point of Sale];[Point of Sale]Computer Number=vComputerNumber)
	CREATE SET:C116([Point of Sale:5]; "SearchSet")
	If (Records in selection:C76([Point of Sale:5])>0)
		
		vSoldDate2:="All Days"
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
		
		
		vCash:=vCashIn-vCashOut
		
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
		
		Print form:C5([Point of Sale:5]; "Print_CloseOutRegister"; 0)
	End if 
	
	
	
	Print form:C5([Point of Sale:5]; "Print_CloseOutRegister"; 100)
	PAGE BREAK:C6
	
End if 

ALL RECORDS:C47([Point of Sale:5])