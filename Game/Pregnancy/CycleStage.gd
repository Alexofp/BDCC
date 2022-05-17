extends Object
class_name CycleStage

enum {
	Menstruation,
	FollicularPhase,
	Ovulation,
	LutealPhase,
}

static func getVisibleName(state):
	if(state == Menstruation):
		return "Menstruation"
	if(state == FollicularPhase):
		return "Follicular phase"
	if(state == Ovulation):
		return "Ovulation"
	if(state == LutealPhase):
		return "Luteal Phase"
	
	return "error"

static func getVisibleActionName(state):
	if(state == Menstruation):
		return "Menstruating"
	if(state == FollicularPhase):
		return "Follicular phase"
	if(state == Ovulation):
		return "Ovulating"
	if(state == LutealPhase):
		return "Luteal Phase"
	
	return "error"
