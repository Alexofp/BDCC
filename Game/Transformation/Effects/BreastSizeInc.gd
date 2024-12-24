extends TFEffect

var howMuch:int = 1
#var baseSize:int = 0

func _init():
	id = "BreastSizeInc"

func initArgs(_args:Array):
	if(_args.size() > 0):
		howMuch = _args[0]

func applyEffect(_data:Dictionary):
	var origSize = _data["size"] if _data.has("size") else BreastsSize.FLAT
	#origSize += baseSize
	
	if(_data.has("size")):
		_data["size"] += howMuch# + baseSize
	else:
		_data["size"] = BreastsSize.FLAT + howMuch# + baseSize
	
	if(shouldAddText()):
		addText("Increased breast size from "+str(origSize)+" up to "+str(_data["size"])+".")
	
func onReplace(_otherEffect):
	#baseSize += _otherEffect.howMuch + _otherEffect.baseSize
	howMuch += _otherEffect.howMuch
