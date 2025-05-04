extends SceneBase

func _init():
	sceneID = "DrugDenKidlat1Scene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("You step cautiously through the dark, twisting tunnels, the scent of chemicals thick in the air, making you feel light-headed. So light-headed that your foot accidentally hits an unscrewed panel, making a noise.")

		saynn("[sayFemale]Eep![/sayFemale]")

		saynn("A sudden yelp echoes through the corridor, followed by a flurry of movement. In the dim light, you catch sight of a figure stepping back and forth, fur bristling, tail puffed up like a brush.")

		saynn("Another crazy junkie most likely.. so you raise your fists and prepare for a fight.")

		addButton("Continue", "See what happens next", "kidlat_reveal")
	if(state == "kidlat_reveal"):
		addCharacter("kidlat")
		playAnimation(StageScene.Duo, "stand", {npc="kidlat", npcAction="dodge"})
		saynn("No point in waiting. You push into the darkness.. and instantly run into a startled feline who leaps back the moment she sees you.")

		saynn("[say=kidlat]Oh bloody hell, you nearly gave me a heart attack! What's the big idea sneaking up on a poor little kitty, huh? Rude, rude, rude![/say]")

		saynn("She huffs at you.. but she doesn't seem to be aggressive at all. This gives you time to inspect the dimly-lit kitty.")

		saynn("Before you is a feline.. an inmate.. Her fur is black with sharp cyan patterns. Her eyes, purple and cyan, are staring at you with wide, startled cat pupils. Her uniform has lilac trims on it.. coupled with a bulky metal collar resting snuggly around her neck. She presses a paw to her chest, exhaling dramatically.")

		saynn("You're still a bit confused by the sight. The feline notices that.. and grins, her tail giving a lazy flick.")

		saynn("[say=kidlat]Right then, let's pretend that didn't happen, yeah? Let me introduce myself![/say]")

		addButton("Continue", "See what happens next", "box_intro")
	if(state == "box_intro"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat", kidlatBox=true, further=true})
		saynn("With a theatrical flourish, she plops a battered cardboard box onto the floor and flips it open, revealing an assortment of goods inside. She spreads her arms as if presenting the finest wares in the world.")

		saynn("[say=kidlat]Welcome to Kidlat's humble little shop of shady wonders! You got credits, I got goods. Simple, innit? No takin', no beggin' - I do business properly around here.[/say]")

		saynn("Kidlat, huh.")

		saynn("She leans in slightly, smirking, eyes gleaming with mischief.")

		saynn("[say=kidlat]So, what's it gonna be, hun? Need somethin' to keep your bones from aching? A little something-something to keep things nice and stiff? Or maybe you just wanna chat with a blue cat-shaped thing? That'll cost ya extra, by the way.[/say]")

		saynn("She winks, her tail swishing behind her as she waits for your response.")

		saynn("[say=kidlat]Just kiddin'![/say]")

		saynn("In a sea of mindless junkies.. this sure is an unusual sight.")

		addButton("Just browse", "Skip any chat and just get to business", "just_browse")
		addButton("Ask", "Ask Kidlat what she is doing down here in this dangerous place", "ask_what")
	if(state == "just_browse"):
		saynn("[say=pc]Alright, let's see what you have.[/say]")

		saynn("[say=kidlat]Let me know if something tickles your fancy, hun![/say]")

		saynn("Time for business.")

		addButton("Continue", "See what happens next", "run_generic_shop_scene")
	if(state == "ask_what"):
		saynn("You cross your arms and eye Kidlat as she stands behind her little makeshift shop.")

		saynn("[say=pc]What are you even doing down here in a place like this?[/say]")

		saynn("Her ears twitch, her grin faltering for a brief moment before she waves a paw dismissively.")

		saynn("[say=kidlat]Pffft, what kinda question is that, luv? What am I doing down here? What are you doin' down here, hun? Maybe I gotta be asking you the questions![/say]")

		saynn("She snickers, leaning back against the cold metal wall of an abandoned maintenance tunnel. She taps at her cardboard box with the claws of her hind paw, nodding to herself.")

		saynn("[say=kidlat]I'm just chilling.. thrivin'. While you're all gettin' your butts beat - I just enjoy the ambience and make a little cash on the side. Beats hitting rocks all day![/say]")

		saynn("She stretches, letting out a lazy little meow.. then glances at you with a smirk.")

		saynn("[say=kidlat]Enough about me. You're gonna buy something, luv?[/say]")

		saynn("You were about to consider it.. but now a question lingers on your mind..")

		saynn("[say=pc]Why do you call me luv?[/say]")

		saynn("Kidlat blinks.. and then giggles.")

		saynn("[say=kidlat]I did? Oh. Dunno, why not? Sounds cute, don't it? Bit better than.. Oi, fuckface!.. but if that's what you prefer, I can make some adjustments~.[/say]")

		saynn("What a brat.. She smirks, watching your reaction, clearly enjoying herself. Then she shrugs.")

		saynn("[say=kidlat]Besides, ain't like I know your name. Luv works for all sorts. Easy. Simple. Keeps things friendly n' cozy, and most folks don't whine about it.[/say]")

		saynn("She suddenly leans in slightly, her tail swishing playfully.")

		saynn("[say=kidlat]And you also do look like a 'luv' kinda person. All soft 'round the edges~.[/say]")

		saynn("She chuckles to herself before flopping back into her relaxed position.")

		saynn("[say=kidlat]But hey, if you really wanna make it personal, you could always tell me your name. But I will still just keep callin' ya luv forever.. You have no choice, hun~.[/say]")

		saynn("Right.")

		saynn("Time to see what she is selling.")

		addButton("Continue", "See what happens next", "run_generic_shop_scene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return
		
	if(_action == "just_browse"):
		addMessage("New task added! (Task log can be found inside the 'Me' menu during drug den runs)")
	
	if(_action == "ask_what"):
		addMessage("New task added! (Task log can be found inside the 'Me' menu during drug den runs)")

	if(_action == "run_generic_shop_scene"):
		endScene()
		runScene("DrugDenKidlatShopScene")
		setFlag("DrugDenModule.KidlatCustomShopGreet", "See something you like, luv?")

	setState(_action)
