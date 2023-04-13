extends SceneBase

var deserved = true

func _init():
	sceneID = "rahiRewardTreatScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		deserved = _args[0]

func _reactInit():
	processTime(2*60)

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("What do you wanna feed Rahi?")

		saynn("Seems like that crate of toys also has some packaged treats if you don't possess anything edible. How convenient.")

		addButton("Random treat", "Feed Rahi a random treat that you stole together", "random_treat")
		if (GM.pc.getInventory().hasItemID("appleitem")):
			addButton("Give apple", "Give your kitty an apple to chew on", "apple_treat")
		else:
			addDisabledButton("Give apple", "You don't have any apples")
		if (getModule("RahiModule").isSkillLearned("rahiSkillPetplay")):
			addButton("Pet bowl", "(Petplay) Fill a bowl with some kitty food for Rahi", "petplay_petbowl")
	if(state == "random_treat"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="kneel"})
		saynn("You find a little bag of treats and shake it in front of Rahi. Her eyes fixate on it, tail already flicking back and forth in anticipation. She lets out a little meow of excitement.")

		if (deserved):
			if (getModule("RahiModule").canTalkInFirstPerson()):
				saynn("[say=rahi]Yay. I like treats![/say]")

			else:
				saynn("[say=rahi]Yay. She likes treats![/say]")

		else:
			if (getModule("RahiModule").canTalkInFirstPerson()):
				saynn("[say=rahi]Do I deserve it?.. I probably do..[/say]")

			else:
				saynn("[say=rahi]Does she deserve it?.. She probably does..[/say]")

		saynn("[say=pc]Get on your knees if you want some, kitty.[/say]")

		saynn("You hold a single treat out towards Rahi. But when she tries to grab it, you pull it away. Kitty pouts but eventually gets on her knees before you. She opens her mouth and waits. Seeing such an obedient kitty makes you want to spoil her. You gently place the treat on Rahi's tongue.")

		saynn("As soon as Rahi tastes it, her eyes close in pleasure. She crunches down on it with great pleasure, a purr of content escapes from her.")

		saynn("When Rahi finishes the treat, she licks her lips and looks up at you expectantly.")

		addButton("Enough", "Enough treats", "endthescene")
		addButton("One more", "Feed Rahi another treat", "another_treat")
	if(state == "another_treat"):
		saynn("How can you not when Rahi is being so cute. When you produce another treat from the little bag, her eyes lit up with joy. She eagerly accepts the second treat and noms it!")

		saynn("Rahi savores this treat, she closes her eyes again as she crunches down on it. Then she licks her lips and lets out a happy meow.")

		saynn("That should be enough for now. Don't wanna spoil your kitty too much..")

		addButton("Enough", "Enough treats", "endthescene")
	if(state == "petplay_petbowl"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="allfours"})
		var petLevel = getModule("RahiModule").getSkillScore("rahiSkillPetplay")
		saynn("You find a pet bowl and a box of kitty treats. Perfect. As you approach Rahi, her feline ears perk up at the sight of the pet bowl in your hands.")

		saynn("[say=pc]I wanna feed you, kitty.[/say]")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("You place the bowl on the floor and fill it with kitty treats. Rahi's eyes widen as you do that.")

		if (petLevel < 5):
			if (getModule("RahiModule").canTalkInFirstPerson()):
				saynn("[say=rahi]I can't just grab it, right?..[/say]")

			else:
				saynn("[say=rahi]She can't just grab it, right?..[/say]")

			saynn("[say=pc]Nope.[/say]")

			saynn("After some hesitation, Rahi finally gets on all fours and approaches the bowl. Kitty dips her face into it and begins to slowly munch on the treats, feeling quite embarrassed.")

			saynn("The more she does it, the more she gets into the role, nomming the dry treats like a happy kitty, without even using her paws. The more you watch, the bigger the smile on your face. After a few minutes, Rahi finishes the treats and lifts her head, showing you her muzzle covered in crumbs.")

		else:
			saynn("[say=rahi]Meow![/say]")

			saynn("Without any hesitation, Rahi gets on all fours and crawls up to the bowl, swaying her hips playfully. Kitty dips her face into the treats and begins to munch them while purring contentedly. Seems like your kitty enjoys being treated like a real feline.")

			saynn("She doesn't even use her paws while nomming the dry treats. The more you watch, the bigger the smile on your face. After a few minutes, Rahi finishes the treats and lifts her head, showing you her muzzle covered in crumbs.")

		saynn("[say=pc]Did you like those?[/say]")

		saynn("Rahi lets out a satisfied meow and licks her whiskers.")

		addButton("Enough", "Enough treats", "endthescene")
		if (getModule("RahiModule").isSkillLearned("rahiSkillWatersports")):
			addButton("Piss into the bowl", "(Watersports) Make Rahi lick your urine out of the bowl", "watersports_lickpiss")
	if(state == "watersports_lickpiss"):
		var waterLevel = getModule("RahiModule").getSkillScore("rahiSkillWatersports")
		saynn("You wait for the kitty to be done with the treats before stealing the bowl away from her for a second.")

		saynn("[say=pc]You're probably thirsty, aren't you, kitty?[/say]")

		if (waterLevel < 5):
			saynn("She nods eagerly. But then she sees you placing the bowl on the floor and carefully peeing into it. She gulps audibly. Your kitty is clearly.. surprised. But now it's too late to say no.")

			saynn("As you point at the bowl, Rahi reluctantly crawls up to it and sniffs the contents cautiously. The feline then recoils at the very unpleasant smell. But something makes her commit to it.")

			saynn("Rahi approaches the bowl again and starts slowly lapping up your piss with her tongue. The feline's expression shows disgust, she hesitates a lot between each lap.")

			saynn("Despite the gross smell and taste, Rahi continues to lap up the piss, clearly not wanting to disappoint you.")

			saynn("[say=pc]You don't like it?[/say]")

			saynn("Rahi lifts her head and meows softly. You approach her and pet her for trying. Quiet purring escapes from your kitty.")

			saynn("[say=pc]You will get used to it, kitty.[/say]")

		elif (waterLevel < 10):
			saynn("She nods eagerly. But then she sees you placing the bowl on the floor and carefully peeing into it. She seems.. interested. Her expression doesn't show regret. Which is nice.")

			saynn("As you point at the bowl, Rahi crawls up to it and sniffs the contents. The smell is very unpleasant but she doesn't seem to mind, your kitty got accustomed to it by now.")

			saynn("Without too much hesitation, Rahi begins lapping up the gross pee with her feline tongue, her eyes closed as she tries to focus.")

			saynn("Despite the gross smell and taste, Rahi continues to lap up the piss, clearly not wanting to disappoint you. She is not eager about it but she empties about half of the bowl before stopping and lifting her head.")

			saynn("She meows softly and looks at you.")

			saynn("[say=pc]Proud of you, kitty.[/say]")

			saynn("You approach her and scritch her behind the ears. Kitty purrs while drying her lips with her paws.")

		else:
			saynn("She nods eagerly, already excited. You place the bowl on the floor and carefully pee into it, filling it fully. Rahi crawls around you, wiggling happily.")

			saynn("[say=pc]Okay, there you go.[/say]")

			saynn("As soon as you step away, kitty quickly approaches the bowl and lowers her muzzle into the gross yellow fluid. She sticks her tongue and begins to lapping it all up. Her eyes close in pleasure as she enjoys swallowing the warm piss.")

			saynn("You can't help but to smile seeing your piss slut at work. Training her to do this was so worth it.")

			saynn("After a few minutes, Rahi finishes drinking all your piss. She continues to lick the empty bowl, cleaning it. Then she lets out a satisfied meow and looks up at you.")

			saynn("[say=pc]Great job, kitty.[/say]")

			saynn("You approach her and gently scritch her behind the ears and under the chin. Rahi leans into the touch and licks her lips while purring, happy and satisfied after completing the order with ease.")

		addButton("Enough", "Enough gross stuff", "endthescene")
	if(state == "apple_treat"):
		saynn("You produce an apple and present it to Rahi. Any kind of fruit is forbidden for inmates to have so this is a pretty valuable reward. Kitty's eyes shine brightly when she sees it.")

		if (deserved):
			saynn("[say=rahi]It's for {rahiFP('me', 'her')}?..[/say]")

		else:
			saynn("[say=rahi]It's for {rahiFP('me', 'her')}?.. But {rahiFP('I don\\'t', 'she doesn\\'t')} deserve it..[/say]")

			saynn("[say=pc]That's for me to decide.[/say]")

		saynn("You hand Rahi the apple. She quickly rubs it against the sleeve of her shirt and looks at it, her mouth already getting wet with saliva.")

		saynn("Rahi's sharp fangs sank effortlessly into the crisp, juicy flesh of the apple, tearing off large chunks with each bite.")

		saynn("You can't help but to smile while watching her bite into that apple.")

		saynn("When she was done, she licked the last drops of juice from her lips and looked up at you.")

		saynn("[say=rahi]Thank you..[/say]")

		saynn("Eating this apple gave the kitty some stamina back!")

		addButton("Continue", "That was cute", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "apple_treat"):
		GM.pc.getInventory().removeXOfOrDestroy("appleitem", 1)
		increaseFlag("RahiModule.rahiTired", -2)

	if(_action == "petplay_petbowl"):
		getModule("RahiModule").advanceSkill("rahiSkillPetplay")

	if(_action == "watersports_lickpiss"):
		getModule("RahiModule").advanceSkill("rahiSkillWatersports")
		getCharacter("rahi").cummedInMouthBy("pc", FluidSource.Pissing)

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
