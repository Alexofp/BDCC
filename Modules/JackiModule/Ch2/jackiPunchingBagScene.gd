extends SceneBase

var anger = 0.0
var corruption = 0.0
var lust = 0.0
var hasUnderwear = false
var buttScore = 0
var soundScore = 0

func _init():
	sceneID = "jackiPunchingBagScene"

func _reactInit():
	getCharacter("jacki").updateBodyparts()

func _run():
	if(state == ""):
		anger = getFlag("JackiModule.jackiAnger", 0.0)
		corruption = getFlag("JackiModule.jackiCorruption", 0.0)
		lust = getFlag("JackiModule.jackiLust", 0.0)
		hasUnderwear = getModule("JackiModule").shouldUnderwear()
		buttScore = getModule("JackiModule").getSkillScore("jackiSkillButtslut")
		soundScore = getModule("JackiModule").getSkillScore("jackiSkillSounding")
		saynn("Huh. You thought you saw Jacki. But no. She is not in her usual spot. Her yoga mat is unoccupied.")

		saynn("Makes you wonder if she decided to take a break today..")

		addButton("Look around", "Maybe something here will help you figure out this mystery", "risha_bullies_jacki")
	if(state == "risha_bullies_jacki"):
		aimCameraAndSetLocName("gym_nearbathroom")
		GM.pc.setLocation("gym_nearbathroom")
		addCharacter("jacki", ["naked"])
		addCharacter("risha")
		playAnimation(StageScene.HangingDuo, "idle", {npc="risha", pc="jacki", bodyState={naked=true}})
		saynn("Oh, there she is. You see Jacki in the other corner of the gym area.. Looks like Risha is there too, the lynx guard.")

		saynn("[say=risha]So you're saying that you're not a punching bag? Because I swear that you look like one.[/say]")

		saynn("[say=jacki]I'm not![/say]")

		saynn("One of the punching bags is laying on the floor while Jacki is taking its place, hanging from the hook that was holding it, her paws cuffed to it. She is naked too, her dusty uniform was dropped onto the ground.")

		saynn("[say=risha]Pff. You don't have the muscles to not be one. Muscles or the pussy.[/say]")

		saynn("Risha extends her claws and catches Jacki's chastity piercings before tugging on them hard. Jacki instantly starts to whine, clearly in pain.")

		addButton("Intervene", "Stop that bitch from hurting Jacki", "intervene")
		addButton("Just watch", "Who cares. You don't wanna fight that lynx", "justwatch")
	if(state == "justwatch"):
		playAnimation(StageScene.HangingSex, "tease", {npc="risha", pc="jacki", bodyState={naked=true}})
		saynn("You don't need any problems with the guards. Whatever happened here, it's Jacki's problem anyway.")

		saynn("The longer Risha tugs on the piercings, the more Jacki quivers and the more discomfort her face shows.")

		saynn("[say=risha]Say it. Or I might just rip them out by accident~.[/say]")

		saynn("[say=jacki]Ngh-h-h.. f-fh-h..[/say]")

		saynn("Jacki throws her head back and huffs, her toes curling.")

		saynn("[say=jacki]F-fuck off.. D-do it.. You will only h-help me..[/say]")

		saynn("Risha tilts her head and stops for a second.. just so she can tug on her clit ring using the bell that is attached to it by a little chain. That makes Jacki howl painfully, her legs shaking.")

		saynn("[say=risha]You don't get it.. That is just the first step. I'm not leaving until that pussy is leaking cum.[/say]")

		saynn("[say=jacki]H-huff-f!..[/say]")

		saynn("Jacki endures this pain for as long as she can.. A little crowd of inmates begins to form around them.")

		saynn("[say=risha]And it looks like I won't be the only one~.[/say]")

		saynn("[say=jacki]F-fine!.. I'm just a prisoner bitch. I don't have a name, j-just a number![/say]")

		saynn("[say=risha]Huh. What about me?[/say]")

		saynn("Risha relaxes the grip on Jacki's piercings a bit.")

		saynn("[say=jacki]I'm sorry for being rude. Really f-fucking sorry..[/say]")

		saynn("Risha smiles and starts pulling away her palm from Jacki's crotch.. just to smack her constrained pussy lips as a parting gift. Everyone that has a pussy in the crowd winces as Jacki lets out a gut-wrenching cry, her tortured slit looking red by now.")

		saynn("[say=risha]That's better. Don't forget this lesson, mut. You're lucky I've torn enough sluts for one life already.[/say]")

		saynn("Risha stops torturing Jacki.. and just starts walking away, leaving the wolfie still cuffed up.")

		addButton("Continue", "See what happens next", "justwatch_rishaleft")
	if(state == "justwatch_rishaleft"):
		removeCharacter("risha")
		playAnimation(StageScene.HangingDuo, "idle", {npc="pc", pc="jacki", bodyState={naked=true}})
		saynn("Some inmates show a lot of interest in Jacki. But after seeing how much damage her slit got, decide to avoid her.")

		saynn("And so.. life continues as normal. The crowd is dispersing, inmates going through their normal routines, doing exercises, lifting weights, while Jacki is left hanging.")

		saynn("When the crowd becomes very thin, Jacki notices you.. Looks like you have to act.")

		addButton("Free her", "Uncuff Jacki after seeing what happened", "justwatch_free")
		addButton("Leave", "Whatever", "justwatch_leave")
	if(state == "justwatch_leave"):
		saynn("After a direct eye contact with Jacki.. you decide to just leave.")

		if (anger > -0.1):
			saynn("[say=jacki]Huff.. Jerk..[/say]")

		else:
			saynn("[say=jacki]H-hey.. I thought we were friends..[/say]")

		addButton("Continue", "See what happens next", "endscene_removerestraints")
	if(state == "justwatch_free"):
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("Oh well, you decide to free the wolfie, unchaining her from the hook. She quickly grabs her dusty clothes and puts them on. A noise of discomfort escapes her lips when the fabric of her shorts touches her pussy.")

		if (anger > -0.1):
			saynn("[say=jacki]Took you a while..[/say]")

			saynn("[say=pc]I shouldn't have done anything?[/say]")

			saynn("[say=jacki]Huff..[/say]")

			saynn("She quickly walks away, paw on her crotch.")

		else:
			saynn("[say=jacki]Thanks..[/say]")

			saynn("[say=pc]You're okay?[/say]")

			saynn("Jacki shrugs.")

			saynn("[say=jacki]I think I need to go to the doctor.[/say]")

			saynn("[say=pc]You do that.[/say]")

			saynn("She quickly walks away, paw on her crotch.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "intervene"):
		playAnimation(StageScene.Duo, "shove", {npc="risha"})
		saynn("You shove Risha away from Jacki. She is.. big.. but having an element of surprise helps.")

		saynn("[say=pc]Fuck off.[/say]")

		saynn("The lynx manages to keep herself from falling. She turns towards you, her red eyes shining brightly.")

		saynn("[say=risha]Hah. You two are fuck buddies or something?[/say]")

		saynn("[say=pc]That's not your problem. I told you to fuck off.[/say]")

		saynn("Risha smiles, her paw grabs her stun baton.")

		saynn("[say=risha]I wanna make it my problem though~. Let's dance. I will fuck off if you win~.[/say]")

		saynn("Looks like it's a fight.")

		addButton("Fight", "Start the fight", "fight_risha")
	if(state == "lost_risha"):
		playAnimation(StageScene.Duo, "defeat", {npc="risha"})
		saynn("Defeated, you drop to your knees before Risha.")

		saynn("[say=risha]That's it? Weak~.[/say]")

		saynn("Easy to say when you have the armor.")

		saynn("Risha walks up to you and pats you on the head.")

		saynn("[say=risha]It was a good try though. How about this..[/say]")

		saynn("Risha smiles as she looks around, eyeing the crowd that has gathered.")

		saynn("[say=risha]Kiss my boot. And I might even free your girl. Her cunt is useless for me anyway.[/say]")

		addButton("Kiss boot", "Do as she says", "lost_kiss")
		addButton("Refuse", "Naaaaah", "lost_nokiss")
	if(state == "lost_kiss"):
		playAnimation(StageScene.SexFeetPlay, "head", {pc="risha", npc="pc"})
		saynn("That sounded like a good trade to you. You lean very low and admire Risha's dirty boots.. before giving one of them a little smooch.")

		saynn("[say=risha]Oh wow. Look at you. Ready to do anything for {pc.his} lady.[/say]")

		saynn("Suddenly Risha uses that boot to push you down to the ground. She then puts it on your cheek, rubbing her dirt in.")

		saynn("[say=risha]You see this, inmate? Your white knight over here is ready for any sacrifice. Keep {pc.himHer}, such a good doormat~.[/say]")

		saynn("Jacki huffs at Risha.")

		saynn("[say=jacki]Enough.[/say]")

		saynn("[say=risha]Sure~.[/say]")

		saynn("Risha pulls her boot away from your face and walks up to Jacki.")

		saynn("[say=risha]Remember this next time you will want to disobey.[/say]")

		saynn("Jacki lowers her gaze while Risha uncuffs her.")

		saynn("[say=risha]Have fun~.[/say]")

		saynn("And just like that, she walks away.")

		addButton("Continue", "See what happens next", "lost_kiss_after")
	if(state == "lost_kiss_after"):
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="jacki"})
		saynn("Jacki quickly puts on her dusty clothes.")

		if (anger > -0.1):
			saynn("[say=jacki]So.. why did you help me?[/say]")

			saynn("You shrug.")

			saynn("[say=jacki]Huff.. never mind. Thanks, okay?[/say]")

			saynn("It quickly gets awkward. So Jacki just walks away.")

		else:
			saynn("[say=jacki]You're okay?..[/say]")

			saynn("[say=pc]Yeah, mostly.[/say]")

			saynn("Jacki swipes the dirt off your face.")

			saynn("[say=jacki]Well.. Thank you. You didn't have to do that.[/say]")

			saynn("[say=pc]I know.[/say]")

			saynn("She offers you a little kind smile. And then just returns to her spot.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lost_nokiss"):
		playAnimation(StageScene.Duo, "kneel", {npc="risha", bodyState={naked=true}})
		saynn("You refuse and spit on Risha's boots instead.")

		saynn("[say=risha]Brave. You two are worthy of each other.[/say]")

		saynn("Suddenly, Risha grabs and undresses you before cuffing your wrists together.")

		saynn("[say=risha]Which is why..[/say]")

		saynn("She starts pulling you up onto your feet. You don't help her.. but the lynx is strong enough to lift you up anyway..")

		addButton("Continue", "See what happens next", "lost_nokiss_hang")
	if(state == "lost_nokiss_hang"):
		playAnimation(StageScene.HangingDuo, "idle", {npc="risha", pc="pc", bodyState={naked=true}})
		saynn("[say=risha]..you will join her.[/say]")

		saynn("Risha lifts your hands up high and hooks you up to the same hook as Jacki, meaning your naked bodies are now pressed together.")

		saynn("The feline then pushes one of you, causing your bodies to bump even more.")

		saynn("[say=jacki]Eek.[/say]")

		saynn("[say=risha]Enjoy~.[/say]")

		saynn("And just like that, Risha walks away, leaving you two alone.")

		addButton("Continue", "See what happens next", "lost_nokiss_hang_together")
	if(state == "lost_nokiss_hang_together"):
		playAnimation(StageScene.HangingSolo, "idle", {bodyState={naked=true}})
		if (anger > -0.1):
			saynn("And so you both are hanging together now.. Some inmates see you and giggle.")

			saynn("[say=jacki]So.. what's the plan?[/say]")

			saynn("[say=pc]Plan?[/say]")

			saynn("[say=jacki]Yeah, we gotta get out somehow. I don't wanna spend more time with you than I have to.[/say]")

			saynn("Kinda rude. You try to tug on the cuffs but it will take some time to escape them..")

			saynn("Suddenly Jacki hugs your waist with her legs and begins climbing you like that, with quick humping motions.")

			saynn("[say=pc]Hey.[/say]")

			saynn("[say=jacki]What.[/say]")

			saynn("You can feel her chastity piercings rubbing against your naked skin.. just like she feels her pussy rubbing against you..")

			saynn("In the end, she manages to raise her hands enough to pull them out of the hook. Her paws are still cuffed so she slides off you while hugging you with her legs again.")

			saynn("After that, she turns away, about to leave..")

			saynn("[say=jacki]Gr-r.. fine.[/say]")

			saynn("She turns around and helps you too, using her cuffed paws to push you up, enough for you to free your hands too.")

			saynn("[say=jacki]Here. That's my thanks.[/say]")

			saynn("And so, Jacki grabs her clothes and walks away after that.")

		else:
			saynn("And so you both are hanging together now.. Some inmates see you and giggle.")

			saynn("[say=jacki]Well this is awkward..[/say]")

			saynn("[say=pc]Yeah, kinda.. Any way we can escape?[/say]")

			saynn("[say=jacki]If there was, I would already.. huh. But now I have you.[/say]")

			saynn("[say=pc]You always did.[/say]")

			saynn("Jacki blushes..")

			saynn("[say=jacki]That's.. not what I meant.. wruff. I can maybe try to climb you and free my hands.[/say]")

			saynn("[say=pc]Sure. Anything.[/say]")

			saynn("[say=jacki]The only problem is.. I'd have to use my legs.[/say]")

			saynn("[say=pc]I mean.. sure?[/say]")

			saynn("You only understand what she meant when she actually began doing it. Jacki hugs your waist with her legs and begins climbing you like that, with quick humping motions. You can feel her chastity piercings rubbing against your naked skin.. just like she feels her pussy rubbing against you.. Kinda lewd.")

			saynn("In the end, she manages to raise her hands enough to pull them out of the hook. Her paws are still cuffed so she slides off you while hugging you with her legs and arms. Kinda wholesome.")

			saynn("[say=pc]I see what you meant.[/say]")

			saynn("After that, Jacki pulls you up as much as she can, allowing you to free your hands from the hook as well.")

			saynn("[say=jacki]There you go..[/say]")

			saynn("She quickly puts on her dusty clothes.")

			saynn("[say=jacki]Thank you. You saved me there.[/say]")

			saynn("Not the first time she had to be saved..")

			saynn("[say=pc]Don't mention it.[/say]")

			saynn("After that, Jacki nods and returns to her spot.")

		addButton("Continue", "See what happens next", "endscene_removerestraints")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "risha_bullies_jacki"):
		processTime(5*60)
		getCharacter("jacki").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))

	if(_action == "intervene"):
		processTime(10*60)

	if(_action == "justwatch"):
		processTime(5*60)

	if(_action == "justwatch_rishaleft"):
		processTime(3*60)

	if(_action == "justwatch_free"):
		getModule("JackiModule").addAnger(-5)
		getModule("JackiModule").makeJackiBusy()
		getCharacter("jacki").removeAllRestraints()

	if(_action == "justwatch_leave"):
		getModule("JackiModule").addAnger(100)
		getModule("JackiModule").makeJackiBusy()

	if(_action == "endscene_removerestraints"):
		getCharacter("jacki").removeAllRestraints()
		endScene()
		return

	if(_action == "fight_risha"):
		runScene("FightScene", ["risha"], "risha_fight")
		return

	if(_action == "lost_kiss"):
		processTime(3*60)

	if(_action == "lost_nokiss"):
		processTime(5*60)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))

	if(_action == "lost_kiss_after"):
		processTime(10*60)
		getModule("JackiModule").addAnger(-10)
		getCharacter("jacki").removeAllRestraints()

	if(_action == "lost_nokiss_hang"):
		processTime(3*60)

	if(_action == "lost_nokiss_hang_together"):
		processTime(10*60)
		getModule("JackiModule").addLust(2)
		getModule("JackiModule").addAnger(-5)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "risha_fight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_risha")
			addExperienceToPlayer(50)
		else:
			setState("lost_risha")
			addExperienceToPlayer(5)

func saveData():
	var data = .saveData()

	data["anger"] = anger
	data["corruption"] = corruption
	data["lust"] = lust
	data["hasUnderwear"] = hasUnderwear
	data["buttScore"] = buttScore
	data["soundScore"] = soundScore

	return data

func loadData(data):
	.loadData(data)

	anger = SAVE.loadVar(data, "anger", 0.0)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	lust = SAVE.loadVar(data, "lust", 0.0)
	hasUnderwear = SAVE.loadVar(data, "hasUnderwear", false)
	buttScore = SAVE.loadVar(data, "buttScore", 0)
	soundScore = SAVE.loadVar(data, "soundScore", 0)
