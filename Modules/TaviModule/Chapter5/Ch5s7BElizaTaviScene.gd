extends SceneBase

func _init():
	sceneID = "Ch5s7BElizaTaviScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You decide not to waste time and ask the doctor outright.")

		saynn("[say=pc]Where is Tavi?[/say]")

		saynn("Eliza smirks as she makes a quick last sip out of her special coffee mug.")

		saynn("[say=eliza]You came to check on her? She is doing better than expected~.[/say]")

		saynn("[say=pc]What do you mean?[/say]")

		saynn("[say=eliza]I think it's best if you see it yourself~.[/say]")

		saynn("The feline leaves the counter and shows up behind one of the staff-only doors. She offers you to follow her deep into the medical wing.")

		addButton("Follow", "See where she brings you", "follow_eliza")
	if(state == "follow_eliza"):
		aimCameraAndSetLocName("med_milkingroom")
		saynn("Doctor Quinn convoys you through the white sterile corridors.")

		saynn("[say=eliza]I was pretty happy when that order came up. Tavi is a.. unique case. But don't worry, I handled it in the best way possible.[/say]")

		saynn("What is she talking about..")

		saynn("You enter some kind.. milking room. Lots of special equipment that is designed just for that. But Eliza brings you further into some secluded space.")

		saynn("Is that.. Tavi's moans?..")

		addButton("Continue", "See what happens next", "tavi_reveal")
	if(state == "tavi_reveal"):
		addCharacter("tavi", ["naked"])
		playAnimation(StageScene.BDSMMachineFuck, "wand", {pc="tavi", bodyState={naked=true, hard=true}})
		saynn("You walk in and see Tavi.. trapped in some kind of.. machine. Her arms and legs are being held by special mechanical arms while a magic wand is pressed against her exposed pussy, vibrating so much that Tavi can't stop squirming and making those desperate noises.")

		saynn("[say=tavi]NGh-h-h!.. Ahh-h-h.. f-f-fh-hk-..[/say]")

		saynn("[say=pc]Tavi![/say]")

		saynn("You try to approach her but Eliza stops you, her other paw is resting on her shock remote.")

		saynn("[say=eliza]She can't hear you. Earplugs.[/say]")

		saynn("Yeah.. Tavi looks quite.. spaced out.. Her gaze is constantly directed to some screen that keeps count of her orgasms.. 387.. Wow.. Suddenly Tavi starts arching her back, her green moist pussy pulsating before squirting out some of her juices.. 388.")

		saynn("Even when the feline tries to look away, the mechanical hand with the screen follows her movements. And if she tries to close her eyes.. the buzzing only gets louder. You notice that the screen also.. praises Tavi?.. For being a good girl.")

		saynn("[say=pc]The fuck are you doing to her?[/say]")

		saynn("[say=eliza]It's called.. Positive enforced reinforcement learning therapy. A real mouthful, I know. It's an experimental tech to improve someone's behavior.[/say]")

		saynn("Eliza approaches Tavi and pats her on the head. All the while the feline can't stop drooling, her eyes constantly trying to roll up but the toy is forcing her to stay actively engaged. You hear.. words.. coming out of her earplugs.. Tavi is also being forced to listen to something.")

		saynn("[say=tavi]Nghh-h-h.. ah-h-h.. h-h-h.[/say]")

		saynn("[say=eliza]And I think it's a success.. Even after a few first hours our patient has already begun showing signs of improvement. Tavi here stopped hissing at me.. No more threats to kill me or anyone else too. Basically she is gonna be less prone to cause conflicts from now on. A perfect trait for an inmate to have. I think this is her.. fifth session already?[/say]")

		saynn("That is.. wow.. You're not even sure how to react yet. Eliza returns to you with a biggest smile on her head.")

		saynn("[say=eliza]There were some complications at first. Did you know that she is still a virgin~? This patient managed to keep herself from having any penetrative sex acts all this time. I think that will change soon though.. But I decided to use external vibrations as a vector of influence instead for now. I would be quite.. humiliated.. if my virginity was taken.. by a machine. What do you think?[/say]")

		saynn("[say=tavi]KH-h-h!.. AH-hHh!..[/say]")

		saynn("Another few orgasms rock Tavi's body. Her poor pussy looks much more green than usually, the sensitive skin there is so irritated by this point that her folds.. are glowing..")

		addButton("Continue", "See what happens next", "tavi_stop_vib")
	if(state == "tavi_stop_vib"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="tavi", bodyState={naked=true, hard=true}})
		saynn("As the screen hits the number 400.. the machine suddenly turns off.. Tavi is still held in place but the magic wand tool stops vibrating and gets retracted away from her pulsing squirting pussy.")

		saynn("Eliza starts freeing Tavi.")

		saynn("[say=eliza]Should be it, she is yours now.[/say]")

		saynn("[say=pc]What do you mean?[/say]")

		saynn("Doctor tries to help Tavi to get up. But her legs are still shaking, causing the tall kitty to drop to her knees before you two.")

		addButton("Continue", "See what happens next", "tavi_on_her_knees")
	if(state == "tavi_on_her_knees"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="kneel", npcBodyState={naked=true}})
		saynn("[say=tavi]Ngh-h.. Is that it?.. I can take more.. I wanna take more..[/say]")

		saynn("Eliza smiles and pats Tavi on the head.")

		saynn("[say=eliza]I think this patient is no longer.. capable.. of having any control over others. So you might as well grab her leash.. before someone else does. If you know what I mean~.[/say]")

		saynn("Tavi nuzzles into the pats and slowly calms down after that.. therapy.. her paws sliding over her own curves.. groping her perky tits.. rubbing her wet crotch.. in your clear view.")

		saynn("[say=tavi]Mur-r-r.. Yes.. Please leash this slutty pet.. and then pin her against something.. and then.. and then..[/say]")

		saynn("Eliza slides some digits into Tavi's mouth before she gets too excited. The purple feline obediently starts sucking on them while looking up at you with her lusty eyes. You can't.. believe.. what they did with Tavi..")

		saynn("The doctor grabs a chain leash and offers it to you.")

		addButton("Attack Eliza", "She did this.. She must pay..", "attack_eliza")
		addButton("Leash Tavi", "Grab Tavi's leash and leave this place..", "grab_the_leash")
	if(state == "grab_the_leash"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="allfours", further=true, npcBodyState={naked=true, leashedBy="pc"}})
		saynn("You can't really fix anything now. So might as well just go with the flow.")

		saynn("As you fetch the leash from Eliza, Tavi is already crawling up to you, her snout rubbing against your {pc.masc} thigh.")

		saynn("[say=tavi]Will you fuck me?.. Will you fuck me ple-e-ease?.. Pretty please?..[/say]")

		saynn("[say=pc]Let's get you out of here first..[/say]")

		saynn("So strange to see her like this. You click the leash to her collar and grab the other end. Eliza just can't hide how smug she is about this whole situation.")

		saynn("[say=pc]Where is her.. uniform?[/say]")

		saynn("[say=eliza]Oh, her original one got a little torn up. I ordered a new one. It's in her cell.[/say]")

		saynn("Right.. So Tavi is gonna stay naked for now.. And she can't really stand up because her body is too exhausted..")

		saynn("[say=eliza]Ready? Follow me then~.[/say]")

		addButton("Follow", "See where Eliza brings you", "follow_to_lobby")
	if(state == "follow_to_lobby"):
		playAnimation(StageScene.Duo, "walk", {npc="tavi", npcAction="crawl", flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
		removeCharacter("eliza")
		aimCameraAndSetLocName("med_lobbynw")
		saynn("Eliza brings you out into the lobby. Leashed Tavi is crawling by your side, catching many gazes from the random nurses. And she doesn't seem.. uncomfortable.")

		saynn("[say=eliza]That's where I leave you~. Have fun.[/say]")

		saynn("[say=pc]Wait. How do I.. make her act normal again?[/say]")

		saynn("Eliza raises a brow while Tavi puts her head under your hand, making you pet and stroke her.")

		saynn("[say=eliza]Why though~? Isn't she much more cute and adorable this way? She will do anything you want.[/say]")

		saynn("[say=pc]Yeah, but..[/say]")

		saynn("Eliza walks up to you and leans closer to your ear, her voice becoming more intimidating.")

		saynn("[say=eliza]Listen. Tavi was a huge pain in the ass for everyone. She is still Tavi. She has all her memories. And she regrets what she did. But now she has found a better path. You should help her follow it.[/say]")

		saynn("Right.. Eliza offers you a kind smile and then finally leaves you and Tavi alone.")

		saynn("[say=tavi]What did miss Eliza say..[/say]")

		saynn("[say=pc]Nothing. Let's go Tavi. You look tired.[/say]")

		saynn("You walk up to the elevator doors and press the button to call it.")

		saynn("[say=tavi]I wanna hump you while we cuddle~. Should I call you an owner, owner?[/say]")

		saynn("[say=pc]I'm not your owner.. You are my owner, Tavi.[/say]")

		saynn("Tavi bleps. It seems.. you will have to be her owner for now..")

		addButton("Continue", "See what happens next", "tavi_in_cellblock")
	if(state == "tavi_in_cellblock"):
		playAnimation(StageScene.Duo, "walk", {npc="tavi", npcAction="crawl", flipNPC=true, npcBodyState={naked=true, leashedBy="pc"}})
		aimCameraAndSetLocName("hall_mainentrance")
		saynn("You walk Tavi into the main hall. The checkpoint guard laughs when he sees her crawling past him. But hearing her hiss at him catches him off-guard. Huh.")

		saynn("Other inmates are staring at your new pet as well.. It's hard not to when her green shiny privates are on display.. Tavi leaves a little trail of her pussy juices behind her as she crawls near you.")

		saynn("[say=tavi]Everyone is looking at me.. They probably want my needy pussy.. Or my tits?.. My long rough tongue?[/say]")

		saynn("Yeah, better pull her out of there before you are surrounded.")

		addButton("Tavi's cell", "Find her cell", "find_tavi_cell")
	if(state == "find_tavi_cell"):
		aimCameraAndSetLocName("cellblock_red_nearcell")
		GM.pc.setLocation("cellblock_red_nearcell")
		playAnimation(StageScene.Sleeping, "idle", {pc="tavi", bodyState={naked=true}})
		setFlag("TaviModule.Ch5TaviSavedDay", GM.main.getDays())
		saynn("You go down to the level where all the cell blocks are and enter the high security one.")

		saynn("[say=pc]Where is your cell, Tavi?[/say]")

		saynn("She points at one of the cells. Huh, strange. You don't remember ever being in her cell.")

		saynn("You enter it and see.. just a normal cell. The only unique thing about it is that.. It's perfectly clean. There is also an inmate uniform waiting on the bed.")

		saynn("[say=pc]Are you ready to talk?[/say]")

		saynn("[say=tavi]About what.. Did I do something wrong?.. Are you gonna punish your slut?.. Choke her a little bit maybe?..[/say]")

		saynn("Right.. It's probably best to let Tavi rest another day before asking anything.")

		saynn("[say=pc]Nevermind. I want you to be in your cell, okay? You need rest.[/say]")

		saynn("[say=tavi]Sure, I can do that.. But will you come and play with me soon? I promise to be a good slut![/say]")

		saynn("You sigh and nod. Tavi purrs happily. She climbs onto her bed and just.. flops onto it. Still naked. You pull the blanket over her and tuck her in.")

		saynn("Time to go..")

		addButton("Continue", "This was something..", "endthescene")
	if(state == "attack_eliza"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You can't let her get away with it.. So you wait for a good moment and try to grab Eliza. She clearly expected that because her hand reaches out for her shock remote almost instantly.")

		saynn("Luckily, you managed to slap it out of her paw before she presses anything on it.")

		saynn("[say=eliza]Hah. You're so angry. Actions come with consequences. Both of you should have learned that already.[/say]")

		saynn("[say=pc]You're about to learn that too.[/say]")

		saynn("Seems it's a fight..")

		addButton("Fight", "Start the fight", "start_eliza_fight")
	if(state == "lost_eliza"):
		playAnimation(StageScene.Duo, "defeat", {npc="eliza"})
		saynn("Defeated, you collapse to your knees. Eliza extends her claws and presses them into your shoulder, forcing a painful noise out of you.")

		saynn("[say=eliza]See, you can't change anything. Relax. Or I will test the therapy on you as well.[/say]")

		saynn("She offers you the leash again.. It seems there is no other choice.")

		addButton("Leash Tavi", "Grab Tavi's leash and leave this place..", "grab_the_leash")
	if(state == "won_eliza"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="defeat"})
		saynn("Eliza hisses as she hits the floor. She lost. And that gives you the right to do anything with her.")

		saynn("[say=eliza]Argh.. It's too late.. Tavi is nothing but a slut now. She is not gonna be our problem ever again.[/say]")

		saynn("Her words fill you with rage.. There is only one thing you can do now to get at least some kind of revenge.. Throw her into the machine she created.")

		saynn("[say=pc]What happened to fixing rather than breaking?[/say]")

		saynn("Doctor pants heavily but she also has a big smirk on her face.")

		saynn("[say=eliza]What about it? She is still Tavi, with all her memories of all the terrible things she did. And trust me, she regrets every single one.[/say]")

		saynn("You start forcibly taking off Eliza's clothes. She tries to resist but a few slaps on her face make her come around. Underneath her top and long skirt.. are some fancy black lacy undergarments.. that you just pull off.")

		saynn("[say=eliza]H-hey! Just fuck your new slut, not me![/say]")

		saynn("[say=pc]Who said that I will be the one fucking you?[/say]")

		addButton("Machine", "Tie Eliza to the machine", "tie_eliza_machine")
	if(state == "tie_eliza_machine"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {pc="eliza", bodyState={naked=true}})
		saynn("You grab and throw Eliza onto the same table that Tavi was on. You quickly secure her wrists and ankles using the mechanical arms, making doctor Quinn completely helpless.")

		saynn("[say=eliza]Stop it! Release me! At once![/say]")

		saynn("You find the control panel. Oh wow. There are more buttons that you thought there would be. Enough for you to have all the fun.")

		saynn("[say=pc]How about this instead.[/say]")

		addButton("Magic wand", "Turn on the machine", "eliza_magic_wand")
	if(state == "eliza_magic_wand"):
		playAnimation(StageScene.BDSMMachineFuck, "wand", {pc="eliza", bodyState={naked=true}})
		saynn("You press a button that causes the machine to extend its magic wand tool. It wastes no time, pressing it directly against Eliza's pussy before turning the vibrations on.")

		saynn("[say=eliza]Ah!..[/say]")

		saynn("The feline trembles, trying to struggle against the arms but the machine has her firmly in place. And even if she tries to move out of the way, the magic wand follows her movements, pushing its vibrating sphere firmly against that pink slit.")

		saynn("[say=eliza]No!.. Stop it.. F-fuck!..[/say]")

		saynn("She is still fighting against the machine, her body straining and contorting in a desperate attempt to escape the overwhelming sensations. But very soon, she begins losing.. More and more moans start escaping from her lips as her sensitive folds become all wet and needy.")

		saynn("[say=pc]You're just a slut. Tell me how to fix Tavi or this will quickly get worse.[/say]")

		saynn("[say=eliza]Ahaha!.. You can't! She is already fixed! And I'm not!.. I'm not a slut.. Ah-h.. T-this is t-too m-much.. F-fu-uck..[/say]")

		saynn("Tavi had to go through this. So might as well let the doctor feel the same. You find some buttons that turn on the screen and make it show some kind of hardcore porn for Eliza. If she closes her eyes or looks away, the wand instantly buzzes harder, making it painful even.")

		saynn("[say=eliza]N-no!.. S-stupid.. M-machine.. Ah-h-h!..[/say]")

		saynn("You can tell that she is close already, Eliza is squirming a lot. Oh, wait. 'Edging' mode? Interesting. You flick the switch and notice how the vibrations are now carefully controlled by the machine. As soon as it detects that Eliza is about to cum, it instantly lowers the stimulation to the painfully low levels.")

		saynn("[say=eliza]Ah!.. I was close!.. F-fuck you!.. P-please!.. I c-can't!..[/say]")

		saynn("[say=pc]Say that you're a slut?[/say]")

		saynn("[say=eliza]N-no!.. Never!..[/say]")

		saynn("You shrug and let the machine bring her to the edge again. Eliza's pussy is twitching and leaking juices so much.. but she never actually cums. Poor feline is thrashing hard against the arms that restrain her but she can't do anything. She can only endure this torture.")

		saynn("[say=eliza]F-fine!.. I'm a slut!.. A whore.. A bitch.. A cunt.. Anyone you want me to be, just let me cum, ple-e-ease!..[/say]")

		saynn("Good enough. You turn off the edging mode and watch Eliza getting forced over her edge in seconds. She finally succumbs to the overpowering sensations, her body convulsing uncontrollably as waves of pleasure are crashing over her.")

		saynn("[say=eliza]Ah-h~!.. Y-yes!.. F-fuck yes!.. So good..[/say]")

		saynn("[say=pc]And we're not gonna stop there. Since you're such a good slut, you deserve all of it.[/say]")

		saynn("[say=eliza]W-what?.. N-no!.. It's too much!..[/say]")

		saynn("Huh, what does this button do?")

		addButton("Dildo", "Press some button", "eliza_dildo_start")
	if(state == "eliza_dildo_start"):
		playAnimation(StageScene.BDSMMachineFuck, "sex", {pc="eliza", bodyState={naked=true}})
		saynn("You press it and a magic wand tool gets retracted.. replaced by something much better.. a dildo! It extends further until the tip finds Eliza's pussy and prods at the wet entrance a few times.")

		saynn("[say=eliza]H-hey! I-it will break me!..[/say]")

		saynn("[say=pc]Good.[/say]")

		saynn("Eliza gasps as she machine thrusts that pink dildo inside, spreading her slick folds and filling her completely as it delves deep into her inviting depths. A mix of pleasure and anger escaping her lips as the machine starts fucking her relentlessly, forcing that rubber cock inside her again and again..")

		saynn("Eliza's senses get overloaded as the machine pushes her closer to the edge once again. Her pulsating walls are tightening around the rubber shaft before her pussy suddenly produces a fountain of juices.")

		saynn("[say=eliza]Ngh-h!..[/say]")

		saynn("All this time Tavi is just catching her breath sitting on the floor. She seems quite jealous though.")

		saynn("You're not done yet..")

		addButton("Faster", "Make the machine fuck Eliza faster", "eliza_dildo_faster")
	if(state == "eliza_dildo_faster"):
		playAnimation(StageScene.BDSMMachineFuck, "fast", {pc="eliza", bodyState={naked=true}})
		saynn("You're not walking away until Eliza has truly learned her lesson. You raise the dial that makes the dildo thrust into the doctor's pussy harder and faster. The feline is moaning passionately, making you wonder how much time you still have before someone hears all these noises and stops you.")

		saynn("[say=pc]You wanted to cum. You gonna cum.[/say]")

		saynn("[say=eliza]E-enough-h-h!.. Ah-h-!.. It's too mu-u-uch!..[/say]")

		saynn("Her tongue is out. She is drooling actively while her body does its best to struggle against the heartless machine. But the more she tries to free her limbs, the harder the mechanical arms spread them and the deeper that dildo gets rammed down her snatch. You even notice a bump on her crotch appearing as the toy smashes into her cervix.")

		saynn("Doesn't take long before Eliza arches her back yet again, her pussy squirting all over the dildo that's fucking her non-stop.")

		saynn("[say=eliza]F-Fu-uck!..[/say]")

		saynn("So mouthy.. You realize that the screen that Eliza is forced to watch displays the correct amount of times that she has orgasmed so far: 3. Seems kinda low.. Ohh, what this?")

		addButton("Double Trouble", "Press a mysterious button", "eliza_dildo_double")
	if(state == "eliza_dildo_double"):
		playAnimation(StageScene.BDSMMachineFuck, "sexdouble", {pc="eliza", bodyState={naked=true}})
		saynn("You press a button that causes the dildo to retract.. Letting Eliza rest and catch her breath for just a second.")

		saynn("[say=eliza]F-Finally.. you..[/say]")

		saynn("But that was just a little pause because the machine needed to transform a little. The pink rubber dildo gets rammed down her stretched wet cunt yet again.. making the feline gasp.. and at the same time, another dildo prods against her tailhole, trying to align itself.")

		saynn("[say=eliza]H-hey! Not there! NO! AH!..[/say]")

		saynn("Machines can't hear. The dildo forcefully stretches Eliza's tight-looking anal star and gets rammed inside. The feline tries her best to clench her ass but that only makes the servos of the machine whirl louder as it starts double-penetrating her, stuffing both of her holes with roughly the same rhythm.")

		saynn("Even Tavi is a little surprised by.. how capable that feline's holes are.")

		saynn("[say=eliza]F-fuck.. Fuck me.. Ah..[/say]")

		saynn("Eliza is lacking the earplugs that Tavi had but even just the screen displaying porn and various praising words makes Eliza's defense melt. Her tongue is out yet again as her eyes start rolling up from the overstimulation. Very soon her holes start visible pulsating again as her pussy produces another little gush of juices. It's obvious when her orgasm happens because she starts curling her toes and trying to arch her body.")

		saynn("[say=pc]You're a whore, Eliza. You'd love it if it was two actual cocks, didn't you?[/say]")

		saynn("[say=eliza]NGh-h-h!.. N-n.. No-o.. H-h~..[/say]")

		saynn("Really? She didn't break yet? Time to push this little experimental machine to its limits then.")

		addButton("Faster", "Break Eliza", "eliza_dildo_double_fast")
	if(state == "eliza_dildo_double_fast"):
		playAnimation(StageScene.BDSMMachineFuck, "fastdouble", {pc="eliza", bodyState={naked=true}})
		saynn("You raise an intensity slider to its maximum.. and see how the machine starts plunging its 2 dildos into Eliza with incredible strength. Instead of being forced inside at the same time, they alternate, making sure the feline's stretched holes are never empty.")

		saynn("[say=eliza]Oh f-fu.. Nh-h-h!.. AH![/say]")

		saynn("Almost instantly, Eliza cums yet again. Her tired body squirming non-stop as loud cries of pleasure escape her lips. They don't even sound like words anymore, just noises.")

		saynn("[say=eliza]Nghh.. y-ye..s.. Uh.. Ah.. I c-c..can't..[/say]")

		saynn("Her body succumbs to this intense fucking, her walls contract around the dildos, gripping them in a desperate attempt to find escape from this overwhelming pleasure.. But there is no escape.. Eliza is forced to endure orgasms happening one after another, ecstasy clouding her mind completely while the room starts smelling of sex..")

		saynn("[say=eliza]C-can't s-stop.. c-cumming-g-g.. ngh-h~!..[/say]")

		saynn("Perfect. The orgasm counter on the screen ticks up roughly every half a minute. By now it has already hit 20.. 21.")

		saynn("[say=pc]That's for Tavi.[/say]")

		saynn("The purple kitty is sitting on all fours near you. Is that.. leash in her mouth? She is offering for you to take it.")

		saynn("[say=pc]You're alright, Miss Tavi? Where are your clothes?[/say]")

		saynn("Tavi just bleps.")

		saynn("[say=pc]Right.. Can you get up?[/say]")

		saynn("You try to help her but her legs are still shaky after that huge amount of orgasms she received.")

		saynn("[say=tavi]It's okay.. I will crawl.. Should I call you an owner, owner?[/say]")

		saynn("[say=pc]I'm not your owner.. You are my owner, Tavi.[/say]")

		saynn("Tavi bleps again. It seems.. you will have to be her owner for now..")

		addButton("Leash her", "Put Tavi on a leash", "leash_tavi_after_eliza_fuck")
	if(state == "leash_tavi_after_eliza_fuck"):
		removeCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcAction="allfours", further=true, npcBodyState={naked=true, leashedBy="pc"}})
		aimCameraAndSetLocName("med_lobbynw")
		setFlag("TaviModule.Ch5ElizaGotTortured", true)
		saynn("Since she wants it so much.. Sure. You grab the leash and clip to Tavi's collar, causing her to start purring. This machine sure did mess with her mind..")

		saynn("You prepare to leave. Eliza is still moaning loudly, her voice starts to sound raspy by this point. Someone will surely find and help her. But she is not your problem.")

		saynn("Tavi crawls near as you step in the medical lobby. All the random nurses are looking at you and your new pet.")

		saynn("You ignore their eyes and walk up to the elevator doors before pressing the button to call it.")

		saynn("[say=tavi]It looked fun, what you did to Miss Quinn back there.[/say]")

		saynn("Miss Quinn, huh.")

		addButton("Continue", "See what happens next", "tavi_in_cellblock")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "tavi_reveal"):
		processTime(3*60)

	if(_action == "tavi_in_cellblock"):
		processTime(5*60)

	if(_action == "find_tavi_cell"):
		processTime(5*60)

	if(_action == "start_eliza_fight"):
		runScene("FightScene", ["eliza"], "eliza_fight")
		return

	if(_action == "tie_eliza_machine"):
		processTime(3*60)

	if(_action == "eliza_dildo_start"):
		processTime(5*60)

	if(_action == "eliza_dildo_faster"):
		processTime(3*60)

	if(_action == "eliza_dildo_double"):
		processTime(3*60)

	if(_action == "eliza_dildo_double_fast"):
		processTime(6*60)

	if(_action == "leash_tavi_after_eliza_fuck"):
		processTime(3*60)

	setState(_action)

func _react_scene_end(_tag, _result):
	if(_tag == "eliza_fight"):
		processTime(20 * 60)
		var battlestate = _result[0]
		
		if(battlestate == "win"):
			setState("won_eliza")
			addExperienceToPlayer(50)
		else:
			setState("lost_eliza")

func getDevCommentary():
	return "This scene.. Why did I do that?\n\nWell.. I just wanted to show that Tavi isn't untouchable I guess. She has to suffer somehow x3\n\nAnd.. also. Tavi's route is a route for switch people. So I needed this switch to happen at some point x3"

func hasDevCommentary():
	return true
