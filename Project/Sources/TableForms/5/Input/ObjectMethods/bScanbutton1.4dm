If (vCal_Date1=!00-00-00!)
	
	//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
	MessageBox("No Sold Date"; "You must select a Sold Date before you can enter tags."; "OKBox"; "red")
	
Else 
	
	ORDER BY:C49([Sales:2]; [Sales:2]Entered Time Stamp:8; >)
	FORM GOTO PAGE:C247(4)
	//
	//OBJECT GET COORDINATES(*;"EnterBarcodes2";$left;$top;$right;$bottom)
	//POST CLICK($left+5;$top+5;Current process)
	//POST KEY(Character code("/");Command key mask;Current process)
	//
	//OBJECT GET COORDINATES(*;"bAddSales4";$left;$top;$right;$bottom)
	//POST CLICK($left+5;$top+5;Current process)
End if 
