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
	
	
	FIRST RECORD:C50([Volunteers:9])
	
	For ($i; 1; Records in selection:C76([Volunteers:9]))
		vRoster:=vRoster+[Volunteers:9]First Name:2
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Volunteers:9]Last Name:3
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Volunteers:9]Consignor Number:1
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Volunteers:9]Shift Name:4
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Volunteers:9]Category:5
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""  //vDay placeholder .  We don't use the day
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Volunteers:9]Date:6)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Volunteers:9]Scheduled Time:7
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""  //HomePhone
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""  //CellPhone
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""  //Email
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+""  //UpdateShifts
		vRoster:=vRoster+Char:C90(9)
		
		//********End of QuantumDelta data***********
		
		vRoster:=vRoster+[Volunteers:9]Comments:11
		vRoster:=vRoster+Char:C90(9)
		
		If ([Volunteers:9]Complete:10=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		
		vRoster:=vRoster+[Volunteers:9]In Time:8
		vRoster:=vRoster+Char:C90(9)
		
		vRoster:=vRoster+String:C10([Volunteers:9]Money Earned:15)
		vRoster:=vRoster+Char:C90(9)
		
		vRoster:=vRoster+[Volunteers:9]Out Time:9
		vRoster:=vRoster+Char:C90(9)
		
		If ([Volunteers:9]Paid Job:12=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		
		If ([Volunteers:9]Pass:14=True:C214)
			vRoster:=vRoster+"1"
		Else 
			vRoster:=vRoster+"0"
		End if 
		vRoster:=vRoster+Char:C90(9)
		
		vRoster:=vRoster+String:C10([Volunteers:9]Pay Rate:13)
		vRoster:=vRoster+Char:C90(9)
		
		vRoster:=vRoster+String:C10([Volunteers:9]TimeWorked:16)
		vRoster:=vRoster+Char:C90(13)+Char:C90(10)
		
		SEND PACKET:C103(gDocRef; vRoster)
		
		vRoster:=""
		
		NEXT RECORD:C51([Volunteers:9])
		
		//Message_Update ("Exporting Consignors:  "+String($i;"###,###"))
		
	End for 
	
	
	vRoster:=Char:C90(10)
	SEND PACKET:C103(gDocRef; vRoster)
	
	FLUSH CACHE:C297
	
	CLOSE DOCUMENT:C267(gDocRef)
	
	UNLOAD RECORD:C212([Volunteers:9])
	
End if   //open doc 