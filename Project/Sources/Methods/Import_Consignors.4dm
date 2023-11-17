//%attributes = {}
//Import Consignors from Quantum Delta website

//Will overwrite existing records, won't duplicate.
//Should we only import new and Datachanged=True????????????
C_LONGINT:C283($i)
C_LONGINT:C283(vUpdateConsignor)
C_TEXT:C284($Message)
C_TIME:C306(gDocRef)
C_TEXT:C284($Pathname; vFileType; vCon_Percent; vCon_Fee; vCon_Address2; vCon_DataChanged; vCon_Consigning)
gDocRef:=?00:00:00?


MESSAGES OFF:C175
READ WRITE:C146([Consignors:1])
gCenterWind:=True:C214

gDocRef:=Open document:C264($Pathname; "TXT")

If (OK=1)  //open doc?
	
	QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
	If (Records in selection:C76([Preferences:3])>0)
		vPreferencesConsignorFee:=[Preferences:3]DefaultConsignorFee:2
		vPreferencesConsignorPercent:=[Preferences:3]DefaultConsignorPercent:3
	Else 
		vPreferencesConsignorFee:=0
		vPreferencesConsignorPercent:=0
	End if 
	
	UNLOAD RECORD:C212([Preferences:3])
	
	
	Message_Think("Importing data, please wait... ")
	CREATE EMPTY SET:C140([Consignors:1]; "IMPORT")
	vFileType:=" "
	
	While (OK=1)
		vUpdateConsignor:=0
		vCon_DataChanged:=""
		vCon_Consigning:=")"
		
		RECEIVE PACKET:C104(gDocRef; vCon_FirstName; Char:C90(9))
		If (vCon_FirstName="First Name")
			//This will set the first time and stay set the whole time to identify the file type
			vFileType:="QuantumDelta"
			
		End if 
		RECEIVE PACKET:C104(gDocRef; vCon_LastName; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCon_Email; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCon_ConsignorNumber; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCon_Address1; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCon_Address2; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCon_City; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCon_State; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCon_Zip; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCon_ReferedBy; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCon_HomePhone; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCon_CellPhone; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCon_WorkPhone; Char:C90(9))
		If (vFileType="QuantumDelta")
			RECEIVE PACKET:C104(gDocRef; vCon_CenterName; Char:C90(13)+Char:C90(10))
		Else 
			//If not QuantumDelta, then this acts as a system import/export
			RECEIVE PACKET:C104(gDocRef; vCon_CenterName; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vCon_Percent; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vCon_Fee; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vCon_Comment; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vCon_Envelope; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vCon_DataChanged; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vCon_Volunteer; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vCon_NewCustomer; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vCon_PickedUp; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vCon_Donate; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vCon_Valet; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vCon_Consigning; Char:C90(13)+Char:C90(10))
		End if 
		
		If (vCon_FirstName#"First Name") & (vCon_ConsignorNumber#"")
			
			QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=vCon_ConsignorNumber)
			
			If (Records in selection:C76([Consignors:1])=0)
				CREATE RECORD:C68([Consignors:1])
				vUpdateConsignor:=1
			End if 
			If (vCon_DataChanged="1") | (vCon_Consigning="1")
				vUpdateConsignor:=1
			End if 
			
			If (vUpdateConsignor=1)
				[Consignors:1]First Name:2:=vCon_FirstName
				[Consignors:1]Last Name:3:=vCon_LastName
				[Consignors:1]Email Address:13:=vCon_Email
				[Consignors:1]Consignor Number:1:=vCon_ConsignorNumber
				[Consignors:1]Address1:4:=vCon_Address1
				[Consignors:1]City:6:=vCon_City
				[Consignors:1]State:7:=vCon_State
				[Consignors:1]Zip:8:=vCon_Zip
				[Consignors:1]Referred By:12:=vCon_ReferedBy
				[Consignors:1]Home Phone:9:=vCon_HomePhone
				[Consignors:1]Cell Phone:10:=vCon_CellPhone
				[Consignors:1]Work Phone:11:=vCon_WorkPhone
				[Consignors:1]Comment:24:=vCon_Comment
				
				
				vCon_CenterName2:=Replace string:C233(vCon_CenterName; Char:C90(Double quote:K15:41); "")
				//9.2 to remove leading spaces
				//$1 = text string
				//C_TEXT($0;$1)
				//$1:=vCon_CenterName2
				$Pos:=0
				$StrLen:=Length:C16(vCon_CenterName2)
				Repeat 
					$Pos:=$Pos+1
				Until ((vCon_CenterName2[[$Pos]]#" ") | ($Pos=$StrLen))
				vCon_CenterName3:=Substring:C12(vCon_CenterName2; $Pos; ($StrLen-$Pos)+1)
				[Consignors:1]Center Name:35:=vCon_CenterName3
				
				
				If (Num:C11(vCon_Percent)#0)
					[Consignors:1]Percent:14:=Num:C11(vCon_Percent)
				Else 
					[Consignors:1]Percent:14:=vPreferencesConsignorPercent
				End if 
				
				If (Num:C11(vCon_Fee)#0)
					[Consignors:1]Consignor Fee:17:=Num:C11(vCon_Fee)
				Else 
					[Consignors:1]Consignor Fee:17:=vPreferencesConsignorFee
				End if 
				
				If (vFileType#"QuantumDelta")
					If (vCon_Envelope="1")
						[Consignors:1]Envelope:15:=True:C214
					Else 
						[Consignors:1]Envelope:15:=False:C215
					End if 
					
					If (vCon_DataChanged="1")
						[Consignors:1]DataChanged:18:=True:C214
					Else 
						[Consignors:1]DataChanged:18:=False:C215
					End if 
					
					If (vCon_Volunteer="1")
						[Consignors:1]Volunteer:26:=True:C214
					Else 
						[Consignors:1]Volunteer:26:=False:C215
					End if 
					
					If (vCon_NewCustomer="1")
						[Consignors:1]New Customer:27:=True:C214
					Else 
						[Consignors:1]New Customer:27:=False:C215
					End if 
					
					If (vCon_PickedUp="1")
						[Consignors:1]Picked Up:25:=True:C214
					Else 
						[Consignors:1]Picked Up:25:=False:C215
					End if 
					
					If (vCon_Donate="1")
						[Consignors:1]Donating:34:=True:C214
					Else 
						[Consignors:1]Donating:34:=False:C215
					End if 
					
					If (vCon_Valet="1")
						[Consignors:1]Valet:36:=True:C214
					Else 
						[Consignors:1]Valet:36:=False:C215
					End if 
					
					If (vCon_Consigning="1")
						[Consignors:1]Consigning this sale:16:=True:C214
					Else 
						[Consignors:1]Consigning this sale:16:=False:C215
					End if 
					
				End if 
				
				SAVE RECORD:C53([Consignors:1])
				ADD TO SET:C119([Consignors:1]; "IMPORT")
				
			End if 
		End if 
		
	End while 
	
	FLUSH CACHE:C297
	
	CLOSE DOCUMENT:C267(gDocRef)
	CLOSE WINDOW:C154
	
	USE SET:C118("IMPORT")
	CLEAR SET:C117("IMPORT")
	
End if   //open doc