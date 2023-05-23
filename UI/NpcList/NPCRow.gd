extends PanelContainer

onready var _npcNameLabel = $HBoxContainer/Name
onready var _npcGenderLabel = $HBoxContainer/Gender
onready var _npcPersonalityLabel = $HBoxContainer/Personality
onready var _amountOfChildrenLabel = $HBoxContainer/Children
onready var meetButton = $HBoxContainer/CenterContainer2/Meet
onready var forgetButton = $HBoxContainer/CenterContainer/Forget
onready var showNpcButton = $ShowNPC
signal onForgetButtonPressed(npcID)
var _npcID setget setNpcID, getNpcID
var _npcSubbyStatRaw: float
var _amountOfChildrenRaw: int

func initData(name, gender, subbyStat, ID, children):
	_npcNameLabel.text = name
	_npcGenderLabel.text  = gender
	_npcPersonalityLabel.text  = PersonalityStat.getVisibleDesc(PersonalityStat.Subby, subbyStat)
	_npcSubbyStatRaw = subbyStat
	self._npcID = ID
	_amountOfChildrenRaw = children
	_amountOfChildrenLabel.text  = str(children)


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
		emit_signal("onForgetButtonPressed", _npcID)
		queue_free()


func _on_ShowNPC_pressed():
	GM.main.playAnimation(StageScene.Duo, "stand", {npc=_npcID})
