//%attributes = {}
QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
vDefaultPayRate:=[Preferences:3]DefaultPayRate:12
vDefaultVolunteerFee:=[Preferences:3]DefaultVolunteerFee:13
vDefaultVolunteerPercent:=[Preferences:3]DefaultVolunteerPercent:14
UNLOAD RECORD:C212([Preferences:3])

QUERY:C277([Volunteers:9]; [Volunteers:9]Complete:10=True:C214)
For ($i; 1; Records in selection:C76([Volunteers:9]))
	
	QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=[Volunteers:9]Consignor Number:1)
	If (Records in selection:C76([Consignors:1])=1)
		[Consignors:1]Consignor Fee:17:=vDefaultVolunteerFee
		[Consignors:1]Percent:14:=vDefaultVolunteerPercent
		[Consignors:1]Volunteer:26:=True:C214
		SAVE RECORD:C53([Consignors:1])
		UNLOAD RECORD:C212([Consignors:1])
	End if 
	
	NEXT RECORD:C51([Volunteers:9])
	
End for 

QUERY:C277([Consignors:1]; [Consignors:1]Volunteer:26=True:C214)

If (Records in selection:C76([Consignors:1])>0)
	APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]Consignor Fee:17:=vDefaultVolunteerFee)
	APPLY TO SELECTION:C70([Consignors:1]; [Consignors:1]Percent:14:=vDefaultVolunteerPercent)
End if 


ALL RECORDS:C47([Consignors:1])






