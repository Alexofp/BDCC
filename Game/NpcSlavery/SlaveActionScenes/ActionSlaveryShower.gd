extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter
var isFastServing = false

var deservesPunishment = false

func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)
	if(_args.size() > 2 && _args[2] != null):
		isFastServing = true

func _reactInit():
	if(isFastServing):
		addCharacter(npcID)
		setState("sub_shower_pc")
		GM.pc.afterTakingAShower()
		getCharacter(npcID).afterTakingAShower()
		GM.pc.addStamina(200)
		GM.pc.addPain(-200)

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "ActionSlaveryShower"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.Duo, "stand", {npc=npcID, npcBodyState={leashedBy="pc"}})
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		
		saynn("You are standing in the dressing room with {npc.name}.")
		
		saynn("How do you want {npc.him} to shower?")
		
		addButton("Alone", "Just watch it", "shower_alone")
		if(npcSlavery.getObedience() < 0.3 && npcSlavery.getLove() < 0.3):
			addDisabledButton("Together", "Your slave is not obedient enough")
		else:
			addButton("Together", "Shower together with your slave", "shower_together")
		if(npcSlavery.getSlaveSkill(SlaveType.Submissive) >= 4):
			addButton("Sub's care", "Let your slave shower you", "sub_shower_pc")
		else:
			addDisabledButton("Sub's care", "Requires Submissive skill of at least rank D")

		addButton("Cancel", "You changed your mind", "endthescene")

	if(state == "sub_shower_pc"):
		if(GM.pc.getLocation() == "main_dressing2"):
			aimCameraAndSetLocName("main_shower2")
		else:
			aimCameraAndSetLocName("main_shower1")
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		playAnimation(StageScene.SexStanding, "tease", {pc=npcID, npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})

		var subReaction = "Okay."
		
		if(npcSlavery.isActivelyResisting()):
			subReaction = RNG.pick([
				"Do I have to? Whatever..",
				"Let's get it over with..",
				"..fine.",
			])
		elif(npcSlavery.getAwareness() > 0.7):
			subReaction = RNG.pick([
				"Yes, {npc.pcOwner}.",
			])
		else:
			subReaction = RNG.pick([
				"Sure.",
				"Okay.",
			])

		if(isFastServing):
			saynn("You tell {npc.name} that you could use a shower.")
			
			saynn("[say=npc]"+subReaction+"[/say]")
			
			saynn("Your submissive brings you to one of the dressing rooms, before beginning the ritual of undressing you.")
		else:
			saynn("You tell {npc.name} that today it's {npc.his} job to wash you.")
			
			saynn("[say=npc]"+subReaction+"[/say]")
			
			saynn("After a short pause, your submissive begins the ritual of undressing you.")
		
		saynn("When all the clothes are off, {npc.name} guides you further into the showers room. {npc.He} takes the role of a caretaker and begins by carefully washing your hair.")
			
		saynn("The water is cold as usual but {npc.his} touch feels warm and pleasant. As {npc.his} fingers work through the strands, you feel comfort. Then {npc.he} moves down to your neck and shoulders, washing away any dirt and dried up fluids.")
		
		if(npcSlavery.getLove() < 0.5 && npcSlavery.getObedience() < 0.5):
			saynn("{npc.He} doesn’t dare.. or is not eager enough.. to touch your chest, so {npc.he} avoids your {pc.breasts} and instead just focuses on washing your {pc.masc} back and sides. At least {npc.he} {npc.isAre} doing a good job there, you feel the tension in your muscles going away.")

			if(GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
				saynn("Your sub hesitates to touch your {pc.penis} too, just quickly washing around it, sliding {npc.his} hands over your {pc.thick} thighs and legs. Maybe {npc.he} needs some more training. Either way, you are clean by the end of it, just not exactly satisfied.")
			elif(GM.pc.hasReachableVagina()):
				saynn("Your sub hesitates to touch your pussy too, just quickly washing around it, sliding {npc.his} hands over your {pc.thick} thighs and legs. Maybe {npc.he} needs some more training. Either way, you are clean by the end of it, just not exactly satisfied.")
			else:
				saynn("Your sub hesitates to touch your other private bits too, just quickly washing around, sliding {npc.his} hands over your {pc.thick} thighs and legs. Maybe {npc.he} needs some more training. Either way, you are clean by the end of it, just not exactly satisfied.")
		else:
			saynn("With a delicate touch, {npc.he} follows the contours of your {pc.breasts}, {npc.his} palms brushing over your"+(" lactating" if GM.pc.isLactating() else "")+" nips. Then {npc.he} gives some attention to your {pc.masc} back and sides too, properly washing everywhere, even under your armpits. You feel the tension in your muscles going away.")
			
			if(GM.pc.isWearingChastityCage()):
				saynn("After washing the back, your sub’s hands slide down over your"+(" big pregnant" if GM.pc.isVisiblyPregnant() else "")+" belly and reach your {pc.penis}. The touch is tender enough for you to just let {npc.him} do it, {npc.his} digits carefully slide over your chastity cage and reach as close to your member as they can, trying to make sure every nook and cranny is clean.")
			elif(GM.pc.hasReachablePenis()):
				saynn("After washing the back, your sub’s hands slide down over your"+(" big pregnant" if GM.pc.isVisiblyPregnant() else "")+" belly and reach your {pc.penis}. The touch is tender enough for you to just let {npc.him} do it, {npc.his} digits carefully slide over the sensitive skin and make sure every nook and cranny is clean.")
			elif(GM.pc.hasReachableVagina()):
				saynn("After washing the back, your sub’s hands slide down over your"+(" big pregnant" if GM.pc.isVisiblyPregnant() else "")+" belly and reach your {pc.vaginaStretch} pussy. The touch is tender enough for you to just let {npc.him} do it, {npc.his} digits carefully slide over the sensitive skin and make sure every nook and cranny there is clean.")
			else:
				saynn("After washing the back, your sub’s hands slide down over your"+(" big pregnant" if GM.pc.isVisiblyPregnant() else "")+" belly and reach your crotch. The touch is tender enough for you to just let {npc.him} do it, {npc.his} digits carefully slide over the sensitive skin and make sure everywhere between your legs is clean.")
		
		saynn("Both you and your sub are now clean on the outside.")
		
		addButton("Enough", "Enough showering", "endthescene")
		if(npcSlavery.getSlaveSkill(SlaveType.Submissive) >= 10):
			if(GM.pc.hasEffect(StatusEffect.HasCumInsideAnus) || GM.pc.hasEffect(StatusEffect.HasCumInsideVagina)):
				addButton("Inside", "Order to clean inside too", "sub_cleans_inside_pc")
			else:
				addDisabledButton("Inside", "You don't have anything that the sub can clean")
		else:
			addDisabledButton("Inside", "Submissive skill rank A- or higher required")
		
	if(state == "sub_cleans_inside_pc"):
		if(GM.pc.hasEffect(StatusEffect.HasCumInsideVagina)):
			playAnimation(StageScene.SexOral, "lick", {pc="pc", npc=npcID, pcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
			
			saynn("Your sub’s eyes sparkle when you order {npc.him} that you need your pussy clean too. Rather than doing it with {npc.his} hands, your submissive decides to get on {npc.his} knees before you. {npc.His} palms land on the inner sides of your thighs and gently push them aside, allowing {npc.him} to dig {npc.his} face into your messy pussy slit.")
			
			saynn("{npc.He} slips {npc.his} tongue past your sensitive lips and eagerly starts lapping away at your inner walls, trying to gather as much mess as {npc.he} can into {npc.his} mouth.")
			
			if(GM.pc.hasEffect(StatusEffect.HasCumInsideAnus)):
				saynn("While working on your pussy, {npc.his} hands spread your butt cheeks and help your butt leak fluids, {npc.his} tongue is making you clench and relax a lot, accelerating the process.")
				
			saynn("Each caress and calculated movement brings you closer and closer.. Until a quick little orgasm overwhelms you, your pussy releasing a shower of fluids onto your sub’s face.. until the other shower quickly cleans it again.")
			
			saynn("After all that, your sub spits all the collected mess out directly into the drain. It would be too gross to swallow it anyway.")
			
			GM.pc.clearOrificeFluidsCheckBlocked()
		else:
			GM.pc.clearOrificeFluidsCheckBlocked()
			playAnimation(StageScene.SexRimming, "sex", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
			
			saynn("Your sub’s eyes sparkle when you order {npc.him} that you need your ass cleaned inside too. Rather than doing it with {npc.his} hands, your submissive decides to get on {npc.his} knees behind you. {npc.His} palms land on your buttcheek and gently spread them, allowing {npc.him} to dig {npc.his} face in.")
			
			saynn("{npc.He} slips {npc.his} tongue past your sensitive anal ring and eagerly starts lapping away at your inner walls, trying to gather as much mess as {npc.he} can into {npc.his} mouth.")
		
			if(GM.pc.isWearingChastityCage()):
				saynn("Each caress and calculated movement brings you closer and closer.. Until a quick little orgasm overwhelms you, your locked member throbbing behind the metal cage and dripping {pc.cum} onto the floor while your prostate is getting milked dry.")
			elif(GM.pc.hasReachablePenis()):
				saynn("Each caress and calculated movement brings you closer and closer.. Until a quick little orgasm overwhelms you, your {pc.penis} throbbing and shooting {pc.cum} onto the floor while your prostate is getting milked dry.")
			elif(GM.pc.hasReachableVagina()):
				saynn("Each caress and calculated movement brings you closer and closer.. Until a quick little orgasm overwhelms you, your neglected pussy pulsing and releasing a shower of fluids onto the floor.")
			else:
				saynn("Each caress and calculated movement brings you closer and closer.. Until a quick little orgasm overwhelms you, your body squirming and shaking.")
				
			saynn("After all that, your sub spits all the collected mess out directly into the drain. It would be too gross to swallow it anyway.")
			
		addButton("Continue", "That was fun", "endthescene")
		
	if(state == "shower_together"):
		if(GM.pc.getLocation() == "main_dressing2"):
			aimCameraAndSetLocName("main_shower2")
		else:
			aimCameraAndSetLocName("main_shower1")
		playAnimation(StageScene.SexStanding, "tease", {npc=npcID, bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You shower together with {npc.name}. The leash is clipped to the shower head to make sure your slave can't just escape or even turn towards you.")
		
		saynn("Your possessive hands land on {npc.his} body and begin washing it, making sure to clean the private bits too, everywhere but inside.")

		addButton("Enough", "That was fun", "endthescene")
		addButton("Clean inside", "Clean inside your slave's orifices", "together_cleaninside")

	if(state == "together_cleaninside"):
		if(npc.hasReachableVagina()):
			saynn("Without even a warning, you put your hands on {npc.his} butt and spread it, making it so both {npc.his} holes are stretched wide.")
			
			saynn("You order {npc.him} to push and soon any fluids that were inside {npc.his} begin to leak out and quickly getting washed away by the running water.")
		else:
			saynn("Without even a warning, you put your hands on {npc.his} butt and spread it, making it so both {npc.his} tailhole is stretched wide.")
			
			saynn("You order {npc.him} to push and soon any fluids that were inside {npc.him} begin to leak out and quickly getting washed away by the running water.")
		
		addButton("Enough", "That was fun", "endthescene")

	if(state == "shower_alone"):
		if(GM.pc.getLocation() == "main_dressing2"):
			aimCameraAndSetLocName("main_shower2")
		else:
			aimCameraAndSetLocName("main_shower1")
		
		if(deservesPunishment):
			playAnimation(StageScene.Duo, "stand", {npc=npcID, flipNPC=true, npcAction="stand", npcBodyState={naked=true, leashedBy="pc"}})
		
			saynn("Your hand is holding your slave's leash to make sure {npc.he} doesn't do anything stupid.")
			
			saynn("You put {npc.him} under the running water and order {npc.him} to wash {npc.himself}")
			
			saynn("But {npc.name} just pouts and stands still, ignoring your order and covering {npc.himself} up as best as {npc.he} can. At least {npc.he} can't escape the water.")
		else:
			playAnimation(StageScene.Duo, "stand", {npc=npcID, flipNPC=true, npcAction="struggle", npcBodyState={naked=true, leashedBy="pc"}})
			#var npcSlavery:NpcSlave = npc.getNpcSlavery()
			saynn("Your slave is showering alone while your hand is holding {npc.his} leash to make {npc.he} won't do anything silly.")
			
			saynn("But it looks like your slave is obedient enough to listen, {npc.he} washes {npc.his} body under the running water while letting you watch.")
		
		addButton("Enough", "That was fun", "endthescene")
		addButton("Clean inside", "Order them to clean inside too", "alone_cleaninside")
		
	if(state == "alone_cleaninside"):
		playAnimation(StageScene.Duo, "stand", {npc=npcID, flipNPC=true, npcAction="struggle", npcBodyState={naked=true, leashedBy="pc"}})
		
		if(deservesPunishment):
			if(npc.hasReachableVagina()):
				saynn("You order {npc.him} to wash inside too. {npc.name} spreads both {npc.his} holes with {npc.his} hands for you and pushes any mess out.")
			else:
				saynn("You order {npc.him} to wash inside too. {npc.name} spreads {npc.his} butt with hands for you and pushes any mess out.")
		else:
			saynn("You order {npc.him} to wash inside too.. but your slave refuses to do it, demanding that you turn away first. Obviously you're not gonna do that.")
			
			saynn("Looks like {npc.he} just earned {npc.himself} a punishment.")
		
		addButton("Enough", "That was fun", "endthescene")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "shower_alone"):
		processTime(10*60)
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.isResistingSuperActively() || (npcSlavery.isActivelyResisting() && RNG.chance(70))):
			deservesPunishment = true
			npcSlavery.deservesPunishment(1)
		else:
			deservesPunishment = false
		
		npc.afterTakingAShower()
		
	
	if(_action == "alone_cleaninside"):
		processTime(10*60)

		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery.isResistingSuperActively() || (npcSlavery.isActivelyResisting() && RNG.chance(90))):
			deservesPunishment = true
			npcSlavery.deservesPunishment(1)
		else:
			deservesPunishment = false
		
			if(!npc.clearOrificeFluidsCheckBlocked()):
				addMessage("Something prevented your slave from clearing every hole")
	
	if(_action == "shower_together"):
		processTime(10*60)
		npc.afterTakingAShower()
		GM.pc.afterTakingAShower()
	
	if(_action == "sub_shower_pc"):
		processTime(10*60)
		npc.afterTakingAShower()
		GM.pc.afterTakingAShower()
		GM.pc.addStamina(200)
		GM.pc.addPain(-200)
	
	if(_action == "sub_cleans_inside_pc"):
		processTime(5*60)
		GM.pc.orgasmFrom(npcID)
	
	if(_action == "together_cleaninside"):
		processTime(10*60)
		if(!npc.clearOrificeFluidsCheckBlocked()):
			addMessage("Something prevented you from clearing every hole")

		
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID
	data["isFastServing"] = isFastServing
	data["deservesPunishment"] = deservesPunishment

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
	isFastServing = SAVE.loadVar(data, "isFastServing", false)
	deservesPunishment = SAVE.loadVar(data, "deservesPunishment", false)
	
