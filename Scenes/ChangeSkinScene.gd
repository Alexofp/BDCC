extends "res://Scenes/SceneBase.gd"

var whichColorIsEdited = 0
var pickedBodypartSlot = BodypartSlot.Body
var rememberedColor = Color.white
var editingID = "pc"
var thePC
var debugMode = false

var colorPickerScene = preload("res://UI/ColorPickerWidget.tscn")
var textWidgetScene = preload("res://UI/TextOutputWidget.tscn")

func _initScene(_args = []):
	if(_args.size() > 0):
		editingID = _args[0]
	thePC = GlobalRegistry.getCharacter(editingID)
	if(_args.size() > 1 && _args[1]):
		debugMode = true
		if(editingID != "pc"):
			addCharacter(editingID)
	playAnimation(StageScene.Solo, "stand", {pc=editingID, bodyState={naked=true, hard=true}})

func _init():
	sceneID = "ChangeSkinScene"

func _run():
	if(debugMode && state != "changebasecolormenu" && state != "changepartcolormenu"):
		var textEdit = textWidgetScene.instance()
		GM.ui.addCustomControl("textedit", textEdit)
		
		var outputText = []
		outputText.append("pickedSkin=\""+thePC.pickedSkin+"\"")
		outputText.append("pickedSkinRColor=Color(\""+thePC.pickedSkinRColor.to_html()+"\")")
		outputText.append("pickedSkinGColor=Color(\""+thePC.pickedSkinGColor.to_html()+"\")")
		outputText.append("pickedSkinBColor=Color(\""+thePC.pickedSkinBColor.to_html()+"\")")
		outputText.append("npcSkinData={")
		for bodypartSlot in thePC.getBodyparts():
			if(!thePC.hasBodypart(bodypartSlot)):
				continue
			var bodypart:Bodypart = thePC.getBodypart(bodypartSlot)
			var changedValues = ""
			if(bodypart.pickedSkin != null):
				changedValues +='"skin": "'+bodypart.pickedSkin+'",'
			if(bodypart.pickedRColor != null):
				changedValues +='"r": Color("'+bodypart.pickedRColor.to_html()+'"),'
			if(bodypart.pickedGColor != null):
				changedValues +='"g": Color("'+bodypart.pickedGColor.to_html()+'"),'
			if(bodypart.pickedBColor != null):
				changedValues +='"b": Color("'+bodypart.pickedBColor.to_html()+'"),'
			if(changedValues != ""):
				outputText.append('"'+bodypartSlot+'": {'+changedValues+'},')
		outputText.append("}")
		
		textEdit.setText("\t"+Util.join(outputText, "\n\t"))
	
	if(state == ""):
		if(debugMode):
			addButton("RELOAD SKINS", "Reload all custom skins from disk", "do_reload_skins")
		
		saynn("In this menu you can modify the skin/colors of your character!")
		
		saynn("Start by modifying the base skin. All bodyparts use the base skin/colors unless you override them specifically.")
		
		
		addButton("Confirm", "Job well done", "endthescene")
		
		addButton("Base Skin/Colors", "Choose your base skin/colors", "basemenu")
		
		for bodypartSlot in BodypartSlot.getAll():
			if(!thePC.hasBodypart(bodypartSlot)):
				continue
			var bodypart = thePC.getBodypart(bodypartSlot)
			if(!bodypart.supportsSkin()):
				continue
			#addButton(bodypart.getName(), "Modify this bodypart's skin/colors", "bodypartmenu", [bodypartSlot])
			addButton(BodypartSlot.getVisibleName(bodypartSlot), "Modify the skin/colors of the "+str(bodypart.getName()), "bodypartmenu", [bodypartSlot])

	if(state == "basemenu"):
		addButton("Back", "Go back", "")
		addButton("Skin", "Change base skin", "changebaseskinmenu")
		addButton("Primary color", "Change base primary color", "changebasecolormenu", [0])
		addButton("Secondary color", "Change base secondary color", "changebasecolormenu", [1])
		addButton("Tertiary color", "Change base tertiary color", "changebasecolormenu", [2])
		addButton("Randomize colors", "Pick random colors", "dorandomcolors")
		addButton("Randomize ALL", "Pick random skin and colors", "dorandomcolorsall")

	if(state == "changebaseskinmenu"):
		addButton("Back", "Go back", "basemenu")
		for skinID in GlobalRegistry.getSkinsAllKeys():
			var theSkin = GlobalRegistry.getSkin(skinID)
			addButton(theSkin.getName(), "Pick this skin"+theSkin.getExtraDesc(), "changebaseskinmenu_select", [skinID])

	if(state == "changebasecolormenu"):
		var colorPicker = colorPickerScene.instance()
		GM.ui.addCustomControl("colorpicker", colorPicker)
		if(whichColorIsEdited == 0):
			colorPicker.setCurrentColor(thePC.pickedSkinRColor)
			rememberedColor = thePC.pickedSkinRColor
		if(whichColorIsEdited == 1):
			colorPicker.setCurrentColor(thePC.pickedSkinGColor)
			rememberedColor = thePC.pickedSkinGColor
		if(whichColorIsEdited == 2):
			colorPicker.setCurrentColor(thePC.pickedSkinBColor)
			rememberedColor = thePC.pickedSkinBColor
		colorPicker.connect("color_changed", self, "changebasecolormenu_colorchanged")
			
		addButton("Back", "Go back", "resetcolor_basemenu")
		addButton("Confirm", "Select this color", "changebasecolormenu_select")

	if(state == "bodypartmenu"):
		var bodypart = thePC.getBodypart(pickedBodypartSlot)
		
		addButton("Back", "Go back", "")
		if(!bodypart.hasCustomSkinPattern()):
			addButton("Skin", "Change part's skin", "changepartskinmenu")
		else:
			if(!GlobalRegistry.getPartSkins(bodypart.id).empty() || bodypart.pickedSkin != null):
				addButton("Skin", "Change part's skin", "changepartskinmenu")
		addButton("Primary color", "Change part's primary color", "changepartcolormenu", [0])
		addButton("Secondary color", "Change part's secondary color", "changepartcolormenu", [1])
		addButton("Tertiary color", "Change part's tertiary color", "changepartcolormenu", [2])


	if(state == "changepartskinmenu"):
		var bodypart = thePC.getBodypart(pickedBodypartSlot)
		addButton("Back", "Go back", "bodypartmenu")
		
		if(bodypart.hasCustomSkinPattern()):
			addButton("Default", "Use the default skin pattern", "changepartskinmenu_select", [null])
			for skinID in GlobalRegistry.getPartSkins(bodypart.id):
				var theSkin = GlobalRegistry.getPartSkin(bodypart.id, skinID)
				addButton(theSkin.getName(), "Pick this skin"+theSkin.getExtraDesc(), "changepartskinmenu_select", [skinID])
		else:
			addButton("Same as base", "Inherit the skin from the base", "changepartskinmenu_select", [null])
			for skinID in GlobalRegistry.getSkinsAllKeys():
				var theSkin = GlobalRegistry.getSkin(skinID)
				addButton(theSkin.getName(), "Pick this skin"+theSkin.getExtraDesc(), "changepartskinmenu_select", [skinID])

	if(state == "changepartcolormenu"):
		var bodypart = thePC.getBodypart(pickedBodypartSlot)
		var colorPicker = colorPickerScene.instance()
		GM.ui.addCustomControl("colorpicker", colorPicker)
		if(whichColorIsEdited == 0):
			colorPicker.setCurrentColor(bodypart.pickedRColor)
			rememberedColor = bodypart.pickedRColor
		if(whichColorIsEdited == 1):
			colorPicker.setCurrentColor(bodypart.pickedGColor)
			rememberedColor = bodypart.pickedGColor
		if(whichColorIsEdited == 2):
			colorPicker.setCurrentColor(bodypart.pickedBColor)
			rememberedColor = bodypart.pickedBColor
		colorPicker.connect("color_changed", self, "changepartcolormenu_colorchanged")
			
		addButton("Back", "Go back", "resetcolor_bodypartmenu")
		addButton("Confirm", "Select this color", "changepartcolormenu_select")
		addButton("Same as base", "Inherit the color from the base", "changepartcolormenu_select", [null])

