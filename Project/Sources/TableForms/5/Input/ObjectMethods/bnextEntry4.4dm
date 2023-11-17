Case of 
	: (Form event code:C388=On Clicked:K2:4)
		OBJECT GET COORDINATES:C663(*; "EnterBarcodes2"; $left; $top; $right; $bottom)
		POST CLICK:C466($left+5; $top+5; Current process:C322)
		POST KEY:C465(Character code:C91("/"); Command key mask:K16:1; Current process:C322)
		
		OBJECT GET COORDINATES:C663(*; "bAddSales4"; $left; $top; $right; $bottom)
		POST CLICK:C466($left+1; $top+1; Current process:C322)
		
	: (Form event code:C388=On Getting Focus:K2:7)
		OBJECT GET COORDINATES:C663(*; "EnterBarcodes2"; $left; $top; $right; $bottom)
		POST CLICK:C466($left+5; $top+5; Current process:C322)
		POST KEY:C465(Character code:C91("/"); Command key mask:K16:1; Current process:C322)
		
		OBJECT GET COORDINATES:C663(*; "bAddSales4"; $left; $top; $right; $bottom)
		POST CLICK:C466($left+1; $top+1; Current process:C322)
		
End case 

//OBJECT GET COORDINATES(*; "EnterBarcodes2"; $left; $top; $right; $bottom)
//POST CLICK($left+5; $top+5; Current process)
//POST KEY(Character code("/"); Command key mask; Current process)

//OBJECT GET COORDINATES(*; "bAddSales4"; $left; $top; $right; $bottom)
//POST CLICK($left+5; $top+5; Current process)

//// Erick

