extends SceneBase

func _init():
	sceneID = "SocketTalkScene"

func _run():
	if(state == ""):
		addCharacter("socket")
		playAnimation(StageScene.Duo, "stand", {npc="socket"})
		saynn("You approach Socket. She offers you a kind smile.")

		saynn("[say=socket]Want something?[/say]")

		#var howMuchHelp = getFlag("SocketModule.ch1HelpedTimes", 0)
		addButton("Talk", "Talk about things", "talk_options")
		addButton("Help her", "Show Socket around", "do_show_around")
		addDisabledButton("Upgrades", "Not done yet")
		addButton("Leave", "Enough talking", "endthescene")
	if(state == "talk_options"):
		saynn("What do you want to talk about with Socket?")

		addButton("Casual nudity", "Ask why she is pretty much fully naked", "ask_casual_nudity")
		addButton("Headset", "Ask what she has on her head", "ask_headset")
		addButton("New engineer", "Ask why did she decided to work here", "ask_why_work_here")
		if (getFlag("SocketModule.askedWhyWorkHere")):
			addButton("Casual sex", "Ask her about casual sex", "ask_casual_sex")
		else:
			addDisabledButton("Casual sex", "You don't know about this yet, shush")
		if (getFlag("SocketModule.touchedPussy")):
			addButton("Bioengineered pussy", "Ask what that means", "ask_bioengineered_pussy")
		else:
			addDisabledButton("Bioengineered pussy", "You definitely don't know about this yet, shush")
		addButton("Back", "Enough questions", "")
	if(state == "ask_casual_nudity"):
		saynn("[say=pc]May I ask you something? Something obvious.[/say]")

		saynn("Socket tilts her head slightly, looking a bit confused.")

		saynn("[say=socket]Sure.[/say]")

		saynn("[say=pc]Why are you naked?[/say]")

		saynn("She tilts her head more and shows you her armored boots and arm sleeves.")

		saynn("[say=socket]I'm not naked, I have these! And a backpack.. and my goggles.. and..[/say]")

		saynn("[say=pc]But your.. bits are out.[/say]")

		saynn("She smiles and puffs her chest out, her {socket.breasts} jiggling a bit.")

		saynn("[say=socket]Yeah, the captain said that it's allowed for staff.[/say]")

		saynn("Makes you wonder..")

		saynn("[say=pc]By any chance.. are you an exhibitionst perhaps?[/say]")

		saynn("Socket becomes very confused by your question.")

		saynn("[say=socket]Um.. No? What made you think that?[/say]")

		saynn("Right.. Now it's your turn to be confused. She is not doing it to gather reactions from others.. but why then.")

		saynn("[say=pc]Are the normal clothes too warm for you or something?[/say]")

		saynn("[say=socket]Warm? Not really. The heating here is not perfect but it works.[/say]")

		saynn("It doesn't seem to be a physiological need either.")

		saynn("[say=pc]Then.. Why is your outfit like that?[/say]")

		saynn("Socket looks at herself.. and shrugs.")

		saynn("[say=socket]It's always been like that. For as long as I remember.[/say]")

		saynn("You probably won't be able to get more than that out of her.")

		addButton("Continue", "See what happens next", "talk_options")
	if(state == "ask_why_work_here"):
		setFlag("SocketModule.askedWhyWorkHere", true)
		saynn("She seems kind.. makes you wonder why she is here.")

		saynn("[say=pc]Why did you decide to work here, in prison?[/say]")

		saynn("Socket shrugs.")

		saynn("[say=socket]Why not?[/say]")

		saynn("[say=pc]Lots of bad people here.[/say]")

		saynn("[say=socket]There are lots of bad people everywhere! Don't worry about me, I can protect myself.[/say]")

		saynn("She shows you the shock remote, the same one that other staff members have.")

		saynn("[say=pc]Still, why prison?[/say]")

		saynn("[say=socket]It's more than just a prison. It's an opportunity! So much to fix here, so many things to upgrade. I really like this station so far, can't wait to start making it better.[/say]")

		saynn("So she is a.. workaholic?")

		saynn("[say=socket]And I also heard that there is lots of sex here and stuff![/say]")

		saynn("One of the engineers in the background spits his coffee.")

		saynn("Sex, huh..")

		addButton("Continue", "See what happens next", "talk_options")
	if(state == "ask_casual_sex"):
		saynn("[say=pc]You said something about sex..[/say]")

		saynn("Socket nods.")

		saynn("[say=socket]You don't like sex?[/say]")

		saynn("You look into her eyes.. and see zero shame.")

		saynn("[say=pc]Um.. You're pretty casual about it.[/say]")

		saynn("She smiles and wiggles her hips.")

		saynn("[say=socket]Sex is incredibly fun, why wouldn't we be casual about it? I'm glad that the rules here are so relaxed.[/say]")

		saynn("Her statement does make some sense.")

		saynn("[say=pc]Not all the sex here is casual though. Some of it is pretty rough.[/say]")

		saynn("Socket shrugs.")

		saynn("[say=socket]I don't mind that.[/say]")

		saynn("Interesting.")

		addButton("Ask to touch", "See if she would be okay with you touching her private bits", "ask_to_touch")
		addButton("Continue", "Ask something else", "talk_options")
	if(state == "ask_to_touch"):
		setFlag("SocketModule.touchedPussy", true)
		saynn("[say=pc]I gotta say, you have a nice body.[/say]")

		saynn("Socket smiles.")

		saynn("[say=socket]Oh, thank you![/say]")

		saynn("[say=pc]Can I.. touch it.[/say]")

		saynn("Socket hums.")

		saynn("[say=socket]Of course not![/say]")

		saynn("She sees your confused expression and chuckles.")

		saynn("[say=socket]You forgot to say please, silly.[/say]")

		saynn("Obviously..")

		saynn("[say=pc]Can I please touch you?[/say]")

		saynn("[say=socket]Sure![/say]")

		saynn("She nods and puffs her chest out, giving you full access to.. everything.")

		saynn("You start off easy, brushing your palm over the short fur on her belly and hips. Feels pretty soft and warm, her sides have a nice curve to them. You look her in the eyes and receive a non-verbal go-ahead to do more.")

		saynn("Your hands land on her {socket.breasts}. They're not the biggest.. but they fill your palms nicely. How much more can you hope for? Socket watches your hands with great interest while you fondle and play with her breasts, your digits rubbing her stiff perky nips.")

		saynn("[say=socket]M-mmh..[/say]")

		saynn("Her expression softens, her breathing becomes deeper. After some groping, Socket spreads her legs more.. for you.. an invitation.")

		saynn("One hand stays on her breasts while another slides down to her crotch. You feel.. warmth.. irradiating from her cute tight pussy lips.")

		saynn("Your digits brush over her wet folds and tease the clit a little. Socket's eyes become needier while you do that, she bites her lips.. while standing still and letting you continue, pretending that this is normal. Is it not?..")

		saynn("You're probably doing way more than just touching by this point.. but oh well.. you carefully spread her pussy petals.. and already notice a few strings of juices hanging between them. So lewd.")

		saynn("[say=socket]Do you like it?[/say]")

		saynn("[say=pc]Yeah, it's a nice pussy.[/say]")

		saynn("[say=socket]Thank you. It's bioengineered to be like this.[/say]")

		saynn("Bioengineered.. what..")

		addButton("Continue", "Ask something else", "talk_options")
	if(state == "ask_bioengineered_pussy"):
		saynn("[say=pc]You said that your pussy is.. bioengineered?[/say]")

		saynn("Socket nods and then carefully spreads her folds for you.")

		saynn("[say=socket]One of the biotechs helped me. It's been altered to be more stretchy, elastic and resilient.[/say]")

		saynn("Is she really that big of a size queen? You wouldn't tell from a glance.")

		saynn("[say=socket]Thus, the inner walls of my pussy can better endure various chemical compounds like sugar or weak organic acids.[/say]")

		saynn("The.. what..")

		saynn("[say=pc]Why would you need to have acid in your pussy..[/say]")

		saynn("Socket shrugs.")

		saynn("[say=socket]Weak acids. Like the ones they use in drinks, you know?[/say]")

		saynn("That didn't really make it sound any better. But you feel like you should stop there before you get any more.. juicy details.")

		addButton("Continue", "Ask something else", "talk_options")
	if(state == "ask_headset"):
		saynn("You point at the fancy goggles that Socket has on her forehead.")

		saynn("[say=pc]What's that on your head?[/say]")

		saynn("Socket rolls her eyes up so much her tongue pokes out.")

		saynn("[say=socket]Oh. It's for when I have to netrun![/say]")

		saynn("[say=pc]Netrun?[/say]")

		saynn("She nods many times.")

		saynn("[say=socket]Cybersecurity. Netrunning is how I can protect networks against cyber threats![/say]")

		saynn("Interesting. Socket seems to be more than just an engineer.")

		saynn("[say=socket]Sadly this station doesn't have the required equipment. Makes me feel very lost..[/say]")

		saynn("She looks around.")

		saynn("[say=socket]So I appreciate any help.[/say]")

		saynn("Fair enough.")

		addButton("Continue", "Ask something else", "talk_options")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "do_show_around"):
		var howMuchHelp = getFlag("SocketModule.ch1HelpedTimes", 0)
		if(howMuchHelp == 0):
			howMuchHelp += 1
			runScene("SocketHelp1Mineshaft")
			endScene()
			return

	setState(_action)
