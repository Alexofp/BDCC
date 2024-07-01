extends SceneBase

func _init():
	sceneID = "articaS1CellblockScene"

func _run():
	if(state == ""):
		saynn("Wondering where that new inmate went, you begin searching around the giant lilac block, peeking your head into all the cells, one after another.")

		saynn("Takes a while.. you certainly see a fair share of inmates fucking with each other, being bullied by staff or.. ones that just flip you off. The usual for this place..")

		saynn("One cell does seem interesting though. You notice the big frame of the familiar lynx blocking the entrance, the same lynx that brought that inmate in.")

		addButton("Eavesdrop", "Listen to the conversation", "do_eavesdrop")
	if(state == "do_eavesdrop"):
		addCharacter("artica")
		addCharacter("risha")
		playAnimation(StageScene.Duo, "sit", {pc="artica", npc="risha"})
		saynn("You lean against the wall nearby.. and start listening.")

		saynn("[say=risha]Here is your cell, cupcake. Make yourself at home. I don't care that you're lilac, tomorrow I want to see your ass smashing rocks in the mines. Uh huh?[/say]")

		saynn("The inmate is talking too quietly for you to pick up anything. You can only see her fidgeting around in her cell, nervously dragging her hind paws over the cold floor.")

		saynn("[say=risha]No, you can not stay here forever. Only the best sluts get food delivered straight down their throats. Others have to use their hands, mouths and feet. Get what I'm saying?[/say]")

		saynn("More fidgeting from the lilac inmate. She lowers her gaze and sits on her stiff-looking inmate bed, looking around.")

		saynn("[say=risha]Pff, you will have to come out of the closet at some point, girl. You will get hungry soon.[/say]")

		saynn("It's quiet in the room. You can only notice how the lilac is curling her toes while watching them, probably trying to defocus.")

		saynn("[say=risha]It's funny, you seem to have balls..[/say]")

		saynn("The lilac instantly puts her paws onto her shorts.. that are bulging.")

		saynn("[say=risha]And yet, you're the biggest pussy that I have seen![/say]")

		saynn("The cat chuckles.. but then tilts her head to the side slightly, her voice switches to a more quiet understanding one.")

		saynn("[say=risha]If you want my advice.. Don't waste your time, start learning how to throw a good punch. You will need that skill here. It's your life though, I couldn't care less.[/say]")

		saynn("And just like that, the lynx guard turns around and steps out of the cell. Her pointy ears instantly locate you, snooping around.")

		saynn("[say=risha]What? Go mine some rocks too, slut. I need you tired and desperate for my cock. Haha.[/say]")

		saynn("The guard crosses her arms, her eyes begin to look suspicious. Better not to hang around here then. Maybe you can check on this fluff tomorrow.. when there are less annoying bitches around.")

		addButton("Leave", "Time to go", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_eavesdrop"):
		processTime(3*60)

	setState(_action)
