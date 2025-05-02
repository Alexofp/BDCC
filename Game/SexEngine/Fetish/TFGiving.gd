extends FetishBase

func _init():
	id = Fetish.TFGiving

func getVisibleName():
	return "TF giver"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	var possible = []
	
	#if(_domFetishHolder.getFetishValue(Fetish.DrugUse) >= 0.0):
	possible.append(SexGoal.UseTFDrug)
	
	return possible
