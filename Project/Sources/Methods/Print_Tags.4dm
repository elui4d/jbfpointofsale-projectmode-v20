//%attributes = {}
If (<>TablePointer=(->[Inventory:4]))
	
	
	//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";), 4=TextColor
	MessageBox("Print Tags"; "This will print tags for ALL the selected  Inventory records.   It is meant to pr"+"int only a few tags a time.  Are you sure you want to continue?"; "YesNoBox"; "Red")
	
	If (ok=1)
		C_PICTURE:C286($barcode; $helppict)
		
		SET PRINT OPTION:C733(2; 1)  //Port
		PRINT SETTINGS:C106
		
		
		
		vBreakCounter:=0
		FIRST RECORD:C50([Inventory:4])
		For ($i; 1; Records in selection:C76([Inventory:4]))
			
			vItemDescription:=""
			vItemNumber:=""
			vReduce1:=""
			vDonate:=""
			vPrice:=""
			vConsignorNumber:=""
			vSize:=""
			
			vItemDescription2:=""
			vItemNumber2:=""
			vReduce2:=""
			vDonate2:=""
			vPrice2:=""
			vConsignorNumber2:=""
			vSize2:=""
			
			//Begin Print
			vItemDescription:=[Inventory:4]Item Description:4
			vItemNumber:=String:C10([Inventory:4]Barcode Item Number:1)
			If ([Inventory:4]Reduce:7=True:C214)
				vReduce1:="1"
			Else 
				vReduce1:="0"
			End if 
			vPrice:="$"+String:C10([Inventory:4]Price:6; "##0.00")
			vPriceTag:=String:C10([Inventory:4]Price:6; "##0.00")
			vConsignorNumber:=[Inventory:4]Consignor Number:3
			vSize:=[Inventory:4]Size:5
			If ([Inventory:4]Donate:9=True:C214)
				vDonate:="Donate"
			Else 
				vDonate:=""
			End if 
			vBarcode2:=vConsignorNumber+"-"+vPriceTag+"-"+vReduce1+"-"+vItemNumber
			
			vType:="Code128A"
			vBarcode:=Barcode_Create(vType; vBarcode2; True:C214; False:C215; True:C214)
			
			//Loop 2
			NEXT RECORD:C51([Inventory:4])
			
			
			//Begin Print
			vItemDescription2:=[Inventory:4]Item Description:4
			vItemNumber2:=String:C10([Inventory:4]Barcode Item Number:1)
			If ([Inventory:4]Reduce:7=True:C214)
				vReduce2:="1"
			Else 
				vReduce2:="0"
			End if 
			vPrice2:="$"+String:C10([Inventory:4]Price:6; "##0.00")
			vPriceTag2:=String:C10([Inventory:4]Price:6; "##0.00")
			vConsignorNumber2:=[Inventory:4]Consignor Number:3
			vSize2:=[Inventory:4]Size:5
			If ([Inventory:4]Donate:9=True:C214)
				vDonate2:="Donate"
			Else 
				vDonate2:=""
			End if 
			vBarcode2:=vConsignorNumber2+"-"+vPriceTag2+"-"+vReduce2+"-"+vItemNumber2
			
			vType:="Code128A"
			vBarcodeb:=Barcode_Create(vType; vBarcode2; True:C214; False:C215; True:C214)
			
			Print form:C5([Dialogs:7]; "Print_tags")
			
			vBreakCounter:=vBreakCounter+1
			If (vBreakCounter=2)
				//Can't do the > to continue.  For some reason, the barcode graphics won't render on all pages.  Memory issue I think.
				//added this on 2/14 after v13 allowed new print server
				PAGE BREAK:C6(>)
				vBreakCounter:=0
			End if 
			NEXT RECORD:C51([Inventory:4])
			$i:=$i+1
		End for 
		PAGE BREAK:C6
		
		UNLOAD RECORD:C212([Inventory:4])
		ALL RECORDS:C47([Inventory:4])
	End if 
Else 
	//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
	MessageBox(""; "You must be in the Inventory table to print tags."; "OKBox"; "red")
End if 