extends SlaveActivityBase

var petWants = ""
var petLastWant = ""
var petPossibleWants = [
	["shower", 1.0],
	["food", 1.0],
	#["play", 1.0],
	#["train", 1.0],
	#["pee", 0.5],
]

func getNeedText():
	if(petWants == "shower"):
		return "Your pet wants to be washed (showers)"
	if(petWants == "food"):
		return "Your pet is hungry (canteen)"
	if(petWants == "play"):
		return "Your pet wants to play (yard area)"
	if(petWants == "train"):
		return "Your pet wants to be trained (yard area)"
	if(petWants == "pee"):
		return "Your pet needs to pee (showers/yard)"
	return "Your pet doesn't want anything currently"

func generateNextWant():
	petWants = RNG.pickWeightedPairs(petPossibleWants)
	while(petWants == petLastWant):
		petWants = RNG.pickWeightedPairs(petPossibleWants)

func generateNextWantIfNeeded(chanceToGenerate = 20):
	if(petWants != ""):
		return
	if(RNG.chance(chanceToGenerate)):
		generateNextWant()

func satisfyWant(theWant):
	if(theWant == petWants):
		GM.main.addMessage("Pet's want is satisfied!")
		petLastWant = petWants
		petWants = ""

func _init():
	id = "Walkies"
	
func getVisibleName():
	return "On walkies"

func onStart(_args = []):
	pass

func onNewDay():
	pass

func preventsStatsDecay():
	return false

func preventsNormalInteractions():
	return true

func getActivityText():
	return "You shouldn't see this!"

func hoursPassed(_howMuch):
	return

func getCustomInteractAnimInfo():
	return [StageScene.Solo, "stand", {pc="pc"}]

func saveData():
	var data = .saveData()
	
	data["petWants"] = petWants
	data["petLastWant"] = petLastWant
	
	return data

func loadData(_data):
	.loadData(_data)
	
	petWants = SAVE.loadVar(_data, "petWants", "")
	petLastWant = SAVE.loadVar(_data, "petLastWant", "")
