extends Reference
class_name NpcOwnerEventBase

const LOC_STOCKS = "main_punishment_spot"
const LOC_SLUTWALL = "fight_slutwall"
const LOC_NEARCHECKPOINT = "hall_mainentrance"
const LOC_ELEVATOR = "hall_elevator"
const LOC_CELLBLOCK_MIDDLE = "cellblock_nearcells"
const LOC_CELLBLOCK_GENERAL = "cellblock_orange_nearcell"
const LOC_CELLBLOCK_HIGHSEC = "cellblock_red_nearcell"
const LOC_CELLBLOCK_LILAC = "cellblock_lilac_nearcell"
const LOC_MED_COUNTER = "med_lobbymain"
const LOC_BATHROOM1 = "main_bathroom1"
const LOC_BATHROOM2 = "main_bathroom2"

const LOCS_PARADE = ["main_punishment_spot", "main_hallroom1", "hall_canteen", "main_hallroom4", "main_hallroom8", "hall_ne_corner", "gym_nearbathroom", "yard_deadend1", "yard_deadend2", "yard_waterfall", "yard_vaulthere", "yard_firstroom", "med_lobbymain", "med_lobbyse", "eng_workshop", "main_shower1"]
const LOCS_YARD = ["gym_nearbathroom", "yard_deadend1", "yard_deadend2", "yard_waterfall", "yard_vaulthere", "yard_firstroom"]

const C_PC = -1
const C_OWNER = 0
const C_EXTRA1 = 1
const C_EXTRA2 = 2
const C_EXTRA3 = 3
const C_EXTRA4 = 4

const E_PUNISH = "punish"
const E_PARADE_TO = "paradeTo"

const AliasToRole = {
	"pc": C_PC,
	"npc": C_OWNER,
	"npc1": C_EXTRA1,
	"npc2": C_EXTRA2,
	"npc3": C_EXTRA3,
	"npc4": C_EXTRA4,
}
const RoleToAlias = {
	C_PC: "pc",
	C_OWNER: "npc",
	C_EXTRA1: "npc1",
	C_EXTRA2: "npc2",
	C_EXTRA3: "npc3",
	C_EXTRA4: "npc4",
}

var id:String = "error"
var reactsToTags:Array = []

var state:String = "start"
var tag:String = ""
var subResult:int = SUB_END

var roles:Dictionary = {} # indx -> char id

var pretext:String = ""

var runner:WeakRef

var eventWeight:float = 1.0 # no save
var eventMinLevel:int = 0 # no save
var cachedTarget:String = "" # no save
var cachedPath:Array = [] # no save

const SUB_END = 0
const SUB_CONTINUE = 1

func involveCharID(_role:int, _charID:String, satisfySocial:bool = true):
	roles[_role] = _charID
	if(_charID != "pc"):
		var thePawn:CharacterPawn = GM.main.IS.getPawn(_charID)
		if(!thePawn):
			var theChar:BaseCharacter = GlobalRegistry.getCharacter(_charID)
			if(!theChar || !theChar.isDynamicCharacter()):
				return
			thePawn = GM.main.IS.spawnPawnIfNeeded(_charID)
			
		if(thePawn):
			if(satisfySocial):
				thePawn.satisfySocial()
			thePawn.setLocation(GM.pc.getLocation())
			GM.main.IS.stopInteractionsForPawnID(_charID)
			GM.main.IS.startInteraction("InNpcOwnerEvent", {main=_charID})

func removeRole(_role:int):
	if(!roles.has(_role)):
		return
	roles.erase(_role)

func getRoleID(_role:int) -> String:
	if(_role == C_PC):
		return "pc"
	if(_role == C_OWNER):
		return getRunner().getOwnerID()
	if(!roles.has(_role)):
		Log.printerr("The npc owner event "+str(id)+" is using a role "+str(_role)+" that wasn't defined!")
		return ""
	return roles[_role]

func charID(_role:int) -> String:
	return getRoleID(_role)

func aimCamera(_loc:String):
	GM.main.aimCameraAndSetLocName(_loc)

func getChar(_role:int) -> BaseCharacter:
	return GlobalRegistry.getCharacter(getRoleID(_role))

func playAnimation(theSceneID, theActionID, args = {}):
	GM.main.playAnimation(theSceneID, theActionID, args)

