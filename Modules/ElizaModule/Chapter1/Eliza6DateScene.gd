extends SceneBase

func _init():
	sceneID = "Eliza6DateScene"

func _run():
	if(state == ""):
		aimCameraAndSetLocName("med_lobbymain")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("Eliza's shift has ended.. which means.. It's time to meet her.")

		saynn("You find her behind the counter, putting her mug and the laptop away, preparing for something.")

		saynn("[say=eliza]Oh, hey. I'm almost ready.[/say]")

		saynn("She leaves your view.. just to step out of one of the staff-only doors about a minute later.")

		saynn("[say=eliza]Are you ready, my assistant?[/say]")

		saynn("[say=pc]Depends.[/say]")

		saynn("She smiles, her hand is holding a chain..")

		saynn("[say=eliza]I won't use it more than I have to. Unless you will ask~.[/say]")

		saynn("Well, it makes sense for prisons to have at least some safety measures. Worst case, it's just a padded room..")

		addButton("Continue", "See what happens next", "get_leashed")
	if(state == "get_leashed"):
		aimCameraAndSetLocName("cd_elevator")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", bodyState={leashedBy="eliza"}})
		saynn("Eliza reaches and attached a chain leash to your collar with a satisfying click. Running away is not an option anymore.")

		saynn("[say=eliza]There we go, let's go chill![/say]")

		saynn("She guides you towards the elevator, gently tugging on the leash, inviting you to follow.")

		saynn("As you join her inside, she presses her badge against some panel and selects the floor that you haven't really seen to be picked that much.. the top floor.")

		saynn("Doors shut and the elevator begins to move up with an annoying screech.")

		saynn("[say=eliza]Just act casual.[/say]")

		saynn("Makes you wonder why she said that.")

		saynn("But the reason becomes clear quite soon.")

		addButton("Continue", "See what happens next", "sudden_risha")
	if(state == "sudden_risha"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {pc="eliza", npc="risha"})
		aimCameraAndSetLocName("cd_near_elevator")
		saynn("As soon as you step out, you're pretty much instantly greeted by some guards.. and they're not exactly happy to see you. One of the guards looks particularly annoyed, a tall and buff lynx. She steps out and blocks the path.")

		saynn("[say=risha]Look what we have here. I see intruders. Should I just shoot you on sight? Or give a few seconds to explain yourself first?[/say]")

		saynn("Eliza meets her glare with some strict eyes.")

		saynn("[say=eliza]Risha.. The only thing you are shooting is cum out of that useless cock of yours.[/say]")

		saynn("Risha's nostrils flare.. she proudly grabs onto her armored crotch plate, emphasizing her.. virility. Her voice drips with smug amusement.")

		saynn("[say=risha]Oh, is the bitch jealous, huh~? I can give you a litter or two, just beg me nicely.[/say]")

		saynn("Eliza rolls her eyes.")

		saynn("[say=eliza]Hard pass. You can't even fuck someone without making it look like a bloodshed.[/say]")

		saynn("[say=risha]That's just how cat dicks work, I thought you knew your biology~.[/say]")

		saynn("[say=eliza]I also know chemistry. Wanna be stuck with a drug that will make your dick go limp? Your ass is in the way, move it, please.[/say]")

		saynn("[say=risha]I will put my ass anywhere I want, sugar. Like on your face.[/say]")

		saynn("[say=eliza]The only reason why your ass can still be here is because I can't be bothered to report it.[/say]")

		saynn("[say=risha]I'm so scared, wow.[/say]")

		saynn("Risha leans to the side.. and sees you.")

		saynn("[say=risha]Inmates aren't allowed to be here. Feels like it's you who should be reported here.[/say]")

		saynn("[say=eliza]That's my assistant. Now back off, Risha.[/say]")

		saynn("The staff here is so friendly with each other..")

		saynn("[say=risha]Looks like a fucktoy to me.[/say]")

		saynn("[say=eliza]Everything looks like a fucktoy to you, your brain is running on cum. Go jerk off already.[/say]")

		saynn("[say=risha]That ain't true! You look like a bitchtoy to me instead.[/say]")

		saynn("Eliza furrows her brows and tries to walk past.. but Risha bumps her back.")

		saynn("[say=risha]Nope.[/say]")

		saynn("[say=eliza]Alright, I will go poke the captain then.[/say]")

		saynn("Eliza turns around and starts heading back to the elevator. Risha growls.")

		saynn("[say=risha]Fine. Say please.[/say]")

		saynn("[say=eliza]Please go screw yourself, Risha.[/say]")

		saynn("[say=risha]I love you too.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_leashed"):
		processTime(3*60)

	if(_action == "sudden_risha"):
		processTime(3*60)

	setState(_action)
