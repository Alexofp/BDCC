extends "res://Scenes/SceneBase.gd"

func _init():
	sceneID = "FirstTimeInMinesScene"

func _run():
	if(state == ""):
		addCharacter("alexrynard")
		playAnimation(StageScene.Duo, "stand", {npc="alexrynard"})
		
		saynn("You approach the mineshafts, the black asteroid rock is what’s replacing the concrete walls here, it’s pretty dark even with a few floodlights around. There are a few inmates around doing something but your attention gets stolen after you notice some staff leaning against a wall, reading his datapad. He sports a yellow uniform and a toolbelt, he is clearly a fox judging from his orange fur and pointy canine muzzle. You spot a little detail on his fur under the right eye, two black rectangles.")

		saynn("[say=alexrynard]Hey you, come here. Haven’t seen you around before[/say]")

		saynn("You do as he says and approach the fox, his badge says ‘Alex Rynard, Station Engineer’. Alex puts his tablet away and quickly eyes you out.")

		saynn("[say=alexrynard]New blood, huh, very cute. Grab a pickaxe and make yourself useful.[/say]")

		saynn("[say=pc]Um. No instructions or anything?[/say]")

		saynn("[say=alexrynard]You hit a rock until you see anything shiny or colorful. If you do, you put that in a minecart. Clear enough for you?[/say]")

		addButton("Reward", "Ask what are you gonna receive", "reward")
		addButton("How", "Why is a rock", "how")
		addButton("Go work", "Time to work", "go_work")

	if(state == "reward"):
		saynn("[say=pc]Am I gonna be paid?[/say]")

		saynn("[say=alexrynard]Yes you will be[/say]")

		saynn("[say=pc]How much?[/say]")

		saynn("[say=alexrynard]Does it matter? You don’t even know the value of credits[/say]")

		saynn("[say=pc]Credits?[/say]")

		saynn("[say=alexrynard]Work credits. Go work already kiddo[/say]")

		saynn("Huh, the guy is not very talkative. He tilts his head and crosses arms, you can spot his exposed sharp fangs.")

		addButton("Reward", "Ask what are you gonna receive", "reward")
		addButton("How", "Why is a rock", "how")
		addButton("Go work", "Time to work", "go_work")

	if(state == "how"):
		saynn("[say=pc]The station is lodged into an asteroid, right?[/say]")

		saynn("[say=alexrynard]And we’re mining the insides of it, the asteroid is at least fifty times the size of the station. Some ores are used as fuel, metals are used to print things, the station is pretty much self-sustainable[/say]")

		saynn("He gives you an annoyed look.")

		saynn("[say=alexrynard]As long as the inmates don’t slack all day[/say]")

		addButton("Reward", "Ask what are you gonna receive", "reward")
		addButton("How", "Why is a rock", "how")
		addButton("Go work", "Time to work", "go_work")

	if(state == "go_work"):
		saynn("You grab the heavy pickaxe and go down into one of the artificially created caves. It’s pretty much what you would expect, wooden supports, rails, minecarts. Main path gets quickly divided into a bunch of little veins with inmates doing the work, most of which spot either red or orange uniforms. You can’t see a single lilac. It’s quite cold but a few inmates aren’t wearing their shirts, maybe to show off their muscles.")

		saynn("You find a spot with no one nearby and begin hitting the rock with your pickaxe.")

		addButton("Work", "Mine the rocks", "work")

	if(state == "work"):
		saynn("You try not to work too hard but still end up very tired, only a few hours pass but it feels like forever. You hit the rocks, carry them, push the minecarts around, just like the others. Seems like it’s finally time to stop for today.")

		addButton("Go get credits", "You’re too tired to continue", "go_get_credits")

	if(state == "go_get_credits"):
		saynn("You return the tool and approach the fox, your uniform and hands are all dirty from the rock dust.")

		saynn("[say=alexrynard]Mhm. You’re free for today[/say]")

		saynn("[say=pc]How much did I earn?[/say]")

		saynn("[say=alexrynard]One day of work here is one work credit[/say]")

		saynn("[say=pc]That doesn’t sound like a lot[/say]")

		saynn("He chooses to ignore your comment and just stares into his datapad.")

		addButton("Continue", "It’s still something, right?", "endthescene")

func _react(_action: String, _args):
	if(_action == "work"):
		processTime(2*60*60)
	
	if(_action == "go_get_credits"):
		GM.pc.addCredits(1)
		GM.pc.addStamina(-40)
		
		GM.main.setFlag("Mining_IntroducedToMinning", true)
		
		processTime(2*60)
		
		addMessage("You earned 1 work credit also completed your task")
		addExperienceToPlayer(20)

	if(_action == "endthescene"):
		endScene()
		return
	
	setState(_action)
