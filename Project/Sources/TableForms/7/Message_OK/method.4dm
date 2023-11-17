Case of 
	: (vTextColor="green")
		OBJECT SET RGB COLORS:C628(vMessage; UTIL_4DColorToHex(Green:K11:9); UTIL_4DColorToHex(White:K11:1))
		
	: (vTextColor="red")
		OBJECT SET RGB COLORS:C628(vMessage; UTIL_4DColorToHex(Red:K11:4); UTIL_4DColorToHex(White:K11:1))
		
	: (vTextColor="black")
		OBJECT SET RGB COLORS:C628(vMessage; UTIL_4DColorToHex(Black:K11:16); UTIL_4DColorToHex(White:K11:1))
		
	: (vTextColor="blue")
		OBJECT SET RGB COLORS:C628(vMessage; UTIL_4DColorToHex(Blue:K11:7); UTIL_4DColorToHex(White:K11:1))
		
	Else 
		OBJECT SET RGB COLORS:C628(vMessage; UTIL_4DColorToHex(Red:K11:4); UTIL_4DColorToHex(White:K11:1))
End case 

