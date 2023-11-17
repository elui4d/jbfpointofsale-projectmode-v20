QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
If (Records in selection:C76([Preferences:3])>0)
	vReceiptCopies:=[Preferences:3]ReceiptCopies:9
	vPrintDialog:=[Preferences:3]PrintDialog:10
	vReceiptNotes:=[Preferences:3]ReceiptNotes:8
	vReceiptType:=[Preferences:3]ReceiptType:11
	vAutoUploadSales:=[Preferences:3]AutoUploadSales:25
End if 
UNLOAD RECORD:C212([Preferences:3])

vOriginalSoldPrice:=[Sales:2]Sold Price:2
vOriginalTaxPrice:=[Sales:2]TaxAmount:17
vOriginalAltTaxPrice:=[Sales:2]AltTaxAmount:20
vTransactionTotal:=vOriginalSoldPrice+vOriginalTaxPrice+vOriginalAltTaxPrice

[Sales:2]Taxed:16:=""
[Sales:2]TaxAmount:17:=0
[Sales:2]Sold Price:2:=0
[Sales:2]Sold Date:11:=Current date:C33
[Sales:2]Entered Date Stamp:7:=Current date:C33
[Sales:2]Entered Time Stamp:8:=Current time:C178
[Sales:2]Entered By:10:=<>User
[Sales:2]ReturnReason:18:=vReturnReason

SAVE RECORD:C53([Sales:2])

If (vAutoUploadSales=True:C214)
	AutoUploadOfSalesReturns
End if 

vBarcodeScan2:=""

OBJECT SET ENABLED:C1123(btnReturn; False:C215)

//Print Refund Reciept


For ($j; 1; vReceiptCopies)
	vPartialPrint:=""
	SET PRINT OPTION:C733(2; 1)  //Port
	
	If (vPrintDialog=False:C215)
		PRINT SETTINGS:C106
	End if 
	
	If (ok=1)
		
		vPageNo:=1
		vPageNoLabel:="Page:  "+String:C10(vPageNo)
		vDate:=Current date:C33
		
		ORDER BY:C49([Sales:2]; [Sales:2]Entered Time Stamp:8; >)
		
		vTransactionTotal:=vOriginalSoldPrice+vOriginalTaxPrice+vOriginalAltTaxPrice
		
		
		
		//Receipt Printer ONLY
		
		Print form:C5([Sales:2]; "Print_RefundReceipt"; 200)
		
		
		For ($vlRecord1; 1; Records in selection:C76([Sales:2]))
			Print form:C5([Sales:2]; "Print_RefundReceipt"; 0)
			//NEXT RECORD([Sales])
		End for 
		
		Print form:C5([Sales:2]; "Print_RefundReceipt"; 100)
		PAGE BREAK:C6
		
		
	End if 
	
	
	SET PRINT OPTION:C733(2; 1)  //Port
	
	If (vPrintDialog=False:C215)
		PRINT SETTINGS:C106
	End if 
	
	If (ok=1)
		Print form:C5([Sales:2]; "Print_ReturnReason")
		PAGE BREAK:C6
	End if 
	
End for 
vReturnReason:=""

ACCEPT:C269
