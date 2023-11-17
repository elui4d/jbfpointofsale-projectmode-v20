
Case of 
		
		
		
	: (Form event code:C388=On Getting Focus:K2:7)
		
		Case of 
			: (vTempFail=1)
				//GOTO AREA([Sales]Tag Price)
				//REDRAW WINDOW
				//POST KEY(Ascii(Char(9));Shift key mask ;Current process)
				
				//back tab to the field
				//NEW 02/03/08
				POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
			: (vTempFail=2)
				GOTO OBJECT:C206([Sales:2]Consignor Number:6)
				GOTO OBJECT:C206(*; "Cnum")
				//REDRAW WINDOW
				//DELETE RECORD([Sales])
				//REJECT([Sales]Tag Price)
				//POST KEY(Ascii(Char(9));Shift key mask ;Current process)
				
				
				//Go to next line
				//GET OBJECT RECT(*;"EnterSales";$left;$top;$right;$bottom)
				//POST CLICK($left+5;$top+5;Current process)
				//POST KEY(Ascii("/");Command key mask ;Current process)
				//
				//GET OBJECT RECT(*;"bAddSales";$left;$top;$right;$bottom)
				//POST CLICK($left+5;$top+5;Current process)
				
				REDRAW WINDOW:C456
				
			Else 
				
				POST KEY:C465(Character code:C91(Char:C90(9)); Current process:C322)
				
				//Go to next line
				//GET OBJECT RECT(*;"EnterSales";$left;$top;$right;$bottom)
				//POST CLICK($left+5;$top+5;Current process)
				//POST KEY(Ascii("/");Command key mask ;Current process)
				//
				//GET OBJECT RECT(*;"bAddSales";$left;$top;$right;$bottom)
				//POST CLICK($left+5;$top+5;Current process)
				
		End case 
		
		//GET OBJECT RECT(*;"bDeleteSales";$left;$top;$right;$bottom)
		//POST CLICK($left+5;$top+5;Current process)
		
End case 
