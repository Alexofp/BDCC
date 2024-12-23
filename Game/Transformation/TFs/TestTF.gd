extends TFBase

var timer:int = 0

func _init():
	id = "TestTF"

func processTime(_seconds:int):
	timer += _seconds
	
func isReadyToProgress() -> bool:
	return timer >= 120

func doProgress(_context:Dictionary) -> Dictionary:
	timer = 0
	
	#var theChar := getChar()
	
	#var breasts:BodypartBreasts = theChar.getBodypart(BodypartSlot.Breasts)
	#if(breasts != null):
	#	breasts.setBreastSizeSafe(Util.mini(breasts.size + 1, BreastsSize.O))
	addPartEffect(BodypartSlot.Breasts, effect("BreastSizeInc"))
	addPartEffect(BodypartSlot.Legs, effect("SwitchPart", ["plantilegs"]))
	addCharEffect(effect("AddThickness", [10]))
	
	return {
		text = "BOOBA!",
	}
