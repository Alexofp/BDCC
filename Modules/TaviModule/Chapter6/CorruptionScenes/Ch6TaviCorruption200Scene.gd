extends SceneBase

func _init():
	sceneID = "Ch6TaviCorruption200Scene"

func _run():
	if(state == ""):
		playAnimation(StageScene.Solo, "stand")
		saynn("You can already feel that something is different, there is no usual arousing scent. And indeed, as you enter Tavi's cell.. you don't find her.")

		saynn("[say=pc]Tavi?[/say]")

		saynn("No reaction. Time to go look for her.")

		addButton("Step out", "Look for Tavi in other blocks", "step_out")
	if(state == "step_out"):
		aimCameraAndSetLocName("cellblock_nearcells")
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("You step out of her cell and look around. There are no obvious signs of Tavi, not even a trail of her pussy juices that would lead to her.")

		saynn("But after your quick search, you suddenly run into Kait. She seems to be.. hurt.. there are obvious scratches on her face, chest and arms. But she is also.. covered in some transparent fluids.")

		saynn("Kait was heading somewhere, her head lowered. But when she notices you, she can't help but to lash out at you.")

		saynn("[say=kait]Your Tavi went nuts completely! What did you even do to her?![/say]")

		saynn("She growls but then just leaves when too many eyes get glued to her. Huh, Kait has Tavi's scent though. So you must be on the right path.")

		addButton("Main hall", "See if Tavi is there", "step_main_hall")
	if(state == "step_main_hall"):
		aimCameraAndSetLocName("main_stairs_n")
		GM.pc.setLocation("main_stairs_n")
		removeCharacter("kait")
		addCharacter("tavi", ["naked"])
		addCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="eliza", bodyState={naked=true}})
		saynn("You step out into the main hall. Huh. There is a big crowd of inmates near the stocks, forming a make-shift arena. Something is surely happening there.")

		saynn("As you approach it, you begin to hear doctor Quinn's voice.")

		saynn("[say=eliza]And this was your plan? Getting me out here by beating up one of the inmates? You're even more evil than I thought.[/say]")

		saynn("Naked Tavi slowly circles around Eliza while she does the same, making it look like a dance.")

		saynn("[say=tavi]It's you who is talking about evil, huh~? I might have horns but you are the real devil here~.[/say]")

		saynn("All the eyes seem to be glued to Tavi.. to her curves.. to her dripping sex. And Tavi knows it, so she directs her next sentence to everyone around.")

		saynn("[say=tavi]Grab her if she pulls out a remote. I want a fair fight~.[/say]")

		saynn("Doctor growls as she looks around. The inmates are basically a wall, not letting anyone in or out. All the while the two continue their little intricate dance.")

		saynn("[say=eliza]I was following the captain's orders! You did a lot of bad things, Tavi. But you can still give up. We will.. fix.. whatever happened to you.[/say]")

		saynn("Tavi's eyes shine brightly as she starts approaching the other feline.")

		addButton("Continue", "See what happens next", "first_strike")
	if(state == "first_strike"):
		playAnimation(StageScene.Duo, "dodge", {pc="tavi", npc="eliza", npcAction="punch", bodyState={naked=true}})
		saynn("Tavi's constant smile makes Eliza feel uneasy. As soon as the distance between them gets halved, the doctor extends her claws and leashes out at the naked cat. Tavi sees that and just gracefully avoids her paw.")

		saynn("[say=tavi]You know. I should thank you actually. Without your torturing me.. I would realize my true potential~.[/say]")

		saynn("Eliza growls and tries to scratch Tavi again but she side-steps and does an attack of her own, her claws leaving shallow bleeding marks on Eliza's cheek.")

		saynn("[say=eliza]Argh..[/say]")

		saynn("The doctor grunts as she rubs her new wounds. She sees red blood on her paws.")

		saynn("[say=eliza]You're a monster.[/say]")

		saynn("Eliza sounds almost desperate.")

		addButton("Continue", "See what happens next", "throw_vial")
	if(state == "throw_vial"):
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="eliza", npcAction="throw", bodyState={naked=true}})
		saynn("Eliza fetches one of the vials from her belt and throws it towards Tavi. The glass object shatters under her legs.. But Tavi just lets the pink cloud cover her up.")

		saynn("[say=eliza]This will use your lust against you! Submit![/say]")

		saynn("Nothing.. is happening.. for quite some time. As the cloud disappears, it uncovers Tavi.. still standing.. and still smiling.")

		saynn("[say=eliza]I don't believe in hell.. But I'm gonna send you back there, whatever it takes.[/say]")

		saynn("Tavi begins to slowly approach Eliza.. taking her time.. swaying her hips. That's when the doctor gets too desperate, she reaches for her remote and tries to use it. But then a full crowd of inmates stopped her. Some are grabbing her hand, some holding her labcoat, others are yanking on her hair. All the while Tavi just slowly creeps closer and closer, her smile unchanged.")

		saynn("[say=eliza]S-stop it!.. Let me go. This bitch is gonna kill me![/say]")

		addButton("Continue", "See what happens next", "twist")
	if(state == "twist"):
		playAnimation(StageScene.Duo, "stand", {pc="tavi", npc="eliza", npcAction="kneel", bodyState={naked=true}})
		saynn("Tavi walks up to Eliza and looks her in the eyes. Then the tall naked kitty just parts her lips and blows.. the same pink smoke.. directly into her face.")

		saynn("[say=eliza]Kgh.. gh-h..[/say]")

		saynn("Eliza certainly didn't expect that. She drops her remote and starts coughing.. but then her eyes begin to share the same lustness as Tavi's.")

		saynn("[say=eliza]F-fuck.. me..[/say]")

		saynn("When the crowd lets go of Eliza, she drops to her knees before Tavi. Tall kitty idly puts her paw on that ponytail and pats the doctor.")

		saynn("[say=tavi]Killing you would be fun..[/say]")

		saynn("After a few headpats, Tavi turns around and just starts heading away, deciding not to finish her sentence. That's when Eliza sneakily pulls out some syringe and suddenly tries to stab Tavi!")

		addButton("Continue", "See what happens next", "tavi_almost_kills")
	if(state == "tavi_almost_kills"):
		playAnimation(StageScene.Hug, "hug", {pc="tavi", npc="eliza", bodyState={naked=true}})
		saynn("Eliza growls as she almost manages to inject the naked inmate.. But Tavi turns at the last second and sinks her long sharp claws into the doctor's neck.. directly in the middle of her throat. Eliza gasps as she realizes that she can't talk.. or breathe.. blood begins streaming down her neck.. her eyes full of terror.")

		saynn("[say=eliza]Gh-h.. h.h-h..[/say]")

		saynn("Everyone around goes quiet instantly, the crowd is no longer cheering, everyone is just shocked at the display. Tavi casually fetches the syringe from Eliza's paw and puts it back into her belt.")

		saynn("[say=tavi]..And extremely easy.. Just dragging my claws through your neck.. ripping through all of your arteries.. Until there is nothing that can save you anymore..[/say]")

		saynn("Tavi tilts her head to the side, her smile.. it's the same smile as before.. but now it looks so much more maniacal.. Eliza's lower jaw is shaking.. Tears stream down her cheeks.")

		saynn("[say=tavi]But.. the punishment must fit the crime. So this will do..[/say]")

		saynn("Tavi supports Eliza with her free paw as she pulls her claws out of that neck.. causing a stronger flow of blood to spawn, both dark and bright blood.. That labcoat gets quickly coated with it.. just like her fur.")

		saynn("After that, Tavi leans in and starts.. licking the deep wounds that she caused. And miraculously, they begin to heal. While Tavi is dragging her rough feline tongue over the pierced torn flesh, it gets mended.. until there is no more blood loss.. just a spot without fur.")

		saynn("[say=tavi]It only took becoming a monster to finally see my dreams starting to come true. Worthy sacrifice, I think~.[/say]")

		saynn("When Tavi lets go of Eliza, she is left panting heavily on the floor, her eyes still can't believe that this has happened. A few seconds later, the doctor dashes away, leaving only Tavi in the arena.")

		saynn("The crowd begins to disperse.. Allowing you to get close to her.")

		addButton("Continue", "See what happens next", "tavi_talks")
	if(state == "tavi_talks"):
		removeCharacter("eliza")
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("Tavi smiles when she sees you.")

		saynn("[say=pc]What was this about?[/say]")

		saynn("[say=tavi]Just tying up some loose ends before..[/say]")

		saynn("Her smile gets wider as she looks at you.")

		saynn("[say=pc]Before?[/say]")

		saynn("She leans in and lands a little kiss on your lips. Tastes like blood..")

		saynn("[say=tavi]It's your call~. I will be in my cell if you wanna talk.[/say]")

		saynn("Tavi slowly walks away, swaying her hips in the process.")

		saynn("Huh.")

		addButton("Continue", "This was something", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "step_out"):
		processTime(3*60)
		getCharacter("kait").cummedOnBy("tavi", FluidSource.Vagina, 0.5)

	if(_action == "step_main_hall"):
		processTime(3*60)

	if(_action == "first_strike"):
		processTime(3*60)

	if(_action == "throw_vial"):
		processTime(3*60)

	if(_action == "twist"):
		processTime(60)

	if(_action == "tavi_almost_kills"):
		processTime(3*60)

	setState(_action)
