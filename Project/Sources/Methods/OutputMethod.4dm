//%attributes = {}
SET WINDOW TITLE:C213(WindowTitle)
Case of 
	: (Form event code:C388=On Display Detail:K2:22)
		
		If (<>TablePointer#(->[Volunteers:9]))
			If ((Displayed line number:C897%2)=0)
				OBJECT SET RGB COLORS:C628(*; "RowBackground"; "Black"; "White")
			Else 
				OBJECT SET RGB COLORS:C628(*; "RowBackground"; "Black"; "#f6cee8")
			End if 
		Else   //Volunteer color
			If ([Volunteers:9]Complete:10=False:C215)
				OBJECT SET RGB COLORS:C628(*; "RowBackground"; UTIL_4DColorToHex(3); UTIL_4DColorToHex(0))
			Else 
				OBJECT SET RGB COLORS:C628(*; "RowBackground"; UTIL_4DColorToHex(3); UTIL_4DColorToHex(176))
			End if 
		End if 
		
		If (<>TablePointer=(->[Point of Sale:5]))
			QUERY:C277([Sales:2]; [Sales:2]Batch ID:12=[Point of Sale:5]Batch ID:1)
			vSalesCount:=Records in selection:C76([Sales:2])
			vItemsInBatch:=Records in selection:C76([Sales:2])
			vTransactionSubtotal:=Sum:C1([Sales:2]Sold Price:2)
			vTransactionSubtotal:=Round:C94(vTransactionSubtotal; 2)
			vTransactionTax:=Sum:C1([Sales:2]TaxAmount:17)
			vTransactionTax:=Round:C94(vTransactionTax; 2)
			vTransactionTax2:=Sum:C1([Sales:2]AltTaxAmount:20)
			vTransactionTax2:=Round:C94(vTransactionTax2; 2)
			vTransactionTax3:=vTransactionTax+vTransactionTax2
			vTransactionTotal:=vTransactionTax+vTransactionTax2+vTransactionSubtotal
			
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
			vChange:=Round:C94((vTransactionTotal-vTotalPaid*-1); 2)
			
		End if 
		
		If (<>TablePointer=(->[Inventory:4]))
			QUERY:C277([Sales:2]; [Sales:2]Item Number:13=[Inventory:4]Barcode Item Number:1)
			If (Records in selection:C76([Sales:2])>0)
				vInventorySold:=1
			Else 
				vInventorySold:=0
			End if 
			
			
			
		End if 
		
End case 