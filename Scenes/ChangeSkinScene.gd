extends "res://Scenes/SceneBase.gd"

var whichColorIsEdited = 0
var pickedBodypartSlot = BodypartSlot.Body

var colorPickerScene = preload("res://UI/ColorPickerWidget.tscn")

func _init():
	sceneID = "ChangeSkinScene"

func _run():
	if(state == ""):
		saynn("In this menu you can modify the skin/colors of your character!")
		
		saynn("Start by modifying the base skin. All bodyparts use the base skin/colors unless you override them specifically.")
		
		playAnimation(StageScene.Solo, "stand", {bodyState={naked=true,hard=true}})
		addButton("Confirm", "Job well done", "endthescene")
		
		addButton("Base Skin/Colors", "Choose your base skin/colors", "basemenu")
		
		for bodypartSlot in BodypartSlot.getAll():
			if(!GM.pc.hasBodypart(bodypartSlot)):
				continue
			var bodypart = GM.pc.getBodypart(bodypartSlot)
			if(!bodypart.supportsSkin()):
				continue
			addButton(bodypart.getName(), "Modify this bodypart's skin/colors", "bodypartmenu", [bodypartSlot])

	if(state == "basemenu"):
		addButton("Back", "Go back", "")
		addButton("Skin", "Change base skin", "changebaseskinmenu")
		addButton("Primary color", "Change base primary color", "changebasecolormenu", [0])
		addButton("Secondary color", "Change base secondary color", "changebasecolormenu", [1])
		addButton("Tertiary color", "Change base tertiary color", "changebasecolormenu", [2])

	if(state == "changebaseskinmenu"):
		addButton("Back", "Go back", "basemenu")
		for skinID in GlobalRegistry.getSkins():
			var theSkin = GlobalRegistry.getSkin(skinID)
			addButton(theSkin.getName(), "Pick this skin", "changebaseskinmenu_select", [skinID])

	if(state == "changebasecolormenu"):
		var colorPicker = colorPickerScene.instance()
		GM.ui.addCustomControl("colorpicker", colorPicker)
		if(whichColorIsEdited == 0):
			colorPicker.setCurrentColor(GM.pc.pickedSkinRColor)
		if(whichColorIsEdited == 1):
			colorPicker.setCurrentColor(GM.pc.pickedSkinGColor)
		if(whichColorIsEdited == 2):
			colorPicker.setCurrentColor(GM.pc.pickedSkinBColor)
			
		addButton("Back", "Go back", "basemenu")
		addButton("Confirm", "Select this color", "changebasecolormenu_select")

	if(state == "bodypartmenu"):
		var bodypart = GM.pc.getBodypart(pickedBodypartSlot)
		
		addButton("Back", "Go back", "")
		if(!bodypart.hasCustomSkinPattern()):
			addButton("Skin", "Change part's skin", "changepartskinmenu")
		addButton("Primary color", "Change part's primary color", "changepartcolormenu", [0])
		addButton("Secondary color", "Change part's secondary color", "changepartcolormenu", [1])
		addButton("Tertiary color", "Change part's tertiary color", "changepartcolormenu", [2])


	if(state == "changepartskinmenu"):
		addButton("Back", "Go back", "bodypartmenu")
		addButton("Same as base", "Inherit the skin from the base", "changepartskinmenu_select", [null])
		for skinID in GlobalRegistry.getSkins():
			var theSkin = GlobalRegistry.getSkin(skinID)
			addButton(theSkin.getName(), "Pick this skin", "changepartskinmenu_select", [skinID])

	if(state == "changepartcolormenu"):
		var bodypart = GM.pc.getBodypart(pickedBodypartSlot)
		var colorPicker = colorPickerScene.instance()
		GM.ui.addCustomControl("colorpicker", colorPicker)
		if(whichColorIsEdited == 0):
			colorPicker.setCurrentColor(bodypart.pickedRColor)
		if(whichColorIsEdited == 1):
			colorPicker.setCurrentColor(bodypart.pickedGColor)
		if(whichColorIsEdited == 2):
			colorPicker.setCurrentColor(bodypart.pickedBColor)
			
		addButton("Back", "Go back", "bodypartmenu")
		addButton("Confirm", "Select this color", "changepartcolormenu_select")
		addButton("Same as base", "Inherit the color from the base", "changepartcolormenu_select", [null])



func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "changebasecolormenu"):
		whichColorIsEdited = _args[0]
		
	if(_action == "changepartcolormenu"):
		whichColorIsEdited = _args[0]
		
	if(_action == "bodypartmenu"):
		if(_args.size() > 0):
			pickedBodypartSlot = _args[0]
	
	if(_action == "changebaseskinmenu_select"):
		GM.pc.pickedSkin = _args[0]
		setState("basemenu")
		GM.pc.updateAppearance()
		return
	
	if(_action == "changebasecolormenu_select"):
		var theColor = GM.ui.getCustomControl("colorpicker").getCurrentColor()
		if(whichColorIsEdited == 0):
			GM.pc.pickedSkinRColor = theColor
		if(whichColorIsEdited == 1):
			GM.pc.pickedSkinGColor = theColor
		if(whichColorIsEdited == 2):
			GM.pc.pickedSkinBColor = theColor
		setState("basemenu")
		GM.pc.updateAppearance()
		return
	
	if(_action == "changepartskinmenu_select"):
		var bodypart = GM.pc.getBodypart(pickedBodypartSlot)
		if(_args.size() > 0 && _args[0] == null):
			bodypart.pickedSkin = null
		else:
			bodypart.pickedSkin = _args[0]
		setState("bodypartmenu")
		GM.pc.updateAppearance()
		return
	
	if(_action == "changepartcolormenu_select"):
		var bodypart = GM.pc.getBodypart(pickedBodypartSlot)
		if(_args.size() > 0 && _args[0] == null):
			if(whichColorIsEdited == 0):
				bodypart.pickedRColor = null
			if(whichColorIsEdited == 1):
				bodypart.pickedGColor = null
			if(whichColorIsEdited == 2):
				bodypart.pickedBColor = null
		else:
			var theColor = GM.ui.getCustomControl("colorpicker").getCurrentColor()
			if(whichColorIsEdited == 0):
				bodypart.pickedRColor = theColor
			if(whichColorIsEdited == 1):
				bodypart.pickedGColor = theColor
			if(whichColorIsEdited == 2):
				bodypart.pickedBColor = theColor
		setState("bodypartmenu")
		GM.pc.updateAppearance()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["whichColorIsEdited"] = whichColorIsEdited
	data["pickedBodypartSlot"] = pickedBodypartSlot

	return data
	
func loadData(data):
	.loadData(data)
	
	whichColorIsEdited = SAVE.loadVar(data, "whichColorIsEdited", 0)
	pickedBodypartSlot = SAVE.loadVar(data, "pickedBodypartSlot", BodypartSlot.Body)
