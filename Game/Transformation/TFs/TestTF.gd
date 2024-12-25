extends TFBase

var timer:int = 0

func _init():
	id = "TestTF"

func processTime(_seconds:int):
	timer += _seconds
	
func isReadyToProgress() -> bool:
	return timer >= 240

func doProgress(_context:Dictionary) -> Dictionary:
	timer = 0
	
	return {
		#stage = 6969,
		
		effects = [
			partEffect("breasts", BodypartSlot.Breasts, "BreastSizeInc"),
			#partEffect("legs", BodypartSlot.Legs, "SwitchPart", ["plantilegs"]),
			#charEffect("thick", "AddThickness", [10]),
		]
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	#addText(str(_result.getField("stage", 0)))
	addText("A sudden warmth envelops your chest, and you feel an electrifying tingling sensation that sends shivers down your spine.")
	addText(_result.getTFText("breasts"))
	#addText("THEN WE SWITCH LEGS.")
	#addText(_result.getTFText("legs"))
	#addText("AND ALSO MAKE YOU MORE THICK.")
	#addText(_result.getTFText("thick"))
