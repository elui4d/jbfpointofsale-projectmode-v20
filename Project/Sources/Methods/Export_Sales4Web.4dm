//%attributes = {}


Open Centered window(500; 400; Movable dialog box:K34:7; " ")

DIALOG:C40([Dialogs:7]; "UploadSoldItems")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 
If (ok=1)
	vSelectedSoldDate:=aUploadSoldDate{aUploadSoldDate}
	
	C_LONGINT:C283($i; $i2; $iSub)
	C_TEXT:C284(vRoster)
	gDocRef:=?00:00:00?
	$i:=0
	$iSub:=0
	vRoster:=""
	gDocRef:=Create document:C266(""; "TXT")
	vFilename:=document
	vUploadFilename:=document
	$DocCount:=1
	If (OK=1)
		
		Message_Think("Exporting data, please wait... ")
		
		Case of 
			: (rbUpload1=1)
				ALL RECORDS:C47([Sales:2])
				QUERY:C277([Sales:2]; [Sales:2]Item Number:13>0)
			: (rbUpload2=1)
				QUERY SELECTION:C341([Sales:2]; [Sales:2]Item Number:13>0)
			: (rbUpload3=1)
				QUERY:C277([Sales:2]; [Sales:2]Item Number:13>0; *)
				QUERY:C277([Sales:2];  & ; [Sales:2]Sold Date:11=vSelectedSoldDate)
		End case 
		
		FIRST RECORD:C50([Sales:2])
		$cnt:=0
		For ($i; 1; Records in selection:C76([Sales:2]))
			$cnt:=$cnt+1
			
			vRoster:=vRoster+String:C10([Sales:2]Item Number:13)
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+String:C10([Sales:2]Sold Price:2)
			vRoster:=vRoster+Char:C90(9)
			vRoster:=vRoster+String:C10([Sales:2]Sold Date:11)
			vRoster:=vRoster+Char:C90(13)
			SEND PACKET:C103(gDocRef; vRoster)
			
			vRoster:=""
			
			NEXT RECORD:C51([Sales:2])
			//This is where we set the number of records to upload
			If (cbSmallFiles=1) & ($cnt>4999)
				//Close Doc
				
				//vRoster:=Char(10)
				//SEND PACKET(gDocRef;vRoster)
				CLOSE DOCUMENT:C267(gDocRef)
				
				//New for AutoUpload - 6/2015
				If (cbUpload=1)
					
					AutoUploadofSales
					
				End if 
				
				$DocCount:=$DocCount+1
				
				//Open new file
				
				vFilename:=Replace string:C233(vFilename; ".TXT"; "")
				
				gDocRef:=?00:00:00?
				gDocRef:=Create document:C266(vFilename+String:C10($DocCount)+".TXT")
				vUploadFilename:=vFilename+String:C10($DocCount)+".TXT"
				$cnt:=0
			End if 
			
			
			
			
		End for 
		
		
		vRoster:=Char:C90(10)
		SEND PACKET:C103(gDocRef; vRoster)
		CLOSE DOCUMENT:C267(gDocRef)
		
		//New for AutoUpload - 6/2015
		If (cbUpload=1)
			
			AutoUploadofSales
			
		End if 
		
		
		UNLOAD RECORD:C212([Sales:2])
		
	End if   //open doc 
End if 