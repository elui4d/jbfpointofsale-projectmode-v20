
Case of 
	: (Form event code:C388=On Load:K2:1)
		//OBJECT SET RGB COLORS([Sales]Barcode; UTIL_4DColorToHex(Black); UTIL_4DColorToHex(White))
		
		//v12 ---Was losing batch on reprint, so we are storing it to relate sales
		vBID:=[Point of Sale:5]Batch ID:1
		
		vLookup:=""
		ORDER BY:C49([Sales:2]; [Sales:2]Entered Time Stamp:8; >)
		
		//DISABLE BUTTON(bShowAll)
		//ENABLE BUTTON(bDataEntry)
		//ENABLE BUTTON(bBarcodes)
		
		ALL RECORDS:C47([Consignors:1])
		DISTINCT VALUES:C339([Consignors:1]Consignor Number:1; asConsignorNumbers)
		
		QUERY:C277([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)
		DISTINCT VALUES:C339([Consignors:1]Consignor Number:1; asActiveConsignorNumbers)
		
		//Can't run this code to check for barcodes that have already been scanned.  This resets the Subrecords.
		//QUERY([Sales];[Sales]Barcode Item Number>0)
		//DISTINCT VALUES([Sales]Barcode Item Number;asSoldBarcodeItemNumbers)
		
		ALL RECORDS:C47([Inventory:4])
		DISTINCT VALUES:C339([Inventory:4]Barcode Item Number:1; asBarcodeItemNumbers)
		
		QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
		If (Records in selection:C76([Preferences:3])>0)
			//vEntryMode:=[Preferences]EntryMode
			vTaxRate2:=[Preferences:3]TaxRate:5*0.01
			vAltTaxRate2:=[Preferences:3]AltTaxRate:19*0.01
			vePNJPOS_Path:=[Preferences:3]ePNJPOS_Path:21
			vePNJPOS_Clerk:=[Preferences:3]ePNJPOS_Clerk:22
			vePNJPOS_Password:=[Preferences:3]ePNJPOS_Password:23
			vePNJPOS_Enabled:=[Preferences:3]ePNJPOS_Enabled:20
			vNEW_ePNJPOS_Enabled:=[Preferences:3]NEW_ePNJPOS_Enabled:26
			vVerifyTag:=[Preferences:3]VerifyTag:27
		End if 
		UNLOAD RECORD:C212([Preferences:3])
		
		If ([Point of Sale:5]NewCount:6=0)
			
			GetSequenceNums("Batch")
			CREATE RECORD:C68([Point of Sale:5])
			[Point of Sale:5]Batch ID:1:=<>Computer+"-"+String:C10(vBatchSequenceNumber)
			[Point of Sale:5]Entered By:2:=<>User
			[Point of Sale:5]Computer Number:7:=<>Computer
			[Point of Sale:5]ReduceBy:8:=<>Discount
			[Point of Sale:5]Taxed:16:=True:C214
			[Point of Sale:5]Sold Date:5:=Current date:C33
			
			//Case of 
			//: (vEntryMode="POS")
			//GOTO PAGE(4)
			//Else 
			FORM GOTO PAGE:C247(4)
			//End case 
			
			OBJECT SET ENTERABLE:C238([Point of Sale:5]Sold Date:5; True:C214)
			OBJECT SET ENTERABLE:C238([Point of Sale:5]ReduceBy:8; True:C214)
			
			//new 01/12/08 
			//OBJECT GET COORDINATES(*; "EnterSales"; $left; $top; $right; $bottom)
			//POST CLICK($left+5; $top+5; Current process)
			//POST KEY(Character code("/"); Command key mask; Current process)
			//OBJECT GET COORDINATES(*; "bAddSales"; $left; $top; $right; $bottom)
			//POST CLICK($left+5; $top+5; Current process)
			
			//v12
			vCountIt:=Records in selection:C76([Sales:2])
			
		Else 
			
			OBJECT SET ENTERABLE:C238([Point of Sale:5]Sold Date:5; False:C215)
			OBJECT SET RGB COLORS:C628([Point of Sale:5]Sold Date:5; UTIL_4DColorToHex(Black:K11:16); UTIL_4DColorToHex(Light grey:K11:13))
			
			OBJECT SET ENTERABLE:C238([Point of Sale:5]ReduceBy:8; False:C215)
			OBJECT SET RGB COLORS:C628([Point of Sale:5]ReduceBy:8; UTIL_4DColorToHex(Black:K11:16); UTIL_4DColorToHex(Light grey:K11:13))
			//v12
			vCountIt:=Records in selection:C76([Sales:2])
			
		End if 
		
		vCal_Date1:=[Point of Sale:5]Sold Date:5
		
		
		vItemsInBatch:=Records in selection:C76([Sales:2])
		
		vTransactionSubtotal:=Sum:C1([Sales:2]Sold Price:2)
		vTransactionSubtotal:=Round:C94(vTransactionSubtotal; 2)
		vTransactionTax:=Sum:C1([Sales:2]TaxAmount:17)
		vTransactionTax:=Round:C94(vTransactionTax; 2)
		vTransactionTax2:=Sum:C1([Sales:2]AltTaxAmount:20)
		vTransactionTax2:=Round:C94(vTransactionTax2; 2)
		vTransactionTotal:=vTransactionTax+vTransactionTax2+vTransactionSubtotal
		
		DISTINCT VALUES:C339([Sales:2]Item Number:13; asItemsInBatch)
		
		QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
		If (Records in selection:C76([Preferences:3])>0)
			vTenDollar:=[Preferences:3]TenDollar:4
			vEntryMode:=[Preferences:3]EntryMode:7
			vTaxPrompt:=[Preferences:3]Tax Prompt:6
		End if 
		UNLOAD RECORD:C212([Preferences:3])
		
	: (Form event code:C388=On Data Change:K2:15)
		//v12
		//vItemsInBatch:=Records in selection([Sales])
		
		vTransactionSubtotal:=Sum:C1([Sales:2]Sold Price:2)
		vTransactionSubtotal:=Round:C94(vTransactionSubtotal; 2)
		vTransactionTax:=Sum:C1([Sales:2]TaxAmount:17)
		vTransactionTax:=Round:C94(vTransactionTax; 2)
		vTransactionTax2:=Sum:C1([Sales:2]AltTaxAmount:20)
		vTransactionTax2:=Round:C94(vTransactionTax2; 2)
		vTransactionTotal:=vTransactionTax+vTransactionTax2+vTransactionSubtotal
		
	: (Form event code:C388=On Close Detail:K2:24)
		//Save data if user closes input screen
		ACCEPT:C269
		FLUSH CACHE:C297
		
	: (Form event code:C388=On Unload:K2:2)
		
		
		If (vPOSPrint=0)
			
			
			//For some reason the record count wasn't updating from this form
			ALL RECORDS:C47([Point of Sale:5])
			ORDER BY:C49([Point of Sale:5]; [Point of Sale:5]Entered Date Stamp:4; <; [Point of Sale:5]Entered Time Stamp:3; <)
			
			gTableName:=Table name:C256(<>TablePointer)
			gTableRecordCount:=String:C10(Records in selection:C76(<>TablePointer->))+"  of  "+String:C10(Records in table:C83(<>TablePointer->))
			gTableRecordCount2:=gTableName+" : "+gTableRecordCount
		End if 
		FLUSH CACHE:C297
		
End case 