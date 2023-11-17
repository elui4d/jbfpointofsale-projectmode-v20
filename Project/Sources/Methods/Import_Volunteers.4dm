//%attributes = {}
//Import Volunteers from Quantum Delta website

//Must import into clear Volunteer table

C_LONGINT:C283($i)
C_TEXT:C284($Message)
C_TIME:C306(gDocRef)
C_TEXT:C284($Pathname; vFileType; vVol_Day; vVol_HomePhone; vVol_CellPhone; vVol_Email)
gDocRef:=?00:00:00?


MESSAGES OFF:C175
READ WRITE:C146([Volunteers:9])
gCenterWind:=True:C214

gDocRef:=Open document:C264($Pathname; "TXT")

If (OK=1)  //open doc?
	
	Message_Think("Importing data, please wait... ")
	CREATE EMPTY SET:C140([Volunteers:9]; "IMPORT")
	vFileType:=" "
	
	QUERY:C277([Preferences:3]; [Preferences:3]ID:1="ME")
	vDefaultPayRate:=[Preferences:3]DefaultPayRate:12
	vDefaultVolunteerFee:=[Preferences:3]DefaultVolunteerFee:13
	vDefaultVolunteerPercent:=[Preferences:3]DefaultVolunteerPercent:14
	UNLOAD RECORD:C212([Preferences:3])
	
	While (OK=1)
		RECEIVE PACKET:C104(gDocRef; vVol_FirstName; Char:C90(9))
		If (vVol_FirstName="First Name")
			//This will set the first time and stay set the whole time to identify the file type
			vFileType:="QuantumDelta"
		End if 
		RECEIVE PACKET:C104(gDocRef; vVol_LastName; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vVol_ConsignorNumber; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vVol_ShiftName; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vVol_Category; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vVol_Day; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vVol_Date; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vVol_Time; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vVol_HomePhone; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vVol_CellPhone; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vVol_Email; Char:C90(9))
		If (vFileType="QuantumDelta")
			RECEIVE PACKET:C104(gDocRef; vVol_UpdateShifts; Char:C90(13)+Char:C90(10))
			vVol_UpdateShifts:=""
			vVol_Comments:=""
			vVol_Complete:=""
			vVol_InTime:=""
			vVol_MoneyEarned:=""
			vVol_OutTime:=""
			vVol_PaidJob:=""
			vVol_Pass:=""
			vVol_PayRate:=""
			vVol_TimeWorked:=""
			
		Else 
			//If not QuantumDelta, then this acts as a system import/export
			RECEIVE PACKET:C104(gDocRef; vVol_UpdateShifts; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vVol_Comments; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vVol_Complete; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vVol_InTime; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vVol_MoneyEarned; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vVol_OutTime; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vVol_PaidJob; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vVol_Pass; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vVol_PayRate; Char:C90(9))
			RECEIVE PACKET:C104(gDocRef; vVol_TimeWorked; Char:C90(13)+Char:C90(10))
			ok:=1  //set this to 1 because QD import wasn't getting shut off
		End if 
		
		If (vVol_FirstName="") & (vVol_LastName="") & (vVol_consignorNumber="")  //Break out of while
			OK:=0
		End if 
		
		If (vVol_FirstName#"First Name") & (OK=1)
			CREATE RECORD:C68([Volunteers:9])
			
			
			[Volunteers:9]Consignor Number:1:=vVol_consignorNumber
			[Volunteers:9]First Name:2:=vVol_FirstName
			[Volunteers:9]Last Name:3:=vVol_LastName
			[Volunteers:9]Shift Name:4:=vVol_ShiftName
			[Volunteers:9]Category:5:=vVol_Category
			[Volunteers:9]Date:6:=Date:C102(vVol_Date)
			[Volunteers:9]Scheduled Time:7:=vVol_Time
			
			[Volunteers:9]Comments:11:=vVol_Comments
			
			If (vVol_Complete="1")
				[Volunteers:9]Complete:10:=True:C214
			Else 
				[Volunteers:9]Complete:10:=False:C215
			End if 
			
			[Volunteers:9]In Time:8:=vVol_InTime
			[Volunteers:9]Money Earned:15:=Num:C11(vVol_MoneyEarned)
			[Volunteers:9]Out Time:9:=vVol_OutTime
			
			If (vVol_PaidJob="1")
				[Volunteers:9]Paid Job:12:=True:C214
			Else 
				[Volunteers:9]Paid Job:12:=False:C215
			End if 
			
			If (vVol_Pass="1")
				[Volunteers:9]Pass:14:=True:C214
			Else 
				[Volunteers:9]Pass:14:=False:C215
			End if 
			
			If (Num:C11(vVol_PayRate)=0)
				[Volunteers:9]Pay Rate:13:=vDefaultPayRate
			Else 
				[Volunteers:9]Pay Rate:13:=Num:C11(vVol_PayRate)
			End if 
			
			[Volunteers:9]TimeWorked:16:=Time:C179(vVol_TimeWorked)
			
			SAVE RECORD:C53([Volunteers:9])
			ADD TO SET:C119([Volunteers:9]; "IMPORT")
			
			QUERY:C277([Consignors:1]; [Consignors:1]Consignor Number:1=vVol_consignorNumber)
			If (Records in selection:C76([Consignors:1])=1)
				//We are going to get Defaults when a shift is COMPLETED
				
				If (vVol_Complete="1")
					[Consignors:1]Consignor Fee:17:=vDefaultVolunteerFee
					[Consignors:1]Percent:14:=vDefaultVolunteerPercent
					[Consignors:1]Volunteer:26:=True:C214
					SAVE RECORD:C53([Consignors:1])
					UNLOAD RECORD:C212([Consignors:1])
				Else 
					//  `no change to consignor record
				End if 
				
			Else 
				If (Records in selection:C76([Consignors:1])=0)  //Put this here in case the volunteer table contains people not in the consingor list
					[Consignors:1]Consignor Number:1:=vVol_consignorNumber
					[Consignors:1]First Name:2:=vVol_FirstName
					[Consignors:1]Last Name:3:=vVol_LastName
					[Consignors:1]Address1:4:="This record was added from the Volunteer import."
					SAVE RECORD:C53([Consignors:1])
					UNLOAD RECORD:C212([Consignors:1])
				End if 
			End if 
			
			
		End if 
		
	End while 
	
	FLUSH CACHE:C297
	
	CLOSE DOCUMENT:C267(gDocRef)
	CLOSE WINDOW:C154
	
	USE SET:C118("IMPORT")
	CLEAR SET:C117("IMPORT")
	
End if   //open doc