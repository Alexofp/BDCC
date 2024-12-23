extends TFEffect

var howMuch:int = 1

func _init():
	id = "BreastSizeInc"

func initArgs(_args:Array):
	if(_args.size() > 0):
		howMuch = _args[0]

func applyEffect(_data:Dictionary):
	if(_data.has("size")):
		_data["size"] += howMuch
	else:
		_data["size"] = BreastsSize.FLAT + howMuch
	
func onReplace(_otherEffect):
	howMuch += _otherEffect.howMuch
