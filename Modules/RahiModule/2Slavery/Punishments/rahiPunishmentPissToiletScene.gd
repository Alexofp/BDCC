extends SceneBase

var deserved = true

func _init():
	sceneID = "rahiPunishmentPissToiletScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		deserved = _args[0]

func _reactInit():
	processTime(5*60)
	var rahi = getCharacter("rahi")
	rahi.getInventory().equipItem(GlobalRegistry.createItem("inmatewristcuffs"))
	rahi.getInventory().equipItem(GlobalRegistry.createItem("inmateanklecuffs"))
	rahi.getInventory().equipItem(GlobalRegistry.createItem("ringgag"))
	rahi.cummedInMouthBy("pc", FluidSource.Pissing, 0.5)
	getModule("RahiModule").advanceSkill("rahiSkillWatersports")

func _run():
	if(state == ""):
		addCharacter("rahi", ["naked"])
		aimCameraAndSetLocName("main_bathroom1")
		playAnimation(StageScene.Urinal, "idle", {pc="rahi", bodyState={naked=true}})
		var waterLevel = getModule("RahiModule").getSkillScore("rahiSkillWatersports")
		if (waterLevel < 5):
			saynn("Time for a very degrading punishment. You leash your kitty and bring her into the bathroom. She looks around, unsure.")

		else:
			saynn("Time for a very degrading punishment. You leash your kitty and bring her into the bathroom. She looks around and sighs, already having a rough idea of what you wanna do with her.")

		saynn("Your hands reach out and start forcibly taking Rahi's uniform off, exposing her perky tits and a pink pussy. Then you produce some restraints. The first thing is the ring gag that goes inside Rahi's mouth.")

		if (deserved):
			if (waterLevel < 5):
				saynn("[say=rahi]{rahiFP('I', 'She')} screwed up.. But what are you gonna do here..[/say]")

			else:
				saynn("[say=rahi]You gonna do what {rahiFP('I think', 'she thinks')} you gonna do?..[/say]")

		else:
			saynn("[say=rahi]{rahiFP('I don\\'t', 'She doesn\\'t')} know what {rahiFP('I', 'she')} did but {rahiFP('I am', 'she is')} sorry..[/say]")

		saynn("Without explaining anything, you put cuffs on Rahi's paws and ankles. Then you bring her to one of the urinals and start chaining her to it. Kitty looks at you with pleading eyes, the ring gag forces her mouth to be wide opened and also makes her drool.")

		if (GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
			saynn("You expose your {pc.penis} and press it against Rahi's lips. Then you wait for the urge to happen..")

		elif (GM.pc.hasReachableVagina()):
			saynn("You expose your {pc.pussyStretch} pussy and press it against Rahi's lips. Then you wait for the urge to happen..")

		else:
			saynn("You expose your crotch and press your pisshole against Rahi's lips. Then you wait for the urge to happen..")

		if (waterLevel < 5):
			saynn("And soon enough, a stream of gross yellow piss emerges from your urethra and gets directed towards Rahi's mouth. She desperately tries to avoid it but you grab her ponytail and yank on it, forcing your kitty to start swallowing your urine.")

			saynn("Kitty coughs and gasps while you keep pissing down her throat, her maw tries to close around the ring gag but the metal is too strong. The poor feline clearly doesn't have enough experience yet. But that's why it's a good punishment.")

			saynn("By the end of it, your kitty looks incredibly embarrassed, her eyes are watery.")

		elif (waterLevel < 12):
			saynn("And soon enough, a stream of gross yellow piss emerges from your urethra and gets directed towards Rahi's mouth. Surprisingly, she doesn't fight it. Instead your kitty focuses on quickly swallowing your urine each time she feels her mouth getting full. Her ears lower themselves as Rahi realizes how she is being used.")

			saynn("Eventually she can't keep up anymore and starts to cough. Luckily the metal ring prevents her from biting you even if she wanted to. Kitty is forced to swallow your piss load until there is nothing left in your bladder.")

			saynn("By the end of it, your kitty looks incredibly embarrassed, her eyes are watery. But she is also.. blushing. Probably because her pussy has gotten wet.")

		else:
			saynn("And soon enough, a stream of gross yellow piss emerges from your urethra and gets directed towards Rahi's mouth. And instead of fighting, she eagerly swallows your urine every time she can.")

			saynn("It seems the training has paid off, your kitty is a hungry piss whore that loves being your piss toilet. Her lusty eyes look up at you while she obediently gulps your piss.")

			saynn("By the end of it, your kitty is panting heavily, her eyes show passion, her pussy dripping juices down into the urinal.")

		saynn("Is this enough of a punishment you wonder.")

		addButton("Enough", "Kitty got punished", "do_untie")
		addButton("Golden shower", "Piss all over her body", "golden_shower")
	if(state == "golden_shower"):
		saynn("No, it's not, your kitty needs to be humiliated more. You pull away slightly and direct the rest of the piss stream all over her body. The gross smelly fluid hits Rahi's face, hair, neck, chest, tits, belly, legs. Some of the piss streams between her pussy lips. Kitty closes her eyes and just lets you give her a golden shower.")

		var waterLevel = getModule("RahiModule").getSkillScore("rahiSkillWatersports")
		if (waterLevel < 5):
			saynn("Very soon her fur gets fully drenched in your urine. The smell is awful. After you've done using her, kitty slowly opens her sorry eyes. Her ears lowered because of so much humiliation.")

		elif (waterLevel < 12):
			saynn("Very soon her fur gets fully drenched in your urine. The smell is awful. But you can spot kitty sneakily licking her lips. After you've finished using her, she slowly opens her lusty eyes. It's still a very humiliating experience for Rahi but it seems she found some enjoyment in it too.")

		else:
			saynn("Very soon her fur gets fully drenched in your urine. The smell is awful. But you can spot kitty playfully licking her lips. After you've finished using her, she slowly opens her lusty eyes. The only thing that's more wet currently is Rahi's slit, she seems to love every second of this.")

		addButton("Enough", "Kitty got punished", "do_untie")
		if (getModule("RahiModule").isSkillLearned("rahiSkillProstitution")):
			addButton("Share Rahi", "(Prostitution) Let others use Rahi as a piss toilet", "share_rahi")
	if(state == "share_rahi"):
		saynn("Hm, there seem to be random inmates walking past you. And they do seem to be intrigued by what's happening.")

		saynn("[say=pc]Hey. If anyone wants to relieve themselves, use this piss toilet.[/say]")

		var waterLevel = getModule("RahiModule").getSkillScore("rahiSkillWatersports")
		saynn("Some inmates instantly approach your kitty, already pulling down their shorts. A few dicks and a pussy. They make a nice queue.")

		if (waterLevel < 5):
			saynn("Rahi tries to resist it but there is nothing she can do. She is forced to swallow more urine as the first participant starts pissing down her throat. And every time she slacks, the piss starts flowing down her chin and tits, drenching her fur and adding another gross scent that she won't be able to wash away for a while.")

			saynn("Time passes. Rahi serves as a piss toilet for another few dicks. Then one of the girls grinds their pussy into your kitty's muzzle before proceeding to piss all over their face. At this point she has just given up, swallowing every fluid that ends up in her mouth.")

			saynn("Kitty looks incredibly sad. Her ponytail and fur are ruined. She smells very gross. And she swallowed a lot of urine. After the last person has finished using her, kitty just lets her own piss stream out, peeing down into the urinal.")

		elif (waterLevel < 12):
			saynn("Rahi doesn't resist much, she knows that there is nothing she can do. She is forced to swallow more urine as the first participant starts pissing down her throat. Sometimes it gets too much and the piss starts flowing down her chin and tits, drenching her fur and adding another gross scent that she won't be able to wash away for a while.")

			saynn("Time passes. Rahi serves as a piss toilet for another few dicks. Then one of the girls grinds their pussy into your kitty's muzzle before proceeding to piss all over their face. And Rahi looks.. happy.. she got used to swallowing every fluid that ends up in her mouth.")

			saynn("By the end of it, Rahi's ponytail and fur are ruined. She smells very gross. And she swallowed a lot of urine which satisfied her thirst. After the last person has finished using her, kitty just lets her own piss stream out, peeing down into the urinal.")

		else:
			saynn("Rahi doesn't resist at all, she eagerly lets others use her as a piss toilet. Rahi makes gulping noises as she swallows more urine when the first participant starts pissing down her throat. Sometimes it gets too much and the piss starts flowing down her chin and tits, drenching her fur and adding another gross scent that she won't be able to wash away for a while.")

			saynn("Time passes. Rahi serves as a toilet for another few dicks. Then one of the girls grinds their pussy into your kitty's muzzle before proceeding to piss all over their face. And Rahi looks.. slutty.. She loves swallowing every fluid that ends up in her mouth.")

			saynn("By the end of it, Rahi's ponytail and fur are ruined. She smells very gross. And she swallowed a lot of urine which satisfied her thirst and made her incredibly horny. After the last person has finished using her, kitty just lets her own piss stream out, peeing down into the urinal.")

		addButton("Enough", "Kitty got punished", "do_untie")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_untie"):
		getCharacter("rahi").resetEquipment()
		endScene()
		return

	if(_action == "golden_shower"):
		getCharacter("rahi").pissedOnBy("pc")

	if(_action == "share_rahi"):
		processTime(20*60)
		getCharacter("rahi").cummedInMouthBy("pc", FluidSource.Pissing, 0.5)
		getModule("RahiModule").advanceSkill("rahiSkillProstitution")
		getCharacter("rahi").pissedOnBy("pc")

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
