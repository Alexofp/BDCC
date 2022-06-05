extends "res://Scenes/SceneBase.gd"

var inv:LightInventory
var savedCredits: int = 0

func _init():
	sceneID = "LootingScene"
	inv = LightInventory.new()

func _initScene(_args = []):
	if(_args.size() > 0):
		var loot: Dictionary = _args[0]
		
		if(loot.has("items")):
			for item in loot["items"]:
				inv.addItem(item)
				
		if(loot.has("credits")):
			savedCredits = loot["credits"]
		#uniqueItemID = _args[0]
	
func _reactInit():
	pass

func _run():
	if(state == ""):
		saynn("Choose what do you wanna take")
		
		if(savedCredits == 0 && inv.getItems().size() == 0):
			sayn("You found:")
			sayn("Nothing left")
		else:
			addButton("Take all", "Take everything and leave", "grabAllAndLeave")
			
			sayn("You found:")
			if(savedCredits > 0):
				sayn("- "+str(savedCredits)+" "+Util.multipleOrSingularEnding(savedCredits, "credit"))
				
				addButton(str(savedCredits)+" "+Util.multipleOrSingularEnding(savedCredits, "credit"), "Grab the credits", "grabCredits")
			for item in inv.getItems():
				sayn("- "+item.getStackName())
				
				addButton(item.getStackName(), item.getVisisbleDescription(), "grabItem", [item.getUniqueID()])
		
		addButton("Leave", "You don't want anything else", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "grabAllAndLeave"):
		if(savedCredits > 0):
			GM.pc.addCredits(savedCredits)
			addMessage("You looted a chip with "+str(savedCredits)+" "+Util.multipleOrSingularEnding(savedCredits, "credit"))
			savedCredits = 0
		
		var items = inv.getItems()
		for i in range(items.size()-1, -1, -1):
			var item = items[i]
			inv.removeItem(item)
			GM.pc.getInventory().addItem(item)
			addMessage("You looted "+item.getAStackName())
		endScene()
		return
	
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "grabItem"):
		var item = inv.getItemByUniqueID(_args[0])
		if(item == null):
			setState("")
			return
		
		inv.removeItem(item)
		GM.pc.getInventory().addItem(item)
		addMessage("You looted "+item.getAStackName())
		setState("")
		return
	
	if(_action == "grabCredits"):
		GM.pc.addCredits(savedCredits)
		addMessage("You looted a chip with "+str(savedCredits)+" "+Util.multipleOrSingularEnding(savedCredits, "credit"))
		savedCredits = 0
		setState("")
		return
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["inventory"] = inv.saveData()
	data["savedCredits"] = savedCredits
		
	return data
	
func loadData(data):
	.loadData(data)
	
	inv.loadData(SAVE.loadVar(data, "inventory", {}))
	savedCredits = SAVE.loadVar(data, "savedCredits", 0)
