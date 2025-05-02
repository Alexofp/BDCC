extends TFBase

var target:int = 0
var hasTarget:bool = false

func _init():
	id = "ThicknessAddTF"
	
	canStack = true
	
	pointsOnUnlock = 5

func getName() -> String:
	return "Makes you thicker"

func getPillName() -> String:
	return "ThiCC"

func getUnlockData() -> Dictionary:
	return {
		eliza = "This one is packed with growth enhancers and fat distribution agents. When taken, it will probably make you thicker and more.. voluptuous. Sorry but I really want to call it.. 'ThiCC'..",
	}

func getPillDatabaseDesc() -> String:
	return "This drug will gradually make your body more thick. It does so while your thickness is below 150% or until reaching the last stage.\n\nThe first stage will happen after a few minutes. After that, the next ones will happen roughly every 12 hours. This could be accelerated by using the QuickShift drug or by [b]spanking[/b] the test subject.\n\nThis drug is limited to 3 stages. It’s possible to override this behavior by using advanced lab equipment, instead picking a target thickness value."

func getTFCheckTags() -> Dictionary:
	return {
		"thickness": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"Cum": 500.0,
	}

func isPossibleFor(_char) -> bool:
	if(_char.getThickness() >= 150):
		return false
	if(hasTarget):
		return _char.getThickness() < target
	return true

func start(_args:Dictionary):
	if(_args.has("target")):
		hasTarget = true
		target = _args["target"]

func getPillOptions() -> Dictionary:
	var possibleVals:Array = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150]
	var posVals:Array = []
	for theVal in possibleVals:
		posVals.append([theVal, str(theVal)+"%"])
	return {
		"target": {
			name = "Target",
			desc = "Whats the final thickness should be like (This drug can only raise thickness).",
			value = 50,
			values = posVals,
		},
	}

func canTransformFurther() -> bool:
	if(getChar().getThickness() >= 150):
		return false
	if(hasTarget):
		return getChar().getThickness() < target
	return .canTransformFurther()
	
func getMaxStage() -> int:
	return 3
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 300
	return 60*60*12
	
func doProgress(_context:Dictionary) -> Dictionary:
	if(hasTarget):
		var currentThickness:int = getChar().getThickness()
		var delta:int = target - currentThickness
		if(delta > 13):
			delta = 13
		if(delta < 0):
			delta = 0
		return {
			effects = [
				charEffect("thi", "AddThickness", [delta]),
			]
		}
		
	return {
		effects = [
			charEffect("thi", "AddThickness", [RNG.randi_range(7, 13)]),
		]
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.TFLook, "hands")
	
func onSexEvent(_event : SexEvent):
	var _npc = getChar()
	if(_event.getType() in [SexEvent.Spanked]):
		if(_event.getTargetChar() == _npc):
			accelerateTimer(0.4)
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["ht"] = hasTarget
	data["tt"] = target
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	hasTarget = SAVE.loadVar(_data, "ht", false)
	target = SAVE.loadVar(_data, "tt", 50)
