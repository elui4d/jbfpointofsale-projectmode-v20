//%attributes = {}


C_LONGINT:C283($i; $i2; $iSub)
C_TEXT:C284(vRoster)
gDocRef:=?00:00:00?
$i:=0
$iSub:=0
vRoster:=""
vAppPath:=aa_FindPathName(Application file:C491)
//User DBname+batchNumber
vPOSUploadFilename:=vAppPath+<>vDataBaseName+" - Return - "+String:C10([Sales:2]Item Number:13)+".txt"
gDocRef:=Create document:C266(vPOSUploadFilename; "TXT")
vUploadFilename:=document
$DocCount:=1
If (OK=1)
	
	//Message_Think ("Exporting data, please wait... ")
	
	//FIRST RECORD([Sales])
	//$cnt:=0
	//For ($i;1;Records in selection([Sales]))
	//$cnt:=$cnt+1
	
	vRoster:=vRoster+String:C10([Sales:2]Item Number:13)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10([Sales:2]Sold Price:2)
	vRoster:=vRoster+Char:C90(9)
	vRoster:=vRoster+String:C10([Sales:2]Sold Date:11)
	vRoster:=vRoster+Char:C90(10)
	//SEND PACKET(gDocRef;vRoster)
	//
	//vRoster:=""
	//
	//NEXT RECORD([Sales])
	//
	//End for 
	
	//vRoster:=Char(10)
	SEND PACKET:C103(gDocRef; vRoster)
	CLOSE DOCUMENT:C267(gDocRef)
	
	//AutoUploadofSales 
	//added to remove upload message so Tools dlog wouldn't come forward
	AutoUploadOfSalesReturns2
	CLOSE WINDOW:C154
	
	
	//UNLOAD RECORD([Sales])
	//MAXIMIZE WINDOW
End if   //open doc 
