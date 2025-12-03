extends InteractionGoalBase

func getSoftSlavery(_pawn:CharacterPawn):
	var softSlavery := _pawn.getSpecialRelationship()
	if(!softSlavery):
		return null
	if(softSlavery && softSlavery.id == "SoftSlavery"):
		return softSlavery
	return null

func getNpcOwner(_pawn:CharacterPawn) -> NpcOwnerBase:
	var softSlavery := _pawn.getSpecialRelationship()
	if(!softSlavery):
		return null
	if(softSlavery && softSlavery.id == "SoftSlavery" && softSlavery.npcOwner):
		return softSlavery.npcOwner
	return null

func getScore(_pawn:CharacterPawn) -> float:
	var npcOwner := getNpcOwner(_pawn)
	if(!npcOwner):
		return 0.0
	if(!canReachPC()):
		return 0.0
	if(npcOwner.shouldOwnerApproachPC()):
		return 100.0
	return 0.0

func getKeepScore() -> float:
	return 100.0

func getText():
	return "{main.name} is going somewhere.."

func getActions() -> Array:
	return [
		{
			id = "go",
			name = "Go",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 30,
		},
	]

func doAction(_id:String, _args:Dictionary):
	if(_id == "go"):
		var npcOwner := getNpcOwner(getPawn())
		if(!npcOwner || !canReachPC()):
			completeGoal()
			return
		
#		if(true):
#			var nemesis := getPawn().getSpecialRelationship()
#			if(nemesis && nemesis.id == "Nemesis"):
#				nemesis.gonnaAmbush = false
#
#			var currentAmbushesAmount:int = GM.main.IS.getInteractionsOfTypeAmount("NemesisAmbush")
#			if(currentAmbushesAmount > 0):
#				# Limiting to only one ambush at a time
#				completeGoal()
#				return
#
#			GM.main.IS.startInteraction("NemesisAmbush", {main=getPawn().charID})
#			return
#
		if(tryStartNpcOwnerEvent()):
			return

		goTowards(GM.pc.getLocation())
		tryStartNpcOwnerEvent()

func tryStartNpcOwnerEvent() -> bool:
	if(GM.main.IS.hasPawn("pc") && GM.main.IS.getPawn("pc").canBeInterrupted()):
		if(getLocation() == GM.pc.getLocation()):
			completeGoal()
			
			var newEventInfo:Array= getNpcOwner(getPawn()).getApproachEvent()
			if(!newEventInfo.empty()):
				GM.main.runScene("NpcOwnerEventRunnerScene", [getPawn().charID, newEventInfo[0], newEventInfo[1]])
			return true
	return false

func getAnimData() -> Array:
	return [StageScene.Solo, "walk", {pc="main"}]

func getActivityIcon():
	return RoomStuff.PawnActivity.None
