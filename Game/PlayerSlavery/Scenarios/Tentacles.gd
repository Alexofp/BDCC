extends PlayerSlaveryBase
class_name PlayerSlaveryTentacles

const DEBUG_ENABLED = false

var interact1:String = "" #touch listen kick rub
var interact2:String = "" #fridge shower lamp cuddle
var interact3:String = "" #holdshut watch peel embrace

var interactTiny1:String = "" #chicken meat milk broc
var interactTiny2:String = "" #metal ambient dnb jazz
var interactTiny3:String = "" #puzzle toy ladder onahole

const STAGE_INTRO = 0
const STAGE_EGG = 1
const STAGE_TINY = 2
const STAGE_TINY_AFTERTEST = 3
const STAGE_SMALL = 4
const STAGE_SMALL_ENDDAY = 5
const STAGE_NORMAL = 6

var noticedEgged:bool = false

func setStage(_st:int):
	growStage = _st
	
	clearEvent()
	updateIcons(true)
func getDebugStages() -> Array:
	return [
		[STAGE_INTRO, "INTRO"],
		[STAGE_EGG, "EGG"],
		[STAGE_TINY, "TINY"],
		[STAGE_TINY_AFTERTEST, "TINY (AFTER REST)"],
		[STAGE_SMALL, "SMALL"],
		[STAGE_SMALL_ENDDAY, "STAGE_SMALL_ENDDAY"],
		[STAGE_NORMAL, "NORMAL"],
	]
func addSkipActions(_scene:SceneBase):
	if(!DEBUG_ENABLED):
		return
	
	for entry in getDebugStages():
		_scene.addButton(entry[1], "SKIP TO THIS STAGE", "skipStage", [entry[0]])
func doSkipAction(_stage:int):
	GM.pc.setLocation(LOC_BED)
	setStage(_stage)

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
const LOC_WINDOW = "pstent_window"
const LOC_DOOR = "pstent_left"

const LOC_ENTRANCE = "pstent_entrance"

const LOC_SCIENTISTS = "pstent_scientists"
const LOC_SCIENTIST_1 = "pstent_scientist_1"
const LOC_SCIENTIST_2 = "pstent_scientist_2"

const IconDudeMasc = preload("res://Images/WorldPawns/masc.png")
const IconDudeFem = preload("res://Images/WorldPawns/fem.png")
const IconEgg = preload("res://Images/WorldEntities/Egg.png")
const IconEggNest = preload("res://Images/WorldEntities/EggNest.png")
const IconWarning = preload("res://Images/WorldEntities/warning.png")
const IconTentacles = preload("res://Images/WorldEntities/Tentacles.png")
const IconTentaclesTiny = preload("res://Images/WorldEntities/TentaclesTiny.png")
const IconTentaclesSmall = preload("res://Images/WorldEntities/TentaclesSmall.png")

const GradientAnger:Gradient = preload("res://Game/PlayerSlavery/Scenarios/Tentacles/GradientAnger.tres")
const GradientAgility:Gradient = preload("res://Game/PlayerSlavery/Scenarios/Tentacles/GradientAgility.tres")
const GradientMind:Gradient = preload("res://Game/PlayerSlavery/Scenarios/Tentacles/GradientMind.tres")
const GradientLust:Gradient = preload("res://Game/PlayerSlavery/Scenarios/Tentacles/GradientLust.tres")
const STAT_TO_GRADIENT:Dictionary = {
	STAT_ANGER: GradientAnger,
	STAT_AGILITY: GradientAgility,
	STAT_MIND: GradientMind,
	STAT_LUST: GradientLust,
}

var monsterLoc:String = LOC_MIDDLE
var monsterTarget:String = LOC_IMPORTANT
var scientist1Loc:String = LOC_SCIENTIST_1
var scientist2Loc:String = LOC_SCIENTIST_2

var eventTarget:String = ""
var eventScene:String = ""
var eventArgs:Array = []
var eventGiveupTimer:int = 0

const EVENT_HUNGRY = 0
const EVENT_LEWD = 1
const EVENT_WINDOW = 2
const EVENT_PLAY = 3
const EVENT_BREAK = 4

var daysNormal:int = 0

var didRubLustEvent:bool = false
var didFirstSexEvent:bool = false
var window9hap:bool = false

var flagInjectForced:bool = false # Was the inject ending forced because the pc has run out of time

var preferEvent:int = -1

# mood
var eventNeed:int = 0
var lastEventType:int = -1
var isAngry:bool = false
var angryReason:String = ""

# personality
var anger:int = 0
var agility:int = 0
var mind:int = 0
var lust:int = 0
 
const DEFAULT_MONSTER_NAME = "Monster"
var monsterName:String = ""
const MONSTER_NAMES = [
	"Anomaly",
	"Monster",
	"Beast",
	"Sprout",
	"Viney",
	"Bloom",
	"Twine",
	"Gropey",
	"Hugs",
	"Snugglethorn",
	"Knotweed",
	"N'Gorroth",
	"Whispers",
	"Squeezebois",
	"Wrigglers",
]

