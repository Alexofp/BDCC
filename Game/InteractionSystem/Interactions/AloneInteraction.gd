extends PawnInteractionBase

var goal:InteractionGoalBase
var nextGoalTestIn:int = 200

func _init():
	id = "AloneInteraction"

func processTime(_howMuch:int):
	nextGoalTestIn -= _howMuch
	if(nextGoalTestIn <= 0):
		nextGoalTestIn = 200
		calculateBestGoal()

func calculateBestGoal():
	var goals = InteractionGoal.getAllAlone()
	
	var keepScore:float = 0.0
	if(goal != null):
		keepScore = goal.getKeepScore()
	
	var possibleNew := []
	for goalID in goals:
		if(goal != null && goalID == goal.id):
			continue
		var newGoalRef:InteractionGoalBase = InteractionGoal.getRef(goalID)
		
		var newScore = newGoalRef.getScore(getRolePawn("main"))
		if(newScore > keepScore || goal == null):
			possibleNew.append([goalID, newScore])
	
	if(possibleNew.size() <= 0):
		return
	
	var newGoalID = RNG.pickWeightedPairs(possibleNew)
	switchGoalTo(newGoalID)

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
	if(newGoal == null):
		return false
	newGoal.pawnID = getRolePawn("main").charID
	newGoal.interaction = self
	goal = newGoal
	goal.onGoalStart()
	print("NEW GOAL FOR PAWN "+str(newGoal.pawnID)+": "+str(goalID))
	return true

func start(_pawns:Dictionary, _args:Dictionary):
	involvedPawns = {main = _pawns["main"]}
	currentPawn = "main"
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

func getDebugInfo():
	var res:Array = .getDebugInfo()
	
	if(goal != null):
		res.append("")
		res.append("Current goal: "+str(goal.id))
		res.append("Goal keep score: "+str(Util.roundF(goal.getKeepScore(), 2)))
		res.append("")
	
	res.append("All goal weights:")
	var goals = InteractionGoal.getAllAlone()
	for goalID in goals:
		if(goal != null && goalID == goal.id):
			continue
		var newGoalRef:InteractionGoalBase = InteractionGoal.getRef(goalID)
		
		var newScore = newGoalRef.getScore(getRolePawn("main"))
		res.append(newGoalRef.id+" score: "+str(Util.roundF(newScore, 2)))
	
	return res
