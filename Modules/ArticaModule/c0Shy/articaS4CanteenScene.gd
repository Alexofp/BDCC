extends SceneBase

func _init():
	sceneID = "articaS4CanteenScene"

func _run():
	if(state == ""):
		addCharacter("artica")
		playAnimation(StageScene.Solo, "sit", {pc="artica"})
		saynn("You pay the canteen a visit and notice Artica, the bright white fluff. She is occupying the same bench in the corner, probably nomming away, the hunger forcing her to adapt to this new lifestyle.")

		saynn("Might as well see what's up, you grab a usual prisoner meal and head towards her table.")

		addButton("Greet and sit", "See what's up", "sit_near_artica")
	if(state == "sit_near_artica"):
		playAnimation(StageScene.Duo, "sit", {npc="artica", npcAction="sit"})
		saynn("Artica seems to be busy playing with the buttons on her lilac shirt.")

		saynn("[say=pc]Hey there. May I?[/say]")

		saynn("But when she hears you, she quickly buttons her shirt up and nods.")

		saynn("[say=artica]Oh.. Sure.[/say]")

		saynn("You sit on the bench on the other side of the table and put the metal tray onto it.")

		saynn("[say=pc]How goes it?[/say]")

		saynn("Artica tugs on her collar a bit.")

		saynn("[say=pc]Sits way too tight, doesn't it?[/say]")

		saynn("[say=artica]Yeah..[/say]")

		saynn("Still not very wordy. But she does eat the paste a little more eagerly than before. You do the same, just consuming your meal.")

		saynn("[say=artica]But it's okay. Mmhm..[/say]")

		saynn("She fidgets a little on her butt, her toes curling up.")

		saynn("[say=artica]And how is.. mm-m.. you?[/say]")

		saynn("Her big eyes watch you, waiting for an answer, ready to give up any second.")

		addButton("Average", "Not great but also not terrible", "say_average")
		addButton("Horny as fuck", "Tell her that you're quite horny", "say_horny")
		addButton("Contented", "Tell her that a nice company makes any day better", "say_contented")
	if(state == "say_average"):
		saynn("[say=pc]You know, just average. Not great, not terrible.[/say]")

		saynn("Artica nods and quickly lowers her gaze, back to nomming away.")

		saynn("[say=pc]But thank you for asking.[/say]")

		saynn("She gives you a quick little smile.")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "say_horny"):
		if (GM.pc.hasReachablePenis()):
			saynn("[say=pc]Horny as fuck. Been searching for some good slutty holes to fill, balls have been aching all day, you know?[/say]")

		elif (GM.pc.hasReachableVagina()):
			saynn("[say=pc]Horny as fuck. My pussy is feeling so-o needy for some good action, I've been wet all day, you know?[/say]")

		else:
			saynn("[say=pc]Horny as fuck. My butt is feeling so-o need for some good action, you know?[/say]")

		saynn("Artica hears that.. and starts blinking many times, her cheeks blushing deeply. Under the table her hind paws are standing on the toes, her fluffy tail curling around her waist.")

		saynn("[say=artica]Oh.. I.. I-I see..[/say]")

		saynn("It's so cute to see her struggle to find where to place her tail, paws and gaze.")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "say_contented"):
		saynn("[say=pc]I would say that I'm pretty content. A nice company certainly makes any day better.[/say]")

		saynn("Artica nods at first.. but then realizes something and blushes slightly.")

		saynn("[say=artica]I.. I see..[/say]")

		saynn("Better not to push her too much probably.")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "ask_menu"):
		saynn("What do you wanna ask her?")

		addButton("Crimes?", "Ask what Artica did to end up here", "ask_crime")
		addButton("Unique colors", "Ask Artica about her fur", "ask_colors")
		addButton("Piercings", "Comment on Artica's piercings", "ask_piercings")
		addButton("Enough chat", "Enough chat for today", "enough_chat")
	if(state == "ask_crime"):
		saynn("Being so incredibly shy, you can't help but to wonder how did she end up here in this place?")

		saynn("[say=pc]What are you in for? I'm curious.[/say]")

		saynn("The girl keeps her gaze low.")

		saynn("[say=artica]Um.. s.s-stuff.. m..[/say]")

		saynn("Her stuttering returns. Maybe you can help her a bit.")

		saynn("[say=pc]Did you kill someone? Rob? Fuck against their will? Prostitute your body? Most of the inmates here did some bad stuff, don't worry.[/say]")

		saynn("Artica shrugs.. shakes her head.. tilts it.. rubs her nose.. fixes her short hair with her paw.. her tail curls her waist the opposite way.. her toes get sprawled wide.")

		saynn("[say=artica]No.. None of that..[/say]")

		saynn("Even though she doesn't say much, the girl is sure very.. animated.")

		saynn("Looks like she didn't do anything super criminal. But her shyness clearly prevents her from opening up.")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "ask_colors"):
		saynn("[say=pc]Your fur has some unique colors for a..[/say]")

		saynn("You're not really sure if she is a wolf.. a fox.. just a canine?")

		saynn("[say=pc]Khm..[/say]")

		saynn("[say=artica]..Jogauni.[/say]")

		saynn("Artica chrrrs quietly.")

		saynn("[say=pc]Jogauni, huh. Fascinating. Never heard of that species.[/say]")

		saynn("She looks down at her hands, the little thingie attached to her ear wobbles a bit as she does that.")

		saynn("[say=artica]We're not very.. tech savvy.. Just quietly living in our.. world..[/say]")

		saynn("But now she is here, on a space station that's drifting through open space, far away from her home.")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "ask_piercings"):
		saynn("[say=pc]Gotta say, I like your piercings. Is that a little dream catcher on your ear?[/say]")

		saynn("Artica chrrrrs quietly as she sways from side to side, letting the thingie dangle.")

		saynn("[say=artica]Yeah.. it protects.. against bad dreams..[/say]")

		saynn("Didn't protect her against this one, sadly.")

		addButton("Continue", "See what happens next", "ask_menu")
	if(state == "enough_chat"):
		playAnimation(StageScene.Duo, "stand", {npc="artica", npcAction="sit"})
		saynn("After chatting for a bit, you and Artica just focus on finishing your meals. You get up and put the metal trays away.")

		saynn("[say=pc]Well, see you around, Artica.[/say]")

		saynn("[say=artica]See you..[/say]")

		saynn("It feels like you made a lot of progress helping her acclimate. Maybe you can continue tomorrow.")

		saynn("You head towards the exit when you suddenly hear..")

		saynn("[say=artica]E..eep!..[/say]")

		addButton("Turn around", "See what happened", "risha_bullies_artica")
	if(state == "risha_bullies_artica"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "hurt", {npc="risha", pc="artica", bodyState={leashedBy="risha"}})
		saynn("[say=risha]What, you thought you could hide here? Little brat.[/say]")

		saynn("You turn around and see Artica getting pulled away from the table by a leash that is clipped to her collar. On the other end of it.. that big cat.")

		saynn("[say=artica]S-s.. n-nn.. h.h..[/say]")

		saynn("[say=risha]Use your words, slut. I warned you. And you didn't listen. Guess you will have to pull a double shift in the mines to make up for it.[/say]")

		saynn("Looks like Artica is in trouble for not working the mines.")

		addButton("Just leave", "She did have it coming after all..", "just_leave")
		addButton("Protect", "Protect Artica against the guard", "protect_artica")
		addButton("Offer self", "Offer to go work in the mines instead of Artica", "offer_self")
	if(state == "just_leave"):
		playAnimation(StageScene.Duo, "walk", {npc="risha", flipNPC=true, npcAction="walk", pc="artica", bodyState={leashedBy="risha"}})
		saynn("Well, why would you go against the prison's staff.. it would only lead to a harsher punishment in the end.")

		saynn("So you just watch as the big cat pulls Artica away towards the mineshafts.")

		saynn("Oh well.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "protect_artica"):
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("You block the path. The guard sees that and hums.")

		saynn("[say=risha]Move out of the way, inmate. Unless you want to share the same fate as this lazy bitch.[/say]")

		saynn("You don't budge.")

		saynn("[say=risha]Oh, I see. Right.[/say]")

		saynn("She quickly reaches for her stun baton.")

		saynn("[say=risha]I will never get tired of this, you know. Showing sluts like you their place is my favorite activity.[/say]")

		saynn("Looks like it's a fight.")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "won_risha"):
		playAnimation(StageScene.Duo, "stand", {npc="risha", npcAction="defeat"})
		saynn("The guard hits the floor, defeated.")

		saynn("[say=risha]Grh..[/say]")

		saynn("[say=pc]Now say sorry to Artica.[/say]")

		saynn("Big cat spits in your direction. Artica stands away from the fight, holding onto the leash that is still attached to her collar.")

		saynn("[say=risha]Pff. Can't protect that girl forever, her soft paws will have to get a good grip on a tool eventually. You're all slaves. But you really want to make it worse for her, don't you?[/say]")

		saynn("You kick the guard, making her grunt.")

		saynn("[say=pc]It's you who is asking for more.[/say]")

		saynn("[say=risha]You're so weak. Pathetic.[/say]")

		saynn("Her words anger you so much that you kick the guard's crotch, making her yelp and collapse onto the floor.")

		saynn("[say=risha]ARGH! You BITCH!..[/say]")

		saynn("[say=pc]Nuh uh. Say it.[/say]")

		saynn("The guard glares at Artica.")

		saynn("[say=risha]Ugh. Sorry for being so evil. I will change and treat you oh so nicely now.[/say]")

		saynn("Good enough..")

		saynn("[say=pc]Now go away.[/say]")

		addButton("Continue", "See what happens next", "won_risha_left")
	if(state == "won_risha_left"):
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("The guard grumbles as she picks herself up and stumbles away, leaving the canteen.")

		saynn("You look around.. and see lots of eyes on you. Feels kinda nice to fight the system.")

		saynn("Artica stands in the corner. You walk up to her and help detach the leash from her collar.")

		saynn("[say=artica]..thanks.. a lot.. mm-m..[/say]")

		saynn("[say=pc]Don't mention it.[/say]")

		saynn("She inhales, trying to gather enough courage to tell you something.")

		saynn("[say=artica]..I think it was a mistake.. hiding.. I will go down to the mines..[/say]")

		saynn("[say=pc]Huh? You don't have to now.[/say]")

		saynn("Artica stands high on her toes, her digits interlocked.")

		saynn("[say=artica]..I think it's best.. that I.. I try?.. To avoid m.m-more problems..[/say]")

		saynn("You nod. It's her decision after all.")

		saynn("[say=artica]T-thank you..[/say]")

		saynn("Artica lowers her gaze and walks past you, heading towards the lift.")

		saynn("You can probably find her here tomorrow.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "lost_risha"):
		playAnimation(StageScene.Duo, "defeat", {npc="risha", bodyState={leashedBy="risha"}})
		saynn("You drop to your knees, unable to continue fighting.")

		saynn("[say=risha]There you go. That's what too much whoring around does to you. Can't even stand on your feet anymore.[/say]")

		saynn("The guard walks up to you and quickly clips a leash to your collar. Then she grabs Artica's leash too.")

		saynn("[say=risha]Let's go, ladies. Today you will slave away in the mines until the night comes.[/say]")

		addButton("Follow..", "Time to pay for your mistakes", "lost_works_in_mines")
	if(state == "lost_works_in_mines"):
		aimCameraAndSetLocName("mining_shafts_entering")
		GM.pc.setLocation("mining_shafts_entering")
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("The guard brings you and Artica down to the mines.")

		saynn("You two are given pickaxes.. that you start hitting rocks with.")

		saynn("The cat wasn't lying, she didn't let you stop until the day had ended..")

		saynn("And it only counted as a single shift.. meaning.. It's worth only a single work credit.")

		saynn("By the end of it.. your and Artica's exhaustion has no limits.")

		saynn("But at least now you're free.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "offer_self"):
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("You block the path for them.")

		saynn("[say=risha]Move away, inmate, don't waste my time.[/say]")

		saynn("[say=pc]Let her go. I'm gonna work in the mines instead.[/say]")

		saynn("The big feline tilts her head and raises a brow.. before a little smirk appears on her face.")

		saynn("[say=risha]That's very heroic, wo-o-ow.[/say]")

		saynn("She looks behind her, at leashed Artica, who is tippy-toeing around on the spot, her sad eyes looking hopeful.")

		saynn("[say=risha]You know what, fine.[/say]")

		saynn("That was easy.")

		saynn("[say=risha]The shy sofite will work one shift.[/say]")

		saynn("She points at you.")

		saynn("[say=risha]And you will also work one shift. That makes two.[/say]")

		saynn("Not exactly the most generous offer. But at least she can do math.")

		saynn("[say=pc]Really? I can do both shifts, let her go.[/say]")

		saynn("Cat chuckles.")

		saynn("[say=risha]Try me. It's this or go away. I mean, I can also let the lilac slut serve as my cock sleeve for a few hours.[/say]")

		saynn("Lynx winks at Artica.")

		saynn("[say=pc]Whatever, let's go.[/say]")

		saynn("[say=risha]Aww. Some other time then, sweetie. For now you have your nobel protector to have fun with.[/say]")

		addButton("Follow", "Go to the mines with the guard", "work_in_mines_willingly")
	if(state == "work_in_mines_willingly"):
		aimCameraAndSetLocName("mining_shafts_entering")
		GM.pc.setLocation("mining_shafts_entering")
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("You and Artica arrive at the mineshaft. You show her where to get the tools, where you put the ore, what rocks to smash.")

		saynn("After that.. comes many hours of hard work.")

		saynn("By the end of it.. your and Artica's exhaustion has no limits.")

		saynn("But at least now you're free. And also one credit richer each.")

		saynn("[say=artica]Is.. one work credit a lot?[/say]")

		saynn("[say=pc]Not really, no.[/say]")

		saynn("[say=artica]..aw..[/say]")

		saynn("She seems too tired to say or do anything else. So you just show her how to get back to the cellblock.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sit_near_artica"):
		processTime(3*60)

	if(_action == "say_average"):
		getModule("ArticaModule").removeShy(0.05)

	if(_action == "say_horny"):
		getModule("ArticaModule").removeShy(0.15)

	if(_action == "say_contented"):
		getModule("ArticaModule").removeShy(0.1)

	if(_action == "enough_chat"):
		processTime(25*60)
		GM.pc.addPain(-50)
		GM.pc.addStamina(50)

	if(_action == "risha_bullies_artica"):
		processTime(5*60)

	if(_action == "just_leave"):
		setFlag("ArticaModule.s4Outcome", "left")

	if(_action == "offer_self"):
		setFlag("ArticaModule.s4Outcome", "offerself")

	if(_action == "start_fight"):
		runScene("FightScene", ["risha"], "rishaFight")
		return

	if(_action == "won_risha_left"):
		processTime(3*60)

	if(_action == "lost_works_in_mines"):
		GM.main.processTimeUntil(23*60*60)
		GM.pc.addCredits(1)
		GM.pc.addStamina(-500)

	if(_action == "work_in_mines_willingly"):
		processTime(5*60*60)
		GM.pc.addStamina(-50)
		GM.pc.addCredits(1)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "rishaFight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_risha")
			addExperienceToPlayer(50)
			setFlag("ArticaModule.s4Outcome", "won")
			getModule("ArticaModule").removeShy(0.05)
		else:
			setState("lost_risha")
			addExperienceToPlayer(5)
			setFlag("ArticaModule.s4Outcome", "lost")
