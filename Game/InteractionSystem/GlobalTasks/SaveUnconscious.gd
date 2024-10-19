extends GlobalTask

var allUnconPawns:Array = []
var pawnIDHasSavior:Dictionary = {}

func _init():
	id = "SaveUnconscious"
	goalID = InteractionGoal.Save
	maxAssignedUnscaled = 4

func canDoTask(_pawn:CharacterPawn) -> bool:
	if(!_pawn.isNurse()):
		return false
	
	if(pawnIDHasSavior.size() >= allUnconPawns.size()):
		return false
	
	return true

func configureGoal(_pawn:CharacterPawn, _goal):
	for pawn in allUnconPawns:
		if(pawnIDHasSavior.has(pawn.charID)):
			continue
		_goal.pawnIDTarget = pawn.charID
		pawnIDHasSavior[pawn.charID] = true
		return

func processTime(_howMuch:int):
	allUnconPawns = GM.main.IS.getAllUnconsciousPawns()
	var allAssigned = getAllAssignedPawns()
	
	pawnIDHasSavior.clear()
	for pawn in allAssigned:
		var interaction = pawn.getInteraction()
		if(interaction == null || interaction.id != "AloneInteraction"):
			continue
		var goal = interaction.goal
		if(goal == null):
			continue
		if(goal.id != InteractionGoal.Save):
			continue
		if(goal.pawnIDTarget == ""):
			continue
		pawnIDHasSavior[goal.pawnIDTarget] = true

func resetTask():
	allUnconPawns.clear()
	pawnIDHasSavior.clear()
