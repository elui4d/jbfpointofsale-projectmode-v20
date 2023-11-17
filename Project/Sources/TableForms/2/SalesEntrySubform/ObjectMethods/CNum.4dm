Case of 
		
	: (Form event code:C388=On Getting Focus:K2:7)
		//OBJECT SET RGB COLORS([Sales]Consignor Number; UTIL_4DColorToHex(Black); UTIL_4DColorToHex(66))
		
	: (Form event code:C388=On Losing Focus:K2:8)
		//OBJECT SET RGB COLORS([Sales]Consignor Number; UTIL_4DColorToHex(Black); UTIL_4DColorToHex(White))
		vQuitMethod:=0
		vEditType:=""
		vFail:=0
		vFirstName:=""
		vLastName:=""
		Case of 
			: ([Sales:2]Consignor Number:6="") & (ok=1)
				
				BEEP:C151
				//Open window(10;40;370;220)  ` Open a modal window 
				//vMessage:="You must enter a valid consignor number."
				//DIALOG([Dialogs];"OKBox")  ` Display a custom search dialog 
				//CLOSE WINDOW  ` No longer need the modal window 
				//back tab to the field
				
				
				POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
				
				//SET ENTERABLE([Sales]Tag Price;False)
				//GOTO AREA([Sales]Consignor Number)
			Else 
				
				//Make sure they are in the consignor DB
				vFoundinArray:=Find in array:C230(asActiveConsignorNumbers; [Sales:2]Consignor Number:6)
				
				If (vFoundinArray=-1)
					
					vFoundinArray2:=Find in array:C230(asConsignorNumbers; [Sales:2]Consignor Number:6)
					If (vFoundinArray2=-1)
						//********************************************
						//DOES NOT EXIST
						//********************************************
						vEditType:="ADD"
						//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
						MessageBox("Missing Consignor"; "That consignor number does not exist.  Would you like to add that consignor?"; "YesNoBox"; "red")
						CLOSE WINDOW:C154
						
						If (OK=1)
							vConsignorNumber:=[Sales:2]Consignor Number:6
							Open Centered window(370; 175; Movable dialog box:K34:7; " ")  // Open a modal window 
							DIALOG:C40([Dialogs:7]; "MissingConsignor")  // Display a custom search dialog 
							CLOSE WINDOW:C154  // No longer need the modal window 
							If (ok=0)
								vFail:=1
							End if 
						Else 
							vQuitMethod:=1
							vFail:=1
						End if 
						
					Else 
						//********************************************
						//NOT ACTIVE
						//********************************************
						vEditType:="EDIT"
						If (vQuitMethod#1)
							//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
							MessageBox("Missing Consignor"; "That consignor is not active.  Would you like to edit that consignor?"; "YesNoBox"; "red")
							CLOSE WINDOW:C154
							
							If (OK=1)
								QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=[Sales:2]Consignor Number:6)
								vConsignorNumber:=[Consignors:1]Consignor Number:1
								vFirstName:=[Consignors:1]First Name:2
								vLastName:=[Consignors:1]Last Name:3
								
								Open Centered window(370; 175; Movable dialog box:K34:7; " ")  // Open a modal window 
								DIALOG:C40([Dialogs:7]; "MissingConsignor")  // Display a custom search dialog 
								CLOSE WINDOW:C154  // No longer need the modal window 
								If (ok=0)
									vFail:=1
								End if 
							Else 
								vFail:=1
							End if 
						End if 
						
					End if 
					
					
				End if 
				
				If (vFail=1)
					POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
				End if 
				
		End case 
		
		
End case 