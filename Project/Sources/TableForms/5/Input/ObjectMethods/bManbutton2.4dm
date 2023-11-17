If (vCal_Date1=!00-00-00!)
	
	//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
	MessageBox("No Sold Date"; "You must select a Sold Date before you can enter tags."; "OKBox"; "red")
	
Else 
	
	ORDER BY:C49([Sales:2]; [Sales:2]Entered Time Stamp:8; >)
	FORM GOTO PAGE:C247(3)
	
	OBJECT GET COORDINATES:C663(*; "EnterSales"; $left; $top; $right; $bottom)
	POST CLICK:C466($left+5; $top+5; Current process:C322)
	POST KEY:C465(Character code:C91("/"); Command key mask:K16:1; Current process:C322)
	
	OBJECT GET COORDINATES:C663(*; "bAddSales"; $left; $top; $right; $bottom)
	POST CLICK:C466($left+5; $top+5; Current process:C322)
	
End if 
