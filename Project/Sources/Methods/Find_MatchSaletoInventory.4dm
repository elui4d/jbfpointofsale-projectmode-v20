//%attributes = {}

vChangeit:=0
ARRAY LONGINT:C221(aDups; 0)



ALL RECORDS:C47([Sales:2])
QUERY:C277([Sales:2]; [Sales:2]Item Number:13>0)

//NEXT RECORD([Sales])
Message_Think("Searching, please wait... ")
For ($i; 1; Records in selection:C76([Sales:2]))
	
	QUERY:C277([Inventory:4]; [Inventory:4]Barcode Item Number:1=[Sales:2]Item Number:13)
	
	If (Records in selection:C76([Inventory:4])>0)
		
		//Don't need to check Price
		//if([Inventory]Consignor Number#[sales]Consignor Number)|([Inventory]Price#[Sales]List Price)
		If ([Inventory:4]Consignor Number:3#[Sales:2]Consignor Number:6)
			
			$vlElem:=Size of array:C274(aDups)+1
			INSERT IN ARRAY:C227(aDups; $vlElem)
			aDups{$vlElem}:=[Sales:2]Item Number:13
			
		End if 
		
		
		
	End if 
	
	
	NEXT RECORD:C51([Sales:2])
	
End for 

If (Size of array:C274(aDups)>0)
	vMismatches:=String:C10(Size of array:C274(aDups))
	//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox"), 4=TextColor       
	MessageBox(""; "There were "+vMismatches+" mismatched items found.  Click YES to fix the mismatches and print the list.  Click NO to print the list.  If you click YES, you will not be able to print the list again."; "YesNoBox"; "Blue")
	If (OK=1)
		vChangeit:=1
	End if 
	
	SET PRINT OPTION:C733(2; 1)  //Port
	PRINT SETTINGS:C106
	
	QUERY WITH ARRAY:C644([Sales:2]Item Number:13; aDups)
	
	vReportTitle:="Mismatched Consignor Numbers"
	vNumberOfRecordsLabel:="Number of Records:  "+String:C10(Records in selection:C76([Sales:2]))
	vPageNo:=1
	vPageNoLabel:="Page:  "+String:C10(vPageNo)
	vDate:=Current date:C33
	vjSaleItemNumber:=0
	vjSaleBarcode:=""
	vjSaleConsignor:=""
	vjSalePrice:=0
	vjSaleSold:=0
	vjInvItemNumber:=0
	vjInvConsignor:=""
	vjInvPrice:=0
	
	
	//Print Header
	Print form:C5([Sales:2]; "Print_Inventory_Sales_Mismatch"; 200)
	
	For ($j; 1; Records in selection:C76([Sales:2]))
		vjSaleItemNumber:=[Sales:2]Item Number:13
		vjSaleBarcode:=[Sales:2]Barcode:9
		vjSaleConsignor:=[Sales:2]Consignor Number:6
		vjSalePrice:=[Sales:2]List Price:3
		vjSaleSold:=[Sales:2]Sold Price:2
		QUERY:C277([Inventory:4]; [Inventory:4]Barcode Item Number:1=[Sales:2]Item Number:13)
		vjInvItemNumber:=[Inventory:4]Barcode Item Number:1
		vjInvConsignor:=[Inventory:4]Consignor Number:3
		vjInvPrice:=[Inventory:4]Price:6
		
		//Print Detail
		If (Get printed height:C702>700)
			Print form:C5([Sales:2]; "Print_Inventory_Sales_Mismatch"; 300)
			Print form:C5([Sales:2]; "Print_Inventory_Sales_Mismatch"; 100)
			
			//new for v12
			PAGE BREAK:C6(>)
			Print form:C5([Sales:2]; "Print_Inventory_Sales_Mismatch"; 200)
			vPageNo:=vPageNo+1
			vPageNoLabel:="Page:  "+String:C10(vPageNo)
		End if 
		
		Print form:C5([Sales:2]; "Print_Inventory_Sales_Mismatch"; 0)
		
		If (vChangeit=1)
			[Sales:2]Consignor Number:6:=[Inventory:4]Consignor Number:3
			SAVE RECORD:C53([Sales:2])
		End if 
		
		
		NEXT RECORD:C51([Sales:2])
		
	End for 
	
	Print form:C5([Sales:2]; "Print_Inventory_Sales_Mismatch"; 300)
	Print form:C5([Sales:2]; "Print_Inventory_Sales_Mismatch"; 100)
	PAGE BREAK:C6
	
	
Else 
	//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox"), 4=TextColor       
	MessageBox(""; "No mismatched items found."; "OKBox"; "Blue")
	ALL RECORDS:C47([Sales:2])
End if 




