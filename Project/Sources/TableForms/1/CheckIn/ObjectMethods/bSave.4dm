C_BOOLEAN:C305(vIsDataChanged)

vIsDataChanged:=False:C215

If (Records in selection:C76([Consignors:1])=1)
	If ([Consignors:1]Consignor Number:1#vCheckInConsignorNumber)
		[Consignors:1]Consignor Number:1:=vCheckInConsignorNumber
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]Address1:4#vCheckInAddress1)
		[Consignors:1]Address1:4:=vCheckInAddress1
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]filler:5#vCheckInAddress2)
		[Consignors:1]filler:5:=vCheckInAddress2
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]Cell Phone:10#vCheckInCellPhone)
		[Consignors:1]Cell Phone:10:=vCheckInCellPhone
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]City:6#vCheckInCity)
		[Consignors:1]City:6:=vCheckInCity
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]City:6#vCheckInCity)
		[Consignors:1]City:6:=vCheckInCity
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]Consignor Number:1#vCheckInConsignorNumber)
		[Consignors:1]Consignor Number:1:=vCheckInConsignorNumber
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]Email Address:13#vCheckInEmailAddress)
		[Consignors:1]Email Address:13:=vCheckInEmailAddress
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]Comment:24#vConsignorComments)
		[Consignors:1]Comment:24:=vConsignorComments
		vIsDataChanged:=False:C215
	End if 
	
	If ([Consignors:1]First Name:2#vCheckInFirstName)
		[Consignors:1]First Name:2:=vCheckInFirstName
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]Home Phone:9#vCheckInHomePhone)
		[Consignors:1]Home Phone:9:=vCheckInHomePhone
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]Last Name:3#vCheckInLastName)
		[Consignors:1]Last Name:3:=vCheckInLastName
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]State:7#vCheckInState)
		[Consignors:1]State:7:=vCheckInState
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]Work Phone:11#vCheckInWorkPhone)
		[Consignors:1]Work Phone:11:=vCheckInWorkPhone
		vIsDataChanged:=True:C214
	End if 
	If ([Consignors:1]Zip:8#vCheckInZip)
		[Consignors:1]Zip:8:=vCheckInZip
		vIsDataChanged:=True:C214
		
	End if 
	If (cbConsigning=1)
		[Consignors:1]Consigning this sale:16:=True:C214
	Else 
		[Consignors:1]Consigning this sale:16:=False:C215
	End if 
	If (cbEnvelope=1)
		[Consignors:1]Envelope:15:=True:C214
	Else 
		[Consignors:1]Envelope:15:=False:C215
	End if 
	If (cbDonating=1)
		[Consignors:1]Donating:34:=True:C214
	Else 
		[Consignors:1]Donating:34:=False:C215
	End if 
	If (cbVolunteering=1)
		[Consignors:1]Volunteer:26:=True:C214
	Else 
		[Consignors:1]Volunteer:26:=False:C215
	End if 
	If (cbValet=1)
		[Consignors:1]Valet:36:=True:C214
	Else 
		[Consignors:1]Valet:36:=False:C215
	End if 
	
	If (vIsDataChanged=True:C214)
		[Consignors:1]DataChanged:18:=True:C214
		
		
		
		SAVE RECORD:C53([Consignors:1])
		
		//	  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
		MessageBox(""; "Consignor "+vConsignorNumber+" has been updated."; "OKBox"; "green")
		
	Else 
		If (cbConsigning=1)
			[Consignors:1]Consigning this sale:16:=True:C214
		Else 
			[Consignors:1]Consigning this sale:16:=False:C215
		End if 
		If (cbEnvelope=1)
			[Consignors:1]Envelope:15:=True:C214
		Else 
			[Consignors:1]Envelope:15:=False:C215
		End if 
		If (cbPickup=1)
			[Consignors:1]Picked Up:25:=True:C214
		Else 
			[Consignors:1]Picked Up:25:=False:C215
		End if 
		If (cbDonating=1)
			[Consignors:1]Donating:34:=True:C214
		Else 
			[Consignors:1]Donating:34:=False:C215
		End if 
		If (cbVolunteering=1)
			[Consignors:1]Volunteer:26:=True:C214
		Else 
			[Consignors:1]Volunteer:26:=False:C215
		End if 
		If (cbValet=1)
			[Consignors:1]Valet:36:=True:C214
		Else 
			[Consignors:1]Valet:36:=False:C215
		End if 
		
		
		
		SAVE RECORD:C53([Consignors:1])
		
		
	End if 
	UNLOAD RECORD:C212([Consignors:1])
	//Clear
	cbDonating:=0
	cbValet:=0
	cbConsigning:=0
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
	cbPickUp:=0
	cbVolunteering:=0
	vConsignorComments:=""
	
Else 
	cbDonating:=0
	cbValet:=0
	cbConsigning:=0
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
	cbPickUp:=0
	cbVolunteering:=0
	vConsignorComments:=""
	
End if 

//ACCEPT