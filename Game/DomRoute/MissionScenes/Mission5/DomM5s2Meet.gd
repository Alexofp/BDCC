extends SceneBase

func _init():
	sceneID = "DomM5s2Meet"

func _run():
	if(state == ""):
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		addCharacter("kait")
		saynn("You run into Kait suddenly. She is standing near the end of the corridor, her arms crossed.")

		saynn("[say=pc]Kait? Didn't we agree to meet down at the workshop?[/say]")

		saynn("[say=kait]Yeah. I'm just making sure. I will catch up with you.[/say]")

		saynn("[say=pc]What are you doing exactly?[/say]")

		saynn("[say=kait]Nothing! Just making sure Avy doesn't slack off somewhere again![/say]")

		saynn("[say=pc]She didn't last time. She saved you.[/say]")

		saynn("[say=kait]You saved me.[/say]")

		saynn("[say=pc]We both did.[/say]")

		saynn("[say=kait]I'm sure she had something to do with the ambush in the first place. I can feel it.[/say]")

		saynn("[say=pc]Don't be weird, Kait.[/say]")

		saynn("Ans and Avy both catch up with you.")

		saynn("[say=avy]What's the hold up? Move your butts![/say]")

		saynn("Might as well walk together then.")

		addButton("Continue", "See what happens next", "walk_to_elevator")
	if(state == "walk_to_elevator"):
		aimCameraAndSetLocName("hall_elevator")
		addCharacter("avy")
		addCharacter("announcer")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="avy"})
		saynn("You walk through the main hall and enter the elevator together.")

		saynn("[say=announcer]It's rare for me to be out here.[/say]")

		saynn("[say=pc]Don't you have a cell?[/say]")

		saynn("[say=announcer]I do. I rarely use it.[/say]")

		saynn("[say=pc]I didn't see a bed in your office.[/say]")

		saynn("[say=announcer]I sleep on the floor. About as comfy as the beds that they're giving us.[/say]")

		saynn("[say=avy]My back hurts just hearing about that.[/say]")

		saynn("[say=announcer]You get used to it. You get used to anything.[/say]")

		saynn("Finally, the elevator arrives at the mineshaft floor.")

		addButton("Continue", "See what happens next", "sudden_cap")
	if(state == "sudden_cap"):
		addCharacter("captain")
		addCharacter("risha")
		aimCameraAndSetLocName("mining_elevator")
		playAnimation(StageScene.Duo, "stand", {npc="captain"})
		saynn("The doors open.. revealing two figures.")

		saynn("The captain. And his guard, Risha.")

		saynn("Your gazes meet. All four of you freeze up completely.")

		saynn("The captain speaks first.")

		saynn("[say=captain]Hey there, inmates. Mind stepping out for us?[/say]")

		saynn("[say=risha]Yeah, free the space, you sluts.[/say]")

		saynn("[say=avy]Who are you calling sluts?[/say]")

		saynn("[say=announcer]Chill, Avy. No need for this.[/say]")

		saynn("Indeed, there is no reason to be hostile right now. You step out of the elevator.")

		saynn("[say=captain]All heading to the mines, I assume?[/say]")

		saynn("[say=announcer]Something like that. Can't talk for everyone here.[/say]")

		saynn("[say=captain]I suggest the workshop. A much better way of spending your time. Saves your health too.[/say]")

		saynn("[say=announcer]Will keep that in mind.[/say]")

		saynn("[say=captain]Well then. I won't hold you for much longer. Carry on, inmates.[/say]")

		addButton("Continue", "See what happens next", "risha_sudden")
	if(state == "risha_sudden"):
		playAnimation(StageScene.Duo, "stand", {npc="risha"})
		saynn("The captain was stepping inside the elevator.. but then Risha stops him.. while glaring at you.")

		saynn("[say=risha]Wait. That's the bitch that was snooping around on the upper floors.[/say]")

		saynn("The captain stops and looks at you.")

		saynn("[say=captain]Oh yeah? Now I'm curious. What were you doing there, inmate?[/say]")

		saynn("The tension is rising fast.")

		addButton("A way out", "Say that you were looking for a way out of this prison", "cap_say_way_out")
	if(state == "cap_say_way_out"):
		saynn("[say=pc]Looking for a way out.[/say]")

		saynn("He chuckles.")

		saynn("[say=captain]And how did it go? Found one?[/say]")

		saynn("[say=pc]Take a guess.[/say]")

		saynn("[say=captain]Hah. Who knows, maybe you did. But then you decided to stay.[/say]")

		saynn("[say=pc]Why would I want to stay here?[/say]")

		saynn("[say=captain]You'd be surprised, inmate. I don't call this place a paradise for no reason.[/say]")

		saynn("[say=pc]Sure.[/say]")

		saynn("[say=captain]Just be careful next time. The bigger the crime, the bigger the punishment.[/say]")

		saynn("[say=risha]That bitch was snooping around, trying to find a way to escape, and you're just gonna let {pc.him} walk?[/say]")

		saynn("[say=captain]Yeah. Because there is no way to escape. Simple as that.[/say]")

		saynn("That's a bold statement.")

		saynn("[say=risha]Right. Pff.[/say]")

		saynn("They just leave after that.")

		addButton("Continue", "See what happens next", "after_cap")
	if(state == "after_cap"):
		aimCameraAndSetLocName("mining_nearentrance")
		removeCharacter("captain")
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {pc="kait", npc="announcer"})
		saynn("[say=kait]What the fuck was that?[/say]")

		saynn("[say=announcer]We've run into the captain. He seemed.. kind.[/say]")

		saynn("[say=kait]He thinks he is better than us. It's not fucking kindness. It's.. I don't know.. feeling of superiority. Having power over all of us makes him all smug and shit.[/say]")

		saynn("[say=announcer]Not sure if I agree, Kait. He seems to genuinely care.[/say]")

		saynn("[say=avy]Who gives a fuck, he is not suspicious, that's all that matters.[/say]")

		saynn("[say=announcer]True. Let's just go take a look at our foxy already.[/say]")

		addButton("Continue", "See what happens next", "in_workshop")
	if(state == "in_workshop"):
		aimCameraAndSetLocName("eng_workshop")
		saynn("[say=announcer]Hey there. Just wanna say, I always admire the sight of a passionate crafter.[/say]")

		saynn("[say=alexrynard]Save your compliments.[/say]")

		saynn("[say=announcer]My bad. Sometimes I forget that not everybody here is an extraverted narcissist with an ego problem.[/say]")

		saynn("[say=alexrynard]I can tell that you want something. My answer is gonna be no.[/say]")

		saynn("[say=announcer]Very fair. You saw right through me, indeed. It's just.. I'm an old man. I have this cane here..[/say]")

		saynn("[say=announcer]The attached microphone has been getting a little noisy. Not looking for free labor, I have the credits. But I won't bug you any longer, I can try my luck with the other engineers.[/say]")

		saynn("[say=alexrynard]Stop. Show it to me.[/say]")

		saynn("[say=announcer]Of course.[/say]")

		saynn("[say=alexrynard]Right. Give me a few minutes.[/say]")

		saynn("[say=announcer]Will forty credits be enough? I know that audio tech often needs a special touch. I'm ready to pay extra.[/say]")

		saynn("[say=alexrynard]Save your creds, old man.[/say]")

		saynn("[say=announcer]Appreciate it. Really.[/say]")

		saynn("[say=alexrynard]One of the capacitors is leaking. I will switch it for a better one.[/say]")

		saynn("[say=announcer]This cane might be older than me, can you believe that?[/say]")

		saynn("[say=alexrynard]A lot of the things here are old and slowly breaking down. AlphaCorp has better places to waste its capital on.[/say]")

		saynn("[say=announcer]Like wars.[/say]")

		saynn("[say=alexrynard]Like wars.[/say]")

		saynn("[say=announcer]Can I ask you something?[/say]")

		saynn("[say=alexrynard]No. But you can try.[/say]")

		saynn("[say=announcer]If you had a chance to go against AlphaCorp, would you go for it?[/say]")

		saynn("[say=alexrynard]Good joke. No. I'm just a single fox.[/say]")

		saynn("[say=announcer]Some people here share the same views.[/say]")

		saynn("[say=alexrynard]Many things are being shared here. I don't wanna become one of them.[/say]")

		saynn("[say=announcer]You don't understand.[/say]")

		saynn("[say=alexrynard]I do. I understand what you're offering. My answer is the same.[/say]")

		saynn("[say=announcer]My offer is special. Once in a lifetime.[/say]")

		saynn("[say=alexrynard]Listen. I did some very bad stuff. I deserve to be where I am. I was a prisoner here before. I don't wanna become one again. I'm done doing risky shit. I just wanna live my life. In peace. Alone is fine.[/say]")

		saynn("[say=announcer]I'm sorry for wasting your time.[/say]")

		saynn("[say=alexrynard]You're good. If the mic starts breaking down again, bring it straight to me. I see that it has some custom shit tucked in. Want me to check that too? Might take a minute.[/say]")

		saynn("[say=announcer]No need to, it's just a voice processing unit, autotune and all that. Thank you.[/say]")

		saynn("[say=alexrynard]Mhm.[/say]")

		saynn("[say=announcer]I.. I wanted to say..[/say]")

		saynn("[say=alexrynard]What?[/say]")

		saynn("[say=announcer]Nothing. I will let you be.[/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "walk_to_elevator"):
		processTime(5*60)

	setState(_action)
