extends SceneBase

var isVag = true

func _init():
	sceneID = "AvyLoveSexScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You bite your lip softly while sneakily watching Avy's bulging shorts.")

		saynn("She catches your obvious stare and hums.")

		saynn("[say=avy]Hm. Looking for trouble?[/say]")

		saynn("You return eye contact and smile.")

		saynn("[say=pc]Maybe. Are you offering?[/say]")

		saynn("The foxy leans closer, she puts her list away and boldly caresses your hip.")

		saynn("[say=avy]More than you can handle.[/say]")

		saynn("You reach your hand out too.. but to feel her bulge instead.")

		saynn("[say=pc]I can handle a lot..[/say]")

		saynn("Avy turns her gaze down at your hand.. and then puts on a wide smile.")

		addButton("Continue", "See what happens next", "bj")
	if(state == "bj"):
		playAnimation(StageScene.ChairOral, "suckfast", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		aimCameraAndSetLocName("hideout_chill")
		saynn("Next moment you know, you're on your knees, sucking Avy's knotted cock. Your throat is making wet noises as she is forcing you deeper onto her shaft.. until your snout hits her crotch. Her knot isn't inflated enough to stop you.")

		saynn("[say=avy]Grhh..[/say]")

		saynn("Lonely tears stream down your cheeks as you're deepthroating that cock, bobbing your head, testing your own gag reflex.")

		saynn("[say=avy]I'm ready.[/say]")

		saynn("You got her quite worked up already. As you pull her cock from your mouth, a string of saliva is left hanging between your tongue and the red tip..")

		addButtonWithChecks("Offer pussy", "Let Avy fuck your pussy!", "pussy_fuck", [], [[ButtonChecks.HasReachableVagina]])
		addButton("Offer ass", "Let Avy fuck your ass!", "ass_fuck")
	if(state == "pussy_fuck"):
		playAnimation(StageScene.SexMatingPress, "sex", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Avy grabs your hips and pins you into the floor, your legs spreading wide for her. She looms over you, her blue eyes burning.")

		if (isVag):
			saynn("[say=pc]Fuck my pussy-..[/say]")

		else:
			saynn("[say=pc]Fuck my ass-..[/say]")

		saynn("She cuts you off with a growl and a single thrust of her cock down your "+str("wet slit" if isVag else "needy tailhole")+". All the way in. You cry out against her, your nails digging into her shoulders as your "+str("pussy" if isVag else "anal ring")+" gets stretched wide already.")

		saynn("[say=pc]F-fuck..[/say]")

		saynn("[say=avy]Tight little "+str("cunt" if isVag else "hole")+".[/say]")

		saynn("She pulls back.. only to slam forward again. Hard and fast. Again and again.")

		saynn("Her hips start to piston wildly, driving her hard cock into you. The room fills with wet slaps and your joined grunts. She really puts all her weight into it, her knot inflating and now pushing on your "+str("folds" if isVag else "star")+".")

		saynn("You're clenching hard around her, your inner walls gripping her shaft while she keeps pounding it.")

		saynn("She laughs between all the shared panting.")

		saynn("[say=avy]Told you.. can't handle me..[/say]")

		saynn("[say=pc]Go as hard as you can.. mhh.. fucking break me..[/say]")

		saynn("Ask.. and you shall receive.")

		addButton("Continue", "See what happens next", "sex_faster")
	if(state == "sex_faster"):
		playAnimation(StageScene.SexMatingPress, "fast", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}, npcCum=true, pcCum=true})
		saynn("Avy quickens her pace, turning ruthless. The head of her cock "+str("punches against your cervix" if isVag else "reaches deep inside you")+" with each thrust, leaving you dizzy. And yet, you wrap your legs around her waist, pulling her"+str(" even" if !isVag else "")+" deeper and whispering hot moans into her ear.")

		if (!isVag):
			if (GM.pc.hasReachablePenis()):
				saynn("The way her dick massages your pleasure spot, it makes your own cock twitch and drip..")

			elif (GM.pc.isWearingChastityCage()):
				saynn("The way her dick massages your pleasure spot, it makes your own cock twitch and drip inside its chastity cage..")

			elif (GM.pc.hasReachableVagina()):
				saynn("Your neglected, drippy pussy barely gets any stimulation from this.. but you still love it..")

		saynn("[say=pc]Is that all you got?[/say]")

		saynn("Avy snarls and drives her cock in with full power, her fat length spearing into your "+str("pussy" if isVag else "fuckhole")+", her inflated knot slapping against the "+str("sensitive folds.. before suddenly stretching them wide, knotting you" if isVag else "stretched star.. before suddenly stretching it even further, knotting you")+".. Your orgasm hits without warning, a sharp, sudden crack of pleasure that rips a scream from your throat.")

		if (GM.pc.hasReachablePenis()):
			saynn("Your {pc.penis} starts shooting strings of {pc.cum} into the floor, your balls tensing up!")

		elif (GM.pc.isWearingChastityCage()):
			saynn("Your {pc.penis} starts shooting weak strings of {pc.cum} through the little hole of the cage!")

		elif (!isVag && GM.pc.hasReachableVagina()):
			saynn("Your pussy squirts during your climax, the overstimulation making you gush juices!")

		saynn("Avy doesn't stop. She fucks you through it all, railing your "+str("cunt" if isVag else "tailhole")+". She yanks her knot out.. just to shove it inside your throbbing fuckhole again. Asking her to pull out now.. probably won't work.")

		saynn("The whole room smells of sex.. and sounds like it too.")

		saynn("She just keeps shoving you back into the state of pure ecstasy, chasing her own, pulling out her knot and forcing it down your gaping "+str("slit" if isVag else "hole")+" again! And eventually, she cums too..")

		saynn("She shoves her whole length with a final brutal thrust, grunting while her knotted cock is locked deep inside you.")

		saynn("[say=avy]Take it all..[/say]")

		saynn("You feel it.. her cum.. hot and thick.. flooding your insides. The foxy is panting hard against your neck while her member is throbbing and pumping your "+str("womb" if isVag else "guts")+" full of that good stuff.")

		addButton("Continue", "See what happens next", "after_orgasm")
	if(state == "after_orgasm"):
		playAnimation(StageScene.SexMatingPress, "inside", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("The room slowly quiets. The only sounds that are left are heavy panting and the soft, wet noises of your "+str("pussy" if isVag else "tailhole")+" being stretched wide. Avy's weight presses you into the floor, her breath hot and ragged against your neck.")

		saynn("She tries to pull out but her knot is still lodged inside you, keeping you together and also trapping every last drop of her cum in your "+str("pussy" if isVag else "butt")+".")

		saynn("[say=avy]F-fuck..[/say]")

		saynn("She chuckles breathlessly against your skin, her voice spent.")

		saynn("[say=pc]Mhh.. Told you I could handle it..[/say]")

		saynn("You manage a weak smirk, your legs twitching every now and then from the aftershocks.")

		saynn("Avy looks down at you, her blue eyes are half-closed, satisfied. She nuzzles your cheek and then gives it a soft lick.")

		saynn("[say=avy]Yeah.. you did okay.[/say]")

		saynn("You chuckle, too tired to argue.")

		addButton("Just wait", "Wait until the knot deflates", "just_wait")
	if(state == "just_wait"):
		playAnimation(StageScene.SexMatingPress, "tease", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Minutes pass.. The two of you just lie there, waiting for Avy's knot to soften. Your "+str("pussy" if isVag else "asshole")+" keeps clenching around her involuntarily, making her grunt.")

		saynn("[say=avy]If you don't want another load, quit clenching.[/say]")

		saynn("[say=pc]It's not my fault you decided to knot me.[/say]")

		saynn("She huffs a laugh.")

		saynn("[say=avy]Shut up.[/say]")

		saynn("You smile and close your eyes, just enjoying the feeling of her on top of you.. the warmth.. the slow pulse of her cock inside you.")

		saynn("Eventually, Avy manages to yank her member out. A wet, loud pop echoes through the room.. followed by your gasp. Your "+str("used pussy" if isVag else "used hole")+" gapes.. before a thick, white fountain of her seed spills out of you, hot and messy, pooling onto the floor beneath.")

		saynn("[say=pc]Oh fuck..[/say]")

		saynn("Avy looks at all the mess with a smug little grin on her face. Her own shaft is quite messy too now. But she just makes a ring out of her digits around her cock and slides it off, catching most of the mess with it.")

		saynn("[say=avy]That was fun.[/say]")

		saynn("You nod.")

		saynn("It's time to go back.")

		addButton("Continue", "See what happens next", "endthescene")
		addButtonWithChecks("Watersports..", "Maybe she can help clear your hole", "watersports", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])
	if(state == "watersports"):
		playAnimation(StageScene.SexMatingPress, "inside", {pc="avy", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("But maybe.. There is something else Avy can do with all of the mess that's inside you.")

		saynn("[say=pc]Hey.. maybe you'd like to.. relief yourself?[/say]")

		saynn("Avy's ears perk up at your words. She raises an eyebrow, still holding her wet, soft cock in her hand.")

		saynn("[say=avy]Relief myself? Inside you?[/say]")

		saynn("She lets out a low, amused chuckle, her gaze dropping down to your gaping, leaking "+str("pussy" if isVag else "asshole")+". You use your hand to spread "+str("your twitching folds" if isVag else "it")+", showing the creamed hole in its full glory.")

		saynn("[say=avy]You want me to piss in that little "+str("cunt" if isVag else "tailhole")+"?[/say]")

		saynn("Your cheeks burn.. but you hold her gaze.")

		saynn("[say=pc]It'd help clean me up.. in a way. And save you a trip to the toilet..[/say]")

		saynn("Avy grins, her cock slowly getting harder after your words. She crawls back over you, her half-soft shaft brushing against your thigh.")

		saynn("[say=avy]Fuck.. you're a dirty little thing, aren't you?[/say]")

		saynn("She grabs your hips and presses the tip of her cock against your soaked, stretched entrance. She works herself in, her member pushing aside the mess that she left, entering your "+str("slit" if isVag else "anal ring")+" again..")

		saynn("You moan softly, your "+str("pussy" if isVag else "inner walls")+" hugging her..")

		saynn("[say=avy]There. Now just wait.[/say]")

		saynn("She stays still, her cock buried inside you. Seconds begin to drag by, your heart pounding. You can feel her twitching.. growing harder inside you.")

		saynn("And then.. you feel it. A sudden, hot gush. A stream of warm gross liquid begins flooding your "+str("womb" if isVag else "ass")+"..")

		saynn("Your eyes go wide as you feel Avy's piss rush into you, washing out all the leftover seed, filling you to the brim. Your belly begins to feel full and warm.")

		saynn("Avy lets out a long, satisfied groan during this, her hips pressed flush against you as she keeps emptying her bladder deep inside you.")

		saynn("[say=avy]Fuck.. yeah..[/say]")

		saynn("It's too much.. you feel some of it already leaking out around her cock, creating a different kind of mess beneath.")

		saynn("Avy keeps pissing.. until the stream begins to finally die down. When she pulls out.. a cascade of warm piss spills out of your gaping hole, splashing onto the floor.")

		saynn("Avy smirks.")

		saynn("[say=avy]This is fucking gross~. Clean enough for you?[/say]")

		saynn("You're panting, your face red.")

		saynn("[say=pc]F-fuck.. yes..[/say]")

		saynn("She chuckles and puts her cock away.")

		saynn("[say=avy]Enjoy it then.[/say]")

		saynn("And so that was it..")

		saynn("Now you were done.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "bj"):
		processTime(3*60)
		GM.pc.gotThroatFuckedBy("avy")

	if(_action == "pussy_fuck"):
		isVag = true

	if(_action == "ass_fuck"):
		isVag = false
		setState("pussy_fuck")
		return

	if(_action == "sex_faster"):
		processTime(3*60)
		GM.pc.orgasmFrom("avy")
		if(isVag):
			GM.pc.gotVaginaFuckedBy("avy")
			GM.pc.cummedInVaginaBy("avy")
		else:
			GM.pc.gotAnusFuckedBy("avy")
			GM.pc.cummedInAnusBy("avy")

	if(_action == "after_orgasm"):
		processTime(5*60)

	if(_action == "just_wait"):
		processTime(20*60)

	if(_action == "watersports"):
		if(isVag):
			if(GM.pc.hasBodypart(BodypartSlot.Vagina)):
				GM.pc.getBodypart(BodypartSlot.Vagina).clearOrificeFluids()
			GM.pc.cummedInVaginaBy("avy", FluidSource.Pissing)
		else:
			if(GM.pc.hasBodypart(BodypartSlot.Anus)):
				GM.pc.getBodypart(BodypartSlot.Vagina).clearOrificeFluids()
			GM.pc.cummedInAnusBy("avy", FluidSource.Pissing)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isVag"] = isVag

	return data

func loadData(data):
	.loadData(data)

	isVag = SAVE.loadVar(data, "isVag", true)
