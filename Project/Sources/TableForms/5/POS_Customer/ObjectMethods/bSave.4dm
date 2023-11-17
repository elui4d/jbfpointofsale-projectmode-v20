[Point of Sale:5]Shopper Address1:11:=vCheckInAddress1
[Point of Sale:5]Shopper City:12:=vCheckInCity
[Point of Sale:5]Shopper First Name:9:=vCheckInFirstName
[Point of Sale:5]Shopper Phone:15:=vCheckInHomePhone
[Point of Sale:5]Shopper Last Name:10:=vCheckInLastName
[Point of Sale:5]Shopper State:13:=vCheckInState
[Point of Sale:5]Shopper Zip:14:=vCheckInZip
[Point of Sale:5]Shopper Email:27:=vCheckInEmail

If (Records in selection:C76([Consignors:1])=0)
	QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1="NewCust@")
	NewCustCounter:=Records in selection:C76([Consignors:1])+1
	vNewCust:="New"+String:C10(newcustcounter)
	UNLOAD RECORD:C212([Consignors:1])
	
	CREATE RECORD:C68([Consignors:1])
	[Consignors:1]Address1:4:=vCheckInAddress1
	[Consignors:1]City:6:=vCheckInCity
	[Consignors:1]First Name:2:=vCheckInFirstName
	[Consignors:1]Home Phone:9:=vCheckInHomePhone
	[Consignors:1]Last Name:3:=vCheckInLastName
	[Consignors:1]State:7:=vCheckInState
	[Consignors:1]Zip:8:=vCheckInZip
	[Consignors:1]Email Address:13:=vCheckInEmail
	[Consignors:1]Consignor Number:1:=vNewCust
	
	[Consignors:1]New Customer:27:=True:C214
	SAVE RECORD:C53([Consignors:1])
	UNLOAD RECORD:C212([Consignors:1])
End if 


ACCEPT:C269