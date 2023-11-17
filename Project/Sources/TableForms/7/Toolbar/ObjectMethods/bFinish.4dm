//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox";)
MessageBox("Exit"; "Are you sure you want to exit the program?"; "YesNoBox"; "red")
If (OK=1)
	QUIT 4D:C291
End if 