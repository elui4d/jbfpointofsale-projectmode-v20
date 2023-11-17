//%attributes = {}
QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
If (Records in selection:C76([Preferences:3])>0)
	vVerifyInventory:=[Preferences:3]VerifyInventory:24
End if 
UNLOAD RECORD:C212([Preferences:3])


If (Length:C16(vConsignorNumber)#0)
	If (Length:C16(vConsignorNumber)>8)
		
		//If barcode is scanned, parse out consignor number
		vPos1:=Position:C15("-"; vConsignorNumber)
		vConsignorNumber:=Substring:C12(vConsignorNumber; 1; (vPos1-1))
		
	End if 
	
	
	QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=vConsignorNumber)
	If (Records in selection:C76([Consignors:1])=1)
		
		If ([Consignors:1]Picked Up:25=True:C214)
			cbPickUp:=1
		Else 
			cbPickUp:=0
		End if 
		
		If ([Consignors:1]Consigning this sale:16=True:C214)
			cbConsigning:=1
		Else 
			cbConsigning:=0
		End if 
		
		If ([Consignors:1]Volunteer:26=True:C214)
			cbVolunteering:=1
		Else 
			cbVolunteering:=0
		End if 
		
		If ([Consignors:1]Valet:36=True:C214)
			cbValet:=1
		Else 
			cbValet:=0
		End if 
		
		Case of 
			: (rbCheckIn=1)
				cbConsigning:=1
			: (rbCheckOut=1)
				cbPickUp:=1
		End case 
		
		If ([Consignors:1]Donating:34=True:C214)
			cbDonating:=1
		Else 
			cbDonating:=0
		End if 
		
		If ([Consignors:1]Envelope:15=True:C214)
			cbEnvelope:=1
		Else 
			cbEnvelope:=0
		End if 
		
		REDRAW:C174(cbEnvelope)
		REDRAW:C174(cbConsigning)
		REDRAW:C174(cbPickUp)
		REDRAW:C174(cbValet)
		vCheckInAddress1:=[Consignors:1]Address1:4
		vCheckInAddress2:=[Consignors:1]filler:5
		vCheckInCellPhone:=[Consignors:1]Cell Phone:10
		vCheckInCity:=[Consignors:1]City:6
		vCheckInConsignorNumber:=[Consignors:1]Consignor Number:1
		vCheckInEmailAddress:=[Consignors:1]Email Address:13
		vCheckInEnvelope:=[Consignors:1]Envelope:15
		vCheckInFirstName:=[Consignors:1]First Name:2
		vCheckInHomePhone:=[Consignors:1]Home Phone:9
		vCheckInLastName:=[Consignors:1]Last Name:3
		vCheckInState:=[Consignors:1]State:7
		vCheckInWorkPhone:=[Consignors:1]Work Phone:11
		vCheckInZip:=[Consignors:1]Zip:8
		vConsignorComments:=[Consignors:1]Comment:24
		
		If (rbCheckIn=1)
			If ([Consignors:1]Consigning this sale:16=True:C214)
				
				//	  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
				MessageBox(""; "WARNING:  Consignor "+vConsignorNumber+" has already been checked in.  Please verify that the consignor has the correct n"+"umber and that this is not a duplicate consignor number."; "OKBox"; "Red")
				
				//back tab to the field
				POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
				
			Else 
				[Consignors:1]Consigning this sale:16:=True:C214
				SAVE RECORD:C53([Consignors:1])
				
				//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox"), 4=TextColor       
				
				MessageBox(""; "Consignor "+vConsignorNumber+" has been checked in.  Please verify the consignors contact information."; "OKBox"; "Green")
				
				//back tab to the field
				POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
				
			End if 
			
			If (vVerifyInventory=True:C214)
				QUERY:C277([Inventory:4]; [Inventory:4]Consignor Number:3=vConsignorNumber)
				If (Records in selection:C76([Inventory:4])>0)
					MessageBox(""; "This consignor has "+String:C10(Records in selection:C76([Inventory:4]))+" items in Inventory."; "OKBox"; "green")
				Else 
					MessageBox(""; "WARNING:  This consignor has "+String:C10(Records in selection:C76([Inventory:4]))+" items in Inventory."; "OKBox"; "red")
				End if 
				vConsignorNumber:=""
				//back tab to the field
				POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
			End if 
			
		End if 
		
		If (rbCheckOut=1)
			If ([Consignors:1]Picked Up:25=True:C214)
				
				//	  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
				MessageBox(""; "WARNING:  Consignor "+vConsignorNumber+" has already been checked out.  Please verify that the consignor has the corr"+"ect n"+"umber and that this is not a duplicate consignor number."; "OKBox"; "Red")
				vConsignorNumber:=""
				//back tab to the field
				POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
				
			Else 
				[Consignors:1]Picked Up:25:=True:C214
				SAVE RECORD:C53([Consignors:1])
				
				//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox"), 4=TextColor       
				
				MessageBox(""; "Consignor "+vConsignorNumber+" has now checked out.  Please verify the consignors contact information."; "OKBox"; "Green")
				vConsignorNumber:=""
				//back tab to the field
				POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
				
			End if 
		End if 
		
	Else 
		cbDonating:=0
		cbValet:=0
		cbConsigning:=0
		cbPickUp:=0
		cbVolunteer:=0
		cbEnvelope:=0
		vCheckInAddress1:=""
		vCheckInAddress2:=""
		vCheckInCellPhone:=""
		vCheckInCity:=""
		vCheckInConsignorNumber:=""
		vCheckInEmailAddress:=""
		vCheckInEnvelope:=False:C215
		vCheckInFirstName:=""
		vCheckInHomePhone:=""
		vCheckInLastName:=""
		vCheckInState:=""
		vCheckInWorkPhone:=""
		vCheckInZip:=""
		vConsignorNumber:=""
		
		
		//	  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
		MessageBox(""; "There is not a consignor in the Consignors Table with that number."; "OKBox"; "green")
		vConsignorNumber:=""
		//back tab to the field
		POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
		
		
		
		
	End if 
Else 
	//Do Nothing if nothing entered
End if 