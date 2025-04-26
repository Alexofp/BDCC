extends InteractionGoalBase

var sstate:String = "" # undress, shower

func getScore(_pawn:CharacterPawn) -> float:
	#if(_pawn.getCharacter().hasBoundArms() || _pawn.getCharacter().hasBlockedHands()):
	#	return 0.0
	if(_pawn.getCharacter().hasEffect(StatusEffect.CoveredInCum) || _pawn.getCharacter().hasEffect(StatusEffect.HasBodyWritings) || _pawn.getCharacter().hasEffect(StatusEffect.HasTallyMarks)):
		return 0.05
	if(_pawn.getCharacter().getStamina() <= 0.01):
		return 0.03
	return 0.0

func getKeepScore() -> float:
	return 0.7

func getText():
	if(sstate == "shower"):
		return "{main.name} is showering!"
	if(sstate == "undress"):
		return "{main.name} has undressed and is now going into the showers!"
	return "{main.name} is heading to the shower!"

func getActions() -> Array:
	return [
		{
			id = "go",
			name = "Go",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = (60 if sstate == "" else 180),
		},
	]

func doAction(_id:String, _args:Dictionary):
	if(_id == "go"):
		if(sstate == ""):
			var dist1:float = GM.world.simpleDistance(getLocation(), "main_dressing1")
			var dist2:float = GM.world.simpleDistance(getLocation(), "main_dressing2")
			
			if(dist1 < dist2):
				goTowards("main_dressing1")
				if(getLocation() == "main_dressing1"):
					sstate = "undress"
			else:
				goTowards("main_dressing2")
				if(getLocation() == "main_dressing2"):
					sstate = "undress"
		elif(sstate == "undress"):
			if(getLocation() == "main_dressing1"):
				setLocation("main_shower1")
				sstate = "shower"
			else:
				setLocation("main_shower2")
				sstate = "shower"
		elif(sstate == "shower"):
			getPawn().getChar().afterTakingAShower()
			if(RNG.chance(20)):
				getPawn().getChar().clearOrificeFluidsCheckBlocked()
			completeGoal()
		

func getAnimData() -> Array:
	if(sstate == "shower"):
		return [StageScene.Showering, RNG.pick(["body", "head"]), {pc="main", bodyState={naked=true}}]
	if(sstate == "undress"):
		return [StageScene.Solo, "stand", {pc="main", bodyState={naked=true}}]
	return [StageScene.Solo, "walk", {pc="main"}]

func getActivityIcon():
	#if(sstate != ""):
	#	return RoomStuff.PawnActivity.Shower
	return RoomStuff.PawnActivity.Shower

func saveData():
	var data = .saveData()
	
	data["s"] = sstate
	return data

func loadData(_data):
	.loadData(_data)
	
	sstate = SAVE.loadVar(_data, "s", "")
