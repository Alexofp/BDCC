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

		addButton("Submit to", "Let Tavi fuck you", "submit_pick")
		addButtonWithChecks("Chastity+Anal", "Force a chastity cage on Tavi and make her cum from anal", "chastity_force", [], [ButtonChecks.HasChastityCageInInventory])
		addButton("Leave", "(Rough sex) You changed your mind", "cock_leave")
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
	if(state == "chastity_force"):
		playAnimation(StageScene.Hug, "kiss", {npc="tavi", npcBodyState={naked=true, hard=true}})
		saynn("Tavi is so overconfident.. that it makes you want to teach her a lesson. Not the most cruel one.. this one might be a fun one actually. But you need to trick Tavi for it.")

		saynn("With a sly grin, you embrace Tavi before landing a little kiss on her lips. Short enough she can't siphon much of your energy but still getting a taste of it.")

		saynn("[say=pc]Sure. I know a good way of satisfying your ache.[/say]")

		saynn("Her burning eyes get filled with curiosity.")

		saynn("[say=tavi]Do you, owner~? And what would that be~?[/say]")

		saynn("[say=pc]Let's start with this.[/say]")

		saynn("Your hands trace over her curves. Being.. whatever she is.. certainly made her body more sexy and alluring.")

		saynn("She leans in for another kiss and you let her. Bold kitty sneaks her long tongue into your mouth and proceeds to boss around in yours, exchanging saliva and.. making you feel weaker. Tavi seems to be entirely focussed on that, allowing you to produce a little metal item.. a cage.. and start locking it around her new cock.")

		saynn("First part of the cage goes on easily. It looks like a cock ring so you just slide it onto her shaft and then carefully pull her balls through it.")

		saynn("But the top part certainly poses a challenge. You still continue the deep kiss with Tavi while your hand presses that metal piece against the tip of her cock and then starts putting pressure on it, fighting her erection.")

		addButton("Continue", "See what happens next", "chastity_force_lock")
	if(state == "chastity_force_lock"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true, caged=true}})
		saynn("..click.")

		saynn("The two pieces finally connect with each other, locking the girl's member under it. There is so little space that Tavi's cock is forced to stay in its sheath.")

		saynn("[say=tavi]Um.. Hey![/say]")

		saynn("You take a step back and let Tavi realize what just happened. She grabs at her crotch and already tries to take it off with force.. but the metal doesn't budge.")

		saynn("[say=tavi]Is this a joke? Take it off..[/say]")

		saynn("[say=pc]It's a little surprise for you, Tavi.[/say]")

		saynn("[say=tavi]Why.. You don't understand how it feels..[/say]")

		saynn("The poor cock is throbbing in its contains. Tavi can poke it with her long claws.. but that's about it.. She can't even stroke it, the thing sits too tightly.")

		saynn("[say=pc]I want to see just how desperate you can become.[/say]")

		saynn("Her breath quickens as she realizes that this wasn't a mistake. She makes a few more attempts at freeing her cock.. but all of them fail.")

		saynn("[say=tavi]I want to cu-um..[/say]")

		saynn("That is.. a start. You walk up to the feline again and scritch her under the chin, making her raise it.")

		saynn("[say=pc]Try asking a little better. Only I get to choose when.. if.. you're gonna get your release.[/say]")

		saynn("Tavi huffs. It looks like she is suffering from heat again. But this heat is much stronger.")

		saynn("[say=tavi]Please?..[/say]")

		saynn("You lean into Tavi's ear.")

		saynn("[say=pc]You can do better than that..[/say]")

		saynn("Her burning eyes.. now looking subby and needy.")

		saynn("[say=tavi]Alright.. I will do anything.. Just unlock it, please..[/say]")

		saynn("[say=pc]You will do anything either way, pet. That cage is staying until you orgasm.[/say]")

		saynn("She looks down at her locked twitching cock.. and sighs.")

		saynn("[say=tavi]Fuck me then.. Make me cum.. Please.. Anything..[/say]")

		saynn("Now we're talking. Tavi seems to be ready. She still has her pussy.. but you feel like it would be more fitting to focus on her other hole today.. Since Tavi doesn't usually have a prostate.")

		saynn("What do you wanna do?")

		addButton("Offer a dildo", "Make Tavi ride a giant dildo", "chastity_dildo")
		addButtonWithChecks("Fuck her", "Fuck Tavi's ass", "chastity_anal", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Strapon her", "Fuck Tavi's ass with a strapon", "chastity_strapon_pick", [], [ButtonChecks.HasStraponAndCanWear])
	if(state == "chastity_dildo"):
		playAnimation(StageScene.HorsecockDildoSex, "tease", {pc="tavi", bodyState={naked=true, caged=true}})
		saynn("You grab a giant dildo and put it in the middle of the cell as well as a tube of lube. After that, you just cross your arms and stand aside.")

		saynn("[say=tavi]Um..[/say]")

		saynn("You watch her confused face and nod with a smile on your face.")

		saynn("[say=tavi]Better than nothing..[/say]")

		saynn("It's better and bigger, she is right. Kinda funny to see Tavi positioning herself above the flared tip of the toy. She has grown herself a cock.. but still can't use it.")

		saynn("When Tavi tries to align her pussy with it, you shake your head and hand her the lube.")

		saynn("[say=tavi]Oh, c'mon..[/say]")

		saynn("[say=pc]If you'd rather not cum today then..[/say]")

		saynn("[say=tavi]Fine-e..[/say]")

		saynn("She grabs the lube and starts applying it to her tight-looking pucker, spreading the cold soothing substance around her anal ring, causing it to clench visibly.")

		saynn("After that, she positions her butt above the toy and proceeds to try to take it. Her tailhole stretches a little.. but taking that fat flared tip will require way more effort.")

		saynn("[say=tavi]Here it goes..[/say]")

		addButton("Continue", "See what happens next", "chastity_dildo_ride")
	if(state == "chastity_dildo_ride"):
		playAnimation(StageScene.HorsecockDildoSex, "sex", {pc="tavi", bodyState={naked=true, caged=true}})
		saynn("Tavi pretty much sits on the flared tip, putting the weight of her whole butt on it.. until her ring suddenly stretches wide and lets the toy penetrate it.")

		saynn("[say=tavi]AHh-h!..[/say]")

		saynn("She takes at least half of the toy down her asshole in one go, the flared tip probably finding the girl's pleasure spot as a string of precum escapes her cage.")

		saynn("[say=tavi]It's in..[/say]")

		saynn("The not-so-cocky feline gives you a quick look, her lips spread as she is panting. You just nod.")

		saynn("And, Tavi starts to ride the silicon shaft with her ass, pulling herself up before bringing her butt down deep onto the length. Her legs are shaking already.. but she keeps doing it.")

		saynn("[say=tavi]You could have just let me fuck you..[/say]")

		saynn("You walk up to the feline and pat her as she keeps fucking herself with the toy, her locked up dick bobbing up and down, leaking more and more precum onto the floor.")

		saynn("[say=pc]But this is way more fun~. Doesn't it feel good?[/say]")

		saynn("[say=tavi]It does.. It fucking does..[/say]")

		addButton("Continue", "See what Tavi will do to her ass next", "chastity_dildo_fast")
	if(state == "chastity_dildo_fast"):
		playAnimation(StageScene.HorsecockDildoSex, "fast", {pc="tavi", bodyState={naked=true, caged=true}})
		saynn("Tavi rides the toy faster and harder, pretty much destroying her tight pucker. But she loves it, lots of cute moans escape from her, each thrust putting so much pressure on her prostate that her burning eyes start to roll up, her tongue out and drooling. The poor cock behind her cage keeps twitching and leaking.")

		saynn("[say=tavi]I wanna cum-m.. w-wanna.. p-please-please.. I wann-n-naa..[/say]")

		saynn("[say=pc]You can cum, Tavi.[/say]")

		saynn("She deserves your permission for not disobeying your orders. And she runs away with it, hilting the toy on each motion, letting it go deep inside her guts at this point.")

		saynn("And soon enough, a passionate noise escapes her.")

		saynn("[say=tavi]Yes-s-s!..[/say]")

		saynn("Her legs start shaking wildly as her dick starts shooting weak strings of thick virile cum onto the floor. Her barbed shaft didn't even manage to leave its sheath again, just orgasming while being completely soft.")

		saynn("[say=tavi]So fucking good!..[/say]")

		saynn("What a buttslut, Tavi is shivering and panting heavily long after her balls get drained of all of its cum.")

		addButton("Continue", "See what happens next", "chastity_dildo_nodick")
	if(state == "chastity_dildo_nodick"):
		playAnimation(StageScene.HorsecockDildoSex, "inside", {pc="tavi", bodyState={naked=true}})
		saynn("And soon enough after that, something starts to change about Tavi. Her cock is shrinking more and more.. until the chastity cage just loses any support and hits the floor with a loud ding.")

		saynn("You were right to turn around when Tavi asked you to before, the process is quite.. weird. But soon enough, her dick dissappears without a trace, leaving just an empty fluffy crotch behind with only her girly bits left.")

		saynn("[say=tavi]Nya..[/say]")

		saynn("[say=pc]That scratched an itch, huh?[/say]")

		saynn("[say=tavi]Yeah..[/say]")

		saynn("You give Tavi more headpats. Solving that special kind of heat wasn't that hard after all.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "chastity_anal"):
		playAnimation(StageScene.SexFreeStanding, "sex", {npc="tavi", pc="pc", npcBodyState={naked=true, caged=true}, bodyState={naked=true, hard=true}})
		saynn("And so you grab Tavi's arms and bring them behind her back, already aligning your {pc.penis} with her backdoor. Your pet produces a gasp of surprise as she feels your hard shaft prodding her tight anus.")

		saynn("[say=tavi]That's a wrong hole.. w-wrong.. AH!..[/say]")

		saynn("A single thrust and Tavi's tight anal ring gets stretched wide, allowing you to ram your length deep inside until your hips slap against her round butt. This motion has put her little pleasure bean under enough pressure for her locked dick to shoot a little string of transparent precum.")

		saynn("[say=pc]No it wasn't.[/say]")

		saynn("[say=tavi]F-fuck!..[/say]")

		saynn("You hold her arms wrenched behind her back as you start fucking her ass, each thrust pressing on her soft prostate more and more.. until Tavi starts dripping pre almost non-stop.")

		saynn("[say=tavi]Why does it feel so good.. Better than any anal that we did..[/say]")

		saynn("She starts moaning passionately, giving in to the pleasure that only people with dicks can experience. Her cock being locked behind the cage means she can focus on her ass instead. And focus she does, her inner walls clenching around your cock so well that you feel your own orgasm building up too..")

		saynn("[say=pc]Maybe because you're secretly a buttslut~?[/say]")

		saynn("[say=tavi]N-no..[/say]")

		addButton("Faster", "Fuck Tavi faster", "chastity_anal_faster")
	if(state == "chastity_anal_faster"):
		playAnimation(StageScene.SexFreeStanding, "fast", {npc="tavi", pc="pc", npcBodyState={naked=true, caged=true}, bodyState={naked=true, hard=true}})
		saynn("When Tavi starts to instinctively meet your cock with her own motions, you increase the onslaught on her butt, establishing a relentless rhythm with each thrust massaging Tavi's prostate until it starts to inflate and get harder, now having a walnut-like texture.")

		saynn("[say=tavi]Not so f-fast..[/say]")

		saynn("Why not? It's cute to see her caged up cock throb as it sways from her ass being pounded. Soon enough you understand why though.")

		saynn("[say=tavi]Nya-ah!..[/say]")

		saynn("Your cock pushed on her pleasure button so much that her cock suddenly began exploding with strings of her seed shooting through the little hole in the cage. All the while she is completely soft, her shaft itself is still hidden inside the sheath.")

		saynn("At the same time, her anus gets even more tight around you, inner walls kneading your cock, pulling it in. It feels so good that you start to grunt. There is no way you're pulling out now..")

		addButton("Cum inside", "Breed her ass", "chastity_anal_cum")
	if(state == "chastity_anal_cum"):
		playAnimation(StageScene.SexFreeStanding, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true, caged=true}, bodyState={naked=true, hard=true}})
		saynn("Instead of pulling out, you ram your dick deeper and just let Tavi push you over the edge.")

		saynn("You grunt more as your throbbing member stuffs that cat's ass full of your thick {pc.cum}, so much that some already starts leaking out.")

		saynn("[say=tavi]If that's how it's always gonna feel.. F-fine, I'm a buttslut..[/say]")

		saynn("The cell smells of sex.. You two stand together, your full length still inside Tavi. And then you hear a loud ding as the chastity cage hits the floor. Huh?")

		saynn("You realize that Tavi's dick is already gone so the cage just slipped off.")

		saynn("[say=pc]That was interesting.[/say]")

		saynn("After some time, you yank your dick out and watch Tavi's used asshole struggling to close up, pulsing and leaking your seed instead.")

		saynn("[say=tavi]Next time let me fuck you..[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "submit_vag"):
		playAnimation(StageScene.SexFullNelson, "tease", {pc="tavi", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (GM.pc.isFullyNaked()):
			saynn("The moment you nod, a low-pitched giggle can be heard from her before she suddenly grabs you and pretty much folds you in half, grabbing your legs under the knees and pinning them to your shoulders before reaching further and interlocking her fingers behind your neck, forcing you into this extremely vulnerable position where your "+str("fuckable holes" if GM.pc.hasReachableVagina() else "only fuckable hole")+" are on full display"+str(", just like your {pc.penis}" if GM.pc.hasReachablePenis() else "")+".")

		else:
			saynn("The moment you nod, Tavi snaps her fingers again, causing your clothes to dissolve too!")

			saynn("[say=pc]How did you..[/say]")

			saynn("A low-pitched giggle can be heard from her seconds before she suddenly grabs you and pretty much folds you in half, grabbing your legs under the knees and pinning them to your shoulders before reaching further and interlocking her fingers behind your neck, forcing you into this extremely vulnerable position where your "+str("fuckable holes" if GM.pc.hasReachableVagina() else "only fuckable hole")+" are on full display"+str(", just like your {pc.penis}" if GM.pc.hasReachablePenis() else "")+".")

		saynn("Holding you like means.. that Tavi is.. strong.. way stronger than she usually is.")

		saynn("You have two holes that she can fuck.. so she decides to start aligning her barbed dick with your {pc.pussyStretch} pussy. She whispers into your ear while you already feel the tip of her cock prodding your slit and spreading her precum along your folds.")

		saynn("[say=tavi]I know you want this~. So I will be gentle.[/say]")

		addButton("Continue", "See what happens next", "submit_vag_fuck")
	if(state == "submit_vag_fuck"):
		playAnimation(StageScene.SexFullNelson, "sex", {pc="tavi", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And so she carefully lowers you onto her new juicy cock, her barbed tip putting some pressure on your folds.. until they spread for her, allowing Tavi to slide inside you, stealing your breath anyway due to her sheer size.")

		saynn("[say=pc]Hh-h..[/say]")

		saynn("[say=tavi]So wet and needy~. I thought I'm the slut here~.[/say]")

		saynn("More little gasps escape from you as Tavi begins to move her hips while holding you still in the air, her arms trapping you into this submissive position of a fucktoy. She has a feline member between her legs but her barbs are still soft, just gently combing your slick inner walls.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Even though she is fucking your pussy, your caged dick up still tries to get hard from the indirect stimulation and your aroused state. So cute to see it flapping around as she rails you.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Even though she is fucking your pussy, your dick still gets hard and starts leaking precum from the indirect stimulation and your aroused state. So cute to see it flapping around as she rails you.")

		saynn("Little growls escape from the feline behind you as she gradually increases the pace, pounding your pussy harder and even reaching your cervix, the inner barricade that defends your womb.")

		saynn("[say=tavi]Do you like kittens~? I thought I didn't.. But breeding sluts is so fun~.[/say]")

		saynn("That green barbed dick feels so good.. you just moan back, surrendering to the ecstasy of the moment. Your climax approaches like an unstoppable wave, your body shivering with anticipation.. You're about to cum..")

		addButton("Continue", "See how you will orgasm", "submit_vag_cum")
	if(state == "submit_vag_cum"):
		playAnimation(StageScene.SexFullNelson, "inside", {pc="tavi", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And just before you do, Tavi gets a better grip on your limbs before doing a last powerful thrust, shoving her cock so deep, the barbed tip breaks into your womb and begins scratching at its wall, trying to cause a reaction.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your poor locked up cock starts wasting its load, shooting little strings of seed through the hole in the chastity cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your {pc.penis} is twitching while wasting its load, shooting strings of seed, all of them landing on the floor. Someone will have to clean them up with their tongue..")

		saynn("Your cries of pleasure fill the air, most of your muscles tensing up, including your pussy ones, squeezing Tavi's cock so much that she follows soon after.")

		saynn("[say=tavi]Ngh-h~[/say]")

		saynn("Her cock starts throbbing inside you, each throb accompanied by her virile seed filling your womb. So much of it that your belly receives a cute bump.")

		saynn("Your tongue out as you're drooling and panting. Your body is trembling long past your peak. And Tavi is purring into your ear.")

		saynn("[say=tavi]What a good {pc.boy}..[/say]")

		addButton("Continue", "See what happens next", "submit_after")
	if(state == "submit_after"):
		playAnimation(StageScene.SexFullNelson, "tease", {pc="tavi", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You almost don't feel Tavi pulling out.. because she doesn't. Her cock just kinda deflates.. until it poof completely, leaving just the clean fluffy crotch with her normal girly bits.")

		saynn("[say=tavi]Well. Thank you for being my fucktoy, owner~.[/say]")

		saynn("[say=pc]You're.. w-welcome..[/say]")

		saynn("Tavi gets weaker and weaker as her green spots on her fur stop glowing so brightly. She carefully puts your shaky legs down on the floor and just supports you from falling.")

		addButton("Continue", "That was nice", "endthescene")
	if(state == "submit_anal"):
		playAnimation(StageScene.SexFullNelson, "tease", {pc="tavi", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (GM.pc.isFullyNaked()):
			saynn("The moment you nod, a low-pitched giggle can be heard from her before she suddenly grabs you and pretty much folds you in half, grabbing your legs under the knees and pinning them to your shoulders before reaching further and interlocking her fingers behind your neck, forcing you into this extremely vulnerable position where your "+str("fuckable holes" if GM.pc.hasReachableVagina() else "only fuckable hole")+" are on full display"+str(", just like your {pc.penis}" if GM.pc.hasReachablePenis() else "")+".")

		else:
			saynn("The moment you nod, Tavi snaps her fingers again, causing your clothes to dissolve too!")

			saynn("[say=pc]How did you..[/say]")

			saynn("A low-pitched giggle can be heard from her seconds before she suddenly grabs you and pretty much folds you in half, grabbing your legs under the knees and pinning them to your shoulders before reaching further and interlocking her fingers behind your neck, forcing you into this extremely vulnerable position where your "+str("fuckable holes" if GM.pc.hasReachableVagina() else "only fuckable hole")+" are on full display"+str(", just like your {pc.penis}" if GM.pc.hasReachablePenis() else "")+".")

		saynn("Holding you like means.. that Tavi is.. strong.. way stronger than she usually is.")

		saynn("Both of her arms are busy holding you.. so she just shifts your whole frame so that her barbed dick gets aligned with your {pc.anusStretch} tailhole. She whispers into your ear while you already feel the tip of her cock prodding your anal ring and spreading her precum around it.")

		if (GM.pc.hasReachableVagina()):
			saynn("[say=tavi]I know you have a pussy~. I want this one. I will be gentle~.[/say]")

		else:
			saynn("[say=tavi]I know you want this~. So I will be gentle.[/say]")

		addButton("Continue", "See what happens next", "submit_anal_fuck")
	if(state == "submit_anal_fuck"):
		playAnimation(StageScene.SexFullNelson, "sex", {pc="tavi", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And so she carefully lowers you onto her new juicy cock, her barbed tip putting some pressure on your anal ring.. until it stretches for her, allowing Tavi to slide inside you, stealing your breath anyway due to her sheer size.")

		saynn("[say=pc]Hh-h..[/say]")

		saynn("[say=tavi]So needy~. I thought I'm the slut here~.[/say]")

		saynn("More little gasps escape from you as Tavi begins to move her hips while holding you still in the air, her arms trapping you into this submissive position of a fucktoy. She has a feline member between her legs but her barbs are still soft, just gently combing your slick inner walls.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your caged dick up desperately tries to get hard from your prostate being stimulated and your aroused state. So cute to see it flapping around as she rails you.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your dick gets hard and starts leaking precum from your prostate being stimulated and your aroused state. So cute to see it flapping around as she rails you.")

		saynn("Little growls escape from the feline behind you as she gradually increases the pace, pounding your ass harder and reaching deeper and deeper, stretching your anus walls wide.")

		saynn("[say=tavi]I thought I wouldn't like it.. But breeding sluts is so fun~.[/say]")

		saynn("That green barbed dick feels so good.. you just moan back, surrendering to the ecstasy of the moment. Your climax approaches like an unstoppable wave, your body shivering with anticipation.. You're about to cum..")

		addButton("Continue", "See how you will orgasm", "submit_anal_cum")
	if(state == "submit_anal_cum"):
		playAnimation(StageScene.SexFullNelson, "inside", {pc="tavi", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And just before you do, Tavi gets a better grip on your limbs before doing a last powerful thrust, shoving her cock so deep, the barbed tip begins scratching at your guts.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your prostate gets absolutely destroyed, your poor locked up cock starts wasting its load, shooting little strings of seed through the hole in the chastity cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your prostate gets absolutely destroyed, your {pc.penis} is twitching while wasting its load, shooting strings of seed, all of them landing on the floor. Someone will have to clean them up with their tongue..")

		saynn("Your cries of pleasure fill the air, most of your muscles tensing up, including your anus ones, squeezing Tavi's cock so much that she follows soon after.")

		saynn("[say=tavi]Ngh-h~[/say]")

		saynn("Her cock starts throbbing inside you, each throb accompanied by her virile seed filling your ass. So much of it that your belly receives a cute bump.")

		saynn("Your tongue out as you're drooling and panting. Your body is trembling long past your peak. And Tavi is purring into your ear.")

		saynn("[say=tavi]What a good {pc.boy}..[/say]")

		addButton("Continue", "See what happens next", "submit_after")
	if(state == "chastity_strapon_pick"):
		saynn("Pick which strapon you want to use to fuck Tavi with.")

		addStraponButtons()
		if (false):
			addButton("Nope", "You shouldn't see this", "chastity_strapon_anal")
	if(state == "chastity_strapon_anal"):
		playAnimation(StageScene.SexFreeStanding, "sex", {npc="tavi", pc="pc", npcBodyState={naked=true, caged=true}, bodyState={naked=true, hard=true}})
		saynn("You quickly secure one of your strapons around your waist and then grab Tavi's arms before bringing them behind her back, already aligning your new rubber cock with her backdoor. Your pet produces a gasp of surprise as she feels a hard cold shaft prodding her tight anus.")

		saynn("[say=tavi]That's a wrong hole.. w-wrong.. AH!..[/say]")

		saynn("A single thrust and Tavi's tight anal ring gets stretched wide, allowing you to ram your length deep inside until your hips slap against her round butt. This motion has put her little pleasure bean under enough pressure for her locked dick to shoot a little string of transparent precum.")

		saynn("[say=pc]No it wasn't.[/say]")

		saynn("[say=tavi]F-fuck!..[/say]")

		saynn("You hold her arms wrenched behind her back as you start fucking her ass, each thrust pressing on her soft prostate more and more.. until Tavi starts dripping pre almost non-stop.")

		saynn("[say=tavi]Why does it feel so good.. Better than any anal..[/say]")

		saynn("She starts moaning passionately, giving in to the pleasure that only people with dicks can experience. Her cock being locked behind the cage means she can focus on her ass instead. And focus she does, her inner walls clenching around your toy so well that it makes you eager to break her resistance completely.")

		saynn("[say=pc]Maybe because you're secretly a buttslut~?[/say]")

		saynn("[say=tavi]N-no..[/say]")

		addButton("Faster", "Fuck Tavi faster", "chastity_strapon_anal_faster")
	if(state == "chastity_strapon_anal_faster"):
		playAnimation(StageScene.SexFreeStanding, "fast", {npc="tavi", pc="pc", npcBodyState={naked=true, caged=true}, bodyState={naked=true, hard=true}})
		saynn("When Tavi starts to instinctively meet your strapon with her own motions, you increase the onslaught on her butt, establishing a relentless rhythm with each thrust massaging Tavi's prostate until it starts to inflate and get harder, now having a walnut-like texture.")

		saynn("[say=tavi]Not so f-fast..[/say]")

		saynn("Why not? It's cute to see her caged up cock throb as it sways from her ass being pounded. Soon enough you understand why though.")

		saynn("[say=tavi]Nya-ah!..[/say]")

		saynn("Your toy pushed on her pleasure button so much that her cock suddenly began exploding with strings of her seed shooting through the little hole in the cage. All the while she is completely soft, her shaft itself is still hidden inside the sheath.")

		saynn("At the same time, her anus gets even more tight around you, inner walls kneading your toy, pulling it in. But one time was probably enough.")

		addButton("Shove inside", "Breed her ass", "chastity_strapon_anal_cum")
	if(state == "chastity_strapon_anal_cum"):
		playAnimation(StageScene.SexFreeStanding, "inside", {npc="tavi", pc="pc", npcBodyState={naked=true, caged=true}, bodyState={naked=true, hard=true}})
		saynn("Both of you are panting heavily after that.")

		saynn("[say=tavi]If that's how it's always gonna feel.. F-fine, I'm a buttslut..[/say]")

		saynn("The cell smells of sex.. You two stand together, your full rubber length still inside Tavi. And then you hear a loud ding as the chastity cage hits the floor. Huh?")

		saynn("You realize that Tavi's dick is already gone so the cage just slipped off.")

		saynn("[say=pc]That was interesting.[/say]")

		saynn("After some time, you yank your strapon out and watch Tavi's used asshole struggling to close up, pulsing and gaping instead.")

		saynn("[say=tavi]Next time let me fuck you..[/say]")

		addButton("Continue", "See what happens next", "endthescene_unequipstrapon")
func taviSpeak(normalSpeak, corruptSpeak, pureSpeak):
	if(isCorrupt):
		return corruptSpeak
	if(isPure):
		return pureSpeak
	return normalSpeak

func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "chastity_strapon_anal", [strapon])


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

	if(_action == "submit_pick"):
		if(GM.pc.hasReachableVagina()):
			setState(RNG.pick(["submit_vag", "submit_anal"]))
		else:
			setState("submit_anal")
		return

	if(_action == "chastity_force"):
		processTime(3*60)

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

	if(_action == "chastity_force_lock"):
		processTime(3*60)

	if(_action == "chastity_dildo"):
		processTime(3*60)

	if(_action == "chastity_anal"):
		processTime(3*60)

	if(_action == "chastity_dildo_ride"):
		processTime(5*60)

	if(_action == "chastity_dildo_fast"):
		processTime(3*60)

	if(_action == "chastity_dildo_nodick"):
		processTime(3*60)
		setFlag("TaviModule.Ch6TaviShouldHaveCock", false)
		getCharacter("tavi").updateBodyparts()

	if(_action == "chastity_anal_faster"):
		processTime(3*60)

	if(_action == "chastity_anal_cum"):
		processTime(3*60)
		getCharacter("tavi").cummedInAnusBy("pc")
		GM.pc.orgasmFrom("tavi")
		setFlag("TaviModule.Ch6TaviShouldHaveCock", false)
		getCharacter("tavi").updateBodyparts()

	if(_action == "submit_vag_fuck"):
		processTime(5*60)

	if(_action == "submit_vag_cum"):
		processTime(5*60)
		if(Species.Feline in GM.pc.getSpecies()):
			if(GM.pc.forceOvulate()):
				addMessage("Tavi's barbs forced you to ovulate because of your feline genes.")
		
		GM.pc.gotVaginaFuckedBy("tavi")
		GM.pc.cummedInVaginaBy("tavi")
		GM.pc.orgasmFrom("tavi")

	if(_action == "submit_after"):
		processTime(3*60)
		setFlag("TaviModule.Ch6TaviShouldHaveCock", false)
		getCharacter("tavi").updateBodyparts()

	if(_action == "submit_anal_fuck"):
		processTime(5*60)

	if(_action == "submit_anal_cum"):
		processTime(5*60)
		
		GM.pc.gotAnusFuckedBy("tavi")
		GM.pc.cummedInAnusBy("tavi")
		GM.pc.orgasmFrom("tavi")

	if(_action == "chastity_strapon_anal"):
		processTime(3*60)
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action == "chastity_strapon_anal_faster"):
		processTime(3*60)
		getCharacter("tavi").cummedInAnusBy("pc", FluidSource.Strapon)

	if(_action == "chastity_strapon_anal_cum"):
		processTime(3*60)
		GM.pc.orgasmFrom("tavi")
		setFlag("TaviModule.Ch6TaviShouldHaveCock", false)
		getCharacter("tavi").updateBodyparts()

	if(_action == "endthescene_unequipstrapon"):
		GM.pc.unequipStrapon()
		endScene()
		return

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
