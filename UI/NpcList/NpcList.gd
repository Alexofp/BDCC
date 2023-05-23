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


func addRow(name: String, gender: String, subbyStat: float, ID: String, children: int = 0):
	var newRow = npcRow.instance()
	container.add_child(newRow)
	newRow.init(name, gender, subbyStat, ID, children)
	newRow.connect("onForgetButtonPressed", self, "forgetNPC")

# add pop-up confirmation window
func forgetNPC(ID):
	GM.main.removeDynamicCharacter(ID)


func _on_Name_pressed():
	nameButton.pressed = true
	genderButton.pressed = false
	personalityButton.pressed = false
	childrenButton.pressed = false
	
	var nodesSortedArr = container.get_children()
	
	if(_nameBtnState):
		nodesSortedArr.sort_custom(self, "sortNameAscending")
	else:
		nodesSortedArr.sort_custom(self, "sortNameAscending")
		nodesSortedArr.invert()
		
	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)
	
	_nameBtnState = !_nameBtnState


func sortNameAscending(a: Node, b: Node):
	return a.getNpcName().naturalnocasecmp_to(b.getNpcName()) < 0


func _on_Gender_pressed():
	nameButton.pressed = false
	genderButton.pressed = true
	personalityButton.pressed = false
	childrenButton.pressed = false
	
	var nodesSortedArr = container.get_children()
	
	if(_genderBtnState):
		nodesSortedArr.sort_custom(self, "sortGenderAscending")
	else:
		nodesSortedArr.sort_custom(self, "sortGenderAscending")
		nodesSortedArr.invert()
		
	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)
	
	_genderBtnState = !_genderBtnState


func sortGenderAscending(a: Node, b: Node):
	return a.getNpcGender().naturalnocasecmp_to(b.getNpcGender()) < 0


func _on_Personality_pressed():
	nameButton.pressed = false
	genderButton.pressed = false
	personalityButton.pressed = true
	childrenButton.pressed = false
	
	var nodesSortedArr = container.get_children()
	
	if(_personalityBtnState):
		nodesSortedArr.sort_custom(self, "sortPersonalityAscending")
	else:
		nodesSortedArr.sort_custom(self, "sortPersonalityAscending")
		nodesSortedArr.invert()
		
	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)
	
	_personalityBtnState = !_personalityBtnState


func sortPersonalityAscending(a: Node, b: Node):
	return a.getSubbyStatRaw() < b.getSubbyStatRaw()


func _on_ChildrenAmount_pressed():
	nameButton.pressed = false
	genderButton.pressed = false
	personalityButton.pressed = false
	childrenButton.pressed = true
	
	var nodesSortedArr = container.get_children()
	
	if(_childrenBtnState):
		nodesSortedArr.sort_custom(self, "sortChildrenAmountAscending")
	else:
		nodesSortedArr.sort_custom(self, "sortChildrenAmountAscending")
		nodesSortedArr.invert()
		
	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)
	
	_childrenBtnState = !_childrenBtnState


func sortChildrenAmountAscending(a: Node, b: Node):
	return a.getAmountOfChildren() < b.getAmountOfChildren()


func _notification(what):
	if(what == NOTIFICATION_PREDELETE && GM.main != null):
		GM.main.playAnimation(StageScene.Solo, "stand", {npc=GM.pc})
