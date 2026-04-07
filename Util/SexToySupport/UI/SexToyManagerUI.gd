extends Control

onready var toy_settings = $"%Toy Settings"
onready var gameplay_triggers = $"%Gameplay Triggers"
onready var backends_item_list = $"%BackendsItemList"
onready var toy_item_list = $"%ToyItemList"
onready var backend_panel = $"%BackendPanel"
onready var toy_panel = $"%ToyPanel"
onready var backend_desc = $"%BackendDesc"
onready var enable_back_end_check_box = $"%EnableBackEndCheckBox"
onready var test_toy_button = $"%TestToyButton"
onready var test_toy_slider = $"%TestToySlider"
onready var backend_pack_variables = $"%BackendPackVariables"
onready var enable_manager_checkbox = $"%EnableManagerCheckbox"
onready var backend_actions_list = $"%BackendActionsList"
onready var back_end_info_label = $"%BackEndInfoLabel"
onready var toy_pack_variables = $"%ToyPackVariables"

var selectedSomething
var isBackendSelected:bool = false

var isTestingToy:bool = false

signal onClosePressed

var backends:Array

func _ready():
	enable_manager_checkbox.set_pressed_no_signal(SexToyManager.isEnabled())
	
	backends = SexToyManager.backends.values()
	updateBackendList()
	updateToyList()
	updateToyOrBackendPanel()
	SexToyManager.connect("onToyListChange", self, "onSexToyListChange")

func updateToyList():
	toy_item_list.clear()
	var _i:int = 0
	for theToy in SexToyManager.toys:
		toy_item_list.add_item(theToy.getNameInList())
		if(isBackendSelected && selectedSomething == theToy):
			toy_item_list.select(_i)
		_i += 1

func updateBackendList():
	backends_item_list.clear()
	var _i:int = 0
	for theBackend in backends:
		backends_item_list.add_item(theBackend.getNameInList())
		if(isBackendSelected && selectedSomething == theBackend):
			backends_item_list.select(_i)
		_i += 1

func updateToyOrBackendPanel():
	backend_panel.visible = isBackendSelected && !!selectedSomething
	toy_panel.visible = !isBackendSelected && !!selectedSomething
	
	if(isBackendSelected && selectedSomething):
		var theBackend:SexToyBackend = selectedSomething
		enable_back_end_check_box.set_pressed_no_signal(theBackend.enabled)
		backend_desc.bbcode_text = theBackend.getDesc()
		
		backend_pack_variables.setVariables(selectedSomething.getSettings())
		updateBackendActionsList()
		
	elif(!isBackendSelected && selectedSomething):
		toy_pack_variables.setVariables(selectedSomething.getSettings())

func _on_CloseButton_pressed():
	SexToyManager.saveToFile()
	emit_signal("onClosePressed")

func _on_BackendsItemList_item_selected(index:int):
	stopTestingToy()
	isBackendSelected = true
	if(index < 0 || index >= backends.size()):
		selectedSomething = null
	else:
		selectedSomething = backends[index]
	updateToyOrBackendPanel()

func _on_EnableBackEndCheckBox_pressed():
	var theBackend:SexToyBackend = selectedSomething
	if(!theBackend):
		return
	theBackend.setEnabled(enable_back_end_check_box.pressed)
	updateBackendList()

func onSexToyListChange():
	updateToyList()
	
	if(!isBackendSelected):
		updateToyOrBackendPanel()

func _on_ToyItemList_item_selected(index:int):
	stopTestingToy()
	isBackendSelected = false
	if(index < 0 || index >= SexToyManager.toys.size()):
		selectedSomething = null
	else:
		selectedSomething = SexToyManager.toys[index]
	updateToyOrBackendPanel()

func startTestingToy():
	if(isTestingToy || isBackendSelected || !selectedSomething):
		return
	isTestingToy = true
	test_toy_button.text = "Stop"
	selectedSomething.vibrate(test_toy_slider.value)

func stopTestingToy():
	if(!isTestingToy):
		return
	isTestingToy = false
	test_toy_button.text = "Start"
	selectedSomething.vibrate(0.0)

func _on_TestToyButton_pressed():
	if(!isTestingToy):
		startTestingToy()
	else:
		stopTestingToy()
	
func _process(_delta:float):
	if(isTestingToy):
		if(!isBackendSelected && selectedSomething):
			selectedSomething.vibrate(test_toy_slider.value)
	
	if(selectedSomething && (selectedSomething is SexToyBackend)):
		back_end_info_label.text = Util.join(selectedSomething.getInfo(), "\n")
	
func _on_BackendPackVariables_onVariableChange(id, value):
	if(selectedSomething && (selectedSomething is SexToyBackend)):
		if(selectedSomething.applySetting(id, value)):
			updateToyOrBackendPanel()

func _on_EnableManagerCheckbox_pressed():
	SexToyManager.setEnabled(enable_manager_checkbox.pressed)
	updateBackendList()
	updateToyList()

func updateBackendActionsList():
	if(selectedSomething && (selectedSomething is SexToyBackend)):
		Util.delete_children(backend_actions_list)
		
		var theActions:Array = selectedSomething.getActions()
		for theActionEntry in theActions:
			var newButton:Button = Button.new()
			newButton.text = theActionEntry[1]
			backend_actions_list.add_child(newButton)
			newButton.connect("pressed", self, "onBackendAction", [theActionEntry[0]])

func onBackendAction(_action:String):
	if(selectedSomething && (selectedSomething is SexToyBackend)):
		selectedSomething.doAction(_action)
		updateToyOrBackendPanel()


func _on_BackendDesc_meta_clicked(meta):
	var _ok = Util.fixed_shell_open(meta)

func _on_ToyPackVariables_onVariableChange(id, value):
	if(selectedSomething && (selectedSomething is SexToyBase)):
		if(selectedSomething.applySetting(id, value)):
			updateToyOrBackendPanel()
			updateToyList()

func _on_ForgetToyButton_pressed():
	if(selectedSomething && (selectedSomething is SexToyBase)):
		SexToyManager.toys.erase(selectedSomething)
		selectedSomething = null
		updateToyOrBackendPanel()
		updateToyList()
