extends TFBase

func _init():
	id = "PenisSizeDecTF"

func getName() -> String:
	return "Decreases length of penis"

func getPillName() -> String:
	return "ShrinkRay"

func getTFCheckTags() -> Dictionary:
	return {
		"penis": true,
	}

func isPossibleFor(_char) -> bool:
	if(!_char.hasPenis() || _char.getPenisSize() <= 9):
		return false
	return true

func start(_args:Dictionary):
	pass

func canTransformFurther() -> bool:
	if(!getChar().hasPenis() || getChar().getPenisSize() <= 9):
		return false
	return .canTransformFurther()
	
func getMaxStage() -> int:
	return 3
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 120
	return 240
	
func doProgress(_context:Dictionary) -> Dictionary:
	return {
		effects = [
			partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [-RNG.randi_range(2, 4)])
		]
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
