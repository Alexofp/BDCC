extends SceneBase

var creditsPaid = 0
var creditsPaidStr = ""

func _init():
	sceneID = "PSElizaTentaclesBorn"

func _reactInit():
	creditsPaid = getModule("ElizaModule").getTentaclesCost()
	creditsPaidStr = str(creditsPaid)+" credit"+("s" if creditsPaid != 1 else "")

func _run():
	if(state == ""):
		addCharacter("eliza")
		saynn("You hand Eliza a credits chip with "+str(creditsPaidStr)+".")

		saynn("[say=pc]Should be enough?[/say]")

		saynn("The feline's eyes light up as she snatches the chip.")

		saynn("[say=eliza]Yes~.[/say]")

		saynn("She runs from behind the counter.. and practically pulls you behind her.")

		addButton("Continue", "See what happens next", "in_lab")
	if(state == "in_lab"):
		aimCameraAndSetLocName("med_researchlab")
		saynn("Eliza brings you into the research lab where she already has everything set up.")

		saynn("[say=eliza]Time to calculate our perfect DNA.[/say]")

		saynn("She pulls out her datapad and starts furiously typing away on it, her tail wagging behind her with barely contained excitement.")

		saynn("After some time, she presents you her datapad. The screen shows one big 'start' button.")

		saynn("[say=eliza]Do it~.[/say]")

		saynn("Why not, you press the button.. and the screen goes black for a second.. before filling in with scrolling texts, graphs and rotating 3D models of genetic structures.")

		saynn("[say=pc]Thanks for giving me something to do.[/say]")

		saynn("[say=eliza]This way I'm not responsible~.[/say]")

		saynn("[say=pc]What?[/say]")

		saynn("You begin to feel the room.. getting all warm. So warm that Eliza has to lean against one of the tables and start fanning herself with her paw.")

		saynn("Some seconds pass.. about ten maybe. And then her datapad beeps.")

		saynn("[say=eliza]Phew. We probably just evaporated a small ocean's worth of water.[/say]")

		saynn("[say=pc]How? The super-computers are installed here?[/say]")

		saynn("She shakes her head..")

		saynn("[say=eliza]Nope, they're down in engineering.[/say]")

		saynn("There was so much warm air that it managed to reach you..")

		saynn("Hopefully it was worth it.")

		saynn("[say=eliza]Look![/say]")

		saynn("She shows you her datapad that has a glowing model of an.. egg.. rotating slowly.")

		saynn("[say=eliza]Perfection. No oxidation damage. No radiation damage. A combination of all of the perfect traits..[/say]")

		saynn("After that, she approaches one of the machines.. an incubator. She uploads the sequence into it and lets it start doing its job.")

		saynn("The lab gets filled with sounds of whirs and hisses.. it does take some time.")

		saynn("But eventually, a small hatch opens. Inside.. that same egg.. but now realized into existance.")

		saynn("It's small.. much smaller than the one you have seen already.. about the size of a tennis ball. But it still has all of the familiar traits.. like that vibrant green shell.. with a strange cross-shaped crease at the top.")

		saynn("Eliza puts on her latex gloves.. and then reaches in to carefully take it out.")

		saynn("[say=eliza]Hello, beautiful..[/say]")

		saynn("She offers it to you.. but you decide against holding such an alien-looking object.")

		saynn("[say=pc]You're gonna grow it in the testing chamber again?[/say]")

		saynn("[say=eliza]Testing chamber? No~. I have a better spot in mind.[/say]")

		saynn("[say=pc]What would it be?[/say]")

		saynn("Her little cunning smile makes you tense up.")

		saynn("[say=eliza]Your cell! Let's go![/say]")

		saynn("[say=pc]No way.[/say]")

		saynn("[say=eliza]The egg is perfect, there is zero risk! You paid for it so it's only fair~.[/say]")

		saynn("She grabs your hand and pulls towards the exit, the egg hiding in her other paw.")

		addButton("Continue", "See what happens next", "in_cell")
	if(state == "in_cell"):
		aimCameraAndSetLocName(GM.pc.getCellLocation())
		GM.pc.setLocation(GM.pc.getCellLocation())
		saynn("A few passing nurses and guards give you odd looks.. but no one dares to ask what it is that Eliza is carrying.")

		saynn("She brings you back to your cell.")

		saynn("Once inside, she sets the egg gently on the floor and steps back, admitting it for a bit.")

		saynn("[say=eliza]Ready?[/say]")

		saynn("[say=pc]I hope you're right, doctor.[/say]")

		saynn("She offers you a smile.. and then produces a familiar syringe that she uses to inject the egg with.")

		saynn("[say=eliza]What's the worst that could happen?[/say]")

		saynn("You just nod and take a few steps back, standing near the exit.")

		saynn("For a moment, nothing happens. But then the growth begins.")

		addButton("Continue", "See what happens next", "show_egg")
	if(state == "show_egg"):
		playAnimation(StageScene.SoloBigEgg, "stand")
		saynn("It's faster this time. The egg swells to the size of a melon.. then a beach ball.. and then bigger still. The green shell thickens and becomes darker.")

		saynn("Eliza backs away slowly, gently shoving you away from the exit.")

		saynn("When the egg grows about half the size of you.. it suddenly stops and starts shaking instead.")

		saynn("At least it looked like it was shaking at first. The more you look at it, the more you realize that it is still growing.. but downwards.. creating itself a nest of sorts, consisting out of those dead-looking purple tendrils.")

		saynn("[say=eliza]Huh. I thought that those were just a bad mutation.[/say]")

		saynn("[say=pc]I guess they're important.[/say]")

		saynn("You continue to monitor the egg that is now mostly still.")

		saynn("Sudden thump.")

		saynn("Something is moving inside.")

		saynn("Another thump.")

		saynn("Yeah, definitely. Every thump makes the shell deform slightly.")

		saynn("You look at Eliza.. who seems a little more worried than before, her green eyes wide open.")

		saynn("[say=pc]It's gonna be fine. Worst case.. We're unleashing a giant monster upon this prison.[/say]")

		saynn("[say=eliza]That will be a first for me..[/say]")

		saynn("Another thump.. and the shell splits in two..")

		addButton("Continue", "See what happens next", "tentacles_reveal")
	if(state == "tentacles_reveal"):
		playAnimation(StageScene.TentaclesDuo, "glare", {pc="eliza", plant=true, instantSleep=true})
		saynn("Tentacles.. many of them.. appear between the split halves of the egg shell. They uncurl slowly and rise high.")

		saynn("The two of you are staying completely silent.. Eliza pressing against you..")

		saynn("The green tips begin to curiously look around the cell. They sway left.. then right.. One tendril drifts toward the ceiling and pokes it.")

		saynn("This could go either way still..")

		saynn("And then they notice you.. Every single tip freezes. All at once. Many tentacles are staring directly towards you and Eliza.")

		saynn("The feline's claws dig into your arm. Her breathing stops.")

		saynn("The tentacles don't move. They don't strike. They just.. look.")

		saynn("One thick tendril slowly breaks from the rest and slides forward across the floor. It stops only a few inches from your feet. The tip tilts upwards.. like it's studying your face.")

		saynn("[say=eliza]..please don't kill us..[/say]")

		saynn("The tentacle shivers a bit, confused by the sudden sound. But then it does something strange.")

		saynn("It bows to you.")

		saynn("Another tentacle joins it. Then another. Soon, a whole group of them are doing a strange, synchronized bow to you.")

		saynn("Eliza loosens her grip slightly.")

		saynn("[say=eliza]..hi?..[/say]")

		saynn("Her word is met with a nod of a few tentacles.")

		saynn("[say=pc]They seem friendly.[/say]")

		saynn("They start swaying idly, the tips are still looking around, full of curiosity..")

		saynn("Eliza exhales the caught air.")

		saynn("[say=eliza]Phew! I didn't destroy the prison! Mom is gonna be proud of me.[/say]")

		saynn("You can't help but chuckle.")

		saynn("Eliza watches the tentacles with growing fascination. And this catches their attention, a few of the tendrils reach out to brush against her arm.")

		saynn("[say=eliza]Aw, they're so gentle.[/say]")

		saynn("You reach your hand out too and are met with a friendly touch from them, one of the tentacles gently curls around your wrist.")

		saynn("The more you look.. the more you notice something. Some of the green tips are looking quite slick.. almost drippy.")

		saynn("[say=eliza]I think.. I think that they're horny~.[/say]")

		saynn("A tentacle slides between you two and gently nudges Eliza's hip. She squeaks.")

		saynn("[say=eliza]Ah![/say]")

		saynn("It nudges again.. more insistent.. and so Eliza stumbles forward slightly. The tentacles catch her.. and begin to explore, getting under her labcoat and running along the curves of her hips and belly.")

		saynn("[say=eliza]Ahah, that tickles![/say]")

		saynn("A thought appears in your head.")

		saynn("[say=pc]How am I gonna explain it?[/say]")

		saynn("[say=eliza]Explain what?[/say]")

		saynn("Eliza is squirming slightly, giggling and gently rubbing the tentacles that poke her in various places.")

		saynn("[say=pc]Explain this. What if a guard sees it?[/say]")

		saynn("The feline pulls out a datapad and starts typing away on it.. while the drippy tentacles keep brushing against her.. some of them are curling around her legs and arms now.. but she always manages to pull her limbs free.")

		saynn("[say=eliza]I did some magic and now you have a permit for a single green plant in your cell~.[/say]")

		saynn("Plant..")

		saynn("[say=pc]I doubt that anyone will see it as a plant.[/say]")

		saynn("Eliza chuckles and directs her attention towards the eager tentacles.")

		saynn("[say=eliza]Listen to me, cuties! If you see someone you don't know enter this room, you're gonna play dead! Understand?[/say]")

		saynn("The tentacles stop for a bit.. and then nod.")

		saynn("[say=eliza]See? They're smart~. That whole selection thing that we did worked.[/say]")

		saynn("[say=pc]I hope so.[/say]")

		saynn("[say=eliza]Oh yeah, what are you gonna call them? Calling them a plant all the time would be kinda mean![/say]")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_lab"):
		processTime(10*60)

	if(_action == "in_cell"):
		processTime(15*60)

	if(_action == "show_egg"):
		processTime(5*60)

	if(_action == "tentacles_reveal"):
		processTime(3*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["creditsPaid"] = creditsPaid
	data["creditsPaidStr"] = creditsPaidStr

	return data

func loadData(data):
	.loadData(data)

	creditsPaid = SAVE.loadVar(data, "creditsPaid", 0)
	creditsPaidStr = SAVE.loadVar(data, "creditsPaidStr", "")
