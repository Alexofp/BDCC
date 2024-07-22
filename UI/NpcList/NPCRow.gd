extends PanelContainer

onready var _npcNameLabel = $HBoxContainer/Name
onready var _npcGenderLabel = $HBoxContainer/Gender
onready var _npcPersonalityLabel = $HBoxContainer/Personality
onready var _amountOfChildrenLabel = $HBoxContainer/Children
onready var meetButton = $HBoxContainer/CenterContainer2/Meet
onready var forgetButton = $HBoxContainer/CenterContainer/Forget
onready var showNpcButton = $ShowNPC
signal onForgetButtonPressed(npcID, name, node)
signal onMeetButtonPressed(npcID, occupation)
var _npcID setget setNpcID, getNpcID
var _npcOccupation: String
var _npcSubbyStatRaw: float
var _amountOfChildrenRaw: int


func initData(name, gender, subbyStat, ID, occupation, children, canForget=true, canMeet=true):
	_npcNameLabel.text = name
	_npcGenderLabel.text  = gender
	_npcPersonalityLabel.text  = PersonalityStat.getVisibleDesc(PersonalityStat.Subby, subbyStat)
	_npcSubbyStatRaw = subbyStat
	self._npcID = ID
	_npcOccupation = occupation
	_amountOfChildrenRaw = children
	_amountOfChildrenLabel.text  = str(children)
	forgetButton.disabled = !canForget
	meetButton.disabled = !canMeet


func setNpcID(ID: String):
	if(ID == ""):
		Log.error("Exception: attempt to set an empty character ID")
	else:
		_npcID = ID


func getNpcID():
	if(_npcID != null):
		return _npcID
	else: 
		Log.error("Exception: NPCRow: character ID was not set")


func getNpcName():
	return _npcNameLabel.text


func getNpcGender():
	return _npcGenderLabel.text


func getSubbyStatRaw() -> float:
	return _npcSubbyStatRaw


func getAmountOfChildren() -> int:
	return _amountOfChildrenRaw


func _on_Forget_pressed():
	if(_npcID == null):
		Log.error("Exception: Attempt to delete null character in the NPC list")
	else:
		emit_signal("onForgetButtonPressed", _npcID, getNpcName(), self)


func _on_ShowNPC_pressed():
	GM.ui.clearCharactersPanel()
	GM.main.playAnimation(StageScene.Duo, "stand", {npc=_npcID})
	
	var character = GlobalRegistry.getCharacter(_npcID)
	GM.ui.getCharactersPanel().addCharacter(_npcID)
	character.addEffect(StatusEffect.SexEngineLikes)
	character.addEffect(StatusEffect.SexEnginePersonality)
	GM.ui.updateCharactersInPanel()


func _on_Meet_pressed():
	emit_signal("onMeetButtonPressed", _npcID, _npcOccupation)