const STAT_DESCRIPTIONS = {
	STAT_ANGER: [
		"Passive",
		"Calm",
		"Neutral",
		"Grumpy",
		"Irritated",
		"Annoyed",
		"Agitated",
		"Hostile",
		"Aggressive",
		"Furious",
		"Bloodthirsty",
	],
	STAT_AGILITY: [
		"Puny",
		"Fragile",
		"Weak",
		"Frail",
		"Fit",
		"Steady",
		"Nimble",
		"Swift",
		"Jacked",
		"Powerful",
		"Unstoppable",
	],
	STAT_MIND: [
		"Thoughtless",
		"Silly",
		"Dummy",
		"Simple",
		"Aware",
		"Curious",
		"Smart",
		"Clever",
		"Intelligent",
		"Genius",
		"Transcendent",
	],
	STAT_LUST: [
		"Frigid",
		"Cold",
		"Shy",
		"Timid",
		"Curious",
		"Warm",
		"Eager",
		"Needy",
		"Hungry",
		"Horny",
		"Insatiable",
	],
}

func saveData() -> Dictionary:
	return {
		interact1 = interact1,
		interact2 = interact2,
		interact3 = interact3,
		interactTiny1 = interactTiny1,
		interactTiny2 = interactTiny2,
		interactTiny3 = interactTiny3,
		noticedEgged = noticedEgged,
		growStage = growStage,
		monsterLoc = monsterLoc,
		monsterTarget = monsterTarget,
		scientist1Loc = scientist1Loc,
		scientist2Loc = scientist2Loc,
		eventTarget = eventTarget,
		eventScene = eventScene,
		eventArgs = eventArgs,
		eventGiveupTimer = eventGiveupTimer,
		daysNormal = daysNormal,
		didRubLustEvent = didRubLustEvent,
		didFirstSexEvent = didFirstSexEvent,
		window9hap = window9hap,
		flagInjectForced = flagInjectForced,
		preferEvent = preferEvent,
		eventNeed = eventNeed,
		lastEventType = lastEventType,
		isAngry = isAngry,
		angryReason = angryReason,
		anger = anger,
		agility = agility,
		mind = mind,
		lust = lust,
		monsterName = monsterName,
	}

func loadData(_data:Dictionary):
	interact1 = SAVE.loadVar(_data, "interact1", "")
	interact2 = SAVE.loadVar(_data, "interact2", "")
	interact3 = SAVE.loadVar(_data, "interact3", "")
	interactTiny1 = SAVE.loadVar(_data, "interactTiny1", "")
	interactTiny2 = SAVE.loadVar(_data, "interactTiny2", "")
	interactTiny3 = SAVE.loadVar(_data, "interactTiny3", "")
	noticedEgged = SAVE.loadVar(_data, "noticedEgged", false)
	growStage = SAVE.loadVar(_data, "growStage", STAGE_INTRO)
	monsterLoc = SAVE.loadVar(_data, "monsterLoc", LOC_MIDDLE)
	monsterTarget = SAVE.loadVar(_data, "monsterTarget", LOC_IMPORTANT)
	scientist1Loc = SAVE.loadVar(_data, "scientist1Loc", LOC_SCIENTIST_1)
	scientist2Loc = SAVE.loadVar(_data, "scientist2Loc", LOC_SCIENTIST_2)
	eventTarget = SAVE.loadVar(_data, "eventTarget", "")
	eventScene = SAVE.loadVar(_data, "eventScene", "")
	eventGiveupTimer = SAVE.loadVar(_data, "eventGiveupTimer", 0)
	daysNormal = SAVE.loadVar(_data, "daysNormal", 0)
	didRubLustEvent = SAVE.loadVar(_data, "didRubLustEvent", false)
	didFirstSexEvent = SAVE.loadVar(_data, "didFirstSexEvent", false)
	window9hap = SAVE.loadVar(_data, "window9hap", false)
	flagInjectForced = SAVE.loadVar(_data, "flagInjectForced", false)
	preferEvent = SAVE.loadVar(_data, "preferEvent", -1)
	eventNeed = SAVE.loadVar(_data, "eventNeed", 0)
	lastEventType = SAVE.loadVar(_data, "lastEventType", -1)
	isAngry = SAVE.loadVar(_data, "isAngry", false)
	angryReason = SAVE.loadVar(_data, "angryReason", "")
	anger = SAVE.loadVar(_data, "anger", 0)
	agility = SAVE.loadVar(_data, "agility", 0)
	mind = SAVE.loadVar(_data, "mind", 0)
	lust = SAVE.loadVar(_data, "lust", 0)
	monsterName = SAVE.loadVar(_data, "monsterName", "")
	
	createIcons()
	prepareForSex()
	pass


func _init():
	id = "Tentacles"

