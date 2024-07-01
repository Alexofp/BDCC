extends SceneBase

var bratCounter = 0
var breastPumpID = ""
var penisPumpID = ""
var hasPenisPump = false
var isLact = false
var totalMilk = 0.0
var totalSeed = 0.0
var inducedLact = false

func _init():
	sceneID = "AlexTrustExercise3Scene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("You walk up to Alex and wait for a good moment to ask.")

		saynn("[say=pc]Can we do a trust exercise? The third one?[/say]")

		if (GM.pc.hasBoundArms() || GM.pc.hasBlockedHands() || GM.pc.hasBoundLegs() || GM.pc.isBlindfolded() || GM.pc.isGagged() || GM.pc.isWearingPortalPanties()):
			saynn("Alex notices your restraints and hums")

			saynn("[say=alexrynard]Kinky. But I need your body to be fully free.[/say]")

			saynn("Huff, what a buzzkill. Looks like you have to struggle out of your restraints first.")

			addButton("Oh well", "Was worth a try", "endthescene")
		elif (GM.pc.hasEffect(StatusEffect.CoveredInCum)):
			saynn("Alex notices how messy you are and sighs.")

			saynn("[say=alexrynard]Please clean yourself first. You're way too messy.[/say]")

			saynn("Huff, what a buzzkill. Looks like you will have to take a shower first.")

			addButton("Oh well", "Was worth a try", "endthescene")
		else:
			saynn("Alex quickly checks you and your outfit out before nodding.")

			saynn("[say=alexrynard]Sure, we can go ask Eliza about letting us use her.. equipment.[/say]")

			saynn("[say=pc]You made it though. It's your equipment.[/say]")

			saynn("He sighs.")

			saynn("[say=alexrynard]If only I knew how she would use it..[/say]")

			addButton("Follow", "See where he brings you", "brought_medical")
	if(state == "brought_medical"):
		aimCameraAndSetLocName("med_lobby_start")
		if (getFlag("MedicalModule.Eliza_BusyDays", 0) > 0):
			saynn("You and Alex walk into the medical lobby.. but Eliza is nowhere to be seen.")

			saynn("[say=alexrynard]Looks like she is busy. Sorry.[/say]")

			saynn("[say=pc]Can't we just.. sneak in?[/say]")

			saynn("He shakes his head.")

			saynn("[say=alexrynard]Nope.[/say]")

			saynn("[say=pc]Why not?[/say]")

			saynn("He sighs.")

			saynn("[say=alexrynard]If somebody catches us, Eliza will know. And then.. no fun rides for you. Now you get it?[/say]")

			saynn("That makes a lot of sense. Alex helps you to get back to the workshop.")

			addButton("Continue", "See what happens next", "endthescene")
		else:
			addCharacter("eliza")
			playAnimation(StageScene.Duo, "stand", {npc="eliza", pc="alexrynard"})
			saynn("You and Alex walk into the medical lobby. Eliza seems to be in her usual spot, drinking coffee out of her mag.")

			saynn("She notices you two and smiles.")

			saynn("[say=eliza]Oh! Stay there.[/say]")

			saynn("She quickly leaves the counter and shows up from one of the staff-only doors.")

			saynn("[say=alexrynard]Hello, Doctor Quinn.[/say]")

			saynn("[say=eliza]Hey there, Alex~. There is nothing to fix today, sadly.[/say]")

			saynn("Foxy scratches the back of his head.")

			saynn("[say=alexrynard]Well.. we're actually..[/say]")

			saynn("[say=eliza]OHH! I understand~. I will guide you right to it~.[/say]")

			saynn("Eliza turns around and invites you to follow.")

			addButton("Follow", "See where you end up", "eliza_brings_to_milking_room")
	if(state == "eliza_brings_to_milking_room"):
		playAnimation(StageScene.Duo, "stand", {npc="pc", pc="eliza"})
		aimCameraAndSetLocName("med_milkingroom")
		GM.pc.setLocation("med_lobbynw")
		saynn("A few white corridors later, you end up in the special little secluded room where the advanced table is positioned.")

		saynn("[say=eliza]There we are. Want me to show you how to use it~?[/say]")

		saynn("[say=alexrynard]I can figure out my own tech, thank you.[/say]")

		saynn("Eliza smiles and nods.")

		saynn("[say=eliza]Well, have fun. I'm gonna go finish my coffee.. and pour another one.[/say]")

		saynn("She looks at Alex.")

		saynn("[say=eliza]Don't be a stranger~.[/say]")

		saynn("[say=alexrynard]Uh huh.[/say]")

		saynn("And, after that, she leaves you two to it.")

		addButton("Continue", "See what happens next", "eliza_leaves_you_two")
	if(state == "eliza_leaves_you_two"):
		removeCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("[say=alexrynard]Right.. That's why I prefer talking with robots.[/say]")

		saynn("[say=pc]She likes you.[/say]")

		saynn("[say=alexrynard]Or maybe she just likes my creations.[/say]")

		saynn("You both stare at the table. It seems to be.. squeaky clean. Who knows how it looks on the inside though.")

		saynn("[say=alexrynard]Either way, you know what we're gonna do. I hear 'Red', I stop. If I don't.. no mercy will be given.[/say]")

		saynn("He boots the computer that is attached to the table.")

		saynn("[say=alexrynard]While I'm preparing everything.. clothes off.[/say]")

		addButton("Yes Sir", "Undress before him", "1_yessir")
		addButton("Make me!", "Refuse without force", "1_brat")
		addButton("RED", "Say this", "1_red")
	if(state == "1_red"):
		saynn("[say=pc]RE-..[/say]")

		saynn("Before you can finish saying that, Alex suddenly puts his hand on your lips and closes them shut! He sighs and stares you in the eyes.")

		saynn("[say=alexrynard]I literally haven't done anything to you. What's the problem, you changed your mind already?[/say]")

		saynn("He stops holding your lips, letting you say something.")

		saynn("[say=alexrynard]And don't you dare..[/say]")

		addButton("Yes", "Stop this scene", "1_red_yes")
		addButton("No", "You're just being a brat", "1_red_no")
		addButton("RED!!!", "Now is the perfect time", "1_red_red")
	if(state == "1_red_red"):
		playAnimation(StageScene.Spanking, "fast", {npc="pc", pc="alexrynard"})
		saynn("[say=pc]RE-!..[/say]")

		saynn("You don't even finish saying that word.. He knew it.. And he was ready.")

		saynn("Like a hungry predator, he pins you down to the floor and.. spanks your ass like its drums and he is practicing for his solo.")

		saynn("[say=pc]Agh!..[/say]")

		saynn("[say=alexrynard]I understand some bratting. But you're purposely destroying the scene that I'm creating![/say]")

		saynn("Your butt quickly becomes red.. Each impact is stinging more and more.")

		saynn("[say=alexrynard]Bad.. Brats.. Get.. Bad.. Punishments.[/say]")

		saynn("He slaps your rear between each word.")

		saynn("[say=pc]Fuck.. I'm sorry![/say]")

		saynn("After that rush of passion.. he finally snaps out of it.")

		saynn("[say=alexrynard]Right.. Now get out of here.[/say]")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1_red_no"):
		saynn("[say=pc]No..[/say]")

		saynn("[say=alexrynard]Right. So you're just being a brat then.[/say]")

		saynn("He looks at you, his eyes are strict..")

		saynn("[say=alexrynard]Take off your clothes.[/say]")

		saynn("..and so is his voice.")

		addButton("Yes Sir", "Undress before him", "1_yessir")
		addButton("Make me!", "Refuse without force", "1_brat")
	if(state == "1_red_yes"):
		saynn("[say=pc]Yeah, sorry..[/say]")

		saynn("He nods understandably and turns off the computer.")

		saynn("[say=alexrynard]Alright, well, I understand. Let's go back.[/say]")

		saynn("And so he helps you get back to the workshop. Such a nice foxy.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1_brat"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", bodyState={naked=true}})
		saynn("[say=pc]Make me~.[/say]")

		saynn("You refuse to undress, wondering what he would do then.")

		saynn("[say=alexrynard]Why would I make you..[/say]")

		saynn("Aww, is he surrendering already?")

		saynn("[say=alexrynard]When I can just do this.[/say]")

		saynn("He pressed some buttons on the computer, causing the table's manipulators to suddenly reach out for your clothes! They {pc.undressMessage}, leaving you completely naked for him!")

		saynn("[say=pc]HEY! Not fair! Give it back![/say]")

		saynn("He chuckles. You try to free your belongings from the mechanical claws.. but with such grip you can only tear your clothes apart.")

		saynn("[say=alexrynard]Make me.[/say]")

		saynn("You pout and cover yourself.")

		saynn("[say=alexrynard]Now.. just stand still.[/say]")

		addButton("RUN!", "You're never gonna listen to what he says", "2_brat")
		addButton("Stay still", "Do as he says", "2_stay")
		addButton("RED", "Say this", "2_red")
	if(state == "2_red"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("[say=pc]RED.[/say]")

		saynn("Alex tilts his head slightly.")

		saynn("[say=alexrynard]A little too much for you?[/say]")

		saynn("You nod softly.")

		saynn("[say=alexrynard]Well, my bad. Don't think aftercare is required here.. since we didn't really do anything.[/say]")

		saynn("Fair enough. He guides you back to the medical lobby.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "1_yessir"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard", bodyState={naked=true}})
		saynn("[say=pc]Yes, Sir.[/say]")

		saynn("You obediently take off your clothes and place them in a neat pile on one of the drawers. After that.. you stand near the table, awaiting your fate.")

		saynn("[say=alexrynard]Good {pc.boy}.[/say]")

		saynn("Hearing that makes your body feel warm inside..")

		saynn("The computer finally boots.")

		saynn("[say=alexrynard]Now.. just stand still.[/say]")

		addButton("RUN!", "You're never gonna listen to what he says", "2_brat")
		addButton("Stay still", "Do as he says", "2_stay")
		addButton("RED", "Say this", "2_red")
	if(state == "2_brat"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {bodyState={naked=true}})
		saynn("Of course you're not gonna listen to him! The first thing you do when he tells you to stay still is RUN!")

		saynn("But as you try to escape, you feel something grabbing you by the collar and yanking back! Ow! You gasp as the mechanical grip chokes your throat, pulling you back to the machine.")

		saynn("[say=pc]H-h-hh!..[/say]")

		saynn("[say=alexrynard]Nope, not so fast.[/say]")

		saynn("He smiles as you get pulled past him.")

		saynn("[say=pc]Bitch..[/say]")

		saynn("[say=alexrynard]Don't tell me you expected something else.[/say]")

		saynn("[say=pc]Maybe I expected more![/say]")

		saynn("[say=alexrynard]More choking? Wow, I didn't know you're so slutty.[/say]")

		saynn("As you try to flail and reach him, more manipulators suddenly catch your limbs and use them to lift your {pc.masc} body off the floor. They carefully bring you onto the table and spread your legs, putting your {pc.privates} out on display.. Kinky..")

		saynn("[say=pc]H-hey![/say]")

		saynn("[say=alexrynard]My old inverse kinematics code still works, nice. Not too tight, is it?[/say]")

		saynn("You try to pull against the manipulators.. but they don't give. All you're doing is making the motors whirl louder to counteract your efforts. Makes you feel.. so much less in control.. kinda nice.")

		saynn("[say=pc]I can't move a limb..[/say]")

		saynn("[say=alexrynard]Good. Now.. how mean should I be with you..[/say]")

		saynn("You look down.. and see a machine with a variety of 'tools' sticking out.")

		addButton("His choice", "It's for him to decide", "3_hischoice")
		addButton("Extra mean!", "Do your worst!", "3_brat")
		addButton("RED", "Say this", "3_red")
	if(state == "3_red"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("[say=pc]RED.[/say]")

		saynn("Alex hears that and presses the button that carefully puts your feet on the ground and releases you.")

		saynn("[say=alexrynard]That was a little too much?[/say]")

		saynn("You nod softly.")

		saynn("[say=alexrynard]Sorry. None of this would have harmed you if you're curious. Wanna cuddle maybe?[/say]")

		addButton("Sure", "Cuddle with Alex for some time", "3_red_cuddle")
		addButton("Nah", "Just leave", "3_red_just_leave")
	if(state == "3_red_just_leave"):
		saynn("[say=pc]Nah, it's fine.[/say]")

		saynn("[say=alexrynard]Well, let me show you the way out then.[/say]")

		saynn("Alex guides you out into the white corridor and then shows you the way towards the medical lobby.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "3_red_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc"})
		saynn("[say=pc]Sure, that won't hurt.[/say]")

		saynn("Alex carefully embraces you and pulls in for some casual cuddles on the floor. It's made out of sterile materials anyway..")

		saynn("[say=alexrynard]For some reason..[/say]")

		saynn("He looks at the medical table while his hands idly rest on your waist.")

		saynn("[say=alexrynard]..we like to push ourselves. I think it's okay to do that, don't get me wrong. You gotta know where your limits lie.[/say]")

		saynn("He rests his chin on your shoulder.")

		saynn("[say=alexrynard]But for some reason we want to see others being pushed further, past their limits. I think that sacrificing our limits for something.. means sacrificing who you are.[/say]")

		saynn("[say=pc]You're saying that we are our limits?[/say]")

		saynn("[say=alexrynard]I don't know. Maybe. Maybe we are defined by our limits? Eh. Don't worry about it.[/say]")

		saynn("Looks like the foxy gets all philosophical sometimes.")

		saynn("You spend some time together like that before it becomes time to return to the medical lobby.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "2_stay"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {bodyState={naked=true}})
		saynn("You do as he says. Which is.. nothing.")

		saynn("Alex has pressed some button on the computer screen, causing the table to spring into action, its manipulators extending far.. before reaching for your wrists and ankles.")

		saynn("[say=pc]Eek![/say]")

		saynn("These manipulators are strong enough to lift your {pc.masc} body off the floor and carefully bring it onto the table. Your legs are spread, your {pc.privates} are all on display.. Kinky..")

		saynn("He smiles.")

		saynn("[say=alexrynard]My old inverse kinematics code still works, nice. Not too tight?[/say]")

		saynn("You try to pull against the manipulators.. but they don't give. All you're doing is making the motors whirl louder to counteract your efforts.")

		saynn("[say=pc]I can't move a limb, Sir..[/say]")

		saynn("[say=alexrynard]Good. Now.. how mean should I be with you..[/say]")

		saynn("You look down.. and see a machine with a variety of 'tools' sticking out.")

		addButton("His choice", "It's for him to decide", "3_hischoice")
		addButton("Extra mean!", "Do your worst!", "3_brat")
		addButton("RED", "Say this", "3_red")
	if(state == "3_brat"):
		playAnimation(StageScene.BDSMMachineFuck, "wand", {bodyState={naked=true, hard=true}})
		saynn("[say=pc]As mean as you can! I doubt it's that much, you soft fox.[/say]")

		saynn("He doesn't say anything back, he just puts on a cunning smirk.")

		if (GM.pc.hasReachableVagina()):
			saynn("He presses a button on the screen.. and the machine starts extending one of its tools.. a wand. Its soft sphere finds your dry {pc.pussyStretch} pussy lips.. before proceeding to vibrate against them!")

		else:
			saynn("He presses a button on the screen.. and the machine starts extending one of its tools.. a wand. Its soft sphere finds a certain area above the anus.. your taint.. before proceeding to vibrate against it! You wouldn't think so but that exact spot turns out to be quite sensitive..")

		saynn("[say=pc]Ah..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Even though it's not directly pressed against your cage, your balls do get stimulated from the vibrations.. which causes your cock to start growing.. Well, try to.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Even though it's not directly pressed against your cock, your balls do get stimulated from the vibrations.. which causes your member to start getting harder..")

		if (GM.pc.hasReachableVagina()):
			saynn("It feels nice.. but you can't even squirm much.. you're completely helpless against this machine. The vibrations are causing your pussy to quickly start getting wet and drippy, your clit being stimulated makes you moan and pant.")

			saynn("Quite soon, you already begin to feel your peak approaching.. Your wet drippy pussy is twitching fast.. But just before you can cum, the wand suddenly slows down to a crawl, denying you that orgasm.")

			saynn("[say=pc]Hey-y-y..[/say]")

			saynn("Your body cools down.. and the wand starts vibrating faster against your pussy again, bringing you lots of pleasure. Cute moans escape from you.. but just when you were about to cum, the wand denies you the pleasure again!")

			saynn("[say=pc]F-fuck.. Let me.. already..[/say]")

			saynn("Alex smiles wide, clearly enjoying this.. You can't let him do this..")

			saynn("When the wand starts to vibrate again, you do your best to try to cover up how aroused you are.. You close your mouth and keep all the moans inside, just humming instead. Yes, it seems to work, the orgasm is so close..")

			saynn("It's so.. it's right there, you can feel it.. you can feel the edge.. Please.. Your body is shivering and squirming hard against the manipulators, your pussy twitching more and more.. but no orgasm comes.. The machine keeps edging you, making you oh so desperate..")

			saynn("[say=alexrynard]Am I soft?[/say]")

			saynn("[say=pc]You.. Fox!.. Not..[/say]")

			saynn("[say=alexrynard]Not what?[/say]")

			saynn("[say=pc]Ple-e-e-ease.. You're not soft! You're not![/say]")

			saynn("Every nerve in your body wants to cum.. but you can't.. the mean foxy is keeping you nice and horny for quite some time.. while your mind is being assaulted by an ungodly amount of pleasure..")

		else:
			saynn("It feels nice.. but you can't even squirm much.. you're completely helpless against this machine. The vibrations are causing your cute asshole to start clenching around nothing, your taint being stimulated makes you moan and pant.")

			saynn("Quite soon, you already begin to feel your peak approaching.. Your needy asshole is twitching fast.. But just before you can cum, the wand suddenly slows down to a crawl, denying you that orgasm.")

			saynn("[say=pc]Hey-y-y..[/say]")

			saynn("Your body cools down.. and the wand starts vibrating faster against your taint again, bringing you lots of pleasure. Cute moans escape from you.. but just when you were about to cum, the wand denies you the pleasure again!")

			saynn("[say=pc]F-fuck.. Let me.. already..[/say]")

			saynn("Alex smiles wide, clearly enjoying this.. You can't let him do this..")

			saynn("When the wand starts to vibrate again, you do your best to try to cover up how aroused you are.. You close your mouth and keep all the moans inside, just humming instead. Yes, it seems to work, the orgasm is so close..")

			saynn("It's so.. it's right there, you can feel it.. you can feel the edge.. Please.. Your body is shivering and squirming hard against the manipulators, your tailhole twitching more and more.. but no orgasm comes.. The machine keeps edging you, making you oh so desperate..")

			saynn("[say=alexrynard]Am I soft?[/say]")

			saynn("[say=pc]You.. Fox!.. Not..[/say]")

			saynn("[say=alexrynard]Not what?[/say]")

			saynn("[say=pc]Ple-e-e-ease.. You're not soft! You're not![/say]")

			saynn("Every nerve in your body wants to cum.. but you can't.. the mean foxy is keeping you nice and horny for quite some time.. while your mind is being assaulted by an ungodly amount of pleasure..")

		saynn("[say=pc]Ah.. Ah-h..[/say]")

		saynn("[say=alexrynard]So needy. Let's do something else.[/say]")

		saynn("The wand between your legs starts to slow down, stealing the desired orgasm.. so rude..")

		addButton("Continue", "See what happens next", "4")
		if (getFlag("AlexRynardModule.3TrustCompleted")):
			addButton("Milk me!", "There is some milking equipment lying around..", "4_milkme")
		else:
			addDisabledButton("Milk me!", "Maybe some other time, this would be too much for you")
	if(state == "3_hischoice"):
		playAnimation(StageScene.BDSMMachineFuck, "wand", {bodyState={naked=true, hard=true}})
		saynn("[say=pc]It's your choice, Sir..[/say]")

		saynn("[say=alexrynard]Well, let's prepare you. We're going very far today.. potentially.[/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("He presses a button on the screen.. and the machine starts extending one of its tools.. a wand. Its soft sphere finds your dry {pc.pussyStretch} pussy lips.. before proceeding to vibrate against them!")

		else:
			saynn("He presses a button on the screen.. and the machine starts extending one of its tools.. a wand. Its soft sphere finds a certain area above the anus.. your taint.. before proceeding to vibrate against it! You wouldn't think so but that exact spot turns out to be quite sensitive..")

		saynn("[say=pc]Ah..[/say]")

		if (GM.pc.isWearingChastityCage()):
			saynn("Even though it's not directly pressed against your cage, your balls do get stimulated from the vibrations.. which causes your cock to start growing.. Well, try to.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Even though it's not directly pressed against your cock, your balls do get stimulated from the vibrations.. which causes your member to start getting harder..")

		if (GM.pc.hasReachableVagina()):
			saynn("It feels nice.. but you can't even squirm much.. you're completely helpless against this machine. The vibrations are causing your pussy to quickly start getting wet and drippy, your clit being stimulated makes you moan and pant.")

		else:
			saynn("It feels nice.. but you can't even squirm much.. you're completely helpless against this machine. The vibrations are causing your cute asshole to start clenching around nothing, your taint being stimulated makes you moan and pant.")

		saynn("[say=pc]Ah.. Ah-h..[/say]")

		saynn("[say=alexrynard]So needy. Should be ready for more I think.[/say]")

		addButton("Nod", "See what happens next", "4")
		if (getFlag("AlexRynardModule.3TrustCompleted")):
			addButton("Milk me!", "There is some milking equipment lying around..", "4_milkme")
		else:
			addDisabledButton("Milk me!", "Maybe some other time, this would be too much for you")
	if(state == "4_milkme"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {bodyState={naked=true, hard=true}})
		saynn("He presses a button and the machine retracts its wand, stealing all of the pleasure.. But you want more.. And you notice that this room has some unattended milking equipment lying around..")

		saynn("[say=pc]Milk me![/say]")

		saynn("Alex tilts his head slightly.. while you offer him a cute little smile.")

		saynn("[say=pc]Please?..[/say]")

		saynn("[say=alexrynard]I don't think we should be using this equipment, it's not..[/say]")

		saynn("[say=pc]Ple-ease?[/say]")

		saynn("[say=alexrynard]Fine-e. Just don't complain later.[/say]")

		saynn("Yay. Your body is shivering from excitement as Alex goes ahead and grabs some special equipment.")

		addButton("Continue", "See what happens next", "milk_putonstuff")
	if(state == "milk_putonstuff"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {bodyState={naked=true,chains=[["hose", "penisPump", "scene", "milkIntake"],["hose", "breastpump", "scene", "milkIntake"]]}})
		if (GM.pc.hasSmallBreasts()):
			saynn("Alex carefully secures a set of breast pumps around your {pc.breasts}. Your chest is not the most.. rich.. one.. but you're doing it for the sensations rather than milk..")

		else:
			saynn("Alex carefully secures a set of breast pumps around your {pc.breasts}. He makes sure the cups are properly attached and are creating a negative pressure inside.. You can't wait already..")

		if (hasPenisPump):
			saynn("After the breast pumps, Alex grabs a fitting penis one too. After that last.. stimulation.. your cock is still hard.. meaning Alex had no problem securing the pump around it.")

		elif (GM.pc.isWearingChastityCage()):
			saynn("Sadly there is no way to install the penis pump while you're wearing a chastity cage.. and Alex is obviously not gonna bother unlocking it just for this.")

		saynn("[say=alexrynard]There we go, should be it.[/say]")

		saynn("Alex also attaches a transparent bendy tube to each pump.. tube that leads to some liquid storage tanks.. kinky.")

		saynn("[say=pc]Moo?[/say]")

		saynn("Alex rolls his eyes.")

		saynn("[say=alexrynard]If you moo again, I will gag you.[/say]")

		saynn("That is what you're counting on..")

		addButton("Continue", "See what happens next", "milk_start")
	if(state == "milk_start"):
		playAnimation(StageScene.BDSMMachineFuck, "wand", {bodyState={naked=true,chains=[["hose", "penisPump", "scene", "milkIntake"],["hose", "breastpump", "scene", "milkIntake"]]}})
		if (hasPenisPump):
			saynn("And so, Alex flicks a switch that causes all three pumps to engage.. The two attached to your nips do short rhythmic pumps while the penis one slides its pleasure ring over your shaft, making it feel like you're fucking some very tight fuckhole..")

		else:
			saynn("And so, Alex flicks a switch that causes the pumps to engage. They start off nice and easy, doing short rhythmic pumps on your nips, trying to pull something out..")

		if (GM.pc.hasReachableVagina()):
			saynn("At the same time, Alex also presses a button that causes the machine to start stimulating your pussy again with its magic wand tool. No matter how much you squirm.. the algorithms perfectly track your body, making any kind of resistance pointless.. and that's great..")

		else:
			saynn("At the same time, Alex also presses a button that causes the machine to start stimulating your taint area again with its magic wand tool. No matter how much you squirm.. the algorithms perfectly track your body, making any kind of resistance pointless.. and that's great..")

		saynn("[say=pc]Ah.. So good..[/say]")

		if (inducedLact):
			saynn("Room is filled with your moans and the mechanical noises of the pumps working. You don't remember yourself lactating so obviously their efforts are kinda fruitless.. and yet.. and does feel amazing.")

			saynn("You roll your eyes high up and just moan passionately, the stimulation of your nips coupled with reading the words that appear on the screen before your eyes.. wow.. So good that you almost feel like you're leaking something.. wait..")

			saynn("[say=pc]Am I..[/say]")

			saynn("Alex checks the data.. and sure enough..")

			saynn("[say=alexrynard]Yep, the machine has collected a few ml.[/say]")

			saynn("The pumps have caused a natural reaction in your body.. Your breasts are actually producing {pc.milk} now.. This tech is something else.")

		else:
			saynn("Room is filled with your moans and the mechanical noises of the pumps working. At first their efforts are kinda fruitless.. but soon enough.. little squirts start appearing in random spots of your nips and areolas.. drops of your {pc.milk} begin to travel up the transparent tubes, getting collected by the machine.")

		if (hasPenisPump):
			saynn("The penis pump only adds to the sensations.. You didn't cum yet so all it can collect is your precum.. but you feel yourself extremely close, the pleasure ring sliding over your cock back and forth is edging you hard..")

		saynn("Watching the screen in front of you.. You really want to moo for some reason..")

		addButton("Moo", "You have to", "milk_afterfirst")
	if(state == "milk_afterfirst"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {bodyState={naked=true,chains=[["hose", "penisPump", "scene", "milkIntake"],["hose", "breastpump", "scene", "milkIntake"]]}})
		saynn("[say=pc]Moo-o~..[/say]")

		saynn("Instantly, Alex stops the pumps and the machine.")

		saynn("[say=pc]Aw.. That's it?[/say]")

		saynn("[say=alexrynard]If you want to be a moo, let's make you a proper moo.[/say]")

		saynn("Alex produces a ball gag and a blindfold.. and already begins to secure them on you..")

		saynn("Oh no..")

		addButton("Continue", "See what happens next", "milk_gagged")
	if(state == "milk_gagged"):
		playAnimation(StageScene.BDSMMachineFuck, "fuck", {bodyState={naked=true,chains=[["hose", "penisPump", "scene", "milkIntake"],["hose", "breastpump", "scene", "milkIntake"]]}})
		saynn("After gagging and blindfolding you.. Alex turns everything on again.. but you can hear the machine switching tools..")

		if (GM.pc.hasReachableVagina()):
			saynn("Instead of using a wand, a rubber pre-lubed dildo finds your pussy.. before spreading the petal with ease and sliding inside! All the while your pumps start tugging on your nips"+str(" and stimulating your cock" if hasPenisPump else "")+" harder. Oh fuck..")

		else:
			saynn("Instead of using a wand, a rubber pre-lubed dildo finds your tailhole.. before spreading the {pc.analStretch} star with ease and sliding inside! All the while your pumps start tugging on your nips"+str(" and stimulating your cock" if hasPenisPump else "")+" harder. Oh fuck..")

		saynn("More and more milk starts flowing through the transparent bendy tubes.. more and more moans start to escape your mouth.. all of them muffled. You're being milked while you're fucked.. why does this feel so good.")

		saynn("[say=alexrynard]You know what gesture to show me if you want me to stop.[/say]")

		saynn("Huh? You missed what he said completely.. and who cares.. you're so close..")

		addButton("Continue", "See what happens next", "milk_firstcum")
	if(state == "milk_firstcum"):
		playAnimation(StageScene.BDSMMachineFuck, "fast", {pcCum=true, bodyState={naked=true,chains=[["hose", "penisPump", "scene", "milkIntake"],["hose", "breastpump", "scene", "milkIntake"]]}})
		saynn("It hits you hard, a powerful orgasm rocks through your entire body.. You squirm and arch your back as much as the mechanical grips allow while the pumps start doing the suctions with increased frequency.")

		if (hasPenisPump):
			saynn("Your {pc.penis} is throbbing and twitching, multiple spurts of your {pc.cum} finally erupting, one after another.. And the pump doesn't stop, its pleasure ring is stroking your cock to the point of overstimulating, your balls tensing up while they're being drained so much..")

		if (GM.pc.hasReachableVagina()):
			saynn("Your pussy squirts while continuously fucked by the rubber dildo, your g-spot being hammered hard! Shame that there is no pump attached to your urethra because right now it would be collecting all of the girlcum in the world..")

		else:
			saynn("Your tailhole clenches tightly around the rubber dildo that's fucking it, your "+str("prostate" if GM.pc.hasPenis() else "sensitive spot")+" being hammered hard!")

		saynn("Your {pc.breasts} release a strong flow of {pc.milk} during your peak, your hard nips tingling from all the stimulation.")

		saynn("[say=alexrynard]Not bad.. Let's see..[/say]")

		saynn("He looks at the display.")

		if (hasPenisPump):
			saynn("[say=alexrynard]"+str(Util.roundF(totalSeed, 0))+" ml of seed and "+str(Util.roundF(totalMilk, 0))+" ml of milk so far.[/say]")

		else:
			saynn("[say=alexrynard]"+str(Util.roundF(totalMilk, 0))+" ml of milk so far.[/say]")

		saynn("Wait.. did he say 'so far'? This isn't it, is it.. Your brain is too deep in this milking thing to stop now anyway though..")

		addButton("Continue", "See what happens next", "milk_secondwave")
	if(state == "milk_secondwave"):
		playAnimation(StageScene.BDSMMachineFuck, "sexdouble", {bodyState={naked=true,chains=[["hose", "penisPump", "scene", "milkIntake"],["hose", "breastpump", "scene", "milkIntake"]]}})
		if (GM.pc.hasReachableVagina()):
			saynn("Alex presses a button, causing the machine to extend a second dildo! This one aligns itself with your other hole and.. after prodding it for a bit.. thrusts inside, in sync with the other one!")

			saynn("[say=pc]MH-h-h!..[/say]")

			saynn("Muffled noises escape from you while both of your holes are now getting fucked by the machine.. while the pumps keep collecting milk"+str(" and seed" if hasPenisPump else "")+" from you..")

		else:
			saynn("Alex presses a button, causing the machine to extend a second dildo! This one aligns itself with your same hole that is already stretched by another dildo.. after prodding it for a bit.. suddenly thrusts inside, in sync with the other one!")

			saynn("[say=pc]MH-h-h!..[/say]")

			saynn("Muffled noises escape from you while your poor tailhole is now stretched wide by the machine that is double-penetrating you.. while the pumps keep collecting milk"+str(" and seed" if hasPenisPump else "")+" from you..")

		saynn("Your old orgasm has faded by now.. but the next one is already approaching, your body is shivering from the fucking and constant milking, your mind slipping into the bottomless abyss of pleasure..")

		addButton("Milking..", "A lot milking..", "milk_afterhours")
	if(state == "milk_afterhours"):
		playAnimation(StageScene.BDSMMachineFuck, "fastdouble", {pcCum=true, bodyState={naked=true,chains=[["hose", "penisPump", "scene", "milkIntake"],["hose", "breastpump", "scene", "milkIntake"]]}})
		saynn("What follows are hours of non-stop orgasms.. one after one.. each one causing your breasts to release some more milk.. all of it collected by the machine.")

		if (hasPenisPump):
			saynn("Each time your balls produce some seed, the cock pump is fast to drain them dry again. There is no point in time where your cock isn't dripping something..")

		saynn("By the end of it.. you're spent.. truly.. and yet, you feel.. free.")

		saynn("[say=alexrynard]Alright.. I think this is enough for you. Been standing here for hours.[/say]")

		saynn("Poor guy.")

		saynn("[say=alexrynard]Watching the numbers go up was kinda fun.[/say]")

		saynn("He turns off the pumps.. and begins to take them off of you.")

		if (hasPenisPump):
			saynn("[say=alexrynard]Speaking of.. "+str(Util.roundF(totalSeed, 0))+" ml of seed and "+str(Util.roundF(totalMilk, 0))+" ml of milk. That's how much you made.[/say]")

		else:
			saynn("[say=alexrynard]Speaking of.. "+str(Util.roundF(totalMilk, 0))+" ml of milk. That's how much you made[/say]")

		saynn("What are numbers anyway.. All you want is moo..")

		addButton("Continue", "See what happens next", "milk_takeoffeverything")
	if(state == "milk_takeoffeverything"):
		playAnimation(StageScene.BDSMMachineFuck, "tease", {bodyState={naked=true}})
		saynn("You produce a muffled moan as Alex carefully removes the breast pumps one after another with satisfying 'plop' noise."+str(" He also then removes the pump connected to your dick, just as carefully." if hasPenisPump else "")+"")

		if (GM.pc.hasReachableVagina()):
			saynn("The dildos leave your holes gaping after retracting out of them.. your pussy juices dripping freely onto the floor.")

		else:
			saynn("The dildos leave your hole gaping after retracting out of it.. your tailhole visible pulsing every few seconds.")

		saynn("[say=pc]Ah.. hah..[/say]")

		saynn("[say=alexrynard]Not so keen to moo now, huh?[/say]")

		saynn("You so want to do it.. Fuck it!")

		saynn("[say=pc]M-mo..[/say]")

		saynn("But Alex suddenly plugs your mouth with his digits.. that you of course begin drooling on.")

		saynn("[say=alexrynard]What a brat.. Let's get you off.[/say]")

		saynn("Cuddles!")

		addButton("Cuddle", "Rest with Alex", "milk_cuddle")
	if(state == "milk_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", npcBodyState={naked=true}})
		saynn("Alex presses the button that carefully places you on the floor. Your legs are shaky but Alex is quick to catch you, before carefully embracing you.")

		saynn("[say=alexrynard]There we go. Hope you had fun.[/say]")

		saynn("You nod and rest in his hands.")

		saynn("[say=alexrynard]Good job. You're a good.. moo.. whatever that means.[/say]")

		saynn("So cute to hear him say that. Your mind is slowly returning back to its normal state..")

		saynn("[say=alexrynard]I'm not a huge fan of lactation and stuff. Looks like you enjoyed it though. Good.[/say]")

		saynn("You stay together like that, cuddling and chatting.")

		saynn("After that, Alex helps you to get back to the medical lobby..")

		addButton("Continue", "See what happens next", "gobacktolobby")
	if(state == "4"):
		playAnimation(StageScene.BDSMMachineAltFuck, "tease", {bodyState={naked=true, hard=true}})
		saynn("[say=alexrynard]There are so many options for milking.. Let's pick something simpler.[/say]")

		saynn("He presses a button and the machine retracts its wand, stealing all of the pleasure.. Then, the manipulators carefully lift you again before placing you onto the table belly-down, your ass sticking out nice and high, your arms and legs are still held tightly with mechanical grips.")

		saynn("[say=pc]Ow..[/say]")

		saynn("[say=alexrynard]Hah. This one is for 'internal damage' healing.[/say]")

		saynn("He presses a button and the machine behind you starts to slowly extend one of the dildo-like tools..")

		saynn("[say=alexrynard]But before we do that. I think we should keep the noise level down, people are working here.[/say]")

		saynn("So considerate of him.. Alex walks up to you, his hands produce a.. simple ball gag.")

		saynn("[say=alexrynard]Say 'Aa-ah'.[/say]")

		addButton("Aa-ah", "Say it", "4_aah")
		addButton("Stay silent!", "Not say anything", "4_brat")
		addButton("RED", "Say this", "3_red")
	if(state == "4_brat"):
		playAnimation(StageScene.BDSMMachineAltFuck, "tease", {bodyState={naked=true, hard=true}})
		saynn("Nope, you're not saying anything! You hold your lips closed shut and Alex notices that.")

		saynn("[say=alexrynard]C'mon, it's just some rubber.[/say]")

		saynn("He approaches you, his hand lands on your cheek and gently caresses it.")

		saynn("[say=alexrynard]No?[/say]")

		saynn("You shake your head.")

		saynn("[say=alexrynard]Your slutty moans are gonna alert all the nurses. Do you want that?[/say]")

		saynn("Now you're definitely not obeying his words.. Alex smirks and starts caressing the curves of your back instead, gently kneading your shoulders and shoulder-plates. His digits slowly slowly lower.. until suddenly smacking your ass hard!")

		saynn("[say=pc]AGH![/say]")

		saynn("As soon as this cry escapes your lips, a shiny red ball slides past your lips, sealing them. Alex quickly secures the rest of the head harness around your head.")

		saynn("[say=alexrynard]Got you~.[/say]")

		saynn("You.. glare.. at him.. while drooling actively.")

		saynn("[say=alexrynard]Obviously, you can't talk anymore  so we will have to come up with a new safeword.[/say]")

		saynn("He also produces a leather blindfold and secures it around your eyes, stealing your sense of sight.")

		saynn("[say=alexrynard]I want you to focus. This will help.[/say]")

		saynn("There is not much to focus on at the moment.. but you feel like this will change very soon.")

		saynn("[say=alexrynard]For your new safeword.. huh.. you can't move your arms either.[/say]")

		saynn("His palm lands on your back again, casually sliding over your curves.. going from your shoulders down and over your {pc.thick} butt.. threatening to spank you again but never actually doing it.")

		saynn("[say=alexrynard]Right, you can still use your fingers at least. Let's say.. If I see a Peace sign, I stop everything. Ready?[/say]")

		saynn("Peace sign.. why peace sign..")

		addButton("Thumbs up", "Show Alex the thumbs up", "5_thumbsup")
		addButton("Middle finger", "Show Alex the middle finger", "5_brat")
		addButton("Peace sign", "Show Alex the peace sign", "5_red")
	if(state == "5_red"):
		saynn("You show Alex a peace sign with your hand.")

		saynn("[say=alexrynard]Um.. do you actually want to stop?[/say]")

		addButton("Peace sign", "Continue showing it", "5_red_red")
		addButton("Middle finger", "Show Alex the middle finger", "5_brat")
	if(state == "5_red_red"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("You continue showing him the peace sign and so Alex finally presses a button that makes the machine carefully put you on your feet and release you.")

		saynn("Alex swiftly removes the ballgag and the blindfold from you.")

		saynn("[say=alexrynard]That was a little too much?[/say]")

		saynn("You nod softly.")

		saynn("[say=alexrynard]Sorry. None of this would have harmed you if you're curious. Wanna cuddle maybe?[/say]")

		addButton("Sure", "Cuddle with Alex for some time", "3_red_cuddle")
		addButton("Nah", "Just leave", "3_red_just_leave")
	if(state == "4_aah"):
		playAnimation(StageScene.BDSMMachineAltFuck, "tease", {bodyState={naked=true, hard=true}})
		saynn("[say=pc]Aa-a..[/say]")

		saynn("A shiny red ball slides past your lips, sealing them. Then Alex secures the rest of the head harness around your head.")

		saynn("[say=alexrynard]Obviously, you can't talk anymore  so we will have to come up with a new safeword.[/say]")

		saynn("He also produces a leather blindfold and secures it around your eyes, stealing your sense of sight.")

		saynn("[say=alexrynard]I want you to focus. This will help.[/say]")

		saynn("There is not much to focus on at the moment.. but you feel like this will change very soon.")

		saynn("[say=alexrynard]For your new safeword.. huh.. you can't move your arms either.[/say]")

		saynn("His palm lands on your back, casually sliding over your curves.. going from your shoulders down and over your {pc.thick} butt.")

		saynn("[say=alexrynard]Right, you can still use your fingers at least. Let's say.. If I see a Peace sign, I stop everything. Ready?[/say]")

		saynn("Peace sign.. why peace sign..")

		addButton("Thumbs up", "Show Alex the thumbs up", "5_thumbsup")
		addButton("Middle finger", "Show Alex the middle finger", "5_brat")
		addButton("Peace sign", "Show Alex the peace sign", "5_red")
	if(state == "5_brat"):
		playAnimation(StageScene.BDSMMachineAltFuck, "inside", {bodyState={naked=true, hard=true}})
		saynn("You don't exactly know where Alex is right now.. so you show your middle finger to the whole room.")

		saynn("[say=alexrynard]Hah. Be careful what you wish for.[/say]")

		saynn("And then he is silent.. It's so scary.. not knowing what will happen next.")

		if (GM.pc.hasReachableVagina()):
			saynn("Suddenly you hear a beep.. and then a mechanical noise behind you. One of the.. tools.. finds your butt.. and starts prodding your holes!")

			saynn("[say=pc]Ah..[/say]")

			saynn("Eventually it settles on your pussy, the round pre-lubed tip carefully spreading your petals.. before sliding inside fast! So cold! But also.. so full.")

		else:
			saynn("Suddenly you hear a beep.. and then a mechanical noise behind you. One of the.. tools.. finds your butt.. and starts prodding it in various spots!")

			saynn("[say=pc]Ah..[/say]")

			saynn("Eventually it stumbles upon your {pc.analStretch} tailhole, the round pre-lubed tip carefully spreading your star.. before sliding inside fast! So cold! But also.. so full.")

		if (GM.pc.isWearingChastityCage()):
			saynn("The tool easily finds your "+str("g-spot" if GM.pc.hasReachableVagina() else "prostate")+" and puts pressure on it, causing your locked up cock to react instantly, getting hard in its cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("The tool easily finds your "+str("g-spot" if GM.pc.hasReachableVagina() else "prostate")+" and puts pressure on it, causing your {pc.penis} to react instantly, getting hard and leaking pre.")

		saynn("[say=alexrynard]I will be quiet. I will let you enjoy this. But I'm still looking at your hands.[/say]")

		saynn("So nice of him..")

		addButton("Continue", "See what happens next", "6")
		addButton("Peace sign", "Show a peace sign with your hand", "5_red")
	if(state == "5_thumbsup"):
		playAnimation(StageScene.BDSMMachineAltFuck, "inside", {bodyState={naked=true, hard=true}})
		saynn("You don't exactly know where Alex is anymore.. so you just show a thumbs up to darkness.")

		saynn("[say=alexrynard]Good, you're learning fast. Now.. let's see..[/say]")

		saynn("It's so.. scary.. not knowing what will happen next.")

		if (GM.pc.hasReachableVagina()):
			saynn("Suddenly you hear a beep.. and then a mechanical noise behind you. One of the.. tools.. finds your butt.. and starts prodding your holes!")

			saynn("[say=pc]Ah..[/say]")

			saynn("Eventually it settles on your pussy, the round pre-lubed tip carefully spreading your petals.. before sliding inside fast! So cold! But also.. so full.")

		else:
			saynn("Suddenly you hear a beep.. and then a mechanical noise behind you. One of the.. tools.. finds your butt.. and starts prodding it in various spots!")

			saynn("[say=pc]Ah..[/say]")

			saynn("Eventually it stumbles upon your {pc.analStretch} tailhole, the round pre-lubed tip carefully spreading your star.. before sliding inside fast! So cold! But also.. so full.")

		if (GM.pc.isWearingChastityCage()):
			saynn("The tool easily finds your "+str("g-spot" if GM.pc.hasReachableVagina() else "prostate")+" and puts pressure on it, causing your locked up cock to react instantly, getting hard in its cage.")

		elif (GM.pc.hasReachablePenis()):
			saynn("The tool easily finds your "+str("g-spot" if GM.pc.hasReachableVagina() else "prostate")+" and puts pressure on it, causing your {pc.penis} to react instantly, getting hard and leaking pre.")

		saynn("[say=alexrynard]I will be quiet. I will let you enjoy this. But I'm still looking at your hands.[/say]")

		saynn("So nice of him..")

		addButton("Continue", "See what happens next", "6")
		addButton("Peace sign", "Show a peace sign with your hand", "5_red")
	if(state == "6"):
		playAnimation(StageScene.BDSMMachineAltFuck, "sex", {bodyState={naked=true, hard=true}})
		if (GM.pc.hasReachableVagina()):
			saynn("Soon after, the tool starts retracting itself out of your pussy.. just to ram itself inside again.. and then again. The round dildo is exploring you from the inside, sliding against your wet inner walls.. while you are completely helpless.")

		else:
			saynn("Soon after, the tool starts retracting itself out of your ass.. just to ram itself inside again.. and then again. The round dildo is exploring you from the inside, sliding against your wet inner walls.. while you are completely helpless.")

		saynn("[say=pc]Ah-h.. ah..[/say]")

		saynn("Muffled moans begin to escape from you while your body starts fidgeting around on that table, each thrust pushing you forward slightly.. but the manipulators are quick to bring you back. There is no escaping them..")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your chastity cage is rubbing against the table with barely any friction being transferred to your trapped cock.. And yet.. you're dripping pre like crazy.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your cock is trapped between the table and your body, the friction coupled with your pleasure spot being fucked makes it twitch and leak pre like crazy.")

		addButton("Continue", "See what happens next", "7")
		addButton("Peace sign", "Show a peace sign with your hand", "5_red")
	if(state == "7"):
		playAnimation(StageScene.BDSMMachineAltFuck, "fast", {bodyState={naked=true, hard=true}})
		if (GM.pc.hasReachableVagina()):
			saynn("It speeds up! The machine is fucking your little pussy faster and faster! By now it easily reaches your organic barricade, hammering away at your cervix, creating a visible bump on your belly in the process.")

			saynn("You sure are putting a lot of trust into Alex.. He could have just walked away by now, leaving you here to be tortured by that machine.. but you feel safe even now.. when your wet cunt is getting stuffed full of that silicon cock..")

			saynn("[say=pc]Nhh-h!.. Ah-h-h..[/say]")

			saynn("The room is filled with your muffled noises and the repetitive piston sound.. You can't see anything.. You can't say anything.. Can't move anything.. Just forced to endure the relentless onslaught on your slit, your orgasm already drawing close..")

		else:
			saynn("It speeds up! The machine is fucking your little asshole faster and faster! By now it easily reaches deep inside you, hammering away at your sensitive spots, creating a visible bump on your belly in the process.")

			saynn("You sure are putting a lot of trust into Alex.. He could have just walked away by now, leaving you here to be tortured by that machine.. but you feel safe even now.. when your needy asshole is getting stuffed full of that silicon cock..")

			saynn("[say=pc]Nhh-h!.. Ah-h-h..[/say]")

			saynn("The room is filled with your muffled noises and the repetitive piston sound.. You can't see anything.. You can't say anything.. Can't move anything.. Just forced to endure the relentless onslaught on your ass, your orgasm already drawing close..")

		addButton("Continue", "See what happens next", "8")
		addButton("Peace sign", "Show a peace sign with your hand", "8_red")
	if(state == "8_red"):
		playAnimation(StageScene.BDSMMachineAltFuck, "tease", {bodyState={naked=true, hard=true}})
		saynn("This clearly went too far, who knows what the machine will do next to you.. so you show a peace sign to the darkness.")

		saynn("Alex notices your gesture.. and swiftly stops the machine. You were pretty close.. but now the orgasm begins to slowly fade.")

		saynn("[say=alexrynard]Right.. I guess it was too much. Let's get you out of there.[/say]")

		addButton("Continue", "See what happens next", "8_red_free")
	if(state == "8_red_free"):
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		saynn("He presses a button that slowly puts your feet onto the floor. Your legs are still a little shaky so Alex supports you. He, of course, removes your gag and blindfold.")

		saynn("[say=alexrynard]Good job, you did really well.[/say]")

		saynn("You put on your clothes..")

		saynn("[say=alexrynard]Want to relax together?[/say]")

		addButton("Sure", "Cuddle with Alex for some time", "3_red_cuddle")
		addButton("Nah", "Just leave", "3_red_just_leave")
	if(state == "8"):
		playAnimation(StageScene.BDSMMachineAltFuck, "inside", {pcCum=true, cum=true, bodyState={naked=true, hard=true}})
		saynn("With the lack of your important sense.. you are forced to focus on that silicon dildo.. it's mechanical motions brings you over the edge with ease.")

		saynn("[say=pc]Nh-h-hh-h!..[/say]")

		if (GM.pc.hasReachableVagina()):
			saynn("Your cunt starts gripping the intruding fake cock extremely tight, all your inner walls clenching around it, putting quite some strain onto the whirling motors.")

			saynn("The machine detects your orgasm.. before shoving its tool deep inside you, its round tip breaking into your womb through the cervix that has gotten softer during your moment of bliss.")

			saynn("[say=pc]Ah-h-h!..[/say]")

			saynn("It's too much, your twitching pussy is gushing fluids onto the table.. while the machine starts stuffing your babymaker full of something warm and slimy.. Something that starts healing any bruises inside you.")

		else:
			saynn("Your ass starts gripping the intruding fake cock extremely tight, all your inner walls clenching around it, putting quite some strain onto the whirling motors.")

			saynn("The machine detects your orgasm.. before shoving its tool deep inside you, its round tip deep inside your nethers.")

			saynn("[say=pc]Ah-h-h!..[/say]")

			saynn("It's too much, your twitching asshole clenching around the intruding object.. while the machine starts stuffing it full of something warm and slimy.. Something that starts healing any bruises inside you.")

		if (GM.pc.isWearingChastityCage()):
			saynn("Your poor locked cock is throbbing desperately against the cage, strings of your {pc.cum} getting pushed past the cage, creating a cute little mess under you.")

		elif (GM.pc.hasReachablePenis()):
			saynn("Your {pc.penis} is throbbing while trapped between your body and the bed, strings of your {pc.cum} creating a cute little mess under you.")

		saynn("The dildo is still inside you while you're slowly coming back from the powerful orgasm..")

		saynn("You're panting heavily, your stuffed hole leaking whatever it is that was pumped into you. Feels amazing..")

		saynn("[say=alexrynard]Huh.[/say]")

		saynn("That scared you.")

		saynn("[say=alexrynard]It looked fun. Quite handy for brat taming too, I didn't have to do anything myself.[/say]")

		saynn("He places his hands on your cheeks and gently caresses them, creating a cozy atmosphere.. as cozy as it can get while you still have that dildo-shaped tool inside you..")

		saynn("[say=alexrynard]If you're done, you know what gesture to show me.[/say]")

		addButton("Peace sign", "Show him the peace sign", "8_end")
		addButton("Middle finger", "Show him the middle finger", "8_brat")
	if(state == "8_end"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", npcBodyState={naked=true}})
		saynn("Yeah, it's probably enough for now. You straighten two of your fingers, creating a peace sign. Alex sees it and presses a button that raises you above the table again before using some other tool to clean any mess off of it. Very useful.")

		saynn("After that, Alex lies on the table himself and waits for the manipulators to put you into his embrace.")

		saynn("[say=alexrynard]There we go. Hope you had fun.[/say]")

		saynn("You nod and rest in his hands.. while still blindfolded and gagged.")

		saynn("[say=alexrynard]This one was a bit on the rough side.. but you handled it really well. Good job. You're such a good {pc.boy}.[/say]")

		saynn("Aw, why is he saying such kind words to you.")

		saynn("[say=alexrynard]Let's just rest.[/say]")

		saynn("You stay together like that, cuddling and chatting.")

		saynn("After that, Alex helps you to get back to the medical lobby..")

		addButton("Continue", "See what happens next", "gobacktolobby")
	if(state == "8_brat"):
		playAnimation(StageScene.BDSMMachineAltFuck, "tease", {bodyState={naked=true, hard=true}})
		saynn("You decide to show a middle finger to the darkness instead.. That will end right?")

		saynn("[say=alexrynard]Right. Still got some fight in you?[/say]")

		saynn("Alex presses something that causes the machine to retract the dildo-shaped tool from your "+str("pussy" if GM.pc.hasReachableVagina() else "ass")+".. Did you win? That was easy.")

		saynn("Wait, why did the mechanical noise behind you doubled..")

		addButton("Continue", "See what happens next", "9")
	if(state == "9"):
		playAnimation(StageScene.BDSMMachineAltFuck, "sexdouble", {pcCum=true, bodyState={naked=true, hard=true}})
		if (GM.pc.hasReachableVagina()):
			saynn("You gasp when the same dildo finds your pussy again and brushes itself against your sensitive lips.. but at the same time.. a second one aligns itself with your {pc.analStretch} ass, prodding it!")

			saynn("You hear a beep and then produce a muffled cry of passion as both of them penetrate your holes at the same time! They don't stop there, the dildos get almost pulled out before a new thrust makes you moan again, your body squeezing the both intruding objects tightly..")

			saynn("[say=alexrynard]Wow, look at you.[/say]")

			saynn("[say=pc]MHHmh-H!..[/say]")

			saynn("You can't.. you can't do anything while your holes are being fucked at a robotic pace, their pre-lubed surface allows them to ram themselves deep inside, pushing on all your buttons.")

			if (GM.pc.isWearingChastityCage()):
				saynn("Both, your g-spot and your prostate are being stimulated, causing your poor caged up cock to leak a steady stream of your {pc.cum}, your body being milked of all of its fluids.")

			elif (GM.pc.hasReachablePenis()):
				saynn("Both, your g-spot and your prostate are being stimulated, causing your {pc.penis} to start leaking a steady stream of your {pc.cum}, your body being milked of all of its fluids.")

			saynn("Soon, the next orgasm overwhelms you, your body thrashing against the unmovable manipulators, your muffled moans mixing with the load whirling of many motors working to keep your body still and double-penetrated at all times.")

		else:
			saynn("You gasp when the same dildo finds your ass again and brushes itself against your stuffed star.. but at the same time.. a second one aligns itself with the same hole.. oh no..")

			saynn("You hear a beep and then produce a muffled cry of passion as both of them penetrate your {pc.analStretch} asshole at the same time! They don't stop there, the dildos get almost pulled out before a new thrust makes you moan again, your body squeezing the both intruding objects tightly, your anal ring stretched beyond what looks natural..")

			saynn("[say=alexrynard]Wow, look at you.[/say]")

			saynn("[say=pc]MHHmh-H!..[/say]")

			saynn("You can't.. you can't do anything while your hole is being fucked at a robotic pace, their pre-lubed surface allows them to ram themselves deep inside, pushing on all your buttons.")

			if (GM.pc.isWearingChastityCage()):
				saynn("Your prostate is being stimulated hard, causing your poor caged up cock to leak a steady stream of your {pc.cum}, your body being milked of all of its fluids.")

			elif (GM.pc.hasReachablePenis()):
				saynn("Your prostate is being stimulated hard, causing your {pc.penis} to start leaking a steady stream of your {pc.cum}, your body being milked of all of its fluids.")

			saynn("Soon, the next orgasm overwhelms you, your body thrashing against the unmovable manipulators, your muffled moans mixing with the load whirling of many motors working to keep your body still and double-penetrated at all times.")

		saynn("All your muscles seize up.. meaning you can't even show a peace sign anymore.. oh no..")

		addButton("Continue", "See what happens next", "9_fast")
	if(state == "9_fast"):
		playAnimation(StageScene.BDSMMachineAltFuck, "fastdouble", {pcCum=true, cum=true, bodyState={naked=true, hard=true}})
		if (GM.pc.hasReachableVagina()):
			saynn("They didn't stop after your orgasm, no, the two dildos only began to fuck your holes faster, their relentless rhythm is quickly overstimulating your pussy to start gushing fluids all over the table again, your anus clenching around the second one at the same time.")

			saynn("[say=pc]MHH-hh-hH!.. Mh-h..[/say]")

			saynn("[say=alexrynard]I hear a happy brat.[/say]")

			saynn("He is not wrong.. and yet.. your mind is flooded with immense amounts of pleasure, your gagged mouth is drooling, your lusty eyes are shaky under the blindfold.")

			if (GM.pc.hasPenis()):
				saynn("The dildos just keep fucking your holes.. forcing one orgasm after another.. Your {pc.penis} doesn't even shoot its seed anymore, just occasional little dribbles.. while the balls are tensing up non-stop.")

			else:
				saynn("The dildos just keep fucking your holes.. forcing one orgasm after another.. giving you exactly zero time to recover.")

			saynn("At some point your mind starts to slip.. Each new wave of ecstasy combining in with the previous one, corrupting all your thoughts.. A passionate muffled moan escapes from you when the dildos start pumping your cunt and your ass full of that healing gel, quickly causing your belly to start looking bumpy.")

		else:
			saynn("They didn't stop after your orgasm, no, the two dildos only began to fuck your tailhole, their relentless rhythm is quickly overstimulating you to the point of your tailhole twitching and clenching with each pulse.")

			saynn("[say=pc]MHH-hh-hH!.. Mh-h..[/say]")

			saynn("[say=alexrynard]I hear a happy brat.[/say]")

			saynn("He is not wrong.. and yet.. your mind is flooded with immense amounts of pleasure, your gagged mouth is drooling, your lusty eyes are shaky under the blindfold.")

			if (GM.pc.hasPenis()):
				saynn("The dildos just keep fucking your fuckhole.. forcing one orgasm after another.. Your {pc.penis} doesn't even shoot its seed anymore, just occasional little dribbles.. while the balls are tensing up non-stop.")

			else:
				saynn("The dildos just keep fucking your fuckhole.. forcing one orgasm after another.. giving you exactly zero time to recover.")

			saynn("At some point your mind starts to slip.. Each new wave of ecstasy combining in with the previous one, corrupting all your thoughts.. A passionate muffled moan escapes from you when the dildos start pumping your ass full of that healing gel, quickly causing your belly to start looking all bumpy.")

		saynn("Your eyes roll up, your tongue drooly, the digits on your both hands forming peace signs on their own..")

		addButton("Continue", "See what happens next", "9_after_brat")
	if(state == "9_after_brat"):
		playAnimation(StageScene.BDSMMachineAltFuck, "tease", {bodyState={naked=true, hard=true}})
		saynn("Alex sees the peace sign and finally turns off the machine, both dildos stop while deep inside you, still putting pressure onto your spots.")

		saynn("[say=alexrynard]I'm surprised you endured it for so long.[/say]")

		saynn("You're panting like crazy, muffled noises still keep escaping from you. He peeks under the blindfold.. and sees your mindless stare.")

		saynn("[say=alexrynard]Wow, you got fucked silly.[/say]")

		saynn("[say=pc]Nh-h-h..[/say]")

		saynn("[say=alexrynard]Let's get you freed.[/say]")

		addButton("Continue", "See what happens next", "9_after_brat_cuddle")
	if(state == "9_after_brat_cuddle"):
		playAnimation(StageScene.Cuddling, "idle", {pc="alexrynard", npc="pc", npcBodyState={naked=true}})
		saynn("Alex takes off your gag and the blindfold, causing the bright sterile light to make you squint. Then he turns off the machine causing the manipulators to let go of your limbs.")

		saynn("[say=alexrynard]Let's rest.[/say]")

		saynn("He pulls you in for some cuddles on that medical table. Your breathing is still all over the place, your thoughts all scrambled.")

		saynn("[say=alexrynard]You're such a good {pc.boy}, providing so much warmth for me.[/say]")

		saynn("Aw, you don't mind being a blanket.. Being blanket is good..")

		saynn("Time passes while you cuddle like that. At some point your head starts to clear up.")

		saynn("[say=pc]Ah.. So much..[/say]")

		saynn("[say=alexrynard]Hey, at least you don't have any internal damage for sure now, heh.[/say]")

		saynn("That's fair.")

		saynn("[say=pc]Nice.. piece of tech.. you made there..[/say]")

		saynn("[say=alexrynard]It's.. fine. There are some obvious flaws with it but I just can't be bothered. Also, never ask me how I tested this machine.[/say]")

		saynn("[say=pc]Pff-f.. With your butt of course![/say]")

		saynn("He sighs and bites your shoulder playfully.")

		saynn("[say=pc]Ow..[/say]")

		saynn("[say=alexrynard]Brat.[/say]")

		saynn("After this cozy aftercare session, Alex helps you get dressed and get to the medical lobby.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "brought_medical"):
		processTime(3*60)

	if(_action == "eliza_brings_to_milking_room"):
		processTime(5*60)

	if(_action == "1_brat"):
		bratCounter += 1

	if(_action == "1_red_red"):
		processTime(5*60)
		GM.pc.addPain(30)
		addMessage("OW OW OW")

	if(_action == "2_brat"):
		bratCounter =+ 1

	if(_action == "3_red_cuddle"):
		processTime(10*60)

	if(_action == "3_brat"):
		bratCounter += 1

	if(_action == "milk_putonstuff"):
		isLact = GM.pc.canBeMilked()
		var breastPump = GlobalRegistry.createItem("BreastPump")
		breastPumpID = breastPump.uniqueID
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(breastPump)
		if(GM.pc.hasReachablePenis()):
			hasPenisPump = true
			var penisPump = GlobalRegistry.createItem("PenisPump")
			penisPumpID = penisPump.uniqueID
			GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(penisPump)

	if(_action == "milk_start"):
		if(!isLact):
			inducedLact = true
			GM.pc.induceLactation()
		else:
			GM.pc.stimulateLactation()
		processTime(20*60)

	if(_action == "milk_afterfirst"):
		processTime(3*60)

	if(_action == "milk_gagged"):
		processTime(10*60)
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ballgag"))

	if(_action == "milk_firstcum"):
		processTime(10*60)
		var howMuchMilked = GM.pc.milk()
		totalMilk += howMuchMilked
		if(hasPenisPump):
			totalSeed += GM.pc.milkSeed()
		GM.pc.orgasmFrom("alexrynard")

	if(_action == "milk_secondwave"):
		processTime(60*60)
		if(GM.pc.hasReachableVagina()):
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina, 30)
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 30)
		else:
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 30)
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 30)

	if(_action == "milk_afterhours"):
		processTime(60*60*3)
		var howMuchMilked = GM.pc.milk()
		totalMilk += howMuchMilked
		if(hasPenisPump):
			totalSeed += GM.pc.milkSeed()
		GM.pc.orgasmFrom("alexrynard")

	if(_action == "milk_takeoffeverything"):
		processTime(3*60)
		GM.pc.freeEyesDeleteAll()
		GM.pc.freeMouthDeleteAll()
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.UnderwearTop)
		if(hasPenisPump):
			GM.pc.getInventory().removeItemFromSlot(InventorySlot.Penis)

	if(_action == "4_aah"):
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ballgag"))

	if(_action == "4_brat"):
		bratCounter += 1
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("blindfold"))
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("ballgag"))

	if(_action == "5_red_red"):
		GM.pc.freeEyesDeleteAll()
		GM.pc.freeMouthDeleteAll()

	if(_action == "5_brat"):
		bratCounter += 1

	if(_action == "8"):
		setFlag("AlexRynardModule.3TrustCompleted", true)
		GM.pc.orgasmFrom("alexrynard")
		if(GM.pc.hasReachableVagina()):
			GM.pc.afterHealingGelTreatment()
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina, 30)
			var thebodypart = GM.pc.getBodypart(BodypartSlot.Vagina)
			if(thebodypart != null):
				thebodypart.addFluidOrifice("HealingGel", RNG.randf_range(250.0, 350.0), null)
		else:
			GM.pc.afterHealingGelTreatment()
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 30)
			var thebodypart = GM.pc.getBodypart(BodypartSlot.Anus)
			if(thebodypart != null):
				thebodypart.addFluidOrifice("HealingGel", RNG.randf_range(250.0, 350.0), null)
		GM.pc.addPain(-200)
		GM.pc.addStamina(100)

	if(_action == "8_red_free"):
		GM.pc.freeEyesDeleteAll()
		GM.pc.freeMouthDeleteAll()

	if(_action == "8_end"):
		processTime(30*60)

	if(_action == "8_brat"):
		bratCounter += 1

	if(_action == "gobacktolobby"):
		GM.pc.freeEyesDeleteAll()
		GM.pc.freeMouthDeleteAll()
		GM.pc.setLocation("med_lobbynw")
		endScene()
		return

	if(_action == "9"):
		GM.pc.orgasmFrom("alexrynard")
		if(GM.pc.hasReachableVagina()):
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Vagina, 30)
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 30)
		else:
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 30)
			GM.pc.gotOrificeStretchedWith(BodypartSlot.Anus, 30)

	if(_action == "9_fast"):
		processTime(20*60)
		GM.pc.orgasmFrom("alexrynard")
		if(GM.pc.hasReachableVagina()):
			var thebodypart = GM.pc.getBodypart(BodypartSlot.Vagina)
			if(thebodypart != null):
				thebodypart.addFluidOrifice("HealingGel", RNG.randf_range(250.0, 350.0), null)
			var thebodypart2 = GM.pc.getBodypart(BodypartSlot.Anus)
			if(thebodypart2 != null):
				thebodypart2.addFluidOrifice("HealingGel", RNG.randf_range(250.0, 350.0), null)
		else:
			var thebodypart = GM.pc.getBodypart(BodypartSlot.Anus)
			if(thebodypart != null):
				thebodypart.addFluidOrifice("HealingGel", 2.0*RNG.randf_range(250.0, 350.0), null)

	if(_action == "9_after_brat_cuddle"):
		processTime(20*60)
		GM.pc.freeEyesDeleteAll()
		GM.pc.freeMouthDeleteAll()
		GM.pc.setLocation("med_lobbynw")

	setState(_action)

func saveData():
	var data = .saveData()

	data["bratCounter"] = bratCounter
	data["breastPumpID"] = breastPumpID
	data["penisPumpID"] = penisPumpID
	data["hasPenisPump"] = hasPenisPump
	data["isLact"] = isLact
	data["totalMilk"] = totalMilk
	data["totalSeed"] = totalSeed
	data["inducedLact"] = inducedLact

	return data

func loadData(data):
	.loadData(data)

	bratCounter = SAVE.loadVar(data, "bratCounter", 0)
	breastPumpID = SAVE.loadVar(data, "breastPumpID", "")
	penisPumpID = SAVE.loadVar(data, "penisPumpID", "")
	hasPenisPump = SAVE.loadVar(data, "hasPenisPump", false)
	isLact = SAVE.loadVar(data, "isLact", false)
	totalMilk = SAVE.loadVar(data, "totalMilk", 0.0)
	totalSeed = SAVE.loadVar(data, "totalSeed", 0.0)
	inducedLact = SAVE.loadVar(data, "inducedLact", false)
