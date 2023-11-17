
//Case of 
//: (Form event=On Losing Focus)
//ACCEPT
//End case 

//If (Form event=On After Keystroke)
//
//If (Character code(Get edited text)=Carriage return)
//ACCEPT
//End if 
//End if 



Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		OBJECT SET RGB COLORS:C628(vCCSwipe; UTIL_4DColorToHex(Black:K11:16); UTIL_4DColorToHex(1))
		
	: (Form event code:C388=On After Edit:K2:43)
		//Delay Process(current process;180)
		OBJECT SET RGB COLORS:C628(vCCSwipe; UTIL_4DColorToHex(Black:K11:16); UTIL_4DColorToHex(66))
		OBJECT SET VISIBLE:C603(bGo; True:C214)
		
		Case of 
			: (Character code:C91(Keystroke:C390)=Carriage return:K15:38)
				
				
				OBJECT GET COORDINATES:C663(*; "bGo"; $left; $top; $right; $bottom)
				POST CLICK:C466($left+5; $top+5; Current process:C322)
				
				//vccswipe
				//ACCEPT
		End case 
		
	: (Form event code:C388=On Losing Focus:K2:8)
		
		
		//Case of 
		//: (Form event=On After Keystroke)
		//End case 
		
		//ACCEPT
		//: (Form event=On Data Change)
		//
		//Case of 
		//: (Character code(Keystroke)=Carriage return)
		//
		//POST KEY(Tab)
		//POST KEY(Line feed)
		//POST KEY(Enter Key)
		//
		//
		//  //vccswipe
		//  //ACCEPT
		//End case 
		//OBJECT SET COLOR(vCCSwipe;-(Black+(256*(66))))
		//OBJECT SET VISIBLE(bGo;True)
		//  //ACCEPT
		
		//: (Form event=On After Keystroke)
		//OBJECT SET COLOR(vCCSwipe;-(Black+(256*(66))))
		//OBJECT SET VISIBLE(bGo;True)
		//  //ACCEPT
		
End case 
//
//If (Form event=On Load)
//SET TIMER(60*3)
//End if 
//
//If (Form event=On Timer)
//BEEP
//End if 
