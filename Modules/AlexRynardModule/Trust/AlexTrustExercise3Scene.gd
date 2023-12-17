extends SceneBase

var bratCounter = 0

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
		# ((Alex makes the machine take off your clothes with its manipulators
		saynn("asd")

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
		saynn("(Machine grabs you")

		saynn("asd")

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
		saynn("(The machine edges you and then denies you")

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

		addButton("Continue", "See what happens next", "4")
	if(state == "4"):
		playAnimation(StageScene.BDSMMachineFuckAlt, "tease", {bodyState={naked=true, hard=true}})
		saynn("[say=alexrynard]There are so many options for milking.. Let's pick something simpler.[/say]")

		saynn("He presses a button and the machine retracts its wand, stealing all of the pleasure.. Then, the manipulators carefully lift you again before placing you onto the table belly-down, your ass sticking out nice and high.")

		saynn("[say=pc]Ow..[/say]")

		saynn("[say=alexrynard]Hah. This one is for 'internal damage' healing.[/say]")

		saynn("He presses a button and the machine behind you starts to slowly extend one of the dildo-like tools..")

		saynn("[say=alexrynard]But before we do that. I think we should keep the noise level down.[/say]")

		saynn("Alex walks up to you, his hands produce a.. simple ball gag.")

		saynn("[say=alexrynard]Say 'Aa-ah'.[/say]")

		addButton("Aa-ah", "Say it", "4_aah")
		addButton("Stay silent!", "Not say anything", "4_brat")
		addButton("RED", "Say this", "4_red")

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

	if(_action == "3_brat"):
		bratCounter += 1

	if(_action == "4_brat"):
		bratCounter += 1

	setState(_action)

func saveData():
	var data = .saveData()

	data["bratCounter"] = bratCounter

	return data

func loadData(data):
	.loadData(data)

	bratCounter = SAVE.loadVar(data, "bratCounter", 0)
