If (cbTransax_Enabled=1)
	//vCCPathLabel:="ePNJPOSPath"
	//vCCLoginLabel:="Clerk"
	//vCCPasswordLabel:="Password"
	
	
	If (vccLicense="ABC123")
		vCCPathLabel:="Transax KEY"
		vCCLoginLabel:="Username"
		vCCPasswordLabel:="Password"
		cbpnjpos_enabled:=0
	Else 
		
		//Parameters 1=Title, 2=Message, 3=Button Type ("YesNoBox"), 4=TextColor       
		MessageBox(""; "You must enter a valid License Key to use Transax Gateway"; "OKBox"; "Red")
		cbTransax_enabled:=0
	End if 
	
	
	
End if 