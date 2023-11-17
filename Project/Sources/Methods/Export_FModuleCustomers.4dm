//%attributes = {}


C_LONGINT:C283($i; $i2; $iSub)
C_TEXT:C284(vRoster)
gDocRef:=?00:00:00?
$i:=0
$iSub:=0
vRoster:=""
ALL RECORDS:C47([Consignors:1])
//put the sort because new records won't have a center name
//ORDER BY([Consignors];[Consignors]Center Name;<)
//vEventFileName:=[Consignors]Center Name+"_"+vSaleSeason
//vAppPath:=aa_FindPathName (Application file)
//gDocRef:=Create document(vAppPath+"Files\\"+vEventFileName+" Customer File";"TXT")
//vFilename2:=document

vEventFileName:=Replace string:C233(vTerritory; "/"; " ")+"_"+vSaleSeason+" Customers"

vAppPath:=aa_FindPathName(Application file:C491)
gDocRef:=Create document:C266(vAppPath+"Files\\"+vEventFileName; "TXT")
vFilename2:=document

$DocCount:=1
If (OK=1)
	
	
	//Headers
	
	vRoster:=vRoster+"UCN"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Center Name"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Event Name"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Check Total"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Consignor Percentage"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Consignor Fee"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num of Items"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num of Items Donated"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Value of Items Donated"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num of Items Sold"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num of Items Sold Reduced Price"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Total $ Sold"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Average Price of Sold Items"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Valet"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Volunteer Hours Completed"
	vRoster:=vRoster+Char:C90(13)
	SEND PACKET:C103(gDocRef; vRoster)
	
	vRoster:=""
	
	
	//Data Rows
	QUERY:C277([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)
	//DISTINCT VALUES([Consignors]Consignor Number;aFMConsignors)
	For ($m; 1; Records in selection:C76([Consignors:1]))
		
		QUERY:C277([Sales:2]; [Sales:2]Consignor Number:6=[Consignors:1]Consignor Number:1)
		VFMSoldItems:=Records in selection:C76([Sales:2])
		vFMAveragePriceSold:=Round:C94(Sum:C1([Sales:2]Sold Price:2)/VFMSoldItems; 2)
		vFMSoldItemsValue:=Round:C94(Sum:C1([Sales:2]Sold Price:2); 2)
		DISTINCT VALUES:C339([Sales:2]Item Number:13; aItemNumber)
		// QUERY BY FORMULA([Invoice];Month of([Invoice]Entered)=12)
		QUERY SELECTION BY FORMULA:C207([Sales:2]; Num:C11([Sales:2]PercentOff:15)>0)
		VFMSoldItemsReduced:=Records in selection:C76([Sales:2])
		
		//DISTINCT VALUES([Sales]Item Number;aItemNumber)
		//QUERY WITH ARRAY([Inventory]Barcode Item Number;aItemNumber)
		//CREATE SET([Inventory];"SoldSet")
		//QUERY([Inventory];[Inventory]Consignor Number=[Consignors]Consignor Number)
		//CREATE SET([Inventory];"ALLSet")
		//DIFFERENCE("ALLSet";"SoldSet";"AllSet")
		//USE SET("AllSet")
		//vFMNotSold:=Records in selection([Inventory])
		
		CREATE EMPTY SET:C140([Inventory:4]; "AllSet")
		CREATE EMPTY SET:C140([Inventory:4]; "AllSold")
		CREATE EMPTY SET:C140([Inventory:4]; "AllDonate")
		
		QUERY:C277([Inventory:4]; [Inventory:4]Consignor Number:3=[Consignors:1]Consignor Number:1)
		VFMInventoryItems:=Records in selection:C76([Inventory:4])
		QUERY SELECTION:C341([Inventory:4]; [Inventory:4]Donate:9=True:C214)
		CREATE SET:C116([Inventory:4]; "AllDonate")
		
		QUERY SELECTION WITH ARRAY:C1050([Inventory:4]Barcode Item Number:1; aItemNumber)
		CREATE SET:C116([Inventory:4]; "AllSold")
		
		
		DIFFERENCE:C122("ALLDonate"; "AllSold"; "AllSet")
		
		USE SET:C118("AllSet")
		
		VFMInventoryItemsDonate:=Records in selection:C76([Inventory:4])
		VFMInventoryItemsDonateValue:=Round:C94(Sum:C1([Inventory:4]Price:6); 2)
		
		//QUERY([Inventory];[Inventory]Consignor Number=[Consignors]Consignor Number;*)
		//QUERY([Inventory]; & ;[Inventory]Category="@clothing@")
		//vFMCatClothing:=Records in selection([Inventory])
		//
		//QUERY([Inventory];[Inventory]Consignor Number=[Consignors]Consignor Number;*)
		//QUERY([Inventory]; & ;[Inventory]Category="@toy@")
		//vFMCatToy:=Records in selection([Inventory])
		//
		//QUERY([Inventory];[Inventory]Consignor Number=[Consignors]Consignor Number;*)
		//QUERY([Inventory]; & ;[Inventory]Category="@equipment@")
		//vFMCatEquip:=Records in selection([Inventory])
		
		vFranconnectCNum:=Substring:C12([Consignors:1]Consignor Number:1; 1; 1)+"-"+Substring:C12([Consignors:1]Consignor Number:1; 2; 3)+"-"+Substring:C12([Consignors:1]Consignor Number:1; 5; 3)
		
		If ([Consignors:1]Valet:36=True:C214)
			vFMValet:="Yes"
		Else 
			vFMValet:="No"
		End if 
		
		QUERY:C277([Volunteers:9]; [Volunteers:9]Consignor Number:1=[Consignors:1]Consignor Number:1)
		vFMVolunteerHours:=(Sum:C1([Volunteers:9]TimeWorked:16))
		
		
		vRoster:=vRoster+vFranconnectCNum
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Center Name:35
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+vTerritory+" "+vSaleSeason
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Consignors:1]Check_Total:19)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Consignors:1]Percent:14)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Consignors:1]Consignor Fee:17)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(VFMInventoryItems)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(VFMInventoryItemsDonate)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(VFMInventoryItemsDonateValue)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(VFMSoldItems)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(VFMSoldItemsReduced)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(vFMSoldItemsValue)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(vFMAveragePriceSold)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(vFMValet)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(vFMVolunteerHours)
		vRoster:=vRoster+Char:C90(13)
		SEND PACKET:C103(gDocRef; vRoster)
		vRoster:=""
		NEXT RECORD:C51([Consignors:1])
	End for 
	
	vRoster:=Char:C90(10)
	SEND PACKET:C103(gDocRef; vRoster)
	
	CLOSE DOCUMENT:C267(gDocRef)
	
	
End if   //open doc 

CLOSE DOCUMENT:C267(gDocRef)