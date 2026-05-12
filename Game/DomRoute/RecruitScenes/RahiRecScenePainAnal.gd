extends RecruitSceneBase

var gentle = false
var mean = false

func _init():
	sceneID = "RahiRecScenePainAnal"

func _run():
	if(state == ""):
		addCharacter("rahi")
		gentle = (c1 == 0)
		mean = (c1 == 2)
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true, leashedBy="pc"}})
		aimCameraAndSetLocName("hideout_breakroom")
		saynn("You will need some things for what you are about to do. You ask Kait and Ans.. and luckily they have it! Perks of having a team.")

		saynn("After that, you enter Rahi's cell and grab her leash before bringing her closer to the middle of the cell.")

		saynn("[say=pc]"+str(ch1("Our team only needs brave people. I'm going to test your pain tolerance. Trust me, okay?", "Our team only needs brave people. So I'm gonna test how well you handle pain. Understand?", "Our team has no place for cowards. I'm gonna test how well you handle pain. Understand?"))+"[/say]")

		saynn("Rahi blinks and then swallows audibly.")

		saynn("[say=rahi]She.. she is not sure..[/say]")

		saynn("[say=pc]"+str(ch1("I won't do anything that you can't handle. I will be gentle. Now, let's get those clothes off..", "You will have to trust me, kitty cat. Now, clothes off.", "Too bad. You don't get a choice. Strip. Everything. Or I'll tear them off myself."))+"[/say]")

		saynn("You watch as her paws begin to unbutton her shirt. She reveals her perky chest to you, her nips catching the slight cold breeze. Her shorts are next, she uses her claws to catch the waistband and tug down on it, revealing her cute little pink slit.")

		saynn("Rahi stands still as you begin to circle her slowly, your digits tracing her waist, her spine, her shoulders.. before reaching down to cup her rear, fingers brushing against her anal entrance. Rahi gasps, her back arching.")

		saynn("[say=rahi]Ah.. m-meow..[/say]")

		saynn("Next, you reveal the main item that you have got.. a curve metal anal hook! It has a polished metal surface that is cold to a touch.. with a small sphere-shaped tip at one end and a rope at the other.")

		saynn("[say=pc]"+str(ch1("Looks fun, doesn't it? I really wanna see it inside you.", "This is gonna be fun, kitty. Trust me.", "This is gonna go up your butt. I hope you're excited, slut."))+"[/say]")

		saynn("Rahi eyes the hook nervously, her tail curling tight around her thigh.")

		addButton("Continue", "See what happens next", "prepare_anal")
	if(state == "prepare_anal"):
		saynn("You begin by coating the end of the hook with lube, your fingers working the slick gel over it. Rahi watches, her breathing quickening.")

		saynn("Then you get behind her. One hand parts her cheeks, exposing her tight pink tailhole. The other presses the rounded tip of the hook against her entrance.")

		saynn("[say=rahi]Nnh..![/say]")

		saynn("Slowly, gently at first, you push. The hook sinks into her, inch by inch. Her body resists, inner walls clenching around the intruding object.. but you manage to work it in deeper. She whines quietly as the hook slides deeper.. until it finds the curve of her butt.")

		saynn("[say=rahi]Hh.. hh.. f-full..[/say]")

		saynn("You give the hook a soft upward tug, causing it to shift inside her, pulling the feline up to her tippy toes, a loud whine escaping her.")

		saynn("[say=pc]"+str(ch1("Don't be so sad, it will feel good, I'm sure.. Now for the rest.", "See? That wasn't so hard. Now for the rest.", "Don't be so sad, it will get much more painful soon."))+"[/say]")

		addButton("Continue", "See what happens next", "hogtied")
	if(state == "hogtied"):
		playAnimation(StageScene.Hogtied, "idle", {pc="rahi", npc="pc", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You need Rahi laying on her belly.. so you help her to get down.")

		saynn("You're still holding the hook inside her. But now you take the rope that's connected to it and tie it into a knot around Rahi's ponytail!")

		saynn("When you pull on the hook, Rahi throws her head back, her spine arching deep. You tighten the rope to be at this length now.")

		saynn("[say=rahi]Ah!..[/say]")

		saynn("With this, Rahi can't straighten her back anymore, the hook pulling on her hair when she tries, making her hiss and wince. At the same time, the hook shifts inside her butt too.")

		saynn("[say=rahi]That's.. ah.. painful..[/say]")

		saynn("[say=pc]"+str(ch1("Let me know if this is too much.", "Such a helpless kitty. Try to endure it.", "Such a helpless toy. I'm not done yet."))+"[/say]")

		saynn("You bring Rahi's paws behind her back and use a different rope to tie her wrists and ankles together around her tail. Now Rahi is truly helpless, hogtied and anal-hooked.")

		saynn("[say=rahi]T-this.. m-might be too much.. ow.. ah.. Ow![/say]")

		saynn("You raise your hand and bring it down firmly on her right cheek. The crack echoes off the cell walls.")

		saynn("The impact jolts through her entire body. Her muscles clench.. including the ones around the hook. The metal shifts inside her, pressing against her walls. At the same time, the rope on her ponytail yanks her head back further.")

		saynn("[say=rahi]Ahh-h.. nhh-..[/say]")

		saynn("You spank her again. Left cheek this time. Another clench. Another shift of the hook. Rahi hisses and whines into the air, her tongue out and drooling already.")

		saynn("You keep going, making her rear glow red. Each smack makes her squirm.. and each squirm makes it worse for her. Between her legs, despite the pain, some arousal begins to build up. Her neglected pussy is making the concrete wet.")

		saynn("[say=rahi]Nnhhg.. hh.. p-pain..[/say]")

		saynn("You pause and inspect her. A gentle tug on the rope makes her whole body go rigid. Another tug makes her whimper.")

		saynn("[say=pc]"+str(ch1("You're doing so well. Just a little more.", "Feel that? That's the hook reminding you who owns this hole.", "I can lift you by the hook. Want me to try?"))+"[/say]")

		saynn("Rahi shakes her head frantically. Lonely tears begin to streak her cheeks. She is clearly at her limit.")

		saynn("Right.. you gotta stop now.")

		addButton("Untie", "Enough fun for now", "untie_rahi_anal")
	if(state == "untie_rahi_anal"):
		playAnimation(StageScene.Cuddling, "idle", {pc="pc", npc="rahi", npcBodyState={naked=true}})
		saynn("First, you untie the ponytail rope. Rahi's head instantly slumps forward with a gasp of relief. Then you release her wrists and her ankles too. She flops onto the floor, the hook still inside her butt.")

		saynn("You gently, you take hold of it and slowly pull on it. The curved metal begins to slide out of her, inch by inch. She whimpers more, her tailhole clenching around it.. until the round sphere finally emerges.")

		saynn("The hook lands on the floor with a soft clink, Rahi's tailhole pulsing visibly.")

		saynn("[say=rahi]S-she.. hh.. t-that was.. ow.. p-painful..[/say]")

		saynn("You grab Rahi and pull her close.")

		saynn("[say=pc]"+str(ch1("Sorry, kitty. I had to test your endurance.", "You did pretty good, kitty. Very good.", "You'll learn to love it. You just need more practice."))+"[/say]")

		saynn("You rub her back.. while she tries to relax in your arms. A little massage seems to take off most of the tension.")

		saynn("[say=rahi]That.. was too much.. the whole thing..[/say]")

		saynn("Looks like she is not a fan of this.. at all.")

		saynn("You cuddle Rahi for a while longer.. before leaving her be, stepping out of the cell to see what Kait thinks.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "prepare_anal"):
		processTime(5*60)

	if(_action == "hogtied"):
		processTime(5*60)

	if(_action == "untie_rahi_anal"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["gentle"] = gentle
	data["mean"] = mean

	return data

func loadData(data):
	.loadData(data)

	gentle = SAVE.loadVar(data, "gentle", false)
	mean = SAVE.loadVar(data, "mean", false)
