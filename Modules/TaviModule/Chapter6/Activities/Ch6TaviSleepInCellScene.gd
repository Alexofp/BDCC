extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var isScrewing = false

func _init():
	sceneID = "Ch6TaviSleepInCellScene"

func _run():
	if(state == ""):
		addCharacter("tavi", ["naked"])
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		playAnimation(StageScene.Sleeping, "sleep", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("Just before you're about to fall asleep, Tavi quietly slips into your cell and joins you under the blanket. In fact, she becomes your blanket, tossing the real one away as it is too hot. But you don't mind, Tavi's warmth is enough to keep you both at a perfect temperature.")

		saynn("You two embrace each other and welcome the sweet dreams. Tavi is purring ever so noticeably while resting her chin on your {pc.masc} chest.")

		addButton("Continue", "See what happens next", "sex_check")
	if(state == "tavihorny"):
		playAnimation(StageScene.Sleeping, "rub", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("It's very early in the morning.. Way before anyone is up yet.")

		saynn("You wake up because Tavi is rubbing against you, clearly horny.."+str(" Even though she is not corrupted now, she is still getting lewd dreams it seems." if isPure else " Her corrupted state keeps igniting the state of heat inside her.")+"")

		saynn("Do you not do anything and see what happens? Alternatively, you can embrace her better, making sure she will be sleeping tight.")

		addButton("Let Tavi act", "See what Tavi will do", "sex_pick")
		addButton("Screw with Tavi", "Mess with her a little", "screw_pick")
		addButton("Embrace Tavi", "Prevent Tavi from doing anything", "prevent_lewd")
	if(state == "prevent_lewd"):
		playAnimation(StageScene.Sleeping, "sleep", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You wrap your hands around Tavi and hug her tightly. And soon enough, she stops squirming, seemingly just slipping back into a state of deep sleep where lewd thoughts don't attack her.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "rubleg_cum"):
		playAnimation(StageScene.Sleeping, "rub", {npc="tavi", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("You pretend that you sleep peacefully and just let Tavi do anything she wants with you."+str(" For now.." if isScrewing else "")+"")

		saynn("She shifts subtly against your body, positioning herself in such a way that your leg is now hugged by hers, her slick pussy lips pressed against your thigh.")

		saynn("Her movements are slow but deliberate, Tavi is grinding her sex against you while also swaying her hips with a sensual rhythm. But that doesn't solve Tavi's heat, it only ignites her desire more, making her pick up the pace.")

		saynn("[say=tavi]H-h.. hh-h..[/say]")

		saynn("Her breath quickens and little moans escape from her. Not wanting to wake you up, Tavi buries her face into your chest to stifle any noises that keep slipping past her lips.")

		saynn("With each pass of her slick, heated pussy against your leg, Tavi's arousal grows, the pleasure building within her. You can feel her heart beating as she teeters on the edge of an orgasm..")

		if (isScrewing):
			saynn("But just before she can get the orgasm that she so desires, you purposefully shift your body, pulling your leg out of the hot embrace while still pretending to sleep soundly. And that simple action steals the only source of pleasure that Tavi had, causing her to start whining quietly.")

			saynn("[say=tavi]H-huff..[/say]")

			saynn("She is panting softly while her body begins to cool down.. Heat goes away, unsatisfied..")

			saynn("She sighs and just closes her eyes, slowly drifting back into her sleep. And so are you.")

		else:
			saynn("And then it happens, Tavi's body can't stop trembling as a powerful climax crashes over her. She bites down on her lip to silence the pleasure that threatens to escape, her claws digging into the bedsheets as she quivers from powers beyond her control.")

			saynn("[say=tavi]Nh.. h-h.. hhh-h..[/say]")

			saynn("She is panting softly, her pussy coating your leg in her juices as she comes down from the high. With a satisfied sign, Tavi nuzzles closer to you, her heat temporarily sated.")

			saynn("And so she quickly drifts back into sleep.. and so are you.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "facesit"):
		playAnimation(StageScene.SexFaceSitting, "sit", {pc="tavi", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("Tavi stirs in her sleep, feeling the irresistible pull of her need, her body keeps shifting in search of relief. As she slides her leg over your thighs, you realize that she is dry-humping you slightly. But even that is not enough..")

		saynn("The feline opens her sleepy eyes and huffs, realizing that she won't get to sleep tonight if she doesn't get what she wants. A devious thought comes into her mind.. She knows that she must be careful not to wake you.. but her need is overwhelming..")

		saynn("She decides to get up.. just to slowly straddle your face, positioning herself just inches above you. Tavi sighs, probably understanding how wrong this is.. but she can't help herself. You stay quiet and keep pretending that you are asleep.."+str(" All the while looking for a good moment to deny the feline.." if isScrewing else "")+"")

		saynn("Her fingers then find their way to her heated sex that's shining with anticipation. She is using some to trace little circles around her cute sensitive clit while the others play with the folds. You keep your eyes almost fully closed but the glow coming from her pussy makes it easy to examine her"+str(" virgin" if isVirgin else "")+" petals in great detail.")

		saynn("[say=tavi]Nh-h.. so good..[/say]")

		saynn("Her breath gets deep as she produces stifled moans, one of the drops of her juices hanging down from her slit, reaches your face. Tavi sees that you didn't wake up from that and becomes more bold, her digits rubbing her pussy faster and faster. She bites her lip, seemingly about to cum..")

		if (isScrewing):
			saynn("And just before she does, you suddenly turn on your side, pretending that you want to rest your face on the pillow. But this little maneuver causes Tavi to suddenly topple to the side before crashing off the bed in a spectacular manner!")

			saynn("[say=tavi]EEP![/say]")

			saynn("Poor feline collapses onto the cold floor, her orgasm getting denied when she was so close to getting it.")

			saynn("[say=tavi]Huff..[/say]")

			saynn("She pouts and looks at you. But you just keep 'sleeping' like nothing happened.")

			saynn("And so Tavi sighs and carefully joins you on the bed again, her heat solved.. but not satisfied.")

		else:
			saynn("And then it happens. As Tavi's arousal reaches its peak, her body tenses, and an electrifying wave of pleasure rocks through her. She throws her head back and succumbs to a powerful orgasm, her pussy suddenly coating your face in her transparent girlcum as she squirts from overstimulating herself. The scent.. is incredible.. Even if you're not sure how to react to this..")

			saynn("[say=tavi]Ye-e-es.. f-fuck-k..[/say]")

			saynn("Her legs and arms shake, she can't stay silent for long as more stifled moans escape her. After her high passes over, she looks down at you and a slight panic spawns within her when she sees her juices all over your face.")

			saynn("[say=tavi]Oh shit..[/say]")

			saynn("Quickly, she gets off your face and instead proceeds to lick it clean with her tongue, trying to cover up after herself. It tickles.. but you don't wake up even then, pretending to be a really-really deep sleeper.")

			saynn("After licking off what she can, Tavi just carefully joins you again, resting her head on your chest.")

		addButton("Continue", "See what happens next", "endthescene")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak

func playRandomScene(corruptionMod):
	var possible = []

	possible.append("rubleg_cum")
	possible.append("facesit")

	var pickedScene = RNG.pick(possible)

	if(pickedScene in ["rubleg_cum", "facesit"]):
		getModule("TaviModule").addCorruption(7 * corruptionMod)

	setState(pickedScene)
	setFlag("TaviModule.Ch6TaviSatisfied", true)
	return


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sex_check"):
		if(getFlag("TaviModule.Ch6TaviAllowedToLewdPCDuringSleep") && RNG.chance(40)):
			setState("tavihorny")
			return
		
		endScene()
		return

	if(_action == "sex_pick"):
		playRandomScene(1.0)
		return

	if(_action == "screw_pick"):
		isScrewing = true
		playRandomScene(-1.0)
		return

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["isScrewing"] = isScrewing

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	isScrewing = SAVE.loadVar(data, "isScrewing", false)