func onSlaveryStart():
	createIcons()
	var theSci1 = GlobalRegistry.getCharacter(getScientist1CharID())
	if(theSci1):
		theSci1.afterTakingAShower()
		theSci1.cancelPregnancy()
	var theSci2 = GlobalRegistry.getCharacter(getScientist2CharID())
	if(theSci2):
		theSci2.afterTakingAShower()
		theSci2.cancelPregnancy()

func onSlaveryEnd():
	deleteIcons()
	var theSci1 = GlobalRegistry.getCharacter(getScientist1CharID())
	if(theSci1):
		theSci1.afterTakingAShower()
		theSci1.cancelPregnancy()
	var theSci2 = GlobalRegistry.getCharacter(getScientist2CharID())
	if(theSci2):
		theSci2.afterTakingAShower()
		theSci2.cancelPregnancy()
	
	if(GM.pc.isEggStuffed()):
		GM.main.setFlag("ElizaModule.tent_returnedegged", true)
	else:
		GM.main.setFlag("ElizaModule.tent_returnedegged", false)
	
# Gets called after onSlaveryStart()
func getStartScene() -> String:
	return "PSTentaclesStart"

func getPCViewDistance() -> float:
	return 100.0

func doNewDay():
	clearEvent()
	daysNormal += 1

func isSmallOrNormal() -> bool:
	return growStage in [STAGE_SMALL, STAGE_NORMAL]

func isNormal() -> bool:
	return growStage in [STAGE_NORMAL]

func isTiny() -> bool:
	return growStage in [STAGE_TINY, STAGE_TINY_AFTERTEST]

func isSmalll() -> bool:
	return growStage in [STAGE_SMALL, STAGE_SMALL_ENDDAY]

func getTentaclesMeetAnim() -> Array:
	if(growStage == STAGE_INTRO):
		return []
	if(growStage in [STAGE_EGG]):
		return [StageScene.SoloBigEgg, "stand", {}]
	if(growStage in [STAGE_TINY]):
		return [StageScene.TentaclesDuo, "idle", {tentaclesSizeTiny=true, plant=true, tentaclesLess=true}]
	if(growStage in [STAGE_TINY_AFTERTEST]):
		return [StageScene.TentaclesDuo, "sleep", {tentaclesSizeTiny=true, plant=true, instantSleep=true, tentaclesLess=true}]
	if(growStage == STAGE_SMALL):
		return [StageScene.TentaclesDuo, "idle", {tentaclesSizeSmall=true, plant=true}]
	if(growStage == STAGE_SMALL_ENDDAY):
		return [StageScene.TentaclesDuo, "sleep", {tentaclesSizeSmall=true, plant=true, instantSleep=true}]
	
	return [StageScene.TentaclesDuo, "idle", {plant=true}]

func prepareForSex():
	var theChar:BaseCharacter = GlobalRegistry.getCharacter(getTentaclesCharID())
	if(!theChar):
		return
	var thePers:Personality = theChar.personality
	var theFetishHolder:FetishHolder = theChar.fetishHolder
	
	var theMean:float = 0.0 + anger*1.5 - lust
	thePers.setStat(PersonalityStat.Mean, clamp(theMean*0.1, -1.0, 1.0))
	var theDom:float = -5.0 + mind + anger*0.5
	thePers.setStat(PersonalityStat.Subby, -clamp(theDom*0.1, -1.0, 1.0))
	var thePerceptive:float = -10.0 + mind*2.0
	thePers.setStat(PersonalityStat.Naive, -clamp(thePerceptive*0.1, -1.0, 1.0))
	var theBrave:float = -5.0 + agility*1.5
	thePers.setStat(PersonalityStat.Coward, -clamp(theBrave*0.1, -1.0, 1.0))
	var thePatience:float = -5.0 + mind
	thePers.setStat(PersonalityStat.Impatient, -clamp(thePatience*0.1, -1.0, 1.0))
	
	var theChoke:float = -5.0 + 3.0*anger
	theFetishHolder.setFetish(Fetish.Choking, clamp(theChoke*0.1, 0.0, 1.0))
	var theUncon:float = -5.0 + 2.0*anger
	theFetishHolder.setFetish(Fetish.UnconsciousSex, clamp(theUncon*0.1, -0.5, 1.0))
	var theSadism:float = 0.0 + 2.0*anger + agility*0.5 - mind*0.5
	theFetishHolder.setFetish(Fetish.Sadism, clamp(theSadism*0.1, -0.5, 1.0))
	var theEx:float = 2.5 + mind*1.5
	theFetishHolder.setFetish(Fetish.Exhibitionism, clamp(theEx*0.1, -0.5, 1.0))
	

func satisfyEventNeed():
	eventNeed = 0

