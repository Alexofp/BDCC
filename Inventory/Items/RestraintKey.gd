extends ItemBase


func _init():
	id = "restraintkey"

func getVisibleName():
	return "Restraint key"
	
func getDescription():
	return "An universal one-time use key that can unlock any piece of bondage gear. You feel like you should keep some of these just in case."

func getPrice():
	return 15

func getSellPrice():
	return 2

func canSell():
	return true

func canCombine():
	return true

func getTags():
	return [
		ItemTag.SoldByTheAnnouncer,
		ItemTag.Illegal,
		]

func getInventoryImage():
	return "res://Images/Items/bdsm/key.png"
