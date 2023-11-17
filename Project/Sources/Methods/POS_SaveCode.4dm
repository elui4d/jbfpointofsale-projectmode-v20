//%attributes = {}
C_LONGINT:C283(vSave)

If ([Point of Sale:5]NewCount:6=0)
	[Point of Sale:5]Entered By:2:=<>User
	[Point of Sale:5]Entered Date Stamp:4:=Current date:C33
	[Point of Sale:5]Entered Time Stamp:3:=Current time:C178
	[Point of Sale:5]Computer Number:7:=<>Computer
	[Point of Sale:5]Sold Date:5:=vCal_Date1
	//This is here so this code is run only for a new record
	[Point of Sale:5]NewCount:6:=[Point of Sale:5]NewCount:6+1
End if 
vMethodofPayment1:=""
vMethodofPayment2:=""
vMethodofPayment3:=""
vMethodofPayment4:=""
vMethodofPayment5:=""
vMethodofPayment6:=""

//New 12/21/2009
vMethodofPayment1:="Cash:  "+String:C10([Point of Sale:5]Paid_Cash:19; "##0.00")
vMethodofPayment2:="Check:  "+String:C10([Point of Sale:5]Paid_Check:20; "##0.00")
vMethodofPayment3:="Credit Card:  "+String:C10([Point of Sale:5]Paid_AMEX:24+[Point of Sale:5]Paid_Discover:23+[Point of Sale:5]Paid_Visa:21+[Point of Sale:5]Paid_Mastercard:22; "####0.00")
If ([Point of Sale:5]Paid_GiftCard:25>0)
	vMethodofPayment4:="Gift Card:  "+String:C10([Point of Sale:5]Paid_GiftCard:25; "##0.00")
End if 
If ([Point of Sale:5]Paid_IOU:26>0)
	vMethodofPayment5:="IOU:  "+String:C10([Point of Sale:5]Paid_IOU:26; "##0.00")
End if 
If ([Point of Sale:5]Paid_Other:29>0)
	vMethodofPayment6:="Other:  "+String:C10([Point of Sale:5]Paid_Other:29; "##0.00")
End if 

//  `New  6/16/2009
//vMethodofPayment:="Paid By: "
//If ([Point of Sale]Paid_Cash>0)
//vMethodofPayment1:=vMethodofPayment+"Cash  "
//End if 
//If ([Point of Sale]Paid_Check>0)
//vMethodofPayment:=vMethodofPayment+"Check  "
//End if 
//If ([Point of Sale]Paid_AMEX>0)
//vMethodofPayment:=vMethodofPayment+"AMEX  "
//End if 
//If ([Point of Sale]Paid_Discover>0)
//vMethodofPayment:=vMethodofPayment+"Discover  "
//End if 
//If ([Point of Sale]Paid_Mastercard>0)
//vMethodofPayment:=vMethodofPayment+"Mastercard  "
//End if 
//If ([Point of Sale]Paid_Visa>0)
//vMethodofPayment:=vMethodofPayment+"Visa  "
//End if 
//If ([Point of Sale]Paid_GiftCard>0)
//vMethodofPayment:=vMethodofPayment+"Giftcard  "
//End if 
//If ([Point of Sale]Paid_IOU>0)
//vMethodofPayment:=vMethodofPayment+"IOU  "
//End if 



//Remove blank sales
FIRST RECORD:C50([Sales:2])
For ($j; 1; Records in selection:C76([Sales:2]))
	If ([Sales:2]Consignor Number:6="") | ([Sales:2]Sold Price:2=0)
		DELETE RECORD:C58([Sales:2])
	End if 
	NEXT RECORD:C51([Sales:2])
End for 

//This code to add Consignors for barcoded tags if they don't exist
QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
If (Records in selection:C76([Preferences:3])>0)
	vPreferencesConsignorFee:=[Preferences:3]DefaultConsignorFee:2
	vPreferencesConsignorPercent:=[Preferences:3]DefaultConsignorPercent:3
End if 
UNLOAD RECORD:C212([Preferences:3])

If (Records in selection:C76([Sales:2])>0)
	DISTINCT VALUES:C339([Sales:2]Consignor Number:6; aConsignorNumber)
	For ($h; 1; Size of array:C274(aConsignorNumber))
		QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=aConsignorNumber{$h})
		
		If (Records in selection:C76([Consignors:1])=0) & (aConsignorNumber{$h}#"")
			CREATE RECORD:C68([Consignors:1])
			[Consignors:1]Consignor Number:1:=aConsignorNumber{$h}
			[Consignors:1]Last Name:3:="?"
			[Consignors:1]First Name:2:="?"
			[Consignors:1]Consigning this sale:16:=True:C214
			[Consignors:1]Percent:14:=vPreferencesConsignorPercent
			[Consignors:1]Consignor Fee:17:=vPreferencesConsignorFee
			SAVE RECORD:C53([Consignors:1])
		End if 
		
	End for 
	
	UNLOAD RECORD:C212([Consignors:1])
	
	
	
	vSave:=1
	
Else 
	vSave:=0
	
End if 



