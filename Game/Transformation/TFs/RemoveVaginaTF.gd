extends TFBase

var removedVag:bool = false

func _init():
	id = "RemoveVaginaTF"
	
	pointsOnUnlock = 10

func getName() -> String:
	return "Removes pussy"

func getPillName() -> String:
	return "PussyBeGone"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Ohh. My crotch is aching just looking at this. This pill will target vaginal tissue.. getting rid of it.. together with the whole reproductive system. 'PussyBeGone' is a good name for it, I guess.",
	}

func getPillDatabaseDesc() -> String:
	return "This drug will morph away your vagina if you have one.\n\nThe transformation consists only of one stage that will happen roughly after 20 minutes. This could be accelerated only by using the QuickShift drug."

func getTFCheckTags() -> Dictionary:
	return {
		"vagina": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"GirlCum": 500.0,
	}

func isPossibleFor(_char) -> bool:
	if(!_char.hasVagina()):
		return false
	return true

func start(_args:Dictionary):
	pass

func canTransformFurther() -> bool:
	if(removedVag):
		return false
	if(getChar().hasVagina()):
		return true
	return false
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 60*20
	return 60*60*2
	
func doProgress(_context:Dictionary) -> Dictionary:
	if(removedVag):
		return {}
	removedVag = true
	return {
		effects = [
			partEffect("newpart", BodypartSlot.Vagina, "SwitchPart", [""]),
		]
	}


func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.TFLook, "crotch", {bodyState={exposedCrotch=true,hard=true}})
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["rv"] = removedVag
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	removedVag = SAVE.loadVar(_data, "rv", false)
