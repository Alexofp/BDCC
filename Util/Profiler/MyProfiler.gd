extends MyProfilerBase
class_name MyProfiler

var stack:Array = []
var timeStack:Array = []
var savedLines:Array = []

func start(_mark:String):
	stack.append(_mark)
	timeStack.append(OS.get_ticks_usec())

func finish(_mark:String, _ignoreThreshold:float = -1.0):
	var end := OS.get_ticks_usec()
	assert(stack.back() == _mark)
	stack.pop_back()
	var theStart:int = timeStack.pop_back()
	
	var workTimeMS:float = (end-theStart)/1000.0
	if(workTimeMS < _ignoreThreshold && !stack.empty()):
		return
	var workTimeSec:float = workTimeMS/1000.0
	var marks:String = "-".repeat(stack.size())
	var theText:String = marks+_mark+": "+str(Util.roundF(workTimeMS, 1))+"ms "+str(Util.roundF(workTimeSec, 4))+"sec"
	if(workTimeMS > 100.0):
		theText = "[color=red]"+theText+"[/color]"
	savedLines.append(theText)
	if(stack.empty()):
		Log.print(" ==== PROFILER ====")
		for _i in range(savedLines.size()):
			var _irev:int = savedLines.size() - _i - 1
			Log.print(savedLines[_irev])
		savedLines.clear()
		Log.print(" ==== PROFILER END ====")
