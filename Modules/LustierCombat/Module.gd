extends Module

var hooks = [
	["res://Scenes/EncountersMenuScene.gd",
		
	]
]

func _init():
	id = "LustierCombat"
	author = "bringulbangul"
	events = [
		"res://Modules/LustierCombat/populate_pc_topics.gd",
	]
	lustActions = [
		"res://Modules/LustierCombat/NpcLustActions/NpcAnalSpreadOpen.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcBraPullUp.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcBraShakeOff.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcBreastsRubNipples.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcButtRub.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcMiscLickLips.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcMiscSwayHips.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcPantiesMoveAside.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcPantiesPullDown.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcPantiesShakeOff.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcStartSpreadPussy.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcStartStrokeCock.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcTeaseBreasts.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcTeaseCock.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcTeasePussy.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcUniformExposeChest.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcUniformExposeCrotch.gd",
		"res://Modules/LustierCombat/NpcLustActions/NpcUniformShakeShortsOff.gd",
	]
	
func getFlags():
	return {}


func preInit(): # Called before anything gets registered
	pass

# Module files:
# populate_pc_topics will simply populate the lust interest topics list (because the player's list starts as null)
# NpcLustActions: copied and pasted from the player's lust actions, with some notable changes:
#	Changed the id so it's a seperate lust action
#	Removed explicit references to GM.pc, and just use a BaseCharacter instead
#	Hid the action if the character is the player
#	Changed the priority into a factor for action-picking weights
#	Removed skill requirement and exp, along with action visibility
#	Re-wrote all the flavor text describing the actions from a third-person perspective

# note: I limited the number of lust actions for simplicity
#	all strip actions, one clothed-tease action per body part, and one exposed-tease action per body part


var file1 = "res://Scenes/EncountersMenuScene.gd"
# changes: really just editing the button order so the 'change interests' button is next to 'change fetishes'
# if this button were to be added dynamically it would go at the end of the list
# the menu for changing interests is really just the menu for changing fetishes, copied and pasted

var file2 = "res://Player/Player.gd"
# while Player inherits LustInterests from BaseCharacter, it does not explicitly save that data, so I fixed that
	
var file3 = "res://Game/Combat/AIStrategyBase.gd"
# massive changes
# attach a temporary LustCombatState instance to the AIStrategy (it is only needed during fights)
# initialize the LustCombatState in func OnBattleStart()
# Added some complex logic (maybe too complex) to decide if the npc will use physical attacks or lust attacks, see func shouldLustCombat()
# Added function to get the list of possible lust actions, then apply weights based on expected damage and overall lust levels, see func getLustAttacks()
# Added function to calc expected lust damage, based on the formula used in FightScene.gd but with randomness removed, see func calcTeaseDamageLikePlayer()
# Edited func getNextAction(), so it makes use of the previous new functions when picking the next move


var file4 = "res://Scenes/FightScene.gd"
# the npc turn only handles attack and struggle options, so I copied the code from the player's turn that handles lust actions
# see func aiTurn()
# restructured player turn order for the 'dodge' state, now you have the option of defocusing after picking your move


