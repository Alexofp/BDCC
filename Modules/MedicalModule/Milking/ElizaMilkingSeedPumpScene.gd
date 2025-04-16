extends SceneBase

var amountCollected = 0.0

func _init():
	sceneID = "ElizaMilkingSeedPumpScene"

func _run():
	if(state == ""):
		addCharacter("eliza")
		aimCameraAndSetLocName("med_milkingroom")
		playAnimation(StageScene.Grope, "tease", {pc="pc", npc="eliza", milkTank=true, bodyState={exposedCrotch=true}})
		saynn("You ask the doctor to milk you for your seed. She nods and brings you into the special room. She picks a stall that has some milking equipment installed..")

		saynn("You expose your {pc.penis} and wait for her orders. You feel excited a bit, your member is already getting hard..")

		saynn("[say=eliza]Perfect. Let's lock you in.[/say]")

		saynn("She gestures for you to get into the right spot.. in front of a long pipe.. that has some cuff-like restraints attached to it. Your eyes also notice a special pump that is connected to a big fluid tank with some flexible tubes.")

		saynn("Doctor's paw lands on your back and starts putting pressure on it, inviting you to bend forward.")

		addButton("Bend forward", "Do what she wants you to do", "get_locked")
	if(state == "get_locked"):
		playAnimation(StageScene.MilkingStallSolo, "start", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true, chains=[["hoseshort", "penisPump", "scene", "milktank"], ["short", "neck", "scene", "bottompipe"]]}})
		saynn("You follow the guidance of that paw, slowly bending forward and assuming the final position. You place your wrists in the offered holes for them in the restraints.. and watch as the doctor locks them up. Then, she also pulls out a short chain leash, attaching one end to your collar and the other to the sturdy pipe..")

		saynn("[say=eliza]We don't want our bull to run off unmilked, do we~.[/say]")

		saynn("Fair enough..")

		saynn("Eliza grabs that specialized penis pump and kneels near you. Her paws reach out to your {pc.penis}, carefully securing the pump onto your already erect cock. The negative pressure inside it allows it so sit on your crotch without any problems..")

		addButton("Continue", "See what happens next", "do_milk_start")
	if(state == "do_milk_start"):
		playAnimation(StageScene.MilkingStallSolo, "milking", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true, chains=[["hoseshort", "penisPump", "scene", "milktank"], ["short", "neck", "scene", "bottompipe"]]}})
		saynn("She turns on the pump and then sits in front of you, just admiring the process.")

		saynn("Almost immediately, the pump springs into action. It features a round soft 'pleasure' ring that begins its automated slide along your shaft, firmly hugging your girth.")

		saynn("[say=pc]Mhh..[/say]")

		saynn("It clearly lacks any.. love.. that a personal touch can give.. but it still feels good, each stroke sends a wave of sensations rippling down your length. Your cock responds with subtle twitches, precum dripping from its tip.")

		saynn("[say=eliza]Just let it do its job, don't hold back~.[/say]")

		saynn("You nod and just stand as still as you can, allowing the pump to stroke your member..")

		addButton("Continue", "See what happens next", "do_milk_fast")
	if(state == "do_milk_fast"):
		playAnimation(StageScene.MilkingStallSolo, "fast", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true, chains=[["hoseshort", "penisPump", "scene", "milktank"], ["short", "neck", "scene", "bottompipe"]]}})
		saynn("But stroking is not all that this industrial piece of technology can do. You suddenly feel the pump.. pulling on your cock.. it seems to alternate between syphoning most of the air out, creating a strong negative pressure inside.. and then pumping it back, making you feel like your cock is getting pleasured hard..")

		saynn("Together with that pleasure ring, your legs begin to feel weak, quiet grunts slipping from your lips.. It feels amazing.. like you're fucking the most tight pussy ever.. Your toes curl up as you squirm against the restraints and chains..")

		saynn("[say=pc]Mghhh-.. mhh..[/say]")

		saynn("The relentless stroking pushes you closer and closer to your edge. Eliza's smug smile shines brightly as she watches you endure it all. Your balls are twitching more.. you feel like you can't hold back anymore..")

		addButton("Cum", "Let it happen", "process_cum")
	if(state == "process_cum"):
		playAnimation(StageScene.MilkingStallSolo, "cum", {pc="pc", npc="eliza", bodyState={exposedCrotch=true, hard=true, chains=[["hoseshort", "penisPump", "scene", "milktank"], ["short", "neck", "scene", "bottompipe"]]}})
		saynn("You cum hard.. Your body shudders as your {pc.penis} starts to throb and shoot its load in juicy waves. You pant and grunt heavily while the clear tube of the pump begins to quickly fill with your thick, hot seed.. before it all gets pumped out into the connected fluid tank.")

		saynn("[say=eliza]Let it milk you dry.. We need every bit of that seed~.[/say]")

		saynn("[say=pc]Nghh..[/say]")

		saynn("Not like you have a choice in this, the pump just keeps stroking your throbbing cock and pleasuring it with negative pressure, extending your orgasm longer, each motion coaxing out and collecting more of your {pc.cum}.. until your balls begin to feel completely milked dry..")

		saynn("By the end of it, your body feels spent.. a satisfied smile curving Eliza's lips as she watches the seed level in the fluid tank rising from the last bits of your spunk reaching it.")

		saynn("[say=eliza]Pure.. perfection.[/say]")

		saynn("She switches off the pump and begins to undo the restraints..")

		addButton("Continue", "See what happens next", "undo_restraints")
	if(state == "undo_restraints"):
		playAnimation(StageScene.Duo, "stand", {npc="eliza"})
		GM.pc.setLocation("med_nearmilking")
		saynn("She helps you to get up, unclipping the leash, unlocking the cuffs and taking off the penis pump. Feels weird to be standing straight again.. but your cock not being stroked constantly feels even weirder..")

		saynn("[say=eliza]Thank you for being such an eager contributor~.[/say]")

		saynn("After that, she just brings you out into the corridor.")

		saynn("[say=eliza]Hope you will find your way back, I gotta go fill in some paperwork.[/say]")

		saynn("Time to go..")

		addButton("Continue", "See what happens next", "endthescene")

func _react(_action: String, _args):
	if(_action == "endthescene"):
		endScene()
		return

	if(_action == "get_locked"):
		processTime(5*60)
		var thePump = GlobalRegistry.createItem("PenisPump")
		GM.pc.getInventory().forceEquipStoreOtherUnlessRestraint(thePump)

	if(_action == "do_milk_start"):
		processTime(5*60)

	if(_action == "do_milk_fast"):
		processTime(3*60)

	if(_action == "process_cum"):
		amountCollected = GM.main.SCI.processMilkPlayerPenis()
		GM.pc.orgasmFrom("pc")

	if(_action == "undo_restraints"):
		processTime(3*60)
		GM.pc.getInventory().clearSlot(InventorySlot.Penis)

	setState(_action)

func saveData():
	var data = .saveData()

	data["amountCollected"] = amountCollected

	return data

func loadData(data):
	.loadData(data)

	amountCollected = SAVE.loadVar(data, "amountCollected", 0.0)
