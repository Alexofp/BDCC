extends SceneBase

var deserved = true
var gotFuckedDuringSleep = false
var gotGrindedDuringSleep = false

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
		addButton("Keep choking", "Make your kitty black out", "choke_forgetskillmenu")
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
	if(state == "choke_forgetskillmenu"):
		saynn("What skill do you want Rahi to forget?")

		addForgetButtons()
		if (false):
			addButton("Forget", "You shouldn't see this", "do_forget")
	if(state == "do_forget"):
		playAnimation(StageScene.SexStart, "defeated", {npc="rahi"})
		saynn("The more you hold your hands on Rahi's throat, the weaker she gets.. Your kitty seems to be enjoying that weird sensation of life-threatening helplessness.. until suddenly going limp. Her eyes close, her paws.. hit the floor.")

		saynn("As soon as that happens, you pull your hands away from her throat and instead carefully set her down on the floor. You place your ear against her chest.. She seems to be breathing now. You had pushed her too far.. and she had loved every minute of it.")

		saynn("So, it seems, your kitty is gonna take a nap for some time.")

		addButton("Wait", "Wait until kitty wakes up", "forget_wakeup")
		addButtonWithChecks("Breed her", "Fuck Rahi while she is in this state", "forget_sex", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Grind her face", "Ride Rahi's face while she is in this state", "forget_grind", [], [ButtonChecks.HasReachableVagina])
	if(state == "forget_wakeup"):
		playAnimation(StageScene.SexStart, "start", {npc="rahi"})
		if (gotGrindedDuringSleep):
			saynn("You quickly dry Rahi's face with some cloth before carefully placing her on the bed. Her whiskers twitch slightly, just like the tips of her ears, Rahi might be having some dreams. Probably some lewd ones.")

		elif (gotFuckedDuringSleep):
			saynn("You quickly clean any mess of her thighs and pussy with some cloth and dress your kitty up before carefully placing her on the bed. Her whiskers twitch slightly, just like the tips of her ears, Rahi might be having some dreams. Probably some lewd ones.")

		else:
			saynn("Well, gotta make sure your kitty is still alright. You carefully pick her up and place her on the bed. Her whiskers twitch slightly, just like the tips of her ears, Rahi might be having some dreams.")

		saynn("You try to shake your kitty a bit to wake her up but she doesn't respond. So you just sit nearby and.. wait.")

		saynn("After about half an hour, Rahi has finally begun waking up. She groans softly, her eyes fluttering open. You help her to sit and notice that she seems to be quite.. confused and disoriented")

		saynn("[say=rahi]Head hurts.. How long was she out..[/say]")

		saynn("You gently wrap your arm around her while she holds onto her head with her paws.")

		saynn("[say=pc]30 minutes. How do you feel?[/say]")

		saynn("Silence. Kitty tries to think, wincing occasionally.")

		saynn("[say=rahi]Meow.. She doesn't know.. She feels like she forgot something.. But she doesn't know what..[/say]")

		saynn("Gently, you caress her cheek.")

		saynn("[say=pc]Was it too much, kitty?[/say]")

		saynn("[say=rahi]It felt.. nice.. Everything was so colorful.. But now her head hurts.. So this is pretty much like drinking..[/say]")

		if (gotFuckedDuringSleep):
			saynn("Huh. That's one way to look at it. You pull your kitty in for some cuddles, offering her the aftercare that she needs right now. But then kitty puts her paw on her crotch and mewls softly.")

			saynn("[say=rahi]For some reason she feels very warm.. down there..[/say]")

			saynn("[say=pc]Well, you did get quite aroused.[/say]")

			saynn("[say=rahi]That's.. true..[/say]")

		else:
			saynn("Huh. That's one way to look at it. You pull your kitty in for some cuddles, offering her the aftercare that she needs right now.")

		addButton("Continue", "That was scary", "endthescene")
	if(state == "forget_sex"):
		addCharacter("rahi", ["naked"])
		playAnimation(StageScene.SexAllFours, "teaseflop", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Rahi lays on her back, completely unconscious after you had choked her out during the punishment. You look down at her.. your eyes shining with.. raw desire. Rahi won't say no even if she was conscious anyway..")

		saynn("Your hands pull her shorts.. revealing a beautiful pair of wet needy pussy lips that produce a scent of a horny feline, the bitch is practically asking for it.. You reveal her {rahi.breasts} too and turn her around, making her lay on her belly with her ass sticking up.")

		saynn("You kneel behind her, your fingers brushing lightly over her inner thighs, feeling the warmth. You can't resist the urge to run your fingers over her sensitive clit too. Rahi's body was completely unresponsive..")

		saynn("You expose your {pc.penis} that got quite hard after such juicy sights. You shift closer to her and guide your member to rub against the entrance of her pussy.. feels good.. but you want more..")

		addButton("Fuck Rahi", "Shove your cock inside", "forget_sex_shove")
	if(state == "forget_sex_shove"):
		playAnimation(StageScene.SexAllFours, "fastflop", {npc="rahi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("You apply some more pressure and the tip of your dick easily spreads her moist pussy open. As you push your {pc.penis} inside her, you can't help but to groan as her tight walls clench around you, her warmth and wetness enveloping your shaft and making you more eager.")

		saynn("You put your hands on her ass and begin to thrust into her, each hip motion sending shivers of pleasure through you. The sensations of fucking unconscious Rahi are incredibly, her pussy is unlike any other, with just the right amount of tightness to make you feel intoxicated and addicted.")

		saynn("The tip of your member smashes Rahi's cervix while you pound her faster and faster.. But Rahi just breathes deeply and mewls, she is drooling while her tail is brushing against your leg.")

		saynn("As you fuck her relentlessly, you begin to feel your climax approaching.. There is no way you're not gonna do this.. You must do this..")

		addButton("Cum inside", "Breed your slutty kitty", "forget_sex_cuminside")
	if(state == "forget_sex_cuminside"):
		playAnimation(StageScene.SexAllFours, "insideflop", {npc="rahi", pc="pc", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("With a low growl, you thrust hard inside Rahi one last time, your {pc.penis} pulsing and shooting strings of {pc.cum} deep into her womb. Rahi's body twitches involuntarily a few times as you cum but not much else, your kitty remains completely unresponsive to your touch.")

		saynn("It felt great though.. After you've done stuffing her, you pull out and watch your seed leaking out of her used and abused pussy. What you've done.. was probably wrong.. but the thrill of taking her body without her consent was too much to resist.")

		addButton("Wait", "Wait until kitty wakes up", "forget_wakeup")
	if(state == "forget_grind"):
		playAnimation(StageScene.SexFaceSitting, "grind", {npc="rahi", pc="pc", bodyState={exposedCrotch=true}})
		saynn("Rahi lays on her back, completely unconscious after you had choked her out during the punishment. You look down at her.. your eyes shining with.. raw desire. Rahi won't say no even if she was conscious anyway..")

		saynn("You expose your moist {pc.pussyStretch} pussy and then flip Rahi onto her back before straddling her face. You position yourself so that your slit was directly over Rahi's nose, letting the unconscious kitty get more of your scent. After that, you slowly lower yourself onto her face and begin grinding it..")

		saynn("The sensations are.. amazing.. you can't help but to moan as you ride your kitty, spreading your juices, marking her as yours. It just feels too good to drag your needy cunt over Rahi's face features, you don't even care that she is completely unaware of what is happening, you only care about your own pleasure..")

		saynn("Over time, your orgasm begins to draw near. You increase your pace, grinding Rahi's face until you suddenly let out a loud cry and squirt all over her fur. Even as you are going through your climax, you keep grinding Rahi more, enjoying this feeling of power and control over the helpless feline.")

		saynn("Finally, after cumming hard and covering Rahi's face in your juices, you collapse nearby, exhausted and spent. Rahi is still unconscious, just mewling softly and, for some reason, licking her lips a bit.")

		saynn("What you've done.. was probably wrong.. but the thrill of doing this without her consent was too much to resist.")

		addButton("Wait", "Wait until kitty wakes up", "forget_wakeup")
func addForgetButtons():
	var canForget = getModule("RahiModule").getSkillsCanForget()
	for skillID in canForget:
		var skillInfo = getModule("RahiModule").getSkillInfo(skillID)
		addButton(skillInfo["name"], "Make Rahi forget this skill", "do_forget", [skillID])


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

	if(_action == "choke_forgetskillmenu"):
		processTime(1*60)

	if(_action == "do_forget"):
		var skillToForget = _args[0]
		var skillInfo = getModule("RahiModule").getSkillInfo(skillToForget)
		getModule("RahiModule").forgetSkill(skillToForget)
		addMessage("Rahi forgot the "+str(skillInfo["name"])+" skill due to the lack of oxygen to her brain..")

	if(_action == "forget_wakeup"):
		processTime(30*60)

	if(_action == "forget_sex"):
		gotFuckedDuringSleep = true
		processTime(5*60)

	if(_action == "forget_grind"):
		processTime(7*60)
		getCharacter("rahi").cummedOnBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("rahi")
		gotGrindedDuringSleep = true

	if(_action == "forget_sex_cuminside"):
		processTime(3*60)
		getCharacter("rahi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("pc")
		GM.pc.addSkillExperience(Skill.SexSlave, 30, "rahi_breed")

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved
	data["gotFuckedDuringSleep"] = gotFuckedDuringSleep
	data["gotGrindedDuringSleep"] = gotGrindedDuringSleep

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
	gotFuckedDuringSleep = SAVE.loadVar(data, "gotFuckedDuringSleep", false)
	gotGrindedDuringSleep = SAVE.loadVar(data, "gotGrindedDuringSleep", false)
