extends SceneBase

func _init():
	sceneID = "NuraTalkScene"

func _run():
	if(state == ""):
		addCharacter("nura")
		playAnimation(StageScene.Duo, "stand", {npc="nura"})
		saynn("You approach Nur-A. She seems to be in her stand-by mode, literally just standing still.")

		saynn("[say=nura]Hello, I am Nur-A. How may I assist you?[/say]")

		addButton("Memory?", "Ask if she remembers anything", "talk_memory")
		addButton("Heal me", "Ask Nur-A to heal your wounds", "healcheck")
		addButton("Emotional help", "Ask how can Nur-A help you emotionally", "emo_help")
		if (!getFlag("CellblockModule.NuraGaveTool")):
			if (!getFlag("CellblockModule.NuraFoundTool")):
				addDisabledButton("Give tool", "You're missing the tool to give to Nur-A")
			else:
				addButton("Give tool", "Give Nur-A the giant syringe that you found", "give_syringe")
		addButton("Leave", "Time to go", "endthescene")
	if(state == "give_syringe"):
		saynn("You present Nur-A giant syringe that you have found.")

		saynn("[say=pc]Here, I think this is compatible with you.[/say]")

		saynn("Nur-A grabs the syringe and then transforms her hand before inserting the syringe into the empty opening. The syringe almost instantly gets filled with some kind of drug before Nur-A transforms her hand back.")

		saynn("[say=nura]Nur-A appreciates it. I am now capable of serving my purpose.[/say]")

		saynn("[say=pc]Maybe there are other tools designed for you?[/say]")

		saynn("[say=nura]I am lacking that information.[/say]")

		saynn("Fair, she was abandoned here for a reason probably.")

		addButton("Continue", "Ask something else", "")
	if(state == "talk_memory"):
		saynn("[say=pc]Do you remember anything? Why are you here?[/say]")

		saynn("Nur-A clearly hears you but then stays quiet for a few seconds.")

		saynn("[say=nura]I am Nur-A. I am a nurse android. My purpose is to provide medical assistance and emotional support to those in need.[/say]")

		saynn("You sigh.")

		saynn("[say=pc]Anything else?[/say]")

		saynn("[say=nura]My programming doesn't include any other purposes. My main and only goal is to assist you and fulfill my duties as a nurse android.[/say]")

		saynn("Right.")

		addButton("Continue", "Ask something else", "")
	if(state == "heal_success"):
		saynn("[say=pc]Alright. I need some medical help.[/say]")

		saynn("Android's lifeless eyes scan you out.")

		saynn("[say=nura]Please remain still while I administer pain relief.[/say]")

		saynn("She then brings her hand to your shoulder. Her whole wrist transforms, revealing an industrial syringe filled with some kind of drug. The sharp needle pierces your shoulder with ease before injecting you with painkillers. You already feel much better.")

		saynn("[say=nura]Painkiller administered.[/say]")

		saynn("[say=pc]Thank you.[/say]")

		saynn("She transforms her hand back and stares at you.")

		saynn("[say=nura]Anything else I can help you with?[/say]")

		addButton("Continue", "Ask something else", "")
	if(state == "heal_fail"):
		saynn("[say=pc]Alright. I need some medical help.[/say]")

		saynn("Android's lifeless eyes scan you out.")

		saynn("[say=nura]Please remain still while I administer pain relief.[/say]")

		saynn("She then brings her hand to your shoulder. Her whole wrist transforms, revealing.. nothing. It looks like there is a spot for some kind of tool. But that tool is clearly missing.")

		saynn("[say=nura]Error. Unable to complete the task due to missing equipment. Nur-A is very sorry.[/say]")

		saynn("She transforms her hand back and stares at you.")

		saynn("[say=nura]Anything else I can help you with?[/say]")

		saynn("[say=pc]Probably not.[/say]")

		addButton("Continue", "Ask something else", "")
	if(state == "emo_help"):
		saynn("[say=pc]What do you mean by emotional help, Nur-A?[/say]")

		saynn("The android stares at you.")

		saynn("[say=nura]Nur-A is capable of administering hugs.[/say]")

		saynn("[say=pc]Just hugs?[/say]")

		saynn("[say=nura]I am lacking in ability to relieve emotional tension any other way.[/say]")

		saynn("Fair enough. You take a quick look at her body and realize that she lacks any kind of.. private bits. Her breasts seem to be on the small side, quite firm-looking and also lacking nipples. Even her mouth is nothing but a speaker inside a non-moving mouth. Someone really cheaped out on the production of this android.")

		addButton("Hug me", "Ask Nur-A to hug you", "get_hugged")
		addButton("Sex?", "Maybe there is a way", "ask_sex")
		addButton("Never mind", "Ask something else", "")
	if(state == "get_hugged"):
		playAnimation(StageScene.Hug, "hug", {npc="nura"})
		saynn("[say=pc]Hug me, Nur-A.[/say]")

		saynn("The android spreads her arms and wraps them around you before pulling you closer. You feel how cold her frame is. Her chest is not soft at all, just like you thought. Although the gesture is nice.")

		saynn("After exactly 5 seconds, Nur-A pulls away from the hug.")

		saynn("[say=nura]Hug administered. I hope you feel better.[/say]")

		saynn("[say=pc]I do, slightly.[/say]")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_sex"):
		saynn("[say=pc]Maybe you can help me fulfill.. other kinds of needs?[/say]")

		saynn("Nur-A scans you with her android eyes.")

		saynn("[say=nura]I am sorry but I lack any kind of tools for that.[/say]")

		saynn("[say=pc]I understand that. But maybe we can still try?[/say]")

		saynn("[say=nura]Nur-A is happy to help.[/say]")

		addButton("Never mind", "Ask something else", "")
		addButtonWithChecks("Scissoring", "Rub pussies with her", "do_fake_scissoring", [], [ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Vaginal?", "Try to fuck her", "do_fake_vaginal", [], [ButtonChecks.HasReachablePenis])
	if(state == "do_fake_scissoring"):
		playAnimation(StageScene.SexTribadism, "tease", {npc="nura", pc="pc"})
		saynn("You find an empty workplace table and quickly clear it of all the trash that it had on it. Then you grab the android's hand and bring her to it before helping her climb it. You climb on it too and position Nur-A on her back.")

		saynn("[say=pc]Spread your legs slightly[/say]")

		saynn("Nur-A spreads her legs for you. Her crotch is perfectly flat, not even a hint of a pussy anywhere.")

		saynn("[say=nura]Task completed[/say]")

		saynn("But what can you do, you lie down opposite of her and intertwine your legs with hers, such that your crotches are pressed against each other's.")

		addButton("Rub", "Do the thing", "start_fake_pussyrubbing")
	if(state == "start_fake_pussyrubbing"):
		playAnimation(StageScene.SexTribadism, "sex", {npc="nura", pc="pc", pcCum=true})
		saynn("You begin rubbing pussies with her. Well, with her imaginary pussy. Nur-A supports her with her hands while looking at you before proceeding to help you, moving her hips in the opposite way.")

		saynn("It feels.. strange. The flat metal panel that she has there is quite cold and rigid. But still, there is some pleasurable friction in there. Your {pc.pussyStretch} slowly gets wet, you spread your juices all over her crotch, making it shine.")

		saynn("[say=nura]Does this feel good, patient?[/say]")

		saynn("[say=pc]Yes, continue[/say]")

		saynn("Nur-A listens to you and picks up the pace, rubbing her metal crotch against your slit. Very soon you begin to moan quietly. Quietly enough to not get spotted.")

		saynn("Seems like the android lacks any sensors down there and just goes off of the visual and audio feed. But that's enough to get you off anyway. You part your lips more and produce a louder moan as your whole body starts to squirm and shake. Nur-A detects that and stops her motions too, letting you ride your orgasm waves in peace.")

		saynn("[say=nura]Nur-A is glad to be of service.[/say]")

		saynn("[say=pc]Thank you..[/say]")

		saynn("You rest for a few minutes before climbing off the table and helping Nur-A to do the same.")

		addButton("Continue", "That was nice", "")
	if(state == "do_fake_vaginal"):
		playAnimation(StageScene.SexStanding, "tease", {npc="nura", pc="pc", bodyState={exposedCrotch=true,hard=true}})
		saynn("You approach Nur-A and then expose your {pc.penis} before presenting it to her.")

		saynn("[say=pc]I know you don't have a pussy or anything. Just stand still for me?[/say]")

		saynn("The android nods at you.")

		saynn("[say=nura]Nur-A will do that.[/say]")

		saynn("You put one of your hands on her shoulder. Cold still shoulder. Nur-A seems to be quite a good support for you. You walk around her, your other hand swiftly gets your member hard before guiding it between her metal thighs. Luckily there is nothing there to get your skin pinched on so you can freely press it against her featureless crotch.")

		saynn("[say=pc]Can you.. close your legs a little more? But not too much[/say]")

		saynn("Nur-A listens and does as you ask, trapping your cock between her cold thighs. It's kinda kinky..")

		addButton("Fuck her thighs", "Start moving your hips", "do_fake_humps")
	if(state == "do_fake_humps"):
		playAnimation(StageScene.SexStanding, "sex", {npc="nura", pc="pc", pcCum=true, bodyState={exposedCrotch=true,hard=true}})
		saynn("You begin moving your hips back and forth, letting your {pc.cock} rub against the android's thighs while you gradually pick up the pace. Even though there is nothing there on her crotch, the friction is enough to make your shaft start leaking precum.")

		saynn("Your hand slips down from her shoulder onto her breasts. They're very firm and not jiggly at all. But they're enough to hold onto while you thrust your dick between her legs.")

		saynn("Very soon you find yourself panting and breathing warmly into the back of her neck. The android seems happy to meet your motions with a set of her own, squeezing your member slightly before and moving her hips a bit too.")

		saynn("You hump her thighs for about a minute before you feel the orgasm drawing very close.")

		saynn("[say=pc]Gonna..[/say]")

		saynn("[say=nura]Feel free to release all your stored up tension, patient.[/say]")

		saynn("You let out a passionate grunt before cumming, your {pc.cock} starts throbbing and pulsating as it shoots out wave after wave of hot sticky {pc.cum} between the android's thighs, creating quite a mess on the floor. It feels good. Nur-A seems to have detected that and stopped her motions, not overstimulating you any further.")

		saynn("[say=pc]Wow. Thank you, Nur-A[/say]")

		saynn("[say=nura]Nur-A is glad to be of service.[/say]")

		saynn("You land your chin on her cold shoulder and rest like that for a bit more, slowly catching your breath back.")

		addButton("Continue", "That was nice", "")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "healcheck"):
		if(getFlag("CellblockModule.NuraGaveTool")):
			GM.pc.addPain(-GM.pc.getPain())
			setState("heal_success")
			return
		else:
			setState("heal_fail")
			return

	if(_action == "give_syringe"):
		setFlag("CellblockModule.NuraGaveTool", true)

	if(_action == "get_hugged"):
		GM.pc.addStamina(10)

	if(_action == "start_fake_pussyrubbing"):
		processTime(5*60)
		GM.pc.orgasmFrom("nura")

	if(_action == "do_fake_humps"):
		processTime(5*60)
		GM.pc.orgasmFrom("nura")

	setState(_action)

func getDevCommentary():
	return "Rahi, why did you write an android that has no pussy or squishy boobs?? There is a reason x3\n\nIdeally, the way I see Nur-A's completed content is as follows:\nYou meet her and do some chatting/lewds. (this part is complete)\nYou return to Alex and tell him about Nura. He starts explaining to you how she is an incomplete prototype that was scrapped because of reasons (who needs a nurse without holes or personality or something).\nYou want Nura to be finished. Alex says that you will need parts and/or credits for that.\nYou go around looking for these parts. Each one adds something (boobs, vagina, better ass, hair, different heads/tails/ears, various dicks, maybe a synthetic womb). Where would you find these parts? I have no idea x3\nYou also find personality chips. They make Nura act subby or extremely rough or as a kind domme mommy, you know.\nMaybe there is also a hidden sub-story that reveals itself more as you upgrade Nura. Something about her past. Maybe she is a stolen prototype from Syndicate? Maybe she is actually a girl that was killed and turned into a cyborg. Maybe she was one of the inmates x3. I dunno, you can take her any direction.\nAfter you upgrade her enough, she would join Eliza in the medical wing or something. She is a nurse after all..\n\nIf you're a writer and like Nura, feel free to grab this character and write for her, I'd be happy ^^"

func hasDevCommentary():
	return true
