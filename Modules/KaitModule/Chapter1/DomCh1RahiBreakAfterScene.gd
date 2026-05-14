extends SceneBase

func _init():
	sceneID = "DomCh1RahiBreakAfterScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You approach Kait.")

		saynn("[say=pc]I think that worked.[/say]")

		saynn("[say=kait]Perfect![/say]")

		saynn("The snow leopard seems quite excited.")

		saynn("[say=pc]What are you gonna do with Rahi now?[/say]")

		saynn("[say=kait]We will just let her go until we actually need her. But! From now on, she is our asset.[/say]")

		saynn("Kait steps inside the cell.. and soon steps out together with Rahi. Kait shows her where the exit is.")

		saynn("[say=kait]Go, kitty. We will find you when the time comes.[/say]")

		saynn("[say=rahi]Meow..[/say]")

		saynn("Rahi nods and heads out.")

		saynn("Dominating this prison one poor soul at a time.. this feels like it will take a while. At least it's entertaining.")

		saynn("[say=pc]Alright. Who's next?[/say]")

		saynn("[say=kait]Hold your horses. I think Ans and the bitch have finished clearing up the other room, let's go check on them now![/say]")

		addButton("Follow", "Go see what's up", "others_intro")
	if(state == "others_intro"):
		aimCameraAndSetLocName("hideout_hq")
		GM.pc.setLocation("hideout_hq")
		addCharacter("avy")
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="announcer", pc="avy"})
		saynn("You follow Kait and enter the space that was previously full of crates and shelves. It's been fully cleared it seems..")

		saynn("[say=announcer]Hey there.[/say]")

		saynn("[say=avy]Look who's back. A team leader and a slut.[/say]")

		saynn("Daggers are flying towards the dark fox.")

		saynn("[say=kait]I will punch you, Avy.[/say]")

		saynn("[say=avy]I'm glad you agree with your label.[/say]")

		saynn("The girls are growling at each other, clenching their fists.")

		saynn("[say=pc]We don't have to go through this again.[/say]")

		saynn("[say=kait]Yes. True.[/say]")

		saynn("Kait approaches the table that has been turned on its side.. propped up above the floor with a few crates, creating a make-shift chalk board. She turns towards all of you. Ans hands her something.")

		saynn("[say=announcer]You asked for a marker.[/say]")

		saynn("[say=kait]Yes, thank you.[/say]")

		saynn("Kait idly plays with the marker, doing some tricks, spinning the thing around her thumb.")

		saynn("[say=kait]Welcome to our new HQ! This is where we will do all the planning. We don't have a board.. So this thing will do for now.[/say]")

		saynn("[say=avy]Looks terrible.[/say]")

		saynn("[say=kait]Well, you made it.[/say]")

		saynn("[say=avy]Pff.[/say]")

		saynn("Avy shuts up as Kait turns away.")

		saynn("[say=kait]I'm pretty sure I have a semblance of a plan now. Our main target is obvious.[/say]")

		addButton("Continue", "See what happens next", "kait_starts_plan")
	if(state == "kait_starts_plan"):
		playAnimation(StageScene.Solo, "stand", {pc="kait"})
		saynn("She starts leaning really high, her paw reaching high towards the upper edge of the board. Kait has to stand on her tippy toes.. but she does manage to write the word 'Captain' in big letters.")

		saynn("[say=kait]The captain! If we make him our bitch, the prison is basically ours. We will be able to do whatever the fuck we want, we will be free to leave too. And we will take our collars off of course.[/say]")

		saynn("[say=avy]I will make sure you keep yours.[/say]")

		saynn("[say=kait]Uh huh, try me.[/say]")

		saynn("[say=announcer]AlphaCorp would send an entire fleet to stop us.[/say]")

		saynn("[say=kait]I'm gonna get to that! Let's focus on the main guy first.[/say]")

		saynn("She starts drawing multiple straight lines that lead towards the 'Captain' word from below it. Below those lines, she writes 'Personal guards'.")

		saynn("[say=kait]From what I've gathered, the captain has a few guards who are his 'besties'. They are the best of the best and so he trusts them, naturally. If we manage to break them all, there will be no one left to protect the little guy.[/say]")

		saynn("[say=announcer]Breaking his team, that's a dangerous game you wanna play.[/say]")

		saynn("[say=kait]Yeah. If we do it right, he won't even notice his team turning against him. Do you have something better in mind?[/say]")

		saynn("[say=announcer]Hm..[/say]")

		saynn("[say=avy]I'm sure we can do it. You have me after all, that's all you need.[/say]")

		saynn("[say=kait]Go and do it then, I wanna see you squirm in stocks.[/say]")

		saynn("[say=avy]You're a bitch, you know that?[/say]")

		saynn("Kait offers a cute innocent smile.")

		saynn("[say=kait]Thanks, I'm trying~.[/say]")

		saynn("[say=announcer]Do you know who his personal guards are?[/say]")

		saynn("[say=kait]No. That's where the prison records would be useful.[/say]")

		saynn("[say=announcer]Got ya.[/say]")

		saynn("Kait draws more lines below the previous ones and writes 'Staffers'.")

		saynn("[say=kait]Normal guards and other staff. They're all just little bitches, most of them are basically inmates already, minus the collars. If we dominate the best ones, others should just submit without a fight.[/say]")

		saynn("It doesn't look like there are any objections here.. until Avy decides to chime in.")

		saynn("[say=avy]Either one of them can drop you with their little shitty shock remotes, you know that, right?[/say]")

		saynn("[say=kait]I'm not dumb.[/say]")

		saynn("[say=avy]Not dumb. Just cock-brained.[/say]")

		saynn("Kait sighs.. and starts drawing some kind of machine on the left side of the board. Below it, she writes 'comms'.")

		saynn("[say=kait]The whole prison runs off of 'Bluespace' or whatever that stuff is called. This is how they can communicate with the outside world. And this is also.. probably.. how these collars receive the shock commands.[/say]")

		saynn("[say=avy]How do you know that, smarty pants?[/say]")

		saynn("[say=kait]Because I'm not sitting on my butt all day! If we can somehow.. jam it all.. we can accomplish two things at once. Their collars will become useless.. and they won't be able to call for outside help. When that happens, it will be the perfect time to jump the captain.[/say]")

		saynn("[say=announcer]The engineers are probably responsible for that. The bluespace I mean.[/say]")

		saynn("[say=kait]Yep. We will need to break someone who knows how it all works. Someone who can turn it off when the time comes.[/say]")

		saynn("Kait starts drawing little stick figures on the other side of the board. Below them she writes 'gangs'.")

		saynn("[say=kait]Lastly, as the captain's influence over the prison will fall, other gangs will start to crop up, to try to fill the power vacuum. Some of them will probably share our goal. Others.. will go against us. Just something to keep in mind. Even inmates are out potential enemies. So.. don't share our plan.. don't tell anyone about what we're doing. Don't rat or there will be huge consequences, goes without saying.[/say]")

		saynn("Kait stares at Avy as she finishes saying her last sentence.")

		saynn("[say=avy]Bla-bla-bla. I still don't understand what our next move is.[/say]")

		saynn("[say=kait]Getting the records! Have you been paying attention?[/say]")

		saynn("[say=avy]And? How are you gonna do that?[/say]")

		saynn("[say=kait]Well.. We have Rahi now.. so.. we can try to.. hm..[/say]")

		saynn("[say=announcer]I think I have some ideas. But let's take a break for now. Thank you, Kait.[/say]")

		saynn("Kait smiles as Avy and Ans step out of the room.")

		addButton("Continue", "See what happens next", "after_all")
	if(state == "after_all"):
		removeCharacter("avy")
		removeCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("Kait approaches you.")

		saynn("[say=kait]I think that went pretty well, don't you think?[/say]")

		saynn("[say=pc]Yeah. Enslave the captain, get freedom. Sounds easy.[/say]")

		saynn("She chuckles softly.")

		saynn("[say=kait]Piece of cake, yes. Obviously the captain is a bit out of reach for now.. that's why we have this HQ now! This is our mission center now.[/say]")

		saynn("You look around the room.. A single board and a few chairs.")

		saynn("[say=pc]I guess so.[/say]")

		saynn("[say=kait]I will be here. Talk to me when you will be ready to take the next step.[/say]")

		saynn("That's how we're gonna cross this bridge.. one mission at a time.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "others_intro"):
		processTime(3*60)

	if(_action == "after_all"):
		processTime(10*60)

	setState(_action)
