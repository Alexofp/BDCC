extends SceneBase

var isNaked = false
var isCaged = false
var corruption = 0.0
var isSlut = false
var isVerySlut = false
var isLusty = false
var nakedAndShy = false

func _init():
	sceneID = "articaEventDildo2Scene"

func _run():
	if(state == ""):
		addCharacter("artica")
		isNaked = getFlag("ArticaModule.NoClothes", false)
		isCaged = getCharacter("artica").isWearingChastityCage()
		corruption = getModule("ArticaModule").getCorruption()
		isSlut = getModule("ArticaModule").isSlut()
		isVerySlut = getModule("ArticaModule").isVerySlut()
		isLusty = getModule("ArticaModule").isLusty()
		nakedAndShy = (isNaked && !isSlut)
		playAnimation(StageScene.Solo, "walk", {pc="artica"})
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		saynn("Artica, excited about something, rushes towards her cell, her hind paws hitting the floor with cute pit-pat sounds.")

		saynn("But when she steps in, her excitement quickly fades, replaced with disappointment.")

		saynn("She looks around and finds a note.. She quickly reads it and gasps before quickly heading off somewhere else"+str(", making sure her paws are covering her private bits." if nakedAndShy else "")+".")

		addButton("Note", "Take a look at it", "read_note")
	if(state == "read_note"):
		playAnimation(StageScene.Solo, "stand")
		saynn("You wait for Artica to leave and step into her cell. You grab the note that she left on her pillow and read it..")

		saynn("It's clearly from Socket.")

		saynn("[say=socket]Heya! I finished 3D printing the piece but no one seems to want to deliver it. I wrapped it up and everything, very discrete. I would do it myself but I don't know where your cell is, sorry! I left it in the workshop, under one of the benches. No one will find it I'm sure.[/say]")

		saynn("Makes you wonder how this note got here then..")

		addButton("Workshop", "Head over there", "in_workshop")
	if(state == "in_workshop"):
		playAnimation(StageScene.CanineDildoSex, "tease", {pc="artica", bodyState={hard=true}})
		aimCameraAndSetLocName("eng_workshop")
		saynn("As you step into the workshop, you see Artica's blushing face, her eyes wide.")

		saynn("She is staring at a package.. her package. It was indeed all wrapped up.. but it was soft wrapping, the shape was unmistakable. Obviously something also went wrong with the printing because its size is way bigger than Artica asked for, the thing is at least twice the size of her member..")

		saynn("For some reason, this sight makes you smile. Artica is blinking a lot, "+str("her shorts bulging heavily" if !isNaked else "her real cock throbbing eagerly")+"..")

		saynn("With a deep breath, she picks up the package, trying to act as nonchalant as possible.. but clearly failing. No pockets big enough to store this monster.. she holds it behind her back, her fluffy tail wrapped around it to conceal it as best as possible.")

		addButton("Continue", "See what happens next", "artica_walks_with_dildo")
	if(state == "artica_walks_with_dildo"):
		playAnimation(StageScene.Solo, "walk", {pc="artica", bodyState={hard=true}})
		aimCameraAndSetLocName("mining_nearentrance")
		saynn("The corridors feel longer than usual, each Artica's step accompanied by the fear of getting spotted.")

		saynn("She tries to take the least crowded route.. but she obviously can't avoid the elevator. She presses the button to call it with her hind paw, her hands busy holding the heavy thing behind her..")

		saynn("Artica freezes when a couple of inmates walk by, their conversation stops when they glance at her. The fluff's heart is pounding in her chest as she forces a smile.")

		saynn("They give her a few curious gazes.. but eventually decide to head towards the mine shafts, letting Artica exhale audibly.")

		saynn("The doors of the elevator finally open..")

		saynn("[say=risha]Oh, it's you.[/say]")

		saynn("[say=artica]Eep..[/say]")

		addButton("Continue", "See what happens next", "risha_meets_artica")
	if(state == "risha_meets_artica"):
		addCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {pc="artica", npc="risha", bodyState={hard=true}})
		saynn("The mean guard steps out of the elevator, coming face-to-face with Artica.")

		if (isNaked):
			saynn("[say=risha]The slut is getting used to staying naked, huh."+str(" And carrying someone's cubs too, such a breeding whore." if getCharacter("artica").isVisiblyPregnant() else "")+"[/say]")

		else:
			saynn("[say=risha]Surprised you're still not forced to be naked, huh."+str(" At least someone has knocked you up." if getCharacter("artica").isVisiblyPregnant() else "")+"[/say]")

		saynn("[say=artica].. ..[/say]")

		saynn("Risha's eyes narrow as she inspects Artica up and down, feeling that something is off..")

		saynn("[say=risha]What's that you're hiding, slut?[/say]")

		saynn("Artica's mind is racing. Who knows what will happen to her toy if it will be discovered by that asshole guard..")

		saynn("[say=artica].. .. ..[/say]")

		saynn("Risha's skeptical gaze stays on.")

		saynn("[say=risha]Really? Your tail got tangled? Let me see, I know how to bend and unbend anything.[/say]")

		saynn("Desperation was pumping through Artica's veins..")

		addButton("Continue", "See what happens next", "artica_gets_on_her_knees")
	if(state == "artica_gets_on_her_knees"):
		playAnimation(StageScene.Duo, "kneel", {pc="artica", npc="risha", bodyState={hard=true}})
		saynn("Summoning all her courage, Artica does the only thing she could think of. She drops to her knees and lowers her head, assuming a position of total submission.. but with her paws still behind her back.")

		saynn("[say=artica].. .. ..[/say]")

		saynn("[say=risha]Why would I care if you had a hard day in the mineshaft. I'm glad that you're not being useless though.[/say]")

		saynn("Artica puts on her big puppy eyes.")

		saynn("[say=artica].. .. ..? ..[/say]")

		saynn("Risha raises an eyebrow, clearly enjoying the sight of Artica humiliating herself.")

		saynn("[say=risha]Anything, you say?[/say]")

		saynn("The fluff's cheeks blush as she feels a mix of shame and determination.. before nodding.")

		saynn("Risha smirks.")

		saynn("[say=risha]Hands against the wall, slut. Spread your legs too, you don't want barbs scratching you too much.[/say]")

		saynn("Artica's heart sank, her attempts to save her butt didn't work. Seems like she needs some help. You notice that the elevator doors are still open..")

		addButton("Yoink Artica", "Help her to get out of this situation", "help_artica_unstuck_risha")
	if(state == "help_artica_unstuck_risha"):
		removeCharacter("risha")
		playAnimation(StageScene.Duo, "stand", {npc="artica"})
		saynn("Casually, you walk past the two, stopping for a second.")

		saynn("[say=pc]Hey there.[/say]")

		saynn("Risha's mean eyes follow you, her hand reaching for her weapon.")

		saynn("[say=risha]Mind your own business, inmate.[/say]")

		saynn("Artica's big eyes stare at you. You give her a subtle wink.")

		saynn("[say=pc]Mhm. I do, I do.[/say]")

		saynn("Seeing Risha's weapon, you pretend that you're scared..  You step into the elevator.. and press the button that corresponds to the cellblock floor.")

		saynn("[say=artica]Wai-..[/say]")

		saynn("But before the doors close, you suddenly reach your hand out and grab Artica's collar.. before yanking her into the elevator.")

		saynn("You only hear..")

		saynn("[say=risha]What a bitch..[/say]")

		saynn("..before the doors finally break your eye contact. The metal room starts moving up with an annoying screech.")

		saynn("Artica is panting heavily, still holding something behind her.")

		saynn("[say=pc]How are you?[/say]")

		saynn("[say=artica]Y-yeah.. I'm okay.. t-thank you![/say]")

		saynn("[say=pc]Need any help?[/say]")

		saynn("You lean a bit, teasingly trying to see what Artica is holding. But she turns away.")

		saynn("[say=artica]Not really.. I'm good I think..[/say]")

		saynn("Your smug smile makes her blush. Better not to embarrass the poor fluff any more, she deserves to have some fun too.")

		saynn("[say=pc]Fine, keep your secrets.[/say]")

		saynn("The doors open.. Artica rushes off.")

		addButton("Follow", "See what she will do", "artica_in_cellblock_oops")
	if(state == "artica_in_cellblock_oops"):
		aimCameraAndSetLocName("cellblock_nearcells")
		playAnimation(StageScene.Solo, "jog", {pc="artica"})
		saynn("Trying to avoid too many gazes, Artica runs down the corridor, her cheeks blush from embarrassment.. and excitement. She holds the wrapped package tightly, the tail wrapped around it, concealing it mostly.")

		saynn("She sees the lilac block, probably already imagining how much fun she is gonna have..")

		saynn("But then..")

		addButton("Continue", "See what happens next", "artica_trips")
	if(state == "artica_trips"):
		playAnimation(StageScene.Solo, "defeat", {pc="artica"})
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		saynn("..in her haste, she trips.")

		saynn("[say=artica]EE-eek![/say]")

		saynn("As Artica sprawls all over the floor, the package slips from her hands, skidding across the floor before coming to a stop in the middle of the lilac cellblock..")

		saynn("Poor fluff is not having the best day, huh. As she scrambles to her feet, she realizes that it was too late, other lilacs already noticed the strange new object..")

		addButton("Continue", "See what happens next", "lilacs_near_dildo")
	if(state == "lilacs_near_dildo"):
		playAnimation(StageScene.Solo, "stand", {pc="artica"})
		saynn("A crowd quickly gathers around the package, their eyes widening as they realize what it was.")

		saynn("[sayMale]What's this?[/sayMale]")

		saynn("[sayFemale]Looks like a giant dildo![/sayFemale]")

		saynn("Whispers and giggles fill the air. More and more lilacs surround the object like it's some kind of art piece..")

		saynn("[sayMale]Who does it belong to?[/sayMale]")

		saynn("Artica desperately tries to push her way through the crowd to reclaim her toy.. but she is quickly met with resistance from stronger folks.")

		saynn("[say=artica]..eek.. c-can I..[/say]")

		saynn("[sayFemale]I saw it first, it's mine![/sayFemale]")

		saynn("[sayMale]Nu huh. Fuck off. I'm taking it for myself![/sayMale]")

		saynn("[sayFemale]Fuck you, give me![/sayFemale]")

		saynn("The crowd seems to want to fight for that dildo, every lilac seemingly wanting to have it. Artica's heart sinks, any hope seems to be disappearing fast as she has no chance of beating anyone.. let alone everyone. So much effort to get that toy.. just to lose it..")

		addButton("Continue", "See what happens next", "a_solution")
	if(state == "a_solution"):
		saynn("Lilacs begin kicking each other, pulling on each other's hair, biting ankles.. until a loud voice stops them.")

		saynn("[sayMale]Wait! Wait! Stop fighting! How about this, I know how we can handle this! A challenge for the brave ones![/sayMale]")

		saynn("The crowd gives the random lilac a benefit on the doubt.")

		saynn("[sayMale]Listen, the dildo has a giant knot. Let's say.. whoever can get knotted by it.. deserves to keep it![/sayMale]")

		saynn("There is a murmur of agreement happening between the lilacs. It seems.. The crowd was filled with like-minded sluts, all eager for a good challenge. Artica looks.. hopeful again.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "read_note"):
		processTime(3*60)

	if(_action == "in_workshop"):
		processTime(10*60)

	if(_action == "artica_walks_with_dildo"):
		processTime(5*60)

	if(_action == "risha_meets_artica"):
		processTime(3*60)

	if(_action == "artica_gets_on_her_knees"):
		processTime(2*60)

	if(_action == "help_artica_unstuck_risha"):
		processTime(3*60)

	if(_action == "artica_in_cellblock_oops"):
		processTime(5*60)

	if(_action == "artica_trips"):
		processTime(60)

	if(_action == "lilacs_near_dildo"):
		processTime(5*60)

	if(_action == "a_solution"):
		processTime(2*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["isNaked"] = isNaked
	data["isCaged"] = isCaged
	data["corruption"] = corruption
	data["isSlut"] = isSlut
	data["isVerySlut"] = isVerySlut
	data["isLusty"] = isLusty
	data["nakedAndShy"] = nakedAndShy

	return data

func loadData(data):
	.loadData(data)

	isNaked = SAVE.loadVar(data, "isNaked", false)
	isCaged = SAVE.loadVar(data, "isCaged", false)
	corruption = SAVE.loadVar(data, "corruption", 0.0)
	isSlut = SAVE.loadVar(data, "isSlut", false)
	isVerySlut = SAVE.loadVar(data, "isVerySlut", false)
	isLusty = SAVE.loadVar(data, "isLusty", false)
	nakedAndShy = SAVE.loadVar(data, "nakedAndShy", false)
