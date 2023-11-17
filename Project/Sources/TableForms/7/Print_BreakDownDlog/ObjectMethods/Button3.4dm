
C_REAL:C285(vConLargeCounts)

QUERY:C277([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)
DISTINCT VALUES:C339([Consignors:1]Consignor Number:1; aConsignorNumber)
DISTINCT VALUES:C339([Consignors:1]Consignor Number:1; aConsignorNumberCounts)
//vStartingConsingor:=Records in selection([Consignors])

For ($i; 1; Size of array:C274(aConsignorNumber))
	QUERY:C277([Sales:2]; [Sales:2]Consignor Number:6=aConsignorNumber{$i})
	vConItemsSold:=Records in selection:C76([Sales:2])
	QUERY:C277([Inventory:4]; [Inventory:4]Consignor Number:3=aConsignorNumber{$i})
	vConItemsInventory:=Records in selection:C76([Inventory:4])
	vConItemsRemaining:=vConItemsInventory-vConItemsSold
	vConLargeCounts:=vConItemsRemaining/Num:C11(vLarge)
	
	If (vConLargeCounts>1)
		For ($j; 1; vConLargeCounts)
			$vlElem:=Size of array:C274(aConsignorNumberCounts)+1
			INSERT IN ARRAY:C227(aConsignorNumberCounts; $vlElem)
			aConsignorNumberCounts{$vlElem}:=aConsignorNumber{$i}
		End for 
	End if 
	
End for 


vGroups:=Round:C94(Size of array:C274(aConsignorNumberCounts)/vSections; 0)


OBJECT SET VISIBLE:C603(*; "bHide@"; True:C214)




