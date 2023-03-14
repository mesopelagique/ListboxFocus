//%attributes = {}
#DECLARE($objectName : Text) : Text

$isFocused:=(OBJECT Get name:C1087(Object with focus:K67:3)=$objectName)

If (FORM Event:C1606.isRowSelected)
	
	return $isFocused ? "red" : "orange"
	
Else 
	
	return $isFocused ? "black" : "gray"
	
End if 

return "green"
