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
cbVolunteering:=0
cbDonating:=0
cbPickUp:=0

UNLOAD RECORD:C212([Consignors:1])
ALL RECORDS:C47([Consignors:1])

CANCEL:C270