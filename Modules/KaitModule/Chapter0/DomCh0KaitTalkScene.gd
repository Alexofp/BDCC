extends SceneBase

var canJoinKait = false

func _init():
	sceneID = "DomCh0KaitTalkScene"

func _reactInit():
	if(GM.ES.triggerReact(Trigger.TalkingToNPC, ["kaitIntro"])):
		endScene()
		return

func _run():
	if(state == ""):
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		canJoinKait = (!GM.main.hasCommittedToMainRoute() && !getFlag("KaitModule.joinedTeam") && (GlobalRegistry.getModule("FightClubModule").getAmountFightersWon() >= 3 || getFlag("KaitModule.toldSaved")))
		if (getFlag("KaitModule.toldSaved")):
			saynn("[say=kait]Thank you for saving my butt. Wanna join me?[/say]")

		elif (canJoinKait):
			saynn("[say=kait]I saw what you did at the arena! I'm impressed. Wanna join me?[/say]")

		else:
			saynn("[say=kait]Win a few fights at the arena. Then I can make you an offer you can't refuse~.[/say]")

		if (canJoinKait):
			addButton("Join team", "(Begin dom route) Tell Kait that you're ready to join the team", "doJoin")
		else:
			addDisabledButton("Join team", "(Begin dom route) You need to win a few fights at the arena first before she can accept you.")
		addButton("Talk", "See what you can talk about with her", "talk_menu")
		addButton("Sex?", "Offer her some fun time", "sex_nope")
		addButton("Leave", "Enough chatting", "endthescene")
		GM.ES.triggerRun(Trigger.TalkingToNPC, ["kaitIntro"])
		
	if(state == "sex_nope"):
		saynn("[say=pc]Wanna have some fun?[/say]")

		saynn("Kait instantly pouts at your words.")

		saynn("[say=kait]I'm wearing lilac colors but that doesn't mean I'm a slut![/say]")

		saynn("[say=pc]Did I call you a slut?[/say]")

		saynn("She crosses her arms.")

		saynn("[say=kait]Pff.. I'm sure you thought about it.[/say]")

		saynn("[say=pc]I guess that's a firm no.[/say]")

		saynn("There is a short silence.")

		saynn("[say=kait]I got bigger things to worry about for now, mindless fucking can wait until I get my plans rolling.[/say]")

		saynn("Kitty got dreams, that's fair.")

		saynn("[say=pc]But once you're free, you are going total slut mode, right?[/say]")

		saynn("[say=kait]Pff..[/say]")

		saynn("Another break.. followed by her giggle.")

		saynn("[say=kait]Sure, hah. Why not.[/say]")

		addButton("Continue", "See what happens next", "")
	if(state == "talk_menu"):
		saynn("What do you wanna ask Kait?")

		addButton("Back", "Enough chatting!", "")
		addButton("Kait", "Ask about her", "ask_kait")
		addButton("Arena", "Ask about this place", "ask_arena")
		addButton("Crimes", "Ask her what did she do", "ask_crimes")
		addButton("Freedom", "Ask her what she is gonna do after", "ask_freedom")
		if (!getFlag("KaitModule.bredByAviArena") && !getFlag("KaitModule.toldSaved")):
			addButton("Avy..", "Tell Kait that it was you who saved her from getting fucked by Avy", "ask_avy")
	if(state == "ask_avy"):
		saynn("[say=pc]I wanted to tell you something.[/say]")

		saynn("[say=kait]Yeah?[/say]")

		saynn("[say=pc]Back then.. when you were fighting Avy.. it was me.[/say]")

		saynn("She raises a brow.")

		saynn("[say=kait]You.. you're saying that it was you who distracted her?[/say]")

		saynn("You nod.")

		saynn("[say=kait]Oh. Hah. Hm..[/say]")

		saynn("A rush of different thoughts hit her all at once.")

		saynn("[say=kait]Part of me wishes that you didn't do that.[/say]")

		saynn("[say=pc]You'd rather be fucked raw by Avy?[/say]")

		saynn("[say=kait]Well.. not really. But I knew what I was signing up for. And this is only a small part of me that wishes that. The other part is really happy.[/say]")

		saynn("She smiles cutely.")

		saynn("[say=kait]So yeah.. Thank you.[/say]")

		saynn("You nod.")

		saynn("[say=pc]You knew her weak spot.[/say]")

		saynn("[say=kait]Pfft, of course I did. That bitch loves bragging about her cock.[/say]")

		saynn("She giggles.")

		saynn("[say=kait]You know what.. I think I'd love to have someone like you in the team. I'm offering you to join me. I need help bringing this prison down to its knees.[/say]")

		saynn("Looks like you don't have to fight in the arena anymore!")

		saynn("[say=pc]I will think about it.[/say]")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_crimes"):
		saynn("[say=pc]What did you do? To end up in this place?[/say]")

		saynn("[say=kait]Stuff. I don't have a sad tear-jerking story I'm afraid.[/say]")

		saynn("[say=pc]You're lilac for a reason. C'mon, I'm curious.[/say]")

		saynn("She throws her head back and stares at the ceiling.")

		saynn("[say=kait]You're the only one who even bothered to ask. Well, I guess Ans also did. He is nice.[/say]")
		
		saynn("She sighs.")
		
		saynn("[say=kait]I tried to bribe a guy with my ass. Got my face stamped with a 'Unsolicited Breeding' charge. The worst part? There was no breeding, we didn't get to it even! Total fucking bullshit.[/say]")

		saynn("[say=pc]Are you mad because you didn't get bred?[/say]")

		saynn("[say=kait]Ye.. well, no. Pfff.[/say]")

		saynn("[say=pc]Why did they put you into this prison specifically?[/say]")

		saynn("[say=kait]The guy was some big AlphaCorp dude, I dunno. Probably just wanted to get rid of me. I yap too much and don't suck well enough.[/say]")

		saynn("Her whiskers twitch a bit, the corners of her mouth curling downwards, her tail wagging sporadically.")

		saynn("[say=kait]Listen.. This whole system, it's all bullshit on top of bullshit. Everyone does what they wanna do. Everyone is a corrupt piece of shit.[/say]")

		saynn("[say=pc]You tried to play by their rules and got burned.[/say]")

		saynn("[say=kait]There are no rules. You gotta lick feet of the guy who jerks your chain, that's the only rule. Fuck them.[/say]")

		saynn("Even despite all the noise from the arena.. you hear growling.")

		saynn("[say=kait]I will make them lick my feet instead. All of them.[/say]")

		saynn("She seems passionate about it.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_arena"):
		saynn("[say=pc]Interesting place, this is.[/say]")

		saynn("[say=kait]Yeah, it's nice here. I almost don't feel the weight of this heavy-ass collar.[/say]")

		saynn("[say=pc]Staff doesn't know about this place?[/say]")

		saynn("[say=kait]I'm sure they do by now. They're stupid but they're not that stupid. I guess they just choose to ignore it.[/say]")

		saynn("[say=pc]Why?[/say]")

		saynn("[say=kait]Who knows. Who cares.[/say]")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_kait"):
		saynn("[say=pc]Tell me about yourself.[/say]")

		saynn("[say=kait]I'm Kait, in case you forgot. I guess I'm fairly new here.[/say]")

		saynn("[say=pc]Fairly?[/say]")

		saynn("[say=kait]A few weeks.[/say]")

		saynn("[say=pc]And you already wanna escape?[/say]")

		saynn("[say=kait]Any sane person would want to, who the fuck runs a prison like that. Shock collars? Are you serious? Pillories? What century are we in? Don't get me started about the food. Total slop.[/say]")

		saynn("[say=pc]Some like it here I'm sure.[/say]")

		saynn("[say=kait]They like the little bits of power they can extract from each other. Captain thinks that letting us fuck with each other is enough to keep us under control.[/say]")

		saynn("[say=pc]It looks like it's working so far.[/say]")

		saynn("[say=kait]So far.[/say]")

		saynn("She scritches her own chin with her clawed digits.")

		saynn("[say=pc]You did a lot in these few weeks.[/say]")

		saynn("[say=kait]Yeah, sure. But I'd be able to do a lot more in a proper team.[/say]")

		saynn("She gives you a quick glance.")

		addButton("Continue", "See what happens next", "talk_menu")
	if(state == "ask_freedom"):
		saynn("[say=pc]What are you gonna do after?[/say]")

		saynn("[say=kait]After what?[/say]")

		saynn("[say=pc]After you get your freedom.[/say]")

		saynn("[say=kait]Live? Like a normal person.[/say]")

		saynn("[say=pc]If you escape, you probably won't be able to live like a normal person anymore.[/say]")

		saynn("[say=kait]I know. I will try to find a spot. On some island on some far-away planet that no one cares about. Gonna surf the waves all day.[/say]")

		saynn("[say=pc]Sounds like a nice dream.[/say]")

		saynn("[say=kait]Mhm. For now I just have to keep fighting.[/say]")

		addButton("Continue", "See what happens next", "talk_menu")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "doJoin"):
		endScene()
		runScene("DomCh1s1AgreeScene")
		return

	if(_action == "ask_avy"):
		setFlag("KaitModule.toldSaved", true)
		addMessage("You can now join Kait's team!")

	setState(_action)

func saveData():
	var data = .saveData()

	data["canJoinKait"] = canJoinKait

	return data

func loadData(data):
	.loadData(data)

	canJoinKait = SAVE.loadVar(data, "canJoinKait", false)
