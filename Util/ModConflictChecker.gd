extends Reference

# Helps to find out which mod breaks which.
# Static part (launcher, before mods are loaded): looks inside the mod zips and finds
#   files that are shipped by more than one mod and base game files that mods replace.
# Runtime part (GlobalRegistry, after loading): IDs registered twice, scripts that failed to load,
#   bodyparts whose doll scene doesn't exist. Saved into RUNTIME_REPORT_PATH.

const RUNTIME_REPORT_PATH = "user://modConflictReport.txt"

const IGNORED_FILES = ["license", "license.txt", "license.md", "readme", "readme.txt", "readme.md", "changelog.md", "changelog.txt"]

# Returns {"res://path": [modName, ...]} for all enabled zip mods, in load order
static func buildFileIndex(modOrder:Array, includeDisabled:bool = false) -> Dictionary:
	var result:Dictionary = {}
	for modEntry in modOrder:
		if(modEntry["disabled"] && !includeDisabled):
			continue
		var modName:String = modEntry["name"] if modEntry.has("name") else str(modEntry["path"]).get_file()
		for filePath in getModFiles(modEntry["path"]):
			var resPath:String = "res://"+filePath
			if(!result.has(resPath)):
				result[resPath] = []
			result[resPath].append(modName)
	return result

static func getModFiles(modPath:String) -> Array:
	var result:Array = []
	if(modPath.get_file() == "BDCC.pck" || modPath.get_extension() != "zip"):
		return result
	var gdunzip = GDUnzip.new()
	if(!gdunzip.load(modPath) || gdunzip.files == null):
		return result
	var modJson:String = modPath.get_file().get_basename()+".json"
	for filePath in gdunzip.files:
		if(filePath.ends_with("/") || filePath == modJson):
			continue
		if(filePath.get_file().to_lower() in IGNORED_FILES):
			continue
		result.append(filePath)
	return result

static func isDollRelated(resPath:String) -> bool:
	return resPath.begins_with("res://Player/Player3D/") || resPath.begins_with("res://Player/Bodyparts/")

# Mod names and paths can contain [ which would break the bbcode
static func escapeBB(theText) -> String:
	return str(theText).replace("[", "[lb]")

static func baseFileExists(resPath:String) -> bool:
	if(ResourceLoader.exists(resPath)):
		return true
	return File.new().file_exists(resPath)

# Runs before mods are loaded (in the launcher). Returns bbcode
static func makeStaticReport(modOrder:Array) -> String:
	var text:String = ""
	var unreadable:Array = []
	var enabledCount:int = 0
	for modEntry in modOrder:
		if(modEntry["disabled"] || str(modEntry["path"]).get_file() == "BDCC.pck"):
			continue
		enabledCount += 1
		if(str(modEntry["path"]).get_extension() != "zip"):
			unreadable.append(escapeBB(modEntry["name"]))

	var fileIndex:Dictionary = buildFileIndex(modOrder)
	var sortedPaths:Array = fileIndex.keys()
	sortedPaths.sort()

	# After the mods are loaded (main menu) their files are in res:// too, so we can't tell them apart from the base game files
	var canCheckBaseFiles:bool = !(GlobalRegistry.isInitialized && !GlobalRegistry.getLoadedMods().empty())
	var conflicts:Array = []
	var baseOverrides:Array = []
	for resPath in sortedPaths:
		var owners:Array = fileIndex[resPath]
		if(owners.size() > 1):
			conflicts.append(resPath)
		elif(canCheckBaseFiles && baseFileExists(resPath)):
			baseOverrides.append(resPath)

	text += "[b]Checked "+str(enabledCount)+" enabled mods, "+str(fileIndex.size())+" files.[/b]\n\n"

	text += "[b]1. Files shipped by MORE THAN ONE mod[/b] (only the mod loaded last wins, the other mod is partially broken)\n"
	if(conflicts.empty()):
		text += "[color=green]None[/color]\n"
	for resPath in conflicts:
		var owners:Array = fileIndex[resPath]
		text += "[color=red]CONFLICT[/color]"+(" [color=yellow][DOLL][/color]" if isDollRelated(resPath) else "")+" "+escapeBB(resPath)+"\n"
		text += "    mods: "+escapeBB(PoolStringArray(owners).join(", "))+"  ->  used: [b]"+escapeBB(owners.back())+"[/b]\n"

	text += "\n[b]2. Base game files replaced by a mod[/b] (OK if the mod is made for this game version, otherwise a common cause of missing body parts)\n"
	if(!canCheckBaseFiles):
		text += "Mods are already loaded, this part only works in the launcher (Troubleshooting there).\n"
	elif(baseOverrides.empty()):
		text += "[color=green]None[/color]\n"
	for resPath in baseOverrides:
		text += "[color=yellow]REPLACES[/color]"+(" [color=yellow][DOLL][/color]" if isDollRelated(resPath) else "")+" "+escapeBB(resPath)+"  <-  "+escapeBB(fileIndex[resPath][0])+"\n"

	if(!unreadable.empty()):
		text += "\n[b]Can't look inside these (.pck) mods:[/b] "+PoolStringArray(unreadable).join(", ")+"\n"

	text += "\n[b]3. Last game start (IDs, broken scripts, missing doll parts)[/b]\n"
	var runtimeReport:String = Util.readFile(RUNTIME_REPORT_PATH)
	if(runtimeReport.empty()):
		text += "No report yet. Start the game with mods once, then check again.\n"
	else:
		text += escapeBB(addSourcesToRuntimeReport(runtimeReport, fileIndex))
	return text

