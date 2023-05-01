extends SceneBase

var deserved = true

func _init():
	sceneID = "rahiPunishmentChokingScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		deserved = _args[0]

func _reactInit():
	processTime(5*60)
	getModule("RahiModule").advanceSkill("rahiSkillMasochist")

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="defeat"})
		saynn("Rahi is sitting nervously on the edge of her bed, watching you approach her with a dark look in your eyes.")

		if (deserved):
			saynn("[say=rahi]Meow..[/say]")

		else:
			saynn("[say=rahi]She did something wrong?..[/say]")

		saynn("Suddenly, you roughly grab Rahi by her ponytail and pull her off her bed and onto the cold floor. Without warning, you start applying pressure to her throat, just above the collar, choking her.")

		if (deserved):
			saynn("Rahi yelps and gasps for air, her eyes spark with fear.. but also.. obedience. She understands that she deserves this and none of what is about to come won't be gentle.")

		else:
			saynn("Rahi yelps and gasps for air, her eyes spark with fear. She tries to reason with you but everything that comes out from her mouth sounds incredibly muffled. Either way, you don't need a reason to punish your kitty.")

		saynn("Your kitty probably feels like she is drowning.. probably worse than that since you're also blocking some of the blood flow. Obviously, you're not trying to kill her, just teach her a lesson. But since she keeps writhing around on the floor, you can't help but to be somewhat annoyed. Still, occasionally you relax your grip around her throat, letting your kitty grab a gasp or two of air.")

		var painLevel = getModule("RahiModule").getSkillScore("rahiSkillMasochist")
		if (painLevel <= 5):
			saynn("Your kitty isn't trained enough to be a painslut, meaning this isn't arousing for her, not one bit, which makes for a good punishment. You keep a constant eye contact with her, relaxing your grip also when you see her eyes defocusing, your kitty must stay conscious.")

		else:
			saynn("As the punishment continues, you can't help but to notice Rahi's fear slowly being.. combined.. with a strange sense of pleasure. The lack of oxygen is seemingly causing a rush of endorphins to flood her body. You, pushing Rahi's limits, notice her becoming aroused.. there is a small wet spot on her shorts.. that slowly gets bigger. Huh.")

		saynn("All of this took only a few minutes. You wonder if that was good enough of a punishment for her.")

		addButton("Enough", "That was a good punishment", "aftercare")
		if (painLevel > 5):
			addButton("Choke harder", "Be more rough with your kitty", "chokeharder")
	if(state == "aftercare"):
		playAnimation(StageScene.Cuddling, "idle", {npc="rahi"})
		saynn("Yeah, that probably made your kitty rethink some of her decisions. You slowly remove the grip from her neck, allowing Rahi to breathe. She starts panting heavily and rubbing her neck that has some bruises left.")

		saynn("You pull your kitty back onto her bed for some cuddles. You can tell that Rahi needs some good aftercare after what happened. You rest your chin on her shoulder and wait for her to recover.")

		var painLevel = getModule("RahiModule").getSkillScore("rahiSkillMasochist")
		saynn("[say=pc]Did I go too far, kitty?[/say]")

		if (!deserved):
			saynn("[say=rahi]It's just.. Kitty doesn't understand why..[/say]")

			saynn("[say=pc]Sometimes I just wanna test you, push your limits a little.[/say]")

			saynn("[say=rahi]That's.. that's fair.. meow..[/say]")

		else:
			if (painLevel <= 5):
				saynn("[say=rahi]It was.. fair.. She understands..[/say]")

			else:
				saynn("[say=rahi]It was alright..[/say]")

				saynn("Rahi blushes softly, realizing what she just said about a rough punishment. But it's too late to turn back now.")

				saynn("[say=rahi]You can push your kitty even further.. if you want.. meow..[/say]")

		saynn("You hold Rahi close, cuddling her on the bed. Eventually, Rahi calms down from what happened, feeling your touch certainly helped.")

		saynn("[say=rahi]Thank you.. for being here..[/say]")

		saynn("You smile warmly and leave a kiss on Rahi's cheek, making her purr. She then closes her eyes, enjoying the warmth of your embrace for a few more minutes.")

		addButton("Continue", "That was cute", "endthescene")
	if(state == "chokeharder"):
		saynn("You tighten the grip on Rahi's throat even further, your fingers digging into her skin, leaving bruises and making breathing impossible. She still keeps trying to gasp though but quickly realizes that she can't make any noises. Her body squirming on the floor from this crazy mix of pain and pleasure.")

		saynn("Her paws reach for your hands and just kinda hold onto them, your kitty is getting weaker by the seconds, her lips parted open, her tongue slightly out and drooling, her lusty eyes looking somewhere else.")

		saynn("The lack of oxygen is making her dizzy.. but there is also another feeling.. You can tell that all the choking is making your kitty so horny that she is not that far away from her climax. The crotch area of her shorts is so wet that you can smell her juices, her stiff nipples perk through the shirt.")

		saynn("If you continue this.. your kitty will surely black out.. and forget one of her learned skills completely.")

		addButton("Make her cum", "Rather just let your kitty cum from this", "chokecum")
	if(state == "chokecum"):
		saynn("Just when Rahi thinks she can't take it anymore, you release your grip on her throat, allowing her to gasp for air. But before your kitty could catch her breath, your digits slid under her uniform, quickly finding her clit and then rubbing it at a fast pace.")

		saynn("Rahi cries out from pleasure, her body tensing up. The pain and pleasure mix together, clouding her mind and creating a sensation that was overwhelming and all-consuming.")

		saynn("In mere seconds, she was cumming hard, her body shaking violently under your touch, her pussy gushing out girlcum all over your hand. All the while, you continue to finger her, pushing her to the edge again and again.")

		saynn("You begin to lose track of how many times Rahi cums, she keeps gasping and moaning almost non-stop, her pussy pulsating and squirting until there is no juices left.")

		saynn("Finally, as you push her to her limits once more, Rahi starts shaking from another intense orgasm. But after that, she just flops onto you, making weak noises and panting, her body completely spent.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("You hug your kitty, feeling quite satisfied by the display.")

		saynn("[say=rahi]Me-e..ow..[/say]")

		saynn("Gently, you pick up your kitty and set her down on the bed, letting her get some rest after this.. punishment.")

		addButton("Continue", "That was cute", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "aftercare"):
		processTime(10*60)

	if(_action == "chokeharder"):
		processTime(5*60)

	if(_action == "chokecum"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
