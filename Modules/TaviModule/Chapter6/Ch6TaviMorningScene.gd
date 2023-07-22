extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false

func _init():
	sceneID = "Ch6TaviMorningScene"

func _run():
	if(state == ""):
		addCharacter("tavi", ["naked"])
		var playedAnim = false
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		saynn("As you enter Tavi's cell, you find her lying on her bed, her breathing heavy and her eyes filled with the mix of desire and need.")

		var randomText = RNG.pick([1, 2, 3, 4, 5, 6])
		if (randomText == 1):
			saynn("The air in the cell is filled with tension as Tavi notices you, her voice is quiet.")

			saynn("[say=tavi]I can't take it anymore.. I need you..[/say]")

			saynn("She doesn't even care that she is naked and displaying her needy pussy to you. She hopes you see it even.")

		elif (randomText == 2):
			saynn("Tavi's gaze wanders over your {pc.masc} body, mostly lingering on your crotch. She purrs with a seductive smile.")

			saynn("[say=tavi]Would you help me to satisfy this heat.. I need you to fuck me..[/say]")

			saynn("Her paws are idly rubbing her pussy, the clawed digit gently playing with the clit. Tavi doesn't seem to mind you watching.")

		elif (randomText == 3):
			saynn("As you approach her, Tavi shifts her body, spreading her legs slightly for you. A silent invitation.. Her soft voice trembles with urgency.")

			saynn("[say=tavi]It's happening again.. Every day.. I can't.. I need to cum..[/say]")

			saynn("Her body is squirming slightly while you watch. Her pussy is incredibly wet. Seems like that experiment that Eliza did her got her hooked on pleasure.")

		elif (randomText == 4):
			playedAnim = true
			playAnimation(StageScene.Hug, "hug", {npc="tavi", npcBodyState={naked=true}})
			saynn("Tavi gets up off the bed and reaches out to touch your hand before guiding it to her sensitive spot between her legs. Her body arches with pleasure just feeling the contact of your digits on her wet pussy folds. She looks at you with pleading eyes.")

			saynn("[say=tavi]Fuck me.. Use me.. Do anything to me.. Just let me cum.. I will be your submissive slut..[/say]")

			saynn("You pull the hand away before Tavi starts humping it. Isn't she a needy girl..")

		elif (randomText == 5):
			playedAnim = true
			playAnimation(StageScene.Hug, "hug", {npc="tavi", npcBodyState={naked=true}})
			saynn("With a soft whimper, Tavi gets up and presses her girly body against yours, her paws trailing up your {pc.masc} chest.")

			saynn("[say=tavi]I can't endure it any longer.. You must fuck me.. Any way you want..[/say]")

			saynn("Your pet is rubbing her crotch against your leg, spreading her pussy juices. So needy..")

		elif (randomText == 6):
			playedAnim = true
			playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="kneel", npcBodyState={naked=true}})
			saynn("Tavi notices you and gets off the bed. Her body trembles with unfulfilled desire as she kneels before you, her paws idly brushing against her curves and rubbing the sensitive spots.")

			saynn("[say=tavi]I'm so needy.. And I'm yours to take..[/say]")

			saynn("Her voice sounds almost desperate. That kitty really wants to be fucked..")

		if (!playedAnim):
			playAnimation(StageScene.Sleeping, "idle", {pc="tavi", bodyState={naked=true}})
		addButton("Finger her", "Make Tavi cum with just your fingers", "do_finger")
	if(state == "do_finger"):
		playAnimation(StageScene.SexStanding, "tease", {npc="tavi", pc="pc", npcBodyState={naked=true}})
		saynn("With a firm grip, you pin Tavi against the wall. Her body is already shivering with anticipation. She willingly spreads her long legs and sticks her butt out for you, her tail getting out of the way, exposing the dripping sex..")

		saynn("Your touch is commanding and yet tender as you decide to tease Tavi a little more and cup her {tavi.breasts}, squeezing them so tight she can't help but to let out a moan. The sensations of your palms brushing against her perky nips is sending shivers down her spine, igniting a hunger for more.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("After that, your fingers move lower, between her legs.. until they find her drenched dripping pussy. A blush spreads across Tavi's cheeks, she is so exposed and vulnerable. And yet, she lets you do anything with her..")

		saynn("Without hesitation, you begin rubbing Tavi's pussy, your fingers expertly navigating her slick folds. Her breath gets all heavy and deep as the pleasure waves wash over her. Each stroke brings her closer and closer, a powerful sensation builds within her..")

		if (isVirgin):
			saynn("You are careful to avoid her virgin pussy entrance but you give extra attention to the little green clit, swiping left and right with your big thumb until Tavi is squirming before you.")

		else:
			saynn("She is not a virgin so you are free to plunge your digits down her pussy hole and start fingering her slutty sex. Your digits are bent a little, allowing you to hit the g-spot which causes the feline to squirm and moan loudly, her pussy is already squirting out some juices.")

		saynn("[say=tavi]I'm gonna.. I'm..[/say]")

		addButton("Let her cum", "Let Tavi experience another orgasm", "do_finger_cum")
		addButton("Deny Tavi", "Deny her orgasm", "do_finger_deny")
	if(state == "do_finger_cum"):
		saynn("You don't stop rubbing Tavi's pussy until her body starts convulsing in orgasm, the climax is so strong, it makes her legs shake. Her pussy is pulsing and clenching around your digits, a flood of her juices leaves your hand incredibly wet.")

		saynn("[say=tavi]Feels so g-good..[/say]")

		saynn("You then bring the hand to her mouth and Tavi begins eagerly licking her own juices, her long rough tongue tickling your palm.")

		saynn("That seems to satisfy Tavi. Probably not for long.")

		addButton("Continue", "See what happens next", "start_talk")
	if(state == "do_finger_deny"):
		saynn("Tavi is so close to her orgasm, she can feel it. However, you have different plans. To her surprise, you pull your hand away from her dripping pussy, denying her the climax she so desperately craves.")

		saynn("[say=tavi]H-hey..[/say]")

		saynn("A mixture of confusion and frustration fills Tavi's eyes as she feels the pleasure slipping away. Her body arches towards you, her paws begin reaching down to her crotch to finish what you have started.. but you catch her wrists and prevent that, causing the feline to start breaking down.")

		saynn("[say=tavi]No-o!.. I need to cum.. Please..[/say]")

		saynn("But your touch is firm and your voice is cold. You force Tavi to endure her body cooling down, her desire.. going away.. unfulfilled..")

		saynn("[say=pc]No. You're not allowed to cum, Tavi.[/say]")

		saynn("Her body quivers with frustration. She is truly desperate.. But at least her heat seems to be slowly going away.. for now..")

		saynn("[say=tavi]So mean..[/say]")

		addButton("Continue", "See what happens next", "start_talk")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_finger"):
		processTime(3*60)

	if(_action == "do_finger_cum"):
		getModule("TaviModule").addCorruption(1)

	if(_action == "do_finger_deny"):
		getModule("TaviModule").addCorruption(-1)

	if(_action == "start_talk"):
		endScene()
		runScene("Ch6TaviTalkScene")
		return

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
