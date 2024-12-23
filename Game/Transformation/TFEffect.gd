extends Reference
class_name TFEffect

var id:String = "error"
var tfID:int = -1

func initArgs(_args:Array):
	pass

func applyEffect(_data:Dictionary):
	pass

func canReplace(otherEffect) -> bool:
	if(id == otherEffect.id && tfID == otherEffect.tfID):
		return true
	return false

func onReplace(_otherEffect):
	pass
