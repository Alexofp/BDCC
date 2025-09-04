extends InteractionGoalBase

func getScore(_pawn:CharacterPawn) -> float:
	var nemesis := _pawn.getSpecialRelationship()
	if(!nemesis):
		return 0.0
	if(nemesis && nemesis.id == "Nemesis"):
		if(nemesis.gonnaAmbush):
			return 100.0
	return 0.0

func getKeepScore() -> float:
	return 100.0

func getText():
	return "{main.name} is doing something.."

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
		if(true):
			var nemesis := getPawn().getSpecialRelationship()
			if(nemesis && nemesis.id == "Nemesis"):
				nemesis.gonnaAmbush = false
			
			var currentAmbushesAmount:int = GM.main.IS.getInteractionsOfTypeAmount("NemesisAmbush")
			if(currentAmbushesAmount > 0):
				# Limiting to only one ambush at a time
				completeGoal()
				return
			
			GM.main.IS.startInteraction("NemesisAmbush", {main=getPawn().charID})
			return
		
		var leaveTarget:String = GM.pc.getLocation()
#		if(GM.main.IS.hasPawn("pc") && GM.main.IS.getPawn("pc").canBeInterrupted()):
#			if(getLocation() == leaveTarget):
#				completeGoal()
#				GM.main.runScene("SlutProstitutionReceiveCredits", [getPawn().charID])
		var room = GM.world.getRoomByID(leaveTarget)
		if(room != null && !room.isOfflimitsForInmates()):
			var theDist := GM.world.simpleRingDistance(getLocation(), GM.pc.getLocation())
			if(theDist > 3.0 || (theDist > 2.0 && RNG.chance(30))):
				goTowards(leaveTarget)

func getAnimData() -> Array:
	return [StageScene.Solo, "walk", {pc="main"}]

func getActivityIcon():
	return RoomStuff.PawnActivity.None
