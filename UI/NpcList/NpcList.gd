extends Control

onready var npcRow = load("res://UI/NpcList/NPCRow.tscn")
onready var container = $PanelContainer/VBoxC/ScrollC/VboxC2
onready var nameButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Name
onready var genderButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Gender
onready var personalityButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Personality
onready var childrenButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/ChildrenAmount
var _nameBtnState: bool = true
var _genderBtnState: bool = true
var _personalityBtnState: bool = true
var _childrenBtnState: bool = true


func addRow(name: String, gender: String, subbyStat: float, ID: String, occupation: String, children: int = 0):
	var newRow = npcRow.instance()
	container.add_child(newRow)
	newRow.initData(name, gender, subbyStat, ID, occupation, children)
	newRow.connect("onForgetButtonPressed", self, "forgetNPC")
	newRow.connect("onMeetButtonPressed", self, "meetNPC")
	
# add pop-up confirmation window
func forgetNPC(ID):
	GM.main.removeDynamicCharacter(ID)


func meetNPC(ID, occupation):
	var room = GM.world.getRoomByID(GM.pc.getLocation())
	match occupation:
		"Inmates": 
			if(WorldPopulation.Inmates in GM.pc.getLocationPopulation()):
			#if(!room.loctag_GuardsEncounter && !room.loctag_Greenhouses && !room.loctag_EngineersEncounter && !room.loctag_MentalWard):
				GM.main.runScene("InmateExposureForcedSexScene", [ID])
			else:
				print("No inmate here")
		"Guards":
			if(WorldPopulation.Guards in GM.pc.getLocationPopulation()):
			#if(room.loctag_GuardsEncounter || room.loctag_Greenhouses):
				GM.main.runScene("GuardCaughtOfflimitsScene", [ID])
			else:
				print("No guard here")
		"Engineers":
			if(room.loctag_EngineersEncounter):
				GM.main.runScene("EngineerCaughtOfflimitsScene", ID)
			else:
				print("No engi here")
		"Nurses":
			if(room.loctag_MentalWard):
				GM.main.runScene("NurseCaughtOfflimitsScene", ID)
			else:
				print("No nurses here")


func sendPopupMessage(_msgText: String = "", _isConfirmWindow: bool = false):
	pass


func _on_Name_pressed():
	unpressAllButtons()
	nameButton.pressed = true
	
	var nodesSortedArr = container.get_children()
	
	if(_nameBtnState):
		nodesSortedArr.sort_custom(self, "sortNameAscending")
	else:
		nodesSortedArr.sort_custom(self, "sortNameDescending")
		
	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)
	
	_nameBtnState = !_nameBtnState


func sortNameAscending(a: Node, b: Node):
	return a.getNpcName().naturalnocasecmp_to(b.getNpcName()) < 0


func sortNameDescending(a: Node, b: Node):
	return a.getNpcName().naturalnocasecmp_to(b.getNpcName()) > 0


func _on_Gender_pressed():
	unpressAllButtons()
	genderButton.pressed = true
	
	var nodesSortedArr = container.get_children()
	
	if(_genderBtnState):
		nodesSortedArr.sort_custom(self, "sortGenderAscending")
	else:
		nodesSortedArr.sort_custom(self, "sortGenderDescending")
		
	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)
	
	_genderBtnState = !_genderBtnState


func sortGenderAscending(a: Node, b: Node):
	return a.getNpcGender().naturalnocasecmp_to(b.getNpcGender()) < 0
	
	
func sortGenderDescending(a: Node, b: Node):
	return a.getNpcGender().naturalnocasecmp_to(b.getNpcGender()) > 0


func _on_Personality_pressed():
	unpressAllButtons()
	personalityButton.pressed = true
	
	var nodesSortedArr = container.get_children()
	
	if(_personalityBtnState):
		nodesSortedArr.sort_custom(self, "sortPersonalityAscending")
	else:
		nodesSortedArr.sort_custom(self, "sortPersonalityDescending")
		
	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)
	
	_personalityBtnState = !_personalityBtnState


func sortPersonalityAscending(a: Node, b: Node):
	return a.getSubbyStatRaw() < b.getSubbyStatRaw()
	
	
func sortPersonalityDescending(a: Node, b: Node):
	return a.getSubbyStatRaw() > b.getSubbyStatRaw()


func _on_ChildrenAmount_pressed():
	unpressAllButtons()
	childrenButton.pressed = true
	
	var nodesSortedArr = container.get_children()
	
	if(_childrenBtnState):
		nodesSortedArr.sort_custom(self, "sortChildrenAmountAscending")
	else:
		nodesSortedArr.sort_custom(self, "sortChildrenAmountDescending")
		
	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)
	
	_childrenBtnState = !_childrenBtnState


func sortChildrenAmountAscending(a: Node, b: Node):
	return a.getAmountOfChildren() < b.getAmountOfChildren()
	
	
func sortChildrenAmountDescending(a: Node, b: Node):
	return a.getAmountOfChildren() > b.getAmountOfChildren()


func unpressAllButtons():
	nameButton.pressed = false
	genderButton.pressed = false
	personalityButton.pressed = false
	childrenButton.pressed = false


func _notification(what): # Destructor, works fine do not touch
	if(what == NOTIFICATION_PREDELETE && GM.main != null):
		GM.main.playAnimation(StageScene.Solo, "stand", {npc=GM.pc})
