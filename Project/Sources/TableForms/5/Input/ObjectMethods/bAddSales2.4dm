//	  `Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
MessageBox(""; "Are you sure you want to delete this transaction?"; "YesNoBox"; "red")
If (ok=1)
	DELETE RECORD:C58([Sales:2])
	REDRAW:C174([Sales:2])
	ALL RECORDS:C47([Sales:2])
	RELATE MANY:C262([Point of Sale:5]Batch ID:1)
	vItemsInBatch:=Records in selection:C76([Sales:2])
End if 