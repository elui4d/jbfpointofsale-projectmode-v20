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
	
	
	FIRST RECORD:C50([Consignors:1])
	
	For ($i; 1; Records in selection:C76([Consignors:1]))
		vRoster:=vRoster+[Consignors:1]First Name:2
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Last Name:3
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Email Address:13
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Consignor Number:1
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Address1:4
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Address1:4  //This takes the place of address2 that is no longer used
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]City:6
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]State:7
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Zip:8
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Referred By:12
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Home Phone:9
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Cell Phone:10
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Work Phone:11
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Consignors:1]Center Name:35
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Consignors:1]Percent:14)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Consignors:1]Consignor Fee:17)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Consignors:1]Comment:24)
		vRoster:=vRoster+Char:C90(9)
		
		If ([Consignors:1]Envelope:15=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		
		If ([Consignors:1]DataChanged:18=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		
		If ([Consignors:1]Volunteer:26=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		
		If ([Consignors:1]New Customer:27=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		
		If ([Consignors:1]Picked Up:25=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		
		If ([Consignors:1]Donating:34=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		
		If ([Consignors:1]Valet:36=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		
		If ([Consignors:1]Consigning this sale:16=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(13)+Char:C90(10)
		
		SEND PACKET:C103(gDocRef; vRoster)
		
		vRoster:=""
		
		NEXT RECORD:C51([Consignors:1])
		
		//Message_Update ("Exporting Consignors:  "+String($i;"###,###"))
		
	End for 
	
	
	vRoster:=Char:C90(10)
	SEND PACKET:C103(gDocRef; vRoster)
	
	FLUSH CACHE:C297
	
	CLOSE DOCUMENT:C267(gDocRef)
	
	UNLOAD RECORD:C212([Consignors:1])
	
End if   //open doc 