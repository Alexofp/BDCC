extends SceneBase

var slaveID = ""
var creditsToGive = 0

func _init():
	sceneID = "SlaveAuctionGenericSellNoMirriScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "slave"):
		return slaveID

func _run():
	if(state == ""):
		saynn("Which of your slaves do you want to sell? Keep in mind that you will never see them again. Any items that they have will be lost forever too.")

		addButton("Cancel", "You changed your mind", "endthescene")
		addSlaveButtons()
		if (false):
			addButton("Nope", "You shouldn't see this ever", "pick_slave")
	if(state == "confirm_pick_slave"):
		addCharacter(slaveID)
		playAnimation(StageScene.Duo, "stand", {npc=slaveID, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		saynn("Is {slave.name} the slave that you want to sell? Keep in mind that you will never see them again. Any items that they have will be lost forever too.")

		printSlaveTraits()
		if (getFlag("SlaveAuctionModule.upgradeSeePrefs", 0) >= 1):
			saynn("Bidders will have these preferences:")

			saynn(""+str(getModule("SlaveAuctionModule").getBidderInfo())+"")

		addButton("Confirm", "Sell this slave!", "do_confirm_pick")
		addButton("Cancel", "You changed your mind", "do_cancel_pick")
	if(state == "do_confirm_pick"):
		playAnimation(StageScene.Duo, "stand", {npc=slaveID, npcBodyState={leashedBy="pc"}})
		saynn("You make your choice and use your teleporter to bring the slave here.")

		addButton("Market", "Secure the slave on the stage", "go_market")
	if(state == "go_market"):
		aimCameraAndSetLocName("market_market")
		saynn("You secure {slave.name}, chaining {slave.his} wrists together and attaching chains that make your slave stand on {slave.his} {slave.toes}.")

		saynn("The chatter begins to fill the void.. Bidders are arriving.")

		saynn("You take a spot on her presenter platform and get ready.")

		saynn("[say=pc]"+str(RNG.pick(["Alright. Time to shine.", "Let's get this bread.", "Time to do this.", "No one but me.", "Show time."]) )+"[/say]")

		saynn("The auction is about to begin..")

		addButton("Slave auction", "Begin the minigame", "start_auction_minigame")
	if(state == "failed_to_sell"):
		playAnimation(StageScene.Duo, "stand", {pc="pc", npc=slaveID, npcBodyState={leashedBy="pc"}})
		saynn("The auction has ended.. but no one decided to buy your slave..")

		saynn("Bidders leave, the curtains close.. the eerie silence returns.")

		saynn("You know what will happen so you don't intervene. You just leash your slave.. and hand {slave.him} to the staff that quickly take {slave.him} somewhere..")

		saynn("You get the last glimpse of your slave.. before the wall obscures {slave.him}..")

		addButton("Continue", "Goodbye slave..", "delete_slave")
	if(state == "after_sold"):
		playAnimation(StageScene.Duo, "stand", {pc="pc", npc=slaveID, npcBodyState={leashedBy="pc"}})
		saynn("After a successful auction, you unchain the slave's wrists and then hand the leash to a few faceless attendants who bring {slave.name} to {slave.his} new owner..")

		saynn("As the curtains begin to close, you get a last glimpse of your slave.")

		addButton("Continue", "Goodbye slave..", "do_sell_slave_succ")
	if(state == "do_sell_slave_succ"):
		playAnimation(StageScene.Duo, "stand", {npc="luxe"})
		addCharacter("luxe")
		saynn("Luxe approaches you and hands you a credits chip.")

		saynn("[say=luxe]Here. Your cut.[/say]")

		saynn("As you take it, the wolf just walks back to his office.")

		addButton("Continue", "See what happens next", "endthescene")
func addSlaveButtons():
	var slaves = GM.main.getDynamicCharacterIDsFromPool(CharacterPool.Slaves)
	for charID in slaves:
		var character:DynamicCharacter = getCharacter(charID)
		var npcSlavery:NpcSlave = character.getNpcSlavery()
		if(npcSlavery == null):
			continue
		if(npcSlavery.isDoingActivity()):
			addDisabledButton(character.getName(), "This slave is currently busy")
			continue
		addButton(character.getName(), character.getSmallDescription(), "pick_slave", [charID])

func printSlaveTraits():
	sayn("{slave.name}'s traits:")
	var slaveTraits = SlaveAuction.calculateSlaveTraitsStatic(getCharacter(slaveID))
	for traitID in slaveTraits:
		var score:float = slaveTraits[traitID]
		var trait:AuctionTrait = GlobalRegistry.getAuctionTrait(traitID)
		if(score > 0.0):
			var theName:String = trait.getName(traitID)
			sayn("- "+theName+": "+str(Util.roundF(score*100.0, 1))+"%")
	sayn("")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "pick_slave"):
		slaveID = _args[0]
		setState("confirm_pick_slave")
		return

	if(_action == "do_confirm_pick"):
		processTime(5*60)

	if(_action == "do_cancel_pick"):
		removeCharacter(slaveID)
		slaveID = ""
		setState("")
		return

	if(_action == "go_market"):
		processTime(5*60)

	if(_action == "start_auction_minigame"):
		runScene("SlaveAuctionScene", [slaveID, getModule("SlaveAuctionModule").getAuctionSettings(), "pc"], "slave_auction")
		return

	if(_action == "delete_slave"):
		setFlag("SlaveAuctionModule.failedAuctionOnce", true)
		removeCharacter(slaveID)
		getModule("SlaveAuctionModule").sellToAuction(slaveID)
		getModule("SlaveAuctionModule").addRepCredits(100)
		endScene()
		return

	if(_action == "do_sell_slave_succ"):
		removeCharacter(slaveID)
		getModule("SlaveAuctionModule").sellToSlavery(slaveID)
		GM.pc.addCredits(creditsToGive)
		addMessage("You received "+str(creditsToGive)+" credits.")

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "slave_auction"):
		processTime(2 * 60)
		var wasSold = _result[0]["wasSold"] if (_result.size() > 0 && _result[0].has("wasSold")) else true
		
		if(wasSold):
			var creditsAmount:int = _result[0]["winningBid"]
			getModule("SlaveAuctionModule").addRepCredits(creditsAmount)
			var pcNewCredits:int = int(round(float(creditsAmount) * getModule("SlaveAuctionModule").getPCCut()))
			creditsToGive = pcNewCredits
			if(getModule("SlaveAuctionModule").isReadyToAdvanceRepLevel()):
				addMessage("You are ready to advance your and Mirri's slaver reputation level. Talk with her when you are ready.")
			getModule("SlaveAuctionModule").onSlaveSold(getCharacter(slaveID), creditsAmount)
			setState("after_sold")
		
		else:
			setState("failed_to_sell")

func saveData():
	var data = .saveData()

	data["slaveID"] = slaveID
	data["creditsToGive"] = creditsToGive

	return data

func loadData(data):
	.loadData(data)

	slaveID = SAVE.loadVar(data, "slaveID", "")
	creditsToGive = SAVE.loadVar(data, "creditsToGive", 0)
