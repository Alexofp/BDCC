extends SceneBase

var knowsRahi = false
var enslavedRahi = false

func _init():
	sceneID = "DomCh1RahiRecScene"

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		knowsRahi = getFlag("RahiModule.Rahi_AskedName", false)
		enslavedRahi = getFlag("RahiModule.rahi5SceneHappened", false)
		if (!knowsRahi):
			saynn("[say=pc]I have a question for you, Rahi.[/say]")

			saynn("The feline's ears perk.")

			saynn("[say=rahi]How.. meow.. how do you know that name?[/say]")

			saynn("You plant one of your hands on her shoulder and try to establish eye contact. The brown feline isn't so willing to do so, just brushing her tail instead.")

			saynn("[say=pc]I just do. That's not important. What's important is what you can do for me.[/say]")

			saynn("Rahi keeps her chin low, her shoulder twitching ever so slightly.")

			saynn("[say=rahi]What would that be..[/say]")

		else:
			saynn("[say=pc]I have a question for you, Rahi.[/say]")

			saynn("The feline's ears perk.")

			saynn("[say=rahi]She doesn't like that name..[/say]")

			saynn("You plant one of your hands on her shoulder and try to establish eye contact. The brown feline isn't so willing to do so, just brushing her tail instead.")

			saynn("[say=pc]But it's your name. Doesn't matter though, I need to know something.[/say]")

			saynn("Rahi keeps her chin low, her shoulder twitching ever so slightly.")

			saynn("[say=rahi]What would that be..[/say]")

		saynn("[say=pc]Do you want to get out of here?[/say]")

		saynn("Her blue eyes sneakily inspect your body.")

		saynn("[say=rahi]Oh.. you wanna do something with her? In your cell?..[/say]")

		saynn("You sigh.")

		saynn("[say=pc]No. Do you wanna get out of this prison?[/say]")

		saynn("Rahi gives up inspecting your body and instead leans back, her head tilted, the tip of her ponytail resting on her far shoulder.")

		saynn("[say=rahi]Why?[/say]")

		saynn("She genuinely sounds confused. You can try to explain it.. but she might be a lost cause already.")

		saynn("[say=pc]Here is the deal. My team needs a thief. And you were recommended. You are gonna come with me now, nice and quiet. Understand?[/say]")

		saynn("Rahi blinks a lot, gradually leaning away as you get closer. Your hand increases the grip on her shoulder, preventing any dumb ideas.")

		saynn("[say=rahi]Uh.. um.. She is not sure this is a g-good idea.. Kitty doesn't trust you, sorry-y.. meow-w..[/say]")

		saynn("What a scaredy cat. You can either try to get her trust.. which will probably take forever.. or maybe you can just grab her..")

		saynn("[say=rahi]She will yell for help..[/say]")

		saynn("Right. You might need a ballgag to shut her up first.")

		addButton("Make her", "Put a ballgag on Rahi so she doesn't cry for help and bring her forcefully", "ballgag")
		addButton("Let her be", "Let kitty be for now", "let_her_be")
	if(state == "let_her_be"):
		saynn("[say=pc]Fine.[/say]")

		saynn("[say=rahi]Meow..[/say]")

		saynn("As you step back, Rahi returns to stroking her tail.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "ballgag"):
		# (( some anim?
		saynn("[say=pc]Yell? We can't have that.[/say]")

		saynn("Your hand produced a ballgag.. a default option for situations like this. Rahi's eyes go wide, her eyes flattening.")

		saynn("She tries to jerk her head away and start audibly protesting.. but your hand catches her collar and pulls her close while the other hand slides the rubber ball between her teeth before she can clamp her jaw shut.")

		saynn("[say=rahi]N-no-mmph-..[/say]")

		saynn("Muffled noises keep escaping the feline, she claws at your wrist a few times before you growl into her ear.")

		saynn("[say=pc]It can get much worse.[/say]")

		saynn("That's when she goes mostly still, trembling a bit.. but smart enough not to fight.")

		saynn("[say=pc]That's better.[/say]")

		saynn("You grab her by the collar and pull her off of the bench, inviting her to follow.")

		addButton("Hideout", "Bring kitty to your hideout", "hideout")
	if(state == "hideout"):
		saynn("You bring Rahi down into the underground arena and then pull her towards the secret dark room. She follows, her big kitty eyes staring at everything around her. It doesn't seem like she ever paid this place a visit.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "hideout"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["knowsRahi"] = knowsRahi
	data["enslavedRahi"] = enslavedRahi

	return data

func loadData(data):
	.loadData(data)

	knowsRahi = SAVE.loadVar(data, "knowsRahi", false)
	enslavedRahi = SAVE.loadVar(data, "enslavedRahi", false)
