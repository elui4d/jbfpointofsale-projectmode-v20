//%attributes = {}


C_LONGINT:C283($i; $i2; $iSub)
C_TEXT:C284(vRoster)
gDocRef:=?00:00:00?
$i:=0
$iSub:=0
vRoster:=""
vAppPath:=aa_FindPathName(Application file:C491)
//User DBname+batchNumber
vPOSUploadFilename:=vAppPath+<>vDataBaseName+"-"+vShopperBatchID+".txt"
gDocRef:=Create document:C266(vPOSUploadFilename; "TXT")
vUploadFilename:=document
$DocCount:=1
If (OK=1)
	
	//Message_Think ("Exporting data, please wait... ")
	
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
		
	End for 
	
	vRoster:=Char:C90(10)
	SEND PACKET:C103(gDocRef; vRoster)
	CLOSE DOCUMENT:C267(gDocRef)
	
	AutoUploadofSales
	
	//UNLOAD RECORD([Sales])
	MAXIMIZE WINDOW:C453
End if   //open doc 
