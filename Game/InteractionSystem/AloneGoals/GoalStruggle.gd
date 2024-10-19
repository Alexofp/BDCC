extends InteractionGoalBase

var lastText:String = ""
var lastAnim:String = ""

func getScore(_pawn:CharacterPawn) -> float:
	if(_pawn.getCharacter().getStamina() > 0 && _pawn.getCharacter().hasSomethingToStruggleOutOf()):
		var bondage:float = _pawn.scoreFetish({Fetish.Bondage:1.0})
		return 0.25 - bondage*0.2
	return 0.0

func getKeepScore() -> float:
	return 0.7

func getText():
	if(lastText != ""):
		return lastText
	return "{main.name} is trying to remove restraints.."

func getActions() -> Array:
	return [
		{
			id = "go",
			name = "Go",
			desc = "Do something",
			score = 1.0,
			args = {},
			time = 120,
		},
	]

func doAction(_id:String, _args:Dictionary):
	if(_id == "go"):
		if(getPawn().getChar().getStamina() <= 0 || !getPawn().getChar().hasSomethingToStruggleOutOf()):
			completeGoal()
			return
		
		var result:Dictionary = getPawn().getChar().doStruggleOutOfRestraints()
		if(result.empty()):
			completeGoal()
			return
		else:
			lastAnim = result["animation"]
			lastText = result["text"]

func getAnimData() -> Array:
	if(lastAnim != ""):
		return [StageScene.Solo, lastAnim, {pc="main"}]
	return [StageScene.Solo, "stand", {pc="main"}]

func getActivityIcon():
	return RoomStuff.PawnActivity.Struggle

func saveData():
	var data = .saveData()
	
	data["t"] = lastText
	data["a"] = lastAnim
	return data

func loadData(_data):
	.loadData(_data)
	
	lastText = SAVE.loadVar(_data, "t", "")
	lastAnim = SAVE.loadVar(_data, "a", "")
