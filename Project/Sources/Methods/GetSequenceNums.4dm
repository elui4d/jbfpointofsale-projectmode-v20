//%attributes = {}

C_TEXT:C284($1)
C_LONGINT:C283(vBatchSequenceNumber; vSalesSequenceNumber)

Case of 
	: ($1="Batch")
		
		QUERY:C277([Sequence:6]; [Sequence:6]Type:1="Batch")
		
		If (Records in selection:C76([Sequence:6])=0)
			CREATE RECORD:C68([Sequence:6])
			[Sequence:6]Type:1:="Batch"
			[Sequence:6]Sequence Number:2:=1000
			vBatchSequenceNumber:=1000
		Else 
			vEnd:=0
			While (vEnd=0)
				vBatchSequenceNumber:=[Sequence:6]Sequence Number:2+1
				QUERY:C277([Point of Sale:5]; [Point of Sale:5]Batch ID:1=<>Computer+"-"+String:C10(vBatchSequenceNumber))
				If (Records in selection:C76([Point of Sale:5])>0)
					vEnd:=0
				Else 
					vEnd:=1
				End if 
				[Sequence:6]Sequence Number:2:=vBatchSequenceNumber
				SAVE RECORD:C53([Sequence:6])
			End while 
		End if 
		SAVE RECORD:C53([Sequence:6])
		
		
	: ($1="Sales")
		
		QUERY:C277([Sequence:6]; [Sequence:6]Type:1="Sales")
		
		If (Records in selection:C76([Sequence:6])=0)
			CREATE RECORD:C68([Sequence:6])
			[Sequence:6]Type:1:="Sales"
			[Sequence:6]Sequence Number:2:=1000
			vSalesSequenceNumber:=1000
		Else 
			vSalesSequenceNumber:=[Sequence:6]Sequence Number:2+1
			[Sequence:6]Sequence Number:2:=vSalesSequenceNumber
		End if 
		SAVE RECORD:C53([Sequence:6])
End case 
