//%attributes = {}
//<>TablePointer:=Current form table

Case of 
	: (<>TablePointer=(->[Dialogs:7]))
	: (<>TablePointer=(->[INTERFACE:8]))
	Else 
		CREATE SET:C116(<>TablePointer->; "PreviousSelection")
		
		//Change Input Form to Query Type
		FORM SET INPUT:C55(<>TablePointer->; "Input2")
		SET AUTOMATIC RELATIONS:C310(True:C214; True:C214)
		QUERY BY EXAMPLE:C292(<>TablePointer->; *)  // Do the query.
		SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)
		//MENU BAR(2)
		//Change Input Form to Input Type
		FORM SET INPUT:C55(<>TablePointer->; "Input")
		
		Case of 
			: (<>TablePointer=(->[Point of Sale:5]))
				ORDER BY:C49([Point of Sale:5]; [Point of Sale:5]Entered Date Stamp:4; <; [Point of Sale:5]Entered Time Stamp:3; <)
		End case 
		
End case 