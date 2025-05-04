extends SceneBase

func _init():
	sceneID = "rahiMilestone6Scene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="stand"})
		saynn("A quiet day. You enter Rahi's cell and see her scribbling something on one of the walls with her claws. You approach her as sneakily as possible and look over her shoulder. Your kitty has scribbled \"Rahi + {rahiMaster} = \" and that's it for now. She also added a kitty face :3")

		saynn("[say=pc]Interesting art.[/say]")

		saynn("Rahi gasps as she turns around and sees you.")

		saynn("[say=rahi]T-thanks.. Hope you are doing alright, {rahiMaster}..[/say]")

		saynn("You reach your hand out to caress Rahi's cheek.")

		saynn("[say=pc]I am. Why didn't you finish the writing, kitty?[/say]")

		saynn("Rahi purrs and nuzzles into your hand but then lowers her head. Kitty's voice sounds a little on the sad side.")

		saynn("[say=rahi]She just.. she is still not sure.. about.. you know.. all of this.. Who is she to you?..[/say]")

		saynn("[say=pc]You're my kitty.[/say]")

		saynn("Rahi smiles softly but then gets sad again.")

		saynn("[say=rahi]Yeah, but.. Is that all?..[/say]")

		saynn("A few seconds of awkward silence.")

		saynn("[say=rahi]Sorry.. don't worry about it..[/say]")

		saynn("You wrap your hands around her girly frame and pull closer to you. A few tears stream down her cheeks.")

		saynn("[say=pc]Let's cuddle and figure it out together, kitty?[/say]")

		saynn("She buries her head into your chest and hugs you back.")

		saynn("Suddenly you hear footsteps, lots of them.. And they're getting closer..")

		addButton("Continue", "See what happens next", "eliza_walks_in")
	if(state == "eliza_walks_in"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Doctor Quinn steps into the cell, followed by a few armored nurses. A familiar sight.")

		saynn("[say=eliza]Did I catch you during an emotional moment? My bad. But it's time we do something about all of this.[/say]")

		saynn("Eliza crosses her arms, her little gang blocking the only exit for you two. As you turn towards them, Rahi keeps hugging you and letting you be her shield.")

		saynn("[say=pc]We don't have to do anything.[/say]")

		saynn("[say=eliza]Oh, please, save it. I allowed you two to get away with everything that you did for way too long.[/say]")

		saynn("Eliza slowly steps closer to you while Rahi grabs onto you harder.")

		saynn("[say=eliza]I wanted to see what would happen. And, to be fair, you did help her, mentally. But let us take it from here and heal her body before the scars become permanent.[/say]")

		saynn("She wants to throw Rahi into the cryopod. And since your kitty is still not too enthusiastic about it, you feel like you must protect her.")

		saynn("[say=pc]You're not gonna do anything to her. Get out.[/say]")

		saynn("Eliza rolls her eyes and returns to her nurses.")

		saynn("[say=eliza]If you two don't wanna play nice I can just..[/say]")

		saynn("Suddenly Rahi cuts Eliza off.")

		saynn("[say=rahi]Alright, let's go do it..[/say]")

		saynn("Rahi steps out from behind you and walks up to doctor Quinn. Both you and Eliza are confused.")

		saynn("[say=rahi]What?.. She wants this, having a big scar across your whole belly gets old fast..[/say]")

		saynn("Eliza stops crossing her arms and tilts her head slightly.")

		saynn("[say=eliza]That was easier than I thought. Huh.[/say]")

		saynn("[say=rahi]One condition. Kitty wants {pc.him} around, okay?[/say]")

		saynn("Rahi points at you. Eliza shrugs.")

		saynn("[say=eliza]Sure, as long as this is not some plan to steal more of my equipment.[/say]")

		saynn("[say=rahi]It's not, let's go.[/say]")

		saynn("Rahi steps past Eliza and all her nurses, walking out of the cell. Eliza stares at you for a bit before following.")

		addButton("Follow", "See where they bring you", "enter_biotech_lab")
	if(state == "enter_biotech_lab"):
		addCharacter("rahi", ["naked"])
		aimCameraAndSetLocName("med_researchlab")
		playAnimation(StageScene.Duo, "stand", {pc="rahi", bodyState={naked=true}, npc="eliza"})
		saynn("You, Rahi, doctor Quinn and some nurses enter the elevator and arrive at the medbay. Eliza opens the staff-only doors and walks you to the biotech laboratory. A sterile white room that has plenty of different equipment.")

		saynn("Doctor Quinn sends nurses away and presents you with a big glass tube with an attached machine.")

		saynn("[say=eliza]I want you to undress while I prepare everything, Rahi.[/say]")

		saynn("She starts tapping away at some keyboard, causing the machine to spring into the action. All the while Rahi takes her time undressing, exposing her bits and also the big nasty surgical scar that still didn't heal despite everything.")

		saynn("[say=pc]You sure, kitty?[/say]")

		saynn("[say=rahi]Yeah.. Kinda..[/say]")

		saynn("Rahi holds onto your hand and waits until Eliza prepares everything.")

		saynn("[say=eliza]You're gonna put this breathing mask on and step inside. The tube will start filling up with something warm and heavy. It's not water.[/say]")

		saynn("[say=rahi]Okay..[/say]")

		saynn("Doctor carefully puts a breathing mask on Rahi that has a tube leading to it.")

		saynn("[say=eliza]You will want to fall asleep at some point. Don't fight it, we will control everything.[/say]")

		saynn("Rahi looks at you from up close for the last time before stepping into the empty glass tube. Eliza does it too to quickly connect Rahi's mask to the port in the ceiling. Rahi is now breathing air that the machine supplies to her.")

		addButton("Continue", "See what happens next", "rahi_gets_healed")
	if(state == "rahi_gets_healed"):
		playAnimation(StageScene.Cryopod, "idle", {pc="rahi", bodyState={naked=true}})
		saynn("Eliza presses a button that closes the cryopod and starts some process.")

		saynn("Some kind of blue fluid begins filling the empty space inside. Kitty looks down at it and.. just stands still, letting it tickle her feet.")

		saynn("[say=pc]Why is it called a cryopod if.. it's warm?[/say]")

		saynn("Doctor is staring at the console.")

		saynn("[say=eliza]Because.[/say]")

		saynn("Quinn presses a button and the level of the blue fluid begins to rise faster, already reaching Rahi's knees.. thighs.. crotch. It clearly tickles her.")

		saynn("[say=eliza]When it was invented, it was used to lower the patient's body temperature as close to zero kelvin as the universe allows. That pretty much stops any internal processes, helps if the situation is close to critical, buys you time.[/say]")

		saynn("Eliza makes sure the screen doesn't show anything bad and just stares at Rahi from now on. The fluid has already reached her neck, making her.. float.. above the floor. Your kitty seems quite surprised by that fact. But she is holding just fine otherwise.")

		saynn("[say=eliza]But then we realized that we can do the opposite and speed up the recovery. The name stuck though.[/say]")

		saynn("Rahi closes her eyes as her head gets fully submerged under the heavy blue liquid. Then she dares to open her eyes again and realizes that it's not that bad. Eliza taps at the glass and shows an 'ok' sign to Rahi. She responds with the same one.")

		saynn("[say=eliza]She can't hear us anymore. But it seems everything is going well, the process has begun.[/say]")

		saynn("Hard to tell if Rahi's scar is healing. But something is happening for sure. Very soon the kitty falls asleep, just floating inside.")

		saynn("[say=eliza]So. How did you manage to do that?[/say]")

		saynn("[say=pc]Manage what?[/say]")

		saynn("[say=eliza]You saved Rahi. She wanted to kill herself before, didn't she? How did you pull her out of that depression spiral?[/say]")

		addButton("Fixed by breaking", "Tell Eliza that you broke Rahi before making a better kitty out of her", "tell_broke")
		addButton("Rahi is strong", "Tell Eliza that Rahi is a strong kitty and just needed some help", "tell_rahi_strong")
	if(state == "tell_broke"):
		setFlag("RahiModule.rahiMile6ToldBroke", true)
		saynn("[say=pc]I think I broke her. Kitty wasn't on a good course indeed so I had to intervene and change it.[/say]")

		saynn("Eliza tilts her head, her eyes trying to read yours.")

		saynn("[say=eliza]And how did you accomplish that?[/say]")

		saynn("[say=pc]I gave her a better goal in life.[/say]")

		saynn("Eliza scritches her own chin.")

		saynn("[say=eliza]What goal would that be if you don't mind me asking?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Easy. Her new life goal is serving me, being my kitty. She is happy when I give her tasks and then reward or punish her.[/say]")

		saynn("Eliza crosses her arms.")

		saynn("[say=eliza]Sounds like slavery to me.[/say]")

		saynn("[say=pc]Well, it worked, as you can see. If your life has a purpose, you don't get reminded of bad events that happened in your past life that much. You're very much focused on the present.[/say]")

		saynn("Eliza is being quiet for a bit.")

		saynn("[say=eliza]Perhaps you're right. Maybe I can learn a thing or two from you.[/say]")

		addButton("Continue", "See what happens next", "eliza_asks_future")
	if(state == "tell_rahi_strong"):
		setFlag("RahiModule.rahiMile6ToldBroke", false)
		saynn("[say=pc]Kitty is strong, you can't even imagine what weight she was carrying on her shoulders. She just needed some help, a pair of ears that would listen to her.[/say]")

		saynn("Eliza tilts her head, her eyes trying to read yours.")

		saynn("[say=eliza]She never opened up to me. Even though I was trying to help. How did you do it?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]We both grew on each other, I don't know what to say. And you were too.. strict.. harsh?[/say]")

		saynn("Eliza hums.")

		saynn("[say=eliza]Perhaps you're right. Maybe I can learn a thing or two from you.[/say]")

		addButton("Continue", "See what happens next", "eliza_asks_future")
	if(state == "eliza_asks_future"):
		saynn("Some time passes. You realize that Rahi's scar.. looks better now. It's way smaller and less pronounced.")

		saynn("[say=pc]Seems to be working, her scar is disappearing.[/say]")

		saynn("Eliza smiles.")

		saynn("[say=eliza]Yeah, your kitty will be fine. I wonder what your next step is gonna be.[/say]")

		saynn("You raise a brow.")

		saynn("[say=eliza]You know, with Rahi.[/say]")

		saynn("That didn't help much.")

		saynn("[say=pc]I don't quite understand-[/say]")

		saynn("She cuts you off.")

		saynn("[say=eliza]Why not propose to her?[/say]")

		saynn("You start coughing.")

		saynn("[say=eliza]Your choice. But you would look cute together, as an official pair~. I can help with the setting up.[/say]")

		saynn("[say=pc]Does that happen often around here?[/say]")

		saynn("Eliza thinks about it for a second.")

		saynn("[say=eliza]Not really, inmates usually just fuck all day, no one is committing to anything bigger.[/say]")

		saynn("Huh, you wonder why.")

		saynn("[say=eliza]Alternatively.. If you really want to make Rahi.. yours. You can claim her. I can help with that too, make sure its safe.[/say]")

		saynn("[say=pc]What do you mean by.. claim?[/say]")

		saynn("[say=eliza]Branding her as your property. A few ways to do that. I'm sure she would be happy no matter what you choose for her.[/say]")

		saynn("That's.. an interesting decision for sure. You just keep staring at your kitty while Eliza goes ahead and fetches something. A little box. She opens it for you and shows.. two simple rings.")

		saynn("[say=eliza]If you're gonna propose, use this. A little gift from me for helping Rahi. Sometimes I ask Alex to melt old or broken restraints into these. Makes for a good reminder.[/say]")

		saynn("[say=pc]Really? Uh.. Thank you.[/say]")

		saynn("[say=eliza]Don't mention it. I have a machine that can inscribe something on them if you want.[/say]")

		saynn("You grab the little box with the rings and store it.")

		saynn("[say=pc]Okay, I will have to think about it.[/say]")

		saynn("Eliza smiles and nods. From now on you just stare at Rahi's quickly healing body.")

		addButton("Continue", "See what happens next", "rahi_after_healed")
	if(state == "rahi_after_healed"):
		saynn("About an hour passes without you even noticing, your head was busy thinking about that offer. Finally, the machine beeps and begins draining the blue fluid out of the pod. That scar on Rahi's belly is completely gone.")

		saynn("Eliza carefully wakes kitty up and waits for the machine to let her out.")

		addButton("Continue", "See what happens next", "rahi_is_good")
	if(state == "rahi_is_good"):
		playAnimation(StageScene.Hug, "hug", {npc="rahi"})
		saynn("Wet Rahi steps out of the pod. You find a blanket and begin rubbing her fur dry.")

		saynn("[say=eliza]How do you feel, Rahi?[/say]")

		saynn("[say=rahi]Oh.. yeah.. great. Wow.[/say]")

		saynn("While drying Rahi you realize that not just the big scar is gone. All of the previous old ones seem to be healed away. Signs of any abuse are all gone, Rahi's body looks incredibly clean, like she is a brand new kitty.")

		saynn("[say=pc]You look great too, kitty.[/say]")

		saynn("Rahi smiles. Purring can be heard from her before she suddenly tackle-hugs you, her naked body rubbing against your.")

		saynn("[say=rahi]Meow-meow![/say]")

		saynn("Eliza crosses her arms.")

		saynn("[say=eliza]Get a room you two.[/say]")

		saynn("You help Rahi dress and follow Eliza until you're out of the medical wing.")

		addButton("Continue", "See what happens next", "rahi_returns_to_cell")
	if(state == "rahi_returns_to_cell"):
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		removeCharacter("eliza")
		addCharacter("rahi")
		saynn("Rahi hops around her cell like a happy kitty.")

		saynn("[say=pc]Glad you're doing better, kitty.[/say]")

		saynn("She stops near you and boops your nose.")

		saynn("[say=rahi]Nothing hurts anymore![/say]")

		saynn("She quickly realizes something and tilts her head down.")

		saynn("[say=rahi]She wouldn't do it without you, {rahiMaster}..[/say]")

		saynn("Your kitty reaches out to land a little kiss on your lips.")

		saynn("[say=rahi]Thank you..[/say]")

		saynn("You wonder if you should tell her about your decision now.. Nah, too much of a good thing is bad.")

		addButton("Continue", "See what happens", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "eliza_walks_in"):
		processTime(5*60)

	if(_action == "enter_biotech_lab"):
		processTime(10*60)

	if(_action == "rahi_gets_healed"):
		processTime(3*60)

	if(_action == "eliza_asks_future"):
		processTime(10*60)

	if(_action == "rahi_after_healed"):
		processTime(60*60)

	if(_action == "rahi_returns_to_cell"):
		processTime(5*60)

	setState(_action)
