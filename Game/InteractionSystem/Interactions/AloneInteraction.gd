extends PawnInteractionBase

var goal:InteractionGoalBase
var nextGoalTestIn:int = 200

func saveData():
	var data = .saveData()

	data["ngti"] = nextGoalTestIn
	if(goal != null):
		data["goal"] = {
			id = goal.id,
			data = goal.saveData(),
		}
	else:
		data["goal"] = {
			id = "",
		}
	return data

func loadData(_data):
	.loadData(_data)

	nextGoalTestIn = SAVE.loadVar(_data, "ngti", 200)
	goal = null
	var goalData = SAVE.loadVar(_data, "goal", {})
	var goalID = SAVE.loadVar(goalData, "id", "")
	if(goalID != ""):
		var newGoal:InteractionGoalBase = InteractionGoal.create(goalID)
		if(newGoal != null):
			newGoal.pawnID = getRoleID("main")
			newGoal.interaction = self
			goal = newGoal
			goal.loadData(SAVE.loadVar(goalData, "data", {}))

func _init():
	id = "AloneInteraction"

func processTime(_howMuch:int):
	nextGoalTestIn -= _howMuch
	if(nextGoalTestIn <= 0):
		nextGoalTestIn = 200
		calculateBestGoal()

func getGoalsWithScores(aboveKeepScore:bool = true) -> Array:
	var goals = InteractionGoal.getAllAlone()
	var pawn = getRolePawn("main")
	
	var keepScore:float = 0.0
	if(goal != null && aboveKeepScore):
		keepScore = goal.getKeepScore()
	
	var possibleNew := []
	for goalID in goals:
		if(goal != null && goalID == goal.id):
			continue
		var newGoalRef:InteractionGoalBase = InteractionGoal.getRef(goalID)
		
		var newScore = newGoalRef.getScore(pawn)
		if(newScore > keepScore || goal == null):
			possibleNew.append([goalID, newScore])
	
	for globalTaskID in GM.main.IS.getGlobalTasks():
		var globalTask:GlobalTask = GM.main.IS.getGlobalTask(globalTaskID)
		
		if(!globalTask.canDoTaskFinal(pawn)):
			continue
		
		var goalID = globalTask.getGoalID(pawn)
		var newgoal = InteractionGoal.create(goalID)
		if(newgoal == null):
			continue
		
		globalTask.configureGoalFinal(pawn, newgoal)
		var newScore = newgoal.getScore(pawn)
		if(newScore > keepScore || newgoal == null):
			possibleNew.append([newgoal, newScore])
	return possibleNew

func calculateBestGoal():
	var possibleNew := getGoalsWithScores()

	if(possibleNew.size() <= 0):
		return
	
	var newGoalID = RNG.pickWeightedPairs(possibleNew)
	if(newGoalID is String):
		switchGoalTo(newGoalID)
	else:
		switchGoalToObject(newGoalID)

func getGoal() -> InteractionGoalBase:
	if(goal == null):
		calculateBestGoal()
	return goal

func completeGoal():
	if(goal == null):
		calculateBestGoal()
		return
	goal = null
	calculateBestGoal()

func switchGoalTo(goalID:String):
	if(goalID == ""):
		goal = null
		return true
	var newGoal:InteractionGoalBase = InteractionGoal.create(goalID)
	return switchGoalToObject(newGoal)
	
func switchGoalToObject(newGoal):
	if(newGoal == null):
		return false
	newGoal.pawnID = getRolePawn("main").charID
	newGoal.interaction = self
	goal = newGoal
	goal.onGoalStart()
	#print("NEW GOAL FOR PAWN "+str(newGoal.pawnID)+": "+str(newGoal.id))
	return true

func start(_pawns:Dictionary, _args:Dictionary):
	doInvolvePawn("main", _pawns["main"])
	setCurrentRole("main")
	setLocation(getRolePawn("main").getLocation())

func getOutputText() -> String:
	var theGoal = getGoal()
	if(theGoal != null):
		return theGoal.getText()
	return "Something something"

func getActions() -> Array:
	var theGoal = getGoal()
	if(theGoal != null):
		return theGoal.getActions()
	return []

func doAction(_id:String, _args:Dictionary, _context:Dictionary):
	var theGoal = getGoal()
	if(theGoal != null):
		return theGoal.doAction(_id, _args)

#	var pawn = getRolePawn("main")
#
#	if(pawn.getHunger() <= 0.2):
#		if(getLocation() == "hall_canteen"):
#			pawn.hunger = 1.0
#		else:
#			goTowards("hall_canteen")
#		return
#
#	if(!doWanderGurantee()):
#		return {time = 0}
#	return {time = 60}

func doesStealControlFromPC() -> bool:
	return false

func getDebugInfo():
	var res:Array = .getDebugInfo()
	
	if(goal != null):
		res.append("")
		res.append("Current goal: "+str(goal.id))
		res.append("Goal keep score: "+str(Util.roundF(goal.getKeepScore(), 2)))
		res.append("")
	
	res.append("All goal weights:")
	var goalEntries = getGoalsWithScores(false)
	for goalEntry in goalEntries:
		var goalID = goalEntry[0]
		if(!(goalID is String)):
			goalID = goalID.id
		
		var thegoal = goalEntry[0]
		if(thegoal is String):
			thegoal = InteractionGoal.getRef(goalID)
		
		if(goal != null && goalID == goal.id):
			continue
		
		var newScore = goalEntry[1]
		res.append((thegoal.globalTask+":" if thegoal.globalTask != "" else "")+goalID+" score: "+str(Util.roundF(newScore, 2)))
	
	return res

func getAnimData() -> Array:
	if(goal == null):
		return []
	return goal.getAnimData()

func isDoingTask(_taskID:String) -> bool:
	if(goal == null):
		return false
	return (goal.globalTask == _taskID)

func getInterruptActions(_pawn:CharacterPawn) -> Array:
	var result:Array = []
	result.append({
		id = "talk",
		name = "Talk",
		desc = "Talk with them",
		score = 1.0,
		scoreType = "approach",
		scoreRole = "main",
		args = {},
	})
	if(getRolePawn("main").canGrabAndFuck() && _pawn.getChar().canStartSex()):
		result.append({
			id = "grab_and_fuck",
			name = "Grab&Fuck",
			desc = "They have so many restraints that you can just fuck them..",
			score = 1.0,
			scoreType = "sexUse",
			scoreRole = "main",
			args = {},
		})
	return result

func doInterruptAction(_pawn:CharacterPawn, _id:String, _args:Dictionary, _context:Dictionary):
	if(_id == "talk"):
		if(_pawn.isPlayer()):
			if(triggerTalkReactEvents("main")):
				return
		
		startInteraction("Talking", {starter=_pawn.charID, reacter=getRoleID("main")})
	if(_id == "grab_and_fuck"):
		startInteraction("Talking", {starter=_pawn.charID, reacter=getRoleID("main")}, {grab_and_fuck=true})

func canRoleBeInterrupted(_role:String) -> bool:
	return true
	
func canCharIDBeInterrupted(_charID:String) -> bool:
	return true

func getPreviewLineForRole(_role:String) -> String:
	if(_role == "main"):
		if(goal != null):
			return goal.getText().split("\n")[0]
	return .getPreviewLineForRole(_role)

func getActivityIconForRole(_role:String):
	if(isPlayerInvolved()):
		return RoomStuff.PawnActivity.None
	if(goal == null):
		return .getActivityIconForRole(_role)
	
	return goal.getActivityIcon()
