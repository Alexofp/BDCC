extends SceneBase

func _init():
	sceneID = "Ch7KillEndingScene"

func _run():
	if(state == ""):
		addCharacter("tavi", ["naked"])
		addCharacter("captain")
		playAnimation(StageScene.Duo, "stand", {npc="captain", npcAction="holdpistol", pc="tavi", bodyState={naked=true}})
		saynn("You just offer Tavi a little smile.. and she understands everything. There is not much left to say anyway..")

		saynn("Tavi turns her head towards the captain.. and establishes direct eye contact. A little mean smile appears between her cheeks as she starts to close distance, bravely stepping forward.. putting all her femininity into each step.. embracing her sexy curves.")

		saynn("The captain sees that and aims his energy gun at her.")

		saynn("[say=captain]Not a step further![/say]")

		saynn("Tavi stops.. seemingly obeying.. but then proceeds her advances.. passing through the fake boundaries.")

		saynn("[say=captain]I will kill you if I have to.[/say]")

		saynn("[say=tavi]Oh yeah~?[/say]")

		saynn("[say=captain]You're not afraid to die?[/say]")

		saynn("Tavi giggles as she already makes at least a third of the way to him.")

		saynn("[say=tavi]I'm in hell already~.[/say]")

		saynn("She seductively squeezes her tits with her clawed paws in front of him.. causing the captain to frown.")

		saynn("[say=captain]You think I wouldn't kill a slut?[/say]")

		saynn("[say=tavi]Ooh~. So brave. Stating the obvious. But.. you are a bigger slut here. A slut for power~. The moment you fire, the last barrier will disappear.. And then all bets will be off..[/say]")

		saynn("Captain shakes his head.. and then raises the hand that holds the projector sphere with Elena in it. His hand is threatening to drop it. You notice the aperture of that sphere opening slightly.. almost like Elena is watching through it..")

		saynn("[say=captain]You might not care if you die. But you want this gone? What's the big plan, Tavi? You're lost. Which means that you lost.[/say]")

		saynn("Tavi tilts her head.. but doesn't stop advancing.. swaying her hips in the process.")

		saynn("[say=tavi]You don't get it..[/say]")

		saynn("Seeing that nothing works against fearless Tavi.. Captain pulls the trigger.. Tavi closes her eyes. The aperture opens fully..")

		addButton("Continue", "See what happens next", "elena_saves_tavi")
	if(state == "elena_saves_tavi"):
		playAnimation(StageScene.Duo, "dodge", {npc="captain", npcAction="firepistol", pc="tavi", bodyState={naked=true}})
		saynn("Moments before the gun fires, the sphere in the captain's hand suddenly lights up, illuminating the whole room with a bright pink flash. A blinding flash that disorients you and messes with the captain's aim, letting Tavi easily dodge the shot.")

		saynn("But that flash is also what burns all of that sphere's electronics.. The overloaded matrix burns into ashes.. Captain drops the burning sphere.. letting it smash into a million pieces against the floor..")

		saynn("Tavi's furious eyes flash.. Captain's show.. regret.")

		addButton("Continue", "See what happens next", "tavi_kills_captain")
	if(state == "tavi_kills_captain"):
		playAnimation(StageScene.Rekt, "kill", {npc="captain", pc="tavi", bodyState={naked=true}})
		saynn("Tavi dashes forward, Elena's self-sacrifice allows her to catch up with him.. before suddenly sinking her long sharp claws into his neck, effortlessly tearing through his skin and flesh..")

		saynn("Captain's feet lose the ground as Tavi lifts him high above the floor. She is assuming a powerful stance, her muscles all tensed up.")

		saynn("[say=tavi]My dream is seeing you die.[/say]")

		saynn("[say=captain]KH-h..[/say]")

		saynn("Tavi's mean eyes inspect the captain's expression in great detail. He is scared.. desperate.. His hand holds onto Tavi's.. unsure if they should try to pull the claws.. or just let them stay there.. lodged into his neck.")

		saynn("[say=tavi]Mm-mh~.. I never felt any more alive. Almost as good as fucking~.[/say]")

		saynn("Some blood begins to stream down her paw.. dripping down onto the carpet. Captain starts gasping for air.. silently..")

		saynn("[say=tavi]Has the cat got your tongue?[/say]")

		saynn("Tavi tilts her head slightly and watches the captain suffer..")

		saynn("[say=pc]Tavi, I think we should..[/say]")

		saynn("She looks at you.. her eyes lusty.")

		saynn("[say=tavi]My bad.. you're right.[/say]")

		saynn("Tavi returns her gaze back to the captain.. and then tenses her bloody paw hard.. her claws slashing through the dying guy's arteries.. causing a little fountain of pure red blood to spawn..")

		saynn("[say=tavi]This is for Elena, asshole.[/say]")

		saynn("Captain is quickly losing strength.. strength to live. There is nothing he can tug at anymore. Nothing he can exploit or abuse. No way to talk himself out of this. He is screwed.. And his last moments.. he is forced to see Tavi and think about what got him killed..")

		addButton("Continue", "See what happens next", "tavi_drops_captain")
	if(state == "tavi_drops_captain"):
		playAnimation(StageScene.Rekt, "end", {npc="captain", pc="tavi", bodyState={naked=true}})
		removeCharacter("captain")
		saynn("Tavi uses her free paw to rip the little bloody thumbdrive token that the guy is wearing on his neck.. Before letting go of his body, pulling her sharp claws out and letting the blood stream freely.")

		saynn("Captain collapses.. and loses consciousness as soon as he hits the lowest point of his life. His eyes.. become lifeless.")

		saynn("Tavi is towering over his fresh corpse.. She is trying to keep herself composed.. but she is visibly shaking anyway..")

		saynn("[say=tavi]Thanks for the torture. We would never get this strong otherwise..[/say]")

		addButton("Continue", "See what happens next", "talk_about_elena")
	if(state == "talk_about_elena"):
		playAnimation(StageScene.Duo, "stand", {npc="tavi", npcBodyState={naked=true}})
		saynn("You carefully approach Tavi.. She looks at her bloody paw.. and then shakes some of the blood off. Her adrenaline begins to wear off.. She starts panting heavily.. So you put a hand on her shoulder.")

		saynn("[say=pc]It's okay.. Everything is over. You did really well.[/say]")

		saynn("She looks at you.. and nods.")

		saynn("[say=tavi]Couldn't have done it without you..[/say]")

		saynn("Then she looks at the remains of the projector sphere.. Nothing seems to be recoverable.. Just burned metal and glass bits..")

		saynn("[say=tavi]And without her..[/say]")

		saynn("A little idea comes into your mind.")

		saynn("[say=pc]Don't you have.. a backup? I know that she wouldn't have the same memories but..[/say]")

		saynn("[say=tavi]An old backup.. yeah.. It's in my ship though. A ship that got confiscated by the AlphaCorp.[/say]")

		saynn("You carefully embrace Tavi..")

		saynn("[say=pc]We will find your ship. I promise you. Right now we gotta find a way to get out of here.[/say]")

		saynn("Tavi inspects the thumbdrive that she got. It seems to have some kind of blue round port on it.. Same one as what your collars have.")

		saynn("[say=tavi]Let's take these off first. We've been his slaves long enough.[/say]")

		addButton("Collars", "Remove the collars finally", "remove_collars")
	if(state == "remove_collars"):
		playAnimation(StageScene.Hug, "kiss", {npc="tavi", npcBodyState={naked=true}})
		saynn("Tavi brings the token to your collar.. and a few seconds later there is an audible click as something mechanical inside it unlocks, allowing you to freely take it off..")

		saynn("Ah.. you almost moan as your neck can finally breathe.. You rub the skin there.. and it feels so good..")

		saynn("[say=pc]Now let me.[/say]")

		saynn("You fetch the token from Tavi and press it against her collar.. unlocking it the same way.")

		saynn("[say=tavi]Ah..[/say]")

		saynn("Tavi doesn't hold back and produces a cute little moan. When the second collar hits the floor.. she reaches out to start a deep passionate kiss with you..")

		saynn("Time seems to have stopped.. For a moment you felt truly free.. Both you and Tavi want more of those moments..")

		saynn("[say=tavi]Right. Let's do this~.[/say]")

		addButton("Continue", "See what happens next", "tavi_calls_syndi")
	if(state == "tavi_calls_syndi"):
		playAnimation(StageScene.Duo, "holdpistol", {npc="tavi", npcBodyState={naked=true}})
		saynn("After that kiss, Tavi takes a spot behind the captain's desk and opens his laptop. She uses his token to login and establish an encrypted call..")

		saynn("Almost instantly, there is an unknown voice coming from the laptop's speakers.")

		saynn("[sayMale]Who is this?[/sayMale]")

		saynn("[say=tavi]Do you pick me?[/say]")

		saynn("Some time passes.. With nothing being said. The silence is deafening.")

		saynn("[sayMale]Yes I do. I will ask again. Who is this?[/sayMale]")

		saynn("Tavi looks at you.. and smiles.")

		saynn("[say=tavi]Listen. We need your help. We're inmates in a space station prison. Most.. All of us are from Syndicate. The captain is dead. But we need to get out of here before AlphaCorp gets here.[/say]")

		saynn("From Syndicate?.. You raise a brow but Tavi shows you a 'tshh-h' sign.")

		saynn("[sayMale]Huh. We will trust it when we see it. Send the coords.[/sayMale]")

		saynn("Tavi quickly punches away at the laptop's keyboard.. quickly looking up the coordinates.")

		saynn("[say=tavi]It's important not to destroy the station or its staff. Do you understand? Everyone needs to be saved. People who don't cooperate should be captured instead.[/say]")

		saynn("[sayMale]Now you listen. Either you send the coords or get the fuck off the frequency.[/sayMale]")

		saynn("His words.. are not very inspiring. But you don't have much choice anyway. So Tavi carefully tells each number of the space station's coordinates one by one through the world's most expensive telephone.")

		saynn("[sayMale]That's it? Good.[/sayMale]")

		saynn("And that's when the call abruptly ends.")

		saynn("[say=pc]Are you sure about this, Tavi? They kinda sounded like they weren't gonna save us.[/say]")

		saynn("[say=tavi]They probably won't. They will probably destroy the station.[/say]")

		saynn("[say=pc]But.. Then we are screwed?[/say]")

		saynn("[say=tavi]I have an idea~.[/say]")

		saynn("A little.. object.. grabs your attention. You watch through the window.. and see something moving. Yes, there are moving asteroids there.. But this is something different.. Way smaller.. It's a spaceship. It stops when it notices your space station glued to one of the rocks.. and then suddenly warps away.. creating some kind of blue rift before flying through it. Was that.. a recon ship?")

		saynn("[say=pc]Tavi, they must have confirmed the location.[/say]")

		saynn("[say=tavi]Good~[/say]")

		saynn("Tavi starts another call and suddenly starts speaking with a very concerned tone.")

		saynn("[say=tavi]HEY. I don't have much time! Station's location got compromised! I repeat, Syndicate knows about BDCC![/say]")

		saynn("A sleepy voice answers.")

		saynn("[sayMale]..huh? What?.. Who are you? Where is Captain Wright?[/sayMale]")

		saynn("Tavi starts pretty much screaming into the laptop.")

		saynn("[say=tavi]Wake the fuck up, stupid. Station is under Syndicate's attack. We need a whole fleet here, fast![/say]")

		saynn("[sayMale]But.. I need confirmation. At least from the captain. State your name and rank.[/sayMale]")

		saynn("Suddenly.. more blue rifts open in space.. bigger ones. And then.. Various spaceships of red color begin warping through them.. a lot of ships.. including one that is so huge it immediately collides with one of the asteroids, easily smashing through it, creating a chain reaction that causes other asteroids to bounce off each other.")

		saynn("[say=pc]They're here..[/say]")

		saynn("The big ship aims its giant laser at the station.. And starts charging it..")

		saynn("[say=tavi]You are as dumb as I thought. Send a fleet now![/say]")

		saynn("The giant ship fires its laser canon as soon as it can.. But one of the random flying asteroids saves you, taking the hit and melting into a million little rocks that start hitting the station like an ice hail.")

		saynn("Almost immediately, a loud siren activates throughout the whole station and all the lighting becomes red. Everything is shaking..")

		saynn("[sayMale]WARNING. WARNING. THE STATION'S HULL IS RECEIVING DAMAGE. ENGINEERING STAFF MUST PREVENT DEPRESSURIZATION AT ALL COSTS.[/sayMale]")

		saynn("[say=tavi]Is that enough of a confirmation, fucker?[/say]")

		saynn("[sayMale]We're sending what we can. Sit tight.[/sayMale]")

		saynn("Tavi ends the call and looks at you. She looks dead serious. Suddenly, more of these rifts open.. but this time it's the AlphaCorp ships joining in on the fun. Almost instantly, a giant battle begins in the void. It distracts the big ship from targeting the station.. but for how long..")

		saynn("[say=tavi]They will start boarding us soon. We will only have one shot at this. We must steal one of their ships and escape.[/say]")

		saynn("Sounds like you will need a weapon.. So you grab the captain's energy gun. Looks like it's set to lethal mode already. Good.")

		saynn("Many explosions happen outside the station.. explosions that you don't hear. But there are also the ones that you do.. they shake the floor hard. You can already hear the fighting happening throughout the whole station.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "tavi_drops_captain"):
		processTime(2*60)

	if(_action == "remove_collars"):
		processTime(3*60)
		getCharacter("tavi").getInventory().removeItemFromSlot(InventorySlot.Neck)
		GM.pc.getInventory().removeItemFromSlot(InventorySlot.Neck)

	if(_action == "tavi_calls_syndi"):
		processTime(5*60)

	setState(_action)
