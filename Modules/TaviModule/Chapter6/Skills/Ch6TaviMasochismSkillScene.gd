extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var painSkill = 0

func _init():
	sceneID = "Ch6TaviMasochismSkillScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You tell Tavi that you want to train her to endure pain better because.. she needs that to be able to fight longer.")

		saynn("Tavi nods and listens to you.")

		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		painSkill = getModule("TaviModule").getSkillScore("taviSkillMasochism")
		addButton("Intro lesson", "Introduce Tavi to masochism", "intro_lesson")
		if (painSkill > 0):
			addButton("Minigame", "Try to bring Tavi to an exact pain value", "start_minigame")
		else:
			addDisabledButton("Minigame", "Tavi needs to be introduced to masochism first")
		addButton("Cancel", "You changed your mind", "cancel_lesson")
	if(state == "intro_lesson"):
		saynn("You decide that it's time to start teaching Tavi how to be a masochist. You stand in the middle of her dimly lit cell and call her closer.")

		saynn("[say=pc]How are you with pain, Tavi?[/say]")

		saynn("Tavi's ears twitch a little as she takes the spot.")

		saynn("[say=tavi]"+str(taviSpeak("Pain? I prefer pleasure..", "If you choke me, I stop caring about the pain~.", "I use pain to my advantage. But I try to avoid it myself, obviously."))+"[/say]")

		saynn("Huh. Interesting answer. But it doesn't really answer your question. Better to just put Tavi to the test.")

		saynn("[say=pc]Stand still, Tavi.[/say]")

		saynn("You begin slowly stepping around her, your digits trailing along Tavi's shoulder, calming her down. But at the same time, you are looking for a good time to spank her.")

		addButton("Spank Tavi", "Smack her butt lightly", "intro_spank")
	if(state == "intro_spank"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="hurt"})
		saynn("You take your time, just circling the feline. And even though your touch is calming her down somewhat, the tension is only rising..")

		saynn("Finally, you deliver the first strike, a slap against Tavi's round butt. It was such a soft one that she barely flinched.")

		saynn("[say=tavi]Oh.. That was nothing![/say]")

		saynn("But that was a fake one. The real spank comes a second later as you smack that butt so hard that it jiggles. The impact reverberates through the air, a sudden stinging pain makes Tavi's breath hitch, her eyes widening momentarily.")

		saynn("[say=tavi]Ow!.. Ow.. ow..[/say]")

		saynn("She instantly breaks her stance and starts rubbing her bruised butt that now has a very subtle green glow to it.. which looks kinda cute.")

		saynn("[say=pc]Pull your hands away, Tavi.[/say]")

		saynn("She huffs and shakes her head.")

		saynn("[say=pc]That was just the start.[/say]")

		saynn("Tavi huffs more and rubs her butt until it doesn't hurt as much.")

		saynn("[say=tavi]I think it was enough though.. for now..[/say]")

		addButton("Stop for now", "Enough spanks", "intro_stop")
		addButton("Light spanks", "Do some light spanks", "intro_light")
		addButton("Spank firmly", "Do another firm spank", "intro_firm")
	if(state == "intro_stop"):
		saynn("You agree and decide to stop for now.")

		saynn("For some reason you feel like Tavi didn't learn much from this.. Sometimes you gotta push yourself out of the comfort zone a little bit..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "intro_firm"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="defeat"})
		saynn("Well, if she doesn't wanna expose her rear to you.. that's her problem.")

		saynn("You raise your hand and bring it down hard on her butt, spanking it while also slapping the paws that protect it.")

		saynn("Tavi cries out painfully and suddenly collapses, her legs shaky.")

		saynn("[say=tavi]Argh!.. Agh.. gh-h..[/say]")

		saynn("That was.. clearly too much. Huh. Tavi is hissing at you. Not the kind of response you would expect from a masochist.")

		saynn("It's almost like you gotta find the right balance.. the perfect spot that enhances the sensations.. instead of numbing them..")

		saynn("You sigh and help Tavi.")

		saynn("[say=pc]My bad.[/say]")

		saynn("[say=tavi]It's okay.. I understand what you're trying to do.. It was just.. too much..[/say]")

		saynn("Fair enough. Better try again later.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "intro_light"):
		playAnimation(StageScene.Spanking, "spank", {npc="tavi"})
		saynn("You think about it a little more. Obviously, to learn to enjoy pain.. that pain is gotta be enjoyable. This is not a competition..")

		saynn("[say=pc]Alright. My bad, Tavi. I promise I will be soft with you. But I need you to trust me.[/say]")

		saynn("The feline tilts her head a bit, her expression changes to a more calm one.")

		saynn("[say=tavi]Um.. I.. I trust you.[/say]")

		saynn("She pulls her paws away from her rear and lets you position herself on all fours.")

		saynn("[say=pc]Thank you.[/say]")

		saynn("The feline visible tenses as you raise your hand. But then, when your palm softly connects with her rear with a cute thump, Tavi exhales.")

		saynn("You don't stop there, doing a few more of those soft spanks on Tavi's clothed rear.")

		saynn("[say=tavi]You can be.. a little harder.. if you want..[/say]")

		saynn("And so, you use her feedback to adjust your impacts, spanking your pet with enough force to make her curl her toes while still being comfortable.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("Tavi purrs. Seems like it's a good place to end the first lesson here.")

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

	if(_action == "intro_lesson"):
		processTime(2*60)

	if(_action == "start_minigame"):
		runScene("TaviMasochismScene")
		endScene()
		return

	if(_action == "cancel_lesson"):
		increaseFlag("TaviModule.Ch6Tiredness", -1)
		endScene()
		return

	if(_action == "intro_spank"):
		processTime(2*60)

	if(_action == "intro_light"):
		getModule("TaviModule").advanceSkill("taviSkillMasochism")

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["painSkill"] = painSkill

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	painSkill = SAVE.loadVar(data, "painSkill", 0)
