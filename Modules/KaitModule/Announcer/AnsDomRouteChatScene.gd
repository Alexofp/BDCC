extends SceneBase

func _init():
	sceneID = "AnsDomRouteChatScene"

func _run():
	if(state == ""):
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {npc="announcer"})
		saynn("[say=pc]Can I ask you a few things? If you have time.[/say]")

		saynn("He nods.")

		saynn("[say=announcer]Be my guest.[/say]")

		addButton("Back", "Enough chat", "endthescene")
		addButton("Ans", "Ask him to talk about himself", "ask_ans")
		addButton("Arena", "Ask him about this place", "ask_arena")
		addButton("Avy", "Ask him about Avy", "ask_avy")
		addButton("Future", "Ask him about what he is gonna do if she gets out", "ask_future")
		addButton("Earth", "Ask him about his home planet", "ask_planet")
		if (getModule("KaitModule").hasHideoutAccess()):
			addButton("Team", "Ask what he thinks about the hideout what you're doing", "ask_team")
	if(state == "ask_ans"):
		saynn("[say=pc]Can you tell me something about yourself?[/say]")

		saynn("[say=announcer]You probably know me well already, I am the voice of this arena.[/say]")

		saynn("[say=pc]Are you also its creator?[/say]")

		saynn("[say=announcer]The space existed long before we found it, a relic of prison's past. We have just made it our home.[/say]")

		saynn("[say=pc]We?[/say]")

		saynn("[say=announcer]Collective we. People. I was just one of them.[/say]")

		saynn("[say=pc]So you're one of the founders, still.[/say]")

		saynn("[say=announcer]I guess. I got chosen to run it. I'm sure my voice and appearance played a good part in it. But also my management skills. Fighting abilities are not my virtue though.[/say]")

		saynn("Being both smart and attractive is a rare combo still.")

		saynn("[say=pc]Are the other founders still around?[/say]")

		saynn("[say=announcer]Most of them rather not associate themselves with this place, for one reason or another.[/say]")

		saynn("Interesting.")

		saynn("[say=pc]Where are you from?[/say]")

		saynn("[say=announcer]I come from a little barely-known planet called Earth.[/say]")

		saynn("[say=pc]Earth? What's it like today?[/say]")

		saynn("[say=announcer]You don't wanna know.[/say]")

		saynn("But maybe you can still ask him about it. There is a lot you can ask him in fact.")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_arena"):
		saynn("[say=pc]Why make this place into an arena?[/say]")

		saynn("[say=announcer]People need a way to let their anger out. I'm happy to be able to provide the means to do so.[/say]")

		saynn("His eyes scan the whole place.")

		saynn("[say=announcer]And the arena is just the main attraction. But not the only one.[/say]")

		saynn("[say=pc]You're talking about the prostitution spot?[/say]")

		saynn("[say=announcer]Prostitution is a word that got tainted over the years. At least in the place that I come from. But of course, I'm a pimp so my views are gonna be skewed because of it, be mindful of that.[/say]")

		saynn("Makes sense for a pimp to make a prostitution spot here, in his lair.")

		saynn("[say=pc]I also see a slutwall.[/say]")

		saynn("[say=announcer]Yeah. People expressed their desire. Who am I to say no?[/say]")

		saynn("[say=pc]You don't like it?[/say]")

		saynn("[say=announcer]Different strokes for different folks. I guess I'm not a fan of people punching each other either. But people need to get it out of their system, one way or another. Without all of this, people get grumpy and restless. Then they get hostile and desperate.[/say]")

		saynn("Makes sense.")

		saynn("[say=pc]Do you think the staff knows about this arena?[/say]")

		saynn("[say=announcer]I have little doubts that they do.[/say]")

		saynn("[say=pc]Why didn't they do anything about it?[/say]")

		saynn("[say=announcer]Your guess is as good as mine. Maybe they're afraid.[/say]")

		saynn("It is the arena after all, it will have a lot of good fighters.")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_avy"):
		saynn("[say=pc]Avy is helping you?[/say]")

		saynn("[say=announcer]Yeah, she took a lot off of my shoulders, I'm grateful to her for that. Having her around puts my mind at ease.[/say]")

		saynn("[say=pc]She doesn't exactly seem friendly.[/say]")

		saynn("[say=announcer]She has her many sides. We all do.[/say]")

		saynn("[say=pc]You're saying that she has a good side too?[/say]")

		saynn("[say=announcer]I'm not the one to judge what is good and what is bad. So far I have no regrets.[/say]")

		saynn("[say=pc]There must have been some reason why you chose her still?[/say]")

		saynn("[say=announcer]If she didn't tell you that reason yet, I'd rather do the same then. I hope you can understand my position.[/say]")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_future"):
		saynn("[say=pc]What are you gonna do if you get out of here?[/say]")

		saynn("[say=announcer]I'm old. And I'm only getting older every day.[/say]")

		saynn("[say=pc]Still, who knows. We might have a good chance if we play our cards right.[/say]")

		saynn("[say=announcer]My future is very much linked with my past. I don't have a safe home to come back to anymore. I will have to be on the run. Constantly. AlphaCorp does not forget or forgive.[/say]")

		saynn("[say=pc]Do you have any dreams?[/say]")

		saynn("[say=announcer]I do. In fact, I have many.[/say]")

		saynn("[say=pc]Care to share a few?[/say]")

		saynn("[say=announcer]Hah. You know how it is, baby. If you share them, they won't happen.[/say]")

		saynn("[say=pc]At least you're hopeful.[/say]")

		saynn("[say=announcer]Sure, if you put it like this.[/say]")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_planet"):
		saynn("[say=pc]Can you tell me more about Earth? I'm curious.[/say]")

		saynn("[say=announcer]It used to be a nice little planet. Now it's just pure wasteland, for as far as an eye can see. An eye or a satellite.[/say]")

		saynn("[say=pc]A wasteland? How did that happen?[/say]")

		saynn("[say=announcer]It's a long story. Maybe one day you will get to hear it. Need the right mood for it, you know?[/say]")

		saynn("[say=pc]How did you manage to escape Earth?[/say]")

		saynn("[say=announcer]Rockets. Big bulky rockets. Ones that can barely lift five hundred souls a pop.[/say]")

		saynn("[say=pc]There is no way you had enough of them.[/say]")

		saynn("[say=announcer]You bet. Most of us are still down there, probably killing each other for what little scraps of normal life that are left.[/say]")

		saynn("[say=pc]Sounds terrible. Glad you managed to escape.[/say]")

		saynn("[say=announcer]Me and my girls, we all did.[/say]")

		saynn("[say=pc]How did you manage to pull that off?[/say]")

		saynn("[say=announcer]If you live a life of a pimp long enough, you begin to acquire connections with powerful people. If you treat your girls well, these connections will strengthen. Call it team effort, I wouldn't be here without my girls.[/say]")

		saynn("Power of combined leverage. Smart.")

		saynn("[say=announcer]But also.. As you can see, I'm here now, in this prison. So not everything went as smoothly as I'd hoped. Apparently pimps are not welcome here, in space. Still, I'm happy that they're safe now, at least.[/say]")

		saynn("Your connections only have so much reach it seems.")

		addButton("Continue", "See what happens next", "")
	if(state == "ask_team"):
		saynn("[say=pc]What do you think about us trying to take over this prison?[/say]")

		saynn("[say=announcer]I wouldn't join if I thought badly about it, baby. I think it must be done.[/say]")

		saynn("[say=pc]You will probably lose your arena then.[/say]")

		saynn("[say=announcer]Hah, the whole world is gonna become my arena then. So I'm not too attached to it. At least I'd like to think so.[/say]")

		saynn("[say=pc]We're gonna overthrow the captain.[/say]")

		saynn("[say=announcer]I'm not a fighter type. I wish we could talk it through.[/say]")

		saynn("[say=pc]There is no talking it through, they have full power over us.[/say]")

		saynn("[say=announcer]Indeed, that they do.[/say]")

		addButton("Continue", "See what happens next", "")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
