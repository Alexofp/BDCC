extends TFBase

var stages:int = 3

func _init():
	id = "BreastSizeDecTF"

func getName() -> String:
	return "Decreases size of breasts"

func getPillName() -> String:
	return "Just-Ice"
	
func getUnlockData() -> Dictionary:
	return {
		eliza = "Interesting. It appears to contain a blend of phytoestrogens and cold-activated enzymes that target adipose tissue in the breast area. When ingested, it should trigger a localized reduction in fat cells. This pill will probably make your breasts smaller. Huh.. I'm gonna call it.. "+getPillName()+". I think that name will fit it nicely.",
	}

func getTFCheckTags() -> Dictionary:
	return {
		"breasts": true,
	}

func isPossibleFor(_char) -> bool:
	if(_char.getBreastsSize() <= BreastsSize.FLAT):
		return false
	return true

func start(_args:Dictionary):
	if(_args.has("stages")):
		stages = _args["stages"]

func getPillOptions() -> Dictionary:
	return {
		"stages": {
			name = "Stages",
			desc = "How many times should the breasts be decreased.",
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
	if(getChar().getBreastsSize() <= BreastsSize.FLAT):
		return false
	return .canTransformFurther()
	
func getMaxStage() -> int:
	return stages
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 120
	return 240
	
func doProgress(_context:Dictionary) -> Dictionary:
	return {
		effects = [
			partEffect("breasts", BodypartSlot.Breasts, "BreastSizeChange", [-1]),
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
