extends SceneBase

var kmaster = "master"
var kMaster = "Master"
var usedStrapon = false

func _init():
	sceneID = "KaitObedienceOralSexScene"

func _run():
	if(state == ""):
		#aimCameraAndSetLocName("hideout_chill")
		addCharacter("kait")
		playAnimation(StageScene.Duo, "stand", {npc="kait"})
		saynn("[say=pc]Kait. Come closer.[/say]")

		saynn("She does so quite swiftly, now standing in front of you.")

		saynn("[say=kait]Yeah?[/say]")

		saynn("[say=pc]Do you have some.. toys?[/say]")

		saynn("She looks around and then points at something.")

		saynn("[say=kait]Oh yeah, plenty. Ans was kind enough to share his supply. They're in one of the crates here. Probably that one.[/say]")

		saynn("You nod softly.")

		saynn("[say=kait]What do you need them for?[/say]")

		saynn("A small smirk eliminates your face.")

		saynn("[say=kait]Ohh..[/say]")

		saynn("Her voice gets quieter, barely above whispering.")

		saynn("[say=kait]What do you want me to do..[/say]")

		saynn("Well, that was easy. You can see subtle sparks of excitement in Kait's eyes, the tip of her tail twitching.")

		saynn("You start thinking about what you will need.")

		saynn("[say=pc]Bring me two sets of cuffs.. a ring gag.. a blindfold.. a buttplug.. lube.. and some chains.[/say]")

		saynn("She holds her chin a little low, her palms pressed against each other in front of her chest, fingers intertwined.")

		saynn("[say=kait]Of course![/say]")

		saynn("Kait turns around and dashes off towards one of the crates. She rummages through it until she finds what you ordered her to find.")

		saynn("[say=kait]It's all here.[/say]")

		saynn("She places things on one of the chairs.. so that they wouldn't be laying on the floor.")

		saynn("You point at the center of the room. Kait positions herself there.")

		saynn("[say=pc]Undress and present yourself.[/say]")

		saynn("[say=kait]Yes.. how should I..[/say]")

		saynn("[say=pc]"+str(kMaster)+".[/say]")

		saynn("[say=kait]Yes, "+str(kmaster)+".[/say]")

		saynn("Kait's digits move to the buttons of her shirt, undoing them one by one. She locks her gaze forward like she was told to previously, trying to avoid staring at you specifically. As she takes off her shirt, it reveals the cute perky breasts beneath.")

		saynn("With a smooth motion, she pushes her shorts off of her legs, letting them hit the floor. The snow leopard steps out of them and picks them up. She puts all her clothing on another chair.")

		addButton("Continue", "See what happens next", "buttplug_stuff")
	if(state == "buttplug_stuff"):
		addCharacter("kait", ["naked"])
		playAnimation(StageScene.SexStealth, "rub", {pc="pc", npc="kait", npcBodyState={naked=true, hard=true}})
		saynn("And so she is not standing completely naked before you. Her dark nipples are already a bit stiff, her pussy slit visible between her fluffy thighs. She puts her palms by her sides, rear paws are roughly at her shoulder-width.")

		saynn("[say=pc]Hands behind your back.[/say]")

		saynn("She complies instantly, her arms crossing behind her back, pulling her shoulders back and pushing her chest forward. The corners of her mouth raise a little.")

		saynn("[say=pc]Turn around. Spread your legs more.[/say]")

		saynn("Kait spins around, presenting her back to you. She sticks her butt out and lets her rear paws slide apart further.")

		saynn("[say=kait]Is this good, "+str(kmaster)+"?[/say]")

		saynn("[say=pc]Yes. Stay like this.[/say]")

		saynn("You move to the chair and grab two things.. a tube of lube and a small rubber buttplug.")

		saynn("Then you approach her, your hand coming to rest on her back, stroking her fur. She shivers at the touch. You let your digits trail down, over the curves of her butt and back up to her fluffy tail. You move it aside, revealing her dark-colored tight-looking tailhole.")

		saynn("[say=kait]Mhh..[/say]")

		saynn("You trace the rim of her hole with your fingertip, feeling it clench slightly. Her breath hitches.")

		saynn("[say=pc]Relax for me, Kait.[/say]")

		saynn("You squeeze a generous amount of lube onto your digits. Then you begin rubbing it into her anal star, the sudden coolness making her flinch. Slowly, you work the lube into her rim, spreading it with gentle circles.")

		saynn("[say=kait]Ahh.. hh..[/say]")

		saynn("One of your fingers stretches her tailhole with ease now. Her walls clench around you, tight and warm. Kait breathes deeply, little cute noises keep escaping her.")

		saynn("You work your finger in and out, coating her walls with lube. Then you add a second finger, stretching her gently. Her hips sways slightly from the sensations.")

		saynn("[say=kait]Mmhh-..[/say]")

		saynn("[say=pc]So eager.[/say]")

		saynn("[say=kait]..can't help it.[/say]")

		saynn("After that, you pull your digits out and put some lube onto the buttplug instead. Its thick part is about twice as fat as your two digits together.")

		saynn("[say=pc]Let me know if it's too much for you.[/say]")

		saynn("[say=kait]You will know~. It might not be enough, who knows.[/say]")

		saynn("You press the tip against her tailhole. She gasps as you start working it in, turning and prodding. When the widest part stretches her ring, she arches her back with a moan.")

		saynn("[say=kait]Ahh.. ngh..[/say]")

		saynn("And then it slides in easily, only leaving the base visible. The plug seems to be sitting very snuggly in her tailhole, her walls clenching around it, adjusting.")

		saynn("[say=kait]Ah.. it's very much enough..[/say]")

		saynn("The cuffs and the other toys are next..")

		addButton("Continue", "See what happens next", "kait_cuffed")
	if(state == "kait_cuffed"):
		playAnimation(StageScene.Duo, "stand", {npc="kait", npcBodyState={naked=true, leashedBy="pc"}})
		saynn("You grab her wrists and put cuffs on them, forcing them to be behind her. Then you crouch and do the same to her ankles, making her somewhat helpless. But being somewhat helpless is not enough..")

		saynn("You grab the ring gag next. When Kait sees the metal ring, she opens her mouth without being asked, her feline tongue lolling out slightly. You press the ring between her teeth and then tighten the straps around her head. The ring now holds her mouth open.. always.")

		saynn("[say=kait]Mmm.. mh..[/say]")

		saynn("She tries to speak but can only manage muffled sounds. A string of drool escapes from the corner of her mouth.")

		saynn("[say=pc]Cute.[/say]")

		saynn("She pouts, her tail does a fast flick.")

		saynn("[say=pc]Don't make me cuff your tail too.[/say]")

		saynn("[say=kait]..mmm..[/say]")

		saynn("You grab the blindfold next. Kait doesn't protest, giving you full access to her cyan eyes. And so you wrap the black fabric around her head, stealing her sight.")

		saynn("Now.. she is truly helpless.")

		saynn("[say=kait]Mmm..![/say]")

		saynn("[say=pc]You will have to put your full trust into me.[/say]")

		saynn("Her tail swishes nervously.. but she nods.")

		saynn("With a swift motion, you click a chain to her collar.")

		saynn("[say=pc]Let's get you somewhere that's better. Better for me.[/say]")

		saynn("You look around and see a bigger crate. It has hooks in a few places too, it's perfect.")

		saynn("Step by step, you lead Kait across the room, tugging on the leash gently. She can't walk normally so she has to hop instead, her exposed breasts bouncing with each movement, her tail swishing wildly behind her, trying to maintain balance.")

		addButton("Continue", "See what happens next", "tie_kait_to_crate")
	if(state == "tie_kait_to_crate"):
		playAnimation(StageScene.SexOralTable, "tease", {pc="pc", npc="kait", npcBodyState={naked=true, hard=true}})
		saynn("When you arrive, you remove the chain and instead use it to start securing Kait to the crate. All her cuffs get chained to its sides, making her spread her legs and arms.")

		saynn("[say=kait]Mmmhh..[/say]")

		saynn("Perfect. You admire the work. Kait's back is resting on top of the crate.. her head hangs off the edge, her mouth open and waiting.")

		saynn("She is at your mercy.")

		addButtonWithChecks("Blowjob", "Make Kait suck you off in this position!", "bj", [], [[ButtonChecks.HasReachablePenis]])
		addButtonWithChecks("Pussy licking", "Make Kait lick your slit in this position!", "pussy_lick", [], [[ButtonChecks.HasReachableVagina]])
	if(state == "bj"):
		playAnimation(StageScene.SexOralTable, "suckinside", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("You"+str(" secure a strapon harness around your head and" if usedStrapon else "")+" position yourself near Kait's head. She can't see you but her ears do turn to try to find you. A muffled sound escapes her, a noise of curiosity.")

		saynn(""+str("Your {pc.penis}.. already hard, the tip shy with precum. " if !usedStrapon else "")+"You grip the base and carefully guide it toward her open mouth, letting the head slide through the metal ring and press against her tongue.")

		saynn("[say=kait]Mmm..[/say]")

		saynn("Her tongue springs into action, sliding over the"+str(" rubber tip" if usedStrapon else " tip, catching a lonely drop of pre")+". She can't close her lips around you because of the ring but she still does her best, suckling at the head.")

		saynn("You push forward slowly, more of your"+str(" shiny" if usedStrapon else "")+" shaft sliding past her teeth and tongue, bending against the back of her mouth and going down her throat..")

		saynn("[say=kait]Mmmh.. hh..[/say]")

		saynn("Her body begins to tense up, her bound hands clenching into fists. A few seconds later, she starts gagging, her throat suddenly spasming around your "+str("shaft" if !usedStrapon else "toy")+", warm and tight.")

		saynn("You pull out a bit and pause, allowing her to calm down and adjust to you.")

		saynn("You hear Kait taking a shaky breath through her nostrils, her inner walls begin to relax again. Her tongue starts curling around your"+str(" fake" if usedStrapon else "")+" member, teasing it.")

		saynn("Slowly, you push in again, your "+str("cock" if !usedStrapon else "toy")+"'s tip pressing against the back of her mouth more.. going down her throat. She is holding a bit better this time. But soon the tension returns.. followed by a choked sound erupting from her throat. Tears begin to leak from under the blindfold.")

		saynn("You pull back.")

		saynn("[say=pc]Is this too much?[/say]")

		saynn("She shakes her head, still with your"+str(" rubber" if usedStrapon else "")+" cock inside it. Her fists unclench to show some peace signs.")

		saynn("[say=pc]Cute.[/say]")

		saynn("She growls.. the vibrations feel quite nice.")

		saynn("[say=pc]Ohh, you should keep doing that.[/say]")

		saynn("[say=kait]Gr-r..[/say]")

		saynn("Kait tenses her jaw.")

		addButton("Continue", "See what happens next", "bj_sex")
	if(state == "bj_sex"):
		playAnimation(StageScene.SexOralTable, "suck", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("[say=pc]Take it all now, girl.[/say]")

		saynn("You withdraw until only the tip remains.. and then thrust forward again, stretching her throat. This time you don't stop, fucking her mouth slowly. She takes the first few thrusts okay but soon she starts gagging again, her throat getting tight around"+str(" you" if !usedStrapon else " the toy")+". Each pull lets her gasp for air quickly before you block it again.")

		saynn("[say=kait]Gllk..! Hhkk..[/say]")

		saynn("Her body is squirming against the cuffs, the metal chains clinking against the crate. Her perky tits bounce with each thrust, her dark nips looking stiff. That buttplug is probably shifting quite a lot inside her tailhole.. especially if it clenches just as much as her throat.")

		saynn("You look down and notice her neck bulging, the outline of your "+str("cock" if !usedStrapon else "strapon")+" moving back and forth.")

		saynn("[say=pc]Hm..[/say]")

		saynn("[say=kait]Mhh?..[/say]")

		saynn("You reach down and wrap your hand around her neck, feeling that bulge. You can feel her pulse. She squirms harder, her throat tightening further.. it makes you want to increase the pace.")

		addButton("Continue", "See what happens next", "bj_fast")
	if(state == "bj_fast"):
		playAnimation(StageScene.SexOralTable, "suckfast", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		saynn("And so you start thrusting faster. Harder. Your "+str("balls" if !usedStrapon else "hips")+" slap against her face. Kait's throat is making hot wet noises and slurps, her gagging becoming more desperate. Her tongue is still brushing against "+str("your" if !usedStrapon else "the")+" shaft.")

		saynn("[say=kait]Hk.. ghk.. glk.. glkhh..[/say]")

		if (!usedStrapon):
			saynn("[say=pc]I'm sorry kitty, your throat feels too good.[/say]")

		else:
			saynn("[say=pc]I'm sorry kitty, this is too fun.[/say]")

		saynn("Her digits show peace signs again.. much shakier versions of them.")

		if (!usedStrapon):
			saynn("Your balls begin to twitch. You're getting close fast.")

			saynn("You grab her head with both hands and pound into her, not holding back. Your cock ravages her tight throat, making her choke on it, her body trembling.")

			addButton("Cum inside!", "Stuff that throat", "bj_cum")
		else:
			saynn("Even though you don't feel a thing through the strapon.. it's still hot as fuck to be railing Kait's mouth.")

			saynn("You grab her head with both hands and pound into her, not holding back. The rubber cock ravages her tight throat, making her choke on it, her body trembling.")

			addButton("Last push!", "Stuff that throat", "bj_cum_strapon")
	if(state == "bj_cum"):
		playAnimation(StageScene.SexOralTable, "suckinside", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!usedStrapon):
			saynn("And then it happens. You start grunting while your dick starts throbbing inside her.. tip exploding with waves of your seed.. one after another. Kait has no choice but to swallow as you give her no choice.. shooting your whole load deep down her throat. At the same time, her inner walls clench hard around you, milking every drop.")

			saynn("[say=pc]Mghh.. fuck, this feels good.[/say]")

			saynn("Poor kitty is working hard beneath you, her whole body is tensed up, her every muscle is screaming for oxygen. Oxygen that you're blocking with your pulsing member.")

			saynn("[say=kait]Glk.. glk.. glk..[/say]")

			saynn("Time to let the kitty breathe again.")

		else:
			saynn("And then, with the last push, you shove the whole rubber length inside.. and stay like that. Kait has no choice but to endure it, her inner walls clenching hard around the toy, trying to milk it.")

			saynn("[say=pc]Yeah.. if this was a cock, it would have pumped your belly full.[/say]")

			saynn("Poor kitty is working hard beneath you, her whole body is tensed up, her every muscle is screaming for oxygen. Oxygen that you're blocking with your strapon.")

			saynn("[say=kait]Glk.. glk.. glk..[/say]")

			saynn("Time to let the kitty breathe again.")

		addButton("Continue", "See what happens next", "bj_after")
	if(state == "bj_after"):
		playAnimation(StageScene.SexOralTable, "tease", {pc="pc", npc="kait", bodyState={naked=true, hard=true}, npcBodyState={naked=true, hard=true}})
		if (!usedStrapon):
			saynn("Finally, you pull out. Kait's mouth remains open, gasping, a trail of saliva and {pc.cum} connecting her lips to your messy cock. She coughs, her belly moves up and down fast.")

			saynn("Slowly, she relaxes. There is some of your seed in her mouth still.. but she does her best to swallow it.")

		else:
			saynn("Finally, you pull out. Kait's mouth remains open, gasping, a trail of saliva connecting her lips to your wet rubber toy. She coughs, her belly moves up and down fast.")

			saynn("Slowly, she relaxes.")

		saynn("[say=kait]Hhhk.. haa.. h.h..[/say]")

		saynn("You give her scritches and pats.. and hear the exhausted purr escaping her.")

		saynn("[say=pc]Good girl. Very good girl.[/say]")

		saynn("Kait is panting like hell still.. so you let her rest for a bit.")

		addButton("Unlock her", "Let her get up", "bj_after_after")
	if(state == "bj_after_after"):
		playAnimation(StageScene.Duo, "stand", {npc="kait", npcBodyState={naked=true}})
		saynn("After Kait has come back to her senses, you unlock all the restraints and help her get up.")

		saynn("The first thing that you notice.. is a big wet puddle of her juices that she left on the crate. Her thighs are quite messy too.")

		saynn("[say=pc]Looks like you liked it.[/say]")

		saynn("[say=kait]Pff..[/say]")

		saynn("She opens and closes her jaw a few times, trying to make the sore muscles wake up.")

		saynn("[say=kait]That was.. a nice challenge.[/say]")

		saynn("[say=pc]Challenge, huh?[/say]")

		saynn("She puts on a tired smile.")

		saynn("[say=kait]Yes, "+str(kmaster)+". Wait, you forgot one thing..[/say]")

		saynn("She reaches behind herself.. under her tail.")

		saynn("[say=kait]Mhh.. ah~..[/say]")

		saynn("You hear cute moans from the snow leopard as she starts pulling something out, bit by bit.")

		saynn("[say=kait]Fuck me.. it feels much bigger than it looks..[/say]")

		saynn("Then, with a satisfying pop, she.. extracts.. the wet buttplug and presents it to you.")

		saynn("[say=kait]Here. You forgot this.[/say]")

		saynn("[say=pc]My bad.[/say]")

		saynn("She raises her chin high.. and starts leaving the room.")

		saynn("Then she returns and picks up her clothes.")

		saynn("[say=kait]I need a shower..[/say]")

		saynn("You let her have it.")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kait_cuffed"):
		putOn("kait", "ringgag")
		putOn("kait", "blindfold")
		putOn("kait", "inmatewristcuffs")
		putOn("kait", "inmateanklecuffs")

	if(_action == "bj_cum"):
		getCharacter("kait").cummedInMouthBy("pc", FluidSource.Penis)
		GM.pc.orgasmFrom("kait")

	if(_action == "bj_cum_strapon"):
		getCharacter("kait").cummedInMouthBy("pc", FluidSource.Strapon)
		GM.pc.orgasmFrom("kait")
		setState("bj_cum")
		return

	if(_action == "bj_after"):
		processTime(5*60)

	if(_action == "bj_after_after"):
		putOff("kait", "ringgag")
		putOff("kait", "blindfold")
		putOff("kait", "inmatewristcuffs")
		putOff("kait", "inmateanklecuffs")

	setState(_action)

func saveData():
	var data = .saveData()

	data["kmaster"] = kmaster
	data["kMaster"] = kMaster
	data["usedStrapon"] = usedStrapon

	return data

func loadData(data):
	.loadData(data)

	kmaster = SAVE.loadVar(data, "kmaster", "master")
	kMaster = SAVE.loadVar(data, "kMaster", "Master")
	usedStrapon = SAVE.loadVar(data, "usedStrapon", false)
