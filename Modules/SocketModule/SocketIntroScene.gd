extends SceneBase

func _init():
	sceneID = "SocketIntroScene"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket", flipNPC=true})
		saynn("You step into the workshop. Place where engineers can teach inmates some useful skills.. or make them do all their work.")

		saynn("This time, something is different though. You notice a face.. no.. a naked butt.. that you haven't seen before. Huh?")

		saynn("Yeah, your eyes don't deceive you, one of the engineers lacks most of her uniform. And she doesn't seem to be concerned about that..")

		addButton("Naked engineer?", "Go see what this is all about", "naked_engineer")
	if(state == "naked_engineer"):
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		say("[table=2][cell][img=300]res://Images/ImagePacks/Rahi/Scenes/socket_nobackground.webp[/img][/cell][cell]")
		
		sayn("You approach her, your gaze glides over her short beige fur that has fancy curved lines of darker shade, her round butt is swaying ever so slightly while she is looking a bit puzzled into her datapad.")

		sayn("She notices your curious stare and turns to face you, unashamedly revealing her slim belly, {socket.breasts} and a cute pussy slit between her legs. She doesn't even flinch, letting you blatantly stare at all her private bits.")

		say("[say=socket]Hi![/say]")
		
		saynn("[/cell][/table]")

		saynn("Such an enthusiastic voice for someone so.. exposed.")

		saynn("[say=pc]Hi?[/say]")

		saynn("Well, she is not completely naked, sure. The girl is wearing some bulky-looking boots and armored sleeves. On her back is a fancy backpack.")

		saynn("She smiles and puts the datapad away into a slot on her boot.")

		saynn("[say=socket]I'm a new engineer, recently hired. Name is Socket.[/say]")

		saynn("Socket, huh. She sounds friendly.")
		
		

		addButton("Why naked", "Ask where is most of her uniform", "say_why_naked")
		addButton("Nice outfit", "Compliment her unusual uniform", "say_nice_outfit")
	if(state == "say_why_naked"):
		saynn("You have to know, maybe she doesn't even realize that she is constantly flashing everyone.")

		saynn("[say=pc]Hey Socket. May I ask.. Where is.. most of your uniform?[/say]")

		saynn("[say=socket]Huh?[/say]")

		saynn("She looks down at herself, inspecting her tits, arms and legs. She even raises her leg and grabs onto the tip of her boot, watching closely.")

		saynn("[say=socket]Everything is there. That is my usual uniform.[/say]")

		saynn("Right.. Is it you who suddenly received x-ray vision power? You blink a lot while staring at her tits, trying to make the clothes appear.. but they don't.")

		saynn("She smiles again and tilts her head slightly.")

		saynn("[say=socket]You like it?[/say]")

		saynn("[say=pc]Sure? It's unique for sure.[/say]")

		saynn("[say=socket]Thanks! Like I said, I'm new here, not exactly sure how things work yet. I don't even know where everything is.[/say]")

		saynn("You wonder if you should tell her how clothes work.. But she doesn't seem to mind being naked.. So..")

		addButton("Continue", "See what happens next", "socket_explains_what_she_does")
	if(state == "say_nice_outfit"):
		saynn("Might as well compliment her appearance. Not every day you see casual nudity.")

		saynn("[say=pc]Nice outfit. Don't you feel cold though?[/say]")

		saynn("[say=socket]Thanks! I don't feel cold, I'm quite used to wearing this already. But thank you for asking.[/say]")

		saynn("Huh. So she understands..")

		saynn("[say=socket]Like I said, I'm new here, not exactly sure how things work yet. I don't even know where everything is.[/say]")

		saynn("Fresh blood, just like you were not that long ago. Maybe you can help each other.")

		addButton("Continue", "See what happens next", "socket_explains_what_she_does")
	if(state == "socket_explains_what_she_does"):
		playAnimation(StageScene.Duo, "stand", {npc="socket", further=true, npcAction=["stand", "res://Inventory/UnriggedModels/BigWrench/BigWrench.tscn"]})
		
		saynn("[say=socket]But I like this station already! So many nice spots and cool equipment.. Some furniture is a little.. rigid.. but that be changed! What is your name?[/say]")

		saynn("[say=pc]The staff usually calls inmates by their numbers.[/say]")

		saynn("Socket shrugs.")

		saynn("[say=socket]Should I do that too?[/say]")

		saynn("Huh. She seems friendly enough not to do that.")

		saynn("[say=pc]Name is {pc.name}.[/say]")

		saynn("[say=socket]Pleasure to meet you, {pc.name}. Maybe you'd be able to show me around? And in exchange.. I can offer some services to you.[/say]")

		saynn("Is she talking about.. what you think she is talking about?")

		saynn("[say=pc]What kind of services?[/say]")

		saynn("She hums for a second. And then pulls out a giant heavy wrench out of her backpack in one smooth motion.")

		saynn("[say=socket]I can upgrade stuff! Like your cell or something. You have a cell, right?[/say]")

		saynn("Oh. Right.")

		saynn("You nod and watch her put the wrench away.")

		saynn("[say=socket]So just let me know and we can arrange something cool![/say]")

		saynn("Fair enough. She seems kind.. unlike most of the staff here.")

		addButton("Continue", "Time to go", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "socket_explains_what_she_does"):
		processTime(5*60)

	setState(_action)
