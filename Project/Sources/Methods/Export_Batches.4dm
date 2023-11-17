//%attributes = {}
C_LONGINT:C283($i; $i2; $iSub)
C_TEXT:C284(vRoster; vRoster2; vRoster3)
gCenterWind:=True:C214

gDocRef:=?00:00:00?
$i:=0
$iSub:=0
vRoster:=""
gDocRef:=Create document:C266(""; "txt")
vBatchCount:=0
vSalesCount:=0

If (OK=1)
	
	Message_Think("Exporting data, please wait... ")
	
	
	//**************This will export those ghost sales*****************************
	//QUERY([Sales];[Sales]Batch ID="")
	//If (Records in selection([Sales])>0)
	//APPLY TO SELECTION([Sales];[Sales]Batch ID:="XX-9999")
	//
	//QUERY([Point of Sale];[Point of Sale]Batch ID="XX-9999")
	//If (Records in selection([Point of Sale])=0)
	//CREATE RECORD([Point of Sale])
	//[Point of Sale]Batch ID:="XX-9999"
	//[Point of Sale]Comments:="This batch was autmatically created by the system to ensure all sales get exporte"+"d."
	//[Point of Sale]Computer Number:="XX"
	//[Point of Sale]NewCount:=1
	//SAVE RECORD([Point of Sale])
	//UNLOAD RECORD([Point of Sale])
	//End if 
	//End if 
	//
	//
	//
	//ALL RECORDS([Point of Sale])
	FIRST RECORD:C50([Point of Sale:5])
	
	For ($i; 1; Records in selection:C76([Point of Sale:5]))
		vBatchCount:=vBatchCount+1
		vRoster:=vRoster+[Point of Sale:5]Batch ID:1
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Entered By:2
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Entered Date Stamp:4)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Entered Time Stamp:3)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]NewCount:6)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Sold Date:5)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]ReduceBy:8)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Computer Number:7
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Paid_AMEX:24)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Paid_Cash:19)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Paid_Check:20)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Paid_Discover:23)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Paid_GiftCard:25)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Paid_IOU:26)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Paid_Other:29)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Paid_Mastercard:22)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Paid_Visa:21)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Payment Method:17
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+String:C10([Point of Sale:5]Paid_ChangeDue:28)
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Shopper Address1:11
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Shopper City:12
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Shopper Email:27
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Shopper First Name:9
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Shopper Last Name:10
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Shopper Phone:15
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Shopper State:13
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Shopper Zip:14
		vRoster:=vRoster+Char:C90(9)
		vRoster:=vRoster+[Point of Sale:5]Comments:18
		vRoster:=vRoster+Char:C90(9)
		
		If ([Point of Sale:5]Taxed:16=True:C214)
			vRoster:=vRoster+"1"
			vRoster:=vRoster+Char:C90(9)
		Else 
			vRoster:=vRoster+"0"
			vRoster:=vRoster+Char:C90(9)
		End if 
		
		
		QUERY:C277([Sales:2]; [Sales:2]Batch ID:12=[Point of Sale:5]Batch ID:1)
		//RELATE ONE SELECTION([Student2Roster];[Student Data])
		
		If (Records in selection:C76([Sales:2])>0)
			For ($i2; 1; Records in selection:C76([Sales:2]))
				vSalesCount:=vSalesCount+1
				vRoster2:=""
				vRoster2:=vRoster2+[Sales:2]Barcode:9+Char:C90(9)
				vRoster2:=vRoster2+String:C10([Sales:2]Item Number:13)+Char:C90(9)
				vRoster2:=vRoster2+[Sales:2]Consignor Number:6+Char:C90(9)
				vRoster2:=vRoster2+[Sales:2]Entered By:10+Char:C90(9)
				vRoster2:=vRoster2+String:C10([Sales:2]Entered Date Stamp:7)+Char:C90(9)
				vRoster2:=vRoster2+String:C10([Sales:2]Entered Time Stamp:8)+Char:C90(9)
				vRoster2:=vRoster2+[Sales:2]Item Description:4+Char:C90(9)
				vRoster2:=vRoster2+String:C10([Sales:2]Sold Date:11)+Char:C90(9)
				vRoster2:=vRoster2+String:C10([Sales:2]List Price:3)+Char:C90(9)
				vRoster2:=vRoster2+String:C10([Sales:2]Sold Price:2)+Char:C90(9)
				If ([Sales:2]Unique Entry ID:1="")
					GetSequenceNums("Sales")
					//v12
					//vRoster2:=vRoster2+[Point of Sale]Batch ID+"-"+String(vSalesSequenceNumber)+Char(9)
					//[Sales]Unique Entry ID:=[Point of Sale]Batch ID+"-"+String(vSalesSequenceNumber)
					[Sales:2]Unique Entry ID:1:=Generate UUID:C1066
					SAVE RECORD:C53([Sales:2])
				Else 
					vRoster2:=vRoster2+[Sales:2]Unique Entry ID:1+Char:C90(9)
				End if 
				vRoster2:=vRoster2+String:C10([Sales:2]TaxAmount:17)+Char:C90(9)
				vRoster2:=vRoster2+[Sales:2]Taxed:16+Char:C90(9)
				vRoster2:=vRoster2+String:C10([Sales:2]AltTaxAmount:20)+Char:C90(9)
				vRoster2:=vRoster2+[Sales:2]AltTaxed:19+Char:C90(9)
				vRoster2:=vRoster2+[Sales:2]Item Size:5+Char:C90(9)
				vRoster2:=vRoster2+[Sales:2]Category:14+Char:C90(9)
				vRoster2:=vRoster2+[Sales:2]ReturnReason:18+Char:C90(9)
				vRoster2:=vRoster2+[Sales:2]PercentOff:15+Char:C90(9)
				vRoster2:=vRoster2+Char:C90(10)
				vRoster3:=""
				vRoster3:=vRoster+vRoster2
				SEND PACKET:C103(gDocRef; vRoster3)
				NEXT RECORD:C51([Sales:2])
				
			End for 
			
		End if 
		
		vRoster:=""
		
		NEXT RECORD:C51([Point of Sale:5])
		
		//Message_Update ("Exporting Batches:  "+String($i;"###,###"))
		
	End for 
	
	
	
	
	vRoster3:=""
	//vRoster3:=Char(10)
	SEND PACKET:C103(gDocRef; vRoster3)
	
	FLUSH CACHE:C297
	
	CLOSE DOCUMENT:C267(gDocRef)
	
	UNLOAD RECORD:C212([Point of Sale:5])
	
	//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
	MessageBox("Export"; "Total Records Exported:  (Batches-"+String:C10(vBatchCount)+")  (Sales-"+String:C10(vSalesCount)+")."; "OKBox"; "green")
	
End if   //open doc 


