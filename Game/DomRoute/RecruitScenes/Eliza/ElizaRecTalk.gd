extends RecruitTalkSceneBase

func _init():
	sceneID = "ElizaRecTalk"

func _reactInit():
	allTopics = [
	[0],
	[1],
	[2],
	[3, 4, 5, 6, 7, 8, 9, 10],
	]
	getCharacter("eliza").getInventory().clearSlot(InventorySlot.Body)
	putOn("eliza", "LatexStraitjacket")
	putOn("eliza", "oldcollar")

func _run():
	if(state == ""):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("You enter the cell. Eliza is right where you left her, chained to the pipe above her, still wearing that straitjacket that makes her tits visible.")

		saynn("There is a chair in the corner. You take a seat.")

		saynn("[say=pc]Gonna ask you some random things.[/say]")

		saynn("Eliza just glares at you.")

		saynn("[say=eliza]...[/say]")

		addButton("Continue", "See what happens next", "ask_next")
	if(state == "0"):
		saynn("[say=pc]So.. I get it that you're not happy about this.[/say]")

		saynn("Eliza just keeps glaring at you.")

		saynn("[say=pc]Gonna say anything?[/say]")

		saynn("[say=eliza]...[/say]")

		saynn("Looks like you are getting the silent treatment.")

		addRecButtons()
	if(state == "1"):
		saynn("[say=pc]You're a smart kitty, I know that. Why are you pretending to be dumb right now?[/say]")

		saynn("[say=eliza]...[/say]")

		saynn("Her tail wags behind her, annoyed.")

		saynn("[say=pc]You're saving us a ballgag, thank you.[/say]")

		saynn("A quick roll of her eyes.")

		addRecButtons()
	if(state == "2"):
		saynn("[say=pc]Do you realize that we won't just let you go?[/say]")

		saynn("No reaction from her.")

		saynn("[say=pc]Especially after what you did to Kait.[/say]")

		saynn("[say=eliza]I don't regret drugging her up. Is that it?[/say]")

		saynn("There we go.")

		saynn("[say=pc]But do you regret us blowing up the mental ward?[/say]")

		saynn("[say=eliza]Walls can be rebuilt, doors replaced. But what that patient experienced.. it will stay with her until the end of her life.[/say]")

		saynn("[say=pc]Kait is strong. You just made her act silly for a little bit.[/say]")

		saynn("[say=eliza]It left a mark on her, trust me.[/say]")

		saynn("[say=pc]Whatever you say.[/say]")

		saynn("[say=eliza]If I were you, I'd be more afraid of a certain someone.[/say]")

		saynn("[say=pc]What the fuck are you talking about?[/say]")

		saynn("[say=eliza]Oh, so you don't know. Well, I'm not telling you then.[/say]")

		saynn("She is bluffing, surely.")

		addRecButtons()
	if(state == "3"):
		saynn("[say=pc]So you like drugs?[/say]")

		saynn("[say=eliza]I'm a chemist.[/say]")

		saynn("[say=pc]I'm sure you enjoy making drugs. I'm asking about a different thing.[/say]")

		saynn("[say=eliza]The process of testing them can be quite entertaining too.[/say]")

		saynn("[say=pc]Are you a user?[/say]")

		saynn("[say=eliza]Are you asking me if I'm a junkie? Ha. That's the most rude thing I've heard the whole week. I am making medical drugs. Meds.[/say]")

		saynn("[say=pc]I've seen your drugs. They're not medical.[/say]")

		saynn("[say=eliza]I'm testing drugs that might become medical in the future.[/say]")

		saynn("[say=pc]Is that what you're saying to yourself? What if someone tests your drugs on you?[/say]")

		saynn("[say=eliza]Then they would deeply regret it.[/say]")

		addRecButtons()
	if(state == "4"):
		saynn("[say=pc]I saw you choking Ferri.[/say]")

		saynn("[say=eliza]I saw her blow up my mental ward.[/say]")

		saynn("[say=pc]What happened to do no harm? You're a doctor.[/say]")

		saynn("[say=eliza]Reality happened. Take off your rose-tinted glasses.[/say]")

		saynn("[say=pc]Something tells me that you enjoy torturing your patients.[/say]")

		saynn("[say=eliza]Something tells me that Ferri enjoyed it.[/say]")

		saynn("[say=pc]Would you enjoy it?[/say]")

		saynn("[say=eliza]You accused me of being a sadist and now you're asking if I'm also a masochist?[/say]")

		saynn("[say=pc]I guess so.[/say]")

		saynn("[say=eliza]I'm not gonna make it easy for you.[/say]")

		saynn("[say=pc]We can do it the hard way then.[/say]")

		saynn("[say=eliza]I'm not scared. I've been clinically dead at least once in my life.[/say]")

		addRecButtons()
	if(state == "5"):
		saynn("[say=pc]Do you know that you're completely helpless in that straitjacket?[/say]")

		saynn("[say=eliza]Of course I know, I helped to pick this exact model. That's why I'm not struggling.[/say]")

		saynn("[say=pc]Why did you go with latex? Why the exposed tits?[/say]")

		saynn("[say=eliza]Because it's hot. Good enough reason for you?[/say]")

		saynn("[say=pc]Doesn't seem very professional.[/say]")

		saynn("[say=eliza]It does its job.[/say]")

		saynn("[say=pc]Why the chastity belt?[/say]")

		saynn("[say=eliza]To protect.[/say]")

		saynn("[say=pc]Patients need their naughty bits protected? Why? They can't even reach them.[/say]")

		saynn("[say=eliza]To protect from nurses.[/say]")

		saynn("[say=pc]And inmates?[/say]")

		saynn("[say=eliza]Inmates would never get their hands on a mental ward patient.[/say]")

		saynn("[say=pc]I have my hands on you right now.[/say]")

		saynn("[say=eliza]I'm not a patient.[/say]")

		saynn("[say=pc]And yet, you look like one. Do you like wearing the belt?[/say]")

		saynn("[say=eliza]I know that you have the key.[/say]")

		saynn("[say=pc]What if I snap it in half? Right in front of you.[/say]")

		saynn("[say=eliza]That would be kinda hot.[/say]")

		addRecButtons()
	if(state == "6"):
		saynn("[say=pc]Do you like sex?[/say]")

		saynn("[say=eliza]Sure.[/say]")

		saynn("[say=pc]Rough sex?[/say]")

		saynn("[say=eliza]I prefer when it's romantic. Candles, king-sized bed and a fresh set of black lingerie.[/say]")

		saynn("[say=pc]You will have to settle for a dirty cell, cold floor and a straitjacket.[/say]")

		saynn("[say=eliza]Charming.[/say]")

		addRecButtons()
	if(state == "7"):
		saynn("[say=pc]Do you like degradation?[/say]")

		saynn("[say=eliza]Ponyplay, petplay.[/say]")

		saynn("[say=pc]Bark for me.[/say]")

		saynn("[say=eliza]Neigh. And besides, I am the one who degrades.[/say]")

		saynn("[say=pc]Not in here, you're not. We're in charge here.[/say]")

		saynn("[say=eliza]Like sewer rats, sure.[/say]")

		saynn("[say=pc]You're not even that. You're nothing here.[/say]")

		saynn("[say=eliza]I'm a damsel in distress. That's who I am right now.[/say]")

		saynn("[say=pc]No one is coming to save you.[/say]")

		saynn("[say=eliza]No one is coming to save you either.[/say]")

		addRecButtons()
	if(state == "8"):
		saynn("[say=pc]It doesn't have to come down to this. You could choose to submit willingly.[/say]")

		saynn("[say=eliza]Why would I do that? Me? Submit to some dirty inmates?[/say]")

		saynn("[say=pc]You're not that much above any of us.[/say]")

		saynn("[say=eliza]I am on another level. Yes, I am very much above all of you. Do you even know who my mother is?[/say]")

		saynn("[say=pc]She is a bad mother if she allowed you to be here.[/say]")

		saynn("[say=eliza]Fuck. You.[/say]")

		saynn("[say=pc]Am I wrong?[/say]")

		saynn("[say=eliza]...[/say]")

		saynn("[say=pc]Yeah?[/say]")

		saynn("[say=eliza]...[/say]")

		saynn("[say=pc]Two can play at that game.[/say]")

		saynn("[say=eliza]...[/say]")

		saynn("[say=pc]...[/say]")

		saynn("[say=eliza]...[/say]")

		saynn("[say=pc]...[/say]")

		addRecButtons()
	if(state == "9"):
		saynn("[say=pc]What about cuddling?[/say]")

		saynn("[say=eliza]What about it?[/say]")

		saynn("[say=pc]Do you like it?[/say]")

		saynn("[say=eliza]No, of course not. Obviously. Why would I like cuddling? I hate cuddling, duh. Cuddling is like a torture to me, I would break instantly. I'd be begging by the end of it.[/say]")

		saynn("[say=pc]Huh.[/say]")

		saynn("[say=eliza]Did I say too much?[/say]")

		addRecButtons()
	if(state == "10"):
		saynn("[say=pc]You had a lot of things on you. Deep pockets.[/say]")

		saynn("[say=eliza]You better not touch any of it. Or you might cause a biological catastrophe.[/say]")

		saynn("[say=pc]Too bad you don't get a choice in this.[/say]")

		saynn("[say=eliza]Too bad you have no idea what any of it does.[/say]")

		saynn("[say=pc]We have a chemist of our own.[/say]")

		saynn("[say=eliza]Cool. Why would you need me then?[/say]")

		saynn("[say=pc]Good question. You will have to prove your usefulness.[/say]")

		saynn("[say=eliza]Haha. I ain't gonna do shit for you.[/say]")

		saynn("[say=pc]Biological catastrophe it is then.[/say]")

		saynn("[say=eliza]They might never find the bodies in this dirty shithole, you know.[/say]")

		saynn("[say=pc]Your scare tactics don't work because you're here with us.[/say]")

		saynn("[say=eliza]I'm okay with mutual annihilation.[/say]")

		saynn("[say=pc]I'm okay with using you as a test subject.[/say]")

		saynn("[say=eliza]...[/say]")

		addRecButtons()

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ask_next"):
		do_ask_next()
		return

	setState(_action)