func playStand(_roleNpc:int = C_OWNER, _rolePC:int=C_PC,_leashedBy:bool = false):
	var theNpc:String = getRoleID(_roleNpc)
	var thePC:String = getRoleID(_rolePC)
	if(!_leashedBy):
		GM.main.playAnimation(StageScene.Duo, "stand", {pc=thePC, npc=theNpc})
	else:
		GM.main.playAnimation(StageScene.Duo, "stand", {pc=thePC, npc=theNpc, bodyState={leashedBy=theNpc}})

func resolveCustomCharacterName(_charID):
	if(AliasToRole.has(_charID)):
		return getRoleID(AliasToRole[_charID])

func convertRoleToAlias(_role:int) -> String:
	if(RoleToAlias.has(_role)):
		return RoleToAlias[_role]
	Log.printerr("Wrong role: "+str(_role))
	return "npc"

func getOwnerID() -> String:
	return getRunner().getOwnerID()

func getOwner() -> BaseCharacter:
	return GlobalRegistry.getCharacter(getRunner().getOwnerID())

func getAllInvolvedCharIDs() -> Array:
	return [getRunner().getOwnerID()] + roles.values()

func setEventRunner(_eventRunner):
	if(!_eventRunner):
		runner = null
		return
	runner = weakref(_eventRunner)

func getRunner():
	if(!runner):
		return null
	return runner.get_ref()

func onStart(_args:Array):
	pass

func runEvent(_tag:String, _id:String, _args:Array = []):
	getRunner().runEvent(_id, _args, _tag)

func runCurrentState():
	if(!has_method(state)):
		Log.printerr("Npc Event "+str(id)+" has no state '"+str(state)+"'!")
		return
	call(state)

func doAction(_actionID:String, _args:Array) -> Array:
	var howMuchToPass := howMuchTimeToPass(_actionID, _args)
	if(_actionID == "setState"):
		setState(_args[0])
		return [NpcOwnerActionType.NOTHING, howMuchToPass]
	if(_actionID == "endEvent"):
		endEvent(_args)
		return [NpcOwnerActionType.NOTHING, howMuchToPass]
	if(_actionID == "startFight"):
		return [NpcOwnerActionType.START_FIGHT, _args]
	if(_actionID == "startSex"):
		return [NpcOwnerActionType.START_SEX, _args]
	
	var theDoState:String = getDoState()
	if(!has_method(theDoState+"_do")):
		Log.printerr("Npc Event "+str(id)+" has no '_do()' function for the state '"+str(state)+"'!")
		return [NpcOwnerActionType.NOTHING, howMuchToPass]
	call(theDoState+"_do", _actionID, _args)
	return [NpcOwnerActionType.NOTHING, howMuchToPass]

func getDoState() -> String:
	return state

func howMuchTimeToPass(_actionID:String, _args:Array) -> int:
	return 60

func reactEnded(_event, _tag:String, _args:Array):
	if(_event && _event.shouldEndParent()):
		endEvent()
		return
		
	if(has_method(state+"_eventResult")):
		call(state+"_eventResult", _event, _tag, _args)

func notifyFightResult(_didWin:bool):
	if(has_method(state+"_fightResult")):
		call(state+"_fightResult", _didWin)

func notifySexResult(_sexResult:SexEngineResult):
	if(has_method(state+"_sexResult")):
		call(state+"_sexResult", _sexResult)

func setState(_newState:String):
	state = _newState

func saynn(_text:String):
	getRunner().saynn(_text)

func sayAppend(_text:String):
	getRunner().sayAppend(_text)

func sayPretext():
	if(pretext.empty()):
		return
	saynn(pretext)

func addInfluence(_am:float, _appendText:bool = true):
	if(!onlyOnce()):
		return
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		if(_appendText):
			if(_am > 0.0):
				sayAppend("[color=#00CC00](Influence increased)[/color]")
			if(_am < 0.0):
				sayAppend("[color=red](Influence decreased)[/color]")
		return
	var oldValue:float = npcOwner.getInfluence()
	var oldLevel:int = npcOwner.getLevel()
	npcOwner.addInfluence(_am)
	var newLevel:int = npcOwner.getLevel()
	var newValue:float = npcOwner.getInfluence()
	if(_appendText && oldLevel == newLevel):
		if(newValue > oldValue):
			sayAppend("[color=#00CC00](Influence increased to "+str(Util.roundF(newValue*100.0, 1))+"%)[/color]")
		if(newValue < oldValue):
			if(newValue > 0.0):
				sayAppend("[color=red](Influence decreased to "+str(Util.roundF(newValue*100.0, 1))+"%)[/color]")
			else:
				sayAppend("[color=red](Influence decreased to "+str(Util.roundF(newValue*100.0, 1))+"%. The owner will lose their influence over you if you sleep)[/color]")

