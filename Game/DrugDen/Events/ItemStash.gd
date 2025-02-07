extends DrugDenEventBase

var trapLevel:int = 0 # 0 = 5% trap, 1 = 50% trap, 2 = 95% trap
var trapType:int = 0 # 0 = pain, 1 = lust, 2 = bdsm
var stashDesc:String = ""

func _init():
	id = "ItemStash"
	eventWeight = 0.5

func onSpawn(_drugDen):
	trapType = RNG.randi_range(0, 2)
	
	trapLevel = 0
	if(RNG.chance(50)):
		if(RNG.chance(70)):
			trapLevel = 1
		else:
			trapLevel = 2
	
	
	var sus1:bool = false
	var sus2:bool = false
	if(trapLevel >= 2):
		sus1 = true
		sus2 = true
	if(trapLevel == 1):
		sus1 = RNG.chance(50)
		sus2 = !sus1
	
	var descsDB:Array = [
		{
			text = "A rusted old toolbox sits near the base of a broken pipe. Its lid is slightly ajar, revealing a glimpse of what’s inside. {slot1} The surrounding dust is undisturbed, as if it’s been sitting here for years. {slot2}",
			slot1sus = [
				"The latch is free of rust, with tiny scratches near the edges.",
			],
			slot1 = [
				"The latch is corroded, barely holding the lid shut.",
			],
			slot2sus = [
				"A faint chemical scent lingers around it.",
			],
			slot2 = [
				"The air here smells stale, nothing out of the ordinary.",
			],
		},
		{
			text = "A dusty backpack rests against the tunnel wall, its strap half-torn from age. {slot1} The zipper is mostly closed, though it looks like someone rummaged through it before. {slot2}",
			slot1sus = [
				"The fabric near the bottom is slightly raised, as if something stiff is underneath.",
			],
			slot1 = [
				"The material is sunken in, collapsing under its own weight.",
			],
			slot2sus = [
				"A few loose threads near the zipper are sticking up, recently pulled apart.",
			],
			slot2 = [
				"The stitching is fully intact, if a little worn.",
			],
		},
		{
			text = "An old wooden supply crate leans against the cold wall, its surface covered in scratches and graffiti. {slot1} A few nails are loose, suggesting it’s been opened before. {slot2}",
			slot1sus = [
				"There’s a faint indentation around the edges, as if the lid was pressed back into place.",
			],
			slot1 = [
				"The lid sits unevenly, one side slightly raised higher than the other.",
			],
			slot2sus = [
				"The graffiti near the bottom looks smudged, like something brushed against it recently.",
			],
			slot2 = [
				"Dust has settled into the grooves of the graffiti, blending it into the wood.",
			],
		},
		{
			text = "A dented metal locker stands upright, its door slightly ajar. {slot1} A faded number is scratched into its surface, almost unreadable. {slot2}",
			slot1sus = [
				"The handle has a thin, uneven gap between it and the door.",
			],
			slot1 = [
				"The handle is flush against the surface, stiff with rust.",
			],
			slot2sus = [
				"The hinges have tiny flakes of disturbed paint around them.",
			],
			slot2 = [
				"The hinges are coated in a thick layer of grime.",
			],
		},
		{
			text = "A box sits in the corner, its paint chipped and faded. {slot1} The latch is still intact, though it looks a little worn. {slot2}",
			slot1sus = [
				"A faint outline of a handprint is visible in the dust around the latch.",
			],
			slot1 = [
				"The dust is settled evenly, untouched for a long time.",
			],
			slot2sus = [
				"The lid doesn’t fully sit flush, leaving a tiny, uneven gap.",
			],
			slot2 = [
				"The lid is firmly shut, the edges lined up perfectly.",
			],
		},
		{
			text = "Behind a loose panel, you discover a small hidden cache. {slot1} A tattered cloth is draped over it, as if someone tried to hide it. {slot2}",
			slot1sus = [
				"The cloth has a single clean fold along one side, different from the rest of the wrinkles.",
			],
			slot1 = [
				"The fabric is crumpled and stiff with dust.",
			],
			slot2sus = [
				"The inside edges of the panel look strangely smooth compared to the rough concrete around it.",
			],
			slot2 = [
				"The panel edges are chipped and uneven, blending into the wall.",
			],
		},
		{
			text = "A sleek metal case rests atop a pile of junk, reflecting a dim light. {slot1} The locking mechanism looks simple, just a basic latch. {slot2}",
			slot1sus = [
				"The surrounding junk is pushed slightly outward, like the case was set down more recently.",
			],
			slot1 = [
				"The case is partially buried under debris, settled in over time.",
			],
			slot2sus = [
				"There’s a small, hairline scratch near the latch that catches the light.",
			],
			slot2 = [
				"The surface is dull, scuffed from age but nothing fresh.",
			],
		},
		{
			text = "A hollowed-out section of concrete reveals a stash tucked inside. {slot1} The space is just big enough for a small cache of supplies. {slot2}",
			slot1sus = [
				"The floor immediately in front of it is slightly less dusty than the surrounding area.",
			],
			slot1 = [
				"A thick, undisturbed layer of dust coats the floor.",
			],
			slot2sus = [
				"A faintly bent piece of metal rests at the bottom of the stash, barely out of place.",
			],
			slot2 = [
				"The bottom is littered with debris, nothing that stands out.",
			],
		},
	]
	
	var pickedDescEntry:Dictionary = RNG.pick(descsDB)
	
	stashDesc = pickedDescEntry["text"]
	if(sus1):
		stashDesc = stashDesc.replace("{slot1}", RNG.pick(pickedDescEntry["slot1sus"]))
	else:
		stashDesc = stashDesc.replace("{slot1}", RNG.pick(pickedDescEntry["slot1"]))
	if(sus2):
		stashDesc = stashDesc.replace("{slot2}", RNG.pick(pickedDescEntry["slot2sus"]))
	else:
		stashDesc = stashDesc.replace("{slot2}", RNG.pick(pickedDescEntry["slot2"]))
	

