//%attributes = {}

//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";), 4=TextColor
MessageBox("Print Volunteer Badges"; "This will print 1 badge for every volunteer and 9 per page.  This operation canno"+"t be cancelled.  Continue?"; "YesNoBox"; "Red")

If (ok=1)
	
	C_PICTURE:C286($barcode; $helppict; vBarcodePIC; vBarcodePIC2; vBarcodePIC3)
	
	SET PRINT OPTION:C733(2; 2)  //Land
	PRINT SETTINGS:C106
	
	ORDER BY:C49([Volunteers:9]; [Volunteers:9]Last Name:3; >)
	
	DISTINCT VALUES:C339([Volunteers:9]Consignor Number:1; asCNum)
	
	vBreakCounter:=0
	
	For ($vlRecord; 1; Size of array:C274(asCNum))
		
		vConsignorFirstName3:=""
		vConsignorLastName3:=""
		vConsignorNumber3:=""
		vShiftName3:=""
		//vBarcode3:=?
		vConsignorFirstName2:=""
		vConsignorLastName2:=""
		vConsignorNumber2:=""
		vShiftName2:=""
		//vBarcode2:=?
		vConsignorFirstName:=""
		vConsignorLastName:=""
		vConsignorNumber:=""
		vShiftName1A:=""
		vShiftName1B:=""
		vShiftName1C:=""
		vShiftName1D:=""
		vShiftName1E:=""
		vShiftName2A:=""
		vShiftName2B:=""
		vShiftName2C:=""
		vShiftName2D:=""
		vShiftName2E:=""
		vShiftName3A:=""
		vShiftName3B:=""
		vShiftName3C:=""
		vShiftName3D:=""
		vShiftName3E:=""
		
		//vBarcode:=?
		
		QUERY:C277([Volunteers:9]; [Volunteers:9]Consignor Number:1=asCNum{$vlRecord})
		If (Records in selection:C76([Volunteers:9])>0)
			vShiftName:=""
			For ($i; 1; Records in selection:C76([Volunteers:9]))
				vConsignorFirstName:=[Volunteers:9]First Name:2
				vConsignorLastName:=[Volunteers:9]Last Name:3
				vConsignorNumber:=[Volunteers:9]Consignor Number:1
				Case of 
					: ($i=1)
						vShiftName1A:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
					: ($i=2)
						vShiftName1B:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
					: ($i=3)
						vShiftName1C:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
					: ($i=4)
						vShiftName1D:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
					: ($i=5)
						vShiftName1E:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
				End case 
				NEXT RECORD:C51([Volunteers:9])
			End for 
		End if 
		
		vType:="Code128A"
		vBarcodePIC:=Barcode_Create(vType; vConsignorNumber; True:C214; True:C214; True:C214)
		
		//Loop 2
		
		If ($vlRecord<Size of array:C274(asCNum))
			
			$vlRecord:=$vlRecord+1
			
			QUERY:C277([Volunteers:9]; [Volunteers:9]Consignor Number:1=asCNum{$vlRecord})
			If (Records in selection:C76([Volunteers:9])>0)
				vShiftName2:=""
				For ($i; 1; Records in selection:C76([Volunteers:9]))
					vConsignorFirstName2:=[Volunteers:9]First Name:2
					vConsignorLastName2:=[Volunteers:9]Last Name:3
					vConsignorNumber2:=[Volunteers:9]Consignor Number:1
					Case of 
						: ($i=1)
							vShiftName2A:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
						: ($i=2)
							vShiftName2B:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
						: ($i=3)
							vShiftName2C:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
						: ($i=4)
							vShiftName2D:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
						: ($i=5)
							vShiftName2E:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
					End case 
					NEXT RECORD:C51([Volunteers:9])
				End for 
			End if 
			
			vType:="Code128A"
			vBarcodePIC2:=Barcode_Create(vType; vConsignorNumber2; True:C214; True:C214; True:C214)
		End if 
		
		
		//Loop3
		
		If ($vlRecord<Size of array:C274(asCNum))
			$vlRecord:=$vlRecord+1
			
			QUERY:C277([Volunteers:9]; [Volunteers:9]Consignor Number:1=asCNum{$vlRecord})
			If (Records in selection:C76([Volunteers:9])>0)
				vShiftName3:=""
				For ($i; 1; Records in selection:C76([Volunteers:9]))
					vConsignorFirstName3:=[Volunteers:9]First Name:2
					vConsignorLastName3:=[Volunteers:9]Last Name:3
					vConsignorNumber3:=[Volunteers:9]Consignor Number:1
					Case of 
						: ($i=1)
							vShiftName3A:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
						: ($i=2)
							vShiftName3B:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
						: ($i=3)
							vShiftName3C:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
						: ($i=4)
							vShiftName3D:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
						: ($i=5)
							vShiftName3E:=String:C10([Volunteers:9]Date:6)+" - "+[Volunteers:9]Scheduled Time:7+" - "+[Volunteers:9]Shift Name:4
					End case 
					NEXT RECORD:C51([Volunteers:9])
				End for 
				
			End if 
			
			vType:="Code128A"
			vBarcodePIC3:=Barcode_Create(vType; vConsignorNumber3; True:C214; True:C214; True:C214)
		End if 
		
		
		
		
		
		
		Print form:C5([Dialogs:7]; "Print_VolunteerBadges2")
		
		vBreakCounter:=vBreakCounter+1
		If (vBreakCounter=2)
			//Can't do the > to continue.  For some reason, the barcode graphics won't render on all pages.  Memory issue I think.   (>)
			//added this on 2/14 after v13 allowed new print server
			PAGE BREAK:C6(>)
			vBreakCounter:=0
			//$openTime:=Current time+0
			//While (($openTime+5)>(Current time+0))
			//DELAY PROCESS(Current process;10)
			//End while 
			
			
		End if 
		
		CLEAR VARIABLE:C89(vBarcodePIC)
		CLEAR VARIABLE:C89(vBarcodePIC2)
		CLEAR VARIABLE:C89(vBarcodePIC3)
		//NEXT RECORD
	End for 
	PAGE BREAK:C6
	
	UNLOAD RECORD:C212([Volunteers:9])
	ALL RECORDS:C47([Volunteers:9])
End if 
