extends SceneBase

var deserved = true

func _init():
	sceneID = "rahiRewardPetScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		deserved = _args[0]

func _reactInit():
	processTime(2*60)

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("[say=pc]Stand still.[/say]")

		saynn("[say=rahi]Yes, {rahiMaster}..[/say]")

		saynn("Rahi tilts her head down while you reach your hand out towards her head. The feline is clearly being cautious.")

		saynn("But she shouldn't have worried, you plop your hand between her ears, giving the feline a good headpat. Kitty offers you a soft smile.")

		if (deserved):
			saynn("[say=rahi]Thank you.. She wants to be the best kitty for you, {rahiMaster}..[/say]")

		else:
			saynn("[say=rahi]Why are you.. Thank you.. She doesn't deserve it..[/say]")

		saynn("Kitty seemed to like that.")

		addButton("End", "Enough patting for now", "endthescene")
		if (getModule("RahiModule").getAffection() >= 7):
			addButton("Pet again", "Pet that kitty again", "pet_rahi_again")
	if(state == "pet_rahi_again"):
		playAnimation(StageScene.Hug, "hug", {npc="rahi"})
		saynn("Why the heck not, Rahi looks so pettable that you can't stop yourself from giving her another headpat between the ears.")

		saynn("Kitty is purring softly and leans into your hand ever so slightly.")

		if (deserved):
			saynn("[say=rahi]Mee-e-ew.. thank you..[/say]")

			saynn("You offer her a smile and rest your hand between her ears for a big longer before pulling it away.")

		else:
			saynn("[say=rahi]Me-ew.. What did she do to deserve another one..[/say]")

			saynn("You don't need a reason to pat such a cat, you rest your hand between her ears for a big longer before pulling it away.")

		addButton("End", "Enough patting for now", "endthescene")
		if (getModule("RahiModule").getAffection() >= 15):
			addButton("Pet more", "Pet that kitty more", "pet_rahi_more")
		if (getModule("RahiModule").isSkillLearned("rahiSkillPetplay")):
			addButton("Scritch behind ears", "(Petplay) Make Rahi feel like a kitty", "petplay_scritch")
	if(state == "pet_rahi_more"):
		saynn("You feel like something isn't right in the world. That something needs to happen right now.")

		saynn("Oh right, you didn't pet Rahi enough. You reach your hand out again and begin petting the feline many times. Pat-pat-pat. So much petting is happening that Rahi tries to back off, constant purring escapes from her chest.")

		saynn("[say=pc]No, you stay here and get petted, kitty.[/say]")

		saynn("Time for extra stimulation, you reach your SECOND hand out and use it to scritch the cutie under the chin while the first hand continues to deliver pat after pat.")

		saynn("Rahi bleps unwillingly and leans into the scritches, her cheeks begin to blush while she continues to purr.")

		if (deserved):
			saynn("[say=rahi]You rewarded her enough, {rahiMaster}..[/say]")

			saynn("[say=pc]Only I choose when you're gonna stop being petted, understand?[/say]")

			saynn("[say=rahi]Of course.. myaaa..[/say]")

		else:
			saynn("[say=rahi]You.. you're spoiling her, {rahiMaster}.. meow..[/say]")

			saynn("[say=pc]So? Gonna try and stop me from petting the most fluffy and cute cat?[/say]")

			saynn("[say=rahi]Nu..[/say]")

		saynn("You pet Rahi so much that she begins to pant. Maybe that's enough for now. You give her head a last pat before pulling your hands away.")

		addButton("End", "Enough patting for now", "endthescene")
		if (getModule("RahiModule").getAffection() >= 25):
			addButton("Pet-pet-pet", "Make that kitty squirm from how much you pet her!", "pet_rahi_cum")
	if(state == "pet_rahi_cum"):
		playAnimation(StageScene.SexStart, "start", {npc="rahi"})
		saynn("Without giving Rahi enough time to recover, you suddenly tackle her and proceed to violently pet her head with both your hands! Poor kitty is trying to protect herself but you masterfully catch her paws and wrench them behind her back before delivering more scritches and pets to the hecking floofer.")

		saynn("Rahi's ears turn down, she is blepping constantly, sometimes she goes cross-eyed and produces a noise that sounds kinda like moans. You find sensitive spots that make Rahi the most weak and powerful and increase your onslaught on them. Rahi closes her eyes to try to look less embarrassed.")

		saynn("[say=rahi]Nya-a-ah~..[/say]")

		saynn("The feline's breathing becomes more rapid as her body begins to tense up from such strange but pleasurable sensations. Kitty is probably confused about why simple headpats make her melt so much but she is powerless to resist it.")

		saynn("Although, suddenly, you stop petting the cat. As you do that, Rahi quickly opens her eyes and looks at you.. her needy eyes are almost upset at you.")

		saynn("[say=rahi]Why d-did you.. stop..[/say]")

		saynn("Without answering, you resume the headpats, at a much faster pace than before. Poor kitty, suddenly receiving her pleasure again, can't help but to start squirming and moaning under your hands.")

		saynn("Very soon her body starts to arch itself, her ears flicking, her tail curling around her thigh. Passionate moans escape from the feline as this huge wave of pleasure washes over her.")

		saynn("Finally, after some time, Rahi comes back from her peak, her body trembling with exhaustion and satisfaction.")

		if (deserved):
			saynn("[say=rahi]Wow.. sorry that she didn't do anything to deserve this.[/say]")

			saynn("[say=pc]You're fine, kitty. I'm glad I could make you feel good.[/say]")

		else:
			saynn("[say=rahi]Wow.. thank you so much, {rahiMaster}..[/say]")

			saynn("[say=pc]I'm glad I could make you feel good.[/say]")

		addButton("End", "That's the max level of pettiness", "endthescene")
	if(state == "petplay_scritch"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel"})
		saynn("You begin scratching behind Rahi's ears and hear a soft purring coming from her. The kitty leans into the scritches, her eyes sparkling brightly as she enjoys the sensations. Kitty can't help but to get on her knees before you.")

		saynn("One of your hands moves down to her chin and scritches her fur there. Rahi tilts her head back, exposing more of her neck for you to explore. All the while her purring grows louder.")

		if (!deserved):
			saynn("[say=pc]Who's a cute kitty that I'm totally spoiling for no reason?[/say]")

		else:
			saynn("[say=pc]Who's a cute kitty that deserves all the love and attention?[/say]")

		if (getModule("RahiModule").canTalkInFirstPerson()):
			saynn("[say=rahi]Me-e?..[/say]")

		else:
			saynn("[say=rahi]She-e is?..[/say]")

		saynn("[say=pc]Ye-e-es-s.[/say]")

		saynn("Your digits work their way over her head and down her spine, scritching there under her uniform. Rahi's tail twitches slightly while she is letting out little meows of pleasure. Her eyes close and she begins nuzzling your other hand.")

		saynn("After a few minutes of scritching, you finally pull your hands away. Rahi opens her eyes and looks at you, looking quite content. She lets out another soft meow.")

		addButton("Enough", "That was cute", "endthescene")
		if (getModule("RahiModule").getSkillScore("rahiSkillPetplay") > 5):
			addButton("Belly rubs", "(Petplay) Give Rahi some good belly rubs", "petplay_bellyrubs")
		else:
			addDisabledButton("Belly rubs", "Kitty needs more petplay experience")
	if(state == "petplay_bellyrubs"):
		playAnimation(StageScene.SexStart, "defeated", {npc="rahi", npcBodyState={naked=true}})
		saynn("You're not done yet! You suddenly push Rahi down and unbutton her shirt before exposing her cute belly. Kitty watches with curiosity as you begin to rub her tummy.")

		saynn("Rahi tenses up a little, something inside her makes her try to scratch and nibble on your hands. But the more your fingers move over her soft fur, the more she relaxes. Her eyes close and a low purr begins to escape from her maw yet again.")

		saynn("[say=rahi]Me-e-eow..[/say]")

		saynn("Your fingers continue to brush over Rahi's belly, making her wiggle with delight. Her tail twitches back and forth, poking your legs, while she lets out little meows of happiness. You can't help but to chuckle at the cute sight as you continue to give her lots of belly rubs.")

		saynn("As time goes on, her purring grows louder. She stretches for you, arching her back. Her eyes open a little as she gives you a look of pure bliss.")

		if (getModule("RahiModule").getSkillScore("rahiSkillPetplay") > 7 && getModule("RahiModule").isSkillLearned("rahiSkillSex")):
			saynn("And wow, Rahi seems to be quite wet down there. Someone really enjoys being a kitty way too much.")

			addButtonWithChecks("Breed Rahi", "(Sex) Satisfy your kitty's needs", "sex_breed", [], [ButtonChecks.HasReachablePenis])
			addButtonWithChecks("Strapon Rahi", "(Sex) Satisfy your kitty's needs", "sex_strapon", [], [ButtonChecks.CanWearStrapon])
		addButton("Enough", "That was cute but everything has its limits", "endthescene")
	if(state == "sex_breed"):
		playAnimation(StageScene.SexMissionary, "sex", {npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Since Rahi is so wet you might as well help her solve that. One of your hands pins your kitty to the floor while the second one pulls her shorts down and also exposes your {pc.penis} before getting it hard and ready.")

		saynn("Rahi wiggles out of her shorts, offering her naked body to you.")

		saynn("You guide your member towards Rahi's moist petals and, with one quick motion, spread them, sliding inside your kitty. She is so warm and slick inside, you can't help but to begin pounding her pussy fast and rough, your balls slapping against her taint.")

		saynn("[say=rahi]Mya-a-a~![/say]")

		saynn("Your hands hold her paws pressed into the floor while the tip of your member kneads that kitty's pleasure spot and kisses the womb entrance each time you thrust. You can feel your pet's body shivering, about to cum already..")

		addButton("Cum inside", "Breed your kitty!", "breed_cuminside")
	if(state == "breed_cuminside"):
		playAnimation(StageScene.SexMissionary, "fast", {npc="rahi", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("A few rough thrusts send Rahi over her peak, her body starts shaking and quivering under you while her wet pussy gets extremely tight around your dick, making you cum soon after! Another rough motion and you break inside kitty's babymaker, your {pc.penis} throbbing and shooting waves of {pc.cum} directly inside.")

		saynn("Rahi mewls and pants heavily while you continue to stuff her kitty slit full to the brim.")

		saynn("[say=rahi]Huff-f-f.. So much..[/say]")

		saynn("The pleasure is so strong that Rahi breaks character. You pull your member out, letting some seed to leak out. Lewd.")

		saynn("You offer your kitty some more belly rubs, making her purr again.")

		addButton("Continue", "That was sweet", "endthescene")
	if(state == "sex_strapon"):
		playAnimation(StageScene.SexMissionary, "sex", {npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Since Rahi is so wet you might as well help her solve that. You find the closest strapon to you and put it on before pinning your kitty with one hand while your second one already guides the rubber dick down her moist snatch. All the while Rahi wiggles out of her shorts, offering her naked body to you.")

		saynn("One quick hip motion and you're inside Rahi, your rubber member spreading her petals and penetrating her slit. Being so needy means her pussy is slick from all the juices, allowing you to just slide your artificial dick deep inside her. The friction feels so good you can't help but to start pounding her slit fast and rough.")

		saynn("[say=rahi]Mya-a-a~![/say]")

		saynn("Your hands hold her paws pressed into the floor while the tip of your rubber member kneads that kitty's pleasure spot and kisses the womb entrance each time you thrust. You can feel your pet's body shivering, about to cum already..")

		addButton("Make her cum", "Use your strapon to make that kitty feel good", "strapon_cum")
	if(state == "strapon_cum"):
		playAnimation(StageScene.SexMissionary, "fast", {npc="rahi", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("A few rough thrusts send Rahi over her peak, her body starts shaking and quivering under you while her wet pussy gets extremely tight around your rubber dick. Such tightness means it becomes way harder to keep going, the friction of the toy against your "+str("pussy" if GM.pc.hasVagina() else "taint area")+" sends you past your peak too!")

		saynn("Both you and Rahi shiver and moan passionately, your bodies rubbing against each other. You keep thrusting that toy through the orgasmic waves, breaking into Rahi's womb and causing another spike of pleasure for her. Rahi's needy pussy squirts all over your toy while her eyes roll up.")

		saynn("[say=rahi]Huff-f-f-f..[/say]")

		saynn("You wait for the ecstatic sensations to pass before pulling the wet strapon out and resting it on Rahi's crotch. You both slowly recover your breath.")

		saynn("Your hands offer your kitty some more belly rubs, making her purr again. So cute.")

		addButton("Continue", "That was sweet", "removestrapon")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "petplay_scritch"):
		getModule("RahiModule").advanceSkill("rahiSkillPetplay")

	if(_action == "sex_breed"):
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "sex_strapon"):
		GM.pc.getInventory().equipItem(GlobalRegistry.createItem("Strapon"))
		getModule("RahiModule").advanceSkill("rahiSkillSex")

	if(_action == "breed_cuminside"):
		processTime(5*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_petplaybreed")

	if(_action == "strapon_cum"):
		processTime(5*60)
		GM.pc.orgasmFrom("rahi")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_petplaybreed")

	if(_action == "removestrapon"):
		GM.pc.getInventory().clearSlot(InventorySlot.Strapon)
		endScene()
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
