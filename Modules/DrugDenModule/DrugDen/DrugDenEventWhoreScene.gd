extends "res://Modules/DrugDenModule/DrugDen/DrugDenEncounterTemplateScene.gd"

var offerItemID:String = ""

func _init():
	sceneID = "DrugDenEventWhoreScene"

func _reactInit():
	npcID = generateJunkieNPCID()
	addCharacter(npcID)
	#startFightWithNPC()
	
	var theLoot = {
		"appleitem": 1.0,
		"painkillers": 0.5,
		"AnaphrodisiacPill": 1.0,
		"EnergyDrink": 1.0,
		"restraintkey": 1.0,
		"TFPill": 0.5,
		"BreederPill": 0.1,
		"HeatPill": 0.1,
		"StunBaton": 0.05,
		"Shiv": 0.3,
	}
	if(GM.pc.getPainLevel() > 0.6):
		theLoot["appleitem"] *= 4.0
		theLoot["painkillers"] *= 4.0
		theLoot["Shiv"] *= 4.0
	if(GM.pc.getStaminaLevel() < 0.3):
		theLoot["EnergyDrink"] *= 4.0
		theLoot["Shiv"] *= 4.0
	if(GM.pc.hasActiveTransformations()):
		theLoot["TFUndoPill"] = 4.0
	if(GM.pc.getInventory().getEquippedItemsWithTag(ItemTag.BDSMRestraint).size() > 0):
		theLoot["restraintkey"] *= 4.0
	offerItemID = RNG.pickWeightedDict(theLoot)

func _run():
	encounter_run()
	
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		var itemRef:ItemBase = GlobalRegistry.getItemRef(offerItemID)
		var itemName:String = "an unknown item"
		if(itemRef != null):
			itemName = itemRef.getAStackName()
		
		saynn("As you step through the dimly-lit tunnels, you run into a junkie. This one doesn't seem to be aggressive towards you, huh.")
		
		saynn("[say=npc]"+RNG.pick([
			"Well, well.. look at this. Ain’t often we get fresh meat down here. I got an offer for you.",
			"That's a nice ass you got there. I got an offer for you.",
			"Stop right there, fresh blood. I got a little offer for a slut like you.",
			"You don't let off the same rotten scent that everyone else does. I got an offer for you.",
		])+"[/say]")
		
		saynn("Junkie shows you [b]"+itemName+"[/b] in {npc.his} hand.")
		
		saynn("[say=npc]"+RNG.pick([
			"I’m feeling generous. I will give you this if you bend over for me.",
			"Do you want this? Spread your legs for me.",
			"If you want this, you will have to spread your legs for me.",
		])+"[/say]")
		
		saynn("Looks like {npc.he} wants to fuck you..")
		
		addButton("Agree (Be sub)", "Might as well have some fun", "agree_sex")
		addButton("Attack", "Fight them", "startFight")
		addButton("Get lost", "Tell them to get lost", "say_get_lost")
	
	if(state == "sexSatisfied"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		var itemRef:ItemBase = GlobalRegistry.getItemRef(offerItemID)
		var itemName:String = "an unknown item"
		if(itemRef != null):
			itemName = itemRef.getAStackName()
		
		saynn("After the sex, the junkie gives you "+itemName+"!")
		
		saynn("[say=npc]"+RNG.pick([
			"Not bad for a cheap whore.",
			"Here is your prize, little whore.",
			"You earned it, little whore.",
			"I hope I will run into you again, little slut.",
			"Good slut. Here you go.",
		])+"[/say]")
		
		addButton("Continue", "Time to go", "endthescene")
	
	if(state == "sexNotSatisfied"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		
		saynn("The junkie refuses to give you the item!")
		
		saynn("[say=npc]"+RNG.pick([
			"That sucked! Fuck you, go away.",
			"You're such a bad whore, why would I give you anything.",
			"Fuck off, you suck as a whore.",
		])+"[/say]")
		
		
		addButton("Leave", "Oh well", "endthescene")
		addButton("Attack", "Fight them", "startFight")
	
	if(state == "say_get_lost"):
		saynn("You tell {npc.him} to get lost and continue on your way.")
		
		addButton("Leave", "Time to go", "endthescene")
	
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "startFight"):
		startFightWithNPC("DrugDenWhoreAttack")
		return
	if(_action == "agree_sex"):
		runScene("GenericSexScene", [npcID, "pc", SexType.DefaultSex, {bondageDisabled=true}], "prostitutionSex")
		return
	if(encounter_react(_action, _args)):
		return
	
	setState(_action)

func _react_scene_end(_tag, _result):
	._react_scene_end(_tag, _result)
	
	if(_tag == "prostitutionSex"):
		var sexResult:Dictionary = _result[0]
		var domSatisfaciton:float = sexResult["doms"][npcID]["satisfaction"]
		
		var gotUncon:bool = false
		if(sexResult.has("subs")):
			var subs:Dictionary = sexResult["subs"]
			if(subs.has("pc")):
				var info:Dictionary = subs["pc"]
				if(info.has("isUnconscious") && info["isUnconscious"]):
					gotUncon = true
		
		if(gotUncon):
			setState("encounter_fully_rekt")
			return
		
		if(domSatisfaciton >= 0.9):
			setState("sexSatisfied")
			
			GM.pc.getInventory().addItem(GlobalRegistry.createItem(offerItemID))
		else:
			setState("sexNotSatisfied")
		
		
func saveData():
	var data = .saveData()
	
	data["offerItemID"] = offerItemID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	offerItemID = SAVE.loadVar(data, "offerItemID", "")
