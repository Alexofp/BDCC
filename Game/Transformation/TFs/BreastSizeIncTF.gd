extends TFBase

var stages:int = 3

func _init():
	id = "BreastSizeIncTF"
	
	pointsOnUnlock = 5

func getName() -> String:
	return "Increases size of breasts"

func getPillName() -> String:
	return "TiTS"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Fascinating! This pill seems to be packed with a unique combination of herbal extracts and growth factors that stimulate breast tissue expansion. When taken, it will probably encourage cellular proliferation in the mammary glands, leading to an increase in size. I think I'll call it.. 'TiTS.' It has a nice ring to it, don’t you think?",
	}

func getTFCheckTags() -> Dictionary:
	return {
		"breasts": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"Cum": 500.0,
	}

func isPossibleFor(_char) -> bool:
	if(_char.getBreastsSize() >= BreastsSize.O):
		return false
	return true

func start(_args:Dictionary):
	if(_args.has("stages")):
		stages = _args["stages"]

func getPillOptions() -> Dictionary:
	return {
		"stages": {
			name = "Stages",
			desc = "How many times should the breasts be increased.",
			value = 3,
			values = [
				[1, "1"],
				[2, "2"],
				[3, "3"],
				[4, "4"],
				[5, "5"],
			],
		},
	}

func canTransformFurther() -> bool:
	if(getChar().getBreastsSize() >= BreastsSize.O):
		return false
	return .canTransformFurther()
	
func getMaxStage() -> int:
	return stages
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 200
	return 60*60*30
	
func doProgress(_context:Dictionary) -> Dictionary:
	return {
		effects = [
			partEffect("breasts", BodypartSlot.Breasts, "BreastSizeChange", [1]),
		]
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.GivingBirth, "birth", {bodyState={exposedCrotch=true, hard=true}})
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["st"] = stages
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	stages = SAVE.loadVar(_data, "st", 3)