func getMaxPerFloor() -> int:
	return 1

func getCooldown() -> int:
	return 0 #RNG.randi_range(1, 2)

func getInteractInfo() -> Dictionary:
	return {
		text = "You notice something interesting..\n\n"+stashDesc+"\n\nDo you wanna try to loot it?",
		actions = [
			{
				id = "loot",
				name = "Loot it",
				desc = "See if you can find some helpful stuff!",
				args = [],
				disabled = false,
			},
		],
	}

func doInteract(_actionID:String, _args:Array = []) -> Dictionary:
	var trapChance:float = 5.0
	if(trapLevel == 1):
		trapChance = 50.0
	if(trapLevel >= 2):
		trapChance = 95.0
		
	if(RNG.chance(trapChance)):
		var beginText:String = "[b]It was trapped ("+str(Util.roundF(trapChance, 1))+"% chance)![/b] "
		if(trapType == 0):
			GM.pc.addPain(RNG.randi_range(20, 40))
			return {text=beginText+"You got shocked as soon as you touched the stash. Ow!", ended=true, anim=[StageScene.Solo, "hurt"]}
		elif(trapType == 1):
			GM.pc.addLust(RNG.randi_range(40, 80))
			return {text=beginText+"A cloud of aprorosiac gas surrounds you, making you extremely horny!", ended=true, anim=[StageScene.Solo, "stand"]}
		else:
			GM.pc.getInventory().forceRestraintsWithTag(ItemTag.CanBeForcedByGuards, 2)
			return {text=beginText+"Restraints get forced upon you!", ended=true, anim=[StageScene.Solo, "hurt"]}
	else:
		return {text="You check the stash for anything useful..", noLootText="Sadly, it's empty.", lootTable="junkieStash", ended=true}

func getMapIcon():
	return RoomStuff.RoomSprite.IMPORTANT

func saveData() -> Dictionary:
	return {
		trapLevel = trapLevel,
		stashDesc = stashDesc,
		trapType = trapType,
	}

func loadData(_data:Dictionary):
	trapLevel = SAVE.loadVar(_data, "trapLevel", 0)
	stashDesc = SAVE.loadVar(_data, "stashDesc", "")
	trapType = SAVE.loadVar(_data, "trapType", 0)
