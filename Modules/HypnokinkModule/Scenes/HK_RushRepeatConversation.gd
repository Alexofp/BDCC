extends SceneBase

func _init():
	sceneID = "RushRepeatConversation"

func _run():
	addCharacter("rush")
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="rush"})
		saynn("Rush towers over you, arms crossed.")
		saynn("[say=rush]So what is it, pipsqueak? Think ya can take me?[/say]")
		
		addButton("Curiosity", "So what is he in for?", "backstory")
		addButton("Offer yours", "You have an ass available", "want_dick")
		addButton("Fight", "Stay away or there will be trouble", "fight_me")
		#addButton("DEBUG FIGHT", "Haha get sucker punched", "debug_fight")
		#addButton("DEBUG SEX", "Haha get sucker fucked", "debug_sex")
		addButton("Leave", "Actually you've remembered a thing at a place", "leaving")
		
	if(state == "backstory"):
		playAnimation(StageScene.Duo, "stand", {npc="rush"})
		saynn("[say=rush]Crushed a bitch's skull against th' pavement. Anger issues. Had it comin'.[/say]")

		saynn("[say=pc]Oh.[/say]")

		saynn("[say=rush]Tha's wha' got me arrested, anyway. Smashin' that table over th' officer's head 's what got 'em to throw away th' key.[/say]")

		saynn("He snorts.")

		saynn("[say=rush]For th' best, really. Lotsa assholes tha' deserve punchin' in 'ere, an' it keeps me away from th' \"general populace\".[/say]")

		saynn("Interesting. He's more level-headed about it than you'd have expected.")

		addButton("Back", "", "")
		
	if(state == "want_dick"):
		playAnimation(StageScene.Duo, "stand", {npc="rush"})
		saynn("You fail to provide an answer. You are too busy being mesmerized by the size of his enormous bulge... You might be drooling a little.")

		saynn("Rush follows your gaze, then chuckles.")
		
		saynn("[say=rush]Ha, yeh tha' happens. Wha', you lookin' for a ride?[/say]")
		
		saynn("[say=pc]I- uh... um...")
		
		saynn("Numbly, you manage a nod.")

		saynn("Rush looks you up and down, sizing you up. He scratches the side of his head, appearing unsure.")

		saynn("[say=rush]Ya sure? Imma thinkin' I might break ya in two.[/say]")

		addButton("Absolutely", "Internal trauma is a future you's problem", "need_dick")
		addButton("Actually no", "Functional internal organs are important", "nah_dick")
	if(state == "need_dick"):
		playAnimation(StageScene.SexStanding, "tease", {
			pc="rush", npc="pc",
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		if(GM.pc.isFullyNaked()):
			saynn("Conveniently, you've come already naked, including your cute {pc.analStretch} tailhole.")
		else:
			saynn("You quickly {pc.undressMessage}, leaving your cute {pc.analStretch} tailhole exposed.")
			
		saynn("[say=rush]Okay, I'm game. Let's get ya ready.[/say]")
		
		saynn("After retrieving a bottle of lube from somewhere, Rush forces a few lubed fingers into your anus, making sure to lubricate you well for what's coming ahead.")

		saynn("[say=rush]Lean against th' wall. Ya gonna want some support for this.[/say]")
		
		saynn("Valid suggestion. You lean against the wall, taking the opportunity to spread your legs wide. Rush steps behind you, slapping his {rush.cockDesc} "+RNG.pick(["cock", "dick", "member"])+" against your back. A cold sense of dread spreads down your spine as you feel its flared tip rest between your shoulder blades. Rush forces his fingers deeper into you, continuing to methodically lubricate your passage.")
		
		saynn("[say=pc]Mmh...[/say]")
		
		saynn("Surprisingly he takes his time, ensuring you are well stretched and ready. You find yourself almost begging for him to hurry it up by the time he's finally satisfied that you're as stretched as you're going to get this way.")
		
		saynn("[say=rush]Time for th' main event. Ya ready, pipsqueak?[/say]")
		
		saynn("Continuing with his unexpectedly careful approach, he positions his {rush.cockDesc} "+RNG.pick(["cock", "dick", "member"])+" at the opening of your needy tailhole, it’s flared head prodding against your {pc.analStretch} entrance. Then, slowly but firmly, he begins to push against it.")

		addButton("Take it", "This is gonna be a stretch", "get_fucked_check")
			
	if(state == "get_fucked_pass"):
		playAnimation(StageScene.SexStanding, "sex", {
			pc="rush", npc="pc",
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		saynn("It takes Rush several attempts before he manages to push his {rush.cockDesc}"+RNG.pick(["cock", "dick", "member"])+" into you. When it finally slips in, it feels a lot like being impaled by a tree trunk.")

		saynn("[say=pc]F-fuuuck okay okay it's in![/say]")
		
		saynn("[say=rush]Well alright, pipsqueak! Gotta say, didn't think I'd fit![/say]")
		
		saynn("He gives you a few moments to get used to the feeling, then starts slowly thrusting in and out. The sensation is unbelieveable in every sense of the word, and you are pushed to the tips of your toes with every thrust.")
		
		saynn("[say=rush]Ya okay down there?[/say]")
		
		saynn("[say=pc]Nnnh no I'm good! K-keep going![/say]")
		
		saynn("Rush snorts and picks up the pace, now pistoning ever deeper. His {rush.cockDesc}"+RNG.pick(["cock", "dick", "member"])+" continues to rub along your insides, thankfully sufficiently lubricated.")
		
		addButton("Deeper", "", "get_fucked_2")
	if(state == "get_fucked_2"):
		playAnimation(StageScene.SexStanding, "fast", {
			pc="rush", npc="pc",
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		saynn("Relentless, Rush continues to pound your ass. Your pleasure builds as he picks up more and more speed, pushing deeper into you with every shove of his {rush.cockDesc}"+RNG.pick(["cock", "dick", "member"])+" Your legs start uncontrollably shaking so much you're not sure you could stay standing if it weren't for the cock in you acting as support.")
		
		saynn("[say=rush]You're taking it so fuckin' good, pipsqueak. Not long now, ya hear?[/say]")
		
		saynn("[say=pc]Y-yeah I'm cl-close too-[/say]")
		
		saynn("You are rapidly approaching the edge of orgasm, the relentless pleasure coursing through your body and turning your thoughts to a blissful mush. Rush pushes his "+RNG.pick(["cock", "dick", "member"])+" all the way in, going balls-deep. With every thrust, he lifts your whole body off the ground with his dick alone.")
		
		addButton("Cum!", "Let it happen", "get_fucked_orgasm")
		
	if(state == "get_fucked_orgasm"):
		playAnimation(StageScene.SexStanding, "inside", {
			pc="rush", npc="pc",
			pcCum=true, npcCum=true,
			bodyState={exposedCrotch=true,hard=true},
			npcBodyState={exposedCrotch=true,hard=true},
		})
		
		if(GM.pc.isWearingChastityCage()):
			saynn("Your {pc.cock} weakly pulses inside your chastity cage and shoots strings of {pc.cum} at the wall you're leaning on!")
		elif(GM.pc.hasPenis()):
			saynn("Your {pc.cock} throbs and shoots {pc.cum} all over the wall you're leaning on!")
		if(GM.pc.hasVagina()):
			saynn("Your neglected pussy squirts your juices onto the wall and down your thighs!")
		
		saynn("As your ring clenches and pulses around his "+RNG.pick(["cock", "dick", "member"])+", he groans and finally cums too, slamming you against the wall and your own mess, filling you up to the brim! You feel your insides stretch and expand to accomodate, and distantly wonder if it's going to end up spraying out of your mouth. Even while he cums, your own orgasm still continues as you shiver and squirm, helplessly impaled and held in place against the wall.")
		
		saynn("After a few breathless moments, Rush pulls back, allowing you to stand back on your shaking legs.")
		
		saynn("[say=pc]Th-that was...[/say]")
		
		saynn("[say=rush]Hah! Tha' was great! Up for another round, pipsqueak?[/say]")
		
		saynn("Too spent for your horniness to overrule you, you whimper and shake your head.")
		
		addButton("Get dressed", "You'll feel that in the morning", "get_fucked_after")
		
	if(state == "get_fucked_after"):
		saynn("[say=rush]Fair 'nuff. Later, then?[/say]")
		
		saynn("[say=pc]M-maybe, yeah, that sounds...[/say]")
		
		saynn("Somewhere in the back of your head, a thought finally manages to make itself known and remind you of why you're here in the first place.")
		
		saynn("[say=pc]W-Wait, hold on. What about Vion?[/say]")
		
		saynn("[say=rush]Oh, righ'. Tell ya what, I'll lay off four-eyes for a bit, just for ya.[/say]")
		
		saynn("You decide to quit while you're ahead and leave to report the good news.")
		
		addButton("Oof", "", "endthescene")
		
	if(state == "get_fucked_fail"):
		saynn("Rush makes several attempts to push his {rush.cockDesc} "+RNG.pick(["cock", "dick", "member"])+" into you, but it just refuses to fit. Soon enough pleasure gives way to frustration.")

		saynn("[say=rush]Looks like yer all talk, pipsqueak. Ain't gettin' it in without rippin' ya in two.[/say]")
		
		addButton("What?", "Since when has that stopped anybody?", "get_fucked_fail_2")
		addButton("Do it anyway", "This is going to hurt", "get_fucked_pass")
		
	if(state == "get_fucked_fail_2"):
		saynn("[say=pc]Wha- but I-[/say]")
		
		saynn("[say=rush]Na', tha's enough. We're done 'ere.[/say]")
		
		saynn("He steps backs and starts wiping the lube off his "+RNG.pick(["cock", "dick", "member"])+". You suppose you should be glad he decided to stop before doing you harm, but you can't help but feel you've failed some sort of test.")
		
		saynn("Also, you're still really horny. Fuck.")

		addButton("Leave", "", "endthescene")
	if(state == "nah_dick"):
		playAnimation(StageScene.Duo, "stand", {npc="rush"})
		saynn("You regain your senses enough to shake your head. Rush pats his enormous, massive bulge. You watch as it bounces, eventually managing to break your gaze.")

		saynn("[say=rush]Yeh, tha's about right. Not many a cocksleeve tha' can handle [i]this[/i] bad boy.[/say]")

		addButton("Back", "", "")
	if(state == "fight_me"):
		playAnimation(StageScene.Duo, "stand", {npc="rush"})
		saynn("He guffaws.")

		saynn("[say=rush]Hah! Haha, tha's hilarious! Yer funny, pipsqueak![/say]")

		saynn("You stand your ground.")

		saynn("[say=pc]I'm not kidding. I can take you.[/say]")

		saynn("[say=rush]Hah, well alright. Tell ya' what. You last six rounds wit' me, I'll leave four-eyes alone for a bit. Deal?[/say]")

		addButton("Deal", "This will hurt", "deal")
		addButton("No deal", "You don't like your chances", "no_deal")
	if(state == "deal"):
		playAnimation(StageScene.Duo, "stand", {npc="rush"})
		saynn("His attitude sobers. He flexes, and enters a classic boxing stance.")

		saynn("[say=rush]Alrigh', but don' go sayin' I didn't warn ya. Put 'em up.[/say]")

		saynn("You try to get ready for what's certainly going to hurt in the morning. If you're lucky.")

		addButton("Put 'em up", "You weren't using all those ribs anyway", "put_em_up")
	if(state == "no_deal"):
		playAnimation(StageScene.Duo, "stand", {npc="rush"})
		saynn("He claps you on the back, sending you stumbling into the wall.")

		saynn("[say=rush]Yeh tha's right. Good on ya, broken bones ain't no fun for no one.[/say]")
		
		addButton("Back", "", "")
	if(state == "if_won"):
		playAnimation(StageScene.Duo, "stand", {npc="rush", npcAction="defeat"})
		saynn("Rush stumbles and falls to one knee.")
		
		saynn("[say=rush]Whoo. Ya got a mean kick to ye, pipsqueak.[/say]")

		saynn("Then he rises back to his feet, bruised but unwavering.")
		
		saynn("[say=rush]Ya got me good. Deal's a deal. Tell four-eyes he's good. Until I need more credits.[/say]")
		
		addButton("Done here", "Good enough for now", "leave_victorious")
		if(getFlag("HypnokinkModule.RushDealStruckAtLeastOnce")):
			saynn("A thought occurs to you. If you were to knock Rush out, there might be a more permanent solution to this problem.")
			if(GM.pc.getInventory().hasItemID("inmatewristcuffs") and GM.pc.getInventory().hasItemID("inmateanklecuffs")):
				addButton("Solution", "Keep fighting", "put_em_up_again")
			else:
				addDisabledButton("Solution", "Keep fighting\n\nYou'll need a set of wrist and ankle cuffs for this")
		
	if(state == "if_lost"):
		playAnimation(StageScene.Duo, "defeat", {npc="rush"})
		saynn("With one last mighty kick, Rush sends you sprawling on the floor.")
		
		saynn("[say=rush]Hah! Tha's right![/say]")
		
		saynn("Rush advances onto your prone form. You curl up, anticipating a very unpleasant next few minutes...")
		
		saynn("Instead, he pulls you back onto your feet.")
		
		saynn("[say=rush]Not bad, pipsqueak! Ya wanna throw down like tha' again sometime?[/say]")
		
		saynn("He brushes the dust off your shoulders, making you wince as his rough hands glide over your bruises.")
		
		saynn("[say=rush]Ya know where t' find me. Deal's still on th' table![/say]")
		
		saynn("[say=pc]I don't- Yeah, maybe. Sometime else.[/say]")
		
		saynn("You decide to cut your losses and slink off to lick your wounds elsewhere.")
		
		addButton("Ow", "", "endthescene")
		
	if(state == "leave_victorious"):
		saynn("You decide to quit while you're ahead and leave to report the good news.")
		
		addButton("Leave", "", "endthescene")
		
	if(state == "if_won_serious"):
		saynn("Rush finally goes down. For a second, it looks like he might manage to drag himself up again, but then his hands go out from under him and he collapses, out like a light. You waste no time clamping your cuffs on him.")
		
		addButton("Drag him", "Better get moving", "drag_rush")
		addButton("Leave", "Actually, maybe not", "endthescene")
		
	if(state == "if_lost_serious"):
		playAnimation(StageScene.Rekt, "kill", {pc="rush", npc="pc"})
		saynn("You stumble back, and only have time to wince before Rush throttles your neck and slams you into the wall. Your vision swims.")
		
		saynn("[say=rush]Ya fuckin' stupid-[/say]")
		
		saynn("[b]*WHAM*[/b]")
		
		saynn("He slams you into the wall again. Through the daze, you wonder if you heard your skull crack.")
		
		saynn("[say=rush]-don't fuckin' [i]ever[/i]-[/say]")
		
		saynn("[b]*WHAM*[/b]")
		
		saynn("Again, you head makes impact with the metal wall behind you. This time you're sure you heard something important snap, and it begins to dawn on you that you might actually be about to die.")
		
		addButton("Oh shit", "Better say something while you still can", "if_lost_serious_2")
	if(state == "if_lost_serious_2"):
		playAnimation(StageScene.Rekt, "end", {pc="rush", npc="pc"})
		saynn("[say=pc]Wa- wait, I-[/say]")
		
		saynn("[say=rush]SHUT the FUCK up![/say]")
		
		saynn("[b]*WHAM*[/b]")
		
		saynn("The following impact effectively silences you as you narrowly avoid biting off your tongue. In lieu of speaking again, you cough up blood instead.")
		
		saynn("Rush notices your blood on his hand. He lets go with it, rearing up for the punch that ends your life. Then, with the other, he sends you tumbling and skidding across the floor.")
		
		saynn("[b]*WHAM*[/b]")
		
		saynn("Managing to look up, you see Rush has left a fist shaped imprint in the wall where your head used to be.")
		
		saynn("[say=rush]Don't ever do tha' again. Get th' fuck out.[/say]")
		
		saynn("You crawl away before you manage to make Rush lose whatever tenuous grasp on his temper he's managed to regain.")
		
		addButton("Ow", "", "endthescene")
		
	if(state == "leaving"):
		playAnimation(StageScene.Duo, "stand", {npc="rush"})
		saynn("He does raise a valid point. Or maybe you just don't want your body parts, external [i]or[/i] internal, rearranged. Either way, you leave before he does something you regret.")
		
		saynn("[say=rush]Alrigh', well see ya around pipsqueak! Y'know where t' find me![/say]")
		
		saynn("Weirdly enough, he sounds as if he means that as an actual invitation.")
		
		addButton("Retreat", "", "endthescene")


func _react(_action: String, _args):
	if(_action == "put_em_up"):
		runScene("FightScene", ["rush"], "boxing")
		return
		
	if(_action == "put_em_up_again"):
		runScene("FightScene", ["rush", "boxing_serious"], "boxing_serious")
		return
		
	if(_action == "get_fucked_check"):
		GM.pc.addLust(50)
		var anus: Orifice = GM.pc.getBodypart(BodypartSlot.Anus).getOrifice()
		anus.setLooseness(anus.getLooseness() + 1.0)
		if(anus.getLooseness() > 3.0 and anus.getComfortableInsertion() > 25.0):
			_action = "get_fucked_pass"
		else:
			_action = "get_fucked_fail"
			
	if(_action == "get_fucked_pass"):
		var anus: Orifice = GM.pc.getBodypart(BodypartSlot.Anus).getOrifice()
		if(not (anus.getLooseness() > 3.0 and anus.getComfortableInsertion() > 25.0)):
			GM.pc.doPainfullyStretchHole(BodypartSlot.Anus, "rush")
			
	if(_action == "get_fucked_orgasm"):
		GM.pc.gotAnusFuckedBy("rush")
		GM.pc.cummedInAnusBy("rush")
		GM.pc.orgasmFrom("rush")
		GM.pc.addSkillExperience(Skill.SexSlave, 50)
		
	if(_action == "get_fucked_after"):
		setFlag("HypnokinkModule.RushDealStruckAtLeastOnce", true)
		setFlag("HypnokinkModule.OnTheHouseSessions", RNG.randi_range(1,3))
		
	if(_action == "debug_fight"):
		runScene("FightScene", ["rush"], "guardfight")
		return
		
	if(_action == "debug_sex"):
		runScene("GenericSexScene", ["pc", "rush"], "domsex")
		return
		
	if(_action == "leave_victorious"):
		setFlag("HypnokinkModule.RushDealStruckAtLeastOnce", true)
		setFlag("HypnokinkModule.OnTheHouseSessions", RNG.randi_range(1,3))
		
	if(_action == "drag_rush"):
		endScene()
		GM.pc.setLocation("cellblock_lilac_nearcell")
		aimCamera("cellblock_lilac_nearcell")
		runScene("VionSolvesRush")
		return
		
	if(_action == "if_lost_serious_2"):
		GM.pc.addEffect(StatusEffect.Wounded)
		
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
	

func _react_scene_end(_tag, _result):
	if(_tag == "boxing"):
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("if_won")
			addExperienceToPlayer(50)
		else:
			setState("if_lost")
	if(_tag == "boxing_serious"):
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("if_won_serious")
			addExperienceToPlayer(50)
			setFlag("HypnokinkModule.RushDealStruckAtLeastOnce", true)
			setFlag("HypnokinkModule.OnTheHouseSessions", RNG.randi_range(1,3))
		else:
			setState("if_lost_serious")
		
