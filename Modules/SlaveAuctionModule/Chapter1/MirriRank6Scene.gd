extends SceneBase

func _init():
	sceneID = "MirriRank6Scene"

func _run():
	if(state == ""):
		addCharacter("mirri")
		playAnimation(StageScene.Duo, "stand", {npc="mirri"})
		saynn("Time has come. Mirri is staring at her laptop, her name proudly displayed at the top of the list.")

		saynn("The catgirl just stares at it.. at the pixels that spell out Mirri Blacktail.")

		saynn("[say=mirri]I am now the best..[/say]")

		saynn("She doesn't sound entirely happy about it.")

		saynn("[say=mirri]Huh.. that's pretty cool. Look.. so many Blacktails in the list.. and I am above all of them..[/say]")

		saynn("[say=pc]How do you feel about it?[/say]")

		saynn("She shrugs, her tail wagging behind her at a slow rate.")

		saynn("[say=mirri]I don't know.. Depends on what father thinks about it.[/say]")

		saynn("[say=pc]I suggest you don't have high expectations.[/say]")

		saynn("Her feline eyes squint while gazing at you.")

		saynn("[say=mirri]Why not?[/say]")

		saynn("[say=pc]Then you won't be disappointed.[/say]")

		saynn("Mirri lowers her chin and stays quiet.")

		saynn("[say=mirri]It can't get worse than this. Surely.[/say]")

		saynn("She shrugs it off and grabs her laptop.. a proof of her legitimacy.. before heading towards the corridor.")

		saynn("[say=pc]I'm sure it can.[/say]")

		saynn("[say=mirri]I didn't ask your fucking opinion.[/say]")

		saynn("She is still very much a bitch huh.")

		saynn("You get a feeling that a storm is brewing..")

		addButton("Follow", "See what happens next", "in_office")
	if(state == "in_office"):
		aimCameraAndSetLocName("market_luxe")
		addCharacter("luxe")
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="luxe", npcAction="sit"})
		saynn("Mirri walks into Luxe's office uninvited, proudly putting some sway of her hips into every step.")

		saynn("[say=mirri]Hi dad.[/say]")

		saynn("You step inside as well and find yourself a quiet corner to take up. These two don't mix together well, you learned that much.")

		saynn("Luxe was in the process of reading some documents. He takes his time, finishing the page, before putting it aside and looking at his daughter.")

		saynn("[say=luxe]Mirri.[/say]")

		saynn("His tone is cold, neutral.. just like his expression. Mirri's lips twitch.")

		saynn("[say=mirri]Have you.. seen it yet?[/say]")

		saynn("[say=luxe]Seen what?[/say]")

		saynn("[say=mirri]You can't be serious..[/say]")

		saynn("[say=luxe]I very much am, I can't read your mind.[/say]")

		saynn("Mirri opens her laptop and shows the leaderboards to Luxe.")

		saynn("[say=mirri]Read this then.[/say]")

		saynn("The wolf skims through the list and nods subtly.")

		saynn("[say=luxe]Most impressive, Mirri. Your training paid off.[/say]")

		saynn("Mirri nods and just stares at Luxe, waiting for his next words. Luxe stares back.")

		saynn("Seconds begin to run.. with no words exchanged. Mirri is stubborn, waiting for Luxe to say what she wants to hear.. And Luxe is just calm, his eyes barely show any emotion.")

		saynn("Finally, Mirri breaks.")

		saynn("[say=mirri]So.[/say]")

		saynn("[say=luxe]So?[/say]")

		saynn("She rolls her eyes.")

		saynn("[say=mirri]Make me your apprentice. I earned it. And I am Blacktail.[/say]")

		saynn("Luxe tilts his head slightly, his slightly opened jaw shifts left and right, his sharp teeth gently brushing against each other.")

		saynn("[say=luxe]So this is what it's about?[/say]")

		saynn("[say=mirri]Yeah? I obviously can't get you to accept me as your daughter. So, at least make me your apprentice. All the conditions are met, I should be allowed to become the next family head.[/say]")

		saynn("Luxe hears Mirri out.. and then sighs.")

		saynn("[say=luxe]There are no such conditions, Mirri. You imagined them.[/say]")

		saynn("Mirri furrows her brows.")

		saynn("[say=luxe]And besides.. You didn't exactly do it alone, did you?[/say]")

		saynn("[say=mirri]Pff.. Now you're just looking for excuses.[/say]")

		addButton("Continue", "See what happens next", "luxe_stands")
	if(state == "luxe_stands"):
		playAnimation(StageScene.Duo, "stand", {pc="mirri", npc="luxe", npcAction="stand"})
		saynn("Luxe gets up from his throne and leaves his desk, getting close to Mirri, his cold stare directed at you.")

		saynn("[say=luxe]Am I? As much I see, {pc.he} deserves to be number one in that list as much as you do. If not more.[/say]")

		saynn("Mirri looks back at you and frowns more.")

		saynn("[say=mirri]{pc.He} {pc.isAre} just my helper puppy, okay? I could have sold {pc.him} easily. But now {pc.he} works for me, it's only fair.[/say]")

		saynn("[say=luxe]Wonder how {pc.he} {pc.verb('feel')} about it.[/say]")

		saynn("[say=mirri]You are just trying to muddle up the water.[/say]")

		saynn("[say=luxe]I feel like I'm making it nice and clear. You are not gonna be my apprentice. And you are not gonna be the head of this family.[/say]")

		saynn("Mirri clenches her fists, his mean eyes twitching.")

		saynn("[say=mirri]Why? Because my fur is not all black? Because I'm annoying?[/say]")

		saynn("[say=luxe]No.[/say]")

		saynn("[say=mirri]Because you never wanted me, right?[/say]")

		saynn("Luxe becomes quiet after those words. Mirri sees the reaction and closes her eyes, her expression softens.")

		saynn("[say=mirri]But I'm here, dad.. I'm a real person. You can't just get rid of me, can't just pretend that I don't exist. You have to accept me.. You know how much it hurts..[/say]")

		saynn("A lonely tear slides down her cheek.. a tear that Luxe ignores. The wolf stands still like a wall, his fur barely even glowing.")

		saynn("[say=mirri]You see what I went through? How much shit I did? Why don't you just.. Why don't you just call your daughter.. And I will stop.. I will stop being an annoying bitch, I promise.. I just wanna be loved, Dad.. at least a little bit..[/say]")

		saynn("Mirri opens her sad eyes and looks at Luxe. Still, there is no reaction from him.. which makes Mirri cry more.")

		saynn("[say=mirri]..I hate you, dad..[/say]")

		saynn("[say=luxe]I hate you too.[/say]")

		saynn("Mirri's eyes go wide. That was certainly unexpected.")

		saynn("[say=mirri]Wh-.. what?[/say]")

		saynn("Luxe is emotionless.")

		saynn("[say=mirri]What did you say?..[/say]")

		saynn("[say=luxe]I hate you, Mirri.[/say]")

		saynn("Mirri's legs are trembling, she is shaking her head more and more.")

		saynn("[say=mirri]You did not j-just say that, dad..[/say]")

		saynn("[say=luxe]You wanted the truth. That's the truth. I can't stand you. I'd be fine if you never existed.[/say]")

		saynn("More tears begin streaming down her cheeks, the poor girl is shivering, her ears going flat with her head, her tail wrapping around her leg.")

		saynn("[say=mirri]Don't s-say that.. p-please.. why are you saying t-that..[/say]")

		saynn("Suddenly, Luxe starts shouting.")

		saynn("[say=luxe]BECAUSE YOU ARE A MISTAKE.[/say]")

		saynn("[say=mirri]N-nno..[/say]")

		saynn("[say=luxe]YOU ARE A LIVING PROOF THAT I AM WEAK. I HATE YOU MORE THAN ANYTHING.[/say]")

		saynn("His golden fur tips begin dancing, sending little embers into the air.. But Luxe is quick to catch himself and lower his voice down to just an intimidating one.")

		saynn("[say=luxe]And I want you gone.[/say]")

		saynn("Mirri covers her eyes with her paws, quietly sobbing into them.")

		saynn("The atmosphere in the room is.. can only be described as miserable..")

		addButton("Continue", "See what happens next", "mirri_mans_up")
	if(state == "mirri_mans_up"):
		playAnimation(StageScene.Duo, ["holdpistol", "res://Inventory/UnriggedModels/Pistol/Pistol.tscn"], {pc="mirri", npc="luxe"})
		saynn("But after rubbing her red eyes for a bit, she manages to contain her emotions and stop crying.")

		saynn("Her sad expression turns mean as she pulls her gun out and aims it at her father. Something inside her clearly snapped..")

		saynn("[say=mirri]Well.. no point in humiliating myself any longer. Time to grow up.[/say]")

		saynn("Even at a gunpoint, Luxe shows very little emotion.")

		saynn("[say=luxe]You're gonna shoot me?[/say]")

		saynn("He takes one step forward.. Mirri cocks her gun.")

		saynn("[say=mirri]Not a single step more.. you fucker..[/say]")

		saynn("Time to pick your side.")

		addButton("Join Mirri", "Side with Mirri and go against Luxe together", "join_mirri")
		addButton("Join Luxe", "Side with Luxe and go against Mirri together", "join_luxe")
		if (true):
			addButton("Middle", "Block the path for them both", "block_path")
		else:
			addDisabledButton("Middle", "Either Mirri or Luxe don't trust you enough..")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_office"):
		processTime(3*60)

	if(_action == "luxe_stands"):
		processTime(5*60)

	if(_action == "mirri_mans_up"):
		processTime(3*60)

	setState(_action)
