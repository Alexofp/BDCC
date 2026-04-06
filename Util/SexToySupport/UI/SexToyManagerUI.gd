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

var selectedSomething
var isBackendSelected:bool = false

var isTestingToy:bool = false

signal onClosePressed

var backends:Array

func _ready():
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
	elif(!isBackendSelected && selectedSomething):
		pass

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
