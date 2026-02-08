extends PlayerSlaveryBase
class_name PlayerSlaveryTentacles

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
	for entry in getDebugStages():
		_scene.addButton(entry[1], "SKIP TO THIS STAGE", "skipStage", [entry[0]])
func doSkipAction(_stage:int):
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

var daysNormal:int = 0

var didRubLustEvent:bool = false

var flagInjectForced:bool = false # Was the inject ending forced because the pc has run out of time

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
	"Tentacles",
	"Monster",
	"Sprout",
	"Viney",
	"Bloom",
	"Twine",
	"Gropey",
	"Hugs",
	"Snugglethorn",
	"Knotweed",
	"Beast",
	"N'Gorroth",
	"Whispers",
]

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
	if(isSmallOrNormal()):
		Ar.append("eventNeed: "+str(eventNeed))
		Ar.append("anger: "+str(anger))
		Ar.append("agility: "+str(agility))
		Ar.append("mind: "+str(mind))
		Ar.append("lust: "+str(lust))
	
	if(_loc == LOC_IMPORTANT):
		Ar.append("Test test TEST TEST") #TODO: REMOVE BEFORE SHIP
	
	return Util.join(Ar, "\n")

func action(_name:String, _desc:String, _sceneID:String, _args:Array = []):
	return [_name, _desc, _sceneID, _args]

func getActions(_loc:String) -> Array:
	var theActions:Array = []
	
	if(isSmallOrNormal()):
		if(eventScene != ""):
			if(eventTarget == monsterLoc && _loc == eventTarget):
				theActions.append(action("Monster", "See what's up", "doEvent"))
	
	#if(_loc == LOC_IMPORTANT):
	#	theActions.append(action("MEOW", "TEST ACTION", "MeScene"))
	if(_loc == LOC_BED && growStage == STAGE_EGG):
		theActions.append(action("Rest", "Get some rest", "PSTentacles1EggInteract"))
	if(_loc == LOC_BED && growStage == STAGE_TINY):
		theActions.append(action("Rest", "Get some rest", "PSTentacles2SmallInteract"))
	if(_loc == LOC_BED && growStage == STAGE_TINY_AFTERTEST):
		theActions.append(action("Sleep", "Get some rest", "PSTentaclesTinySleep"))
	if(_loc == LOC_FRIDGE):
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
		GM.main.processTime(60*60)
		return
	GM.main.runScene(_action[2], _action[3])

func checkEvent(_scene, _loc:String) -> Array:
	if(growStage == STAGE_SMALL):
		if(GM.main.getTime() > 20*60*60):
			return ["PSTentaclesSmallEndOfDay"]
	
	if(growStage == STAGE_NORMAL):
		if(GM.main.getTime() > 20*60*60):
			if(daysNormal >= 1):
				return ["PSTentaclesEndingScene"]
			return ["PSTentaclesNormalSleep"]
	
	if(isSmallOrNormal() && isAngry):
		if(_loc == monsterLoc):
			isAngry = false
			incStat(STAT_ANGER)
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

func getPossibleEvents() -> Array:
	var possible:Array = []
	var weights:Array = []
	
	possible.append([EVENT_WINDOW, LOC_WINDOW, "PSTentaclesWindowSmall", [], "didn't spend time with it"])
	weights.append(1.0)
	possible.append([EVENT_HUNGRY, LOC_FRIDGE, "PSTentaclesFeedSmall", [], "didn't feed it"])
	weights.append(1.0)
	possible.append([EVENT_LEWD, "pc", "PSTentaclesLewdSmall", [], "didn't play with it"])
	weights.append(1.0)
	possible.append([EVENT_PLAY, LOC_IMPORTANT, "PSTentaclesPlaySmall", [], "didn't play with it"])
	weights.append(1.0)
	
	var thePS:int = possible.size()
	for _i in range(thePS):
		var _indx:int = thePS - 1 - _i
		if(possible[_indx][0] == lastEventType):
			possible.erase(_indx)
			weights.erase(_indx)
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
			if(eventNeed >= 7 && RNG.chance(10 + (eventNeed-7)*10 )):
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
					#incStat(STAT_ANGER) #TODO: Replace with scene
			else:
				monsterLoc = goToSlow(monsterLoc, eventTarget)
		elif(monsterLoc == monsterTarget):
			#TODO: Better locs?
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

#TODO: Change showMessage to false before ship
func incStat(_statID:int, showMessage:bool = true) -> bool:
	if(_statID <= 0):
		return false
	var theStat := getStat(_statID)
	var theOldStat := theStat
	theStat += 1
	if(theStat < 0):
		theStat = 0
	if(growStage <= STAGE_NORMAL):
		if(theStat > 5):
			theStat = 5
	setStat(_statID, theStat)
	if(theStat == theOldStat):
		return false
	
	if(showMessage):
		GM.main.addMessage(getMonsterName()+"'s "+getStatName(_statID)+" got increased!")
	
	return true

func train(_statID:int, _passTime:bool = true) -> bool:
	return incStat(_statID)

func trainNothing() -> bool:
	return true

func getTentaclesCharID() -> String:
	return "psplantTentacles"
func getScientist1CharID() -> String:
	return "nova"
func getScientist2CharID() -> String:
	return "risha"

func setEvent(_eventType:int, _targetLoc:String, _scene:String, _args:Array = []):
	lastEventType = _eventType
	eventTarget = _targetLoc
	eventScene = _scene
	eventArgs = _args
	eventGiveupTimer = 0

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
	_text = Util.shuffleWordLetters(_text, 50.0)
	_text = Util.replaceLettersRandomly(_text, 20.0)
	return _text

func talk(_text:String):
	if(mind < 5):
		return
	var _scene:SceneBase = GM.main.getCurrentScene()
	#TODO: Hide/scamble depending on mind value
	
	# 1-6 GIBBERISH
	# 7 - Rare
	# 8 - Very rare
	# 9-10 - perfect
	
	var _theText:String = processTalkText(_text)
	if(_theText.empty()):
		return
	_scene.saynn("[say="+getTentaclesCharID()+"]"+_text+"[/say]")

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

func saveData() -> Dictionary:
	return {}

func loadData(_data:Dictionary):
	
	createIcons()
	prepareForSex()
	pass
