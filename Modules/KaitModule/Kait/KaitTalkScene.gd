extends SceneBase

var kaitLove = 0
var kaitObedience = 0

func _init():
	sceneID = "KaitTalkScene"

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You approach Kait, the snow leopard. She is standing near the mission board, thinking.")

		var theUniqieLine:String = getFlag("KaitModule.kaitApproach", "")
		if (theUniqieLine.empty()):
			saynn("[say=kait]Hey there.[/say]")

		else:
			saynn("[say=kait]"+str(theUniqieLine)+"[/say]")

			setFlag("KaitModule.kaitApproach", "")
		kaitLove = GM.main.MS.getKaitLove()
		kaitObedience = GM.main.MS.getKaitObedience()
		saynn("Kait's love: "+str(kaitLove)+"\nKait's obedience: "+str(kaitObedience)+"")

		addButton("Talk", "Ask her something maybe", "talk_menu")
		if (kaitLove >= 2):
			addButton("Sex", "See what lewd stuff you can do with Kait", "sex_menu")
		else:
			addDisabledButton("Sex", "Kait's love towards you must be above 2")
		if (kaitObedience >= 2):
			addButton("Dominate", "See what you can order Kait to do", "dom_menu")
		else:
			addDisabledButton("Dominate", "Kait's obedience must be above 2")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["kait"])
		addButton("Leave", "Enough chatting", "endthescene")
	if(state == "sex_menu"):
		saynn("What kind of sexual activity do you want to do with Kait?")

		addButton("Back", "You changed your mind", "")
		if(GM.pc.hasReachablePenis() || GM.pc.hasReachableVagina() || GM.pc.isWearingChastityCage()):
			addButton("69", "(Love 2+) Lick or suck each other off!", "sex_69")
		else:
			addDisabledButton("69", "You need private bits to be able to do 69, sorry :(")
		addButton("Finger her", "(Love 2+) Make that snep cum just from your fingers!", "sex_fingerher")
	if(state == "dom_menu"):
		saynn("How do you wanna dominate Kait?")

		addButton("Back", "You changed your mind", "")
		addButton("Light domination", "(Obedience 2+) Try to dominate Kait and see what happens", "dom_light")
		if (!getFlag("KaitModule.didKaitDomIntro")):
			addDisabledButton("Oral sex", "You need to dominate Kait first before doing this!")
		else:
			addButton("Oral sex", "(Obedience 2+) Dominate Kait further and make her serve as your cock sucker or a pussy licker", "oral_sex")
	if(state == "talk_menu"):
		saynn("[say=pc]Can I ask you something?[/say]")

		saynn("Her ears perk.")

		saynn("[say=kait]Shoot. We have all the time in the world.[/say]")

		addButton("Back", "Enough chat", "")
		addButton("Kait", "Ask her to tell about herself", "ask_kait")
		addButton("Crimes", "Ask her what did she do", "ask_crimes")
		addButton("Freedom", "Ask her what she is gonna do after", "ask_freedom")
		addButton("Hideout", "Talk about this hideout", "ask_hideout")
		addButton("Ans and Avy", "Talk about Ans and Avy", "ask_ans_avy")
	if(state == "ask_kait"):
		saynn("[say=pc]Tell me about yourself. Anything.[/say]")

		saynn("[say=kait]Well.. I'm Kait, in case you forgot. Got born on a planet that has lots of snow. You probably heard about a few of those.[/say]")

		saynn("[say=pc]Is it a nice planet?[/say]")

		saynn("[say=kait]Sure. Snow is always nice. It hides all the filth and mud.[/say]")

		saynn("[say=pc]Is there a lot of filth to hide?[/say]")

		saynn("[say=kait]When AlphaCorp came, everything went to shit. So.. yeah.[/say]")

		saynn("[say=pc]I bet.[/say]")

		saynn("[say=kait]AlphaCorp's influence expands non-stop. It's just an empire really. And empires always have to have victories. Otherwise they die.[/say]")

		saynn("Probably why there is so much propaganda on TV.")

		saynn("[say=kait]That's not even the part that makes me mad. We had a chance! But they divided us. AlphaCorp told us we have some fucking magic artifacts hidden in our mountains somewhere. And some of us believed them.[/say]")

		saynn("[say=pc]Sounds like a great reason to start a giant mining operation on your planet.[/say]")

		saynn("[say=kait]And thus, filth.[/say]")

		saynn("A few seconds of silence.")

		saynn("[say=pc]But maybe those magic artifacts do actually exist?[/say]")

		saynn("She laughs.")

		saynn("[say=kait]An apple that can control time? A stone that can turn anything it touches into black gold? A ring that can let you control the will of others? Give me a break, they're just feeding off of people's fetishes. Worse than religion, honestly.[/say]")

		saynn("She sighs.")

		saynn("[say=kait]My parents got brainwashed by it all. And that's when I knew that I had to leave, as fast as I fucking could.[/say]")

		saynn("[say=pc]Some dreams do come true.[/say]")

		saynn("She chuckles but then rolls her eyes.")

		saynn("[say=kait]Fuck you. I guess I found one of the artifacts then. Invisible monkey paw.[/say]")

		saynn("You nod.")

		saynn("[say=pc]What do you want now?[/say]")

		saynn("[say=kait]Leave. Again. Do as much damage as I can in the process.[/say]")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_crimes"):
		saynn("[say=pc]So what did you do to end up in this place of all places?[/say]")

		saynn("[say=kait]Stuff. I don't have a sad tear-jerking story I'm afraid.[/say]")

		saynn("[say=pc]You're lilac for a reason. C'mon, I'm curious.[/say]")

		saynn("She throws her head back and stares at the ceiling.")

		saynn("[say=kait]You're the only one who even bothered to ask. Well, I guess Ans also did. He is nice.[/say]")

		saynn("Kait stays quiet, thinking.")

		saynn("[say=kait]I tried to bribe a guy with my ass. Got it stamped with a 'Unsolicited Breeding' charge instead. The worst part? There was no breeding, we didn't get to it even! Total fucking bullshit.[/say]")

		saynn("[say=pc]Are you mad because you didn't get bred?[/say]")

		saynn("[say=kait]Ye.. well, no. Pfff. I'm not a slut.[/say]")

		saynn("[say=pc]Why did they put you into this prison specifically?[/say]")

		saynn("[say=kait]The guy was some big AlphaCorp dude, I dunno. Probably just wanted to get rid of me. I yap too much and don't suck well enough. Locking me here would ensure I don't come back.[/say]")

		saynn("Her whiskers twitch a bit, the corners of her mouth curling downwards, her tail wagging sporadically.")

		saynn("[say=kait]Listen.. This whole system, it's all bullshit on top of bullshit. Everyone does what they wanna do, zero care for others. Corrupt pieces of shit left and right.[/say]")

		saynn("[say=pc]You tried to play by their rules and got burned.[/say]")

		saynn("[say=kait]There are no rules. You gotta lick feet of the guy who jerks your chain, that's the only rule.[/say]")

		saynn("You hear growling.")

		saynn("[say=kait]This world sucks. I could just sit on my ass and do nothing. But I don't wanna do that.[/say]")

		saynn("She shows her fangs.")

		saynn("[say=kait]I will make them lick my feet instead. All of them.[/say]")

		saynn("Kait seems passionate about it.")

		saynn("[say=pc]That will be hard.[/say]")

		saynn("She shrugs, her expression softens.")

		saynn("[say=kait]We can start with the captain of this shithole.[/say]")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_freedom"):
		saynn("[say=pc]What are you gonna do after?[/say]")

		saynn("[say=kait]After what?[/say]")

		saynn("[say=pc]After you get your freedom.[/say]")

		saynn("[say=kait]Live? Like a normal person.[/say]")

		saynn("[say=pc]If you escape, you probably won't be able to live like a normal person anymore.[/say]")

		saynn("[say=kait]I know. This world sucks. But it's also huge.[/say]")

		saynn("She looks to the side.")

		saynn("[say=kait]I will try to find a spot. On some island on some far-away planet that no one cares about. Gonna surf the waves all day. Gonna be sick as fuck.[/say]")

		saynn("[say=pc]Sounds like a nice dream.[/say]")

		saynn("[say=kait]Mhm. For now I just have to keep fighting.[/say]")

		saynn("[say=pc]Am I gonna be welcome on your little island?[/say]")

		saynn("[say=kait]Well, are you a corporate slave?[/say]")

		saynn("[say=pc]Don't think so.[/say]")

		saynn("[say=kait]Then sure. Bring some snacks with you, will ya?[/say]")

		saynn("You chuckle.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_hideout"):
		saynn("[say=pc]What do you think about this hideout?[/say]")

		saynn("[say=kait]It's nice. Does its job too. As long as I can breathe without an AlphaCorp guard staring at my ass, I'm happy.[/say]")

		saynn("[say=pc]Oh.[/say]")

		saynn("Kait squints and then chuckles.")

		saynn("[say=kait]You're not a guard. You don't look like a corporate bitch to me either.[/say]")

		saynn("[say=pc]I guess I have permission then.[/say]")

		saynn("[say=kait]Pfff. Don't abuse it.[/say]")

		saynn("You nod.")

		saynn("[say=pc]I guess this place is nice for breaking people.[/say]")

		saynn("[say=kait]True. It is.[/say]")

		saynn("[say=pc]Do you like breaking people?[/say]")

		saynn("[say=kait]Necessary evil. I don't crave power. If AlphaCorp didn't force itself into my life, I would be giving exactly zero fucks about it.[/say]")

		saynn("[say=pc]So you only started caring once it affected you.[/say]")

		saynn("[say=kait]I just wanted to live in peace. Are you calling me a hypocrite?[/say]")

		saynn("[say=pc]Making an observation.[/say]")

		saynn("[say=kait]Yes, I'm not stupid enough to go against a whole ass intergalactic corporation on my own. My bad I guess.[/say]")

		saynn("[say=pc]But now you have to.[/say]")

		saynn("[say=kait]We all have to.[/say]")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_ans_avy"):
		saynn("[say=pc]What do you think about Ans and Avy?[/say]")

		saynn("Kait shrugs.")

		saynn("[say=kait]Ans seems like a nice guy. Inmates chose him to run the arena so he must be good. I think I trust him.[/say]")

		saynn("[say=pc]Think?[/say]")

		saynn("[say=kait]Yeah, well, I dunno why he would invite Avy into this team.[/say]")

		saynn("[say=pc]Probably because she is one of the best at the arena.[/say]")

		saynn("[say=kait]She is not, trust me. She is just the loudest.[/say]")

		saynn("[say=pc]Either way, more fighting hands is better, don't you agree?[/say]")

		saynn("She shrugs again.")

		saynn("[say=kait]Maybe.[/say]")

		saynn("[say=pc]You hate Avy?[/say]")

		saynn("[say=kait]Of course I do. Every sane person would.[/say]")

		saynn("[say=pc]Can you tell me some of the reasons?[/say]")

		saynn("[say=kait]She is an arrogant, egoistic bitch. Fights unfairly too. She is gonna betray us one day.[/say]")

		saynn("[say=pc]I see.[/say]")

		saynn("[say=kait]Why is she even helping us? Go ask her that, if you haven't already.[/say]")

		saynn("You nod.")

		addButton("Continue", "See what happens next", "talk_menu")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "sex_69"):
		endScene()
		runScene("KaitLove69Scene")
		return

	if(_action == "sex_fingerher"):
		endScene()
		runScene("KaitLoveFingerHerScene")
		return

	if(_action == "dom_light"):
		endScene()
		setFlag("KaitModule.didKaitDomIntro", true)
		runScene("KaitObedienceLightDomScene")

	if(_action == "oral_sex"):
		endScene()
		runScene("KaitObedienceOralSexScene")

	setState(_action)

func saveData():
	var data = .saveData()

	data["kaitLove"] = kaitLove
	data["kaitObedience"] = kaitObedience

	return data

func loadData(data):
	.loadData(data)

	kaitLove = SAVE.loadVar(data, "kaitLove", 0)
	kaitObedience = SAVE.loadVar(data, "kaitObedience", 0)
