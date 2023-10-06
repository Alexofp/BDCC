extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var hasSkills = false

func _init():
	sceneID = "Ch7s1PlanningScene"

func _run():
	if(state == ""):
		addCharacter("tavi")
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		hasSkills = getModule("TaviModule").hasAllSkillsLearnedFully()
		playAnimation(StageScene.Duo, "stand", {npc="tavi"})
		saynn("You think about it.. There isn't really much of a choice there, is it? Either you're stuck in this prison forever until your last day. Or you at least.. try. You and Tavi did try already. And failed many times.")

		saynn("But.. giving up now means all of this was for nothing. Giving up now means accepting that you will never make your dreams come true. Giving up now means accepting their broken dreams as your own.")

		saynn("[say=tavi]"+str(taviSpeak("Whatcha thinking about, owner?", "Something is wrong, owner?"))+"[/say]")

		saynn("Tavi walks up to you, clearly reading that something heavy is on your mind.")

		saynn("[say=pc]Time to get out of here, Tavi.[/say]")

		saynn("Tavi raises a brow and tilts her head slightly to the side"+str(", being careful not to hit you with her horns" if getModule("TaviModule").hasHorns() else "")+".")

		saynn("[say=tavi]"+str(taviSpeak("I'm always up for a good fight~. But, tell me, did something change? What made you want to do it?", "I agree, trust me. But I'm curious. What made you want to do it? Right now I mean."))+"[/say]")

		if (isCorrupt):
			saynn("Tavi certainly changed, her curves sexy but powerful, her posture assertive and dominant. They thought they could break her. But in the end, she only became stronger. Would be a shame not to take advantage of this.")

			saynn("[say=pc]I think that you are ready, Tavi. And so I am.[/say]")

		else:
			saynn("They tried to change Tavi. Tried to make her give up and become an ordinary slut. But they don't even realize that they failed. The element of surprise is on your side. Would be a shame not to take advantage of it.")

			saynn("[say=pc]I think that you are ready, Tavi. And so I am.[/say]")

		saynn("Tavi smiles and crosses her arms"+str(" under her breasts, emphasizing them" if isCorrupt else " while keeping a straight posture")+".")

		saynn("[say=tavi]Oh yeah~? You might be right. What would be our next move?[/say]")

		saynn("That simple question.. Makes you feel in charge. Almost like your roles have switched.. They did, yes. But.. What should you do with all that power? You might still need help from her.. at least for now.")

		addButton("Brute force", "Tell Tavi that you can just force yourself to the captain", "brute_force")
		addButton("Something smart?", "Tell Tavi that you should try to do something smart", "smart")
		addButton("Don't know", "Tell Tavi that you don't know", "dontknow")
	if(state == "brute_force"):
		saynn("The goal is getting to the captain. It always was.")

		saynn("[say=pc]We fight our way in. Like we did the first time.[/say]")

		saynn("Tavi hums, thinking too now.")

		saynn("[say=pc]Yeah, we lost that time. But I am stronger now. The captain only understands the language of violence.[/say]")

		saynn("Tavi scratches her chin.")

		saynn("[say=tavi]What if they shock us?[/say]")

		saynn("[say=pc]We don't let them. We strike first. We strike hard. No mercy. No second thoughts.[/say]")

		if (isCorrupt):
			saynn("The feline giggles softly before a cute smile appears on her face. Her sharp fangs and her long claws are all on display.")

			saynn("[say=tavi]I like the way you think~. We might have to go see what we're dealing with.[/say]")

		else:
			saynn("The feline looks.. skeptical.")

			saynn("[say=tavi]Fights are not really for me anymore. But.. Maybe you are right. Maybe I was wrong. We should go take a look at what we're dealing with.[/say]")

		saynn("You nod and stand at the cell's exit.")

		saynn("[say=pc]Let's go scout out the checkpoint then. Shouldn't be too hard to beat a few guards up.[/say]")

		addButton("Continue", "See what happens next", "checkpoint")
	if(state == "smart"):
		saynn("The goal is getting to the captain. It always was. The problem is.. how..")

		saynn("[say=pc]We do something smart. We must end up with the captain one-on-one again. That is the only way.[/say]")

		saynn("Tavi hums, thinking too now.")

		saynn("[say=pc]Most of the guards hate us. But the ones that don't.. they might help us. And that's all we need.[/say]")

		if (isCorrupt):
			saynn("The feline looks at herself and then smiles softly.")

			saynn("[say=tavi]I don't know if anyone likes us. But if they don't, we can make them~.[/say]")

		else:
			saynn("The feline smiles softly.")

			saynn("[say=tavi]You might be right actually. Who would have thought that making friends is a good idea~.[/say]")

		saynn("The only problem is.. it's still not a plan. You need more information for a plan. You stand in the cell's exit and look at Tavi.")

		saynn("[say=pc]Let's go on a recon mission.[/say]")

		saynn("[say=tavi]Exciting~.[/say]")

		addButton("Continue", "See what happens next", "checkpoint")
	if(state == "dontknow"):
		saynn("The goal is getting to the captain. It always was. The problem is.. how..")

		saynn("[say=pc]I don't really know. We tried everything, didn't we?[/say]")

		if (isCorrupt):
			saynn("Tavi hums for a second. But then starts to smile.")

			saynn("[say=tavi]Yeah, we did. They think we're defeated too. That means they wouldn't expect us to just walk through the front door again~.[/say]")

			saynn("That is.. interesting.")

			saynn("[say=pc]You think we can fight the entire prison?[/say]")

			saynn("She giggles softly while gently scratching you behind the ear with her sharp claws.")

			saynn("[say=tavi]We only have to defeat the strongest ones. Everyone else will run away~.[/say]")

			saynn("Tavi might be right. But.. You clearly need more info.")

		else:
			saynn("Tavi hums for a second. But then starts to smile.")

			saynn("[say=tavi]Only the captain is gonna be a real obstacle. Everyone else might just let us walk past.[/say]")

			saynn("That's.. awfully optimistic.")

			saynn("[say=pc]What makes you think that?[/say]")

			saynn("She shrugs.")

			saynn("[say=tavi]The captain is not a good person. Let's hope they understood that by now~.[/say]")

			saynn("Hope is good.. But you still need more info.")

		saynn("[say=pc]Let's go take a look at the guards then.[/say]")

		saynn("Tavi follows you as you head towards the exit.")

		addButton("Continue", "See what happens next", "checkpoint")
	if(state == "checkpoint"):
		aimCameraAndSetLocName("hall_mainentrance")
		GM.pc.setLocation("hall_mainentrance")
		saynn("You and Tavi exit her cell and head towards the main hall. You walk up the stairs and take a closer look at the checkpoint.")

		saynn("It clearly got.. overhauled a little. The most drastic difference is that there are two guards protecting it now. But there is also some kind of.. array of laser sensors, protecting the only passage. They don't seem to hurt the inmates that walk through.")

		saynn("[say=pc]Huh. What do you think that thing is for?[/say]")

		saynn("[say=tavi]Probably scans your collar.[/say]")

		saynn("That would mean that wearing guard armor would no longer work. They are learning, huh.")

		saynn("[say=pc]That complicates things.[/say]")

		saynn("[say=tavi]Does it? You can probably beat two guards.[/say]")

		saynn("[say=pc]Sure. But what's next?[/say]")

		saynn("Both, you and Tavi, stay quiet. The feline inspects the checkpoint more.")

		saynn("[say=tavi]They will probably be ready. The captain likes his big chair.[/say]")

		saynn("No way around this wall, huh? If there are no good options.. just pick the most fun one. Right.")

		saynn("[say=pc]I guess I will have to fight my way through.[/say]")

		saynn("[say=tavi]What about me?[/say]")

		saynn("[say=pc]Can you fight?[/say]")

		if (isCorrupt):
			saynn("Tavi looks at her sexy body.")

			saynn("[say=tavi]I think there is something I can do~. You just gotta.. train me enough.[/say]")

			saynn("[say=pc]That will take time.[/say]")

			saynn("She nods.")

			saynn("[say=tavi]Otherwise I can't help you. I have the body.. but not the skills.[/say]")

		else:
			saynn("Tavi looks at herself.. at her paws.")

			saynn("[say=tavi]I'd rather not fight. But I think I can still be useful to you~.[/say]")

			saynn("You look at the feline, feeling intrigued.")

			saynn("[say=tavi]You just gotta.. train me enough.[/say]")

			saynn("[say=pc]That will take time.[/say]")

			saynn("She nods.")

			saynn("[say=tavi]I can talk. But I will need more than that to help you.[/say]")

		saynn("In the end. It looks like the choice is up to you.. You can just finish this right now by beating these two guards up and whoever comes next. Or.. you can try to be smarter and let Tavi help you.")

		saynn("[say=tavi]You know where to find me, owner.[/say]")

		saynn("She leans in and smooches you on the cheek before walking away, leaving you alone with your thoughts.")

		addButton("Continue", "See what happens next", "endthescene")
func taviFullSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak

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

	if(_action == "brute_force"):
		processTime(3*60)

	if(_action == "smart"):
		processTime(3*60)

	if(_action == "dontknow"):
		processTime(3*60)

	if(_action == "checkpoint"):
		processTime(6*60)
		addExperienceToPlayer(100)
		addMessage("Task updated")

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["hasSkills"] = hasSkills

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	hasSkills = SAVE.loadVar(data, "hasSkills", false)
