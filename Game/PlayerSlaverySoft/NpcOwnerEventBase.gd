extends Reference
class_name NpcOwnerEventBase

const LOC_STOCKS = "main_punishment_spot"
const LOC_SLUTWALL = "fight_slutwall"

const C_PC = -1
const C_OWNER = -2
const C_EXTRA1 = 0
const C_EXTRA2 = 1
const C_EXTRA3 = 2
const C_EXTRA4 = 3

const AliasToRole = {
	"pc": C_PC,
	"npc": C_OWNER,
	"npc2": C_EXTRA1,
	"npc3": C_EXTRA2,
	"npc4": C_EXTRA3,
	"npc5": C_EXTRA4,
}
const RoleToAlias = {
	C_PC: "pc",
	C_OWNER: "npc",
	C_EXTRA1: "npc2",
	C_EXTRA2: "npc3",
	C_EXTRA3: "npc4",
	C_EXTRA4: "npc5",
}

var id:String = "error"
var state:String = "start"
var tag:String = ""

var roles:Dictionary = {} # indx -> char id

var runner:WeakRef

func involveCharID(_role:int, _charID:String):
	roles[_role] = _charID

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
	if(_actionID == "setState"):
		setState(_args[0])
		return [NpcOwnerActionType.NOTHING]
	if(_actionID == "endEvent"):
		endEvent(_args)
		return [NpcOwnerActionType.NOTHING]
	if(_actionID == "startFight"):
		return [NpcOwnerActionType.START_FIGHT, _args]
	if(_actionID == "startSex"):
		return [NpcOwnerActionType.START_SEX, _args]
	
	if(!has_method(state+"_do")):
		Log.printerr("Npc Event "+str(id)+" has no '_do()' function for the state '"+str(state)+"'!")
		return [NpcOwnerActionType.NOTHING]
	call(state+"_do", _actionID, _args)
	return [NpcOwnerActionType.NOTHING]

func reactEnded(_tag:String, _args:Array):
	if(has_method(state+"_eventResult")):
		call(state+"_eventResult", _tag, _args)

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
	npcOwner.addInfluence(_am)
	var newValue:float = npcOwner.getInfluence()
	if(_appendText):
		if(newValue > oldValue):
			sayAppend("[color=#00CC00](Influence increased)[/color]")
		if(newValue < oldValue):
			sayAppend("[color=red](Influence decreased)[/color]")

func addInfluenceObey():
	addInfluence(0.01)

func getInfluence() -> float:
	var npcOwner := getNpcOwner()
	if(!npcOwner):
		return 0.5
	return npcOwner.getInfluence()

func setLocation(_loc:String):
	GM.pc.setLocation(_loc)
	aimCamera(_loc)

func talk(_role:int, _text:String):
	saynn("[say="+convertRoleToAlias(_role)+"]"+_text+"[/say]")

func addButton(_name:String, _desc:String, _action:String, _args:Array = []):
	getRunner().addButton(self, _name, _desc, _action, _args)

func addContinue(_action:String, _args:Array = []):
	addButton("Continue", "See what happens next..", _action, _args)

func endEvent(_args:Array = []):
	getRunner().removeEndedEvent(self, _args)

func onlyOnce() -> bool: # Returns false if we're refreshing the same state
	return GM.main.shouldExecuteOnceCodeblocksRun()

func getNpcOwner() -> NpcOwnerBase:
	return getRunner().getNpcOwner()

func saveData() -> Dictionary:
	return {
		state = state,
		tag = tag,
		roles = roles,
	}

func loadData(_data:Dictionary):
	state = SAVE.loadVar(_data, "state", "start")
	tag = SAVE.loadVar(_data, "tag", "")
	roles = SAVE.loadVar(_data, "roles", {})
