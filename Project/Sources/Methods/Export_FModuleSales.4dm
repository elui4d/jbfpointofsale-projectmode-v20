//%attributes = {}


C_LONGINT:C283($i; $i2; $iSub)
C_TEXT:C284(vRoster)
gDocRef:=?00:00:00?
$i:=0
$iSub:=0
vRoster:=""

ALL RECORDS:C47([Consignors:1])
//put the sort because new records won't have a center name
//removed for 9.1
//ORDER BY([Consignors];[Consignors]Center Name;<)

//vEventFileName:=[Consignors]Center Name+"_"+vSaleSeason

//Changed in 9.1 to use Center Name dropdown
//vEventFileName:=Replace string([Consignors]Center Name;"/";" ")+"_"+vSaleSeason
vEventFileName:=Replace string:C233(vTerritory; "/"; " ")+"_"+vSaleSeason

vAppPath:=aa_FindPathName(Application file:C491)
gDocRef:=Create document:C266(vAppPath+"Files\\"+vEventFileName; "TXT")
vFilename1:=document

//gDocRef:=Create document("";"TXT")

$DocCount:=1
If (OK=1)
	
	//Message_Think ("Exporting data, please wait... ")
	QUERY:C277([KPI:11]; [KPI:11]ID:30="ME")
	
	//Headers
	vRoster:=vRoster+"Date"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Season Name"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Total Net Sales"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Total Tax"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Total Consignor Fees"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Gross Total"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Items Sold"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Batches"
	vRoster:=vRoster+Char:C90(9)
	
	For ($j; 1; Size of array:C274(aSoldDate))
		
		vRoster:=vRoster+"Num Items Sold Day "+String:C10($j)
		vRoster:=vRoster+Char:C90(9)
		
		vRoster:=vRoster+"Num Batches Day "+String:C10($j)
		vRoster:=vRoster+Char:C90(9)
		//QUERY([Sales];[Sales]Sold Date=aSoldDate{$i})
	End for 
	
	vRoster:=vRoster+"Average Consignor Check"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Consignor Default Fee"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Average Item Price"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Consignor Default Percent"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Average Consignor Percent"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Value of Donations"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Default Volunteer Percent"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Additional Dollars Paid to Volunteers"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Donated Items"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Consignors"
	vRoster:=vRoster+Char:C90(9)
	//vRoster:=vRoster+"Num Consigning Volunteers"
	//vRoster:=vRoster+Char(9)
	//added in the place of POS Usage fee on 8/3/19
	vRoster:=vRoster+"Marketing Fund Total"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Average # of POS Batches Per Day"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Consignor Signups"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Amount Paid to Consignors"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Barters"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Barter Hours"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Volunteers"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Volunteer Hours"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Consigning Volunteers"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Total Volunteers"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Total Volunteer Hours"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Paid Staff"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Total Employee Hours Worked"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Days Open to the Public"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Hours Open Presale"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Hours Open Public"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Shoppers"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Venue Size"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Vendors"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Sponsors"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Vendor Fee"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Admission Fee"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Prime Time Admission Fee"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Rejected Items"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Recalled Items"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num VIP Consignors"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num POS Stations"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"Num Non Profit Partners"
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+"How Many Sales"
	
	
	
	
	
	
	
	
	
	
	
	
	vRoster:=vRoster+Char:C90(13)
	
	SEND PACKET:C103(gDocRef; vRoster)
	
	vRoster:=""
	ALL RECORDS:C47([Point of Sale:5])
	FIRST RECORD:C50([Point of Sale:5])
	
	//Data Row
	vRoster:=vRoster+String:C10([Point of Sale:5]Sold Date:5)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+vSeasonDropDown
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vGrossSalesTotal)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vTransactionTotalTotal)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vFMConsignorFee)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vTransactionTotal)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+vTotalItemsSold
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+vTotalBatches
	vRoster:=vRoster+Char:C90(9)
	
	
	For ($k; 1; Size of array:C274(aSoldDate))
		
		QUERY:C277([Sales:2]; [Sales:2]Sold Date:11=aSoldDate{$k})
		vFMItemsSold:=Records in selection:C76([Sales:2])
		vRoster:=vRoster+String:C10(vFMItemsSold)
		vRoster:=vRoster+Char:C90(9)
		
		QUERY:C277([Point of Sale:5]; [Point of Sale:5]Sold Date:5=aSoldDate{$k})
		vFMItemsPOS:=Records in selection:C76([Point of Sale:5])
		vRoster:=vRoster+String:C10(vFMItemsPOS)
		vRoster:=vRoster+Char:C90(9)
		
	End for 
	
	
	vRoster:=vRoster+String:C10(vAverageCheck)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10([Preferences:3]DefaultConsignorFee:2)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vAverageItemPrice)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10([Preferences:3]DefaultConsignorPercent:3)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vAverageConsignorPercent)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vPriceofDonated)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10([Preferences:3]DefaultVolunteerPercent:14)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vFMVolDiffernce)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+vTotalItemsDonated
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vNumberofConsignors)
	vRoster:=vRoster+Char:C90(9)
	//vRoster:=vRoster+String(VFMVolunteers)
	//vRoster:=vRoster+Char(9)
	//added in the place of POS Usage fee on 8/3/19
	vRoster:=vRoster+String:C10(Round:C94(vMarketingFund; 2))
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vAvgNumBatchesPerDay)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumConsignorSignups:8
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vTotalPaidtoConsignors)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumBarters:9
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumBarterHours:10
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumVolunteers:11
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumVolunteerHours:12
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumVolunteersConsigned:13
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(Num:C11([KPI:11]NumBarters:9)+Num:C11([KPI:11]NumVolunteers:11))
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(Num:C11([KPI:11]NumBarterHours:10)+Num:C11([KPI:11]NumVolunteerHours:12))
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumPaidStaff:14
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]TotalEmployeeHours:15
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]DaysOpen:16
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]PresaleHours:17
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]PublicHours:18
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10(vTotalTransactions)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]VenueSize:19
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumVendors:20
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumSponsors:21
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]VendorFee:22
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]AdmissionFee:23
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]PrimeTimeAdmissionFee:24
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumItemsRejected:25
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumRecalls:29
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumVIPConsignors:26
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumPOSStations:27
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]NumPartners:28
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+[KPI:11]HowManySales:31
	
	
	
	
	vRoster:=vRoster+Char:C90(13)
	
	SEND PACKET:C103(gDocRef; vRoster)
	
	vRoster:=Char:C90(10)
	SEND PACKET:C103(gDocRef; vRoster)
	CLOSE DOCUMENT:C267(gDocRef)
	
	ALL RECORDS:C47([Point of Sale:5])
	ALL RECORDS:C47([Sales:2])
	
End if   //open doc 
