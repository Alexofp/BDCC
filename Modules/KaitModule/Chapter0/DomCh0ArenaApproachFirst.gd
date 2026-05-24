extends SceneBase

func _init():
	sceneID = "DomCh0ArenaApproachFirst"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You approach a snow leopard that's wearing lilac colors. She is not leaning against any walls.. so she is probably not a prostitute.. probably.")

		saynn("[say=pc]Hey there. What are doing?[/say]")

		saynn("[say=kait]Me? Just resting before the next fight. I gotta get higher on the arena's leaderboard.[/say]")

		saynn("Makes you curious.")

		saynn("[say=pc]Just for fun?[/say]")

		saynn("[say=kait]That's how I'm training. I might just look like a little weak lilac.. but I can punch, you know?[/say]")

		saynn("She is quite enthusiastic, you gotta give her that.")

		saynn("[say=pc]I see.[/say]")

		saynn("You were about to step away.. when you heard her continuing.")

		saynn("[say=kait]I'm also looking for good fighters this way.[/say]")

		saynn("[say=pc]Is that so?[/say]")

		saynn("She nods subtly.")

		saynn("[say=kait]Yeah. I dunno if I can trust you.[/say]")

		saynn("The cat gives you a quick glance from toes to head. She takes a few seconds off to think too.")

		saynn("[say=kait]Alright, fine. I'm assembling a team. A team that would help take over this whole prison.[/say]")

		saynn("Wow. That was pretty sudden.")

		saynn("[say=pc]Sounds quite ambitious.[/say]")

		saynn("[say=kait]Yeah, I've heard that one before, trust me.[/say]")

		saynn("Taking over a whole prison? Sounds impossible.")

		saynn("[say=pc]How are you gonna do it?[/say]")

		saynn("[say=kait]One step at a time. That's why I'm looking for help, you know?[/say]")

		saynn("Maybe you can entertain the idea.")

		saynn("[say=pc]What are the requirements?[/say]")

		saynn("[say=kait]Well.. you gotta be able to stand for yourself. I don't need total doormats.[/say]")

		saynn("Makes some sense.")

		saynn("[say=kait]So.. win a few fights at the arena here. If you do that.. that will be enough for me.[/say]")

		saynn("Nothing is ever that easy, huh.")

		saynn("[say=pc]I have to fight at the arena?[/say]")

		saynn("[say=kait]Yeah? How do you think we're gonna overthrow the captain? We're gonna fight for it. A lot. Until he is our bitch! If you don't wanna fight, that's fine too. Just don't waste my time then, pretty please.[/say]")

		saynn("If you wanna join the rebellion, you gotta become a rebel.")

		addButton("Continue", "See what happens next", "startTalkScene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "startTalkScene"):
		endScene()
		runScene("DomCh0KaitTalkScene")
		return

	setState(_action)