var isChanging = false
func changebasecolormenu_colorchanged(_theColor):
	if(isChanging):
		return
	isChanging = true
	yield(get_tree().create_timer(0.3), "timeout")
	if(GM.ui.getCustomControl("colorpicker") == null):
		isChanging = false
		return
	var theColor = GM.ui.getCustomControl("colorpicker").getCurrentColor()
	if(whichColorIsEdited == 0):
		thePC.pickedSkinRColor = theColor
	if(whichColorIsEdited == 1):
		thePC.pickedSkinGColor = theColor
	if(whichColorIsEdited == 2):
		thePC.pickedSkinBColor = theColor
	thePC.updateAppearance()
	isChanging = false

func changepartcolormenu_colorchanged(_theColor):
	if(isChanging):
		return
	isChanging = true
	yield(get_tree().create_timer(0.3), "timeout")
	if(GM.ui.getCustomControl("colorpicker") == null):
		isChanging = false
		return
	var theColor = GM.ui.getCustomControl("colorpicker").getCurrentColor()
	var bodypart = thePC.getBodypart(pickedBodypartSlot)
	if(whichColorIsEdited == 0):
		bodypart.pickedRColor = theColor
	if(whichColorIsEdited == 1):
		bodypart.pickedGColor = theColor
	if(whichColorIsEdited == 2):
		bodypart.pickedBColor = theColor
	thePC.updateAppearance()
	isChanging = false

