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
	if(state == "tribbing"):
		playAnimation(StageScene.SexTribadism, "sex", {pc="tavi", npc="pc", bodyState={naked=true}, npcBodyState={naked=true}})
		saynn("The heat pushes Tavi to do something quite crazy. Unable to endure it any longer, she carefully shifts to the other side of the bed, her movements careful to avoid waking you up. She sighs, her gaze jumping between your exposed {pc.pussyStretch} pussy and her drippy flower."+str(" All the while you are waiting for a good moment to mess with her.." if isScrewing else "")+"")

		saynn("Tavi uses her feline grace and maneuvers herself closer to you, her legs sliding between yours, her thigh nestled between yours, her body inching closer and closer.. until your pussies are only a few inches away.")

		saynn("Seeing that this hasn't woken you up, Tavi does a bold move and lets her slick folds gently brush against yours. During that, a little spark of pleasure courses through her body, she can't help but to cover up a cute moan with the back of her hand.")

		saynn("With the utmost care, Tavi proceeds to move her hips, gently grinding her moist sex against yours. The sensation of her soft, slick folds rubbing against a similar pair sends more of these jolts of energy through her.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("She bites her lip as she gets more brave, picking up the pace, rubbing pussies with you faster. It feels good.. very good.. you are hardly keeping yourself from moaning too, just producing soft panting noises instead. Doing such a kinky activity with the sleeping you probably brings Tavi a lot of unique sensations, her legs and arms are shaky already as she quickly approaches the peak.")

		if (isScrewing):
			saynn("But seconds before the orgasm happens, you suddenly sneeze. And that scares Tavi the fuck up, she recoils so hard she hits the metal wall and starts hissing from pain. All the while you still pretend to be sleeping like nothing happened..")

			saynn("[say=tavi]Fuck.. ow..[/say]")

			saynn("This sudden rush of adrenaline instantly ruins the mood for her. Poor Tavi huffs while her body proceeds to cool down, her heat going away unsatisfied.")

			saynn("[say=tavi]Huff..[/say]")

			saynn("Grinding pussies now would mean starting from zero. And Tavi just doesn't care enough anymore, she switches to your side and joins you in your sleep.")

		else:
			saynn("The pussy grinding intensifies, Tavi's movements becoming more urgent.. until she succumbs to the heat. Waves of pure ecstasy wash over her as she stifles her cries of pleasure, careful not to disturb your pseudo-sleep..")

			saynn("[say=tavi]F-fuck.. ah..[/say]")

			saynn("But her body shivering during her climax is actually what pushes you over the edge as well.. Your own body arches slightly as a series of little moans escapes you.")

			saynn("Both of your pussies are pulsating while brushing against each other and exchanging juices. Even when Tavi comes down from her euphoric high, she just remains in this pose, her body still trembling with the remnants of bliss. Her cell smells of sex now.. it's great..")

			saynn("Finally, after she catches her breath, Tavi switches to your side, joining you in your sleep. Her heat seems to be satisfied..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "cowgirl"):
		playAnimation(StageScene.SexCowgirl, "sex", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Naked and suffering from heat, Tavi lays beside you, her breaths shallow and needy. She keeps staring at your crotch.. at your {pc.penis}.. until she can't resist the temptation anymore.")

		saynn("Gently, she climbs and straddles you, her motions incredibly slow as to not wake you up. You become quite aroused yourself when you begin to feel heat radiating from her pussy that's hovering just inches away from your member. Tavi doesn't mind it. In fact, she can't stop herself from lowering herself a little and letting her slick folds brush against your shaft, helping it get hard.")

		saynn("You keep pretending that you're unaware of Tavi's actions, letting her be more brave. A soft moan escapes her as she wraps her digits around your shaft before aligning it with her love tunnel and lowering herself onto it, her slick inner walls eagerly spreading, allowing her to take your length inside..")

		saynn("[say=tavi]Ah..[/say]")

		saynn("She covers up her mouth with her paw as she proceeds to ride you with slow, sensual motions. The pleasurable friction makes her produce more and more stifled noises of pleasure while you just let her enjoy your cock"+str(" and waiting for a good moment to mess with her" if isScrewing else "")+"..")

		saynn("As she continues to ride you, her heat only intensifies, her body practically burning with desire, her walls coating your member with plenty of juices that allow Tavi to speed her motions up, making them more urgent and passionate. You can tell that she is close already..")

		if (isScrewing):
			saynn("But just before Tavi can experience the joy of orgasming while riding your cock, you decide to think about this galaxy that you live in.. and how insignificant you are in the grand scheme of things.. How nothing that you do really matters.. Because it all will be forgotten one day or another.. And even if you make kids, they will share the same fate eventually.. Until there is nothing of 'you' left.. What's the point then..")

			saynn("Focusing on these depressive thoughts is what kills your horny mood instantly, your {pc.cock} quickly deflating and going soft, stealing Tavi's only source of pleasure!")

			saynn("[say=tavi]H-h.. hey.. not now.. I'm so..[/say]")

			saynn("She is desperately trying to ride you.. but there is nothing to ride. And so Tavi huffs and pouts while her unsatisfied body starts to cool down.. unsolved heat.. going away. Success.")

			saynn("You keep pretending to sleep while she just joins you again.")

		else:
			saynn("And then it happens, Tavi's body shivers with ecstasy as an overwhelming climax shocks her senses. It's obvious she can't contain herself, cute little noises keep slipping from her lips no matter how good she covers them.")

			saynn("[say=tavi]H-h.. hah.. h..[/say]")

			saynn("During that, her pussy clenches so well around you that you can't help but to orgasm soon after. Tavi's eyes widen as she feels your cock throbbing and twitching inside her as it is filling her womb full of your {pc.cum}.")

			saynn("[say=tavi]..oh?..[/say]")

			saynn("Carefully, she raised herself, before realizing that, yes, she just got herself creampied. She then quickly covers her pussy up with her other paw while glancing at you, hoping that you are still somehow sleeping after all that.")

			saynn("She produces a sigh of relief as you do your best impression of a heavy sleeper. Although, she quickly leans close to your cock and cleans it with her tongue, removing most of the seed and pussy juices that were coating it.")

			saynn("After that, she just joins you again, her heat finally satisfied.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "penisgrind"):
		playAnimation(StageScene.SexCowgirl, "tease", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		if (GM.pc.isWearingChastityCage()):
			saynn("The heat makes Tavi incredibly horny. She sees the locked chastity cage that you are wearing and signs.. but then gets too desperate to care."+str(" At least there is no danger of her losing her virginity if you're locked." if isVirgin else "")+"")

		elif (isVirgin):
			saynn("The heat makes Tavi incredibly horny. She sees your {pc.penis} that she probably wants inside her so much.. But at the same time she doesn't wanna lose her virginity without you doing it to her.. At some point she becomes too desperate though..")

		else:
			saynn("The heat makes Tavi incredibly horny. She sees your {pc.penis} that she probably wants inside her so much.. But at the same time, she understands that it's extremely risky.. At some point she becomes too desperate though..")

		saynn("Unable to resist her urges, Tavi decides to test how much she can get away with. With a feline grace, she carefully positions herself over your "+str("locked up cock" if GM.pc.isWearingChastityCage() else "cock")+", her pussy only inches away from it. Even just feeling the warmth radiating from her slick"+str(" virgin" if isVirgin else "")+" folds makes you aroused.")

		saynn("Tavi sees that this didn't wake you up. So she acts brave and lowers her pussy onto "+str("your cage, feeling the cold metal brushing against her hot flower." if GM.pc.isWearingChastityCage() else "the shaft of your cock, trapping it between her slit and your belly.")+"")

		saynn("And after that, she slowly begins to move, grinding her slit against your {pc.penis}. The pleasurable friction intensifies her desire. She closes her eyes and just tries to hold a constant rhythm, enough to bring her closer to where she wants to be without waking you up.. hopefully..")

		saynn("[say=tavi]Nh-h..[/say]")

		saynn("The feline catches herself moaning softly and so she covers up her mouth, making noises into her palm while she continues to rub her pussy against you.. getting all the fun without any actual penetration..")

		saynn("Her breath grows more deep as she picks up the pace gradually, seeking the release that she craves so much. It feels good.."+str(" even if you don't feel anything through the metal cage" if GM.pc.isWearingChastityCage() else " even if your cock is not inside her")+"..")

		if (isScrewing):
			saynn("But just before Tavi reaches her orgasm, you decide to 'randomly' turn onto your belly, suddenly throwing the feline off balance. Tavi gasps as she collapses and lands onto your back.")

			saynn("[say=tavi]Ow..[/say]")

			saynn("And now.. there is nothing for her to grind. Poor Tavi huffs while her body starts losing its heated state.. without actually satisfying it.")

			saynn("Tavi pouts.. but wraps her paws around you and just tries to fall asleep again.")

		else:
			saynn("With a final, passionate grind, Tavi finally reaches her climax. She gasps, her body tenses and starts shivering while her pussy suddenly squirts all over your "+str("chastity cage" if GM.pc.isWearingChastityCage() else "member")+".")

			saynn("[say=tavi]Ngh-h~..[/say]")

			saynn("The sensations are clearly overwhelming for her. Sadly, you didn't get to cum though.")

			saynn("As Tavi satisfies her heat, she suddenly realizes how wet your crotch looks. And so, to cover up after herself, she leans down to your "+str("cage" if GM.pc.isWearingChastityCage() else "cock")+" and starts licking her wetness off. It makes you squirm.. but you still pretend to be an extremely heavy sleeper.")

			saynn("And so, when Tavi is done, she just joins you on the bed, the desires no longer messing with her mind.. for today..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "anal"):
		playAnimation(StageScene.SexReverseCowgirl, "sex", {npc="tavi", pc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true}})
		saynn("Naked Tavi can't find any release.. her desperate eyes keep watching your {pc.penis}.. "+str("She knows that she should keep her virginity for you.. But then she realizes that there is a way to satisfy her without losing it.." if isVirgin else "A devious thought comes into her mind.. She can't get rid of it.. So she decides to act on it.")+"")

		saynn("Tavi gets up and then carefully straddles you.. in a reverse cowgirl position, her round butt hovering just above your member. Seeing that this didn't wake you up gives her more confidence to follow through with this..")

		saynn("Gently, Tavi wraps her digits around the shaft of your member and strokes, getting you hard. Then she grabs some of the wetness that her heated pussy keeps producing and coats your member with it.. before attempting to lower herself onto it.")

		saynn("The tip of your cock quickly meets her tight anus ring.. That's right.. Tavi is trying to guide your cock down her butt but she is struggling to get it in while also staying quiet..")

		saynn("[say=tavi]Mh-h..[/say]")

		saynn("With slow grinding motions, she manages to work her tailhole enough for it to accept your member, using her pussy juices as lube. As soft gasp escapes Tavi as she slowly begins to move, riding you with her round ass. Her heat and aroused state makes the process surprisingly smooth, her anus instinctively accommodating your length.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("It feels good for you as well. Tavi's inner walls are clenching around your shaft so well, it's hard to stay still and quiet.. but still pretend to be asleep..")

		saynn("Hard to say but somehow Tavi gets her pussy stimulated from this. Maybe she is just too horny. More little moans escape from her so she covers her mouth while riding you slightly faster and faster, her tail getting out of the way so as to not wake you up. Soon, her orgasm starts drawing near.. just like yours.")

		if (isScrewing):
			saynn("But just before Tavi can experience the joy of orgasming while riding your cock with her butt, you decide to think about what makes you choose certain actions over other possible actions.. Like, for instance, would your exact clone choose the same actions in the same situations? Probably.. But.. Why? Because it has the same memories in its head, right? But if our past experiences define our future actions.. Then we never really have any agency over our choices.. They're not really ours.. Nothing we do matters because someone else in your shoes would do the same.. follow the exact same script.. The script of the universe..")

			saynn("Focusing on these depressive thoughts is what kills your horny mood instantly, your {pc.cock} quickly deflating and going soft, stealing Tavi's only source of pleasure!")

			saynn("[say=tavi]H-h.. hey.. not now.. I'm so..[/say]")

			saynn("She is desperately trying to ride you.. but there is nothing to ride. And so Tavi huffs and pouts while her unsatisfied body starts to cool down.. unsolved heat.. going away. Success.")

			saynn("You keep pretending to sleep while she just joins you again.")

		else:
			saynn("The climax takes her by surprise. Her body trembles as she cries out in a silent release, the sensations overwhelming her senses. She arches her back as her anal ring clenches around your cock so hard you follow soon after..")

			saynn("[say=tavi]Ah?..[/say]")

			saynn("A small gasp can be heard from her as she feels your {pc.penis} throbbing and stuffing her ass full of your {pc.cum}, waves after waves of it. She looks at you over her shoulder.. and sees you squirming in your sleep. At least that's how it looks to her.")

			saynn("[say=tavi]Ngh..[/say]")

			saynn("Even though it was a weird anal orgasm, it still satisfied Tavi's heat for today.. She carefully gets up and tries to keep her butt from leaking your seed everywhere as she joins you on the bed again, trying to go back to sleep..")

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

	if(GM.pc.hasReachableVagina()):
		possible.append("tribbing")

	if(GM.pc.hasReachablePenis() && !isVirgin && getModule("TaviModule").getSkillScore("taviSkillSex") > 1):
		possible.append("cowgirl")
	if(GM.pc.hasReachablePenis() || GM.pc.isWearingChastityCage()):
		possible.append("penisgrind")
	if(GM.pc.hasReachablePenis() && getModule("TaviModule").getSkillScore("taviSkillSex") > 3):
		possible.append("anal")

	var pickedScene = RNG.pick(possible)

	if(pickedScene in ["rubleg_cum", "facesit", "tribbing", "cowgirl", "penisgrind", "anal"]):
		getModule("TaviModule").addCorruption(7 * corruptionMod)
	if((pickedScene in ["tribbing"]) && !isScrewing):
		GM.pc.rubsVaginasWith("tavi")
		GM.pc.orgasmFrom("tavi")
	if((pickedScene in ["cowgirl"]) && !isScrewing):
		getCharacter("tavi").cummedInVaginaBy("pc")
		GM.pc.orgasmFrom("tavi")
	if((pickedScene in ["penisgrind"]) && !isScrewing):
		getCharacter("tavi").cummedInMouthBy("pc")
		GM.pc.orgasmFrom("tavi")
	if((pickedScene in ["anal"]) && !isScrewing):
		getCharacter("tavi").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("tavi")

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
