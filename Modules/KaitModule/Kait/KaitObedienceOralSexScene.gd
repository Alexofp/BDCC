extends SceneBase

var kmaster = "master"
var kMaster = "Master"

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

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "kait_cuffed"):
		putOn("kait", "ringgag")
		putOn("kait", "blindfold")
		putOn("kait", "inmatewristcuffs")
		putOn("kait", "inmateanklecuffs")

	setState(_action)

func saveData():
	var data = .saveData()

	data["kmaster"] = kmaster
	data["kMaster"] = kMaster

	return data

func loadData(data):
	.loadData(data)

	kmaster = SAVE.loadVar(data, "kmaster", "master")
	kMaster = SAVE.loadVar(data, "kMaster", "Master")
