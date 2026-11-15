extends SceneBase

func _init():
	sceneID = "DomM5s1Intro"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="avy", pc="kait"})
		addCharacter("kait")
		addCharacter("avy")
		addCharacter("announcer")
		saynn("The core of your team gathers around the mission board.")

		saynn("[say=avy]So what's the next step of your genius plan, cat?[/say]")

		saynn("[say=kait]Let me think..[/say]")

		saynn("[say=avy]Alright.[/say]")

		saynn("Time passes. Awkward silence starts to settle in.")

		saynn("[say=avy]Did that nerd doctor take away your last braincell? What did she do to you, anyway?[/say]")

		saynn("[say=kait]Shut up, she didn't do nothing. I'm fine! I know what we have to do.[/say]")

		saynn("She turns towards you all.")

		saynn("[say=kait]We have control over the medical wing now, correct?[/say]")

		saynn("[say=announcer]Me and Eliza had a chat. She understands our position. She will give out orders to the nurses if we need to.[/say]")

		saynn("[say=kait]Good. Thanks. Then.. now..[/say]")

		saynn("You look at the board. There is an obvious next target.")

		saynn("[say=pc]Collars?[/say]")

		saynn("[say=kait]Yes! We gotta do something about the collars next.[/say]")

		saynn("[say=avy]About fucking time.[/say]")

		saynn("[say=kait]Alex Rynard. We need to find him. And then we need to break him.[/say]")

		saynn("[say=avy]Leave that to me. I can break him in half.[/say]")

		saynn("[say=kait]No, Avy. We need him alive so he can take off our collars.[/say]")

		saynn("[say=announcer]Alex is always down in the workshop, working on his prototypes. Maybe we can try a different approach with him? I can try to convince him. Use words rather than punches.[/say]")

		saynn("[say=kait]It won't work. You will just blow our cover.[/say]")

		saynn("[say=announcer]It's risky, for sure. But it's worth a try. Your last operations didn't exactly go smoothly too, did they?[/say]")

		saynn("[say=kait]..fine. You have a point. But we will be near.[/say]")

		saynn("[say=announcer]Hey there. I always admire the sight of a passionate crafter.[/say]")

		saynn("[say=alexrynard]Save your compliments.[/say]")

		saynn("[say=announcer]My bad. Sometimes I forget that not everyone here is an extraverted narcissist.[/say]")

		saynn("[say=alexrynard]I can tell that you want something. My answer is gonna be no.[/say]")

		saynn("[say=announcer]You saw right through me, indeed. It's just.. I'm an old man. I have this cane here..[/say]")

		saynn("[say=announcer]The attached microphone has been getting a little noisy. Not looking for free labor, I have the credits. But I won't bug you any longer, I can try my luck with the other engineers.[/say]")

		saynn("[say=alexrynard]Wait. Show it to me.[/say]")

		saynn("[say=announcer]Of course.[/say]")

		saynn("[say=alexrynard]Right. Give me a few minutes.[/say]")

		saynn("[say=announcer]Will forty credits be enough? I know that audio tech often needs a special touch. I'm ready to pay extra.[/say]")

		saynn("[say=alexrynard]Save your creds, old man.[/say]")

		saynn("[say=announcer]Hah. Appreciate it.[/say]")

		saynn("[say=alexrynard]One of the capacitors is leaking. I will switch it for a better one.[/say]")

		saynn("[say=announcer]This cane might be older than me, can you believe that?[/say]")

		saynn("[say=alexrynard]A lot of the things here are old. AlphaCorp has better places to waste its capital on.[/say]")

		saynn("[say=announcer]Like wars.[/say]")

		saynn("[say=alexrynard]Like wars.[/say]")

		saynn("[say=announcer]If you had a chance to go against AlphaCorp, would you go for it?[/say]")

		saynn("[say=alexrynard]Good joke. No. I'm just a single fox.[/say]")

		saynn("[say=announcer]Some people here share the same views.[/say]")

		saynn("[say=alexrynard]Many things are being shared here. I don't wanna become one of them.[/say]")

		saynn("[say=announcer]You don't understand.[/say]")

		saynn("[say=alexrynard]I do. I understand what you're offering. My answer is the same.[/say]")

		saynn("[say=announcer]My offer is special. Once in a lifetime.[/say]")

		saynn("[say=alexrynard]Listen. I did some very bad stuff. I deserve to be where I am. I went through a lot. I was a prisoner here before. I don't wanna become one again. I'm done doing risky shit. I just wanna live my life. In peace. Alone is fine.[/say]")

		saynn("[say=announcer]I'm sorry for wasting your time.[/say]")

		saynn("[say=alexrynard]You're good. If the mic starts breaking down again, bring it straight to me.[/say]")

		saynn("[say=announcer]You got it. Great work by the way.[/say]")

		saynn("[say=alexrynard]Mhm.[/say]")

		saynn("[say=announcer]I.. I wanted to..[/say]")

		saynn("[say=alexrynard]What?[/say]")

		saynn("[say=announcer]Nothing. I will let you be.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	setState(_action)
