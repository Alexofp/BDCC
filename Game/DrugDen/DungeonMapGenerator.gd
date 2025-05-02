extends Reference
class_name DungeonMapGenerator

var map:Dictionary = {} # Vector2 = {e=true,w=true,s=false,n=false}
var deadends:Array = []
var startPos:Vector2
var endPos:Vector2

var mainPathLen:int
var amountOfDeadends:int
var deadendMinLen:int
var deadendMaxLen:int
var chanceConnect:float

const DIR_N = 0
const DIR_S = 1
const DIR_E = 2
const DIR_W = 3
const DIRS:Array = [DIR_N, DIR_S, DIR_E, DIR_W]


func generate(theSettings:Dictionary):
	mainPathLen = theSettings["mainPathLen"] if theSettings.has("mainPathLen") else 10
	amountOfDeadends = theSettings["amountOfDeadends"] if theSettings.has("amountOfDeadends") else 2
	deadendMinLen = theSettings["deadendMinLen"] if theSettings.has("deadendMinLen") else 1
	deadendMaxLen = theSettings["deadendMaxLen"] if theSettings.has("deadendMaxLen") else 3
	chanceConnect = theSettings["chanceConnect"] if theSettings.has("chanceConnect") else 20.0
	
	map.clear()
	deadends.clear()
	startPos = Vector2()
	endPos = Vector2()
	
	
	startPos = Vector2(0, 0)
	
	# Generating main path
	while(true):
		var thePath:Array = generateStrand(startPos, mainPathLen, true)
		if(thePath.empty()):
			map.clear()
		else:
			endPos = thePath.back()
			break
	
	# Generating deadend strands
	for _i in range(amountOfDeadends):
		var deadEndStartPos:Vector2 = getRandomFreeCell(true)
		if(deadEndStartPos == Vector2()):
			continue
		
		var extraPath:Array = generateStrand(deadEndStartPos, RNG.randi_range(deadendMinLen, deadendMaxLen), false)
		if(extraPath.size() > 1):
			deadends.append(extraPath.back())
	
	# Connecting some cells
	for pos in map:
		if(isCellImportant(pos)):
			continue
		var dirsCanConnect:Array = getDirsCanNotGoButCell(pos, true)
		for theDir in dirsCanConnect:
			var newPos:Vector2 = applyDir(pos, theDir)
			
			if(RNG.chance(chanceConnect)):
				connectCells(pos, newPos)
		
func findRandomSpots(amount:int, blacklist:Array = []) -> Array:
	if(amount <= 0):
		return []
	var result:Array = []
	
	var allCells:Array = map.keys()
	allCells.shuffle()
	for thePos in allCells:
		if(isCellImportant(thePos)):
			continue
		if(thePos in blacklist):
			continue
		result.append(thePos)
		if(result.size() >= amount):
			return result
	return result

func getRandomFreeCell(canStartStrand:bool = false) -> Vector2:
	var allCells:Array = map.keys()
	allCells.shuffle()
	
	for thePos in allCells:
		if(isCellImportant(thePos)):
			continue
		if(canStartStrand):
			if(getDirsNoCell(thePos).empty()):
				return Vector2()
		return thePos
	return Vector2()
	
func generateStrand(thePos:Vector2, strandLen:int, emptyOnFail:bool) -> Array:
	var result:Array = []
	
	if(!hasCell(thePos)):
		addCell(thePos)
	
	result.append(thePos)
	var lastDir:int = RNG.pick(DIRS)
	
	while(result.size() < strandLen+1):
		var possibleDirs:Array = getDirsNoCell(thePos)
		
		if(possibleDirs.empty()):
			if(emptyOnFail):
				return [] # We failed to generate a strand with the required length
			return result
		
		var selectedDir:int = possibleDirs[0]
		if((lastDir in possibleDirs) && RNG.chance(25)):
			selectedDir = lastDir
		lastDir = selectedDir
		
		var newPos:Vector2 = applyDir(thePos, selectedDir)
		addCell(newPos)
		connectCells(thePos, newPos)
		result.append(newPos)
		thePos = newPos
	
	return result

func hasCell(thePos:Vector2) -> bool:
	return map.has(thePos)

func canGo(thePos:Vector2, theDir:int) -> bool:
	if(!hasCell(thePos)):
		return false
	var theCell:Dictionary = map[thePos]
	
	if(theDir == DIR_N && theCell.has("canN") && theCell["canN"]):
		return true
	if(theDir == DIR_S && theCell.has("canS") && theCell["canS"]):
		return true
	if(theDir == DIR_E && theCell.has("canE") && theCell["canE"]):
		return true
	if(theDir == DIR_W && theCell.has("canW") && theCell["canW"]):
		return true
	
	return false

func getDirs() -> Array:
	var theDirs:Array = [DIR_N, DIR_S, DIR_E, DIR_W]
	theDirs.shuffle()
	return theDirs

func getDirsCanGo(thePos:Vector2) -> Array:
	var result:Array = []
	for dir in getDirs():
		if(canGo(thePos, dir)):
			result.append(dir)
	return result

func isCellImportant(thePos:Vector2) -> bool:
	if(thePos == startPos || thePos == endPos):
		return true
	if(thePos in deadends):
		return true
	
	return false

func getDirsCanNotGoButCell(thePos:Vector2, noImportantCells:bool = false) -> Array:
	var result:Array = []
	for dir in DIRS:
		if(!canGo(thePos, dir) && hasCell(applyDir(thePos, dir))):
			if(noImportantCells):
				var newPos:Vector2 = applyDir(thePos, dir)
				if(isCellImportant(newPos)):
					continue
			result.append(dir)
	return result

func getDirsNoCell(thePos:Vector2) -> Array:
	var result:Array = []
	for dir in getDirs():
		if(!hasCell(applyDir(thePos, dir))):
			result.append(dir)
	return result

func applyDir(thePos:Vector2, theDir:int) -> Vector2:
	if(theDir == DIR_N):
		thePos.y -= 1
	if(theDir == DIR_S):
		thePos.y += 1
	if(theDir == DIR_W):
		thePos.x -= 1
	if(theDir == DIR_E):
		thePos.x += 1
	return thePos

func addCell(thePos:Vector2):
	assert(!hasCell(thePos))
	if(hasCell(thePos)):
		return
	map[thePos] = {}

func connectCells(cell1:Vector2, cell2:Vector2):
	if(!map.has(cell1) || !map.has(cell2)):
		return
	for theDir in DIRS:
		if(applyDir(cell1, theDir) == cell2):
			var cell1Info:Dictionary = map[cell1]
			var cell2Info:Dictionary = map[cell2]
			
			cell1Info[dirToCan(theDir)] = true
			cell2Info[dirToCan(opposite(theDir))] = true
			return
	assert(false)

func opposite(theDir:int) -> int:
	if(theDir == DIR_N):
		return DIR_S
	if(theDir == DIR_S):
		return DIR_N
	if(theDir == DIR_E):
		return DIR_W
	if(theDir == DIR_W):
		return DIR_E
	assert(false)
	return DIR_N

func dirToCan(theDir:int) -> String:
	if(theDir == DIR_N):
		return "canN"
	if(theDir == DIR_S):
		return "canS"
	if(theDir == DIR_W):
		return "canW"
	if(theDir == DIR_E):
		return "canE"
	assert(false)
	return "canN"
