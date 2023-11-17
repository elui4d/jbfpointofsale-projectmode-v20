//%attributes = {}


Open Centered window(500; 400; Movable dialog box:K34:7; " ")

DIALOG:C40([Dialogs:7]; "quickbooks_dlog")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 

If (ok=1)
	C_LONGINT:C283($i; $i2; $iSub; vCheckNum; vIncrement)
	C_TEXT:C284(vRoster)
	gDocRef:=?00:00:00?
	$i:=0
	$iSub:=0
	vRoster:=""
	gDocRef:=Create document:C266(""; "IIF")
	vFilename:=document
	$DocCount:=1
	If (OK=1)
		
		Message_Think("Exporting data, please wait... ")
		
		// Line 1 of Header
		vRoster:=vRoster+"!TRNS"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"TRNSTYPE"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"DATE"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"ACCNT"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"NAME"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"CLASS"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"AMOUNT"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"MEMO"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"CLEAR"
		vRoster:=vRoster+Char:C90(9)
		//vRoster:=vRoster+"TOPRINT"   ---This will put, ToPrint in the Checknumber field.  You have to print via Quickbooks to generate the check numbers
		Case of 
			: (vQBPrinting="No")
				vRoster:=vRoster+"DOCNUM"
				vRoster:=vRoster+Char:C90(9)
			: (vQBPrinting="Yes")
				vRoster:=vRoster+"TOPRINT"
				vRoster:=vRoster+Char:C90(9)
		End case 
		vRoster:=vRoster+"ADDR1"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"ADDR2"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"ADDR3"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(13)
		SEND PACKET:C103(gDocRef; vRoster)
		vRoster:=""
		
		// Line 2 of Header
		vRoster:=vRoster+"!SPL"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"TRNSTYPE"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"DATE"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"ACCNT"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"NAME"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"CLASS"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"AMOUNT"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"MEMO"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"CLEAR"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"QNTY"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+"INVITEM"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(13)
		SEND PACKET:C103(gDocRef; vRoster)
		vRoster:=""
		
		// Line 3 of Header
		vRoster:=vRoster+"!ENDTRNS"
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""
		vRoster:=vRoster+Char:C90(13)
		SEND PACKET:C103(gDocRef; vRoster)
		vRoster:=""
		
		QUERY:C277([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)
		
		Case of 
				//Last Name
			: (vCheckSort="By Last Name")
				ORDER BY FORMULA:C300([Consignors:1]; ([Consignors:1]Last Name:3); >; ([Consignors:1]First Name:2); >)
				
				//Consignor Number
				//: (vCheckSort="By Consignor Number")
				//ORDER BY FORMULA([Consignors];Num([Consignors]Consignor Number);>)
				//Universal Consignor Number
			: (vCheckSort="By Universal Consignor Number")
				ORDER BY FORMULA:C300([Consignors:1]; ([Consignors:1]Consignor Number:1); >)
		End case 
		
		FIRST RECORD:C50([Consignors:1])
		vCheckNum:=Num:C11(vStartingCheckNum)
		vIncrement:=1
		For ($i; 1; Records in selection:C76([Consignors:1]))
			
			If ([Consignors:1]Check_Total:19<0)
				vQB_CheckAmount:="0.01"
				vQB_ConsignorFee:=""
				vQB_Amount_and_Fee:="0.01"
			Else 
				vQB_CheckAmount:=String:C10([Consignors:1]Check_Total:19)
				vQB_ConsignorFee:=String:C10([Consignors:1]Consignor Fee:17)
				vQB_Amount_and_Fee:=String:C10([Consignors:1]Check_Total:19+[Consignors:1]Consignor Fee:17)
			End if 
			
			// Line 1 of Data
			vRoster:=vRoster+"TRNS"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"CHECK"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+vCheckDate
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+vBankAccount
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+[Consignors:1]Check_FirstLastName:21
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"Consignor Check Less Fee"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"-"+vQB_CheckAmount
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"Consigner - "+[Consignors:1]Consignor Number:1
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"N"
			vRoster:=vRoster+Char:C90(9)
			Case of 
				: (vQBPrinting="No")
					vRoster:=vRoster+String:C10(vCheckNum)
					vRoster:=vRoster+Char:C90(9)
				: (vQBPrinting="Yes")
					vRoster:=vRoster+"Y"
					vRoster:=vRoster+Char:C90(9)
			End case 
			vRoster:=vRoster+[Consignors:1]Check_FirstLastName:21
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+[Consignors:1]Address1:4
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+[Consignors:1]Check_CityStateZip:23
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+String:C10(vIncrement)
			vRoster:=vRoster+Char:C90(13)
			SEND PACKET:C103(gDocRef; vRoster)
			vRoster:=""
			
			
			// Line 2 of Data
			vRoster:=vRoster+"SPL"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"CHECK"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+vCheckDate
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"Consignor Commissions"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"Consignor Check Less Fee"
			vRoster:=vRoster+Char:C90(9)
			vTotalPlusFee:=[Consignors:1]Check_Total:19+[Consignors:1]Consignor Fee:17
			vRoster:=vRoster+vQB_Amount_and_Fee
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"Net Cost of goods sold before fee"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(13)
			SEND PACKET:C103(gDocRef; vRoster)
			vRoster:=""
			
			
			// Line 3 of Data
			vRoster:=vRoster+"SPL"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"CHECK"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+vCheckDate
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"Consignor Fee"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"Consignor Check Less Fee"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+"-"+vQB_ConsignorFee
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(13)
			SEND PACKET:C103(gDocRef; vRoster)
			vRoster:=""
			
			
			// Line 4 of Data
			vRoster:=vRoster+"ENDTRNS"
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+""
			vRoster:=vRoster+Char:C90(13)
			SEND PACKET:C103(gDocRef; vRoster)
			vRoster:=""
			
			NEXT RECORD:C51([Consignors:1])
			vCheckNum:=vCheckNum+1
			vIncrement:=vIncrement+1
			
		End for 
		
		
		vRoster:=Char:C90(10)
		SEND PACKET:C103(gDocRef; vRoster)
		CLOSE DOCUMENT:C267(gDocRef)
		UNLOAD RECORD:C212([Consignors:1])
		
	End if   //open doc 
End if 