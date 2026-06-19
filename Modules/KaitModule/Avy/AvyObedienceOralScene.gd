extends SceneBase

func _init():
	sceneID = "AvyObedienceOralScene"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("hideout_chill")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("[say=avy]So? What do you want? I got arena fights to manage.[/say]")

		saynn("Avy stands in the middle of the room, her arms crossed, hips tilted slightly. Her blue eyes stare at you with that very familiar mean shine.")

		saynn("[say=pc]I want you to stand still for me again.[/say]")

		saynn("She snorts, her tail flicks.")

		saynn("[say=avy]Yeah, no. That was a one-time thing. You got lucky I was in a.. dumb mood.[/say]")

		saynn("She takes a small step back, taking a defensive posture, her chin lowers ever so slightly.")

		saynn("Maybe she just needs some pressure again.")

		saynn("[say=pc]I didn't ask. I ordered you, Avy.[/say]")

		saynn("[say=avy]And I said no. What are you gonna do about it?[/say]")

		saynn("Her lips curl into a smirk.")

		saynn("You step forward, closing the distance. Avy holds her ground, chin raised high now, corners of her mouth twitching subtly.")

		saynn("[say=pc]You really wanna do this, little bitch?[/say]")

		saynn("[say=avy]Try me, fucker.[/say]")

		saynn("Now that she raised her chin.. her neck sure looks quite exposed.")

		addButton("Neck", "Put your hand on Avy's throat", "avy_throat")
	if(state == "avy_throat"):
		playAnimation(StageScene.Choking, "idle", {pc="pc", npc="avy"})
		saynn("You move faster than she expects. Your hand darts out and wraps around her throat, fingers pressing into the sides of her neck, above her collar. Not enough to cut off air.. but enough to make her feel it. Her eyes go wide.")

		saynn("[say=pc]I will get what I want, one way or around.[/say]")

		saynn("Her claws come up, gripping your wrist. They dig into your skin a bit, leaving little scratches. It hurts but you can endure it. Her breathing is getting deep.")

		saynn("Might as well give her a chance to back out now.")

		saynn("[say=pc]If you actually want me to stop, tell me now, foxy.[/say]")

		saynn("Seconds pass.")

		saynn("There is no response from Avy, just quiet growling. And yet, you feel satisfied with her answer.")

		saynn("[say=pc]Hands off me then. Unless you're craving for some oxygen deprivation.[/say]")

		saynn("You squeeze just a fraction tighter, causing Avy to lift her chin higher, her lips parting to hungrily grab some air. Her paws slowly slide off of your wrist.")

		saynn("[say=pc]Good.[/say]")

		saynn("That's one way to make her stand still. Her mean eyes are tracking yours, probably looking for any weaknesses. You're not here to show any.")

		saynn("But you do break eye contact in order to look down at her clothes.")

		saynn("[say=pc]I'm gonna undress you. Take off every piece that you have. And you're going to just let me.[/say]")

		saynn("Her jaw tightens.")

		saynn("[say=avy]The fuck you are.[/say]")

		saynn("She is being brave now.")

		saynn("[say=pc]I am. And if you try to stop me, I will rip them off then I guess. Fancy going to the laundry room naked, slut?[/say]")

		saynn("Avy swallows audibly, her gaze shaky. She doesn't answer. Might as well call her a dirty name again.")

		saynn("[say=pc]Good little slut.[/say]")

		saynn("She swallows that one too.. metaphorically.")

		saynn("One of your hands stays on her neck.. while the second one reaches out towards her shirt. Your digits begin slowly unbuttoning it, bit by bit.. revealing more and more of her fur.")

		saynn("[say=avy]..I'm gonna sink my fangs into your neck..[/say]")

		saynn("[say=pc]Do it. See what happens.[/say]")

		saynn("You let go of her throat and catch her jaw instead, your thumb pressed against her chin while the rest of your digits slip into her parted maw, now resting on her teeth and tongue. This makes her eyes go wide again.")

		saynn("[say=pc]You are gonna take everything that I do to you like the little bitch that you are.[/say]")

		saynn("Avy has no response, her top teeth gently press against your digits, her tongue occasionally touching them. Her cheeks receive a soft red tint.. her brows furrow.")

		saynn("After you're done with her shirt, you also pull down her shorts, just hooking the waistband and yanking down on it.")

		addButton("Continue", "See what happens next", "avy_naked")
	if(state == "avy_naked"):
		addCharacter("avy", ["naked"])
		playAnimation(StageScene.Choking, "idle", {pc="pc", npc="avy", npcBodyState={naked=true}})
		saynn("Avy's breasts are now exposed, dark nips shining against the dim lighting.")

		saynn("[say=pc]Look at you. Pretty tits. All for me.[/say]")

		saynn("Her sheath is visible too, the red tip of her member poking out slightly.")

		saynn("She lets you feel her sharp teeth press against your digits more, her tongue keeps poking them too, coating some in her saliva.")

		saynn("After you have undressed her, you finally free the wet digits.. and rub them dry against her breasts, making the fur there quite moist.")

		saynn("Avy closes and opens her jaw a few times, probably feeling some soreness there.")

		saynn("[say=avy]..asshole..[/say]")

		saynn("[say=pc]We will get to it. Right now I want you to put your arms behind your back. You did that already for me, shouldn't be too hard.[/say]")

		saynn("You show her some restraints.. cuffs, a blindfold.. and a buttplug. You have sourced a tube of lube too of course. Her eyes go big yet again from the sight of the last toy, corners of her lips twitching.")

		saynn("[say=avy]If you even think about shoving that thing inside me.. you will be dead.[/say]")

		saynn("Welp.. Means it will go in first then.")

		addButton("Continue", "See what happens next", "avy_buttplug")
	if(state == "avy_buttplug"):
		playAnimation(StageScene.SexFisting, "tease", {pc="pc", npc="avy", bodyState={naked=true, hard=true}})
		saynn("You get a hold on Avy's collar and yank her down to the floor, forcing her to get down on all fours.")

		saynn("[say=avy]Agh..[/say]")

		saynn("You crouch behind her and use your hands to spread her ass, pulling her fluffy tail out of the way.")

		saynn("You squeeze some lube onto your fingers and then press one against her only entrance. She flinches, gasping.")

		saynn("[say=pc]If you fight me, I will make it worse. Understand?[/say]")

		saynn("No answer.")

		saynn("You push your digit in, slowly. Her ring clenches tight.. then gives way. Her walls are hot and wet, gripping your finger.")

		saynn("[say=avy]..nhh..[/say]")

		saynn("You work your finger in and out, stretching her gradually. Her hips push back slightly. You add a second finger to the first one, making Avy squirm a bit.")

		saynn("[say=pc]Good little bitch.[/say]")

		saynn("[say=avy]..fuck you..[/say]")

		saynn("[say=pc]Right back at you.[/say]")

		saynn("You pull your fingers out and pick up the plug, coating it thoroughly with lube. You press the tip against her wet tailhole.")

		saynn("[say=pc]Deep breaths.[/say]")

		saynn("She inhales sharply.")

		saynn("You push.. the plug meets resistance.. Avy's anal ring clenching hard. And yet, you work it in slowly, making it slide past her tight star. She gasps, a stifled noise slips past her teeth. Her body squirms more.")

		saynn("The base of the buttplug meets with her buttcheeks.")

		saynn("[say=pc]There. All the way in.[/say]")

		saynn("You notice her canine cock leaving its sheath, more and more blood flowing to it, making it go hard.")

		saynn("[say=avy]Ahh.. If anyone sees.. I swear.. I will rip your guts out..[/say]")

		saynn("[say=pc]Only I will know how big of a whore you are, Avy.[/say]")

		saynn("Speaking of seeing.. You still have the blindfold and the cuffs.")

		addButton("Continue", "See what happens next", "avy_cuffed")
	if(state == "avy_cuffed"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcAction="kneel"})
		saynn("After plugging Avy's ass, you pull back on her collar, making her kneel. Then you wrench her paws behind her back and cuff them together.")

		saynn("[say=avy]..grr.. Is this really necessary..[/say]")

		saynn("[say=pc]Yes.[/say]")

		saynn("She growls but holds still, her chest moving.")

		saynn("[say=pc]Now for your eyes.[/say]")

		saynn("[say=avy]No. Fuck no.[/say]")

		saynn("[say=pc]Avy. Look at me.[/say]")

		saynn("She turns her body, meeting your eyes.")

		saynn("[say=pc]You're going to wear this. This is not a request.[/say]")

		saynn("She stares. You stare back. Finally, she lets out a sharp breath and turns forward again.")

		saynn("You tie the cloth around her eyes, making a little knot at the back of her head. She is blind now, making her completely helpless.")

		saynn("[say=pc]Perfect.[/say]")

		saynn("You admire what you did.")

		saynn("Avy is kneeling in front of you, her body trembling subtly. Her eyes are blindfolded, her wrists are cuffed.. her ass is plugged.. her cock hard.")

		addButton("Enough", "You had enough fun with her", "enough_start")
		addButtonWithChecks("Blowjob", "Make her suck you off", "bj", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Pussy licking", "Make her lick you off", "pussylick", [], [[ButtonChecks.HasReachableVagina]])
	if(state == "bj"):
		playAnimation(StageScene.ChairOral, "tease", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You get a chair and put it near Avy.. before taking a seat. Your {pc.penis} is exposed.. and quite hard from witnessing all the teasing that you did.")

		saynn("Avy tilts her head slightly, her ears turning, trying to figure out what is happening. Her nostrils flare, catching your scent. Her jaw tightens.")

		saynn("[say=avy]..is that your dick?[/say]")

		saynn("[say=pc]Smart girl. Now get to work.[/say]")

		saynn("She huffs, turning her face away.")

		saynn("[say=avy]Fuck no.. I'm not sucking your cock.[/say]")

		saynn("[say=pc]Avy. I didn't ask.[/say]")

		saynn("[say=avy]I don't care, I'm not a whore.[/say]")

		saynn("She shifts uncomfortably on her knees, the plug is still inside her, making her do so.")

		saynn("You catch her chin.")

		saynn("[say=pc]At this very moment, you are a whore. My whore. And you're going to do what I say.[/say]")

		saynn("She escapes your chin grip.. so you grab a fistful of her hairs instead. She helps as you yank her head forward, forcing her face inches from your cock.")

		saynn("[say=pc]If you want this to end, say it now.[/say]")

		saynn("You wait a few seconds, giving her all the time in the world to answer. But there is no reaction, Avy just growls softly.")

		saynn("[say=pc]Open your mouth.[/say]")

		saynn("[say=avy]..You're an asshole.[/say]")

		saynn("[say=pc]I know. Open.[/say]")

		saynn("Slowly, reluctantly, her jaw unclenches. Her lips part just a crack.")

		saynn("[say=pc]Wider.[/say]")

		saynn("She opens more, showing her fangs.")

		saynn("You guide the tip of your cock to her lips. She flinches at the contact.. but doesn't pull away.")

		saynn("[say=pc]Lick it.[/say]")

		saynn("She hesitates.. so you tighten your grip on her hair.")

		saynn("[say=avy]..fine.[/say]")

		saynn("Her tongue darts out and does a quick, small lick across the tip of your member.")

		saynn("[say=pc]Continue.[/say]")

		saynn("She does it again, this time dragging her tongue along the underside of your shaft, often sliding off. Her movements are clumsy.. She is clearly inexperienced. Makes why she was avoiding this, she has no clue what she is doing.")

		saynn("[say=avy]..this is so fucking weird.[/say]")

		saynn("[say=pc]You're doing fine. Keep going.[/say]")

		saynn("She wraps her lips around the tip, sucking it gently. Her tongue swirls awkwardly. She tries to take more.. but gags almost immediately, pulling back with a cough.")

		saynn("[say=avy]I can't.. I just can't do this.. I'm not a fucking whore, okay?..[/say]")

		saynn("She shakes her head, turning away again. Her cheeks are burning red.")

		saynn("[say=pc]Avy. Look at me.[/say]")

		saynn("She can't, she is blindfolded. But she does turn her head toward you.")

		saynn("[say=pc]You're gonna stop whining like a stupid bitch.. and you're gonna do exactly what I tell you to do, like a proper fucking whore. Do you hear me?[/say]")

		saynn("Her breath catches. Her ears flatten. A subtle nod.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "avy_naked"):
		processTime(3*60)

	if(_action == "avy_cuffed"):
		putOn("avy", "blindfold")
		putOn("avy", "inmatewristcuffs")

	setState(_action)