func getText(_loc:String) -> String:
	var Ar:Array = []
	
	#if(_loc == LOC_IMPORTANT):
	#	Ar.append("Test test TEST TEST")
	
	if(_loc == LOC_PLAY):
		if(growStage >= STAGE_TINY):
			Ar.append("There is a table here with a single chair. Near the table there are a few boxes with stuff.")
		else:
			Ar.append("There is a table here with a single chair.")
	
	if(_loc == LOC_WINDOW):
		Ar.append("There is a reinforced window here. It gives you a great view of the infinite void.")
	
	if(_loc == LOC_SHOWER):
		Ar.append("The wall has a shower head installed. The shower drain keeps the rest of the floor dry.")
	
	if(_loc == LOC_FRIDGE):
		Ar.append("There is a fridge here!")
	
	if(_loc == LOC_IMPORTANT):
		Ar.append("There is a window here that leads into some corridor.")
	
	if(_loc == LOC_DOOR):
		Ar.append("There is a highly-reinforced sealed door here. Above it is a security camera that always tracks your movement.")
	
	if(_loc == LOC_BED):
		Ar.append("You're standing near your bed.")
		
	if(_loc == LOC_MIDDLE):
		if(growStage == STAGE_EGG):
			Ar.append("You're standing near a very weird egg.")
		if(growStage == STAGE_TINY):
			Ar.append("You're standing near 3 tiny green tentacles that are swaying in their nest.")
		if(growStage == STAGE_TINY_AFTERTEST):
			Ar.append("You're standing near 3 tiny green tentacles. They seem to be sleeping in their nest.")
		if(growStage == STAGE_SMALL):
			if(monsterLoc != LOC_MIDDLE):
				Ar.append("The tentacles' nest is still here. Currently it's empty.")
		if(growStage == STAGE_SMALL_ENDDAY):
			Ar.append("You're standing near small green tentacles. They seem to be sleeping in their nest.")
		
		if(growStage in [STAGE_NORMAL]):
			if(monsterLoc != LOC_MIDDLE):
				Ar.append("The tentacles' nest is still here. Currently it's empty.")
		
	if(isSmallOrNormal() && DEBUG_ENABLED):
		Ar.append("eventNeed: "+str(eventNeed))
		Ar.append("anger: "+str(anger))
		Ar.append("agility: "+str(agility))
		Ar.append("mind: "+str(mind))
		Ar.append("lust: "+str(lust))
	if(isSmallOrNormal()):
		if(GM.pc.getLocation() == monsterLoc):
			Ar.append("")
			Ar.append(getMonsterName()+" is near.")
			Ar.append_array(getStatDescriptions())
	
	if(isNormal() && daysNormal >= 1):
		var timeLeft:int = getEndOfDayTime() - GM.main.getTime()
		Ar.append(""+Util.getTimeStringHumanReadable(timeLeft)+" left until the scientists return.")
	
	return Util.join(Ar, "\n")

func action(_name:String, _desc:String, _sceneID:String, _args:Array = []):
	return [_name, _desc, _sceneID, _args]

func getActions(_loc:String) -> Array:
	var theActions:Array = []
	
	if(isSmallOrNormal()):
		if(eventScene != ""):
			if(eventTarget == monsterLoc && _loc == eventTarget):
				theActions.append(action(getMonsterName(), "See what's up", "doEvent"))
	
	if(isNormal() && daysNormal >= 1 && _loc == monsterLoc && getCurrentEvent() < 0):
		theActions.append(action(getMonsterName(), "Approach your tentacles.. and think about the options that you have.", "PSTentaclesEndingChoice", [false]))
	
	#if(_loc == LOC_IMPORTANT):
	#	theActions.append(action("MEOW", "TEST ACTION", "MeScene"))
	if(_loc == LOC_BED && growStage == STAGE_EGG):
		theActions.append(action("Rest", "Get some rest", "PSTentacles1EggInteract"))
	if(_loc == LOC_BED && growStage == STAGE_TINY):
		theActions.append(action("Rest", "Get some rest", "PSTentacles2SmallInteract"))
	if(_loc == LOC_BED && growStage == STAGE_TINY_AFTERTEST):
		theActions.append(action("Sleep", "Get some rest", "PSTentaclesTinySleep"))
	if(_loc == LOC_SHOWER):
		theActions.append(action("Shower", "Take a shower", "PSTentaclesShower"))
	if(_loc == LOC_WINDOW):
		if(getCurrentEvent() != EVENT_WINDOW):
			theActions.append(action("Window", "Look at the view", "PSTentaclesWindowAlone"))
	if(_loc == LOC_PLAY):
		if(getCurrentEvent() != EVENT_PLAY):
			theActions.append(action("Yoga", "Maybe you could do some yoga here", "PSTentaclesTableAlone"))
	if(_loc == LOC_FRIDGE):
		if(getCurrentEvent() != EVENT_HUNGRY && getCurrentEvent() != EVENT_BREAK):
			theActions.append(action("Fridge", "Open the fridge", "PSTentaclesFridge"))
	if(_loc == LOC_BED && growStage == STAGE_SMALL_ENDDAY):
		theActions.append(action("Sleep", "Get some rest", "PSTentaclesSmallSleep"))
	
	return theActions

