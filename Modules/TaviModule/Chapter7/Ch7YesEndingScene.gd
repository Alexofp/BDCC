extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false

func _init():
	sceneID = "Ch7YesEndingScene"

func _run():
	if(state == ""):
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		if (isCorrupt):
			addCharacter("tavi", ["naked"])
		else:
			addCharacter("tavi")
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("Well.. His words do make sense. Finding good people is easy at a glance.. But to find the best out of the best.. requires trials. You are the best.. and you proved it.")

		saynn("What would saying no bring you? Probably nothing good. It's a huge risk. At best.. you will just stay an inmate here. At worst.. you will probably die.")

		saynn("The solution is right there. It's what you wanted. You will be free. You won't have to wear a collar. Tavi would get what she wants too..")

		saynn("[say=pc]Alright. We showed what we can do. Now get those collars off us. Act rather than talk.[/say]")

		saynn("Tavi looks at you and the captain. And then nods.")

		saynn("[say=captain]Wise choice. One person can't change the world. But three people.. is a team. And teams become exponentially stronger than the sum of its people. Come closer.[/say]")

		saynn("The captain reaches for his neck.. and fetches a thumbdrive-like token from it. As you observe it, you notice that it has a blue round symbol.. same one that your collars have.")

		saynn("[say=tavi]You will have to earn the trust of your team though. After what you did to me.[/say]")

		saynn("[say=captain]Of course. I will be loyal if you are.[/say]")

		addButton("Collars", "Let the captain take the collars off", "collars_off")
	if(state == "collars_off"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=isCorrupt}})
		saynn("Sensing no danger, you slowly approach the captain. He seems pretty chill. Even if his other hand is resting not that far from the weapon holster.")

		saynn("After you close the distance, the captain brings the little token to your collar.. until something mechanical inside it unlocks.. allowing you to just take it off.")

		saynn("Wow.. you almost moan from how good this feels. You start rubbing the skin of your neck and shiver from the sensations. That part of your neck didn't feel the air's touch for so long..")

		saynn("Then it's Tavi's turn. She tilts her head slightly and lets the captain press the token against her collar, unlocking it too.")

		saynn("But when Tavi opens it, she also catches a glass vial falling out of it. A vial with a red-colored drug. Seeing it causes the captain to put his free hand on his gun.")

		saynn("[say=captain]What's that?[/say]")

		saynn("[say=tavi]Does it matter?[/say]")

		saynn("He frowns and looks Tavi in the eyes. While she is shivering and rubs her fluffy neck, actually moaning from the sensations.")

		saynn("[say=tavi]Ah~..[/say]")

		saynn("[say=captain]I don't think starting this.. little initiative.. with a lie.. is a good idea. What do you think?[/say]")

		saynn("Tavi presents the vial to the captain. And even gives it to him.")

		saynn("[say=tavi]It was just.. plan B. In case you would try to kill us.. you know? A safety net.[/say]")

		saynn("[say=captain]Huh. You're pretty resourceful.[/say]")

		saynn("Tavi shrugs.")

		saynn("[say=tavi]I do the best with what I have. So we're not inmates anymore, right?[/say]")

		saynn("Captain rubs his chin.. and then offers his hand.")

		saynn("[say=captain]I can't officially release you. Since.. you know. But I think no one will bat an eye if two inmates suddenly go missing in the mines. Deal?[/say]")

		saynn("Tavi chuckles and shakes just his two top digits.")

		saynn("[say=tavi]Sure, cap. Couldn't care less about the logistics of how you're gonna get us out.[/say]")

		saynn("Now it's your turn.")

		addButton("Shake hands", "Shake hands with the captain", "shake_hands")
	if(state == "shake_hands"):
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("And so you and the captain shake hands.")

		saynn("[say=captain]Don't have to call me captain anymore. Name is Corwin.[/say]")

		saynn("[say=tavi]Corwin Wright, huh. Can I get that sphere now?[/say]")

		saynn("Corwin shakes his head softly.")

		saynn("[say=captain]You will always be able to talk with her, even on missions. But it will stay with me.[/say]")

		saynn("Hah. He obviously needs some way to make sure you don't just run away with your freedom.")

		saynn("[say=captain]For now.. enjoy this.[/say]")

		saynn("He presses something on that sphere.. and its aperture opens.. a bright light shines onto the floor.. as Elena starts to materialize..")

		addButton("Continue", "See what happens next", "tavi_meets_elena")
	if(state == "tavi_meets_elena"):
		addCharacter("elena")
		playAnimation(StageScene.Hug, "hug", {pc="tavi", npc="elena", bodyState={naked=isCorrupt}})
		saynn("Elena assumes a pose of an obedient maid, her gaze lowered, her hands together at her waist level.")

		saynn("Tavi silently watches her.. and then decides to go for a warm hug.")

		saynn("[say=elena]Hello.. Tavi..[/say]")

		saynn("[say=tavi]Hi mother.[/say]")

		saynn("[say=elena]But.. I'm not exactly..[/say]")

		saynn("Tavi cuts her off and only hugs her tighter.")

		saynn("[say=tavi]I don't care..[/say]")

		saynn("Elena sheds a lonely hologram tear.. and hugs Tavi back.")

		saynn("[b]THE END.[/b]")

		saynn("[b]Spy Ending.[/b]")

		addButton("Continue..", "See what happens to everyone..", "start_epilogues")
	if(state == "start_epilogues"):
		playAnimation(StageScene.Solo, "stand", {pc="captain"})
		saynn("And so.. the two brave inmates decided to join efforts with the captain, getting their freedom back in exchange for their skills and experience. Not a bad trade as it turned out.. you just gotta look at it as.. investment for the future.")

		saynn("Nothing really changed about BDCC at first. Prison life continued as normal. Captain was right, no one really cared that two inmates suddenly went missing. Only a few select people know what actually happened to you. And the captain had all of the tools required to make sure they wouldn't tell anyone..")

		saynn("The more missions you were doing for the captain, the more his power was growing. He was climbing ranks quickly, making connections and friends. All the while all his enemies would all suffer from setbacks and failures. There was always some dirt to dig up on someone.. Always.")

		saynn("BDCC was growing fast. It was still producing new people required to fight the on-going wars.. But now the captain was also able to start growing his own little personal army.")

		saynn("Captain was loyal to AlphaCorp.. And so little dark facts about him that kept surfacing.. were going off unnoticed. How can a man of such caliber be ever wrong? Why would we punish him for his past deeds? What matters is how much value he provides to the cause.")

		saynn("When AlphaCorp realized what was actually happening.. It was already too late. You and Tavi began assassinating all the high-ranking officers, including the commanders of the currently operating forces.")

		saynn("AlphaCorp was big.. very big.. but even it couldn't afford to open a second front. Captain knew where to push.. And so the corporation got brought to its knees fast when its Director.. suddenly went missing.")

		saynn("From that point on.. Director Wright got all the power he ever wanted. He didn't forget about what got him there, indeed giving you and Tavi everything you would ever want. And so you were gonna make sure no one takes his power away from him..")

		addButton("Nova", "See what happens to Nova", "ep_nova")
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

	if(_action == "collars_off"):
		processTime(3*60)
		getCharacter("tavi").getInventory().removeItemFromSlot(InventorySlot.Neck)
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.Neck)

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
