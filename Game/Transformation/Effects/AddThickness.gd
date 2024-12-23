extends TFEffect

var howMuch:int = 10

func _init():
	id = "AddThickness"

func initArgs(_args:Array):
	if(_args.size() > 0):
		howMuch = _args[0]

func applyEffect(_data:Dictionary):
	if(_data.has("thickness")):
		_data["thickness"] += howMuch
	
func onReplace(_otherEffect):
	howMuch += _otherEffect.howMuch
