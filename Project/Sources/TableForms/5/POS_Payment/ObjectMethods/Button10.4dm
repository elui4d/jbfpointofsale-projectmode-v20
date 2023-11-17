
//POS_ZeroPayment 


vTotalPaid:=Variable1+Variable2+Variable3+Variable4+Variable5+Variable6+Variable7+Variable8+Variable9
vBalance:=vTransactionTotal-vTotalPaid
If (vBalance>0)
	Variable2:=vBalance
	
	vTotalPaid:=Variable1+Variable2+Variable3+Variable4+Variable5+Variable6+Variable7+Variable8+Variable9
	vBalance:=vTransactionTotal-vTotalPaid
End if 

vChange:=Round:C94((vTransactionTotal-vTotalPaid*-1); 2)