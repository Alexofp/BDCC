extends Reference
class_name SexToyGameplay

# Contains all of the triggers and stuff

var triggers:Dictionary = {} # trigger indx = 
var inGame:bool = false

func sendSexEvent(_event:SexEvent):
	var _type:String = _event.getType()
	var _isTargetPC:bool = (_event.getTargetCharID() == "pc")
	var _isActorPC:bool = (_event.getSourceCharID() == "pc")
	
	if(_type == SexEvent.Orgasmed && _isTargetPC):
		sendTrigger(SexToyTrigger.OnOrgasm)

func sendTrigger(_triggerID:int, _args:Array = []):
	if(!triggers.has(_triggerID)):
		return
	var theTrigger:SexToyTriggerEntry = triggers[_triggerID]
	theTrigger.trigger(_args)

func processGameplay(_dt:float):
	if((GM.pc && is_instance_valid(GM.pc)) && !inGame):
		#Log.print("IN GAMEEEE")
		inGame = true
	elif((!GM.pc || !is_instance_valid(GM.pc)) && inGame):
		#Log.print("NO LONGER IN GAME!!!")
		inGame = false
		stopAllPassiveTriggers()
		return
	if(!inGame):
		return
	
	var _pc:Player = GM.pc
	setPassive(SexToyTrigger.Lust, _pc.getLustLevel())
	setPassive(SexToyTrigger.Pain, _pc.getPainLevel())
	setPassive(SexToyTrigger.Arousal, _pc.getArousal())
	setPassive(SexToyTrigger.Stamina, 1.0-_pc.getStaminaLevel())
	
func setPassive(_trigger:int, _value:float):
	if(!triggers.has(_trigger)):
		return
	triggers[_trigger].triggerPassive(clamp(_value, 0.0, 1.0))

func stopAllPassiveTriggers():
	for triggerID in SexToyTrigger.TOTAL_AMOUNT:
		if(!SexToyTrigger.isPassive(triggerID)):
			return # We assume that all passive triggers are at the start
		setPassive(triggerID, 0.0)

func checkForRemovedTriggers():
	for triggerID in triggers.keys():
		if(triggers[triggerID].shouldBeRemoved()):
			triggers.erase(triggerID)

func getTrigger(_id:int) -> SexToyTriggerEntry:
	if(_id < 0 || _id >= SexToyTrigger.TOTAL_AMOUNT):
		return null
	if(!triggers.has(_id)):
		var newTrigger := SexToyTriggerEntry.new()
		newTrigger.type = _id
		triggers[_id] = newTrigger
	return triggers[_id]

func saveData() -> Dictionary:
	var triggersData:Array = []
	for triggerID in triggers:
		if(triggers[triggerID].shouldBeRemoved()):
			continue
		triggersData.append(triggers[triggerID].saveData())
	
	return {
		triggers = triggersData,
	}

func loadData(_data:Dictionary):
	triggers.clear()
	
	var triggersData:Array = SAVE.loadVar(_data, "triggers", [])
	for triggerEntry in triggersData:
		var newTriggerEntry := SexToyTriggerEntry.new()
		newTriggerEntry.loadData(triggerEntry)
		if(newTriggerEntry.type < 0 || newTriggerEntry.type >= SexToyTrigger.TOTAL_AMOUNT):
			continue
		triggers[newTriggerEntry.type] = newTriggerEntry
	
