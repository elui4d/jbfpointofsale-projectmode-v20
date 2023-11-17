Case of 
	: (vEditType="ADD")
		ALL RECORDS:C47([Consignors:1])
		CREATE RECORD:C68([Consignors:1])
		[Consignors:1]Consignor Number:1:=vConsignorNumber
		[Consignors:1]Last Name:3:=vLastName
		[Consignors:1]First Name:2:=vFirstName
		//Always active if added this way
		[Consignors:1]Consigning this sale:16:=True:C214
		
		
		
		QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
		If (Records in selection:C76([Preferences:3])>0)
			[Consignors:1]Consignor Fee:17:=[Preferences:3]DefaultConsignorFee:2
			[Consignors:1]Percent:14:=[Preferences:3]DefaultConsignorPercent:3
		End if 
		UNLOAD RECORD:C212([Preferences:3])
		
	: (vEditType="EDIT")
		[Consignors:1]Consignor Number:1:=vConsignorNumber
		[Consignors:1]Last Name:3:=vLastName
		[Consignors:1]First Name:2:=vFirstName
		//Always active if added this way
		[Consignors:1]Consigning this sale:16:=True:C214
End case 

SAVE RECORD:C53([Consignors:1])
UNLOAD RECORD:C212([Consignors:1])

ALL RECORDS:C47([Consignors:1])
DISTINCT VALUES:C339([Consignors:1]Consignor Number:1; asConsignorNumbers)

QUERY:C277([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)
DISTINCT VALUES:C339([Consignors:1]Consignor Number:1; asActiveConsignorNumbers)


CLOSE WINDOW:C154