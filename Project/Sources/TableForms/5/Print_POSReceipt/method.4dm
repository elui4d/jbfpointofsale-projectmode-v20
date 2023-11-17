If (vShopperName="") | (vShopperName=" ")
	OBJECT SET VISIBLE:C603(*; "txtName"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "txtName"; True:C214)
End if 

If (vShopperAddress="")
	OBJECT SET VISIBLE:C603(*; "txtAddress"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "txtAddress"; True:C214)
End if 

If (vShopperPhone="")
	OBJECT SET VISIBLE:C603(*; "txtPhone"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "txtPhone"; True:C214)
End if 

If (vTotalPaid=0)
	OBJECT SET VISIBLE:C603(*; "txtPaid"; False:C215)
Else 
	OBJECT SET VISIBLE:C603(*; "txtPaid"; True:C214)
End if 

If (vChange<0)
	OBJECT SET VISIBLE:C603(*; "txtChange"; False:C215)
	vChange:=0
Else 
	OBJECT SET VISIBLE:C603(*; "txtChange"; True:C214)
End if 