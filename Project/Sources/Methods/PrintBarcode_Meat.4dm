//%attributes = {}

If (ok=1)
	
	C_PICTURE:C286($barcode; $helppict)
	
	SET PRINT OPTION:C733(2; 2)  //Land
	
	QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
	If (Records in selection:C76([Preferences:3])>0)
		vPrintDialog:=[Preferences:3]PrintDialog:10
		vPrintCopies:=[Preferences:3]ReceiptCopies:9
	End if 
	UNLOAD RECORD:C212([Preferences:3])
	
	If (vPrintDialog=False:C215)
		PRINT SETTINGS:C106
	End if 
	
	vBarcode2:=vBarcodeLabel
	vPrice:=""
	vPrice2:=""
	vTagReduce:=""
	vTagReduce2:=""
	
	//New for 9.0
	vtempBarcode:=vBarcode2
	
	vPos1:=Position:C15("-"; vtempBarcode; 1; *)
	vConsignorNumber:=Substring:C12(vtempBarcode; 1; (vPos1-1))
	vtempBarcode:=Substring:C12(vtempBarcode; (vPos1+1))
	
	//Price
	vPos2:=Position:C15("-"; vtempBarcode; 1; *)
	vPrice:=Substring:C12(vtempBarcode; 1; (vPos2-1))
	vPrice2:="$"+vPrice
	vtempBarcode:=Substring:C12(vtempBarcode; (vPos2+1))
	
	//reduce
	vPos3:=Position:C15("-"; vtempBarcode; 1; *)
	vTagReduce:=Substring:C12(vtempBarcode; 1; (vPos3-1))
	vtempBarcode:=Substring:C12(vtempBarcode; (vPos3+1))
	
	If (vTagReduce="1")
		vTagReduce2:="No STAR"
	Else 
		vTagReduce2:="STAR"
	End if 
	
	vTagItemNumber:=Num:C11(vtempBarcode)
	//end parse
	
	//vBarcode2:="$"+vPrice+"  "+vTagReduce2+"  "+vConsignorNumber+"  "+vTempBarcode
	
	vTempItemDesc:=""
	QUERY:C277([Inventory:4]; [Inventory:4]Barcode Item Number:1=vTagItemNumber)
	
	If (Records in selection:C76([Inventory:4])=1)
		vTempItemDesc:=[Inventory:4]Item Description:4
		
		If (vConsignorNumber="")
			vConsignorNumber:=[Inventory:4]Consignor Number:3
		End if 
		
		If (vPrice="")
			vPrice:=String:C10([Inventory:4]Price:6)
			vPrice2:="$"+vPrice
		End if 
		
		If (vTagReduce="")
			Case of 
				: ([Inventory:4]Reduce:7=True:C214)
					vTagReduce2:="No STAR"
				: ([Inventory:4]Reduce:7=False:C215)
					vTagReduce2:="STAR"
				Else 
					vTagReduce2:=""
			End case 
		End if 
		
		
		vBarcode2:=vPrice2+"  "+vTagReduce2+"  "+vConsignorNumber+"  "+vTempBarcode
		
	Else 
		//no item found, still print barcode
		vTempItemDesc:=""
		vBarcode2:=vPrice2+"  "+vTagReduce2+"  "+vConsignorNumber+"  "+vTempBarcode
		
	End if 
	
	vType:="Code128A"
	vBarcode:=Barcode_Create(vType; vBarcodeLabel; True:C214; False:C215; False:C215)
	
	For ($vlRecord; 1; vPrintCopies)
		
		Print form:C5([Dialogs:7]; "Print_Barcodelabels2")
		
	End for 
	
	//PAGE BREAK
	//
	//UNLOAD RECORD([Inventory])
	//ALL RECORDS([Inventory])
	//CLOSE WINDOW
	vBarcodeLabel:=""
End if 