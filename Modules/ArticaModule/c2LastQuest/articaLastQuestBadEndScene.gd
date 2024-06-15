extends SceneBase

func _init():
	sceneID = "articaLastQuestBadEndScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		saynn("[say=pc]I have a.. problem.[/say]")

		saynn("The feline raises a brow, eyeing you out from ears to toes. She then reaches for something.")

		saynn("[say=eliza]I know exactly what can help! You just have to sign this little document over..[/say]")

		saynn("[say=pc]Not with me.[/say]")

		saynn("[say=eliza]Aw..[/say]")

		saynn("She puts the form away and leans in closer.")

		saynn("[say=pc]One of the inmates isn't doing well. It's not urgent.. but you know.[/say]")

		saynn("[say=eliza]Huh. Let's go take a look.[/say]")

		addButton("Artica", "Bring the doctor to Artica's cell", "in_cell")
	if(state == "in_cell"):
		aimCameraAndSetLocName("cellblock_lilac_nearcell")
		addCharacter("artica", ["sad", "naked"])
		playAnimation(StageScene.SexStart, "start", {pc="eliza", npc="artica", npcBodyState={naked=true}})
		saynn("As you and doctor Quinn step into Artica's cell, you find her on her bed, naked, pressed into the corner, her arms wrapped around her knees. It's like she is taking the least space possible.")

		saynn("The feline tries to comfort the sad fluff, gently placing her paw on the girl's shoulder.")

		saynn("[say=eliza]Hey-y there, sweetheart. Why are you hiding there?[/say]")

		saynn("[say=artica]..eek.. I.. um.. s-sorr..y..[/say]")

		saynn("Artica reaches for her ear, her digits rubbing it.")

		saynn("[say=eliza]No need to be sorry, I'm here to help you.[/say]")

		saynn("[say=pc]She lost a piercing.. Well, it got stolen apparently. It looked like a dreamcatcher.[/say]")

		saynn("Doctor rubs her chin.")

		saynn("[say=eliza]Huh. Help me understand. You miss that dreamcatcher, sweetie?[/say]")

		saynn("Artica nods..")

		saynn("[say=artica]..t-tr..tribe..[/say]")

		saynn("[say=eliza]Tribe. Right. You miss your tribe a lot?[/say]")

		saynn("Artica.. stays quiet. And then shrugs.")

		saynn("[say=eliza]Okay. So you really miss your dreamcatcher?[/say]")

		saynn("You can hear Artica sniffle.")

		saynn("[say=artica]L..Link..[/say]")

		saynn("[say=eliza]You're saying that it's a link.. A link to what? To your tribe?[/say]")

		saynn("The girl nods. The feline gently pats the sad fluff. There doesn't seem to be much reaction though.")

		saynn("[say=eliza]I see.. Last question.. how do you feel overall? What kind of thoughts are going through your mind? Dark ones, good ones? Nightmares?[/say]")

		saynn("Artica hears the last word.. and shivers.")

		saynn("[say=artica]..eep..[/say]")

		saynn("[say=eliza]Uh huh.. Thank you, sweetheart. Don't worry.. Artica.. that's your name right? Everything is gonna be okay[/say]")

		saynn("Doctor Quinn looks at you and nods towards the exit.")

		saynn("[say=eliza]I will be back soon, girl.[/say]")

		addButton("Chat", "See what Quinn has to say", "outside_cell")
	if(state == "outside_cell"):
		removeCharacter("artica")
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		saynn("You and doctor Quinn step out of Artica's cell. The feline sighs and stares somewhere into the distance.")

		saynn("[say=eliza]Bag under the eyes.. clearly has trouble sleeping.. Lack of interest.. Emotional detachment.. Dark thoughts..[/say]")

		saynn("She hums.")

		saynn("[say=eliza]Could be a case of depression. Was she always.. sad.. you know?[/say]")

		saynn("[say=pc]She was shy. Sad, I'm not sure.[/say]")

		saynn("The feline hums more.")

		saynn("[say=eliza]Could be a case of PTSD. Getting imprisoned sometimes becomes quite a traumatic event. It can leave a mark. The signs don't appear instantly too, one day you will just begin to see nightmares..[/say]")

		saynn("What she is saying is probably not wrong.. but you feel like there is an obvious reason here..")

		saynn("[say=pc]What about the dreamcatcher?[/say]")

		saynn("Quinn looks at you.")

		saynn("[say=eliza]What about it?[/say]")

		saynn("[say=pc]What if that's the reason?[/say]")

		saynn("The feline raises a brow.")

		saynn("[say=eliza]Losing something can cause grief. It can make you sad, sure.. How often do you lock up in your room over a lost piece of jewelry?[/say]")

		saynn("You shrug.")

		saynn("[say=pc]It seems to be special to her. You heard Artica yourself.[/say]")

		saynn("[say=eliza]When someone has that strong of an attachment towards some object.. It's unhealthy to begin with. Don't you agree?[/say]")

		saynn("[say=pc]It's a link. I guess it's how she keeps a connection to her people.[/say]")

		saynn("[say=eliza]I really don't want to seem mean.. but I'm not a shaman. I'm a doctor. Science doesn't know everything about how a person's mind works.. but it knows a lot. A metaphorical missing link I can do nothing about.. because.. you know..[/say]")

		saynn("You get a feeling that she doesn't trust Artica..")

		saynn("[say=eliza]She is from a tribe too.. wow. How old is that concept even? I think.. we gotta upgrade her mind a little. Give it a little reset while we're at it. Yeah, I think that sounds perfect.[/say]")

		saynn("What. The feline suddenly began talking faster, her hand reaching for her datapad.")

		saynn("[say=pc]Wait, wait. What do you mean?[/say]")

		saynn("[say=eliza]I meant what I meant.. Artica's mind is corrupted and we need to reset it.[/say]")

		saynn("[say=pc]Reset how?[/say]")

		saynn("Quinn smiles seeing your concerns.")

		saynn("[say=eliza]Hypnosis. With some careful and precise.. intervention.. we can make her forget that she had that dreamcatcher to begin with. And all will be good.[/say]")

		saynn("Sounds a lot like.. mind reprogramming..")

		saynn("Quinn looks around, focussing on the purple trims that the walls have here.")

		saynn("[say=eliza]And since she is a lilac.. Might as well increase her libido a bit while we're at it, why not?[/say]")

		saynn("Do you want to reprogram Artica's mind?")

		saynn("If you do, you won't be able to find her dreamcatcher anymore.. but you won't have to, too.")

		addButton("Reprogram", "Agree to reprogram Artica's mind and turn her into a perfect slut", "agree_reprogram")
		addButton("No", "You'd rather find the dreamcatcher", "refuse")
	if(state == "refuse"):
		GM.pc.setLocation("cellblock_lilac_nearcell")
		saynn("[say=pc]No. I don't think it's a good idea.[/say]")

		saynn("Doctor's smile goes away, her eyes looking a bit mean now.")

		saynn("[say=eliza]Really? You'd rather let her suffer?[/say]")

		saynn("[say=pc]I'd rather her keep her memories and personality. I will find the dreamcatcher.[/say]")

		saynn("She rolls her eyes visibly, her lips smacking against each other.")

		saynn("[say=eliza]Good luck, I guess. I doubt that it will change anything, our brains don't need to be connected into some kind of network with antennas to function.[/say]")

		saynn("[say=pc]I will try.[/say]")

		saynn("Doctor Quinn shrugs.. and puts the datapad away.")

		saynn("[say=eliza]When it all fails.. You know where to find me.[/say]")

		saynn("And just like that, she leaves.. finally.")

		addButton("Continue", "See what happens next", "endthescene")
	if(state == "agree_reprogram"):
		addCharacter("artica", ["sad", "naked"])
		playAnimation(StageScene.Solo, "stand", {pc="artica", bodyState={naked=true}})
		saynn("After considering it for a while.. you think that it's worth it. A perfect solution for a tribal girl like Artica.")

		saynn("[say=pc]Yeah.. let's do it.[/say]")

		saynn("Doctor Quinn nods and opens some kind of menu on her datapad. She presses a button.. and the door to Artica's cell closes.. trapping the fluff inside.")

		saynn("Artica sees that.. her stare turned concerned. She finds enough strength in her to get up and approach the reinforced glass window..")

		saynn("[say=artica]Um.. w.wh..[/say]")

		saynn("Doctor presses another button.. and the vents inside the cell open wide.. before proceeding to release some kind of.. pink gas.. It was heavier than air so it was mostly just covering the ground at first.. but it was steadily filling the whole cell over time..")

		saynn("[say=eliza]Don't worry, Artica. Everything will be alright soon~.[/say]")

		saynn("Doctor turns to you and says something quietly..")

		saynn("[say=eliza]Sleep toxin. We need to get her to the medical wing.[/say]")

		saynn("Artica sees the pink mist.. and begins to panic.")

		saynn("[say=artica]..eep.. E-eep..[/say]")

		saynn("You can see fear in her cyan eyes as she tries to open the door.. but is unable to.. the pink gas is now at her crotch level.")

		saynn("[say=eliza]I thought you wanted to stay in your cell~. Just breathe it in, it's not harmless, trust me.[/say]")

		saynn("Artica shakes her head.. and bangs on the reinforced window.. the cell seems to be fully isolated, none of the gas is leaking out..")

		saynn("[say=artica]P-p.. please.. n-no..[/say]")

		saynn("[say=pc]It will be okay. Your dreamcatcher problem will be solved soon.[/say]")

		saynn("The gas is now hugging her breasts.. and raising higher.. forcing Artica to stand high on her toes.")

		saynn("[say=artica]S-solv.. s-solved?.. h-h.. how.. eep..[/say]")

		saynn("[say=pc]You won't need it anymore.[/say]")

		saynn("Artica climbs her bed to get some more breathing room.. literally.. You realize that it might end badly if she falls from it..")

		saynn("[say=artica]N-no..nn..[/say]")

		saynn("[say=pc]Hey.. Artica, listen to me. Please get down, you will hurt yourself.[/say]")

		saynn("She shakes her head, her eyes full of terror.. She only has a few more seconds before the gas fills the whole room..")

		saynn("[say=pc]Please. I promise that it will be okay. Do you trust me?[/say]")

		saynn("Artica hears that and stays quiet.. her whole body shaking.. She looks at you.. and then at the pink mist.. before making her decision.")

		saynn("[say=artica]I-I.. um.. ..o-okay..[/say]")

		saynn("Artica willingly plunges herself into the pink smoke, getting off her bed and just sitting on it instead.. awaiting her fate.")

		saynn("She holds her breath for as long as possible.. But when the gas eventually begins to fill her lungs, her upper body begins to sway to the side.. She looks at you through the pink haze.. before losing consciousness.. her head hitting her soft pillow..")

		saynn("[say=eliza]Great! Let's get her to medbay![/say]")

		saynn("Doctor Quinn calls in some nurses.. while waiting for the pink smoke to get siphoned out of that cell.")


func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "in_cell"):
		processTime(5*60)

	if(_action == "outside_cell"):
		processTime(5*60)

	if(_action == "agree_reprogram"):
		processTime(3*60)
		setFlag("ArticaModule.LQArticaGotBrainwashed", true)

	setState(_action)
