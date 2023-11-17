CREATE RECORD:C68([Volunteers:9])

[Volunteers:9]Pay Rate:13:=vPayRate
[Volunteers:9]Shift Name:4:=vShiftName
[Volunteers:9]Category:5:=vCategory
[Volunteers:9]Date:6:=vDate
[Volunteers:9]Scheduled Time:7:=vScheduledTime
[Volunteers:9]Paid Job:12:=vPaidJob
[Volunteers:9]Consignor Number:1:=vCheckInConsignorNumber
[Volunteers:9]First Name:2:=vCheckInFirstName
[Volunteers:9]Last Name:3:=vCheckInLastName
[Volunteers:9]Comments:11:=vConsignorComments

SAVE RECORD:C53([Volunteers:9])

QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=vCheckInConsignorNumber)
If (Records in selection:C76([Consignors:1])=0)
	
	CREATE RECORD:C68([Consignors:1])
	
	[Consignors:1]Consignor Number:1:=vCheckInConsignorNumber
	[Consignors:1]First Name:2:=vCheckInFirstName
	[Consignors:1]Last Name:3:=vCheckInLastName
	[Consignors:1]Volunteer:26:=True:C214
	[Consignors:1]Comment:24:="This came from a new volunteer who was not in our system."
	
	SAVE RECORD:C53([Consignors:1])
	UNLOAD RECORD:C212([Consignors:1])
	
End if 

vConsignorNumber:=vCheckInConsignorNumber

CheckInVolunteerCode

CANCEL:C270
