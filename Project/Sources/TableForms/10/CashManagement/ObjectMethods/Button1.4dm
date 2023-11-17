
//add new record with starting cash
CREATE RECORD:C68([Cash:10])

Case of 
	: (cbCash2=1)
		[Cash:10]Cash:3:=vCashInOut
	: (cbCash1=1)
		[Cash:10]Cash:3:=(0-(vCashInOut))
End case 

[Cash:10]Reason:4:=vReason
[Cash:10]Date:1:=Current date:C33
[Cash:10]Time:2:=Current time:C178
SAVE RECORD:C53([Cash:10])


CLOSE WINDOW:C154

Print_CashManager
