extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npcVariation = ""
var startLocation = ""
var endLocation = ""
var headingBack = false
var path = []

const possibleEndLocations = [
		"eng_workshop",
		"med_lobbymain",
		"mining_shafts_entering",
		"gym_weights",
		"yard_waterfall",
		"main_laundry",
		"main_bench4",
		"hall_canteen",
	]
	
const descriptionsPolite = {
	"eng_workshop": "I've left my card in one of the workshop machines yesterday and if the cameras spot me the whole time will get counted against my allowance! Can you fetch it for me?",
	"med_lobbymain": "I need to pick up some meds but Quinn creeps me out. Can you get them for me?", 
	"mining_shafts_entering": "I've forgotten to pick up my credits from the latest shift in the mines. Can you pick them up for me?", 
	"gym_weights": "I've left my towel in the gym. Fetch it for me, please?",
	"yard_waterfall": "I've dropped a trinket of mine somewhere near the waterfall in the yard. Find it for me, please?",
	"main_laundry": "Can you pick up my laundry? It should be done drying by now.",
	"main_bench4": "I've lost a trinket of mine somewhere in the main hall. Could you find it for me, please?",
	"hall_canteen": "Bring me my next lunch. I have a deal with the cafeteria staff, they'll bag it up for you."
}

const descriptionsDemanding = {
	"eng_workshop": "I'm logged in one of the workshop machines. Go take care of it.",
	"med_lobbymain": "I need some meds picked up.", 
	"mining_shafts_entering": "Pick up my creds from the mines. Don't even think about nicking any.", 
	"gym_weights": "Go get my towel from the gym.",
	"yard_waterfall": "Left a thing of mine near that waterfall in the yard. Bring it to me.",
	"main_laundry": "Pick up my laundry. I want it spotless.",
	"main_bench4": "Some gear of mine went missing in the main hall. Find it.",
	"hall_canteen": "Bring me my next lunch. The cafeteria staff will bag it up."
}
	
func _init():
	sceneID = "HypnoEncounterFetch"
	
func _initScene(_args = []):
	npcID = _args[0]
	var npc = GlobalRegistry.getCharacter(npcID)
	
	var personality:Personality = npc.getPersonality()
	if(personality.getStat(PersonalityStat.Mean) > 0.3 || personality.getStat(PersonalityStat.Subby) < -0.6):
		npcVariation = "mean"
	if(personality.getStat(PersonalityStat.Mean) < -0.3):
		npcVariation = "kind"
	if(personality.getStat(PersonalityStat.Subby) > 0.6 || personality.getStat(PersonalityStat.Coward) > 0.8):
		npcVariation = "subby"
		
	startLocation = GM.pc.getLocation()
	
	var eligibleEndLocations = []
	for loc in possibleEndLocations:
		var candidatePath = GM.world.calculatePath(startLocation, loc)
		if(candidatePath.size() > 4): #avoid nonexistent or too short paths
			var pathWeight = 1.0 / candidatePath.size()
			eligibleEndLocations.append([loc, pathWeight])
	endLocation = RNG.pickWeightedPairs(eligibleEndLocations)
	path = GM.world.calculatePath(startLocation, endLocation)
	
