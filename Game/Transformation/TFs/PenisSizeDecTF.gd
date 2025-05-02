extends TFBase

var target:float = 0.0
var hasTarget:bool = false

func _init():
	id = "PenisSizeDecTF"
	
	canStack = true
	
	pointsOnUnlock = 5

func getName() -> String:
	return "Decreases length of penis"

func getPillName() -> String:
	return "ShrinkRay"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Kinky! This pill seems to be formulated with a combination of hormonal inhibitors and tissue-reducing agents that could target penile size. When taken, it will probably lead to a decrease in length. I think I’ll call it.. 'ShrinkRay.' Because it.. shrinks your ray.. get it?",
	}

func getPillDatabaseDesc() -> String:
	return "This drug will decrease the length of your penis. It does so gradually until the maximum number of stages has been reached or until the length of your penis has become 9cm or lower.\n\nThe first stage will happen after a few minutes. After that, the next ones will happen roughly every 5 hours. This could be accelerated by using the QuickShift drug or by making the test subject [b]orgasm[/b].\n\nThis drug has a maximum amount of 5 stages by default. It’s possible to use advanced lab equipment to override this behaviour and set a target penis length. Then this drug won’t have a fixed amount of stages, shrinking the penis until the target length has been reached."

func getTFCheckTags() -> Dictionary:
	return {
		"penis": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"GirlCum": 300.0,
	}

func isPossibleFor(_char) -> bool:
	if(!_char.hasPenis()):
		return false
	if(hasTarget):
		return _char.getPenisSize() > target
	if(_char.getPenisSize() <= 9):
		return false
	return true

func start(_args:Dictionary):
	if(_args.has("target")):
		hasTarget = true
		target = _args["target"]

func getPillOptions() -> Dictionary:
	var lengths:Array = [5.0, 8.0, 10.0, 12.0, 15.0, 18.0, 20.0, 22.0, 25.0, 28.0, 30.0]
	var lenArray:Array = []
	for theLen in lengths:
		lenArray.append([theLen, str(theLen)+"cm"])
	return {
		"target": {
			name = "Target",
			desc = "Whats the final penis length should be (This drug can only decrease length).",
			value = 10.0,
			values = lenArray,
		},
	}

func canTransformFurther() -> bool:
	if(hasTarget):
		return getChar().getPenisSize() > target
	if(!getChar().hasPenis() || getChar().getPenisSize() <= 9):
		return false
	return .canTransformFurther()
	
func getMaxStage() -> int:
	return 5
	
func getTimerForStage(_theStage:int) -> int:
	if(_theStage == 0):
		return 300
	return 60*60*5
	
func doProgress(_context:Dictionary) -> Dictionary:
	if(hasTarget):
		var currentSize:float = getChar().getPenisSize()
		var delta:float = target - currentSize
		if(delta < -4.0):
			delta = -4.0
		if(delta > 0):
			delta = 0
		return {
			effects = [
				partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [delta])
			]
		}
	return {
		effects = [
			partEffect("penLen", BodypartSlot.Penis, "PenisLengthChange", [-RNG.randi_range(2, 4)])
		]
	}

func reactProgress(_context:Dictionary, _result:TFResult):
	addText(_result.getAllTFTexts())
	
	playAnim(StageScene.TFLook, "crotch", {bodyState={exposedCrotch=true,hard=true}})

func onSexEvent(_event : SexEvent):
	var _npc = getChar()
	if(_event.getType() in [SexEvent.Orgasmed]):
		if(_event.getTargetChar() == _npc):
			accelerateTimer(1.0)

func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["ht"] = hasTarget
	data["tt"] = target
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	hasTarget = SAVE.loadVar(_data, "ht", false)
	target = SAVE.loadVar(_data, "tt", 18.0)
