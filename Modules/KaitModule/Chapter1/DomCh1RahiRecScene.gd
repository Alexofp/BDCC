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
		saynn("The underground arena reveals its ugly sight to the gagged feline. A whole crowd of prisoners stand around the arena, cheering the next poor bathered souls to continue fighting it out.")

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
	if(state == "kait_finds"):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="hurt", pc="kait", npcBodyState={leashedBy="kait"}})
		saynn("[say=kait]You brought her in? Perfect.[/say]")

		saynn("Kait rushes in from the side-room, chain in her paw. She swiftly clips it to Rahi's collar. Something about it rubs you the wrong way.")

		saynn("[say=rahi]Ow..[/say]")

		saynn("The feline grabs onto the chain and tugs on it. The snow leopard slaps those brown paws away.")

		saynn("[say=kait]We have just finished clearing out the room for you.[/say]")

		saynn("[say=rahi]Oh?..[/say]")

		saynn("Kait catches your strict glance that's directed towards her.")

		saynn("[say=kait]Something is wrong?[/say]")

		saynn("Rahi decides to chime in.")

		saynn("[say=rahi]She is very-very..[/say]")

		saynn("But you interrupt her by covering up her lips.")

		saynn("[say=pc]You will understand everything soon.[/say]")

		saynn("That seems to satisfy her curiosity for now.")

		saynn("Next, you raise your palm towards Kait.")

		saynn("[say=pc]Hand me the leash.[/say]")

		saynn("[say=kait]Uh.. why? I can hold it.[/say]")

		saynn("Your gaze turns into a glare.")

		saynn("[say=kait]We're a team, no?[/say]")

		addButton("Assert yourself", "(Kait submission +) You brought Rahi after all", "do_assert_yourself")
		addButton("Let her keep it", "(Kait love +) Teamwork makes the dream work", "do_let_her_keep_it")
	if(state == "do_assert_yourself"):
		aimCameraAndSetLocName("hideout_breakroom")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={leashedBy="pc"}})
		saynn("Your hand doesn't move, palm still raised, eyes locked on hers.")

		saynn("[say=pc]And each team has a leader.[/say]")

		saynn("Kait's ears twitch. Her grip on the chain tightens for a moment. The air gets all tense all of the sudden.")

		saynn("Rahi watches this quietly, her tail frozen.")

		saynn("You lower your hand and step closer to Kait. Close enough that she has to tilt her head up to keep eye contact. Close enough that she can feel the heat coming off you.")

		saynn("[say=pc]Do you agree, Kait?[/say]")

		saynn("Her whiskers twitch, her gaze can only hold yours for so long before she looks away.")

		saynn("[say=kait]Well.. yeah. I guess.[/say]")

		saynn("It gets quiet. Somewhere deeper in the tunnel, a pipe trips. Water on metal.")

		saynn("Kait offers you the chain. You take hold of it, your digits brush against each other for a very brief moment.")

		saynn("[say=pc]I appreciate it. Really.[/say]")

		saynn("She offers you a nod.")

		saynn("[say=pc]Shall we?[/say]")

		saynn("[say=kait]Yes, let's go.[/say]")

		saynn("Kait shows you the special little room that they have cleared out. Seems to be an old tool storage room. There is not much here at the moment, just a few chairs and an empty shelf.")

		saynn("There is also a pipe running along one of the walls. You bring Rahi in and wrap the chain around it. Good enough.")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("[say=pc]You're gonna stay here for a bit. Just a bit. Thank you for being so calm about it.[/say]")

		saynn("The brown feline blinks many times and watches as you walk out of the room with Kait and close the door behind.")

		addButton("Continue", "See what happens next", "explain_mechanic")
	if(state == "explain_mechanic"):
		aimCameraAndSetLocName("hideout_near_break_room")
		removeCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You're standing out of the room with Kait.")

		saynn("[say=kait]Okay, the plan is simple. We gotta recruit this cat, make her do what we need her to do. Exactly as told.[/say]")

		saynn("[say=kait]You seem good with people so we might as well let you do this. This is your first time so I will give you some extra instructions.[/say]")

		saynn("[say=kait]From what I've seen so far.. It looks like she won't resist it much. That won't always be the case, don't get used to it.[/say]")

		saynn("[say=kait]Some will require a simple pat on the head. Some will need to be broken. Hard.[/say]")

		saynn("[say=kait]You will have to find a unique approach for each. By the end they must be on their knees, begging to serve us. If that isn't the case, you will have to try again.[/say]")

		saynn("[say=kait]Talk with them. Figure out their kinks, their fears. Use what you've learned against them.[/say]")

		saynn("[say=kait]You will outline a plan and then execute it. If you don't wanna see it, you can let me do it. Or someone else, doesn't matter much. If the plan is good, the person will break and join us.[/say]")

		saynn("[say=pc]Where did you learn all of that? You had experience breaking people?[/say]")

		saynn("[say=kait]Not really, this is my first time too. But I did watch and help a bit a few times. That doesn't matter right now, let's just do it.[/say]")


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

	if(_action == "do_assert_yourself"):
		getModule("KaitModule").incKaitSubmission()

	if(_action == "do_let_her_keep_it"):
		getModule("KaitModule").incKaitLove()

	if(_action == "explain_mechanic"):
		processTime(3*60)

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
