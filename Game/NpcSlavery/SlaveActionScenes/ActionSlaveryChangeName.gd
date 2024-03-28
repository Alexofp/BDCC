extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter

var colorPickerScene = preload("res://UI/ColorPickerWidget.tscn")

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "ActionSlaveryChangeName"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={leashedBy="pc"}})
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		saynn("Your slave's current name is {npc.name}.")
		
		if(npc.getFlag("OriginalName") != null && npc.getFlag("OriginalName") != npc.getName()):
			saynn("You recall that {npc.his} original name was "+str(npc.getFlag("OriginalName", "Bob")))
		
		if(npcSlavery.isMindBroken()):
			saynn("[say=npc]..kh..[/say]")
		else:
			saynn("[say=npc]I should say something?[/say]")
		
		saynn("What do you want to change.")
		
		addButton("Name", "Pick a new name for your slave", "pick_name")
		addButton("Short description", "Pick a new short description for your slave", "pick_desc")
		addButton("Chat color", "Change your slave's chat color", "pick_chatcolor")
		addButton("Back", "Go back", "endthescene")
	
	if(state == "pick_chatcolor"):
		var colorPicker = colorPickerScene.instance()
		GM.ui.addCustomControl("colorpicker", colorPicker)
		colorPicker.setCurrentColor(npc.getChatColor())
			
		addButton("Confirm", "Change the name", "do_pick_color")
		addButton("Reset to default", "Reset the slave's chat color", "do_reset_chatcolor")
		addButton("Cancel", "You changed your mind", "")
	
	if(state == "pick_name"):
		saynn("Pick a new name for your slave")
		
		var textBox:LineEdit = addTextbox("npc_name")
		textBox.text = npc.getName()
		var _ok = textBox.connect("text_entered", self, "onNameTextBoxEnterPressed")
		
		addButton("Confirm", "Change the name", "do_pick_name")
		addButton("Cancel", "You changed your mind", "")
	
	if(state == "pick_desc"):
		saynn("Pick a new description for your slave")
		
		var textBox = addBigTextbox("npc_desc")
		textBox.text = npc.getSmallDescription()
		#var _ok = textBox.connect("text_entered", self, "onNameTextBoxEnterPressed")
		
		addButton("Confirm", "Change the description", "do_pick_desc")
		addButton("Cancel", "You changed your mind", "")

func onNameTextBoxEnterPressed(_new_text:String):
	GM.main.pickOption("do_pick_name", [])

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "do_pick_color"):
		var theColor:Color = getTextboxData("colorpicker")
		npc.npcChatColorOverride = "#"+theColor.to_html(false)
		addMessage("You changed your slave's chat color!")
		setState("")
		removeCharacter(npcID)
		addCharacter(npcID)
		return
	
	if(_action == "do_pick_name"):
		if(setSlaveNameTo(getTextboxData("npc_name"))):
			addMessage("You changed your slave's name!")
			setState("")
		return
	
	if(_action == "do_reset_chatcolor"):
		npc.npcChatColorOverride = ""
		setState("")
		removeCharacter(npcID)
		addCharacter(npcID)
		return
	
	if(_action == "do_pick_desc"):
		if(setSlaveDescTo(getTextboxData("npc_desc"))):
			addMessage("You changed your slave's description!")
			setState("")
		return
		
	setState(_action)

func setSlaveNameTo(newname:String):
	newname = newname.replace("{", "")
	newname = newname.replace("}", "")
	newname = newname.replace("[", "")
	newname = newname.replace("]", "")
	newname = newname.replace("\"", "")
	newname = newname.strip_edges()
	
	if(newname == ""):
		return false
	if(npc.getFlag("OriginalName") == null):
		npc.setFlag("OriginalName", npc.getName())
	npc.npcName = newname
	removeCharacter(npcID)
	addCharacter(npcID)
	return true

func setSlaveDescTo(newname:String):
	newname = newname.replace("{", "")
	newname = newname.replace("}", "")
	newname = newname.replace("[", "")
	newname = newname.replace("]", "")
	newname = newname.replace("\"", "")
	newname = newname.strip_edges()
	
	if(newname == ""):
		return false
	if(npc.getFlag("OriginalDesc") == null):
		npc.setFlag("OriginalDesc", npc.getSmallDescription())
	npc.npcSmallDescription = newname
	removeCharacter(npcID)
	addCharacter(npcID)
	return true

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
