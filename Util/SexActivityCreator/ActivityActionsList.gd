extends VBoxContainer

var options = []
onready var optionList = $HBoxContainer/OptionButton
onready var actionList = $ScrollContainer/ActionList

signal onAddButton(what)
export var labelText = "Some text"
export var smallContainer = false

signal onEditPressed(id)
signal onUpPressed(id)
signal onDownPressed(id)
signal onDeletePressed(id)

var actions = []
var actionObjects = null

var actionItemScene = preload("res://Util/SexActivityCreator/ActivityAcitonItem.tscn")

func _ready():
	setText(labelText)
	if(smallContainer):
		$ScrollContainer.rect_min_size.y = 100
	else:
		$ScrollContainer.rect_min_size.y = 200

func addOption(id, text):
	options.append([id, text])
	optionList.add_item(text)
	
	if(optionList.selected < 0):
		optionList.selected = 0

func _on_AddButton_pressed():
	if(optionList.selected < 0 || options.size() <= 0):
		return
		
	emit_signal("onAddButton", options[optionList.selected][0])

func setText(theText):
	$HBoxContainer/Label.text = theText

func clearActions():
	actions.clear()
	updateActions()

func addAction(id, text):
	actions.append([id, text])
	updateActions()

func updateActions():
	Util.delete_children(actionList)
	
	if(actionObjects != null):
		var actionIndex = 0
		actions.clear()
		for action in actionObjects:
			actions.append([actionIndex, action.getVisibleText()])
			
			actionIndex += 1
	
	for action in actions:
		var newItem = actionItemScene.instance()
		actionList.add_child(newItem)
		newItem.setText(action[1])
		newItem.id = action[0]

		newItem.connect("onEditButton", self, "onActionEditPressed")
		newItem.connect("onUpButton", self, "onActionUpPressed")
		newItem.connect("onDownButton", self, "onActionDownPressed")
		newItem.connect("onDeleteButton", self, "onActionDeletePressed")

func onActionEditPressed(id, _data):
	emit_signal("onEditPressed", id)
func onActionUpPressed(id, _data):
	if(actionObjects != null):
		Util.moveValueUp(actionObjects, id)
		updateActions()
	emit_signal("onUpPressed", id)
func onActionDownPressed(id, _data):
	if(actionObjects != null):
		Util.moveValueDown(actionObjects, id)
		updateActions()
	emit_signal("onDownPressed", id)
func onActionDeletePressed(id, _data):
	if(actionObjects != null):
		actionObjects.remove(id)
		updateActions()
	emit_signal("onDeletePressed", id)
