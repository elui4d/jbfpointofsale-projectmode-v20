//%attributes = {}
QUERY SELECTION:C341([Consignors:1]; [Consignors:1]Consigning this sale:16=True:C214)

If (Records in selection:C76([Consignors:1])>0)
	
	//ORDER BY([Consignors]Consignor Number)
	
	ORDER BY FORMULA:C300([Consignors:1]; ([Consignors:1]Consignor Number:1); >)
	
	
	//FIRST RECORD([Consignors])
	
	For ($vlRecord; 1; Records in selection:C76([Consignors:1]))
		
		RELATE MANY:C262([Consignors:1]Consignor Number:1)
		
		
		
		
		vItemsSold:=Records in selection:C76([Sales:2])
		vGrossSales:=Round:C94(Sum:C1([Sales:2]Sold Price:2); 2)
		vNetSales:=Round:C94(vGrossSales*([Consignors:1]Percent:14*0.01); 2)
		vCheckTotal:=Round:C94(vNetSales-[Consignors:1]Consignor Fee:17; 2)
		//vNetSales:=vGrossSales*([Consignors]Percent*0.01)
		//vCheckTotal:=vNetSales-[Consignors]Consignor Fee
		//vCheckTotal:=Round(vCheckTotal;2)
		[Consignors:1]Check_Total:19:=vCheckTotal
		
		//Get CheckTotal Text for check
		vCheckTotalString:=String:C10(vCheckTotal)
		vDecimal:=Position:C15("."; vCheckTotalString)
		
		Case of 
			: (vDecimal=0)
				vCheckTotalString:=vCheckTotalString+".00"
				vDecimal:=Position:C15("."; vCheckTotalString)
			: (vDecimal=2)
				vCheckTotalString:=vCheckTotalString+"0"
				vDecimal:=Position:C15("."; vCheckTotalString)
		End case 
		
		vCents:=""
		vOne:=""
		vTen:=""
		vTen2:=""
		vHundred:=""
		vThousand:=""
		vTenThousand:=""
		
		vCents:=Substring:C12(vCheckTotalString; vDecimal+1; 2)
		If (vDecimal-1>0)
			vOne:=Substring:C12(vCheckTotalString; vDecimal-1; 1)
		End if 
		If (vDecimal-2>0)
			vTen:=Substring:C12(vCheckTotalString; vDecimal-2; 1)
			vTen2:=Substring:C12(vCheckTotalString; vDecimal-2; 1)
		End if 
		If (vDecimal-3>0)
			vHundred:=Substring:C12(vCheckTotalString; vDecimal-3; 1)
		End if 
		If (vDecimal-4>0)
			vThousand:=Substring:C12(vCheckTotalString; vDecimal-4; 1)
		End if 
		If (vDecimal-5>0)
			vTenThousand:=Substring:C12(vCheckTotalString; vDecimal-5; 1)
		End if 
		Case of 
			: (vTenThousand="2")
				Case of 
					: (vThousand="0")
						vThousand:="Twenty Thousand "
					: (vThousand="1")
						vThousand:="Twenty One Thousand "
					: (vThousand="2")
						vThousand:="Twenty Two Thousand "
					: (vThousand="3")
						vThousand:="Twenty Three Thousand "
					: (vThousand="4")
						vThousand:="Twenty Four Thousand "
					: (vThousand="5")
						vThousand:="Twenty Five Thousand "
					: (vThousand="6")
						vThousand:="Twenty Six Thousand "
					: (vThousand="7")
						vThousand:="Twenty Seven Thousand "
					: (vThousand="8")
						vThousand:="Twenty Eight Thousand "
					: (vThousand="9")
						vThousand:="Twenty Nine Thousand "
				End case 
				
			: (vTenThousand="1")
				Case of 
					: (vThousand="0")
						vThousand:="Ten Thousand "
					: (vThousand="1")
						vThousand:="Eleven Thousand "
					: (vThousand="2")
						vThousand:="Twelve Thousand "
					: (vThousand="3")
						vThousand:="Thirteen Thousand "
					: (vThousand="4")
						vThousand:="Fourteen Thousand "
					: (vThousand="5")
						vThousand:="Fifteen Thousand "
					: (vThousand="6")
						vThousand:="Sixteen Thousand "
					: (vThousand="7")
						vThousand:="Seventeen Thousand "
					: (vThousand="8")
						vThousand:="Eighteen Thousand "
					: (vThousand="9")
						vThousand:="Nineteen Thousand "
				End case 
				
			: (vTenThousand="0") | (vTenThousand="")
				//not greater than 10 thousand
				Case of 
					: (vThousand="0")
						vThousand:=""
					: (vThousand="1")
						vThousand:="One Thousand "
					: (vThousand="2")
						vThousand:="Two Thousand "
					: (vThousand="3")
						vThousand:="Three Thousand "
					: (vThousand="4")
						vThousand:="Four Thousand "
					: (vThousand="5")
						vThousand:="Five Thousand "
					: (vThousand="6")
						vThousand:="Six Thousand "
					: (vThousand="7")
						vThousand:="Seven Thousand "
					: (vThousand="8")
						vThousand:="Eight Thousand "
					: (vThousand="9")
						vThousand:="Nine Thousand "
				End case 
		End case 
		Case of 
			: (vHundred="0")
				vHundred:=""
			: (vHundred="1")
				vHundred:="One Hundred"
			: (vHundred="2")
				vHundred:="Two Hundred"
			: (vHundred="3")
				vHundred:="Three Hundred"
			: (vHundred="4")
				vHundred:="Four Hundred"
			: (vHundred="5")
				vHundred:="Five Hundred"
			: (vHundred="6")
				vHundred:="Six Hundred"
			: (vHundred="7")
				vHundred:="Seven Hundred"
			: (vHundred="8")
				vHundred:="Eight Hundred"
			: (vHundred="9")
				vHundred:="Nine Hundred"
		End case 
		
		Case of 
			: (vTen="0")
				vTen:=""
			: (vTen="1") & (vOne="0")
				vTen:=" Ten"
				vOne:=""
			: (vTen="1") & (vOne="1")
				vTen:=" Eleven"
				vOne:=""
			: (vTen="1") & (vOne="2")
				vTen:=" Twelve"
				vOne:=""
			: (vTen="1") & (vOne="3")
				vTen:=" Thirteen"
				vOne:=""
			: (vTen="1") & (vOne="4")
				vTen:=" Fourteen"
				vOne:=""
			: (vTen="1") & (vOne="5")
				vTen:=" Fifteen"
				vOne:=""
			: (vTen="1") & (vOne="6")
				vTen:=" Sixteen"
				vOne:=""
			: (vTen="1") & (vOne="7")
				vTen:=" Seventeen"
				vOne:=""
			: (vTen="1") & (vOne="8")
				vTen:=" Eighteen"
				vOne:=""
			: (vTen="1") & (vOne="9")
				vTen:=" Nineteen"
				vOne:=""
			: (vTen="2")
				vTen:=" Twenty"
			: (vTen="3")
				vTen:=" Thirty"
			: (vTen="4")
				vTen:=" Forty"
			: (vTen="5")
				vTen:=" Fifty"
			: (vTen="6")
				vTen:=" Sixty"
			: (vTen="7")
				vTen:=" Seventy"
			: (vTen="8")
				vTen:=" Eighty"
			: (vTen="9")
				vTen:=" Ninety"
		End case 
		
		Case of 
			: (vOne="0") & (vTen2#"1")
				vOne:=""
			: (vOne="1") & (vTen2#"1")
				vOne:=" One"
			: (vOne="2") & (vTen2#"1")
				vOne:=" Two"
			: (vOne="3") & (vTen2#"1")
				vOne:=" Three"
			: (vOne="4") & (vTen2#"1")
				vOne:=" Four"
			: (vOne="5") & (vTen2#"1")
				vOne:=" Five"
			: (vOne="6") & (vTen2#"1")
				vOne:=" Six"
			: (vOne="7") & (vTen2#"1")
				vOne:=" Seven"
			: (vOne="8") & (vTen2#"1")
				vOne:=" Eight"
			: (vOne="9") & (vTen2#"1")
				vOne:=" Nine"
				
		End case 
		
		If (vTen="") & (vHundred="") & (vthousand="") & (vOne="")
			vOne:="Zero"
		End if 
		
		vLength:=Length:C16(vCents)
		Case of 
			: (vLength=1)
				vCents:=vCents+"0"
			: (vLength=0)
				vCents:=vCents+"00"
		End case 
		
		[Consignors:1]Check_TotalText:20:=vThousand+vHundred+vTen+vOne+" Dollars and "+vCents+" Cents."
		
		[Consignors:1]Check_FirstLastName:21:=[Consignors:1]First Name:2+" "+[Consignors:1]Last Name:3
		[Consignors:1]Check_Date:22:=String:C10(Current date:C33; Internal date long:K1:5)
		[Consignors:1]Check_CityStateZip:23:=[Consignors:1]City:6+", "+[Consignors:1]State:7+"  "+[Consignors:1]Zip:8
		SAVE RECORD:C53([Consignors:1])
		
		NEXT RECORD:C51([Consignors:1])
	End for 
End if 
