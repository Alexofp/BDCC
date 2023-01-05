extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "AnnouncerTalkScene"

var sortedItemsIds = []
var sellItemsData = {}

func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["announcer"])):
		endScene()
		return
	updateSellingItems()

func updateSellingItems():
	sellItemsData.clear()
	sortedItemsIds.clear()
	
	var finalSellingItems = []
	#finalSellingItems.append_array(sellingItems)
	
	for itemTag in [ItemTag.SoldByTheAnnouncer]:
		var itemIDs = GlobalRegistry.getItemIDsByTag(itemTag)
		finalSellingItems.append_array(itemIDs)
	
	for itemID in finalSellingItems:
		if(sellItemsData.has(itemID)):
			continue
		
		var itemObject = GlobalRegistry.getItemRef(itemID)
		sellItemsData[itemID] = {
			"name": itemObject.getVisibleName(),
			"desc": itemObject.getVisisbleDescription(),
			"price": itemObject.getPrice(),
			"amount": itemObject.getBuyAmount(),
		}
		sortedItemsIds.append(itemID)
	sortedItemsIds.sort_custom(self, "sort_stock")	

func sort_stock(a, b):
	if sellItemsData[a]["price"] < sellItemsData[b]["price"]:
		return true
	return false

func _run():
	if(state == ""):
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})

	if(state == ""):
		saynn("You wait until Ans is free and get his attention.")

		saynn("[say=announcer]Hey there, babe[/say]")

		addButton("Talk", "Ask him some questions", "talk")
		if(getFlag("FightClubModule.AnnouncerAskedAboutShop")):
			addButton("Buy", "Look at this offers", "buymenu")
			addButton("Sell", "See what you can sell", "sellmenu")
		else:
			addButton("Buy", "Maybe he sells something", "askbuy")
		addButton("Leave", "Enough talking", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["announcer"])

	if(state == "askbuy"):
		setFlag("FightClubModule.AnnouncerAskedAboutShop", true)
		
		saynn("[say=pc]Do you sell anything?[/say]")
		
		saynn("The guy rubs his chin while eyeing you out.")

		saynn("[say=announcer]Perhaps. Looking for something to spice up your love life? I've got just the thing. [/say]")
		
		saynn("You raise a brow.")
		
		saynn("[say=pc]What are we talking about here?[/say]")
		
		saynn("The guy chuckles.")
		
		saynn("[say=announcer]Fetish gear and toys. Things that staff don't want us to have. I got it all, baby.[/say]")

		saynn("[say=pc]I'll have to think about it. How much are we talking?[/say]")
		
		saynn("[say=announcer]Prices vary depending on the item. Why don't you take a look at my inventory and we can go from there?[/say]")
		
		addButton("Inventory", "Take a look", "buymenu")
		addButton("Nah", "You're good", "")

	if(state == "buymenu"):
		saynn("The announcer shows what he can sell you:")
		
		for itemID in sortedItemsIds:
			var item = sellItemsData[itemID]
			var itemName = item["name"]
			if(item["amount"] > 1):
				itemName = str(item["amount"])+"x"+itemName
			
			sayn(itemName+", "+str(item["price"])+" credits")
			
			if(GM.pc.getCredits() >= item["price"]):
				addButton(itemName, str(item["price"]) + " credits\n" + item["desc"], "buy", [itemID])
			else:
				addDisabledButton(itemName, str(item["price"]) + " credits\n" + item["desc"])
		
		addButton("Back", "Don't buy anything", "")

	if(state == "sellmenu"):
		saynn("Here is what you can sell to the Announcer:")
		
		for item in GM.pc.getInventory().getItems():
			if(item.canSell()):
				sayn(item.getStackName() + " - " + str(item.getSellPrice())+" credits")
				
				addButton(item.getStackName(), str(item.getSellPrice()) + " credits\n" + item.getVisisbleDescription(), "sell", [item])
		
		addButton("Back", "Don't sell anything", "")

	if(state == "talk"):
		saynn("[say=pc]Just wanted to talk, ask some things.[/say]")

		saynn("The guy leans against his fancy cane.")

		saynn("[say=announcer]Shoot.[/say]")

		addButton("Name", "Why is he called like that", "name")
		addButton("Staff", "Ask what happens if staff finds this place", "staff")
		addButton("Avy", "Ask about Avy", "avy")
		addButton("Back", "Enough questions", "")

	if(state == "name"):
		saynn("[say=pc]Why ‘The Announcer’?[/say]")

		saynn("He chuckles.")

		saynn("[say=announcer]Because of my voice I guess. Others just began calling me like that and I went with the flow.[/say]")

		saynn("[say=pc]Your voice would be perfect for radio.[/say]")

		saynn("He scratches the back of his head and smiles wider.")

		saynn("[say=announcer]Nah, I’m not a radio person, baby. Thanks anyway.[/say]")

		saynn("[say=pc]Who are you then? How did you end up here?[/say]")

		saynn("He looks down at his lilac clothes.")

		saynn("[say=announcer]Thought it was obvious. I’m a pimp, baby. I used to live on the streets, used to look after my girls. On a green ball of dirt called ‘The Earth’. Though right now the more fitting name for it would be ‘The Wasteland’[/say]")

		addButton("Continue", "Ask something else", "talk")

	if(state == "staff"):
		saynn("[say=pc]This place isn’t exactly legal. What will happen if the staff finds it?[/say]")

		saynn("The guy looks around.")

		saynn("[say=announcer]I have very little doubts about them not knowing about my place. I guess they prefer to look the other way? Your guess is as good as mine.[/say]")

		addButton("Continue", "Ask something else", "talk")

	if(state == "avy"):
		saynn("[say=pc]Who is Avy?[/say]")

		saynn("The guy leans on his cane.")

		saynn("[say=announcer]She handles organizing the fights. And she is also the grand champion of the arena. I guess I know how to pick the right person for the job.[/say]")

		saynn("[say=pc]No one has beaten her?[/say]")

		saynn("[say=announcer]Many tried. Some even succeeded. But she always returns, each time stronger than before.[/say]")

		addButton("Continue", "Ask something else", "talk")


func _react(_action: String, _args):
	if(_action in ["talk", "name", "staff", "avy"]):
		processTime(RNG.randi_range(5, 10) * 60)
	
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)

	if(_action == "buy"):
		var itemID = _args[0]
		var item = sellItemsData[itemID]
		var itemName = item["name"]
		if(item["amount"] > 1):
			itemName = str(item["amount"])+"x"+itemName
		
		var itemObject = GlobalRegistry.createItem(itemID)
		if(item["amount"] > 1):
			itemObject.setAmount(item["amount"])
		GM.pc.getInventory().addItem(itemObject)
		GM.pc.addCredits(-sellItemsData[itemID]["price"])

		
		addMessage(""+itemName+" was added to your inventory")
		
		setState("")
		return

	if(_action == "sell"):
		var item = _args[0]
		
		GM.pc.addCredits(item.getSellPrice())
		GM.pc.getInventory().removeXFromItemOrDelete(item, 1)
		
		addMessage("1x"+item.getVisibleName()+" was sold for "+str(item.getSellPrice()) + " credits")
		
		setState("")
		return

func loadData(data):
	.loadData(data)
	
	updateSellingItems()
