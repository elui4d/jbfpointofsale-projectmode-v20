//%attributes = {}
//Import_Batches

C_LONGINT:C283($i)
C_TEXT:C284($Message)
C_TIME:C306(gDocRef)
C_TEXT:C284($Pathname; vFileType)
gDocRef:=?00:00:00?
C_LONGINT:C283(update)

MESSAGES OFF:C175
READ WRITE:C146([Point of Sale:5])
gCenterWind:=True:C214

vSingle:=0
vBatch:=0
vCancel:=0

Open Centered window(370; 175; Movable dialog box:K34:7; " ")  // Open a modal window 
DIALOG:C40([Dialogs:7]; "ImportBatches")  // Display a custom search dialog 
CLOSE WINDOW:C154  // No longer need the modal window 

Case of 
	: (vSingle=1)
		
		gDocRef:=Open document:C264($Pathname; "")
		Import_BatchesMeat
		
	: (vBatch=1)
		vAppPath:=aa_FindPathName(Application file:C491)
		vDBPath:=vAppPath+"ImportBatches\\"
		DOCUMENT LIST:C474(vDBPath; aImportFiles)
		
		If (Size of array:C274(aImportFiles)#0)
			
			For ($i; 1; Size of array:C274(aImportFiles))
				vDocName:=vDBPath+aImportFiles{$i}
				gDocRef:=Open document:C264(vDocName)
				Import_BatchesMeat
			End for 
			
		End if 
		
	: (vCancel=1)
		//Do nothing
		
End case 


