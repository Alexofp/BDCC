extends InteractionGoalBase

var pawnIDTarget:String = ""

func getScore(_pawn:CharacterPawn) -> float:
	if(globalTask != ""):
		return 2.0
	return 0.0

func getKeepScore() -> float:
	return 2.1

func getText():
	return "{main.name} is trying to save someone!"

func getActions() -> Array:
#	if(getLocation() == nextTarget):
#		return [
#			{
#				id = "rest",
#				name = "Rest",
#				desc = "Take a short rest",
#				score = 1.0,
#				args = {},
#				time = 90,
#			},
#		]
	return [
		{
			id = "go",
			name = "Go!",
			desc = "Save the person",
			score = 1.0,
			args = {},
			time = 60,
		},
	]
	

func doAction(_id:String, _args:Dictionary):
	if(_id == "go"):
		var pawn = GM.main.IS.getPawn(pawnIDTarget)
		if(pawn == null):
			completeGoal()
			return
		if(pawn.getInteraction() == null || pawn.getInteraction().id != "Unconscious"):
			completeGoal()
			return
		
		var loc:String = pawn.getLocation()
		goTowards(loc)
		if(getLocation() == loc):
			GM.main.IS.startInteraction("NurseSave", {nurse=getPawn().charID, inmate=pawnIDTarget})
		
func getAnimData() -> Array:
	return [StageScene.Solo, "jog", {pc="main"}]

func getActivityIcon():
	return RoomStuff.PawnActivity.Help

func saveData():
	var data = .saveData()
	
	data["p"] = pawnIDTarget
	return data

func loadData(_data):
	.loadData(_data)
	
	pawnIDTarget = SAVE.loadVar(_data, "p", "")
