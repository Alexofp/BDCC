extends MyProfilerBase
class_name MyProfiler

var stack:Array = []
var timeStack:Array = []
var savedLines:Array = []

func start(_mark:String):
	stack.append(_mark)
	timeStack.append(OS.get_ticks_usec())

func finish(_mark:String):
	var end := OS.get_ticks_usec()
	assert(stack.back() == _mark)
	stack.pop_back()
	var theStart:int = timeStack.pop_back()
	
	var workTimeMS:float = (end-theStart)/1000.0
	var workTimeSec:float = workTimeMS/1000.0
	var marks:String = "-".repeat(stack.size())
	savedLines.append(marks+_mark+": "+str(Util.roundF(workTimeMS, 1))+"ms "+str(Util.roundF(workTimeSec, 4))+"sec")
	if(stack.empty()):
		Log.print(" ==== PROFILER ====")
		for _i in range(savedLines.size()):
			var _irev:int = savedLines.size() - _i - 1
			Log.print(savedLines[_irev])
		savedLines.clear()
		Log.print(" ==== PROFILER END ====")
