extends SlaveActivityBase

var petWants = ""
var petLastWant = ""
var petPossibleWants = [
	["shower", 1.0],
	["food", 1.0],
	["play", 1.0],
	#["train", 1.0],
	["pee", 0.3],
]
var wantCooldown = 3

func getNeedText():
	if(petWants == "shower"):
		return "Your pet wants to be [b]washed[/b] (showers)"
	if(petWants == "food"):
		return "Your pet is [b]hungry[/b] (canteen)"
	if(petWants == "play"):
		return "Your pet wants to [b]play[/b] (yard area)"
	if(petWants == "train"):
		return "Your pet wants to be [b]trained[/b] (yard area)"
	if(petWants == "pee"):
		return "Your pet needs to [b]pee[/b] (showers/yard)"
	return "Your pet doesn't want anything currently. Walk around until a new need arises."

func generateNextWant():
	petWants = RNG.pickWeightedPairs(petPossibleWants)
	while(petWants == petLastWant):
		petWants = RNG.pickWeightedPairs(petPossibleWants)

func generateNextWantIfNeeded(chanceToGenerate = 20):
	if(petWants != ""):
		return
	if(wantCooldown > 0):
		wantCooldown -= 1
		return
	if(RNG.chance(chanceToGenerate)):
		generateNextWant()
		wantCooldown = 5

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
