//%attributes = {}
//Import Consignors from Quantum Delta website

C_LONGINT:C283($i)
C_TEXT:C284($Message)
C_TIME:C306(gDocRef)
C_TEXT:C284($Pathname; vFileType; vBar_ItemNumber; vBar_NoData; vBar_Price)
gDocRef:=?00:00:00?


MESSAGES OFF:C175
READ WRITE:C146([Inventory:4])
gCenterWind:=True:C214

gDocRef:=Open document:C264($Pathname; "")

If (OK=1)  //open doc?
	Message_Think("Importing data, please wait... ")
	
	CREATE EMPTY SET:C140([Inventory:4]; "IMPORT")
	
	vWhileVar:=1
	While (vWhileVar=1)
		
		RECEIVE PACKET:C104(gDocRef; vBar_ConsignorNumber; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vBar_ItemNumber; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vBar_ItemDescription; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vBar_Size; Char:C90(9))
		//****Remove the NODATA once we get the export correct
		//RECEIVE PACKET(gDocRef;vBar_NoData;Char(9))
		//**************************************************************
		RECEIVE PACKET:C104(gDocRef; vBar_Price; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCategory; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vBar_Reduce; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vDonate; Char:C90(9))
		RECEIVE PACKET:C104(gDocRef; vCreatedDate; Char:C90(13)+Char:C90(10))
		
		vWhileVar:=OK
		
		QUERY:C277([Inventory:4]; [Inventory:4]Barcode Item Number:1=Num:C11(vBar_ItemNumber))
		
		If (Records in selection:C76([Inventory:4])=0) | (Date:C102(vCreatedDate)>[Inventory:4]Created Date:10)
			If (vBar_ConsignorNumber#"ConsignorNumber") & (vBar_ConsignorNumber#"")
				If (Records in selection:C76([Inventory:4])=0)
					CREATE RECORD:C68([Inventory:4])
				End if 
				[Inventory:4]Consignor Number:3:=StripSpaces(vBar_ConsignorNumber)
				[Inventory:4]Barcode Item Number:1:=Num:C11(vBar_ItemNumber)
				[Inventory:4]Item Description:4:=vBar_ItemDescription
				[Inventory:4]Size:5:=vBar_Size
				[Inventory:4]Price:6:=Num:C11(vBar_Price)
				[Inventory:4]Category:8:=vCategory
				If (vBar_Reduce="True")
					[Inventory:4]Reduce:7:=True:C214
				Else 
					[Inventory:4]Reduce:7:=False:C215
				End if 
				If (vDonate="True")
					[Inventory:4]Donate:9:=True:C214
				Else 
					[Inventory:4]Donate:9:=False:C215
				End if 
				[Inventory:4]Created Date:10:=Date:C102(vCreatedDate)
				
				SAVE RECORD:C53([Inventory:4])
				ADD TO SET:C119([Inventory:4]; "IMPORT")
				//$i:=$i+1
				//Message_Think ("Importing data, please wait... ")
				//Message_Update ("Importing record number "+String($i;"###,###"))
				//DISPLAY RECORD([Dialogs])
			End if 
		End if 
		
	End while 
	
	FLUSH CACHE:C297
	
	CLOSE DOCUMENT:C267(gDocRef)
	CLOSE WINDOW:C154
	
	USE SET:C118("IMPORT")
	CLEAR SET:C117("IMPORT")
	
End if   //open doc