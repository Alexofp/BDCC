extends SceneBase

var condomBroke = false

func _init():
	sceneID = "rahiSleepsInPlayerCellScene"

func _run():
	if(state == ""):
		addCharacter("rahi", ["naked"])
		saynn("Rahi quietly walks into your cell and joins you, laying near. The bed was barely big enough for one person already but you open your arms and pull her closer, practically making her into your fluffy blanket. Rahi snuggles up against your {pc.masc} chest and quietly purrs.")

		saynn("You two say your goodnights to each other and then just lay there, together, simply enjoying the warmth and closeness of each other's bodies.. before drifting off to sleep..")

		addButton("Continue", "See what happens next", "sex_check")
	if(state == "blowjob"):
		saynn("The night passes.")

		saynn("You are sleeping soundly when you suddenly feel something warm and wet wrap around your hardening cock. You lazily open your eyes and look down to see someone under your blanket.. you know who it is, the brown feline tail poking out gives it away.. You decide to just let her do it.")

		saynn("Rahi's lips are wrapped tightly around your member. She doesn't say a word, her eyes are locked onto your crotch as she bobs her head up and down, taking you deep into her mouth and sucking it. Hearing your noises of love only makes her more eager, her rough tongue wrapping around your girth and sliding over it for that extra pleasure.")

		saynn("All the while her paws are just gently massaging your balls, causing you to grip the sheets tighter. Occasionally Rahi stops to give herself a breather. But she makes sure to keep kneading your balls and lick all the precum off the tip of your dick, making you throb already..")

		saynn("It wasn't long before you felt yourself approaching climax. You can't help but to not warn Rahi with a gasp. But she obediently keeps going, taking you deep into her throat until you can't hold the release off anymore.. You moan as your {pc.penis} starts twitching and exploding with {pc.cum} inside her mouth. Your kitty swallows every drop of it before peeking out of the blanket and looking up at you with a satisfied expression.")

		saynn("[say=pc]Wow, kitty..[/say]")

		saynn("You rest your head on the pillow, catching your breath as Rahi crawls up next to you, snuggling against your chest.")

		saynn("[say=rahi]Good morning, {rahiMaster}..[/say]")

		saynn("You cuddle together for a little longer before Rahi leaves and goes back to her own cell.")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "cowgirl"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="rahi", pc="pc", bodyState={naked=true, hard=true, condom=true}, npcBodyState={naked=true}})
		saynn("The night passes. Even though there aren't really any nights in space.. people still call the time when everyone sleeps a night. But someone certainly isn't sleeping..")

		saynn("You wake up from this strange and arousing sensation.. as if.. someone has straddled your hips.. You sneakily open your eyes and notice Rahi, your kitty, completely naked, grinding her pussy into your {pc.penis}, causing your shaft to begin hardening. You decide to pretend that you are still sleeping, letting kitty carry out her mischievous plan.")

		saynn("Before long, you were fully erect. Rahi, being the cautious kitty, pulls out a packaged condom and quickly rips it open with her claw before applying it to your dick. Then she carefully positions herself just above you, her pussy already dripping..")

		saynn("Rahi slowly lowers herself, moaning as she lets your member to spread her folds and stretch her soft inner walls, filling her up. After that, she just begins to slowly ride you, bouncing up and down on your dick.")

		saynn("You still try to pretend.. but it's hard.. you squirm ever so slightly under her while producing some quiet moans. All the while bites her lip and rides you faster while trying to hide her panting. You feel yourself getting close.. and Rahi seems to feel that too.")

		if (condomBroke):
			saynn("She feels it really well in fact.. at some point the low-quality condom on your dick has [b]broken[/b], which means that Rahi is in fact riding you raw.. As you produce a loud groan, Rahi brings herself down on your {pc.penis} as deep as her pussy allows. And she stays there.. obediently letting you fill her womb up with your sticky hot {pc.cum}.. not even knowing about that..")

			saynn("But after she has recovered, Rahi slowly raises herself and sees.. the broken condom..")

			saynn("[say=rahi]Oh.. oops..[/say]")

			saynn("After that she just sprints out of the cell, seed leaking out of her used hole in the process..")

		else:
			saynn("Luckily, the condom managed to endure all the fucking. As you produce a loud groan, Rahi brings herself down on your {pc.penis} as deep as her pussy allows. And she obediently stays there.. while you stuff the condom inside her with your hot stick {pc.cum}..")

			saynn("After she recovers, Rahi slowly raises herself and carefully ties up the condom.. before flopping on you. You put your hand on her and pull her closer for snuggles.")

			saynn("[say=rahi]Oh.. you're.. good morning, {rahiMaster}..[/say]")

			saynn("You cuddle together for a little longer before Rahi leaves and goes back to her own cell.")

		addButton("Continue", "That was lewd", "endthescene")
	if(state == "chastitycum"):
		saynn("The night passes.")

		saynn("You wake up when you feel someone's paws on your chastity cage.. Clearly those are Rahi's.. She is sneakily teasing you while being under the blanket, kissing and licking the tip of the cage, already making you desperately hard.. You decide not to announce that you're awake, letting your kitty play with you more.")

		saynn("Eventually, Rahi gets more brave, sneakily slipping her fingers down to your anal ring, gently rubbing and teasing your sensitive skin. She licks them and then, slowly but surely, begins to work them up your butt, stretching your tailhole. As soon as she reaches your prostate and begins to massage it, your locked away dick leaks out some precum.")

		saynn("This is it.. your kitty slowly fingers your pleasure spot while bringing her muzzle to your ballsack and dragging her tongue over them.. you can't help but to moan softly.")

		saynn("She continues to expertly tease and play with you until you just can't take it anymore.. With a cute moan, you finally reach your climax. Your caged up member throbs inside its contains while weak strings of {pc.cum} begins sprouting out of it. You squirm and pant heavily while Rahi obediently licks the seed off your cage, making sure to snatch every last drop before swallowing it all, leaving no evidence.")

		saynn("After that, she pulls her digits out of your butt and lays on top of you, her muzzle resting on your chest. You wrap your arm around her and snuggle.")

		saynn("[say=pc]Thank you.. kitty..[/say]")

		saynn("[say=rahi]Oh.. Meow.. Good morning, {rahiMaster}..[/say]")

		saynn("You cuddle together for a little longer before Rahi leaves and goes back to her own cell.")

		addButton("Continue", "That was lewd", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sex_check"):
		if(getModule("RahiModule").shouldSexThePlayerOnMornings()):
			var possible = []
		
			if(GM.pc.hasReachablePenis()):
				possible.append("blowjob")
				possible.append("cowgirl")
			if(GM.pc.isWearingChastityCage()):
				possible.append("chastitycum")
		
			var newState = RNG.pick(possible)
		
			if(newState in ["blowjob", "chastitycum"]):
				getCharacter("rahi").cummedInMouthBy("pc")
				GM.pc.orgasmFrom("rahi")
			if(newState == "cowgirl"):
				if(RNG.chance(30)):
					condomBroke = true
					getCharacter("rahi").cummedInVaginaBy("pc")
				else:
					condomBroke = false
					addFilledCondomToLootIfPerk(getCharacter("pc").createFilledCondom())
				GM.pc.orgasmFrom("rahi")
				
		
			if(newState != null):
				setState(newState)
				return
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["condomBroke"] = condomBroke

	return data

func loadData(data):
	.loadData(data)

	condomBroke = SAVE.loadVar(data, "condomBroke", false)
