extends SceneBase

var deserved = true

func _init():
	sceneID = "rahiRewardExhibitionismScene"

func _initScene(_args = []):
	if(_args.size() > 0):
		deserved = _args[0]

func _run():
	if(state == ""):
		addCharacter("rahi")
		saynn("Exhibitionism can be a very rewarding activity, depending on how confident your kitty is in herself and her body.")

		saynn("What do you wanna do?")

		var exLevel = getModule("RahiModule").getSkillScore("rahiSkillExhibit")
		if (exLevel <= 0):
			addButton("Stripping", "Make Rahi to strip for a reward", "stripping1")
		##elif (exLevel <= 2):
		else:
			addButton("Stripping", "Make Rahi to strip for a reward", "stripping2")
	if(state == "stripping1"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcBodyState={naked=true}})
		saynn("Since Rahi has absolutely zero skill in exhibitionism you decide to go very easy on her today.")

		saynn("You sit in a chair and relax. Rahi stands nervously in her cell, her paws by her sides. She watches you with her big kitty eyes.")

		saynn("[say=pc]I will reward you. But I want you to strip for me first, kitty. Just casually.[/say]")

		saynn("Your voice is low and commanding. Rahi's inexperience shines through as she gets all blushy and small, her tail coiling around her leg, her eyes looking at the floor.")

		saynn("You really want her to try to do it herself, without your help. So you find a bag of treats and hold it in her view. It seems to be some kind of candy.")

		saynn("[say=pc]I will give you one for each clothing piece.. or action.[/say]")

		saynn("You eat one and catch Rahi's jealous eyes, her lips trembling.")

		saynn("Finally, after some time, she reaches up to the collar of her inmate shirt and begins to slowly undo the buttons one by one. Usually undressing is just a part of intercourse but today it's the main focus. Rahi mewls softly as she reveals more and more of her fur-covered body, your intense stare causes her heart to race with a mixture of fear and excitement.")

		saynn("Eventually Rahi unbuttons her shirt.. revealing her beautiful belly.. but the cloth still hides her breasts. You throw your kitty a treat and she happily noms it, her tail unwinds and begins to flick eagerly.")

		saynn("[say=pc]Shorts too.[/say]")

		saynn("Rahi hesitates for a moment, there is a reinforced window in the cell behind which there is a big general block wing. It's tinted slightly.. but who knows. You grab another treat from the bag and eat it.. tastes so good. And then another. Rahi pouts and starts slowly pulling her shorts down, revealing her fluffy crotch and thighs. She keeps her legs closed but you do get a glimpse of her little pink clit which makes you smile. Your kitty, noticing your gaze, quickly covers her private bits.")

		saynn("[say=pc]Good girl.[/say]")

		saynn("You throw another treat at her and she masterfully catches it with her free paw before nomming her reward.")

		saynn("[say=pc]Now take off the shirt fully.[/say]")

		saynn("Rahi blinks many times. She is hesitating yet again. She ate enough treats to be satisfied and doesn't really need any more of them. But.. She went so far.. being basically naked in front of you by now.")

		saynn("In the end, she decides to obey, slowly pulling off the shirt off her shoulders with her free paw. As the shirt falls onto the floor, Rahi instantly covers her {rahi.breasts} from you. Her other paw is still on her crotch.")

		saynn("[say=pc]Excellent. I love how your body looks, kitty. Thank you.[/say]")

		saynn("Rahi smiles, standing before you, naked but not really exposed. It seems it will take some time to make Rahi get used to casual nudity.")

		saynn("Ah, right, you almost forgot to give Rahi the last treat. As you toss the candy at her, kitty reaches her paws out for it. But then she suddenly realizes her mistake and gets extremely embarrassed while you are enjoying the view of her perky tits and cute tight pussy. The candy hits Rahi's snout, making her confused and causing her to flop onto the floor with a loud meow.")

		saynn("[say=rahi]Meeeeeow!..[/say]")

		saynn("You can't help but to chuckle. You get up and come closer to Rahi before giving her some pats.")

		addButton("Continue", "That was cute", "endthescene")
	if(state == "stripping2"):
		playAnimation(StageScene.Duo, "sit", {npc="rahi", npcBodyState={naked=true}})
		saynn("Rahi has.. some experience in exhibitionism. But still not enough to pull her out into the public.")

		saynn("You sit in a chair and relax. Rahi stands a few meters away from you, looking shy, her paws stroking her tail. She watches you with her big kitty eyes.")

		saynn("[say=pc]I want you to strip for me first, kitty. Just because why not.[/say]")

		saynn("You pull out a bag of treats that you have stored just for this occasion. It seems to have random candies in it.")

		saynn("[say=pc]I will give you one for each clothing piece. Or just for obeying.[/say]")

		saynn("Rahi blushes, her heart probably beating faster from all the thoughts in her head. Still, she kinda wanted those treats. She straightens her posture and then begins to remove her inmate uniform, starting with the shirt, slowly undoing each button. You nod as Rahi exposes the fur of her belly for you. Still, you're not giving her the candy just yet..")

		saynn("[say=rahi]Meow..[/say]")

		saynn("She understands what she needs to do. Her eyes get directed towards the floor as she slides the shirt off her shoulders, allowing it to fall and reveal her beautiful perky breasts. You whistle in appreciation, making kitty blush harder. She makes her best attempt at not covering up but your stare makes her do it in the end, hiding the nipples with her arm.")

		saynn("Still, you do toss her a treat. Rahi catches it with her free paw and happily noms it, purring from how sweet it is.")

		saynn("[say=pc]Keep going, kitty.[/say]")

		saynn("Rahi blinks and looks down at the shorts that she is still wearing. She begins to awkwardly try to pull them off with one paw but that goes about as well as expected. At some point she forgets and uses her other arm too, exposing her cute breasts without even realizing it.")

		saynn("After some more time, she finally pulls her shorts down, revealing her cute mound that houses the tight pink slit with a sensitive bean above it. You can tell that Rahi feels exposed and vulnerable.. but also a tiny bit aroused. You toss her another treat. Your kitty noms it but then quickly covers herself with her paws.")

		saynn("[say=pc]You look beautiful, kitty. I will give you another one if you.. play with yourself.[/say]")

		saynn("[say=rahi]Meow.. play?.. Play how..[/say]")

		saynn("You shrug.")

		saynn("[say=pc]Any way you want.[/say]")

		saynn("Kitty stares at the tinted reinforced window behind you that still passes enough light to be able to see inmates walking past.")

		saynn("Rahi deliberates for a bit, not even looking at your bag of treats, she ate enough of those. Eventually she lowers her paws, exposing her bits yet again. But this time she also begins to slowly turn around, showing off her back to you. Kitty is wiggling her butt and stroking her buttcheeks while looking at you over the shoulder, her tail teasingly hiding her slit and the tailhole.")

		saynn("[say=rahi]Is that good?..[/say]")

		saynn("You can't help but to smile. Rahi smiles back.")

		saynn("[say=pc]Yes, it's perfect.[/say]")

		saynn("You hold the treat out on your hand. Rahi turns around again and slowly walks up to you, grabbing it.")

		saynn("[say=rahi]Thank you, {rahiMaster}..[/say]")

		saynn("Your hands land on her thighs and gently caress them while your kitty is enjoying her last treat. She is one step closer to becoming confident.")

		addButton("Continue", "That was nice", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "stripping1"):
		processTime(25*60)
		getModule("RahiModule").advanceSkill("rahiSkillExhibit")

	if(_action == "stripping2"):
		processTime(25*60)
		getModule("RahiModule").advanceSkill("rahiSkillExhibit")

	setState(_action)

func saveData():
	var data = .saveData()

	data["deserved"] = deserved

	return data

func loadData(data):
	.loadData(data)

	deserved = SAVE.loadVar(data, "deserved", true)
