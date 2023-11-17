C_LONGINT:C283(vTempTime)

[Volunteers:9]Out Time:9:=String:C10(Current time:C178)
[Volunteers:9]Complete:10:=True:C214
[Volunteers:9]Comments:11:=vConsignorComments

[Volunteers:9]TimeWorked:16:=Time:C179([Volunteers:9]Out Time:9)-Time:C179([Volunteers:9]In Time:8)

vTempTime:=Time:C179([Volunteers:9]Out Time:9)-Time:C179([Volunteers:9]In Time:8)
vPayRatePerMinute:=([Volunteers:9]Pay Rate:13/60)  //Pay per minute
vTimeWorkedinMinutes:=vTempTime/60  //Minutes worked

vMoneyEarned:=vTimeWorkedinMinutes*vPayRatePerMinute
[Volunteers:9]Money Earned:15:=Round:C94(vMoneyEarned; 2)
SAVE RECORD:C53([Volunteers:9])

QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
vDefaultVolunteerFee:=[Preferences:3]DefaultVolunteerFee:13
vDefaultVolunteerPercent:=[Preferences:3]DefaultVolunteerPercent:14
UNLOAD RECORD:C212([Preferences:3])

QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=vConsignorNumber)
If (Records in selection:C76([Consignors:1])=1)
	[Consignors:1]Volunteer:26:=True:C214
	[Consignors:1]Consignor Fee:17:=vDefaultVolunteerFee
	[Consignors:1]Percent:14:=vDefaultVolunteerPercent
	
	SAVE RECORD:C53([Consignors:1])
	UNLOAD RECORD:C212([Consignors:1])
Else 
	If (Records in selection:C76([Consignors:1])=0)  //Put this here in case the volunteer table contains people not in the consingor list
		CREATE RECORD:C68([Consignors:1])
		[Consignors:1]Consignor Number:1:=[Volunteers:9]Consignor Number:1
		[Consignors:1]First Name:2:=[Volunteers:9]First Name:2
		[Consignors:1]Last Name:3:=[Volunteers:9]Last Name:3
		[Consignors:1]Address1:4:="This record was added from the Volunteer import."
		[Consignors:1]Volunteer:26:=True:C214
		
		
		
		[Consignors:1]Consignor Fee:17:=vDefaultVolunteerFee
		[Consignors:1]Percent:14:=vDefaultVolunteerPercent
		
		
		SAVE RECORD:C53([Consignors:1])
		UNLOAD RECORD:C212([Consignors:1])
	End if 
End if 

CANCEL:C270

