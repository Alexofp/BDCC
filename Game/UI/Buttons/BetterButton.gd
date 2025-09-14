extends Button
class_name BetterButton

export var myButtonText:String = ""
export var myTooltipName:String = ""
export var myTooltipDesc:String = ""

export var shouldScaleToUIButtonSize:bool = true
export var shouldShowShortcut:bool = true
export var allowDoubleTabSetting:bool = false
export var instantTooltip:bool = false

export var myShortcutKey:String = ""
export var myShortcutCtrl:bool = false

onready var key_label = $"%KeyLabel"
onready var button_label = $"%ButtonLabel"

var showingDescription:bool = false

signal pressedActually

func _ready():
	#if(false):
	#	KEY_1
	
	if(shouldShowShortcut && OPTIONS.shouldShowShortcuts()):
		key_label.visible = true
	else:
		key_label.visible = false
	
	updateButtonSize()
	
	if(!text.empty() && myButtonText.empty()):
		myButtonText = text
	text = " "
	
	if(!hint_tooltip.empty() && myTooltipDesc.empty()):
		myTooltipDesc = hint_tooltip
	hint_tooltip = ""
	updateButtonText()
	
	if(!myShortcutKey.empty()):
		setShortcutPhysicalScancode(OS.find_scancode_from_string(myShortcutKey), myShortcutCtrl)
	checkDisabled()
	
	OPTIONS.connect("onLayoutChange", self, "updateButtonSize")

func updateButtonSize():
	if(shouldScaleToUIButtonSize):
		var minButtonSize:float = OPTIONS.getUiButtonSize()
		if(minButtonSize > 0):
			rect_min_size = Vector2(0, 20 + minButtonSize * 16)
	else:
		rect_min_size = Vector2(0.0, 0.0)
	if(OPTIONS.isTouchFriendlyUI()):
		rect_min_size.y = max(rect_min_size.y, 68.0)
		
	
func setButtonText(_text:String):
	myButtonText = _text
	updateButtonText()

func updateButtonText():
	button_label.text = myButtonText

func setShortcutPhysicalScancode(code:int, reqControl:bool = false):
	var newShortcut = ShortCut.new()
	var inputKey = InputEventKey.new()
	inputKey.physical_scancode = code
	inputKey.control = reqControl
	newShortcut.shortcut = inputKey
	shortcut = newShortcut

	key_label.text = ("ctrl+" if reqControl else "")+OS.get_scancode_string(code)

func _on_BetterButton_mouse_entered():
	showTooltip()
	
func _on_BetterButton_mouse_exited():
	hideTooltip()

func showTooltip():
	if(myTooltipName.empty() && myTooltipDesc.empty()):
		return
	GlobalTooltip.showTooltip(self, myTooltipName if !myTooltipName.empty() else myButtonText, myTooltipDesc, false, !instantTooltip)

func hideTooltip():
	GlobalTooltip.hideTooltip(self)

func setTooltipText(_name:String, _desc:String):
	myTooltipName = _name
	myTooltipDesc = _name
	GlobalTooltip.setTooltipText(self, myTooltipName if !myTooltipName.empty() else myButtonText, myTooltipDesc)


func _on_BetterButton_pressed():
	if(OS.has_touchscreen_ui_hint() && OPTIONS.shouldRequireDoubleTapOnMobile() && allowDoubleTabSetting):
		if(!showingDescription):
			showingDescription = true
			emit_signal("mouse_entered")
		else:
			showingDescription = false
			emit_signal("pressedActually")
	else:
		emit_signal("pressedActually")

func setIsDisabled(_dis:bool):
	if(_dis == disabled):
		return
	disabled = _dis
	checkDisabled()

func checkDisabled():
	if(disabled):
		button_label["custom_colors/font_color"] = Color.darkgray
	else:
		button_label["custom_colors/font_color"] = Color.white
