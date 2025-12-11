extends PlayerSlaveryBase
class_name PlayerSlaveryTentacles

const STAGE_INTRO = 0
const STAGE_EGG = 1
const STAGE_TINY = 2
const STAGE_SMALL = 3
const STAGE_NORMAL = 4

func setStage(_st:int):
	growStage = _st
	updateIcons()

var growStage:int = STAGE_INTRO

const STAT_ANGER = 0
const STAT_AGILITY = 1
const STAT_MIND = 2
const STAT_LUST = 3

const LOC_BED = "pstent_bed"
const LOC_FRIDGE = "pstent_fridge"
const LOC_IMPORTANT = "pstent_important"
const LOC_SHOWER = "pstent_shower"
const LOC_PLAY = "pstent_play"
const LOC_MIDDLE = "pstent_middle"

const LOC_ENTRANCE = "pstent_entrance"

const LOC_SCIENTISTS = "pstent_scientists"
const LOC_SCIENTIST_1 = "pstent_scientist_1"
const LOC_SCIENTIST_2 = "pstent_scientist_2"

const IconDudeMasc = preload("res://Images/WorldPawns/masc.png")
const IconDudeFem = preload("res://Images/WorldPawns/fem.png")
const IconEgg = preload("res://Images/WorldEntities/Egg.png")

var scientist1Loc:String = LOC_SCIENTIST_1
var scientist2Loc:String = LOC_SCIENTIST_2

# mood

# personality
var anger:int = 0
var agility:int = 0
var mind:int = 0
var lust:int = 0

func _init():
	id = "Tentacles"

func onSlaveryStart():
	createIcons()
	pass

func onSlaveryEnd():
	deleteIcons()
	pass

# Gets called after onSlaveryStart()
func getStartScene() -> String:
	return "PSTentaclesStart"

func getPCViewDistance() -> float:
	return 70.0

func getText(_loc:String) -> String:
	if(_loc == LOC_IMPORTANT):
		return "Test test TEST TEST"
	
	return ""

func action(_name:String, _desc:String, _sceneID:String, _args:Array = []):
	return [_name, _desc, _sceneID, _args]

func getActions(_loc:String) -> Array:
	var theActions:Array = []
	
	#if(_loc == LOC_IMPORTANT):
	#	theActions.append(action("MEOW", "TEST ACTION", "MeScene"))
	if(_loc == LOC_BED && growStage == STAGE_EGG):
		theActions.append(action("Rest", "Get some rest", "PSTentacles1EggInteract"))
	
	return theActions

func doAction(_scene, _action:Array):
	GM.main.runScene(_action[2], _action[3])

func checkEvent(_scene, _loc:String) -> Array:
	if(_loc == LOC_IMPORTANT):
		var theSci := getPendingScientistScene()
		if(!theSci.empty() && didScientistsApproach()):
			return [theSci]
	
	if(_loc == LOC_SHOWER):
		return ["MeScene"]
	return []

func shouldScientistsApproach() -> bool:
	if(!getPendingScientistScene().empty()):
		return true
	return false

func didScientistsApproach() -> bool:
	return (scientist1Loc == LOC_SCIENTISTS && scientist2Loc == LOC_SCIENTISTS)

func getPendingScientistScene() -> String:
	if(growStage == STAGE_INTRO):
		return "PSTentaclesEggIntro"
	return ""

func tpScientistsAway():
	scientist1Loc = LOC_SCIENTIST_1
	scientist2Loc = LOC_SCIENTIST_2
	updateIcons()

func tpScientistsWindow():
	scientist1Loc = LOC_SCIENTISTS
	scientist2Loc = LOC_SCIENTISTS
	updateIcons()

func setScientistsLoc(_loc:String):
	scientist1Loc = _loc
	scientist2Loc = _loc
	updateIcons()

func createIcons():
	GM.world.createEntity("ps_scientist1", IconDudeFem, scientist1Loc)
	GM.world.createEntity("ps_scientist2", IconDudeMasc, scientist2Loc)
	updateIcons()

func deleteIcons():
	GM.world.deleteEntity("ps_scientist1")
	GM.world.deleteEntity("ps_scientist2")

func updateIcons():
	GM.world.moveEntity("ps_scientist1", scientist1Loc)
	GM.world.moveEntity("ps_scientist2", scientist2Loc)
	if(growStage == STAGE_EGG):
		if(!GM.world.hasEntity("ps_egg")):
			GM.world.createEntity("ps_egg", IconEgg, LOC_MIDDLE, true)
	else:
		if(GM.world.hasEntity("ps_egg")):
			GM.world.deleteEntity("ps_egg")
		
func processTurn():
	if(shouldScientistsApproach()):
		scientist1Loc = goToSlow(scientist1Loc, LOC_SCIENTISTS)
		scientist2Loc = goToSlow(scientist2Loc, LOC_SCIENTISTS)
	else:
		scientist1Loc = goToSlow(scientist1Loc, LOC_SCIENTIST_1)
		scientist2Loc = goToSlow(scientist2Loc, LOC_SCIENTIST_2)
	
	updateIcons()

func afterWalkCheck():
	if(didScientistsApproach() && !getPendingScientistScene().empty()):
		GM.main.addMessage("You hear knocking on the glass..")

func goToSlow(_startLoc:String, theTargetLoc:String) -> String:
	if(_startLoc == theTargetLoc):
		return theTargetLoc
	
	var path:Array = GM.world.calculatePath(_startLoc, theTargetLoc)
	if(!path.empty() && path[0] == _startLoc):
		path.pop_front()
	
	if(path.empty()):
		return theTargetLoc
	
	return path[0]

func saveData() -> Dictionary:
	return {}

func loadData(_data:Dictionary):
	
	createIcons()
	pass
