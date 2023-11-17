//%attributes = {}


If (Length:C16(vConsignorNumber)#0)
	If (Length:C16(vConsignorNumber)>8)
		
		//If barcode is scanned, parse out consignor number
		vPos1:=Position:C15("-"; vConsignorNumber)
		vConsignorNumber:=Substring:C12(vConsignorNumber; 1; (vPos1-1))
		
	End if 
	
	
	QUERY:C277([Volunteers:9]; [Volunteers:9]Consignor Number:1=vConsignorNumber)
	If (Records in selection:C76([Volunteers:9])>0)
		
		vCheckInConsignorNumber:=[Volunteers:9]Consignor Number:1
		vCheckInFirstName:=[Volunteers:9]First Name:2
		vCheckInLastName:=[Volunteers:9]Last Name:3
		
		
		SELECTION TO ARRAY:C260([Volunteers:9]Shift Name:4; aShift)
		//INSERT ELEMENT(aShift;1)
		//aShift{1}:=" --- Select a Shift --- "
		//aShift:=1
		SELECTION TO ARRAY:C260([Volunteers:9]Date:6; aShiftDate)
		SELECTION TO ARRAY:C260([Volunteers:9]Scheduled Time:7; aShiftTime)
		SELECTION TO ARRAY:C260([Volunteers:9]In Time:8; aTimeIn)
		SELECTION TO ARRAY:C260([Volunteers:9]Out Time:9; aTimeOut)
		SELECTION TO ARRAY:C260([Volunteers:9]Complete:10; aCompleted)
		
		
		
		
		//If (rbCheckIn=1)
		//If ([Consignors]Consigning this sale=True)
		//
		//  `	  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
		//MessageBox ("";"WARNING:  Consignor "+vConsignorNumber+" has already been checked in.  Please verify that the consignor has the correct n"+"umber and that this is not a duplicate consignor number.";"OKBox";"Red")
		//vConsignorNumber:=""
		//  `back tab to the field
		//POST KEY(Ascii(Char(9));Shift key mask ;Current process)
		//
		//Else 
		//[Consignors]Consigning this sale:=True
		//SAVE RECORD([Consignors])
		//
		//  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox"), 4=TextColor       
		//
		//MessageBox ("";"Consignor "+vConsignorNumber+" has been checked in.  Please verify the consignors contact information.";"OKBox";"Green")
		//vConsignorNumber:=""
		//  `back tab to the field
		//POST KEY(Ascii(Char(9));Shift key mask ;Current process)
		//
		//End if 
		//End if 
		
		//If (rbCheckOut=1)
		//If ([Consignors]Picked Up=True)
		//
		//  `	  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
		//MessageBox ("";"WARNING:  Consignor "+vConsignorNumber+" has already been checked out.  Please verify that the consignor has the corr"+"ect n"+"umber and that this is not a duplicate consignor number.";"OKBox";"Red")
		//vConsignorNumber:=""
		//  `back tab to the field
		//POST KEY(Ascii(Char(9));Shift key mask ;Current process)
		//
		//Else 
		//[Consignors]Picked Up:=True
		//SAVE RECORD([Consignors])
		//
		//  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox"), 4=TextColor       
		//
		//MessageBox ("";"Consignor "+vConsignorNumber+" has now checked out.  Please verify the consignors contact information.";"OKBox";"Green")
		//vConsignorNumber:=""
		//  `back tab to the field
		//POST KEY(Ascii(Char(9));Shift key mask ;Current process)
		//
		//End if 
		//End if 
		
	Else 
		vCheckInConsignorNumber:=""
		vCheckInFirstName:=""
		vCheckInLastName:=""
		
		
		//	  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
		MessageBox(""; "There is not a shift in the Volunteers Table with that consignor number."; "OKBox"; "green")
		vConsignorNumber:=""
		//back tab to the field
		POST KEY:C465(Character code:C91(Char:C90(9)); Shift key mask:K16:3; Current process:C322)
	End if 
Else 
	//Do Nothing if nothing entered
End if 