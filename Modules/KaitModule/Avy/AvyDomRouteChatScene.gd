extends SceneBase

func _init():
	sceneID = "AvyDomRouteChatScene"

func _run():
	if(state == ""):
		addCharacter("avy")
		playAnimation(StageScene.Duo, "stand", {npc="avy"})
		saynn("[say=pc]Can I ask you something? About what we're doing.[/say]")

		saynn("Avy puts the arena list away and directs her attention towards you.")

		saynn("What do you wanna ask?")

		addButton("Back", "Enough chat", "endthescene")
		addButton("Avy", "Ask her to tell about herself", "ask_avy")
		addButton("Kait", "Ask about Kait", "ask_kait")
		addButton("Why help", "Why is Avy helping the team", "ask_why_help")
		addButton("Appearance", "Comment on Avy's bulging shorts", "ask_penis")
		addButton("Past", "Ask her about her past", "ask_past")
		addButton("Future", "Ask her about the future", "ask_future")
	if(state == "ask_avy"):
		saynn("[say=pc]Tell me something about yourself.[/say]")

		saynn("[say=avy]Mean bitch. Evil. Will break your bones and walk away laughing. Will dislocate slut's jaws with my knot.[/say]")

		saynn("[say=pc]Nice to meet you.[/say]")

		saynn("[say=avy]I know how to leave a lasting impression.[/say]")

		saynn("[say=pc]So you know that you're evil.[/say]")

		saynn("She chuckles.")

		saynn("[say=avy]Some try to justify their actions. I'm just having fun.[/say]")

		saynn("[say=pc]Are you really that different from AlphaCorp guards then?[/say]")

		saynn("[say=avy]Of course. I'm not greedy. I'd rather have your hole than your wallet.[/say]")

		saynn("[say=pc]Fair.[/say]")

		saynn("[say=avy]Sorry if I'm disappointing you, sweetheart. I just really don't give a fuck.[/say]")

		saynn("[say=pc]I appreciate the honesty.[/say]")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_kait"):
		saynn("[say=pc]You and Kait.[/say]")

		saynn("[say=avy]Predator and prey.[/say]")

		saynn("[say=pc]Right.[/say]")

		saynn("[say=avy]She is soft. Acts tough. Breaks easily.[/say]")

		saynn("[say=pc]Do you hate her?[/say]")

		saynn("Avy shrugs.")

		saynn("[say=avy]As much as one hates a punching bag.[/say]")

		saynn("[say=pc]That's who she is to you?[/say]")

		saynn("[say=avy]I didn't write the rules, you know. This is just nature.[/say]")

		saynn("[say=pc]Nature? We're out in outer space, this place has very little to do with nature.[/say]")

		saynn("[say=avy]And yet I'm at the top of this food chain.[/say]")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_why_help"):
		saynn("[say=pc]Why are you helping us?[/say]")

		saynn("[say=avy]Ans asked me.[/say]")

		saynn("[say=pc]You couldn't have said no.[/say]")

		saynn("[say=avy]I could have.[/say]")

		saynn("[say=pc]And yet you didn't.[/say]")

		saynn("[say=avy]And yet I didn't.[/say]")

		saynn("Avy sure doesn't wanna answer this.")

		saynn("[say=pc]Why not?[/say]")

		saynn("She rolls her eyes, her tail does an annoyed flick.")

		saynn("[say=avy]It'd be rude to the old guy. But it also sounded fun.[/say]")

		saynn("[say=pc]Fun?[/say]")

		saynn("[say=avy]I get to turn AlphaCorp bitches into my bitches.[/say]")

		saynn("[say=pc]Do you hate AlphaCorp?[/say]")

		saynn("[say=avy]Sure.[/say]")

		saynn("[say=pc]You don't sound passionate about it.[/say]")

		saynn("[say=avy]'Cause I'm not? It's pointless, they won. AlphaCorp controls more than half of all the systems or whatever.[/say]")

		saynn("[say=pc]If it's pointless, why are you helping us?[/say]")

		saynn("[say=avy]I told you why.[/say]")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_penis"):
		saynn("[say=pc]You have tits.[/say]")

		saynn("[say=avy]I do.[/say]")

		saynn("Avy crosses her arms.")

		saynn("[say=pc]And bulging shorts.[/say]")

		saynn("[say=avy]You're very observant. Yes, I got born with a dick instead of a cunt.[/say]")

		saynn("[say=pc]Nothing wrong with that.[/say]")

		saynn("[say=avy]Uh huh.[/say]")

		saynn("[say=pc]So you can breed but you can't be bred.[/say]")

		saynn("[say=avy]Tragic, huh?[/say]")

		saynn("[say=pc]Not really. Your cock fits you. You and your personality.[/say]")

		saynn("[say=avy]Is that a weird attempt at a compliment?[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("[say=avy]My cock fits in many things. Just gotta apply enough strength. And strength is one thing I don't lack.[/say]")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_past"):
		saynn("[say=pc]Do you remember your life before prison?[/say]")

		saynn("Avy crosses her arms.")

		saynn("[say=avy]Why are you asking?[/say]")

		saynn("[say=pc]Just curious.[/say]")

		saynn("[say=avy]Why are you curious then?[/say]")

		saynn("[say=pc]C'mon, Avy. I wonder if you had a hard life. I wonder how you ended up here.[/say]")

		saynn("[say=avy]Keep wondering.[/say]")

		saynn("Right. Looks like she doesn't wanna share.")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_future"):
		saynn("[say=pc]What are you gonna do after this?[/say]")

		saynn("[say=avy]I'm gonna be managing the arena, don't ask stupid questions.[/say]")

		saynn("[say=pc]You understood it in a stupid way, Avy. What are you gonna do after you get out? I'm sure you have dreams.[/say]")

		saynn("[say=avy]I'd rather not waste time on pointless shit like dreaming.[/say]")

		saynn("[say=pc]Not a dreamer, huh?[/say]")

		saynn("[say=avy]I'm stuck here forever. You as well.[/say]")

		saynn("[say=pc]If we overthrow the captain, you will be free. Just like me.[/say]")

		saynn("[say=avy]Doubt it.[/say]")

		saynn("[say=pc]Why?[/say]")

		saynn("[say=avy]Get real.[/say]")

		saynn("Right.")

		addButton("Continue", "See what happens next", "")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
