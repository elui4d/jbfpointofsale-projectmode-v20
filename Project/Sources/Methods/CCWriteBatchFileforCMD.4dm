//%attributes = {}

If (OK=1)
	
	vLine1:="REM  Loading Credit Card App....................."+Char:C90(13)+Char:C90(10)
	SEND PACKET:C103(vhDoc; vLine1)
	vLine2:="echo off"+Char:C90(13)+Char:C90(10)
	SEND PACKET:C103(vhDoc; vLine2)
	vLine3:=vePNJPOS_Path+" -u "+vePNJPOS_Clerk+" -amount "+String:C10(vCCAmount)+" -p "+vePNJPOS_Password+Char:C90(13)
	//vLine3:=vePNJPOSPath+" -u "+vClerk+" -amount "+String(vCCAmount)+" -p  "+Char(13)
	//vLine3:="c:\eProcessingNetwork\ePNJPOS\jposcmd.exe -u clerk1 -amount 34.35 -p  "+Char(13)
	SEND PACKET:C103(vhDoc; vLine3)
	//vLine4:=Char(10)
	//SEND PACKET(vhDoc;vLine4)
	CLOSE DOCUMENT:C267(vhDoc)  // Close the document 
End if 

//This will launch the bat file
LAUNCH EXTERNAL PROCESS:C811(document)




//rem if your account has a password add-p password to the command line
//
//echo off
//c:\eProcessingNetwork\ePNJPOS\jposcmd.exe-u clerk1-amount 34.35-p
//
//
//vRoster:=vRoster+String(VFMVolunteers)
//vRoster:=vRoster+Char(13)
//SEND PACKET(gDocRef;vRoster)
//
//vRoster:=Char(10)
//SEND PACKET(gDocRef;vRoster)
//CLOSE DOCUMENT(gDocRef)