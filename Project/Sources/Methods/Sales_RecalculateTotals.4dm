//%attributes = {}
//Put this here to recalc totals


//vTransactionSubtotal:=Sum([Sales]Sold Price)
//If ([Tag Batches]Taxed=True)
//vTransactionTax:=Round(vTransactionSubtotal*vTaxRate2;2)
//Else 
//vTransactionTax:=0
//End if 
//vTransactionTotal:=vTransactionTax+vTransactionSubtotal

vItemsInBatch:=Records in selection:C76([Sales:2])

vTransactionSubtotal:=Sum:C1([Sales:2]Sold Price:2)
vTransactionSubtotal:=Round:C94(vTransactionSubtotal; 2)
vTransactionTax:=Sum:C1([Sales:2]TaxAmount:17)
vTransactionTax:=Round:C94(vTransactionTax; 2)
vTransactionTax2:=Sum:C1([Sales:2]AltTaxAmount:20)
vTransactionTax2:=Round:C94(vTransactionTax2; 2)
vTransactionTotal:=vTransactionTax+vTransactionTax2+vTransactionSubtotal
vAveragePrice:=vTransactionSubtotal/vItemsInBatch
If (vAveragePrice<5)
	vAveragePriceText:="Congratulations, you only paid $"+String:C10(vAveragePrice; "##0.00")+" per item!"
Else 
	vAveragePriceText:=""
End if 
