extends Object
class_name FightClubRank

const FuckMeat = "FuckMeat"
const FailedHero = "FailedHero"
const PlayToy = "PlayToy"
const AttentionWhore = "AttentionWhore"
const GrandChampion = "GrandChampion"

static func getVisibleName(rank):
	if(rank == FuckMeat):
		return "Fuck Meat"
	if(rank == FailedHero):
		return "Failed Hero"
	if(rank == PlayToy):
		return "Play Toy"
	if(rank == AttentionWhore):
		return "Attention Whore"
	if(rank == GrandChampion):
		return "Grand Champion"
	
	return "error:BADRANK"

static func getAll():
	return [GrandChampion, AttentionWhore, PlayToy, FailedHero, FuckMeat]

static func getOrder(rank):
	if(rank == GrandChampion):
		return 1
	if(rank == AttentionWhore):
		return 2
	if(rank == PlayToy):
		return 3
	if(rank == FailedHero):
		return 4
	if(rank == FuckMeat):
		return 5
	
	return 99