func doAction(_scene, _action:Array):
	if(_action[2] == "doEvent"):
		GM.main.runScene(eventScene, eventArgs)
		satisfyEventNeed()
		eventScene = ""
		eventTarget = ""
		eventArgs = []
		eventGiveupTimer = 0
		#GM.main.processTime(60*60)
		return
	GM.main.runScene(_action[2], _action[3])

func getEndOfDayTime() -> int:
	return 20*60*60

func checkEvent(_scene, _loc:String) -> Array:
	if(growStage == STAGE_SMALL):
		if(GM.main.getTime() > getEndOfDayTime()):
			return ["PSTentaclesSmallEndOfDay"]
	
	if(growStage == STAGE_NORMAL):
		if(GM.main.getTime() > getEndOfDayTime()):
			if(daysNormal >= 1):
				return ["PSTentaclesEndingChoice"]
			return ["PSTentaclesNormalSleep"]
	
	if(isSmallOrNormal() && isAngry):
		if(_loc == monsterLoc):
			isAngry = false
			#incStat(STAT_ANGER)
			return ["PSTentaclesAngrySmall"]
	
	if(isSmallOrNormal()):
		if(hasEvent() && eventTarget == "pc"):
			if(_loc == monsterLoc):
				doAction(_scene, ["", "", "doEvent"])
				return []
				#theActions.append(action("Monster", "See what's up", "doEvent"))
	
	if(_loc == LOC_IMPORTANT):
		var theSci := getPendingScientistScene()
		if(!theSci.empty() && didScientistsApproach()):
			return [theSci]
	
	#if(_loc == LOC_SHOWER):
	#	return ["MeScene"]
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

func setMonsterLoc(_loc:String):
	monsterLoc = _loc
	updateIcons()

func getMonsterLoc() -> String:
	return monsterLoc

func createIcons():
	GM.world.createEntity("ps_scientist1", IconDudeFem, scientist1Loc)
	GM.world.createEntity("ps_scientist2", IconDudeMasc, scientist2Loc)
	updateIcons()

func deleteIcons():
	GM.world.deleteEntity("ps_scientist1")
	GM.world.deleteEntity("ps_scientist2")

func getMonsterIcon():
	if(growStage >= STAGE_NORMAL):
		return IconTentacles
	return IconTentaclesSmall

func updateIcons(_force:bool = false):
	GM.world.moveEntity("ps_scientist1", scientist1Loc)
	GM.world.moveEntity("ps_scientist2", scientist2Loc)
	if(growStage in [STAGE_EGG]):
		if(!GM.world.hasEntity("ps_egg")):
			GM.world.createEntity("ps_egg", IconEgg, LOC_MIDDLE, true)
	else:
		GM.world.deleteEntity("ps_egg")
	
	#Nest
	if(growStage >= STAGE_TINY):
		if(!GM.world.hasEntity("ps_nest")):
			GM.world.createEntity("ps_nest", IconEggNest, LOC_MIDDLE, true)
	else:
		GM.world.deleteEntity("ps_nest")
	
	#Tiny version
	if(growStage in [STAGE_TINY, STAGE_TINY_AFTERTEST]):
		if(!GM.world.hasEntity("ps_tiny") || _force):
			GM.world.createEntity("ps_tiny", IconTentaclesTiny, monsterLoc, true)
	else:
		GM.world.deleteEntity("ps_tiny")
	
	#Small/Normal version
	if(growStage in [STAGE_SMALL, STAGE_SMALL_ENDDAY, STAGE_NORMAL]):
		if(!GM.world.hasEntity("ps_small") || _force):
			GM.world.createEntity("ps_small", getMonsterIcon(), monsterLoc, true)
		else:
			GM.world.moveEntity("ps_small", monsterLoc, true)
	else:
		GM.world.deleteEntity("ps_small")
	
	if(isSmallOrNormal()):
		if(shouldDisplayWarningAboveMonster()):
			if(!GM.world.hasEntity("ps_warning")):
				GM.world.createEntity("ps_warning", IconWarning, monsterLoc, true, Vector2(0.0, -20.0))
			else:
				GM.world.moveEntity("ps_warning", monsterLoc, true, Vector2(0.0, -20.0))
		else:
			GM.world.deleteEntity("ps_warning")

func shouldDisplayWarningAboveMonster() -> bool:
	if(isSmallOrNormal()):
		if(eventScene != ""):
			if(eventTarget == monsterLoc):
				return true
	return false

func getAngryReason() -> String:
	if(angryReason.empty()):
		return "didn't spend time with it"
	return angryReason

func hasEvent() -> bool:
	return !eventScene.empty()

func getEventExtraWeight(_eventID:int) -> float:
	if(_eventID == EVENT_WINDOW):
		if(mind >= 10):
			return -0.5
		return max((mind - 3)*0.2, 0.0)
	if(_eventID == EVENT_LEWD):
		if(lust >= 10):
			return 0.0
		return max((lust - 3)*0.2, 0.0)
	if(_eventID == EVENT_PLAY):
		if(agility >= 10):
			return 0.0
		return max((agility - 3)*0.2, 0.0)
	if(_eventID == EVENT_BREAK):
		if(anger >= 10):
			return -0.5
		return max((anger - 3)*0.2, 0.0)
	
	return 0.0

