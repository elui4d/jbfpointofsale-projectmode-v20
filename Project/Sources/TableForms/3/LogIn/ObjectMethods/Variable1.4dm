If (vSelectedUser="") | (vSelectedComputer="")
	
	//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
	MessageBox("Login Failed"; "You must choose a User and Computer Number"; "OKBox"; "red")
	
	ok:=0
Else 
	ACCEPT:C269
End if 