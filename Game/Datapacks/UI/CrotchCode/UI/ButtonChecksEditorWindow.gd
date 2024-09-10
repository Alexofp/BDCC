extends WindowDialog

signal onConfirm(window, checks)
signal onCancel(window)
onready var check_list = $VBoxContainer/HBoxContainer/VBoxContainer/CheckList
onready var scroll_container = $VBoxContainer/HBoxContainer/VBoxContainer2/ScrollContainer
onready var type_selector = $VBoxContainer/HBoxContainer/VBoxContainer2/ScrollContainer/VBoxContainer/TypeSelector
onready var pack_variables = $VBoxContainer/HBoxContainer/VBoxContainer2/ScrollContainer/VBoxContainer/PackVariables

var checks = []
var selectedIndex = -1

func _ready():
	call_deferred("popup_centered")

func setChecks(newChecks):
	checks = newChecks.duplicate(true)
	if(checks.size() > 0):
		selectedIndex = 0
	
	updateChecksList()
	
	updateSelectedItem()

func updateChecksList():
	check_list.clear()
	
	var _i = 0
	for check in checks:
		var checkName = ButtonChecks.getName(check["type"])
		check_list.add_item(checkName)
		if(selectedIndex == _i):
			check_list.select(_i)
		_i += 1
		
func _on_ConfirmButton_pressed():
	emit_signal("onConfirm", self, checks)

func _on_CancelButton_pressed():
	emit_signal("onCancel", self)

func _on_RemoveButton_pressed():
	if(check_list.get_selected_items().size() <= 0):
		return
	if(selectedIndex < 0 || selectedIndex >= checks.size()):
		return
	checks.remove(selectedIndex)
	updateChecksList()
	updateSelectedItem()

func _on_AddButton_pressed():
	var newCheck = {
		type = ButtonChecks.NotLate,
		data = {},
	}
	checks.append(newCheck)
	updateChecksList()
	if(checks.size() == 1):
		selectedIndex = 0
		updateSelectedItem()

func updateSelectedItem():
	if(checks.size() <= 0 || (selectedIndex < 0 || selectedIndex >= checks.size())):
		scroll_container.visible = false
		return
	else:
		scroll_container.visible = true
	
	var selectedCheck = checks[selectedIndex]
	
	type_selector.setData({
		name = "Type",
		values = ButtonChecks.getAllWithNames(),
		value = selectedCheck["type"],
	})
	
	var finalEditVars = ButtonChecks.getEditVars(selectedCheck["type"])
	for varID in finalEditVars:
		if(selectedCheck["data"].has(varID)):
			finalEditVars[varID]["value"] = selectedCheck["data"][varID]
	
	pack_variables.setVariables(finalEditVars)

func _on_CheckList_item_selected(index):
	selectedIndex = index
	updateSelectedItem()


func _on_TypeSelector_onValueChange(_id, newValue):
	var selectedCheck = checks[selectedIndex]
	selectedCheck["type"] = newValue
	selectedCheck["data"] = {}
	updateSelectedItem()
	updateChecksList()


func _on_PackVariables_onVariableChange(id, value):
	var selectedCheck = checks[selectedIndex]
	
	selectedCheck["data"][id] = value
