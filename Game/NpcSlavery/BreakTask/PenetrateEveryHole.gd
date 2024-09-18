extends NpcBreakTaskBase

var fuckedMouth = false
var fuckedVag = false
var fuckedAnus = false

func _init():
	id = "PenetrateEveryHole"

func getSlaveTypeWeights(_isSlaveLevelup):
	return {
		SlaveType.All : 0.3,
	}

func getSlutlockWeight() -> float:
	return 0.3

func isPossibleFor(_npc, _isSlaveLevelup):
	return true

func isPossibleForSlutlock(_npc):
	if(_npc.isOralBlocked()):
		return false
	return .isPossibleForSlutlock(_npc)

func isPossibleForPC(_pc, _npc, _isSlaveLevelup):
	if(_pc.hasReachablePenis()):
		return true
	if(_pc.hasStrapons()):
		return true
	if(_isSlaveLevelup):
		return true
	return false

func generateFor(_npc, _isSlaveLevelup, _difficulty = 1.0):
	needAmount = getTotalHoles(_npc)

func onSexEvent(_npc, _event:SexEvent):
	if(_event.getType() == SexEvent.HolePenetrated):
		if(_event.getTargetChar() == _npc):
			var whichPart = _event.getField("hole", BodypartSlot.Vagina)
			
			if(whichPart == BodypartSlot.Vagina && !fuckedVag):
				fuckedVag = true
				advanceTask()
				return true
			if(whichPart == BodypartSlot.Anus && !fuckedAnus):
				fuckedAnus = true
				advanceTask()
				return true
			if(whichPart == BodypartSlot.Head && !fuckedMouth):
				fuckedMouth = true
				advanceTask()
				return true
	return false

func getTaskString():
	return "Penetrate every hole once: "+getProgressString("holes")

func getTaskStringSlutLock():
	return "Get every hole fucked: "+getProgressString("holes")

func getTaskHint(_isSlaveLevelup):
	return "Fuck all their orifices at least once using your cock or with a strapon"

func getTotalHoles(_npc):
	var result = 1 # Oral
	if(_npc.hasReachableVagina()):
		result += 1
	if(_npc.hasReachableAnus()):
		result += 1
	return result

func saveData():
	var data = .saveData()
	data["fuckedMouth"] = fuckedMouth
	data["fuckedVag"] = fuckedVag
	data["fuckedAnus"] = fuckedAnus
	
	return data

func loadData(data):
	.loadData(data)
	
	fuckedMouth = SAVE.loadVar(data, "fuckedMouth", false)
	fuckedVag = SAVE.loadVar(data, "fuckedVag", false)
	fuckedAnus = SAVE.loadVar(data, "fuckedAnus", false)
