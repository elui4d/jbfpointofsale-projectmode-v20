bAdd:=0
bDelete:=0
Toolbar_Records


Case of 
	: (bAdd=1)
		Toolbar_AddNewRecord
		bAdd:=0
		
	: (bDelete=1)
		Toolbar_DeleteSelection
		bDelete:=0
		Case of 
			: (<>TablePointer=(->[Point of Sale:5]))
				ALL RECORDS:C47([Point of Sale:5])
				ORDER BY:C49([Point of Sale:5]; [Point of Sale:5]Entered Date Stamp:4; <; [Point of Sale:5]Entered Time Stamp:3; <)
		End case 
End case 

Toolbar_Setup