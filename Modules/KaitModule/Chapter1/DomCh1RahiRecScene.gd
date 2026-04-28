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

		if (hasItemID("ballgag")):
			addButton("Make her", "Put a ballgag on Rahi so she doesn't cry for help and bring her forcefully", "ballgag")
		else:
			addDisabledButton("Make her", "You need a ballgag in your inventory to be able to bring her in without her yelling")
		addButton("Let her be", "Let kitty be for now", "let_her_be")
	if(state == "let_her_be"):
		saynn("[say=pc]Fine.[/say]")

		saynn("[say=rahi]Meow..[/say]")

		saynn("As you step back, Rahi returns to stroking her tail.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "ballgag"):
		playAnimation(StageScene.Choking, "idle", {pc="pc", npc="rahi"})
		saynn("[say=pc]Yell? We can't have that.[/say]")

		saynn("Your hand produced a ballgag.. a default option for situations like this. Rahi's eyes go wide, her eyes flattening.")

		saynn("She tries to jerk her head away and start audibly protesting.. but your hand catches her collar and pulls her close while the other hand slides the rubber ball between her teeth before she can clamp her jaw shut.")

		saynn("[say=rahi]N-no-mmph-..[/say]")

		saynn("Muffled noises keep escaping the feline, she claws at your wrist a few times before you growl into her ear.")

		saynn("[say=pc]It can get much worse.[/say]")

		saynn("That's when she goes mostly still, trembling a bit.. but smart enough not to fight.")

		saynn("[say=pc]That's better.[/say]")

		saynn("You grab her by the collar and pull her off of the bench, inviting her to follow.")

		addButton("Hideout", "Bring kitty to your hideout", "in_arena")
	if(state == "in_arena"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		aimCameraAndSetLocName("fight_nearentrance")
		saynn("The underground arena reveals its ugly sight to the gagged feline. A whole crowd of prisoners stand around the big cage, cheering the next poor bathered souls to continue fighting it out.")

		saynn("Rahi's big kitty eyes are staring at everything around her with naive fascination. It doesn't seem like she ever paid this place a visit.")

		addButton("Continue", "See what happens next", "hideout")
	if(state == "hideout"):
		aimCameraAndSetLocName("hideout_middle")
		saynn("You pull Rahi behind the arena and towards the secret entrance in the Announcer's office. It's hidden behind the metal shelves so you take some time to push them aside. As you do, you begin to see some faint signs of light. Huh.")

		saynn("This abandoned maintenance corridor looks much less abandoned now, that's for sure. It's still a wreck of a place.. but most of the obvious trash has been cleared up. The half-broken table is not here anymore, the thing got moved.")

		saynn("It looks like someone even managed to get the power going. Probably Kait. And probably still without the insulated gloves.")

		saynn("There is no point in keeping Rahi gagged anymore.. so you take the gag back.")

		saynn("[say=rahi]..wow..[/say]")

		saynn("[say=pc]Not gonna scream anymore?[/say]")

		saynn("[say=rahi]Meow..[/say]")

		saynn("A familiar voice approaches.")

		addButton("Continue", "See what happens next", "kait_finds")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ballgag"):
		putOn("rahi", "ballgag")

	if(_action == "in_arena"):
		processTime(5*60)

	if(_action == "hideout"):
		processTime(5*60)
		putOff("rahi", "ballgag")

	if(_action == "kait_finds"):
		processTime(3*60)
		endScene()
		runScene("DomCh1RahiBreakIntroScene")

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
