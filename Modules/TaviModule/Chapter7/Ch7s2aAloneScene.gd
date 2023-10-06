extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var npc1id = ""
var npc2id = ""

func _init():
	sceneID = "Ch7s2aAloneScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc1"):
		return npc1id
	if(_charID == "npc2"):
		return npc2id

func _run():
	if(state == ""):
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		playAnimation(StageScene.Solo, "stand")
		saynn("And here you are. Standing before the checkpoint. No need to get Tavi involved, they might just capture and torture her again. Yes.")

		saynn("You don't have any laser rifles or shiny armor to protect yourself. Just your fists and a strong desire to get out of this place. Or maybe you just wanna make the captain pay for what he did? Does it matter in the end? No.")

		saynn("Will they be ready? Maybe. But it won't stop you. Time to do this.")

		saynn("Checkpoint.. Elevator.. Command deck.. Captain's office. Should be easy.")

		addButton("Checkpoint", "Walk through the main entrance", "checkpoint_firstguard")
	if(state == "checkpoint_firstguard"):
		aimCameraAndSetLocName("hall_checkpoint")
		playAnimation(StageScene.Duo, "stand", {npc=npc1id})
		saynn("You step through the sensor array that they got going on and look at the guards. Silently.")

		saynn("[say=npc1]Move it, inmate. Don't waste my time.[/say]")

		saynn("You shake your head while taking a combat stance. Lashing out at them might give you an edge in the fight.. but the second guard would just drop you with their shock remote.")

		saynn("[say=npc1]No? You'd rather kiss my dirty boot? Alright.[/say]")

		saynn("{npc1.He} gestures to the other guard to just watch while fetching {npc1.his} stun baton out of its holder.")

		saynn("Time to fight.")

		addButton("Fight", "Start the fight", "fight1_npc")
	if(state == "lost_first_guards"):
		playAnimation(StageScene.Solo, "defeat")
		GM.pc.setLocation("hall_mainentrance")
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("Defeated, you fall to your knees.")

		saynn("The guards laugh at your pathetic attempt. But then they just throw you out into the main hall.")

		saynn("Seems you will need to try a little harder than that. Or let Tavi help you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "won_first_guard"):
		playAnimation(StageScene.Duo, "stand", {npc=npc2id})
		saynn("When the first guard hits the floor, the second one instantly grabs {npc2.his} shock remote and aims it at you!")

		saynn("[say=npc2]Fun is over, inmate. Time to sleep.[/say]")

		saynn("{npc2.He} presses the button.. but nothing happens.")

		saynn("[say=npc2]Fucking really? Doesn't matter.[/say]")

		saynn("The guard grabs {npc2.his} weapon and prepares for a fight.")

		addButton("Fight", "Start the fight", "fight2_npc")
	if(state == "won_second_guard"):
		playAnimation(StageScene.Duo, "stand", {npc=npc2id, npcAction="defeat"})
		saynn("Both of the guards are defeated. That's a start.")

		saynn("You fetch one of the badges from them. It will probably get disabled in a few minutes. But that's all you need to get access to the top floor of the prison.")

		saynn("[say=risha]Going somewhere~?[/say]")

		saynn("A voice stops you.")

		addButton("Turn around", "See who is there", "risha_intro")
	if(state == "risha_intro"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("It's Risha. She looks around, looking a little surprised.")

		saynn("[say=pc]Yeah, going up.[/say]")

		saynn("[say=risha]Alone? Without Tavi?[/say]")

		saynn("She slowly approaches you. Behind you is the closed elevator. Which means.. She is cornering you.")

		saynn("[say=pc]Why are you asking? Afraid she will ambush you? Look behind you then.[/say]")

		saynn("Risha doesn't. She just giggles while slowly closing the distance, a stun baton in her hand.")

		saynn("[say=risha]I was just curious. Cap's orders are to stop you. And I have to obey, I'm afraid. No hard feelings.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "fight3_risha")
	if(state == "lost_risha"):
		playAnimation(StageScene.Duo, "defeat", {npc="risha"})
		GM.pc.setLocation("hall_mainentrance")
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("You drop to your knees before Risha. It hurts.")

		saynn("The feline leans closer to you.")

		saynn("[say=risha]Good try. But you're clearly not ready.[/say]")

		saynn("She throws you out and walks off. At least she didn't fuck you. Why did she not fuck you?")

		saynn("Seems you will need to try a little harder than that. Or let Tavi help you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "won_risha"):
		playAnimation(StageScene.Duo, "stand", {npc="risha", npcAction="defeat"})
		saynn("Risha hisses as she hits the floor, her bulky armor is now weighing her down rather than protecting her.")

		saynn("Your old badge doesn't seem to work anymore so you steal Risha's one.")

		saynn("[say=pc]No hard feelings.[/say]")

		saynn("[say=risha]None taken.[/say]")

		saynn("She is panting heavily. There is no time to play with her.. so you just leave her alone.")

		saynn("As you head towards the elevator, Risha is no longer there anymore.")

		addButton("Elevator", "Step into it", "alex_meet")
	if(state == "alex_meet"):
		removeCharacter("risha")
		addCharacter("alexrynard")
		aimCameraAndSetLocName("hall_elevator")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("As the elevator doors open, you see.. Alex. His attention was directed to some random prototype in his hands. But he puts it away.")

		saynn("[say=alexrynard]Gonna stand there? Step in.[/say]")

		saynn("He doesn't seem to be.. hostile. So you step inside the elevator and press the badge against the control panel before selecting the command deck.")

		saynn("[say=alexrynard]Brave.[/say]")

		saynn("The doors close with an annoying screech. The elevator begins to move.")

		saynn("[say=alexrynard]I should really lube these gears up, huh?[/say]")

		saynn("[say=pc]You're not gonna stop me?[/say]")

		saynn("The foxy shrugs.")

		saynn("[say=alexrynard]It's not my job. And you seem to have made up your mind. Other guards will try to stop you though.[/say]")

		saynn("[say=pc]I know.[/say]")

		saynn("You two stand side by side. In silence. Only the quiet noise of the elevator moving can be heard.")

		saynn("[say=alexrynard]This prison could use some changes.[/say]")

		saynn("[say=pc]Changes?[/say]")

		saynn("[say=alexrynard]Improvements. Replacements. I don't know. Just don't destroy it, okay? Good people built it. Would be a shame to see all that progress go to waste.[/say]")

		saynn("[say=pc]I will try.[/say]")

		saynn("He nods.")

		saynn("Soon, the elevator doors open. The guy prefers to stay while you step out. You feel like you're getting somewhere.")

		addButton("Command deck", "See what happens next", "nova_meet")
	if(state == "nova_meet"):
		removeCharacter("alexrynard")
		addCharacter("nova")
		playAnimation(StageScene.Duo, "stand", {npc="nova"})
		aimCameraAndSetLocName("cd_near_split")
		saynn("You step out into the rich man's corridor. Makes sense for the captain to keep himself away from inmates physically as well as mentally.")

		saynn("Carpets, paintings, wooden furniture. A stark contrast to the cold, dimly lit cells that you almost grew to call home. Still, it lacks any.. passion. Nothing stands out to you.")

		saynn("As you step through the corridor, you walk into Nova. She blocks your path.")

		saynn("[say=nova]Well. Here we are.[/say]")

		saynn("[say=pc]I only need the captain.[/say]")

		saynn("[say=nova]I kinda liked everything that we did together. I wish some things were different. But oh well.[/say]")

		saynn("Her paw squeezes her stun baton tight. Her armor lights up.")

		saynn("[say=nova]Captain's order is to stop you. Sorry cutie. I have to do this.[/say]")

		saynn("Seems like it's a fight.")

		addButton("Fight", "Start the fight", "fight4_nova")
	if(state == "lost_nova"):
		playAnimation(StageScene.Solo, "defeat")
		GM.pc.setLocation("hall_mainentrance")
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("You drop to your knees, defeated by Nova. She puts her baton away and clips a leash to your collar.")

		saynn("[say=nova]Not today, cutie.[/say]")

		saynn("After that, she just brings you back out in the main hall. Makes you wonder why they don't punish you at all. Almost like they are tired of this, just like you and Tavi.")

		saynn("Seems you will need to try a little harder than that. Or let Tavi help you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "won_nova"):
		playAnimation(StageScene.Duo, "stand", {npc="nova", npcAction="defeat"})
		saynn("Nova grunts and drops to her knees, unable to continue fighting.")

		saynn("[say=nova]Ow..[/say]")

		saynn("No time to chat. You feel like you're very close. As you walk past her, you only hear this.")

		saynn("[say=nova]Good luck..[/say]")

		saynn("Huh? You're not sure if that was sarcasm. Sounded pretty genuine.")

		saynn("[say=pc]Thanks.[/say]")

		addButton("Continue", "See what happens next", "walk_to_skar")
	if(state == "walk_to_skar"):
		removeCharacter("nova")
		playAnimation(StageScene.Solo, "walk")
		aimCameraAndSetLocName("cd_last_intersection")
		saynn("You walk through the soulless corridors, quickly getting closer to the source. There is no fear for some reason. Probably because you got this whole thing figured out. There are no unknowns anymore. No mysteries left to solve. All you have to do is execute.")

		saynn("While approaching the captain's office, a familiar figure blocks your path..")

		addButton("Continue", "See what happens next", "skar_block")
	if(state == "skar_block"):
		addCharacter("skar")
		playAnimation(StageScene.Duo, "stand", {npc="skar"})
		saynn("Skar, the last guard before you can finally meet with the captain, is leaning against the wall, crossing his prosthetic arms.")

		saynn("[say=pc]May I?[/say]")

		saynn("He shakes his head slowly.")

		saynn("[say=pc]I get it.[/say]")

		saynn("[say=skar]Do you?[/say]")

		saynn("[say=pc]A little bit. I understand what. I don't quite understand why. Why are you still fighting for him?[/say]")

		saynn("He lowers his gaze.")

		saynn("[say=skar]Stability, I guess.[/say]")

		saynn("[say=pc]Stability?[/say]")

		saynn("He flexes his arms and you can hear servos working in them. His prosthetic jaw has a similar quiet whirl as he talks.")

		saynn("[say=skar]I've had enough.. adventures.. Wars.[/say]")

		saynn("He sighs and looks at you.")

		saynn("[say=skar]I just wanna live my boring life. I don't want anything to change, it's too late for that.[/say]")

		saynn("Huh. Is that the true Skar? He sounds like he is.. spent.")

		saynn("[say=pc]Then why did you give us a chance back then?[/say]")

		saynn("He shrugs.")

		saynn("[say=skar]I don't know. The captain ordered to stop the riot, not you. I don't care about you.[/say]")

		saynn("Such a soldier, following orders without taking responsibility. Maybe there is a spark of hope in him though.")

		saynn("[say=pc]Maybe it's time to choose for yourself then? You did it once, why not do it again? Just let me walk through.[/say]")

		saynn("He shakes his head and blocks the path. That spark fades away. Seeing that you will not get anywhere, you both prepare to fight.")

		addButton("Fight", "Start the fight", "fight5_skar")
	if(state == "skar_lost"):
		playAnimation(StageScene.Solo, "defeat")
		GM.pc.setLocation("hall_mainentrance")
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("As you get defeated, Skar grabs you by the collar and drags you away.")

		saynn("You were so close. But sadly, you failed this time.")

		saynn("[say=skar]It's not worth it. You can't change anything.[/say]")

		saynn("You don't even wanna describe how wrong he is.")

		saynn("Seems you will need to try a little harder than that. Or let Tavi help you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "skar_won"):
		playAnimation(StageScene.Duo, "stand", {npc="skar", npcAction="defeat"})
		saynn("Skar grunts as he hits the floor hard.")

		saynn("[say=skar]Ugh.. It's not worth it. You can't change anything.[/say]")

		saynn("[say=pc]If there were less like you, maybe it would have been easier. But I don't plan on giving up no matter what.[/say]")

		saynn("The reinforced door is the last barrier before the captain's office. You steal Skar's badge and try to use it.. but the door refuses to open.")

		saynn("[say=pc]Seems like he doesn't even trust his own guards anymore.[/say]")

		saynn("Well.. You're kinda stuck here. When suddenly..")

		saynn("[say=tavi]Missed me~?[/say]")

		addButton("Continue", "See what happens next", "tavi_joins")
	if(state == "tavi_joins"):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=isCorrupt}})
		saynn("That's Tavi's voice. She walks up to the door and starts inspecting the access panel.")

		saynn("[say=pc]How did you end up here?[/say]")

		saynn("Tavi smiles. She uses her claw to pry open the outer cover, revealing some protected wiring.")

		saynn("[say=tavi]Risha told me."+str(" She said she loves how sexy I look now~." if isCorrupt else " Sisters gotta help each other, right~?")+"[/say]")

		saynn("She can't quite figure what each wire means.. So she steals Skar's stun baton and shoves it into the panel, causing all sorts of sparks to start bursting from it.")

		saynn("[say=tavi]How could I not be here with you. I wanna help you, owner.[/say]")

		saynn("The door blinks non-stop. Its security bolts toggle on and off.. And then the door opens when the right wire gets an impulse sent through it.")

		saynn("[say=tavi]That's why I like hacking software more. Software and people~. This isn't even a challenge.[/say]")

		saynn("And now.. All you can do is walk in. You and Tavi look at each other.")

		saynn("[say=pc]Ready?[/say]")

		if (isCorrupt):
			saynn("[say=tavi]Been waiting my whole life for this~. And I won't pull any punches.[/say]")

		else:
			saynn("[say=tavi]Been waiting my whole life for this.[/say]")

		addButton("Walk in", "See what's up with the captain", "start_captain_scene")
func taviSpeak(corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return corruptSpeak


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "checkpoint_firstguard"):
		processTime(2*60)
		npc1id = GuardGenerator.new().generate({NpcGen.Level: 30, NpcGen.Temporary: true}).getID()
		npc2id = GuardGenerator.new().generate({NpcGen.Level: 30, NpcGen.Temporary: true}).getID()
		addCharacter(npc1id)
		addCharacter(npc2id)

	if(_action == "fight1_npc"):
		runScene("FightScene", [npc1id], "fight1_npc")
		return

	if(_action == "fight2_npc"):
		runScene("FightScene", [npc2id], "fight2_npc")
		return

	if(_action == "risha_intro"):
		removeCharacter(npc1id)
		removeCharacter(npc2id)

	if(_action == "fight3_risha"):
		runScene("FightScene", ["risha"], "fight3_risha")
		return

	if(_action == "nova_meet"):
		processTime(3*60)

	if(_action == "fight4_nova"):
		runScene("FightScene", ["novaArena"], "fight4_nova")
		return

	if(_action == "walk_to_skar"):
		processTime(3*60)

	if(_action == "fight5_skar"):
		runScene("FightScene", ["skar"], "fight5_skar")
		return

	if(_action == "tavi_joins"):
		addExperienceToPlayer(300)

	if(_action == "start_captain_scene"):
		setFlag("TaviModule.Ch7CaptainSceneHappened", true)
		runScene("Ch7s3CaptainScene")
		endScene()
		return

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "fight1_npc"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_first_guard")
		else:
			setState("lost_first_guards")
			addExperienceToPlayer(5)

	if(_tag == "fight2_npc"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_second_guard")
		else:
			setState("lost_first_guards")
			addExperienceToPlayer(5)

	if(_tag == "fight3_risha"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_risha")
		else:
			setState("lost_risha")
			addExperienceToPlayer(5)

	if(_tag == "fight4_nova"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_nova")
		else:
			setState("lost_nova")
			addExperienceToPlayer(5)

	if(_tag == "fight5_skar"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("skar_won")
		else:
			setState("skar_lost")
			addExperienceToPlayer(5)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["npc1id"] = npc1id
	data["npc2id"] = npc2id

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	npc1id = SAVE.loadVar(data, "npc1id", "")
	npc2id = SAVE.loadVar(data, "npc2id", "")
