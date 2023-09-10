extends SceneBase

var isCorrupt = false
var isPure = false
var isNormal = false
var isVirgin = false
var firstTime = false

func _init():
	sceneID = "Ch6TaviDemonScene"

func _initScene(_args = []):
	firstTime = !getFlag("TaviModule.Ch6TaviDemonSceneHappened", false)

func _run():
	if(state == ""):
		addCharacter("tavi", ["naked"])
		isCorrupt = getModule("TaviModule").isCorrupt()
		isPure = getModule("TaviModule").isPure()
		isNormal = (!isCorrupt && !isPure)
		isVirgin = getModule("TaviModule").isVirgin()
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		setFlag("TaviModule.Ch6TaviDemonSceneHappened", true)
		if (firstTime):
			saynn("You decide to talk with Tavi. She walks up to you, her hips swaying a lot.")

			saynn("[say=pc]You.. you certainly changed.[/say]")

			saynn("The feline giggles and then snaps her fingers, causing her uniform to suddenly dissolve, revealing the naked body.. her {tavi.breasts}.. her eternally wet pussy with a womb mark above it.")

			saynn("[say=tavi]Did I~? Feels like I'm out of this world, right~?[/say]")

			saynn("[say=pc]Wow. Is that.. magic?[/say]")

			saynn("Tavi starts circling you. So much is strange about her. And yet, it all kinda fits? Her long sharp claws are brushing against your skin, her feline tail brushing against your leg. All the while she is being careful not to hit you with her impressive horns.")

			saynn("[say=tavi]I don't think I changed.. I think it was more of a.. revelation.. you know?[/say]")

			saynn("Tavi's voice becomes low and intimate. You begin to hear a subtle demonic echo surround you as she speaks.")

			saynn("[say=tavi]My father.. was pretty much a devil. My mother.. a hologram. I shouldn't even exist.. I'm a glitch.. a monster if you want.[/say]")

			saynn("She stops in front of you and smiles, showing her sharp fangs and her long pointy tongue.")

			saynn("[say=tavi]And yet, here I am. Powerful. Sexy. Fertile. I could have never realized my full potential without you, dear. And for that, I will serve you forever~. In any dimension. Be it hell, cyberspace or this.. world. It's all the same really.[/say]")

			saynn("Tavi leans closer and carefully kisses you on the lips. As she does that, you feel yourself getting weaker.")

			saynn("[say=tavi]Sorry~. Couldn't resist. As for your magic question.. Magic doesn't exist, everyone knows that~.[/say]")

			saynn("It's almost like Tavi's green spots on her fur are glowing brighter than they usually do. There are green flames in her eyes.")

			saynn("[say=pc]But then.. how are you..[/say]")

			saynn("[say=tavi]You know the answer better than I do~. Any sufficiently advanced technology is indistinguishable from magic.[/say]")

			saynn("That.. didn't make it any easier to grasp.")

			saynn("[say=pc]Are you.. an android then?[/say]")

			saynn("[say=tavi]Do I look like one~? Listen, magic doesn't exist, yes. But magic tricks do~. And I know a few that you might like~.[/say]")

			if (isVirgin):
				saynn("Tavi uses her sharp claws to spread her pussy for you, showcasing the hymen that she still has, a last sign of Tavi's innocence.")

				saynn("[say=tavi]You're trying so hard to keep me a virgin. But there is no point, I can just regrow this little piece of flesh at will~. Don't hold back, fuck me already, I'm anything but pure anyway~.[/say]")

			else:
				saynn("Tavi uses her sharp claws to spread her pussy for you, showcasing her inner walls.. her depths illuminated by the green glow coming from her blood.")

				saynn("[say=tavi]Did you enjoy stealing my virginity~? Because we can do it all again. I can regrow that little torn piece of flesh at will, just give me a call~. Find all the possible ways to deflorate me~.[/say]")

			saynn("Tavi has her constant smile on her face.. the exact same one that you saw on your day one with her..")

			saynn("[say=tavi]And, if you want, I can grow something else too. Something big and prickly. But I might not be able to control myself after that, so be careful~.[/say]")

		else:
			saynn("You approach Tavi with intent to ask her to do one of her magic tricks.")

			saynn("She smiles and snaps her fingers, making her green spots shine brighter and her eyes have green flames dancing in them.")

			saynn("[say=tavi]What do you have in mind, dear~?[/say]")

		if (!isVirgin):
			addButton("Regrow hymen", "Make Tavi become a virgin again", "regrow_hymen")
		else:
			addDisabledButton("Regrow hymen", "Tavi is a virgin already. Go make her a real woman first!")
		addButton("Grow dick", "Ask Tavi to grow something extra between her legs", "grow_penis")
		addButton("Leave", "You chained your mind", "endthescene")
	if(state == "regrow_hymen"):
		saynn("Taking Tavi's virginity was quite hot.. So why not do it more? You ask Tavi to grow her torn hymen back.")

		saynn("[say=tavi]As you command~.[/say]")

		saynn("Tavi spreads her legs more and holds her pussy folds spread for you with her claws while doing a snap with her other paw.")

		saynn("Seconds later, her pussy starts glowing brightly.. Like it's burning. Tavi closes her eyes and moans softly as her body shivers slightly. At the same time, a thin layer of flesh begins to materialize exactly where her hymen is supposed to be.")

		saynn("And after about ten more seconds, the process finishes. Tavi bites her lip as she proudly presents you her pussy entrance that is sealed yet again.")

		saynn("[say=tavi]I hope I won't have it for long~.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "grow_penis"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You like magic tricks so you decide to ask Tavi to do her best one and grow something extra between her legs.")

		saynn("[say=tavi]Is that what you want, huh~?[/say]")

		saynn("Tavi brushes her paw over her female crotch, showing that there is nothing there. You nod.")

		saynn("[say=tavi]Well, turn away please. It's not gonna look pretty at first.[/say]")

		saynn("You're curious. But if she says so.. might as well comply. You turn around and wait for Tavi to do her magic.")

		saynn("After a few seconds, you hear a sigh and then a snap of her fingers.")

		saynn("[say=tavi]Argh..[/say]")

		saynn("Instantly, she starts grunting, growling and hissing. Whatever is happening, it must be painful for her.")

		saynn("[say=pc]Are you okay?[/say]")

		saynn("[say=tavi]They usually take years to develop, you know.. I'm fine.. Ah..[/say]")

		saynn("You hear Tavi collapsing behind your back. You gotta help her.")

		addButton("Turn around", "Look at Tavi", "grow_turn")
	if(state == "grow_turn"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="defeat", npcBodyState={naked=true, hard=true}})
		saynn("You turn back and see Tavi on the floor, panting heavily, her legs closed. You run up to her and help her to sit down.")

		saynn("[say=pc]Did it.. work?[/say]")

		saynn("[say=tavi]Ah.. See for yourself~.[/say]")

		saynn("Tavi opens her legs, revealing a great sight. In addition to the pussy that she has, there is also now something else.. A throbbing feline cock is hanging between Tavi's legs, complete with sheath, barbs and a pair of heavy balls.")

		saynn("[say=pc]Wow.[/say]")

		saynn("It's not a horsecock.. But some dreams are bound to stay just that.. dreams.")

		addButton("Help Tavi up", "Help Tavi to get up", "cock_helpup")
	if(state == "cock_helpup"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true, hard=true}})
		saynn("You help Tavi to get up and quickly swipe any dirt and dust from her butt and thighs. All the while her new cock is still throbbing and twitching, balls tensing up as a drop of precum slides down its barbed shaft.")

		saynn("[say=tavi]Thanks.. So..[/say]")

		saynn("[say=pc]Will you have it forever now?[/say]")

		saynn("Tavi sighs and shakes her head, her eyes gazing at your cute {pc.masc} forms.. a little more than usual.")

		saynn("[say=tavi]It will go away after I cum. And I really-really wanna cum~.[/say]")

		saynn("Hm. Seems like denying her now would be a bad idea. Or a great one, depending on how you look at it. Tavi walks up to you, her new cock is sensitive so she moans while playfully humping you.")

		saynn("[say=tavi]Wanna have some fun, dear~?[/say]")

		addButton("Leave", "You changed your mind", "cock_leave")
	if(state == "cock_leave"):
		playAnimation(StageScene.Choking, "idle", {pc="tavi", npc="pc", bodyState={naked=true,hard=true}})
		saynn("[say=pc]Eh. I changed my mind.[/say]")

		saynn("You take a step back, avoiding Tavi's humping. She looks confused.")

		saynn("[say=tavi]Huh? What do you mean?[/say]")

		saynn("[say=pc]You will cum some other time. For now you will be keeping the cock.[/say]")

		saynn("You turn away and start walking away. But before you can finish making the first step, you suddenly feel a clawed hand on your neck, above your collar, squeezing your throat firmly.")

		saynn("[say=tavi]I thought I made myself clear.[/say]")

		saynn("Tavi's voice gets dark undertones that echo through the whole cell.")

		saynn("[say=tavi]I want to cum. This urge is bigger than anything I ever felt. You understand me?[/say]")

		saynn("She is strong.. keeping you on your toes with just her paw. But you still try to keep yourself calm.")

		saynn("[say=pc]Put.. put me down, Tavi. You need some restrain..[/say]")

		saynn("Tavi is.. not happy. She leans in closer to your face, her fangs out, her burning eyes piercing you.")

		saynn("[say=tavi]No-no-no.. You don't get to do this to me.. owner. If you're not willing to spread your legs.. I will just do it myself.[/say]")

		saynn("Shit, riling up and then denying her probably wasn't the smartest idea. But at the same time.. it wasn't a bad idea..")

		addButton("Continue", "See what happens next", "cock_leave_pick")
	if(state == "cock_leave_vag"):
		playAnimation(StageScene.Choking, "tease", {pc="tavi", npc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		if (GM.pc.isFullyNaked()):
			saynn("Angry Tavi snaps her fingers which makes her green spots blind you for a second. And while you are confused, the feline grabs one of your legs and raises it high while already aligning her barbed cock with one of your holes.. your {pc.pussyStretch} pussy..")

		else:
			saynn("Angry Tavi snaps her fingers which makes your clothes dissolve. But before you can react to that, the feline grabs one of your legs and raises it high while already aligning her barbed cock with one of your holes.. your {pc.pussyStretch} pussy..")

		saynn("[say=pc]H-hey.. h-h..[/say]")

		saynn("Tavi puts on a mean face while putting more pressure on your neck.. stealing your ability to speak. All you can do is make silent protests.. But Tavi's deep glaring makes you uneasy to the core, preventing even that.")

		saynn("[say=tavi]You are not walking away untouched.. slut..[/say]")

		saynn("Her claws are digging into your skin.. While her rock-hard cock is rubbing between your legs.")

		addButton("Continue", "See what happens to you next", "cock_leave_vag_fuck")
	if(state == "cock_leave_vag_fuck"):
		playAnimation(StageScene.Choking, "sex", {pc="tavi", npc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Tavi doesn't take her chances with you anymore. She quickly guides her new dick down your pussy slit and, with one rough motion, rams her barbed shaft down your dry love tunnel, scratching at its walls in the process.")

		saynn("[say=tavi]Ngh-h.. Much better.[/say]")

		saynn("Tavi closes her eyes for a second, enjoying your inner walls getting tighter around her sensitive cock. Occasionally her paw steals your breath completely.. making you clench. And Tavi feels that.. she looks you in the eyes as she starts fucking you raw, pulling herself back before ramming her dick deep inside, leaving more little cuts on your walls.")

		saynn("[say=tavi]Clench more, bitch.. Or you will be bleeding from your neck too.[/say]")

		saynn("Her voice is mean and dry, her mind seemingly corrupted by the desire. You would try to call to her senses.. but all you can do is be her unwilling fucktoy"+str(". Your cock is hard but only because your body is being stimulated" if GM.pc.hasReachablePenis() else "")+". What can you do..")

		addButton("Continue", "See what happens next", "cock_leave_vag_faster")
	if(state == "cock_leave_vag_faster"):
		playAnimation(StageScene.Choking, "fast", {pc="tavi", npc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Tavi picks up the pace, her paw getting tighter and tighter around your neck, choking you while also fucking. Her claws and barbs are painful, leaving lots of marks on your throat and pussy.. But every spike of pain indeed only makes your muscles involuntary tense up, causing your slit to clench around her.")

		saynn("[say=tavi]Ngh.. Fuck yeah.. Stupid cunt..[/say]")

		saynn("Your eyes are full of fear.. while hers show lust. Air struggles to get to your brain.. meaning you're getting weaker every second. By this point you're not sure if Tavi will even leave you alive.. Your best bet is making her cum faster than you blacking out..")

		saynn("You can feel her feline cock throbbing inside you already.. It's barbs getting even more stiff. All the while her face is showing evil pleasure. Your vision gets darker and darker.. while Tavi just keeps fucking you..")

		saynn("[say=tavi]Try walking away now, whore..[/say]")

		saynn("[say=pc]Hh-h.. kh-h..[/say]")

		saynn("[say=tavi]Shut up and receive my load.[/say]")

		addButton("Continue", "See what happens next", "cock_leave_vag_cum")
	if(state == "cock_leave_vag_cum"):
		playAnimation(StageScene.Choking, "inside", {pc="tavi", npc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And so, Tavi rams her cock deep inside you, breaking into your womb and scratching at its walls as her length starts throbbing hard.")

		saynn("[say=tavi]Enjoy the kittens..[/say]")

		saynn("You can only gasp silently as Tavi's cock starts shooting cum directly into your babymaker. Strings of thick virile seed painting your insides white while also stuffing you to the brim. She grunts and shivers while holding your throat tightly, her claws drawing some blood out of your neck.")

		if (GM.pc.isWearingChastityCage()):
			saynn("There is so much pressure behind your chastity cage.. That your locked cock also explodes with waves after waves of your {pc.cum}, all of it wasted.")

		elif (GM.pc.hasReachablePenis()):
			saynn("There is so much pressure inside your own cock.. that it also explodes with waves after waves of your {pc.cum}, all of it wasted.")

		saynn("You're not even sure if you are orgasming or not. Corners of your vision are extremely dark.. but what you see.. is all rainbow-y and flashy, changing colors with various patterns. You feel high.. about to black out..")

		saynn("After breeding your properly, Tavi yanks her cock with zero consideration, her barbs cutting through your sensitive flesh, leaving even more painful cuts.")

		saynn("[say=tavi]That felt.. great.. So fucking great..[/say]")

		saynn("She blinks.. and the fire in the eyes goes away. Tavi looks at you.. and gasps as she releases her grip.")

		saynn("[say=tavi]Oh fuck.[/say]")

		saynn("You collapse. Even though your brain starts receiving oxygen, the impact is enough to knock you out..")

		addButton("Nothingness", "See what might happen next..", "leave_aftercare")
	if(state == "leave_aftercare"):
		playAnimation(StageScene.Cuddling, "idle", {npc="pc", pc="tavi", bodyState={naked=true}})
		saynn("Everything was dark for some time.. Was it a few seconds? Or years? Who knows..")

		saynn("The first thing you feel is.. headache. Everything hurts. You open your eyes and realize that Tavi is embracing you, her tongue licking the wounds that she left on your neck.")

		saynn("[say=pc]Ah..[/say]")

		saynn("[say=tavi]Oh, you're alive. Sorry that this happened..[/say]")

		saynn("You rub your head. You realize that Tavi's seed is still.. inside you. Which means that this definitely wasn't a dream.")

		saynn("[say=pc]You gave me all the warnings, it's okay.[/say]")

		saynn("[say=tavi]Yeah, well, still. I don't know what I would do without my owner.[/say]")

		saynn("[say=pc]We'd meet in hell eventually, wouldn't we?[/say]")

		saynn("She chuckles and nuzzles your cheek.")

		saynn("[say=tavi]Fucking you.. felt great by the way. I almost don't regret it. Sorry about the barbs, you might wanna see a doctor.[/say]")

		saynn("[say=pc]Can't you lick there too?[/say]")

		saynn("She pouts and bites your neck softly.")

		saynn("[say=pc]Ow. I get it, I get it.[/say]")

		saynn("Tavi smiles and hugs you tightly. Good to know that she can still be soft. You cuddle with her for a while longer. Her dick seems to be gone though.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "cock_leave_anal"):
		playAnimation(StageScene.Choking, "tease", {pc="tavi", npc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true}})
		if (GM.pc.isFullyNaked()):
			saynn("Angry Tavi snaps her fingers which makes her green spots blind you for a second. And while you are confused, the feline grabs one of your legs and raises it high while already aligning her barbed cock with your fuckhole.. your {pc.anusStretch} anus..")

		else:
			saynn("Angry Tavi snaps her fingers which makes your clothes dissolve. But before you can react to that, the feline grabs one of your legs and raises it high while already aligning her barbed cock with your fuckhole.. your {pc.anusStretch} anus..")

		saynn("[say=pc]H-hey.. h-h..[/say]")

		saynn("Tavi puts on a mean face while putting more pressure on your neck.. stealing your ability to speak. All you can do is make silent protests.. But Tavi's deep glaring makes you uneasy to the core, preventing even that.")

		saynn("[say=tavi]You are not walking away untouched.. slut..[/say]")

		saynn("Her claws are digging into your skin.. While her rock-hard cock is rubbing between your legs.")

		addButton("Continue", "See what happens to you next", "cock_leave_anal_fuck")
	if(state == "cock_leave_anal_fuck"):
		playAnimation(StageScene.Choking, "sex", {pc="tavi", npc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Tavi doesn't take her chances with you anymore. She quickly guides her new dick down your ass and, with one rough motion, rams her barbed shaft down your dry love tunnel, scratching at its walls in the process.")

		saynn("[say=tavi]Ngh-h.. Much better.[/say]")

		saynn("Tavi closes her eyes for a second, enjoying your inner walls getting tighter around her sensitive cock. Occasionally her paw steals your breath completely.. making you clench. And Tavi feels that.. she looks you in the eyes as she starts fucking you raw, pulling herself back before ramming her dick deep inside, leaving more little cuts on your walls.")

		saynn("[say=tavi]Clench more, bitch.. Or you will be bleeding from your neck too.[/say]")

		saynn("Her voice is mean and dry, her mind seemingly corrupted by the desire. You would try to call to her senses.. but all you can do is be her unwilling fucktoy"+str(". Your cock is hard but only because your prostate is being directly stimulated" if GM.pc.hasReachablePenis() else "")+". What can you do..")

		addButton("Continue", "See what happens next", "cock_leave_anal_faster")
	if(state == "cock_leave_anal_faster"):
		playAnimation(StageScene.Choking, "fast", {pc="tavi", npc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Tavi picks up the pace, her paw getting tighter and tighter around your neck, choking you while also fucking. Her claws and barbs are painful, leaving lots of marks on your throat and ass.. But every spike of pain indeed only makes your muscles involuntary tense up, causing your anal ring to clench around her.")

		saynn("[say=tavi]Ngh.. Fuck yeah.. Stupid cunt..[/say]")

		saynn("Your eyes are full of fear.. while hers show lust. Air struggles to get to your brain.. meaning you're getting weaker every second. By this point you're not sure if Tavi will even leave you alive.. Your best bet is making her cum faster than you blacking out..")

		saynn("You can feel her feline cock throbbing inside you already.. It's barbs getting even more stiff. All the while her face is showing evil pleasure. Your vision gets darker and darker.. while Tavi just keeps fucking you..")

		saynn("[say=tavi]Try walking away now, whore..[/say]")

		saynn("[say=pc]Hh-h.. kh-h..[/say]")

		saynn("[say=tavi]Shut up and receive my load.[/say]")

		addButton("Continue", "See what happens next", "cock_leave_anal_cum")
	if(state == "cock_leave_anal_cum"):
		playAnimation(StageScene.Choking, "inside", {pc="tavi", npc="pc", bodyState={naked=true,hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And so, Tavi rams her cock deep inside you, scratching at your guts as her length starts throbbing hard.")

		saynn("[say=tavi]Enjoy..[/say]")

		saynn("You can only gasp silently as Tavi's cock starts shooting cum down your nethers. Strings of thick virile seed painting your insides white while also stuffing you to the brim. She grunts and shivers while holding your throat tightly, her claws drawing some blood out of your neck.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your prostate got destroyed. There is so much pressure behind your chastity cage.. That your locked cock also explodes with waves after waves of your {pc.cum}, all of it wasted.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your prostate got destroyed. There is so much pressure inside your own cock.. that it also explodes with waves after waves of your {pc.cum}, all of it wasted.")

		saynn("You're not even sure if you are orgasming or not. Corners of your vision are extremely dark.. but what you see.. is all rainbow-y and flashy, changing colors with various patterns. You feel high.. about to black out..")

		saynn("After breeding your properly, Tavi yanks her cock with zero consideration, her barbs cutting through your sensitive flesh, leaving even more painful cuts.")

		saynn("[say=tavi]That felt.. great.. So fucking great..[/say]")

		saynn("She blinks.. and the fire in the eyes goes away. Tavi looks at you.. and gasps as she releases her grip.")

		saynn("[say=tavi]Oh fuck.[/say]")

		saynn("You collapse. Even though your brain starts receiving oxygen, the impact is enough to knock you out..")

		addButton("Nothingness", "See what might happen next..", "leave_aftercare")
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

	if(_action == "regrow_hymen"):
		processTime(3*60)
		setFlag("TaviModule.Ch6TaviRegrewHymen", true)
		setFlag("TaviModule.TaviIsNotVirgin", false)

	if(_action == "grow_turn"):
		processTime(4*60)
		
		setFlag("TaviModule.Ch6TaviShouldHaveCock", true)
		getCharacter("tavi").updateBodyparts()

	if(_action == "cock_helpup"):
		processTime(5*60)

	if(_action == "cock_leave"):
		processTime(3*60)

	if(_action == "cock_leave_pick"):
		if(GM.pc.hasReachableVagina()):
			setState("cock_leave_vag")
		else:
			setState("cock_leave_anal")
		
		return

	if(_action == "cock_leave_vag_fuck"):
		processTime(5*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Vagina, "tavi")

	if(_action == "cock_leave_vag_faster"):
		processTime(5*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Vagina, "tavi")

	if(_action == "cock_leave_vag_cum"):
		processTime(10*60)
		GM.pc.gotVaginaFuckedBy("tavi")
		GM.pc.cummedInVaginaBy("tavi")
		GM.pc.orgasmFrom("tavi")
		GM.pc.doPainfullyStretchHole(BodypartSlot.Vagina, "tavi")

	if(_action == "leave_aftercare"):
		processTime(20*60)
		setFlag("TaviModule.Ch6TaviShouldHaveCock", false)
		getCharacter("tavi").updateBodyparts()

	if(_action == "cock_leave_anal_fuck"):
		processTime(5*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Anus, "tavi")

	if(_action == "cock_leave_anal_faster"):
		processTime(5*60)
		GM.pc.doPainfullyStretchHole(BodypartSlot.Anus, "tavi")

	if(_action == "cock_leave_anal_cum"):
		processTime(10*60)
		GM.pc.gotAnusFuckedBy("tavi")
		GM.pc.cummedInAnusBy("tavi")
		GM.pc.orgasmFrom("tavi")
		GM.pc.doPainfullyStretchHole(BodypartSlot.Anus, "tavi")

	setState(_action)

func saveData():
	var data = .saveData()

	data["isCorrupt"] = isCorrupt
	data["isPure"] = isPure
	data["isNormal"] = isNormal
	data["isVirgin"] = isVirgin
	data["firstTime"] = firstTime

	return data

func loadData(data):
	.loadData(data)

	isCorrupt = SAVE.loadVar(data, "isCorrupt", false)
	isPure = SAVE.loadVar(data, "isPure", false)
	isNormal = SAVE.loadVar(data, "isNormal", false)
	isVirgin = SAVE.loadVar(data, "isVirgin", false)
	firstTime = SAVE.loadVar(data, "firstTime", false)
