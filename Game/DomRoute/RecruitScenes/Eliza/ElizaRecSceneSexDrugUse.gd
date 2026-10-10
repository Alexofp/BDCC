extends RecruitSceneBase

var condomType = ""
var condomUsed = false
var condomBroke = false
var straponUsed = false

func _init():
	sceneID = "ElizaRecSceneSexDrugUse"

func _reactInit():
	getCharacter("eliza").getInventory().clearSlot(InventorySlot.Body)
	putOn("eliza", "LatexStraitjacket")
	putOn("eliza", "oldcollar")

func _run():
	if(state == ""):
		condomType = extra("condom", "no")
		condomUsed = (condomType != "no")
		straponUsed = (extra("strapon", "") != "")
		addCharacter("eliza", ["naked"])
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You go through Eliza's things.. one of the vials catches your attention. You read the label on it.. 'HeatXL, untested'. Well then, why don't we test it now then. You grab a clean syringe too to go with it.")

		saynn("Then you enter the cold cell. Eliza is still chained to the pipe above her. She is still wearing a straitjacket that came from her own mental ward. Her tits are exposed, her own arms supporting them. A metal chastity belt is locked around her waist.. a belt that you still have a key for.")

		saynn("She glares at you.")

		saynn("[say=pc]"+str(ch1("...", "Hey there, slut.", "Getting used to it, I see."))+"[/say]")

		saynn("[say=eliza]Whatever it is that you're gonna do, it will have consequences.[/say]")

		saynn("She is not wrong. It will have consequences for her.")

		saynn("You decide to keep the tension high by avoiding interacting with her for now. There is a chair in the far corner of the cell. You grab it and bring it closer, facing her.")

		saynn("Then you pull out that untested vial. Eliza's eyes try to focus on it.. but you're too far for her to read the label.")

		saynn("[say=eliza]What is that? Where did you get that?[/say]")

		saynn("You don't answer. You just take the lid off and begin filling the syringe using it.")

		saynn("Eliza furrows her brows.")

		saynn("[say=eliza]I'm not scared of dying, you know. I've seen death.[/say]")

		saynn("Again, you don't say anything. You just approach her.. and look into her eyes as you inject the strange substance into her neck. She knows better than to resist during this.")

		saynn("[say=eliza]Nh..[/say]")

		saynn("And now.. it's just time to wait and see what happens.")

		saynn("You take a seat on the chair and cross your arms.")

		addButton("Continue", "See what happens next", "sit_chair")
	if(state == "sit_chair"):
		playAnimation(StageScene.SexChair, "start", {pc="pc", npc="eliza"})
		saynn("For a minute, nothing happens. Eliza just gets more and more anxious over time, her nose twitching, her ears turning in different directions, her eyes still mostly glaring at you.")

		saynn("But then something clearly begins to change for her. She blinks a few times, her eyes losing focus for a second. Her posture changes, getting a bit lower, her knees touching, her tail curling around her thigh.")

		saynn("[say=eliza]Did you turn off the ventilation..[/say]")

		saynn("You shrug and smile. Eliza pouts.. and blushes.")

		saynn("[say=eliza]I think I know what you injected me with.. yeah.. I feel it.. spreading.. fuck.. It's just a physiological reaction of my body.. I can control it.[/say]")

		saynn("[say=pc]"+str(ch1("...", "Can you now? You don't seem to.", "You're weaker than you think."))+"[/say]")

		saynn("[say=eliza]Huff.. shut up..[/say]")

		saynn("Her hips are beginning to sway idly, her breathing becoming deeper. The biggest give-away are her nips.. they look so much more perky now.")

		saynn("[say=eliza]You know.. screw it.. I'm in heat and it's your problem now![/say]")

		addButton("Continue", "See what happens next", "eliza_straddles_you")
	if(state == "eliza_straddles_you"):
		playAnimation(StageScene.SexChair, "tease", {pc="pc", npc="eliza", bodyState={showPenis=true, hard=true}})
		saynn("She walks up to you and straddles your lap, her bulky belt now resting on your legs. Even through the metal you can feel the heat radiating from her.")

		if (!straponUsed):
			saynn("[say=eliza]You want me to grind your cock with my belt and moan desperately into your face? We will see who is gonna be the desperate one after..[/say]")

			saynn("Indeed, she starts to gently move herself, rocking her hips, letting the metal plate rub against your {pc.penis}.")

		else:
			saynn("[say=eliza]Do you even have something that I can.. use.. Or do you want me to grind your lap with my belt and moan desperately into your face? We will see who is gonna be the desperate one after..[/say]")

			saynn("Indeed, she starts to gently move herself, rocking her hips, letting the metal plate rub against you. And so you quickly secure a strapon harness around your waist, the one that you prepared.")

		saynn("[say=eliza]Mhh~.. That "+str("cock" if !straponUsed else "toy")+" would feel so good in my needy pussy.. My slick, tight pussy..[/say]")

		saynn("Fine.")

		saynn("Her eyes spark when your hand produces a key. Eliza is biting her lip while watching that key travel towards the lock of her belt. One turn.. and the whole assembly falls apart with a clatter, revealing her glistening slit.")

		addButton("Continue", "See what happens next", "eliza_starts_riding")
	if(state == "eliza_starts_riding"):
		playAnimation(StageScene.SexChair, "sex", {pc="pc", npc="eliza", bodyState={showPenis=true, hard=true}})
		saynn("The moment Eliza is free, she moves. She swiftly gets up.. and positions herself right above your "+str("cock" if !straponUsed else "strapon's tip")+".. before straddling you again! With a single, fluid motion, she impales herself on your"+str(" rubber" if straponUsed else "")+" shaft.")

		saynn("[say=eliza]Oh.. fuck.. yes~..[/say]")

		saynn("Her pussy is so hot you are afraid it might "+str("burn you" if !straponUsed else "damage the silicon")+".. as well as being impossibly slick, clenching tightly around you.")

		saynn("As you put your hands on her hips, she starts to ride you.. desperately. She grinds herself on you, her wet inner walls massaging and milking "+str("your cock" if !straponUsed else "rubber shaft")+". Her motions are full of need.. desire. She leans forward a bit, her perky tits bouncing a bit in your face.")

		saynn("[say=eliza]Feels so good~. Ah~..[/say]")

		saynn("She is purring.. her purrs intertwined with her moans and gasps.")

		saynn("[say=pc]"+str(ch1("...", "That's it. Ride that cock, slut.", "Are you sure you're not a lilac? You sure act like one."))+"[/say]")

		saynn("[say=eliza]More.. give me more..[/say]")

		addButton("Continue", "See what happens next", "eliza_rides_faster")
	if(state == "eliza_rides_faster"):
		playAnimation(StageScene.SexChair, "fast", {pc="pc", npc="eliza", bodyState={showPenis=true, hard=true}})
		saynn("She increases her pace, her hips grinding you hard. The sound of her wet pussy taking your "+str("cock" if !straponUsed else "strapon")+" fills the small cell. Her tail finds your ankle and curls tightly around it. "+str("You can feel your cock exploring every inch of her sex, the tip kissing her natural barricade constantly." if !straponUsed else "The friction feels good for you too.. Your strapon exploring every inch of her sex, the tip kissing her natural barricade constantly.")+"")

		saynn("[say=eliza]I'm.. I'm going to cum.. Hah.. ahh~..[/say]")

		saynn("Her body tenses, her legs shaking a lot, her pussy suddenly starts clenching around you in waves, so tight it's almost "+str("painful" if !straponUsed else "pulling you with her")+". She throws her head back and lets out a loud, passionate moan as her orgasm rips through her. And yet, the straitjacket still keeps her completely helpless for you.")

		if (!straponUsed):
			saynn("Even after she passes her peak, she keeps riding you, her movements becoming jerky and oversensitive. It's like she is asking you to cum.. it's like she wants you to fill her up. Eliza just milks your cock with her still-spasming pussy, her green eyes locked on yours.")

			saynn("[say=eliza]Breed me, you soft~..[/say]")

			saynn("You do feel close..")

		else:
			saynn("Even after she passes her peak, she keeps riding you, her movements becoming jerky and oversensitive. It's like she is asking for it.. Eliza just milks your rubber toy with her still-spasming pussy, her green eyes locked on yours.")

			saynn("[say=eliza]Such a nice cock~..[/say]")

		addButton("Continue", "See what happens next", "cum_inside")
	if(state == "cum_inside"):
		playAnimation(StageScene.SexChair, "inside", {pc="pc", pcCum=!straponUsed, cum=!straponUsed, npc="eliza", bodyState={showPenis=true, hard=true}})
		if (!straponUsed):
			saynn("And so as soon you feel the point of no return.. you grip her hips and slam her down onto your cock, forcing the whole length inside.")

			saynn("Eliza cries out a satisfied purring sound as she feels your cumming.. your hot seed flooding her insides. You grunt, your balls twitching, your cock pumping load after load into her.")

		else:
			saynn("And so you grip her hips and slam her down onto your rubber cock, forcing the whole length inside. Eliza cries out a satisfied purring sound as she feels that, her orgasm extending further, more waves of pure ecstasy crashing over her, making her body squirm.")

		saynn("Soon after.. the feline slumps against you, breathing heavily, her body finally starting to relax. The purring continues, a low hum of content.")

		saynn("The overwhelming warmth begins to fade gradually, the drug is wearing off. The hazy lust of Eliza's eyes clears, her expression hardens, the purring fading away.")

		saynn("[say=eliza]Drugging a poor doctor kitty with her own stuff.. so fucking rude.[/say]")

		if (!straponUsed):
			saynn("She puts her hind paws on the floor and pushes herself up, letting your cock slide out. Her used pussy immediately starts dripping your {pc.cum}.")

		else:
			saynn("She puts her hind paws on the floor and pushes herself up, letting your strapon slide out. Her pussy looks completely soaked with juices..")

		saynn("[say=eliza]Such a mess.. I'm such a mess.. felt good though..[/say]")

		saynn("Before you leave, you secure the belt around her waist again.")

		saynn("[say=eliza]Really? Kinky..[/say]")

		saynn("And so you step out.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "eliza_straddles_you"):
		if(straponUsed):
			recWearStrapon()

	if(_action == "cum_inside"):
		if(straponUsed):
			getCharacter("eliza").cummedInVaginaBy("pc", FluidSource.Strapon)
		else:
			getCharacter("eliza").cummedInVaginaBy("pc", FluidSource.Penis)
		GM.pc.orgasmFrom("eliza")

	if(_action == "endthescene"):
		recRemoveStrapons()
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["condomType"] = condomType
	data["condomUsed"] = condomUsed
	data["condomBroke"] = condomBroke
	data["straponUsed"] = straponUsed

	return data

func loadData(data):
	.loadData(data)

	condomType = SAVE.loadVar(data, "condomType", "")
	condomUsed = SAVE.loadVar(data, "condomUsed", false)
	condomBroke = SAVE.loadVar(data, "condomBroke", false)
	straponUsed = SAVE.loadVar(data, "straponUsed", false)
