extends TFEffect

var newPartID:String = ""

func _init():
	id = "SwitchPart"

func initArgs(_args:Array):
	newPartID = _args[0]

func applyEffect(_data:Dictionary):
	_data["bodypartID"] = newPartID
	
