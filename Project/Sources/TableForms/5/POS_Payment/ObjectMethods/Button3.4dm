POS_ZeroPayment
Variable3:=vTransactionTotal

vTotalPaid:=Variable1+Variable2+Variable3+Variable4+Variable5+Variable6+Variable7+Variable8+Variable9
vBalance:=vTransactionTotal-vTotalPaid
vChange:=Round:C94((vTransactionTotal-vTotalPaid*-1); 2)