func _react(_action: String, _args):
	if(_action == "endthescene"):
		if(editingID == "pc"):
			setFlag("PickedSkinAtLeastOnce", true)
		endScene()
		return
	
	if(_action == "resetcolor_basemenu"):
		if(whichColorIsEdited == 0):
			thePC.pickedSkinRColor = rememberedColor
		if(whichColorIsEdited == 1):
			thePC.pickedSkinGColor = rememberedColor
		if(whichColorIsEdited == 2):
			thePC.pickedSkinBColor = rememberedColor
		thePC.updateAppearance()
		setState("basemenu")
		return
		
	if(_action == "resetcolor_bodypartmenu"):
		var bodypart = thePC.getBodypart(pickedBodypartSlot)
		if(whichColorIsEdited == 0):
			bodypart.pickedRColor = rememberedColor
		if(whichColorIsEdited == 1):
			bodypart.pickedGColor = rememberedColor
		if(whichColorIsEdited == 2):
			bodypart.pickedBColor = rememberedColor
		thePC.updateAppearance()
		setState("bodypartmenu")
		return
	
	if(_action == "changebasecolormenu"):
		whichColorIsEdited = _args[0]
		
	if(_action == "changepartcolormenu"):
		whichColorIsEdited = _args[0]
		
	if(_action == "bodypartmenu"):
		if(_args.size() > 0):
			pickedBodypartSlot = _args[0]
	
	if(_action == "changebaseskinmenu_select"):
		thePC.pickedSkin = _args[0]
		setState("basemenu")
		thePC.updateAppearance()
		return
	
	if(_action == "changebasecolormenu_select"):
		var theColor = GM.ui.getCustomControl("colorpicker").getCurrentColor()
		if(whichColorIsEdited == 0):
			thePC.pickedSkinRColor = theColor
		if(whichColorIsEdited == 1):
			thePC.pickedSkinGColor = theColor
		if(whichColorIsEdited == 2):
			thePC.pickedSkinBColor = theColor
		setState("basemenu")
		thePC.updateAppearance()
		return
	
	if(_action == "changepartskinmenu_select"):
		var bodypart = thePC.getBodypart(pickedBodypartSlot)
		if(_args.size() > 0 && _args[0] == null):
			bodypart.pickedSkin = null
		else:
			bodypart.pickedSkin = _args[0]
		setState("bodypartmenu")
		thePC.updateAppearance()
		return
	
	if(_action == "changepartcolormenu_select"):
		var bodypart = thePC.getBodypart(pickedBodypartSlot)
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
		thePC.updateAppearance()
		return
		
	if(_action == "do_reload_skins"):
		playAnimation(StageScene.Solo, "walk", {pc=editingID, bodyState={naked=true,hard=true}})
		GlobalRegistry.findCustomSkins()
		thePC.updateAppearance()
		return
		
	if(_action == "dorandomcolors"):
		thePC.applyRandomColors()
		thePC.updateAppearance()
		return
	
	if(_action == "dorandomcolorsall"):
		thePC.applyRandomSkinAndColorsAndParts()
		thePC.updateAppearance()
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["whichColorIsEdited"] = whichColorIsEdited
	data["pickedBodypartSlot"] = pickedBodypartSlot
	data["editingID"] = editingID
	data["debugMode"] = debugMode

	return data
	
func loadData(data):
	.loadData(data)
	
	whichColorIsEdited = SAVE.loadVar(data, "whichColorIsEdited", 0)
	pickedBodypartSlot = SAVE.loadVar(data, "pickedBodypartSlot", BodypartSlot.Body)
	editingID = SAVE.loadVar(data, "editingID", "pc")
	thePC = GlobalRegistry.getCharacter(editingID)
	debugMode = SAVE.loadVar(data, "debugMode", false)
