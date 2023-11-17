

Case of 
	: (Form event code:C388=On Load:K2:1)
		//HIDE MENU BAR
		
		vItemsSold:=Records in selection:C76([Sales:2])
		vGrossSales:=Round:C94(Sum:C1([Sales:2]Sold Price:2); 2)
		vNetSales:=Round:C94(vGrossSales*([Consignors:1]Percent:14*0.01); 2)
		vCheckTotal:=Round:C94(vNetSales-[Consignors:1]Consignor Fee:17; 2)
		
		
		vTempAddress1:=[Consignors:1]Address1:4
		vTempAddress2:=[Consignors:1]filler:5
		vTempCellPhone:=[Consignors:1]Cell Phone:10
		vTempCity:=[Consignors:1]City:6
		vTempConsignorNumber:=[Consignors:1]Consignor Number:1
		vTempEmail:=[Consignors:1]Email Address:13
		vTempFirstName:=[Consignors:1]First Name:2
		vTempLastName:=[Consignors:1]Last Name:3
		vTempHomePhone:=[Consignors:1]Home Phone:9
		vTempState:=[Consignors:1]State:7
		vTempWorkPhone:=[Consignors:1]Work Phone:11
		vTempZip:=[Consignors:1]Zip:8
		
		//QUERY([Inventory];[Inventory]Consignor Number=[Consignors]Consignor Number)
		ALL RECORDS:C47([Sales:2])
		QUERY:C277([Sales:2]; [Sales:2]Consignor Number:6=[Consignors:1]Consignor Number:1)
		DISTINCT VALUES:C339([Sales:2]Item Number:13; aItemNumber)
		QUERY WITH ARRAY:C644([Inventory:4]Barcode Item Number:1; aItemNumber)
		CREATE SET:C116([Inventory:4]; "SoldSet")
		QUERY:C277([Inventory:4]; [Inventory:4]Consignor Number:3=[Consignors:1]Consignor Number:1)
		CREATE SET:C116([Inventory:4]; "ALLSet")
		DIFFERENCE:C122("ALLSet"; "SoldSet"; "AllSet")
		USE SET:C118("AllSet")
		
		vItemsBrought:=Records in selection:C76([Inventory:4])
		
		
		C_LONGINT:C283(bAddNewConsignor)
		If (bAddNewConsignor=1)
			QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
			If (Records in selection:C76([Preferences:3])>0)
				vPreferencesConsignorFee:=[Preferences:3]DefaultConsignorFee:2
				vPreferencesConsignorPercent:=[Preferences:3]DefaultConsignorPercent:3
			End if 
			UNLOAD RECORD:C212([Preferences:3])
			
			[Consignors:1]Consignor Fee:17:=vPreferencesConsignorFee
			[Consignors:1]Percent:14:=vPreferencesConsignorPercent
		End if 
		
		QUERY:C277([Volunteers:9]; [Volunteers:9]Consignor Number:1=[Consignors:1]Consignor Number:1; *)
		QUERY:C277([Volunteers:9];  & ; [Volunteers:9]Paid Job:12=True:C214)
		vTotalMoneyEarned:=Sum:C1([Volunteers:9]Money Earned:15)
		
		//Requery to get ALL shifts
		QUERY:C277([Volunteers:9]; [Volunteers:9]Consignor Number:1=[Consignors:1]Consignor Number:1)
		
	: (Form event code:C388=On Unload:K2:2)
		//SHOW MENU BAR
		C_LONGINT:C283(bAddNewConsignor)
		bAddNewConsignor:=0
End case 