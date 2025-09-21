extends Reference
class_name NpcOwnerEventRunner

var ownerID:String = ""

var eventStack:Array = []
var texts:Array = []
var buttons:Array = []

func setOwnerID(_charID:String):
	ownerID = _charID

func getOwnerID() -> String:
	return ownerID

func getNpcOwner() -> NpcOwnerBase:
	return GM.main.RS.getSpecialRelationship(ownerID)

func getAllInvolvedCharIDs() -> Array:
	if(eventStack.empty()):
		return []
	return eventStack.back().getAllInvolvedCharIDs()

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return ownerID
	if(eventStack.empty()):
		return
	return eventStack.back().resolveCustomCharacterName(_charID)

func runEvent(_id:String, _args:Array = [], _tag:String = ""):
	var theEvent = GlobalRegistry.createNpcOwnerEvent(_id)
	if(!theEvent):
		return
	eventStack.append(theEvent)
	theEvent.setEventRunner(self)
	theEvent.onStart(_args)

func removeEvent(_event):
	eventStack.erase(_event)

func removeEndedEvent(_event, _args:Array):
	var eventTag:String = _event.tag
	eventStack.erase(_event)
	if(!eventStack.empty()):
		var newCurrent = eventStack.back()
		newCurrent.reactEnded(eventTag, _args)

func getCurrentEvent():
	if(eventStack.empty()):
		return null
	return eventStack.back()

func run():
	texts.clear()
	buttons.clear()
	if(eventStack.empty()):
		Log.printerr("NO EVENTS IN THE EVENT RUNNER!")
		return
	getCurrentEvent().runCurrentState()

func saynn(_text:String):
	texts.append(_text)

func sayAppend(_text:String):
	if(texts.empty()):
		texts.append(_text)
	else:
		texts[texts.size()-1] += " "+_text

func addButton(_event, _name:String, _desc:String, _action:String, _args:Array = []):
	buttons.append([_name, _desc, _action, _args])

func getFinalText() -> String:
	return Util.join(texts, "\n\n")

func getFinalActions() -> Array:
	return buttons

func shouldEnd() -> bool:
	return eventStack.empty()

func doAction(_action:Array) -> Array:
	if(eventStack.empty()):
		Log.printerr("NO EVENTS IN THE EVENT RUNNER!")
		return [NpcOwnerActionType.NOTHING]
	return getCurrentEvent().doAction(_action[2], _action[3])

func notifyFightResult(_didWin:bool):
	getCurrentEvent().notifyFightResult(_didWin)

func notifySexResult(_sexResult:SexEngineResult):
	getCurrentEvent().notifySexResult(_sexResult)

func saveData() -> Dictionary:
	var eventsData:Array = []
	for event in eventStack:
		eventsData.append({
			id = event.id,
			data = event.saveData(),
		})
	
	return {
		ownerID = ownerID,
		eventStack = eventsData,
	}

func loadData(_data:Dictionary):
	ownerID = SAVE.loadVar(_data, "ownerID", "")
	
	eventStack.clear()
	var eventsData:Array = SAVE.loadVar(_data, "eventStack", [])
	for eventEntry in eventsData:
		var eventID:String = SAVE.loadVar(eventEntry, "id", "")
		var theEvent = GlobalRegistry.createNpcOwnerEvent(eventID)
		if(!theEvent):
			continue
		eventStack.append(theEvent)
		theEvent.setEventRunner(self)
		theEvent.loadData(SAVE.loadVar(eventEntry, "data", {}))