func getPossibleEvents() -> Array:
	var possible:Array = []
	var weights:Array = []
	
	var lewdEventScene:String = "PSTentaclesLewdSmall"
	if(!didFirstSexEvent && isNormal()):
		lewdEventScene = "PSTentaclesFirstSex"
	
	possible.append([EVENT_WINDOW, LOC_WINDOW, "PSTentaclesWindowSmall", [], "didn't spend time with it"])
	weights.append((1.0 if preferEvent != EVENT_WINDOW else 2.0) + getEventExtraWeight(EVENT_WINDOW))
	possible.append([EVENT_HUNGRY, LOC_FRIDGE, "PSTentaclesFeedSmall", [], "didn't feed it"])
	weights.append((1.0 if preferEvent != EVENT_HUNGRY else 2.0) + getEventExtraWeight(EVENT_HUNGRY))
	possible.append([EVENT_LEWD, "pc", lewdEventScene, [], "didn't play with it"])
	weights.append((1.0 if preferEvent != EVENT_LEWD else 2.0) + getEventExtraWeight(EVENT_LEWD))
	possible.append([EVENT_PLAY, LOC_IMPORTANT, "PSTentaclesPlaySmall", [], "didn't play with it"])
	weights.append((1.0 if preferEvent != EVENT_PLAY else 2.0) + getEventExtraWeight(EVENT_PLAY))
	possible.append([EVENT_BREAK, RNG.pick([LOC_FRIDGE, LOC_DOOR]), "PSTentaclesBreakStuff", [], "didn't approach it"])
	weights.append((1.0 if preferEvent != EVENT_BREAK else 2.0) + getEventExtraWeight(EVENT_PLAY))
	
	var thePS:int = possible.size()
	for _i in range(thePS):
		var _indx:int = thePS - 1 - _i
		if(possible[_indx][0] == lastEventType && RNG.chance(150.0 - weights[_indx]*50.0)):
			possible.remove(_indx)
			weights.remove(_indx)
	return [possible, weights]

func processTurn():
	if(shouldScientistsApproach()):
		scientist1Loc = goToSlow(scientist1Loc, LOC_SCIENTISTS)
		scientist2Loc = goToSlow(scientist2Loc, LOC_SCIENTISTS)
	else:
		scientist1Loc = goToSlow(scientist1Loc, LOC_SCIENTIST_1)
		scientist2Loc = goToSlow(scientist2Loc, LOC_SCIENTIST_2)
	
	if(isSmallOrNormal()):
		if(!hasEvent() && !isAngry):
			eventNeed += 1
			if(eventNeed >= 4 && RNG.chance(10 + (eventNeed-4)*10 )):
				eventNeed = 0
				
				var theAllEventsAndWeights := getPossibleEvents()
				if(!theAllEventsAndWeights.empty()):
					var theAllEvents:Array = theAllEventsAndWeights[0]
					var theAllWeights:Array = theAllEventsAndWeights[1]
					
					var theRandomEvent:Array = RNG.pickWeighted(theAllEvents, theAllWeights)
				
					angryReason = theRandomEvent[4]
					setEvent(theRandomEvent[0], theRandomEvent[1], theRandomEvent[2], theRandomEvent[3])
		
		if(isAngry):
			monsterLoc = goToSlow(monsterLoc, GM.pc.getLocation())
		elif(!eventTarget.empty()):
			if(monsterLoc == eventTarget):
				eventGiveupTimer += 1
				if(eventGiveupTimer >= 6 && RNG.chance(33)):
					clearEvent()
					setAngryAtPC()
					#incStat(STAT_ANGER)
			else:
				monsterLoc = goToSlow(monsterLoc, eventTarget)
		elif(monsterLoc == monsterTarget):
			monsterTarget = RNG.pick([LOC_BED, LOC_FRIDGE, LOC_IMPORTANT, LOC_PLAY, LOC_SHOWER, LOC_WINDOW])
		else:
			if(!monsterTarget.empty()):
				monsterLoc = goToSlow(monsterLoc, monsterTarget)
		
	updateIcons()

func setAngryAtPC():
	isAngry = true

func doTurn():
	processTurn()

func afterWalkCheck():
	if(didScientistsApproach() && !getPendingScientistScene().empty()):
		GM.main.addMessage("You hear knocking on the glass..")

func goToSlow(_startLoc:String, theTargetLoc:String) -> String:
	if(theTargetLoc == "pc"):
		theTargetLoc = GM.pc.getLocation()
	if(theTargetLoc.empty()):
		Log.printerr("EMPTY TARGET LOC")
		return _startLoc
	if(_startLoc == theTargetLoc):
		return theTargetLoc
	
	var path:Array = GM.world.calculatePath(_startLoc, theTargetLoc)
	if(!path.empty() && path[0] == _startLoc):
		path.pop_front()
	
	if(path.empty()):
		return theTargetLoc
	
	return path[0]

