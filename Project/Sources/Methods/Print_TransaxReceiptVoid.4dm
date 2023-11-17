//%attributes = {}

vPartialPrint:=""

SET PRINT OPTION:C733(2; 1)  //Port


//SET PRINT OPTION(4;vReceiptCopies)  `Port

If (vPrintDialog=False:C215)
	PRINT SETTINGS:C106
End if 

If (ok=1)
	
	//vPageNo:=1
	//vPageNoLabel:="Page:  "+String(vPageNo)
	//
	//
	//
	//  //v12 ---Was losing batch on reprint, so we are storing it to relate sales
	//If ([Point of Sale]Batch ID="")
	//QUERY([Point of Sale];[Point of Sale]Batch ID=vBID)
	//End if 
	//vDateNew:=String([Point of Sale]Entered Date Stamp)
	//vTime:=String([Point of Sale]Entered Time Stamp)
	//RELATE MANY([Point of Sale]Batch ID)
	//
	//ORDER BY([Sales];[Sales]Entered Time Stamp;>)
	//
	//vItemsSold:=Records in selection([Sales])
	//Sales_RecalculateTotals 
	//vChange:=Round((vTransactionTotal-vTotalPaid*-1);2)
	//
	//
	//QUERY([Preferences];[Preferences]ID="ME")
	//If (Records in selection([Preferences])>0)
	//vReceiptNotes:=[Preferences]ReceiptNotes
	//vReceiptType:=[Preferences]ReceiptType
	//vReceiptCopies:=[Preferences]ReceiptCopies
	//End if 
	//UNLOAD RECORD([Preferences])
	
	
	
	// 1/17/17 - Transax
	If (vTransID#"")
		
		//CCTransactionRequest 
		
		//Open Centered window (500;500;Movable dialog box;" ")
		//DIALOG([Point of Sale];"CCResultTest")  // Display a custom search dialog 
		//CLOSE WINDOW
		
		//vDateNew:=String(Current date)
		//vTime:=String(Current time)
		
		
		Print form:C5([Point of Sale:5]; "TransaxCCReceiptVoid"; 200)
		PAGE BREAK:C6
		//vResult2:=""
	End if 
	
	
End if 

