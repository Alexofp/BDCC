extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false

func _init():
	sceneID = "TaviMasochismUnconsciousScene"

func _run():
	if(state == ""):
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		addCharacter("tavi", ["naked"])
		playAnimation(StageScene.SexStart, "defeated", {npc="tavi", npcBodyState={naked=true}})
		saynn("Oops.. it seems you have choked Tavi too much. A little miscalculation caused you to keep a tight grip on her throat for too long. Tavi's feline eyes went wide in surprise before her expression faded into unconsciousness, her body going limp on you.")

		saynn("[say=pc]Tavi?[/say]")

		saynn("Immediately, you stop choking her and check her pulse.. yeah, it seems to be there. Tavi is breathing even if she is not reacting anymore.")

		addButton("Help her", "Help Tavi get back to her senses", "help_tavi")
		addButton("'Help her'", "Tavi is quite.. vulnerable right now.. isn't she?", "lewd_tavi")
	if(state == "help_tavi"):
		playAnimation(StageScene.Cuddling, "idle", {npc="tavi", npcBodyState={naked=true}})
		saynn("You tap on Tavi's cheeks a few times and her face muscles instinctively tense up. You repeat that and then shake her a little until the senses begin returning to her.")

		saynn("[say=tavi]Ow.. My head..[/say]")

		saynn("Her paws reach for her face and hold onto it. You snatch a pillow off her bed and put it under her head as support.")

		saynn("[say=pc]How are you?[/say]")

		saynn("[say=tavi]"+str(taviSpeak("Feels like I got railed hard by you.. Which is.. acceptable..", "Feels like I got gangbanged by the whole prison.. Which is.. acceptable..", "Feels like I got into a fight and headbutted everyone.. Which is.. acceptable.."))+"[/say]")

		saynn("Now that's a Tavi that you remember. She hisses a little as you try to lift her a bit before pulling in for some cuddles.")

		saynn("[say=pc]Sorry. I pushed you a little too far.[/say]")

		saynn("[say=tavi]Yeah, that wasn't nice.. But I knew what I was signing up for.[/say]")

		saynn("She tries to look behind her at you but turning her head causes her headache to get stronger.")

		saynn("[say=tavi]Ow. Can't ride the highs without the lows? Or something like that.[/say]")

		saynn("[say=pc]Still, I shouldn't have..[/say]")

		saynn("Tavi cuts you off.")

		saynn("[say=tavi]I kill people. Well, used to. You know, it's nice to be on the other side sometimes. Not too often.[/say]")

		saynn("She doesn't seem to make much sense. Her mind is still all over the place probably, causing various thoughts to come up unprompted.")

		saynn("[say=pc]What do you mean?[/say]")

		saynn("[say=tavi]Do you think killers wonder how their victims feel? I do.. Probably because I had a big empty spot in my soul.[/say]")

		saynn("She smiles and rubs against you.")

		saynn("[say=tavi]And now you fill that spot~. Don't worry about it~.[/say]")

		saynn("That went in a strange direction. You decide to just cuddle Tavi for some time to help her recover.")

		saynn("At least she is alright.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lewd_tavi"):
		saynn("You shake Tavi a little but she keeps sleeping soundly, her warm breathing tickling your skin. As you move her into a more comfortable position and notice that the fur near her crotch has gotten quite wet from this, a devious thought comes into your mind..")

		saynn("You feel some guilt.. but you're also.. curious. Your hands gently part Tavi's thighs, putting her needy"+str(" untouched" if getModule("TaviModule").isVirgin() else "")+" flower out on display.")

		saynn("As you touch it, the feline squirms slightly under you. So you continue, rubbing her little glowing clit with linear motions. Soon, Tavi parts her lips and starts moaning softly while her petals become even more wet. It's like she wants this..")

		addButton("Fingers", "Make Tavi feel good with your fingers", "cum_fingers")
		addButtonWithChecks("Fuck her", "She can't say no anyway..", "fuck_tavi", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Strapon her", "She can't say no anyway..", "strapon_tavi_pick", [], [ButtonChecks.HasStraponAndCanWear])
	if(state == "cum_fingers"):
		saynn("A thirst for forbidden drives you further, your fingers tracing a teasing path along her sensitive folds, wondering how much they can get away with..")

		saynn("Your fingers delicately explore Tavi's pussy, spreading it slightly to uncover"+str(" the hymen that is still intact despite how much she went through. You decide to be careful not to tear it now." if getModule("TaviModule").isVirgin() else " the slick depths, the slightly pulsing inner walls.. and the cervix that is illuminated by a green glow.")+"")

		saynn("As you continue to rub her cute slit, Tavi's body responds in subtle ways, her hips shifting, her toes curling, her tail wrapping around her leg. Slowly, you increase the rhythm, stimulating her folds while trying not to wake her up.")

		saynn("Eventually you find a perfect pace, teasing the unconscious feline at the edge of her peak. Her cell smells of desire and arousal.. and sex.")

		saynn("A moment comes where Tavi's body can't endure the constant source of pleasure anymore. She produces a cute prolonged moan as her body tenses from an orgasm surging through it, her hips twitching involuntarily. A second later, Tavi's pussy squirts all over her thighs, releasing all of its stored up tension. Lewd.")

		saynn("After that, you are just left to watch Tavi squirming from the afterglow of her pleasure.")

		addButton("Wake her up", "Wake up Tavi", "finger_wakeup")
	if(state == "finger_wakeup"):
		playAnimation(StageScene.Cuddling, "idle", {npc="tavi", npcBodyState={naked=true}})
		saynn("You pull Tavi in for some cuddles and then shake her a little until she finally comes back to her senses. She slowly opens her eyes.")

		saynn("[say=tavi]Ow.. Head..[/say]")

		saynn("You nuzzle her cheek to help calm her down.")

		saynn("[say=tavi]How long was I out for?[/say]")

		saynn("[say=pc]Some time.[/say]")

		saynn("Tavi looks at herself.. probably feeling warmth spreading throughout her whole body.")

		saynn("[say=tavi]I had such a.. strange dream.[/say]")

		saynn("[say=pc]Sorry I pushed too far.[/say]")

		saynn("She rubs her head and rests in your hands.")

		saynn("[say=tavi]It's alright. I don't mind. I knew what I signed up for..[/say]")

		saynn("You spend some time together.")

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

	if(_action == "help_tavi"):
		processTime(30*60)

	if(_action == "lewd_tavi"):
		processTime(3*60)

	if(_action == "cum_fingers"):
		processTime(3*60)
		getCharacter("tavi").cummedOnBy("tavi", FluidSource.Vagina, 0.3)

	if(_action == "fuck_tavi"):
		processTime(3*60)

	if(_action == "finger_wakeup"):
		processTime(3*60)

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