func setStat(_statID:int, _val:int):
	if(_statID == STAT_ANGER):
		anger = _val
	if(_statID == STAT_AGILITY):
		agility = _val
	if(_statID == STAT_MIND):
		mind = _val
	if(_statID == STAT_LUST):
		lust = _val

func getStat(_statID:int) -> int:
	if(_statID == STAT_ANGER):
		return anger
	if(_statID == STAT_AGILITY):
		return agility
	if(_statID == STAT_MIND):
		return mind
	if(_statID == STAT_LUST):
		return lust
	return 0

func getStatName(_statID:int) -> String:
	if(_statID == STAT_ANGER):
		return "Anger"
	if(_statID == STAT_AGILITY):
		return "Agility"
	if(_statID == STAT_MIND):
		return "Mind" # Also Psychic bond
	if(_statID == STAT_LUST):
		return "Lust"
	return "ERROR?"

func incStat(_statID:int, showMessage:bool = true) -> bool:
	if(_statID < 0):
		return false
	var theStat := getStat(_statID)
	var theOldStat := theStat
	theStat += 1
	if(theStat < 0):
		theStat = 0
	var statLimit:int = 5
	if(isNormal()):
		statLimit = 10
	
	if(theStat > statLimit):
		theStat = statLimit
		if(showMessage):
			GM.main.addMessage(getMonsterName()+"'s "+getStatName(_statID)+" has reached the"+("" if statLimit > 5 else " today's")+" limit.")
	setStat(_statID, theStat)
	if(theStat == theOldStat):
		return false
	
	if(showMessage):
		GM.main.addMessage(getMonsterName()+"'s "+getStatName(_statID)+" got increased!")
	
	return true

const TRAIN_MINUTES = 60

func train(_statID:int, _passTime:bool = true) -> bool:
	if(_passTime):
		GM.main.processTime(TRAIN_MINUTES*60)
	return incStat(_statID)

func trainUntilFive(_statID:int, _passTime:bool = true):
	if(_passTime):
		GM.main.processTime(TRAIN_MINUTES*60)
	while(getStat(_statID) < 5):
		incStat(_statID)

func trainNothing() -> bool:
	GM.main.processTime(TRAIN_MINUTES*60)
	return true

func getTentaclesCharID() -> String:
	return "psplantTentacles"
func getScientist1CharID() -> String:
	return "psTentSci1"
func getScientist2CharID() -> String:
	return "psTentSci2"

func setEvent(_eventType:int, _targetLoc:String, _scene:String, _args:Array = []):
	lastEventType = _eventType
	eventTarget = _targetLoc
	eventScene = _scene
	eventArgs = _args
	eventGiveupTimer = 0

func getCurrentEvent() -> int:
	if(!eventScene.empty()):
		return lastEventType
	return -1

func clearEvent():
	eventTarget = ""
	eventScene = ""
	eventArgs = []
	eventGiveupTimer = 0
	isAngry = false

func addMonsterNameButtons(_scene:SceneBase):
	for theName in MONSTER_NAMES:
		_scene.addButton(theName, "Pick this name!", "pickName", [theName])

func setMonsterName(_n:String):
	monsterName = _n
func getMonsterName() -> String:
	if(monsterName.empty()):
		return DEFAULT_MONSTER_NAME
	return monsterName

func getBiggestStat() -> int:
	var biggestStat:int = STAT_ANGER
	var biggestStatNumber:int = -1
	if(anger > biggestStatNumber):
		biggestStatNumber = anger
		biggestStat = STAT_ANGER
	if(agility > biggestStatNumber):
		biggestStatNumber = agility
		biggestStat = STAT_AGILITY
	if(mind > biggestStatNumber):
		biggestStatNumber = mind
		biggestStat = STAT_MIND
	if(lust > biggestStatNumber):
		biggestStatNumber = lust
		biggestStat = STAT_LUST
	return biggestStat

func processTalkText(_text:String) -> String:
	if(mind < 5):
		return ""
	var theMod:float = 1.0
	if(mind <= 6):
		theMod = 1.0
	elif(mind <= 7):
		theMod = 0.3
	elif(mind <= 8):
		theMod = 0.2
	elif(mind <= 9):
		theMod = 0.0
	else:
		theMod = 0.0
	_text = Util.shuffleWordLetters(_text, 50.0*theMod)
	_text = Util.replaceLettersRandomly(_text, 20.0*theMod)
	return _text

func talk(_text:String):
	if(mind < 5):
		return
	var _scene:SceneBase = GM.main.getCurrentScene()
	# Hides/scambles text depending on mind value
	
	# 1-6 GIBBERISH
	# 7 - Rare
	# 8 - Very rare
	# 9-10 - perfect
	
	var _theText:String = processTalkText(_text)
	if(_theText.empty()):
		return
	_scene.saynn("[say="+getTentaclesCharID()+"]"+_theText+"[/say]")

