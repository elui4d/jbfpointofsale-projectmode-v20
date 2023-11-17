//%attributes = {}

vPartialPrint:=""

SET PRINT OPTION:C733(2; 1)  //Port


//SET PRINT OPTION(4;vReceiptCopies)  `Port

If (vPrintDialog=False:C215)
	PRINT SETTINGS:C106
End if 

If (ok=1)
	
	vPageNo:=1
	vPageNoLabel:="Page:  "+String:C10(vPageNo)
	
	
	
	//v12 ---Was losing batch on reprint, so we are storing it to relate sales
	If ([Point of Sale:5]Batch ID:1="")
		QUERY:C277([Point of Sale:5]; [Point of Sale:5]Batch ID:1=vBID)
	End if 
	vDateNew:=String:C10([Point of Sale:5]Entered Date Stamp:4)
	vTime:=String:C10([Point of Sale:5]Entered Time Stamp:3)
	RELATE MANY:C262([Point of Sale:5]Batch ID:1)
	
	ORDER BY:C49([Sales:2]; [Sales:2]Entered Time Stamp:8; >)
	
	vItemsSold:=Records in selection:C76([Sales:2])
	Sales_RecalculateTotals
	vChange:=Round:C94((vTransactionTotal-vTotalPaid*-1); 2)
	
	
	QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
	If (Records in selection:C76([Preferences:3])>0)
		vReceiptNotes:=[Preferences:3]ReceiptNotes:8
		vReceiptType:=[Preferences:3]ReceiptType:11
		vReceiptCopies:=[Preferences:3]ReceiptCopies:9
	End if 
	UNLOAD RECORD:C212([Preferences:3])
	
	
	
	// 1/17/17 - Transax
	If (vTransID#"")
		
		//CCTransactionRequest 
		
		//Open Centered window (500;500;Movable dialog box;" ")
		//DIALOG([Point of Sale];"CCResultTest")  // Display a custom search dialog 
		//CLOSE WINDOW
		
		
		
		Print form:C5([Point of Sale:5]; "TransaxCCReceipt"; 200)
		PAGE BREAK:C6
		//vResult2:=""
	End if 
	
	
End if 

