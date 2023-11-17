Case of 
	: (Form event code:C388=On Load:K2:1)
		
		C_REAL:C285(vTotalPaid; Variable1; Variable2; Variable3; Variable4; Variable5; Variable6; Variable7; Variable8; vBalance; Variable9)
		
		Variable1:=[Point of Sale:5]Paid_Cash:19
		Variable2:=[Point of Sale:5]Paid_Check:20
		Variable3:=[Point of Sale:5]Paid_Visa:21
		Variable4:=[Point of Sale:5]Paid_Mastercard:22
		Variable5:=[Point of Sale:5]Paid_Discover:23
		Variable6:=[Point of Sale:5]Paid_AMEX:24
		Variable7:=[Point of Sale:5]Paid_GiftCard:25
		Variable8:=[Point of Sale:5]Paid_IOU:26
		Variable9:=[Point of Sale:5]Paid_Other:29
		
		vTotalPaid:=Variable1+Variable2+Variable3+Variable4+Variable5+Variable6+Variable7+Variable8+Variable9
		vBalance:=vTransactionTotal-vTotalPaid
		vChange:=Round:C94((vTransactionTotal-vTotalPaid*-1); 2)
		
		
		
		
	: (Form event code:C388=On Data Change:K2:15)
		
		vTotalPaid:=Round:C94(Variable1; 2)+Round:C94(Variable2; 2)+Round:C94(Variable3; 2)+Round:C94(Variable4; 2)+Round:C94(Variable5; 2)+Round:C94(Variable6; 2)+Round:C94(Variable7; 2)+Round:C94(Variable8; 2)+Round:C94(Variable9; 2)
		vBalance:=vTransactionTotal-vTotalPaid
		vChange:=Round:C94((vTransactionTotal-vTotalPaid*-1); 2)
		
		
End case 