func doAnimDuo(_anim:String, _otherArgs:Dictionary = {}):
	var theArgs:Dictionary = {plant=true}
	if(growStage in [STAGE_TINY, STAGE_TINY_AFTERTEST]):
		theArgs["tentaclesLess"] = true
		theArgs["tentaclesSizeTiny"] = true
	if(growStage in [STAGE_SMALL, STAGE_SMALL_ENDDAY]):
		theArgs["tentaclesSizeSmall"] = true
	
	for argID in _otherArgs:
		theArgs[argID] = _otherArgs[argID]
	
	GM.main.getCurrentScene().playAnimation(StageScene.TentaclesDuo, _anim, theArgs)

func doAnim(_anim:String, _otherArgs:Dictionary = {}):
	doAnimDuo(_anim, _otherArgs)

func setPrefer(_eventType:int):
	if(_eventType == preferEvent):
		return
	preferEvent = _eventType
	
	if(preferEvent == EVENT_LEWD):
		GM.main.addMessage("The tentacles will now prefer to be lusty..")
	if(preferEvent == EVENT_PLAY):
		GM.main.addMessage("The tentacles will now prefer to be active..")
	if(preferEvent == EVENT_WINDOW):
		GM.main.addMessage("The tentacles will now prefer to be mindful..")
	if(preferEvent == EVENT_BREAK):
		GM.main.addMessage("The tentacles will now prefer to be destructive..")
	if(preferEvent == -1):
		GM.main.addMessage("The tentacles forgot the preference towards any activity that they had..")

func getPrefer() -> int:
	return preferEvent

func internal_clampStat(_stat:int) -> int:
	if(_stat < 0):
		return 0
	if(_stat > 10):
		return 10
	return _stat

func internal_processStatText(_statID:int, _stat:int) -> String:
	var theF:float = float(_stat)/10.0
	var theColor:Color = STAT_TO_GRADIENT[_statID].interpolate(theF)
	
	var theText:String = STAT_DESCRIPTIONS[_statID][_stat]
	if(_stat == 10):
		theText = theText.to_upper()
	return "[color=#"+theColor.to_html(false)+"]"+theText+"[/color]"

func getStatDescriptions() -> Array:
	var theAngerIndex:int = internal_clampStat(anger)
	var theAgilityIndex:int = internal_clampStat(agility)
	var theMindIndex:int = internal_clampStat(mind)
	var theLustIndex:int = internal_clampStat(lust)
	
	var preferText:String = ""
	if(preferEvent == EVENT_LEWD):
		preferText = "The tentacles prefer to be lusty"
	if(preferEvent == EVENT_PLAY):
		preferText = "The tentacles prefer to be active"
	if(preferEvent == EVENT_WINDOW):
		preferText = "The tentacles prefer to be mindful"
	if(preferEvent == EVENT_BREAK):
		preferText = "The tentacles prefer to be destructive"
	if(preferEvent == -1):
		preferText = "The tentacles don't have a preference towards anything"
	
	return [
		"Anger: "+internal_processStatText(STAT_ANGER, theAngerIndex),
		"Agility: "+internal_processStatText(STAT_AGILITY, theAgilityIndex),
		"Mind: "+internal_processStatText(STAT_MIND, theMindIndex),
		"Lust: "+internal_processStatText(STAT_LUST, theLustIndex),
		preferText,
	]
	
func strippedByDetective():
	GM.pc.getInventory().clearSlot(InventorySlot.Body)

func doJog():
	var theLoc:String = RNG.pick([
		LOC_BED, LOC_FRIDGE, LOC_IMPORTANT, LOC_SHOWER, LOC_PLAY, LOC_MIDDLE, LOC_WINDOW, LOC_DOOR,
	])
	GM.pc.setLocation(theLoc)
	setMonsterLoc(theLoc)
	GM.main.getCurrentScene().aimCameraAndSetLocName(theLoc)

func getDebugActions():
	return [
		{
			"id": "setAnger",
			"name": "Set Anger",
			"args": [
				{
					"id": "amount",
					"name": "Value",
					"type": "number",
					"value": 10,
				},
			]
		},
		{
			"id": "setAgility",
			"name": "Set Agility",
			"args": [
				{
					"id": "amount",
					"name": "Value",
					"type": "number",
					"value": 10,
				},
			]
		},
		{
			"id": "setMind",
			"name": "Set Mind",
			"args": [
				{
					"id": "amount",
					"name": "Value",
					"type": "number",
					"value": 10,
				},
			]
		},
		{
			"id": "setLust",
			"name": "Set Lust",
			"args": [
				{
					"id": "amount",
					"name": "Value",
					"type": "number",
					"value": 10,
				},
			]
		},
	]

func doDebugAction(id, args = {}):
	#print(id, " ", args)
	if(id == "setAnger"):
		anger = args["amount"]
	if(id == "setAgility"):
		agility = args["amount"]
	if(id == "setMind"):
		mind = args["amount"]
	if(id == "setLust"):
		lust = args["amount"]
