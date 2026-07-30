extends RecruitTalkSceneBase

func _init():
	sceneID = "RahiRecTalk"

func _reactInit():
	allTopics = [
	[0, 1, 2, 3],
	[4, 5, 6, 7, 8, 9],
	[10],
	]

func _run():
	if(state == ""):
		addCharacter("rahi")
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcAction="sit"})
		saynn("You enter the cell where Rahi currently rests.")

		saynn("[say=pc]Gonna ask you some random things.[/say]")

		saynn("[say=rahi]Meow..[/say]")

		addButton("Continue", "See what happens next", "ask_next")
	if(state == "0"):
		saynn("[say=pc]Are you.. resisting?[/say]")

		saynn("Rahi blinks.")

		saynn("[say=rahi]Uh.. is she supposed to?[/say]")

		saynn("[say=pc]You're not allowed to leave currently. Does that make you want to escape?[/say]")

		saynn("[say=rahi]This is.. somewhat exciting. She doesn't see any reasons to escape..[/say]")

		saynn("[say=pc]But do you wish you had to resist?[/say]")

		saynn("[say=rahi]Well.. it depends really..[/say]")

		saynn("Right.")

		addRecButtons()
	if(state == "1"):
		saynn("[say=pc]Do you wanna escape this prison at all?[/say]")

		saynn("[say=rahi]She.. has been here for a while already.[/say]")

		saynn("[say=pc]Is that a no?[/say]")

		saynn("[say=rahi]Kitty just doesn't know how she would live normally now.. It's not like her old life was that good anyway.[/say]")

		saynn("[say=pc]Doesn't sound like you want to escape. Are you gonna try to sabotage our plan at some point?[/say]")

		saynn("[say=rahi]Sabotage?.. No.. as long as you promise to give her scritches.[/say]")

		saynn("Rahi offers you a cute little smile.")

		saynn("[say=pc]Sure, we should have enough hands for that.[/say]")

		saynn("[say=rahi]Come to think about it.. She does have some.. loose ends.. outside. Freedom sounds better than being stuck here forever..[/say]")

		addRecButtons()
	if(state == "2"):
		saynn("[say=pc]Do you prefer when people treat you with a lot of care?[/say]")

		saynn("[say=rahi]Who doesn't.. But there are different types of care..[/say]")

		saynn("[say=pc]Tell me more about that.[/say]")

		saynn("[say=rahi]What is there to tell.. some are gentle.. some are strict.. some are very mean..[/say]")

		saynn("[say=pc]Which one is your favourite?[/say]")

		saynn("[say=rahi]Well..[/say]")

		saynn("She stays quiet.")

		saynn("[say=pc]Yes?[/say]")

		saynn("[say=rahi]Uh.. you know..[/say]")

		saynn("She avoids the direct gaze now.")

		saynn("[say=pc]You like when people are strict with you?[/say]")

		saynn("Rahi swallows audibly, her chin low.")

		saynn("[say=rahi]Um.. heh.. uh..[/say]")

		saynn("[say=pc]Rahi? Use your words.[/say]")

		saynn("A blush spreads on her cheeks.")

		saynn("[say=rahi]Mm.. m-meow..[/say]")

		saynn("She will probably never admit it.")

		addRecButtons()
	if(state == "3"):
		saynn("[say=pc]What are your biggest kinks?[/say]")

		saynn("[say=rahi]Oh..[/say]")

		saynn("She stays quiet.")

		saynn("[say=pc]Why the oh?[/say]")

		saynn("[say=rahi]Kitty likes a lot of things.. This prison allowed her to see what she likes..[/say]")

		saynn("[say=pc]And so what would that be?[/say]")

		saynn("[say=rahi]Do you need.. the full list?..[/say]")

		saynn("She blinks and blushes when catching your confused gaze.")

		saynn("[say=pc]Is it that big?[/say]")

		saynn("[say=rahi]How much time do you have?..[/say]")

		saynn("Right.")

		saynn("[say=pc]Alright. What things you really didn't like then? That list must be short then, right?[/say]")

		saynn("Rahi rubs her snout.")

		saynn("[say=rahi]When people are mean for no reason.. Blood stuff?.. Uh.. Being tortured isn't really that fun.. unless it's really hot..[/say]")

		saynn("You sigh.")

		saynn("[say=rahi]S-sorry..[/say]")

		addRecButtons()
	if(state == "4"):
		saynn("[say=pc]Do you like sex?[/say]")

		saynn("Rahi lowers her gaze again.")

		saynn("[say=rahi]Sex?..[/say]")

		saynn("[say=pc]Yeah.[/say]")

		saynn("[say=rahi]What kind..[/say]")

		saynn("You're not sure how to answer.")

		saynn("[say=pc]Vanilla?[/say]")

		saynn("[say=rahi]Sure..[/say]")

		saynn("[say=pc]Uh.. anal?[/say]")

		saynn("Rahi's gaze darts around the room.")

		saynn("[say=rahi]..it's too painful usually.. you know.. when there is no preparation..[/say]")

		saynn("[say=pc]I see.[/say]")

		saynn("You think about it.")

		saynn("[say=pc]What's your favourite kind of sex then?[/say]")

		saynn("[say=rahi]It's.. hard to explain.[/say]")

		saynn("[say=pc]Can you try?[/say]")

		saynn("[say=rahi]You know.. when they're possessive?..[/say]")

		saynn("Right.")

		addRecButtons()
	if(state == "5"):
		saynn("[say=pc]Do you like petplay?[/say]")

		saynn("Her ears perk, her gaze collides with yours.")

		saynn("[say=rahi]Uh.. meow..[/say]")

		saynn("[say=pc]Sounds like a yes.[/say]")

		saynn("[say=rahi]..you can't prove that..[/say]")

		saynn("Her answer makes you raise a brow.")

		saynn("[say=pc]You literally call yourself kitty.[/say]")

		saynn("[say=rahi]So?..[/say]")

		saynn("You squint.. while Rahi blushes.")

		saynn("[say=pc]I guess we're never gonna do walkies then. Got it.[/say]")

		saynn("Rahi stays quiet.. her cheeks inflating with air slowly, her lips trembling.")

		saynn("[say=pc]Yes?[/say]")

		saynn("[say=rahi]She is.. open to experimentation..[/say]")

		saynn("Of course.")

		addRecButtons()
	if(state == "6"):
		saynn("[say=pc]Do you like pain?[/say]")

		saynn("[say=rahi]When others hit her? No.. The bruises stay for weeks..[/say]")

		saynn("[say=pc]I was talking about sexual pain.[/say]")

		saynn("She takes time to blink and gently hug herself.")

		saynn("[say=rahi]Most go way too far with it..[/say]")

		saynn("You nod.")

		addRecButtons()
	if(state == "7"):
		saynn("[say=pc]Would you consider yourself.. an exhibitionist?[/say]")

		saynn("[say=rahi]What would that mean exactly..[/say]")

		saynn("[say=pc]Do you like when strangers see you naked?[/say]")

		saynn("She scratches behind her head.")

		saynn("[say=rahi]This usually means she is in trouble..[/say]")

		saynn("[say=pc]Let's say it's all safe.[/say]")

		saynn("She shrugs.")

		saynn("[say=rahi]It can be.. thrilling. But she is.. you know.. shy..[/say]")

		saynn("[say=pc]I can tell.[/say]")

		saynn("[say=rahi]Hard to enjoy it.. when you're anxious.[/say]")

		addRecButtons()
	if(state == "8"):
		saynn("[say=pc]What can you say about bondage?[/say]")

		saynn("[say=rahi]A lot..[/say]")

		saynn("[say=pc]Pick something then.[/say]")

		saynn("[say=rahi]That moment.. when she is standing in complete darkness.. unable to even meow.. just forced to drool mindlessly..[/say]")

		saynn("She bites her lip.")

		saynn("[say=rahi]When her arms are forced behind her.. her legs are spread-open.. chains clanking each time she shivers.. or ropes digging into her fur..[/say]")

		saynn("Rahi rubs her legs together.")

		saynn("[say=rahi]When she is completely helpless.. at someone's mercy..[/say]")

		saynn("She swallows audibly.")

		saynn("[say=rahi]That's when she feels the most free.. somehow..[/say]")

		saynn("Right.")

		addRecButtons()
	if(state == "9"):
		saynn("[say=pc]Anal?[/say]")

		saynn("[say=rahi]Anal?..[/say]")

		saynn("[say=pc]Yes.[/say]")

		saynn("[say=rahi]..no..[/say]")

		saynn("[say=pc]Why not?[/say]")

		saynn("[say=rahi]Pain?..[/say]")

		saynn("[say=pc]But if you use lube and other preparations, it won't be painful.[/say]")

		saynn("[say=rahi]Yeah but nobody uses lube.. One person.. and now you gotta go to the doctor..[/say]")

		saynn("Fair enough.")

		addRecButtons()
	if(state == "10"):
		saynn("[say=pc]Were you always this kinky?[/say]")

		saynn("[say=rahi]Meow?..[/say]")

		saynn("[say=pc]You're a shy kitty. You seem to have some limits, sure. But you also seem to have a lot of experience.[/say]")

		saynn("[say=rahi]It's the prison.. You learn what you like and dislike.. whenever you like it or not..[/say]")

		saynn("Somehow that sentence made sense.")

		addRecButtons()

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "ask_next"):
		do_ask_next()
		return

	setState(_action)
