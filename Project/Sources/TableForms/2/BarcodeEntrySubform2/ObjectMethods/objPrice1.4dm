Case of 
		
	: (Form event code:C388=On Getting Focus:K2:7)
		//OBJECT SET RGB COLORS([Sales]Barcode; UTIL_4DColorToHex(Black); UTIL_4DColorToHex(66))
		//OBJECT SET RGB COLORS([Sales]Barcode; UTIL_4DColorToHex(Black); UTIL_4DColorToHex(66))
		//OBJECT SET RGB COLORS(OBJECT Get pointer(Object current)->; UTIL_4DColorToHex(Black); UTIL_4DColorToHex(66))
		//OBJECT GET COORDINATES([Sales]Barcode; $l; $t; $r; $b)
		//TRACE
		//OBJECT SET RGB COLORS([Sales]Barcode; "Black"; "Yellow")
		
	: (Form event code:C388=On Losing Focus:K2:8)
		//OBJECT SET RGB COLORS(*; "objPrice1"; UTIL_4DColorToHex(Black); UTIL_4DColorToHex(White))
		[Sales:2]Barcode:9:=StripSpaces([Sales:2]Barcode:9)
		
		If ([Sales:2]Barcode:9#"")
			
			If (Length:C16([Sales:2]Barcode:9)<11)
				//OLD BARCODE*************************************
				
				vFoundinArray2:=Find in array:C230(asBarcodeItemNumbers; Num:C11([Sales:2]Barcode:9))
				If (vFoundinArray2=-1)
					
					
					//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
					BEEP:C151
					MessageBox(" "; "No item was found in the Inventory table with that Item Number.  You will need to manually enter that item number."; "OKBox"; "red")
					
					//back tab to the field
					//POST KEY(Character code(Char(9));Shift key mask;Current process)  //3/12/15
					vTagItemNumber:=0  //3/12/15
					[Sales:2]Barcode:9:=""  //3/12/15
				Else 
					vTagItemNumber:=Num:C11([Sales:2]Barcode:9)
					vInArray:=Find in array:C230(asItemsInBatch; vTagItemNumber)
					
					
					If (vInArray=-1)  //No ItemNumber in current batch
						//Add ItemNumber to the array
						$vlElem:=Size of array:C274(asItemsInBatch)+1
						INSERT IN ARRAY:C227(asItemsInBatch; $vlElem)
						asItemsInBatch{$vlElem}:=vTagItemNumber
						
						QUERY:C277([Inventory:4]; [Inventory:4]Barcode Item Number:1=Num:C11([Sales:2]Barcode:9))
						If (Records in selection:C76([Inventory:4])=1)
							[Sales:2]Consignor Number:6:=[Inventory:4]Consignor Number:3
							[Sales:2]Item Description:4:=[Inventory:4]Item Description:4
							[Sales:2]List Price:3:=[Inventory:4]Price:6
							[Sales:2]Category:14:=[Inventory:4]Category:8
							vReduce:=[Inventory:4]Reduce:7
							If (vReduce=True:C214)
								Case of 
									: ([Point of Sale:5]ReduceBy:8=25)
										vPercentOff:=0.75
									: ([Point of Sale:5]ReduceBy:8=50)
										vPercentOff:=0.5
									: ([Point of Sale:5]ReduceBy:8=75)
										vPercentOff:=0.25
									Else 
										vPercentOff:=1
								End case 
								
								[Sales:2]Sold Price:2:=[Inventory:4]Price:6*vPercentOff
								
								[Sales:2]PercentOff:15:=String:C10([Point of Sale:5]ReduceBy:8)
								
								
								
							Else 
								[Sales:2]Sold Price:2:=[Inventory:4]Price:6
								[Sales:2]PercentOff:15:="0"
							End if 
							
							
							
							[Sales:2]Item Number:13:=Num:C11([Sales:2]Barcode:9)
							[Sales:2]Item Size:5:=[Inventory:4]Size:5
							[Sales:2]Entered Date Stamp:7:=Current date:C33
							[Sales:2]Entered Time Stamp:8:=Current time:C178
							[Sales:2]Entered By:10:=<>User
							[Sales:2]Sold Date:11:=vCal_Date1
							
							If (vTaxPrompt=True:C214)
								BEEP:C151
								//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
								MessageBox(" "; "Do you want to charge Tax on this item?"; "YesNoBox"; "red")
								If (ok=1)
									[Sales:2]Taxed:16:="T"
									[Sales:2]TaxAmount:17:=[Sales:2]Sold Price:2*vTaxRate2
								Else 
									[Sales:2]Taxed:16:=""
								End if 
							Else 
								[Sales:2]Taxed:16:="T"
								[Sales:2]TaxAmount:17:=[Sales:2]Sold Price:2*vTaxRate2
								
							End if 
							
							//removed in version 8.0 because not used
							//GetSequenceNums ("Sales")
							//v12
							//[Sales]Unique Entry ID:=[Point of Sale]Batch ID+"-"+String(vSalesSequenceNumber)
							[Sales:2]Unique Entry ID:1:=Generate UUID:C1066
							
							BEEP:C151
							//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
							MessageBox(" "; "Please verify that the correct Consignor Number, Price,  and Reduce By was scanne"+"d."; "OKBox"; "green")
							vCountIt:=vCountIt+1
						End if 
					Else 
						//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
						BEEP:C151
						MessageBox(" "; "You have already scanned that tag."; "OKBox"; "red")
						//back tab to the field
						POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
						
					End if 
					
					
				End if 
				
				
				
				
			Else 
				//NEW BARCODE*************************************
				
				//Parse out barcode ********************************** 
				vtempBarcode:=""
				vtempBarcode:=[Sales:2]Barcode:9
				//ConsignorNumber
				vPos1:=Position:C15("-"; vtempBarcode; 1; *)
				//vlResult := Position ("DAY"; "Today is the first day";1;*)
				vConsignorNumber:=Substring:C12(vtempBarcode; 1; (vPos1-1))
				vtempBarcode:=Substring:C12(vtempBarcode; (vPos1+1))
				
				//Price
				vPos2:=Position:C15("-"; vtempBarcode; 1; *)
				vPrice:=Substring:C12(vtempBarcode; 1; (vPos2-1))
				vtempBarcode:=Substring:C12(vtempBarcode; (vPos2+1))
				
				//reduce
				vPos3:=Position:C15("-"; vtempBarcode; 1; *)
				vTagReduce:=Substring:C12(vtempBarcode; 1; (vPos3-1))
				vtempBarcode:=Substring:C12(vtempBarcode; (vPos3+1))
				
				If (vTagReduce="1")
					vReduce:=True:C214
				Else 
					vReduce:=False:C215
				End if 
				vTagItemNumber:=Num:C11(vtempBarcode)
				//end parse
				
				If (vTagReduce#"") & (vPrice#"") & (vConsignorNumber#"")
					
					vInArray:=Find in array:C230(asItemsInBatch; vTagItemNumber)
					If (vInArray=-1)  //No ItemNumber in current batch
						//Add ItemNumber to the array
						$vlElem:=Size of array:C274(asItemsInBatch)+1
						INSERT IN ARRAY:C227(asItemsInBatch; $vlElem)
						asItemsInBatch{$vlElem}:=vTagItemNumber
						
						
						[Sales:2]Consignor Number:6:=vConsignorNumber
						[Sales:2]List Price:3:=Num:C11(vPrice)
						If (vReduce=True:C214)
							Case of 
								: ([Point of Sale:5]ReduceBy:8=25)
									vPercentOff:=0.75
								: ([Point of Sale:5]ReduceBy:8=50)
									vPercentOff:=0.5
								: ([Point of Sale:5]ReduceBy:8=75)
									vPercentOff:=0.25
								Else 
									vPercentOff:=1
							End case 
							
							[Sales:2]Sold Price:2:=Round:C94(Num:C11(vPrice)*vPercentOff; 2)
							[Sales:2]PercentOff:15:=String:C10([Point of Sale:5]ReduceBy:8)
						Else 
							[Sales:2]Sold Price:2:=Round:C94(Num:C11(vPrice); 2)
							[Sales:2]PercentOff:15:="0"
						End if 
						[Sales:2]Entered Date Stamp:7:=Current date:C33
						[Sales:2]Entered Time Stamp:8:=Current time:C178
						[Sales:2]Entered By:10:=<>User
						[Sales:2]Sold Date:11:=vCal_Date1
						[Sales:2]Item Number:13:=vTagItemNumber
						
						
						
						If (vTaxPrompt=True:C214)
							//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
							BEEP:C151
							MessageBox(" "; "Do you want to charge Tax on this item?"; "YesNoBox"; "red")
							If (ok=1)
								[Sales:2]Taxed:16:="T"
								[Sales:2]TaxAmount:17:=[Sales:2]Sold Price:2*vTaxRate2
							Else 
								[Sales:2]Taxed:16:=""
							End if 
						Else 
							[Sales:2]Taxed:16:="T"
							[Sales:2]TaxAmount:17:=[Sales:2]Sold Price:2*vTaxRate2
						End if 
						
						//removed in version 8.0 because not used
						//GetSequenceNums ("Sales")
						//v12
						//[Sales]Unique Entry ID:=[Point of Sale]Batch ID+"-"+String(vSalesSequenceNumber)
						[Sales:2]Unique Entry ID:1:=Generate UUID:C1066
						//v12
						vCountIt:=vCountIt+1
						
						//v9.1a
						vInventoryPrice:=0
						vInventoryReduce:=False:C215
						//end
						
						QUERY:C277([Inventory:4]; [Inventory:4]Barcode Item Number:1=[Sales:2]Item Number:13)
						
						If (Records in selection:C76([Inventory:4])=1)
							
							[Sales:2]Item Description:4:=[Inventory:4]Item Description:4
							[Sales:2]Item Size:5:=[Inventory:4]Size:5
							[Sales:2]Category:14:=[Inventory:4]Category:8
							//v9.1a
							vInventoryPrice:=[Inventory:4]Price:6
							vInventoryReduce:=[Inventory:4]Reduce:7
							// end
							
							
							//Added for 9.1a
							
							
							If (vVerifyTag=True:C214)
								If (vInventoryPrice#[Sales:2]List Price:3)
									BEEP:C151
									MessageBox(" "; "Tag Price does not match Inventory Price.  Please verify the price on the tag."; "OKBox"; "red")
								End if 
								If (vPercentOff#1)  //It's half price day
									If (vInventoryReduce#vReduce)
										BEEP:C151
										MessageBox(" "; "Tag Reduce does not match Inventory Reduce.  Please verify if the tag should be reduced."; "OKBox"; "red")
									End if 
								End if 
							End if 
							//end
							//Added for 9.0
						End if 
						
						
						If ([Sales:2]Sold Price:2=0)
							BEEP:C151
							MessageBox(" "; "Tag scanned with $0 Price."; "OKBox"; "red")
						End if 
						
					Else 
						//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
						BEEP:C151
						MessageBox(" "; "You have already scanned that tag."; "OKBox"; "red")
						//back tab to the field
						//POST KEY(Ascii(Char(9));Shift key mask ;Current process)
						//POST KEY(Tab Key;Shift key mask)    //3/12/15
						vTagItemNumber:=0  //3/12/15
						[Sales:2]Barcode:9:=""  //3/12/15
						REDRAW WINDOW:C456
					End if 
				Else 
					BEEP:C151
					MessageBox(" "; "That is not a valid barcode."; "OKBox"; "red")
					//back tab to the field
					//POST KEY(Ascii(Char(9));Shift key mask ;Current process)
					//POST KEY(Tab Key;Shift key mask)    //3/12/15
					vTagItemNumber:=0  //3/12/15
					[Sales:2]Barcode:9:=""  //3/12/15
					REDRAW WINDOW:C456
				End if 
				
			End if 
			
		End if 
		Sales_RecalculateTotals
	Else 
		
		
End case 

