extends SpecialRelationshipBase

var gonnaAmbush:bool = true

func _init():
	id = "Nemesis"

func getVisibleName() -> String:
	return "Nemesis"

func getCategoryColor() -> Color:
	return Color.red

func checkSocialEventShouldStart(_charActor:String, _charTarget:String, _eventID:int, _args:Array) -> bool:
	return true
	#return false

func onStart(_args:Array):
	showMessage(getChar().getName()+" became your Nemesis!")

func onNewDay():
	#TODO: A cooldown?
	gonnaAmbush = RNG.chance(100)

func saveData() -> Dictionary:
	var data := .saveData()
	
	data["gonnaAmbush"] = gonnaAmbush
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	gonnaAmbush = SAVE.loadVar(_data, "gonnaAmbush", false)
