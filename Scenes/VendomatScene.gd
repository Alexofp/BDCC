extends "res://Scenes/SceneBase.gd"

var sellingItems = ["ballgag", "appleitem", "blindfold", "policecuffs"]
var sellItemsData = {}

func _init():
	sceneID = "VendomatScene"
	
func _initScene(_args = []):
	for itemID in sellingItems:
		var itemObject = GlobalRegistry.createItem(itemID)
		sellItemsData[itemID] = {
			"name": itemObject.getVisibleName(),
			"desc": itemObject.getVisisbleDescription(),
			"price": itemObject.getPrice(),
		}

func _run():
	if(state == ""):
		saynn("You approach the vendomat, it's a bulky machine that has a screen, a few buttons and an open compartment. Seems like you can get some things here in exchange for your credits")
		
		saynn("What do you wanna do?")

		addButton("Buy", "See what the machine has for sell", "buymenu")
		addButton("Sell", "See what you can sell", "sellmenu")
		addButton("Step away", "Step away from the machine", "endthescene")
	
	if(state == "buymenu"):
		saynn("Machine displays a list of what it can sell you:")
		
		for itemID in sellItemsData:
			var item = sellItemsData[itemID]
			sayn(item["name"]+", "+str(item["price"])+" credits")
			
			if(GM.pc.getCredits() >= item["price"]):
				addButton(item["name"], str(item["price"]) + " credits\n" + item["desc"], "buy", [itemID])
			else:
				addDisabledButton(item["name"], str(item["price"]) + " credits\n" + item["desc"])
		
		addButton("Back", "Don't buy anything", "")

	if(state == "sellmenu"):
		saynn("Machine displays a list of what it can buy")
		
		for item in GM.pc.getInventory().getItems():
			if(item.canSell()):
				addButton(item.getStackName(), str(item.getSellPrice()) + " credits\n" + item.getVisisbleDescription(), "sell", [item])
		
		addButton("Back", "Don't sell anything", "")
		
func _react(_action: String, _args):
	if(_action == "buy"):
		var itemID = _args[0]
		
		var item = GlobalRegistry.createItem(itemID)
		GM.pc.getInventory().addItem(item)
		GM.pc.addCredits(-sellItemsData[itemID]["price"])
		
		addMessage(""+sellItemsData[itemID]["name"]+" was added to your inventory")
		
		setState("")
		return
	if(_action == "sell"):
		var item = _args[0]
		
		GM.pc.addCredits(item.getSellPrice())
		GM.pc.getInventory().removeXFromItemOrDelete(item, 1)
		
		addMessage("1x"+item.getVisibleName()+" was sold for "+str(item.getSellPrice()) + " credits")
		
		setState("")
		return

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
