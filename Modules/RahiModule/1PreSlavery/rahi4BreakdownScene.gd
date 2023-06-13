extends SceneBase

var visited_cell = false
var visited_medical = false

func _init():
	sceneID = "rahi4BreakdownScene"

func _run():
	if(state == ""):
		saynn("You approach the bench where Rahi is usually spending her time. But she is not there, her favorite bench is empty.")

		saynn("Huh. Maybe she is just still recovering. But the other kinds of thoughts slowly corrupt your mind, the worrying kind of thoughts.")

		saynn("You look around. Where can Rahi be..")

		addButton("Her cell", "Check Rahi's cell", "check_cell")
		addButton("Medical wing", "Check the medical wing", "check_medical")
		addButton("Yard area", "Check the waterfall spot", "check_waterfall")
	if(state == "check_cell"):
		removeCharacter("eliza")
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		saynn("Maybe she is just resting in her cell.")

		saynn("You go down into the cellblock and look for Rahi's cell.")

		saynn("You find it. But there is no Rahi inside. And the bed seems to be made. Means she wasn't dragged away forcefully.")

		if (!visited_medical):
			addButton("Medical wing", "Check the medical wing", "check_medical")
		addButton("Yard area", "Check the waterfall spot", "check_waterfall")
	if(state == "check_medical"):
		aimCameraAndSetLocName("med_lobbymain")
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza", npcAction="sit"})
		saynn("You use the elevator to get to the medical wing. The lobby is as busy as it usually is, there are a few nurses idling around, always on standby.")

		saynn("Doctor Quinn is sitting behind the counter. You decide to approach her.")

		saynn("[say=eliza]Doctor Quinn, what can I do?[/say]")

		saynn("[say=pc]Is kitty here somewhere?[/say]")

		saynn("The feline shakes her head slightly. Her eyes pick up on something.")

		saynn("[say=eliza]Something happened?[/say]")

		saynn("[say=pc]I hope not.[/say]")

		saynn("[say=eliza]If she did something to herself again, you bring her here. Understand?[/say]")

		saynn("You nod softly. Well, she is not here either.")

		if (!visited_cell):
			addButton("Her cell", "Check Rahi's cell", "check_cell")
		addButton("Yard area", "Check the waterfall spot", "check_waterfall")
	if(state == "check_waterfall"):
		removeCharacter("eliza")
		playAnimation(StageScene.Solo, "stand")
		aimCameraAndSetLocName("yard_firstroom")
		saynn("Maybe she is resting near the waterfall, the other place that she likes to hang out at. You just hope that she isn't back to her old habits of stealing alcohol and binging it.")

		saynn("As you step through the stone pathways, you can't shake off a strange feeling. A feeling of hope mixed with all sorts of concerns. Rahi knows that she shouldn't drink, especially now, after her operation. You step faster, just in case.")

		saynn("You're almost there. Time to see what fate has prepared for you.")

		addButton("Continue", "See what happens next", "rahi_near_waterfall")
	if(state == "rahi_near_waterfall"):
		addCharacter("rahi", ["naked"])
		playAnimation(StageScene.Duo, "stand", {npc="rahi", npcBodyState={naked=true}})
		aimCameraAndSetLocName("yard_waterfall")
		saynn("As you get on the path that leads directly to the waterfall, you notice something. Or rather, someone. It's Rahi. A brown feline kitty is standing near the water pond, facing away from you.")

		saynn("You rush towards her. Then you notice that Rahi is completely naked, you can see her bare back, girly hips, fluffy tail, all of them exposed. Her uniform is there, it's placed in a neat stack on the bench.")

		saynn("[say=pc]Kitty? Why are you out here, naked?[/say]")

		saynn("Her ears perk, hearing your voice. Rahi slowly turns around, awkwardly almost. Her stomach area still has that surgery cut even if it has already begun to heal.")

		saynn("Her body isn't the biggest problem though. Her stare.. empty? Almost lifeless. You suddenly realize..")

		saynn("Her wrists are tied together with some rope. Her ankles too.. And as you begin stepping towards her, the feline does the same but away from you, getting dangerously close to that water pond behind her.")

		saynn("[say=pc]Kitty? I know it's a lot for you. But can we talk?[/say]")

		saynn("She just looks at you. Not dropping a single word. If you weren't concerned before, you are now. Your heart beats like hell, a familiar feeling. You try to assume a reassuring posture but Rahi doesn't react, she just keeps tippy-toeing back until reaching the edge. A few tears slid down her cheeks.")

		saynn("Rahi tilts her head down, a sigh of acceptance leaves her lungs before she finally gets brave enough to plunge into the void. Kitty starts leaning back until she can't stop anymore. The gravity does its thing, pulling the feline into the water pond. It's not the deepest but even a puddle is enough if you're sick of living..")

		saynn("[say=pc]NO![/say]")

		saynn("Your scream echoes throughout the whole station. Soon followed by a loud water splash noise. Rahi sinks under the wet surface. And since she can't use her paws even if she wanted to.. She begins to drown..")

		addButton("Save her!", "You can't let her drown herself", "save_rahi_from_drowning")
		addDisabledButton("Let her die", "Rahi gave up but that doesn't mean that you can give up on her.")
	if(state == "save_rahi_from_drowning"):
		playAnimation(StageScene.SexStart, "defeated", {npc="rahi", npcBodyState={naked=true}})
		saynn("Gotta act quick! You sprint towards the edge of the water pond and reach your hands into the cold water, trying to get a grasp on Rahi. But you can't, she is completely motionless, meaning she quickly sinks to the bottom, only a few lonely bubbles of air reach the surface. But something tells you that those will end soon.")

		saynn("Screw it, you jump into the pond too and get your head under water. Your hands finally reach Rahi and begin to pull her up. Her eyes are already closed, the lack of oxygen made her brain shut down. But it can't end like this, you're not gonna allow it.")

		saynn("You place your hands under her armpits and push yourself off the concrete bottom floor, quickly rising to the surface. You gasp as the air hits your lungs. But that can't be said for Rahi, she is still limp and unresponsive in your hands, even with her head above water.")

		saynn("You quickly pull the poor kitty out of the water and place her onto the stone pathway. You can't allow yourself to panic. You place your hands roughly where the cat's ribcage is and begin to do CPR.")

		saynn("Time passes but you don't give up.")

		addButton("Continue", "See what happens next", "rahi_is_saved")
	if(state == "rahi_is_saved"):
		saynn("Suddenly Rahi gasps for air and then proceeds to cough. Her eyes scan the area around until she notices you. Her stare.. still empty..")

		saynn("[say=rahi]Why..[/say]")

		saynn("[say=pc]What do you mean why? I can't let you die, kitty.[/say]")

		saynn("She looks at her paws, they're still tied up. Better to keep them that way. But you place her uniform under her head as a little cushion.")

		saynn("[say=rahi]There is no point.. Just let it happen..[/say]")

		saynn("[say=pc]What are you saying, silly. You wanna die because you can't drink anymore? You will be able to, just less. Please, kitty.[/say]")

		saynn("[say=rahi]She wanted to forget.. everything.. and herself.. Not Rahi.. But.. her..[/say]")

		saynn("That's.. more than confusing.")

		saynn("[say=pc]But you are Rahi.[/say]")

		saynn("The feline shakes her head slightly and still coughs sometimes.")

		saynn("[say=rahi]No.. she is no Rahi.. Rahi died.. there is only.. her..[/say]")

		saynn("That.. does explain some things.. But also..")

		saynn("[say=rahi]And now.. they are gonna place her in a padded room.. keep her sedated.. forever.. forever remembering everything.. While not being able to do anything about it..[/say]")

		saynn("[say=pc]Kitty..[/say]")

		saynn("A fate worse than death. You can't let that happen.")

		saynn("[say=rahi]Go on.. go tell that doctor.. She will know what to do.. She always does..[/say]")

		saynn("She stares at you.. with a blank stare.. waiting for her fate.. but not caring about it.")

		saynn("[say=pc]No. I won't. No doctors or padded rooms.[/say]")

		saynn("A few seconds of silence. Seems like Rahi didn't expect that.")

		saynn("[say=rahi]What are you gonna do then..[/say]")

		addButton("Fix", "Tell Rahi that you will fix her", "tell_fix_rahi")
		addButton("Break", "Tell Rahi that you breaking her is the best way of fixing her", "tell_break_rahi")
	if(state == "tell_fix_rahi"):
		setFlag("RahiModule.rahi4SaidFix", true)
		playAnimation(StageScene.SexStart, "start", {npc="rahi", npcBodyState={naked=true}})
		saynn("[say=pc]I will fix you.[/say]")

		saynn("The feline tilts her head slightly.")

		saynn("[say=pc]You will see that life is worth living. You will be accepted the way you are, doesn't matter how perfect or not.[/say]")

		saynn("Rahi tilts her head down again. You reach out to undo her bindings and store them. Kitty slowly sits down and stares at the going waterfall.")

		saynn("[say=pc]Screw that, perfect or not doesn't even matter in the slightest. Kitty, I just want you to be happy.[/say]")

		saynn("She slowly turns her head towards you, her ears lowering.")

		saynn("[say=pc]But I need to know if that's what you want too.[/say]")

		saynn("You get up and offer her a hand. Rahi stares at it. Her eyes.. still empty.. but now also so shy and innocent.")

		saynn("[say=pc]What do you say, kitty?[/say]")

		saynn("[say=rahi]But.. she.. she is not worth it..[/say]")

		saynn("[say=pc]Would I be standing here if you weren't? I know, life is tough. But we will get through everything. I just need your trust.[/say]")

		saynn("Kitty swipes something off her cheeks. But then she reaches her paw out, grabbing your hand. Holding onto it.")

		addButton("Continue", "See what happens", "eliza_walks_in")
	if(state == "tell_break_rahi"):
		setFlag("RahiModule.rahi4SaidFix", false)
		playAnimation(StageScene.SexStart, "start", {npc="rahi", npcBodyState={naked=true}})
		saynn("[say=pc]I will break you.[/say]")

		saynn("The feline tilts her head a lot, clearly surprised.")

		saynn("[say=pc]You're tired of living like this? I will change your whole life around. We will start from scratch, with you, as my slave.[/say]")

		saynn("A slight blush appears on Rahi's cheeks.")

		saynn("[say=pc]You will experience everything. Not just pleasure. But all sorts of painful sensations too. There will be rewards. But I will also punish you if you're gonna slack. I will apply as much force as needed. Until you break.[/say]")

		saynn("You reach for her binding and undo them before storing. Ropes could be useful in the future.")

		saynn("[say=pc]Until you break out of this state. And then I will begin to sculpt you from scratch, a better version of you. A version that is happy to obey and do exactly like I say. I will give your life a purpose, to be mine.[/say]")

		saynn("Rahi slowly sits down. Her ears listen carefully to your words while she has her head tilted down.")

		saynn("[say=pc]But for that, I need your permission first.[/say]")

		saynn("You get up and reach your hand out. She slowly looks up at you, her eyes.. empty.. but they also have this.. spark? A spark that you don't remember seeing. Shining brightly.")

		saynn("[say=rahi]You..[/say]")

		saynn("A few seconds pass, Rahi is clearly struggling to get the first words out. But then..")

		saynn("[say=rahi]You have her full permission to do anything you want with her.. Please, don't hold back.. If you have to break her - do it without remorse.. She wants this, please..[/say]")

		saynn("Seems like you hit just the spot. Rahi grabs your hand with both her paws, caressing it. She tilts her head, in a very submissive way.")

		saynn("[say=rahi]She thinks that you're right.. Right now she is worthless..[/say]")

		saynn("[say=pc]Your self-value will depend on how well both you and I do.[/say]")

		saynn("Kitty nods subtly.")

		addButton("Continue", "See what happens", "eliza_walks_in")
	if(state == "eliza_walks_in"):
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You help kitty to get up. Her fur is still wet, you can't find anything better than to just hug her and dry her with your hands.")

		saynn("Suddenly you hear doctor Quinn's voice. A somewhat intimidating version of it..")

		saynn("[say=eliza]What happened here?[/say]")

		saynn("You turn around and see the doctor and a few nurses behind her, forming a triangle formation. Rahi instantly hides behind you and holds onto your arm, tightly.")

		saynn("[say=pc]Nothing?[/say]")

		saynn("Eliza crosses her arms, her eyes scan everything. The naked wet feline, her uniform on the ground, you.")

		saynn("[say=eliza]Then why was there a scream? Your scream in fact.[/say]")

		saynn("[say=pc]We were just having fun in the water pond. You should relax, doctor Quinn.[/say]")

		saynn("The feline squints, she begins to slowly approach you. Rahi's claws dig into your arm, causing some discomfort.")

		saynn("[say=eliza]Is Rahi alright? She couldn't stand being in water last time.[/say]")

		saynn("[say=pc]Don't call her Rahi, you know that's upsetting her. And yes, she is doing just fine. I've been teaching her how to swim.[/say]")

		saynn("Eliza tilts her head slightly, looking through you at Rahi's face. The naked brown feline tries to occupy as little space as possible.")

		saynn("[say=eliza]Can I hear that from her? You know, to make sure.[/say]")

		saynn("You can feel Rahi's heart beating just from her hugging you. She peeks her head out and looks at Eliza, trying to avoid direct eye contact.")

		saynn("[say=rahi]She is doing alright.. Just trying to swim.. just like {pc.name} said..[/say]")

		saynn("Eliza nods slowly, a few times, each one with lesser amplitude than the last.")

		saynn("[say=eliza]Alright. Be careful then, it's easy to drown when you don't know how to swim. Especially for such fragile kitties like Rahi.[/say]")

		saynn("Rahi furrows her brows. But then hides behind you again.")

		saynn("[say=pc]She has great support, okay?[/say]")

		saynn("[say=eliza]Sure, sure. I will leave you to it then. Have fun. Don't push yourself too much, kitty, let the scars heal.[/say]")

		saynn("And just like that, they leave you two alone.")

		addButton("Continue", "See what happens next", "rahi_is_standing")
	if(state == "rahi_is_standing"):
		removeCharacter("eliza")
		playAnimation(StageScene.Hug, "hug", {npc="rahi", npcBodyState={naked=true}})
		saynn("You turn back towards Rahi and hug her again.")

		saynn("[say=rahi]Kitty is not a fan of her..[/say]")

		saynn("[say=pc]She is just trying to help. But I can see what you mean. Let's get you dressed up.[/say]")

		saynn("You pick up Rahi's uniform and begin putting it on her. The feline raises her knee slightly, giving you a great view of her bits while you put shorts on her. Then she opens her arms up, exposing her chest while you guide her arms into the shirt's sleeves.")

		saynn("[say=rahi]Thank you.. She is so tired..[/say]")

		saynn("[say=pc]Nothing to thank me for yet, kitty. Yeah, let's get you back to your cell. Everything we talked about starts tomorrow.[/say]")

		if (!getFlag("RahiModule.rahi4SaidFix", false)):
			saynn("Then you pull out one of Rahi's bindings and untie them back into a rope. A somewhat short one but this should be enough for this.")

			saynn("[say=pc]If you want to be my slave, you better start getting used to being on a leash.[/say]")

			saynn("Rahi nods a few times and presents her collar. You tie the rope around the little hook and test it by tugging on the other end of the leash. Seems to be sturdy enough.")

		addButton("Rahi's cell", "Bring Rahi to her cell", "bring_rahi_to_cell")
	if(state == "bring_rahi_to_cell"):
		playAnimation(StageScene.Duo, "stand", {npc="rahi"})
		addCharacter("rahi")
		aimCameraAndSetLocName("cellblock_orange_nearcell")
		GM.pc.setLocation("cellblock_orange_nearcell")
		saynn("You follow the stone pathways that lead to the main hall. Rahi steps behind you, her head tilted down.")

		saynn("Together, you step down the stairs to the cellblock and find Rahi's cell in the general block. Rahi sits on her bed.")

		if (!getFlag("RahiModule.rahi4SaidFix", false)):
			saynn("You untie the leash from her collar and store it.")

		saynn("[say=pc]Have a good rest.[/say]")

		saynn("Feline eyes look up at you. But as soon as your gazes collide, she looks away. Seems like it will take a while for all the wounds to heal.")

		saynn("You decide to leave so as to not make the kitty even more uncomfortable.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "check_cell"):
		processTime(5*60)
		visited_cell = true

	if(_action == "check_medical"):
		processTime(5*60)
		visited_medical = true

	if(_action == "check_waterfall"):
		processTime(5*60)

	if(_action == "rahi_near_waterfall"):
		processTime(5*60)
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ZiptiesWrist"))
		getCharacter("rahi").getInventory().equipItem(GlobalRegistry.createItem("ZiptiesAnkle"))

	if(_action == "tell_fix_rahi"):
		getCharacter("rahi").resetEquipment()

	if(_action == "tell_break_rahi"):
		getCharacter("rahi").resetEquipment()

	if(_action == "rahi_is_standing"):
		processTime(5*60)

	if(_action == "bring_rahi_to_cell"):
		processTime(10*60)

	setState(_action)

func saveData():
	var data = .saveData()

	data["visited_cell"] = visited_cell
	data["visited_medical"] = visited_medical

	return data

func loadData(data):
	.loadData(data)

	visited_cell = SAVE.loadVar(data, "visited_cell", false)
	visited_medical = SAVE.loadVar(data, "visited_medical", false)

func getDevCommentary():
	return "And this is the anti-climax of Rahi's story. Basically, if the player wasn't around.. You know.. But yeah. You might ask me. Rahi, why did you include this super dark scene in my funny non-con fetish game? Well.. Just to show Rahi at her lowest, is all.. Without the lows we can't appreciate the highs.\n\nIt was a very experimental scene, I had no idea what the reaction would be. But most seemed to care for Rahi x3. Which is nice.\n\nAnd yeah, remember, this Rahi is not me. These events are purely fictional and all that.. But we all probably had that feeling sometimes.. 'why not just end it all..'. Usually when we're depressed. And usually our brains save us from actually going through. Something usually keeps us wanting to stay in this world. For Rahi it was alcohol, the last straw. When that was taken away.. nothing was holding Rahi back anymore. Hopefully that makes some sense x3"

func hasDevCommentary():
	return true
