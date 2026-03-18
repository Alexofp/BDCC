extends ItemBase

func _init():
	id = "TentNeuroLink"

func getVisibleName():
	return "Neuro-Link injector"
	
func getDescription():
	var theText:String = "A single-use injector that holds a small chip that, if injected, will let you control an organic form that it was designed for."

	if(GM.main.getFlag("ElizaModule.tent_neurolink", false)):
		theText += "\n\n[i]Somehow you managed to keep an extra injector. It is completely useless now. But you should probably still keep it.[/i]"

	return theText

func getA():
	return "a"

func getSellPrice():
	return 67

func canSell():
	return true

func canCombine():
	return true

func getItemCategory():
	return ItemCategory.Generic

func getInventoryImage():
	return "res://Images/Items/generic/chip.png"
