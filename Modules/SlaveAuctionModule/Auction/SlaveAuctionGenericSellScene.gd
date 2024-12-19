extends SceneBase

var slaveID = ""
var hasMirri = true
var creditsToGive = 0

func _init():
	sceneID = "SlaveAuctionGenericSellScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "slave"):
		return slaveID

func _run():
	if(state == ""):
		addCharacter("mirri")
		saynn("Which of your slaves do you want to sell? Keep in mind that you will never see them again. Any items that they have will be lost forever too.")

		addButton("Cancel", "You changed your mind", "endthescene")
		addSlaveButtons()
		if (false):
			addButton("Nope", "You shouldn't see this ever", "pick_slave")
	if(state == "confirm_pick_slave"):
		removeCharacter("mirri")
		addCharacter(slaveID)
		addCharacter("mirri")
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
		if (!getFlag("SlaveAuctionModule.beganAuctionOnce")):
			saynn("You make your choice.")

			saynn("[say=mirri]I will bring {slave.him}, don't worry.[/say]")

			saynn("[say=pc]You're so nice.[/say]")

			saynn("[say=mirri]Aww, thank you. I love it when you say that.[/say]")

			saynn("Mirri disappears inside a blue rift.. before quickly jumping out again, her hand holding a leash connected to your slave's collar. She hands the leash to you.")

			saynn("[say=mirri]The more credits I earn, the higher my slaver reputation will be. And that's what you and I want.[/say]")

			saynn("Sell slaves, get more rep..")

			saynn("[say=mirri]So let's do it![/say]")

		else:
			saynn("You make your choice. Mirri nods and uses her teleporter to quickly bring you the slave.")

			saynn("[say=mirri]Let's do it![/say]")

		addButton("Market", "Secure the slave on the stage", "go_market")
	if(state == "go_market"):
		aimCameraAndSetLocName("market_market")
		saynn("You bring {slave.name} to the market and secure {slave.him}, chaining {slave.his} wrists together and attaching chains that make your slave stand on {slave.his} {slave.toes}.")

		saynn("The chatter begins to fill the void.. You put on the headset and get into the position.")

		saynn("[say=pc]Picking me up?[/say]")

		saynn("[say=mirri]Five by five.[/say]")

		saynn("Mirri takes a spot on her presenter platform and gets ready too.")

		saynn("[say=mirri]"+str(RNG.pick(["Alright. Time to shine.", "Let's get this bread.", "Time to do this.", "No one but us.", "Teamwork makes the dream work."]) )+"[/say]")

		saynn("The auction is about to begin..")

		addButton("Slave auction", "Begin the minigame", "start_auction_minigame")
	if(state == "failed_to_sell"):
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc=slaveID, npcBodyState={leashedBy="mirri"}})
		if (!getFlag("SlaveAuctionModule.failedAuctionOnce")):
			saynn("The auction has ended.. but no one decided to buy your slave..")

			saynn("Bidders leave, the curtains close.. the eerie silence returns.")

			saynn("You see Mirri detaching the chain and leashing your slave.. before proceeding to walk somewhere. Huh?")

			saynn("You rush to her.")

			saynn("[say=pc]Hey, where are you taking {slave.him}?[/say]")

			saynn("[say=mirri]Well, you suck so nobody bought {slave.him}.[/say]")

			saynn("You block the path.")

			saynn("[say=pc]But where are you taking {slave.him} now?[/say]")

			saynn("Mirri tilts her head.")

			saynn("[say=mirri]Since the last time this happened we found.. let's say.. a new way to utilize the slaves~.[/say]")

			saynn("[say=pc]What way? What are you gonna do?[/say]")

			saynn("[say=mirri]It's not your problem anymore, {pc.name}, relax.[/say]")

			saynn("Sounds very concerning..")

			saynn("[say=mirri]Listen, obviously I can't let you bring this slave back to your stupid prison, {slave.he} knows too much about this place.[/say]")

			saynn("Mirri gently scratches {slave.name}'s chin.")

			saynn("[say=mirri]So.. this is the next best option. You obviously won't get paid since you.. failed so spectacularly.. but I do get a hundred creds to my name at least~.[/say]")

			saynn("All this sounds so.. wrong. But the more you block the path, the more Mirri begins to reach for her gun.")

			saynn("[say=mirri]Which part of my explanation did you not understand?[/say]")

			saynn("[say=pc]Fine. But what will happen to {slave.him}?[/say]")

			saynn("You take a step to the side.. Mirri walks past you.. holding the leash to your slave.")

			saynn("[say=mirri]Ohh.. You don't wanna know.[/say]")

			saynn("As Mirri steps out the room.. you get the last glimpse of your slave.. before the wall obscures {slave.him}..")

		else:
			saynn("The auction has ended.. but no one decided to buy your slave..")

			saynn("Bidders leave, the curtains close.. the eerie silence returns.")

			saynn("You know what will happen so you don't intervene. You just let Mirri leash your slave.. and take {slave.him} somewhere..")

			saynn("As Mirri steps out the room.. you get the last glimpse of your slave.. before the wall obscures {slave.him}..")

		addButton("Continue", "Goodbye slave..", "delete_slave")
	if(state == "after_sold"):
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc=slaveID, npcBodyState={leashedBy="mirri"}})
		saynn("After a successful auction, Mirri unchains the slave's wrists and then hands the leash to a few faceless attendants who bring {slave.name} to {slave.his} new owner..")

		saynn("As the curtains begin to close, you get a last glimpse of your slave.")

		addButton("Continue", "Goodbye slave..", "do_sell_slave_succ")
	if(state == "do_sell_slave_succ"):
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Mirri approaches you and hands you a credits chip.")

		saynn("[say=mirri]"+str(RNG.pick(["Here is your cut, big {pc.girl}.", "Your cut, pretty {pc.girl}.", "Your "+str(getModule("SlaveAuctionModule").getPCCut()*100)+"%, tough {pc.girl}.", "Please doing business, big {pc.girl}."]))+"[/say]")

		saynn("As you take it, the catgirl just walks back to her room.")

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
		setFlag("SlaveAuctionModule.beganAuctionOnce", true)

	if(_action == "start_auction_minigame"):
		runScene("SlaveAuctionScene", [slaveID, getModule("SlaveAuctionModule").getAuctionSettings()], "slave_auction")
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
	data["hasMirri"] = hasMirri
	data["creditsToGive"] = creditsToGive

	return data

func loadData(data):
	.loadData(data)

	slaveID = SAVE.loadVar(data, "slaveID", "")
	hasMirri = SAVE.loadVar(data, "hasMirri", true)
	creditsToGive = SAVE.loadVar(data, "creditsToGive", 0)
