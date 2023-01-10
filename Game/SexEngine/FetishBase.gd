extends Reference
class_name FetishBase

var id = "error"

func getVisibleName():
	return "Error"

func getGoals(_sexEngine, _domFetishHolder, _dom, _sub):
	return []

func isPossibleFor(_character):
	return true

func getInitialInterest(_character):
	return FetishInterest.Likes
