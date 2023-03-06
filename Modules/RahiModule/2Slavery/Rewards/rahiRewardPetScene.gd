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

		saynn("[say=rahi]Yes, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"..[/say]")

		saynn("Rahi tilts her head down while you reach your hand out towards her head. The feline is clearly being cautious.")

		saynn("But she shouldn't have worried, you plop your hand between her ears, giving the feline a good headpat. Kitty offers you a soft smile.")

		if (deserved):
			saynn("[say=rahi]Thank you.. She wants to be the best kitty for you, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"..[/say]")

		else:
			saynn("[say=rahi]Why are you.. Thank you.. She doesn't deserve it..[/say]")

		saynn("Kitty seemed to like that.")

		addButton("End", "Enough patting for now", "endthescene")
		if (getModule("RahiModule").getAffection() >= 7):
			addButton("Pet again", "Pet that kitty again", "pet_rahi_again")
	if(state == "pet_rahi_again"):
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
	if(state == "pet_rahi_more"):
		saynn("You feel like something isn't right in the world. That something needs to happen right now.")

		saynn("Oh right, you didn't pet Rahi enough. You reach your hand out again and begin petting the feline many times. Pat-pat-pat. So much petting is happening that Rahi tries to back off, constant purring escapes from her chest.")

		saynn("[say=pc]No, you stay here and get petted, kitty.[/say]")

		saynn("Time for extra stimulation, you reach your SECOND hand out and use it to scritch the cutie under the chin while the first hand continues to deliver pat after pat.")

		saynn("Rahi bleps unwillingly and leans into the scritches, her cheeks begin to blush while she continues to purr.")

		if (deserved):
			saynn("[say=rahi]You rewarded her enough, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"..[/say]")

			saynn("[say=pc]Only I choose when you're gonna stop being petted, understand?[/say]")

			saynn("[say=rahi]Of course.. myaaa..[/say]")

		else:
			saynn("[say=rahi]You.. you're spoiling her, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+".. meow..[/say]")

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
			saynn("[say=rahi]Wow.. thank you so much, "+str(getFlag("RahiModule.rahiPCName", GM.pc.getName()))+"..[/say]")

			saynn("[say=pc]I'm glad I could make you feel good.[/say]")

		addButton("End", "That's the max level of pettiness", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
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
