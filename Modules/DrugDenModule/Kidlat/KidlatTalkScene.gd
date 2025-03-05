extends SceneBase

func _init():
	sceneID = "KidlatTalkScene"

func _run():
	if(state == ""):
		addCharacter("kidlat")
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("You stand in Kidlat's cell. Despite its overall blandness, it's still nice and cozy here.")

		var customGreet = getModule("DrugDenModule").getKidlatCustomTalkGreeting()
		if (customGreet == ""):
			saynn("[say=kidlat]Hey, luv![/say]")

		else:
			saynn("[say=kidlat]"+str(customGreet)+"[/say]")

		addButton("Chat", "Ask her a few things", "chat_menu")
		addButton("Sex", "See what lewd things you could do together", "sex_menu")
		addButton("Leave", "Time to go", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["kidlat"])
	if(state == "chat_menu"):
		saynn("What do you wanna chat about with Kidlat?")

		addButton("Alcohol", "Ask if she is still drinking", "ask_alcohol")
		addButton("Back", "Enough chatting", "")
	if(state == "ask_alcohol"):
		saynn("[say=pc]How are your dark thoughts, Kidlat? Still having to drown them out?[/say]")

		saynn("She shrugs.")

		saynn("[say=kidlat]Ehh. Some days are better than others. Sometimes I just can't help it.. you know?[/say]")

		saynn("Not everything is under our control.")

		saynn("[say=pc]I do. Just try not to make it into a habit.[/say]")

		saynn("[say=kidlat]Or what~?[/say]")

		saynn("You can just feel the bratty energy coming off of her.")

		saynn("[say=pc]Well.. it's hard to drink when your hands are cuffed behind your back.[/say]")

		saynn("You wink at her.")

		saynn("Kidlat chuckles and quickly pulls some cuffs and a half-done bottle.")

		saynn("[say=kidlat]Pff, try me![/say]")

		saynn("She hands you the cuffs and willingly brings her paws behind her back, waiting for you.")

		saynn("[say=pc]Why do you have these?[/say]")

		saynn("[say=kidlat]Uh.. Practice?[/say]")

		saynn("Sure.")

		addButton("Lock her paws", "See what she will be able to do with locked paws", "ask_alcohol_lock")
	if(state == "ask_alcohol_lock"):
		playAnimation(StageScene.SelfSuck, "tease", {pc="kidlat"})
		saynn("The cuffs make a satisfying click as you lock them around Kidlat's wrists, forcing her paws to stay behind her back. Then you just hand her a bottle and watch what she will do with it.")

		saynn("Determination and bratiness shines in her eyes as she lies down on the cold floor, near her bed, making sure to keep the bottle the right way up all the time.")

		saynn("With a theatrical roll, she arches her back and lifts her hips high, making her shirt slip up, exposing her fluffy belly.")

		saynn("You can see her muscles tensing up as she starts reaching her cuffed paws up high, bringing them both to the right side of her body and stretching them as far as they can reach.")

		saynn("At the same time, she reaches with her head too, trying to position it so the bottle's bottom is above her mouth.")

		saynn("Only now you realize how.. compromising.. of a position she decides to take. Her butt is high up, presented to you. She is wiggling it too, trying to win some extra precious inches.")

		addButton("Watch", "See what happens next", "ask_alcohol_drink")
	if(state == "ask_alcohol_drink"):
		playAnimation(StageScene.SelfSuck, "inside", {pc="kidlat"})
		saynn("After some time.. you begin to see her vision. She can't reach the bottle with her mouth.. but she can try to position her mouth under it.. and let gravity help with the rest.")

		saynn("Still, even with her natural feline agility, she can't quite reach it.. but then she parts her lips.")

		saynn("She eagerly darts her blue tongue as far as possible.. And wow.. yeah.. it's enough now.")

		saynn("Kidlat begins to carefully tilt the bottle.. and soon.. droplets of alcohol begin to land on her tongue. The sight is undeniably lewd.. her exposed butt, the subtle jiggle of her curves.. and that teasing expression on her face with her lips parted and her tongue out..")

		saynn("A quiet chuckle escapes her as she wiggles her shoulders, trying to maintain balance despite the awkward positioning. For a minute or so, she holds the pose.. cuffed paws raised, head and tongue reaching out.. allowing the cool liquid to drip onto her tongue.. more and more.")

		saynn("She did it, for sure.")

		saynn("[say=pc]Not bad. I believe you.[/say]")

		saynn("Just as slow and smooth as before, she begins to straighten her posture.. and lower her paws.")

		saynn("[say=kidlat]This flexible kitty can do many things~.[/say]")

		saynn("One thought is bugging your mind.. You just have to ask it.")

		saynn("[say=pc]..But can't you just place it somewhere and grab it with your mouth?[/say]")

		saynn("Kidlat blinks.. then blinks again..")

		saynn("[say=kidlat]What do you mea-.. Oh.. That makes a lot of sense actually. Derp.[/say]")

		saynn("She places the bottle on the edge of her bed.. then kneels in front of it and wraps her lips around the bottle's neck.. raising it with ease.")

		saynn("[say=kidlat]Bloody hell.. hic..[/say]")

		saynn("[say=pc]It's okay, there are many more ways to use that flexibility of yours.[/say]")

		saynn("She giggles, her cheeks blushing blue.")

		saynn("[say=kidlat]Haha, true~.[/say]")

		addButton("Uncuff", "Enough tricks", "ask_alcohol_uncuff")
	if(state == "ask_alcohol_uncuff"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat"})
		saynn("You help her to get up and then unlock her cuffs.")

		saynn("[say=kidlat]So yeah.. Some days just suck. You just fall and fall.. fail and fail.[/say]")

		saynn("She rubs her freed wrists and looks at you.")

		saynn("[say=kidlat]But each day when I get to see you instantly becomes better~.[/say]")

		saynn("[say=pc]I'm glad.[/say]")

		saynn("She nods.")

		setFlag("DrugDenModule.KidlatCustomTalkGreet", "Wanna see me bend again~?")
		addButton("Continue", "See what happens next", "chat_menu")
	if(state == "sex_menu"):
		saynn("How do you wanna do it?")

		addButtonWithChecks("Cowgirl", "Kidlat will ride you with her pussy", "sex_cowgirl", [], [[ButtonChecks.HasReachablePenis]])
		addButton("Back", "Never mind", "")
	if(state == "sex_cowgirl"):
		playAnimation(StageScene.Duo, "stand", {npc="kidlat", npcBodyState={naked=true}, bodyState={hard=true, naked=true}})
		addCharacter("kidlat", ["naked"])
		saynn("You lean casually against one of the walls and make Kidlat an offer while spotting a quiet, suggestive smile.")

		saynn("[say=pc]How about a bit of a sexy time?[/say]")

		saynn("For a moment, Kidlat just stares.. But then, a playful grind spreads over her face as she walks up to you.")

		saynn("[say=kidlat]I'm always up for some sexy time~. Let me take the lead, luv..[/say]")

		saynn("She walks up to her personal bed while her paws work on unbuttoning and taking off her inmate shirt. The shorts come next, her clawed digits pull them down by the edges before making them land on a chair nearby. Now there is a fully naked Kidlat standing in front of you..")

		saynn("Her curvy breasts, complete with that cute heart-shaped dark spot, rise and fall with anticipation.. her hips shift invitingly. Just seeing that kitty like this already arouses you quite a bit..")

		addButton("Bed", "Time to get comfy", "sex_cowgirl_bed")
	if(state == "sex_cowgirl_bed"):
		playAnimation(StageScene.SexCowgirlAmazon, "tease", {pc="pc", npc="kidlat", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You step forward and, without wasting another second, lie down onto the bed, getting comfy while Kidlat gets on top. There isn't much space above so she has to keep herself somewhat low.. but her feline agility helps her.")

		saynn("She leans forward more and offers you a great view of her breasts while her paws trail slowly over your {pc.masc} torso, teasing and exploring. Then, with an almost mischievous glint in her eyes, she adjusts her position until her wet, needy slit aligns perfectly with your hard length..")

		saynn("[say=kidlat]Mmhh..[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ask_alcohol"):
		processTime(5*60)

	if(_action == "ask_alcohol_lock"):
		processTime(5*60)
		getCharacter("kidlat").getInventory().forceEquipStoreOtherUnlessRestraint(GlobalRegistry.createItem("inmatewristcuffs"))

	if(_action == "ask_alcohol_drink"):
		processTime(3*60)

	if(_action == "ask_alcohol_uncuff"):
		processTime(3*60)
		getCharacter("kidlat").resetEquipment()

	if(_action == "sex_cowgirl"):
		processTime(3*60)

	if(_action == "sex_cowgirl_bed"):
		processTime(5*60)

	setState(_action)
