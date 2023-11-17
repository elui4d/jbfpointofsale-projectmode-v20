//%attributes = {}
C_LONGINT:C283($i; $i2; $iSub)
C_TEXT:C284(vRoster)

gDocRef:=?00:00:00?

$i:=0
$iSub:=0

vRoster:=""

gDocRef:=Create document:C266(""; "txt")

If (OK=1)
	
	Message_Think("Exporting data, please wait... ")
	
	
	FIRST RECORD:C50([Inventory:4])
	
	For ($i; 1; Records in selection:C76([Inventory:4]))
		//RECEIVE PACKET(gDocRef;vBar_ConsignorNumber;Char(9))
		//RECEIVE PACKET(gDocRef;vBar_ItemNumber;Char(9))
		//RECEIVE PACKET(gDocRef;vBar_ItemDescription;Char(9))
		//RECEIVE PACKET(gDocRef;vBar_Size;Char(9))
		//RECEIVE PACKET(gDocRef;vBar_Price;Char(9))
		//RECEIVE PACKET(gDocRef;vCategory;Char(9))
		//RECEIVE PACKET(gDocRef;vBar_Reduce;Char(9))
		//RECEIVE PACKET(gDocRef;vDonate;Char(9))
		//RECEIVE PACKET(gDocRef;vCreatedDate;Char(13)+Char(10))
		
		
		
		vRoster:=vRoster+[Inventory:4]Consignor Number:3
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Inventory:4]Barcode Item Number:1)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Inventory:4]Item Description:4
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Inventory:4]Size:5
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Inventory:4]Price:6)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Inventory:4]Category:8
		vRoster:=vRoster+Char:C90(9)
		If ([Inventory:4]Reduce:7=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		If ([Inventory:4]Donate:9=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Inventory:4]Created Date:10)
		vRoster:=vRoster+Char:C90(13)+Char:C90(10)
		
		SEND PACKET:C103(gDocRef; vRoster)
		
		vRoster:=""
		
		NEXT RECORD:C51([Inventory:4])
		
		//Message_Update ("Exporting Consignors:  "+String($i;"###,###"))
		
	End for 
	
	
	
	SEND PACKET:C103(gDocRef; vRoster)
	
	FLUSH CACHE:C297
	
	CLOSE DOCUMENT:C267(gDocRef)
	
	UNLOAD RECORD:C212([Inventory:4])
	
End if   //open doc 