func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	var npc: BaseCharacter = GlobalRegistry.getCharacter(npcID)
	npc = npc #dont bother me godot		
	
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID})
		# (default)
		if(!(npcVariation in ["mean", "kind", "subby"])):

			saynn("[say=npc]"+RNG.pick([
				"You like being useful, right?",
				"I've got something for you to do.",
				"You want to serve me?",
			])+"[/say]")
			
		# (mean version)
		if(npcVariation == "mean"):

			saynn("[say=npc]"+RNG.pick([
				"You're gonna do something for me.",
				"Make yourself useful.",
				"Time to serve, slut."
			])+"[/say]")

		# (kind version)
		if(npcVariation == "kind"):
			
			saynn("[say=npc]"+RNG.pick([
				"You have some time, right?",
				"You wouldn't mind doing something for me, right?",
			])+"[/say]")
			
		# (subby version)
		if(npcVariation == "subby"):
			saynn("[say=npc]"+RNG.pick([
				"Please, can you help me?",
				"Can you help me out~?",
				"Would you do something for me? I'll make it worth your while...",
			])+"[/say]")
			
		saynn("Your thoughs murk over with the desire to serve.")
			
		saynn("[say=pc]Yes...[/say]")
		
		if(npcVariation in ["kind", "subby"]):
			saynn("[say=npc]"+descriptionsPolite[endLocation]+"[/say]")
		elif(npcVariation == "mean"):
			saynn("[say=npc]"+descriptionsDemanding[endLocation]+"[/say]")
		else:
			if(RNG.randi_range(0,100) > 50):
				saynn("[say=npc]"+descriptionsPolite[endLocation]+"[/say]")
			else:
				saynn("[say=npc]"+descriptionsDemanding[endLocation]+"[/say]")
		
		saynn("Compelled to obey, you...")
		HypnokinkUtil.addUnresistableHypnoButtons(self, "moving_towards", ["Head out", "Get moving", "Fetch"])
	
	if(state == "moving_towards" || state == "moving_back"):
		removeCharacter(npcID)
		playAnimation(StageScene.Solo, "walk")
		if(path.size() > 0):
			aimCameraAndSetLocName(path[0])
		
		var _roomInfo = GM.world.getRoomByID(path[0])
		
		var adjective = RNG.pick(["purposefully", "obediently", "docilely", "slavishly"])
		saynn("You "+adjective+" walk towards your destination.")
		
		if(_roomInfo == null):
			pass
		else:
			if(GM.pc.isBlindfolded() && !GM.pc.canHandleBlindness()):
				saynn(_roomInfo.getBlindDescription())
			else:
				saynn(_roomInfo.getDescription())
				
		addButton("Skip", "Fade into trance", "skip_towards")
		HypnokinkUtil.addHypnoButtons(self, "moving_towards", "resist", ["Fetch", "Move"], ["Stop", "Resist"], 1)
		
	if (state == "arrive"):
		saynn("You retrieve what you came for.")
		
		addButton("Retrieve", "Grab the thing", "head_back")
		
	if (state == "return"):
		saynn("You bring the item back as ordered.")
		
		if(!(npcVariation in ["mean", "kind", "subby"])):

			saynn("[say=npc]"+RNG.pick([
				"Nice!",
				"See, it's nice to feel useful!",
				"There's a good {pc.boy}.",
			])+"[/say]")
			
			saynn("{npc.He} {npc.verb('take')} your delivery and {npc.verb('walk')} away.")
			
		# (mean version)
		if(npcVariation == "mean"):
			saynn("[say=npc]"+RNG.pick([
				"Figures you'd know how to fetch, bitch.",
				"About time.",
				"What took you so long?"
			])+"[/say]")
			
			saynn("{npc.He} roughly {npc.verb('snatch', 'snatches')} your delivery and {npc.verb('stroll')} off without another word.")

		# (kind version)
		if(npcVariation == "kind"):
			
			saynn("[say=npc]"+RNG.pick([
				"Wow, you can really hustle!",
				"What a good {pc.boy}!",
			])+"[/say]")
			
			saynn("{npc.He} playfully {npc.verb('scratch', 'scratches')} you on the chin, {npc.verb('take')} your delivery and {npc.verb('walk')} away.")
			
		# (subby version)
		if(npcVariation == "subby"):
			saynn("[say=npc]"+RNG.pick([
				"Thank you so much!",
				"My hero!",
				"I'll have to make sure to thank you properly later~",
			])+"[/say]")
			
			saynn("{npc.He} cheerfully {npc.verb('take')} your delivery and skips off.")
		
		saynn("You bask in the satisfaction of a job well done.")
		addButton("Nice", "", "endthescene")
		
	if (state == "resist"):
		saynn("You stop and shudder in place, on the brink of breaking the spell.")
		saynn("[say=pc]"+RNG.pick([
			"Wait, what am I...", 
			"Where am I...", 
			"Why am I...", 
			"Wait a minute-", 
			"But why should I-"
			])+"[/say]")
		
		saynn("Now that you've established you [i]can[/i] stop, you really should just...")
		HypnokinkUtil.addHypnoButtons(self, "moving_towards", "resist_2", ["Fetch", "Move"], ["Stop", "Resist"], 1)
	if (state == "resist_2"):
		removeCharacter(npcID)
		playAnimation(StageScene.Solo, "stand")
		
		saynn("You manage to shake it off. Better go before {npc.name} finds you again.")

		# (scene ends)
		addButton("Leave", "Time to go", "endthescene")
		
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "skip_towards"):
		while path.size() > 0:
			HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(1,3))
			processTime(1 * 60)
			path.remove(0)
		if(!headingBack):
			setState("arrive")
			aimCamera(endLocation)
			GM.pc.setLocation(endLocation)
		else:
			setState("return")
			aimCamera(startLocation)
			GM.pc.setLocation(startLocation)
		return
	
	if(_action == "moving_towards"):
		HypnokinkUtil.changeSuggestibilityBy(GM.pc, RNG.randi_range(1,3))
		processTime(1 * 60)
		var nextLoc = path[0]
		path.remove(0)
		
		if(!GM.world.hasRoomID(nextLoc)):
			endScene()
			return
		
		GM.pc.setLocation(nextLoc)
		aimCamera(nextLoc)
		if(path.size() == 0):
			if(!headingBack):
				setState("arrive")
			else:
				setState("return")
			return
			
	if(_action == "head_back"):
		headingBack = true
		path = GM.world.calculatePath(endLocation, startLocation)
		setState("moving_towards")
		return
		
	if(_action == "arrive"):
		aimCamera(endLocation)
		GM.pc.setLocation(endLocation)
		
	if(_action == "return"):
		aimCamera(startLocation)
		GM.pc.setLocation(startLocation)
		GM.pc.addSkillExperience(Skill.Hypnosis, 5)
		
	
	setState(_action)

func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["npcVariation"] = npcVariation
	data["startLocation"] = startLocation
	data["endLocation"] = endLocation
	data["path"] = path
	data["headingBack"] = headingBack

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npcVariation = SAVE.loadVar(data, "npcVariation", "")
	startLocation = SAVE.loadVar(data, "startLocation", "")
	endLocation = SAVE.loadVar(data, "endLocation", "")
	headingBack = SAVE.loadVar(data, "headingBack", false)
	path = SAVE.loadVar(data, "path", [])
