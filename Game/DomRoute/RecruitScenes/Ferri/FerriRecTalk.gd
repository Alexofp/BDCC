extends RecruitTalkSceneBase

func _init():
	sceneID = "FerriRecTalk"

func _reactInit():
	allTopics = [
	[0, 1, 2, 3],
	[4, 5, 6, 7, 8, 9],
	[10],
	]

func _run():
	if(state == ""):
		addCharacter("ferri", ["naked"])
		playAnimation(StageScene.Duo, "sit", {npc="ferri", npcBodyState={naked=true}})
		saynn("You enter the cell where Ferri currently rests. You let her stand while you take a seat. She is still naked, cuffed, muzzled and leashed to the pipe.")

		saynn("[say=pc]Gonna ask you some random things.[/say]")

		saynn("[say=ferri]Mew? Like what?[/say]")

		addButton("Continue", "See what happens next", "ask_next")
	if(state == "0"):
		saynn("[say=pc]We might be trying to escape this prison. Or capture it. How do you feel about that?[/say]")

		saynn("[say=ferri]About time! I wanna bite the captain, make him squirm real good~.[/say]")

		saynn("[say=pc]So you would help us?[/say]")

		saynn("[say=ferri]The way you're currently treating me.. I'm not so sure.. mow..[/say]")

		addRecButtons()
	if(state == "1"):
		saynn("[say=pc]How do you feel about people telling you exactly what to do?[/say]")

		saynn("[say=ferri]I bite them![/say]")

		saynn("[say=pc]Elaborate.[/say]")

		saynn("[say=ferri]If they reach their hand out, I bite their hand. If they're foolish enough to come very close, I bite their shoulder. If I'm kneeling, I can bite their ankles too~.[/say]")

		saynn("[say=pc]What if you can't bite?[/say]")

		saynn("She shrugs.")

		saynn("[say=ferri]Then.. dunno.. mew.[/say]")

		addRecButtons()
	if(state == "2"):
		saynn("[say=pc]Do you like bondage gear?[/say]")

		saynn("[say=ferri]Who told you that?[/say]")

		saynn("[say=pc]You don't seem to be trying to resist it.[/say]")

		saynn("[say=ferri]I'm saving my strength! And no, I don't have a giant pile of bdsm gear stashed in my cell..[/say]")

		saynn("Right.")

		addRecButtons()
	if(state == "3"):
		saynn("[say=pc]Be honest. Do you like being hurt?[/say]")

		saynn("[say=ferri]You mean the kind where guards beat me up until I can't stand? No. That's just mean and stupid.[/say]")

		saynn("[say=pc]What about the other kind?[/say]")

		saynn("She looks away for a second.")

		saynn("[say=ferri]Of course not, obviously. Do I look like a masochist slut?! Mew.[/say]")

		addRecButtons()
	if(state == "4"):
		saynn("[say=pc]A dragon and a cat. Interesting combination.[/say]")

		saynn("[say=ferri]Not just any cat.. a sabretooth cat![/say]")

		saynn("Makes sense. There is certainly some lynx in there too maybe, judging from the ear tassels.")

		saynn("[say=ferri]But yes, I've been unlucky enough to be born as a hybrid.[/say]")

		saynn("[say=pc]Why is that bad?[/say]")

		saynn("[say=ferri]My genes are all screwed up. Mow.[/say]")

		addRecButtons()
	if(state == "5"):
		saynn("[say=pc]Do you like sex?[/say]")

		saynn("Ferri laughs.")

		saynn("[say=ferri]I'm a red, I like biting people![/say]")

		saynn("[say=pc]You can bite someone during sex.[/say]")

		saynn("[say=ferri]Tried it a few times, they all just kept screaming. Maybe I shouldn't have done it during oral. Mew.[/say]")

		addRecButtons()
	if(state == "6"):
		saynn("[say=pc]What about milking?[/say]")

		saynn("Ferri's breath catches. Just for a second.")

		saynn("[say=ferri]..what about it?[/say]")

		saynn("[say=pc]Do you like it?[/say]")

		saynn("[say=ferri]..mmm.. it's very.. exhausting.[/say]")

		saynn("[say=pc]But do you like it?[/say]")

		saynn("[say=ferri]Makes your head empty.. no thoughts.. just milking.. mew.[/say]")

		saynn("[say=pc]Is that a yes?[/say]")

		saynn("[say=ferri]Why are you asking?[/say]")

		saynn("[say=pc]Reasons.[/say]")

		saynn("[say=ferri]Pff. Next question then.[/say]")

		addRecButtons()
	if(state == "7"):
		saynn("[say=pc]You worked with chemicals? Explosives?[/say]")

		saynn("[say=ferri]How do you know that?[/say]")

		saynn("[say=pc]I'm asking questions here.[/say]")

		saynn("[say=ferri]Are you?[/say]")

		saynn("[say=pc]Yes.[/say]")

		saynn("[say=ferri]You're cute.[/say]")

		saynn("[say=pc]Answer the question.[/say]")

		saynn("[say=ferri]Why?[/say]")

		saynn("[say=pc]Because otherwise you're not gonna walk out of here.[/say]")

		saynn("[say=ferri]You're gonna kill me?![/say]")

		saynn("[say=pc]No.[/say]")

		saynn("[say=ferri]Phew. I knew that you're too soft for that.[/say]")

		saynn("[say=pc]Try me.[/say]")

		saynn("[say=ferri]Take off my muzzle then~.[/say]")

		saynn("[say=pc]No.[/say]")

		saynn("[say=ferri]Soft~.[/say]")

		addRecButtons()
	if(state == "8"):
		saynn("[say=pc]If I call you a worthless bitch, what would be your first reaction?[/say]")

		saynn("[say=ferri]To bite the living heck out of you![/say]")

		saynn("You take a short pause.")

		saynn("[say=pc]You're a worthless bitch, Ferri.[/say]")

		saynn("She gasps softly, her lips twitch.")

		saynn("[say=ferri]..don't say that.[/say]")

		saynn("[say=pc]You're a stupid worthless brat.[/say]")

		saynn("[say=ferri]Why are you saying that? I'm not.. most of those things I'm not.. mow..[/say]")

		saynn("[say=pc]I'm testing your reaction.[/say]")

		saynn("[say=ferri]Fuck your testing.. mow..[/say]")

		saynn("[say=pc]Relax, I didn't mean any of it.[/say]")

		saynn("[say=ferri]Anyone can be an asshole. Bitch this, slut that, worthless you..[/say]")

		addRecButtons()
	if(state == "9"):
		saynn("[say=pc]Do you like being treated like a puppy? Collars, leashes, tricks.[/say]")

		saynn("[say=ferri]You mean like they already treat us in this shithole? Throw in muzzles and chains into that mix.[/say]")

		saynn("[say=pc]I mean voluntarily. With someone you trust.[/say]")

		saynn("She is quiet for a long moment.")

		saynn("[say=ferri]I'm not anyone's pet.[/say]")

		saynn("[say=pc]Not what I asked.[/say]")

		saynn("[say=ferri]Leave the 'eating cum out of a bowl' part out and I might just agree. And I'm also gonna bite you hard if you try to play fetch with me.[/say]")

		addRecButtons()
	if(state == "10"):
		saynn("[say=pc]Do you like orgasming?[/say]")

		saynn("Ferri raises a brow.")

		saynn("[say=ferri]Sure?[/say]")

		saynn("[say=pc]I mean like.. a lot.[/say]")

		saynn("[say=ferri]You're gonna use that against me? Make me cum until my brain shuts off? Until my pussy can't squirt anymore? Until all my thoughts are replaced with a constant supply of dopamine?[/say]")

		saynn("[say=pc]Right.[/say]")

		saynn("[say=ferri]Mrowrl. I'm not answering it.[/say]")

		saynn("[say=pc]What about the opposite? Does getting denied constantly sound hot to you?[/say]")

		saynn("[say=ferri]You're totally gonna use it against me, huff.[/say]")

		saynn("[say=pc]Answer the question.[/say]")

		saynn("[say=ferri]Make me![/say]")

		saynn("What a brat.")

		addRecButtons()

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ask_next"):
		do_ask_next()
		return

	setState(_action)
