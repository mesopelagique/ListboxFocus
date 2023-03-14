Case of 
		// MARK:- On Losing Load
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.col1:=New collection:C1472("one"; "two")
		Form:C1466.col2:=New collection:C1472("one"; "two")
		
		Form:C1466.toRefresh:=New collection:C1472  // list of element to refresh on timer
		
		// MARK:- On Losing Focus
	: (Form event code:C388=On Losing Focus:K2:8)
		
		// post pone refresh like an On After Losing Focus
		Form:C1466.toRefresh.push(OBJECT Get name:C1087(Object with focus:K67:3))
		SET TIMER:C645(-1)
		
		// MARK:- On Getting Focus
	: (Form event code:C388=On Getting Focus:K2:7)
		
		// MARK:- On Losing Load
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		// MARK: On After Losing Load
		var $value
		var $objectName : Text
		$objectName:=Form:C1466.toRefresh.shift()
		While (Length:C16(String:C10($objectName))>0)
			// refresh by set the current value to object
			$value:=OBJECT Get value:C1743($objectName)
			If (Value type:C1509($value)#Is undefined:K8:13)
				OBJECT SET VALUE:C1742($objectName; $value)
			End if 
			$objectName:=Form:C1466.toRefresh.shift()
		End while 
		
	Else 
		
End case 