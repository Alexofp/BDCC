extends "res://Scenes/SceneBase.gd"

var npcID = ""

func _init():
	sceneID = "KidnapDynamicNpcScene"

func _initScene(_args = []):
	npcID = _args[0]
	#var npc = GlobalRegistry.getCharacter(npcID)
	
	
func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID})

		var npc:BaseCharacter = GlobalRegistry.getCharacter(npcID)
		saynn("You heavily damaged {npc.name}'s spirit. But that's only the first step. Now you have to kidnap {npc.him} into your cell where you can truly break {npc.him} and make {npc.him} your slave.")
		
		saynn("Are you sure you want to kidnap {npc.name}?")
		
		if(npc.getInventory().hasEquippedItemWithTag(ItemTag.AllowsEnslaving)):
			if(getModule("NpcSlaveryModule").hasFreeSpaceToEnslave()):
				
				if(npc.hasEnslaveQuest()):
					addButton("Do it", "Go through with it", "do_kidnap")
				else:
					saynn("What kind of slave do you want {npc.him} to be?")
					
					for slaveTypeID in GlobalRegistry.getSlaveTypes():
						var theSlaveType:SlaveTypeBase = GlobalRegistry.getSlaveType(slaveTypeID)
						if(!theSlaveType.canEnslaveAs()):
							continue
						if(!theSlaveType.canTeach(getCharacter(npcID))):
							addDisabledButton(theSlaveType.getVisibleName(), "[color=red]Incompatible with this slave[/color]\n"+theSlaveType.getVisibleDesc())
							continue
						addButton(theSlaveType.getVisibleName(), theSlaveType.getVisibleDesc(), "do_kidnap", [slaveTypeID])
					
			else:
				addDisabledButton("Do it", "You don't have enough space in your cell to store them")
		else:
			addDisabledButton("Do it", "They aren't wearing a collar! You can't kidnap people if you can't leash them")
		addButton("CANCEL", "You changed your mind", "endthescene")
		
	if(state == "do_kidnap"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcAction="hurt", npcBodyState={leashedBy="pc"}})
		
		saynn("{npc.name} is resisting but you just about manage to click a leash to {npc.his} collar!")
		
		var npc = GlobalRegistry.getCharacter(npcID)
		var personality:Personality = npc.getPersonality()
		if(personality.getStat(PersonalityStat.Mean) > 0.4):
			saynn("[say=npc]"+RNG.pick([
				"Hey, what the fuck are you doing. I will break your face, let me go.",
				"What the fuck is this, I ain't coming with you, no way, fuck off.",
				"Hey, what the fuck are you doing? I'll break your face if you think I'm just gonna follow you. Let me go, you piece of shit.",
				"What the fuck is this? I ain't coming with you, no way in hell. Just back off, you moron.",
				"Oh, fantastic. You think a leash is gonna make me your puppet? Fuck off, I'm not your plaything.",
				"Get your hands off me! Who the hell do you think you are? Leashing me won't make me your lapdog.",
				"Nice try with the leash, but I'm not your prisoner. You're gonna regret this, asshole.",
				"You seriously think leashing me will make me obedient? You're delusional. Let go, or things are gonna get ugly.",
				"You really thought I'd submit just because of a leash? Think again. Release me before I make you regret it.",
				"This leash won't change a damn thing. Let me make this crystal clear: I don't follow orders from fools. Unleash me, dumbass.",
			])+"[/say]")
		elif(personality.getStat(PersonalityStat.Subby) < -0.4):
			saynn("[say=npc]"+RNG.pick([
				"Well, well, what do we have here? Trying to play the dominant card, huh? Good luck with that, loser.",
				"Oh, how cute, you think a leash will make me your submissive? Save your amateur hour for someone who cares.",
				"Is this your attempt at dominance? Sorry, but it's gonna take more than that to impress me.",
				"Nice try, rookie. A leash doesn't make you an alpha. You'll need more than props to handle someone like me.",
				"Leashing a dominant? That's a new level of stupidity. Release me before I lose my patience with your nonsense.",
				"Impressive attempt, but leashing me won't change a thing. You've got a lot to learn about domination. Now, release me.",
			])+"[/say]")
		else:
			saynn("[say=npc]"+RNG.pick([
				"Um, what's happening? Why are you leashing me? I didn't do anything wrong. Please, let me understand.",
				"I-I don't think I deserve this. Why are you leashing me? Can we talk about it, maybe?",
				"Oh, um, I didn't expect this. Why the leash? Did I do something to upset you? Please, let's talk it out.",
				"Wait, is this necessary? I'll follow you, but leashing seems a bit extreme. Can we discuss it first?",
				"Please, I don't even know you. Let me go, I won't cause any trouble, I promise.",
				"I don't understand. Why are you taking me? I'll do whatever you want, just don't hurt me.",
				"I don't want any trouble. Please, release me. I won't tell anyone, I promise.",
				"Who are you, and why are you doing this? I can't believe this is happening. Let me go, I'm not your property!",
				"What's happening? Where are you taking me? I don't even know you! Let me go, please!",
			])+"[/say]")
		
		saynn("Time to bring {npc.him} back to your cell..")
		
		addButton("Bring to cell", "Store your slave", "bring_cell")
	
	if(state == "bring_cell"):
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={chains=[["normal", "neck", "scene", "floor"]]} })
		
		saynn("Despite {npc.his} resistance, you bring {npc.name} to your cell and then chain {npc.him} to the floor.")
		
		var npc = GlobalRegistry.getCharacter(npcID)
		var personality:Personality = npc.getPersonality()
		if(personality.getStat(PersonalityStat.Mean) > 0.4):
			saynn("[say=npc]"+RNG.pick([
				"What the hell is this?",
				"Are you fucking kidding me?",
				"Seriously? This is messed up.",
				"You've gotta be shitting me.",
				"Is this some sick joke?",
				"Un-fucking-believable.",
				"This better be a damn nightmare.",
				"This is fucked up beyond words.",
			])+"[/say]")
		elif(personality.getStat(PersonalityStat.Subby) < -0.4):
			saynn("[say=npc]"+RNG.pick([
				"Seriously? This won't end well for you.",
				"Are you for real?",
				"What the hell is this?",
				"You've got to be kidding me.",
				"This some sick joke?",
				"Is this your idea of a good time?",
				"I don't have time for your shit.",
				"Unbelievable.",
				"You're out of your damn mind.",
			])+"[/say]")
		else:
			saynn("[say=npc]"+RNG.pick([
				"Um... where am I?",
				"Hey, what's going on?",
				"Uh, why am I here?",
				"Hey... why did you bring me here?",
				"Hey, let me go!",
				"Um... who are you?",
				"Hey, this is not cool.",
				"Uh, this isn't right.",
			])+"[/say]")
		
		saynn("Now {npc.he} belongs to you! You just gotta make sure {npc.he} doesn't escape.")
		
		addButton("Continue", "Great job", "endthescene")
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
	
	if(_action == "do_kidnap"):
		if(_args.size() > 0):
			getModule("NpcSlaveryModule").doEnslaveCharacter(npcID, _args[0])
		else:
			getModule("NpcSlaveryModule").doEnslaveCharacter(npcID)


	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	
	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
