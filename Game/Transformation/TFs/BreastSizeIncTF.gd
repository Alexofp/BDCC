extends TFBase

var stages:int = 3

func _init():
	id = "BreastSizeIncTF"
	
	canStack = true
	
	pointsOnUnlock = 5

func getName() -> String:
	return "Increases size of breasts"

func getPillName() -> String:
	return "TiTS"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Fascinating! This pill seems to be packed with a unique combination of herbal extracts and growth factors that stimulate breast tissue expansion. When taken, it will probably encourage cellular proliferation in the mammary glands, leading to an increase in size. I think I'll call it.. 'TiTS.' It has a nice ring to it, don’t you think?",
	}

func getPillDatabaseDesc() -> String:
	return "Our trials showed that this drug will increase the size of breasts. It does so one size at a time until an “O-cup” size has been achieved or until the last stage of the transformation has been reached. It will [b]not[/b] turn your pecs into breasts.\n\nThe first stage will happen after a few minutes. After that, the next ones will happen roughly every 30 hours. This could be accelerated by using the QuickShift drug or by stimulating the test subject’s breasts but only if their nipples are [b]not sore[/b].\n\nThis drug will have from 3 to 5 stages. This could be increased using advanced equipment to up to 10 stages."

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
	else:
		stages = RNG.randi_range(3, 5)

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
				[6, "6"],
				[7, "7"],
				[8, "8"],
				[9, "9"],
				[10, "10"],
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
	
	playAnim(StageScene.TFLook, "breasts", {bodyState={exposedChest=true}})
	
func onSexEvent(_event : SexEvent):
	var _npc = getChar()
	if(_event.getType() in [SexEvent.BreastsGroped, SexEvent.BreastFeeding, SexEvent.BreastsPumpMilked]):
		if(_event.getTargetChar() == _npc):
			if(!_npc.hasSoreNipples()):
				accelerateTimer(0.4)
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["st"] = stages
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	stages = SAVE.loadVar(_data, "st", 3)
