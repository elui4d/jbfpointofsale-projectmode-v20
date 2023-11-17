//%attributes = {}
//Data Wizard
Open Centered window(675; 400; Movable dialog box:K34:7; " ")

DIALOG:C40([Dialogs:7]; "Tools_ChangeBatches")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 

If (ok=1)
	
	If (vCal_Date1#!00-00-00!)
		APPLY TO SELECTION:C70([Point of Sale:5]; [Point of Sale:5]Sold Date:5:=vCal_Date1)
		
		SELECTION TO ARRAY:C260([Point of Sale:5]Batch ID:1; asBatchID)
		
		QUERY WITH ARRAY:C644([Sales:2]Batch ID:12; asBatchID)
		
		APPLY TO SELECTION:C70([Sales:2]; [Sales:2]Sold Date:11:=vCal_Date1)
		
	End if 
	
	If (vChangeUser#"")
		
		APPLY TO SELECTION:C70([Point of Sale:5]; [Point of Sale:5]Entered By:2:=vChangeUser)
		
		SELECTION TO ARRAY:C260([Point of Sale:5]Batch ID:1; asBatchID)
		
		QUERY WITH ARRAY:C644([Sales:2]Batch ID:12; asBatchID)
		
		APPLY TO SELECTION:C70([Sales:2]; [Sales:2]Entered By:10:=vChangeUser)
		
	End if 
	
	If (vChangeComputer#"")
		DISTINCT VALUES:C339([Point of Sale:5]Computer Number:7; asComputerNumber)
		
		If (Size of array:C274(asComputerNumber)=1)
			
			//This has to be before we actually change the BatchID
			SELECTION TO ARRAY:C260([Point of Sale:5]Batch ID:1; asBatchID)
			
			APPLY TO SELECTION:C70([Point of Sale:5]; [Point of Sale:5]Computer Number:7:=vChangeComputer)
			
			APPLY TO SELECTION:C70([Point of Sale:5]; [Point of Sale:5]Batch ID:1:=vChangeComputer+Substring:C12([Point of Sale:5]Batch ID:1; 2))
			
			QUERY WITH ARRAY:C644([Sales:2]Batch ID:12; asBatchID)
			
			For ($i; 1; Records in selection:C76([Sales:2]))
				[Sales:2]Batch ID:12:=vChangeComputer+Substring:C12([Sales:2]Batch ID:12; 2)
				//v12
				//Not needed with uuid
				//[Sales]Unique Entry ID:=vChangeComputer+Substring([Sales]Unique Entry ID;2)
				SAVE RECORD:C53([Sales:2])
				NEXT RECORD:C51([Sales:2])
			End for 
		End if 
	End if 
	
	If (vChangeReduce#"")
		SELECTION TO ARRAY:C260([Point of Sale:5]Batch ID:1; asBatchID)
		
		APPLY TO SELECTION:C70([Point of Sale:5]; [Point of Sale:5]ReduceBy:8:=Num:C11(vChangeReduce))
		
		QUERY WITH ARRAY:C644([Sales:2]Batch ID:12; asBatchID)
		
		Case of 
			: (Num:C11(vChangeReduce)=25)
				vPercentOff:=0.75
			: (Num:C11(vChangeReduce)=50)
				vPercentOff:=0.5
			: (Num:C11(vChangeReduce)=75)
				vPercentOff:=0.25
			Else 
				vPercentOff:=1
		End case 
		
		For ($i; 1; Records in selection:C76([Sales:2]))
			If ([Sales:2]Item Number:13>0)
				
				QUERY:C277([Inventory:4]; [Inventory:4]Barcode Item Number:1=[Sales:2]Item Number:13)
				If (Records in selection:C76([Inventory:4])>0)
					If ([Inventory:4]Reduce:7=True:C214)
						[Sales:2]Sold Price:2:=[Inventory:4]Price:6*vPercentOff
					End if 
				End if 
				
			End if 
			SAVE RECORD:C53([Sales:2])
			NEXT RECORD:C51([Sales:2])
		End for 
		
		
		
		
		
		
	End if 
	
End if 