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
		playAnimation(StageScene.SexFisting, "tease", {pc="pc", npc="avy", npcBodyState={naked=true, hard=true}})
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
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcAction="kneel", npcBodyState={naked=true, hard=true}})
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
	if(state == "enough_start"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcBodyState={naked=true, hard=true}})
		saynn("You give the foxy a few pats on the head. She doesn't seem to mind.")

		saynn("[say=pc]Good. That should be enough for today.[/say]")

		saynn("You begin to take off her blindfold and uncuff her paws.")

		saynn("[say=avy]..this is it?..[/say]")

		saynn("[say=pc]You want more, huh?[/say]")

		saynn("You get behind her and grab the base of her buttplug, tugging on it.")

		saynn("[say=avy]Eek.. mhh..[/say]")

		saynn("One of your hands gropes her fluffy butt while the other one tugs on the plug more, making it shift inside Avy's ass back and forth, loosening it, making the muscles relax.")

		saynn("[say=pc]Still want more?[/say]")

		saynn("[say=avy]..fuck you.. p-pull it out already.[/say]")

		saynn("And so you do, yanking the buttplug out with a satisfying wet 'plop'. The action makes Avy arch her back.")

		saynn("[say=avy]Ah!..[/say]")

		saynn("You give her ass a smack after that.")

		saynn("[say=pc]Good little slut.[/say]")

		saynn("She growls softly.")

		saynn("[say=avy]Grr.. I dare you to say that again. I will break you in half.[/say]")

		saynn("You move the buttplug to Avy's hard cock and catch some of her precum onto it before moving it close to her face, making sure she sees it.. and the thick bead of pre that's hanging off of it too. Her cheeks blush.")

		saynn("[say=pc]Avy, you are a slut. I can say that as many times as you want.[/say]")

		saynn("[say=avy]Hff.. fuck you.[/say]")

		saynn("You nod.")

		saynn("Avy grabs her clothes and starts putting them on. Her shorts are still bulging.")

		saynn("Looks like the fun is over indeed.")

		addButton("Continue", "See what happens next", "endscene_back")
	if(state == "pussylick"):
		playAnimation(StageScene.ChairOral, "tease", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You get a chair and put it near Avy.. before taking a seat. Then you part your thighs slightly, exposing your wet, needy pussy slit to the dim light.")

		saynn("Avy tilts her head slightly, her ears turning, trying to figure out what is happening. Her nostrils flare, catching your scent. Her jaw tightens.")

		saynn("[say=avy]..that's your cunt, isn't it?[/say]")

		saynn("[say=pc]Smart girl. Now get to work.[/say]")

		saynn("She huffs, turning her face away.")

		saynn("[say=avy]Fuck no.. I'm not gonna lick you out.[/say]")

		saynn("[say=pc]Avy. I didn't ask.[/say]")

		saynn("[say=avy]I don't care, I'm not a whore.[/say]")

		saynn("She shifts uncomfortably on her knees, the plug is still inside her, making her do so.")

		saynn("You catch her chin.")

		saynn("[say=pc]At this very moment, you are a whore. My whore. And you're going to do what I say.[/say]")

		saynn("She escapes your chin grip.. so you grab a fistful of her hairs instead. She helps as you yank her head forward, forcing her face inches from your slit.")

		saynn("[say=pc]If you want this to end, say it now.[/say]")

		saynn("You wait a few seconds, giving her all the time in the world to answer. But there is no reaction, Avy just growls softly.")

		saynn("[say=pc]Open your mouth.[/say]")

		saynn("[say=avy]..You're an asshole.[/say]")

		saynn("[say=pc]I know. Open.[/say]")

		saynn("Slowly, reluctantly, her jaw unclenches. Her lips part just a crack.. but her fangs are already showing.")

		saynn("You guide her face closer, pressing her mouth against your folds. She flinches at the contact.")

		saynn("[say=pc]Lick.[/say]")

		saynn("She hesitates.. so you tighten your grip on her hair.")

		saynn("[say=avy]..fine.[/say]")

		saynn("Her tongue darts, doing a quick, flat lick across your outer lips, barely applying any pressure.")

		saynn("[say=pc]Continue.[/say]")

		saynn("She does it again, dragging her tongue along your slit a few times. She does it quite awkwardly. It's clear that she has no idea what she is doing.")

		saynn("[say=avy]..this is so fucking weird.[/say]")

		saynn("[say=pc]You're doing fine. Keep going.[/say]")

		saynn("She presses her tongue against your clit, giving it a slow, stiff lick. You try to grind against her.. but she pulls back slightly, confused and annoyed.")

		saynn("[say=avy]I can't.. I just can't do this.. I'm not a fucking whore, okay?..[/say]")

		saynn("She shakes her head, turning away again. Her cheeks are burning red.")

		saynn("[say=pc]Avy. Look at me.[/say]")

		saynn("She can't, she is blindfolded. But she does turn her head toward you.")

		saynn("[say=pc]You're gonna stop whining like a stupid bitch.. and you're gonna do exactly what I tell you to do, like a proper fucking whore. Do you hear me?[/say]")

		saynn("Her breath catches. Her ears flatten as she does a subtle nod.")

		saynn("[say=pc]Good. I'm not gonna make you do something that you can't do.[/say]")

		saynn("You shift the chair closer and put both of your hands on the sides of her head, trapping her in your grip.")

		saynn("[say=pc]Stick your tongue out.[/say]")

		saynn("She complies, her tongue revealing itself, resting on her lower lip.")

		addButton("Continue", "See what happens next", "pussylick_do")
	if(state == "pussylick_do"):
		playAnimation(StageScene.ChairOral, "lick", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You pull her forward, pressing her tongue against your slit. The warmth of her mouth begins to spread across your folds.")

		saynn("[say=pc]Now move your tongue. Up and down. All the way from my hole to my clit.[/say]")

		saynn("After a second of delay, she obeys, dragging her tongue upward slowly. The motion is shaky.. but she is trying. Her tongue slides against your slick flesh, catching on your folds. It actually feels somewhat nice.")

		saynn("[say=pc]That's it. Good little whore. Lick deeper.[/say]")

		saynn("You press her face harder against you, making her tongue dip into your pussy entrance. She makes a small, surprised yip but keeps going, lapping awkwardly at your hole.")

		saynn("[say=pc]Now put some focus on my clit. Right here.[/say]")

		saynn("You guide her head until her tongue finds your sensitive bud. You shiver as she gives it a lick and a gentle suck.")

		saynn("[say=pc]Keep doing that.. Fast.[/say]")

		saynn("She obeys, flicking her tongue against your clit. A quiet moan escapes you.. your body squirms slightly under her.")

		saynn("It feels good.. but you want more..")

		saynn("[say=pc]Mmhh.. good.. gonna grind your face, try to keep up.[/say]")

		saynn("[say=avy]Mm-?..[/say]")

		addButton("Continue", "See what happens next", "pussylick_fast")
	if(state == "pussylick_fast"):
		playAnimation(StageScene.ChairOral, "lickfast", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You get a better grip and begin to shove her face into your crotch more, your pussy grinding against her lips and snout.")

		saynn("[say=pc]Mhh.. keep your tongue out, you dirty slut..[/say]")

		saynn("You move your hips, meeting her motions. She still tries to lap away at your folds, her tongue swirling and prodding.. awkwardly but desperately. Her cock is leaking pre, twitching each time you moan.")

		saynn("You feel the orgasm building in you.. your muscles tightening..")

		saynn("[say=pc]I'm close.. ah.. don't stop.. don't you fucking stop.[/say]")

		saynn("She doesn't, her tongue works furiously, her lips sucking on your clit when she can, her nose pressing against your mound, drowning in your juices. Her face is all wet with your scent, her blindfold too..")

		saynn("[say=pc]Fuck.. Avy.. I'm gonna..[/say]")

		saynn("You let out a cry of pleasure as your orgasm crashes through you. Your hips grinding against her mouth as multiple waves of ecstasy roll through your body. Your pussy pulses and squirts, shooting a fountain of juices into Avy's mouth.")

		saynn("The foxy swallows what she can.. and keeps licking, lapping up everything you give her. You throw your head back and moan into the air.")

		saynn("[say=pc]Ah.. f-fuck..[/say]")

		saynn("A few more waves.. leave you shivering.")

		addButton("Continue", "See what happens next", "pussylick_after")
		addButtonWithChecks("Mark her..", "Might as well try to mark her with your different scent too..", "pussylick_watersports", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])
	if(state == "pussylick_watersports"):
		playAnimation(StageScene.ChairOral, "tease", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You decide to be a bit.. mischievous. You got Avy right there, between your legs, pressed against your slit.. Why not take advantage of that.")

		saynn("And so when you begin coming down from your orgasm, your grip on Avy's head doesn't loosen. Instead, you keep her in that position for a while longer.")

		saynn("[say=avy]Mmhhh-?[/say]")

		saynn("You wait for the urge to come.. and then just let go..")

		saynn("[say=avy]MHH-H!![/say]")

		saynn("A stream of your golden piss hits Avy's tongue. You moan as Avy is thrashing beneath you, doing her best to pull away.")

		saynn("You empty some of your bladder into her mouth and onto her face.. but she manages to break free and pull away. You cut the stream short..")

		saynn("She coughs and makes noises like she is about to puke.")

		saynn("[say=avy]KGhh! B-BITCH!.. Kgh.. what the fuck are you doing.. you're stupid.. fucking.. blergh..[/say]")

		saynn("[say=pc]My bad. I just thought that you'd make the perfect urinal.[/say]")

		saynn("She growls and thrashes against her cuffs, trying to shake off her blindfold too.")

		saynn("[say=avy]Fuck you.. f-fuck you..[/say]")

		saynn("[say=pc]Chill. I see that you don't like it.[/say]")

		saynn("[say=avy]Don't like it?! I fucking hated it! Take this shit off me![/say]")

		saynn("[say=pc]Fine.[/say]")

		saynn("As you unlock her cuffs, Avy shoves you away and rips her blindfold off before storming away, her clothes in her paws.")

		saynn("[say=avy]Next time.. At least fucking ask.. you stupid bitch..[/say]")

		saynn("Oh well. She deserved it. At least you still marked her a bit.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "pussylick_after"):
		playAnimation(StageScene.ChairOral, "tease", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("When you finally relax, your grip on Avy's head loosens. She pulls back when that happens, gasping for air. Her face is covered in your juices.")

		saynn("You take off her blindfold, uncovering her dazed eyes. She is a complete mess, panting heavily while unable to focus on anything. Her tongue is out and drooling, her cheeks glowing red.")

		saynn("[say=pc]..good girl.[/say]")

		saynn("All she can do is weakly bump her forehead against your leg.")

		saynn("[say=avy]..gr..[/say]")

		saynn("Despite her attempts at growling, she lets you pat her and scritch behind the ears.")

		saynn("[say=pc]Such a good girl.[/say]")

		saynn("[say=avy]..mhh..[/say]")

		saynn("She is swaying left and right, still trying to recover her breath. Looking down, you see a huge puddle of her pre on the concrete. She sure enjoyed it too.")

		addButton("Enough", "Time to wrap up now", "bj_wrapup")
		addButton("Stroke her cock", "Help Avy cum as a reward", "helpAvyCum")
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

		saynn("Her breath catches. Her ears flatten as she does a subtle nod.")

		saynn("[say=pc]Good. I'm not gonna make you do something that you can't do.[/say]")

		saynn("You shift the chair closer and put both of your hands on the sides of her head, trapping her in your grip.")

		saynn("[say=pc]Open wide.[/say]")

		saynn("Avy complies, her jaw dropping open, the tongue resting on her teeth.")

		addButton("Continue", "See what happens next", "bj_in")
	if(state == "bj_in"):
		playAnimation(StageScene.ChairOral, "suckinside", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You push her head onto your cock, letting the tip go past her lips.. but not too deep. She makes a small yip.")

		saynn("[say=pc]Now use your tongue. Lick the underside. And suck.[/say]")

		saynn("She obeys, doing it awkwardly.. but at least she is trying. Her tongue begins sliding along your shaft. Her lips close around your member as she does a small bob of her head, her mouth producing a wet, sucking noise.")

		saynn("[say=pc]That's it. Good little whore. More.[/say]")

		saynn("You start to guide her head, pulling her deeper onto your dick each time. Avy suddenly gags as you hit the back of her throat.. but you hold her there for a second before pulling back.")

		saynn("[say=avy]Ghk.. f-fuck..[/say]")

		saynn("[say=pc]Breathe through your nose. But even if you start choking or gagging, just let it happen. It makes your throat clench which feels really fucking good for me.[/say]")

		saynn("[say=avy]..I know..[/say]")

		saynn("You push her again, a little deeper. Her throat opens more.. and lets the tip of your cock down it.. her inner walls hugging you so well. Saliva starts to drip down her chin while she keeps using her tongue, sliding it under your shaft and curling around it a bit.")

		saynn("[say=pc]That's it. Good little slut. Taking it so well.[/say]")

		saynn("You pull her close again, more of your member going down her throat, really testing her. Avy's eyes are getting wet behind the blindfold. After a few seconds, she starts choking again, her nostrils flaring, her throat getting so tight that you groan.")

		saynn("[say=pc]Mhh.. good.. I'm gonna fuck your throat, try to keep up.[/say]")

		saynn("[say=avy]Hh-hh-..? KHgh-h![/say]")

		addButton("Continue", "See what happens next", "bj_fast")
	if(state == "bj_fast"):
		addCharacter("kait")
		playAnimation(StageScene.ChairOral, "suckfast", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("Using that grip on Avy's head, you start sliding it along your length, going back and forth, thrusting shallowly at first but quickly picking up the pace and forcing her to deepthroat you.")

		saynn("She is quick to start gagging with each push, her wet slurps and stifled grunts vibrate against your dick, sending jolts of pleasure through you.")

		saynn("You feel some resistance from her, Avy is trying to pull away. But she can't, not while she is cuffed and blindfolded.")

		saynn("[say=pc]Stop fighting it, just choke, like a dirty whore. You have a mouth full of cock, your drool is everywhere, this is exactly what you needed.[/say]")

		saynn("Surprisingly, her resistance begins to fade. Your little slut just keeps enduring your onslaught, her tongue works clumsily but desperately, trying to please you.")

		saynn("Sometimes, you pull back and slow, letting her gasp for air. But then you always push back in, burying your cock deep inside that tight throat. Looking from the side, her throat bulges on each thrust. She gags hard.. but you hold her there, letting her struggle. Then you give her some rest.")

		saynn("[say=pc]Breathe.[/say]")

		saynn("She inhales sharply through her nose, her chest moving fast. Her body is shaking.. but she is staying still, letting you use her.")

		saynn("You start to fuck her mouth again, pulling her head along her length.")

		saynn("And that's when Kait walks in..")

		saynn("[say=kait]I heard a.. ohh..[/say]")

		saynn("You shake your head softly at her.")

		saynn("[say=pc]Tshh..[/say]")

		saynn("It looks like Avy didn't hear any of that.. she is too busy sucking you off.")

		saynn("Kait approaches you two, slowly and quietly, her smug expression says it all. She bites her lip as she watches Avy choke.")

		saynn("During the next resting period, you actually pull your hands away from Avy's head, letting her do everything by itself. Avy just keeps going, her tongue sliding along your shaft, her lips sucking on the tip.")

		saynn("[say=pc]You're such a good little cockslut, Avy.[/say]")

		saynn("[say=avy]Mrr..[/say]")

		saynn("That's when Kait suddenly starts patting the blindfolded foxy, using her hands to scritch behind her ears.")

		saynn("[say=pc]Very good. I'm pretty close now.[/say]")

		saynn("Kait smiles.. and suddenly starts pushing Avy's head, same way that you did before. The snow leopard is forcing Avy to go deeper and deeper on your {pc.penis}.. until her snout starts hitting your crotch.")

		saynn("The way her throat clenches.. it makes you moan and pant. You're gonna cum any second now.")

		saynn("Avy is whining.. but not fighting it. Her hips are shifting a lot, her own cock twitching and leaking pre onto the concrete.")

		saynn("This is it..")

		addButton("Continue", "See what happens next", "bj_cum")
	if(state == "bj_cum"):
		playAnimation(StageScene.ChairOral, "suckinside", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]Fuck.. I'm gonna..[/say]")

		saynn("Kait is quick to force Avy's head down onto your cock until her nose is pressed flush against your crotch again. You don't even finish the sentence before your member starts throbbing.. And then.. shooting the first hot jet of {pc.cum} down her throat!")

		saynn("Avy gags hard, her whole body convulsing.. but Kait holds her in place.")

		saynn("[say=avy]MMMPH-![/say]")

		saynn("More spurts follow, thick and heavy. Avy's throat works frantically, clenching and trying to swallow. Her nostrils flare, sucking in desperate breaths.. before suddenly snorting, your seed leaking out through her nose as she chokes!")

		saynn("[say=pc]Fuck.. take it all..[/say]")

		saynn("Your hips are jerking with each spasm. Avy's muffled whines vibrate against you.. her tongue is still moving, trying to lap at your shaft even as she struggles to breathe.")

		saynn("Kait's smug smile couldn't be any more wide, her fingers scritching behind Avy's ears.")

		saynn("Avy's body trembles violently, tears streaming from under her blindfold. Drool and your jizz mix together and drip off of her chin, pooling on her chest..")

		saynn("After Kait helps drain your balls, she offers you a cute blep.. before running away fast!")

		addButton("Continue", "See what happens next", "bj_after")
		addButtonWithChecks("Mark her..", "Might as well try to mark her with your different scent too..", "bj_watersports", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])
	if(state == "bj_watersports"):
		playAnimation(StageScene.ChairOral, "tease", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("With nobody pushing Avy's head anymore, she escapes your messy cock! She starts gasping and coughing a lot, your seed trickling from her nostrils.")

		saynn("Then.. you decide to be a bit.. mischievous. You got Avy right there, between your legs, under your cock.. Why not take advantage of that.")

		saynn("And so when you begin coming down from your orgasm, you get a grip on Avy's head again, your hand on the back of her head. Instead of letting her go, you keep her in that position for a while longer.")

		saynn("[say=avy]Huh-?[/say]")

		saynn("You wait for the urge to come.. and then just let go..")

		saynn("[say=avy]MHH-H!![/say]")

		saynn("A stream of your golden piss hits Avy's tongue. You moan as Avy is thrashing beneath you, doing her best to pull away.")

		saynn("You empty some of your bladder into her mouth and onto her face.. but she manages to break free and pull away. You cut the stream short..")

		saynn("She coughs and makes noises like she is about to puke.")

		saynn("[say=avy]KGhh! B-BITCH!.. Kgh.. what the fuck are you doing.. you're stupid.. fucking.. blergh..[/say]")

		saynn("[say=pc]My bad. I just thought that you'd make the perfect urinal.[/say]")

		saynn("She growls and thrashes against her cuffs, trying to shake off her blindfold too.")

		saynn("[say=avy]Fuck you.. f-fuck you..[/say]")

		saynn("[say=pc]Chill. I see that you don't like it.[/say]")

		saynn("[say=avy]Don't like it?! I fucking hated it! Take this shit off me![/say]")

		saynn("[say=pc]Fine.[/say]")

		saynn("As you unlock her cuffs, Avy shoves you away and rips her blindfold off before storming away, her clothes in her paws.")

		saynn("[say=avy]Next time.. At least fucking ask.. you stupid bitch..[/say]")

		saynn("Oh well. She deserved it. At least you still marked her a bit.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "bj_after"):
		playAnimation(StageScene.ChairOral, "tease", {pc="pc", npc="avy", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		removeCharacter("kait")
		saynn("With nobody pushing Avy's head anymore, she escapes your messy cock! She starts gasping and coughing a lot, your seed trickling from her nostrils.")

		saynn("You take off her blindfold, uncovering her dazed eyes. She is a complete mess, panting heavily while unable to focus on anything. Her tongue is out and drooling, her cheeks glowing red.")

		saynn("[say=pc]..good girl.[/say]")

		saynn("All she can do is weakly bump her forehead against your leg.")

		saynn("[say=avy]..gr..[/say]")

		saynn("Her voice is hoarse from the abuse. You see that she has some of that sticky stuff on her tongue still.")

		saynn("[say=pc]Swallow, girl.[/say]")

		saynn("Avy obeys, closing her mouth and swallowing audibly.. before showing you her empty mouth.")

		saynn("[say=pc]Such a good girl.[/say]")

		saynn("[say=avy]..mhh..[/say]")

		saynn("She is swaying left and right, still trying to recover her breath. Looking down, you see a huge puddle of her pre on the concrete. She sure enjoyed it.")

		addButton("Enough", "Time to wrap up now", "bj_wrapup")
		addButton("Stroke her cock", "Help Avy cum as a reward", "helpAvyCum")
	if(state == "bj_wrapup"):
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		addCharacter("avy")
		saynn("A cute moan escapes her as you pull Avy's buttplug out.")

		saynn("[say=avy]Ah..[/say]")

		saynn("Then, you uncuff her and let her dress up. Slowly, she seems to be coming back to her senses. Her eyes don't look so spaced out anymore.")

		saynn("[say=avy]Fuck.. my throat feels so sore now. My ass as well..[/say]")

		saynn("[say=pc]I bet. You did well.[/say]")

		saynn("[say=avy]..thanks. But also, fuck you..[/say]")

		saynn("You chuckle.")

		saynn("[say=pc]Mhm. You may go now.[/say]")

		saynn("Avy squints.")

		saynn("[say=avy]I know.[/say]")

		saynn("She flexes her jaw.. and then steps out of the room.")

		addButton("Continue", "See what happens next", "endscene_back")
	if(state == "helpAvyCum"):
		playAnimation(StageScene.BreastGroping, "stroke", {pc="pc", npc="avy", npcBodyState={naked=true, hard=true}, npcCum=true})
		saynn("You decide that Avy deserves some reward for what she did today.")

		saynn("And so you drop down to the floor and approach her from behind.")

		saynn("[say=avy]Ah..[/say]")

		saynn("Your hand lands on her canine cock and starts stroking it! The foxy is quick to start squirming under your touch, passionate moans suddenly start spilling out of her maw.")

		saynn("[say=avy]Ahhh-.. ahh.. mhh.. hha.. ahh-..[/say]")

		saynn("Her knot inflates. It doesn't take long before she throws her head back and cries out a moan of pleasure. Her cock starts shooting strings of thick seed all over the floor, her balls tensing up hard!")

		saynn("You whisper into her ear.")

		saynn("[say=pc]Good girl.. give it all to me, little slut..[/say]")

		saynn("[say=avy]Ahh-hh.. f-fuck-k..[/say]")

		saynn("You keep stroking her, forcing more and more of her seed out. Poor foxy keeps squirming and panting into the air, her dick still throbbing and shooting white lines.")

		saynn("[say=pc]There we go..[/say]")

		saynn("Only when her cock stops throbbing is when you stop completely.. letting her rest.")

		saynn("Now.. it is enough for sure.")

		addButton("Enough", "Time to wrap up now", "bj_wrapup")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "avy_naked"):
		processTime(3*60)

	if(_action == "avy_cuffed"):
		putOn("avy", "blindfold")
		putOn("avy", "inmatewristcuffs")

	if(_action == "enough_start"):
		putOff("avy", "blindfold")
		putOff("avy", "inmatewristcuffs")

	if(_action == "pussylick_do"):
		processTime(3*60)

	if(_action == "pussylick_fast"):
		processTime(3*60)
		getCharacter("avy").cummedInMouthBy("pc", FluidSource.Vagina)
		GM.pc.orgasmFrom("avy")

	if(_action == "pussylick_after"):
		putOff("avy", "blindfold")

	if(_action == "pussylick_watersports"):
		getCharacter("avy").cummedOnBy("pc", FluidSource.Pissing, 0.1)
		getCharacter("avy").cummedInMouthBy("pc", FluidSource.Pissing, 0.2)
		putOff("avy", "blindfold")
		putOff("avy", "inmatewristcuffs")

	if(_action == "bj_fast"):
		processTime(5*60)

	if(_action == "bj_cum"):
		getCharacter("avy").cummedInMouthBy("pc", FluidSource.Penis)
		GM.pc.orgasmFrom("avy")

	if(_action == "bj_after"):
		putOff("avy", "blindfold")

	if(_action == "bj_watersports"):
		getCharacter("avy").cummedOnBy("pc", FluidSource.Pissing, 0.1)
		getCharacter("avy").cummedInMouthBy("pc", FluidSource.Pissing, 0.2)
		putOff("avy", "blindfold")
		putOff("avy", "inmatewristcuffs")

	if(_action == "bj_wrapup"):
		putOff("avy", "inmatewristcuffs")

	if(_action == "helpAvyCum"):
		putOff("avy", "inmatewristcuffs")

	if(_action == "endscene_back"):
		aimCameraAndSetLocName(GM.pc.getLocation())
		endScene()
		return

	setState(_action)