# The runtime report only has paths (looking inside all zips on every start is slow), the mod names are added here
static func addSourcesToRuntimeReport(runtimeReport:String, fileIndex:Dictionary) -> String:
	var regex := RegEx.new()
	var _ok = regex.compile("^\\s*(ERROR |replaced:|by:).*(res://\\S+)$")
	var result:PoolStringArray = PoolStringArray()
	for line in runtimeReport.split("\n"):
		var theMatch = regex.search(line)
		if(theMatch != null):
			line += describeSource(theMatch.get_string(2), fileIndex)
		result.append(line)
	return result.join("\n")

# Runtime report. issues = [{type, kind, id, old, new, path, info}]
static func makeRuntimeReport(issues:Array) -> String:
	var text:String = "Game version: "+GlobalRegistry.getGameVersionString()+", time: "+Time.get_datetime_string_from_system(false, true)+"\n"
	text += "Loaded mods: "+str(GlobalRegistry.getLoadedMods())+"\n"
	if(issues.empty()):
		return text+"No problems found.\n"

	var broken:Array = []
	var missingDoll:Array = []
	var ids:Array = []
	for issue in issues:
		match(issue["type"]):
			"broken":
				broken.append(issue)
			"missingDoll":
				missingDoll.append(issue)
			"id":
				ids.append(issue)

	if(!broken.empty()):
		text += "\nSCRIPTS THAT FAILED TO LOAD (the thing is missing in game, check godot.log for the exact error):\n"
		for issue in broken:
			text += "  ERROR "+issue["kind"]+" "+issue["path"]+"\n"
	if(!missingDoll.empty()):
		text += "\nBODYPARTS WITH A MISSING DOLL SCENE (invisible on the doll):\n"
		for issue in missingDoll:
			text += "  ERROR bodypart '"+issue["id"]+"' "+issue["path"]+"\n"
			text += "        wants: "+issue["info"]+"  (this file exists neither in the game nor in a mod)\n"
	if(!ids.empty()):
		text += "\nSAME ID REGISTERED TWICE (the second one replaces the first):\n"
		for issue in ids:
			text += "  "+issue["kind"]+" '"+issue["id"]+"'\n"
			text += "     replaced: "+issue["old"]+"\n"
			text += "     by:       "+issue["new"]+"\n"
	return text

static func describeSource(resPath:String, fileIndex:Dictionary) -> String:
	if(fileIndex.has(resPath)):
		return "  (mod: "+PoolStringArray(fileIndex[resPath]).join(", ")+")"
	return "  (base game)"
