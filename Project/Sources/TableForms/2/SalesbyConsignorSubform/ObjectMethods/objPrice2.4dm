Case of 
	: (Form event code:C388=On Data Change:K2:15)
		vItemsSold:=Records in selection:C76([Sales:2])
		vGrossSales:=Sum:C1([Sales:2]Sold Price:2)
		vNetSales:=vGrossSales*([Consignors:1]Percent:14*0.01)
		vCheckTotal:=vNetSales-[Consignors:1]Consignor Fee:17
		REDRAW WINDOW:C456
End case 