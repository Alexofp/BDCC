extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter

var whichColorIsEdited = 0
var colorPickerScene = preload("res://UI/ColorPickerWidget.tscn")
var rememberedColor = Color.white

var isAlreadyAtBathroom = false

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _reactInit():
	if(GM.pc.getLocation() in ["main_bathroom1", "main_bathroom2"]):
		isAlreadyAtBathroom = true

func _init():
	sceneID = "ActionSlaveryHaircut"

func _run():
	if(state == ""):
		addCharacter(npcID)
		if(!isAlreadyAtBathroom):
			aimCameraAndSetLocName("main_bathroom1")
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={leashedBy="pc"}})
		
		if(isAlreadyAtBathroom):
			saynn("You are standing near the big mirrors. Sinks here have some hair grooming and growing supplies that you can use on your slave to change {npc.his} haircut.")
		else:
			saynn("You leash your slave and bring {npc.him} to one of the bathrooms. Sinks here have some hair grooming and growing supplies that you can use on your slave to change {npc.his} haircut.")
		
		saynn("What do you want to change?")
		
		addButton("Haircut", "Change your slave's haircut", "changehaircutmenu")
		var bodypart = npc.getBodypart(BodypartSlot.Hair)
		if(!bodypart.hasCustomSkinPattern()):
			addButton("Skin", "Change the hair's skin", "changepartskinmenu")
		else:
			if(!GlobalRegistry.getPartSkins(bodypart.id).empty() || bodypart.pickedSkin != null):
				addButton("Skin", "Change the hair's skin", "changepartskinmenu")
		addButton("Primary color", "Change your slave's hair color", "changecolor", [0])
		addButton("Secondary color", "Change your slave's hair color", "changecolor", [1])
		addButton("Tertiary color", "Change your slave's hair color", "changecolor", [2])
		addButton("Done", "Enough tinkering", "endthescene")

	if(state == "changepartskinmenu"):
		var bodypart = npc.getBodypart(BodypartSlot.Hair)
		addButton("Back", "Go back", "")
		
		if(bodypart.hasCustomSkinPattern()):
			addButton("Default", "Use the default skin pattern", "changepartskinmenu_select", [null])
			for skinID in GlobalRegistry.getPartSkins(bodypart.id):
				var theSkin = GlobalRegistry.getPartSkin(bodypart.id, skinID)
				var skinAuthor = theSkin.getAuthor()
				addButton(theSkin.getName(), "Pick this skin"+(("\n[i]Created by:[/i] "+str(skinAuthor)) if (skinAuthor != null && skinAuthor != "") else ""), "changepartskinmenu_select", [skinID])
		else:
			addButton("Same as base", "Inherit the skin from the base", "changepartskinmenu_select", [null])
			for skinID in GlobalRegistry.getSkinsAllKeys():
				var theSkin = GlobalRegistry.getSkin(skinID)
				var skinAuthor = theSkin.getAuthor()
				addButton(theSkin.getName(), "Pick this skin"+(("\n[i]Created by:[/i] "+str(skinAuthor)) if (skinAuthor != null && skinAuthor != "") else ""), "changepartskinmenu_select", [skinID])


	if(state == "changehaircutmenu"):
		saynn("Pick the haircut that you want to see on your slave")
		
		addButton("BACK", "This one is good", "")

		for bodypartID in GlobalRegistry.getBodypartsIdsBySlot(BodypartSlot.Hair):
			var bodypart:Bodypart = GlobalRegistry.getBodypartRef(bodypartID)
			
			addButton(bodypart.getName(), "Change your slave's hair to this one", "changehair", [bodypartID])

	if(state == "changehair"):
		saynn("You humm as you work on your hair, using the instant hair grower and scissors to shape the way your hair looks")

		addButton("Continue", "See what happens next", "changehaircutmenu")

	if(state == "changecolor"):
		var bodypart = npc.getBodypart(BodypartSlot.Hair)
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
		

var isChanging = false
func changepartcolormenu_colorchanged(_theColor):
	if(isChanging):
		return
	isChanging = true
	yield(get_tree().create_timer(0.3), "timeout")
	if(GM.ui.getCustomControl("colorpicker") == null):
		isChanging = false
		return
	var theColor = GM.ui.getCustomControl("colorpicker").getCurrentColor()
	var bodypart = npc.getBodypart(BodypartSlot.Hair)
	if(whichColorIsEdited == 0):
		bodypart.pickedRColor = theColor
	if(whichColorIsEdited == 1):
		bodypart.pickedGColor = theColor
	if(whichColorIsEdited == 2):
		bodypart.pickedBColor = theColor
	npc.updateAppearance()
	isChanging = false

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "changepartskinmenu_select"):
		var bodypart = npc.getBodypart(BodypartSlot.Hair)
		if(_args.size() > 0 && _args[0] == null):
			bodypart.pickedSkin = null
		else:
			bodypart.pickedSkin = _args[0]
		setState("")
		npc.updateAppearance()
		return
		
	if(_action == "resetcolor_bodypartmenu"):
		var bodypart = npc.getBodypart(BodypartSlot.Hair)
		if(whichColorIsEdited == 0):
			bodypart.pickedRColor = rememberedColor
		if(whichColorIsEdited == 1):
			bodypart.pickedGColor = rememberedColor
		if(whichColorIsEdited == 2):
			bodypart.pickedBColor = rememberedColor
		npc.updateAppearance()
		setState("")
		return
		
	if(_action == "changeskin"):
		runScene("ChangeSkinScene")
		endScene()
		return
	
	if(_action == "changecolor"):
		whichColorIsEdited = _args[0]
	
	if(_action == "changehair"):
		var savedRColor = Color.white
		var savedGColor = Color.white
		var savedBColor = Color.white
		if(npc.hasBodypart(BodypartSlot.Hair)):
			var theHair:Bodypart = npc.getBodypart(BodypartSlot.Hair)
			savedRColor = theHair.pickedRColor
			savedGColor = theHair.pickedGColor
			savedBColor = theHair.pickedBColor
		
		var newHair:Bodypart = GlobalRegistry.createBodypart(_args[0])
		if(newHair != null):
			newHair.pickedRColor = savedRColor
			newHair.pickedGColor = savedGColor
			newHair.pickedBColor = savedBColor
			npc.giveBodypartUnlessSame(newHair)
	
	if(_action == "changepartcolormenu_select"):
		processTime(10*60)
		
		var bodypart = npc.getBodypart(BodypartSlot.Hair)
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
		setState("")
		npc.updateAppearance()
		return
	
	
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["whichColorIsEdited"] = whichColorIsEdited
	data["isAlreadyAtBathroom"] = isAlreadyAtBathroom

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
	whichColorIsEdited = SAVE.loadVar(data, "whichColorIsEdited", 0)
	isAlreadyAtBathroom = SAVE.loadVar(data, "isAlreadyAtBathroom", false)