func addInfluenceObey(_mult:float = 1.0):
	addInfluence(0.33 * max(_mult, 0.0))

func addInfluenceResist(_mult:float = 1.0):
	addInfluence(-0.15 * max(_mult, 1.0))

func getInfluence() -> float:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return 0.5
	return npcOwner.getInfluence()

func setLocation(_loc:String):
	#GM.pc.setLocation(_loc)
	aimCamera(_loc)
	getRunner().setLocation(_loc)

func getLocation() -> String:
	return GM.pc.getLocation()

func canGetTo(theTarget:String) -> bool:
	if(theTarget == getLocation()):
		return true
	cachedTarget = theTarget
	cachedPath = GM.world.calculatePath(getLocation(), cachedTarget)
	if(cachedPath.size() <= 0):
		return false
	return true

func goTowards(theTarget:String, tpOnNoPath:bool = false):
	if(getLocation() == theTarget):
		cachedTarget = ""
		cachedPath = []
		return true
	
	if(cachedTarget != theTarget):
		cachedTarget = theTarget
		cachedPath = GM.world.calculatePath(getLocation(), cachedTarget)
		
		if(cachedPath.size() <= 0):
			if(tpOnNoPath):
				setLocation(theTarget)
				return true
			cachedTarget = ""
			return false
	
	if(cachedTarget == theTarget):
		if(cachedPath.size() > 1 && getLocation() == cachedPath[0]):
			setLocation(cachedPath[1])
			cachedPath.remove(0)
		else:
			cachedPath = GM.world.calculatePath(getLocation(), cachedTarget)
	
	if(getLocation() == theTarget):
		cachedTarget = ""
		cachedPath = []
		return true
	return false

func getPawnsNear(maxDepth:int, maxDist:float=-1.0) -> Array:
	return GM.main.IS.getPawnsNear(GM.pc.getLocation(), maxDepth, maxDist)

func getPawnIDsNear(maxDepth:int, maxDist:float=-1.0) -> Array:
	return GM.main.IS.getPawnIDsNear(GM.pc.getLocation(), maxDepth, maxDist)

func getFreePawnsNear(maxDepth:int, maxDist:float=-1.0, minSocial:float = 0.5) -> Array:
	var result:Array = []
	var thePawns := getPawnsNear(maxDepth, maxDist)
	for thePawn in thePawns:
		if(!thePawn.canInterrupt()):
			continue
		if(thePawn.getSocial() < minSocial):
			continue
		result.append(thePawn)
	return result

func talk(_role:int, _text:String):
	saynn("[say="+convertRoleToAlias(_role)+"]"+_text+"[/say]")

func talkOwner(_text:String):
	talk(C_OWNER, _text)

func talkPC(_text:String):
	talk(C_PC, _text)

func addButton(_name:String, _desc:String, _action:String, _args:Array = []):
	getRunner().addButton(self, _name, _desc, _action, _args)

func addDisabledButton(_name:String, _desc:String):
	getRunner().addDisabledButton(self, _name, _desc)

func addButtonAt(_indx:int, _name:String, _desc:String, _action:String, _args:Array = []):
	getRunner().addButtonAt(self, _indx, _name, _desc, _action, _args)

func addDisabledButtonAt(_indx:int, _name:String, _desc:String):
	getRunner().addDisabledButtonAt(self, _indx, _name, _desc)

func addContinue(_action:String, _args:Array = []):
	addButton("Continue", "See what happens next..", _action, _args)

func endEvent(_args:Array = []):
	getRunner().removeEndedEvent(self, _args)

func onlyOnce() -> bool: # Returns false if we're refreshing the same state
	return GM.main.shouldExecuteOnceCodeblocksRun()

func getNpcOwner() -> NpcOwnerBase:
	return getRunner().getNpcOwner()

func getSubEventScore(_event, _tag:String, _args:Array) -> float:
	var theLevel:int = _event.getNpcOwner().getLevel()
	if(theLevel < eventMinLevel):
		return 0.0
	return eventWeight

