extends SceneBase

var isCaged = false
var howBroken = 0.0
var npcID = ""
var hasCumInside = false

func _init():
	sceneID = "AvySlutwallScene"

func resolveCustomCharacterName(_charID):
	if(_charID == "npc"):
		return npcID

func _run():
	if(state == ""):
		isCaged = getFlag("FightClubModule.AvyGotCaged", false)
		howBroken = getFlag("FightClubModule.AvySlutWallBroken", 0.0)
		addCharacter("avy", ["naked"])
		playAnimation(StageScene.Slutwall, "idle", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}})
		saynn("Avy is stuck in the slutwall, her ass, "+str("caged up cock" if isCaged else "hard canine cock")+", tail, thighs, hands and feet are all on display. She is completely helpless, the chains keep her immobilized and the thick wall means she wouldn't even know who is using her.")

		saynn("There is a piece of cardboard above her that says 'Avy The Fallen Hero' and also a note near her that says 'Anal - FREE, condoms not allowed, break the bitch!'.")

		hasCumInside = getCharacter("avy").hasEffect(StatusEffect.HasCumInsideAnus)
		if (hasCumInside):
			saynn("{avy.AnusContents} leaking out of Avy's used fuckhole.")

		saynn("What do you wanna do?")

		if (isCaged):
			addButton("Remove cage", "Take off that cage off her dick", "take_cage_off")
		else:
			addButton("Chastity cage", "Put a cage on her dick!", "put_cage_on")
		addButton("Use Avy", "Might as well since she is here..", "use_menu")
		addButton("Watch", "Watch someone else use Avy", "do_watch")
		addButton("Free Avy", "She had enough", "ask_free")
		addButton("Leave", "Enough fun", "endthescene")
	if(state == "do_watch"):
		playAnimation(StageScene.SlutwallSex, "tease", {pc="avy", npc=npcID, bodyState={naked=true, hard=true, caged=isCaged}})
		saynn("Someone approaches Avy and is about to use her!")

		addButton("Continue", "See what happens next", "start_freeuse_npc")
	if(state == "put_cage_on"):
		playAnimation(StageScene.SlutwallSex, "tease", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}})
		saynn("Looking at that free canine cock that just doesn't wanna go soft, you get a great idea. You go ahead and pay the Announcer a quick visit before asking him for a chastity cage. He gives you one for free when he hears that it's for Avy.")

		saynn("With a sly smile on your face, you return back to the slutwall. In your hands you're holding a cute pink chastity cage that is surely a few sizes too small for Avy's cock. But that's part of the fun.")

		if (howBroken < 0.5):
			saynn("Time to do this. Avy cock is hard but at least the knot is not fully inflated so the ring part of the cage slips past it after you put some effort into it. The foxy feels that something is happening with her cock and starts thrashing against the chains.. desperately.")

			saynn("[say=avy]Hey, don't do that! Help me! I will pay you! Credits, all of them![/say]")

			saynn("She can't see you but hearing your giggling makes Avy sigh loudly.")

			saynn("[say=avy]Fuck, it's you..[/say]")

			saynn("You press the second part of the cage against the head of Avy's canine cock and begin putting more and more pressure, trying to connect it to the ring while battling her erection. Eventually you manage to do that so you just insert the little key and turn it, locking Avy's cock away and forcing it to stay in her sheath.")

			saynn("[say=avy]Ngh-h.. Fuck..[/say]")

		else:
			saynn("Time to do this. Avy cock has seen better days but it's still hard and the knot is not fully inflated so the ring part of the cage slips past it after you put some effort into it. The foxy feels that something is happening with her cock and moans loudly from the stimulation.")

			saynn("[say=avy]Ah.. You're gonna lock her cock, aren't you?..[/say]")

			saynn("She can't see you but hearing your giggling makes Avy sigh loudly.")

			saynn("[say=avy]Sluts don't need their cocks to pleasure people..[/say]")

			saynn("You press the second part of the cage against the head of Avy's canine cock and begin putting more and more pressure, trying to connect it to the ring while battling her erection. Eventually you manage to do that so you just insert the little key and turn it, locking Avy's cock away. But as soon as you do that, Avy suddenly cums, arching her back while a few weak strings of her cum squeeze through the little hole in the chastity cage.")

			saynn("[say=avy]Fu-uck.. Ah.. Shit..[/say]")

			saynn("She might be slowly getting used to the fact that she is just a slut.")

		addButton("Continue", "That was fun", "main")
	if(state == "take_cage_off"):
		playAnimation(StageScene.SlutwallSex, "tease", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}})
		if (howBroken < 0.5):
			saynn("Time to remove Avy's cage. You put one hand on her locked dick and hold it steady while the second one retrieves the key and inserts it into the keyhole and begins to turn it. Avy knows that there is only one person who has the key.")

			saynn("[say=avy]You're a bitch, you know that?..[/say]")

			saynn("[say=pc]It's like you're asking to stay caged up. Already learned to enjoy cumming from anal, slut?[/say]")

			saynn("You hear grumbling from the other side of the slutwall.")

			saynn("[say=avy]Fuck you..[/say]")

			saynn("The cage clicks as it gets unlocked, allowing Avy's canine shaft to start peeking out of the sheath more while getting hard. It's pretty even if a caged variant of it is more neat and cute.")

		else:
			saynn("Time to remove Avy's cage. You put one hand on her locked dick and hold it steady while the second one retrieves the key and inserts it into the keyhole and begins to turn it. Avy knows that there is only one person who has the key.")

			saynn("[say=avy]But.. sluts don't need their cocks..[/say]")

			saynn("[say=pc]But I need it.[/say]")

			saynn("You hear moaning from the other side of the slutwall.")

			saynn("[say=avy]Okay.. ah..[/say]")

			saynn("The cage clicks as it gets unlocked, allowing Avy's canine shaft to start peeking out of the sheath more while getting hard. It takes quite a while for her cock to become fully erected. It's like it's learning to stay soft.")

		addButton("Continue", "That went good", "main")
	if(state == "ask_free"):
		saynn("Are you sure you wanna free Avy from the slutwall? You will be able to lock her again if you challenge her for a rematch.")

		addButton("No", "She can say for a little longer", "main")
		addButton("Free Avy", "Enough slutting", "free_avy")
	if(state == "free_avy"):
		playAnimation(StageScene.Duo, "stand", {npc="avy", npcBodyState={naked=true}})
		saynn("Well, Avy had enough fun in that slutwall. Maybe it's time to free her.")

		saynn("[say=pc]I'm gonna free you, don't resist.[/say]")

		saynn("No response. Hopefully she is okay.")

		saynn("You begin by unchaining her legs and hands, freeing them and helping her put them through the holes in the wall.")

		saynn("Then you carefully pull her frame out of the big hole. Oh wow, so that's how her tits and face look. She is kinda emotionless though.")

		saynn("You help Avy get up. She doesn't even seem to be covering herself up. Well, everyone saw her asshole and cock in miniscule detail already but still. She just looks at you, intently.")

		saynn("But then she just starts walking away, probably to get her uniform.")

		saynn("[say=pc]No even a thank you?[/say]")

		saynn("[say=avy]Fuck you.[/say]")

		saynn("Oh yeah, that's the Avy you know. Mean and scary.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "use_menu"):
		saynn("You get into the queue and wait until it's your turn to have fun with Avy. How do you wanna use her?")

		addButtonWithChecks("Fuck Avy", "Use Avy's anus for your pleasure", "use_anus", [], [ButtonChecks.HasReachablePenis])
		addButtonWithChecks("Strapon Avy", "Put on a strapon and fuck Avy's anus", "strapon_anus_pick", [], [ButtonChecks.HasStraponAndCanWear])
		if (isCaged):
			addDisabledButton("Ride Avy's cock", "You can't do this while she is caged up")
		else:
			addButton("Ride Avy's cock", "Avy is stuck in the wall but you can be a little creative and still get what you need from her", "pick_ride_avy")
		addButton("Finger Avy", "Put some strain on that prostate", "finger_avy")
		if (isCaged):
			addDisabledButton("Deepthroat Avy", "You can't do this while she is caged up")
		else:
			addButtonWithChecks("Deepthroat Avy", "Might as well taste that cock while she is stuck in there..", "deepthroat_start", [], [ButtonChecks.NotOralBlocked])
		addButton("Back", "Back to the previous menu", "main")
	if(state == "strapon_anus_pick"):
		saynn("Pick which strapon you wanna use")

		addStraponButtons()
		addButton("Back", "You changed your mind", "use_menu")
		if (false):
			addButton("Nope", "You shouldn't see this", "strapon_anus_with")
	if(state == "strapon_anus_with"):
		playAnimation(StageScene.SlutwallSex, "tease", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Time to have some fun. You grab one of your strapons and secure it tightly around your waist. It sways slightly as you jiggle your hips. Perfect.")

		saynn("Your fingers land on Avy's thighs and trace a path along them, sending shivers of anticipation through her body. Her "+str("caged up" if isCaged else "canine")+" cock is twitching slightly while you carefully circle your digits around her whole package")

		if (howBroken < 0.5):
			saynn("[say=avy]"+str(RNG.pick(["F-fuck off or I will break you..", "I'm not your slut, stop it..", "I will kill you if you do this.."]))+"[/say]")

			saynn("You hear growling coming from the other side of the wall. Luckily she doesn't even know who is doing this, the wall separates you pretty well.")

		else:
			saynn("[say=avy]"+str(RNG.pick(["Put your dick in already..", "Just fuck me already, why are you teasing..", "Get it over with and fuck me.."]))+"[/say]")

			saynn("It seems Avy has gotten.. used.. to being used. Not even protesting when some stranger is touching her.")

		saynn("You wonder how you should lube your strapon up.. A few ideas come to your mind.")

		if (isCaged):
			saynn("You would use Avy's precum for this since she is leaking so much but it's kinda awkward to try to collect any while that chastity cage is in the way. So you just spit on your rubber rod and stroke it a few times. Good enough for a slut like Avy.")

		else:
			saynn("Avy's hard cock seems to be leaking precum quite a bit so you go ahead and press your rubber cock against hers, stroking one against the other. Soft moans begin escaping from Avy, her twitching cock dripping more. You move your hand to the tip of her shaft and begin spreading that precum along the full length of your strapon.")

		addButton("Insert it", "Start fucking Avy", "strapon_anus_start")
	if(state == "strapon_anus_start"):
		playAnimation(StageScene.SlutwallSex, "sex", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("With a firm grip, you position the tip of your strapon against Avy's clenching anus, the make-shift lube easing the way. Avy starts squirming and resisting against her restraints while you, slowly and deliberately, begin putting more pressure on that unwilling anal ring, trying to stretch it open.")

		if (howBroken < 0.5):
			saynn("[say=avy]"+str(RNG.pick(["F-fu-uck..", "Bitch, fuck off..", "I'm not a fucking slut, agh..", "Agh-h.."]))+"[/say]")

		else:
			saynn("[say=avy]"+str(RNG.pick(["Ah-h..", "Ngh-h..", "F-fuck me.."]))+"[/say]")

		saynn("Eventually Avy's tight asshole gets forcibly stretched open, allowing your strapon to slide inside her and smash her pleasure spot while doing so. You hear a faint gasp.")

		saynn("After shoving most of the toy inside that needy ass, you begin pulling it out before thrusting inside yet again, establishing a steady rhythm. You don't get much stimulation yourself since it's just a strapon but you do feel some pleasurable pressure on your crotch, caused by the friction of Avy's inner walls.")

		addButton("Faster", "Strapon Avy harder and let her cum", "strapon_anus_faster")
		addButton("Deny Avy", "Don't let Avy cum", "strapon_anus_deny")
	if(state == "strapon_anus_faster"):
		playAnimation(StageScene.SlutwallSex, "fast", {pc="avy", pcCum=true, bodyState={naked=true, hard=true, caged=isCaged}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Your hands land on her hips and squeeze them tightly while you start pounding her ass relentlessly. Very soon you begin to hear moans coming from that whore, her "+str("soft cock shooting little bursts of precum through the chastity cage." if isCaged else "hard cock shooting little bursts of precum.")+"")

		if (howBroken < 0.5):
			saynn("[say=avy]"+str(RNG.pick(["I'm not a buttslut..", "Why am I liking this, fu-uck..", "No-o, I'm gonna f-fucking cum.."]))+"[/say]")

		else:
			saynn("[say=avy]"+str(RNG.pick(["Please make me cum, ple-ease..", "Fuck that feels g-good..", "I'm such a fucking slut.."]))+"[/say]")

		saynn("Luckily for her, you don't plan on stopping. With each powerful thrust, your strapon smashes Avy's prostate, sending waves of pleasure through her. You can feel her body shivering in your hands, "+str("her chastity cage twitches each time you ram your rubber cock in." if isCaged else "her free canine cock throbs each time you ram your rubber shaft in.")+"")

		saynn("At some point it becomes too much for the foxy, one of the thrusts finally manages to push her over that edge. Slutty moans escape from Avy, all the pressure inside her cock suddenly gets released when it starts shooting its load in powerful spurts that hit the wall before slowly dripping down back on Avy's crotch, creating such a lewd mess.")

		saynn("You don't stop fucking her needy asshole even while its clenching around your rubber shaft, milking Avy's swollen prostate is where all the fun is at. You do that as long as you keep hearing Avy's muffled moans, feel her body shaking and see cum trickling out of her cock.")

		saynn("Finally, as her body gradually comes down from the high, you quickly pull out, suddenly creating lots of empty space inside the foxy, her stretched hole struggling to close in time, allowing you to gaze inside at her pulsating inner walls. Lewd.")

		saynn("You're not sure if this counts as Avy 'being used' but you add a tally mark on her ass anyway because why not.")

		addButton("Continue", "That was fun", "removestraponandback")
	if(state == "strapon_anus_deny"):
		playAnimation(StageScene.SlutwallSex, "inside", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Your hands land on her hips and squeeze them tightly while you start pounding her ass relentlessly. Very soon you begin to hear moans coming from that whore, her "+str("soft cock shooting little bursts of precum through the chastity cage." if isCaged else "hard cock shooting little bursts of precum.")+"")

		saynn("But just when you begin to feel Avy's inner walls gripping your strapon a little too much, you suddenly stop your movements. A mixture of confusion and desperation begins to wash over the foxy as she starts thrashing against the restraints, her body craving that climax that is so tantalizingly close.")

		if (howBroken < 0.5):
			saynn("[say=avy]"+str(RNG.pick(["You stupid bitch!.. F-fuck you! Fuck you!.. Fuck..", "No, you can't do this, fucker!..", "Why did you stop? F-fuck you!.. I will r-rip your throat out.."]))+"[/say]")

			saynn("So angry. And so helpless. Landing a few firm smacks on that ass calms the foxy down a little.")

		else:
			saynn("[say=avy]"+str(RNG.pick(["Please make me cum, ple-ease..", "Not like thi-i-is, noo-o..", "But I'm so close, so cru-u-uel, fu-uck.."]))+"[/say]")

			saynn("You almost feel bad for the foxy. But then you remember what she did to you.. this is well deserved.")

		saynn("Avy's "+str("caged up" if isCaged else "canine")+" cock is twitching and leaking transparent prostate fluids.. but no matter what she does, she can't push herself over the edge. She is forced to endure your strapon inside her while the feeling of close orgasm.. just slowly fades..")

		saynn("Slowly, you retract your strapon and smack that ass with it. You're not sure if this counts as Avy 'being used' but you add a tally mark on her butt anyway because why not.")

		addButton("Continue", "That was fun", "removestraponandback")
	if(state == "use_anus"):
		playAnimation(StageScene.SlutwallSex, "tease", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Time to have some fun. Your exposed {pc.penis} gets hard just from looking at that inviting tight anus. Avy desperately tries to cover it with her foxy tail but she can't keep it there forever.")

		saynn("Your fingers land on Avy's thighs and trace a path along them, sending shivers of anticipation through her body. Her "+str("caged up" if isCaged else "canine")+" cock is twitching slightly while you carefully circle your digits around her whole package")

		if (howBroken < 0.5):
			saynn("[say=avy]"+str(RNG.pick(["F-fuck off or I will break you..", "I'm not your slut, stop it..", "I will kill you if you do this.."]))+"[/say]")

			saynn("You hear growling coming from the other side of the wall. Luckily she doesn't even know who is doing this, the wall separates you pretty well.")

		else:
			saynn("[say=avy]"+str(RNG.pick(["Put your dick in already..", "Just fuck me already, why are you teasing..", "Get it over with and fuck me.."]))+"[/say]")

			saynn("It seems Avy has gotten.. used.. to being used. Not even protesting when some stranger is touching her.")

		saynn("You wonder how you should lube her hole up.. A few ideas come to your mind.")

		if (isCaged):
			saynn("You would use Avy's precum for this since she is leaking so much but it's kinda awkward to try to collect any while that chastity cage is in the way. So you just lean in closer and spit directly into her anal ring a few times, making the foxy clench each time. Should be good enough for a slut like Avy.")

		else:
			saynn("You're not planning on touching Avy's cock but yours is already leaking pre. You gather some of that slick stuff and begin rubbing it into Avy's sensitive flesh, making her squirm. To top it off you just lean in closer and spit directly into her anal ring a few times, making the foxy clench each time. Should be good enough for a slut like Avy.")

		addButton("Insert it", "Start fucking Avy", "use_anus_start")
	if(state == "use_anus_start"):
		playAnimation(StageScene.SlutwallSex, "sex", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("With a firm grip, you position the tip of your cock against Avy's clenching anus, the make-shift lube easing the way. Avy starts squirming and resisting against her restraints while you, slowly and deliberately, begin putting more pressure on that unwilling anal ring, trying to stretch it open.")

		if (howBroken < 0.5):
			saynn("[say=avy]"+str(RNG.pick(["F-fu-uck..", "Bitch, fuck off..", "I'm not a fucking slut, agh..", "Agh-h.."]))+"[/say]")

		else:
			saynn("[say=avy]"+str(RNG.pick(["Ah-h..", "Ngh-h..", "F-fuck me.."]))+"[/say]")

		saynn("Eventually Avy's tight asshole gets forcibly stretched open, allowing your {pc.penis} to slide inside her and smash her pleasure spot while doing so. You hear a faint gasp.")

		saynn("After shoving most of the shaft inside that needy ass, you begin pulling it out before thrusting inside yet again, establishing a steady rhythm. Avy's asshole is great, her inner walls are clenching around your member in such a pleasurable way, you feel like you won't last for very long.")

		addButton("Faster", "Fuck Avy harder and cum inside", "use_anus_faster")
	if(state == "use_anus_faster"):
		playAnimation(StageScene.SlutwallSex, "fast", {pc="avy", pcCum=true, npcCum=true, bodyState={naked=true, hard=true, caged=isCaged}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Your hands land on her hips and squeeze them tightly while you start pounding her ass relentlessly. Very soon you begin to hear moans coming from that whore, her "+str("soft cock shooting little bursts of precum through the chastity cage." if isCaged else "hard cock shooting little bursts of precum.")+"")

		if (howBroken < 0.5):
			saynn("[say=avy]"+str(RNG.pick(["I'm not a buttslut..", "Why am I liking this, fu-uck..", "No-o, I'm gonna f-fucking cum.."]))+"[/say]")

		else:
			saynn("[say=avy]"+str(RNG.pick(["Please make me cum, ple-ease..", "Fuck that feels g-good..", "I'm such a fucking slut.."]))+"[/say]")

		saynn("Luckily for her, you don't plan on stopping. With each powerful thrust, your cock smashes Avy's prostate, sending waves of pleasure through her. You can feel her body shivering in your hands, "+str("her chastity cage twitches each time you ram your dick in." if isCaged else "her free canine cock throbs each time you ram your shaft in.")+"")

		saynn("At some point it becomes too much for the foxy, one of the thrusts finally manages to push her over that edge. Slutty moans escape from Avy, all the pressure inside her cock suddenly gets released when it starts shooting its load in powerful spurts that hit the wall before slowly dripping down back on Avy's crotch, creating such a lewd mess.")

		saynn("You don't stop fucking her needy asshole even while its clenching around your rubber shaft, milking Avy's swollen prostate is where all the fun is at. While doing so, you keep hearing Avy's muffled moans, feel her body shaking and see cum trickling out of her cock.")

		saynn("Your own climax catches up with you from all that milking. Your own member starts throbbing inside Avy before you finally cum, waves upon waves of your thick sticky {pc.cum} begin flooding Avy's ass, overflowing almost. You grunt but keep fucking the foxy during that, wishing to shove that seed as deep as she can take it.")

		saynn("Finally, as your bodies gradually come down from the high, you quickly pull out, suddenly creating lots of extra empty space inside the foxy, her stretched, used hole struggling to close in time, allowing you to gaze inside at her pulsating inner walls that are coated with your jizz. Lewd.")

		saynn("You add a tally mark on Avy's ass, as a reminder of how many times she was used.")

		addButton("Continue", "That was fun", "main")
		addButtonWithChecks("Piss inside", "Might as well relief yourself too", "anal_pee", [], [[ButtonChecks.ContentEnabled, ContentType.Watersports]])
	if(state == "anal_pee"):
		playAnimation(StageScene.SlutwallSex, "inside", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Hmm.. After cumming inside Avy you already begin to feel like you wanna pee. But why go anywhere if you got such a nice toilet in here already.")

		saynn("You quickly get yourself hard again and shove your cock inside Avy's used hole before it closes up completely. The foxy gets a little corned when she feels that you're not fucking her.")

		saynn("[say=avy]What are you..[/say]")

		saynn("Suddenly a stream of your warm, golden nectar erupts from your cock and goes straight inside Avy's guts, mixing with the seed that's already there. When Avy feels something weird filling her, she starts desperately thrashing against the chains.")

		if (howBroken < 0.5):
			saynn("[say=avy]No! S-Stop it! I'm not a fucking a toilet![/say]")

		else:
			saynn("[say=avy]I'm not a piss toilet.. I'm not.. fuck..[/say]")

		saynn("But it's too late, you emptied most of your bladder inside her already, there is so much of your gross fluids that some begin overflowing and already leaking out. Avy gets quieter as your stream dies down, piss enema sloshing inside her.")

		saynn("[say=avy]I'm not..[/say]")

		saynn("Her ass spawns a piss fountain when you pull out. Hopefully the next person who will use her won't mind that.")

		if (howBroken < 0.5):
			saynn("[say=avy]..fuck all of you..[/say]")

		else:
			saynn("[say=avy]..I guess I am..[/say]")

		addButton("Continue", "That was fun", "main")
	if(state == "finger_avy"):
		hasCumInside = getCharacter("avy").hasEffect(StatusEffect.HasCumInsideAnus)
		playAnimation(StageScene.SlutwallSexOral, "tease", {pc="avy", bodyState={naked=true, hard=true, caged=isCaged}})
		if (hasCumInside):
			saynn("You waste no time and just lick your fingers before pressing them against Avy's needy asshole and applying enough force to slip them inside. Avy's body protests by wiggling and trying to clench but it's too late, you spread her tailhole with your digits and notice {avy.anusContents} leaking. It's clear that this foxy got used once or twice or more.")

		else:
			saynn("You waste no time and just lick your fingers before pressing them against Avy's needy asshole and applying enough force to slip them inside. Avy's body protests by wiggling and trying to clench but it's too late, you spread her tailhole with your digits and notice that nothing is leaking. Strange, considering Avy's vulnerable position and all the invitations.")

		if (howBroken < 0.5):
			saynn("[say=avy]H-hey, don't touch my asshole.. ah!..[/say]")

		else:
			saynn("[say=avy]Hope you aren't just teasing.. ah..[/say]")

		saynn("You curl your fingers in such a way that they manage to reach Avy's prostate, making her gasp. You start slowly, just teasing the gland, dragging your fingertips over it and gently pressing on it. Avy's body is quick to respond, her "+str("chastity cage visible twitching as more precum leaks out of it." if isCaged else "hard canine cock visibly twitching and leaking more precum.")+"")

		saynn("As your touch becomes more.. rough.. Avy's little pleasure spot begins to swell with prostate fluids. You start to hear muffled moans as the pressure is slowly building inside her.")

		if (howBroken < 0.5):
			saynn("[say=avy]P-please s-stop.. Or I will.. f-fuck..[/say]")

		else:
			saynn("[say=avy]Please.. don't s-stop.. f-fuck..[/say]")

		saynn("You can feel her body shivering, foxy is gonna cum very soon.")

		addButton("Make her cum", "Keep fingering the poor foxy", "finger_finger_cum")
		if (isCaged):
			addDisabledButton("Condom", "You can't collect Avy's seed into a condom if she is caged")
		else:
			addButtonWithChecks("Condom", "Collect Avy's cum into a condom while fingering her", "finger_condom_cum", [], [ButtonChecks.HasCondoms])
		addButton("Rim Avy", "Make Avy cum with your tongue up her butt", "finger_rim_cum")
	if(state == "finger_finger_cum"):
		playAnimation(StageScene.SlutwallSexOral, "tease", {pc="avy", pcCum=true, bodyState={naked=true, hard=true, caged=isCaged}})
		saynn("You recognize the signs of her climax that is about to happen but only increase the intensity, fingering that needy clenching asshole harder. Your fingers don't press too deep but you're relentless about it.")

		saynn("And soon, Avy's body starts convulsing with pleasure.. well, trying to, the chains rattle but keep her mostly still for you. Her muffled moans are followed by her "+str("caged up cock throbbing inside its contains and pushing a steady flow of cum through the little hole in the cage. All of it ends up marking her own fur." if isCaged else "canine cock throbbing and pulsating before a steady flow of cum spawns from the tip and drips down the shaft, marking her own fur.")+" A completely hands-free orgasm.")

		if (howBroken < 0.5):
			saynn("[say=avy]Ah-h-h..[/say]")

		else:
			saynn("[say=avy]Ah-h.. C-cumming like a stupid buttslut..[/say]")

		saynn("You keep milking her prostate until the very last drop of seed. By the end of it, Avy is left panting, her cock soft, her balls empty.")

		saynn("After having some fun with her you pull your digits out and dry them against her fur just to humiliate her a little more. Oh, you also add a tally mark on her butt because why not.")

		addButton("Continue", "That was fun", "main")
	if(state == "finger_rim_cum"):
		playAnimation(StageScene.SlutwallSexOral, "lick", {pc="avy", pcCum=true, bodyState={naked=true, hard=true, caged=isCaged}})
		saynn("You recognize the signs of her climax that is about to happen and decide to do a little twist. Avy starts whining when you suddenly withdraw your fingers, leaving her prostate craving for your touch. But, instead of using your fingers again, you get on your knees fully, your gaze admiring that tight asshole.")

		saynn("Without hesitation, you bury your face between Avy's spread buttcheeks, your tongue eagerly exploring the sensitive skin around her little star. The sudden shift from fingering to rimming sends shockwaves of pleasure through Avy, her muffled moans fill the air.")

		if (howBroken < 0.5):
			saynn("[say=avy]What are you.. Ah-h-h, fuck!..[/say]")

		else:
			saynn("[say=avy]Ah-h.. Fuck me, that feels good..[/say]")

		saynn("As you easily penetrate that sensitive tailhole with your tongue, Avy arches her back, her hips instinctively grinding against your lips. You slip your tongue as far as you can and begin licking her out from the inside, lapping at her inner walls.")

		if (hasCumInside):
			saynn("Your tongue gets coated with {avy.anusContents} that you eagerly swallow before pushing the tongue deeper and deeper, trying to clean Avy.")

		saynn("Very soon Avy's body begins to respond with uncontrollable spasms. Unable to hold back any longer, she succumbs to the overwhelming pleasure, her body shivering while waves of pleasure flow through her. Her muffled moans are followed by her "+str("caged up cock throbbing inside its contains and pushing a steady flow of cum through the little hole in the cage. All of it ends up marking her own fur." if isCaged else "canine cock throbbing and pulsating before a steady flow of cum spawns from the tip and drips down the shaft, marking her own fur.")+" A completely hands-free orgasm.")

		saynn("You keep rimming her until the very last drop of seed. By the end of it, Avy is left panting, her cock soft, her balls empty.")

		saynn("After having some fun with her you add a tally mark on her butt because why not.")

		addButton("Continue", "That was fun", "main")
	if(state == "finger_condom_cum"):
		playAnimation(StageScene.SlutwallSexOral, "tease", {pc="avy", bodyState={naked=true, hard=true, condom=true}})
		saynn("You recognize the signs of her climax that is about to happen and decide to do something interesting with that. Avy whines as you withdraw your fingers out of her ass. Then you produce one of your packaged condoms and quickly open it before dragging it over the length of Avy's cock")

		if (howBroken < 0.5):
			saynn("[say=avy]What are you.. Ah-h-h, fuck!..[/say]")

		else:
			saynn("[say=avy]A c-condom?.. Ah..[/say]")

		saynn("After that's done, you quickly push your digits inside her waiting clenching asshole and begin fingering it harder. Your fingers don't press too deep but you're relentless about it.")

		saynn("And soon, Avy's body starts convulsing with pleasure.. well, trying to, the chains rattle but keep her mostly still for you. Her muffled moans are followed by her throbbing cock shooting waves of sticky cum directly into that condom, quickly filling it full. A completely hands-free orgasm. Clean too, thanks to that condom.")

		if (howBroken < 0.5):
			saynn("[say=avy]Ah-h-h..[/say]")

		else:
			saynn("[say=avy]Ah-h.. C-cumming like a stupid buttslut..[/say]")

		saynn("You keep milking her prostate until the very last drop of seed. By the end of it, Avy is left panting, her cock soft, her balls empty.")

		saynn("After having some fun with her you pull your digits out and dry them against her fur just to humiliate her a little more. You grab the condom and prepare to dispose of it. Oh, you also add a tally mark on her butt because why not.")

		addButton("Continue", "That was fun", "main")
	if(state == "deepthroat_start"):
		playAnimation(StageScene.SlutwallSexOral, "handjob", {pc="avy", bodyState={naked=true, hard=true}})
		saynn("Avy wouldn't really know if you allow yourself to be a little weak for that cock and suck it.. You get on your knees in front of it, your fingers begin trailing along its length, making Avy twitch a little. She is probably wondering if someone is here to abuse her.")

		saynn("But no, you are being quite careful, your digits wrap around her girth and begin stroking it slowly, preparing Avy and spreading her own precum along her cock.")

		if (howBroken < 0.5):
			saynn("[say=avy]Hey, stop fucking stroking me and undo the chains already.[/say]")

		else:
			saynn("[say=avy]You gonna let me cum, right?..[/say]")

		saynn("After teasing Avy for a bit, kneading her balls and rubbing the tip of her cock, you direct it towards your opened mouth..")

		addButton("Suck", "Start sucking that cock", "do_deepthroat")
	if(state == "do_deepthroat"):
		playAnimation(StageScene.SlutwallSexOral, "blowjob", {pc="avy", bodyState={naked=true, hard=true}})
		saynn("You let that cock past your teeth and even deeper until the tip is brushing against the back of your mouth, threatening to go down the {pc.throatStretch} throat. You can hear a few muffled moans as you begin dragging your lips over her length and sucking that cock. The tip of your tongue feels precum dripping upon it that you quickly swallow.")

		saynn("Your motions are slow and sensual, your head bobbing up and down, setting a nice rhythm that keeps the foxy on her toes.. kinda. She can't even see who is sucking her cock which probably feels quite weird.")

		if (howBroken < 0.5):
			saynn("[say=avy]If you bite me I will smash your head.. somehow. Oh fuck!..[/say]")

		else:
			saynn("[say=avy]Please don't stop.. oh fuck!..[/say]")

		saynn("Suddenly you decided to go deeper, accepting almost her entire length down your throat, except for the fat knot that is just slapping against your lips while you start deepthroating Avy. You keep a steady pace for a while but then your throat tightens and you start fighting your own gag reflex. You momentarily pull back, coughing softly, your hands kneading Avy's balls to offer her at least some stimulation.")

		saynn("After some time, you force yourself to deepthroat her shaft yet again and just try to not focus too much on how it stretches your throat and create a little bump on your neck. Gradually, you work your way back down, inch by inch, you manage to swallow most of it again.")

		saynn("Avy's muffled moans get louder which is what makes you keep going, your tongue swirling around her shaft while you continue sliding your head over her dick nice and deep. Eventually you begin to feel that knotted cock start throbbing in your mouth, Avy is trying to hump your face involuntary but the chains keep her still.")

		saynn("Your eyes begin to water slightly, occasionally noises of gagging start escaping from you as your throat begins to get all tight around Avy again. But you are determined to make her cum, you take that canine cock as deep as your throat allows and stop moving, letting your clenching inner walls do the rest.")

		if (howBroken < 0.5):
			saynn("[say=avy]I'm gonna.. oh.. Fuck!..[/say]")

		else:
			saynn("[say=avy]Yes-yes, please, fu-u-uck!..[/say]")

		saynn("Avy arches her back, her hot seed starts flowing directly down your throat. You eagerly swallow everything that overflows, causing even more stimulation for the foxy, you can feel her body convulsing and thrashing against the chains. Your gag reflex is real, making you choke and lose oxygen fast but the pleasure is too much.. you accept Avy's cum like a submissive cutie.. and you love it..")

		saynn("Only when her cock stops twitching and throbbing, do you finally pull your head away from it. You instantly start coughing and gasping for air.")

		saynn("Avy's cock is messy with your saliva and all the seed that is still coating it.. but you decide to leave it like that. Instead you just add a tally mark on her butt.. because why not.")

		addButton("Continue", "See what happens next", "main")
	if(state == "pick_ride_avy"):
		playAnimation(StageScene.SlutwallRide, "tease", {pc="avy", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Seeing that throbbing cock.. really makes you want to somehow put it inside your hole. But it's obvious that Avy's body is positioned a little too high for that.. doesn't stop you from getting a little creative though.")

		saynn("You begin by putting one of your legs on Avy's chains wrapped around her wrists and testing how sturdy of a platform it would be. It seems to be good enough so you take the plunge and climb Avy's body, your second leg landing on Avy's crotch while your hands grab onto her digi-feet that are chained to the wall, another good source of support.")

		if (howBroken < 0.5):
			saynn("[say=avy]Hey! The fuck are you doing..[/say]")

		else:
			saynn("[say=avy]Are you standing on me..[/say]")

		saynn("You are standing on Avy, not the most stable position.. but that only makes you more eager to try it.. You look down and.. yes.. her cock is right there, waiting to be straddled..")

		addButtonWithChecks("Vaginal", "Ride Avy with your pussy", "do_ride_vaginal", [], [ButtonChecks.HasReachableVagina])
		addButtonWithChecks("Anal", "Ride Avy with your ass", "do_ride_anal", [], [ButtonChecks.HasReachableAnus])
		addButton("Back", "Get off Avy", "main")
	if(state == "do_ride_vaginal"):
		playAnimation(StageScene.SlutwallRide, "sex", {pc="avy", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Using Avy's chained limbs for support, you begin to lower yourself onto that member until it's pressing against your eager {pc.pussyStretch} pussy. Even just feeling how warm and veiny the texture is makes you wet and needy. You tease it a little more by grinding your sensitive folds against it before proceeding to the main event..")

		saynn("Slowly, you raise yourself a bit before lowering your frame back directly onto that canine member, your pussy lips spreading wide and then guiding it towards the inviting entrance itself, your hole slowly stretching until the pointy dripping tip is inside.. A little cute moan escapes from you while Avy is probably still confused about the logistics of how this is even possible.")

		saynn("In this strange adapted version of reverse cowgirl position, you begin to move your hips up and down, along that shaft, letting it penetrate you a little deeper each time. Avy's body responds to your every motion, little muffled grunts escape from her while your slick {pc.pussyStretch} inner walls are gripping that cock.")

		if (howBroken < 0.5):
			saynn("[say=avy]How did you even.. fuck.. I'm almost not complaining..[/say]")

		else:
			saynn("[say=avy]I don't understand how.. but I'm not complaining.. fuck..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your locked up cock is bobbing up and down ever so slightly while you ride Avy, that cage securing it tightly. But still, the sight of a caged up inmate riding a slutwall whore is probably quite entertaining for the people who stand in line, waiting for their turn.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your own {pc.penis} is bobbing up and down while you ride Avy, providing entertainment for inmates who stand in line, waiting for their turn.")

		addButton("Faster", "That cock feels so good", "do_ride_vaginal_faster")
	if(state == "do_ride_vaginal_faster"):
		playAnimation(StageScene.SlutwallRide, "fast", {pc="avy", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("The reverse cowgirl position allows for deeper penetration so you take full advantage of that, bouncing on that cock faster and harder, only Avy's fat knot doesn't fit inside you yet, it just slaps against your pussy slit. Still, you keep trying.")

		saynn("More little passionate moans escape from you, the fast rhythm makes your inner wall grip that member more, leading to more pleasurable friction that, in turn, fuels your desire to ride Avy even more fast..")

		saynn("The foxy doesn't even know who is so brave to ride like that. And it's better to keep that a secret, Avy's ego is big enough already. You just focus on the sensations of that cock sliding inside you, hitting all the right spots and even kissing your inner barricade, causing your slick pussy walls to respond by pulsating and massaging the intruding length.")

		if (howBroken < 0.5):
			saynn("[say=avy]Bitch, I'm gonna cum if you're gonna keep.. ah..[/say]")

		else:
			saynn("[say=avy]If you keep.. I'm gonna.. ah..[/say]")

		saynn("It seems Avy is close. And are you..")

		addButton("Get knotted", "Force that orb inside you", "do_ride_vaginal_knot")
	if(state == "do_ride_vaginal_knot"):
		playAnimation(StageScene.SlutwallRide, "inside", {pc="avy", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Time to do this. With forceful motions, you begin trying to fit Avy's whole dick inside your needy cunt, gradually applying more and more pressure. You can feel your pussy lips slowly stretching after every slap of the knot but it's still not enough.. And that cock is.. throbbing inside you already, the bitch is about to cum..")

		saynn("So you do the only thing you can and raise yourself more before bringing your cunt onto that knot as hard as you can, your slit stretching extremely wide and even painful.. until the knot suddenly slips inside, locking you two together!")

		if (howBroken < 0.5):
			saynn("[say=avy]Fuck![/say]")

		else:
			saynn("[say=avy]Oh fuck..[/say]")

		saynn("It seems you two cum at the same time, your bodies are shaking and convulsing together as multiple waves of pure euphoria washes over you. Your inner walls pulse and contract around that knot while Avy's cock twitches and starts shooting hot sticky cum directly into your awaiting womb.")

		if (GM.pc.isWearingChastityCage()):
			saynn("It quickly gets too much for you, your poor caged up cock is leaking {pc.cum} that flows down your cage and then drips down on Avy's tail, leaving a cute mess.")

		elif (GM.pc.hasReachablePenis()):
			saynn("It quickly gets too much for you, your own hard dick is wasting its load by shooting {pc.cum} directly forward, leaving quite a mess on the floor.")

		saynn("You're lucky you didn't fall yet, your legs and arms are shaking so much.. but at least you got that extra anchor point.. Loud moans escape from you while the knot continues to provide a constant source of stimulation, prolonging and enhancing your orgasm so much that you suddenly squirt, a fountain of your juices erupts from your slit.")

		saynn("As the ecstatic waves finally begin to fade, you find yourself locked together with Avy, such a precarious situation. Doesn't stop from you grabbing a marker and drawing a tally mark on her fluffy butt though, Avy was technically used by you..")

		saynn("After some more time, that knot finally deflates enough for you to escape the lock, your stuffed pussy leaking cum and struggling to close after being stretched so much..")

		addButton("Continue", "See what happens next", "main")
	if(state == "do_ride_anal"):
		playAnimation(StageScene.SlutwallRide, "sex", {pc="avy", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Using Avy's chained limbs for support, you begin to lower yourself onto that member until it's pressing against your twitching {pc.analStretch} anal ring. Even just feeling how warm and veiny the texture is makes you lusty and needy. You tease her cock a little more by making it brush against your {pc.masc} butt before proceeding to the main event..")

		saynn("Slowly, you raise yourself a bit before lowering your frame back directly onto that canine member, your buttcheeks catching the tip between them and then guiding it towards the inviting entrance itself, your hole slowly stretching until the pointy dripping head is inside.. A little cute moan escapes from you while Avy is probably still confused about the logistics of how this is even possible.")

		saynn("In this strange adapted version of reverse cowgirl position, you begin to move your hips up and down, along that shaft, letting it penetrate you a little deeper each time. Avy's body responds to your every motion, little muffled grunts escape from her while your {pc.analStretch} inner walls are gripping that cock and letting it lube you up with precum.")

		if (howBroken < 0.5):
			saynn("[say=avy]How did you even.. fuck.. I'm almost not complaining..[/say]")

		else:
			saynn("[say=avy]I don't understand how.. but I'm not complaining.. fuck..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("You can feel pressure on your prostate, your locked up cock is bobbing up and down ever so slightly while you ride Avy, that cage securing it tightly. But still, the sight of a caged up inmate riding a slutwall whore is probably quite entertaining for the people who stand in line, waiting for their turn.")

		elif (GM.pc.hasReachablePenis()):
			saynn("You can feel pressure on your prostate, your own {pc.penis} is bobbing up and down while you ride Avy, providing entertainment for inmates who stand in line, waiting for their turn.")

		addButton("Faster", "That cock feels so good", "do_ride_anal_faster")
	if(state == "do_ride_anal_faster"):
		playAnimation(StageScene.SlutwallRide, "fast", {pc="avy", bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("The reverse cowgirl position allows for deeper penetration so you take full advantage of that, bouncing on that cock faster and harder, only Avy's fat knot doesn't fit inside you yet, it just slaps against your {pc.analStretch} star. Still, you keep trying.")

		saynn("More little passionate moans escape from you, the fast rhythm makes your inner wall grip that member more, leading to more pleasurable friction that, in turn, fuels your desire to ride Avy even more fast..")

		saynn("The foxy doesn't even know who is so brave to ride like that. And it's better to keep that a secret, Avy's ego is big enough already. You just focus on the sensations of that cock sliding inside you, hitting all the right spots, causing your slick walls to respond by pulsating and massaging the intruding length.")

		if (howBroken < 0.5):
			saynn("[say=avy]Bitch, I'm gonna cum if you're gonna keep.. ah..[/say]")

		else:
			saynn("[say=avy]If you keep.. I'm gonna.. ah..[/say]")

		saynn("It seems Avy is close. And are you..")

		addButton("Get knotted", "Force that orb inside you", "do_ride_anal_knot")
	if(state == "do_ride_anal_knot"):
		playAnimation(StageScene.SlutwallRide, "inside", {pc="avy", pcCum=true, npcCum=true, bodyState={naked=true, hard=true}, npcBodyState={exposedCrotch=true, hard=true}})
		saynn("Time to do this. With forceful motions, you begin trying to fit Avy's whole dick inside your needy ass, gradually applying more and more pressure. You can feel your anal ring slowly stretching after every slap of the knot but it's still not enough.. And that cock is.. throbbing inside you already, the bitch is about to cum..")

		saynn("So you do the only thing you can and raise yourself more before bringing your tailhole onto that knot as hard as you can, your flesh stretching extremely wide and even painful.. until the knot suddenly slips inside, locking you two together!")

		if (howBroken < 0.5):
			saynn("[say=avy]Fuck![/say]")

		else:
			saynn("[say=avy]Oh fuck..[/say]")

		saynn("It seems you two cum at the same time, your bodies are shaking and convulsing together as multiple waves of pure euphoria washes over you. Your inner walls pulse and contract around that knot while Avy's cock twitches and starts shooting hot sticky cum deep inside you.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Her knot puts so much pressure on your prostate that it quickly gets too much for you, your poor caged up cock is leaking {pc.cum} that flows down your cage and then drips down on Avy's tail, leaving a cute mess.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Her knot puts so much pressure on your prostate that it quickly gets too much for you, your own hard dick is wasting its load by shooting {pc.cum} directly forward, leaving quite a mess on the floor.")

		saynn("You're lucky you didn't fall yet, your legs and arms are shaking so much.. but at least you got that extra anchor point.. Loud moans escape from you while the knot continues to provide a constant source of stimulation, prolonging and enhancing your orgasm, making you feel like you're drugged up.")

		saynn("As the ecstatic waves finally begin to fade, you find yourself locked together with Avy, such a precarious situation. Doesn't stop from you grabbing a marker and drawing a tally mark on her fluffy butt though, Avy was technically used by you..")

		saynn("After some more time, that knot finally deflates enough for you to escape the lock, your stuffed ass leaking cum and your anus is struggling to close after being stretched so much..")

		addButton("Continue", "See what happens next", "main")
func addStraponButtons():
	var strapons = GM.pc.getStrapons()
	for strapon in strapons:
		addButton(strapon.getVisibleName(), strapon.getVisibleDescription(), "strapon_anus_with", [strapon])

func addBroke(howMuchMin, howMuchMax):
	var howMuch = RNG.randf_range(howMuchMin, howMuchMax)
	howBroken += howMuch
	setFlag("FightClubModule.AvySlutWallBroken", howBroken)

func addBodywritingMaybe():
	if(RNG.chance(30)):
		var randomZone = BodyWritingsZone.getRandomZoneLowerPart()
		getCharacter("avy").addBodywriting(randomZone, BodyWritings.getRandomWritingIDForZone(randomZone))
		addMessage("You also decided to scribble something degrading on Avy's "+str(BodyWritingsZone.getZoneVisibleName(randomZone)))


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "take_cage_off"):
		setFlag("FightClubModule.AvyGotCaged", false)
		isCaged = false
		processTime(5*60)

	if(_action == "put_cage_on"):
		setFlag("FightClubModule.AvyGotCaged", true)
		isCaged = true
		processTime(5*60)

	if(_action == "do_watch"):
		var charID = NpcFinder.grabNpcIDFromPool(CharacterPool.Inmates)
		if(charID == null || charID == ""):
			addMessage("The queue is empty. Maybe you should look for more inmates.")
			return
		npcID = charID
		addCharacter(npcID)
		if(isCaged):
			getCharacter("avy").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ChastityCagePermanent"))

	if(_action == "start_freeuse_npc"):
		getCharacter("avy").lustStateFullyUndress()
		runScene("GenericSexScene", [npcID, "avy", SexType.SlutwallSex], "generic_sex_scene_avy")
		removeCharacter(npcID)
		npcID = ""
		setState("")
		return

	if(_action == "main"):
		if(npcID != ""):
			removeCharacter(npcID)
			npcID = ""
		setState("")
		return

	if(_action == "free_avy"):
		setFlag("FightClubModule.AvyGotCaged", false)
		setFlag("FightClubModule.AvyIsInSlutwall", false)

	if(_action == "strapon_anus_with"):
		var strapon = _args[0]
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(strapon)

	if(_action == "strapon_anus_start"):
		processTime(3*60)

	if(_action == "strapon_anus_faster"):
		processTime(3*60)
		addBroke(0.05, 0.1)
		getCharacter("avy").cummedOnBy("avy")
		getCharacter("avy").cummedInAnusBy("pc", FluidSource.Strapon)
		getCharacter("avy").addTallymarkButt()
		addBodywritingMaybe()

	if(_action == "strapon_anus_deny"):
		processTime(3*60)
		addBroke(0.05, 0.1)
		getCharacter("avy").addTallymarkButt()
		addBodywritingMaybe()

	if(_action == "removestraponandback"):
		GM.pc.unequipStrapon()
		setState("")
		return

	if(_action == "use_anus_start"):
		processTime(3*60)

	if(_action == "use_anus_faster"):
		processTime(3*60)
		addBroke(0.05, 0.1)
		getCharacter("avy").cummedOnBy("avy")
		getCharacter("avy").cummedInAnusBy("pc")
		getCharacter("avy").addTallymarkButt()
		addBodywritingMaybe()

	if(_action == "anal_pee"):
		processTime(3*60)
		getCharacter("avy").cummedInAnusBy("pc", FluidSource.Pissing)

	if(_action == "finger_finger_cum"):
		processTime(3*60)
		addBroke(0.03, 0.05)
		getCharacter("avy").cummedOnBy("avy")
		getCharacter("avy").addTallymarkButt()
		addBodywritingMaybe()

	if(_action == "finger_condom_cum"):
		GM.pc.useWorstCondom()
		processTime(3*60)
		addBroke(0.03, 0.05)
		getCharacter("avy").addTallymarkButt()
		addBodywritingMaybe()
		addFilledCondomToLootIfPerk(getCharacter("avy").createFilledCondom())

	if(_action == "finger_rim_cum"):
		processTime(3*60)
		addBroke(0.03, 0.05)
		getCharacter("avy").cummedOnBy("avy")
		getCharacter("avy").addTallymarkButt()
		addBodywritingMaybe()
		getCharacter("avy").bodypartTransferFluidsTo(BodypartSlot.Anus, "pc", BodypartSlot.Head, 0.2, 100.0)

	if(_action == "do_deepthroat"):
		processTime(3*60)
		addBroke(0.03, 0.05)
		GM.pc.cummedInMouthBy("avy")
		getCharacter("avy").addTallymarkButt()
		addBodywritingMaybe()

	if(_action == "do_ride_vaginal"):
		processTime(5*60)

	if(_action == "do_ride_anal"):
		processTime(5*60)

	if(_action == "do_ride_vaginal_faster"):
		processTime(5*60)

	if(_action == "do_ride_vaginal_knot"):
		processTime(10*60)
		addBroke(0.05, 0.1)
		GM.pc.cummedInVaginaBy("avy")
		GM.pc.gotVaginaFuckedBy("avy")
		getCharacter("avy").addTallymarkButt()
		addBodywritingMaybe()

	if(_action == "do_ride_anal_faster"):
		processTime(5*60)

	if(_action == "do_ride_anal_knot"):
		processTime(10*60)
		addBroke(0.05, 0.1)
		GM.pc.cummedInAnusBy("avy")
		GM.pc.gotAnusFuckedBy("avy")
		GM.pc.orgasmFrom("avy")
		getCharacter("avy").addTallymarkButt()
		addBodywritingMaybe()

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "generic_sex_scene_avy"):
		if(isCaged):
			getCharacter("avy").getInventory().removeItemFromSlot(InventorySlot.Penis)

func saveData():
	var data = .saveData()

	data["isCaged"] = isCaged
	data["howBroken"] = howBroken
	data["npcID"] = npcID
	data["hasCumInside"] = hasCumInside

	return data

func loadData(data):
	.loadData(data)

	isCaged = SAVE.loadVar(data, "isCaged", false)
	howBroken = SAVE.loadVar(data, "howBroken", 0.0)
	npcID = SAVE.loadVar(data, "npcID", "")
	hasCumInside = SAVE.loadVar(data, "hasCumInside", false)
