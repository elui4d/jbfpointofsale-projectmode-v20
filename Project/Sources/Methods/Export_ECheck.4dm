//%attributes = {}
C_LONGINT:C283($i)
C_TEXT:C284(vRoster)

gDocRef:=?00:00:00?

$i:=0

vRoster:=""

gDocRef:=Create document:C266(""; "csv")



//Build Check Data Prior to Export
BuildCheckData

Message_Think("Exporting data, please wait... ")

//Data Headers
vRoster:=vRoster+"ConsignorName"
vRoster:=vRoster+Char:C90(44)
// E-mail Address for Check
vRoster:=vRoster+"E-mail"
vRoster:=vRoster+Char:C90(44)
// Check Amount
vRoster:=vRoster+"CheckAmount"
vRoster:=vRoster+Char:C90(44)
// Memo Field
vRoster:=vRoster+"Memo/ConsignorNumber"
vRoster:=vRoster+Char:C90(13)+Char:C90(10)


QUERY SELECTION:C341([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)
ORDER BY FORMULA:C300([Consignors:1]; ([Consignors:1]Consignor Number:1); >)
If (Records in selection:C76([Consignors:1])>0)
	For ($i; 1; Records in selection:C76([Consignors:1]))
		//Name for Check
		vRoster:=vRoster+[Consignors:1]First Name:2+" "
		vRoster:=vRoster+[Consignors:1]Last Name:3
		vRoster:=vRoster+Char:C90(44)
		// E-mail Address for Check
		vRoster:=vRoster+[Consignors:1]Email Address:13
		vRoster:=vRoster+Char:C90(44)
		// Check Amount
		vRoster:=vRoster+String:C10([Consignors:1]Check_Total:19)
		vRoster:=vRoster+Char:C90(44)
		// Memo Field
		vRoster:=vRoster+[Consignors:1]Consignor Number:1
		vRoster:=vRoster+Char:C90(13)+Char:C90(10)
		
		SEND PACKET:C103(gDocRef; vRoster)
		
		vRoster:=""
		
		NEXT RECORD:C51([Consignors:1])
		
		//Message_Update ("Exporting Consignors:  "+String($i;"###,###"))
		
	End for 
	
	
	vRoster:=Char:C90(10)
	SEND PACKET:C103(gDocRef; vRoster)
End if 

FLUSH CACHE:C297

CLOSE DOCUMENT:C267(gDocRef)

UNLOAD RECORD:C212([Consignors:1])