func trySubEventStart(_event, _tag:String, _args:Array) -> bool:
	return true

func involveOwner():
	involveCharID(C_OWNER, getOwnerID())

func checkSubEvent(_tag:String, _pretext:String, _args:Array) -> bool:
	var eventIDsWithTag:Array = GlobalRegistry.getNpcOwnerEventIDsByTag(_tag)
	if(eventIDsWithTag.empty()):
		return false
	
	var possible:Array = []
	#var totalScore:float = 0.0
	for eventID in eventIDsWithTag:
		var theEvent = GlobalRegistry.createNpcOwnerEvent(eventID)
		var theScore:float = theEvent.getSubEventScore(self, _tag, _args)
		if(theScore <= 0.0 || !RNG.chance(theScore*100.0)):
			continue
		possible.append([theEvent, theScore])
		#totalScore += theScore
	
	#if(totalScore < 1.0 && !RNG.chance(totalScore*100.0)):
	#	return false
	
	while(!possible.empty()):
		var someEvent = RNG.grabWeightedPairs(possible)
		someEvent.setEventRunner(getRunner())
		someEvent.tag = _tag
		someEvent.pretext = _pretext
		if(someEvent.trySubEventStart(self, _tag, _args)):
			getRunner().eventStack.append(someEvent)
			someEvent.involveOwner()
			return true
		
	return false

func setSubResult(_r:int):
	subResult = _r

func getSubResult() -> int:
	return subResult

func shouldEndParent() -> bool:
	return subResult == SUB_END

func stopRunner():
	getRunner().stopRunner()

func getRolePawn(_role:int) -> CharacterPawn:
	var theCharID:String = getRoleID(_role)
	var thePawn := GM.main.IS.getPawn(theCharID)
	if(thePawn):
		return thePawn
	return null

func makeRoleExhausted(role:int):
	var pawn = getRolePawn(role)
	if(pawn == null):
		return
	pawn.makeExhausted()

func runResist():
	runEvent("resist", "ResistGeneric")

func runPunishment():
	runEvent("punishment", "Punish")

func runParadeTo(_loc:String):
	runEvent("paradeTo", "ParadeTo", [_loc])

func runNpcFight(_char1:String, _char2:String):
	runEvent("npcFight", "NpcFight", [_char1, _char2])

func getDebugActions():
	return [
		{
			"id": "setLevel",
			"name": "Set level",
			"args": [
				{
					"id": "level",
					"name": "Level",
					"type": "number",
					"value": 3,
				},
			],
		},
		{
			"id": "addInfluence",
			"name": "Add influence",
			"args": [
				{
					"id": "howMuch",
					"name": "How much",
					"type": "number",
					"value": 50,
				},
			],
		},
		{
			"id": "resetPunish",
			"name": "Reset punishment counter",
			"args": [
			],
		},
		{
			"id": "endEvent",
			"name": "End event",
			"args": [
			],
		},
		{
			"id": "stopSoftSlavery",
			"name": "Stop soft slavery",
			"args": [
			],
		},
	]

func doDebugAction(_id, _args = {}):
	if(_id == "setLevel"):
		var theNpcOwner := getNpcOwner()
		if(theNpcOwner):
			theNpcOwner.setLevel(_args["level"])
	if(_id == "addInfluence"):
		var theNpcOwner := getNpcOwner()
		if(theNpcOwner):
			theNpcOwner.addInfluence(float(_args["howMuch"])/100.0)
	if(_id == "resetPunish"):
		var theNpcOwner := getNpcOwner()
		if(theNpcOwner):
			theNpcOwner.punishAmount = 0
		GM.main.addMessage("Punishment counter reset to 0")
	if(_id == "stopSoftSlavery"):
		var theNpcOwner := getNpcOwner()
		if(theNpcOwner):
			theNpcOwner.endSlavery()
		stopRunner()
	if(_id == "endEvent"):
		stopRunner()
	pass

func isPlayerOnALeash() -> bool:
	return false

func saveData() -> Dictionary:
	return {
		state = state,
		tag = tag,
		roles = roles,
		subResult = subResult,
	}

func loadData(_data:Dictionary):
	state = SAVE.loadVar(_data, "state", "start")
	tag = SAVE.loadVar(_data, "tag", "")
	roles = SAVE.loadVar(_data, "roles", {})
	subResult = SAVE.loadVar(_data, "subResult", 0)
