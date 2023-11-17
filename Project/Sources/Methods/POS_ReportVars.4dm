//%attributes = {}
vShopperName:=[Point of Sale:5]Shopper First Name:9+" "+[Point of Sale:5]Shopper Last Name:10
vShopperCityStateZip:=[Point of Sale:5]Shopper City:12+" "+[Point of Sale:5]Shopper State:13+"  "+[Point of Sale:5]Shopper Zip:14
vShopperBatchID:=[Point of Sale:5]Batch ID:1
vShopperAddress:=[Point of Sale:5]Shopper Address1:11
vShopperPhone:=[Point of Sale:5]Shopper Phone:15

vTotalPaid:=[Point of Sale:5]Paid_AMEX:24+[Point of Sale:5]Paid_Cash:19+[Point of Sale:5]Paid_Check:20+[Point of Sale:5]Paid_Discover:23+[Point of Sale:5]Paid_GiftCard:25+[Point of Sale:5]Paid_IOU:26+[Point of Sale:5]Paid_Mastercard:22+[Point of Sale:5]Paid_Visa:21+[Point of Sale:5]Paid_Other:29

vPaidBy:=""
vPayment1:=0

If ([Point of Sale:5]Paid_Cash:19>0)
	vPaidBy:="Paid by Cash"
	vPayment1:=[Point of Sale:5]Paid_Cash:19
End if 

If ([Point of Sale:5]Paid_Check:20>0)
	If (vPaidBy="")
		vPaidBy:="Paid by Check"
		vPayment1:=[Point of Sale:5]Paid_Check:20
	Else 
		vPaidBy:="*Split Payment  - $"+String:C10(vPayment1)+" "+vPaidBy+" &  $"+String:C10([Point of Sale:5]Paid_Check:20)+" "+"Paid by Check"
	End if 
End if 

If ([Point of Sale:5]Paid_GiftCard:25>0)
	If (vPaidBy="")
		vPaidBy:="Paid by Gift Card"
		vPayment1:=[Point of Sale:5]Paid_GiftCard:25
	Else 
		vPaidBy:="*Split Payment  - $"+String:C10(vPayment1)+" "+vPaidBy+" &  $"+String:C10([Point of Sale:5]Paid_GiftCard:25)+" "+"Paid by Gift Card"
	End if 
End if 

If ([Point of Sale:5]Paid_AMEX:24>0)
	If (vPaidBy="")
		vPaidBy:="Paid by Amex"
		vPayment1:=[Point of Sale:5]Paid_AMEX:24
	Else 
		vPaidBy:="*Split Payment  - $"+String:C10(vPayment1)+" "+vPaidBy+" &  $"+String:C10([Point of Sale:5]Paid_AMEX:24)+" "+"Paid by Amex"
	End if 
End if 

If ([Point of Sale:5]Paid_Discover:23>0)
	If (vPaidBy="")
		vPaidBy:="Paid by Discover"
		vPayment1:=[Point of Sale:5]Paid_Discover:23
	Else 
		vPaidBy:="*Split Payment  - $"+String:C10(vPayment1)+" "+vPaidBy+" &  $"+String:C10([Point of Sale:5]Paid_Discover:23)+" "+"Paid by Discover"
	End if 
End if 

If ([Point of Sale:5]Paid_Mastercard:22>0)
	If (vPaidBy="")
		vPaidBy:="Paid by Mastercard"
		vPayment1:=[Point of Sale:5]Paid_Mastercard:22
	Else 
		vPaidBy:="*Split Payment  - $"+String:C10(vPayment1)+" "+vPaidBy+" &  $"+String:C10([Point of Sale:5]Paid_Mastercard:22)+" "+"Paid by Mastercard"
	End if 
End if 

If ([Point of Sale:5]Paid_Visa:21>0)
	If (vPaidBy="")
		vPaidBy:="Paid by Visa"
		vPayment1:=[Point of Sale:5]Paid_Visa:21
	Else 
		vPaidBy:="*Split Payment  - $"+String:C10(vPayment1)+" "+vPaidBy+" &  $"+String:C10([Point of Sale:5]Paid_Visa:21)+" "+"Paid by Visa"
	End if 
End if 


If ([Point of Sale:5]Paid_IOU:26>0)
	If (vPaidBy="")
		vPaidBy:="Paid by IOU"
		vPayment1:=[Point of Sale:5]Paid_IOU:26
	Else 
		vPaidBy:="*Split Payment  - $"+String:C10(vPayment1)+" "+vPaidBy+" &  $"+String:C10([Point of Sale:5]Paid_IOU:26)+" "+"Paid by IOU"
	End if 
End if 

If ([Point of Sale:5]Paid_Other:29>0)
	If (vPaidBy="")
		vPaidBy:="Paid by Other"
		vPayment1:=[Point of Sale:5]Paid_Other:29
	Else 
		vPaidBy:="*Split Payment  - $"+String:C10(vPayment1)+" "+vPaidBy+" &  $"+String:C10([Point of Sale:5]Paid_Other:29)+" "+"Paid by Other"
	End if 
End if 