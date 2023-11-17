//%attributes = {}

C_LONGINT:C283($i; $i2; $iSub)
C_TEXT:C284(vRoster)
gDocRef:=?00:00:00?
$i:=0
$iSub:=0
vRoster:=""

//added center name to filename on 3/10/17
QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
If (Records in selection:C76([Preferences:3])>0)
	vCenterName:=[Preferences:3]CenterName:31
	vCenterName2:=Replace string:C233(vCenterName; "/"; "_")
End if 
UNLOAD RECORD:C212([Preferences:3])

If (vCenterName2="")
	//  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
	MessageBox(""; "You must enter a Center Name in Preferences before you can run this report."; "OKBox"; "red")
	
Else 
	vAppPath:=aa_FindPathName(Application file:C491)
	//User DBname+batchNumber
	vPOSUploadFilename:=vAppPath+"Center Name..."+vCenterName2+"...Database Name..."+<>vDataBaseName+"-"+String:C10(Current time:C178\3600)+String:C10((Current time:C178\60)%60)+".txt"
	gDocRef:=Create document:C266(vPOSUploadFilename; "TXT")
	//vPOSUploadFilename:=document
	$DocCount:=1
	
	If (OK=1)
		
		
		//Headers
		
		vRoster:=vRoster+"Date"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"Items Sold"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"Net Sales"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"Tax"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"PST"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"Gross Sales"
		vRoster:=vRoster+Char:C90(13)
		SEND PACKET:C103(gDocRef; vRoster)
		
		vRoster:=""
		
		
		
		
		
		
		
		
		
		
		
		ALL RECORDS:C47([Sales:2])
		
		
		SET PRINT OPTION:C733(2; 1)  //Port
		PRINT SETTINGS:C106
		
		
		
		vReportTitle:="Sales Report by Date"
		vTotalItemsSold:=String:C10(Records in selection:C76([Sales:2]))
		vDate:=Current date:C33
		DISTINCT VALUES:C339([Sales:2]Consignor Number:6; aConsignors)
		vNumberofConsignors:=Size of array:C274(aConsignors)
		vGrossSalesTotal:=Sum:C1([Sales:2]Sold Price:2)
		vTransactionTaxTotal:=Sum:C1([Sales:2]TaxAmount:17)
		vTransactionTaxTotal:=Round:C94(vTransactionTaxTotal; 2)
		vTransactionTax2Total:=Sum:C1([Sales:2]AltTaxAmount:20)
		vTransactionTax2Total:=Round:C94(vTransactionTax2Total; 2)
		vTransactionTotalTotal:=vTransactionTaxTotal+vTransactionTax2Total+vGrossSalesTotal
		
		
		vConsignorAVG:=vGrossSalesTotal/vNumberofConsignors
		
		DISTINCT VALUES:C339([Sales:2]Sold Date:11; aSoldDate)
		
		Print form:C5([Sales:2]; "Print_SalesReport"; 200)
		
		For ($i; 1; Size of array:C274(aSoldDate))
			
			QUERY:C277([Sales:2]; [Sales:2]Sold Date:11=aSoldDate{$i})
			
			vSoldDate:=aSoldDate{$i}
			vItemsSold:=Records in selection:C76([Sales:2])
			vGrossSales:=Sum:C1([Sales:2]Sold Price:2)
			vTransactionTax:=Sum:C1([Sales:2]TaxAmount:17)
			vTransactionTax:=Round:C94(vTransactionTax; 2)
			vTransactionTax2:=Sum:C1([Sales:2]AltTaxAmount:20)
			vTransactionTax2:=Round:C94(vTransactionTax2; 2)
			vTransactionTotal:=vTransactionTax+vTransactionTax2+vGrossSales
			
			
			vRoster:=vRoster+String:C10(vSoldDate)
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+String:C10(vItemsSold)
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+String:C10(vGrossSales)
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+String:C10(vTransactionTax)
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+String:C10(vTransactionTax2)
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+String:C10(vTransactionTotal)
			vRoster:=vRoster+Char:C90(13)
			SEND PACKET:C103(gDocRef; vRoster)
			
			vRoster:=""
			
			
			Print form:C5([Sales:2]; "Print_SalesReport"; 0)
			
			
		End for 
		
		
		Print form:C5([Sales:2]; "Print_SalesReport"; 300)
		PAGE BREAK:C6
		
		
		
		
		vRoster:=vRoster+"Totals"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(vTotalItemsSold)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(vGrossSalesTotal)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(vTransactionTaxTotal)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(vTransactionTax2Total)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10(vTransactionTotalTotal)
		vRoster:=vRoster+Char:C90(13)
		SEND PACKET:C103(gDocRef; vRoster)
		
		vRoster:=""
		vRoster:=Char:C90(10)
		SEND PACKET:C103(gDocRef; vRoster)
		
		CLOSE DOCUMENT:C267(gDocRef)
		
		
		FTP_SalesAudit
		
		DELETE DOCUMENT:C159(vPOSUploadFilename)
		
		
	End if 
End if 
