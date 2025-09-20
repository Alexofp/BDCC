extends SpecialRelationshipBase

var npcOwner:NpcOwnerBase

func _init():
	id = "SoftSlavery" # Soft means you can still do stuff in the prison

func getVisibleName() -> String:
	return "Soft slavery"

func getCategoryName() -> String:
	return "Owner"

func getMapTag() -> String:
	return "O"

func getCategoryColor() -> Color:
	return Color.darkorchid

func checkSocialEventShouldStartActor(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> Array:
	return [false]

func checkSocialEventShouldStartTarget(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> Array:
	return [false]

func onSocialEvent(_charActor:String, _charTarget:String, _eventID:int, _args:Array):
	pass

func onStart(_args:Array):
	showMessage(getChar().getName()+" became your [b][color=red]Owner[/color][/b]!")

func onEnd():
	showMessage(getChar().getName()+" is no longer your Owner!")

func onNewDay():
	pass

func getCooldown() -> int:
	return 0

func processInteractionActionGenericScore(_scoreType:String, _value:float) -> float:
	return _value

func saveData() -> Dictionary:
	var data := .saveData()
	
	#data["gonnaAmbush"] = gonnaAmbush
	#data["reason"] = reason
	#data["anger"] = anger
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	#gonnaAmbush = SAVE.loadVar(_data, "gonnaAmbush", false)
	#reason = SAVE.loadVar(_data, "reason", NemesisReason.Generic)
	#anger = SAVE.loadVar(_data, "anger", 0.0)
