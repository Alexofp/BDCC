extends "res://Scenes/SceneBase.gd"

var npcID = ""
var npc:DynamicCharacter


func _initScene(_args = []):
	npcID = _args[0]
	npc = GlobalRegistry.getCharacter(npcID)

func _reactInit():
	pass
	#processTime(10*60)
	#npc.afterTakingAShower()
	
	#var npcSlavery:NpcSlave = npc.getNpcSlavery()
	#if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
	#	npcSlavery.getActivity().satisfyWant("shower")

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _init():
	sceneID = "SlaveryPetWalkiesPlay"

func _run():
	if(state == ""):
		addCharacter(npcID)
		playAnimation(StageScene.PuppyDuo, "stand", {npc=npcID, flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
		var npcSlavery:NpcSlave = npc.getNpcSlavery()

		saynn("How do you want to play with your pet?")
		
		addButton("Fetch", "Make them bring you a stick", "play_fetch")
		if(npc.isWearingChastityCage() || npc.hasReachablePenis() || npc.hasReachableVagina()):
			if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 8):
				addButton("Feetplay", "This is a form of playing too..", "play_feet")
			else:
				addDisabledButton("Feetplay", "Pet skill B- or higher required")
		else:
			addDisabledButton("Feetplay", "There is nothing really for you to rub..")
		
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 11):
			addButtonWithChecks("Fuck", "Satisfy your pet's eagerness with your dick", "petplay_fuck", [], [[ButtonChecks.HasReachablePenis]])
			addButtonWithChecks("Strapon", "Satisfy your pet's eagerness with your toys", "petplay_strapon_choose", [], [[ButtonChecks.HasStraponAndCanWear]])
		else:
			addDisabledButton("Fuck", "Pet skill A or higher required")
	
	if(state == "petplay_strapon_choose"):
		saynn("Pick which strapon you wanna use.")
		
		var strapons = GM.pc.getStrapons()
		for strapon in strapons:
			addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "petplay_strapon", [strapon])

	
	if(state == "play_fetch"):
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		playAnimation(StageScene.PuppyDuo, "throw", {npc=npcID, npcAction="walk", flipNPC=true, npcBodyState={naked=true}})
		
		saynn("You find a wooden stick on the floor and pick it up.")
		
		saynn("[say=pc]Look at this, puppy.[/say]")
		
		saynn("You make sure your pet is tracking the stick.. before tossing it in a random direction.")
		
		saynn("[say=pc]"+RNG.pick([
			"Got get it!",
			"Fetch!",
			"Bring it back, {npc.boy}!",
		])+"[/say]")
		
		if(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 15):
			saynn("With a burst of energy, your pet takes off after the stick, {npc.his} movements graceful and agile.. even if the restraints do still limit them quite a bit.")
			
			saynn("{npc.He} grabs the sticks with {npc.his} mouth and brings it back to you, {npc.his} tail wagging furiously as you grab it and give {npc.him} some headpats as a reward.")
		elif(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 11):
			saynn("Your pet takes off after the stick, {npc.his} movements fluint and confident. {npc.He} stumbles a little because of the restraints.. but {npc.he} manages to bring back the stick.")
			
			saynn("Your pet is panting a lot as you retrive the stick from {npc.his} mouth and give {npc.him} some pats as a reward.")
		elif(npcSlavery.getSlaveSkill(SlaveType.Pet) >= 7):
			saynn("Your pet enthusiastically chases after the stick, {npc.his} movements eager and determined. Despite the restraints hindering {npc.him} slightly, {npc.he} manages to retrieve the stick and bring it back to you.")
			
			saynn("With a wagging tail, your pet waits eagerly as you take the stick from {npc.his} mouth and give {npc.him} a few pats on the head as a reward.")
		else:
			if(RNG.chance(33)):
				saynn("Your pet eagerly chases after the stick, but {npc.he} seems to struggle with the restraints, tripping over {npc.his} own paws and losing sight of the stick.")
				
				saynn("Despite {npc.his} best efforts, your pet can't seem to locate the stick, sniffing around in confusion before eventually giving up. Aw. Looks like your pet could use some more training. You give {npc.him} a pat for trying.")
			else:
				saynn("Your pet eagerly chases after the stick, {npc.his} movements filled with enthusiasm but lacking the required muscle memory. {npc.He} struggles to locate it at first, but after some searching, {npc.he} manages to find it, barking happily.")
				
				saynn("Despite it taking a few minutes, your pet eventually retrieves the stick, panting heavily as {npc.he} drops it at your feet. You give {npc.him} a few encouraging pats as a reward.")
			
		addButton("Continue", "See what happens next", "endthescene")
		
	if(state == "play_feet"):
		playAnimation(StageScene.PuppyFeetCrotch, "crotch", {pc="pc", npc=npcID, npcBodyState={naked=true, hard=true}}) 
		
		saynn("Puppy wants to play? You know just the thing.")

		saynn("[say=pc]Roll over, puppy.[/say]")

		saynn("{npc.name} tilts {npc.his} head. But as you repeat the command, {npc.he} flops and tries to roll to the other side. You catch {npc.him} during that motion, putting your foot on {npc.his} crotch.")

		if (npc.isWearingChastityCage()):
			saynn("{npc.His} caged up cock instantly reacts, twitching inside as you brush your foot over {npc.his} balls, gently kneading them.")

			saynn("[say=pc]Beg.[/say]")

			saynn("Your pet is completely helpless, restraints holding {npc.him} tightly, your leg pressed firmly against {npc.his} chastity cage, your toes playing with it.")

			saynn("[say=pc]I said, beg.[/say]")

			saynn("{npc.name} whines and wiggles {npc.his} bound paws cutely, {npc.his} eyes opened wide"+str(" under the blindfold" if npc.isBlindfolded() else "")+".")

			saynn("You knead {npc.his} cage with your foot more.. until your puppy starts to squirm under your leg."+str(" {npc.His} {npc.pussyStretch} pussy is dripping juices just like {npc.his} cock is dripping pre." if npc.hasReachableVagina() else "")+"")

			saynn("[say=pc]That's better. You're gonna cum, puppy?[/say]")

			saynn("[say=npc]..woof-f..[/say]")

		elif (npc.hasReachablePenis()):
			saynn("{npc.His} {npc.penis} instantly reacts, getting hard and leaking a drop of pre as you brush your foot over {npc.his} balls, gently kneading them.")

			saynn("[say=pc]Beg.[/say]")

			saynn("Your pet is completely helpless, restraints holding {npc.him} tightly, your leg pressed firmly against {npc.his} ballsack, your toes playing with it.")

			saynn("[say=pc]I said, beg.[/say]")

			saynn("{npc.name} whines and wiggles {npc.his} bound paws cutely, {npc.his} eyes opened wide"+str(" under the blindfold" if npc.isBlindfolded() else "")+".")

			saynn("You move your foot slightly higher and start stroking {npc.his} {penis} with it.. until your puppy starts to squirm under your leg."+str(" {npc.His} {npc.pussyStretch} pussy is dripping too, even though you are focussed on {npc.his} member." if npc.hasReachableVagina() else "")+"")

			saynn("[say=pc]That's better. You're gonna cum, puppy?[/say]")

			saynn("[say=npc]..woof-f..[/say]")

		elif (npc.hasReachableVagina()):
			saynn("{npc.His} {npc.pussyStretch} pussy instantly reacts, getting wet and needy as you brush your foot over {npc.his} sensitive petals, gently caressing them.")

			saynn("[say=pc]Beg.[/say]")

			saynn("Your pet is completely helpless, restraints holding {npc.him} tightly, your leg pressed firmly against {npc.his} slit, your toes playing with it.")

			saynn("[say=pc]I said, beg.[/say]")

			saynn("{npc.name} whines and wiggles {npc.his} bound paws cutely, {npc.his} eyes opened wide"+str(" under the blindfold" if npc.isBlindfolded() else "")+".")

			saynn("Your toes find {npc.his} clit and start rubbing and playing with it.. until your puppy starts to squirm under your leg.")

			saynn("[say=pc]That's better. You're gonna cum, puppy?[/say]")

			saynn("[say=npc]..woof-f..[/say]")
		
		addButton("Make them cum", "Allow them to orgasm", "feetplay_allowcum")
		addButton("Deny", "Steal the orgasm from them", "feetplay_deny")
		
	if(state == "feetplay_deny"):
		if (npc.isWearingChastityCage()):
			saynn("You decide to deny your puppy this time, bringing {npc.him} to {npc.his} peak with your foot.. just to stop, exactly when {npc.his} locked away cock began twitching behind its little cage.")

		elif (npc.hasReachablePenis()):
			saynn("You decide to deny your puppy this time, bringing {npc.him} to {npc.his} peak with your foot.. just to stop, exactly when {npc.his} {npc.penis} began twitching and throbbing.")

		elif (npc.hasReachableVagina()):
			saynn("You decide to deny your puppy this time, bringing {npc.him} to {npc.his} peak with your foot.. just to stop, exactly when {npc.his} {npc.pussyStretch} pussy began twitching subtly.")

		saynn("Your pet is whining and squirming a lot, desperate for release.. that never comes.. You keep {npc.him} pinned to the floor with your foot, waiting for {npc.him} to cool down.")

		saynn("[say=pc]So cute.[/say]")
		
		addButton("Continue", "See what happens next", "endthescene")
	
	if(state == "feetplay_allowcum"):
		if (npc.isWearingChastityCage()):
			saynn("You keep rubbing and caressing your pet's chastity cage and {npc.his} balls.. until the member inside suddenly starts throbbing and shooting {npc.cum} past the little hole in the cage, all of it landing on {npc.his} belly.")

		elif (npc.hasReachablePenis()):
			saynn("You keep rubbing and caressing your pet's cock and {npc.his} balls.. until the shaft suddenly starts throbbing and shooting strings of thick {npc.cum}, with all of them landing on {npc.his} belly.")

		elif (npc.hasReachableVagina()):
			saynn("You keep rubbing and caressing your pet's slick needy pussy.. until your pet releases a passionate cute noise, {npc.his} petals pulsing while a stream of transparent {npc.girlcum} hits {npc.his} own thighs, making them look quite wet.")

		saynn("After all of that, your puppy is left panting and squirming, the forced orgasm making {npc.his} cheeks look red.")
		
		addButton("Continue", "See what happens next", "endthescene")
		
		
		
	if(state == "petplay_fuck"):
		playAnimation(StageScene.PuppySexOral, "tease", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You know a much-much better way to satisfy your pet's eagerness.")

		saynn("You expose your {pc.penis}, giving your pet a good look at it.")

		saynn("[say=pc]Let's have some fun.[/say]")

		saynn("[say=npc]Woof..[/say]")

		saynn("Which hole do you want to fuck.")

		addButton("Ass", "Fuck their ass", "petplay_fuck_ass")
		if (npc.hasReachableVagina()):
			addButton("Pussy", "Fuck their pussy slit", "petplay_fuck_pussy")
		else:
			addDisabledButton("Pussy", "They don't have a reachable pussy")
	if(state == "petplay_fuck_pussy"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You take a spot behind {npc.him}, your member already brushing against {npc.his} pussy folds, the little caresses making them slick.")

		addButton("Fuck slowly", "Go easy on your pet", "fuck_vag_slow")
		addButton("Fuck fast", "Rail your pet", "fuck_vag_fast")
	if(state == "fuck_vag_fast"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Your hands land on your pet's ass as you shove your cock inside, forcibly spreading the awaiting petals wide. Your pet jerks jerks forward.. but you just pull {npc.him} back while thrusting inside again, fucking {npc.his} needy slit.")

		saynn("Even though you're being very rough, moans begin to leave {npc.name}'s mouth, the restraints keeping {npc.him} completely helpless as your cock is pounding {npc.his} wet cunt at a rapid pace, love juices coating your shaft, keeping the friction somewhat endurable.")

		saynn("The way {npc.his} pussy wraps around your cock with each thrust feels incredible, you can feel the orgasm approaching already.")

		addButton("Cum inside", "Breed the puppy", "fuck_vag_cuminside")
		addButton("Pull out", "Cum all over their ass instead", "fuck_vag_pullout")
	if(state == "fuck_vag_slow"):
		playAnimation(StageScene.PuppySexAllFours, "sex", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You decide not to be too rough and go slow on your pet. Your hand aligns your cock a little better as you penetrate {npc.him}, the tip spreading the petals wide. After that, you just put your hands on your pet's {npc.thick} butt and start fucking {npc.his} needy slit.")

		saynn("Soon, moans begin to leave {npc.name}'s mouth, the restraints keeping {npc.him} completely helpless as your cock is sliding in and out at a steady pace, love juices keeping the friction painless.")

		saynn("The way {npc.his} pussy wraps around your cock feels incredible, you can feel the orgasm approaching already.")

		addButton("Cum inside", "Breed the puppy", "fuck_vag_cuminside")
		addButton("Pull out", "Cum all over their ass instead", "fuck_vag_pullout")
	if(state == "fuck_vag_cuminside"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You let the orgasm take over, shoving your cock deep inside that puppy until the tip kisses {npc.his} cervix. Grunts leave your mouth as you paint {npc.his} insides and stuff {npc.his} womb full of your thick {pc.cum}, pumping more and more of it in with each throb.")

		saynn("All the while your pet is shivering as much as the restraints allow, {npc.his} pussy milking your member dry during {npc.his} own climax.")

		saynn("[say=pc]Was that fun?[/say]")

		saynn("[say=npc]..w-woof-f..[/say]")

		saynn("Your pet is panting, {npc.his} pussy is dripping your seed now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "fuck_vag_pullout"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You decide against breeding your pet and pull over as soon as you feel the point of no return. Grunts leave your mouth as you paint your pet's back with your thick {pc.cum}, leaving a bigger and bigger lewd mess with each throb.")

		saynn("All the while your pet is shivering as much as the restraints allow, {npc.his} drippy pussy visibly pulsing and twitching during {npc.his} own climax.")

		saynn("[say=pc]Was that fun?[/say]")

		saynn("[say=npc]..w-woof-f..[/say]")

		saynn("Your pet is panting, now looking a bit more.. used.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "petplay_fuck_ass"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You take a spot behind {npc.him}, your member already brushing against {npc.his} {npc.analStretch} ass, the little caresses making them twich.")

		addButton("Fuck slowly", "Go easy on your pet", "fuck_ass_slow")
		addButton("Fuck fast", "Rail your pet", "fuck_ass_fast")
	if(state == "fuck_ass_fast"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Your hands land on your pet's ass as you shove your cock inside, forcibly spreading the awaiting star wide. Your pet jerks jerks forward.. but you just pull {npc.him} back while thrusting inside again, fucking {npc.his} needy hole.")

		saynn("Even though you're being very rough, moans begin to leave {npc.name}'s mouth, the restraints keeping {npc.him} completely helpless as your cock is pounding {npc.his} tailhole at a rapid pace. You occasionally spit at your shaft to keep it lubed up which is helping to keep the friction somewhat endurable.")

		saynn("The way {npc.his} ass wraps around your cock with each thrust feels incredible, you can feel the orgasm approaching already.")

		addButton("Cum inside", "Breed the puppy", "fuck_ass_cuminside")
		addButton("Pull out", "Cum all over their ass instead", "fuck_ass_pullout")
	if(state == "fuck_ass_slow"):
		playAnimation(StageScene.PuppySexAllFours, "sex", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You decide not to be too rough and go slow on your pet. Your hand aligns your cock a little better as you penetrate {npc.him}, the tip spreading the {npc.analStretch} star wide. After that, you just put your hands on your pet's {npc.thick} butt and start fucking {npc.his} needy hole.")

		saynn("Soon, moans begin to leave {npc.name}'s mouth, the restraints keeping {npc.him} completely helpless as your cock is sliding in and out at a steady pace. You occasionally spit on your shaft, which is keeping the friction mostly painless.")

		saynn("The way {npc.his} ass wraps around your cock feels incredible, you can feel the orgasm approaching already.")

		addButton("Cum inside", "Breed the puppy", "fuck_ass_cuminside")
		addButton("Pull out", "Cum all over their ass instead", "fuck_ass_pullout")
	if(state == "fuck_ass_cuminside"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You let the orgasm take over, shoving your cock deep inside that puppy until the tip reaches {npc.his} guts. Grunts leave your mouth as you paint {npc.his} insides and stuff {npc.him} full of your thick {pc.cum}, pumping more and more of it in with each throb.")

		saynn("All the while your pet is shivering as much as the restraints allow, {npc.his} tailhole milking your member dry during {npc.his} own climax.")

		saynn("[say=pc]Was that fun?[/say]")

		saynn("[say=npc]..w-woof-f..[/say]")

		saynn("Your pet is panting, {npc.his} ass is dripping your seed now.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "fuck_ass_pullout"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You decide against breeding your pet and pull over as soon as you feel the point of no return. Grunts leave your mouth as you paint your pet's back with your thick {pc.cum}, leaving a bigger and bigger lewd mess with each throb.")

		saynn("All the while your pet is shivering as much as the restraints allow, {npc.his} need tailhole visibly pulsing and twitching during {npc.his} own climax.")

		saynn("[say=pc]Was that fun?[/say]")

		saynn("[say=npc]..w-woof-f..[/say]")

		saynn("Your pet is panting, now looking a bit more.. used.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "petplay_strapon"):
		playAnimation(StageScene.PuppySexOral, "tease", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You know a much-much better way to satisfy your pet's eagerness.")

		saynn("You secure a strapon around your waist and give your pet a good look at it.")

		saynn("[say=pc]Let's have some fun.[/say]")

		saynn("[say=npc]Woof..[/say]")

		saynn("Which hole do you want to fuck.")

		addButton("Ass", "Fuck their ass", "petplay_strapon_ass")
		if (npc.hasReachableVagina()):
			addButton("Pussy", "Fuck their pussy slit", "petplay_strapon_pussy")
		else:
			addDisabledButton("Pussy", "They don't have a reachable pussy")
	if(state == "petplay_strapon_pussy"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You take a spot behind {npc.him}, your rubber member already brushing against {npc.his} pussy folds, the little caresses making them slick.")

		addButton("Fuck slowly", "Go easy on your pet", "fuck_strapon_slow")
		addButton("Fuck fast", "Rail your pet", "fuck_strapon_fast")
	if(state == "fuck_strapon_fast"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Your hands land on your pet's ass as you shove the rubber toy inside, forcibly spreading the awaiting petals wide. Your pet jerks jerks forward.. but you just pull {npc.him} back while thrusting inside again, fucking {npc.his} needy slit.")

		saynn("Even though you're being very rough, moans begin to leave {npc.name}'s mouth, the restraints keeping {npc.him} completely helpless as your strapon is pounding {npc.his} wet cunt at a rapid pace, love juices coating its shaft, keeping the friction somewhat endurable.")

		saynn("The way {npc.his} pussy wraps around your toy with each thrust feels nice, you can feel {npc.his} orgasm approaching already.")

		addButton("Make them cum", "Make your puppy orgasm", "fuck_strapon_cuminside")
		addButton("Pull out", "Deny your puppy", "fuck_strapon_pullout")
	if(state == "fuck_strapon_slow"):
		playAnimation(StageScene.PuppySexAllFours, "sex", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You decide not to be too rough and go slow on your pet. Your hand aligns your strapon a little better as you penetrate {npc.him}, the rubber tip spreading the petals wide. After that, you just put your hands on your pet's {npc.thick} butt and start fucking {npc.his} needy slit.")

		saynn("Soon, moans begin to leave {npc.name}'s mouth, the restraints keeping {npc.him} completely helpless as your rubber toy is sliding in and out at a steady pace, love juices keeping the friction painless.")

		saynn("The way {npc.his} pussy wraps around that shaft feels nice, you can feel {npc.his} orgasm approaching already.")

		addButton("Make them cum", "Make your puppy orgasm", "fuck_strapon_cuminside")
		addButton("Pull out", "Deny your puppy", "fuck_strapon_pullout")
	if(state == "fuck_strapon_cuminside"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You let the puppy cum, shoving your strapon deep inside {npc.him} until the rubber tip kisses {npc.his} cervix. You grope your pet's ass while {npc.he} {npc.isAre} shivering and squirming under you, {npc.his} pussy trying to milk the strapon during the climax.")

		saynn("[say=pc]Was that fun?[/say]")

		saynn("[say=npc]..w-woof-f..[/say]")

		saynn("Your pet is panting, {npc.his} pussy is still twitching even after pulling out.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "fuck_strapon_pullout"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You decide to be a little mean and deny your pet, pulling the strapon out just when you feel {npc.him} approaching the climax. Instantly, you can hear whining, your pet is shivering as much as the restraints allow, {npc.his} drippy pussy left neglected.")

		saynn("[say=pc]Was that fun?[/say]")

		saynn("Your pet whines more. So you spank {npc.his} butt.")

		saynn("[say=npc]..w-woof-f..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "petplay_strapon_ass"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You take a spot behind {npc.him}, your rubber member already brushing against {npc.his} tailhole, the little caresses making it twitch.")

		addButton("Fuck slowly", "Go easy on your pet", "fuck_strapon_slow_ass")
		addButton("Fuck fast", "Rail your pet", "fuck_strapon_fast_ass")
	if(state == "fuck_strapon_fast_ass"):
		playAnimation(StageScene.PuppySexAllFours, "fast", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Your hands land on your pet's butt as you shove the rubber toy inside, forcibly spreading the awaiting taihole wide. Your pet jerks jerks forward.. but you just pull {npc.him} back while thrusting inside again, fucking {npc.his} needy ass.")

		saynn("Even though you're being very rough, moans begin to leave {npc.name}'s mouth, the restraints keeping {npc.him} completely helpless as your strapon is pounding {npc.him} at a rapid pace. You occasionally spit on the rubber shaft, trying to keep the friction somewhat endurable for the puppy.")

		saynn("The way {npc.his} inner walls wrap around your toy with each thrust feels nice, you can feel {npc.his} orgasm approaching already.")

		addButton("Make them cum", "Make your puppy orgasm", "fuck_strapon_cuminside_ass")
		addButton("Pull out", "Deny your puppy", "fuck_strapon_pullout_ass")
	if(state == "fuck_strapon_slow_ass"):
		playAnimation(StageScene.PuppySexAllFours, "sex", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You decide not to be too rough and go slow on your pet. Your hand aligns your strapon a little better as you penetrate {npc.him}, the rubber tip spreading the tailhole wide. After that, you just put your hands on your pet's {npc.thick} butt and start fucking {npc.him}.")

		saynn("Soon, moans begin to leave {npc.name}'s mouth, the restraints keeping {npc.him} completely helpless as your rubber toy is sliding in and out at a steady pace. You spit on the shaft occasionally, trying to keep the friction painless.")

		saynn("The way {npc.his} inner walls wrap around that shaft feels nice, you can feel {npc.his} orgasm approaching already.")

		addButton("Make them cum", "Make your puppy orgasm", "fuck_strapon_cuminside_ass")
		addButton("Pull out", "Deny your puppy", "fuck_strapon_pullout_ass")
	if(state == "fuck_strapon_cuminside_ass"):
		playAnimation(StageScene.PuppySexAllFours, "inside", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You let the puppy cum, shoving your strapon deep inside {npc.him} until the rubber tip reaches {npc.his} guts. You grope your pet's ass while {npc.he} {npc.isAre} shivering and squirming under you, {npc.his} ass trying to milk the strapon during the climax.")

		saynn("[say=pc]Was that fun?[/say]")

		saynn("[say=npc]..w-woof-f..[/say]")

		saynn("Your pet is panting, {npc.his} tailhole is still twitching even after pulling out.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "fuck_strapon_pullout_ass"):
		playAnimation(StageScene.PuppySexAllFours, "tease", {pc="pc", npc=npcID, bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You decide to be a little mean and deny your pet, pulling the strapon out just when you feel {npc.him} approaching the climax. Instantly, you can hear whining, your pet is shivering as much as the restraints allow, {npc.his} drippy tailhole left neglected.")

		saynn("[say=pc]Was that fun?[/say]")

		saynn("Your pet whines more. So you spank {npc.his} butt.")

		saynn("[say=npc]..w-woof-f..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
		
		
func _react(_action: String, _args):
	if(_action == "endthescene"):
		GM.pc.unequipStrapon()
		endScene()
		return

	if(_action == "petplay_strapon"):
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action in ["fuck_vag_cuminside", "fuck_ass_cuminside", "fuck_strapon_cuminside", "fuck_strapon_cuminside_ass"]):
		processTime(10*60)
		
		if(_action == "fuck_strapon_cuminside"):
			npc.cummedInVaginaBy("pc", FluidSource.Strapon)
			npc.gotVaginaFuckedBy("pc")
		elif(_action == "fuck_strapon_cuminside_ass"):
			npc.cummedInAnusBy("pc", FluidSource.Strapon)
			npc.gotAnusFuckedBy("pc")
		else:
			if(_action == "fuck_ass_cuminside"):
				npc.cummedInAnusBy("pc")
				npc.gotAnusFuckedBy("pc")
			else:
				npc.cummedInVaginaBy("pc")
				npc.gotVaginaFuckedBy("pc")
			GM.pc.orgasmFrom(npcID)
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("play")
		if(npcSlavery.rewardBalance > 0):
			npcSlavery.handleReward(1)
			addMessage("This counted as a small reward for your slave")

	if(_action in ["fuck_vag_pullout", "fuck_ass_pullout", "fuck_strapon_pullout", "fuck_strapon_pullout_ass"]):
		processTime(10*60)
		
		if(_action == "fuck_strapon_pullout"):
			npc.cummedOnBy("pc", FluidSource.Strapon)
			npc.gotVaginaFuckedBy("pc")
		elif(_action == "fuck_strapon_pullout_ass"):
			npc.cummedOnBy("pc", FluidSource.Strapon)
			npc.gotAnusFuckedBy("pc")
		else:
			npc.cummedOnBy("pc")
			if(_action == "fuck_ass_pullout"):
				npc.gotAnusFuckedBy("pc")
			else:
				npc.gotVaginaFuckedBy("pc")
			GM.pc.orgasmFrom(npcID)
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("play")
		if(npcSlavery.rewardBalance < 0):
			npcSlavery.handlePunishment(1)
			addMessage("This counted as a small punishment for your slave")

	if(_action == "play_fetch"):
		processTime(10*60)

		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("play")
		
	if(_action == "feetplay_allowcum"):
		processTime(10*60)
		
		if(npc.isWearingChastityCage() || npc.hasReachablePenis()):
			npc.cummedOnBy(npcID)
		elif(npc.hasReachableVagina()):
			npc.cummedOnBy(npcID, FluidSource.Vagina, RNG.randf_range(0.2, 0.4))
		npc.orgasmFrom("pc")
		
		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("play")
		npcSlavery.addTrust(0.05)
		npcSlavery.addLove(0.02)
		npcSlavery.addSpoiling(0.02)
		if(npcSlavery.rewardBalance > 0):
			npcSlavery.handleReward(2)
			addMessage("This counted as a normal reward for your slave")
		
	if(_action == "feetplay_deny"):
		processTime(10*60)

		var npcSlavery:NpcSlave = npc.getNpcSlavery()
		if(npcSlavery != null && npcSlavery.getActivityID()=="Walkies"):
			npcSlavery.getActivity().satisfyWant("play")
		npcSlavery.addTrust(-0.05)
		npcSlavery.addBrokenSpirit(0.05)
		npcSlavery.addSpoiling(-0.1)
		npcSlavery.addDespair(0.02)
		npcSlavery.addNeediness(0.5)
		if(npcSlavery.rewardBalance < 0):
			npcSlavery.handlePunishment(2)
			addMessage("This counted as a normal punishment for your slave")
		
	setState(_action)


func saveData():
	var data = .saveData()
	
	data["npcID"] = npcID

	return data
	
func loadData(data):
	.loadData(data)
	
	npcID = SAVE.loadVar(data, "npcID", "")
	npc = GlobalRegistry.getCharacter(npcID)
