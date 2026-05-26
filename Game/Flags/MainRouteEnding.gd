extends Object
class_name MainRouteEnding

const NoEnding := 0
const Generic := 1

const TaviNoEnding := 5
const TaviYesEnding := 6
const TaviKillEnding := 7

static func getName(_ending:int) -> String:
	if(_ending == NoEnding):
		return "No Ending"
	if(_ending == Generic):
		return "Generic Ending"

	if(_ending == TaviNoEnding):
		return "Tavi Route: 'No' Ending"
	if(_ending == TaviYesEnding):
		return "Tavi Route: 'Yes' Ending"
	if(_ending == TaviKillEnding):
		return "Tavi Route: 'Kill' Ending"
	
	return "Unknown:"+str(_ending)

static func getCurrentEnding() -> int:
	if(GM.main.getFlag("TaviModule.Ch7NoEnding", false)):
		return TaviNoEnding
	if(GM.main.getFlag("TaviModule.Ch7YesEnding", false)):
		return TaviYesEnding
	if(GM.main.getFlag("TaviModule.Ch7KillEnding", false)):
		return TaviKillEnding
	
	return NoEnding
