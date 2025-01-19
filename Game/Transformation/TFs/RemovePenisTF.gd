extends TFBase

var removedPenis:bool = false

func _init():
	id = "RemovePenisTF"

func getName() -> String:
	return "Removes penis"

func getPillName() -> String:
	return "CockBeGone"

func getTFCheckTags() -> Dictionary:
	return {
		"penis": true,
	}

func isPossibleFor(_char) -> bool:
	if(!_char.hasPenis()):
		return false
	return true

func start(_args:Dictionary):
	pass

func canTransformFurther() -> bool:
	#if(getStage() == 0 && !getChar().hasPenis()):
	#	return true
	if(removedPenis):
		return false
	if(getChar().hasPenis()):
		return true
	return false
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 120
	return 240
	
func doProgress(_context:Dictionary) -> Dictionary:
	if(removedPenis):
		return {}
	var theChar:BaseCharacter = getChar()
	if(theChar.hasPenis()):
		if(theChar.hasPenis() && theChar.getPenisSize() > 8):
			return {
				showPenis = true,
				effects = [
					partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [-RNG.randi_range(3, 6)])
				],
			}
	removedPenis = true
	return {
		effects = [
			partEffect("newpart", BodypartSlot.Penis, "SwitchPart", [""]),
		]
	}


func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["rp"] = removedPenis
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	removedPenis = SAVE.loadVar(_data, "rp", false)
