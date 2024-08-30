extends Reference
class_name InteractionGoalBase

var id:String = ""
var pawnID:String = ""
var interaction
var globalTask:String = ""

func saveData():
	return {
		"gt": globalTask,
	}

func loadData(_data):
	globalTask = SAVE.loadVar(_data, "gt", "")

func getScore(_pawn:CharacterPawn) -> float:
	return 0.0

func getText():
	return "They be doing something!"

func onGoalStart():
	pass

func getActions() -> Array:
	return [
#		{
#			id = "test",
#			name = "Test",
#			desc = "Do something",
#			score = 1.0,
#			args = {},
#			time = 60,
#		},
	]

func doAction(_id:String, _args:Dictionary):
	pass

func getKeepScore() -> float:
	return getScore(getPawn()) + 0.1





func getPawn() -> CharacterPawn:
	return GM.main.IS.getPawn(pawnID)

func getInteraction():
	return interaction



func getLocation() -> String:
	return getInteraction().getLocation()

func setLocation(newLoc:String):
	getInteraction().setLocation(newLoc)

func goTowards(theTarget:String):
	return getInteraction().goTowards(theTarget)

func doWander():
	return getInteraction().doWander()

func doWanderGurantee():
	return getInteraction().doWanderGurantee()

func completeGoal():
	getInteraction().completeGoal()

func getCurrentAction() -> String:
	return getInteraction().getCurrentAction()

func doLookAround(keepScoreMult:float = 1.0):
	return getInteraction().doLookAround("main", keepScoreMult)

func getAnimData() -> Array:
	return [StageScene.Solo, "stand", {pc="main"}]

func getActivityIcon():
	return RoomStuff.PawnActivity.None
