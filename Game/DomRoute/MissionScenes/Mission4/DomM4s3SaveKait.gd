extends SceneBase

func _init():
	sceneID = "DomM4s3SaveKait"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("medical_near_pccell")
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("You approach the row of locked padded rooms.")

		saynn("[say=avy]Might be it.[/say]")

		saynn("You take your time and look into the small window slit of each one..")

		addButton("Continue", "See what happens next", "kait_reveal")
	if(state == "kait_reveal"):
		addCharacter("kait", ["naked"])
		aimCameraAndSetLocName("medical_paddedcell_player")
		playAnimation(StageScene.SexStart, "start", {pc="pc", npc="kait"})
		saynn("There she is! There is Kait.")

		saynn("The giant metal door is locked.. but you just press the nurse's badge against the access panel.")

		saynn("The door begins to unlock, enough to step inside. And so you do.")

		saynn("Inside.. a tiny room.. barely enough for a single person. All walls are padded with soft material. Kait is sitting in the center of it. She is wearing a straitjacket.. made out of latex.. Around her waist is a bulky chastity belt.")

		saynn("When she notices you, her eyes lazily look up at you.")

		saynn("[say=kait]..meow.. meow-w~..[/say]")

		saynn("Avy growls.")

		saynn("[say=avy]Fucking hell, what did that bitch do to you.[/say]")

		saynn("[say=kait]Meow-w-w~. You're pretty-y.[/say]")

		saynn("Her eyes are half-closed, pupils wide and unfocused. She blinks slowly, a cute little smile spreading across her muzzle.")

		saynn("[say=pc]She sedated her. We gotta get her out of here.[/say]")

		saynn("[say=avy]Well.. fucking grab the cat then. We can deal with that fucking nerd bitch some other time.[/say]")

		saynn("You reach down and begin lifting Kait up. She nuzzles you and purrs as you do that.")

		saynn("[say=kait]Warm~.[/say]")

		saynn("The moment you lift the snow leopard.. the heavy metal door closes shut! The loud clang echoes through the corridors.")

		saynn("You're trapped inside! Only Avy is left outside. You can see her through the slit.")

		saynn("[say=avy]What the..[/say]")

		saynn("[say=pc]The badge?[/say]")

		saynn("Avy tries.. but the panel flashes red.")

		saynn("[say=avy]It's not fucking working.[/say]")

		saynn("[say=kait]Meow meow.. stuck.. hehe..[/say]")

		saynn("This is not good.")

		saynn("[say=eliza]Not opening, huh~?[/say]")

		saynn("It's her voice..")

		addButton("Continue", "See what happens next", "avy_eliza_intro")
	if(state == "avy_eliza_intro"):
		addCharacter("eliza")
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance()})
		aimCameraAndSetLocName("medical_near_pccell")
		saynn("You can only watch through the small slit of the door.. but you see enough.")

		saynn("Eliza Quinn, in the flesh, standing near the entrance of the mental ward wing.")

		saynn("Avy stops trying to press the badge against the panel.. and faces her.")

		saynn("[say=avy]You. Absolute. Bitch.[/say]")

		saynn("[say=eliza]Gonna be honest, I was hoping to trap both of you. But that's okay, I can deal with one.[/say]")

		saynn("Avy raises her fists, her hind paws are placed at her shoulder width.")

		saynn("[say=avy]You think you're so smart, huh? Your stupid plan didn't work. Hope you like pain, you're about to experience all of it.[/say]")

		saynn("Eliza is holding some kind of syringe.")

		saynn("[say=eliza]Maybe I do like pain~.[/say]")

		saynn("They're about to fight. And all you can do is watch.")

		saynn("[say=kait]Avy is cute-e~..[/say]")

		addButton("Watch", "See what Avy will do next", "watch_start")
	if(state == "watch_start"):
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["punch", 0, 0, CombatAnimPlayer.ST_DODGING, ""]})
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["kick", 0, 0, CombatAnimPlayer.ST_KNOCKEDDOWN, ""]})
		saynn("The foxy does the first move. She lunges forward, going for a superman punch, her fist swinging towards Eliza's head. The feline manages to pull away in time, the punch grazing her shoulder instead of shattering her jaw.")

		saynn("[say=eliza]Nice try.[/say]")

		saynn("[say=avy]You better start begging, bitch.[/say]")

		saynn("Avy doesn't stop, she commits to a follow up, a heavy hook that Eliza avoids.. but then the last kick catches her.")

		saynn("Eliza gasps and collapses, her ribs certainly didn't like any of it.")

		saynn("[say=avy]Not so smug now, are you?[/say]")

		saynn("The feline coughs, clutching her side. But then she looks up at Avy and smiles.")

		saynn("[say=eliza]Gh.. You hit hard, I will give you that.[/say]")

		saynn("Seeing the smug expression, Avy charges again, trying to deliver another kick..")

		addButton("Continue", "See what happens next", "eliza_throws_something")
	if(state == "eliza_throws_something"):
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["throw", 1, CombatAnimPlayer.ST_KNOCKEDDOWN, 0, ""]})
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), statusUpdate=[0, 0]})
		saynn("But before Avy has a chance to attack Eliza, the doctor throws a vial at her feet. The vial shatters.. releasing a cloud of pink mist. Avy barrels through it, coughing.")

		saynn("[say=avy]Ugh.. again with this shit..[/say]")

		saynn("Avy's stops, her shorts are visibly bulging now.. more than usual. While the foxy is busy flailing the smoke away, the feline has a chance to get up.")

		saynn("[say=avy]You're only making it worse for yourself later, whore.[/say]")

		saynn("[say=eliza]I know exactly what I'm doing~.[/say]")

		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["shove",0,0,0, ""]})
		playAnimation(StageScene.Combat, "", {pc="avy", npc="eliza", pcStance=getCharacter("avy").getCombatStance(), npcStance=getCharacter("eliza").getCombatStance(), attack=["WeaponSyringe",0,0,0, ""]})
		saynn("Avy lurches forward and manages to catch the feline before slamming her back against the wall, pinning to it. Eliza winces while Avy already starts trying to undress the doctor, to get rid of her skirt and labcoat.")

		saynn("That's when Eliza jabs a syringe into Avy's thigh.")

		saynn("[say=avy]Agh.. you bitch![/say]")

		saynn("Avy throws Eliza across the room.. but she manages to land it, her feline agility helping her stay on her hind paws.")

		saynn("Avy's hind paws though.. are under a bit more stress now. Whatever that drug was, it made Avy slower and weaker.")

		saynn("[say=eliza]You look tired, patient. I have just the room for you~.[/say]")

		saynn("[say=avy]SHUT UP![/say]")

		saynn("Avy charges again.. but this time Eliza is prepared. She sidesteps the slow attack and jabs another syringe into Avy's shoulder. Then another into her arm.. she certainly came prepared.")

		saynn("[say=avy]FUCK![/say]")

		saynn("[say=kait]..fuck~..[/say]")

		saynn("Avy growls hard, swatting Eliza away.. but the damage seems to be done.")

		addButton("Continue", "See what happens next", "avy_got_rekt")
	if(state == "avy_got_rekt"):
		playAnimation(StageScene.Duo, "defeat", {npc="eliza", pc="avy", bodyState={leashedBy="eliza"}})
		saynn("Unable to continue fighting, Avy hits the floor.")

		saynn("[say=avy]I hate YOU.[/say]")

		saynn("Eliza chuckles. She puts all her syringes away.. and then approaches the foxy.. before clicking a leash to her collar, finding little resistance.")

		saynn("[say=avy]Can't.. move..[/say]")

		saynn("[say=eliza]You earned yourself a good timeout in the soft room, patient~.[/say]")

		saynn("She looks at you through the window slit.")

		saynn("[say=eliza]A different room I guess. Come here~.[/say]")

		saynn("Eliza invites Avy to follow.. but the foxy refuses to get up.. or move.. anything.")

		saynn("[say=eliza]Really? Do you need a bigger incentive?[/say]")

		saynn("She produces another syringe with her free paw, holding it dangerously close to Avy's neck.")

		saynn("[say=avy]I'm not moving an inch.. fuck you..[/say]")

		saynn("[say=eliza]Ugh. Fine.[/say]")

		saynn("Eliza puts the syringe away and just starts pulling on the leash hard, literally dragging the poor foxy across the floor, choking her a bit in the process.")

		saynn("[say=eliza]You've beaten up all of my nurses.. ugh.. heavy girl.. so now I have to do everything myself, grr.[/say]")

		saynn("And so they get out of your.. extremely limited.. vision cone. Eliza is probably shoving Avy into the other padded room, about to close it.")

		saynn("[say=kait]Avy.. gonna take a nap~..[/say]")

		saynn("Eliza with her tricks.. she just about managed to come out as winner after everything.. she even managed to avoid having to fight you completely too.")

		saynn("What a bitch.")

		saynn("It seems.. there is not much you can do.")

		saynn("You're locked in a padded room. Avy is sharing your faith. And Kait is still acting silly in your hands. Ans.. isn't even aware of all of this.")

		addButton("Continue", "See what happens next", "sudden_ferri")
	if(state == "sudden_ferri"):
		addCharacter("ferri")
		playAnimation(StageScene.Solo, "stand", {pc="ferri"})
		saynn("[say=ferri]Psst![/say]")

		saynn("What?")

		saynn("You look through the cell of the door.. and see the tips of someone's horns and tassels of their ears.")

		saynn("It's Ferri! She is crouching near the door, whispering to you.")

		saynn("[say=ferri]..are you in there?..[/say]")

		saynn("[say=kait]Horny-y-y~.[/say]")

		saynn("You cover Kait's mouth.. she licks your fingers.")

		saynn("[say=pc]Tshh-.. yeah.. Eliza in the next one.. we need to get out somehow.[/say]")

		saynn("[say=ferri]..I brought something.. step away from the door.. as far as you can. And.. cover your ears.[/say]")

		saynn("Ferri then closes the door slit..")

		saynn("What's her plan? Hard to tell.. but you listen to her.")

		saynn("You move Kait into the corner of the padded room and cover her ears, bracing while also embracing.")

		addButton("Continue", "See what happens next", "boom_happens")
	if(state == "boom_happens"):
		aimCameraAndSetLocName("medical_paddedcell_player")
		playAnimation(StageScene.GivingBirth, "idle")
		saynn("Not even a minute passes before.. BOOM!")

		saynn("An explosion rocks the whole corridor.")

		saynn("The door.. shakes in its frame, metal groaning, hinges snapping. Dust and debris blast through the seams, filling the padded room with smoke.")

		saynn("Your ears ring.. a high, shape noise that drowns out anything else. Kait lets out a muffled squeak. You hold her tight, pressing both of you into the corner.")

		saynn("The padded walls absorb some of the shockwave.. but the whole room still shakes. A light above you dies almost instantly.")

		saynn("Then comes silence.. except for the ringing.")

		saynn("You cough and wave your hands to try to get the dust out of the way. Through the smoke, you see the door. It's still standing.. but barely.")

		addButton("Kick it!", "Kick the door", "kick_the_door")
	if(state == "kick_the_door"):
		playAnimation(StageScene.Solo, "kick")
		saynn("One good kick.. and the door crashes down, causing more dust to float up.")

		saynn("At least the air filtering outside seems to be still working..")

		saynn("You grab Kait and start bringing her out into the corridor.")

		addButton("Step out", "See what's happening outside", "ferri_gets_bullied")
	if(state == "ferri_gets_bullied"):
		aimCameraAndSetLocName("medical_near_pccell")
		GM.pc.setLocation("medical_near_pccell")
		playAnimation(StageScene.SexCowgirlChoke, "tease", {pc="ferri", npc="eliza"})
		saynn("You set Kait on the floor, away from the blown door. There are little shards of glass everywhere.. probably what used to be beakers.")

		saynn("[say=eliza]Do you realize what you DID, you silly thing?! Do you know what I'm gonna do to YOU for this?![/say]")

		saynn("Eliza Quinn.. is straddling Ferri.. and choking her. Both of them are dirty from the dust.")

		saynn("[say=ferri]S-sorry-y-y-.. hkhh..[/say]")

		saynn("[say=eliza]No-no-no, you can't 'sorry' yourself out of this. YOU are gonna experience a world of PAIN. I'm gonna fucking TORTURE YOU.[/say]")

		saynn("What a crazy bitch. Might as well interfere now.")

		saynn("[say=pc]Day is not going well, doctor? Where are your manners?[/say]")

		saynn("The feline stops choking the poor dracat.. and slowly rises up.")

		addButton("Continue", "See what happens next", "about_to_fight_eliza")
	if(state == "about_to_fight_eliza"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Eliza faces you, offering a very mean expression.")

		saynn("[say=eliza]My day, huh.. My day was going perfectly fine. Until you came in and destroyed my medical wing.[/say]")

		saynn("[say=pc]You didn't have to do this to Kait.[/say]")

		saynn("The doctor rolls her eyes.")

		saynn("[say=eliza]She deserved it.[/say]")

		saynn("[say=pc]Sure. And so do you.[/say]")

		saynn("Eliza tilts her head slightly, her tail wagging behind her in short bursts.")

		saynn("[say=eliza]Huh.. So this is it then. You versus me.[/say]")

		saynn("[say=pc]It seems so.[/say]")

		saynn("She reaches into her pockets and pouches, producing some syringes and vials. Her eyes light up.")

		saynn("[say=eliza]Fine. Let's do it then~.[/say]")

		addButton("Fight", "Start the fight", "start_fight")
	if(state == "eliza_fight_lost"):
		playAnimation(StageScene.GivingBirth, "idle")
		aimCameraAndSetLocName("medical_paddedcell_player")
		saynn("You've lost the fight!")

		saynn("Elize injects you with one of the drugs that she has.. and now nothing matters anymore. You feel nice and calm.")

		saynn("You join Kait, Avy and Ferri in the non-destroyed padded room..")

		saynn("And now you can just enjoy your time together, cuddling and resting on top of each other. So cute.")

		saynn("You failed to recruit Eliza Quinn. Looks like you will have to try it again some other time.")

		saynn("Mission failed!")

		addButton("Continue", "Stop the mission", "stopthemission")
		addButton("Restart", "Try the mission again", "trymissionagain")
	if(state == "eliza_fight_won"):
		playAnimation(StageScene.SexFeetPlay, "pin", {npc="eliza"})
		saynn("Eliza lost!")

		saynn("She is left panting on the floor, unable to continue fighting.")

		saynn("[say=eliza]Ugh.. crap..[/say]")

		saynn("She is on her back, trying to move away from you, dragging her butt along the floor.")

		saynn("It doesn't take long before you catch up with her and pin her in place.")

		saynn("[say=pc]Going somewhere?[/say]")

		if (getFlag("ElizaModule.s2hap", false)):
			saynn("[say=eliza]Gh.. Screw you.. Giving you access to my lab was a mistake.[/say]")

			saynn("[say=pc]I didn't need that lab. We got our own lab and our own chemist.[/say]")

		else:
			saynn("[say=eliza]Gh.. Screw you.. Using my lab against me is unfair..[/say]")

			saynn("[say=pc]We didn't need your lab. We got our own lab and our own chemist.[/say]")

		saynn("Speaking off.. You direct your attention towards Ferri. She is on the floor as well, recovering after Eliza's choking.")

		saynn("[say=pc]You okay, Ferri?[/say]")

		saynn("[say=ferri]I think so..[/say]")

		saynn("She slowly gets up and walks up to you.")

		saynn("[say=pc]I think both Avy and Kait got sedated. Is there something we can do?[/say]")

		saynn("[say=ferri]Well.. I don't have anything that can help with that.. mow..[/say]")

		saynn("[say=kait]Mow-w-w~.. Ferri so soft-t~.[/say]")

		saynn("Ferri indeed wouldn't have anything on her.. You look at Eliza.")

		saynn("[say=pc]What about her?[/say]")

		saynn("[say=eliza]Hey, I will scratch![/say]")

		saynn("[say=pc]And I will break your fingers if you do. C'mon, Ferri, search her.[/say]")

		saynn("Eliza pouts and growls.. but lets Ferri's paws go through her pockets.")

		saynn("[say=eliza]I really thought you were a good girl Ferri.[/say]")

		saynn("[say=ferri]I am a good girl, for {pc.name}~. Ohh, what's this?[/say]")

		saynn("Ferri finds a pill bottle with a label that says 'Anti-toxin'.")

		saynn("[say=kait]Owo~.[/say]")

		saynn("The dracat squints.. and makes Kait swallow a pill.")

		addButton("Continue", "See what happens next", "kait_becomes_okay")
	if(state == "kait_becomes_okay"):
		playAnimation(StageScene.SexStart, "start", {pc="ferri", npc="kait"})
		saynn("It only takes about a minute before Kait begins to.. turn her normal self.")

		saynn("[say=kait]Ow.. my head..[/say]")

		saynn("[say=ferri]You okay, miss?[/say]")

		saynn("[say=kait]No I'm not. Why the fuck am I in a straitjacket.[/say]")

		saynn("[say=eliza]It was for your own good, silly patient.[/say]")

		saynn("You pin the feline harder into the floor. Ferri goes ahead and visits Avy's padded room to give her an injection as well.")

		saynn("[say=kait]RIGHT. Fuck me. You were waiting for me! You knew I'd take the fucking bait! How?![/say]")

		saynn("[say=eliza]You're not exactly hard to predict, you know.[/say]")

		saynn("[say=kait]Bullshit! Did the nurse rat us out?[/say]")

		saynn("[say=eliza]That cutie is bad at hiding emotions.[/say]")

		saynn("[say=kait]Uh huh, I see. I fucking see it now.[/say]")

		saynn("[say=pc]Relax, Kait. We got her.[/say]")

		saynn("[say=eliza]And you only had to destroy half of the medical wing and beat up all my nurses! Great job![/say]")

		saynn("[say=kait]She is not ours yet. But first, take this fucking thing off of me![/say]")

		saynn("[say=avy]Why? I think you look perfect in it, Kait. I'd only lose the belt.[/say]")

		saynn("Looks like Avy is back. She is stretching, her muscles still looking sore after what happened.")

		saynn("[say=kait]Fuck you, Avy![/say]")

		saynn("[say=avy]So rude. After everything I've done to save you.[/say]")

		saynn("You go through Eliza's pockets yourself and find a key, labeled 'Kait'. Gives you an idea. You throw the key to Avy.")

		saynn("[say=pc]Just unlock her. I think we have a better person for this straitjacket.[/say]")

		saynn("[say=avy]Ohh. You might just be right.[/say]")

		saynn("[say=eliza]Don't you dare![/say]")

		saynn("Dare you will.")

		addButton("Continue", "See what happens next", "eliza_gets_jacket")
	if(state == "eliza_gets_jacket"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcBodyState={leashedBy="pc"}})
		saynn("After some time.. it's done.")

		saynn("[say=pc]Fits perfectly.[/say]")

		saynn("Both, the straitjacket and the chastity belt, are now on Eliza.. and even some kind of collar that Avy brought along. The feline tries to struggle.. but all the straps are secured tightly.. the doctor is only hugging herself harder. You clip a leash to her new collar.")

		saynn("[say=eliza]Grr-r.. You don't understand what you're doing.[/say]")

		saynn("[say=pc]Submit to us willingly. And maybe we won't have to do this then.[/say]")

		saynn("She furrows her brows and flashes her fangs.")

		saynn("[say=eliza]Never. You will never break me![/say]")

		saynn("[say=pc]We will see how you will sing when we're done with you.[/say]")

		saynn("You ask her to be blindfolded and gagged. Ferri grabs her clothes and stores them. You can't really do anything about the damage that you have caused.. but hopefully the engineers will take care of it.")

		saynn("[say=kait]Do I have to walk around naked?! Where is my uniform?![/say]")

		saynn("[say=avy]We don't have it, kitty cat. So I guess so, you just gotta engage your inner exhibitionist slut.[/say]")

		saynn("[say=kait]I'm not a slut![/say]")

		saynn("Kait growls.. and just covers herself with her paws and her fluffy tail. Good enough.")

		saynn("Time to walk back to the hideout.")

		addButton("Continue", "See what happens next", "back_lobby_show")
	if(state == "back_lobby_show"):
		aimCameraAndSetLocName("med_lobbyne")
		playAnimation(StageScene.Duo, "walk", {pc="eliza", npcAction="walk", flipNPC=true, bodyState={leashedBy="pc"}})
		saynn("You walk back to the medical lobby.. and meet zero resistance. Looks like all the nurses are indeed too scared to touch you now.")

		saynn("Eliza keeps bumping into walls and then grumbling, such a silly cat.")

		saynn("[say=pc]I thought you'd know your medical wing by now.[/say]")

		saynn("You only hear growling back, her tail wagging annoyed.")

		addButton("Hideout", "Bring the feline down to your place", "go_hideout")
	if(state == "go_hideout"):
		aimCameraAndSetLocName("hideout_breakroom")
		GM.pc.setLocation("hideout_near_break_room")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="kneel", npcBodyState={leashedBy="pc"}})
		saynn("You parade Eliza down to your hideout! The journey is just as uneventful, nobody seems to want to mess with your group. You do get quite a few eyes on you though.")

		saynn("The special little room is already waiting for Eliza. You bring her in and chain her to one of the pipes. The blindfold and the gag are now not needed so you take them off.")

		saynn("[say=pc]This isn't exactly a padded room but it will do for you.[/say]")

		saynn("[say=eliza]Really? Ugh.. so fucking dirty in here..[/say]")

		saynn("She finds a spot for herself and drops her butt onto the floor, the chastity belt clanking loudly as she does it.")

		saynn("[say=pc]Sit tight.[/say]")

		saynn("[say=eliza]You are gonna regret it.[/say]")

		saynn("[say=pc]And so you keep saying that.[/say]")

		addButton("Continue", "See what happens next", "eliza_back_stepout")
	if(state == "eliza_back_stepout"):
		playAnimation(StageScene.Duo, "stand", {pc="avy", npc="kait", npcBodyState={naked=true}})
		removeCharacter("eliza")
		aimCameraAndSetLocName("hideout_near_break_room")
		saynn("After you're done with Eliza, you step out of her new cell.")

		saynn("[say=kait]Cool. I'm gonna go find a new uniform for myself.[/say]")

		saynn("Kait was about to leave.. but Avy catches her by the arm.")

		saynn("[say=avy]I think you forgot something.[/say]")

		saynn("[say=kait]Huh? I didn't?[/say]")

		saynn("Kait tries to break free but Avy only tightens the grip.")

		saynn("[say=avy]We saved your ass, you know.[/say]")

		saynn("[say=kait]So? I would have done the same. Not for you maybe, you could use a therapy or two, weirdo.[/say]")

		saynn("Avy sighs. Kait's tail wags behind her.")

		saynn("[say=avy]Do you realize what we had to do to get you out? A little thanks would go a long way.[/say]")

		saynn("[say=kait]Huh? Is this a trick? Let me go get a fucking uniform, Avy.[/say]")

		addButton("Let Kait go", "(Avy's obedience +) Tell Avy that Kait shouldn't thank us", "let_kait_just_go")
		addButton("Side with Avy", "(Kait's obedience +) A little thanks wouldn't hurt", "make_kait_say_thanks")
	if(state == "let_kait_just_go"):
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		removeCharacter("kait")
		saynn("[say=pc]Kait, go get your uniform. Avy.[/say]")

		saynn("Avy furrows her brows.. but she does let the snow leopard go. Kait swiftly makes herself gone.")

		saynn("[say=avy]Really? You're spoiling her.[/say]")

		saynn("[say=pc]Swallow your pride, Avy. She suffered through enough.[/say]")

		saynn("The foxy crosses her arms. Ferri is still there, not quite sure what to do with Eliza's clothes. You point to one of the crates.")

		saynn("[say=avy]She caused it herself, you know.[/say]")

		saynn("[say=pc]She did what she thought was right. I'd probably do the same thing in her shoes.[/say]")

		saynn("An annoyed noise followed by the roll of her eyes.")

		saynn("[say=avy]Ugh. You're just picking favourites now.[/say]")

		saynn("[say=pc]We're a team, Avy. She would do the same for you.[/say]")

		saynn("[say=avy]I ain't buying that. That slut hates me.[/say]")

		saynn("[say=pc]Ever wondered why?[/say]")

		saynn("Avy huffs.")

		saynn("[say=pc]And she did save you once already, don't forget that.[/say]")

		saynn("[say=avy]Sure. Whatever.[/say]")

		saynn("Avy is visibly annoyed. She doesn't really deserve it.")

		saynn("[say=pc]I wanna thank you, Avy. You helped me a lot. And Ferri, you saved the day, thank you too.[/say]")

		saynn("Ferri blushes softly.")

		saynn("[say=ferri]It's okay.. mew.. I guess I will let you be.[/say]")

		saynn("You nod.")

		addButton("Continue", "See what happens next", "all_left_only_avy")
	if(state == "make_kait_say_thanks"):
		saynn("[say=pc]Kait. Swallow your pride. We had to blow the medical up to get you out. Well, Ferri had to. She saved the day.[/say]")

		saynn("Ferri blushes softly.")

		saynn("[say=kait]Fine.. Thanks, Ferri. You're a good girl.[/say]")

		saynn("You and Avy both stare at her.. for a long time.")

		saynn("[say=kait]Fine-e. Thank you, Ferri. Thank you, {pc.name}. Thank you.. Avy.. blrhrh-h..[/say]")

		saynn("Avy has a cute little smug smile on her face.")

		saynn("[say=avy]Cool. And now you should get on your knees and pleasure each one of us with your tongue.[/say]")

		saynn("[say=kait]PFf-, I knew this was a trick. Fuck you, Avy![/say]")

		saynn("[say=avy]I'm joking, you silly slut. Go get your shit.[/say]")

		saynn("Avy lets go of Kait's arm, allowing her to leave.")

		saynn("[say=ferri]Do you need me?..[/say]")

		saynn("[say=pc]No, you're free for now, Ferri. You did good. Really good.[/say]")

		saynn("[say=ferri]Thanks.. mew..[/say]")

		addButton("Continue", "See what happens next", "all_left_only_avy")
	if(state == "all_left_only_avy"):
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		removeCharacter("ferri")
		removeCharacter("kait")
		saynn("Now it's only you and Avy.")

		saynn("[say=pc]So. We gotta recruit Eliza now.[/say]")

		saynn("[say=avy]Yeah, let's break this stupid bitch.[/say]")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kait_reveal"):
		getCharacter("kait").getInventory().clearSlot(InventorySlot.Body)
		putOn("kait", "LatexStraitjacket")

	if(_action == "watch_start"):
		processTime(3*60)

	if(_action == "boom_happens"):
		processTime(2*60)

	if(_action == "start_fight"):
		runScene("FightScene", ["eliza"], "elizaFight")
		return

	if(_action == "stopthemission"):
		processTime(60*60*3)
		endScene()
		GM.pc.setLocation(GM.pc.getCellLocation())
		GM.main.MS.failCurrentMission()

	if(_action == "trymissionagain"):
		endScene()
		GM.main.MS.restartCurrentMission()
		return

	if(_action == "kait_becomes_okay"):
		processTime(2*60)
		getCharacter("kait").getInventory().clearSlot(InventorySlot.Body)
		putOn("kait", "LatexStraitjacket")

	if(_action == "eliza_gets_jacket"):
		processTime(3*60)
		getCharacter("eliza").getInventory().clearSlot(InventorySlot.Body)
		putOff("kait", "LatexStraitjacket")
		putOn("eliza", "LatexStraitjacket")
		putOn("eliza", "oldcollar")

	if(_action == "back_lobby_show"):
		processTime(5*60)
		putOn("eliza", "blindfold")
		putOn("eliza", "ballgag")

	if(_action == "go_hideout"):
		processTime(5*60)
		putOff("eliza", "blindfold")
		putOff("eliza", "ballgag")

	if(_action == "eliza_back_stepout"):
		getCharacter("kait").resetEquipment()

	if(_action == "all_left_only_avy"):
		addMessage("Task updated!")

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "elizaFight"):
		processTime(10 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("eliza_fight_won")
			addExperienceToPlayer(50)
		else:
			setState("eliza_fight_lost")
			addExperienceToPlayer(5)
