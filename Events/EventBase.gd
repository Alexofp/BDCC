extends Reference
class_name EventBase

var id = "badevent"

func _init():
	pass

func registerTriggers(_es):
	pass

func react(_triggerID, _args):
	pass
	
func run(_triggerID, _args):
	pass

func getPriority():
	return 10

func onButton(_method, _args):
	pass

func eventCheck(_checkID, _args = []):
	return null

func doEventCheck(_checkID, _args = []):
	if(GM.ES):
		return GM.ES.eventCheck(_checkID, _args)

func checkCharacterBusy(_checkID, messageifbusy, characterName = ""):
	var checkData = doEventCheck(_checkID)
	if(checkData == null):
		return false
	
	if(checkData is Dictionary && checkData.has("text")):
		saynn(checkData["text"])
	else:
		saynn(messageifbusy)
	if(characterName != ""):
		addDisabledButton(characterName, "They are not here")
	return true

func runScene(sceneid: String, args = [], tag = ""):
	var scene = GM.main.runScene(sceneid, args)
	scene.sceneTag = tag

func say(_text: String):
	if(GM.ui):
		GM.ui.say(_text)

func sayn(_text: String):
	say(_text+"\n")

func saynn(_text: String):
	say(_text+"\n\n")

func addButton(text: String, tooltip: String = "", method: String = "", args = []):
	GM.ui.addButton(text, tooltip, "EVENTSYSTEM_BUTTON", [self, method, args])

func addDisabledButton(text: String, tooltip: String = ""):
	GM.ui.addDisabledButton(text, tooltip)

func addButtonUnlessLate(text: String, tooltip: String = "", method: String = "", args = [], latetext: String = "It's way too late for that"):
	if(GM.main.isVeryLate()):
		addDisabledButton(text, latetext)
	else:
		addButton(text, tooltip, method, args)
	
func addButtonWithChecks(text: String, tooltip: String, method: String, args, checks: Array):
	var badCheck = ButtonChecks.check(checks)
	if(badCheck == null):
		addButton(text, ButtonChecks.getPrefix(checks) + tooltip, method, args)
	else:
		addDisabledButton(text, ButtonChecks.getReasonText(badCheck))

func setFlag(flagID, value):
	GM.main.setFlag(flagID, value)

func getFlag(flagID, defaultValue = null):
	return GM.main.getFlag(flagID, defaultValue)

func increaseFlag(flagID, addvalue = 1):
	GM.main.increaseFlag(flagID, addvalue)

func setModuleFlag(moduleID, flagID, value):
	GM.main.setModuleFlag(moduleID, flagID, value)

func increaseModuleFlag(moduleID, flagID, addvalue = 1):
	GM.main.increaseModuleFlag(moduleID, flagID, addvalue)

func getModuleFlag(moduleID, flagID, defaultValue = null):
	return GM.main.getModuleFlag(moduleID, flagID, defaultValue)

func npcSatisfiesCondition(character:BaseCharacter, conInfo):
	return NpcFinder.npcSatisfiesCondition(character, conInfo)

func grabNpcIDFromPool(poolID, _conditions = []):
	return NpcFinder.grabNpcIDFromPool(poolID, _conditions)

func generateNpcForPool(poolID, generator, _args = {}):
	return NpcFinder.generateNpcForPool(poolID, generator, _args)

func grabNpcIDFromPoolOrGenerate(poolID, _conditions, generator, _args = {}, preferOld = false):
	return NpcFinder.grabNpcIDFromPoolOrGenerate(poolID, _conditions, generator, _args, preferOld)
	
func getCharacter(charID: String) -> BaseCharacter:
	return GlobalRegistry.getCharacter(charID)

func getModule(modID: String):
	return GlobalRegistry.getModule(modID)
	
func addMessage(theMessage: String):
	GM.main.addMessage(theMessage)

func addExperienceToPlayer(ex: int, showMessage: bool = true):
	if(showMessage):
		addMessage("You received "+str(ex)+" experience")
	GM.pc.addExperience(ex)
