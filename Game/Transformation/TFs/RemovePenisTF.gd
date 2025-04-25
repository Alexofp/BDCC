extends TFBase

var removedPenis:bool = false

func _init():
	id = "RemovePenisTF"
	
	pointsOnUnlock = 10

func getName() -> String:
	return "Removes penis"

func getPillName() -> String:
	return "CockBeGone"

func getUnlockData() -> Dictionary:
	return {
		eliza = "Aw, this pill is such a buzz kill. It has hormonal blockers and tissue-regulating agents that could target penile tissue. Oh yeah, it will fully get rid of all of the penile tissue in fact. There is only one name for such a pill: 'CockBeGone'.",
	}

func getPillDatabaseDesc() -> String:
	return "This drug will morph away your penis if you have one. It does so by gradually decreasing the length until the penis is small enough (less than 8cm) to be morphed away completely.\n\nThe first stage will happen after a few minutes. After that, the next ones will happen roughly every 5 hours. This could be accelerated by using the QuickShift drug or by making the test subject [b]orgasm[/b].\n\nThis drug doesn’t have a set amount of stages. It will keep making the penis smaller until it is completely gone."

func getTFCheckTags() -> Dictionary:
	return {
		"penis": true,
	}

func getPillFluidsRequired() -> Dictionary:
	return {
		"GirlCum": 500.0,
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
		return 200
	return 60*60*5
	
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
	
	playAnim(StageScene.TFLook, "crotch", {bodyState={exposedCrotch=true,hard=true}})
	
func onSexEvent(_event : SexEvent):
	var _npc = getChar()
	if(_event.getType() in [SexEvent.Orgasmed]):
		if(_event.getTargetChar() == _npc):
			accelerateTimer(1.0)
	
func saveData() -> Dictionary:
	var data:Dictionary = .saveData()
	
	data["rp"] = removedPenis
	
	return data

func loadData(_data:Dictionary):
	.loadData(_data)
	
	removedPenis = SAVE.loadVar(_data, "rp", false)
