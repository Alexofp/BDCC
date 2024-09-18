extends Control

onready var npcRow = load("res://UI/NpcList/NPCRow.tscn")
onready var container = $PanelContainer/VBoxC/ScrollC/VboxC2
onready var nameButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Name
onready var genderButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Gender
onready var personalityButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Personality
onready var childrenButton = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/ChildrenAmount
onready var popupWindow = $CenterContainer/Notification
onready var popupWindowLabel = $CenterContainer/Notification/NotificationLabel
onready var popupForgetButton = $CenterContainer/Notification/HBoxC/Forget
onready var popupOkButton = $CenterContainer/Notification/HBoxC/Ok
onready var popupCancelButton = $CenterContainer/Notification/HBoxC/Cancel
onready var relationship = $PanelContainer/VBoxC/UpperPanel/HBoxContainer/Relationship

var _nameBtnState: bool = true
var _genderBtnState: bool = true
var _personalityBtnState: bool = true
var _childrenBtnState: bool = true
var _IDtoForget
var nodeToFree
signal onMeetNpcButton(ID, occupation)

func addRow(name: String, gender: String, subbyStat: float, ID: String, occupation: String, children: int = 0, canForget: bool = true, canMeet: bool = true):
	var newRow = npcRow.instance()
	container.add_child(newRow)
	newRow.initData(name, gender, subbyStat, ID, occupation, children, canForget, canMeet)
	newRow.setRelationShipData(GM.main.RS.getAffection("pc", ID), GM.main.RS.getLust("pc", ID))
	newRow.connect("onForgetButtonPressed", self, "forgetNPC")
	newRow.connect("onMeetButtonPressed", self, "meetNPC")
	

var showedForgetPopup = false
func forgetNPC(ID, name, node):
	_IDtoForget = ID
	nodeToFree = node
	if(showedForgetPopup):
		_on_Forget_pressed()
		return
	sendPopupMessage("Are you sure you want to forget "+name+"? This will permanently remove "+name+" from the game. Keep in mind that if this character is pregnant, their pregnancy will be forgotten too. But any kids you had together will stay.", true)
	showedForgetPopup = true

func _on_Forget_pressed():
	GM.ui.clearCharactersPanel()
	nodeToFree.queue_free()
	nodeToFree = null
	GM.main.removeDynamicCharacter(_IDtoForget)
	resetNotificationWindow()


func _on_Cancel_pressed():
	resetNotificationWindow()


func meetNPC(ID, occupation):
	emit_signal("onMeetNpcButton", ID, occupation)


func sendPopupMessage(msgText: String = "", isForgetWindow: bool = false):
	if(isForgetWindow):
		popupForgetButton.visible = true
		popupCancelButton.visible = true
		popupWindowLabel.text = msgText
		popupWindow.popup_centered_ratio(0.3)
	else:
		popupOkButton.visible = true
		popupWindowLabel.text = msgText
		popupWindow.popup_centered_ratio(0.3)


func _on_Ok_pressed():
	resetNotificationWindow()


func resetNotificationWindow():
	popupForgetButton.visible = false
	popupOkButton.visible = false
	popupCancelButton.visible = false
	popupWindow.visible = false


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
	relationship.pressed = false


func _on_Relationship_pressed():
	unpressAllButtons()
	relationship.pressed = true
	
	var nodesSortedArr = container.get_children()
	
	if(_childrenBtnState):
		nodesSortedArr.sort_custom(self, "sortRelationship")
	else:
		nodesSortedArr.sort_custom(self, "sortRelationshipDescending")
		
	for nodeNum in nodesSortedArr.size():
		container.move_child(nodesSortedArr[nodeNum], nodeNum)
	
	_childrenBtnState = !_childrenBtnState

func sortRelationship(a: Node, b: Node):
	return a.affection < b.affection
	
	
func sortRelationshipDescending(a: Node, b: Node):
	return a.affection > b.affection
