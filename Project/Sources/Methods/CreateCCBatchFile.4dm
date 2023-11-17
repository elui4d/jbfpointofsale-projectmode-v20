//%attributes = {}
//vAppPath:=aa_FindPathName (Application file)
//gDocRef:=Create document(vAppPath+"Files\\"+vEventFileName+" Customer File";"TXT")
//vFilename2:=document

C_TEXT:C284(vLine1; vLine2; vLine3; vLine4)
C_TIME:C306(vhDoc)
vAppPath:=aa_FindPathName(Application file:C491)
vhDoc:=Create document:C266(vAppPath+"Files\\TempFile"; "bat")
vTempFile:=document

//vePNJPOSPath:="c:\\eProcessingNetwork\\ePNJPOS\\jposcmd.exe"
//vClerk:="clerk1"
//vCCAmount:="123.45"


If (vNEW_ePNJPOS_Enabled=True:C214)
	CCWriteBatchFileNEW
Else 
	CCWriteBatchFileforCMD
End if 
