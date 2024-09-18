extends InteractionGoalBase

var nextTarget:String = ""

func getScore(_pawn:CharacterPawn) -> float:
	if(_pawn.isSlaveToPlayer() && globalTask == ""):
		var npcSlave:NpcSlave = _pawn.getNpcSlavery()
		if(npcSlave.getActivityID() in ["Prostitution"]):
			if(npcSlave.getActivity().shouldWork()):
				return 0.7
	if(globalTask != "" && _pawn.timeSinceLastWork > 3600):
		return _pawn.calculateSlutScore()*0.2
	return 0.0

func getKeepScore() -> float:
	return 0.8

func getText():
	return "{main.name} is heading to the prostitution spot!"

func getActions() -> Array:
	return [
		{
			id = "go",
			name = "Go!",
			desc = "Head there",
			score = 1.0,
			args = {},
			time = 60,
		},
	]
	

func doAction(_id:String, _args:Dictionary):
	if(_id == "go"):
		if(nextTarget == ""):
			nextTarget = RNG.pick(GM.world.getZoneRooms("prostitution"))
		
		if(nextTarget != ""):
			goTowards(nextTarget)
		
		if(getLocation() == nextTarget):
			getPawn().timeSinceLastWork = 0
			GM.main.IS.startInteraction("Prostitution", {main=getPawn().charID})

func getAnimData() -> Array:
	return [StageScene.Solo, "walk", {pc="main"}]

func saveData():
	var data = .saveData()
	
	data["nt"] = nextTarget
	return data

func loadData(_data):
	.loadData(_data)
	
	nextTarget = SAVE.loadVar(_data, "nt", "")
