//%attributes = {}


//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
MessageBox("Delete Selection"; "Are you sure you want to delete "+String:C10(Records in set:C195("UserSet"))+" records?"; "YesNoBox"; "red")

If (ok=1)
	USE SET:C118("UserSet")  // Use the records chosen by the user
	DELETE SELECTION:C66(<>TablePointer->)
	ALL RECORDS:C47(<>TablePointer->)
End if 