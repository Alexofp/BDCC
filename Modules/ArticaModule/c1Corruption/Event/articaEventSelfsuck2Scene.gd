extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventSelfsuck2Scene"

func _run():
	if(state == ""):
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		aimCameraAndSetLocName("yard_neargym")
		saynn("Artica seems to be way more.. determined today. You notice that her stride is way more confident.."+str(" but she is still covering herself when anyone looks at her a little too closely.." if nakedAndShy else "")+"")

		saynn("She seems to be heading to the gym area again. The fluff peeks her head and sees that the place is quite a bit more crowded today.. Her confidence quickly drops.. And yet, she decides to commit.")

		addButton("Continue", "See what happens next", "artica_yoga")
	if(state == "artica_yoga"):
		aimCameraAndSetLocName("gym_yoga")
		playAnimation(StageScene.Yoga, "catcow", {pc="artica", bodyState={hard=true}})
		saynn("Artica patiently waits until one of the yoga mats becomes free.. but then someone else occupies it..")

		saynn("Eventually, she gets a free mat and starts her routine with a series of deep breaths, trying to distance herself from the busy loud folks around. You decide not to distract her too, you already know what goal the girl is pursuing..")

		saynn("Artica gets on all fours and starts doing the simple cat-cow pose, arching her back upwards and then dipping it downwards, stretching her spine. With each arch, she couldn't help but glance down at her "+str("{artica.penis}.." if isNaked else "shorts, the fabric sitting tight against her bulging cock..")+"")

		addButton("Continue", "See what happens next", "artica_does_plow_pose")
	if(state == "artica_does_plow_pose"):
		playAnimation(StageScene.Yoga2, "plow", {pc="artica", bodyState={hard=true}})
		saynn("After several cycles of that cat-cow pose, Artica felt ready to push herself further. She slowly transitions into a plow yoga pose, lying on her back and lifting her legs over her head while using her hands to support her lower back, carefully guiding her hind paws to touch the floor behind her head..")

		saynn("[say=artica]Nh-..[/say]")

		saynn("In this position, Artica's body formed a perfect arc, her face inches away from her"+str(" clothed" if !isNaked else " ")+""+str(" locked" if isCaged else "")+" cock.. She takes a deep breath, taking in her aroused scent.. which only fuels her desire.. so much that she feels her own precum dripping onto her snout..")

		saynn("Artica licks her lips.. and keeps pushing herself further, bending her spine and reaching her legs further, her"+str(" cock" if isNaked else " crotch")+" getting closer and closer.. until..")

		saynn("[say=gymbully]I dunno. You think so, really?[/say]")

		saynn("[say=gymbully3]I'm telling you, she is trying to suck her own cock![/say]")

		addButton("Continue", "See what happens next", "artica_gets_surrounded")
	if(state == "artica_gets_surrounded"):
		playAnimation(StageScene.Duo, "stand", {pc="gymbully", npc="gymbully3"})
		addCharacter("gymbully")
		addCharacter("gymbully2")
		addCharacter("gymbully3")
		GM.pc.setLocation("gym_yoga")
		saynn("Artica's eyes open wide as she hears a girl giggling near her.. As she does that, she notices 3 gang members surrounding her.. The main guy and the crazy girl seem to be doing all the talking while the third guy is just quietly standing near..")

		saynn("[say=gymbully]Well, well well, what do we have here? I don't remember you paying for the privilege of using these yoga mats.[/say]")

		saynn("[say=gymbully3]Tell us, please! Are you trying to suck your own cock?![/say]")

		saynn("Artica tries to maintain her composure.. but her face quickly flushes with embarrassment.")

		saynn("[say=gymbully]Maybe it's just some weird yoga position?[/say]")

		saynn("[say=gymbully3]Well, why do you think she is doing it, huh?![/say]")

		saynn("Artica's mind racing, trying to find a way out. She tries to slowly get up.. but the crazy girl is quick to pin her legs to the floor, holding her hands on Artica's thighs..")

		saynn("[say=gymbully3]Nuh-uh! Either you pay the fee.. or you offer something else, equal in value![/say]")

		saynn("[say=artica].. .. ..?..[/say]")

		saynn("The crazy girl hums.")

		saynn("[say=gymbully3]No credits, really? Hmm.. Well then suck your cock then! I wanna see you do it!![/say]")

		saynn("[say=artica].. ..[/say]")

		saynn("[say=gymbully3]WHAT DO YOU MEAN YOU CAN'T? YOU'RE ALREADY SO CLOSE! JUST SUCK IT![/say]")

		saynn("The whole gym turns towards Artica, who is still stuck in the most vulnerable position..")

		saynn("[say=gymbully3]So! Either do it or we bring you into the slutwall to get us our creds![/say]")

		saynn("All three of them seem to be busy watching Artica trying to do it.. their backs turned towards you. Some chains would be enough to bring down the quiet guy.. A gag would be perfect for that crazy bitch.. and then only the main guy would remain..")

		addButton("Watch", "Just watch Artica humiliate herself further..", "artica_selfsuck_helped")
		addButton("Act", "Try to stop the bullies", "try_stop_bullies")
	if(state == "artica_selfsuck_helped"):
		setFlag("ArticaModule.nextReaction", "s2bul")
		GM.pc.setLocation("gym_yoga")
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.SelfSuck, "tease", {pc="artica", npc="gymbully3", bodyState={naked=true, hard=true}})
		saynn("Might as well let them help Artica train her.. flexibility. You decide to sit on one of the benches and watch the scene unfold.")

		saynn("[say=artica]..[/say]")

		if (!isNaked):
			saynn("[say=gymbully3]Nu huh, your clothes first![/say]")

			saynn("The girl quickly pulls the shorts off of Artica, exposing her"+str(" caged up member" if isCaged else "hard canine member")+"..")

			if (isCaged):
				saynn("[say=gymbully3]Oh, you're fucking locked? You're doing it anyway, bitch! Just bend more![/say]")

			else:
				saynn("[say=gymbully3]That's one juicy cock, wow! C'mon, do it! I would do it if I was you.[/say]")

		else:
			if (isCaged):
				saynn("[say=gymbully3]I don't care that you're locked. You're doing it anyway, bitch! Just bend more![/say]")

			else:
				saynn("[say=gymbully3]You got one juicy ass cock! C'mon, do it! I would do it if I was you.[/say]")

		saynn("Artica's breathing became erratic, her body trembling with a mix of shame and fear. Slowly, she begins trying to bend more, her {artica.penis} swaying in the air, always so close.. but never quite close enough..")

		saynn("[say=gymbully3]You know what? Maybe I can help you out![/say]")

		saynn("Before Artica can react, the girl places her hands on the fluff's legs again.. and starts pushing them closer to Artica's head, forcing her to bend even more..")

		saynn("[say=gymbully3]See? You just need a little encouragement![/say]")

		addButton("Continue", "See what happens next", "artica_selfsuck_help")
	if(state == "artica_selfsuck_help"):
		playAnimation(StageScene.SelfSuck, "sex", {pc="artica", npc="gymbully3", bodyState={naked=true, hard=true}})
		saynn("Artica gasps as her cock inched closer to her mouth, the "+str("tip of her chastity cage brushing her lips.." if isCaged else "tip brushing her lips..")+" Miraculously, she seems to be able to bend enough for this..")

		saynn("[say=gymbully3]There you go! Now go on, give it a good suck![/say]")

		saynn("The fluff hesitates.. but the pressure on her legs didn't go away, pushing the girl to part her lips and obey, her long canine tongue swirling around"+str(" the metal cage, before slipping through the holes and teasing the tip of her cock that's hiding in her sheath.." if isCaged else " the tip of her cock, tasting her own precum..")+"")

		saynn("The more Artica was doing it.. the more she was getting into, bobbing her head back and forth, taking in as much of her "+str("chastity" if isCaged else "shaft")+" as she could and sucking on it, little quiet moans escaping from her already..")

		saynn("[say=gymbully]Oh wow, look at her go. She is actually doing it.[/say]")

		saynn("[say=gymbully3]Yeah, just like that~. Suck it good, girl..[/say]")

		if (!isCaged):
			saynn("Artica's own member is throbbing in her mouth, her arousal building fast as she realizes what she is doing.. And she only sucks harder, her lips wrapping around the tip while her tongue is sliding along the shaft, tasting every inch.. Her cute moans were muffled by her own dick, her body trembling, her knot visibly inflating..")

		else:
			saynn("Artica's own member is throbbing in its cage, her arousal building fast as she realizes what she is doing.. And she only sucks harder, her lips wrapping around the metal cage while her tongue is sliding along the trapped shaft, tasting every inch.. Her cute moans were muffled by her own dick, her body trembling..")

		addButton("Continue", "See what happens next", "artica_cums_in_her_mouth")
	if(state == "artica_cums_in_her_mouth"):
		playAnimation(StageScene.SelfSuck, "inside", {pc="artica", npc="gymbully3", bodyState={naked=true, hard=true}})
		saynn("Finally, with a muffled cry, Artica cums hard, her"+str(" locked" if isCaged else "")+" member shooting thick ropes of cum directly into her mouth"+str(" through the cage" if isCaged else "")+" as she swallows eagerly, the taste of her own seed doesn't seem to be gross to her. The bullies just watch in fascination as Artica's body convulses with pleasure, her exposed pussy visibly clenching at the same time..")

		saynn("[say=gymbully]That was quite the show. Didn't know that one could be flexible enough to do that.[/say]")

		saynn("[say=gymbully3]Oh yeah, she is a real cock sucker![/say]")

		saynn("You can hear them chuckling..")

		addButton("Continue", "See what happens next", "artica_runs_away")
	if(state == "artica_runs_away"):
		playAnimation(StageScene.Solo, "stand", {pc="artica"})
		removeCharacter("gymbully")
		removeCharacter("gymbully2")
		removeCharacter("gymbully3")
		saynn("Satisfied with the show, the bullies walk away, leaving the fluff to pant exhausted, her body still trembling.. She slowly unfolds herself from the plow yoga pose, her face burning with a mix of shame.. and lust..")

		saynn("After that, she gets up"+str(", grabs her clothes," if !isNaked else "")+" and quickly runs away..")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "try_stop_bullies"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully2", npcAction="defeat", flipNPC=true})
		saynn("You can't let these bullies have it their way with Artica. While she was busy trying to satisfy their cruel request, you began to act..")

		saynn("With silent precision, you creep behind the guy who didn't say a word so far. In one swift motion, you wrap your hands around his neck and mouth.. quickly pulling him to one of the benches for lifting weights. The barbells there are all connected to the floor with some chains, probably to avoid them being used as weapons by inmates.. And so you use one of these chains to wrap around the guy's wrists and waist, rendering him harmless.")

		saynn("[say=gymbully2]Uh![/say]")

		saynn("[say=pc]Tsshh-h..[/say]")

		saynn("You grab his bandana and gag him with it, quickly crumbling it and shoving it into his mouth.")

		addButton("Continue", "See what happens next", "artica_gets_bullied_anyway_abit")
	if(state == "artica_gets_bullied_anyway_abit"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.SelfSuck, "tease", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("The other two gang members didn't seem to notice their quiet guy gone.. Good.. But they're still bullying Artica.")

		if (!isNaked):
			saynn("[say=gymbully3]Nu huh, your clothes first![/say]")

			saynn("The girl quickly pulls the shorts off of Artica, exposing her"+str(" caged up member" if isCaged else "hard canine member")+"..")

			if (isCaged):
				saynn("[say=gymbully3]Oh, you're fucking locked? You're doing it anyway, bitch! Just bend more![/say]")

			else:
				saynn("[say=gymbully3]That's one juicy cock, wow! C'mon, do it! I would do it if I was you.[/say]")

		else:
			if (isCaged):
				saynn("[say=gymbully3]I don't care that you're locked. You're doing it anyway, bitch! Just bend more![/say]")

			else:
				saynn("[say=gymbully3]You got one juicy ass cock! C'mon, do it! I would do it if I was you.[/say]")

		saynn("Artica's breathing became erratic, her body trembling with a mix of shame and fear. Slowly, she begins trying to bend more, her {artica.penis} swaying in the air, always so close.. but never quite close enough..")

		saynn("[say=gymbully3]You want some help or what?! Just suck your cock already![/say]")

		saynn("That girl is so annoying, she just has to be the next..")

		addButton("Crazy girl", "Pacify her next", "crazy_girl_pacified")
	if(state == "crazy_girl_pacified"):
		playAnimation(StageScene.SexStart, "defeated", {pc="pc", npc="gymbully3"})
		saynn("You quietly approach the crazy girl, who was still taunting the poor fluff. Without a word, you grab her and pull her into the crowd.. before shoving a ballgag into her mouth, muffling her protests.")

		saynn("[say=gymbully3]MmmHHHMMM!.. MmmHHH!..[/say]")

		saynn("The noise of the crowd was enough to cover her cute noises up. You quickly drag the girl under one of the barbell poles.. positioning it so she was effectively trapped.")

		saynn("The crazy girl's eyes widened in panic as she realized she was too weak to lift the barbell off herself..")

		addButton("Continue", "See what happens next", "prefight")
	if(state == "prefight"):
		playAnimation(StageScene.Duo, "stand", {npc="gymbully"})
		saynn("It doesn't take long for their leader to notice the absence of two of his goons.")

		saynn("[say=gymbully]Huh. I was wondering why it became so quiet all of the sudden.[/say]")

		saynn("He raises his fists.")

		saynn("[say=gymbully]I guess we're breaking you in half next.[/say]")

		saynn("You feel like bad things will happen to you if you lose this one..")

		saynn("Looks like it's a fight..")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "lost_fight"):
		setFlag("ArticaModule.nextReaction", "s2lost")
		playAnimation(StageScene.Solo, "defeat")
		saynn("Unable to continue fighting, you drop to your knees..")

		saynn("[say=gymbully]Never should have messed with us.[/say]")

		saynn("The quiet guy manages to wiggle free from his chains. He quickly frees himself and then moves on to helping the crazy girl, lifting the barbell and removing the ballgag.")

		saynn("[say=gymbully3]YOU BITCH! Looks like you're NOT so tough of a HERO, are you!?[/say]")

		saynn("All of them surround you, the eyes of the crazy girl shining with malice..")

		saynn("Something is about to happen..")

		addButton("Continue", "See what happens next", "lose_pc_in_half")
	if(state == "lose_pc_in_half"):
		playAnimation(StageScene.SelfSuck, "tease", {pc="pc", npc="gymbully3", bodyState={naked=true, hard=true}})
		saynn("[say=gymbully3]Hold him down!"+str(" Takes {pc.his} clothes off too!" if !GM.pc.isFullyNaked() else "")+"[/say]")

		saynn("As the girl barks, the two guys pin you to the ground, forcing your arms behind your back."+str(" They then {pc.undressMessage}, leaving you exposed!" if !GM.pc.isFullyNaked() else "")+"")

		saynn("Artica watches in horror, her heart racing as she feels helpless.")

		saynn("The mean girl approaches you, her expression full of sadistic intent..")

		saynn("[say=gymbully3]You thought you could play the hero, huh? Let's see how flexible you are then![/say]")

		saynn("No matter how much you resist, the whole gang uses her combined strength to bend your body as much as it allows it.. and then some.. pushing your own crotch into your face"+str(", your own pussy is clearly visible by your own eyes.. wow.." if (GM.pc.hasReachableVagina() && !GM.pc.isWearingChastityCage() && !GM.pc.hasReachablePenis()) else "")+""+str(", your own chastity cage is clearly visible by your own eyes.. wow.." if (!GM.pc.hasReachableVagina() && GM.pc.isWearingChastityCage() && !GM.pc.hasReachablePenis()) else "")+""+str(", your own cock is clearly visible by your own eyes.. wow.." if (!GM.pc.hasReachableVagina() && GM.pc.isWearingChastityCage() && !GM.pc.hasReachablePenis()) else "")+".")

		saynn("Having your spine bent and your body stretched like that.. it hurts quite a bit..")

		if (GM.pc.hasReachablePenis()):
			saynn("[say=gymbully3]Come on, get to it! Suck yourself off like the pathetic little worm you are![/say]")

			addButton("Suck yourself off", "Do it", "lost_selfsuck")
			addButton("Refuse", "You'd rather not..", "lost_selfsuck_refuse")
		elif (GM.pc.isWearingChastityCage()):
			saynn("[say=gymbully3]I don't care that you're caged! Get to it! Suck yourself off like the pathetic little worm you are![/say]")

			addButton("Suck yourself off", "Do it", "lost_selfsuck")
			addButton("Refuse", "You'd rather not..", "lost_selfsuck_refuse")
		else:
			saynn("[say=gymbully3]Aww.. you don't have anything to suck on. You're a lucky stupid bitch..[/say]")

			saynn("They just kick you a few times.. and leave it at that.")

			saynn("[say=gymbully]Let's go, {pc.he} got what was coming for {pc.him}.[/say]")

			addButton("Continue", "See what happens next", "lost_leavealone")
	if(state == "lost_selfsuck_refuse"):
		saynn("No matter what they do to you, you refuse.. so eventually they get tired and give up.")

		saynn("They just kick you a few times.. and leave it at that.")

		saynn("[say=gymbully]Let's go, {pc.he} got what was coming for {pc.him}.[/say]")

		addButton("Continue", "See what happens next", "lost_leavealone")
	if(state == "lost_leavealone"):
		removeCharacter("gymbully")
		removeCharacter("gymbully2")
		removeCharacter("gymbully3")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("As soon as they are gone, Artica crawls up to you, helping you to get up..")

		saynn("[say=artica]S-sorry..[/say]")

		saynn("[say=pc]Ow.. ow.. It's me who should be sorry.[/say]")

		saynn("She blinks many times.")

		saynn("[say=artica]Are you o-okay?..[/say]")

		saynn("[say=pc]Mostly. Don't worry about me.[/say]")

		saynn("She nods and nuzzles your cheek, her tail swishing wildly.")

		saynn("[say=artica]I.. will go back to my spot..[/say]")

		saynn("[say=pc]Be careful.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lost_selfsuck"):
		playAnimation(StageScene.SelfSuck, "sex", {pc="pc", npc="gymbully3", bodyState={naked=true, hard=true}})
		saynn("You groan in pain, struggling to resist.. but the gang held you firmly in place. With no better choice, you decide to submit, your lips making their first contact with your "+str("chastity cage" if GM.pc.isWearingChastityCage() else "own cock")+", the humiliating act making your cheeks flush.")

		saynn("[say=gymbully3]Do it~.[/say]")

		if (!GM.pc.isWearingChastityCage()):
			saynn("You open your mouth, reluctantly taking in the tip of that shaft. The sensation was surreal, it really felt like your own lips wrapped around your own cock.. Inch by inch, more of it slipped into your mouth. The taste of your own precum hit your senses.. salty..")

			saynn("Just as unwillingly, you begin to suck, your lips sliding up and down along your length, your tongue swirling around the tip, tasting more of that salty pre as it leaked out..")

			saynn("The gang watched with an expression of twisted satisfaction on their faces as you were forced to pleasure yourself. Your body began betraying you, responding involuntarily, your arousal building.. And so you suck harder, your mouth moving rhythmically along your own cock..")

		else:
			saynn("You open your mouth, reluctantly taking in the tip of that cage. The sensation was surreal, your cock really felt the heat of your lips and the warm breath.. Inch by inch, more of it slipped into your mouth. The taste of your own precum hit your senses.. salty..")

			saynn("Just as unwillingly, you begin to suck the metal object, your lips sliding up and down along your cage, your tongue swirling around and teasing the tip of your cock that's trapped inside, tasting more of that salty pre as it leaked out..")

			saynn("The gang watched with an expression of twisted satisfaction on their faces as you were forced to pleasure yourself. Your body began betraying you, responding involuntarily, your arousal building.. And so you suck harder, your mouth moving rhythmically along your own chastity cage, tongue licking it more..")

		saynn("[say=gymbully3]Haha. Look at you, getting into it. Such a good little slut~.[/say]")

		saynn("Your body is reacting more and more, your {pc.penis} throbbing in your mouth as you feel your orgasm building..")

		saynn("And then, with a final, choked, gasp, you cum, your dick pulsing violently, spurting thick ropes of {pc.cum} directly into your mouth. You swallow convulsively, unable to stop the flow, the bitter salty taste filling your senses, adding to the shame.")

		saynn("The crazy girl giggles and steps back, letting you collapse.")

		saynn("[say=gymbully3]Looks like our work here is done![/say]")

		saynn("She wipes her hands as if to get rid of the filth..")

		addButton("Continue", "See what happens next", "lost_leavealone")
	if(state == "won_fight"):
		setFlag("ArticaModule.nextReaction", "s2won")
		playAnimation(StageScene.Duo, "stand", {npc="gymbully", npcAction="defeat"})
		saynn("The last guy gets defeated as well.")

		saynn("[say=gymbully]Grhr.. fuck.[/say]")

		saynn("[say=pc]Not this time. Get your little band and get the fuck out of here.[/say]")

		saynn("He snarls at you.. but decides to obey, unchaining his buddies and making their escape together.")

		addButton("Artica", "Check if she is okay", "won_checkokay")
	if(state == "won_checkokay"):
		removeCharacter("gymbully")
		removeCharacter("gymbully2")
		removeCharacter("gymbully3")
		playAnimation(StageScene.Zonked, "tease", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("You look at Artica.. who is still stuck in an awkward bent-in-half pose.. with her"+str(" locked" if isCaged else "")+" drippy dick out..")

		saynn("[say=pc]Let me help you.[/say]")

		saynn("[say=artica]Help h-how.. oh.. r-right..[/say]")

		saynn("She grabs your hand and gets up with your help.")

		saynn("[say=artica]Thank you.. this was embarrassing.. haha..[/say]")

		saynn("[say=pc]Oh yeah, stretching yourself in front of everyone like that, I can tell.[/say]")

		saynn("The girl is blushing.")

		saynn("[say=artica]It's.. k-kinda.. w-why I'm doing it..[/say]")

		saynn("After everything that you saw.. It makes sense.")

		saynn("[say=artica]I'm not a g-gym person.. I'm just doing this to..[/say]")

		saynn("[say=pc]I know. You really want to suck your own cock.[/say]")

		saynn("Her cheeks become fully red.")

		saynn("[say=artica]It.. it's.. mmm.. I..[/say]")

		saynn("She is struggling to produce a single word.")

		saynn("[say=artica]Do you wanna see me try?..[/say]")

		saynn("..but then spews out the whole sentence in a single second..")

		addButton("Sure", "Watch Artica try to pleasure herself", "won_sure")
		addButton("Nah", "It's okay", "won_nah")
	if(state == "won_nah"):
		addCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcBodyState={hard=true}})
		saynn("[say=pc]I trust that you can do it, Artica. I don't have to watch.[/say]")

		saynn("[say=artica]Okay.. no problem. See you around![/say]")

		saynn("The girl rubs herself against you while chrrring quietly.. before walking away.")

		addButton("Continue", "See what happens next", "artica_cums_no_watch")
	if(state == "artica_cums_no_watch"):
		removeCharacter("artica")
		playAnimation(StageScene.Solo, "stand")
		saynn("For some reason, a silent vibration of someone's moans echoes in your mind..")

		saynn("You get a feeling that it was Artica's.. She is fast, that girl.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "won_sure"):
		addCharacter("artica", ["naked"])
		playAnimation(StageScene.Duo, "sit", {npc="artica", npcBodyState={naked=true,hard=true}})
		GM.pc.setLocation("cellblock_lilac_nearcell")
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		saynn("It's a strange offer.. but why not. You agree and follow the girl to her cell.")

		saynn("Artica takes a deep breath"+str(" and then undresses" if !isNaked else "")+", glancing at you nervously, while completely vulnerable and exposed, "+str("her hard canine cock out on full display" if !isCaged else "her locked canine cock out on full display")+".")

		saynn("You just sit on some chair.. while Artica goes towards her bed.")

		addButton("Continue", "See what happens next", "won_artica_starts")
	if(state == "won_artica_starts"):
		playAnimation(StageScene.SelfSuck, "tease", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Artica started with some more stretching, doing poses that put emphasis on her spine, probably to warm it up a bit..")

		saynn("[say=artica]Let's see..[/say]")

		saynn("After that, she positions herself on the bed, her legs high above her head, balancing as she supports her spine with her hands.. In this position, her {artica.penis} is dangling tantalizingly close to her face. Something about seeing it from so close.. is making her lick her lips."+str(". even if the shaft is mostly hidden behind the tight chastity cage.." if isCaged else "")+"")

		saynn("[say=artica]Mmm..[/say]")

		saynn("Her precum dripping onto her face is only making her eager to reach it..")

		addButton("Continue", "See what happens next", "won_artica_selfsuck")
	if(state == "won_artica_selfsuck"):
		playAnimation(StageScene.SelfSuck, "sex", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("Artica exhales all of the air out of her lungs.. and begins trying to her body further..")

		saynn("Each extra inch is.. harder and harder for her to conquer, her long and drooly canine tongue is out, trying to reach as far as it can..")

		saynn("[say=artica]Hhh.. mmh..[/say]")

		saynn("Finally, she manages to get to the pointy tip of her"+str(" cock" if !isCaged else " chastity cage")+", grabbing it with her lips while her spine is making a perfect arc.")

		saynn("The girl moans softly around the shaft, her tongue"+str(" finding a hole in the cage and slipping inside before" if isCaged else "")+" swirling around the head, licking up the precum. All the while you just watch in fascination..")

		saynn("Artica wasn't happy with just the tip though, getting a taste for it only made her more eager to push herself further. Slowly, she begins to suck herself off, moving her head back and forth as much as her neck allows, her lips sliding along the "+str("shaft" if !isCaged else "chastity cage")+", taking slightly more of her length each time.. Her hips are bucking, trying to push that "+str("veiny cock" if !isCaged else "cage")+" deeper into her mouth..")

		saynn("[say=artica]Mmhh.. mmh-hmm..[/say]")

		saynn("You get a feeling that you can help her.. reach higher heights.. or rather.. deeper depths.")

		addButton("Help her", "Encourage Artica to go deeper and faster", "won_do_help_artica")
		addButton("Just watch", "She is doing just fine by herself", "won_do_nohelp")
	if(state == "won_do_nohelp"):
		playAnimation(StageScene.SelfSuck, "inside", {pc="artica", bodyState={naked=true, hard=true}})
		saynn("You decide to just let Artica have fun on her own, she seems to be able to suck herself off just fine. You could easily see her growing more needy, her pussy dripping juices shows it quite clear. Her sucking becomes a little faster and more frantic..")

		saynn("Until she closes her eyes and lets as much of her "+str("cock" if !isCaged else "cage")+" inside her mouth as she can, her tongue working fast, licking her "+str("cyan shaft that has a knot quickly growing at its base.." if !isCaged else "trapped cyan shaft that's desperately trying to get hard behind the chastity..")+"")

		saynn("[say=artica]Mmm.. mmhh-hmm.. Mhh-Mh![/say]")

		saynn("And soon, with a muffled cry, Artica cums hard, her {artica.penis} throbbing in her mouth, ropes of thick cum erupt from it and go directly down her throat. The fluff swallows eagerly, savoring the taste of her own seed, her pussy clenching and gushing with juices, adding to the mess.. her body convulsing with a unique kind of pleasure..")

		saynn("[say=pc]Wow. Impressive feat, girl. Most impressive.[/say]")

		saynn("While the orgasm is still hammering at her senses, she opens her eyes and looks at you with her cock in her mouth.. blushing deeply.")

		saynn("You get up and gently tap her butt.")

		saynn("[say=pc]I guess you can take care of the cleanup.. with that nice tongue of yours. See you around, Artica.[/say]")

		saynn("[say=artica]Mmmhmm..[/say]")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "won_do_help_artica"):
		playAnimation(StageScene.SelfSuck, "fast", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("Might as well help the girl. You get up and position yourself near, your hands landing on her fluffy butt and pushing on it, making Artica swallow more of her length.")

		saynn("[say=artica]Mmmhh-hh!.. mmmh!..[/say]")

		saynn("She doesn't resist.. but she is certainly surprised. Your help made it so her cock hit the back of throat with each thrust, teasing her gag-reflex.. that she seems to be able to suppress by now.")

		saynn("[say=pc]Just enjoy it, Artica.[/say]")

		saynn("You could easily see her growing more needy, her pussy dripping juices shows it quite clear. Her sucking becomes faster and more frantic..")

		saynn("Until she closes her eyes and lets as much of her "+str("cock" if !isCaged else "cage")+" inside her mouth as she can, her tongue working tirelessly, licking her "+str("cyan shaft that has a knot quickly growing at its base.." if !isCaged else "trapped cyan shaft that's desperately trying to get hard behind the chastity..")+"")

		saynn("[say=artica]..mm-m.. mmhmm..[/say]")

		addButton("Continue", "See what happens next", "won_artica_help_cum")
	if(state == "won_artica_help_cum"):
		playAnimation(StageScene.SelfSuck, "inside", {pc="artica", npc="pc", bodyState={naked=true, hard=true}})
		saynn("And soon, with a muffled cry, Artica cums hard, her {artica.penis} throbbing in her mouth, ropes of thick cum erupt from it and go directly down her throat. The fluff swallows eagerly, savoring the taste of her own seed, her pussy clenching and gushing with juices, adding to the mess.. her body convulsing with a unique kind of pleasure..")

		saynn("You get up and gently tap her butt.")

		saynn("[say=pc]Wow. Impressive feat, girl. Most impressive.[/say]")

		saynn("While the orgasm is still hammering at her senses, she opens her eyes and looks at you with her cock in her mouth.. blushing deeply.")

		saynn("[say=pc]I guess you can take care of the cleanup.. with that nice tongue of yours. See you around, Artica.[/say]")

		saynn("[say=artica]Mmmhmm..[/say]")

		saynn("Time to go.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "artica_yoga"):
		processTime(5*60)

	if(_action == "artica_does_plow_pose"):
		processTime(5*60)

	if(_action == "artica_gets_surrounded"):
		processTime(5*60)

	if(_action == "artica_selfsuck_help"):
		processTime(3*60)

	if(_action == "artica_cums_in_her_mouth"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.07)
		getCharacter("artica").cummedInMouthBy("artica")

	if(_action == "artica_runs_away"):
		processTime(3*60)

	if(_action == "crazy_girl_pacified"):
		processTime(3*60)

	if(_action == "prefight"):
		processTime(3*60)

	if(_action == "start_fight"):
		runScene("FightScene", ["gymbully"], "gymFight")
		return

	if(_action == "lose_pc_in_half"):
		processTime(3*60)
		GM.pc.addPain(30)
		getModule("ArticaModule").triggerCorruption(0.0)

	if(_action == "lost_selfsuck"):
		processTime(13*60)
		GM.pc.cummedInMouthBy("pc")
		GM.pc.orgasmFrom("pc")

	if(_action == "lost_selfsuck_refuse"):
		processTime(3*60)
		GM.pc.addPain(10)

	if(_action == "won_checkokay"):
		processTime(3*60)

	if(_action == "won_sure"):
		processTime(3*60)

	if(_action == "won_nah"):
		processTime(3*60)

	if(_action == "artica_cums_no_watch"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.07)

	if(_action == "won_artica_starts"):
		processTime(3*60)

	if(_action == "won_artica_selfsuck"):
		processTime(5*60)

	if(_action == "won_do_help_artica"):
		processTime(5*60)

	if(_action == "won_do_nohelp"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.07)
		getCharacter("artica").cummedInMouthBy("artica")

	if(_action == "won_artica_help_cum"):
		processTime(5*60)
		getModule("ArticaModule").triggerCorruption(0.07)
		getCharacter("artica").cummedInMouthBy("artica")

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "gymFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_fight")
			addExperienceToPlayer(50)
		else:
			setState("lost_fight")
			addExperienceToPlayer(5)

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy

	return data

func loadData(data):
	.loadData(data)

	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
