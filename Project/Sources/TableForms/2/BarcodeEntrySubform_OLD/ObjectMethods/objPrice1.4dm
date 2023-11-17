Case of 
	: (Form event code:C388=On Losing Focus:K2:8)
		Case of 
			: ([Sales:2]Item Number:13#0)
				
				vFoundinArray2:=Find in array:C230(asBarcodeItemNumbers; [Sales:2]Barcode:9)
				If (vFoundinArray2=-1)
					
					BEEP:C151
					
					//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
					MessageBox(" "; "No item was found in the Items table for that barcode."; "OKBox"; "red")
					
					//back tab to the field
					POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
				Else 
					
					QUERY:C277([Inventory:4]; [Inventory:4]Barcode Item Number:1=[Sales:2]Barcode:9)
					If (Records in selection:C76([Inventory:4])=1)
						[Sales:2]Consignor Number:6:=[Inventory:4]Consignor Number:3
						[Sales:2]Item Description:4:=[Inventory:4]Item Description:4
						[Sales:2]List Price:3:=[Inventory:4]Price:6
						vReduce:=[Inventory:4]Reduce:7
						If (vReduce=True:C214)
							Case of 
								: ([Point of Sale:5]ReduceBy:8=25)
									vPercentOff:=0.75
								: ([Point of Sale:5]ReduceBy:8=50)
									vPercentOff:=0.5
								Else 
									vPercentOff:=1
							End case 
							
							[Sales:2]Sold Price:2:=[Inventory:4]Price:6*vPercentOff
						Else 
							[Sales:2]Sold Price:2:=[Inventory:4]Price:6
						End if 
						
						[Sales:2]Item Size:5:=[Inventory:4]Size:5
						[Sales:2]Entered Date Stamp:7:=Current date:C33
						[Sales:2]Entered Time Stamp:8:=Current time:C178
						[Sales:2]Entered By:10:=<>User
						[Sales:2]Sold Date:11:=vCal_Date1
						
						
						GetSequenceNums("Sales")
						//[Sales]Unique Entry ID:=Current machine+"-"+[Enter Tags]Entered By+"-"+String(vSalesSequenceNumber)
						[Sales:2]Unique Entry ID:1:=[Point of Sale:5]Batch ID:1+"-"+String:C10(vSalesSequenceNumber)
						//[Sales]Batch ID:=[Batch]Batch ID
						//ok:=1
						//POST KEY(Ascii(Char(9));Current process)
						//GET OBJECT RECT(*;"bAddSales3";$left;$top;$right;$bottom)
						//POST CLICK($left+5;$top+5;Current process)
					End if 
					
					
				End if 
				
			Else 
				//back tab to the field
				
				
		End case 
		
		
		
End case 