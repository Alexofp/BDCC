extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false

func _init():
	sceneID = "TaviMasochismOutcomesScene"

func _initScene(_args = []):
	addCharacter("tavi")
	isCorrupt = getModule("TaviModule").isCorrupt()
	isPure = getModule("TaviModule").isPure()
	isNormal = (!isCorrupt && !isPure)
	isVirgin = getModule("TaviModule").isVirgin()
	
	setState(_args[0])

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You shouldn't see this.")

	if(state == "firstspanks"):
		playAnimation(StageScene.Spanking, "tease", {npc="tavi"})
		saynn("After some light spanks, you make Tavi reach the level of pain that she can comfortably endure. She stands on all fours, panting softly.")

		saynn("[say=pc]You did well, Tavi.[/say]")

		saynn("[say=tavi]Oh. That was it? That felt.. surprisingly good.[/say]")

		saynn("She looks at you over her shoulder and purrs. Her tail brushes against your palms that were spanking her.")

		saynn("[say=tavi]You can be a little harder next time..[/say]")

		saynn("Great.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "firmspanks"):
		playAnimation(StageScene.Spanking, "tease", {npc="tavi"})
		saynn("After that session, Tavi is left panting heavily.")

		saynn("[say=tavi]Ah.. uh..[/say]")

		saynn("Even though you stopped spanking her, Tavi's body is squirming a lot, her toes curling, her tail bending and spiraling.")

		saynn("[say=tavi]Ngh-h.. Agh..[/say]")

		saynn("It kinda feels like she is in pain. She lowers her head into her paws and produces a long humming noise.")

		saynn("[say=pc]You're alright?[/say]")

		saynn("[say=tavi]Yes-s.. It feels so.. weird..[/say]")

		saynn("Huh. Oh wow. You are just noticing the wet spot on Tavi's shorts where her pussy meets the fabric. As you peak behind it, you also notice that her buttcheeks are glowing with the color of her blood.. green.. like two juicy apples.")

		saynn("As you gently rub them, Tavi produces a cute moan. Seems, she is suffering from the afterglow.. or rather.. enjoying it.")

		saynn("Looks like you reached the exact point to make it pleasurable without hurting your kitty too much. Great. Maybe you can try something else next time.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "afterchoking"):
		playAnimation(StageScene.SexStart, "defeated", {npc="tavi", npcBodyState={naked=true}})
		saynn("Tavi remains on the floor, her gaze shaking a little, her lips parted with an occasional moan escaping from them.")

		saynn("[say=tavi]Ghh-h.. h..[/say]")

		saynn("She is panting heavily, trying to steady her breath. Her paw reaches for her neck and feels some bruises that you left while choking her.")

		saynn("[say=pc]Did I go too far?[/say]")

		saynn("[say=tavi]I.. loved it..[/say]")

		saynn("She opens her legs for you, offering a great view of her wet"+str(" virgin" if getModule("TaviModule").isVirgin() else "")+" pussy. She uses her claws to spread her folds, showing how.. heated up.. the interior is. And all of that without any direct stimulation.")

		saynn("[say=tavi]See..[/say]")

		saynn("It's just training but you can't deny that you got aroused from the sight too.")

		saynn("Luckily you didn't make Tavi lose her consciousness. If you did, you'd have to wake her up somehow..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "afterwax"):
		getCharacter("tavi").coverBodyWithFluid("HotWax", 0.2)
		playAnimation(StageScene.SexStart, "start", {npc="tavi", npcBodyState={naked=true}})
		saynn("After alternating between dripping wax off a candle and using ice cubes, Tavi is left a moaning mess. The stark contrast of the two elements causes her body to be squirming and writhing non-stop.")

		saynn("[say=tavi]I need.. I need more-e..[/say]")

		saynn("As you grab another ice cube and press it against her fur, Tavi arches her back, the sensations electrifying her senses.")

		saynn("Tavi's exposed pussy twitches with need. She is aching for release as the sensations ripple through her body.")

		saynn("[say=tavi]Please.. I need this..[/say]")

		addButton("More wax", "Test Tavi's limits", "more_wax")
		addButton("Enough", "You shouldn't push Tavi too far", "enough_wax")
	if(state == "more_wax"):
		playAnimation(StageScene.SexStart, "defeated", {npc="tavi", npcBodyState={naked=true}})
		saynn("Her desire is understandable. But you gotta be careful not to overwhelm her.")

		saynn("You move the candle down to her legs and tip it just above them. Tavi lets out a passionate moan as the hot wax begins to trail along her inner thigh, making her toes curl. At the same time, you grab an ice cube and press it against her clit, creating such an intense contrast of sensations.. that Tavi just can't endure it anymore.")

		saynn("[say=tavi]Oh.. AH!..[/say]")

		saynn("Her body convulses from a powerful.. impulse. Her moans become cries of pleasure as contrastic waves of ecstasy wash over her. Her back arches, causing the wax to drip on her other spots and the ice cube to brush against her pussy folds too, extending this state of bliss.")

		saynn("[say=tavi]Uah-h!.. myah..[/say]")

		saynn("Poor feline can't stop shivering, her eyes and ears shaking, her tail mopping the floor.")

		saynn("At the end of it, Tavi is barely alive, her heart beating like crazy.")

		saynn("[say=tavi]T-thank you..[/say]")

		saynn("Maybe you shouldn't push her so much.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "enough_wax"):
		playAnimation(StageScene.Cuddling, "idle", {npc="tavi", npcBodyState={naked=true}})
		saynn("Instead of pushing Tavi further, you decide to just pull her in for some cuddles.")

		saynn("Tavi gets a little sad but then cheers up from feeling your embrace.")

		saynn("[say=pc]You are becoming a good paintoy already. I don't need to push you too far.[/say]")

		saynn("The feline is quiet for a few seconds. But then she starts purring and resting in your hands.")

		saynn("You spend some time like that.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "finalcum"):
		playAnimation(StageScene.GivingBirth, "birth", {pc="tavi", bodyState={naked=true}}) # Sorry, lul x3
		saynn("The tipping point approaches Tavi fast. You were only bringing her pain.. and yet.. the feline is squirming on the floor like she got a vibrator pressed against her sex.")

		saynn("Your last impact sets her off. With an explosive release, Tavi's body tenses and her back arches as her twitching pussy suddenly squirts, producing a rush of her transparent juices. Such a lewd sight.")

		saynn("[say=tavi]AH-h!..[/say]")

		saynn("In this moment of climax, her body keeps trembling, her hips bucking involuntarily. It's obvious to you that the sensations that you caused have overwhelmed her senses, made her eyes roll up and her tongue roll out.")

		saynn("[say=tavi]I love t-this!..[/say]")

		saynn("It seems.. you successfully made Tavi into a masochist. Her breathing is heavy, her body is bruised.. her mind is clouded.")

		addButton("Cuddle", "Pull Tavi in for some cuddles", "final_cuddle")
	if(state == "final_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {npc="tavi", npcBodyState={naked=true}})
		saynn("Your arms wrap around Tavi, pulling her close for a gentle embrace. Even after that orgasm has ended, the afterglow of your actions is making her moan softly.")

		saynn("[say=tavi]I never saw pain.. like this..[/say]")

		saynn("You rest your chin on her shoulder and leave a little kiss on it. A huge contrast to your previous actions.")

		saynn("[say=tavi]"+str(taviSpeak("Never thought pain could bring such pleasure..", "I want more.. I wanna get fucked while you choke me.. Never thought pain could bring such pleasure..", "Never thought pain could bring such pleasure.. It's different.. But I like it."))+"[/say]")

		saynn("[say=pc]It was a nice journey, wasn't it? And you trusted me all the way.[/say]")

		saynn("She nods and rests in your hands.")

		saynn("[say=tavi]Best decision of my life.[/say]")

		saynn("You spend some more time cuddling.")

		addButton("Continue", "See what happens next", "endthescene")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "more_wax"):
		processTime(3*60)
		getCharacter("tavi").coverBodyWithFluid("HotWax", 10.0)

	if(_action == "enough_wax"):
		processTime(10*60)

	if(_action == "final_cuddle"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
