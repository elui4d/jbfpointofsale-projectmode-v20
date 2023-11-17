//%attributes = {}
If (OK=1)  //open doc?
	Message_Think("Importing data, please wait... ")
	CREATE EMPTY SET:C140([Point of Sale:5]; "IMPORT")
	
	C_TEXT:C284(vBatchIDImport; vNewCountImport; vReduceByImport; vBarcodeItemNumberImport; vConsignorNumberImport; vSoldPriceImport; vTagPriceImport; vCategory)
	C_TEXT:C284(vPaidAmex; vPaidCash; vPaidCheck; vPaidDiscover; vPaidGiftCard; vPaidIOU; vPaidOther; vPaidMastercard; vPaidVisa; vPaymentMethod; vPaymentChange; vAddress; vCity; vEmail; vFirstName; vLastName; vPhone; vState; vZip; vTaxed; vTaxAmount; vSalesTaxed; vAltTaxAmount; vAltSalesTaxed)
	
	
	While (OK=1)
		update:=0
		RECEIVE PACKET:C104(gDocRef; vBatchIDImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vEnteredByImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vEnteredDateStampImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vEnteredTimeStampImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vNewCountImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vSoldDateImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vReduceByImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vComputerNameImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPaidAmex; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPaidCash; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPaidCheck; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPaidDiscover; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPaidGiftCard; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPaidIOU; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPaidOther; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPaidMastercard; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPaidVisa; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPaymentMethod; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPaymentChange; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vAddress; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCity; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vEmail; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vFirstName; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vLastName; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vPhone; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vState; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vZip; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vComment; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vTaxed; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vBarcodeImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vBarcodeItemNumberImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vConsignorNumberImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vEnteredBySalesImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vEnteredDateStampSalesImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vEnteredTimeStampSalesImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vItemDescriptionImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vSoldDateSalesImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vSoldPriceImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vTagPriceImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vUniqueEntryIDImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vTaxAmount; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vSalesTaxed; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vAltTaxAmount; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vAltSalesTaxed; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vItemSizeImport; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCategory; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vReturnReason; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vXPercentOff; Char:C90(10))
		If (vBatchIDImport#"")
			QUERY:C277([Point of Sale:5]; [Point of Sale:5]Batch ID:1=vBatchIDImport; *)
			QUERY:C277([Point of Sale:5];  & ; [Point of Sale:5]Computer Number:7=vComputerNameImport)
			
			If (Records in selection:C76([Point of Sale:5])=0)
				
				CREATE RECORD:C68([Point of Sale:5])
				
				[Point of Sale:5]Batch ID:1:=vBatchIDImport
				[Point of Sale:5]Computer Number:7:=vComputerNameImport
				[Point of Sale:5]Entered By:2:=vEnteredByImport
				[Point of Sale:5]Entered Date Stamp:4:=Date:C102(vEnteredDateStampImport)
				[Point of Sale:5]Entered Time Stamp:3:=Time:C179(vEnteredTimeStampImport)
				[Point of Sale:5]NewCount:6:=Num:C11(vNewCountImport)
				[Point of Sale:5]Sold Date:5:=Date:C102(vSoldDateImport)
				[Point of Sale:5]ReduceBy:8:=Num:C11(vReduceByImport)
				[Point of Sale:5]Paid_AMEX:24:=Num:C11(vPaidAmex)
				[Point of Sale:5]Paid_Cash:19:=Num:C11(vPaidCash)
				[Point of Sale:5]Paid_Check:20:=Num:C11(vPaidCheck)
				[Point of Sale:5]Paid_Discover:23:=Num:C11(vPaidDiscover)
				[Point of Sale:5]Paid_GiftCard:25:=Num:C11(vPaidGiftCard)
				[Point of Sale:5]Paid_IOU:26:=Num:C11(vPaidIOU)
				[Point of Sale:5]Paid_Other:29:=Num:C11(vPaidOther)
				[Point of Sale:5]Paid_Mastercard:22:=Num:C11(vPaidMastercard)
				[Point of Sale:5]Paid_Visa:21:=Num:C11(vPaidVisa)
				[Point of Sale:5]Payment Method:17:=vPaymentMethod
				[Point of Sale:5]Paid_ChangeDue:28:=Num:C11(vPaymentChange)
				[Point of Sale:5]Shopper Address1:11:=vAddress
				[Point of Sale:5]Shopper City:12:=vCity
				[Point of Sale:5]Shopper Email:27:=vEmail
				[Point of Sale:5]Shopper First Name:9:=vFirstName
				[Point of Sale:5]Shopper Last Name:10:=vLastName
				[Point of Sale:5]Shopper Phone:15:=vPhone
				[Point of Sale:5]Shopper State:13:=vState
				[Point of Sale:5]Shopper Zip:14:=vZip
				[Point of Sale:5]Comments:18:=vComment
				
				If (vTaxed="1")
					[Point of Sale:5]Taxed:16:=True:C214
				Else 
					[Point of Sale:5]Taxed:16:=False:C215
				End if 
				
				SAVE RECORD:C53([Point of Sale:5])
				
				ADD TO SET:C119([Point of Sale:5]; "IMPORT")
			End if 
			
			QUERY:C277([Sales:2]; [Sales:2]Unique Entry ID:1=vUniqueEntryIDImport)
			
			If (Records in selection:C76([Sales:2])=0)
				//Create the Sales Record otherwise we update the record
				CREATE RECORD:C68([Sales:2])
				[Sales:2]Unique Entry ID:1:=vUniqueEntryIDImport
			End if 
			
			//Added on 3/1/09
			//If item has been modified in child DB's, it will update it in the master upon import
			If ([Sales:2]Entered Date Stamp:7=Date:C102(vEnteredDateStampSalesImport)) & ([Sales:2]Entered Time Stamp:8<Time:C179(vEnteredTimeStampSalesImport))
				update:=1
			End if 
			
			If ([Sales:2]Entered Date Stamp:7<Date:C102(vEnteredDateStampSalesImport))  //When creating new record, date stamp will be less than imported stamp
				update:=1
			End if 
			
			If ([Sales:2]Entered Date Stamp:7=Date:C102("00"))  //When creating new record, date stamp will be less than imported stamp
				update:=1
			End if 
			
			If (Update=1)
				[Sales:2]Barcode:9:=vBarcodeImport
				[Sales:2]Item Number:13:=Num:C11(vBarcodeItemNumberImport)
				[Sales:2]Batch ID:12:=vBatchIDImport
				[Sales:2]Consignor Number:6:=vConsignorNumberImport
				[Sales:2]Entered By:10:=vEnteredBySalesImport
				[Sales:2]Entered Date Stamp:7:=Date:C102(vEnteredDateStampSalesImport)
				[Sales:2]Entered Time Stamp:8:=Time:C179(vEnteredTimeStampSalesImport)
				[Sales:2]Item Description:4:=vItemDescriptionImport
				[Sales:2]Item Size:5:=vItemSizeImport
				[Sales:2]Sold Date:11:=Date:C102(vSoldDateSalesImport)
				[Sales:2]List Price:3:=Num:C11(vSoldPriceImport)
				[Sales:2]Sold Price:2:=Num:C11(vTagPriceImport)
				[Sales:2]TaxAmount:17:=Num:C11(vTaxAmount)
				[Sales:2]Taxed:16:=vSalesTaxed
				[Sales:2]AltTaxAmount:20:=Num:C11(vAltTaxAmount)
				[Sales:2]AltTaxed:19:=vAltSalesTaxed
				[Sales:2]Category:14:=vCategory
				[Sales:2]ReturnReason:18:=vReturnReason
				[Sales:2]PercentOff:15:=vXPercentOff
				SAVE RECORD:C53([Sales:2])
			End if 
		Else 
			ok:=0
		End if 
		
	End while 
	
	FLUSH CACHE:C297
	
	CLOSE DOCUMENT:C267(gDocRef)
	CLOSE WINDOW:C154
	
	USE SET:C118("IMPORT")
	CLEAR SET:C117("IMPORT")
	
End if   //open doc